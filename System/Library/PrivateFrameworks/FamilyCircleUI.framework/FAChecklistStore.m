@interface FAChecklistStore
- (ACAccount)appleAccount;
- (BOOL)screenTimeEnabledForChild:(id)a3;
- (FAChecklistStore)init;
- (FAFamilyCircle)familyCircle;
- (FASharedService)iCloudService;
- (FASharedService)icloudService;
- (FASharedService)locationSharedService;
- (NSNumber)incompleteItems;
- (NSURL)icloudPlusUrl;
- (id)_getLocationSharedService:(id)a3;
- (int64_t)contactManagementEnabledForChild:(id)a3;
- (int64_t)deviceType;
- (unint64_t)_handleSubscriptionListResponse:(id)a3;
- (unint64_t)countMembersIcloudPlus;
- (void)clearChecklistCounts;
- (void)familyLocationSharingStatus:(id)a3;
- (void)fetchIcloudPlusMembership:(id)a3;
- (void)fetchMedicalIDData:(id)a3;
- (void)fetchMyCustodians:(id)a3;
- (void)finishSetup;
- (void)incompleteItems;
- (void)notifyObservable;
- (void)refreshChecklistCount:(id)a3 account:(id)a4 iCloudService:(id)a5 completionHandler:(id)a6;
- (void)setAppleAccount:(id)a3;
- (void)setCountMembersIcloudPlus:(unint64_t)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setIcloudPlusUrl:(id)a3;
- (void)setIcloudService:(id)a3;
- (void)setIncompleteCountFor:(unint64_t)a3 count:(int)a4;
- (void)setIncompleteItems:(id)a3;
- (void)setLocationSharedService:(id)a3;
@end

@implementation FAChecklistStore

- (void)finishSetup
{
  if (!self->_healthStore)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v3 = (void *)getHKHealthStoreClass_softClass_1;
    uint64_t v36 = getHKHealthStoreClass_softClass_1;
    if (!getHKHealthStoreClass_softClass_1)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getHKHealthStoreClass_block_invoke_1;
      v31 = &unk_264348998;
      v32 = &v33;
      __getHKHealthStoreClass_block_invoke_1((uint64_t)&v28);
      v3 = (void *)v34[3];
    }
    v4 = v3;
    _Block_object_dispose(&v33, 8);
    v5 = (HKHealthStore *)objc_alloc_init(v4);
    healthStore = self->_healthStore;
    self->_healthStore = v5;

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v7 = (void *)getHKMedicalIDStoreClass_softClass_1;
    uint64_t v36 = getHKMedicalIDStoreClass_softClass_1;
    if (!getHKMedicalIDStoreClass_softClass_1)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getHKMedicalIDStoreClass_block_invoke_1;
      v31 = &unk_264348998;
      v32 = &v33;
      __getHKMedicalIDStoreClass_block_invoke_1((uint64_t)&v28);
      v7 = (void *)v34[3];
    }
    v8 = v7;
    _Block_object_dispose(&v33, 8);
    v9 = (HKMedicalIDStore *)[[v8 alloc] initWithHealthStore:self->_healthStore];
    medicalIDStore = self->_medicalIDStore;
    self->_medicalIDStore = v9;

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v11 = (void *)get_HKMedicalIDDataClass_softClass_0;
    uint64_t v36 = get_HKMedicalIDDataClass_softClass_0;
    if (!get_HKMedicalIDDataClass_softClass_0)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __get_HKMedicalIDDataClass_block_invoke_0;
      v31 = &unk_264348998;
      v32 = &v33;
      __get_HKMedicalIDDataClass_block_invoke_0((uint64_t)&v28);
      v11 = (void *)v34[3];
    }
    v12 = v11;
    _Block_object_dispose(&v33, 8);
    v13 = (_HKMedicalIDData *)objc_alloc_init(v12);
    medicalIDData = self->_medicalIDData;
    self->_medicalIDData = v13;

    v15 = [MEMORY[0x263F3BA80] sharedInstance];
    session = self->_session;
    self->_session = v15;

    v17 = [MEMORY[0x263F08A48] mainQueue];
    [(FMFSession *)self->_session setDelegateQueue:v17];

    v18 = (AACustodianController *)objc_alloc_init(MEMORY[0x263F257E8]);
    custodianController = self->_custodianController;
    self->_custodianController = v18;

    v20 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    membersWithLocation = self->_membersWithLocation;
    self->_membersWithLocation = v20;

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v22 = (void *)getSTSetupClientClass_softClass;
    uint64_t v36 = getSTSetupClientClass_softClass;
    if (!getSTSetupClientClass_softClass)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getSTSetupClientClass_block_invoke;
      v31 = &unk_264348998;
      v32 = &v33;
      __getSTSetupClientClass_block_invoke((uint64_t)&v28);
      v22 = (void *)v34[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v33, 8);
    v24 = (STSetupClient *)objc_opt_new();
    setupClient = self->_setupClient;
    self->_setupClient = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    incompleteCounts = self->_incompleteCounts;
    self->_incompleteCounts = v26;
  }
}

