@interface HFAccessoryBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)_shouldUpdateNilNameWithRoomName;
- (BOOL)isFavorite;
- (BOOL)showInHomeDashboard;
- (BOOL)skipPropagateFavoriteToServices;
- (BOOL)supportsFavoriting;
- (HFAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFNamingComponents)namingComponent;
- (HFRoomBuilder)room;
- (NSString)name;
- (NSString)originalName;
- (id)_lazilyUpdateName;
- (id)_lazilyUpdateRoom;
- (id)_lazilyUpdateValueForContextType:(unint64_t)a3;
- (id)_performValidation;
- (id)accessories;
- (id)commitItem;
- (id)removeItemFromHome;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setRoom:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
- (void)setSkipPropagateFavoriteToServices:(BOOL)a3;
@end

@implementation HFAccessoryBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFAccessoryBuilder.m", 43, @"%@ can only be used with existing HMAccessories", objc_opt_class() object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)HFAccessoryBuilder;
  v9 = [(HFItemBuilder *)&v22 initWithExistingObject:v7 inHome:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(HFItemBuilder *)v9 homeKitRepresentation];
    v12 = +[HFNamingComponents namingComponentFromAccessory:v11];
    [(HFAccessoryBuilder *)v10 setNamingComponent:v12];

    v13 = [(HFAccessoryBuilder *)v10 originalName];
    [(HFAccessoryBuilder *)v10 setName:v13];

    v14 = [HFRoomBuilder alloc];
    v15 = [(HFAccessoryBuilder *)v10 accessory];
    v16 = [v15 room];
    v17 = [(HFRoomBuilder *)v14 initWithExistingObject:v16 inHome:v8];
    [(HFAccessoryBuilder *)v10 setRoom:v17];

    v18 = [(HFAccessoryBuilder *)v10 accessory];
    -[HFAccessoryBuilder setShowInHomeDashboard:](v10, "setShowInHomeDashboard:", objc_msgSend(v18, "hf_effectiveShowInHomeDashboard"));

    v19 = [(HFAccessoryBuilder *)v10 accessory];
    -[HFAccessoryBuilder setIsFavorite:](v10, "setIsFavorite:", objc_msgSend(v19, "hf_effectiveIsFavorite"));

    [(HFAccessoryBuilder *)v10 setSkipPropagateFavoriteToServices:0];
  }

  return v10;
}

- (NSString)originalName
{
  v2 = [(HFAccessoryBuilder *)self namingComponent];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (id)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFAccessoryBuilder *)self accessory];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (BOOL)supportsFavoriting
{
  v2 = [(HFAccessoryBuilder *)self accessory];
  char v3 = objc_msgSend(v2, "hf_isNetworkRouter");

  return v3 ^ 1;
}

- (id)removeItemFromHome
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F58190]);
  v4 = [(HFAccessoryBuilder *)self accessories];
  v5 = [v4 anyObject];

  v6 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v5, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Removing accessory from home: %@", buf, 0xCu);
  }
  id v8 = [(HFItemBuilder *)self home];
  v9 = [v3 errorOnlyCompletionHandlerAdapter];
  [v8 removeAccessory:v5 completionHandler:v9];

  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke;
  v17[3] = &unk_2640910B0;
  objc_copyWeak(&v19, (id *)buf);
  id v10 = v5;
  id v18 = v10;
  v11 = [v3 flatMap:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_2;
  v15[3] = &unk_26408F1C0;
  id v12 = v10;
  id v16 = v12;
  v13 = [v11 recover:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v13;
}

id __40__HFAccessoryBuilder_removeItemFromHome__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to remove accessory from home completed successfully: %@", buf, 0xCu);
  }
  v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_10;
  v11 = &unk_26408D8F0;
  id v12 = WeakRetained;
  id v13 = *(id *)(a1 + 32);
  [v5 dispatchHomeObserverMessage:&v8 sender:0];

  v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v8, v9, v10, v11, v12);

  return v6;
}

void __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didRemoveAccessory:*(void *)(a1 + 40)];
  }
}

