@interface HMHomeWalletKey
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpressEnabled;
- (BOOL)isUWBUnlockEnabled;
- (HMHomeWalletKey)initWithCoder:(id)a3;
- (HMHomeWalletKey)initWithUUID:(id)a3 customURL:(id)a4 expressEnabled:(BOOL)a5 uwbUnlockEnabled:(BOOL)a6 color:(int64_t)a7;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSURL)customURL;
- (NSUUID)UUID;
- (int64_t)color;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMHomeWalletKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customURL, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (int64_t)color
{
  return self->_color;
}

- (BOOL)isUWBUnlockEnabled
{
  return self->_uwbUnlockEnabled;
}

- (BOOL)isExpressEnabled
{
  return self->_expressEnabled;
}

- (NSURL)customURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v19 = [(HMHomeWalletKey *)self UUID];
  v4 = (void *)[v3 initWithName:@"UUID" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMHomeWalletKey *)self customURL];
  v7 = (void *)[v5 initWithName:@"Custom URL" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomeWalletKey *)self isExpressEnabled];
  v9 = HMFBooleanToString();
  v10 = (void *)[v8 initWithName:@"Express Enabled" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomeWalletKey *)self isUWBUnlockEnabled];
  v12 = HMFBooleanToString();
  v13 = (void *)[v11 initWithName:@"UWB Enabled" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = HMHomeWalletKeyColorAsString([(HMHomeWalletKey *)self color]);
  v16 = (void *)[v14 initWithName:@"Color" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return (NSArray *)v17;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HMHomeWalletKey)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeWalletKeyUUID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeWalletKeyCustomURL"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize wallet keyfrom decoded UUID: %@ customURL: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = -[HMHomeWalletKey initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:](self, "initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:", v5, v6, [v4 decodeBoolForKey:@"HMHomeWalletKeyExpressEnabled"], objc_msgSend(v4, "decodeBoolForKey:", @"HMHomeWalletKeyUWBUnlockEnabled"), objc_msgSend(v4, "decodeIntegerForKey:", @"HMHomeWalletKeyEncodedColor"));
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMHomeWalletKey *)self UUID];
  [v6 encodeObject:v4 forKey:@"HMHomeWalletKeyUUID"];

  id v5 = [(HMHomeWalletKey *)self customURL];
  [v6 encodeObject:v5 forKey:@"HMHomeWalletKeyCustomURL"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKey isExpressEnabled](self, "isExpressEnabled"), @"HMHomeWalletKeyExpressEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKey isUWBUnlockEnabled](self, "isUWBUnlockEnabled"), @"HMHomeWalletKeyUWBUnlockEnabled");
  objc_msgSend(v6, "encodeInteger:forKey:", -[HMHomeWalletKey color](self, "color"), @"HMHomeWalletKeyEncodedColor");
}

- (unint64_t)hash
{
  v2 = [(HMHomeWalletKey *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMHomeWalletKey *)self UUID];
    BOOL v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMHomeWalletKey *)self customURL];
      v10 = [v6 customURL];
      if ([v9 isEqual:v10]
        && (int v11 = [(HMHomeWalletKey *)self isExpressEnabled],
            v11 == [v6 isExpressEnabled])
        && (int64_t v12 = -[HMHomeWalletKey color](self, "color"), v12 == [v6 color]))
      {
        BOOL v13 = [(HMHomeWalletKey *)self isUWBUnlockEnabled];
        int v14 = v13 ^ [v6 isUWBUnlockEnabled] ^ 1;
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (HMHomeWalletKey)initWithUUID:(id)a3 customURL:(id)a4 expressEnabled:(BOOL)a5 uwbUnlockEnabled:(BOOL)a6 color:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMHomeWalletKey;
  int v15 = [(HMHomeWalletKey *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_UUID, a3);
    objc_storeStrong((id *)&v16->_customURL, a4);
    v16->_expressEnabled = a5;
    v16->_uwbUnlockEnabled = a6;
    v16->_color = a7;
  }

  return v16;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end