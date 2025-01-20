@interface HUUserNotificationTopicServiceListModule
+ (id)_createTransformItemForItem:(id)a3 notificationSettingsProvider:(id)a4;
- (HFTransformItemProvider)nativeMatterAccessoryItemProvider;
- (HFTransformItemProvider)transformCameraItemProvider;
- (HFTransformItemProvider)transformServiceItemProvider;
- (HFUserNotificationServiceTopic)topic;
- (HMHome)home;
- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3;
- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3 home:(id)a4 topic:(id)a5;
- (id)buildNativeMatterAccessoryItemProvider;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)serviceLikeItemForItem:(id)a3;
- (void)_buildItemProviders;
@end

@implementation HUUserNotificationTopicServiceListModule

- (id)buildNativeMatterAccessoryItemProvider
{
  v2 = self;
  id v3 = HUUserNotificationTopicServiceListModule.buildNativeMatterAccessoryItemProvider()();

  return v3;
}

- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_topic_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUserNotificationTopicServiceListModule.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUUserNotificationTopicServiceListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUUserNotificationTopicServiceListModule)initWithItemUpdater:(id)a3 home:(id)a4 topic:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUUserNotificationTopicServiceListModule;
  v11 = [(HFItemModule *)&v14 initWithItemUpdater:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    objc_storeStrong((id *)&v12->_topic, a5);
    [(HUUserNotificationTopicServiceListModule *)v12 _buildItemProviders];
  }

  return v12;
}

+ (id)_createTransformItemForItem:(id)a3 notificationSettingsProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F696A8]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__HUUserNotificationTopicServiceListModule__createTransformItemForItem_notificationSettingsProvider___block_invoke;
  v12[3] = &unk_1E638B630;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = (void *)[v7 initWithSourceItem:v8 transformationBlock:v12];

  return v10;
}

id __101__HUUserNotificationTopicServiceListModule__createTransformItemForItem_notificationSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  v4 = objc_msgSend(*(id *)(a1 + 32), "hf_userNotificationSettings");
  int v5 = [v4 areNotificationsEnabled];

  if (v5) {
    id v6 = @"HUNotificationTopicServiceNotificationsEnabled";
  }
  else {
    id v6 = @"HUNotificationTopicServiceNotificationsDisabled";
  }
  id v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  uint64_t v8 = *MEMORY[0x1E4F68980];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  objc_opt_class();
  id v9 = *(id *)(a1 + 40);
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = [v11 accessory];
    id v13 = [v12 category];
    id v14 = [v13 categoryType];
    int v15 = [v14 isEqual:*MEMORY[0x1E4F2C1D8]];
    v16 = @"VideoDoorbell";
    if (v15) {
      v16 = @"IPCamera";
    }
    v17 = v16;

    v18 = [NSString stringWithFormat:@"HUUserNotificationTopicSubtitle_%@", v17];

    v19 = _HULocalizedStringWithDefaultValue(v18, v18, 1);

    [v3 setObject:v19 forKeyedSubscript:@"HUUserNotificationTopicSubtitleResultKey"];
    v20 = (void *)MEMORY[0x1E4F68F98];
    v21 = [v11 profile];
    if ([v20 shouldReportNotificationsAsDisabledForProfile:v21]) {
      v22 = @"HUNotificationTopicServiceNotificationsDisabled";
    }
    else {
      v22 = @"HUNotificationTopicServiceNotificationsEnabled";
    }
    v23 = _HULocalizedStringWithDefaultValue(v22, v22, 1);
    [v3 setObject:v23 forKeyedSubscript:v8];
  }

  return v3;
}

