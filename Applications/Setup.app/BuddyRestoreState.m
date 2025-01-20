@interface BuddyRestoreState
+ (BOOL)hasStateFromPreferences:(id)a3;
+ (id)_loadClassicState:(id)a3;
+ (id)_loadModernState:(id)a3;
+ (id)loadFromPreferences:(id)a3;
+ (void)removeFromPreferences:(id)a3;
- (BOOL)allowCellularNetwork;
- (BOOL)useLatestBackup;
- (BOOL)useLatestSnapshot;
- (BuddyRestoreState)initWithProductBuild:(id)a3 backup:(id)a4 snapshot:(id)a5 useLatestSnapshot:(BOOL)a6 allowCellularNetwork:(BOOL)a7;
- (BuddyRestoreState)initWithProductBuild:(id)a3 backupUDID:(id)a4 backupUUID:(id)a5 snapshotID:(unint64_t)a6 snapshotDate:(id)a7 useLatestSnapshot:(BOOL)a8 allowCellularNetwork:(BOOL)a9 persistDate:(id)a10;
- (NSDate)persistDate;
- (NSDate)snapshotDate;
- (NSString)backupUDID;
- (NSString)backupUUID;
- (NSString)productBuild;
- (id)description;
- (unint64_t)snapshotID;
- (void)persistUsingPreferences:(id)a3;
- (void)setAllowCellularNetwork:(BOOL)a3;
- (void)setBackupUDID:(id)a3;
- (void)setBackupUUID:(id)a3;
- (void)setPersistDate:(id)a3;
- (void)setProductBuild:(id)a3;
- (void)setSnapshotDate:(id)a3;
- (void)setSnapshotID:(unint64_t)a3;
- (void)setUseLatestBackup:(BOOL)a3;
@end

@implementation BuddyRestoreState

- (BuddyRestoreState)initWithProductBuild:(id)a3 backupUDID:(id)a4 backupUUID:(id)a5 snapshotID:(unint64_t)a6 snapshotDate:(id)a7 useLatestSnapshot:(BOOL)a8 allowCellularNetwork:(BOOL)a9 persistDate:(id)a10
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  unint64_t v24 = a6;
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  BOOL v22 = a8;
  BOOL v21 = a9;
  id v20 = 0;
  objc_storeStrong(&v20, a10);
  if (location[0] && obj)
  {
    id v15 = v28;
    id v28 = 0;
    v18.receiver = v15;
    v18.super_class = (Class)BuddyRestoreState;
    v16 = [(BuddyRestoreState *)&v18 init];
    id v28 = v16;
    objc_storeStrong(&v28, v16);
    if (v16)
    {
      objc_storeStrong((id *)v28 + 2, location[0]);
      objc_storeStrong((id *)v28 + 3, obj);
      objc_storeStrong((id *)v28 + 4, v25);
      *((void *)v28 + 5) = v24;
      objc_storeStrong((id *)v28 + 6, v23);
      *((unsigned char *)v28 + 8) = v22;
      *((unsigned char *)v28 + 9) = v21;
      objc_storeStrong((id *)v28 + 7, v20);
    }
    v29 = (BuddyRestoreState *)v28;
    int v19 = 1;
  }
  else
  {
    v29 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v28, 0);
  return v29;
}

- (BuddyRestoreState)initWithProductBuild:(id)a3 backup:(id)a4 snapshot:(id)a5 useLatestSnapshot:(BOOL)a6 allowCellularNetwork:(BOOL)a7
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  BOOL v21 = a6;
  BOOL v20 = a7;
  id v11 = v25;
  id v12 = location[0];
  id v13 = [v23 backupUDID];
  id v14 = [v23 backupUUID];
  id v15 = [v22 snapshotID];
  id v16 = [v22 date];
  id v25 = 0;
  LOBYTE(v19) = v20;
  id v25 = [v11 initWithProductBuild:v12 backupUDID:v13 backupUUID:v14 snapshotID:v15 snapshotDate:v16 useLatestSnapshot:v21 allowCellularNetwork:v19 persistDate:0];
  v17 = (BuddyRestoreState *)v25;

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v25, 0);
  return v17;
}

