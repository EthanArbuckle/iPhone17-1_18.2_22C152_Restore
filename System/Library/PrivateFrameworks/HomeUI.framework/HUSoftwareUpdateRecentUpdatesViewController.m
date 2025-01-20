@interface HUSoftwareUpdateRecentUpdatesViewController
- (HUPresentationDelegate)presentationDelegate;
- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController;
- (HUSoftwareUpdateRecentUpdatesViewController)initWithHome:(id)a3;
- (HUSoftwareUpdateRecentUpdatesViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)itemModuleControllers;
- (void)setPresentationDelegate:(id)a3;
- (void)setSoftwareUpdateItemModuleController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUSoftwareUpdateRecentUpdatesViewController

- (HUSoftwareUpdateRecentUpdatesViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = [[HUSoftwareUpdateRecentUpdatesItemManager alloc] initWithDelegate:self home:v4];

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateRecentUpdatesViewController;
  v6 = [(HUItemTableViewController *)&v8 initWithItemManager:v5 tableViewStyle:1];

  return v6;
}

- (HUSoftwareUpdateRecentUpdatesViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateRecentUpdatesViewController.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateRecentUpdatesViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateRecentUpdatesViewController;
  [(HUItemTableViewController *)&v4 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateUpdatedRecentlyTitle", @"HUSoftwareUpdateUpdatedRecentlyTitle", 1);
  [(HUSoftwareUpdateRecentUpdatesViewController *)self setTitle:v3];
}

- (id)itemModuleControllers
{
  v3 = [(HUSoftwareUpdateRecentUpdatesViewController *)self softwareUpdateItemModuleController];

  if (!v3)
  {
    objc_super v4 = [HUSoftwareUpdateItemModuleController alloc];
    v5 = [(HUItemTableViewController *)self itemManager];
    v6 = [v5 softwareUpdateModule];
    v7 = [(HUSoftwareUpdateItemModuleController *)v4 initWithModule:v6 delegate:0 expandableTextViewCellDelegate:self];
    [(HUSoftwareUpdateRecentUpdatesViewController *)self setSoftwareUpdateItemModuleController:v7];
  }
  objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HUSoftwareUpdateRecentUpdatesViewController *)self softwareUpdateItemModuleController];
  v10 = [v8 setWithObject:v9];

  return v10;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end