id __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to remove accessory from home failed with error: %@, %@", buf, 0x16u);
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

- (BOOL)_shouldUpdateNilNameWithRoomName
{
  v5 = [(HFAccessoryBuilder *)self name];

  if (!v5)
  {
    id v7 = [(HFAccessoryBuilder *)self accessory];
    int v8 = objc_msgSend(v7, "hf_isMediaAccessory");
    if (v8)
    {
      v2 = [(HFAccessoryBuilder *)self accessory];
      if (objc_msgSend(v2, "hf_isHomePod"))
      {
        int v9 = 0;
      }
      else
      {
        id v3 = [(HFAccessoryBuilder *)self accessory];
        if ((objc_msgSend(v3, "hf_isAppleTV") & 1) == 0)
        {

          char v6 = 1;
          goto LABEL_15;
        }
        int v9 = 1;
      }
    }
    else
    {
      int v9 = 0;
    }
    id v10 = [(HFAccessoryBuilder *)self accessory];
    char v6 = objc_msgSend(v10, "hf_isTelevision");

    if (v9)
    {

      if ((v8 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else if (!v8)
    {
      goto LABEL_16;
    }
LABEL_15:

LABEL_16:
    return v6;
  }
  return 0;
}

- (id)_performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"room"];
}

- (id)commitItem
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Starting commit (%@)", buf, 0xCu);
  }

  id v4 = [(HFItemBuilder *)self home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (v5)
  {
    char v6 = objc_opt_new();
    id v7 = [(HFAccessoryBuilder *)self _lazilyUpdateValueForContextType:3];
    objc_msgSend(v6, "na_safeAddObject:", v7);

    int v8 = [(HFAccessoryBuilder *)self accessory];
    char v9 = objc_msgSend(v8, "hf_isCamera");

    if ((v9 & 1) == 0)
    {
      id v10 = [(HFAccessoryBuilder *)self _lazilyUpdateValueForContextType:2];
      objc_msgSend(v6, "na_safeAddObject:", v10);
    }
    v11 = [MEMORY[0x263F58190] combineAllFutures:v6];
    id v12 = @"HFOperationEditService";
    id v13 = (void *)MEMORY[0x263F58190];
    v14 = [(HFAccessoryBuilder *)self _performValidation];
    v25[0] = v14;
    v15 = [(HFAccessoryBuilder *)self _lazilyUpdateName];
    v25[1] = v15;
    uint64_t v16 = [(HFAccessoryBuilder *)self _lazilyUpdateRoom];
    v25[2] = v16;
    v25[3] = v11;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    __int16 v18 = [v13 chainFutures:v17];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __32__HFAccessoryBuilder_commitItem__block_invoke;
    v22[3] = &unk_26408CE18;
    v23 = v12;
    v24 = self;
    id v19 = [v18 recover:v22];
  }
  else
  {
    uint64_t v20 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Ignoring request to commit because the current user is not an administrator", buf, 2u);
    }

    id v19 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v19;
}

id __32__HFAccessoryBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  char v6 = [v4 name];
  id v7 = objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);

  int v8 = [v2 futureWithError:v7];

  return v8;
}

