@interface CKDRecordCacheTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)_cachedRecordHasValidAssets:(id)a3 forRequiredKeys:(id)a4;
- (BOOL)_cachedRecordKnownUserKeyData:(id)a3 satisfiesRequiredKeys:(id)a4;
- (CKDRecordCacheTable)init;
- (id)_dsidForAccount:(id)a3;
- (id)_recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6;
- (id)_trimRecord:(id)a3 toRequiredKeys:(id)a4;
- (id)etagForRecordID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6;
- (id)fetchCacheEntryRecordData:(id)a3;
- (id)recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6;
- (id)recordsWithIDs:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6;
- (unint64_t)numberOfRecordsWithID:(id)a3 container:(id)a4;
- (void)addRecord:(id)a3 container:(id)a4 knownUserKeys:(id)a5 scope:(int64_t)a6;
- (void)clearAllRecords;
- (void)clearAllRecordsForZoneWithID:(id)a3;
- (void)clearAllRecordsInScope:(int64_t)a3;
- (void)clearAssetAuthTokensForRecord:(id)a3 container:(id)a4 scope:(int64_t)a5;
- (void)clearAssetAuthTokensForRecordWithID:(id)a3 container:(id)a4 scope:(int64_t)a5;
- (void)deleteRecordWithID:(id)a3 scope:(int64_t)a4;
@end

@implementation CKDRecordCacheTable

+ (id)dbProperties
{
  return &unk_1F20AB998;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDRecordCacheTable)init
{
  v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  uint64_t v7 = objc_msgSend_recordCacheEntryCountLimit(v4, v5, v6);
  uint64_t v10 = objc_msgSend_recordCacheSizeLimit(v4, v8, v9);
  double v13 = (double)(int)objc_msgSend_cachedRecordExpiryTime(v4, v11, v12);
  objc_msgSend_recordCacheExpireDelay(v4, v14, v15);
  v19.receiver = self;
  v19.super_class = (Class)CKDRecordCacheTable;
  v17 = [(CKSQLiteCacheTable *)&v19 initWithLogicalTableName:@"RecordCache" entryCountLimit:v7 dataSizeLimit:v10 expirationTime:v13 expireDelay:v16];

  return v17;
}

- (id)_dsidForAccount:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_accountType(v3, v4, v5) == 1)
  {
    v8 = @"Anonymous";
  }
  else
  {
    uint64_t v9 = objc_msgSend_dsid(v3, v6, v7);
    if (v9) {
      v8 = (__CFString *)v9;
    }
    else {
      v8 = @"Unknown";
    }
  }

  return v8;
}

- (BOOL)_cachedRecordKnownUserKeyData:(id)a3 satisfiesRequiredKeys:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v26, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        if (CKIsIndexedArrayKey())
        {

          char isSubsetOfSet = 0;
          goto LABEL_12;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v22, v26, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v13, v14, v22);
  char v17 = objc_msgSend_containsObject_(v5, v16, (uint64_t)v15);

  if (v17)
  {
    char isSubsetOfSet = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char isSubsetOfSet = 0;
    if (v6 && (isKindOfClass & 1) != 0) {
      char isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v6, v21, (uint64_t)v5);
    }
  }
LABEL_12:

  return isSubsetOfSet;
}

- (BOOL)_cachedRecordHasValidAssets:(id)a3 forRequiredKeys:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 1;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1C4D49128;
  v39 = sub_1C4D49138;
  id v40 = 0;
  uint64_t v9 = objc_msgSend_valueStore(v5, v7, v8);
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v46, 2);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1C4D49140;
  v31[3] = &unk_1E64F02D0;
  id v12 = v6;
  id v32 = v12;
  v33 = &v35;
  v34 = &v41;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v9, v13, (uint64_t)v11, v31);

  if (*((unsigned char *)v42 + 24) && objc_msgSend_count((void *)v36[5], v14, v15))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = (id)v36[5];
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v27, v45, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v16);
          }
          long long v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend_paddedFileSize(v23, v18, v19, (void)v27))
          {
            *((unsigned char *)v42 + 24) = 0;
            goto LABEL_13;
          }
          objc_msgSend_setWasCached_(v23, v24, 1);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v27, v45, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  BOOL v25 = *((unsigned char *)v42 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

- (id)fetchCacheEntryRecordData:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_primaryKeyProperties(self, v5, v6);
  uint64_t v9 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v8, (uint64_t)&unk_1F20AB5C8, v4, v7, off_1E64F02F0);

  return v9;
}

