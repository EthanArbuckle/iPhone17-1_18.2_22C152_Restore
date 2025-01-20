@interface HMDHomeWalletKeySecureElementInfo
+ (id)createForEasyProvisioning;
+ (id)createForExpressConflictCheckWithSecureElementIdentifier:(id)a3;
+ (id)shortDescription;
+ (int64_t)hmdPaymentTypeFromPKPaymentType:(unint64_t)a3 flow:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMDHomeWalletKeySecureElementInfo)initWithDeviceCredentialKey:(id)a3 applicationIdentifier:(id)a4 subCredentialIdentifier:(id)a5 secureElementIdentifier:(id)a6 pairedReaderIdentifier:(id)a7 paymentCredentialType:(int64_t)a8;
- (HMDHomeWalletKeySecureElementInfo)initWithPaymentApplication:(id)a3 flow:(id)a4;
- (NSData)deviceCredentialKey;
- (NSString)applicationIdentifier;
- (NSString)pairedReaderIdentifier;
- (NSString)secureElementIdentifier;
- (NSString)subCredentialIdentifier;
- (id)attributeDescriptions;
- (id)description;
- (id)shortDescription;
- (int64_t)paymentCredentialType;
- (unint64_t)hash;
@end

@implementation HMDHomeWalletKeySecureElementInfo

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)pairedReaderIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)paymentCredentialType
{
  return self->_paymentCredentialType;
}

- (NSString)subCredentialIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)secureElementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)deviceCredentialKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_subCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
}

+ (id)createForExpressConflictCheckWithSecureElementIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HMDHomeWalletKeySecureElementInfo alloc] initWithDeviceCredentialKey:0 applicationIdentifier:@"A00000085801010100000001" subCredentialIdentifier:@"50306AC7BE75749DA5F104397B29933A78E71B59" secureElementIdentifier:v3 pairedReaderIdentifier:0 paymentCredentialType:0];

  return v4;
}

- (HMDHomeWalletKeySecureElementInfo)initWithDeviceCredentialKey:(id)a3 applicationIdentifier:(id)a4 subCredentialIdentifier:(id)a5 secureElementIdentifier:(id)a6 pairedReaderIdentifier:(id)a7 paymentCredentialType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMDHomeWalletKeySecureElementInfo;
  v19 = [(HMDHomeWalletKeySecureElementInfo *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    deviceCredentialKey = v19->_deviceCredentialKey;
    v19->_deviceCredentialKey = (NSData *)v20;

    uint64_t v22 = [v15 copy];
    applicationIdentifier = v19->_applicationIdentifier;
    v19->_applicationIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    subCredentialIdentifier = v19->_subCredentialIdentifier;
    v19->_subCredentialIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    secureElementIdentifier = v19->_secureElementIdentifier;
    v19->_secureElementIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    pairedReaderIdentifier = v19->_pairedReaderIdentifier;
    v19->_pairedReaderIdentifier = (NSString *)v28;

    v19->_paymentCredentialType = a8;
  }

  return v19;
}

- (id)attributeDescriptions
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v20 = [(HMDHomeWalletKeySecureElementInfo *)self deviceCredentialKey];
  v19 = objc_msgSend(v20, "hmf_hexadecimalRepresentation");
  v4 = (void *)[v3 initWithName:@"Device Credential Public Key" value:v19];
  v21[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMDHomeWalletKeySecureElementInfo *)self applicationIdentifier];
  v7 = (void *)[v5 initWithName:@"Application Identifier" value:v6];
  v21[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDHomeWalletKeySecureElementInfo *)self subCredentialIdentifier];
  v10 = (void *)[v8 initWithName:@"Sub Credential Identifier" value:v9];
  v21[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = [(HMDHomeWalletKeySecureElementInfo *)self secureElementIdentifier];
  v13 = (void *)[v11 initWithName:@"Secure Element Identifier" value:v12];
  v21[3] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v15 = [(HMDHomeWalletKeySecureElementInfo *)self pairedReaderIdentifier];
  id v16 = (void *)[v14 initWithName:@"Paired Reader Identifier" value:v15];
  v21[4] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];

  return v17;
}

