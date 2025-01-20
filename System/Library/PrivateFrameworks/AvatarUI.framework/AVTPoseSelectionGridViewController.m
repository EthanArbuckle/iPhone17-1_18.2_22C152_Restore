@interface AVTPoseSelectionGridViewController
- (AVTAvatarRecord)avatarRecord;
- (AVTPoseSelectionGridViewController)initWithAvatarRecord:(id)a3 poseConfigurations:(id)a4 allowsCameraCapture:(BOOL)a5;
- (AVTPoseSelectionGridViewControllerDelegate)delegate;
- (AVTStickerConfiguration)selectedStickerConfiguration;
- (AVTTaskScheduler)scheduler;
- (AVTUIStickerGeneratorPool)generatorPool;
- (AVTUIStickerRenderer)stickerRenderer;
- (BOOL)willDisplayCameraItem;
- (NSArray)stickerConfigurations;
- (OS_dispatch_queue)stickerGenerationQueue;
- (UICollectionView)poseCollectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIColor)backgroundColor;
- (UIEdgeInsets)contentInset;
- (UIImage)placeholderImage;
- (UIView)cameraCellView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)configurationForIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAvatarRecord:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCameraCellView:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPoseCollectionView:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSelectedStickerConfiguration:(id)a3;
- (void)setStickerConfigurations:(id)a3;
- (void)setStickerGenerationQueue:(id)a3;
- (void)setStickerRenderer:(id)a3;
- (void)setWillDisplayCameraItem:(BOOL)a3;
- (void)updateFlowLayoutItemSize;
- (void)updateWithAvatarRecord:(id)a3 stickerConfigurations:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AVTPoseSelectionGridViewController

