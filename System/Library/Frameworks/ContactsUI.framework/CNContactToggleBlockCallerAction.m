@interface CNContactToggleBlockCallerAction
- (BOOL)isContactBlockedPreservingChanges:(BOOL)a3;
- (NSNumber)isBlockedCachedValue;
- (id)allNumbersAndEmails;
- (id)checkIsContactBlocked;
- (void)performActionWithSender:(id)a3;
- (void)setContactBlocked:(BOOL)a3;
- (void)setIsBlockedCachedValue:(id)a3;
@end

@implementation CNContactToggleBlockCallerAction

- (void).cxx_destruct
{
}

- (void)setIsBlockedCachedValue:(id)a3
{
}

- (NSNumber)isBlockedCachedValue
{
  return self->_isBlockedCachedValue;
}

- (void)setContactBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNContactToggleBlockCallerAction *)self allNumbersAndEmails];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CNContactToggleBlockCallerAction_setContactBlocked___block_invoke;
  v7[3] = &__block_descriptor_33_e18_v16__0__NSString_8l;
  BOOL v8 = v3;
  objc_msgSend(v5, "_cn_each:", v7);
  v6 = [NSNumber numberWithBool:v3];
  [(CNContactToggleBlockCallerAction *)self setIsBlockedCachedValue:v6];
}

void __54__CNContactToggleBlockCallerAction_setContactBlocked___block_invoke(uint64_t a1)
{
  uint64_t CMFItemFromString = CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    BOOL v3 = (const void *)CMFItemFromString;
    if (*(unsigned char *)(a1 + 32)) {
      CMFBlockListAddItemForAllServices();
    }
    else {
      CMFBlockListRemoveItemFromAllServices();
    }
    CFRelease(v3);
  }
}

- (id)allNumbersAndEmails
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(CNContactAction *)self contact];
  v5 = [v4 phoneNumbers];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke;
  v17[3] = &unk_1E5499680;
  id v6 = v3;
  id v18 = v6;
  objc_msgSend(v5, "_cn_each:", v17);

  v7 = [(CNContactAction *)self contact];
  BOOL v8 = [v7 emailAddresses];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke_2;
  v15 = &unk_1E5499680;
  id v16 = v6;
  id v9 = v6;
  objc_msgSend(v8, "_cn_each:", &v12);

  v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

void __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 value];
  BOOL v3 = [v4 unformattedInternationalStringValue];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __55__CNContactToggleBlockCallerAction_allNumbersAndEmails__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 value];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    BOOL v3 = v4;
  }
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  if ([(CNContactToggleBlockCallerAction *)self isContactBlockedPreservingChanges:1])
  {
    [(CNContactToggleBlockCallerAction *)self setContactBlocked:0];
    v5 = [(CNContactAction *)self delegate];
    [v5 actionDidFinish:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4FB1418];
    v7 = CNContactsUIBundle();
    BOOL v8 = [v7 localizedStringForKey:@"CARD_ACTION_BLOCK_CONTACT_INFO_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
    v5 = [v6 alertControllerWithTitle:v8 message:0 preferredStyle:0];

    [v5 setPreferredStyle:0];
    id v9 = (void *)MEMORY[0x1E4FB1410];
    v10 = CNContactsUIBundle();
    v11 = [v10 localizedStringForKey:@"CARD_ACTION_BLOCK_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke;
    v19[3] = &unk_1E549B590;
    v19[4] = self;
    uint64_t v12 = [v9 actionWithTitle:v11 style:2 handler:v19];
    [v5 addAction:v12];

    uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
    v14 = CNContactsUIBundle();
    v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke_2;
    v18[3] = &unk_1E549B590;
    v18[4] = self;
    id v16 = [v13 actionWithTitle:v15 style:1 handler:v18];
    [v5 addAction:v16];

    v17 = [(CNContactAction *)self delegate];
    [v17 action:self presentViewController:v5 sender:v4];
  }
}

void __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContactBlocked:1];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

void __60__CNContactToggleBlockCallerAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionWasCanceled:*(void *)(a1 + 32)];
}

- (id)checkIsContactBlocked
{
  id v2 = [(CNContactToggleBlockCallerAction *)self allNumbersAndEmails];
  uint64_t v3 = objc_msgSend(v2, "_cn_any:", &__block_literal_global_13347);

  id v4 = NSNumber;

  return (id)[v4 numberWithBool:v3];
}

BOOL __57__CNContactToggleBlockCallerAction_checkIsContactBlocked__block_invoke()
{
  uint64_t CMFItemFromString = CreateCMFItemFromString();
  if (!CMFItemFromString) {
    return 0;
  }
  v1 = (const void *)CMFItemFromString;
  BOOL v2 = CMFBlockListIsItemBlocked() == 1;
  CFRelease(v1);
  return v2;
}

- (BOOL)isContactBlockedPreservingChanges:(BOOL)a3
{
  if (!a3) {
    cn_runWithObjectLock();
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  BOOL v8 = self;
  id v4 = cn_objectResultWithObjectLock();
  char v5 = objc_msgSend(v4, "BOOLValue", v7, 3221225472, __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke_2, &unk_1E549B7B0, v8);

  return v5;
}

void __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;
}

id __70__CNContactToggleBlockCallerAction_isContactBlockedPreservingChanges___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[10];
  if (!v3)
  {
    uint64_t v4 = [v2 checkIsContactBlocked];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  }

  return v3;
}

@end