- (id)description
{
  return (id)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  id v3 = [(HMDHomeWalletKeySecureElementInfo *)self deviceCredentialKey];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMDHomeWalletKeySecureElementInfo *)self applicationIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDHomeWalletKeySecureElementInfo *)self subCredentialIdentifier];
  uint64_t v8 = [v7 hash];

  v9 = [(HMDHomeWalletKeySecureElementInfo *)self secureElementIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  id v11 = [(HMDHomeWalletKeySecureElementInfo *)self pairedReaderIdentifier];
  uint64_t v12 = v10 ^ [v11 hash];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeWalletKeySecureElementInfo paymentCredentialType](self, "paymentCredentialType"));
  unint64_t v14 = v12 ^ [v13 hash];

  return v14;
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
  if (v6
    && ([(HMDHomeWalletKeySecureElementInfo *)self deviceCredentialKey],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 deviceCredentialKey],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = HMFEqualObjects(),
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [(HMDHomeWalletKeySecureElementInfo *)self applicationIdentifier];
    id v11 = [v6 applicationIdentifier];
    if ([v10 isEqualToString:v11])
    {
      uint64_t v12 = [(HMDHomeWalletKeySecureElementInfo *)self subCredentialIdentifier];
      v13 = [v6 subCredentialIdentifier];
      if ([v12 isEqualToString:v13])
      {
        unint64_t v14 = [(HMDHomeWalletKeySecureElementInfo *)self secureElementIdentifier];
        id v15 = [v6 secureElementIdentifier];
        if (![v14 isEqualToString:v15]) {
          goto LABEL_14;
        }
        id v16 = [(HMDHomeWalletKeySecureElementInfo *)self pairedReaderIdentifier];
        [v6 pairedReaderIdentifier];
        id v17 = v22 = v14;
        int v21 = HMFEqualObjects();

        unint64_t v14 = v22;
        if (v21)
        {
          int64_t v18 = [(HMDHomeWalletKeySecureElementInfo *)self paymentCredentialType];
          BOOL v19 = v18 == [v6 paymentCredentialType];
        }
        else
        {
LABEL_14:
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (HMDHomeWalletKeySecureElementInfo)initWithPaymentApplication:(id)a3 flow:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 secureElementIdentifier];
  int v9 = [v6 subcredentials];
  uint64_t v10 = [v9 anyObject];

  int64_t v11 = +[HMDHomeWalletKeySecureElementInfo hmdPaymentTypeFromPKPaymentType:flow:](HMDHomeWalletKeySecureElementInfo, "hmdPaymentTypeFromPKPaymentType:flow:", [v6 paymentType], v7);
  uint64_t v12 = [v6 applicationIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    unint64_t v14 = [v10 identifier];
    id v15 = v14;
    if (v14 && v8)
    {
      id v16 = [v10 pairedReaderIdentifier];

      if (v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  int64_t v32 = v11;
  id v17 = (void *)MEMORY[0x1D9452090]();
  v33 = self;
  int64_t v18 = self;
  BOOL v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    uint64_t v20 = v31 = v7;
    int v21 = [v31 UUID];
    uint64_t v22 = [v6 applicationIdentifier];
    v23 = [v10 identifier];
    [v10 pairedReaderIdentifier];
    uint64_t v24 = v30 = v17;
    *(_DWORD *)buf = 138545154;
    v35 = v20;
    __int16 v36 = 2112;
    v37 = v21;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    v41 = v10;
    __int16 v42 = 2112;
    v43 = v22;
    __int16 v44 = 2112;
    v45 = v23;
    __int16 v46 = 2112;
    v47 = v8;
    __int16 v48 = 2112;
    v49 = v24;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] PKPass is missing data. paymentApplication: %@, subcredential: %@, paymentApplication.applicationIdentifier: %@, subcredential.identifier: %@, secureElementIdentifier: %@, subcredential.pairedReaderIdentifier: %@", buf, 0x52u);

    id v17 = v30;
    id v7 = v31;
  }

  int64_t v11 = v32;
  self = v33;
LABEL_10:
  v25 = objc_msgSend(v6, "applicationIdentifier", v30);
  uint64_t v26 = [v10 identifier];
  v27 = [v10 pairedReaderIdentifier];
  uint64_t v28 = [(HMDHomeWalletKeySecureElementInfo *)self initWithDeviceCredentialKey:0 applicationIdentifier:v25 subCredentialIdentifier:v26 secureElementIdentifier:v8 pairedReaderIdentifier:v27 paymentCredentialType:v11];

  return v28;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)createForEasyProvisioning
{
  v2 = [[HMDHomeWalletKeySecureElementInfo alloc] initWithDeviceCredentialKey:0 applicationIdentifier:&stru_1F2C9F1A8 subCredentialIdentifier:&stru_1F2C9F1A8 secureElementIdentifier:&stru_1F2C9F1A8 pairedReaderIdentifier:0 paymentCredentialType:0];
  return v2;
}

+ (int64_t)hmdPaymentTypeFromPKPaymentType:(unint64_t)a3 flow:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 1003)
  {
LABEL_7:
    int64_t v7 = 0;
    goto LABEL_8;
  }
  if (a3 != 1004)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v6 UUID];
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unrecognized paymentType, defaulting to HMDPaymentCredentialType0. paymentType: %lu", (uint8_t *)&v14, 0x20u);
    }
    goto LABEL_7;
  }
  int64_t v7 = 1;
LABEL_8:

  return v7;
}

@end