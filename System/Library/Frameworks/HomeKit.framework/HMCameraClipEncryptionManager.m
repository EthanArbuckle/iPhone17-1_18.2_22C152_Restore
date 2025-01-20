@interface HMCameraClipEncryptionManager
- (HMCameraClipEncryptionManager)init;
- (HMCameraClipEncryptionManager)initWithKey:(id)a3;
- (NSData)key;
- (id)encryptedDataContextFromData:(id)a3;
@end

@implementation HMCameraClipEncryptionManager

- (void).cxx_destruct
{
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)encryptedDataContextFromData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v4, "length"));
  v6 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  v7 = +[HMCameraClipCryptoUtilities secureRandomZeroingDataWithLength:16];
  v38 = v6;
  if (v7)
  {
    id v34 = [(HMCameraClipEncryptionManager *)self key];
    [v34 bytes];
    v33 = self;
    v8 = [(HMCameraClipEncryptionManager *)self key];
    [v8 length];
    v35 = v7;
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    id v37 = v4;
    id v10 = v4;
    [v10 bytes];
    uint64_t v11 = [v10 length];
    v36 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 mutableBytes];
    id v14 = v6;
    uint64_t v31 = [v14 mutableBytes];
    uint64_t v32 = [v14 length];
    uint64_t v30 = v13;
    int v15 = CCCryptorGCMOneshotEncrypt();

    if (v15)
    {
      v20 = (void *)MEMORY[0x19F3A64A0](v16, v17, v18, v19);
      v21 = v33;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v40 = v23;
        __int16 v41 = 2048;
        uint64_t v42 = objc_msgSend(v10, "length", v11, v30, v31, v32);
        __int16 v43 = 1024;
        int v44 = v15;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt %lu bytes: %d", buf, 0x1Cu);
      }
      v24 = 0;
    }
    else
    {
      v24 = -[HMCameraClipEncryptedDataContext initWithInitializationVector:ciphertext:tag:]([HMCameraClipEncryptedDataContext alloc], "initWithInitializationVector:ciphertext:tag:", v9, v12, v14, v11, v13, v31, v32);
    }
    v5 = v36;
    id v4 = v37;
    v7 = v35;
  }
  else
  {
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to generate initialization vector", buf, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (HMCameraClipEncryptionManager)initWithKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v6 = v5;
  if ([v5 length] != 32)
  {
LABEL_7:
    id v10 = (HMCameraClipEncryptionManager *)_HMFPreconditionFailure();
    return [(HMCameraClipEncryptionManager *)v10 init];
  }
  v12.receiver = self;
  v12.super_class = (Class)HMCameraClipEncryptionManager;
  v7 = [(HMCameraClipEncryptionManager *)&v12 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_key, a3);
  }

  return v8;
}

- (HMCameraClipEncryptionManager)init
{
  v3 = +[HMCameraClipCryptoUtilities secureRandomZeroingDataWithLength:32];
  id v4 = [(HMCameraClipEncryptionManager *)self initWithKey:v3];

  return v4;
}

@end