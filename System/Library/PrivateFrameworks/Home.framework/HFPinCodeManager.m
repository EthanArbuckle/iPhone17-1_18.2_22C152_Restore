@interface HFPinCodeManager
+ (id)asciiStringForLocalizedPINString:(id)a3 error:(id *)a4;
- (BOOL)isAccessoryFetchInProgress;
- (HFPinCodeDataStore)dataStore;
- (HFPinCodeManager)initWithHome:(id)a3;
- (HMAccessCodeManager)accessCodeManager;
- (HMHome)home;
- (NAFuture)constraintsFuture;
- (NAFuture)inProgressFetchFromAccessories;
- (NSArray)constraints;
- (NSHashTable)observers;
- (id)_buildDataStoreWithAccessoryAccessCodeFetch:(id)a3;
- (id)_deleteGuestPinCode:(id)a3;
- (id)_deleteUnknownGuestFromMatterPinCode:(id)a3;
- (id)_fetchAccessCodesFromAccessories;
- (id)_fetchAccessoryConstraints;
- (id)_fetchCachedAccessoryAccessCodes;
- (id)_modificationCompletionHandlerForFuture:(id)a3;
- (id)_submitModificationRequests:(id)a3;
- (id)_updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withUserInfo:(id)a5;
- (id)addGuestPinCode:(id)a3 withLabel:(id)a4 onAccessories:(id)a5;
- (id)checkForValidationErrorsWithPINCodeValue:(id)a3 originalPINCode:(id)a4;
- (id)currentUserPinCode;
- (id)deleteGuestPinCodeWithItem:(id)a3;
- (id)deleteUserPinCodeWithUser:(id)a3;
- (id)enablePinCodesForAllUsersOnNewAccessory:(id)a3;
- (id)enablePinCodesForNewAccessory:(id)a3 forGuestItems:(id)a4;
- (id)fetchFromAccessories;
- (id)fetchFromAccessoryCache;
- (id)generateNewCodeValue;
- (id)guestPinCodes;
- (id)guestUserInformation;
- (id)hasValidConstraints;
- (id)otherEcosystemGuestPinCodes;
- (id)pinCodeForCodeValue:(id)a3;
- (id)refreshDataStore;
- (id)removedUserPINCodes;
- (id)restoreFullAccessForUserWithItem:(id)a3;
- (id)revokeAccessForAllRemovedUsers;
- (id)setPinCodeWithItem:(id)a3 enabled:(BOOL)a4 onAccessories:(id)a5;
- (id)setUserPinCode:(id)a3 forUser:(id)a4;
- (id)updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withLabel:(id)a5;
- (id)updateGuestPinCodeWithItem:(id)a3 withLabel:(id)a4;
- (id)updatePinCodeWithItem:(id)a3 withCodeValue:(id)a4;
- (id)userPinCodes;
- (int64_t)fetchInProgress;
- (void)_addNewHomeAccessCode:(id)a3 toStore:(id)a4;
- (void)_fetchPinCodeConstraints:(id)a3;
- (void)_kickoff;
- (void)_reloadObservers;
- (void)accessCodeManager:(id)a3 didAddAccessoryAccessCodes:(id)a4;
- (void)accessCodeManager:(id)a3 didAddHomeAccessCodes:(id)a4;
- (void)accessCodeManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4;
- (void)accessCodeManager:(id)a3 didRemoveHomeAccessCodes:(id)a4;
- (void)accessCodeManager:(id)a3 didUpdateHomeAccessCodes:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)executionEnvironmentRunningStateDidChange:(id)a3;
- (void)fetchPinCodeConstraints:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setAccessCodeManager:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setConstraintsFuture:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setFetchInProgress:(int64_t)a3;
- (void)setHome:(id)a3;
- (void)setInProgressFetchFromAccessories:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation HFPinCodeManager

- (HFPinCodeManager)initWithHome:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFPinCodeManager;
  v6 = [(HFPinCodeManager *)&v14 init];
  if (v6)
  {
    v7 = +[HFHomeKitDispatcher sharedDispatcher];
    [v7 addHomeObserver:v6];

    v8 = +[HFExecutionEnvironment sharedInstance];
    [v8 addObserver:v6];

    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    v6->_fetchInProgress = 0;
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v11 = [v5 createAccessCodeManager];
    accessCodeManager = v6->_accessCodeManager;
    v6->_accessCodeManager = (HMAccessCodeManager *)v11;

    [(HMAccessCodeManager *)v6->_accessCodeManager addObserver:v6];
    [(HFPinCodeManager *)v6 _kickoff];
  }

  return v6;
}

- (void)dealloc
{
  [(HMAccessCodeManager *)self->_accessCodeManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HFPinCodeManager;
  [(HFPinCodeManager *)&v3 dealloc];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 supportsAccessCodes])
  {
    v6 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Re-fetching access code constraints because accessory was added %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(HFPinCodeManager *)self _fetchAccessoryConstraints];
  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 supportsAccessCodes])
  {
    v6 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Re-fetching access code constraints because accessory was removed %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(HFPinCodeManager *)self _fetchAccessoryConstraints];
  }
}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  if (![a3 runningState]) {
    id v4 = [(HFPinCodeManager *)self fetchFromAccessories];
  }
}

- (id)_fetchCachedAccessoryAccessCodes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(HFPinCodeManager *)self setFetchInProgress:[(HFPinCodeManager *)self fetchInProgress] + 1];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Starting to fetch accessory access codes from cache with future: %p", buf, 0xCu);
  }

  id v5 = [(HFPinCodeManager *)self accessCodeManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HFPinCodeManager__fetchCachedAccessoryAccessCodes__block_invoke;
  v9[3] = &unk_264094618;
  id v6 = v3;
  id v10 = v6;
  uint64_t v11 = self;
  [v5 fetchCachedAccessoryAccessCodesWithCompletion:v9];

  id v7 = v6;
  return v7;
}

void __52__HFPinCodeManager__fetchCachedAccessoryAccessCodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = &stru_26C081158;
    if (v6) {
      id v9 = v6;
    }
    int v11 = 134218242;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Received response fetching PIN Codes from cache with future: %p %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = *(void **)(a1 + 32);
  if (v6) {
    [v10 finishWithError:v6];
  }
  else {
    [v10 finishWithResult:v5];
  }
  objc_msgSend(*(id *)(a1 + 40), "setFetchInProgress:", objc_msgSend(*(id *)(a1 + 40), "fetchInProgress") - 1);
}

- (id)_fetchAccessCodesFromAccessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(HFPinCodeManager *)self setFetchInProgress:[(HFPinCodeManager *)self fetchInProgress] + 1];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Starting to fetch accessory access codes directly from accessories with future: %p", buf, 0xCu);
  }

  id v5 = [(HFPinCodeManager *)self accessCodeManager];
  id v6 = [(HFPinCodeManager *)self accessCodeManager];
  id v7 = [v6 accessoriesSupportingAccessCodes];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__HFPinCodeManager__fetchAccessCodesFromAccessories__block_invoke;
  v11[3] = &unk_264094618;
  id v8 = v3;
  id v12 = v8;
  __int16 v13 = self;
  [v5 fetchAccessCodesFromAccessories:v7 completion:v11];

  id v9 = v8;
  return v9;
}

void __52__HFPinCodeManager__fetchAccessCodesFromAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = &stru_26C081158;
    if (v6) {
      id v9 = v6;
    }
    int v11 = 134218242;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Received response fetching PIN Codes directly from accessories with future: %p %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = *(void **)(a1 + 32);
  if (v6) {
    [v10 finishWithError:v6];
  }
  else {
    [v10 finishWithResult:v5];
  }
  objc_msgSend(*(id *)(a1 + 40), "setFetchInProgress:", objc_msgSend(*(id *)(a1 + 40), "fetchInProgress") - 1);
}

