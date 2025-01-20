@interface CNCardSharedProfileCellView
+ (id)log;
- (BOOL)allowsEditing;
- (BOOL)shouldShowMenu;
- (CNAvatarImageRenderer)avatarImageRenderer;
- (CNAvatarImageRenderingScope)renderingScope;
- (CNAvatarView)avatarView;
- (CNCardSharedProfileCellMenuButton)menuButton;
- (CNCardSharedProfileCellView)init;
- (CNCardSharedProfileCellViewDelegate)delegate;
- (CNContact)contact;
- (CNPropertyGroupItem)propertyItem;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (NSArray)constraints;
- (UIImageView)chevronImageView;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (UIStackView)labelStackView;
- (id)avatarImageForActionType:(unint64_t)a3;
- (id)contactDisplayName;
- (id)customMenu;
- (id)menuActions;
- (id)revertToCustomAction;
- (id)revertToPreviousAction;
- (id)sharedMenu;
- (id)sharedMenuTitle;
- (id)updateAction;
- (int64_t)sharedPhotoDisplayPreference;
- (unint64_t)actionToPerformUponCacheInvalidation;
- (void)avatarCacheDidUpdateForIdentifiers:(id)a3;
- (void)invalidateAvatarCacheEntriesForContact:(id)a3;
- (void)performFallbackAction;
- (void)setActionToPerformUponCacheInvalidation:(unint64_t)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAvatarImageRenderer:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setChevronImageView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setMenuButton:(id)a3;
- (void)setPropertyItem:(id)a3;
- (void)setRenderingScope:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpAvatarView;
- (void)setUpChevron;
- (void)setUpChevronAndMenuIfNeeded;
- (void)setUpLabels;
- (void)setUpMenuButton;
- (void)setValueLabel:(id)a3;
- (void)setupConstraints;
- (void)setupViews;
- (void)startObservingAvatarCacheInvalidation;
- (void)updateConstraints;
- (void)updateMenuButton;
@end

@implementation CNCardSharedProfileCellView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_propertyItem, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setActionToPerformUponCacheInvalidation:(unint64_t)a3
{
  self->_actionToPerformUponCacheInvalidation = a3;
}

- (unint64_t)actionToPerformUponCacheInvalidation
{
  return self->_actionToPerformUponCacheInvalidation;
}

- (void)setRenderingScope:(id)a3
{
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setAvatarImageRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  return self->_avatarImageRenderer;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setMenuButton:(id)a3
{
}

- (CNCardSharedProfileCellMenuButton)menuButton
{
  return self->_menuButton;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (CNPropertyGroupItem)propertyItem
{
  return self->_propertyItem;
}

- (void)setDelegate:(id)a3
{
}

- (CNCardSharedProfileCellViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNCardSharedProfileCellViewDelegate *)WeakRetained;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(CNCardSharedProfileCellView *)self actionToPerformUponCacheInvalidation];
  if (v4 == 1)
  {
    v11 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
    id v19 = 0;
    v6 = [v11 updateContactAndNicknamesForActionType:1 error:&v19];
    id v7 = v19;

    if (v6)
    {
      v9 = v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v10 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_71;
LABEL_12:
      v9[2] = (uint64_t)v10;
      v9[3] = (uint64_t)&unk_1E549B488;
      v9[4] = (uint64_t)self;
      dispatch_async(MEMORY[0x1E4F14428], v9);

      goto LABEL_13;
    }
    v13 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    v14 = "Failed to update contact for Revert to Previous action: %@";
LABEL_20:
    _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    goto LABEL_17;
  }
  if (v4 == 3)
  {
    v12 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
    id v17 = 0;
    v6 = [v12 updateContactAndNicknamesForActionType:3 error:&v17];
    id v7 = v17;

    if (v6)
    {
      v9 = &v15;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v10 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_72;
      goto LABEL_12;
    }
    v13 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    v14 = "Error updating contact for update action type: %@";
    goto LABEL_20;
  }
  if (v4 != 2)
  {
LABEL_13:
    -[CNCardSharedProfileCellView setActionToPerformUponCacheInvalidation:](self, "setActionToPerformUponCacheInvalidation:", 0, v15, v16);
    return;
  }
  v5 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
  id v21 = 0;
  v6 = [v5 updateContactAndNicknamesForActionType:2 error:&v21];
  id v7 = v21;

  if (v6)
  {
    v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to update contact for Revert to Custom action: %@", buf, 0xCu);
    }

    v9 = v20;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v10 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke;
    goto LABEL_12;
  }
