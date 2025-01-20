@interface iFBAPreferencesTimeoutViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)rowForTimeout:(int64_t)a3;
- (int64_t)timeoutForRow:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iFBAPreferencesTimeoutViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesTimeoutViewController;
  [(iFBAPreferencesTimeoutViewController *)&v4 viewDidLoad];
  v3 = [(iFBAPreferencesTimeoutViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"TimeoutCell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)iFBAPreferencesTimeoutViewController;
  [(iFBAPreferencesTimeoutViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"TOUCH_ID_REQUIRE" value:&stru_1000F6658 table:0];
  v6 = [(iFBAPreferencesTimeoutViewController *)self navigationItem];
  [v6 setTitle:v5];

  if (+[iFBKUtils deviceSupportsFaceID])
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"FACE_ID_REQUIRE" value:&stru_1000F6658 table:0];
    v9 = [(iFBAPreferencesTimeoutViewController *)self navigationItem];
    [v9 setTitle:v8];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v9 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v6 row];

  [v9 setInteger:[self timeoutForRow:v8] forKey:@"TouchIDTimeoutDuration"];
  [v7 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"TimeoutCell"];
  id v8 = +[UIListContentConfiguration cellConfiguration];
  id v9 = sub_10003FB10(-[iFBAPreferencesTimeoutViewController timeoutForRow:](self, "timeoutForRow:", [v6 row]));
  [v8 setText:v9];

  [v7 setContentConfiguration:v8];
  objc_super v10 = +[NSUserDefaults standardUserDefaults];
  id v11 = [v10 integerForKey:@"TouchIDTimeoutDuration"];

  int64_t v12 = [(iFBAPreferencesTimeoutViewController *)self rowForTimeout:v11];
  id v13 = [v6 row];

  if ((id)v12 == v13) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v7 setAccessoryType:v14];

  return v7;
}

- (int64_t)rowForTimeout:(int64_t)a3
{
  int64_t result = a3;
  if (a3 > 299)
  {
    if (a3 == 300) {
      return 2;
    }
    if (a3 == 900) {
      return 3;
    }
  }
  else
  {
    if (!a3) {
      return result;
    }
    if (a3 == 60) {
      return 1;
    }
  }
  return -1;
}

- (int64_t)timeoutForRow:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1000D7960[a3 - 1];
  }
}

@end