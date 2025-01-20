@interface CNUIFamilyMemberWhitelistedContactsController
+ (id)contactPickerWithDelegate:(id)a3 familyMember:(id)a4 parentContainer:(id)a5;
- (BOOL)contactManagementEnabled;
- (CNContactFormatter)contactCardWarningFormatter;
- (CNContactStore)familyMemberScopedContactStore;
- (CNContactViewController)contactViewControllerPresentingItemDetails;
- (CNDowntimeWhitelistContainerFetching)downtimeContaienerFetcher;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactManagementConsentCheck)contactManagentConsentCheck;
- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource;
- (CNUIFamilyMemberContactsPresentation)familyMemberContactsPresentation;
- (CNUIFamilyMemberWhitelistedContactsController)init;
- (CNUIFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4;
- (CNUIFamilyMemberWhitelistedContactsControllerDelegate)delegate;
- (FAFamilyMember)familyMember;
- (NSArray)familyMemberContactItems;
- (id)anchorViewForDefaultInteraction;
- (id)generateContactSourceOptionSheet;
- (id)warningMessageForContact:(id)a3;
- (int64_t)fetchStatus;
- (void)addContactsToWhitelist:(id)a3;
- (void)addContactsToWhitelistOptionsSheetDidCancel:(id)a3;
- (void)cancelPresentationOfDetailsOfFamilyMemberContactItem:(id)a3;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contactViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:(id)a3;
- (void)deleteFamilyMemberContactItem:(id)a3;
- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4;
- (void)familyMemberContactItemsDidChange;
- (void)performAddFromFamilyMemberContacts;
- (void)performAddFromMainContacts;
- (void)performAddFromMainContactsForFamilyMember;
- (void)performAddFromMainContactsForThisDevice;
- (void)performAddNewContact;
- (void)performDefaultInteraction;
- (void)performInteraction:(int64_t)a3;
- (void)presentDetailsOfFamilyMemberContactItem:(id)a3;
- (void)setContactViewControllerPresentingItemDetails:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNUIFamilyMemberWhitelistedContactsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactViewControllerPresentingItemDetails);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContaienerFetcher, 0);
  objc_storeStrong((id *)&self->_contactManagentConsentCheck, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactCardWarningFormatter, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);

  objc_storeStrong((id *)&self->_familyMemberContactsPresentation, 0);
}

- (void)setContactViewControllerPresentingItemDetails:(id)a3
{
}

- (CNContactViewController)contactViewControllerPresentingItemDetails
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactViewControllerPresentingItemDetails);

  return (CNContactViewController *)WeakRetained;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContaienerFetcher
{
  return self->_downtimeContaienerFetcher;
}

- (CNUICoreContactManagementConsentCheck)contactManagentConsentCheck
{
  return self->_contactManagentConsentCheck;
}

- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNContactFormatter)contactCardWarningFormatter
{
  return self->_contactCardWarningFormatter;
}

- (CNContactStore)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIFamilyMemberWhitelistedContactsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIFamilyMemberWhitelistedContactsControllerDelegate *)WeakRetained;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)addContactsToWhitelist:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  [v5 updateWhitelistByAddingContacts:v4];
}

- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4
{
  id v11 = a4;
  uint64_t v6 = *MEMORY[0x1E4F5A258];
  v7 = *(unsigned int (**)(uint64_t, id))(*MEMORY[0x1E4F5A258] + 16);
  id v8 = a3;
  if (!v7(v6, v11)) {
    [(CNUIFamilyMemberWhitelistedContactsController *)self addContactsToWhitelist:v11];
  }
  v9 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  v10 = [v8 navigationController];

  [v9 dismissPresentedViewController:v10];
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  v7 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v7 dismissPresentedViewController:v6];

  [(CNUIFamilyMemberWhitelistedContactsController *)self addContactsToWhitelist:v8];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  char v6 = objc_opt_respondsToSelector();

  v7 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  id v8 = v7;
  if (v6) {
    [v7 presentedViewControllerDidCancel:v4];
  }
  else {
    [v7 dismissPresentedViewController:v4];
  }
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v5 = a3;
  id v7 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  char v6 = [v5 navigationController];

  [v7 dismissPresentedViewController:v6];
}

