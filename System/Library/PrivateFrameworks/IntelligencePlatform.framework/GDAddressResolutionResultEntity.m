@interface GDAddressResolutionResultEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddressResolutionResultEntity:(id)a3;
- (GDAddressResolutionResultEntity)initWithCoder:(id)a3;
- (GDAddressResolutionResultEntity)initWithMdId:(id)a3 contactId:(id)a4;
- (NSString)contactId;
- (NSString)mdId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDAddressResolutionResultEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactId, 0);

  objc_storeStrong((id *)&self->_mdId, 0);
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSString)mdId
{
  return self->_mdId;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"<GDAddressResolutionResultEntity: mdId:%@ contactId:%@>", v5, v6, self->_mdId, self->_contactId);

  return v7;
}

- (GDAddressResolutionResultEntity)initWithMdId:(id)a3 contactId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDAddressResolutionResultEntity;
  v9 = [(GDAddressResolutionResultEntity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mdId, a3);
    objc_storeStrong((id *)&v10->_contactId, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_mdId, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_contactId, v7, v8, v9, v10) - v6 + 32 * v6;
}

- (BOOL)isEqualToAddressResolutionResultEntity:(id)a3
{
  uint64_t v4 = (GDAddressResolutionResultEntity *)a3;
  uint64_t v9 = v4;
  if (v4 == self)
  {
    char isEqualToString = 1;
  }
  else
  {
    if (v4)
    {
      mdId = self->_mdId;
      v11 = objc_msgSend_mdId(v4, v5, v6, v7, v8);
      if (objc_msgSend_isEqualToString_(mdId, v12, (uint64_t)v11, v13, v14))
      {
        contactId = self->_contactId;
        v20 = contactId;
        if (!contactId)
        {
          mdId = objc_msgSend_contactId(v9, v15, v16, v17, v18);
          if (!mdId)
          {
            char isEqualToString = 1;
LABEL_13:

            goto LABEL_14;
          }
          v20 = self->_contactId;
        }
        v21 = objc_msgSend_contactId(v9, v15, v16, v17, v18);
        char isEqualToString = objc_msgSend_isEqualToString_(v20, v22, (uint64_t)v21, v23, v24);

        if (!contactId) {
          goto LABEL_13;
        }
      }
      else
      {
        char isEqualToString = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    char isEqualToString = 0;
  }
LABEL_15:

  return isEqualToString;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GDAddressResolutionResultEntity *)a3;
  if (v4 == self)
  {
    char isEqualToAddressResolutionResultEntity = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToAddressResolutionResultEntity = objc_msgSend_isEqualToAddressResolutionResultEntity_(self, v5, (uint64_t)v4, v6, v7);
    }
    else {
      char isEqualToAddressResolutionResultEntity = 0;
    }
  }

  return isEqualToAddressResolutionResultEntity;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(GDAddressResolutionResultEntity, a2, (uint64_t)a3, v3, v4);
  mdId = self->_mdId;
  contactId = self->_contactId;

  return (id)objc_msgSend_initWithMdId_contactId_(v6, v7, (uint64_t)mdId, (uint64_t)contactId, v8);
}

- (GDAddressResolutionResultEntity)initWithCoder:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_mdId);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (!v9)
  {
    uint64_t v24 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (v24)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44[0] = @"GDAddressResolutionResultEntity mdId could not be decoded";
      uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v44, (uint64_t)&v43, 1);
      v28 = objc_msgSend_errorWithDomain_code_userInfo_(v26, v27, @"GDErrorDomain", 9, (uint64_t)v18);
      objc_msgSend_failWithError_(v4, v29, (uint64_t)v28, v30, v31);

LABEL_8:
      uint64_t v23 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_contactId);
  uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

  if (!v18)
  {
    v32 = objc_msgSend_error(v4, v19, v20, v21, v22);

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"GDAddressResolutionResultEntity contactId could not be decoded";
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)&v42, (uint64_t)&v41, 1);
      v36 = objc_msgSend_errorWithDomain_code_userInfo_(v33, v35, @"GDErrorDomain", 9, (uint64_t)v34);
      objc_msgSend_failWithError_(v4, v37, (uint64_t)v36, v38, v39);

      uint64_t v18 = 0;
      goto LABEL_8;
    }
  }
  self = (GDAddressResolutionResultEntity *)(id)objc_msgSend_initWithMdId_contactId_(self, v19, (uint64_t)v9, (uint64_t)v18, v22);
  uint64_t v23 = self;
LABEL_9:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  mdId = self->_mdId;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_mdId);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)mdId, (uint64_t)v6, v8);

  contactId = self->_contactId;
  NSStringFromSelector(sel_contactId);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)contactId, (uint64_t)v12, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end