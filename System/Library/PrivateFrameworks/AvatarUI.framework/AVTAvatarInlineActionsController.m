@interface AVTAvatarInlineActionsController
+ (id)buttonForAction:(id)a3;
- (AVTAvatarActionsControllerDelegate)delegate;
- (AVTAvatarActionsProvider)actionsModel;
- (AVTAvatarEditorViewController)editorViewController;
- (AVTAvatarInlineActionsController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5;
- (AVTAvatarRecordDataSource)dataSource;
- (AVTUIEnvironment)environment;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (BOOL)buttonsDisabled;
- (BOOL)isCreatingAvatar;
- (BOOL)shouldHideUserInfoView;
- (NSArray)inlineActionButtons;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)confirmShouldDeleteRecord:(id)a3 sender:(id)a4 resultBlock:(id)a5;
- (void)performCreateForActionsModel:(id)a3;
- (void)performDeleteForActionsModel:(id)a3;
- (void)performDuplicateForActionsModel:(id)a3;
- (void)performEdit;
- (void)presentEditor:(id)a3 forCreating:(BOOL)a4;
- (void)setActionsModel:(id)a3;
- (void)setButtonsDisabled:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorViewController:(id)a3;
- (void)setInlineActionButtons:(id)a3;
- (void)setIsCreatingAvatar:(BOOL)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)updateForChangedContentCategorySize;
- (void)updateWithActionsModel:(id)a3;
@end

@implementation AVTAvatarInlineActionsController

+ (id)buttonForAction:(id)a3
{
  id v3 = a3;
  if (([v3 attributes] & 2) != 0) {
    +[AVTAvatarActionButton destructiveButtonWithAction:v3];
  }
  else {
  v4 = +[AVTAvatarActionButton defaultButtonWithAction:v3];
  }

  return v4;
}

- (AVTAvatarInlineActionsController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarInlineActionsController;
  v12 = [(AVTAvatarInlineActionsController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_environment, a5);
    objc_storeStrong((id *)&v13->_avtViewSessionProvider, a4);
  }

  return v13;
}

- (void)updateWithActionsModel:(id)a3
{
  [(AVTAvatarInlineActionsController *)self setActionsModel:a3];
  v4 = [(AVTAvatarInlineActionsController *)self actionsModel];
  [v4 setDelegate:self];

  inlineActionButtons = self->_inlineActionButtons;
  self->_inlineActionButtons = 0;
}

- (NSArray)inlineActionButtons
{
  inlineActionButtons = self->_inlineActionButtons;
  if (inlineActionButtons)
  {
    id v3 = inlineActionButtons;
  }
  else
  {
    v5 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    v6 = [(AVTAvatarInlineActionsController *)self actionsModel];
    v7 = [v6 createAction];

    if (v7)
    {
      v8 = objc_opt_class();
      id v9 = [(AVTAvatarInlineActionsController *)self actionsModel];
      id v10 = [v9 createAction];
      id v11 = [v8 buttonForAction:v10];
      [(NSArray *)v5 addObject:v11];
    }
    v12 = [(AVTAvatarInlineActionsController *)self actionsModel];
    v13 = [v12 editAction];

    if (v13)
    {
      v14 = objc_opt_class();
      objc_super v15 = [(AVTAvatarInlineActionsController *)self actionsModel];
      v16 = [v15 editAction];
      v17 = [v14 buttonForAction:v16];
      [(NSArray *)v5 addObject:v17];
    }
    v18 = [(AVTAvatarInlineActionsController *)self actionsModel];
    v19 = [v18 duplicateAction];

    if (v19)
    {
      v20 = objc_opt_class();
      v21 = [(AVTAvatarInlineActionsController *)self actionsModel];
      v22 = [v21 duplicateAction];
      v23 = [v20 buttonForAction:v22];
      [(NSArray *)v5 addObject:v23];
    }
    v24 = [(AVTAvatarInlineActionsController *)self actionsModel];
    v25 = [v24 deleteAction];

    if (v25)
    {
      v26 = objc_opt_class();
      v27 = [(AVTAvatarInlineActionsController *)self actionsModel];
      v28 = [v27 deleteAction];
      v29 = [v26 buttonForAction:v28];
      [(NSArray *)v5 addObject:v29];
    }
    v30 = self->_inlineActionButtons;
    self->_inlineActionButtons = v5;
    v31 = v5;

    id v3 = self->_inlineActionButtons;
  }
  return v3;
}

- (void)setButtonsDisabled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_buttonsDisabled != a3)
  {
    BOOL v3 = a3;
    self->_buttonsDisabled = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(AVTAvatarInlineActionsController *)self inlineActionButtons];
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

- (void)updateForChangedContentCategorySize
{
  self->_inlineActionButtons = 0;
  MEMORY[0x270F9A758]();
}