- (AVTPoseSelectionGridViewController)initWithAvatarRecord:(id)a3 poseConfigurations:(id)a4 allowsCameraCapture:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTPoseSelectionGridViewController;
  v11 = [(AVTPoseSelectionGridViewController *)&v17 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    if (AVTUIIsFacetrackingSupported() && v5)
    {
      v13 = -[AVTCameraItemView initWithFrame:]([AVTCameraItemView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
      [(AVTPoseSelectionGridViewController *)v12 setCameraCellView:v13];
    }
    objc_storeStrong((id *)&v12->_stickerConfigurations, a4);
    uint64_t v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    backgroundColor = v12->_backgroundColor;
    v12->_backgroundColor = (UIColor *)v14;
  }
  return v12;
}

- (void)viewDidLoad
{
  v51[4] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)AVTPoseSelectionGridViewController;
  [(AVTPoseSelectionGridViewController *)&v50 viewDidLoad];
  v3 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x263F1C508]);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v3;

  id v5 = objc_alloc(MEMORY[0x263F1C4E0]);
  v6 = [(AVTPoseSelectionGridViewController *)self view];
  [v6 bounds];
  v7 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", self->_flowLayout, 0.0, 0.0);
  poseCollectionView = self->_poseCollectionView;
  self->_poseCollectionView = v7;

  [(AVTPoseSelectionGridViewController *)self contentInset];
  -[UICollectionView setContentInset:](self->_poseCollectionView, "setContentInset:");
  id v9 = [(AVTPoseSelectionGridViewController *)self backgroundColor];
  [(UICollectionView *)self->_poseCollectionView setBackgroundColor:v9];

  [(UICollectionView *)self->_poseCollectionView setDelegate:self];
  [(UICollectionView *)self->_poseCollectionView setDataSource:self];
  [(UICollectionView *)self->_poseCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];
  [(UICollectionView *)self->_poseCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_selectedStickerConfiguration)
  {
    -[AVTPoseSelectionGridViewController setSelectedStickerConfiguration:](self, "setSelectedStickerConfiguration:");
  }
  else
  {
    if (AVTDeviceIsGreenTea()
      && [(AVTPoseSelectionGridViewController *)self willDisplayCameraItem])
    {
      id v10 = [(NSArray *)self->_stickerConfigurations objectAtIndexedSubscript:0];
      [(AVTPoseSelectionGridViewController *)self setSelectedStickerConfiguration:v10];

      v11 = [(AVTPoseSelectionGridViewController *)self delegate];
      v12 = [(AVTPoseSelectionGridViewController *)self selectedStickerConfiguration];
      [v11 poseSelectionGridController:self didSelectConfiguration:v12];

      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = self->_poseCollectionView;
    v15 = [MEMORY[0x263F088C8] indexPathForItem:v13 inSection:0];
    [(UICollectionView *)v14 selectItemAtIndexPath:v15 animated:0 scrollPosition:0];
  }
  v16 = [(AVTPoseSelectionGridViewController *)self view];
  [v16 addSubview:self->_poseCollectionView];

  objc_super v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  v18 = +[AVTSerialTaskScheduler fifoScheduler];
  scheduler = self->_scheduler;
  self->_scheduler = v18;

  v20 = [[AVTUIStickerGeneratorPool alloc] initWithMaxStickerGeneratorCount:2];
  generatorPool = self->_generatorPool;
  self->_generatorPool = v20;

  v22 = [AVTUIStickerRenderer alloc];
  v23 = [(AVTPoseSelectionGridViewController *)self avatarRecord];
  v24 = [(AVTUIStickerRenderer *)v22 initWithAvatarRecord:v23 stickerGeneratorPool:self->_generatorPool scheduler:self->_scheduler];
  stickerRenderer = self->_stickerRenderer;
  self->_stickerRenderer = v24;

  v26 = (void *)MEMORY[0x263F29730];
  v27 = [(AVTPoseSelectionGridViewController *)self avatarRecord];
  v49 = [v26 avatarForRecord:v27];

  v48 = objc_alloc_init(AVTAvatarImageRenderer);
  v28 = +[AVTRenderingScope gridThumbnailScope];
  v29 = [(AVTAvatarImageRenderer *)v48 imageForAvatar:v49 scope:v28];
  v30 = [v29 imageWithRenderingMode:2];
  [(AVTPoseSelectionGridViewController *)self setPlaceholderImage:v30];

  v46 = [(UICollectionView *)self->_poseCollectionView topAnchor];
  v47 = [(AVTPoseSelectionGridViewController *)self view];
  v45 = [v47 topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v51[0] = v44;
  v42 = [(UICollectionView *)self->_poseCollectionView leadingAnchor];
  v43 = [(AVTPoseSelectionGridViewController *)self view];
  v41 = [v43 leadingAnchor];
  v31 = [v42 constraintEqualToAnchor:v41];
  v51[1] = v31;
  v32 = [(UICollectionView *)self->_poseCollectionView trailingAnchor];
  v33 = [(AVTPoseSelectionGridViewController *)self view];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v51[2] = v35;
  v36 = [(UICollectionView *)self->_poseCollectionView bottomAnchor];
  v37 = [(AVTPoseSelectionGridViewController *)self view];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  v51[3] = v39;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];

  [MEMORY[0x263F08938] activateConstraints:v40];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionGridViewController;
  id v7 = a4;
  -[AVTPoseSelectionGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__AVTPoseSelectionGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_263FF0400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __89__AVTPoseSelectionGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) poseCollectionView];
  v1 = [v2 collectionViewLayout];
  [v1 invalidateLayout];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseSelectionGridViewController;
  [(AVTPoseSelectionGridViewController *)&v3 viewDidLayoutSubviews];
  [(AVTPoseSelectionGridViewController *)self updateFlowLayoutItemSize];
}

- (void)updateFlowLayoutItemSize
{
  objc_super v3 = [(AVTPoseSelectionGridViewController *)self view];
  [v3 bounds];
  if (v4 <= 430.0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 4;
  }

  v6 = [(AVTPoseSelectionGridViewController *)self view];
  [v6 bounds];
  double v8 = (v7 + (double)(v5 + 1) * -10.0) / (double)v5;

  objc_super v9 = [(AVTPoseSelectionGridViewController *)self flowLayout];
  objc_msgSend(v9, "setItemSize:", v8, v8);

  id v10 = [(AVTPoseSelectionGridViewController *)self flowLayout];
  [v10 invalidateLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    id v10 = [(AVTPoseSelectionGridViewController *)self poseCollectionView];
    objc_msgSend(v10, "setContentInset:", top, left, bottom, right);
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_backgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    uint64_t v5 = [(AVTPoseSelectionGridViewController *)self poseCollectionView];
    [v5 setBackgroundColor:v6];
  }
}

