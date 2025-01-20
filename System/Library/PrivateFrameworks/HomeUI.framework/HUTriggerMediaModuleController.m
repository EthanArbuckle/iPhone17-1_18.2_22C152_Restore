@interface HUTriggerMediaModuleController
- (Class)cellClassForItem:(id)a3;
- (HUTriggerMediaModuleControllerDelegate)delegate;
- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4;
- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUTriggerMediaModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 mediaRowItem];

  if (v6 == v4)
  {
    v7 = objc_opt_class();
  }
  else
  {
    v7 = 0;
  }

  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(HUItemModuleController *)self module];
  v8 = [v7 mediaRowItem];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = v11;
    [v10 setAccessoryType:1];
    [v10 setHideIcon:1];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = [(HUItemModuleController *)self module];
  v5 = [v4 triggerBuilder];
  id v6 = [v5 triggerActionSets];
  v7 = [v6 anonymousActionSetBuilder];

  v8 = [[HUMediaSelectionViewController alloc] initWithActionSetBuilder:v7];
  [(HUMediaSelectionViewController *)v8 setDelegate:self];
  int v9 = [(HUTriggerMediaModuleController *)self delegate];
  [v9 mediaModuleController:self pushViewController:v8];

  return 0;
}

- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4
{
  return +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:a4];
}

- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3
{
  return @"HUTriggerMediaActionPlayUnavailableMessage";
}

- (HUTriggerMediaModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerMediaModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end