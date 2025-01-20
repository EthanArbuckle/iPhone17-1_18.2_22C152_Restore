@interface AVTStickerViewController
+ (double)headerEdgeMarginForEnvironment:(id)a3;
+ (double)headerHeightForWidth:(double)a3 interitemSpacing:(double)a4 environment:(id)a5;
+ (id)inUseStickerPack;
+ (id)stickerViewControllerForStore:(id)a3 allowEditing:(BOOL)a4 allowPeel:(BOOL)a5;
+ (id)stickerViewControllerForStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 avtViewSessionProvider:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9;
+ (id)stickersAvatarsFetchRequest;
+ (unint64_t)minimumNumberOfVisibleItemForWidth:(double)a3 environment:(id)a4;
- (AVTAvatarPickerDataSource)avatarPickerDataSource;
- (AVTAvatarRecordDataSource)recordDataSource;
- (AVTAvatarStore)store;
- (AVTPaddleView)paddleView;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTSimpleAvatarPicker)avatarPicker;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (AVTStickerPack)stickerPacks;
- (AVTStickerPagingController)pagingController;
- (AVTStickerSelectionDelegate)stickerSelectionDelegate;
- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider;
- (AVTStickerTaskScheduler)taskScheduler;
- (AVTStickerViewController)initWithStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 selectedRecordIdentifier:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9 environment:(id)a10;
- (AVTStickerViewControllerImageDelegate)imageDelegate;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTViewSessionProvider)viewSessionProvider;
- (BOOL)allowEditing;
- (BOOL)allowPeel;
- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4;
- (BOOL)shouldHideUserInfoView;
- (BOOL)shouldPresentPaddleView;
- (NSArray)stickerConfigurationNames;
- (NSString)selectedRecordIdentifier;
- (double)headerMaxY;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)clearStickerSelection;
- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dismissAvatarUIControllerAnimated:(BOOL)a3;
- (void)dismissPaddleViewIfNecessary;
- (void)editCurrentMemoji;
- (void)paddleViewTapped:(id)a3;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
- (void)presentMemojiEditorForCreation;
- (void)presentPaddleViewIfNeeded;
- (void)reloadData;
- (void)reloadPickerView;
- (void)selectAvatarRecordAtIndex:(int64_t)a3 hideHeader:(BOOL)a4;
- (void)selectDefaultAvatarIfNeeded;
- (void)selectRecordForIdentifier:(id)a3;
- (void)setAllowEditing:(BOOL)a3;
- (void)setAvatarPicker:(id)a3;
- (void)setAvatarPickerDataSource:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
- (void)setImageDelegate:(id)a3;
- (void)setPaddleView:(id)a3;
- (void)setPagingController:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setSelectedRecordIdentifier:(id)a3;
- (void)setShouldHideUserInfoView:(BOOL)a3;
- (void)setStickerConfigurationNames:(id)a3;
- (void)setStickerPacks:(id)a3;
- (void)setStickerSelectionDelegate:(id)a3;
- (void)setStickerSheetControllerProvider:(id)a3;
- (void)setTaskScheduler:(id)a3;
- (void)setViewSessionProvider:(id)a3;
- (void)snapshotInBlock:(id)a3;
- (void)stickerControllerDidEnterBackground;
- (void)stickerControllerWillEnterForeground;
- (void)swipeLeftWithDelay:(int64_t)a3 forCompletionHandler:(id)a4;
- (void)swipeRightWithDelay:(int64_t)a3 forCompletionHandler:(id)a4;
- (void)updateHeaderPositionWithContentOffset:(CGPoint)a3;
- (void)updateHeaderSize;
- (void)updatePaddleViewLayoutIfNecessary;
- (void)updatePagingControllerInsets;
- (void)updateScrollToShowAvatarPicker:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AVTStickerViewController

+ (id)stickerViewControllerForStore:(id)a3 allowEditing:(BOOL)a4 allowPeel:(BOOL)a5
{
  BOOL v6 = a4;
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = +[AVTUIEnvironment defaultEnvironment];
  v9 = AVTUIStickersLastSelected();
  v10 = [AVTStickerViewController alloc];
  v11 = +[AVTStickerViewController stickersAvatarsFetchRequest];
  v12 = +[AVTStickerViewController inUseStickerPack];
  v17[0] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  LOBYTE(v16) = a5;
  v14 = [(AVTStickerViewController *)v10 initWithStore:v7 fetchRequest:v11 stickerPacks:v13 stickerConfigurationNames:0 selectedRecordIdentifier:v9 allowEditing:v6 allowPeel:v16 environment:v8];

  return v14;
}

