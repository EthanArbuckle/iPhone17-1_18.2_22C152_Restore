@interface HMDIDSMessageContext
- (HMDIDSMessageContext)init;
- (HMDIDSMessageContext)initWithIdentifier:(id)a3 destination:(id)a4 userInfo:(id)a5;
- (HMFMessageDestination)destination;
- (NSDictionary)userInfo;
- (NSUUID)identifier;
@end

@implementation HMDIDSMessageContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDestination)destination
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDIDSMessageContext)initWithIdentifier:(id)a3 destination:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = 0;
  if (v8 && v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDIDSMessageContext;
    v12 = [(HMDIDSMessageContext *)&v18 init];
    if (v12)
    {
      uint64_t v13 = [v8 copy];
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v13;

      objc_storeStrong((id *)&v12->_destination, a4);
      uint64_t v15 = [v10 copy];
      userInfo = v12->_userInfo;
      v12->_userInfo = (NSDictionary *)v15;
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (HMDIDSMessageContext)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end