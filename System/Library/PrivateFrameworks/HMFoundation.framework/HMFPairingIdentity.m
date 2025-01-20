@interface HMFPairingIdentity
+ (BOOL)supportsSecureCoding;
+ (id)pairingIdentity;
- (BOOL)isEqual:(id)a3;
- (HMFPairingIdentity)init;
- (HMFPairingIdentity)initWithCoder:(id)a3;
- (HMFPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5;
- (HMFPairingIdentity)publicPairingIdentity;
- (HMFPairingKey)privateKey;
- (HMFPairingKey)publicKey;
- (NSString)identifier;
- (id)attributeDescriptions;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFPairingIdentity

+ (id)pairingIdentity
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  cced25519_make_key_pair_compat();
  v2 = [HMFPairingKey alloc];
  v3 = (void *)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:v14 length:32];
  v4 = [(HMFPairingKey *)v2 initWithPairingKeyData:v3];

  v5 = [HMFPairingKey alloc];
  v6 = (void *)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:v13 length:32];
  v7 = [(HMFPairingKey *)v5 initWithPairingKeyData:v6];

  cc_clear();
  cc_clear();
  id v8 = objc_alloc((Class)objc_opt_class());
  v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];
  v11 = (void *)[v8 initWithIdentifier:v10 publicKey:v4 privateKey:v7];

  return v11;
}

- (HMFPairingIdentity)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier(v18);
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@The identifier is required";
LABEL_10:
      _os_log_impl(&dword_19D57B000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
    }
LABEL_11:

    v19 = 0;
    goto LABEL_12;
  }
  if (!v9)
  {
    v20 = (void *)MEMORY[0x19F3A87A0]();
    v18 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier(v18);
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      v23 = "%{public}@The public key is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFPairingIdentity;
  v11 = [(HMFPairingIdentity *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    publicKey = v11->_publicKey;
    v11->_publicKey = (HMFPairingKey *)v14;

    uint64_t v16 = [v10 copy];
    privateKey = v11->_privateKey;
    v11->_privateKey = (HMFPairingKey *)v16;
  }
  v18 = v11;
  v19 = v18;
LABEL_12:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMFPairingIdentity *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(HMFPairingIdentity *)self publicKey];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMFPairingIdentity *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMFPairingIdentity *)v4 identifier];
      unint64_t v6 = [(HMFPairingIdentity *)self identifier];
      if ([v5 isEqualToString:v6])
      {
        id v7 = [(HMFPairingIdentity *)v4 publicKey];
        id v8 = [(HMFPairingIdentity *)self publicKey];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)shortDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMFPairingIdentity *)self identifier];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  uint64_t v4 = [(HMFPairingIdentity *)self identifier];
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Identifier" value:v4];
  unint64_t v6 = [HMFAttributeDescription alloc];
  id v7 = [(HMFPairingIdentity *)self publicKey];
  id v8 = [(HMFAttributeDescription *)v6 initWithName:@"Public Key" value:v7];
  v15[1] = v8;
  char v9 = [HMFAttributeDescription alloc];
  id v10 = [(HMFPairingIdentity *)self privateKey];
  v11 = +[HMFPrivateObjectFormatter defaultFormatter];
  uint64_t v12 = [(HMFAttributeDescription *)v9 initWithName:@"Private Key" value:v10 options:2 formatter:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMFPairingIdentity)publicPairingIdentity
{
  uint64_t v3 = [(HMFPairingIdentity *)self privateKey];

  if (v3)
  {
    uint64_t v4 = [HMFPairingIdentity alloc];
    v5 = [(HMFPairingIdentity *)self identifier];
    unint64_t v6 = [(HMFPairingIdentity *)self publicKey];
    id v7 = [(HMFPairingIdentity *)v4 initWithIdentifier:v5 publicKey:v6 privateKey:0];
  }
  else
  {
    id v7 = self;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFPairingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMFPairingIdentity;
  v5 = [(HMFPairingIdentity *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.privateKey"];
    privateKey = v5->_privateKey;
    v5->_privateKey = (HMFPairingKey *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (HMFPairingKey *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMFPairingIdentity *)self identifier];
  [v4 encodeObject:v5 forKey:@"HAP.identifier"];

  uint64_t v6 = [(HMFPairingIdentity *)self publicKey];
  [v4 encodeObject:v6 forKey:@"HAP.publicKey"];

  id v7 = [(HMFPairingIdentity *)self privateKey];
  [v4 encodeObject:v7 forKey:@"HAP.privateKey"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMFPairingKey)publicKey
{
  return self->_publicKey;
}

- (HMFPairingKey)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end