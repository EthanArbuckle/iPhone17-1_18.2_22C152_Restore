@interface CNUnknownContactsController
+ (id)descriptorForRequiredKeys;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)multipleUnknownContactsViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (CNContactStore)contactStore;
- (CNUnknownContactsController)initWithContacts:(id)a3 contactStore:(id)a4;
- (CNUnknownContactsControllerDelegate)delegate;
- (NSArray)contacts;
- (UIViewController)displayedController;
- (id)viewController;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)multipleUnknownContactsViewControllerDidComplete:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedController:(id)a3;
@end

@implementation CNUnknownContactsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedController, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDisplayedController:(id)a3
{
}

- (UIViewController)displayedController
{
  return self->_displayedController;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setDelegate:(id)a3
{
}

- (CNUnknownContactsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUnknownContactsControllerDelegate *)WeakRetained;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  v5 = [(CNUnknownContactsController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNUnknownContactsController *)self delegate];
    [v7 unknownContactsControllerDidComplete:self];
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5 = a4;
  char v6 = [(CNUnknownContactsController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNUnknownContactsController *)self delegate];
    char v9 = [v8 unknownContactsController:self shouldPerformDefaultActionForContactProperty:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)multipleUnknownContactsViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5 = a4;
  char v6 = [(CNUnknownContactsController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNUnknownContactsController *)self delegate];
    char v9 = [v8 unknownContactsController:self shouldPerformDefaultActionForContactProperty:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)multipleUnknownContactsViewControllerDidComplete:(id)a3
{
  v4 = [(CNUnknownContactsController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNUnknownContactsController *)self delegate];
    [v6 unknownContactsControllerDidComplete:self];
  }
}

- (id)viewController
{
  v3 = [(CNUnknownContactsController *)self displayedController];
  if (!v3)
  {
    v4 = [(CNUnknownContactsController *)self contacts];
    unint64_t v5 = [v4 count];

    if (v5 < 2)
    {
      char v7 = [(CNUnknownContactsController *)self contacts];
      v8 = [v7 objectAtIndexedSubscript:0];
      v3 = +[CNContactViewController viewControllerForUnknownContact:v8];
    }
    else
    {
      id v6 = [CNMultipleUnknownContactsViewController alloc];
      char v7 = [(CNUnknownContactsController *)self contacts];
      v3 = [(CNMultipleUnknownContactsViewController *)v6 initWithContacts:v7];
    }

    char v9 = [(CNUnknownContactsController *)self contactStore];
    [(CNMultipleUnknownContactsViewController *)v3 setContactStore:v9];

    [(CNMultipleUnknownContactsViewController *)v3 setDelegate:self];
    [(CNUnknownContactsController *)self setDisplayedController:v3];
  }

  return v3;
}

- (CNUnknownContactsController)initWithContacts:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)CNUnknownContactsController;
    char v9 = [(CNUnknownContactsController *)&v13 init];
    if (v9)
    {
      if (v8) {
        v10 = (CNContactStore *)v8;
      }
      else {
        v10 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
      }
      contactStore = v9->_contactStore;
      v9->_contactStore = v10;

      objc_storeStrong((id *)&v9->_contacts, a3);
    }
  }
  else
  {

    char v9 = 0;
  }

  return v9;
}

+ (id)descriptorForRequiredKeys
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = +[CNContactViewController descriptorForRequiredKeys];
  v9[0] = v3;
  v4 = +[CNMultipleUnknownContactsViewController descriptorForRequiredKeys];
  v9[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [NSString stringWithUTF8String:"+[CNUnknownContactsController descriptorForRequiredKeys]"];
  id v7 = [v2 descriptorWithKeyDescriptors:v5 description:v6];

  return v7;
}

@end