- (id)_buildDataStoreWithAccessoryAccessCodeFetch:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HFPinCodeManager *)self setFetchInProgress:[(HFPinCodeManager *)self fetchInProgress] + 1];
  id v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HFPinCodeManager *)self accessCodeManager];
    *(_DWORD *)buf = 138412546;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "PIN Code Manager %@, Access Code Manager %@ Starting to build data store", buf, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_initWeak((id *)buf, self);
  uint64_t v8 = [(HFPinCodeManager *)self accessCodeManager];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke;
  v20[3] = &unk_264096BA8;
  objc_copyWeak(&v22, (id *)buf);
  id v9 = v7;
  id v21 = v9;
  [v8 fetchHomeAccessCodesWithCompletion:v20];

  id v10 = (void *)MEMORY[0x263F58190];
  v23[0] = v9;
  v23[1] = v4;
  int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  uint64_t v12 = [MEMORY[0x263F581B8] mainThreadScheduler];
  __int16 v13 = [v10 combineAllFutures:v11 ignoringErrors:1 scheduler:v12];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_58;
  v19[3] = &unk_26408FAA0;
  v19[4] = self;
  uint64_t v14 = [v13 flatMap:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_61;
  v17[3] = &unk_264096BD0;
  objc_copyWeak(&v18, (id *)buf);
  uint64_t v15 = [v14 addSuccessBlock:v17];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  return v15;
}

void __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    uint64_t v8 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Received an error fetching PIN Codes from iCloud: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    id v9 = objc_alloc_init(HFPinCodeDataStore);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(WeakRetained, "_addNewHomeAccessCode:toStore:", *(void *)(*((void *)&v20 + 1) + 8 * v14++), v9, (void)v20);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v12);
    }

    uint64_t v15 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(HFPinCodeDataStore *)v9 userPINCodes];
      uint64_t v17 = [v16 count];
      id v18 = [(HFPinCodeDataStore *)v9 guestPINCodes];
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      v29 = &stru_26C081158;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Fetched %lu user PIN codes and %lu guest PIN codes from iCloud. %@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithResult:v9];
  }
}

id __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v37 = a1;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 objectAtIndex:0];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  v38 = v2;
  id v6 = [v2 objectAtIndex:1];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v48;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v9;
        id v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
        uint64_t v11 = HFLogForCategory(0x33uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [v10 accessoryAccessCodes];
          uint64_t v13 = [v12 count];
          uint64_t v14 = [v10 accessory];
          *(_DWORD *)buf = 134218242;
          uint64_t v53 = v13;
          __int16 v54 = 2112;
          v55 = v14;
          _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Fetched %lu PIN codes from accessory %@.", buf, 0x16u);
        }
        uint64_t v15 = [v10 error];

        if (v15)
        {
          uint64_t v16 = HFLogForCategory(0x33uLL);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v33 = [v10 accessory];
            v34 = [v10 error];
            *(_DWORD *)buf = 138412546;
            uint64_t v53 = (uint64_t)v33;
            __int16 v54 = 2112;
            v55 = v34;
            _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Received an error fetching PIN Codes from Accessory: %@ - %@", buf, 0x16u);
          }
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v17 = objc_msgSend(v10, "accessoryAccessCodes", v37);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
              long long v23 = [v22 accessCodeValue];
              v24 = [v23 stringValue];

              uint64_t v25 = [v5 guestPINCodes];
              __int16 v26 = [v25 objectForKey:v24];

              if (v26) {
                goto LABEL_26;
              }
              uint64_t v27 = [v5 userPINCodes];
              __int16 v26 = [v27 objectForKey:v24];

              if (v26
                || ([v5 removedUserPINCodes],
                    __int16 v28 = objc_claimAutoreleasedReturnValue(),
                    [v28 objectForKey:v24],
                    __int16 v26 = (HFPinCode *)objc_claimAutoreleasedReturnValue(),
                    v28,
                    v26))
              {
LABEL_26:
                [(HFPinCode *)v26 addAccessoryAccessCode:v22];
              }
              else
              {
                __int16 v26 = [[HFPinCode alloc] initWithAccessoryAccessCode:v22];
                if ([v24 length])
                {
                  v29 = [v5 guestPINCodes];
                  v30 = [v22 accessCodeValue];
                  uint64_t v31 = [v30 stringValue];
                  [v29 setValue:v26 forKey:v31];
                }
                else
                {
                  v29 = [v5 otherEcosystemGuestPINCodes];
                  v30 = [(HFPinCode *)v26 unknownMatterGuestUniqueID];
                  [v29 setValue:v26 forKey:v30];
                }
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v32 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
            uint64_t v19 = v32;
          }
          while (v32);
        }

        uint64_t v9 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v41);
  }

  objc_msgSend(*(id *)(v37 + 32), "setFetchInProgress:", objc_msgSend(*(id *)(v37 + 32), "fetchInProgress") - 1);
  v35 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v35;
}

void __64__HFPinCodeManager__buildDataStoreWithAccessoryAccessCodeFetch___block_invoke_61(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setDataStore:v3];

  [WeakRetained _reloadObservers];
}

- (id)_fetchAccessoryConstraints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HFPinCodeManager *)self accessCodeManager];
  id v4 = [v3 accessoriesSupportingAccessCodes];

  id v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v4 count];
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Starting to fetch constraints from accessories: %lu", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x263F58190]);
  [(HFPinCodeManager *)self setConstraintsFuture:v6];
  objc_initWeak((id *)buf, self);
  id v7 = [(HFPinCodeManager *)self accessCodeManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke;
  v10[3] = &unk_264096BA8;
  objc_copyWeak(&v12, (id *)buf);
  id v8 = v6;
  id v11 = v8;
  [v7 fetchAccessCodeConstraintsFromAccessories:v4 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v8;
}

void __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_msgSend(v5, "na_map:", &__block_literal_global_129);
  [WeakRetained setConstraints:v8];
  uint64_t v9 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218754;
    uint64_t v14 = [v8 count];
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %lu constraints from accessories. Response: %@ Error: %@ constraints: %@", (uint8_t *)&v13, 0x2Au);
  }

  uint64_t v10 = [v8 count];
  id v11 = *(void **)(a1 + 32);
  if (v10)
  {
    [v11 finishWithResult:v8];
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 73);
    [v11 finishWithError:v12];
  }
}

uint64_t __46__HFPinCodeManager__fetchAccessoryConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 constraints];
}

- (void)_kickoff
{
  id v3 = [(HFPinCodeManager *)self fetchFromAccessoryCache];
  id v4 = [(HFPinCodeManager *)self fetchFromAccessories];
  id v5 = [(HFPinCodeManager *)self _fetchAccessoryConstraints];
}

- (void)_addNewHomeAccessCode:(id)a3 toStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HFPinCode alloc] initWithHomeAccessCode:v6];
  uint64_t v9 = [v6 userInformation];
  uint64_t v10 = [v9 user];

  if (v10)
  {
    uint64_t v42 = v9;
    id v11 = [v7 userPINCodes];
    id v12 = [(HFPinCode *)v8 pinCodeValue];
    int v13 = [v11 valueForKey:v12];

    if (v13)
    {
      uint64_t v14 = HFLogForCategory(0x33uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Adding a new User Pin Code, we seem to already have one with the same value", buf, 2u);
      }
    }
    __int16 v15 = [v7 userPINCodes];
    id v16 = [(HFPinCode *)v8 pinCodeValue];
    [v15 setValue:v8 forKey:v16];

    __int16 v17 = [(HFPinCodeManager *)self home];
    id v18 = [v17 currentUser];
    __int16 v19 = [v18 uniqueIdentifier];
    uint64_t v20 = [v6 userInformation];
    uint64_t v21 = [v20 user];
    long long v22 = [v21 uniqueIdentifier];
    int v23 = [v19 isEqual:v22];

    uint64_t v9 = v42;
    if (v23) {
      [v7 setCurrentUserPinCode:v8];
    }
  }
  else
  {
    v24 = [v9 removedUserInfo];

    if (v24)
    {
      uint64_t v25 = [v7 userPINCodes];
      __int16 v26 = [(HFPinCode *)v8 pinCodeValue];
      uint64_t v27 = [v25 valueForKey:v26];

      if (v27)
      {
        __int16 v28 = HFLogForCategory(0x33uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v44 = 0;
          _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "Adding a removed User Pin Code, we seem to already have one with the same value", v44, 2u);
        }
      }
      v29 = [v7 removedUserPINCodes];
      v30 = [(HFPinCode *)v8 pinCodeValue];
      [v29 setValue:v8 forKey:v30];
    }
    else
    {
      uint64_t v31 = [v7 guestPINCodes];
      uint64_t v32 = [(HFPinCode *)v8 pinCodeValue];
      v33 = [v31 valueForKey:v32];

      if (!v33) {
        goto LABEL_18;
      }
      v34 = HFLogForCategory(0x33uLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v43 = 0;
        _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "Adding a new Guest Pin Code, we seem to already have one with the same value", v43, 2u);
      }

      v35 = [v33 userLabel];
      v36 = [v35 simpleLabel];
      uint64_t v37 = [(HFPinCode *)v8 userLabel];
      v38 = [v37 simpleLabel];
      char v39 = [v36 isEqualToString:v38];

      if ((v39 & 1) == 0)
      {
LABEL_18:
        uint64_t v40 = [v7 guestPINCodes];
        uint64_t v41 = [(HFPinCode *)v8 pinCodeValue];
        [v40 setValue:v8 forKey:v41];
      }
    }
  }
}

