@interface HFServiceBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)_shouldUpdateNilNameWithRoomName;
- (BOOL)isFavorite;
- (BOOL)showInHomeDashboard;
- (BOOL)supportsFavoriting;
- (HFIconDescriptor)iconDescriptor;
- (HFNamingComponents)namingComponent;
- (HFRoomBuilder)room;
- (HFServiceBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (NSArray)availableIconDescriptors;
- (NSString)accessoryName;
- (NSString)associatedServiceType;
- (NSString)description;
- (NSString)name;
- (NSString)originalName;
- (id)_lazilyUpdateAssociatedServiceType;
- (id)_lazilyUpdateConfigurationState;
- (id)_lazilyUpdateIcon;
- (id)_lazilyUpdateName;
- (id)_lazilyUpdateRoom;
- (id)_lazilyUpdateValueForContextType:(unint64_t)a3;
- (id)_performValidation;
- (id)accessories;
- (id)commitItem;
- (id)removeItemFromHome;
- (int64_t)configurationState;
- (void)setAccessoryName:(id)a3;
- (void)setAssociatedServiceType:(id)a3;
- (void)setConfigurationState:(int64_t)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setRoom:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
@end

@implementation HFServiceBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFServiceBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HFServiceBuilder.m", 40, @"%@ can only be used with existing HMServices", objc_opt_class() object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)HFServiceBuilder;
  v9 = [(HFItemBuilder *)&v31 initWithExistingObject:v7 inHome:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(HFServiceBuilder *)v9 service];
    v12 = +[HFNamingComponents namingComponentFromService:v11];
    [(HFServiceBuilder *)v10 setNamingComponent:v12];

    v13 = [(HFServiceBuilder *)v10 originalName];
    [(HFServiceBuilder *)v10 setName:v13];

    v14 = [(HFServiceBuilder *)v10 service];
    v15 = [v14 accessory];
    v16 = [v15 name];
    [(HFServiceBuilder *)v10 setAccessoryName:v16];

    v17 = [HFRoomBuilder alloc];
    v18 = [(HFServiceBuilder *)v10 service];
    v19 = [v18 accessory];
    v20 = [v19 room];
    v21 = [(HFRoomBuilder *)v17 initWithExistingObject:v20 inHome:v8];
    [(HFServiceBuilder *)v10 setRoom:v21];

    v22 = [(HFServiceBuilder *)v10 service];
    v23 = [v22 associatedServiceType];
    [(HFServiceBuilder *)v10 setAssociatedServiceType:v23];

    v24 = [(HFServiceBuilder *)v10 service];
    v25 = objc_msgSend(v24, "hf_iconDescriptor");
    [(HFServiceBuilder *)v10 setIconDescriptor:v25];

    v26 = [(HFServiceBuilder *)v10 service];
    -[HFServiceBuilder setShowInHomeDashboard:](v10, "setShowInHomeDashboard:", objc_msgSend(v26, "hf_effectiveShowInHomeDashboard"));

    v27 = [(HFServiceBuilder *)v10 service];
    -[HFServiceBuilder setIsFavorite:](v10, "setIsFavorite:", objc_msgSend(v27, "hf_effectiveIsFavorite"));

    v28 = [(HFServiceBuilder *)v10 service];
    -[HFServiceBuilder setConfigurationState:](v10, "setConfigurationState:", [v28 configurationState]);
  }
  return v10;
}

