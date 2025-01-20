@interface CNAvatarCardActionsView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)actionsReversed;
- (BOOL)bypassActionValidation;
- (BOOL)dismissesBeforePerforming;
- (BOOL)expanded;
- (BOOL)isPerformingAction;
- (BOOL)performHighlightedAction;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGPoint)initialLocation;
- (CGRect)actionsImageFrame;
- (CNAvatarCardActionsTableView)tableView;
- (CNAvatarCardActionsView)initWithFrame:(CGRect)a3;
- (CNAvatarCardActionsViewDelegate)delegate;
- (CNQuickActionsManager)actionsManager;
- (NSArray)actionCategories;
- (NSArray)actions;
- (NSArray)contacts;
- (NSIndexPath)highlightedIndexPath;
- (UIGestureRecognizer)rolloverGestureRecognizer;
- (UIGestureRecognizer)selectionGestureRecognizer;
- (UISelectionFeedbackGenerator)retargetBehavior;
- (id)_actionAtIndexPath:(id)a3;
- (id)_effectiveManagerActions;
- (id)_indexPathForGestureRecognizer:(id)a3;
- (id)actionsManager:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 forAction:(id)a4;
- (void)_dismissCardAnimated:(BOOL)a3;
- (void)_performActionAtIndexPath:(id)a3;
- (void)_setHighlightedIndexPath:(id)a3 isChange:(BOOL)a4;
- (void)_startTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4;
- (void)_stopTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4;
- (void)_updateActionsWithBlock:(id)a3;
- (void)_updateAllSeparators;
- (void)_updateCellSeparator:(id)a3 forIndexPath:(id)a4;
- (void)_updateFromActions:(id)a3 toActions:(id)a4 matchingOldIndex:(int64_t)a5 toNewActionIndex:(int64_t)a6 invertedAnimation:(BOOL)a7;
- (void)_updateWithActions:(id)a3 withBlock:(id)a4;
- (void)refreshActions;
- (void)reloadData;
- (void)reloadDataWithBlock:(id)a3;
- (void)reset;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActionCategories:(id)a3;
- (void)setActions:(id)a3;
- (void)setActionsImageFrame:(CGRect)a3;
- (void)setActionsManager:(id)a3;
- (void)setActionsReversed:(BOOL)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissesBeforePerforming:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setInitialLocation:(CGPoint)a3;
- (void)setRetargetBehavior:(id)a3;
- (void)setRolloverGestureRecognizer:(id)a3;
- (void)setSelectionGestureRecognizer:(id)a3;
- (void)setTableView:(id)a3;
- (void)startTrackingRolloverWithGestureRecognizer:(id)a3;
- (void)stopTrackingRollover;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateRollover:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CNAvatarCardActionsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargetBehavior, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionCategories, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setRetargetBehavior:(id)a3
{
}

- (UISelectionFeedbackGenerator)retargetBehavior
{
  return self->_retargetBehavior;
}

- (void)setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
}

- (CGPoint)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setRolloverGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)rolloverGestureRecognizer
{
  return self->_rolloverGestureRecognizer;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (void)setTableView:(id)a3
{
}

- (CNAvatarCardActionsTableView)tableView
{
  return self->_tableView;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActionsManager:(id)a3
{
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setDismissesBeforePerforming:(BOOL)a3
{
  self->_dismissesBeforePerforming = a3;
}

- (BOOL)dismissesBeforePerforming
{
  return self->_dismissesBeforePerforming;
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarCardActionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarCardActionsViewDelegate *)WeakRetained;
}

- (CGRect)actionsImageFrame
{
  double x = self->_actionsImageFrame.origin.x;
  double y = self->_actionsImageFrame.origin.y;
  double width = self->_actionsImageFrame.size.width;
  double height = self->_actionsImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (BOOL)actionsReversed
{
  return self->_actionsReversed;
}

- (void)setActionCategories:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  return selectionGestureRecognizer == a3 || selectionGestureRecognizer == a4;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ([(CNAvatarCardActionsTableView *)self->_tableView isDragging]) {
    return 0;
  }
  else {
    return [(CNAvatarCardActionsTableView *)self->_tableView isDecelerating] ^ 1;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(UIGestureRecognizer *)self->_selectionGestureRecognizer setEnabled:1];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNAvatarCardActionsView *)self _actionAtIndexPath:v7];
  v9 = [(CNAvatarCardActionsView *)self contacts];
  if ((unint64_t)[v9 count] < 2)
  {

    goto LABEL_6;
  }
  if ([(CNAvatarCardActionsView *)self expanded])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
LABEL_6:
    v11 = @"actionCell";
    goto LABEL_9;
  }

