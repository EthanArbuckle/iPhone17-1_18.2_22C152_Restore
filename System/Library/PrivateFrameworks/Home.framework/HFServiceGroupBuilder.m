@interface HFServiceGroupBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)_supportsCustomIcons;
- (BOOL)hasSetIcon;
- (BOOL)hasSetRoom;
- (BOOL)isFavorite;
- (BOOL)shouldAllowAddingService:(id)a3;
- (BOOL)showInHomeDashboard;
- (BOOL)supportsFavoriting;
- (HFIconDescriptor)iconDescriptor;
- (HFMutableSetDiff)serviceUUIDs;
- (HFRoomBuilder)room;
- (HFRoomBuilder)roomBuilder;
- (HFServiceGroupBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (NSArray)availableIconDescriptors;
- (NSArray)services;
- (NSString)name;
- (NSString)originalName;
- (NSString)primaryServiceType;
- (id)_createServiceGroup;
- (id)_mostCommonIconDescriptor;
- (id)_performValidation;
- (id)_rooms;
- (id)_updateIcon;
- (id)_updateName;
- (id)_updateRooms;
- (id)_updateServices;
- (id)_updateValueForContextType:(unint64_t)a3;
- (id)accessories;
- (id)commitItem;
- (id)removeItemFromHome;
- (void)addService:(id)a3;
- (void)removeService:(id)a3;
- (void)setHasSetIcon:(BOOL)a3;
- (void)setHasSetRoom:(BOOL)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRoom:(id)a3;
- (void)setRoomBuilder:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
@end

@implementation HFServiceGroupBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFServiceGroupBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HFServiceGroupBuilder;
  v7 = [(HFItemBuilder *)&v24 initWithExistingObject:a3 inHome:v6];
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      v9 = [(HFServiceGroupBuilder *)v7 serviceGroup];
      v10 = [v9 services];
      v11 = HFHomeKitObjectUniqueIdentifiers(v10);
    }
    else
    {
      v11 = [MEMORY[0x263EFFA08] set];
    }
    v12 = [[HFMutableSetDiff alloc] initWithFromSet:v11];
    serviceUUIDs = v8->_serviceUUIDs;
    v8->_serviceUUIDs = v12;

    v14 = [(HFServiceGroupBuilder *)v8 serviceGroup];
    v15 = [v14 name];
    [(HFServiceGroupBuilder *)v8 setName:v15];

    v16 = [(HFServiceGroupBuilder *)v8 serviceGroup];
    -[HFServiceGroupBuilder setShowInHomeDashboard:](v8, "setShowInHomeDashboard:", objc_msgSend(v16, "hf_effectiveShowInHomeDashboard"));

    v17 = [(HFServiceGroupBuilder *)v8 serviceGroup];
    -[HFServiceGroupBuilder setIsFavorite:](v8, "setIsFavorite:", objc_msgSend(v17, "hf_effectiveIsFavorite"));

    v18 = [(HFServiceGroupBuilder *)v8 _rooms];
    v19 = [v18 allObjects];

    if ([v19 count] == 1)
    {
      v20 = [HFRoomBuilder alloc];
      v21 = [v19 firstObject];
      v22 = [(HFRoomBuilder *)v20 initWithExistingObject:v21 inHome:v6];
      [(HFServiceGroupBuilder *)v8 setRoom:v22];
    }
    [(HFServiceGroupBuilder *)v8 setHasSetRoom:0];
    [(HFServiceGroupBuilder *)v8 setHasSetIcon:0];
  }
  return v8;
}

- (NSString)primaryServiceType
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08760] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [(HFServiceGroupBuilder *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "hf_effectiveServiceType");
        objc_msgSend(v3, "na_safeAddObject:", v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v18 = objc_msgSend(v10, "countForObject:", v17, (void)v22);
        if (v18 > v13)
        {
          uint64_t v19 = v18;
          id v20 = v17;

          uint64_t v13 = v19;
          v14 = v20;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }
  else
  {
    v14 = 0;
  }

  return (NSString *)v14;
}

- (id)_mostCommonIconDescriptor
{
  v2 = [(HFServiceGroupBuilder *)self services];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_107);

  if ([v3 count])
  {
    v4 = [MEMORY[0x263F08760] setWithArray:v3];
    objc_msgSend(v4, "na_mostCommonObject");
    uint64_t v5 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:@"HFImageIconIdentifierGeneric"];
  }

  return v5;
}

