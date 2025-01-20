@interface CNPropertyLinkedCardsAction
- (CNContactContentViewController)contactController;
- (CNContactContentViewControllerDelegate)contactDelegate;
- (CNMutableContact)linkedContact;
- (CNPropertyLinkedCardsAction)initWithContact:(id)a3;
- (void)dealloc;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)setContactController:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setLinkedContact:(id)a3;
- (void)setPreferredForImage;
- (void)setPreferredForName;
@end

@implementation CNPropertyLinkedCardsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContact, 0);
  objc_storeStrong((id *)&self->_contactController, 0);

  objc_destroyWeak((id *)&self->_contactDelegate);
}

- (void)setLinkedContact:(id)a3
{
}

- (CNMutableContact)linkedContact
{
  return (CNMutableContact *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContactController:(id)a3
{
}

- (CNContactContentViewController)contactController
{
  return (CNContactContentViewController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContactDelegate:(id)a3
{
}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return (CNContactContentViewControllerDelegate *)WeakRetained;
}

- (void)setPreferredForName
{
  v3 = [(CNContactAction *)self delegate];
  v4 = [v3 contactViewCache];
  v5 = [v4 contactStore];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  v7 = [(CNPropertyLinkedCardsAction *)self linkedContact];
  uint64_t v8 = [(CNContactAction *)self mutableContact];
  [v6 preferLinkedContactForName:v7 inUnifiedContact:v8];

  id v19 = 0;
  LOBYTE(v8) = [v5 executeSaveRequest:v6 error:&v19];
  id v9 = v19;
  v14 = v9;
  if ((v8 & 1) == 0) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyLinkedCardsAction.m", 114, 3, @"Could not set preferred contact for name: %@", v10, v11, v12, v13, (uint64_t)v9);
  }
  v15 = [(CNPropertyLinkedCardsAction *)self contactController];
  v16 = [(CNPropertyLinkedCardsAction *)self contactController];
  v17 = [v16 cardTopGroup];
  [v15 removeActionWithTarget:self selector:sel_setPreferredForName inGroup:v17];

  v18 = [(CNContactAction *)self delegate];
  [v18 actionDidFinish:self];
}

- (void)setPreferredForImage
{
  v3 = [(CNContactAction *)self delegate];
  v4 = [v3 contactViewCache];
  v5 = [v4 contactStore];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  v7 = [(CNPropertyLinkedCardsAction *)self linkedContact];
  uint64_t v8 = [(CNContactAction *)self mutableContact];
  [v6 preferLinkedContactForImage:v7 inUnifiedContact:v8];

  id v19 = 0;
  LOBYTE(v8) = [v5 executeSaveRequest:v6 error:&v19];
  id v9 = v19;
  v14 = v9;
  if ((v8 & 1) == 0) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPropertyLinkedCardsAction.m", 96, 3, @"Could not set preferred contact for image: %@", v10, v11, v12, v13, (uint64_t)v9);
  }
  v15 = [(CNPropertyLinkedCardsAction *)self contactController];
  v16 = [(CNPropertyLinkedCardsAction *)self contactController];
  v17 = [v16 cardTopGroup];
  [v15 removeActionWithTarget:self selector:sel_setPreferredForImage inGroup:v17];

  v18 = [(CNContactAction *)self delegate];
  [v18 actionDidFinish:self];
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v49 = a3;
  id v6 = [CNContactContentViewController alloc];
  v7 = [v49 contact];
  uint64_t v8 = [(CNContactContentViewController *)v6 initWithContact:v7];
  [(CNPropertyLinkedCardsAction *)self setContactController:v8];

  id v9 = [(CNContactAction *)self delegate];
  uint64_t v10 = [(CNPropertyLinkedCardsAction *)self contactController];
  [v9 action:self prepareChildContactViewController:v10 sender:self];

  uint64_t v11 = [(CNContactAction *)self delegate];
  uint64_t v12 = [v11 contactViewCache];

  uint64_t v13 = [v49 contact];
  v14 = [v12 accountForContact:v13];

  v15 = [v49 contact];
  v16 = [v12 policyForContact:v15];

  v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:@"ACCOUNT_CARD_ITEM_LABEL" value:&stru_1ED8AC728 table:@"Localized"];

  if (v14)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1B8A8], "_cnui_displayNameForACAccount:", v14);

    v18 = (void *)v19;
  }
  v20 = [(CNPropertyLinkedCardsAction *)self contactController];
  [v20 setTitle:v18];

  v21 = [(CNPropertyLinkedCardsAction *)self contactController];
  if ([v21 allowsEditing] && (objc_msgSend(v16, "isReadonly") & 1) == 0)
  {
    v4 = [(CNContactAction *)self delegate];
    BOOL v23 = v4 != 0;
    int v22 = 1;
  }
  else
  {
    int v22 = 0;
    BOOL v23 = 0;
  }
  v24 = [(CNPropertyLinkedCardsAction *)self contactController];
  [v24 setAllowsEditing:v23];

  if (v22) {
  v25 = [(CNPropertyLinkedCardsAction *)self contactDelegate];
  }
  v26 = [(CNPropertyLinkedCardsAction *)self contactController];
  [v26 setContactDelegate:v25];

  v27 = [v49 contact];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CNPropertyLinkedCardsAction *)self setLinkedContact:v27];
  }
  else
  {
    v28 = (void *)[v27 mutableCopy];
    [(CNPropertyLinkedCardsAction *)self setLinkedContact:v28];
  }
  v29 = [(CNPropertyLinkedCardsAction *)self contactController];
  int v30 = [v29 allowsSettingLinkedContactsAsPreferred];

  if (!v30) {
    goto LABEL_21;
  }
  v31 = [(CNPropertyLinkedCardsAction *)self linkedContact];
  if ([v31 isPreferredForImage]) {
    goto LABEL_16;
  }
  v32 = [(CNPropertyLinkedCardsAction *)self linkedContact];
  v33 = [v32 thumbnailImageData];

  if (v33)
  {
    v31 = [(CNPropertyLinkedCardsAction *)self contactController];
    v46 = CNContactsUIBundle();
    v34 = [v46 localizedStringForKey:@"SET_PREFERRED_PHOTO_ACTION_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    v35 = [(CNPropertyLinkedCardsAction *)self contactController];
    v36 = [v35 cardTopGroup];
    [v31 addActionWithTitle:v34 target:self selector:sel_setPreferredForImage inGroup:v36];

LABEL_16:
  }
  v37 = [(CNPropertyLinkedCardsAction *)self linkedContact];
  if (([v37 isPreferredForName] & 1) == 0)
  {
    v38 = (void *)MEMORY[0x1E4F1B910];
    v39 = [(CNPropertyLinkedCardsAction *)self linkedContact];
    v40 = [v38 stringFromContact:v39 style:0];

    if (!v40) {
      goto LABEL_21;
    }
    v37 = [(CNPropertyLinkedCardsAction *)self contactController];
    v47 = CNContactsUIBundle();
    v41 = [v47 localizedStringForKey:@"SET_PREFERRED_NAME_ACTION_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNPropertyLinkedCardsAction *)self contactController];
    v42 = v48 = v16;
    v43 = [v42 cardTopGroup];
    [v37 addActionWithTitle:v41 target:self selector:sel_setPreferredForName inGroup:v43];

    v16 = v48;
  }

LABEL_21:
  v44 = [(CNContactAction *)self delegate];
  v45 = [(CNPropertyLinkedCardsAction *)self contactController];
  [v44 action:self pushViewController:v45 sender:self];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyLinkedCardsAction;
  [(CNPropertyLinkedCardsAction *)&v3 dealloc];
}

- (CNPropertyLinkedCardsAction)initWithContact:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertyLinkedCardsAction;
  return [(CNPropertyAction *)&v4 initWithContact:a3];
}

@end