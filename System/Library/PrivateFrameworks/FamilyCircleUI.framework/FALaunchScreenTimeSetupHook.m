@interface FALaunchScreenTimeSetupHook
- (BOOL)isChildDevice;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (FAACAccountStoreProtocol)accountStore;
- (FAFamilyCircleFetcherProtocol)familyFetcher;
- (FALaunchScreenTimeSetupHook)init;
- (FALaunchScreenTimeSetupHook)initWithAccountStore:(id)a3 screenTimeRequestProvider:(id)a4 childSetupControllerProvider:(id)a5 familyFetcher:(id)a6;
- (FASTChildSetupControllerProviderProtocol)childSetupControllerProvider;
- (FAScreenTimeRequestProviderProtocol)screenTimeRequestProvider;
- (NSDictionary)ephemeralAuthResults;
- (RUIServerHookDelegate)delegate;
- (id)_extractAgeFromObjectModel:(id)a3;
- (id)_extractNameFromObjectModel:(id)a3;
- (id)completionAction;
- (id)extractDSIDFromObjectModel:(id)a3;
- (void)_enableScreentimeWithIntroductionModel:(id)a3 account:(id)a4 dsidNum:(id)a5 completion:(id)a6;
- (void)_launchScreenTimeSettings;
- (void)_launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5;
- (void)_launchScreenTimeSetupForUser:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5;
- (void)_refreshFamilyCircleIfNeededForMemberDSID:(id)a3 completionHandler:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)setChildSetupControllerProvider:(id)a3;
- (void)setCompletionAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEphemeralAuthResults:(id)a3;
- (void)setFamilyFetcher:(id)a3;
- (void)setIsChildDevice:(BOOL)a3;
- (void)setScreenTimeRequestProvider:(id)a3;
@end

@implementation FALaunchScreenTimeSetupHook

- (FALaunchScreenTimeSetupHook)init
{
  v3 = objc_alloc_init(FASTChildSetupControllerProvider);
  id v4 = objc_alloc_init(MEMORY[0x263F3BFB0]);
  v5 = objc_alloc_init(_TtC14FamilyCircleUI21FAFamilyCircleFetcher);
  v6 = [MEMORY[0x263EFB210] defaultStore];
  v7 = [(FALaunchScreenTimeSetupHook *)self initWithAccountStore:v6 screenTimeRequestProvider:v4 childSetupControllerProvider:v3 familyFetcher:v5];

  return v7;
}

- (FALaunchScreenTimeSetupHook)initWithAccountStore:(id)a3 screenTimeRequestProvider:(id)a4 childSetupControllerProvider:(id)a5 familyFetcher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FALaunchScreenTimeSetupHook;
  v15 = [(FALaunchScreenTimeSetupHook *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStore, a3);
    objc_storeStrong((id *)&v16->_screenTimeRequestProvider, a4);
    objc_storeStrong((id *)&v16->_childSetupControllerProvider, a5);
    objc_storeStrong((id *)&v16->_familyFetcher, a6);
  }

  return v16;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:launchScreenTimeSetup"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"family:launchScreenTimeSetup"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(FALaunchScreenTimeSetupHook *)self extractDSIDFromObjectModel:v9];
  [(FALaunchScreenTimeSetupHook *)self _launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:v10 inObjectModel:v9 withCompletion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FALaunchScreenTimeSetupHook *)self extractDSIDFromObjectModel:v7];
  [(FALaunchScreenTimeSetupHook *)self _launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:v8 inObjectModel:v7 withCompletion:v6];
}

- (void)_launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke;
  v14[3] = &unk_2643498B0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(FALaunchScreenTimeSetupHook *)self _refreshFamilyCircleIfNeededForMemberDSID:v13 completionHandler:v14];
}

void __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke_2;
  v3[3] = &unk_2643493F0;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchScreenTimeSetupForUser:*(void *)(a1 + 40) inObjectModel:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];
}

