@interface HMDBackingStoreLocal
+ (id)logCategory;
+ (void)cleanDatastoreFilesAt:(id)a3 everything:(BOOL)a4;
- (BOOL)_selectArchiveWithIdentifier:(id)a3 archive:(id *)a4 controllerUserName:(id *)a5 error:(id *)a6;
- (HMDBackingStoreLocal)initWithDB:(id)a3 migrate:(BOOL)a4 error:(id *)a5;
- (HMDBackingStoreLocal)initWithDatastore:(id)a3;
- (NSMutableArray)zoneCache;
- (NSMutableDictionary)storeCache;
- (NSString)datastoreFile;
- (id)_begin;
- (id)_commit;
- (id)_createDatastoreTables:(id)a3;
- (id)_createNewDatastore:(id)a3;
- (id)_deleteGroupWithID:(int64_t)a3;
- (id)_deleteLog:(int64_t)a3;
- (id)_deleteRecordWithGroupID:(int64_t)a3 recordName:(id)a4;
- (id)_deleteZoneWithID:(int64_t)a3;
- (id)_dropUncommittedUnpushedTransactions;
- (id)_fetchGroupsForZone:(id)a3 withError:(id *)a4;
- (id)_fetchRecordWithUUID:(id)a3 root:(id)a4 error:(id *)a5;
- (id)_fetchUncommittedAndPushedTransactions;
- (id)_fetchZonesWithError:(id *)a3;
- (id)_fillStoreCache;
- (id)_fillZoneCache;
- (id)_insertLogOptionsWithID:(int64_t)a3 options:(id)a4;
- (id)_instanceResources:(BOOL)a3 migrate:(BOOL)a4;
- (id)_runSQLite3:(const char *)a3 bind:(id)a4 error:(id *)a5;
- (id)_selectLogOptionsWithID:(int64_t)a3;
- (id)_updateGroupWithID:(int64_t)a3 serverChangeToken:(id)a4;
- (id)_updateGroupWithID:(int64_t)a3 subscription:(id)a4;
- (id)_updateLog:(int64_t)a3 mask:(int64_t)a4 set:(int64_t)a5;
- (id)_updateRecordWithGroupID:(int64_t)a3 name:(id)a4 schema:(id)a5;
- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 model:(id)a6;
- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 record:(id)a6 uuid:(id)a7 parentUUID:(id)a8 type:(id)a9 data:(id)a10 encoding:(int64_t)a11 schema:(id)a12;
- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5;
- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5 data:(id)a6 encoding:(int64_t)a7;
- (id)flush:(BOOL)a3;
- (id)logIdentifier;
- (int64_t)_insertGroupWithZoneID:(int64_t)a3 root:(id)a4 owner:(id)a5 subscription:(id)a6 error:(id *)a7;
- (int64_t)_insertZoneWithName:(id)a3 error:(id *)a4;
- (int64_t)_numUncommittedTransactions;
- (unint64_t)_fetchIDForStore:(id)a3 error:(id *)a4;
- (unint64_t)_insertArchive:(id)a3 identifier:(id)a4 controllerUserName:(id)a5 error:(id *)a6;
- (unint64_t)_insertLogWithRoot:(id)a3 transaction:(id)a4 set:(int64_t)a5 error:(id *)a6;
- (void)_fetchRecordCountWithGroupID:(int64_t)a3 callback:(id)a4;
- (void)_fetchRecordMapWithGroupID:(int64_t)a3 callback:(id)a4;
- (void)_fetchRecordTypeSchemaWithGroupID:(int64_t)a3 callback:(id)a4;
- (void)_fetchRecordsWithGroupID:(int64_t)a3 callback:(id)a4;
- (void)_fetchRecordsWithGroupID:(int64_t)a3 names:(id)a4 callback:(id)a5;
- (void)_fetchRecordsWithGroupID:(int64_t)a3 parent:(id)a4 type:(id)a5 callback:(id)a6;
- (void)_fetchRecordsWithGroupID:(int64_t)a3 parentUuids:(id)a4 callback:(id)a5;
- (void)_fetchRecordsWithGroupID:(int64_t)a3 uuids:(id)a4 callback:(id)a5;
- (void)_freeResources;
- (void)_rollback;
- (void)_selectAllLog:(id)a3;
- (void)_selectAllRecords:(id)a3;
- (void)_selectLogWithMask:(int64_t)a3 compare:(int64_t)a4 callback:(id)a5;
- (void)_selectLogWithRoot:(id)a3 after:(int64_t)a4 mask:(int64_t)a5 compare:(int64_t)a6 callback:(id)a7;
- (void)dealloc;
- (void)setStoreCache:(id)a3;
- (void)setZoneCache:(id)a3;
@end

@implementation HMDBackingStoreLocal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCache, 0);
  objc_storeStrong((id *)&self->_zoneCache, 0);
  objc_storeStrong((id *)&self->_datastoreFile, 0);
}

- (void)setStoreCache:(id)a3
{
}

- (NSMutableDictionary)storeCache
{
  return self->_storeCache;
}

- (void)setZoneCache:(id)a3
{
}

- (NSMutableArray)zoneCache
{
  return self->_zoneCache;
}

- (NSString)datastoreFile
{
  return self->_datastoreFile;
}

- (id)logIdentifier
{
  return @"BackingStore";
}

- (BOOL)_selectArchiveWithIdentifier:(id)a3 archive:(id *)a4 controllerUserName:(id *)a5 error:(id *)a6
{
  selectArchive = self->selectArchive;
  id v19 = 0;
  bindStringSQLite3(selectArchive, 1, a3, &v19);
  id v11 = v19;
  v12 = self->selectArchive;
  if (v11)
  {
    sqlite3_reset(v12);
    if (a6)
    {
      BOOL v13 = 0;
      *a6 = v11;
      goto LABEL_14;
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  int v14 = sqlite3_step(v12);
  if (v14 != 100)
  {
    if (a6 && v14 != 101)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectArchive];
    }
    sqlite3_reset(self->selectArchive);
    goto LABEL_13;
  }
  v15 = [NSString stringWithSQLite3Column:self->selectArchive column:1];
  v16 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectArchive column:2];
  int v17 = sqlite3_step(self->selectArchive);
  if (a6 && v17 != 101)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectArchive];
  }
  sqlite3_reset(self->selectArchive);
  *a4 = (id)[v16 copy];
  *a5 = (id)[v15 copy];

  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (unint64_t)_insertArchive:(id)a3 identifier:(id)a4 controllerUserName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = execSQLite3(self->updateLogToDiskCommited);
  int v14 = v13;
  if (!v13)
  {
    bindStringSQLite3(self->insertArchive, 1, v11, a6);
    bindStringSQLite3(self->insertArchive, 2, v12, a6);
    bindDataSQLite3(self->insertArchive, 3, v10, a6);
    if (!*a6)
    {
      sqlite3_int64 v15 = steplastrowresetSQLite3(self->insertArchive, a6);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (!a6)
  {
LABEL_5:
    sqlite3_int64 v15 = 0;
    goto LABEL_7;
  }
  sqlite3_int64 v15 = 0;
  *a6 = v13;
LABEL_7:

  return v15;
}

- (id)_deleteLog:(int64_t)a3
{
  deleteLog = self->deleteLog;
  id v10 = 0;
  bindIntSQLite3(deleteLog, 1, a3, &v10);
  id v5 = v10;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    execSQLite3(self->deleteLog);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_updateLog:(int64_t)a3 mask:(int64_t)a4 set:(int64_t)a5
{
  updateLog = self->updateLog;
  id v19 = 0;
  bindIntSQLite3(updateLog, 1, a4, &v19);
  id v9 = v19;
  id v10 = self->updateLog;
  id v18 = v9;
  bindIntSQLite3(v10, 2, a5, &v18);
  id v11 = v18;

  id v12 = self->updateLog;
  id v17 = v11;
  bindIntSQLite3(v12, 3, a3, &v17);
  id v13 = v17;

  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    execSQLite3(self->updateLog);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_int64 v15 = v14;

  return v15;
}

- (void)_selectAllLog:(id)a3
{
  id v13 = (uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *, void))a3;
  while (1)
  {
    int v4 = sqlite3_step(self->selectAllLog);
    if (v4 != 100) {
      break;
    }
    sqlite3_int64 v5 = sqlite3_column_int64(self->selectAllLog, 0);
    sqlite3_int64 v6 = sqlite3_column_int64(self->selectAllLog, 1);
    sqlite3_int64 v7 = sqlite3_column_int64(self->selectAllLog, 2);
    sqlite3_int64 v8 = sqlite3_column_int64(self->selectAllLog, 5);
    sqlite3_int64 v9 = sqlite3_column_int64(self->selectAllLog, 6);
    id v10 = [NSString stringWithSQLite3Column:self->selectAllLog column:3];
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectAllLog column:4];
    LOBYTE(v5) = v13[2](v13, v5, v6, v7, v8, v9, v10, v11, 0);

    if (v5) {
      goto LABEL_7;
    }
  }
  if ((v4 & 0xFFFFFFFE) != 0x64)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectAllLog];
    ((uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *, void *))v13)[2](v13, 0, 0, 0, 0, 0, 0, 0, v12);
  }
LABEL_7:
  sqlite3_reset(self->selectAllLog);
}

- (id)_selectLogOptionsWithID:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  selectLogOptions = self->selectLogOptions;
  id v20 = 0;
  bindIntSQLite3(selectLogOptions, 1, a3, &v20);
  id v19 = v20;
  sqlite3_int64 v6 = 0;
  while (1)
  {
    int v7 = sqlite3_step(self->selectLogOptions);
    if (v7 != 100) {
      break;
    }
    if (v6)
    {
      sqlite3_int64 v8 = (void *)MEMORY[0x1D9452090]();
      sqlite3_int64 v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        __int16 v23 = 2048;
        int64_t v24 = a3;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got multiple results for xact_block %lu (using first one)", buf, 0x16u);
      }
    }
    else
    {
      sqlite3_int64 v6 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectLogOptions column:0];
    }
  }
  if (v7 != 101)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sqlite3_int64 v15 = HMFGetLogIdentifier();
      v16 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectLogOptions];
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      int64_t v24 = (int64_t)v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@unexpected error to selectLogOptions: %@", buf, 0x16u);
    }
  }
  sqlite3_reset(self->selectLogOptions);
  if (v6)
  {
    id v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:0];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_insertLogOptionsWithID:(int64_t)a3 options:(id)a4
{
  insertLogOptions = self->insertLogOptions;
  id v14 = 0;
  id v7 = a4;
  bindIntSQLite3(insertLogOptions, 1, a3, &v14);
  id v8 = v14;
  sqlite3_int64 v9 = self->insertLogOptions;
  id v10 = encodeRootObject();

  id v13 = v8;
  bindDataSQLite3(v9, 2, v10, &v13);
  id v11 = v13;

  if (!v11)
  {
    execSQLite3(self->insertLogOptions);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (void)_selectLogWithMask:(int64_t)a3 compare:(int64_t)a4 callback:(id)a5
{
  id v19 = (void (**)(void))a5;
  selectChangeExistsLog = self->selectChangeExistsLog;
  id v21 = 0;
  bindIntSQLite3(selectChangeExistsLog, 1, a3, &v21);
  id v9 = v21;
  id v10 = self->selectChangeExistsLog;
  id v20 = v9;
  bindIntSQLite3(v10, 2, a4, &v20);
  id v11 = v20;

  if (v11)
  {
    v19[2]();
  }
  else
  {
    while (1)
    {
      int v12 = sqlite3_step(self->selectChangeExistsLog);
      if (v12 != 100) {
        break;
      }
      sqlite3_int64 v13 = sqlite3_column_int64(self->selectChangeExistsLog, 0);
      sqlite3_int64 v14 = sqlite3_column_int64(self->selectChangeExistsLog, 1);
      sqlite3_int64 v15 = (void *)MEMORY[0x1E4F1A2F8];
      v16 = [NSString stringWithSQLite3Column:self->selectChangeExistsLog column:2];
      id v17 = [v15 parseFromString:v16];
      LOBYTE(v13) = ((uint64_t (*)(void (**)(void), sqlite3_int64, sqlite3_int64, void *, void))v19[2])(v19, v13, v14, v17, 0);

      if (v13) {
        goto LABEL_8;
      }
    }
    if ((v12 & 0xFFFFFFFE) != 0x64)
    {
      id v18 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectChangeExistsLog];
      ((void (*)(void (**)(void), void, void, void, void *))v19[2])(v19, 0, 0, 0, v18);
    }
LABEL_8:
    sqlite3_reset(self->selectChangeExistsLog);
  }
}

- (void)_selectLogWithRoot:(id)a3 after:(int64_t)a4 mask:(int64_t)a5 compare:(int64_t)a6 callback:(id)a7
{
  id v31 = a7;
  selectLog = self->selectLog;
  sqlite3_int64 v13 = [a3 encodeForKey];
  id v35 = 0;
  bindStringSQLite3(selectLog, 1, v13, &v35);
  id v14 = v35;

  sqlite3_int64 v15 = self->selectLog;
  id v34 = v14;
  bindIntSQLite3(v15, 2, a5, &v34);
  id v16 = v34;

  id v17 = self->selectLog;
  id v33 = v16;
  bindIntSQLite3(v17, 3, a6, &v33);
  id v18 = v33;

  id v19 = self->selectLog;
  id v32 = v18;
  bindIntSQLite3(v19, 4, a4, &v32);
  id v20 = v32;

  if (v20)
  {
    (*((void (**)(id, void, void, void, void, void, void, id))v31 + 2))(v31, 0, 0, 0, 0, 0, 0, v20);
  }
  else
  {
    id v21 = self->selectLog;
    v22 = (uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void))v31;
    while (1)
    {
      int v23 = sqlite3_step(v21);
      if (v23 != 100) {
        break;
      }
      sqlite3_int64 v24 = sqlite3_column_int64(v21, 0);
      sqlite3_int64 v25 = sqlite3_column_int64(v21, 1);
      sqlite3_int64 v26 = sqlite3_column_int64(v21, 2);
      sqlite3_int64 v27 = sqlite3_column_int64(v21, 4);
      sqlite3_int64 v28 = sqlite3_column_int64(v21, 5);
      v29 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:v21 column:3];
      LOBYTE(v24) = v22[2](v22, v24, v25, v26, v27, v28, v29, 0);

      if (v24) {
        goto LABEL_9;
      }
    }
    if ((v23 & 0xFFFFFFFE) != 0x64)
    {
      v30 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:v21];
      ((uint64_t (**)(id, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, sqlite3_int64, void *, void *))v22)[2](v22, 0, 0, 0, 0, 0, 0, v30);
    }
