@interface CNVisualIdentityAvatarStyleEditorViewController
- (BOOL)editableAvatarViewControllerShouldBecomeFirstResponder:(id)a3;
- (BOOL)isEmojiProviderItemType;
- (BOOL)shouldBeginEditing;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CNPhotoPickerProviderItem)providerItem;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentityAvatarStyleEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4;
- (CNVisualIdentityAvatarStyleEditorViewControllerDelegate)delegate;
- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController;
- (NSArray)variantProviderItems;
- (NSLayoutConstraint)avatarViewSizeConstraint;
- (NSLayoutConstraint)avatarViewTopConstraint;
- (UICollectionView)styleCollectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)calculateSectionSideInset;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)updatedProviderItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)beginEditingAvatar;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapEditableAvatar:(id)a3;
- (void)dismissEmojiKeyboardIfNeeded;
- (void)dismissTextKeyboardIfNeeded;
- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4;
- (void)generateProviderItems;
- (void)setAvatarViewSizeConstraint:(id)a3;
- (void)setAvatarViewTopConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyleCollectionView:(id)a3;
- (void)setVariantProviderItems:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)setupEditableAvatarViewController;
- (void)setupStyleCollectionView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNVisualIdentityAvatarStyleEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantProviderItems, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_avatarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewSizeConstraint, 0);
  objc_storeStrong((id *)&self->_styleCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editableAvatarViewController, 0);

  objc_storeStrong((id *)&self->_providerItem, 0);
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

- (void)setStyleCollectionView:(id)a3
{
}

- (UICollectionView)styleCollectionView
{
  return self->_styleCollectionView;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityAvatarStyleEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityAvatarStyleEditorViewControllerDelegate *)WeakRetained;
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController
{
  return self->_editableAvatarViewController;
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (BOOL)editableAvatarViewControllerShouldBecomeFirstResponder:(id)a3
{
  v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  v5 = [v4 window];
  if (v5)
  {
    v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
    BOOL v7 = ([v6 isHidden] & 1) == 0
      && [(CNVisualIdentityAvatarStyleEditorViewController *)self shouldBeginEditing];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  id v10 = a4;
  if ([v10 conformsToProtocol:&unk_1ED9A0450]) {
    v5 = v10;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    BOOL v7 = (CNPhotoPickerProviderItem *)[v10 copy];
    providerItem = self->_providerItem;
    self->_providerItem = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained avatarStyleEditor:self didUpdateItem:self->_providerItem];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v16 = self->_providerItem;
  id v6 = a4;
  BOOL v7 = [(CNVisualIdentityAvatarStyleEditorViewController *)self variantProviderItems];
  uint64_t v8 = [v6 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  id v10 = (CNPhotoPickerProviderItem *)[v9 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(CNPhotoPickerProviderItem *)v16 monogramText];
      [(CNPhotoPickerProviderItem *)v10 setMonogramText:v11];
LABEL_7:

      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(CNPhotoPickerProviderItem *)v16 stringRepresentation];
      uint64_t v12 = [(CNPhotoPickerProviderItem *)v10 copyWithStringRepresentation:v11];

      id v10 = (CNPhotoPickerProviderItem *)v12;
      goto LABEL_7;
    }
  }
LABEL_8:
  providerItem = self->_providerItem;
  self->_providerItem = v10;

  v14 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v15 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  [v14 updateWithProviderItem:v15];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if (a5)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    BOOL v7 = CNContactsUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
    +[CNVisualIdentityAvatarStyleSectionHeaderView sizeWithText:v8];
    double v5 = v9;
    double v6 = v10;
  }
  double v11 = v5;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
  double v10 = +[CNVisualIdentityAvatarStyleSectionHeaderView reuseID];
  double v11 = [v9 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v10 forIndexPath:v7];

  double v12 = CNContactsUIBundle();
  v13 = [v12 localizedStringForKey:@"PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v14 = [v11 label];
  [v14 setText:v13];

  [(CNVisualIdentityAvatarStyleEditorViewController *)self calculateSectionSideInset];
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 0.0, v15 + 24.0, 0.0, 0.0);

  return v11;
}

