@interface AKTextAttributesViewController
+ (id)fontSizeNumberFormatter;
- (AKController)controller;
- (AKFontChooserUIItemDelegate)fontUIItemDelegate;
- (AKFontListController)presetFontController;
- (AKTextAttributesUIItemDelegate)textAttributesUIItemDelegate;
- (AKTextAttributesViewController)initWithController:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)validateUserInterfaceItems;
- (NSNumber)currentFontSize;
- (NSString)currentFontFamilyName;
- (UIColor)currentFontColor;
- (UITableViewCell)alignmentTableCell;
- (UITableViewCell)sizeTableCell;
- (id)convertFont:(id)a3;
- (id)convertTextAttributes:(id)a3;
- (id)createRowAlignmentCell;
- (id)createRowFontSizeCell;
- (id)currentAlignment;
- (id)currentStyle;
- (id)lastActionValue;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)lastActionID;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_alignmentSegmentChanged:(id)a3;
- (void)_commonInit;
- (void)_sendFontAction;
- (void)_sendTextAttributesAction;
- (void)_sizeStepperValueChanged:(id)a3;
- (void)_styleSegmentChanged:(id)a3;
- (void)didSelectFont:(id)a3;
- (void)setAlignmentTableCell:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentAlignment:(id)a3;
- (void)setCurrentFontColor:(id)a3;
- (void)setCurrentFontFamilyName:(id)a3;
- (void)setCurrentFontSize:(id)a3;
- (void)setCurrentStyle:(id)a3;
- (void)setFontUIItemDelegate:(id)a3;
- (void)setLastActionID:(int64_t)a3;
- (void)setLastActionValue:(id)a3;
- (void)setPresetFontController:(id)a3;
- (void)setSizeTableCell:(id)a3;
- (void)setTextAttributesUIItemDelegate:(id)a3;
- (void)syncFontsToUI:(id)a3;
- (void)syncTextAttributesToUI:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AKTextAttributesViewController

- (AKTextAttributesViewController)initWithController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKTextAttributesViewController;
  v5 = [(AKTextAttributesViewController *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(AKTextAttributesViewController *)v5 setController:v4];
    v7 = [[AKFontListController alloc] initWithController:v4];
    [(AKTextAttributesViewController *)v6 setPresetFontController:v7];

    [(AKTextAttributesViewController *)v6 _commonInit];
  }

  return v6;
}