+ (id)stickerViewControllerForStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 avtViewSessionProvider:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = +[AVTUIEnvironment defaultEnvironment];
  v20 = AVTUIStickersLastSelected();
  LOBYTE(v23) = a9;
  v21 = [[AVTStickerViewController alloc] initWithStore:v18 fetchRequest:v17 stickerPacks:v16 stickerConfigurationNames:v15 selectedRecordIdentifier:v20 allowEditing:v9 allowPeel:v23 environment:v19];

  [(AVTStickerViewController *)v21 setViewSessionProvider:v14];
  return v21;
}

+ (double)headerEdgeMarginForEnvironment:(id)a3
{
  id v3 = a3;
  double v4 = 10.0;
  if (([v3 deviceIsMac] & 1) == 0 && (objc_msgSend(v3, "deviceIsPad") & 1) == 0)
  {
    if ([v3 deviceIsVision]) {
      double v4 = 24.0;
    }
    else {
      double v4 = 8.0;
    }
  }

  return v4;
}

+ (unint64_t)minimumNumberOfVisibleItemForWidth:(double)a3 environment:(id)a4
{
  if ([a4 deviceIsMac])
  {
    double v5 = 56.0;
  }
  else if (a3 <= 490.0)
  {
    double v5 = 62.5;
  }
  else
  {
    double v5 = 70.2352941;
  }
  return vcvtmd_u64_f64(a3 / v5);
}

+ (double)headerHeightForWidth:(double)a3 interitemSpacing:(double)a4 environment:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [a1 minimumNumberOfVisibleItemForWidth:v8 environment:a3];
  [a1 headerEdgeMarginForEnvironment:v8];
  double v11 = v10;

  return fmin((a3 - a4 * (double)v9 + v11 * -2.0) / ((double)v9 + 0.5), 70.0);
}

+ (id)stickersAvatarsFetchRequest
{
  v2 = (void *)MEMORY[0x263F296C8];
  id v3 = [a1 inUseStickerPack];
  double v4 = [v2 unavailableAnimojiNamesForStickerPack:v3];

  double v5 = [MEMORY[0x263F29718] requestForAllAvatarsExcluding:v4];

  return v5;
}

+ (id)inUseStickerPack
{
  int v2 = AVTUIShowPrereleaseStickerPack_once();
  id v3 = (void *)*MEMORY[0x263F29708];
  if (v2
    && ([MEMORY[0x263F296C8] availableStickerNamesForMemojiInStickerPack:*MEMORY[0x263F29708]],
        double v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    AVTUISetShowPrereleaseStickerPack();
    BOOL v6 = (void *)*MEMORY[0x263F296E8];
  }
  else if (v2)
  {
    BOOL v6 = v3;
  }
  else
  {
    BOOL v6 = (void *)*MEMORY[0x263F296E8];
  }
  return v6;
}

- (AVTStickerViewController)initWithStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 selectedRecordIdentifier:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9 environment:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v29 = a5;
  id v28 = a6;
  id v18 = a7;
  id v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)AVTStickerViewController;
  v20 = [(AVTStickerViewController *)&v30 initWithNibName:0 bundle:0];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_store, a3);
    v22 = [[AVTAvatarRecordDataSource alloc] initWithRecordStore:v16 fetchRequest:v17 environment:v19];
    recordDataSource = v21->_recordDataSource;
    v21->_recordDataSource = v22;

    objc_storeStrong((id *)&v21->_stickerPacks, a5);
    objc_storeStrong((id *)&v21->_stickerConfigurationNames, a6);
    uint64_t v24 = [v19 logger];
    logger = v21->_logger;
    v21->_logger = (AVTUILogger *)v24;

    objc_storeStrong((id *)&v21->_environment, a10);
    v21->_allowEditing = a8;
    v21->_allowPeel = a9;
    objc_storeStrong((id *)&v21->_selectedRecordIdentifier, a7);
  }

  return v21;
}

