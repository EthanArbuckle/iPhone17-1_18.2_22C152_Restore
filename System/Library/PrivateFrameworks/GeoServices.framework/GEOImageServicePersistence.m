@interface GEOImageServicePersistence
- (BOOL)_deleteAndRecreateDB;
- (BOOL)_setup:(id)a3;
- (GEOImageServicePersistence)init;
- (GEOImageServicePersistence)initWithDBFileURL:(id)a3;
- (GEOImageServicePersistence)initWithDBFileURL:(id)a3 maximumTotalDataSize:(unint64_t)UInteger maximumAge:(double)a5;
- (unint64_t)_evictAssetsOlderThanAllowedThreshold;
- (unint64_t)_shrinkBySize:(unint64_t)a3;
- (unint64_t)_shrinkToSize:(unint64_t)a3;
- (unint64_t)calculateFreeableSize;
- (unint64_t)shrinkBySize:(unint64_t)a3;
- (unint64_t)shrinkToSize:(unint64_t)a3;
- (void)_evictIfNecessary;
- (void)_updateDataSizeOnDBQueue;
- (void)addData:(id)a3 forIdentifier:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (void)getDataForIdentifier:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)tearDown;
@end

@implementation GEOImageServicePersistence

- (GEOImageServicePersistence)init
{
  return [(GEOImageServicePersistence *)self initWithDBFileURL:0];
}

- (GEOImageServicePersistence)initWithDBFileURL:(id)a3
{
  return [(GEOImageServicePersistence *)self initWithDBFileURL:a3 maximumTotalDataSize:0 maximumAge:-1.0];
}

- (GEOImageServicePersistence)initWithDBFileURL:(id)a3 maximumTotalDataSize:(unint64_t)UInteger maximumAge:(double)a5
{
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOImageServicePersistence;
  v9 = [(GEOImageServicePersistence *)&v27 init];
  if (v9)
  {
    if (!UInteger)
    {
      if ((unint64_t)GEOConfigGetUInteger() >> 23 > 0x18) {
        UInteger = 209715200;
      }
      else {
        UInteger = GEOConfigGetUInteger();
      }
    }
    v9->_maxTotalDataSize = UInteger;
    if (a5 <= 0.0)
    {
      GEOConfigGetDouble();
      a5 = 518400.0;
      if (v10 < 518400.0)
      {
        GEOConfigGetDouble();
        a5 = v11;
      }
    }
    v9->_maximumAge = a5;
    if (v8)
    {
      v12 = (NSURL *)[v8 copy];
      dbFileURL = v9->_dbFileURL;
      v9->_dbFileURL = v12;
    }
    else
    {
      dbFileURL = +[GEOFilePaths pathFor:32796];
      uint64_t v14 = +[GEOFilePaths urlFor:28];
      v15 = v9->_dbFileURL;
      v9->_dbFileURL = (NSURL *)v14;

      v16 = [(NSURL *)v9->_dbFileURL path];
      +[GEOSQLiteDB migrateAllDBFilesFrom:dbFileURL to:v16];
    }
    objc_initWeak(&location, v9);
    id v17 = objc_alloc((Class)GEOSQLiteDB);
    v18 = sub_100038EE4();
    v19 = v9->_dbFileURL;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100038F38;
    v24[3] = &unk_100072BB0;
    objc_copyWeak(&v25, &location);
    v20 = (GEOSQLiteDB *)[v17 initWithQueueName:"com.apple.geod.ImageServicePersistence" log:v18 databaseFileURL:v19 sqliteFlags:3145728 pragmas:0 setupBlock:v24];
    db = v9->_db;
    v9->_db = v20;

    v22 = v9;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (BOOL)_setup:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "user_version") != (id)1) {
    [v4 dropAllTables];
  }
  objc_msgSend(v4, "setUser_version:", 1);
  v5 = sub_100038EE4();
  id v6 = v4;
  if (!objc_msgSend(v6, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS assets(   rowid INTEGER PRIMARY KEY NOT NULL,    identifier BLOB NOT NULL,    width INT NOT NULL,    height INT NOT NULL,    data_size INT NOT NULL,    data BLOB NOT NULL,    UNIQUE(identifier, width, height)   );",
                        0)
    || !objc_msgSend(v6, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS access_times(   asset_rowid INT NOT NULL REFERENCES assets(rowid) ON UPDATE CASCADE ON DELETE CASCADE,    timestamp INT,    UNIQUE(asset_rowid)   );",
                        0)
    || ![v6 createIndex:"CREATE INDEX IF NOT EXISTS access_times_asset_rowid_idx ON access_times (asset_rowid);"]
    || !objc_msgSend(v6, "prepareStatement:forKey:", "INSERT INTO assets    (rowid, identifier, width, height, data_size, data)    VALUES (NULL, @identifier, @width, @height, @data_size, @data);",
                        @"AddAsset")
    || (objc_msgSend(v6, "prepareStatement:forKey:", "INSERT OR REPLACE INTO access_times    (asset_rowid, timestamp)    VALUES (@asset_rowid, @timestamp);",
                        @"SetAccessTime") & 1) == 0)
  {

LABEL_16:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  unsigned int v7 = objc_msgSend(v6, "prepareStatement:forKey:", "SELECT rowid, data    FROM assets    WHERE identifier = @identifier AND width = @width AND height = @height    LIMIT 1;",
                       @"FindAsset");

  if (!v7
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT COUNT(data_size), SUM(data_size) FROM assets;",
                        @"calculateDataSize")
    || ![v6 prepareStatement:"SELECT data_size FROM assets INNER JOIN access_times ON asset_rowid = assets.rowid ORDER BY timestamp ASC" forKey:@"enumerateDataSizeFromOldest"]|| !objc_msgSend(v6, "prepareStatement:forKey:", "DELETE FROM assets WHERE rowid IN (SELECT asset_rowid FROM access_times ORDER BY timestamp ASC LIMIT @limit)", @"deleteOldestNAssets")|| !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT COUNT(data_size), SUM(data_size) FROM assets INNER JOIN access_times ON asset_rowid = assets.rowid WHERE timestamp < @timestamp", @"getNumberOfOldEntries"))
  {
    goto LABEL_16;
  }
  [(GEOImageServicePersistence *)self _evictAssetsOlderThanAllowedThreshold];
  [(GEOImageServicePersistence *)self _updateDataSizeOnDBQueue];
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (void)tearDown
{
  db = self->_db;
  if (db)
  {
    id v4 = [(GEOSQLiteDB *)db isolationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000391BC;
    block[3] = &unk_100071490;
    block[4] = self;
    dispatch_sync(v4, block);
  }
}

- (void)_updateDataSizeOnDBQueue
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039280;
  v3[3] = &unk_100072BD8;
  v3[4] = self;
  [(GEOSQLiteDB *)db statementForKey:@"calculateDataSize" statementBlock:v3];
}

- (void)_evictIfNecessary
{
  unint64_t totalDataSize = self->_totalDataSize;
  unint64_t maxTotalDataSize = self->_maxTotalDataSize;
  if (totalDataSize > maxTotalDataSize) {
    [(GEOImageServicePersistence *)self _shrinkBySize:totalDataSize - maxTotalDataSize];
  }
}

- (unint64_t)_evictAssetsOlderThanAllowedThreshold
{
  unint64_t v3 = (unint64_t)(CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970 - self->_maximumAge);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  db = self->_db;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100039550;
  v12[3] = &unk_100072C00;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = v3;
  [(GEOSQLiteDB *)db statementForKey:@"getNumberOfOldEntries" statementBlock:v12];
  if (!*((_DWORD *)v18 + 6)) {
    goto LABEL_6;
  }
  v5 = sub_100038EE4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *((_DWORD *)v18 + 6);
    uint64_t v7 = v14[3];
    *(_DWORD *)buf = 67109376;
    int v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting %d assets older than allowed threshold (%{bytes}llu)", buf, 0x12u);
  }

  BOOL v8 = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100039600;
  v11[3] = &unk_100072C28;
  v11[4] = self;
  v11[5] = &v17;
  if ([(GEOSQLiteDB *)v8 executeStatement:@"deleteOldestNAssets" statementBlock:v11])unint64_t v9 = v14[3]; {
  else
  }
LABEL_6:
    unint64_t v9 = 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)_deleteAndRecreateDB
{
  unsigned int v3 = [(GEOSQLiteDB *)self->_db deleteAllDBFiles];
  if (v3)
  {
    self->_unint64_t totalDataSize = 0;
    db = self->_db;
    LOBYTE(v3) = [(GEOSQLiteDB *)db setup];
  }
  return v3;
}

