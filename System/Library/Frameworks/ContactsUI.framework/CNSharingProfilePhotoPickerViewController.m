@interface CNSharingProfilePhotoPickerViewController
- (AVTAvatarRecord)avatarRecord;
- (BOOL)isSmallScreenDevice;
- (CNContact)contact;
- (CNPhotoPickerColorVariant)animojiBackgroundColor;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNSharingProfileAvatarItemProvider)itemProvider;
- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration;
- (CNSharingProfileLogger)logger;
- (CNSharingProfilePhotoPickerItem)selectedItem;
- (CNSharingProfilePhotoPickerViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5 logger:(id)a6;
- (CNSharingProfilePhotoPickerViewControllerDelegate)delegate;
- (NSArray)items;
- (NSData)memojiMetadata;
- (PRMonogramColor)monogramBackgroundColor;
- (PRMonogramColor)monogramColor;
- (UIButton)customizeButton;
- (UICollectionView)selectorView;
- (UICollectionViewFlowLayout)selectorLayout;
- (UIImageView)previewView;
- (double)previewEdgeSize;
- (double)previewToSelectorSpacing;
- (id)buildItems;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didSelectCustomizeButton:(id)a3;
- (void)reloadData;
- (void)reloadItems;
- (void)setAnimojiBackgroundColor:(id)a3;
- (void)setAvatarItemProviderConfiguration:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setContact:(id)a3;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSmallScreenDevice:(BOOL)a3;
- (void)setItemProvider:(id)a3;
- (void)setItems:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setMonogramBackgroundColor:(id)a3;
- (void)setMonogramColor:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setSelectorLayout:(id)a3;
- (void)setSelectorView:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)setupConstraints;
- (void)updateInteritemSpacing;
- (void)updatePreviewForSelectedItem;
- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNSharingProfilePhotoPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramBackgroundColor, 0);
  objc_storeStrong((id *)&self->_animojiBackgroundColor, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_selectorView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_selectorLayout, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMonogramBackgroundColor:(id)a3
{
}

- (PRMonogramColor)monogramBackgroundColor
{
  return self->_monogramBackgroundColor;
}

- (void)setAnimojiBackgroundColor:(id)a3
{
}

- (CNPhotoPickerColorVariant)animojiBackgroundColor
{
  return self->_animojiBackgroundColor;
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setCustomizeButton:(id)a3
{
}

- (UIButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItemProvider:(id)a3
{
}

- (CNSharingProfileAvatarItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setSelectorView:(id)a3
{
}

- (UICollectionView)selectorView
{
  return self->_selectorView;
}

- (void)setPreviewView:(id)a3
{
}

- (UIImageView)previewView
{
  return self->_previewView;
}

- (void)setSelectorLayout:(id)a3
{
}

- (UICollectionViewFlowLayout)selectorLayout
{
  return self->_selectorLayout;
}

- (void)setLogger:(id)a3
{
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setIsSmallScreenDevice:(BOOL)a3
{
  self->_isSmallScreenDevice = a3;
}

- (BOOL)isSmallScreenDevice
{
  return self->_isSmallScreenDevice;
}

- (void)setSelectedItem:(id)a3
{
}

- (CNSharingProfilePhotoPickerItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharingProfilePhotoPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharingProfilePhotoPickerViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a3;
  v6 = [v15 cellForItemAtIndexPath:a4];
  v7 = [v6 pickerItem];
  v8 = [v7 avatarItem];

  if (v8)
  {
    v9 = [v6 pickerItem];
    selectedItem = self->_selectedItem;
    self->_selectedItem = v9;

    [(CNSharingProfilePhotoPickerViewController *)self updatePreviewForSelectedItem];
  }
  else
  {
    v11 = [(CNSharingProfilePhotoPickerViewController *)self delegate];
    [v11 sharingPhotoPickerDidSelectAddItem:self];

    NSUInteger v12 = [(NSArray *)self->_items indexOfObject:self->_selectedItem];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v13 = 0;
    }
    else {
      NSUInteger v13 = v12;
    }
    v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
    [v15 selectItemAtIndexPath:v14 animated:0 scrollPosition:0];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CNSharingProfilePhotoPickerItemCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [(NSArray *)self->_items count];
  if (v10 > [v6 item])
  {
    v11 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v6 item]);
    [v9 setIsSmallScreen:self->_isSmallScreenDevice];
    [v9 setPickerItem:v11];
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_items count];
}

- (void)didSelectCustomizeButton:(id)a3
{
  id v4 = [(CNSharingProfilePhotoPickerViewController *)self delegate];
  [v4 sharingPhotoPickerDidSelectAddItem:self];
}

- (NSData)memojiMetadata
{
  return [(CNSharingProfileAvatarItemProvider *)self->_itemProvider memojiMetadata];
}

- (void)setMemojiMetadata:(id)a3
{
}

- (PRMonogramColor)monogramColor
{
  return [(CNSharingProfileAvatarItemProvider *)self->_itemProvider monogramColor];
}

- (void)setMonogramColor:(id)a3
{
}

- (void)updatePreviewForSelectedItem
{
  v3 = [(CNSharingProfilePhotoPickerItem *)self->_selectedItem avatarItem];

  if (v3)
  {
    uint64_t v4 = [(CNSharingProfilePhotoPickerItem *)self->_selectedItem cachedPreviewImage];
    if (v4)
    {
      id v5 = (id)v4;
    }
    else
    {
      selectedItem = self->_selectedItem;
      [(UIImageView *)self->_previewView bounds];
      -[CNSharingProfilePhotoPickerItem compositeImageWithSize:](selectedItem, "compositeImageWithSize:", v7, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(CNSharingProfilePhotoPickerItem *)self->_selectedItem setCachedPreviewImage:v9];
      id v5 = v9;
    }
    id v10 = v5;
    [(UIImageView *)self->_previewView setImage:v5];
  }
}

- (void)updateWithContact:(id)a3 fromFullPhotoPicker:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CNSharingProfileAvatarItemProvider *)self->_itemProvider updateWithContact:v6 fromFullPhotoPicker:v4];
  [(CNSharingProfilePhotoPickerViewController *)self reloadItems];
  double v7 = [(CNSharingProfilePhotoPickerViewController *)self view];
  [v7 setNeedsLayout];

  if ([v6 imageDataAvailable])
  {
    uint64_t v8 = [v6 rawImageType];
    if (v8 == 1 || v8 == 4)
    {
      id v9 = [(CNSharingProfileAvatarItemProvider *)self->_itemProvider photoItem];
      if (!v9) {
        goto LABEL_13;
      }
    }
    else if (v8 == 2)
    {
      id v9 = [(CNSharingProfileAvatarItemProvider *)self->_itemProvider monogramItem];
      if (!v9) {
        goto LABEL_13;
      }
    }
    else
    {
      id v9 = [(CNSharingProfileAvatarItemProvider *)self->_itemProvider animojiItem];
      if (!v9) {
        goto LABEL_13;
      }
    }
    items = self->_items;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__CNSharingProfilePhotoPickerViewController_updateWithContact_fromFullPhotoPicker___block_invoke;
    v18[3] = &unk_1E5497258;
    id v11 = v9;
    id v19 = v11;
    uint64_t v12 = [(NSArray *)items _cn_indexOfFirstObjectPassingTest:v18];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = v12;
      v14 = [(NSArray *)self->_items objectAtIndexedSubscript:v12];
      selectedItem = self->_selectedItem;
      self->_selectedItem = v14;

      selectorView = self->_selectorView;
      v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
      [(UICollectionView *)selectorView selectItemAtIndexPath:v17 animated:0 scrollPosition:0];

      [(CNSharingProfilePhotoPickerViewController *)self updatePreviewForSelectedItem];
    }
  }
