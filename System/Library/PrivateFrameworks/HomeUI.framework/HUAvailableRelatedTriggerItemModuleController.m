@interface HUAvailableRelatedTriggerItemModuleController
- (BOOL)editing;
- (BOOL)triggerModuleShouldHideAddAutomationButton;
- (Class)cellClassForItem:(id)a3;
- (HUAccessoryButtonTableViewHeaderView)sectionEditButtonHeader;
- (HUAvailableRelatedTriggerItemModuleController)initWithModule:(id)a3;
- (NAFuture)addAutomationPresentingFuture;
- (UIActivityIndicatorView)addAutomationActivityIndicator;
- (UIViewController)presentedViewController;
- (_TriggerEditorDelegateWrapper)presentedViewControllerDelegateWrapper;
- (id)_activateItem:(id)a3 active:(BOOL)a4;
- (id)_addAutomationViewControllerWithActionFactories:(id)a3;
- (id)_addAutomationViewControllerWithSensorCharacteristics:(id)a3;
- (id)_createAddAutomationViewController;
- (id)_dismissViewController:(id)a3;
- (id)_handleError:(id)a3 retryBlock:(id)a4;
- (id)commitSelectedItems;
- (unint64_t)didSelectItem:(id)a3;
- (void)_addAutomationCancelButtonPressed;
- (void)_enableItemPressed:(id)a3 enabled:(BOOL)a4;
- (void)_presentAddAutomationViewController;
- (void)_presentTriggerSummaryForAvailableTriggerItem:(id)a3;
- (void)_presentTriggerSummaryForTriggerBuilder:(id)a3 flow:(id)a4;
- (void)_updateUIAnimated:(BOOL)a3;
- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4;
- (void)setAddAutomationActivityIndicator:(id)a3;
- (void)setAddAutomationPresentingFuture:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setPresentedViewControllerDelegateWrapper:(id)a3;
- (void)setSectionEditButtonHeader:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
- (void)updatePresentedViewControllerForNewModuleController:(id)a3;
@end

@implementation HUAvailableRelatedTriggerItemModuleController

- (HUAvailableRelatedTriggerItemModuleController)initWithModule:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  v3 = [(HUItemModuleController *)&v7 initWithModule:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(HUItemModuleController *)v3 module];
    [v5 setEditButtonHeaderDelegate:v4];

    [(HUAvailableRelatedTriggerItemModuleController *)v4 setEditing:0];
    [(HUAvailableRelatedTriggerItemModuleController *)v4 _updateUIAnimated:0];
  }
  return v4;
}

- (UIActivityIndicatorView)addAutomationActivityIndicator
{
  addAutomationActivityIndicator = self->_addAutomationActivityIndicator;
  if (!addAutomationActivityIndicator)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    v5 = self->_addAutomationActivityIndicator;
    self->_addAutomationActivityIndicator = v4;

    addAutomationActivityIndicator = self->_addAutomationActivityIndicator;
  }

  return addAutomationActivityIndicator;
}

- (id)commitSelectedItems
{
  objc_initWeak(&location, self);
  v3 = [(HUItemModuleController *)self module];
  v4 = [v3 activateAllSelectedItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke;
  v7[3] = &unk_1E63897B0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5 = [v4 recover:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

id __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke_2;
  v8[3] = &unk_1E6385000;
  v8[4] = *(void *)(a1 + 32);
  v6 = [WeakRetained _handleError:v4 retryBlock:v8];

  return v6;
}

uint64_t __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitSelectedItems];
}

- (BOOL)triggerModuleShouldHideAddAutomationButton
{
  v2 = [(HUItemModuleController *)self module];
  char v3 = [v2 addAutomationItemShouldBeHidden];

  return v3;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 triggerItem];

LABEL_8:
    uint64_t v14 = objc_opt_class();
    goto LABEL_9;
  }
  id v8 = [(HUItemModuleController *)self module];
  v9 = [v8 addAutomationItem];
  int v10 = [v5 isEqual:v9];

  if (v10) {
    goto LABEL_8;
  }
  v11 = [(HUItemModuleController *)self module];
  v12 = [v11 naturalLightingItem];
  int v13 = [v5 isEqual:v12];

  if (v13) {
    goto LABEL_8;
  }
  v17.receiver = self;
  v17.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  uint64_t v14 = [(HUItemModuleController *)&v17 cellClassForItem:v5];
