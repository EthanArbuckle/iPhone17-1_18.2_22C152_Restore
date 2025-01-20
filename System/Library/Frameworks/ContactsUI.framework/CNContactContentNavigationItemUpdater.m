@interface CNContactContentNavigationItemUpdater
- (NSArray)extraLeftBarButtonItems;
- (NSArray)extraRightBarButtonItems;
- (NSArray)preEditLeftBarButtonItems;
- (id)buttonPlatterImage;
- (id)customEditItemTitleForIsUpdatingContact:(BOOL)a3;
- (id)transparentPlatterImage;
- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editButtonEnabled:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13;
- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editRequiresAuthorization:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13;
- (id)updateEditDoneButtonForController:(id)a3 customEditButtonTitle:(id)a4 hasChanges:(BOOL)a5;
- (id)updateEditDoneButtonForController:(id)a3 isUpdatingContact:(BOOL)a4 hasChanges:(BOOL)a5;
- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 customEditButtonTitle:(id)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10;
- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 isUpdatingContact:(BOOL)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10;
- (void)applyPlatterStyleToBarButtonItems:(id)a3 navItemController:(id)a4 isEditing:(BOOL)a5;
- (void)setExtraLeftBarButtonItems:(id)a3;
- (void)setExtraRightBarButtonItems:(id)a3;
- (void)setPreEditLeftBarButtonItems:(id)a3;
- (void)updateBackButtonForPlatterStyleForController:(id)a3 mode:(int64_t)a4 platterBackBarButtonItem:(id)a5 animated:(BOOL)a6;
- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editButtonEnabled:(BOOL)a6;
- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editRequiresAuthorization:(BOOL)a6;
@end

@implementation CNContactContentNavigationItemUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);

  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
}

- (void)setExtraRightBarButtonItems:(id)a3
{
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (id)transparentPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", @"transparent-image");
}

- (id)buttonPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_roundedNavButtonPlatterImage");
}

- (void)applyPlatterStyleToBarButtonItems:(id)a3 navItemController:(id)a4 isEditing:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (a5) {
          [(CNContactContentNavigationItemUpdater *)self transparentPlatterImage];
        }
        else {
        v13 = [(CNContactContentNavigationItemUpdater *)self buttonPlatterImage];
        }
        [v12 setBackgroundImage:v13 forState:0 barMetrics:0];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editButtonEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  if (v8)
  {
    id v15 = v9;
    uint64_t v10 = [v9 editButtonItem];
    [v10 setEnabled:v6];
  }
  else
  {
    if (a5 != 5) {
      goto LABEL_6;
    }
    id v15 = v9;
    v11 = CNContactsUIBundle();
    v12 = [v11 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
    v13 = [v15 editButtonItem];
    [v13 setTitle:v12];

    uint64_t v10 = CNContactsUIBundle();
    long long v14 = [v10 localizedStringForKey:@"REVIEW" value:&stru_1ED8AC728 table:@"Localized"];
    [v15 setTitle:v14];
  }
  id v9 = v15;
LABEL_6:
}

- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editRequiresAuthorization:(BOOL)a6
{
}

- (void)updateBackButtonForPlatterStyleForController:(id)a3 mode:(int64_t)a4 platterBackBarButtonItem:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = [a3 navigationItem];
  v11 = [v10 backBarButtonItem];

  if (a4 != 5 && !v11)
  {
    v13[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v10 setLeftBarButtonItems:v12 animated:v6];
  }
}

- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editButtonEnabled:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13
{
  BOOL v73 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  v82[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v20 = a12;
  v75 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  id v21 = v18;
  v22 = [v21 navigationItem];
  v23 = v22;
  v74 = v20;
  if (!v14)
  {
    if (a4 == 5)
    {
      v28 = [v21 editButtonItem];
      [v28 setStyle:2];

      v29 = [v21 editButtonItem];
      [v29 setTarget:v19];

      v30 = [v21 editButtonItem];
      [v30 setAction:sel_updateContact_];

      v31 = CNContactsUIBundle();
      v32 = [v31 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
      [v21 editButtonItem];
      v34 = id v33 = v19;
      [v34 setTitle:v32];

      v35 = [v21 editButtonItem];
      v79 = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];

      v37 = CNContactsUIBundle();
      v38 = [v37 localizedStringForKey:@"REVIEW" value:&stru_1ED8AC728 table:@"Localized"];
      [v21 setTitle:v38];

      id v19 = v33;
      v39 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v33 action:sel_editCancel_];
      v78 = v39;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      [(CNContactContentNavigationItemUpdaterResult *)v75 setEnableCancelShortcut:1];
      [(CNContactContentNavigationItemUpdaterResult *)v75 setEnableEditShortcut:1];
LABEL_7:

      goto LABEL_52;
    }
    id v40 = v19;
    v41 = [v22 rightBarButtonItems];
    v42 = [v41 firstObject];
    v43 = [v21 editButtonItem];

    if (v42 == v43) {
      v36 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else {
      v36 = 0;
    }
    [(CNContactContentNavigationItemUpdaterResult *)v75 setEnableCancelShortcut:0];
    [(CNContactContentNavigationItemUpdaterResult *)v75 setEnableEditShortcut:0];
    v44 = [v23 backBarButtonItem];

    if (v44)
    {
      v45 = [v23 backBarButtonItem];
      v77 = v45;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];

      id v19 = v40;
    }
    else
    {
      id v19 = v40;
      if (v20 && a11 && a10)
      {
        id v76 = v20;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      }
      else
      {
        v27 = 0;
        if (a11 && !a10)
        {
          v39 = [v23 leftBarButtonItems];
          v27 = objc_msgSend(v39, "_cn_filter:", &__block_literal_global_38);
          goto LABEL_7;
        }
      }
    }
LABEL_52:
    if (v73) {
      goto LABEL_29;
    }
    goto LABEL_53;
  }
  v24 = [v22 backBarButtonItem];

  if (v24)
  {
    v25 = [v23 backBarButtonItem];
    v82[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
LABEL_4:
    v27 = (void *)v26;

    goto LABEL_24;
  }
  if (v20 && a11 && a10)
  {
    id v81 = v20;
    uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
LABEL_23:
    v27 = (void *)v46;
    goto LABEL_24;
  }
  v47 = [(CNContactContentNavigationItemUpdater *)self preEditLeftBarButtonItems];

  if (v47)
  {
    uint64_t v46 = [(CNContactContentNavigationItemUpdater *)self preEditLeftBarButtonItems];
    goto LABEL_23;
  }
  v27 = 0;
  if (a11 && !a10)
  {
    v25 = [v23 leftBarButtonItems];
    uint64_t v26 = objc_msgSend(v25, "_cn_filter:", &__block_literal_global_31);
    goto LABEL_4;
  }
LABEL_24:
  [(CNContactContentNavigationItemUpdater *)self setPreEditLeftBarButtonItems:0];
  v48 = [v21 editButtonItem];
  [v48 setEnabled:v13];

  [(CNContactContentNavigationItemUpdaterResult *)v75 setEnableEditShortcut:v13];
  if ([v21 isEditing]) {
    [v21 setEditing:0];
  }
  v49 = [v21 editButtonItem];
  [v49 setTarget:v19];

  v50 = [v21 editButtonItem];
  [v50 setAction:sel_toggleEditing_];

  v36 = [v21 editButtonItem];

  if (v36)
  {
    v51 = [v21 editButtonItem];
    v80 = v51;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  }
  if (v73)
  {
LABEL_29:
    id v52 = v19;
    v53 = [v23 rightBarButtonItems];
    v54 = [v23 leftBarButtonItems];
    v55 = [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];

    if (!v55)
    {
      if ([v53 count])
      {
        v56 = self;
        v57 = v53;
      }
      else
      {
        v57 = (void *)MEMORY[0x1E4F1CBF0];
        v56 = self;
      }
      [(CNContactContentNavigationItemUpdater *)v56 setExtraRightBarButtonItems:v57];
    }
    v58 = [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];
    if ([v58 count])
    {
      uint64_t v59 = [v36 count];

      if (v59) {
        goto LABEL_38;
      }
      [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];
      v36 = v58 = v36;
    }

LABEL_38:
    v60 = [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];

    if (!v60)
    {
      if ([v54 count])
      {
        v61 = self;
        v62 = v54;
      }
      else
      {
        v62 = (void *)MEMORY[0x1E4F1CBF0];
        v61 = self;
      }
      [(CNContactContentNavigationItemUpdater *)v61 setExtraLeftBarButtonItems:v62];
    }
    v63 = [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];
    if ([v63 count])
    {
      uint64_t v64 = [v27 count];

      if (v64) {
        goto LABEL_47;
      }
      [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];
      v27 = v63 = v27;
    }

LABEL_47:
    id v19 = v52;
    if (!v27) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_53:
  if (v27) {
LABEL_54:
  }
    [v23 setLeftBarButtonItems:v27 animated:a13];
LABEL_55:
  v65 = (uint64_t *)MEMORY[0x1E4F5A258];
  if (a11)
  {
    uint64_t v66 = *MEMORY[0x1E4F5A258];
    v67 = [v23 leftBarButtonItems];
    LOBYTE(v66) = (*(uint64_t (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    if ((v66 & 1) == 0)
    {
      v68 = [v23 leftBarButtonItems];
      [(CNContactContentNavigationItemUpdater *)self applyPlatterStyleToBarButtonItems:v68 navItemController:v21 isEditing:0];
    }
  }
  if (v36) {
    [v23 setRightBarButtonItems:v36 animated:a13];
  }
  if (a11)
  {
    uint64_t v69 = *v65;
    v70 = [v23 rightBarButtonItems];
    LOBYTE(v69) = (*(uint64_t (**)(uint64_t, void *))(v69 + 16))(v69, v70);

    if ((v69 & 1) == 0)
    {
      v71 = [v23 rightBarButtonItems];
      [(CNContactContentNavigationItemUpdater *)self applyPlatterStyleToBarButtonItems:v71 navItemController:v21 isEditing:0];
    }
  }

  return v75;
}

BOOL __236__CNContactContentNavigationItemUpdater_updateDisplayNavigationItemsForController_mode_actionTarget_allowsEditing_editButtonEnabled_isInSheet_isShowingNavBar_shouldShowBackButton_shouldUsePlatterStyle_platterBackBarButtonItem_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __236__CNContactContentNavigationItemUpdater_updateDisplayNavigationItemsForController_mode_actionTarget_allowsEditing_editButtonEnabled_isInSheet_isShowingNavBar_shouldShowBackButton_shouldUsePlatterStyle_platterBackBarButtonItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editRequiresAuthorization:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13
{
  return -[CNContactContentNavigationItemUpdater updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:](self, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", a3, a4, a5, a6, 1, a8);
}

- (id)customEditItemTitleForIsUpdatingContact:(BOOL)a3
{
  if (a3)
  {
    v3 = CNContactsUIBundle();
    v4 = [v3 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)updateEditDoneButtonForController:(id)a3 customEditButtonTitle:(id)a4 hasChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  uint64_t v10 = [v8 editButtonItem];

  [v10 setEnabled:v5];
  if (v7) {
    [v10 setTitle:v7];
  }
  [(CNContactContentNavigationItemUpdaterResult *)v9 setEnableSaveShortcut:v5];

  return v9;
}

- (id)updateEditDoneButtonForController:(id)a3 isUpdatingContact:(BOOL)a4 hasChanges:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(CNContactContentNavigationItemUpdater *)self customEditItemTitleForIsUpdatingContact:v6];
  uint64_t v10 = [(CNContactContentNavigationItemUpdater *)self updateEditDoneButtonForController:v8 customEditButtonTitle:v9 hasChanges:v5];

  return v10;
}

- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 customEditButtonTitle:(id)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10
{
  BOOL v51 = a7;
  BOOL v11 = a5;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  long long v17 = [v14 navigationItem];
  id v18 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  id v19 = [(CNContactContentNavigationItemUpdater *)self preEditLeftBarButtonItems];

  if (!v19)
  {
    id v20 = [v17 leftBarButtonItems];
    id v21 = objc_msgSend(v20, "_cn_filter:", &__block_literal_global_6767);

    if (v21) {
      v22 = v21;
    }
    else {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(CNContactContentNavigationItemUpdater *)self setPreEditLeftBarButtonItems:v22];
  }
  v50 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v15 action:sel_editCancel_];
  v53[0] = v50;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [(CNContactContentNavigationItemUpdaterResult *)v18 setEnableCancelShortcut:1];
  v24 = [(CNContactContentNavigationItemUpdater *)self updateEditDoneButtonForController:v14 customEditButtonTitle:v16 hasChanges:a9];

  v49 = v24;
  -[CNContactContentNavigationItemUpdaterResult setEnableSaveShortcut:](v18, "setEnableSaveShortcut:", [v24 enableSaveShortcut]);
  v25 = [v14 editButtonItem];
  if (([v14 isEditing] & 1) == 0) {
    [v14 setEditing:1];
  }
  [v25 setTarget:v15];
  [v25 setAction:sel_toggleEditing_];
  if (!v25)
  {
    uint64_t v26 = 0;
    if (!v11) {
      goto LABEL_31;
    }
LABEL_12:
    v27 = [v17 rightBarButtonItems];
    id v47 = [v17 leftBarButtonItems];
    v28 = [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];

    if (!v28)
    {
      if ([v27 count])
      {
        v29 = self;
        v30 = v27;
      }
      else
      {
        v30 = (void *)MEMORY[0x1E4F1CBF0];
        v29 = self;
      }
      [(CNContactContentNavigationItemUpdater *)v29 setExtraRightBarButtonItems:v30];
    }
    v31 = [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];
    if ([v31 count])
    {
      uint64_t v32 = [v26 count];

      if (v32) {
        goto LABEL_21;
      }
      [(CNContactContentNavigationItemUpdater *)self extraRightBarButtonItems];
      uint64_t v26 = v31 = v26;
    }

LABEL_21:
    id v33 = [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];

    if (!v33)
    {
      if ([v47 count])
      {
        v34 = self;
        id v35 = v47;
      }
      else
      {
        id v35 = (id)MEMORY[0x1E4F1CBF0];
        v34 = self;
      }
      [(CNContactContentNavigationItemUpdater *)v34 setExtraLeftBarButtonItems:v35];
    }
    v36 = [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];
    if ([v36 count])
    {
      uint64_t v37 = [v23 count];

      if (v37)
      {
LABEL_30:

        goto LABEL_31;
      }
      [(CNContactContentNavigationItemUpdater *)self extraLeftBarButtonItems];
      v23 = v36 = v23;
    }

    goto LABEL_30;
  }
  id v52 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  if (v11) {
    goto LABEL_12;
  }
LABEL_31:
  v48 = v18;
  if (v23) {
    [v17 setLeftBarButtonItems:v23 animated:a10];
  }
  v38 = (uint64_t *)MEMORY[0x1E4F5A258];
  if (v51)
  {
    uint64_t v39 = *MEMORY[0x1E4F5A258];
    id v40 = [v17 leftBarButtonItems];
    LOBYTE(v39) = (*(uint64_t (**)(uint64_t, void *))(v39 + 16))(v39, v40);

    if ((v39 & 1) == 0)
    {
      v41 = [v17 leftBarButtonItems];
      [(CNContactContentNavigationItemUpdater *)self applyPlatterStyleToBarButtonItems:v41 navItemController:v14 isEditing:1];
    }
  }
  if (v26) {
    [v17 setRightBarButtonItems:v26 animated:a10];
  }
  if (v51)
  {
    uint64_t v42 = *v38;
    v43 = [v17 rightBarButtonItems];
    LOBYTE(v42) = (*(uint64_t (**)(uint64_t, void *))(v42 + 16))(v42, v43);

    if ((v42 & 1) == 0)
    {
      v44 = [v17 rightBarButtonItems];
      [(CNContactContentNavigationItemUpdater *)self applyPlatterStyleToBarButtonItems:v44 navItemController:v14 isEditing:1];
    }
  }

  return v48;
}

BOOL __185__CNContactContentNavigationItemUpdater_updateEditingNavigationItemForController_actionTarget_isInSheet_isShowingNavBar_shouldUsePlatterStyle_customEditButtonTitle_hasChanges_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 isUpdatingContact:(BOOL)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(CNContactContentNavigationItemUpdater *)self customEditItemTitleForIsUpdatingContact:v10];
  LOWORD(v21) = __PAIR16__(a10, a9);
  id v19 = -[CNContactContentNavigationItemUpdater updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:customEditButtonTitle:hasChanges:animated:](self, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:customEditButtonTitle:hasChanges:animated:", v17, v16, v13, v12, v11, v18, v21);

  return v19;
}

@end