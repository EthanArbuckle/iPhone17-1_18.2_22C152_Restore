@interface CKDAssetRecord
- (BOOL)isAssetRecord;
- (BOOL)isEmpty;
- (BOOL)isEmptyOfRereferencesAssets;
- (BOOL)isPackageSectionRecord;
- (CKDAssetRecord)initWithRecordType:(id)a3 recordID:(id)a4;
- (CKRecordID)recordID;
- (NSArray)allMMCSItems;
- (NSArray)allMMCSSectionItems;
- (NSMutableDictionary)itemsByRecordKey;
- (NSMutableDictionary)rereferencedItemsByRecordKey;
- (NSMutableDictionary)sectionItemsByRecordKey;
- (NSNumber)rerefSizeUpperBoundNumber;
- (NSNumber)sizeUpperBoundNumber;
- (NSString)recordType;
- (id)CKPropertiesDescription;
- (id)allMMCSAndSectionItems;
- (id)allRecordKeys;
- (id)allRegularAndSectionAndRereferenceItems;
- (id)allRegularAndSectionAndRereferenceItemsWithRecordKey:(id)a3;
- (id)allRereferenceMMCSPackageItems;
- (id)description;
- (id)firstMMCSItemError;
- (id)firstMMCSSectionItemError;
- (unsigned)rerefSizeUpperBound;
- (unsigned)sizeUpperBound;
- (void)addMMCSItem:(id)a3;
- (void)addMMCSSectionItem:(id)a3;
- (void)addRereferencedMMCSPackageItem:(id)a3;
- (void)setItemsByRecordKey:(id)a3;
- (void)setRerefSizeUpperBoundNumber:(id)a3;
- (void)setRereferencedItemsByRecordKey:(id)a3;
- (void)setSectionItemsByRecordKey:(id)a3;
- (void)setSizeUpperBoundNumber:(id)a3;
@end

@implementation CKDAssetRecord

- (CKDAssetRecord)initWithRecordType:(id)a3 recordID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAssetRecord;
  v9 = [(CKDAssetRecord *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordType, a3);
    objc_storeStrong((id *)&v10->_recordID, a4);
    uint64_t v11 = objc_opt_new();
    itemsByRecordKey = v10->_itemsByRecordKey;
    v10->_itemsByRecordKey = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    rereferencedItemsByRecordKey = v10->_rereferencedItemsByRecordKey;
    v10->_rereferencedItemsByRecordKey = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    sectionItemsByRecordKey = v10->_sectionItemsByRecordKey;
    v10->_sectionItemsByRecordKey = (NSMutableDictionary *)v15;
  }
  return v10;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v4 = NSString;
  id v7 = objc_msgSend_recordType(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"recordType=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  uint64_t v11 = NSString;
  v14 = objc_msgSend_recordID(self, v12, v13);
  v16 = objc_msgSend_stringWithFormat_(v11, v15, @"recordID=%@", v14);
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  objc_super v18 = NSString;
  unsigned int v21 = objc_msgSend_sizeUpperBound(self, v19, v20);
  v23 = objc_msgSend_stringWithFormat_(v18, v22, @"sizeUpperBound=%lu", v21);
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23);

  if (objc_msgSend_isPackageSectionRecord(self, v25, v26))
  {
    v29 = NSString;
    if (objc_msgSend_isPackageSectionRecord(self, v27, v28)) {
      objc_msgSend_stringWithFormat_(v29, v30, @"isPackageSectionRecord=%@", @"YES");
    }
    else {
    v31 = objc_msgSend_stringWithFormat_(v29, v30, @"isPackageSectionRecord=%@", @"NO");
    }
    objc_msgSend_addObject_(v3, v32, (uint64_t)v31);
  }
  v33 = objc_msgSend_componentsJoinedByString_(v3, v27, @", ");

  return v33;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetRecord *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void)addMMCSItem:(id)a3
{
  id v22 = a3;
  id v8 = objc_msgSend_package(v22, v4, v5);
  if (v8 && (objc_msgSend_isTemporary(v22, v6, v7) & 1) == 0) {
    __assert_rtn("-[CKDAssetRecord addMMCSItem:]", "CKDAssetRecord.m", 53, "nil == item.package || item.isTemporary");
  }

  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  itemsByRecordKey = self->_itemsByRecordKey;
  uint64_t v13 = objc_msgSend_recordKey(v22, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(itemsByRecordKey, v14, (uint64_t)v13);

  if (!v15)
  {
    uint64_t v15 = objc_opt_new();
    v17 = self->_itemsByRecordKey;
    uint64_t v20 = objc_msgSend_recordKey(v22, v18, v19);
    objc_msgSend_setObject_forKeyedSubscript_(v17, v21, (uint64_t)v15, v20);
  }
  objc_msgSend_addObject_(v15, v16, (uint64_t)v22);
}

- (void)addRereferencedMMCSPackageItem:(id)a3
{
  id v17 = a3;
  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  rereferencedItemsByRecordKey = self->_rereferencedItemsByRecordKey;
  id v8 = objc_msgSend_recordKey(v17, v6, v7);
  v10 = objc_msgSend_objectForKeyedSubscript_(rereferencedItemsByRecordKey, v9, (uint64_t)v8);

  if (!v10)
  {
    v10 = objc_opt_new();
    uint64_t v12 = self->_rereferencedItemsByRecordKey;
    uint64_t v15 = objc_msgSend_recordKey(v17, v13, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v16, (uint64_t)v10, v15);
  }
  objc_msgSend_addObject_(v10, v11, (uint64_t)v17);
}

- (void)addMMCSSectionItem:(id)a3
{
  id v20 = a3;
  uint64_t v6 = objc_msgSend_package(v20, v4, v5);
  if (!v6) {
    __assert_rtn("-[CKDAssetRecord addMMCSSectionItem:]", "CKDAssetRecord.m", 76, "nil != item.package");
  }

  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  self->_sizeUpperBoundNumber = 0;

  sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
  uint64_t v11 = objc_msgSend_recordKey(v20, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(sectionItemsByRecordKey, v12, (uint64_t)v11);

  if (!v13)
  {
    uint64_t v13 = objc_opt_new();
    uint64_t v15 = self->_sectionItemsByRecordKey;
    objc_super v18 = objc_msgSend_recordKey(v20, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v19, (uint64_t)v13, v18);
  }
  objc_msgSend_addObject_(v13, v14, (uint64_t)v20);
}

- (unsigned)sizeUpperBound
{
  sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  if (!sizeUpperBoundNumber)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    itemsByRecordKey = self->_itemsByRecordKey;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1C4D4CAD8;
    v13[3] = &unk_1E64F0508;
    v13[4] = &v14;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(itemsByRecordKey, a2, (uint64_t)v13);
    sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1C4D4CB1C;
    v12[3] = &unk_1E64F0508;
    v12[4] = &v14;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(sectionItemsByRecordKey, v7, (uint64_t)v12);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v8, *((unsigned int *)v15 + 6));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_sizeUpperBoundNumber;
    self->_sizeUpperBoundNumber = v9;

    _Block_object_dispose(&v14, 8);
    sizeUpperBoundNumber = self->_sizeUpperBoundNumber;
  }
  return objc_msgSend_unsignedLongLongValue(sizeUpperBoundNumber, a2, v2);
}

