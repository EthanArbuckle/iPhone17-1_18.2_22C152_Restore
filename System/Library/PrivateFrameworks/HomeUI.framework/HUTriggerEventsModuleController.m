@interface HUTriggerEventsModuleController
- (BOOL)allowsEditingEvents;
- (Class)cellClassForItem:(id)a3;
- (HUTriggerEventsModuleController)initWithModule:(id)a3;
- (HUTriggerEventsModuleControllerDelegate)delegate;
- (id)trailingSwipeActionsForItem:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)deleteItem:(id)a3 completionHandler:(id)a4;
- (void)eventFlow:(id)a3 didFinishWithEventBuilderItem:(id)a4;
- (void)eventFlowDidCancel:(id)a3;
- (void)setAllowsEditingEvents:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)transitionToViewController:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUTriggerEventsModuleController

- (HUTriggerEventsModuleController)initWithModule:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTriggerEventsModuleController;
  v3 = [(HUItemModuleController *)&v6 initWithModule:a3];
  v4 = v3;
  if (v3) {
    [(HUTriggerEventsModuleController *)v3 setAllowsEditingEvents:1];
  }
  return v4;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  objc_super v6 = [v5 addEventButtonItem];
  [v4 isEqual:v6];

  v7 = objc_opt_class();

  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v10 setAdjustsTextColorWhenDisabled:0];
  }
  else
  {
    v7 = [(HUItemModuleController *)self module];
    v8 = [v7 addEventButtonItem];
    int v9 = [v6 isEqual:v8];

    if (v9) {
      [v10 setAccessoryType:1];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v10 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v8 setIconForegroundColorFollowsTintColor:1];
      [v8 setIconDisplayStyle:1];
      [v8 setIconTintColorFollowsDisabledState:0];
      BOOL v9 = [(HUTriggerEventsModuleController *)self allowsEditingEvents]
        && ![v8 isDisabled];
      [v8 setAccessoryType:v9];
    }
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  BOOL v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 addEventButtonItem];
  if ([v4 isEqual:v10])
  {
    int v11 = _os_feature_enabled_impl();

    if (v11)
    {
      v12 = [[HUEventCreationUIFlow alloc] initWithTriggerBuilder:v8 eventBuilderItem:0];
      [(HUEventCreationUIFlow *)v12 setModalInPresentation:1];
      [(HUEventUIFlow *)v12 setDelegate:self];
      [(HUEventUIFlow *)v12 setIsPresentedModally:1];
      [(HUEventCreationUIFlow *)v12 setupNavigationController];
      v13 = [(HUEventCreationUIFlow *)v12 navigationController];
      id v14 = +[HUViewControllerPresentationRequest requestWithViewController:v13];

      v15 = [(HUItemModuleController *)self host];
      id v16 = (id)[v15 moduleController:self presentViewControllerForRequest:v14];
LABEL_11:

LABEL_14:
      goto LABEL_15;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    id v17 = v4;
    v12 = [[HUEventUIFlow alloc] initWithTriggerBuilder:v8 eventBuilderItem:v17];

    [(HUEventUIFlow *)v12 setDelegate:self];
    [(HUEventUIFlow *)v12 setPresentationController:self];
    id v14 = [(HUEventUIFlow *)v12 buildInitialViewController];
    v15 = [(HUTriggerEventsModuleController *)self delegate];
    [v15 eventsModuleController:self pushViewController:v14];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v4;
    v12 = [(HUTriggerEventsModuleController *)self delegate];
    [(HUEventCreationUIFlow *)v12 _showEditorForTriggerBuilderItem:v14];
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && _os_feature_enabled_impl())
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = (void *)MEMORY[0x1E4F42900];
    id v8 = _HULocalizedStringWithDefaultValue(@"HUDeleteTitle", @"HUDeleteTitle", 1);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __63__HUTriggerEventsModuleController_trailingSwipeActionsForItem___block_invoke;
    v15 = &unk_1E6390980;
    id v16 = self;
    id v17 = v4;
    BOOL v9 = [v7 contextualActionWithStyle:1 title:v8 handler:&v12];

    objc_msgSend(v6, "addObject:", v9, v12, v13, v14, v15, v16);
    id v10 = [MEMORY[0x1E4F42E68] configurationWithActions:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __63__HUTriggerEventsModuleController_trailingSwipeActionsForItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteItem:completionHandler:", *(void *)(a1 + 40));
}

- (void)eventFlowDidCancel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v11 = v4;
  if (objc_opt_isKindOfClass()) {
    v5 = v11;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 navigationController];
    id v8 = +[HUViewControllerDismissalRequest requestWithViewController:v7];

    BOOL v9 = [(HUItemModuleController *)self host];
    id v10 = (id)[v9 moduleController:self dismissViewControllerForRequest:v8];
  }
}