- (NSString)originalName
{
  v2 = [(HFServiceBuilder *)self namingComponent];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setAssociatedServiceType:(id)a3
{
  v3 = a3;
  v5 = (NSString *)a3;
  associatedServiceType = self->_associatedServiceType;
  if (associatedServiceType != v5)
  {
    v12 = v5;
    associatedServiceType = (NSString *)[(NSString *)associatedServiceType isEqualToString:v5];
    v5 = v12;
    if ((associatedServiceType & 1) == 0)
    {
      objc_storeStrong((id *)&self->_associatedServiceType, v3);
      id v7 = self->_associatedServiceType;
      id v8 = v7;
      if (!v7)
      {
        v3 = [(HFServiceBuilder *)self service];
        id v8 = [v3 serviceType];
      }
      v9 = [(HFServiceBuilder *)self service];
      v10 = [v9 serviceSubtype];
      v11 = +[HFServiceIconFactory defaultIconDescriptorForServiceType:v8 serviceSubtype:v10];
      [(HFServiceBuilder *)self setIconDescriptor:v11];

      v5 = v12;
      if (!v7)
      {

        v5 = v12;
      }
    }
  }
  MEMORY[0x270F9A758](associatedServiceType, v5);
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFServiceBuilder *)self service];
  v4 = [v3 accessory];
  v5 = objc_msgSend(v2, "na_setWithSafeObject:", v4);

  return v5;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (NSArray)availableIconDescriptors
{
  v3 = [(HFServiceBuilder *)self associatedServiceType];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(HFServiceBuilder *)self service];
    objc_msgSend(v6, "hf_effectiveServiceType");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = [(HFServiceBuilder *)self service];
  id v8 = [v7 serviceSubtype];
  v9 = +[HFServiceIconFactory allIconDescriptorsForServiceType:v5 serviceSubtype:v8];
  v10 = [v9 allObjects];

  return (NSArray *)v10;
}

- (id)removeItemFromHome
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  v4 = [(HFServiceBuilder *)self accessories];
  id v5 = [v4 anyObject];

  v6 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Removing accessory from home: %@", buf, 0xCu);
  }
  id v8 = [(HFItemBuilder *)self home];
  v9 = [v3 errorOnlyCompletionHandlerAdapter];
  [v8 removeAccessory:v5 completionHandler:v9];

  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__HFServiceBuilder_removeItemFromHome__block_invoke;
  v17[3] = &unk_2640910B0;
  objc_copyWeak(&v19, (id *)buf);
  id v10 = v5;
  id v18 = v10;
  v11 = [v3 flatMap:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__HFServiceBuilder_removeItemFromHome__block_invoke_2;
  v15[3] = &unk_26408F1C0;
  id v12 = v10;
  id v16 = v12;
  v13 = [v11 recover:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v13;
}

id __38__HFServiceBuilder_removeItemFromHome__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to remove accessory from home completed successfully: %@", buf, 0xCu);
  }
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __38__HFServiceBuilder_removeItemFromHome__block_invoke_11;
  v11 = &unk_26408D8F0;
  id v12 = WeakRetained;
  id v13 = *(id *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:&v8 sender:0];

  v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v8, v9, v10, v11, v12);

  return v6;
}

void __38__HFServiceBuilder_removeItemFromHome__block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didRemoveAccessory:*(void *)(a1 + 40)];
  }
}

id __38__HFServiceBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to remove accessory from home failed with error: %@, %@", buf, 0x16u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) name];
  id v7 = (void *)v6;
  uint64_t v8 = &stru_26C081158;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  v14[0] = @"HFErrorHandlerOptionFailedItemName";
  v14[1] = @"HFErrorUserInfoOperationKey";
  v15[0] = v9;
  v15[1] = @"HFOperationRemoveAccessory";
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v10);

  id v12 = [MEMORY[0x263F58190] futureWithError:v11];

  return v12;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFServiceBuilder *)self service];

  if (v4)
  {
    id v5 = [(HFServiceBuilder *)self service];
    uint64_t v6 = objc_msgSend(v5, "hf_prettyDescription");
    id v7 = (id)[v3 appendObject:v6 withName:@"service"];
  }
  else
  {
    id v5 = [(HFServiceBuilder *)self name];
    id v8 = (id)[v3 appendObject:v5 withName:@"name"];
  }

  uint64_t v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)_shouldUpdateNilNameWithRoomName
{
  id v3 = [(HFServiceBuilder *)self name];

  if (v3) {
    return 0;
  }
  id v5 = [(HFServiceBuilder *)self service];
  uint64_t v6 = [v5 accessory];

  if (!objc_msgSend(v6, "hf_isMediaAccessory")
    || (objc_msgSend(v6, "hf_isHomePod") & 1) != 0
    || objc_msgSend(v6, "hf_isAppleTV"))
  {
    char v4 = objc_msgSend(v6, "hf_isTelevision");
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (id)_performValidation
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"room"];
  v7[0] = v3;
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 chainFutures:v4];

  return v5;
}

