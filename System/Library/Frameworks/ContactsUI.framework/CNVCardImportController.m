@interface CNVCardImportController
- (BOOL)enqueueContactsAtURL:(id)a3;
- (CNContactStore)contactStore;
- (CNContainer)targetContainer;
- (CNGroup)targetGroup;
- (CNQueue)receivedContactsQueue;
- (CNUIEditAuthorizationController)editAuthorizationController;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4;
- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4 targetGroup:(id)a5 targetContainer:(id)a6;
- (CNVCardImportControllerDelegate)delegate;
- (CNVCardImportControllerPresentationDelegate)presentationDelegate;
- (UIViewController)presentedViewController;
- (id)authorizationCheckForSavingReceivedContacts;
- (id)contactsFromURL:(id)a3;
- (id)dequeueContacts;
- (void)authorizeAndSaveUnknownPersons;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dismissContactsAndPresentNext;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)enqueueContacts:(id)a3;
- (void)presentEnqueueResultsUIForResultContacts:(id)a3;
- (void)presentImportUIForContacts:(id)a3;
- (void)processNextContacts;
- (void)saveUnknownPersonsAndMarkSaveWithAuthorizationResult:(int64_t)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditAuthorizationController:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setReceivedContactsQueue:(id)a3;
- (void)setTargetContainer:(id)a3;
- (void)setTargetGroup:(id)a3;
- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4;
@end

@implementation CNVCardImportController

- (void)setDelegate:(id)a3
{
}

- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4
{
  return [(CNVCardImportController *)self initWithContactStore:a3 presentationDelegate:a4 targetGroup:0 targetContainer:0];
}

- (CNVCardImportController)initWithContactStore:(id)a3 presentationDelegate:(id)a4 targetGroup:(id)a5 targetContainer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNVCardImportController;
  v15 = [(CNVCardImportController *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_presentationDelegate, v12);
    objc_storeStrong((id *)&v16->_contactStore, a3);
    v17 = (CNQueue *)objc_alloc_init(MEMORY[0x1E4F5A4D0]);
    receivedContactsQueue = v16->_receivedContactsQueue;
    v16->_receivedContactsQueue = v17;

    objc_storeStrong((id *)&v16->_targetGroup, a5);
    objc_storeStrong((id *)&v16->_targetContainer, a6);
    v19 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_receivedContactsQueue, 0);
  objc_storeStrong((id *)&self->_targetContainer, 0);
  objc_storeStrong((id *)&self->_targetGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

- (void)setEditAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setReceivedContactsQueue:(id)a3
{
}

- (CNQueue)receivedContactsQueue
{
  return self->_receivedContactsQueue;
}

- (void)setTargetContainer:(id)a3
{
}

- (void)setTargetGroup:(id)a3
{
}

- (CNGroup)targetGroup
{
  return self->_targetGroup;
}

- (CNVCardImportControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVCardImportControllerDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (CNVCardImportControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (CNVCardImportControllerPresentationDelegate *)WeakRetained;
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNVCardImportController *)self setEditAuthorizationController:0];
  if (a4 == 2)
  {
    [(CNVCardImportController *)self saveUnknownPersonsAndMarkSaveWithAuthorizationResult:2];
  }
  else
  {
    v6 = CNUILogContactList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "vCard not imported, user is not authorized to edit contacts", v7, 2u);
    }

    [(CNVCardImportController *)self dismissContactsAndPresentNext];
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(CNVCardImportController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(CNVCardImportController *)self delegate];
      v12[0] = v7;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v10 vCardImportController:self didSaveContacts:v11];
    }
  }
  [(CNVCardImportController *)self dismissContactsAndPresentNext];
}

- (void)saveUnknownPersonsAndMarkSaveWithAuthorizationResult:(int64_t)a3
{
  v5 = [(CNVCardImportController *)self receivedContactsQueue];
  id v17 = [v5 peek];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    id v6 = objc_msgSend(v17, "_cn_map:", &__block_literal_global_37762);
    id v7 = [(CNVCardImportController *)self authorizationCheckForSavingReceivedContacts];
    uint64_t v8 = [v7 shouldBypassRestrictionsGivenAuthorizationResult:a3];

    char v9 = [(CNVCardImportController *)self groupsAndContainersSaveManager];
    v10 = [(CNVCardImportController *)self targetGroup];
    id v11 = [(CNVCardImportController *)self targetContainer];
    id v12 = [v9 addContacts:v6 toGroup:v10 inContainer:v11 moveWasAuthorized:v8];

    if ([v12 saveDidSucceed])
    {
      id v13 = [(CNVCardImportController *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        v15 = [(CNVCardImportController *)self delegate];
        v16 = [v12 addedContacts];
        [v15 vCardImportController:self didSaveContacts:v16];
      }
    }
  }
  [(CNVCardImportController *)self dismissContactsAndPresentNext];
}

