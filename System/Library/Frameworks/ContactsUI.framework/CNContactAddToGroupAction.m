@interface CNContactAddToGroupAction
+ (id)os_log;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6;
- (BOOL)groupPicker:(id)a3 shouldEnableGroupWithIdentifier:(id)a4;
- (CNContactStore)contactStore;
- (CNGroup)selectedGroup;
- (CNManagedConfiguration)managedConfiguration;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (NSArray)contactParentGroupIdentifiers;
- (NSArray)contactParentGroups;
- (UINavigationController)groupPickerNavigationViewController;
- (id)sourceAccountExternalIdentifiers;
- (void)groupPicker:(id)a3 didSelectGroup:(id)a4;
- (void)groupPickerDidCancel:(id)a3;
- (void)performActionWithSender:(id)a3;
- (void)setContactParentGroupIdentifiers:(id)a3;
- (void)setContactParentGroups:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setGroupPickerNavigationViewController:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setSelectedGroup:(id)a3;
@end

@implementation CNContactAddToGroupAction

+ (id)os_log
{
  if (os_log_cn_once_token_1_10308 != -1) {
    dispatch_once(&os_log_cn_once_token_1_10308, &__block_literal_global_10309);
  }
  v2 = (void *)os_log_cn_once_object_1_10310;

  return v2;
}

void __35__CNContactAddToGroupAction_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactAddToGroupAction");
  v1 = (void *)os_log_cn_once_object_1_10310;
  os_log_cn_once_object_1_10310 = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_groupPickerNavigationViewController, 0);
  objc_storeStrong((id *)&self->_contactParentGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedGroup, 0);
  objc_storeStrong((id *)&self->_contactParentGroups, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (void)setGroupPickerNavigationViewController:(id)a3
{
}

- (UINavigationController)groupPickerNavigationViewController
{
  return self->_groupPickerNavigationViewController;
}

- (void)setContactParentGroupIdentifiers:(id)a3
{
}

- (NSArray)contactParentGroupIdentifiers
{
  return self->_contactParentGroupIdentifiers;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setSelectedGroup:(id)a3
{
}

- (CNGroup)selectedGroup
{
  return self->_selectedGroup;
}

- (NSArray)contactParentGroups
{
  return self->_contactParentGroups;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6
{
  return 0;
}

- (void)groupPickerDidCancel:(id)a3
{
  id v5 = [(CNContactAction *)self delegate];
  v4 = [(CNContactAddToGroupAction *)self groupPickerNavigationViewController];
  [v5 action:self dismissViewController:v4 sender:self];
}

- (void)groupPicker:(id)a3 didSelectGroup:(id)a4
{
  [(CNContactAddToGroupAction *)self setSelectedGroup:a4];
  id v5 = [(CNContactAction *)self delegate];
  [v5 actionDidFinish:self];

  id v7 = [(CNContactAction *)self delegate];
  v6 = [(CNContactAddToGroupAction *)self groupPickerNavigationViewController];
  [v7 action:self dismissViewController:v6 sender:self];
}

- (BOOL)groupPicker:(id)a3 shouldEnableGroupWithIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactAddToGroupAction *)self contactParentGroupIdentifiers];
  char v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (id)sourceAccountExternalIdentifiers
{
  v3 = [(CNContactAddToGroupAction *)self managedConfiguration];
  int v4 = [v3 deviceHasManagementRestrictions];

  if (v4)
  {
    id v5 = [(CNContactAddToGroupAction *)self groupsAndContainersSaveManager];
    v6 = [(CNContactAction *)self contact];
    char v7 = [v5 parentAccountExternalIdentifiersForContact:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    int v4 = [CNUIGroupsAndContainersSaveManager alloc];
    id v5 = [(CNContactAddToGroupAction *)self contactStore];
    v6 = [(CNUIGroupsAndContainersSaveManager *)v4 initWithContactStore:v5];
    char v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }

  return groupsAndContainersSaveManager;
}

- (CNManagedConfiguration)managedConfiguration
{
  managedConfiguration = self->_managedConfiguration;
  if (!managedConfiguration)
  {
    int v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = [v4 bundleIdentifier];

    id v6 = objc_alloc(MEMORY[0x1E4F5A440]);
    char v7 = [MEMORY[0x1E4F5A448] sharedConnection];
    v8 = (CNManagedConfiguration *)[v6 initWithBundleIdentifier:v5 managedProfileConnection:v7];
    v9 = self->_managedConfiguration;
    self->_managedConfiguration = v8;

    managedConfiguration = self->_managedConfiguration;
  }

  return managedConfiguration;
}

- (void)setContactParentGroups:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contactParentGroups, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_contactParentGroups, a3);
    id v5 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_6);
    [(CNContactAddToGroupAction *)self setContactParentGroupIdentifiers:v5];
  }
}

uint64_t __52__CNContactAddToGroupAction_setContactParentGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactAddToGroupAction *)self contactStore];

  if (v5)
  {
    [(CNContactAddToGroupAction *)self setSelectedGroup:0];
    id v6 = [CNContactGroupPickerViewController alloc];
    char v7 = [(CNContactAddToGroupAction *)self contactStore];
    v8 = [(CNContactAddToGroupAction *)self sourceAccountExternalIdentifiers];
    v9 = [(CNContactGroupPickerViewController *)v6 initWithContactStore:v7 sourceAccountExternalIdentifiers:v8];

    [(CNContactGroupPickerViewController *)v9 setDelegate:self];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
    [(CNContactAddToGroupAction *)self setGroupPickerNavigationViewController:v10];
    v11 = [(CNContactAction *)self delegate];
    [v11 action:self presentViewController:v10 sender:v4];
  }
  else
  {
    v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "add to group action requires a contact store", v13, 2u);
    }
  }
}

@end