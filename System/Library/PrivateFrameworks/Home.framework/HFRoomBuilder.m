@interface HFRoomBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)isEqual:(id)a3;
- (HFMutableSetDiff)accessoryUUIDs;
- (HFRoomBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFWallpaperEditCollectionBuilder)wallpaperBuilder;
- (NSSet)accessories;
- (NSString)description;
- (NSString)name;
- (id)_createRoom;
- (id)_performValidation;
- (id)_updateAccessories;
- (id)_updateName;
- (id)commitItem;
- (unint64_t)hash;
- (void)addAccessory:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)setAccessoryUUIDs:(id)a3;
- (void)setName:(id)a3;
- (void)setWallpaperBuilder:(id)a3;
@end

@implementation HFRoomBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFRoomBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HFRoomBuilder;
  v7 = [(HFItemBuilder *)&v23 initWithExistingObject:v6 inHome:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(HFRoomBuilder *)v7 room];
    uint64_t v10 = [v9 name];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_26C081158;
    }
    objc_storeStrong((id *)&v8->_name, v12);

    if (+[HFExecutionEnvironment isHomeApp])
    {
      v13 = +[HFWallpaperManager sharedInstance];
      int v14 = [v13 wallpaperSourceRegistered];

      if (v14)
      {
        v15 = [[HFWallpaperEditCollectionBuilder alloc] initWithHomeKitObject:v6 namedWallpaperCollectionType:1];
        wallpaperBuilder = v8->_wallpaperBuilder;
        v8->_wallpaperBuilder = v15;
      }
    }
    if (v6)
    {
      v17 = [(HFRoomBuilder *)v8 room];
      v18 = [v17 accessories];
      v19 = HFHomeKitObjectUniqueIdentifiers(v18);
    }
    else
    {
      v19 = [MEMORY[0x263EFFA08] set];
    }
    v20 = [[HFMutableSetDiff alloc] initWithFromSet:v19];
    accessoryUUIDs = v8->_accessoryUUIDs;
    v8->_accessoryUUIDs = v20;
  }
  return v8;
}

- (void)addAccessory:(id)a3
{
  id v10 = a3;
  v4 = [(HFRoomBuilder *)self accessoryUUIDs];
  v5 = [v4 toSet];
  id v6 = [v10 uniqueIdentifier];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [(HFRoomBuilder *)self accessoryUUIDs];
    v9 = [v10 uniqueIdentifier];
    [v8 addObject:v9];
  }
}

- (void)removeAccessory:(id)a3
{
  id v10 = a3;
  v4 = [(HFRoomBuilder *)self accessoryUUIDs];
  v5 = [v4 toSet];
  id v6 = [v10 uniqueIdentifier];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    v8 = [(HFRoomBuilder *)self accessoryUUIDs];
    v9 = [v10 uniqueIdentifier];
    [v8 deleteObject:v9];
  }
}

- (NSSet)accessories
{
  v3 = [(HFRoomBuilder *)self accessoryUUIDs];
  v4 = [v3 toSet];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__HFRoomBuilder_accessories__block_invoke;
  v7[3] = &unk_26408FF78;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_map:", v7);

  return (NSSet *)v5;
}

id __28__HFRoomBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 home];
  v5 = objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);

  return v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFRoomBuilder *)self room];

  if (v4)
  {
    v5 = [(HFRoomBuilder *)self room];
    id v6 = objc_msgSend(v5, "hf_prettyDescription");
    id v7 = (id)[v3 appendObject:v6 withName:@"room"];
  }
  else
  {
    v5 = [(HFRoomBuilder *)self name];
    id v8 = (id)[v3 appendObject:v5 withName:@"name"];
  }

  v9 = [v3 build];

  return (NSString *)v9;
}

- (id)_performValidation
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F58190];
  v4 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  v10[0] = v4;
  v5 = [(HFRoomBuilder *)self name];
  id v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v10[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  id v8 = [v3 chainFutures:v7];

  return v8;
}

