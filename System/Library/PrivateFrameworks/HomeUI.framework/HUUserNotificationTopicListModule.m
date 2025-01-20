@interface HUUserNotificationTopicListModule
+ (NSString)sectionID;
- (HFItem)bridgesItem;
- (HFItem)networkRoutersListItem;
- (HFItem)speakerSettingsItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFUserNotificationServiceTopicItemProvider)notificationTopicItemProvider;
- (HMHome)home;
- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3;
- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)topicForItem:(id)a3;
- (void)_buildItemProviders;
- (void)setBridgesItem:(id)a3;
- (void)setNetworkRoutersListItem:(id)a3;
- (void)setSpeakerSettingsItem:(id)a3;
@end

@implementation HUUserNotificationTopicListModule

+ (NSString)sectionID
{
  return (NSString *)@"notificationTopics";
}

- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUserNotificationTopicListModule.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUUserNotificationTopicListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUUserNotificationTopicListModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUUserNotificationTopicListModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    [(HUUserNotificationTopicListModule *)v9 _buildItemProviders];
  }

  return v9;
}

- (void)_buildItemProviders
{
  v3 = [HUBridgeListItem alloc];
  v4 = [(HUUserNotificationTopicListModule *)self home];
  v5 = [(HUBridgeListItem *)v3 initWithHome:v4];
  [(HUUserNotificationTopicListModule *)self setBridgesItem:v5];

  v6 = [HUNetworkRouterListItem alloc];
  id v7 = [(HUUserNotificationTopicListModule *)self home];
  v8 = [(HUNetworkRouterListItem *)v6 initWithHome:v7];
  [(HUUserNotificationTopicListModule *)self setNetworkRoutersListItem:v8];

  v9 = [HUMediaAccessControlItem alloc];
  v10 = [(HUUserNotificationTopicListModule *)self home];
  objc_super v11 = [(HUMediaAccessControlItem *)v9 initWithHome:v10];
  [(HUUserNotificationTopicListModule *)self setSpeakerSettingsItem:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [(HUUserNotificationTopicListModule *)self bridgesItem];
  v15 = [(HUUserNotificationTopicListModule *)self networkRoutersListItem];
  v16 = [(HUUserNotificationTopicListModule *)self speakerSettingsItem];
  v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, 0);
  v18 = (HFStaticItemProvider *)[v12 initWithItems:v17];
  staticItemProvider = self->_staticItemProvider;
  self->_staticItemProvider = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F69740]);
  id v23 = [(HUUserNotificationTopicListModule *)self home];
  v21 = (HFUserNotificationServiceTopicItemProvider *)[v20 initWithHome:v23];
  notificationTopicItemProvider = self->_notificationTopicItemProvider;
  self->_notificationTopicItemProvider = v21;
}

- (id)itemProviders
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(HUUserNotificationTopicListModule *)self notificationTopicItemProvider];
  v5 = [v3 setWithObject:v4];

  v6 = [(HUUserNotificationTopicListModule *)self staticItemProvider];
  objc_msgSend(v5, "na_safeAddObject:", v6);

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUUserNotificationTopicListModule *)self notificationTopicItemProvider];
  v6 = [v5 items];
  id v7 = [v6 allObjects];

  v8 = [(HUUserNotificationTopicListModule *)self staticItemProvider];
  v9 = [v8 items];
  v10 = [v9 allObjects];
  objc_super v11 = [v7 arrayByAddingObjectsFromArray:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F692E8]);
  v13 = [(id)objc_opt_class() sectionID];
  v14 = (void *)[v12 initWithIdentifier:v13];

  v15 = [MEMORY[0x1E4F69220] defaultItemComparator];
  v16 = [v11 sortedArrayUsingComparator:v15];
  [v14 setItems:v16];

  v17 = (void *)MEMORY[0x1E4F69220];
  v21[0] = v14;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v19 = [v17 filterSections:v18 toDisplayedItems:v4];

  return v19;
}

- (id)topicForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  id v7 = 0;
LABEL_8:

  v10 = [v7 topic];

  return v10;
}

- (HFItem)bridgesItem
{
  return self->_bridgesItem;
}

- (void)setBridgesItem:(id)a3
{
}

- (HFItem)networkRoutersListItem
{
  return self->_networkRoutersListItem;
}

- (void)setNetworkRoutersListItem:(id)a3
{
}

- (HFItem)speakerSettingsItem
{
  return self->_speakerSettingsItem;
}

- (void)setSpeakerSettingsItem:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopicItemProvider)notificationTopicItemProvider
{
  return self->_notificationTopicItemProvider;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_notificationTopicItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_speakerSettingsItem, 0);
  objc_storeStrong((id *)&self->_networkRoutersListItem, 0);

  objc_storeStrong((id *)&self->_bridgesItem, 0);
}

@end