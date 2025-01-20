@interface CNQuickActionsView
+ (BOOL)hasActionsForContact:(id)a3;
+ (BOOL)requiresConstraintBasedLayout;
+ (id)actionsManagerForContact:(id)a3;
+ (id)defaultCategories;
+ (id)descriptorForRequiredKeys;
- (BOOL)quickActionButton:(id)a3 performAction:(id)a4;
- (BOOL)showBackgroundPlatters;
- (BOOL)showTitles;
- (BOOL)sortsWithDuet;
- (BOOL)useDuetIfAvailable;
- (CGSize)cachedContentSize;
- (CNContact)contact;
- (CNContactActionsController)actionsController;
- (CNQuickAction)performingAction;
- (CNQuickActionsManager)actionsManager;
- (CNQuickActionsView)initWithContact:(id)a3;
- (CNQuickActionsView)initWithFrame:(CGRect)a3;
- (CNQuickActionsViewDelegate)delegate;
- (NSArray)actions;
- (NSArray)categories;
- (NSDictionary)titleTextAttributes;
- (UIAlertController)alertController;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionLayout;
- (double)_widthForButtonCount:(int64_t)a3 itemSize:(CGSize *)a4;
- (double)interspace;
- (double)maximumWidth;
- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_updateActions;
- (void)actionsManager:(id)a3 actionDidPerform:(id)a4;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)didDisambiguateActionType:(id)a3 withActionItem:(id)a4;
- (void)performAction:(id)a3;
- (void)reloadData;
- (void)setActions:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsManager:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setCachedContentSize:(CGSize)a3;
- (void)setCategories:(id)a3;
- (void)setCollectionLayout:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterspace:(double)a3;
- (void)setPerformingAction:(id)a3;
- (void)setShowBackgroundPlatters:(BOOL)a3;
- (void)setShowTitles:(BOOL)a3;
- (void)setSortsWithDuet:(BOOL)a3;
- (void)setTitleTextAttributes:(id)a3;
- (void)setUseDuetIfAvailable:(BOOL)a3;
- (void)showDisambiguationControllerWithDataSource:(id)a3 actionType:(id)a4 onController:(id)a5 sourceView:(id)a6;
- (void)updateContentSize;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CNQuickActionsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_performingAction, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
  objc_storeStrong((id *)&self->_categories, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setActionsManager:(id)a3
{
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setPerformingAction:(id)a3
{
}

- (CNQuickAction)performingAction
{
  return self->_performingAction;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (CGSize)cachedContentSize
{
  double width = self->_cachedContentSize.width;
  double height = self->_cachedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionLayout:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionLayout
{
  return self->_collectionLayout;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setDelegate:(id)a3
{
}

- (CNQuickActionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNQuickActionsViewDelegate *)WeakRetained;
}

- (void)setShowBackgroundPlatters:(BOOL)a3
{
  self->_showBackgroundPlatters = a3;
}

- (BOOL)showBackgroundPlatters
{
  return self->_showBackgroundPlatters;
}

- (void)setShowTitles:(BOOL)a3
{
  self->_showTitles = a3;
}

- (BOOL)showTitles
{
  return self->_showTitles;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setTitleTextAttributes:(id)a3
{
}

- (NSDictionary)titleTextAttributes
{
  return self->_titleTextAttributes;
}

- (BOOL)sortsWithDuet
{
  return self->_sortsWithDuet;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5 = a4;
  v6 = [(CNQuickActionsView *)self alertController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNQuickActionsView_contactActionsController_didSelectAction___block_invoke;
  v7[3] = &unk_1E549B488;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v7];

  [(CNQuickActionsView *)self performAction:v5];
  [(CNQuickActionsView *)self setActionsController:0];
}

uint64_t __63__CNQuickActionsView_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlertController:0];
}

- (void)didDisambiguateActionType:(id)a3 withActionItem:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F5A720];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = +[CNUIContactsEnvironment currentEnvironment];
  v11 = [v10 actionDiscoveringEnvironment];
  id v13 = (id)[v9 initWithDiscoveringEnvironment:v11];

  v12 = [(CNQuickActionsView *)self contact];
  [v13 consumer:self didSelectItem:v7 forContact:v12 actionType:v8];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  v6 = [v4 performActionWithContext:v5];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__CNQuickActionsView_performAction___block_invoke;
  v12[3] = &unk_1E5499638;
  id v7 = v4;
  id v13 = v7;
  v14 = self;
  [v6 addSuccessBlock:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__CNQuickActionsView_performAction___block_invoke_2;
  v9[3] = &unk_1E549A858;
  id v10 = v7;
  v11 = self;
  id v8 = v7;
  [v6 addFailureBlock:v9];
}

void __36__CNQuickActionsView_performAction___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_DidPerformActi.isa, *(void *)(a1 + 32));
  v2 = [*(id *)(a1 + 40) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) delegate];
    id v5 = *(void **)(a1 + 40);
    v6 = [v5 performingAction];
    [v4 actionsView:v5 didPerformAction:v6];
  }
  [*(id *)(a1 + 40) setPerformingAction:0];
  id v7 = *(void **)(a1 + 40);
  id v9 = [v7 performingAction];
  id v8 = [v9 userActionType];
  [v7 didDisambiguateActionType:v8 withActionItem:*(void *)(a1 + 32)];
}

