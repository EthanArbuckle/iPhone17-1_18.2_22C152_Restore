@interface HUBridgeListItemManager
+ (id)residentDeviceItemComparator;
- (BOOL)isBridgeItem:(id)a3;
- (BOOL)isResidentDeviceItem:(id)a3;
- (HFBridgeItemProvider)bridgeItemProvider;
- (HFResidentDeviceItemProvider)residentDeviceItemProvider;
- (HMHome)overrideHome;
- (HUBridgeListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUBridgeListItemManager)initWithHome:(id)a3 delegate:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (id)bridgeItemForAccessory:(id)a3;
- (void)setBridgeItemProvider:(id)a3;
- (void)setResidentDeviceItemProvider:(id)a3;
@end

@implementation HUBridgeListItemManager

- (HUBridgeListItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUBridgeListItemManager.m", 25, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUBridgeListItemManager;
  v10 = [(HFItemManager *)&v14 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_overrideHome, a3);
  }

  return v11;
}

- (HUBridgeListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBridgeListItemManager.m", 34, @"%s is unavailable; use %@ instead",
    "-[HUBridgeListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isBridgeItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUBridgeListItemManager *)self bridgeItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)isResidentDeviceItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUBridgeListItemManager *)self residentDeviceItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)bridgeItemForAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HUBridgeListItemManager *)self bridgeItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HUBridgeListItemManager_bridgeItemForAccessory___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __50__HUBridgeListItemManager_bridgeItemForAccessory___block_invoke(uint64_t a1, void *a2)
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

  id v7 = [v6 accessory];
  uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F69460];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithHome:v5];
  [(HUBridgeListItemManager *)self setResidentDeviceItemProvider:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F68F30]) initWithHome:v5];
  [(HUBridgeListItemManager *)self setBridgeItemProvider:v7];

  uint64_t v8 = [(HUBridgeListItemManager *)self residentDeviceItemProvider];
  v12[0] = v8;
  id v9 = [(HUBridgeListItemManager *)self bridgeItemProvider];
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUBridgeAndResidentDeviceHubSectionIdentifier"];
  id v7 = [(HUBridgeListItemManager *)self residentDeviceItemProvider];
  uint64_t v8 = [v7 items];
  id v9 = [v8 allObjects];
  v10 = [(id)objc_opt_class() residentDeviceItemComparator];
  id v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11 filteringToDisplayedItems:v4];

  v12 = _HULocalizedStringWithDefaultValue(@"HUBridgeAndResidentListHomeHubSectionTitle", @"HUBridgeAndResidentListHomeHubSectionTitle", 1);
  [v6 setHeaderTitle:v12];

  v13 = _HULocalizedStringWithDefaultValue(@"HUBridgeAndResidentListHomeHubSectionFooter", @"HUBridgeAndResidentListHomeHubSectionFooter", 1);
  [v6 setFooterTitle:v13];

  [v5 addObject:v6];
  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUBridgeAndResidentDeviceBridgeSectionIdentifier"];
  v15 = [(HUBridgeListItemManager *)self bridgeItemProvider];
  v16 = [v15 items];
  [v14 setItemsUsingDefaultSortComparator:v16];

  v17 = _HULocalizedStringWithDefaultValue(@"HUBridgeAndResidentListBridgesSectionTitle", @"HUBridgeAndResidentListBridgesSectionTitle", 1);
  [v14 setHeaderTitle:v17];

  [v5 addObject:v14];
  v18 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUBridgeListItemManager;
  id v3 = [(HFItemManager *)&v5 _itemsToHideInSet:a3];
  return 0;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUBridgeListItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

+ (id)residentDeviceItemComparator
{
  return &__block_literal_global_294;
}

uint64_t __55__HUBridgeListItemManager_residentDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v7;
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_7:
    id v9 = 0;
  }

  v12 = [v9 residentDevice];
  char v13 = [v12 status];

  if ((v13 & 2) != 0)
  {
    uint64_t v23 = -1;
    goto LABEL_21;
  }
  uint64_t v14 = objc_opt_class();
  id v15 = v5;
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    v17 = v15;
    if (v16) {
      goto LABEL_16;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];
  }
  v17 = 0;
LABEL_16:

  v20 = [v17 residentDevice];
  char v21 = [v20 status];

  if ((v21 & 2) != 0)
  {
    uint64_t v23 = 1;
  }
  else
  {
    v22 = [MEMORY[0x1E4F69220] defaultItemComparator];
    uint64_t v23 = ((uint64_t (**)(void, id, id))v22)[2](v22, v7, v15);
  }
LABEL_21:

  return v23;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFBridgeItemProvider)bridgeItemProvider
{
  return self->_bridgeItemProvider;
}

- (void)setBridgeItemProvider:(id)a3
{
}

- (HFResidentDeviceItemProvider)residentDeviceItemProvider
{
  return self->_residentDeviceItemProvider;
}

- (void)setResidentDeviceItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_bridgeItemProvider, 0);

  objc_storeStrong((id *)&self->_overrideHome, 0);
}

@end