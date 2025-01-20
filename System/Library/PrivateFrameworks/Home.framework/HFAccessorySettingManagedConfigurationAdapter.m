@interface HFAccessorySettingManagedConfigurationAdapter
- (BOOL)isSettingUp;
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5;
- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
- (MCProfileConnection)profileConnectionForSynchronization;
- (NSHashTable)profileObservers;
- (id)_beginMonitoringSettingsKeyPath:(id)a3;
- (id)_installedProfileData;
- (id)_profilesSettingData;
- (id)_removeProfileFromProfileManager:(id)a3;
- (id)_synchronizeManagedConfigurationToHomeKit;
- (id)profiles;
- (id)profilesSettingFuture;
- (id)removeProfileDataFromHomeKit:(id)a3;
- (id)removeProfileFromHomeKit:(id)a3;
- (unint64_t)numberOfProfiles;
- (void)_dispatchWasUpdated;
- (void)_setupDebugHandler;
- (void)addProfileObserver:(id)a3;
- (void)dealloc;
- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeProfileObserver:(id)a3;
- (void)setIsSettingUp:(BOOL)a3;
- (void)setProfileObservers:(id)a3;
@end

@implementation HFAccessorySettingManagedConfigurationAdapter

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFAccessorySettingManagedConfigurationAdapter.m", 49, @"Invalid parameter not satisfying: %@", @"homeKitSettingsVendor" object file lineNumber description];
  }
  v16[0] = @"root.general.profiles.managedConfigurationProfiles";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  v15.receiver = self;
  v15.super_class = (Class)HFAccessorySettingManagedConfigurationAdapter;
  v10 = [(HFAccessorySettingAdapter *)&v15 initWithHomeKitSettingsVendor:v7 keyPaths:v9 mode:a4 updateHandler:0];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    profileObservers = v10->_profileObservers;
    v10->_profileObservers = (NSHashTable *)v11;

    v10->_isSettingUp = 1;
    [(HFAccessorySettingManagedConfigurationAdapter *)v10 _setupDebugHandler];
  }

  return v10;
}

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingManagedConfigurationAdapter.m", 61, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingManagedConfigurationAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingManagedConfigurationAdapter.m", 66, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingManagedConfigurationAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_profileConnectionForSynchronization removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HFAccessorySettingManagedConfigurationAdapter;
  [(HFAccessorySettingManagedConfigurationAdapter *)&v3 dealloc];
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  v4 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEBUG, "Ignoring managed config updates in direct mode.", v5, 2u);
  }
}

- (id)removeProfileFromHomeKit:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to remove profile %@", buf, 0xCu);
  }

  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFAccessorySettingManagedConfigurationAdapter.m", 94, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(HFAccessorySettingManagedConfigurationAdapter *)self profilesSettingFuture];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke;
  v16[3] = &unk_264096500;
  objc_copyWeak(&v18, (id *)buf);
  id v8 = v5;
  id v17 = v8;
  v9 = [v7 flatMap:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_3;
  v14[3] = &unk_26408E7F0;
  id v10 = v8;
  id v15 = v10;
  uint64_t v11 = [v9 addCompletionBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return v11;
}

id __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [WeakRetained valueManager];
  id v7 = [v6 valueForSetting:v4];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_2;
  v12[3] = &unk_264095E80;
  id v13 = *(id *)(a1 + 32);
  id v8 = objc_msgSend(v7, "na_filter:", v12);

  v9 = [WeakRetained valueManager];
  id v10 = [v9 changeValueForSetting:v4 toValue:v8 changeType:1];

  return v10;
}

uint64_t __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x263F53C48];
  id v4 = [a2 value];
  id v5 = [v3 profileWithData:v4 outError:0];

  v6 = [v5 identifier];
  id v7 = [*(id *)(a1 + 32) identifier];
  uint64_t v8 = [v6 isEqualToString:v7] ^ 1;

  return v8;
}