void __36__CNQuickActionsView_performAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_DidFailToPerfo.isa, *(void *)(a1 + 32), a2);
  [*(id *)(a1 + 40) setPerformingAction:0];
  char v3 = *(void **)(a1 + 40);
  id v5 = [v3 performingAction];
  id v4 = [v5 userActionType];
  [v3 didDisambiguateActionType:v4 withActionItem:*(void *)(a1 + 32)];
}

- (void)showDisambiguationControllerWithDataSource:(id)a3 actionType:(id)a4 onController:(id)a5 sourceView:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [CNContactActionsController alloc];
  v15 = [(CNQuickActionsView *)self contact];
  v29[0] = v10;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v17 = [(CNContactActionsController *)v14 initWithContact:v15 dataSource:v13 actionTypes:v16];

  [(CNQuickActionsView *)self setActionsController:v17];
  v18 = [(CNQuickActionsView *)self actionsController];
  [v18 setDelegate:self];

  v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  v20 = (void *)MEMORY[0x1E4FB1410];
  v21 = CNContactsUIBundle();
  v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __100__CNQuickActionsView_showDisambiguationControllerWithDataSource_actionType_onController_sourceView___block_invoke;
  v28[3] = &unk_1E549B590;
  v28[4] = self;
  v23 = [v20 actionWithTitle:v22 style:1 handler:v28];
  [v19 addAction:v23];

  v24 = [(CNQuickActionsView *)self actionsController];
  v25 = [v24 viewController];
  [v19 setContentViewController:v25];

  v26 = [v19 popoverPresentationController];
  v27 = v26;
  if (v26)
  {
    [v26 setSourceView:v12];
    [v12 bounds];
    objc_msgSend(v27, "setSourceRect:");
  }
  [v11 presentViewController:v19 animated:1 completion:0];
}

uint64_t __100__CNQuickActionsView_showDisambiguationControllerWithDataSource_actionType_onController_sourceView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlertController:0];
}

- (BOOL)quickActionButton:(id)a3 performAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNQuickActionsView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  id v9 = [(CNQuickActionsView *)self delegate];
  id v10 = [v9 viewControllerForActionsView:self];

  if (!v10)
  {
LABEL_7:
    BOOL v30 = 0;
    goto LABEL_13;
  }
  id v11 = [v7 userActionType];
  id v12 = objc_alloc(MEMORY[0x1E4F5A720]);
  id v13 = +[CNUIContactsEnvironment currentEnvironment];
  v14 = [v13 actionDiscoveringEnvironment];
  v15 = (void *)[v12 initWithDiscoveringEnvironment:v14];

  [(CNQuickActionsView *)self setPerformingAction:v7];
  if ([v7 isLongPress]) {
    goto LABEL_11;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  v17 = [(CNQuickActionsView *)self contact];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54__CNQuickActionsView_quickActionButton_performAction___block_invoke;
  v34[3] = &unk_1E5499610;
  id v18 = v16;
  id v35 = v18;
  v32 = v11;
  id v19 = (id)[v15 consumer:self actionModelsForContact:v17 actionType:v11 handler:v34];

  v20 = [v18 future];
  v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  id v33 = 0;
  v22 = [v20 resultBeforeDate:v21 error:&v33];
  id v23 = v33;

  v24 = [v22 defaultAction];

  if (v24)
  {
    v29 = [v22 defaultAction];
    [(CNQuickActionsView *)self performAction:v29];
  }
  else if (!v22)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNQuickActionsView.m", 365, 5, @"Failed to retrieve default action with %@", v25, v26, v27, v28, (uint64_t)v23);
  }

  id v11 = v32;
  if (!v24) {
LABEL_11:
  }
    [(CNQuickActionsView *)self showDisambiguationControllerWithDataSource:v15 actionType:v11 onController:v10 sourceView:v6];

  BOOL v30 = 1;
LABEL_13:

  return v30;
}