- (double)calculateSectionSideInset
{
  v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
  v4 = [v3 collectionViewLayout];

  objc_msgSend(v4, "setItemSize:", 86.0, 86.0);
  [v4 itemSize];
  double v6 = v5 * 4.0 + 48.0;
  id v7 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
  [v7 frame];
  double v9 = (v8 - v6) * 0.5;

  return v9;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(CNVisualIdentityAvatarStyleEditorViewController *)self calculateSectionSideInset];
  double v6 = v5;
  double v7 = 12.0;
  double v8 = 24.0;
  double v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v6;
  result.top = v7;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
  double v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  id v12 = v11;

  [v12 setCellStyle:1];
  if (v12)
  {
    v13 = [(CNVisualIdentityAvatarStyleEditorViewController *)self variantProviderItems];
    v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__CNVisualIdentityAvatarStyleEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
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

uint64_t __89__CNVisualIdentityAvatarStyleEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateWithView:a2 animation:1];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 86.0;
  double v6 = 86.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self variantProviderItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (BOOL)isEmojiProviderItemType
{
  v2 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  BOOL v3 = [v2 imageType] == 4;

  return v3;
}

- (BOOL)shouldBeginEditing
{
  BOOL v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  objc_opt_class();
  int64_t v5 = [(CNVisualIdentityAvatarStyleEditorViewController *)self navigationController];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 isDisplayingTrapView];
  return v8 ^ 1;
}

- (void)beginEditingAvatar
{
  if ([(CNVisualIdentityAvatarStyleEditorViewController *)self shouldBeginEditing])
  {
    id v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    [v3 beginEditing];
  }
}

- (void)dismissEmojiKeyboardIfNeeded
{
  id v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v4 = [v3 currentInputMode];
  id v6 = [v4 normalizedIdentifier];

  if ([v6 isEqualToString:*MEMORY[0x1E4FB2BF0]])
  {
    int64_t v5 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    [v5 endEditing];
  }
}

- (void)dismissTextKeyboardIfNeeded
{
  id v3 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v4 = [v3 currentInputMode];
  id v6 = [v4 normalizedIdentifier];

  if (([v6 isEqualToString:*MEMORY[0x1E4FB2BF0]] & 1) == 0)
  {
    int64_t v5 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    [v5 endEditing];
  }
}

- (void)didTapEditableAvatar:(id)a3
{
  if ([(CNVisualIdentityAvatarStyleEditorViewController *)self isEmojiProviderItemType]) {
    [(CNVisualIdentityAvatarStyleEditorViewController *)self dismissTextKeyboardIfNeeded];
  }
  else {
    [(CNVisualIdentityAvatarStyleEditorViewController *)self dismissEmojiKeyboardIfNeeded];
  }

  [(CNVisualIdentityAvatarStyleEditorViewController *)self beginEditingAvatar];
}

- (id)updatedProviderItem
{
  id v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  if ([v3 conformsToProtocol:&unk_1ED9A0450]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    id v7 = [v6 text];
    char v8 = [v5 updatedProviderItemWithText:v7];
  }
  else
  {
    id v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
    char v8 = (void *)[v6 copy];
  }

  return v8;
}

- (void)generateProviderItems
{
  id v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  [v3 conformsToProtocol:&unk_1ED9A0450];

  id v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[v9 copy];
    [v4 setMonogramText:&stru_1ED8AC728];
    id v5 = [v4 visualIdentity];
    [v5 setAbbreviatedName:@" "];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v4 = (void *)[v9 copyWithStringRepresentation:&stru_1ED8AC728];
  }

  id v9 = v4;
LABEL_6:
  id v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self variantsManager];
  id v7 = [v9 createVariantsItemsWithVariantsManager:v6];

  [(CNVisualIdentityAvatarStyleEditorViewController *)self setVariantProviderItems:v7];
  char v8 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
  [v8 reloadData];
}