LABEL_13:
}

BOOL __83__CNSharingProfilePhotoPickerViewController_updateWithContact_fromFullPhotoPicker___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 avatarItem];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)buildItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(CNSharingProfileAvatarItemProvider *)self->_itemProvider avatarItems];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count") + 1);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_alloc_init(CNSharingProfilePhotoPickerItem);
        -[CNSharingProfilePhotoPickerItem setAvatarItem:](v10, "setAvatarItem:", v9, (void)v14);
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v11 = objc_alloc_init(CNSharingProfilePhotoPickerItem);
  [(CNSharingProfilePhotoPickerItem *)v11 setSymbolImageName:@"ellipsis"];
  [v3 addObject:v11];
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (void)reloadItems
{
  v3 = [(CNSharingProfilePhotoPickerViewController *)self buildItems];
  items = self->_items;
  self->_items = v3;

  selectorView = self->_selectorView;

  [(UICollectionView *)selectorView reloadData];
}

- (double)previewEdgeSize
{
  double result = 160.0;
  if (!self->_isSmallScreenDevice) {
    return 200.0;
  }
  return result;
}

- (void)reloadData
{
  id v4 = [(UICollectionView *)self->_selectorView indexPathsForSelectedItems];
  if ([v4 count])
  {
    v3 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    v3 = 0;
  }
  [(CNSharingProfileAvatarItemProvider *)self->_itemProvider clearCachedItems];
  [(CNSharingProfilePhotoPickerViewController *)self reloadItems];
  [(CNSharingProfilePhotoPickerViewController *)self updateInteritemSpacing];
  if (v3) {
    [(UICollectionView *)self->_selectorView selectItemAtIndexPath:v3 animated:0 scrollPosition:0];
  }
}

