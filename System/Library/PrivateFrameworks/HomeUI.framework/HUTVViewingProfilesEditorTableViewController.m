@interface HUTVViewingProfilesEditorTableViewController
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)hideHeadersAndFooters;
- (HUTVViewingProfilesDevicesModuleController)tvpDevicesModuleController;
- (HUTVViewingProfilesEditorTableViewController)initWithUserItem:(id)a3;
- (id)itemModuleControllers;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (void)setHideHeadersAndFooters:(BOOL)a3;
@end

@implementation HUTVViewingProfilesEditorTableViewController

- (HUTVViewingProfilesEditorTableViewController)initWithUserItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUTVViewingProfilesEditorItemManager alloc] initWithDelegate:self userItem:v4];

  v13.receiver = self;
  v13.super_class = (Class)HUTVViewingProfilesEditorTableViewController;
  v6 = [(HUItemTableViewController *)&v13 initWithItemManager:v5 tableViewStyle:1];
  if (v6)
  {
    v7 = [HUTVViewingProfilesDevicesModuleController alloc];
    v8 = [(HUTVViewingProfilesEditorItemManager *)v5 tvpDevicesModule];
    uint64_t v9 = [(HUTVViewingProfilesDevicesModuleController *)v7 initWithModule:v8 host:v6];
    tvpDevicesModuleController = v6->_tvpDevicesModuleController;
    v6->_tvpDevicesModuleController = (HUTVViewingProfilesDevicesModuleController *)v9;

    v11 = _HULocalizedStringWithDefaultValue(@"HUUsersTVViewingProfiles", @"HUUsersTVViewingProfiles", 1);
    [(HUTVViewingProfilesEditorTableViewController *)v6 setTitle:v11];

    v6->_hideHeadersAndFooters = 0;
  }

  return v6;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUTVViewingProfilesEditorTableViewController *)self tvpDevicesModuleController];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performPresentationRequest:a4];
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (BOOL)hideHeadersAndFooters
{
  return self->_hideHeadersAndFooters;
}

- (void)setHideHeadersAndFooters:(BOOL)a3
{
  self->_hideHeadersAndFooters = a3;
}

- (HUTVViewingProfilesDevicesModuleController)tvpDevicesModuleController
{
  return self->_tvpDevicesModuleController;
}

- (void).cxx_destruct
{
}

@end