- (id)_lazilyUpdateName
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(HFAccessoryBuilder *)self _shouldUpdateNilNameWithRoomName])
  {
    uint64_t v3 = [(HFAccessoryBuilder *)self room];
    id v4 = [v3 name];
    [(HFAccessoryBuilder *)self setName:v4];
  }
  else
  {
    uint64_t v3 = [(HFAccessoryBuilder *)self namingComponent];
    id v4 = [(HFAccessoryBuilder *)self name];
    id v5 = [v3 commitableNameForString:v4];
    [(HFAccessoryBuilder *)self setName:v5];
  }
  char v6 = [(HFAccessoryBuilder *)self name];
  id v7 = [(HFAccessoryBuilder *)self originalName];
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
      v15 = [(HFAccessoryBuilder *)self accessory];
      uint64_t v16 = [(HFAccessoryBuilder *)self name];
      id v17 = (void *)MEMORY[0x263F58190];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke;
      v21[3] = &unk_26408F0C8;
      id v22 = v15;
      id v23 = v16;
      id v18 = v16;
      id v19 = v15;
      v14 = [v17 lazyFutureWithBlock:v21];

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
    id v13 = [(HFAccessoryBuilder *)self name];
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);
  }
  v14 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_14:
  return v14;
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) name];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating name from \"%@\" to \"%@\"", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x263F58190];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_25;
  v19[3] = &unk_26408E218;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v8 = [v7 futureWithErrorOnlyHandlerAdapterBlock:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2;
  v15[3] = &unk_264091178;
  id v16 = *(id *)(a1 + 32);
  id v9 = v3;
  id v17 = v9;
  id v18 = *(id *)(a1 + 40);
  id v10 = (id)[v8 addSuccessBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_43;
  v13[3] = &unk_26408CDF0;
  id v14 = v9;
  id v11 = v9;
  id v12 = (id)[v8 addFailureBlock:v13];
}

uint64_t __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_25(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAccessoryName:*(void *)(a1 + 40) completionHandler:a2];
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_3;
  v32[3] = &unk_26408C938;
  id v33 = a1[4];
  [v4 dispatchAccessoryObserverMessage:v32 sender:0];

  if ((objc_msgSend(a1[4], "hf_isSingleServiceLikeAccessory") & 1) == 0)
  {
    [a1[5] finishWithResult:v3];
    goto LABEL_9;
  }
  id v5 = objc_msgSend(a1[4], "hf_visibleServices");
  id v6 = [v5 anyObject];
  if (v6) {
    goto LABEL_5;
  }
  id v7 = objc_msgSend(a1[4], "hf_primaryService");
  if (v7)
  {
    id v6 = v7;

LABEL_5:
    goto LABEL_6;
  }
  id v14 = objc_msgSend(a1[4], "hf_programmableSwitchServices");
  id v6 = [v14 anyObject];

  if (!v6)
  {
    v15 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Attempted to name a single service accessory without a visible service", buf, 2u);
    }

    id v16 = a1[5];
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v16 finishWithError:v11];
    goto LABEL_7;
  }
LABEL_6:
  id v8 = (void *)MEMORY[0x263F58190];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_31;
  v27[3] = &unk_2640910D8;
  id v9 = v6;
  id v28 = v9;
  id v29 = a1[6];
  id v30 = a1[4];
  id v10 = [v8 futureWithErrorOnlyHandlerAdapterBlock:v27];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_32;
  v21[3] = &unk_264091128;
  id v22 = a1[4];
  id v23 = v9;
  id v24 = a1[6];
  id v25 = a1[5];
  id v26 = v3;
  id v11 = v9;
  id v12 = (id)[v10 addSuccessBlock:v21];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_37;
  v17[3] = &unk_264091150;
  id v18 = a1[6];
  id v19 = a1[4];
  id v20 = a1[5];
  id v13 = (id)[v10 addFailureBlock:v17];

LABEL_7:
LABEL_9:
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateName:*(void *)(a1 + 32)];
  }
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) updateName:*(void *)(a1 + 40) completionHandler:a2];
  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ service %@ name %@ (same as accessory name)", (uint8_t *)&v7, 0x20u);
  }
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_32(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  int v7 = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2_33;
  uint64_t v8 = &unk_264091100;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v2 dispatchAccessoryObserverMessage:&v5 sender:0];

  id v3 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Successfully applied primary service level name %@ to accessory", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(void *)(a1 + 64), v5, v6, v7, v8);
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessory:*(void *)(a1 + 32) didUpdateNameForService:*(void *)(a1 + 40)];
  }
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Unable to apply primary service level name: %@ to accessory %@ | %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v5 = +[HFErrorHandler sharedHandler];
  [v5 logError:v3 operationDescription:@"HFAccessoryBuilder.updateName"];

  [*(id *)(a1 + 48) finishWithError:v3];
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to update name finished with error: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = +[HFErrorHandler sharedHandler];
  [v5 logError:v3 operationDescription:@"HFAccessoryBuilder.updateSingleServiceLikeAccessoryName"];

  [*(id *)(a1 + 32) finishWithError:v3];
}

