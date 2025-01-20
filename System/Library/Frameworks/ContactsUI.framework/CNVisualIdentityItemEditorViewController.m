@interface CNVisualIdentityItemEditorViewController
- (BOOL)canBeginEditing;
- (BOOL)canCancel;
- (BOOL)editorViewOverlapsWindowBasedKeyboardRect:(CGRect)a3;
- (BOOL)isEmojiProviderItemType;
- (BOOL)shouldBeginEditing;
- (BOOL)shouldShowStyleCollectionView;
- (CNPhotoPickerProviderItem)providerItem;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController;
- (CNVisualIdentityItemEditorSegmentedControl)segmentedControl;
- (CNVisualIdentityItemEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4;
- (CNVisualIdentityItemEditorViewControllerDelegate)delegate;
- (NSArray)variantProviderItems;
- (NSLayoutConstraint)avatarViewSizeConstraint;
- (NSLayoutConstraint)avatarViewTopConstraint;
- (NSLayoutConstraint)segmentedControlHeightConstraint;
- (NSString)doneButtonTitle;
- (UICollectionView)styleCollectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIView)styleDividerView;
- (double)editableAvatarViewEdgeLength;
- (double)editorViewBottomYForAvatarSize:(double)a3 withContainerTopMargin:(double)a4;
- (double)fontSizeForContainerSize:(double)a3;
- (double)segmentedControlTopMargin;
- (double)styleContainerTopMargin;
- (double)textFieldFontSize;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)updatedProviderItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsPerRow;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)adjustAvatarViewConstraintsForKeyboardFrame:(CGRect)a3;
- (void)beginEditingAvatar;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapCancel;
- (void)didTapDone;
- (void)didTapEditableAvatar:(id)a3;
- (void)didTapSegmentedControl:(id)a3;
- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4;
- (void)forceEmojiKeyboardIfNeeded;
- (void)generateProviderItems;
- (void)hideStyleCollectionView;
- (void)keyboardWillShow:(id)a3;
- (void)providerItemDidUpdate:(id)a3;
- (void)setAvatarViewSizeConstraint:(id)a3;
- (void)setAvatarViewTopConstraint:(id)a3;
- (void)setCanBeginEditing:(BOOL)a3;
- (void)setCanCancel:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButtonTitle:(id)a3;
- (void)setEditableAvatarViewController:(id)a3;
- (void)setProviderItem:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegmentedControlHeightConstraint:(id)a3;
- (void)setStyleCollectionView:(id)a3;
- (void)setStyleDividerView:(id)a3;
- (void)setUpFirstResponderForProviderItem:(id)a3;
- (void)setVariantProviderItems:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)setupBarButtonItems;
- (void)setupEditableAvatarViewController;
- (void)setupSegmentedControl;
- (void)setupStyleCollectionView;
- (void)setupViewWithProviderItem:(id)a3;
- (void)switchEditorToMode:(unint64_t)a3;
- (void)updateDoneButtonEnabledStateForText:(id)a3;
- (void)updateFlowLayoutItemSize;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNVisualIdentityItemEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerItem, 0);
  objc_storeStrong((id *)&self->_variantProviderItems, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_styleDividerView, 0);
  objc_storeStrong((id *)&self->_styleCollectionView, 0);
  objc_storeStrong((id *)&self->_segmentedControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewSizeConstraint, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_editableAvatarViewController, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCanBeginEditing:(BOOL)a3
{
  self->_canBeginEditing = a3;
}

- (BOOL)canBeginEditing
{
  return self->_canBeginEditing;
}

- (void)setProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setVariantProviderItems:(id)a3
{
}

- (NSArray)variantProviderItems
{
  return self->_variantProviderItems;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setStyleDividerView:(id)a3
{
}

- (UIView)styleDividerView
{
  return self->_styleDividerView;
}

- (void)setStyleCollectionView:(id)a3
{
}

- (UICollectionView)styleCollectionView
{
  return self->_styleCollectionView;
}

- (void)setSegmentedControlHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)segmentedControlHeightConstraint
{
  return self->_segmentedControlHeightConstraint;
}

- (void)setAvatarViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)avatarViewTopConstraint
{
  return self->_avatarViewTopConstraint;
}

