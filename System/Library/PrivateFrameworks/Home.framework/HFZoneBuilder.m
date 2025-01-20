@interface HFZoneBuilder
+ (Class)homeKitRepresentationClass;
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFMutableSetDiff)roomUUIDs;
- (HFZoneBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (NSSet)rooms;
- (NSString)name;
- (id)_createZone;
- (id)_performValidation;
- (id)_updateName;
- (id)_updateRooms;
- (id)commitItem;
- (unint64_t)hash;
- (void)addRoom:(id)a3;
- (void)removeRoom:(id)a3;
- (void)setName:(id)a3;
- (void)setRoomUUIDs:(id)a3;
@end

@implementation HFZoneBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFZoneBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)HFZoneBuilder;
  v5 = [(HFItemBuilder *)&v17 initWithExistingObject:a3 inHome:a4];
  v6 = v5;
  if (v5)
  {
    v7 = [(HFZoneBuilder *)v5 zone];
    uint64_t v8 = [v7 name];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_26C081158;
    }
    objc_storeStrong((id *)&v6->_name, v10);

    if (a3)
    {
      v11 = [(HFZoneBuilder *)v6 zone];
      v12 = [v11 rooms];
      v13 = HFHomeKitObjectUniqueIdentifiers(v12);
    }
    else
    {
      v13 = [MEMORY[0x263EFFA08] set];
    }
    v14 = [[HFMutableSetDiff alloc] initWithFromSet:v13];
    roomUUIDs = v6->_roomUUIDs;
    v6->_roomUUIDs = v14;
  }
  return v6;
}

- (void)addRoom:(id)a3
{
  id v10 = a3;
  v4 = [(HFZoneBuilder *)self roomUUIDs];
  v5 = [v4 toSet];
  v6 = [v10 uniqueIdentifier];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(HFZoneBuilder *)self roomUUIDs];
    v9 = [v10 uniqueIdentifier];
    [v8 addObject:v9];
  }
}

- (void)removeRoom:(id)a3
{
  id v10 = a3;
  v4 = [(HFZoneBuilder *)self roomUUIDs];
  v5 = [v4 toSet];
  v6 = [v10 uniqueIdentifier];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = [(HFZoneBuilder *)self roomUUIDs];
    v9 = [v10 uniqueIdentifier];
    [v8 deleteObject:v9];
  }
}

- (NSSet)rooms
{
  v3 = [(HFZoneBuilder *)self roomUUIDs];
  v4 = [v3 toSet];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __22__HFZoneBuilder_rooms__block_invoke;
  v7[3] = &unk_26408FF78;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_map:", v7);

  return (NSSet *)v5;
}

id __22__HFZoneBuilder_rooms__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 home];
  v5 = objc_msgSend(v4, "hf_roomWithIdentifier:", v3);

  return v5;
}

- (id)_performValidation
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F58190];
  v4 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  v10[0] = v4;
  v5 = [(HFZoneBuilder *)self name];
  v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v10[1] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v3 chainFutures:v7];

  return v8;
}

- (id)commitItem
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Starting a commit %@", buf, 0xCu);
  }

  v4 = [(HFZoneBuilder *)self zone];
  v5 = HFOperationEditZone;
  if (!v4) {
    v5 = HFOperationAddZone;
  }
  v6 = *v5;

  int v7 = [(HFZoneBuilder *)self _performValidation];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __27__HFZoneBuilder_commitItem__block_invoke;
  v21[3] = &unk_26408DDB8;
  objc_copyWeak(&v22, &location);
  uint64_t v8 = [v7 flatMap:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __27__HFZoneBuilder_commitItem__block_invoke_2;
  v19[3] = &unk_26408DDB8;
  objc_copyWeak(&v20, &location);
  v9 = [v8 flatMap:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __27__HFZoneBuilder_commitItem__block_invoke_3;
  v16[3] = &unk_26409AF00;
  objc_copyWeak(&v18, &location);
  id v10 = v6;
  objc_super v17 = v10;
  v11 = [v9 recover:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __27__HFZoneBuilder_commitItem__block_invoke_4;
  v14[3] = &unk_26408DDB8;
  objc_copyWeak(&v15, &location);
  v12 = [v11 flatMap:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v12;
}

id __27__HFZoneBuilder_commitItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained zone];

  id v3 = [WeakRetained name];
  v4 = [WeakRetained zone];
  v5 = [v4 name];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    if (v2)
    {
      uint64_t v7 = [WeakRetained _updateName];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
    v9 = [WeakRetained roomUUIDs];
    id v10 = [v9 toSet];
    v11 = +[HFSetDiff diffFromSet:v8 toSet:v10];
    [WeakRetained setRoomUUIDs:v11];
  }
  uint64_t v7 = [WeakRetained _createZone];
LABEL_6:
  v12 = (void *)v7;

  return v12;
}

id __27__HFZoneBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _updateRooms];

  return v2;
}