- (void)_launchScreenTimeSetupForUser:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _FALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Launching screentime hook", buf, 2u);
  }

  id v12 = _FALogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138477827;
      id v81 = v8;
      _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "Setting up screen time for dsid %{private}@", buf, 0xCu);
    }

    uint64_t v14 = [(FALaunchScreenTimeSetupHook *)self _extractAgeFromObjectModel:v9];
    uint64_t v15 = [(FALaunchScreenTimeSetupHook *)self _extractNameFromObjectModel:v9];
    id v16 = [(FALaunchScreenTimeSetupHook *)self accountStore];
    id v17 = objc_msgSend(v16, "aa_primaryAppleAccount");

    id v68 = v10;
    id v69 = v8;
    v70 = v17;
    v66 = (void *)v15;
    v67 = (void *)v14;
    if ([(FALaunchScreenTimeSetupHook *)self isChildDevice] || !v17)
    {
      if (v17)
      {
        v26 = [(FALaunchScreenTimeSetupHook *)self screenTimeRequestProvider];
        int v27 = [v26 isScreenTimeSetupForDSID:v8];

        v28 = _FALogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:]();
        }

        int v29 = v27 ^ 1;
      }
      else
      {
        v30 = _FALogSystem();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:]();
        }

        int v29 = 1;
      }
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke;
      aBlock[3] = &unk_264349900;
      v22 = (id *)v75;
      id v31 = v8;
      v75[0] = v31;
      v75[1] = self;
      id v76 = v70;
      id v77 = v9;
      id v78 = v10;
      v32 = _Block_copy(aBlock);
      v33 = [(FALaunchScreenTimeSetupHook *)self childSetupControllerProvider];
      v34 = v33;
      if (v29) {
        uint64_t v35 = [v33 newChildSetupControllerOnChildDeviceWithDSID:v31 childAge:v14 childName:v15 introductionModelCompletionHandler:v32];
      }
      else {
        uint64_t v35 = [v33 newChildSetupControllerWithDSID:v31 updateExistingSettings:1 childAge:v14 childName:v15 introductionModelCompletionHandler:v32];
      }
      v24 = (void *)v35;

      v25 = v76;
    }
    else
    {
      objc_super v18 = _FALogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:](v17, v18);
      }

      v19 = [(FALaunchScreenTimeSetupHook *)self screenTimeRequestProvider];
      uint64_t v20 = [v19 isScreenTimeSetupForDSID:v8];

      v21 = [(FALaunchScreenTimeSetupHook *)self childSetupControllerProvider];
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v71[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_55;
      v71[3] = &unk_264349928;
      v22 = &v72;
      id v23 = v8;
      id v72 = v23;
      id v73 = v10;
      v24 = (void *)[v21 newChildSetupControllerWithDSID:v23 updateExistingSettings:v20 childAge:v14 childName:v15 completionHandler:v71];

      v25 = v73;
    }

    v65 = v24;
    v36 = [v24 initialViewController];
    v37 = [v9 defaultPages];
    v38 = [v37 firstObject];

    [v38 addChildViewController:v36];
    v39 = [v38 view];
    v40 = [v36 view];
    [v39 addSubview:v40];

    v41 = [v36 view];
    [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

    v55 = (void *)MEMORY[0x263F08938];
    v64 = [v36 view];
    v62 = [v64 topAnchor];
    v63 = [v38 view];
    v61 = [v63 topAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v79[0] = v60;
    v59 = [v36 view];
    v57 = [v59 bottomAnchor];
    v58 = [v38 view];
    v56 = [v58 bottomAnchor];
    v54 = [v57 constraintEqualToAnchor:v56];
    v79[1] = v54;
    v53 = [v36 view];
    v51 = [v53 leadingAnchor];
    v52 = [v38 view];
    v50 = [v52 leadingAnchor];
    v42 = [v51 constraintEqualToAnchor:v50];
    v79[2] = v42;
    v43 = [v36 view];
    v44 = [v43 trailingAnchor];
    v45 = [v38 view];
    v46 = [v45 trailingAnchor];
    [v44 constraintEqualToAnchor:v46];
    v48 = id v47 = v9;
    v79[3] = v48;
    v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:4];
    [v55 activateConstraints:v49];

    id v9 = v47;
    [v36 didMoveToParentViewController:v38];

    id v10 = v68;
    id v8 = v69;
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "No dsid present, jumping to screen time settings", buf, 2u);
    }

    [(FALaunchScreenTimeSetupHook *)self _launchScreenTimeSettings];
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _FALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v8;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time Model for %@", buf, 0xCu);
    }

    id v10 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_48;
    v15[3] = &unk_2643498D8;
    id v16 = *(id *)(a1 + 56);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 40);
    id v17 = v12;
    uint64_t v18 = v13;
    id v19 = *(id *)(a1 + 64);
    [v10 _enableScreentimeWithIntroductionModel:v12 account:v9 dsidNum:v11 completion:v15];
  }
  else
  {
    if (v7)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v14;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time should not be enabled, don't save state. %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = [*(id *)(a1 + 32) clientInfo];
  id v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v8 = v7;

  [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"stIntroductionModel"];
  [*(id *)(a1 + 32) setClientInfo:v8];
  uint64_t v9 = [*(id *)(a1 + 48) completionAction];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 48) completionAction];
    uint64_t v11 = (void *)[v8 copy];
    ((void (**)(void, void *))v10)[2](v10, v11);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _FALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_55_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138478083;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = 0;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "conclude screentime flow for %{private}@ %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refreshFamilyCircleIfNeededForMemberDSID:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v17 = v6;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Starting family refresh if needed for dsid: %{private}@", buf, 0xCu);
  }

  __int16 v9 = [(FALaunchScreenTimeSetupHook *)self familyFetcher];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke;
  v12[3] = &unk_264349950;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 fetchCachedFamilyCircleWithQualityOfService:25 completionHandler:v12];
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_cold_1();
    }
  }
  uint64_t v8 = [v5 memberForDSID:*(void *)(a1 + 32)];
  __int16 v9 = _FALogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v23 = v11;
      _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Family member exist locally dsid: %{private}@", buf, 0xCu);
    }

    id v12 = [*(id *)(a1 + 40) screenTimeRequestProvider];
    [v12 forceRefreshScreenTimeForDSID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (v10)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v23 = v13;
      _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Family member with dsid: %{private}@ does not exist locally. Force fetching...", buf, 0xCu);
    }

    uint64_t v14 = [*(id *)(a1 + 40) familyFetcher];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_58;
    v18[3] = &unk_264349950;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(a1 + 48);
    id v19 = v15;
    uint64_t v20 = v16;
    id v21 = v17;
    [v14 forceFetchFamilyCircleWithQualityOfService:25 completionHandler:v18];

    id v12 = v19;
  }
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_58_cold_1();
    }
  }
  uint64_t v8 = [v5 memberForDSID:*(void *)(a1 + 32)];

  if (v8)
  {
    __int16 v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138477827;
      uint64_t v13 = v10;
      _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "Found member for %{private}@ after force fetching", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 40) screenTimeRequestProvider];
  [v11 forceRefreshScreenTimeForDSID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
}

