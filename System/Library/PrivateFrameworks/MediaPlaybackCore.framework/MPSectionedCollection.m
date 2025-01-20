@interface MPSectionedCollection
@end

@implementation MPSectionedCollection

void __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v17[2] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a3, "mpc_jsonValue");
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2));
  v7 = *(void **)(a1 + 32);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke_2;
  v14 = &unk_2643C1720;
  id v15 = v6;
  id v8 = v6;
  [v7 enumerateItemIdentifiersInSectionAtIndex:a2 usingBlock:&v11];
  v9 = *(void **)(a1 + 40);
  v16[0] = @"section";
  v16[1] = @"items";
  v17[0] = v5;
  v17[1] = v8;
  v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2, v11, v12, v13, v14);
  [v9 addObject:v10];
}

void __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "mpc_jsonValue");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

@end