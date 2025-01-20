@interface FKAAvailableCommands
+ (FKAAvailableCommands)sharedInstance;
- (AXSSKeyboardCommandMap)commandMap;
- (FKAAvailableCommands)init;
- (NSArray)cachedSiriShortcutsCommands;
- (NSArray)categories;
- (NSMutableDictionary)tokensToUpdateBlocks;
- (NSSet)commands;
- (NSString)siriShortcutsDidChangeObserverToken;
- (OS_dispatch_queue)siriShortcutsQueue;
- (id)_siriShortcutCommands;
- (id)forceTouchEnabledDidChangeObserverToken;
- (id)registerUpdateBlock:(id)a3;
- (void)_updateCachedSiriShortcutsCommands;
- (void)commandMap;
- (void)dealloc;
- (void)setCachedSiriShortcutsCommands:(id)a3;
- (void)setCommandMap:(id)a3;
- (void)setForceTouchEnabledDidChangeObserverToken:(id)a3;
- (void)setSiriShortcutsDidChangeObserverToken:(id)a3;
- (void)setSiriShortcutsQueue:(id)a3;
- (void)setTokensToUpdateBlocks:(id)a3;
- (void)unregisterUpdateBlockWithToken:(id)a3;
@end

@implementation FKAAvailableCommands

+ (FKAAvailableCommands)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__FKAAvailableCommands_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_SharedInstance_0;

  return (FKAAvailableCommands *)v2;
}

