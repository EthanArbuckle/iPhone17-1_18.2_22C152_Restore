@interface CNContactUpdateExistingContactAction
- (CNContact)existingContact;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)performActionWithSender:(id)a3;
- (void)setExistingContact:(id)a3;
@end

@implementation CNContactUpdateExistingContactAction

- (void).cxx_destruct
{
}

- (void)setExistingContact:(id)a3
{
}

- (CNContact)existingContact
{
  return self->_existingContact;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    [(CNContactUpdateExistingContactAction *)self setExistingContact:a4];
    v7 = [(CNContactAction *)self delegate];
    [v7 action:self dismissViewController:v6 sender:0];

    id v9 = [(CNContactAction *)self delegate];
    [v9 actionDidFinish:self];
  }
  else
  {
    v8 = [(CNContactAction *)self delegate];
    [v8 action:self dismissViewController:v6 sender:0];

    id v9 = [(CNContactAction *)self delegate];
    [v9 actionWasCanceled:self];
  }
}

- (void)performActionWithSender:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1B8F8];
  id v6 = [(CNContactUpdateExistingContactAction *)self existingContact];
  v7 = [v6 identifier];
  v30[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v9 = [v5 predicateForContactsWithIdentifiers:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F1B908]);
  v11 = +[CNContactContentViewController descriptorForRequiredKeys];
  v29 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v13 = (void *)[v10 initWithKeysToFetch:v12];

  [v13 setOnlyMainStore:1];
  [v13 setUnifyResults:1];
  [v13 setPredicate:v9];
  v14 = [(CNContactAction *)self delegate];
  v15 = [v14 contactViewCache];
  v16 = [v15 contactStore];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__61319;
  v27 = __Block_byref_object_dispose__61320;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__CNContactUpdateExistingContactAction_performActionWithSender___block_invoke;
  v22[3] = &unk_1E549B878;
  v22[4] = &v23;
  [v16 enumerateContactsWithFetchRequest:v13 error:0 usingBlock:v22];
  uint64_t v17 = v24[5];
  v18 = [(CNContactAction *)self contact];
  v19 = +[CNContactViewController viewControllerForUpdatingContact:v17 withPropertiesFromContact:v18];

  [v19 setContactStore:v16];
  [v19 setDelegate:self];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v19];
  v21 = [(CNContactAction *)self delegate];
  [v21 action:self presentViewController:v20 sender:v4];

  _Block_object_dispose(&v23, 8);
}

void __64__CNContactUpdateExistingContactAction_performActionWithSender___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

@end