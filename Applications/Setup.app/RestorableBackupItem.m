@interface RestorableBackupItem
+ (RestorableBackupItem)restorableBackupItemWithBackup:(id)a3 snapshot:(id)a4;
+ (RestorableBackupItem)restorableBackupItemWithPendingBackupUDID:(id)a3 backupUUID:(id)a4 snapshotID:(unint64_t)a5;
- (BOOL)isCompatible;
- (BOOL)isCompatibleWithUpdateToSystemVersion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThisDevice;
- (MBBackup)backup;
- (MBSnapshot)snapshot;
- (NSDictionary)appleIDMap;
- (NSString)accessibilityIdentifier;
- (NSString)activeAppleID;
- (NSString)backupUDID;
- (NSString)backupUUID;
- (NSString)pendingBackupUDID;
- (NSString)pendingBackupUUID;
- (OS_dispatch_queue)accountsQueue;
- (RestorableBackupItem)init;
- (id)dateString;
- (id)dateStringWithStyle:(unint64_t)a3;
- (id)description;
- (id)deviceInfoString;
- (id)hashString;
- (unint64_t)pendingSnapshotID;
- (unint64_t)snapshotID;
- (void)fetchAccounts:(id)a3;
- (void)prefetchAccounts;
- (void)setAccountsQueue:(id)a3;
- (void)setActiveAppleID:(id)a3;
- (void)setAppleIDMap:(id)a3;
- (void)setBackup:(id)a3;
- (void)setPendingBackupUDID:(id)a3;
- (void)setPendingBackupUUID:(id)a3;
- (void)setPendingSnapshotID:(unint64_t)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation RestorableBackupItem

+ (RestorableBackupItem)restorableBackupItemWithBackup:(id)a3 snapshot:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setBackup:location[0]];
  [v7 setSnapshot:v8];
  v5 = (RestorableBackupItem *)v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (RestorableBackupItem)restorableBackupItemWithPendingBackupUDID:(id)a3 backupUUID:(id)a4 snapshotID:(unint64_t)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = (id)a5;
  v9[0] = objc_alloc_init((Class)objc_opt_class());
  [v9[0] setPendingBackupUDID:location[0]];
  [v9[0] setPendingBackupUUID:v10];
  [v9[0] setPendingSnapshotID:a5];
  id v7 = (RestorableBackupItem *)v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (RestorableBackupItem)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)RestorableBackupItem;
  id location = [(RestorableBackupItem *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("Backup Item Accounts Queue", 0);
    v3 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v2;
  }
  v4 = (RestorableBackupItem *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = location[0];
    v3 = [(RestorableBackupItem *)v29 backupUDID];
    id v4 = [v26 backupUDID];
    char v5 = ![(NSString *)v3 isEqualToString:v4];

    if (v5)
    {
      BOOL v30 = 0;
      int v27 = 1;
    }
    else
    {
      objc_super v6 = [(RestorableBackupItem *)v29 backupUUID];
      id v7 = [v26 backupUUID];
      char v8 = ![(NSString *)v6 isEqualToString:v7];

      if (v8)
      {
        BOOL v30 = 0;
        int v27 = 1;
      }
      else
      {
        id v9 = [(RestorableBackupItem *)v29 snapshotID];
        if (v9 == [v26 snapshotID])
        {
          id v10 = [(RestorableBackupItem *)v29 snapshot];
          id v11 = [(MBSnapshot *)v10 snapshotUUID];
          char v24 = 0;
          char v22 = 0;
          char v20 = 0;
          char v18 = 0;
          char v16 = 0;
          char v14 = 0;
          char v12 = 0;
          if (v11)
          {
            id v25 = [v26 snapshot];
            char v24 = 1;
            id v23 = [v25 snapshotUUID];
            char v22 = 1;
            char v12 = 0;
            if (v23)
            {
              v21 = [(RestorableBackupItem *)v29 snapshot];
              char v20 = 1;
              id v19 = [(MBSnapshot *)v21 snapshotUUID];
              char v18 = 1;
              id v17 = [v26 snapshot];
              char v16 = 1;
              id v15 = [v17 snapshotUUID];
              char v14 = 1;
              char v12 = [v19 isEqualToString:] ^ 1;
            }
          }
          if (v14) {

          }
          if (v16) {
          if (v18)
          }

          if (v20) {
          if (v22)
          }

          if (v24) {
          BOOL v30 = (v12 & 1) == 0;
          }
          int v27 = 1;
        }
        else
        {
          BOOL v30 = 0;
          int v27 = 1;
        }
      }
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    BOOL v30 = 0;
    int v27 = 1;
  }
  objc_storeStrong(location, 0);
  return v30;
}

- (id)description
{
  uint64_t v2 = objc_opt_class();
  v3 = [(RestorableBackupItem *)self backupUDID];
  id v4 = [(RestorableBackupItem *)self backupUUID];
  char v5 = [(RestorableBackupItem *)self snapshot];
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:[(RestorableBackupItem *)self snapshotID]];
  id v7 = [(RestorableBackupItem *)self backup];
  char v8 = +[NSString stringWithFormat:@"<%@: %p backup with UDID %@, UUID %@, snapshot %@ with ID %@ for backup %@>", v2, self, v3, v4, v5, v6, v7];

  return v8;
}

