@interface HUMatterConnectedEcosystemDetailItemManager
- (HFItem)instructionsItem;
- (HFTransformItemProvider)connectedEcosystemAccessoryItemProvider;
- (HMCHIPEcosystem)connectedEcosystem;
- (HUMatterConnectedEcosystemDetailItemManager)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 delegate:(id)a5;
- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_roomForItem:(id)a3;
- (void)setConnectedEcosystemAccessoryItemProvider:(id)a3;
- (void)setInstructionsItem:(id)a3;
@end

@implementation HUMatterConnectedEcosystemDetailItemManager

- (HUMatterConnectedEcosystemDetailItemManager)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUMatterConnectedEcosystemDetailItemManager;
  v11 = [(HFItemManager *)&v15 initWithDelegate:a5 sourceItem:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v12->_connectedEcosystemItemProvider, a4);
    v13 = [v10 home];
    [(HFItemManager *)v12 setHome:v13];
  }
  return v12;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v4 = [HUInstructionsItem alloc];
  v5 = [(HUMatterConnectedEcosystemDetailItemManager *)self connectedEcosystem];
  v6 = [v5 vendor];
  v7 = [v6 name];
  v14 = HULocalizedStringWithFormat(@"HUMatterConnectedEcosystemDetailInfoTitle", @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  objc_super v15 = [(HUInstructionsItem *)v4 initWithStyle:4 title:v14 description:0];
  [(HUMatterConnectedEcosystemDetailItemManager *)self setInstructionsItem:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F695C8]);
  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HUMatterConnectedEcosystemDetailItemManager *)self instructionsItem];
  v19 = [v17 setWithObject:v18];
  v20 = (void *)[v16 initWithItems:v19];

  v21 = [HUMatterConnectedEcosystemDetailItemProvider alloc];
  v22 = [(HUMatterConnectedEcosystemDetailItemManager *)self connectedEcosystem];
  v23 = [(HUMatterConnectedEcosystemDetailItemManager *)self connectedEcosystemItemProvider];
  v24 = [(HFItemManager *)self home];
  v25 = [(HUMatterConnectedEcosystemDetailItemProvider *)v21 initWithConnectedEcosystem:v22 connectedEcosystemItemProvider:v23 home:v24];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v25 transformationBlock:&__block_literal_global_12];
  [(HUMatterConnectedEcosystemDetailItemManager *)self setConnectedEcosystemAccessoryItemProvider:v26];

  v30[0] = v20;
  v27 = [(HUMatterConnectedEcosystemDetailItemManager *)self connectedEcosystemAccessoryItemProvider];
  v30[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];

  return v28;
}

id __74__HUMatterConnectedEcosystemDetailItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F696A8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithSourceItem:v3 transformationBlock:&__block_literal_global_15];

  return v4;
}

id __74__HUMatterConnectedEcosystemDetailItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[v2 mutableCopy];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v6 = v5;

  objc_opt_class();
  v7 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68A60]];
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 serviceName];
  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  uint64_t v11 = *MEMORY[0x1E4F689E8];
  uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  uint64_t v13 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];

  v14 = [MEMORY[0x1E4F69548] displayIconDescriptorFromIconDescriptor:v12 symbolName:v13];
  [v6 setObject:v14 forKeyedSubscript:v11];

  objc_super v15 = (void *)[v6 copy];

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  id v5 = objc_opt_new();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"ConnectedEcosystemDetailInstructions"];
  v7 = [(HUMatterConnectedEcosystemDetailItemManager *)self instructionsItem];
  v40[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v6 setItems:v8];

  v31 = v6;
  v32 = v4;
  [v4 addObject:v6];
  id v9 = [(HUMatterConnectedEcosystemDetailItemManager *)self connectedEcosystemAccessoryItemProvider];
  uint64_t v10 = [v9 items];
  uint64_t v11 = [v10 allObjects];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __80__HUMatterConnectedEcosystemDetailItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v37[3] = &unk_1E6385BD0;
  v37[4] = self;
  id v12 = v5;
  id v38 = v12;
  objc_msgSend(v11, "na_each:", v37);

  uint64_t v13 = [(HFItemManager *)self home];
  v14 = objc_msgSend(v13, "hf_orderedRooms");

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v21 = [v20 uniqueIdentifier];
        v22 = [v12 objectForKeyedSubscript:v21];

        v23 = [v22 items];
        uint64_t v24 = [v23 count];

        if (v24)
        {
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F69450]) initWithApplicationDataContainer:v20 category:@"roomAccessories"];
          v26 = [v22 items];
          v27 = [v25 sortedHomeKitItemComparator];
          v28 = [v26 sortedArrayUsingComparator:v27];
          [v22 setItems:v28];

          [v22 setForceShowHeaderTitle:1];
          [v32 addObject:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v17);
  }

  v29 = (void *)[v32 copy];

  return v29;
}

void __80__HUMatterConnectedEcosystemDetailItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 sourceItem];
  v6 = [v4 _roomForItem:v5];

  if (v6)
  {
    v7 = [v6 uniqueIdentifier];
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = [v8 items];
      uint64_t v11 = [v10 arrayByAddingObject:v3];
      [v9 setItems:v11];
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F692E8]);
      uint64_t v13 = [v7 UUIDString];
      id v9 = (void *)[v12 initWithIdentifier:v13];

      v16[0] = v3;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v9 setItems:v14];

      id v15 = [v6 name];
      [v9 setHeaderTitle:v15];

      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
    }
  }
}

- (id)_roomForItem:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F1A3D558]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = [v4 homeKitObject];

  if ([v5 conformsToProtocol:&unk_1F1A6A1B0]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = objc_msgSend(v7, "hf_parentRoom");

  return v8;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider
{
  return self->_connectedEcosystemItemProvider;
}

- (HFTransformItemProvider)connectedEcosystemAccessoryItemProvider
{
  return self->_connectedEcosystemAccessoryItemProvider;
}

- (void)setConnectedEcosystemAccessoryItemProvider:(id)a3
{
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemItemProvider, 0);

  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end