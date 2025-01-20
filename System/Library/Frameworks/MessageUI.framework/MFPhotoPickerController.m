@interface MFPhotoPickerController
+ (id)log;
- (BOOL)_isPresentingInASheet;
- (CGSize)thumbnailSize;
- (MFPhotoPickerController)initWithPhotoPickerProgressManager:(id)a3;
- (MFPhotoPickerControllerDelegate)pickerDelegate;
- (MFPhotoPickerProgressManager)progressManager;
- (NSSet)selectedAssetIdentifiers;
- (PHCachingImageManager)imageManager;
- (PHFetchResult)photosFetchResult;
- (UIImagePickerController)systemImagePicker;
- (double)availableWidth;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)_visibleCellForIndexPath:(id)a3 collectionView:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)addSelectedAssetIdentifier:(id)a3;
- (void)addSelectedAssetIdentifiers:(id)a3;
- (void)close:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)loadView;
- (void)removeAllSelectedAssetIdentifiers;
- (void)removeSelectedAssetIdentifier:(id)a3;
- (void)setAvailableWidth:(double)a3;
- (void)setImageManager:(id)a3;
- (void)setPhotosFetchResult:(id)a3;
- (void)setPickerDelegate:(id)a3;
- (void)setProgressManager:(id)a3;
- (void)setSystemImagePicker:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)showSystemImagePicker:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MFPhotoPickerController

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MFPhotoPickerController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;

  return v2;
}

void __30__MFPhotoPickerController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

- (MFPhotoPickerController)initWithPhotoPickerProgressManager:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v6 setMinimumLineSpacing:1.0];
  [v6 setMinimumInteritemSpacing:0.0];
  [v6 setSectionInsetReference:1];
  v11.receiver = self;
  v11.super_class = (Class)MFPhotoPickerController;
  v7 = [(MFPhotoPickerController *)&v11 initWithCollectionViewLayout:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    selectedAssetIdentifiers = v7->_selectedAssetIdentifiers;
    v7->_selectedAssetIdentifiers = (NSMutableSet *)v8;

    objc_storeStrong((id *)&v7->_progressManager, a3);
  }

  return v7;
}

- (PHFetchResult)photosFetchResult
{
  photosFetchResult = self->_photosFetchResult;
  if (!photosFetchResult)
  {
    v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:209 options:0];
    id v5 = [v4 firstObject];
    id v6 = objc_opt_new();
    [v6 setFetchLimit:96];
    [v6 setReverseSortOrder:1];
    v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v6];
    uint64_t v8 = self->_photosFetchResult;
    self->_photosFetchResult = v7;

    photosFetchResult = self->_photosFetchResult;
  }

  return photosFetchResult;
}

- (PHCachingImageManager)imageManager
{
  imageManager = self->_imageManager;
  if (!imageManager)
  {
    v4 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E4F38FB0]);
    id v5 = self->_imageManager;
    self->_imageManager = v4;

    imageManager = self->_imageManager;
  }

  return imageManager;
}

- (NSSet)selectedAssetIdentifiers
{
  v2 = (void *)[(NSMutableSet *)self->_selectedAssetIdentifiers copy];

  return (NSSet *)v2;
}