- (FAChecklistStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)FAChecklistStore;
  v2 = [(FAChecklistStore *)&v9 init];
  v3 = [MEMORY[0x263F82670] currentDevice];
  v2->_deviceType = [v3 userInterfaceIdiom];

  uint64_t v4 = [MEMORY[0x263F290F0] sharedInstance];
  accountManager = v2->_accountManager;
  v2->_accountManager = (AKAccountManager *)v4;

  uint64_t v6 = [(AKAccountManager *)v2->_accountManager primaryAuthKitAccount];
  authKitAccount = v2->_authKitAccount;
  v2->_authKitAccount = (ACAccount *)v6;

  return v2;
}

- (NSNumber)incompleteItems
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  p_computedIncompleteCount = &self->_computedIncompleteCount;
  if (self->_computedIncompleteCount)
  {
    v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(FAChecklistStore *)(id *)p_computedIncompleteCount incompleteItems];
    }

    uint64_t v4 = *p_computedIncompleteCount;
  }
  else
  {
    incompleteCounts = self->_incompleteCounts;
    if (incompleteCounts)
    {
      uint64_t v6 = incompleteCounts;
      if ((unint64_t)[(NSMutableDictionary *)v6 count] > 5)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v8 = [(NSMutableDictionary *)v6 allKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v11 = v9;
          uint64_t v12 = 0;
          uint64_t v13 = *(void *)v26;
          *(void *)&long long v10 = 138412290;
          long long v24 = v10;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v8);
              }
              uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              v16 = -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v15, v24);
              v17 = v16;
              if (v16)
              {
                uint64_t v12 = [v16 intValue] + v12;
                v18 = _FALogSystem();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  int v19 = [v17 intValue];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v30 = v15;
                  __int16 v31 = 1024;
                  int v32 = v19;
                  _os_log_debug_impl(&dword_2189F0000, v18, OS_LOG_TYPE_DEBUG, "FAChecklistStore value for key %@ is %d", buf, 0x12u);
                }
              }
              else
              {
                v18 = _FALogSystem();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v24;
                  uint64_t v30 = v15;
                  _os_log_error_impl(&dword_2189F0000, v18, OS_LOG_TYPE_ERROR, "FAChecklistStore invalid value for key %@", buf, 0xCu);
                }
              }
            }
            uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v11);
        }
        else
        {
          uint64_t v12 = 0;
        }

        v20 = _FALogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          [(FAChecklistStore *)v12 incompleteItems];
        }

        uint64_t v21 = [NSNumber numberWithInt:v12];
        v22 = *p_computedIncompleteCount;
        *p_computedIncompleteCount = (NSNumber *)v21;

        uint64_t v4 = *p_computedIncompleteCount;
      }
      else
      {
        v7 = _FALogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[FAChecklistStore incompleteItems](v7);
        }

        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (void)clearChecklistCounts
{
  computedIncompleteCount = self->_computedIncompleteCount;
  self->_computedIncompleteCount = 0;

  incompleteCounts = self->_incompleteCounts;
  [(NSMutableDictionary *)incompleteCounts removeAllObjects];
}

- (void)setIncompleteCountFor:(unint64_t)a3 count:(int)a4
{
  if (a3 - 1 >= 6)
  {
    int v6 = a3;
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FAChecklistStore setIncompleteCountFor:count:](v6, v7);
    }
  }
  else
  {
    v5 = off_2643494B8[a3 - 1];
    id v8 = [NSNumber numberWithInt:*(void *)&a4];
    [(NSMutableDictionary *)self->_incompleteCounts setObject:v8 forKeyedSubscript:v5];
  }
}

