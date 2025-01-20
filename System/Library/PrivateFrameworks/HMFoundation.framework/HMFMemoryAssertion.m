@interface HMFMemoryAssertion
- (HMFMemoryAssertion)initWithName:(id)a3;
- (OS_os_transaction)internal;
- (void)invalidate;
- (void)mark;
- (void)setInternal:(id)a3;
@end

@implementation HMFMemoryAssertion

- (void)mark
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HMFMemoryAssertion;
  [(HMFAssertion *)&v11 mark];
  v3 = [(HMFMemoryAssertion *)self internal];
  char v4 = os_transaction_needs_more_time();

  v5 = (void *)MEMORY[0x19F3A87A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
    {
      v9 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      v10 = "%{public}@Successfully marked";
LABEL_6:
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, v10, buf, 0xCu);
    }
  }
  else if (v8)
  {
    v9 = HMFGetLogIdentifier(v6);
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    v10 = "%{public}@Failed to mark";
    goto LABEL_6;
  }
}

- (OS_os_transaction)internal
{
  return self->_internal;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)HMFMemoryAssertion;
  [(HMFAssertion *)&v3 invalidate];
  [(HMFMemoryAssertion *)self setInternal:0];
}

- (void)setInternal:(id)a3
{
}

- (HMFMemoryAssertion)initWithName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMFMemoryAssertion;
  objc_super v3 = [(HMFAssertion *)&v9 initWithName:a3];
  char v4 = v3;
  if (v3)
  {
    id v5 = [(HMFAssertion *)v3 uniqueDescription];
    [v5 UTF8String];
    uint64_t v6 = os_transaction_create();
    internal = v4->_internal;
    v4->_internal = (OS_os_transaction *)v6;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end