- (void)_buildItemProviders
{
  objc_initWeak(&location, self);
  id v3 = [(HUUserNotificationTopicServiceListModule *)self topic];
  id v4 = objc_alloc(MEMORY[0x1E4F69558]);
  int v5 = [(HUUserNotificationTopicServiceListModule *)self home];
  id v6 = (void *)[v4 initWithHome:v5];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke;
  v30[3] = &unk_1E63862F8;
  objc_copyWeak(&v31, &location);
  [v6 setFilter:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_2;
  v28[3] = &unk_1E6387268;
  id v7 = v3;
  id v29 = v7;
  [v6 setSourceServiceGenerator:v28];
  id v8 = objc_alloc(MEMORY[0x1E4F696B0]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_3;
  v26[3] = &unk_1E638B658;
  objc_copyWeak(&v27, &location);
  id v9 = (HFTransformItemProvider *)[v8 initWithSourceProvider:v6 transformationBlock:v26];
  transformServiceItemProvider = self->_transformServiceItemProvider;
  self->_transformServiceItemProvider = v9;

  if ([v7 isMatter])
  {
    id v11 = [(HUUserNotificationTopicServiceListModule *)self buildNativeMatterAccessoryItemProvider];
    nativeMatterAccessoryItemProvider = self->_nativeMatterAccessoryItemProvider;
    self->_nativeMatterAccessoryItemProvider = v11;
  }
  id v13 = [v7 accessoryCategoryTypes];
  int v14 = [v13 containsObject:*MEMORY[0x1E4F2C1D8]];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F68FA0]);
    v16 = [(HUUserNotificationTopicServiceListModule *)self home];
    v17 = (void *)[v15 initWithHome:v16];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_4;
    v23[3] = &unk_1E638B680;
    objc_copyWeak(&v25, &location);
    id v24 = v7;
    [v17 setFilter:v23];
    id v18 = objc_alloc(MEMORY[0x1E4F696B0]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_5;
    v21[3] = &unk_1E638B6A8;
    objc_copyWeak(&v22, &location);
    v19 = (HFTransformItemProvider *)[v18 initWithSourceProvider:v17 transformationBlock:v21];
    transformCameraItemProvider = self->_transformCameraItemProvider;
    self->_transformCameraItemProvider = v19;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

BOOL __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ObjectClassIsN.isa, v5);
  }

  return v7 != 0;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = objc_msgSend(a2, "hf_servicesAffectedByServiceTopic:", *(void *)(a1 + 32));
  id v5 = [v3 setWithArray:v4];
  id v6 = [v2 futureWithResult:v5];

  return v6;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = objc_opt_class();
  id v6 = [v3 service];
  id v7 = [v5 _createTransformItemForItem:v3 notificationSettingsProvider:v6];

  return v7;
}

uint64_t __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = *(void **)(a1 + 32);
  id v9 = [WeakRetained home];
  id v10 = objc_msgSend(v9, "hf_userNotificationTopicForCameraProfile:", v7);
  id v11 = v8;
  id v12 = v10;
  if (v11 == v12)
  {
    uint64_t v13 = 1;
  }
  else if (v11)
  {
    uint64_t v13 = [v11 isEqual:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id __63__HUUserNotificationTopicServiceListModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = objc_opt_class();
  id v6 = [v3 profile];
  id v7 = [v5 _createTransformItemForItem:v3 notificationSettingsProvider:v6];

  return v7;
}

- (id)itemProviders
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(HUUserNotificationTopicServiceListModule *)self transformServiceItemProvider];
  id v5 = [v3 setWithObject:v4];

  id v6 = [(HUUserNotificationTopicServiceListModule *)self nativeMatterAccessoryItemProvider];
  objc_msgSend(v5, "na_safeAddObject:", v6);

  id v7 = [(HUUserNotificationTopicServiceListModule *)self transformCameraItemProvider];
  objc_msgSend(v5, "na_safeAddObject:", v7);

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"NotificationSettings"];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUNotificationTopicServiceListSectionHeaderTitle", @"HUNotificationTopicServiceListSectionHeaderTitle", 1);
  [v6 setHeaderTitle:v7];

  id v8 = [(HFItemModule *)self allItems];
  id v9 = [v8 allObjects];
  id v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
  id v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11];

  id v12 = (void *)MEMORY[0x1E4F69220];
  v16[0] = v6;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  int v14 = [v12 filterSections:v13 toDisplayedItems:v5];

  return v14;
}

- (id)serviceLikeItemForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 sourceItem];
  if ([v7 conformsToProtocol:&unk_1F1A3D558]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (HFTransformItemProvider)transformServiceItemProvider
{
  return self->_transformServiceItemProvider;
}

- (HFTransformItemProvider)nativeMatterAccessoryItemProvider
{
  return self->_nativeMatterAccessoryItemProvider;
}

- (HFTransformItemProvider)transformCameraItemProvider
{
  return self->_transformCameraItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformCameraItemProvider, 0);
  objc_storeStrong((id *)&self->_nativeMatterAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_transformServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end