- (id)commitItem
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v31 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Starting commit (%@)", buf, 0xCu);
  }

  char v4 = [(HFItemBuilder *)self home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (v5)
  {
    uint64_t v6 = [(HFServiceBuilder *)self _lazilyUpdateValueForContextType:2];
    v29[0] = v6;
    id v7 = [(HFServiceBuilder *)self _lazilyUpdateValueForContextType:3];
    v29[1] = v7;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];

    uint64_t v22 = [MEMORY[0x263F58190] combineAllFutures:v23];
    id v8 = @"HFOperationEditService";
    uint64_t v9 = (void *)MEMORY[0x263F58190];
    id v10 = [(HFServiceBuilder *)self _performValidation];
    v28[0] = v10;
    v11 = [(HFServiceBuilder *)self _lazilyUpdateName];
    v28[1] = v11;
    id v12 = [(HFServiceBuilder *)self _lazilyUpdateRoom];
    v28[2] = v12;
    v28[3] = v22;
    id v13 = [(HFServiceBuilder *)self _lazilyUpdateAssociatedServiceType];
    v28[4] = v13;
    v14 = [(HFServiceBuilder *)self _lazilyUpdateIcon];
    v28[5] = v14;
    v15 = [(HFServiceBuilder *)self _lazilyUpdateConfigurationState];
    v28[6] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:7];
    id v17 = [v9 chainFutures:v16];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __30__HFServiceBuilder_commitItem__block_invoke;
    v25[3] = &unk_26408CE18;
    v26 = v8;
    v27 = self;
    __int16 v18 = [v17 recover:v25];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __30__HFServiceBuilder_commitItem__block_invoke_2;
    v24[3] = &unk_264091218;
    v24[4] = self;
    id v19 = (id)[v18 addCompletionBlock:v24];
  }
  else
  {
    uint64_t v20 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Ignoring request to commit because the current user is not an administrator", buf, 2u);
    }

    __int16 v18 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v18;
}

id __30__HFServiceBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 name];
  id v7 = objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);

  id v8 = [v2 futureWithError:v7];

  return v8;
}

void __30__HFServiceBuilder_commitItem__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Commit for %@ finished with error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_lazilyUpdateName
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HFServiceBuilder *)self _shouldUpdateNilNameWithRoomName])
  {
    uint64_t v3 = [(HFServiceBuilder *)self room];
    id v4 = [v3 name];
    [(HFServiceBuilder *)self setName:v4];
  }
  else
  {
    uint64_t v3 = [(HFServiceBuilder *)self namingComponent];
    id v4 = [(HFServiceBuilder *)self name];
    id v5 = [v3 commitableNameForString:v4];
    [(HFServiceBuilder *)self setName:v5];
  }
  uint64_t v6 = [(HFServiceBuilder *)self name];
  int v7 = [(HFServiceBuilder *)self originalName];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    id v10 = v9;
    if (!v8)
    {

LABEL_13:
      objc_initWeak((id *)buf, self);
      v15 = (void *)MEMORY[0x263F58190];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke;
      v17[3] = &unk_26408F0F0;
      objc_copyWeak(&v18, (id *)buf);
      v14 = [v15 lazyFutureWithBlock:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_14;
    }
    char v11 = [v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_13;
    }
  }
  id v12 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(HFServiceBuilder *)self name];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v13;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);
  }
  v14 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_14:
  return v14;
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [WeakRetained service];
    id v8 = [v7 name];
    id v9 = [WeakRetained name];
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating name from \"%@\" to \"%@\"", buf, 0x16u);
  }
  id v10 = (void *)MEMORY[0x263F58190];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_33;
  v17[3] = &unk_26408F0F0;
  objc_copyWeak(&v18, v4);
  char v11 = [v10 futureWithBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_4;
  v15[3] = &unk_26408F238;
  void v15[4] = WeakRetained;
  id v12 = v3;
  id v16 = v12;
  id v13 = (id)[v11 addCompletionBlock:v15];
  id v14 = (id)[v11 addFailureBlock:&__block_literal_global_190];

  objc_destroyWeak(&v18);
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained service];
  int v7 = [v6 accessory];

  id v8 = [WeakRetained service];
  id v9 = [WeakRetained name];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2;
  v12[3] = &unk_264097038;
  objc_copyWeak(&v15, v4);
  id v10 = v3;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v8 updateName:v9 completionHandler:v12];

  objc_destroyWeak(&v15);
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    [a1[4] finishWithError:v3];
  }
  else if (objc_msgSend(a1[5], "hf_isSingleServiceLikeAccessory") {
         && ([WeakRetained service],
  }
             id v5 = objc_claimAutoreleasedReturnValue(),
             char v6 = objc_msgSend(v5, "hf_isChildService"),
             v5,
             (v6 & 1) == 0))
  {
    id v7 = a1[5];
    id v8 = [WeakRetained name];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_3;
    v9[3] = &unk_26408CDF0;
    id v10 = a1[4];
    [v7 updateName:v8 completionHandler:v9];
  }
  else
  {
    [a1[4] finishWithNoResult];
  }
}

