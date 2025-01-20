@interface AVTAvatarActionsMenuController
- (AVTAvatarActionsControllerDelegate)delegate;
- (AVTAvatarActionsMenuController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5;
- (AVTAvatarActionsProvider)actionsModel;
- (AVTAvatarEditorViewController)editorViewController;
- (AVTAvatarRecordDataSource)dataSource;
- (AVTUIEnvironment)environment;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (BOOL)isCreatingAvatar;
- (UIMenu)actionsMenu;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)confirmShouldDeleteRecord:(id)a3 resultBlock:(id)a4;
- (void)performCreateForActionsModel:(id)a3;
- (void)performDeleteForActionsModel:(id)a3;
- (void)performDuplicateForActionsModel:(id)a3;
- (void)performEditForActionsModel:(id)a3;
- (void)presentEditor:(id)a3 forCreating:(BOOL)a4;
- (void)setActionsMenu:(id)a3;
- (void)setActionsModel:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorViewController:(id)a3;
- (void)setIsCreatingAvatar:(BOOL)a3;
- (void)updateWithActionsModel:(id)a3;
@end

@implementation AVTAvatarActionsMenuController

- (AVTAvatarActionsMenuController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarActionsMenuController;
  v12 = [(AVTAvatarActionsMenuController *)&v15 init];
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
  [(AVTAvatarActionsMenuController *)self setActionsModel:a3];
  v4 = [(AVTAvatarActionsMenuController *)self actionsModel];
  [v4 setDelegate:self];

  actionsMenu = self->_actionsMenu;
  self->_actionsMenu = 0;
}

- (UIMenu)actionsMenu
{
  v30[1] = *MEMORY[0x263EF8340];
  actionsMenu = self->_actionsMenu;
  if (actionsMenu)
  {
    v3 = actionsMenu;
  }
  else
  {
    v5 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    v6 = [(AVTAvatarActionsMenuController *)self actionsModel];
    v7 = [v6 editAction];

    if (v7)
    {
      v8 = [(AVTAvatarActionsMenuController *)self actionsModel];
      id v9 = [v8 editAction];
      [v5 addObject:v9];
    }
    id v10 = [(AVTAvatarActionsMenuController *)self actionsModel];
    id v11 = [v10 duplicateAction];

    if (v11)
    {
      v12 = [(AVTAvatarActionsMenuController *)self actionsModel];
      v13 = [v12 duplicateAction];
      [v5 addObject:v13];
    }
    v14 = [(AVTAvatarActionsMenuController *)self actionsModel];
    objc_super v15 = [v14 deleteAction];

    if (v15)
    {
      v16 = [(AVTAvatarActionsMenuController *)self actionsModel];
      v17 = [v16 deleteAction];
      [v5 addObject:v17];
    }
    v18 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26BF058D0 image:0 identifier:0 options:1 children:v5];
    v19 = [MEMORY[0x263EFF980] arrayWithObject:v18];
    v20 = [(AVTAvatarActionsMenuController *)self actionsModel];
    v21 = [v20 createAction];

    if (v21)
    {
      v22 = (void *)MEMORY[0x263F1C7A8];
      v23 = [(AVTAvatarActionsMenuController *)self actionsModel];
      v24 = [v23 createAction];
      v30[0] = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
      v26 = [v22 menuWithTitle:&stru_26BF058D0 image:0 identifier:0 options:1 children:v25];

      [v19 addObject:v26];
    }
    v27 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26BF058D0 children:v19];
    v28 = self->_actionsMenu;
    self->_actionsMenu = v27;

    v3 = self->_actionsMenu;
  }
  return v3;
}

- (void)performCreateForActionsModel:(id)a3
{
  v4 = [(AVTAvatarActionsMenuController *)self dataSource];
  id v7 = [v4 internalRecordStore];

  v5 = [(AVTAvatarActionsMenuController *)self avtViewSessionProvider];
  v6 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v7 avtViewSessionProvider:v5];

  [(AVTAvatarActionsMenuController *)self presentEditor:v6 forCreating:1];
}

- (void)performEditForActionsModel:(id)a3
{
  v4 = [(AVTAvatarActionsMenuController *)self dataSource];
  id v9 = [v4 internalRecordStore];

  v5 = [(AVTAvatarActionsMenuController *)self actionsModel];
  v6 = [v5 avatarRecord];
  id v7 = [(AVTAvatarActionsMenuController *)self avtViewSessionProvider];
  v8 = +[AVTAvatarEditorViewController viewControllerForEditingAvatar:v6 avtViewSessionProvider:v7 store:v9];

  [(AVTAvatarActionsMenuController *)self presentEditor:v8 forCreating:0];
}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTAvatarActionsMenuController *)self setIsCreatingAvatar:v4];
  [(AVTAvatarActionsMenuController *)self setEditorViewController:v6];
  [v6 setDelegate:self];
  id v7 = [(AVTAvatarActionsMenuController *)self delegate];
  [v7 presentEditorViewController:v6 forActionsController:self isCreate:v4];
}

- (void)performDuplicateForActionsModel:(id)a3
{
  BOOL v4 = [(AVTAvatarActionsMenuController *)self environment];
  v5 = [v4 usageTrackingSession];
  id v6 = [(AVTAvatarActionsMenuController *)self actionsModel];
  id v7 = [v6 avatarRecord];
  [v5 didDuplicateAvatar:v7];

  v8 = [(AVTAvatarActionsMenuController *)self dataSource];
  id v9 = [v8 internalRecordStore];
  id v10 = [(AVTAvatarActionsMenuController *)self actionsModel];
  id v11 = [v10 avatarRecord];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke;
  v12[3] = &unk_263FF07A8;
  v12[4] = self;
  [v9 duplicateAvatar:v11 completionBlock:v12];
}

