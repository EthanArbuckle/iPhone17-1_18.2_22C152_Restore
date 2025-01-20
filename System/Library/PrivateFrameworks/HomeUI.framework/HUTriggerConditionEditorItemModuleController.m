@interface HUTriggerConditionEditorItemModuleController
- (BOOL)_canEditConditionOptionItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUTriggerConditionDetailEditingContext)detailEditingContext;
- (HUTriggerConditionEditorItemModuleController)initWithModule:(id)a3 delegate:(id)a4;
- (HUTriggerConditionEditorItemModuleControllerDelegate)delegate;
- (unint64_t)didSelectItem:(id)a3;
- (void)_dismissDetailEditor:(id)a3;
- (void)_presentDetailEditorForConditionOptionItem:(id)a3;
- (void)accessoryButtonTappedForItem:(id)a3;
- (void)setDetailEditingContext:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)timeConditionEditor:(id)a3 didFinishWithCondition:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUTriggerConditionEditorItemModuleController

- (HUTriggerConditionEditorItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerConditionEditorItemModuleController;
  v7 = [(HUItemModuleController *)&v10 initWithModule:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  id v5 = a3;
  id v6 = [(HUItemModuleController *)self module];
  int v7 = [v6 isShowConditionOptionsItem:v5];

  if (v7) {
    goto LABEL_4;
  }
  v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 isCustomConditionSwitchItem:v5];

  if (v9
    || ([(HUItemModuleController *)self module],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isConditionOptionItem:v5],
        v10,
        v11))
  {
LABEL_4:
    v12 = objc_opt_class();
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorItemModuleController.m", 57, @"Unknown item %@", v5 object file lineNumber description];

    v12 = 0;
  }

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  int v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 isShowConditionOptionsItem:v6];

  if (!v8)
  {
    v15 = [(HUItemModuleController *)self module];
    int v16 = [v15 isCustomConditionSwitchItem:v6];

    if (!v16) {
      goto LABEL_20;
    }
    uint64_t v17 = objc_opt_class();
    id v18 = v22;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      v12 = v18;
      if (v19) {
        goto LABEL_18;
      }
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v20 handleFailureInFunction:v21, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
    }
    v12 = 0;
LABEL_18:

    [v12 setDelegate:self];
    goto LABEL_19;
  }
  uint64_t v9 = objc_opt_class();
  id v10 = v22;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    v12 = v10;
    if (v11) {
      goto LABEL_9;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];
  }
  v12 = 0;
LABEL_9:

  [v12 setHideIcon:1];
  [v12 setValueColorFollowsTintColor:1];
  [v12 setAccessoryType:0];
LABEL_19:

LABEL_20:
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v24 = a3;
  id v7 = a4;
  int v8 = [(HUItemModuleController *)self module];
  int v9 = [v8 isConditionOptionItem:v7];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v24;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      v13 = v11;
      if (v12) {
        goto LABEL_9;
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v10, objc_opt_class() file lineNumber description];
    }
    v13 = 0;
LABEL_9:

    int v16 = [v7 latestResults];
    uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v13 setTitleText:v17];

    id v18 = [v7 latestResults];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v13 setDescriptionText:v19];

    v20 = [v7 latestResults];
    v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
    uint64_t v22 = [v21 unsignedIntegerValue];

    [v13 setChecked:v22 == 2];
    if (v22 == 2)
    {
      if ([(HUTriggerConditionEditorItemModuleController *)self _canEditConditionOptionItem:v7])
      {
        uint64_t v23 = 4;
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    [v13 setAccessoryType:v23];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemModuleController *)self module];
  int v6 = [v5 isShowConditionOptionsItem:v4];

  id v7 = [(HUItemModuleController *)self module];
  int v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 conditionTypeForItem:v4];

    uint64_t v10 = [(HUItemModuleController *)self module];
    uint64_t v11 = [v10 shouldShowConditionOptionsForType:v9] ^ 1;

    v12 = [(HUItemModuleController *)self module];
    [v12 setShowConditionOptions:v11 forType:v9];
LABEL_9:

    goto LABEL_10;
  }
  int v13 = [v7 isConditionOptionItem:v4];

  if (v13)
  {
    v14 = [(HUItemModuleController *)self module];
    int v15 = [v14 doesConditionOptionItemRequireInitialConfiguration:v4];

    if (v15)
    {
      [(HUTriggerConditionEditorItemModuleController *)self _presentDetailEditorForConditionOptionItem:v4];
    }
    else
    {
      int v16 = [(HUItemModuleController *)self module];
      uint64_t v17 = [v16 conditionTypeForItem:v4];

      id v18 = [(HUItemModuleController *)self module];
      [v18 setSelectedConditionOptionItem:v4 forType:v17];
    }
    v19 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v12 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
      v21 = [(HUItemModuleController *)self module];
      uint64_t v22 = [v21 conditionCollection];
      [v12 conditionEditorModuleController:self didUpdateConditionCollection:v22];

      goto LABEL_9;
    }
  }