- (void)setPickerDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_pickerDelegate, obj);
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v8;
    id v5 = obj;
  }
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)MFPhotoPickerController;
  [(MFPhotoPickerController *)&v16 loadView];
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(MFPhotoPickerController *)self collectionView];
  [v4 setBackgroundColor:v3];

  id v5 = [(MFPhotoPickerController *)self collectionView];
  [v5 setAllowsMultipleSelection:1];

  char v6 = [(MFPhotoPickerController *)self collectionView];
  [v6 setInsetsLayoutMarginsFromSafeArea:1];

  char v7 = [(MFPhotoPickerController *)self collectionViewLayout];
  char v8 = [(MFPhotoPickerController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setHeaderReferenceSize:", v9, 44.0);

  v10 = [(MFPhotoPickerController *)self collectionView];
  uint64_t v11 = objc_opt_class();
  v12 = +[MFPhotoPickerCell reusableIdentifier];
  [v10 registerClass:v11 forCellWithReuseIdentifier:v12];

  v13 = [(MFPhotoPickerController *)self collectionView];
  uint64_t v14 = objc_opt_class();
  v15 = +[MFPhotoPickerSectionHeaderView reusableIdentifier];
  [v13 registerClass:v14 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:v15];

  self->_availableWidth = 0.0;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MFPhotoPickerController;
  [(MFPhotoPickerController *)&v13 viewDidLoad];
  id v3 = [MFComposeActionCardTitleView alloc];
  v4 = -[MFComposeActionCardTitleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"PHOTO_PICKER_TITLE" value:&stru_1F0817A00 table:@"Main"];
  char v7 = [(MFComposeActionCardTitleView *)v4 titleLabel];
  [v7 setText:v6];

  char v8 = [(MFComposeActionCardTitleView *)v4 closeButton];
  [v8 addTarget:self action:sel_close_ forEvents:64];

  double v9 = [(MFPhotoPickerController *)self navigationItem];
  [v9 setTitleView:v4];

  v10 = [(MFPhotoPickerController *)self navigationItem];
  [v10 _setAutoScrollEdgeTransitionDistance:8.0];

  uint64_t v11 = [(MFPhotoPickerController *)self navigationItem];
  [v11 _setManualScrollEdgeAppearanceProgress:0.0];

  v12 = [(MFPhotoPickerController *)self navigationItem];
  [v12 _setManualScrollEdgeAppearanceEnabled:1];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)MFPhotoPickerController;
  [(MFPhotoPickerController *)&v19 viewWillLayoutSubviews];
  id v3 = [(MFPhotoPickerController *)self view];
  [v3 bounds];
  double v5 = v4;
  char v6 = [(MFPhotoPickerController *)self view];
  [v6 safeAreaInsets];
  double v9 = v5 - (v7 + v8);

  [(MFPhotoPickerController *)self availableWidth];
  if (v10 != v9)
  {
    [(MFPhotoPickerController *)self setAvailableWidth:v9];
    [(MFPhotoPickerController *)self availableWidth];
    *(float *)&double v11 = v11 / 80.0;
    uint64_t v12 = vcvtms_s32_f32(*(float *)&v11);
    [(MFPhotoPickerController *)self availableWidth];
    double v14 = (double)(uint64_t)((v13 - (double)v12 + -1.0) / (double)v12);
    v15 = [(MFPhotoPickerController *)self collectionViewLayout];
    objc_msgSend(v15, "setItemSize:", v14, v14);

    objc_super v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 scale];
    double v18 = v17;

    -[MFPhotoPickerController setThumbnailSize:](self, "setThumbnailSize:", v18 * v14, v18 * v14);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(MFPhotoPickerController *)self photosFetchResult];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[MFPhotoPickerCell reusableIdentifier];
  double v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v7];

  double v10 = [(MFPhotoPickerController *)self photosFetchResult];
  double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  uint64_t v12 = objc_msgSend(v11, "mf_localIdentifier");
  [v9 setRepresentedAssetIdentifier:v12];
  if (([v11 mediaSubtypes] & 8) != 0) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = [v11 mediaType] == 2;
  }
  [v9 setMediaType:v13];
  double v14 = [(MFPhotoPickerController *)self selectedAssetIdentifiers];
  uint64_t v15 = [v14 containsObject:v12];

  [v9 setSelected:v15];
  if (v15)
  {
    objc_super v16 = [(MFPhotoPickerController *)self collectionView];
    double v17 = [v16 indexPathsForSelectedItems];
    char v18 = [v17 containsObject:v7];

    if ((v18 & 1) == 0)
    {
      objc_super v19 = [(MFPhotoPickerController *)self collectionView];
      [v19 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
    }
  }
  v20 = [(MFPhotoPickerController *)self imageManager];
  [(MFPhotoPickerController *)self thumbnailSize];
  double v22 = v21;
  double v24 = v23;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __65__MFPhotoPickerController_collectionView_cellForItemAtIndexPath___block_invoke;
  v36 = &unk_1E5F7CF30;
  id v25 = v12;
  id v37 = v25;
  id v26 = v9;
  id v38 = v26;
  objc_msgSend(v20, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, 0, &v33, v22, v24);

  v27 = [(MFPhotoPickerController *)self progressManager];
  [v27 progressForIndexPath:v7];
  double v29 = v28;

  if (v29 > 0.0) {
    [v26 setProgress:v29];
  }
  v30 = v38;
  id v31 = v26;

  return v31;
}