- (void)setFetchInProgress:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = self->_fetchInProgress <= 0;
  }
  int v5 = !v4;
  self->_fetchInProgress = a3;
  if (a3 < 0)
  {
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_Fetchinprogres.isa, v6);
    if (!v5) {
      return;
    }
  }
  else if (!v5)
  {
    return;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(HFPinCodeManager *)self observers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 pinCodeManagerFetchDidComplete:self];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)isAccessoryFetchInProgress
{
  return [(HFPinCodeManager *)self fetchInProgress] > 0;
}

- (id)fetchFromAccessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HFPinCodeManager *)self inProgressFetchFromAccessories];

  if (v3)
  {
    BOOL v4 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [(HFPinCodeManager *)self inProgressFetchFromAccessories];
      *(_DWORD *)buf = 134217984;
      long long v15 = v5;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Skipping fetch from accessories because a fetch is already in progress %p", buf, 0xCu);
    }
    uint64_t v6 = [(HFPinCodeManager *)self inProgressFetchFromAccessories];
  }
  else
  {
    id v7 = [(HFPinCodeManager *)self _fetchAccessCodesFromAccessories];
    uint64_t v8 = [(HFPinCodeManager *)self _buildDataStoreWithAccessoryAccessCodeFetch:v7];
    [(HFPinCodeManager *)self setInProgressFetchFromAccessories:v8];

    objc_initWeak((id *)buf, self);
    uint64_t v9 = [(HFPinCodeManager *)self inProgressFetchFromAccessories];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__HFPinCodeManager_fetchFromAccessories__block_invoke;
    v12[3] = &unk_264096C18;
    objc_copyWeak(&v13, (id *)buf);
    id v10 = (id)[v9 addCompletionBlock:v12];

    uint64_t v6 = [(HFPinCodeManager *)self inProgressFetchFromAccessories];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

void __40__HFPinCodeManager_fetchFromAccessories__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInProgressFetchFromAccessories:0];
}

- (id)fetchFromAccessoryCache
{
  id v3 = [(HFPinCodeManager *)self _fetchCachedAccessoryAccessCodes];
  BOOL v4 = [(HFPinCodeManager *)self _buildDataStoreWithAccessoryAccessCodeFetch:v3];

  return v4;
}

- (id)refreshDataStore
{
  id v3 = [(HFPinCodeManager *)self fetchFromAccessoryCache];
  BOOL v4 = [(HFPinCodeManager *)self constraints];
  uint64_t v5 = [v4 count];

  if (!v5) {
    id v6 = [(HFPinCodeManager *)self _fetchAccessoryConstraints];
  }
  id v7 = [(HFPinCodeManager *)self fetchFromAccessories];
  return v3;
}

- (id)userPinCodes
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFPinCodeManager *)self dataStore];
  BOOL v4 = [v3 userPINCodes];
  uint64_t v5 = [v4 allValues];
  id v6 = [v2 futureWithResult:v5];

  return v6;
}

- (id)removedUserPINCodes
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFPinCodeManager *)self dataStore];
  BOOL v4 = [v3 removedUserPINCodes];
  uint64_t v5 = [v4 allValues];
  id v6 = [v2 futureWithResult:v5];

  return v6;
}

- (id)guestPinCodes
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFPinCodeManager *)self dataStore];
  BOOL v4 = [v3 guestPINCodes];
  uint64_t v5 = [v4 allValues];
  id v6 = [v2 futureWithResult:v5];

  return v6;
}

- (id)guestUserInformation
{
  id v2 = [(HFPinCodeManager *)self dataStore];
  id v3 = [v2 guestPINCodes];
  BOOL v4 = [v3 allValues];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_73);

  return v5;
}

uint64_t __40__HFPinCodeManager_guestUserInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userLabel];
}

- (id)otherEcosystemGuestPinCodes
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFPinCodeManager *)self dataStore];
  BOOL v4 = [v3 otherEcosystemGuestPINCodes];
  uint64_t v5 = [v4 allValues];
  id v6 = [v2 futureWithResult:v5];

  return v6;
}

- (id)currentUserPinCode
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFPinCodeManager *)self dataStore];
  BOOL v4 = [v3 currentUserPinCode];
  uint64_t v5 = [v2 futureWithResult:v4];

  return v5;
}

- (id)pinCodeForCodeValue:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F58190];
  id v5 = a3;
  id v6 = [(HFPinCodeManager *)self dataStore];
  id v7 = [v6 pinCodeForCodeValue:v5];

  uint64_t v8 = [v4 futureWithResult:v7];

  return v8;
}

- (id)addGuestPinCode:(id)a3 withLabel:(id)a4 onAccessories:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = [v10 count];
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Adding guest pin code on %lu accessories", buf, 0xCu);
  }

  if ([v8 length])
  {
    objc_initWeak((id *)buf, self);
    id v12 = (void *)MEMORY[0x263F58190];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke;
    v22[3] = &unk_264096990;
    objc_copyWeak(&v26, (id *)buf);
    id v23 = v9;
    id v13 = v8;
    id v24 = v13;
    id v25 = v10;
    long long v14 = [v12 futureWithBlock:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_4;
    v20[3] = &unk_2640945A0;
    void v20[4] = self;
    id v21 = v13;
    long long v15 = [v14 flatMap:v20];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v16 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    __int16 v17 = (void *)MEMORY[0x263F58190];
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    long long v15 = [v17 futureWithError:v18];
  }
  return v15;
}

void __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained dataStore];
  id v6 = [v5 guestPINCodes];
  id v7 = [v6 allValues];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2;
  v49[3] = &unk_264096C60;
  long long v50 = (HFPinCode *)*(id *)(a1 + 32);
  int v8 = objc_msgSend(v7, "na_any:", v49);

  if (v8)
  {
    id v9 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "There is already a guest PIN Code with this label. Aborting", buf, 2u);
    }

    id v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 76);
    [v3 finishWithError:v10];

    id v11 = v50;
  }
  else
  {
    v34 = v3;

    id v12 = (void *)[objc_alloc(MEMORY[0x263F0DEE8]) initWithSimpleLabel:*(void *)(a1 + 32)];
    id v13 = [[HFPinCode alloc] initWithLabel:v12 accessCodeValue:*(void *)(a1 + 40) accessoryAccessCodes:0];
    long long v14 = [WeakRetained dataStore];
    long long v15 = [v14 guestPINCodes];
    v33 = v13;
    [v15 setValue:v13 forKey:*(void *)(a1 + 40)];

    [WeakRetained _reloadObservers];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:*(void *)(a1 + 40)];
    __int16 v17 = [MEMORY[0x263EFF980] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = (void *)[objc_alloc(MEMORY[0x263F0DEA8]) initWithAccessCodeValue:v16 accessory:*(void *)(*((void *)&v44 + 1) + 8 * v22)];
          [v17 addObject:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v20);
    }

    id v24 = objc_alloc_init(MEMORY[0x263F58190]);
    id v25 = [WeakRetained accessCodeManager];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_79;
    v41[3] = &unk_26408C8C8;
    id v42 = v12;
    id v43 = v24;
    id v26 = v24;
    id v27 = v12;
    [v25 setUserInformation:v27 forHomeAccessCodeWithValue:v16 completion:v41];

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_81;
    v39[3] = &unk_2640945F0;
    v39[4] = WeakRetained;
    id v40 = v17;
    id v28 = v17;
    uint64_t v29 = [v26 flatMap:v39];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2_83;
    v37[3] = &unk_26408C8A0;
    id v3 = v34;
    id v30 = v34;
    id v38 = v30;
    uint64_t v31 = [v29 addSuccessBlock:v37];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_3;
    v35[3] = &unk_26408CDF0;
    id v36 = v30;
    id v32 = (id)[v31 addFailureBlock:v35];

    id v11 = v33;
  }
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  BOOL v4 = [v3 simpleLabel];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Received response to setting iCloud User Info for new guest %@: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v3) {
    [v6 finishWithError:v3];
  }
  else {
    [v6 finishWithNoResult];
  }
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_81(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitModificationRequests:*(void *)(a1 + 40)];
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_2_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

