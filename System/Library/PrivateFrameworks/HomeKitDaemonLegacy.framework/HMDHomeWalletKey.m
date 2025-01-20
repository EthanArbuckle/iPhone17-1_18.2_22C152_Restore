@interface HMDHomeWalletKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isMissingNFCInfo;
- (HMDHomeWalletKey)initWithPKPass:(id)a3 flow:(id)a4;
- (HMDHomeWalletKey)initWithTypeIdentifier:(id)a3 serialNumber:(id)a4 state:(int64_t)a5 walletKeyDescription:(id)a6 homeName:(id)a7 color:(int64_t)a8 nfcInfos:(id)a9;
- (NSArray)nfcInfos;
- (NSString)accessCode;
- (NSString)homeName;
- (NSString)labelColorValue;
- (NSString)passColorValue;
- (NSString)serialNumber;
- (NSString)typeIdentifier;
- (NSString)walletKeyDescription;
- (NSURL)changeAccessCodeHomeAppCustomURL;
- (NSURL)customURL;
- (NSUUID)uuid;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)xpcWalletKeyWithExpressEnabled:(BOOL)a3;
- (int64_t)color;
- (int64_t)state;
- (unint64_t)hash;
- (void)setAccessCode:(id)a3;
- (void)setChangeAccessCodeHomeAppCustomURL:(id)a3;
- (void)setColor:(int64_t)a3;
- (void)setCustomURL:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setNfcInfos:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setWalletKeyDescription:(id)a3;
@end

@implementation HMDHomeWalletKey

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  v32[9] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v31 = [(HMDHomeWalletKey *)self typeIdentifier];
  v30 = (void *)[v3 initWithName:@"Type Identifier" value:v31];
  v32[0] = v30;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v29 = [(HMDHomeWalletKey *)self serialNumber];
  v28 = (void *)[v4 initWithName:@"Serial Number" value:v29];
  v32[1] = v28;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeWalletKey state](self, "state"));
  v26 = (void *)[v5 initWithName:@"State" value:v27];
  v32[2] = v26;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(HMDHomeWalletKey *)self walletKeyDescription];
  v24 = (void *)[v6 initWithName:@"Description" value:v25];
  v32[3] = v24;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMDHomeWalletKey *)self homeName];
  v8 = (void *)[v7 initWithName:@"Home Name" value:v23];
  v32[4] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDHomeWalletKey *)self changeAccessCodeHomeAppCustomURL];
  v11 = (void *)[v9 initWithName:@"Change Access Code Home App URL" value:v10];
  v32[5] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDHomeWalletKey *)self nfcInfos];
  v14 = (void *)[v12 initWithName:@"NFC Info" value:v13];
  v32[6] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHomeWalletKey *)self color];
  v16 = HMHomeWalletKeyColorAsString();
  v17 = (void *)[v15 initWithName:@"Color" value:v16];
  v32[7] = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  v19 = [(HMDHomeWalletKey *)self customURL];
  v20 = (void *)[v18 initWithName:@"Custom URL" value:v19];
  v32[8] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:9];

  return v21;
}

- (NSArray)nfcInfos
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)color
{
  return self->_color;
}

- (NSString)walletKeyDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)changeAccessCodeHomeAppCustomURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (NSURL)customURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)passColorValue
{
  uint64_t v2 = [(HMDHomeWalletKey *)self color];
  if (v2 > 14935010)
  {
    if (v2 != 14935011)
    {
      if (v2 == 15521450) {
        return (NSString *)@"gold";
      }
      return (NSString *)@"tan";
    }
    return (NSString *)@"silver";
  }
  else
  {
    if (v2) {
      return (NSString *)@"tan";
    }
    return (NSString *)@"black";
  }
}

- (NSString)labelColorValue
{
  uint64_t v2 = [(HMDHomeWalletKey *)self color];
  if (v2 > 14935010)
  {
    if (v2 != 14935011)
    {
      if (v2 == 15521450) {
        return (NSString *)@"rgb(141, 125, 100)";
      }
      return (NSString *)@"rgb(118, 112, 104)";
    }
    return (NSString *)@"rgb(137, 136, 136)";
  }
  else
  {
    if (v2) {
      return (NSString *)@"rgb(118, 112, 104)";
    }
    return (NSString *)@"rgb(153, 153, 153)";
  }
}

