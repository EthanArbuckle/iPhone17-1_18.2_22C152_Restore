@interface AVTAvatarLibraryViewController
- (AVTAvatarLibraryModel)model;
- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3;
- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3 environment:(id)a4;
- (AVTAvatarLibraryViewController)initWithModel:(id)a3 imageProvider:(id)a4 environment:(id)a5;
- (AVTAvatarLibraryViewControllerDelegate)delegate;
- (AVTUIEnvironment)environment;
- (BOOL)shouldUseLargeLayout;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (UICollectionView)collectionView;
- (UILongPressGestureRecognizer)longPressGesture;
- (_AVTAvatarRecordImageProvider)imageProvider;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didAddRecord:(id)a3;
- (void)didDeleteRecord:(id)a3;
- (void)didEditRecord:(id)a3;
- (void)didLongPress:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)didUpdateLibraryItems:(id)a3;
- (void)dismissController:(id)a3 completion:(id)a4;
- (void)insertItemsAtIndexes:(id)a3 deleteItemsAtIndexes:(id)a4 reloadItemsAtIndexes:(id)a5;
- (void)loadView;
- (void)presentUIViewController:(id)a3 forItem:(id)a4;
- (void)presetEditorViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateVisibleHeaders;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AVTAvatarLibraryViewController

- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3
{
  id v4 = a3;
  v5 = +[AVTUIEnvironment defaultEnvironment];
  v6 = [(AVTAvatarLibraryViewController *)self initWithAvatarStore:v4 environment:v5];

  return v6;
}

- (AVTAvatarLibraryViewController)initWithAvatarStore:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Store %@ isn't valid", v6 format];
  }
  id v8 = v6;
  v9 = [AVTViewSessionProvider alloc];
  +[AVTViewSessionProvider backingSizeForEnvironment:v7];
  double v11 = v10;
  double v13 = v12;
  v14 = +[AVTViewSessionProvider creatorForAVTView];
  v15 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v9, "initWithAVTViewBackingSize:viewCreator:environment:", v14, v7, v11, v13);

  v16 = [[AVTAvatarLibraryModel alloc] initWithAvatarStore:v8 avtViewSessionProvider:v15 environment:v7];
  v17 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v7];
  v18 = [(AVTAvatarLibraryViewController *)self initWithModel:v16 imageProvider:v17 environment:v7];

  return v18;
}

- (AVTAvatarLibraryViewController)initWithModel:(id)a3 imageProvider:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  double v11 = (AVTUIEnvironment *)a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarLibraryViewController;
  double v12 = [(AVTAvatarLibraryViewController *)&v15 initWithNibName:0 bundle:0];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageProvider, a4);
    objc_storeStrong((id *)&v13->_model, a3);
    v13->_environment = v11;
    [(AVTAvatarLibraryModel *)v13->_model setDelegate:v13];
    [(AVTAvatarLibraryModel *)v13->_model load];
  }

  return v13;
}

- (BOOL)shouldUseLargeLayout
{
  v3 = [(AVTAvatarLibraryViewController *)self environment];
  if ([v3 deviceIsPad])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(AVTAvatarLibraryViewController *)self environment];
    char v4 = [v5 deviceIsMac];
  }
  return v4;
}

