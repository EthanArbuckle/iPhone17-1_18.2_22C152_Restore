@interface CNPhotoPickerActionsModel
+ (BOOL)actionIsDestructive:(int64_t)a3;
+ (id)buttonForActionType:(int64_t)a3 titleOverride:(id)a4 withActionBlock:(id)a5;
+ (id)buttonForActionType:(int64_t)a3 withActionBlock:(id)a4;
+ (id)localizedTitleForActionType:(int64_t)a3;
+ (unint64_t)maximumNumberOfButtons;
- (BOOL)buttonsDisabled;
- (BOOL)canDelete;
- (BOOL)canPerformActionType:(int64_t)a3;
- (CNPhotoPickerActionButton)deleteButton;
- (CNPhotoPickerActionsDelegate)delegate;
- (CNPhotoPickerActionsModel)initWithProviderItem:(id)a3 assignActionTitleOverride:(id)a4 canDelete:(BOOL)a5 atIndexPath:(id)a6;
- (CNPhotoPickerProviderItem)providerItem;
- (NSArray)currentInlineActionButtons;
- (NSIndexPath)indexPath;
- (NSString)assignActionTitleOverride;
- (id)generateInlineActionButtons;
- (void)didTapAssignToContact;
- (void)didTapDelete;
- (void)didTapDuplicate;
- (void)didTapEdit;
- (void)setAssignActionTitleOverride:(id)a3;
- (void)setButtonsDisabled:(BOOL)a3;
- (void)setCanDelete:(BOOL)a3;
- (void)setCurrentInlineActionButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setProviderItem:(id)a3;
- (void)updateProviderItem:(id)a3;
@end

@implementation CNPhotoPickerActionsModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignActionTitleOverride, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_currentInlineActionButtons, 0);
  objc_storeStrong((id *)&self->_providerItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)buttonsDisabled
{
  return self->_buttonsDisabled;
}

- (void)setAssignActionTitleOverride:(id)a3
{
}

- (NSString)assignActionTitleOverride
{
  return self->_assignActionTitleOverride;
}

- (void)setCanDelete:(BOOL)a3
{
  self->_canDelete = a3;
}

- (BOOL)canDelete
{
  return self->_canDelete;
}

- (void)setIndexPath:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setDeleteButton:(id)a3
{
}

- (CNPhotoPickerActionButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setCurrentInlineActionButtons:(id)a3
{
}

- (NSArray)currentInlineActionButtons
{
  return self->_currentInlineActionButtons;
}

- (void)setProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerActionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerActionsDelegate *)WeakRetained;
}

- (void)didTapDelete
{
  id v6 = [(CNPhotoPickerActionsModel *)self delegate];
  v3 = [(CNPhotoPickerActionsModel *)self providerItem];
  v4 = [(CNPhotoPickerActionsModel *)self indexPath];
  v5 = [(CNPhotoPickerActionsModel *)self deleteButton];
  [v6 actionsModel:self didDelete:v3 atIndexPath:v4 withSourceView:v5];
}

- (void)didTapDuplicate
{
  [(CNPhotoPickerActionsModel *)self setButtonsDisabled:1];
  v3 = [(CNPhotoPickerActionsModel *)self delegate];
  v4 = [(CNPhotoPickerActionsModel *)self providerItem];
  v5 = [(CNPhotoPickerActionsModel *)self indexPath];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__CNPhotoPickerActionsModel_didTapDuplicate__block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v3 actionsModel:self didDuplicate:v4 atIndexPath:v5 completionBlock:v6];
}

uint64_t __44__CNPhotoPickerActionsModel_didTapDuplicate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setButtonsDisabled:0];
}

- (void)didTapEdit
{
  id v5 = [(CNPhotoPickerActionsModel *)self delegate];
  v3 = [(CNPhotoPickerActionsModel *)self providerItem];
  v4 = [(CNPhotoPickerActionsModel *)self indexPath];
  [v5 actionsModel:self didEdit:v3 atIndexPath:v4];
}

- (void)didTapAssignToContact
{
  id v5 = [(CNPhotoPickerActionsModel *)self delegate];
  v3 = [(CNPhotoPickerActionsModel *)self providerItem];
  v4 = [(CNPhotoPickerActionsModel *)self indexPath];
  [v5 actionsModel:self didAssignToContact:v3 atIndexPath:v4];
}

- (void)updateProviderItem:(id)a3
{
  [(CNPhotoPickerActionsModel *)self setProviderItem:a3];
  id v4 = [(CNPhotoPickerActionsModel *)self generateInlineActionButtons];
  [(CNPhotoPickerActionsModel *)self setCurrentInlineActionButtons:v4];
}

