@interface WKInterfaceTable
- (NSDictionary)rowDescriptions;
- (NSMutableArray)rowControllerProperties;
- (NSMutableArray)rowControllers;
- (WKInterfaceController)controller;
- (id)rowControllerAtIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_getRowControllers:(id)a3 rowControllerProperties:(id)a4 forRowTypes:(id)a5;
- (void)_setupWithDescription:(id)a3 forController:(id)a4;
- (void)insertRowsAtIndexes:(id)a3 withRowType:(id)a4;
- (void)performSegueForRow:(int64_t)a3;
- (void)removeRowsAtIndexes:(id)a3;
- (void)resequenceRowControllerPropertyIndexes;
- (void)scrollToRowAtIndex:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4;
- (void)setRowControllerProperties:(id)a3;
- (void)setRowControllers:(id)a3;
- (void)setRowDescriptions:(id)a3;
- (void)setRowTypes:(id)a3;
@end

@implementation WKInterfaceTable

- (void)_setupWithDescription:(id)a3 forController:(id)a4
{
  id v6 = a4;
  [(WKInterfaceTable *)self setRowDescriptions:a3];
  [(WKInterfaceTable *)self setController:v6];
}

- (void)_getRowControllers:(id)a3 rowControllerProperties:(id)a4 forRowTypes:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v28 = a4;
  id v31 = a5;
  v8 = [(WKInterfaceTable *)self rowDescriptions];
  v9 = [v8 objectForKeyedSubscript:@"index"];
  if ([v9 integerValue] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v27 = 0;
  }
  else
  {
    v10 = [(WKInterfaceTable *)self rowDescriptions];
    v11 = [v10 objectForKeyedSubscript:@"index"];
    uint64_t v27 = [v11 integerValue];
  }
  uint64_t v30 = [v31 count];
  if (v30 >= 1)
  {
    uint64_t v13 = 0;
    *(void *)&long long v12 = 136446978;
    long long v26 = v12;
    do
    {
      v14 = objc_msgSend(v31, "objectAtIndexedSubscript:", v13, v26);
      v15 = [(WKInterfaceTable *)self rowDescriptions];
      v16 = [v15 objectForKeyedSubscript:v14];
      v17 = [v16 objectForKeyedSubscript:@"controllerClass"];

      id v18 = objc_alloc_init(NSClassFromString(v17));
      if (v18)
      {
        v19 = [(WKInterfaceTable *)self rowDescriptions];
        v20 = [v19 objectForKeyedSubscript:v14];
        v21 = [v20 objectForKeyedSubscript:@"rows"];
        v22 = [(WKInterfaceObject *)self viewControllerID];
        v23 = +[SPRemoteInterface controller:v18 setupProperties:v21 viewControllerID:v22 tableIndex:v27 rowIndex:v13 classForType:_WKInterfaceObjectClassWithType];
        [v28 addObject:v23];

        [v29 setObject:v18 atIndexedSubscript:v13];
      }
      else if (v17)
      {
        v24 = wk_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          v33 = "-[WKInterfaceTable _getRowControllers:rowControllerProperties:forRowTypes:]";
          __int16 v34 = 1024;
          int v35 = 65;
          __int16 v36 = 2114;
          v37 = v17;
          __int16 v38 = 2048;
          uint64_t v39 = v13;
          _os_log_error_impl(&dword_2211F3000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - unable to instantiate row controller class %{public}@ for row %ld", buf, 0x26u);
        }
      }
      else
      {
        v25 = objc_opt_new();
        [v29 setObject:v25 atIndexedSubscript:v13];
      }
      ++v13;
    }
    while (v30 != v13);
  }
}

- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = wk_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446978;
    long long v12 = "-[WKInterfaceTable setNumberOfRows:withRowType:]";
    __int16 v13 = 1024;
    int v14 = 74;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_2211F3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: numberOfRows=%ld rowType=%{public}@", (uint8_t *)&v11, 0x26u);
  }

  v8 = (void *)[v6 copy];
  v9 = [MEMORY[0x263EFF980] array];
  if (a3 >= 1)
  {
    uint64_t v10 = 0;
    do
      [v9 setObject:v8 atIndexedSubscript:v10++];
    while (a3 != v10);
  }
  [(WKInterfaceTable *)self setRowTypes:v9];
}

- (void)setRowTypes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446978;
    uint64_t v10 = "-[WKInterfaceTable setRowTypes:]";
    __int16 v11 = 1024;
    int v12 = 85;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 count];
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_2211F3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: %lu rowTypes: %{public}@", (uint8_t *)&v9, 0x26u);
  }

  id v6 = (void *)[v4 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v6 forProperty:@"rowTypes"];

  v7 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF980] array];
  [(WKInterfaceTable *)self _getRowControllers:v7 rowControllerProperties:v8 forRowTypes:v4];
  [(WKInterfaceTable *)self setRowControllers:v7];
  [(WKInterfaceTable *)self setRowControllerProperties:v8];
}

- (int64_t)numberOfRows
{
  v2 = [(WKInterfaceTable *)self rowControllers];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)rowControllerAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(WKInterfaceTable *)self rowControllers],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    __int16 v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(WKInterfaceTable *)self rowControllerAtIndex:v11];
    }

    id v10 = 0;
  }
  else
  {
    v7 = [(WKInterfaceTable *)self rowControllers];
    v8 = [v7 objectAtIndexedSubscript:a3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v9 = 0;
    }
    else {
      int v9 = v8;
    }
    id v10 = v9;
  }

  return v10;
}

