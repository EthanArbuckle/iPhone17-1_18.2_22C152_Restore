@interface CKDShareIDSQLCache
+ (double)expirationTime;
- (BOOL)removeShareWithShareEntry:(id)a3 error:(id *)a4;
- (CKContainerID)containerID;
- (CKDDeviceCapabilityShareIDSQLTableGroup)tableGroup;
- (CKDShareIDCacheRecordTable)recordTable;
- (CKDShareIDCacheTable)shareIDTable;
- (CKDShareIDSQLCache)initWithContainer:(id)a3 error:(id *)a4;
- (CKDZoneIDCacheTable)zoneIDTable;
- (CKDZoneShareCacheTable)zoneShareTable;
- (id)shareIDForRecordID:(id)a3;
- (id)shareIDsForZoneID:(id)a3;
- (id)zoneShareIDForZoneID:(id)a3;
- (void)addHierarchicalShareID:(id)a3 forRootRecordID:(id)a4;
- (void)addOrUpdateRecordID:(id)a3 withParentID:(id)a4;
- (void)addZoneShareID:(id)a3;
- (void)removeRecordID:(id)a3;
- (void)removeShareID:(id)a3;
- (void)removeZoneShareForZoneID:(id)a3;
- (void)removeZoneWithID:(id)a3;
@end

@implementation CKDShareIDSQLCache

+ (double)expirationTime
{
  return 15552000.0;
}

- (CKDShareIDSQLCache)initWithContainer:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CKDShareIDSQLCache;
  v9 = [(CKDShareIDSQLCache *)&v61 init];
  if (!v9) {
    goto LABEL_22;
  }
  uint64_t v10 = objc_msgSend_containerID(v6, v7, v8);
  containerID = v9->_containerID;
  v9->_containerID = (CKContainerID *)v10;

  v14 = objc_msgSend_directoryContext(v6, v12, v13);
  v17 = objc_msgSend_daemonDatabaseDirectory(v14, v15, v16);

  v20 = objc_msgSend_containerID(v6, v18, v19);
  v23 = objc_msgSend_containerIdentifier(v20, v21, v22);

  v24 = (void *)MEMORY[0x1E4F1A370];
  v27 = objc_msgSend_path(v17, v25, v26);
  v30 = objc_msgSend_deviceContext(v6, v28, v29);
  v33 = objc_msgSend_deviceScopedDatabase(v30, v31, v32);
  id v60 = 0;
  v35 = objc_msgSend_databaseInDirectory_registryDatabase_options_error_(v24, v34, (uint64_t)v27, v33, 0, &v60);
  id v36 = v60;

  if (!v35 || v36)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v55 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v63 = v23;
      __int16 v64 = 2112;
      id v65 = v36;
      _os_log_error_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_ERROR, "Failed to create Device Capability Cache for containerID %@, error: %@", buf, 0x16u);
      if (!a4) {
        goto LABEL_12;
      }
    }
    else if (!a4)
    {
LABEL_12:
      int v54 = 1;
      goto LABEL_20;
    }
    id v36 = v36;
    *a4 = v36;
    goto LABEL_12;
  }
  v38 = objc_msgSend__groupNameForContainer_(CKDDeviceCapabilityShareIDSQLTableGroup, v37, (uint64_t)v6);
  id v59 = 0;
  v40 = objc_msgSend_tableGroupInDatabase_withName_error_(CKDDeviceCapabilityShareIDSQLTableGroup, v39, (uint64_t)v35, v38, &v59);
  id v41 = v59;
  id v36 = v41;
  if (!v40 || v41)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v56 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v63 = v23;
      __int16 v64 = 2112;
      id v65 = v36;
      _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Failed to create Device Capability Cache for containerID %@, error: %@", buf, 0x16u);
      if (!a4) {
        goto LABEL_18;
      }
    }
    else if (!a4)
    {
LABEL_18:
      int v54 = 1;
      goto LABEL_19;
    }
    *a4 = v36;
    goto LABEL_18;
  }
  objc_storeStrong((id *)&v9->_tableGroup, v40);
  uint64_t v43 = objc_msgSend_tableWithName_(v40, v42, @"ZoneIDCacheTable");
  zoneIDTable = v9->_zoneIDTable;
  v9->_zoneIDTable = (CKDZoneIDCacheTable *)v43;

  uint64_t v46 = objc_msgSend_tableWithName_(v40, v45, @"ShareIDCacheTable");
  shareIDTable = v9->_shareIDTable;
  v9->_shareIDTable = (CKDShareIDCacheTable *)v46;

  uint64_t v49 = objc_msgSend_tableWithName_(v40, v48, @"ZoneShareTable");
  zoneShareTable = v9->_zoneShareTable;
  v9->_zoneShareTable = (CKDZoneShareCacheTable *)v49;

  uint64_t v52 = objc_msgSend_tableWithName_(v40, v51, @"ShareIDCacheRecordTable");
  recordTable = v9->_recordTable;
  v9->_recordTable = (CKDShareIDCacheRecordTable *)v52;

  int v54 = 0;
