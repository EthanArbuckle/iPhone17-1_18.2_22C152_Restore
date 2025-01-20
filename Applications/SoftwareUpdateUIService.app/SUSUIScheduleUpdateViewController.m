@interface SUSUIScheduleUpdateViewController
+ (id)majorOSVersionStringForBuildVersion:(id)a3;
- (SUSUIScheduleUpdateViewController)initWithDescriptor:(id)a3;
- (id)buildSUSettingsAction:(unint64_t)a3;
- (id)updateIcon;
- (void)cancellationDialogRemindMeLaterButtonTapped:(id)a3;
- (void)handleCancelButtonTapped:(id)a3;
- (void)handleUpdateNowButtonTapped:(id)a3;
- (void)handleUpdateTonightButtonTapped:(id)a3;
- (void)performUpdateNow;
- (void)performUpdateTonight;
- (void)remoteLaggardsUIHostingControllerWillCancelOperation:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation SUSUIScheduleUpdateViewController

- (SUSUIScheduleUpdateViewController)initWithDescriptor:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v29->_descriptor, location[0]);
  v13 = v29;
  v24 = +[NSBundle mainBundle];
  v23 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", @"SCHEDULE_UPDATE_SCREEN_TITLE");
  id v22 = [location[0] productSystemName];
  id v21 = [location[0] productVersion];
  id v20 = +[SUSUIScheduleUpdateViewController majorOSVersionStringForBuildVersion:](SUSUIScheduleUpdateViewController, "majorOSVersionStringForBuildVersion:");
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v22, v20);
  v18 = +[NSBundle mainBundle];
  id v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SCHEDULE_UPDATE_DESCRIPTION"];
  v16 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:");
  id v15 = [(SUSUIScheduleUpdateViewController *)v29 updateIcon];
  v29 = 0;
  v27.receiver = v13;
  v27.super_class = (Class)SUSUIScheduleUpdateViewController;
  v14 = -[SUSUIScheduleUpdateViewController initWithTitle:detailText:icon:](&v27, "initWithTitle:detailText:icon:", v19, v16);
  v29 = v14;
  objc_storeStrong((id *)&v29, v14);

  if (v14)
  {
    id v26 = +[OBBoldTrayButton boldButton];
    id v5 = v26;
    v7 = +[NSBundle mainBundle];
    v6 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", @"SCHEDULE_UPDATE_UPDATE_NOW_BUTTON");
    [v5 setTitle:forState:];

    [v26 addTarget:v29 action:@"handleUpdateNowButtonTapped:" forControlEvents:];
    id v8 = [(SUSUIScheduleUpdateViewController *)v29 buttonTray];
    [v8 addButton:v26];

    id v25 = +[OBLinkTrayButton linkButton];
    id v9 = v25;
    v11 = +[NSBundle mainBundle];
    v10 = [(NSBundle *)v11 localizedStringForKey:@"SCHEDULE_UPDATE_UPDATE_TONIGHT_BUTTON" value:&stru_100019720 table:@"SoftwareUpdateUIService"];
    [v9 setTitle:forState:];

    [v25 addTarget:v29 action:"handleUpdateTonightButtonTapped:" forControlEvents:64];
    id v12 = [(SUSUIScheduleUpdateViewController *)v29 buttonTray];
    [v12 addButton:v25];

    [(SUSUIScheduleUpdateViewController *)v29 becomeFirstResponder];
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  v4 = v29;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v29, 0);
  return v4;
}

- (void)handleUpdateNowButtonTapped:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v6, (uint64_t)"-[SUSUIScheduleUpdateViewController handleUpdateNowButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the update now button", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIScheduleUpdateViewController *)v5 performUpdateNow];
  objc_storeStrong(location, 0);
}

- (void)handleUpdateTonightButtonTapped:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v6, (uint64_t)"-[SUSUIScheduleUpdateViewController handleUpdateTonightButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the update tonight button", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIScheduleUpdateViewController *)v5 performUpdateTonight];
  objc_storeStrong(location, 0);
}

