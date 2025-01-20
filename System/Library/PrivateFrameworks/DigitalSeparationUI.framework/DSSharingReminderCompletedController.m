@interface DSSharingReminderCompletedController
- (DSNavigationDelegate)delegate;
- (DSSharingReminderCompletedController)init;
- (void)done;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSSharingReminderCompletedController

- (DSSharingReminderCompletedController)init
{
  v3 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist"];
  v6.receiver = self;
  v6.super_class = (Class)DSSharingReminderCompletedController;
  v4 = [(DSSharingReminderCompletedController *)&v6 initWithTitle:&stru_26E9097D0 detailText:&stru_26E9097D0 icon:v3];

  return v4;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)DSSharingReminderCompletedController;
  [(DSOBWelcomeController *)&v23 viewDidLoad];
  v3 = [(DSSharingReminderCompletedController *)self delegate];
  v4 = [(DSSharingReminderCompletedController *)v3 unpairedComputers];
  uint64_t v5 = [v4 count];

  objc_super v6 = [(DSSharingReminderCompletedController *)self headerView];
  if (v5)
  {
    v7 = DSUILocStringForKey(@"SHARING_REMINDER_WIFI_SYNC_TITLE_CHANGED");
    [v6 setTitle:v7];

    v8 = [(DSSharingReminderCompletedController *)self headerView];
    v9 = DSUILocStringForKey(@"SHARING_REMINDER_WIFI_SYNC_DETAIL_CHANGED");
    [v8 setDetailText:v9];

    v10 = DSUILocStringForKey(@"CONTINUE");
    id v11 = +[DSUIUtilities setUpBoldButtonForController:self title:v10 target:v3 selector:sel_goToCustomizeSharing];

    v12 = DSUILocStringForKey(@"DONE");
    v13 = sel_done;
    v14 = self;
    v15 = v12;
    v16 = self;
  }
  else
  {
    v17 = DSUILocStringForKey(@"SHARING_REMINDER_WIFI_SYNC_TITLE_NO_CHANGE");
    [v6 setTitle:v17];

    v18 = [(DSSharingReminderCompletedController *)self headerView];
    v19 = DSUILocStringForKey(@"SHARING_REMINDER_WIFI_SYNC_DETAIL_NO_CHANGE");
    [v18 setDetailText:v19];

    v20 = DSUILocStringForKey(@"DONE");
    id v21 = +[DSUIUtilities setUpBoldButtonForController:self title:v20 target:self selector:sel_done];

    v12 = DSUILocStringForKey(@"SHARING_REMINDER_EXPLORE");
    v13 = sel_goToCustomizeSharing;
    v14 = self;
    v15 = v12;
    v16 = v3;
  }
  id v22 = +[DSUIUtilities setUpLinkButtonForController:v14 title:v15 target:v16 selector:v13];
}

- (void)done
{
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end