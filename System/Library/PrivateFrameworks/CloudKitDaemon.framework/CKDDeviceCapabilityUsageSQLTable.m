@interface CKDDeviceCapabilityUsageSQLTable
+ (Class)entryClass;
+ (id)dbProperties;
- (CKContainerID)containerID;
- (CKDDeviceCapabilityUsageSQLTable)init;
- (id)_recordWithUnknownShareUsageForRecordID:(id)a3;
- (id)_recordWithUnknownShareUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4;
- (id)_shareUsageForShareID:(id)a3;
- (id)_shareUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4;
- (id)_usageEntriesForContainerID:(id)a3 itemType:(unint64_t)a4 maxCount:(unint64_t)a5;
- (id)_usageForIDString:(id)a3 itemType:(unint64_t)a4;
- (id)_zoneUsageForZoneID:(id)a3;
- (id)_zoneUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4;
- (void)_deleteRecordWithUnknownShareUsageForRecordID:(id)a3;
- (void)_deleteShareUsageForShareID:(id)a3;
- (void)_deleteUsageForIDString:(id)a3 itemType:(unint64_t)a4;
- (void)_deleteZoneUsageForZoneID:(id)a3;
- (void)_setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4;
- (void)_setShareUsage:(id)a3 forShareID:(id)a4;
- (void)_setUsage:(id)a3 forIDString:(id)a4 forItemType:(unint64_t)a5;
- (void)_setZoneUsage:(id)a3 forZoneID:(id)a4;
- (void)setContainerID:(id)a3;
@end

@implementation CKDDeviceCapabilityUsageSQLTable

+ (id)dbProperties
{
  v5[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rowID";
  v4[1] = @"IDString";
  v5[0] = &unk_1F20AC6C0;
  v5[1] = &unk_1F20AC6D8;
  v4[2] = @"itemType";
  v4[3] = @"lastUsed";
  v5[2] = &unk_1F20AC6F0;
  v5[3] = &unk_1F20AC708;
  v4[4] = @"lastSent";
  v4[5] = @"sending";
  v5[4] = &unk_1F20AC708;
  v5[5] = &unk_1F20AC708;
  v4[6] = @"failureCount";
  v5[6] = &unk_1F20AC720;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 7);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDDeviceCapabilityUsageSQLTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDDeviceCapabilityUsageSQLTable;
  return [(CKSQLiteCacheTable *)&v3 initWithLogicalTableName:@"UsageTable" entryCountLimit:100000 dataSizeLimit:0 expirationTime:0.0 expireDelay:86400.0];
}

- (id)_zoneUsageForZoneID:(id)a3
{
  v4 = objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend__usageForIDString_itemType_(self, v5, (uint64_t)v4, 1);

  return v6;
}

- (id)_shareUsageForShareID:(id)a3
{
  v4 = objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend__usageForIDString_itemType_(self, v5, (uint64_t)v4, 2);

  return v6;
}

- (id)_recordWithUnknownShareUsageForRecordID:(id)a3
{
  v4 = objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  v6 = objc_msgSend__usageForIDString_itemType_(self, v5, (uint64_t)v4, 3);

  return v6;
}

- (id)_usageForIDString:(id)a3 itemType:(unint64_t)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27[0] = @"IDString";
  v27[1] = @"itemType";
  v28[0] = v6;
  v8 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v7, a4);
  v28[1] = v8;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v28, v27, 2);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1C4EE3554;
  v25 = sub_1C4EE3564;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4EE356C;
  v17[3] = &unk_1E64F0498;
  v17[4] = self;
  id v11 = v10;
  id v18 = v11;
  id v12 = v6;
  id v19 = v12;
  v20 = &v21;
  id v14 = (id)objc_msgSend_performTransaction_(self, v13, (uint64_t)v17);
  id v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (id)_zoneUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v60 = self;
  v57 = v6;
  v9 = objc_msgSend__usageEntriesForContainerID_itemType_maxCount_(self, v8, (uint64_t)v6, 1, a4);
  id v12 = v9;
  if (v9 && objc_msgSend_count(v9, v10, v11))
  {
    v58 = v7;
    v13 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v56 = v12;
    id obj = v12;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v65, v74, 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v66;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v66 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v65 + 1) + 8 * v18);
          v20 = [CKUsageInfo alloc];
          v22 = objc_msgSend_initWithUsageInfoEntry_(v20, v21, (uint64_t)v19);
          id v23 = objc_alloc(MEMORY[0x1E4F1A320]);
          id v26 = objc_msgSend_IDString(v19, v24, v25);
          v28 = objc_msgSend_initWithSqliteRepresentation_(v23, v27, (uint64_t)v26);

          if (v22) {
            BOOL v31 = v28 == 0;
          }
          else {
            BOOL v31 = 1;
          }
          if (v31
            || (objc_msgSend_itemType(v19, v29, v30),
                v32 = objc_claimAutoreleasedReturnValue(),
                uint64_t v35 = objc_msgSend_unsignedIntegerValue(v32, v33, v34),
                v32,
                v35 != 1))
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v37 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v57;
              _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Fetched device capability usage entry cannot be converted CKUsageInfo for containerID %@", buf, 0xCu);
            }
            objc_msgSend_addObject_(v13, v38, (uint64_t)v19);
          }
          else
          {
            objc_msgSend_setObject_forKeyedSubscript_(v58, v36, (uint64_t)v22, v28);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v65, v74, 16);
      }
      while (v16);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v40 = v13;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v61, v73, 16);
    if (v42)
    {
      uint64_t v44 = v42;
      uint64_t v45 = *(void *)v62;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v40);
          }
          v47 = *(void **)(*((void *)&v61 + 1) + 8 * v46);
          v48 = objc_msgSend_deleteObject_(v60, v43, (uint64_t)v47);

          if (v48)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v49 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v50 = v49;
              v53 = objc_msgSend_IDString(v47, v51, v52);
              *(_DWORD *)buf = 138412546;
              v70 = v53;
              __int16 v71 = 2112;
              v72 = @"ZoneUsage";
              _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Failed to delete usage entry with IDString %@ and itemType %@", buf, 0x16u);
            }
          }
          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v61, v73, 16);
      }
      while (v44);
    }

    v7 = v58;
    id v54 = v58;

    id v12 = v56;
  }
  else
  {
    id v54 = 0;
  }

  return v54;
}

