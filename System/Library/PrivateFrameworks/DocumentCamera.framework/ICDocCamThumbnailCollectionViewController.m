@interface ICDocCamThumbnailCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isPerformingBatchUpdates;
- (BOOL)needReloadAfterBatchUpdates;
- (BOOL)shouldAutorotate;
- (CGRect)targetViewRect;
- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4;
- (ICDocCamImageCache)imageCache;
- (ICDocCamThumbnailCollectionViewController)initWithDelegate:(id)a3;
- (ICDocCamThumbnailCollectionViewLayout)layout;
- (ICDocCamThumbnailViewDelegate)delegate;
- (NSMutableArray)documentInfoArray;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)rootView;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)addNewDocument:(id)a3 completionBlock:(id)a4;
- (void)animateLayoutChange;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)reloadDataForCollectionView;
- (void)setDelegate:(id)a3;
- (void)setDocumentInfoArray:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setImageWithUUID:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5;
- (void)setIsPerformingBatchUpdates:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setNeedReloadAfterBatchUpdates:(BOOL)a3;
- (void)update;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICDocCamThumbnailCollectionViewController

- (ICDocCamThumbnailCollectionViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  v14.receiver = self;
  v14.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  v6 = [(ICDocCamThumbnailCollectionViewController *)&v14 initWithCollectionViewLayout:v5];
  v7 = v6;
  if (v6)
  {
    [(ICDocCamThumbnailCollectionViewController *)v6 setLayout:v5];
    v8 = [(ICDocCamThumbnailCollectionViewController *)v7 collectionView];
    [v8 setDataSource:v7];

    v9 = [(ICDocCamThumbnailCollectionViewController *)v7 collectionView];
    [v9 setDelegate:v7];

    v10 = [(ICDocCamThumbnailCollectionViewController *)v7 collectionView];
    v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
    [v10 setBackgroundColor:v11];

    [(ICDocCamThumbnailCollectionViewController *)v7 setDelegate:v4];
    v12 = [(ICDocCamThumbnailCollectionViewController *)v7 layout];
    [v12 setDelegate:v7];
  }
  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  [(ICDocCamThumbnailCollectionViewController *)&v5 viewDidLoad];
  v3 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ICDocCamThumbnailCellKind"];

  id v4 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  [v4 setClipsToBounds:0];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  [(ICDocCamThumbnailCollectionViewController *)&v2 didReceiveMemoryWarning];
}

- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4
{
  uint64_t v6 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  if (v6
    && (v7 = (void *)v6,
        [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    v10 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
    v11 = [v10 objectAtIndexedSubscript:a4];
    v12 = [v11 croppedAndFilteredImageUUID];

    if (!v12)
    {
      v13 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
      objc_super v14 = [v13 objectAtIndexedSubscript:a4];
      v12 = [v14 meshAnimImageUUID];
    }
    v15 = [(ICDocCamThumbnailCollectionViewController *)self imageCache];
    [v15 getImageSize:v12];
    double v17 = v16;
    double v19 = v18;

    double v20 = v17;
    double v21 = v19;
  }
  else
  {
    double v20 = 0.0;
    double v21 = 0.0;
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGRect)targetViewRect
{
  objc_super v2 = [(ICDocCamThumbnailCollectionViewController *)self delegate];
  [v2 targetViewRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)rootView
{
  objc_super v2 = [(ICDocCamThumbnailCollectionViewController *)self delegate];
  double v3 = [v2 rootView];

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  if (!v5) {
    return 0;
  }
  double v6 = (void *)v5;
  double v7 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  uint64_t v8 = [v7 count];

  if (!v8) {
    return 0;
  }
  double v9 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  int64_t v10 = [v9 count];

  return v10;
}

- (void)setImageWithUUID:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(ICDocCamThumbnailCollectionViewController *)self imageCache];
  double v11 = [v10 getImage:v8];

  if (!v11)
  {
    v28 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamThumbnailCollectionViewController setImageWithUUID:forCell:useResizedImage:]((uint64_t)v8, v28);
    }

    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_7:
    double v13 = [v9 imageView];
    [v13 setImage:v11];
    goto LABEL_8;
  }
  double v12 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  double v13 = [v12 collectionViewLayout];

  [v11 size];
  double v15 = v14;
  double v17 = v16;
  objc_msgSend(v13, "frameSizeForImageSize:");
  double v19 = v18;
  double v21 = v20;
  v22 = [MEMORY[0x263F1C920] mainScreen];
  [v22 scale];
  double v24 = v23;

  double v25 = fmax(v24, 1.0);
  +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:", v15, v17, v19 * v25, v21 * v25);
  v26 = +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v11, 3);
  v27 = [v9 imageView];
  [v27 setImage:v26];

LABEL_8:
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"ICDocCamThumbnailCellKind" forIndexPath:v6];
  if ([(ICDocCamThumbnailCollectionViewController *)self isPerformingBatchUpdates]) {
    float v8 = 0.5;
  }
  else {
    float v8 = 1.0;
  }
  id v9 = [v7 layer];
  *(float *)&double v10 = v8;
  [v9 setSpeed:v10];

  uint64_t v11 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  if (v11)
  {
    double v12 = (void *)v11;
    double v13 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      double v15 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
      double v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
      double v17 = [v16 croppedAndFilteredImageUUID];

      if (!v17)
      {
        double v18 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
        double v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
        double v17 = [v19 meshAnimImageUUID];
      }
      [(ICDocCamThumbnailCollectionViewController *)self setImageWithUUID:v17 forCell:v7 useResizedImage:[(ICDocCamThumbnailCollectionViewController *)self isPerformingBatchUpdates] ^ 1];
    }
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICDocCamThumbnailCollectionViewController *)self delegate];
  [v6 thumbnailViewDidTap:v5];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  id v7 = a4;
  -[ICDocCamThumbnailCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  float v8 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  [v8 setClipsToBounds:1];

  id v9 = [(ICDocCamThumbnailCollectionViewController *)self layout];
  [v9 setTransitioning:1];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__ICDocCamThumbnailCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_2642A92C0;
  v10[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_18 completion:v10];
}

