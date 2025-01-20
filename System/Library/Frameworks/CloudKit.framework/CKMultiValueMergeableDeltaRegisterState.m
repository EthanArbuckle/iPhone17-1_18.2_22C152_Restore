@interface CKMultiValueMergeableDeltaRegisterState
+ (BOOL)supportsSecureCoding;
+ (id)newSalt;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampStateVector)vector;
- (CKMultiValueMergeableDeltaRegisterState)init;
- (CKMultiValueMergeableDeltaRegisterState)initWithCoder:(id)a3;
- (CKMultiValueMergeableDeltaRegisterState)initWithIdentifier:(id)a3 vector:(id)a4 salt:(id)a5;
- (NSData)salt;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKMultiValueMergeableDeltaRegisterState

+ (id)newSalt
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  arc4random_buf(__buf, 0x20uLL);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v2, (uint64_t)__buf, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKMultiValueMergeableDeltaRegisterState)init
{
  uint64_t v5 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, v2, v3);
  v6 = objc_opt_new();
  v7 = objc_opt_class();
  v11 = objc_msgSend_newSalt(v7, v8, v9, v10);
  v13 = (CKMultiValueMergeableDeltaRegisterState *)objc_msgSend_initWithIdentifier_vector_salt_(self, v12, (uint64_t)v5, (uint64_t)v6, v11);

  return v13;
}

- (CKMultiValueMergeableDeltaRegisterState)initWithIdentifier:(id)a3 vector:(id)a4 salt:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKMultiValueMergeableDeltaRegisterState;
  v14 = [(CKMultiValueMergeableDeltaRegisterState *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    uint64_t v20 = objc_msgSend_mutableCopy(v9, v17, v18, v19);
    vector = v14->_vector;
    v14->_vector = (CKDistributedTimestampStateVector *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    salt = v14->_salt;
    v14->_salt = (NSData *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMultiValueMergeableDeltaRegisterState)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKMultiValueMergeableDeltaRegisterState;
  uint64_t v5 = [(CKMultiValueMergeableDeltaRegisterState *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_identifier);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_vector);
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, (uint64_t)v12);
    vector = v5->_vector;
    v5->_vector = (CKDistributedTimestampStateVector *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_salt);
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, (uint64_t)v17);
    salt = v5->_salt;
    v5->_salt = (NSData *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)identifier, (uint64_t)v6);

  vector = self->_vector;
  uint64_t v9 = NSStringFromSelector(sel_vector);
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)vector, (uint64_t)v9);

  salt = self->_salt;
  NSStringFromSelector(sel_salt);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)salt, (uint64_t)v13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v8 = objc_msgSend_identifier(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_vector(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_salt(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithIdentifier_vector_salt_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (CKMultiValueMergeableDeltaRegisterState *)a3;
  if (self == v6)
  {
    char isEqual = 1;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v6, v8, v7, v9))
    {
      uint64_t v10 = v6;
      uint64_t v14 = objc_msgSend_identifier(self, v11, v12, v13);
      v21 = objc_msgSend_identifier(v10, v15, v16, v17);
      if (v14 != v21)
      {
        uint64_t v3 = objc_msgSend_identifier(self, v18, v19, v20);
        id v4 = objc_msgSend_identifier(v10, v22, v23, v24);
        if (!objc_msgSend_isEqual_(v3, v25, (uint64_t)v4, v26))
        {
          char isEqual = 0;
          goto LABEL_19;
        }
      }
      objc_super v28 = objc_msgSend_vector(self, v18, v19, v20);
      v35 = objc_msgSend_vector(v10, v29, v30, v31);
      if (v28 == v35)
      {
        v64 = v28;
      }
      else
      {
        v36 = objc_msgSend_vector(self, v32, v33, v34);
        v65 = objc_msgSend_vector(v10, v37, v38, v39);
        if (!objc_msgSend_isEqual_(v36, v40, (uint64_t)v65, v41))
        {
          char isEqual = 0;
          goto LABEL_17;
        }
        v63 = v36;
        v64 = v28;
      }
      v42 = objc_msgSend_salt(self, v32, v33, v34);
      uint64_t v46 = objc_msgSend_salt(v10, v43, v44, v45);
      if (v42 == (void *)v46)
      {

        char isEqual = 1;
      }
      else
      {
        v50 = (void *)v46;
        objc_msgSend_salt(self, v47, v48, v49);
        v51 = v62 = v3;
        objc_msgSend_salt(v10, v52, v53, v54);
        v61 = v4;
        v55 = v21;
        v57 = v56 = v14;
        char isEqual = objc_msgSend_isEqual_(v51, v58, (uint64_t)v57, v59);

        uint64_t v14 = v56;
        v21 = v55;
        id v4 = v61;

        uint64_t v3 = v62;
      }
      v36 = v63;
      objc_super v28 = v64;
      if (v64 == v35)
      {
LABEL_18:

        if (v14 == v21)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char isEqual = 0;
  }
LABEL_21:

  return isEqual;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_vector(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  v21 = objc_msgSend_salt(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CKDistributedTimestampStateVector)vector
{
  return self->_vector;
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_vector, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end