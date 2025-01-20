@interface ACUIAccountOperationsHelper
- (ACUIAccountOperationsDelegate)delegate;
- (ACUIAccountOperationsHelper)initWithAccountStore:(id)a3;
- (BOOL)isRemovingAccount;
- (BOOL)isSavingAccount;
- (id)_desiredDataclassActionsFromPossibleActions:(id)a3 forAccount:(id)a4 withError:(id *)a5;
- (id)dataclassActionsForAccountSave:(id)a3 forDataclass:(id)a4 error:(id *)a5;
- (void)removeAccount:(id)a3;
- (void)saveAccount:(id)a3;
- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4;
- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4 completion:(id)a5;
- (void)saveAccount:(id)a3 withDataclassActions:(id)a4;
- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5;
- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setIsRemovingAccount:(BOOL)a3;
- (void)setIsSavingAccount:(BOOL)a3;
@end

@implementation ACUIAccountOperationsHelper

- (ACUIAccountOperationsHelper)initWithAccountStore:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ACUIAccountOperationsHelper;
  v11 = [(ACUIAccountOperationsHelper *)&v9 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountStore, location[0]);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.acountsui.operations", v8);
    accountOperationsQueue = v11->_accountOperationsQueue;
    v11->_accountOperationsQueue = (OS_dispatch_queue *)v4;
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (id)dataclassActionsForAccountSave:(id)a3 forDataclass:(id)a4 error:(id *)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  id v18 = 0;
  accountStore = v22->_accountStore;
  id v16 = 0;
  id v12 = (id)[(ACAccountStore *)accountStore dataclassActionsForAccountSave:location[0] error:&v16];
  objc_storeStrong(&v18, v16);
  id v17 = v12;
  id v15 = (id)[v12 objectForKeyedSubscript:v20];
  v13 = [(ACUIAccountOperationsHelper *)v22 delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    objc_super v9 = [(ACUIAccountOperationsHelper *)v22 delegate];
    [(ACUIAccountOperationsDelegate *)v9 operationsHelper:v22 didLoadSaveActions:v15 forDataclass:v20 withAccount:location[0] error:v18];
  }
  if (v19)
  {
    id v6 = v18;
    id *v19 = v6;
  }
  id v8 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)saveAccount:(id)a3
{
  dispatch_queue_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIAccountOperationsHelper *)v4 saveAccount:location[0] requireVerification:1];
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIAccountOperationsHelper *)v6 saveAccount:location[0] requireVerification:a4 completion:0];
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 requireVerification:(BOOL)a4 completion:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = v20->_accountOperationsQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke;
  id v12 = &unk_1E6D1FFF8;
  id v13 = location[0];
  char v14 = v20;
  BOOL v16 = v18;
  id v15 = v17;
  dispatch_async(queue, &v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = _ACUILogSystem();
  os_log_type_t v41 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v45, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke", 64, *(void *)(a1 + 32));
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)location[0], v41, "%s (%d) \"Starting account save for %@...\"", v45, 0x1Cu);
  }
  objc_storeStrong(location, 0);
  [*(id *)(a1 + 40) setIsSavingAccount:1];
  id v40 = 0;
  v1 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void *)(a1 + 32);
  id v38 = 0;
  id v14 = (id)[v1 dataclassActionsForAccountSave:v2 error:&v38];
  objc_storeStrong(&v40, v38);
  id v39 = v14;
  id v37 = 0;
  if (!v40)
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v36 = 0;
    id v13 = (id)[v3 _desiredDataclassActionsFromPossibleActions:v39 forAccount:v4 withError:&v36];
    objc_storeStrong(&v40, v36);
    id v5 = v37;
    id v37 = v13;
  }
  id v12 = (id)[*(id *)(a1 + 40) delegate];
  [v12 operationsHelper:*(void *)(a1 + 40) willSaveAccount:*(void *)(a1 + 32)];

  if (v37)
  {
    id v35 = _ACUILogSystem();
    os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v44, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke", 78, (uint64_t)v37, *(void *)(a1 + 32));
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v35, v34, "%s (%d) \"Saving dataclass actions %{public}@ for account %@.\"", v44, 0x26u);
    }
    objc_storeStrong(&v35, 0);
    v11 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v37;
    char v10 = *(unsigned char *)(a1 + 56);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    int v26 = -1073741824;
    int v27 = 0;
    v28 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_3;
    v29 = &unk_1E6D1FFA8;
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 32);
    id v33 = *(id *)(a1 + 48);
    id v32 = v40;
    [v11 saveAccount:v8 withDataclassActions:v9 doVerify:v10 & 1 completion:&v25];
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    [*(id *)(a1 + 40) setIsSavingAccount:0];
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v43, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:requireVerification:completion:]_block_invoke_3", 90, *(void *)(a1 + 32));
      _os_log_debug_impl(&dword_1DDFE5000, oslog, v23, "%s (%d) \"Account save cancelled for %@\"", v43, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = (id)[*(id *)(a1 + 40) delegate];
    [v7 operationsHelper:*(void *)(a1 + 40) didSaveAccount:*(void *)(a1 + 32) withSuccess:0 error:v40];

    if (*(void *)(a1 + 48))
    {
      queue = MEMORY[0x1E4F14428];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      int v17 = -1073741824;
      int v18 = 0;
      v19 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_7;
      id v20 = &unk_1E6D1FFD0;
      id v22 = *(id *)(a1 + 48);
      id v21 = v40;
      dispatch_async(queue, &v16);

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
}

void __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_3(uint64_t a1, char a2, id obj)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v14 = a1;
  [*(id *)(a1 + 32) setIsSavingAccount:0];
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  [v4 operationsHelper:*(void *)(a1 + 32) didSaveAccount:*(void *)(a1 + 40) withSuccess:v16 & 1 error:location];

  if (*(void *)(a1 + 56))
  {
    queue = MEMORY[0x1E4F14428];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_2;
    char v10 = &unk_1E6D1FF80;
    id v12 = *(id *)(a1 + 56);
    char v13 = v16 & 1;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(queue, &v6);

    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

uint64_t __74__ACUIAccountOperationsHelper_saveAccount_requireVerification_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(ACUIAccountOperationsHelper *)v7 saveAccount:location[0] withDataclassActions:v5 requireVerification:1];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [(ACUIAccountOperationsHelper *)v9 saveAccount:location[0] withDataclassActions:v7 requireVerification:a5 completion:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 requireVerification:(BOOL)a5 completion:(id)a6
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  BOOL v21 = a5;
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = v24->_accountOperationsQueue;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  int v11 = -1073741824;
  int v12 = 0;
  char v13 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke;
  uint64_t v14 = &unk_1E6D20048;
  id v15 = v24;
  id v16 = location[0];
  id v17 = v22;
  BOOL v19 = v21;
  id v18 = v20;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  [*(id *)(a1 + 32) setIsSavingAccount:1];
  id v6 = (id)[*(id *)(a1 + 32) delegate];
  [v6 operationsHelper:*(void *)(a1 + 32) willSaveAccount:*(void *)(a1 + 40)];

  location[0] = _ACUILogSystem();
  os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v17, (uint64_t)"-[ACUIAccountOperationsHelper saveAccount:withDataclassActions:requireVerification:completion:]_block_invoke", 115, *(void *)(a1 + 48), *(void *)(a1 + 40));
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)location[0], v15, "%s (%d) \"Saving dataclass actions %{public}@ for account %@\"", v17, 0x26u);
  }
  objc_storeStrong(location, 0);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  char v3 = *(unsigned char *)(a1 + 64);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_8;
  int v11 = &unk_1E6D20020;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 56);
  [v4 saveAccount:v1 withDataclassActions:v2 doVerify:v3 & 1 completion:&v7];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
}

