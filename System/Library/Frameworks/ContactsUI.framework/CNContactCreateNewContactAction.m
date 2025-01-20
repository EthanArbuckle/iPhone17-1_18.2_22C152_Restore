@interface CNContactCreateNewContactAction
- (CNContact)createdContact;
- (UIViewController)presentingViewController;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)setCreatedContact:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation CNContactCreateNewContactAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_createdContact, 0);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setCreatedContact:(id)a3
{
}

- (CNContact)createdContact
{
  return self->_createdContact;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNContactCreateNewContactAction *)self setCreatedContact:v6];
  v8 = [(CNContactAction *)self delegate];
  v9 = [v8 contactViewCache];
  v10 = [v9 contactStore];

  v11 = [(CNContactAction *)self delegate];
  v12 = [v7 parentViewController];

  [v11 action:self dismissViewController:v12 sender:0];
  v13 = [(CNContactAction *)self contact];
  LODWORD(v11) = [v13 isSuggestedMe];

  if (v11)
  {
    id v20 = 0;
    [v10 setMeContact:v6 error:&v20];
    id v14 = v20;
    v15 = v14;
    if (v14) {
      NSLog(&cfstr_ErrorSettingMe.isa, v14);
    }
  }
  v16 = [(CNContactAction *)self delegate];
  v17 = v16;
  if (!v6)
  {
    [v16 actionWasCanceled:self];
    goto LABEL_9;
  }
  [v16 actionDidFinish:self];

  v18 = [(CNContactAction *)self contact];
  int v19 = [v18 isSuggested];

  if (v19)
  {
    v17 = [MEMORY[0x1E4F1B8F0] sharedNotifier];
    [v17 didSaveChangesSuccessfully:1 fromContactStore:v10 requestIdentifier:0];
LABEL_9:
  }
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  id v14 = [(CNContactAction *)self contact];
  v5 = +[CNContactViewController viewControllerForNewContact:v14];
  id v6 = [(CNContactAction *)self delegate];
  id v7 = [v6 contactViewCache];
  v8 = [v7 contactStore];
  [v5 setContactStore:v8];

  [v5 setDelegate:self];
  [v5 loadView];
  v9 = [(CNContactAction *)self delegate];
  v10 = [v5 contentViewController];
  [v9 action:self prepareChildContactViewController:v10 sender:self];

  [(CNContactCreateNewContactAction *)self setCreatedContact:0];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  v12 = [v11 navigationBar];
  objc_msgSend(v12, "_cnui_applyContactStyle");

  v13 = [(CNContactAction *)self delegate];
  [v13 action:self presentViewController:v11 sender:v4];
}

@end