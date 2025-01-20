@interface CFXEffectComposition
- (BOOL)hasEffectOfType:(id)a3;
- (BOOL)hasFaceTrackedOverlays;
- (BOOL)isEmpty;
- (BOOL)requiresFaceTracking;
- (CFXEffectComposition)init;
- (NSArray)effects;
- (NSArray)jtEffects;
- (NSMutableArray)animojis;
- (NSMutableArray)filters;
- (NSMutableArray)overlays;
- (OS_dispatch_queue)concurrentQueue;
- (id)CFX_effectsForJettyType:(int)a3;
- (id)jtEffectsForType:(int)a3;
- (unint64_t)count;
- (unint64_t)indexOfEffect:(id)a3;
- (void)addEffect:(id)a3 completion:(id)a4;
- (void)insertEffectAtIndex:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllEffects:(id)a3;
- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4;
- (void)removeAllOverlayEffects:(id)a3;
- (void)removeEffect:(id)a3 completion:(id)a4;
- (void)setAnimojis:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setFilters:(id)a3;
- (void)setOverlays:(id)a3;
@end

@implementation CFXEffectComposition

- (CFXEffectComposition)init
{
  v17.receiver = self;
  v17.super_class = (Class)CFXEffectComposition;
  v2 = [(CFXEffectComposition *)&v17 init];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"com.apple.%@", v5];

  id v7 = v6;
  v8 = (const char *)[v7 UTF8String];
  dispatch_queue_t v9 = dispatch_queue_create(v8, MEMORY[0x263EF83A8]);
  [(CFXEffectComposition *)v2 setConcurrentQueue:v9];

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  filters = v2->_filters;
  v2->_filters = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  overlays = v2->_overlays;
  v2->_overlays = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  animojis = v2->_animojis;
  v2->_animojis = v14;

  return v2;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(CFXEffectComposition *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__CFXEffectComposition_count__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __29__CFXEffectComposition_count__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) filters];
  uint64_t v2 = [v6 count];
  v3 = [*(id *)(a1 + 32) overlays];
  uint64_t v4 = [v3 count] + v2;
  v5 = [*(id *)(a1 + 32) animojis];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 + [v5 count];
}

- (BOOL)isEmpty
{
  return [(CFXEffectComposition *)self count] == 0;
}

- (BOOL)hasEffectOfType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CFXEffectComposition_hasEffectOfType___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __40__CFXEffectComposition_hasEffectOfType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", objc_msgSend(*(id *)(a1 + 40), "jtEffectType"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count] != 0;
}

- (BOOL)hasFaceTrackedOverlays
{
  id v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CFXEffectComposition *)self concurrentQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__CFXEffectComposition_hasFaceTrackedOverlays__block_invoke;
  v5[3] = &unk_264C0A668;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__CFXEffectComposition_hasFaceTrackedOverlays__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "overlays", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) jtEffect];
        uint64_t v8 = [v7 trackingProps];
        uint64_t v9 = [v8 trackingType];

        if ((unint64_t)(v9 - 3) >= 0xFFFFFFFFFFFFFFFELL)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)requiresFaceTracking
{
  uint64_t v3 = [(CFXEffectComposition *)self overlays];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CFXEffectComposition *)self animojis];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (id)CFX_effectsForJettyType:(int)a3
{
  switch(a3)
  {
    case 7:
      uint64_t v3 = [(CFXEffectComposition *)self animojis];
      break;
    case 2:
      uint64_t v3 = [(CFXEffectComposition *)self overlays];
      break;
    case 1:
      uint64_t v3 = [(CFXEffectComposition *)self filters];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (NSArray)effects
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = [(CFXEffectComposition *)self concurrentQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__CFXEffectComposition_effects__block_invoke;
  v8[3] = &unk_264C09F10;
  id v5 = v3;
  id v9 = v5;
  long long v10 = self;
  dispatch_sync(v4, v8);

  uint64_t v6 = (NSArray *)v5;
  return v6;
}

void __31__CFXEffectComposition_effects__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 1);
  [v2 addObjectsFromArray:v3];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 2);
  [v4 addObjectsFromArray:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", 7);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObjectsFromArray:v7];
}

- (void)addEffect:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CFXEffectComposition_addEffect_completion___block_invoke;
  block[3] = &unk_264C0A418;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

void __45__CFXEffectComposition_addEffect_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) jtEffect];
  uint64_t v3 = [v2 type];

  BOOL v4 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  id v5 = v4;
  if (v4)
  {
    if (v3 == 7 || v3 == 1)
    {
      id v7 = [v4 firstObject];
      [v5 removeAllObjects];
      if (v7)
      {
        uint64_t v8 = JFXLog_effects();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [v7 jtEffect];
          id v10 = NSStringFromJFXEffectType([v9 type]);
          long long v11 = [v7 localizedTitle];
          int v18 = 138543618;
          v19 = v10;
          __int16 v20 = 2114;
          v21 = v11;
          _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "Removed effect - type: %{public}@, name: %{public}@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    if (([*(id *)(a1 + 32) isNone] & 1) == 0)
    {
      [v5 addObject:*(void *)(a1 + 32)];
      id v12 = JFXLog_effects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = NSStringFromJFXEffectType(v3);
        id v14 = [*(id *)(a1 + 32) localizedTitle];
        int v18 = 138543618;
        v19 = v13;
        __int16 v20 = 2114;
        v21 = v14;
        _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "Added effect - type: %{public}@, name: %{public}@", (uint8_t *)&v18, 0x16u);
      }
    }
    uint64_t v15 = +[CFXAnalyticsManager sharedInstance];
    [v15 trackEffect:*(void *)(a1 + 32)];

    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      objc_super v17 = dispatch_get_global_queue(21, 0);
      dispatch_async(v17, v16);
    }
  }
}