LABEL_9:
  v15 = (void *)v14;

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  [(HUItemModuleController *)&v43 setupCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = v6;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    [v10 setIconDisplayStyle:1];
    [v10 setIconTintColorFollowsDisabledState:0];
    HUDefaultSizeForIconSize();
    double v12 = v11;
    double v14 = v13;
    v15 = [v10 contentMetrics];
    objc_msgSend(v15, "setIconSize:", v12, v14);

    v16 = [v10 contentMetrics];
    objc_msgSend(v16, "setContentInset:", 12.0, 0.0, 12.0, 0.0);
  }
  objc_opt_class();
  id v17 = v7;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v20 = [v19 recommendationItem];

    if (v20)
    {
      objc_opt_class();
      id v21 = v6;
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
      id v23 = v22;

      [v23 setDelegate:self];
LABEL_20:
      [v23 setMaxNumberOfTitleLines:0];
      [v23 setMaxNumberOfDescriptionLines:0];
      v29 = [(HUItemModuleController *)self module];
      v30 = [v29 context];
      objc_msgSend(v23, "setHideIcon:", objc_msgSend(v30, "showsIcons") ^ 1);

LABEL_31:
      goto LABEL_32;
    }
    v24 = [v19 triggerItem];

    if (v24)
    {
      objc_opt_class();
      id v25 = v6;
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
      id v23 = v26;

      [v25 setAccessoryType:1];
      v27 = [MEMORY[0x1E4F428B8] grayColor];
      v28 = [v23 valueLabel];
      [v28 setTextColor:v27];

      goto LABEL_20;
    }
  }
  v31 = [(HUItemModuleController *)self module];
  v32 = [v31 addAutomationItem];
  int v33 = [v17 isEqual:v32];

  if (v33)
  {
    objc_opt_class();
    id v34 = v6;
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    id v23 = v35;

    [v23 setIconForegroundColorFollowsTintColor:1];
    [v23 setIconDisplayStyle:3];
    [v23 setTitleColorFollowsTintColor:1];
    [v23 setHideValue:1];
    [v23 setHideIcon:1];
    goto LABEL_31;
  }
  v36 = [(HUItemModuleController *)self module];
  v37 = [v36 naturalLightingItem];
  int v38 = [v17 isEqual:v37];

  if (v38)
  {
    objc_opt_class();
    id v39 = v6;
    if (objc_opt_isKindOfClass()) {
      v40 = v39;
    }
    else {
      v40 = 0;
    }
    id v23 = v40;

    v41 = [(HUItemModuleController *)self module];
    v42 = [v41 context];
    objc_msgSend(v23, "setHideIcon:", objc_msgSend(v42, "showsIcons") ^ 1);

    [v23 setSelectionStyle:0];
    [v23 setDelegate:self];
    goto LABEL_31;
  }
LABEL_32:
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  [(HUItemModuleController *)&v42 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    double v13 = [v12 recommendationItem];

    if (v13)
    {
      uint64_t v14 = 0;
    }
    else
    {
      v15 = [v12 triggerItem];

      if (!v15) {
        goto LABEL_10;
      }
      uint64_t v14 = 3;
    }
    [v8 setSelectionStyle:v14];
  }