- (void)_enableScreentimeWithIntroductionModel:(id)a3 account:(id)a4 dsidNum:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  int v12 = (objc_class *)MEMORY[0x263F3BFB8];
  id v13 = a3;
  id v14 = [v12 alloc];
  id v15 = [MEMORY[0x263EFF910] date];
  uint64_t v16 = (void *)[v14 initWithIntroductionModel:v13 date:v15 dsid:v10];

  id v17 = _FALogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (a4)
  {
    if (v18) {
      -[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:](v17);
    }

    id v19 = [(FALaunchScreenTimeSetupHook *)self screenTimeRequestProvider];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62;
    v24[3] = &unk_2643499C8;
    v24[4] = self;
    id v25 = v10;
    id v26 = v11;
    id v20 = v11;
    [v19 enableScreenTimeSettingsForDSID:v10 screentimeObject:v16 completionHandler:v24];

    id v21 = v25;
  }
  else
  {
    if (v18) {
      -[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:](v17);
    }

    uint64_t v22 = [(FALaunchScreenTimeSetupHook *)self screenTimeRequestProvider];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke;
    v27[3] = &unk_264349978;
    id v28 = v10;
    id v29 = v16;
    id v30 = v11;
    id v23 = v11;
    [v22 cacheScreenTimeSettingToDiskWithDSID:v10 screentimeObject:v29 completionHandler:v27];

    id v21 = v28;
  }
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _FALogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 BOOLValue];
  uint64_t v8 = _FALogSystem();
  __int16 v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62_cold_1(v9);
    }

    id v10 = [*(id *)(a1 + 32) screenTimeRequestProvider];
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = [*(id *)(a1 + 32) ephemeralAuthResults];
    uint64_t v13 = [v5 BOOLValue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_63;
    v14[3] = &unk_2643499A0;
    id v16 = *(id *)(a1 + 48);
    id v15 = v5;
    [v10 updateScreenTimeServerFlagSettingsForDSID:v11 ephemeralAuthResults:v12 enabled:v13 completionHandler:v14];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62_cold_2((uint64_t)v6, v9);
    }

    (*(void (**)(void, BOOL, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5 != 0, v6);
  }
}

uint64_t __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0, a2);
}