- (void)viewDidLoad
{
  v71.receiver = self;
  v71.super_class = (Class)AVTStickerViewController;
  [(AVTStickerViewController *)&v71 viewDidLoad];
  id v3 = [(AVTStickerViewController *)self view];
  [v3 setClipsToBounds:1];

  double v4 = [AVTAvatarPickerDataSource alloc];
  uint64_t v5 = [(AVTStickerViewController *)self recordDataSource];
  BOOL v6 = [(AVTStickerViewController *)self environment];
  id v7 = [(AVTAvatarPickerDataSource *)v4 initWithRecordDataSource:v5 environment:v6 allowAddItem:0];
  [(AVTStickerViewController *)self setAvatarPickerDataSource:v7];

  id v8 = [(AVTStickerViewController *)self avatarPickerDataSource];
  [v8 reloadModel];

  unint64_t v9 = [(AVTStickerViewController *)self recordDataSource];
  [v9 addObserver:self];

  double v10 = [(AVTStickerViewController *)self recordDataSource];
  double v11 = +[AVTStickerTaskScheduler schedulerWithRecordDataSource:v10];
  [(AVTStickerViewController *)self setTaskScheduler:v11];

  v12 = [_AVTAvatarRecordImageProvider alloc];
  v13 = [(AVTStickerViewController *)self environment];
  id v14 = [(_AVTAvatarRecordImageProvider *)v12 initWithEnvironment:v13 taskScheduler:0];

  id v15 = [AVTStickerConfigurationProvider alloc];
  id v16 = [(AVTStickerViewController *)self environment];
  stickerPacks = self->_stickerPacks;
  id v18 = [(AVTStickerViewController *)self stickerConfigurationNames];
  id v19 = [(AVTStickerConfigurationProvider *)v15 initWithEnvironment:v16 forStickerPacks:stickerPacks stickerConfigurationNames:v18];

  v20 = [AVTStickerPagingController alloc];
  v21 = [(AVTStickerViewController *)self recordDataSource];
  v22 = [(AVTStickerViewController *)self taskScheduler];
  uint64_t v23 = [(AVTStickerViewController *)self environment];
  uint64_t v24 = [(AVTStickerPagingController *)v20 initWithRecordDataSource:v21 recordImageProvider:v14 stickerConfigurationProvider:v19 taskScheduler:v22 environment:v23 allowsPeel:[(AVTStickerViewController *)self allowPeel]];

  [(AVTStickerPagingController *)v24 setAvatarPickerDelegate:self];
  [(AVTStickerPagingController *)v24 setPresenterDelegate:self];
  [(AVTStickerPagingController *)v24 setDelegate:self];
  v25 = [(AVTStickerViewController *)self disclosureValidationDelegate];
  [(AVTStickerPagingController *)v24 setDisclosureValidationDelegate:v25];

  v26 = [(AVTStickerViewController *)self stickerSelectionDelegate];
  [(AVTStickerPagingController *)v24 setStickerSelectionDelegate:v26];

  v27 = [(AVTStickerViewController *)self stickerSheetControllerProvider];
  [(AVTStickerPagingController *)v24 setStickerSheetControllerProvider:v27];

  id v28 = [MEMORY[0x263F1C550] clearColor];
  id v29 = [(AVTStickerPagingController *)v24 view];
  [v29 setBackgroundColor:v28];

  objc_super v30 = [(AVTStickerViewController *)self view];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(AVTStickerPagingController *)v24 view];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  v40 = [(AVTStickerPagingController *)v24 view];
  [v40 setAutoresizingMask:18];

  v41 = [(AVTStickerViewController *)self view];
  v42 = [(AVTStickerPagingController *)v24 view];
  [v41 addSubview:v42];

  [(AVTStickerViewController *)self setPagingController:v24];
  v43 = [(AVTStickerViewController *)self viewSessionProvider];
  if (!v43)
  {
    v44 = [AVTViewSessionProvider alloc];
    v45 = [(AVTStickerViewController *)self avatarPickerDataSource];
    v46 = [v45 environment];
    +[AVTViewSessionProvider backingSizeForEnvironment:v46];
    double v48 = v47;
    double v50 = v49;
    v51 = +[AVTViewSessionProvider creatorForAVTView];
    v52 = [(AVTStickerViewController *)self avatarPickerDataSource];
    v53 = [v52 environment];
    v43 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v44, "initWithAVTViewBackingSize:viewCreator:environment:", v51, v53, v48, v50);
  }
  v54 = [AVTSimpleAvatarPicker alloc];
  v55 = [(AVTStickerViewController *)self avatarPickerDataSource];
  v56 = [(AVTStickerViewController *)self taskScheduler];
  v57 = [(AVTSimpleAvatarPicker *)v54 initWithDataSource:v55 recordImageProvider:v14 avtViewSessionProvider:v43 taskScheduler:v56 allowEditing:[(AVTStickerViewController *)self allowEditing]];

  [(AVTSimpleAvatarPicker *)v57 setAvatarPickerDelegate:self];
  [(AVTSimpleAvatarPicker *)v57 setPresenterDelegate:self];
  v58 = [(AVTStickerViewController *)self imageDelegate];
  [(AVTSimpleAvatarPicker *)v57 setImageDelegate:v58];

  [(AVTSimpleAvatarPicker *)v57 setShouldHideUserInfoView:[(AVTStickerViewController *)self shouldHideUserInfoView]];
  v59 = objc_opt_class();
  v60 = [(AVTStickerViewController *)self environment];
  [v59 headerEdgeMarginForEnvironment:v60];
  double v62 = v61;

  v63 = [(AVTStickerViewController *)self environment];
  if ([v63 deviceIsMac]) {
    double v64 = 10.0;
  }
  else {
    double v64 = 0.0;
  }

  -[AVTSimpleAvatarPicker setContentInset:](v57, "setContentInset:", 0.0, v62, v64, v62);
  v65 = [MEMORY[0x263F1C550] clearColor];
  v66 = [(AVTSimpleAvatarPicker *)v57 view];
  [v66 setBackgroundColor:v65];

  v67 = [(AVTSimpleAvatarPicker *)v57 view];
  [v67 setAutoresizingMask:34];

  v68 = [(AVTStickerViewController *)self view];
  v69 = [(AVTSimpleAvatarPicker *)v57 view];
  [v68 addSubview:v69];

  [(AVTStickerViewController *)self setAvatarPicker:v57];
  [(AVTStickerViewController *)self updateHeaderSize];
  [(AVTStickerViewController *)self updatePagingControllerInsets];
  v70 = [(AVTStickerViewController *)self paddleView];
  if (v70)
  {
  }
  else if (![(AVTStickerViewController *)self shouldPresentPaddleView])
  {
    [(AVTStickerViewController *)self selectDefaultAvatarIfNeeded];
    goto LABEL_11;
  }
  [(AVTStickerViewController *)self selectAvatarRecordAtIndex:0 hideHeader:0];
