@interface IDSSignInController
- (BOOL)_actionOnAccountOfType:(unint64_t)a3 onService:(unint64_t)a4 actionBlock:(id)a5;
- (BOOL)_isServiceCurrentlyEnabled:(id)a3;
- (BOOL)isFaceTimeEnabled;
- (BOOL)isiMessageEnabled;
- (IDSCTAdapter)CTAdapter;
- (IDSSignInController)init;
- (IDSSignInController)initWithPasswordManager:(id)a3 CTAdapter:(id)a4 signInTimeout:(double)a5 signInFuzz:(double)a6 queue:(id)a7;
- (IDSSignInController)initWithQueue:(id)a3;
- (NSMapTable)delegateByServiceType;
- (NSMutableDictionary)accountIDDescriptionMap;
- (NSMutableDictionary)initialStateByService;
- (NSMutableDictionary)serviceNameAccountControllerMap;
- (NSString)listenerGUID;
- (OS_dispatch_queue)signInQueue;
- (_IDSPasswordManager)passwordManager;
- (double)signInFuzz;
- (double)signInTimeout;
- (id)_accountControllerForName:(id)a3;
- (id)_accountWithUniqueID:(id)a3;
- (id)_createAccountControllerForService:(id)a3;
- (id)_createAccountWithDictionary:(id)a3 accountID:(id)a4 serviceName:(id)a5;
- (id)_serviceNameForType:(unint64_t)a3;
- (id)_statusOfUsersOnService:(unint64_t)a3;
- (unint64_t)_serviceTypeForName:(id)a3;
- (unint64_t)_statusOfAccount:(id)a3;
- (void)_cleanupStateForAccountID:(id)a3;
- (void)_initializeStateMachineForAccountID:(id)a3 service:(id)a4 state:(unint64_t)a5 completion:(id)a6;
- (void)_scheduleValidationAfter:(double)a3 forAccountID:(id)a4 allowFuzz:(BOOL)a5 signOut:(BOOL)a6;
- (void)_validateDelegateState;
- (void)_validateStateForAccountID:(id)a3 timeoutMode:(unint64_t)a4;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)accountController:(id)a3 accountUpdated:(id)a4;
- (void)dealloc;
- (void)disableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5;
- (void)enableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5;
- (void)provideCredential:(id)a3 forUser:(id)a4 onService:(unint64_t)a5 withCompletion:(id)a6;
- (void)refreshRegistrationForAccount:(id)a3;
- (void)removeDelegateForService:(unint64_t)a3;
- (void)setAccountIDDescriptionMap:(id)a3;
- (void)setCTAdapter:(id)a3;
- (void)setDelegate:(id)a3 forService:(unint64_t)a4;
- (void)setDelegateByServiceType:(id)a3;
- (void)setInitialStateByService:(id)a3;
- (void)setListenerGUID:(id)a3;
- (void)setPasswordManager:(id)a3;
- (void)setServiceNameAccountControllerMap:(id)a3;
- (void)setSignInFuzz:(double)a3;
- (void)setSignInQueue:(id)a3;
- (void)setSignInTimeout:(double)a3;
- (void)signInUsername:(id)a3 onService:(unint64_t)a4 waitUntilRegistered:(BOOL)a5 withCompletion:(id)a6;
- (void)signInUsername:(id)a3 withProvidedCredential:(id)a4 onService:(unint64_t)a5 waitUntilRegistered:(BOOL)a6 completion:(id)a7;
- (void)signOutService:(unint64_t)a3 completion:(id)a4;
- (void)statusOfUsersOnService:(unint64_t)a3 withCompletion:(id)a4;
@end

@implementation IDSSignInController