- (void)setAvatarViewSizeConstraint:(id)a3
{
}

- (NSLayoutConstraint)avatarViewSizeConstraint
{
  return self->_avatarViewSizeConstraint;
}

- (void)setSegmentedControl:(id)a3
{
}

- (CNVisualIdentityItemEditorSegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setEditableAvatarViewController:(id)a3
{
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController
{
  return self->_editableAvatarViewController;
}

- (void)setCanCancel:(BOOL)a3
{
  self->_canCancel = a3;
}

- (BOOL)canCancel
{
  return self->_canCancel;
}

- (void)setDoneButtonTitle:(id)a3
{
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityItemEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityItemEditorViewControllerDelegate *)WeakRetained;
}

- (double)styleContainerTopMargin
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v2 bounds];
  if (v3 <= 667.0) {
    double v4 = 36.0;
  }
  else {
    double v4 = 43.0;
  }

  return v4;
}

- (double)segmentedControlTopMargin
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v2 bounds];
  if (v3 <= 667.0) {
    double v4 = 20.0;
  }
  else {
    double v4 = 30.0;
  }

  return v4;
}

- (double)fontSizeForContainerSize:(double)a3
{
  if ([(CNVisualIdentityItemEditorViewController *)self isEmojiProviderItemType]) {
    return a3 * 0.631578947;
  }
  if (a3 == 240.0) {
    return 120.0;
  }
  double result = 60.0;
  if (a3 == 200.0) {
    return 100.0;
  }
  return result;
}

- (double)textFieldFontSize
{
  [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewEdgeLength];

  -[CNVisualIdentityItemEditorViewController fontSizeForContainerSize:](self, "fontSizeForContainerSize:");
  return result;
}

- (double)editableAvatarViewEdgeLength
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v2 bounds];
  if (v3 <= 667.0) {
    double v4 = 200.0;
  }
  else {
    double v4 = 240.0;
  }

  return v4;
}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  id v9 = a4;
  if ([v9 conformsToProtocol:&unk_1ED9A0450]) {
    v5 = v9;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 itemText];
    [(CNVisualIdentityItemEditorViewController *)self updateDoneButtonEnabledStateForText:v8];
  }
}

- (void)providerItemDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(CNVisualIdentityItemEditorViewController *)self variantProviderItems];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__CNVisualIdentityItemEditorViewController_providerItemDidUpdate___block_invoke;
    v9[3] = &unk_1E549BF80;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __66__CNVisualIdentityItemEditorViewController_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) styleCollectionView];
  v4[0] = *(void *)(a1 + 40);
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 reloadItemsAtIndexPaths:v3];
}

