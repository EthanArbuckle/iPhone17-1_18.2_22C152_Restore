@interface BYODContactPickerController
+ (id)log;
- (BYODContactPickerController)initWithNavBarTitle:(id)a3 rightButtonBarText:(id)a4;
- (BYODContactPickerControllerDelegate)delegate;
- (UIViewController)chooseContactViewController;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (id)searchController:(id)a3 tintColorForRecipient:(id)a4;
- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4;
- (void)_contactSelected;
- (void)_prepareInviteButton;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BYODContactPickerController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2F648;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D73C8 != -1) {
    dispatch_once(&qword_D73C8, block);
  }
  v2 = (void *)qword_D73C0;

  return v2;
}

- (BYODContactPickerController)initWithNavBarTitle:(id)a3 rightButtonBarText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BYODContactPickerController;
  v8 = [(BYODContactPickerController *)&v15 init];
  if (v8)
  {
    v9 = (CNAutocompleteSearchController *)[objc_alloc((Class)CNAutocompleteSearchController) initWithSearchType:1];
    contactSearchController = v8->_contactSearchController;
    v8->_contactSearchController = v9;

    [(CNAutocompleteSearchController *)v8->_contactSearchController setDelegate:v8];
    v11 = [(CNAutocompleteSearchController *)v8->_contactSearchController navigationItem];
    [v11 setTitle:v6];

    v12 = objc_opt_new();
    [v12 setTitle:v7];
    [v12 setTarget:v8];
    [v12 setAction:"_contactSelected"];
    v13 = [(CNAutocompleteSearchController *)v8->_contactSearchController navigationItem];
    [v13 setRightBarButtonItem:v12];

    [(BYODContactPickerController *)v8 _prepareInviteButton];
  }

  return v8;
}

- (UIViewController)chooseContactViewController
{
  return (UIViewController *)self->_contactSearchController;
}

- (void)_contactSelected
{
  id v5 = [(BYODContactPickerController *)self delegate];
  v3 = [(CNAutocompleteSearchController *)self->_contactSearchController recipients];
  v4 = [v3 firstObject];
  [v5 chooseContactController:self didSelectContact:v4];
}

- (void)_prepareInviteButton
{
  id v5 = [(CNAutocompleteSearchController *)self->_contactSearchController recipients];
  v3 = (char *)[v5 count];

  id v6 = [(CNAutocompleteSearchController *)self->_contactSearchController navigationItem];
  v4 = [v6 rightBarButtonItem];
  [v4 setEnabled:v3 == (unsigned char *)&dword_0 + 1];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[BYODContactPickerController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "extracting handle and type for contact: %@", buf, 0xCu);
  }

  v9 = [v7 phoneNumbers];
  if ([v9 count] == (char *)&dword_0 + 1)
  {
    v10 = [v7 emailAddresses];
    BOOL v11 = [v10 count] == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  v12 = [v7 phoneNumbers];
  if ([v12 count])
  {

    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  v13 = [v7 emailAddresses];
  v14 = (char *)[v13 count];

  if (v11)
  {
LABEL_10:
    objc_super v15 = [v7 phoneNumbers];
    v16 = [v15 firstObject];
    v17 = [v16 value];
    v18 = [v17 stringValue];

    v19 = +[BYODContactPickerController log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v18;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "extracted phone number: %@", buf, 0xCu);
    }
    uint64_t v20 = 1;
    goto LABEL_13;
  }
  if (v14 != (unsigned char *)&dword_0 + 1)
  {
LABEL_18:
    v18 = 0;
    uint64_t v20 = 5;
    goto LABEL_19;
  }
  v21 = [v7 emailAddresses];
  v22 = [v21 firstObject];
  v18 = [v22 value];

  v19 = +[BYODContactPickerController log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v18;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "extracted email number: %@", buf, 0xCu);
  }
  uint64_t v20 = 0;
LABEL_13:

LABEL_19:
  id v23 = [objc_alloc((Class)CNComposeRecipient) initWithContact:v7 address:v18 kind:v20];
  id v25 = v23;
  v24 = +[NSArray arrayWithObjects:&v25 count:1];
  [(CNAutocompleteSearchController *)self->_contactSearchController setRecipients:v24];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 stringValue];
    uint64_t v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = 0;
    }
    else
    {
      id v9 = 0;
      uint64_t v10 = 5;
    }
  }
  id v11 = objc_alloc((Class)CNComposeRecipient);
  v12 = [v7 contact];
  id v13 = [v11 initWithContact:v12 address:v9 kind:v10];

  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [(CNAutocompleteSearchController *)self->_contactSearchController setRecipients:v14];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v4 = a4;
  if ((unint64_t)[v4 kind] >= 2)
  {
    id v5 = +[UIColor systemGrayColor];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  id v5 = +[BYODContactPickerController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "creating contact for address in recepient: %@", (uint8_t *)&v9, 0xCu);
  }

  if ([v4 _appearsToBeEmail])
  {
    uint64_t v6 = 0;
  }
  else if ([v4 _appearsToBePhoneNumber])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 5;
  }
  id v7 = [objc_alloc((Class)CNComposeRecipient) initWithContact:0 address:v4 kind:v6];

  return v7;
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v5 = objc_alloc_init((Class)CNContactPickerViewController);
  uint64_t v6 = +[NSPredicate predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
  [v5 setPredicateForEnablingContact:v6];

  id v7 = +[NSPredicate predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
  [v5 setPredicateForSelectionOfContact:v7];

  v8 = +[NSPredicate predicateWithFormat:@"(property == 'emailAddresses') OR (property == 'phoneNumbers')"];
  [v5 setPredicateForSelectionOfProperty:v8];

  v12[0] = CNContactEmailAddressesKey;
  v12[1] = CNContactPhoneNumbersKey;
  int v9 = +[NSArray arrayWithObjects:v12 count:2];
  [v5 setDisplayedPropertyKeys:v9];

  [v5 setDelegate:self];
  id v10 = [(BYODContactPickerController *)self chooseContactViewController];
  id v11 = [v10 navigationController];
  [v11 presentViewController:v5 animated:1 completion:0];
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  return (unint64_t)objc_msgSend(a4, "kind", a3) > 1;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recipients];
  id v9 = [v8 count];

  if ((unint64_t)v9 >= 2)
  {
    id v11 = v7;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [v6 setRecipients:v10];
  }
  [(BYODContactPickerController *)self _prepareInviteButton];
}

- (BYODContactPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BYODContactPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactSearchController, 0);
}

@end