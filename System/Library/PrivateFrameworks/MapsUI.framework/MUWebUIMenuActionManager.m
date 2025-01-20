@interface MUWebUIMenuActionManager
- (MUPlaceActionManager)placeActionManager;
- (MUWebUIMenuActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 externalActionViewModel:(id)a5;
- (NSArray)externalActionViewModels;
- (int)_buttonItemTypeFromMUUserInteractionType:(int)a3;
- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5;
- (void)performActionWithAction:(id)a3 contextMenu:(id)a4 completion:(id)a5;
- (void)setExternalActionViewModels:(id)a3;
- (void)setPlaceActionManager:(id)a3;
@end

@implementation MUWebUIMenuActionManager

- (MUWebUIMenuActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 externalActionViewModel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MUWebUIMenuActionManager;
  v10 = [(MUWebUIMenuActionManager *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_placeActionManager, a3);
    objc_storeStrong((id *)&v11->_externalActionViewModels, a5);
  }

  return v11;
}

- (void)performActionWithAction:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = *MEMORY[0x1E4F30DC8];
  v23[0] = v8;
  v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = a3;
  v12 = [v10 dictionaryWithObjects:v23 forKeys:&v22 count:1];
  uint64_t v13 = -[MUWebUIMenuActionManager _buttonItemTypeFromMUUserInteractionType:](self, "_buttonItemTypeFromMUUserInteractionType:", [v11 userInteractionType]);
  int v14 = [v11 hasUserInteractionType];

  if (v14 && v13)
  {
    v15 = [(MUWebUIMenuActionManager *)self placeActionManager];
    v16 = [v15 actionItemForButtonType:v13];

    v17 = [(MUWebUIMenuActionManager *)self placeActionManager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__MUWebUIMenuActionManager_performActionWithAction_contextMenu_completion___block_invoke;
    v20[3] = &unk_1E574EEA8;
    id v21 = v9;
    [v17 performAction:v16 options:v12 completion:v20];
  }
  else
  {
    v18 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1931EA000, v18, OS_LOG_TYPE_ERROR, "PerformAction fails: Unknown ButtonItemType", v19, 2u);
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

uint64_t __75__MUWebUIMenuActionManager_performActionWithAction_contextMenu_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v13 hasAction])
  {
    v10 = [v13 action];
    [(MUWebUIMenuActionManager *)self performActionWithAction:v10 contextMenu:v8 completion:v9];
  }
  else
  {
    id v11 = [v13 url];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      v10 = [(NSArray *)self->_externalActionViewModels firstObject];
      [v10 performSingleVendorSelectionAction];
    }
    else
    {
      v10 = [v13 groupDatas];
      [v10 count];
    }
  }
}

- (int)_buttonItemTypeFromMUUserInteractionType:(int)a3
{
  if ((a3 - 6) > 0xB) {
    return 0;
  }
  else {
    return dword_19335B768[a3 - 6];
  }
}

- (MUPlaceActionManager)placeActionManager
{
  return self->_placeActionManager;
}

- (void)setPlaceActionManager:(id)a3
{
}

- (NSArray)externalActionViewModels
{
  return self->_externalActionViewModels;
}

- (void)setExternalActionViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalActionViewModels, 0);
  objc_storeStrong((id *)&self->_placeActionManager, 0);
}

@end