void __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_8(uint64_t a1, char a2, id obj)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v14 = a1;
  [*(id *)(a1 + 32) setIsSavingAccount:0];
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  [v4 operationsHelper:*(void *)(a1 + 32) didSaveAccount:*(void *)(a1 + 40) withSuccess:v16 & 1 error:location];

  if (*(void *)(a1 + 48))
  {
    queue = MEMORY[0x1E4F14428];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    int v9 = __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_2;
    uint64_t v10 = &unk_1E6D1FF80;
    id v12 = *(id *)(a1 + 48);
    char v13 = v16 & 1;
    id v11 = location;
    dispatch_async(queue, &v6);

    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __95__ACUIAccountOperationsHelper_saveAccount_withDataclassActions_requireVerification_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)removeAccount:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_accountOperationsQueue;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke;
  int v8 = &unk_1E6D20098;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke(id *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v51[2] = a1;
  v51[1] = a1;
  [a1[4] setIsRemovingAccount:1];
  id v21 = (id)MEMORY[0x1E4F14428];
  BOOL v19 = MEMORY[0x1E4F14428];
  dispatch_sync(v19, &__block_literal_global_3);

  v51[0] = (id)[*((id *)a1[4] + 1) dataclassActionsForAccountDeletion:a1[5]];
  id v22 = v21;
  dispatch_sync(v22, &__block_literal_global_10);

  char v50 = 0;
  char v48 = 0;
  char IsSyncable = 0;
  if (ACDAccountSyncEnabled())
  {
    id v49 = (id)ACDAccountSyncDevices();
    char v48 = 1;
    char IsSyncable = 0;
    if ([v49 count]) {
      char IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if (v48) {

  }
  char v50 = IsSyncable & 1;
  id v47 = 0;
  if (IsSyncable) {
    id v1 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  else {
    id v1 = (id)[a1[4] _desiredDataclassActionsFromPossibleActions:v51[0] forAccount:a1[5] withError:0];
  }
  id v2 = v47;
  id v47 = v1;

  if (v47)
  {
    char v46 = 1;
    char v45 = 0;
    id v17 = (id)[a1[4] delegate];
    char v43 = 0;
    char v18 = 0;
    if (objc_opt_respondsToSelector())
    {
      char v16 = 1;
      if (v50)
      {
        BOOL v15 = 1;
        if ([a1[5] isActive])
        {
          id v44 = (id)[a1[5] enabledDataclasses];
          char v43 = 1;
          BOOL v15 = [v44 count] == 0;
        }
        char v16 = v15;
      }
      char v18 = v16;
    }
    if (v43) {

    }
    if (v18)
    {
      id v14 = (id)[a1[4] delegate];
      char v46 = [v14 operationsHelper:a1[4] shouldRemoveAccount:a1[5]] & 1;

      goto LABEL_28;
    }
    id v12 = (id)[a1[4] delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v42 = 0;
      id v10 = (id)[a1[4] delegate];
      uint64_t v11 = [v10 operationsHelper:a1[4] shouldRemoveOrDisableAccount:a1[5]];

      uint64_t v42 = v11;
      id location = _ACUILogSystem();
      os_log_type_t v40 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
      {
        id v9 = (id)[NSNumber numberWithInteger:v42];
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v53, (uint64_t)"-[ACUIAccountOperationsHelper removeAccount:]_block_invoke", 167, (uint64_t)v9);
        _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)location, v40, "%s (%d) \"The button index came back with response - %@\"", v53, 0x1Cu);
      }
      objc_storeStrong(&location, 0);
      if (v42 == 1)
      {
        char v46 = 0;
        char v45 = 1;
      }
      else if (v42 == 2)
      {
        char v46 = 1;
        goto LABEL_28;
      }
      char v46 = 0;
    }
LABEL_28:
    if (v46)
    {
      id v8 = (id)[a1[4] delegate];
      [v8 operationsHelper:a1[4] willRemoveAccount:a1[5]];

      uint64_t v32 = MEMORY[0x1E4F143A8];
      int v33 = -1073741824;
      int v34 = 0;
      id v35 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_16;
      id v36 = &unk_1E6D20070;
      id v37 = a1[4];
      id v38 = a1[5];
      id v39 = (id)MEMORY[0x1E01CBE70](&v32);
      [*((id *)a1[4] + 1) removeAccount:a1[5] withDataclassActions:v47 completion:v39];
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v37, 0);
    }
    else if (v45)
    {
      [a1[4] setIsRemovingAccount:0];
      [a1[4] setIsSavingAccount:1];
      id v4 = (id)[MEMORY[0x1E4F1CA80] set];
      objc_msgSend(a1[5], "setEnabledDataclasses:");

      [a1[5] setActive:0];
      id v5 = (id)[a1[4] delegate];
      [v5 operationsHelper:a1[4] willSaveAccount:a1[5]];

      int v7 = (void *)*((void *)a1[4] + 1);
      id v6 = a1[5];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      int v26 = -1073741824;
      int v27 = 0;
      v28 = __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2_18;
      v29 = &unk_1E6D20070;
      id v30 = a1[4];
      id v31 = a1[5];
      [v7 saveVerifiedAccount:v6 withCompletionHandler:&v25];
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      os_log_t oslog = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = (id)[a1[5] identifier];
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v52, (uint64_t)"-[ACUIAccountOperationsHelper removeAccount:]_block_invoke_3", 202, (uint64_t)v3);
        _os_log_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"ACUIAccountOperationsDelegate canceled the removal of account %@.\"", v52, 0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [a1[4] setIsRemovingAccount:0];
    }
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v51, 0);
}

