@interface HUMediaServiceSettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (HUMediaServiceSettingsItemModuleControllerDelegate)delegate;
- (unint64_t)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUMediaServiceSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = objc_opt_class();

  return (Class)v7;
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUMediaServiceSettingsItemModuleController;
  [(HUItemModuleController *)&v19 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [v9 latestResults];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v12 setTitleText:v14];

  [v12 setAccessoryType:1];
  v15 = [(HUItemModuleController *)self module];
  id v16 = [v15 defaultAccountsItem];

  if (v16 == v9)
  {
    [v12 setHideIcon:1];
    v17 = [v9 latestResults];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v12 setValueText:v18];
  }
  else
  {
    [v12 setHideIcon:0];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 defaultAccountsItem];
  if (v6 == v4)
  {
    v7 = [(HUMediaServiceSettingsItemModuleController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(HUMediaServiceSettingsItemModuleController *)self delegate];
      [v9 didSelectDefaultAccounts:self];
LABEL_7:

      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = [(HUMediaServiceSettingsItemModuleController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v9 = [(HUMediaServiceSettingsItemModuleController *)self delegate];
    [v9 mediaServiceSettingsItemModuleController:self didSelectMediaService:v4];
    goto LABEL_7;
  }
LABEL_8:

  return 0;
}

- (HUMediaServiceSettingsItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaServiceSettingsItemModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end