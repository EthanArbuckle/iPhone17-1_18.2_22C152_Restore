@interface CNFaceTimeCell
- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3;
- (BOOL)isFaceTimeAudioAvailable;
- (CNActionMenuHelper)actionMenuHelper;
- (CNActionView)actionView1;
- (CNActionView)actionView2;
- (CNContact)contact;
- (CNContactActionsController)actionsController;
- (CNCustomPresentation)actionsControllerPresentation;
- (CNFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNPropertyCellDelegate)delegate;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIUserActionListDataSource)actionsDataSource;
- (NSArray)supportedActionTypes;
- (NSArray)tokens;
- (NSDictionary)defaultActionPerType;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UILabel)faceTimeLabel;
- (double)minCellHeight;
- (double)throttleDelay;
- (id)actionViewForType:(id)a3;
- (id)allModelsObservable;
- (id)constantConstraints;
- (id)labelView;
- (id)variableConstraints;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)didPressActionView:(id)a3 longPress:(BOOL)a4;
- (void)didSelectActionType:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5;
- (void)discoverAvailableActionTypes;
- (void)loadCachedActions;
- (void)performAction:(id)a3;
- (void)performDefaultAction;
- (void)processModels:(id)a3;
- (void)reset;
- (void)setActionMenuHelper:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsControllerPresentation:(id)a3;
- (void)setActionsDataSource:(id)a3;
- (void)setContact:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDefaultActionPerType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFaceTimeAudioAvailable:(BOOL)a3;
- (void)setSchedulerProvider:(id)a3;
- (void)setSupportedActionTypes:(id)a3;
- (void)setTokens:(id)a3;
- (void)updateHorizontalTouchAreas;
@end

@implementation CNFaceTimeCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionPerType, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_actionsControllerPresentation, 0);
  objc_storeStrong((id *)&self->_supportedActionTypes, 0);
  objc_storeStrong((id *)&self->_actionView2, 0);
  objc_storeStrong((id *)&self->_actionView1, 0);
  objc_storeStrong((id *)&self->_faceTimeLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionsDataSource, 0);
}

- (void)setDefaultActionPerType:(id)a3
{
}

- (NSDictionary)defaultActionPerType
{
  return self->_defaultActionPerType;
}

- (double)throttleDelay
{
  return self->_throttleDelay;
}

