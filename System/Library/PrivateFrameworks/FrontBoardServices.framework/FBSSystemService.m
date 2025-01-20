@interface FBSSystemService
+ (id)clientCallbackQueue;
+ (id)sharedService;
- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4;
- (BOOL)isPasscodeLockedOrBlocked;
- (FBSSystemService)init;
- (FBSSystemService)initWithEndpoint:(id)a3;
- (id)badgeValueForBundleID:(id)a3;
- (id)processHandleForApplication:(id)a3;
- (id)systemApplicationBundleIdentifier;
- (int)pidForApplication:(id)a3;
- (unsigned)createClientPort;
- (void)dataResetWithRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6;
- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5;
- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7;
- (void)reboot;
- (void)sendActions:(id)a3 withResult:(id)a4;
- (void)setBadgeValue:(id)a3 forBundleID:(id)a4;
- (void)setKeyboardFocusApplicationPID:(int)a3 completion:(id)a4;
- (void)setKeyboardFocusApplicationPID:(int)a3 deferringToken:(id)a4 completion:(id)a5;
- (void)setKeyboardFocusApplicationWithBundleID:(id)a3 pid:(int)a4 completion:(id)a5;
- (void)shutdown;
- (void)shutdownWithOptions:(id)a3;
- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6;
- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6;
- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
@end

@implementation FBSSystemService

- (FBSSystemService)init
{
  return [(FBSSystemService *)self initWithEndpoint:0];
}

uint64_t __27__FBSSystemService_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkin];
}

- (FBSSystemService)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSSystemService;
  v5 = [(FBSSystemService *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[FBSSystemAppProxy checkoutProxyWithEndpoint:v4];
    systemAppProxy = v5->_systemAppProxy;
    v5->_systemAppProxy = (FBSSystemAppProxy *)v6;

    if (!v4)
    {
      uint64_t v8 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      defaultOpenApplicationService = v5->_defaultOpenApplicationService;
      v5->_defaultOpenApplicationService = (FBSOpenApplicationService *)v8;
    }
  }

  return v5;
}

- (id)systemApplicationBundleIdentifier
{
  return [(FBSSystemAppProxy *)self->_systemAppProxy systemApplicationBundleIdentifier];
}

- (int)pidForApplication:(id)a3
{
  if (!a3) {
    return -1;
  }
  v3 = (objc_class *)MEMORY[0x1E4F4E278];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v5 applicationInfoForApplication:v4];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4E258]];
    uint64_t v8 = v7;
    if (v7) {
      int v9 = [v7 intValue];
    }
    else {
      int v9 = -1;
    }
  }
  else
  {
    int v9 = -1;
  }
  [v5 invalidate];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOpenApplicationService, 0);

  objc_storeStrong((id *)&self->_systemAppProxy, 0);
}

- (void)dealloc
{
  v3 = self->_systemAppProxy;
  id v4 = +[FBSSystemService clientCallbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__FBSSystemService_dealloc__block_invoke;
  block[3] = &unk_1E58F4B00;
  uint64_t v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)FBSSystemService;
  [(FBSSystemService *)&v6 dealloc];
}

+ (id)clientCallbackQueue
{
  if (clientCallbackQueue_onceToken != -1) {
    dispatch_once(&clientCallbackQueue_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)clientCallbackQueue_queue;

  return v2;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedService___SharedService;

  return v2;
}

void __39__FBSSystemService_clientCallbackQueue__block_invoke()
{
}

uint64_t __33__FBSSystemService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(FBSSystemService);
  uint64_t v1 = sharedService___SharedService;
  sharedService___SharedService = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)isPasscodeLockedOrBlocked
{
  return [(FBSSystemAppProxy *)self->_systemAppProxy isPasscodeLockedOrBlocked];
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  defaultOpenApplicationService = self->_defaultOpenApplicationService;
  if (defaultOpenApplicationService) {
    return [(FBSOpenApplicationService *)defaultOpenApplicationService canOpenApplication:a3 reason:a4];
  }
  if (a4) {
    *a4 = 8;
  }
  return 0;
}

- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(FBSSystemService *)self openApplication:v10 options:v9 clientPort:[(FBSSystemService *)self createClientPort] withResult:v8];
}

- (void)sendActions:(id)a3 withResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = FBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 fbs_singleLineDescriptionOfBSActions];
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_19C680000, v8, OS_LOG_TYPE_DEFAULT, "[FBSSystemService] Sending action(s): %{public}@", buf, 0xCu);
  }
  id v10 = self;
  systemAppProxy = v10->_systemAppProxy;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__FBSSystemService_sendActions_withResult___block_invoke;
  v14[3] = &unk_1E58F63A8;
  v15 = v10;
  id v16 = v7;
  v12 = v10;
  id v13 = v7;
  [(FBSSystemAppProxy *)systemAppProxy sendActions:v6 withResult:v14];
}

uint64_t __43__FBSSystemService_sendActions_withResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = self;
  systemAppProxy = v13->_systemAppProxy;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__FBSSystemService_terminateApplication_forReason_andReport_withDescription_completion___block_invoke;
  v17[3] = &unk_1E58F63D0;
  v18 = v13;
  id v19 = v12;
  v15 = v13;
  id v16 = v12;
  [(FBSSystemAppProxy *)systemAppProxy terminateApplication:a3 forReason:a4 andReport:v8 withDescription:a6 completion:v17];
}