- (void)refreshChecklistCount:(id)a3 account:(id)a4 iCloudService:(id)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(FAChecklistStore *)self clearChecklistCounts];
  [(FAChecklistStore *)self finishSetup];
  uint64_t v30 = v10;
  [(FAChecklistStore *)self setFamilyCircle:v10];
  long long v28 = v12;
  [(FAChecklistStore *)self setIcloudService:v12];
  uint64_t v29 = v11;
  [(FAChecklistStore *)self setAppleAccount:v11];
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke;
  v43[3] = &unk_264349328;
  v43[4] = self;
  uint64_t v15 = v14;
  v44 = v15;
  [(FAChecklistStore *)self familyLocationSharingStatus:v43];
  dispatch_group_enter(v15);
  if (self->_deviceType)
  {
    [(FAChecklistStore *)self setIncompleteCountFor:1 count:0];
    dispatch_group_leave(v15);
  }
  else
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_2;
    v41[3] = &unk_264349350;
    v41[4] = self;
    v42 = v15;
    [(FAChecklistStore *)self fetchMedicalIDData:v41];
  }
  dispatch_group_enter(v15);
  if ([(AKAccountManager *)self->_accountManager canHaveCustodianForAccount:self->_authKitAccount])
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_3;
    v39[3] = &unk_264349378;
    v39[4] = self;
    v40 = v15;
    [(FAChecklistStore *)self fetchMyCustodians:v39];
  }
  else
  {
    [(FAChecklistStore *)self setIncompleteCountFor:3 count:0];
    dispatch_group_leave(v15);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v22 memberType] == 1 || objc_msgSend(v22, "memberType") == 2)
        {
          if ([v22 isMe]) {
            goto LABEL_22;
          }
          int64_t v23 = [(FAChecklistStore *)self contactManagementEnabledForChild:v22];
          BOOL v24 = [(FAChecklistStore *)self screenTimeEnabledForChild:v22];
          if (v23) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v24;
          }
          uint64_t v19 = (v19 + v25);
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v18);
  }
  else
  {
LABEL_22:
    uint64_t v19 = 0;
  }

  [(FAChecklistStore *)self setIncompleteCountFor:5 count:v19];
  dispatch_group_enter(v15);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_4;
  v33[3] = &unk_2643493A0;
  v33[4] = self;
  uint64_t v34 = v15;
  long long v26 = v15;
  [(FAChecklistStore *)self fetchIcloudPlusMembership:v33];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6;
  block[3] = &unk_264349070;
  block[4] = self;
  id v32 = v13;
  id v27 = v13;
  dispatch_group_notify(v26, MEMORY[0x263EF83A0], block);
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a3);
  [*(id *)(a1 + 32) setIncompleteCountFor:2 count:0];
  if (!a2) {
    [*(id *)(a1 + 32) setIncompleteCountFor:2 count:1];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "members", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 memberType] == 1 || objc_msgSend(v13, "memberType") == 2)
        {
          if ([v13 isMe]) {
            goto LABEL_19;
          }
          if (([*(id *)(a1 + 32) screenTimeEnabledForChild:v13] & 1) == 0
            && ([v13 hasAskToBuyEnabled] & 1) == 0)
          {
            if (![*(id *)(*(void *)(a1 + 32) + 64) count]
              || (v14 = *(void **)(*(void *)(a1 + 32) + 64),
                  [v13 appleID],
                  uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                  LOBYTE(v14) = [v14 containsObject:v15],
                  v15,
                  (v14 & 1) == 0))
            {
              uint64_t v10 = (v10 + 1);
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
LABEL_19:
    uint64_t v10 = 0;
  }

  [*(id *)(a1 + 32) setIncompleteCountFor:4 count:v10];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setIncompleteCountFor:1 count:a3 == 0];
  uint64_t v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setIncompleteCountFor:3 count:0];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [*(id *)(a1 + 32) setIncompleteCountFor:3 count:1];
  }
  id v6 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v6);
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_5;
  block[3] = &unk_264348EE8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setCountMembersIcloudPlus:*(void *)(a1 + 48)];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "aa_isCloudSubscriber")) {
    BOOL v2 = *(void *)(a1 + 48) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  [*(id *)(a1 + 32) setIncompleteCountFor:6 count:v2];
  v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

uint64_t __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6(uint64_t a1)
{
  BOOL v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) notifyObservable];
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6_cold_1(v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)familyLocationSharingStatus:(id)a3
{
  id v4 = a3;
  session = self->_session;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__FAChecklistStore_familyLocationSharingStatus___block_invoke;
  v7[3] = &unk_2643493C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FMFSession *)session getHandlesFollowingMyLocation:v7];
}

