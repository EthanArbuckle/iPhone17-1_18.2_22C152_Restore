@interface HMDPendingInvitedUserMessagePolicy
- (HMDHomeManager)homeManager;
- (HMDPendingInvitedUserMessagePolicy)init;
- (HMDPendingInvitedUserMessagePolicy)initWithHomeManager:(id)a3;
@end

@implementation HMDPendingInvitedUserMessagePolicy

- (void).cxx_destruct
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (HMDPendingInvitedUserMessagePolicy)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDPendingInvitedUserMessagePolicy;
  v5 = [(HMDPendingInvitedUserMessagePolicy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_homeManager, v4);
  }

  return v6;
}

- (HMDPendingInvitedUserMessagePolicy)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end