uint64_t __37__HFServiceBuilder__lazilyUpdateName__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update name finished with error: %@", buf, 0xCu);
  }

  id v8 = +[HFHomeKitDispatcher sharedDispatcher];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_36;
  v16[3] = &unk_26408C938;
  v16[4] = *(void *)(a1 + 32);
  [v8 dispatchAccessoryObserverMessage:v16 sender:0];

  id v9 = [*(id *)(a1 + 32) name];
  id v10 = [*(id *)(a1 + 32) service];
  id v11 = [v10 name];
  id v12 = v9;
  id v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    id v14 = v13;
    if (!v12)
    {

      goto LABEL_10;
    }
    char v15 = [v12 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_11;
    }
  }
  id v10 = [*(id *)(a1 + 32) originalName];
  [*(id *)(a1 + 32) setName:v10];
LABEL_10:

LABEL_11:
  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_36(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) service];
    id v4 = [v3 accessory];
    id v5 = [*(id *)(a1 + 32) service];
    [v6 accessory:v4 didUpdateNameForService:v5];
  }
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceBuilder.updateName"];
}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      BOOL v5 = [(HFServiceBuilder *)self isFavorite];
      goto LABEL_6;
    case 1uLL:
      NSLog(&cfstr_IncludeInStatu_3.isa, a2);
      goto LABEL_13;
    case 3uLL:
      BOOL v5 = [(HFServiceBuilder *)self showInHomeDashboard];
LABEL_6:
      int v6 = v5;
      goto LABEL_7;
    default:
      int v6 = 0;
LABEL_7:
      id v7 = [(HFServiceBuilder *)self service];
      id v8 = [v7 accessory];
      id v9 = [v8 home];
      id v10 = [v9 accessories];
      id v11 = [(HFServiceBuilder *)self service];
      id v12 = [v11 accessory];
      char v13 = [v10 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        char v15 = HFLogForCategory(0x29uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v24 = a3;
          _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating state for context type %lu because accessory was removed from the home", buf, 0xCu);
        }

        goto LABEL_13;
      }
      id v14 = [(HFServiceBuilder *)self service];
      if (v6 == objc_msgSend(v14, "hf_isOnForContextType:", a3))
      {
        id v17 = [(HFServiceBuilder *)self service];
        int v18 = objc_msgSend(v17, "hf_hasSetForContextType:", a3);

        if (!v18) {
          goto LABEL_18;
        }
        uint64_t v19 = HFLogForCategory(0x29uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v24 = a3;
          __int16 v25 = 1024;
          int v26 = v6;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating state for context type %lu because it hasn't changed (currentState = %{BOOL}d)", buf, 0x12u);
        }

LABEL_13:
        id v16 = [MEMORY[0x263F58190] futureWithNoResult];
        goto LABEL_19;
      }

LABEL_18:
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke;
      v21[3] = &unk_2640911F0;
      v21[4] = self;
      v21[5] = a3;
      char v22 = v6;
      id v16 = [MEMORY[0x263F58190] lazyFutureWithBlock:v21];
