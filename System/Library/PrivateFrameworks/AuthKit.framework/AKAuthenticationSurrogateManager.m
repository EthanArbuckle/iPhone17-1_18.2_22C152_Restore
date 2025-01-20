@interface AKAuthenticationSurrogateManager
- (AKAuthenticationSurrogateManager)initWithDelegate:(id)a3;
- (AKSurrogateAuthenticationIDGenerator)surrogateIDGenerator;
- (BOOL)_isClientWaitingForSurrogateAuth:(id)a3;
- (BOOL)_launchAppleIDSettingsForContext:(id)a3 withCheckinID:(id)a4;
- (BOOL)hasRegisteredSurrogateForContext:(id)a3;
- (BOOL)isSurrogateAuthInProgressForClientBundleID:(id)a3;
- (BOOL)isWaitingForSettingsSurrogateAuth;
- (NSMutableDictionary)inProgressSurrogates;
- (OS_dispatch_queue)surrogateQueue;
- (id)_fetchSurrogateForClientBundleID:(id)a3;
- (id)_fetchSurrogateWithRegistrationID:(id)a3;
- (void)_clearSurrogate:(id)a3;
- (void)_handleError:(id)a3 logMessage:(id)a4 withUIWorkBlock:(id)a5;
- (void)_stopWaitingForCheckInWithContext:(id)a3 andError:(id)a4;
- (void)_waitForSurrogateCheckInWithContext:(id)a3 withUIWorkBlock:(id)a4 client:(id)a5 andCheckInID:(id)a6;
- (void)performUIWorkWithSurrogateContext:(id)a3 uiWorkBlock:(id)a4;
- (void)registerUISurrogateContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)setInProgressSurrogates:(id)a3;
- (void)setSurrogateIDGenerator:(id)a3;
- (void)setSurrogateQueue:(id)a3;
- (void)unregisterUISurrogateForContext:(id)a3;
- (void)waitForRemoteViewServiceWithContext:(id)a3 client:(id)a4 uiWorkBlock:(id)a5;
- (void)waitForSettingsWithContext:(id)a3 client:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 uiWorkBlock:(id)a7;
@end

@implementation AKAuthenticationSurrogateManager

- (AKAuthenticationSurrogateManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAuthenticationSurrogateManager;
  v5 = [(AKAuthenticationSurrogateManager *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[AKAccountManager sharedInstance];
    accountManager = v6->_accountManager;
    v6->_accountManager = (AKAccountManager *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("AKUISurrogateQueue", v9);
    surrogateQueue = v6->_surrogateQueue;
    v6->_surrogateQueue = (OS_dispatch_queue *)v10;

    v12 = (NSLock *)objc_alloc_init((Class)NSLock);
    surrogateCheckinIDLock = v6->_surrogateCheckinIDLock;
    v6->_surrogateCheckinIDLock = v12;

    uint64_t v14 = objc_opt_new();
    settingsLauncher = v6->_settingsLauncher;
    v6->_settingsLauncher = (AKAuthenticationSettingsLauncher *)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    inProgressSurrogates = v6->_inProgressSurrogates;
    v6->_inProgressSurrogates = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    surrogateIDGenerator = v6->_surrogateIDGenerator;
    v6->_surrogateIDGenerator = (AKSurrogateAuthenticationIDGenerator *)v18;
  }
  return v6;
}

- (BOOL)hasRegisteredSurrogateForContext:(id)a3
{
  surrogateCheckinIDLock = self->_surrogateCheckinIDLock;
  id v5 = a3;
  [(NSLock *)surrogateCheckinIDLock lock];
  inProgressSurrogates = self->_inProgressSurrogates;
  uint64_t v7 = [v5 _identifier];

  v8 = [(NSMutableDictionary *)inProgressSurrogates objectForKeyedSubscript:v7];
  v9 = [v8 surrogateContext];
  LOBYTE(v5) = v9 != 0;

  [(NSLock *)self->_surrogateCheckinIDLock unlock];
  return (char)v5;
}

- (BOOL)isSurrogateAuthInProgressForClientBundleID:(id)a3
{
  v3 = [(AKAuthenticationSurrogateManager *)self _fetchSurrogateForClientBundleID:a3];
  id v4 = [v3 surrogateContext];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isWaitingForSettingsSurrogateAuth
{
  return self->_settingsSurrogationInProgress;
}

- (void)waitForRemoteViewServiceWithContext:(id)a3 client:(id)a4 uiWorkBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  surrogateQueue = self->_surrogateQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100030D68;
  v15[3] = &unk_100227978;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(surrogateQueue, v15);
}

- (void)waitForSettingsWithContext:(id)a3 client:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 uiWorkBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  surrogateQueue = self->_surrogateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031344;
  block[3] = &unk_1002279C8;
  block[4] = self;
  id v20 = v13;
  BOOL v23 = a6;
  id v21 = v12;
  id v22 = v14;
  BOOL v24 = a5;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(surrogateQueue, block);
}

- (void)performUIWorkWithSurrogateContext:(id)a3 uiWorkBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  surrogateQueue = self->_surrogateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003194C;
  block[3] = &unk_100227A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(surrogateQueue, block);
}

- (void)registerUISurrogateContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  surrogateQueue = self->_surrogateQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100031D04;
  v15[3] = &unk_100227618;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(surrogateQueue, v15);
}

