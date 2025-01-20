@interface WFRideOptionsLoader
- (CLPlacemark)dropOffLocation;
- (CLPlacemark)pickupLocation;
- (NSArray)paymentMethods;
- (NSArray)rideOptions;
- (NSError)loadingOptionsError;
- (NSMutableArray)completionBlocks;
- (NSString)appBundleIdentifier;
- (OS_dispatch_queue)loadingOptionsQueue;
- (WFIntentExecutor)executor;
- (WFPaymentMethodParameter)paymentMethodParameterParameter;
- (WFRideOptionParameter)rideOptionParameterParameter;
- (WFRideOptionsLoader)init;
- (WFRideOptionsLoaderDelegate)delegate;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (unint64_t)loadingState;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)loadRideOptionsValueWithCompletion:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setExecutor:(id)a3;
- (void)setLoadingOptionsError:(id)a3;
- (void)setLoadingState:(unint64_t)a3;
- (void)setPaymentMethodParameterParameter:(id)a3;
- (void)setPaymentMethods:(id)a3;
- (void)setPickupLocation:(id)a3;
- (void)setRideOptionParameterParameter:(id)a3;
- (void)setRideOptions:(id)a3;
@end

@implementation WFRideOptionsLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingOptionsQueue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_loadingOptionsError, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_rideOptions, 0);
  objc_storeStrong((id *)&self->_paymentMethodParameterParameter, 0);
  objc_storeStrong((id *)&self->_rideOptionParameterParameter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
}