uint64_t __54__CNQuickActionsView_quickActionButton_performAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"actionCell" forIndexPath:v6];
  id v8 = [(CNQuickActionsView *)self actions];
  uint64_t v9 = [v6 item];

  id v10 = [v8 objectAtIndex:v9];

  id v11 = [v7 button];
  [v11 setAction:v10];

  id v12 = [v7 button];
  [v12 setDelegate:self];

  objc_msgSend(v7, "setShowTitle:", -[CNQuickActionsView showTitles](self, "showTitles"));
  objc_msgSend(v7, "setShowBackgroundPlatter:", -[CNQuickActionsView showBackgroundPlatters](self, "showBackgroundPlatters"));

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(CNQuickActionsView *)self actions];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)actionsManager:(id)a3 actionDidPerform:(id)a4
{
  id v8 = a4;
  int64_t v5 = [(CNQuickActionsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNQuickActionsView *)self delegate];
    [v7 actionsView:self didPerformAction:v8];
  }
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  int64_t v5 = [(CNQuickActionsView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNQuickActionsView *)self delegate];
    id v8 = [v7 viewControllerForActionsView:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (double)maximumWidth
{
  char v3 = [(CNQuickActionsView *)self categories];
  uint64_t v4 = [v3 count];

  [(CNQuickActionsView *)self _widthForButtonCount:v4 itemSize:0];
  return result;
}

- (double)_widthForButtonCount:(int64_t)a3 itemSize:(CGSize *)a4
{
  int64_t v4 = a3 - 1;
  if (a3 < 1) {
    return 0.0;
  }
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x3010000000;
  v22 = &unk_18BA11DF2;
  long long v23 = *MEMORY[0x1E4F1DB30];
  id v8 = [(CNQuickActionsView *)self actions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__CNQuickActionsView__widthForButtonCount_itemSize___block_invoke;
  v18[3] = &unk_1E54995E8;
  v18[4] = self;
  v18[5] = &v19;
  [v8 enumerateObjectsUsingBlock:v18];

  uint64_t v9 = [(CNQuickActionsView *)self collectionLayout];
  [v9 minimumInteritemSpacing];
  double v11 = v10;

  if ([(CNQuickActionsView *)self showTitles]) {
    double v12 = 60.0;
  }
  else {
    double v12 = v20[4];
  }
  double v14 = v20[5];
  BOOL v15 = [(CNQuickActionsView *)self showTitles];
  if (a4)
  {
    double v16 = 0.0;
    if (v15) {
      double v16 = 25.0;
    }
    a4->double width = v12;
    a4->double height = v14 + v16;
  }
  double v13 = v11 * (double)v4 + (double)a3 * v12;
  _Block_object_dispose(&v19, 8);
  return v13;
}

void __52__CNQuickActionsView__widthForButtonCount_itemSize___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int64_t v5 = [v3 tintColor];
  [v4 setImageTintColor:v5];

  char v6 = [v4 imageForContext:5];

  [v6 size];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  double v12 = *(double *)(v11 + 32);
  double v13 = ceil(v8);
  if (v12 < v13) {
    double v12 = v13;
  }
  *(double *)(v11 + 32) = v12;
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  double v15 = *(double *)(v14 + 40);
  double v16 = ceil(v10);
  if (v15 < v16) {
    double v15 = v16;
  }
  *(double *)(v14 + 40) = v15;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNQuickActionsView;
  -[CNQuickActionsView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    [(CNQuickActionsView *)self _updateActions];
  }
}

- (void)updateContentSize
{
  char v3 = [(CNQuickActionsView *)self actions];
  uint64_t v4 = [v3 count];

  objc_super v5 = (double *)MEMORY[0x1E4F1DB30];
  long long v11 = *MEMORY[0x1E4F1DB30];
  [(CNQuickActionsView *)self _widthForButtonCount:v4 itemSize:&v11];
  if (v6 <= 0.0)
  {
    double v7 = *v5;
    double v8 = v5[1];
  }
  else
  {
    double v7 = v6;
    double v8 = *((double *)&v11 + 1);
    double v9 = *(double *)&v11;
    double v10 = [(CNQuickActionsView *)self collectionLayout];
    objc_msgSend(v10, "setItemSize:", v9, v8);
  }
  -[CNQuickActionsView setCachedContentSize:](self, "setCachedContentSize:", v7, v8);
  [(CNQuickActionsView *)self invalidateIntrinsicContentSize];
}

- (void)reloadData
{
  [(CNQuickActionsView *)self updateContentSize];
  id v3 = [(CNQuickActionsView *)self collectionView];
  [v3 reloadData];
}

- (void)_updateActions
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNQuickActionsView *)self actionsManager];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  objc_super v5 = [v3 contacts];
  double v6 = [(CNQuickActionsView *)self contact];
  v18[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v8 = [v5 isEqual:v7];

  if (v8)
  {
    double v9 = v4;
  }
  else
  {
LABEL_4:
    double v10 = objc_opt_class();
    long long v11 = [(CNQuickActionsView *)self contact];
    double v9 = [v10 actionsManagerForContact:v11];

    double v12 = [(CNQuickActionsView *)self categories];
    [v9 setCategories:v12];

    objc_msgSend(v9, "setSortsWithDuet:", -[CNQuickActionsView sortsWithDuet](self, "sortsWithDuet"));
    objc_msgSend(v9, "setUseDuetIfAvailable:", -[CNQuickActionsView useDuetIfAvailable](self, "useDuetIfAvailable"));
    [(CNQuickActionsView *)self setActionsManager:v9];
    [v9 setDelegate:self];
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__CNQuickActionsView__updateActions__block_invoke;
    v13[3] = &unk_1E54995C0;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    [v9 updateActionsWithBlock:v13];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __36__CNQuickActionsView__updateActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained actions];
  uint64_t v4 = (void *)[v3 mutableCopy];

  objc_super v5 = [v2 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [v2 delegate];
    [v7 actionsView:v2 willShowActions:v4];
  }
  [v2 setActions:v4];
  [v2 reloadData];
}

