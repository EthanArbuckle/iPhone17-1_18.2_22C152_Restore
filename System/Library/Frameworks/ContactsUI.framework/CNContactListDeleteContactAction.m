@interface CNContactListDeleteContactAction
+ (id)log;
- (BOOL)executeDeleteAction;
- (CNContact)contact;
- (CNContactListDeleteContactAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5 recentsManager:(id)a6;
- (CNContactStore)contactStore;
- (CNUICoreRecentsManager)recentsManager;
- (NSString)containerIdentifier;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setRecentsManager:(id)a3;
- (void)undoDeleteAction;
@end

@implementation CNContactListDeleteContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setRecentsManager:(id)a3
{
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)undoDeleteAction
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  v4 = [(CNContactListDeleteContactAction *)self contact];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(CNContactListDeleteContactAction *)self containerIdentifier];
  [v3 addContact:v5 toContainerWithIdentifier:v6];

  v7 = [(CNContactListDeleteContactAction *)self contactStore];
  id v11 = 0;
  char v8 = [v7 executeSaveRequest:v3 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Failed to undo delete contact action: %@", buf, 0xCu);
    }
  }
}

- (BOOL)executeDeleteAction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  v4 = [(CNContactListDeleteContactAction *)self contact];
  v5 = (void *)[v4 mutableCopy];

  [v3 deleteContact:v5];
  v6 = [(CNContactListDeleteContactAction *)self contactStore];
  id v15 = 0;
  char v7 = [v6 executeSaveRequest:v3 error:&v15];
  id v8 = v15;

  if (v7)
  {
    id v9 = [(CNContactListDeleteContactAction *)self recentsManager];
    v10 = [v9 recentContactsMatchingAllPropertiesOfContact:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CNContactListDeleteContactAction_executeDeleteAction__block_invoke;
    v13[3] = &unk_1E5499068;
    id v14 = v9;
    id v11 = v9;
    [v10 addSuccessBlock:v13];
  }
  else
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Failed to delete contact: %@", buf, 0xCu);
    }
  }

  return v7;
}

uint64_t __55__CNContactListDeleteContactAction_executeDeleteAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecents:a2 completionHandler:0];
}

- (CNContactListDeleteContactAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5 recentsManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNContactListDeleteContactAction;
  id v15 = [(CNContactListDeleteContactAction *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contact, a3);
    objc_storeStrong((id *)&v16->_contactStore, a4);
    objc_storeStrong((id *)&v16->_containerIdentifier, a5);
    objc_storeStrong((id *)&v16->_recentsManager, a6);
    id v17 = v16;
  }

  return v16;
}

+ (id)log
{
  if (log_cn_once_token_1_23290 != -1) {
    dispatch_once(&log_cn_once_token_1_23290, &__block_literal_global_23291);
  }
  v2 = (void *)log_cn_once_object_1_23292;

  return v2;
}

void __39__CNContactListDeleteContactAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIListDeleteContactAction");
  v1 = (void *)log_cn_once_object_1_23292;
  log_cn_once_object_1_23292 = (uint64_t)v0;
}

@end