- (unint64_t)_shrinkToSize:(unint64_t)a3
{
  unint64_t totalDataSize = self->_totalDataSize;
  if (!a3)
  {
    [(GEOImageServicePersistence *)self _deleteAndRecreateDB];
    return totalDataSize;
  }
  if (totalDataSize <= a3) {
    return 0;
  }

  return -[GEOImageServicePersistence _shrinkBySize:](self, "_shrinkBySize:");
}

- (unint64_t)_shrinkBySize:(unint64_t)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  db = self->_db;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000398EC;
  v12[3] = &unk_100072C50;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = 0;
  void v12[8] = a3;
  [(GEOSQLiteDB *)db statementForKey:@"enumerateDataSizeFromOldest" statementBlock:v12];
  if (!*((_DWORD *)v18 + 6)) {
    goto LABEL_6;
  }
  v5 = sub_100038EE4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *((_DWORD *)v18 + 6);
    uint64_t v7 = v14[3];
    *(_DWORD *)buf = 67109376;
    int v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting %d oldest assets (%{bytes}llu)", buf, 0x12u);
  }

  BOOL v8 = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003997C;
  v11[3] = &unk_100072C28;
  v11[4] = self;
  v11[5] = &v17;
  if ([(GEOSQLiteDB *)v8 executeStatement:@"deleteOldestNAssets" statementBlock:v11])unint64_t v9 = v14[3]; {
  else
  }
LABEL_6:
    unint64_t v9 = 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

- (unint64_t)calculateFreeableSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039A64;
  v5[3] = &unk_1000714B8;
  v5[4] = self;
  v5[5] = &v6;
  [(GEOSQLiteDB *)db executeSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)shrinkToSize:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039B40;
  v6[3] = &unk_1000719C8;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(GEOSQLiteDB *)db executeSync:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)shrinkBySize:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  db = self->_db;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039C58;
  v6[3] = &unk_1000719C8;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(GEOSQLiteDB *)db executeSync:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)addData:(id)a3 forIdentifier:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  db = self->_db;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039D84;
  v15[3] = &unk_100072850;
  v15[4] = self;
  id v16 = v11;
  unsigned int v18 = a5;
  unsigned int v19 = a6;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  [(GEOSQLiteDB *)db executeAsync:v15];
}

- (void)getDataForIdentifier:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = v14;
  if (v12 && v13 && v14)
  {
    db = self->_db;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003A2D8;
    v20[3] = &unk_100072CC8;
    v20[4] = self;
    id v21 = v12;
    unsigned int v24 = a4;
    unsigned int v25 = a5;
    id v22 = v13;
    id v23 = v15;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003A638;
    v17[3] = &unk_100072CF0;
    id v18 = v22;
    id v19 = v23;
    [(GEOSQLiteDB *)db executeAsync:v20 errorHandler:v17];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_dbFileURL, 0);
}

@end