- (OS_dispatch_queue)loadingOptionsQueue
{
  return self->_loadingOptionsQueue;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setExecutor:(id)a3
{
}

- (WFIntentExecutor)executor
{
  return self->_executor;
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (void)setLoadingOptionsError:(id)a3
{
}

- (NSError)loadingOptionsError
{
  return self->_loadingOptionsError;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (WFPaymentMethodParameter)paymentMethodParameterParameter
{
  return self->_paymentMethodParameterParameter;
}

- (WFRideOptionParameter)rideOptionParameterParameter
{
  return self->_rideOptionParameterParameter;
}

- (void)setDelegate:(id)a3
{
}

- (WFRideOptionsLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRideOptionsLoaderDelegate *)WeakRetained;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v20;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  v9 = [v20 parameterStateForKey:v6];
  if ([v6 isEqualToString:*MEMORY[0x263F87200]])
  {
    v10 = [v8 intentDescriptor];
    v11 = [v10 bundleIdentifier];
    [(WFRideOptionsLoader *)self setAppBundleIdentifier:v11];
  }
  else if ([v6 isEqualToString:WFRequestRideActionPickupLocationParameterKey])
  {
    id v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    id v16 = v13;

    v17 = [v16 value];

    v10 = [v17 placemark];

    [(WFRideOptionsLoader *)self setPickupLocation:v10];
  }
  else
  {
    if (![v6 isEqualToString:WFRequestRideActionDropOffLocationParameterKey]) {
      goto LABEL_23;
    }
    id v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v18 = v15;

    v19 = [v18 value];

    v10 = [v19 placemark];

    [(WFRideOptionsLoader *)self setDropOffLocation:v10];
  }

LABEL_23:
}

- (void)loadRideOptionsValueWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WFRideOptionsLoader *)self loadingOptionsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke;
  v7[3] = &unk_264E5EE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) loadingState] == 2)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v23 = [*(id *)(a1 + 32) rideOptions];
    v3 = [*(id *)(a1 + 32) paymentMethods];
    id v4 = [*(id *)(a1 + 32) loadingOptionsError];
    (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v23, v3, v4);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) loadingState];
    id v6 = [*(id *)(a1 + 32) completionBlocks];
    v7 = _Block_copy(*(const void **)(a1 + 40));
    [v6 addObject:v7];

    if (v5 != 1)
    {
      [*(id *)(a1 + 32) setLoadingState:1];
      id v8 = [*(id *)(a1 + 32) appBundleIdentifier];
      v9 = [*(id *)(a1 + 32) pickupLocation];
      v10 = [*(id *)(a1 + 32) dropOffLocation];
      id v11 = objc_alloc(MEMORY[0x263F0FBF8]);
      id v12 = [*(id *)(a1 + 32) pickupLocation];
      v13 = [*(id *)(a1 + 32) dropOffLocation];
      id v14 = (void *)[v11 initWithPickupLocation:v12 dropOffLocation:v13];

      [v14 _setExecutionContext:7];
      [v14 _setLaunchId:v8];
      v15 = getWFActionsLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v14 launchId];
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFRideOptionsLoader loadRideOptionsValueWithCompletion:]_block_invoke";
        __int16 v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_INFO, "%s Retrieving available ride option for app %{public}@", buf, 0x16u);
      }
      v17 = (void *)[objc_alloc(MEMORY[0x263F86C40]) initWithIntent:v14 donateInteraction:0 groupIdentifier:0];
      [*(id *)(a1 + 32) setExecutor:v17];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_189;
      v24[3] = &unk_264E5EDA0;
      uint64_t v18 = *(void *)(a1 + 32);
      id v25 = v17;
      uint64_t v26 = v18;
      id v27 = v8;
      id v28 = v9;
      id v29 = v10;
      id v19 = v10;
      id v20 = v9;
      id v21 = v8;
      id v22 = v17;
      [v22 startWithCompletionHandler:v24];
    }
  }
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) executor];
  if (v7 != v8)
  {

    goto LABEL_30;
  }
  v9 = *(void **)(a1 + 48);
  v10 = [*(id *)(a1 + 40) appBundleIdentifier];
  id v11 = v9;
  id v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
  }
  else
  {
    if (!v11 || !v12)
    {

      goto LABEL_28;
    }
    int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_29;
    }
  }
  v15 = *(void **)(a1 + 56);
  id v16 = [*(id *)(a1 + 40) pickupLocation];
  id v17 = v15;
  id v18 = v16;
  id v11 = v18;
  if (v17 == v18)
  {
  }
  else
  {
    if (!v17 || !v18)
    {

      goto LABEL_28;
    }
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_28;
    }
  }
  id v20 = *(void **)(a1 + 64);
  id v21 = [*(id *)(a1 + 40) dropOffLocation];
  id v22 = v20;
  id v23 = v21;
  if (v22 != v23)
  {
    v24 = v23;
    if (v22 && v23)
    {
      char v25 = [v22 isEqual:v23];

      if ((v25 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_23;
    }

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }

LABEL_23:
  uint64_t v26 = [v5 intentResponse];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }
  id v28 = v27;

  id v29 = [v28 rideOptions];
  [*(id *)(a1 + 40) setRideOptions:v29];

  v30 = [v28 paymentMethods];

  [*(id *)(a1 + 40) setPaymentMethods:v30];
  uint64_t v37 = MEMORY[0x263EF8330];
  uint64_t v38 = 3221225472;
  v39 = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_2;
  v40 = &unk_264E5ED78;
  id v31 = *(id *)(a1 + 32);
  uint64_t v32 = *(void *)(a1 + 40);
  id v41 = v31;
  uint64_t v42 = v32;
  v33 = (void (**)(void *, id))_Block_copy(&v37);
  if (v6
    && (objc_msgSend(*(id *)(a1 + 40), "delegate", v37, v38, v39, v40),
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = objc_opt_respondsToSelector(),
        v34,
        (v35 & 1) != 0))
  {
    v36 = [*(id *)(a1 + 40) delegate];
    [v36 rideOptionsLoader:*(void *)(a1 + 40) errorFromListRideOptionsError:v6 updatedErrorHandler:v33];
  }
  else
  {
    v33[2](v33, v6);
  }

LABEL_30:
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = (void *)MEMORY[0x263EFF9A0];
    id v6 = [v3 userInfo];
    v7 = [v5 dictionaryWithDictionary:v6];

    id v8 = [*(id *)(a1 + 32) connection];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F87218]];

    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [v4 domain];
    id v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v7);
  }
  else
  {
    id v11 = 0;
  }
  [*(id *)(a1 + 40) setLoadingOptionsError:v11];
  [*(id *)(a1 + 40) setLoadingState:2];
  id v12 = [*(id *)(a1 + 40) completionBlocks];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    int v14 = [*(id *)(a1 + 40) loadingOptionsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_3;
    block[3] = &unk_264E5EE70;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v14, block);
  }
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlocks];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_4;
  v4[3] = &unk_264E5ED50;
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v4];

  id v3 = [*(id *)(a1 + 32) completionBlocks];
  [v3 removeAllObjects];
}

void __58__WFRideOptionsLoader_loadRideOptionsValueWithCompletion___block_invoke_4(uint64_t a1, void (**a2)(void, void, void, void))
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v8 = [v4 rideOptions];
  id v6 = [*(id *)(a1 + 32) paymentMethods];
  v7 = [*(id *)(a1 + 32) loadingOptionsError];
  ((void (**)(void, id, void *, void *))a2)[2](v5, v8, v6, v7);
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v11[3] = &unk_264E5ED28;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(WFRideOptionsLoader *)self loadRideOptionsValueWithCompletion:v11];
}

void __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = &__block_literal_global_55907;
    id v10 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = 0;
      id v11 = 0;
      goto LABEL_9;
    }
    id v9 = &__block_literal_global_184_55909;
    id v10 = v7;
  }
  id v11 = objc_msgSend(v10, "if_map:", v9);
  if (v11) {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:v11];
  }
  else {
    id v12 = 0;
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263F86C28];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

