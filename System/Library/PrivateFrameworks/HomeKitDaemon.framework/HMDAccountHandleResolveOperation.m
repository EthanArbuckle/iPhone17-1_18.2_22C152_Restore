@interface HMDAccountHandleResolveOperation
+ (double)timeout;
+ (id)logCategory;
- (HMDAccountHandle)handle;
- (HMDAccountHandleResolveOperation)init;
- (HMDAccountHandleResolveOperation)initWithHandle:(id)a3;
- (HMDAccountHandleResolveOperation)initWithQualityOfService:(int64_t)a3 timeout:(double)a4;
- (HMDAccountHandleResolveOperation)initWithTimeout:(double)a3;
- (HMDIDSMessageContext)messageContext;
- (HMDIDSService)service;
- (NSMutableArray)resolveBlocks;
- (id)logIdentifier;
- (void)addResolveBlock:(id)a3;
- (void)main;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMessageContext:(id)a3;
@end

@implementation HMDAccountHandleResolveOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveBlocks, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSMutableArray)resolveBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMessageContext:(id)a3
{
}

- (HMDIDSMessageContext)messageContext
{
  return self->_messageContext;
}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 320, 1);
}

- (HMDAccountHandle)handle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 312, 1);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(HMFOperation *)self isExecuting])
  {
    v17 = [v14 objectForKeyedSubscript:@"kIDSMessageNameKey"];
    if ([v17 isEqualToString:@"kPingInternalRequestKey"])
    {
      v18 = [(HMDAccountHandleResolveOperation *)self messageContext];
      v19 = [v18 userInfo];
      uint64_t v20 = objc_msgSend(v19, "hmf_UUIDForKey:", @"transactionID");

      v21 = objc_msgSend(v14, "hmf_UUIDForKey:", @"kIDSMessageRequestTransactionIDKey");
      v52 = (void *)v20;
      if (objc_msgSend(v21, "hmf_isEqualToUUID:", v20))
      {
        v50 = +[HMDDeviceHandle deviceHandleForDestination:v15];
        uint64_t v22 = +[HMDAccountHandle accountHandleForDestination:v15];
        v49 = (void *)v22;
        if (v22)
        {
          v23 = (void *)v22;
          v47 = v21;
          v24 = [(HMDAccountHandleResolveOperation *)self handle];
          char v25 = [v23 isEqual:v24];

          v26 = (void *)MEMORY[0x230FBD990]();
          v27 = self;
          v28 = HMFGetOSLogHandle();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
          if (v25)
          {
            if (v29)
            {
              HMFGetLogIdentifier();
              v31 = v30 = v26;
              *(_DWORD *)buf = 138543618;
              v54 = v31;
              __int16 v55 = 2112;
              v56 = v50;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Received response from: %@", buf, 0x16u);

              v26 = v30;
            }

            v46 = +[HMDAccountIdentifier accountIdentifierForMessageContext:v16];
            v32 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v50 accountHandle:v49 accountIdentifier:v46 deviceVersion:0 pairingIdentityIdentifier:0];
            v33 = +[HMDRemoteAccountManager sharedManager];
            v34 = [v33 accountForSenderContext:v32];

            __callResolveBlocks(v27, v34, 0);
            [(HMFOperation *)v27 finish];
          }
          else
          {
            if (v29)
            {
              HMFGetLogIdentifier();
              v45 = v44 = v26;
              *(_DWORD *)buf = 138543618;
              v54 = v45;
              __int16 v55 = 2112;
              v56 = v50;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Ignoring response from unsupported device: %@", buf, 0x16u);

              v26 = v44;
            }
          }
          v21 = v47;
        }
        else
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          v41 = self;
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = v48 = v21;
            *(_DWORD *)buf = 138543362;
            v54 = v43;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Failed to parse sender account handle", buf, 0xCu);

            v21 = v48;
          }
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v51 = v35;
          v39 = v38 = v21;
          *(_DWORD *)buf = 138543874;
          v54 = v39;
          __int16 v55 = 2112;
          v56 = v38;
          __int16 v57 = 2112;
          v58 = v52;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring message with transaction ID: %@, expected %@", buf, 0x20u);

          v21 = v38;
          v35 = v51;
        }
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([(HMFOperation *)self isExecuting])
  {
    v19 = [(HMDAccountHandleResolveOperation *)self messageContext];
    uint64_t v20 = [v19 identifier];
    int v21 = objc_msgSend(v20, "hmf_isEqualToUUIDString:", v16);

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      char v25 = v24;
      if (v10)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          int v29 = 138543362;
          v30 = v26;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Confirmed resolve sent successfully", (uint8_t *)&v29, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v27 = HMFGetLogIdentifier();
          int v29 = 138543618;
          v30 = v27;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message to server with error: %@", (uint8_t *)&v29, 0x16u);
        }
        v28 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:0 reason:0 suggestion:0 underlyingError:v17];
        __callResolveBlocks(v23, 0, v28);
        [(HMFOperation *)v23 cancelWithError:v28];
      }
    }
  }
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMDAccountHandleResolveOperation *)self handle];
  v4 = [v3 identifier];
  v5 = [v4 UUIDString];
  v6 = [v2 stringWithFormat:@"%@", v5];

  return v6;
}

- (void)addResolveBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HMFOperation *)self underlyingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAccountHandleResolveOperation_addResolveBlock___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDAccountHandleResolveOperation_addResolveBlock___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) resolveBlocks];
    v2 = (void *)[*(id *)(a1 + 40) copy];
    v3 = _Block_copy(v2);
    [v4 addObject:v3];
  }
}