uint64_t __50__HFServiceGroupBuilder__mostCommonIconDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_iconDescriptor");
}

- (BOOL)shouldAllowAddingService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 serviceType];

  if (v5)
  {
    uint64_t v6 = [(HFItemBuilder *)self home];
    uint64_t v7 = objc_msgSend(v6, "hf_serviceGroupsForService:", v4);

    if (![v7 count]) {
      goto LABEL_5;
    }
    uint64_t v8 = [(HFServiceGroupBuilder *)self serviceGroup];
    if (!v8) {
      goto LABEL_8;
    }
    v9 = (void *)v8;
    id v10 = [(HFServiceGroupBuilder *)self serviceGroup];
    int v11 = [v7 containsObject:v10];

    if (v11)
    {
LABEL_5:
      uint64_t v12 = [(HFServiceGroupBuilder *)self services];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        v14 = [(HFServiceGroupBuilder *)self services];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __50__HFServiceGroupBuilder_shouldAllowAddingService___block_invoke;
        v17[3] = &unk_26408E0E8;
        id v18 = v4;
        char v15 = objc_msgSend(v14, "na_any:", v17);
      }
      else
      {
        char v15 = 1;
      }
    }
    else
    {
LABEL_8:
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

uint64_t __50__HFServiceGroupBuilder_shouldAllowAddingService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_canGroupWithService:", *(void *)(a1 + 32));
}

- (void)addService:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HFServiceGroupBuilder *)self shouldAllowAddingService:v4])
  {
    uint64_t v5 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_msgSend(v4, "hf_prettyDescription");
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Request to add a service that is not supported in this service group. We'll allow this to proceed (because there are no API restriction of what services can go into a group; we just want to enforce restrictions in our UI). Service: %@",
        (uint8_t *)&v9,
        0xCu);
    }
  }
  uint64_t v7 = [(HFServiceGroupBuilder *)self serviceUUIDs];
  uint64_t v8 = [v4 uniqueIdentifier];
  [v7 addObject:v8];
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  id v6 = [(HFServiceGroupBuilder *)self serviceUUIDs];
  uint64_t v5 = [v4 uniqueIdentifier];

  [v6 deleteObject:v5];
}

- (NSArray)services
{
  v3 = [(HFServiceGroupBuilder *)self serviceUUIDs];
  id v4 = [v3 toSet];
  uint64_t v5 = [v4 allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__HFServiceGroupBuilder_services__block_invoke;
  v8[3] = &unk_26408FF78;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "na_map:", v8);

  return (NSArray *)v6;
}

id __33__HFServiceGroupBuilder_services__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  uint64_t v5 = objc_msgSend(v4, "hf_serviceWithIdentifier:", v3);

  return v5;
}

- (id)removeItemFromHome
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  id v4 = [(HFServiceGroupBuilder *)self serviceGroup];
  uint64_t v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Removing service group from home: %@", buf, 0xCu);
  }
  uint64_t v7 = [(HFItemBuilder *)self home];
  uint64_t v8 = [v3 errorOnlyCompletionHandlerAdapter];
  [v7 removeServiceGroup:v4 completionHandler:v8];

  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke;
  v16[3] = &unk_2640910B0;
  objc_copyWeak(&v18, (id *)buf);
  id v9 = v4;
  id v17 = v9;
  id v10 = [v3 flatMap:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_2;
  v14[3] = &unk_26408F1C0;
  id v11 = v9;
  id v15 = v11;
  uint64_t v12 = [v10 recover:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Request to remove service group from home completed successfully: %@", buf, 0xCu);
  }
  uint64_t v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_10;
  id v11 = &unk_26408D8F0;
  id v12 = WeakRetained;
  id v13 = *(id *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:&v8 sender:0];

  id v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v8, v9, v10, v11, v12);

  return v6;
}

void __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didRemoveServiceGroup:*(void *)(a1 + 40)];
  }
}