void __96__ICDocCamThumbnailCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_super v2 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  [*(id *)(a1 + 32) setLayout:v2];

  double v3 = *(void **)(a1 + 32);
  double v4 = [v3 layout];
  [v4 setDelegate:v3];

  id v5 = [*(id *)(a1 + 32) collectionView];
  id v6 = [*(id *)(a1 + 32) layout];
  [v5 setCollectionViewLayout:v6 animated:1];

  [*(id *)(a1 + 32) reloadDataForCollectionView];
  id v7 = [*(id *)(a1 + 32) collectionView];
  [v7 setClipsToBounds:0];

  id v8 = [*(id *)(a1 + 32) layout];
  [v8 setTransitioning:0];
}

- (void)reloadDataForCollectionView
{
  if ([(ICDocCamThumbnailCollectionViewController *)self isPerformingBatchUpdates])
  {
    [(ICDocCamThumbnailCollectionViewController *)self setNeedReloadAfterBatchUpdates:1];
  }
  else
  {
    id v3 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
    [v3 reloadData];
  }
}

- (void)update
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamThumbnailCollectionViewController_update__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__ICDocCamThumbnailCollectionViewController_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataForCollectionView];
}

- (void)addNewDocument:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamThumbnailCollectionViewController addNewDocument:completionBlock:]((uint64_t)v6, v8);
  }

  [(ICDocCamThumbnailCollectionViewController *)self setIsPerformingBatchUpdates:1];
  id v9 = [(ICDocCamThumbnailCollectionViewController *)self documentInfoArray];
  uint64_t v10 = [v9 count];

  objc_super v11 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:0];
  double v12 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke;
  v20[3] = &unk_2642A97F0;
  v20[4] = self;
  id v21 = v6;
  id v22 = v11;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2;
  v16[3] = &unk_2642AA620;
  v16[4] = self;
  id v17 = v22;
  id v18 = v21;
  id v19 = v7;
  id v13 = v7;
  id v14 = v22;
  id v15 = v21;
  [v12 performBatchUpdates:v20 completion:v16];
}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [*(id *)(a1 + 32) delegate];
  [v2 addNewDocument:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) collectionView];
  v5[0] = *(void *)(a1 + 48);
  double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [v3 insertItemsAtIndexPaths:v4];
}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) setIsPerformingBatchUpdates:0];
  id v3 = [*(id *)(a1 + 32) collectionView];
  double v4 = [v3 cellForItemAtIndexPath:*(void *)(a1 + 40)];

  id v5 = [v4 layer];
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];

  id v7 = [*(id *)(a1 + 48) croppedAndFilteredImageUUID];
  if (!v7)
  {
    id v7 = [*(id *)(a1 + 48) meshAnimImageUUID];
  }
  id v8 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2_cold_1((uint64_t *)(a1 + 48), (uint64_t)v7, v8);
  }

  [*(id *)(a1 + 32) setImageWithUUID:v7 forCell:v4 useResizedImage:1];
  if ([*(id *)(a1 + 32) needReloadAfterBatchUpdates])
  {
    [*(id *)(a1 + 32) setNeedReloadAfterBatchUpdates:0];
    id v9 = [*(id *)(a1 + 32) collectionView];
    [v9 reloadData];
  }
}

- (void)animateLayoutChange
{
  id v3 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  [(ICDocCamThumbnailCollectionViewController *)self setLayout:v3];

  double v4 = [(ICDocCamThumbnailCollectionViewController *)self layout];
  [v4 setDelegate:self];

  id v6 = [(ICDocCamThumbnailCollectionViewController *)self collectionView];
  id v5 = [(ICDocCamThumbnailCollectionViewController *)self layout];
  [v6 setCollectionViewLayout:v5 animated:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSMutableArray)documentInfoArray
{
  return self->_documentInfoArray;
}

- (void)setDocumentInfoArray:(id)a3
{
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (ICDocCamThumbnailViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamThumbnailViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICDocCamThumbnailCollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)isPerformingBatchUpdates
{
  return self->_isPerformingBatchUpdates;
}

- (void)setIsPerformingBatchUpdates:(BOOL)a3
{
  self->_isPerformingBatchUpdates = a3;
}

- (BOOL)needReloadAfterBatchUpdates
{
  return self->_needReloadAfterBatchUpdates;
}

- (void)setNeedReloadAfterBatchUpdates:(BOOL)a3
{
  self->_needReloadAfterBatchUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_documentInfoArray, 0);
}

- (void)setImageWithUUID:(uint64_t)a1 forCell:(NSObject *)a2 useResizedImage:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "Error finding image: %@", (uint8_t *)&v2, 0xCu);
}

- (void)addNewDocument:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217885000, a2, OS_LOG_TYPE_DEBUG, "addNewDocument: %p", (uint8_t *)&v2, 0xCu);
}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "addNewDocument: %p %@", (uint8_t *)&v4, 0x16u);
}

@end