- (void)setSelectedStickerConfiguration:(id)a3
{
  uint64_t v5 = (AVTStickerConfiguration *)a3;
  id v6 = v5;
  selectedStickerConfiguration = self->_selectedStickerConfiguration;
  if (selectedStickerConfiguration != v5)
  {
    if (v5)
    {
      double v8 = [(AVTPoseSelectionGridViewController *)self stickerConfigurations];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __70__AVTPoseSelectionGridViewController_setSelectedStickerConfiguration___block_invoke;
      v17[3] = &unk_263FF0E00;
      v18 = v6;
      uint64_t v9 = [v8 indexOfObjectPassingTest:v17];

      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_storeStrong((id *)&self->_selectedStickerConfiguration, a3);
        id v10 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
        if (v10) {
          uint64_t v11 = v9 + 1;
        }
        else {
          uint64_t v11 = v9;
        }

        poseCollectionView = self->_poseCollectionView;
        uint64_t v13 = [MEMORY[0x263F088C8] indexPathForItem:v11 inSection:0];
        [(UICollectionView *)poseCollectionView selectItemAtIndexPath:v13 animated:0 scrollPosition:0];
      }
    }
    else
    {
      self->_selectedStickerConfiguration = 0;

      if (![(AVTPoseSelectionGridViewController *)self willDisplayCameraItem])
      {
        uint64_t v14 = self->_poseCollectionView;
        v15 = [(UICollectionView *)v14 indexPathsForSelectedItems];
        v16 = [v15 firstObject];
        [(UICollectionView *)v14 deselectItemAtIndexPath:v16 animated:1];
      }
    }
  }
}

uint64_t __70__AVTPoseSelectionGridViewController_setSelectedStickerConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  double v4 = [v2 name];
  uint64_t v5 = [v3 name];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)updateWithAvatarRecord:(id)a3 stickerConfigurations:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  double v7 = [(AVTPoseSelectionGridViewController *)self avatarRecord];

  if (v7)
  {
    double v8 = [(AVTPoseSelectionGridViewController *)self stickerConfigurations];

    if (v8)
    {
      [(AVTPoseSelectionGridViewController *)self setAvatarRecord:v24];
      [(AVTPoseSelectionGridViewController *)self setStickerConfigurations:v6];
      uint64_t v9 = [AVTUIStickerRenderer alloc];
      id v10 = [(AVTPoseSelectionGridViewController *)self avatarRecord];
      uint64_t v11 = [(AVTPoseSelectionGridViewController *)self generatorPool];
      v12 = [(AVTPoseSelectionGridViewController *)self scheduler];
      uint64_t v13 = [(AVTUIStickerRenderer *)v9 initWithAvatarRecord:v10 stickerGeneratorPool:v11 scheduler:v12];
      [(AVTPoseSelectionGridViewController *)self setStickerRenderer:v13];

      uint64_t v14 = (void *)MEMORY[0x263F29730];
      v15 = [(AVTPoseSelectionGridViewController *)self avatarRecord];
      v16 = [v14 avatarForRecord:v15];

      objc_super v17 = objc_alloc_init(AVTAvatarImageRenderer);
      v18 = +[AVTRenderingScope gridThumbnailScope];
      v19 = [(AVTAvatarImageRenderer *)v17 imageForAvatar:v16 scope:v18];
      v20 = [v19 imageWithRenderingMode:2];
      [(AVTPoseSelectionGridViewController *)self setPlaceholderImage:v20];

      v21 = [(AVTPoseSelectionGridViewController *)self poseCollectionView];
      [v21 reloadData];

      v22 = [(AVTPoseSelectionGridViewController *)self poseCollectionView];
      v23 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
      [v22 selectItemAtIndexPath:v23 animated:0 scrollPosition:0];
    }
  }
}

