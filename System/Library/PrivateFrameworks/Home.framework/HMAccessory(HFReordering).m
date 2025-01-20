@interface HMAccessory(HFReordering)
- (HFServiceNameComponents)hf_serviceNameComponents;
- (id)hf_displayName;
- (id)hf_updateDateAdded:()HFReordering;
@end

@implementation HMAccessory(HFReordering)

- (HFServiceNameComponents)hf_serviceNameComponents
{
  v2 = +[HFNamingComponents namingComponentFromAccessory:a1];
  v3 = [HFServiceNameComponents alloc];
  v4 = [v2 name];
  v5 = [a1 room];
  v6 = [v5 name];
  v7 = [(HFServiceNameComponents *)v3 initWithRawServiceName:v4 rawRoomName:v6];

  return v7;
}

- (id)hf_displayName
{
  v1 = objc_msgSend(a1, "hf_serviceNameComponents");
  v2 = [v1 composedString];

  return v2;
}

- (id)hf_updateDateAdded:()HFReordering
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFUpdateDateAddedForApplicationDataContainer(a1, v4);
  v6 = [a1 services];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke;
  v18 = &unk_264091C28;
  id v19 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_map:", &v15);

  v9 = (void *)MEMORY[0x263F58190];
  v20[0] = v5;
  v20[1] = v8;
  v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v20, 2, v15, v16, v17, v18);
  v11 = objc_msgSend(v10, "na_arrayByFlattening");
  v12 = [v9 combineAllFutures:v11];
  v13 = [v12 flatMap:&__block_literal_global_236];

  return v13;
}

@end