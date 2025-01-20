@interface BuddyAppleIDFlow
+ (id)allowedFlowItems;
+ (unint64_t)applicableDispositions;
- (ACAccount)accountForSecurityUpgrade;
- (ACAccount)accountToRepair;
- (BOOL)controllerNeedsToRun;
- (BOOL)performAuthKitRepair;
- (BOOL)requiresTermsAcceptanceForPrimaryAccount;
- (BYCapabilities)capabilities;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (NSString)existingAccountUsername;
- (ProximitySetupController)proximitySetupController;
- (id)_accountToUpdate;
- (id)firstItem;
- (unint64_t)existingAccountType;
- (void)_determineAccountToRepair:(id)a3;
- (void)_fetchRequiresTermsAcceptanceForAccount:(id)a3 completion:(id)a4;
- (void)_startSilentEscrowRecordRepairIfNecessaryWithAccount:(id)a3 completion:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAccountForSecurityUpgrade:(id)a3;
- (void)setAccountToRepair:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setExistingAccountType:(unint64_t)a3;
- (void)setExistingAccountUsername:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setPerformAuthKitRepair:(BOOL)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRequiresTermsAcceptanceForPrimaryAccount:(BOOL)a3;
@end

@implementation BuddyAppleIDFlow

- (BOOL)controllerNeedsToRun
{
  v26 = self;
  location[1] = (id)a2;
  v2 = [(BuddyAppleIDFlow *)self capabilities];
  char v3 = [(BYCapabilities *)v2 canShowAppleIDScreen] ^ 1;

  if (v3)
  {
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = location[0];
      os_log_type_t v5 = v24;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Skipping Apple ID Setup because changing accounts is restricted", buf, 2u);
    }
    objc_storeStrong(location, 0);
    return 0;
  }
  else
  {
    v6 = [(BuddyAppleIDFlow *)v26 networkProvider];
    char v21 = 0;
    unsigned __int8 v7 = 0;
    if (![(BuddyNetworkProvider *)v6 networkReachable])
    {
      id v22 = [(BuddyAppleIDFlow *)v26 miscState];
      char v21 = 1;
      unsigned __int8 v7 = [v22 userSkippedWiFi];
    }
    if (v21) {

    }
    if (v7)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = oslog;
        os_log_type_t v9 = v19;
        sub_10004B24C(v18);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping Apple ID Setup because the network is not reachable and the user skipped Wi-Fi", v18, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      return 0;
    }
    else
    {
      id v10 = +[BuddyAppleIDConfigurationManager sharedManager];
      char v11 = [v10 isServiceEnabled] ^ 1;

      if (v11)
      {
        os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v17;
          os_log_type_t v13 = v16;
          sub_10004B24C(v15);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Skipping Apple ID Setup because the service not enabled", (uint8_t *)v15, 2u);
        }
        objc_storeStrong((id *)&v17, 0);
        return 0;
      }
      else
      {
        return 1;
      }
    }
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  os_log_type_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v3 = +[ACAccountStore defaultStore];
    id v4 = [v3 aa_primaryAppleAccount];
    unsigned __int8 v5 = [v4 aa_isManagedAppleID];

    if (v5)
    {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v17 = 1;
    }
    else
    {
      id v6 = +[BuddyAccountTools sharedBuddyAccountTools];
      id v16 = [v6 primaryAccount];

      unsigned __int8 v7 = v19;
      v8 = _NSConcreteStackBlock;
      int v9 = -1073741824;
      int v10 = 0;
      char v11 = sub_10018B240;
      v12 = &unk_1002B4188;
      os_log_type_t v13 = v19;
      id v14 = v16;
      id v15 = location[0];
      [(BuddyAppleIDFlow *)v7 _fetchRequiresTermsAcceptanceForAccount:v16 completion:&v8];
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong(&v16, 0);
      int v17 = 0;
    }
  }
  else
  {
    int v17 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)firstItem
{
  v46 = self;
  SEL v45 = a2;
  v2 = [(BuddyAppleIDFlow *)self miscState];
  id v3 = [(BuddyMiscState *)v2 migrationManager];
  unsigned __int8 v4 = [(BuddyTargetDeviceMigrationManager *)v3 willMigrate];

  char v44 = v4 & 1;
  id location = 0;
  unsigned __int8 v5 = [(BuddyAppleIDFlow *)v46 accountToRepair];
  unsigned __int8 v6 = 0;
  if (v5) {
    unsigned __int8 v6 = [(BuddyAppleIDFlow *)v46 performAuthKitRepair];
  }

  if (v6)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = oslog;
      os_log_type_t v8 = v41;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Apple ID needs AuthKit repair.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v9 = objc_alloc_init(BuddyAppleIDRepairController);
    id v10 = location;
    id location = v9;
  }
  else
  {
    char v11 = [(BuddyAppleIDFlow *)v46 accountToRepair];

    if (v11)
    {
      os_log_t v39 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v39;
        os_log_type_t v13 = v38;
        sub_10004B24C(v37);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Apple ID needs repair.", v37, 2u);
      }
      objc_storeStrong((id *)&v39, 0);
      id v14 = [BuddyAppleIDHostController alloc];
      id v15 = [(BuddyAppleIDFlow *)v46 accountToRepair];
      id v16 = [(BuddyAppleIDHostController *)v14 initWithAccount:v15];
      id v17 = location;
      id location = v16;
    }
    else
    {
      v18 = [(BuddyAppleIDFlow *)v46 accountForSecurityUpgrade];

      if (v18)
      {
        os_log_t v36 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v19 = v36;
          os_log_type_t v20 = v35;
          sub_10004B24C(v34);
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Apple ID needs security upgrade.", v34, 2u);
        }
        objc_storeStrong((id *)&v36, 0);
        char v21 = [BuddyAppleIDHostController alloc];
        id v22 = [(BuddyAppleIDFlow *)v46 accountForSecurityUpgrade];
        v23 = [(BuddyAppleIDHostController *)v21 initWithAccount:v22 mode:2];
        id v24 = location;
        id location = v23;
      }
      else if ((v44 & 1) == 0)
      {
        id obj = [[BuddyAppleIDHostController alloc] initWithAccount:0];
        v25 = [(BuddyAppleIDFlow *)v46 existingAccountUsername];
        NSUInteger v26 = [(NSString *)v25 length];

        if (v26)
        {
          v27 = [(BuddyAppleIDFlow *)v46 existingAccountUsername];
          [obj setExistingAccountUsername:v27 accountType:[v46 existingAccountType]];
        }
        objc_storeStrong(&location, obj);
        objc_storeStrong(&obj, 0);
      }
    }
  }
  [(BuddyAppleIDFlow *)v46 configureFlowItem:location];
  char v31 = 0;
  unsigned __int8 v28 = 0;
  if (location)
  {
    id v32 = [(BuddyAppleIDFlow *)v46 starter];
    char v31 = 1;
    unsigned __int8 v28 = [v32 controllerNeedsToRunForClass:objc_opt_class()];
  }
  if (v31) {

  }
  if (v28) {
    id v47 = location;
  }
  else {
    id v47 = 0;
  }
  objc_storeStrong(&location, 0);
  v29 = v47;

  return v29;
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  os_log_type_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v17 = a4;
  char v16 = 0;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v6 = 0;
  if (isKindOfClass) {
    unsigned __int8 v6 = [location[0] ranSilentUpdateProperties];
  }
  char v16 = v6 & 1;
  if (v17 || (v16 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v19;
      id v11 = location[0];
      uint64_t v12 = objc_opt_class();
      v14.receiver = v10;
      v14.super_class = (Class)BuddyAppleIDFlow;
      [(BuddyAppleIDFlow *)&v14 flowItemDone:v11 nextItemClass:v12];
    }
    else
    {
      v13.receiver = v19;
      v13.super_class = (Class)BuddyAppleIDFlow;
      [(BuddyAppleIDFlow *)&v13 flowItemDone:location[0] nextItemClass:v17];
    }
  }
  else
  {
    unsigned __int8 v7 = v19;
    id v8 = location[0];
    uint64_t v9 = objc_opt_class();
    v15.receiver = v7;
    v15.super_class = (Class)BuddyAppleIDFlow;
    [(BuddyAppleIDFlow *)&v15 flowItemDone:v8 nextItemClass:v9];
  }
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

