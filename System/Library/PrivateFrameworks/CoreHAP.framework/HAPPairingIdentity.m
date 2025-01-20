@interface HAPPairingIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isStrictlyEqual:(id)a3;
- (HAPPairingIdentity)initWithCoder:(id)a3;
- (HAPPairingIdentity)initWithIdentifier:(id)a3 controllerKeyIdentifier:(id)a4 publicKey:(id)a5 privateKey:(id)a6 permissions:(unint64_t)a7;
- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5;
- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5 permissions:(unint64_t)a6;
- (HAPPairingIdentity)initWithKeychainItem:(id)a3;
- (NSString)controllerKeyIdentifier;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)permissions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAPPairingIdentity

- (HAPPairingIdentity)initWithKeychainItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 valueData];
  uint64_t v6 = _deserializeDataToKeyPair(v5, (uint64_t)v28, (uint64_t)__s);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [NSNumber numberWithInt:v6];
      int v21 = 138543874;
      v22 = v10;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize key for item %@: %@", (uint8_t *)&v21, 0x20u);
    }
    v12 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F65510]);
    v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v28 length:32];
    v15 = (void *)[v13 initWithPairingKeyData:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F65510]);
    v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    v18 = (void *)[v16 initWithPairingKeyData:v17];

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    v19 = [v4 account];
    v8 = [(HAPPairingIdentity *)self initWithIdentifier:v19 publicKey:v15 privateKey:v18];

    v12 = v8;
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (NSString)controllerKeyIdentifier
{
  return self->_controllerKeyIdentifier;
}

- (unint64_t)permissions
{
  return self->_permissions;
}

- (id)attributeDescriptions
{
  v9.receiver = self;
  v9.super_class = (Class)HAPPairingIdentity;
  v3 = [(HAPPairingIdentity *)&v9 attributeDescriptions];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v6 = [(HAPPairingIdentity *)self controllerKeyIdentifier];
  v7 = (void *)[v5 initWithName:@"controllerKeyIdentifier" value:v6];
  [v4 addObject:v7];

  return v4;
}

- (BOOL)isStrictlyEqual:(id)a3
{
  id v4 = (HAPPairingIdentity *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6
      && (v12.receiver = self,
          v12.super_class = (Class)HAPPairingIdentity,
          [(HAPPairingIdentity *)&v12 isEqual:v4])
      && (unint64_t v7 = [(HAPPairingIdentity *)self permissions],
          v7 == [(HAPPairingIdentity *)self permissions]))
    {
      v8 = [(HAPPairingIdentity *)self controllerKeyIdentifier];
      objc_super v9 = [(HAPPairingIdentity *)v6 controllerKeyIdentifier];
      char v10 = HMFEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HAPPairingIdentity;
  id v4 = a3;
  [(HAPPairingIdentity *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPPairingIdentity permissions](self, "permissions", v6.receiver, v6.super_class), @"HAP.permissions");
  id v5 = [(HAPPairingIdentity *)self controllerKeyIdentifier];
  [v4 encodeObject:v5 forKey:@"HAP.ctrlId"];
}

- (HAPPairingIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPPairingIdentity;
  id v5 = [(HAPPairingIdentity *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_permissions = [v4 decodeIntegerForKey:@"HAP.permissions"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.ctrlId"];
    controllerKeyIdentifier = v5->_controllerKeyIdentifier;
    v5->_controllerKeyIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HAPPairingIdentity allocWithZone:a3];
  id v5 = [(HAPPairingIdentity *)self identifier];
  uint64_t v6 = [(HAPPairingIdentity *)self controllerKeyIdentifier];
  unint64_t v7 = [(HAPPairingIdentity *)self publicKey];
  v8 = [(HAPPairingIdentity *)self privateKey];
  objc_super v9 = [(HAPPairingIdentity *)v4 initWithIdentifier:v5 controllerKeyIdentifier:v6 publicKey:v7 privateKey:v8 permissions:[(HAPPairingIdentity *)self permissions]];

  return v9;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 controllerKeyIdentifier:(id)a4 publicKey:(id)a5 privateKey:(id)a6 permissions:(unint64_t)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAPPairingIdentity;
  v14 = [(HAPPairingIdentity *)&v17 initWithIdentifier:a3 publicKey:a5 privateKey:a6];
  v15 = v14;
  if (v14)
  {
    v14->_permissions = a7;
    objc_storeStrong((id *)&v14->_controllerKeyIdentifier, a4);
  }

  return v15;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5 permissions:(unint64_t)a6
{
  result = [(HAPPairingIdentity *)self initWithIdentifier:a3 controllerKeyIdentifier:0 publicKey:a4 privateKey:a5 permissions:a6];
  if (result) {
    result->_permissions = a6;
  }
  return result;
}

- (HAPPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  return [(HAPPairingIdentity *)self initWithIdentifier:a3 controllerKeyIdentifier:0 publicKey:a4 privateKey:a5 permissions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end