+ (id)loadFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = [location[0] objectForKey:@"showiCloudRestoreOnLaunch" includeCache:0];
  id v15 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(id)objc_opt_class() _loadClassicState:v16];
    id v4 = v15;
    id v15 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(id)objc_opt_class() _loadModernState:v16];
      id v6 = v15;
      id v15 = v5;
    }
  }
  if (!v15)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v13 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v7 = oslog;
      os_log_type_t v8 = v13;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Missing or corrupt data when restoring backup restore state!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10004BB7C((uint64_t)v18, (uint64_t)v16);
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", v18, 0xCu);
    }
    objc_storeStrong((id *)&v11, 0);
  }
  id v9 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] objectForKey:@"showiCloudRestoreOnLaunch"];
  BOOL v4 = v3 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = [(BuddyRestoreState *)v13 productBuild];
  [v11 setObject:v3 forKeyedSubscript:@"productBuild"];

  BOOL v4 = [(BuddyRestoreState *)v13 backupUDID];
  [v11 setObject:v4 forKeyedSubscript:@"backupUDID"];

  id v5 = [(BuddyRestoreState *)v13 backupUUID];
  [v11 setObject:v5 forKeyedSubscript:@"backupUUID"];

  id v6 = +[NSNumber numberWithUnsignedInteger:[(BuddyRestoreState *)v13 snapshotID]];
  [v11 setObject:v6 forKeyedSubscript:@"snapshotID"];

  v7 = [(BuddyRestoreState *)v13 snapshotDate];
  [v11 setObject:v7 forKeyedSubscript:@"snapshotDate"];

  os_log_type_t v8 = +[NSNumber numberWithBool:[(BuddyRestoreState *)v13 useLatestSnapshot]];
  [v11 setObject:v8 forKeyedSubscript:@"useLatestSnapshot"];

  id v9 = +[NSNumber numberWithBool:[(BuddyRestoreState *)v13 allowCellularNetwork]];
  [v11 setObject:v9 forKeyedSubscript:@"allowCellularNetwork"];

  v10 = +[NSDate date];
  [v11 setObject:v10 forKeyedSubscript:@"persistDate"];

  [location[0] setObject:v11 forKey:@"showiCloudRestoreOnLaunch" persistImmediately:1];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

+ (void)removeFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] removeObjectForKey:@"showiCloudRestoreOnLaunch" onlyFromMemory:0];
  objc_storeStrong(location, 0);
}

- (id)description
{
  uint64_t v2 = objc_opt_class();
  id v3 = [(BuddyRestoreState *)self productBuild];
  BOOL v4 = [(BuddyRestoreState *)self backupUDID];
  id v5 = [(BuddyRestoreState *)self backupUUID];
  unint64_t v6 = [(BuddyRestoreState *)self snapshotID];
  v7 = [(BuddyRestoreState *)self snapshotDate];
  os_log_type_t v8 = +[NSString stringWithFormat:@"<%@ : %p> Build: %@ Backup UDID: %@ Backup UUID: %@ Snapshot ID: %lu Snapshot Date: %@", v2, self, v3, v4, v5, v6, v7];

  return v8;
}