- (void)_fetchRequiresTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  if (location[0])
  {
    id v5 = [location[0] aa_altDSID];
    unsigned __int8 v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    uint64_t v9 = sub_10018C3AC;
    id v10 = &unk_1002B41B0;
    id v11 = location[0];
    id v12 = v13;
    +[SecureBackup getAcceptedTermsForAltDSID:v5 reply:&v6];

    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v11, 0);
  }
  else if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_startSilentEscrowRecordRepairIfNecessaryWithAccount:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  id v5 = +[CDPAccount sharedInstance];
  char v6 = [(CDPAccount *)v5 primaryAccountNeedsEscrowRecordRepair] ^ 1;

  if (v6)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = oslog;
      os_log_type_t v8 = v26;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Skipping silent escrow record repair because it is not necessary", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v28) {
      (*((void (**)(void))v28 + 2))();
    }
    int v24 = 1;
  }
  else
  {
    id v9 = [location[0] aa_altDSID];
    id v23 = +[CDPContext contextForAccountWithAltDSID:v9];

    [v23 set_useSecureBackupCachedPassphrase:1];
    [v23 set_disableAsyncSecureBackupEnrollment:1];
    if (v23)
    {
      os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v23 altDSID];
        sub_10004B238((uint64_t)v31, (uint64_t)v10);
        _os_log_impl((void *)&_mh_execute_header, v22, v21, "Attempting to start silent escrow record repair for account with altDSID (%@)", v31, 0xCu);
      }
      objc_storeStrong((id *)&v22, 0);
      id v11 = objc_alloc((Class)CDPStateController);
      id v20 = [v11 initWithContext:v23];
      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      char v16 = sub_10018C9AC;
      Class v17 = &unk_1002B37C8;
      id v18 = v23;
      id v19 = v28;
      [v20 startSilentEscrowRecordRepairWithCompletion:&v13];
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v20, 0);
    }
    else
    {
      os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)v30, (uint64_t)location[0]);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDPContext could not be created for account: %@", v30, 0xCu);
      }
      objc_storeStrong((id *)&v12, 0);
      if (v28) {
        (*((void (**)(void))v28 + 2))();
      }
    }
    objc_storeStrong(&v23, 0);
    int v24 = 0;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_determineAccountToRepair:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyAccountTools sharedBuddyAccountTools];
  id v16 = [v3 primaryAccount];

  if (v16)
  {
    id v4 = [v16 aa_repairState];
    id v5 = [v4 unsignedIntegerValue];

    if (v5 == (id)1)
    {
      if ([(BuddyAppleIDFlow *)v18 requiresTermsAcceptanceForPrimaryAccount])
      {
        os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v8 = v12;
          os_log_type_t v9 = v11;
          sub_10004B24C(v10);
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "Primary Apple Account needs terms acceptance", (uint8_t *)v10, 2u);
        }
        objc_storeStrong((id *)&v12, 0);
        (*((void (**)(id, id, void))location[0] + 2))(location[0], v16, 0);
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v6 = oslog;
        os_log_type_t v7 = v14;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Primary Apple Account needs repair and will be used for update", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, id, uint64_t))location[0] + 2))(location[0], v16, 1);
    }
  }
  else
  {
    (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountToUpdate
{
  v2 = +[AKAccountManager sharedInstance];
  id v3 = [(AKAccountManager *)v2 accountEligibleForUpdate];

  return v3;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BOOL)requiresTermsAcceptanceForPrimaryAccount
{
  return self->_requiresTermsAcceptanceForPrimaryAccount;
}

- (void)setRequiresTermsAcceptanceForPrimaryAccount:(BOOL)a3
{
  self->_requiresTermsAcceptanceForPrimaryAccount = a3;
}

- (NSString)existingAccountUsername
{
  return self->_existingAccountUsername;
}

- (void)setExistingAccountUsername:(id)a3
{
  self->_existingAccountUsername = (NSString *)a3;
}

- (unint64_t)existingAccountType
{
  return self->_existingAccountType;
}

- (void)setExistingAccountType:(unint64_t)a3
{
  self->_existingAccountType = a3;
}

- (ACAccount)accountToRepair
{
  return self->_accountToRepair;
}

- (void)setAccountToRepair:(id)a3
{
}

- (BOOL)performAuthKitRepair
{
  return self->_performAuthKitRepair;
}

- (void)setPerformAuthKitRepair:(BOOL)a3
{
  self->_performAuthKitRepair = a3;
}

- (ACAccount)accountForSecurityUpgrade
{
  return self->_accountForSecurityUpgrade;
}

- (void)setAccountForSecurityUpgrade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end