LABEL_18:
}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 viewDidSelectDisplayPreference:2];
}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_71(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 viewDidSelectDisplayPreference:2];
}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_72(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 viewDidSelectDisplayPreference:1];
}

- (void)invalidateAvatarCacheEntriesForContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = +[CNUIContactsEnvironment currentEnvironment];
    v5 = [v4 cachingLikenessRenderer];
    v6 = &unk_1ED9F0FB8;
    if ([v5 conformsToProtocol:v6]) {
      id v7 = v5;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v9 = dispatch_get_global_queue(25, 0);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__CNCardSharedProfileCellView_invalidateAvatarCacheEntriesForContact___block_invoke;
      v10[3] = &unk_1E549BF80;
      id v11 = v8;
      id v12 = v3;
      dispatch_async(v9, v10);
    }
  }
}

void __70__CNCardSharedProfileCellView_invalidateAvatarCacheEntriesForContact___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) identifier];
  v4[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 updateContactsWithIdentifiers:v3];
}

- (id)avatarImageForActionType:(unint64_t)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v5 = [(CNCardSharedProfileCellView *)self avatarImageRenderer];

  if (!v5)
  {
    v6 = [CNAvatarImageRenderer alloc];
    id v7 = +[CNAvatarImageRendererSettings defaultSettings];
    id v8 = [(CNAvatarImageRenderer *)v6 initWithSettings:v7];
    [(CNCardSharedProfileCellView *)self setAvatarImageRenderer:v8];

    v9 = [(CNCardSharedProfileCellView *)self traitCollection];
    BOOL v10 = [v9 layoutDirection] == 1;

    id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    v13 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, 20.0, 20.0, v12);
    [(CNCardSharedProfileCellView *)self setRenderingScope:v13];
  }
  v14 = [(CNCardSharedProfileCellView *)self contact];
  uint64_t v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
  id v17 = [v16 targetProfileForActionType:a3];

  v18 = [v17 thumbnailImageData];
  [v15 setImageData:v18];

  id v19 = [v17 thumbnailImageData];
  [v15 setThumbnailImageData:v19];

  v20 = [(CNCardSharedProfileCellView *)self avatarImageRenderer];
  v25[0] = v15;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v22 = [(CNCardSharedProfileCellView *)self renderingScope];
  id v23 = [v20 avatarImageForContacts:v21 scope:v22];

  return v23;
}

- (id)contactDisplayName
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v3 setStyle:1000];
  [v3 setFallbackStyle:-1];
  unint64_t v4 = [(CNCardSharedProfileCellView *)self contact];
  v5 = [v3 stringFromContact:v4];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_1ED8AC728;
  }
  id v7 = v6;

  return v7;
}

- (id)sharedMenuTitle
{
  id v3 = NSString;
  unint64_t v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_SHARED_MENU_TITLE_%@" value:&stru_1ED8AC728 table:@"Localized"];
  v6 = [(CNCardSharedProfileCellView *)self contactDisplayName];
  id v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)revertToCustomAction
{
  id v3 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
  uint64_t v4 = [v3 effectiveStateForContact];

  v5 = [(CNCardSharedProfileCellView *)self avatarImageForActionType:2];
  v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_REVERT_TO_CUSTOM_MENU_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = CNContactsUIBundle();
  v9 = [v8 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_ASK_FOR_UPDATES" value:&stru_1ED8AC728 table:@"Localized"];
  BOOL v10 = +[CNSharedProfileUpdateMenuElement elementWithTitle:v7 subtitle:v9 avatarImage:v5 selected:v4 == 2];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CNCardSharedProfileCellView_revertToCustomAction__block_invoke;
  v12[3] = &unk_1E5497348;
  v12[4] = self;
  [v10 setPrimaryActionHandler:v12];

  return v10;
}

void __51__CNCardSharedProfileCellView_revertToCustomAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActionToPerformUponCacheInvalidation:2];
  v2 = *(void **)(a1 + 32);
  id v4 = [v2 sharedProfileStateOracle];
  id v3 = [v4 contact];
  [v2 invalidateAvatarCacheEntriesForContact:v3];
}