- (void)updateInteritemSpacing
{
  if ([(NSArray *)self->_items count])
  {
    if ([(NSArray *)self->_items count] > 3)
    {
      double v4 = (double)[(NSArray *)self->_items count];
      [(UICollectionViewFlowLayout *)self->_selectorLayout itemSize];
      double v6 = v5 * v4;
      uint64_t v7 = [(CNSharingProfilePhotoPickerViewController *)self view];
      [v7 bounds];
      CGFloat v8 = CGRectGetWidth(v11) - v6;

      double v3 = floor(v8 / (double)[(NSArray *)self->_items count]);
      if (v3 < 0.0) {
        double v3 = 0.0;
      }
    }
    else
    {
      double v3 = 13.0;
    }
    [(UICollectionViewFlowLayout *)self->_selectorLayout setMinimumLineSpacing:v3];
    selectorLayout = self->_selectorLayout;
    [(UICollectionViewFlowLayout *)selectorLayout invalidateLayout];
  }
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  [(CNSharingProfilePhotoPickerViewController *)&v16 viewDidLayoutSubviews];
  if ([(NSArray *)self->_items count])
  {
    [(CNSharingProfilePhotoPickerViewController *)self updateInteritemSpacing];
    double v3 = (double)[(NSArray *)self->_items count];
    [(UICollectionViewFlowLayout *)self->_selectorLayout itemSize];
    double v5 = v4;
    [(UICollectionViewFlowLayout *)self->_selectorLayout minimumLineSpacing];
    double v7 = v6 * (double)([(NSArray *)self->_items count] - 1) + v3 * v5;
    CGFloat v8 = [(CNSharingProfilePhotoPickerViewController *)self view];
    [v8 bounds];
    CGFloat v9 = CGRectGetWidth(v17) - v7;

    double v10 = floor(v9 * 0.5);
    if (v10 >= 0.0) {
      double v11 = v10;
    }
    else {
      double v11 = 0.0;
    }
    [(UICollectionView *)self->_selectorView contentInset];
    if (v15 != v11 || v12 != 0.0 || v14 != 0.0 || v13 != 0.0) {
      -[UICollectionView setContentInset:](self->_selectorView, "setContentInset:", 0.0, v11, 0.0, 0.0);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  [(CNSharingProfilePhotoPickerViewController *)&v10 viewWillAppear:a3];
  double v4 = [(CNSharingProfilePhotoPickerViewController *)self view];
  [v4 layoutIfNeeded];

  [(CNSharingProfilePhotoPickerViewController *)self updatePreviewForSelectedItem];
  if ([(NSArray *)self->_items count])
  {
    int64_t v5 = [(NSArray *)self->_items indexOfObject:self->_selectedItem];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v6 = v5;
      if (v5 < (int64_t)[(NSArray *)self->_items count])
      {
        selectorView = self->_selectorView;
        CGFloat v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
        [(UICollectionView *)selectorView selectItemAtIndexPath:v8 animated:0 scrollPosition:0];

        [(UICollectionView *)self->_selectorView contentInset];
        -[UICollectionView setContentOffset:](self->_selectorView, "setContentOffset:", -v9, 0.0);
      }
    }
  }
}

- (double)previewToSelectorSpacing
{
  return 36.0;
}

- (void)setupConstraints
{
  id v33 = [MEMORY[0x1E4F1CA48] array];
  double v3 = [(UIImageView *)self->_previewView widthAnchor];
  [(CNSharingProfilePhotoPickerViewController *)self previewEdgeSize];
  double v4 = objc_msgSend(v3, "constraintEqualToConstant:");
  [v33 addObject:v4];

  int64_t v5 = [(UIImageView *)self->_previewView widthAnchor];
  int64_t v6 = [(UIImageView *)self->_previewView heightAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v33 addObject:v7];

  CGFloat v8 = [(UIImageView *)self->_previewView centerXAnchor];
  double v9 = [(CNSharingProfilePhotoPickerViewController *)self view];
  objc_super v10 = [v9 centerXAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  [v33 addObject:v11];

  double v12 = [(UIImageView *)self->_previewView topAnchor];
  double v13 = [(CNSharingProfilePhotoPickerViewController *)self view];
  double v14 = [v13 topAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14 constant:28.0];
  [v33 addObject:v15];

  objc_super v16 = [(UICollectionView *)self->_selectorView leadingAnchor];
  CGRect v17 = [(CNSharingProfilePhotoPickerViewController *)self view];
  v18 = [v17 leadingAnchor];
  uint64_t v19 = [v16 constraintEqualToAnchor:v18];
  [v33 addObject:v19];

  v20 = [(UICollectionView *)self->_selectorView trailingAnchor];
  v21 = [(CNSharingProfilePhotoPickerViewController *)self view];
  v22 = [v21 trailingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v33 addObject:v23];

  v24 = [(UICollectionView *)self->_selectorView topAnchor];
  v25 = [(UIImageView *)self->_previewView bottomAnchor];
  [(CNSharingProfilePhotoPickerViewController *)self previewToSelectorSpacing];
  v26 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
  [v33 addObject:v26];

  v27 = [(UICollectionView *)self->_selectorView heightAnchor];
  v28 = [v27 constraintEqualToConstant:100.0];
  [v33 addObject:v28];

  v29 = [(UICollectionView *)self->_selectorView bottomAnchor];
  v30 = [(CNSharingProfilePhotoPickerViewController *)self view];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v33 addObject:v32];

  [MEMORY[0x1E4F28DC8] activateConstraints:v33];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  [(CNSharingProfilePhotoPickerViewController *)&v30 viewDidLoad];
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;

  self->_isSmallScreenDevice = v5 <= 568.0;
  id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v11 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  previewView = self->_previewView;
  self->_previewView = v11;

  [(UIImageView *)self->_previewView setContentMode:1];
  [(UIImageView *)self->_previewView setClipsToBounds:1];
  [(UIImageView *)self->_previewView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNSharingProfilePhotoPickerViewController *)self previewEdgeSize];
  double v14 = floor(v13 * 0.5);
  double v15 = [(UIImageView *)self->_previewView layer];
  [v15 setCornerRadius:v14];

  objc_super v16 = [(CNSharingProfilePhotoPickerViewController *)self view];
  [v16 addSubview:self->_previewView];

  CGRect v17 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
  selectorLayout = self->_selectorLayout;
  self->_selectorLayout = v17;

  [(UICollectionViewFlowLayout *)self->_selectorLayout setScrollDirection:1];
  -[UICollectionViewFlowLayout setItemSize:](self->_selectorLayout, "setItemSize:", dbl_18B9C3720[!self->_isSmallScreenDevice], dbl_18B9C3720[!self->_isSmallScreenDevice]);
  [(UICollectionViewFlowLayout *)self->_selectorLayout setMinimumInteritemSpacing:0.0];
  [(UICollectionViewFlowLayout *)self->_selectorLayout setMinimumLineSpacing:0.0];
  uint64_t v19 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", self->_selectorLayout, v7, v8, v9, v10);
  selectorView = self->_selectorView;
  self->_selectorView = v19;

  v21 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_selectorView setBackgroundColor:v21];

  [(UICollectionView *)self->_selectorView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_selectorView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_selectorView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_selectorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_selectorView setDataSource:self];
  [(UICollectionView *)self->_selectorView setDelegate:self];
  v22 = [(CNSharingProfilePhotoPickerViewController *)self view];
  [v22 addSubview:self->_selectorView];

  v23 = self->_selectorView;
  uint64_t v24 = objc_opt_class();
  v25 = +[CNSharingProfilePhotoPickerItemCell reuseIdentifier];
  [(UICollectionView *)v23 registerClass:v24 forCellWithReuseIdentifier:v25];

  v26 = [[CNSharingProfileAvatarItemProvider alloc] initWithContact:self->_contact avatarRecord:self->_avatarRecord logger:0];
  itemProvider = self->_itemProvider;
  self->_itemProvider = v26;

  [(CNSharingProfileAvatarItemProvider *)self->_itemProvider setConfiguration:self->_avatarItemProviderConfiguration];
  [(CNSharingProfilePhotoPickerViewController *)self reloadItems];
  [(CNSharingProfilePhotoPickerViewController *)self updateInteritemSpacing];
  if ([(NSArray *)self->_items count])
  {
    v28 = [(NSArray *)self->_items objectAtIndexedSubscript:0];
    selectedItem = self->_selectedItem;
    self->_selectedItem = v28;
  }
  [(CNSharingProfilePhotoPickerViewController *)self setupConstraints];
}

- (CNSharingProfilePhotoPickerViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5 logger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNSharingProfilePhotoPickerViewController;
  double v15 = [(CNSharingProfilePhotoPickerViewController *)&v19 initWithNibName:0 bundle:0];
  objc_super v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contact, a3);
    objc_storeStrong((id *)&v16->_avatarRecord, a4);
    objc_storeStrong((id *)&v16->_avatarItemProviderConfiguration, a5);
    objc_storeStrong((id *)&v16->_logger, a6);
    CGRect v17 = v16;
  }

  return v16;
}

@end