- (id)_shareUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v60 = self;
  v57 = v6;
  v9 = objc_msgSend__usageEntriesForContainerID_itemType_maxCount_(self, v8, (uint64_t)v6, 2, a4);
  id v12 = v9;
  if (v9 && objc_msgSend_count(v9, v10, v11))
  {
    v58 = v7;
    v13 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v56 = v12;
    id obj = v12;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v65, v74, 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v66;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v66 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v65 + 1) + 8 * v18);
          v20 = [CKUsageInfo alloc];
          v22 = objc_msgSend_initWithUsageInfoEntry_(v20, v21, (uint64_t)v19);
          id v23 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          id v26 = objc_msgSend_IDString(v19, v24, v25);
          v28 = objc_msgSend_initWithSqliteRepresentation_(v23, v27, (uint64_t)v26);

          if (v22) {
            BOOL v31 = v28 == 0;
          }
          else {
            BOOL v31 = 1;
          }
          if (v31
            || (objc_msgSend_itemType(v19, v29, v30),
                v32 = objc_claimAutoreleasedReturnValue(),
                uint64_t v35 = objc_msgSend_unsignedIntegerValue(v32, v33, v34),
                v32,
                v35 != 2))
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v37 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v57;
              _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Fetched device capability usage entry cannot be converted CKUsageInfo for containerID %@", buf, 0xCu);
            }
            objc_msgSend_addObject_(v13, v38, (uint64_t)v19);
          }
          else
          {
            objc_msgSend_setObject_forKeyedSubscript_(v58, v36, (uint64_t)v22, v28);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v65, v74, 16);
      }
      while (v16);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v40 = v13;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v61, v73, 16);
    if (v42)
    {
      uint64_t v44 = v42;
      uint64_t v45 = *(void *)v62;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v40);
          }
          v47 = *(void **)(*((void *)&v61 + 1) + 8 * v46);
          v48 = objc_msgSend_deleteObject_(v60, v43, (uint64_t)v47);

          if (v48)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v49 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v50 = v49;
              v53 = objc_msgSend_IDString(v47, v51, v52);
              *(_DWORD *)buf = 138412546;
              v70 = v53;
              __int16 v71 = 2112;
              v72 = @"ShareUsage";
              _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Failed to delete usage entry with IDString %@ and itemType %@", buf, 0x16u);
            }
          }
          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v61, v73, 16);
      }
      while (v44);
    }

    v7 = v58;
    id v54 = v58;

    id v12 = v56;
  }
  else
  {
    id v54 = 0;
  }

  return v54;
}