- (IDSSignInController)initWithPasswordManager:(id)a3 CTAdapter:(id)a4 signInTimeout:(double)a5 signInFuzz:(double)a6 queue:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v15 = a7;
  if (_IDSRunningInDaemon())
  {
    v16 = [MEMORY[0x1E4F6C3B8] signInController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    v17 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)IDSSignInController;
    v18 = [(IDSSignInController *)&v27 init];
    if (v18)
    {
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v20 = dispatch_queue_create_with_target_V2("com.apple.identityservices.IDSSignInController", v19, v15);
      signInQueue = v18->_signInQueue;
      v18->_signInQueue = (OS_dispatch_queue *)v20;

      objc_storeStrong(&v18->_passwordManager, a3);
      objc_storeStrong((id *)&v18->_CTAdapter, a4);
      v18->_signInTimeout = a5;
      v18->_signInFuzz = a6;
      uint64_t v22 = [NSString stringGUID];
      listenerGUID = v18->_listenerGUID;
      v18->_listenerGUID = (NSString *)v22;

      v24 = +[IDSDaemonController sharedInstance];
      [v24 addListenerID:v18->_listenerGUID services:0];

      v25 = [MEMORY[0x1E4F6C3B8] signInController];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v18;
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "IDSSignInController init {self: %p}", buf, 0xCu);
      }
    }
    self = v18;
    v17 = self;
  }

  return v17;
}

- (IDSSignInController)initWithQueue:(id)a3
{
  id v4 = a3;
  if (_IDSRunningInDaemon())
  {
    v5 = [MEMORY[0x1E4F6C3B8] signInController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2C4C8();
    }

    v6 = 0;
  }
  else
  {
    v7 = objc_alloc_init(_IDSPasswordManager);
    v8 = [MEMORY[0x1E4F6B3E8] sharedInstance];
    self = [(IDSSignInController *)self initWithPasswordManager:v7 CTAdapter:v8 signInTimeout:v4 signInFuzz:180.0 queue:60.0];

    v6 = self;
  }

  return v6;
}

- (IDSSignInController)init
{
  v3 = dispatch_get_global_queue(21, 0);
  id v4 = [(IDSSignInController *)self initWithQueue:v3];

  return v4;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "IDSSignInController dealloc {self: %p}", buf, 0xCu);
  }

  id v4 = +[IDSDaemonController sharedInstance];
  [v4 removeListenerID:self->_listenerGUID];

  v5.receiver = self;
  v5.super_class = (Class)IDSSignInController;
  [(IDSSignInController *)&v5 dealloc];
}

- (void)setDelegate:(id)a3 forService:(unint64_t)a4
{
  id v6 = a3;
  signInQueue = self->_signInQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19194805C;
  block[3] = &unk_1E5728F38;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(signInQueue, block);
}

- (void)removeDelegateForService:(unint64_t)a3
{
  signInQueue = self->_signInQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_191948408;
  v4[3] = &unk_1E5728E48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(signInQueue, v4);
}

- (void)enableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      unint64_t v11 = @"iMessage";
      if (a4 != 1) {
        unint64_t v11 = 0;
      }
      if (!a4) {
        unint64_t v11 = @"FaceTime";
      }
      v12 = v11;
      *(_DWORD *)buf = 134218242;
      v19 = (const char *)a3;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Enable user on service {userType: %llu, service: %@}", buf, 0x16u);
    }
    signInQueue = self->_signInQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19194875C;
    v14[3] = &unk_1E572A190;
    v14[4] = self;
    unint64_t v16 = a3;
    unint64_t v17 = a4;
    id v15 = v8;
    dispatch_async(signInQueue, v14);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[IDSSignInController enableUserType:onService:completion:]";
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }
  }
}

- (void)disableUserType:(unint64_t)a3 onService:(unint64_t)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      unint64_t v11 = @"iMessage";
      if (a4 != 1) {
        unint64_t v11 = 0;
      }
      if (!a4) {
        unint64_t v11 = @"FaceTime";
      }
      v12 = v11;
      *(_DWORD *)buf = 134218242;
      v19 = (const char *)a3;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Disable user on service {userType: %llu, service: %@}", buf, 0x16u);
    }
    signInQueue = self->_signInQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_191948C68;
    v14[3] = &unk_1E572A190;
    v14[4] = self;
    unint64_t v16 = a3;
    unint64_t v17 = a4;
    id v15 = v8;
    dispatch_async(signInQueue, v14);
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[IDSSignInController disableUserType:onService:completion:]";
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }
  }
}