LABEL_8:
  v11 = @"contactCell";
LABEL_9:
  v12 = [v6 dequeueReusableCellWithIdentifier:v11 forIndexPath:v7];
  [(CNAvatarCardActionsView *)self _configureCell:v12 forAction:v8];
  v13 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
  objc_msgSend(v12, "setHighlighted:animated:", objc_msgSend(v7, "isEqual:", v13), 0);

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(CNAvatarCardActionsView *)self actions];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)actionsManager:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(CNAvatarCardActionsView *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CNAvatarCardActionsView *)self delegate];
    v12 = [v11 cardActionsView:self orderedPropertiesForProperties:v7 category:v8];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  int64_t v5 = [(CNAvatarCardActionsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNAvatarCardActionsView *)self delegate];
    id v8 = [v7 viewControllerForCardActionsView:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setHighlightedIndexPath:(id)a3
{
}

- (void)_setHighlightedIndexPath:(id)a3 isChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (NSIndexPath *)a3;
  p_highlightedIndexPath = &self->_highlightedIndexPath;
  highlightedIndexPath = self->_highlightedIndexPath;
  v15 = v7;
  if (highlightedIndexPath != v7)
  {
    if (highlightedIndexPath)
    {
      char v10 = [(CNAvatarCardActionsView *)self tableView];
      v11 = [v10 cellForRowAtIndexPath:*p_highlightedIndexPath];

      [v11 setHighlighted:0];
    }
    objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
    if (*p_highlightedIndexPath)
    {
      v12 = [(CNAvatarCardActionsView *)self tableView];
      v13 = [v12 cellForRowAtIndexPath:*p_highlightedIndexPath];

      [v13 setHighlighted:1];
      if (v4)
      {
        v14 = [(CNAvatarCardActionsView *)self retargetBehavior];
        [v14 selectionChanged];
      }
    }
  }
}

- (void)_updateCellSeparator:(id)a3 forIndexPath:(id)a4
{
  id v9 = a3;
  uint64_t v6 = [a4 row];
  id v7 = [(CNAvatarCardActionsView *)self actions];
  BOOL v8 = v6 != [v7 count] - 1;

  [v9 setSeparatorStyle:v8];
}

- (void)_updateAllSeparators
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(CNAvatarCardActionsTableView *)self->_tableView indexPathsForVisibleRows];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [(CNAvatarCardActionsTableView *)self->_tableView cellForRowAtIndexPath:v8];
        [(CNAvatarCardActionsView *)self _updateCellSeparator:v9 forIndexPath:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_dismissCardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNAvatarCardActionsView *)self setHighlightedIndexPath:0];
  uint64_t v5 = [(CNAvatarCardActionsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNAvatarCardActionsView *)self delegate];
    [v7 dismissViewControllerForCardActionsView:self animated:v3];
  }
}

- (void)_configureCell:(id)a3 forAction:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(CNAvatarCardActionsView *)self expanded])
  {
    if ([v6 isBackAction])
    {
      double v7 = *MEMORY[0x1E4FB2848];
      double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      uint64_t v11 = 2;
    }
    else
    {
      double v7 = 0.0;
      double v8 = 75.0;
      uint64_t v11 = 3;
      double v9 = 0.0;
      double v10 = 0.0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    double v7 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  objc_msgSend(v12, "setSeparatorInset:", v7, v8, v9, v10);
  [v12 setContext:v11];
  [v12 setAction:v6];
  [v12 reloadData];
}

- (void)_updateFromActions:(id)a3 toActions:(id)a4 matchingOldIndex:(int64_t)a5 toNewActionIndex:(int64_t)a6 invertedAnimation:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = [(CNAvatarCardActionsView *)self tableView];
  uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:a5 inSection:0];
  v16 = [MEMORY[0x1E4F28D58] indexPathForRow:a6 inSection:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke;
  v23[3] = &unk_1E549AC08;
  v23[4] = self;
  id v24 = v15;
  id v25 = v13;
  id v26 = v14;
  BOOL v31 = a7;
  id v27 = v16;
  id v28 = v12;
  int64_t v29 = a6;
  int64_t v30 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_3;
  v22[3] = &unk_1E549B1C0;
  v22[4] = self;
  id v17 = v12;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v15;
  [v19 _performBatchUpdates:v23 completion:v22];
}

