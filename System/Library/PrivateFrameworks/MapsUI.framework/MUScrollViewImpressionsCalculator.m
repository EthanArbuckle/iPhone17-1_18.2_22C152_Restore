@interface MUScrollViewImpressionsCalculator
- (MUScrollViewImpressionsCalculator)initWithConfiguration:(id)a3 visibleItemsProvider:(id)a4;
- (void)logImpressions;
@end

@implementation MUScrollViewImpressionsCalculator

- (MUScrollViewImpressionsCalculator)initWithConfiguration:(id)a3 visibleItemsProvider:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUScrollViewImpressionsCalculator;
  v7 = [(MUImpressionsCalculator *)&v10 initWithConfiguration:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_visibleItemsProvider, v6);
  }

  return v8;
}

- (void)logImpressions
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([(MUImpressionsCalculator *)self isActive])
  {
    v3 = (void *)MEMORY[0x1E4F1CA80];
    v4 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
    v5 = [v4 allKeys];
    id v6 = [v3 setWithArray:v5];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_visibleItemsProvider);
    v8 = [WeakRetained visibleImpressionElements];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
          v15 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
          v16 = [v14 elementIdentifier];
          v17 = [v15 objectForKey:v16];

          if (v17)
          {
            [v14 frame];
            -[_MUImpressionUIElement setFrame:](v17, "setFrame:");
            v18 = [v14 elementIdentifier];
            [v6 removeObject:v18];
          }
          else
          {
            v17 = objc_alloc_init(_MUImpressionUIElement);
            [v14 frame];
            -[_MUImpressionUIElement setFrame:](v17, "setFrame:");
            [(_MUImpressionUIElement *)v17 setClientElement:v14];
            v18 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
            v19 = [v14 elementIdentifier];
            [v18 setObject:v17 forKey:v19];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }
    v30 = v9;

    v20 = [MEMORY[0x1E4F1C9C8] date];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v21 = [v6 allObjects];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * v25);
          v27 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
          v28 = [v27 objectForKey:v26];

          [(MUImpressionsCalculator *)self _logExitForImpressionUIElement:v28 usingExitDate:v20];
          v29 = [(MUImpressionsCalculator *)self uiElementsByIdentifiers];
          [v29 removeObjectForKey:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }

    [(MUImpressionsCalculator *)self _checkVisibilityForAllItemsOnDate:v20];
  }
}

- (void).cxx_destruct
{
}

@end