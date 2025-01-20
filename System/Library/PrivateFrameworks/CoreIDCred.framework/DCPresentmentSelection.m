@interface DCPresentmentSelection
+ (BOOL)supportsSecureCoding;
- (DCPresentmentSelection)init;
- (DCPresentmentSelection)initWithCoder:(id)a3;
- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6;
- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6 deviceNamespaces:(id)a7;
- (NSArray)responseEncryptionCertificateChain;
- (NSData)authData;
- (NSData)sessionTranscript;
- (NSDictionary)deviceNamespaces;
- (NSDictionary)elementsToPresent;
- (NSString)credentialIdentifier;
- (NSXPCListenerEndpoint)seAccessEndpoint;
- (id)copyWithElementsToPresent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthData:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setDeviceNamespaces:(id)a3;
- (void)setElementsToPresent:(id)a3;
- (void)setResponseEncryptionCertificateChain:(id)a3;
- (void)setSeAccessEndpoint:(id)a3;
- (void)setSessionTranscript:(id)a3;
@end

@implementation DCPresentmentSelection

- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6
{
  return [(DCPresentmentSelection *)self initWithCredentialIdentifier:a3 elementsToPresent:a4 authData:a5 seAccessEndpoint:a6 deviceNamespaces:0];
}

- (DCPresentmentSelection)initWithCredentialIdentifier:(id)a3 elementsToPresent:(id)a4 authData:(id)a5 seAccessEndpoint:(id)a6 deviceNamespaces:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(DCPresentmentSelection *)self init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    credentialIdentifier = v17->_credentialIdentifier;
    v17->_credentialIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    elementsToPresent = v17->_elementsToPresent;
    v17->_elementsToPresent = (NSDictionary *)v20;

    uint64_t v22 = [v14 copy];
    authData = v17->_authData;
    v17->_authData = (NSData *)v22;

    objc_storeStrong((id *)&v17->_seAccessEndpoint, a6);
    uint64_t v24 = [v16 copy];
    deviceNamespaces = v17->_deviceNamespaces;
    v17->_deviceNamespaces = (NSDictionary *)v24;
  }
  return v17;
}

- (DCPresentmentSelection)init
{
  v3.receiver = self;
  v3.super_class = (Class)DCPresentmentSelection;
  result = [(DCPresentmentSelection *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
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
  [v5 encodeObject:self->_credentialIdentifier forKey:0x26C59B000];
  [v5 encodeObject:self->_elementsToPresent forKey:0x26C59B800];
  [v5 encodeObject:self->_authData forKey:0x26C59B820];
  [v5 encodeObject:self->_seAccessEndpoint forKey:0x26C59B840];
  [v5 encodeObject:self->_deviceNamespaces forKey:0x26C59B860];
  [v5 encodeObject:self->_sessionTranscript forKey:0x26C59B6E0];
  [v5 encodeObject:self->_responseEncryptionCertificateChain forKey:0x26C59B940];

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DCPresentmentSelection *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B000];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:0x26C59B800];
    elementsToPresent = v5->_elementsToPresent;
    v5->_elementsToPresent = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B820];
    authData = v5->_authData;
    v5->_authData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B840];
    seAccessEndpoint = v5->_seAccessEndpoint;
    v5->_seAccessEndpoint = (NSXPCListenerEndpoint *)v16;

    uint64_t v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:0x26C59B860];
    deviceNamespaces = v5->_deviceNamespaces;
    v5->_deviceNamespaces = (NSDictionary *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B6E0];
    sessionTranscript = v5->_sessionTranscript;
    v5->_sessionTranscript = (NSData *)v25;

    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:0x26C59B940];
    responseEncryptionCertificateChain = v5->_responseEncryptionCertificateChain;
    v5->_responseEncryptionCertificateChain = (NSArray *)v30;
  }
  return v5;
}

- (id)copyWithElementsToPresent:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [[DCPresentmentSelection alloc] initWithCredentialIdentifier:self->_credentialIdentifier elementsToPresent:v5 authData:self->_authData seAccessEndpoint:self->_seAccessEndpoint deviceNamespaces:self->_deviceNamespaces];

  v7 = (void *)[(NSData *)self->_sessionTranscript copy];
  [(DCPresentmentSelection *)v6 setSessionTranscript:v7];

  v8 = (void *)[(NSArray *)self->_responseEncryptionCertificateChain copy];
  [(DCPresentmentSelection *)v6 setResponseEncryptionCertificateChain:v8];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)credentialIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_credentialIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCredentialIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_credentialIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    credentialIdentifier = self->_credentialIdentifier;
    self->_credentialIdentifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)elementsToPresent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_elementsToPresent;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setElementsToPresent:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_elementsToPresent != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    elementsToPresent = self->_elementsToPresent;
    self->_elementsToPresent = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)authData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_authData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAuthData:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_authData != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    authData = self->_authData;
    self->_authData = v4;
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

- (NSDictionary)deviceNamespaces
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_deviceNamespaces;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDeviceNamespaces:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deviceNamespaces != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    deviceNamespaces = self->_deviceNamespaces;
    self->_deviceNamespaces = v4;
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

- (NSArray)responseEncryptionCertificateChain
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_responseEncryptionCertificateChain;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setResponseEncryptionCertificateChain:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_responseEncryptionCertificateChain != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    responseEncryptionCertificateChain = self->_responseEncryptionCertificateChain;
    self->_responseEncryptionCertificateChain = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseEncryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_sessionTranscript, 0);
  objc_storeStrong((id *)&self->_deviceNamespaces, 0);
  objc_storeStrong((id *)&self->_seAccessEndpoint, 0);
  objc_storeStrong((id *)&self->_authData, 0);
  objc_storeStrong((id *)&self->_elementsToPresent, 0);

  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end