- (HMDHomeWalletKey)initWithTypeIdentifier:(id)a3 serialNumber:(id)a4 state:(int64_t)a5 walletKeyDescription:(id)a6 homeName:(id)a7 color:(int64_t)a8 nfcInfos:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v32.receiver = self;
  v32.super_class = (Class)HMDHomeWalletKey;
  v20 = [(HMDHomeWalletKey *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    typeIdentifier = v20->_typeIdentifier;
    v20->_typeIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    serialNumber = v20->_serialNumber;
    v20->_serialNumber = (NSString *)v23;

    v20->_state = a5;
    uint64_t v25 = [v17 copy];
    walletKeyDescription = v20->_walletKeyDescription;
    v20->_walletKeyDescription = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    homeName = v20->_homeName;
    v20->_homeName = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    nfcInfos = v20->_nfcInfos;
    v20->_nfcInfos = (NSArray *)v29;

    v20->_color = a8;
  }

  return v20;
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customURL, 0);
  objc_storeStrong((id *)&self->_changeAccessCodeHomeAppCustomURL, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_nfcInfos, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_walletKeyDescription, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (void)setCustomURL:(id)a3
{
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

- (void)setChangeAccessCodeHomeAppCustomURL:(id)a3
{
}

- (void)setAccessCode:(id)a3
{
}

- (void)setNfcInfos:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setHomeName:(id)a3
{
}

- (void)setWalletKeyDescription:(id)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMDMutableHomeWalletKey alloc];
  id v5 = [(HMDHomeWalletKey *)self typeIdentifier];
  id v6 = [(HMDHomeWalletKey *)self serialNumber];
  int64_t v7 = [(HMDHomeWalletKey *)self state];
  v8 = [(HMDHomeWalletKey *)self walletKeyDescription];
  id v9 = [(HMDHomeWalletKey *)self homeName];
  int64_t v10 = [(HMDHomeWalletKey *)self color];
  v11 = [(HMDHomeWalletKey *)self nfcInfos];
  id v12 = [(HMDHomeWalletKey *)v4 initWithTypeIdentifier:v5 serialNumber:v6 state:v7 walletKeyDescription:v8 homeName:v9 color:v10 nfcInfos:v11];

  v13 = [(HMDHomeWalletKey *)self accessCode];
  [(HMDHomeWalletKey *)v12 setAccessCode:v13];

  v14 = [(HMDHomeWalletKey *)self changeAccessCodeHomeAppCustomURL];
  [(HMDHomeWalletKey *)v12 setChangeAccessCodeHomeAppCustomURL:v14];

  id v15 = [(HMDHomeWalletKey *)self customURL];
  [(HMDHomeWalletKey *)v12 setCustomURL:v15];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HMDHomeWalletKey *)self serialNumber];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMDHomeWalletKey *)self typeIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  int64_t v7 = [(HMDHomeWalletKey *)self homeName];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMDHomeWalletKey *)self walletKeyDescription];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  int64_t v11 = [(HMDHomeWalletKey *)self state];
  id v12 = [(HMDHomeWalletKey *)self accessCode];
  uint64_t v13 = v11 ^ [v12 hash];

  v14 = [(HMDHomeWalletKey *)self changeAccessCodeHomeAppCustomURL];
  uint64_t v15 = v10 ^ v13 ^ [v14 hash];

  id v16 = [(HMDHomeWalletKey *)self nfcInfos];
  uint64_t v17 = [v16 hash];

  int64_t v18 = v17 ^ [(HMDHomeWalletKey *)self color];
  id v19 = [(HMDHomeWalletKey *)self customURL];
  unint64_t v20 = v15 ^ v18 ^ [v19 hash];

  return v20;
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
    int64_t v7 = [(HMDHomeWalletKey *)self serialNumber];
    uint64_t v8 = [v6 serialNumber];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(HMDHomeWalletKey *)self typeIdentifier];
      uint64_t v10 = [v6 typeIdentifier];
      if ([v9 isEqualToString:v10])
      {
        int64_t v11 = [(HMDHomeWalletKey *)self homeName];
        id v12 = [v6 homeName];
        if ([v11 isEqualToString:v12])
        {
          uint64_t v13 = [(HMDHomeWalletKey *)self walletKeyDescription];
          v30 = [v6 walletKeyDescription];
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            uint64_t v29 = v13;
            int64_t v14 = [(HMDHomeWalletKey *)self state];
            if (v14 != [v6 state]) {
              goto LABEL_20;
            }
            v26 = [(HMDHomeWalletKey *)self accessCode];
            uint64_t v15 = [v6 accessCode];
            int v23 = HMFEqualObjects();

            if (!v23) {
              goto LABEL_20;
            }
            uint64_t v27 = [(HMDHomeWalletKey *)self changeAccessCodeHomeAppCustomURL];
            id v16 = [v6 changeAccessCodeHomeAppCustomURL];
            int v24 = HMFEqualObjects();

            if (v24)
            {
              uint64_t v17 = [(HMDHomeWalletKey *)self nfcInfos];
              uint64_t v25 = [v6 nfcInfos];
              v28 = v17;
              if (objc_msgSend(v17, "isEqual:")
                && (int64_t v18 = -[HMDHomeWalletKey color](self, "color"), v18 == [v6 color]))
              {
                v22 = [(HMDHomeWalletKey *)self customURL];
                id v19 = [v6 customURL];
                char v20 = HMFEqualObjects();
              }
              else
              {
                char v20 = 0;
              }
              uint64_t v13 = v29;
            }
            else
            {
LABEL_20:
              char v20 = 0;
              uint64_t v13 = v29;
            }
          }
          else
          {
            char v20 = 0;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (BOOL)isMissingNFCInfo
{
  id v3 = [(HMDHomeWalletKey *)self nfcInfos];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (v4) {
    return 1;
  }
  id v6 = [(HMDHomeWalletKey *)self nfcInfos];
  char v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_29956);

  return v7;
}

BOOL __36__HMDHomeWalletKey_isMissingNFCInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 applicationIdentifier];
  if (v3)
  {
    char v4 = [v2 subCredentialIdentifier];
    if (v4)
    {
      id v5 = [v2 secureElementIdentifier];
      if (v5)
      {
        id v6 = [v2 pairedReaderIdentifier];
        BOOL v7 = v6 == 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)xpcWalletKeyWithExpressEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDHomeWalletKey *)self customURL];

  if (v5)
  {
    id v6 = [(HMDHomeWalletKey *)self uuid];
    id v7 = objc_alloc(MEMORY[0x1E4F2E840]);
    uint64_t v8 = [(HMDHomeWalletKey *)self customURL];
    id v9 = objc_msgSend(v7, "initWithUUID:customURL:expressEnabled:uwbUnlockEnabled:color:", v6, v8, v3, 0, -[HMDHomeWalletKey color](self, "color"));
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (NSUUID)uuid
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HMDHomeWalletKey *)self serialNumber];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [(HMDHomeWalletKey *)self nfcInfos];
  uint64_t v8 = [v7 firstObject];
  id v9 = [v8 subCredentialIdentifier];
  uint64_t v10 = [v9 dataUsingEncoding:4];
  int64_t v11 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v10);

  return (NSUUID *)v11;
}