void __48__FAChecklistStore_familyLocationSharingStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) identifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  if ([v5 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "members", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          if (([v17 isMe] & 1) == 0)
          {
            long long v18 = [v17 appleID];
            unsigned int v19 = [v4 containsObject:v18];

            v14 += v19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchMedicalIDData:(id)a3
{
  id v4 = a3;
  medicalIDStore = self->_medicalIDStore;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__FAChecklistStore_fetchMedicalIDData___block_invoke;
  v7[3] = &unk_264349418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:v7];
}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2;
  v10[3] = &unk_2643493F0;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = *(void **)(a1 + 32);
  if (v3 && ![v3 isEmpty])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v28 = a1;
    id v5 = [*(id *)(a1 + 32) emergencyContacts];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v11 = [v10 nameContactIdentifier];
          uint64_t v12 = [v11 length];

          if (v12)
          {
            uint64_t v13 = [v10 nameContactIdentifier];
            [v2 addObject:v13];
          }
          id v14 = [v10 name];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            long long v16 = [v10 name];
            [v29 addObject:v16];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    a1 = v28;
    long long v17 = [*(id *)(v28 + 48) familyCircle];
    id v4 = [v17 members];

    uint64_t v18 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v18) {
      goto LABEL_30;
    }
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v31;
LABEL_19:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v31 != v21) {
        objc_enumerationMutation(v4);
      }
      long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * v22);
      if ([v23 isMe]) {
        goto LABEL_27;
      }
      long long v24 = [v23 contact];
      long long v25 = [v24 identifier];
      if ([v2 containsObject:v25]) {
        break;
      }
      long long v26 = [v23 fullName];
      int v27 = [v29 containsObject:v26];

      if (v27) {
        goto LABEL_26;
      }
LABEL_27:
      if (v19 == ++v22)
      {
        uint64_t v19 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (!v19)
        {
          a1 = v28;
          goto LABEL_30;
        }
        goto LABEL_19;
      }
    }

LABEL_26:
    ++v20;
    goto LABEL_27;
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2_cold_1((id *)(a1 + 40));
    }
LABEL_30:
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchMyCustodians:(id)a3
{
  id v4 = a3;
  custodianController = self->_custodianController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__FAChecklistStore_fetchMyCustodians___block_invoke;
  v7[3] = &unk_264348CD0;
  id v8 = v4;
  id v6 = v4;
  [(AACustodianController *)custodianController fetchTrustedContactsWithCompletion:v7];
}

void __38__FAChecklistStore_fetchMyCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__FAChecklistStore_fetchMyCustodians___block_invoke_2;
  v5[3] = &unk_264349070;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __38__FAChecklistStore_fetchMyCustodians___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)screenTimeEnabledForChild:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dsid];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F67288]);
    id v6 = [v3 dsid];
    id v7 = (void *)[v5 initWithDSID:v6];

    id v8 = objc_opt_new();
    id v14 = 0;
    id v9 = [v8 currentConfigurationForUser:v7 error:&v14];
    id v10 = v14;
    BOOL v11 = [v9 screenTimeState] == 1;
    if (v10)
    {
      uint64_t v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[FAChecklistStore screenTimeEnabledForChild:](v10);
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)contactManagementEnabledForChild:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dsid];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F67288]);
    id v7 = [v4 dsid];
    id v8 = (void *)[v6 initWithDSID:v7];

    setupClient = self->_setupClient;
    id v15 = 0;
    id v10 = [(STSetupClient *)setupClient currentConfigurationForUser:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      uint64_t v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[FAChecklistStore contactManagementEnabledForChild:]();
      }

      int64_t v13 = 0;
    }
    else
    {
      int64_t v13 = [v10 contactManagementState];
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (void)fetchIcloudPlusMembership:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke;
  v7[3] = &unk_264349468;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAAURLConfigurationWithCompletion:v7];
}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 urlForEndpoint:@"getFamilySubscriptions"];
  id v4 = [FASharedServicesRequest alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 80);
  id v6 = [v3 absoluteString];
  id v7 = [(FASharedServicesRequest *)v4 initWithAppleAccount:v5 urlString:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_2;
  v9[3] = &unk_264349440;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [(AARequest *)v7 performRequestWithHandler:v9];
}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3;
  v12[3] = &unk_2643493F0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3_cold_1(v2);
    }
  }
  else
  {
    [*(id *)(a1 + 40) _handleSubscriptionListResponse:*(void *)(a1 + 48)];
    id v4 = [*(id *)(a1 + 40) _getLocationSharedService:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setLocationSharedService:v4];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (unint64_t)_handleSubscriptionListResponse:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 statusCode] != 200)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[FAChecklistStore _handleSubscriptionListResponse:](v3);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v21 = v3;
  uint64_t v5 = [v3 responseDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"familySharedServices"];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v22 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
        int v13 = [v12 isEqual:@"ICLOUD_STORAGE"];

        if (v13)
        {
          uint64_t v14 = NSURL;
          id v15 = [v11 objectForKeyedSubscript:@"url"];
          id v16 = [v14 URLWithString:v15];
          [(FAChecklistStore *)self setIcloudPlusUrl:v16];

          long long v17 = [v11 objectForKeyedSubscript:@"subscriberDSIDs"];
          uint64_t v18 = [v17 count];

          if (v18)
          {
            uint64_t v19 = [v11 objectForKeyedSubscript:@"subscriberDSIDs"];
            unint64_t v22 = [v19 count];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (id)_getLocationSharedService:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 statusCode] != 200)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[FAChecklistStore _handleSubscriptionListResponse:](v3);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v3, "services", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 name];
        char v12 = [v11 isEqual:@"SHARE_MY_LOCATION"];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_15:

  return v13;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void)setIncompleteItems:(id)a3
{
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
}

