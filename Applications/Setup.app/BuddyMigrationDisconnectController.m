@interface BuddyMigrationDisconnectController
- (BuddyMigrationDisconnectController)initWithConnectionType:(int64_t)a3 cancel:(id)a4;
- (id)cancelBlock;
- (void)cancelTapped:(id)a3;
- (void)setCancelBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMigrationDisconnectController

- (BuddyMigrationDisconnectController)initWithConnectionType:(int64_t)a3 cancel:(id)a4
{
  id v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v13;
  id v13 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)BuddyMigrationDisconnectController;
  id v13 = [(BuddyMigrationBaseDisconnectController *)&v9 initWithConnectionType:v11];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    id v5 = objc_retainBlock(location);
    v6 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v5;
  }
  v7 = (BuddyMigrationDisconnectController *)v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v7;
}

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationDisconnectController;
  [(BuddyMigrationBaseDisconnectController *)&v5 viewDidLoad];
  v2 = v7;
  v3 = +[NSBundle mainBundle];
  id v4 = [(NSBundle *)v3 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"cancelTapped:"];
}

- (void)cancelTapped:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(void))[(BuddyMigrationDisconnectController *)v5 cancelBlock];
  v3[2](v3);

  objc_storeStrong(location, 0);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end