- (BOOL)isThisDevice
{
  objc_super v6 = self;
  v5[1] = (id)a2;
  id v7 = (id)MGCopyAnswer();
  v5[0] = v7;
  uint64_t v2 = [(RestorableBackupItem *)v6 backupUDID];
  unsigned __int8 v3 = [(NSString *)v2 isEqualToString:v5[0]];

  objc_storeStrong(v5, 0);
  return v3 & 1;
}

- (BOOL)isCompatible
{
  uint64_t v2 = [(RestorableBackupItem *)self snapshot];
  unsigned __int8 v3 = [(MBSnapshot *)v2 isCompatible];

  return v3 & 1;
}

- (NSString)backupUDID
{
  uint64_t v2 = [(RestorableBackupItem *)self backup];
  id v3 = [(MBBackup *)v2 backupUDID];

  if (v3)
  {
    id v4 = [(RestorableBackupItem *)self backup];
    id v7 = (NSString *)[(MBBackup *)v4 backupUDID];
  }
  else
  {
    id v7 = [(RestorableBackupItem *)self pendingBackupUDID];
  }

  return v7;
}

- (NSString)backupUUID
{
  uint64_t v2 = [(RestorableBackupItem *)self backup];
  id v3 = [(MBBackup *)v2 backupUUID];

  if (v3)
  {
    id v4 = [(RestorableBackupItem *)self backup];
    id v7 = (NSString *)[(MBBackup *)v4 backupUUID];
  }
  else
  {
    id v7 = [(RestorableBackupItem *)self pendingBackupUUID];
  }

  return v7;
}

- (unint64_t)snapshotID
{
  uint64_t v2 = [(RestorableBackupItem *)self snapshot];

  if (!v2) {
    return [(RestorableBackupItem *)self pendingSnapshotID];
  }
  id v3 = [(RestorableBackupItem *)self snapshot];
  id v6 = [(MBSnapshot *)v3 snapshotID];

  return (unint64_t)v6;
}

- (BOOL)isCompatibleWithUpdateToSystemVersion:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(RestorableBackupItem *)v13 snapshot];
  id v11 = [(MBSnapshot *)v3 systemVersion];

  id v4 = [(RestorableBackupItem *)v13 snapshot];
  id v5 = [(MBSnapshot *)v4 requiredProductVersion];

  if (v5)
  {
    id v6 = [(RestorableBackupItem *)v13 snapshot];
    id v7 = [(MBSnapshot *)v6 requiredProductVersion];
    id v8 = v11;
    id v11 = v7;
  }
  unsigned __int8 v9 = +[BuddyBackupUtilities canRestoreBackupMadeOnVersion:toSystemVersion:](BuddyBackupUtilities, "canRestoreBackupMadeOnVersion:toSystemVersion:", v11, location[0], v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (id)dateString
{
  return -[RestorableBackupItem dateStringWithStyle:](self, "dateStringWithStyle:", 1, a2, self);
}

- (id)dateStringWithStyle:(unint64_t)a3
{
  if (!qword_100321C40 || (id)a3 != [(id)qword_100321C40 timeStyle])
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    id v4 = (void *)qword_100321C40;
    qword_100321C40 = (uint64_t)v3;

    [(id)qword_100321C40 setDateStyle:3];
    [(id)qword_100321C40 setDoesRelativeDateFormatting:1];
    [(id)qword_100321C40 setTimeStyle:a3];
  }
  id v5 = (void *)qword_100321C40;
  id v6 = [(RestorableBackupItem *)self snapshot];
  id v7 = [(MBSnapshot *)v6 date];
  id v8 = [v5 stringFromDate:v7];

  return v8;
}

- (id)deviceInfoString
{
  char v16 = self;
  location[1] = (id)a2;
  uint64_t v2 = [(RestorableBackupItem *)self backup];
  location[0] = [(MBBackup *)v2 marketingName];

  if (!location[0])
  {
    id v3 = [(RestorableBackupItem *)v16 backup];
    location[0] = [(MBBackup *)v3 deviceClass];
  }
  if ([(RestorableBackupItem *)v16 isThisDevice])
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"THIS_DEVICE"];
    id v6 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"RestoreFromBackup"];
    id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, location[0]);
    id v8 = location[0];
    location[0] = v7;
  }
  unsigned __int8 v9 = +[NSBundle mainBundle];
  id v10 = [(NSBundle *)v9 localizedStringForKey:@"JOIN_DEVICE_NAME_AND_INFO_%@_%@" value:&stru_1002B4E18 table:@"RestoreFromBackup"];
  id v11 = [(RestorableBackupItem *)v16 snapshot];
  id v12 = [(MBSnapshot *)v11 deviceName];
  v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, location[0]);

  objc_storeStrong(location, 0);

  return v13;
}

