@interface DDReminderCreationController
- (BOOL)isAllDayDueDate;
- (BOOL)wantsExtendedDetailOnlyView;
- (CLLocation)location;
- (DDReminderCreationController)initWithAction:(id)a3 delegate:(id)a4;
- (DDReminderViewController)delegate;
- (NSAttributedString)notes;
- (NSAttributedString)title;
- (NSDateComponents)dueDateComponents;
- (NSString)locationString;
- (NSURL)url;
- (NSUserActivity)userActivity;
- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5;
- (void)setTitle:(id)a3;
@end

@implementation DDReminderCreationController

- (DDReminderCreationController)initWithAction:(id)a3 delegate:(id)a4
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = 0;
  objc_storeStrong(&v47, a4);
  v4 = v49;
  v49 = 0;
  v46.receiver = v4;
  v46.super_class = (Class)DDReminderCreationController;
  v49 = [(DDReminderCreationController *)&v46 init];
  objc_storeStrong((id *)&v49, v49);
  if (v49)
  {
    objc_storeWeak((id *)&v49->_delegate, v47);
    if (!v49->_group)
    {
      dispatch_group_t v5 = dispatch_group_create();
      group = v49->_group;
      v49->_group = (OS_dispatch_group *)v5;
    }
    if (!v49->_updaterQueue)
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.MobileDataDetectors.serviceActionReminder", 0);
      updaterQueue = v49->_updaterQueue;
      v49->_updaterQueue = (OS_dispatch_queue *)v7;
    }
    id v45 = [location[0] associatedResults];
    [location[0] associatedResults];
    id v26 = [location[0] context];
    id v25 = [v47 _hostApplicationBundleIdentifier];
    id v44 = (id)DDUIAugmentedContextForEvent();

    v9 = (NSDateComponents *)sub_100015C58(v45, v44, &v49->_isAllDay);
    reminderDueDateComponents = v49->_reminderDueDateComponents;
    v49->_reminderDueDateComponents = v9;

    if (v49->_reminderDueDateComponents)
    {
      id v43 = sub_10001556C(v45, v44);
      if (v43)
      {
        [(DDReminderCreationController *)v49 setTitle:v43];
        objc_storeStrong((id *)&v49->_backupReminderTitle, v49->_reminderTitle);
      }
      id v23 = [v47 _hostApplicationBundleIdentifier];
      LOBYTE(v24) = 0;
      if (sub_10001145C(v23)) {
        int v24 = _DDUICalendarIsTitleGenerationUsed() ^ 1;
      }

      if (v24)
      {
        id v42 = sub_100015238(v45, v44);
        if ([v42 length])
        {
          objc_initWeak(&from, v49);
          id v40 = +[SGSuggestionsService serviceForReminders];
          if (v40)
          {
            id v39 = v49->_group;
            dispatch_group_enter((dispatch_group_t)v39);
            id v22 = v40;
            id v21 = v42;
            v32 = _NSConcreteStackBlock;
            int v33 = -1073741824;
            int v34 = 0;
            v35 = sub_1000114B8;
            v36 = &unk_100020A60;
            objc_copyWeak(&v38, &from);
            id v37 = v39;
            [v22 reminderTitleForContent:v21 withCompletion:&v32];
            objc_storeStrong(&v37, 0);
            objc_destroyWeak(&v38);
            objc_storeStrong(&v39, 0);
          }
          else
          {
            id v31 = &_os_log_default;
            char v30 = 16;
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
            {
              log = v31;
              os_log_type_t type = v30;
              sub_100005458(v29);
              _os_log_error_impl((void *)&_mh_execute_header, log, type, "Failed to get serviceForReminders", v29, 2u);
            }
            objc_storeStrong(&v31, 0);
          }
          objc_storeStrong(&v40, 0);
          objc_destroyWeak(&from);
        }
        id v28 = sub_100015618(v45, v44);
        if (v28)
        {
          v11 = (NSAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:v28];
          reminderNotes = v49->_reminderNotes;
          v49->_reminderNotes = v11;
        }
        v13 = (NSString *)sub_10001598C(v45, v44);
        reminderLocation = v49->_reminderLocation;
        v49->_reminderLocation = v13;

        v15 = (NSUserActivity *)(id)sub_100015EAC(v45, v44);
        reminderUserActivity = v49->_reminderUserActivity;
        v49->_reminderUserActivity = v15;

        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v42, 0);
      }
      objc_storeStrong(&v43, 0);
    }
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
  }
  v18 = v49;
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v49, 0);
  return v18;
}

- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  [WeakRetained setCancellable:1];

  [location[0] dismissViewControllerAnimated:1 completion:0];
  id v9 = objc_loadWeakRetained((id *)&v13->_delegate);
  id v8 = [v9 _remoteViewControllerProxy];
  [v8 actionDidFinishShouldDismiss:1];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)setTitle:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v6 = &off_100021328;
    id v3 = objc_alloc((Class)NSAttributedString);
    v4 = (NSAttributedString *)[v3 initWithString:location[0] attributes:v6];
    reminderTitle = v8->_reminderTitle;
    v8->_reminderTitle = v4;

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (NSAttributedString)title
{
  group = self->_group;
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(group, v2)) {
    v6 = self->_backupReminderTitle;
  }
  else {
    v6 = self->_reminderTitle;
  }

  return v6;
}

- (NSAttributedString)notes
{
  return self->_reminderNotes;
}

- (NSURL)url
{
  return 0;
}

- (NSDateComponents)dueDateComponents
{
  return self->_reminderDueDateComponents;
}

- (BOOL)isAllDayDueDate
{
  return self->_isAllDay;
}

- (CLLocation)location
{
  return 0;
}

- (NSString)locationString
{
  return self->_reminderLocation;
}

- (NSUserActivity)userActivity
{
  return self->_reminderUserActivity;
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return 1;
}

- (DDReminderViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DDReminderViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end