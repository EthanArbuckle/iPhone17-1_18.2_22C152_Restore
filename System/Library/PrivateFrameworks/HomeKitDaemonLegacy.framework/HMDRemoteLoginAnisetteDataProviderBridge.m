@interface HMDRemoteLoginAnisetteDataProviderBridge
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (HMDRemoteLoginAnisetteDataProviderBridge)initWithCoder:(id)a3;
- (HMDRemoteLoginAnisetteDataProviderBridge)initWithUUID:(id)a3;
- (HMDRemoteLoginMessageSender)remoteMessageSender;
- (HMFMessageDispatcher)msgDispatcher;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_handleMessage:(id)a3;
- (void)_registerXPCRelayForMessageName:(id)a3;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 remoteMessageSender:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)registerForMessages;
- (void)setMsgDispatcher:(id)a3;
- (void)setRemoteMessageSender:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDRemoteLoginAnisetteDataProviderBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setRemoteMessageSender:(id)a3
{
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemoteLoginAnisetteDataProviderBridge *)self uuid];
  [v4 encodeObject:v5 forKey:@"kIdentifierKey"];
}

- (HMDRemoteLoginAnisetteDataProviderBridge)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemoteLoginAnisetteDataProviderBridge *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (void)_handleMessage:(id)a3
{
  id v4 = a3;
  id v8 = [(HMDRemoteLoginAnisetteDataProviderBridge *)self remoteMessageSender];
  id v5 = [v4 name];
  uint64_t v6 = [v4 messagePayload];
  v7 = [v4 responseHandler];

  [v8 sendRemoteMessageWithName:v5 payload:v6 responseHandler:v7];
}

- (void)_registerXPCRelayForMessageName:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDRemoteLoginAnisetteDataProviderBridge *)self msgDispatcher];
  uint64_t v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v8[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 registerForMessage:v4 receiver:self policies:v7 selector:sel__handleMessage_];
}

- (void)registerForMessages
{
  v3 = [MEMORY[0x1E4F2EA38] messageName];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self _registerXPCRelayForMessageName:v3];

  id v4 = [MEMORY[0x1E4F2EB78] messageName];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self _registerXPCRelayForMessageName:v4];

  id v5 = [MEMORY[0x1E4F2E790] messageName];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self _registerXPCRelayForMessageName:v5];

  uint64_t v6 = [MEMORY[0x1E4F2E7D8] messageName];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self _registerXPCRelayForMessageName:v6];

  id v7 = [MEMORY[0x1E4F2E888] messageName];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self _registerXPCRelayForMessageName:v7];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4 remoteMessageSender:(id)a5
{
  id v9 = a5;
  id v8 = a4;
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self setWorkQueue:a3];
  [(HMDRemoteLoginAnisetteDataProviderBridge *)self setMsgDispatcher:v8];

  [(HMDRemoteLoginAnisetteDataProviderBridge *)self setRemoteMessageSender:v9];
}

- (id)logIdentifier
{
  v2 = [(HMDRemoteLoginAnisetteDataProviderBridge *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMDRemoteLoginAnisetteDataProviderBridge)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginAnisetteDataProviderBridge;
  uint64_t v6 = [(HMDRemoteLoginAnisetteDataProviderBridge *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_107522 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_107522, &__block_literal_global_107523);
  }
  v2 = (void *)logCategory__hmf_once_v1_107524;
  return v2;
}

uint64_t __55__HMDRemoteLoginAnisetteDataProviderBridge_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_107524;
  logCategory__hmf_once_v1_107524 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end