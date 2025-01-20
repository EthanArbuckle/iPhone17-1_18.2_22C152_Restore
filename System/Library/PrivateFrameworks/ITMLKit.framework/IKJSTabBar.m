@interface IKJSTabBar
- (IKAppTabBar)appTabBar;
- (IKJSTabBar)initWithAppContext:(id)a3 appTabBar:(id)a4;
- (IKJSTabBarItem)selectedTab;
- (NSArray)tabItems;
- (NSArray)tabs;
- (id)asPrivateIKJSTabBar;
- (id)transientTab;
- (void)_onSelectSync;
- (void)_setSelectedTabNavigationDocumentOnJSContext:(id)a3;
- (void)onSelect;
- (void)setSelectedTab:(id)a3;
- (void)setTabItems:(id)a3;
- (void)setTabs:(id)a3;
@end

@implementation IKJSTabBar

- (id)asPrivateIKJSTabBar
{
  if ([(IKJSTabBar *)self conformsToProtocol:&unk_1F3E59410]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSTabBar)initWithAppContext:(id)a3 appTabBar:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKJSTabBar;
  v7 = [(IKJSObject *)&v11 initWithAppContext:a3];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_appTabBar, v6);
    [v6 setJsTabBar:v8];
  }
  return v8;
}

- (void)setTabs:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v53 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v58 = @"identifier";
          id v9 = [v8 identifier];
          v59 = v9;
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          [v4 addObject:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 addObject:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v5);
  }

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__29;
  v50 = __Block_byref_object_dispose__29;
  id v51 = 0;
  objc_super v11 = [(IKJSObject *)self appContext];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __22__IKJSTabBar_setTabs___block_invoke;
  v43[3] = &unk_1E6DE4C88;
  v45 = &v46;
  v43[4] = self;
  id v31 = v4;
  id v44 = v31;
  [v11 evaluateDelegateBlockSync:v43];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_tabItems, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v13 = self->_tabItems;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v18 = [v17 identifier];
        [v12 setObject:v17 forKey:v18];
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v57 count:16];
    }
    while (v14);
  }

  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v20 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend((id)v47[5], "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = (id)v47[5];
  uint64_t v21 = [v32 countByEnumeratingWithState:&v35 objects:v56 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v32);
        }
        v24 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        v25 = [v24 objectForKeyedSubscript:@"identifier"];
        v26 = [v12 objectForKey:v25];

        if (v26)
        {
          v27 = [v12 objectForKey:v25];
          [v20 addObject:v27];
        }
        else
        {
          v28 = [IKJSTabBarItem alloc];
          v27 = [(IKJSObject *)self appContext];
          v29 = [v24 objectForKeyedSubscript:@"navigationController"];
          v30 = [(IKJSTabBarItem *)v28 initWithAppContext:v27 identifier:v25 navigationController:v29 owner:self];
          [v20 addObject:v30];
        }
      }
      uint64_t v21 = [v32 countByEnumeratingWithState:&v35 objects:v56 count:16];
    }
    while (v21);
  }

  objc_storeStrong((id *)&self->_tabItems, v20);
  [(IKJSTabBar *)self _onSelectSync];

  _Block_object_dispose(&v46, 8);
}

void __22__IKJSTabBar_setTabs___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) appTabBar];
  v2 = [v7 controller];
  id v3 = [*(id *)(a1 + 32) appTabBar];
  uint64_t v4 = [v2 tabBar:v3 setTabItems:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSArray)tabs
{
  v2 = [(IKJSTabBar *)self tabItems];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (IKJSTabBarItem)selectedTab
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  id v3 = [(IKJSObject *)self appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __25__IKJSTabBar_selectedTab__block_invoke;
  v18[3] = &unk_1E6DE3860;
  v18[4] = self;
  v18[5] = &v19;
  [v3 evaluateDelegateBlockSync:v18];

  if (v20[5])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [(IKJSTabBar *)self tabItems];
    uint64_t v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:v20[5]];

          if (v11)
          {
            id v12 = v9;

            uint64_t v5 = v12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return (IKJSTabBarItem *)v5;
}

void __25__IKJSTabBar_selectedTab__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) appTabBar];
  v2 = [v7 controller];
  id v3 = [*(id *)(a1 + 32) appTabBar];
  uint64_t v4 = [v2 selectedTabItemForTabBar:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)setSelectedTab:(id)a3
{
  uint64_t v4 = [a3 identifier];
  uint64_t v5 = [(IKJSObject *)self appContext];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __29__IKJSTabBar_setSelectedTab___block_invoke;
  v10 = &unk_1E6DE3A98;
  int v11 = self;
  id v12 = v4;
  id v6 = v4;
  [v5 evaluateDelegateBlockSync:&v7];

  [(IKJSTabBar *)self _onSelectSync];
}

void __29__IKJSTabBar_setSelectedTab___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) appTabBar];
  v2 = [v4 controller];
  id v3 = [*(id *)(a1 + 32) appTabBar];
  [v2 tabBar:v3 setSelectedTabItem:*(void *)(a1 + 40)];
}

- (id)transientTab
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  id v3 = [(IKJSObject *)self appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __26__IKJSTabBar_transientTab__block_invoke;
  v18[3] = &unk_1E6DE3860;
  v18[4] = self;
  v18[5] = &v19;
  [v3 evaluateDelegateBlockSync:v18];

  if (v20[5])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(IKJSTabBar *)self tabItems];
    uint64_t v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:v20[5]];

          if (v11)
          {
            id v12 = v9;

            uint64_t v5 = v12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v25 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v5;
}

void __26__IKJSTabBar_transientTab__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) appTabBar];
  v2 = [v7 controller];
  id v3 = [*(id *)(a1 + 32) appTabBar];
  uint64_t v4 = [v2 transientTabItemForTabBar:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)onSelect
{
  id v3 = [(IKJSObject *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__IKJSTabBar_onSelect__block_invoke;
  v4[3] = &unk_1E6DE4108;
  v4[4] = self;
  [v3 evaluate:v4 completionBlock:0];
}

id __22__IKJSTabBar_onSelect__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) invokeMethod:@"onSelect" withArguments:0];
}

- (void)_onSelectSync
{
  id v3 = [(IKJSObject *)self appContext];
  uint64_t v4 = [v3 jsContext];
  [(IKJSTabBar *)self _setSelectedTabNavigationDocumentOnJSContext:v4];

  id v5 = [(IKJSObject *)self invokeMethod:@"onSelect" withArguments:0];
}

- (void)_setSelectedTabNavigationDocumentOnJSContext:(id)a3
{
  id v6 = a3;
  id v3 = [v6 objectForKeyedSubscript:@"tabBar"];
  uint64_t v4 = [v3 valueForProperty:@"selectedTab"];

  if ([v4 isObject]
    && [v4 hasProperty:@"navigationDocument"])
  {
    id v5 = [v4 valueForProperty:@"navigationDocument"];
    [v6 setObject:v5 forKeyedSubscript:@"navigationDocument"];
  }
  else
  {
    id v5 = [v6 globalObject];
    [v5 deleteProperty:@"navigationDocument"];
  }
}

- (IKAppTabBar)appTabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appTabBar);
  return (IKAppTabBar *)WeakRetained;
}

- (NSArray)tabItems
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTabItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabItems, 0);
  objc_destroyWeak((id *)&self->_appTabBar);
}

@end