- (void)contactViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  char v6 = [v4 navigationController];
  [v5 dismissPresentedViewController:v6];

  id v7 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  id v8 = [v4 contact];

  v10[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v7 updateWhitelistByRemovingContacts:v9];
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  v9 = [v7 navigationController];

  [v8 dismissPresentedViewController:v9];
  if (v6 && ([MEMORY[0x1E4F1B9C8] isWhitelistedContact:v6] & 1) == 0)
  {
    v11[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(CNUIFamilyMemberWhitelistedContactsController *)self addContactsToWhitelist:v10];
  }
}

- (void)addContactsToWhitelistOptionsSheetDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v5 dismissPresentedViewController:v4];
}

- (void)performAddNewContact
{
  id v9 = +[CNContactViewController viewControllerForNewContact:0];
  [v9 setIgnoresParentalRestrictions:1];
  v3 = [MEMORY[0x1E4F5A668] propertyKeysContainingSenstiveData];
  [v9 setProhibitedPropertyKeys:v3];

  [v9 setDisplayMode:2];
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberScopedContactStore];
  [v9 setContactStore:v4];

  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self downtimeContaienerFetcher];
  id v6 = [v5 downtimeWhitelistContainer];
  [v9 setParentContainer:v6];

  [v9 setDelegate:self];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  id v8 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v8 presentViewController:v7];
}

- (void)performAddFromFamilyMemberContacts
{
  id v11 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberScopedContactStore];
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
  id v5 = +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy];
  id v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)v3 initWithChildFamilyMember:v4 allFamilyMembers:0 contactStore:v11 editingStrategy:v5 showingFamilyMemberContacts:1];

  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setDelegate:self];
  uint64_t v7 = *MEMORY[0x1E4F5A258];
  id v8 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactItems];
  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setShouldPreselectFamilyMemberContacts:(*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8)];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v9 setModalPresentationStyle:2];
  v10 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v10 presentViewController:v9];
}

- (void)performAddFromMainContactsForThisDevice
{
  v3 = objc_opt_class();
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self downtimeContaienerFetcher];
  id v5 = [v4 downtimeWhitelistContainer];
  id v7 = [v3 contactPickerWithDelegate:self familyMember:0 parentContainer:v5];

  id v6 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v6 presentViewController:v7];
}

- (void)performAddFromMainContactsForFamilyMember
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
  id v5 = +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy];
  id v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)v3 initWithChildFamilyMember:v4 allFamilyMembers:0 contactStore:v11 editingStrategy:v5 showingFamilyMemberContacts:0];

  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setDelegate:self];
  uint64_t v7 = *MEMORY[0x1E4F5A258];
  id v8 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactItems];
  [(CNUIFamilyMemberDowntimeContactPickerController *)v6 setShouldPreselectFamilyMemberContacts:(*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8)];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v9 setModalPresentationStyle:2];
  v10 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v10 presentViewController:v9];
}

- (void)performAddFromMainContacts
{
  v3 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];

  if (v3)
  {
    [(CNUIFamilyMemberWhitelistedContactsController *)self performAddFromMainContactsForFamilyMember];
  }
  else
  {
    [(CNUIFamilyMemberWhitelistedContactsController *)self performAddFromMainContactsForThisDevice];
  }
}

- (id)anchorViewForDefaultInteraction
{
  v3 = [(CNUIFamilyMemberWhitelistedContactsController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self delegate];
    id v6 = [v5 whitelistedContactsController:self anchorViewForPresentationOfInteraction:0];
  }
  else
  {
    id v5 = [(id)*MEMORY[0x1E4FB2608] windows];
    uint64_t v7 = [v5 firstObject];
    id v8 = [v7 rootViewController];
    id v6 = [v8 view];
  }

  return v6;
}

- (id)generateContactSourceOptionSheet
{
  v3 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
  char v4 = +[CNUIFamilyMemberControllerShared addContactsToWhitelistOptionsSheetForFamilyMember:v3 offerChooseFromFamilyMemberContactsOption:[(CNUIFamilyMemberWhitelistedContactsController *)self contactManagementEnabled] delegate:self];

  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self anchorViewForDefaultInteraction];
  id v6 = [v4 popoverPresentationController];
  [v6 setSourceView:v5];

  [v5 bounds];
  double MidX = CGRectGetMidX(v13);
  [v5 bounds];
  double MinY = CGRectGetMinY(v14);
  id v9 = [v4 popoverPresentationController];
  objc_msgSend(v9, "setSourceRect:", MidX, MinY, 0.0, 0.0);

  v10 = [v4 popoverPresentationController];
  [v10 setPermittedArrowDirections:2];

  return v4;
}