void __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  BOOL v3 = [v2 cellForRowAtIndexPath:*(void *)(a1 + 40)];

  uint64_t v4 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_2;
  v22[3] = &unk_1E549AE48;
  v22[4] = *(void *)(a1 + 32);
  id v21 = v3;
  id v23 = v21;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 80);
  id v24 = v5;
  uint64_t v25 = v6;
  [v4 animateWithDuration:v22 animations:0.25];
  [*(id *)(a1 + 56) moveRowAtIndexPath:*(void *)(a1 + 40) toIndexPath:*(void *)(a1 + 64)];
  if (*(unsigned char *)(a1 + 96)) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 3;
  }
  if (*(unsigned char *)(a1 + 96)) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 4;
  }
  double v9 = [MEMORY[0x1E4F1CA48] array];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 72) count] >= 1)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *(void *)(a1 + 88);
      if (v11 < v12) {
        break;
      }
      if (v11 > v12)
      {
        id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:0];
        v14 = v10;
        goto LABEL_13;
      }
LABEL_14:
      if (++v11 >= [*(id *)(a1 + 72) count]) {
        goto LABEL_15;
      }
    }
    id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:0];
    v14 = v9;
LABEL_13:
    [v14 addObject:v13];

    goto LABEL_14;
  }
LABEL_15:
  [*(id *)(a1 + 56) deleteRowsAtIndexPaths:v9 withRowAnimation:v7];
  [*(id *)(a1 + 56) deleteRowsAtIndexPaths:v10 withRowAnimation:v8];
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = [MEMORY[0x1E4F1CA48] array];
  if ([*(id *)(a1 + 48) count] >= 1)
  {
    uint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = *(void *)(a1 + 80);
      if (v17 < v18) {
        break;
      }
      if (v17 > v18)
      {
        id v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:0];
        id v20 = v16;
        goto LABEL_21;
      }
LABEL_22:
      if (++v17 >= [*(id *)(a1 + 48) count]) {
        goto LABEL_23;
      }
    }
    id v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:0];
    id v20 = v15;
LABEL_21:
    [v20 addObject:v19];

    goto LABEL_22;
  }
LABEL_23:
  [*(id *)(a1 + 56) insertRowsAtIndexPaths:v15 withRowAnimation:v8];
  [*(id *)(a1 + 56) insertRowsAtIndexPaths:v16 withRowAnimation:v7];
  [*(id *)(a1 + 32) setActions:*(void *)(a1 + 48)];
}

uint64_t __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllSeparators];
}

uint64_t __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  [v2 _configureCell:v3 forAction:v4];

  id v5 = *(void **)(a1 + 40);

  return [v5 setHighlighted:0 animated:1];
}