- (void)main
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v55 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
  }
  v7 = [HMDRemoteAccountMessageDestination alloc];
  id v8 = [MEMORY[0x263F08C38] UUID];
  v9 = [(HMDAccountHandleResolveOperation *)v4 handle];
  BOOL v10 = [(HMDRemoteAccountMessageDestination *)v7 initWithTarget:v8 handle:v9 multicast:1];

  v11 = [[HMDRemoteMessage alloc] initWithName:@"kPingInternalRequestKey" qualityOfService:-1 destination:v10 payload:0 type:0 timeout:0 secure:0.0];
  [(HMDRemoteMessage *)v11 setResponseRestriction:1];
  id v49 = 0;
  id v12 = +[HMDRemoteMessageSerialization dictionaryForMessage:v11 isHH2Payload:1 error:&v49];
  id v13 = v49;
  id v14 = v13;
  if (v12)
  {
    v45 = v10;
    id v46 = v13;
    v52[0] = *MEMORY[0x263F49F80];
    id v15 = NSNumber;
    +[HMDAccountHandleResolveOperation timeout];
    id v16 = objc_msgSend(v15, "numberWithDouble:");
    v52[1] = *MEMORY[0x263F49EF8];
    v53[0] = v16;
    v53[1] = MEMORY[0x263EFFA88];
    id v17 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

    id v18 = [(HMDAccountHandleResolveOperation *)v4 service];
    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = [(HMDAccountHandleResolveOperation *)v4 handle];
    int v21 = [v20 remoteDestinationString];
    uint64_t v22 = [v19 setWithObject:v21];
    id v47 = 0;
    id v48 = 0;
    char v23 = [v18 sendMessage:v12 toDestinations:v22 priority:300 options:v17 identifier:&v48 error:&v47];
    id v24 = v48;
    id v44 = v47;

    char v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v4;
    v27 = HMFGetOSLogHandle();
    v28 = v27;
    if (v23)
    {
      int v29 = v24;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v55 = v30;
        __int16 v56 = 2112;
        id v57 = v24;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Started resolve with identifier: %@", buf, 0x16u);
      }
      __int16 v31 = +[HMDMetricsManager sharedLogEventSubmitter];
      id v32 = +[HMDRemoteMessageLogEvent sentRemoteMessage:v11 transportType:2];
      [v31 submitLogEvent:v32];

      v50 = @"transactionID";
      uint64_t v33 = [(HMDRemoteMessage *)v11 transactionIdentifier];
      v51 = v33;
      v34 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

      v35 = [HMDIDSMessageContext alloc];
      v36 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24];
      BOOL v10 = v45;
      v37 = [(HMDIDSMessageContext *)v35 initWithIdentifier:v36 destination:v45 userInfo:v34];
      [(HMDAccountHandleResolveOperation *)v26 setMessageContext:v37];

      v38 = v44;
    }
    else
    {
      v38 = v44;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v55 = v43;
        __int16 v56 = 2112;
        id v57 = v44;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);
      }
      v34 = [MEMORY[0x263F087E8] hmErrorWithCode:54 description:0 reason:0 suggestion:0 underlyingError:v44];
      __callResolveBlocks(v26, 0, v34);
      [(HMFOperation *)v26 cancelWithError:v34];
      int v29 = v24;
      BOOL v10 = v45;
    }

    id v14 = v46;
  }
  else
  {
    v39 = (void *)MEMORY[0x230FBD990]();
    v40 = v4;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v55 = v42;
      __int16 v56 = 2112;
      id v57 = v14;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message with error: %@", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:0 reason:0 suggestion:0 underlyingError:v14];
    __callResolveBlocks(v40, 0, v17);
    [(HMFOperation *)v40 cancelWithError:v17];
  }
}

- (HMDAccountHandleResolveOperation)initWithHandle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v17 = (HMDAccountHandleResolveOperation *)_HMFPreconditionFailure();
    [(HMDAccountHandleResolveOperation *)v17 initWithQualityOfService:v19 timeout:v20];
  }
  v5 = v4;
  +[HMDAccountHandleResolveOperation timeout];
  v21.receiver = self;
  v21.super_class = (Class)HMDAccountHandleResolveOperation;
  id v6 = [(HMFOperation *)&v21 initWithTimeout:sel_initWithTimeout_];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    handle = v6->_handle;
    v6->_handle = (HMDAccountHandle *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    resolveBlocks = v6->_resolveBlocks;
    v6->_resolveBlocks = (NSMutableArray *)v9;

    v11 = +[HMDIDSServiceManager sharedManager];
    uint64_t v12 = [v11 service];
    service = v6->_service;
    v6->_service = (HMDIDSService *)v12;

    id v14 = v6->_service;
    id v15 = [(HMFOperation *)v6 underlyingQueue];
    [(HMDIDSService *)v14 addDelegate:v6 queue:v15];
  }
  return v6;
}

- (HMDAccountHandleResolveOperation)initWithQualityOfService:(int64_t)a3 timeout:(double)a4
{
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  id v6 = NSString;
  uint64_t v7 = NSStringFromSelector(a2);
  id v8 = [v6 stringWithFormat:@"%@ is unavailable", v7];
  id v9 = [v4 exceptionWithName:v5 reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (HMDAccountHandleResolveOperation)initWithTimeout:(double)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  uint64_t v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (HMDAccountHandleResolveOperation)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_80113 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_80113, &__block_literal_global_80114);
  }
  v2 = (void *)logCategory__hmf_once_v5_80115;
  return v2;
}

void __47__HMDAccountHandleResolveOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_80115;
  logCategory__hmf_once_v5_80115 = v0;
}

+ (double)timeout
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  uint64_t v3 = [v2 preferenceForKey:@"accountResolutionTimeout"];

  uint64_t v4 = [v3 numberValue];

  if (v4)
  {
    uint64_t v5 = [v3 numberValue];
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