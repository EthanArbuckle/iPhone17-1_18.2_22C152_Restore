@interface HMDHomeNFCReaderKey
+ (BOOL)supportsSecureCoding;
+ (id)createRandomKey;
+ (id)createWithDictionaryRepresentation:(id)a3;
+ (id)createWithExternalRepresentation:(id)a3;
+ (id)createWithKeychainItem:(id)a3;
+ (id)identifierForKey:(id)a3;
+ (id)keychainItemAccountAttributeValueWithHome:(id)a3 keyIdentifier:(id)a4;
+ (id)publicKeyWithPublicKeyExternalRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDHomeNFCReaderKey)initWithCoder:(id)a3;
- (HMDHomeNFCReaderKey)initWithIdentifier:(id)a3 privateKey:(id)a4 publicKeyExternalRepresentation:(id)a5;
- (NSData)externalRepresentation;
- (NSData)identifier;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSData)publicKeyExternalRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (id)attributeDescriptions;
- (id)createKeychainItemForHome:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDHomeNFCReaderKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKeyExternalRepresentation, 0);
}

- (NSData)identifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)privateKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)publicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDHomeNFCReaderKey *)self identifier];
  v5 = objc_msgSend(v4, "hmf_hexadecimalRepresentation");
  v6 = (void *)[v3 initWithName:@"Identifier" value:v5];
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDHomeNFCReaderKey *)self privateKey];
  v9 = HMFBooleanToString();
  v10 = (void *)[v7 initWithName:@"Has Private Key" value:v9];
  v17[1] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
  v13 = objc_msgSend(v12, "hmf_hexadecimalRepresentation");
  v14 = (void *)[v11 initWithName:@"Public Key External Representation" value:v13];
  v17[2] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomeNFCReaderKey *)self identifier];
  [v4 encodeObject:v5 forKey:@"HMDHomeNFCReaderIdentifierCodingKey"];

  id v6 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
  [v4 encodeObject:v6 forKey:@"HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey"];
}

- (HMDHomeNFCReaderKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDHomeNFCReaderIdentifierCodingKey"];
    if (v6)
    {
      self = [(HMDHomeNFCReaderKey *)self initWithIdentifier:v6 privateKey:0 publicKeyExternalRepresentation:v5];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDHomeNFCReaderKey *)self privateKey];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMDHomeNFCReaderKey *)self identifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
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
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 publicKeyExternalRepresentation];
    v9 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
    if ([v8 isEqual:v9]
      && ([v7 privateKey],
          v10 = objc_claimAutoreleasedReturnValue(),
          [(HMDHomeNFCReaderKey *)self privateKey],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = HMFEqualObjects(),
          v11,
          v10,
          v12))
    {
      v13 = [v7 identifier];
      v14 = [(HMDHomeNFCReaderKey *)self identifier];
      char v15 = [v13 isEqualToData:v14];
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"HMDHomeNFCReaderIdentifierCodingKey";
  id v3 = [(HMDHomeNFCReaderKey *)self identifier];
  v7[1] = @"HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey";
  v8[0] = v3;
  id v4 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSData)externalRepresentation
{
  id v3 = [(HMDHomeNFCReaderKey *)self privateKey];
  if (v3)
  {
    id v4 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
    v5 = (void *)[v4 mutableCopy];

    [v5 appendData:v3];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }

  return (NSData *)v6;
}

- (NSData)publicKey
{
  v2 = [(HMDHomeNFCReaderKey *)self publicKeyExternalRepresentation];
  id v3 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v2];

  return (NSData *)v3;
}

- (HMDHomeNFCReaderKey)initWithIdentifier:(id)a3 privateKey:(id)a4 publicKeyExternalRepresentation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHomeNFCReaderKey;
  int v12 = [(HMDHomeNFCReaderKey *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    uint64_t v14 = [v10 copy];
    privateKey = v13->_privateKey;
    v13->_privateKey = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    publicKeyExternalRepresentation = v13->_publicKeyExternalRepresentation;
    v13->_publicKeyExternalRepresentation = (NSData *)v16;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)publicKeyWithPublicKeyExternalRepresentation:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 1, 64);
}

+ (id)identifierForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&v8, 0, sizeof(v8));
  id v3 = a3;
  CC_SHA256_Init(&v8);
  id v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(void *)&v8.wbuf[14]);
  [v4 appendData:v3];

  id v5 = v4;
  CC_SHA256_Update(&v8, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:8];

  return v6;
}