LABEL_11:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTStickerViewController;
  [(AVTStickerViewController *)&v4 viewDidAppear:a3];
  [(AVTStickerViewController *)self presentPaddleViewIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)AVTStickerViewController;
  [(AVTStickerViewController *)&v10 viewWillLayoutSubviews];
  id v3 = [(AVTStickerViewController *)self environment];
  int v4 = [v3 deviceIsVision];

  if (v4)
  {
    uint64_t v5 = [(AVTStickerViewController *)self avatarPicker];
    [v5 setMinimumInteritemSpacing:12.0];
  }
  else
  {
    uint64_t v5 = [(AVTStickerViewController *)self view];
    [v5 bounds];
    if (v6 <= 490.0) {
      double v7 = 8.0;
    }
    else {
      double v7 = 16.0;
    }
    id v8 = [(AVTStickerViewController *)self avatarPicker];
    [v8 setMinimumInteritemSpacing:v7];
  }
  [(AVTStickerViewController *)self updateHeaderSize];
  [(AVTStickerViewController *)self updatePagingControllerInsets];
  unint64_t v9 = [(AVTStickerViewController *)self pagingController];
  [v9 pageContentOffset];
  -[AVTStickerViewController updateHeaderPositionWithContentOffset:](self, "updateHeaderPositionWithContentOffset:");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTStickerViewController;
  [(AVTStickerViewController *)&v3 viewDidLayoutSubviews];
  [(AVTStickerViewController *)self updatePaddleViewLayoutIfNecessary];
}

- (void)setAllowEditing:(BOOL)a3
{
  if (self->_allowEditing != a3)
  {
    BOOL v3 = a3;
    self->_allowEditing = a3;
    id v4 = [(AVTStickerViewController *)self avatarPicker];
    [v4 setAllowEditing:v3];
  }
}

- (void)reloadPickerView
{
  BOOL v3 = [(AVTStickerViewController *)self avatarPickerDataSource];
  [v3 reloadModel];

  id v4 = [(AVTStickerViewController *)self taskScheduler];
  [v4 reloadData];

  uint64_t v5 = [(AVTStickerViewController *)self avatarPicker];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(AVTStickerViewController *)self pagingController];

    if (v7)
    {
      id v8 = [(AVTStickerViewController *)self avatarPicker];
      [v8 reloadData];
    }
  }
}

- (void)reloadData
{
  BOOL v3 = [(AVTStickerViewController *)self avatarPickerDataSource];
  [v3 reloadModel];

  id v4 = [(AVTStickerViewController *)self taskScheduler];
  [v4 reloadData];

  uint64_t v5 = [(AVTStickerViewController *)self avatarPicker];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(AVTStickerViewController *)self pagingController];

    if (v7)
    {
      id v8 = [(AVTStickerViewController *)self avatarPicker];
      [v8 reloadData];

      unint64_t v9 = [(AVTStickerViewController *)self pagingController];
      [v9 reloadData];

      [(AVTStickerViewController *)self selectDefaultAvatarIfNeeded];
    }
  }
}

