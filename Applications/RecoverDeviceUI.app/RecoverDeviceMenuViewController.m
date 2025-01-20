@interface RecoverDeviceMenuViewController
- (NSMutableArray)options;
- (NSString)deviceType;
- (RecoverDeviceMenuViewController)initWithOptions:(int)a3 forDevice:(id)a4;
- (id)subtitleForOption:(int)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)titleForOption:(int)a3;
- (int)selectedOption;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)initOptions:(int)a3;
- (void)setDeviceType:(id)a3;
- (void)setOptions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation RecoverDeviceMenuViewController

- (void)initOptions:(int)a3
{
  char v3 = a3;
  v5 = +[NSMutableArray array];
  [(RecoverDeviceMenuViewController *)self setOptions:v5];

  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v7 = [(RecoverDeviceMenuViewController *)self options];
    [v7 addObject:&off_10001DC70];

    if ((v3 & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  v6 = [(RecoverDeviceMenuViewController *)self options];
  [v6 addObject:&off_10001DC58];

  if ((v3 & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v3 & 4) == 0) {
    return;
  }
LABEL_7:
  id v8 = [(RecoverDeviceMenuViewController *)self options];
  [v8 addObject:&off_10001DC88];
}

- (RecoverDeviceMenuViewController)initWithOptions:(int)a3 forDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RecoverDeviceMenuViewController;
  v7 = [(RecoverDeviceMenuViewController *)&v18 initWithStyle:0];
  id v8 = v7;
  if (v7)
  {
    [(RecoverDeviceMenuViewController *)v7 setDeviceType:v6];
    [(RecoverDeviceMenuViewController *)v8 initOptions:v4];
    v9 = [(RecoverDeviceMenuViewController *)v8 tableView];
    [v9 setAllowsSelection:1];

    v10 = objc_opt_new();
    v11 = [(RecoverDeviceMenuViewController *)v8 tableView];
    [v11 setTableFooterView:v10];

    v12 = [(RecoverDeviceMenuViewController *)v8 tableView];
    [v12 setSectionFooterHeight:1.0];

    v13 = +[UIColor secondarySystemBackgroundColor];
    v14 = [(RecoverDeviceMenuViewController *)v8 tableView];
    [v14 setBackgroundColor:v13];

    v15 = [(RecoverDeviceMenuViewController *)v8 tableView];
    v16 = [v15 layer];
    [v16 setCornerRadius:10.0];
  }
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(RecoverDeviceMenuViewController *)self options];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)titleForOption:(int)a3
{
  switch(a3)
  {
    case 4:
      char v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MENU_REBOOT_BUTTON_TITLE";
      goto LABEL_7;
    case 2:
      char v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MENU_EACS_BUTTON_TITLE";
      goto LABEL_7;
    case 1:
      char v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MENU_SYSTEM_RECOVERY_BUTTON_TITLE";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_10001C720 table:@"Localizable"];

      goto LABEL_9;
  }
  id v6 = @"unknown";
LABEL_9:

  return v6;
}