- (void)setSchedulerProvider:(id)a3
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setActionMenuHelper:(id)a3
{
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsControllerPresentation:(id)a3
{
}

- (CNCustomPresentation)actionsControllerPresentation
{
  return self->_actionsControllerPresentation;
}

- (void)setSupportedActionTypes:(id)a3
{
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (CNActionView)actionView2
{
  return self->_actionView2;
}

- (CNActionView)actionView1
{
  return self->_actionView1;
}

- (void)setIsFaceTimeAudioAvailable:(BOOL)a3
{
  self->_isFaceTimeAudioAvailable = a3;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_isFaceTimeAudioAvailable;
}

- (UILabel)faceTimeLabel
{
  return self->_faceTimeLabel;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyCellDelegate *)WeakRetained;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3
{
  return 1;
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5 = a4;
  v6 = [(CNFaceTimeCell *)self actionsControllerPresentation];
  v7 = [v6 presentedViewController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__CNFaceTimeCell_contactActionsController_didSelectAction___block_invoke;
  v13[3] = &unk_1E549B488;
  v13[4] = self;
  [v7 dismissViewControllerAnimated:1 completion:v13];

  [(CNFaceTimeCell *)self performAction:v5];
  v8 = [(CNFaceTimeCell *)self actionsController];
  v9 = [v8 actionTypes];
  v10 = [v9 firstObject];

  v11 = [(CNFaceTimeCell *)self actionsDataSource];
  v12 = [(CNFaceTimeCell *)self contact];
  [v11 consumer:self didSelectItem:v5 forContact:v12 actionType:v10];

  [(CNFaceTimeCell *)self setActionsController:0];
}

uint64_t __59__CNFaceTimeCell_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActionsControllerPresentation:0];
}

- (void)didSelectActionType:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [CNContactActionsController alloc];
  v8 = [(CNFaceTimeCell *)self contact];
  v9 = [(CNFaceTimeCell *)self actionsDataSource];
  v15[0] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  v11 = [(CNContactActionsController *)v7 initWithContact:v8 dataSource:v9 actionTypes:v10];
  [(CNFaceTimeCell *)self setActionsController:v11];

  v12 = [(CNFaceTimeCell *)self actionsController];
  [v12 setDelegate:self];

  v13 = [(CNFaceTimeCell *)self actionsController];
  [v13 setGenerateFaceTimeListItemsOnly:1];

  v14 = [(CNFaceTimeCell *)self actionsController];
  [v14 retrieveModels];
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(CNFaceTimeCell *)self actionsController],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6))
  {
    v10 = [(CNFaceTimeCell *)self actionsController];
    v11 = [v10 actionTypes];
    v12 = [v11 firstObject];
    v13 = [(CNFaceTimeCell *)self actionViewForType:v12];

    if (v13) {
      [v13 updateWithMenuItems:v7];
    }
    BOOL v9 = v13 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  v14 = CNUILogContactCard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(CNFaceTimeCell *)self actionsController];
    v16 = [v15 actionTypes];
    v17 = [v16 firstObject];
    int v18 = 138412802;
    v19 = v17;
    __int16 v20 = 1024;
    BOOL v21 = v9;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell contactActionsController:didUpdateWithMenu:], actionType = %@, didUpdate = %i, menuItems = %@,", (uint8_t *)&v18, 0x1Cu);
  }
}

- (void)performAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CNUILogContactCard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performAction:], action = %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  uint64_t v7 = [(CNFaceTimeCell *)self delegate];
  if (v7)
  {
    id v8 = (void *)v7;
    BOOL v9 = [(CNFaceTimeCell *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(CNFaceTimeCell *)self delegate];
      v12 = [v11 geminiDataSource];
      v13 = [v12 channelIdentifier];
      [v6 setChannelIdentifier:v13];
    }
  }
  v14 = [v4 performActionWithContext:v6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __32__CNFaceTimeCell_performAction___block_invoke;
  v19[3] = &unk_1E549A500;
  id v15 = v4;
  id v20 = v15;
  [v14 addSuccessBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __32__CNFaceTimeCell_performAction___block_invoke_40;
  v17[3] = &unk_1E5499BC8;
  id v18 = v15;
  id v16 = v15;
  [v14 addFailureBlock:v17];
}

void __32__CNFaceTimeCell_performAction___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = CNUILogContactCard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_18B625000, v2, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performAction:], did perform action %@", (uint8_t *)&v4, 0xCu);
  }
}

void __32__CNFaceTimeCell_performAction___block_invoke_40(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = CNUILogContactCard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_18B625000, v2, OS_LOG_TYPE_ERROR, "[CNFaceTimeCell performAction:], failed to perform action %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didPressActionView:(id)a3 longPress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CNFaceTimeCell *)self defaultActionPerType];
  id v8 = [v6 type];
  BOOL v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    int v10 = v4;
  }
  else {
    int v10 = 1;
  }
  v11 = CNUILogContactCard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v6 type];
    v13 = @"nil";
    *(_DWORD *)buf = 138413058;
    v25 = v12;
    if (v9) {
      v13 = v9;
    }
    __int16 v26 = 1024;
    BOOL v27 = v4;
    __int16 v28 = 1024;
    int v29 = v10;
    __int16 v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell, didPressActionView:longPress:], actionType = %@, longPress = %i, shouldPresentDisambiguation = %i, defaultAction = %@", buf, 0x22u);
  }
  if (v10)
  {
    v14 = [CNContactActionsController alloc];
    id v15 = [(CNFaceTimeCell *)self contact];
    id v16 = [(CNFaceTimeCell *)self actionsDataSource];
    v17 = [v6 type];
    uint64_t v23 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v19 = [(CNContactActionsController *)v14 initWithContact:v15 dataSource:v16 actionTypes:v18];
    [(CNFaceTimeCell *)self setActionsController:v19];

    id v20 = [(CNFaceTimeCell *)self actionsController];
    [v20 setDelegate:self];

    BOOL v21 = [(CNFaceTimeCell *)self actionsController];
    [v21 setGenerateFaceTimeListItemsOnly:1];

    id v22 = [(CNFaceTimeCell *)self actionsController];
    [v22 retrieveModels];
  }
  else
  {
    [(CNFaceTimeCell *)self performAction:v9];
  }
}

