@interface AVTAvatarActionsProvider
+ (id)localizedTitleForActionType:(int64_t)a3;
+ (unint64_t)maximumNumberOfActions;
- (AVTAvatarActionsModelDelegate)delegate;
- (AVTAvatarActionsProvider)initWithAvatarRecord:(id)a3 dataSource:(id)a4 allowCreate:(BOOL)a5;
- (AVTAvatarRecord)avatarRecord;
- (AVTAvatarRecordDataSource)dataSource;
- (BOOL)allowCreate;
- (BOOL)canPerformActionType:(int64_t)a3;
- (UIAction)createAction;
- (UIAction)deleteAction;
- (UIAction)duplicateAction;
- (UIAction)editAction;
- (void)didTapCreateNew;
- (void)didTapDelete:(id)a3;
- (void)didTapDuplicate;
- (void)didTapEdit;
- (void)generateActions;
- (void)setAvatarRecord:(id)a3;
- (void)setCreateAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteAction:(id)a3;
- (void)setDuplicateAction:(id)a3;
- (void)setEditAction:(id)a3;
@end

@implementation AVTAvatarActionsProvider

+ (id)localizedTitleForActionType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = AVTAvatarUIBundle();
      v4 = v3;
      v5 = @"EDIT";
      goto LABEL_7;
    case 1:
      v3 = AVTAvatarUIBundle();
      v4 = v3;
      v5 = @"DUPLICATE";
      goto LABEL_7;
    case 2:
      v3 = AVTAvatarUIBundle();
      v4 = v3;
      v5 = @"DELETE";
      goto LABEL_7;
    case 3:
      v3 = AVTAvatarUIBundle();
      v4 = v3;
      v5 = @"CREATE";
LABEL_7:
      v6 = [v3 localizedStringForKey:v5 value:&stru_26BF058D0 table:@"Localized"];

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (unint64_t)maximumNumberOfActions
{
  return 4;
}

- (AVTAvatarActionsProvider)initWithAvatarRecord:(id)a3 dataSource:(id)a4 allowCreate:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarActionsProvider;
  v11 = [(AVTAvatarActionsProvider *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    objc_storeStrong((id *)&v12->_dataSource, a4);
    v12->_allowCreate = a5;
    [(AVTAvatarActionsProvider *)v12 generateActions];
  }

  return v12;
}

- (BOOL)canPerformActionType:(int64_t)a3
{
  v5 = [(AVTAvatarActionsProvider *)self avatarRecord];
  int v6 = [v5 isEditable];

  if (v6)
  {
    v7 = [(AVTAvatarActionsProvider *)self dataSource];
    v8 = [v7 internalRecordStore];
    int v9 = [v8 canCreateAvatarWithError:0];

    if (a3 != 1)
    {
      if (a3 == 3) {
        return [(AVTAvatarActionsProvider *)self allowCreate] & v9;
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)generateActions
{
  objc_initWeak(&location, self);
  if ([(AVTAvatarActionsProvider *)self canPerformActionType:3])
  {
    v3 = (void *)MEMORY[0x263F1C3C0];
    v4 = [(id)objc_opt_class() localizedTitleForActionType:3];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke;
    v22[3] = &unk_263FF1AD0;
    objc_copyWeak(&v23, &location);
    v5 = [v3 actionWithTitle:v4 image:0 identifier:@"create" handler:v22];
    [(AVTAvatarActionsProvider *)self setCreateAction:v5];

    objc_destroyWeak(&v23);
  }
  if ([(AVTAvatarActionsProvider *)self canPerformActionType:0])
  {
    int v6 = (void *)MEMORY[0x263F1C3C0];
    v7 = [(id)objc_opt_class() localizedTitleForActionType:0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_2;
    v20[3] = &unk_263FF1AD0;
    objc_copyWeak(&v21, &location);
    v8 = [v6 actionWithTitle:v7 image:0 identifier:@"edit" handler:v20];
    [(AVTAvatarActionsProvider *)self setEditAction:v8];

    objc_destroyWeak(&v21);
  }
  if ([(AVTAvatarActionsProvider *)self canPerformActionType:1])
  {
    int v9 = (void *)MEMORY[0x263F1C3C0];
    id v10 = [(id)objc_opt_class() localizedTitleForActionType:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_3;
    v18[3] = &unk_263FF1AD0;
    objc_copyWeak(&v19, &location);
    v11 = [v9 actionWithTitle:v10 image:0 identifier:@"duplicate" handler:v18];
    [(AVTAvatarActionsProvider *)self setDuplicateAction:v11];

    objc_destroyWeak(&v19);
  }
  if ([(AVTAvatarActionsProvider *)self canPerformActionType:2])
  {
    v12 = (void *)MEMORY[0x263F1C3C0];
    v13 = [(id)objc_opt_class() localizedTitleForActionType:2];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_4;
    v16[3] = &unk_263FF1AD0;
    objc_copyWeak(&v17, &location);
    objc_super v14 = [v12 actionWithTitle:v13 image:0 identifier:@"delete" handler:v16];
    [(AVTAvatarActionsProvider *)self setDeleteAction:v14];

    v15 = [(AVTAvatarActionsProvider *)self deleteAction];
    [v15 setAttributes:2];

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapCreateNew];
}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapEdit];
}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapDuplicate];
}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTapDelete:0];
}

- (void)didTapCreateNew
{
  id v3 = [(AVTAvatarActionsProvider *)self delegate];
  [v3 performCreateForActionsModel:self];
}

- (void)didTapEdit
{
  id v3 = [(AVTAvatarActionsProvider *)self delegate];
  [v3 performEditForActionsModel:self];
}

- (void)didTapDuplicate
{
  id v3 = [(AVTAvatarActionsProvider *)self delegate];
  [v3 performDuplicateForActionsModel:self];
}

- (void)didTapDelete:(id)a3
{
  id v4 = [(AVTAvatarActionsProvider *)self delegate];
  [v4 performDeleteForActionsModel:self];
}

- (AVTAvatarActionsModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarActionsModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (UIAction)createAction
{
  return self->_createAction;
}

- (void)setCreateAction:(id)a3
{
}

- (UIAction)editAction
{
  return self->_editAction;
}

- (void)setEditAction:(id)a3
{
}

- (UIAction)duplicateAction
{
  return self->_duplicateAction;
}

- (void)setDuplicateAction:(id)a3
{
}

- (UIAction)deleteAction
{
  return self->_deleteAction;
}

- (void)setDeleteAction:(id)a3
{
}

- (BOOL)allowCreate
{
  return self->_allowCreate;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_duplicateAction, 0);
  objc_storeStrong((id *)&self->_editAction, 0);
  objc_storeStrong((id *)&self->_createAction, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end