- (id)_statusOfUsersOnService:(unint64_t)a3
{
  objc_super v5 = -[IDSSignInController _serviceNameForType:](self, "_serviceNameForType:");
  id v6 = [(NSMutableDictionary *)self->_serviceNameAccountControllerMap objectForKeyedSubscript:v5];

  v7 = [(IDSSignInController *)self _accountControllerForName:v5];
  id v8 = [v7 accounts];
  v9 = [v8 allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_191949070;
  v13[3] = &unk_1E572A1B8;
  v13[4] = self;
  BOOL v10 = objc_msgSend(v9, "__imArrayByApplyingBlock:", v13);

  unint64_t v11 = [[IDSSignInServiceUserStatus alloc] initWithServiceType:a3 userInfos:v10];
  if (!v6)
  {
    [(NSMutableDictionary *)self->_serviceNameAccountControllerMap setObject:0 forKeyedSubscript:v5];
    [(IDSSignInController *)self _cleanupStateForAccountID:0];
  }

  return v11;
}

- (void)statusOfUsersOnService:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = @"iMessage";
      if (a3 != 1) {
        v9 = 0;
      }
      if (!a3) {
        v9 = @"FaceTime";
      }
      BOOL v10 = v9;
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = (const char *)v10;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Checking user statuses {service: %@}", buf, 0xCu);
    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919492C4;
    block[3] = &unk_1E572A1E0;
    block[4] = self;
    unint64_t v14 = a3;
    id v13 = v6;
    dispatch_async(signInQueue, block);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v16 = "-[IDSSignInController statusOfUsersOnService:withCompletion:]";
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }
  }
}

- (void)provideCredential:(id)a3 forUser:(id)a4 onService:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (char *)a3;
  id v11 = a4;
  v12 = (void (**)(id, NSObject *))a6;
  id v13 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      id v15 = @"FaceTime";
      unint64_t v16 = @"iMessage";
      if (a5 != 1) {
        unint64_t v16 = 0;
      }
      if (a5) {
        id v15 = v16;
      }
      uint64_t v17 = v15;
      *(_DWORD *)buf = 134218498;
      v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Provided credential {credential: %p, user: %@, service: %@}", buf, 0x20u);
    }
    if (a5)
    {
      if (a5 != 1) {
        goto LABEL_17;
      }
      v18 = @"iMessage";
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      v18 = @"FaceTime";
      if (!v10)
      {
LABEL_17:
        id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSSignInControllerErrorDomain" code:-4000 userInfo:0];
        __int16 v20 = [MEMORY[0x1E4F6C3B8] signInController];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = (const char *)v13;
          _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "Invalid params {error: %@}", buf, 0xCu);
        }

        v12[2](v12, v13);
        goto LABEL_20;
      }
    }
    if (v11)
    {
      v19 = [(IDSSignInController *)self passwordManager];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_19194969C;
      v21[3] = &unk_1E572A208;
      uint64_t v22 = v12;
      [v19 setPassword:v10 forUsername:v11 onService:v18 completionBlock:v21];

      id v13 = v22;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[IDSSignInController provideCredential:forUser:onService:withCompletion:]";
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
  }
LABEL_20:
}

- (void)signInUsername:(id)a3 onService:(unint64_t)a4 waitUntilRegistered:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (char *)a3;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      BOOL v14 = @"iMessage";
      if (a4 != 1) {
        BOOL v14 = 0;
      }
      if (!a4) {
        BOOL v14 = @"FaceTime";
      }
      id v15 = v14;
      unint64_t v16 = v15;
      uint64_t v17 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v26 = v10;
      __int16 v27 = 2112;
      if (v7) {
        uint64_t v17 = @"YES";
      }
      v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Sign in user {user: %@, service: %@, shouldWait: %@}", buf, 0x20u);
    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_191949A2C;
    block[3] = &unk_1E572A230;
    unint64_t v23 = a4;
    __int16 v20 = v10;
    v21 = self;
    id v22 = v11;
    BOOL v24 = v7;
    dispatch_async(signInQueue, block);

    v12 = v20;
  }
  else if (v13)
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[IDSSignInController signInUsername:onService:waitUntilRegistered:withCompletion:]";
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
  }
}

