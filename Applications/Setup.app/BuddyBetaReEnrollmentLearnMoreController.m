@interface BuddyBetaReEnrollmentLearnMoreController
- (BuddyBetaReEnrollmentLearnMoreController)init;
- (void)_doneTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyBetaReEnrollmentLearnMoreController

- (BuddyBetaReEnrollmentLearnMoreController)init
{
  id location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v9[0] = [(NSBundle *)v2 localizedStringForKey:@"ABOUT_APPLE_SOFTWARE_BETA_PROGRAM_TITLE" value:&stru_1002B4E18 table:@"BetaReEnrollment"];

  v3 = +[NSBundle mainBundle];
  id v8 = [(NSBundle *)v3 localizedStringForKey:@"ABOUT_APPLE_SOFTWARE_BETA_PROGRAM_DETAIL" value:&stru_1002B4E18 table:@"BetaReEnrollment"];

  id v4 = location;
  id location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyBetaReEnrollmentLearnMoreController;
  id location = [(BuddyBetaReEnrollmentLearnMoreController *)&v7 initWithTitle:v9[0] detailText:v8 icon:0];
  objc_storeStrong(&location, location);
  v5 = (BuddyBetaReEnrollmentLearnMoreController *)location;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyBetaReEnrollmentLearnMoreController;
  [(BuddyBetaReEnrollmentLearnMoreController *)&v7 viewDidLoad];
  id v2 = objc_alloc((Class)UIBarButtonItem);
  v3 = +[NSBundle mainBundle];
  id v4 = [(NSBundle *)v3 localizedStringForKey:@"DONE" value:&stru_1002B4E18 table:@"Localizable"];
  id v5 = [v2 initWithTitle:v4 style:2 target:v9 action:"_doneTapped:"];
  id v6 = [(BuddyBetaReEnrollmentLearnMoreController *)v9 navigationItem];
  [v6 setRightBarButtonItem:v5];
}

- (void)_doneTapped:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyBetaReEnrollmentLearnMoreController *)v5 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  objc_storeStrong(location, 0);
}

@end