@interface DCCredentialCryptoKey
+ (BOOL)supportsSecureCoding;
- (DCCredentialCryptoKey)init;
- (DCCredentialCryptoKey)initWithCoder:(id)a3;
- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9;
- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9 keyAuthorization:(id)a10 kskAttestation:(id)a11;
- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 casdSignature:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12;
- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 progenitorKeyAttestation:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12;
- (NSArray)attestation;
- (NSArray)kskAttestation;
- (NSData)casdAttestation;
- (NSData)casdSignature;
- (NSData)keyAuthorization;
- (NSData)progenitorKeyAttestation;
- (NSData)publicKey;
- (NSData)publicKeyCOSEKey;
- (NSData)publicKeyIdentifier;
- (NSString)identifier;
- (id)description;
- (unint64_t)keyType;
- (unint64_t)keyUsage;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setCasdAttestation:(id)a3;
- (void)setCasdSignature:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyAuthorization:(id)a3;
- (void)setKeyType:(unint64_t)a3;
- (void)setKeyUsage:(unint64_t)a3;
- (void)setKskAttestation:(id)a3;
- (void)setProgenitorKeyAttestation:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyCOSEKey:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
@end

@implementation DCCredentialCryptoKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock(&self->_lock);
  [v10 encodeObject:self->_identifier forKey:0x26C59B140];
  [v10 encodeObject:self->_publicKey forKey:0x26C59B460];
  [v10 encodeObject:self->_publicKeyIdentifier forKey:0x26C59B160];
  [v10 encodeObject:self->_publicKeyCOSEKey forKey:0x26C59B3C0];
  [v10 encodeInteger:self->_keyType forKey:0x26C59B180];
  [v10 encodeInteger:self->_keyUsage forKey:0x26C59B1A0];
  attestation = self->_attestation;
  if (attestation) {
    [v10 encodeObject:attestation forKey:0x26C59B1C0];
  }
  casdAttestation = self->_casdAttestation;
  if (casdAttestation) {
    [v10 encodeObject:casdAttestation forKey:0x26C59B1E0];
  }
  casdSignature = self->_casdSignature;
  if (casdSignature) {
    [v10 encodeObject:casdSignature forKey:0x26C59B200];
  }
  progenitorKeyAttestation = self->_progenitorKeyAttestation;
  if (progenitorKeyAttestation) {
    [v10 encodeObject:progenitorKeyAttestation forKey:0x26C59B220];
  }
  keyAuthorization = self->_keyAuthorization;
  if (keyAuthorization) {
    [v10 encodeObject:keyAuthorization forKey:0x26C59B240];
  }
  kskAttestation = self->_kskAttestation;
  if (kskAttestation) {
    [v10 encodeObject:kskAttestation forKey:0x26C59B260];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (DCCredentialCryptoKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCCredentialCryptoKey *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B140];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B460];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B160];
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B3C0];
    publicKeyCOSEKey = v5->_publicKeyCOSEKey;
    v5->_publicKeyCOSEKey = (NSData *)v12;

    v5->_keyType = [v4 decodeIntegerForKey:0x26C59B180];
    v5->_keyUsage = [v4 decodeIntegerForKey:0x26C59B1A0];
    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:0x26C59B1C0];
    attestation = v5->_attestation;
    v5->_attestation = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B1E0];
    casdAttestation = v5->_casdAttestation;
    v5->_casdAttestation = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B200];
    casdSignature = v5->_casdSignature;
    v5->_casdSignature = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B220];
    progenitorKeyAttestation = v5->_progenitorKeyAttestation;
    v5->_progenitorKeyAttestation = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B240];
    keyAuthorization = v5->_keyAuthorization;
    v5->_keyAuthorization = (NSData *)v25;

    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:0x26C59B260];
    kskAttestation = v5->_kskAttestation;
    v5->_kskAttestation = (NSArray *)v30;
  }
  return v5;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  v20 = [(DCCredentialCryptoKey *)self init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    publicKey = v20->_publicKey;
    v20->_publicKey = (NSData *)v23;

    uint64_t v25 = [v17 copy];
    publicKeyIdentifier = v20->_publicKeyIdentifier;
    v20->_publicKeyIdentifier = (NSData *)v25;

    uint64_t v27 = [v18 copy];
    publicKeyCOSEKey = v20->_publicKeyCOSEKey;
    v20->_publicKeyCOSEKey = (NSData *)v27;

    v20->_keyUsage = a8;
    v20->_keyType = a7;
    uint64_t v29 = [v19 copy];
    attestation = v20->_attestation;
    v20->_attestation = (NSArray *)v29;
  }
  return v20;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 attestation:(id)a9 keyAuthorization:(id)a10 kskAttestation:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v24 = [(DCCredentialCryptoKey *)self init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    publicKey = v24->_publicKey;
    v24->_publicKey = (NSData *)v27;

    uint64_t v29 = [v19 copy];
    publicKeyIdentifier = v24->_publicKeyIdentifier;
    v24->_publicKeyIdentifier = (NSData *)v29;

    uint64_t v31 = [v20 copy];
    publicKeyCOSEKey = v24->_publicKeyCOSEKey;
    v24->_publicKeyCOSEKey = (NSData *)v31;

    v24->_keyUsage = a8;
    v24->_keyType = a7;
    uint64_t v33 = [v21 copy];
    attestation = v24->_attestation;
    v24->_attestation = (NSArray *)v33;

    uint64_t v35 = [v22 copy];
    keyAuthorization = v24->_keyAuthorization;
    v24->_keyAuthorization = (NSData *)v35;

    uint64_t v37 = [v23 copy];
    kskAttestation = v24->_kskAttestation;
    v24->_kskAttestation = (NSArray *)v37;
  }
  return v24;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 casdSignature:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  uint64_t v25 = [(DCCredentialCryptoKey *)self init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    publicKey = v25->_publicKey;
    v25->_publicKey = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    publicKeyIdentifier = v25->_publicKeyIdentifier;
    v25->_publicKeyIdentifier = (NSData *)v30;

    uint64_t v32 = [v20 copy];
    publicKeyCOSEKey = v25->_publicKeyCOSEKey;
    v25->_publicKeyCOSEKey = (NSData *)v32;

    v25->_keyUsage = a8;
    v25->_keyType = a7;
    uint64_t v34 = [v22 copy];
    casdAttestation = v25->_casdAttestation;
    v25->_casdAttestation = (NSData *)v34;

    uint64_t v36 = [v21 copy];
    casdSignature = v25->_casdSignature;
    v25->_casdSignature = (NSData *)v36;

    uint64_t v38 = [v23 copy];
    keyAuthorization = v25->_keyAuthorization;
    v25->_keyAuthorization = (NSData *)v38;

    uint64_t v40 = [v24 copy];
    kskAttestation = v25->_kskAttestation;
    v25->_kskAttestation = (NSArray *)v40;
  }
  return v25;
}