- (void)signInUsername:(id)a3 withProvidedCredential:(id)a4 onService:(unint64_t)a5 waitUntilRegistered:(BOOL)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v12 = (char *)a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      uint64_t v17 = @"iMessage";
      if (a5 != 1) {
        uint64_t v17 = 0;
      }
      if (!a5) {
        uint64_t v17 = @"FaceTime";
      }
      v18 = v17;
      *(_DWORD *)buf = 138412802;
      __int16 v25 = v12;
      __int16 v26 = 2048;
      id v27 = v13;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Sign in user with provided credential {user: %@, credential: %p, service: %@}", buf, 0x20u);
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_191949E38;
    v19[3] = &unk_1E572A258;
    v19[4] = self;
    __int16 v20 = v12;
    unint64_t v22 = a5;
    BOOL v23 = a6;
    id v21 = v14;
    [(IDSSignInController *)self provideCredential:v13 forUser:v20 onService:a5 withCompletion:v19];
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v25 = "-[IDSSignInController signInUsername:withProvidedCredential:onService:waitUntilRegistered:completion:]";
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }
  }
}

- (void)signOutService:(unint64_t)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F6C3B8] signInController];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = @"iMessage";
      if (a3 != 1) {
        v9 = 0;
      }
      if (!a3) {
        v9 = @"FaceTime";
      }
      BOOL v10 = v9;
      *(_DWORD *)buf = 138412290;
      BOOL v16 = (const char *)v10;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Sign out service {service: %@}", buf, 0xCu);
    }
    signInQueue = self->_signInQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19194A010;
    block[3] = &unk_1E572A1E0;
    void block[4] = self;
    unint64_t v14 = a3;
    id v13 = v6;
    dispatch_async(signInQueue, block);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      BOOL v16 = "-[IDSSignInController signOutService:completion:]";
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "%s called with nil completion - returning", buf, 0xCu);
    }
  }
}

- (void)_initializeStateMachineForAccountID:(id)a3 service:(id)a4 state:(unint64_t)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(IDSSignInControllerAccountDescription);
  [(IDSSignInControllerAccountDescription *)v13 setServiceName:v11];
  unint64_t v14 = [NSNumber numberWithUnsignedInteger:a5];
  [(IDSSignInControllerAccountDescription *)v13 setState:v14];

  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  __int16 v25 = sub_19194A47C;
  __int16 v26 = &unk_1E57298A8;
  id v15 = v12;
  id v27 = self;
  id v28 = v15;
  [(IDSSignInControllerAccountDescription *)v13 setCompletion:&v23];
  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  if (!accountIDDescriptionMap)
  {
    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18 = self->_accountIDDescriptionMap;
    self->_accountIDDescriptionMap = v17;

    accountIDDescriptionMap = self->_accountIDDescriptionMap;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](accountIDDescriptionMap, "setObject:forKeyedSubscript:", v13, v10, v23, v24, v25, v26);
  v19 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = [NSNumber numberWithUnsignedInteger:a5];
    id v21 = (void *)MEMORY[0x192FE03B0](v15);
    *(_DWORD *)buf = 134219010;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    v36 = v20;
    __int16 v37 = 2112;
    v38 = v21;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Initialized state machine {self: %p, accountID: %@, serviceName: %@, state: %@, completion: %@}", buf, 0x34u);
  }
  double signInTimeout = 5.0;
  if (a5 != 4) {
    double signInTimeout = self->_signInTimeout;
  }
  [(IDSSignInController *)self _scheduleValidationAfter:v10 forAccountID:1 allowFuzz:a5 == 4 signOut:signInTimeout];
}

