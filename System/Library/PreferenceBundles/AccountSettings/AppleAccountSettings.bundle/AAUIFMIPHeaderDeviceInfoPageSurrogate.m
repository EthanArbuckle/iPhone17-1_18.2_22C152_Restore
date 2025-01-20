@interface AAUIFMIPHeaderDeviceInfoPageSurrogate
- (AAUIFMIPHeaderDeviceInfoPageDelegate)delegate;
- (AAUIFMIPHeaderDeviceInfoPageSurrogate)initWithPage:(id)a3 device:(id)a4 appleAccount:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_dateStringOfLatestBackup:(id)a3;
- (id)_footerForBackupRow;
- (id)backupForUDID:(id)a3 backupList:(id)a4;
- (id)cellWithTag:(int64_t)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)fetchBackupWithCompletion:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)refreshBackupDetailText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDetailLabelWithBackup:(id)a3;
@end

@implementation AAUIFMIPHeaderDeviceInfoPageSurrogate

- (AAUIFMIPHeaderDeviceInfoPageSurrogate)initWithPage:(id)a3 device:(id)a4 appleAccount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AAUIFMIPHeaderDeviceInfoPageSurrogate;
  v12 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a4);
    objc_storeStrong((id *)&v13->_remoteUIPage, a3);
    v14 = [v9 tableViewOM];
    uint64_t v15 = [v14 tableView];
    remoteTableView = v13->_remoteTableView;
    v13->_remoteTableView = (UITableView *)v15;

    uint64_t v17 = [v9 tableViewOM];
    remoteTableViewController = v13->_remoteTableViewController;
    v13->_remoteTableViewController = (UITableViewDelegate *)v17;

    objc_storeStrong((id *)&v13->_appleAccount, a5);
    [(UITableView *)v13->_remoteTableView setDataSource:v13];
    [(UITableView *)v13->_remoteTableView setDelegate:v13];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.appleaccount.backup_list", v19);
    backupListQueue = v13->_backupListQueue;
    v13->_backupListQueue = (OS_dispatch_queue *)v20;
  }
  return v13;
}

- (void)dealloc
{
  remoteTableView = self->_remoteTableView;
  if (remoteTableView)
  {
    [(UITableView *)remoteTableView setDataSource:0];
    [(UITableView *)self->_remoteTableView setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)AAUIFMIPHeaderDeviceInfoPageSurrogate;
  [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)&v4 dealloc];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:self->_remoteTableViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AAUIFMIPHeaderDeviceInfoPageSurrogate;
    [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)&v5 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIFMIPHeaderDeviceInfoPageSurrogate;
  objc_super v5 = -[AAUIFMIPHeaderDeviceInfoPageSurrogate methodSignatureForSelector:](&v7, "methodSignatureForSelector:");
  if (!v5)
  {
    objc_super v5 = [(UITableViewDelegate *)self->_remoteTableViewController methodSignatureForSelector:a3];
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)AAUIFMIPHeaderDeviceInfoPageSurrogate;
  return [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)&v6 respondsToSelector:a3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(UITableViewDelegate *)self->_remoteTableViewController tableView:a3 numberOfRowsInSection:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(UITableViewDelegate *)self->_remoteTableViewController numberOfSectionsInTableView:a3];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      objc_super v7 = [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 viewForHeaderInSection:a4];
    }
    else
    {
      v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Creating a device info header view", v13, 2u);
      }

      id v9 = [AAUIDeviceInfoHeaderView alloc];
      device = self->_device;
      id v11 = [(RUIPage *)self->_remoteUIPage style];
      objc_super v7 = [(AAUIDeviceInfoHeaderView *)v9 initWithDevice:device style:v11];
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  double v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [v8 _bodyLeading];
      double v7 = v9;
    }
    else
    {
      +[AAUIDeviceInfoHeaderView desiredHeight];
      double v7 = v10;
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  double v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 heightForHeaderInSection:a4];
      double v7 = v8;
    }
    else
    {
      double v7 = UITableViewAutomaticDimension;
    }
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  if (self->_remoteTableView == v6)
  {
    if (!a4
      && [(AATrustedDevice *)self->_device showBackupRow]
      && [(ACAccount *)self->_appleAccount aa_isPrimaryAccount])
    {
      uint64_t v8 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self _footerForBackupRow];
    }
    else
    {
      uint64_t v8 = [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 titleForFooterInSection:a4];
    }
    double v7 = (void *)v8;
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_footerForBackupRow
{
  v3 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self _dateStringOfLatestBackup:0];
  id v4 = [(AATrustedDevice *)self->_device rawLatestBackup];

  if (v4)
  {
    objc_super v5 = [(AATrustedDevice *)self->_device rawLatestBackup];
    [v5 doubleValue];
    double v7 = v6 / 1000.0;

    uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:v7];
    uint64_t v9 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self _dateStringOfLatestBackup:v8];

    v3 = (void *)v9;
  }
  if (([(AATrustedDevice *)self->_device currentDevice] & 1) == 0)
  {
    double v10 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self cellWithTag:1002];
    id v11 = [v10 detailTextLabel];
    [v11 setText:0];

    [v10 setActivityIndicatorVisible:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1C1F4;
    v14[3] = &unk_75AE0;
    id v15 = v10;
    v16 = self;
    id v12 = v10;
    [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self fetchBackupWithCompletion:v14];
  }

  return v3;
}