LABEL_19:

LABEL_20:
  if (!v54)
  {
LABEL_22:
    v57 = v9;
    goto LABEL_23;
  }
  v57 = 0;
LABEL_23:

  return v57;
}

- (BOOL)removeShareWithShareEntry:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9 = objc_msgSend_zoneShareTable(self, v7, v8);
  v12 = objc_msgSend_zoneRowID(v6, v10, v11);
  id v32 = 0;
  objc_msgSend_removeRowID_error_(v9, v13, (uint64_t)v12, &v32);
  id v14 = v32;

  if (!v14)
  {
    v17 = objc_msgSend_recordTable(self, v15, v16);
    v20 = objc_msgSend_rowID(v6, v18, v19);
    id v31 = 0;
    objc_msgSend_removeRecordsWithShareRowID_error_(v17, v21, (uint64_t)v20, &v31);
    id v14 = v31;

    if (!v14)
    {
      v24 = objc_msgSend_shareIDTable(self, v22, v23);
      v27 = objc_msgSend_rowID(v6, v25, v26);
      id v30 = 0;
      objc_msgSend_removeRowID_error_(v24, v28, (uint64_t)v27, &v30);
      id v14 = v30;
    }
  }
  if (a4) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)shareIDForRecordID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1C4D97AE4;
  v21 = sub_1C4D97AF4;
  id v22 = 0;
  v7 = objc_msgSend_tableGroup(self, v5, v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D97AFC;
  v14[3] = &unk_1E64F2068;
  v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  uint64_t v16 = &v17;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v14);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) shareIDForRecordID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)zoneShareIDForZoneID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1C4D97AE4;
  v21 = sub_1C4D97AF4;
  id v22 = 0;
  v7 = objc_msgSend_tableGroup(self, v5, v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D97E1C;
  v14[3] = &unk_1E64F2068;
  v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  uint64_t v16 = &v17;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v14);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) zoneShareIDForZoneID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)shareIDsForZoneID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1C4D97AE4;
  v21 = sub_1C4D97AF4;
  id v22 = (id)objc_opt_new();
  v7 = objc_msgSend_tableGroup(self, v5, v6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D980DC;
  v14[3] = &unk_1E64F2068;
  v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  uint64_t v16 = &v17;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v14);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) shareIDsForZoneID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)addOrUpdateRecordID:(id)a3 withParentID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_tableGroup(self, v8, v9);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D98388;
  v16[3] = &unk_1E64F0458;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  id v14 = objc_msgSend_performTransaction_(v10, v13, (uint64_t)v16);

  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "(%@) addOrUpdateRecordID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)removeRecordID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_tableGroup(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D985DC;
  v12[3] = &unk_1E64F2090;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v12);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) removeRecordID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)addZoneShareID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_tableGroup(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D9883C;
  v12[3] = &unk_1E64F2090;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v12);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) addZoneShareID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)addHierarchicalShareID:(id)a3 forRootRecordID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_tableGroup(self, v8, v9);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D98B7C;
  v16[3] = &unk_1E64F0458;
  id v11 = v6;
  id v17 = v11;
  uint64_t v18 = self;
  id v12 = v7;
  id v19 = v12;
  id v14 = objc_msgSend_performTransaction_(v10, v13, (uint64_t)v16);

  if (v14)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v15 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v21 = self;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_ERROR, "(%@) addHierarchicalShareID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)removeShareID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_tableGroup(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D98F2C;
  v12[3] = &unk_1E64F2090;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v12);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) removeShareID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)removeZoneShareForZoneID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_tableGroup(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D99160;
  v12[3] = &unk_1E64F2090;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v12);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) removeZoneShareForZoneID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (void)removeZoneWithID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_tableGroup(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D9940C;
  v12[3] = &unk_1E64F2090;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  uint64_t v10 = objc_msgSend_performTransaction_(v7, v9, (uint64_t)v12);

  if (v10)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v11 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "(%@) removeZoneWithID failed with SQLite database error: %@", buf, 0x16u);
    }
  }
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKDDeviceCapabilityShareIDSQLTableGroup)tableGroup
{
  return self->_tableGroup;
}

- (CKDZoneIDCacheTable)zoneIDTable
{
  return self->_zoneIDTable;
}

- (CKDShareIDCacheTable)shareIDTable
{
  return self->_shareIDTable;
}

- (CKDZoneShareCacheTable)zoneShareTable
{
  return self->_zoneShareTable;
}

- (CKDShareIDCacheRecordTable)recordTable
{
  return self->_recordTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTable, 0);
  objc_storeStrong((id *)&self->_zoneShareTable, 0);
  objc_storeStrong((id *)&self->_shareIDTable, 0);
  objc_storeStrong((id *)&self->_zoneIDTable, 0);
  objc_storeStrong((id *)&self->_tableGroup, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end