void __65__MFPhotoPickerController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(void **)(a1 + 32);
  double v4 = [*(id *)(a1 + 40) representedAssetIdentifier];
  LODWORD(v3) = [v3 isEqualToString:v4];

  if (v3) {
    [*(id *)(a1 + 40) setThumbnailImage:v5];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  id v7 = [(MFPhotoPickerController *)self photosFetchResult];
  double v21 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  v20 = [(MFPhotoPickerController *)self _visibleCellForIndexPath:v6 collectionView:v22];
  double v8 = +[MFPhotoPickerController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = objc_msgSend(v21, "mf_localIdentifier");
    *(_DWORD *)buf = 138543362;
    v36 = v9;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ selected", buf, 0xCu);
  }
  objc_super v19 = [(MFPhotoPickerController *)self pickerDelegate];
  double v10 = [(MFPhotoPickerController *)self progressManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v30[3] = &unk_1E5F7CF80;
  id v31 = v10;
  id v32 = v6;
  id v33 = v21;
  id v34 = v20;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v23[3] = &unk_1E5F7CFD0;
  id v11 = v31;
  id v24 = v11;
  id v12 = v32;
  id v25 = v12;
  id v26 = self;
  id v13 = v33;
  id v27 = v13;
  id v14 = v34;
  id v28 = v14;
  id v15 = v19;
  id v29 = v15;
  uint64_t v16 = +[MFMediaExporter exportAsset:v13 progressHandler:v30 completion:v23];
  double v17 = +[MFPhotoPickerController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    char v18 = objc_msgSend(v13, "mf_localIdentifier");
    *(_DWORD *)buf = 138543618;
    v36 = v18;
    __int16 v37 = 1026;
    int v38 = v16;
    _os_log_impl(&dword_1AF945000, v17, OS_LOG_TYPE_DEFAULT, "Asset %{public}@, PHImageRequestID %{public}d", buf, 0x12u);
  }
  [v11 setImageRequestID:v16 forIndexPath:v12];
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke(id *a1, void *a2, double a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v8[3] = &unk_1E5F7CF58;
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  double v14 = a3;
  id v6 = v5;
  id v13 = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v8[0], 3221225472, __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2, &unk_1E5F7CF58);
  [v7 performBlock:v8];
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requestExistsForIndexPath:*(void *)(a1 + 40)])
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "mf_localIdentifier");
    id v3 = [*(id *)(a1 + 56) representedAssetIdentifier];
    int v4 = [v2 isEqualToString:v3];

    if (v4)
    {
      [*(id *)(a1 + 32) setProgress:*(void *)(a1 + 40) forIndexPath:*(double *)(a1 + 72)];
      uint64_t v5 = *(void *)(a1 + 64);
      if (v5) {
        [*(id *)(a1 + 32) setExportSession:v5 forIndexPath:*(void *)(a1 + 40)];
      }
      double v6 = *(double *)(a1 + 72);
      id v7 = *(void **)(a1 + 56);
      [v7 setProgress:v6];
    }
  }
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) cancelEverythingAtIndexPath:*(void *)(a1 + 40)];
  if (v3)
  {
    int v4 = *(void **)(a1 + 48);
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 56), "mf_localIdentifier");
    [v4 addSelectedAssetIdentifier:v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
    v10[3] = &unk_1E5F7CFA8;
    id v11 = *(id *)(a1 + 64);
    id v6 = *(id *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 48);
    double v8 = *(void **)(a1 + 56);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    id v15 = v3;
    id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v9 performBlock:v10];
  }
}

