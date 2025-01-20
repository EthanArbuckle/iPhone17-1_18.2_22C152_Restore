@interface INUICKPSynchronousRemoteViewControllerAllocator
- (BOOL)requiresUserConsent;
- (INInteraction)interaction;
- (INUICKPSynchronousRemoteViewControllerAllocator)init;
- (INUICKPViewControllerAllocatingDelegate)delegate;
- (NSArray)allocatedViewControllers;
- (NSArray)redundantInterfaceSections;
- (NSDictionary)viewControllersByInitialInterfaceSection;
- (NSMutableArray)finalInterfaceSections;
- (NSMutableArray)mutableRedundantInterfaceSections;
- (NSMutableArray)mutableSynchronousRemoteViewControllers;
- (NSMutableDictionary)mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
- (NSMutableSet)handledParameters;
- (double)boundingWidthForSynchronousRemoteViewController:(id)a3;
- (id)_unhandledParametersForInterfaceSection:(id)a3;
- (id)organizedInterfaceSections;
- (void)_beginRecursivelyConnectingForInterfaceSectionQueue:(id)a3 completion:(id)a4;
- (void)_recursivelyConnectForInterfaceSectionQueue:(id)a3 recursionDepth:(unint64_t)a4 completion:(id)a5;
- (void)performAllocationsFromInteraction:(id)a3 initialInterfaceSections:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setInteraction:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
- (void)setSynchronousRemoteViewControllerClass:(Class)a3;
@end

@implementation INUICKPSynchronousRemoteViewControllerAllocator

- (INUICKPSynchronousRemoteViewControllerAllocator)init
{
  v14.receiver = self;
  v14.super_class = (Class)INUICKPSynchronousRemoteViewControllerAllocator;
  v2 = [(INUICKPSynchronousRemoteViewControllerAllocator *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableSynchronousRemoteViewControllers = v2->_mutableSynchronousRemoteViewControllers;
    v2->_mutableSynchronousRemoteViewControllers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    finalInterfaceSections = v2->_finalInterfaceSections;
    v2->_finalInterfaceSections = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    handledParameters = v2->_handledParameters;
    v2->_handledParameters = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableSynchronousRemoteViewControllersByInitialInterfaceSection = v2->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
    v2->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableRedundantInterfaceSections = v2->_mutableRedundantInterfaceSections;
    v2->_mutableRedundantInterfaceSections = v11;

    v2->_synchronousRemoteViewControllerClass = (Class)objc_opt_class();
    v2->_requiresUserConsent = 1;
  }
  return v2;
}

- (void)setSynchronousRemoteViewControllerClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    self->_synchronousRemoteViewControllerClass = a3;
  }
}

