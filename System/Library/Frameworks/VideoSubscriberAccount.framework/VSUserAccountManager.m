@interface VSUserAccountManager
+ (VSUserAccountManager)sharedUserAccountManager;
- (VSRemoteNotifier)remoteNotifier;
- (VSUserAccountManager)init;
- (VSUserAccountServiceConnection)connection;
- (void)deleteUserAccount:(id)a3 completion:(id)a4;
- (void)fetchUserAccountWithSourceIdentifier:(id)a3 sourceType:(int64_t)a4 deviceIdentifier:(id)a5 withCompletion:(id)a6;
- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4;
- (void)queryUserAccountsWithOptions:(VSUserAccountQueryOptions)options completion:(void *)completion;
- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setConnection:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)updateUserAccount:(VSUserAccount *)account completion:(void *)completion;
@end

@implementation VSUserAccountManager

+ (VSUserAccountManager)sharedUserAccountManager
{
  if (sharedUserAccountManager___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedUserAccountManager___vs_lazy_init_predicate, &__block_literal_global_34);
  }
  v2 = (void *)sharedUserAccountManager___vs_lazy_init_variable;

  return (VSUserAccountManager *)v2;
}

uint64_t __48__VSUserAccountManager_sharedUserAccountManager__block_invoke()
{
  sharedUserAccountManager___vs_lazy_init_variable = objc_alloc_init(VSUserAccountManager);

  return MEMORY[0x1F41817F8]();
}

- (VSUserAccountManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSUserAccountManager;
  v2 = [(VSUserAccountManager *)&v6 init];
  if (v2)
  {
    v3 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSActiveSubscriptionsDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v3;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
  }
  return v2;
}

- (void)updateUserAccount:(VSUserAccount *)account completion:(void *)completion
{
  objc_super v6 = account;
  v7 = completion;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v8 raise:v9, @"Object passed to %s was not of type %@.", "-[VSUserAccountManager updateUserAccount:completion:]", v11 format];
  }
  v12 = [(VSUserAccountManager *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__VSUserAccountManager_updateUserAccount_completion___block_invoke;
  v15[3] = &unk_1E6BD2DA0;
  id v16 = v7;
  id v13 = v7;
  v14 = [v12 serviceWithErrorHandler:v15];
  [v14 updateUserAccount:v6 completion:v13];
}

void __53__VSUserAccountManager_updateUserAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(VSUserAccountManager *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__VSUserAccountManager_deleteUserAccount_completion___block_invoke;
  v11[3] = &unk_1E6BD2DA0;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 serviceWithErrorHandler:v11];
  [v10 deleteUserAccount:v7 completion:v9];
}

void __53__VSUserAccountManager_deleteUserAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)fetchUserAccountWithSourceIdentifier:(id)a3 sourceType:(int64_t)a4 deviceIdentifier:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__VSUserAccountManager_fetchUserAccountWithSourceIdentifier_sourceType_deviceIdentifier_withCompletion___block_invoke;
  v16[3] = &unk_1E6BD3F20;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a4;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(VSUserAccountManager *)self queryUserAccountsWithOptions:1 completion:v16];
}

void __104__VSUserAccountManager_fetchUserAccountWithSourceIdentifier_sourceType_deviceIdentifier_withCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sourceIdentifier", (void)v15);
        if ([v12 isEqualToString:a1[4]] && objc_msgSend(v11, "sourceType") == a1[7])
        {
          id v13 = [v11 deviceIdentifier];
          int v14 = [v13 isEqualToString:a1[5]];

          if (v14)
          {
            id v8 = v11;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
LABEL_13:

  if ([v8 isSignedOut])
  {

    id v8 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VSUserAccountManager *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke;
  v14[3] = &unk_1E6BD2DA0;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 serviceWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke_10;
  v12[3] = &unk_1E6BD2DA0;
  id v13 = v9;
  id v11 = v9;
  [v10 forceRefreshUserAccount:v7 withCompletion:v12];
}

void __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __63__VSUserAccountManager_forceRefreshUserAccount_withCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryUserAccountsWithOptions:(VSUserAccountQueryOptions)options completion:(void *)completion
{
  id v6 = completion;
  id v7 = [(VSUserAccountManager *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__VSUserAccountManager_queryUserAccountsWithOptions_completion___block_invoke;
  v10[3] = &unk_1E6BD2DA0;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 serviceWithErrorHandler:v10];
  [v9 queryUserAccountsWithOptions:options completion:v8];
}

void __64__VSUserAccountManager_queryUserAccountsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  long long v16 = [(VSUserAccountManager *)self connection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __109__VSUserAccountManager_queryUserAccountsWithOptions_sourceIdentifier_sourceType_deviceIdentifier_completion___block_invoke;
  v19[3] = &unk_1E6BD2DA0;
  id v20 = v12;
  id v17 = v12;
  long long v18 = [v16 serviceWithErrorHandler:v19];
  [v18 queryUserAccountsWithOptions:a3 sourceIdentifier:v15 sourceType:v14 deviceIdentifier:v13 completion:v17];
}

void __109__VSUserAccountManager_queryUserAccountsWithOptions_sourceIdentifier_sourceType_deviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (VSUserAccountServiceConnection)connection
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_connection;
  if (!v3)
  {
    id v3 = objc_alloc_init(VSUserAccountServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"VSActiveSubscriptionsDidChangeNotification" object:self];
}

- (void)setConnection:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__VSUserAccountManager_updateUserAccount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error with connection to user account service: %@", v2, v3, v4, v5, v6);
}

@end