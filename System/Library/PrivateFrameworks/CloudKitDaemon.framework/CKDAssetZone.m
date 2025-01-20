@interface CKDAssetZone
- (CKDAssetZone)initWithAssetZoneKey:(id)a3;
- (CKDAssetZoneKey)assetZoneKey;
- (NSMutableDictionary)assetRecordsByRecordID;
- (NSMutableOrderedSet)assetRecords;
- (id)CKPropertiesDescription;
- (id)description;
- (void)addMMCSItem:(id)a3;
- (void)addMMCSSectionItem:(id)a3;
- (void)addRereferencedMMCSPackageItem:(id)a3;
- (void)setAssetRecords:(id)a3;
- (void)setAssetRecordsByRecordID:(id)a3;
- (void)setAssetZoneKey:(id)a3;
@end

@implementation CKDAssetZone

- (CKDAssetZone)initWithAssetZoneKey:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDAssetZone;
  v6 = [(CKDAssetZone *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetZoneKey, a3);
    uint64_t v8 = objc_opt_new();
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = (NSMutableOrderedSet *)v8;

    uint64_t v10 = objc_opt_new();
    assetRecordsByRecordID = v7->_assetRecordsByRecordID;
    v7->_assetRecordsByRecordID = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)addMMCSItem:(id)a3
{
  id v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  id v38 = v5;
  v9 = objc_msgSend_assetZoneKey(v5, v7, v8);
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    v33 = self->_assetZoneKey;
    v36 = objc_msgSend_assetZoneKey(v38, v34, v35);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, @"CKDAssetZone.m", 35, @"Expected Item for Zone %@ but Found %@", v33, v36);
  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  v14 = objc_msgSend_recordID(v38, v11, v12);
  v16 = objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    v21 = objc_msgSend_recordType(v38, v19, v20);
    v24 = objc_msgSend_recordID(v38, v22, v23);
    v16 = objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    v29 = objc_msgSend_recordID(v38, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addMMCSItem_(v16, v17, (uint64_t)v38);
}

- (void)addRereferencedMMCSPackageItem:(id)a3
{
  id v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  id v38 = v5;
  v9 = objc_msgSend_assetZoneKey(v5, v7, v8);
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    v33 = self->_assetZoneKey;
    v36 = objc_msgSend_assetZoneKey(v38, v34, v35);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, @"CKDAssetZone.m", 47, @"Expected Item for Zone %@ but Found %@", v33, v36);
  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  v14 = objc_msgSend_recordID(v38, v11, v12);
  v16 = objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    v21 = objc_msgSend_recordType(v38, v19, v20);
    v24 = objc_msgSend_recordID(v38, v22, v23);
    v16 = objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    v29 = objc_msgSend_recordID(v38, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addRereferencedMMCSPackageItem_(v16, v17, (uint64_t)v38);
}

- (void)addMMCSSectionItem:(id)a3
{
  id v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  id v38 = v5;
  v9 = objc_msgSend_assetZoneKey(v5, v7, v8);
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    v33 = self->_assetZoneKey;
    v36 = objc_msgSend_assetZoneKey(v38, v34, v35);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, @"CKDAssetZone.m", 60, @"Expected Item for Zone %@ but Found %@", v33, v36);
  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  v14 = objc_msgSend_recordID(v38, v11, v12);
  v16 = objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    v21 = objc_msgSend_recordType(v38, v19, v20);
    v24 = objc_msgSend_recordID(v38, v22, v23);
    v16 = objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    v29 = objc_msgSend_recordID(v38, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addMMCSSectionItem_(v16, v17, (uint64_t)v38);
}

- (NSMutableOrderedSet)assetRecords
{
  v3 = objc_msgSend_copy(self->_assetRecords, a2, v2);
  return (NSMutableOrderedSet *)v3;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v4 = NSString;
  v7 = objc_msgSend_assetZoneKey(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"assetZoneKey=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  uint64_t v12 = objc_msgSend_componentsJoinedByString_(v3, v11, @", ");

  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetZone *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDAssetZoneKey)assetZoneKey
{
  return self->_assetZoneKey;
}

- (void)setAssetZoneKey:(id)a3
{
}

- (void)setAssetRecords:(id)a3
{
}

- (NSMutableDictionary)assetRecordsByRecordID
{
  return self->_assetRecordsByRecordID;
}

- (void)setAssetRecordsByRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
  objc_storeStrong((id *)&self->_assetZoneKey, 0);
}

@end