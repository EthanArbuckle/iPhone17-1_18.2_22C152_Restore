@interface DCCredentialProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUsablePresentmentAuthPolicy;
- (BOOL)needsPresentmentKeyRefresh;
- (DCCredentialOptions)options;
- (DCCredentialProperties)init;
- (DCCredentialProperties)initWithCoder:(id)a3;
- (NSArray)payloadProtectionKeys;
- (NSData)payloadIngestionHash;
- (NSDate)createdAt;
- (NSDate)payloadValidFrom;
- (NSDate)payloadValidUntil;
- (NSDate)updatedAt;
- (NSDictionary)deviceEncryptionKeys;
- (NSDictionary)keySigningKeys;
- (NSDictionary)presentmentKeys;
- (NSString)credentialIdentifier;
- (NSString)docType;
- (NSString)issuingJurisdiction;
- (NSString)partition;
- (NSString)region;
- (id)description;
- (unint64_t)credentialState;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setCredentialState:(unint64_t)a3;
- (void)setDeviceEncryptionKeys:(id)a3;
- (void)setDocType:(id)a3;
- (void)setHasUsablePresentmentAuthPolicy:(BOOL)a3;
- (void)setIssuingJurisdiction:(id)a3;
- (void)setKeySigningKeys:(id)a3;
- (void)setNeedsPresentmentKeyRefresh:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPayloadIngestionHash:(id)a3;
- (void)setPayloadProtectionKeys:(id)a3;
- (void)setPayloadValidFrom:(id)a3;
- (void)setPayloadValidUntil:(id)a3;
- (void)setPresentmentKeys:(id)a3;
- (void)setRegion:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation DCCredentialProperties

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
  [v5 encodeObject:self->_partition forKey:0x26C59B020];
  [v5 encodeInteger:self->_credentialState forKey:0x26C59B040];
  [v5 encodeObject:self->_options forKey:0x26C59B060];
  [v5 encodeObject:self->_createdAt forKey:0x26C59B080];
  [v5 encodeObject:self->_updatedAt forKey:0x26C59B0A0];
  [v5 encodeObject:self->_payloadValidFrom forKey:0x26C59B3E0];
  [v5 encodeObject:self->_payloadValidUntil forKey:0x26C59B400];
  [v5 encodeObject:self->_keySigningKeys forKey:0x26C59B280];
  [v5 encodeObject:self->_deviceEncryptionKeys forKey:0x26C59B2A0];
  [v5 encodeObject:self->_presentmentKeys forKey:0x26C59B2C0];
  [v5 encodeObject:self->_payloadProtectionKeys forKey:0x26C59B2E0];
  [v5 encodeBool:self->_hasUsablePresentmentAuthPolicy forKey:0x26C59B300];
  [v5 encodeBool:self->_needsPresentmentKeyRefresh forKey:0x26C59B320];
  [v5 encodeObject:self->_payloadIngestionHash forKey:0x26C59B440];
  [v5 encodeObject:self->_region forKey:0x26C59B540];
  [v5 encodeObject:self->_issuingJurisdiction forKey:0x26C59B560];
  [v5 encodeObject:self->_docType forKey:0x26C59B100];

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DCCredentialProperties *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B000];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    v5->_credentialState = [v4 decodeIntegerForKey:0x26C59B040];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B020];
    partition = v5->_partition;
    v5->_partition = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B060];
    options = v5->_options;
    v5->_options = (DCCredentialOptions *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B080];
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B0A0];
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B3E0];
    payloadValidFrom = v5->_payloadValidFrom;
    v5->_payloadValidFrom = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B400];
    payloadValidUntil = v5->_payloadValidUntil;
    v5->_payloadValidUntil = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B440];
    payloadIngestionHash = v5->_payloadIngestionHash;
    v5->_payloadIngestionHash = (NSData *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:0x26C59B280];
    keySigningKeys = v5->_keySigningKeys;
    v5->_keySigningKeys = (NSDictionary *)v26;

    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:0x26C59B2A0];
    deviceEncryptionKeys = v5->_deviceEncryptionKeys;
    v5->_deviceEncryptionKeys = (NSDictionary *)v32;

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:0x26C59B2C0];
    presentmentKeys = v5->_presentmentKeys;
    v5->_presentmentKeys = (NSDictionary *)v38;

    v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:0x26C59B2E0];
    payloadProtectionKeys = v5->_payloadProtectionKeys;
    v5->_payloadProtectionKeys = (NSArray *)v43;

    v5->_hasUsablePresentmentAuthPolicy = [v4 decodeBoolForKey:0x26C59B300];
    v5->_needsPresentmentKeyRefresh = [v4 decodeBoolForKey:0x26C59B320];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B540];
    region = v5->_region;
    v5->_region = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B560];
    issuingJurisdiction = v5->_issuingJurisdiction;
    v5->_issuingJurisdiction = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B100];
    docType = v5->_docType;
    v5->_docType = (NSString *)v49;
  }
  return v5;
}

