@interface LKLoginSupport
+ (BOOL)hasCleanUser;
+ (BOOL)isNewUserAbleToLogin;
+ (id)findLeastRecentlyUsedCleanUser;
- (LKLoginSupport)init;
- (NSOperationQueue)completionQueue;
- (NSOperationQueue)listenerQueue;
- (id)_errorForNotificationType:(unint64_t)a3;
- (id)_notificationForNotificationType:(unint64_t)a3;
- (void)_runWhenDarwinNotificationPosted:(unint64_t)a3 timeOutPeriod:(double)a4 block:(id)a5;
- (void)_runWithTimeOutPeriod:(double)a3 notificationType:(unint64_t)a4 completionBlock:(id)a5;
- (void)_timeOutAfterTimePeriod:(double)a3 withError:(id)a4 block:(id)a5;
- (void)runWithTimeOutPeriod:(double)a3 loggedInBlock:(id)a4;
- (void)runWithTimeOutPeriod:(double)a3 readyToLoginBlock:(id)a4;
- (void)setCompletionQueue:(id)a3;
- (void)setListenerQueue:(id)a3;
@end

@implementation LKLoginSupport

+ (id)findLeastRecentlyUsedCleanUser
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(MEMORY[0x263F841B0], "sharedManager", 0);
  v4 = [v3 allUsers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 hasDataToSync] & 1) == 0) {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v2 count])
  {
    [v2 sortUsingComparator:&__block_literal_global_3];
    v10 = [v2 firstObject];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __48__LKLoginSupport_findLeastRecentlyUsedCleanUser__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 lastLoginDate];
  uint64_t v6 = [v4 lastLoginDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (BOOL)hasCleanUser
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F841B0], "sharedManager", 0);
  v3 = [v2 allUsers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v8 + 1) + 8 * i) hasDataToSync])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)isNewUserAbleToLogin
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  v3 = [v2 allUsers];
  unint64_t v4 = [v3 count];

  if (v4 < 0x20) {
    return 1;
  }
  return +[LKLoginSupport hasCleanUser];
}

- (LKLoginSupport)init
{
  v8.receiver = self;
  v8.super_class = (Class)LKLoginSupport;
  v2 = [(LKLoginSupport *)&v8 init];
  if (v2)
  {
    LKRegisterLoginKitLogging();
    uint64_t v3 = objc_opt_new();
    listenerQueue = v2->_listenerQueue;
    v2->_listenerQueue = (NSOperationQueue *)v3;

    [(NSOperationQueue *)v2->_listenerQueue setMaxConcurrentOperationCount:1];
    uint64_t v5 = objc_opt_new();
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (NSOperationQueue *)v5;

    [(NSOperationQueue *)v2->_completionQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (id)_errorForNotificationType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 25;
  }
  else
  {
    uint64_t v5 = 26;
  }
  +[LKError errorWithCode:](LKError, "errorWithCode:", v5, v3);
  self = (LKLoginSupport *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return self;
}

- (id)_notificationForNotificationType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = LKLoggedInNotificationName;
  }
  else
  {
    uint64_t v4 = LKReadyToLoginNotificationName;
  }
  self = *v4;
LABEL_6:
  return self;
}

- (void)_timeOutAfterTimePeriod:(double)a3 withError:(id)a4 block:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__LKLoginSupport__timeOutAfterTimePeriod_withError_block___block_invoke;
  block[3] = &unk_2645FC4C8;
  double v15 = a3;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
}

uint64_t __58__LKLoginSupport__timeOutAfterTimePeriod_withError_block___block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[6];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2221A9000, v2, OS_LOG_TYPE_DEFAULT, "Notification hasn't posted in the given period (%f seconds). Timing out.", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[4]);
  }
  return result;
}

