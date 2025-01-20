@interface HMDHelperExternalProtocolImpl
- (HMDHelperExternalProtocolImpl)init;
- (id)createAFSecurityConnection;
@end

@implementation HMDHelperExternalProtocolImpl

- (id)createAFSecurityConnection
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4E560]);
  return v2;
}

- (HMDHelperExternalProtocolImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDHelperExternalProtocolImpl;
  return [(HMDHelperExternalProtocolImpl *)&v3 init];
}

@end