- (void)_performActionAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCardActionsView *)self _actionAtIndexPath:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v5;
    uint64_t v6 = [(CNAvatarCardActionsView *)self tableView];
    uint64_t v7 = [v6 cellForRowAtIndexPath:v4];

    if ([v7 moreHighlighted])
    {
      [(CNAvatarCardActionsView *)self setExpanded:1];
      uint64_t v8 = [v4 row];
      uint64_t v28 = 0;
      int64_t v29 = &v28;
      uint64_t v30 = 0x3032000000;
      BOOL v31 = __Block_byref_object_copy__55792;
      v32 = __Block_byref_object_dispose__55793;
      id v33 = 0;
      double v9 = [v5 title];
      double v10 = [v5 image];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke;
      v27[3] = &unk_1E549ABB8;
      v27[4] = self;
      v27[5] = &v28;
      v27[6] = v8;
      uint64_t v11 = +[CNQuickAction actionWithTitle:v9 image:v10 block:v27];

      uint64_t v12 = [v5 category];
      [v11 setCategory:v12];

      [v11 setBackAction:1];
      id v13 = [v5 actions];
      v14 = [v13 array];
      uint64_t v15 = [v14 mutableCopy];
      v16 = (void *)v29[5];
      v29[5] = v15;

      [(id)v29[5] insertObject:v11 atIndex:0];
      uint64_t v17 = [(CNAvatarCardActionsView *)self actions];
      uint64_t v18 = v29[5];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_3;
      v23[3] = &unk_1E549ABE0;
      v23[4] = self;
      id v19 = v17;
      id v24 = v19;
      uint64_t v25 = &v28;
      uint64_t v26 = v8;
      [(CNAvatarCardActionsView *)self _updateWithActions:v18 withBlock:v23];

      _Block_object_dispose(&v28, 8);
      goto LABEL_10;
    }
    uint64_t v20 = [v5 mainAction];

    id v5 = (id)v20;
  }
  if (![v5 isBackAction])
  {
    if (![(CNAvatarCardActionsView *)self dismissesBeforePerforming])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_4;
      v21[3] = &unk_1E549BF80;
      v21[4] = self;
      id v5 = v5;
      id v22 = v5;
      [v5 performWithCompletionBlock:v21];

      goto LABEL_10;
    }
    -[CNAvatarCardActionsView _dismissCardAnimated:](self, "_dismissCardAnimated:", [v5 dismissesWithAnimation]);
  }
  [v5 performWithCompletionBlock:0];
LABEL_10:
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_2;
  v2[3] = &unk_1E549ABB8;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [(id)v3 resetWithBlock:v2];
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFromActions:*(void *)(a1 + 40) toActions:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) matchingOldIndex:*(void *)(a1 + 56) toNewActionIndex:0 invertedAnimation:0];
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) dismissesWithAnimation];

  return [v1 _dismissCardAnimated:v2];
}

void __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  id v4 = [v2 _effectiveManagerActions];
  [v2 _updateFromActions:v3 toActions:v4 matchingOldIndex:0 toNewActionIndex:a1[6] invertedAnimation:1];
}

- (void)_stopTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(CNAvatarCardActionsView *)self tableView];
    id v9 = [v8 cellForRowAtIndexPath:v7];

    [v9 stopTrackingWithGestureRecognizer:v6];
  }
}

- (void)_startTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(CNAvatarCardActionsView *)self tableView];
    id v9 = [v8 cellForRowAtIndexPath:v7];

    [v9 startTrackingWithGestureRecognizer:v6];
  }
}

- (void)updateRollover:(id)a3
{
  id v17 = a3;
  if ([v17 state] == 1 || objc_msgSend(v17, "state") == 2 || objc_msgSend(v17, "state") == 4)
  {
    if ([v17 state] == 4
      || ([(CNAvatarCardActionsView *)self _indexPathForGestureRecognizer:v17],
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v8 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
      id v6 = 0;
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v3 = (void *)v8;
      int v7 = 1;
    }
    else
    {
      id v6 = (void *)v5;
      int v7 = 0;
    }
    id v9 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
    char v10 = [v6 isEqual:v9];

    if (v7) {
    if ((v10 & 1) == 0)
    }
    {
      uint64_t v11 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
      [(CNAvatarCardActionsView *)self _stopTrackingRolloverOnCellAtIndexPath:v11 withGestureRecognizer:v17];

      [(CNAvatarCardActionsView *)self _startTrackingRolloverOnCellAtIndexPath:v6 withGestureRecognizer:v17];
      -[CNAvatarCardActionsView _setHighlightedIndexPath:isChange:](self, "_setHighlightedIndexPath:isChange:", v6, [v17 state] == 2);
    }
    goto LABEL_13;
  }
  if ([v17 state] == 3)
  {
    uint64_t v12 = [(CNAvatarCardActionsView *)self highlightedIndexPath];

    if (!v12) {
      goto LABEL_20;
    }
    id v13 = [(CNAvatarCardActionsView *)self tableView];
    v14 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
    uint64_t v15 = [v13 cellForRowAtIndexPath:v14];

    uint64_t v16 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
    [(CNAvatarCardActionsView *)self _stopTrackingRolloverOnCellAtIndexPath:v16 withGestureRecognizer:v17];

    LOBYTE(v16) = [v15 swipped];
    if ((v16 & 1) == 0) {
LABEL_20:
    }
      [(CNAvatarCardActionsView *)self performHighlightedAction];
  }
LABEL_14:
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAvatarCardActionsView *)self tableView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  char v10 = [(CNAvatarCardActionsView *)self tableView];
  [v10 visibleBounds];
  v21.double x = v7;
  v21.double y = v9;
  LODWORD(v5) = CGRectContainsPoint(v22, v21);

  if (v5)
  {
    [(CNAvatarCardActionsView *)self initialLocation];
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v14 == *MEMORY[0x1E4F1DAD8] && v11 == v13) {
      goto LABEL_8;
    }
    [(CNAvatarCardActionsView *)self initialLocation];
    UIDistanceBetweenPoints();
    if (v16 > 15.0)
    {
      -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:", v12, v13);
LABEL_8:
      id v17 = [(CNAvatarCardActionsView *)self tableView];
      uint64_t v18 = objc_msgSend(v17, "indexPathForRowAtPoint:", v7, v9);

      goto LABEL_10;
    }
  }
  uint64_t v18 = 0;