- (void)selectDefaultAvatarIfNeeded
{
  BOOL v3 = [(AVTStickerViewController *)self avatarPicker];
  if ([v3 indexForSelectedAvatar] == 0x7FFFFFFFFFFFFFFFLL)
  {
  }
  else
  {
    id v4 = [(AVTStickerViewController *)self recordDataSource];
    uint64_t v5 = [v4 numberOfRecords];

    if (!v5) {
      return;
    }
  }
  double v6 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  if (!v6) {
    goto LABEL_6;
  }
  double v7 = [(AVTStickerViewController *)self recordDataSource];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AVTStickerViewController_selectDefaultAvatarIfNeeded__block_invoke;
  v9[3] = &unk_263FF0DB8;
  id v10 = v6;
  uint64_t v8 = [v7 indexOfRecordPassingTest:v9];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_6:
  }
    uint64_t v8 = 0;
  [(AVTStickerViewController *)self selectAvatarRecordAtIndex:v8 hideHeader:0];
}

uint64_t __55__AVTStickerViewController_selectDefaultAvatarIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)selectAvatarRecordAtIndex:(int64_t)a3 hideHeader:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(AVTStickerViewController *)self recordDataSource];
  id v9 = [v7 recordAtIndex:a3];

  uint64_t v8 = [v9 identifier];
  if (v8)
  {
    [(AVTStickerViewController *)self selectRecordForIdentifier:v8];
    if (v4) {
      [(AVTStickerViewController *)self updateScrollToShowAvatarPicker:0];
    }
  }
}

- (void)selectRecordForIdentifier:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(AVTStickerViewController *)self pagingController];
  [v4 selectAvatarRecordWithIdentifier:v7 animated:0];

  uint64_t v5 = [(AVTStickerViewController *)self avatarPicker];
  [v5 selectAvatarRecordWithIdentifier:v7 animated:0];

  double v6 = [(AVTStickerViewController *)self taskScheduler];
  [v6 setSelectedAvatarRecordIdentifier:v7];

  [(AVTStickerViewController *)self setSelectedRecordIdentifier:v7];
}

- (void)updateHeaderSize
{
  BOOL v3 = [(AVTStickerViewController *)self environment];
  char v4 = [v3 deviceIsVision];

  if (v4)
  {
    double v5 = 64.0;
  }
  else
  {
    double v6 = [(AVTStickerViewController *)self view];
    [v6 bounds];
    double v8 = v7;

    id v9 = objc_opt_class();
    id v10 = [(AVTStickerViewController *)self avatarPicker];
    [v10 minimumInteritemSpacing];
    double v12 = v11;
    v13 = [(AVTStickerViewController *)self environment];
    [v9 headerHeightForWidth:v13 interitemSpacing:v8 environment:v12];
    double v5 = v14;
  }
  id v15 = [(AVTStickerViewController *)self environment];
  if ([v15 deviceIsVision]) {
    double v16 = 0.0;
  }
  else {
    double v16 = 10.0;
  }

  id v17 = [(AVTStickerViewController *)self avatarPicker];
  [v17 contentInset];
  double v19 = v18;
  v20 = [(AVTStickerViewController *)self avatarPicker];
  [v20 contentInset];
  double v22 = v5 + v19 + v21;

  id v27 = [(AVTStickerViewController *)self view];
  [v27 bounds];
  double v24 = v23;
  v25 = [(AVTStickerViewController *)self avatarPicker];
  v26 = [v25 view];
  objc_msgSend(v26, "setFrame:", 0.0, v16, v24, v22);
}

- (void)updateHeaderPositionWithContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [(AVTStickerViewController *)self environment];
  if ([v5 deviceIsVision]) {
    double v6 = 0.0;
  }
  else {
    double v6 = 10.0;
  }

  double v7 = [(AVTStickerViewController *)self view];
  [v7 safeAreaInsets];
  double v9 = v6 + v8 - y;

  id v10 = [(AVTStickerViewController *)self avatarPicker];
  double v11 = [v10 view];
  [v11 frame];
  double v12 = -CGRectGetHeight(v24);

  if (v9 < v12) {
    double v9 = v12;
  }
  v13 = [(AVTStickerViewController *)self avatarPicker];
  double v14 = [v13 view];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v22 = [(AVTStickerViewController *)self avatarPicker];
  double v21 = [v22 view];
  objc_msgSend(v21, "setFrame:", v16, v9, v18, v20);
}

- (double)headerMaxY
{
  BOOL v3 = [(AVTStickerViewController *)self environment];
  if ([v3 deviceIsVision]) {
    double v4 = 0.0;
  }
  else {
    double v4 = 10.0;
  }

  double v5 = [(AVTStickerViewController *)self avatarPicker];
  double v6 = [v5 view];
  [v6 frame];
  double v8 = v4 + v7;
  double v9 = [(AVTStickerViewController *)self view];
  [v9 safeAreaInsets];
  double v11 = v8 + v10;
  double v12 = [(AVTStickerViewController *)self avatarPicker];
  [v12 contentInset];
  double v14 = v11 - v13;

  return v14;
}

