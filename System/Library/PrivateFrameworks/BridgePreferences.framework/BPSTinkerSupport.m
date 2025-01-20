@interface BPSTinkerSupport
+ (id)sharedInstance;
- (AKDevice)currentTinkerAKDevice;
- (BOOL)isActiveTinker;
- (BPSTinkerSupport)init;
- (FAFamilyCircle)cachedFamilyCircle;
- (FAFamilyMember)currentTinkerMember;
- (FAFamilyMember)organizerParentFamilyMember;
- (FAFamilyMember)pairingParentFamilyMember;
- (FAProfilePictureStore)profilePictureStore;
- (NSSManager)nssManager;
- (OS_dispatch_queue)queue;
- (id)cachedOrganizerParentFamilyMember;
- (id)cachedPairingParentFamilyMember;
- (id)cachedProfilePictureForFamilyMember:(id)a3;
- (id)cachedTinkerAKDevice;
- (id)cachedTinkerFamilyMemeber;
- (id)familyMemberMatchingAccount:(id)a3 inCircle:(id)a4;
- (void)fetchFamilyDetails;
- (void)fetchProfilePictures;
- (void)getActiveTinkerFamilyDetailsWithCompletion:(id)a3;
- (void)getActiveTinkerFamilyMemberDetailsWithCompletion:(id)a3;
- (void)getActiveTinkerFamilyMemberWithCompletion:(id)a3;
- (void)resetCachedDeviceValues;
- (void)setCachedFamilyCircle:(id)a3;
- (void)setCurrentTinkerAKDevice:(id)a3;
- (void)setCurrentTinkerMember:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setOrganizerParentFamilyMember:(id)a3;
- (void)setPairingParentFamilyMember:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTinkerFamilyMember:(id)a3;
@end

@implementation BPSTinkerSupport

- (id)cachedTinkerFamilyMemeber
{
  if ([(BPSTinkerSupport *)self isActiveTinker]) {
    v3 = self->_currentTinkerMember;
  }
  else {
    v3 = 0;
  }

  return v3;
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BPSTinkerSupport getActiveTinkerFamilyDetailsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v4 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  v5 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  v6 = *(void **)(*(void *)(a1 + 32) + 64);
  *(void *)(*(void *)v4 + 64) = 0;

  v7 = *(void **)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)v4 + 48) = 0;

  v8 = *(void **)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)v4 + 56) = 0;

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_62;
  v44[3] = &unk_2644087C0;
  v44[4] = *(void *)(a1 + 32);
  id v45 = *(id *)(a1 + 40);
  v9 = (void (**)(void, void, void, void))MEMORY[0x21D4A9390](v44);
  if ([*(id *)(a1 + 32) isActiveTinker])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    id v50 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy_;
    v42[4] = __Block_byref_object_dispose_;
    id v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy_;
    v40[4] = __Block_byref_object_dispose_;
    id v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy_;
    v38[4] = __Block_byref_object_dispose_;
    id v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy_;
    v36[4] = __Block_byref_object_dispose_;
    id v37 = 0;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "fetching accounts", v35, 2u);
    }

    v12 = *(void **)(*(void *)(a1 + 32) + 24);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63;
    v30[3] = &unk_2644087E8;
    p_long long buf = &buf;
    v33 = v36;
    v34 = v40;
    v13 = v10;
    v31 = v13;
    [v12 getAccountsInfo:v30];
    dispatch_group_enter(v13);
    id v14 = objc_alloc_init(MEMORY[0x263F3BF48]);
    [v14 setCachePolicy:2];
    v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_21C513000, v15, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest start", v35, 2u);
    }

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_65;
    v26[3] = &unk_264408810;
    v28 = v42;
    v29 = v38;
    v16 = v13;
    v27 = v16;
    [v14 startRequestWithCompletionHandler:v26];
    v17 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_66;
    v19[3] = &unk_264408838;
    v21 = &buf;
    v22 = v42;
    v18 = v9;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v18;
    v23 = v36;
    v24 = v40;
    v25 = v38;
    dispatch_group_notify(v16, v17, v19);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(v42, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v9[2](v9, 0, 0, 0);
  }
}

- (BOOL)isActiveTinker
{
  v2 = BPSGetActiveDevice();
  uint64_t v3 = [v2 valueForProperty:*MEMORY[0x263F575B0]];

  if (!v2)
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = "No active device found";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
LABEL_9:

    BOOL v4 = 0;
    goto LABEL_10;
  }
  if (!v3)
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v6 = "Device is not tinker, so we will not use it for account matching";
      v7 = (uint8_t *)&v9;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v4 = 1;
