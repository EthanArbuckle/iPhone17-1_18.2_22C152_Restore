@interface HMFPowerAssertion
- (HMFPowerAssertion)initWithName:(id)a3;
- (HMFPowerAssertion)initWithName:(id)a3 timeout:(double)a4;
- (unsigned)identifier;
- (void)_cleanUpPowerAssertion;
- (void)invalidate;
- (void)setIdentifier:(unsigned int)a3;
@end

@implementation HMFPowerAssertion

- (HMFPowerAssertion)initWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMFPowerAssertion;
  v5 = [(HMFAssertion *)&v14 initWithName:v4];
  v6 = v5;
  if (v5
    && (IOReturn v7 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", (CFStringRef)[(HMFAssertion *)v5 uniqueDescription], 0, 0, 0, 0.0, 0, &v5->_identifier)) != 0)
  {
    IOReturn v8 = v7;
    v9 = (void *)MEMORY[0x19F3A87A0]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create assertion with error: %ld", buf, 0x16u);
    }
    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (HMFPowerAssertion)initWithName:(id)a3 timeout:(double)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMFPowerAssertion;
  IOReturn v7 = [(HMFAssertion *)&v16 initWithName:v6];
  IOReturn v8 = v7;
  if (v7
    && (IOReturn v9 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", (CFStringRef)[(HMFAssertion *)v7 uniqueDescription], 0, 0, 0, a4, @"TimeoutActionTurnOff", &v7->_identifier)) != 0)
  {
    IOReturn v10 = v9;
    v11 = (void *)MEMORY[0x19F3A87A0]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create assertion with error: %ld", buf, 0x16u);
    }
    objc_super v14 = 0;
  }
  else
  {
    objc_super v14 = v8;
  }

  return v14;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)HMFPowerAssertion;
  [(HMFAssertion *)&v3 invalidate];
  [(HMFPowerAssertion *)self _cleanUpPowerAssertion];
}

- (void)_cleanUpPowerAssertion
{
  if ([(HMFPowerAssertion *)self identifier])
  {
    IOPMAssertionRelease([(HMFPowerAssertion *)self identifier]);
    [(HMFPowerAssertion *)self setIdentifier:0];
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

@end