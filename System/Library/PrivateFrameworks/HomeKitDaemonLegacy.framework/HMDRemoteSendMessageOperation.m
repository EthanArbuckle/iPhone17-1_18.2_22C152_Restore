@interface HMDRemoteSendMessageOperation
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isMessageResponseHandled;
- (HMDRemoteSendMessageOperation)initWithMessage:(id)a3 transport:(id)a4;
- (HMDSecureRemoteMessageTransport)transport;
- (HMFMessage)message;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)privateDescription;
- (NSString)shortDescription;
- (id)logIdentifier;
- (void)_respondWithError:(id)a3 playload:(id)a4;
- (void)cancelWithError:(id)a3;
- (void)main;
- (void)setMessageResponseHandled:(BOOL)a3;
@end

@implementation HMDRemoteSendMessageOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setMessageResponseHandled:(BOOL)a3
{
  self->_messageResponseHandled = a3;
}

- (BOOL)isMessageResponseHandled
{
  return self->_messageResponseHandled;
}

- (HMDSecureRemoteMessageTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  return (HMDSecureRemoteMessageTransport *)WeakRetained;
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 320, 1);
}

- (id)logIdentifier
{
  v2 = [(HMFMessage *)self->_message identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  [(HMDRemoteSendMessageOperation *)self _respondWithError:v4 playload:0];
  v5.receiver = self;
  v5.super_class = (Class)HMDRemoteSendMessageOperation;
  [(HMFOperation *)&v5 cancelWithError:v4];
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  objc_super v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    v7 = [(HMDRemoteSendMessageOperation *)v4 message];
    v8 = [(HMDRemoteSendMessageOperation *)v4 message];
    v9 = [v8 destination];
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v7;
    __int16 v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting sending message %@ to destination: %@", buf, 0x20u);
  }
  v10 = [(HMDRemoteSendMessageOperation *)v4 transport];
  if (!v10)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v4;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine secure transport", buf, 0xCu);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [(HMDRemoteSendMessageOperation *)v12 cancelWithError:v15];
  }
  objc_initWeak((id *)buf, v4);
  v16 = [(HMDRemoteSendMessageOperation *)v4 message];
  v17 = (void *)[v16 mutableCopy];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__HMDRemoteSendMessageOperation_main__block_invoke;
  v18[3] = &unk_1E6A17A08;
  objc_copyWeak(&v19, (id *)buf);
  [v17 setResponseHandler:v18];
  [v10 sendMessage:v17 completionHandler:0];
  objc_destroyWeak(&v19);

  objc_destroyWeak((id *)buf);
}

void __37__HMDRemoteSendMessageOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isCancelled])
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Operation is already cancelled, do not process response handler", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = WeakRetained;
    v14 = HMFGetOSLogHandle();
    v15 = v14;
    if (v5)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message", (uint8_t *)&v18, 0xCu);
      }
      [v13 cancelWithError:v5];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully sent message", (uint8_t *)&v18, 0xCu);
      }
      [v13 finish];
    }
    [v13 _respondWithError:v5 playload:v6];
  }
}

- (void)_respondWithError:(id)a3 playload:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDRemoteSendMessageOperation *)self isMessageResponseHandled])
  {
    v8 = 0;
  }
  else
  {
    [(HMDRemoteSendMessageOperation *)self setMessageResponseHandled:1];
    v8 = [(HMDRemoteSendMessageOperation *)self message];
  }
  os_unfair_lock_unlock(p_lock);
  [v8 respondWithPayload:v6 error:v9];
}

- (NSArray)attributeDescriptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Message" value:self->_message options:1 formatter:0];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)privateDescription
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDRemoteSendMessageOperation *)self message];
  id v6 = [v5 privateDescription];
  v7 = [v3 stringWithFormat:@"%@, Message = %@", v4, v6];

  return (NSString *)v7;
}

- (NSString)shortDescription
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDRemoteSendMessageOperation *)self message];
  id v6 = [v5 identifier];
  v7 = [v3 stringWithFormat:@"%@, Message = %@", v4, v6];

  return (NSString *)v7;
}

- (HMDRemoteSendMessageOperation)initWithMessage:(id)a3 transport:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 destination];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v7 destination];
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid message destination: %@", buf, 0x16u);

LABEL_12:
    }
LABEL_13:

    v21 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport", buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v11 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  [v13 timeout];
  if (v14 <= 0.0) {
    double v15 = 65.0;
  }
  else {
    [v13 timeout];
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDRemoteSendMessageOperation;
  __int16 v22 = [(HMFOperation *)&v25 initWithTimeout:v15];
  p_isa = (id *)&v22->super.super.super.isa;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_message, a3);
    objc_storeWeak(p_isa + 41, v8);
  }
  v17 = p_isa;

  v21 = v17;
LABEL_18:

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_114517 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_114517, &__block_literal_global_114518);
  }
  v2 = (void *)logCategory__hmf_once_v10_114519;
  return v2;
}

uint64_t __44__HMDRemoteSendMessageOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_114519;
  logCategory__hmf_once_v10_114519 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end