LABEL_9:
    sqlite3_reset(v21);

    id v20 = 0;
  }
}

- (unint64_t)_insertLogWithRoot:(id)a3 transaction:(id)a4 set:(int64_t)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = [v10 encodeForKey];
  uint64_t v13 = execSQLite3(self->flushPushedXact);
  if (v13)
  {
    id v14 = (id)v13;
    if (a6)
    {
LABEL_3:
      id v14 = v14;
      unint64_t insert_rowid = 0;
      *a6 = v14;
      goto LABEL_28;
    }
LABEL_27:
    unint64_t insert_rowid = 0;
    goto LABEL_28;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v11 objects];
  uint64_t v45 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v45)
  {
    sqlite3_int64 v46 = a5;
    v41 = a6;
    id v42 = v10;
    unint64_t insert_rowid = 0;
    uint64_t v47 = *(void *)v57;
    v43 = v11;
LABEL_6:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v57 != v47) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = [v17 change];
      id v55 = 0;
      id v20 = [v19 encodeWithEncoding:1 error:&v55];
      id v14 = v55;

      if (!v20) {
        break;
      }
      p_insertLog = &self->insertLog;
      insertLog = self->insertLog;
      id v54 = v14;
      bindIntSQLite3(insertLog, 1, v46, &v54);
      id v23 = v54;

      sqlite3_int64 v24 = self->insertLog;
      id v53 = v23;
      bindStringSQLite3(v24, 2, v12, &v53);
      id v25 = v53;

      sqlite3_int64 v26 = self->insertLog;
      id v52 = v25;
      bindDataSQLite3(v26, 3, v20, &v52);
      id v27 = v52;

      sqlite3_int64 v28 = self->insertLog;
      id v51 = v27;
      bindIntSQLite3(v28, 4, insert_rowid, &v51);
      id v29 = v51;

      v30 = self->insertLog;
      id v31 = [v17 change];
      sqlite3_int64 v32 = [v31 objectChangeType];
      id v50 = v29;
      bindIntSQLite3(v30, 5, v32, &v50);
      id v33 = v50;

      id v34 = self->insertLog;
      id v49 = v33;
      bindIntSQLite3(v34, 6, 1, &v49);
      id v14 = v49;

      if (v14) {
        break;
      }
      uint64_t v35 = execSQLite3(*p_insertLog);
      if (v35) {
        goto LABEL_24;
      }
      if (!insert_rowid)
      {
        unint64_t insert_rowid = sqlite3_last_insert_rowid(self->connection);
        p_updateLogXactID = &self->updateLogXactID;
        updateLogXactID = self->updateLogXactID;
        id v48 = 0;
        bindIntSQLite3(updateLogXactID, 1, insert_rowid, &v48);
        id v38 = v48;
        execSQLite3(self->updateLogXactID);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14) {
          break;
        }
        if (sqlite3_reset(*p_updateLogXactID)) {
          goto LABEL_23;
        }
        v39 = [v43 options];
        id v14 = [(HMDBackingStoreLocal *)self _insertLogOptionsWithID:insert_rowid options:v39];

        if (v14) {
          break;
        }
      }
      if (sqlite3_reset(*p_insertLog))
      {
        p_updateLogXactID = &self->insertLog;
LABEL_23:
        uint64_t v35 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:*p_updateLogXactID];
LABEL_24:
        id v14 = (id)v35;
        break;
      }

      if (v45 == ++v16)
      {
        id v10 = v42;
        id v11 = v43;
        uint64_t v45 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v45) {
          goto LABEL_6;
        }
        goto LABEL_21;
      }
    }
    id v10 = v42;
    id v11 = v43;

    if (!v14) {
      goto LABEL_28;
    }
    a6 = v41;
    if (v41) {
      goto LABEL_3;
    }
    goto LABEL_27;
  }
  unint64_t insert_rowid = 0;
LABEL_21:

  id v14 = 0;
LABEL_28:

  return insert_rowid;
}

- (void)_selectAllRecords:(id)a3
{
  id v14 = (uint64_t (**)(id, void *, sqlite3_int64, sqlite3_int64, void *, void *, sqlite3_int64, void *, void *, void))a3;
  while (1)
  {
    int v4 = sqlite3_step(self->selectRecords);
    if (v4 != 100) {
      break;
    }
    sqlite3_int64 v5 = [NSString stringWithSQLite3Column:self->selectRecords column:0];
    sqlite3_int64 v6 = sqlite3_column_int64(self->selectRecords, 1);
    sqlite3_int64 v7 = sqlite3_column_int64(self->selectRecords, 2);
    id v8 = [NSString stringWithSQLite3Column:self->selectRecords column:3];
    id v9 = [NSString stringWithSQLite3Column:self->selectRecords column:4];
    sqlite3_int64 v10 = sqlite3_column_int64(self->selectRecords, 5);
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectRecords column:6];
    int v12 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectRecords column:7];
    LOBYTE(v6) = v14[2](v14, v5, v6, v7, v8, v9, v10, v11, v12, 0);

    if (v6) {
      goto LABEL_7;
    }
  }
  if ((v4 & 0xFFFFFFFE) != 0x64)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecords];
    ((uint64_t (**)(id, void *, sqlite3_int64, sqlite3_int64, void *, void *, sqlite3_int64, void *, void *, void *))v14)[2](v14, 0, 0, 0, 0, 0, 0, 0, 0, v13);
  }
LABEL_7:
  sqlite3_reset(self->selectRecords);
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 names:(id)a4 callback:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    selectRecordName = self->selectRecordName;
    id v23 = 0;
    bindIntSQLite3(selectRecordName, 2, a3, &v23);
    a3 = (int64_t)v23;
  }
  else
  {
    selectRecordName = self->selectRecordNameNoShare;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v18 = (id)a3;
        bindStringSQLite3(selectRecordName, 1, v16, &v18);
        id v17 = v18;

        if (v17)
        {
          (*((void (**)(id, void, void, void, void, id))v9 + 2))(v9, 0, 0, 0, 0, v17);
          goto LABEL_17;
        }
        a3 = _handleFetchWithRawCallback(selectRecordName, v9);

        if (a3)
        {
          id v17 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      a3 = 0;
      id v17 = 0;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = (id)a3;
  }
LABEL_17:
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 parent:(id)a4 type:(id)a5 callback:(id)a6
{
  id v17 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    selectRecordParent = self->selectRecordParent;
    id v21 = 0;
    bindIntSQLite3(selectRecordParent, 3, a3, &v21);
    a3 = (int64_t)v21;
  }
  else
  {
    selectRecordParent = self->selectRecordParentNoShare;
  }
  uint64_t v13 = objc_msgSend(v17, "UUIDString", v17);
  id v20 = (id)a3;
  bindStringSQLite3(selectRecordParent, 1, v13, &v20);
  id v14 = v20;

  id v19 = v14;
  bindStringSQLite3(selectRecordParent, 2, v10, &v19);
  id v15 = v19;

  if (v15)
  {
    sqlite3_reset(selectRecordParent);
    (*((void (**)(id, void, void, void, void, id))v11 + 2))(v11, 0, 0, 0, 0, v15);
  }
  else
  {
    id v16 = _handleFetchWithRawCallback(selectRecordParent, v11);
  }
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 parentUuids:(id)a4 callback:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  selectRecordParentUUID = self->selectRecordParentUUID;
  id v26 = 0;
  bindIntSQLite3(selectRecordParentUUID, 2, a3, &v26);
  id v11 = v26;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = self->selectRecordParentUUID;
        id v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) UUIDString];
        id v21 = v11;
        bindStringSQLite3(v17, 1, v18, &v21);
        id v19 = v21;

        id v20 = self->selectRecordParentUUID;
        if (v19)
        {
          sqlite3_reset(v20);
          (*((void (**)(id, void, void, void, void, id))v9 + 2))(v9, 0, 0, 0, 0, v19);
          goto LABEL_14;
        }
        _handleFetchWithRawCallback(v20, v9);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          id v19 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      id v11 = 0;
      id v19 = 0;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v19 = v11;
  }
LABEL_14:
}

- (id)_fetchRecordWithUUID:(id)a3 root:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  selectRecordUUIDNoShare = self->selectRecordUUIDNoShare;
  id v8 = [a3 UUIDString];
  id v19 = 0;
  bindStringSQLite3(selectRecordUUIDNoShare, 1, v8, &v19);
  id v9 = v19;

  sqlite3_reset(self->selectRecordUUIDNoShare);
  if (v9)
  {
    if (a5)
    {
      id v9 = v9;
      id v10 = 0;
      id v11 = 0;
      *a5 = v9;
      goto LABEL_23;
    }
    id v10 = 0;
    goto LABEL_19;
  }
  int v12 = sqlite3_step(self->selectRecordUUIDNoShare);
  if (v12 != 100)
  {
    if (a5 && v12 != 101)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordUUIDNoShare];
    }
    sqlite3_reset(self->selectRecordUUIDNoShare);
    id v10 = 0;
    id v9 = 0;
