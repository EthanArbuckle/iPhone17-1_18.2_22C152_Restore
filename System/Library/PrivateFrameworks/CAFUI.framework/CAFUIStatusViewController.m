@interface CAFUIStatusViewController
+ (id)sharedInstance;
- (CAFCar)car;
- (CAFCarManager)carManager;
- (CAFUIStatusTableView)tableView;
- (NSMutableArray)pendingMessages;
- (UITextView)textView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appendStringWithFormat:(id)a3;
- (void)carDidUpdate:(id)a3 accessory:(id)a4 service:(id)a5 characteristic:(id)a6;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)loadView;
- (void)setCar:(id)a3;
- (void)setCarManager:(id)a3;
- (void)setPendingMessages:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation CAFUIStatusViewController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __43__CAFUIStatusViewController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(CAFUIStatusViewController);

  return MEMORY[0x270F9A758]();
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(CAFUIStatusViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v70[8] = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)CAFUIStatusViewController;
  [(CAFUIStatusViewController *)&v68 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F82D60]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setEditable:0];
  v9 = [MEMORY[0x263F825C8] systemGreenColor];
  [v8 setTextColor:v9];

  v10 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
  [v8 setFont:v10];

  objc_msgSend(v8, "setTextContainerInset:", 8.0, 8.0, 8.0, 8.0);
  v11 = [v8 layoutManager];
  [v11 setAllowsNonContiguousLayout:0];

  v12 = [(CAFUIStatusViewController *)self view];
  [v12 addSubview:v8];

  [(CAFUIStatusViewController *)self setTextView:v8];
  v13 = -[CAFUIStatusTableView initWithFrame:]([CAFUIStatusTableView alloc], "initWithFrame:", v4, v5, v6, v7);
  [(CAFUIStatusTableView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v14 = objc_opt_class();
  v15 = +[CAFUIStatusTableCell identifier];
  [(CAFUIStatusTableView *)v13 registerClass:v14 forCellReuseIdentifier:v15];

  [(CAFUIStatusTableView *)v13 setDataSource:self];
  [(CAFUIStatusTableView *)v13 setDelegate:self];
  [(CAFUIStatusTableView *)v13 setAllowsSelection:0];
  -[CAFUIStatusTableView setContentInset:](v13, "setContentInset:", 4.0, 0.0, 4.0, 0.0);
  v16 = [(CAFUIStatusViewController *)self view];
  [v16 addSubview:v13];

  [(CAFUIStatusViewController *)self setTableView:v13];
  v45 = (void *)MEMORY[0x263F08938];
  v60 = [v8 topAnchor];
  v61 = [(CAFUIStatusViewController *)self view];
  v59 = [v61 safeAreaLayoutGuide];
  v58 = [v59 topAnchor];
  v57 = [v60 constraintEqualToAnchor:v58];
  v70[0] = v57;
  v55 = [v8 bottomAnchor];
  v56 = [(CAFUIStatusViewController *)self view];
  v54 = [v56 safeAreaLayoutGuide];
  v53 = [v54 bottomAnchor];
  v52 = [v55 constraintEqualToAnchor:v53];
  v70[1] = v52;
  v50 = [v8 leadingAnchor];
  v51 = [(CAFUIStatusViewController *)self view];
  v49 = [v51 safeAreaLayoutGuide];
  v48 = [v49 leadingAnchor];
  v47 = [v50 constraintEqualToAnchor:v48];
  v70[2] = v47;
  v44 = [v8 widthAnchor];
  v46 = [(CAFUIStatusViewController *)self view];
  v43 = [v46 safeAreaLayoutGuide];
  v42 = [v43 widthAnchor];
  v41 = [v44 constraintEqualToAnchor:v42 multiplier:0.67];
  v70[3] = v41;
  v39 = [(CAFUIStatusTableView *)v13 topAnchor];
  v40 = [(CAFUIStatusViewController *)self view];
  v38 = [v40 safeAreaLayoutGuide];
  v37 = [v38 topAnchor];
  v36 = [v39 constraintEqualToAnchor:v37];
  v70[4] = v36;
  v34 = [(CAFUIStatusTableView *)v13 bottomAnchor];
  v35 = [(CAFUIStatusViewController *)self view];
  v33 = [v35 safeAreaLayoutGuide];
  v32 = [v33 bottomAnchor];
  v31 = [v34 constraintEqualToAnchor:v32];
  v70[5] = v31;
  v17 = [(CAFUIStatusTableView *)v13 leadingAnchor];
  v63 = v8;
  v18 = [v8 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v70[6] = v19;
  v62 = v13;
  v20 = [(CAFUIStatusTableView *)v13 trailingAnchor];
  v21 = [(CAFUIStatusViewController *)self view];
  v22 = [v21 safeAreaLayoutGuide];
  v23 = [v22 trailingAnchor];
  v24 = [v20 constraintEqualToAnchor:v23];
  v70[7] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:8];
  [v45 activateConstraints:v25];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v26 = [(CAFUIStatusViewController *)self pendingMessages];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v65 != v29) {
          objc_enumerationMutation(v26);
        }
        [(CAFUIStatusViewController *)self appendStringWithFormat:*(void *)(*((void *)&v64 + 1) + 8 * i)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v28);
  }

  [(CAFUIStatusViewController *)self setPendingMessages:0];
}

