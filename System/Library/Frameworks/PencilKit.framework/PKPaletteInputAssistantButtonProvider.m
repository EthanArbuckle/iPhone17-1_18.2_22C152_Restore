@interface PKPaletteInputAssistantButtonProvider
- (BOOL)_shouldIncludeBarButtonItem:(id)a3;
- (PKPaletteInputAssistantButtonProvider)init;
- (PKPaletteInputAssistantButtonProvider)initWithInputAssistantItem:(id)a3;
- (UITextInputAssistantItem)inputAssistantItem;
- (id)_nonSystemBarButtonItemGroups;
- (id)buttonsForCurrentConfiguration;
- (id)inclusionFilter;
- (void)setInclusionFilter:(id)a3;
- (void)setInputAssistantItem:(id)a3;
@end

@implementation PKPaletteInputAssistantButtonProvider

- (PKPaletteInputAssistantButtonProvider)init
{
  return [(PKPaletteInputAssistantButtonProvider *)self initWithInputAssistantItem:0];
}

- (PKPaletteInputAssistantButtonProvider)initWithInputAssistantItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteInputAssistantButtonProvider;
  v6 = [(PKPaletteInputAssistantButtonProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inputAssistantItem, a3);
  }

  return v7;
}

- (id)buttonsForCurrentConfiguration
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaletteInputAssistantButtonProvider *)self _nonSystemBarButtonItemGroups];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        objc_super v9 = [v8 barButtonItems];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              if ([(PKPaletteInputAssistantButtonProvider *)self _shouldIncludeBarButtonItem:v14])
              {
                v15 = [[PKPaletteBarButton alloc] initWithBarButtonItem:v14];
                [v4 addObject:v15];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }

  if (_os_feature_enabled_impl()
    && [MEMORY[0x1E4FB1910] dictationInputModeIsFunctional])
  {
    v16 = (void *)MEMORY[0x1E4FB1470];
    v17 = [(PKPaletteInputAssistantButtonProvider *)self inputAssistantItem];
    v18 = [v16 barButtonItemForAssistantItemStyle:12 target:v17];

    v19 = [[PKPaletteDictationBarButton alloc] initWithBarButtonItem:v18];
    [v4 addObject:v19];
  }
  v20 = (void *)[v4 copy];

  return v20;
}

- (id)_nonSystemBarButtonItemGroups
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaletteInputAssistantButtonProvider *)self inputAssistantItem];
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v2 leadingBarButtonGroups];
    uint64_t v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = v3;
    }
    id v8 = v7;

    uint64_t v9 = [v2 trailingBarButtonGroups];
    uint64_t v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v3;
    }
    id v12 = v11;

    v13 = [v8 arrayByAddingObjectsFromArray:v12];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v18 _isSystemGroup] & 1) == 0) {
            [v4 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }
    v3 = (void *)[v4 copy];
  }

  return v3;
}

- (BOOL)_shouldIncludeBarButtonItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 customView];

  if (v5
    || ([v4 target],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v10 = [(PKPaletteInputAssistantButtonProvider *)self inclusionFilter];
    uint64_t v11 = (void *)v10;
    if (v10) {
      char v8 = (*(uint64_t (**)(uint64_t, PKPaletteInputAssistantButtonProvider *, id))(v10 + 16))(v10, self, v4);
    }
    else {
      char v8 = 1;
    }
  }
  return v8;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

- (void)setInputAssistantItem:(id)a3
{
}

- (id)inclusionFilter
{
  return self->_inclusionFilter;
}

- (void)setInclusionFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inclusionFilter, 0);

  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
}

@end