- (void)generateProviderItems
{
  double v3 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  [v3 conformsToProtocol:&unk_1ED9A0450];

  id v4 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  v5 = [(CNVisualIdentityItemEditorViewController *)self variantsManager];
  uint64_t v6 = [v4 createVariantsItemsWithVariantsManager:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CNVisualIdentityItemEditorViewController_generateProviderItems__block_invoke;
  v8[3] = &unk_1E5499308;
  v8[4] = self;
  objc_msgSend(v6, "_cn_each:", v8);
  [(CNVisualIdentityItemEditorViewController *)self setVariantProviderItems:v6];
  v7 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
  [v7 reloadData];
}

void __65__CNVisualIdentityItemEditorViewController_generateProviderItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [*(id *)(a1 + 32) providerItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v10 = v3;
  if (objc_opt_isKindOfClass()) {
    v7 = v10;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    [v6 originalImageSize];
    objc_msgSend(v8, "setOriginalImageSize:");
  }
  [v10 setDelegate:*(void *)(a1 + 32)];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v6 layoutMargins];
  double v8 = v7;
  BOOL v9 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v9 layoutMargins];
  double v11 = v10;

  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v8;
  double v15 = v11;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CNVisualIdentityItemEditorViewController *)self variantProviderItems];
  uint64_t v7 = [v5 row];

  double v8 = [v6 objectAtIndexedSubscript:v7];
  [(CNVisualIdentityItemEditorViewController *)self setProviderItem:v8];

  objc_opt_class();
  BOOL v9 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  if (objc_opt_isKindOfClass()) {
    double v10 = v9;
  }
  else {
    double v10 = 0;
  }
  id v14 = v10;

  if (v14) {
    id v11 = (id)[v14 generateImageDataIfNeeded];
  }
  double v12 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  double v13 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  [v12 updateWithProviderItem:v13];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
  BOOL v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  [v12 setCellStyle:1];
  if (v12)
  {
    double v13 = [(CNVisualIdentityItemEditorViewController *)self variantProviderItems];
    id v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__CNVisualIdentityItemEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v19[3] = &unk_1E549A038;
    id v15 = v12;
    id v20 = v15;
    [v14 thumbnailViewWithCompletion:v19];
    id v16 = v15;
  }
  else
  {
    id v17 = v10;
  }

  return v10;
}

uint64_t __82__CNVisualIdentityItemEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateWithView:a2 animation:1];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(CNVisualIdentityItemEditorViewController *)self variantProviderItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(CNVisualIdentityItemEditorViewController *)self shouldShowStyleCollectionView];
}

- (void)didTapSegmentedControl:(id)a3
{
  uint64_t v4 = [a3 selectedSegmentIndex];
  if (v4 == 1)
  {
    int64_t v5 = [(CNVisualIdentityItemEditorViewController *)self updatedProviderItem];
    [(CNVisualIdentityItemEditorViewController *)self setProviderItem:v5];

    id v6 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
    [v6 endEditing];

    [(CNVisualIdentityItemEditorViewController *)self setupStyleCollectionView];
  }
  else if (!v4)
  {
    [(CNVisualIdentityItemEditorViewController *)self beginEditingAvatar];
    [(CNVisualIdentityItemEditorViewController *)self hideStyleCollectionView];
  }
}

- (void)didTapDone
{
  id v3 = [(CNVisualIdentityItemEditorViewController *)self delegate];

  if (v3)
  {
    id v5 = [(CNVisualIdentityItemEditorViewController *)self updatedProviderItem];
    uint64_t v4 = [(CNVisualIdentityItemEditorViewController *)self delegate];
    [v4 visualIdentityEditorController:self didFinishWithProviderItem:v5];
  }
  else
  {
    [(CNVisualIdentityItemEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapCancel
{
  id v3 = [(CNVisualIdentityItemEditorViewController *)self delegate];

  if (v3)
  {
    id v4 = [(CNVisualIdentityItemEditorViewController *)self delegate];
    [v4 visualIdentityEditorControllerDidCancel:self];
  }
  else
  {
    [(CNVisualIdentityItemEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)isEmojiProviderItemType
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  BOOL v3 = [v2 imageType] == 4;

  return v3;
}

- (id)updatedProviderItem
{
  BOOL v3 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  if ([v3 conformsToProtocol:&unk_1ED9A0450]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
    id v7 = [v6 text];
    double v8 = [v5 updatedProviderItemWithText:v7];
  }
  else
  {
    id v6 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
    double v8 = (void *)[v6 copy];
  }

  return v8;
}

- (int64_t)numberOfItemsPerRow
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v2 bounds];
  if (v3 <= 460.0) {
    int64_t v4 = 4;
  }
  else {
    int64_t v4 = 6;
  }

  return v4;
}

- (void)updateFlowLayoutItemSize
{
  if ([(CNVisualIdentityItemEditorViewController *)self shouldShowStyleCollectionView])
  {
    double v3 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    id v8 = [v3 collectionViewLayout];

    uint64_t v4 = [(CNVisualIdentityItemEditorViewController *)self numberOfItemsPerRow];
    id v5 = [(CNVisualIdentityItemEditorViewController *)self view];
    [v5 bounds];
    double v7 = (v6 + (double)(v4 + 1) * -20.0) / (double)v4;

    objc_msgSend(v8, "setItemSize:", v7, v7);
    [v8 invalidateLayout];
  }
}

- (BOOL)shouldShowStyleCollectionView
{
  v2 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  BOOL v3 = [v2 selectedSegmentIndex] == 1;

  return v3;
}

- (void)hideStyleCollectionView
{
  BOOL v3 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
  [v3 removeFromSuperview];

  id v4 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
  [v4 removeFromSuperview];
}

- (void)setUpFirstResponderForProviderItem:(id)a3
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1ED9A0450]) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5) {
    [(CNVisualIdentityItemEditorViewController *)self beginEditingAvatar];
  }
}