LABEL_19:
    id v11 = 0;
    goto LABEL_23;
  }
  sqlite3_int64 v13 = sqlite3_column_int64(self->selectRecordUUIDNoShare, 2);
  uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectRecordUUIDNoShare column:1];
  int v15 = sqlite3_step(self->selectRecordUUIDNoShare);
  if (a5 && v15 != 101)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordUUIDNoShare];
  }
  sqlite3_reset(self->selectRecordUUIDNoShare);
  id v18 = 0;
  id v10 = +[HMDBackingStoreModelObject objectFromData:v14 encoding:v13 error:&v18];
  id v16 = v18;
  id v9 = v16;
  if (v16)
  {
    if (a5 && !*a5)
    {
      id v11 = 0;
      *a5 = v16;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = v10;
  }

LABEL_23:
  return v11;
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 uuids:(id)a4 callback:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    selectRecordUUID = self->selectRecordUUID;
    id v23 = 0;
    bindIntSQLite3(selectRecordUUID, 2, a3, &v23);
    a3 = (int64_t)v23;
  }
  else
  {
    selectRecordUUID = self->selectRecordUUIDNoShare;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) UUIDString];
        id v18 = (id)a3;
        bindStringSQLite3(selectRecordUUID, 1, v16, &v18);
        id v17 = v18;

        if (v17)
        {
          sqlite3_reset(selectRecordUUID);
          (*((void (**)(id, void, void, void, void, id))v9 + 2))(v9, 0, 0, 0, 0, v17);
          goto LABEL_17;
        }
        a3 = _handleFetchWithRawCallback(selectRecordUUID, v9);

        if (a3)
        {
          id v17 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      a3 = 0;
      id v17 = 0;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = (id)a3;
  }
LABEL_17:
}

- (void)_fetchRecordsWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v17 = (void (**)(id, void *, void *, sqlite3_int64, void *, void *, void *, void *, void *, void))a4;
  id v18 = 0;
  bindIntSQLite3(self->selectRecordGroup, 1, a3, &v18);
  id v6 = v18;
  if (v6) {
    goto LABEL_2;
  }
  while (1)
  {
    int v8 = sqlite3_step(self->selectRecordGroup);
    if (v8 != 100) {
      break;
    }
    id v9 = [NSString stringWithSQLite3Column:self->selectRecordGroup column:0];
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectRecordGroup column:1];
    sqlite3_int64 v11 = sqlite3_column_int64(self->selectRecordGroup, 2);
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectRecordGroup column:3];
    uint64_t v13 = [NSString stringWithSQLite3Column:self->selectRecordGroup column:4];
    uint64_t v14 = [NSString stringWithSQLite3Column:self->selectRecordGroup column:5];
    int v15 = [NSString stringWithSQLite3Column:self->selectRecordGroup column:6];
    id v16 = [NSString stringWithSQLite3Column:self->selectRecordGroup column:7];
    v17[2](v17, v9, v10, v11, v12, v13, v14, v15, v16, 0);
  }
  if (v8 == 101)
  {
    sqlite3_reset(self->selectRecordGroup);
    goto LABEL_3;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordGroup];
  sqlite3_reset(self->selectRecordGroup);
  sqlite3_int64 v7 = v17;
  if (v6)
  {
LABEL_2:
    ((void (**)(id, void *, void *, sqlite3_int64, void *, void *, void *, void *, void *, id))v17)[2](v17, 0, 0, 0, 0, 0, 0, 0, 0, v6);

LABEL_3:
    sqlite3_int64 v7 = v17;
  }
}

- (void)_fetchRecordMapWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v13 = a4;
  id v14 = 0;
  bindIntSQLite3(self->selectRecordGroupMap, 1, a3, &v14);
  id v6 = v14;
  sqlite3_int64 v7 = (void (**)(void, void, void, void, void, void))v13;
  if (v6) {
    goto LABEL_2;
  }
  while (1)
  {
    int v8 = sqlite3_step(self->selectRecordGroupMap);
    if (v8 != 100) {
      break;
    }
    id v9 = [NSString stringWithSQLite3Column:self->selectRecordGroupMap column:0];
    id v10 = [NSString stringWithSQLite3Column:self->selectRecordGroupMap column:1];
    sqlite3_int64 v11 = [NSString stringWithSQLite3Column:self->selectRecordGroupMap column:2];
    uint64_t v12 = [NSString stringWithSQLite3Column:self->selectRecordGroupMap column:3];
    (*((void (**)(id, void *, void *, void *, void *, void))v13 + 2))(v13, v9, v10, v11, v12, 0);
  }
  if (v8 == 101)
  {
    sqlite3_reset(self->selectRecordGroupMap);
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordGroup];
  sqlite3_reset(self->selectRecordGroupMap);
  sqlite3_int64 v7 = (void (**)(void, void, void, void, void, void))v13;
  if (v6)
  {
LABEL_2:
    ((void (**)(id, void, void, void, void, id))v7)[2](v13, 0, 0, 0, 0, v6);

LABEL_7:
    sqlite3_int64 v7 = (void (**)(void, void, void, void, void, void))v13;
  }
}

- (void)_fetchRecordTypeSchemaWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v12 = a4;
  id v13 = 0;
  bindIntSQLite3(self->selectRecordGroupTypeSchema, 1, a3, &v13);
  id v6 = v13;
  sqlite3_int64 v7 = (void (**)(void, void, void, void))v12;
  if (v6) {
    goto LABEL_2;
  }
  while (1)
  {
    int v8 = sqlite3_step(self->selectRecordGroupTypeSchema);
    if (v8 != 100) {
      break;
    }
    id v9 = [NSString stringWithSQLite3Column:self->selectRecordGroupTypeSchema column:0];
    id v10 = [NSString stringWithSQLite3Column:self->selectRecordGroupTypeSchema column:1];
    char v11 = (*((uint64_t (**)(id, void *, void *, void))v12 + 2))(v12, v9, v10, 0);

    if ((v11 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (v8 == 101)
  {
LABEL_7:
    sqlite3_reset(self->selectRecordGroupTypeSchema);
    goto LABEL_8;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordGroupTypeSchema];
  sqlite3_reset(self->selectRecordGroupTypeSchema);
  sqlite3_int64 v7 = (void (**)(void, void, void, void))v12;
  if (v6)
  {
LABEL_2:
    ((void (**)(id, void, void, id))v7)[2](v12, 0, 0, v6);

LABEL_8:
    sqlite3_int64 v7 = (void (**)(void, void, void, void))v12;
  }
}

- (void)_fetchRecordCountWithGroupID:(int64_t)a3 callback:(id)a4
{
  id v10 = a4;
  id v11 = 0;
  bindIntSQLite3(self->selectRecordCountGroup, 1, a3, &v11);
  id v6 = v11;
  sqlite3_int64 v7 = (void (**)(void, void, void))v10;
  if (v6) {
    goto LABEL_2;
  }
  while (1)
  {
    int v9 = sqlite3_step(self->selectRecordCountGroup);
    if (v9 != 100) {
      break;
    }
    sqlite3_int64 v8 = sqlite3_column_int64(self->selectRecordCountGroup, 0);
    (*((void (**)(id, sqlite3_int64, void))v10 + 2))(v10, v8, 0);
  }
  if (v9 == 101)
  {
    sqlite3_reset(self->selectRecordCountGroup);
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectRecordCountGroup];
  sqlite3_reset(self->selectRecordCountGroup);
  sqlite3_int64 v7 = (void (**)(void, void, void))v10;
  if (v6)
  {
LABEL_2:
    ((void (**)(id, void, id))v7)[2](v10, 0, v6);

LABEL_7:
    sqlite3_int64 v7 = (void (**)(void, void, void))v10;
  }
}

- (id)_deleteRecordWithGroupID:(int64_t)a3 recordName:(id)a4
{
  deleteRecord = self->deleteRecord;
  id v15 = 0;
  id v7 = a4;
  bindIntSQLite3(deleteRecord, 2, a3, &v15);
  id v8 = v15;
  int v9 = self->deleteRecord;
  id v14 = v8;
  bindStringSQLite3(v9, 1, v7, &v14);

  id v10 = v14;
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    execSQLite3(self->deleteRecord);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 model:(id)a6
{
  id v10 = a5;
  id v19 = 0;
  id v11 = [a6 encodeWithEncoding:1 error:&v19];
  id v12 = v19;
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10];
    id v17 = (void *)[v15 initWithRecordType:@"ObjectRecord" recordID:v16];
    id v14 = [(HMDBackingStoreLocal *)self _updateRecordWithGroupID:a3 store:a4 record:v17 data:v11 encoding:1];
  }
  return v14;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5
{
  id v8 = a5;
  int v9 = [v8 objectForKey:@"k00"];
  uint64_t v10 = [v9 integerValue];

  if (v10)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", v10);
    id v12 = [v8 objectForKey:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14) {
      [(HMDBackingStoreLocal *)self _updateRecordWithGroupID:a3 store:a4 record:v8 data:v14 encoding:v10];
    }
    else {
    id v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
  }

  return v15;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 record:(id)a5 data:(id)a6 encoding:(int64_t)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v12 encodeSystemFieldsWithCoder:v15];
  [v15 finishEncoding];
  id v16 = [v15 encodedData];

  int64_t v36 = a7;
  uint64_t v37 = 0;
  id v17 = +[HMDBackingStoreModelObject objectFromData:v13 encoding:a7 error:&v37];
  uint64_t v18 = v37;
  id v19 = [v12 recordID];
  long long v20 = [v19 recordName];
  if (v18)
  {
    long long v21 = [(HMDBackingStoreLocal *)self _updateRecordWithGroupID:a3 store:a4 name:v20 record:v16 uuid:0 parentUUID:0 type:0 data:v13 encoding:0 schema:0];
  }
  else
  {
    uint64_t v35 = [v17 uuid];
    id v33 = [v35 UUIDString];
    id v34 = [v17 parentUUID];
    sqlite3_int64 v32 = [v34 UUIDString];
    id v31 = [v17 bsoType];
    +[HMDBackingStoreSingleton sharedInstance];
    id v22 = v12;
    id v23 = v16;
    v25 = int64_t v24 = a4;
    uint64_t v26 = [v25 schemaHashForObject:v17];
    id v27 = self;
    uint64_t v28 = (void *)v26;
    int64_t v29 = v24;
    id v16 = v23;
    id v12 = v22;
    long long v21 = [(HMDBackingStoreLocal *)v27 _updateRecordWithGroupID:a3 store:v29 name:v20 record:v16 uuid:v33 parentUUID:v32 type:v31 data:v13 encoding:v36 schema:v26];
  }
  return v21;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 store:(int64_t)a4 name:(id)a5 record:(id)a6 uuid:(id)a7 parentUUID:(id)a8 type:(id)a9 data:(id)a10 encoding:(int64_t)a11 schema:(id)a12
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v18 = a6;
  id v55 = a7;
  id v19 = a8;
  id v51 = a9;
  id v20 = a10;
  id v21 = a12;
  insertRecord = self->insertRecord;
  id v65 = 0;
  int64_t v50 = a3;
  bindIntSQLite3(insertRecord, 1, a3, &v65);
  id v23 = v65;
  int64_t v24 = self->insertRecord;
  id v64 = v23;
  id v54 = v17;
  bindStringSQLite3(v24, 2, v17, &v64);
  id v25 = v64;

  uint64_t v26 = self->insertRecord;
  id v63 = v25;
  id v53 = v18;
  bindDataSQLite3(v26, 3, v18, &v63);
  id v27 = v63;

  uint64_t v28 = self->insertRecord;
  id v62 = v27;
  bindStringSQLite3(v28, 4, v55, &v62);
  id v29 = v62;

  v30 = self->insertRecord;
  id v61 = v29;
  bindStringSQLite3(v30, 5, v19, &v61);
  id v31 = v61;

  sqlite3_int64 v32 = self->insertRecord;
  id v60 = v31;
  bindDataSQLite3(v32, 6, v20, &v60);
  id v33 = v60;

  id v34 = self->insertRecord;
  id v59 = v33;
  bindIntSQLite3(v34, 7, a11, &v59);
  id v35 = v59;

  int64_t v36 = self->insertRecord;
  id v58 = v35;
  bindStringSQLite3(v36, 8, v51, &v58);
  id v37 = v58;

  id v38 = self->insertRecord;
  id v57 = v37;
  bindStringSQLite3(v38, 9, v21, &v57);
  id v39 = v57;

  v40 = self->insertRecord;
  id v56 = v39;
  bindIntSQLite3(v40, 10, a4, &v56);
  id v41 = v56;

  id v42 = (void *)MEMORY[0x1D9452090]();
  v43 = self;
  v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v46 = id v45 = v21;
    *(_DWORD *)buf = 138544898;
    v67 = v46;
    __int16 v68 = 2048;
    int64_t v69 = v50;
    __int16 v70 = 2112;
    v71 = v54;
    __int16 v72 = 2112;
    id v73 = v55;
    __int16 v74 = 2112;
    id v75 = v19;
    __int16 v76 = 2112;
    id v77 = v51;
    __int16 v78 = 2112;
    id v79 = v45;
    _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEBUG, "%{public}@Inserting/Updating record group: %lu, name: %@, uuid: %@, parent: %@, type: %@, schema: %@", buf, 0x48u);

    id v21 = v45;
  }

  if (v41)
  {
    id v47 = v41;
  }
  else
  {
    execSQLite3(self->insertRecord);
    id v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v48 = v47;

  return v48;
}

