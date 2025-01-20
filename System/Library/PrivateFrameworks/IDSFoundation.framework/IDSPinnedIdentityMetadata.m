@interface IDSPinnedIdentityMetadata
+ (BOOL)supportsSecureCoding;
- (IDSPinnedIdentityMetadata)initWithCoder:(id)a3;
- (NSData)identity;
- (NSString)service;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IDSPinnedIdentityMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSPinnedIdentityMetadata;
  v5 = [(IDSPinnedIdentityMetadata *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"PinnedIdentityMetadataService");
    service = v5->_service;
    v5->_service = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, @"PinnedIdentityMetadataIdentity");
    identity = v5->_identity;
    v5->_identity = (NSData *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  service = self->_service;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)service, v6, @"PinnedIdentityMetadataService");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_identity, v8, @"PinnedIdentityMetadataIdentity");
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; { service: %@, identity: %@ }",
               v6,
               v4,
               self,
               self->_service,
               self->_identity);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_debugDescription(self->_service, v5, v6, v7);
  v12 = objc_msgSend_debugDescription(self->_identity, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p; { service: %@,\n identity: %@ }",
    v14,
    v4,
    self,
    v8,
  v15 = v12);

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSData)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end