- (void)updateHorizontalTouchAreas
{
  uint64_t v3 = [(CNFaceTimeCell *)self rightMostView];
  objc_msgSend(v3, "_setTouchInsets:", 0.0, -8.0, 0.0, -16.0);

  BOOL v4 = [(CNFaceTimeCell *)self actionView2];

  if (v4)
  {
    id v5 = [(CNFaceTimeCell *)self actionView2];
    objc_msgSend(v5, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);
  }
}

- (id)variableConstraints
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v24.receiver = self;
  v24.super_class = (Class)CNFaceTimeCell;
  BOOL v4 = [(CNLabeledCell *)&v24 variableConstraints];
  id v5 = [v3 arrayWithArray:v4];

  id v6 = [(CNFaceTimeCell *)self actionView1];
  if ([(CNFaceTimeCell *)self isFaceTimeAudioAvailable])
  {
    uint64_t v23 = [(CNFaceTimeCell *)self actionView2];

    id v22 = [(CNFaceTimeCell *)self actionView1];
    id v20 = [v22 leadingAnchor];
    BOOL v21 = [(CNFaceTimeCell *)self actionView2];
    uint64_t v7 = [v21 trailingAnchor];
    id v8 = [v20 constraintEqualToAnchor:v7 constant:16.0];
    v25[0] = v8;
    BOOL v9 = [(CNFaceTimeCell *)self actionView2];
    int v10 = [v9 centerYAnchor];
    v11 = [(CNFaceTimeCell *)self contentView];
    v12 = [v11 centerYAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v25[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [v5 addObjectsFromArray:v14];

    id v6 = (void *)v23;
  }
  id v15 = [v6 leadingAnchor];
  id v16 = [(CNFaceTimeCell *)self faceTimeLabel];
  v17 = [v16 trailingAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17 constant:16.0];
  [v5 addObject:v18];

  return v5;
}

- (id)constantConstraints
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v13.receiver = self;
  v13.super_class = (Class)CNFaceTimeCell;
  BOOL v4 = [(CNLabeledCell *)&v13 constantConstraints];
  id v5 = [v3 arrayWithArray:v4];

  id v6 = [(CNFaceTimeCell *)self actionView1];
  uint64_t v7 = [v6 centerYAnchor];
  id v8 = [(CNFaceTimeCell *)self contentView];
  BOOL v9 = [v8 centerYAnchor];
  int v10 = [v7 constraintEqualToAnchor:v9];
  v14[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 addObjectsFromArray:v11];

  return v5;
}

- (double)minCellHeight
{
  return 60.0;
}

- (void)performDefaultAction
{
  uint64_t v3 = CNUILogContactCard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell performDefaultAction]", v6, 2u);
  }

  BOOL v4 = [(CNFaceTimeCell *)self delegate];
  id v5 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v5 withTransportType:3];
}

- (id)labelView
{
  faceTimeLabel = self->_faceTimeLabel;
  if (!faceTimeLabel)
  {
    BOOL v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_faceTimeLabel;
    self->_faceTimeLabel = v4;

    id v6 = CNContactsUIBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"PHONE_ACTION_VIDEO_CONFERENCE" value:&stru_1ED8AC728 table:@"Localized"];
    [(UILabel *)self->_faceTimeLabel setText:v7];

    [(UILabel *)self->_faceTimeLabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
    faceTimeLabel = self->_faceTimeLabel;
  }

  return faceTimeLabel;
}

