@interface AKToolsListViewController
+ (id)defaultCellItemTypes;
- (AKToolsListViewController)initWithCoder:(id)a3;
- (AKToolsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKToolsListViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)isDeviceLocked;
- (BOOL)supportsImageDescriptionEditing;
- (BOOL)supportsOpacityEditing;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)cellItemTypes;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_buttonViewForImageDescription;
- (id)_buttonViewForLoupe;
- (id)_buttonViewForOpacity;
- (id)_buttonViewForShapes;
- (id)_buttonViewForSignature;
- (id)_buttonViewForText;
- (id)_buttonViewWithImage:(id)a3 title:(id)a4 tintColor:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_shapesCellIndexRow;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadCellItemTypes;
- (void)_shapeButtonPressed:(id)a3;
- (void)_updateDeviceLocked;
- (void)addRowView:(id)a3 toCellView:(id)a4;
- (void)setCellItemTypes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setSupportsImageDescriptionEditing:(BOOL)a3;
- (void)setSupportsOpacityEditing:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKToolsListViewController

+ (id)defaultCellItemTypes
{
  return &unk_26EA75C50;
}

- (AKToolsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AKToolsListViewController;
  v4 = [(AKToolsListViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    [(AKToolsListViewController *)v6 _updateDeviceLocked];
    [(AKToolsListViewController *)v6 _reloadCellItemTypes];
  }
  return v5;
}

- (AKToolsListViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AKToolsListViewController;
  v3 = [(AKToolsListViewController *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    [(AKToolsListViewController *)v5 _updateDeviceLocked];
    [(AKToolsListViewController *)v5 _reloadCellItemTypes];
  }
  return v4;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)AKToolsListViewController;
  [(AKToolsListViewController *)&v24 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKToolsListViewController *)self setTableView:v4];

  v5 = [(AKToolsListViewController *)self tableView];
  [v5 setDelegate:self];

  v6 = [(AKToolsListViewController *)self tableView];
  [v6 setDataSource:self];

  double v7 = *MEMORY[0x263F1D1C0];
  double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  v11 = [(AKToolsListViewController *)self tableView];
  objc_msgSend(v11, "setSeparatorInset:", v7, v8, v9, v10);

  v12 = [(AKToolsListViewController *)self tableView];
  [v12 setSeparatorStyle:0];

  v13 = [(AKToolsListViewController *)self tableView];
  [v13 setAlwaysBounceVertical:0];

  v14 = [(AKToolsListViewController *)self tableView];
  [v14 setAlwaysBounceHorizontal:0];

  v15 = [(AKToolsListViewController *)self tableView];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKImageDescriptionRowIdentifier"];

  v16 = [(AKToolsListViewController *)self tableView];
  [v16 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKTextRowIdentifier"];

  v17 = [(AKToolsListViewController *)self tableView];
  [v17 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKLoupeRowIdentifier"];

  v18 = [(AKToolsListViewController *)self tableView];
  [v18 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKSignatureRowIdentifier"];

  v19 = [(AKToolsListViewController *)self tableView];
  [v19 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKShapesRowIdentifier"];

  v20 = [(AKToolsListViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"AKOpacityRowIdentifier"];

  v21 = [(AKToolsListViewController *)self tableView];
  [v21 setAccessibilityIdentifier:@"shapes-picker-popover"];

  v22 = [(AKToolsListViewController *)self view];
  v23 = [(AKToolsListViewController *)self tableView];
  objc_msgSend(v22, "ak_addSubview:withEdgeInsets:", v23, v7, v8, v9, v10);
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AKToolsListViewController;
  [(AKToolsListViewController *)&v10 viewWillAppear:a3];
  v4 = [(AKToolsListViewController *)self tableView];
  [v4 layoutIfNeeded];

  v5 = [(AKToolsListViewController *)self tableView];
  [v5 contentSize];
  double v7 = v6;

  double v8 = [(AKToolsListViewController *)self _buttonViewForShapes];
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  -[AKToolsListViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9 + 24.0, v7);
}

- (void)_updateDeviceLocked
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v3 = (unsigned int (*)(void))off_268925158;
  double v9 = off_268925158;
  if (!off_268925158)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_23764DFC0;
    v5[3] = &unk_264CDB2A8;
    v5[4] = &v6;
    sub_23764DFC0((uint64_t)v5);
    id v3 = (unsigned int (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v4 = (_Unwind_Exception *)sub_2376DA278();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  self->_isDeviceLocked = v3(0) - 1 < 2;
}

- (void)_shapeButtonPressed:(id)a3
{
  uint64_t v4 = [a3 currentTag];
  uint64_t v5 = [(AKToolsListViewController *)self delegate];
  if (v4 != 763000)
  {
    uint64_t v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 toolsList:self didSelectToolWithTag:v4];
    }
  }

  MEMORY[0x270F9A790]();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v14 = [(AKToolsListViewController *)self delegate];
  double v7 = [(AKToolsListViewController *)self cellItemTypes];
  uint64_t v8 = [v6 row];

  double v9 = [v7 objectAtIndex:v8];
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 0:
      v11 = v14;
      v12 = self;
      uint64_t v13 = 764014;
      goto LABEL_8;
    case 1:
      uint64_t v13 = 764019;
      goto LABEL_7;
    case 2:
      uint64_t v13 = 764020;
      goto LABEL_7;
    case 4:
      [v14 toolsListDidSelectOpacityItem:self];
      break;
    case 5:
      uint64_t v13 = 764066;
LABEL_7:
      v11 = v14;
      v12 = self;
LABEL_8:
      [v11 toolsList:v12 didSelectToolWithTag:v13];
      break;
    default:
      break;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(AKToolsListViewController *)self cellItemTypes];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKToolsListViewController *)self cellItemTypes];
  double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 0:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKTextRowIdentifier" forIndexPath:v7];
      [v11 setAccessibilityIdentifier:@"text-cell"];
      v12 = [v11 contentView];
      uint64_t v13 = [v12 viewWithTag:1000];

      if (!v13)
      {
        uint64_t v14 = [(AKToolsListViewController *)self _buttonViewForText];
        goto LABEL_15;
      }
      break;
    case 1:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKSignatureRowIdentifier"];
      [v11 setAccessibilityIdentifier:@"signature-cell"];
      v15 = [v11 contentView];
      v16 = [v15 viewWithTag:1000];

      if (!v16)
      {
        uint64_t v14 = [(AKToolsListViewController *)self _buttonViewForSignature];
        goto LABEL_15;
      }
      break;
    case 2:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKLoupeRowIdentifier"];
      [v11 setAccessibilityIdentifier:@"magnifier-cell"];
      v17 = [v11 contentView];
      v18 = [v17 viewWithTag:1000];

      if (!v18)
      {
        uint64_t v14 = [(AKToolsListViewController *)self _buttonViewForLoupe];
        goto LABEL_15;
      }
      break;
    case 3:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKShapesRowIdentifier"];
      [v11 setAccessibilityIdentifier:@"shapes-cell"];
      v19 = [v11 contentView];
      v20 = [v19 viewWithTag:1000];

      if (!v20)
      {
        v21 = [(AKToolsListViewController *)self _buttonViewForShapes];
        [v11 setSeparatorStyle:0];
        goto LABEL_16;
      }
      break;
    case 4:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKOpacityRowIdentifier"];
      [v11 setAccessibilityIdentifier:@"opacity-cell"];
      v22 = [MEMORY[0x263F1C550] _labelColor];
      [v11 setTintColor:v22];

      v23 = [v11 contentView];
      objc_super v24 = [v23 viewWithTag:1000];

      if (!v24)
      {
        uint64_t v14 = [(AKToolsListViewController *)self _buttonViewForOpacity];
        goto LABEL_15;
      }
      break;
    case 5:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"AKImageDescriptionRowIdentifier" forIndexPath:v7];
      [v11 setAccessibilityIdentifier:@"image-description-cell"];
      v25 = [v11 contentView];
      v26 = [v25 viewWithTag:1000];

      if (!v26)
      {
        uint64_t v14 = [(AKToolsListViewController *)self _buttonViewForImageDescription];
LABEL_15:
        v21 = (void *)v14;
LABEL_16:
        v27 = [v11 contentView];
        [(AKToolsListViewController *)self addRowView:v21 toCellView:v27];
      }
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
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

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  int64_t v6 = [(AKToolsListViewController *)self _shapesCellIndexRow];
  double result = 36.0;
  if (v5 == v6) {
    return 44.0;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  return v5 != [(AKToolsListViewController *)self _shapesCellIndexRow];
}

- (id)_buttonViewForImageDescription
{
  id v3 = sub_23764D640(@"quote.bubble");
  uint64_t v4 = +[AKController akBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Description" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

  int64_t v6 = [MEMORY[0x263F1C550] labelColor];
  id v7 = [(AKToolsListViewController *)self _buttonViewWithImage:v3 title:v5 tintColor:v6];

  return v7;
}

- (id)_buttonViewForText
{
  id v3 = sub_23764D640(@"textbox");
  uint64_t v4 = +[AKController akBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Text" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

  int64_t v6 = [MEMORY[0x263F1C550] labelColor];
  id v7 = [(AKToolsListViewController *)self _buttonViewWithImage:v3 title:v5 tintColor:v6];

  return v7;
}

- (id)_buttonViewForSignature
{
  id v3 = sub_23764D640(@"signature");
  uint64_t v4 = +[AKController akBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Signature" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

  int64_t v6 = [MEMORY[0x263F1C550] labelColor];
  id v7 = [(AKToolsListViewController *)self _buttonViewWithImage:v3 title:v5 tintColor:v6];

  return v7;
}

- (id)_buttonViewForLoupe
{
  id v3 = sub_23764D640(@"a.magnify");
  uint64_t v4 = +[AKController akBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Magnifier" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

  int64_t v6 = [MEMORY[0x263F1C550] labelColor];
  id v7 = [(AKToolsListViewController *)self _buttonViewWithImage:v3 title:v5 tintColor:v6];

  return v7;
}

- (id)_buttonViewForShapes
{
  id v3 = [AKShapesPicker alloc];
  uint64_t v4 = -[AKShapesPicker initWithFrame:shapeTags:](v3, "initWithFrame:shapeTags:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKShapesPicker *)v4 addTarget:self action:sel__shapeButtonPressed_ forControlEvents:4096];

  return v4;
}

- (id)_buttonViewForOpacity
{
  id v3 = sub_23764D640(@"square.and.line.vertical.and.square.fill");
  uint64_t v4 = [v3 imageWithRenderingMode:2];

  uint64_t v5 = +[AKController akBundle];
  int64_t v6 = [v5 localizedStringForKey:@"Opacity" value:&stru_26EA57918 table:@"AKToolbarViewController_iOS"];

  id v7 = [(AKToolsListViewController *)self _buttonViewWithImage:v4 title:v6 tintColor:0];

  return v7;
}

- (void)addRowView:(id)a3 toCellView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTag:1000];
  objc_msgSend(v5, "ak_addSubview:withEdgeInsets:", v6, 0.0, 12.0, 0.0, -12.0);
}

- (id)_buttonViewWithImage:(id)a3 title:(id)a4 tintColor:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v7 = (objc_class *)MEMORY[0x263F1C6D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithImage:v10];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setContentMode:4];
  [v11 setTintColor:v8];

  LODWORD(v12) = 1144750080;
  [v11 setContentHuggingPriority:0 forAxis:v12];
  id v13 = objc_alloc(MEMORY[0x263F1C768]);
  uint64_t v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v14 setText:v9];

  LODWORD(v15) = 1132068864;
  [v14 setContentHuggingPriority:0 forAxis:v15];
  id v16 = objc_alloc(MEMORY[0x263F1C9B8]);
  v22[0] = v11;
  v22[1] = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v18 = (void *)[v16 initWithArrangedSubviews:v17];

  [v18 setDistribution:0];
  [v18 setSpacing:11.0];
  v19 = [v11 widthAnchor];
  v20 = [v19 constraintEqualToConstant:36.0];
  [v20 setActive:1];

  return v18;
}

- (void)_reloadCellItemTypes
{
  id v12 = [(id)objc_opt_class() defaultCellItemTypes];
  BOOL v3 = [(AKToolsListViewController *)self supportsImageDescriptionEditing];
  BOOL v4 = [(AKToolsListViewController *)self supportsOpacityEditing];
  BOOL v5 = [(AKToolsListViewController *)self isDeviceLocked];
  BOOL v6 = v5;
  if (!v3 && !v4 && !v5)
  {
    id v7 = v12;
    goto LABEL_10;
  }
  id v8 = (void *)[v12 mutableCopy];
  id v9 = v8;
  if (!v3)
  {
    if (!v4) {
      goto LABEL_7;
    }
LABEL_14:
    objc_msgSend(v9, "insertObject:atIndex:", &unk_26EA76568, objc_msgSend(v12, "count") - 1);
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v8 insertObject:&unk_26EA76550 atIndex:0];
  if (v4) {
    goto LABEL_14;
  }
LABEL_7:
  if (v6) {
LABEL_8:
  }
    [v9 removeObject:&unk_26EA76508];
LABEL_9:
  uint64_t v10 = [v9 copy];

  id v7 = (id)v10;
LABEL_10:
  id v13 = v7;
  [(AKToolsListViewController *)self setCellItemTypes:v7];
  v11 = [(AKToolsListViewController *)self tableView];
  [v11 reloadData];
}

- (int64_t)_shapesCellIndexRow
{
  v2 = [(AKToolsListViewController *)self cellItemTypes];
  int64_t v3 = [v2 indexOfObject:&unk_26EA76538];

  return v3;
}

- (void)setSupportsOpacityEditing:(BOOL)a3
{
  if (self->_supportsOpacityEditing != a3)
  {
    self->_supportsOpacityEditing = a3;
    [(AKToolsListViewController *)self _reloadCellItemTypes];
  }
}

- (void)setSupportsImageDescriptionEditing:(BOOL)a3
{
  if (self->_supportsImageDescriptionEditing != a3)
  {
    self->_supportsImageDescriptionEditing = a3;
    [(AKToolsListViewController *)self _reloadCellItemTypes];
  }
}

- (AKToolsListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKToolsListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)supportsOpacityEditing
{
  return self->_supportsOpacityEditing;
}

- (BOOL)supportsImageDescriptionEditing
{
  return self->_supportsImageDescriptionEditing;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)cellItemTypes
{
  return self->_cellItemTypes;
}

- (void)setCellItemTypes:(id)a3
{
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellItemTypes, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end