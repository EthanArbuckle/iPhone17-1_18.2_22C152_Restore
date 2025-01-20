@interface ClarityUIAppSetupController
- (ClarityUIAppSetupController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 controller:(id)a6 identifier:(id)a7;
- (ClarityUIAppSetupController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 dataSource:(id)a6;
- (ClarityUIAppSetupControllerDelegate)delegate;
- (ClarityUISettingsDataSource)dataSource;
- (NSString)bundleIdentifier;
- (void)cancelButtonTapped:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ClarityUIAppSetupController

- (ClarityUIAppSetupController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 dataSource:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[ClarityUISettingsListController alloc] initWithDataSource:v11];
  v19.receiver = self;
  v19.super_class = (Class)ClarityUIAppSetupController;
  v16 = [(ClarityUIOnboardingSettingsWrapperController *)&v19 initWithTitle:v14 detailText:v13 icon:v12 controller:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_dataSource, a6);
    identifier = v16->_identifier;
    v16->_identifier = 0;
  }
  return v16;
}

- (ClarityUIAppSetupController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 controller:(id)a6 identifier:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ClarityUIAppSetupController;
  id v14 = [(ClarityUIOnboardingSettingsWrapperController *)&v17 initWithTitle:a3 detailText:a4 icon:a5 controller:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_identifier, a7);
  }

  return v15;
}

- (NSString)bundleIdentifier
{
  if (self->_dataSource)
  {
    v2 = [(ClarityUISettingsDataSource *)self->_dataSource bundleIdentifier];
  }
  else
  {
    v2 = self->_identifier;
  }

  return v2;
}

- (void)nextButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nextButtonTappedForAppSetupController:self];
}

- (void)cancelButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelButtonTappedForAppSetupController:self];
}

- (ClarityUISettingsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (ClarityUIAppSetupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ClarityUIAppSetupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end