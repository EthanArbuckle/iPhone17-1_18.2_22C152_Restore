@interface AKAttributePickerViewController
- (AKAttributePickerViewController)initWithController:(id)a3 selectedAnnotations:(id)a4;
- (AKAttributePickerViewControllerDelegate)delegate;
- (AKController)controller;
- (BOOL)_canShowWhileLocked;
- (NSArray)rowViews;
- (NSSet)selectedAnnotations;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_attributeStyleChanged:(id)a3;
- (void)_lineAttributesChanged:(id)a3;
- (void)_updatePreferredContentSize;
- (void)revalidateItems;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRowViews:(id)a3;
- (void)setSelectedAnnotations:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateLayoutForSelectedAnnotations;
- (void)viewDidLoad;
@end

@implementation AKAttributePickerViewController

- (AKAttributePickerViewController)initWithController:(id)a3 selectedAnnotations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAttributePickerViewController;
  v8 = [(AKAttributePickerViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AKAttributePickerViewController *)v8 setController:v6];
    [(AKAttributePickerViewController *)v9 setSelectedAnnotations:v7];
  }

  return v9;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)AKAttributePickerViewController;
  [(AKAttributePickerViewController *)&v19 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKAttributePickerViewController *)self setTableView:v4];

  v5 = [(AKAttributePickerViewController *)self tableView];
  [v5 setSeparatorStyle:0];

  id v6 = [(AKAttributePickerViewController *)self tableView];
  [v6 setAllowsSelection:0];

  double v7 = *MEMORY[0x263F1D1C0];
  double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  objc_super v11 = [(AKAttributePickerViewController *)self tableView];
  objc_msgSend(v11, "setSeparatorInset:", v7, v8, v9, v10);

  v12 = [(AKAttributePickerViewController *)self tableView];
  [v12 setAlwaysBounceVertical:0];

  v13 = [(AKAttributePickerViewController *)self tableView];
  [v13 setAlwaysBounceHorizontal:0];

  v14 = [(AKAttributePickerViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"identifier"];

  v15 = [(AKAttributePickerViewController *)self tableView];
  [v15 setDelegate:self];

  v16 = [(AKAttributePickerViewController *)self tableView];
  [v16 setDataSource:self];

  v17 = [(AKAttributePickerViewController *)self view];
  v18 = [(AKAttributePickerViewController *)self tableView];
  objc_msgSend(v17, "ak_addSubview:withEdgeInsets:", v18, v7, v8, v9, v10);

  [(AKAttributePickerViewController *)self updateLayoutForSelectedAnnotations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSelectedAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAnnotations, a3);
  v4 = [(AKAttributePickerViewController *)self viewIfLoaded];

  if (v4)
  {
    [(AKAttributePickerViewController *)self updateLayoutForSelectedAnnotations];
  }
}

- (void)updateLayoutForSelectedAnnotations
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(AKAttributePickerViewController *)self selectedAnnotations];
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    int v24 = 0;
    char v4 = 0;
    char v5 = 0;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        char v7 = objc_opt_respondsToSelector();
        char v8 = objc_opt_respondsToSelector();
        if (objc_opt_respondsToSelector())
        {
          objc_opt_class();
          v24 |= objc_opt_isKindOfClass() ^ 1;
        }
        v5 |= v7;
        v4 |= v8;
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v3);
  }
  else
  {
    LOBYTE(v24) = 0;
    char v4 = 0;
    char v5 = 0;
  }

  double v9 = [(AKAttributePickerViewController *)self controller];
  if (v24)
  {
    double v10 = [AKLineStylePicker alloc];
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    v15 = -[AKLineStylePicker initWithFrame:lineType:controller:](v10, "initWithFrame:lineType:controller:", 0, v9, *MEMORY[0x263F001A8], v12, v13, v14);
    [(AKLineStylePicker *)v15 setTag:1000];
    [(AKLineStylePicker *)v15 addTarget:self action:sel__lineAttributesChanged_ forControlEvents:4096];
    v16 = -[AKLineStylePicker initWithFrame:lineType:controller:]([AKLineStylePicker alloc], "initWithFrame:lineType:controller:", 1, v9, v11, v12, v13, v14);
    [(AKLineStylePicker *)v16 setTag:1000];
    [(AKLineStylePicker *)v16 addTarget:self action:sel__lineAttributesChanged_ forControlEvents:4096];
    v17 = -[AKLineStylePicker initWithFrame:lineType:controller:]([AKLineStylePicker alloc], "initWithFrame:lineType:controller:", 2, v9, v11, v12, v13, v14);
    [(AKLineStylePicker *)v17 setTag:1000];
    [(AKLineStylePicker *)v17 addTarget:self action:sel__lineAttributesChanged_ forControlEvents:4096];
    v30[0] = v15;
    v30[1] = v16;
    v30[2] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    [(AKAttributePickerViewController *)self setRowViews:v18];

LABEL_16:
    goto LABEL_17;
  }
  if (v5)
  {
    objc_super v19 = [AKFillableShapeStylePicker alloc];
    v15 = -[AKFillableShapeStylePicker initWithFrame:controller:](v19, "initWithFrame:controller:", v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AKLineStylePicker *)v15 setTag:1000];
    [(AKLineStylePicker *)v15 setShowFill:v4 & 1];
    [(AKLineStylePicker *)v15 addTarget:self action:sel__attributeStyleChanged_ forControlEvents:4096];
    v29 = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [(AKAttributePickerViewController *)self setRowViews:v16];
    goto LABEL_16;
  }