void __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke_2;
    v7[3] = &unk_263FF0780;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionsController:*(void *)(a1 + 32) didDuplicateToRecord:*(void *)(a1 + 40) completionBlock:0];
}

- (void)performDeleteForActionsModel:(id)a3
{
  BOOL v4 = [(AVTAvatarActionsMenuController *)self actionsModel];
  id v5 = [v4 avatarRecord];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke;
  v7[3] = &unk_263FF0478;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(AVTAvatarActionsMenuController *)self confirmShouldDeleteRecord:v6 resultBlock:v7];
}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) environment];
    BOOL v4 = [v3 usageTrackingSession];
    [v4 didDeleteAvatar:*(void *)(a1 + 40)];

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) dataSource];
    id v7 = +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:v5 withDataSource:v6];

    id v8 = [*(id *)(a1 + 32) dataSource];
    id v9 = [v8 internalRecordStore];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_2;
    v12[3] = &unk_263FF07F8;
    id v10 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v10;
    id v14 = v7;
    id v11 = v7;
    [v9 deleteAvatar:v13 completionHandler:v12];
  }
}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_3;
    block[3] = &unk_263FF07D0;
    v3 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionsController:*(void *)(a1 + 32) didDeleteRecord:*(void *)(a1 + 40) withRecordUpdate:*(void *)(a1 + 48) completionBlock:0];
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(AVTAvatarActionsMenuController *)self isCreatingAvatar];
  if ([(AVTAvatarActionsMenuController *)self isCreatingAvatar])
  {
    [(AVTAvatarActionsMenuController *)self setIsCreatingAvatar:0];
    id v9 = [(AVTAvatarActionsMenuController *)self delegate];
    [v9 actionsController:self didAddRecord:v6];
  }
  else
  {
    id v9 = [(AVTAvatarActionsMenuController *)self delegate];
    [v9 actionsController:self didEditRecord:v6];
  }

  id v10 = [(AVTAvatarActionsMenuController *)self delegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__AVTAvatarActionsMenuController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v11[3] = &unk_263FF03D8;
  v11[4] = self;
  [v10 dismissEditorViewController:v7 forActionsController:self wasCreate:v8 didEdit:1 animated:1 completion:v11];
}

uint64_t __87__AVTAvatarActionsMenuController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditorViewController:0];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVTAvatarActionsMenuController *)self isCreatingAvatar];
  [(AVTAvatarActionsMenuController *)self setIsCreatingAvatar:0];
  [v4 setDisableAvatarSnapshotting:1];
  id v6 = [(AVTAvatarActionsMenuController *)self delegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__AVTAvatarActionsMenuController_avatarEditorViewControllerDidCancel___block_invoke;
  v7[3] = &unk_263FF03D8;
  v7[4] = self;
  [v6 dismissEditorViewController:v4 forActionsController:self wasCreate:v5 didEdit:0 animated:1 completion:v7];
}

uint64_t __70__AVTAvatarActionsMenuController_avatarEditorViewControllerDidCancel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 actionsModel];
  BOOL v5 = [v4 avatarRecord];
  [v2 actionsController:v3 didCancelEditingRecord:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 setEditorViewController:0];
}

- (void)confirmShouldDeleteRecord:(id)a3 resultBlock:(id)a4
{
  BOOL v5 = (void (**)(id, uint64_t))a4;
  if (AVTUIDisableDeleteConfirmation_once())
  {
    v5[2](v5, 1);
  }
  else
  {
    id v6 = AVTAvatarUIBundle();
    id v7 = [v6 localizedStringForKey:@"DELETE_MEMOJI_ALERT_MESSAGE" value:&stru_26BF058D0 table:@"Localized"];
    BOOL v8 = +[AVTAlertController alertControllerWithTitle:0 message:v7 preferredStyle:1];

    id v9 = (void *)MEMORY[0x263F1C3F0];
    id v10 = AVTAvatarUIBundle();
    id v11 = [v10 localizedStringForKey:@"DELETE_MEMOJI_ALERT_CANCEL" value:&stru_26BF058D0 table:@"Localized"];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke;
    v24[3] = &unk_263FF0820;
    v12 = v5;
    v25 = v12;
    id v13 = [v9 actionWithTitle:v11 style:1 handler:v24];
    [v8 addAction:v13];

    id v14 = (void *)MEMORY[0x263F1C3F0];
    objc_super v15 = AVTAvatarUIBundle();
    v16 = [v15 localizedStringForKey:@"DELETE_MEMOJI_ALERT_CONFIRM" value:&stru_26BF058D0 table:@"Localized"];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke_2;
    v22 = &unk_263FF0820;
    v23 = v12;
    v17 = [v14 actionWithTitle:v16 style:2 handler:&v19];
    objc_msgSend(v8, "addAction:", v17, v19, v20, v21, v22);

    v18 = [(AVTAvatarActionsMenuController *)self delegate];
    [v18 actionsController:self presentAlertController:v8];
  }
}

uint64_t __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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

- (void)setActionsMenu:(id)a3
{
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
  objc_storeStrong((id *)&self->_actionsMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
}

@end