WFINRideOptionParameterState *__85__WFRideOptionsLoader_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(WFVariableSubstitutableParameterState *)[WFINRideOptionParameterState alloc] initWithValue:v2];

  return v3;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 value];
    uint64_t v6 = [v5 name];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v7 = [v5 value];
    uint64_t v8 = [v7 type];

    if (v8 != 8)
    {
      id v11 = [v5 value];
      id v12 = [v11 name];
      id v13 = [v5 value];
      int v14 = [v13 identificationHint];
      id v9 = [v12 stringByAppendingFormat:@" - %@", v14];

      goto LABEL_7;
    }
    uint64_t v6 = WFLocalizedString(@"Apple Pay");
LABEL_6:
    id v9 = (void *)v6;
LABEL_7:

    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
  if ([(WFRideOptionsLoader *)self loadingState] != 1)
  {
    [(WFRideOptionsLoader *)self setExecutor:0];
  }
}

- (void)setPaymentMethods:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  paymentMethods = self->_paymentMethods;
  self->_paymentMethods = v4;

  id v6 = [(WFRideOptionsLoader *)self paymentMethodParameterParameter];
  [v6 reloadPossibleStates];
}

- (void)setRideOptions:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  rideOptions = self->_rideOptions;
  self->_rideOptions = v4;

  id v6 = [(WFRideOptionsLoader *)self rideOptionParameterParameter];
  [v6 reloadPossibleStates];
}

- (void)setDropOffLocation:(id)a3
{
  id v5 = a3;
  id v6 = [(WFRideOptionsLoader *)self dropOffLocation];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_dropOffLocation, a3);
    id v10 = [(WFRideOptionsLoader *)self loadingOptionsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WFRideOptionsLoader_setDropOffLocation___block_invoke;
    block[3] = &unk_264E5EE70;
    block[4] = self;
    dispatch_async(v10, block);
  }
LABEL_9:
}

uint64_t __42__WFRideOptionsLoader_setDropOffLocation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) loadingState]) {
    [*(id *)(a1 + 32) setLoadingState:0];
  }
  [*(id *)(a1 + 32) setRideOptions:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setPaymentMethods:0];
}

- (void)setPickupLocation:(id)a3
{
  id v5 = a3;
  id v6 = [(WFRideOptionsLoader *)self pickupLocation];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_pickupLocation, a3);
    id v10 = [(WFRideOptionsLoader *)self loadingOptionsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WFRideOptionsLoader_setPickupLocation___block_invoke;
    block[3] = &unk_264E5EE70;
    block[4] = self;
    dispatch_async(v10, block);
  }
LABEL_9:
}

uint64_t __41__WFRideOptionsLoader_setPickupLocation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) loadingState]) {
    [*(id *)(a1 + 32) setLoadingState:0];
  }
  [*(id *)(a1 + 32) setRideOptions:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setPaymentMethods:0];
}

- (void)setAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(WFRideOptionsLoader *)self appBundleIdentifier];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqualToString:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
    id v10 = [(WFRideOptionsLoader *)self loadingOptionsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__WFRideOptionsLoader_setAppBundleIdentifier___block_invoke;
    block[3] = &unk_264E5EE70;
    block[4] = self;
    dispatch_async(v10, block);
  }
LABEL_9:
}

uint64_t __46__WFRideOptionsLoader_setAppBundleIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) loadingState]) {
    [*(id *)(a1 + 32) setLoadingState:0];
  }
  [*(id *)(a1 + 32) setRideOptions:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setPaymentMethods:0];
}

- (void)setPaymentMethodParameterParameter:(id)a3
{
  id v5 = a3;
  id v6 = self->_paymentMethodParameterParameter;
  id v7 = (WFPaymentMethodParameter *)v5;
  char v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(WFPaymentMethodParameter *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_paymentMethodParameterParameter, a3);
    [(WFPaymentMethodParameter *)self->_paymentMethodParameterParameter setDataSource:self];
    [(WFPaymentMethodParameter *)self->_paymentMethodParameterParameter reloadPossibleStates];
  }
LABEL_9:
}

- (void)setRideOptionParameterParameter:(id)a3
{
  id v5 = a3;
  id v6 = self->_rideOptionParameterParameter;
  id v7 = (WFRideOptionParameter *)v5;
  char v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(WFRideOptionParameter *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_rideOptionParameterParameter, a3);
    [(WFDynamicEnumerationParameter *)self->_rideOptionParameterParameter setDataSource:self];
    [(WFDynamicEnumerationParameter *)self->_rideOptionParameterParameter reloadPossibleStates];
  }
LABEL_9:
}

- (WFRideOptionsLoader)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFRideOptionsLoader;
  id v2 = [(WFRideOptionsLoader *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Shortcuts.actions.RequestRide.LoadOptionsQueue", 0);
    loadingOptionsQueue = v2->_loadingOptionsQueue;
    v2->_loadingOptionsQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = (NSMutableArray *)v5;

    id v7 = v2;
  }

  return v2;
}

@end