- (BOOL)willDisplayCameraItem
{
  id v2 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)configurationForIndex:(int64_t)a3
{
  uint64_t v5 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
  BOOL v6 = v5 != 0;

  double v7 = [(AVTPoseSelectionGridViewController *)self stickerConfigurations];
  double v8 = [v7 objectAtIndexedSubscript:a3 - v6];

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
  BOOL v6 = [(AVTPoseSelectionGridViewController *)self stickerConfigurations];
  uint64_t v7 = [v6 count];
  if (v5) {
    int64_t v8 = v7 + 1;
  }
  else {
    int64_t v8 = v7;
  }

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v7];
  uint64_t v9 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
  if (v9 && (id v10 = (void *)v9, v11 = [v7 item], v10, !v11))
  {
    v27 = [v8 tintColor];
    v28 = [MEMORY[0x263F1C550] systemBlueColor];

    if (v27 != v28)
    {
      v29 = [MEMORY[0x263F1C550] systemBlueColor];
      [v8 setTintColor:v29];
    }
    [v8 updateImage:0 animated:0];
    v30 = [v8 contentView];
    v31 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
    [v30 addSubview:v31];

    v32 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
    [v32 setAutoresizingMask:18];

    v19 = [v8 contentView];
    [v19 bounds];
    CGRect v57 = CGRectInset(v56, 20.0, 20.0);
    double x = v57.origin.x;
    double y = v57.origin.y;
    double width = v57.size.width;
    double height = v57.size.height;
    v37 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
    objc_msgSend(v37, "setFrame:", x, y, width, height);
  }
  else
  {
    v12 = [v8 tintColor];
    uint64_t v13 = [MEMORY[0x263F1C550] quaternaryLabelColor];

    if (v12 != v13)
    {
      uint64_t v14 = [MEMORY[0x263F1C550] quaternaryLabelColor];
      [v8 setTintColor:v14];
    }
    v15 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
    v16 = [v15 superview];
    objc_super v17 = [v8 contentView];

    if (v16 == v17)
    {
      v18 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
      [v18 removeFromSuperview];
    }
    v19 = -[AVTPoseSelectionGridViewController configurationForIndex:](self, "configurationForIndex:", [v7 item]);
    v20 = [(AVTPoseSelectionGridViewController *)self stickerRenderer];
    v21 = [v20 scheduledStickerResourceProviderForStickerConfiguration:v19 correctClipping:0];

    v22 = [MEMORY[0x263F08C38] UUID];
    [v8 setContextIdentifier:v22];
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __76__AVTPoseSelectionGridViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v42 = &unk_263FF0E28;
    v45 = &v47;
    id v23 = v8;
    id v43 = v23;
    id v24 = v22;
    id v44 = v24;
    v46 = &v51;
    id v25 = (id)((uint64_t (**)(void, uint64_t *, uint64_t))v21)[2](v21, &v39, 1);
    if (!*((unsigned char *)v48 + 24))
    {
      *((unsigned char *)v52 + 24) = 1;
      v26 = [(AVTPoseSelectionGridViewController *)self placeholderImage];
      [v23 updateImage:v26 animated:0];
    }
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
  }
  return v8;
}

void __76__AVTPoseSelectionGridViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  BOOL v3 = [*(id *)(a1 + 32) contextIdentifier];
  if (v3 == *(void **)(a1 + 40))
  {
    double v4 = [v7 image];

    uint64_t v5 = v7;
    if (!v4) {
      goto LABEL_5;
    }
    id v6 = *(void **)(a1 + 32);
    BOOL v3 = [v7 image];
    [v6 updateImage:v3 animated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  }

  uint64_t v5 = v7;
LABEL_5:
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  uint64_t v5 = [(AVTPoseSelectionGridViewController *)self cameraCellView];
  if (v5 && (v6 = (void *)v5, uint64_t v7 = [v11 item], v6, !v7))
  {
    [(AVTPoseSelectionGridViewController *)self setSelectedStickerConfiguration:0];
    uint64_t v9 = [(AVTPoseSelectionGridViewController *)self delegate];
    [v9 poseSelectionGridControllerDidSelectCameraItem:self];
  }
  else
  {
    int64_t v8 = -[AVTPoseSelectionGridViewController configurationForIndex:](self, "configurationForIndex:", [v11 item]);
    [(AVTPoseSelectionGridViewController *)self setSelectedStickerConfiguration:v8];

    uint64_t v9 = [(AVTPoseSelectionGridViewController *)self delegate];
    id v10 = [(AVTPoseSelectionGridViewController *)self selectedStickerConfiguration];
    [v9 poseSelectionGridController:self didSelectConfiguration:v10];
  }
}

- (AVTPoseSelectionGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTPoseSelectionGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setWillDisplayCameraItem:(BOOL)a3
{
  self->_willDisplayCameraItem = a3;
}

- (AVTStickerConfiguration)selectedStickerConfiguration
{
  return self->_selectedStickerConfiguration;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (NSArray)stickerConfigurations
{
  return self->_stickerConfigurations;
}

- (void)setStickerConfigurations:(id)a3
{
}

- (UIView)cameraCellView
{
  return self->_cameraCellView;
}

- (void)setCameraCellView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (UICollectionView)poseCollectionView
{
  return self->_poseCollectionView;
}

- (void)setPoseCollectionView:(id)a3
{
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (void)setStickerRenderer:(id)a3
{
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
}

- (AVTTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (OS_dispatch_queue)stickerGenerationQueue
{
  return self->_stickerGenerationQueue;
}

- (void)setStickerGenerationQueue:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_stickerGenerationQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_poseCollectionView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_cameraCellView, 0);
  objc_storeStrong((id *)&self->_stickerConfigurations, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedStickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end