- (id)revertToPreviousAction
{
  id v3 = [(CNCardSharedProfileCellView *)self avatarImageForActionType:1];
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_REVERT_TO_PREVIOUS_MENU_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_ASK_FOR_UPDATES" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = +[CNSharedProfileUpdateMenuElement elementWithTitle:v5 subtitle:v7 avatarImage:v3 selected:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__CNCardSharedProfileCellView_revertToPreviousAction__block_invoke;
  v10[3] = &unk_1E5497348;
  void v10[4] = self;
  [v8 setPrimaryActionHandler:v10];

  return v8;
}

void __53__CNCardSharedProfileCellView_revertToPreviousAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActionToPerformUponCacheInvalidation:1];
  v2 = *(void **)(a1 + 32);
  id v4 = [v2 sharedProfileStateOracle];
  id v3 = [v4 contact];
  [v2 invalidateAvatarCacheEntriesForContact:v3];
}

- (id)updateAction
{
  id v3 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
  uint64_t v4 = [v3 effectiveStateForContactIsAutoUpdate];

  v5 = [(CNCardSharedProfileCellView *)self avatarImageForActionType:3];
  v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_UPDATE_MENU_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = CNContactsUIBundle();
  v9 = [v8 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_ALWAYS_UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
  BOOL v10 = +[CNSharedProfileUpdateMenuElement elementWithTitle:v7 subtitle:v9 avatarImage:v5 selected:v4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CNCardSharedProfileCellView_updateAction__block_invoke;
  v12[3] = &unk_1E5497348;
  v12[4] = self;
  [v10 setPrimaryActionHandler:v12];

  return v10;
}

void __43__CNCardSharedProfileCellView_updateAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActionToPerformUponCacheInvalidation:3];
  v2 = *(void **)(a1 + 32);
  id v4 = [v2 sharedProfileStateOracle];
  id v3 = [v4 contact];
  [v2 invalidateAvatarCacheEntriesForContact:v3];
}

- (id)customMenu
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];

  if (v3)
  {
    id v4 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
    v5 = [v4 availableActionTypesForEffectiveState];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isEqualToNumber:", &unk_1ED915638, (void)v15))
          {
            double v12 = [(CNCardSharedProfileCellView *)self revertToCustomAction];
            objc_msgSend(v6, "_cn_addNonNilObject:", v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      v13 = 0;
    }
    else
    {
      v13 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 image:0 identifier:0 options:1 children:v6];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)sharedMenu
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];

  if (v3)
  {
    id v4 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
    v5 = [v4 availableActionTypesForEffectiveState];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToNumber:", &unk_1ED915608, (void)v19))
        {
          uint64_t v13 = [(CNCardSharedProfileCellView *)self updateAction];
        }
        else
        {
          if (![v12 isEqualToNumber:&unk_1ED915620]) {
            continue;
          }
          uint64_t v13 = [(CNCardSharedProfileCellView *)self revertToPreviousAction];
        }
        v14 = (void *)v13;
        objc_msgSend(v6, "_cn_addNonNilObject:", v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v9)
      {
LABEL_14:

        if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
        {
          long long v15 = 0;
        }
        else
        {
          long long v16 = (void *)MEMORY[0x1E4FB1970];
          long long v17 = [(CNCardSharedProfileCellView *)self sharedMenuTitle];
          long long v15 = [v16 menuWithTitle:v17 image:0 identifier:0 options:1 children:v6];
        }
        goto LABEL_19;
      }
    }
  }
  long long v15 = 0;
LABEL_19:

  return v15;
}

