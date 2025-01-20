@interface CNContactAddToExistingContactAction
- (CNContact)chosenContact;
- (CNContactPickerViewController)contactPicker;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)setChosenContact:(id)a3;
- (void)setContactPicker:(id)a3;
@end

@implementation CNContactAddToExistingContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPicker, 0);

  objc_storeStrong((id *)&self->_chosenContact, 0);
}

- (void)setContactPicker:(id)a3
{
}

- (CNContactPickerViewController)contactPicker
{
  return self->_contactPicker;
}

- (void)setChosenContact:(id)a3
{
}

- (CNContact)chosenContact
{
  return self->_chosenContact;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v6)
  {
    [(CNContactAddToExistingContactAction *)self setChosenContact:v6];
    v7 = [(CNContactAction *)self delegate];
    v8 = [(CNContactAddToExistingContactAction *)self contactPicker];
    [v7 action:self dismissViewController:v8 sender:0];

    v9 = [(CNContactAction *)self delegate];
    [v9 actionDidFinish:self];

    v10 = [(CNContactAction *)self contact];
    LODWORD(v8) = [v10 isSuggested];

    if (!v8) {
      goto LABEL_6;
    }
    v11 = [(CNContactAction *)self delegate];
    v12 = [v11 contactViewCache];
    v13 = [v12 contactStore];

    v14 = [MEMORY[0x1E4F1B8F0] sharedNotifier];
    [v14 didSaveChangesSuccessfully:1 fromContactStore:v13 requestIdentifier:0];
  }
  else
  {
    v15 = [(CNContactAction *)self delegate];
    v16 = [(CNContactAddToExistingContactAction *)self contactPicker];
    [v15 action:self dismissViewController:v16 sender:0];

    v13 = [(CNContactAction *)self delegate];
    [v13 actionWasCanceled:self];
  }

LABEL_6:
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v12 = (id)objc_msgSend(a4, "mutableCopy", a3);
  v5 = [(CNContactAction *)self contact];
  id v6 = +[CNContactViewController viewControllerForUpdatingContact:v12 withPropertiesFromContact:v5];
  v7 = [(CNContactAction *)self delegate];
  v8 = [v7 contactViewCache];
  v9 = [v8 contactStore];
  [v6 setContactStore:v9];

  [v6 setDelegate:self];
  v10 = [(CNContactAddToExistingContactAction *)self contactPicker];
  v11 = [v10 navigationController];
  [v11 pushViewController:v6 animated:1];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactAction *)self delegate];
  [v5 action:self dismissViewController:v4 sender:0];

  id v6 = [(CNContactAction *)self delegate];
  [v6 actionWasCanceled:self];
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  v7 = objc_alloc_init(CNContactPickerViewController);
  [(CNContactPickerViewController *)v7 setDelegate:self];
  [(CNContactPickerViewController *)v7 setMode:2];
  [(CNContactPickerViewController *)v7 setAutocloses:0];
  [(CNContactPickerViewController *)v7 setOnlyRealContacts:1];
  v5 = [(CNContactAction *)self contact];
  [(CNContactPickerViewController *)v7 scrollToClosestContactMatching:v5];

  [(CNContactAddToExistingContactAction *)self setChosenContact:0];
  id v6 = [(CNContactAction *)self delegate];
  [v6 action:self presentViewController:v7 sender:v4];

  [(CNContactAddToExistingContactAction *)self setContactPicker:v7];
}

@end