- (void)loadView
{
  id v8 = objc_alloc_init(MEMORY[0x263F1C508]);
  [v8 setScrollDirection:0];
  objc_msgSend(v8, "setItemSize:", 102.0, 102.0);
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  char v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v8);

  [v8 setMinimumInteritemSpacing:14.0];
  [v8 setMinimumLineSpacing:14.0];
  if (![(AVTAvatarLibraryViewController *)self shouldUseLargeLayout]) {
    -[UICollectionView setContentInset:](v5, "setContentInset:", 40.0, 20.0, 0.0, 20.0);
  }
  [(UICollectionView *)v5 setAutoresizingMask:18];
  [(UICollectionView *)v5 setDelegate:self];
  [(UICollectionView *)v5 setDataSource:self];
  collectionView = self->_collectionView;
  self->_collectionView = v5;
  id v7 = v5;

  [(AVTAvatarLibraryViewController *)self setView:v7];
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)AVTAvatarLibraryViewController;
  [(AVTAvatarLibraryViewController *)&v23 viewDidLayoutSubviews];
  id v3 = [(AVTAvatarLibraryViewController *)self collectionView];
  char v4 = [v3 collectionViewLayout];

  if ([(AVTAvatarLibraryViewController *)self shouldUseLargeLayout])
  {
    [v4 minimumInteritemSpacing];
    double v6 = v5 + v5 + 459.0;
    id v7 = [(AVTAvatarLibraryViewController *)self collectionView];
    [v7 bounds];
    double v9 = (v8 - v6) * 0.5;

    id v10 = [(AVTAvatarLibraryViewController *)self collectionView];
    objc_msgSend(v10, "setContentInset:", 40.0, v9, 0.0, v9);

    double v11 = 153.0;
  }
  else
  {
    double v12 = [(AVTAvatarLibraryViewController *)self collectionView];
    [v12 bounds];
    double v14 = v13;
    objc_super v15 = [(AVTAvatarLibraryViewController *)self collectionView];
    [v15 contentInset];
    double v17 = v14 - v16;
    v18 = [(AVTAvatarLibraryViewController *)self collectionView];
    [v18 contentInset];
    double v20 = v17 - v19;
    [v4 minimumInteritemSpacing];
    double v22 = v20 + v21 * -2.0;

    double v11 = floor(v22 / 3.0);
  }
  objc_msgSend(v4, "setItemSize:", v11, v11);
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarLibraryViewController;
  [(AVTAvatarLibraryViewController *)&v19 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDoneButton_];
  char v4 = [(AVTAvatarLibraryViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  double v5 = [MEMORY[0x263F1C550] systemBackgroundColor];
  double v6 = [(AVTAvatarLibraryViewController *)self collectionView];
  [v6 setBackgroundColor:v5];

  id v7 = [(AVTAvatarLibraryViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  double v9 = +[AVTAvatarLibraryCollectionViewCell cellIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  id v10 = [(AVTAvatarLibraryViewController *)self collectionView];
  uint64_t v11 = objc_opt_class();
  double v12 = +[AVTAvatarLibraryCollectionViewAddCell cellIdentifier];
  [v10 registerClass:v11 forCellWithReuseIdentifier:v12];

  double v13 = [(AVTAvatarLibraryViewController *)self collectionView];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = *MEMORY[0x263F1D120];
  double v16 = +[AVTAvatarLibraryHeaderView reuseIdentifier];
  [v13 registerClass:v14 forSupplementaryViewOfKind:v15 withReuseIdentifier:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_didLongPress_];
  [v17 setDelaysTouchesBegan:1];
  v18 = [(AVTAvatarLibraryViewController *)self collectionView];
  [v18 addGestureRecognizer:v17];
}

- (void)didLongPress:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 1)
  {
    char v4 = [(AVTAvatarLibraryViewController *)self collectionView];
    [v12 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    double v9 = [(AVTAvatarLibraryViewController *)self collectionView];
    id v10 = objc_msgSend(v9, "indexPathForItemAtPoint:", v6, v8);

    uint64_t v11 = [(AVTAvatarLibraryViewController *)self model];
    objc_msgSend(v11, "performActionOnItemAtIndex:", objc_msgSend(v10, "item"));
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  char v4 = [(AVTAvatarLibraryViewController *)self model];
  double v5 = [v4 libraryItems];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AVTAvatarLibraryViewController *)self model];
  double v9 = [v8 libraryItems];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  uint64_t v11 = [(id)objc_opt_class() cellIdentifier];
  id v12 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

  double v13 = [(AVTAvatarLibraryViewController *)self imageProvider];
  [v10 configureCell:v12 imageProvider:v13];

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = *MEMORY[0x263F1D120];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (([v10 isEqual:v8] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Only registered for headers!"];
  }
  id v12 = +[AVTAvatarLibraryHeaderView reuseIdentifier];
  double v13 = [v11 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v12 forIndexPath:v9];

  uint64_t v14 = [(AVTAvatarLibraryViewController *)self model];
  updateCountLabel(v13, v14);

  return v13;
}

- (void)updateVisibleHeaders
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(AVTAvatarLibraryViewController *)self collectionView];
  uint64_t v4 = *MEMORY[0x263F1D120];
  double v5 = [v3 visibleSupplementaryViewsOfKind:*MEMORY[0x263F1D120]];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = [(AVTAvatarLibraryViewController *)self collectionView];
        id v12 = [v11 supplementaryViewForElementKind:v4 atIndexPath:v10];

        double v13 = [(AVTAvatarLibraryViewController *)self model];
        updateCountLabel(v12, v13);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = 25.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(AVTAvatarLibraryViewController *)self model];
  uint64_t v6 = [v5 item];

  [v7 performActionOnItemAtIndex:v6];
}