- (void)unregisterUISurrogateForContext:(id)a3
{
  id v4 = [a3 _identifier];
  [(NSLock *)self->_surrogateCheckinIDLock lock];
  BOOL v5 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [(NSLock *)self->_surrogateCheckinIDLock unlock];
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 surrogateClient];
      id v10 = [v6 surrogateRegistrationID];
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "UI surrogate for client %@ with surrogate ID %@ is checking out.", (uint8_t *)&v13, 0x16u);
    }
    v11 = [v6 surrogateCompletion];

    if (v11)
    {
      id v12 = [v6 surrogateCompletion];
      v12[2](v12, 0, 0);
    }
    [(AKAuthenticationSurrogateManager *)self _clearSurrogate:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10017E74C();
    }
  }
}

- (BOOL)_isClientWaitingForSurrogateAuth:(id)a3
{
  id v4 = [a3 bundleID];
  BOOL v5 = [(AKAuthenticationSurrogateManager *)self _fetchSurrogateForClientBundleID:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (void)_waitForSurrogateCheckInWithContext:(id)a3 withUIWorkBlock:(id)a4 client:(id)a5 andCheckInID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Waiting for UI surrogate for client %@ with surrogate ID %@ to check in...", (uint8_t *)&v19, 0x16u);
  }

  [(NSLock *)self->_surrogateCheckinIDLock lock];
  __int16 v15 = objc_opt_new();
  [v15 setPendingClientUIWork:v12];

  [v15 setPendingBGContext:v13];
  id v16 = [v10 bundleID];
  [v15 setPendingClientBundle:v16];

  [v15 setSurrogateRegistrationID:v11];
  id v17 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v18 = [v13 _identifier];

  [v17 setObject:v15 forKeyedSubscript:v18];
  [(NSLock *)self->_surrogateCheckinIDLock unlock];
}

- (void)_stopWaitingForCheckInWithContext:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_surrogateCheckinIDLock lock];
  id v8 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v9 = [v6 _identifier];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 surrogateClient];
      id v13 = [v10 surrogateRegistrationID];
      int v18 = 138412546;
      int v19 = v12;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Stop waiting for UI surrogate for client %@ with surrogate ID %@!", (uint8_t *)&v18, 0x16u);
    }
    id v14 = [v10 surrogateCompletion];

    if (v14)
    {
      __int16 v15 = [v10 surrogateCompletion];
      ((void (**)(void, void, id))v15)[2](v15, 0, v7);
    }
    id v16 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
    id v17 = [v6 _identifier];
    [v16 setObject:0 forKeyedSubscript:v17];
  }
  [(NSLock *)self->_surrogateCheckinIDLock unlock];
}

- (void)_handleError:(id)a3 logMessage:(id)a4 withUIWorkBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:@" AKAuthenticationSurrogateManager Error: %@", v8];
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10017E7B8(v9, (uint64_t)v11, v12);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v14 = [WeakRetained uiWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000326B0;
  block[3] = &unk_1002279F0;
  id v18 = v8;
  id v19 = v10;
  id v15 = v8;
  id v16 = v10;
  dispatch_async(v14, block);
}

- (id)_fetchSurrogateForClientBundleID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_surrogateCheckinIDLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 pendingClientBundle];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(NSLock *)self->_surrogateCheckinIDLock unlock];

  return v7;
}

- (id)_fetchSurrogateWithRegistrationID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_surrogateCheckinIDLock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 surrogateRegistrationID];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(NSLock *)self->_surrogateCheckinIDLock unlock];

  return v7;
}

- (void)_clearSurrogate:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_surrogateCheckinIDLock lock];
  BOOL v5 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
  id v6 = [v5 allKeysForObject:v4];
  id v7 = [v6 firstObject];

  if (v7)
  {
    uint64_t v8 = [(AKAuthenticationSurrogateManager *)self inProgressSurrogates];
    [v8 setObject:0 forKeyedSubscript:v7];

    self->_settingsSurrogationInProgress = 0;
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10017E848(v4, v9);
    }
  }
  [(NSLock *)self->_surrogateCheckinIDLock unlock];
}

- (BOOL)_launchAppleIDSettingsForContext:(id)a3 withCheckinID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 _capabilityForUIDisplay] == (id)4)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Settings redirect not supported by context", v11, 2u);
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = [(AKAuthenticationSettingsLauncher *)self->_settingsLauncher launchSettingsForContext:v6 withCheckinID:v7];
  }

  return v9;
}

- (AKSurrogateAuthenticationIDGenerator)surrogateIDGenerator
{
  return self->_surrogateIDGenerator;
}

- (void)setSurrogateIDGenerator:(id)a3
{
}

- (OS_dispatch_queue)surrogateQueue
{
  return self->_surrogateQueue;
}

- (void)setSurrogateQueue:(id)a3
{
}

- (NSMutableDictionary)inProgressSurrogates
{
  return self->_inProgressSurrogates;
}

- (void)setInProgressSurrogates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressSurrogates, 0);
  objc_storeStrong((id *)&self->_surrogateQueue, 0);
  objc_storeStrong((id *)&self->_surrogateIDGenerator, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_surrogateCheckinIDLock, 0);
  objc_storeStrong((id *)&self->_settingsLauncher, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end