- (void)_commonInit
{
  v3 = [(AKTextAttributesViewController *)self presetFontController];
  id v4 = [v3 fonts];
  -[AKTextAttributesViewController setPreferredContentSize:](self, "setPreferredContentSize:", 247.0, (double)(unint64_t)(44 * [v4 count] + 88));

  v5 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
  v6 = [v5 familyName];
  [(AKTextAttributesViewController *)self setCurrentFontFamilyName:v6];

  [(AKTextAttributesViewController *)self setCurrentFontSize:&unk_26EA76A48];
  v7 = [MEMORY[0x263F1C550] blackColor];
  [(AKTextAttributesViewController *)self setCurrentFontColor:v7];

  v8 = objc_opt_new();
  [(AKTextAttributesViewController *)self setFontUIItemDelegate:v8];

  objc_super v9 = [(AKTextAttributesViewController *)self fontUIItemDelegate];
  [v9 setParentController:self];

  v10 = objc_opt_new();
  [(AKTextAttributesViewController *)self setTextAttributesUIItemDelegate:v10];

  id v11 = [(AKTextAttributesViewController *)self textAttributesUIItemDelegate];
  [v11 setParentController:self];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)AKTextAttributesViewController;
  [(AKTextAttributesViewController *)&v19 viewDidLoad];
  v3 = [(AKTextAttributesViewController *)self tableView];
  [v3 setAlwaysBounceVertical:0];

  id v4 = [(AKTextAttributesViewController *)self tableView];
  [v4 setRowHeight:44.0];

  v5 = [MEMORY[0x263F1C550] clearColor];
  v6 = [(AKTextAttributesViewController *)self tableView];
  [v6 setBackgroundColor:v5];

  v7 = [(AKTextAttributesViewController *)self tableView];
  v8 = (void *)MEMORY[0x263F088C8];
  objc_super v9 = [(AKTextAttributesViewController *)self presetFontController];
  v10 = [v9 fonts];
  id v11 = objc_msgSend(v8, "indexPathForRow:inSection:", objc_msgSend(v10, "count"), 0);
  id v12 = [(AKTextAttributesViewController *)self tableView:v7 cellForRowAtIndexPath:v11];

  v13 = [(AKTextAttributesViewController *)self tableView];
  v14 = (void *)MEMORY[0x263F088C8];
  v15 = [(AKTextAttributesViewController *)self presetFontController];
  v16 = [v15 fonts];
  v17 = objc_msgSend(v14, "indexPathForRow:inSection:", objc_msgSend(v16, "count") + 1, 0);
  id v18 = [(AKTextAttributesViewController *)self tableView:v13 cellForRowAtIndexPath:v17];

  [(AKTextAttributesViewController *)self validateUserInterfaceItems];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(AKTextAttributesViewController *)self presetFontController];
  v5 = [v4 fonts];
  int64_t v6 = [v5 count] + 2;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  objc_super v9 = [(AKTextAttributesViewController *)self presetFontController];
  v10 = [v9 fonts];
  uint64_t v11 = [v10 count];

  if (v8 == v11)
  {
    id v12 = [(AKTextAttributesViewController *)self createRowFontSizeCell];
  }
  else
  {
    uint64_t v13 = [v7 row];
    v14 = [(AKTextAttributesViewController *)self presetFontController];
    v15 = [v14 fonts];
    uint64_t v16 = [v15 count] + 1;

    if (v13 == v16)
    {
      id v12 = [(AKTextAttributesViewController *)self createRowAlignmentCell];
      [v12 setSeparatorStyle:0];
    }
    else
    {
      v17 = [(AKTextAttributesViewController *)self presetFontController];
      id v18 = [v17 fonts];
      objc_super v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));

      id v12 = [v6 dequeueReusableCellWithIdentifier:@"AKTextAttributesFontRowIdentifier"];
      if (!v12) {
        id v12 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"AKTextAttributesFontRowIdentifier"];
      }
      v20 = +[AKFontListController attributedStringForFont:v19];
      v21 = [v12 textLabel];
      [v21 setAttributedText:v20];

      v22 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
      v23 = [v22 imageWithRenderingMode:2];

      v24 = [v12 imageView];
      [v24 setImage:v23];

      v25 = [MEMORY[0x263F1C550] systemBlueColor];
      v26 = [v12 imageView];
      [v26 setTintColor:v25];

      if (!v19) {
        goto LABEL_11;
      }
      uint64_t v27 = [(AKTextAttributesViewController *)self currentFontFamilyName];
      if (!v27) {
        goto LABEL_11;
      }
      v28 = (void *)v27;
      v29 = [v19 familyName];
      v30 = [(AKTextAttributesViewController *)self currentFontFamilyName];
      int v31 = [v29 containsString:v30];

      if (v31)
      {
        v32 = [v12 imageView];
        v33 = v32;
        uint64_t v34 = 0;
      }
      else
      {
LABEL_11:
        v32 = [v12 imageView];
        v33 = v32;
        uint64_t v34 = 1;
      }
      [v32 setHidden:v34];
    }
  }
  v35 = [MEMORY[0x263F1C550] clearColor];
  [v12 setBackgroundColor:v35];

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v20 = a4;
  id v7 = a5;
  double v8 = *MEMORY[0x263F1D1C0];
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  objc_msgSend(v20, "setSeparatorInset:", *MEMORY[0x263F1D1C0], v9, v10, v11);
  [v20 setPreservesSuperviewLayoutMargins:0];
  objc_msgSend(v20, "setLayoutMargins:", v8, v9, v10, v11);
  uint64_t v12 = [v7 row];
  uint64_t v13 = [(AKTextAttributesViewController *)self presetFontController];
  v14 = [v13 fonts];
  uint64_t v15 = [v14 count] - 1;

  if (v12 < v15) {
    objc_msgSend(v20, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);
  }
  uint64_t v16 = [v7 row];
  v17 = [(AKTextAttributesViewController *)self presetFontController];
  id v18 = [v17 fonts];
  uint64_t v19 = [v18 count] + 1;

  if (v16 == v19) {
    [v20 setSeparatorStyle:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  double v8 = [(AKTextAttributesViewController *)self presetFontController];
  double v9 = [v8 fonts];
  uint64_t v10 = [v9 count];

  if (v7 < v10)
  {
    [v23 deselectRowAtIndexPath:v6 animated:1];
    double v11 = [(AKTextAttributesViewController *)self presetFontController];
    uint64_t v12 = [v11 fonts];
    uint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v6, "row"));

    [(AKTextAttributesViewController *)self didSelectFont:v13];
    v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [(AKTextAttributesViewController *)self presetFontController];
    uint64_t v16 = [v15 fonts];
    uint64_t v17 = [v16 count];

    if (v17 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = [MEMORY[0x263F088C8] indexPathForRow:v18 inSection:0];
        [v14 addObject:v19];

        ++v18;
        id v20 = [(AKTextAttributesViewController *)self presetFontController];
        v21 = [v20 fonts];
        uint64_t v22 = [v21 count];
      }
      while (v18 < v22);
    }
    [v23 reloadRowsAtIndexPaths:v14 withRowAnimation:0];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 row];
  uint64_t v7 = [(AKTextAttributesViewController *)self presetFontController];
  double v8 = [v7 fonts];
  if (v6 == [v8 count])
  {
  }
  else
  {
    uint64_t v9 = [v5 row];
    uint64_t v10 = [(AKTextAttributesViewController *)self presetFontController];
    double v11 = [v10 fonts];
    uint64_t v12 = [v11 count] + 1;

    uint64_t v13 = v5;
    if (v9 != v12) {
      goto LABEL_5;
    }
  }

  uint64_t v13 = 0;
