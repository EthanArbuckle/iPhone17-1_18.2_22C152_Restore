@interface HUUtilityOnboardingConnectionItemManager
- (HUUtilityOnboardingConnectionItemManager)initWithDelegate:(id)a3 data:(id)a4;
- (NSDictionary)data;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)setData:(id)a3;
@end

@implementation HUUtilityOnboardingConnectionItemManager

- (HUUtilityOnboardingConnectionItemManager)initWithDelegate:(id)a3 data:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUUtilityOnboardingConnectionItemManager;
  v7 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  v8 = v7;
  if (v7)
  {
    [(HUUtilityOnboardingConnectionItemManager *)v7 setData:v6];
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2080;
      v15 = "-[HUUtilityOnboardingConnectionItemManager initWithDelegate:data:]";
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s intialized item manager", buf, 0x16u);
    }
  }
  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HUUtilityOnboardingConnectionItemManager *)self data];
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2080;
    v22 = "-[HUUtilityOnboardingConnectionItemManager _buildItemProvidersForHome:]";
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s  data %@", buf, 0x20u);
  }
  v7 = objc_opt_new();
  if (a3)
  {
    v8 = [(NSDictionary *)self->_data objectForKeyedSubscript:@"homeName"];
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F68AB8]);

    v9 = [(NSDictionary *)self->_data objectForKeyedSubscript:@"utilityName"];
    objc_msgSend(v7, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E4F68990]);

    objc_msgSend(v7, "na_safeSetObject:forKey:", @"Home.OnboardingView.Utility.SubscriptionInfo", *MEMORY[0x1E4F68928]);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F695C0]);
  objc_super v11 = (void *)[v7 copy];
  v12 = (void *)[v10 initWithResults:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F695C8]);
  __int16 v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  v15 = (void *)[v13 initWithItems:v14];

  v18 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"subscriptionIdentifier"];
  v5 = [(HFItemManager *)self allItems];
  id v6 = [v5 allObjects];
  [v4 setItems:v6];

  v9[0] = v4;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end