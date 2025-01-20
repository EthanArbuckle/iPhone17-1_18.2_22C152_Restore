@interface BuddyAppleIDSpinnerPage
- (BuddyAppleIDSpinnerPage)init;
- (BuddyAppleIDSpinnerPage)initWithAccountMode:(unint64_t)a3;
- (BuddyAppleIDSpinnerPageDelegate)spinnerDelegate;
- (id)initForSilentAuthentication;
- (void)loadView;
- (void)setSpinnerDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyAppleIDSpinnerPage

- (BuddyAppleIDSpinnerPage)init
{
  SEL v8 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"SIGN_IN_APPLE_ID_WORDY" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAppleIDSpinnerPage;
  id location = [(BuddyAppleIDSpinnerPage *)&v7 initWithSpinnerText:v4];
  v5 = (BuddyAppleIDSpinnerPage *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (BuddyAppleIDSpinnerPage)initWithAccountMode:(unint64_t)a3
{
  id v17 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      v9 = +[NSBundle mainBundle];
      v10 = [(NSBundle *)v9 localizedStringForKey:@"UPGRADING_ICLOUD_WORDY" value:&stru_1002B4E18 table:@"Localizable"];
      id v11 = location[0];
      location[0] = v10;

      break;
    case 1uLL:
    case 2uLL:
      v3 = +[NSBundle mainBundle];
      v4 = [(NSBundle *)v3 localizedStringForKey:@"SIGN_IN_APPLE_ID_WORDY" value:&stru_1002B4E18 table:@"Localizable"];
      id v5 = location[0];
      location[0] = v4;

      break;
    case 4uLL:
      v6 = +[NSBundle mainBundle];
      objc_super v7 = [(NSBundle *)v6 localizedStringForKey:@"UPGRADING_APPLE_ID_WORDY" value:&stru_1002B4E18 table:@"Localizable"];
      id v8 = location[0];
      location[0] = v7;

      break;
    default:
      break;
  }
  id v12 = v17;
  id v17 = 0;
  v15.receiver = v12;
  v15.super_class = (Class)BuddyAppleIDSpinnerPage;
  id v17 = [(BuddyAppleIDSpinnerPage *)&v15 initWithSpinnerText:location[0]];
  v13 = (BuddyAppleIDSpinnerPage *)v17;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v13;
}

- (id)initForSilentAuthentication
{
  SEL v9 = a2;
  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SIGN_IN_APPLE_ID_WORDY_SILENT"];
  id v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyAppleIDSpinnerPage;
  id location = [(BuddyAppleIDSpinnerPage *)&v8 initWithSpinnerText:v5];
  id v6 = location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAppleIDSpinnerPage;
  [(BuddyAppleIDSpinnerPage *)&v4 loadView];
  id v2 = [(BuddyAppleIDSpinnerPage *)v6 navigationItem];
  [v2 setTitle:&stru_1002B4E18];

  id v3 = [(BuddyAppleIDSpinnerPage *)v6 navigationItem];
  [v3 setHidesBackButton:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDSpinnerPage;
  [(BuddyAppleIDSpinnerPage *)&v6 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_spinnerDelegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&v9->_spinnerDelegate);
    [v5 buddyAppleIDSpinnerPageDidAppear:v9];
  }
}

- (BuddyAppleIDSpinnerPageDelegate)spinnerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerDelegate);

  return (BuddyAppleIDSpinnerPageDelegate *)WeakRetained;
}

- (void)setSpinnerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end