@interface HUSafetyAndSecuritySettingsNotificationsItemModule
+ (id)_safetyAndSecurityDeviceItemComparator;
- (HFItemProvider)safetyAndSecurityDeviceItemProvider;
- (HMHome)home;
- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3;
- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)_buildItemProviders;
- (void)setHome:(id)a3;
- (void)setSafetyAndSecurityDeviceItemProvider:(id)a3;
@end

@implementation HUSafetyAndSecuritySettingsNotificationsItemModule

- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUSafetyAndSecuritySettingsNotificationsItemModule.m", 27, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUSafetyAndSecuritySettingsNotificationsItemModule;
  v9 = [(HFItemModule *)&v13 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    [(HUSafetyAndSecuritySettingsNotificationsItemModule *)v10 _buildItemProviders];
  }

  return v10;
}

- (HUSafetyAndSecuritySettingsNotificationsItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSafetyAndSecuritySettingsNotificationsItemModule.m", 39, @"%s is unavailable; use %@ instead",
    "-[HUSafetyAndSecuritySettingsNotificationsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

+ (id)_safetyAndSecurityDeviceItemComparator
{
  return &__block_literal_global_179;
}

uint64_t __92__HUSafetyAndSecuritySettingsNotificationsItemModule__safetyAndSecurityDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F69220];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 defaultItemComparator];
  uint64_t v8 = ((uint64_t (**)(void, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUSafetyAndSecuritySettingsNotificationsItemModule *)self safetyAndSecurityDeviceItemProvider];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"notificationsSection"];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUSafetyAndSecuritySettingsNotificationsSection_Header", @"HUSafetyAndSecuritySettingsNotificationsSection_Header", 1);
  [v6 setHeaderTitle:v7];

  uint64_t v8 = objc_opt_new();
  v9 = [(HUSafetyAndSecuritySettingsNotificationsItemModule *)self safetyAndSecurityDeviceItemProvider];
  v10 = [v9 items];
  v11 = [v10 allObjects];
  objc_msgSend(v8, "na_safeAddObjectsFromArray:", v11);

  v12 = (void *)[v8 copy];
  objc_super v13 = [(id)objc_opt_class() _safetyAndSecurityDeviceItemComparator];
  v14 = [v12 sortedArrayUsingComparator:v13];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__HUSafetyAndSecuritySettingsNotificationsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v18[3] = &unk_1E6386108;
  id v19 = v4;
  id v15 = v4;
  v16 = objc_msgSend(v14, "na_filter:", v18);
  [v6 setItems:v16];

  [v5 addObject:v6];

  return v5;
}

uint64_t __86__HUSafetyAndSecuritySettingsNotificationsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F69288]);
  id v4 = [(HUSafetyAndSecuritySettingsNotificationsItemModule *)self home];
  id v6 = (id)[v3 initWithHome:v4];

  [v6 setFilter:&__block_literal_global_27_1];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v6 transformationBlock:&__block_literal_global_282];
  [(HUSafetyAndSecuritySettingsNotificationsItemModule *)self setSafetyAndSecurityDeviceItemProvider:v5];
}

uint64_t __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F1AD86A8]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 accessories];
    uint64_t v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_277_0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v2 supportsAudioAnalysis];
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory")) {
    uint64_t v3 = [v2 supportsAudioAnalysis];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F696A8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_4;
  v7[3] = &unk_1E638E0F0;
  id v8 = v2;
  id v4 = v2;
  id v5 = (void *)[v3 initWithSourceItem:v4 transformationBlock:v7];

  return v5;
}

id __73__HUSafetyAndSecuritySettingsNotificationsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 32) accessories];
  id v8 = [v7 anyObject];
  if ([v8 conformsToProtocol:&unk_1F1AD8EB0]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = objc_msgSend(v10, "hf_userNotificationSettings");

  LODWORD(v10) = [v11 areNotificationsEnabled];
  if (v10) {
    v12 = @"HUSafetyAndSecuritySettingsNotifications_On";
  }
  else {
    v12 = @"HUSafetyAndSecuritySettingsNotifications_Off";
  }
  objc_super v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFItemProvider)safetyAndSecurityDeviceItemProvider
{
  return self->_safetyAndSecurityDeviceItemProvider;
}

- (void)setSafetyAndSecurityDeviceItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyAndSecurityDeviceItemProvider, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end