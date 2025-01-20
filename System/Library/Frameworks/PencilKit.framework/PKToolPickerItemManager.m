@interface PKToolPickerItemManager
- (id)initWithToolItems:(id *)a1;
- (id)itemForTool:(id *)a1;
- (id)toolForIdentifier:(uint64_t)a1;
- (id)toolItemsForTools:(id *)a1;
- (void)_addTool:(uint64_t)a1;
- (void)_removeTool:(uint64_t)a1;
- (void)updateItemForTool:(uint64_t)a1;
@end

@implementation PKToolPickerItemManager

- (id)initWithToolItems:(id *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKToolPickerItemManager;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v5 = a1[2];
      a1[2] = v4;

      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v7 = a1[1];
      a1[1] = v6;

      id v8 = v3;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v9) {
        goto LABEL_15;
      }
      uint64_t v10 = v9;
      id v21 = v3;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = [v14 identifier];
          v16 = [a1[1] objectForKey:v15];

          if (!v16)
          {
            [a1[1] setObject:v14 forKeyedSubscript:v15];
            [a1[2] addObject:v14];
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v11 += (objc_opt_isKindOfClass() & 1) == 0;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
      id v3 = v21;
      if (!v11)
      {
LABEL_15:
        v17 = +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, @"com.apple.ink.pen");
        [a1[2] addObject:v17];
        id v18 = a1[1];
        v19 = [v17 identifier];
        [v18 setObject:v17 forKeyedSubscript:v19];
      }
    }
  }

  return a1;
}

- (void)updateItemForTool:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v5 = [v3 _toolPickerItemIdentifier];
    id v4 = [*(id *)(a1 + 8) objectForKeyedSubscript:v5];
    objc_msgSend(v4, "set_tool:", v3);
  }
}

- (id)itemForTool:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 _toolPickerItemIdentifier];
    v2 = [v2[1] objectForKeyedSubscript:v4];
    objc_msgSend(v2, "set_tool:", v3);
  }

  return v2;
}

- (void)_addTool:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 _toolPickerItemIdentifier];
    id v6 = [*(id *)(a1 + 8) objectForKeyedSubscript:v5];
    if (!v6)
    {
      id v6 = [v4 _toolPickerItem];
      [*(id *)(a1 + 8) setObject:v6 forKeyedSubscript:v5];
      if (!v6)
      {
        id v7 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315138;
          uint64_t v9 = "item";
          _os_log_error_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v8, 0xCu);
        }

        id v6 = 0;
      }
    }
    objc_msgSend(v6, "set_tool:", v4);
  }
}

- (void)_removeTool:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    id v3 = [a2 _toolPickerItemIdentifier];
    [v2 removeObjectForKey:v3];
  }
}

- (id)toolForIdentifier:(uint64_t)a1
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
    id v3 = [v2 _tool];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)toolItemsForTools:(id *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[PKToolPickerItemManager itemForTool:](a1, *(void **)(*((void *)&v12 + 1) + 8 * i));
          if (v10) {
            objc_msgSend(v4, "addObject:", v10, (void)v12);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    a1 = (id *)[v4 copy];
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueItemsForSetup, 0);

  objc_storeStrong((id *)&self->_itemMap, 0);
}

@end