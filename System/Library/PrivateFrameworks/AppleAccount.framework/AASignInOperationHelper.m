@interface AASignInOperationHelper
- (AASignInOperationHelper)init;
- (void)_refreshEnabledDataclassesForAccount:(id)a3;
- (void)_saveAccount:(id)a3 completion:(id)a4;
- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4 completion:(id)a5;
@end

@implementation AASignInOperationHelper

- (AASignInOperationHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)AASignInOperationHelper;
  v2 = [(AASignInOperationHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;
  }
  return v2;
}

- (void)signInAccount:(id)a3 enablingDataclasses:(BOOL)a4 completion:(id)a5
{
  if (a4)
  {
    id v6 = a5;
    id v7 = a3;
    id v9 = +[AADataclassManager sharedManager];
    [v9 enableDataclassesWithoutLocalDataDataclassActionsForAccount:v7 completion:v6];
  }
  else
  {
    id v7 = a5;
    id v9 = a3;
    -[AASignInOperationHelper _saveAccount:completion:](self, "_saveAccount:completion:");
  }
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
}

- (void)_refreshEnabledDataclassesForAccount:(id)a3
{
  id v3 = a3;
  v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AASignInOperationHelper _refreshEnabledDataclassesForAccount:]((uint64_t)v3, v4);
  }

  v5 = [MEMORY[0x1E4F179C8] defaultStore];
  id v6 = [v5 enabledDataclassesForAccount:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__AASignInOperationHelper__refreshEnabledDataclassesForAccount___block_invoke;
  v8[3] = &unk_1E5A4B358;
  id v9 = v3;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __64__AASignInOperationHelper__refreshEnabledDataclassesForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setEnabled:1 forDataclass:a2];
}

- (void).cxx_destruct
{
}

- (void)_refreshEnabledDataclassesForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Refreshing enabled dataclasses for account: %@", (uint8_t *)&v2, 0xCu);
}

@end