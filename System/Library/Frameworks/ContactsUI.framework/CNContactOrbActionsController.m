@interface CNContactOrbActionsController
+ (id)descriptorForRequiredKeys;
- (BOOL)bypassActionValidation;
- (BOOL)shouldUseActionsManagerForContacts:(id)a3;
- (CNContactActionsController)actionsController;
- (CNContactOrbActionsController)initWithContact:(id)a3;
- (CNContactOrbActionsController)initWithContacts:(id)a3;
- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4;
- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4 bypassActionValidation:(BOOL)a5;
- (CNContactOrbActionsControllerDelegate)delegate;
- (CNQuickActionsManager)actionsManager;
- (NSArray)actionCategories;
- (NSArray)contacts;
- (NSArray)menuItems;
- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4;
- (id)menuItemsForContactsWithActions:(id)a3;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)reloadMenuItems;
- (void)setActionCategories:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsManager:(id)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setupActionsControllerForContact:(id)a3;
- (void)setupActionsForContacts:(id)a3;
- (void)setupActionsManagerForContacts:(id)a3;
@end

@implementation CNContactOrbActionsController

+ (id)descriptorForRequiredKeys
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = +[CNContactActionsController descriptorForRequiredKeys];
  v4 = +[CNQuickActionsManager descriptorForRequiredKeys];
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F1B910] sharedFullNameFormatterWithFallBacks];
  v6 = [v5 descriptorForRequiredKeys];
  v11[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v8 = [NSString stringWithUTF8String:"+[CNContactOrbActionsController descriptorForRequiredKeys]"];
  v9 = [v2 descriptorWithKeyDescriptors:v7 description:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setActionCategories:(id)a3
{
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (void)setActionsManager:(id)a3
{
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setMenuItems:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactOrbActionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactOrbActionsControllerDelegate *)WeakRetained;
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5 = a4;
  [(CNContactOrbActionsController *)self setMenuItems:v5];
  id v6 = [(CNContactOrbActionsController *)self delegate];
  [v6 contactOrbActionsController:self didUpdateWithMenu:v5];
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  id v6 = [v4 performActionWithContext:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke;
  v11[3] = &unk_1E549A500;
  id v7 = v4;
  id v12 = v7;
  [v6 addSuccessBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke_2;
  v9[3] = &unk_1E5499BC8;
  id v10 = v7;
  id v8 = v7;
  [v6 addFailureBlock:v9];
}

void __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__CNContactOrbActionsController_contactActionsController_didSelectAction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadMenuItems
{
  v3 = [(CNContactOrbActionsController *)self contacts];
  BOOL v4 = [(CNContactOrbActionsController *)self shouldUseActionsManagerForContacts:v3];

  if (v4)
  {
    id v7 = [(CNContactOrbActionsController *)self actionsManager];
    id v5 = [v7 actions];
    id v6 = [(CNContactOrbActionsController *)self menuItemsForContactsWithActions:v5];
    [(CNContactOrbActionsController *)self setMenuItems:v6];
  }
  else
  {
    id v7 = [(CNContactOrbActionsController *)self actionsController];
    [v7 retrieveModels];
  }
}

- (void)setupActionsControllerForContact:(id)a3
{
  id v4 = a3;
  id v5 = [CNContactActionsController alloc];
  id v6 = +[CNContactActionsController supportedActionTypes];
  id v7 = [(CNContactActionsController *)v5 initWithContact:v4 actionTypes:v6];

  [(CNContactActionsController *)v7 setDisplayMenuIconAtTopLevel:1];
  [(CNContactActionsController *)v7 setShouldUseOutlinedActionGlyphStyle:1];
  [(CNContactActionsController *)v7 setDelegate:self];
  actionsController = self->_actionsController;
  self->_actionsController = v7;
  v9 = v7;

  [(CNContactActionsController *)self->_actionsController retrieveModels];
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  id v5 = [(CNContactOrbActionsController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNContactOrbActionsController *)self delegate];
    id v8 = [v7 presentingViewControllerForActionsController:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)menuItemsForContactsWithActions:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v38)
  {
    uint64_t v6 = *(void *)v41;
    v35 = v5;
    uint64_t v36 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v9 = [(CNContactOrbActionsController *)self contacts];
        unint64_t v10 = [v9 count];

        if (v10 < 2)
        {
          uint64_t v15 = [v8 titleForContext:0];
          v16 = [v8 outlinedImage];
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            id v18 = [v8 image];
          }
          v30 = v18;

          v31 = [v8 subtitleForContext:0];
        }
        else
        {
          objc_opt_class();
          id v11 = v8;
          if (objc_opt_isKindOfClass()) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }
          id v13 = v12;

          objc_opt_class();
          if (v13)
          {
            id v14 = [v13 mainAction];
          }
          else
          {
            id v14 = v11;
          }
          v19 = v14;
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
          id v21 = v20;

          if (!v21)
          {
            uint64_t v6 = v36;
            goto LABEL_27;
          }
          v22 = self;
          v23 = [v21 propertyAction];
          v24 = [v23 propertyItem];
          v25 = [v24 contact];

          v26 = [MEMORY[0x1E4F1B910] sharedFullNameFormatterWithFallBacks];
          uint64_t v15 = [v26 stringFromContact:v25];
          v27 = [v21 outlinedImage];
          v28 = v27;
          if (v27)
          {
            id v29 = v27;
          }
          else
          {
            id v29 = [v21 image];
          }
          v30 = v29;

          v31 = 0;
          self = v22;
          id v5 = v35;
          uint64_t v6 = v36;
        }
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __65__CNContactOrbActionsController_menuItemsForContactsWithActions___block_invoke;
        v39[3] = &unk_1E549BDC8;
        v39[4] = v8;
        v32 = [MEMORY[0x1E4FB13F0] actionWithTitle:v15 image:v30 identifier:0 handler:v39];
        [v32 setDiscoverabilityTitle:v31];
        [v5 addObject:v32];

        id v13 = (id)v15;
LABEL_27:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v38);
  }

  v33 = (void *)[v5 copy];

  return v33;
}

