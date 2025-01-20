@interface CNUIFamilyMemberContactsController
+ (BOOL)isViewController:(id)a3 presentedByContactPicker:(id)a4;
- (CNContactPickerViewController)contactPickerViewController;
- (CNContactStore)familyMemberScopedContactStore;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreFamilyMemberContactsDataSource)dataSource;
- (CNUIFamilyMemberContactsController)init;
- (CNUIFamilyMemberContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4;
- (CNUIFamilyMemberContactsControllerDelegate)delegate;
- (CNUIFamilyMemberContactsPresentation)familyMemberContactsPresentation;
- (FAFamilyMember)familyMember;
- (id)anchorViewForAddContactsInteraction;
- (int64_t)countOfFamilyMemberContacts;
- (int64_t)fetchStatus;
- (void)addContactsOptionsSheetViewControllerDidSelectAddFromLocalContacts:(id)a3;
- (void)addContactsOptionsSheetViewControllerDidSelectAddNewContact:(id)a3;
- (void)cancelPresentationOfViewController:(id)a3;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dismissPresentedViewController:(id)a3;
- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4;
- (void)familyMemberContactItemsDidChange;
- (void)performAddContactsInteraction;
- (void)performAddFromMainContactsInteraction;
- (void)performDefaultInteraction;
- (void)performDisplayContactsInteraction;
- (void)performInteraction:(int64_t)a3;
- (void)pickerDidSelectAddNewContact:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setContactPickerViewController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNUIFamilyMemberContactsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactPickerViewController);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);

  objc_storeStrong((id *)&self->_familyMemberContactsPresentation, 0);
}

- (void)setContactPickerViewController:(id)a3
{
}

- (CNContactPickerViewController)contactPickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactPickerViewController);

  return (CNContactPickerViewController *)WeakRetained;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUICoreFamilyMemberContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNContactStore)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIFamilyMemberContactsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIFamilyMemberContactsControllerDelegate *)WeakRetained;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4
{
  id v9 = a4;
  uint64_t v6 = *MEMORY[0x1E4F5A258];
  v7 = *(uint64_t (**)(uint64_t, id))(*MEMORY[0x1E4F5A258] + 16);
  id v8 = a3;
  if (v7(v6, v9))
  {
    [(CNUIFamilyMemberContactsController *)self cancelPresentationOfViewController:v8];
  }
  else
  {
    [(CNUIFamilyMemberContactsController *)self dismissPresentedViewController:v8];

    id v8 = [(CNUIFamilyMemberContactsController *)self dataSource];
    [v8 updateListByAddingContacts:v9];
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  [(CNUIFamilyMemberContactsController *)self setContactPickerViewController:0];
  [(CNUIFamilyMemberContactsController *)self cancelPresentationOfViewController:v4];
}

- (void)pickerDidSelectAddNewContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIFamilyMemberContactsController *)self familyMember];
  id v9 = +[CNUIFamilyMemberControllerShared addContactsOptionsSheetForFamilyMember:v5 delegate:self];

  uint64_t v6 = [v4 addContactBarButtonItem];
  v7 = [v9 popoverPresentationController];
  [v7 setBarButtonItem:v6];

  id v8 = [v9 popoverPresentationController];
  [v8 setCanOverlapSourceViewRect:1];

  [v4 presentViewController:v9 animated:1 completion:0];
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = [a3 navigationController];
  [(CNUIFamilyMemberContactsController *)self dismissPresentedViewController:v5];
}

- (void)cancelPresentationOfViewController:(id)a3
{
  id v10 = a3;
  id v4 = objc_opt_class();
  id v5 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];
  LODWORD(v4) = [v4 isViewController:v10 presentedByContactPicker:v5];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
    uint64_t v6 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v7 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
    char v8 = objc_opt_respondsToSelector();

    id v9 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
    uint64_t v6 = v9;
    if (v8) {
      [v9 presentedViewControllerDidCancel:v10];
    }
    else {
      [v9 dismissPresentedViewController:v10];
    }
  }

LABEL_8:
}

- (void)dismissPresentedViewController:(id)a3
{
  id v7 = a3;
  id v4 = objc_opt_class();
  id v5 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];
  LODWORD(v4) = [v4 isViewController:v7 presentedByContactPicker:v5];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    uint64_t v6 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    uint64_t v6 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
    [v6 dismissPresentedViewController:v7];
  }

