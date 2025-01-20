@interface CFXAvailability
+ (id)availableEffects;
@end

@implementation CFXAvailability

+ (id)availableEffects
{
  if (availableEffects_onceToken != -1) {
    dispatch_once(&availableEffects_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)availableEffects_s_availableEffects;
  return v2;
}

void __35__CFXAvailability_availableEffects__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v0 = +[CFXEffectType effectTypeIdentifiers];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(v0, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        if (v7) {
          [v1 addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  v8 = (void *)availableEffects_s_availableEffects;
  availableEffects_s_availableEffects = (uint64_t)v1;
}

@end