LABEL_19:
      return v16;
  }
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) service];
    int v6 = [*(id *)(a1 + 32) service];
    id v7 = [v6 accessory];
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v37 = v5;
    __int16 v38 = 2112;
    v39 = v7;
    __int16 v40 = 2048;
    uint64_t v41 = v8;
    __int16 v42 = 1024;
    int v43 = v9;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating application data to set state for service %@, accessory: %@, context type %lu, currentState: %{BOOL}d)", buf, 0x26u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = [*(id *)(a1 + 32) service];
  id v12 = [v11 accessory];
  int v13 = objc_msgSend(v12, "hf_isHomePod");

  if (!v13
    || ([*(id *)(a1 + 32) service],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 accessory],
        char v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend(v15, "hf_hasSetForContextType:", *(void *)(a1 + 40)),
        v15,
        v14,
        v16))
  {
    id v17 = [*(id *)(a1 + 32) service];
    int v18 = objc_msgSend(v17, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));

    [v10 addObject:v18];
  }
  uint64_t v19 = [*(id *)(a1 + 32) service];
  uint64_t v20 = [v19 accessory];
  if (objc_msgSend(v20, "hf_showAsIndividualServices")) {
    goto LABEL_11;
  }
  __int16 v21 = [*(id *)(a1 + 32) service];
  if ((objc_msgSend(v21, "hf_shouldBeOnForContextType:", *(void *)(a1 + 40)) & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  char v22 = [*(id *)(a1 + 32) service];
  uint64_t v23 = [v22 accessory];

  if (v23)
  {
    unint64_t v24 = [*(id *)(a1 + 32) service];
    __int16 v25 = [v24 accessory];
    uint64_t v19 = objc_msgSend(v25, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));

    [v10 addObject:v19];
LABEL_12:
  }
  int v26 = [MEMORY[0x263F58190] chainFutures:v10];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_49;
  v33 = &unk_26408F238;
  uint64_t v34 = *(void *)(a1 + 32);
  id v35 = v3;
  id v27 = v3;
  id v28 = (id)[v26 addCompletionBlock:&v30];
  id v29 = (id)objc_msgSend(v26, "addFailureBlock:", &__block_literal_global_54_3, v30, v31, v32, v33, v34);
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update application data for setting favorite finished with error: %@", buf, 0xCu);
  }

  uint64_t v8 = +[HFHomeKitDispatcher sharedDispatcher];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_50;
  v9[3] = &unk_26408C938;
  void v9[4] = *(void *)(a1 + 32);
  [v8 dispatchAccessoryObserverMessage:v9 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_50(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) service];
    id v4 = [v3 accessory];
    id v5 = [*(id *)(a1 + 32) service];
    [v6 accessory:v4 didUpdateApplicationDataForService:v5];
  }
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceBuilder.updateFavorite"];
}

