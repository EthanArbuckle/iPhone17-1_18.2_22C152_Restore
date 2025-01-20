@interface HFDataAnalyticsLogItemManager
- (HFDataAnalyticsLogItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4;
- (HFDataAnalyticsModule)dataAnalyticsModule;
- (HFMediaProfileContainer)mediaProfileContainer;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HFDataAnalyticsLogItemManager

- (HFDataAnalyticsLogItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HFDataAnalyticsLogItemManager.m", 19, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HFDataAnalyticsLogItemManager;
  v10 = [(HFItemManager *)&v16 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaProfileContainer, a3);
    v12 = [[HFDataAnalyticsModule alloc] initWithItemUpdater:v11 mediaProfileContainer:v8];
    dataAnalyticsModule = v11->_dataAnalyticsModule;
    v11->_dataAnalyticsModule = v12;
  }
  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v3 = [(HFDataAnalyticsLogItemManager *)self dataAnalyticsModule];
  v4 = [v3 itemProviders];
  v5 = [v4 allObjects];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(HFDataAnalyticsLogItemManager *)self dataAnalyticsModule];
    v6 = [v5 buildSectionsWithDisplayedItems:v4];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFDataAnalyticsModule)dataAnalyticsModule
{
  return self->_dataAnalyticsModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataAnalyticsModule, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end