@interface HFItem
- (BOOL)_debug_isChildItem;
- (BOOL)resultsContainRequiredProperties:(id)a3;
- (HFItemManager)_debug_owningItemManager;
- (NAFuture)cancellableInFlightUpdateFuture;
- (NSDictionary)latestResults;
- (NSString)moduleIdentifier;
- (id)_finalOutcomeForSubclassOutcome:(id)a3 previousResults:(id)a4 updateOptions:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)updateWithOptions:(id)a3;
- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3;
- (unint64_t)loadingState;
- (void)copyLatestResultsFromItem:(id)a3;
- (void)setCancellableInFlightUpdateFuture:(id)a3;
- (void)setLatestResults:(id)a3;
- (void)setLoadingState:(unint64_t)a3;
- (void)setModuleIdentifier:(id)a3;
- (void)set_debug_isChildItem:(BOOL)a3;
- (void)set_debug_owningItemManager:(id)a3;
@end

@implementation HFItem

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

uint64_t __28__HFItem_updateWithOptions___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (NSDictionary)latestResults
{
  return self->_latestResults;
}

id __28__HFItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HFItem.m", 81, @"Invalid parameter not satisfying: %@", @"subclassOutcome != nil" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HFItem.m", 82, @"Invalid parameter not satisfying: %@", @"[subclassOutcome isKindOfClass:[HFItemUpdateOutcome class]]" object file lineNumber description];
  }
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  v5 = [*(id *)(a1 + 32) _finalOutcomeForSubclassOutcome:v3 previousResults:*(void *)(a1 + 40) updateOptions:*(void *)(a1 + 48)];
  v6 = [v5 results];
  [*(id *)(a1 + 32) setLatestResults:v6];

  if (+[HFUtilities isDetailedSignpostLoggingEnabled])
  {
    v7 = HFLogForCategory(0x32uLL);
    v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 64);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = objc_opt_class();
      _os_signpost_emit_with_name_impl(&dword_20B986000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HFItemUpdate", "%@", buf, 0xCu);
    }
  }
  [v4 finishWithResult:v5];

  return v4;
}

- (void)setLatestResults:(id)a3
{
}

- (id)updateWithOptions:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:HFItemUpdateOptionLogger];
  v7 = [(HFItem *)self cancellableInFlightUpdateFuture];
  if (v7)
  {
    v8 = [(HFItem *)self cancellableInFlightUpdateFuture];
    char v9 = [v8 isFinished];

    if ((v9 & 1) == 0)
    {
      v10 = [v5 objectForKeyedSubscript:HFItemUpdateOptionAllowInFlightResults];
      int v11 = [v10 BOOLValue];

      if (v11)
      {
        v12 = [(HFItem *)self cancellableInFlightUpdateFuture];
        goto LABEL_21;
      }
      if (v6)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v13 = [v6 loggerActivity];
        os_activity_scope_enter(v13, &state);

        uint64_t v14 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(HFItem *)self description];
          *(_DWORD *)buf = 138412290;
          v48 = v15;
          _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Asked to update item [%@] with an in-flight update. Cancelling the in-flight update before starting the new update.", buf, 0xCu);
        }
        os_activity_scope_leave(&state);
      }
      else
      {
        v32 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(HFItem *)self description];
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v33;
          _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "Asked to update item [%@] with an in-flight update. Cancelling the in-flight update before starting the new update.", (uint8_t *)&state, 0xCu);
        }
      }
      v16 = [(HFItem *)self cancellableInFlightUpdateFuture];
      [v16 cancel];

      [(HFItem *)self setCancellableInFlightUpdateFuture:0];
    }
  }
  if (+[HFUtilities isDetailedSignpostLoggingEnabled])
  {
    v17 = HFLogForCategory(0x32uLL);
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    v19 = HFLogForCategory(0x32uLL);
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      uint64_t v21 = objc_opt_class();
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_20B986000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "HFItemUpdate", "%@", (uint8_t *)&state, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v18 = 0;
  }
  v22 = [(HFItem *)self latestResults];
  v23 = (void *)[v22 copy];

  v24 = [(HFItem *)self _subclass_updateWithOptions:v5];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __28__HFItem_updateWithOptions___block_invoke;
  v42[3] = &unk_2640931B8;
  SEL v45 = a2;
  v42[4] = self;
  id v25 = v23;
  id v43 = v25;
  id v44 = v5;
  os_signpost_id_t v46 = v18;
  v12 = [v24 flatMap:v42];
  if (+[HFUtilities isDetailedSignpostLoggingEnabled])
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __28__HFItem_updateWithOptions___block_invoke_38;
    v41[3] = &unk_2640908A0;
    v41[4] = self;
    v41[5] = v18;
    id v26 = (id)[v12 addFailureBlock:v41];
  }
  if (v6)
  {
    objc_initWeak((id *)&state, v6);
    v27 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __28__HFItem_updateWithOptions___block_invoke_41;
    v39[3] = &unk_26408DB10;
    objc_copyWeak(&v40, (id *)&state);
    v39[4] = self;
    v28 = [v27 afterDelay:v39 performBlock:10.0];

    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __28__HFItem_updateWithOptions___block_invoke_43;
    v37 = &unk_2640931E0;
    id v29 = v28;
    id v38 = v29;
    id v30 = (id)[v12 addCompletionBlock:&v34];

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)&state);
  }
  -[HFItem setCancellableInFlightUpdateFuture:](self, "setCancellableInFlightUpdateFuture:", v24, v34, v35, v36, v37);