- (void)_scheduleValidationAfter:(double)a3 forAccountID:(id)a4 allowFuzz:(BOOL)a5 signOut:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [NSNumber numberWithDouble:a3];
    id v13 = (void *)v12;
    unint64_t v14 = @"NO";
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = self;
    if (v7) {
      id v15 = @"YES";
    }
    else {
      id v15 = @"NO";
    }
    if (v6) {
      unint64_t v14 = @"YES";
    }
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Schedule validation after {self: %p, delay: %@, accountID: %@, allowFuzz: %@, signOut: %@}", buf, 0x34u);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  uint64_t v17 = [(IDSSignInController *)self signInQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_19194A7AC;
  v19[3] = &unk_1E572A2A8;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = *(id *)&a3;
  BOOL v22 = v7;
  BOOL v23 = v6;
  id v20 = v10;
  id v18 = v10;
  dispatch_after(v16, v17, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

- (void)_cleanupStateForAccountID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(NSMutableDictionary *)self->_accountIDDescriptionMap objectForKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_accountIDDescriptionMap setObject:0 forKeyedSubscript:v4];
    BOOL v6 = [v5 serviceName];
    BOOL v7 = [(NSMutableDictionary *)self->_accountIDDescriptionMap allValues];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19194AA80;
    v17[3] = &unk_1E572A2D0;
    id v8 = v6;
    id v18 = v8;
    v9 = objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v17);
    uint64_t v10 = [v9 count];

    unint64_t v11 = [(IDSSignInController *)self _serviceTypeForName:v8];
    delegateByServiceType = self->_delegateByServiceType;
    id v13 = [NSNumber numberWithUnsignedInteger:v11];
    unint64_t v14 = [(NSMapTable *)delegateByServiceType objectForKey:v13];

    if (!v10 && !v14) {
      [(NSMutableDictionary *)self->_serviceNameAccountControllerMap setObject:0 forKeyedSubscript:v8];
    }
  }
  if (![(NSMutableDictionary *)self->_accountIDDescriptionMap count])
  {
    accountIDDescriptionMap = self->_accountIDDescriptionMap;
    self->_accountIDDescriptionMap = 0;
  }
  if (![(NSMutableDictionary *)self->_serviceNameAccountControllerMap count])
  {
    serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    self->_serviceNameAccountControllerMap = 0;
  }
}

