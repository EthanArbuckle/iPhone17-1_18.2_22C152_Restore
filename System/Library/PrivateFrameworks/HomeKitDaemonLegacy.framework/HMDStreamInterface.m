@interface HMDStreamInterface
+ (id)extractNetworkConfig:(int)a3 peerNameExtractor:(void *)a4;
+ (id)logCategory;
+ (int)openSocketWithNetworkConfig:(id)a3;
- (BOOL)loadMiscFields:(id)a3;
- (HMDCameraRemoteStreamProtocol)sessionHandler;
- (HMDCameraStreamSessionID)sessionID;
- (HMDStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 sessionHandler:(id)a5 localRTPSocket:(int)a6;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)socketCloseHandler;
- (int)localRTPSocket;
- (unint64_t)state;
- (void)dealloc;
- (void)setSocketCloseHandler:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStreamInterfaceState:(unint64_t)a3;
@end

@implementation HMDStreamInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_socketCloseHandler, 0);
  objc_storeStrong((id *)&self->_sessionHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setSocketCloseHandler:(id)a3
{
}

- (id)socketCloseHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (int)localRTPSocket
{
  return self->_localRTPSocket;
}

- (HMDCameraRemoteStreamProtocol)sessionHandler
{
  return (HMDCameraRemoteStreamProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)loadMiscFields:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDStreamInterface *)self sessionHandler];
  if ([v5 conformsToProtocol:&unk_1F2E0BDD0]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = objc_opt_class();
    uint64_t v9 = [v7 remoteVideoSocket];
    v10 = [v8 extractNetworkConfig:v9 peerNameExtractor:MEMORY[0x1E4F14878]];
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      v15 = [v10 ipAddress];
      int v29 = 138543618;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@IDSDevice connection: Peer IP address: %@\n", (uint8_t *)&v29, 0x16u);
    }
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = v12;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v10 rtpPort];
      int v29 = 138543618;
      v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@IDSDevice connection: Peer port      : %@\n", (uint8_t *)&v29, 0x16u);
    }
    v21 = [v10 ipAddress];
    v22 = [v4 remoteAddress];
    [v22 setIp:v21];

    v23 = [v10 rtpPort];
    LOWORD(v22) = [v23 unsignedIntegerValue];
    v24 = [v4 remoteAddress];
    [v24 setPort:(unsigned __int16)v22];

    uint64_t v25 = [v10 ipv6];
    v26 = [v4 remoteAddress];
    [v26 setIsIPv6:v25];

    v27 = [v10 rtpPort];
    objc_msgSend(v4, "setRtcpRemotePort:", objc_msgSend(v27, "unsignedShortValue"));
  }
  return 1;
}

- (void)setStreamInterfaceState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)dealloc
{
  if (self->_localRTPSocket != -1) {
    (*((void (**)(void))self->_socketCloseHandler + 2))();
  }
  v3.receiver = self;
  v3.super_class = (Class)HMDStreamInterface;
  [(HMDStreamInterface *)&v3 dealloc];
}

- (id)logIdentifier
{
  v2 = [(HMDStreamInterface *)self sessionID];
  objc_super v3 = [v2 description];

  return v3;
}

- (HMDStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 sessionHandler:(id)a5 localRTPSocket:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDStreamInterface;
  v14 = [(HMDStreamInterface *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_sessionID, a3);
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v15->_sessionHandler, a5);
    v15->_localRTPSocket = a6;
    v15->_unint64_t state = 1;
    id socketCloseHandler = v15->_socketCloseHandler;
    v15->_id socketCloseHandler = &__block_literal_global_54101;
  }
  return v15;
}

uint64_t __80__HMDStreamInterface_initWithSessionID_workQueue_sessionHandler_localRTPSocket___block_invoke(int a1, int a2)
{
  return close(a2);
}

+ (id)extractNetworkConfig:(int)a3 peerNameExtractor:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(HMDCameraNetworkConfig);
  memset(v30, 0, 128);
  int v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  *(_OWORD *)v23 = 0u;
  long long v24 = 0u;
  int v18 = 128;
  if ((((uint64_t (*)(uint64_t, _WORD *, int *))a4)(v5, v30, &v18) & 0x80000000) != 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = *__error();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to get the peer name %d", buf, 0x12u);
    }
    v14 = 0;
  }
  else
  {
    uint64_t v8 = bswap32(v30[1]) >> 16;
    if (HIBYTE(v30[0]) == 2)
    {
      inet_ntop(2, &v30[2], v23, 0x64u);
    }
    else
    {
      inet_ntop(30, &v30[4], v23, 0x64u);
      [(HMDCameraNetworkConfig *)v7 setIpv6:1];
    }
    v15 = [NSString stringWithUTF8String:v23];
    [(HMDCameraNetworkConfig *)v7 setIpAddress:v15];

    v16 = [NSNumber numberWithInt:v8];
    [(HMDCameraNetworkConfig *)v7 setRtpPort:v16];

    v14 = v7;
  }

  return v14;
}

+ (int)openSocketWithNetworkConfig:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if ([v4 ipv6])
  {
    uint64_t v5 = (void *)socket(30, 2, 0);
    if ((v5 & 0x80000000) == 0)
    {
      v6 = v5;
      int v24 = 1;
      setsockopt((int)v5, 0xFFFF, 512, &v24, 4u);
      int v24 = 3200000;
      setsockopt((int)v6, 0xFFFF, 4098, &v24, 4u);
      if (bind((int)v6, (const sockaddr *)(v4 + 36), 0x1Cu) < 0)
      {
        v6 = (void *)MEMORY[0x1D9452090]();
        id v7 = a1;
        uint64_t v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        goto LABEL_18;
      }
      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
LABEL_14:
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v26 = v18;
    v19 = "%{public}@cannot create socket";
    v20 = v8;
    uint32_t v21 = 12;
LABEL_17:
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);

    goto LABEL_18;
  }
  uint64_t v9 = (void *)socket(2, 2, 0);
  if ((v9 & 0x80000000) != 0)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = v9;
  int v24 = 1;
  setsockopt((int)v9, 0xFFFF, 512, &v24, 4u);
  int v24 = 3200000;
  setsockopt((int)v6, 0xFFFF, 4098, &v24, 4u);
  if (bind((int)v6, (const sockaddr *)(v4 + 8), 0x10u) < 0)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_16:
      int v18 = HMFGetLogIdentifier();
      int v22 = *__error();
      *(_DWORD *)buf = 138543618;
      long long v26 = v18;
      __int16 v27 = 1024;
      LODWORD(v28) = v22;
      v19 = "%{public}@bind failed %d";
      v20 = v8;
      uint32_t v21 = 18;
      goto LABEL_17;
    }
LABEL_18:

    LODWORD(v6) = -1;
    goto LABEL_19;
  }
LABEL_8:
  id v10 = [a1 extractNetworkConfig:v6 peerNameExtractor:MEMORY[0x1E4F14888]];
  id v11 = [v10 rtpPort];
  [v4 setRtpPort:v11];

  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = a1;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v4 ipAddress];
    v17 = [v4 rtpPort];
    *(_DWORD *)buf = 138543874;
    long long v26 = v15;
    __int16 v27 = 2112;
    long long v28 = v16;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Opened socket at address %@ and port %@", buf, 0x20u);
  }

LABEL_19:
  return (int)v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_54123 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_54123, &__block_literal_global_13_54124);
  }
  v2 = (void *)logCategory__hmf_once_v1_54125;
  return v2;
}

uint64_t __33__HMDStreamInterface_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_54125;
  logCategory__hmf_once_v1_54125 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end