- (id)_fetchGroupsForZone:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x1E4F1CA48] array];
  v24 = id v23 = v6;
  bindIntSQLite3(self->selectGroups, 1, [v6 zoneID], a4);
  if (*a4)
  {
LABEL_15:
    id v20 = 0;
    goto LABEL_16;
  }
  id v22 = a4;
  while (1)
  {
    int v7 = sqlite3_step(self->selectGroups);
    if (v7 != 100) {
      break;
    }
    sqlite3_int64 v8 = sqlite3_column_int64(self->selectGroups, 0);
    if (v8)
    {
      sqlite3_int64 v9 = v8;
      uint64_t v10 = [NSString stringWithSQLite3Column:self->selectGroups column:1];
      id v11 = [NSString stringWithSQLite3Column:self->selectGroups column:2];
      id v12 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectGroups column:3];
      id v13 = [NSString stringWithSQLite3Column:self->selectGroups column:4];
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:self->selectGroups column:5];
      id v15 = (void *)v14;
      if (v12)
      {
        id v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:v22];
        if (v15) {
          goto LABEL_7;
        }
      }
      else
      {
        id v16 = 0;
        if (v14)
        {
LABEL_7:
          id v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:v22];
          goto LABEL_10;
        }
      }
      id v17 = 0;
LABEL_10:
      id v18 = [[HMDBackingStoreCacheGroup alloc] initWithGroupID:v9 zone:v23 rootRecord:v10 serverChangeToken:v16 subscriptionName:v13 owner:v11 subscription:v17];
      [v24 addObject:v18];
    }
  }
  if (v7 != 101)
  {
    id *v22 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectGroups];
  }
  if (!sqlite3_reset(self->selectGroups))
  {
    if (!*v22) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v19 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectGroups];
  id *v22 = v19;
  if (v19) {
    goto LABEL_15;
  }
LABEL_20:
  id v20 = v24;
LABEL_16:

  return v20;
}

- (id)_updateGroupWithID:(int64_t)a3 subscription:(id)a4
{
  updateGroupSubscription = self->updateGroupSubscription;
  int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:0];
  id v15 = 0;
  bindDataSQLite3(updateGroupSubscription, 1, v7, &v15);
  id v8 = v15;

  sqlite3_int64 v9 = self->updateGroupSubscription;
  id v14 = v8;
  bindIntSQLite3(v9, 2, a3, &v14);
  id v10 = v14;

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    execSQLite3(self->updateGroupSubscription);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (id)_updateGroupWithID:(int64_t)a3 serverChangeToken:(id)a4
{
  updateGroupToken = self->updateGroupToken;
  int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:0];
  id v15 = 0;
  bindDataSQLite3(updateGroupToken, 1, v7, &v15);
  id v8 = v15;

  sqlite3_int64 v9 = self->updateGroupToken;
  id v14 = v8;
  bindIntSQLite3(v9, 2, a3, &v14);
  id v10 = v14;

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    execSQLite3(self->updateGroupToken);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

- (id)_deleteGroupWithID:(int64_t)a3
{
  if (a3)
  {
    deleteGroup = self->deleteGroup;
    id v8 = 0;
    bindIntSQLite3(deleteGroup, 1, a3, &v8);
    id v6 = v8;
    if (!v6)
    {
      execSQLite3(self->deleteGroup);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)_insertGroupWithZoneID:(int64_t)a3 root:(id)a4 owner:(id)a5 subscription:(id)a6 error:(id *)a7
{
  insertGroup = self->insertGroup;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  bindIntSQLite3(insertGroup, 1, a3, a7);
  bindStringSQLite3(self->insertGroup, 2, v15, a7);

  bindStringSQLite3(self->insertGroup, 3, v14, a7);
  bindStringSQLite3(self->insertGroup, 4, v13, a7);

  if (*a7) {
    return 0;
  }
  id v17 = self->insertGroup;
  return steplastrowresetSQLite3(v17, a7);
}

- (id)_fetchZonesWithError:(id *)a3
{
  sqlite3_int64 v5 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v6 = sqlite3_step(self->selectZones);
    if (v6 != 100) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(self->selectZones, 0);
    id v8 = [NSString stringWithSQLite3Column:self->selectZones column:1];
    if (v7)
    {
      sqlite3_int64 v9 = [[HMDBackingStoreCacheZone alloc] initWithZoneID:v7 name:v8];
      [v5 addObject:v9];
    }
  }
  if (v6 == 101)
  {
    if (sqlite3_reset(self->selectZones))
    {
      if (a3)
      {
        id v10 = (void *)MEMORY[0x1E4F28C58];
LABEL_15:
        [v10 errorWithSQLite3Statement:self->selectZones];
        id v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      id v12 = 0;
    }
    else
    {
      id v12 = v5;
    }
  }
  else
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectZones];
    }
    int v11 = sqlite3_reset(self->selectZones);
    id v12 = 0;
    if (a3 && v11)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      goto LABEL_15;
    }
  }
LABEL_18:

  return v12;
}

- (id)_deleteZoneWithID:(int64_t)a3
{
  if (a3)
  {
    deleteZone = self->deleteZone;
    id v8 = 0;
    bindIntSQLite3(deleteZone, 1, a3, &v8);
    id v6 = v8;
    if (!v6)
    {
      execSQLite3(self->deleteZone);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)_insertZoneWithName:(id)a3 error:(id *)a4
{
  bindStringSQLite3(self->insertZone, 1, a3, a4);
  if (*a4) {
    return 0;
  }
  insertZone = self->insertZone;
  return steplastrowresetSQLite3(insertZone, a4);
}

- (id)_fillZoneCache
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v3 = [(HMDBackingStoreLocal *)self _fetchZonesWithError:&v19];
  id v4 = v19;
  if (!v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v14 = 0;
          int v11 = [(HMDBackingStoreLocal *)self _fetchGroupsForZone:v10 withError:&v14];
          id v12 = v14;
          [v10 setActualGroups:v11];

          if (v12)
          {
            id v4 = v12;

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [(HMDBackingStoreLocal *)self setZoneCache:v5];
    id v4 = 0;
  }
LABEL_12:

  return v4;
}

- (unint64_t)_fetchIDForStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDBackingStoreLocal *)self storeCache];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8)
  {
    sqlite3_int64 v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    insertStore = self->insertStore;
    id v18 = 0;
    bindStringSQLite3(insertStore, 1, v6, &v18);
    id v11 = v18;
    id v12 = self->insertStore;
    id v17 = v11;
    sqlite3_int64 v9 = steplastrowresetSQLite3(v12, &v17);
    id v13 = v17;

    if (a4) {
      *a4 = v13;
    }
    if (v13)
    {
      sqlite3_int64 v9 = 0;
    }
    else
    {
      id v14 = [(HMDBackingStoreLocal *)self storeCache];
      long long v15 = [NSNumber numberWithUnsignedLongLong:v9];
      [v14 setObject:v15 forKey:v6];
    }
  }

  return v9;
}

- (id)_fetchUncommittedAndPushedTransactions
{
  connection = self->connection;
  uint64_t v6 = 0;
  selectSQLite3(connection, "SELECT id, xact_id, pushed, data, type, encoding, root FROM xact WHERE ((pushed & 0xffff0000) >> 16) != 0 AND disk_committed=0 ORDER BY root, xact_id, id;",
    MEMORY[0x1E4F1CC08],
  uint64_t v3 = &v6);
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_117281);

  return v4;
}

HMDBackingStoreLogRecord *__62__HMDBackingStoreLocal__fetchUncommittedAndPushedTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HMDBackingStoreLogRecord alloc] initWithArray:v2];

  return v3;
}

- (id)_dropUncommittedUnpushedTransactions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = runSQLite3(self->connection, "DELETE FROM xact WHERE ((pushed & 0xffff0000) >> 16) = 0 AND disk_committed=0");
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Dropped transactions that were not committed to disk.", (uint8_t *)&v9, 0xCu);
    }
  }
  return v3;
}

- (int64_t)_numUncommittedTransactions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  connection = self->connection;
  id v19 = 0;
  id v4 = selectSQLite3(connection, "SELECT count(*) FROM xact WHERE disk_committed=0", MEMORY[0x1E4F1CC08], &v19);;
  id v5 = v19;
  if (![v4 count]) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 count];

  if (!v7 || v5 != 0) {
    goto LABEL_12;
  }
  int v9 = [v4 objectAtIndexedSubscript:0];
  id v10 = [v9 objectAtIndexedSubscript:0];

  objc_opt_class();
  uint64_t v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
  id v12 = v11;

  if (v12)
  {
    int64_t v13 = [v12 integerValue];
  }
  else
  {
LABEL_12:
    id v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine number of uncommitted transactions %@", buf, 0x16u);
    }
    int64_t v13 = -1;
  }

  return v13;
}

- (id)_fillStoreCache
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  while (1)
  {
    int v4 = sqlite3_step(self->selectStores);
    if (v4 != 100) {
      break;
    }
    sqlite3_int64 v5 = sqlite3_column_int64(self->selectStores, 0);
    uint64_t v6 = [NSString stringWithSQLite3Column:self->selectStores column:1];
    uint64_t v7 = [NSNumber numberWithLongLong:v5];
    [v3 setValue:v7 forKey:v6];
  }
  if (v4 == 101)
  {
    if (sqlite3_reset(self->selectZones))
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectZones];
    }
    else
    {
      [(HMDBackingStoreLocal *)self setStoreCache:v3];
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectZones];
    if (sqlite3_reset(self->selectZones))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:self->selectZones];

      uint64_t v8 = (void *)v9;
    }
  }

  return v8;
}