- (id)_recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  v60[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v44 = a5;
  if (!v11)
  {
    v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v44);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CKDRecordCache.m", 192, @"Can't fetch a record if we don't have a recordID");
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1C4D49128;
  v57 = sub_1C4D49138;
  id v58 = 0;
  uint64_t v15 = objc_msgSend_account(v12, v13, v14, v44);
  char v17 = objc_msgSend__dsidForAccount_(self, v16, (uint64_t)v15);

  v59[0] = @"RECORDID";
  uint64_t v20 = objc_msgSend_sqliteRepresentation(v11, v18, v19);
  v60[0] = v20;
  v59[1] = @"ENVIRONMENT";
  uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
  long long v24 = objc_msgSend_containerID(v12, v22, v23);
  uint64_t v27 = objc_msgSend_environment(v24, v25, v26);
  long long v29 = objc_msgSend_numberWithInteger_(v21, v28, v27);
  v60[1] = v29;
  v59[2] = @"SCOPE";
  v31 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v30, a6);
  v59[3] = @"DSID";
  v60[2] = v31;
  v60[3] = v17;
  v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v60, v59, 4);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C4D495F0;
  void v46[3] = &unk_1E64F0348;
  v46[4] = self;
  id v34 = v33;
  id v47 = v34;
  id v35 = v45;
  id v48 = v35;
  id v36 = v12;
  id v49 = v36;
  v51 = &v53;
  int64_t v52 = a6;
  id v37 = v11;
  id v50 = v37;
  id v39 = (id)objc_msgSend_performInTransaction_(self, v38, (uint64_t)v46);
  id v40 = (id)v54[5];

  _Block_object_dispose(&v53, 8);
  return v40;
}

- (id)_trimRecord:(id)a3 toRequiredKeys:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_msgSend_setTrackChanges_(v5, v6, 0);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v10 = objc_msgSend_valuesByKey(v5, v8, v9);
    double v13 = objc_msgSend_allKeys(v10, v11, v12);

    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v43, v48, 16);
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v7, v16, v20) & 1) == 0) {
            objc_msgSend_setObject_forKeyedSubscript_(v5, v16, 0, v20);
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v43, v48, 16);
      }
      while (v17);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v23 = objc_msgSend_encryptedValues(v5, v21, v22, 0);
    uint64_t v26 = objc_msgSend_allKeys(v23, v24, v25);

    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, v47, 16);
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v26);
          }
          uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          if ((objc_msgSend_containsObject_(v7, v29, v33) & 1) == 0)
          {
            id v35 = objc_msgSend_encryptedValues(v5, v29, v34);
            objc_msgSend_setObject_forKeyedSubscript_(v35, v36, 0, v33);
          }
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, v47, 16);
      }
      while (v30);
    }

    objc_msgSend_setTrackChanges_(v5, v37, 1);
  }

  return v5;
}

- (id)recordWithID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v16 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15);
  char v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if (v19)
  {
    uint64_t v22 = 0;
  }
  else
  {
    if (!v11)
    {
      uint64_t v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, @"CKDRecordCache.m", 269, @"Expected a recordID");
    }
    uint64_t v22 = objc_msgSend__recordWithID_container_requiredKeys_scope_(self, v20, (uint64_t)v11, v12, v13, a6);
    if ((objc_msgSend__cachedRecordHasValidAssets_forRequiredKeys_(self, v23, (uint64_t)v22, v13) & 1) == 0)
    {

      uint64_t v22 = 0;
    }
    id v25 = (id)objc_msgSend__trimRecord_toRequiredKeys_(self, v24, (uint64_t)v22, v13);
  }

  return v22;
}