id __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Request to remove service group from home failed with error: %@, %@", buf, 0x16u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) name];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = &stru_26C081158;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  v14[0] = @"HFErrorHandlerOptionFailedItemName";
  v14[1] = @"HFErrorUserInfoOperationKey";
  v15[0] = v9;
  v15[1] = @"HFOperationRemoveServiceGroup";
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v11 = objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v10);

  id v12 = [MEMORY[0x263F58190] futureWithError:v11];

  return v12;
}

- (id)commitItem
{
  id v3 = [(HFItemBuilder *)self home];
  char v4 = objc_msgSend(v3, "hf_currentUserIsAdministrator");

  if (v4)
  {
    uint64_t v5 = [(HFServiceGroupBuilder *)self serviceGroup];
    uint64_t v6 = HFOperationEditItemGroup;
    if (!v5) {
      uint64_t v6 = HFOperationAddServiceGroup;
    }
    uint64_t v7 = *v6;

    uint64_t v8 = [(HFServiceGroupBuilder *)self serviceGroup];

    if (!v8)
    {
      uint64_t v9 = [(HFItemBuilder *)self home];
      id v10 = [v9 serviceGroups];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke;
      v23[3] = &unk_264092010;
      v23[4] = self;
      id v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", v23);
      [(HFServiceGroupBuilder *)self setServiceGroup:v11];
    }
    id v12 = [(HFServiceGroupBuilder *)self _performValidation];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_2;
    v22[3] = &unk_26408CDC8;
    v22[4] = self;
    id v13 = [v12 flatMap:v22];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_3;
    v21[3] = &unk_26408CDC8;
    v21[4] = self;
    v14 = [v13 flatMap:v21];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_4;
    v18[3] = &unk_26408CE18;
    uint64_t v19 = v7;
    uint64_t v20 = self;
    id v15 = v7;
    uint64_t v16 = [v14 recover:v18];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v16;
}

BOOL __35__HFServiceGroupBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 name];
  uint64_t v5 = [v4 lowercaseString];
  uint64_t v6 = [*(id *)(a1 + 32) name];
  uint64_t v7 = [v6 lowercaseString];
  if ([v5 isEqualToString:v7])
  {
    uint64_t v8 = [v3 services];
    BOOL v9 = [v8 count] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

id __35__HFServiceGroupBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) serviceGroup];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    char v4 = [v3 _updateValueForContextType:2];
    v16[0] = v4;
    uint64_t v5 = [*(id *)(a1 + 32) _updateValueForContextType:3];
    v16[1] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    uint64_t v7 = [MEMORY[0x263F58190] combineAllFutures:v6];
    uint64_t v8 = (void *)MEMORY[0x263F58190];
    BOOL v9 = [*(id *)(a1 + 32) _updateName];
    v15[0] = v9;
    v15[1] = v7;
    id v10 = [*(id *)(a1 + 32) _updateRooms];
    void v15[2] = v10;
    id v11 = [*(id *)(a1 + 32) _updateIcon];
    v15[3] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    id v13 = [v8 chainFutures:v12];
  }
  else
  {
    id v13 = [v3 _createServiceGroup];
  }
  return v13;
}

uint64_t __35__HFServiceGroupBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateServices];
}

id __35__HFServiceGroupBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 name];
  uint64_t v7 = objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);

  uint64_t v8 = [v2 futureWithError:v7];

  return v8;
}

- (id)_performValidation
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F58190];
  char v4 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  v10[0] = v4;
  id v5 = [(HFServiceGroupBuilder *)self name];
  uint64_t v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v3 chainFutures:v7];

  return v8;
}

- (id)_createServiceGroup
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke;
  v7[3] = &unk_26408CD78;
  v7[4] = self;
  uint64_t v3 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_2;
  v6[3] = &unk_2640953D8;
  v6[4] = self;
  char v4 = [v3 flatMap:v6];

  return v4;
}

void __44__HFServiceGroupBuilder__createServiceGroup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 home];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 addServiceGroupWithName:v5 completionHandler:v4];
}

id __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setServiceGroup:v3];
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_3;
  id v11 = &unk_26408D8F0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v5 = v3;
  [v4 dispatchHomeObserverMessage:&v8 sender:0];

  id v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v5, v8, v9, v10, v11, v12);

  return v6;
}

