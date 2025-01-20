@interface HUMatterAccessoryConnectedEcosystemItem
- (HMCHIPEcosystem)connectedEcosystem;
- (HUMatterAccessoryConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 chipAccessoryPairings:(id)a4;
- (NSSet)chipAccessoryPairings;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUMatterAccessoryConnectedEcosystemItem

- (HUMatterAccessoryConnectedEcosystemItem)initWithConnectedEcosystem:(id)a3 chipAccessoryPairings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterAccessoryConnectedEcosystemItem;
  v9 = [(HUMatterAccessoryConnectedEcosystemItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v10->_chipAccessoryPairings, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v4 = [(HUMatterAccessoryConnectedEcosystemItem *)self connectedEcosystem];
  v5 = [v4 vendor];
  unsigned int v27 = [v5 isSystemCommissionerVendor];

  v30[0] = *MEMORY[0x1E4F68AB8];
  v28 = [(HUMatterAccessoryConnectedEcosystemItem *)self connectedEcosystem];
  v6 = [v28 vendor];
  id v7 = [v6 name];
  v31[0] = v7;
  v30[1] = *MEMORY[0x1E4F68990];
  id v8 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
  v31[1] = v8;
  v30[2] = @"HUMatterAccessoryConnectedEcosystemItemIsAppleVendor";
  v9 = NSNumber;
  v10 = [(HUMatterAccessoryConnectedEcosystemItem *)self connectedEcosystem];
  v11 = [v10 vendor];
  objc_super v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isAppleVendor"));
  v31[2] = v12;
  v30[3] = @"HUMatterAccessoryConnectedEcosystemItemIsSystemCommissioner";
  v13 = [NSNumber numberWithBool:v27];
  v31[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v29 = (void *)[v14 mutableCopy];

  if (v27)
  {
    v15 = 0;
  }
  else
  {
    v16 = [(HUMatterAccessoryConnectedEcosystemItem *)self chipAccessoryPairings];
    v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_174);
    v18 = [v17 allObjects];
    v15 = [v18 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  }
  if ([v15 count])
  {
    v19 = _HULocalizedStringWithDefaultValue(@"HUMatterConnectedEcosystemHomesSeparator", @"HUMatterConnectedEcosystemHomesSeparator", 1);
    v20 = [v15 componentsJoinedByString:v19];
    [v29 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  v21 = (void *)MEMORY[0x1E4F7A0D8];
  v22 = (void *)MEMORY[0x1E4F69228];
  v23 = (void *)[v29 copy];
  v24 = [v22 outcomeWithResults:v23];
  v25 = [v21 futureWithResult:v24];

  return v25;
}

id __71__HUMatterAccessoryConnectedEcosystemItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 home];
  v3 = [v2 name];

  return v3;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (NSSet)chipAccessoryPairings
{
  return self->_chipAccessoryPairings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipAccessoryPairings, 0);

  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end