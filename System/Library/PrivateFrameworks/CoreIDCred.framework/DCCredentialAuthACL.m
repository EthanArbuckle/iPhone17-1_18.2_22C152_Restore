@interface DCCredentialAuthACL
+ (BOOL)supportsSecureCoding;
- (DCCredentialAuthACL)initWithCoder:(id)a3;
- (DCCredentialAuthACL)initWithData:(id)a3 type:(unint64_t)a4;
- (NSData)aclData;
- (unint64_t)aclType;
- (void)encodeWithCoder:(id)a3;
- (void)setAclData:(id)a3;
- (void)setAclType:(unint64_t)a3;
@end

@implementation DCCredentialAuthACL

- (DCCredentialAuthACL)initWithData:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialAuthACL;
  v7 = [(DCCredentialAuthACL *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v6 copy];
    aclData = v8->_aclData;
    v8->_aclData = (NSData *)v9;

    v8->_aclType = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_aclData forKey:0x26C59B640];
  [v5 encodeInteger:self->_aclType forKey:0x26C59B660];

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialAuthACL)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B640];
  uint64_t v6 = [v4 decodeIntegerForKey:0x26C59B660];

  v7 = [(DCCredentialAuthACL *)self initWithData:v5 type:v6];
  return v7;
}

- (NSData)aclData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_aclData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAclData:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_aclData != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    aclData = self->_aclData;
    self->_aclData = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)aclType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t aclType = self->_aclType;
  os_unfair_lock_unlock(p_lock);
  return aclType;
}

- (void)setAclType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t aclType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end