void __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didAddServiceGroup:*(void *)(a1 + 40)];
  }
}

- (id)_updateName
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__HFServiceGroupBuilder__updateName__block_invoke;
  v8[3] = &unk_26408CD50;
  v8[4] = self;
  id v3 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v8];
  id v4 = (id)[v3 addFailureBlock:&__block_literal_global_30_5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__HFServiceGroupBuilder__updateName__block_invoke_3;
  v7[3] = &unk_26408CDC8;
  v7[4] = self;
  id v5 = [v3 flatMap:v7];

  return v5;
}

void __36__HFServiceGroupBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 serviceGroup];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 updateName:v5 completionHandler:v4];
}

void __36__HFServiceGroupBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceGroupBuilder.updateName"];
}

id __36__HFServiceGroupBuilder__updateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__HFServiceGroupBuilder__updateName__block_invoke_4;
  v7[3] = &unk_26408CDA0;
  v7[4] = *(void *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v7 sender:0];

  id v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

void __36__HFServiceGroupBuilder__updateName__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) serviceGroup];
    [v5 home:v3 didUpdateNameForServiceGroup:v4];
  }
}

- (id)_updateServices
{
  id v3 = [(HFServiceGroupBuilder *)self serviceUUIDs];
  v6[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke;
  v7[3] = &unk_264095400;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_7;
  v6[3] = &unk_264095400;
  id v4 = [(HFItemBuilder *)self commitSetDiff:v3 addBlock:v7 updateBlock:&__block_literal_global_46_1 deleteBlock:v6];

  return v4;
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  id v6 = objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);

  uint64_t v7 = (void *)MEMORY[0x263F58190];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_2;
  void v16[3] = &unk_26408E218;
  void v16[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v17 = v8;
  uint64_t v9 = [v7 futureWithErrorOnlyHandlerAdapterBlock:v16];
  id v10 = (id)[v9 addFailureBlock:&__block_literal_global_38_1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_4;
  v14[3] = &unk_2640945A0;
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v8;
  id v11 = v8;
  uint64_t v12 = [v9 flatMap:v14];

  return v12;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 serviceGroup];
  [v5 addService:*(void *)(a1 + 40) completionHandler:v4];
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceGroupBuilder.addService"];
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __40__HFServiceGroupBuilder__updateServices__block_invoke_5;
  id v11 = &unk_26408D8F0;
  id v5 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v5;
  [v4 dispatchHomeObserverMessage:&v8 sender:0];

  id v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v3, v8, v9, v10, v11, v12);

  return v6;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) serviceGroup];
    [v6 home:v3 didAddService:v4 toServiceGroup:v5];
  }
}

uint64_t __40__HFServiceGroupBuilder__updateServices__block_invoke_6()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  id v6 = objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);

  uint64_t v7 = (void *)MEMORY[0x263F58190];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_8;
  void v16[3] = &unk_26408E218;
  void v16[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v17 = v8;
  uint64_t v9 = [v7 futureWithErrorOnlyHandlerAdapterBlock:v16];
  id v10 = (id)[v9 addFailureBlock:&__block_literal_global_48_1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_10;
  v14[3] = &unk_2640945A0;
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v8;
  id v11 = v8;
  uint64_t v12 = [v9 flatMap:v14];

  return v12;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 serviceGroup];
  [v5 removeService:*(void *)(a1 + 40) completionHandler:v4];
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceGroupBuilder.removeService"];
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __40__HFServiceGroupBuilder__updateServices__block_invoke_11;
  id v11 = &unk_26408D8F0;
  id v5 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v5;
  [v4 dispatchHomeObserverMessage:&v8 sender:0];

  id v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithResult:", v3, v8, v9, v10, v11, v12);

  return v6;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_11(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) serviceGroup];
    [v6 home:v3 didRemoveService:v4 fromServiceGroup:v5];
  }
}

- (id)_updateValueForContextType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      BOOL v5 = [(HFServiceGroupBuilder *)self isFavorite];
      goto LABEL_6;
    case 1uLL:
      NSLog(&cfstr_IncludeInStatu_1.isa, a2);
      goto LABEL_10;
    case 3uLL:
      BOOL v5 = [(HFServiceGroupBuilder *)self showInHomeDashboard];