- (id)actionViewForType:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFaceTimeCell *)self actionView1];
  id v6 = [v5 type];

  if (v6 == v4)
  {
    uint64_t v10 = [(CNFaceTimeCell *)self actionView1];
  }
  else
  {
    uint64_t v7 = [(CNFaceTimeCell *)self actionView2];
    id v8 = [v7 type];

    if (v8 != v4)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [(CNFaceTimeCell *)self actionView2];
  }
  BOOL v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (void)processModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNFaceTimeCell *)self defaultActionPerType];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __32__CNFaceTimeCell_processModels___block_invoke;
  v12 = &unk_1E549B410;
  id v7 = v6;
  id v13 = v7;
  v14 = self;
  objc_msgSend(v4, "_cn_each:", &v9);

  if (objc_msgSend(v7, "count", v9, v10, v11, v12))
  {
    id v8 = CNUILogContactCard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "[CNFaceTimeCell processModels:], defaultActionPerType = %@", buf, 0xCu);
    }
  }
  [(CNFaceTimeCell *)self setDefaultActionPerType:v7];
}

void __32__CNFaceTimeCell_processModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = [a3 defaultAction];
  id v6 = [v5 bundleIdentifier];
  id v7 = (void *)*MEMORY[0x1E4F1AD00];

  if (v6 == v7)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v10];
    id v8 = [*(id *)(a1 + 40) actionViewForType:v10];
    uint64_t v9 = v8;
    if (v8) {
      [v8 setShowsMenuAsPrimaryAction:v5 == 0];
    }
  }
}

- (id)allModelsObservable
{
  uint64_t v3 = [(CNFaceTimeCell *)self supportedActionTypes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __37__CNFaceTimeCell_allModelsObservable__block_invoke;
  v14[3] = &unk_1E549B328;
  v14[4] = self;
  id v4 = objc_msgSend(v3, "_cn_map:", v14);

  id v5 = (void *)MEMORY[0x1E4F5A480];
  id v6 = [(CNFaceTimeCell *)self schedulerProvider];
  id v7 = [v5 merge:v4 schedulerProvider:v6];

  id v8 = [v7 scan:&__block_literal_global_16730 seed:MEMORY[0x1E4F1CC08]];
  [(CNFaceTimeCell *)self throttleDelay];
  double v10 = v9;
  v11 = [(CNFaceTimeCell *)self schedulerProvider];
  v12 = [v8 throttle:v11 schedulerProvider:v10];

  return v12;
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) actionsDataSource];
  id v5 = [*(id *)(a1 + 32) contact];
  id v6 = [v4 consumer:0 actionModelsForContact:v5 actionType:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__CNFaceTimeCell_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E549B300;
  id v11 = v3;
  id v7 = v3;
  id v8 = [v6 map:v10];

  return v8;
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)[a2 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  id v6 = (void *)[v5 copy];

  return v6;
}