id __27__HFZoneBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = (void *)MEMORY[0x263F58190];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [WeakRetained name];
  v9 = objc_msgSend(v4, "hf_errorWithOperationType:failedItemName:", v7, v8);

  id v10 = [v6 futureWithError:v9];

  return v10;
}

id __27__HFZoneBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [WeakRetained zone];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_createZone
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__createZone__block_invoke;
  v8[3] = &unk_26408CD78;
  v8[4] = self;
  id v3 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v8];
  id v4 = (id)[v3 addFailureBlock:&__block_literal_global_213];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__HFZoneBuilder__createZone__block_invoke_18;
  v7[3] = &unk_26409AF28;
  v7[4] = self;
  v5 = [v3 flatMap:v7];

  return v5;
}

void __28__HFZoneBuilder__createZone__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) name];
    char v6 = [*(id *)(a1 + 32) home];
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Creating zone with name %@ in home %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) home];
  uint64_t v8 = [*(id *)(a1 + 32) name];
  [v7 addZoneWithName:v8 completionHandler:v3];
}

void __28__HFZoneBuilder__createZone__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "HFZoneBuilder: Zone creation failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[HFErrorHandler sharedHandler];
  [v4 logError:v2 operationDescription:@"HFZoneBuilder.addZone"];
}

id __28__HFZoneBuilder__createZone__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Zone creation successful", buf, 2u);
  }

  [*(id *)(a1 + 32) setZone:v3];
  int v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__createZone__block_invoke_20;
  v8[3] = &unk_26408CDA0;
  v8[4] = *(void *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:v8 sender:0];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

void __28__HFZoneBuilder__createZone__block_invoke_20(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) zone];
    [v5 home:v3 didAddZone:v4];
  }
}

- (id)_updateName
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HFZoneBuilder *)self name];
    id v5 = [(HFItemBuilder *)self home];
    *(_DWORD *)buf = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Updating zone with name %@ in home %@", buf, 0x16u);
  }
  id v6 = [(HFZoneBuilder *)self zone];
  uint64_t v7 = [v6 name];
  uint64_t v8 = [(HFZoneBuilder *)self name];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Skipping the name update", buf, 2u);
    }

    __int16 v11 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __28__HFZoneBuilder__updateName__block_invoke;
    v16[3] = &unk_26408CD50;
    void v16[4] = self;
    v12 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v16];
    id v13 = (id)[v12 addFailureBlock:&__block_literal_global_27_13];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __28__HFZoneBuilder__updateName__block_invoke_31;
    v15[3] = &unk_26408CDC8;
    v15[4] = self;
    __int16 v11 = [v12 flatMap:v15];
  }
  return v11;
}

void __28__HFZoneBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 zone];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 updateName:v5 completionHandler:v4];
}

void __28__HFZoneBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "HFZoneBuilder: Zone name change failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[HFErrorHandler sharedHandler];
  [v4 logError:v2 operationDescription:@"HFRoomBuilder.updateName"];
}