- (id)_recordWithUnknownShareUsagesForContainerID:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v60 = self;
  v57 = v6;
  v9 = objc_msgSend__usageEntriesForContainerID_itemType_maxCount_(self, v8, (uint64_t)v6, 3, a4);
  id v12 = v9;
  if (v9 && objc_msgSend_count(v9, v10, v11))
  {
    v58 = v7;
    v13 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v56 = v12;
    id obj = v12;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v65, v74, 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v66;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v66 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v65 + 1) + 8 * v18);
          v20 = [CKUsageInfo alloc];
          v22 = objc_msgSend_initWithUsageInfoEntry_(v20, v21, (uint64_t)v19);
          id v23 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          id v26 = objc_msgSend_IDString(v19, v24, v25);
          v28 = objc_msgSend_initWithSqliteRepresentation_(v23, v27, (uint64_t)v26);

          if (v22) {
            BOOL v31 = v28 == 0;
          }
          else {
            BOOL v31 = 1;
          }
          if (v31
            || (objc_msgSend_itemType(v19, v29, v30),
                v32 = objc_claimAutoreleasedReturnValue(),
                uint64_t v35 = objc_msgSend_unsignedIntegerValue(v32, v33, v34),
                v32,
                v35 != 3))
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v37 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v57;
              _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Fetched device capability usage entry cannot be converted CKUsageInfo for containerID %@", buf, 0xCu);
            }
            objc_msgSend_addObject_(v13, v38, (uint64_t)v19);
          }
          else
          {
            objc_msgSend_setObject_forKeyedSubscript_(v58, v36, (uint64_t)v22, v28);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v65, v74, 16);
      }
      while (v16);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v40 = v13;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v61, v73, 16);
    if (v42)
    {
      uint64_t v44 = v42;
      uint64_t v45 = *(void *)v62;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v40);
          }
          v47 = *(void **)(*((void *)&v61 + 1) + 8 * v46);
          v48 = objc_msgSend_deleteObject_(v60, v43, (uint64_t)v47);

          if (v48)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v49 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
            {
              v50 = v49;
              v53 = objc_msgSend_IDString(v47, v51, v52);
              *(_DWORD *)buf = 138412546;
              v70 = v53;
              __int16 v71 = 2112;
              v72 = @"RecordWithUnknownShareUsage";
              _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Failed to delete usage entry with IDString %@ and itemType %@", buf, 0x16u);
            }
          }
          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v61, v73, 16);
      }
      while (v44);
    }

    v7 = v58;
    id v54 = v58;

    id v12 = v56;
  }
  else
  {
    id v54 = 0;
  }

  return v54;
}

- (id)_usageEntriesForContainerID:(id)a3 itemType:(unint64_t)a4 maxCount:(unint64_t)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1C4EE3554;
  v29 = sub_1C4EE3564;
  id v30 = 0;
  BOOL v31 = @"itemType";
  v10 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v9, a4);
  v32[0] = v10;
  id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v32, &v31, 1);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4EE4630;
  v19[3] = &unk_1E64F5438;
  v19[4] = self;
  id v13 = v12;
  id v20 = v13;
  unint64_t v23 = a5;
  unint64_t v24 = a4;
  id v14 = v8;
  id v21 = v14;
  v22 = &v25;
  id v16 = (id)objc_msgSend_performInTransaction_(self, v15, (uint64_t)v19);
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (void)_setZoneUsage:(id)a3 forZoneID:(id)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(a4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setUsage_forIDString_forItemType_(self, v9, (uint64_t)v6, v10, 1);
}

- (void)_setShareUsage:(id)a3 forShareID:(id)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(a4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setUsage_forIDString_forItemType_(self, v9, (uint64_t)v6, v10, 2);
}

- (void)_setRecordWithUnknownShareUsage:(id)a3 forRecordID:(id)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(a4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setUsage_forIDString_forItemType_(self, v9, (uint64_t)v6, v10, 3);
}

- (void)_setUsage:(id)a3 forIDString:(id)a4 forItemType:(unint64_t)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v25[0] = v9;
  v24[0] = @"IDString";
  v24[1] = @"itemType";
  uint64_t v11 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v10, a5);
  v25[1] = v11;
  id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v25, v24, 2);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4EE4BF8;
  v19[3] = &unk_1E64F5490;
  v19[4] = self;
  id v20 = v13;
  id v22 = v8;
  unint64_t v23 = a5;
  id v21 = v9;
  id v14 = v8;
  id v15 = v9;
  id v16 = v13;
  id v18 = (id)objc_msgSend_performTransaction_(self, v17, (uint64_t)v19);
}

- (void)_deleteZoneUsageForZoneID:(id)a3
{
  objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteUsageForIDString_itemType_(self, v4, (uint64_t)v5, 1);
}

- (void)_deleteShareUsageForShareID:(id)a3
{
  objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteUsageForIDString_itemType_(self, v4, (uint64_t)v5, 2);
}

- (void)_deleteRecordWithUnknownShareUsageForRecordID:(id)a3
{
  objc_msgSend_sqliteRepresentation(a3, a2, (uint64_t)a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteUsageForIDString_itemType_(self, v4, (uint64_t)v5, 3);
}

- (void)_deleteUsageForIDString:(id)a3 itemType:(unint64_t)a4
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v23[0] = @"IDString";
  v23[1] = @"itemType";
  v24[0] = v6;
  id v8 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v7, a4);
  v24[1] = v8;
  id v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v24, v23, 2);

  id v18 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v11, (uint64_t)v10, off_1E64F54B0, &v18, &unk_1F2043E30);
  id v12 = v18;
  if (v12)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      id v17 = objc_msgSend_containerID(self, v15, v16);
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "Failed to delete usage entry for IDString %@ in DeviceCapabilityUsageSQLTable for containerID %@", buf, 0x16u);
    }
  }
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end