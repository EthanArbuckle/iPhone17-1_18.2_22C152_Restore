@interface ACAccountStore(BRAdditions)
- (id)_br_getAllAppleAccountsWithError:()BRAdditions;
- (id)br_accountForCurrentPersona;
- (id)br_accountForPersona:()BRAdditions;
- (id)br_allEligibleAppleAccountsWithError:()BRAdditions;
- (id)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions withError:;
- (uint64_t)br_allEligibleAppleAccounts;
- (uint64_t)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions;
- (void)invalidateAccountForPersonaCache;
@end

@implementation ACAccountStore(BRAdditions)

- (id)br_accountForPersona:()BRAdditions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (br_accountForPersona__onceToken != -1) {
    dispatch_once(&br_accountForPersona__onceToken, &__block_literal_global_7);
  }
  id obj = (id)_accountForPersona;
  objc_sync_enter(obj);
  v5 = [(id)_accountForPersona objectForKeyedSubscript:@"__defaultPersonaID__"];

  if (!v5)
  {
    v6 = objc_msgSend(a1, "aa_primaryAppleAccount");
    [(id)_accountForPersona setObject:v6 forKeyedSubscript:@"__defaultPersonaID__"];
  }
  v7 = objc_msgSend(v4, "br_personaID");
  if (([v4 isDataSeparatedPersona] & 1) == 0)
  {
    uint64_t v17 = [(id)_accountForPersona objectForKeyedSubscript:@"__defaultPersonaID__"];
    goto LABEL_17;
  }
  v8 = [(id)_accountForPersona objectForKeyedSubscript:v7];

  if (v8) {
    goto LABEL_15;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = objc_msgSend(a1, "br_allEligibleAppleAccounts");
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = (void *)_accountForPersona;
        v15 = objc_msgSend(v13, "br_personaIdentifier");
        [v14 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v10);
  }

  v16 = [(id)_accountForPersona objectForKeyedSubscript:v7];

  if (v16)
  {
LABEL_15:
    uint64_t v17 = [(id)_accountForPersona objectForKeyedSubscript:v7];
LABEL_17:
    v18 = (void *)v17;
    goto LABEL_18;
  }
  v20 = brc_bread_crumbs((uint64_t)"-[ACAccountStore(BRAdditions) br_accountForPersona:]", 109);
  v21 = brc_default_log(1);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    __int16 v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] couldn't find account for persona %@%@", buf, 0x16u);
  }

  v18 = 0;
LABEL_18:

  objc_sync_exit(obj);

  return v18;
}

- (id)br_accountForCurrentPersona
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  v3 = [v2 currentPersona];
  id v4 = objc_msgSend(a1, "br_accountForPersona:", v3);

  return v4;
}

- (id)_br_getAllAppleAccountsWithError:()BRAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  v6 = [a1 accountsWithAccountType:v5];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 118, @"Got nil accounts array back from Accounts Store accountsWithAccountType");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = brc_bread_crumbs((uint64_t)"-[ACAccountStore(BRAdditions) _br_getAllAppleAccountsWithError:]", 45);
      v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        uint64_t v11 = "(passed to caller)";
        int v12 = 136315906;
        v13 = "-[ACAccountStore(BRAdditions) _br_getAllAppleAccountsWithError:]";
        __int16 v14 = 2080;
        if (!a3) {
          uint64_t v11 = "(ignored by caller)";
        }
        v15 = v11;
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v12, 0x2Au);
      }
    }
    if (a3) {
      *a3 = v7;
    }
  }

  return v6;
}

- (uint64_t)br_allEligibleAppleAccounts
{
  return objc_msgSend(a1, "br_allEligibleAppleAccountsWithError:", 0);
}

- (id)br_allEligibleAppleAccountsWithError:()BRAdditions
{
  v1 = objc_msgSend(a1, "_br_getAllAppleAccountsWithError:");
  v2 = objc_msgSend(v1, "br_copy_if:", &__block_literal_global_25);

  return v2;
}

- (uint64_t)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions
{
  return objc_msgSend(a1, "br_allEnabledAppleAccountsIncludingDataSeparated:withError:", a3, 0);
}

- (id)br_allEnabledAppleAccountsIncludingDataSeparated:()BRAdditions withError:
{
  v5 = objc_msgSend(a1, "_br_getAllAppleAccountsWithError:", a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__ACAccountStore_BRAdditions__br_allEnabledAppleAccountsIncludingDataSeparated_withError___block_invoke;
  v8[3] = &__block_descriptor_33_e8_B16__0_8l;
  char v9 = a3;
  v6 = objc_msgSend(v5, "br_copy_if:", v8);

  return v6;
}

- (void)invalidateAccountForPersonaCache
{
  +[BRAccountDescriptor clearAccountDescriptorCache];
  if (_accountForPersona)
  {
    id obj = (id)_accountForPersona;
    objc_sync_enter(obj);
    [(id)_accountForPersona removeAllObjects];
    objc_sync_exit(obj);
  }
}

@end