LABEL_10:
  v16 = [(HUItemModuleController *)self module];
  id v17 = [v16 addAutomationItem];
  int v18 = [v10 isEqual:v17];

  if (v18)
  {
    [v8 setAccessibilityIdentifier:@"AccessoryDetails.AddAutomationItem"];
    objc_opt_class();
    id v19 = [v10 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    int v23 = [v22 BOOLValue];
    v24 = [(HUAvailableRelatedTriggerItemModuleController *)self addAutomationActivityIndicator];
    id v25 = v24;
    if (v23)
    {
      [v8 setAccessoryView:v24];

      v26 = [(HUAvailableRelatedTriggerItemModuleController *)self addAutomationActivityIndicator];
      [v26 startAnimating];
    }
    else
    {
      [v24 stopAnimating];

      [v8 setAccessoryView:0];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = self;
    id v41 = v12;
    v27 = NSString;
    id v39 = [v10 latestResults];
    v28 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F68BC8]];
    v29 = [v28 uniqueIdentifier];
    v30 = [v27 stringWithFormat:@"AccessoryDetails.%@", v29];
    v31 = [v30 componentsSeparatedByString:@"="];
    v32 = [v31 firstObject];
    int v33 = objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_1F18F92B8;
    id v34 = objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_1F18F92B8);
    v35 = [v34 stringByReplacingOccurrencesOfString:@":" withString:@"."];
    [v8 setAccessibilityIdentifier:v35];

    objc_opt_class();
    id v36 = v8;
    if (objc_opt_isKindOfClass()) {
      v37 = v36;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    objc_msgSend(v38, "setSwitchHidden:", -[HUAvailableRelatedTriggerItemModuleController editing](v40, "editing"));
    if ([(HUAvailableRelatedTriggerItemModuleController *)v40 editing]) {
      [v36 setSelectionStyle:3];
    }

    id v12 = v41;
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_9;
  }
  id v8 = [v7 triggerItem];

  if (v8
    || ([v7 recommendationItem], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v10 = (void *)v9,
        BOOL v11 = [(HUAvailableRelatedTriggerItemModuleController *)self editing],
        v10,
        v11))
  {
    [(HUAvailableRelatedTriggerItemModuleController *)self _presentTriggerSummaryForAvailableTriggerItem:v7];
  }
  else
  {
LABEL_9:
    id v12 = [(HUItemModuleController *)self module];
    double v13 = [v12 addAutomationItem];
    int v14 = [v5 isEqual:v13];

    if (v14) {
      [(HUAvailableRelatedTriggerItemModuleController *)self _presentAddAutomationViewController];
    }
  }

  return 0;
}

- (void)_presentTriggerSummaryForAvailableTriggerItem:(id)a3
{
  id v23 = a3;
  id v4 = objc_alloc_init(HUTriggerBuilderContext);
  id v5 = [v23 recommendationItem];

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [v23 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUTriggerBuilderContext *)v4 setTriggerContextAwareTitle:v7];

  id v8 = [v23 recommendationItem];
  uint64_t v9 = [v8 recommendation];
  id v10 = objc_msgSend(v9, "hu_triggerBuilderIfAny");
  BOOL v11 = [v10 trigger];
  [(HUTriggerBuilderContext *)v4 setShowTriggerDeleteButton:v11 != 0];

  [(HUTriggerBuilderContext *)v4 setSuggestionItem:v23];
  if ([v23 isActive]) {
    goto LABEL_4;
  }
  id v12 = [(HUItemModuleController *)self module];
  double v13 = [v12 home];
  int v14 = [(HUItemModuleController *)self module];
  v15 = [v14 relatedItems];
  v16 = [v23 buildersForActivating:1 inHome:v13 withContext:v4 serviceLikeItems:v15];
  id v17 = [v16 firstObject];

  if (!v17)
  {
LABEL_4:
    int v18 = (void *)MEMORY[0x1E4F696C0];
    id v19 = [v23 trigger];
    v20 = [(HUItemModuleController *)self module];
    id v21 = [v20 home];
    id v17 = [v18 triggerBuilderForTrigger:v19 inHome:v21 context:v4];
  }
  id v22 = [[HUTriggerActionFlow alloc] initWithFlowState:3];
  [(HUAvailableRelatedTriggerItemModuleController *)self _presentTriggerSummaryForTriggerBuilder:v17 flow:v22];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 item];
  [(HUAvailableRelatedTriggerItemModuleController *)self _enableItemPressed:v6 enabled:v4];
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v4 = -[HUAvailableRelatedTriggerItemModuleController _dismissViewController:](self, "_dismissViewController:", a3, a4);
}

- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5
{
  id v15 = a5;
  id v7 = [a4 context];
  id v8 = [v7 suggestionItem];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    id v12 = [(HUItemModuleController *)self module];
    int v13 = [v12 containsItem:v11];

    if (v13)
    {
      int v14 = [(HUItemModuleController *)self module];
      [v14 didActivateItem:v11 active:1 error:v15];
    }
  }
}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  id v16 = v6;
  if (objc_opt_isKindOfClass()) {
    id v7 = v16;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  [(HUAvailableRelatedTriggerItemModuleController *)self setSectionEditButtonHeader:v8];
  [(HUAvailableRelatedTriggerItemModuleController *)self setEditing:[(HUAvailableRelatedTriggerItemModuleController *)self editing] ^ 1];
  [(HUAvailableRelatedTriggerItemModuleController *)self _updateUIAnimated:1];
  id v9 = (void *)MEMORY[0x1E4F69230];
  id v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 itemProviders];
  id v12 = [v9 requestToReloadItemProviders:v11 senderSelector:a2];

  int v13 = [(HUItemModuleController *)self module];
  int v14 = [v13 itemUpdater];
  id v15 = (id)[v14 performItemUpdateRequest:v12];
}

- (void)_updateUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUAvailableRelatedTriggerItemModuleController *)self editing]) {
    id v5 = @"HUSmartAutomationEditButtonDoneTitle";
  }
  else {
    id v5 = @"HUSmartAutomationEditButtonTitle";
  }
  id v6 = [(HUItemModuleController *)self module];
  [v6 setSectionHeaderEditButtonTitleKey:v5];

  id v7 = [(HUAvailableRelatedTriggerItemModuleController *)self sectionEditButtonHeader];

  if (v7)
  {
    id v8 = [(HUItemModuleController *)self module];
    id v9 = [v8 sectionHeaderEditButtonTitleKey];
    id v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
    id v11 = [(HUAvailableRelatedTriggerItemModuleController *)self sectionEditButtonHeader];
    [v11 setOverrideAccessoryButtonTitle:v10];

    id v12 = [(HUAvailableRelatedTriggerItemModuleController *)self sectionEditButtonHeader];
    id v19 = [v12 defaultAccessoryButtonFont];

    if ([(HUAvailableRelatedTriggerItemModuleController *)self editing])
    {
      int v13 = (void *)MEMORY[0x1E4F42A30];
      int v14 = [v19 fontDescriptor];
      id v15 = [v14 fontDescriptorWithSymbolicTraits:2];
      [v19 pointSize];
      uint64_t v16 = objc_msgSend(v13, "fontWithDescriptor:size:", v15);

      id v19 = (id)v16;
    }
    id v17 = [(HUAvailableRelatedTriggerItemModuleController *)self sectionEditButtonHeader];
    [v17 setAccessoryButtonFont:v19];

    int v18 = [(HUAvailableRelatedTriggerItemModuleController *)self sectionEditButtonHeader];
    [v18 updateUIWithAnimation:v3];
  }
}

- (void)_enableItemPressed:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v30 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v30;
    id v8 = [(HUItemModuleController *)self module];
    id v9 = [v8 context];
    int v10 = [v9 commitsAutomatically];

    if (v10)
    {
      id v11 = [(HUAvailableRelatedTriggerItemModuleController *)self _activateItem:v7 active:v4];
    }
    else
    {
      [v7 setActive:v4];
      v24 = (void *)MEMORY[0x1E4F69230];
      id v25 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      v26 = [v24 requestToUpdateItems:v25 senderSelector:a2];

      v27 = [(HUItemModuleController *)self module];
      v28 = [v27 itemUpdater];
      id v29 = (id)[v28 performItemUpdateRequest:v26];
    }
  }
  else
  {
    id v12 = [(HUItemModuleController *)self module];
    int v13 = [v12 naturalLightingItem];
    int v14 = [v30 isEqual:v13];

    if (!v14) {
      goto LABEL_8;
    }
    id v15 = [(HUItemModuleController *)self module];
    [v15 setEnableNaturalLighting:v4];

    uint64_t v16 = (void *)MEMORY[0x1E4F69230];
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    int v18 = [(HUItemModuleController *)self module];
    id v19 = [v18 naturalLightingItem];
    v20 = [v17 setWithObject:v19];
    id v7 = [v16 requestToUpdateItems:v20 senderSelector:a2];

    id v21 = [(HUItemModuleController *)self module];
    id v22 = [v21 itemUpdater];
    id v23 = (id)[v22 performItemUpdateRequest:v7];
  }
