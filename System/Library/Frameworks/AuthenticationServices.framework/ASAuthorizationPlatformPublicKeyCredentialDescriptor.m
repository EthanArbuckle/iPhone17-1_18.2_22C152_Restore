@interface ASAuthorizationPlatformPublicKeyCredentialDescriptor
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCoder:(id)a3;
- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCredentialID:(NSData *)credentialID;
- (ASCPublicKeyCredentialDescriptor)coreDescriptor;
- (NSData)credentialID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialID:(id)a3;
@end

@implementation ASAuthorizationPlatformPublicKeyCredentialDescriptor

- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCredentialID:(NSData *)credentialID
{
  v4 = credentialID;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialDescriptor;
  v5 = [(ASAuthorizationPlatformPublicKeyCredentialDescriptor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSData *)v4 copy];
    v7 = v5->_credentialID;
    v5->_credentialID = (NSData *)v6;

    v5->_internalLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

- (ASCPublicKeyCredentialDescriptor)coreDescriptor
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F29418]) initWithCredentialID:self->_credentialID transports:0];

  return (ASCPublicKeyCredentialDescriptor *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(ASAuthorizationPlatformPublicKeyCredentialDescriptor *)self credentialID];
  uint64_t v6 = (void *)[v4 initWithCredentialID:v5];

  return v6;
}

- (ASAuthorizationPlatformPublicKeyCredentialDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];

  uint64_t v6 = [(ASAuthorizationPlatformPublicKeyCredentialDescriptor *)self initWithCredentialID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASAuthorizationPlatformPublicKeyCredentialDescriptor *)self credentialID];
  [v4 encodeObject:v5 forKey:@"credentialID"];
}

- (NSData)credentialID
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_credentialID;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setCredentialID:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  credentialID = self->_credentialID;
  self->_credentialID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
}

@end