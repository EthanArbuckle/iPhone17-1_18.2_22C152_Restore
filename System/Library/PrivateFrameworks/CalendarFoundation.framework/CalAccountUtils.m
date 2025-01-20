@interface CalAccountUtils
+ (BOOL)isAccountDataSeparated:(id)a3;
+ (BOOL)isiCloudAccount:(id)a3;
+ (id)_accountStore;
+ (id)personaIdentifierForAccountIdentifier:(id)a3;
@end

@implementation CalAccountUtils

+ (id)_accountStore
{
  if (_accountStore_onceToken != -1) {
    dispatch_once(&_accountStore_onceToken, &__block_literal_global_35);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CalAccountUtils__accountStore__block_invoke_2;
  block[3] = &unk_1E56CD8C0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)_accountStore_queue, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __32__CalAccountUtils__accountStore__block_invoke()
{
  _accountStore_queue = (uint64_t)dispatch_queue_create("CalAccountUtils", 0);

  return MEMORY[0x1F41817F8]();
}

void __32__CalAccountUtils__accountStore__block_invoke_2(uint64_t a1)
{
  if (!_accountStore_store)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)_accountStore_store;
    _accountStore_store = v2;

    v4 = [CalIdleTimer alloc];
    uint64_t v5 = [(CalIdleTimer *)v4 initWithQueue:_accountStore_queue timeoutInSeconds:300 leewayInSeconds:30 timeoutBlock:&__block_literal_global_5_1];
    v6 = (void *)_accountStore_idleTimer;
    _accountStore_idleTimer = v5;

    [(id)_accountStore_idleTimer start];
  }
  [(id)_accountStore_idleTimer poke];
  uint64_t v7 = (void *)_accountStore_store;
  v8 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  objc_storeStrong(v8, v7);
}

void __32__CalAccountUtils__accountStore__block_invoke_2()
{
  v0 = (void *)_accountStore_store;
  _accountStore_store = 0;

  v1 = (void *)_accountStore_idleTimer;
  _accountStore_idleTimer = 0;
}

+ (id)personaIdentifierForAccountIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [a1 _accountStore];
    v6 = [v5 accountWithIdentifier:v4];

    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "cal_personaIdentifier");
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)isAccountDataSeparated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 personaIdentifierForAccountIdentifier:v4];
  if (v5)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__CalAccountUtils_isAccountDataSeparated___block_invoke;
    v8[3] = &unk_1E56CEB40;
    v8[4] = &v9;
    +[CalPersonaUtils performBlockAsPersonaWithIdentifier:v5 block:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __42__CalAccountUtils_isAccountDataSeparated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isDataSeparatedPersona];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)isiCloudAccount:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [a1 _accountStore];
  BOOL v6 = [v5 accountWithIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4F17750];
    v8 = [v6 accountType];
    uint64_t v9 = [v8 identifier];
    if ([v7 isEqualToString:v9])
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v11 = [v6 parentAccount];
      char v12 = [v11 accountType];
      v13 = [v12 identifier];
      char v10 = [v7 isEqualToString:v13];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end