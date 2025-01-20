@interface HMDDataStreamControlProtocol
- (BOOL)controlHandshakeComplete;
- (BOOL)helloMessageResponseReceived;
- (BOOL)isActive;
- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4;
- (HMDDataStreamControlProtocol)initWithLogIdentifier:(id)a3;
- (NSNumber)peerDataStreamProtocolVersion;
- (NSNumber)pendingHelloMessageIdentifier;
- (NSString)logIdentifier;
- (void)_sendHelloMessageOnDataStream:(id)a3;
- (void)_sendVersionRequestOnDataStream:(id)a3;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidOpen:(id)a3;
- (void)setControlHandshakeComplete:(BOOL)a3;
- (void)setHelloMessageResponseReceived:(BOOL)a3;
- (void)setPeerDataStreamProtocolVersion:(id)a3;
- (void)setPendingHelloMessageIdentifier:(id)a3;
@end

@implementation HMDDataStreamControlProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, 0);
}

- (void)setControlHandshakeComplete:(BOOL)a3
{
  self->_controlHandshakeComplete = a3;
}

- (BOOL)controlHandshakeComplete
{
  return self->_controlHandshakeComplete;
}

- (void)setPendingHelloMessageIdentifier:(id)a3
{
}

- (NSNumber)pendingHelloMessageIdentifier
{
  return self->_pendingHelloMessageIdentifier;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerDataStreamProtocolVersion:(id)a3
{
}

- (NSNumber)peerDataStreamProtocolVersion
{
  return self->_peerDataStreamProtocolVersion;
}

- (void)setHelloMessageResponseReceived:(BOOL)a3
{
  self->_helloMessageResponseReceived = a3;
}

- (BOOL)helloMessageResponseReceived
{
  return self->_helloMessageResponseReceived;
}

- (void)_sendVersionRequestOnDataStream:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HMFRandomUInt32();
  v8 = @"version";
  v9[0] = &unk_26E4746D8;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamControlProtocol__sendVersionRequestOnDataStream___block_invoke;
  v7[3] = &unk_264A2F3E8;
  v7[4] = self;
  [v4 sendRequestForProtocol:@"control" topic:@"version" identifier:v5 payload:v6 completion:v7];
}

void __64__HMDDataStreamControlProtocol__sendVersionRequestOnDataStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send version control message (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_sendHelloMessageOnDataStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = HMFRandomUInt32();
  v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
  [(HMDDataStreamControlProtocol *)self setPendingHelloMessageIdentifier:v6];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDDataStreamControlProtocol__sendHelloMessageOnDataStream___block_invoke;
  v7[3] = &unk_264A2F3E8;
  v7[4] = self;
  [v4 sendRequestForProtocol:@"control" topic:@"hello" identifier:v5 payload:MEMORY[0x263EFFA78] completion:v7];
}

void __62__HMDDataStreamControlProtocol__sendHelloMessageOnDataStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send hello control message (%@)", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDDataStreamControlProtocol *)self isExpectedHelloControlMessage:v11 header:v12])
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Hello control message reply received", (uint8_t *)&v29, 0xCu);
    }
    if (![(HMDDataStreamControlProtocol *)v15 helloMessageResponseReceived])
    {
      v18 = [v13 objectForKey:@"capability-version"];

      if (v18) {
        [(HMDDataStreamControlProtocol *)v15 _sendVersionRequestOnDataStream:v10];
      }
      else {
        v15->_controlHandshakeComplete = 1;
      }
    }
    [(HMDDataStreamControlProtocol *)v15 setHelloMessageResponseReceived:1];
    [(HMDDataStreamControlProtocol *)v15 setPendingHelloMessageIdentifier:0];
  }
  else
  {
    int v19 = [v11 isEqual:@"version"];
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v23)
      {
        v24 = HMFGetLogIdentifier();
        int v29 = 138543618;
        v30 = v24;
        __int16 v31 = 2112;
        id v32 = v13;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Received Peer Request Version Response %@", (uint8_t *)&v29, 0x16u);
      }
      v25 = [v13 objectForKey:@"version"];

      if (v25)
      {
        uint64_t v26 = [v13 objectForKey:@"version"];
        peerDataStreamProtocolVersion = v21->_peerDataStreamProtocolVersion;
        v21->_peerDataStreamProtocolVersion = (NSNumber *)v26;
      }
      v21->_controlHandshakeComplete = 1;
    }
    else
    {
      if (v23)
      {
        v28 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v28;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Expected hello reply or Version but got something else", (uint8_t *)&v29, 0xCu);
      }
    }
  }
}

- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4
{
  id v6 = a4;
  if (![a3 isEqual:@"hello"]) {
    goto LABEL_5;
  }
  v7 = [(HMDDataStreamControlProtocol *)self pendingHelloMessageIdentifier];

  if (!v7) {
    goto LABEL_5;
  }
  int v8 = [v6 objectForKeyedSubscript:@"id"];
  v9 = [(HMDDataStreamControlProtocol *)self pendingHelloMessageIdentifier];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = [v6 objectForKeyedSubscript:@"status"];
    char v12 = [v11 isEqual:&unk_26E473B58];
  }
  else
  {
LABEL_5:
    char v12 = 0;
  }

  return v12;
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  v34[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 isEqual:@"hello"])
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Hello control message received", (uint8_t *)&v29, 0xCu);
    }
    [v10 sendResponseForRequestHeader:v12 payload:MEMORY[0x263EFFA78] status:0 completion:&__block_literal_global_266471];
  }
  else
  {
    int v18 = [v11 isEqual:@"version"];
    int v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        BOOL v23 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Version control message received", (uint8_t *)&v29, 0xCu);
      }
      v24 = [v13 objectForKey:@"version"];

      if (v24)
      {
        uint64_t v25 = [v13 objectForKey:@"version"];
        peerDataStreamProtocolVersion = v20->_peerDataStreamProtocolVersion;
        v20->_peerDataStreamProtocolVersion = (NSNumber *)v25;
      }
      uint64_t v33 = @"version";
      v34[0] = &unk_26E4746D8;
      v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      [v10 sendResponseForRequestHeader:v12 payload:v27 status:0 completion:&__block_literal_global_3_266473];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        int v29 = 138543618;
        v30 = v28;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Control Protocol received unexpected request '%@'", (uint8_t *)&v29, 0x16u);
      }
    }
  }
}

- (void)dataStreamDidOpen:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending hello control message", (uint8_t *)&v9, 0xCu);
  }
  [(HMDDataStreamControlProtocol *)v6 _sendHelloMessageOnDataStream:v4];
}

- (BOOL)isActive
{
  return 1;
}

- (HMDDataStreamControlProtocol)initWithLogIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDDataStreamControlProtocol;
  id v5 = [(HMDDataStreamControlProtocol *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    pendingHelloMessageIdentifier = v5->_pendingHelloMessageIdentifier;
    v5->_pendingHelloMessageIdentifier = 0;

    *(_WORD *)&v6->_helloMessageResponseReceived = 0;
    uint64_t v8 = [v4 copy];
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v8;

    peerDataStreamProtocolVersion = v6->_peerDataStreamProtocolVersion;
    v6->_peerDataStreamProtocolVersion = (NSNumber *)&unk_26E474778;
  }
  return v6;
}

@end