LABEL_5:

  return v13;
}

- (id)createRowFontSizeCell
{
  v3 = [(AKTextAttributesViewController *)self sizeTableCell];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"AKTextAttributesRowFontSizeIdentifier"];
    id v5 = [AKFontSizePicker alloc];
    uint64_t v6 = [v4 contentView];
    [v6 bounds];
    uint64_t v7 = -[AKFontSizePicker initWithFrame:style:](v5, "initWithFrame:style:", 3);

    [(AKFontSizePicker *)v7 setTag:1001];
    [(AKFontSizePicker *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [(AKTextAttributesViewController *)self currentFontSize];
    [v8 doubleValue];
    -[AKFontSizePicker setValue:](v7, "setValue:");

    [(AKFontSizePicker *)v7 addTarget:self action:sel__sizeStepperValueChanged_ forControlEvents:4096];
    uint64_t v9 = [v4 contentView];
    [v9 addSubview:v7];

    [v4 setPreservesSuperviewLayoutMargins:1];
    [(AKFontSizePicker *)v7 setPreservesSuperviewLayoutMargins:1];
    uint64_t v10 = [(AKTextAttributesViewController *)self controller];
    objc_initWeak(&location, v10);

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2376CEBF0;
    v23[3] = &unk_264CDB1F8;
    objc_copyWeak(&v24, &location);
    [(AKFontSizePicker *)v7 setWillBeginTrackingUpdates:v23];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    id v20 = sub_2376CEC58;
    v21 = &unk_264CDB1F8;
    objc_copyWeak(&v22, &location);
    [(AKFontSizePicker *)v7 setDidEndTrackingUpdates:&v18];
    double v11 = _NSDictionaryOfVariableBindings(&cfstr_Sizepicker.isa, v7, 0, v18, v19, v20, v21);
    uint64_t v12 = (void *)MEMORY[0x263F08938];
    uint64_t v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[sizePicker]|" options:0 metrics:0 views:v11];
    [v12 activateConstraints:v13];

    v14 = (void *)MEMORY[0x263F08938];
    uint64_t v15 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[sizePicker]-(1)-|" options:0 metrics:0 views:v11];
    [v14 activateConstraints:v15];

    [(AKTextAttributesViewController *)self setSizeTableCell:v4];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  uint64_t v16 = [(AKTextAttributesViewController *)self sizeTableCell];

  return v16;
}

- (id)createRowAlignmentCell
{
  v20[4] = *MEMORY[0x263EF8340];
  v3 = [(AKTextAttributesViewController *)self alignmentTableCell];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"AKTextAttributesRowAlignmentIdentifier"];
    [v4 setAccessoryType:0];
    uint64_t v19 = [MEMORY[0x263F1C6B0] systemImageNamed:@"text.alignleft"];
    id v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"text.aligncenter"];
    uint64_t v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"text.alignright"];
    uint64_t v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"text.justify"];
    double v8 = [AKSegmentedCtrl alloc];
    v20[0] = v19;
    v20[1] = v5;
    v20[2] = v6;
    v20[3] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
    uint64_t v10 = [(AKSegmentedCtrl *)v8 initWithImages:v9];

    [(AKSegmentedCtrl *)v10 addTarget:self action:sel__alignmentSegmentChanged_ forControlEvents:4096];
    [(AKSegmentedCtrl *)v10 setSelectionType:0];
    [(AKSegmentedCtrl *)v10 setTag:1001];
    [(AKSegmentedCtrl *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v11 = [v4 contentView];
    [v11 addSubview:v10];

    [(AKSegmentedCtrl *)v10 setTag:0 forSegment:0];
    [(AKSegmentedCtrl *)v10 setTag:1 forSegment:1];
    [(AKSegmentedCtrl *)v10 setTag:2 forSegment:2];
    [(AKSegmentedCtrl *)v10 setTag:3 forSegment:3];
    uint64_t v12 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr.isa, v10, 0);
    uint64_t v13 = (void *)MEMORY[0x263F08938];
    v14 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[segmentedControl]|" options:0 metrics:0 views:v12];
    [v13 activateConstraints:v14];

    uint64_t v15 = (void *)MEMORY[0x263F08938];
    uint64_t v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[segmentedControl]|" options:0 metrics:0 views:v12];
    [v15 activateConstraints:v16];

    [(AKTextAttributesViewController *)self setAlignmentTableCell:v4];
  }
  uint64_t v17 = [(AKTextAttributesViewController *)self alignmentTableCell];

  return v17;
}