LABEL_8:
}

- (id)_activateItem:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(HUItemModuleController *)self module];
  id v8 = [v7 activateItem:v6 active:v4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke;
  v12[3] = &unk_1E63897D8;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v13 = v9;
  BOOL v15 = v4;
  int v10 = [v8 recover:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

id __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke_2;
  v7[3] = &unk_1E6388D38;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  id v5 = [WeakRetained _handleError:v3 retryBlock:v7];

  objc_destroyWeak(&v9);

  return v5;
}

id __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _activateItem:*(void *)(a1 + 32) active:*(unsigned __int8 *)(a1 + 48)];

  return v3;
}

- (id)_handleError:(id)a3 retryBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    goto LABEL_5;
  }
  int v8 = objc_msgSend(v6, "na_isCancelledError");
  id v9 = (void *)MEMORY[0x1E4F7A0D8];
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithError:v6];
LABEL_5:
    id v11 = (void *)v10;
    goto LABEL_7;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke;
  v13[3] = &unk_1E6389800;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = [v9 futureWithBlock:v13];

LABEL_7:

  return v11;
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) module];
  id v5 = [v4 context];
  uint64_t v6 = [v5 errorHandlingStrategy];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F69110] sharedHandler];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_3;
    v18[3] = &unk_1E6385BF8;
    uint64_t v8 = *(void *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    id v19 = v3;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_5;
    v16[3] = &unk_1E6386018;
    id v17 = v19;
    [v7 handleError:v8 operationType:0 options:MEMORY[0x1E4F1CC08] retryBlock:v18 cancelBlock:v16];

    id v9 = v20;
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F68418];
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUSmartAutomationErrorHandlingStrategyContinueCancelButtonText", @"HUSmartAutomationErrorHandlingStrategyContinueCancelButtonText", 1);
    v26[0] = v10;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    id v11 = *(void **)(a1 + 40);
    uint64_t v23 = *MEMORY[0x1E4F68438];
    id v12 = _HULocalizedStringWithDefaultValue(@"HUSmartAutomationErrorHandlingStrategyContinueDescriptionText", @"HUSmartAutomationErrorHandlingStrategyContinueDescriptionText", 1);
    v24 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v14 = objc_msgSend(v11, "hf_errorWithAddedUserInfo:", v13);

    id v15 = [MEMORY[0x1E4F69110] sharedHandler];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_2;
    v21[3] = &unk_1E6386018;
    id v22 = v3;
    [v15 handleError:v14 operationType:0 options:v9 retryBlock:0 cancelBlock:v21];
  }
}

uint64_t __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_3(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_4;
  v4[3] = &unk_1E63850B8;
  id v5 = *(id *)(a1 + 32);
  id v3 = (id)[v2 addCompletionBlock:v4];
}

uint64_t __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F68410] code:52 userInfo:0];
  [v1 finishWithError:v2];
}

- (void)_addAutomationCancelButtonPressed
{
  id v3 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewController];

  if (v3)
  {
    BOOL v4 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewController];
    id v5 = [(HUAvailableRelatedTriggerItemModuleController *)self _dismissViewController:v4];

    [(HUAvailableRelatedTriggerItemModuleController *)self setPresentedViewController:0];
  }
}

