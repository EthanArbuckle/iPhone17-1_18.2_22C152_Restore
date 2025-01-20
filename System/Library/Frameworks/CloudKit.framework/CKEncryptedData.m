@interface CKEncryptedData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsDecryption;
- (BOOL)needsEncryption;
- (CKEncryptedData)init;
- (CKEncryptedData)initWithCoder:(id)a3;
- (CKEncryptedData)initWithData:(id)a3;
- (CKEncryptedData)initWithEncryptedData:(id)a3;
- (CKEncryptedData)initWithValue:(id)a3;
- (NSData)data;
- (NSData)encryptedData;
- (NSString)description;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setEncryptedData:(id)a3;
@end

@implementation CKEncryptedData

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  v62[4] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a5)
    {
      v62[0] = @"encrypteddata";
      v61[0] = @"type";
      v61[1] = @"length";
      v6 = NSNumber;
      v7 = objc_msgSend_data(self, a2, a3, a4);
      uint64_t v11 = objc_msgSend_length(v7, v8, v9, v10);
      v14 = objc_msgSend_numberWithUnsignedInteger_(v6, v12, v11, v13);
      v62[1] = v14;
      v61[2] = @"elength";
      v15 = NSNumber;
      v19 = objc_msgSend_encryptedData(self, v16, v17, v18);
      uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);
      v26 = objc_msgSend_numberWithUnsignedInteger_(v15, v24, v23, v25);
      v62[2] = v26;
      v61[3] = @"data";
      v30 = objc_msgSend_data(self, v27, v28, v29);
      v33 = objc_msgSend_base64EncodedStringWithOptions_(v30, v31, 32, v32);
      v62[3] = v33;
      v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v34, (uint64_t)v62, (uint64_t)v61, 4);
    }
    else
    {
      v36 = objc_msgSend_data(self, a2, a3, a4);

      if (v36)
      {
        v59 = @"length";
        v40 = NSNumber;
        v7 = objc_msgSend_data(self, v37, v38, v39);
        uint64_t v44 = objc_msgSend_length(v7, v41, v42, v43);
        v14 = objc_msgSend_numberWithUnsignedInteger_(v40, v45, v44, v46);
        v60 = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v47, (uint64_t)&v60, (uint64_t)&v59, 1);
      }
      else
      {
        v57 = @"encryptedLength";
        v48 = NSNumber;
        v7 = objc_msgSend_encryptedData(self, v37, v38, v39);
        uint64_t v52 = objc_msgSend_length(v7, v49, v50, v51);
        v14 = objc_msgSend_numberWithUnsignedInteger_(v48, v53, v52, v54);
        v58 = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v55, (uint64_t)&v58, (uint64_t)&v57, 1);
      v35 = };
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v35;
}

- (CKEncryptedData)init
{
  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, @"You must call -[%@ initWithData:]", v4);

  objc_exception_throw(v6);
}

- (CKEncryptedData)initWithData:(id)a3
{
  id v4 = a3;
  id v27 = 0;
  char v5 = _CKCheckArgument((uint64_t)"data", v4, 0, 0, 0, &v27);
  id v6 = v27;
  if ((v5 & 1) == 0)
  {
    v14 = v6;
    v15 = [CKException alloc];
    uint64_t v19 = objc_msgSend_code(v14, v16, v17, v18);
    uint64_t v23 = objc_msgSend_localizedDescription(v14, v20, v21, v22);
    id v25 = (id)objc_msgSend_initWithCode_format_(v15, v24, v19, @"%@", v23);

    objc_exception_throw(v25);
  }

  v26.receiver = self;
  v26.super_class = (Class)CKEncryptedData;
  uint64_t v10 = [(CKEncryptedData *)&v26 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v4, v7, v8, v9);
    data = v10->_data;
    v10->_data = (NSData *)v11;
  }
  return v10;
}

- (CKEncryptedData)initWithEncryptedData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKEncryptedData;
  uint64_t v8 = [(CKEncryptedData *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    encryptedData = v8->_encryptedData;
    v8->_encryptedData = (NSData *)v9;
  }
  return v8;
}