- (void)appendStringWithFormat:(id)a3
{
  v10 = &v11;
  double v4 = (objc_class *)NSString;
  id v5 = a3;
  double v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v11];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CAFUIStatusViewController_appendStringWithFormat___block_invoke;
  block[3] = &unk_26525C738;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__CAFUIStatusViewController_appendStringWithFormat___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textView];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    double v4 = [v3 textView];
    id v5 = [*(id *)(a1 + 40) stringByAppendingString:@"\n"];
    [v4 insertText:v5];

    double v6 = [*(id *)(a1 + 32) textView];
    id v7 = [v6 text];
    uint64_t v8 = [v7 length] - 1;

    id v11 = [*(id *)(a1 + 32) textView];
    objc_msgSend(v11, "scrollRangeToVisible:", v8, 1);
  }
  else
  {
    id v9 = [v3 pendingMessages];

    if (!v9)
    {
      v10 = objc_opt_new();
      [*(id *)(a1 + 32) setPendingMessages:v10];
    }
    id v11 = [*(id *)(a1 + 32) pendingMessages];
    [v11 addObject:*(void *)(a1 + 40)];
  }
}

- (void)setCarManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carManager);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_carManager);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_carManager);
      [v7 unregisterObserver:self];
    }
    id v8 = objc_storeWeak((id *)&self->_carManager, obj);
    [obj registerObserver:self];

    id v5 = obj;
  }
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CAFUIStatusLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CAFUIStatusViewController carManager:didUpdateCurrentCar:]";
    _os_log_impl(&dword_2494AC000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v7 = +[CAFUIStatusViewController sharedInstance];
  objc_msgSend(v7, "appendStringWithFormat:", @"%s", "-[CAFUIStatusViewController carManager:didUpdateCurrentCar:]");

  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  if (WeakRetained != v5)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_car);

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_car);
      [v10 unregisterObserver:self];
    }
    id v11 = objc_storeWeak((id *)&self->_car, v5);
    [v5 registerObserver:self];
  }
}

- (void)carDidUpdateAccessories:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = CAFUIStatusLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CAFUIStatusViewController carDidUpdateAccessories:]";
    _os_log_impl(&dword_2494AC000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  double v4 = +[CAFUIStatusViewController sharedInstance];
  objc_msgSend(v4, "appendStringWithFormat:", @"%s", "-[CAFUIStatusViewController carDidUpdateAccessories:]");
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CAFUIStatusLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CAFUIStatusViewController carDidUpdate:receivedAllValues:]";
    __int16 v16 = 1024;
    int v17 = [v5 receivedAllValues];
    _os_log_impl(&dword_2494AC000, v6, OS_LOG_TYPE_DEFAULT, "%s: %u", buf, 0x12u);
  }

  uint64_t v7 = +[CAFUIStatusViewController sharedInstance];
  objc_msgSend(v7, "appendStringWithFormat:", @"%s: %u", "-[CAFUIStatusViewController carDidUpdate:receivedAllValues:]", objc_msgSend(v5, "receivedAllValues"));

  if ([v5 receivedAllValues])
  {
    id v8 = CAFUIStatusLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 accessories];
      uint64_t v10 = [v9 count];
      *(_DWORD *)buf = 134217984;
      v15 = (const char *)v10;
      _os_log_impl(&dword_2494AC000, v8, OS_LOG_TYPE_DEFAULT, "✅ Car received all values with %lu accessories", buf, 0xCu);
    }
    id v11 = +[CAFUIStatusViewController sharedInstance];
    v12 = [v5 accessories];
    objc_msgSend(v11, "appendStringWithFormat:", @"✅ Car received all values with %lu accessories", objc_msgSend(v12, "count"));
  }
  v13 = [(CAFUIStatusViewController *)self tableView];
  [v13 update];
}