uint64_t __88__FBSSystemService_terminateApplication_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = self;
  systemAppProxy = v13->_systemAppProxy;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__FBSSystemService_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke;
  v17[3] = &unk_1E58F63D0;
  v18 = v13;
  id v19 = v12;
  v15 = v13;
  id v16 = v12;
  [(FBSSystemAppProxy *)systemAppProxy terminateApplicationGroup:a3 forReason:a4 andReport:v8 withDescription:a6 completion:v17];
}

uint64_t __93__FBSSystemService_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (a5)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clientPort == 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSystemService openApplication:options:clientPort:withResult:](a2, (uint64_t)self, (uint64_t)v18);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  v14 = v13;
  defaultOpenApplicationService = self->_defaultOpenApplicationService;
  if (defaultOpenApplicationService)
  {
    id v16 = +[FBSOpenApplicationOptions optionsWithDictionary:v12];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke;
    v21[3] = &unk_1E58F63F8;
    v17 = &v22;
    id v22 = v14;
    [(FBSOpenApplicationService *)defaultOpenApplicationService _openApplication:v11 withOptions:v16 clientHandle:0 completion:v21];
LABEL_6:

    goto LABEL_7;
  }
  if (v13)
  {
    id v16 = +[FBSSystemService clientCallbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke_2;
    block[3] = &unk_1E58F5040;
    v17 = &v20;
    id v20 = v14;
    dispatch_async(v16, block);
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = [v12 domain];
  int v5 = [v4 isEqualToString:@"FBSOpenApplicationServiceErrorDomain"];

  if (v5)
  {
    id v6 = [v12 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v7)
    {
      id v8 = v7;

      id v12 = v8;
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v12;
  if (v9)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v12);
    id v10 = v12;
  }

  return MEMORY[0x1F41817F8](v9, v10);
}

void __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  FBSOpenApplicationErrorCreate((void *)8, @"This system service instance does not support \"openApplication\"", a3, a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
}

- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v15 = a3;
  id v12 = a4;
  id v13 = a7;
  v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  if (v15) {
    [v14 setObject:v15 forKey:@"__PayloadURL"];
  }
  [(FBSSystemService *)self openApplication:v12 options:v14 clientPort:v8 withResult:v13];
}

- (unsigned)createClientPort
{
  return 0;
}

- (id)processHandleForApplication:(id)a3
{
  if (a3)
  {
    id v4 = -[FBSSystemAppProxy processHandleForBundleID:](self->_systemAppProxy, "processHandleForBundleID:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)badgeValueForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)getUISApplicationStateClass()) initWithBundleIdentifier:v3];

  int v5 = [v4 badgeValue];

  return v5;
}

- (void)setBadgeValue:(id)a3 forBundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)[objc_alloc((Class)getUISApplicationStateClass()) initWithBundleIdentifier:v5];

  [v7 setBadgeValue:v6];
}

- (void)dataResetWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)getDDRResetOptionsClass());
  [v7 setHideProgress:(((unint64_t)objc_msgSend(v5, "options") >> 1) & 1)];
  [v7 setEraseDataPlan:((objc_msgSend(v5, "options") & 1) != 0)];
  unint64_t v8 = [v5 mode] - 1;
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_19C722BE0[v8];
  }
  id v10 = objc_alloc((Class)getDDRResetRequestClass());
  id v11 = [v5 reason];
  id v12 = (void *)[v10 initWithMode:v9 options:v7 reason:v11];

  id v13 = [getDDRResetServiceClass() sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__FBSSystemService_dataResetWithRequest_completion___block_invoke;
  v15[3] = &unk_1E58F5878;
  id v16 = v6;
  id v14 = v6;
  [v13 resetWithRequest:v12 completion:v15];
}

uint64_t __52__FBSSystemService_dataResetWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

- (void)reboot
{
  id v3 = [[FBSShutdownOptions alloc] initWithReason:@"GenericReboot"];
  [(FBSShutdownOptions *)v3 setRebootType:1];
  [(FBSSystemService *)self shutdownWithOptions:v3];
}

- (void)shutdown
{
  id v3 = [[FBSShutdownOptions alloc] initWithReason:@"GenericShutdown"];
  [(FBSSystemService *)self shutdownWithOptions:v3];
}

- (void)shutdownWithOptions:(id)a3
{
}

- (void)setKeyboardFocusApplicationWithBundleID:(id)a3 pid:(int)a4 completion:(id)a5
{
}

- (void)setKeyboardFocusApplicationPID:(int)a3 deferringToken:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = self;
  systemAppProxy = v9->_systemAppProxy;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__FBSSystemService_setKeyboardFocusApplicationPID_deferringToken_completion___block_invoke;
  v13[3] = &unk_1E58F6420;
  id v14 = v9;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  [(FBSSystemAppProxy *)systemAppProxy setKeyboardFocusApplication:v6 deferringToken:a4 completion:v13];
}

uint64_t __77__FBSSystemService_setKeyboardFocusApplicationPID_deferringToken_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setKeyboardFocusApplicationPID:(int)a3 completion:(id)a4
{
}

- (void)openApplication:(uint64_t)a3 options:clientPort:withResult:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"FBSSystemService.m";
  __int16 v16 = 1024;
  int v17 = 186;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end