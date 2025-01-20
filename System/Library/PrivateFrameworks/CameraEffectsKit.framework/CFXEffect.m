@interface CFXEffect
+ (CFXEffect)effectWithIdentifier:(id)a3 forEffectType:(id)a4;
+ (CFXEffect)effectWithJTEffect:(id)a3;
+ (id)effectIdentifiersForEffectType:(id)a3;
+ (void)initEffectRegistry;
+ (void)preWarmShaderCache;
+ (void)setupFactoryDelegate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNone;
- (CFXEffect)initWithJTEffect:(id)a3;
- (JFXEffect)jtEffect;
- (NSString)identifier;
- (NSString)localizedTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setJtEffect:(id)a3;
@end

@implementation CFXEffect

- (CFXEffect)initWithJTEffect:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)CFXEffect;
    v6 = [(CFXEffect *)&v17 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_jtEffect, a3);
      uint64_t v8 = [v5 displayName];
      localizedTitle = v7->_localizedTitle;
      v7->_localizedTitle = (NSString *)v8;

      uint64_t v10 = [v5 effectID];
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v10;

      if ([v5 type] == 1)
      {
        v12 = [v5 contentDataSource];

        if (v12)
        {
          id v13 = v5;
          v14 = [v13 contentProperties];
          [v13 addEffectParameters:v14];
        }
      }
    }
    self = v7;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)initEffectRegistry
{
  if (initEffectRegistry_onceToken != -1) {
    dispatch_once(&initEffectRegistry_onceToken, &__block_literal_global_30);
  }
}

void __31__CFXEffect_initEffectRegistry__block_invoke()
{
  v0 = (void *)MEMORY[0x263F61248];
  id v1 = +[CFXEffectHostAppDelegate sharedInstance];
  [v0 initEffectRegistryWithHostDelegate:v1];
}

+ (void)setupFactoryDelegate
{
  id v2 = +[CFXEffectFactoryDelegate sharedInstance];
  +[JFXEffectFactory setDelegate:v2];
}

+ (void)preWarmShaderCache
{
  v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__CFXEffect_preWarmShaderCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);
}

void __31__CFXEffect_preWarmShaderCache__block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v31 = *MEMORY[0x263F04130];
  v32[0] = MEMORY[0x263EFFA78];
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreate(0, 1uLL, 1uLL, 0x42475241u, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1], &pixelBufferOut);
  v18 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:pixelBufferOut];
  CVPixelBufferRelease(pixelBufferOut);
  objc_super v17 = +[CFXEffectType effectTypeWithIdentifier:@"Filter"];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "effectIdentifiersForEffectType:");
  v16 = objc_alloc_init(JFXEffectsPreviewGenerator);
  v3 = dispatch_semaphore_create(1);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
        v9 = [*(id *)(a1 + 32) effectWithIdentifier:v8 forEffectType:v17];
        uint64_t v10 = [v9 jtEffect];
        objc_msgSend(v10, "setRenderSize:", 1.0, 1.0);
        v11 = [v10 renderEffect];
        v23[0] = kDefaultEffectPreviewAnimationRange;
        v23[1] = xmmword_234D62718;
        v23[2] = xmmword_234D62728;
        [v11 setEffectRange:v23];

        v12 = [JFXEffectsPreviewGenerationRequest alloc];
        v29 = v10;
        id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
        long long v21 = kDefaultEffectPreviewRenderTime;
        uint64_t v22 = 0;
        v14 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v12, "initWithInput:effectStack:outputSize:renderTime:", v18, v13, &v21, 1.0, 1.0);

        [(JFXEffectsPreviewGenerationRequest *)v14 setChildCode:60];
        [(JFXEffectsPreviewGenerationRequest *)v14 setParentCode:60];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __31__CFXEffect_preWarmShaderCache__block_invoke_2;
        v19[3] = &unk_264C0B6F0;
        v20 = v3;
        [(JFXEffectsPreviewGenerator *)v16 generatePreviewRequest:v14 completionHandler:v19];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }
}

intptr_t __31__CFXEffect_preWarmShaderCache__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x263F61250] cleanupEffectsCache];
  id v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