- (HMDHomeWalletKey)initWithPKPass:(id)a3 flow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31 = [v6 passTypeIdentifier];
  v30 = [v6 serialNumber];
  uint64_t v8 = [v6 localizedDescription];
  id v9 = [v6 fieldForKey:@"homeName"];
  uint64_t v10 = [v6 fieldForKey:@"arbitrary_supplementary_field_changeAccessCode"];
  int64_t v11 = [v6 secureElementPass];
  id v12 = [v11 devicePaymentApplications];
  uint64_t v13 = [v12 allObjects];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__HMDHomeWalletKey_initWithPKPass_flow___block_invoke;
  v32[3] = &unk_1E6A08FA0;
  id v14 = v7;
  id v33 = v14;
  uint64_t v15 = objc_msgSend(v13, "na_map:", v32);

  id v16 = [v6 secureElementPass];
  uint64_t v17 = [v16 devicePrimaryPaymentApplication];
  uint64_t v18 = [v17 state];

  unint64_t v19 = [v6 homeKeyLiveRenderType] - 1;
  if (v19 > 3) {
    uint64_t v20 = *MEMORY[0x1E4F2D7D8];
  }
  else {
    uint64_t v20 = qword_1D54D38E8[v19];
  }
  uint64_t v21 = [v9 value];
  v22 = [(HMDHomeWalletKey *)self initWithTypeIdentifier:v31 serialNumber:v30 state:v18 walletKeyDescription:v8 homeName:v21 color:v20 nfcInfos:v15];

  int v23 = [v6 fieldForKey:@"arbitrary_supplementary_field_accessCode"];
  int v24 = [v10 link];

  if (v24)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
    v26 = [v10 link];
    int v24 = [v25 URLWithString:v26];
  }
  uint64_t v27 = [v23 value];
  [(HMDHomeWalletKey *)v22 setAccessCode:v27];

  [(HMDHomeWalletKey *)v22 setChangeAccessCodeHomeAppCustomURL:v24];
  v28 = [v6 passURL];
  [(HMDHomeWalletKey *)v22 setCustomURL:v28];

  return v22;
}

HMDHomeWalletKeySecureElementInfo *__40__HMDHomeWalletKey_initWithPKPass_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [[HMDHomeWalletKeySecureElementInfo alloc] initWithPaymentApplication:v3 flow:*(void *)(a1 + 32)];

  return v4;
}

@end