- (id)menuActions
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v4 = [(CNCardSharedProfileCellView *)self sharedMenu];
  objc_msgSend(v3, "_cn_addNonNilObject:", v4);

  v5 = [(CNCardSharedProfileCellView *)self customMenu];
  objc_msgSend(v3, "_cn_addNonNilObject:", v5);

  return v3;
}

- (void)performFallbackAction
{
  id v2 = [(CNCardSharedProfileCellView *)self delegate];
  [v2 viewDidSelectFallbackAction];
}

- (BOOL)shouldShowMenu
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(CNCardSharedProfileCellView *)self allowsEditing])
  {
    id v3 = [(CNCardSharedProfileCellView *)self contact];
    if ([v3 sharedPhotoDisplayPreference])
    {
      id v4 = [(CNCardSharedProfileCellView *)self contact];
      BOOL v5 = [v4 sharedPhotoDisplayPreference] == 3;
    }
    else
    {
      BOOL v5 = 1;
    }

    id v7 = [(CNCardSharedProfileCellView *)self contact];
    uint64_t v8 = [v7 sharedPhotoDisplayPreference];

    if (v5)
    {
      uint64_t v9 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
      int v6 = [v9 currentNicknameHasValidVisualIdentityData];

      uint64_t v10 = CNUILogContactCard();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        return v6;
      }
      int v16 = 67109120;
      int v17 = v6;
      id v11 = "Contact has a current shared photo: %d";
    }
    else
    {
      if (v8 != 2)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      uint64_t v12 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
      int v13 = [(id)v12 currentNicknameHasValidVisualIdentityData];

      v14 = [(CNCardSharedProfileCellView *)self sharedProfileStateOracle];
      LODWORD(v12) = [v14 pendingNicknameHasValidVisualIdentityData];

      int v6 = v13 | v12;
      uint64_t v10 = CNUILogContactCard();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      int v16 = 67109120;
      int v17 = v6;
      id v11 = "Contact has current or pending shared photo: %d";
    }
    _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, 8u);
    goto LABEL_13;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  BOOL v5 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    [(CNCardSharedProfileCellView *)self setUpChevronAndMenuIfNeeded];
    int v6 = [(CNCardSharedProfileCellView *)self propertyItem];
    id v7 = [v6 displayValue];
    uint64_t v8 = [(CNCardSharedProfileCellView *)self valueLabel];
    [v8 setText:v7];

    BOOL v5 = v9;
  }
}

- (int64_t)sharedPhotoDisplayPreference
{
  objc_opt_class();
  id v3 = [(CNCardSharedProfileCellView *)self propertyItem];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int64_t v6 = [v5 sharedPhotoDisplayPreference];
  return v6;
}

- (void)setPropertyItem:(id)a3
{
  uint64_t v9 = (CNPropertyGroupItem *)a3;
  if (self->_propertyItem != v9)
  {
    objc_storeStrong((id *)&self->_propertyItem, a3);
    id v5 = [(CNPropertyGroupItem *)v9 displayValue];
    int64_t v6 = [(CNCardSharedProfileCellView *)self valueLabel];
    [v6 setText:v5];

    id v7 = [(CNCardSharedProfileCellView *)self avatarView];
    uint64_t v8 = [(CNPropertyGroupItem *)v9 contact];
    [v7 setContact:v8];
  }
}

- (void)setLabelTextAttributes:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v10)
  {
    id v4 = [(CNCardSharedProfileCellView *)self titleLabel];
    id v5 = [v4 font];

    if (v5 != v10)
    {
      int64_t v6 = [(CNCardSharedProfileCellView *)self titleLabel];
      [v6 setFont:v10];
    }
    id v7 = [(CNCardSharedProfileCellView *)self valueLabel];
    id v8 = [v7 font];

    if (v8 != v10)
    {
      uint64_t v9 = [(CNCardSharedProfileCellView *)self valueLabel];
      [v9 setFont:v10];
    }
  }
}