id __28__HFZoneBuilder__updateName__block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Zone name change successful", buf, 2u);
  }

  int v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__updateName__block_invoke_32;
  v8[3] = &unk_26408CDA0;
  v8[4] = *(void *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:v8 sender:0];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

void __28__HFZoneBuilder__updateName__block_invoke_32(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) zone];
    [v5 home:v3 didUpdateNameForZone:v4];
  }
}

- (id)_updateRooms
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__HFZoneBuilder__updateRooms__block_invoke;
  aBlock[3] = &unk_26409AF78;
  objc_copyWeak(&v15, &location);
  id v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __29__HFZoneBuilder__updateRooms__block_invoke_5;
  v12[3] = &unk_26409AF78;
  objc_copyWeak(&v13, &location);
  id v4 = (void (**)(void *, void *))_Block_copy(v12);
  id v5 = [(HFZoneBuilder *)self roomUUIDs];
  id v6 = [(HFZoneBuilder *)self zone];
  uint64_t v7 = v3[2](v3, v6);
  uint64_t v8 = [(HFZoneBuilder *)self zone];
  int v9 = v4[2](v4, v8);
  id v10 = [(HFItemBuilder *)self commitSetDiff:v5 addBlock:v7 updateBlock:&__block_literal_global_61_4 deleteBlock:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

id __29__HFZoneBuilder__updateRooms__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HFZoneBuilder__updateRooms__block_invoke_2;
  v7[3] = &unk_26409AF50;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v3;
  id v4 = v3;
  id v5 = _Block_copy(v7);

  objc_destroyWeak(&v9);
  return v5;
}

id __29__HFZoneBuilder__updateRooms__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained home];
  id v6 = objc_msgSend(v5, "hf_roomWithIdentifier:", v3);

  if (!v6)
  {
    uint64_t v7 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v20 = [WeakRetained home];
      *(_DWORD *)buf = 138412546;
      id v30 = v3;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Could not find room with UUID: %@ in home: %@. This is going to cause the HFZoneBuilder commit to fail.", buf, 0x16u);
    }
  }
  id v8 = [*(id *)(a1 + 32) rooms];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __29__HFZoneBuilder__updateRooms__block_invoke_35;
  v27[3] = &unk_264091F48;
  id v9 = v6;
  id v28 = v9;
  int v10 = objc_msgSend(v8, "na_any:", v27);

  __int16 v11 = HFLogForCategory(0x29uLL);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Skipping adding room %@ as one already exists!", buf, 0xCu);
    }

    id v13 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    if (v12)
    {
      v14 = [WeakRetained name];
      *(_DWORD *)buf = 138412546;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Assigning room %@ to zone named %@", buf, 0x16u);
    }
    id v15 = (void *)MEMORY[0x263F58190];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __29__HFZoneBuilder__updateRooms__block_invoke_37;
    v24[3] = &unk_26408E218;
    id v25 = *(id *)(a1 + 32);
    id v16 = v9;
    id v26 = v16;
    objc_super v17 = [v15 futureWithErrorOnlyHandlerAdapterBlock:v24];
    id v18 = (id)[v17 addFailureBlock:&__block_literal_global_40_7];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __29__HFZoneBuilder__updateRooms__block_invoke_3;
    v21[3] = &unk_264093450;
    void v21[4] = WeakRetained;
    id v22 = v16;
    id v23 = *(id *)(a1 + 32);
    id v13 = [v17 flatMap:v21];
  }
  return v13;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_37(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRoom:*(void *)(a1 + 40) completionHandler:a2];
}

void __29__HFZoneBuilder__updateRooms__block_invoke_2_38(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFZoneBuilder.assignZoneToRoom"];
}

id __29__HFZoneBuilder__updateRooms__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneBuilder__updateRooms__block_invoke_4;
  v8[3] = &unk_264090678;
  uint64_t v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  [v4 dispatchHomeObserverMessage:v8 sender:0];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

void __29__HFZoneBuilder__updateRooms__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didAddRoom:*(void *)(a1 + 40) toZone:*(void *)(a1 + 48)];
  }
}

