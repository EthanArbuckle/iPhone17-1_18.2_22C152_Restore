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
  id v15 = a3;
  id v16 = a4;
  id v25 = a5;
  id v24 = a7;
  id v17 = a10;
  v18 = 0;
  if (v15 && v16)
  {
    v26.receiver = self;
    v26.super_class = (Class)BuddyRestoreState;
    v19 = [(BuddyRestoreState *)&v26 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_productBuild, a3);
      objc_storeStrong((id *)&v20->_backupUDID, a4);
      objc_storeStrong((id *)&v20->_backupUUID, a5);
      v20->_snapshotID = a6;
      objc_storeStrong((id *)&v20->_snapshotDate, a7);
      v20->_useLatestSnapshot = a8;
      v20->_allowCellularNetwork = a9;
      objc_storeStrong((id *)&v20->_persistDate, a10);
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (BuddyRestoreState)initWithProductBuild:(id)a3 backup:(id)a4 snapshot:(id)a5 useLatestSnapshot:(BOOL)a6 allowCellularNetwork:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v13 backupUDID];
  id v16 = [v13 backupUUID];

  id v17 = [v12 snapshotID];
  v18 = [v12 date];

  LOBYTE(v21) = a7;
  v19 = [(BuddyRestoreState *)self initWithProductBuild:v14 backupUDID:v15 backupUUID:v16 snapshotID:v17 snapshotDate:v18 useLatestSnapshot:v8 allowCellularNetwork:v21 persistDate:0];

  return v19;
}

+ (id)loadFromPreferences:(id)a3
{
  v3 = [a3 objectForKey:@"showiCloudRestoreOnLaunch" includeCache:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(id)objc_opt_class() _loadClassicState:v3];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(id)objc_opt_class() _loadModernState:v3];
LABEL_5:
    v5 = (void *)v4;
    if (v4) {
      goto LABEL_11;
    }
  }
  v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_16238(v6);
  }

  v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_161C0((uint64_t)v3, v7);
  }

  v5 = 0;
LABEL_11:

  return v5;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  v3 = [a3 objectForKey:@"showiCloudRestoreOnLaunch"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  id v4 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(BuddyRestoreState *)self productBuild];
  [v13 setObject:v5 forKeyedSubscript:@"productBuild"];

  v6 = [(BuddyRestoreState *)self backupUDID];
  [v13 setObject:v6 forKeyedSubscript:@"backupUDID"];

  v7 = [(BuddyRestoreState *)self backupUUID];
  [v13 setObject:v7 forKeyedSubscript:@"backupUUID"];

  BOOL v8 = +[NSNumber numberWithUnsignedInteger:[(BuddyRestoreState *)self snapshotID]];
  [v13 setObject:v8 forKeyedSubscript:@"snapshotID"];

  v9 = [(BuddyRestoreState *)self snapshotDate];
  [v13 setObject:v9 forKeyedSubscript:@"snapshotDate"];

  v10 = +[NSNumber numberWithBool:[(BuddyRestoreState *)self useLatestSnapshot]];
  [v13 setObject:v10 forKeyedSubscript:@"useLatestSnapshot"];

  v11 = +[NSNumber numberWithBool:[(BuddyRestoreState *)self allowCellularNetwork]];
  [v13 setObject:v11 forKeyedSubscript:@"allowCellularNetwork"];

  id v12 = +[NSDate date];
  [v13 setObject:v12 forKeyedSubscript:@"persistDate"];

  [v4 setObject:v13 forKey:@"showiCloudRestoreOnLaunch" persistImmediately:1];
}

+ (void)removeFromPreferences:(id)a3
{
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(BuddyRestoreState *)self productBuild];
  v5 = [(BuddyRestoreState *)self backupUDID];
  v6 = [(BuddyRestoreState *)self backupUUID];
  unint64_t v7 = [(BuddyRestoreState *)self snapshotID];
  BOOL v8 = [(BuddyRestoreState *)self snapshotDate];
  v9 = +[NSString stringWithFormat:@"<%@ : %p> Build: %@ Backup UDID: %@ Backup UUID: %@ Snapshot ID: %lu Snapshot Date: %@", v3, self, v4, v5, v6, v7, v8];

  return v9;
}

