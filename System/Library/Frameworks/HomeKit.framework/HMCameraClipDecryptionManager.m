@interface HMCameraClipDecryptionManager
- (HMCameraClipDecryptionManager)initWithKey:(id)a3;
- (NSData)key;
- (id)dataFromEncryptedDataContext:(id)a3;
@end

@implementation HMCameraClipDecryptionManager

- (void).cxx_destruct
{
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)dataFromEncryptedDataContext:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA58];
  v6 = [v4 ciphertext];
  v7 = objc_msgSend(v5, "dataWithLength:", objc_msgSend(v6, "length"));

  id v37 = [(HMCameraClipDecryptionManager *)self key];
  [v37 bytes];
  v34 = self;
  v36 = [(HMCameraClipDecryptionManager *)self key];
  [v36 length];
  id v35 = [v4 initializationVector];
  [v35 bytes];
  v8 = [v4 initializationVector];
  [v8 length];
  id v9 = [v4 ciphertext];
  [v9 bytes];
  v10 = [v4 ciphertext];
  uint64_t v11 = [v10 length];
  id v12 = v7;
  uint64_t v13 = [v12 mutableBytes];
  id v14 = [v4 tag];
  uint64_t v15 = [v14 bytes];
  v16 = [v4 tag];
  uint64_t v32 = v15;
  uint64_t v33 = [v16 length];
  uint64_t v30 = v11;
  uint64_t v31 = v13;
  int v17 = CCCryptorGCMOneshotDecrypt();

  if (v17)
  {
    v22 = v12;
    v23 = (void *)MEMORY[0x19F3A64A0](v18, v19, v20, v21);
    v24 = v34;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = objc_msgSend(v4, "ciphertext", v30, v31, v32, v33);
      *(_DWORD *)buf = 138543874;
      v39 = v26;
      __int16 v40 = 2048;
      uint64_t v41 = [v27 length];
      __int16 v42 = 1024;
      int v43 = v17;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt %lu bytes: %d", buf, 0x1Cu);
    }
    v28 = 0;
  }
  else
  {
    v28 = objc_msgSend(v12, "copy", v11, v31, v15, v33);
    v22 = v12;
  }

  return v28;
}

- (HMCameraClipDecryptionManager)initWithKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)HMCameraClipDecryptionManager;
    v6 = [(HMCameraClipDecryptionManager *)&v12 init];
    if (v6)
    {
      uint64_t v7 = +[HMCameraClipCryptoUtilities zeroingDataFromData:v5];
      key = v6->_key;
      v6->_key = (NSData *)v7;
    }
    return v6;
  }
  else
  {
    v10 = (HMObjectMergeCollection *)_HMFPreconditionFailure();
    [(HMObjectMergeCollection *)v10 .cxx_destruct];
  }
  return result;
}

@end