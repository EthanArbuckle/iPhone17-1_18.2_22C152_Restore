@interface HUAnnounceNotificationSettingsItemProvider
- (HMHome)home;
- (HMUser)user;
- (HUAnnounceNotificationSettingsItemProvider)init;
- (HUAnnounceNotificationSettingsItemProvider)initWithHome:(id)a3;
- (NSMutableSet)items;
- (id)_notificationModes;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setHome:(id)a3;
@end

@implementation HUAnnounceNotificationSettingsItemProvider

- (HUAnnounceNotificationSettingsItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceNotificationSettingsItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;
  }
  return v7;
}

- (HUAnnounceNotificationSettingsItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithUser_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAnnounceNotificationSettingsItemProvider.m", 98, @"%s is unavailable; use %@ instead",
    "-[HUAnnounceNotificationSettingsItemProvider init]",
    v5);

  return 0;
}

- (HMUser)user
{
  v2 = [(HUAnnounceNotificationSettingsItemProvider *)self home];
  v3 = [v2 currentUser];

  return (HMUser *)v3;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HUAnnounceNotificationSettingsItemProvider *)self _notificationModes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1E6386EF8;
  objc_copyWeak(&v10, &location);
  v4 = [(HFItemProvider *)self reloadItemsWithObjects:v3 keyAdaptor:&__block_literal_global_32 itemAdaptor:&__block_literal_global_57_0 filter:0 itemMap:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_5;
  v7[3] = &unk_1E6385B38;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v5;
}

id __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 notificationMode];

  return [v2 numberWithUnsignedInteger:v3];
}

HUAnnounceNotificationSettingsItem *__57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained items];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6386108;
  id v6 = v3;
  id v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (HUAnnounceNotificationSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = [HUAnnounceNotificationSettingsItem alloc];
    uint64_t v9 = [v6 unsignedIntegerValue];
    id v10 = [WeakRetained user];
    v7 = [(HUAnnounceNotificationSettingsItem *)v8 initWithNotificationMode:v9 user:v10];
  }

  return v7;
}

BOOL __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 notificationMode];
    BOOL v8 = v7 == [*(id *)(a1 + 32) unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained items];
  BOOL v8 = [v3 removedItems];
  [v7 minusSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUAnnounceNotificationSettingsItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F68700]];

  return v3;
}

- (id)_notificationModes
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:&unk_1F19B3BC0];
  id v4 = [MEMORY[0x1E4F69250] sharedDispatcher];
  [v4 authorizationStatus];

  if (HFLocationServicesAvailableForAuthorizationStatus())
  {
    [v3 addObject:&unk_1F19B3BD8];
    objc_super v5 = [(HUAnnounceNotificationSettingsItemProvider *)self home];
    id v6 = [(HUAnnounceNotificationSettingsItemProvider *)self user];
    uint64_t v7 = [v5 homeAccessControlForUser:v6];
    int v8 = [v7 isRemoteAccessAllowed];

    if (v8) {
      [v3 addObject:&unk_1F19B3BF0];
    }
  }
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end