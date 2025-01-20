@interface HUMatterHomeConnectedEcosystemItem
- (HMCHIPEcosystem)connectedEcosystem;
- (HUMatterHomeConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 accessoryUUIDs:(id)a4;
- (NSSet)accessoryUUIDs;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUMatterHomeConnectedEcosystemItem

- (HUMatterHomeConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 accessoryUUIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterHomeConnectedEcosystemItem;
  v9 = [(HUMatterHomeConnectedEcosystemItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v10->_accessoryUUIDs, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F68AB8];
  v4 = [(HUMatterHomeConnectedEcosystemItem *)self connectedEcosystem];
  v5 = [v4 vendor];
  v6 = [v5 name];
  v22[0] = v6;
  v21[1] = *MEMORY[0x1E4F68980];
  id v7 = [(HUMatterHomeConnectedEcosystemItem *)self accessoryUUIDs];
  uint64_t v8 = [v7 count];
  v15 = HULocalizedStringWithFormat(@"HUNumberOfAccessories", @"%lu", v9, v10, v11, v12, v13, v14, v8);
  v22[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  v17 = (void *)MEMORY[0x1E4F7A0D8];
  v18 = [MEMORY[0x1E4F69228] outcomeWithResults:v16];
  v19 = [v17 futureWithResult:v18];

  return v19;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (NSSet)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);

  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end