- (void)removeEffect:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CFXEffectComposition_removeEffect_completion___block_invoke;
  block[3] = &unk_264C0A418;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

void __48__CFXEffectComposition_removeEffect_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) jtEffect];
  uint64_t v3 = [v2 type];

  BOOL v4 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  id v5 = v4;
  if (v4)
  {
    [v4 removeObject:*(void *)(a1 + 32)];
    id v6 = JFXLog_effects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromJFXEffectType(v3);
      uint64_t v8 = [*(id *)(a1 + 32) localizedTitle];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "Removed effect - type: %{public}@, name: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    id v9 = *(void **)(a1 + 48);
    if (v9)
    {
      id v10 = dispatch_get_global_queue(21, 0);
      dispatch_async(v10, v9);
    }
  }
}

- (void)removeAllEffects:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectComposition *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CFXEffectComposition_removeAllEffects___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __41__CFXEffectComposition_removeAllEffects___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 1);
  [v2 removeAllObjects];

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 2);
  [v3 removeAllObjects];

  id v4 = objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 7);
  [v4 removeAllObjects];

  id v5 = JFXLog_effects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "Removed all effects", v8, 2u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(21, 0);
    dispatch_async(v7, v6);
  }
}

- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 jtEffectType];
  id v9 = [(CFXEffectComposition *)self concurrentQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__CFXEffectComposition_removeAllEffectsOfType_completion___block_invoke;
  v12[3] = &unk_264C0A690;
  int v15 = v8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_barrier_async(v9, v12);
}

void __58__CFXEffectComposition_removeAllEffectsOfType_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", *(unsigned int *)(a1 + 56));
  [v2 removeAllObjects];

  uint64_t v3 = JFXLog_effects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromJFXEffectType([*(id *)(a1 + 40) jtEffectType]);
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "Removed effects - type: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(21, 0);
    dispatch_async(v6, v5);
  }
}

- (void)removeAllOverlayEffects:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectComposition *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CFXEffectComposition_removeAllOverlayEffects___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __48__CFXEffectComposition_removeAllOverlayEffects___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "CFX_effectsForJettyType:", 2);
  [v2 removeAllObjects];

  uint64_t v3 = JFXLog_effects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromJFXEffectType(2);
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "Removed effects - type: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(21, 0);
    dispatch_async(v6, v5);
  }
}

- (unint64_t)indexOfEffect:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CFXEffectComposition_indexOfEffect___block_invoke;
  block[3] = &unk_264C0A6B8;
  id v10 = v4;
  id v11 = self;
  id v12 = &v13;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

void __38__CFXEffectComposition_indexOfEffect___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jtEffect];
  uint64_t v3 = [v2 type];

  id v4 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  if (v4)
  {
    id v5 = v4;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 indexOfObject:*(void *)(a1 + 32)];
    id v4 = v5;
  }
}

- (void)insertEffectAtIndex:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CFXEffectComposition_insertEffectAtIndex_atIndex___block_invoke;
  block[3] = &unk_264C0A6E0;
  id v10 = v6;
  id v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_barrier_async(v7, block);
}

void __52__CFXEffectComposition_insertEffectAtIndex_atIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jtEffect];
  uint64_t v3 = [v2 type];

  id v4 = objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", v3);
  if (v4)
  {
    id v5 = v4;
    [v4 insertObject:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
    id v4 = v5;
  }
}

- (NSArray)jtEffects
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CFXEffectComposition *)self effects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__CFXEffectComposition_jtEffects__block_invoke;
  v7[3] = &unk_264C0A708;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __33__CFXEffectComposition_jtEffects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 jtEffect];
  [v2 addObject:v3];
}

- (id)jtEffectsForType:(int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(CFXEffectComposition *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CFXEffectComposition_jtEffectsForType___block_invoke;
  block[3] = &unk_264C0A730;
  id v14 = v5;
  uint64_t v15 = self;
  int v16 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = [MEMORY[0x263EFF980] array];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__CFXEffectComposition_jtEffectsForType___block_invoke_2;
  v11[3] = &unk_264C0A708;
  id v9 = v8;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v11];

  return v9;
}

void __41__CFXEffectComposition_jtEffectsForType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "CFX_effectsForJettyType:", *(unsigned int *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObjectsFromArray:v2];
}

void __41__CFXEffectComposition_jtEffectsForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 jtEffect];
  [v2 addObject:v3];
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (NSMutableArray)overlays
{
  return self->_overlays;
}

- (void)setOverlays:(id)a3
{
}

- (NSMutableArray)animojis
{
  return self->_animojis;
}

- (void)setAnimojis:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_animojis, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end