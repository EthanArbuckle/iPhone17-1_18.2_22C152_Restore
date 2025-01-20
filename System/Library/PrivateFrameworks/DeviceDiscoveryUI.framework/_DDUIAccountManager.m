@interface _DDUIAccountManager
- (BOOL)enabled;
- (NSMutableDictionary)iCloudToAltDSIDDictionary;
- (NSMutableDictionary)iCloudToNameComponentsDictionary;
- (_DDUIAccountManager)init;
- (void)_findMemberForiCloudAccount:(id)a3 completionHandler:(id)a4;
- (void)_updateMemberDataForiCloudAccount:(id)a3 completion:(id)a4;
- (void)altDsidForiCloudAccount:(id)a3 completion:(id)a4;
- (void)nameComponentsForiCloudAccount:(id)a3 completion:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setICloudToAltDSIDDictionary:(id)a3;
- (void)setICloudToNameComponentsDictionary:(id)a3;
@end

@implementation _DDUIAccountManager

- (_DDUIAccountManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DDUIAccountManager;
  v2 = [(_DDUIAccountManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    iCloudToAltDSIDDictionary = v2->_iCloudToAltDSIDDictionary;
    v2->_iCloudToAltDSIDDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    iCloudToNameComponentsDictionary = v2->_iCloudToNameComponentsDictionary;
    v2->_iCloudToNameComponentsDictionary = (NSMutableDictionary *)v5;

    v2->_enabled = 1;
  }
  return v2;
}

- (void)altDsidForiCloudAccount:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  objc_super v8 = (const char *)*MEMORY[0x263F39800];
  v9 = os_log_create((const char *)*MEMORY[0x263F39800], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_24CAF4000, v9, OS_LOG_TYPE_DEFAULT, "Fetching altDSID for account %@", buf, 0xCu);
  }

  if ([v6 length])
  {
    v10 = [(_DDUIAccountManager *)self iCloudToAltDSIDDictionary];
    v11 = [v10 objectForKeyedSubscript:v6];

    if (v11)
    {
      v12 = os_log_create(v8, "core");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_24CAF4000, v12, OS_LOG_TYPE_DEFAULT, "Found cached altDSID %@", buf, 0xCu);
      }

      v7[2](v7, v11, 1);
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __58___DDUIAccountManager_altDsidForiCloudAccount_completion___block_invoke;
      v13[3] = &unk_2652F32C0;
      v13[4] = self;
      id v14 = v6;
      v15 = v7;
      [(_DDUIAccountManager *)self _updateMemberDataForiCloudAccount:v14 completion:v13];
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)nameComponentsForiCloudAccount:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  objc_super v8 = (const char *)*MEMORY[0x263F39800];
  v9 = os_log_create((const char *)*MEMORY[0x263F39800], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_24CAF4000, v9, OS_LOG_TYPE_DEFAULT, "Fetching name components for account %@", buf, 0xCu);
  }

  if (v6)
  {
    v10 = [(_DDUIAccountManager *)self iCloudToNameComponentsDictionary];
    v11 = [v10 objectForKeyedSubscript:v6];

    if (v11)
    {
      v12 = os_log_create(v8, "core");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_24CAF4000, v12, OS_LOG_TYPE_DEFAULT, "Found cached components %@", buf, 0xCu);
      }

      v7[2](v7, v11, 1);
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __65___DDUIAccountManager_nameComponentsForiCloudAccount_completion___block_invoke;
      v13[3] = &unk_2652F32C0;
      v13[4] = self;
      id v14 = v6;
      v15 = v7;
      [(_DDUIAccountManager *)self _updateMemberDataForiCloudAccount:v14 completion:v13];
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)_updateMemberDataForiCloudAccount:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (const char *)*MEMORY[0x263F39800];
  v9 = os_log_create((const char *)*MEMORY[0x263F39800], "core");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_24CAF4000, v9, OS_LOG_TYPE_DEFAULT, "Fetching account details for %@", buf, 0xCu);
  }

  if ([(_DDUIAccountManager *)self enabled])
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68___DDUIAccountManager__updateMemberDataForiCloudAccount_completion___block_invoke;
    v11[3] = &unk_2652F32E8;
    objc_copyWeak(&v14, (id *)buf);
    id v12 = v6;
    id v13 = v7;
    [(_DDUIAccountManager *)self _findMemberForiCloudAccount:v12 completionHandler:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = os_log_create(v8, "core");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24CAF4000, v10, OS_LOG_TYPE_DEFAULT, "_NWUIAccountManager is disabled, early returning...", buf, 2u);
    }
  }
}

- (void)_findMemberForiCloudAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F3BF48]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke;
  v11[3] = &unk_2652F3310;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 startRequestWithCompletionHandler:v11];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableDictionary)iCloudToAltDSIDDictionary
{
  return self->_iCloudToAltDSIDDictionary;
}

- (void)setICloudToAltDSIDDictionary:(id)a3
{
}

- (NSMutableDictionary)iCloudToNameComponentsDictionary
{
  return self->_iCloudToNameComponentsDictionary;
}

- (void)setICloudToNameComponentsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudToNameComponentsDictionary, 0);
  objc_storeStrong((id *)&self->_iCloudToAltDSIDDictionary, 0);
}

@end