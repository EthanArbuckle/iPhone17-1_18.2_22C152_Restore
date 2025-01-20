@interface HMCameraClipCryptoUtilities
+ (id)secureRandomZeroingDataWithLength:(unint64_t)a3;
+ (id)zeroingDataFromData:(id)a3;
@end

@implementation HMCameraClipCryptoUtilities

+ (id)secureRandomZeroingDataWithLength:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = NSRandomData();
  id v6 = 0;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not generate random data of length %lu: %@", buf, 0x20u);
    }
  }

  return v5;
}

+ (id)zeroingDataFromData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  v7 = (void *)[v3 _newZeroingDataWithBytes:v5 length:v6];

  return v7;
}

@end