- (void)setupConstraints
{
  v73[4] = *MEMORY[0x1E4F143B8];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  }
  id v3 = (NSArray *)objc_opt_new();
  id v4 = [(CNCardSharedProfileCellView *)self labelStackView];
  id v5 = [v4 centerYAnchor];
  int64_t v6 = [(CNCardSharedProfileCellView *)self centerYAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [(NSArray *)v3 addObject:v7];

  id v8 = [(CNCardSharedProfileCellView *)self labelStackView];
  uint64_t v9 = [v8 topAnchor];
  id v10 = [(CNCardSharedProfileCellView *)self topAnchor];
  id v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];
  [(NSArray *)v3 addObject:v11];

  uint64_t v12 = [(CNCardSharedProfileCellView *)self labelStackView];
  int v13 = [v12 bottomAnchor];
  v14 = [(CNCardSharedProfileCellView *)self bottomAnchor];
  long long v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
  v71 = v3;
  [(NSArray *)v3 addObject:v15];

  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    int v16 = [(CNCardSharedProfileCellView *)self labelStackView];
    int v17 = [v16 leadingAnchor];
    uint64_t v18 = [(CNCardSharedProfileCellView *)self leadingAnchor];
    long long v19 = [v17 constraintEqualToAnchor:v18];
    [(NSArray *)v3 addObject:v19];
  }
  else
  {
    long long v20 = [(CNCardSharedProfileCellView *)self avatarView];
    long long v21 = [v20 centerYAnchor];
    long long v22 = [(CNCardSharedProfileCellView *)self centerYAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22];
    [(NSArray *)v3 addObject:v23];

    uint64_t v24 = [(CNCardSharedProfileCellView *)self avatarView];
    v25 = [v24 leadingAnchor];
    v26 = [(CNCardSharedProfileCellView *)self leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [(NSArray *)v3 addObject:v27];

    v28 = [(CNCardSharedProfileCellView *)self avatarView];
    v29 = [v28 heightAnchor];
    v30 = [(CNCardSharedProfileCellView *)self avatarView];
    v31 = [v30 widthAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    [(NSArray *)v71 addObject:v32];

    v33 = [(CNCardSharedProfileCellView *)self avatarView];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintEqualToConstant:40.0];
    [(NSArray *)v71 addObject:v35];

    int v16 = [(CNCardSharedProfileCellView *)self labelStackView];
    int v17 = [v16 leadingAnchor];
    uint64_t v18 = [(CNCardSharedProfileCellView *)self avatarView];
    long long v19 = [v18 trailingAnchor];
    v36 = [v17 constraintEqualToSystemSpacingAfterAnchor:v19 multiplier:1.0];
    [(NSArray *)v71 addObject:v36];
  }
  v69 = [(CNCardSharedProfileCellView *)self menuButton];
  v67 = [v69 leadingAnchor];
  v65 = [(CNCardSharedProfileCellView *)self leadingAnchor];
  v63 = [v67 constraintEqualToAnchor:v65];
  v73[0] = v63;
  v61 = [(CNCardSharedProfileCellView *)self menuButton];
  v60 = [v61 trailingAnchor];
  v59 = [(CNCardSharedProfileCellView *)self trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v73[1] = v58;
  v37 = [(CNCardSharedProfileCellView *)self menuButton];
  v38 = [v37 topAnchor];
  v39 = [(CNCardSharedProfileCellView *)self topAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  v73[2] = v40;
  v41 = [(CNCardSharedProfileCellView *)self menuButton];
  v42 = [v41 bottomAnchor];
  v43 = [(CNCardSharedProfileCellView *)self bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v73[3] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  [(NSArray *)v71 addObjectsFromArray:v45];

  if ([(CNCardSharedProfileCellView *)self shouldShowMenu])
  {
    v70 = [(CNCardSharedProfileCellView *)self chevronImageView];
    v46 = [v70 leadingAnchor];
    v47 = [(CNCardSharedProfileCellView *)self labelStackView];
    v48 = [v47 trailingAnchor];
    v68 = [v46 constraintEqualToSystemSpacingAfterAnchor:v48 multiplier:1.0];
    v72[0] = v68;
    v66 = [(CNCardSharedProfileCellView *)self chevronImageView];
    v64 = [v66 centerYAnchor];
    v62 = [(CNCardSharedProfileCellView *)self centerYAnchor];
    v49 = [v64 constraintEqualToAnchor:v62];
    v72[1] = v49;
    v50 = [(CNCardSharedProfileCellView *)self chevronImageView];
    v51 = [v50 trailingAnchor];
    v52 = [(CNCardSharedProfileCellView *)self trailingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v72[2] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
    [(NSArray *)v71 addObjectsFromArray:v54];

    v55 = v70;
  }
  else
  {
    v55 = [(CNCardSharedProfileCellView *)self labelStackView];
    v46 = [v55 trailingAnchor];
    v47 = [(CNCardSharedProfileCellView *)self trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [(NSArray *)v71 addObject:v48];
  }

  constraints = self->_constraints;
  self->_constraints = v71;
  v57 = v71;

  [MEMORY[0x1E4F28DC8] activateConstraints:v57];
}

- (void)updateConstraints
{
  v7.receiver = self;
  v7.super_class = (Class)CNCardSharedProfileCellView;
  [(CNCardSharedProfileCellView *)&v7 updateConstraints];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  id v4 = [(CNCardSharedProfileCellView *)self avatarView];
  int v5 = [v4 isHidden];

  if (v3 != v5)
  {
    int64_t v6 = [(CNCardSharedProfileCellView *)self avatarView];
    [v6 setHidden:v3];

    [(CNCardSharedProfileCellView *)self setupConstraints];
  }
}

- (void)startObservingAvatarCacheInvalidation
{
  uint64_t v3 = +[CNUIContactsEnvironment currentEnvironment];
  id v4 = [v3 cachingLikenessRenderer];
  if ([v4 conformsToProtocol:&unk_1ED9F0FB8]) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v7 = v5;

  int64_t v6 = v7;
  if (v7)
  {
    [v7 addDelegate:self];
    int64_t v6 = v7;
  }
}

- (void)updateMenuButton
{
  if ([(CNCardSharedProfileCellView *)self allowsEditing])
  {
    BOOL v3 = [(CNCardSharedProfileCellView *)self shouldShowMenu];
    id v4 = [(CNCardSharedProfileCellView *)self menuButton];
    [v4 setShowsMenuAsPrimaryAction:v3];

    if ([(CNCardSharedProfileCellView *)self shouldShowMenu])
    {
      objc_initWeak(&location, self);
      int v5 = [(CNCardSharedProfileCellView *)self menuButton];
      [v5 removeTarget:self action:sel_performFallbackAction forControlEvents:0x2000];

      int64_t v6 = [(CNCardSharedProfileCellView *)self menuButton];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47__CNCardSharedProfileCellView_updateMenuButton__block_invoke;
      v10[3] = &unk_1E5499BA0;
      objc_copyWeak(&v11, &location);
      [v6 _setMenuProvider:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      return;
    }
    id v8 = [(CNCardSharedProfileCellView *)self menuButton];
    [v8 _setMenuProvider:0];

    id v9 = [(CNCardSharedProfileCellView *)self menuButton];
    [v9 addTarget:self action:sel_performFallbackAction forControlEvents:0x2000];
  }
  else
  {
    id v7 = [(CNCardSharedProfileCellView *)self menuButton];
    [v7 removeTarget:self action:sel_performFallbackAction forControlEvents:0x2000];

    id v9 = [(CNCardSharedProfileCellView *)self menuButton];
    [v9 _setMenuProvider:0];
  }
}

id __47__CNCardSharedProfileCellView_updateMenuButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4FB1970];
  BOOL v3 = [WeakRetained menuActions];
  id v4 = [v2 menuWithChildren:v3];

  return v4;
}

- (void)setUpMenuButton
{
  BOOL v3 = [(CNCardSharedProfileCellView *)self menuButton];

  if (!v3)
  {
    id v4 = objc_alloc_init(CNCardSharedProfileCellMenuButton);
    [(CNCardSharedProfileCellMenuButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNCardSharedProfileCellView *)self setMenuButton:v4];
  }
  id v5 = [(CNCardSharedProfileCellView *)self menuButton];
  [(CNCardSharedProfileCellView *)self addSubview:v5];
}

- (void)setUpChevron
{
  BOOL v3 = [(CNCardSharedProfileCellView *)self chevronImageView];

  if (!v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForContactCardMenuChevron");
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    int64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v5 setTintColor:v6];

    if ([(CNCardSharedProfileCellView *)self effectiveUserInterfaceLayoutDirection] == 1)uint64_t v7 = 7; {
    else
    }
      uint64_t v7 = 8;
    [v5 setContentMode:v7];
    [(CNCardSharedProfileCellView *)self setChevronImageView:v5];
  }
  id v8 = [(CNCardSharedProfileCellView *)self chevronImageView];
  [(CNCardSharedProfileCellView *)self addSubview:v8];
}

- (void)setUpChevronAndMenuIfNeeded
{
  [(CNCardSharedProfileCellView *)self updateMenuButton];
  if ([(CNCardSharedProfileCellView *)self shouldShowMenu])
  {
    [(CNCardSharedProfileCellView *)self setUpChevron];
    [(CNCardSharedProfileCellView *)self setupConstraints];
  }
  else
  {
    id v3 = [(CNCardSharedProfileCellView *)self chevronImageView];
    [v3 removeFromSuperview];
  }
}

- (void)setUpLabels
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [v3 setText:v5];

  [v3 setNumberOfLines:0];
  uint64_t v6 = *MEMORY[0x1E4FB28C8];
  uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v3 setFont:v7];

  [(CNCardSharedProfileCellView *)self addSubview:v3];
  [(CNCardSharedProfileCellView *)self setTitleLabel:v3];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setText:&stru_1ED8AC728];
  [v8 setNumberOfLines:0];
  id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTextColor:v9];

  id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
  [v8 setFont:v10];

  [(CNCardSharedProfileCellView *)self addSubview:v8];
  [(CNCardSharedProfileCellView *)self setValueLabel:v8];
  id v11 = objc_alloc(MEMORY[0x1E4FB1C60]);
  uint64_t v12 = [(CNCardSharedProfileCellView *)self titleLabel];
  v16[0] = v12;
  int v13 = [(CNCardSharedProfileCellView *)self valueLabel];
  v16[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  long long v15 = (void *)[v11 initWithArrangedSubviews:v14];

  [v15 setAxis:1];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNCardSharedProfileCellView *)self addSubview:v15];
  [(CNCardSharedProfileCellView *)self setLabelStackView:v15];
}

