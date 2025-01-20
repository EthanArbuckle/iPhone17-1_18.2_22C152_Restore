@interface IDSPinnedIdentity
+ (BOOL)supportsSecureCoding;
- (IDSPinnedIdentity)initWithCoder:(id)a3;
- (IDSPinnedIdentity)initWithIdentityBlob:(id)a3;
- (NSData)identityBlob;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityBlob:(id)a3;
@end

@implementation IDSPinnedIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentity)initWithIdentityBlob:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSPinnedIdentity;
  v6 = [(IDSPinnedIdentity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identityBlob, a3);
  }

  return v7;
}

- (IDSPinnedIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSPinnedIdentity;
  id v5 = [(IDSPinnedIdentity *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"IdentityBlob");
    identityBlob = v5->_identityBlob;
    v5->_identityBlob = (NSData *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_identityBlob, v3, @"IdentityBlob");
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; { identityBlob: %@ }",
               v6,
               v4,
               self,
               self->_identityBlob);
}

- (NSData)identityBlob
{
  return self->_identityBlob;
}

- (void)setIdentityBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end