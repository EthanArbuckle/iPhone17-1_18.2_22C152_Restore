@interface CKDModifyRecordsOperationReReferenceBatchKey
- (BOOL)isClone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPackageSection;
- (CKDModifyRecordsOperationReReferenceBatchKey)initWithAsset:(id)a3;
- (CKDModifyRecordsOperationReReferenceBatchKey)initWithPackage:(id)a3;
- (int64_t)databaseScope;
- (unint64_t)hash;
@end

@implementation CKDModifyRecordsOperationReReferenceBatchKey

- (CKDModifyRecordsOperationReReferenceBatchKey)initWithAsset:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKDModifyRecordsOperationReReferenceBatchKey;
  v7 = [(CKDModifyRecordsOperationReReferenceBatchKey *)&v29 init];
  if (v7)
  {
    v8 = objc_msgSend_assetReference(v4, v5, v6);
    v11 = objc_msgSend_recordID(v8, v9, v10);
    v14 = objc_msgSend_zoneID(v11, v12, v13);
    v17 = objc_msgSend_recordID(v4, v15, v16);
    v20 = objc_msgSend_zoneID(v17, v18, v19);
    v7->_isClone = objc_msgSend_hasSameOwnerAs_(v20, v21, (uint64_t)v14) ^ 1;

    v7->_databaseScope = objc_msgSend_databaseScope(v8, v22, v23);
    uint64_t v26 = objc_msgSend_ownerName(v14, v24, v25);
    owner = v7->_owner;
    v7->_owner = (NSString *)v26;
  }
  return v7;
}

- (CKDModifyRecordsOperationReReferenceBatchKey)initWithPackage:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDModifyRecordsOperationReReferenceBatchKey;
  v7 = [(CKDModifyRecordsOperationReReferenceBatchKey *)&v32 init];
  if (v7)
  {
    v8 = objc_msgSend_packageReference(v4, v5, v6);
    v11 = objc_msgSend_recordID(v8, v9, v10);
    v14 = objc_msgSend_zoneID(v11, v12, v13);
    v17 = objc_msgSend_record(v4, v15, v16);
    v20 = objc_msgSend_recordID(v17, v18, v19);
    uint64_t v23 = objc_msgSend_zoneID(v20, v21, v22);
    v7->_isClone = objc_msgSend_hasSameOwnerAs_(v23, v24, (uint64_t)v14) ^ 1;

    v7->_databaseScope = objc_msgSend_databaseScope(v8, v25, v26);
    uint64_t v29 = objc_msgSend_ownerName(v14, v27, v28);
    owner = v7->_owner;
    v7->_owner = (NSString *)v29;

    v7->_isPackageSection = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  if (self->_isClone) {
    return objc_msgSend_hash(self->_owner, a2, v2);
  }
  else {
    return self->_databaseScope;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v6 = v4;
  if (!self->_isPackageSection && self->_databaseScope == v4[3] && self->_isClone == *((unsigned __int8 *)v4 + 16)) {
    char isEqualToString = objc_msgSend_isEqualToString_(self->_owner, v5, v4[1]);
  }
  else {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (BOOL)isClone
{
  return self->_isClone;
}

- (BOOL)isPackageSection
{
  return self->_isPackageSection;
}

- (void).cxx_destruct
{
}

@end