- (id)_dismissViewController:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(HUAvailableRelatedTriggerItemModuleController *)self setEditing:0];
  [(HUAvailableRelatedTriggerItemModuleController *)self _updateUIAnimated:0];
  uint64_t v6 = +[HUViewControllerDismissalRequest requestWithViewController:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F69230]);
  uint64_t v8 = [(HUItemModuleController *)self module];
  id v9 = [v8 itemProviders];
  uint64_t v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 allItems];
  id v12 = (void *)[v7 initWithItemProviders:v9 items:v11 senderSelector:a2];

  id v13 = [(HUItemModuleController *)self host];
  id v14 = [v13 moduleController:self dismissViewControllerForRequest:v6];

  id v15 = (void *)MEMORY[0x1E4F7A0D8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke;
  v23[3] = &unk_1E6385D90;
  v23[4] = self;
  id v24 = v12;
  id v16 = v12;
  id v17 = [v15 lazyFutureWithBlock:v23];
  int v18 = (void *)MEMORY[0x1E4F7A0D8];
  v25[0] = v14;
  v25[1] = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v20 = [v18 chainFutures:v19];
  id v21 = [v20 recover:&__block_literal_global_79];

  return v21;
}

void __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) module];
  id v5 = [v4 itemUpdater];
  uint64_t v6 = [v5 performItemUpdateRequest:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_2;
  v9[3] = &unk_1E6389828;
  id v10 = v3;
  id v7 = v3;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

uint64_t __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_3()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)updatePresentedViewControllerForNewModuleController:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewController];
  [v4 setPresentedViewController:v5];

  uint64_t v6 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  [v6 setDelegate:v4];

  id v7 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  [v4 setPresentedViewControllerDelegateWrapper:v7];
}

- (_TriggerEditorDelegateWrapper)presentedViewControllerDelegateWrapper
{
  presentedViewControllerDelegateWrapper = self->_presentedViewControllerDelegateWrapper;
  if (!presentedViewControllerDelegateWrapper)
  {
    id v4 = objc_alloc_init(_TriggerEditorDelegateWrapper);
    id v5 = self->_presentedViewControllerDelegateWrapper;
    self->_presentedViewControllerDelegateWrapper = v4;

    [(_TriggerEditorDelegateWrapper *)self->_presentedViewControllerDelegateWrapper setDelegate:self];
    presentedViewControllerDelegateWrapper = self->_presentedViewControllerDelegateWrapper;
  }

  return presentedViewControllerDelegateWrapper;
}

- (void)_presentTriggerSummaryForTriggerBuilder:(id)a3 flow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v19 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  id v8 = [[HUTriggerSummaryViewController alloc] initWithTriggerBuilder:v7 flow:v6 delegate:v19];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 relatedItems];
  id v12 = [v9 setWithArray:v11];
  id v13 = objc_msgSend(v12, "na_flatMap:", &__block_literal_global_151);

  id v14 = objc_msgSend(v13, "na_flatMap:", &__block_literal_global_277);
  [(HUTriggerSummaryViewController *)v8 setPrioritizedAccessories:v14];

  [(HUAvailableRelatedTriggerItemModuleController *)self setPresentedViewController:v8];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
  [v15 setModalPresentationStyle:2];
  id v16 = +[HUViewControllerPresentationRequest requestWithViewController:v15];
  [v16 setPreferredPresentationType:0];
  id v17 = [(HUItemModuleController *)self host];
  id v18 = (id)[v17 moduleController:self presentViewControllerForRequest:v16];
}

id __94__HUAvailableRelatedTriggerItemModuleController__presentTriggerSummaryForTriggerBuilder_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA80] set];
  objc_opt_class();
  id v4 = v2;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 mediaProfileContainer];
    int v8 = [v7 conformsToProtocol:&unk_1F1AD8588];

    id v9 = [v6 mediaProfileContainer];
    id v10 = v9;
    if (v8)
    {
      [v3 addObject:v9];
    }
    else
    {
      id v11 = [v9 mediaProfiles];
      [v3 unionSet:v11];
    }
  }
  id v12 = [v4 services];
  [v3 unionSet:v12];

  return v3;
}

uint64_t __94__HUAvailableRelatedTriggerItemModuleController__presentTriggerSummaryForTriggerBuilder_flow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F68E30] accessoryLikeObjectsForAccessoryRepresentable:a2];
}

