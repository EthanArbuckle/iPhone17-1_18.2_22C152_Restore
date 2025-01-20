@interface IDSDestinationPushToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSDestinationPushToken)initWithAlias:(id)a3 pushToken:(id)a4;
- (IDSDestinationPushToken)initWithCoder:(id)a3;
- (NSData)pushToken;
- (NSString)alias;
- (id)description;
- (id)destinationURIs;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDestinationPushToken

- (IDSDestinationPushToken)initWithAlias:(id)a3 pushToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDestinationPushToken;
  v9 = [(IDSDestinationPushToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alias, a3);
    objc_storeStrong((id *)&v10->_pushToken, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDestinationPushToken)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"kIDSDestinationPushTokenAlias");
  uint64_t v9 = objc_opt_class();
  objc_super v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"kIDSDestinationPushTokenPushToken");

  v15 = (IDSDestinationPushToken *)objc_msgSend_initWithAlias_pushToken_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_alias(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"kIDSDestinationPushTokenAlias");

  objc_msgSend_pushToken(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"kIDSDestinationPushTokenPushToken");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v8 = objc_msgSend_alias(self, v5, v6, v7);
  uint64_t v9 = IDSLoggableDescriptionForHandleOnService(v8, 0);
  double v13 = objc_msgSend_pushToken(self, v10, v11, v12);
  double v14 = IDSLoggableDescriptionForTokenOnService(v13, 0);
  v17 = objc_msgSend_stringWithFormat_(v3, v15, @"<%@: %p alias: %@ pushToken: %@>", v16, v4, self, v9, v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_pushToken(v5, v6, v7, v8);
    double v13 = objc_msgSend_pushToken(self, v10, v11, v12);
    if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
    {
      v19 = objc_msgSend_alias(v5, v16, v17, v18);
      v23 = objc_msgSend_alias(self, v20, v21, v22);
      char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_pushToken(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)destinationURIs
{
  id v5 = objc_msgSend_pushToken(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_alias(self, v6, v7, v8);
  double v10 = (void *)_IDSCopyIDForTokenWithURI(v5, v9);

  if (v10) {
    objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v11, (uint64_t)v10, v13);
  }
  else {
  double v14 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v11, v12, v13);
  }

  return v14;
}

- (NSString)alias
{
  return self->_alias;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end