@interface CKDAssetHandleTable
+ (Class)entryClass;
+ (id)dbProperties;
- (BOOL)assetHandleExistsInDatabase:(id)a3;
- (id)assetHandleWithItemID:(unint64_t)a3 error:(id *)a4;
- (id)assetHandleWithUUID:(id)a3;
- (id)interruptedAssetWithSignature:(id)a3 error:(id *)a4;
- (id)oldestLastUsedTime;
- (id)saveChunkCount:(id)a3;
- (id)saveLastUsedTime:(id)a3;
- (id)saveOrInsert:(id)a3;
- (id)saveStatus:(id)a3;
- (id)saveStatusAndChunkCount:(id)a3;
- (id)selectProperties:(id)a3 inAssetHandlesWithStatus:(int64_t)a4 error:(id *)a5;
@end

@implementation CKDAssetHandleTable

+ (id)dbProperties
{
  return &unk_1F20ABFB0;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)assetHandleExistsInDatabase:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10 = @"ITEMID";
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v11, &v10, 1);

  LOBYTE(self) = objc_msgSend_countOfEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, off_1E64F5CC8, 0, &unk_1F2043FF0) != 0;
  return (char)self;
}

- (id)assetHandleWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CKDAssetHandle);
  objc_msgSend_setUUID_(v5, v6, (uint64_t)v4);

  v8 = objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, v7, 0, v5, &unk_1F20AB6E8, off_1E64F5CE0);
  if (v8)
  {

    id v5 = 0;
  }

  return v5;
}

- (id)assetHandleWithItemID:(unint64_t)a3 error:(id *)a4
{
  v6 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], a2, a3);
  v8 = objc_msgSend_entryWithPrimaryKey_fetchProperties_label_error_(self, v7, (uint64_t)v6, 0, off_1E64F5CF8, a4);

  return v8;
}

- (id)saveOrInsert:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_itemID(v4, v5, v6);

  if (v7) {
    objc_msgSend_updateUsingObject_(self, v8, (uint64_t)v4);
  }
  else {
  v9 = objc_msgSend_insertObject_(self, v8, (uint64_t)v4);
  }

  return v9;
}

- (id)saveStatus:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1F20AB700, a3, off_1E64F5D10);
}

- (id)saveChunkCount:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1F20AB718, a3, off_1E64F5D28);
}

- (id)saveLastUsedTime:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1F20AB730, a3, off_1E64F5D40);
}

- (id)oldestLastUsedTime
{
  return (id)MEMORY[0x1F4181798](self, sel_minimumValueOfProperty_label_error_, @"lastUsedTime");
}

- (id)saveStatusAndChunkCount:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1F20AB748, a3, off_1E64F5D70);
}

- (id)selectProperties:(id)a3 inAssetHandlesWithStatus:(int64_t)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v19 = @"STATUS";
  v10 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v9, a4);
  v20[0] = v10;
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v20, &v19, 1);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F07250;
  v17[3] = &unk_1E64F0370;
  id v18 = v8;
  id v13 = v8;
  v15 = objc_msgSend_entriesWithValues_label_error_setupBlock_(self, v14, (uint64_t)v12, off_1E64F5D88, a5, v17);

  return v15;
}

- (id)interruptedAssetWithSignature:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1C4F07418;
  v21 = sub_1C4F07428;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4F07430;
  v13[3] = &unk_1E64F2068;
  id v7 = v6;
  id v14 = v7;
  v15 = self;
  v16 = &v17;
  v9 = objc_msgSend_performInTransaction_(self, v8, (uint64_t)v13);
  v10 = v9;
  if (a4 && v9) {
    *a4 = v9;
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

@end