void __74__HFAccessorySettingManagedConfigurationAdapter_removeProfileFromHomeKit___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x3AuLL);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Removal of '%@' failed with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Removal of '%@' finished successfully", (uint8_t *)&v9, 0xCu);
  }
}

- (id)removeProfileDataFromHomeKit:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFAccessorySettingManagedConfigurationAdapter.m", 121, @"Invalid parameter not satisfying: %@", @"profileData" object file lineNumber description];
  }
  id v13 = 0;
  v6 = [MEMORY[0x263F53C48] profileWithData:v5 outError:&v13];
  id v7 = v13;
  if (v7)
  {
    uint64_t v8 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Unable to reconstitute data into a profile: %@", buf, 0xCu);
    }

    uint64_t v9 = [MEMORY[0x263F58190] futureWithError:v7];
  }
  else
  {
    uint64_t v9 = [(HFAccessorySettingManagedConfigurationAdapter *)self removeProfileFromHomeKit:v6];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)profiles
{
  objc_super v3 = [(HFAccessorySettingManagedConfigurationAdapter *)self _profilesSettingData];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke;
  v6[3] = &unk_26408E098;
  v6[4] = self;
  id v4 = [v3 flatMap:v6];

  return v4;
}

id __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 allValues];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_2;
  v9[3] = &unk_264096420;
  v9[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_map:", v9);
  id v5 = (void *)MEMORY[0x263F58190];
  v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_118];
  id v7 = [v5 futureWithResult:v6];

  return v7;
}

id __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v10 = 0;
  id v4 = [MEMORY[0x263F53C48] profileWithData:v3 outError:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      id v12 = "-[HFAccessorySettingManagedConfigurationAdapter profiles]_block_invoke_2";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s(%@): Error (%@), ignoring profile data %@.", buf, 0x2Au);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

uint64_t __57__HFAccessorySettingManagedConfigurationAdapter_profiles__block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 installDate];
  v6 = [v4 installDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)addProfileObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessorySettingManagedConfigurationAdapter *)self profileObservers];
  [v5 addObject:v4];
}

- (void)removeProfileObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessorySettingManagedConfigurationAdapter *)self profileObservers];
  [v5 removeObject:v4];
}

- (unint64_t)numberOfProfiles
{
  v2 = [(HFAccessorySettingAdapter *)self valueManager];
  id v3 = [v2 valueForSettingAtKeyPath:@"root.general.profiles.managedConfigurationProfiles"];

  unint64_t v4 = [v3 count];
  return v4;
}

- (id)profilesSettingFuture
{
  v2 = [(HFAccessorySettingAdapter *)self settingWatchFutureForKeyPath:@"root.general.profiles.managedConfigurationProfiles"];
  id v3 = [v2 flatMap:&__block_literal_global_34_2];

  return v3;
}

id __70__HFAccessorySettingManagedConfigurationAdapter_profilesSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v4;
    if (v5) {
      goto LABEL_8;
    }
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  v6 = 0;
LABEL_8:

  [v6 setItemValueClass:objc_opt_class()];
  uint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v6];

  return v9;
}

- (id)_installedProfileData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    uint64_t v3 = [(HFAccessorySettingManagedConfigurationAdapter *)self profileConnectionForSynchronization];
    id v4 = [v3 installedProfileIdentifiers];

    id v5 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[HFAccessorySettingManagedConfigurationAdapter _installedProfileData]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s: Current set of installed profiles %@", buf, 0x16u);
    }

    v6 = objc_opt_new();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__HFAccessorySettingManagedConfigurationAdapter__installedProfileData__block_invoke;
    v11[3] = &unk_2640911C8;
    v11[4] = self;
    id v7 = v6;
    id v12 = v7;
    objc_msgSend(v4, "na_each:", v11);
    uint64_t v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = (id)MEMORY[0x263EFFA78];
  }
  return v9;
}

void __70__HFAccessorySettingManagedConfigurationAdapter__installedProfileData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 profileConnectionForSynchronization];
  id v6 = [v5 installedProfileDataWithIdentifier:v4];

  objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v6, v4);
}

