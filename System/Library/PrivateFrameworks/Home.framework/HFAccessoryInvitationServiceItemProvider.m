@interface HFAccessoryInvitationServiceItemProvider
- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4;
- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 user:(id)a4;
- (HMUser)user;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
@end

@implementation HFAccessoryInvitationServiceItemProvider

- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_user_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryInvitationServiceItemProvider.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryInvitationServiceItemProvider initWithHome:serviceTypes:]",
    v7);

  return 0;
}

- (HFAccessoryInvitationServiceItemProvider)initWithHome:(id)a3 user:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  v8 = [(HFServiceItemProvider *)&v11 initWithHome:a3 serviceTypes:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_user, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFServiceItemProvider *)self home];
  v6 = [(HFAccessoryInvitationServiceItemProvider *)self user];
  id v7 = (void *)[v4 initWithHome:v5 user:v6];

  return v7;
}

- (id)filter
{
  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  v3 = [(HFServiceItemProvider *)&v18 filter];
  id v4 = [(HFAccessoryInvitationServiceItemProvider *)self user];
  v5 = [v4 pendingAccessoryInvitations];
  v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_192);

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke_2;
  v15 = &unk_26409A308;
  id v16 = v6;
  id v17 = v3;
  id v7 = v6;
  id v8 = v3;
  v9 = _Block_copy(&v12);
  v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

id __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [v2 accessory];
  }

  return v3;
}

uint64_t __50__HFAccessoryInvitationServiceItemProvider_filter__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 && !(*(unsigned int (**)(uint64_t, id))(v7 + 16))(v7, v4))
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [v6 accessory];
    uint64_t v10 = [v8 containsObject:v9];
  }
  return v10;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryInvitationServiceItemProvider;
  id v2 = [(HFServiceItemProvider *)&v5 invalidationReasons];
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