uint64_t __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

id __60__HFPinCodeManager_addGuestPinCode_withLabel_onAccessories___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataStore];
  id v3 = [v2 pinCodeForCodeValue:*(void *)(a1 + 40)];

  BOOL v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)setUserPinCode:(id)a3 forUser:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Setting user pin code for user %@", buf, 0xCu);
  }

  if ([v6 length])
  {
    __int16 v9 = [(HFPinCodeManager *)self dataStore];
    id v10 = [v9 userPINCodes];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke;
    v30[3] = &unk_264096C88;
    id v11 = v7;
    id v31 = v11;
    id v12 = objc_msgSend(v10, "na_firstKeyPassingTest:", v30);

    if (v12)
    {
      id v13 = [(HFPinCodeManager *)self dataStore];
      long long v14 = [v13 userPINCodes];
      [v14 removeObjectForKey:v12];
    }
    long long v15 = (void *)[objc_alloc(MEMORY[0x263F0DEE8]) initWithUser:v11];
    uint64_t v16 = [[HFPinCode alloc] initWithLabel:v15 accessCodeValue:v6 accessoryAccessCodes:0];
    __int16 v17 = [(HFPinCodeManager *)self dataStore];
    id v18 = [v17 userPINCodes];
    [v18 setValue:v16 forKey:v6];

    id v19 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v20 = [(HFPinCodeManager *)self accessCodeManager];
    uint64_t v21 = [v11 uniqueIdentifier];
    uint64_t v22 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v19];
    [v20 setAccessCode:v6 forUserWithUUID:v21 completion:v22];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke_2;
    v28[3] = &unk_2640945A0;
    v28[4] = self;
    id v29 = v6;
    id v23 = [v19 flatMap:v28];

    id v24 = v31;
  }
  else
  {
    id v25 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v25, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    id v26 = (void *)MEMORY[0x263F58190];
    id v24 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v23 = [v26 futureWithError:v24];
  }

  return v23;
}

uint64_t __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = [a3 userLabel];
  uint64_t v5 = [v4 user];
  id v6 = [v5 uniqueIdentifier];
  id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v8 = [v6 isEqual:v7];

  return v8;
}

id __43__HFPinCodeManager_setUserPinCode_forUser___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataStore];
  id v3 = [v2 pinCodeForCodeValue:*(void *)(a1 + 40)];

  BOOL v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)deleteGuestPinCodeWithItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HFPinCodeManager.m", 693, @"Invalid parameter not satisfying: %@", @"pinCodeItem" object file lineNumber description];
  }
  id v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Deleting guest pin code.", buf, 2u);
  }

  id v7 = [(HFPinCodeManager *)self dataStore];
  uint64_t v8 = [v7 guestPinCodeFromItem:v5];

  if ([v5 isUnknownGuestFromMatter]) {
    [(HFPinCodeManager *)self _deleteUnknownGuestFromMatterPinCode:v8];
  }
  else {
  __int16 v9 = [(HFPinCodeManager *)self _deleteGuestPinCode:v8];
  }

  return v9;
}

- (id)_deleteUnknownGuestFromMatterPinCode:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HFPinCodeManager.m", 710, @"Invalid parameter not satisfying: %@", @"pinCode" object file lineNumber description];
  }
  id v6 = [v5 unknownMatterGuestUniqueID];

  if (v6)
  {
    id v7 = [(HFPinCodeManager *)self dataStore];
    uint64_t v8 = [v7 otherEcosystemGuestPINCodes];
    __int16 v9 = [v5 unknownMatterGuestUniqueID];
    [v8 removeObjectForKey:v9];

    [(HFPinCodeManager *)self _reloadObservers];
    id v10 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v5 accessoryAccessCodes];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F0DED0]) initWithAccessoryAccessCode:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [(HFPinCodeManager *)self _submitModificationRequests:v10];
  }
  else
  {
    id v18 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[HFPinCodeManager _deleteUnknownGuestFromMatterPinCode:]";
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "(%s) Expected an unknown guest from Matter PIN Code, but got this: %@", buf, 0x16u);
    }

    id v19 = (void *)MEMORY[0x263F58190];
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    uint64_t v17 = [v19 futureWithError:v10];
  }
  uint64_t v20 = (void *)v17;

  return v20;
}

- (id)_deleteGuestPinCode:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HFPinCodeManager.m", 735, @"Invalid parameter not satisfying: %@", @"pinCode" object file lineNumber description];
  }
  id v6 = [v5 pinCodeValue];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [(HFPinCodeManager *)self dataStore];
    __int16 v9 = [v8 guestPINCodes];
    id v10 = [v5 pinCodeValue];
    [v9 removeObjectForKey:v10];

    [(HFPinCodeManager *)self _reloadObservers];
    id v11 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v12 = [(HFPinCodeManager *)self accessCodeManager];
    uint64_t v13 = [v5 pinCodeValue];
    uint64_t v14 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v11];
    [v12 removeSimpleLabelAccessCode:v13 completion:v14];
  }
  else
  {
    long long v15 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Attempted to delete a guest PIN Code that has no value: %@", buf, 0xCu);
    }

    id v16 = [(HFPinCodeManager *)self fetchFromAccessoryCache];
    uint64_t v17 = (void *)MEMORY[0x263F58190];
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v11 = [v17 futureWithError:v12];
  }

  return v11;
}

- (id)deleteUserPinCodeWithUser:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Deleting user PIN Code for user: %@", buf, 0xCu);
  }
  uint64_t v7 = [(HFPinCodeManager *)self dataStore];
  uint64_t v8 = [v7 userPINCodes];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__HFPinCodeManager_deleteUserPinCodeWithUser___block_invoke;
  v18[3] = &unk_264096C88;
  id v19 = v4;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "na_firstKeyPassingTest:", v18);

  if (v10)
  {
    id v11 = [(HFPinCodeManager *)self dataStore];
    uint64_t v12 = [v11 userPINCodes];
    [v12 removeObjectForKey:v10];
  }
  id v13 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v14 = [(HFPinCodeManager *)self accessCodeManager];
  long long v15 = [v9 uniqueIdentifier];
  id v16 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v13];
  [v14 setAccessCode:0 forUserWithUUID:v15 completion:v16];

  return v13;
}

uint64_t __46__HFPinCodeManager_deleteUserPinCodeWithUser___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 userLabel];
  id v5 = [v4 user];
  id v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v8 = [v6 isEqual:v7];

  return v8;
}

- (id)updateGuestPinCodeWithItem:(id)a3 withLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFPinCodeManager.m", 788, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];
  }
  id v9 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Updating guest PIN Code with new label", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v10 = (void *)MEMORY[0x263F58190];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke;
  v16[3] = &unk_264096CB0;
  objc_copyWeak(&v19, buf);
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v10 futureWithBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);

  return v13;
}

void __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained dataStore];
  id v7 = [v6 guestPinCodeFromItem:*(void *)(a1 + 32)];

  id v8 = objc_alloc(MEMORY[0x263F0DEF8]);
  id v9 = [v7 pinCodeValue];
  id v10 = (void *)[v8 initWithStringValue:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F0DEE8]) initWithSimpleLabel:*(void *)(a1 + 40)];
  [v7 setUserLabel:v11];
  [WeakRetained _reloadObservers];
  id v12 = [WeakRetained accessCodeManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke_2;
  v14[3] = &unk_2640924E8;
  objc_copyWeak(&v16, v4);
  id v13 = v3;
  id v15 = v13;
  [v12 setUserInformation:v11 forHomeAccessCodeWithValue:v10 completion:v14];

  objc_destroyWeak(&v16);
}

void __57__HFPinCodeManager_updateGuestPinCodeWithItem_withLabel___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Received response from iCloud for updating guest PIN Code label: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = (id)[WeakRetained fetchFromAccessoryCache];

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