- (id)commitItem
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Starting commit (%@)", buf, 0xCu);
  }

  v4 = [(HFRoomBuilder *)self room];
  v5 = HFOperationEditRoom;
  if (!v4) {
    v5 = HFOperationAddRoom;
  }
  id v6 = *v5;

  id v7 = [(HFRoomBuilder *)self _performValidation];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __27__HFRoomBuilder_commitItem__block_invoke;
  v23[3] = &unk_26408CDC8;
  v23[4] = self;
  id v8 = [v7 flatMap:v23];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __27__HFRoomBuilder_commitItem__block_invoke_17;
  v22[3] = &unk_26408CDC8;
  v22[4] = self;
  v9 = [v8 flatMap:v22];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __27__HFRoomBuilder_commitItem__block_invoke_2;
  v21[3] = &unk_26408CDC8;
  v21[4] = self;
  id v10 = [v9 flatMap:v21];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __27__HFRoomBuilder_commitItem__block_invoke_3;
  v18[3] = &unk_26408CE18;
  v19 = v6;
  v20 = self;
  v11 = v6;
  v12 = [v10 recover:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __27__HFRoomBuilder_commitItem__block_invoke_4;
  v17[3] = &unk_26408CDC8;
  v17[4] = self;
  v13 = [v12 flatMap:v17];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __27__HFRoomBuilder_commitItem__block_invoke_5;
  v16[3] = &unk_264091218;
  v16[4] = self;
  id v14 = (id)[v13 addCompletionBlock:v16];

  return v13;
}

id __27__HFRoomBuilder_commitItem__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) room];

  id v3 = [*(id *)(a1 + 32) room];
  v4 = [*(id *)(a1 + 32) home];
  v5 = [v4 roomForEntireHome];
  if ([v3 isEqual:v5])
  {
    id v6 = [*(id *)(a1 + 32) name];
    id v7 = [*(id *)(a1 + 32) room];
    id v8 = [v7 name];
    char v9 = [v6 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = HFLogForCategory(0x29uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [*(id *)(a1 + 32) name];
        int v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Request to modify name for default room. Creating a new room and moving accessories into it instead (%@)", (uint8_t *)&v18, 0xCu);
      }
      v12 = [MEMORY[0x263EFFA08] set];
      v13 = [*(id *)(a1 + 32) accessoryUUIDs];
      id v14 = [v13 toSet];
      v15 = +[HFSetDiff diffFromSet:v12 toSet:v14];
      [*(id *)(a1 + 32) setAccessoryUUIDs:v15];

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v2)
  {
    v16 = [*(id *)(a1 + 32) _updateName];
    goto LABEL_10;
  }
LABEL_9:
  v16 = [*(id *)(a1 + 32) _createRoom];
LABEL_10:
  return v16;
}

id __27__HFRoomBuilder_commitItem__block_invoke_17(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) wallpaperBuilder];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) wallpaperBuilder];
    v4 = [v3 commitWallpaper];
  }
  else
  {
    v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v4;
}

uint64_t __27__HFRoomBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessories];
}

id __27__HFRoomBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F58190];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) name];
  uint64_t v7 = [v6 length];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) name];
  }
  else
  {
    id v8 = 0;
  }
  char v9 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v5, v8);
  id v10 = [v4 futureWithError:v9];

  if (v7) {
  return v10;
  }
}

id __27__HFRoomBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58190];
  v2 = [*(id *)(a1 + 32) room];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

void __27__HFRoomBuilder_commitItem__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Commit for %@ finished with error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_createRoom
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFRoomBuilder *)self name];
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Adding room with name: %@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__HFRoomBuilder__createRoom__block_invoke;
  void v10[3] = &unk_26408CD78;
  v10[4] = self;
  uint64_t v5 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v10];
  id v6 = (id)[v5 addFailureBlock:&__block_literal_global_217];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__HFRoomBuilder__createRoom__block_invoke_26;
  v9[3] = &unk_26409B490;
  v9[4] = self;
  int v7 = [v5 flatMap:v9];

  return v7;
}

void __28__HFRoomBuilder__createRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 home];
  uint64_t v5 = [*(id *)(a1 + 32) name];
  [v6 addRoomWithName:v5 completionHandler:v4];
}

void __28__HFRoomBuilder__createRoom__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to add room with error: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[HFErrorHandler sharedHandler];
  [v4 logError:v2 operationDescription:@"HFRoomBuilder.addRoomWithName"];
}