- (void)_sizeStepperValueChanged:(id)a3
{
  id v4 = NSNumber;
  [a3 value];
  objc_msgSend(v4, "numberWithDouble:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(AKTextAttributesViewController *)self setCurrentFontSize:v13];
  id v5 = [(id)objc_opt_class() fontSizeNumberFormatter];
  uint64_t v6 = [v5 stringFromNumber:v13];

  uint64_t v7 = [(AKTextAttributesViewController *)self sizeTableCell];
  double v8 = [v7 detailTextLabel];
  [v8 setText:v6];

  uint64_t v9 = [(AKTextAttributesViewController *)self sizeTableCell];
  uint64_t v10 = [v9 contentView];
  double v11 = [v10 viewWithTag:1001];

  [v13 floatValue];
  [v11 setValue:v12];
  [(AKTextAttributesViewController *)self setLastActionID:3];
  [(AKTextAttributesViewController *)self setLastActionValue:v13];
  [(AKTextAttributesViewController *)self _sendFontAction];
}

- (void)_styleSegmentChanged:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [v14 selectedSegment];
  uint64_t v5 = [v14 segmentCount];
  uint64_t v6 = [v14 selectedSegment] << 24;
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      int v8 = [v14 isSelectedForSegment:i];
      uint64_t v9 = 1 << i;
      if (!v8) {
        uint64_t v9 = 0;
      }
      v6 |= v9;
    }
  }
  [(AKTextAttributesViewController *)self setLastActionID:4];
  uint64_t v10 = [NSNumber numberWithInteger:v6];
  [(AKTextAttributesViewController *)self setLastActionValue:v10];

  if (v4 > 1)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [(AKTextAttributesViewController *)self _sendTextAttributesAction];
    }
  }
  else
  {
    [(AKTextAttributesViewController *)self _sendFontAction];
    double v11 = [(AKTextAttributesViewController *)self controller];
    float v12 = [v11 actionController];
    id v13 = [(AKTextAttributesViewController *)self fontUIItemDelegate];
    [v12 validateSender:v13];
  }
}

- (void)_alignmentSegmentChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "tagForSegment:", objc_msgSend(v4, "selectedSegment"));

  [(AKTextAttributesViewController *)self setLastActionID:6];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
  [(AKTextAttributesViewController *)self setLastActionValue:v6];

  [(AKTextAttributesViewController *)self _sendTextAttributesAction];
}

- (void)_sendFontAction
{
  id v6 = [(AKTextAttributesViewController *)self controller];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  id v4 = [v6 actionController];
  uint64_t v5 = [(AKTextAttributesViewController *)self fontUIItemDelegate];
  [v3 sendAction:sel_performActionForSender_ to:v4 from:v5 forEvent:0];
}

