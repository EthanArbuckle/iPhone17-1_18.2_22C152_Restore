@interface HMDIDSSendMessageOperation
+ (double)timeout;
+ (id)logCategory;
+ (id)shortDescription;
- (HMDIDSSendMessageOperation)initWithMessage:(id)a3;
- (HMDIDSSendMessageOperation)initWithMessage:(id)a3 service:(id)a4;
- (HMDIDSService)service;
- (HMFMessage)message;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)privateDescription;
- (NSString)shortDescription;
- (id)logIdentifier;
- (void)main;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
@end

@implementation HMDIDSSendMessageOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 344, 1);
}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 336, 1);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([(HMFOperation *)self isExecuting]
    && [(NSString *)self->_messageIdentifier isEqualToString:v16])
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    v22 = v21;
    if (v10)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message", (uint8_t *)&v28, 0xCu);
      }
      [(HMFOperation *)v20 finish];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24 = HMFGetLogIdentifier();
        int v28 = 138543618;
        v29 = v24;
        __int16 v30 = 2112;
        id v31 = v17;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message with error: %@", (uint8_t *)&v28, 0x16u);
      }
      v25 = (void *)MEMORY[0x263F087E8];
      v26 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203 underlyingError:v17];
      v27 = [v25 hmErrorWithCode:54 description:0 reason:0 suggestion:0 underlyingError:v26];

      [(HMFOperation *)v20 cancelWithError:v27];
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMFMessage *)self->_message identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)main
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
  }
  v7 = [(HMDIDSSendMessageOperation *)v4 message];
  v8 = [(HMDIDSSendMessageOperation *)v4 message];
  uint64_t v9 = [v8 isSecureRemote];
  BOOL v10 = +[HMDAccountRegistry sharedRegistry];
  v11 = +[HMDRemoteMessageTransport remoteMessageFromMessage:v7 secure:v9 accountRegistry:v10];

  [v11 setResponseRestriction:1];
  id v50 = 0;
  v12 = +[HMDRemoteMessageSerialization dictionaryForMessage:v11 isHH2Payload:1 error:&v50];
  v13 = (HMDRemoteMessageDestination *)v50;
  id v14 = v13;
  if (v12)
  {

    uint64_t v51 = *MEMORY[0x263F49F80];
    id v15 = [NSNumber numberWithDouble:v4->_timeout];
    v52 = v15;
    id v14 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];

    id v16 = +[HMDRemoteDestinationFormatter defaultFormatter];
    id v17 = [v16 stringForObjectValue:v4->_destination];

    if (v17)
    {
      service = v4->_service;
      v19 = [MEMORY[0x263EFFA08] setWithObject:v17];
      id v48 = 0;
      id v49 = 0;
      char v20 = [(HMDIDSService *)service sendMessage:v12 toDestinations:v19 priority:300 options:v14 identifier:&v49 error:&v48];
      v21 = (HMDRemoteMessageDestination *)v49;
      v22 = (HMDRemoteMessageDestination *)v48;

      if (v20)
      {
        v23 = +[HMDMetricsManager sharedLogEventSubmitter];
        v24 = +[HMDRemoteMessageLogEvent sentRemoteMessage:v11 transportType:2];
        [v23 submitLogEvent:v24];

        v25 = (void *)MEMORY[0x230FBD990]();
        v26 = v4;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v28;
          __int16 v55 = 2112;
          v56 = v21;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Sent message with identifier: %@", buf, 0x16u);
        }
        v29 = v21;
        messageIdentifier = v26->_messageIdentifier;
        v26->_messageIdentifier = v29;
      }
      else
      {
        v42 = (void *)MEMORY[0x230FBD990]();
        v43 = v4;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v45;
          __int16 v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);
        }
        v46 = (void *)MEMORY[0x263F087E8];
        v47 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203 underlyingError:v22];
        messageIdentifier = [v46 hmErrorWithCode:54 description:0 reason:0 suggestion:0 underlyingError:v47];

        [(HMFOperation *)v43 cancelWithError:messageIdentifier];
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x230FBD990]();
      v36 = v4;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = HMFGetLogIdentifier();
        destination = v4->_destination;
        *(_DWORD *)buf = 138543618;
        v54 = v38;
        __int16 v55 = 2112;
        v56 = destination;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate destination for: %@", buf, 0x16u);
      }
      v40 = (void *)MEMORY[0x263F087E8];
      v41 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3203];
      v22 = [v40 hmErrorWithCode:54 description:0 reason:@"Failed to generate destination." suggestion:0 underlyingError:v41];

      [(HMFOperation *)v36 cancelWithError:v22];
    }
  }
  else
  {
    id v31 = (void *)MEMORY[0x230FBD990]();
    uint64_t v32 = v4;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v54 = v34;
      __int16 v55 = 2112;
      v56 = v14;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message with error: %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:0 reason:0 suggestion:0 underlyingError:v14];
    [(HMFOperation *)v32 cancelWithError:v17];
  }
}

- (NSArray)attributeDescriptions
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F424F8]) initWithName:@"Message" value:self->_message options:1 formatter:0];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSString)privateDescription
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDIDSSendMessageOperation *)self message];
  v6 = [v5 privateDescription];
  v7 = [v3 stringWithFormat:@"%@, Message = %@", v4, v6];

  return (NSString *)v7;
}

- (NSString)shortDescription
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDIDSSendMessageOperation *)self message];
  v6 = [v5 identifier];
  v7 = [v3 stringWithFormat:@"%@, Message = %@", v4, v6];

  return (NSString *)v7;
}

- (HMDIDSSendMessageOperation)initWithMessage:(id)a3 service:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = HMFGetLogIdentifier();
      v29 = [v7 destination];
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid message destination: %@", buf, 0x16u);

LABEL_16:
    }
LABEL_17:

    v25 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Invalid service", buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v11 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  [(__objc2_class *)v13 timeout];
  if (v14 <= 0.0) {
    id v15 = HMDIDSSendMessageOperation;
  }
  else {
    id v15 = v13;
  }
  [(__objc2_class *)v15 timeout];
  double v17 = v16;
  v31.receiver = self;
  v31.super_class = (Class)HMDIDSSendMessageOperation;
  id v18 = [(HMFOperation *)&v31 initWithTimeout:sel_initWithTimeout_];
  v19 = v18;
  if (v18)
  {
    v18->_timeout = v17;
    objc_storeStrong((id *)&v18->_message, a3);
    uint64_t v20 = [v11 destination];
    destination = v19->_destination;
    v19->_destination = (HMDRemoteMessageDestination *)v20;

    objc_storeStrong((id *)&v19->_service, a4);
    service = v19->_service;
    v23 = [(HMFOperation *)v19 underlyingQueue];
    [(HMDIDSService *)service addDelegate:v19 queue:v23];
  }
  v24 = v19;

  v25 = v24;
LABEL_18:

  return v25;
}

- (HMDIDSSendMessageOperation)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = +[HMDIDSServiceManager sharedManager];
  v6 = [v5 service];
  id v7 = [(HMDIDSSendMessageOperation *)self initWithMessage:v4 service:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_64008 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_64008, &__block_literal_global_64009);
  }
  v2 = (void *)logCategory__hmf_once_v9_64010;
  return v2;
}

void __41__HMDIDSSendMessageOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_64010;
  logCategory__hmf_once_v9_64010 = v0;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)timeout
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"defaultIDSMessageTimeout"];

  id v4 = [v3 numberValue];

  if (v4)
  {
    v5 = [v3 numberValue];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 65.0;
  }

  return v7;
}

@end