- (void)carDidUpdate:(id)a3 accessory:(id)a4 service:(id)a5 characteristic:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = CAFUIStatusLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 name];
    uint64_t v14 = [v10 name];
    v15 = [v11 name];
    __int16 v16 = [v11 value];
    *(_DWORD *)buf = 136316162;
    v24 = "-[CAFUIStatusViewController carDidUpdate:accessory:service:characteristic:]";
    __int16 v25 = 2112;
    v26 = v13;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    v30 = v15;
    __int16 v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_2494AC000, v12, OS_LOG_TYPE_DEFAULT, "%s\n\tAccessory: %@\n\tService: %@\n\tCharacteristic: %@\n\tValue: %@", buf, 0x34u);
  }
  int v17 = +[CAFUIStatusViewController sharedInstance];
  uint64_t v18 = [v9 name];
  v19 = [v10 name];
  v20 = [v11 name];
  v21 = [v11 value];
  [v17 appendStringWithFormat:@"%s\n\tAccessory: %@\n\tService: %@\n\tCharacteristic: %@\n\tValue: %@", "-[CAFUIStatusViewController carDidUpdate:accessory:service:characteristic:]", v18, v19, v20, v21];

  v22 = [(CAFUIStatusViewController *)self tableView];
  [v22 update];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(CAFUIStatusViewController *)self car];
  if ([v3 receivedAllValues]) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = 1;
  if (a4 && a4 != 2)
  {
    if (a4 == 1)
    {
      id v8 = [(CAFUIStatusViewController *)self car];
      id v9 = [v8 accessories];
      int64_t v7 = [v9 count];
    }
    else
    {
      int64_t v7 = 0;
    }
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CAFUIStatusTableCell identifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  id v10 = [v9 defaultContentConfiguration];
  if ([v6 section])
  {
    if ([v6 section] == 1)
    {
      id v11 = [(CAFUIStatusViewController *)self car];
      v12 = [v11 sortedAccessories];
      v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

      uint64_t v14 = [MEMORY[0x263F827E8] systemImageNamed:@"a.circle"];
      [v10 setImage:v14];

      if ([v13 receivedAllValues]) {
        [MEMORY[0x263F825C8] systemGreenColor];
      }
      else {
      v32 = [MEMORY[0x263F825C8] systemRedColor];
      }
      uint64_t v33 = [v10 imageProperties];
      [v33 setTintColor:v32];

      v34 = [v13 name];
      [v10 setText:v34];

      if ([v13 receivedAllValues]) {
        v35 = @"Yes";
      }
      else {
        v35 = @"No";
      }
      [v10 setSecondaryText:v35];
    }
    else
    {
      if ([v6 section] != 2) {
        goto LABEL_22;
      }
      v21 = [(CAFUIStatusViewController *)self car];
      v22 = [v21 accessories];
      uint64_t v23 = [v22 count];

      v24 = NSString;
      __int16 v25 = NSNumber;
      v13 = [(CAFUIStatusViewController *)self car];
      v26 = [v13 accessories];
      uint64_t v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
      uint64_t v28 = (void *)v27;
      __int16 v29 = @"accessories";
      if (v23 == 1) {
        __int16 v29 = @"accessory";
      }
      v30 = [v24 stringWithFormat:@"%@ %@", v27, v29];
      [v10 setText:v30];
    }
  }
  else
  {
    v15 = [(CAFUIStatusViewController *)self car];
    int v16 = [v15 receivedAllValues];

    if (v16) {
      int v17 = @"checkmark.square";
    }
    else {
      int v17 = @"xmark.square";
    }
    uint64_t v18 = [MEMORY[0x263F827E8] systemImageNamed:v17];
    [v10 setImage:v18];

    if (v16)
    {
      v19 = [MEMORY[0x263F825C8] systemGreenColor];
      v20 = @"ready";
    }
    else
    {
      v19 = [MEMORY[0x263F825C8] systemRedColor];
      v20 = @"not ready";
    }
    __int16 v31 = [v10 imageProperties];
    [v31 setTintColor:v19];

    v13 = [NSString stringWithFormat:@"Car %@", v20];
    [v10 setText:v13];
  }

LABEL_22:
  v36 = [v10 imageProperties];
  objc_msgSend(v36, "setMaximumSize:", 12.0, 12.0);

  v37 = [v10 imageProperties];
  objc_msgSend(v37, "setReservedLayoutSize:", 12.0, 12.0);

  v38 = [MEMORY[0x263F81708] systemFontOfSize:9.0];
  v39 = [v10 textProperties];
  [v39 setFont:v38];

  v40 = [MEMORY[0x263F81708] systemFontOfSize:9.0];
  v41 = [v10 secondaryTextProperties];
  [v41 setFont:v40];

  [v10 setImageToTextPadding:6.0];
  [v10 setTextToSecondaryTextHorizontalPadding:0.0];
  [v10 setTextToSecondaryTextVerticalPadding:0.0];
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 2.0, 2.0, 3.0, 2.0);
  [v9 setContentConfiguration:v10];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "section", a3);
  double result = 18.0;
  if (v4 == 1) {
    return 25.0;
  }
  return result;
}

- (CAFCarManager)carManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carManager);

  return (CAFCarManager *)WeakRetained;
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (CAFUIStatusTableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (CAFUIStatusTableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (CAFCar)car
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);

  return (CAFCar *)WeakRetained;
}

- (void)setCar:(id)a3
{
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_destroyWeak((id *)&self->_car);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_textView);

  objc_destroyWeak((id *)&self->_carManager);
}

@end