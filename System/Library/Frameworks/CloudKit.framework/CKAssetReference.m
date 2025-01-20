@interface CKAssetReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPackageMember;
- (CKAssetReference)initWithCoder:(id)a3;
- (CKAssetReference)initWithExistingRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 fileSignature:(id)a6;
- (CKRecordID)recordID;
- (NSData)fileSignature;
- (NSString)fieldName;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (int64_t)databaseScope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPackageMember:(BOOL)a3;
@end

@implementation CKAssetReference

- (CKAssetReference)initWithExistingRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 fileSignature:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v52 = 0;
  char v13 = _CKCheckArgument((uint64_t)"recordID", v10, 0, 0, 0, &v52);
  id v14 = v52;
  if ((v13 & 1) == 0) {
    goto LABEL_9;
  }

  id v51 = 0;
  char v15 = _CKCheckArgument((uint64_t)"fieldName", v11, 0, 0, 0, &v51);
  id v14 = v51;
  if ((v15 & 1) == 0
    || (v14,
        id v50 = 0,
        char v16 = _CKCheckArgument((uint64_t)"fileSignature", v12, 0, 0, 0, &v50),
        id v14 = v50,
        (v16 & 1) == 0))
  {
LABEL_9:
    v37 = v14;
    v38 = [CKException alloc];
    uint64_t v42 = objc_msgSend_code(v37, v39, v40, v41);
    v46 = objc_msgSend_localizedDescription(v37, v43, v44, v45);
    id v48 = (id)objc_msgSend_initWithCode_format_(v38, v47, v42, @"%@", v46);

    objc_exception_throw(v48);
  }

  if ((objc_msgSend_isValidSignature_(CKSignatureGenerator, v17, (uint64_t)v12, v18) & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v19, *MEMORY[0x1E4F1C3C8], @"Invalid fileSignature");
  }
  v49.receiver = self;
  v49.super_class = (Class)CKAssetReference;
  v23 = [(CKAssetReference *)&v49 init];
  if (v23)
  {
    uint64_t v24 = objc_msgSend_copy(v10, v20, v21, v22);
    recordID = v23->_recordID;
    v23->_recordID = (CKRecordID *)v24;

    v23->_databaseScope = a4;
    uint64_t v29 = objc_msgSend_copy(v11, v26, v27, v28);
    fieldName = v23->_fieldName;
    v23->_fieldName = (NSString *)v29;

    uint64_t v34 = objc_msgSend_copy(v12, v31, v32, v33);
    fileSignature = v23->_fileSignature;
    v23->_fileSignature = (NSData *)v34;
  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKAssetReference *)a3;
  if (self == v4)
  {
    char v45 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v9 = objc_msgSend_recordID(self, v6, v7, v8);
      char v13 = objc_msgSend_recordID(v5, v10, v11, v12);
      int isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

      if (!isEqual) {
        goto LABEL_9;
      }
      uint64_t v20 = objc_msgSend_databaseScope(self, v17, v18, v19);
      if (v20 != objc_msgSend_databaseScope(v5, v21, v22, v23)) {
        goto LABEL_9;
      }
      uint64_t v27 = objc_msgSend_fieldName(self, v24, v25, v26);
      v31 = objc_msgSend_fieldName(v5, v28, v29, v30);
      int v34 = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);

      if (v34)
      {
        v38 = objc_msgSend_fileSignature(self, v35, v36, v37);
        uint64_t v42 = objc_msgSend_fileSignature(v5, v39, v40, v41);
        char v45 = objc_msgSend_isEqual_(v38, v43, (uint64_t)v42, v44);
      }
      else
      {
LABEL_9:
        char v45 = 0;
      }
    }
    else
    {
      char v45 = 0;
    }
  }

  return v45;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_recordID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_databaseScope(self, v10, v11, v12) ^ v9;
  v17 = objc_msgSend_fieldName(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_hash(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_fileSignature(self, v22, v23, v24);
  unint64_t v29 = v13 ^ v21 ^ objc_msgSend_hash(v25, v26, v27, v28);

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_recordID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, @"RecordID");

  uint64_t v13 = objc_msgSend_databaseScope(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v25, v14, v13, @"DatabaseScope");
  uint64_t v18 = objc_msgSend_fieldName(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, @"FieldName");

  uint64_t v23 = objc_msgSend_fileSignature(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, @"FileSignature");
}

- (CKAssetReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKAssetReference;
  v5 = [(CKAssetReference *)&v22 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"RecordID");
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v9;

    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v11, @"DatabaseScope", v12);
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"FieldName");
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"FileSignature");
    fileSignature = v5->_fileSignature;
    v5->_fileSignature = (NSData *)v19;
  }

  return v5;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  id v10 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 3, a4, a5);
  if (v5)
  {
    uint64_t v11 = objc_msgSend_recordID(self, v7, v8, v9);
    uint64_t v15 = objc_msgSend_description(v11, v12, v13, v14);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v16, @"recordID", (uint64_t)v15);

    uint64_t v17 = NSNumber;
    uint64_t v21 = objc_msgSend_databaseScope(self, v18, v19, v20);
    uint64_t v24 = objc_msgSend_numberWithInteger_(v17, v22, v21, v23);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v25, @"databaseScope", (uint64_t)v24);

    unint64_t v29 = objc_msgSend_fieldName(self, v26, v27, v28);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v30, @"fieldName", (uint64_t)v29);

    int v34 = objc_msgSend_fileSignature(self, v31, v32, v33);
    v38 = objc_msgSend_description(v34, v35, v36, v37);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v39, @"fileSignature", (uint64_t)v38);
  }

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetReference *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (BOOL)isPackageMember
{
  return self->_isPackageMember;
}

- (void)setIsPackageMember:(BOOL)a3
{
  self->_isPackageMember = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end