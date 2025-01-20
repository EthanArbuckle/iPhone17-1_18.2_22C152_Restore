@interface HMDSharingDeviceDiscovery
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceDiscovery)deviceDiscovery;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (unint64_t)discoveryFlags;
- (void)dealloc;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceDiscovery:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDSharingDeviceDiscovery

- (void).cxx_destruct
{
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E4F9F688];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HMDSharingDeviceDiscovery_repairDevice_flags_completion___block_invoke;
  v13[3] = &unk_1E6A17D78;
  id v14 = v10;
  id v15 = v7;
  id v11 = v10;
  id v12 = v7;
  [v11 repairDevice:v9 flags:v5 completion:v13];
}

uint64_t __59__HMDSharingDeviceDiscovery_repairDevice_flags_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

- (void)stop
{
  v3 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v3 invalidate];

  [(HMDSharingDeviceDiscovery *)self setDeviceDiscovery:0];
}

- (void)start
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v2 activateWithCompletion:&__block_literal_global_74356];
}

void __34__HMDSharingDeviceDiscovery_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = (void *)MEMORY[0x1D9452090]();
  v4 = HMFGetOSLogHandle();
  uint64_t v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v2;
      id v7 = "%{public}@Failed to activate SFDeviceDiscovery with error %@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v6;
    id v7 = "%{public}@Successfully activated SFDeviceDiscovery.";
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)setDeviceLostHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v5 setDeviceLostHandler:v4];
}

- (id)deviceLostHandler
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  v3 = [v2 deviceLostHandler];

  return v3;
}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v5 setDeviceChangedHandler:v4];
}

- (id)deviceChangedHandler
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  v3 = [v2 deviceChangedHandler];

  return v3;
}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v5 setDeviceFoundHandler:v4];
}

- (id)deviceFoundHandler
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  v3 = [v2 deviceFoundHandler];

  return v3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint32_t v10 = v7;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting device discovery flags to %ld", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v8 setDiscoveryFlags:a3];
}

- (unint64_t)discoveryFlags
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  unint64_t v3 = [v2 discoveryFlags];

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  [v5 setDispatchQueue:v4];
}

- (OS_dispatch_queue)dispatchQueue
{
  id v2 = [(HMDSharingDeviceDiscovery *)self deviceDiscovery];
  unint64_t v3 = [v2 dispatchQueue];

  return (OS_dispatch_queue *)v3;
}

- (SFDeviceDiscovery)deviceDiscovery
{
  deviceDiscovery = self->_deviceDiscovery;
  if (!deviceDiscovery)
  {
    id v4 = (SFDeviceDiscovery *)objc_alloc_init(MEMORY[0x1E4F9F6E8]);
    id v5 = self->_deviceDiscovery;
    self->_deviceDiscovery = v4;

    deviceDiscovery = self->_deviceDiscovery;
  }
  return deviceDiscovery;
}

- (void)dealloc
{
  [(HMDSharingDeviceDiscovery *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)HMDSharingDeviceDiscovery;
  [(HMDSharingDeviceDiscovery *)&v3 dealloc];
}

@end