- (id)recordsWithIDs:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v16 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15);
  char v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if (v19)
  {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v73 = v13;
    if (!objc_msgSend_count(v11, v20, v21))
    {
      v68 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v68, v69, (uint64_t)a2, self, @"CKDRecordCache.m", 287, @"Expected recordIDs");
    }
    v71 = objc_opt_new();
    id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v28 = objc_msgSend_count(v11, v26, v27);
    uint64_t v30 = objc_msgSend_initWithCapacity_(v25, v29, v28);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v31 = v11;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v82, v88, 16);
    if (v33)
    {
      uint64_t v36 = v33;
      uint64_t v37 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v83 != v37) {
            objc_enumerationMutation(v31);
          }
          long long v39 = objc_msgSend_sqliteRepresentation(*(void **)(*((void *)&v82 + 1) + 8 * i), v34, v35);
          objc_msgSend_addObject_(v30, v40, (uint64_t)v39);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v82, v88, 16);
      }
      while (v36);
    }

    v86[0] = @"ENVIRONMENT";
    long long v41 = (void *)MEMORY[0x1E4F28ED0];
    long long v44 = objc_msgSend_containerID(v12, v42, v43);
    uint64_t v47 = objc_msgSend_environment(v44, v45, v46);
    uint64_t v49 = objc_msgSend_numberWithInteger_(v41, v48, v47);
    v87[0] = v49;
    v86[1] = @"SCOPE";
    objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v50, a6);
    v51 = int64_t v70 = a6;
    v87[1] = v51;
    v86[2] = @"DSID";
    v54 = objc_msgSend_account(v12, v52, v53);
    v56 = objc_msgSend__dsidForAccount_(self, v55, (uint64_t)v54);
    v87[2] = v56;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)v87, v86, 3);
    id v72 = v11;
    v59 = id v58 = self;

    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = sub_1C4D4A144;
    v74[3] = &unk_1E64F0398;
    v74[4] = v58;
    id v75 = v59;
    id v76 = v30;
    id v13 = v73;
    id v77 = v73;
    id v78 = v12;
    int64_t v81 = v70;
    id v79 = v31;
    id v60 = v71;
    id v80 = v60;
    id v61 = v30;
    id v62 = v59;
    v63 = v58;
    id v11 = v72;
    id v65 = (id)objc_msgSend_performInTransaction_(v63, v64, (uint64_t)v74);
    v66 = v80;
    id v22 = v60;
  }
  return v22;
}

- (unint64_t)numberOfRecordsWithID:(id)a3 container:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = a4;
  if (!*MEMORY[0x1E4F1A4E0])
  {
    id v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, self, @"CKDRecordCache.m", 366, @"Only suitable for testing");
  }
  v33[0] = @"RECORDID";
  id v11 = objc_msgSend_sqliteRepresentation(v7, v8, v9);
  v34[0] = v11;
  v33[1] = @"ENVIRONMENT";
  id v12 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v15 = objc_msgSend_containerID(v10, v13, v14);
  uint64_t v18 = objc_msgSend_environment(v15, v16, v17);
  uint64_t v20 = objc_msgSend_numberWithInteger_(v12, v19, v18);
  v34[1] = v20;
  v33[2] = @"DSID";
  uint64_t v23 = objc_msgSend_account(v10, v21, v22);
  id v25 = objc_msgSend__dsidForAccount_(self, v24, (uint64_t)v23);
  v34[2] = v25;
  uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v34, v33, 3);

  unint64_t v29 = objc_msgSend_countOfEntriesMatching_label_error_predicate_(self, v28, (uint64_t)v27, off_1E64F03B8, 0, &unk_1F2042730);
  return v29;
}