uint64_t __38__FKAAvailableCommands_sharedInstance__block_invoke()
{
  sharedInstance_SharedInstance_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (FKAAvailableCommands)init
{
  v28.receiver = self;
  v28.super_class = (Class)FKAAvailableCommands;
  v2 = [(FKAAvailableCommands *)&v28 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__FKAAvailableCommands_init__block_invoke;
    aBlock[3] = &unk_1E5586A10;
    objc_copyWeak(&v26, &location);
    v3 = _Block_copy(aBlock);
    v4 = +[AXSiriShortcutsManager sharedManager];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __28__FKAAvailableCommands_init__block_invoke_2;
    v23[3] = &unk_1E5587150;
    objc_copyWeak(&v24, &location);
    uint64_t v5 = [v4 registerShortcutsDidChangeBlock:v23];
    siriShortcutsDidChangeObserverToken = v2->_siriShortcutsDidChangeObserverToken;
    v2->_siriShortcutsDidChangeObserverToken = (NSString *)v5;

    v7 = +[AXSettings sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __28__FKAAvailableCommands_init__block_invoke_3;
    v21[3] = &unk_1E5586638;
    id v8 = v3;
    id v22 = v8;
    [v7 registerUpdateBlock:v21 forRetrieveSelector:sel_fullKeyboardAccessCommandMapData withListener:v2];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *MEMORY[0x1E4FB9130];
    v11 = [MEMORY[0x1E4F28F08] mainQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __28__FKAAvailableCommands_init__block_invoke_4;
    v19[3] = &unk_1E5587178;
    id v12 = v8;
    id v20 = v12;
    uint64_t v13 = [v9 addObserverForName:v10 object:0 queue:v11 usingBlock:v19];
    id forceTouchEnabledDidChangeObserverToken = v2->_forceTouchEnabledDidChangeObserverToken;
    v2->_id forceTouchEnabledDidChangeObserverToken = (id)v13;

    cachedSiriShortcutsCommands = v2->_cachedSiriShortcutsCommands;
    v2->_cachedSiriShortcutsCommands = (NSArray *)MEMORY[0x1E4F1CBF0];

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.Accessibility.FKAAvailableCommands.SiriShortcuts", 0);
    siriShortcutsQueue = v2->_siriShortcutsQueue;
    v2->_siriShortcutsQueue = (OS_dispatch_queue *)v16;

    [(FKAAvailableCommands *)v2 _updateCachedSiriShortcutsCommands];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__FKAAvailableCommands_init__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(WeakRetained, "tokensToUpdateBlocks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = [WeakRetained tokensToUpdateBlocks];
        v9 = [v8 objectForKeyedSubscript:v7];
        ((void (**)(void, id))v9)[2](v9, WeakRetained);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __28__FKAAvailableCommands_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCachedSiriShortcutsCommands];
}

uint64_t __28__FKAAvailableCommands_init__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __28__FKAAvailableCommands_init__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v3 = +[AXSiriShortcutsManager sharedManager];
  [v3 unregisterShortcutsDidChangeBlock:self->_siriShortcutsDidChangeObserverToken];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_forceTouchEnabledDidChangeObserverToken];

  v5.receiver = self;
  v5.super_class = (Class)FKAAvailableCommands;
  [(FKAAvailableCommands *)&v5 dealloc];
}

- (id)_siriShortcutCommands
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[AXSiriShortcutsManager sharedManager];
  uint64_t v3 = [v2 shortcuts];

  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
        long long v11 = +[FKASiriShortcutKeyboardCommand commandWithSiriShortcutIdentifier:v10];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_updateCachedSiriShortcutsCommands
{
  uint64_t v3 = [(FKAAvailableCommands *)self siriShortcutsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _siriShortcutCommands];
  id v1 = v2;
  AXPerformBlockOnMainThread();
}

void __58__FKAAvailableCommands__updateCachedSiriShortcutsCommands__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCachedSiriShortcutsCommands:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) tokensToUpdateBlocks];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
        v7[2](v7, *(void *)(a1 + 32));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSSet)commands
{
  v45[38] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = *MEMORY[0x1E4F48E80];
  v45[0] = *MEMORY[0x1E4F48E70];
  v45[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F48EA0];
  v45[2] = *MEMORY[0x1E4F48E98];
  v45[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F48EB0];
  v45[4] = *MEMORY[0x1E4F48EA8];
  v45[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4F48EC0];
  v45[6] = *MEMORY[0x1E4F48EB8];
  v45[7] = v7;
  uint64_t v8 = *MEMORY[0x1E4F48ED8];
  v45[8] = *MEMORY[0x1E4F48EC8];
  v45[9] = v8;
  uint64_t v9 = *MEMORY[0x1E4F48EF8];
  v45[10] = *MEMORY[0x1E4F48EF0];
  v45[11] = v9;
  uint64_t v10 = *MEMORY[0x1E4F48EE0];
  v45[12] = *MEMORY[0x1E4F48F00];
  v45[13] = v10;
  uint64_t v11 = *MEMORY[0x1E4F48F08];
  v45[14] = *MEMORY[0x1E4F48EE8];
  v45[15] = v11;
  uint64_t v12 = *MEMORY[0x1E4F48F18];
  v45[16] = *MEMORY[0x1E4F48F10];
  v45[17] = v12;
  uint64_t v13 = *MEMORY[0x1E4F48F28];
  v45[18] = *MEMORY[0x1E4F48F20];
  v45[19] = v13;
  uint64_t v14 = *MEMORY[0x1E4F48F38];
  v45[20] = *MEMORY[0x1E4F48F30];
  v45[21] = v14;
  uint64_t v15 = *MEMORY[0x1E4F48F50];
  v45[22] = *MEMORY[0x1E4F48F40];
  v45[23] = v15;
  uint64_t v16 = *MEMORY[0x1E4F48F60];
  v45[24] = *MEMORY[0x1E4F48F58];
  v45[25] = v16;
  uint64_t v17 = *MEMORY[0x1E4F48F70];
  v45[26] = *MEMORY[0x1E4F48F68];
  v45[27] = v17;
  uint64_t v18 = *MEMORY[0x1E4F48F80];
  v45[28] = *MEMORY[0x1E4F48F78];
  v45[29] = v18;
  uint64_t v19 = *MEMORY[0x1E4F48FA8];
  v45[30] = *MEMORY[0x1E4F48F98];
  v45[31] = v19;
  uint64_t v20 = *MEMORY[0x1E4F48FC0];
  v45[32] = *MEMORY[0x1E4F48FB0];
  v45[33] = v20;
  uint64_t v21 = *MEMORY[0x1E4F48FD0];
  v45[34] = *MEMORY[0x1E4F48FC8];
  v45[35] = v21;
  uint64_t v22 = *MEMORY[0x1E4F48FE0];
  v45[36] = *MEMORY[0x1E4F48FD8];
  v45[37] = v22;
  v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 38, 0);
  id v24 = [v23 arrayByAddingObject:*MEMORY[0x1E4F48E88]];

  v25 = [v24 arrayByAddingObject:*MEMORY[0x1E4F48ED0]];

  id v26 = [v25 arrayByAddingObject:*MEMORY[0x1E4F48F90]];

  v27 = [v26 arrayByAddingObject:*MEMORY[0x1E4F48F48]];

  if (AXDeviceIsPad())
  {
    objc_super v28 = [v27 arrayByAddingObject:*MEMORY[0x1E4F48FA0]];

    v29 = [v28 arrayByAddingObject:*MEMORY[0x1E4F48F88]];

    v27 = [v29 arrayByAddingObject:*MEMORY[0x1E4F48FB8]];
  }
  if (AXDeviceIsSOSAvailable())
  {
    uint64_t v30 = [v27 arrayByAddingObject:*MEMORY[0x1E4F48E78]];

    v27 = (void *)v30;
  }
  if (AXDeviceCanArmApplePay())
  {
    uint64_t v31 = [v27 arrayByAddingObject:*MEMORY[0x1E4F48E90]];

    v27 = (void *)v31;
  }
  if (AXForceTouchAvailableAndEnabled())
  {
    uint64_t v32 = [v27 arrayByAddingObject:*MEMORY[0x1E4F48E68]];

    v27 = (void *)v32;
  }
  uint64_t v33 = [v27 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v27);
        }
        v37 = [MEMORY[0x1E4F49000] commandWithStandardCommandIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        [v3 addObject:v37];
      }
      uint64_t v34 = [v27 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v34);
  }

  v38 = [(FKAAvailableCommands *)self cachedSiriShortcutsCommands];
  [v3 addObjectsFromArray:v38];

  return (NSSet *)v3;
}