LABEL_10:

  return v18;
}

- (BOOL)isPerformingAction
{
  if ([(CNAvatarCardActionsView *)self expanded]) {
    return 1;
  }
  id v4 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)stopTrackingRollover
{
  BOOL v3 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
  id v4 = [(CNAvatarCardActionsView *)self rolloverGestureRecognizer];
  [(CNAvatarCardActionsView *)self _stopTrackingRolloverOnCellAtIndexPath:v3 withGestureRecognizer:v4];

  uint64_t v5 = [(CNAvatarCardActionsView *)self rolloverGestureRecognizer];
  [v5 removeTarget:self action:sel_updateRollover_];

  [(CNAvatarCardActionsView *)self setRolloverGestureRecognizer:0];
}

- (void)startTrackingRolloverWithGestureRecognizer:(id)a3
{
  id v6 = a3;
  [(CNAvatarCardActionsView *)self setHighlightedIndexPath:0];
  [(CNAvatarCardActionsView *)self setRolloverGestureRecognizer:v6];
  -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  id v4 = [(CNAvatarCardActionsView *)self _indexPathForGestureRecognizer:v6];
  if (v4)
  {
    uint64_t v5 = [(CNAvatarCardActionsView *)self tableView];
    [v6 locationInView:v5];
    -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:");
  }
  [v6 addTarget:self action:sel_updateRollover_];
  [(CNAvatarCardActionsView *)self updateRollover:v6];
}

- (BOOL)performHighlightedAction
{
  BOOL v3 = [(CNAvatarCardActionsView *)self highlightedIndexPath];

  if (v3)
  {
    id v4 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
    [(CNAvatarCardActionsView *)self _performActionAtIndexPath:v4];
  }
  return v3 != 0;
}

- (void)reset
{
}

- (void)refreshActions
{
  id v2 = [(CNAvatarCardActionsView *)self actionsManager];
  [v2 refreshActions];
}

- (void)reloadDataWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
  id v6 = [(CNAvatarCardActionsView *)self rolloverGestureRecognizer];
  [(CNAvatarCardActionsView *)self _stopTrackingRolloverOnCellAtIndexPath:v5 withGestureRecognizer:v6];

  v4[2](v4);
  id v7 = [(CNAvatarCardActionsView *)self tableView];
  [v7 invalidateIntrinsicContentSize];
}

- (void)reloadData
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__CNAvatarCardActionsView_reloadData__block_invoke;
  v2[3] = &unk_1E549B488;
  void v2[4] = self;
  [(CNAvatarCardActionsView *)self reloadDataWithBlock:v2];
}