- (void)_sendTextAttributesAction
{
  id v6 = [(AKTextAttributesViewController *)self controller];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  id v4 = [v6 actionController];
  uint64_t v5 = [(AKTextAttributesViewController *)self textAttributesUIItemDelegate];
  [v3 sendAction:sel_performActionForSender_ to:v4 from:v5 forEvent:0];
}

- (BOOL)validateUserInterfaceItems
{
  v3 = [(AKTextAttributesViewController *)self controller];
  id v4 = [v3 actionController];
  uint64_t v5 = [(AKTextAttributesViewController *)self fontUIItemDelegate];
  char v6 = [v4 validateSender:v5];

  uint64_t v7 = [v3 actionController];
  int v8 = [(AKTextAttributesViewController *)self textAttributesUIItemDelegate];
  LOBYTE(v5) = v6 | [v7 validateSender:v8];

  return (char)v5;
}

- (void)didSelectFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 familyName];
  [(AKTextAttributesViewController *)self setCurrentFontFamilyName:v5];

  [(AKTextAttributesViewController *)self setLastActionID:1];
  [(AKTextAttributesViewController *)self setLastActionValue:v4];

  [(AKTextAttributesViewController *)self _sendFontAction];
}

- (id)convertFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fontDescriptor];
  switch([(AKTextAttributesViewController *)self lastActionID])
  {
    case 1:
      char v6 = [(AKTextAttributesViewController *)self lastActionValue];
      uint64_t v7 = [v6 familyName];
      uint64_t v8 = [v5 fontDescriptorWithFamily:v7];
      goto LABEL_5;
    case 2:
      char v6 = [(AKTextAttributesViewController *)self lastActionValue];
      uint64_t v7 = [v6 fontName];
      uint64_t v8 = [v5 fontDescriptorWithFace:v7];
LABEL_5:
      uint64_t v10 = (void *)v8;

      goto LABEL_14;
    case 3:
      uint64_t v10 = [(AKTextAttributesViewController *)self lastActionValue];
      [v10 doubleValue];
      uint64_t v11 = objc_msgSend(v4, "fontWithSize:");
      goto LABEL_15;
    case 4:
      float v12 = [(AKTextAttributesViewController *)self lastActionValue];
      unint64_t v13 = [v12 integerValue];

      if (v13 >> 24) {
        int v14 = 1;
      }
      else {
        int v14 = 2;
      }
      int v15 = [v5 symbolicTraits];
      if ((v13 & (1 << SBYTE3(v13))) != 0) {
        uint64_t v16 = v15 | v14;
      }
      else {
        uint64_t v16 = v15 & ~v14;
      }
      uint64_t v10 = [v5 fontDescriptorWithSymbolicTraits:v16];
LABEL_14:
      uint64_t v11 = [MEMORY[0x263F1C658] fontWithDescriptor:v10 size:0.0];
LABEL_15:
      uint64_t v9 = (void *)v11;

      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  if (v9) {
    uint64_t v17 = v9;
  }
  else {
    uint64_t v17 = v4;
  }
  id v18 = v17;

  return v18;
}

- (void)syncFontsToUI:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9D0] null];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      id v12 = v8;
      id v13 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v5);
        }
        int v14 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        id v9 = v4;
        if (v13 != v4)
        {
          id v15 = [*(id *)(*((void *)&v32 + 1) + 8 * v11) familyName];
          uint64_t v16 = v15;
          if (v13)
          {
            if (v13 != v15 && ([v13 isEqual:v15] & 1) == 0)
            {
              id v17 = v4;

              id v13 = v17;
            }
          }
          else
          {
            id v13 = v15;
          }

          id v9 = v13;
        }
        id v8 = v4;
        if (v12 != v4)
        {
          id v18 = NSNumber;
          [v14 pointSize];
          uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
          id v20 = v19;
          if (v12)
          {
            [v12 doubleValue];
            double v22 = v21;
            [v20 doubleValue];
            if (vabdd_f64(v22, v23) >= 0.0005)
            {
              id v24 = v4;

              id v12 = v24;
            }
          }
          else
          {
            id v12 = v19;
          }

          id v8 = v12;
        }
        ++v11;
        id v12 = v8;
        id v13 = v9;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  if (v9 == v4)
  {
    v26 = +[AKController akBundle];
    uint64_t v27 = [v26 localizedStringForKey:@"Multiple Fonts" value:&stru_26EA57918 table:@"AKTextAttributesViewController_iOS"];
    v25 = self;
    [(AKTextAttributesViewController *)self setCurrentFontFamilyName:v27];
  }
  else
  {
    v25 = self;
    [(AKTextAttributesViewController *)self setCurrentFontFamilyName:v9];
  }
  if (v8 != v4)
  {
    [(AKTextAttributesViewController *)v25 setCurrentFontSize:v8];
    v28 = [(AKTextAttributesViewController *)v25 sizeTableCell];
    v29 = [v28 contentView];
    v30 = [v29 viewWithTag:1001];

    [v8 doubleValue];
    objc_msgSend(v30, "setValue:");
  }
}