id __37__CNFaceTimeCell_allModelsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = a2;
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)discoverAvailableActionTypes
{
  v34[2] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = CNUILogContactCard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(CNFaceTimeCell *)self contact];
    id v16 = [v15 shortDebugDescription];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_debug_impl(&dword_18B625000, v3, OS_LOG_TYPE_DEBUG, "[CNFaceTimeCell discoverAvailableActionTypes], %@ cancelling previous action discovering requests, contact now is %@", buf, 0x16u);
  }
  uint64_t v4 = [(CNFaceTimeCell *)self tokens];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke;
  v26[3] = &unk_1E549B398;
  v26[4] = self;
  [(id)v4 enumerateObjectsUsingBlock:v26];

  [(CNFaceTimeCell *)self setTokens:MEMORY[0x1E4F1CBF0]];
  id v5 = [(CNFaceTimeCell *)self contact];
  LOBYTE(v4) = v5 == 0;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    objc_initWeak(&location, self);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3042000000;
    uint64_t v32 = __Block_byref_object_copy__16734;
    v33 = __Block_byref_object_dispose__16735;
    v34[0] = 0;
    id v7 = CNUILogContactCard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [(CNFaceTimeCell *)self contact];
      id v18 = [v17 shortDebugDescription];
      *(_DWORD *)BOOL v27 = 138412546;
      __int16 v28 = self;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "[CNFaceTimeCell discoverAvailableActionTypes], %@ subscribing action discovering requests for contact %@.", v27, 0x16u);
    }
    id v8 = [(CNFaceTimeCell *)self allModelsObservable];
    double v9 = [(CNFaceTimeCell *)self schedulerProvider];
    double v10 = [v9 backgroundScheduler];
    id v11 = [v8 subscribeOn:v10];
    v12 = (void *)MEMORY[0x1E4F5A488];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    BOOL v21 = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_12;
    id v22 = &unk_1E549B3E8;
    objc_copyWeak(&v24, &location);
    uint64_t v23 = buf;
    id v13 = [v12 observerWithResultBlock:&v19];
    v14 = objc_msgSend(v11, "subscribe:", v13, v19, v20, v21, v22);

    [v6 addObject:v14];
    objc_storeWeak((id *)(*(void *)&buf[8] + 40), v14);
    [(CNFaceTimeCell *)self setTokens:v6];

    objc_destroyWeak(&v24);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(v34);
    objc_destroyWeak(&location);
  }
}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) schedulerProvider];
  id v5 = [v4 backgroundScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2;
  v7[3] = &unk_1E549B488;
  id v8 = v3;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2_13;
  aBlock[3] = &unk_1E549B3C0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);
  id v4 = v3;
  id v8 = v4;
  id v5 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  [v6 performBlock:v5];

  objc_destroyWeak(&v10);
}

void __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    id v3 = [WeakRetained tokens];
    int v4 = [v3 containsObject:v2];

    if (v4) {
      [WeakRetained processModels:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __46__CNFaceTimeCell_discoverAvailableActionTypes__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)loadCachedActions
{
  id v3 = [(CNFaceTimeCell *)self supportedActionTypes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__CNFaceTimeCell_loadCachedActions__block_invoke;
  v8[3] = &unk_1E549B370;
  v8[4] = self;
  int v4 = objc_msgSend(v3, "_cn_map:", v8);

  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = [(CNFaceTimeCell *)self supportedActionTypes];
  id v7 = [v5 dictionaryWithObjects:v4 forKeys:v6];

  [(CNFaceTimeCell *)self processModels:v7];
}

id __35__CNFaceTimeCell_loadCachedActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 actionsDataSource];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 contact];
  id v8 = [v5 consumer:v6 currentActionModelForContact:v7 actionType:v4];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F5A728] emptyModel];
  }
  id v10 = v9;

  return v10;
}

- (void)reset
{
}

- (void)setContact:(id)a3
{
  id v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    [(CNFaceTimeCell *)self reset];
    [(CNFaceTimeCell *)self loadCachedActions];
    [(CNFaceTimeCell *)self discoverAvailableActionTypes];
    id v5 = v6;
  }
}

- (void)setActionsDataSource:(id)a3
{
  uint64_t v17 = (CNUIUserActionListDataSource *)a3;
  if (self->_actionsDataSource != v17)
  {
    objc_storeStrong((id *)&self->_actionsDataSource, a3);
    id v5 = [(CNFaceTimeCell *)self actionView1];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4FB1818];
      id v7 = [(CNFaceTimeCell *)self actionView1];
      id v8 = [v7 type];
      id v9 = objc_msgSend(v6, "cnui_userActionSymbolImageForActionType:scale:withColor:", v8, -1, 0);
      id v10 = [(CNFaceTimeCell *)self actionView1];
      [v10 setImage:v9];
    }
    id v11 = [(CNFaceTimeCell *)self actionView2];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4FB1818];
      id v13 = [(CNFaceTimeCell *)self actionView2];
      v14 = [v13 type];
      id v15 = objc_msgSend(v12, "cnui_userActionSymbolImageForActionType:scale:withColor:", v14, -1, 0);
      id v16 = [(CNFaceTimeCell *)self actionView2];
      [v16 setImage:v15];
    }
  }
}

