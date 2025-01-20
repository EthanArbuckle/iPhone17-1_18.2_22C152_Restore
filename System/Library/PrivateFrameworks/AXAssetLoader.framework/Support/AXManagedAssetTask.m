@interface AXManagedAssetTask
+ (AXManagedAssetTask)taskWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6;
- (AXAssetController)assetController;
- (AXAssetPolicy)policy;
- (AXManagedAssetTask)initWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6;
- (AXManagedAssetTaskContext)context;
- (AXManagedAssetTaskRestorationState)restorationState;
- (BOOL)_deferIfNeeded;
- (BOOL)finished;
- (NSString)description;
- (NSString)name;
- (id)_restorationExitStatusForResult:(unint64_t)a3;
- (id)taskBlock;
- (void)_completeWithResult:(unint64_t)a3;
- (void)setAssetController:(id)a3;
- (void)setContext:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setRestorationState:(id)a3;
- (void)setTaskBlock:(id)a3;
@end

@implementation AXManagedAssetTask

+ (AXManagedAssetTask)taskWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithName:v13 policy:v12 context:v11 block:v10];

  return (AXManagedAssetTask *)v14;
}

- (AXManagedAssetTask)initWithName:(id)a3 policy:(id)a4 context:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AXManagedAssetTask;
  id v14 = [(AXManagedAssetTask *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(AXManagedAssetTask *)v14 setTaskBlock:v13];
    [(AXManagedAssetTask *)v15 setPolicy:v11];
    [(AXManagedAssetTask *)v15 setName:v10];
    [(AXManagedAssetTask *)v15 setContext:v12];
  }

  return v15;
}

- (NSString)description
{
  v3 = [(AXManagedAssetTask *)self context];
  id v4 = [v3 environment];
  v5 = @"XPCActivity";
  if (!v4) {
    v5 = @"XPCClientReq";
  }
  v6 = v5;

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [(AXManagedAssetTask *)self name];
  id v10 = [(AXManagedAssetTask *)self policy];
  id v11 = [v10 assetType];
  unsigned int v12 = [(AXManagedAssetTask *)self finished];
  CFStringRef v13 = @"Active";
  if (v12) {
    CFStringRef v13 = @"Finished";
  }
  id v14 = +[NSString stringWithFormat:@"%@<%p> [%@:%@:%@ - Status:%@]", v8, self, v6, v9, v11, v13];

  return (NSString *)v14;
}

- (AXAssetController)assetController
{
  assetController = self->_assetController;
  if (!assetController)
  {
    id v4 = [(AXManagedAssetTask *)self policy];
    v5 = +[AXAssetController assetControllerWithPolicy:v4 qosClass:33 shouldRefreshForAssetInstallNotifications:0];
    v6 = self->_assetController;
    self->_assetController = v5;

    [(AXAssetController *)self->_assetController setUserInitiated:1];
    [(AXAssetController *)self->_assetController addObserver:self];
    assetController = self->_assetController;
  }
  return assetController;
}

- (void)_completeWithResult:(unint64_t)a3
{
  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Deferred";
    if (a3 == 1) {
      CFStringRef v6 = @"Failed";
    }
    if (!a3) {
      CFStringRef v6 = @"Success";
    }
    int v15 = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    CFStringRef v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will complete task [%@] with result : %@", (uint8_t *)&v15, 0x16u);
  }

  if ([(AXManagedAssetTask *)self finished])
  {
    v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100014B10((uint64_t)self, v7);
    }
  }
  else
  {
    v8 = [(AXManagedAssetTask *)self assetController];
    [v8 removeObserver:self];

    [(AXManagedAssetTask *)self setAssetController:0];
    v9 = [(AXManagedAssetTask *)self restorationState];
    if (a3 > 1)
    {
      id v10 = [(AXManagedAssetTask *)self restorationState];
      id v11 = [v10 phase];
      unsigned int v12 = [(AXManagedAssetTask *)self _restorationExitStatusForResult:a3];
      CFStringRef v13 = +[AXAssetMetadataStore store];
      [v9 updatePhase:v11 exitStatus:v12 saveToStore:v13];
    }
    else
    {
      id v10 = [(AXManagedAssetTask *)self _restorationExitStatusForResult:a3];
      id v11 = +[AXAssetMetadataStore store];
      [v9 updatePhase:@"Idle" exitStatus:v10 saveToStore:v11];
    }

    id v14 = [(AXManagedAssetTask *)self context];
    [v14 finishWithResult:a3];

    [(AXManagedAssetTask *)self setFinished:1];
  }
}

- (id)_restorationExitStatusForResult:(unint64_t)a3
{
  CFStringRef v3 = @"Success";
  if (a3 == 1) {
    CFStringRef v3 = @"Failed";
  }
  if (a3 == 2) {
    return @"Deferred";
  }
  else {
    return (id)v3;
  }
}

- (BOOL)_deferIfNeeded
{
  if ([(AXManagedAssetTask *)self finished])
  {
    CFStringRef v3 = AXLogAssetDaemon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ - Checking _deferIfNeeded: Already finixhed, returning true ", (uint8_t *)&v9, 0xCu);
    }

    return 1;
  }
  id v4 = [(AXManagedAssetTask *)self context];
  unsigned int v5 = [v4 shouldDefer];

  CFStringRef v6 = AXLogAssetDaemon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ - Checking _deferIfNeeded: Returning true", (uint8_t *)&v9, 0xCu);
    }

    [(AXManagedAssetTask *)self _completeWithResult:2];
    return 1;
  }
  if (v7)
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ - Checking _deferIfNeeded: Returning false", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)taskBlock
{
  return self->_taskBlock;
}

- (void)setTaskBlock:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (AXAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void)setAssetController:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (AXManagedAssetTaskRestorationState)restorationState
{
  return self->_restorationState;
}

- (void)setRestorationState:(id)a3
{
}

- (AXManagedAssetTaskContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_restorationState, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_taskBlock, 0);
}

@end