- (void)updatePagingControllerInsets
{
  [(AVTStickerViewController *)self headerMaxY];
  double v4 = v3;
  id v5 = [(AVTStickerViewController *)self pagingController];
  objc_msgSend(v5, "setPageContentInsets:", v4, 0.0, 0.0, 0.0);
}

- (void)updateScrollToShowAvatarPicker:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(AVTStickerViewController *)self pagingController];
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
    id v9 = v4;
  }
  else
  {
    [(AVTStickerViewController *)self headerMaxY];
    double v8 = v7;
    double v4 = [(AVTStickerViewController *)self pagingController];
    double v5 = 0.0;
    id v9 = v4;
    double v6 = v8;
  }
  objc_msgSend(v4, "setPageContentOffset:", v5, v6);
}

- (void)presentMemojiEditorForCreation
{
  id v2 = [(AVTStickerViewController *)self avatarPicker];
  [v2 presentMemojiEditorForCreation];
}

- (void)stickerControllerDidEnterBackground
{
  double v3 = [(AVTStickerViewController *)self paddleView];

  if (v3)
  {
    id v4 = [(AVTStickerViewController *)self paddleView];
    [v4 pauseVideo];
  }
}

- (void)stickerControllerWillEnterForeground
{
  double v3 = [(AVTStickerViewController *)self paddleView];

  if (v3)
  {
    id v4 = [(AVTStickerViewController *)self paddleView];
    [v4 playVideo];
  }
}

- (void)snapshotInBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  double v5 = [(AVTStickerViewController *)self pagingController];
  [v5 pageContentOffset];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(AVTStickerViewController *)self logger];
  double v11 = [(AVTStickerViewController *)self view];
  [v11 bounds];
  double v12 = NSStringFromCGRect(v17);
  objc_msgSend(v10, "logStickerViewSnapshotForBounds:offset:", v12, v7, v9);

  if (v9 > 0.0)
  {
    double v13 = [(AVTStickerViewController *)self pagingController];
    objc_msgSend(v13, "setPageContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  double v14 = [(AVTStickerViewController *)self view];
  v4[2](v4, v14);

  id v15 = [(AVTStickerViewController *)self pagingController];
  objc_msgSend(v15, "setPageContentOffset:", v7, v9);
}

- (void)clearStickerSelection
{
  id v2 = [(AVTStickerViewController *)self pagingController];
  [v2 clearStickerSelection];
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(AVTStickerViewController *)self pagingController];
  [v7 willEndDisplaying];

  double v8 = [(AVTStickerViewController *)self presenterDelegate];
  [v8 presentAvatarUIController:v6 animated:v4];

  dispatch_time_t v9 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AVTStickerViewController_presentAvatarUIController_animated___block_invoke;
  block[3] = &unk_263FF03D8;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
}

void __63__AVTStickerViewController_presentAvatarUIController_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pagingController];
  [v1 didEndDisplaying];
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AVTStickerViewController *)self pagingController];
  [v5 willStartDisplaying];

  id v6 = [(AVTStickerViewController *)self presenterDelegate];
  [v6 dismissAvatarUIControllerAnimated:v3];
}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  double v7 = [v17 identifier];
  [(AVTStickerViewController *)self setSelectedRecordIdentifier:v7];

  double v8 = [(AVTStickerViewController *)self taskScheduler];
  dispatch_time_t v9 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  [v8 setSelectedAvatarRecordIdentifier:v9];

  double v10 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  AVTUISetStickersLastSelected();

  double v11 = [(AVTStickerViewController *)self environment];
  double v12 = [v11 usageTrackingSession];
  [v12 didChangeCurrentAvatarInStickers:v17];

  id v13 = [(AVTStickerViewController *)self avatarPicker];

  if (v13 == v6) {
    [(AVTStickerViewController *)self pagingController];
  }
  else {
  double v14 = [(AVTStickerViewController *)self avatarPicker];
  }
  BOOL v15 = v13 != v6;
  double v16 = [v17 identifier];
  [v14 selectAvatarRecordWithIdentifier:v16 animated:v15];
}

- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTStickerViewController *)self stickerSelectionDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(AVTStickerViewController *)self stickerSelectionDelegate];
    char v9 = [v8 stickerViewController:self shouldPresentMemojiEditorForSelectedAvatar:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  double v8 = [(AVTStickerViewController *)self pagingController];
  [v8 insertPageForRecord:v7 atIndex:a5];

  [(AVTStickerViewController *)self reloadPickerView];
  char v9 = [v7 identifier];

  [(AVTStickerViewController *)self selectRecordForIdentifier:v9];
  [(AVTStickerViewController *)self updateScrollToShowAvatarPicker:0];
  id v10 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  AVTUISetStickersLastSelected();
}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  double v8 = [(AVTStickerViewController *)self pagingController];
  [v8 reloadPageForRecord:v7 atIndex:a5];

  [(AVTStickerViewController *)self updateScrollToShowAvatarPicker:0];
  [(AVTStickerViewController *)self reloadPickerView];
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  char v9 = [(AVTStickerViewController *)self pagingController];
  [v9 deletePageForRecord:v8 atIndex:a5];

  [(AVTStickerViewController *)self reloadPickerView];
  id v10 = [v14 indexSetForEditableRecords];
  if (![v10 count])
  {
    uint64_t v11 = [MEMORY[0x263F088D0] indexSetWithIndex:0];

    id v10 = (void *)v11;
  }
  double v12 = objc_msgSend(v14, "recordAtIndex:", objc_msgSend(v10, "closestIndexToIndex:greaterIndexesFirst:", a5, 1));
  id v13 = [v12 identifier];
  [(AVTStickerViewController *)self selectRecordForIdentifier:v13];

  [(AVTStickerViewController *)self updateScrollToShowAvatarPicker:0];
}

- (BOOL)shouldPresentPaddleView
{
  if ((AVTUIAlwaysShowPaddleView() & 1) == 0 && (AVTUIHasDisplayedPaddleView() & 1) != 0
    || ![(AVTStickerViewController *)self allowAvatarCreation])
  {
    return 0;
  }
  BOOL v3 = [(AVTStickerViewController *)self paddleView];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)presentPaddleViewIfNeeded
{
  if ([(AVTStickerViewController *)self shouldPresentPaddleView])
  {
    BOOL v3 = [[AVTPaddleView alloc] initWithLayoutDirection:1];
    [(AVTStickerViewController *)self setPaddleView:v3];

    BOOL v4 = [(AVTStickerViewController *)self paddleView];
    [v4 setDelegate:self];

    id v5 = [(AVTStickerViewController *)self view];
    id v6 = [(AVTStickerViewController *)self paddleView];
    [v5 addSubview:v6];

    [(AVTStickerViewController *)self updatePaddleViewLayoutIfNecessary];
    id v7 = [(AVTStickerViewController *)self paddleView];
    [v7 setAlpha:0.0];

    id v8 = [(AVTStickerViewController *)self paddleView];
    [v8 showAnimated:1];

    MEMORY[0x270F10398](1);
  }
}

- (void)updatePaddleViewLayoutIfNecessary
{
  BOOL v3 = [(AVTStickerViewController *)self paddleView];

  if (v3)
  {
    BOOL v4 = [(AVTStickerViewController *)self pagingController];
    id v5 = [v4 view];
    [v5 layoutIfNeeded];

    id v6 = [(AVTStickerViewController *)self avatarPicker];
    id v7 = [v6 view];
    [v7 layoutIfNeeded];

    id v8 = [(AVTStickerViewController *)self avatarPicker];
    id v17 = [v8 viewForAddItem];

    if (v17)
    {
      [v17 bounds];
      double Width = CGRectGetWidth(v19);
      id v10 = [v17 button];
      [v10 bounds];
      double v11 = (Width - CGRectGetWidth(v20)) * 0.5;
      double v12 = [(AVTStickerViewController *)self paddleView];
      [v12 setPadding:v11];

      id v13 = [(AVTStickerViewController *)self pagingController];
      id v14 = [v13 firstPageItemView];

      BOOL v15 = [(AVTStickerViewController *)self paddleView];
      double v16 = [v17 button];
      [v15 updateLayoutFromPlusButtonView:v16 videoView:v14];
    }
  }
}

- (void)dismissPaddleViewIfNecessary
{
  BOOL v3 = [(AVTStickerViewController *)self paddleView];

  if (v3)
  {
    BOOL v4 = [(AVTStickerViewController *)self paddleView];
    [v4 dismissAnimated:1];

    [(AVTStickerViewController *)self setPaddleView:0];
  }
}

- (void)paddleViewTapped:(id)a3
{
  [(AVTStickerViewController *)self dismissPaddleViewIfNecessary];
  [(AVTStickerViewController *)self presentMemojiEditorForCreation];
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
  return (AVTStickerDisclosureValidationDelegate *)WeakRetained;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelegate);
  return (AVTStickerViewControllerImageDelegate *)WeakRetained;
}

- (void)setImageDelegate:(id)a3
{
}