- (unsigned)rerefSizeUpperBound
{
  rerefSizeUpperBoundNumber = self->_rerefSizeUpperBoundNumber;
  if (!rerefSizeUpperBoundNumber)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v14 = 0;
    rereferencedItemsByRecordKey = self->_rereferencedItemsByRecordKey;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1C4D4CC4C;
    v10[3] = &unk_1E64F0508;
    v10[4] = &v11;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(rereferencedItemsByRecordKey, a2, (uint64_t)v10);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v6, *((unsigned int *)v12 + 6));
    uint64_t v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_rerefSizeUpperBoundNumber;
    self->_rerefSizeUpperBoundNumber = v7;

    _Block_object_dispose(&v11, 8);
    rerefSizeUpperBoundNumber = self->_rerefSizeUpperBoundNumber;
  }
  return objc_msgSend_unsignedLongLongValue(rerefSizeUpperBoundNumber, a2, v2);
}

- (NSArray)allMMCSItems
{
  v4 = objc_msgSend_allKeys(self->_itemsByRecordKey, a2, v2);
  uint64_t v6 = objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1F20427F0);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D4CD64;
  v10[3] = &unk_1E64F0550;
  v10[4] = self;
  id v8 = objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);

  return (NSArray *)v8;
}

- (id)allRereferenceMMCSPackageItems
{
  v4 = objc_msgSend_allKeys(self->_rereferencedItemsByRecordKey, a2, v2);
  uint64_t v6 = objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1F2042810);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D4CE48;
  v10[3] = &unk_1E64F0550;
  v10[4] = self;
  id v8 = objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);

  return v8;
}

- (NSArray)allMMCSSectionItems
{
  v4 = objc_msgSend_allKeys(self->_sectionItemsByRecordKey, a2, v2);
  uint64_t v6 = objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1F2042830);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D4CF2C;
  v10[3] = &unk_1E64F0550;
  v10[4] = self;
  id v8 = objc_msgSend_CKFlatMap_(v6, v7, (uint64_t)v10);

  return (NSArray *)v8;
}

