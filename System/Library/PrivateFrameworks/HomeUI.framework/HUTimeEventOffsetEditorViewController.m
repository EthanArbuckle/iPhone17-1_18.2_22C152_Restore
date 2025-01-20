@interface HUTimeEventOffsetEditorViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUTimeEventOffsetEditorDelegate)delegate;
- (HUTimeEventOffsetEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUTimeEventOffsetEditorViewController)initWithSignificantEvent:(id)a3 currentOffset:(id)a4 delegate:(id)a5;
- (NSDateComponents)currentOffset;
- (NSDateComponents)selectedOffset;
- (NSString)significantEvent;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedOffset:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUTimeEventOffsetEditorViewController

- (HUTimeEventOffsetEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithSignificantEvent_currentOffset_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTimeEventOffsetEditorViewController.m", 29, @"%s is unavailable; use %@ instead",
    "-[HUTimeEventOffsetEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUTimeEventOffsetEditorViewController)initWithSignificantEvent:(id)a3 currentOffset:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self itemProvidersCreator:&__block_literal_global_232];
  v16.receiver = self;
  v16.super_class = (Class)HUTimeEventOffsetEditorViewController;
  v13 = [(HUItemTableViewController *)&v16 initWithItemManager:v12 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_significantEvent, a3);
    objc_storeStrong((id *)&v14->_currentOffset, a4);
    objc_storeStrong((id *)&v14->_selectedOffset, a4);
    objc_storeWeak((id *)&v14->_delegate, v11);
  }

  return v14;
}

id __89__HUTimeEventOffsetEditorViewController_initWithSignificantEvent_currentOffset_delegate___block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F695C0]);
  v1 = (void *)[v0 initWithResults:MEMORY[0x1E4F1CC08]];
  id v2 = objc_alloc(MEMORY[0x1E4F695C8]);
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v1];
  v4 = (void *)[v2 initWithItems:v3];

  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)HUTimeEventOffsetEditorViewController;
  [(HUItemTableViewController *)&v15 viewDidLoad];
  v3 = [(HUTimeEventOffsetEditorViewController *)self tableView];
  [v3 setSeparatorStyle:1];

  v4 = [(HUTimeEventOffsetEditorViewController *)self tableView];
  [v4 setScrollEnabled:0];

  v5 = [(HUTimeEventOffsetEditorViewController *)self significantEvent];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2DF70]];

  if (v6)
  {
    v7 = @"HUTimeEventOffsetEditorTitleSunrise";
  }
  else
  {
    v8 = [(HUTimeEventOffsetEditorViewController *)self significantEvent];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F2DF78]];

    if (!v9)
    {
      id v10 = [(HUTimeEventOffsetEditorViewController *)self significantEvent];
      NSLog(&cfstr_UnhandledSigni.isa, v10);
      goto LABEL_7;
    }
    v7 = @"HUTimeEventOffsetEditorTitleSunset";
  }
  id v10 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
  [(HUTimeEventOffsetEditorViewController *)self setTitle:v10];
LABEL_7:

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  v12 = [(HUTimeEventOffsetEditorViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  v14 = [(HUTimeEventOffsetEditorViewController *)self navigationItem];
  [v14 setRightBarButtonItem:v13];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUTimeEventOffsetEditorViewController *)self delegate];
  [v4 timerTriggerOffsetEditorDidCancel:self];
}

- (void)_done:(id)a3
{
  id v5 = [(HUTimeEventOffsetEditorViewController *)self delegate];
  id v4 = [(HUTimeEventOffsetEditorViewController *)self selectedOffset];
  [v5 timerTriggerOffsetEditor:self didFinishWithOffset:v4];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (!v12) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = v12;
  if (!v13)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];

LABEL_7:
    v14 = 0;
  }

  [v14 setDelegate:self];
  v17.receiver = self;
  v17.super_class = (Class)HUTimeEventOffsetEditorViewController;
  [(HUItemTableViewController *)&v17 setupCell:v12 forItem:v10 indexPath:v9];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  id v14 = v10;
  if (!v14) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    objc_super v15 = v14;
  }
  else {
    objc_super v15 = 0;
  }
  objc_super v16 = v14;
  if (!v15)
  {
    objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];

LABEL_7:
    objc_super v16 = 0;
  }

  v19 = [(HUTimeEventOffsetEditorViewController *)self significantEvent];
  [v16 setSignificantEvent:v19];

  v20 = [(HUTimeEventOffsetEditorViewController *)self currentOffset];
  [v16 setCurrentOffset:v20];

  v21.receiver = self;
  v21.super_class = (Class)HUTimeEventOffsetEditorViewController;
  [(HUItemTableViewController *)&v21 updateCell:v14 forItem:v12 indexPath:v11 animated:v6];
}

- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4
{
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)currentOffset
{
  return self->_currentOffset;
}

- (HUTimeEventOffsetEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTimeEventOffsetEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDateComponents)selectedOffset
{
  return self->_selectedOffset;
}

- (void)setSelectedOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOffset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentOffset, 0);

  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end