- (id)updatePinCodeWithItem:(id)a3 withCodeValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFPinCodeManager.m", 833, @"Invalid parameter not satisfying: %@", @"newCodeValue" object file lineNumber description];
  }
  uint64_t v9 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Updating pin code with new code value", buf, 2u);
  }

  id v10 = [v7 user];
  if (v10)
  {
    id v11 = [(HFPinCodeManager *)self setUserPinCode:v8 forUser:v10];
  }
  else
  {
    id v12 = [(HFPinCodeManager *)self dataStore];
    id v13 = [v12 pinCodeFromItem:v7];

    uint64_t v14 = [v13 userLabel];
    id v11 = [(HFPinCodeManager *)self _updateGuestPinCodeWithItem:v7 withCodeValue:v8 withUserInfo:v14];
  }
  return v11;
}

- (id)updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withLabel:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HFPinCodeManager *)self dataStore];
  id v12 = [v11 guestPINCodes];
  id v13 = [v8 pinCodeValue];
  uint64_t v14 = [v12 objectForKey:v13];

  if (!v14)
  {
    id v18 = [(HFPinCodeManager *)self dataStore];
    id v19 = [v18 userPINCodes];
    uint64_t v20 = [v8 pinCodeValue];
    id v21 = [v19 objectForKey:v20];

    uint64_t v22 = HFLogForCategory(0x33uLL);
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        int v29 = 136315138;
        __int16 v30 = "-[HFPinCodeManager updateGuestPinCodeWithItem:withCodeValue:withLabel:]";
        long long v24 = "(%s) Expected a guest PIN Code, but found a user code instead.";
LABEL_14:
        _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v29, 0xCu);
      }
    }
    else if (v23)
    {
      int v29 = 136315138;
      __int16 v30 = "-[HFPinCodeManager updateGuestPinCodeWithItem:withCodeValue:withLabel:]";
      long long v24 = "(%s) Could not find PIN Code in data store.";
      goto LABEL_14;
    }

    id v25 = [(HFPinCodeManager *)self fetchFromAccessoryCache];
    long long v26 = (void *)MEMORY[0x263F58190];
    id v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    uint64_t v17 = [v26 futureWithError:v16];
    goto LABEL_10;
  }
  id v15 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Updating guest pin code with new code value and label", (uint8_t *)&v29, 2u);
  }

  id v16 = (void *)[objc_alloc(MEMORY[0x263F0DEE8]) initWithSimpleLabel:v10];
  uint64_t v17 = [(HFPinCodeManager *)self _updateGuestPinCodeWithItem:v8 withCodeValue:v9 withUserInfo:v16];
LABEL_10:
  id v27 = (void *)v17;

  return v27;
}

- (id)_updateGuestPinCodeWithItem:(id)a3 withCodeValue:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HFPinCodeManager *)self dataStore];
  id v12 = [v11 pinCodeFromItem:v8];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v9];
  uint64_t v14 = [[HFPinCode alloc] initWithLabel:v10 accessCodeValue:v9 accessoryAccessCodes:0];
  id v15 = [(HFPinCodeManager *)self dataStore];
  id v16 = [v12 pinCodeValue];
  [v15 updateWithPinCode:v14 forOldCodeValue:v16];

  [(HFPinCodeManager *)self _reloadObservers];
  uint64_t v17 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Removing current home access code ahead of replacing it with new value", (uint8_t *)buf, 2u);
  }

  id v18 = objc_alloc_init(MEMORY[0x263F58190]);
  id v19 = [(HFPinCodeManager *)self accessCodeManager];
  uint64_t v20 = [v12 pinCodeValue];
  id v21 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v18];
  [v19 removeSimpleLabelAccessCode:v20 completion:v21];

  objc_initWeak(buf, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke;
  v28[3] = &unk_264096D28;
  objc_copyWeak(&v33, buf);
  id v22 = v10;
  id v29 = v22;
  id v23 = v13;
  id v30 = v23;
  id v24 = v12;
  id v31 = v24;
  id v25 = v9;
  id v32 = v25;
  long long v26 = [v18 flatMap:v28];

  objc_destroyWeak(&v33);
  objc_destroyWeak(buf);

  return v26;
}

id __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke(id *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v19 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v4 = (void *)MEMORY[0x263F58190];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2;
  v31[3] = &unk_264096CD8;
  id v21 = WeakRetained;
  v31[4] = WeakRetained;
  id v32 = a1[4];
  id v33 = a1[5];
  location = &v34;
  objc_copyWeak(&v34, a1 + 8);
  id v22 = [v4 futureWithBlock:v31];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [a1[6] accessoryAccessCodes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x263F0DEA8]);
        id v12 = a1[5];
        id v13 = objc_msgSend(v10, "accessory", v19, location);
        uint64_t v14 = (void *)[v11 initWithAccessCodeValue:v12 accessory:v13];

        [v5 addObject:v14];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v7);
  }

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_109;
  v25[3] = &unk_2640945A0;
  v25[4] = v21;
  id v15 = v5;
  id v26 = v15;
  id v16 = [v22 flatMap:v25];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2_110;
  v23[3] = &unk_264096D00;
  v23[4] = v21;
  id v24 = a1[7];
  uint64_t v17 = [v16 flatMap:v23];

  objc_destroyWeak(location);
  return v17;
}

void __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Add new home access code", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 32) accessCodeManager];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_108;
  v9[3] = &unk_2640924E8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v8 = v3;
  id v10 = v8;
  [v5 setUserInformation:v6 forHomeAccessCodeWithValue:v7 completion:v9];

  objc_destroyWeak(&v11);
}

void __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_108(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Got response from adding home access code: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = (id)[WeakRetained fetchFromAccessoryCache];

    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

uint64_t __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_109(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitModificationRequests:*(void *)(a1 + 40)];
}

id __75__HFPinCodeManager__updateGuestPinCodeWithItem_withCodeValue_withUserInfo___block_invoke_2_110(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "All operations for updating PIN Code have completed: %@", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 32) _reloadObservers];
  id v5 = [*(id *)(a1 + 32) dataStore];
  id v6 = [v5 pinCodeForCodeValue:*(void *)(a1 + 40)];

  int v7 = [MEMORY[0x263F58190] futureWithResult:v6];

  return v7;
}

- (id)_modificationCompletionHandlerForFuture:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HFPinCodeManager__modificationCompletionHandlerForFuture___block_invoke;
  aBlock[3] = &unk_264096BA8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __60__HFPinCodeManager__modificationCompletionHandlerForFuture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v43 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v57 = v5;
    __int16 v58 = 2112;
    uint64_t v59 = (uint64_t)v6;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Received response to access code modification requests: %@ %@", buf, 0x16u);
  }

  long long v45 = [MEMORY[0x263EFF980] array];
  id v44 = v6;
  if (v5) {
    id v9 = 0;
  }
  else {
    id v9 = v6;
  }
  id v42 = v9;
  long long v46 = [MEMORY[0x263EFF980] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v48 = *(void *)v50;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v50 != v48) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(NSObject **)(*((void *)&v49 + 1) + 8 * v12);
        uint64_t v14 = [v13 accessoryAccessCode];
        id v15 = [v14 accessCodeValue];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v13 accessCodeValue];
        }
        id v18 = v17;

        id v19 = [WeakRetained dataStore];
        uint64_t v20 = [v18 stringValue];
        id v21 = [v19 pinCodeForCodeValue:v20];

        id v22 = [v13 error];

        if (v22)
        {
          id v23 = WeakRetained;
          id v24 = [v13 error];
          id v25 = HFLogForCategory(0x33uLL);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [v13 accessory];
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v24;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v26;
            _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "Access Code Modification Response has an error: %@ accessory: %@", buf, 0x16u);
          }
          long long v27 = [v13 accessory];
          char v28 = [v27 supportsCHIP];

          unint64_t v29 = [v13 operationType];
          if (v29 >= 2)
          {
            if (v29 != 2 || [v24 code] != 2606)
            {
LABEL_29:
              [v46 addObject:v24];
              objc_setAssociatedObject(v24, "HFAssociatedPinCodeKey", v21, (void *)0x301);
              id v33 = HFLogForCategory(0x33uLL);
              id WeakRetained = v23;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v57 = v21;
                __int16 v58 = 2112;
                uint64_t v59 = (uint64_t)v24;
                _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Setting PinCode (%@) on error (%@)", buf, 0x16u);
              }

LABEL_32:
              goto LABEL_33;
            }
          }
          else if ((v28 & 1) != 0 || [v24 code] != 2602)
          {
            goto LABEL_29;
          }
          long long v30 = HFLogForCategory(0x33uLL);
          id WeakRetained = v23;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = [v13 operationType];
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v24;
            __int16 v58 = 2048;
            uint64_t v59 = v31;
            _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring Access Code Modification Response error: %@ for operation type %ld", buf, 0x16u);
          }
        }
        if (v21)
        {
          [v45 addObject:v21];
          unint64_t v32 = [v13 operationType];
          if (v32 >= 2)
          {
            if (v32 == 2) {
              [v21 removeAccessoryAccessCode:v14];
            }
          }
          else
          {
            [v21 addAccessoryAccessCode:v14];
          }
        }
        else if ([v13 operationType] != 2)
        {
          id v24 = HFLogForCategory(0x33uLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v57 = v13;
            _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "Failed to find existing PIN Code while processing update response %@", buf, 0xCu);
          }
          goto LABEL_32;
        }
