@interface DSRemoteUIController
- (DSNavigationDelegate)delegate;
- (DSRemoteUIController)init;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation DSRemoteUIController

- (DSRemoteUIController)init
{
  v3 = DSUILocStringForKey(@"REMOTE_UI");
  v4 = DSUILocStringForKey(@"REMOTE_UI_DETAIL");
  v7.receiver = self;
  v7.super_class = (Class)DSRemoteUIController;
  v5 = [(DSRemoteUIController *)&v7 initWithTitle:v3 detailText:v4 icon:0];

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)DSRemoteUIController;
  [(OBBaseWelcomeController *)&v6 viewDidLoad];
  v3 = DSUILocStringForKey(@"CONTINUE");
  v4 = [(DSRemoteUIController *)self delegate];
  id v5 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:v4 selector:sel_pushNextPane];
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