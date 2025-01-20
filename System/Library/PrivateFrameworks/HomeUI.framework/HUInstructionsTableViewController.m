@interface HUInstructionsTableViewController
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUInstructionsItem)instructionsItem;
- (HUInstructionsTableViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4;
- (HUInstructionsTableViewController)initWithItemManager:(id)a3;
- (HUInstructionsTableViewController)initWithItemManager:(id)a3 instructionsItem:(id)a4 contentViewController:(id)a5;
- (HUInstructionsTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (UIViewController)contentViewController;
- (id)childViewControllersToPreload;
- (void)setContentViewController:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUInstructionsTableViewController

- (HUInstructionsTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithInstructionsItem_contentViewController_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUInstructionsTableViewController.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUInstructionsTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUInstructionsTableViewController)initWithItemManager:(id)a3 instructionsItem:(id)a4 contentViewController:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUInstructionsTableViewController;
  v11 = [(HUItemTableViewController *)&v14 initWithItemManager:a3 tableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_instructionsItem, a4);
    objc_storeStrong((id *)&v12->_contentViewController, a5);
  }

  return v12;
}

- (HUInstructionsTableViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F69590];
  id v8 = a4;
  id v9 = [v7 alloc];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __84__HUInstructionsTableViewController_initWithInstructionsItem_contentViewController___block_invoke;
  v20 = &unk_1E6387E60;
  id v21 = v6;
  id v10 = v6;
  v11 = (void *)[v9 initWithDelegate:self itemProvidersCreator:&v17];
  v12 = (void *)MEMORY[0x1E4F69758];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 2, v17, v18, v19, v20);
  objc_super v14 = [v12 comparatorWithSortedClasses:v13 secondaryComparator:0];
  [v11 setItemComparator:v14];

  v15 = [(HUInstructionsTableViewController *)self initWithItemManager:v11 instructionsItem:v10 contentViewController:v8];
  return v15;
}

id __84__HUInstructionsTableViewController_initWithInstructionsItem_contentViewController___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F695C0]);
  v3 = (void *)[v2 initWithResults:MEMORY[0x1E4F1CC08]];
  v4 = objc_opt_new();
  objc_msgSend(v4, "na_safeAddObject:", *(void *)(a1 + 32));
  objc_msgSend(v4, "na_safeAddObject:", v3);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (HUInstructionsTableViewController)initWithItemManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUInstructionsTableViewController;
  return [(HUItemTableViewController *)&v4 initWithItemManager:a3 tableViewStyle:1];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUInstructionsTableViewController;
  [(HUItemTableViewController *)&v4 viewDidLoad];
  v3 = [(HUInstructionsTableViewController *)self tableView];
  [v3 setSeparatorStyle:0];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v5 = objc_opt_class();

  return (Class)v5;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)MEMORY[0x1E4F428B8];
    id v14 = v10;
    v15 = [v13 clearColor];
    [v14 setBackgroundColor:v15];

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v17 = [v14 contentView];
    [v17 setBackgroundColor:v16];

    uint64_t v18 = [(HUInstructionsTableViewController *)self contentViewController];
    [v14 setViewController:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)HUInstructionsTableViewController;
  [(HUItemTableViewController *)&v19 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  LOBYTE(a3) = [v4 numberOfSections] - 1 > (unint64_t)a3;

  return a3;
}

- (id)childViewControllersToPreload
{
  id v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(HUInstructionsTableViewController *)self contentViewController];
  id v4 = objc_msgSend(v2, "na_arrayWithSafeObject:", v3);

  return v4;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);

  objc_storeStrong((id *)&self->_instructionsItem, 0);
}

@end