- (void)eventFlow:(id)a3 didFinishWithEventBuilderItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  BOOL v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v7 originalEventBuilderItem];
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = [v7 originalEventBuilderItem];

    if (v15 != v8)
    {
      id v16 = [v7 originalEventBuilderItem];
      id v17 = [v16 eventBuilders];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke;
      v39[3] = &unk_1E63909A8;
      id v40 = v12;
      objc_msgSend(v17, "na_each:", v39);
    }
  }
  v18 = [v8 eventBuilders];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke_2;
  v37 = &unk_1E63909A8;
  id v19 = v12;
  id v38 = v19;
  objc_msgSend(v18, "na_each:", &v34);

  objc_opt_class();
  id v20 = v7;
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    v23 = objc_msgSend(v22, "navigationController", v34, v35, v36, v37);
    v24 = +[HUViewControllerDismissalRequest requestWithViewController:v23];

    v25 = [(HUItemModuleController *)self host];
    id v26 = (id)[v25 moduleController:self dismissViewControllerForRequest:v24];

    v27 = (void *)MEMORY[0x1E4F69230];
    v28 = [(HUItemModuleController *)self module];
    v29 = [v28 itemProviders];
    v30 = [v27 requestToReloadItemProviders:v29 senderSelector:a2];

    v31 = [(HUItemModuleController *)self module];
    v32 = [v31 itemUpdater];
    id v33 = (id)[v32 performItemUpdateRequest:v30];
  }
}

uint64_t __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEventBuilder:a2];
}

uint64_t __75__HUTriggerEventsModuleController_eventFlow_didFinishWithEventBuilderItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEventBuilder:a2];
}

- (void)transitionToViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerEventsModuleController *)self delegate];
  [v5 eventsModuleController:self pushViewController:v4];
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  objc_opt_class();
  id v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v14 = [v9 eventBuilders];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__HUTriggerEventsModuleController_deleteItem_completionHandler___block_invoke;
  v24[3] = &unk_1E63909A8;
  id v25 = v13;
  id v15 = v13;
  objc_msgSend(v14, "na_each:", v24);

  id v16 = [(HUTriggerEventsModuleController *)self delegate];

  if (v16)
  {
    id v17 = [(HUTriggerEventsModuleController *)self delegate];
    [v17 eventsModuleControllerDidUpdateTriggerBuilder:self];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F69230];
    id v19 = [(HUItemModuleController *)self module];
    id v20 = [v19 itemProviders];
    id v17 = [v18 requestToReloadItemProviders:v20 senderSelector:a2];

    id v21 = [(HUItemModuleController *)self module];
    id v22 = [v21 itemUpdater];
    id v23 = (id)[v22 performItemUpdateRequest:v17];
  }
}

uint64_t __64__HUTriggerEventsModuleController_deleteItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEventBuilder:a2];
}

- (HUTriggerEventsModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEventsModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsEditingEvents
{
  return self->_allowsEditingEvents;
}

- (void)setAllowsEditingEvents:(BOOL)a3
{
  self->_allowsEditingEvents = a3;
}

- (void).cxx_destruct
{
}

@end