- (DCCredentialProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)DCCredentialProperties;
  result = [(DCCredentialProperties *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)description
{
  return @"DCCredentialProperties";
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

- (NSString)partition
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_partition;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPartition:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_partition != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    partition = self->_partition;
    self->_partition = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)credentialState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t credentialState = self->_credentialState;
  os_unfair_lock_unlock(p_lock);
  return credentialState;
}

- (void)setCredentialState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t credentialState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialOptions)options
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_options;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setOptions:(id)a3
{
  uint64_t v6 = (DCCredentialOptions *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_options != v6)
  {
    id v4 = [(DCCredentialOptions *)v6 copyWithZone:0];
    options = self->_options;
    self->_options = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)createdAt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_createdAt;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCreatedAt:(id)a3
{
  uint64_t v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_createdAt != v6)
  {
    id v4 = (NSDate *)[(NSDate *)v6 copyWithZone:0];
    createdAt = self->_createdAt;
    self->_createdAt = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)updatedAt
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_updatedAt;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setUpdatedAt:(id)a3
{
  uint64_t v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_updatedAt != v6)
  {
    id v4 = (NSDate *)[(NSDate *)v6 copyWithZone:0];
    updatedAt = self->_updatedAt;
    self->_updatedAt = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)payloadValidFrom
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_payloadValidFrom;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPayloadValidFrom:(id)a3
{
  uint64_t v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadValidFrom != v6)
  {
    id v4 = (NSDate *)[(NSDate *)v6 copyWithZone:0];
    payloadValidFrom = self->_payloadValidFrom;
    self->_payloadValidFrom = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)payloadValidUntil
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_payloadValidUntil;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPayloadValidUntil:(id)a3
{
  uint64_t v6 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadValidUntil != v6)
  {
    id v4 = (NSDate *)[(NSDate *)v6 copyWithZone:0];
    payloadValidUntil = self->_payloadValidUntil;
    self->_payloadValidUntil = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)payloadIngestionHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_payloadIngestionHash;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPayloadIngestionHash:(id)a3
{
  uint64_t v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadIngestionHash != v6)
  {
    id v4 = (NSData *)[(NSData *)v6 copyWithZone:0];
    payloadIngestionHash = self->_payloadIngestionHash;
    self->_payloadIngestionHash = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)keySigningKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_keySigningKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setKeySigningKeys:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_keySigningKeys != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    keySigningKeys = self->_keySigningKeys;
    self->_keySigningKeys = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)deviceEncryptionKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_deviceEncryptionKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDeviceEncryptionKeys:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_deviceEncryptionKeys != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    deviceEncryptionKeys = self->_deviceEncryptionKeys;
    self->_deviceEncryptionKeys = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)presentmentKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_presentmentKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPresentmentKeys:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_presentmentKeys != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    presentmentKeys = self->_presentmentKeys;
    self->_presentmentKeys = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)payloadProtectionKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_payloadProtectionKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPayloadProtectionKeys:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_payloadProtectionKeys != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    payloadProtectionKeys = self->_payloadProtectionKeys;
    self->_payloadProtectionKeys = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasUsablePresentmentAuthPolicy
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasUsablePresentmentAuthPolicy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasUsablePresentmentAuthPolicy:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasUsablePresentmentAuthPolicy = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)needsPresentmentKeyRefresh
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_needsPresentmentKeyRefresh;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNeedsPresentmentKeyRefresh:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_needsPresentmentKeyRefresh = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)region
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_region;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRegion:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_region != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    region = self->_region;
    self->_region = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)issuingJurisdiction
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_issuingJurisdiction;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIssuingJurisdiction:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_issuingJurisdiction != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    issuingJurisdiction = self->_issuingJurisdiction;
    self->_issuingJurisdiction = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)docType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_docType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDocType:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_docType != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    docType = self->_docType;
    self->_docType = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_issuingJurisdiction, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_payloadProtectionKeys, 0);
  objc_storeStrong((id *)&self->_presentmentKeys, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeys, 0);
  objc_storeStrong((id *)&self->_keySigningKeys, 0);
  objc_storeStrong((id *)&self->_payloadIngestionHash, 0);
  objc_storeStrong((id *)&self->_payloadValidUntil, 0);
  objc_storeStrong((id *)&self->_payloadValidFrom, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_partition, 0);

  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end