- (void)performDefaultInteraction
{
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  v3 = [(CNUIFamilyMemberWhitelistedContactsController *)self generateContactSourceOptionSheet];
  [v4 presentViewController:v3];
}

- (void)performInteraction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(CNUIFamilyMemberWhitelistedContactsController *)self performDefaultInteraction];
      break;
    case 1:
      [(CNUIFamilyMemberWhitelistedContactsController *)self performAddFromMainContacts];
      break;
    case 2:
      [(CNUIFamilyMemberWhitelistedContactsController *)self performAddFromFamilyMemberContacts];
      break;
    case 3:
      [(CNUIFamilyMemberWhitelistedContactsController *)self performAddNewContact];
      break;
    default:
      return;
  }
}

- (void)deleteFamilyMemberContactItem:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  id v6 = objc_alloc(MEMORY[0x1E4F5A658]);
  uint64_t v7 = [v4 contactIdentifier];

  id v8 = (void *)[v6 initWithContactIdentifier:v7];
  id v9 = [v5 contactRepresentingItem:v8];

  if (v9)
  {
    v10 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
    v12[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v10 updateWhitelistByRemovingContacts:v11];
  }
}

- (void)cancelPresentationOfDetailsOfFamilyMemberContactItem:(id)a3
{
  id v6 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  id v4 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactViewControllerPresentingItemDetails];
  id v5 = [v4 navigationController];
  [v6 dismissPresentedViewController:v5];
}

- (id)warningMessageForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];

  if (v5)
  {
    id v6 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactCardWarningFormatter];
    uint64_t v7 = [v6 stringFromContact:v4];

    id v8 = NSString;
    id v9 = CNContactsUIBundle();
    v10 = [v9 localizedStringForKey:@"DOWNTIME_PICKER_CONTACT_CARD_WARNING" value:&stru_1ED8AC728 table:@"Localized"];
    id v11 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
    v12 = [v11 firstName];
    CGRect v13 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
    CGRect v14 = [v13 firstName];
    v15 = objc_msgSend(v8, "stringWithFormat:", v10, v12, v7, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)presentDetailsOfFamilyMemberContactItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  id v6 = objc_alloc(MEMORY[0x1E4F5A658]);
  uint64_t v7 = [v4 contactIdentifier];

  id v8 = (void *)[v6 initWithContactIdentifier:v7];
  id v21 = [v5 contactRepresentingItem:v8];

  if (v21)
  {
    id v9 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberScopedContactStore];
    v10 = +[CNUIFamilyMemberControllerShared contactViewControllerForContact:v21 fromStore:v9];

    [(CNUIFamilyMemberWhitelistedContactsController *)self setContactViewControllerPresentingItemDetails:v10];
    id v11 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactViewControllerPresentingItemDetails];
    [v11 setDelegate:self];

    v12 = [(CNUIFamilyMemberWhitelistedContactsController *)self warningMessageForContact:v21];
    CGRect v13 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactViewControllerPresentingItemDetails];
    [v13 setWarningMessage:v12];

    CGRect v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPresentationOfDetailsOfFamilyMemberContactItem_];
    v15 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactViewControllerPresentingItemDetails];
    v16 = [v15 navigationItem];
    [v16 setLeftBarButtonItem:v14];

    id v17 = objc_alloc(MEMORY[0x1E4FB19E8]);
    v18 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactViewControllerPresentingItemDetails];
    v19 = (void *)[v17 initWithRootViewController:v18];

    v20 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
    [v20 presentViewController:v19];
  }
}

- (BOOL)contactManagementEnabled
{
  v3 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5A380]);
    id v5 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMember];
    id v6 = (void *)[v4 initWithFamilyMember:v5];
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = [(CNUIFamilyMemberWhitelistedContactsController *)self contactManagentConsentCheck];
  uint64_t v8 = [v7 contactManagementConsentStateOfDelegateWithInfo:v6];

  return v8 == 3;
}

- (void)familyMemberContactItemsDidChange
{
  id v2 = [(CNUIFamilyMemberWhitelistedContactsController *)self familyMemberContactsPresentation];
  [v2 familyMemberContactsDidChange];
}

- (NSArray)familyMemberContactItems
{
  id v2 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  v3 = [v2 familyMemberContactItems];
  id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_52357);

  return (NSArray *)v4;
}

