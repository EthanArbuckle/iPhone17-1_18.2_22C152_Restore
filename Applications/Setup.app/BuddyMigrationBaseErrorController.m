@interface BuddyMigrationBaseErrorController
- (BuddyMigrationBaseErrorController)initWithError:(id)a3;
- (NSError)error;
- (id)initForInsufficientSpace;
- (void)setError:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationBaseErrorController

- (BuddyMigrationBaseErrorController)initWithError:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  v4 = +[UIImage imageNamed:@"Alert Icon"];
  id v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)BuddyMigrationBaseErrorController;
  id v9 = [(BuddyMigrationBaseErrorController *)&v7 initWithTitle:&stru_1002B4E18 detailText:&stru_1002B4E18 icon:v4];
  objc_storeStrong(&v9, v9);

  if (v9) {
    objc_storeStrong((id *)v9 + 2, location[0]);
  }
  v5 = (BuddyMigrationBaseErrorController *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v5;
}

- (id)initForInsufficientSpace
{
  id location = self;
  v4[1] = (id)a2;
  v4[0] = +[NSError errorWithDomain:@"MBErrorDomain" code:106 userInfo:0];
  id location = [location initWithError:v4[0]];
  objc_storeStrong(&location, location);
  id v2 = location;
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationBaseErrorController;
  [(BuddyMigrationBaseErrorController *)&v6 viewDidLoad];
  id v2 = [(BuddyMigrationBaseErrorController *)v8 headerView];
  [v2 setIconInheritsTint:1];

  id v3 = +[UIColor redColor];
  id v4 = [(BuddyMigrationBaseErrorController *)v8 headerView];
  [v4 setTintColor:v3];

  id v5 = [(BuddyMigrationBaseErrorController *)v8 navigationItem];
  [v5 setHidesBackButton:1];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end