- (void)_presentAddAutomationViewController
{
  id v3 = [(HUAvailableRelatedTriggerItemModuleController *)self addAutomationPresentingFuture];

  if (!v3)
  {
    id v4 = [(HUAvailableRelatedTriggerItemModuleController *)self _createAddAutomationViewController];
    id v5 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    id v6 = [v4 reschedule:v5];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke;
    v18[3] = &unk_1E6389870;
    void v18[4] = self;
    id v7 = [v6 flatMap:v18];
    [(HUAvailableRelatedTriggerItemModuleController *)self setAddAutomationPresentingFuture:v7];

    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_2;
    block[3] = &unk_1E63850E0;
    id v9 = v6;
    id v16 = v9;
    id v17 = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    objc_initWeak(&location, self);
    id v10 = [(HUAvailableRelatedTriggerItemModuleController *)self addAutomationPresentingFuture];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_3;
    v12[3] = &unk_1E63867B0;
    objc_copyWeak(&v13, &location);
    id v11 = (id)[v10 addCompletionBlock:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

id __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setPresentedViewController:v4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__addAutomationCancelButtonPressed];
  id v6 = [v4 navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
  [v7 setModalPresentationStyle:2];
  dispatch_time_t v8 = +[HUViewControllerPresentationRequest requestWithViewController:v7];
  [v8 setPreferredPresentationType:0];
  id v9 = [*(id *)(a1 + 32) host];
  id v10 = [v9 moduleController:*(void *)(a1 + 32) presentViewControllerForRequest:v8];

  return v10;
}

void __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 40) module];
    [v2 setAutomationItemIsLoading:1];
  }
}

void __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained module];
  [v1 setAutomationItemIsLoading:0];

  [WeakRetained setAddAutomationPresentingFuture:0];
}

