@interface CNContactListRemoveContactFromGroupAction
+ (id)log;
- (BOOL)executeRemoveFromGroupAction;
- (CNContact)contact;
- (CNContactListRemoveContactFromGroupAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5;
- (CNContactStore)contactStore;
- (CNGroup)group;
- (NSString)containerIdentifier;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setGroup:(id)a3;
- (void)undoRemoveFromGroupAction;
@end

@implementation CNContactListRemoveContactFromGroupAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setGroup:(id)a3
{
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
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

- (void)undoRemoveFromGroupAction
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  v4 = [(CNContactListRemoveContactFromGroupAction *)self contact];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(CNContactListRemoveContactFromGroupAction *)self group];
  v12[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v8 = [(CNContactListRemoveContactFromGroupAction *)self contactStore];
  char v9 = [v5 addContactToGroups:v7 inStore:v8 request:v3];

  if ((v9 & 1) == 0)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Failed to undo remove contact from group", v11, 2u);
    }
  }
}

- (BOOL)executeRemoveFromGroupAction
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  v4 = [(CNContactListRemoveContactFromGroupAction *)self contact];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(CNContactListRemoveContactFromGroupAction *)self group];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v8 = [(CNContactListRemoveContactFromGroupAction *)self contactStore];
  char v9 = [v5 removeContactFromGroups:v7 inStore:v8 request:v3];

  if ((v9 & 1) == 0)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Failed to remove contact from group", v12, 2u);
    }
  }
  return v9;
}

- (CNContactListRemoveContactFromGroupAction)initWithContact:(id)a3 contactStore:(id)a4 containerIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactListRemoveContactFromGroupAction;
  v12 = [(CNContactListRemoveContactFromGroupAction *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_contactStore, a4);
    objc_storeStrong((id *)&v13->_containerIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

+ (id)log
{
  if (log_cn_once_token_1_13411 != -1) {
    dispatch_once(&log_cn_once_token_1_13411, &__block_literal_global_13412);
  }
  v2 = (void *)log_cn_once_object_1_13413;

  return v2;
}

void __48__CNContactListRemoveContactFromGroupAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIContactListRemoveFromGroupAction");
  v1 = (void *)log_cn_once_object_1_13413;
  log_cn_once_object_1_13413 = (uint64_t)v0;
}

@end