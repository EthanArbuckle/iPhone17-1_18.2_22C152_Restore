@interface HUNetworkRouterStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUNetworkRouterStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUNetworkRouterStatusBannerItem;
  v4 = [(HUStatusBannerItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HUNetworkRouterStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __63__HUNetworkRouterStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    objc_super v8 = (void *)[v3 mutableCopy];
    v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C08]];
    if ([v9 count] == 1)
    {
      v10 = [v9 anyObject];
      uint64_t v11 = [v10 type];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F69348] combinedType];
    }
    if ([v9 count] == 1)
    {
      v12 = [v9 anyObject];
      v13 = [v12 stateTypeIdentifier];
    }
    else
    {
      v13 = [MEMORY[0x1E4F69348] combinedStateTypeIdentifier];
    }
    if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
      v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];
    }
    else
    {
      v14 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68BD0]];
      v15 = [*(id *)(a1 + 32) _sortedObjectDisplayNamesForHomeKitObjects:v14];
      unint64_t v16 = [v15 count];
      v17 = @"HFStatusTitleNetworkRouter_One";
      if (v16 > 1) {
        v17 = @"HFStatusTitleNetworkRouter_MultipleUnknown";
      }
      uint64_t v18 = *MEMORY[0x1E4F68AC0];
      v19 = v17;
      [v8 setObject:v19 forKeyedSubscript:v18];
      v20 = HFLocalizedString();

      [v8 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      v21 = [NSString stringWithFormat:@"HUBannerNetworkRouter_Description_%@", v13];
      v22 = [*(id *)(a1 + 32) _descriptionForLocalizedStringKey:v21 representedHomeKitObjects:v14];
      [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68980]];

      [v8 setObject:&unk_1F19B4568 forKeyedSubscript:@"bannerItemCategory"];
      v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];
    }
  }

  return v7;
}

@end