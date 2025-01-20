@interface HMFMACAddress
- (HMFMACAddress)initWithAddressData:(id)a3;
- (HMFMACAddress)initWithAddressString:(id)a3 length:(unint64_t)a4;
- (HMFMACAddress)initWithMACAddressString:(id)a3;
@end

@implementation HMFMACAddress

- (HMFMACAddress)initWithMACAddressString:(id)a3
{
  return [(HMFMACAddress *)self initWithAddressString:a3 length:6];
}

- (HMFMACAddress)initWithAddressString:(id)a3 length:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 6)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMFMACAddress;
    v7 = [(HMFHardwareAddress *)&v12 initWithAddressString:v6 length:6];
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A87A0]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create MAC address with string of invalid length: %lu", buf, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

- (HMFMACAddress)initWithAddressData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length] == 6)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMFMACAddress;
    v5 = [(HMFHardwareAddress *)&v10 initWithAddressData:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A87A0]();
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      objc_super v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to create MAC address with data of invalid length: %@", buf, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end