LABEL_6:
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];

  if (v5)
  {
    id v6 = [(CNUIFamilyMemberContactsController *)self contactPickerViewController];
    [v6 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id v6 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
    [v6 presentViewController:v4];
  }
}

- (void)addContactsOptionsSheetViewControllerDidSelectAddNewContact:(id)a3
{
  id v7 = +[CNContactViewController viewControllerForNewContact:0];
  [v7 setIgnoresParentalRestrictions:1];
  id v4 = [(CNUIFamilyMemberContactsController *)self familyMemberScopedContactStore];
  [v7 setContactStore:v4];

  [v7 setDisplayMode:2];
  [v7 setDelegate:self];
  id v5 = [MEMORY[0x1E4F5A660] propertyKeysContainingSenstiveData];
  [v7 setProhibitedPropertyKeys:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  [v6 setModalPresentationStyle:2];
  [(CNUIFamilyMemberContactsController *)self presentViewController:v6];
}

- (void)addContactsOptionsSheetViewControllerDidSelectAddFromLocalContacts:(id)a3
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v4 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  id v5 = [(CNUIFamilyMemberContactsController *)self familyMember];
  id v6 = +[CNUIFamilyMemberContactsEditingStrategy managedContactsStrategy];
  id v7 = [(CNUIFamilyMemberDowntimeContactPickerController *)v4 initWithChildFamilyMember:v5 allFamilyMembers:0 contactStore:v9 editingStrategy:v6 showingFamilyMemberContacts:0];

  [(CNUIFamilyMemberDowntimeContactPickerController *)v7 setShouldPreselectFamilyMemberContacts:[(CNUIFamilyMemberContactsController *)self countOfFamilyMemberContacts] == 0];
  [(CNUIFamilyMemberDowntimeContactPickerController *)v7 setDelegate:self];
  char v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  [v8 setModalPresentationStyle:2];
  [(CNUIFamilyMemberContactsController *)self presentViewController:v8];
}

- (id)anchorViewForAddContactsInteraction
{
  v3 = [(CNUIFamilyMemberContactsController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNUIFamilyMemberContactsController *)self delegate];
    id v6 = [v5 contactsController:self anchorViewForPresentationOfInteraction:1];
  }
  else
  {
    id v5 = [(id)*MEMORY[0x1E4FB2608] windows];
    id v7 = [v5 firstObject];
    char v8 = [v7 rootViewController];
    id v6 = [v8 view];
  }

  return v6;
}

- (void)performAddContactsInteraction
{
  v3 = [(CNUIFamilyMemberContactsController *)self familyMember];
  id v11 = +[CNUIFamilyMemberControllerShared addContactsOptionsSheetForFamilyMember:v3 delegate:self];

  char v4 = [(CNUIFamilyMemberContactsController *)self anchorViewForAddContactsInteraction];
  id v5 = [v11 popoverPresentationController];
  [v5 setSourceView:v4];

  [v4 bounds];
  double MidX = CGRectGetMidX(v13);
  [v4 bounds];
  double MinY = CGRectGetMinY(v14);
  char v8 = [v11 popoverPresentationController];
  objc_msgSend(v8, "setSourceRect:", MidX, MinY, 0.0, 0.0);

  id v9 = [v11 popoverPresentationController];
  [v9 setPermittedArrowDirections:2];

  id v10 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
  [v10 presentViewController:v11];
}

- (void)performAddFromMainContactsInteraction
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  char v4 = [(CNUIFamilyMemberContactsController *)self familyMember];
  id v5 = +[CNUIFamilyMemberContactsEditingStrategy managedContactsStrategy];
  id v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)v3 initWithChildFamilyMember:v4 allFamilyMembers:0 contactStore:v9 editingStrategy:v5 showingFamilyMemberContacts:0];

  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setShouldPreselectFamilyMemberContacts:[(CNUIFamilyMemberContactsController *)self countOfFamilyMemberContacts] == 0];
  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setDelegate:self];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v7 setModalPresentationStyle:2];
  char v8 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
  [v8 presentViewController:v7];
}