- (void)addRecord:(id)a3 container:(id)a4 knownUserKeys:(id)a5 scope:(int64_t)a6
{
  v162[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v16 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v14, v15);
  char v19 = objc_msgSend_disableCaching(v16, v17, v18);

  if ((v19 & 1) == 0)
  {
    if (!v11)
    {
      v136 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v136, v137, (uint64_t)a2, self, @"CKDRecordCache.m", 383, @"Null record");
    }
    uint64_t v22 = objc_msgSend_recordID(v11, v20, v21);

    if (!v22)
    {
      v138 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v138, v139, (uint64_t)a2, self, @"CKDRecordCache.m", 384, @"Null recordID");
    }
    id v25 = objc_msgSend_recordID(v11, v23, v24);
    uint64_t v28 = objc_msgSend_recordName(v25, v26, v27);

    if (!v28)
    {
      v140 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v29, v30);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v140, v141, (uint64_t)a2, self, @"CKDRecordCache.m", 385, @"Null recordName");
    }
    id v31 = objc_msgSend_recordID(v11, v29, v30);
    uint64_t v34 = objc_msgSend_zoneID(v31, v32, v33);

    if (!v34)
    {
      v142 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v35, v36);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v142, v143, (uint64_t)a2, self, @"CKDRecordCache.m", 386, @"Null zoneID");
    }
    uint64_t v37 = objc_msgSend_etag(v11, v35, v36);

    if (!v37)
    {
      v144 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v38, v39);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v144, v145, (uint64_t)a2, self, @"CKDRecordCache.m", 387, @"Null etag");
    }
    uint64_t v154 = 0;
    v155 = &v154;
    uint64_t v156 = 0x2020000000;
    char v157 = 0;
    long long v40 = objc_msgSend_valueStore(v11, v38, v39);
    v162[0] = objc_opt_class();
    v162[1] = objc_opt_class();
    long long v42 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v41, (uint64_t)v162, 2);
    char v44 = objc_msgSend_containsValueOfClasses_passingTest_(v40, v43, (uint64_t)v42, &unk_1F2042750);

    char v157 = v44;
    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = sub_1C4D4B0E4;
    v153[3] = &unk_1E64F0418;
    v153[4] = &v154;
    objc_msgSend_enumerateObjectsUsingBlock_(v13, v45, (uint64_t)v153);
    if (!*((unsigned char *)v155 + 24))
    {
      unsigned int v148 = objc_msgSend_serializeProtectionData(v11, v46, v47);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v146 = objc_msgSend_serializePersonalInfo(v11, v48, v49);
        objc_msgSend_setSerializePersonalInfo_(v11, v50, 1);
      }
      else
      {
        unsigned int v146 = 0;
      }
      objc_msgSend_setSerializeProtectionData_(v11, v48, 1);
      if (!v13)
      {
        uint64_t v53 = (void *)MEMORY[0x1E4F1CAD0];
        v54 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v51, v52);
        objc_msgSend_setWithObject_(v53, v55, (uint64_t)v54);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v56 = (id)*MEMORY[0x1E4F1A538];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        v132 = objc_msgSend_recordID(v11, v57, v58);
        v135 = objc_msgSend_etag(v11, v133, v134);
        *(_DWORD *)buf = 138412546;
        v159 = v132;
        __int16 v160 = 2114;
        v161 = v135;
        _os_log_debug_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_DEBUG, "Adding recordID %@ with etag %{public}@ to cache", buf, 0x16u);
      }
      v59 = [CKDProtocolTranslator alloc];
      v147 = objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v59, v60, (uint64_t)v12, a6, 0);
      id v62 = objc_msgSend_pRecordFromRecord_forCache_(v147, v61, (uint64_t)v11, 1);
      v149 = objc_msgSend_dataRepresentation(v62, v63, v64);

      id v65 = objc_alloc_init(CKDRecordCacheEntry);
      v68 = objc_msgSend_recordID(v11, v66, v67);
      v71 = objc_msgSend_sqliteRepresentation(v68, v69, v70);
      objc_msgSend_setRecordID_(v65, v72, (uint64_t)v71);

      id v75 = objc_msgSend_zoneID(v68, v73, v74);
      id v78 = objc_msgSend_sqliteRepresentation(v75, v76, v77);
      objc_msgSend_setZoneIdentifier_(v65, v79, (uint64_t)v78);

      id v80 = (void *)MEMORY[0x1E4F28ED0];
      long long v83 = objc_msgSend_containerID(v12, v81, v82);
      uint64_t v86 = objc_msgSend_environment(v83, v84, v85);
      v88 = objc_msgSend_numberWithInteger_(v80, v87, v86);
      objc_msgSend_setEnvironment_(v65, v89, (uint64_t)v88);

      v91 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v90, a6);
      objc_msgSend_setDatabaseScope_(v65, v92, (uint64_t)v91);

      v95 = objc_msgSend_etag(v11, v93, v94);
      objc_msgSend_setEtag_(v65, v96, (uint64_t)v95);

      id v97 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      objc_msgSend_cacheExpirationTime(self, v98, v99);
      v102 = objc_msgSend_initWithTimeIntervalSinceNow_(v97, v100, v101);
      objc_msgSend_setExpirationDate_(v65, v103, (uint64_t)v102);

      objc_msgSend_setRecordData_(v65, v104, (uint64_t)v149);
      objc_msgSend_setKnownUserKeys_(v65, v105, (uint64_t)v13);
      v108 = objc_msgSend_account(v12, v106, v107);
      v110 = objc_msgSend__dsidForAccount_(self, v109, (uint64_t)v108);
      objc_msgSend_setDsid_(v65, v111, (uint64_t)v110);

      uint64_t v114 = objc_msgSend_length(v149, v112, v113);
      v116 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v115, v114);
      objc_msgSend_setSize_(v65, v117, (uint64_t)v116);

      v120 = objc_msgSend_modificationDate(v11, v118, v119);
      v123 = v120;
      if (v120)
      {
        id v124 = v120;
      }
      else
      {
        objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v121, v122);
        id v124 = (id)objc_claimAutoreleasedReturnValue();
      }
      v125 = v124;

      v150[0] = MEMORY[0x1E4F143A8];
      v150[1] = 3221225472;
      v150[2] = sub_1C4D4B128;
      v150[3] = &unk_1E64F0458;
      v150[4] = self;
      v126 = v65;
      v151 = v126;
      id v127 = v125;
      id v152 = v127;
      id v129 = (id)objc_msgSend_performTransaction_(self, v128, (uint64_t)v150);
      objc_msgSend_setSerializeProtectionData_(v11, v130, v148);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setSerializePersonalInfo_(v11, v131, v146);
      }
    }
    _Block_object_dispose(&v154, 8);
  }
}

