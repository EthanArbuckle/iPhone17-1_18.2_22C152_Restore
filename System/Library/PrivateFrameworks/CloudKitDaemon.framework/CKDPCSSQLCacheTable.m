@interface CKDPCSSQLCacheTable
+ (Class)entryClass;
+ (double)cacheValidTime;
+ (id)dbProperties;
- (CKDPCSSQLCacheTable)init;
- (id)PCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7;
- (id)deletePCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7;
- (id)deletePCSDataForShare:(id)a3 account:(id)a4 serviceName:(id)a5;
- (id)deletePCSDataForZone:(id)a3 account:(id)a4 serviceName:(id)a5;
- (id)objectClassesForProperty:(id)a3;
@end

@implementation CKDPCSSQLCacheTable

+ (id)dbProperties
{
  return &unk_1F20AC398;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)objectClassesForProperty:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKDPCSSQLCacheTable;
  id v3 = a3;
  v4 = [(CKSQLiteTable *)&v10 objectClassesForProperty:v3];
  int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"CKDPCSData", v10.receiver, v10.super_class);

  if (isEqualToString)
  {
    uint64_t v7 = objc_opt_class();
    objc_msgSend_addObject_(v4, v8, v7);
  }
  return v4;
}

+ (double)cacheValidTime
{
  id v3 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  objc_msgSend_PCSCacheValidTime(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (CKDPCSSQLCacheTable)init
{
  id v3 = objc_opt_class();
  objc_msgSend_cacheValidTime(v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CKDPCSSQLCacheTable;
  return -[CKSQLiteCacheTable initWithLogicalTableName:entryCountLimit:dataSizeLimit:expirationTime:expireDelay:](&v7, sel_initWithLogicalTableName_entryCountLimit_dataSizeLimit_expirationTime_expireDelay_, @"PCSCache", 1000, 0x100000);
}

- (id)deletePCSDataForZone:(id)a3 account:(id)a4 serviceName:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  v19[0] = @"ZONE";
  v19[1] = @"ACCOUNT";
  v20[0] = v8;
  v20[1] = v9;
  v19[2] = @"SERVICE";
  v13 = v12;
  if (!v12)
  {
    v13 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v10, v11);
  }
  v20[2] = v13;
  v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v20, v19, 3);
  if (!v12) {

  }
  id v18 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v14, (uint64_t)v15, off_1E64F83F8, &v18, &unk_1F2044950);
  id v16 = v18;

  return v16;
}

- (id)deletePCSDataForShare:(id)a3 account:(id)a4 serviceName:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  v19[0] = @"SHARE";
  v19[1] = @"ACCOUNT";
  v20[0] = v8;
  v20[1] = v9;
  v19[2] = @"SERVICE";
  v13 = v12;
  if (!v12)
  {
    v13 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v10, v11);
  }
  v20[2] = v13;
  v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v20, v19, 3);
  if (!v12) {

  }
  id v18 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v14, (uint64_t)v15, off_1E64F8410, &v18, &unk_1F2044970);
  id v16 = v18;

  return v16;
}

- (id)deletePCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v28[0] = v12;
  v27[0] = @"IDENTIFIER";
  v27[1] = @"SCOPE";
  id v16 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v15, a4);
  v28[1] = v16;
  v27[2] = @"TYPE";
  v20 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v17, a5);
  v28[2] = v20;
  v28[3] = v13;
  v27[3] = @"ACCOUNT";
  v27[4] = @"SERVICE";
  v21 = v14;
  if (!v14)
  {
    v21 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v18, v19);
  }
  v28[4] = v21;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v28, v27, 5);
  if (!v14) {

  }
  id v26 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v23, (uint64_t)v22, off_1E64F8428, &v26, &unk_1F2044990);
  id v24 = v26;

  return v24;
}

- (id)PCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 accountID:(id)a6 serviceName:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = objc_alloc_init(CKDPCSSQLCacheEntry);
  objc_msgSend_setIdentifier_(v15, v16, (uint64_t)v12);
  id v18 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v17, a4);
  objc_msgSend_setDatabaseScope_(v15, v19, (uint64_t)v18);

  v21 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v20, a5);
  objc_msgSend_setItemType_(v15, v22, (uint64_t)v21);

  objc_msgSend_setAccountID_(v15, v23, (uint64_t)v13);
  objc_msgSend_setServiceName_(v15, v24, (uint64_t)v14);
  v28 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v25, (uint64_t)&unk_1F20AB8F8, v15, &unk_1F20AB910, off_1E64F8440);
  if (v28)
  {
    if (objc_msgSend_CKIsNoUniqueRowError_(MEMORY[0x1E4F28C58], v26, (uint64_t)v28))
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v29 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_fault_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_FAULT, "Found multiple matching PCS cache database entries. Removing them.", v34, 2u);
      }
      id v31 = (id)objc_msgSend_deletePCSDataForID_databaseScope_itemType_accountID_serviceName_(self, v30, (uint64_t)v12, a4, a5, v13, v14);
    }
    v32 = 0;
  }
  else
  {
    v32 = objc_msgSend_CKDPCSData(v15, v26, v27);
  }

  return v32;
}

@end