LABEL_21:
  return v12;
}

- (NAFuture)cancellableInFlightUpdateFuture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancellableInFlightUpdateFuture);
  return (NAFuture *)WeakRetained;
}

- (void)setCancellableInFlightUpdateFuture:(id)a3
{
}

- (id)_finalOutcomeForSubclassOutcome:(id)a3 previousResults:(id)a4 updateOptions:(id)a5
{
  id v6 = a3;
  v7 = (void *)[v6 mutableCopy];
  if ([(HFItem *)self conformsToProtocol:&unk_26C0FBAD0])
  {
    v8 = [(HFItem *)self homeKitObject];
    if (v8)
    {
      char v9 = [v6 objectForKeyedSubscript:@"dependentHomeKitObjects"];
      v10 = (void *)[v9 mutableCopy];

      if (!v10)
      {
        v10 = [MEMORY[0x263EFF9C0] set];
      }
      [v10 addObject:v8];
      [v7 setObject:v10 forKeyedSubscript:@"dependentHomeKitObjects"];
    }
  }

  return v7;
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  id v4 = [(HFItem *)self latestResults];
  id v5 = [v4 objectForKeyedSubscript:@"isInStateTransition"];

  if ([v5 BOOLValue]) {
    a3 |= 2uLL;
  }

  return a3;
}

- (id)description
{
  id v3 = [(HFItem *)self latestResults];
  id v4 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v5 = [v4 integerValue];

  id v6 = @"NotSet";
  if (v5 == 1) {
    id v6 = @"Normal";
  }
  if (v5 == 2) {
    v7 = @"Abnormal";
  }
  else {
    v7 = v6;
  }
  v8 = NSString;
  char v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  int v11 = [(HFItem *)self latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"title"];
  v13 = (void *)v12;
  if (v12)
  {
    uint64_t v14 = [v8 stringWithFormat:@"<%@: %p> \"%@\" state:%@", v10, self, v12, v7];
  }
  else
  {
    uint64_t v15 = [(HFItem *)self latestResults];
    v16 = [v15 objectForKeyedSubscript:@"description"];
    uint64_t v14 = [v8 stringWithFormat:@"<%@: %p> \"%@\" state:%@", v10, self, v16, v7];
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_destroyWeak((id *)&self->__debug_owningItemManager);
  objc_destroyWeak((id *)&self->_cancellableInFlightUpdateFuture);
  objc_storeStrong((id *)&self->_latestResults, 0);
}

- (void)setModuleIdentifier:(id)a3
{
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (BOOL)_debug_isChildItem
{
  return self->__debug_isChildItem;
}

- (HFItemManager)_debug_owningItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__debug_owningItemManager);
  return (HFItemManager *)WeakRetained;
}

- (void)set_debug_owningItemManager:(id)a3
{
}

- (void)set_debug_isChildItem:(BOOL)a3
{
  self->__debug_isChildItem = a3;
}

- (void)copyLatestResultsFromItem:(id)a3
{
  id v5 = a3;
  id v6 = [(HFItem *)self latestResults];

  if (v6) {
    NSLog(&cfstr_AlreadyHasResu.isa, self);
  }
  if (([v5 isMemberOfClass:objc_opt_class()] & 1) == 0) {
    NSLog(&cfstr_MismatchedItem.isa, self, v5);
  }
  v7 = [v5 latestResults];
  v8 = (void *)[v7 mutableCopy];

  char v9 = [v8 objectForKeyedSubscript:@"childItems"];
  if ([v9 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__HFItem_copyLatestResultsFromItem___block_invoke;
    v11[3] = &unk_264093208;
    SEL v13 = a2;
    v11[4] = self;
    id v12 = v5;
    v10 = objc_msgSend(v9, "na_map:", v11);
    [v8 setObject:v10 forKeyedSubscript:@"childItems"];
  }
  [(HFItem *)self setLatestResults:v8];
}

void __28__HFItem_updateWithOptions___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x32uLL);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v3;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HFItemUpdate", "%@ -error: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __28__HFItem_updateWithOptions___block_invoke_41(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v4 = [WeakRetained loggerActivity];
    os_activity_scope_enter(v4, &state);

    id v5 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Update for item has taken more than 10 seconds: %@", (uint8_t *)&v9, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    int v7 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v8;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Update for item has taken more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }
  }
}

id __36__HFItem_copyLatestResultsFromItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_26C0FBE80] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = [v3 debugDescription];
    uint64_t v10 = [*(id *)(a1 + 40) debugDescription];
    [v6 handleFailureInMethod:v7, v8, @"HFItem.m", 137, @"Found a child item that does not conform to NSCopying. Child items must be copyable! Child: %@, parent: %@", v9, v10 object file lineNumber description];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFItem.m", 155, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItem _subclass_updateWithOptions:]", objc_opt_class() object file lineNumber description];

  uint64_t v6 = (void *)MEMORY[0x263F58190];
  uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 36);
  uint64_t v8 = [v6 futureWithError:v7];

  return v8;
}

- (BOOL)resultsContainRequiredProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(HFItem *)self latestResults];
        uint64_t v11 = [v10 objectForKey:v9];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(HFItem *)self latestResults];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];

  return v7;
}

@end