uint64_t __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E4F43630], "beginIgnoringInteractionEvents", a1, a1);
}

uint64_t __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E4F43630], "endIgnoringInteractionEvents", a1, a1);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_16(uint64_t a1, char a2, id obj)
{
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  [*(id *)(a1 + 32) setIsRemovingAccount:0];
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  [v4 operationsHelper:*(void *)(a1 + 32) didRemoveAccount:*(void *)(a1 + 40) withSuccess:v6 & 1 error:location];

  if (v6) {
    ACDAccountSyncMarkAccountDeleted();
  }
  objc_storeStrong(&location, 0);
}

void __45__ACUIAccountOperationsHelper_removeAccount___block_invoke_2_18(uint64_t a1, char a2, id obj)
{
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  [*(id *)(a1 + 32) setIsSavingAccount:0];
  id v4 = (id)[*(id *)(a1 + 32) delegate];
  [v4 operationsHelper:*(void *)(a1 + 32) didSaveAccount:*(void *)(a1 + 40) withSuccess:v6 & 1 error:location];

  objc_storeStrong(&location, 0);
}

- (id)_desiredDataclassActionsFromPossibleActions:(id)a3 forAccount:(id)a4 withError:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v58 = 0;
  objc_storeStrong(&v58, a4);
  v57 = a5;
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  id v33 = (id)[location[0] allKeys];
  uint64_t v34 = [v33 countByEnumeratingWithState:__b objects:v66 count:16];
  if (v34)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    unint64_t v30 = v34;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(v33);
      }
      uint64_t v54 = *(void *)(__b[1] + 8 * v29);
      id v52 = (id)[location[0] objectForKeyedSubscript:v54];
      if ([v52 count] == 1)
      {
        id v25 = v56;
        id v26 = (id)[v52 lastObject];
        objc_msgSend(v25, "setObject:forKey:");
      }
      else
      {
        id v51 = (id)[MEMORY[0x1E4F1CAD0] setWithArray:v52];
        id v24 = v55;
        uint64_t v44 = MEMORY[0x1E4F143A8];
        int v45 = -1073741824;
        int v46 = 0;
        id v47 = __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke;
        char v48 = &unk_1E6D200C0;
        id v49 = v51;
        id v50 = (id)[v24 indexesOfObjectsPassingTest:&v44];
        if ([v50 count])
        {
          id v43 = (id)objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v50, "lastIndex"));
          [v43 addAffectedDataclass:v54];
          objc_storeStrong(&v43, 0);
        }
        else
        {
          id v5 = [ACUIDataclassActionPicker alloc];
          uint64_t v42 = [(ACUIDataclassActionPicker *)v5 initWithActions:v52 affectingAccount:v58];
          [(ACUIDataclassActionPicker *)v42 addAffectedDataclass:v54];
          [v55 addObject:v42];
          objc_storeStrong((id *)&v42, 0);
        }
        objc_storeStrong(&v50, 0);
        objc_storeStrong(&v49, 0);
        objc_storeStrong(&v51, 0);
      }
      objc_storeStrong(&v52, 0);
      ++v29;
      if (v27 + 1 >= v30)
      {
        uint64_t v29 = 0;
        unint64_t v30 = [v33 countByEnumeratingWithState:__b objects:v66 count:16];
        if (!v30) {
          break;
        }
      }
    }
  }

  [v55 sortUsingComparator:&__block_literal_global_27];
  char v41 = 0;
  memset(v39, 0, sizeof(v39));
  id v22 = v55;
  uint64_t v23 = [v22 countByEnumeratingWithState:v39 objects:v65 count:16];
  if (v23)
  {
    uint64_t v19 = *(void *)v39[2];
    uint64_t v20 = 0;
    unint64_t v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)v39[2] != v19) {
        objc_enumerationMutation(v22);
      }
      id v40 = *(id *)(v39[1] + 8 * v20);
      id v17 = [(ACUIAccountOperationsHelper *)v60 delegate];
      id v38 = (id)[(ACUIAccountOperationsDelegate *)v17 operationsHelper:v60 desiredDataclassActionFromPicker:v40];

      if ([v38 type])
      {
        memset(v35, 0, sizeof(v35));
        id v15 = (id)[v40 affectedDataclasses];
        uint64_t v16 = [v15 countByEnumeratingWithState:v35 objects:v64 count:16];
        if (v16)
        {
          uint64_t v12 = *(void *)v35[2];
          uint64_t v13 = 0;
          unint64_t v14 = v16;
          while (1)
          {
            uint64_t v11 = v13;
            if (*(void *)v35[2] != v12) {
              objc_enumerationMutation(v15);
            }
            uint64_t v36 = *(void *)(v35[1] + 8 * v13);
            [v56 setObject:v38 forKey:v36];
            ++v13;
            if (v11 + 1 >= v14)
            {
              uint64_t v13 = 0;
              unint64_t v14 = [v15 countByEnumeratingWithState:v35 objects:v64 count:16];
              if (!v14) {
                break;
              }
            }
          }
        }

        int v37 = 0;
      }
      else
      {
        char v41 = 1;
        int v37 = 4;
      }
      objc_storeStrong(&v38, 0);
      if (v37) {
        break;
      }
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [v22 countByEnumeratingWithState:v39 objects:v65 count:16];
        if (!v21) {
          goto LABEL_29;
        }
      }
    }
  }
  else
  {
LABEL_29:
    int v37 = 0;
  }

  if ((v41 & 1) == 1)
  {
    if (v57)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      v63 = @"User canceled.";
      id v10 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      id v6 = (id)objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"com.apple.accountsui", 0);
      id *v57 = v6;
    }
    id v61 = 0;
    int v37 = 1;
  }
  else
  {
    id v61 = v56;
    int v37 = 1;
  }
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  uint64_t v7 = v61;
  return v7;
}

uint64_t __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[3] = a3;
  v11[2] = a4;
  v11[1] = a1;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = (id)[location[0] actions];
  v11[0] = (id)objc_msgSend(v7, "setWithArray:");

  char v10 = [v11[0] isEqualToSet:a1[4]];
  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

uint64_t __96__ACUIAccountOperationsHelper__desiredDataclassActionsFromPossibleActions_forAccount_withError___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  uint64_t v6 = [location[0] priorityIndex];
  uint64_t v5 = [v7 priorityIndex];
  if (v6 <= v5) {
    uint64_t v9 = v6 < v5;
  }
  else {
    uint64_t v9 = -1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (ACUIAccountOperationsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACUIAccountOperationsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRemovingAccount
{
  return self->_isRemovingAccount;
}

- (void)setIsRemovingAccount:(BOOL)a3
{
  self->_isRemovingAccount = a3;
}

- (BOOL)isSavingAccount
{
  return self->_isSavingAccount;
}

- (void)setIsSavingAccount:(BOOL)a3
{
  self->_isSavingAccount = a3;
}

- (void).cxx_destruct
{
}

@end