- (void)insertRowsAtIndexes:(id)a3 withRowType:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = wk_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v24 = "-[WKInterfaceTable insertRowsAtIndexes:withRowType:]";
    __int16 v25 = 1024;
    int v26 = 123;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    id v30 = v7;
    _os_log_impl(&dword_2211F3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: rows=%{public}@ rowType=%{public}@", buf, 0x26u);
  }

  uint64_t v9 = [v6 count];
  id v10 = [MEMORY[0x263EFF980] array];
  if (v9 >= 1)
  {
    do
    {
      [v10 addObject:v7];
      --v9;
    }
    while (v9);
  }
  __int16 v11 = (void *)[v10 copy];
  int v12 = objc_msgSend(v6, "copy", v11);
  v22[1] = v12;
  __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  [(WKInterfaceObject *)self _sendValueChanged:v13 forProperty:@".insert"];

  uint64_t v14 = [MEMORY[0x263EFF980] array];
  __int16 v15 = [MEMORY[0x263EFF980] array];
  [(WKInterfaceTable *)self _getRowControllers:v14 rowControllerProperties:v15 forRowTypes:v10];
  id v16 = [(WKInterfaceTable *)self rowControllers];

  if (!v16)
  {
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    [(WKInterfaceTable *)self setRowControllers:v17];
  }
  id v18 = [(WKInterfaceTable *)self rowControllerProperties];

  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    [(WKInterfaceTable *)self setRowControllerProperties:v19];
  }
  if ([v14 count])
  {
    v20 = [(WKInterfaceTable *)self rowControllers];
    [v20 insertObjects:v14 atIndexes:v6];
  }
  if ([v15 count])
  {
    v21 = [(WKInterfaceTable *)self rowControllerProperties];
    [v21 insertObjects:v15 atIndexes:v6];
  }
  [(WKInterfaceTable *)self resequenceRowControllerPropertyIndexes];
}

- (void)removeRowsAtIndexes:(id)a3
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WKInterfaceTable_removeRowsAtIndexes___block_invoke;
  v11[3] = &unk_26459A1E0;
  v11[4] = self;
  id v4 = [a3 indexesPassingTest:v11];
  if ([v4 count])
  {
    v5 = [(WKInterfaceTable *)self rowControllers];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [(WKInterfaceTable *)self rowControllers];
      [v7 removeObjectsAtIndexes:v4];
    }
    v8 = [(WKInterfaceTable *)self rowControllerProperties];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [(WKInterfaceTable *)self rowControllerProperties];
      [v10 removeObjectsAtIndexes:v4];
    }
    [(WKInterfaceTable *)self resequenceRowControllerPropertyIndexes];
    [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@".remove"];
  }
}

BOOL __40__WKInterfaceTable_removeRowsAtIndexes___block_invoke(uint64_t a1, unint64_t a2, BOOL *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) rowControllers];
  *a3 = [v6 count] <= a2;

  id v7 = [*(id *)(a1 + 32) rowControllers];
  BOOL v8 = [v7 count] > a2;

  return v8;
}

- (void)resequenceRowControllerPropertyIndexes
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [(WKInterfaceTable *)self rowControllerProperties];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setRowIndex:v5];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v5;
        ++v7;
      }
      while (v7 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)performSegueForRow:(int64_t)a3
{
  NSLog(&cfstr_Wkinterfacetab_4.isa, a2, a3);
  uint64_t v3 = wk_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[WKInterfaceTable performSegueForRow:](v3);
  }
}

- (void)scrollToRowAtIndex:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@".scroll"];
}

- (NSDictionary)rowDescriptions
{
  return self->_rowDescriptions;
}

- (void)setRowDescriptions:(id)a3
{
}

- (NSMutableArray)rowControllers
{
  return self->_rowControllers;
}

- (void)setRowControllers:(id)a3
{
}

- (NSMutableArray)rowControllerProperties
{
  return self->_rowControllerProperties;
}

- (void)setRowControllerProperties:(id)a3
{
}

- (WKInterfaceController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (WKInterfaceController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rowControllerProperties, 0);
  objc_storeStrong((id *)&self->_rowControllers, 0);

  objc_storeStrong((id *)&self->_rowDescriptions, 0);
}

- (void)rowControllerAtIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 rowControllers];
  int v6 = 136446978;
  uint64_t v7 = "-[WKInterfaceTable rowControllerAtIndex:]";
  __int16 v8 = 1024;
  int v9 = 116;
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2048;
  uint64_t v13 = [v5 count];
  _os_log_error_impl(&dword_2211F3000, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - attempt to ask for row %ld. Valid range is 0..%ld", (uint8_t *)&v6, 0x26u);
}

- (void)performSegueForRow:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136446466;
  v2 = "-[WKInterfaceTable performSegueForRow:]";
  __int16 v3 = 1024;
  int v4 = 196;
  _os_log_error_impl(&dword_2211F3000, log, OS_LOG_TYPE_ERROR, "%{public}s:%d: WKInterfaceTable performSegueForRow: has no effect in a WatchKit extension that runs on iPhone.", (uint8_t *)&v1, 0x12u);
}

@end