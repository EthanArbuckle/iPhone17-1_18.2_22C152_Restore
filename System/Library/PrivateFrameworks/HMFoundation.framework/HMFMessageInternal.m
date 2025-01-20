@interface HMFMessageInternal
- (HMFActivity)activity;
- (HMFLogEventSession)logEventSession;
- (HMFMessageDestination)destination;
- (HMFMessageInternal)init;
- (HMFMessageTransport)transport;
- (NSDictionary)headers;
- (NSDictionary)messagePayload;
- (NSDictionary)userInfo;
- (NSString)name;
- (NSUUID)identifier;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)responseHandler;
- (int64_t)qualityOfService;
- (void)setActivity:(id)a3;
- (void)setDestination:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLogEventSession:(id)a3;
- (void)setMessagePayload:(id)a3;
- (void)setName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTransport:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HMFMessageInternal

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_logEventSession, 0);
  objc_storeStrong((id *)&self->_messagePayload, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setActivity:(id)a3
{
}

- (void)setTransport:(id)a3
{
}

- (void)setResponseHandler:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setHeaders:(id)a3
{
}

- (void)setMessagePayload:(id)a3
{
}

- (void)setQualityOfService:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 + 1) > 0x22 || ((1 << (a3 + 1)) & 0x404040401) == 0)
  {
    v6 = (void *)MEMORY[0x19F3A87A0](self, a2);
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier(v7);
      int v10 = 138543618;
      v11 = v9;
      __int16 v12 = 2048;
      int64_t v13 = v3;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_INFO, "%{public}@Overriding unknown QoS '%tu' to NSQualityOfServiceDefault", (uint8_t *)&v10, 0x16u);
    }
    int64_t v3 = -1;
  }
  self->_qualityOfService = v3;
}

- (void)setDestination:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = [(HMFMessageInternal *)self identifier];
    uint64_t v7 = [v6 copyWithZone:a3];
    v8 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v7;

    v9 = [(HMFMessageInternal *)self name];
    uint64_t v10 = [v9 copyWithZone:a3];
    v11 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v10;

    [(HMFMessageInternal *)self timeout];
    *(void *)(v5 + 24) = v12;
    *(void *)(v5 + 32) = [(HMFMessageInternal *)self qualityOfService];
    uint64_t v13 = [(HMFMessageInternal *)self destination];
    uint64_t v14 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v13;

    v15 = [(HMFMessageInternal *)self transport];
    objc_storeWeak((id *)(v5 + 48), v15);

    uint64_t v16 = [(HMFMessageInternal *)self activity];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    v18 = [(HMFMessageInternal *)self userInfo];
    uint64_t v19 = [v18 copyWithZone:a3];
    v20 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v19;

    v21 = [(HMFMessageInternal *)self headers];
    uint64_t v22 = [v21 copyWithZone:a3];
    v23 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v22;

    v24 = [(HMFMessageInternal *)self messagePayload];
    uint64_t v25 = [v24 copyWithZone:a3];
    v26 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v25;

    uint64_t v27 = [(HMFMessageInternal *)self logEventSession];
    v28 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v27;

    v29 = [(HMFMessageInternal *)self responseHandler];
    uint64_t v30 = [v29 copyWithZone:a3];
    v31 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v30;
  }
  return (id)v5;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (HMFMessageTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  return (HMFMessageTransport *)WeakRetained;
}

- (HMFMessageDestination)destination
{
  return self->_destination;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSDictionary)messagePayload
{
  return self->_messagePayload;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMFMessageInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMFMessageInternal;
  result = [(HMFMessageInternal *)&v3 init];
  if (result) {
    result->_qualityOfService = -1;
  }
  return result;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (double)timeout
{
  return self->_timeout;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (HMFLogEventSession)logEventSession
{
  return self->_logEventSession;
}

- (void)setLogEventSession:(id)a3
{
}

@end