uint64_t __65__CNContactOrbActionsController_menuItemsForContactsWithActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithCompletionBlock:0];
}

- (void)setupActionsManagerForContacts:(id)a3
{
  id v11 = +[CNQuickActionsManager actionsManagerForContacts:a3];
  id v5 = [(CNContactOrbActionsController *)self actionCategories];
  [v11 setCategories:v5];

  uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];
  if (!v7)
  {
    v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 _referenceBounds];
    if (CGRectGetHeight(v13) > 667.0)
    {
      [v11 setDesiredNumberOfActions:6];
LABEL_11:

      goto LABEL_12;
    }
  }
  id v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v8 userInterfaceIdiom])
  {
    [v11 setDesiredNumberOfActions:5];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 _referenceBounds];
    if (CGRectGetHeight(v14) <= 568.0) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 6;
    }
    [v11 setDesiredNumberOfActions:v10];
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_12:

  objc_msgSend(v11, "setBypassActionValidation:", -[CNContactOrbActionsController bypassActionValidation](self, "bypassActionValidation"));
  [v11 setDelegate:self];
  [(CNContactOrbActionsController *)self setActionsManager:v11];
}

- (BOOL)shouldUseActionsManagerForContacts:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    objc_opt_class();
    id v4 = [v3 firstObject];
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      if ([v6 isUnknown]) {
        char v7 = 1;
      }
      else {
        char v7 = [v6 isSuggestedMe];
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)setupActionsForContacts:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    if ([(CNContactOrbActionsController *)self shouldUseActionsManagerForContacts:v4])
    {
      [(CNContactOrbActionsController *)self setupActionsManagerForContacts:v4];
      id v5 = [(CNContactOrbActionsController *)self actionsManager];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__CNContactOrbActionsController_setupActionsForContacts___block_invoke;
      v6[3] = &unk_1E549B488;
      v6[4] = self;
      [v5 updateActionsWithBlock:v6];
    }
    else
    {
      id v5 = [v4 firstObject];
      [(CNContactOrbActionsController *)self setupActionsControllerForContact:v5];
    }
  }
}

void __57__CNContactOrbActionsController_setupActionsForContacts___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [v2 actionsManager];
  id v3 = [v5 actions];
  id v4 = [v2 menuItemsForContactsWithActions:v3];
  [*(id *)(a1 + 32) setMenuItems:v4];
}

- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4 bypassActionValidation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactOrbActionsController;
  id v11 = [(CNContactOrbActionsController *)&v15 init];
  id v12 = v11;
  CGRect v13 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_actionCategories, a4);
    v12->_bypassActionValidation = a5;
    objc_storeStrong((id *)&v12->_contacts, a3);
    [(CNContactOrbActionsController *)v12 setupActionsForContacts:v9];
    CGRect v13 = v12;
  }

  return v13;
}

- (CNContactOrbActionsController)initWithContacts:(id)a3 actionCategories:(id)a4
{
  return [(CNContactOrbActionsController *)self initWithContacts:a3 actionCategories:a4 bypassActionValidation:0];
}

- (CNContactOrbActionsController)initWithContacts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ((unint64_t)[v4 count] < 2)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = +[CNQuickActionsManager defaultCategories];
    }
    self = [(CNContactOrbActionsController *)self initWithContacts:v5 actionCategories:v6 bypassActionValidation:0];

    char v7 = self;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CNContactOrbActionsController)initWithContact:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    self = [(CNContactOrbActionsController *)self initWithContacts:v5];

    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end