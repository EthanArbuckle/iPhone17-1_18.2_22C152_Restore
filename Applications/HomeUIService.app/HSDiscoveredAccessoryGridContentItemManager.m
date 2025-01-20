@interface HSDiscoveredAccessoryGridContentItemManager
+ (id)_discoveredAccessoryItemComparator;
- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome;
- (HFAccessoryBrowsingManager)accessoryBrowsingManager;
- (HSDiscoveredAccessoryGridContentItemManager)initWithAccessoryBrowsingManager:(id)a3 delegate:(id)a4 discoveredAccessoryFilter:(id)a5;
- (HSDiscoveredAccessoryGridContentItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_reloadDiscoveredAccessoryItemProviderWithSenderSelector:(SEL)a3;
- (void)_unregisterForExternalUpdates;
- (void)accessoryBrowsingManager:(id)a3 didFindNewAccessory:(id)a4;
- (void)accessoryBrowsingManager:(id)a3 didFindNewSharingDevice:(id)a4;
- (void)accessoryBrowsingManager:(id)a3 didRemoveNewAccessory:(id)a4;
- (void)accessoryBrowsingManager:(id)a3 didRemoveNewSharingDevice:(id)a4;
@end

@implementation HSDiscoveredAccessoryGridContentItemManager

- (HSDiscoveredAccessoryGridContentItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  v7 = +[NSAssertionHandler currentHandler];
  v8 = NSStringFromSelector("initWithAccessoryBrowsingManager:delegate:discoveredAccessoryFilter:");
  [v7 handleFailureInMethod:a2 object:self file:@"HSDiscoveredAccessoryGridContentItemManager.m" lineNumber:25 description:@"%s is unavailable; use %@ instead"];
    "-[HSDiscoveredAccessoryGridContentItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v8);

  return 0;
}

- (HSDiscoveredAccessoryGridContentItemManager)initWithAccessoryBrowsingManager:(id)a3 delegate:(id)a4 discoveredAccessoryFilter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100059FC0;
  v17[3] = &unk_1000AB380;
  id v11 = v9;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  v16.receiver = self;
  v16.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  v13 = [(HSDiscoveredAccessoryGridContentItemManager *)&v16 initWithDelegate:a4 shouldGroupByRoom:0 itemProvidersCreator:v17];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_accessoryBrowsingManager, a3);
  }

  return v14;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  [(HSDiscoveredAccessoryGridContentItemManager *)&v4 _registerForExternalUpdates];
  v3 = [(HSDiscoveredAccessoryGridContentItemManager *)self accessoryBrowsingManager];
  [v3 addBrowsingObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  [(HSDiscoveredAccessoryGridContentItemManager *)&v4 _unregisterForExternalUpdates];
  v3 = [(HSDiscoveredAccessoryGridContentItemManager *)self accessoryBrowsingManager];
  [v3 removeBrowsingObserver:self];
}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableArray array];
  v5 = [v3 na_filter:&stru_1000AB3A0];
  if ([v5 count])
  {
    id v6 = [objc_alloc((Class)HFMutableItemSection) initWithIdentifier:@"HSDiscoveredAccessoryGridContentUnpairedSectionIdentifier"];
    v7 = [v5 allObjects];
    v8 = [(id)objc_opt_class() _discoveredAccessoryItemComparator];
    id v9 = [v7 sortedArrayUsingComparator:v8];
    [v6 setItems:v9];

    id v10 = HULocalizedString();
    [v6 setHeaderTitle:v10];

    [v4 addObject:v6];
  }
  id v11 = [v3 na_setByRemovingObjectsFromSet:v5];
  if ([v11 count])
  {
    id v12 = [objc_alloc((Class)HFMutableItemSection) initWithIdentifier:@"HSDiscoveredAccessoryGridContentPairedSectionIdentifier"];
    v13 = [v11 allObjects];
    v14 = [(id)objc_opt_class() _discoveredAccessoryItemComparator];
    v15 = [v13 sortedArrayUsingComparator:v14];
    [v12 setItems:v15];

    objc_super v16 = HULocalizedString();
    [v12 setHeaderTitle:v16];

    [v4 addObject:v12];
  }

  return v4;
}

+ (id)_discoveredAccessoryItemComparator
{
  return &stru_1000AB3E0;
}

- (void)accessoryBrowsingManager:(id)a3 didFindNewAccessory:(id)a4
{
}

- (void)accessoryBrowsingManager:(id)a3 didRemoveNewAccessory:(id)a4
{
}

- (void)accessoryBrowsingManager:(id)a3 didFindNewSharingDevice:(id)a4
{
}

- (void)accessoryBrowsingManager:(id)a3 didRemoveNewSharingDevice:(id)a4
{
}

- (void)_reloadDiscoveredAccessoryItemProviderWithSenderSelector:(SEL)a3
{
  v5 = [(HSDiscoveredAccessoryGridContentItemManager *)self itemProviders];
  id v6 = [v5 na_firstObjectPassingTest:&stru_1000AB420];

  if (v6)
  {
    id v9 = v6;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
    id v8 = [(HSDiscoveredAccessoryGridContentItemManager *)self reloadAndUpdateItemsForProviders:v7 senderSelector:a2];
  }
  else
  {
    NSLog(@"Could not find discoveredAccessoryItemProvider");
  }
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (void).cxx_destruct
{
}

@end