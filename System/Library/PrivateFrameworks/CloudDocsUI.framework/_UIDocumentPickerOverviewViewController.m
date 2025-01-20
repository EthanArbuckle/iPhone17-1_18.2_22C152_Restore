@interface _UIDocumentPickerOverviewViewController
- (BOOL)manage;
- (NSArray)allPickers;
- (NSArray)auxiliaryOptions;
- (NSArray)fileTypes;
- (_UIDocumentPickerOverviewDelegate)delegate;
- (_UIDocumentPickerOverviewViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4 auxiliaryOptions:(id)a5 includeManagementItem:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)setAllPickers:(id)a3;
- (void)setAuxiliaryOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileTypes:(id)a3;
- (void)setManage:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContents;
- (void)updatePreferredContentSize;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIDocumentPickerOverviewViewController

- (_UIDocumentPickerOverviewViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4 auxiliaryOptions:(id)a5 includeManagementItem:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UIDocumentPickerOverviewViewController;
  v12 = [(_UIContainerHuggingTableViewController *)&v26 initWithStyle:0];
  v13 = v12;
  if (v12)
  {
    [(_UIDocumentPickerOverviewViewController *)v12 setMode:a4];
    [(_UIDocumentPickerOverviewViewController *)v13 setAuxiliaryOptions:v11];
    [(_UIDocumentPickerOverviewViewController *)v13 setFileTypes:v10];
    [(_UIDocumentPickerOverviewViewController *)v13 setManage:v6];
    v14 = [(_UIDocumentPickerOverviewViewController *)v13 tableView];
    [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"com.apple.UIKit.fileprovider.default"];

    double v15 = *MEMORY[0x263F1D1C0];
    double v16 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v17 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v18 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    v19 = [(_UIDocumentPickerOverviewViewController *)v13 tableView];
    objc_msgSend(v19, "setSeparatorInset:", v15, v16, v17, v18);

    v20 = [(_UIDocumentPickerOverviewViewController *)v13 tableView];
    [v20 setAlwaysBounceVertical:0];

    double v21 = *MEMORY[0x263F1D600];
    v22 = [(_UIDocumentPickerOverviewViewController *)v13 tableView];
    [v22 setRowHeight:v21];

    v23 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v13 action:sel__doneButtonPressed];
    v24 = [(_UIDocumentPickerOverviewViewController *)v13 navigationItem];
    [v24 setRightBarButtonItem:v23];

    [(_UIDocumentPickerOverviewViewController *)v13 updateContents];
  }

  return v13;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerOverviewViewController;
  id v4 = a3;
  [(_UIDocumentPickerOverviewViewController *)&v11 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  double v6 = v5;

  v7 = [(_UIDocumentPickerOverviewViewController *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 >= 2.22044605e-16)
  {
    id v10 = [(_UIDocumentPickerOverviewViewController *)self tableView];
    [v10 reloadData];
  }
}

- (void)updateContents
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1CC70]);
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v5 = [v4 localizedStringForKey:@"Browse" value:@"Browse" table:@"Localizable"];
  [v3 setTitle:v5];

  double v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  double v8 = [(_UIDocumentPickerOverviewViewController *)self traitCollection];
  double v9 = [v6 imageNamed:@"UIDocumentPicker-more" inBundle:v7 compatibleWithTraitCollection:v8];
  [v3 setImage:v9];

  [v3 setIdentifier:@"__UIDocumentPickerBrowseIdentifier"];
  [v3 setNewlyAdded:0];
  id v10 = [MEMORY[0x263EFF980] arrayWithObject:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_super v11 = [(_UIDocumentPickerOverviewViewController *)self auxiliaryOptions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v16 order]) {
          [v10 addObject:v16];
        }
        else {
          [v10 insertObject:v16 atIndex:0];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  double v17 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  char v18 = [v17 isEqualToArray:v10];

  if ((v18 & 1) == 0)
  {
    [(_UIDocumentPickerOverviewViewController *)self setAllPickers:v10];
    [(_UIDocumentPickerOverviewViewController *)self updatePreferredContentSize];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UIDocumentPickerOverviewViewController *)self navigationController];
  [v5 setNavigationBarHidden:1];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerOverviewViewController_viewWillAppear___block_invoke;
  v7[3] = &unk_26492CC78;
  v7[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v7];
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerOverviewViewController;
  [(_UIDocumentPickerOverviewViewController *)&v6 viewWillAppear:v3];
}

