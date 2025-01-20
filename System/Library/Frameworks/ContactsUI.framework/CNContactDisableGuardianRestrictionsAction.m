@interface CNContactDisableGuardianRestrictionsAction
- (BOOL)canPerformAction;
- (BOOL)isDestructive;
- (CNContactDisableGuardianRestrictionsAction)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5;
- (CNContactStore)contactStore;
- (CNContainer)container;
- (id)title;
- (void)performActionWithSender:(id)a3;
@end

@implementation CNContactDisableGuardianRestrictionsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContainer)container
{
  return self->_container;
}

- (void)performActionWithSender:(id)a3
{
  v4 = [(CNContactDisableGuardianRestrictionsAction *)self container];
  v5 = (void *)[v4 mutableCopy];

  [v5 setGuardianRestricted:0];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v6 setIgnoresGuardianRestrictions:1];
  [v6 updateContainer:v5];
  v7 = [(CNContactDisableGuardianRestrictionsAction *)self contactStore];
  uint64_t v9 = 0;
  [v7 executeSaveRequest:v6 error:&v9];

  v8 = [(CNContactAction *)self delegate];
  [v8 actionDidFinish:self];
}

- (BOOL)canPerformAction
{
  v2 = [(CNContactDisableGuardianRestrictionsAction *)self container];
  char v3 = [v2 isGuardianRestricted];

  return v3;
}

- (BOOL)isDestructive
{
  return 1;
}

- (id)title
{
  v2 = CNContactsUIBundle();
  char v3 = [v2 localizedStringForKey:@"ALLOW_CONTACT_EDITING" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (CNContactDisableGuardianRestrictionsAction)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNContactDisableGuardianRestrictionsAction;
  v11 = [(CNContactAction *)&v15 initWithContact:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_container, a4);
    objc_storeStrong((id *)&v12->_contactStore, a5);
    v13 = v12;
  }

  return v12;
}

@end