@interface BuddyRestoreStoreRenewController
- (BOOL)softwareUpdateDidOccur;
- (RestorableBackupItem)backupItem;
- (void)fetchAccounts:(id)a3;
- (void)setBackupItem:(id)a3;
- (void)setSoftwareUpdateDidOccur:(BOOL)a3;
@end

@implementation BuddyRestoreStoreRenewController

- (void)fetchAccounts:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = [(BuddyRestoreStoreRenewController *)v12 backupItem];
    v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_10008D550;
    v8 = &unk_1002B1D48;
    id v9 = location[0];
    [(RestorableBackupItem *)v3 fetchAccounts:&v4];

    objc_storeStrong(&v9, 0);
    int v10 = 0;
  }
  else
  {
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
}

- (BOOL)softwareUpdateDidOccur
{
  return self->_softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->_softwareUpdateDidOccur = a3;
}

- (void).cxx_destruct
{
}

@end