@interface HMDIDSProxyMessageTransport
+ (BOOL)transportSupportsDevice:(id)a3;
+ (id)logCategory;
+ (int64_t)priorityForMessage:(id)a3;
+ (unint64_t)restriction;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)isDeviceConnected:(id)a3;
- (BOOL)isSecure;
- (HMDCompanionManager)companionManager;
- (HMDIDSProxyMessageTransport)initWithAccountRegistry:(id)a3;
- (HMDWatchManager)watchManager;
- (id)deviceForHandle:(id)a3;
- (id)deviceForSenderContext:(id)a3;
- (id)remoteMessageFromMessage:(id)a3;
- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10;
- (id)watchDeviceForDevice:(id)a3;
- (int)transportType;
- (int64_t)qualityOfService;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation HMDIDSProxyMessageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionManager, 0);
  objc_storeStrong((id *)&self->_watchManager, 0);
}

- (HMDCompanionManager)companionManager
{
  return self->_companionManager;
}

- (HMDWatchManager)watchManager
{
  return self->_watchManager;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15) {
    goto LABEL_7;
  }
  v17 = +[HMDDeviceHandle deviceHandleForDestination:v15];
  if (!v17)
  {
LABEL_6:

LABEL_7:
    v22.receiver = self;
    v22.super_class = (Class)HMDIDSProxyMessageTransport;
    [(HMDIDSMessageTransport *)&v22 service:v12 account:v13 incomingMessage:v14 fromID:v15 context:v16];
    goto LABEL_8;
  }
  v18 = [(HMDIDSProxyMessageTransport *)self deviceForHandle:v17];
  if (!v18 || ([(id)objc_opt_class() transportSupportsDevice:v18] & 1) != 0)
  {

    goto LABEL_6;
  }
  v19 = (void *)MEMORY[0x230FBD990]();
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v24 = v21;
    __int16 v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Dropping incoming message from unsupported device: %@", buf, 0x16u);
  }

LABEL_8:
}

- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10
{
  if (a6 != 100 && a7 == 0.0) {
    a7 = 180.0;
  }
  v12.receiver = self;
  v12.super_class = (Class)HMDIDSProxyMessageTransport;
  v10 = -[HMDIDSMessageTransport sendMessage:fromHandle:destination:priority:timeout:options:queueOneID:error:](&v12, sel_sendMessage_fromHandle_destination_priority_timeout_options_queueOneID_error_, a3, 0, a5, a7, a10);
  return v10;
}

- (BOOL)isDeviceConnected:(id)a3
{
  id v4 = a3;
  v5 = [(HMDIDSMessageTransport *)self service];
  v6 = [v4 deviceForIDSService:v5];

  LOBYTE(v4) = [v6 isConnected];
  return (char)v4;
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7 || ([v4 restriction] & 4) == 0)
  {
LABEL_15:
    char v12 = 0;
    goto LABEL_16;
  }
  v8 = [v7 device];
  BOOL v9 = [(HMDIDSProxyMessageTransport *)self isDeviceConnected:v8];

  if (!v9)
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v7 device];
      int v22 = 138543618;
      v23 = v19;
      __int16 v24 = 2112;
      __int16 v25 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message, the device, %@, is not currently connected", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_15;
  }
  v10 = [v7 device];
  v11 = [(HMDIDSProxyMessageTransport *)self watchDeviceForDevice:v10];

  char v12 = [(id)objc_opt_class() transportSupportsDevice:v11];
  if ((v12 & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v7 device];
      int v22 = 138543618;
      v23 = v15;
      __int16 v24 = 2112;
      __int16 v25 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message, the device, %@, is not supported", (uint8_t *)&v22, 0x16u);
    }
  }

LABEL_16:
  return v12;
}

- (int)transportType
{
  return 4;
}