- (id)_extractAgeFromObjectModel:(id)a3
{
  id v3 = [a3 clientInfo];
  id v4 = [v3 objectForKeyedSubscript:@"dependentAge"];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
    id v6 = [v5 numberFromString:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_extractNameFromObjectModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clientInfo];
  id v5 = [v4 objectForKeyedSubscript:@"dependentFirstName"];

  id v6 = [v3 clientInfo];

  int v7 = [v6 objectForKeyedSubscript:@"dependentLastName"];

  id v8 = objc_alloc_init(MEMORY[0x263F08A68]);
  [v8 setGivenName:v5];
  [v8 setFamilyName:v7];
  id v9 = objc_alloc_init(MEMORY[0x263F08A78]);
  [v9 setStyle:1];
  id v10 = [v9 stringFromPersonNameComponents:v8];
  if ([v10 length]) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v5;
  }
  id v12 = v11;

  return v12;
}

- (id)extractDSIDFromObjectModel:(id)a3
{
  id v3 = [a3 clientInfo];
  id v4 = [v3 objectForKeyedSubscript:@"dsid"];

  id v5 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
  [v5 setLocale:v6];

  int v7 = [v5 numberFromString:v4];

  return v7;
}

- (void)_launchScreenTimeSettings
{
  uint64_t v4 = 0;
  v2 = [MEMORY[0x263F3C010] urlDestinationTo:7 error:&v4];
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isChildDevice
{
  return self->_isChildDevice;
}

- (void)setIsChildDevice:(BOOL)a3
{
  self->_isChildDevice = a3;
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
}

- (id)completionAction
{
  return self->_completionAction;
}

- (void)setCompletionAction:(id)a3
{
}

- (FASTChildSetupControllerProviderProtocol)childSetupControllerProvider
{
  return self->_childSetupControllerProvider;
}

- (void)setChildSetupControllerProvider:(id)a3
{
}

- (FAScreenTimeRequestProviderProtocol)screenTimeRequestProvider
{
  return self->_screenTimeRequestProvider;
}

- (void)setScreenTimeRequestProvider:(id)a3
{
}

- (FAACAccountStoreProtocol)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (FAFamilyCircleFetcherProtocol)familyFetcher
{
  return self->_familyFetcher;
}

- (void)setFamilyFetcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyFetcher, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_screenTimeRequestProvider, 0);
  objc_storeStrong((id *)&self->_childSetupControllerProvider, 0);
  objc_storeStrong(&self->_completionAction, 0);
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_launchScreenTimeSetupForUser:inObjectModel:withCompletion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_2189F0000, v0, v1, "%s - running on device with no icloud account %@, %@", v2);
}

- (void)_launchScreenTimeSetupForUser:inObjectModel:withCompletion:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_2189F0000, v0, v1, "%s - running on child device %@, %@", v2);
}

- (void)_launchScreenTimeSetupForUser:(void *)a1 inObjectModel:(NSObject *)a2 withCompletion:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a1, "aa_altDSID");
  int v4 = 136315395;
  id v5 = "-[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:]";
  __int16 v6 = 2113;
  int v7 = v3;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "%s - running on guardian's device %{private}@", (uint8_t *)&v4, 0x16u);
}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2189F0000, v0, v1, "Error setting up screen time for %{private}@ %@");
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2189F0000, v0, v1, "Error fetching cached family for %{private}@ %@");
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2189F0000, v0, v1, "Error force fetching family for %{private}@ %@");
}

- (void)_enableScreentimeWithIntroductionModel:(os_log_t)log account:dsidNum:completion:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "account is nil caching screentime model", v1, 2u);
}

- (void)_enableScreentimeWithIntroductionModel:(os_log_t)log account:dsidNum:completion:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "account is not nil applying screentime model", v1, 2u);
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2189F0000, v0, OS_LOG_TYPE_DEBUG, "FALaunchScreenTimeSetupHook screentime data saved for %@, %@", v1, 0x16u);
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2189F0000, v0, OS_LOG_TYPE_ERROR, "FALaunchScreenTimeSetupHook failed to save screentime data %@, %@", v1, 0x16u);
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:]_block_invoke";
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "FALaunchScreenTimeSetupHook %s: screentime all setup", (uint8_t *)&v1, 0xCu);
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_62_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:]_block_invoke_2";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "FALaunchScreenTimeSetupHook %s: Error Setting up Screentime: %@", (uint8_t *)&v2, 0x16u);
}

@end