- (id)allRecordKeys
{
  v3 = objc_opt_new();
  id v8 = objc_msgSend_allKeys(self->_itemsByRecordKey, v4, v5);
  if (v8) {
    objc_msgSend_addObjectsFromArray_(v3, v6, (uint64_t)v8);
  }
  v9 = objc_msgSend_allKeys(self->_sectionItemsByRecordKey, v6, v7);

  if (v9) {
    objc_msgSend_addObjectsFromArray_(v3, v10, (uint64_t)v9);
  }
  uint64_t v12 = objc_msgSend_allKeys(self->_rereferencedItemsByRecordKey, v10, v11);

  if (v12) {
    objc_msgSend_addObjectsFromArray_(v3, v13, (uint64_t)v12);
  }
  uint64_t v15 = objc_msgSend_allObjects(v3, v13, v14);
  objc_super v18 = objc_msgSend_mutableCopy(v15, v16, v17);

  id v20 = (id)objc_msgSend_sortedArrayUsingComparator_(v18, v19, (uint64_t)&unk_1F2042850);
  return v18;
}

- (id)allMMCSAndSectionItems
{
  v4 = objc_msgSend_allRecordKeys(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4D4D0D8;
  v8[3] = &unk_1E64F0550;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)allRegularAndSectionAndRereferenceItemsWithRecordKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v8 = objc_msgSend_objectForKeyedSubscript_(self->_itemsByRecordKey, v6, (uint64_t)v4);
  if (v8) {
    objc_msgSend_addObjectsFromArray_(v5, v7, (uint64_t)v8);
  }
  v9 = objc_msgSend_objectForKeyedSubscript_(self->_sectionItemsByRecordKey, v7, (uint64_t)v4);

  if (v9) {
    objc_msgSend_addObjectsFromArray_(v5, v10, (uint64_t)v9);
  }
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_rereferencedItemsByRecordKey, v10, (uint64_t)v4);

  if (v11) {
    objc_msgSend_addObjectsFromArray_(v5, v12, (uint64_t)v11);
  }

  return v5;
}

- (id)allRegularAndSectionAndRereferenceItems
{
  id v4 = objc_msgSend_allRecordKeys(self, a2, v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4D4D308;
  v8[3] = &unk_1E64F0550;
  v8[4] = self;
  uint64_t v6 = objc_msgSend_CKFlatMap_(v4, v5, (uint64_t)v8);

  return v6;
}

- (id)firstMMCSItemError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1C4D4D520;
  uint64_t v10 = sub_1C4D4D530;
  id v11 = 0;
  itemsByRecordKey = self->_itemsByRecordKey;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4D4D538;
  v5[3] = &unk_1E64F0508;
  v5[4] = &v6;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(itemsByRecordKey, a2, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)firstMMCSSectionItemError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1C4D4D520;
  uint64_t v10 = sub_1C4D4D530;
  id v11 = 0;
  sectionItemsByRecordKey = self->_sectionItemsByRecordKey;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4D4D738;
  v5[3] = &unk_1E64F0508;
  v5[4] = &v6;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(sectionItemsByRecordKey, a2, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isPackageSectionRecord
{
  return objc_msgSend_count(self->_sectionItemsByRecordKey, a2, v2) != 0;
}

- (BOOL)isAssetRecord
{
  return objc_msgSend_count(self->_itemsByRecordKey, a2, v2) != 0;
}

- (BOOL)isEmpty
{
  uint64_t v4 = objc_msgSend_count(self->_sectionItemsByRecordKey, a2, v2);
  uint64_t v7 = objc_msgSend_count(self->_itemsByRecordKey, v5, v6) + v4;
  return v7 + objc_msgSend_count(self->_rereferencedItemsByRecordKey, v8, v9) == 0;
}

- (BOOL)isEmptyOfRereferencesAssets
{
  return objc_msgSend_count(self->_rereferencedItemsByRecordKey, a2, v2) == 0;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSMutableDictionary)itemsByRecordKey
{
  return self->_itemsByRecordKey;
}

- (void)setItemsByRecordKey:(id)a3
{
}

- (NSMutableDictionary)sectionItemsByRecordKey
{
  return self->_sectionItemsByRecordKey;
}

- (void)setSectionItemsByRecordKey:(id)a3
{
}

- (NSMutableDictionary)rereferencedItemsByRecordKey
{
  return self->_rereferencedItemsByRecordKey;
}

- (void)setRereferencedItemsByRecordKey:(id)a3
{
}

- (NSNumber)sizeUpperBoundNumber
{
  return self->_sizeUpperBoundNumber;
}

- (void)setSizeUpperBoundNumber:(id)a3
{
}

- (NSNumber)rerefSizeUpperBoundNumber
{
  return self->_rerefSizeUpperBoundNumber;
}

- (void)setRerefSizeUpperBoundNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerefSizeUpperBoundNumber, 0);
  objc_storeStrong((id *)&self->_sizeUpperBoundNumber, 0);
  objc_storeStrong((id *)&self->_rereferencedItemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_sectionItemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_itemsByRecordKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end