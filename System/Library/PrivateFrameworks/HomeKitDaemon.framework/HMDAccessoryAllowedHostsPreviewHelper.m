@interface HMDAccessoryAllowedHostsPreviewHelper
+ (id)helperForHome:(id)a3;
- (id)attributeDescriptions;
- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3;
- (void)fetchAllowedHostsForAccessory:(id)a3 completion:(id)a4;
@end

@implementation HMDAccessoryAllowedHostsPreviewHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v5 = (void *)[v3 initWithName:@"home" value:WeakRetained];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)watchedAccessoryIdentifiersForFirewallRuleManager:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = (HMDNetworkRouterFirewallRuleManager *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  if (WeakRetained && self->_firewallRuleManager == v4)
  {
    os_unfair_lock_lock_with_options();
    v7 = self->_expires;
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      [(NSDate *)v7 timeIntervalSinceNow];
      if (v8 <= 0.0)
      {
        id v9 = objc_loadWeakRetained((id *)&self->_home);
        if (v9)
        {
          os_unfair_lock_lock_with_options();
          objc_getAssociatedObject(v9, &HMDAccessoryAllowedHostsPreviewHelperForHome);
          v10 = (HMDAccessoryAllowedHostsPreviewHelper *)objc_claimAutoreleasedReturnValue();
          if (v10 == self) {
            objc_setAssociatedObject(v9, &HMDAccessoryAllowedHostsPreviewHelperForHome, 0, (void *)1);
          }

          os_unfair_lock_unlock((os_unfair_lock_t)&HMDAccessoryAllowedHostsPreviewHelperForHome);
        }
      }
    }
    id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = objc_msgSend(WeakRetained, "accessories", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v16 supportsNetworkProtection])
          {
            v17 = [v16 metadataIdentifier];
            if (v17) {
              [v11 addObject:v17];
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    v6 = (void *)[v11 copy];
  }
  else
  {
    v6 = [MEMORY[0x263EFFA08] set];
  }

  return v6;
}

- (void)fetchAllowedHostsForAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 metadataIdentifier];
  if (v8)
  {
    id v9 = [MEMORY[0x263F42608] sharedPreferences];
    v10 = [v9 preferenceForKey:@"engraveRulePreviewCacheTimeout"];
    id v11 = [v10 numberValue];
    double v12 = (double)[v11 integerValue];

    uint64_t v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v12];
    os_unfair_lock_lock_with_options();
    if (!self->_expires || objc_msgSend(v13, "compare:") == 1) {
      objc_storeStrong((id *)&self->_expires, v13);
    }
    os_unfair_lock_unlock(&self->_lock);
    firewallRuleManager = self->_firewallRuleManager;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke;
    v16[3] = &unk_264A2E788;
    id v18 = v7;
    v16[4] = self;
    id v17 = v8;
    [(HMDNetworkRouterFirewallRuleManager *)firewallRuleManager startupForClient:self completion:v16];
  }
  else
  {
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

void __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v5 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke_2;
    v6[3] = &unk_264A253E8;
    id v7 = *(id *)(a1 + 48);
    [v4 fetchRulesForAccessories:v5 completion:v6];
  }
}

void __82__HMDAccessoryAllowedHostsPreviewHelper_fetchAllowedHostsForAccessory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  v5 = [a2 anyObject];
  if (v5)
  {
    id v6 = +[HMDAccessoryAllowedHost allowedHostsFromFirewallRuleConfiguration:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)helperForHome:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock_with_options();
  objc_getAssociatedObject(v3, &HMDAccessoryAllowedHostsPreviewHelperForHome);
  v4 = (HMDAccessoryAllowedHostsPreviewHelper *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [HMDAccessoryAllowedHostsPreviewHelper alloc];
    v5 = +[HMDNetworkRouterFirewallRuleManager sharedInstance];
    id v6 = v3;
    id v7 = v5;
    if (v4)
    {
      v10.receiver = v4;
      v10.super_class = (Class)HMDAccessoryAllowedHostsPreviewHelper;
      double v8 = objc_msgSendSuper2(&v10, sel_init);
      v4 = (HMDAccessoryAllowedHostsPreviewHelper *)v8;
      if (v8)
      {
        objc_storeWeak(v8 + 1, v6);
        objc_storeStrong((id *)&v4->_firewallRuleManager, v5);
      }
    }

    objc_setAssociatedObject(v6, &HMDAccessoryAllowedHostsPreviewHelperForHome, v4, (void *)1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDAccessoryAllowedHostsPreviewHelperForHome);

  return v4;
}

@end