LABEL_10:

  return v4;
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_62(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  __int16 v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_21C513000, v10, OS_LOG_TYPE_DEFAULT, "Updating current tinker family details", v23, 2u);
  }

  uint64_t v11 = [v9 tinkerFamilyMember];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 64);
  *(void *)(v14 + 64) = v7;
  id v16 = v7;

  uint64_t v17 = [v9 pairingParentFamilyMember];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(void *)(v18 + 48) = v17;

  uint64_t v20 = [v9 organizerParentFamilyMember];
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 56);
  *(void *)(v21 + 56) = v20;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__BPSTinkerSupport_getActiveTinkerFamilyMemberDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = [a2 tinkerFamilyMember];
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v9, v8, v7);
}

uint64_t __62__BPSTinkerSupport_getActiveTinkerFamilyMemberWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

uint64_t __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke_45(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"BPSTinkerSupportFamilyCircleUpdatedNotification" object:0];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 fetchProfilePictures];
}

- (void)fetchFamilyDetails
{
  id v3 = objc_alloc_init(MEMORY[0x263F3BF48]);
  [v3 setCachePolicy:1];
  BOOL v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "fetchFamilyDetails start", buf, 2u);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke;
  v5[3] = &unk_264408728;
  v5[4] = self;
  [v3 startRequestWithCompletionHandler:v5];
}

- (void)getActiveTinkerFamilyMemberWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__BPSTinkerSupport_getActiveTinkerFamilyMemberWithCompletion___block_invoke;
  v6[3] = &unk_264408770;
  id v7 = v4;
  id v5 = v4;
  [(BPSTinkerSupport *)self getActiveTinkerFamilyMemberDetailsWithCompletion:v6];
}

- (void)getActiveTinkerFamilyMemberDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__BPSTinkerSupport_getActiveTinkerFamilyMemberDetailsWithCompletion___block_invoke;
  v6[3] = &unk_264408798;
  id v7 = v4;
  id v5 = v4;
  [(BPSTinkerSupport *)self getActiveTinkerFamilyDetailsWithCompletion:v6];
}

- (void)getActiveTinkerFamilyDetailsWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil replyBlock"];
  }
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x21D4A9390](v4);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "Reply block: %@", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke;
  v9[3] = &unk_264408860;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

uint64_t __34__BPSTinkerSupport_sharedInstance__block_invoke()
{
  sharedInstance__instance = objc_alloc_init(BPSTinkerSupport);

  return MEMORY[0x270F9A758]();
}

- (BPSTinkerSupport)init
{
  v10.receiver = self;
  v10.super_class = (Class)BPSTinkerSupport;
  v2 = [(BPSTinkerSupport *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AccountRetrieval", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v5 = (void *)getNSSManagerClass_softClass;
    uint64_t v15 = getNSSManagerClass_softClass;
    if (!getNSSManagerClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getNSSManagerClass_block_invoke;
      v11[3] = &unk_264408888;
      v11[4] = &v12;
      __getNSSManagerClass_block_invoke((uint64_t)v11);
      id v5 = (void *)v13[3];
    }
    uint64_t v6 = v5;
    _Block_object_dispose(&v12, 8);
    uint64_t v7 = [[v6 alloc] initWithQueue:v2->_queue];
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v7;
  }
  return v2;
}

void __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "fetchFamilyDetails complete, error: %@", buf, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v5;
  id v11 = v5;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BPSTinkerSupport_fetchFamilyDetails__block_invoke_45;
  block[3] = &unk_264408700;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)fetchProfilePictures
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_cachedFamilyCircle == 0;
  id v4 = pbb_bridge_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[BPSTinkerSupport fetchProfilePictures]";
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "%s: can't fetch without family circle", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[BPSTinkerSupport fetchProfilePictures]";
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "%s: fetching profile pictures", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v6 = (void *)getFAProfilePictureStoreClass_softClass;
    uint64_t v15 = getFAProfilePictureStoreClass_softClass;
    if (!getFAProfilePictureStoreClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v17 = __getFAProfilePictureStoreClass_block_invoke;
      uint64_t v18 = &unk_264408888;
      v19 = &v12;
      __getFAProfilePictureStoreClass_block_invoke((uint64_t)&buf);
      id v6 = (void *)v13[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v12, 8);
    id v8 = [v7 alloc];
    uint64_t v9 = objc_msgSend(v8, "initWithFamilyCircle:", self->_cachedFamilyCircle, v12);
    profilePictureStore = self->_profilePictureStore;
    p_profilePictureStore = (id *)&self->_profilePictureStore;
    id *p_profilePictureStore = (id)v9;

    [*p_profilePictureStore fetchProfileImagesWithCompletion:&__block_literal_global_50];
  }
}

