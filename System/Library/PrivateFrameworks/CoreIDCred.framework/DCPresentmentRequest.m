@interface DCPresentmentRequest
+ (BOOL)supportsSecureCoding;
- (DCPresentmentRequest)init;
- (DCPresentmentRequest)initWithCoder:(id)a3;
- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4;
- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4 seAccessEndpoint:(id)a5;
- (NSData)requiredPublicKeyIdentifier;
- (NSData)sessionEncryptionIntermediateKeyMaterial;
- (NSData)sessionEstablishment;
- (NSData)sessionTranscript;
- (NSString)regionCode;
- (NSString)relyingPartyIdentifier;
- (NSXPCListenerEndpoint)seAccessEndpoint;
- (void)encodeWithCoder:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setRequiredPublicKeyIdentifier:(id)a3;
- (void)setSeAccessEndpoint:(id)a3;
- (void)setSessionEncryptionIntermediateKeyMaterial:(id)a3;
- (void)setSessionEstablishment:(id)a3;
- (void)setSessionTranscript:(id)a3;
@end

@implementation DCPresentmentRequest

- (DCPresentmentRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DCPresentmentRequest;
  result = [(DCPresentmentRequest *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4
{
  return [(DCPresentmentRequest *)self initWithSessionEstablishment:a3 sessionTranscript:a4 seAccessEndpoint:0];
}

- (DCPresentmentRequest)initWithSessionEstablishment:(id)a3 sessionTranscript:(id)a4 seAccessEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(DCPresentmentRequest *)self init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sessionEstablishment = v11->_sessionEstablishment;
    v11->_sessionEstablishment = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    sessionTranscript = v11->_sessionTranscript;
    v11->_sessionTranscript = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    seAccessEndpoint = v11->_seAccessEndpoint;
    v11->_seAccessEndpoint = (NSXPCListenerEndpoint *)v16;
  }
  return v11;
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
  [v5 encodeObject:self->_sessionEstablishment forKey:0x26C59B6C0];
  [v5 encodeObject:self->_sessionTranscript forKey:0x26C59B6E0];
  [v5 encodeObject:self->_seAccessEndpoint forKey:0x26C59B840];
  [v5 encodeObject:self->_requiredPublicKeyIdentifier forKey:0x26C59B900];
  [v5 encodeObject:self->_sessionEncryptionIntermediateKeyMaterial forKey:0x26C59B920];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:0x26C59B700];
  [v5 encodeObject:self->_regionCode forKey:0x26C59BAE0];

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DCPresentmentRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B6C0];
    sessionEstablishment = v5->_sessionEstablishment;
    v5->_sessionEstablishment = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B6E0];
    sessionTranscript = v5->_sessionTranscript;
    v5->_sessionTranscript = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B840];
    seAccessEndpoint = v5->_seAccessEndpoint;
    v5->_seAccessEndpoint = (NSXPCListenerEndpoint *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B900];
    requiredPublicKeyIdentifier = v5->_requiredPublicKeyIdentifier;
    v5->_requiredPublicKeyIdentifier = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B920];
    sessionEncryptionIntermediateKeyMaterial = v5->_sessionEncryptionIntermediateKeyMaterial;
    v5->_sessionEncryptionIntermediateKeyMaterial = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B700];
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BAE0];
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v18;
  }
  return v5;
}

- (NSData)sessionEstablishment
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sessionEstablishment;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionEstablishment:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionEstablishment != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    sessionEstablishment = self->_sessionEstablishment;
    self->_sessionEstablishment = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)sessionTranscript
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sessionTranscript;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionTranscript:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionTranscript != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    sessionTranscript = self->_sessionTranscript;
    self->_sessionTranscript = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)sessionEncryptionIntermediateKeyMaterial
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_sessionEncryptionIntermediateKeyMaterial;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSessionEncryptionIntermediateKeyMaterial:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_sessionEncryptionIntermediateKeyMaterial != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    sessionEncryptionIntermediateKeyMaterial = self->_sessionEncryptionIntermediateKeyMaterial;
    self->_sessionEncryptionIntermediateKeyMaterial = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)requiredPublicKeyIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_requiredPublicKeyIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRequiredPublicKeyIdentifier:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_requiredPublicKeyIdentifier != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    requiredPublicKeyIdentifier = self->_requiredPublicKeyIdentifier;
    self->_requiredPublicKeyIdentifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSXPCListenerEndpoint)seAccessEndpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_seAccessEndpoint;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSeAccessEndpoint:(id)a3
{
  id v4 = (NSXPCListenerEndpoint *)a3;
  os_unfair_lock_lock(&self->_lock);
  seAccessEndpoint = self->_seAccessEndpoint;
  self->_seAccessEndpoint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)relyingPartyIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_relyingPartyIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_relyingPartyIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    self->_relyingPartyIdentifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)regionCode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_regionCode;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRegionCode:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_regionCode != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    regionCode = self->_regionCode;
    self->_regionCode = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_seAccessEndpoint, 0);
  objc_storeStrong((id *)&self->_requiredPublicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionEncryptionIntermediateKeyMaterial, 0);
  objc_storeStrong((id *)&self->_sessionTranscript, 0);

  objc_storeStrong((id *)&self->_sessionEstablishment, 0);
}

@end