- (void)updatePreferredContentSize
{
  v35[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  [v3 reloadData];

  id v4 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  [v4 setNeedsLayout];

  double v5 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  [v5 layoutSubviews];

  objc_super v6 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  unint64_t v7 = [v6 count];

  if (v7 >= 8) {
    unint64_t v8 = 8;
  }
  else {
    unint64_t v8 = v7;
  }
  double v9 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  BOOL v10 = (unint64_t)[v9 count] > 8;
  objc_super v11 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  [v11 setShowsVerticalScrollIndicator:v10];

  uint64_t v12 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  objc_msgSend(v12, "setScrollIndicatorInsets:", 10.0, 0.0, 10.0, 0.0);

  uint64_t v13 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  uint64_t v14 = [v13 visibleCells];
  double v15 = [v14 firstObject];

  [v15 size];
  objc_msgSend(v15, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v17 = v16;
  char v18 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  unint64_t v19 = [v18 count];

  if (v19 <= v8)
  {
    long long v21 = [v15 textLabel];
    long long v22 = [v21 font];

    if (v8)
    {
      uint64_t v23 = 0;
      uint64_t v24 = *MEMORY[0x263F1C238];
      double v25 = 0.0;
      do
      {
        objc_super v26 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
        v27 = [v26 objectAtIndex:v23];

        v28 = [v27 title];
        uint64_t v34 = v24;
        v35[0] = v22;
        v29 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
        objc_msgSend(v28, "boundingRectWithSize:options:attributes:context:", 1, v29, 0, 500.0, v17);
        double v31 = v30;

        if (v25 < v31) {
          double v25 = v31;
        }

        ++v23;
      }
      while (v8 != v23);
      double v32 = v25 + 92.0;
    }
    else
    {
      double v32 = 92.0;
    }
    double v20 = ceil(v32);
  }
  else
  {
    double v20 = 320.0;
  }
  -[_UIDocumentPickerOverviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v20, v17 * (double)v8);
  v33 = [(_UIDocumentPickerOverviewViewController *)self tableView];
  [v33 setEstimatedRowHeight:v17];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentPickerOverviewViewController;
  -[_UIDocumentPickerOverviewViewController setPreferredContentSize:](&v10, sel_setPreferredContentSize_);
  objc_super v6 = [(_UIDocumentPickerOverviewViewController *)self parentViewController];
  if ([v6 conformsToProtocol:&unk_26E06CD38])
  {
    [v6 preferredContentSize];
    if (v8 != width || v7 != height) {
      objc_msgSend(v6, "setPreferredContentSize:", width, height);
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"com.apple.UIKit.fileprovider.default" forIndexPath:v6];
  double v8 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  uint64_t v9 = [v6 row];

  objc_super v10 = [v8 objectAtIndex:v9];

  id v11 = v10;
  uint64_t v12 = [v11 image];
  uint64_t v13 = [v12 imageWithRenderingMode:2];
  uint64_t v14 = [v7 iconView];
  [v14 setImage:v13];

  double v15 = [v11 title];
  double v16 = [v7 textLabel];
  [v16 setText:v15];

  uint64_t v17 = [v11 isNewlyAdded];
  [v7 setShowNewlyAdded:v17];
  objc_msgSend(v7, "setSeparatorInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  int64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0000999999975;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIDocumentPickerOverviewViewController *)self allPickers];
  uint64_t v7 = [v5 row];

  id v11 = [v6 objectAtIndex:v7];

  double v8 = [v11 identifier];

  uint64_t v9 = [(_UIDocumentPickerOverviewViewController *)self delegate];
  objc_super v10 = [v11 identifier];
  if (v8 == @"__UIDocumentPickerBrowseIdentifier") {
    [v9 overviewController:self selectedDocumentPickerWithIdentifier:v10];
  }
  else {
    [v9 overviewController:self selectedAuxiliaryOptionWithIdentifier:v10];
  }
}

- (_UIDocumentPickerOverviewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIDocumentPickerOverviewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)allPickers
{
  return self->_allPickers;
}

- (void)setAllPickers:(id)a3
{
}

- (NSArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)setAuxiliaryOptions:(id)a3
{
}

- (NSArray)fileTypes
{
  return self->_fileTypes;
}

- (void)setFileTypes:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)manage
{
  return self->_manage;
}

- (void)setManage:(BOOL)a3
{
  self->_manage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_storeStrong((id *)&self->_allPickers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end