- (id)etagForRecordID:(id)a3 container:(id)a4 requiredKeys:(id)a5 scope:(int64_t)a6
{
  v69[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v57 = a5;
  uint64_t v15 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v13, v14);
  char v18 = objc_msgSend_disableCaching(v15, v16, v17);

  if (v18)
  {
    id v21 = 0;
  }
  else
  {
    if (!v11)
    {
      v51 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, self, @"CKDRecordCache.m", 474, @"Expected a recordID");
    }
    uint64_t v22 = objc_msgSend_recordName(v11, v19, v20);

    if (!v22)
    {
      uint64_t v53 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, self, @"CKDRecordCache.m", 475, @"Expected a recordName");
    }
    id v25 = objc_msgSend_zoneID(v11, v23, v24);

    if (!v25)
    {
      uint64_t v55 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v27);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, self, @"CKDRecordCache.m", 476, @"Expected a zoneID");
    }
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    id v65 = sub_1C4D49128;
    v66 = sub_1C4D49138;
    id v67 = 0;
    v68[0] = @"RECORDID";
    uint64_t v28 = objc_msgSend_sqliteRepresentation(v11, v26, v27);
    v69[0] = v28;
    v68[1] = @"ENVIRONMENT";
    unint64_t v29 = (void *)MEMORY[0x1E4F28ED0];
    id v32 = objc_msgSend_containerID(v12, v30, v31);
    uint64_t v35 = objc_msgSend_environment(v32, v33, v34);
    uint64_t v37 = objc_msgSend_numberWithInteger_(v29, v36, v35);
    v69[1] = v37;
    v68[2] = @"SCOPE";
    uint64_t v39 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v38, a6);
    v69[2] = v39;
    v68[3] = @"DSID";
    long long v42 = objc_msgSend_account(v12, v40, v41);
    char v44 = objc_msgSend__dsidForAccount_(self, v43, (uint64_t)v42);
    v69[3] = v44;
    uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v69, v68, 4);

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1C4D4B5E4;
    v58[3] = &unk_1E64F0498;
    v58[4] = self;
    id v47 = v46;
    id v59 = v47;
    id v60 = v57;
    id v61 = &v62;
    id v49 = (id)objc_msgSend_performInTransaction_(self, v48, (uint64_t)v58);
    id v21 = (id)v63[5];

    _Block_object_dispose(&v62, 8);
  }

  return v21;
}