- (void)performAllocationsFromInteraction:(id)a3 initialInterfaceSections:(id)a4 completion:(id)a5
{
  id v8 = a5;
  mutableSynchronousRemoteViewControllers = self->_mutableSynchronousRemoteViewControllers;
  id v10 = a4;
  id v11 = a3;
  [(NSMutableArray *)mutableSynchronousRemoteViewControllers removeAllObjects];
  [(NSMutableDictionary *)self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection removeAllObjects];
  [(NSMutableArray *)self->_mutableRedundantInterfaceSections removeAllObjects];
  [(NSMutableArray *)self->_finalInterfaceSections removeAllObjects];
  [(NSMutableSet *)self->_handledParameters removeAllObjects];
  [(INUICKPSynchronousRemoteViewControllerAllocator *)self setInteraction:v11];

  v12 = (void *)[v10 mutableCopy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator_performAllocationsFromInteraction_initialInterfaceSections_completion___block_invoke;
  v14[3] = &unk_264B95DA8;
  id v15 = v8;
  id v13 = v8;
  [(INUICKPSynchronousRemoteViewControllerAllocator *)self _beginRecursivelyConnectingForInterfaceSectionQueue:v12 completion:v14];
}

uint64_t __121__INUICKPSynchronousRemoteViewControllerAllocator_performAllocationsFromInteraction_initialInterfaceSections_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (NSArray)allocatedViewControllers
{
  v2 = (void *)[(NSMutableArray *)self->_mutableSynchronousRemoteViewControllers copy];
  return (NSArray *)v2;
}

- (NSDictionary)viewControllersByInitialInterfaceSection
{
  v2 = (void *)[(NSMutableDictionary *)self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection copy];
  return (NSDictionary *)v2;
}

- (NSArray)redundantInterfaceSections
{
  v2 = (void *)[(NSMutableArray *)self->_mutableRedundantInterfaceSections copy];
  return (NSArray *)v2;
}

- (void)_beginRecursivelyConnectingForInterfaceSectionQueue:(id)a3 completion:(id)a4
{
}

- (void)_recursivelyConnectForInterfaceSectionQueue:(id)a3 recursionDepth:(unint64_t)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  id v10 = [v8 firstObject];
  if (v10)
  {
    [v8 removeObject:v10];
    id v11 = [v10 parameters];

    v12 = [(INUICKPSynchronousRemoteViewControllerAllocator *)self _unhandledParametersForInterfaceSection:v10];
    uint64_t v32 = [v12 count];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke;
    v43[3] = &unk_264B95DD0;
    id v44 = v8;
    v45 = self;
    unint64_t v47 = a4;
    id v13 = v9;
    id v46 = v13;
    objc_super v14 = (void *)MEMORY[0x230FC33E0](v43);
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_2;
    v35[3] = &unk_264B95E20;
    objc_copyWeak(&v41, &location);
    id v33 = v12;
    id v36 = v33;
    id v15 = v10;
    id v37 = v15;
    v38 = self;
    id v34 = v14;
    id v39 = v34;
    v40 = v13;
    v16 = (void (**)(void))MEMORY[0x230FC33E0](v35);
    if ([v15 isWildCardSection])
    {
      v17 = *MEMORY[0x263F31630];
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO);
      v19 = v16;
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v15;
        v20 = "Interface section %@ is a \"wild\" card section; attempting connection to RVC";
        v21 = v17;
        uint32_t v22 = 12;
LABEL_17:
        _os_log_impl(&dword_230990000, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
        v19 = v16;
      }
    }
    else
    {
      if (a4) {
        BOOL v23 = v32 == 0;
      }
      else {
        BOOL v23 = 0;
      }
      int v24 = !v23;
      if (!v11 || !v24)
      {
        v27 = (id)*MEMORY[0x263F31630];
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        if (!v11 || v32)
        {
          if (v28)
          {
            v31 = [v15 parameters];
            *(_DWORD *)buf = 138412546;
            id v49 = v31;
            __int16 v50 = 2112;
            id v51 = v15;
            _os_log_impl(&dword_230990000, v27, OS_LOG_TYPE_INFO, "Interface section has no parameters - continuing\n    Parameters: %@\n    Interface section: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v28)
          {
            v29 = [v15 parameters];
            *(_DWORD *)buf = 138412546;
            id v49 = v29;
            __int16 v50 = 2112;
            id v51 = v15;
            _os_log_impl(&dword_230990000, v27, OS_LOG_TYPE_INFO, "All parameters are currently handled by another interface section - continuing\n    Parameters: %@\n    Interface section: %@", buf, 0x16u);
          }
          v30 = [(INUICKPSynchronousRemoteViewControllerAllocator *)self mutableRedundantInterfaceSections];
          [v30 addObject:v15];
        }
        v19 = (void (**)(void))v34;
        goto LABEL_27;
      }
      v25 = *MEMORY[0x263F31630];
      BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO);
      v19 = v16;
      if (v26)
      {
        *(_DWORD *)buf = 138412546;
        id v49 = v15;
        __int16 v50 = 2112;
        id v51 = v33;
        v20 = "Still have parameters to handle for interface section %@ - attempting to connect to RVC\n"
              "    Unhandled parameters: %@";
        v21 = v25;
        uint32_t v22 = 22;
        goto LABEL_17;
      }
    }
LABEL_27:
    v19[2]();

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

    goto LABEL_28;
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_28:
}

uint64_t __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] count])
  {
    uint64_t v3 = a1[4];
    v2 = (void *)a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7] + 1;
    return [v2 _recursivelyConnectForInterfaceSectionQueue:v3 recursionDepth:v5 completion:v4];
  }
  else
  {
    uint64_t result = a1[6];
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x263F10318]);
    uint64_t v4 = [WeakRetained interaction];
    uint64_t v5 = (void *)[v3 initWithInteraction:v4];

    objc_msgSend(v5, "setRequiresUserConsent:", objc_msgSend(WeakRetained, "requiresUserConsent"));
    v6 = (void *)WeakRetained[1];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263F10320]), "initWithParameters:interactiveBehavior:hostedViewContext:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "interactiveBehavior"), 0);
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3;
    v9[3] = &unk_264B95DF8;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    v12 = WeakRetained;
    id v13 = *(id *)(a1 + 56);
    [v6 requestInstanceWithInfo:v5 configuration:v7 synchronousRemoteViewControllerDelegate:v8 reply:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3_cold_1((uint64_t)v6, a1, v7);
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F31630];
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        int v19 = 138412802;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl(&dword_230990000, v8, OS_LOG_TYPE_DEFAULT, "Synchronous remote view controller retrieved\n    Interface section: %@\n    Parameters: %@\n    Synchronous remote view controller: %@", (uint8_t *)&v19, 0x20u);
      }
      [v5 setInterfaceSectionOrganizer:*(void *)(a1 + 48)];
      v12 = [*(id *)(a1 + 48) mutableSynchronousRemoteViewControllers];
      [v12 addObject:v5];

      id v13 = [v5 cachedRepresentedParameters];
      objc_super v14 = (void *)[*(id *)(a1 + 40) copyWithZone:0];
      [v14 setParameters:v13];
      id v15 = [*(id *)(a1 + 48) handledParameters];
      [v15 unionSet:v13];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [*(id *)(a1 + 48) finalInterfaceSections];
        [v16 addObject:v14];
      }
      v17 = [*(id *)(a1 + 48) mutableSynchronousRemoteViewControllersByInitialInterfaceSection];
      [v17 setObject:v5 forKey:*(void *)(a1 + 40)];
    }
    else if (v9)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 138412290;
      uint64_t v20 = v18;
      _os_log_impl(&dword_230990000, v8, OS_LOG_TYPE_DEFAULT, "No synchronous remote view controller retrieved\n    Parameters: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_unhandledParametersForInterfaceSection:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v19 = [MEMORY[0x263EFF9C0] set];
  id v5 = self->_handledParameters;
  if (!v5)
  {
    id v5 = [MEMORY[0x263EFFA08] set];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = objc_msgSend(v4, "parameters", v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v12 = v5;
        uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v11 isSubParameterOf:*(void *)(*((void *)&v20 + 1) + 8 * j)])
              {

                goto LABEL_18;
              }
            }
            uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        [v19 addObject:v11];
