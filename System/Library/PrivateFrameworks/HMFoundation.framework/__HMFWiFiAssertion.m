@interface __HMFWiFiAssertion
- (BOOL)acquire:(id *)a3;
- (HMFWiFiManager)manager;
- (__HMFWiFiAssertion)initWithName:(id)a3;
- (__HMFWiFiAssertion)initWithOptions:(unint64_t)a3 manager:(id)a4 reason:(id)a5;
- (unint64_t)options;
- (void)invalidate;
@end

@implementation __HMFWiFiAssertion

- (__HMFWiFiAssertion)initWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (__HMFWiFiAssertion)initWithOptions:(unint64_t)a3 manager:(id)a4 reason:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    _HMFPreconditionFailure(@"manager");
  }
  v11 = v10;
  if (!v10) {
    _HMFPreconditionFailure(@"reason");
  }
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  if ([v11 length])
  {
    uint64_t v14 = [v13 stringByAppendingFormat:@".%@", v11];

    v13 = (void *)v14;
  }
  v18.receiver = self;
  v18.super_class = (Class)__HMFWiFiAssertion;
  v15 = [(HMFAssertion *)&v18 initWithName:v13];
  v16 = v15;
  if (v15)
  {
    v15->_options = a3;
    objc_storeStrong((id *)&v15->_manager, a4);
    v16->super._valid = 0;
  }

  return v16;
}

- (BOOL)acquire:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__HMFWiFiAssertion;
  BOOL v4 = [(HMFAssertion *)&v6 acquire:a3];
  if (v4) {
    -[HMFWiFiManager __updateActiveAssertions]((id *)&self->_manager->super.super.isa);
  }
  return v4;
}

- (void)invalidate
{
  if ([(HMFAssertion *)self isValid]) {
    -[HMFWiFiManager __updateActiveAssertions]((id *)&self->_manager->super.super.isa);
  }
  v3.receiver = self;
  v3.super_class = (Class)__HMFWiFiAssertion;
  [(HMFAssertion *)&v3 invalidate];
}

- (HMFWiFiManager)manager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end