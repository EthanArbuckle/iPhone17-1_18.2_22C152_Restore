@interface MCMCommandSetTestLock
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)enable;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetTestLock)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMXPCMessage)message;
- (unint64_t)requestedLocks;
- (void)execute;
@end

@implementation MCMCommandSetTestLock

- (void).cxx_destruct
{
  p_message = &self->_message;

  objc_storeStrong((id *)p_message, 0);
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (BOOL)enable
{
  return self->_enable;
}

- (unint64_t)requestedLocks
{
  return self->_requestedLocks;
}

- (void)execute
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  id v4 = containermanager_copy_global_configuration();
  int v5 = [v4 isInternalImage];

  if (!v5)
  {
    v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v28) = 0;
      _os_log_fault_impl(&dword_1D7739000, v15, OS_LOG_TYPE_FAULT, "Unsupported call to set lock!", (uint8_t *)&v28, 2u);
    }

    v10 = 0;
    goto LABEL_13;
  }
  id v6 = containermanager_copy_global_configuration();
  if ([v6 runmode] == 2) {
    goto LABEL_5;
  }
  id v7 = containermanager_copy_global_configuration();
  if ([v7 runmode] == 3)
  {

LABEL_5:
    goto LABEL_6;
  }
  id v20 = containermanager_copy_global_configuration();
  int v21 = [v20 runmode];

  if (v21 != 4)
  {
    v10 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v8 = [(MCMCommandSetTestLock *)self message];
  v9 = [(MCMCommand *)self context];
  v10 = +[MCMCommand relayToPrivilegedDaemonMessage:v8 context:v9];

LABEL_7:
  unint64_t v11 = [(MCMCommandSetTestLock *)self requestedLocks];
  BOOL v12 = [(MCMCommandSetTestLock *)self enable];
  if (v11 == 15 && !v12)
  {
    v13 = +[MCMTestLocks sharedInstance];
    [v13 setEnabled:0];

    v14 = 0;
    execute_gLocksEnabled = 0;
    goto LABEL_14;
  }
  if (v11 < 0xF)
  {
    uint64_t v22 = (1 << v11);
    uint64_t v23 = execute_gLocksEnabled & v22;
    if (v12)
    {
      if (!v23)
      {
        execute_gLocksEnabled |= v22;
        v24 = +[MCMTestLocks sharedInstance];
        [v24 setEnabled:1];

        v25 = +[MCMTestLocks sharedInstance];
        [v25 acquireLock:v11];
      }
    }
    else if (v23)
    {
      if (v11 < 2) {
        v22 |= 3uLL;
      }
      execute_gLocksEnabled &= ~v22;
      v26 = +[MCMTestLocks sharedInstance];
      [v26 releaseLock:v11];

      if (!execute_gLocksEnabled)
      {
        v27 = +[MCMTestLocks sharedInstance];
        [v27 setEnabled:0];
      }
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v14 = [[MCMError alloc] initWithErrorType:38 category:3];
LABEL_14:
  v16 = container_log_handle_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    v29 = v14;
    _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Set test locks; error = %@", (uint8_t *)&v28, 0xCu);
  }

  v17 = [[MCMResultBase alloc] initWithError:v14];
  if (!v14 && v10)
  {
    v18 = v10;

    v17 = v18;
  }
  v19 = [(MCMCommand *)self resultPromise];
  [v19 completeWithResult:v17];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToTest];

  return v4;
}

- (MCMCommandSetTestLock)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMCommandSetTestLock;
  v10 = [(MCMCommand *)&v12 initWithMessage:v9 context:a4 reply:a5];
  if (v10)
  {
    v10->_requestedLocks = [v9 requestedLocks];
    v10->_enable = [v9 enable];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 31;
}

@end