- (id)cellWithTag:(int64_t)a3
{
  return [(UITableView *)self->_remoteTableView viewWithTag:a3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(AATrustedDevice *)self->_device currentDevice])
  {
    double v7 = [v10 cellForRowAtIndexPath:v6];
    uint64_t v8 = (char *)[v7 tag];
    if (v8 == &stru_3D8.segname[2])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained userTappedBackup];
    }
    else
    {
      if (v8 != &stru_3D8.segname[1])
      {
LABEL_7:

        goto LABEL_8;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained userTappedFMIP];
    }

    goto LABEL_7;
  }
LABEL_8:
  [(UITableViewDelegate *)self->_remoteTableViewController tableView:v10 didSelectRowAtIndexPath:v6];
}

- (id)_dateStringOfLatestBackup:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"LAST_ICLOUD_BACKUP" value:&stru_76890 table:@"Localizable"];

  if (v3)
  {
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    if (objc_msgSend(v3, "aaf_isToday"))
    {
      [v6 setTimeStyle:1];
      [v6 setDateStyle:0];
    }
    else
    {
      uint64_t v8 = +[NSLocale currentLocale];
      uint64_t v9 = [v8 localeIdentifier];
      unsigned int v10 = [v9 isEqualToString:@"en_US"];

      [v6 setDoesRelativeDateFormatting:1];
      if (v10)
      {
        [v6 setDateStyle:1];
        id v11 = objc_alloc_init((Class)NSDateFormatter);
        [v11 setTimeStyle:1];
        id v12 = +[NSBundle bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"DATE_AT_TIME" value:&stru_76890 table:@"Localizable"];
        v14 = [v6 stringFromDate:v3];
        id v15 = [v11 stringFromDate:v3];
        v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14, v15);
        uint64_t v17 = [v5 stringByAppendingString:v16];

        objc_super v5 = v12;
        goto LABEL_10;
      }
      [v6 setDateStyle:3];
      [v6 setTimeStyle:1];
    }
    uint64_t v7 = [v6 stringFromDate:v3];
  }
  else
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"NEVER_BACKED_UP" value:&stru_76890 table:@"Localizable"];
  }
  id v11 = (id)v7;
  uint64_t v17 = [v5 stringByAppendingString:v7];
LABEL_10:

  return v17;
}

- (void)fetchBackupWithCompletion:(id)a3
{
  id v4 = a3;
  backupListQueue = self->_backupListQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C660;
  v7[3] = &unk_75888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(backupListQueue, v7);
}

- (id)backupForUDID:(id)a3 backupList:(id)a4
{
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 backupUUID];
        unsigned int v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          v16 = _AAUILogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Found matching backupUUID", v18, 2u);
          }

          id v15 = v11;
          v14 = v6;
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "No peer backup info found.", v18, 2u);
  }
  id v15 = 0;
LABEL_15:

  return v15;
}

- (void)updateDetailLabelWithBackup:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 hasBackupEnabledState])
    {
      unsigned int v6 = [v5 isBackupEnabled];
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = v7;
      if (v6) {
        CFStringRef v9 = @"ON";
      }
      else {
        CFStringRef v9 = @"OFF";
      }
    }
    else
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = v7;
      CFStringRef v9 = @"UNKNOWN";
    }
    unsigned int v10 = [v7 localizedStringForKey:v9 value:&stru_76890 table:@"Localizable"];

    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_495DC((uint64_t)v10, v11);
    }

    [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self refreshBackupDetailText:v10];
  }
}

- (void)refreshBackupDetailText:(id)a3
{
  id v7 = a3;
  id v4 = [(AAUIFMIPHeaderDeviceInfoPageSurrogate *)self cellWithTag:1002];
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 detailTextLabel];
    [v6 setText:v7];
  }
}

- (AAUIFMIPHeaderDeviceInfoPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUIFMIPHeaderDeviceInfoPageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backupListQueue, 0);
  objc_storeStrong((id *)&self->_remoteClientInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_remoteUIPage, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_remoteTableView, 0);

  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end