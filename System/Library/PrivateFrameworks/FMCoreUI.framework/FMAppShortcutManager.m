@interface FMAppShortcutManager
+ (id)sharedInstance;
- (BOOL)hasShortcutItems;
- (id)createShortcutForItem:(id)a3;
- (void)clearShortcutItems;
- (void)removeShortcutItemWithIentifier:(id)a3;
- (void)setShortcutItem:(id)a3;
- (void)setShortcutItems:(id)a3;
@end

@implementation FMAppShortcutManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __38__FMAppShortcutManager_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(FMAppShortcutManager);
  return MEMORY[0x270F9A758]();
}

- (void)setShortcutItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F1C408] sharedApplication];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 shortcutItems];
    if ([v7 count])
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v8 = [v4 count];

    if (v8)
    {
      v7 = [MEMORY[0x263EFF980] array];
      v9 = LogCategory_Unspecified();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[FMAppShortcutManager setShortcutItems:](v9);
      }

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v20 = v6;
        id v21 = v4;
        v13 = 0;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          v16 = v13;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            v13 = objc_msgSend(v17, "shortcutIdentifier", v20, v21, (void)v22);

            if ([v13 length])
            {
              v18 = LogCategory_Unspecified();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                -[FMAppShortcutManager setShortcutItems:](v26, v17, &v27, v18);
              }

              v19 = [(FMAppShortcutManager *)self createShortcutForItem:v17];
              [v7 addObject:v19];
            }
            ++v15;
            v16 = v13;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v12);

        v6 = v20;
        id v4 = v21;
      }

      [v6 setShortcutItems:v7];
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (BOOL)hasShortcutItems
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 shortcutItems];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)setShortcutItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F1C408] sharedApplication];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v5 shortcutItems];
    uint64_t v8 = (void *)[v7 mutableCopy];

    v9 = [v4 shortcutIdentifier];
    if ([v9 length])
    {
      long long v24 = self;
      long long v25 = v8;
      v26 = v6;
      uint64_t v27 = v4;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v13 = 0;
        uint64_t v14 = *(void *)v29;
        while (2)
        {
          uint64_t v15 = 0;
          v16 = v13;
          do
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v28 + 1) + 8 * v15);
            v13 = objc_msgSend(v17, "userInfo", v24);

            v18 = [v13 objectForKeyedSubscript:@"FMShortcutItemIdentifierKey"];
            char v19 = [v9 isEqualToString:v18];

            if (v19)
            {
              id v20 = v17;

              if (v20) {
                [v10 removeObject:v20];
              }
              goto LABEL_17;
            }
            ++v15;
            v16 = v13;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      else
      {
        v13 = 0;
      }

      id v20 = 0;
LABEL_17:
      v6 = v26;
      id v4 = v27;
      id v21 = -[FMAppShortcutManager createShortcutForItem:](v24, "createShortcutForItem:", v27, v24);
      [v10 insertObject:v21 atIndex:0];
      if ((unint64_t)[v10 count] < 5)
      {
        [v26 setShortcutItems:v10];
      }
      else
      {
        long long v22 = objc_msgSend(v10, "subarrayWithRange:", 0, 4);
        [v26 setShortcutItems:v22];
      }
      uint64_t v8 = v25;
      long long v23 = LogCategory_Unspecified();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[FMAppShortcutManager setShortcutItem:](v27, v23);
      }
    }
  }
}

- (void)removeShortcutItemWithIentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F1C408] sharedApplication];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 shortcutItems];
    v7 = (void *)[v6 mutableCopy];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v19 = v5;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v21;
LABEL_4:
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        uint64_t v11 = [v15 userInfo];

        v16 = [v11 objectForKeyedSubscript:@"FMShortcutItemIdentifierKey"];
        char v17 = [v3 isEqualToString:v16];

        if (v17) {
          break;
        }
        ++v13;
        uint64_t v14 = v11;
        if (v10 == v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_4;
          }
          id v18 = v8;
          v5 = v19;
          goto LABEL_14;
        }
      }
      id v18 = v15;

      if (v18)
      {
        [v8 removeObject:v18];
        v5 = v19;
        [v19 setShortcutItems:v8];
        goto LABEL_14;
      }
      v5 = v19;
    }
    else
    {
      uint64_t v11 = 0;
      id v18 = v8;
LABEL_14:
    }
  }
}

- (id)createShortcutForItem:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 shortcutUserInfo],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5 = (void *)[v4 mutableCopy],
        v4,
        !v5))
  {
    v5 = objc_opt_new();
  }
  v6 = [v3 shortcutIdentifier];
  [v5 setObject:v6 forKeyedSubscript:@"FMShortcutItemIdentifierKey"];

  v7 = [v3 shortcutTitle];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v3 shortcutSubTitle];
  }
  else
  {
    id v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 shortcutIconContact], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v10 = (void *)v9,
        [MEMORY[0x263F1C440] iconWithContact:v9],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v3 shortcutIconImage], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0)
      || (uint64_t v13 = (void *)v12,
          [MEMORY[0x263F1C440] iconWithCustomImage:v12],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v11))
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v14 = [v3 shortcutIconImageName];
        if ([v14 length])
        {
          uint64_t v11 = [MEMORY[0x263F1C440] iconWithTemplateImageName:v14];
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }
  id v15 = objc_alloc(MEMORY[0x263F1C7D8]);
  v16 = [v3 shortcutType];
  char v17 = (void *)[v15 initWithType:v16 localizedTitle:v7 localizedSubtitle:v8 icon:v11 userInfo:v5];

  return v17;
}

- (void)clearShortcutItems
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218714000, log, OS_LOG_TYPE_DEBUG, "All shortcut items are cleared", v1, 2u);
}

- (void)setShortcutItems:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  v7 = [a2 shortcutType];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_218714000, a4, OS_LOG_TYPE_DEBUG, "Item is - %@", a1, 0xCu);
}

- (void)setShortcutItems:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218714000, log, OS_LOG_TYPE_DEBUG, "Setting initial shortcut items.", v1, 2u);
}

- (void)setShortcutItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 shortcutIdentifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_218714000, a2, OS_LOG_TYPE_DEBUG, "New shortcut item passed - %@", (uint8_t *)&v4, 0xCu);
}

@end