LABEL_10:

  return 0;
}

- (void)accessoryButtonTappedForItem:(id)a3
{
  id v6 = a3;
  id v4 = [(HUItemModuleController *)self module];
  int v5 = [v4 isConditionOptionItem:v6];

  if (v5) {
    [(HUTriggerConditionEditorItemModuleController *)self _presentDetailEditorForConditionOptionItem:v6];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(HUItemModuleController *)self module];
  id v7 = [v15 item];
  int v8 = [v6 isCustomConditionSwitchItem:v7];

  if (v8)
  {
    uint64_t v9 = [(HUItemModuleController *)self module];
    uint64_t v10 = [v15 item];
    [(id)v9 setCustomConditionEnabled:v4 forItem:v10];

    uint64_t v11 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if (v9)
    {
      v12 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
      int v13 = [(HUItemModuleController *)self module];
      v14 = [v13 conditionCollection];
      [v12 conditionEditorModuleController:self didUpdateConditionCollection:v14];
    }
  }
}

- (void)timeConditionEditor:(id)a3 didFinishWithCondition:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [(HUItemModuleController *)self module];
  int v8 = [(HUTriggerConditionEditorItemModuleController *)self detailEditingContext];
  uint64_t v9 = [v8 optionItem];
  [(id)v7 updateCondition:v6 forOptionItem:v9];

  uint64_t v10 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v11 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
    v12 = [(HUItemModuleController *)self module];
    int v13 = [v12 conditionCollection];
    [v11 conditionEditorModuleController:self didUpdateConditionCollection:v13];
  }
  [(HUTriggerConditionEditorItemModuleController *)self _dismissDetailEditor:v14];
}

- (BOOL)_canEditConditionOptionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemModuleController *)self module];
  id v6 = [(id)v5 conditionForOptionItem:v4];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & 1;
}

- (void)_dismissDetailEditor:(id)a3
{
  id v10 = a3;
  id v4 = [(HUTriggerConditionEditorItemModuleController *)self detailEditingContext];
  id v5 = [v4 viewController];

  if (v5 != v10)
  {
    id v6 = [(HUTriggerConditionEditorItemModuleController *)self detailEditingContext];
    NSLog(&cfstr_UnrecognizedEd.isa, v10, v6);
  }
  uint64_t v7 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
  int v8 = [(HUTriggerConditionEditorItemModuleController *)self detailEditingContext];
  uint64_t v9 = [v8 navigationController];
  [v7 conditionEditorModuleController:self dismissDetailViewController:v9];

  [(HUTriggerConditionEditorItemModuleController *)self setDetailEditingContext:0];
}

- (void)_presentDetailEditorForConditionOptionItem:(id)a3
{
  id v14 = a3;
  id v4 = [(HUItemModuleController *)self module];
  id v5 = [v4 conditionForOptionItem:v14];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [[HUTriggerTimeConditionDetailEditorViewController alloc] initWithRangeCondition:v8 delegate:self];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v9];
    [v10 setModalPresentationStyle:2];
    uint64_t v11 = objc_alloc_init(HUTriggerConditionDetailEditingContext);
    [(HUTriggerConditionDetailEditingContext *)v11 setOptionItem:v14];
    [(HUTriggerConditionDetailEditingContext *)v11 setViewController:v9];
    [(HUTriggerConditionDetailEditingContext *)v11 setNavigationController:v10];
    v12 = [(HUTriggerConditionEditorItemModuleController *)self detailEditingContext];

    if (v12) {
      NSLog(&cfstr_AlreadyHaveADe.isa);
    }
    [(HUTriggerConditionEditorItemModuleController *)self setDetailEditingContext:v11];
    int v13 = [(HUTriggerConditionEditorItemModuleController *)self delegate];
    [v13 conditionEditorModuleController:self presentDetailViewController:v10];
  }
  else
  {
    NSLog(&cfstr_TheTimeConditi.isa, v6);
  }
}

- (HUTriggerConditionEditorItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerConditionEditorItemModuleControllerDelegate *)WeakRetained;
}

- (HUTriggerConditionDetailEditingContext)detailEditingContext
{
  return self->_detailEditingContext;
}

- (void)setDetailEditingContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailEditingContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end