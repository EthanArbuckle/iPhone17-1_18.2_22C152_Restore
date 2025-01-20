@interface TKSmartCardSlotProxy
- (NSHashTable)cards;
- (TKSmartCardSlotProxy)initWithSlot:(id)a3;
- (void)cardSessionRequested;
- (void)notifyWithParameters:(id)a3 reply:(id)a4;
- (void)processNotificationParameters:(id)a3;
- (void)slotInitialized;
@end

@implementation TKSmartCardSlotProxy

- (void)processNotificationParameters:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"state"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKey:@"atr"];
  v8 = TK_LOG_smartcard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slot);
    int v42 = 138543874;
    id v43 = WeakRetained;
    __int16 v44 = 2048;
    uint64_t v45 = v6;
    __int16 v46 = 2114;
    v47 = v7;
    _os_log_debug_impl(&dword_1BED55000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: stateChangedTo:%ld atr:%{public}@", (uint8_t *)&v42, 0x20u);
  }
  if (v7) {
    BOOL v9 = v6 == 4;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_slot);
    v16 = [v15 ATR];
    char v17 = [v16 isEqual:v7];

    if (v17) {
      goto LABEL_16;
    }
    v14 = [[TKSmartCardATR alloc] initWithBytes:v7];
    id v18 = objc_loadWeakRetained((id *)&self->_slot);
    [v18 setATR:v14];

    goto LABEL_15;
  }
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 4;
  }
  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_slot);
    v12 = [v11 ATR];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      v14 = (TKSmartCardATR *)objc_loadWeakRetained((id *)&self->_slot);
      [(TKSmartCardATR *)v14 setATR:0];
LABEL_15:
    }
  }
LABEL_16:
  v19 = [v4 objectForKey:@"power"];
  uint64_t v20 = [v19 integerValue];

  p_slot = &self->_slot;
  id v22 = objc_loadWeakRetained((id *)p_slot);
  BOOL v23 = v20 == [v22 powerState];

  if (!v23)
  {
    id v24 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v24);
    id v25 = objc_loadWeakRetained((id *)p_slot);
    [v25 setPowerState:v20];

    objc_sync_exit(v24);
  }
  v26 = [v4 objectForKey:@"share"];
  uint64_t v27 = [v26 integerValue];

  id v28 = objc_loadWeakRetained((id *)p_slot);
  BOOL v29 = v27 == [v28 shareState];

  if (!v29)
  {
    id v30 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v30);
    id v31 = objc_loadWeakRetained((id *)p_slot);
    [v31 setShareState:v27];

    objc_sync_exit(v30);
  }
  v32 = [v4 objectForKey:@"prevstate"];
  uint64_t v33 = [v32 integerValue];

  id v34 = objc_loadWeakRetained((id *)p_slot);
  BOOL v35 = v33 == [v34 previousState];

  if (!v35)
  {
    id v36 = objc_loadWeakRetained((id *)p_slot);
    [v36 setPreviousState:v33];
  }
  id v37 = objc_loadWeakRetained((id *)p_slot);
  BOOL v38 = [v37 state] == v6;

  if (!v38)
  {
    id v39 = objc_loadWeakRetained((id *)p_slot);
    objc_sync_enter(v39);
    id v40 = objc_loadWeakRetained((id *)p_slot);
    [v40 setState:v6];

    objc_sync_exit(v39);
  }
}

- (void)notifyWithParameters:(id)a3 reply:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(void))a4;
  v7 = self;
  objc_sync_enter(v7);
  queuedParameters = v7->_queuedParameters;
  if (queuedParameters)
  {
    [(NSMutableArray *)queuedParameters addObject:v9];
    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    [(TKSmartCardSlotProxy *)v7 processNotificationParameters:v9];
  }
  v6[2](v6);
}

- (void)cardSessionRequested
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(TKSmartCardSlotProxy *)self cards];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) sessionRequested];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (TKSmartCardSlotProxy)initWithSlot:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardSlotProxy;
  uint64_t v5 = [(TKSmartCardSlotProxy *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_slot, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cards = v6->_cards;
    v6->_cards = (NSHashTable *)v7;

    long long v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queuedParameters = v6->_queuedParameters;
    v6->_queuedParameters = v9;
  }
  return v6;
}

- (void)slotInitialized
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_slot = &self->_slot;
  while (1)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (![(NSMutableArray *)self->_queuedParameters count]) {
      break;
    }
    uint64_t v5 = TK_LOG_smartcard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)p_slot);
      int v8 = [(NSMutableArray *)self->_queuedParameters count];
      *(_DWORD *)buf = 138412546;
      id v11 = WeakRetained;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_debug_impl(&dword_1BED55000, v5, OS_LOG_TYPE_DEBUG, "%@: processing accumulated state changes, %d remain", buf, 0x12u);
    }
    uint64_t v6 = [(NSMutableArray *)self->_queuedParameters firstObject];
    [(NSMutableArray *)self->_queuedParameters removeObjectAtIndex:0];
    objc_sync_exit(v4);

    [(TKSmartCardSlotProxy *)v4 processNotificationParameters:v6];
  }
  queuedParameters = self->_queuedParameters;
  self->_queuedParameters = 0;

  objc_sync_exit(v4);
}

- (NSHashTable)cards
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cards, 0);
  objc_storeStrong((id *)&self->_queuedParameters, 0);

  objc_destroyWeak((id *)&self->_slot);
}

@end