- (void)performCreateForActionsModel:(id)a3
{
  [(AVTAvatarInlineActionsController *)self setButtonsDisabled:1];
  v4 = [(AVTAvatarInlineActionsController *)self dataSource];
  id v7 = [v4 internalRecordStore];

  uint64_t v5 = [(AVTAvatarInlineActionsController *)self avtViewSessionProvider];
  uint64_t v6 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v7 avtViewSessionProvider:v5];

  objc_msgSend(v6, "setShouldHideUserInfoView:", -[AVTAvatarInlineActionsController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  [(AVTAvatarInlineActionsController *)self presentEditor:v6 forCreating:1];
}

- (void)performEdit
{
  [(AVTAvatarInlineActionsController *)self setButtonsDisabled:1];
  BOOL v3 = [(AVTAvatarInlineActionsController *)self dataSource];
  id v8 = [v3 internalRecordStore];

  v4 = [(AVTAvatarInlineActionsController *)self actionsModel];
  uint64_t v5 = [v4 avatarRecord];
  uint64_t v6 = [(AVTAvatarInlineActionsController *)self avtViewSessionProvider];
  id v7 = +[AVTAvatarEditorViewController viewControllerForEditingAvatar:v5 avtViewSessionProvider:v6 store:v8];

  objc_msgSend(v7, "setShouldHideUserInfoView:", -[AVTAvatarInlineActionsController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  [(AVTAvatarInlineActionsController *)self presentEditor:v7 forCreating:0];
}

- (void)performDuplicateForActionsModel:(id)a3
{
  [(AVTAvatarInlineActionsController *)self setButtonsDisabled:1];
  v4 = [(AVTAvatarInlineActionsController *)self environment];
  uint64_t v5 = [v4 usageTrackingSession];
  uint64_t v6 = [(AVTAvatarInlineActionsController *)self actionsModel];
  id v7 = [v6 avatarRecord];
  [v5 didDuplicateAvatar:v7];

  id v8 = [(AVTAvatarInlineActionsController *)self dataSource];
  uint64_t v9 = [v8 internalRecordStore];
  long long v10 = [(AVTAvatarInlineActionsController *)self actionsModel];
  long long v11 = [v10 avatarRecord];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke;
  v12[3] = &unk_263FF07A8;
  v12[4] = self;
  [v9 duplicateAvatar:v11 completionBlock:v12];
}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_2;
    v7[3] = &unk_263FF0780;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_3;
  v7[3] = &unk_263FF0780;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 actionsController:v4 didDuplicateToRecord:v5 completionBlock:v7];
}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_3(uint64_t a1)
{
  v2 = [AVTAvatarActionsProvider alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) dataSource];
  id v5 = [*(id *)(a1 + 40) actionsModel];
  id v7 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v2, "initWithAvatarRecord:dataSource:allowCreate:", v3, v4, [v5 allowCreate]);

  [*(id *)(a1 + 40) updateWithActionsModel:v7];
  uint64_t v6 = [*(id *)(a1 + 40) delegate];
  [v6 actionsControllerDidUpdateActions:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) setButtonsDisabled:0];
  if ((AVTUIDisableEditAfterDuplicate_once() & 1) == 0) {
    [*(id *)(a1 + 40) performEdit];
  }
}

- (void)performDeleteForActionsModel:(id)a3
{
  uint64_t v4 = [(AVTAvatarInlineActionsController *)self actionsModel];
  id v5 = [v4 avatarRecord];

  uint64_t v6 = [(AVTAvatarInlineActionsController *)self inlineActionButtons];
  id v7 = [v6 lastObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke;
  v9[3] = &unk_263FF0478;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(AVTAvatarInlineActionsController *)self confirmShouldDeleteRecord:v8 sender:v7 resultBlock:v9];
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setButtonsDisabled:1];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) dataSource];
    id v5 = +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:v3 withDataSource:v4];

    uint64_t v6 = [*(id *)(a1 + 32) environment];
    id v7 = [v6 usageTrackingSession];
    [v7 didDeleteAvatar:*(void *)(a1 + 40)];

    id v8 = [*(id *)(a1 + 32) dataSource];
    uint64_t v9 = [v8 internalRecordStore];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_2;
    v12[3] = &unk_263FF07F8;
    id v10 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v10;
    id v14 = v5;
    id v11 = v5;
    [v9 deleteAvatar:v13 completionHandler:v12];
  }
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_3;
    block[3] = &unk_263FF07D0;
    uint64_t v3 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_4;
  v8[3] = &unk_263FF0780;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v2 actionsController:v3 didDeleteRecord:v4 withRecordUpdate:v6 completionBlock:v8];
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [AVTAvatarActionsProvider alloc];
    uint64_t v3 = [*(id *)(a1 + 32) avatarRecord];
    uint64_t v4 = [*(id *)(a1 + 40) dataSource];
    id v5 = [*(id *)(a1 + 40) actionsModel];
    uint64_t v7 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v2, "initWithAvatarRecord:dataSource:allowCreate:", v3, v4, [v5 allowCreate]);

    [*(id *)(a1 + 40) updateWithActionsModel:v7];
    id v6 = [*(id *)(a1 + 40) delegate];
    [v6 actionsControllerDidUpdateActions:*(void *)(a1 + 40)];

    [*(id *)(a1 + 40) setButtonsDisabled:0];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) delegate];
    [(AVTAvatarActionsProvider *)v7 actionsControllerDidFinish:*(void *)(a1 + 40)];
  }
}