- (id)_lazilyUpdateRoom
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(HFServiceBuilder *)self service];
  id v4 = [v3 accessory];

  id v5 = [v4 room];
  id v6 = [v5 uniqueIdentifier];
  id v7 = [(HFServiceBuilder *)self room];
  uint64_t v8 = [v7 room];
  int v9 = [v8 uniqueIdentifier];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    id v11 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(HFServiceBuilder *)self room];
      *(_DWORD *)buf = 138412290;
      unint64_t v24 = v12;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating room because it hasn't changed (%@)", buf, 0xCu);
    }
    int v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F58190];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke;
    uint64_t v20 = &unk_26408F0C8;
    __int16 v21 = self;
    id v22 = v4;
    int v13 = [v14 lazyFutureWithBlock:&v17];
    id v15 = (id)objc_msgSend(v13, "addCompletionBlock:", &__block_literal_global_61_3, v17, v18, v19, v20, v21);
  }
  return v13;
}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = [*(id *)(a1 + 32) originalName];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
    char v8 = 1;
  }
  else if (v6)
  {
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  int v9 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [*(id *)(a1 + 40) room];
    id v11 = objc_msgSend(v10, "hf_prettyDescription");
    uint64_t v12 = [*(id *)(a1 + 32) room];
    int v13 = objc_msgSend(v12, "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Committing HFRoomBuilder to change room from %@ to %@", buf, 0x16u);
  }
  id v14 = [*(id *)(a1 + 32) room];
  [v14 addAccessory:*(void *)(a1 + 40)];

  id v15 = [*(id *)(a1 + 32) room];
  int v16 = [v15 commitItem];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_58;
  v19[3] = &unk_2640911A0;
  char v21 = v8;
  v19[4] = *(void *)(a1 + 32);
  id v20 = v3;
  id v17 = v3;
  id v18 = (id)[v16 addCompletionBlock:v19];
}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = [*(id *)(a1 + 32) originalName];
    [*(id *)(a1 + 32) setName:v6];
  }
  [*(id *)(a1 + 40) finishWithResult:v7 error:v5];
}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Room builder commit finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_lazilyUpdateIcon
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(HFServiceBuilder *)self service];
  id v4 = objc_msgSend(v3, "hf_iconDescriptor");
  int v5 = [v4 identifier];

  id v6 = [(HFServiceBuilder *)self iconDescriptor];
  uint64_t v7 = [v6 identifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    int v9 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(HFServiceBuilder *)self iconDescriptor];
      id v11 = [v10 identifier];
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating icon because it hasn't changed (%@)", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke;
    v15[3] = &unk_26408E4E0;
    void v15[4] = self;
    uint64_t v12 = [MEMORY[0x263F58190] lazyFutureWithBlock:v15];
  }
  int v13 = (void *)v12;

  return v13;
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) iconDescriptor];
    id v6 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating application data to set icon (%@)", buf, 0xCu);
  }
  uint64_t v7 = [*(id *)(a1 + 32) service];
  int v8 = [*(id *)(a1 + 32) iconDescriptor];
  int v9 = objc_msgSend(v7, "hf_updateIconDescriptor:", v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_62;
  v15[3] = &unk_26408F1C0;
  void v15[4] = *(void *)(a1 + 32);
  int v10 = [v9 recover:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_2;
  v13[3] = &unk_26408F238;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v11 = v3;
  id v12 = (id)[v10 addCompletionBlock:v13];
}

id __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(v3, "hf_isHMErrorWithCode:", 3) & 1) != 0
    || objc_msgSend(v3, "hf_isHFErrorWithCode:", 33))
  {
    id v4 = [*(id *)(a1 + 32) service];
    int v5 = +[HFServiceIconFactory defaultIconDescriptorForService:v4];

    id v6 = [*(id *)(a1 + 32) service];
    uint64_t v7 = objc_msgSend(v6, "hf_updateIconDescriptor:", v5);
  }
  else
  {
    int v8 = +[HFErrorHandler sharedHandler];
    [v8 logError:v3 operationDescription:@"HFServiceBuilder.updateIcon"];

    uint64_t v7 = [MEMORY[0x263F58190] futureWithError:v3];
  }

  return v7;
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [*(id *)(a1 + 32) iconDescriptor];
    int v9 = [v8 identifier];
    *(_DWORD *)buf = 138412546;
    int v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update application data for setting icon (%@) finished with error: %@", buf, 0x16u);
  }
  int v10 = +[HFHomeKitDispatcher sharedDispatcher];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_66;
  v11[3] = &unk_26408C938;
  v11[4] = *(void *)(a1 + 32);
  [v10 dispatchAccessoryObserverMessage:v11 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_66(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) service];
    id v4 = [v3 accessory];
    id v5 = [*(id *)(a1 + 32) service];
    [v6 accessory:v4 didUpdateApplicationDataForService:v5];
  }
}