+ (id)createWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "hmf_dataForKey:", @"HMDHomeNFCReaderIdentifierCodingKey");
  if (v4)
  {
    id v5 = objc_msgSend(v3, "hmf_dataForKey:", @"HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey");
    if (v5) {
      id v6 = [[HMDHomeNFCReaderKey alloc] initWithIdentifier:v4 privateKey:0 publicKeyExternalRepresentation:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)createWithExternalRepresentation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length] == 97)
  {
    id v4 = objc_msgSend(v3, "subdataWithRange:", 0, 65);
    id v5 = objc_msgSend(v3, "subdataWithRange:", 65, 32);
    id v6 = +[HMDHomeNFCReaderKey identifierForKey:v5];
    id v7 = [[HMDHomeNFCReaderKey alloc] initWithIdentifier:v6 privateKey:v5 publicKeyExternalRepresentation:v4];
  }
  else
  {
    CC_SHA256_CTX v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v3 length];
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nfc reader key external representation length %lu", (uint8_t *)&v12, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)createRandomKey
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F16FB8];
  uint64_t v3 = *MEMORY[0x263F16F98];
  v23[0] = *MEMORY[0x263F16FA8];
  v23[1] = v3;
  v24[0] = v2;
  v24[1] = &unk_26E4715A8;
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  CFErrorRef error = 0;
  id v5 = SecKeyCreateRandomKey(v4, &error);
  id v6 = v5;
  CFErrorRef v7 = error;
  if (v5)
  {
    CFDataRef v8 = SecKeyCopyExternalRepresentation(v5, &error);
    CFErrorRef v9 = error;

    if (v8)
    {
      uint64_t v10 = +[HMDHomeNFCReaderKey createWithExternalRepresentation:v8];
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x230FBD990]();
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        __int16 v21 = 2112;
        CFErrorRef v22 = v9;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy nfc reader key external representation: %@", buf, 0x16u);
      }
      uint64_t v10 = 0;
    }

    CFErrorRef v7 = v9;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      CFErrorRef v22 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create nfc reader key: %@", buf, 0x16u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)createKeychainItemForHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKey *)self externalRepresentation];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F35A10]);
    [v6 setLabel:@"Home NFC Reader Key"];
    [v6 setItemDescription:@"Per Home NFC Reader Key synced to HomeKit locks to protect device privacy over NFC transaction."];
    [v6 setAccessGroup:@"com.apple.hap.pairing"];
    [v6 setSyncable:1];
    [v6 setType:&unk_26E472328];
    CFErrorRef v7 = (void *)MEMORY[0x263F35AD0];
    CFDataRef v8 = [v6 type];
    CFErrorRef v9 = [v7 viewHintForType:v8];
    [v6 setViewHint:v9];

    [v6 setValueData:v5];
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    [v6 setCreationDate:v10];

    id v11 = objc_opt_class();
    int v12 = [(HMDHomeNFCReaderKey *)self identifier];
    v13 = [v11 keychainItemAccountAttributeValueWithHome:v4 keyIdentifier:v12];
    [v6 setAccount:v13];
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keychain item for home: %@ from: %@, external representation is nil", (uint8_t *)&v19, 0x20u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)createWithKeychainItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 accessGroup];
  char v6 = [v5 isEqualToString:@"com.apple.hap.pairing"];

  if (v6)
  {
    CFErrorRef v7 = [v4 type];
    char v8 = [v7 isEqualToNumber:&unk_26E472328];

    if (v8)
    {
      CFErrorRef v9 = [v4 valueData];
      uint64_t v10 = +[HMDHomeNFCReaderKey createWithExternalRepresentation:v9];

      goto LABEL_10;
    }
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = (__CFString *)&unk_26E472328;
      uint64_t v15 = "%{public}@Failed to create nfc reader key from keychain item: %@ is not equal to: %@";
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = @"com.apple.hap.pairing";
      uint64_t v15 = "%{public}@Failed to create nfc reader key from keychain item: %@ access group is not equal to: %@";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x20u);
    }
  }

  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

+ (id)keychainItemAccountAttributeValueWithHome:(id)a3 keyIdentifier:(id)a4
{
  id v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a4;
  CFErrorRef v7 = [a3 uuid];
  char v8 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v7, v6);

  CFErrorRef v9 = [v8 UUIDString];

  return v9;
}

@end