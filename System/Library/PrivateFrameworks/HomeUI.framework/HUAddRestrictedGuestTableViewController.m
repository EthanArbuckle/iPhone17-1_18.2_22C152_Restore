@interface HUAddRestrictedGuestTableViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUAddRestrictedGuestItemManager)restrictedGuestItemManager;
- (HUAddRestrictedGuestTableViewController)initWithItem:(id)a3 home:(id)a4 inviteeAddresses:(id)a5;
- (HUAddRestrictedGuestTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUAddRestrictedGuestViewDelegate)delegate;
- (HUPresentationDelegate)presentationDelegate;
- (NSArray)accessoriesToAllowToRG;
- (NSMutableArray)accessoriesToAllow;
- (id)rgHomeAccessSettings;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)didUpdateInviteUserSchedule:(id)a3 schedule:(id)a4;
- (void)sendInvites;
- (void)setAccessoriesToAllow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRestrictedGuestItemManager:(id)a3;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUAddRestrictedGuestTableViewController

- (HUAddRestrictedGuestTableViewController)initWithItem:(id)a3 home:(id)a4 inviteeAddresses:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HUAddRestrictedGuestTableViewController.m", 39, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  if (![v11 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUAddRestrictedGuestTableViewController.m", 40, @"Invalid parameter not satisfying: %@", @"inviteeAddresses.count > 0" object file lineNumber description];
  }
  v12 = (void *)[v9 copy];
  v13 = [[HUAddRestrictedGuestItemManager alloc] initWithDelegate:self sourceItem:v12 home:v10 inviteeAddresses:v11];
  v20.receiver = self;
  v20.super_class = (Class)HUAddRestrictedGuestTableViewController;
  v14 = [(HUItemTableViewController *)&v20 initWithItemManager:v13 tableViewStyle:1];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_restrictedGuestItemManager, v13);
    [(HUItemTableViewController *)v15 setAutomaticallyUpdatesViewControllerTitle:0];
    v16 = objc_opt_new();
    [(HUAddRestrictedGuestTableViewController *)v15 setAccessoriesToAllow:v16];
  }
  return v15;
}

- (HUAddRestrictedGuestTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithItem_home_inviteeAddresses_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAddRestrictedGuestTableViewController.m", 59, @"%s is unavailable; use %@ instead",
    "-[HUAddRestrictedGuestTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)sendInvites
{
  id v4 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  v3 = [(HUAddRestrictedGuestTableViewController *)self accessoriesToAllow];
  [v4 sendInvitesWithAllowedAccessories:v3];
}

- (id)rgHomeAccessSettings
{
  v3 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  id v4 = [(HUAddRestrictedGuestTableViewController *)self accessoriesToAllowToRG];
  v5 = [v3 mutableRestrictedGuestHomeAccessSettingsWithAllowedAccessories:v4];

  return v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)accessoriesToAllowToRG
{
  v2 = [(HUAddRestrictedGuestTableViewController *)self accessoriesToAllow];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  v6 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  v7 = [v6 homeScheduleItem];
  char v8 = [v7 isEqual:v5];

  if ((v8 & 1) == 0)
  {
    id v9 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
    id v10 = [v9 transformedSecureAccessoryItemProvider];
    id v11 = [v10 items];
    [v11 containsObject:v5];
  }
  v12 = objc_opt_class();

  return (Class)v12;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HUAddRestrictedGuestTableViewController;
  [(HUItemTableViewController *)&v38 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  v12 = [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
  [v10 setBackgroundColor:v12];

  v13 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  v14 = [v13 homeScheduleItem];
  int v15 = [v14 isEqual:v11];

  if (v15)
  {
    objc_opt_class();
    id v16 = v10;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    [v18 setIconDisplayStyle:1];
    [v18 setDisableContinuousIconAnimation:1];
    HUDefaultSizeForIconSize();
    double v20 = v19;
    double v22 = v21;
    v23 = [v18 contentMetrics];
    objc_msgSend(v23, "setIconSize:", v20, v22);

    [v18 setAccessoryView:0];
    [v18 setAccessoryType:0];
    [v18 setValueColorFollowsTintColor:1];
    id v24 = [v11 latestResults];
    v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v18 setAccessibilityIdentifier:v25];
LABEL_16:

    goto LABEL_17;
  }
  v26 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  v27 = [v26 transformedSecureAccessoryItemProvider];
  v28 = [v27 items];
  int v29 = [v28 containsObject:v11];

  if (v29)
  {
    objc_opt_class();
    id v30 = v10;
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v24 = v31;

    [v24 setDelegate:self];
    v25 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v11];
    objc_opt_class();
    v32 = [v11 latestResults];
    v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68AB0]];
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    id v18 = v34;

    if (v18)
    {
      v35 = [v25 imageProperties];
      [v35 setTintColor:v18];
    }
    [v24 setContentConfiguration:v25];
    v36 = [v11 latestResults];
    v37 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v24 setAccessibilityIdentifier:v37];

    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(HUItemTableViewController *)self itemManager];
  v7 = [v6 displayedItemAtIndexPath:v5];

  char v8 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  id v9 = [v8 transformedSecureAccessoryItemProvider];
  id v10 = [v9 items];
  char v11 = [v10 containsObject:v7];

  if (v11) {
    id v12 = 0;
  }
  else {
    id v12 = v5;
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HUAddRestrictedGuestTableViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v19 tableView:v7 didSelectRowAtIndexPath:v6];
  char v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v10 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  char v11 = [v10 homeScheduleItem];
  LODWORD(v7) = [v9 isEqual:v11];

  if (v7)
  {
    id v12 = [HURestrictedGuestScheduleViewController alloc];
    v13 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
    v14 = [v13 homeScheduleItem];
    int v15 = [v14 schedule];
    id v16 = [(HURestrictedGuestScheduleViewController *)v12 initWithSchedule:v15 delegate:self];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v16];
    [v17 setModalPresentationStyle:2];
    id v18 = [(UIViewController *)self hu_presentPreloadableViewController:v17 animated:1];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412546;
    v25 = self;
    __int16 v26 = 1024;
    BOOL v27 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", (uint8_t *)&v24, 0x12u);
  }

  char v8 = [(HUAddRestrictedGuestTableViewController *)self tableView];
  id v9 = [v8 indexPathForCell:v6];

  id v10 = [(HUItemTableViewController *)self itemManager];
  char v11 = [v10 displayedItemAtIndexPath:v9];

  objc_opt_class();
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  int v15 = [v14 sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  id v18 = [(HUAddRestrictedGuestTableViewController *)self accessoriesToAllow];
  objc_super v19 = [v17 accessory];
  if (v4) {
    [v18 addObject:v19];
  }
  else {
    [v18 removeObject:v19];
  }

  double v20 = [(HUAddRestrictedGuestTableViewController *)self accessoriesToAllow];
  BOOL v21 = [v20 count] != 0;
  double v22 = [(HUAddRestrictedGuestTableViewController *)self delegate];
  v23 = [v22 addButtonItem];
  [v23 setEnabled:v21];
}

- (void)didUpdateInviteUserSchedule:(id)a3 schedule:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = NSStringFromSelector(a2);
    id v9 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
    id v10 = [v9 homeScheduleItem];
    char v11 = [v10 schedule];
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating new invite user schedule from [%@] to [%@]", (uint8_t *)&v13, 0x2Au);
  }
  id v12 = [(HUAddRestrictedGuestTableViewController *)self restrictedGuestItemManager];
  [v12 updateAccessSchedule:v6];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (HUAddRestrictedGuestItemManager)restrictedGuestItemManager
{
  return self->_restrictedGuestItemManager;
}

- (void)setRestrictedGuestItemManager:(id)a3
{
}

- (HUAddRestrictedGuestViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAddRestrictedGuestViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)accessoriesToAllow
{
  return self->_accessoriesToAllow;
}

- (void)setAccessoriesToAllow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesToAllow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_restrictedGuestItemManager, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end