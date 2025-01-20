@interface HMHomeWalletKeyDeviceState
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)canAddWalletKey;
- (BOOL)isEqual:(id)a3;
- (HMHomeWalletKey)walletKey;
- (HMHomeWalletKeyDeviceState)initWithCoder:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)expressEnablementConflictingPassDescription;
- (NSString)shortDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)canAddWalletKeyErrorCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCanAddWalletKey:(BOOL)a3;
- (void)setCanAddWalletKeyErrorCode:(int64_t)a3;
- (void)setExpressEnablementConflictingPassDescription:(id)a3;
- (void)setWalletKey:(id)a3;
@end

@implementation HMHomeWalletKeyDeviceState

- (HMHomeWalletKeyDeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeWalletKeyDeviceStateWalletKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMHomeWalletKeyDeviceStateExpressEnablementConflictingPassDescription"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"HMHomeWalletKeyDeviceStateCanAddWalletKeyErrorCode"];
  uint64_t v8 = [v4 decodeBoolForKey:@"HMHomeWalletKeyDeviceStateCanAddWalletKey"];

  v9 = objc_alloc_init(HMHomeWalletKeyDeviceState);
  [(HMHomeWalletKeyDeviceState *)v9 setCanAddWalletKeyErrorCode:v7];
  [(HMHomeWalletKeyDeviceState *)v9 setWalletKey:v5];
  [(HMHomeWalletKeyDeviceState *)v9 setExpressEnablementConflictingPassDescription:v6];
  [(HMHomeWalletKeyDeviceState *)v9 setCanAddWalletKey:v8];

  return v9;
}

- (NSArray)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMHomeWalletKeyDeviceState *)self walletKey];
  v5 = (void *)[v3 initWithName:@"Wallet Key" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = [(HMHomeWalletKeyDeviceState *)self expressEnablementConflictingPassDescription];
  uint64_t v8 = (void *)[v6 initWithName:@"Express Enablement Conflicting Pass Description" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomeWalletKeyDeviceState *)self canAddWalletKey];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Can Add Wallet Key" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = HMHomeAddWalletKeyErrorCodeAsString([(HMHomeWalletKeyDeviceState *)self canAddWalletKeyErrorCode]);
  v14 = (void *)[v12 initWithName:@"Can Add Wallet Key Error Code" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return (NSArray *)v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMHomeWalletKeyDeviceState *)self walletKey];
  [v6 encodeObject:v4 forKey:@"HMHomeWalletKeyDeviceStateWalletKey"];

  v5 = [(HMHomeWalletKeyDeviceState *)self expressEnablementConflictingPassDescription];
  [v6 encodeObject:v5 forKey:@"HMHomeWalletKeyDeviceStateExpressEnablementConflictingPassDescription"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMHomeWalletKeyDeviceState canAddWalletKeyErrorCode](self, "canAddWalletKeyErrorCode"), @"HMHomeWalletKeyDeviceStateCanAddWalletKeyErrorCode");
  objc_msgSend(v6, "encodeBool:forKey:", -[HMHomeWalletKeyDeviceState canAddWalletKey](self, "canAddWalletKey"), @"HMHomeWalletKeyDeviceStateCanAddWalletKey");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HMMutableHomeWalletKeyDeviceState);
  [(HMHomeWalletKeyDeviceState *)v4 setCanAddWalletKeyErrorCode:[(HMHomeWalletKeyDeviceState *)self canAddWalletKeyErrorCode]];
  [(HMHomeWalletKeyDeviceState *)v4 setCanAddWalletKey:[(HMHomeWalletKeyDeviceState *)self canAddWalletKey]];
  v5 = [(HMHomeWalletKeyDeviceState *)self walletKey];
  [(HMHomeWalletKeyDeviceState *)v4 setWalletKey:v5];

  id v6 = [(HMHomeWalletKeyDeviceState *)self expressEnablementConflictingPassDescription];
  [(HMHomeWalletKeyDeviceState *)v4 setExpressEnablementConflictingPassDescription:v6];

  return v4;
}

- (HMHomeWalletKey)walletKey
{
  return (HMHomeWalletKey *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExpressEnablementConflictingPassDescription:(id)a3
{
}

- (void)setCanAddWalletKeyErrorCode:(int64_t)a3
{
  self->_canAddWalletKeyErrorCode = a3;
}

- (void)setCanAddWalletKey:(BOOL)a3
{
  self->_canAddWalletKey = a3;
}

- (NSString)expressEnablementConflictingPassDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)canAddWalletKey
{
  return self->_canAddWalletKey;
}

- (int64_t)canAddWalletKeyErrorCode
{
  return self->_canAddWalletKeyErrorCode;
}

- (void)setWalletKey:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressEnablementConflictingPassDescription, 0);

  objc_storeStrong((id *)&self->_walletKey, 0);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  id v3 = [(HMHomeWalletKeyDeviceState *)self walletKey];
  uint64_t v4 = [v3 hash];

  v5 = [(HMHomeWalletKeyDeviceState *)self expressEnablementConflictingPassDescription];
  uint64_t v6 = [v5 hash] ^ v4;

  int64_t v7 = v6 ^ [(HMHomeWalletKeyDeviceState *)self canAddWalletKeyErrorCode];
  return v7 ^ [(HMHomeWalletKeyDeviceState *)self canAddWalletKey];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  int64_t v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v8 = [v6 walletKey];
  id v9 = [(HMHomeWalletKeyDeviceState *)self walletKey];
  int v10 = HMFEqualObjects();

  if (!v10) {
    goto LABEL_9;
  }
  v11 = [v7 expressEnablementConflictingPassDescription];
  id v12 = [(HMHomeWalletKeyDeviceState *)self expressEnablementConflictingPassDescription];
  int v13 = HMFEqualObjects();

  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = [v7 canAddWalletKeyErrorCode];
  if (v14 == [(HMHomeWalletKeyDeviceState *)self canAddWalletKeyErrorCode])
  {
    int v15 = [v7 canAddWalletKey];
    int v16 = v15 ^ [(HMHomeWalletKeyDeviceState *)self canAddWalletKey] ^ 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v16) = 0;
  }

  return v16;
}

@end