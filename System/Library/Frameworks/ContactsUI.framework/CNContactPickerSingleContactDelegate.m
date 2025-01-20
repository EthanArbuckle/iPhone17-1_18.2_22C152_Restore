@interface CNContactPickerSingleContactDelegate
- (CNContactPickerSingleContactDelegate)initWithTargetViewController:(id)a3;
- (CNLimitedAccessContactPickerViewController)targetViewController;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)setTargetViewController:(id)a3;
@end

@implementation CNContactPickerSingleContactDelegate

- (void).cxx_destruct
{
}

- (void)setTargetViewController:(id)a3
{
}

- (CNLimitedAccessContactPickerViewController)targetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetViewController);

  return (CNLimitedAccessContactPickerViewController *)WeakRetained;
}

- (void)contactPickerDidCancel:(id)a3
{
  p_targetViewController = &self->_targetViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_targetViewController);
  [WeakRetained contactPickerDidCancel:v4];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  p_targetViewController = &self->_targetViewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_targetViewController);
  [WeakRetained contactPicker:v7 didSelectContact:v6];
}

- (CNContactPickerSingleContactDelegate)initWithTargetViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactPickerSingleContactDelegate;
  v5 = [(CNContactPickerSingleContactDelegate *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetViewController, v4);
    id v7 = v6;
  }

  return v6;
}

@end