- (void)_validateStateForAccountID:(id)a3 timeoutMode:(unint64_t)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(IDSSignInController *)self _accountWithUniqueID:v5];
  BOOL v7 = [(NSMutableDictionary *)self->_accountIDDescriptionMap objectForKeyedSubscript:v5];
  id v8 = [v7 completion];
  if (v7)
  {
    unsigned int v9 = [v6 registrationStatus];
    uint64_t v10 = [v7 state];
    uint64_t v11 = [v10 unsignedIntegerValue];
    uint64_t v12 = [v7 serviceName];
    uint64_t v33 = [(IDSSignInController *)self _accountControllerForName:v12];

    id v13 = [MEMORY[0x1E4F6C3B8] signInController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Validating state {stateNumber: %@, account: %@}", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v47 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_19194B150;
    v35[3] = &unk_1E572A2F8;
    id v14 = v6;
    id v36 = v14;
    unint64_t v41 = a4;
    id v39 = v8;
    __int16 v37 = self;
    id v32 = v5;
    id v38 = v32;
    v40 = buf;
    uint64_t v15 = MEMORY[0x192FE03B0](v35);
    dispatch_time_t v16 = (void (**)(void, void, void))v15;
    if (!v14 && v11 != 4)
    {
      uint64_t v17 = [MEMORY[0x1E4F6C3B8] signInController];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v42 = 138412546;
        id v43 = v32;
        __int16 v44 = 2112;
        v45 = v7;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "No account to validate {accountID: %@, description: %@}", v42, 0x16u);
      }

      uint64_t v18 = -1000;
      goto LABEL_9;
    }
    if (v9 == -1)
    {
      uint64_t v24 = 0;
    }
    else
    {
      if (v9 == 3 && !v11)
      {
        v19 = [v14 aliasesToRegister];
        uint64_t v20 = [v19 count];
        HIDWORD(v31) = v20 == 0;
        if (v20)
        {
          [v7 setState:&unk_1EE28B2B0];
          if ([v14 accountType] == 1)
          {
            id v21 = [(IDSSignInController *)self CTAdapter];
            LODWORD(v31) = [v21 supportsIdentification];

            if (v31)
            {
              uint64_t v22 = [v19 arrayByAddingObject:*MEMORY[0x1E4F6B7D0]];

              v19 = (void *)v22;
            }
          }
          objc_msgSend(v14, "addAliases:", v19, v31);
          [v14 registerAccount];
          BOOL v23 = [MEMORY[0x1E4F6C3B8] signInController];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "Transitioning to registering", v42, 2u);
          }
        }
        else
        {
          v16[2](v16, -2000, 0);
        }

        goto LABEL_38;
      }
      if (!v9 && !v11)
      {
        uint64_t v26 = [MEMORY[0x1E4F6C3B8] signInController];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "Re-enable, looks like things didn't progress", v42, 2u);
        }

        [v33 enableAccount:v14];
        [v14 authenticateAccount];
        goto LABEL_32;
      }
      if (v9 == 5 && v11 == 2) {
        goto LABEL_35;
      }
      if (v11 == 2 && v9 == 4)
      {
        BYTE4(v31) = 0;
LABEL_38:
        if (!a4 || *(unsigned char *)(*(void *)&buf[8] + 24)) {
          goto LABEL_10;
        }
        if (a4 == 2) {
          char v27 = BYTE4(v31);
        }
        else {
          char v27 = 1;
        }
        if ((v27 & 1) == 0)
        {
          [(IDSSignInController *)self _scheduleValidationAfter:v32 forAccountID:0 allowFuzz:0 signOut:self->_signInFuzz];
          goto LABEL_10;
        }
        uint64_t v18 = 0;
LABEL_9:
        v16[2](v16, v18, 0);
LABEL_10:

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
      if (v11 != 2)
      {
        if (v11 != 1)
        {
          if (!v11)
          {
            uint64_t v24 = -402;
            uint64_t v25 = -1000;
            if (v9 <= 4)
            {
              BYTE4(v31) = 1;
              if (((1 << v9) & 0x16) != 0) {
                goto LABEL_38;
              }
            }
            goto LABEL_26;
          }
          BOOL v29 = v9 == 1;
          BOOL v30 = v11 == 3;
          if (v30 && v29) {
            uint64_t v25 = 0;
          }
          else {
            uint64_t v25 = -1000;
          }
          if (v30 && v29) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = -402;
          }
          if (v11 != 3)
          {
            BYTE4(v31) = 1;
            if (v11 != 4 || v9 > 1) {
              goto LABEL_38;
            }
LABEL_35:
            uint64_t v25 = 0;
            uint64_t v24 = 0;
          }
LABEL_26:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v25, v24);
LABEL_32:
          BYTE4(v31) = 1;
          goto LABEL_38;
        }
        if ((v9 | 2) == 3)
        {
          id v28 = [MEMORY[0x1E4F6C3B8] signInController];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "Transitioning to registering", v42, 2u);
          }

          [v7 setState:&unk_1EE28B2B0];
          goto LABEL_32;
        }
      }
      uint64_t v24 = -402;
    }
    uint64_t v25 = -1000;
    goto LABEL_26;
  }
  uint64_t v10 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "No description to validate {accountID: %@}", buf, 0xCu);
  }
LABEL_13:
}

- (id)_createAccountWithDictionary:(id)a3 accountID:(id)a4 serviceName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[IDSAccount alloc] initWithDictionary:v9 uniqueID:v8 serviceName:v7];

  return v10;
}