- (CNFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)CNFaceTimeCell;
  id v4 = [(CNLabeledCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    tokens = v4->_tokens;
    v4->_tokens = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v7 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v8 = [v7 defaultSchedulerProvider];
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v8;

    defaultActionPerType = v5->_defaultActionPerType;
    v5->_defaultActionPerType = (NSDictionary *)MEMORY[0x1E4F1CC08];

    id v11 = +[CNCapabilitiesManager defaultCapabilitiesManager];
    -[CNFaceTimeCell setIsFaceTimeAudioAvailable:](v5, "setIsFaceTimeAudioAvailable:", [v11 isFaceTimeAudioAvailable]);
    if ([(CNFaceTimeCell *)v5 isFaceTimeAudioAvailable])
    {
      uint64_t v12 = *MEMORY[0x1E4F1AD20];
      uint64_t v13 = *MEMORY[0x1E4F1AD78];
      v30[0] = *MEMORY[0x1E4F1AD20];
      v30[1] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    }
    else
    {
      uint64_t v13 = *MEMORY[0x1E4F1AD78];
      uint64_t v29 = *MEMORY[0x1E4F1AD78];
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      uint64_t v12 = *MEMORY[0x1E4F1AD20];
    }
    objc_storeStrong((id *)&v5->_supportedActionTypes, v14);

    id v15 = +[CNContactStyle currentStyle];
    id v16 = objc_alloc_init(CNActionView);
    actionView1 = v5->_actionView1;
    v5->_actionView1 = v16;

    if ([(CNFaceTimeCell *)v5 isFaceTimeAudioAvailable]) {
      uint64_t v18 = v12;
    }
    else {
      uint64_t v18 = v13;
    }
    [(CNActionView *)v5->_actionView1 setType:v18];
    -[CNActionView setStyle:](v5->_actionView1, "setStyle:", [v15 inlineActionsViewStyle]);
    [(CNActionView *)v5->_actionView1 setActionDelegate:v5];
    [(CNActionView *)v5->_actionView1 setShowsMenuAsPrimaryAction:1];
    [(CNActionView *)v5->_actionView1 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(CNActionView *)v5->_actionView1 setContentCompressionResistancePriority:0 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(CNActionView *)v5->_actionView1 setContentCompressionResistancePriority:1 forAxis:v20];
    BOOL v21 = [(CNFaceTimeCell *)v5 contentView];
    [v21 addSubview:v5->_actionView1];

    if ([(CNFaceTimeCell *)v5 isFaceTimeAudioAvailable])
    {
      id v22 = objc_alloc_init(CNActionView);
      actionView2 = v5->_actionView2;
      v5->_actionView2 = v22;

      [(CNActionView *)v5->_actionView2 setType:v13];
      -[CNActionView setStyle:](v5->_actionView2, "setStyle:", [v15 inlineActionsViewStyle]);
      [(CNActionView *)v5->_actionView2 setActionDelegate:v5];
      [(CNActionView *)v5->_actionView2 setShowsMenuAsPrimaryAction:1];
      [(CNActionView *)v5->_actionView2 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v24) = 1148846080;
      [(CNActionView *)v5->_actionView2 setContentCompressionResistancePriority:0 forAxis:v24];
      LODWORD(v25) = 1148846080;
      [(CNActionView *)v5->_actionView2 setContentCompressionResistancePriority:1 forAxis:v25];
      __int16 v26 = [(CNFaceTimeCell *)v5 contentView];
      [v26 addSubview:v5->_actionView2];
    }
    [(CNFaceTimeCell *)v5 updateHorizontalTouchAreas];
  }
  return v5;
}

@end