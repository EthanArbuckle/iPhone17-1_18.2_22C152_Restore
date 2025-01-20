@interface HFServiceMigrationController
+ (BOOL)homeNeedsMigration:(id)a3;
+ (BOOL)homeNeedsToDisplayMigrationOnboardingUI;
+ (id)accessoriesToMigrateFavoritesForHome:(id)a3;
+ (id)primaryServicesToMigrateForHome:(id)a3;
- (HFHomeKitDispatcher)dispatcher;
- (HFServiceMigrationController)initWithHome:(id)a3;
- (HMHome)home;
- (id)migrateServicesToAccessory;
- (unint64_t)timeoutOverride;
- (void)setDispatcher:(id)a3;
- (void)setHome:(id)a3;
- (void)setTimeoutOverride:(unint64_t)a3;
@end

@implementation HFServiceMigrationController

BOOL __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_visibleServices");
  BOOL v3 = [v2 count] != 0;

  return v3;
}

void __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = objc_msgSend(v5, "hf_primaryService");
  if ((objc_msgSend(v5, "hf_isCamera") & 1) == 0
    && (objc_msgSend(v5, "hf_isMediaAccessory") & 1) == 0
    && (objc_msgSend(v5, "hf_isProgrammableSwitch") & 1) == 0)
  {
    char v4 = objc_msgSend(v5, "hf_isRemoteControl");
    if (v3)
    {
      if ((v4 & 1) == 0) {
        [*(id *)(a1 + 32) addObject:v3];
      }
    }
  }
}

+ (BOOL)homeNeedsMigration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = objc_msgSend(v3, "hf_homeHasMigratedServicesToAccessories");
  id v5 = [(id)objc_opt_class() primaryServicesToMigrateForHome:v3];
  uint64_t v6 = [v5 count];

  BOOL v7 = HFForceAccessoryNamingMigration();
  v8 = [v3 currentUser];
  v9 = [v3 homeAccessControlForUser:v8];

  int v10 = [v9 isAdministrator];
  v11 = HFLogForCategory(9uLL);
  int v12 = v4 ^ 1;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109888;
    v15[1] = v12;
    __int16 v16 = 1024;
    BOOL v17 = v6 != 0;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "homeNeedsMigration %{BOOL}d homeHasVisibleServicesToMigrate %{BOOL}d forcedMigrationPref %{BOOL}d isAdmin %{BOOL}d", (uint8_t *)v15, 0x1Au);
  }

  if (v6) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  return v13 & v10 | v7;
}

+ (id)primaryServicesToMigrateForHome:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  id v5 = [v3 accessories];

  uint64_t v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_25_1);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HFServiceMigrationController_primaryServicesToMigrateForHome___block_invoke_2;
  v9[3] = &unk_26408F388;
  id v7 = v4;
  id v10 = v7;
  objc_msgSend(v6, "na_each:", v9);

  return v7;
}

- (HFServiceMigrationController)initWithHome:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFServiceMigrationController;
  id v5 = [(HFServiceMigrationController *)&v9 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(HFServiceMigrationController *)v5 setHome:v4];
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    [(HFServiceMigrationController *)v6 setDispatcher:v7];

    [(HFServiceMigrationController *)v6 setTimeoutOverride:0];
  }

  return v6;
}