- (int64_t)fetchStatus
{
  id v2 = [(CNUIFamilyMemberWhitelistedContactsController *)self dataSource];
  int64_t v3 = +[CNUIFamilyMemberControllerShared contactsUIFetchStatusFromContactsUICoreFetchStatus:](CNUIFamilyMemberControllerShared, "contactsUIFetchStatusFromContactsUICoreFetchStatus:", [v2 fetchStatus]);

  return v3;
}

- (CNUIFamilyMemberContactsPresentation)familyMemberContactsPresentation
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CNUIFamilyMemberWhitelistedContactsController.m" lineNumber:99 description:@"communication with presentation should only take place on main thread"];
  }
  familyMemberContactsPresentation = self->_familyMemberContactsPresentation;

  return familyMemberContactsPresentation;
}

- (CNUIFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"parameter ‘familyMemberContactsPresentation’ must be nonnull" userInfo:0];
    objc_exception_throw(v30);
  }
  id v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)CNUIFamilyMemberWhitelistedContactsController;
  v10 = [(CNUIFamilyMemberWhitelistedContactsController *)&v31 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyMember, a3);
    objc_storeStrong((id *)&v11->_familyMemberContactsPresentation, a4);
    uint64_t v12 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    schedulerProvider = v11->_schedulerProvider;
    v11->_schedulerProvider = (CNSchedulerProvider *)v12;

    if (v11->_familyMember)
    {
      uint64_t v14 = [MEMORY[0x1E4F1B980] storeForFamilyMember:v7];
      familyMemberScopedContactStore = v11->_familyMemberScopedContactStore;
      v11->_familyMemberScopedContactStore = (CNContactStore *)v14;

      v16 = (void *)MEMORY[0x1E4F5A668];
      id v17 = [MEMORY[0x1E4F5A688] iosOptions];
      v18 = [MEMORY[0x1E4F5A4F0] defaultProvider];
      [v16 controllerWithFamilyMember:v7 options:v17 schedulerProvider:v18];
    }
    else
    {
      v20 = (CNDowntimeWhitelistContainerFetching *)objc_alloc_init(MEMORY[0x1E4F1B9D0]);
      downtimeContaienerFetcher = v11->_downtimeContaienerFetcher;
      v11->_downtimeContaienerFetcher = v20;

      v22 = (void *)MEMORY[0x1E4F5A678];
      id v17 = [MEMORY[0x1E4F5A688] iosOptions];
      v18 = [MEMORY[0x1E4F5A4F0] defaultProvider];
      [v22 controllerWithOptions:v17 schedulerProvider:v18];
    uint64_t v19 = };
    dataSource = v11->_dataSource;
    v11->_dataSource = (CNUICoreFamilyMemberWhitelistedContactsDataSource *)v19;

    [(CNUICoreFamilyMemberWhitelistedContactsDataSource *)v11->_dataSource setObserver:v11];
    v24 = (CNUICoreContactManagementConsentCheck *)objc_alloc_init(MEMORY[0x1E4F5A648]);
    contactManagentConsentCheck = v11->_contactManagentConsentCheck;
    v11->_contactManagentConsentCheck = v24;

    v26 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactCardWarningFormatter = v11->_contactCardWarningFormatter;
    v11->_contactCardWarningFormatter = v26;

    [(CNContactFormatter *)v11->_contactCardWarningFormatter setIgnoresNickname:1];
    [(CNContactFormatter *)v11->_contactCardWarningFormatter setIgnoresOrganization:1];
    [(CNContactFormatter *)v11->_contactCardWarningFormatter setStyle:1000];
    v28 = v11;
  }

  return v11;
}

- (CNUIFamilyMemberWhitelistedContactsController)init
{
  id v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)contactPickerWithDelegate:(id)a3 familyMember:(id)a4 parentContainer:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(CNContactPickerViewController);
  [(CNContactPickerViewController *)v10 setMode:2];
  id v11 = [MEMORY[0x1E4F5A668] propertyKeysContainingSenstiveData];
  [(CNContactPickerViewController *)v10 setProhibitedPropertyKeys:v11];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [(CNContactPickerViewController *)v10 setPredicateForSelectionOfContact:v12];

  [(CNContactPickerViewController *)v10 setDelegate:v9];
  [(CNContactPickerViewController *)v10 setFamilyMember:v8];

  [(CNContactPickerViewController *)v10 setParentContainer:v7];

  return v10;
}

@end