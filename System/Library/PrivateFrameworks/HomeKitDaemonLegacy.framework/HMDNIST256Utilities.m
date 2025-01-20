@interface HMDNIST256Utilities
+ (id)createNIST256KeyPair;
+ (id)identifier16BytesForKey:(id)a3;
+ (id)identifier8BytesForKey:(id)a3;
+ (id)privateKeyFromKeyPairExternalRepresentation:(id)a3;
+ (id)publicKeyExternalRepresentationFromKeyPairExternalRepresentation:(id)a3;
+ (id)publicKeyFromKeyPairExternalRepresentation:(id)a3;
@end

@implementation HMDNIST256Utilities

+ (id)identifier8BytesForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, sizeof(v8));
  id v3 = a3;
  CC_SHA256_Init(&v8);
  v4 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(void *)&v8.wbuf[14]);
  [v4 appendData:v3];

  id v5 = v4;
  CC_SHA256_Update(&v8, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:8];

  return v6;
}

+ (id)identifier16BytesForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, sizeof(v8));
  id v3 = a3;
  CC_SHA256_Init(&v8);
  v4 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(void *)&v8.wbuf[14]);
  [v4 appendData:v3];

  id v5 = v4;
  CC_SHA256_Update(&v8, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

  return v6;
}

+ (id)privateKeyFromKeyPairExternalRepresentation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] == 97)
  {
    v4 = objc_msgSend(v3, "subdataWithRange:", 65, 32);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 length];
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)publicKeyFromKeyPairExternalRepresentation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] == 97)
  {
    v4 = objc_msgSend(v3, "subdataWithRange:", 1, 64);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 length];
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)publicKeyExternalRepresentationFromKeyPairExternalRepresentation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] == 97)
  {
    v4 = objc_msgSend(v3, "subdataWithRange:", 0, 65);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = [v3 length];
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)createNIST256KeyPair
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3B740];
  uint64_t v3 = *MEMORY[0x1E4F3B708];
  v23[0] = *MEMORY[0x1E4F3B718];
  v23[1] = v3;
  v24[0] = v2;
  v24[1] = &unk_1F2DC9100;
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  CFErrorRef error = 0;
  id v5 = SecKeyCreateRandomKey(v4, &error);
  v6 = v5;
  CFErrorRef v7 = error;
  if (v5)
  {
    CFDataRef v8 = SecKeyCopyExternalRepresentation(v5, &error);
    CFErrorRef v9 = error;

    if (v8)
    {
      CFDataRef v10 = v8;
    }
    else
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        __int16 v21 = 2112;
        CFErrorRef v22 = v9;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy NIST256 key external representation: %@", buf, 0x16u);
      }
    }

    CFErrorRef v7 = v9;
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      CFErrorRef v22 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create NIST256 key: %@", buf, 0x16u);
    }
    CFDataRef v8 = 0;
  }

  return v8;
}

@end