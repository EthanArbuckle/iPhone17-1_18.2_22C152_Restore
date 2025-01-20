@interface HFMutableReorderableHomeKitItemList
- (id)saveWithSender:(id)a3;
- (void)_dispatchApplicationDataDidChangeMessageWithSender:(id)a3;
- (void)setSortedHomeKitItems:(id)a3;
- (void)setSortedHomeKitObjects:(id)a3;
@end

@implementation HFMutableReorderableHomeKitItemList

- (void)setSortedHomeKitItems:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "na_each:", &__block_literal_global_207_0);
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_2;
  v8[3] = &unk_26409B690;
  id v9 = v5;
  id v6 = v5;
  objc_msgSend(v4, "na_each:", v8);

  v7 = (void *)[v6 copy];
  [(HFReorderableHomeKitItemList *)self setSortedHomeKitObjectIdentifiers:v7];
}

void __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = &unk_26C0FBAD0;
  id v4 = v2;
  id v10 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      v5 = v10;
    }
    else {
      v5 = 0;
    }
    id v6 = v10;
    if (v5) {
      goto LABEL_8;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    id v9 = NSStringFromProtocol((Protocol *)v3);
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v9 file lineNumber description];
  }
  id v6 = 0;
LABEL_8:
}

void __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 conformsToProtocol:&unk_26C11F218]) {
    v3 = v10;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      v5 = [v4 allHomeKitObjects];
      id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_212);

      [*(id *)(a1 + 32) addObjectsFromArray:v6];
      goto LABEL_10;
    }
    v7 = *(void **)(a1 + 32);
    v8 = [v4 primaryHomeKitObject];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v10 homeKitObject];
  }
  id v6 = v8;
  id v9 = [v8 uniqueIdentifier];
  [v7 addObject:v9];

LABEL_10:
}

uint64_t __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)setSortedHomeKitObjects:(id)a3
{
  objc_msgSend(a3, "na_map:", &__block_literal_global_214_0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HFReorderableHomeKitItemList *)self setSortedHomeKitObjectIdentifiers:v4];
}

uint64_t __63__HFMutableReorderableHomeKitItemList_setSortedHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (id)saveWithSender:(id)a3
{
  id v4 = a3;
  v5 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
  id v6 = [v5 applicationData];
  if (v6)
  {
    v7 = [(HFReorderableHomeKitItemList *)self sortedHomeKitObjectIdentifiers];
    v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_218);

    id v9 = [(HFReorderableHomeKitItemList *)self _applicationDataKey];
    id v10 = [v6 objectForKeyedSubscript:v9];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    else
    {
      v13 = [(HFReorderableHomeKitItemList *)self _applicationDataKey];
      [v6 setObject:v8 forKeyedSubscript:v13];

      v14 = (void *)MEMORY[0x263F58190];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_2;
      v19[3] = &unk_26408E218;
      id v20 = v5;
      id v21 = v6;
      v15 = [v14 futureWithErrorOnlyHandlerAdapterBlock:v19];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_3;
      v17[3] = &unk_2640945A0;
      v17[4] = self;
      id v18 = v4;
      v12 = [v15 flatMap:v17];
    }
  }
  else
  {
    v12 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v12;
}

uint64_t __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

uint64_t __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", *(void *)(a1 + 40), 1, a2);
}

id __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 _dispatchApplicationDataDidChangeMessageWithSender:v3];
  v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

- (void)_dispatchApplicationDataDidChangeMessageWithSender:(id)a3
{
  id v4 = a3;
  v5 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = +[HFHomeKitDispatcher sharedDispatcher];
    [v7 dispatchHomeManagerObserverMessage:&__block_literal_global_225_1 sender:v4];
  }
  else
  {
    v8 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9)
    {
      id v10 = +[HFHomeKitDispatcher sharedDispatcher];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_2;
      v24[3] = &unk_26408CDA0;
      v24[4] = self;
      [v10 dispatchHomeObserverMessage:v24 sender:v4];

      goto LABEL_10;
    }
    int v11 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    v13 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
    v14 = v13;
    if (v12)
    {
      v15 = [v13 accessories];
      v16 = [v15 firstObject];
      v17 = [v16 home];

      id v18 = +[HFHomeKitDispatcher sharedDispatcher];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_3;
      v21[3] = &unk_26408D8F0;
      id v22 = v17;
      id v23 = v14;
      id v19 = v14;
      id v20 = v17;
      [v18 dispatchHomeObserverMessage:v21 sender:v4];

      goto LABEL_10;
    }

    if (!v14) {
      goto LABEL_10;
    }
    v7 = [(HFReorderableItemListAbstractBase *)self applicationDataContainer];
    NSLog(&cfstr_NoDispatcherFo.isa, v7);
  }

LABEL_10:
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v2 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v3 = [v2 homeManager];
    [v4 homeManagerDidUpdateApplicationData:v3];
  }
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) applicationDataContainer];
    [v4 homeDidUpdateApplicationData:v3];
  }
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateApplicationDataForRoom:*(void *)(a1 + 40)];
  }
}

@end