- (void)_rollback
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  connection = self->connection;
  if (connection && !sqlite3_get_autocommit(connection))
  {
    int v4 = execSQLite3(self->rollback);
    if (v4)
    {
      sqlite3_int64 v5 = (void *)MEMORY[0x1D9452090]();
      uint64_t v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        int v9 = 138543618;
        id v10 = v8;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@ROLLBACK FAILED!: %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (id)_commit
{
  if (sqlite3_get_autocommit(self->connection))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = execSQLite3(self->commit);
  }
  return v3;
}

- (id)_begin
{
  return execSQLite3(self->begin);
}

- (id)_instanceResources:(BOOL)a3 migrate:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v396 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v8 = self;
  HMFGetOSLogHandle();
  int v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v11 = [(HMDBackingStoreLocal *)v8 datastoreFile];
    *(_DWORD *)buf = 138543618;
    id v391 = v10;
    __int16 v392 = 2112;
    uint64_t v393 = (uint64_t)v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@SQLite datastore file: %@", buf, 0x16u);
  }
  id v12 = [(HMDBackingStoreLocal *)v8 datastoreFile];

  if (!v12)
  {
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    goto LABEL_31;
  }
  sqlite3_initialize();
  if (v5)
  {
    id v13 = [(HMDBackingStoreLocal *)v8 datastoreFile];
    unlink((const char *)[v13 UTF8String]);
  }
  id v14 = [(HMDBackingStoreLocal *)v8 datastoreFile];
  p_connection = &v8->connection;
  int v16 = sqlite3_open_v2((const char *)[v14 UTF8String], &v8->connection, 2, 0);

  id v17 = [(HMDBackingStoreLocal *)v8 datastoreFile];
  id v18 = v17;
  if (!v16)
  {
    int v22 = [v17 isEqualToString:@":memory:"];

    if (v22)
    {
      id v23 = [(HMDBackingStoreLocal *)v8 datastoreFile];
      uint64_t v24 = [(HMDBackingStoreLocal *)v8 _createDatastoreTables:v23];

      if (v24)
      {
        id v20 = v24;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    id v27 = *p_connection;
    id v388 = 0;
    uint64_t v28 = selectSQLite3(v27, "PRAGMA user_version", MEMORY[0x1E4F1CC08], &v388);;
    id v26 = v388;
    v337 = v28;
    id v29 = [v28 firstObject];
    v30 = [v29 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }
    id v32 = v31;

    id v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = v8;
    HMFGetOSLogHandle();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v36 = v32;
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v391 = v37;
      __int16 v392 = 2112;
      uint64_t v393 = (uint64_t)v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %@", buf, 0x16u);

      id v32 = v36;
    }

    if ([v32 unsignedIntegerValue] == 2)
    {
LABEL_21:

LABEL_22:
      id v38 = [NSString stringWithFormat:@"PRAGMA cache_size = %@", &unk_1F2DC8938];;
      id v39 = *p_connection;
      id v40 = v38;
      id v41 = runSQLite3(v39, (const char *)[v40 UTF8String]);

      if (v41)
      {
        id v42 = (void *)MEMORY[0x1D9452090]();
        v43 = v8;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v391 = v45;
          __int16 v392 = 2048;
          uint64_t v393 = 512;
          __int16 v394 = 2112;
          id v395 = v41;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to set sqlite cache size to %ld: %@", buf, 0x20u);
        }
        id v46 = v41;
      }
      else
      {
        id v47 = runSQLite3(*p_connection, "PRAGMA foreign_keys = ON");;
        if (!v47)
        {
          v66 = *p_connection;
          id v386 = 0;
          v67 = selectSQLite3(v66, "PRAGMA journal_mode=WAL", MEMORY[0x1E4F1CC08], &v386);;
          id v68 = v386;
          if (v68 || [v67 count])
          {
            int64_t v69 = (void *)MEMORY[0x1D9452090]();
            __int16 v70 = v8;
            HMFGetOSLogHandle();
            v71 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              id v338 = v40;
              __int16 v72 = v67;
              id v73 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v74 = [v72 firstObject];
              [v74 firstObject];
              v336 = v69;
              id v75 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              id v391 = v73;
              __int16 v392 = 2112;
              uint64_t v393 = (uint64_t)v75;
              __int16 v394 = 2112;
              id v395 = v68;
              _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@turning on WAL resulted in %@ / %@", buf, 0x20u);

              int64_t v69 = v336;
              v67 = v72;
              id v40 = v338;
            }
          }
          __int16 v76 = *p_connection;
          id v385 = v68;
          id v77 = prepareSQLite3(v76, "BEGIN;", &v385);
          id v78 = v385;

          v8->begin = v77;
          id v79 = *p_connection;
          id v384 = v78;
          uint64_t v80 = prepareSQLite3(v79, "COMMIT;", &v384);
          id v81 = v384;

          v8->commit = v80;
          v82 = *p_connection;
          id v383 = v81;
          v83 = prepareSQLite3(v82, "ROLLBACK;", &v383);
          id v84 = v383;

          v8->rollback = v83;
          v85 = *p_connection;
          id v382 = v84;
          v86 = prepareSQLite3(v85, "INSERT INTO zone (name) values (?1)", &v382);
          id v87 = v382;

          v8->insertZone = v86;
          v88 = *p_connection;
          id v381 = v87;
          v89 = prepareSQLite3(v88, "DELETE FROM zone WHERE id=?1;", &v381);
          id v90 = v381;

          v8->deleteZone = v89;
          v91 = *p_connection;
          id v380 = v90;
          v92 = prepareSQLite3(v91, "SELECT id, name FROM zone;", &v380);
          id v93 = v380;

          v8->selectZones = v92;
          v94 = *p_connection;
          id v379 = v93;
          v95 = prepareSQLite3(v94, "INSERT INTO store (name) values (?1)", &v379);
          id v96 = v379;

          v8->insertStore = v95;
          v97 = *p_connection;
          id v378 = v96;
          v98 = prepareSQLite3(v97, "SELECT id, name FROM store;", &v378);
          id v99 = v378;

          v8->selectStores = v98;
          v100 = *p_connection;
          id v377 = v99;
          v101 = prepareSQLite3(v100, "INSERT INTO zone_group (zone_id, root, owner, subscription) VALUES (?1, ?2, ?3, ?4);",
                   &v377);
          id v102 = v377;

          v8->insertGroup = v101;
          v103 = *p_connection;
          id v376 = v102;
          v104 = prepareSQLite3(v103, "DELETE FROM zone_group WHERE id=?1;", &v376);
          id v105 = v376;

          v8->deleteGroup = v104;
          v106 = *p_connection;
          id v375 = v105;
          v107 = prepareSQLite3(v106, "UPDATE zone_group SET token=?1 WHERE id=?2;", &v375);
          id v108 = v375;

          v8->updateGroupToken = v107;
          v109 = *p_connection;
          id v374 = v108;
          v110 = prepareSQLite3(v109, "UPDATE zone_group SET subscription_data=?1 WHERE id=?2;", &v374);
          id v111 = v374;

          v8->updateGroupSubscription = v110;
          v112 = *p_connection;
          id v373 = v111;
          v113 = prepareSQLite3(v112, "SELECT id, root, owner, token, subscription, subscription_data FROM zone_group where zone_id=?1", &v373);
          id v114 = v373;

          v8->selectGroups = v113;
          v115 = *p_connection;
          id v372 = v114;
          v116 = prepareSQLite3(v115, "INSERT INTO zone_share (group_id, root, target) VALUES (?1, ?2, ?3);", &v372);
          id v117 = v372;

          v8->insertShare = v116;
          v118 = *p_connection;
          id v371 = v117;
          v119 = prepareSQLite3(v118, "DELETE FROM zone_share WHERE id=?1;", &v371);
          id v120 = v371;

          v8->deleteShare = v119;
          v121 = *p_connection;
          id v370 = v120;
          v122 = prepareSQLite3(v121, "UPDATE zone_share SET share=?1 WHERE id=?2;", &v370);
          id v123 = v370;

          v8->updateShareShare = v122;
          v124 = *p_connection;
          id v369 = v123;
          v125 = prepareSQLite3(v124, "UPDATE zone_share SET users=?1 WHERE id=?2;", &v369);
          id v126 = v369;

          v8->updateShareUsers = v125;
          v127 = *p_connection;
          id v368 = v126;
          v128 = prepareSQLite3(v127, "SELECT id, root, target, share, users FROM zone_share WHERE group_id=?1;", &v368);
          id v129 = v368;

          v8->selectShares = v128;
          v130 = *p_connection;
          id v367 = v129;
          v131 = prepareSQLite3(v130, "INSERT OR REPLACE INTO record (group_id, share_id, name, record, uuid, parent_uuid, data, encoding, type, schema, store_id) VALUES (?1, 0, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10);",
                   &v367);
          id v132 = v367;

          v8->insertRecord = v131;
          v133 = *p_connection;
          id v366 = v132;
          v134 = prepareSQLite3(v133, "UPDATE record SET schema = ?3 where group_id = ?1 and name = ?2;", &v366);
          id v135 = v366;

          v8->updateRecordSchema = v134;
          v136 = *p_connection;
          id v365 = v135;
          v137 = prepareSQLite3(v136, "SELECT count(*) FROM record WHERE group_id=?1;", &v365);
          id v138 = v365;

          v8->selectRecordCountGroup = v137;
          v139 = *p_connection;
          id v364 = v138;
          v140 = prepareSQLite3(v139, "SELECT type, schema FROM record WHERE group_id=?1 GROUP BY type, schema;", &v364);
          id v141 = v364;

          v8->selectRecordGroupTypeSchema = v140;
          v142 = *p_connection;
          id v363 = v141;
          v143 = prepareSQLite3(v142, "SELECT name, record, encoding, data, uuid, parent_uuid, type, schema FROM record WHERE group_id=?1;",
                   &v363);
          id v144 = v363;

          v8->selectRecordGroup = v143;
          v145 = *p_connection;
          id v362 = v144;
          v146 = prepareSQLite3(v145, "SELECT name, uuid, parent_uuid, type FROM record WHERE group_id=?1;", &v362);
          id v147 = v362;

          v8->selectRecordGroupMap = v146;
          v148 = *p_connection;
          id v361 = v147;
          v149 = prepareSQLite3(v148, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND uuid=?1;",
                   &v361);
          id v150 = v361;

          v8->selectRecordUUID = v149;
          v151 = *p_connection;
          id v360 = v150;
          v152 = prepareSQLite3(v151, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND parent_uuid=?1;",
                   &v360);
          id v153 = v360;

          v8->selectRecordParentUUID = v152;
          v154 = *p_connection;
          id v359 = v153;
          v155 = prepareSQLite3(v154, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?3 and parent_uuid=?1 and type=?2;",
                   &v359);
          id v156 = v359;

          v8->selectRecordParent = v155;
          v157 = *p_connection;
          id v358 = v156;
          v158 = prepareSQLite3(v157, "SELECT record, data, encoding, uuid FROM record WHERE group_id=?2 AND name=?1;",
                   &v358);
          id v159 = v358;

          v8->selectRecordName = v158;
          v160 = *p_connection;
          id v357 = v159;
          v161 = prepareSQLite3(v160, "SELECT record, data, encoding, uuid FROM record WHERE uuid=?1;", &v357);
          id v162 = v357;

          v8->selectRecordUUIDNoShare = v161;
          v163 = *p_connection;
          id v356 = v162;
          v164 = prepareSQLite3(v163, "SELECT record, data, encoding, uuid FROM record WHERE parent_uuid=?1 and type=?2;",
                   &v356);
          id v165 = v356;

          v8->selectRecordParentNoShare = v164;
          v166 = *p_connection;
          id v355 = v165;
          v167 = prepareSQLite3(v166, "SELECT record, data, encoding, uuid FROM record WHERE name=?1;", &v355);
          id v168 = v355;

          v8->selectRecordNameNoShare = v167;
          v169 = *p_connection;
          id v354 = v168;
          v170 = prepareSQLite3(v169, "DELETE FROM record WHERE group_id=?2 AND name=?1;", &v354);
          id v171 = v354;

          v8->deleteRecord = v170;
          v172 = *p_connection;
          id v353 = v171;
          v173 = prepareSQLite3(v172, "SELECT name, group_id, share_id, uuid, parent_uuid, encoding, data, record FROM record ORDER BY group_id, share_id, record;",
                   &v353);
          id v174 = v353;

          v8->selectRecords = v173;
          v175 = *p_connection;
          id v352 = v174;
          v176 = prepareSQLite3(v175, "SELECT name, group_id, share_id, encoding, data, record, schema FROM record WHERE store_id=?1 ORDER BY group_id, share_id, name;",
                   &v352);
          id v177 = v352;

          v8->selectStoreRecords = v176;
          v178 = *p_connection;
          id v351 = v177;
          v179 = prepareSQLite3(v178, "UPDATE xact SET xact_id=?1 WHERE id=?1;", &v351);
          id v180 = v351;

          v8->updateLogXactID = v179;
          v181 = *p_connection;
          id v350 = v180;
          v182 = prepareSQLite3(v181, "INSERT INTO xact (pushed, root, data, xact_id, type, encoding, disk_committed) VALUES (?1, ?2, ?3, ?4, ?5, ?6, 0);",
                   &v350);
          id v183 = v350;

          v8->insertLog = v182;
          v184 = *p_connection;
          id v349 = v183;
          v185 = prepareSQLite3(v184, "UPDATE xact SET disk_committed=1;", &v349);
          id v186 = v349;

          v8->updateLogToDiskCommited = v185;
          v187 = *p_connection;
          id v348 = v186;
          v188 = prepareSQLite3(v187, "SELECT id, xact_id, pushed, data, type, encoding FROM xact WHERE root=?1 AND (pushed & ?2) = ?3 AND xact_id>?4 ORDER BY xact_id, id;",
                   &v348);
          id v189 = v348;

          v8->selectLog = v188;
          v190 = *p_connection;
          id v347 = v189;
          v191 = prepareSQLite3(v190, "SELECT id, xact_id, root FROM xact WHERE (pushed & ?1) = ?2 ORDER BY xact_id, id;",
                   &v347);
          id v192 = v347;

          v8->selectChangeExistsLog = v191;
          v193 = *p_connection;
          id v346 = v192;
          v194 = prepareSQLite3(v193, "SELECT id, xact_id, pushed, root, data, type, encoding FROM xact ORDER BY root, xact_id, id;",
                   &v346);
          id v195 = v346;

          v8->selectAllLog = v194;
          v196 = *p_connection;
          id v345 = v195;
          v197 = prepareSQLite3(v196, "INSERT INTO xact_block (id, data) VALUES (?1, ?2);", &v345);
          id v198 = v345;

          v8->insertLogOptions = v197;
          v199 = *p_connection;
          id v344 = v198;
          v200 = prepareSQLite3(v199, "SELECT data FROM xact_block WHERE id = ?1;", &v344);
          id v201 = v344;

          v8->selectLogOptions = v200;
          v202 = *p_connection;
          id v343 = v201;
          v203 = prepareSQLite3(v202, "UPDATE xact SET pushed=(((pushed & ?1) | ?2) | (pushed & ~?1)) WHERE id=?3;",
                   &v343);
          id v204 = v343;

          v8->updateLog = v203;
          v205 = *p_connection;
          id v342 = v204;
          v206 = prepareSQLite3(v205, "DELETE FROM xact WHERE id=?1;", &v342);
          id v207 = v342;

          v8->deleteLog = v206;
          v208 = *p_connection;
          id v341 = v207;
          v209 = prepareSQLite3(v208, "DELETE FROM xact WHERE ((pushed & 0xffff0000 >> 16) = (pushed & 0x0000ffff)) AND disk_committed=1", &v341);
          id v210 = v341;

          v8->flushPushedXact = v209;
          v211 = *p_connection;
          id v340 = v210;
          v212 = prepareSQLite3(v211, "REPLACE INTO archive VALUES(?1, ?2, ?3)", &v340);
          id v213 = v340;

          v8->insertArchive = v212;
          v214 = *p_connection;
          id v339 = v213;
          v215 = prepareSQLite3(v214, "SELECT identifier, controller_username, value from archive where identifier=?1;",
                   &v339);
          id v216 = v339;

          v8->selectArchive = v215;
          if (v216)
          {
            v217 = (void *)MEMORY[0x1D9452090]();
            v218 = v8;
            v219 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR))
            {
              v220 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v391 = v220;
              __int16 v392 = 2112;
              uint64_t v393 = (uint64_t)v216;
              _os_log_impl(&dword_1D49D5000, v219, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statements: %@", buf, 0x16u);
            }
            id v221 = v216;
          }
          else
          {
            if ([(HMDBackingStoreLocal *)v8 _numUncommittedTransactions] >= 1)
            {
              v242 = (void *)MEMORY[0x1D9452090]();
              v243 = v8;
              HMFGetOSLogHandle();
              v244 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v244, OS_LOG_TYPE_ERROR))
              {
                v245 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                id v391 = v245;
                _os_log_impl(&dword_1D49D5000, v244, OS_LOG_TYPE_ERROR, "%{public}@We crashed after running transaction but before saving to disk.", buf, 0xCu);
              }
            }
            v246 = [(HMDBackingStoreLocal *)v8 _fillZoneCache];
            if (!v246)
            {
              uint64_t v21 = [(HMDBackingStoreLocal *)v8 _fillStoreCache];

              id v25 = 0;
              goto LABEL_29;
            }
            id v221 = v246;
          }
          id v25 = v221;

          uint64_t v21 = v25;