- (void)setupViewWithProviderItem:(id)a3
{
  id v4 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  if ([v4 conformsToProtocol:&unk_1ED9A0450]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v8 = v5;

  id v6 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  if (v8)
  {
    [v6 setTextAndStyleMode];

    id v6 = [v8 itemText];
    [(CNVisualIdentityItemEditorViewController *)self updateDoneButtonEnabledStateForText:v6];
  }
  else
  {
    [v6 setStyleOnlyMode];
  }

  double v7 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  [(CNVisualIdentityItemEditorViewController *)self didTapSegmentedControl:v7];
}

- (void)setupStyleCollectionView
{
  v83[8] = *MEMORY[0x1E4F143B8];
  if ([(CNVisualIdentityItemEditorViewController *)self shouldShowStyleCollectionView])
  {
    BOOL v3 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];

    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
      [v4 setMinimumLineSpacing:8.0];
      [v4 setScrollDirection:0];
      id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
      double v6 = *MEMORY[0x1E4F1DB28];
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      id v10 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], v7, v8, v9);
      [(CNVisualIdentityItemEditorViewController *)self setStyleCollectionView:v10];

      id v11 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v12 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v12 setDelegate:self];

      double v13 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v13 setDataSource:self];

      id v14 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      uint64_t v15 = objc_opt_class();
      id v16 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
      [v14 registerClass:v15 forCellWithReuseIdentifier:v16];

      id v17 = [MEMORY[0x1E4FB1618] clearColor];
      v18 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v18 setBackgroundColor:v17];

      v19 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v19 setAlwaysBounceVertical:1];

      id v20 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
      [v20 setContentInsetAdjustmentBehavior:3];

      [(CNVisualIdentityItemEditorViewController *)self updateFlowLayoutItemSize];
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
      [(CNVisualIdentityItemEditorViewController *)self setStyleDividerView:v21];

      v22 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

      v23 = +[CNUIColorRepository visualIdentityEditorDividerColor];
      v24 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      [v24 setBackgroundColor:v23];

      id v25 = +[CNUIColorRepository photoPickerBackgroundShadowColor];
      uint64_t v26 = [v25 CGColor];
      v27 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      v28 = [v27 layer];
      [v28 setShadowColor:v26];

      v29 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      v30 = [v29 layer];
      LODWORD(v31) = 1.0;
      [v30 setShadowOpacity:v31];

      v32 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      v33 = [v32 layer];
      objc_msgSend(v33, "setShadowOffset:", 0.0, 1.0);

      v34 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
      v35 = [v34 layer];
      [v35 setShadowRadius:0.5];
    }
    v36 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v36 scale];
    double v38 = v37;

    if (v38 <= 0.0) {
      double v39 = 1.0;
    }
    else {
      double v39 = 1.0 / v38;
    }
    v40 = [(CNVisualIdentityItemEditorViewController *)self view];
    v41 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    [v40 addSubview:v41];

    v42 = [(CNVisualIdentityItemEditorViewController *)self view];
    v43 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    [v42 addSubview:v43];

    v82 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    v80 = [v82 topAnchor];
    v81 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
    v79 = [v81 bottomAnchor];
    [(CNVisualIdentityItemEditorViewController *)self styleContainerTopMargin];
    v78 = objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79);
    v83[0] = v78;
    v77 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    v75 = [v77 leadingAnchor];
    v76 = [(CNVisualIdentityItemEditorViewController *)self view];
    v74 = [v76 leadingAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v83[1] = v73;
    v72 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    v70 = [v72 trailingAnchor];
    v71 = [(CNVisualIdentityItemEditorViewController *)self view];
    v69 = [v71 trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v83[2] = v68;
    v67 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    v66 = [v67 heightAnchor];
    v65 = [v66 constraintEqualToConstant:v39];
    v83[3] = v65;
    v64 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    v62 = [v64 topAnchor];
    v63 = [(CNVisualIdentityItemEditorViewController *)self styleDividerView];
    v61 = [v63 bottomAnchor];
    v59 = [v62 constraintEqualToAnchor:v61 constant:12.0];
    v83[4] = v59;
    v58 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    v56 = [v58 leadingAnchor];
    v57 = [(CNVisualIdentityItemEditorViewController *)self view];
    v55 = [v57 leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v83[5] = v54;
    v53 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    v44 = [v53 trailingAnchor];
    v45 = [(CNVisualIdentityItemEditorViewController *)self view];
    v46 = [v45 trailingAnchor];
    v47 = [v44 constraintEqualToAnchor:v46];
    v83[6] = v47;
    v48 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
    v49 = [v48 bottomAnchor];
    v50 = [(CNVisualIdentityItemEditorViewController *)self view];
    v51 = [v50 bottomAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    v83[7] = v52;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:8];

    [MEMORY[0x1E4F28DC8] activateConstraints:v60];
    [(CNVisualIdentityItemEditorViewController *)self generateProviderItems];
  }
}

- (void)setupSegmentedControl
{
  v41[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  if ([v3 conformsToProtocol:&unk_1ED9A0450]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  double v6 = +[CNVisualIdentityItemEditorSegmentedControl segmentedControlForItemType:](CNVisualIdentityItemEditorSegmentedControl, "segmentedControlForItemType:", [v5 imageType]);
  [(CNVisualIdentityItemEditorViewController *)self setSegmentedControl:v6];

  double v7 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  double v8 = v7;
  if (v4) {
    double v9 = 30.0;
  }
  else {
    double v9 = 0.0;
  }
  [v7 setHidden:v4 == 0];

  id v10 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  [v10 addTarget:self action:sel_didTapSegmentedControl_ forControlEvents:4096];

  id v11 = [(CNVisualIdentityItemEditorViewController *)self view];
  id v12 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  [v11 addSubview:v12];

  double v13 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  id v14 = [v13 heightAnchor];
  uint64_t v15 = [v14 constraintEqualToConstant:v9];
  [(CNVisualIdentityItemEditorViewController *)self setSegmentedControlHeightConstraint:v15];

  v40 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  double v37 = [v40 topAnchor];
  double v39 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  double v38 = [v39 view];
  v36 = [v38 bottomAnchor];
  [(CNVisualIdentityItemEditorViewController *)self segmentedControlTopMargin];
  v35 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36);
  v41[0] = v35;
  v34 = [(CNVisualIdentityItemEditorViewController *)self segmentedControlHeightConstraint];
  v41[1] = v34;
  v33 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  double v31 = [v33 centerXAnchor];
  v32 = [(CNVisualIdentityItemEditorViewController *)self view];
  v30 = [v32 centerXAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v41[2] = v29;
  v28 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  id v25 = [v28 leadingAnchor];
  uint64_t v26 = [(CNVisualIdentityItemEditorViewController *)self view];
  id v16 = [v26 layoutMarginsGuide];
  id v17 = [v16 leadingAnchor];
  v18 = [v25 constraintEqualToAnchor:v17];
  v41[3] = v18;
  v19 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  id v20 = [v19 trailingAnchor];
  v21 = [(CNVisualIdentityItemEditorViewController *)self view];
  v22 = [v21 layoutMarginsGuide];
  v23 = [v22 trailingAnchor];
  v24 = [v20 constraintEqualToAnchor:v23];
  v41[4] = v24;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];

  [MEMORY[0x1E4F28DC8] activateConstraints:v27];
  [(CNVisualIdentityItemEditorViewController *)self setupStyleCollectionView];
}

- (void)switchEditorToMode:(unint64_t)a3
{
  id v5 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  [v5 setSelectedSegmentIndex:a3];

  id v6 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  [(CNVisualIdentityItemEditorViewController *)self didTapSegmentedControl:v6];
}

- (BOOL)shouldBeginEditing
{
  if ([(CNVisualIdentityItemEditorViewController *)self canBeginEditing])
  {
    BOOL v3 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
    char v4 = [v3 allowsTextInputForCurrentEditorType];
  }
  else
  {
    char v4 = 0;
  }
  id v5 = [(CNVisualIdentityItemEditorViewController *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    double v7 = [(CNVisualIdentityItemEditorViewController *)self navigationController];
    if (objc_opt_isKindOfClass()) {
      double v8 = v7;
    }
    else {
      double v8 = 0;
    }
    id v9 = v8;

    char v10 = [v9 isDisplayingTrapView];
    return v10 ^ 1;
  }
  return v4;
}

- (void)beginEditingAvatar
{
  if ([(CNVisualIdentityItemEditorViewController *)self shouldBeginEditing])
  {
    id v3 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
    [v3 beginEditing];
  }
}

- (void)forceEmojiKeyboardIfNeeded
{
  id v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  char v4 = [v3 currentInputMode];
  id v6 = [v4 normalizedIdentifier];

  if (([v6 isEqualToString:*MEMORY[0x1E4FB2BF0]] & 1) == 0)
  {
    id v5 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
    [v5 endEditing];
  }
  [(CNVisualIdentityItemEditorViewController *)self beginEditingAvatar];
}

- (void)didTapEditableAvatar:(id)a3
{
  char v4 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  if (v5 == 1)
  {
    id v6 = [(CNVisualIdentityItemEditorViewController *)self segmentedControl];
    int v7 = [v6 isEnabledForSegmentAtIndex:0];

    if (v7)
    {
      [(CNVisualIdentityItemEditorViewController *)self switchEditorToMode:0];
    }
  }
  else if (!v5)
  {
    if ([(CNVisualIdentityItemEditorViewController *)self isEmojiProviderItemType])
    {
      [(CNVisualIdentityItemEditorViewController *)self forceEmojiKeyboardIfNeeded];
    }
    else
    {
      [(CNVisualIdentityItemEditorViewController *)self beginEditingAvatar];
    }
  }
}

- (void)setupEditableAvatarViewController
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v3 = [CNVisualIdentityEditablePrimaryAvatarViewController alloc];
  char v4 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  uint64_t v5 = [(CNVisualIdentityItemEditorViewController *)self variantsManager];
  id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)v3 initWithProviderItem:v4 variantsManager:v5];
  [(CNVisualIdentityItemEditorViewController *)self setEditableAvatarViewController:v6];

  int v7 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  [v7 setDelegate:self];

  [(CNVisualIdentityItemEditorViewController *)self textFieldFontSize];
  double v9 = v8;
  char v10 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  [v10 setDesiredFontSize:v9];

  id v11 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  id v12 = [v11 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v13 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  [(CNVisualIdentityItemEditorViewController *)self addChildViewController:v13];

  id v14 = [(CNVisualIdentityItemEditorViewController *)self view];
  uint64_t v15 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  id v16 = [v15 view];
  [v14 addSubview:v16];

  id v17 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  [v17 didMoveToParentViewController:self];

  v18 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  v19 = [v18 view];
  id v20 = [v19 widthAnchor];
  [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewEdgeLength];
  v21 = objc_msgSend(v20, "constraintEqualToConstant:");
  [(CNVisualIdentityItemEditorViewController *)self setAvatarViewSizeConstraint:v21];

  v22 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  v23 = [v22 view];
  v24 = [v23 topAnchor];
  id v25 = [(CNVisualIdentityItemEditorViewController *)self view];
  uint64_t v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:100.0];
  [(CNVisualIdentityItemEditorViewController *)self setAvatarViewTopConstraint:v27];

  v46 = [(CNVisualIdentityItemEditorViewController *)self avatarViewSizeConstraint];
  v47[0] = v46;
  v45 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
  v47[1] = v45;
  v44 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  v43 = [v44 view];
  v41 = [v43 heightAnchor];
  v42 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  v28 = [v42 view];
  v29 = [v28 widthAnchor];
  v30 = [v41 constraintEqualToAnchor:v29];
  v47[2] = v30;
  double v31 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  v32 = [v31 view];
  v33 = [v32 centerXAnchor];
  v34 = [(CNVisualIdentityItemEditorViewController *)self view];
  v35 = [v34 centerXAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v47[3] = v36;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v40];
  double v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapEditableAvatar_];
  double v38 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
  double v39 = [v38 view];
  [v39 addGestureRecognizer:v37];
}