- (id)_lazilyUpdateAssociatedServiceType
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(HFServiceBuilder *)self associatedServiceType];
  id v4 = [(HFServiceBuilder *)self service];
  id v5 = [v4 serviceType];
  int v6 = [(__CFString *)v3 isEqualToString:v5];

  if (v6)
  {

    id v3 = 0;
  }
  if (v3) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = &stru_26C081158;
  }
  int v8 = [(HFServiceBuilder *)self service];
  uint64_t v9 = [v8 associatedServiceType];
  int v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_26C081158;
  }
  int v12 = [(__CFString *)v7 isEqualToString:v11];

  if (v12)
  {
    int v13 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v21 = v3;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating associated service type because it hasn't changed (%@)", buf, 0xCu);
    }

    __int16 v14 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F58190];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke;
    v17[3] = &unk_26408F0C8;
    uint64_t v18 = v3;
    uint64_t v19 = self;
    __int16 v14 = [v15 lazyFutureWithBlock:v17];
  }
  return v14;
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating associated service type (%@)", buf, 0xCu);
  }

  int v6 = (void *)MEMORY[0x263F58190];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_67;
  v19[3] = &unk_26408E218;
  int8x16_t v14 = a1[2];
  id v7 = (id)v14.i64[0];
  int8x16_t v20 = vextq_s8(v14, v14, 8uLL);
  int v8 = [v6 futureWithErrorOnlyHandlerAdapterBlock:v19];
  id v9 = (id)[v8 addFailureBlock:&__block_literal_global_70_7];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_3;
  v15[3] = &unk_26408D260;
  id v10 = (id)a1[2].i64[0];
  uint64_t v11 = a1[2].i64[1];
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v3;
  id v12 = v3;
  id v13 = (id)[v8 addCompletionBlock:v15];
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 service];
  [v5 updateAssociatedServiceType:*(void *)(a1 + 40) completionHandler:v4];
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceBuilder.updateAssociatedServiceType"];
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update associated service type (%@) finished with error: %@", buf, 0x16u);
  }

  id v9 = +[HFHomeKitDispatcher sharedDispatcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_74;
  v10[3] = &unk_26408C938;
  v10[4] = *(void *)(a1 + 40);
  [v9 dispatchAccessoryObserverMessage:v10 sender:0];

  [*(id *)(a1 + 48) finishWithResult:v6 error:v5];
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_74(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) service];
    id v4 = [v3 accessory];
    id v5 = [*(id *)(a1 + 32) service];
    [v6 accessory:v4 didUpdateAssociatedServiceTypeForService:v5];
  }
}

- (id)_lazilyUpdateConfigurationState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFServiceBuilder *)self configurationState];
  id v4 = [(HFServiceBuilder *)self service];
  uint64_t v5 = [v4 configurationState];

  if (v3 == v5)
  {
    id v6 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromConfigurationState(v3);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating configuration state because it hasn't changed (%@)", buf, 0xCu);
    }
    uint64_t v8 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke;
    v10[3] = &unk_26408C8F0;
    v10[4] = self;
    void v10[5] = v3;
    uint64_t v8 = [MEMORY[0x263F58190] lazyFutureWithBlock:v10];
  }
  return v8;
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_2;
  v14[3] = &unk_26408E7A0;
  uint64_t v4 = *(void *)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  v14[5] = v4;
  uint64_t v5 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v14];
  id v6 = (id)[v5 addFailureBlock:&__block_literal_global_78_1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_4;
  v11[3] = &unk_2640914E8;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v7;
  v11[4] = v8;
  id v9 = v3;
  id v10 = (id)[v5 addCompletionBlock:v11];
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 service];
  [v5 updateConfigurationState:*(void *)(a1 + 40) completionHandler:v4];
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFServiceBuilder.updateConfigurationState"];
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromConfigurationState(*(void *)(a1 + 48));
    *(_DWORD *)buf = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update configuration state (%@) finished with error: %@", buf, 0x16u);
  }
  id v9 = +[HFHomeKitDispatcher sharedDispatcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_82;
  v10[3] = &unk_26408C938;
  v10[4] = *(void *)(a1 + 32);
  [v9 dispatchAccessoryObserverMessage:v10 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_82(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) service];
    id v4 = [v3 accessory];
    id v5 = [*(id *)(a1 + 32) service];
    [v6 accessory:v4 didUpdateConfigurationStateForService:v5];
  }
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (HFRoomBuilder)room
{
  return self->room;
}

- (void)setRoom:(id)a3
{
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

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (int64_t)configurationState
{
  return self->_configurationState;
}

- (void)setConfigurationState:(int64_t)a3
{
  self->_configurationState = a3;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end