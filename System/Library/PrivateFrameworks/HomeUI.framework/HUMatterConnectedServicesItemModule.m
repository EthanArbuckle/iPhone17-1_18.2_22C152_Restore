@interface HUMatterConnectedServicesItemModule
- (HFItem)connectedServicesListItem;
- (HMAccessory)accessory;
- (HMHome)home;
- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider;
- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4;
- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4 home:(id)a5 itemProvider:(id)a6;
- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
@end

@implementation HUMatterConnectedServicesItemModule

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4 home:(id)a5 itemProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((v11 != 0) == (v12 != 0)) {
    NSLog(&cfstr_ExactlyOneShou.isa);
  }
  v19.receiver = self;
  v19.super_class = (Class)HUMatterConnectedServicesItemModule;
  v14 = [(HFItemModule *)&v19 initWithItemUpdater:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a4);
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeStrong((id *)&v15->_connectedServicesItemProvider, a6);
    v16 = [[HUMatterConnectedServicesListItem alloc] initWithAccessory:v11 home:v12 itemProvider:v13];
    connectedServicesListItem = v15->_connectedServicesListItem;
    v15->_connectedServicesListItem = &v16->super;
  }
  return v15;
}

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HUMatterAccessoryConnectedEcosystemItemProvider alloc] initWithAccessory:v6];
  v9 = [(HUMatterConnectedServicesItemModule *)self initWithItemUpdater:v7 accessory:v6 home:0 itemProvider:v8];

  return v9;
}

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HUMatterHomeConnectedEcosystemItemProvider alloc] initWithHome:v6];
  v9 = [(HUMatterConnectedServicesItemModule *)self initWithItemUpdater:v7 accessory:0 home:v6 itemProvider:v8];

  return v9;
}

- (id)buildItemProviders
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F695C8]);
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(HUMatterConnectedServicesItemModule *)self connectedServicesListItem];
  id v6 = [v4 setWithObject:v5];
  id v7 = (void *)[v3 initWithItems:v6];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v10 = [v8 setWithArray:v9];

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUMatterConnectedServicesIdentifier"];
  id v7 = [(HUMatterConnectedServicesItemModule *)self connectedServicesListItem];
  v14[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v6 setItems:v8];

  v9 = (void *)MEMORY[0x1E4F69220];
  id v13 = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  id v11 = [v9 filterSections:v10 toDisplayedItems:v5];

  return v11;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider
{
  return self->_connectedServicesItemProvider;
}

- (HFItem)connectedServicesListItem
{
  return self->_connectedServicesListItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedServicesListItem, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end