@interface CKShareAccessRequester
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKShareAccessRequester)init;
- (CKShareAccessRequester)initWithCoder:(id)a3;
- (CKShareAccessRequester)initWithUserIdentity:(id)a3;
- (CKUserIdentity)userIdentity;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKShareAccessRequester

- (CKShareAccessRequester)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKShareAccessRequester;
  return [(CKShareAccessRequester *)&v3 init];
}

- (CKShareAccessRequester)initWithUserIdentity:(id)a3
{
  id v4 = a3;
  v11 = (CKShareAccessRequester *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v8, v9, v10);
    userIdentity = v11->_userIdentity;
    v11->_userIdentity = (CKUserIdentity *)v12;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_userIdentity(self, v9, v10, v11);
  v15 = objc_msgSend_initWithUserIdentity_(v8, v13, (uint64_t)v12, v14);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKShareAccessRequester *)a3;
  if (v4 == self)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_userIdentity(self, v6, v7, v8);
      v13 = objc_msgSend_userIdentity(v5, v10, v11, v12);

      char isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_userIdentity(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  objc_msgSend_userIdentity(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v8, @"identity", (uint64_t)v9, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShareAccessRequester *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShareAccessRequester *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKShareAccessRequester;
  id v4 = [(CKShareAccessRequester *)&v13 description];
  unint64_t v8 = objc_msgSend_userIdentity(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"[%@ userIdentity=\"%@\"]", v10, v4, v8);

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  unint64_t v8 = objc_msgSend_userIdentity(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, @"UserIdentity");
}

- (CKShareAccessRequester)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKShareAccessRequester;
  v5 = [(CKShareAccessRequester *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"UserIdentity");
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (CKUserIdentity *)v9;
  }

  return v5;
}

- (CKUserIdentity)userIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end