- (id)_lazilyUpdateRoom
{
  id v3 = [(HFAccessoryBuilder *)self accessory];
  uint64_t v4 = [v3 room];
  uint64_t v5 = [v4 uniqueIdentifier];
  int v6 = [(HFAccessoryBuilder *)self room];
  id v7 = [v6 room];
  uint64_t v8 = [v7 uniqueIdentifier];
  int v9 = [v5 isEqual:v8];

  __int16 v10 = (void *)MEMORY[0x263F58190];
  if (v9)
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke;
    v13[3] = &unk_26408F0C8;
    void v13[4] = self;
    id v14 = v3;
    uint64_t v11 = [v10 lazyFutureWithBlock:v13];
  }
  return v11;
}

void __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [*(id *)(a1 + 32) originalName];
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
    __int16 v10 = [*(id *)(a1 + 40) room];
    uint64_t v11 = objc_msgSend(v10, "hf_prettyDescription");
    __int16 v12 = [*(id *)(a1 + 32) room];
    id v13 = objc_msgSend(v12, "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Committing HFRoomBuilder to change room from %@ to %@", buf, 0x16u);
  }
  id v14 = [*(id *)(a1 + 32) room];
  [v14 addAccessory:*(void *)(a1 + 40)];

  v15 = [*(id *)(a1 + 32) room];
  id v16 = [v15 commitItem];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke_48;
  v19[3] = &unk_2640911A0;
  char v21 = v8;
  void v19[4] = *(void *)(a1 + 32);
  id v20 = v3;
  id v17 = v3;
  id v18 = (id)[v16 addCompletionBlock:v19];
}

void __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Room builder commit finished with error: %@", (uint8_t *)&v9, 0xCu);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    char v8 = [*(id *)(a1 + 32) originalName];
    [*(id *)(a1 + 32) setName:v8];
  }
  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      BOOL v5 = [(HFAccessoryBuilder *)self isFavorite];
      goto LABEL_6;
    case 1uLL:
      NSLog(&cfstr_IncludeInStatu.isa, a2);
      goto LABEL_17;
    case 3uLL:
      BOOL v5 = [(HFAccessoryBuilder *)self showInHomeDashboard];
LABEL_6:
      int v6 = v5;
      goto LABEL_7;
    default:
      int v6 = 0;