- (void)updateDoneButtonEnabledStateForText:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F5A2A0];
  objc_msgSend(a3, "_cn_trimmedString");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v8);
  id v6 = [(CNVisualIdentityItemEditorViewController *)self navigationItem];
  int v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];
}

- (void)setupBarButtonItems
{
  if ([(CNVisualIdentityItemEditorViewController *)self canCancel])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel];
    uint64_t v4 = [(CNVisualIdentityItemEditorViewController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
  uint64_t v5 = *MEMORY[0x1E4F5A2A0];
  id v6 = [(CNVisualIdentityItemEditorViewController *)self doneButtonTitle];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v8 = v7;
  if (v5)
  {
    double v9 = [(CNVisualIdentityItemEditorViewController *)self doneButtonTitle];
    char v10 = (void *)[v8 initWithTitle:v9 style:2 target:self action:sel_didTapDone];
    id v11 = [(CNVisualIdentityItemEditorViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v10];
  }
  else
  {
    double v9 = (void *)[v7 initWithBarButtonSystemItem:0 target:self action:sel_didTapDone];
    char v10 = [(CNVisualIdentityItemEditorViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v9];
  }

  id v12 = [(CNVisualIdentityItemEditorViewController *)self navigationItem];
  [v12 _setBackgroundHidden:1];

  double v13 = [(CNVisualIdentityItemEditorViewController *)self navigationController];
  id v14 = [v13 navigationBar];
  char v15 = [v14 isTranslucent];

  if ((v15 & 1) == 0)
  {
    [(CNVisualIdentityItemEditorViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorViewController;
  -[CNVisualIdentityItemEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  uint64_t v5 = [(CNVisualIdentityItemEditorViewController *)self styleCollectionView];
  id v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];
}

- (BOOL)editorViewOverlapsWindowBasedKeyboardRect:(CGRect)a3
{
  double y = a3.origin.y;
  uint64_t v5 = [(CNVisualIdentityItemEditorViewController *)self avatarViewSizeConstraint];
  [v5 constant];
  double v7 = v6;
  id v8 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
  [v8 constant];
  [(CNVisualIdentityItemEditorViewController *)self editorViewBottomYForAvatarSize:v7 withContainerTopMargin:v9];
  double v11 = v10;

  return v11 > y;
}

- (double)editorViewBottomYForAvatarSize:(double)a3 withContainerTopMargin:(double)a4
{
  double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v10 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v10 bounds];
  double v12 = v9 - v11;

  double v13 = 30.0;
  if (a3 <= 200.0) {
    double v13 = 20.0;
  }
  double v14 = v13 + v12 + a4 + a3;
  char v15 = [(CNVisualIdentityItemEditorViewController *)self segmentedControlHeightConstraint];
  [v15 constant];
  double v17 = v16 + v14;

  return v17;
}

- (void)adjustAvatarViewConstraintsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CNVisualIdentityItemEditorViewController *)self view];
  double v9 = [v8 window];
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
  {
    v18 = [(CNVisualIdentityItemEditorViewController *)self avatarViewSizeConstraint];
    [v18 setConstant:200.0];

    v19 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
    [v19 setConstant:64.0];

    if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
    {
      if ([(CNVisualIdentityItemEditorViewController *)self isEmojiProviderItemType])
      {
        id v20 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
        [v20 setConstant:32.0];
      }
      if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
      {
        v21 = [(CNVisualIdentityItemEditorViewController *)self avatarViewSizeConstraint];
        [v21 setConstant:120.0];

        v22 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
        [v22 setConstant:42.0];

        if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
        {
          if ([(CNVisualIdentityItemEditorViewController *)self isEmojiProviderItemType])
          {
            v23 = [(CNVisualIdentityItemEditorViewController *)self avatarViewTopConstraint];
            [v23 setConstant:24.0];
          }
        }
      }
    }
    id v25 = [(CNVisualIdentityItemEditorViewController *)self editableAvatarViewController];
    v24 = [(CNVisualIdentityItemEditorViewController *)self avatarViewSizeConstraint];
    [v24 constant];
    -[CNVisualIdentityItemEditorViewController fontSizeForContainerSize:](self, "fontSizeForContainerSize:");
    objc_msgSend(v25, "updateTextFieldFontSize:");
  }
}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CNVisualIdentityItemEditorViewController adjustAvatarViewConstraintsForKeyboardFrame:](self, "adjustAvatarViewConstraintsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNVisualIdentityItemEditorViewController;
  [(CNVisualIdentityItemEditorViewController *)&v3 viewDidLayoutSubviews];
  [(CNVisualIdentityItemEditorViewController *)self updateFlowLayoutItemSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityItemEditorViewController;
  [(CNVisualIdentityItemEditorViewController *)&v5 viewDidAppear:a3];
  [(CNVisualIdentityItemEditorViewController *)self setCanBeginEditing:1];
  uint64_t v4 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  [(CNVisualIdentityItemEditorViewController *)self setUpFirstResponderForProviderItem:v4];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorViewController;
  [(CNVisualIdentityItemEditorViewController *)&v7 viewDidLoad];
  [(CNVisualIdentityItemEditorViewController *)self setupBarButtonItems];
  [(CNVisualIdentityItemEditorViewController *)self setupEditableAvatarViewController];
  [(CNVisualIdentityItemEditorViewController *)self setupSegmentedControl];
  objc_super v3 = [(CNVisualIdentityItemEditorViewController *)self providerItem];
  [(CNVisualIdentityItemEditorViewController *)self setupViewWithProviderItem:v3];

  uint64_t v4 = +[CNUIColorRepository visualIdentityEditorBackgroundColor];
  objc_super v5 = [(CNVisualIdentityItemEditorViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
}

- (CNVisualIdentityItemEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityItemEditorViewController;
  double v9 = [(CNVisualIdentityItemEditorViewController *)&v13 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    v10->_canCancel = 1;
    double v11 = v10;
  }

  return v10;
}

@end