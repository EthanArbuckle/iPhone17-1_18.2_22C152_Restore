@interface CARSettingsPanel
- (CARSettingsCellSpecifier)cellSpecifier;
- (CARSettingsPanel)initWithPanelController:(id)a3;
- (CARSettingsPanelController)panelController;
- (UIView)phoneView;
- (id)navigationItem;
- (id)title;
- (void)viewDidLoad;
@end

@implementation CARSettingsPanel

- (CARSettingsPanel)initWithPanelController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSettingsPanel;
  v5 = [(CARSettingsPanel *)&v9 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_panelController, v4);
    [v4 registerPanel:v6];
  }
  return v6;
}

- (id)title
{
  v2 = [(CARSettingsPanel *)self cellSpecifier];
  v3 = [v2 title];

  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CARSettingsPanel;
  [(CARSettingsPanel *)&v5 viewDidLoad];
  v3 = +[UIColor tableBackgroundColor];
  id v4 = [(CARSettingsPanel *)self view];
  [v4 setBackgroundColor:v3];
}

- (id)navigationItem
{
  v6.receiver = self;
  v6.super_class = (Class)CARSettingsPanel;
  v2 = [(CARSettingsPanel *)&v6 navigationItem];
  v3 = +[UIColor redColor];
  id v4 = [v2 titleView];
  [v4 setBackgroundColor:v3];

  return v2;
}

- (CARSettingsCellSpecifier)cellSpecifier
{
  return self->_cellSpecifier;
}

- (CARSettingsPanelController)panelController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panelController);

  return (CARSettingsPanelController *)WeakRetained;
}

- (UIView)phoneView
{
  return self->_phoneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneView, 0);
  objc_destroyWeak((id *)&self->_panelController);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end