LABEL_29:

          goto LABEL_30;
        }
        id v46 = v47;
      }
      id v25 = v46;
      uint64_t v21 = v46;
      goto LABEL_29;
    }
    id v333 = v32;
    id v49 = (void *)MEMORY[0x1D9452090]();
    int64_t v50 = v34;
    HMFGetOSLogHandle();
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v391 = v52;
      _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@Validating database.", buf, 0xCu);
    }
    id v53 = *p_connection;
    id v387 = v26;
    id v54 = v50;
    id v55 = selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='table' AND name='xact_block'", MEMORY[0x1E4F1CC08], &v387);
    id v56 = v55;
    id v57 = v387;
    if (v55) {
      BOOL v58 = v387 == 0;
    }
    else {
      BOOL v58 = 0;
    }
    char v59 = !v58;
    char context = v59;
    v334 = v53;
    v335 = v54;
    if (v58)
    {
      if (![v55 count])
      {
        runSQLite3(v53, "CREATE TABLE xact_block (id INTEGER PRIMARY KEY, data BLOB NOT NULL);");
        id v387 = (id)objc_claimAutoreleasedReturnValue();
        if (v387)
        {
          char v222 = 0;
LABEL_108:
          v270 = v335;
          goto LABEL_109;
        }
      }
    }
    else
    {
      id v60 = (void *)MEMORY[0x1D9452090]();
      id v61 = v54;
      id v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        id v63 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v391 = v63;
        __int16 v392 = 2112;
        uint64_t v393 = (uint64_t)v56;
        __int16 v394 = 2112;
        id v395 = v57;
        _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_ERROR, "%{public}@initial migration test failed with result / error: %@ / %@", buf, 0x20u);
      }
      id v64 = [v57 userInfo];
      id v65 = [v64 objectForKey:@"extcode"];
      if ([v65 isEqual:&unk_1F2DC8968])
      {

        id v53 = v334;
      }
      else
      {
        v223 = [v57 userInfo];
        v224 = [v223 objectForKey:@"extcode"];
        int v225 = [v224 isEqual:&unk_1F2DC8980];

        id v53 = v334;
        if (!v225)
        {
          [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
          char v222 = 0;
          id v387 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_108;
        }
      }
      if (isInternalBuild())
      {
        v226 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:"/var/mobile/Library/homed" isDirectory:1 relativeToURL:0];
        v227 = +[HMDTTRManager sharedManager];
        v389 = v226;
        v228 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v389 count:1];
        [v227 requestRadarWithDisplayReason:@"internal database is corrupt" radarTitle:@"Internal Database Corruption Detected" componentName:@"HomeKit" componentVersion:@"New Bugs" componentID:590644 attachments:v228];

        id v53 = v334;
      }
    }
    v229 = selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='index' AND name='xact_pushed2'", MEMORY[0x1E4F1CC08], &v387);

    id v230 = v387;
    if (v387)
    {
      v231 = (void *)MEMORY[0x1D9452090]();
      v232 = v335;
      v233 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
      {
        v234 = HMFGetLogIdentifier();
        uint64_t v235 = [v229 count];
        *(_DWORD *)buf = 138543874;
        id v391 = v234;
        __int16 v392 = 2048;
        uint64_t v393 = v235;
        __int16 v394 = 2112;
        id v395 = v230;
        _os_log_impl(&dword_1D49D5000, v233, OS_LOG_TYPE_ERROR, "%{public}@xact_pushed2 migration test failed with result %lu items %@", buf, 0x20u);

        id v53 = v334;
      }
    }
    else if (![v229 count])
    {
      runSQLite3(v53, "CREATE INDEX xact_pushed2 ON xact(root, xact_id, id);");
      id v387 = (id)objc_claimAutoreleasedReturnValue();
      if (v387) {
        goto LABEL_107;
      }
    }
    id v56 = selectSQLite3(v53, "SELECT subscription_data FROM zone_group WHERE subscription_data IS NOT NULL LIMIT 1", MEMORY[0x1E4F1CC08], &v387);

    id v236 = v387;
    if (!v56 || v387)
    {
      v237 = (void *)MEMORY[0x1D9452090]();
      v238 = v335;
      v239 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v239, OS_LOG_TYPE_ERROR))
      {
        v240 = HMFGetLogIdentifier();
        uint64_t v241 = [v56 count];
        *(_DWORD *)buf = 138543874;
        id v391 = v240;
        __int16 v392 = 2048;
        uint64_t v393 = v241;
        __int16 v394 = 2112;
        id v395 = v236;
        _os_log_impl(&dword_1D49D5000, v239, OS_LOG_TYPE_ERROR, "%{public}@zone_group.subscription_data migration test failed with result %lu items %@", buf, 0x20u);

        id v53 = v334;
      }

      if (v236)
      {
        runSQLite3(v53, "ALTER TABLE zone_group ADD COLUMN subscription_data BLOB;");
        id v387 = (id)objc_claimAutoreleasedReturnValue();
        if (v387) {
          goto LABEL_74;
        }
      }
    }
    runSQLite3(v53, "CREATE TABLE IF NOT EXISTS archive (identifier string primary key, controller_username string not null, value blob not null);");
    id v387 = (id)objc_claimAutoreleasedReturnValue();
    if (v387)
    {
LABEL_74:
      char v222 = 0;
      goto LABEL_108;
    }
    v229 = selectSQLite3(v53, "SELECT disk_committed FROM xact WHERE id IS NOT NULL LIMIT 1", MEMORY[0x1E4F1CC08], &v387);

    id v247 = v387;
    if (v229 && !v387) {
      goto LABEL_88;
    }
    v248 = (void *)MEMORY[0x1D9452090]();
    v249 = v335;
    v250 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
    {
      v251 = HMFGetLogIdentifier();
      uint64_t v252 = [v229 count];
      *(_DWORD *)buf = 138543874;
      id v391 = v251;
      __int16 v392 = 2048;
      uint64_t v393 = v252;
      __int16 v394 = 2112;
      id v395 = v247;
      _os_log_impl(&dword_1D49D5000, v250, OS_LOG_TYPE_ERROR, "%{public}@xact.disk_committed migration test failed with result %lu items %@", buf, 0x20u);

      id v53 = v334;
    }

    if (!v247
      || (runSQLite3(v53, "ALTER TABLE xact ADD COLUMN disk_committed INTEGER NOT NULL DEFAULT 1;"),
          (id v387 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_88:
      v253 = selectSQLite3(v53, "SELECT schema FROM record WHERE data IS NOT NULL LIMIT 1", MEMORY[0x1E4F1CC08], &v387);

      id v254 = v387;
      if (!v253 || v387)
      {
        v255 = (void *)MEMORY[0x1D9452090]();
        v256 = v335;
        v257 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
        {
          v258 = HMFGetLogIdentifier();
          uint64_t v259 = [v253 count];
          *(_DWORD *)buf = 138543874;
          id v391 = v258;
          __int16 v392 = 2048;
          uint64_t v393 = v259;
          __int16 v394 = 2112;
          id v395 = v254;
          _os_log_impl(&dword_1D49D5000, v257, OS_LOG_TYPE_ERROR, "%{public}@record.schema migration test failed with result %lu items %@", buf, 0x20u);

          id v53 = v334;
        }

        char context = 1;
      }
      v260 = selectSQLite3(v53, "SELECT name FROM sqlite_master WHERE type='table' AND name='zone_group'", MEMORY[0x1E4F1CC08], &v387);

      id v261 = v387;
      if (!v260 || v387)
      {
        v262 = (void *)MEMORY[0x1D9452090]();
        v263 = v335;
        v264 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
        {
          v265 = HMFGetLogIdentifier();
          uint64_t v266 = [v260 count];
          *(_DWORD *)buf = 138543874;
          id v391 = v265;
          __int16 v392 = 2048;
          uint64_t v393 = v266;
          __int16 v394 = 2112;
          id v395 = v261;
          _os_log_impl(&dword_1D49D5000, v264, OS_LOG_TYPE_ERROR, "%{public}@zone_group migration test failed with result %lu items %@", buf, 0x20u);

          id v53 = v334;
        }
      }
      if ([v260 count]) {
        char v267 = context;
      }
      else {
        char v267 = 1;
      }
      v268 = selectSQLite3(v53, "SELECT type FROM record WHERE uuid = ''", MEMORY[0x1E4F1CC08], &v387);

      id v269 = v387;
      if (!v268 || v387)
      {
        contexta = (void *)MEMORY[0x1D9452090]();
        v285 = v335;
        v286 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR))
        {
          v287 = HMFGetLogIdentifier();
          uint64_t v288 = [v268 count];
          *(_DWORD *)buf = 138543874;
          id v391 = v287;
          __int16 v392 = 2048;
          uint64_t v393 = v288;
          __int16 v394 = 2112;
          id v395 = v269;
          _os_log_impl(&dword_1D49D5000, v286, OS_LOG_TYPE_ERROR, "%{public}@record table migration test failed with result %lu items %@", buf, 0x20u);

          id v53 = v334;
        }

        if (!v268)
        {
          contextb = (void *)MEMORY[0x1D9452090]();
          v305 = v285;
          v300 = HMFGetOSLogHandle();
          v270 = v335;
          if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
          {
            v306 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v391 = v306;
            _os_log_impl(&dword_1D49D5000, v300, OS_LOG_TYPE_ERROR, "%{public}@record table migration test failed with nil result", buf, 0xCu);
          }
          id v56 = 0;
          goto LABEL_137;
        }
        if (v267) {
          goto LABEL_104;
        }
      }
      else if (v267)
      {
LABEL_104:
        id v56 = v268;
LABEL_133:
        v270 = v335;
        goto LABEL_145;
      }
      id v56 = selectSQLite3(v53, "SELECT name FROM zone WHERE id = 0", MEMORY[0x1E4F1CC08], &v387);

      id v289 = v387;
      if (!v56 || v387)
      {
        v290 = (void *)MEMORY[0x1D9452090]();
        v291 = v335;
        v292 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
        {
          v293 = HMFGetLogIdentifier();
          uint64_t v294 = [v56 count];
          *(_DWORD *)buf = 138543874;
          id v391 = v293;
          __int16 v392 = 2048;
          uint64_t v393 = v294;
          __int16 v394 = 2112;
          id v395 = v289;
          _os_log_impl(&dword_1D49D5000, v292, OS_LOG_TYPE_ERROR, "%{public}@zone migration test failed with result %lu items %@", buf, 0x20u);

          id v53 = v334;
        }
      }
      if (![v56 count]) {
        goto LABEL_133;
      }
      id v295 = selectSQLite3(v53, "SELECT type FROM xact WHERE id = 0", MEMORY[0x1E4F1CC08], &v387);
      v296 = v53;
      uint64_t v297 = (uint64_t)v387;
      v270 = v335;
      if (v387)
      {
        v298 = (void *)MEMORY[0x1D9452090](v296);
        v299 = v335;
        v300 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
        {
          v301 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v391 = v301;
          __int16 v392 = 2112;
          uint64_t v393 = v297;
          v302 = "%{public}@xact migration test failed with result %@";
          v303 = v300;
          uint32_t v304 = 22;
LABEL_142:
          _os_log_impl(&dword_1D49D5000, v303, OS_LOG_TYPE_ERROR, v302, buf, v304);

          goto LABEL_143;
        }
        goto LABEL_143;
      }
      v307 = selectSQLite3(v296, "SELECT id FROM xact WHERE pushed < 0x0100000000000000", MEMORY[0x1E4F1CC08], &v387);

      id v308 = v387;
      if (v387 || [v307 count])
      {
        id v56 = v307;
        v298 = (void *)MEMORY[0x1D9452090]();
        v309 = v335;
        v300 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
        {
          v301 = HMFGetLogIdentifier();
          uint64_t v310 = [v56 count];
          *(_DWORD *)buf = 138543874;
          id v391 = v301;
          __int16 v392 = 2048;
          uint64_t v393 = v310;
          __int16 v394 = 2112;
          id v395 = v308;
          v302 = "%{public}@xact version migration test failed with result %lu items %@";
          v303 = v300;
          uint32_t v304 = 32;
          goto LABEL_142;
        }
LABEL_143:
        id v53 = v334;
        goto LABEL_144;
      }
      if (isInternalBuild())
      {
        selectSQLite3(v334, "select uuid, share_id, count(*) from record group by uuid, group_id having count(*)>1;",
          MEMORY[0x1E4F1CC08],
        id v56 = &v387);

        if ([v56 count])
        {
          v318 = (void *)MEMORY[0x1D9452090]();
          v319 = v335;
          v320 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
          {
            v321 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v391 = v321;
            _os_log_impl(&dword_1D49D5000, v320, OS_LOG_TYPE_ERROR, "%{public}@We have duplicate records with different share_ids deleting duplicates.", buf, 0xCu);
          }
          runSQLite3(v334, "delete from record where uuid in (select uuid from record group by uuid, group_id having count(*)>1) and share_id!=0;");
          id v387 = (id)objc_claimAutoreleasedReturnValue();
          if (v387)
          {
            contextb = (void *)MEMORY[0x1D9452090]();
            v322 = v319;
            v300 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
            {
LABEL_169:
              id v53 = v334;
LABEL_137:
              v298 = contextb;
LABEL_144:

LABEL_145:
              if (a4)
              {
                sqlite3_close(v53);
                v311 = [(HMDBackingStoreLocal *)v270 datastoreFile];
                [(HMDBackingStoreLocal *)v270 _createNewDatastore:v311];
                v312 = v53;
                id v313 = (id)objc_claimAutoreleasedReturnValue();
                id v387 = v313;

                if (v313)
                {
                  if (v312) {
                    sqlite3_close(v312);
                  }
                  char v222 = 0;
                }
                else
                {
                  char v222 = 1;
                }
              }
              else
              {
                v314 = (void *)MEMORY[0x1D9452090]();
                v315 = v270;
                v316 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR))
                {
                  v317 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  id v391 = v317;
                  _os_log_impl(&dword_1D49D5000, v316, OS_LOG_TYPE_ERROR, "%{public}@want to rebuild the databse, but not allowed to.", buf, 0xCu);
                }
                [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
                char v222 = 0;
                id v387 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_109:

              id v271 = v387;
              if (v222)
              {
                v272 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %ld", 2);;
                v273 = *p_connection;
                id v274 = v272;
                runSQLite3(v273, (const char *)[v274 UTF8String]);
                v276 = v275 = v270;

                v277 = (void *)MEMORY[0x1D9452090]();
                v278 = v275;
                v279 = HMFGetOSLogHandle();
                v280 = v279;
                if (!v276)
                {
                  v283 = v279;
                  if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    id v284 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    id v391 = v284;
                    __int16 v392 = 2048;
                    uint64_t v393 = 2;
                    _os_log_impl(&dword_1D49D5000, v283, OS_LOG_TYPE_DEFAULT, "%{public}@Current schema version: %ld", buf, 0x16u);
                  }

                  id v26 = 0;
                  id v32 = v333;
                  goto LABEL_21;
                }
                v281 = v333;
                if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
                {
                  v282 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  id v391 = v282;
                  __int16 v392 = 2048;
                  uint64_t v393 = 2;
                  __int16 v394 = 2112;
                  id v395 = v276;
                  _os_log_impl(&dword_1D49D5000, v280, OS_LOG_TYPE_ERROR, "%{public}@Unable to update schema version to %ld: %@", buf, 0x20u);
                }
                id v25 = v276;
              }
              else
              {
                id v25 = v271;
                v281 = v333;
              }

              uint64_t v21 = v25;
              goto LABEL_30;
            }
            v323 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v391 = v323;
            v324 = "%{public}@Unable to delete duplicate entries";
LABEL_168:
            _os_log_impl(&dword_1D49D5000, v300, OS_LOG_TYPE_ERROR, v324, buf, 0xCu);

            goto LABEL_169;
          }
        }
        v307 = v56;
      }
      id v56 = selectSQLite3(v334, "select uuid from record where share_id!=0", MEMORY[0x1E4F1CC08], &v387);;

      if (![v56 count]) {
        goto LABEL_170;
      }
      v325 = (void *)MEMORY[0x1D9452090]();
      v326 = v335;
      v327 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_DEFAULT))
      {
        v328 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v391 = v328;
        _os_log_impl(&dword_1D49D5000, v327, OS_LOG_TYPE_DEFAULT, "%{public}@Have records with share_id will migrate them.", buf, 0xCu);
      }
      runSQLite3(v334, "update record set share_id = 0 where share_id != 0;");
      id v387 = (id)objc_claimAutoreleasedReturnValue();
      if (!v387)
      {
LABEL_170:
        char v222 = 1;
        goto LABEL_109;
      }
      contextb = (void *)MEMORY[0x1D9452090]();
      v329 = v326;
      v300 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v300, OS_LOG_TYPE_ERROR)) {
        goto LABEL_169;
      }
      v323 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v391 = v323;
      v324 = "%{public}@Unable to migrate share_ids";
      goto LABEL_168;
    }