- (void)prefetchAccounts
{
}

- (void)fetchAccounts:(id)a3
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v26 = 0;
  int v27 = &v26;
  int v28 = 838860800;
  int v29 = 48;
  BOOL v30 = sub_1000D79AC;
  v31 = sub_1000D79F0;
  id v32 = 0;
  uint64_t v19 = 0;
  char v20 = &v19;
  int v21 = 838860800;
  int v22 = 48;
  id v23 = sub_1000D79AC;
  char v24 = sub_1000D79F0;
  id v25 = 0;
  id v3 = [(RestorableBackupItem *)v34 accountsQueue];
  block = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  char v16 = sub_1000D79FC;
  id v17 = &unk_1002B2728;
  v18[1] = &v19;
  v18[0] = v34;
  v18[2] = &v26;
  dispatch_sync(v3, &block);

  if (v20[5])
  {
    if (location[0]) {
      (*((void (**)(id, uint64_t, uint64_t, void))location[0] + 2))(location[0], v20[5], v27[5], 0);
    }
    int v12 = 1;
  }
  else
  {
    id v4 = dispatch_get_global_queue(25, 0);
    id v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_1000D7A7C;
    unsigned __int8 v9 = &unk_1002B23B0;
    id v10 = v34;
    v11[1] = &v19;
    v11[2] = &v26;
    v11[0] = location[0];
    dispatch_async(v4, &v5);

    objc_storeStrong(v11, 0);
    objc_storeStrong((id *)&v10, 0);
    int v12 = 0;
  }
  objc_storeStrong(v18, 0);
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
}

- (id)hashString
{
  unsigned __int8 v9 = self;
  location[1] = (id)a2;
  uint64_t v2 = [(RestorableBackupItem *)self snapshot];
  location[0] = [(MBSnapshot *)v2 deviceName];

  if (!location[0]) {
    objc_storeStrong(location, &stru_1002B4E18);
  }
  id v3 = [(RestorableBackupItem *)v9 backup];
  id v7 = [(MBBackup *)v3 marketingName];

  if (!v7) {
    objc_storeStrong(&v7, &stru_1002B4E18);
  }
  id v6 = [(RestorableBackupItem *)v9 dateString];
  if (!v6) {
    objc_storeStrong(&v6, &stru_1002B4E18);
  }
  id v4 = +[NSString stringWithFormat:@"(%@)(%@)(%@)", location[0], v7, v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (NSString)accessibilityIdentifier
{
  uint64_t v2 = [(RestorableBackupItem *)self snapshot];
  id v3 = [(MBSnapshot *)v2 commitID];
  char v9 = 0;
  char v7 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    id v10 = [(RestorableBackupItem *)self snapshot];
    char v9 = 1;
    id v8 = [(MBSnapshot *)v10 commitID];
    char v7 = 1;
    BOOL v4 = [v8 length] != 0;
  }
  if (v7) {

  }
  if (v9) {
  id v5 = [(RestorableBackupItem *)self snapshot];
  }
  if (v4) {
    id v12 = [(MBSnapshot *)v5 commitID];
  }
  else {
    id v12 = [(MBSnapshot *)v5 snapshotUUID];
  }

  return (NSString *)v12;
}

- (MBBackup)backup
{
  return self->_backup;
}

- (void)setBackup:(id)a3
{
}

- (MBSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSString)pendingBackupUDID
{
  return self->_pendingBackupUDID;
}

- (void)setPendingBackupUDID:(id)a3
{
}

- (NSString)pendingBackupUUID
{
  return self->_pendingBackupUUID;
}

- (void)setPendingBackupUUID:(id)a3
{
}

- (unint64_t)pendingSnapshotID
{
  return self->_pendingSnapshotID;
}

- (void)setPendingSnapshotID:(unint64_t)a3
{
  self->_pendingSnapshotID = a3;
}

- (OS_dispatch_queue)accountsQueue
{
  return self->_accountsQueue;
}

- (void)setAccountsQueue:(id)a3
{
}

- (NSDictionary)appleIDMap
{
  return self->_appleIDMap;
}

- (void)setAppleIDMap:(id)a3
{
}

- (NSString)activeAppleID
{
  return self->_activeAppleID;
}

- (void)setActiveAppleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end