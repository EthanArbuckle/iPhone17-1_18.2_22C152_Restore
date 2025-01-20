@interface CFXEffectType
+ (id)effectTypeIdentifiers;
+ (id)effectTypeWithIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CFXEffectType)initWithIdentifier:(id)a3;
- (NSOrderedSet)effects;
- (NSString)identifier;
- (NSString)localizedTitle;
- (int)jtEffectType;
- (unint64_t)hash;
- (void)setEffects:(id)a3;
- (void)setJtEffectType:(int)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation CFXEffectType

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_6);
  }
}

void __27__CFXEffectType_initialize__block_invoke()
{
  v20[5] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFF9D8]);
  v20[0] = @"Animoji";
  v20[1] = @"Filter";
  v20[2] = @"Shapes";
  v20[3] = @"Text";
  v20[4] = @"EmojiStickers";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)s_OrderedEffectTypes;
  s_OrderedEffectTypes = v2;

  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v5 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)s_OrderedEffectTypes, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)s_OrderedEffectTypes;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [CFXEffectType alloc];
        v13 = -[CFXEffectType initWithIdentifier:](v12, "initWithIdentifier:", v11, (void)v15);
        [v5 setValue:v13 forKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v14 = (void *)s_EffectTypeMap;
  s_EffectTypeMap = (uint64_t)v5;
}

- (CFXEffectType)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CFXEffectType;
  id v6 = [(CFXEffectType *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    uint64_t v8 = @"Filter";
    if ([v5 isEqualToString:@"Filter"])
    {
      int v9 = 1;
    }
    else
    {
      uint64_t v8 = @"Shapes";
      if ([v5 isEqualToString:@"Shapes"]
        || (uint64_t v8 = @"Text", [v5 isEqualToString:@"Text"])
        || (uint64_t v8 = @"EmojiStickers", [v5 isEqualToString:@"EmojiStickers"]))
      {
        int v9 = 2;
      }
      else
      {
        uint64_t v8 = @"Animoji";
        if (![v5 isEqualToString:@"Animoji"]) {
          goto LABEL_9;
        }
        int v9 = 7;
      }
    }
    v7->_jtEffectType = v9;
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = &v8->isa;
  }
LABEL_9:

  return v7;
}

+ (id)effectTypeIdentifiers
{
  return (id)s_OrderedEffectTypes;
}

+ (id)effectTypeWithIdentifier:(id)a3
{
  return (id)[(id)s_EffectTypeMap objectForKey:a3];
}

- (NSOrderedSet)effects
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  effects = self->_effects;
  if (!effects)
  {
    id v4 = +[CFXEffect effectIdentifiersForEffectType:self];
    id v5 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", *(void *)(*((void *)&v14 + 1) + 8 * v10), self, (void)v14);
          if (v11) {
            [(NSOrderedSet *)v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    objc_super v12 = self->_effects;
    self->_effects = v5;

    effects = self->_effects;
  }
  return effects;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CFXEffectType *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(CFXEffectType *)self identifier];
      uint64_t v7 = [(CFXEffectType *)v5 identifier];

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
  uint64_t v2 = [(CFXEffectType *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setEffects:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (int)jtEffectType
{
  return self->_jtEffectType;
}

- (void)setJtEffectType:(int)a3
{
  self->_jtEffectType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effects, 0);
}

@end