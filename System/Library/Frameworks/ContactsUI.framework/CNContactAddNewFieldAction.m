@interface CNContactAddNewFieldAction
- (CNContactGroupPickerDelegate)groupPickerDelegate;
- (NSArray)prohibitedPropertyKeys;
- (void)performActionWithSender:(id)a3;
- (void)setGroupPickerDelegate:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
@end

@implementation CNContactAddNewFieldAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupPickerDelegate);

  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

- (void)setGroupPickerDelegate:(id)a3
{
}

- (CNContactGroupPickerDelegate)groupPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupPickerDelegate);

  return (CNContactGroupPickerDelegate *)WeakRetained;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  v13 = objc_alloc_init(CNContactPropertyGroupPickerViewController);
  v5 = CNContactsUIBundle();
  v6 = [v5 localizedStringForKey:@"ADD_MORE_PROPERTIES_NAV_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNContactPropertyGroupPickerViewController *)v13 setTitle:v6];

  v7 = [(CNContactAddNewFieldAction *)self prohibitedPropertyKeys];
  [(CNContactPropertyGroupPickerViewController *)v13 setProhibitedPropertyKeys:v7];

  v8 = [(CNContactAddNewFieldAction *)self groupPickerDelegate];
  [(CNContactPropertyGroupPickerViewController *)v13 setGroupPickerDelegate:v8];

  v9 = [(CNContactAction *)self contact];
  [(CNContactPropertyGroupPickerViewController *)v13 setContact:v9];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
  v11 = [v10 navigationBar];
  objc_msgSend(v11, "_cnui_applyContactStyle");

  v12 = [(CNContactAction *)self delegate];
  [v12 action:self presentViewController:v10 sender:v4];
}

@end