void __67__MFPhotoPickerController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgress:1.0];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "mf_localIdentifier");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPicker:didSelectAssetWithIdentifier:mediaInfo:", v3);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MFPhotoPickerController *)self progressManager];
  [v8 cancelEverythingAtIndexPath:v7];

  id v9 = [(MFPhotoPickerController *)self _visibleCellForIndexPath:v7 collectionView:v6];
  [v9 resetProgress];
  id v10 = [(MFPhotoPickerController *)self photosFetchResult];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  id v12 = objc_msgSend(v11, "mf_localIdentifier");
  [(MFPhotoPickerController *)self removeSelectedAssetIdentifier:v12];

  uint64_t v13 = +[MFPhotoPickerController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_msgSend(v11, "mf_localIdentifier");
    int v17 = 138543362;
    char v18 = v14;
    _os_log_impl(&dword_1AF945000, v13, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ de-selected", (uint8_t *)&v17, 0xCu);
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    id v15 = [(MFPhotoPickerController *)self pickerDelegate];
    uint64_t v16 = objc_msgSend(v11, "mf_localIdentifier");
    [v15 photoPicker:self didDeselectAssetWithIdentifier:v16];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[MFPhotoPickerSectionHeaderView reusableIdentifier];
  id v10 = [v7 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:v9 forIndexPath:v8];

  [v10 addAllPhotosTarget:self action:sel_showSystemImagePicker_];

  return v10;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = [(MFPhotoPickerController *)self systemImagePicker];
  [v4 dismissViewControllerAnimated:1 completion:0];

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id v5 = [(MFPhotoPickerController *)self pickerDelegate];
    [v5 photoPickerDidCancelSystemImagePicker:self];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MFPhotoPickerController *)self systemImagePicker];
  [v6 dismissViewControllerAnimated:1 completion:0];

  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB3238]];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

    id v8 = (void *)v9;
  }
  id v10 = +[MFPhotoPickerController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "System Image Picker, Asset %{public}@ selected", (uint8_t *)&v12, 0xCu);
  }

  id v11 = [(MFPhotoPickerController *)self pickerDelegate];
  [v11 photoPicker:self didSelectAssetWithIdentifier:v8 mediaInfo:v5];
}

- (void)close:(id)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    id v4 = [(MFPhotoPickerController *)self pickerDelegate];
    [v4 photoPickerDidCancel:self];
  }
}

- (void)showSystemImagePicker:(id)a3
{
  id v15 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    objc_msgSend(MEMORY[0x1E4FB1828], "mf_systemImagePickerWithSourceType:", 0);
    id v5 = (UIImagePickerController *)objc_claimAutoreleasedReturnValue();
    systemImagePicker = self->_systemImagePicker;
    self->_systemImagePicker = v5;

    id v7 = [(MFPhotoPickerController *)self pickerDelegate];
    [(UIImagePickerController *)self->_systemImagePicker setDelegate:self];
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_9;
    }
    uint64_t v8 = [v7 presentingViewControllerForPhotoPicker:self];
    uint64_t v9 = [(MFPhotoPickerController *)self navigationController];
    if (v9)
    {
      id v10 = [(MFPhotoPickerController *)self navigationController];
      id v11 = [v10 presentationController];
      int v12 = [v11 delegate];
    }
    else
    {
      id v10 = [(MFPhotoPickerController *)self presentationController];
      int v12 = [v10 delegate];
    }

    uint64_t v13 = [(UIImagePickerController *)self->_systemImagePicker presentationController];
    [v13 setDelegate:v12];

    if (v8)
    {
      uint64_t v14 = (MFPhotoPickerController *)v8;
      [(MFPhotoPickerController *)self dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
LABEL_9:
      uint64_t v14 = self;
    }
    [(MFPhotoPickerController *)v14 presentViewController:self->_systemImagePicker animated:1 completion:0];
  }
  else
  {
    [(MFPhotoPickerController *)self performSelectorOnMainThread:a2 withObject:v15 waitUntilDone:0];
  }
}

- (void)addSelectedAssetIdentifier:(id)a3
{
}

- (void)addSelectedAssetIdentifiers:(id)a3
{
}

- (void)removeSelectedAssetIdentifier:(id)a3
{
}

- (void)removeAllSelectedAssetIdentifiers
{
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 verticalSizeClass];
  double result = 300.0;
  if (v3 == 1) {
    return 160.0;
  }
  return result;
}

- (BOOL)_isPresentingInASheet
{
  v2 = [(MFPhotoPickerController *)self parentViewController];
  uint64_t v3 = [v2 presentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_visibleCellForIndexPath:(id)a3 collectionView:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v6, "visibleCells", 0);
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v6 indexPathForCell:v11];
        uint64_t v13 = [v12 item];
        LODWORD(v13) = v13 == [v5 item];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (MFPhotoPickerControllerDelegate)pickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);

  return (MFPhotoPickerControllerDelegate *)WeakRetained;
}

- (void)setPhotosFetchResult:(id)a3
{
}

- (void)setImageManager:(id)a3
{
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (UIImagePickerController)systemImagePicker
{
  return self->_systemImagePicker;
}

- (void)setSystemImagePicker:(id)a3
{
}

- (MFPhotoPickerProgressManager)progressManager
{
  return self->_progressManager;
}

- (void)setProgressManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_systemImagePicker, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_photosFetchResult, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);

  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
}

@end