- (CKEncryptedData)initWithValue:(id)a3
{
  id v4 = a3;
  id v92 = 0;
  char v5 = _CKCheckArgument((uint64_t)"value", v4, 0, 0, 1, &v92);
  id v6 = v92;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    v70 = [CKException alloc];
    uint64_t v74 = objc_msgSend_code(v7, v71, v72, v73);
    v78 = objc_msgSend_localizedDescription(v7, v75, v76, v77);
    v80 = objc_msgSend_initWithCode_format_(v70, v79, v74, @"%@", v78);
    goto LABEL_35;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v4;
      if (CFNumberIsFloatType((CFNumberRef)v13))
      {
        v14 = [CKEncryptedDouble alloc];
        objc_msgSend_doubleValue(v13, v15, v16, v17);
        uint64_t v21 = objc_msgSend_initWithDouble_(v14, v18, v19, v20);
      }
      else
      {
        uint64_t v28 = [CKEncryptedLongLong alloc];
        uint64_t v32 = objc_msgSend_longLongValue(v13, v29, v30, v31);
        uint64_t v21 = objc_msgSend_initWithLongLong_(v28, v33, v32, v34);
      }
      objc_super v12 = (CKEncryptedData *)v21;

      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [CKEncryptedDate alloc];
      uint64_t v11 = objc_msgSend_initWithDate_(v22, v23, (uint64_t)v4, v24);
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = [CKEncryptedReference alloc];
      uint64_t v11 = objc_msgSend_initWithReference_(v25, v26, (uint64_t)v4, v27);
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [CKEncryptedLocation alloc];
      uint64_t v11 = objc_msgSend_initWithLocation_(v36, v37, (uint64_t)v4, v38);
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v12 = (CKEncryptedData *)objc_msgSend_initWithData_(self, v39, (uint64_t)v4, v40);
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v82 = [CKException alloc];
      uint64_t v83 = *MEMORY[0x1E4F1C3C8];
      v84 = (objc_class *)objc_opt_class();
      v85 = NSStringFromClass(v84);
      id v87 = (id)objc_msgSend_initWithName_format_(v82, v86, v83, @"Invalid class requested for encrypted object: %@", v85);

      objc_exception_throw(v87);
    }
    id v13 = v4;
    if (!objc_msgSend_count(v13, v41, v42, v43))
    {
      uint64_t v52 = [CKEncryptedEmptyArray alloc];
      v47 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v53, v54, v55);
      uint64_t v51 = objc_msgSend_initWithData_(v52, v56, (uint64_t)v47, v57);
      goto LABEL_33;
    }
    v47 = objc_msgSend_firstObject(v13, v44, v45, v46);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48 = [CKEncryptedStringArray alloc];
      uint64_t v51 = objc_msgSend_initWithStringArray_(v48, v49, (uint64_t)v13, v50);
LABEL_33:
      objc_super v12 = (CKEncryptedData *)v51;

LABEL_14:
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (CFNumberIsFloatType((CFNumberRef)v47))
      {
        v58 = [CKEncryptedDoubleArray alloc];
        uint64_t v51 = objc_msgSend_initWithDoubleArray_(v58, v59, (uint64_t)v13, v60);
      }
      else
      {
        v67 = [CKEncryptedLongLongArray alloc];
        uint64_t v51 = objc_msgSend_initWithLongLongArray_(v67, v68, (uint64_t)v13, v69);
      }
      goto LABEL_33;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = [CKEncryptedDateArray alloc];
      uint64_t v51 = objc_msgSend_initWithDateArray_(v61, v62, (uint64_t)v13, v63);
      goto LABEL_33;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v64 = [CKEncryptedLocationArray alloc];
      uint64_t v51 = objc_msgSend_initWithLocationArray_(v64, v65, (uint64_t)v13, v66);
      goto LABEL_33;
    }
    v88 = [CKException alloc];
    uint64_t v89 = *MEMORY[0x1E4F1C3C8];
    v90 = (objc_class *)objc_opt_class();
    v78 = NSStringFromClass(v90);
    v80 = objc_msgSend_initWithName_format_(v88, v91, v89, @"Invalid class requested for encrypted object: %@", v78);
LABEL_35:
    id v81 = v80;

    objc_exception_throw(v81);
  }
  uint64_t v8 = [CKEncryptedString alloc];
  uint64_t v11 = objc_msgSend_initWithString_(v8, v9, (uint64_t)v4, v10);
LABEL_4:
  objc_super v12 = (CKEncryptedData *)v11;

LABEL_15:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_data(v4, v5, v6, v7);
    objc_super v12 = objc_msgSend_data(self, v9, v10, v11);
    char isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);
  }
  else
  {
    char isEqualToData = 0;
  }

  return isEqualToData;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)CKPropertiesDescription
{
  uint64_t v5 = objc_msgSend_data(self, a2, v2, v3);
  uint64_t v9 = (void *)v5;
  uint64_t v10 = NSString;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v6, @"data=%@", v8, v5);
  }
  else
  {
    objc_super v12 = objc_msgSend_encryptedData(self, v6, v7, v8);
    uint64_t v11 = objc_msgSend_stringWithFormat_(v10, v13, @"encryptedData=%@", v14, v12);
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKEncryptedData *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend_data(self, a2, (uint64_t)a3, v3);
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = v6;
  if (v5)
  {
    uint64_t v11 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v5, v9);
    v15 = objc_msgSend_encryptedData(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
    uint64_t v20 = (void *)v11[2];
    v11[2] = v19;
  }
  else
  {
    uint64_t v21 = objc_msgSend_encryptedData(self, v7, v8, v9);
    uint64_t v11 = objc_msgSend_initWithEncryptedData_(v10, v22, (uint64_t)v21, v23);

    v15 = objc_msgSend_data(self, v24, v25, v26);
    uint64_t v30 = objc_msgSend_copy(v15, v27, v28, v29);
    uint64_t v20 = (void *)v11[1];
    v11[1] = v30;
  }

  return v11;
}

- (BOOL)needsEncryption
{
  uint64_t v8 = objc_msgSend_data(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_encryptedData(self, v5, v6, v7);
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)needsDecryption
{
  uint64_t v8 = objc_msgSend_encryptedData(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_data(self, v5, v6, v7);
    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKEncryptedData)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKEncryptedData;
  uint64_t v5 = [(CKEncryptedData *)&v16 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"EncryptedData");
    data = v5->_data;
    v5->_data = (NSData *)v9;

    if (!byte_1E9124EF0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"ReallyEncryptedData");
        encryptedData = v5->_encryptedData;
        v5->_encryptedData = (NSData *)v13;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_data(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"EncryptedData");

  if (!byte_1E9124EF0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = objc_msgSend_encryptedData(self, v10, v11, v12);
      objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, @"ReallyEncryptedData");
    }
  }
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end