+ (id)_loadClassicState:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)[location[0] count] >= 3)
  {
    id v38 = 0;
    id v37 = 0;
    id v36 = 0;
    id v35 = 0;
    BOOL v34 = 1;
    id v3 = [location[0] objectAtIndexedSubscript:0];
    char v32 = 0;
    char isKindOfClass = 0;
    if (v3)
    {
      id v33 = [location[0] objectAtIndexedSubscript:0];
      char v32 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    if (v32) {

    }
    if (isKindOfClass)
    {
      id v5 = [location[0] objectAtIndexedSubscript:0];
      id v6 = v38;
      id v38 = v5;
    }
    id v7 = [location[0] objectAtIndexedSubscript:1];
    char v30 = 0;
    char v8 = 0;
    if (v7)
    {
      id v31 = [location[0] objectAtIndexedSubscript:1];
      char v30 = 1;
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();
    }
    if (v30) {

    }
    if (v8)
    {
      id v9 = [location[0] objectAtIndexedSubscript:1];
      id v10 = v37;
      id v37 = v9;
    }
    id v11 = [location[0] objectAtIndexedSubscript:2];
    char v28 = 0;
    char v12 = 0;
    if (v11)
    {
      id v29 = [location[0] objectAtIndexedSubscript:2];
      char v28 = 1;
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();
    }
    if (v28) {

    }
    if (v12)
    {
      id v13 = [location[0] objectAtIndexedSubscript:2];
      id v35 = [v13 unsignedIntegerValue];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v14 = [location[0] objectAtIndexedSubscript:2];
        sub_10004B238((uint64_t)buf, (uint64_t)v14);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Invalid type for snapshot ID when restoring backup restore state: %@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      BOOL v34 = 0;
    }
    char v25 = 0;
    char v23 = 0;
    char v15 = 0;
    if ((unint64_t)[location[0] count] >= 4)
    {
      id v26 = [location[0] objectAtIndexedSubscript:3];
      char v25 = 1;
      char v15 = 0;
      if (v26)
      {
        id v24 = [location[0] objectAtIndexedSubscript:3];
        char v23 = 1;
        objc_opt_class();
        char v15 = objc_opt_isKindOfClass();
      }
    }
    if (v23) {

    }
    if (v25) {
    if (v15)
    }
    {
      id v16 = [location[0] objectAtIndexedSubscript:3];
      id v17 = v36;
      id v36 = v16;
    }
    BOOL v18 = 0;
    if (v38) {
      BOOL v18 = v37 != 0;
    }
    BOOL v34 = v34 && v18;
    if (v34)
    {
      id v19 = objc_alloc((Class)objc_opt_class());
      LOBYTE(v22) = 0;
      id v41 = [v19 initWithProductBuild:v38 backupUDID:v37 backupUUID:v36 snapshotID:v35 snapshotDate:0 useLatestSnapshot:0 allowCellularNetwork:v22 persistDate:0];
    }
    else
    {
      id v41 = 0;
    }
    int v39 = 1;
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v41 = 0;
    int v39 = 1;
  }
  objc_storeStrong(location, 0);
  BOOL v20 = v41;

  return v20;
}

+ (id)_loadModernState:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = [location[0] objectForKeyedSubscript:@"productBuild"];
  id v16 = [location[0] objectForKeyedSubscript:@"backupUDID"];
  id v15 = [location[0] objectForKeyedSubscript:@"backupUUID"];
  id v3 = [location[0] objectForKeyedSubscript:@"snapshotID"];
  id v4 = [v3 unsignedIntegerValue];

  id v14 = v4;
  id v13 = [location[0] objectForKeyedSubscript:@"snapshotDate"];
  id v5 = [location[0] objectForKeyedSubscript:@"useLatestSnapshot"];
  LOBYTE(v4) = [v5 BOOLValue];

  char v12 = (char)v4;
  id v6 = [location[0] objectForKeyedSubscript:@"allowCellularNetwork"];
  LOBYTE(v4) = [v6 BOOLValue];

  char v11 = (char)v4;
  id v10 = [location[0] objectForKeyedSubscript:@"persistDate"];
  LOBYTE(v9) = v4 & 1;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithProductBuild:v17 backupUDID:v16 backupUUID:v15 snapshotID:v14 snapshotDate:v13 useLatestSnapshot:v12 & 1 allowCellularNetwork:v9 persistDate:v10];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductBuild:(id)a3
{
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (void)setBackupUUID:(id)a3
{
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (void)setSnapshotDate:(id)a3
{
}

- (BOOL)useLatestSnapshot
{
  return self->_useLatestSnapshot;
}

- (BOOL)allowCellularNetwork
{
  return self->_allowCellularNetwork;
}

- (void)setAllowCellularNetwork:(BOOL)a3
{
  self->_allowCellularNetwork = a3;
}

- (NSDate)persistDate
{
  return self->_persistDate;
}

- (void)setPersistDate:(id)a3
{
}

- (BOOL)useLatestBackup
{
  return self->_useLatestBackup;
}

- (void)setUseLatestBackup:(BOOL)a3
{
  self->_useLatestBackup = a3;
}

- (void).cxx_destruct
{
}

@end