- (void)setupStyleCollectionView
{
  v46[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
    [v4 setMinimumLineSpacing:16.0];
    v45 = v4;
    [v4 setScrollDirection:0];
    id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
    id v6 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNVisualIdentityAvatarStyleEditorViewController *)self setStyleCollectionView:v6];

    id v7 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    char v8 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v8 setDelegate:self];

    id v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v9 setDataSource:self];

    id v10 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    uint64_t v11 = objc_opt_class();
    id v12 = +[CNPhotoPickerCollectionViewCell cellIdentifier];
    [v10 registerClass:v11 forCellWithReuseIdentifier:v12];

    v13 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = *MEMORY[0x1E4FB2770];
    id v16 = +[CNVisualIdentityAvatarStyleSectionHeaderView reuseID];
    [v13 registerClass:v14 forSupplementaryViewOfKind:v15 withReuseIdentifier:v16];

    id v17 = [MEMORY[0x1E4FB1618] clearColor];
    v18 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v18 setBackgroundColor:v17];

    v19 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v19 setAlwaysBounceVertical:1];

    id v20 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v20 setContentInsetAdjustmentBehavior:2];

    v21 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
    v22 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    [v21 addSubview:v22];

    v44 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    v41 = [v44 topAnchor];
    v43 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    v42 = [v43 view];
    v40 = [v42 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:24.0];
    v46[0] = v39;
    v38 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    v36 = [v38 leadingAnchor];
    v37 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
    v35 = [v37 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:20.0];
    v46[1] = v34;
    v33 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    v23 = [v33 trailingAnchor];
    v24 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
    v25 = [v24 trailingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:-20.0];
    v46[2] = v26;
    v27 = [(CNVisualIdentityAvatarStyleEditorViewController *)self styleCollectionView];
    v28 = [v27 bottomAnchor];
    v29 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v46[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v32];
    [(CNVisualIdentityAvatarStyleEditorViewController *)self generateProviderItems];
  }
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  [v3 frame];
  double v5 = v4;
  id v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  [v6 frame];
  double v8 = v5 + v7;

  id v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)self avatarViewSizeConstraint];
  id v10 = v9;
  if (v8 >= 490.0)
  {
    [v9 setConstant:240.0];

    uint64_t v11 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    id v12 = v11;
    double v13 = 110.0;
  }
  else
  {
    [v9 setConstant:200.0];

    uint64_t v11 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
    id v12 = v11;
    double v13 = 90.0;
  }
  [v11 setDesiredFontSize:v13];

  uint64_t v14 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  [v14 updateTextFieldFontSize:v13];

  uint64_t v15 = [(CNVisualIdentityAvatarStyleEditorViewController *)self avatarViewSizeConstraint];
  [v15 setActive:1];

  v16.receiver = self;
  v16.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  [(CNVisualIdentityAvatarStyleEditorViewController *)&v16 viewDidLayoutSubviews];
}

- (void)setupEditableAvatarViewController
{
  v46[4] = *MEMORY[0x1E4F143B8];
  id v3 = [CNVisualIdentityEditablePrimaryAvatarViewController alloc];
  double v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self providerItem];
  double v5 = [(CNVisualIdentityAvatarStyleEditorViewController *)self variantsManager];
  id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)v3 initWithProviderItem:v4 variantsManager:v5];
  editableAvatarViewController = self->_editableAvatarViewController;
  self->_editableAvatarViewController = v6;

  double v8 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  [v8 setDelegate:self];

  id v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  [v9 setDesiredFontSize:110.0];

  id v10 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  uint64_t v11 = [v10 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  [(CNVisualIdentityAvatarStyleEditorViewController *)self addChildViewController:v12];

  double v13 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  uint64_t v14 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  uint64_t v15 = [v14 view];
  [v13 addSubview:v15];

  objc_super v16 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  [v16 didMoveToParentViewController:self];

  id v17 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v18 = [v17 view];
  v19 = [v18 widthAnchor];
  id v20 = [v19 constraintEqualToConstant:240.0];
  [(CNVisualIdentityAvatarStyleEditorViewController *)self setAvatarViewSizeConstraint:v20];

  v21 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v22 = [v21 view];
  v23 = [v22 topAnchor];
  v24 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:24.0];
  [(CNVisualIdentityAvatarStyleEditorViewController *)self setAvatarViewTopConstraint:v26];

  v45 = [(CNVisualIdentityAvatarStyleEditorViewController *)self avatarViewSizeConstraint];
  v46[0] = v45;
  v44 = [(CNVisualIdentityAvatarStyleEditorViewController *)self avatarViewTopConstraint];
  v46[1] = v44;
  v43 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v42 = [v43 view];
  v40 = [v42 heightAnchor];
  v41 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v27 = [v41 view];
  v28 = [v27 widthAnchor];
  v29 = [v40 constraintEqualToAnchor:v28];
  v46[2] = v29;
  v30 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v31 = [v30 view];
  v32 = [v31 centerXAnchor];
  v33 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  v34 = [v33 centerXAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v46[3] = v35;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v39];
  v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapEditableAvatar_];
  v37 = [(CNVisualIdentityAvatarStyleEditorViewController *)self editableAvatarViewController];
  v38 = [v37 view];
  [v38 addGestureRecognizer:v36];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  [(CNVisualIdentityAvatarStyleEditorViewController *)&v5 viewDidLoad];
  [(CNVisualIdentityAvatarStyleEditorViewController *)self setupEditableAvatarViewController];
  [(CNVisualIdentityAvatarStyleEditorViewController *)self setupStyleCollectionView];
  id v3 = +[CNUIColorRepository visualIdentityEditorBackgroundColor];
  double v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (CNVisualIdentityAvatarStyleEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  id v9 = [(CNVisualIdentityAvatarStyleEditorViewController *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

@end