- (void)setUpAvatarView
{
  id v3 = objc_alloc_init(CNAvatarView);
  [(CNAvatarView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNCardSharedProfileCellView *)self addSubview:v3];
  [(CNCardSharedProfileCellView *)self setAvatarView:v3];
}

- (void)setupViews
{
  [(CNCardSharedProfileCellView *)self setUpAvatarView];
  [(CNCardSharedProfileCellView *)self setUpLabels];
  [(CNCardSharedProfileCellView *)self setUpMenuButton];

  [(CNCardSharedProfileCellView *)self setUpChevronAndMenuIfNeeded];
}

- (void)setAllowsEditing:(BOOL)a3
{
  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    [(CNCardSharedProfileCellView *)self updateMenuButton];
  }
}

- (CNCardSharedProfileCellView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCellView;
  id v2 = -[CNCardSharedProfileCellView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v3 = v2;
  if (v2)
  {
    [(CNCardSharedProfileCellView *)v2 setupViews];
    [(CNCardSharedProfileCellView *)v3 setupConstraints];
    [(CNCardSharedProfileCellView *)v3 startObservingAvatarCacheInvalidation];
    id v4 = v3;
  }

  return v3;
}

+ (id)log
{
  if (log_cn_once_token_1_9764 != -1) {
    dispatch_once(&log_cn_once_token_1_9764, &__block_literal_global_9765);
  }
  id v2 = (void *)log_cn_once_object_1_9766;

  return v2;
}

void __34__CNCardSharedProfileCellView_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNCardSharedProfileCellContentView");
  id v1 = (void *)log_cn_once_object_1_9766;
  log_cn_once_object_1_9766 = (uint64_t)v0;
}

@end