- (id)_createAddAutomationViewController
{
  id v3 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  id v4 = [(HUItemModuleController *)self module];
  id v5 = [v4 sensorCharacteristics];
  if (![v5 count]) {
    goto LABEL_4;
  }
  id v6 = [(HUItemModuleController *)self module];
  id v7 = [v6 actionBuilderFactories];
  if ([v7 count])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v19 = [(HUItemModuleController *)self module];
  id v20 = [v19 eventOptionsItems];
  uint64_t v21 = [v20 count];

  if (v21)
  {
LABEL_5:
    dispatch_time_t v8 = [(HUItemModuleController *)self module];
    id v9 = [v8 actionBuilderFactories];
    if ([v9 count])
    {
      id v10 = [(HUItemModuleController *)self module];
      id v11 = [v10 sensorCharacteristics];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        id v13 = [(HUItemModuleController *)self module];
        id v14 = [(HUTriggerTypePickerViewController *)v13 actionBuilderFactories];
        id v15 = [(HUAvailableRelatedTriggerItemModuleController *)self _addAutomationViewControllerWithActionFactories:v14];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        void v26[2] = __83__HUAvailableRelatedTriggerItemModuleController__createAddAutomationViewController__block_invoke;
        v26[3] = &unk_1E6387340;
        id v27 = v3;
        id v16 = [v15 recover:v26];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v17 = (void *)MEMORY[0x1E4F7A0D8];
    id v13 = [[HUTriggerTypePickerViewController alloc] initWithActionSetBuilder:0 delegate:v3];
    id v16 = [v17 futureWithResult:v13];
    goto LABEL_10;
  }
  id v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = [(HUItemModuleController *)self module];
  id v24 = [v23 sensorCharacteristics];
  uint64_t v25 = [v22 setWithArray:v24];
  id v16 = [(HUAvailableRelatedTriggerItemModuleController *)self _addAutomationViewControllerWithSensorCharacteristics:v25];

LABEL_11:

  return v16;
}

id __83__HUAvailableRelatedTriggerItemModuleController__createAddAutomationViewController__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  id v2 = [[HUTriggerTypePickerViewController alloc] initWithActionSetBuilder:0 delegate:*(void *)(a1 + 32)];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

- (id)_addAutomationViewControllerWithSensorCharacteristics:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  id v6 = objc_alloc_init(HUTriggerBuilderContext);
  id v7 = objc_alloc(MEMORY[0x1E4F69130]);
  dispatch_time_t v8 = [(HUItemModuleController *)self module];
  id v9 = [v8 home];
  id v10 = (void *)[v7 initWithHome:v9 context:v6];

  id v11 = objc_alloc(MEMORY[0x1E4F69020]);
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
  id v13 = (void *)[v11 initWithEventBuilders:v12];

  if ([v4 count] == 1)
  {
    v32 = v5;
    id v14 = [v4 anyObject];
    id v15 = (void *)MEMORY[0x1E4F2E770];
    id v16 = [v14 characteristicType];
    id v17 = objc_msgSend(v15, "hf_abnormalValueForSensorCharacteristicType:", v16);

    id v18 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_continuousValueRangeCharacteristicTypes");
    id v19 = [v14 characteristicType];
    int v20 = [v18 containsObject:v19];

    if (v20)
    {
      uint64_t v21 = [(HUItemModuleController *)self module];
      id v22 = [v21 home];
      uint64_t v23 = objc_msgSend(v22, "hf_characteristicValueManager");
      id v24 = [v23 cachedValueForCharacteristic:v14];

      if (v24)
      {
        uint64_t v25 = [MEMORY[0x1E4F2E9C8] numberRangeWithMaxValue:v24];
      }
      else
      {
        uint64_t v25 = 0;
      }
      id v5 = v32;

      id v17 = (void *)v25;
    }
    else
    {
      id v5 = v32;
    }
    id v29 = [v13 setCharacteristics:v4 triggerValue:v17];
    [v10 applyEventBuilderDiff:v29];
    id v30 = [[HUCharacteristicTriggerEventViewController alloc] initWithCharacteristicEventBuilderItem:v13 triggerBuilder:v10 mode:0 delegate:v5];
    v28 = [MEMORY[0x1E4F7A0D8] futureWithResult:v30];
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke;
    aBlock[3] = &unk_1E6386108;
    id v34 = v4;
    v26 = _Block_copy(aBlock);
    id v27 = [[HUAccessoryEventPickerViewController alloc] initWithEventBuilderItem:v13 triggerBuilder:v10 mode:0 source:0 delegate:v5];
    [(HUAccessoryEventPickerViewController *)v27 setFilter:v26];
    v28 = [MEMORY[0x1E4F7A0D8] futureWithResult:v27];
  }

  return v28;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A3D460]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 services];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_2;
    v10[3] = &unk_1E6387048;
    id v11 = *(id *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_3;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_addAutomationViewControllerWithActionFactories:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvailableRelatedTriggerItemModuleController *)self presentedViewControllerDelegateWrapper];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke;
  v17[3] = &unk_1E6389898;
  v17[4] = self;
  id v6 = objc_msgSend(v4, "na_map:", v17);

  id v7 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v6];
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_2;
  block[3] = &unk_1E6386018;
  id v16 = v7;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_3;
  v13[3] = &unk_1E6385620;
  id v14 = v5;
  id v10 = v5;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 module];
  id v5 = [v4 home];
  id v6 = [v3 currentStateActionBuildersForHome:v5];

  return v6;
}

uint64_t __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFinished];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 cancel];
  }
  return result;
}

id __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "na_flatMap:", &__block_literal_global_307);
  id v4 = [[HUTriggerTypePickerViewController alloc] initWithActionSetBuilder:0 anonymousActionBuilders:v3 delegate:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v5;
}

uint64_t __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 allObjects];
}

- (NAFuture)addAutomationPresentingFuture
{
  return self->_addAutomationPresentingFuture;
}

- (void)setAddAutomationPresentingFuture:(id)a3
{
}

- (void)setAddAutomationActivityIndicator:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
}

- (void)setPresentedViewControllerDelegateWrapper:(id)a3
{
}

- (HUAccessoryButtonTableViewHeaderView)sectionEditButtonHeader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionEditButtonHeader);

  return (HUAccessoryButtonTableViewHeaderView *)WeakRetained;
}

- (void)setSectionEditButtonHeader:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sectionEditButtonHeader);
  objc_storeStrong((id *)&self->_presentedViewControllerDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_addAutomationActivityIndicator, 0);

  objc_storeStrong((id *)&self->_addAutomationPresentingFuture, 0);
}

@end