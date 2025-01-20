@interface IDSPinnedIdentities
+ (BOOL)supportsSecureCoding;
- (IDSPinnedIdentities)initWithCoder:(id)a3;
- (NSArray)pinnedIdentityMetadatas;
- (NSData)pushToken;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPinnedIdentityMetadatas:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation IDSPinnedIdentities

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentities)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IDSPinnedIdentities;
  v5 = [(IDSPinnedIdentities *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"PinnedIdentitiesPushToken");
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSData *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v24, v13, 2);
    v17 = objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16);
    uint64_t v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, v19, @"PinnedIdentitiesMetadatas");
    pinnedIdentityMetadatas = v5->_pinnedIdentityMetadatas;
    v5->_pinnedIdentityMetadatas = (NSArray *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pushToken = self->_pushToken;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)pushToken, v6, @"PinnedIdentitiesPushToken");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_pinnedIdentityMetadatas, v8, @"PinnedIdentitiesMetadatas");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; { pushToken: %@, metadatas: %@ }",
               v6,
               v4,
               self,
               self->_pushToken,
               self->_pinnedIdentityMetadatas);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_debugDescription(self->_pushToken, v5, v6, v7);
  v12 = objc_msgSend_debugDescription(self->_pinnedIdentityMetadatas, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p; { pushToken: %@,\n metadatas: %@ }",
    v14,
    v4,
    self,
    v8,
  v15 = v12);

  return v15;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSArray)pinnedIdentityMetadatas
{
  return self->_pinnedIdentityMetadatas;
}

- (void)setPinnedIdentityMetadatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedIdentityMetadatas, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end