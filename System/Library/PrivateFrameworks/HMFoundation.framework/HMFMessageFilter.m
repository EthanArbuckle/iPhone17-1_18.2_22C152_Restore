@interface HMFMessageFilter
+ (BOOL)canInitWithMessage:(id)a3;
+ (NSSet)policyClasses;
+ (id)logCategory;
+ (id)policyOfClass:(Class)a3 fromPolicies:(id)a4;
+ (id)requiredPolicyOfClass:(Class)a3 fromPolicies:(id)a4 error:(id *)a5;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
- (BOOL)acceptWithPolicies:(id)a3 error:(id *)a4;
- (HMFMessage)message;
- (HMFMessageFilter)init;
- (HMFMessageFilter)initWithMessage:(id)a3;
- (NSArray)attributeDescriptions;
- (id)logIdentifier;
@end

@implementation HMFMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6
{
  return [a1 filterMessage:a3 withPolicies:a4 error:a6];
}

+ (id)requiredPolicyOfClass:(Class)a3 fromPolicies:(id)a4 error:(id *)a5
{
  v8 = [a1 policyOfClass:a3 fromPolicies:a4];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = NSString;
    id v14 = (id)objc_opt_class();
    if (v14 == a1)
    {
      v15 = @"filter";
    }
    else
    {
      NSStringFromClass((Class)a1);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v16 = [v13 stringWithFormat:@"%@ required by %@ is missing", a3, v15];
    *a5 = [v12 hmfErrorWithCode:2 reason:v16];

    if (v14 != a1) {
  }
    }

  return v9;
}

+ (id)policyOfClass:(Class)a3 fromPolicies:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [a1 canInitWithMessage:v8])
  {
    id v10 = (void *)[objc_alloc((Class)a1) initWithMessage:v8];
    if (v10)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v11 = objc_msgSend(a1, "policyClasses", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = [a1 requiredPolicyOfClass:*(void *)(*((void *)&v19 + 1) + 8 * i) fromPolicies:v9 error:a5];

            if (!v16)
            {

              int64_t v17 = -1;
              goto LABEL_18;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      if ([v10 acceptWithPolicies:v9 error:a5]) {
        int64_t v17 = 1;
      }
      else {
        int64_t v17 = -1;
      }
    }
    else
    {
      int64_t v17 = 0;
    }
LABEL_18:
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

+ (id)logCategory
{
  if (_MergedGlobals_74 != -1) {
    dispatch_once(&_MergedGlobals_74, &__block_literal_global_45);
  }
  v2 = (void *)qword_1EB4EEE08;
  return v2;
}

uint64_t __31__HMFMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Messaging.Filter", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEE08;
  qword_1EB4EEE08 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)canInitWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMFMessageFilter)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)acceptWithPolicies:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  id v8 = NSString;
  id v9 = NSStringFromSelector(a2);
  id v10 = [v8 stringWithFormat:@"%@ is unavailable", v9];
  id v11 = [v6 exceptionWithName:v7 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (NSSet)policyClasses
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (HMFMessageFilter)initWithMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure(@"message");
  }
  id v5 = v4;
  if ([(id)objc_opt_class() canInitWithMessage:v4])
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFMessageFilter;
    uint64_t v6 = [(HMFMessageFilter *)&v17 init];
    if (v6)
    {
      uint64_t v7 = (void *)[v5 mutableCopy];
      [v7 setName:&stru_1EEF0F5E0];
      [v7 setMessagePayload:0];
      [v7 setResponseHandler:0];
      uint64_t v8 = [v7 copy];

      message = v6->_message;
      v6->_message = (HMFMessage *)v8;
    }
    id v10 = v6;
    id v11 = v10;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A87A0]();
    id v10 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier(v10);
      long long v15 = [v5 shortDescription];
      *(_DWORD *)buf = 138543618;
      long long v19 = v14;
      __int16 v20 = 2112;
      long long v21 = v15;
      _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Message is not supported: %@", buf, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFMessageFilter *)self message];
  id v5 = [(HMFAttributeDescription *)v3 initWithName:@"Message" value:v4 options:1 formatter:0];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (id)logIdentifier
{
  v2 = [(HMFMessageFilter *)self message];
  uint64_t v3 = [v2 name];

  return v3;
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end