void __37__CNAvatarCardActionsView_reloadData__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (id)_actionAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAvatarCardActionsView *)self actions];
  uint64_t v6 = [v4 item];

  id v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (id)_effectiveManagerActions
{
  BOOL v3 = [(CNAvatarCardActionsView *)self actionsManager];
  id v4 = [v3 actions];

  if (self->_actionsReversed)
  {
    uint64_t v5 = [v4 reverseObjectEnumerator];
    id v6 = [v5 allObjects];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)_updateWithActions:(id)a3 withBlock:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [(CNAvatarCardActionsView *)self highlightedIndexPath];
  double v8 = [(CNAvatarCardActionsView *)self rolloverGestureRecognizer];
  [(CNAvatarCardActionsView *)self _stopTrackingRolloverOnCellAtIndexPath:v7 withGestureRecognizer:v8];

  [(CNAvatarCardActionsView *)self setHighlightedIndexPath:0];
  double v9 = (void *)[v6 mutableCopy];

  if (v14)
  {
    -[CNAvatarCardActionsView reloadDataWithBlock:](self, "reloadDataWithBlock:");
  }
  else
  {
    [(CNAvatarCardActionsView *)self setActions:v9];
    [(CNAvatarCardActionsView *)self reloadData];
  }
  char v10 = [(CNAvatarCardActionsView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(CNAvatarCardActionsView *)self delegate];
    [v12 cardActionsView:self didShowActions:v9];
  }
  double v13 = [(CNAvatarCardActionsView *)self rolloverGestureRecognizer];
  [(CNAvatarCardActionsView *)self updateRollover:v13];
}

- (void)_updateActionsWithBlock:(id)a3
{
  id v5 = a3;
  [(CNAvatarCardActionsView *)self setExpanded:0];
  uint64_t v6 = [(CNAvatarCardActionsView *)self actionsManager];
  if (!v6)
  {
    double v9 = [(CNAvatarCardActionsView *)self contacts];
    id v7 = +[CNQuickActionsManager actionsManagerForContacts:v9];

    char v10 = [(CNAvatarCardActionsView *)self actionCategories];
    [v7 setCategories:v10];

    char v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];
    if (v12
      || ([MEMORY[0x1E4FB1BA8] mainScreen],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          [v3 _referenceBounds],
          CGRectGetHeight(v18) <= 667.0))
    {
      double v13 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v13 userInterfaceIdiom])
      {
        [v7 setDesiredNumberOfActions:5];
      }
      else
      {
        id v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v14 _referenceBounds];
        if (CGRectGetHeight(v19) <= 568.0) {
          uint64_t v15 = 5;
        }
        else {
          uint64_t v15 = 6;
        }
        [v7 setDesiredNumberOfActions:v15];
      }
      if (v12) {
        goto LABEL_14;
      }
    }
    else
    {
      [v7 setDesiredNumberOfActions:6];
    }

LABEL_14:
    objc_msgSend(v7, "setBypassActionValidation:", -[CNAvatarCardActionsView bypassActionValidation](self, "bypassActionValidation"));
    [v7 setDelegate:self];
    [(CNAvatarCardActionsView *)self setActionsManager:v7];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__CNAvatarCardActionsView__updateActionsWithBlock___block_invoke;
    v16[3] = &unk_1E549B710;
    v16[4] = self;
    id v17 = v5;
    [v7 updateActionsWithBlock:v16];

    goto LABEL_15;
  }
  id v7 = (void *)v6;
  double v8 = [(CNAvatarCardActionsView *)self _effectiveManagerActions];
  [(CNAvatarCardActionsView *)self _updateWithActions:v8 withBlock:v5];

LABEL_15:
}

void __51__CNAvatarCardActionsView__updateActionsWithBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _effectiveManagerActions];
  [v2 _updateWithActions:v3 withBlock:*(void *)(a1 + 40)];
}

- (NSArray)actionCategories
{
  actionCategories = self->_actionCategories;
  if (actionCategories)
  {
    id v3 = actionCategories;
  }
  else
  {
    id v3 = +[CNQuickActionsManager defaultCategories];
  }

  return v3;
}

- (void)setActionsReversed:(BOOL)a3
{
  if (self->_actionsReversed != a3)
  {
    self->_actionsReversed = a3;
    if (![(CNAvatarCardActionsView *)self expanded])
    {
      [(CNAvatarCardActionsView *)self _updateActionsWithBlock:0];
    }
  }
}