- (unint64_t)_statusOfAccount:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isEnabled];
  if ([v3 registrationStatus] == 5
    || [v3 registrationStatus] == 4)
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 2;
  }
  if (v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)_actionOnAccountOfType:(unint64_t)a3 onService:(unint64_t)a4 actionBlock:(id)a5
{
  int v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *, void *))a5;
  id v9 = [(IDSSignInController *)self _serviceNameForType:a4];
  uint64_t v10 = [(IDSSignInController *)self _accountControllerForName:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = objc_msgSend(v10, "accounts", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v17 accountType] == v6)
        {
          v8[2](v8, v17, v10);
          char v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

- (id)_createAccountControllerForService:(id)a3
{
  id v3 = a3;
  int v4 = [[IDSAccountController alloc] initWithService:v3];

  return v4;
}

- (id)_accountControllerForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_serviceNameAccountControllerMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [(IDSSignInController *)self _createAccountControllerForService:v4];
    serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    if (!serviceNameAccountControllerMap)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = self->_serviceNameAccountControllerMap;
      self->_serviceNameAccountControllerMap = v7;

      serviceNameAccountControllerMap = self->_serviceNameAccountControllerMap;
    }
    [(NSMutableDictionary *)serviceNameAccountControllerMap setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_accountWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_accountIDDescriptionMap objectForKeyedSubscript:v4];
  int v6 = [v5 serviceName];

  if (v6)
  {
    id v7 = [(IDSSignInController *)self _accountControllerForName:v6];
    id v8 = [v7 accountWithUniqueID:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_serviceNameForType:(unint64_t)a3
{
  if (!a3)
  {
    id v4 = IDSServiceNameFaceTime;
LABEL_5:
    uint64_t v5 = *v4;
    return v5;
  }
  if (a3 == 1)
  {
    id v4 = IDSServiceNameiMessage;
    goto LABEL_5;
  }
  uint64_t v5 = 0;
  return v5;
}

- (unint64_t)_serviceTypeForName:(id)a3
{
  return [a3 isEqualToString:@"com.apple.ess"] ^ 1;
}

- (void)_validateDelegateState
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_delegateByServiceType;
  uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v21;
    *(void *)&long long v3 = 138412802;
    long long v16 = v3;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v6 = -[NSMapTable objectForKey:](self->_delegateByServiceType, "objectForKey:", v5, v16);
        if (v6)
        {
          id v7 = -[IDSSignInController _statusOfUsersOnService:](self, "_statusOfUsersOnService:", [v5 unsignedIntegerValue]);
          id v8 = [(NSMutableDictionary *)self->_initialStateByService objectForKeyedSubscript:v5];
          id v9 = [v7 serviceUserInfos];
          uint64_t v10 = sub_19194BA68((uint64_t)v9, v9);

          uint64_t v11 = [v8 serviceUserInfos];
          uint64_t v12 = sub_19194BA68((uint64_t)v11, v11);

          int v13 = [v10 isEqualToSet:v12];
          char v14 = [MEMORY[0x1E4F6C3B8] signInController];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v15 = @"YES";
            if (v13) {
              uint64_t v15 = @"NO";
            }
            uint64_t v25 = v15;
            __int16 v26 = 2112;
            char v27 = v7;
            __int16 v28 = 2112;
            BOOL v29 = v8;
            _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Validating delegate state {changes: %@, current: %@, cached: %@}", buf, 0x20u);
          }

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v6, "signInController:service:didChangeStatus:", self, objc_msgSend(v5, "unsignedIntegerValue"), v7);
            [(NSMutableDictionary *)self->_initialStateByService setObject:v7 forKeyedSubscript:v5];
          }
        }
      }
      uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDDescriptionMap, "objectForKeyedSubscript:");

  if (v4) {
    [(IDSSignInController *)self _validateStateForAccountID:v5 timeoutMode:0];
  }
  [(IDSSignInController *)self _validateDelegateState];
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 serviceName];
  unint64_t v7 = [(IDSSignInController *)self _serviceTypeForName:v6];

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  id v9 = [v5 uniqueID];
  uint64_t v10 = [(NSMutableDictionary *)accountIDDescriptionMap objectForKeyedSubscript:v9];
  if (v10)
  {
  }
  else
  {
    delegateByServiceType = self->_delegateByServiceType;
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:v7];
    int v13 = [(NSMapTable *)delegateByServiceType objectForKey:v12];

    if (!v13) {
      goto LABEL_7;
    }
  }
  char v14 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Added interesting account {account: %@}", (uint8_t *)&v15, 0xCu);
  }

  [v5 addRegistrationDelegate:self queue:self->_signInQueue];