- (void)_runWhenDarwinNotificationPosted:(unint64_t)a3 timeOutPeriod:(double)a4 block:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  dispatch_time_t v9 = (void *)LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = [(LKLoginSupport *)self _notificationForNotificationType:a3];
    *(_DWORD *)buf = 138412546;
    id v28 = v11;
    __int16 v29 = 2048;
    double v30 = a4;
    _os_log_impl(&dword_2221A9000, v10, OS_LOG_TYPE_DEFAULT, "Waiting for notification (%@) to be posted for %f seconds", buf, 0x16u);
  }
  long long v12 = [(LKLoginSupport *)self _errorForNotificationType:a3];
  [(LKLoginSupport *)self _timeOutAfterTimePeriod:v12 withError:v8 block:a4];

  id v13 = [(LKLoginSupport *)self _notificationForNotificationType:a3];
  id v14 = (const char *)[v13 UTF8String];
  double v15 = dispatch_get_global_queue(0, 0);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __71__LKLoginSupport__runWhenDarwinNotificationPosted_timeOutPeriod_block___block_invoke;
  v24 = &unk_2645FC408;
  id v16 = v13;
  id v25 = v16;
  id v17 = v8;
  id v26 = v17;
  uint32_t v18 = notify_register_dispatch(v14, (int *)&_runWhenDarwinNotificationPosted_timeOutPeriod_block__notifyToken, v15, &v21);

  if (v18)
  {
    v19 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v16;
      __int16 v29 = 1026;
      LODWORD(v30) = v18;
      _os_log_impl(&dword_2221A9000, v19, OS_LOG_TYPE_DEFAULT, "Could not register for %@ notification error %{public}d", buf, 0x12u);
    }
    if (v17)
    {
      v20 = +[LKError errorWithCode:](LKError, "errorWithCode:", 27, v21, v22, v23, v24, v25);
      (*((void (**)(id, void *))v17 + 2))(v17, v20);
    }
  }
}

uint64_t __71__LKLoginSupport__runWhenDarwinNotificationPosted_timeOutPeriod_block___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2221A9000, v2, OS_LOG_TYPE_DEFAULT, "Notified with %@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_runWithTimeOutPeriod:(double)a3 notificationType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  dispatch_time_t v9 = [LKNotificationListenerOperation alloc];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke;
  v23[3] = &unk_2645FC518;
  v23[4] = self;
  id v10 = v8;
  id v24 = v10;
  id v11 = [(LKNotificationListenerOperation *)v9 initWithNotificationType:a4 timeOutPeriod:v23 completionBlock:a3];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_3;
  v20[3] = &unk_2645FC568;
  v20[4] = self;
  uint64_t v21 = v11;
  id v22 = v10;
  id v12 = v10;
  id v13 = v11;
  id v14 = (void *)MEMORY[0x223C96140](v20);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_5;
  v17[3] = &unk_2645FC590;
  id v18 = v14;
  unint64_t v19 = a4;
  id v15 = v14;
  [(LKNotificationListenerOperation *)v13 setListenerStartedBlock:v17];
  id v16 = [(LKLoginSupport *)self listenerQueue];
  [v16 addOperation:v13];
}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) completionQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_2;
  v7[3] = &unk_2645FC4F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 addOperationWithBlock:v7];
}

uint64_t __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] completionQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_4;
  v6[3] = &unk_2645FC540;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  [v4 addOperationWithBlock:v6];
}

uint64_t __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_4(uint64_t result)
{
  if (!*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(result + 40);
    if (result)
    {
      uint64_t result = [(id)result isFinished];
      if ((result & 1) == 0)
      {
        [*(id *)(v1 + 40) cancel];
        uint64_t result = *(void *)(v1 + 48);
        if (result)
        {
          v2 = *(uint64_t (**)(void))(result + 16);
          return v2();
        }
      }
    }
  }
  return result;
}

void __73__LKLoginSupport__runWithTimeOutPeriod_notificationType_completionBlock___block_invoke_5(uint64_t a1)
{
  v2 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2221A9000, v2, OS_LOG_TYPE_DEFAULT, "Listener has started. Check with logind now", v6, 2u);
  }
  id v3 = +[LKLoginController sharedController];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 == 1)
  {
    [v3 isReadyToLogoutWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else if (!v5)
  {
    [v3 isReadyToLoginWithCompletionHandler:*(void *)(a1 + 32)];
  }
}

- (void)runWithTimeOutPeriod:(double)a3 loggedInBlock:(id)a4
{
}

- (void)runWithTimeOutPeriod:(double)a3 readyToLoginBlock:(id)a4
{
}

- (NSOperationQueue)listenerQueue
{
  return self->_listenerQueue;
}

- (void)setListenerQueue:(id)a3
{
}

- (NSOperationQueue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
}

@end