@interface CXVoicemailProvider
- (CXAbstractProvider)abstractProvider;
- (CXVoicemailProvider)init;
- (CXVoicemailProviderDelegate)delegate;
- (CXVoicemailProviderHostProtocol)voicemailProviderHostDelegate;
- (NSArray)pendingTransactions;
- (id)hostProtocolDelegate;
- (id)pendingVoicemailActionsOfClass:(Class)a3 withVoicemailUUID:(id)a4;
- (void)commitTransaction:(id)a3;
- (void)handleActionTimeout:(id)a3;
- (void)invalidate;
- (void)performAction:(id)a3;
- (void)reportNewVoicemailWithUpdate:(id)a3;
- (void)reportNewVoicemailsWithUpdates:(id)a3;
- (void)reportVoicemailRemovedWithUUID:(id)a3;
- (void)reportVoicemailUpdated:(id)a3;
- (void)reportVoicemailsRemovedWithUUIDs:(id)a3;
- (void)reportVoicemailsUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation CXVoicemailProvider

- (CXVoicemailProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXVoicemailProvider;
  v2 = [(CXVoicemailProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CXAbstractProvider);
    abstractProvider = v2->_abstractProvider;
    v2->_abstractProvider = v3;

    [(CXAbstractProvider *)v2->_abstractProvider setInternalActionDelegate:v2];
  }
  return v2;
}

- (CXVoicemailProviderDelegate)delegate
{
  v2 = [(CXVoicemailProvider *)self abstractProvider];
  v3 = [v2 delegate];

  if ([v3 conformsToProtocol:&unk_1EFC4A098]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (CXVoicemailProviderHostProtocol)voicemailProviderHostDelegate
{
  v2 = [(CXVoicemailProvider *)self hostProtocolDelegate];
  if ([v2 conformsToProtocol:&unk_1EFC411C8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (id)pendingVoicemailActionsOfClass:(Class)a3 withVoicemailUUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(CXVoicemailProvider *)self pendingTransactions];
    uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v8;
          v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v10 = [v9 actions];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                if (objc_opt_isKindOfClass())
                {
                  v16 = [v15 voicemailUUID];
                  int v17 = [v16 isEqual:v6];

                  if (v17) {
                    [v7 addObject:v15];
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }
  }
  v18 = (void *)[v7 copy];

  return v18;
}

- (void)reportNewVoicemailWithUpdate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CXVoicemailProvider reportNewVoicemailsWithUpdates:](self, "reportNewVoicemailsWithUpdates:", v6, v7, v8);
}

- (void)reportNewVoicemailsWithUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CXVoicemailProvider_reportNewVoicemailsWithUpdates___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __54__CXVoicemailProvider_reportNewVoicemailsWithUpdates___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voicemailProviderHostDelegate];
  [v2 reportNewVoicemailsWithUpdates:*(void *)(a1 + 40)];
}

- (void)reportVoicemailUpdated:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CXVoicemailProvider reportVoicemailsUpdated:](self, "reportVoicemailsUpdated:", v6, v7, v8);
}

- (void)reportVoicemailsUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CXVoicemailProvider_reportVoicemailsUpdated___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __47__CXVoicemailProvider_reportVoicemailsUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voicemailProviderHostDelegate];
  [v2 reportVoicemailsUpdated:*(void *)(a1 + 40)];
}

- (void)reportVoicemailRemovedWithUUID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CXVoicemailProvider reportVoicemailsRemovedWithUUIDs:](self, "reportVoicemailsRemovedWithUUIDs:", v6, v7, v8);
}

- (void)reportVoicemailsRemovedWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CXVoicemailProvider_reportVoicemailsRemovedWithUUIDs___block_invoke;
  v8[3] = &unk_1E5CADC68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __56__CXVoicemailProvider_reportVoicemailsRemovedWithUUIDs___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voicemailProviderHostDelegate];
  [v2 reportVoicemailsRemovedWithUUIDs:*(void *)(a1 + 40)];
}

- (id)hostProtocolDelegate
{
  return 0;
}

- (void)performAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  id v6 = [v5 delegateQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CXVoicemailProvider *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performSetPlayedVoicemailAction:v8];
      goto LABEL_20;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(sel_provider_performSetPlayedVoicemailAction_);
      int v11 = 138412290;
      uint64_t v12 = v10;
LABEL_18:
      _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Delegate does not respond to %@. Action will not be performed", (uint8_t *)&v11, 0xCu);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performSetTrashedVoicemailAction:v8];
      goto LABEL_20;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(sel_provider_performSetTrashedVoicemailAction_);
      int v11 = 138412290;
      uint64_t v12 = v10;
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v4;
    if (objc_opt_respondsToSelector())
    {
      [v7 provider:self performRemoveVoicemailAction:v8];
      goto LABEL_20;
    }
    id v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(sel_provider_performRemoveVoicemailAction_);
      int v11 = 138412290;
      uint64_t v12 = v10;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CXProvider performAction:]((uint64_t)v4, v8);
  }
LABEL_20:
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CXVoicemailProvider *)self abstractProvider];
  [v8 setDelegate:v7 queue:v6];
}

- (NSArray)pendingTransactions
{
  id v2 = [(CXVoicemailProvider *)self abstractProvider];
  v3 = [v2 pendingTransactions];

  return (NSArray *)v3;
}

- (void)invalidate
{
  id v2 = [(CXVoicemailProvider *)self abstractProvider];
  [v2 invalidate];
}

- (void)commitTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  [v5 provider:self commitTransaction:v4];
}

- (void)handleActionTimeout:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailProvider *)self abstractProvider];
  [v5 provider:self handleTimeoutForAction:v4];
}

- (CXAbstractProvider)abstractProvider
{
  return self->_abstractProvider;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_abstractProvider, 0);
}

@end