+ (id)_loadClassicState:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 3)
  {
    v5 = [v3 objectAtIndexedSubscript:0];
    if (v5)
    {
      v6 = [v3 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v5 = 0;
      if (isKindOfClass)
      {
        v5 = [v3 objectAtIndexedSubscript:0];
      }
    }
    BOOL v8 = [v3 objectAtIndexedSubscript:1];
    if (v8)
    {
      v9 = [v3 objectAtIndexedSubscript:1];
      objc_opt_class();
      char v10 = objc_opt_isKindOfClass();

      if (v10)
      {
        BOOL v8 = [v3 objectAtIndexedSubscript:1];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    uint64_t v11 = [v3 objectAtIndexedSubscript:2];
    if (v11
      && (id v12 = (void *)v11,
          [v3 objectAtIndexedSubscript:2],
          id v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v14 = objc_opt_isKindOfClass(),
          v13,
          v12,
          (v14 & 1) != 0))
    {
      id v15 = [v3 objectAtIndexedSubscript:2];
      id v16 = [v15 unsignedIntegerValue];

      int v17 = 1;
    }
    else
    {
      v18 = _BYLoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1627C(v3, v18);
      }

      int v17 = 0;
      id v16 = 0;
    }
    if ((unint64_t)[v3 count] >= 4)
    {
      v19 = [v3 objectAtIndexedSubscript:3];
      if (!v19)
      {
LABEL_21:
        if (v5) {
          BOOL v22 = v8 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (v22) {
          int v23 = 0;
        }
        else {
          int v23 = v17;
        }
        if (v23 == 1)
        {
          LOBYTE(v25) = 0;
          id v4 = [objc_alloc((Class)objc_opt_class()) initWithProductBuild:v5 backupUDID:v8 backupUUID:v19 snapshotID:v16 snapshotDate:0 useLatestSnapshot:0 allowCellularNetwork:v25 persistDate:0];
        }
        else
        {
          id v4 = 0;
        }

        goto LABEL_31;
      }
      v20 = [v3 objectAtIndexedSubscript:3];
      objc_opt_class();
      char v21 = objc_opt_isKindOfClass();

      if (v21)
      {
        v19 = [v3 objectAtIndexedSubscript:3];
        goto LABEL_21;
      }
    }
    v19 = 0;
    goto LABEL_21;
  }
  id v4 = 0;
LABEL_31:

  return v4;
}

+ (id)_loadModernState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"productBuild"];
  v5 = [v3 objectForKeyedSubscript:@"backupUDID"];
  v6 = [v3 objectForKeyedSubscript:@"backupUUID"];
  unint64_t v7 = [v3 objectForKeyedSubscript:@"snapshotID"];
  id v8 = [v7 unsignedIntegerValue];

  v9 = [v3 objectForKeyedSubscript:@"snapshotDate"];
  char v10 = [v3 objectForKeyedSubscript:@"useLatestSnapshot"];
  id v11 = [v10 BOOLValue];

  id v12 = [v3 objectForKeyedSubscript:@"allowCellularNetwork"];
  unsigned __int8 v13 = [v12 BOOLValue];

  char v14 = [v3 objectForKeyedSubscript:@"persistDate"];

  LOBYTE(v17) = v13;
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithProductBuild:v4 backupUDID:v5 backupUUID:v6 snapshotID:v8 snapshotDate:v9 useLatestSnapshot:v11 allowCellularNetwork:v17 persistDate:v14];

  return v15;
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
  objc_storeStrong((id *)&self->_persistDate, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_backupUDID, 0);

  objc_storeStrong((id *)&self->_productBuild, 0);
}

@end