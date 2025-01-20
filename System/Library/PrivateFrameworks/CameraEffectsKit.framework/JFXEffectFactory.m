@interface JFXEffectFactory
+ (JFXEffectFactoryDelegate)delegate;
+ (id)sharedInstance;
+ (void)setDelegate:(id)a3;
- (id)createEffectContentDataSourceForEffectID:(id)a3 ofType:(int)a4;
- (id)createEffectForType:(int)a3 fromID:(id)a4 withProperties:(id)a5;
- (id)effectsForType:(int)a3 fromCategory:(id)a4;
- (id)noneEffectIDForType:(int)a3;
- (void)defaultPickerItemForType:(int)a3 completion:(id)a4;
- (void)effectCategoriesForPickerItem:(id)a3 completion:(id)a4;
- (void)effectCategoriesForType:(int)a3 completion:(id)a4;
- (void)effectIDsForPickerItem:(id)a3 completion:(id)a4;
- (void)effectIDsForType:(int)a3 completion:(id)a4;
- (void)effectsForType:(int)a3 completion:(id)a4;
- (void)effectsForType:(int)a3 pickerItem:(id)a4 completion:(id)a5;
- (void)fetchPickerItems:(id)a3;
- (void)pickerItemForCategory:(id)a3 completion:(id)a4;
@end

@implementation JFXEffectFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_sInstance_1;
  return v2;
}

uint64_t __34__JFXEffectFactory_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (JFXEffectFactoryDelegate)delegate
{
  return (JFXEffectFactoryDelegate *)(id)jfx_factoryDelegate;
}

+ (void)setDelegate:(id)a3
{
}

- (void)effectCategoriesForPickerItem:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = [(id)objc_opt_class() delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(id)objc_opt_class() delegate];
    v10 = [v11 uuid];
    [v9 effectFactory:self effectCategoriesForGroupID:v10 completion:v6];
  }
  else
  {
    v6[2](v6, MEMORY[0x263EFFA68]);
  }
}

- (void)effectCategoriesForType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = [(id)objc_opt_class() delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v12 = [(id)objc_opt_class() delegate];
    [v12 effectFactory:self effectCategoriesAvailableForType:v4 completion:v6];
    goto LABEL_14;
  }
  if (effectCategoriesForType_completion__onceToken != -1) {
    dispatch_once(&effectCategoriesForType_completion__onceToken, &__block_literal_global_60);
  }
  switch(v4)
  {
    case 1:
      v9 = &kJFXEffectPropertiesFiltersKey;
      break;
    case 2:
      v9 = &kJFXEffectPropertiesOverlaysKey;
      break;
    case 4:
      v9 = &kJFXEffectPropertiesTitleCardsKey;
      break;
    default:
      v10 = 0;
      goto LABEL_13;
  }
  v10 = *v9;
LABEL_13:
  id v12 = v10;
  uint64_t v11 = [(id)effectCategoriesForType_completion__sAllEffectCategories objectForKeyedSubscript:v10];
  v6[2](v6, v11);

  v6 = (void (**)(id, uint64_t))v11;
LABEL_14:
}

void __55__JFXEffectFactory_effectCategoriesForType_completion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)effectCategoriesForType_completion__sAllEffectCategories;
  effectCategoriesForType_completion__sAllEffectCategories = (uint64_t)v0;

  v2 = NSDictionary;
  v3 = [MEMORY[0x263F086E0] jfxBundle];
  uint64_t v4 = [v3 pathForResource:kJFXEffectPropertiesResourceFile ofType:kJFXEffectPropertiesPlistKey];
  id v5 = [v2 dictionaryWithContentsOfFile:v4];

  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_66];
}

void __55__JFXEffectFactory_effectCategoriesForType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v25 = v4;
  if ([v4 isEqualToString:kJFXEffectPropertiesOverlaysKey])
  {
    char v6 = 0;
    int v7 = 2;
LABEL_5:
    unsigned int v28 = v7;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:kJFXEffectPropertiesTitleCardsKey])
  {
    char v6 = 0;
    int v7 = 4;
    goto LABEL_5;
  }
  unsigned int v28 = [v4 isEqualToString:kJFXEffectPropertiesFiltersKey];
  char v6 = v28 ^ 1;
LABEL_7:
  v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = v28;
  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v37;
    char v26 = v6;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v6) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = objc_opt_new();
        }
        [v11 setEffectType:v8];
        id v12 = [v10 objectForKeyedSubscript:kJFXEffectPropertiesIdentifierKey];
        if (v12)
        {
          [v11 setCategoryID:v12];
          v13 = [v12 stringByAppendingString:@"_Category_Display_Name"];
          v14 = [MEMORY[0x263F086E0] jfxBundle];
          v15 = [v14 localizedStringForKey:v13 value:&stru_26E7CDB50 table:0];

          [v11 setDisplayName:v15];
          id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
          v17 = [v10 objectForKeyedSubscript:kJFXEffectPropertiesEffectsKey];
          v18 = v17;
          if (v17)
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v33;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v33 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  v23 = [*(id *)(*((void *)&v32 + 1) + 8 * j) objectForKeyedSubscript:kJFXEffectPropertiesIdentifierKey];
                  if (v23) {
                    [v16 addObject:v23];
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v20);
            }
            [v11 setEffectIDs:v16];
            char v6 = v26;
            uint64_t v8 = v28;
          }
          v24 = [v11 effectIDs];

          if (v24) {
            [v27 addObject:v11];
          }
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v31);
  }

  [(id)effectCategoriesForType_completion__sAllEffectCategories setObject:v27 forKeyedSubscript:v25];
}