- (NSArray)categories
{
  uint64_t v3 = (void *)MEMORY[0x1E4F49008];
  uint64_t v4 = [(FKAAvailableCommands *)self commands];
  uint64_t v5 = [v3 allCategoriesForAvailableCommands:v4];

  uint64_t v6 = [(FKAAvailableCommands *)self cachedSiriShortcutsCommands];
  if ([v6 count])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F49008]);
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"SIRI_SHORTCUTS_CATEGORY_NAME" value:&stru_1EDC3DEF8 table:@"FullKeyboardAccess"];
    uint64_t v10 = (void *)[v7 initWithCommands:v6 localizedName:v9];

    uint64_t v11 = [v5 arrayByAddingObject:v10];

    uint64_t v5 = (void *)v11;
  }

  return (NSArray *)v5;
}

- (AXSSKeyboardCommandMap)commandMap
{
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 fullKeyboardAccessCommandMapData];

  if (v4)
  {
    id v13 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v13];
    id v6 = v13;
    id v7 = v6;
    if (v5)
    {

      goto LABEL_10;
    }
    uint64_t v8 = FKALogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(FKAAvailableCommands *)(uint64_t)v7 commandMap];
    }
  }
  uint64_t v9 = FKALogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_18D308000, v9, OS_LOG_TYPE_INFO, "Creating new command map because none was saved in preferences", v12, 2u);
  }

  uint64_t v5 = objc_opt_new();
LABEL_10:
  uint64_t v10 = [(FKAAvailableCommands *)self commands];
  [v5 setAvailableCommands:v10];

  return (AXSSKeyboardCommandMap *)v5;
}

- (void)setCommandMap:(id)a3
{
  if (a3)
  {
    id v7 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      uint64_t v5 = FKALogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[FKAAvailableCommands setCommandMap:]((uint64_t)v4, v5);
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v6 = +[AXSettings sharedInstance];
  [v6 setFullKeyboardAccessCommandMapData:v3];
}

- (id)registerUpdateBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [(FKAAvailableCommands *)self tokensToUpdateBlocks];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(FKAAvailableCommands *)self setTokensToUpdateBlocks:v7];
  }
  uint64_t v8 = _Block_copy(v4);
  uint64_t v9 = [(FKAAvailableCommands *)self tokensToUpdateBlocks];
  [v9 setObject:v8 forKeyedSubscript:v5];

  return v5;
}

- (void)unregisterUpdateBlockWithToken:(id)a3
{
  id v4 = a3;
  id v5 = [(FKAAvailableCommands *)self tokensToUpdateBlocks];
  [v5 setObject:0 forKeyedSubscript:v4];
}

- (NSString)siriShortcutsDidChangeObserverToken
{
  return self->_siriShortcutsDidChangeObserverToken;
}

- (void)setSiriShortcutsDidChangeObserverToken:(id)a3
{
}

- (id)forceTouchEnabledDidChangeObserverToken
{
  return self->_forceTouchEnabledDidChangeObserverToken;
}

- (void)setForceTouchEnabledDidChangeObserverToken:(id)a3
{
}

- (NSMutableDictionary)tokensToUpdateBlocks
{
  return self->_tokensToUpdateBlocks;
}

- (void)setTokensToUpdateBlocks:(id)a3
{
}

- (NSArray)cachedSiriShortcutsCommands
{
  return self->_cachedSiriShortcutsCommands;
}

- (void)setCachedSiriShortcutsCommands:(id)a3
{
}

- (OS_dispatch_queue)siriShortcutsQueue
{
  return self->_siriShortcutsQueue;
}

- (void)setSiriShortcutsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriShortcutsQueue, 0);
  objc_storeStrong((id *)&self->_cachedSiriShortcutsCommands, 0);
  objc_storeStrong((id *)&self->_tokensToUpdateBlocks, 0);
  objc_storeStrong(&self->_forceTouchEnabledDidChangeObserverToken, 0);

  objc_storeStrong((id *)&self->_siriShortcutsDidChangeObserverToken, 0);
}

- (void)commandMap
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving command map: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setCommandMap:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Unable to encode command map: %@", (uint8_t *)&v2, 0xCu);
}

@end