LABEL_107:
    char v222 = 0;
    id v56 = v229;
    goto LABEL_108;
  }
  id v19 = [(HMDBackingStoreLocal *)v8 _createNewDatastore:v17];

  if (!v19)
  {
LABEL_14:
    id v26 = 0;
    goto LABEL_22;
  }
  id v20 = v19;
LABEL_13:
  id v25 = v20;
  uint64_t v21 = v20;
LABEL_30:

LABEL_31:
  return v21;
}

- (id)_updateRecordWithGroupID:(int64_t)a3 name:(id)a4 schema:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  updateRecordSchema = self->updateRecordSchema;
  id v25 = 0;
  bindIntSQLite3(updateRecordSchema, 1, a3, &v25);
  id v11 = v25;
  id v12 = self->updateRecordSchema;
  id v24 = v11;
  bindStringSQLite3(v12, 2, v8, &v24);
  id v13 = v24;

  id v14 = self->updateRecordSchema;
  id v23 = v13;
  bindStringSQLite3(v14, 3, v9, &v23);
  id v15 = v23;

  int v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v27 = v19;
    __int16 v28 = 2048;
    int64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Updating record schema: %lu, name: %@, schema: %@", buf, 0x2Au);
  }
  if (v15)
  {
    id v20 = v15;
  }
  else
  {
    execSQLite3(self->updateRecordSchema);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v21 = v20;

  return v21;
}

- (void)_freeResources
{
  if (self->rollback) {
    [(HMDBackingStoreLocal *)self _rollback];
  }
  sqlite3_finalize(self->insertZone);
  self->insertZone = 0;
  sqlite3_finalize(self->deleteZone);
  self->deleteZone = 0;
  sqlite3_finalize(self->selectZones);
  self->selectZones = 0;
  sqlite3_finalize(self->insertStore);
  self->insertStore = 0;
  sqlite3_finalize(self->selectStores);
  self->selectStores = 0;
  sqlite3_finalize(self->insertGroup);
  self->insertGroup = 0;
  sqlite3_finalize(self->deleteGroup);
  self->deleteGroup = 0;
  sqlite3_finalize(self->updateShareShare);
  self->updateShareShare = 0;
  sqlite3_finalize(self->updateShareUsers);
  self->updateShareUsers = 0;
  sqlite3_finalize(self->updateGroupToken);
  self->updateGroupToken = 0;
  sqlite3_finalize(self->updateGroupSubscription);
  self->updateGroupSubscription = 0;
  sqlite3_finalize(self->insertShare);
  self->insertShare = 0;
  sqlite3_finalize(self->deleteShare);
  self->deleteShare = 0;
  sqlite3_finalize(self->selectGroups);
  self->selectGroups = 0;
  sqlite3_finalize(self->selectShares);
  self->selectShares = 0;
  sqlite3_finalize(self->insertRecord);
  self->insertRecord = 0;
  sqlite3_finalize(self->updateRecordSchema);
  self->updateRecordSchema = 0;
  sqlite3_finalize(self->selectRecordCountGroup);
  self->selectRecordCountGroup = 0;
  sqlite3_finalize(self->selectRecordGroupTypeSchema);
  self->selectRecordGroupTypeSchema = 0;
  sqlite3_finalize(self->selectRecordGroup);
  self->selectRecordGroup = 0;
  sqlite3_finalize(self->selectRecordGroupMap);
  self->selectRecordGroupMap = 0;
  sqlite3_finalize(self->selectRecordUUID);
  self->selectRecordUUID = 0;
  sqlite3_finalize(self->selectRecordParentUUID);
  self->selectRecordParentUUID = 0;
  sqlite3_finalize(self->selectRecordParent);
  self->selectRecordParent = 0;
  sqlite3_finalize(self->selectRecordName);
  self->selectRecordName = 0;
  sqlite3_finalize(self->selectRecordUUIDNoShare);
  self->selectRecordUUIDNoShare = 0;
  sqlite3_finalize(self->selectRecordNameNoShare);
  self->selectRecordNameNoShare = 0;
  sqlite3_finalize(self->selectRecordParentNoShare);
  self->selectRecordParentNoShare = 0;
  sqlite3_finalize(self->selectRecords);
  self->selectRecords = 0;
  sqlite3_finalize(self->selectStoreRecords);
  self->selectStoreRecords = 0;
  sqlite3_finalize(self->deleteRecord);
  self->deleteRecord = 0;
  sqlite3_finalize(self->insertLog);
  self->insertLog = 0;
  sqlite3_finalize(self->updateLogToDiskCommited);
  self->updateLogToDiskCommited = 0;
  sqlite3_finalize(self->flushPushedXact);
  self->flushPushedXact = 0;
  sqlite3_finalize(self->updateLogXactID);
  self->updateLogXactID = 0;
  sqlite3_finalize(self->selectLog);
  self->selectLog = 0;
  sqlite3_finalize(self->selectChangeExistsLog);
  self->selectChangeExistsLog = 0;
  sqlite3_finalize(self->selectAllLog);
  self->selectAllLog = 0;
  sqlite3_finalize(self->insertLogOptions);
  self->insertLogOptions = 0;
  sqlite3_finalize(self->selectLogOptions);
  self->selectLogOptions = 0;
  sqlite3_finalize(self->updateLog);
  self->updateLog = 0;
  sqlite3_finalize(self->deleteLog);
  self->deleteLog = 0;
  sqlite3_finalize(self->insertArchive);
  self->insertArchive = 0;
  sqlite3_finalize(self->selectArchive);
  self->selectArchive = 0;
  sqlite3_finalize(self->commit);
  self->commit = 0;
  sqlite3_finalize(self->rollback);
  self->rollback = 0;
  sqlite3_finalize(self->begin);
  self->begin = 0;
  sqlite3_close(self->connection);
  self->connection = 0;
  free(self->sqlite3_cache);
  self->sqlite3_cache = 0;
}

