@interface FMViewController
- (FMViewController)init;
- (FMViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSMutableDictionary)kvoObservationTokens;
- (NSMutableSet)notificationTokens;
- (NSString)controllerNibName;
- (id)actualNibNameForName:(id)a3;
- (void)addKVOObservationToken:(id)a3 forObject:(id)a4;
- (void)addNotificationToken:(id)a3;
- (void)awakeFromNib;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4;
- (void)removeKVOObservationTokens;
- (void)removeNotificationTokens;
- (void)setKvoObservationTokens:(id)a3;
- (void)setNotificationTokens:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation FMViewController

- (FMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FMViewController;
  return [(FMViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (FMViewController)init
{
  v3 = [(FMViewController *)self controllerNibName];
  v4 = [(FMViewController *)self actualNibNameForName:v3];

  if (v4)
  {
    objc_super v5 = [(FMViewController *)self initWithNibName:v4 bundle:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMViewController;
    objc_super v5 = [(FMViewController *)&v8 init];
  }
  v6 = v5;

  return v6;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(FMViewController *)self allKVOObservers];
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          v10 = LogCategory_Unspecified();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v9;
            _os_log_error_impl(&dword_218714000, v10, OS_LOG_TYPE_ERROR, "Leaked KVO Observer: %@", buf, 0xCu);
          }

          [(FMViewController *)self removeKVOBlockForToken:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)FMViewController;
  [(FMViewController *)&v11 dealloc];
}

- (void)addKVOObservationToken:(id)a3 forObject:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(FMViewController *)self kvoObservationTokens];

    if (!v9)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      [(FMViewController *)self setKvoObservationTokens:v10];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v11 = [(FMViewController *)self kvoObservationTokens];
    long long v12 = [v11 allKeys];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_7:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        v18 = [v17 object];

        if (v18 == v8) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v20 = v17;

      if (v20) {
        goto LABEL_18;
      }
    }
    else
    {
LABEL_13:
    }
    id v20 = (id)[objc_alloc(MEMORY[0x263F3BA00]) initWithObject:v8];
LABEL_18:
    v21 = [(FMViewController *)self kvoObservationTokens];
    uint64_t v19 = [v21 objectForKeyedSubscript:v20];

    if (!v19)
    {
      uint64_t v19 = [MEMORY[0x263EFF9C0] set];
      v22 = [(FMViewController *)self kvoObservationTokens];
      [v22 setObject:v19 forKeyedSubscript:v20];
    }
    [v19 addObject:v6];
  }
  else
  {
    uint64_t v19 = LogCategory_Unspecified();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMObservingCell addKVOObservationToken:forObject:](v19);
    }
  }
}

- (void)removeKVOObservationTokens
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [(FMViewController *)self kvoObservationTokens];
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v25;
    *(void *)&long long v4 = 138412290;
    long long v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [(FMViewController *)self kvoObservationTokens];
        v10 = [v9 objectForKeyedSubscript:v8];

        objc_super v11 = [v8 object];
        if (v11)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v21 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v11 removeKVOBlockForToken:*(void *)(*((void *)&v20 + 1) + 8 * j)];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
            }
            while (v14);
          }
        }
        else
        {
          long long v12 = LogCategory_Unspecified();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v29 = v10;
            _os_log_error_impl(&dword_218714000, v12, OS_LOG_TYPE_ERROR, "Unable to remove KVO tokenSet [%@] because observedObject is nil!", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v17 = [(FMViewController *)self kvoObservationTokens];
  [v17 removeAllObjects];
}

- (void)addNotificationToken:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"FMViewController.m", 160, @"Invalid parameter not satisfying: %@", @"[[inToken class] respondsToSelector:@selector(isAnObserver:)]" object file lineNumber description];
  }
  uint64_t v6 = [(FMViewController *)self notificationTokens];

  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    [(FMViewController *)self setNotificationTokens:v7];
  }
  id v9 = [(FMViewController *)self notificationTokens];
  [v9 addObject:v5];
}

- (void)removeNotificationTokens
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v4 = [(FMViewController *)self notificationTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(FMViewController *)self notificationTokens];
  [v9 removeAllObjects];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  [(FMViewController *)&v2 viewDidLoad];
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  [(FMViewController *)&v2 awakeFromNib];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  [(FMViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  [(FMViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  [(FMViewController *)&v4 viewWillDisappear:a3];
  [(FMViewController *)self removeKVOObservationTokens];
  [(FMViewController *)self removeNotificationTokens];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  [(FMViewController *)&v4 viewDidDisappear:a3];
  [(FMViewController *)self removeKVOObservationTokens];
  [(FMViewController *)self removeNotificationTokens];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  [(FMViewController *)&v2 didReceiveMemoryWarning];
}

- (void)willMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  [(FMViewController *)&v3 willMoveToParentViewController:a3];
}

- (void)didMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  [(FMViewController *)&v3 didMoveToParentViewController:a3];
}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  [(FMViewController *)&v4 performSegueWithIdentifier:a3 sender:a4];
}

- (NSString)controllerNibName
{
  objc_super v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);
  if ([v3 hasSuffix:@"ViewController"])
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", @"ViewController"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Cannot derive nib name from class [%@]", objc_opt_class() format];
  }

  return (NSString *)v5;
}

- (id)actualNibNameForName:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    uint64_t v7 = @"_iPad";
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9)
    {
      long long v10 = 0;
      long long v11 = 0;
      id v12 = v3;
      goto LABEL_11;
    }
    uint64_t v7 = @"_iPhone";
  }
  id v13 = [v3 stringByAppendingString:v7];

  uint64_t v14 = [v4 pathForResource:v13 ofType:@"nib" inDirectory:0];
  if (v14)
  {
    long long v10 = (void *)v14;
    uint64_t v15 = 0;
LABEL_10:
    id v12 = v13;

    long long v11 = v12;
    goto LABEL_11;
  }
  id v12 = v3;

  long long v11 = [v4 pathForResource:v12 ofType:@"nib" inDirectory:0];
  long long v10 = v11;
  if (v11)
  {
    id v13 = v3;
    uint64_t v15 = v13;
    goto LABEL_10;
  }
LABEL_11:
  id v16 = v11;

  return v16;
}

- (NSMutableDictionary)kvoObservationTokens
{
  return self->_kvoObservationTokens;
}

- (void)setKvoObservationTokens:(id)a3
{
}

- (NSMutableSet)notificationTokens
{
  return self->_notificationTokens;
}

- (void)setNotificationTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_kvoObservationTokens, 0);
}

@end