id __29__HFZoneBuilder__updateRooms__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HFZoneBuilder__updateRooms__block_invoke_6;
  v7[3] = &unk_26409AF50;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(v7);

  objc_destroyWeak(&v9);
  return v5;
}

id __29__HFZoneBuilder__updateRooms__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained home];
  id v6 = objc_msgSend(v5, "hf_roomWithIdentifier:", v3);

  if (!v6)
  {
    uint64_t v7 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v17 = [WeakRetained home];
      *(_DWORD *)buf = 138412546;
      id v25 = v3;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Could not find room with UUID: %@ in home: %@. This is going to cause the HFZoneBuilder commit to fail.", buf, 0x16u);
    }
  }
  id v8 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [WeakRetained name];
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Removing room %@ from zone named %@", buf, 0x16u);
  }
  id v10 = (void *)MEMORY[0x263F58190];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __29__HFZoneBuilder__updateRooms__block_invoke_48;
  v21[3] = &unk_26408E218;
  id v22 = *(id *)(a1 + 32);
  id v11 = v6;
  id v23 = v11;
  BOOL v12 = [v10 futureWithErrorOnlyHandlerAdapterBlock:v21];
  id v13 = (id)[v12 addFailureBlock:&__block_literal_global_51_4];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __29__HFZoneBuilder__updateRooms__block_invoke_3_55;
  v18[3] = &unk_264093450;
  v18[4] = WeakRetained;
  id v19 = v11;
  id v20 = *(id *)(a1 + 32);
  id v14 = v11;
  id v15 = [v12 flatMap:v18];

  return v15;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRoom:*(void *)(a1 + 40) completionHandler:a2];
}

void __29__HFZoneBuilder__updateRooms__block_invoke_2_49(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFZoneBuilder.removeZoneToRoom"];
}

id __29__HFZoneBuilder__updateRooms__block_invoke_3_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneBuilder__updateRooms__block_invoke_4_56;
  v8[3] = &unk_264090678;
  uint64_t v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  [v4 dispatchHomeObserverMessage:v8 sender:0];

  id v6 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v6;
}

void __29__HFZoneBuilder__updateRooms__block_invoke_4_56(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didRemoveRoom:*(void *)(a1 + 40) fromZone:*(void *)(a1 + 48)];
  }
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_5_59()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

+ (id)na_identity
{
  if (qword_26AB2E758 != -1) {
    dispatch_once(&qword_26AB2E758, &__block_literal_global_64_4);
  }
  id v2 = (void *)_MergedGlobals_1_2;
  return v2;
}

void __28__HFZoneBuilder_na_identity__block_invoke()
{
  id v6 = [MEMORY[0x263F58198] builder];
  id v0 = (id)[v6 appendCharacteristic:&__block_literal_global_68_4 withRole:1];
  id v1 = (id)[v6 appendCharacteristic:&__block_literal_global_70_8 withRole:2];
  id v2 = (id)[v6 appendCharacteristic:&__block_literal_global_72_4 withRole:2];
  id v3 = (id)[v6 appendCharacteristic:&__block_literal_global_74_2 withRole:2];
  uint64_t v4 = [v6 build];
  uint64_t v5 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = v4;
}

id __28__HFZoneBuilder_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 zone];

  if (v3)
  {
    uint64_t v4 = [v2 zone];

    uint64_t v5 = [v4 uniqueIdentifier];
    id v6 = [v5 UUIDString];

    id v2 = v4;
  }
  else
  {
    id v6 = [v2 name];
  }

  return v6;
}

uint64_t __28__HFZoneBuilder_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __28__HFZoneBuilder_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 zone];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

id __28__HFZoneBuilder_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 zone];
  id v3 = [v2 rooms];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_77_1);

  return v4;
}

uint64_t __28__HFZoneBuilder_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HFMutableSetDiff)roomUUIDs
{
  return self->_roomUUIDs;
}

- (void)setRoomUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end