LABEL_33:

        ++v12;
      }
      while (v11 != v12);
      uint64_t v34 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      uint64_t v11 = v34;
    }
    while (v34);
  }

  [WeakRetained _reloadObservers];
  if ([v46 count])
  {
    uint64_t v35 = [obj count];
    if (v35 == [v46 count])
    {
      uint64_t v36 = [v46 firstObject];
      uint64_t v37 = v44;
      id v38 = v45;
      char v39 = v42;
    }
    else
    {
      id v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v53 = *MEMORY[0x263F083F0];
      __int16 v54 = v46;
      char v39 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v36 = [v40 errorWithDomain:@"HFErrorDomain" code:80 userInfo:v39];

      uint64_t v37 = v44;
      id v38 = v45;
    }

    if (v36) {
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v37 = v44;
    id v38 = v45;
    uint64_t v36 = v42;
    if (v42)
    {
LABEL_48:
      id v41 = (id)[WeakRetained fetchFromAccessoryCache];
      [*(id *)(v43 + 32) finishWithError:v36];
      goto LABEL_49;
    }
  }
  [*(id *)(v43 + 32) finishWithResult:v38];
LABEL_49:
}

- (id)_submitModificationRequests:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v4 count];
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Called _submitModificationRequests with %lu requests", (uint8_t *)&v10, 0xCu);
  }

  if ([v4 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F58190]);
    int v7 = [(HFPinCodeManager *)self accessCodeManager];
    id v8 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v6];
    [v7 submitAccessCodeModificationRequests:v4 completion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v6;
}

- (id)setPinCodeWithItem:(id)a3 enabled:(BOOL)a4 onAccessories:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v6;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Setting pin code enabled (%{BOOL}d) on accessories: %@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  uint64_t v11 = (void *)MEMORY[0x263F58190];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke;
  v16[3] = &unk_264096DA0;
  objc_copyWeak(&v19, &buf);
  id v12 = v8;
  id v17 = v12;
  BOOL v20 = v6;
  id v13 = v9;
  id v18 = v13;
  uint64_t v14 = [v11 futureWithBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&buf);

  return v14;
}

void __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained dataStore];
  BOOL v6 = [v5 pinCodeFromItem:*(void *)(a1 + 32)];

  if (v6)
  {
    int v7 = [MEMORY[0x263EFF980] array];
    if (!*(unsigned char *)(a1 + 56))
    {
      id v34 = v3;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v36 = a1;
      id obj = *(id *)(a1 + 40);
      uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            id v26 = [v6 accessoryAccessCodes];
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_112;
            v42[3] = &unk_264096D50;
            v42[4] = v25;
            long long v27 = objc_msgSend(v26, "na_firstObjectPassingTest:", v42);

            char v28 = (void *)[objc_alloc(MEMORY[0x263F0DED0]) initWithAccessoryAccessCode:v27];
            [v7 addObject:v28];
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v22);
      }

      uint64_t v19 = v36;
      [v6 removeAccessories:*(void *)(v36 + 40)];
      id v3 = v34;
      goto LABEL_23;
    }
    id v8 = [v6 pinCodeValue];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263F0DEF8]);
      uint64_t v11 = [v6 pinCodeValue];
      id v12 = (void *)[v10 initWithStringValue:v11];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v35 = a1;
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v48 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = (void *)[objc_alloc(MEMORY[0x263F0DEA8]) initWithAccessCodeValue:v12 accessory:*(void *)(*((void *)&v47 + 1) + 8 * j)];
            [v7 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v15);
      }

      uint64_t v19 = v35;
      [v6 addAccessories:*(void *)(v35 + 40)];

LABEL_23:
      unint64_t v29 = [WeakRetained _submitModificationRequests:v7];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_2;
      v38[3] = &unk_264096D78;
      v38[4] = WeakRetained;
      id v39 = *(id *)(v19 + 32);
      id v40 = v3;
      id v41 = v6;
      id v30 = (id)[v29 addCompletionBlock:v38];

      goto LABEL_27;
    }
    id v31 = WeakRetained;
    unint64_t v32 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_error_impl(&dword_20B986000, v32, OS_LOG_TYPE_ERROR, "Pin Code Value should not be empty", buf, 2u);
    }

    id v33 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    [v3 finishWithError:v33];

    id WeakRetained = v31;
  }
  else
  {
    BOOL v20 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find Pin Code from item", buf, 2u);
    }

    int v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    [v3 finishWithError:v7];
  }
LABEL_27:
}

uint64_t __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_112(uint64_t a1, void *a2)
{
  id v3 = [a2 accessory];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __61__HFPinCodeManager_setPinCodeWithItem_enabled_onAccessories___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [*(id *)(a1 + 32) home];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"home");

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_26C0F6CC0, @"operationType");
  objc_msgSend(v4, "na_safeSetObject:forKey:", *(void *)(a1 + 40), @"pinCodeItem");
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"error");
  +[HFAnalytics sendEvent:26 withData:v4];
  BOOL v6 = *(void **)(a1 + 48);
  if (v7) {
    [v6 finishWithError:v7];
  }
  else {
    [v6 finishWithResult:*(void *)(a1 + 56)];
  }
}

- (id)enablePinCodesForAllUsersOnNewAccessory:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v25 = self;
  BOOL v6 = [(HFPinCodeManager *)self dataStore];
  id v7 = [v6 userPINCodes];
  id v8 = [v7 allValues];

  uint64_t v9 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134218242;
    uint64_t v33 = [v8 count];
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Enabling pin codes for all (%lu) users on accessory: %@", buf, 0x16u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = [v15 accessories];
        int v17 = [v16 containsObject:v4];

        if (v17)
        {
          id v18 = HFLogForCategory(0x33uLL);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Skipping user that is already enabled on accessory", buf, 2u);
          }
        }
        else
        {
          id v19 = objc_alloc(MEMORY[0x263F0DEF8]);
          BOOL v20 = [v15 pinCodeValue];
          id v18 = [v19 initWithStringValue:v20];

          uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F0DEA8]) initWithAccessCodeValue:v18 accessory:v4];
          [v5 addObject:v21];

          id v30 = v4;
          uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
          [v15 addAccessories:v22];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  uint64_t v23 = [(HFPinCodeManager *)v25 _submitModificationRequests:v5];

  return v23;
}

- (id)enablePinCodesForNewAccessory:(id)a3 forGuestItems:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Enabling pin codes on accessory for provided guests: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v10 = (void *)MEMORY[0x263F58190];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke;
  v15[3] = &unk_264096DF0;
  objc_copyWeak(v18, (id *)buf);
  id v11 = v8;
  id v16 = v11;
  v18[1] = (id)a2;
  id v12 = v7;
  id v17 = v12;
  uint64_t v13 = [v10 futureWithBlock:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

  return v13;
}

void __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v21 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke_2;
  v26[3] = &unk_264096DC8;
  id v20 = WeakRetained;
  v26[4] = WeakRetained;
  id v5 = objc_msgSend(v4, "na_map:", v26);
  BOOL v6 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = [v12 pinCodeValue];
        if ([v13 length])
        {
          uint64_t v14 = [objc_alloc(MEMORY[0x263F0DEF8]) initWithStringValue:v13];
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F0DEA8]) initWithAccessCodeValue:v14 accessory:*(void *)(a1 + 40)];
          [v6 addObject:v15];

          uint64_t v27 = *(void *)(a1 + 40);
          id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
          [v12 addAccessories:v16];
        }
        else
        {
          uint64_t v14 = HFLogForCategory(0x33uLL);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          id v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
          *(_DWORD *)id buf = 138412546;
          long long v29 = v16;
          __int16 v30 = 2112;
          id v31 = v12;
          _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Skipping pin code that does not have a value %@", buf, 0x16u);
        }

