@interface CFXEffectFactoryDelegate
+ (id)sharedInstance;
- (BOOL)CFX_disableExpensiveFilters;
- (BOOL)CFX_enoughPowerForStyleTransfer;
- (BOOL)CFX_isExpensiveEffectID:(id)a3 withFactory:(id)a4;
- (Class)JFXEffectClassForType:(int)a3;
- (id)CFX_animojiEffectsWithFactory:(id)a3;
- (id)CFX_filterEffectsWithFactory:(id)a3;
- (id)CFX_overlayEffectsWithFactory:(id)a3;
- (id)effectFactory:(id)a3 createEffectContentDataSourceForEffectID:(id)a4 ofType:(int)a5;
- (void)effectFactory:(id)a3 effectIDsAvailableForType:(int)a4 completion:(id)a5;
@end

@implementation CFXEffectFactoryDelegate

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_sInstance;
  return v2;
}

uint64_t __42__CFXEffectFactoryDelegate_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)effectFactory:(id)a3 effectIDsAvailableForType:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v19[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x263F61628];
  v18[0] = &unk_26E801890;
  v18[1] = &unk_26E8018A8;
  uint64_t v10 = *MEMORY[0x263F61638];
  v19[0] = v9;
  v19[1] = v10;
  v18[2] = &unk_26E8018C0;
  v18[3] = &unk_26E8018D8;
  v19[2] = v10;
  v19[3] = v10;
  v18[4] = &unk_26E8018F0;
  v19[4] = v9;
  v11 = NSDictionary;
  v12 = (void (**)(id, uint64_t))a5;
  v13 = [v11 dictionaryWithObjects:v19 forKeys:v18 count:5];
  v14 = [NSNumber numberWithUnsignedInt:v6];
  v15 = [v13 objectForKeyedSubscript:v14];

  if (v6 == 7)
  {
    uint64_t v16 = [(CFXEffectFactoryDelegate *)self CFX_animojiEffectsWithFactory:v8];
  }
  else if (v6 == 2)
  {
    uint64_t v16 = [(CFXEffectFactoryDelegate *)self CFX_overlayEffectsWithFactory:v8];
  }
  else
  {
    if (v6 == 1) {
      [(CFXEffectFactoryDelegate *)self CFX_filterEffectsWithFactory:v8];
    }
    else {
    uint64_t v16 = [MEMORY[0x263F61248] registeredEffectIDsForEffectType:v15];
    }
  }
  v17 = (void *)v16;
  v12[2](v12, v16);
}

- (id)effectFactory:(id)a3 createEffectContentDataSourceForEffectID:(id)a4 ofType:(int)a5
{
  if (a5 == 1)
  {
    id v5 = a4;
    uint64_t v6 = [[CFXFilterEffectContentDataSource alloc] initWithEffectID:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)CFX_animojiEffectsWithFactory:(id)a3
{
  return +[JFXAnimojiEffect animojiIDs];
}

- (id)CFX_filterEffectsWithFactory:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"showAllRegisteredFilters"];

  if (v6)
  {
    v7 = [MEMORY[0x263F61248] registeredEffectIDsForEffectType:*MEMORY[0x263F61628]];
  }
  else
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__7;
    v35 = __Block_byref_object_dispose__7;
    id v36 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke;
    v28[3] = &unk_264C0ABB0;
    v30 = &v31;
    uint64_t v9 = v8;
    v29 = v9;
    [v4 effectCategoriesForType:1 completion:v28];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v7 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = (id)v32[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) effectIDs];
          [v7 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v11);
    }

    if ([(CFXEffectFactoryDelegate *)self CFX_disableExpensiveFilters])
    {
      v15 = (void *)MEMORY[0x263F08A98];
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke_2;
      v21 = &unk_264C0ABD8;
      v22 = self;
      id v23 = v4;
      uint64_t v16 = [v15 predicateWithBlock:&v18];
      objc_msgSend(v7, "filterUsingPredicate:", v16, v18, v19, v20, v21, v22);
    }
    _Block_object_dispose(&v31, 8);
  }
  return v7;
}

void __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __57__CFXEffectFactoryDelegate_CFX_filterEffectsWithFactory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_isExpensiveEffectID:withFactory:", a2, *(void *)(a1 + 40)) ^ 1;
}

- (id)CFX_overlayEffectsWithFactory:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__7;
  long long v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__CFXEffectFactoryDelegate_CFX_overlayEffectsWithFactory___block_invoke;
  v17[3] = &unk_264C0ABB0;
  uint64_t v19 = &v20;
  id v5 = v4;
  uint64_t v18 = v5;
  [v3 effectCategoriesForType:2 completion:v17];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  int v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = (id)v21[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "effectIDs", (void)v13);
        [v6 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v26 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v20, 8);
  return v6;
}

void __58__CFXEffectFactoryDelegate_CFX_overlayEffectsWithFactory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)CFX_isExpensiveEffectID:(id)a3 withFactory:(id)a4
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263F61348]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F61350]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F61358]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F61340]] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:*MEMORY[0x263F61338]];
  }

  return v5;
}

- (BOOL)CFX_disableExpensiveFilters
{
  if (CFX_disableExpensiveFilters_onceToken != -1) {
    dispatch_once(&CFX_disableExpensiveFilters_onceToken, &__block_literal_global_22);
  }
  return CFX_disableExpensiveFilters_disable;
}

void __55__CFXEffectFactoryDelegate_CFX_disableExpensiveFilters__block_invoke()
{
  int v8 = 0;
  size_t v7 = 4;
  sysctlbyname("hw.cpufamily", &v8, &v7, 0, 0);
  char v0 = 1;
  if (v8 <= 747742333)
  {
    if (v8 == -1829029944 || v8 == -1471079478 || v8 == 506291073) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v8 == 747742334 || v8 == 933271106) {
    goto LABEL_18;
  }
  if (v8 != 1741614739
    || (BOOL v4 = +[CFXBundleUtils isRunningMessagesExtension],
        (CFX_disableExpensiveFilters_disable = !v4) != 0)
    && ([MEMORY[0x263F1C5C0] currentDevice],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = objc_msgSend(v5, "jfx_memorySize"),
        v5,
        v6 > 3670016000))
  {
LABEL_17:
    char v0 = 0;
LABEL_18:
    CFX_disableExpensiveFilters_disable = v0;
  }
}

- (Class)JFXEffectClassForType:(int)a3
{
  if (a3 == 1 || a3 == 7 || a3 == 2)
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)CFX_enoughPowerForStyleTransfer
{
  if (CFX_enoughPowerForStyleTransfer_onceToken != -1) {
    dispatch_once(&CFX_enoughPowerForStyleTransfer_onceToken, &__block_literal_global_29);
  }
  return CFX_enoughPowerForStyleTransfer_enough;
}

void __59__CFXEffectFactoryDelegate_CFX_enoughPowerForStyleTransfer__block_invoke()
{
  int v6 = 0;
  size_t v5 = 4;
  sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  BOOL v2 = v6 != -1829029944 && v6 != 747742334 && v6 != 933271106;
  CFX_enoughPowerForStyleTransfer_enough = v2;
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"forceStyleTransferFiltersOn"];

  if (v4) {
    CFX_enoughPowerForStyleTransfer_enough = 1;
  }
}

@end