@interface DCCredentialAttestation
+ (BOOL)supportsSecureCoding;
- (DCCredentialAttestation)initWithCoder:(id)a3;
- (DCCredentialAttestation)initWithData:(id)a3 type:(unint64_t)a4;
- (NSData)attestationData;
- (unint64_t)attestationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestationData:(id)a3;
- (void)setAttestationType:(unint64_t)a3;
@end

@implementation DCCredentialAttestation

- (DCCredentialAttestation)initWithData:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialAttestation;
  v7 = [(DCCredentialAttestation *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v6 copy];
    attestationData = v8->_attestationData;
    v8->_attestationData = (NSData *)v9;

    v8->_attestationType = a4;
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
  [v5 encodeObject:self->_attestationData forKey:0x26C59B680];
  [v5 encodeInteger:self->_attestationType forKey:0x26C59B6A0];

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialAttestation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B680];
  uint64_t v6 = [v4 decodeIntegerForKey:0x26C59B6A0];

  v7 = [(DCCredentialAttestation *)self initWithData:v5 type:v6];
  return v7;
}

- (NSData)attestationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_attestationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAttestationData:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attestationData != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    attestationData = self->_attestationData;
    self->_attestationData = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)attestationType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t attestationType = self->_attestationType;
  os_unfair_lock_unlock(p_lock);
  return attestationType;
}

- (void)setAttestationType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t attestationType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end