id __28__HFRoomBuilder__createRoom__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished adding room", buf, 2u);
  }

  [*(id *)(a1 + 32) setRoom:v3];
  int v5 = [*(id *)(a1 + 32) wallpaperBuilder];
  [v5 setHkObject:v3];

  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__HFRoomBuilder__createRoom__block_invoke_28;
  v9[3] = &unk_26408CDA0;
  v9[4] = *(void *)(a1 + 32);
  [v6 dispatchHomeObserverMessage:v9 sender:0];

  uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v7;
}

void __28__HFRoomBuilder__createRoom__block_invoke_28(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) room];
    [v5 home:v3 didAddRoom:v4];
  }
}

- (id)_updateName
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(HFRoomBuilder *)self room];
  id v4 = [v3 name];
  id v5 = [(HFRoomBuilder *)self name];
  int v6 = [v4 isEqualToString:v5];

  uint64_t v7 = HFLogForCategory(0x29uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      __int16 v9 = [(HFRoomBuilder *)self name];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v9;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);
    }
    id v10 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = [(HFRoomBuilder *)self room];
      v12 = [v11 name];
      uint64_t v13 = [(HFRoomBuilder *)self name];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Updating name from \"%@\" to \"%@\"", buf, 0x16u);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __28__HFRoomBuilder__updateName__block_invoke;
    v18[3] = &unk_26408CD50;
    void v18[4] = self;
    id v14 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v18];
    id v15 = (id)[v14 addFailureBlock:&__block_literal_global_35_3];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __28__HFRoomBuilder__updateName__block_invoke_39;
    v17[3] = &unk_26408CDC8;
    v17[4] = self;
    id v10 = [v14 flatMap:v17];
  }
  return v10;
}

void __28__HFRoomBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 room];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 updateName:v5 completionHandler:v4];
}

void __28__HFRoomBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to update name with error: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[HFErrorHandler sharedHandler];
  [v4 logError:v2 operationDescription:@"HFRoomBuilder.updateName"];
}

id __28__HFRoomBuilder__updateName__block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished updating name", buf, 2u);
  }

  int v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__HFRoomBuilder__updateName__block_invoke_40;
  v8[3] = &unk_26408CDA0;
  v8[4] = *(void *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:v8 sender:0];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

void __28__HFRoomBuilder__updateName__block_invoke_40(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) room];
    [v5 home:v3 didUpdateNameForRoom:v4];
  }
}

- (id)_updateAccessories
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFRoomBuilder *)self accessories];
    id v5 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Updating accessories: %@", buf, 0xCu);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFRoomBuilder__updateAccessories__block_invoke;
  aBlock[3] = &unk_26409B4E0;
  aBlock[4] = self;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v7 = [(HFRoomBuilder *)self accessoryUUIDs];
  BOOL v8 = [(HFRoomBuilder *)self room];
  __int16 v9 = v6[2](v6, v8);
  id v10 = [(HFItemBuilder *)self home];
  uint64_t v11 = [v10 roomForEntireHome];
  v12 = v6[2](v6, v11);
  uint64_t v13 = [(HFItemBuilder *)self commitSetDiff:v7 addBlock:v9 updateBlock:&__block_literal_global_56_3 deleteBlock:v12];

  return v13;
}

id __35__HFRoomBuilder__updateAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_2;
  v7[3] = &unk_26409B4B8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v4 = v3;
  id v5 = _Block_copy(v7);

  return v5;
}