LABEL_11:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }

  id v17 = [v20 _submitModificationRequests:v6];
  id v18 = [v21 completionHandlerAdapter];
  id v19 = (id)[v17 addCompletionBlock:v18];
}

id __64__HFPinCodeManager_enablePinCodesForNewAccessory_forGuestItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dataStore];
  id v5 = [v4 guestPinCodeFromItem:v3];

  return v5;
}

- (id)generateNewCodeValue
{
  id v3 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Generating a new unique Pin Code Value", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(HFPinCodeManager *)self constraintsFuture];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HFPinCodeManager_generateNewCodeValue__block_invoke;
  v7[3] = &unk_26408F468;
  objc_copyWeak(&v8, buf);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
  return v5;
}

id __40__HFPinCodeManager_generateNewCodeValue__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained dataStore];

  if (!v5)
  {
    BOOL v6 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v19 = 0;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Pin Code data store is nil.", v19, 2u);
    }
  }
  id v7 = [WeakRetained dataStore];
  id v8 = [v7 userPINCodes];
  uint64_t v9 = [v8 allKeys];
  uint64_t v10 = [WeakRetained dataStore];
  id v11 = [v10 guestPINCodes];
  id v12 = [v11 allKeys];
  uint64_t v13 = [v9 arrayByAddingObjectsFromArray:v12];

  uint64_t v14 = [MEMORY[0x263F0DEC0] generateAccessCodeValueFromConstraints:v3 existingAccessCodes:v13];

  uint64_t v15 = (void *)MEMORY[0x263F58190];
  id v16 = [v14 stringValue];
  id v17 = [v15 futureWithResult:v16];

  return v17;
}

- (id)checkForValidationErrorsWithPINCodeValue:(id)a3 originalPINCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Validating PIN Code value", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v9 = [(HFPinCodeManager *)self constraintsFuture];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke;
  v14[3] = &unk_264096E40;
  objc_copyWeak(&v17, buf);
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  id v12 = [v9 flatMap:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  return v12;
}

id __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke(id *a1, void *a2)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v39 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained dataStore];

  if (!v4)
  {
    id v5 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v46 = 0;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Pin Code data store is nil.", v46, 2u);
    }
  }
  id v6 = [WeakRetained dataStore];
  id v7 = [v6 userPINCodes];
  id v8 = [v7 allKeys];
  uint64_t v9 = [WeakRetained dataStore];
  id v10 = [v9 guestPINCodes];
  id v11 = [v10 allKeys];
  id v12 = [v8 arrayByAddingObjectsFromArray:v11];

  *(void *)long long v46 = 0;
  long long v47 = v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke_118;
  v41[3] = &unk_264096E18;
  void v41[4] = v46;
  v41[5] = &v42;
  [WeakRetained _fetchPinCodeConstraints:v41];
  uint64_t v13 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeEditorErrorChangeButtonTitle", @"HFPinCodeEditorErrorChangeButtonTitle", 1);
  if (*((uint64_t *)v47 + 3) >= 1)
  {
    uint64_t v14 = [a1[4] length];
    uint64_t v21 = *((void *)v47 + 3);
    if (v14 < v21) {
      goto LABEL_10;
    }
  }
  if (v43[3] >= 1)
  {
    uint64_t v22 = [a1[4] length];
    if (v22 > v43[3])
    {
      uint64_t v21 = *((void *)v47 + 3);
LABEL_10:
      long long v23 = HFLocalizedStringWithFormat(@"HFPinCodeEditorCodeLengthErrorMessage", @"%ld %ld", v15, v16, v17, v18, v19, v20, v21);
      long long v24 = 0;
      uint64_t v25 = 74;
LABEL_16:
      long long v52 = @"HFErrorHandlerOptionCancelButtonTextKey";
      v53[0] = v13;
      id v31 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
      unint64_t v32 = (void *)[v31 mutableCopy];

      if (v24) {
        [v32 setObject:v24 forKey:@"HFErrorHandlerOptionRetryButtonText"];
      }
      if (v23) {
        [v32 setObject:v23 forKey:@"HFErrorUserInfoOptionDescriptionKey"];
      }
      v50[0] = @"HFErrorUserInfoOptionsKey";
      v50[1] = @"HFErrorUserInfoOperationKey";
      v51[0] = v32;
      v51[1] = @"HFOperationChangePINCodeValue";
      uint64_t v33 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
      __int16 v34 = (void *)MEMORY[0x263F58190];
      id v35 = [MEMORY[0x263F087E8] errorWithDomain:@"HFErrorDomain" code:v25 userInfo:v33];
      uint64_t v36 = [v34 futureWithError:v35];

      goto LABEL_21;
    }
  }
  if (([a1[5] isEqualToString:a1[4]] & 1) == 0)
  {
    long long v26 = (void *)MEMORY[0x263F0DEC0];
    id v27 = a1[4];
    long long v28 = [MEMORY[0x263EFFA08] setWithArray:v12];
    char v29 = [v26 doesAccessCode:v27 conflictWithExistingAccessCodes:v28];

    if (v29)
    {
      long long v23 = 0;
      long long v24 = 0;
      uint64_t v25 = 75;
      goto LABEL_16;
    }
  }
  if ([MEMORY[0x263F0DEC0] isWeakAccessCode:a1[4]])
  {
    uint64_t v30 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeEditorErrorPickNewPINButtonTitle", @"HFPinCodeEditorErrorPickNewPINButtonTitle", 1);

    long long v24 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeEditorErrorContinueButtonTitle", @"HFPinCodeEditorErrorContinueButtonTitle", 1);
    long long v23 = 0;
    uint64_t v25 = 77;
    uint64_t v13 = (void *)v30;
    goto LABEL_16;
  }
  id v38 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEFAULT, "Validating PIN Code value succeeded with no problems!", buf, 2u);
  }

  uint64_t v36 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_21:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);

  return v36;
}

uint64_t __77__HFPinCodeManager_checkForValidationErrorsWithPINCodeValue_originalPINCode___block_invoke_118(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (id)restoreFullAccessForUserWithItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    uint64_t v25 = (uint64_t)v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Restoring full access for user pin code %@", buf, 0xCu);
  }

  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [(HFPinCodeManager *)self dataStore];
    id v10 = [v9 pinCodeFromItem:v8];

    id v11 = [v10 userLabel];
    id v12 = [v11 user];

    if (!v12) {
      NSLog(&cfstr_RestoreFullAcc.isa);
    }
    uint64_t v13 = [(HFPinCodeManager *)self accessCodeManager];
    uint64_t v14 = [v13 accessoriesSupportingAccessCodes];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __53__HFPinCodeManager_restoreFullAccessForUserWithItem___block_invoke;
    v22[3] = &unk_26408D968;
    id v23 = v10;
    id v15 = v10;
    uint64_t v16 = objc_msgSend(v14, "na_filter:", v22);

    uint64_t v17 = [(HFPinCodeManager *)self setPinCodeWithItem:v8 enabled:1 onAccessories:v16];
  }
  else
  {
    uint64_t v18 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)id buf = 138412290;
      uint64_t v25 = v21;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "Restore Full Access was called with an unsupported item type: %@", buf, 0xCu);
    }

    uint64_t v19 = (void *)MEMORY[0x263F58190];
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v19 futureWithError:v15];
  }

  return v17;
}

uint64_t __53__HFPinCodeManager_restoreFullAccessForUserWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessories];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (id)revokeAccessForAllRemovedUsers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to remove all deleted users", buf, 2u);
  }

  id v4 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v5 = [(HFPinCodeManager *)self dataStore];
  id v6 = [v5 removedUserPINCodes];
  id v7 = [v6 allValues];

  id v8 = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) userLabel];
        uint64_t v14 = [v13 removedUserInfo];
        id v15 = [v14 userUUID];

        id v16 = objc_alloc_init(MEMORY[0x263F58190]);
        uint64_t v17 = [(HFPinCodeManager *)self accessCodeManager];
        uint64_t v18 = [(HFPinCodeManager *)self _modificationCompletionHandlerForFuture:v16];
        [v17 setAccessCode:0 forUserWithUUID:v15 completion:v18];

        [v4 addObject:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v19 = [MEMORY[0x263F58190] combineAllFutures:v4];

  return v19;
}

