@interface HMDACWGUtilities
+ (id)createGroupResolvingKey;
+ (id)createIssuerKeyKeychainItemWithKeyPairExternalRepresentation:(id)a3;
+ (id)keyPairExternalRepresentationFromKeychainItem:(id)a3;
+ (id)keychainIdentifierForPublicKeyExternalRepresentation:(id)a3;
@end

@implementation HMDACWGUtilities

+ (id)keyPairExternalRepresentationFromKeychainItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 accessGroup];
  char v6 = [v5 isEqualToString:@"com.apple.hap.pairing"];

  if (v6)
  {
    v7 = [v4 type];
    char v8 = [v7 isEqualToNumber:&unk_26E471AA0];

    if (v8)
    {
      v9 = [v4 valueData];
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      v21 = (__CFString *)&unk_26E471AA0;
      v14 = "%{public}@Failed to create ACWG Issuer key from keychain item: %@ is not equal to: %@";
      goto LABEL_8;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v16 = 138543874;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      v21 = @"com.apple.hap.pairing";
      v14 = "%{public}@Failed to create ACWG Issuer key from keychain item: %@ access group is not equal to: %@";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x20u);
    }
  }

  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)createIssuerKeyKeychainItemWithKeyPairExternalRepresentation:(id)a3
{
  id v4 = a3;
  v5 = +[HMDNIST256Utilities publicKeyExternalRepresentationFromKeyPairExternalRepresentation:v4];
  id v6 = objc_alloc_init(MEMORY[0x263F35A10]);
  [v6 setLabel:@"Home ACWG Issuer Key"];
  [v6 setItemDescription:@"Per User ACWG Issuer Key synced to HomeKit locks to grant users access."];
  [v6 setAccessGroup:@"com.apple.hap.pairing"];
  [v6 setSyncable:1];
  [v6 setType:&unk_26E471AA0];
  v7 = (void *)MEMORY[0x263F35AD0];
  char v8 = [v6 type];
  v9 = [v7 viewHintForType:v8];
  [v6 setViewHint:v9];

  [v6 setValueData:v4];
  v10 = [MEMORY[0x263EFF910] date];
  [v6 setCreationDate:v10];

  id v11 = [a1 keychainIdentifierForPublicKeyExternalRepresentation:v5];
  [v6 setAccount:v11];

  return v6;
}

+ (id)keychainIdentifierForPublicKeyExternalRepresentation:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"B52DD235-5F79-4A54-91F1-07076C605ED8"];
  id v6 = objc_msgSend(MEMORY[0x263F08C38], "hmf_UUIDWithNamespace:data:", v5, v4);

  v7 = [v6 UUIDString];

  return v7;
}

+ (id)createGroupResolvingKey
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF990] dataWithLength:16];
  id v4 = (const __SecRandom *)*MEMORY[0x263F17510];
  size_t v5 = [v3 length];
  id v6 = v3;
  if (SecRandomCopyBytes(v4, v5, (void *)[v6 mutableBytes]))
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate random bytes for group resolving key", (uint8_t *)&v13, 0xCu);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = (void *)[v6 copy];
  }

  return v11;
}

@end