id __35__HFRoomBuilder__updateAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);

  if (!v5)
  {
    id v6 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [*(id *)(a1 + 32) home];
      *(_DWORD *)buf = 138412546;
      id v32 = v3;
      __int16 v33 = 2112;
      v34 = v20;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Could not find accessory with UUID: %@ in home: %@. This is going to cause the HFRoomBuilder commit to fail.", buf, 0x16u);
    }
  }
  uint64_t v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    __int16 v9 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v32 = v8;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Assigning accessory to room: %@. Accessory: %@", buf, 0x16u);
  }
  id v10 = (void *)MEMORY[0x263F58190];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_43;
  v28[3] = &unk_2640910D8;
  v28[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v29 = v11;
  id v30 = *(id *)(a1 + 40);
  v12 = [v10 futureWithErrorOnlyHandlerAdapterBlock:v28];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_2_44;
  v25[3] = &unk_26408C8C8;
  id v13 = v11;
  id v26 = v13;
  id v27 = *(id *)(a1 + 40);
  id v14 = (id)[v12 addFailureBlock:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_48;
  v21[3] = &unk_264093450;
  id v22 = v13;
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v23 = v15;
  uint64_t v24 = v16;
  id v17 = v13;
  uint64_t v18 = [v12 flatMap:v21];

  return v18;
}

void __35__HFRoomBuilder__updateAccessories__block_invoke_43(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 home];
  [v5 assignAccessory:a1[5] toRoom:a1[6] completionHandler:v4];
}

void __35__HFRoomBuilder__updateAccessories__block_invoke_2_44(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v6 = [*(id *)(a1 + 32) name];
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    int v8 = 138412802;
    __int16 v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to assign accessory (%@) to room (%@) with error: %@", (uint8_t *)&v8, 0x20u);
  }
  id v5 = +[HFErrorHandler sharedHandler];
  [v5 logError:v3 operationDescription:@"HFRoomBuilder.assignAccessoryToRoom"];
}

id __35__HFRoomBuilder__updateAccessories__block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) name];
    id v6 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished assigning accessory (%@) to room (%@)", buf, 0x16u);
  }
  uint64_t v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_49;
  v12[3] = &unk_264090678;
  int8x16_t v11 = *(int8x16_t *)(a1 + 40);
  id v8 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = *(id *)(a1 + 32);
  [v7 dispatchHomeObserverMessage:v12 sender:0];

  __int16 v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

void __35__HFRoomBuilder__updateAccessories__block_invoke_49(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateRoom:*(void *)(a1 + 40) forAccessory:*(void *)(a1 + 48)];
  }
}

uint64_t __35__HFRoomBuilder__updateAccessories__block_invoke_2_54()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (unint64_t)hash
{
  id v3 = [(HFRoomBuilder *)self room];

  if (v3)
  {
    id v4 = [(HFRoomBuilder *)self room];
    id v5 = [v4 uniqueIdentifier];
    unint64_t v6 = [v5 hash];
  }
  else
  {
    id v4 = [(HFRoomBuilder *)self name];
    unint64_t v6 = [v4 hash];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v15 = 0;
    goto LABEL_18;
  }
  id v5 = v4;
  unint64_t v6 = [(HFRoomBuilder *)self room];
  uint64_t v7 = [v6 uniqueIdentifier];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF9D0] null];
  }
  __int16 v9 = [v5 room];
  __int16 v10 = [v9 uniqueIdentifier];
  int8x16_t v11 = v10;
  if (!v10)
  {
    int8x16_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  if ([v8 isEqual:v11])
  {
    uint64_t v19 = v8;
    __int16 v12 = [(HFRoomBuilder *)self name];
    int8x16_t v13 = [v5 name];
    if ([v12 isEqualToString:v13])
    {
      __int16 v17 = __25__HFRoomBuilder_isEqual___block_invoke(self);
      __25__HFRoomBuilder_isEqual___block_invoke(v5);
      id v14 = v18 = v6;
      char v15 = [v17 isEqual:v14];

      unint64_t v6 = v18;
    }
    else
    {
      char v15 = 0;
    }

    id v8 = v19;
    if (!v10) {
      goto LABEL_14;
    }
  }
  else
  {
    char v15 = 0;
    if (!v10) {
LABEL_14:
    }
  }
  if (!v7) {

  }
LABEL_18:
  return v15;
}

id __25__HFRoomBuilder_isEqual___block_invoke(void *a1)
{
  v1 = [a1 accessories];
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_63_3);

  return v2;
}

uint64_t __25__HFRoomBuilder_isEqual___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HFWallpaperEditCollectionBuilder)wallpaperBuilder
{
  return self->_wallpaperBuilder;
}

- (void)setWallpaperBuilder:(id)a3
{
}

- (HFMutableSetDiff)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void)setAccessoryUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_wallpaperBuilder, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end