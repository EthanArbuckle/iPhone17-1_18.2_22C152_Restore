@interface DSPrivacyAdditionalActionsController
- (DSNavigationDelegate)delegate;
- (DSPrivacyAdditionalActionsController)init;
- (OBBoldTrayButton)boldButton;
- (void)back;
- (void)pushNextPane;
- (void)setBoldButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSPrivacyAdditionalActionsController

- (DSPrivacyAdditionalActionsController)init
{
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] systemBlueColor];
  v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = DSUILocStringForKey(@"APP_ACCESS_COMPLETE");
  v7 = DSUILocStringForKey(@"APP_ACCESS_COMPLETE_DETAIL");
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist.checked" withConfiguration:v5];
  v11.receiver = self;
  v11.super_class = (Class)DSPrivacyAdditionalActionsController;
  v9 = [(DSPrivacyAdditionalActionsController *)&v11 initWithTitle:v6 detailText:v7 icon:v8];

  return v9;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)DSPrivacyAdditionalActionsController;
  [(DSOBWelcomeController *)&v7 viewDidLoad];
  v3 = DSUILocStringForKey(@"CONTINUE");
  v4 = +[DSUIUtilities setUpBoldButtonForController:self title:v3 target:self selector:sel_pushNextPane];
  [(DSPrivacyAdditionalActionsController *)self setBoldButton:v4];

  v5 = DSUILocStringForKey(@"REVIEW_MORE_APPS");
  id v6 = +[DSUIUtilities setUpLinkButtonForController:self title:v5 target:self selector:sel_back];
}

- (void)back
{
  id v3 = [(DSPrivacyAdditionalActionsController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = [(DSPrivacyAdditionalActionsController *)self boldButton];
  [v3 hidesBusyIndicator];
}

- (void)pushNextPane
{
  id v3 = [(DSPrivacyAdditionalActionsController *)self boldButton];
  [v3 showsBusyIndicator];

  id v4 = [(DSPrivacyAdditionalActionsController *)self delegate];
  [v4 pushNextPane];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end