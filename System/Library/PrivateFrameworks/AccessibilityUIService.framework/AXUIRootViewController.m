@interface AXUIRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4;
- (id)description;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
@end

@implementation AXUIRootViewController

- (void)loadView
{
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  id v3 = objc_alloc((Class)objc_opt_class());
  [v6 bounds];
  v4 = objc_msgSend(v3, "initWithFrame:");
  [v4 setAutoresizingMask:18];
  v5 = [MEMORY[0x263F1C550] clearColor];
  [v4 setBackgroundColor:v5];

  [(AXUIRootViewController *)self setView:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(AXUIRootViewController *)self childViewControllers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    unint64_t v7 = 30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= [*(id *)(*((void *)&v19 + 1) + 8 * i) supportedInterfaceOrientations];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
    if (!v7)
    {
      if ([(AXUIRootViewController *)self isViewLoaded])
      {
        v9 = [(AXUIRootViewController *)self view];
        v10 = [v9 window];
      }
      else
      {
        v10 = 0;
      }
      v11 = [MEMORY[0x263F213E0] sharedInstance];
      char v12 = [v11 ignoreLogging];

      if ((v12 & 1) == 0)
      {
        v13 = [MEMORY[0x263F213E0] identifier];
        v14 = AXLoggerForFacility();

        os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = AXColorizeFormatLog();
          [v10 windowLevel];
          v17 = _AXStringForArgs();
          if (os_log_type_enabled(v14, v15))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v17;
            _os_log_impl(&dword_221750000, v14, v15, "%{public}@", buf, 0xCu);
          }
        }
      }

      unint64_t v7 = 2;
    }
  }
  else
  {
    unint64_t v7 = 30;
  }

  return v7;
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a3 != 0;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(AXUIRootViewController *)self childViewControllers];
  uint64_t v5 = [v3 stringWithFormat:@"AXUIRootViewController<%p> Content: %@", self, v4];

  return v5;
}

@end