id __80__CNVCardImportController_saveUnknownPersonsAndMarkSaveWithAuthorizationResult___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];

  return v2;
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CNUIEditAuthorizationController);
  [(CNVCardImportController *)self setEditAuthorizationController:v7];

  uint64_t v8 = [(CNVCardImportController *)self editAuthorizationController];
  [v8 setDelegate:self];

  char v9 = [(CNVCardImportController *)self editAuthorizationController];
  [v9 setSender:v6];

  v10 = [(CNVCardImportController *)self editAuthorizationController];
  [v10 setAnimated:v4];

  id v11 = [(CNVCardImportController *)self presentedViewController];
  id v12 = [(CNVCardImportController *)self editAuthorizationController];
  [v12 setGuardedViewController:v11];

  id v13 = [(CNVCardImportController *)self editAuthorizationController];
  [v13 presentAuthorizationUI];
}

- (id)authorizationCheckForSavingReceivedContacts
{
  id v3 = objc_alloc(MEMORY[0x1E4F5A650]);
  BOOL v4 = [(CNVCardImportController *)self receivedContactsQueue];
  v5 = [v4 peek];
  id v6 = [v5 firstObject];
  id v7 = [(CNVCardImportController *)self targetContainer];
  uint64_t v8 = (void *)[v3 initWithContact:v6 parentContainer:v7 ignoresParentalRestrictions:0];

  return v8;
}

- (void)authorizeAndSaveUnknownPersons
{
  id v3 = [(CNVCardImportController *)self authorizationCheckForSavingReceivedContacts];
  int v4 = [v3 shouldPromptForPasscodeAuthorization];

  if (v4)
  {
    [(CNVCardImportController *)self showEditAuthorizationPane:0 animated:1];
  }
  else
  {
    [(CNVCardImportController *)self saveUnknownPersonsAndMarkSaveWithAuthorizationResult:0];
  }
}

- (void)dismissContactsAndPresentNext
{
  id v3 = [(CNVCardImportController *)self presentedViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CNVCardImportController_dismissContactsAndPresentNext__block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __56__CNVCardImportController_dismissContactsAndPresentNext__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) dequeueContacts];
  id v3 = *(void **)(a1 + 32);

  return [v3 processNextContacts];
}

- (void)presentImportUIForContacts:(id)a3
{
  id v21 = a3;
  if ([v21 count] == 1)
  {
    int v4 = [v21 firstObject];
    v5 = +[CNContactViewController viewControllerForUnknownContact:v4];

    id v6 = [(CNVCardImportController *)self contactStore];
    [(CNMultipleUnknownContactsViewController *)v5 setContactStore:v6];

    [(CNMultipleUnknownContactsViewController *)v5 setDelegate:self];
    id v7 = [(CNVCardImportController *)self targetGroup];
    [(CNMultipleUnknownContactsViewController *)v5 setParentGroup:v7];

    uint64_t v8 = [(CNVCardImportController *)self targetContainer];
    [(CNMultipleUnknownContactsViewController *)v5 setParentContainer:v8];

    char v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:3 target:self action:sel_saveUnknownPersons_];
    v10 = [(CNMultipleUnknownContactsViewController *)v5 navigationItem];
    [v10 setRightBarButtonItem:v9];
  }
  else
  {
    id v11 = [CNMultipleUnknownContactsViewController alloc];
    id v12 = [(CNVCardImportController *)self targetGroup];
    id v13 = [(CNVCardImportController *)self targetContainer];
    v5 = [(CNMultipleUnknownContactsViewController *)v11 initWithContacts:v21 targetGroup:v12 targetContainer:v13];

    char v14 = [(CNVCardImportController *)self contactStore];
    [(CNMultipleUnknownContactsViewController *)v5 setContactStore:v14];

    [(CNMultipleUnknownContactsViewController *)v5 setDelegate:self];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelModalUnknownPersons_];
  v16 = [(CNMultipleUnknownContactsViewController *)v5 navigationItem];
  [v16 setLeftBarButtonItem:v15];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v17 setModalPresentationStyle:2];
  }
  [(CNVCardImportController *)self setPresentedViewController:v17];
  v20 = [(CNVCardImportController *)self presentationDelegate];
  [v20 vCardImportController:self presentViewController:v17 animated:1];
}