- (void)didTapDoneButton:(id)a3
{
  uint64_t v4 = [(AVTAvatarLibraryViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTAvatarLibraryViewController *)self delegate];
    [v6 avatarLibraryControllerDidFinish:self];
  }
}

- (void)didAddRecord:(id)a3
{
  id v7 = a3;
  [(AVTAvatarLibraryViewController *)self updateVisibleHeaders];
  uint64_t v4 = [(AVTAvatarLibraryViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTAvatarLibraryViewController *)self delegate];
    [v6 avatarLibraryController:self didChange:0 avatar:v7];
  }
}

- (void)didDeleteRecord:(id)a3
{
  id v7 = a3;
  [(AVTAvatarLibraryViewController *)self updateVisibleHeaders];
  uint64_t v4 = [(AVTAvatarLibraryViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTAvatarLibraryViewController *)self delegate];
    [v6 avatarLibraryController:self didChange:1 avatar:v7];
  }
}

- (void)didEditRecord:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(AVTAvatarLibraryViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVTAvatarLibraryViewController *)self delegate];
    [v6 avatarLibraryController:self didChange:2 avatar:v7];
  }
}

- (void)didUpdateLibraryItems:(id)a3
{
  id v3 = [(AVTAvatarLibraryViewController *)self collectionView];
  [v3 reloadData];
}

- (void)presetEditorViewController:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F1C7F8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];

  [(AVTAvatarLibraryViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)presentUIViewController:(id)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTAvatarLibraryViewController *)self model];
  uint64_t v9 = [v8 libraryItems];
  uint64_t v10 = [v9 indexOfObject:v6];

  id v11 = [(AVTAvatarLibraryViewController *)self collectionView];
  id v12 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:0];
  id v23 = [v11 cellForItemAtIndexPath:v12];

  double v13 = [v7 popoverPresentationController];
  [v13 setSourceView:v23];

  [v23 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [v7 popoverPresentationController];
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  [(AVTAvatarLibraryViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)dismissController:(id)a3 completion:(id)a4
{
}

- (void)insertItemsAtIndexes:(id)a3 deleteItemsAtIndexes:(id)a4 reloadItemsAtIndexes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(AVTAvatarLibraryViewController *)self collectionView];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__AVTAvatarLibraryViewController_insertItemsAtIndexes_deleteItemsAtIndexes_reloadItemsAtIndexes___block_invoke;
  v15[3] = &unk_263FF1A80;
  id v16 = v8;
  double v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBatchUpdates:v15 completion:0];
}

void __97__AVTAvatarLibraryViewController_insertItemsAtIndexes_deleteItemsAtIndexes_reloadItemsAtIndexes___block_invoke(void **a1)
{
  if (a1[4])
  {
    v2 = [a1[5] collectionView];
    id v3 = (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[4]);
    [v2 insertItemsAtIndexPaths:v3];
  }
  if (a1[6])
  {
    uint64_t v4 = [a1[5] collectionView];
    id v5 = (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[6]);
    [v4 deleteItemsAtIndexPaths:v5];
  }
  if (a1[7])
  {
    id v7 = [a1[5] collectionView];
    id v6 = (*((void (**)(uint64_t, void *))sIndexSetToIndexPaths + 2))((uint64_t)sIndexSetToIndexPaths, a1[7]);
    [v7 reloadItemsAtIndexPaths:v6];
  }
}

- (AVTAvatarLibraryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarLibraryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (AVTAvatarLibraryModel)model
{
  return self->_model;
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end