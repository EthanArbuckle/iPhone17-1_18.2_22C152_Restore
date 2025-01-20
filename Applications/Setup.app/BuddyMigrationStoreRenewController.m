@interface BuddyMigrationStoreRenewController
- (MBDeviceTransferPreflight)preflightInformation;
- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3;
- (void)fetchAccounts:(id)a3;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setPreflightInformation:(id)a3;
@end

@implementation BuddyMigrationStoreRenewController

- (void)fetchAccounts:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = (void (**)(id, id, id))location[0];
    v4 = [(BuddyMigrationStoreRenewController *)v9 preflightInformation];
    id v5 = [(MBDeviceTransferPreflight *)v4 appleIDs];
    v6 = [(BuddyMigrationStoreRenewController *)v9 preflightInformation];
    id v7 = [(MBDeviceTransferPreflight *)v6 activeAppleID];
    v3[2](v3, v5, v7);
  }
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyStoreRenewController *)v13 miscState];
  v4 = [(BuddyMiscState *)v3 migrationManager];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_100169194;
  v9 = &unk_1002B3CC8;
  v10 = v13;
  id v11 = location[0];
  [(BuddyTargetDeviceMigrationManager *)v4 waitForPreflight:&v5];

  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v9;
  v6.super_class = (Class)BuddyMigrationStoreRenewController;
  id v3 = [(BuddyStoreRenewController *)&v6 _localizedExtraStoresSignInTextKeyForStoreContentMap:location[0]];
  id v7 = [v3 mutableCopy];

  [v7 appendString:@"_MIGRATION"];
  id v4 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (MBDeviceTransferPreflight)preflightInformation
{
  return self->_preflightInformation;
}

- (void)setPreflightInformation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end