- (void)processNextContacts
{
  id v3 = [(CNVCardImportController *)self receivedContactsQueue];
  id v10 = [v3 peek];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    uint64_t v4 = [(CNVCardImportController *)self delegate];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [(CNVCardImportController *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        uint64_t v8 = [(CNVCardImportController *)self delegate];
        [v8 vCardImportControllerDidCompleteQueue:self];

        char v9 = [(CNVCardImportController *)self receivedContactsQueue];
        objc_sync_enter(v9);
        [(CNVCardImportController *)self setReceivedContactsQueue:0];
        objc_sync_exit(v9);
      }
    }
  }
  else
  {
    [(CNVCardImportController *)self presentImportUIForContacts:v10];
  }
}

- (id)dequeueContacts
{
  id v3 = [(CNVCardImportController *)self receivedContactsQueue];
  objc_sync_enter(v3);
  uint64_t v4 = [(CNVCardImportController *)self receivedContactsQueue];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(CNVCardImportController *)self receivedContactsQueue];
    char v7 = [v6 dequeue];
  }
  else
  {
    char v7 = 0;
  }
  objc_sync_exit(v3);

  return v7;
}

- (void)enqueueContacts:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CNVCardImportController *)self receivedContactsQueue];
  objc_sync_enter(v4);
  uint64_t v5 = [(CNVCardImportController *)self receivedContactsQueue];
  [v5 enqueue:v8];

  id v6 = [(CNVCardImportController *)self receivedContactsQueue];
  uint64_t v7 = [v6 count];

  if (v7 == 1) {
    [(CNVCardImportController *)self processNextContacts];
  }
  objc_sync_exit(v4);
}

- (BOOL)enqueueContactsAtURL:(id)a3
{
  uint64_t v4 = [(CNVCardImportController *)self contactsFromURL:a3];
  char v5 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))();
  if ((v5 & 1) == 0) {
    [(CNVCardImportController *)self enqueueContacts:v4];
  }

  return v5 ^ 1;
}

- (void)presentEnqueueResultsUIForResultContacts:(id)a3
{
  if (!a3)
  {
    uint64_t v4 = [(CNVCardImportController *)self presentationDelegate];

    if (v4)
    {
      char v5 = (void *)MEMORY[0x1E4FB1418];
      id v6 = CNContactsUIBundle();
      uint64_t v7 = [v6 localizedStringForKey:@"Unable to open contact card." value:&stru_1ED8AC728 table:@"Localized"];
      id v9 = [v5 alertControllerWithTitle:0 message:v7 preferredStyle:1];

      id v8 = [(CNVCardImportController *)self presentationDelegate];
      [v8 vCardImportController:self presentViewController:v9 animated:1];
    }
  }
}

- (id)contactsFromURL:(id)a3
{
  id v4 = a3;
  int v5 = [v4 startAccessingSecurityScopedResource];
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:0];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1B998] contactsWithData:v6 error:0];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (v5) {
LABEL_3:
  }
    [v4 stopAccessingSecurityScopedResource];
LABEL_4:
  [(CNVCardImportController *)self presentEnqueueResultsUIForResultContacts:v7];

  return v7;
}

- (CNContainer)targetContainer
{
  v13[1] = *MEMORY[0x1E4F143B8];
  targetContainer = self->_targetContainer;
  if (targetContainer)
  {
    id v3 = targetContainer;
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F1B9B0];
    id v6 = [(CNVCardImportController *)self contactStore];
    uint64_t v7 = [v6 defaultContainerIdentifier];
    v13[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v9 = [v5 predicateForContainersWithIdentifiers:v8];

    id v10 = [(CNVCardImportController *)self contactStore];
    id v11 = [v10 containersMatchingPredicate:v9 error:0];
    id v3 = [v11 firstObject];
  }

  return v3;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    id v4 = [CNUIGroupsAndContainersSaveManager alloc];
    int v5 = [(CNVCardImportController *)self contactStore];
    id v6 = [(CNUIGroupsAndContainersSaveManager *)v4 initWithContactStore:v5];
    uint64_t v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }
  id v8 = groupsAndContainersSaveManager;

  return v8;
}

@end