- (id)flush:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__117424;
  id v17 = __Block_byref_object_dispose__117425;
  id v18 = 0;
  BOOL v5 = [HMDBackingStoreLocalFlushOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__HMDBackingStoreLocal_flush___block_invoke;
  v12[3] = &unk_1E6A0FF60;
  v12[4] = &v13;
  uint64_t v6 = [(HMDBackingStoreLocalFlushOperation *)v5 initWithStore:self clearCloud:v3 resultHandler:v12];
  uint64_t v7 = +[HMDBackingStoreSingleton sharedInstance];
  id v8 = [v7 queue];
  [v8 addOperation:v6];

  [(HMDBackingStoreLocalFlushOperation *)v6 waitUntilFinished];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"HMDBackingStoreLocalDataReset" object:self];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __30__HMDBackingStoreLocal_flush___block_invoke(uint64_t a1, void *a2)
{
}

- (void)dealloc
{
  [(HMDBackingStoreLocal *)self _freeResources];
  v3.receiver = self;
  v3.super_class = (Class)HMDBackingStoreLocal;
  [(HMDBackingStoreLocal *)&v3 dealloc];
}

- (HMDBackingStoreLocal)initWithDatastore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  BOOL v5 = [(HMDBackingStoreLocal *)self initWithDB:v4 migrate:1 error:&v13];
  id v6 = v13;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@unable to instance our resources: %@", buf, 0x16u);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (HMDBackingStoreLocal)initWithDB:(id)a3 migrate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreLocal;
  id v10 = [(HMDBackingStoreLocal *)&v19 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_datastoreFile, a3);
    +[HMDBackingStoreLocal cleanDatastoreFilesAt:v9 everything:0];
    id v12 = [(HMDBackingStoreLocal *)v11 _instanceResources:0 migrate:v6];
    if (v12)
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v11;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@unable to instance our resources: %@", buf, 0x16u);
      }
      id v17 = 0;
      if (a5) {
        *a5 = v12;
      }
    }
    else
    {
      id v17 = v11;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_createDatastoreTables:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE zone (id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING NOT NULL)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE store (id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING NOT NULL)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE zone_group (id INTEGER PRIMARY KEY AUTOINCREMENT, zone_id INTEGER NOT NULL CONSTRAINT group_zone_id_fkey REFERENCES zone (id) ON DELETE RESTRICT, root TEXT NOT NULL, owner TEXT NOT NULL, token BLOB, subscription TEXT, subscription_data BLOB)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE zone_share (id INTEGER PRIMARY KEY AUTOINCREMENT, group_id INTEGER NOT NULL CONSTRAINT group_zone_id_fkey REFERENCES zone_group (id) ON DELETE RESTRICT, root TEXT NOT NULL, target TEXT, share BLOB, users BLOB)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE record (group_id INTEGER NOT NULL CONSTRAINT record_group_id_fkey REFERENCES zone_group (id) ON DELETE RESTRICT, share_id INTEGER NOT NULL CONSTRAINT record_share_id_fkey REFERENCES zone_share (id) ON DELETE RESTRICT, store_id INTEGER NOT NULL CONSTRAINT record_store_id_fkey REFERENCES store (id) ON DELETE RESTRICT, name TEXT NOT NULL, type TEXT, uuid TEXT, parent_uuid TEXT, encoding INTEGER NOT NULL, record BLOB NOT NULL, data BLOB NOT NULL, schema STRING)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE xact (id INTEGER PRIMARY KEY AUTOINCREMENT, xact_id INTEGER NOT NULL, pushed INTEGER, root TEXT NOT NULL, type INT NOT NULL, encoding INTEGER NOT NULL, data BLOB NOT NULL, disk_committed INTEGER NOT NULL DEFAULT 1)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE TABLE xact_block (id INTEGER PRIMARY KEY, data BLOB NOT NULL)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE UNIQUE INDEX zone_name ON zone (name)");
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE UNIQUE INDEX store_name ON store (name)");
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE UNIQUE INDEX group_owner_root_zone_id_ukey ON zone_group (owner, root, zone_id)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE UNIQUE INDEX share_root_group_id_ukey ON zone_share (root, group_id)");;
  if (v5) {
    goto LABEL_16;
  }
  BOOL v5 = runSQLite3(self->connection, "CREATE UNIQUE INDEX record_group_id_share_id_name_ukey ON record (group_id, share_id, name)");;
  if (v5
    || (runSQLite3(self->connection, "CREATE INDEX xact_pushed ON xact (root, pushed, xact_id);"),
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->connection, "CREATE INDEX xact_pushed2 ON xact (root, xact_id, id);"),
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->connection, "CREATE TABLE IF NOT EXISTS archive (identifier string primary key, controller_username string not null, value blob not null);"),
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_16:
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@unable to initialize SQL context: %@", buf, 0x16u);
    }
LABEL_18:

    sqlite3_close(self->connection);
    unlink((const char *)[v4 UTF8String]);
    id v10 = v5;
    goto LABEL_19;
  }
  BOOL v5 = runSQLite3(self->connection, "INSERT INTO zone (id, name) VALUES (0, '<NULL>')");;
  if (v5
    || (runSQLite3(self->connection, "INSERT INTO zone_group (id, zone_id, root, owner) VALUES (0, 0, '<NULL>', '<NULL>');"),
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || (runSQLite3(self->connection, "INSERT INTO zone_share (id, group_id, root) VALUES (0, 0, '<NULL>');"),
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@initial database row setup failed: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %ld", 2);;
  connection = self->connection;
  id v15 = v13;
  runSQLite3(connection, (const char *)[v15 UTF8String]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_super v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v19;
      __int16 v23 = 2048;
      uint64_t v24 = 2;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@unable to set schema version to %ld failed: %@", buf, 0x20u);
    }
    sqlite3_close(self->connection);
    unlink((const char *)[v4 UTF8String]);
    id v20 = v10;
  }

LABEL_19:
  return v10;
}

- (id)_createNewDatastore:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v47[0] = v4;
  BOOL v5 = [v4 stringByAppendingString:@"-shm"];
  v47[1] = v5;
  BOOL v6 = [v4 stringByAppendingString:@"-wal"];
  v47[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v36 = v4;
    char v10 = 0;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(id *)(*((void *)&v37 + 1) + 8 * i);
        if (unlink((const char *)[v13 UTF8String]) && *__error() != 2)
        {
          id v14 = (void *)MEMORY[0x1D9452090]();
          id v15 = self;
          __int16 v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = HMFGetLogIdentifier();
            uint64_t v18 = __error();
            objc_super v19 = strerror(*v18);
            *(_DWORD *)buf = 138543874;
            id v42 = v17;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v13;
            __int16 v45 = 2080;
            id v46 = v19;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to remove old datastore file %@ (%s)", buf, 0x20u);
          }
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v9);

    id v4 = v36;
    if (v10) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v20 = v4;
  if (sqlite3_open_v2((const char *)[v20 UTF8String], &self->connection, 6, 0))
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    __int16 v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v24;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@unable to open new SQL context: %@", buf, 0x16u);
    }
LABEL_20:
    __int16 v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    goto LABEL_27;
  }
  id v26 = [NSString stringWithFormat:@"PRAGMA cache_size = %@", &unk_1F2DC8938];;
  connection = self->connection;
  id v28 = v26;
  runSQLite3(connection, (const char *)[v28 UTF8String]);
  int64_t v29 = (char *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    __int16 v30 = (void *)MEMORY[0x1D9452090]();
    id v31 = self;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v42 = v33;
      __int16 v43 = 2048;
      uint64_t v44 = 512;
      __int16 v45 = 2112;
      id v46 = v29;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to set sqlite cache size to %ld: %@", buf, 0x20u);
    }
    uint64_t v34 = v29;
  }
  else
  {
    uint64_t v34 = [(HMDBackingStoreLocal *)self _createDatastoreTables:v20];
  }
  __int16 v25 = v34;

LABEL_27:
  return v25;
}

- (id)_runSQLite3:(const char *)a3 bind:(id)a4 error:(id *)a5
{
  return selectSQLite3(self->connection, a3, a4, a5);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59_117500 != -1) {
    dispatch_once(&logCategory__hmf_once_t59_117500, &__block_literal_global_202);
  }
  id v2 = (void *)logCategory__hmf_once_v60_117501;
  return v2;
}

uint64_t __35__HMDBackingStoreLocal_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v60_117501;
  logCategory__hmf_once_v60_117501 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)cleanDatastoreFilesAt:(id)a3 everything:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@":memory:"])
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      char v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v53 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping because in memory store was specified.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = NSString;
    id v12 = [v6 lastPathComponent];
    id v13 = [v11 stringWithFormat:@"^%@(?:|-shm|-wal)(\\..*)?$", v12];

    id v50 = 0;
    id v14 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v13 options:0 error:&v50];
    id v15 = v50;
    if (v15)
    {
      __int16 v16 = v15;
      id v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = a1;
      objc_super v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v53 = v20;
        __int16 v54 = 2112;
        id v55 = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@unable to compile expression: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      __int16 v22 = [v6 stringByDeletingLastPathComponent];
      id v49 = 0;
      __int16 v23 = [v21 contentsOfDirectoryAtPath:v22 error:&v49];
      id v24 = v49;
      __int16 v25 = (void *)[v23 mutableCopy];

      id v44 = v24;
      if (v24)
      {
        id v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = a1;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v53 = v29;
          __int16 v54 = 2112;
          id v55 = v22;
          __int16 v56 = 2112;
          id v57 = v44;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);
        }
      }
      else
      {
        id v42 = v13;
        id v43 = v6;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v41 = v25;
        id v30 = v25;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v46 != v33) {
                objc_enumerationMutation(v30);
              }
              id v35 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              id v36 = objc_msgSend(v14, "firstMatchInString:options:range:", v35, 0, 0, objc_msgSend(v35, "length"));
              long long v37 = v36;
              if (v36)
              {
                [v36 rangeAtIndex:1];
                if (v38 || v4)
                {
                  long long v40 = [v22 stringByAppendingPathComponent:v35];
                  [v21 removeItemAtPath:v40 error:0];
                }
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v32);
        }

        id v13 = v42;
        id v6 = v43;
        __int16 v25 = v41;
      }

      __int16 v16 = v44;
    }
  }
}

@end