- (id)_profilesSettingData
{
  uint64_t v3 = [(HFAccessorySettingAdapter *)self valueManager];
  id v4 = [(HFAccessorySettingManagedConfigurationAdapter *)self profilesSettingFuture];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke;
  v8[3] = &unk_264096490;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 flatMap:v8];

  return v6;
}

id __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) valueForSetting:a2];
  uint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke_2;
  v7[3] = &unk_264096468;
  id v8 = v3;
  id v4 = v3;
  objc_msgSend(v2, "na_each:", v7);
  id v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

void __69__HFAccessorySettingManagedConfigurationAdapter__profilesSettingData__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F53C48];
  id v4 = a2;
  id v5 = [v4 value];
  id v9 = [v3 profileWithData:v5 outError:0];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 value];

  id v8 = [v9 identifier];
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, v8);
}

- (id)_removeProfileFromProfileManager:(id)a3
{
  id v4 = a3;
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    id v5 = [(HFAccessorySettingManagedConfigurationAdapter *)self profileConnectionForSynchronization];
    id v6 = (void *)MEMORY[0x263F58190];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke;
    v12[3] = &unk_26408F0C8;
    id v13 = v5;
    id v14 = v4;
    id v7 = v5;
    id v8 = [v6 futureWithBlock:v12];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F58190];
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 8);
    id v8 = [v9 futureWithError:v10];
  }
  return v8;
}

void __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) identifier];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke_2;
  v7[3] = &unk_26408DDE0;
  id v8 = v3;
  id v6 = v3;
  [v4 removeProfileWithIdentifier:v5 completion:v7];
}

uint64_t __82__HFAccessorySettingManagedConfigurationAdapter__removeProfileFromProfileManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

- (MCProfileConnection)profileConnectionForSynchronization
{
  id v3 = [(HFAccessorySettingAdapter *)self mode];
  if (v3)
  {
    profileConnectionForSynchronization = self->_profileConnectionForSynchronization;
    if (!profileConnectionForSynchronization)
    {
      id v5 = [MEMORY[0x263F53C50] sharedConnection];
      id v6 = self->_profileConnectionForSynchronization;
      self->_profileConnectionForSynchronization = v5;

      [(MCProfileConnection *)self->_profileConnectionForSynchronization addObserver:self];
      profileConnectionForSynchronization = self->_profileConnectionForSynchronization;
    }
    id v3 = profileConnectionForSynchronization;
  }
  return v3;
}

- (id)_synchronizeManagedConfigurationToHomeKit
{
  if ([(HFAccessorySettingAdapter *)self mode])
  {
    id v3 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing Managed Configuration -> HomeKit (Replacing HomeKit configuration with contents of ManagedConfiguration)", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v4 = [(HFAccessorySettingManagedConfigurationAdapter *)self profilesSettingFuture];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke;
    __int16 v11 = &unk_264096500;
    id v12 = self;
    objc_copyWeak(&v13, buf);
    id v5 = [v4 flatMap:&v8];
    id v6 = objc_msgSend(v5, "addCompletionBlock:", &__block_literal_global_52_0, v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    id v6 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v6;
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _profilesSettingData];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_2;
  v8[3] = &unk_2640964D8;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 flatMap:v8];

  objc_destroyWeak(&v10);
  return v6;
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke_2";
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s: set of HomeKit profiles: %@", (uint8_t *)&v15, 0x16u);
  }

  id v6 = [WeakRetained _installedProfileData];
  id v7 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%s: set of Managed Configuration profiles: %@", (uint8_t *)&v15, 0x16u);
  }

  if ([v6 isEqual:v3])
  {
    uint64_t v8 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke";
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%s: profiles match, no work needed", (uint8_t *)&v15, 0xCu);
    }

    id v9 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v10 = [v6 allValues];
    __int16 v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_47_2);

    id v12 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[HFAccessorySettingManagedConfigurationAdapter _synchronizeManagedConfigurationToHomeKit]_block_invoke_2";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%s: replace HomeKit profiles with Managed Configuration profiles %@", (uint8_t *)&v15, 0x16u);
    }

    id v13 = [WeakRetained valueManager];
    id v9 = [v13 changeValueForSetting:*(void *)(a1 + 32) toValue:v11 changeType:0];
  }
  return v9;
}