- (id)convertTextAttributes:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AKTextAttributesViewController *)self lastActionID];
  if (v5 == 4)
  {
    uint64_t v11 = [(AKTextAttributesViewController *)self lastActionValue];
    unint64_t v12 = [v11 integerValue];

    uint64_t v13 = *MEMORY[0x263F1C2D8];
    id v9 = [v4 objectForKey:*MEMORY[0x263F1C2D8]];
    uint64_t v14 = *MEMORY[0x263F1C298];
    id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1C298]];
    unint64_t v16 = v12 & 8;
    if (((v12 >> 2) & 1) == ([v9 integerValue] == 1))
    {
      uint64_t v10 = 0;
    }
    else
    {
      unint64_t v18 = v12 & 4;
      if (v4)
      {
        uint64_t v19 = (void *)[v4 mutableCopy];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v10 = v19;
      if (v18)
      {
        double v21 = [NSNumber numberWithInteger:1];
        [v10 setObject:v21 forKey:v13];
      }
      else
      {
        [v19 removeObjectForKey:v13];
      }
    }
    if ((v16 >> 3) == ([v15 integerValue] == 1)) {
      goto LABEL_39;
    }
    if (v10)
    {
      if (!v16)
      {
LABEL_30:
        [v10 removeObjectForKey:v14];
        goto LABEL_39;
      }
    }
    else
    {
      if (v4)
      {
        uint64_t v22 = [v4 mutableCopy];
      }
      else
      {
        uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v10 = (void *)v22;
      if (!v16) {
        goto LABEL_30;
      }
    }
    double v23 = [NSNumber numberWithInteger:1];
    [v10 setObject:v23 forKey:v14];

    goto LABEL_39;
  }
  if (v5 == 5)
  {
    id v9 = [(AKTextAttributesViewController *)self lastActionValue];
    uint64_t v8 = *MEMORY[0x263F1C240];
    id v15 = [v4 objectForKey:*MEMORY[0x263F1C240]];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F1C550] blackColor];
    }
    if (([v15 akIsEqualToColor:v9] & 1) == 0)
    {
      if (v4)
      {
        id v17 = (void *)[v4 mutableCopy];
      }
      else
      {
        id v17 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v10 = v17;
      id v20 = v9;
      goto LABEL_33;
    }
    uint64_t v10 = 0;
LABEL_39:

    goto LABEL_40;
  }
  if (v5 != 6)
  {
    uint64_t v10 = 0;
    goto LABEL_41;
  }
  uint64_t v6 = [(AKTextAttributesViewController *)self lastActionValue];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = *MEMORY[0x263F1C268];
  id v9 = [v4 objectForKey:*MEMORY[0x263F1C268]];
  if (!v9)
  {
    id v9 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  if ([v9 alignment] != v7)
  {
    id v15 = (void *)[v9 mutableCopy];
    [v15 setAlignment:v7];
    if (v4)
    {
      id v17 = (void *)[v4 mutableCopy];
    }
    else
    {
      id v17 = [MEMORY[0x263EFF9A0] dictionary];
    }
    uint64_t v10 = v17;
    id v20 = v15;
LABEL_33:
    [v17 setObject:v20 forKey:v8];
    goto LABEL_39;
  }
  uint64_t v10 = 0;
LABEL_40:

LABEL_41:
  if (v10) {
    id v24 = v10;
  }
  else {
    id v24 = v4;
  }
  id v25 = v24;

  return v25;
}