LABEL_6:
      BOOL v6 = v5;
      goto LABEL_7;
    default:
      BOOL v6 = 0;
LABEL_7:
      uint64_t v7 = [(HFServiceGroupBuilder *)self serviceGroup];
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        uint64_t v8 = [(HFServiceGroupBuilder *)self serviceGroup];
        int v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if (v9)
        {
LABEL_10:
          id v10 = [MEMORY[0x263F58190] futureWithNoResult];
          goto LABEL_12;
        }
      }
      else
      {
      }
      id v11 = [(HFServiceGroupBuilder *)self serviceGroup];
      uint64_t v12 = objc_msgSend(v11, "hf_updateValue:forContextType:", v6, a3);

      id v13 = (id)[v12 addFailureBlock:&__block_literal_global_58_1];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      void v15[2] = __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_2;
      v15[3] = &unk_26408CDC8;
      void v15[4] = self;
      id v10 = [v12 flatMap:v15];

LABEL_12:
      return v10;
  }
}

void __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceGroupBuilder.updateName"];
}

id __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v12 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [*(id *)(a1 + 32) services];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v9 = +[HFHomeKitDispatcher sharedDispatcher];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_3;
        v13[3] = &unk_26408C938;
        v13[4] = v8;
        [v9 dispatchAccessoryObserverMessage:v13 sender:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v10 = [MEMORY[0x263F58190] futureWithResult:v12];

  return v10;
}

void __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) accessory];
    [v4 accessory:v3 didUpdateApplicationDataForService:*(void *)(a1 + 32)];
  }
}

- (id)_updateRooms
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(HFServiceGroupBuilder *)self hasSetRoom])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = [(HFServiceGroupBuilder *)self accessories];
    uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v18 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v20 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v7 = [v6 room];
          uint64_t v8 = [v7 uniqueIdentifier];
          int v9 = [(HFServiceGroupBuilder *)self room];
          id v10 = [v9 room];
          id v11 = [v10 uniqueIdentifier];
          char v12 = [v8 isEqual:v11];

          if ((v12 & 1) == 0)
          {
            id v13 = [(HFServiceGroupBuilder *)self room];
            [v13 addAccessory:v6];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v4);
    }

    long long v14 = [(HFServiceGroupBuilder *)self room];
    long long v15 = [v14 commitItem];
  }
  else
  {
    long long v15 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v15;
}

- (id)_updateIcon
{
  if ([(HFServiceGroupBuilder *)self hasSetIcon])
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF980];
    uint64_t v4 = [(HFServiceGroupBuilder *)self services];
    uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

    uint64_t v6 = [(HFServiceGroupBuilder *)self services];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    long long v15 = __36__HFServiceGroupBuilder__updateIcon__block_invoke;
    long long v16 = &unk_264095448;
    long long v17 = self;
    id v18 = v5;
    id v7 = v5;
    id v8 = (id)objc_msgSend(v6, "na_map:", &v13);

    int v9 = (void *)MEMORY[0x263F58190];
    id v10 = objc_msgSend(MEMORY[0x263F581B8], "mainThreadScheduler", v13, v14, v15, v16, v17);
    id v11 = [v9 combineAllFutures:v7 ignoringErrors:1 scheduler:v10];
  }
  else
  {
    id v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v11;
}

id __36__HFServiceGroupBuilder__updateIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) iconDescriptor];
  uint64_t v5 = objc_msgSend(v3, "hf_updateIconDescriptor:", v4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__HFServiceGroupBuilder__updateIcon__block_invoke_2;
  v11[3] = &unk_264092428;
  id v6 = v3;
  id v12 = v6;
  id v7 = [v5 flatMap:v11];

  id v8 = (id)[v7 addFailureBlock:&__block_literal_global_65];
  [*(id *)(a1 + 40) addObject:v7];
  id v9 = v6;

  return v9;
}

id __36__HFServiceGroupBuilder__updateIcon__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__HFServiceGroupBuilder__updateIcon__block_invoke_3;
  v7[3] = &unk_26408C938;
  id v8 = *(id *)(a1 + 32);
  [v4 dispatchAccessoryObserverMessage:v7 sender:0];

  uint64_t v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