id __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F0DF50];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

void __90__HFAccessorySettingManagedConfigurationAdapter__synchronizeManagedConfigurationToHomeKit__block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[HFErrorHandler sharedHandler];
    [v4 logError:v3 operationDescription:@"_synchronizeManagedConfigurationToHomeKit"];
  }
  else
  {
    id v4 = HFLogForCategory(0x3AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Successfully Synchronized managed configuration -> homeKit", v5, 2u);
    }
  }
}

- (void)_dispatchWasUpdated
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(HFAccessorySettingManagedConfigurationAdapter *)self profileObservers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 managedConfigurationAdapterSettingsWereUpdated:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HFLogForCategory(0x3AuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "received notification from MobileConfig that profile lists changed: connection: %@ userInfo: %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(HFAccessorySettingManagedConfigurationAdapter *)self _synchronizeManagedConfigurationToHomeKit];
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  id v4 = [a3 keyPath];
  int v5 = [v4 isEqualToString:@"root.general.profiles"];

  return !v5 || [(HFAccessorySettingManagedConfigurationAdapter *)self numberOfProfiles] != 0;
}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(HFAccessorySettingManagedConfigurationAdapter *)self _synchronizeManagedConfigurationToHomeKit];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__HFAccessorySettingManagedConfigurationAdapter__beginMonitoringSettingsKeyPath___block_invoke;
  v8[3] = &unk_264096548;
  objc_copyWeak(&v9, &location);
  id v6 = [v5 addCompletionBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __81__HFAccessorySettingManagedConfigurationAdapter__beginMonitoringSettingsKeyPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsSettingUp:0];
}

- (void)_setupDebugHandler
{
  objc_initWeak(&location, self);
  id v2 = +[HFDebugStateDumpManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HFAccessorySettingManagedConfigurationAdapter__setupDebugHandler__block_invoke;
  v6[3] = &unk_26408CBE8;
  objc_copyWeak(&v7, &location);
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = (id)[v2 registerStateDumpHandler:v6 withName:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __67__HFAccessorySettingManagedConfigurationAdapter__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = +[HFStateDumpBuilderContext contextWithDetailLevel:2];
    id v3 = +[HFStateDumpBuilder builderWithObject:WeakRetained context:v2];

    id v4 = [MEMORY[0x263F53C50] sharedConnection];
    id v5 = [v4 installedProfileIdentifiers];
    [v3 setObject:v5 forKeyedSubscript:@"MCProfiles"];

    id v6 = [WeakRetained settingForKeyPath:@"root.general.profiles.managedConfigurationProfiles"];
    id v7 = [v6 value];
    [v3 setObject:v7 forKeyedSubscript:@"HKProfiles"];

    if ([WeakRetained mode] == 1) {
      uint64_t v8 = @"Accessory";
    }
    else {
      uint64_t v8 = @"Controller";
    }
    [v3 setObject:v8 forKeyedSubscript:@"adapterMode"];
    objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(WeakRetained, "isSettingUp"), @"settingUp", 1);
    id v9 = [v3 buildPropertyListRepresentation];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA78];
  }

  return v9;
}

- (BOOL)isSettingUp
{
  return self->_isSettingUp;
}

- (void)setIsSettingUp:(BOOL)a3
{
  self->_isSettingUp = a3;
}

- (NSHashTable)profileObservers
{
  return self->_profileObservers;
}

- (void)setProfileObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileObservers, 0);
  objc_storeStrong((id *)&self->_profileConnectionForSynchronization, 0);
}

@end