- (void)syncTextAttributesToUI:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9D0] null];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v26 = *(void *)v29;
    uint64_t v9 = *MEMORY[0x263F1C268];
    uint64_t v25 = *MEMORY[0x263F1C240];
    do
    {
      uint64_t v10 = 0;
      id v11 = v7;
      id v12 = v8;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        uint64_t v14 = [v13 objectForKey:v9];
        if (!v14)
        {
          uint64_t v14 = [MEMORY[0x263F1C358] defaultParagraphStyle];
        }
        id v8 = v4;
        if (v12 != v4)
        {
          uint64_t v27 = 0;
          +[AKTextAnnotationAttributeHelper resolvedAlignmentAndDirection:v14 locale:0 alignment:&v27 direction:0];
          if (v12)
          {
            uint64_t v15 = [v12 unsignedIntegerValue];
            if (v15 != v27)
            {
              id v16 = v4;

              id v12 = v16;
            }
          }
          else
          {
            id v12 = [NSNumber numberWithUnsignedInteger:v27];
          }
          id v8 = v12;
        }
        uint64_t v7 = v4;
        if (v11 != v4)
        {
          id v17 = [v13 objectForKey:v25];
          unint64_t v18 = v17;
          if (v11)
          {
            if (v11 != v17 && ([v11 akIsEqualToColor:v17] & 1) == 0)
            {
              id v19 = v4;

              id v11 = v19;
            }
          }
          else
          {
            id v11 = v17;
          }

          uint64_t v7 = v11;
        }

        ++v10;
        id v11 = v7;
        id v12 = v8;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }

  id v20 = [(AKTextAttributesViewController *)self alignmentTableCell];
  double v21 = [v20 contentView];
  uint64_t v22 = [v21 viewWithTag:1001];

  [v22 deselectAllSegments];
  if (v8 != v4) {
    objc_msgSend(v22, "selectSegmentWithTag:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
}

+ (id)fontSizeNumberFormatter
{
  if (qword_268925368 != -1) {
    dispatch_once(&qword_268925368, &unk_26EA576D8);
  }
  v2 = (void *)qword_268925360;

  return v2;
}

- (UITableViewCell)sizeTableCell
{
  return self->_sizeTableCell;
}

- (void)setSizeTableCell:(id)a3
{
}

- (UITableViewCell)alignmentTableCell
{
  return self->_alignmentTableCell;
}

- (void)setAlignmentTableCell:(id)a3
{
}

- (UIColor)currentFontColor
{
  return self->_currentFontColor;
}

- (void)setCurrentFontColor:(id)a3
{
}

- (NSString)currentFontFamilyName
{
  return self->_currentFontFamilyName;
}

- (void)setCurrentFontFamilyName:(id)a3
{
}

- (NSNumber)currentFontSize
{
  return self->_currentFontSize;
}

- (void)setCurrentFontSize:(id)a3
{
}

- (id)currentAlignment
{
  return self->_currentAlignment;
}

- (void)setCurrentAlignment:(id)a3
{
  self->_currentAlignment = a3;
}

- (id)currentStyle
{
  return self->_currentStyle;
}

- (void)setCurrentStyle:(id)a3
{
  self->_currentStyle = a3;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKFontListController)presetFontController
{
  return self->_presetFontController;
}

- (void)setPresetFontController:(id)a3
{
}

- (int64_t)lastActionID
{
  return self->_lastActionID;
}

- (void)setLastActionID:(int64_t)a3
{
  self->_lastActionID = a3;
}

- (id)lastActionValue
{
  return objc_getProperty(self, a2, 1104, 1);
}

- (void)setLastActionValue:(id)a3
{
}

- (AKFontChooserUIItemDelegate)fontUIItemDelegate
{
  return self->_fontUIItemDelegate;
}

- (void)setFontUIItemDelegate:(id)a3
{
}

- (AKTextAttributesUIItemDelegate)textAttributesUIItemDelegate
{
  return self->_textAttributesUIItemDelegate;
}

- (void)setTextAttributesUIItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttributesUIItemDelegate, 0);
  objc_storeStrong((id *)&self->_fontUIItemDelegate, 0);
  objc_storeStrong(&self->_lastActionValue, 0);
  objc_storeStrong((id *)&self->_presetFontController, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_currentFontSize, 0);
  objc_storeStrong((id *)&self->_currentFontFamilyName, 0);
  objc_storeStrong((id *)&self->_currentFontColor, 0);
  objc_storeStrong((id *)&self->_alignmentTableCell, 0);

  objc_storeStrong((id *)&self->_sizeTableCell, 0);
}

@end