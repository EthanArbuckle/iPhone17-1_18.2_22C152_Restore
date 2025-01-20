@interface WKSPInterfaceList
- (NSArray)rowControllerProperties;
- (NSArray)rowControllers;
- (NSDictionary)rowDescriptions;
- (WKInterfaceController)controller;
- (id)rowControllerAtIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_setupWithDescription:(id)a3 forController:(id)a4;
- (void)setController:(id)a3;
- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4;
- (void)setRowControllerProperties:(id)a3;
- (void)setRowControllers:(id)a3;
- (void)setRowDescriptions:(id)a3;
- (void)setRowTypes:(id)a3;
@end

@implementation WKSPInterfaceList

- (void)_setupWithDescription:(id)a3 forController:(id)a4
{
  id v6 = a4;
  [(WKSPInterfaceList *)self setRowDescriptions:a3];
  [(WKSPInterfaceList *)self setController:v6];
}

- (void)setNumberOfRows:(int64_t)a3 withRowType:(id)a4
{
  id v8 = a4;
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    do
      [v6 setObject:v8 atIndexedSubscript:v7++];
    while (a3 != v7);
  }
  [(WKSPInterfaceList *)self setRowTypes:v6];
}

- (void)setRowTypes:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v20 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
  v19 = [MEMORY[0x263EFF980] array];
  v22 = v4;
  [(WKSPInterfaceObject *)self _sendValueChanged:v4];
  uint64_t v21 = v5;
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v22 objectAtIndexedSubscript:v6];
      id v8 = [(WKSPInterfaceList *)self rowDescriptions];
      v9 = [v8 objectForKeyedSubscript:v7];
      v10 = [v9 objectForKeyedSubscript:@"controllerClass"];

      id v11 = objc_alloc_init(NSClassFromString(v10));
      if (v11)
      {
        v24 = v10;
        v23 = [(WKSPInterfaceList *)self rowDescriptions];
        v12 = [v23 objectForKeyedSubscript:v7];
        v13 = [v12 objectForKeyedSubscript:@"rows"];
        v14 = [(WKSPInterfaceObject *)self viewControllerID];
        v15 = [(WKSPInterfaceList *)self rowDescriptions];
        v16 = [v15 objectForKeyedSubscript:@"index"];
        v17 = +[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:](SPRemoteInterface, "controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:", v11, v13, v14, [v16 integerValue], v6, 0);
        [v19 addObjectsFromArray:v17];

        v10 = v24;
        [v20 setObject:v11 atIndexedSubscript:v6];
      }
      else
      {
        NSLog(&cfstr_ErrorUnableToI.isa, v10, v6);
        v18 = wk_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v26 = "-[WKSPInterfaceList setRowTypes:]";
          __int16 v27 = 1024;
          int v28 = 263;
          __int16 v29 = 2114;
          v30 = v10;
          __int16 v31 = 2048;
          uint64_t v32 = v6;
          _os_log_error_impl(&dword_2211F3000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error unable to instantiate row controller class %{public}@ for row %ld", buf, 0x26u);
        }
      }
      ++v6;
    }
    while (v21 != v6);
  }
  [(WKSPInterfaceList *)self setRowControllers:v20];
  [(WKSPInterfaceList *)self setRowControllerProperties:v19];
}

- (int64_t)numberOfRows
{
  v2 = [(WKSPInterfaceList *)self rowControllers];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)rowControllerAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = [(WKSPInterfaceList *)self rowControllers];
    if ([v5 count] <= (unint64_t)a3)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = [(WKSPInterfaceList *)self rowControllers];
      uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
    }
  }

  return v7;
}

- (NSArray)rowControllers
{
  return self->_rowControllers;
}

- (void)setRowControllers:(id)a3
{
}

- (NSDictionary)rowDescriptions
{
  return self->_rowDescriptions;
}

- (void)setRowDescriptions:(id)a3
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

- (NSArray)rowControllerProperties
{
  return self->_rowControllerProperties;
}

- (void)setRowControllerProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowControllerProperties, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_rowDescriptions, 0);

  objc_storeStrong((id *)&self->_rowControllers, 0);
}

@end