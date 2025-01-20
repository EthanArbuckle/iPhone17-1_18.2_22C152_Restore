@interface CDPDTermsInfoBackupController
- (id)_buildSecureBackupTermsInfo:(id)a3;
- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4;
- (void)saveTermsAcceptance:(id)a3 completion:(id)a4;
@end

@implementation CDPDTermsInfoBackupController

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Saving terms acceptance: %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(CDPDTermsInfoBackupController *)self _buildSecureBackupTermsInfo:v6];
  [MEMORY[0x263F32998] saveTermsAcceptance:v9 reply:v7];
}

- (id)_buildSecureBackupTermsInfo:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F329A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25BC0]];
  [v5 setVersion:v6];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25BD8]];
  [v5 setIcloudVersion:v7];

  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25AB8]];
  [v5 setCountryCode:v8];

  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25B00]];
  [v5 setMetadata:v9];

  int v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25A30]];

  [v5 setAltDSID:v10];
  return v5;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke;
  aBlock[3] = &unk_26432EC10;
  id v15 = v5;
  id v6 = v5;
  id v7 = a3;
  v8 = _Block_copy(aBlock);
  v9 = (void *)MEMORY[0x263F32998];
  int v10 = objc_msgSend(v7, "aa_altDSID");

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_25;
  v12[3] = &unk_26432EC10;
  id v13 = v8;
  id v11 = v8;
  [v9 getAcceptedTermsForAltDSID:v10 reply:v12];
}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    id v6 = (objc_class *)MEMORY[0x263EFF9A0];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    v9 = [v5 version];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F25BC0]];

    int v10 = [v5 icloudVersion];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F25BD8]];

    id v11 = [v5 countryCode];
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F25AB8]];

    uint64_t v12 = [v5 metadata];
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F25B00]];

    id v13 = [v5 altDSID];
    [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x263F25A30]];

    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Fetched accepted terms with result: %@", (uint8_t *)&v17, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void (**)(uint64_t, void, id))(v15 + 16);
    id v8 = a3;
    v16(v15, 0, v8);
  }
}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_25_cold_1((uint64_t)v4, v5);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void __75__CDPDTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Error fetching terms acceptance %@", (uint8_t *)&v2, 0xCu);
}

@end