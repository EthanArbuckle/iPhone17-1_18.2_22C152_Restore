@interface HMDMultipleRemoteDeviceDestination
- (HMDMultipleRemoteDeviceDestination)init;
- (HMDMultipleRemoteDeviceDestination)initWithTarget:(id)a3 devices:(id)a4;
- (NSArray)devices;
- (id)allRemoteDestinationStrings;
- (id)remoteDestinationString;
- (id)remoteDestinationStringForDevice:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation HMDMultipleRemoteDeviceDestination

- (void).cxx_destruct
{
}

- (void)setDevices:(id)a3
{
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (id)allRemoteDestinationStrings
{
  devices = self->_devices;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDMultipleRemoteDeviceDestination_allRemoteDestinationStrings__block_invoke;
  v7[3] = &unk_264A23590;
  v7[4] = self;
  v3 = [(NSArray *)devices na_map:v7];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

id __65__HMDMultipleRemoteDeviceDestination_allRemoteDestinationStrings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) remoteDestinationStringForDevice:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Device is not addressable: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)remoteDestinationStringForDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 remoteDestinationString];
  id v5 = v4;
  if (v4 && ([v4 hasSuffix:@"inbox.appleid.apple.com"] & 1) == 0)
  {
    id v11 = v5;
  }
  else
  {
    id v6 = [v3 account];
    int v7 = [v6 isCurrentAccount];

    if (v7)
    {
      id v8 = [v3 localHandles];
      v9 = [v8 firstObject];

      if (v9)
      {
        v10 = [v9 destination];

        goto LABEL_9;
      }
    }
    id v11 = [v3 remoteDestinationString];
  }
  v10 = v11;
LABEL_9:

  return v10;
}

- (id)remoteDestinationString
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_FAULT, "%{public}@Cannot get remoteDestinationString for HMDMultipleRemoteDeviceDestination", (uint8_t *)&v8, 0xCu);
  }
  return 0;
}

- (HMDMultipleRemoteDeviceDestination)initWithTarget:(id)a3 devices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDMultipleRemoteDeviceDestination;
    int v8 = [(HMFMessageDestination *)&v13 initWithTarget:v6];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_devices, a4);
    }

    return v9;
  }
  else
  {
    id v11 = (HMDMultipleRemoteDeviceDestination *)_HMFPreconditionFailure();
    return [(HMDMultipleRemoteDeviceDestination *)v11 init];
  }
}

- (HMDMultipleRemoteDeviceDestination)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDMultipleRemoteDeviceDestination;
  v2 = [(HMDMultipleRemoteDeviceDestination *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    devices = v2->_devices;
    v2->_devices = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

@end