- (void)setButtonsDisabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_buttonsDisabled != a3)
  {
    BOOL v3 = a3;
    self->_buttonsDisabled = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(CNPhotoPickerActionsModel *)self inlineActionButtons];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      BOOL v8 = !v3;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:v8];
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (id)generateInlineActionButtons
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  if ([(CNPhotoPickerActionsModel *)self canPerformActionType:0])
  {
    id v4 = objc_opt_class();
    uint64_t v5 = [(CNPhotoPickerActionsModel *)self assignActionTitleOverride];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke;
    v23[3] = &unk_1E549B600;
    objc_copyWeak(&v24, &location);
    uint64_t v6 = [v4 buttonForActionType:0 titleOverride:v5 withActionBlock:v23];

    objc_msgSend(v6, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    [v3 addObject:v6];

    objc_destroyWeak(&v24);
  }
  if ([(CNPhotoPickerActionsModel *)self canPerformActionType:1])
  {
    uint64_t v7 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_2;
    v21[3] = &unk_1E549B600;
    objc_copyWeak(&v22, &location);
    BOOL v8 = [v7 buttonForActionType:1 withActionBlock:v21];
    objc_msgSend(v8, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    [v3 addObject:v8];

    objc_destroyWeak(&v22);
  }
  if ([(CNPhotoPickerActionsModel *)self canPerformActionType:2])
  {
    uint64_t v9 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_3;
    v19[3] = &unk_1E549B600;
    objc_copyWeak(&v20, &location);
    long long v10 = [v9 buttonForActionType:2 withActionBlock:v19];
    objc_msgSend(v10, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    [v3 addObject:v10];

    objc_destroyWeak(&v20);
  }
  if ([(CNPhotoPickerActionsModel *)self canPerformActionType:3])
  {
    long long v11 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_4;
    v17[3] = &unk_1E549B600;
    objc_copyWeak(&v18, &location);
    long long v12 = [v11 buttonForActionType:3 withActionBlock:v17];
    [(CNPhotoPickerActionsModel *)self setDeleteButton:v12];

    BOOL v13 = [(CNPhotoPickerActionsModel *)self buttonsDisabled];
    v14 = [(CNPhotoPickerActionsModel *)self deleteButton];
    [v14 setEnabled:!v13];

    uint64_t v15 = [(CNPhotoPickerActionsModel *)self deleteButton];
    [v3 addObject:v15];

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);

  return v3;
}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapAssignToContact];
}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapEdit];
}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapDuplicate];
}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapDelete];
}

- (BOOL)canPerformActionType:(int64_t)a3
{
  if (a3 == 3)
  {
    return [(CNPhotoPickerActionsModel *)self canDelete];
  }
  else
  {
    if (a3 != 2 && a3 != 1) {
      return 1;
    }
    id v4 = [(CNPhotoPickerActionsModel *)self providerItem];
    if ([v4 allowsVariants])
    {
      uint64_t v5 = [(CNPhotoPickerActionsModel *)self providerItem];
      char v6 = [v5 allowsEditing];
    }
    else
    {
      char v6 = 0;
    }

    return v6;
  }
}

- (CNPhotoPickerActionsModel)initWithProviderItem:(id)a3 assignActionTitleOverride:(id)a4 canDelete:(BOOL)a5 atIndexPath:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNPhotoPickerActionsModel;
  v14 = [(CNPhotoPickerActionsModel *)&v20 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_providerItem, a3);
    objc_storeStrong((id *)&v15->_indexPath, a6);
    v15->_canDelete = a5;
    objc_storeStrong((id *)&v15->_assignActionTitleOverride, a4);
    uint64_t v16 = [(CNPhotoPickerActionsModel *)v15 generateInlineActionButtons];
    currentInlineActionButtons = v15->_currentInlineActionButtons;
    v15->_currentInlineActionButtons = (NSArray *)v16;

    id v18 = v15;
  }

  return v15;
}

+ (BOOL)actionIsDestructive:(int64_t)a3
{
  return a3 == 3;
}

+ (id)buttonForActionType:(int64_t)a3 titleOverride:(id)a4 withActionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [a1 localizedTitleForActionType:a3];
  }
  id v11 = v10;
  if ([a1 actionIsDestructive:a3]) {
    +[CNPhotoPickerActionButton destructiveButtonWithTitle:v11 actionBlock:v9];
  }
  else {
  id v12 = +[CNPhotoPickerActionButton defaultButtonWithTitle:v11 actionBlock:v9];
  }

  return v12;
}

+ (id)buttonForActionType:(int64_t)a3 withActionBlock:(id)a4
{
  return (id)[a1 buttonForActionType:a3 titleOverride:0 withActionBlock:a4];
}

+ (unint64_t)maximumNumberOfButtons
{
  return 4;
}

+ (id)localizedTitleForActionType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v4 = CNContactsUIBundle();
      uint64_t v5 = v4;
      char v6 = @"PHOTO_ACTION_SELECT_CONTACT";
      goto LABEL_6;
    case 1:
      id v4 = CNContactsUIBundle();
      uint64_t v5 = v4;
      char v6 = @"PHOTO_EDIT_LABEL";
      goto LABEL_6;
    case 2:
      id v4 = CNContactsUIBundle();
      uint64_t v5 = v4;
      char v6 = @"PHOTO_ACTION_DUPLICATE";
      goto LABEL_6;
    case 3:
      id v4 = CNContactsUIBundle();
      uint64_t v5 = v4;
      char v6 = @"PHOTO_ACTION_DELETE";
LABEL_6:
      BOOL v3 = [v4 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized"];

      break;
    default:
      break;
  }

  return v3;
}

@end