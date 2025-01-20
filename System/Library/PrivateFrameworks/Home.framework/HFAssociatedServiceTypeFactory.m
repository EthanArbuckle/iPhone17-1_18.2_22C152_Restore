@interface HFAssociatedServiceTypeFactory
+ (id)associatedServiceTypesArrayFor:(id)a3;
+ (id)associatedServiceTypesSetFor:(id)a3;
@end

@implementation HFAssociatedServiceTypeFactory

+ (id)associatedServiceTypesSetFor:(id)a3
{
  uint64_t v3 = qword_26AB2ED98;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2ED98, &__block_literal_global_23);
  }
  v5 = [(id)_MergedGlobals_220 objectForKeyedSubscript:v4];

  return v5;
}

void __63__HFAssociatedServiceTypeFactory_associatedServiceTypesSetFor___block_invoke()
{
  v17[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D6C8];
  v17[0] = *MEMORY[0x263F0D780];
  v17[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  uint64_t v3 = [v0 setWithArray:v2];

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0D8A8];
  v16[0] = *MEMORY[0x263F0D6A8];
  v16[1] = v5;
  uint64_t v6 = *MEMORY[0x263F0D6F8];
  v16[2] = *MEMORY[0x263F0D8B8];
  v16[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
  v8 = [v4 setWithArray:v7];

  v14[0] = *MEMORY[0x263F0D7D0];
  v9 = objc_msgSend(v3, "setByAddingObject:");
  v15[0] = v9;
  v14[1] = *MEMORY[0x263F0D828];
  v10 = objc_msgSend(v3, "setByAddingObject:");
  v15[1] = v10;
  v14[2] = *MEMORY[0x263F0D698];
  v11 = objc_msgSend(v8, "setByAddingObject:");
  v15[2] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v13 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = v12;
}

+ (id)associatedServiceTypesArrayFor:(id)a3
{
  uint64_t v3 = [a1 associatedServiceTypesSetFor:a3];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_5];

  return v5;
}

uint64_t __65__HFAssociatedServiceTypeFactory_associatedServiceTypesArrayFor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263F0E708];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "hf_userFriendlyLocalizedCapitalizedDescription:", a2);
  v7 = objc_msgSend(MEMORY[0x263F0E708], "hf_userFriendlyLocalizedCapitalizedDescription:", v5);

  uint64_t v8 = [v6 localizedStandardCompare:v7];
  return v8;
}

@end