- (AVTStickerSelectionDelegate)stickerSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerSelectionDelegate);
  return (AVTStickerSelectionDelegate *)WeakRetained;
}

- (void)setStickerSelectionDelegate:(id)a3
{
}

- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stickerSheetControllerProvider);
  return (AVTStickerSheetControllerProvider *)WeakRetained;
}

- (void)setStickerSheetControllerProvider:(id)a3
{
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (AVTAvatarStore)store
{
  return self->_store;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)allowPeel
{
  return self->_allowPeel;
}

- (AVTAvatarPickerDataSource)avatarPickerDataSource
{
  return self->_avatarPickerDataSource;
}

- (void)setAvatarPickerDataSource:(id)a3
{
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (void)setAvatarPicker:(id)a3
{
}

- (AVTStickerPagingController)pagingController
{
  return self->_pagingController;
}

- (void)setPagingController:(id)a3
{
}

- (NSString)selectedRecordIdentifier
{
  return self->_selectedRecordIdentifier;
}

- (void)setSelectedRecordIdentifier:(id)a3
{
}

- (AVTPaddleView)paddleView
{
  return self->_paddleView;
}

- (void)setPaddleView:(id)a3
{
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (void)setViewSessionProvider:(id)a3
{
}

- (AVTStickerPack)stickerPacks
{
  return self->_stickerPacks;
}

- (void)setStickerPacks:(id)a3
{
}

- (NSArray)stickerConfigurationNames
{
  return self->_stickerConfigurationNames;
}

- (void)setStickerConfigurationNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, 0);
  objc_storeStrong((id *)&self->_stickerPacks, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_selectedRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_pagingController, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_avatarPickerDataSource, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_stickerSheetControllerProvider);
  objc_destroyWeak((id *)&self->_stickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

- (void)editCurrentMemoji
{
  BOOL v3 = [(AVTStickerViewController *)self pagingController];
  BOOL v4 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  uint64_t v5 = [v3 pageIndexForAvatarRecordIdentifierForPPT:v4];

  id v8 = [(AVTStickerViewController *)self avatarPicker];
  id v6 = [(AVTStickerViewController *)self recordDataSource];
  id v7 = [v6 recordAtIndex:v5];
  [v8 presentActionsForAvatarForPPT:v7];
}

- (void)swipeRightWithDelay:(int64_t)a3 forCompletionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [(AVTStickerViewController *)self pagingController];
  id v8 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  uint64_t v9 = [v7 pageIndexForAvatarRecordIdentifierForPPT:v8];

  unint64_t v10 = v9 + 1;
  double v11 = [(AVTStickerViewController *)self recordDataSource];
  unint64_t v12 = [v11 numberOfRecords];

  if (v10 < v12)
  {
    id v13 = [MEMORY[0x263F088C8] indexPathForItem:v10 inSection:0];
    id v14 = [(AVTStickerViewController *)self pagingController];
    BOOL v15 = [v14 collectionViewForPPT];
    [v15 scrollToItemAtIndexPath:v13 atScrollPosition:8 animated:1];
  }
  if (v6)
  {
    if (a3 < 1)
    {
      v6[2](v6);
    }
    else
    {
      dispatch_time_t v16 = dispatch_time(0, 1000000000 * a3);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__AVTStickerViewController_PPT__swipeRightWithDelay_forCompletionHandler___block_invoke;
      block[3] = &unk_263FF0A00;
      double v18 = v6;
      dispatch_after(v16, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __74__AVTStickerViewController_PPT__swipeRightWithDelay_forCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)swipeLeftWithDelay:(int64_t)a3 forCompletionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [(AVTStickerViewController *)self pagingController];
  id v8 = [(AVTStickerViewController *)self selectedRecordIdentifier];
  uint64_t v9 = [v7 pageIndexForAvatarRecordIdentifierForPPT:v8];

  if (v9 >= 1)
  {
    unint64_t v10 = [MEMORY[0x263F088C8] indexPathForItem:v9 - 1 inSection:0];
    double v11 = [(AVTStickerViewController *)self pagingController];
    unint64_t v12 = [v11 collectionViewForPPT];
    [v12 scrollToItemAtIndexPath:v10 atScrollPosition:8 animated:1];
  }
  if (v6)
  {
    if (a3 < 1)
    {
      v6[2](v6);
    }
    else
    {
      dispatch_time_t v13 = dispatch_time(0, 1000000000 * a3);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__AVTStickerViewController_PPT__swipeLeftWithDelay_forCompletionHandler___block_invoke;
      block[3] = &unk_263FF0A00;
      BOOL v15 = v6;
      dispatch_after(v13, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __73__AVTStickerViewController_PPT__swipeLeftWithDelay_forCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end