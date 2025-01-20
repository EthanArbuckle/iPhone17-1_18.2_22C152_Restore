@interface DSSafetyResetCompletedController
- (DSNavigationDelegate)delegate;
- (DSSafetyResetCompletedController)init;
- (void)setDelegate:(id)a3;
- (void)skip;
- (void)viewDidLoad;
@end

@implementation DSSafetyResetCompletedController

- (DSSafetyResetCompletedController)init
{
  v3 = DSUILocStringForKey(@"SAFETY_RESET_COMPLETED");
  v4 = DSUILocStringForKey(@"SAFETY_RESET_COMPLETED_DETAIL");
  v5 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist"];
  v8.receiver = self;
  v8.super_class = (Class)DSSafetyResetCompletedController;
  v6 = [(DSSafetyResetCompletedController *)&v8 initWithTitle:v3 detailText:v4 icon:v5];

  return v6;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)DSSafetyResetCompletedController;
  [(DSOBWelcomeController *)&v14 viewDidLoad];
  v3 = DSUILocStringForKey(@"CONTINUE");
  v4 = [(DSSafetyResetCompletedController *)self delegate];
  id v5 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:v4 selector:sel_pushNextPane];

  v6 = DSUILocStringForKey(@"SKIP");
  id v7 = +[DSUIUtilities setUpLinkButtonForController:self title:v6 target:self selector:sel_skip];

  objc_super v8 = DSUILocStringForKey(@"EMERGENCY_CONTACTS");
  v9 = DSUILocStringForKey(@"EMERGENCY_CONTACTS_DETAIL");
  v10 = [MEMORY[0x263F827E8] systemImageNamed:@"1.circle.fill"];
  [(DSSafetyResetCompletedController *)self addBulletedListItemWithTitle:v8 description:v9 image:v10];

  v11 = DSUILocStringForKey(@"DEVICE_ACCESS");
  v12 = DSUILocStringForKey(@"DEVICE_ACCESS_DETAIL");
  v13 = [MEMORY[0x263F827E8] systemImageNamed:@"2.circle.fill"];
  [(DSSafetyResetCompletedController *)self addBulletedListItemWithTitle:v11 description:v12 image:v13];
}

- (void)skip
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