- (double)interspace
{
  id v2 = [(CNQuickActionsView *)self collectionLayout];
  [v2 minimumInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (void)setSortsWithDuet:(BOOL)a3
{
  BOOL v3 = a3;
  self->_sortsWithDuet = a3;
  id v4 = [(CNQuickActionsView *)self actionsManager];
  [v4 setSortsWithDuet:v3];
}

- (void)setInterspace:(double)a3
{
  id v4 = [(CNQuickActionsView *)self collectionLayout];
  [v4 setMinimumInteritemSpacing:a3];
}

- (void)setContact:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    char v6 = [(id)objc_opt_class() descriptorForRequiredKeys];
    v9[0] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(CNContact *)v5 assertKeysAreAvailable:v7];

    objc_storeStrong((id *)&self->_contact, a3);
    char v8 = [(CNQuickActionsView *)self window];

    if (v8) {
      [(CNQuickActionsView *)self _updateActions];
    }
  }
}

- (CNQuickActionsView)initWithContact:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = a3;
  double v9 = -[CNQuickActionsView initWithFrame:](self, "initWithFrame:", v4, v5, v6, v7);
  [(CNQuickActionsView *)v9 setContact:v8];

  return v9;
}

- (CNQuickActionsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19[4] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CNQuickActionsView;
  double v7 = -[CNQuickActionsView initWithFrame:](&v18, sel_initWithFrame_);
  v7->_showBackgroundPlatters = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [(CNQuickActionsView *)v7 setCollectionLayout:v8];
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v8, x, y, width, height);
  [v9 setScrollEnabled:0];
  [v9 setBackgroundColor:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNQuickActionsView *)v7 addSubview:v9];
  [(CNQuickActionsView *)v7 setCollectionView:v9];
  double v10 = (void *)MEMORY[0x1E4F28DC8];
  long long v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v7 attribute:3 multiplier:1.0 constant:0.0];
  v19[0] = v11;
  double v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:1 relatedBy:0 toItem:v7 attribute:1 multiplier:1.0 constant:0.0];
  v19[1] = v12;
  double v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:0.0];
  v19[2] = v13;
  id v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:2 relatedBy:0 toItem:v7 attribute:2 multiplier:1.0 constant:0.0];
  v19[3] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v10 activateConstraints:v15];

  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"actionCell"];
  [v9 setDataSource:v7];
  [v9 setDelegate:v7];
  double v16 = [(id)objc_opt_class() defaultCategories];
  [(CNQuickActionsView *)v7 setCategories:v16];

  return v7;
}

+ (id)actionsManagerForContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = a3;
    BOOL v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a3;
    double v5 = [v3 arrayWithObjects:&v8 count:1];
    double v6 = +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", v5, v8, v9);
  }
  else
  {
    double v6 = +[CNQuickActionsManager actionsManagerForContacts:MEMORY[0x1E4F1CBF0]];
  }

  return v6;
}

+ (id)defaultCategories
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = CNQuickActionCategoryAudioCall;
  v4[1] = CNQuickActionCategoryVideoCall;
  v4[2] = CNQuickActionCategoryInstantMessage;
  v4[3] = CNQuickActionCategoryMail;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

+ (BOOL)hasActionsForContact:(id)a3
{
  return +[CNQuickActionsManager hasActionsForContact:a3];
}

+ (id)descriptorForRequiredKeys
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1B8F8];
  BOOL v3 = +[CNQuickActionsManager descriptorForRequiredKeys];
  v9[0] = v3;
  id v4 = [MEMORY[0x1E4F5A720] descriptorForRequiredKeys];
  v9[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  double v6 = [NSString stringWithUTF8String:"+[CNQuickActionsView descriptorForRequiredKeys]"];
  double v7 = [v2 descriptorWithKeyDescriptors:v5 description:v6];

  return v7;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end