- (id)subtitleForOption:(int)a3
{
  switch(a3)
  {
    case 4:
      uint64_t v4 = +[NSBundle mainBundle];
      uint64_t v5 = [(RecoverDeviceMenuViewController *)self deviceType];
      id v6 = (void *)v5;
      CFStringRef v7 = @"MENU_REBOOT_BUTTON_SUBTITLE";
      goto LABEL_7;
    case 2:
      uint64_t v4 = +[NSBundle mainBundle];
      uint64_t v5 = [(RecoverDeviceMenuViewController *)self deviceType];
      id v6 = (void *)v5;
      CFStringRef v7 = @"MENU_EACS_BUTTON_SUBTITLE";
      goto LABEL_7;
    case 1:
      uint64_t v4 = +[NSBundle mainBundle];
      uint64_t v5 = [(RecoverDeviceMenuViewController *)self deviceType];
      id v6 = (void *)v5;
      CFStringRef v7 = @"SYSTEM_RECOVERY_SUBTITLE";
LABEL_7:
      id v8 = +[NSString stringWithFormat:@"%@_%@", v7, v5];
      v9 = [v4 localizedStringForKey:v8 value:&stru_10001C720 table:@"Localizable"];

      goto LABEL_9;
  }
  v9 = @"unknown option";
LABEL_9:

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RecoverDeviceMenuViewController *)self options];
  CFStringRef v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  id v8 = [v7 intValue];

  id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  v10 = +[UIListContentConfiguration subtitleCellConfiguration];
  v11 = [(RecoverDeviceMenuViewController *)self titleForOption:v8];
  [v10 setText:v11];

  v12 = [v10 textProperties];
  v13 = [v12 font];
  [v13 pointSize];
  v14 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v15 = [v10 textProperties];
  [v15 setFont:v14];

  v16 = [(RecoverDeviceMenuViewController *)self subtitleForOption:v8];
  [v10 setSecondaryText:v16];

  v17 = +[UIColor systemGrayColor];
  objc_super v18 = [v10 secondaryTextProperties];
  [v18 setColor:v17];

  [v10 setTextToSecondaryTextVerticalPadding:6.0];
  [v10 setDirectionalLayoutMargins:10.0, 10.0, 10.0, 10.0];
  [v9 setContentConfiguration:v10];
  id v19 = objc_alloc((Class)UIImageView);
  v20 = +[UIImage systemImageNamed:@"circle"];
  id v21 = [v19 initWithImage:v20];

  v22 = +[UIColor systemGrayColor];
  [v21 setTintColor:v22];

  [v9 setAccessoryView:v21];
  v23 = +[UIBackgroundConfiguration clearConfiguration];
  [v9 setBackgroundConfiguration:v23];

  v24 = (char *)[v5 row];
  v25 = [(RecoverDeviceMenuViewController *)self options];
  v26 = (char *)[v25 count] - 1;

  if (v24 == v26)
  {
    [v9 bounds];
    [v9 setSeparatorInset:0.0, v27, 0.0, 0.0];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = objc_alloc((Class)UIImageView);
  v10 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
  id v11 = [v9 initWithImage:v10];
  v12 = [v6 cellForRowAtIndexPath:v7];
  [v12 setAccessoryView:v11];

  id v13 = objc_alloc((Class)UIImageView);
  v14 = +[UIImage systemImageNamed:@"circle"];
  id v15 = [v13 initWithImage:v14];

  v16 = +[UIColor systemGrayColor];
  [v15 setTintColor:v16];

  v17 = [(RecoverDeviceMenuViewController *)v8 tableView];
  objc_super v18 = [v17 indexPathsForSelectedRows];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v24 = [v23 row:v27];
        if (v24 != [v7 row])
        {
          v25 = [(RecoverDeviceMenuViewController *)v8 tableView];
          [v25 deselectRowAtIndexPath:v23 animated:1];

          v26 = [v6 cellForRowAtIndexPath:v23];
          [v26 setAccessoryView:v15];
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }

  objc_sync_exit(v8);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  return 0;
}

- (int)selectedOption
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(RecoverDeviceMenuViewController *)v2 options];
  uint64_t v4 = [(RecoverDeviceMenuViewController *)v2 tableView];
  id v5 = [v4 indexPathForSelectedRow];
  id v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  int v7 = [v6 intValue];

  objc_sync_exit(v2);
  return v7;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)RecoverDeviceMenuViewController;
  [(RecoverDeviceMenuViewController *)&v15 viewIsAppearing:a3];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(RecoverDeviceMenuViewController *)v4 tableView];
  id v6 = [v5 indexPathsForSelectedRows];

  if (!v6)
  {
    int v7 = [(RecoverDeviceMenuViewController *)v4 tableView];
    id v8 = +[NSIndexPath indexPathForRow:0 inSection:0];
    [v7 selectRowAtIndexPath:v8 animated:0 scrollPosition:1];

    id v9 = objc_alloc((Class)UIImageView);
    v10 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
    id v11 = [v9 initWithImage:v10];
    v12 = [(RecoverDeviceMenuViewController *)v4 tableView];
    id v13 = +[NSIndexPath indexPathForRow:0 inSection:0];
    v14 = [v12 cellForRowAtIndexPath:v13];
    [v14 setAccessoryView:v11];
  }
  objc_sync_exit(v4);
}

- (NSMutableArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end