LABEL_18:
        ;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  return v19;
}

- (id)organizedInterfaceSections
{
  v2 = (void *)[(NSMutableArray *)self->_finalInterfaceSections copy];
  return v2;
}

- (double)boundingWidthForSynchronousRemoteViewController:(id)a3
{
  id v4 = [(INUICKPSynchronousRemoteViewControllerAllocator *)self delegate];
  [v4 boundingWidthForViewControllerAllocator:self];
  double v6 = v5;

  return v6;
}

- (INUICKPViewControllerAllocatingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (INUICKPViewControllerAllocatingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSMutableArray)mutableSynchronousRemoteViewControllers
{
  return self->_mutableSynchronousRemoteViewControllers;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
}

- (NSMutableArray)finalInterfaceSections
{
  return self->_finalInterfaceSections;
}

- (NSMutableSet)handledParameters
{
  return self->_handledParameters;
}

- (NSMutableDictionary)mutableSynchronousRemoteViewControllersByInitialInterfaceSection
{
  return self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection;
}

- (NSMutableArray)mutableRedundantInterfaceSections
{
  return self->_mutableRedundantInterfaceSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRedundantInterfaceSections, 0);
  objc_storeStrong((id *)&self->_mutableSynchronousRemoteViewControllersByInitialInterfaceSection, 0);
  objc_storeStrong((id *)&self->_handledParameters, 0);
  objc_storeStrong((id *)&self->_finalInterfaceSections, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_mutableSynchronousRemoteViewControllers, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __121__INUICKPSynchronousRemoteViewControllerAllocator__recursivelyConnectForInterfaceSectionQueue_recursionDepth_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_230990000, log, OS_LOG_TYPE_ERROR, "Error retrieving synchronous remote view controller\n    Error: %@\n    Parameters: %@", (uint8_t *)&v4, 0x16u);
}

@end