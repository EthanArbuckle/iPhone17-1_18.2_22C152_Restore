@interface CKDAssetZoneKey
- (BOOL)isCrossOwner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPackageRereference;
- (BOOL)isReReference;
- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5;
- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5 sourceZoneID:(id)a6 sourceDatabaseScope:(int64_t)a7 isPackageRereference:(BOOL)a8;
- (CKRecordZoneID)destinationZoneID;
- (CKRecordZoneID)sourceZoneID;
- (NSData)cloneContext;
- (NSNumber)useMMCSEncryptionV2;
- (id)CKPropertiesDescription;
- (id)description;
- (int)authPutType;
- (int64_t)destinationDatabaseScope;
- (int64_t)sourceDatabaseScope;
- (unint64_t)hash;
- (void)setCloneContext:(id)a3;
@end

@implementation CKDAssetZoneKey

- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5
{
  return (CKDAssetZoneKey *)objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_sourceZoneID_sourceDatabaseScope_isPackageRereference_(self, a2, (uint64_t)a3, a4, a5, 0, 0, 0);
}

- (CKDAssetZoneKey)initWithDestinationZoneID:(id)a3 destinationDatabaseScope:(int64_t)a4 usesMMCSEncryptionV2:(id)a5 sourceZoneID:(id)a6 sourceDatabaseScope:(int64_t)a7 isPackageRereference:(BOOL)a8
{
  id v15 = a3;
  v16 = (NSNumber *)a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDAssetZoneKey;
  v18 = [(CKDAssetZoneKey *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationZoneID, a3);
    v19->_destinationDatabaseScope = a4;
    v19->_useMMCSEncryptionV2 = v16;
    objc_storeStrong((id *)&v19->_sourceZoneID, a6);
    v19->_sourceDatabaseScope = a7;
    v19->_isPackageRereference = a8;
  }

  return v19;
}

- (int)authPutType
{
  if (!self->_sourceZoneID) {
    return 1;
  }
  if (objc_msgSend_isCrossOwner(self, a2, v2)) {
    return 3;
  }
  return 2;
}

- (BOOL)isReReference
{
  return self->_sourceZoneID != 0;
}

- (BOOL)isCrossOwner
{
  sourceZoneID = self->_sourceZoneID;
  if (sourceZoneID)
  {
    destinationZoneID = self->_destinationZoneID;
    if (destinationZoneID) {
      LOBYTE(sourceZoneID) = objc_msgSend_hasSameOwnerAs_(sourceZoneID, a2, (uint64_t)destinationZoneID) ^ 1;
    }
    else {
      LOBYTE(sourceZoneID) = 0;
    }
  }
  return (char)sourceZoneID;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v4 = NSString;
  v7 = objc_msgSend_destinationZoneID(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"destinationZoneID=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v11 = NSString;
  objc_msgSend_destinationDatabaseScope(self, v12, v13);
  v14 = CKDatabaseScopeString();
  v16 = objc_msgSend_stringWithFormat_(v11, v15, @"destinationDatabaseScope=%@", v14);
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  v18 = NSString;
  objc_super v21 = objc_msgSend_sourceZoneID(self, v19, v20);
  v23 = objc_msgSend_stringWithFormat_(v18, v22, @"sourceZoneID=%@", v21);
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23);

  v25 = NSString;
  objc_msgSend_sourceDatabaseScope(self, v26, v27);
  v28 = CKDatabaseScopeString();
  v30 = objc_msgSend_stringWithFormat_(v25, v29, @"sourceDatabaseScope=%@", v28);
  objc_msgSend_addObject_(v3, v31, (uint64_t)v30);

  v33 = objc_msgSend_componentsJoinedByString_(v3, v32, @", ");

  return v33;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetZoneKey *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDAssetZoneKey *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t destinationDatabaseScope = self->_destinationDatabaseScope;
      if (destinationDatabaseScope == objc_msgSend_destinationDatabaseScope(v5, v7, v8)
        && (int64_t sourceDatabaseScope = self->_sourceDatabaseScope,
            sourceDatabaseScope == objc_msgSend_sourceDatabaseScope(v5, v9, v10))
        && (int isPackageRereference = self->_isPackageRereference,
            isPackageRereference == objc_msgSend_isPackageRereference(v5, v12, v13))
        && CKObjectsAreBothNilOrEqual()
        && CKObjectsAreBothNilOrEqual()
        && CKObjectsAreBothNilOrEqual())
      {
        char v15 = CKObjectsAreBothNilOrEqual();
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_destinationZoneID, a2, v2);
  return objc_msgSend_hash(self->_sourceZoneID, v5, v6) ^ v4;
}

- (CKRecordZoneID)destinationZoneID
{
  return self->_destinationZoneID;
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (NSNumber)useMMCSEncryptionV2
{
  return self->_useMMCSEncryptionV2;
}

- (NSData)cloneContext
{
  return self->_cloneContext;
}

- (void)setCloneContext:(id)a3
{
}

- (BOOL)isPackageRereference
{
  return self->_isPackageRereference;
}

- (int64_t)destinationDatabaseScope
{
  return self->_destinationDatabaseScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneContext, 0);
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
  objc_storeStrong((id *)&self->_destinationZoneID, 0);
}

@end