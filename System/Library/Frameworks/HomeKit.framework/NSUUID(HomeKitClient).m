@interface NSUUID(HomeKitClient)
+ (id)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient withSalts:;
+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:withSalts:;
+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient withSalts:;
+ (uint64_t)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient;
+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient;
+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:;
+ (uint64_t)hm_setAssistantIdentifierSalt:()HomeKitClient;
+ (void)hm_setIdentifierSalt:()HomeKitClient;
- (id)hm_convertToData;
@end

@implementation NSUUID(HomeKitClient)

+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient withSalts:
{
  v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a4;
  id v7 = a3;
  v8 = sharedIdentifierSaltStore();
  v9 = [v8 identifierSalt];
  v10 = objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v7, v9, v6);

  return v10;
}

+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:withSalts:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:salts:", v8, v9, v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = a1;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_FAULT, "%{public}@API Misuse: requested to derive UUID from nil base UUID. Call stack: %@", (uint8_t *)&v18, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient
{
  return objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:withSalts:", a3, 0);
}

+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:
{
  return objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", a3, a4, 0);
}

+ (void)hm_setIdentifierSalt:()HomeKitClient
{
  id v3 = a3;
  sharedIdentifierSaltStore();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setIdentifierSalt:v3];
}

- (id)hm_convertToData
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

+ (uint64_t)hm_setAssistantIdentifierSalt:()HomeKitClient
{
  id v3 = a3;
  id v4 = sharedIdentifierSaltStore();
  v5 = [v4 assistantIdentifierSalt];

  id v6 = sharedIdentifierSaltStore();
  id v7 = (void *)[v3 copy];
  [v6 setAssistantIdentifierSalt:v7];

  LODWORD(v6) = HMFEqualObjects();
  return v6 ^ 1;
}

+ (uint64_t)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient
{
  return objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDForAssistantFromBaseUUID:withSalts:", a3, 0);
}

+ (id)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient withSalts:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sharedIdentifierSaltStore();
  id v8 = [v7 assistantIdentifierSalt];

  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, v8, v6);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end