- (void)setActionsImageFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_actionsImageFrame = &self->_actionsImageFrame;
  if (!CGRectEqualToRect(a3, self->_actionsImageFrame))
  {
    p_actionsImageFrame->origin.CGFloat x = x;
    p_actionsImageFrame->origin.CGFloat y = y;
    p_actionsImageFrame->size.CGFloat width = width;
    p_actionsImageFrame->size.CGFloat height = height;
    [(CNAvatarCardActionsView *)self reloadData];
  }
}

- (void)setContacts:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_contacts, a3);
    [(CNAvatarCardActionsView *)self setActionsManager:0];
    id v5 = v6;
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = [(CNAvatarCardActionsView *)self retargetBehavior];
  id v5 = v4;
  if (a3) {
    [v4 activateWithCompletionBlock:0];
  }
  else {
    [v4 deactivate];
  }
}

- (CNAvatarCardActionsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v23[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CNAvatarCardActionsView;
  id v7 = -[CNAvatarCardActionsView initWithFrame:](&v22, sel_initWithFrame_);
  [(CNAvatarCardActionsView *)v7 setBackgroundColor:0];
  double v8 = -[CNAvatarCardActionsTableView initWithFrame:style:]([CNAvatarCardActionsTableView alloc], "initWithFrame:style:", 1, x, y, width, height);
  [(CNAvatarCardActionsTableView *)v8 setRowHeight:62.0];
  [(CNAvatarCardActionsTableView *)v8 setSeparatorStyle:1];
  [(CNAvatarCardActionsTableView *)v8 setScrollEnabled:1];
  [(CNAvatarCardActionsTableView *)v8 setAlwaysBounceVertical:0];
  [(CNAvatarCardActionsTableView *)v8 setBackgroundColor:0];
  [(CNAvatarCardActionsTableView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNAvatarCardActionsTableView *)v8 _setDrawsSeparatorAtTopOfSections:0];
  [(CNAvatarCardActionsTableView *)v8 _setTopPadding:0.0];
  [(CNAvatarCardActionsTableView *)v8 _setBottomPadding:0.0];
  [(CNAvatarCardActionsTableView *)v8 setSectionHeaderHeight:0.0];
  [(CNAvatarCardActionsTableView *)v8 setSectionFooterHeight:0.0];
  [(CNAvatarCardActionsTableView *)v8 _setSeparatorBackdropOverlayBlendMode:1];
  [(CNAvatarCardActionsView *)v7 addSubview:v8];
  [(CNAvatarCardActionsView *)v7 setTableView:v8];
  double v9 = (void *)MEMORY[0x1E4F28DC8];
  char v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:0.0];
  v23[0] = v10;
  char v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:1 relatedBy:0 toItem:v7 attribute:1 multiplier:1.0 constant:0.0];
  v23[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  v23[2] = v12;
  double v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:2 relatedBy:0 toItem:v7 attribute:2 multiplier:1.0 constant:0.0];
  v23[3] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v9 activateConstraints:v14];

  uint64_t v15 = +[CNAvatarCardActionCell cellNibForActions];
  [(CNAvatarCardActionsTableView *)v8 registerNib:v15 forCellReuseIdentifier:@"actionCell"];
  double v16 = +[CNAvatarCardActionCell cellNibForContacts];

  [(CNAvatarCardActionsTableView *)v8 registerNib:v16 forCellReuseIdentifier:@"contactCell"];
  [(CNAvatarCardActionsTableView *)v8 setDataSource:v7];
  [(CNAvatarCardActionsTableView *)v8 setDelegate:v7];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v7 action:sel_updateRollover_];
  [v17 setAllowableMovement:0.0];
  [v17 setMinimumPressDuration:0.0];
  [v17 setCancelsTouchesInView:0];
  [v17 setDelegate:v7];
  [(CNAvatarCardActionsView *)v7 addGestureRecognizer:v17];
  [(CNAvatarCardActionsView *)v7 setSelectionGestureRecognizer:v17];
  CGRect v18 = [MEMORY[0x1E4FB2290] defaultConfiguration];
  CGRect v19 = [v18 tweakedConfigurationForClass:objc_opt_class() usage:@"retarget"];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v19 coordinateSpace:v8];
  [(CNAvatarCardActionsView *)v7 setRetargetBehavior:v20];

  return v7;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end