- (id)watchDeviceForDevice:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDIDSProxyMessageTransport *)self companionManager];

  if (!v5)
  {
    v11 = [(HMDIDSProxyMessageTransport *)self watchManager];

    if (v11)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      char v12 = [(HMDIDSProxyMessageTransport *)self watchManager];
      BOOL v9 = [v12 watches];

      uint64_t v13 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v9);
            }
            v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ([v17 isRelatedToDevice:v4])
            {
              id v10 = v17;
              goto LABEL_16;
            }
          }
          uint64_t v14 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_14;
  }
  v6 = [(HMDIDSProxyMessageTransport *)self companionManager];
  id v7 = [v6 companion];
  int v8 = [v7 isRelatedToDevice:v4];

  if (!v8)
  {
LABEL_14:
    id v18 = v4;
    goto LABEL_17;
  }
  BOOL v9 = [(HMDIDSProxyMessageTransport *)self companionManager];
  id v10 = [v9 companion];
LABEL_16:
  id v18 = v10;

LABEL_17:
  return v18;
}

- (id)deviceForHandle:(id)a3
{
  id v4 = +[HMDDevice deviceWithHandle:a3];
  v5 = [(HMDIDSProxyMessageTransport *)self watchDeviceForDevice:v4];

  return v5;
}

- (id)deviceForSenderContext:(id)a3
{
  id v4 = [a3 deviceHandle];
  v5 = [(HMDIDSProxyMessageTransport *)self deviceForHandle:v4];

  return v5;
}

- (id)remoteMessageFromMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "remoteMessageFromMessage:secure:accountRegistry:", v4, -[HMDIDSProxyMessageTransport isSecure](self, "isSecure"), 0);
  v6 = [v4 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    BOOL v9 = [v8 device];
    id v10 = [(HMDIDSProxyMessageTransport *)self watchDeviceForDevice:v9];

    if (v10)
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      char v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v8 device];
        int v19 = 138543874;
        long long v20 = v13;
        __int16 v21 = 2112;
        long long v22 = v14;
        __int16 v23 = 2112;
        __int16 v24 = v10;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", (uint8_t *)&v19, 0x20u);
      }
      uint64_t v15 = [HMDRemoteDeviceMessageDestination alloc];
      id v16 = [v8 target];
      v17 = [(HMDRemoteDeviceMessageDestination *)v15 initWithTarget:v16 device:v10];

      [v5 setDestination:v17];
    }
  }
  return v5;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (BOOL)isSecure
{
  return 1;
}

- (HMDIDSProxyMessageTransport)initWithAccountRegistry:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[HMDIDSServiceManager sharedManager];
  v6 = [v5 proxyService];

  if (v6)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDIDSProxyMessageTransport;
    id v7 = [(HMDIDSMessageTransport *)&v19 initWithAccountRegistry:v4];
    id v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->super._service, v6);
      if (+[HMDDeviceCapabilities isCompanionCapable])
      {
        uint64_t v9 = +[HMDWatchManager sharedManager];
        uint64_t v10 = 176;
LABEL_10:
        v17 = *(Class *)((char *)&v8->super.super.super.super.super.isa + v10);
        *(Class *)((char *)&v8->super.super.super.super.super.isa + v10) = (Class)v9;

        goto LABEL_11;
      }
      uint64_t v15 = [MEMORY[0x263F42620] productInfo];
      uint64_t v16 = [v15 productPlatform];

      if (v16 == 3)
      {
        uint64_t v9 = +[HMDCompanionManager sharedManager];
        uint64_t v10 = 184;
        goto LABEL_10;
      }
    }
LABEL_11:
    self = v8;
    uint64_t v14 = self;
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x230FBD990]();
  char v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v21 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@A proxy service is required", buf, 0xCu);
  }
  uint64_t v14 = 0;
LABEL_12:

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_249690 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_249690, &__block_literal_global_249691);
  }
  v2 = (void *)logCategory__hmf_once_v4_249692;
  return v2;
}

void __42__HMDIDSProxyMessageTransport_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_249692;
  logCategory__hmf_once_v4_249692 = v0;
}

+ (BOOL)transportSupportsDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 version];
  if (v4)
  {
    v5 = [v3 version];
    v6 = [[HMDHomeKitVersion alloc] initWithVersionString:@"3.0"];
    char v7 = [v5 isAtLeastVersion:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (int64_t)priorityForMessage:(id)a3
{
  uint64_t v3 = [a3 qualityOfService];
  switch(v3)
  {
    case 17:
      return 200;
    case 9:
      return 100;
    case -1:
      return 200;
  }
  return 300;
}

+ (unint64_t)restriction
{
  return 4;
}

@end