- (FASharedService)iCloudService
{
  return self->_iCloudService;
}

- (unint64_t)countMembersIcloudPlus
{
  return self->_countMembersIcloudPlus;
}

- (void)setCountMembersIcloudPlus:(unint64_t)a3
{
  self->_countMembersIcloudPlus = a3;
}

- (NSURL)icloudPlusUrl
{
  return self->_icloudPlusUrl;
}

- (void)setIcloudPlusUrl:(id)a3
{
}

- (FASharedService)locationSharedService
{
  return self->_locationSharedService;
}

- (void)setLocationSharedService:(id)a3
{
}

- (FASharedService)icloudService
{
  return self->_icloudService;
}

- (void)setIcloudService:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSharedService, 0);
  objc_storeStrong((id *)&self->_icloudPlusUrl, 0);
  objc_storeStrong((id *)&self->_iCloudService, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_incompleteItems, 0);
  objc_storeStrong((id *)&self->_computedIncompleteCount, 0);
  objc_storeStrong((id *)&self->_authKitAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_incompleteCounts, 0);
  objc_storeStrong((id *)&self->_icloudService, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_setupClient, 0);
  objc_storeStrong((id *)&self->_membersWithLocation, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_currEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)notifyObservable
{
  id v2 = self;
  FAChecklistStore.notifyObservable()();
}

- (void)incompleteItems
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = [*a1 intValue];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_debug_impl(&dword_2189F0000, a2, OS_LOG_TYPE_DEBUG, "FAChecklistStore precomputed count %d", (uint8_t *)v4, 8u);
}

- (void)setIncompleteCountFor:(int)a1 count:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "FAChecklistStore invalid key %d", (uint8_t *)v2, 8u);
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6_cold_1(id *a1)
{
  v1 = [*a1 incompleteItems];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2189F0000, v2, v3, "FAChecklistStore refreshChecklistCount done, count: %@", v4, v5, v6, v7, v8);
}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2_cold_1(id *a1)
{
  v1 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2189F0000, v2, v3, "Failed to fetch Medical ID Data with error: %@", v4, v5, v6, v7, v8);
}

- (void)screenTimeEnabledForChild:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2189F0000, v2, v3, "Checklist:CurrentConfigurationForUser error: %@", v4, v5, v6, v7, v8);
}

- (void)contactManagementEnabledForChild:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2189F0000, v0, OS_LOG_TYPE_ERROR, "Checking contact management for child, CurrentConfigurationForUser error:%@", v1, 0xCu);
}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3_cold_1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_2189F0000, v2, v3, "Failed to fetch family subscription details with error: %@", v4, v5, v6, v7, v8);
}

- (void)_handleSubscriptionListResponse:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2189F0000, v2, v3, "Failed to get subscription services %@", v4, v5, v6, v7, v8);
}

@end