- (id)hasValidConstraints
{
  id v3 = [(HFPinCodeManager *)self constraintsFuture];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HFPinCodeManager_hasValidConstraints__block_invoke;
  v7[3] = &unk_26408F1C0;
  void v7[4] = self;
  id v4 = [v3 recover:v7];
  int v5 = [v4 flatMap:&__block_literal_global_145_0];

  return v5;
}

id __39__HFPinCodeManager_hasValidConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[HFExecutionEnvironment isHomeUIService])
  {
    id v4 = [MEMORY[0x263F58190] futureWithResult:v3];
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) _fetchAccessoryConstraints];
    id v4 = [v5 recover:&__block_literal_global_143];
  }
  return v4;
}

uint64_t __39__HFPinCodeManager_hasValidConstraints__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F58190] futureWithResult:a2];
}

uint64_t __39__HFPinCodeManager_hasValidConstraints__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v5 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  return [v2 futureWithResult:v5];
}

- (void)_fetchPinCodeConstraints:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v5 = (void *)MEMORY[0x263F0DEC0];
  id v6 = [(HFPinCodeManager *)self constraints];
  uint64_t v7 = [v5 greatestLowerBoundForAccessCodeLengthFromConstraints:v6];

  id v8 = (void *)MEMORY[0x263F0DEC0];
  uint64_t v9 = [(HFPinCodeManager *)self constraints];
  uint64_t v10 = [v8 leastUpperBoundForAccessCodeLengthFromConstraints:v9];

  if (v7 < 0 || v10 <= 0)
  {
    uint64_t v11 = HFLogForCategory(0x33uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(HFPinCodeManager *)self constraints];
      int v13 = 134218498;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Fetching constraints Pin Code, we got a min or max length of zero. min: %ld max: %ld constraints: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  v4[2](v4, v7, v10);
}

- (void)fetchPinCodeConstraints:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(HFPinCodeManager *)self constraintsFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke;
  v12[3] = &unk_264096E88;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [v5 addSuccessBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke_2;
  v10[3] = &unk_264096EB0;
  id v8 = v6;
  id v11 = v8;
  id v9 = (id)[v7 addFailureBlock:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchPinCodeConstraints:*(void *)(a1 + 32)];
}

uint64_t __44__HFPinCodeManager_fetchPinCodeConstraints___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_WeShouldNotBeT.isa);
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFPinCodeManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFPinCodeManager *)self observers];
  [v5 removeObject:v4];
}

- (void)_reloadObservers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFPinCodeManager *)self observers];
    *(_DWORD *)id buf = 138412290;
    __int16 v17 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Telling observers to reload %@", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(HFPinCodeManager *)self observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 pinCodeManagerDidUpdate:self pinCodes:0];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)accessCodeManager:(id)a3 didAddAccessoryAccessCodes:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v27 = [v5 count];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received didAddAccessoryAccessCodes notification with %lu new PIN codes", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "accessCodeValue", (void)v21);
        long long v14 = [v13 stringValue];

        __int16 v15 = [(HFPinCodeManager *)self dataStore];
        uint64_t v16 = [v15 pinCodeForCodeValue:v14];

        if (v16)
        {
          [v16 addAccessoryAccessCode:v12];
        }
        else
        {
          __int16 v17 = HFLogForCategory(0x33uLL);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Adding new guest PIN Code because we could not find an existing PIN Code for new accessory access code.", buf, 2u);
          }

          uint64_t v18 = [[HFPinCode alloc] initWithAccessoryAccessCode:v12];
          uint64_t v19 = [(HFPinCodeManager *)self dataStore];
          uint64_t v20 = [v19 guestPINCodes];
          [v20 setValue:v18 forKey:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  [(HFPinCodeManager *)self _reloadObservers];
}

- (void)accessCodeManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v23 = [v5 count];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received didRemoveAccessoryAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "accessCodeValue", (void)v17);
        long long v14 = [v13 stringValue];

        __int16 v15 = [(HFPinCodeManager *)self dataStore];
        uint64_t v16 = [v15 pinCodeForCodeValue:v14];

        [v16 removeAccessoryAccessCode:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [(HFPinCodeManager *)self _reloadObservers];
}

- (void)accessCodeManager:(id)a3 didAddHomeAccessCodes:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v20 = [v5 count];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received didAddHomeAccessCodes notification with %lu new PIN codes", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        long long v13 = [(HFPinCodeManager *)self dataStore];
        [(HFPinCodeManager *)self _addNewHomeAccessCode:v12 toStore:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(HFPinCodeManager *)self _reloadObservers];
}

- (void)accessCodeManager:(id)a3 didUpdateHomeAccessCodes:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v35 = [v5 count];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received didUpdateHomeAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [v11 accessCodeValue];
        long long v13 = [v12 stringValue];

        long long v14 = [v11 userInformation];
        long long v15 = [v14 user];

        long long v16 = [(HFPinCodeManager *)self dataStore];
        long long v17 = v16;
        if (v15)
        {
          long long v18 = [v16 userPINCodes];
          long long v19 = [v18 allValues];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __63__HFPinCodeManager_accessCodeManager_didUpdateHomeAccessCodes___block_invoke;
          v28[3] = &unk_264096C60;
          void v28[4] = v11;
          uint64_t v20 = objc_msgSend(v19, "na_firstObjectPassingTest:", v28);

          if (v20)
          {
            uint64_t v21 = (void *)[v20 copyWithNewPinCodeValue:v13];
            long long v22 = [(HFPinCodeManager *)self dataStore];
            uint64_t v23 = [v20 pinCodeValue];
            [v22 updateWithPinCode:v21 forOldCodeValue:v23];
          }
        }
        else
        {
          uint64_t v24 = [v16 guestPINCodes];
          uint64_t v25 = [v24 objectForKey:v13];

          uint64_t v26 = [v11 userInformation];
          [v25 setUserLabel:v26];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  [(HFPinCodeManager *)self _reloadObservers];
}

uint64_t __63__HFPinCodeManager_accessCodeManager_didUpdateHomeAccessCodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userLabel];
  id v4 = [v3 user];
  id v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) userInformation];
  uint64_t v7 = [v6 user];
  uint64_t v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v5 isEqual:v8];

  return v9;
}

- (void)accessCodeManager:(id)a3 didRemoveHomeAccessCodes:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    uint64_t v26 = [v5 count];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Received didRemoveHomeAccessCodes notification with %lu PIN codes", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "accessCodeValue", (void)v20);
        long long v13 = [v12 stringValue];

        if (v13)
        {
          long long v14 = [(HFPinCodeManager *)self dataStore];
          long long v15 = [v14 userPINCodes];
          [v15 removeObjectForKey:v13];

          long long v16 = [(HFPinCodeManager *)self dataStore];
          long long v17 = [v16 guestPINCodes];
          [v17 removeObjectForKey:v13];

          long long v18 = [(HFPinCodeManager *)self dataStore];
          long long v19 = [v18 removedUserPINCodes];
          [v19 removeObjectForKey:v13];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(HFPinCodeManager *)self _reloadObservers];
}

+ (id)asciiStringForLocalizedPINString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v5, "length"));
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = u_charDigitValue([v5 characterAtIndex:v7]);
      if (v8 == -1)
      {

        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"HFErrorDomain" code:82 userInfo:0];
          uint64_t v6 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v9 = [NSNumber numberWithInt:v8];
        uint64_t v10 = [v9 stringValue];
        [v6 appendString:v10];
      }
      ++v7;
    }
    while (v7 < [v5 length]);
  }

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMAccessCodeManager)accessCodeManager
{
  return self->_accessCodeManager;
}

- (void)setAccessCodeManager:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (HFPinCodeDataStore)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
}

- (int64_t)fetchInProgress
{
  return self->_fetchInProgress;
}

- (NAFuture)constraintsFuture
{
  return self->_constraintsFuture;
}

- (void)setConstraintsFuture:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NAFuture)inProgressFetchFromAccessories
{
  return (NAFuture *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInProgressFetchFromAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressFetchFromAccessories, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_constraintsFuture, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessCodeManager, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end