- (DCCredentialCryptoKey)initWithIdentifier:(id)a3 publicKey:(id)a4 publicKeyIdentifier:(id)a5 publicKeyCOSEKey:(id)a6 keyType:(unint64_t)a7 keyUsage:(unint64_t)a8 progenitorKeyAttestation:(id)a9 casdAttestation:(id)a10 keyAuthorization:(id)a11 kskAttestation:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  uint64_t v25 = [(DCCredentialCryptoKey *)self init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    publicKey = v25->_publicKey;
    v25->_publicKey = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    publicKeyIdentifier = v25->_publicKeyIdentifier;
    v25->_publicKeyIdentifier = (NSData *)v30;

    uint64_t v32 = [v20 copy];
    publicKeyCOSEKey = v25->_publicKeyCOSEKey;
    v25->_publicKeyCOSEKey = (NSData *)v32;

    v25->_keyUsage = a8;
    v25->_keyType = a7;
    uint64_t v34 = [v22 copy];
    casdAttestation = v25->_casdAttestation;
    v25->_casdAttestation = (NSData *)v34;

    uint64_t v36 = [v21 copy];
    progenitorKeyAttestation = v25->_progenitorKeyAttestation;
    v25->_progenitorKeyAttestation = (NSData *)v36;

    uint64_t v38 = [v23 copy];
    keyAuthorization = v25->_keyAuthorization;
    v25->_keyAuthorization = (NSData *)v38;

    uint64_t v40 = [v24 copy];
    kskAttestation = v25->_kskAttestation;
    v25->_kskAttestation = (NSArray *)v40;
  }
  return v25;
}

- (DCCredentialCryptoKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)DCCredentialCryptoKey;
  result = [(DCCredentialCryptoKey *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = NSString;
  identifier = self->_identifier;
  publicKeyIdentifier = self->_publicKeyIdentifier;
  v7 = DCCredentialCryptoKeyTypeToString(self->_keyType);
  uint64_t v8 = DCCredentialCryptoKeyUsageToString(self->_keyUsage);
  v9 = [v4 stringWithFormat:@"DCCredentialCryptoKey identifier = %@, publicKeyIdentifier = %@, keyType = %@, keyUsage = %@", identifier, publicKeyIdentifier, v7, v8];

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (NSString)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_identifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)publicKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_publicKey;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPublicKey:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKey != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    publicKey = self->_publicKey;
    self->_publicKey = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)publicKeyIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_publicKeyIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPublicKeyIdentifier:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKeyIdentifier != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    publicKeyIdentifier = self->_publicKeyIdentifier;
    self->_publicKeyIdentifier = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)publicKeyCOSEKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_publicKeyCOSEKey;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPublicKeyCOSEKey:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_publicKeyCOSEKey != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    publicKeyCOSEKey = self->_publicKeyCOSEKey;
    self->_publicKeyCOSEKey = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)keyType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t keyType = self->_keyType;
  os_unfair_lock_unlock(p_lock);
  return keyType;
}

- (void)setKeyType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t keyType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)keyUsage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t keyUsage = self->_keyUsage;
  os_unfair_lock_unlock(p_lock);
  return keyUsage;
}

- (void)setKeyUsage:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t keyUsage = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)attestation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_attestation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAttestation:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attestation != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    attestation = self->_attestation;
    self->_attestation = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)casdAttestation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_casdAttestation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCasdAttestation:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_casdAttestation != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    casdAttestation = self->_casdAttestation;
    self->_casdAttestation = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)casdSignature
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_casdSignature;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCasdSignature:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_casdSignature != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    casdSignature = self->_casdSignature;
    self->_casdSignature = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)progenitorKeyAttestation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_progenitorKeyAttestation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setProgenitorKeyAttestation:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_progenitorKeyAttestation != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    progenitorKeyAttestation = self->_progenitorKeyAttestation;
    self->_progenitorKeyAttestation = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)keyAuthorization
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_keyAuthorization;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setKeyAuthorization:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_keyAuthorization != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    keyAuthorization = self->_keyAuthorization;
    self->_keyAuthorization = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)kskAttestation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_kskAttestation;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setKskAttestation:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_kskAttestation != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    kskAttestation = self->_kskAttestation;
    self->_kskAttestation = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyCOSEKey, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_casdAttestation, 0);
  objc_storeStrong((id *)&self->_casdSignature, 0);
  objc_storeStrong((id *)&self->_progenitorKeyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAuthorization, 0);

  objc_storeStrong((id *)&self->_kskAttestation, 0);
}

@end