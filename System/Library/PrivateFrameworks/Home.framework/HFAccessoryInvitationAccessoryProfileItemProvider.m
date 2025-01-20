@interface HFAccessoryInvitationAccessoryProfileItemProvider
- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3;
- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3 user:(id)a4;
- (HMUser)user;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
@end

@implementation HFAccessoryInvitationAccessoryProfileItemProvider

- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_user_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryInvitationAccessoryProfileItemProvider.m", 28, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryInvitationAccessoryProfileItemProvider initWithHome:]",
    v6);

  return 0;
}

- (HFAccessoryInvitationAccessoryProfileItemProvider)initWithHome:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryInvitationAccessoryProfileItemProvider;
  v8 = [(HFAccessoryProfileItemProvider *)&v15 initWithHome:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a4);
    objc_initWeak(&location, v9);
    uint64_t v12 = MEMORY[0x263EF8330];
    objc_copyWeak(&v13, &location);
    v10 = [(HFAccessoryProfileItemProvider *)v9 filterOptions];
    [v10 setByFilter:&v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v9;
}

uint64_t __71__HFAccessoryInvitationAccessoryProfileItemProvider_initWithHome_user___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained user];
  id v6 = [v5 pendingAccessoryInvitations];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_157);

  v8 = [v3 accessory];

  uint64_t v9 = [v7 containsObject:v8];
  return v9;
}

id __71__HFAccessoryInvitationAccessoryProfileItemProvider_initWithHome_user___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 accessory];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFAccessoryProfileItemProvider *)self home];
  id v6 = [(HFAccessoryInvitationAccessoryProfileItemProvider *)self user];
  id v7 = (void *)[v4 initWithHome:v5 user:v6];

  return v7;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryInvitationAccessoryProfileItemProvider;
  id v2 = [(HFAccessoryProfileItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"pendingAccessories"];

  return v3;
}

- (HMUser)user
{
  return self->_user;
}

- (void).cxx_destruct
{
}

@end