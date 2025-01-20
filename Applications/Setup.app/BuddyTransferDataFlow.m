@interface BuddyTransferDataFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyMiscState)miscState;
- (BuddyTransferDataFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (ProximitySetupController)proximitySetupController;
- (id)classList;
- (id)firstItem;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
@end

@implementation BuddyTransferDataFlow

- (BuddyTransferDataFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v9 = v17;
  id v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyTransferDataFlow;
  id v17 = [(BuddyTransferDataFlow *)&v12 initWithNavigationController:location[0] flowDelegate:v15 flowStarter:v14 dependencyInjector:v13];
  v10 = (BuddyTransferDataFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (id)classList
{
  id location[2] = self;
  location[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyTransferDataFlow;
  location[0] = [(BuddyTransferDataFlow *)&v9 classList];
  if (![location[0] count])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v7 = 17;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      v2 = oslog;
      os_log_type_t v3 = v7;
      sub_10004B24C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "BuddyTransferDataFlow failed to set initial classList", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)firstItem
{
  v28 = self;
  v27[1] = (id)a2;
  v26.receiver = self;
  v26.super_class = (Class)BuddyTransferDataFlow;
  v27[0] = [(BuddyTransferDataFlow *)&v26 firstItem];
  if ([v27[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyTransferDataProtocol])
  {
    id v24 = v27[0];
    v2 = [(BuddyTransferDataFlow *)v28 proximitySetupController];
    id v23 = [(ProximitySetupController *)v2 information];

    id v3 = [v23 storageCapacity];
    id v4 = [v3 unsignedLongLongValue];
    id v5 = [v23 storageAvailable];
    unint64_t v6 = v4 - (unsigned char *)[v5 unsignedLongLongValue];

    unint64_t v22 = v6;
    uint64_t v21 = 0x4181111111111111;
    double v20 = (double)v6 / 35791394.1;
    if (floor(v20 / 300.0) <= 1.0) {
      double v7 = 1.0;
    }
    else {
      double v7 = floor(v20 / 300.0);
    }
    double v20 = v7 * 5.0;
    double v19 = 10.0;
    if (v7 * 5.0 >= 60.0 - 10.0)
    {
      if (floor(v20 / 15.0) <= 4.0) {
        double v11 = 4.0;
      }
      else {
        double v11 = floor(v20 / 15.0);
      }
      double v20 = v11 * 15.0;
      location[0] = objc_alloc_init((Class)NSDateComponentsFormatter);
      [location[0] setUnitsStyle:1];
      [location[0] setMaximumUnitCount:2];
      [location[0] setAllowedUnits:96];
      [location[0] setIncludesApproximationPhrase:1];
      id v12 = [location[0] stringFromTimeInterval:v20 * 60.0];
      [v24 setEstimatedMigrationDuration:v12];

      objc_storeStrong(location, 0);
    }
    else
    {
      double v18 = 0.0;
      if (v20 > 20.0) {
        double v18 = v19;
      }
      else {
        double v18 = 5.0;
      }
      *(double *)&location[1] = v20 + v18;
      v8 = +[NSBundle mainBundle];
      objc_super v9 = [(NSBundle *)v8 localizedStringForKey:@"TRANSFER_TIME_ESTIMATE_RANGE" value:&stru_1002B4E18 table:@"Localizable"];
      v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, *(void *)&v20, v20 + v18);
      [v24 setEstimatedMigrationDuration:v10];
    }
    id v13 = [v23 hasMegaBackup];
    [v24 setHasMegaBackup:v13 != 0];

    id v14 = [v23 deviceClass];
    [v24 setSourceDeviceClass:v14];

    id v29 = v27[0];
    int v25 = 1;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  else
  {
    id v29 = v27[0];
    int v25 = 1;
  }
  objc_storeStrong(v27, 0);
  id v15 = v29;

  return v15;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:2];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v63 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
  char v4 = ![(ProximitySetupController *)v3 hasConnection];

  BOOL v61 = (v4 & 1) == 0;
  if (+[BuddyMigrationCapability currentDeviceShouldOfferMigration])
  {
    id v5 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
    unint64_t v6 = [(ProximitySetupController *)v5 information];
    double v7 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
    v8 = [(ProximitySetupController *)v7 productVersion];
    objc_super v9 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
    v10 = [(ProximitySetupController *)v9 deviceClass];
    char v11 = !+[BuddyMigrationCapability sourceDeviceSupportsMigration:v6 productVersion:v8 deviceClass:v10 softwareUpdateRequired:0 reason:0];

    if (v11) {
      BOOL v61 = 0;
    }
  }
  else
  {
    BOOL v61 = 0;
  }
  id v12 = [(BuddyTransferDataFlow *)v63 miscState];
  id v60 = [(BuddyMiscState *)v12 migrationManager];

  if (!v61) {
    [v60 cancelWithCause:5];
  }
  if ([v60 hasVersionIncompatibility])
  {
    id v59 = (id)_BYLoggingFacility();
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v59;
      os_log_type_t v14 = v58;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Source/target product versions are incompatible; migration requires update",
        buf,
        2u);
    }
    objc_storeStrong(&v59, 0);
    [v60 setRequiresUpdateToMigrate:1];
    [v60 setWillMigrate:1];
  }
  id v15 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
  v16 = [(ProximitySetupController *)v15 information];
  id v17 = [(SASProximityInformation *)v16 appleID];
  BOOL v18 = v17 != 0;

  BOOL v56 = v18;
  if (!v61 && !v56)
  {
    double v19 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v51 = -1073741824;
    int v52 = 0;
    v53 = sub_10011C0A0;
    v54 = &unk_1002B0D20;
    v55 = v63;
    dispatch_async(v19, &block);

    objc_storeStrong((id *)&v55, 0);
  }
  if ([v60 userChoseMigration]) {
    BOOL v61 = 0;
  }
  if (v61)
  {
    BOOL v48 = 0;
    double v20 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
    uint64_t v21 = [(ProximitySetupController *)v20 information];
    unsigned __int8 v22 = [(SASProximityInformation *)v21 isBackupEnabled];

    if (v22)
    {
      id v23 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
      id v24 = [(ProximitySetupController *)v23 information];
      id v47 = [(SASProximityInformation *)v24 dateOfLastBackup];

      id v46 = +[NSCalendar currentCalendar];
      id v45 = objc_alloc_init((Class)NSDateComponents);
      id v44 = +[NSDate date];
      [v45 setMonth:-1];
      id v25 = [v46 dateByAddingComponents:v45 toDate:v44 options:0];
      BOOL v48 = [v47 compare:v25] == (id)1;

      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v47, 0);
    }
    if (v48)
    {
      uint64_t v65 = objc_opt_class();
      objc_super v26 = +[NSArray arrayWithObjects:&v65 count:1];
    }
    else
    {
      uint64_t v64 = objc_opt_class();
      objc_super v26 = +[NSArray arrayWithObjects:&v64 count:1];
    }
    [(BuddyTransferDataFlow *)v63 setClassList:v26];

    if ([v60 requiresUpdateToMigrate])
    {
      v27 = [(BuddyTransferDataFlow *)v63 proximitySetupController];
      id v43 = [(ProximitySetupController *)v27 backupMetadata];

      BOOL v42 = 0;
      id v28 = [v43 seedEnrollmentProgram];
      char v40 = 0;
      BOOL v29 = 0;
      if (v28)
      {
        id v41 = [v43 seedEnrollmentAssetAudience];
        char v40 = 1;
        BOOL v29 = v41 != 0;
      }
      if (v40) {

      }
      BOOL v42 = v29;
      v30 = [(BuddyTransferDataFlow *)v63 softwareUpdateCache];
      v31 = _NSConcreteStackBlock;
      int v32 = -1073741824;
      int v33 = 0;
      v34 = sub_10011C0F0;
      v35 = &unk_1002B3538;
      BOOL v39 = v29;
      id v36 = v60;
      v37 = v63;
      id v38 = location[0];
      [(BYSoftwareUpdateCache *)v30 scanUsingCache:1 withCompletion:&v31];

      objc_storeStrong(&v38, 0);
      objc_storeStrong((id *)&v37, 0);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v43, 0);
    }
    else if (location[0])
    {
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    }
    int v49 = 0;
  }
  else
  {
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v61);
    int v49 = 1;
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupDeviceToDeviceMigration;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] miscState];
  id v4 = [v3 migrationManager];
  [v4 cancelWithCause:7];

  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end