LABEL_7:
  [(IDSSignInController *)self _validateDelegateState];
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Account disabled {account: %@}", (uint8_t *)&v13, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  id v8 = [v5 uniqueID];
  id v9 = [(NSMutableDictionary *)accountIDDescriptionMap objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v9 state];
    uint64_t v11 = [v10 unsignedIntegerValue];

    if (v11 == 3)
    {
      uint64_t v12 = [v5 uniqueID];
      [(IDSSignInController *)self _validateStateForAccountID:v12 timeoutMode:0];
    }
  }
  [(IDSSignInController *)self _validateDelegateState];
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Account removed {account: %@}", (uint8_t *)&v11, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  id v8 = [v5 uniqueID];
  id v9 = [(NSMutableDictionary *)accountIDDescriptionMap objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v5 uniqueID];
    [(IDSSignInController *)self _validateStateForAccountID:v10 timeoutMode:0];
  }
  [(IDSSignInController *)self _validateDelegateState];
}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Account updated {account: %@}", (uint8_t *)&v11, 0xCu);
  }

  accountIDDescriptionMap = self->_accountIDDescriptionMap;
  id v8 = [v5 uniqueID];
  id v9 = [(NSMutableDictionary *)accountIDDescriptionMap objectForKeyedSubscript:v8];

  if (v9)
  {
    [v5 addRegistrationDelegate:self queue:self->_signInQueue];
    uint64_t v10 = [v5 uniqueID];
    [(IDSSignInController *)self _validateStateForAccountID:v10 timeoutMode:0];
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F6C3B8] signInController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Account enabled {account: %@}", (uint8_t *)&v7, 0xCu);
  }

  [(IDSSignInController *)self _validateDelegateState];
}

- (NSMutableDictionary)serviceNameAccountControllerMap
{
  return self->_serviceNameAccountControllerMap;
}

- (void)setServiceNameAccountControllerMap:(id)a3
{
}

- (NSMutableDictionary)accountIDDescriptionMap
{
  return self->_accountIDDescriptionMap;
}

- (void)setAccountIDDescriptionMap:(id)a3
{
}

- (OS_dispatch_queue)signInQueue
{
  return self->_signInQueue;
}

- (void)setSignInQueue:(id)a3
{
}

- (_IDSPasswordManager)passwordManager
{
  return (_IDSPasswordManager *)self->_passwordManager;
}

- (void)setPasswordManager:(id)a3
{
}

- (double)signInTimeout
{
  return self->_signInTimeout;
}

- (void)setSignInTimeout:(double)a3
{
  self->_double signInTimeout = a3;
}

- (double)signInFuzz
{
  return self->_signInFuzz;
}

- (void)setSignInFuzz:(double)a3
{
  self->_signInFuzz = a3;
}

- (NSMapTable)delegateByServiceType
{
  return self->_delegateByServiceType;
}

- (void)setDelegateByServiceType:(id)a3
{
}

- (NSMutableDictionary)initialStateByService
{
  return self->_initialStateByService;
}

- (void)setInitialStateByService:(id)a3
{
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
}

- (NSString)listenerGUID
{
  return self->_listenerGUID;
}

- (void)setListenerGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerGUID, 0);
  objc_storeStrong((id *)&self->_CTAdapter, 0);
  objc_storeStrong(&self->_passwordManager, 0);
  objc_storeStrong((id *)&self->_signInQueue, 0);
  objc_storeStrong((id *)&self->_initialStateByService, 0);
  objc_storeStrong((id *)&self->_delegateByServiceType, 0);
  objc_storeStrong((id *)&self->_accountIDDescriptionMap, 0);

  objc_storeStrong((id *)&self->_serviceNameAccountControllerMap, 0);
}

- (BOOL)isFaceTimeEnabled
{
  if ([(IDSSignInController *)self _isServiceCurrentlyEnabled:@"com.apple.private.ac"])
  {
    return 1;
  }

  return [(IDSSignInController *)self _isServiceCurrentlyEnabled:@"com.apple.ess"];
}

- (BOOL)isiMessageEnabled
{
  return [(IDSSignInController *)self _isServiceCurrentlyEnabled:@"com.apple.madrid"];
}

- (BOOL)_isServiceCurrentlyEnabled:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v3 = [(IDSSignInController *)self _createAccountControllerForService:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "accounts", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isEnabled])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

@end