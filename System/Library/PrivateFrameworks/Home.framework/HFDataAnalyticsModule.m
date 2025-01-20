@interface HFDataAnalyticsModule
- (HFDataAnalyticsLogItemProvider)logItemProvider;
- (HFDataAnalyticsModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
@end

@implementation HFDataAnalyticsModule

- (HFDataAnalyticsModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFDataAnalyticsModule.m", 23, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HFDataAnalyticsModule;
  v9 = [(HFItemModule *)&v15 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a4);
    v11 = [[HFDataAnalyticsLogItemProvider alloc] initWithMediaProfileContainer:v8];
    logItemProvider = v10->_logItemProvider;
    v10->_logItemProvider = v11;
  }
  return v10;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFDataAnalyticsModule *)self logItemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [(HFItemSection *)[HFMutableItemSection alloc] initWithIdentifier:@"DataAnalyticsLogSection"];
  v5 = [v3 allObjects];

  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_4];
  [(HFItemSection *)v4 setItems:v6];

  v9[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

uint64_t __57__HFDataAnalyticsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFDataAnalyticsLogItemProvider)logItemProvider
{
  return self->_logItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end