- (void)confirmShouldDeleteRecord:(id)a3 sender:(id)a4 resultBlock:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if (AVTUIDisableDeleteConfirmation_once())
  {
    v8[2](v8, 1);
  }
  else
  {
    id v9 = AVTAvatarUIBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"DELETE_MEMOJI_ALERT_MESSAGE" value:&stru_26BF058D0 table:@"Localized"];
    id v11 = +[AVTAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];

    long long v12 = (void *)MEMORY[0x263F1C3F0];
    id v13 = AVTAvatarUIBundle();
    id v14 = [v13 localizedStringForKey:@"DELETE_MEMOJI_ALERT_CONFIRM" value:&stru_26BF058D0 table:@"Localized"];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke;
    v28[3] = &unk_263FF0820;
    uint64_t v15 = v8;
    v29 = v15;
    v16 = [v12 actionWithTitle:v14 style:2 handler:v28];
    [v11 addAction:v16];

    v17 = (void *)MEMORY[0x263F1C3F0];
    v18 = AVTAvatarUIBundle();
    v19 = [v18 localizedStringForKey:@"DELETE_MEMOJI_ALERT_CANCEL" value:&stru_26BF058D0 table:@"Localized"];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke_2;
    v26 = &unk_263FF0820;
    v27 = v15;
    v20 = [v17 actionWithTitle:v19 style:1 handler:&v23];
    objc_msgSend(v11, "addAction:", v20, v23, v24, v25, v26);

    v21 = [v11 popoverPresentationController];
    [v21 setSourceView:v7];

    v22 = [(AVTAvatarInlineActionsController *)self delegate];
    [v22 actionsController:self presentAlertController:v11];
  }
}

uint64_t __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTAvatarInlineActionsController *)self setIsCreatingAvatar:v4];
  [v6 setDelegate:self];
  id v7 = [(AVTAvatarInlineActionsController *)self delegate];
  [v7 presentEditorViewController:v6 forActionsController:self isCreate:v4];
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v5 = a4;
  if ([(AVTAvatarInlineActionsController *)self isCreatingAvatar])
  {
    [(AVTAvatarInlineActionsController *)self setIsCreatingAvatar:0];
    id v6 = [(AVTAvatarInlineActionsController *)self delegate];
    [(AVTAvatarActionsProvider *)v6 actionsController:self didAddRecord:v5];
  }
  else
  {
    id v7 = [AVTAvatarActionsProvider alloc];
    id v8 = [(AVTAvatarInlineActionsController *)self dataSource];
    id v9 = [(AVTAvatarInlineActionsController *)self actionsModel];
    id v6 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v7, "initWithAvatarRecord:dataSource:allowCreate:", v5, v8, [v9 allowCreate]);

    [(AVTAvatarInlineActionsController *)self updateWithActionsModel:v6];
    id v5 = [(AVTAvatarInlineActionsController *)self delegate];
    uint64_t v10 = [(AVTAvatarActionsProvider *)v6 avatarRecord];
    [v5 actionsController:self didEditRecord:v10];
  }
  [(AVTAvatarInlineActionsController *)self setButtonsDisabled:0];
  id v11 = [(AVTAvatarInlineActionsController *)self delegate];
  [v11 actionsControllerDidFinish:self];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTAvatarInlineActionsController *)self isCreatingAvatar];
  [(AVTAvatarInlineActionsController *)self setIsCreatingAvatar:0];
  [(AVTAvatarInlineActionsController *)self setButtonsDisabled:0];
  [v4 setDisableAvatarSnapshotting:1];
  id v6 = [(AVTAvatarInlineActionsController *)self delegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__AVTAvatarInlineActionsController_avatarEditorViewControllerDidCancel___block_invoke;
  v7[3] = &unk_263FF03D8;
  void v7[4] = self;
  [v6 dismissEditorViewController:v4 forActionsController:self wasCreate:v5 didEdit:0 animated:1 completion:v7];
}

uint64_t __72__AVTAvatarInlineActionsController_avatarEditorViewControllerDidCancel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 actionsModel];
  BOOL v5 = [v4 avatarRecord];
  [v2 actionsController:v3 didCancelEditingRecord:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 setEditorViewController:0];
}

- (AVTAvatarActionsProvider)actionsModel
{
  return self->_actionsModel;
}

- (void)setActionsModel:(id)a3
{
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (AVTAvatarActionsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarActionsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setInlineActionButtons:(id)a3
{
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (BOOL)buttonsDisabled
{
  return self->_buttonsDisabled;
}

- (AVTAvatarEditorViewController)editorViewController
{
  return self->_editorViewController;
}

- (void)setEditorViewController:(id)a3
{
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)isCreatingAvatar
{
  return self->_isCreatingAvatar;
}

- (void)setIsCreatingAvatar:(BOOL)a3
{
  self->_isCreatingAvatar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_inlineActionButtons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
}

@end