- (void)performDisplayContactsInteraction
{
  id v6 = objc_alloc_init(CNContactPickerViewController);
  [(CNContactPickerViewController *)v6 setDelegate:self];
  [(CNContactPickerViewController *)v6 setMode:2];
  [(CNContactPickerViewController *)v6 setAllowsEditing:1];
  [(CNContactPickerViewController *)v6 setAllowsDeletion:1];
  [(CNContactPickerViewController *)v6 setAllowsCancel:0];
  [(CNContactPickerViewController *)v6 setAllowsDone:1];
  [(CNContactPickerViewController *)v6 setIgnoresParentalRestrictions:1];
  v3 = [(CNUIFamilyMemberContactsController *)self familyMember];
  [(CNContactPickerViewController *)v6 setFamilyMember:v3];

  char v4 = [MEMORY[0x1E4F5A660] propertyKeysContainingSenstiveData];
  [(CNContactPickerViewController *)v6 setProhibitedPropertyKeys:v4];

  [(CNUIFamilyMemberContactsController *)self setContactPickerViewController:v6];
  id v5 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
  [v5 presentViewController:v6];
}

- (void)performDefaultInteraction
{
  if ([(CNUIFamilyMemberContactsController *)self fetchStatus] == 2
    && [(CNUIFamilyMemberContactsController *)self countOfFamilyMemberContacts] >= 1)
  {
    [(CNUIFamilyMemberContactsController *)self performDisplayContactsInteraction];
  }
  else
  {
    [(CNUIFamilyMemberContactsController *)self performAddContactsInteraction];
  }
}

- (void)performInteraction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(CNUIFamilyMemberContactsController *)self performDefaultInteraction];
      break;
    case 1:
      [(CNUIFamilyMemberContactsController *)self performAddContactsInteraction];
      break;
    case 2:
      [(CNUIFamilyMemberContactsController *)self performAddFromMainContactsInteraction];
      break;
    case 3:
      [(CNUIFamilyMemberContactsController *)self performDisplayContactsInteraction];
      break;
    default:
      return;
  }
}

- (void)familyMemberContactItemsDidChange
{
  id v2 = [(CNUIFamilyMemberContactsController *)self familyMemberContactsPresentation];
  [v2 familyMemberContactsDidChange];
}

- (int64_t)countOfFamilyMemberContacts
{
  id v2 = [(CNUIFamilyMemberContactsController *)self dataSource];
  v3 = [v2 countOfFamilyMemberContacts];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)fetchStatus
{
  id v2 = [(CNUIFamilyMemberContactsController *)self dataSource];
  int64_t v3 = +[CNUIFamilyMemberControllerShared contactsUIFetchStatusFromContactsUICoreFetchStatus:](CNUIFamilyMemberControllerShared, "contactsUIFetchStatusFromContactsUICoreFetchStatus:", [v2 fetchStatus]);

  return v3;
}

- (CNUIFamilyMemberContactsPresentation)familyMemberContactsPresentation
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CNUIFamilyMemberContactsController.m" lineNumber:70 description:@"communication with presentation should only take place on main thread"];
  }
  familyMemberContactsPresentation = self->_familyMemberContactsPresentation;

  return familyMemberContactsPresentation;
}

- (CNUIFamilyMemberContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = @"parameter ‘familyMember’ must be nonnull";
    goto LABEL_8;
  }
  id v9 = v8;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = @"parameter ‘familyMemberContactsPresentation’ must be nonnull";
LABEL_8:
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)CNUIFamilyMemberContactsController;
  id v10 = [(CNUIFamilyMemberContactsController *)&v24 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyMember, a3);
    objc_storeStrong((id *)&v11->_familyMemberContactsPresentation, a4);
    uint64_t v12 = [MEMORY[0x1E4F1B980] storeForFamilyMember:v7];
    familyMemberScopedContactStore = v11->_familyMemberScopedContactStore;
    v11->_familyMemberScopedContactStore = (CNContactStore *)v12;

    uint64_t v14 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    schedulerProvider = v11->_schedulerProvider;
    v11->_schedulerProvider = (CNSchedulerProvider *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F5A660]) initWithFamilyMember:v7 schedulerProvider:v11->_schedulerProvider];
    dataSource = v11->_dataSource;
    v11->_dataSource = (CNUICoreFamilyMemberContactsDataSource *)v16;

    [(CNUICoreFamilyMemberContactsDataSource *)v11->_dataSource setObserver:v11];
    v18 = v11;
  }

  return v11;
}

- (CNUIFamilyMemberContactsController)init
{
  id v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)isViewController:(id)a3 presentedByContactPicker:(id)a4
{
  if (a4) {
    BOOL v4 = a3 == a4;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

@end