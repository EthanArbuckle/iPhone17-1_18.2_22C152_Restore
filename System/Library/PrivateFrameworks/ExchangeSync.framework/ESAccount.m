@interface ESAccount
+ (id)_leafExchangeAccountTypes;
+ (id)esAccountSubclassWithBackingAccountInfo:(id)a3;
+ (id)oneshotListOfAccountIDs;
+ (void)reacquireClientRestrictions:(id)a3;
- (void)retrieveOofSettingsForConsumer:(id)a3;
- (void)updateOofSettingsWithParams:(id)a3 consumer:(id)a4;
@end

@implementation ESAccount

+ (id)esAccountSubclassWithBackingAccountInfo:(id)a3
{
  id v3 = a3;
  v4 = +[ESAccountLoader sharedInstance];
  v5 = (objc_class *)[v4 daemonAppropriateAccountClassForACAccount:v3];

  v6 = (void *)[[v5 alloc] initWithBackingAccountInfo:v3];
  return v6;
}

+ (id)_leafExchangeAccountTypes
{
  if (_leafExchangeAccountTypes_onceToken != -1) {
    dispatch_once(&_leafExchangeAccountTypes_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_leafExchangeAccountTypes__sLeafAccountTypes;
  return v2;
}

uint64_t __38__ESAccount__leafExchangeAccountTypes__block_invoke()
{
  _leafExchangeAccountTypes__sLeafAccountTypes = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAEB0], *MEMORY[0x263EFAEF8], 0);
  return MEMORY[0x270F9A758]();
}

- (void)updateOofSettingsWithParams:(id)a3 consumer:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_239784000, v6, v7, "Updating oof settings requested on account %@, which does not support it", (uint8_t *)&v9, 0xCu);
  }

  v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:10 userInfo:0];
  [v5 settingsRequestFinishedWithResults:0 status:10 error:v8];
}

- (void)retrieveOofSettingsForConsumer:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    int v8 = 138412290;
    int v9 = self;
    _os_log_impl(&dword_239784000, v5, v6, "Retrieving oof settings requested on account %@, which does not support it", (uint8_t *)&v8, 0xCu);
  }

  os_log_type_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F38F08] code:10 userInfo:0];
  [v4 settingsRequestFinishedWithResults:0 status:10 error:v7];
}

+ (id)oneshotListOfAccountIDs
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = +[ESAccount _leafExchangeAccountTypes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        os_log_type_t v7 = [v3 accountTypeWithAccountTypeIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v7)
        {
          int v8 = [v3 accountsWithAccountType:v7];
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = [*(id *)(*((void *)&v17 + 1) + 8 * j) identifier];
                if (v13) {
                  [v2 addObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (void)reacquireClientRestrictions:(id)a3
{
  id v3 = objc_msgSend(a1, "oneshotListOfAccountIDs", a3);
  id v5 = [v3 allObjects];

  uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 clearUserInfoForClientUUIDs:v5];
}

@end