@interface CKDAssetID
- (BOOL)isEqual:(id)a3;
- (CKDAssetID)initWithRecordID:(id)a3 fileSignature:(id)a4 referenceSignature:(id)a5 size:(id)a6;
- (CKDPRecordIdentifier)recordID;
- (NSData)fileSignature;
- (NSData)referenceSignature;
- (NSNumber)size;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKDAssetID

- (CKDAssetID)initWithRecordID:(id)a3 fileSignature:(id)a4 referenceSignature:(id)a5 size:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CKDAssetID;
  v16 = [(CKDAssetID *)&v28 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v10, v14, v15);
    recordID = v16->_recordID;
    v16->_recordID = (CKDPRecordIdentifier *)v17;

    uint64_t v21 = objc_msgSend_copy(v11, v19, v20);
    fileSignature = v16->_fileSignature;
    v16->_fileSignature = (NSData *)v21;

    uint64_t v25 = objc_msgSend_copy(v12, v23, v24);
    referenceSignature = v16->_referenceSignature;
    v16->_referenceSignature = (NSData *)v25;

    objc_storeStrong((id *)&v16->_size, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDAssetID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToNumber = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9 = objc_msgSend_recordID(self, v7, v8);
    id v12 = objc_msgSend_recordID(v6, v10, v11);
    int isEqual = objc_msgSend_isEqual_(v9, v13, (uint64_t)v12);

    if (!isEqual) {
      goto LABEL_10;
    }
    uint64_t v17 = objc_msgSend_fileSignature(self, v15, v16);
    uint64_t v20 = objc_msgSend_fileSignature(v6, v18, v19);
    int v22 = objc_msgSend_isEqual_(v17, v21, (uint64_t)v20);

    if (!v22) {
      goto LABEL_10;
    }
    uint64_t v25 = objc_msgSend_referenceSignature(self, v23, v24);
    objc_super v28 = objc_msgSend_referenceSignature(v6, v26, v27);
    int v29 = CKObjectsAreBothNilOrEqual();

    if (v29)
    {
      v32 = objc_msgSend_size(self, v30, v31);
      v35 = objc_msgSend_size(v6, v33, v34);
      char isEqualToNumber = objc_msgSend_isEqualToNumber_(v32, v36, (uint64_t)v35);
    }
    else
    {
LABEL_10:
      char isEqualToNumber = 0;
    }
  }
  else
  {
    char isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_recordID(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  id v10 = objc_msgSend_fileSignature(self, v8, v9);
  uint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  uint64_t v16 = objc_msgSend_referenceSignature(self, v14, v15);
  uint64_t v19 = objc_msgSend_hash(v16, v17, v18);
  int v22 = objc_msgSend_size(self, v20, v21);
  unint64_t v25 = v13 ^ v19 ^ objc_msgSend_hash(v22, v23, v24);

  return v25;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v4 = NSString;
  uint64_t v7 = objc_msgSend_recordID(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v4, v8, @"recordID=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  uint64_t v11 = NSString;
  v14 = objc_msgSend_fileSignature(self, v12, v13);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v11, v15, @"fileSignature=%@", v14);
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  uint64_t v20 = objc_msgSend_referenceSignature(self, v18, v19);

  if (v20)
  {
    v23 = NSString;
    uint64_t v24 = objc_msgSend_referenceSignature(self, v21, v22);
    v26 = objc_msgSend_stringWithFormat_(v23, v25, @"referenceSignature=%@", v24);
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26);
  }
  objc_super v28 = NSString;
  int v29 = objc_msgSend_size(self, v21, v22);
  uint64_t v31 = objc_msgSend_stringWithFormat_(v28, v30, @"size=%@", v29);
  objc_msgSend_addObject_(v3, v32, (uint64_t)v31);

  uint64_t v34 = objc_msgSend_componentsJoinedByString_(v3, v33, @", ");

  return v34;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetID *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDPRecordIdentifier)recordID
{
  return self->_recordID;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (NSNumber)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end