@interface HUTriggerTimeConditionDetailEditorViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFTimeRangeCondition)rangeCondition;
- (HUTriggerTimeConditionDetailEditorDelegate)delegate;
- (HUTriggerTimeConditionDetailEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUTriggerTimeConditionDetailEditorViewController)initWithRangeCondition:(id)a3 delegate:(id)a4;
- (id)allCellClasses;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)datePickerCell:(id)a3 didSelectDate:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUTriggerTimeConditionDetailEditorViewController

- (HUTriggerTimeConditionDetailEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithItemManager_tableViewStyle_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerTimeConditionDetailEditorViewController.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUTriggerTimeConditionDetailEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUTriggerTimeConditionDetailEditorViewController)initWithRangeCondition:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HUTriggerTimeConditionDetailEditorItemManager alloc] initWithDelegate:self rangeCondition:v7];

  v12.receiver = self;
  v12.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  v9 = [(HUItemTableViewController *)&v12 initWithItemManager:v8 tableViewStyle:1];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v10;
}

- (HFTimeRangeCondition)rangeCondition
{
  v2 = [(HUItemTableViewController *)self itemManager];
  v3 = [v2 rangeCondition];

  return (HFTimeRangeCondition *)v3;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  [(HUItemTableViewController *)&v9 viewDidLoad];
  v3 = [(HUTriggerTimeConditionDetailEditorViewController *)self tableView];
  [v3 setSeparatorStyle:1];

  v4 = _HULocalizedStringWithDefaultValue(@"HUTriggerTimeConditionDetailEditorTitle", @"HUTriggerTimeConditionDetailEditorTitle", 1);
  [(HUTriggerTimeConditionDetailEditorViewController *)self setTitle:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  id v6 = [(HUTriggerTimeConditionDetailEditorViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  v8 = [(HUTriggerTimeConditionDetailEditorViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUTriggerTimeConditionDetailEditorViewController *)self delegate];
  [v4 timeConditionEditorDidCancel:self];
}

- (void)_done:(id)a3
{
  id v5 = [(HUTriggerTimeConditionDetailEditorViewController *)self delegate];
  id v4 = [(HUTriggerTimeConditionDetailEditorViewController *)self rangeCondition];
  [v5 timeConditionEditor:self didFinishWithCondition:v4];
}

- (id)allCellClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 primitiveConditionForPickerItem:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v8 = objc_opt_class();
  }
  else
  {
    NSLog(&cfstr_UnrecognizedPr.isa, v7);
    v8 = 0;
  }

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  [(HUItemTableViewController *)&v10 setupCell:v8 forItem:a4 indexPath:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setDelegate:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      [v9 setDelegate:self];
      [v9 setHideTitleLabel:1];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v29 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_super v12 = [(HUItemTableViewController *)self itemManager];
  v13 = [v12 primitiveConditionForPickerItem:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v10;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      v17 = v15;
      if (v16) {
        goto LABEL_9;
      }
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class(), v29.receiver, v29.super_class file lineNumber description];
    }
    v17 = 0;
LABEL_9:

    id v20 = [v13 dateComponents];
    [v17 setTimeComponents:v20];
LABEL_22:

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = objc_opt_class();
    id v22 = v10;
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      v17 = v22;
      if (v23) {
        goto LABEL_18;
      }
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v25 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v24 handleFailureInFunction:v25, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v21, objc_opt_class(), v29.receiver, v29.super_class file lineNumber description];
    }
    v17 = 0;
LABEL_18:

    id v20 = v13;
    v26 = [v20 significantEvent];
    [v17 setSignificantEvent:v26];

    v27 = [v20 offset];
    if (v27)
    {
      [v17 setCurrentOffset:v27];
    }
    else
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v17 setCurrentOffset:v28];
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self itemManager];
  uint64_t v6 = [v5 startConditionPickerItem];
  if ((id)v6 == v4)
  {

    goto LABEL_5;
  }
  id v7 = (void *)v6;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 endConditionPickerItem];

  if (v9 == v4)
  {
LABEL_5:
    unint64_t v10 = 1;
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  unint64_t v10 = [(HUItemTableViewController *)&v12 automaticDisablingReasonsForItem:v4];
LABEL_6:

  return v10;
}

- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUTriggerTimeConditionDetailEditorViewController *)self tableView];
  id v22 = [v8 indexPathForCell:v7];

  id v9 = [(HUItemTableViewController *)self itemManager];
  unint64_t v10 = [v9 displayedItemAtIndexPath:v22];

  uint64_t v11 = objc_opt_class();
  objc_super v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 primitiveConditionForPickerItem:v10];
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v13;
    if (v14) {
      goto LABEL_8;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
  }
  id v15 = 0;
LABEL_8:

  id v18 = objc_alloc(MEMORY[0x1E4F695F8]);
  v19 = [v15 significantEvent];
  id v20 = objc_msgSend(v18, "initWithSignificantEvent:offset:comparisonType:", v19, v6, objc_msgSend(v15, "comparisonType"));

  uint64_t v21 = [(HUItemTableViewController *)self itemManager];
  [v21 setPrimitiveCondition:v20 forPickerItem:v10];
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUTriggerTimeConditionDetailEditorViewController *)self tableView];
  id v22 = [v8 indexPathForCell:v7];

  id v9 = [(HUItemTableViewController *)self itemManager];
  unint64_t v10 = [v9 displayedItemAtIndexPath:v22];

  uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v12 = [v11 components:96 fromDate:v6];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [(HUItemTableViewController *)self itemManager];
  id v15 = [v14 primitiveConditionForPickerItem:v10];
  if (v15)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    v17 = v15;
    if (v16) {
      goto LABEL_8;
    }
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
  }
  v17 = 0;
LABEL_8:

  id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F690C0]), "initWithDateComponents:comparisonType:", v12, objc_msgSend(v17, "comparisonType"));
  uint64_t v21 = [(HUItemTableViewController *)self itemManager];
  [v21 setPrimitiveCondition:v20 forPickerItem:v10];
}

- (HUTriggerTimeConditionDetailEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerTimeConditionDetailEditorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end