- (void)deleteRecordWithID:(id)a3 scope:(int64_t)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v10 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v8, v9);
  char v13 = objc_msgSend_disableCaching(v10, v11, v12);

  if ((v13 & 1) == 0)
  {
    if (!v7)
    {
      uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDRecordCache.m", 510, @"Expected a objectID");
    }
    id v16 = objc_msgSend_recordName(v7, v14, v15);

    if (!v16)
    {
      uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"CKDRecordCache.m", 511, @"Expected a recordName");
    }
    char v19 = objc_msgSend_zoneID(v7, v17, v18);

    if (!v19)
    {
      id v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v20, v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, @"CKDRecordCache.m", 512, @"Expected a zoneID");
    }
    v34[0] = @"RECORDID";
    uint64_t v22 = objc_msgSend_sqliteRepresentation(v7, v20, v21);
    v34[1] = @"SCOPE";
    v35[0] = v22;
    uint64_t v24 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v23, a4);
    v35[1] = v24;
    uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v35, v34, 2);

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v27, (uint64_t)v26, off_1E64F04B8, 0, &unk_1F2042790);
  }
}

- (void)clearAllRecords
{
  id v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  char v7 = objc_msgSend_disableCaching(v4, v5, v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend_deleteAllEntries_(self, v8, 0);
  }
}

- (void)clearAllRecordsInScope:(int64_t)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, a3);
  char v9 = objc_msgSend_disableCaching(v6, v7, v8);

  if ((v9 & 1) == 0)
  {
    uint64_t v12 = objc_msgSend_db(self, v10, v11);

    if (!v12)
    {
      char v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKDRecordCache.m", 533, @"Expected non-nil db for %@", self);
    }
    uint64_t v21 = @"SCOPE";
    uint64_t v15 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v13, a3);
    v22[0] = v15;
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v22, &v21, 1);

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v18, (uint64_t)v17, off_1E64F04D0, 0, &unk_1F20427B0);
  }
}

- (void)clearAllRecordsForZoneWithID:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v7 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v5, v6);
  char v10 = objc_msgSend_disableCaching(v7, v8, v9);

  if (v4 && (v10 & 1) == 0)
  {
    uint64_t v17 = @"ZONEID";
    char v13 = objc_msgSend_sqliteRepresentation(v4, v11, v12);
    v18[0] = v13;
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v18, &v17, 1);

    objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v16, (uint64_t)v15, off_1E64F04E8, 0, &unk_1F20427D0);
  }
}

- (void)clearAssetAuthTokensForRecordWithID:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v10 = a4;
  if (v8)
  {
    v26[0] = v8;
    uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v26, 1);
    char v13 = objc_msgSend_recordsWithIDs_container_requiredKeys_scope_(self, v12, (uint64_t)v11, v10, 0, a5);

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v13;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v25, 16);
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend_clearAssetAuthTokensForRecord_container_scope_(self, v17, *(void *)(*((void *)&v21 + 1) + 8 * v20++), v10, a5, (void)v21);
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v21, v25, 16);
      }
      while (v18);
    }
  }
}

- (void)clearAssetAuthTokensForRecord:(id)a3 container:(id)a4 scope:(int64_t)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v9 = objc_msgSend_allKeys(v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v53, v58, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v54;
    uint64_t v47 = *(void *)v54;
    id v48 = v9;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v6, v12, v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_setAuthToken_(v17, v18, 0);
          objc_msgSend_setObject_forKeyedSubscript_(v6, v19, (uint64_t)v17, v16);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (objc_msgSend_count(v17, v20, v21))
            {
              long long v23 = objc_msgSend_objectAtIndex_(v17, v22, 0);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                uint64_t v27 = objc_msgSend_mutableCopy(v17, v25, v26);
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                id v28 = v17;
                uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v49, v57, 16);
                if (v30)
                {
                  uint64_t v32 = v30;
                  uint64_t v33 = *(void *)v50;
                  do
                  {
                    for (uint64_t j = 0; j != v32; ++j)
                    {
                      if (*(void *)v50 != v33) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v35 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                      objc_msgSend_setAuthToken_(v35, v31, 0);
                      objc_msgSend_addObject_(v27, v36, (uint64_t)v35);
                    }
                    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v49, v57, 16);
                  }
                  while (v32);
                }

                uint64_t v14 = v47;
                uint64_t v9 = v48;
              }
            }
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v53, v58, 16);
    }
    while (v13);
  }

  if (v6)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
    long long v40 = objc_msgSend_allKeys(v6, v37, v38);
    long long v42 = objc_msgSend_setWithArray_(v39, v41, (uint64_t)v40);
    objc_msgSend_addRecord_container_knownUserKeys_scope_(self, v43, (uint64_t)v6, v46, v42, a5);
  }
}

@end