- (void)effectIDsForType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() delegate];
  [v7 effectFactory:self effectIDsAvailableForType:v4 completion:v6];
}

- (void)effectIDsForPickerItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(id)objc_opt_class() delegate];
    uint64_t v11 = [v6 uuid];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke;
    v12[3] = &unk_264C0AF60;
    id v13 = v7;
    [v10 effectFactory:self effectCategoriesForGroupID:v11 completion:v12];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x263EFFA68]);
  }
}

void __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) effectIDs];
        [v4 addObjectsFromArray:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke_2;
  v13[3] = &unk_264C0AF38;
  id v11 = *(id *)(a1 + 32);
  id v14 = v4;
  id v15 = v11;
  id v12 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)effectsForType:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__JFXEffectFactory_effectsForType_completion___block_invoke;
  v8[3] = &unk_264C0AF88;
  int v10 = v4;
  id v9 = v6;
  id v7 = v6;
  [(JFXEffectFactory *)self effectIDsForType:v4 completion:v8];
}

void __46__JFXEffectFactory_effectsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (objc_class *)JFXEffectClassForType(*(_DWORD *)(a1 + 40));
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = [v4 alloc];
        id v13 = objc_msgSend(v12, "initWithEffectID:", v11, (void)v14);
        if (v13) {
          [v5 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)effectsForType:(int)a3 pickerItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__JFXEffectFactory_effectsForType_pickerItem_completion___block_invoke;
  v10[3] = &unk_264C0AF88;
  int v12 = a3;
  id v11 = v8;
  id v9 = v8;
  [(JFXEffectFactory *)self effectIDsForPickerItem:a4 completion:v10];
}

void __57__JFXEffectFactory_effectsForType_pickerItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (objc_class *)JFXEffectClassForType(*(_DWORD *)(a1 + 40));
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = [v4 alloc];
        id v13 = objc_msgSend(v12, "initWithEffectID:", v11, (void)v14);
        if (v13) {
          [v5 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)effectsForType:(int)a3 fromCategory:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (objc_class *)JFXEffectClassForType(a3);
  uint64_t v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v5, "effectIDs", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)[[v6 alloc] initWithEffectID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)fetchPickerItems:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() delegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__JFXEffectFactory_fetchPickerItems___block_invoke;
  v7[3] = &unk_264C0AF60;
  id v8 = v4;
  id v6 = v4;
  [v5 effectFactory:self fetchPickerItemsWithCompletion:v7];
}

void __37__JFXEffectFactory_fetchPickerItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__JFXEffectFactory_fetchPickerItems___block_invoke_2;
  v6[3] = &unk_264C0AF38;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __37__JFXEffectFactory_fetchPickerItems___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)defaultPickerItemForType:(int)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke;
  v8[3] = &unk_264C0AF88;
  int v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(JFXEffectFactory *)self fetchPickerItems:v8];
}

void __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke_2;
  v7[3] = &__block_descriptor_36_e34_B32__0__JFXPickerListItem_8Q16_B24l;
  int v8 = *(_DWORD *)(a1 + 40);
  id v3 = a2;
  uint64_t v4 = [v3 indexOfObjectPassingTest:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 objectAtIndexedSubscript:v4];

  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

BOOL __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 effectType] == *(_DWORD *)(a1 + 32);
}

- (void)pickerItemForCategory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke;
  v10[3] = &unk_264C0AFF8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(JFXEffectFactory *)self fetchPickerItems:v10];
}

void __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [v7 collections];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_2;
        v14[3] = &unk_264C0AFD0;
        id v15 = *(id *)(a1 + 32);
        uint64_t v9 = [v8 indexOfObjectPassingTest:v14];

        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_3;
          block[3] = &unk_264C0AF38;
          id v10 = *(id *)(a1 + 40);
          block[4] = v7;
          id v13 = v10;
          dispatch_async(MEMORY[0x263EF83A0], block);

          goto LABEL_11;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 categoryID];
  uint64_t v4 = [*(id *)(a1 + 32) categoryID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)createEffectForType:(int)a3 fromID:(id)a4 withProperties:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (objc_class *)JFXEffectClassForType(a3);
  if (v9)
  {
    id v10 = (void *)[[v9 alloc] initWithEffectID:v7];
    id v11 = v10;
    if (v8) {
      [v10 addEffectParameters:v8];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)noneEffectIDForType:(int)a3
{
  id v4 = 0;
  if (a3 <= 8 && ((1 << a3) & 0x162) != 0) {
    id v4 = (id)*MEMORY[0x263F61368];
  }
  return v4;
}

- (id)createEffectContentDataSourceForEffectID:(id)a3 ofType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (+[JFXEffect effectIDIsNone:v6]
    || ([(id)objc_opt_class() delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) == 0))
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = [(id)objc_opt_class() delegate];
    id v10 = [v9 effectFactory:self createEffectContentDataSourceForEffectID:v6 ofType:v4];
  }
  return v10;
}

@end