void __40__BPSTinkerSupport_fetchProfilePictures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = pbb_bridge_log();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 localizedDescription];
      int v9 = 136315394;
      objc_super v10 = "-[BPSTinkerSupport fetchProfilePictures]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = (uint64_t)v8;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "%s: error %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      objc_super v10 = "-[BPSTinkerSupport fetchProfilePictures]_block_invoke";
      __int16 v11 = 2048;
      uint64_t v12 = [v4 count];
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "%s: fetched %lu profile pictures", (uint8_t *)&v9, 0x16u);
    }

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_53);
  }
}

void __40__BPSTinkerSupport_fetchProfilePictures__block_invoke_51()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"BPSTinkerSupportProfilePicturesUpdatedNotification" object:0];
}

- (void)resetCachedDeviceValues
{
  currentTinkerMember = self->_currentTinkerMember;
  self->_currentTinkerMember = 0;

  currentTinkerAKDevice = self->_currentTinkerAKDevice;
  self->_currentTinkerAKDevice = 0;
}

- (FAFamilyCircle)cachedFamilyCircle
{
  return self->_cachedFamilyCircle;
}

- (id)cachedProfilePictureForFamilyMember:(id)a3
{
  id v4 = a3;
  profilePictureStore = self->_profilePictureStore;
  if (profilePictureStore
    && ([(FAProfilePictureStore *)profilePictureStore profilePictureForFamilyMember:v4 pictureDiameter:36.0], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    id v8 = (void *)MEMORY[0x263F1C6B0];
    int v9 = [MEMORY[0x263F1C920] mainScreen];
    [v9 scale];
    objc_super v10 = objc_msgSend(v8, "imageWithData:scale:", v7);
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)cachedTinkerAKDevice
{
  if ([(BPSTinkerSupport *)self isActiveTinker]) {
    BOOL v3 = self->_currentTinkerAKDevice;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)setTinkerFamilyMember:(id)a3
{
}

- (id)cachedPairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (id)cachedOrganizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v41 = a2;
  id v42 = a3;
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v42;
    _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "fetching accounts complete. error %@", (uint8_t *)&buf, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v5 = v42;
  if (!v42)
  {
    v40 = objc_opt_new();
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v6 = (void *)getkNSSAccountsKeySymbolLoc_ptr;
    uint64_t v51 = getkNSSAccountsKeySymbolLoc_ptr;
    if (!getkNSSAccountsKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v54 = __getkNSSAccountsKeySymbolLoc_block_invoke;
      v55 = &unk_264408888;
      v56 = &v48;
      uint64_t v7 = (void *)NanoSystemSettingsLibrary();
      id v8 = dlsym(v7, "kNSSAccountsKey");
      *(void *)(v56[1] + 24) = v8;
      getkNSSAccountsKeySymbolLoc_ptr = *(void *)(v56[1] + 24);
      uint64_t v6 = (void *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v6) {
      goto LABEL_28;
    }
    int v9 = [v41 objectForKeyedSubscript:*v6];
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    objc_super v10 = (id *)getkNSSAKDeviceKeySymbolLoc_ptr;
    uint64_t v51 = getkNSSAKDeviceKeySymbolLoc_ptr;
    if (!getkNSSAKDeviceKeySymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v54 = __getkNSSAKDeviceKeySymbolLoc_block_invoke;
      v55 = &unk_264408888;
      v56 = &v48;
      __int16 v11 = (void *)NanoSystemSettingsLibrary();
      uint64_t v12 = dlsym(v11, "kNSSAKDeviceKey");
      *(void *)(v56[1] + 24) = v12;
      getkNSSAKDeviceKeySymbolLoc_ptr = *(void *)(v56[1] + 24);
      objc_super v10 = (id *)v49[3];
    }
    _Block_object_dispose(&v48, 8);
    if (!v10)
    {
LABEL_28:
      __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
LABEL_29:
      __break(1u);
    }
    id v13 = *v10;
    uint64_t v14 = [v41 objectForKeyedSubscript:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLinkType:2];
    uint64_t v17 = pbb_bridge_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_21C513000, v17, OS_LOG_TYPE_DEFAULT, "watch AKDevice :%@", (uint8_t *)&buf, 0xCu);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v45;
      uint64_t v22 = *MEMORY[0x263EFAE58];
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x2020000000;
          v25 = (void *)getkNSSAccountTypeKeySymbolLoc_ptr;
          uint64_t v51 = getkNSSAccountTypeKeySymbolLoc_ptr;
          if (!getkNSSAccountTypeKeySymbolLoc_ptr)
          {
            *(void *)&long long buf = MEMORY[0x263EF8330];
            *((void *)&buf + 1) = 3221225472;
            v54 = __getkNSSAccountTypeKeySymbolLoc_block_invoke;
            v55 = &unk_264408888;
            v56 = &v48;
            v26 = (void *)NanoSystemSettingsLibrary();
            v27 = dlsym(v26, "kNSSAccountTypeKey");
            *(void *)(v56[1] + 24) = v27;
            getkNSSAccountTypeKeySymbolLoc_ptr = *(void *)(v56[1] + 24);
            v25 = (void *)v49[3];
          }
          _Block_object_dispose(&v48, 8);
          if (!v25)
          {
            __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1();
            goto LABEL_29;
          }
          v28 = [v24 objectForKeyedSubscript:*v25];
          if ([v28 isEqualToString:v22])
          {
            v29 = getkNSSAccountDSIDKey();
            v30 = [v24 objectForKeyedSubscript:v29];
            v31 = getkNSSAccountDSIDKey();
            [v40 setObject:v30 forKeyedSubscript:v31];

            v32 = getkNSSAccountAltDSIDKey();
            v33 = [v24 objectForKeyedSubscript:v32];
            v34 = getkNSSAccountAltDSIDKey();
            [v40 setObject:v33 forKeyedSubscript:v34];

            v35 = getkNSSAccountUsernameKey();
            v36 = [v24 objectForKeyedSubscript:v35];
            id v37 = getkNSSAccountUsernameKey();
            [v40 setObject:v36 forKeyedSubscript:v37];

            goto LABEL_25;
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v20);
    }
LABEL_25:

    uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
    id v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v40;

    id v5 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 localizedDescription];
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest complete, error: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
  id v14 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_66(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    BOOL v3 = [*(id *)(a1 + 32) familyMemberMatchingAccount:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inCircle:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    id v4 = objc_opt_new();
    [v4 setTinkerFamilyMember:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "members", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v10 isMe] && objc_msgSend(v10, "isParent")) {
            [v4 setPairingParentFamilyMember:v10];
          }
          if ([v10 isOrganizer]) {
            [v4 setOrganizerParentFamilyMember:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)familyMemberMatchingAccount:(id)a3 inCircle:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [a4 members];
  uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = [v7 altDSID];
        uint64_t v9 = getkNSSAccountAltDSIDKey();
        objc_super v10 = [v5 objectForKeyedSubscript:v9];
        char v11 = [v8 isEqualToString:v10];

        if (v11) {
          goto LABEL_15;
        }
        long long v12 = [v7 dsid];
        uint64_t v13 = [v12 stringValue];
        if (v13)
        {
          long long v14 = (void *)v13;
          int v15 = [v7 dsid];
          uint64_t v16 = [v15 stringValue];
          uint64_t v17 = getkNSSAccountDSIDKey();
          uint64_t v18 = [v5 objectForKeyedSubscript:v17];
          char v19 = [v16 isEqualToString:v18];

          if (v19) {
            goto LABEL_15;
          }
        }
        else
        {
        }
        uint64_t v20 = [v7 appleID];
        uint64_t v21 = getkNSSAccountUsernameKey();
        uint64_t v22 = [v5 objectForKeyedSubscript:v21];
        char v23 = [v20 isEqualToString:v22];

        if (v23)
        {
LABEL_15:
          id v24 = v7;
          goto LABEL_17;
        }
      }
      id v24 = 0;
      uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v24 = 0;
  }
LABEL_17:

  return v24;
}

- (void)setCachedFamilyCircle:(id)a3
{
}

- (FAProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FAFamilyMember)currentTinkerMember
{
  return self->_currentTinkerMember;
}

- (void)setCurrentTinkerMember:(id)a3
{
}

- (FAFamilyMember)pairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (void)setPairingParentFamilyMember:(id)a3
{
}

- (FAFamilyMember)organizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

- (void)setOrganizerParentFamilyMember:(id)a3
{
}

- (AKDevice)currentTinkerAKDevice
{
  return self->_currentTinkerAKDevice;
}

- (void)setCurrentTinkerAKDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTinkerAKDevice, 0);
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_currentTinkerMember, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);

  objc_storeStrong((id *)&self->_cachedFamilyCircle, 0);
}

uint64_t __63__BPSTinkerSupport_getActiveTinkerFamilyDetailsWithCompletion___block_invoke_63_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getNSSManagerClass_block_invoke_cold_1(v0);
}

@end