LABEL_17:
  v20 = [(AKAttributePickerViewController *)self tableView];
  [v20 reloadData];

  [(AKAttributePickerViewController *)self revalidateItems];
  [(AKAttributePickerViewController *)self _updatePreferredContentSize];
}

- (void)_updatePreferredContentSize
{
  uint64_t v3 = [(AKAttributePickerViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v21);

  char v5 = [(AKAttributePickerViewController *)self rowViews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    double v8 = *MEMORY[0x263F1D490];
    double v9 = *(double *)(MEMORY[0x263F1D490] + 8);
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      double v12 = [(AKAttributePickerViewController *)self tableView];
      double v13 = [MEMORY[0x263F088C8] indexPathForRow:v7 inSection:0];
      double v14 = [v12 cellForRowAtIndexPath:v13];

      objc_msgSend(v14, "systemLayoutSizeFittingSize:", v8, v9);
      if (v15 > v11) {
        double v11 = v15;
      }
      if (v16 > v10) {
        double v10 = v16;
      }

      ++v7;
      v17 = [(AKAttributePickerViewController *)self rowViews];
      unint64_t v18 = [v17 count];
    }
    while (v7 < v18);
  }
  else
  {
    double v11 = 0.0;
    double v10 = 0.0;
  }
  if (v11 > 0.0) {
    double Width = v11;
  }
  id v19 = [(AKAttributePickerViewController *)self rowViews];
  -[AKAttributePickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v10 * (double)(unint64_t)[v19 count]);
}

- (void)_attributeStyleChanged:(id)a3
{
  uint64_t v4 = [a3 currentTag];
  uint64_t v5 = [(AKAttributePickerViewController *)self delegate];
  if (v4 != 763000)
  {
    uint64_t v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 attributePicker:self didSelectToolWithTag:v4 attributeTag:763000];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)_lineAttributesChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentTag];
  uint64_t v6 = [v4 lineStyle];

  uint64_t v7 = [(AKAttributePickerViewController *)self delegate];
  if (v5 != 763000)
  {
    double v8 = (void *)v7;
    if (objc_opt_respondsToSelector()) {
      [v8 attributePicker:self didSelectToolWithTag:v5 attributeTag:v6];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)revalidateItems
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AKAttributePickerViewController *)self controller];
  id v4 = [v3 currentPageController];
  uint64_t v5 = [v4 pageModelController];

  uint64_t v6 = [v5 selectedAnnotations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(AKAttributePickerViewController *)self rowViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) revalidateItems:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(AKAttributePickerViewController *)self rowViews];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"identifier" forIndexPath:v6];
  uint64_t v8 = [v7 contentView];
  uint64_t v9 = [v8 viewWithTag:1000];

  uint64_t v10 = [(AKAttributePickerViewController *)self rowViews];
  uint64_t v11 = [v6 row];

  long long v12 = [v10 objectAtIndexedSubscript:v11];

  if (v9) {
    [v9 removeFromSuperview];
  }
  long long v13 = [v7 contentView];
  objc_msgSend(v13, "ak_addSubview:withEdgeInsets:", v12, 0.0, 12.0, 0.0, -12.0);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a3;
  uint64_t v8 = [a5 row];
  uint64_t v9 = [v7 numberOfRowsInSection:0];

  if (v8 < v9 - 1) {
    [v10 setSeparatorStyle:1];
  }
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKAttributePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAttributePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)selectedAnnotations
{
  return self->_selectedAnnotations;
}

- (UITableView)tableView
{
  return (UITableView *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setTableView:(id)a3
{
}

- (NSArray)rowViews
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setRowViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedAnnotations, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_controller);
}

@end