@interface HMFAssertion
+ (id)bundleIdentifier;
+ (id)logCategory;
- (BOOL)acquire:(id *)a3;
- (BOOL)isValid;
- (HMFAssertion)init;
- (HMFAssertion)initWithName:(id)a3;
- (NSString)name;
- (NSString)uniqueDescription;
- (id)attributeDescriptions;
- (void)dealloc;
- (void)invalidate;
@end

@implementation HMFAssertion

void __32__HMFAssertion_bundleIdentifier__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3A87A0]();
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 bundleIdentifier];
  v3 = (void *)_MergedGlobals_62;
  _MergedGlobals_62 = v2;
}

+ (id)logCategory
{
  if (qword_1EB4EED28 != -1) {
    dispatch_once(&qword_1EB4EED28, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)qword_1EB4EED30;
  return v2;
}

- (HMFAssertion)initWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMFAssertion;
    v5 = [(HMFAssertion *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      name = v5->_name;
      v5->_name = (NSString *)v6;

      v5->_valid = 1;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)uniqueDescription
{
  v3 = NSString;
  id v4 = +[HMFAssertion bundleIdentifier];
  v5 = [(HMFAssertion *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(HMFAssertion *)self isValid])
  {
    v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Invalidating", (uint8_t *)&v7, 0xCu);
    }
    v4->_valid = 0;
  }
}

- (BOOL)isValid
{
  return self->_valid;
}

+ (id)bundleIdentifier
{
  if (qword_1EB4EED20 != -1) {
    dispatch_once(&qword_1EB4EED20, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)_MergedGlobals_62;
  return v2;
}

uint64_t __27__HMFAssertion_logCategory__block_invoke()
{
  qword_1EB4EED30 = HMFCreateOSLogHandle(@"Assertion", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_valid)
  {
    v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating during deallocation", buf, 0xCu);
    }
    [(HMFAssertion *)v4 invalidate];
  }
  v7.receiver = self;
  v7.super_class = (Class)HMFAssertion;
  [(HMFAssertion *)&v7 dealloc];
}

- (HMFAssertion)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)acquire:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(HMFAssertion *)self isValid])
  {
    id v4 = (void *)MEMORY[0x19F3A87A0]();
    v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier(v5);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Acquiring", (uint8_t *)&v9, 0xCu);
    }
    v5->_valid = 1;
  }
  return 1;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFAssertion *)self name];
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Name" value:v4];
  v11[0] = v5;
  uint64_t v6 = [HMFAttributeDescription alloc];
  id v7 = HMFBooleanToString([(HMFAssertion *)self isValid]);
  v8 = [(HMFAttributeDescription *)v6 initWithName:@"Valid" value:v7];
  v11[1] = v8;
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

@end