- (id)migrateServicesToAccessory
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [(HFServiceMigrationController *)self home];
  id v4 = [(HFServiceMigrationController *)self home];
  id v5 = [v4 currentUser];
  uint64_t v6 = [v3 homeAccessControlForUser:v5];
  int v7 = [v6 isAdministrator];

  if (v7)
  {
    v8 = objc_opt_class();
    objc_super v9 = [(HFServiceMigrationController *)self home];
    id v10 = [v8 primaryServicesToMigrateForHome:v9];

    v11 = objc_opt_class();
    int v12 = [(HFServiceMigrationController *)self home];
    char v13 = [v11 accessoriesToMigrateFavoritesForHome:v12];

    v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v15 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v10 count];
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Migrating %lu services", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke;
    v29[3] = &unk_2640915A0;
    v29[4] = self;
    id v16 = v13;
    id v30 = v16;
    p_long long buf = &buf;
    id v17 = v14;
    id v31 = v17;
    objc_msgSend(v10, "na_each:", v29);
    __int16 v18 = [MEMORY[0x263F58190] combineAllFutures:v17];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_18;
    v28[3] = &unk_26408C8A0;
    v28[4] = self;
    id v19 = (id)[v18 addSuccessBlock:v28];
    unint64_t v20 = [(HFServiceMigrationController *)self timeoutOverride];
    if (v20) {
      int64_t v21 = 1000000000 * v20;
    }
    else {
      int64_t v21 = 30000000000;
    }
    dispatch_time_t v22 = dispatch_time(0, v21);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_20;
    v26[3] = &unk_26408DDE0;
    id v23 = v18;
    id v27 = v23;
    dispatch_after(v22, MEMORY[0x263EF83A0], v26);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v24 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "User is not an admin - skipping.", (uint8_t *)&buf, 2u);
    }

    id v23 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v23;
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v39[5] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessory];
  if (v4)
  {
    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v6 = [v5 homeManager];

    int v7 = [HFAccessoryBuilder alloc];
    v8 = [*(id *)(a1 + 32) home];
    objc_super v9 = [(HFAccessoryBuilder *)v7 initWithExistingObject:v4 inHome:v8];

    [(HFAccessoryBuilder *)v9 setSkipPropagateFavoriteToServices:1];
    if ([*(id *)(a1 + 40) containsObject:v4])
    {
      id v10 = [v4 services];
      uint64_t v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_54);

      int v12 = HFLogForCategory(9uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        char v13 = [v4 name];
        *(_DWORD *)long long buf = 67109378;
        v39[0] = v11;
        LOWORD(v39[1]) = 2112;
        *(void *)((char *)&v39[1] + 2) = v13;
        _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Migrating showInHomeDashboard %{BOOL}d for %@", buf, 0x12u);
      }
      [(HFAccessoryBuilder *)v9 setShowInHomeDashboard:v11];
    }
    v14 = +[HFNamingComponents namingComponentFromService:v3];
    id v15 = [v14 name];
    if (objc_msgSend(v4, "hf_isPowerStrip"))
    {
      id v16 = [v4 configuredName];

      if (v16)
      {
        id v23 = *(void **)(a1 + 48);
        v24 = [(HFAccessoryBuilder *)v9 commitItem];
        [v23 addObject:v24];
LABEL_16:

        goto LABEL_17;
      }
      if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < 2uLL) {
        _HFLocalizedStringWithDefaultValue(@"HFMigrationAccessoryNamePowerStripSingle", @"HFMigrationAccessoryNamePowerStripSingle", 1);
      }
      else {
      uint64_t v25 = HFLocalizedStringWithFormat(@"HFMigrationAccessoryNamePowerStripMultiple", @"%lu", v17, v18, v19, v20, v21, v22, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
      }

      id v15 = (id)v25;
    }
    [(HFAccessoryBuilder *)v9 setName:v15];
    v26 = (void *)MEMORY[0x263F58190];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_13;
    v30[3] = &unk_264091578;
    id v15 = v15;
    id v31 = v15;
    id v27 = v6;
    uint64_t v28 = *(void *)(a1 + 32);
    v32 = v27;
    uint64_t v33 = v28;
    id v34 = v4;
    id v35 = *(id *)(a1 + 48);
    uint64_t v36 = v9;
    id v37 = v3;
    v29 = [v26 futureWithBlock:v30];
    [*(id *)(a1 + 48) addObject:v29];

    v24 = v31;
    goto LABEL_16;
  }
  uint64_t v6 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)v39 = v3;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Service cannot be migrated because it does not have an accessory: %@", buf, 0xCu);
  }
LABEL_17:
}

uint64_t __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showInHomeDashboard");
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Checking name %@ with home manager", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  v8 = [*(id *)(a1 + 48) home];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_14;
  v10[3] = &unk_264091550;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  id v16 = v3;
  id v9 = v3;
  [v6 checkName:v7 inHome:v8 withValidationOptions:1 completionHandler:v10];
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_14(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    id v10 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      int v16 = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Valid - Renaming %@ to primary service name %@", (uint8_t *)&v16, 0x16u);
    }

    id v13 = *(void **)(a1 + 48);
    id v14 = [*(id *)(a1 + 56) commitItem];
    [v13 addObject:v14];
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    id v14 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 64);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Skip name migration on service %@ due to error %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:
  [*(id *)(a1 + 72) finishWithNoResult];
}

void __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_18(uint64_t a1)
{
  v2 = HFLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Name migration complete!", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) home];
  id v4 = (id)objc_msgSend(v3, "hf_setHomeHasMigratedServicesToAccessories:", 1);
}

uint64_t __58__HFServiceMigrationController_migrateServicesToAccessory__block_invoke_20(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFinished];
  if ((result & 1) == 0)
  {
    id v3 = HFLogForCategory(9uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Name migration is taking too long to complete. Cancelling.", v4, 2u);
    }

    return [*(id *)(a1 + 32) cancel];
  }
  return result;
}

+ (id)accessoriesToMigrateFavoritesForHome:(id)a3
{
  id v3 = [a3 accessories];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_28_1);

  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

uint64_t __69__HFServiceMigrationController_accessoriesToMigrateFavoritesForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_visibleServices");
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_30_3);

  return v3;
}

uint64_t __69__HFServiceMigrationController_accessoriesToMigrateFavoritesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetShowInHomeDashboard");
}

+ (BOOL)homeNeedsToDisplayMigrationOnboardingUI
{
  uint64_t v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];

  uint64_t v5 = [v4 homes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke;
  v7[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v7[4] = a1;
  LOBYTE(a1) = objc_msgSend(v5, "na_any:", v7);

  return (char)a1;
}

BOOL __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() primaryServicesToMigrateForHome:v2];

  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_33_1);
  BOOL v5 = [v4 count] != 0;

  return v5;
}

BOOL __71__HFServiceMigrationController_homeNeedsToDisplayMigrationOnboardingUI__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  uint64_t v3 = objc_msgSend(v2, "hf_visibleServices");
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (unint64_t)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTimeoutOverride:(unint64_t)a3
{
  self->_timeoutOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end