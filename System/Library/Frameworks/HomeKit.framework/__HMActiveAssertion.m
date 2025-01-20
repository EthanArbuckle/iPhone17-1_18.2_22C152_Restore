@interface __HMActiveAssertion
- (BOOL)acquire:(id *)a3;
- (NSUUID)UUID;
- (NSUUID)messageTargetUUID;
- (_HMContext)context;
- (__HMActiveAssertion)initWithName:(id)a3 context:(id)a4 messageTargetUUID:(id)a5;
- (void)_setAssertionActive:(void *)a1;
- (void)dealloc;
- (void)invalidate;
@end

@implementation __HMActiveAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)invalidate
{
  if ([(HMFAssertion *)self isValid]) {
    -[__HMActiveAssertion _setAssertionActive:](self, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)__HMActiveAssertion;
  [(HMFAssertion *)&v3 invalidate];
}

- (void)_setAssertionActive:(void *)a1
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F65488]);
    v5 = [a1 messageTargetUUID];
    v6 = (void *)[v4 initWithTarget:v5];

    v15[0] = @"HMAA.mk.state";
    v7 = [NSNumber numberWithBool:a2];
    v15[1] = @"HMAA.mk.uuid";
    v16[0] = v7;
    v8 = [a1 UUID];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMAA.m.updateState" destination:v6 payload:v9];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43____HMActiveAssertion__setAssertionActive___block_invoke;
    v13[3] = &__block_descriptor_33_e34_v24__0__NSError_8__NSDictionary_16l;
    char v14 = a2;
    [v10 setResponseHandler:v13];
    v11 = [a1 context];
    v12 = [v11 messageDispatcher];
    [v12 sendMessage:v10];
  }
}

- (BOOL)acquire:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)__HMActiveAssertion;
  [(HMFAssertion *)&v10 acquire:a3];
  objc_initWeak(&location, self);
  id v4 = [(__HMActiveAssertion *)self context];
  v5 = [v4 xpcClient];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31____HMActiveAssertion_acquire___block_invoke;
  v7[3] = &unk_1E59455B8;
  objc_copyWeak(&v8, &location);
  [v5 registerReconnectionHandler:v7];

  -[__HMActiveAssertion _setAssertionActive:](self, 1);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 1;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMFAssertion *)self isValid])
  {
    objc_super v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_FAULT, "%{public}@Active assertion unexpectedly deallocated: %@", buf, 0x16u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)__HMActiveAssertion;
  [(HMFAssertion *)&v7 dealloc];
}

- (__HMActiveAssertion)initWithName:(id)a3 context:(id)a4 messageTargetUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v19 = (HMDeviceSetupOperationBase *)_HMFPreconditionFailure();
    [(HMDeviceSetupOperationBase *)v19 .cxx_destruct];
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)__HMActiveAssertion;
  uint64_t v12 = [(HMFAssertion *)&v21 initWithName:v8];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a4);
    uint64_t v14 = [v11 copy];
    messageTargetUUID = v13->_messageTargetUUID;
    v13->_messageTargetUUID = (NSUUID *)v14;

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    UUID = v13->_UUID;
    v13->_UUID = (NSUUID *)v16;
  }
  return v13;
}

@end