void __36__HFServiceGroupBuilder__updateIcon__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) accessory];
    [v4 accessory:v3 didUpdateApplicationDataForService:*(void *)(a1 + 32)];
  }
}

void __36__HFServiceGroupBuilder__updateIcon__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceGroupBuilder.updateIcon"];
}

- (id)_rooms
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08760] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HFServiceGroupBuilder *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) accessory];
        id v10 = [v9 room];
        objc_msgSend(v3, "na_safeAddObject:", v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)originalName
{
  id v2 = [(HFServiceGroupBuilder *)self serviceGroup];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (id)accessories
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(HFServiceGroupBuilder *)self serviceGroup];
  id v4 = [v3 services];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_71_0);
  uint64_t v6 = [v2 setWithArray:v5];

  return v6;
}

uint64_t __36__HFServiceGroupBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (HFRoomBuilder)room
{
  roomBuilder = self->_roomBuilder;
  if (!roomBuilder)
  {
    id v4 = [HFRoomBuilder alloc];
    uint64_t v5 = [(HFItemBuilder *)self home];
    uint64_t v6 = [(HFItemBuilder *)v4 initWithHome:v5];
    uint64_t v7 = self->_roomBuilder;
    self->_roomBuilder = v6;

    roomBuilder = self->_roomBuilder;
  }
  return roomBuilder;
}

- (void)setRoom:(id)a3
{
  id v4 = (HFRoomBuilder *)a3;
  [(HFServiceGroupBuilder *)self setHasSetRoom:1];
  roomBuilder = self->_roomBuilder;
  self->_roomBuilder = v4;
}

- (HFIconDescriptor)iconDescriptor
{
  iconDescriptor = self->_iconDescriptor;
  if (!iconDescriptor)
  {
    id v4 = [(HFServiceGroupBuilder *)self _mostCommonIconDescriptor];
    uint64_t v5 = self->_iconDescriptor;
    self->_iconDescriptor = v4;

    iconDescriptor = self->_iconDescriptor;
  }
  return iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  id v4 = (HFIconDescriptor *)a3;
  [(HFServiceGroupBuilder *)self setHasSetIcon:1];
  iconDescriptor = self->_iconDescriptor;
  self->_iconDescriptor = v4;
}

- (NSArray)availableIconDescriptors
{
  if ([(HFServiceGroupBuilder *)self _supportsCustomIcons])
  {
    id v3 = [(HFServiceGroupBuilder *)self primaryServiceType];
    id v4 = +[HFServiceIconFactory allIconDescriptorsForServiceType:v3 serviceSubtype:0];
    uint64_t v5 = [v4 allObjects];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
  }
  return (NSArray *)v5;
}

- (BOOL)_supportsCustomIcons
{
  id v3 = [(HFServiceGroupBuilder *)self services];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_msgSend(v4, "hf_effectiveServiceType");

  uint64_t v6 = [(HFServiceGroupBuilder *)self services];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HFServiceGroupBuilder__supportsCustomIcons__block_invoke;
  v9[3] = &unk_26408E0E8;
  id v10 = v5;
  id v7 = v5;
  LOBYTE(v4) = objc_msgSend(v6, "na_all:", v9);

  return (char)v4;
}

uint64_t __45__HFServiceGroupBuilder__supportsCustomIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_effectiveServiceType");
  unsigned int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];
  uint64_t v5 = +[HFServiceIconFactory allIconDescriptorsForServiceType:*(void *)(a1 + 32) serviceSubtype:0];
  unint64_t v6 = [v5 count];

  if (v6 > 1) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isFavorite
{
  return self->isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->showInHomeDashboard = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (HFMutableSetDiff)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void)setRoomBuilder:(id)a3
{
}

- (BOOL)hasSetRoom
{
  return self->_hasSetRoom;
}

- (void)setHasSetRoom:(BOOL)a3
{
  self->_hasSetRoom = a3;
}

- (BOOL)hasSetIcon
{
  return self->_hasSetIcon;
}

- (void)setHasSetIcon:(BOOL)a3
{
  self->_hasSetIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
}

@end