LABEL_7:
      id v7 = [(HFAccessoryBuilder *)self accessory];
      char v8 = [v7 home];
      int v9 = [v8 accessories];
      id v10 = [(HFAccessoryBuilder *)self accessory];
      char v11 = [v9 containsObject:v10];

      if ((v11 & 1) == 0)
      {
        v15 = HFLogForCategory(0x29uLL);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 134217984;
        unint64_t v25 = a3;
        id v16 = "HFAccessoryBuilder: Not updating overall state for context type: %lu because accessory was removed from the home";
        id v17 = v15;
        uint32_t v18 = 12;
        goto LABEL_15;
      }
      __int16 v12 = [(HFAccessoryBuilder *)self accessory];
      if (v6 != objc_msgSend(v12, "hf_shouldBeOnForContextType:", a3))
      {
LABEL_11:

LABEL_12:
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke;
        v22[3] = &unk_2640911F0;
        char v23 = v6;
        void v22[4] = self;
        v22[5] = a3;
        id v14 = [MEMORY[0x263F58190] lazyFutureWithBlock:v22];
        goto LABEL_18;
      }
      id v13 = [(HFAccessoryBuilder *)self accessory];
      if (v6 != objc_msgSend(v13, "hf_isOnForContextType:", a3))
      {

        goto LABEL_11;
      }
      id v20 = [(HFAccessoryBuilder *)self accessory];
      int v21 = objc_msgSend(v20, "hf_hasSetForContextType:", a3);

      if (!v21) {
        goto LABEL_12;
      }
      v15 = HFLogForCategory(0x29uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v25 = a3;
        __int16 v26 = 1024;
        int v27 = v6;
        id v16 = "HFAccessoryBuilder: Not updating overall state for context type: %lu because it hasn't changed (state = %{BOOL}d)";
        id v17 = v15;
        uint32_t v18 = 18;
LABEL_15:
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
LABEL_16:

LABEL_17:
      id v14 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_18:
      return v14;
  }
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    uint64_t v34 = v5;
    __int16 v35 = 1024;
    LODWORD(v36) = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating application data to set state for context type: %lu, currentState: %{BOOL}d", buf, 0x12u);
  }

  id v7 = [*(id *)(a1 + 32) accessory];
  if (*(unsigned __int8 *)(a1 + 48) == objc_msgSend(v7, "hf_isOnForContextType:", *(void *)(a1 + 40)))
  {
    char v8 = [*(id *)(a1 + 32) accessory];
    int v9 = objc_msgSend(v8, "hf_shouldBeOnForContextType:", *(void *)(a1 + 40));
    int v10 = *(unsigned __int8 *)(a1 + 48);

    if (v10 == v9)
    {
      char v11 = HFLogForCategory(0x29uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 134218240;
        uint64_t v34 = v12;
        __int16 v35 = 1024;
        LODWORD(v36) = v13;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Skipping accessory state update for context type: %lu because it hasn't changed (state = %{BOOL}d)", buf, 0x12u);
      }
LABEL_17:

      id v22 = [MEMORY[0x263F58190] futureWithNoResult];
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v14 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    uint64_t v34 = v15;
    __int16 v35 = 1024;
    LODWORD(v36) = v16;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating accessory state for context type: %lu, currentState: %{BOOL}d", buf, 0x12u);
  }

  int v17 = [*(id *)(a1 + 32) skipPropagateFavoriteToServices];
  uint32_t v18 = [*(id *)(a1 + 32) accessory];
  id v19 = v18;
  if (v17)
  {
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
    {
      char v11 = HFLogForCategory(0x29uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        __int16 v24 = [*(id *)(a1 + 32) accessory];
        *(_DWORD *)buf = 134218242;
        uint64_t v34 = v23;
        __int16 v35 = 2112;
        v36 = v24;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Skipping accessory state update for context type: %lu because accessory does not implement hf_updateValueForCurrentObjectOnly, which shouldn't be possible for %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    id v19 = [*(id *)(a1 + 32) accessory];
    uint64_t v21 = objc_msgSend(v19, "hf_updateValueForCurrentObjectOnly:forContextType:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v21 = objc_msgSend(v18, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
  id v22 = (void *)v21;

LABEL_18:
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_55;
  v31[3] = &unk_2640911C8;
  v31[4] = *(void *)(a1 + 32);
  id v25 = v3;
  id v32 = v25;
  id v26 = (id)[v22 addSuccessBlock:v31];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_3;
  v29[3] = &unk_26408CDF0;
  id v30 = v25;
  id v27 = v25;
  id v28 = (id)[v22 addFailureBlock:v29];
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_2;
  v5[3] = &unk_26408C938;
  v5[4] = *(void *)(a1 + 32);
  [v4 dispatchAccessoryObserverMessage:v5 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v3];
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) accessory];
    [v4 accessoryDidUpdateApplicationData:v3];
  }
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to update application data for setting favorite finished with error: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = +[HFErrorHandler sharedHandler];
  [v5 logError:v3 operationDescription:@"HFAccessoryBuilder.updateFavorite"];

  [*(id *)(a1 + 32) finishWithError:v3];
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

- (BOOL)skipPropagateFavoriteToServices
{
  return self->_skipPropagateFavoriteToServices;
}

- (void)setSkipPropagateFavoriteToServices:(BOOL)a3
{
  self->_skipPropagateFavoriteToServices = a3;
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
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end