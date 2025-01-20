@interface CKDistributedSiteIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)SHADescription:(id)a3;
+ (id)pSiteIdentifierFromSiteIdentifier:(id)a3;
+ (id)siteIdentifierFromPSiteIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKDistributedSiteIdentifier)initWithCoder:(id)a3;
- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3;
- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3 modifier:(id)a4;
- (NSData)identifier;
- (NSData)modifier;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDistributedSiteIdentifier

+ (id)pSiteIdentifierFromSiteIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v8 = objc_msgSend_identifier(v3, v5, v6, v7);
  objc_msgSend_setIdentifier_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_modifier(v3, v11, v12, v13);

  objc_msgSend_setModifier_(v4, v15, (uint64_t)v14, v16);

  return v4;
}

+ (id)siteIdentifierFromPSiteIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [CKDistributedSiteIdentifier alloc];
  v8 = objc_msgSend_identifier(v3, v5, v6, v7);
  uint64_t v12 = objc_msgSend_modifier(v3, v9, v10, v11);

  v14 = objc_msgSend_initWithIdentifier_modifier_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  return v14;
}

- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3
{
  return (CKDistributedSiteIdentifier *)objc_msgSend_initWithIdentifier_modifier_(self, a2, (uint64_t)a3, 0);
}

- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3 modifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CKDistributedSiteIdentifier;
  uint64_t v11 = [(CKDistributedSiteIdentifier *)&v22 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    identifier = v11->_identifier;
    v11->_identifier = (NSData *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    v18 = v17;
    if (v17) {
      v19 = v17;
    }
    else {
      v19 = (NSData *)objc_opt_new();
    }
    modifier = v11->_modifier;
    v11->_modifier = v19;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedSiteIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_identifier);
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = NSStringFromSelector(sel_modifier);
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);

  v14 = (CKDistributedSiteIdentifier *)objc_msgSend_initWithIdentifier_modifier_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_identifier(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_identifier);
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  v14 = objc_msgSend_modifier(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_modifier);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (((v5 != 0) & objc_opt_isKindOfClass()) != 0)
  {
    id v6 = v5;
    uint64_t v10 = objc_msgSend_identifier(self, v7, v8, v9);
    id v17 = objc_msgSend_identifier(v6, v11, v12, v13);
    if (v10 == v17
      || (objc_msgSend_identifier(self, v14, v15, v16),
          v40 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_identifier(v6, v18, v19, v20),
          id v3 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_isEqual_(v40, v21, (uint64_t)v3, v22)))
    {
      v24 = objc_msgSend_modifier(self, v14, v15, v16);
      v31 = objc_msgSend_modifier(v6, v25, v26, v27);
      if (v24 == v31)
      {

        char isEqual = 1;
      }
      else
      {
        v32 = objc_msgSend_modifier(self, v28, v29, v30);
        v36 = objc_msgSend_modifier(v6, v33, v34, v35);
        char isEqual = objc_msgSend_isEqual_(v32, v37, (uint64_t)v36, v38);
      }
      if (v10 == v17) {
        goto LABEL_11;
      }
    }
    else
    {
      char isEqual = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char isEqual = 0;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_modifier(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

+ (id)SHADescription:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_string(MEMORY[0x1E4F28E78], v4, v5, v6);
  if (objc_msgSend_length(v3, v8, v9, v10))
  {
    id v13 = v3;
    unint64_t v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    CC_LONG v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA1(v17, v21, md);
    for (uint64_t i = 0; i != 4; ++i)
      objc_msgSend_appendFormat_(v7, v22, @"%02x", v23, md[i]);
  }
  else
  {
    uint64_t v25 = 4;
    do
    {
      objc_msgSend_appendFormat_(v7, v11, @"%02x", v12, 0);
      --v25;
    }
    while (v25);
  }

  return v7;
}

- (id)description
{
  id v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_identifier(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_SHADescription_(v3, v8, (uint64_t)v7, v9);
  v14 = objc_msgSend_mutableCopy(v10, v11, v12, v13);

  v18 = objc_msgSend_modifier(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_length(v18, v19, v20, v21);

  if (v22)
  {
    uint64_t v23 = objc_opt_class();
    uint64_t v27 = objc_msgSend_modifier(self, v24, v25, v26);
    uint64_t v30 = objc_msgSend_SHADescription_(v23, v28, (uint64_t)v27, v29);
    objc_msgSend_appendFormat_(v14, v31, @"(%@)", v32, v30);
  }

  return v14;
}

- (id)descriptionWithStringSiteIdentifiers
{
  id v3 = [NSString alloc];
  uint64_t v7 = objc_msgSend_identifier(self, v4, v5, v6);
  uint64_t v9 = objc_msgSend_initWithData_encoding_(v3, v8, (uint64_t)v7, 4);
  uint64_t v13 = v9;
  if (v9)
  {
    id v14 = v9;
  }
  else
  {
    uint64_t v15 = objc_msgSend_identifier(self, v10, v11, v12);
    objc_msgSend_description(v15, v16, v17, v18);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v22 = objc_msgSend_mutableCopy(v14, v19, v20, v21);
  uint64_t v26 = objc_msgSend_modifier(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_length(v26, v27, v28, v29);

  if (v30)
  {
    id v31 = [NSString alloc];
    uint64_t v35 = objc_msgSend_modifier(self, v32, v33, v34);
    v37 = objc_msgSend_initWithData_encoding_(v31, v36, (uint64_t)v35, 4);
    v41 = v37;
    if (v37)
    {
      id v42 = v37;
    }
    else
    {
      v43 = objc_msgSend_modifier(self, v38, v39, v40);
      objc_msgSend_description(v43, v44, v45, v46);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_appendFormat_(v22, v47, @"(%@)", v48, v42);
  }

  return v22;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSData)modifier
{
  return self->_modifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end