- (void)handleCancelButtonTapped:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v5, (uint64_t)"-[SUSUIScheduleUpdateViewController handleCancelButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the cancel button", v5, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)cancellationDialogRemindMeLaterButtonTapped:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)updateIcon
{
  id v4 = [(SUDescriptor *)self->_descriptor documentation];
  id v5 = [v4 iconImage];
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v11 = [(SUDescriptor *)self->_descriptor documentation];
    char v10 = 1;
    id v9 = [v11 iconImage];
    char v8 = 1;
    v2 = (UIImage *)v9;
  }
  else
  {
    v7 = +[UIImage systemImageNamed:@"gear" withConfiguration:0];
    char v6 = 1;
    v2 = v7;
  }
  v13 = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  return v13;
}

+ (id)majorOSVersionStringForBuildVersion:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  if (location[0])
  {
    id v7 = [location[0] componentsSeparatedByString:@"."];
    id v3 = [v7 firstObject];
    id v4 = v8;
    id v8 = v3;
  }
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (void)performUpdateNow
{
  v8[2] = self;
  v8[1] = (id)a2;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10000A3B4;
  id v7 = &unk_100018530;
  v8[0] = self;
  -[SUSUIScheduleUpdateViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

- (void)performUpdateTonight
{
  char v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)SUSUILogLaggardsUI();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v9[0];
    os_log_type_t type = v8;
    id v6 = [(SUSUIScheduleUpdateViewController *)v10 buildSUSettingsAction:1];
    id v7 = v6;
    sub_10000A54C((uint64_t)v11, (uint64_t)"-[SUSUIScheduleUpdateViewController performUpdateTonight]", (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s: Opening the Software Update Settings pane with URL: %@", v11, 0x16u);

    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  id v2 = [(SUSUIScheduleUpdateViewController *)v10 buildSUSettingsAction:2];
  [v3 openSensitiveURL:withOptions:];

  [(SUSUIScheduleUpdateViewController *)v10 dismissViewControllerAnimated:1 completion:0];
}

- (id)buildSUSettingsAction:(unint64_t)a3
{
  id location[3] = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  if (a3 == 1)
  {
    objc_storeStrong(location, @"SUSUIUpdateNowAction");
  }
  else
  {
    if (a3 != 2)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    objc_storeStrong(location, @"SUSUIUpdateTonightAction");
  }
  int v5 = +[NSString stringWithFormat:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK&PerformAction=%@", location[0]];
  id v7 = +[NSURL URLWithString:](NSURL, "URLWithString:");

LABEL_7:
  objc_storeStrong(location, 0);
  id v3 = v7;

  return v3;
}

- (void)remoteLaggardsUIHostingControllerWillCancelOperation:(id)a3 withCompletionBlock:(id)a4
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v9 = +[NSBundle mainBundle];
  os_log_type_t v8 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", @"SCHEDULE_UPDATE_CANCELLATION_TITLE");
  id v7 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SCHEDULE_UPDATE_CANCELLATION_DESCRIPTION"];
  int v5 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:");
  v29 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8);

  id v11 = +[NSBundle mainBundle];
  char v10 = [(NSBundle *)v11 localizedStringForKey:@"SCHEDULE_UPDATE_CANCELLATION_UPDATE_BUTTON" value:&stru_100019720 table:@"SoftwareUpdateUIService"];
  v22[1] = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  id v25 = sub_10000AC98;
  id v26 = &unk_100018A18;
  id v27 = v30;
  v28 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10);

  [(UIAlertController *)v29 addAction:v28];
  id v12 = v29;
  id v15 = +[NSBundle mainBundle];
  v14 = [(NSBundle *)v15 localizedStringForKey:@"SCHEDULE_UPDATE_CANCELLATION_UPDATE_REMIND_ME" value:&stru_100019720 table:@"SoftwareUpdateUIService"];
  v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_10000AD04;
  id v20 = &unk_100018A40;
  id v21 = v32;
  v22[0] = v30;
  v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0);
  -[UIAlertController addAction:](v12, "addAction:");

  [(UIAlertController *)v29 setPreferredAction:v28];
  [(SUSUIScheduleUpdateViewController *)v32 presentViewController:v29 animated:1 completion:0];
  objc_storeStrong(v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end