+ (CFXEffect)effectWithIdentifier:(id)a3 forEffectType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[JFXEffectFactory sharedInstance];
  uint64_t v8 = [v5 jtEffectType];

  v9 = [v7 createEffectForType:v8 fromID:v6 withProperties:0];

  if (v9) {
    uint64_t v10 = [[CFXEffect alloc] initWithJTEffect:v9];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)effectIdentifiersForEffectType:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"Text"];

  id v6 = [v3 identifier];
  int v7 = [v6 isEqualToString:@"Shapes"];

  uint64_t v8 = [v3 identifier];
  int v9 = [v8 isEqualToString:@"EmojiStickers"];

  uint64_t v10 = [v3 identifier];
  int v11 = [v10 isEqualToString:@"Filter"];

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  if ((v5 | v7 | v9) == 1)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    id v52 = 0;
    id v13 = +[JFXEffectFactory sharedInstance];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke;
    v44[3] = &unk_264C0ABB0;
    v46 = &v47;
    v14 = v12;
    v45 = v14;
    [v13 effectCategoriesForType:2 completion:v44];

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if ((v5 | v7 | v9))
    {
      v15 = (id *)kEditableOverlaysCategoryID;
      v16 = kShapeOverlaysCategoryID;
      if (!v7) {
        v16 = kEmojiStickersCategoryID;
      }
      if (!v5) {
        v15 = (id *)v16;
      }
      id v17 = *v15;
    }
    else
    {
      id v17 = 0;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v26 = (id)v48[5];
    id v22 = (id)[v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v22)
    {
      uint64_t v27 = *(void *)v41;
LABEL_15:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v26);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * v28);
        v30 = [v29 categoryID];
        char v31 = [v30 isEqualToString:v17];

        if (v31) {
          break;
        }
        if (v22 == (id)++v28)
        {
          id v22 = (id)[v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
          if (v22) {
            goto LABEL_15;
          }
          goto LABEL_24;
        }
      }
      id v32 = v29;

      if (v32)
      {
        id v22 = [v32 effectIDs];
        id v26 = v32;
        goto LABEL_24;
      }
      id v22 = 0;
    }
    else
    {
LABEL_24:
    }
    _Block_object_dispose(&v47, 8);
  }
  else if (v11)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    id v52 = 0;
    v18 = +[JFXEffectFactory sharedInstance];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_2;
    v37[3] = &unk_264C0ABB0;
    v39 = &v47;
    v19 = v12;
    v38 = v19;
    [v18 effectCategoriesForType:1 completion:v37];

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    [(id)v48[5] count];
    v20 = (void *)v48[5];
    if (v20)
    {
      long long v21 = [v20 objectAtIndexedSubscript:0];
      id v22 = [v21 effectIDs];
    }
    else
    {
      id v22 = 0;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__12;
    v51 = __Block_byref_object_dispose__12;
    id v52 = 0;
    v23 = +[JFXEffectFactory sharedInstance];
    uint64_t v24 = [v3 jtEffectType];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_3;
    v34[3] = &unk_264C0ABB0;
    v36 = &v47;
    long long v25 = v12;
    v35 = v25;
    [v23 effectIDsForType:v24 completion:v34];

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    id v22 = (id)v48[5];

    _Block_object_dispose(&v47, 8);
  }

  return v22;
}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__CFXEffect_effectIdentifiersForEffectType___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (CFXEffect)effectWithJTEffect:(id)a3
{
  id v3 = a3;
  id v4 = [[CFXEffect alloc] initWithJTEffect:v3];

  return v4;
}

- (BOOL)isNone
{
  id v2 = [(CFXEffect *)self jtEffect];
  char v3 = [v2 isNone];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v3 = (void *)[(JFXEffect *)self->_jtEffect copy];
  id v4 = [[CFXEffect alloc] initWithJTEffect:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CFXEffect *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      id v6 = [(CFXEffect *)self jtEffect];
      int v7 = [(CFXEffect *)v5 jtEffect];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v2 = [(CFXEffect *)self jtEffect];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (JFXEffect)jtEffect
{
  return self->_jtEffect;
}

- (void)setJtEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jtEffect, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end