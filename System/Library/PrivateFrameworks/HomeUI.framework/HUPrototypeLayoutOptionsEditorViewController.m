@interface HUPrototypeLayoutOptionsEditorViewController
- (HUGridLayoutOptions)layoutOptions;
- (HUPrototypeLayoutOptionsEditorViewControllerDelegate)delegate;
- (NSArray)layoutOptionsKeys;
- (id)_viewSizeSubclassDescription;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_done:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setLayoutOptionsKeys:(id)a3;
- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4;
- (void)viewDidLoad;
@end

@implementation HUPrototypeLayoutOptionsEditorViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HUPrototypeLayoutOptionsEditorViewController;
  [(HUPrototypeLayoutOptionsEditorViewController *)&v9 viewDidLoad];
  [(HUPrototypeLayoutOptionsEditorViewController *)self setLayoutOptionsKeys:&unk_1F19B5690];
  v3 = [(HUPrototypeLayoutOptionsEditorViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  v8 = [(HUPrototypeLayoutOptionsEditorViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];
}

- (void)_done:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(HUPrototypeLayoutOptionsEditorViewController *)self _viewSizeSubclassDescription];
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "----------- Start options for: %@ -----------", buf, 0xCu);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptionsKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = HFLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
          v14 = [v13 valueForKeyPath:v11];
          *(_DWORD *)buf = 138412546;
          v23 = v11;
          __int16 v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ = %@", buf, 0x16u);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(HUPrototypeLayoutOptionsEditorViewController *)self _viewSizeSubclassDescription];
    *(_DWORD *)buf = 138412290;
    v23 = v16;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "----------- End options for: %@ -----------", buf, 0xCu);
  }
  v17 = [(HUPrototypeLayoutOptionsEditorViewController *)self delegate];
  [v17 layoutOptionsEditorDidFinish:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptionsKeys];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptionsKeys];
  uint64_t v12 = [v6 section];

  v13 = [v11 objectAtIndexedSubscript:v12];

  [v10 setDelegate:self];
  [v10 setMinimumValue:0.0];
  char v14 = [&unk_1F19B56A8 containsObject:v13];
  double v15 = 1.0;
  if ((v14 & 1) == 0)
  {
    int v16 = objc_msgSend(v13, "isEqualToString:", @"overrideNumberOfColumns", 1.0);
    double v15 = 100.0;
    if (v16) {
      double v15 = 12.0;
    }
  }
  [v10 setMaximumValue:v15];
  v17 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
  long long v18 = [v17 valueForKeyPath:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 floatValue];
    double v20 = v19;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v20 = 0.0;
    if (isKindOfClass) {
      objc_msgSend(v18, "pointSize", 0.0);
    }
  }
  [v10 setValue:v20];

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptionsKeys];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (id)_viewSizeSubclassDescription
{
  v2 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
  unint64_t v3 = [v2 viewSizeSubclass];

  if (v3 > 0xA) {
    return @"unknown";
  }
  else {
    return off_1E6387B28[v3];
  }
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  id v6 = a3;
  id v7 = [(HUPrototypeLayoutOptionsEditorViewController *)self tableView];
  id v19 = [v7 indexPathForCell:v6];

  uint64_t v8 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptionsKeys];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));

  v10 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
  v11 = [v10 valueForKeyPath:v9];

  id v12 = v11;
  if ([v9 isEqualToString:@"overrideNumberOfColumns"])
  {
    if (floor(a4) == 0.0)
    {
      double v15 = 0;
      goto LABEL_11;
    }
    v13 = NSNumber;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      double v15 = v12;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v14 = [v12 fontWithSize:a4];
      goto LABEL_7;
    }
    v13 = NSNumber;
  }
  uint64_t v14 = [v13 numberWithDouble:a4];
LABEL_7:
  double v15 = (void *)v14;
LABEL_11:

LABEL_12:
  int v16 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
  [v16 setValue:v15 forKeyPath:v9];

  v17 = [(HUPrototypeLayoutOptionsEditorViewController *)self delegate];
  long long v18 = [(HUPrototypeLayoutOptionsEditorViewController *)self layoutOptions];
  [v17 layoutOptionsEditor:self didUpdateLayoutOptions:v18];
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (HUPrototypeLayoutOptionsEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPrototypeLayoutOptionsEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)layoutOptionsKeys
{
  return self->_layoutOptionsKeys;
}

- (void)setLayoutOptionsKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptionsKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end