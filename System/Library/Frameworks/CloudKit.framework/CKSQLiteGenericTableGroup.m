@interface CKSQLiteGenericTableGroup
+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5;
+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)createTables:(id *)a3;
- (int64_t)validateTableMatchesTOCEntry:(id)a3;
@end

@implementation CKSQLiteGenericTableGroup

+ (id)groupEntryInDatabase:(id)a3 withGroupName:(id)a4 error:(id *)a5
{
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___CKSQLiteGenericTableGroup;
  v6 = objc_msgSendSuper2(&v17, sel_groupEntryInDatabase_withGroupName_error_, a3, a4, a5);
  if (v6)
  {
    v7 = NSStringFromClass((Class)a1);
    objc_msgSend_setCreatingClass_(v6, v8, (uint64_t)v7, v9);

    v13 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12);
    objc_msgSend_setLastUsed_(v6, v14, (uint64_t)v13, v15);
  }

  return v6;
}

+ (id)tableGroupInDatabase:(id)a3 withName:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKSQLiteGenericTableGroup;
  v6 = objc_msgSendSuper2(&v8, sel_tableGroupInDatabase_withName_options_error_, a3, a4, a5 | 0x50000, a6);

  return v6;
}

- (id)createTables:(id *)a3
{
  v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_tocTable(self, a2, (uint64_t)a3, v3);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = objc_msgSend_groupID(self, v8, v9, v10);
  id v32 = 0;
  v13 = objc_msgSend_validationTocEntriesWithGroupID_error_(v6, v12, (uint64_t)v11, (uint64_t)&v32);
  id v14 = v32;

  if (!v14)
  {
    v27 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v13;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v28, (uint64_t)v33, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_genericTableForTOCEntry_(CKSQLiteGenericTable, v18, *(void *)(*((void *)&v28 + 1) + 8 * i), v19);
          objc_msgSend_addObject_(v7, v24, (uint64_t)v23, v25);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v28, (uint64_t)v33, 16);
      }
      while (v20);
    }

    v4 = v27;
  }
  if (v4 && v14) {
    id *v4 = v14;
  }

  return v7;
}

- (int64_t)validateTableMatchesTOCEntry:(id)a3
{
  return 1;
}

@end