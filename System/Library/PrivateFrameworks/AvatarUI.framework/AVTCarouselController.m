@interface AVTCarouselController
+ (id)displayingCarouselForRecordDataSource:(id)a3;
+ (id)recordingCarouselForRecordDataSource:(id)a3;
+ (id)sessionProviderForMode:(int64_t)a3 environment:(id)a4;
- (AVTAvatarDisplayingController)avatarDisplayingController;
- (AVTAvatarRecord)currentAvatarRecord;
- (AVTAvatarRecordDataSource)dataSource;
- (AVTCarouselController)initWithMode:(int64_t)a3 dataSource:(id)a4;
- (AVTCarouselController)initWithMode:(int64_t)a3 sessionProvider:(id)a4 dataSource:(id)a5 environment:(id)a6;
- (AVTDisplayingCarouselControllerDelegate)displayingDelegate;
- (AVTMultiAvatarController)multiAvatarController;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRecordView)focusedRecordingView;
- (AVTRecordingCarouselControllerDelegate)recordingDelegate;
- (AVTSingleAvatarController)singleAvatarController;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTView)focusedDisplayView;
- (AVTViewCarouselLayout)avtViewLayout;
- (AVTViewSession)avtViewSession;
- (AVTViewSessionProvider)avtViewSessionProvider;
- (BOOL)allowsCreate;
- (BOOL)isPostponingBeginSession;
- (BOOL)singleAvatarMode;
- (UIView)avtViewContainer;
- (double)decelerationRate;
- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4;
- (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4;
- (int64_t)mode;
- (void)avatarActionsViewControllerDidFinish:(id)a3;
- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4;
- (void)avatarEditorViewControllerDidCancel:(id)a3;
- (void)beginAVTViewSession;
- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)didBeginFocus:(id)a3;
- (void)displayAvatarRecord:(id)a3 animated:(BOOL)a4;
- (void)displayAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)displayingController:(id)a3 didChangeCurrentRecord:(id)a4;
- (void)displayingController:(id)a3 didMoveTowardRecord:(id)a4 withFactor:(double)a5;
- (void)displayingControllerWantsToPresentEditorForCreation:(id)a3;
- (void)loadView;
- (void)notifyDelegateDidFocusRecord:(id)a3 avtView:(id)a4;
- (void)notifyDelegateDidUpdateWithRecord:(id)a3;
- (void)notifyDelegateNearnessFactorDidChange:(double)a3 towardRecord:(id)a4;
- (void)notifyDelegateWillEndFocusOnRecord:(id)a3 avtView:(id)a4;
- (void)presentActionsForAvatar:(id)a3;
- (void)presentEditorForCreatingAvatar:(id)a3;
- (void)reloadData;
- (void)reloadDataCenteringToAvatarRecord:(id)a3;
- (void)setAllowsCreate:(BOOL)a3;
- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4;
- (void)setAvatarDisplayingController:(id)a3;
- (void)setAvtViewContainer:(id)a3;
- (void)setAvtViewLayout:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setCurrentAvatarRecord:(id)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDisplayingDelegate:(id)a3;
- (void)setIsPostponingBeginSession:(BOOL)a3;
- (void)setMultiAvatarController:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setRecordingDelegate:(id)a3;
- (void)setSingleAvatarController:(id)a3;
- (void)setSingleAvatarMode:(BOOL)a3;
- (void)setSingleAvatarMode:(BOOL)a3 fillContainer:(BOOL)a4 animated:(BOOL)a5;
- (void)setupAVTView:(id)a3;
- (void)showMultiAvatarControllerAnimated:(BOOL)a3;
- (void)showSingleAvatarControllerAnimated:(BOOL)a3;
- (void)significantRecordChangeInDataSource:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEndFocus:(id)a3;
- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTCarouselController

+ (id)sessionProviderForMode:(int64_t)a3 environment:(id)a4
{
  id v5 = a4;
  if (a3 == 1) {
    +[AVTViewSessionProvider creatorForAVTRecordView];
  }
  else {
  v6 = +[AVTViewSessionProvider creatorForAVTView];
  }
  +[AVTViewSessionProvider backingSizeForEnvironment:v5];
  v9 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:]([AVTViewSessionProvider alloc], "initWithAVTViewBackingSize:viewCreator:environment:", v6, v5, v7, v8);

  return v9;
}

+ (id)displayingCarouselForRecordDataSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMode:0 dataSource:v4];

  return v5;
}

+ (id)recordingCarouselForRecordDataSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMode:1 dataSource:v4];

  return v5;
}

- (AVTCarouselController)initWithMode:(int64_t)a3 dataSource:(id)a4
{
  id v6 = a4;
  double v7 = +[AVTUIEnvironment defaultEnvironment];
  double v8 = [(id)objc_opt_class() sessionProviderForMode:a3 environment:v7];
  v9 = [(AVTCarouselController *)self initWithMode:a3 sessionProvider:v8 dataSource:v6 environment:v7];

  return v9;
}

- (AVTCarouselController)initWithMode:(int64_t)a3 sessionProvider:(id)a4 dataSource:(id)a5 environment:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  v13 = (AVTUIEnvironment *)a6;
  v19.receiver = self;
  v19.super_class = (Class)AVTCarouselController;
  v14 = [(AVTCarouselController *)&v19 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_avtViewSessionProvider, a4);
    objc_storeStrong((id *)&v15->_dataSource, a5);
    [(AVTAvatarRecordDataSource *)v15->_dataSource addPriorityObserver:v15];
    uint64_t v16 = [(AVTUIEnvironment *)v13 logger];
    logger = v15->_logger;
    v15->_logger = (AVTUILogger *)v16;

    v15->_environment = v13;
    v15->_singleAvatarMode = 0;
  }

  return v15;
}

- (double)decelerationRate
{
  v2 = [(AVTCarouselController *)self multiAvatarController];
  [v2 decelerationRate];
  double v4 = v3;

  return v4;
}

- (void)setDecelerationRate:(double)a3
{
  id v4 = [(AVTCarouselController *)self multiAvatarController];
  [v4 setDecelerationRate:a3];
}

- (void)loadView
{
  double v3 = [(AVTCarouselController *)self avtViewSessionProvider];
  [v3 avtViewBackingSize];
  id v4 = +[AVTViewCarouselLayout adaptativeLayoutWithAVTViewAspectRatio:"adaptativeLayoutWithAVTViewAspectRatio:"];
  [(AVTCarouselController *)self setAvtViewLayout:v4];

  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  id v9 = (id)objc_msgSend(v5, "initWithFrame:");

  [(AVTCarouselController *)self setView:v9];
  if ([(AVTCarouselController *)self singleAvatarMode]) {
    [(AVTCarouselController *)self showSingleAvatarControllerAnimated:0];
  }
  else {
    [(AVTCarouselController *)self showMultiAvatarControllerAnimated:0];
  }
  double v7 = [(AVTCarouselController *)self avatarDisplayingController];
  double v8 = [(AVTCarouselController *)self avtViewLayout];
  [v7 prepareViewWithLayout:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTCarouselController;
  [(AVTCarouselController *)&v4 viewWillAppear:a3];
  [(AVTCarouselController *)self beginAVTViewSession];
  [(AVTCarouselController *)self reloadData];
}

- (void)beginAVTViewSession
{
  if (![(AVTCarouselController *)self isPostponingBeginSession])
  {
    double v3 = [(AVTCarouselController *)self avtViewSession];

    if (!v3)
    {
      objc_initWeak(&location, self);
      objc_super v4 = [(AVTCarouselController *)self avtViewSessionProvider];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke;
      v8[3] = &unk_263FF0428;
      objc_copyWeak(&v9, &location);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke_2;
      v6[3] = &unk_263FF0450;
      objc_copyWeak(&v7, &location);
      id v5 = [v4 sessionWithDidBecomeActiveHandler:v8 tearDownHandler:v6];
      [(AVTCarouselController *)self setAvtViewSession:v5];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __44__AVTCarouselController_beginAVTViewSession__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v4 = [v3 avtView];
  [WeakRetained setupAVTView:v4];

  [WeakRetained setAvtViewSession:v3];
  id v5 = [v3 avtViewContainer];
  [WeakRetained setAvtViewContainer:v5];

  id v6 = [WeakRetained avatarDisplayingController];
  id v7 = [WeakRetained avtViewLayout];
  [v6 useAVTViewFromSession:v3 withLayout:v7];

  double v8 = [WeakRetained avtViewSessionProvider];
  id v9 = [v8 faceTrackingManager];
  [v9 setFaceTrackingManagementPaused:1];
}

void __44__AVTCarouselController_beginAVTViewSession__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained avatarDisplayingController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__AVTCarouselController_beginAVTViewSession__block_invoke_3;
  v8[3] = &unk_263FF1368;
  void v8[4] = WeakRetained;
  id v9 = v4;
  id v7 = v4;
  [v6 stopUsingAVTViewSessionSynchronously:0 completionHandler:v8];
}

uint64_t __44__AVTCarouselController_beginAVTViewSession__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avtViewContainer];
  [v2 setAlpha:1.0];

  [*(id *)(a1 + 32) setAvtViewContainer:0];
  [*(id *)(a1 + 32) setAvtViewSession:0];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)setupAVTView:(id)a3
{
  id v6 = a3;
  [v6 setEnableFaceTracking:1];
  id v4 = [(AVTCarouselController *)self view];
  id v5 = [v4 backgroundColor];
  [v6 setBackgroundColor:v5];

  if (AVTUIShowPerfHUD_once()) {
    [v6 setShowPerfHUD:1];
  }
  [v6 setEnableReticle:1];
}

- (void)setIsPostponingBeginSession:(BOOL)a3
{
  if (self->_isPostponingBeginSession != a3)
  {
    self->_isPostponingBeginSession = a3;
    if (!a3)
    {
      [(AVTCarouselController *)self beginAVTViewSession];
      [(AVTCarouselController *)self reloadData];
    }
  }
}

- (void)reloadData
{
  id v3 = [(AVTCarouselController *)self currentAvatarRecord];
  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v3];
}

- (void)reloadDataCenteringToAvatarRecord:(id)a3
{
  id v5 = a3;
  id v4 = [(AVTCarouselController *)self avatarDisplayingController];
  [v4 reloadData];

  [(AVTCarouselController *)self displayAvatarRecord:v5 animated:0];
}

- (void)setSingleAvatarMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AVTCarouselController *)self avtViewLayout];
  -[AVTCarouselController setSingleAvatarMode:fillContainer:animated:](self, "setSingleAvatarMode:fillContainer:animated:", v3, [v5 fillContainer], 0);
}

- (void)setSingleAvatarMode:(BOOL)a3 fillContainer:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = [(AVTCarouselController *)self avtViewLayout];
  [v9 setFillContainer:v6];

  if (self->_singleAvatarMode != v7)
  {
    self->_singleAvatarMode = v7;
    v10 = [(AVTCarouselController *)self logger];
    id v11 = v10;
    if (v7)
    {
      [v10 logCarouselChangingToSingleMode];

      [(AVTCarouselController *)self showSingleAvatarControllerAnimated:v5];
    }
    else
    {
      [v10 logCarouselChangingToMultiMode];

      [(AVTCarouselController *)self showMultiAvatarControllerAnimated:v5];
    }
  }
}

- (void)displayAvatarRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(AVTCarouselController *)self dataSource];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__AVTCarouselController_displayAvatarRecordWithIdentifier_animated___block_invoke;
  v14[3] = &unk_263FF0DB8;
  id v8 = v6;
  id v15 = v8;
  id v9 = [v7 indexesOfRecordsPassingTest:v14];

  if ([v9 count] == 1)
  {
    v10 = [(AVTCarouselController *)self dataSource];
    id v11 = objc_msgSend(v10, "recordAtIndex:", objc_msgSend(v9, "firstIndex"));

    [(AVTCarouselController *)self displayAvatarRecord:v11 animated:v4];
  }
  else
  {
    id v11 = [(AVTCarouselController *)self environment];
    id v12 = [v11 logger];
    v13 = [NSString stringWithFormat:@"Can't fetch record with ID %@, err: %@", v8, 0];
    [v12 logErrorFetchingRecords:v13];
  }
}

uint64_t __68__AVTCarouselController_displayAvatarRecordWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)displayAvatarRecord:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTCarouselController *)self setCurrentAvatarRecord:v6];
  id v7 = [(AVTCarouselController *)self avatarDisplayingController];
  [v7 displayAvatarForRecord:v6 animated:v4];
}

- (BOOL)allowsCreate
{
  v2 = [(AVTCarouselController *)self multiAvatarController];
  char v3 = [v2 allowsCreate];

  return v3;
}

- (void)setAllowsCreate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVTCarouselController *)self multiAvatarController];
  [v4 setAllowsCreate:v3 animated:0];
}

- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(AVTCarouselController *)self multiAvatarController];
  [v6 setAllowsCreate:v5 animated:v4];
}

- (void)showMultiAvatarControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AVTCarouselController *)self multiAvatarController];

  if (!v5)
  {
    id v6 = [AVTMultiAvatarController alloc];
    id v7 = [(AVTCarouselController *)self dataSource];
    id v8 = [(AVTCarouselController *)self environment];
    id v9 = [(AVTMultiAvatarController *)v6 initWithDataSource:v7 environment:v8];

    [(AVTMultiAvatarController *)v9 setDelegate:self];
    v10 = [(AVTMultiAvatarController *)v9 view];
    [v10 setAutoresizingMask:18];

    [(AVTCarouselController *)self setMultiAvatarController:v9];
  }
  id v11 = [(AVTCarouselController *)self singleAvatarController];

  id v12 = [(AVTCarouselController *)self view];
  v13 = [(AVTCarouselController *)self multiAvatarController];
  v14 = [v13 view];
  if (v11)
  {
    id v15 = [(AVTCarouselController *)self singleAvatarController];
    uint64_t v16 = [v15 view];
    [v12 insertSubview:v14 aboveSubview:v16];
  }
  else
  {
    [v12 insertSubview:v14 atIndex:0];
  }

  v17 = [(AVTCarouselController *)self multiAvatarController];
  [(AVTCarouselController *)self setAvatarDisplayingController:v17];

  v18 = [(AVTCarouselController *)self view];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(AVTCarouselController *)self avatarDisplayingController];
  v28 = [v27 view];
  objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

  v29 = [(AVTCarouselController *)self avatarDisplayingController];
  [v29 reloadData];

  v30 = [(AVTCarouselController *)self avatarDisplayingController];
  v31 = [(AVTCarouselController *)self currentAvatarRecord];
  [v30 displayAvatarForRecord:v31 animated:0];

  v32 = [(AVTCarouselController *)self singleAvatarController];
  id v49 = 0;
  [v32 prepareToTransitionToVisible:0 completionHandler:&v49];
  id v33 = v49;

  v34 = [(AVTCarouselController *)self multiAvatarController];
  id v48 = 0;
  [v34 prepareToTransitionToVisible:1 completionHandler:&v48];
  id v35 = v48;

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke;
  v47[3] = &unk_263FF03D8;
  v47[4] = self;
  v36 = (void (**)(void))MEMORY[0x210530210](v47);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_2;
  v44[3] = &unk_263FF2068;
  id v37 = v33;
  id v45 = v37;
  id v38 = v35;
  id v46 = v38;
  v44[4] = self;
  v39 = (void (**)(void))MEMORY[0x210530210](v44);
  v40 = v39;
  if (v3)
  {
    v41 = (void *)MEMORY[0x263F1CB60];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_3;
    v42[3] = &unk_263FF0620;
    v43 = v39;
    [v41 animateWithDuration:v36 animations:v42 completion:0.3];
  }
  else
  {
    v36[2](v36);
    v40[2](v40);
  }
}

void __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avatarDisplayingController];
  v1 = [v2 view];
  [v1 setAlpha:1.0];
}

void __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) singleAvatarController];
  [v4 stopUsingAVTViewSessionSynchronously:1 completionHandler:0];

  BOOL v5 = [*(id *)(a1 + 32) avtViewSession];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) avatarDisplayingController];
    id v7 = [*(id *)(a1 + 32) avtViewSession];
    id v8 = [*(id *)(a1 + 32) avtViewLayout];
    [v6 useAVTViewFromSession:v7 withLayout:v8];
  }
  id v9 = [*(id *)(a1 + 32) singleAvatarController];
  v10 = [v9 view];
  id v11 = [v10 superview];
  id v12 = [*(id *)(a1 + 32) view];

  if (v11 == v12)
  {
    id v14 = [*(id *)(a1 + 32) singleAvatarController];
    v13 = [v14 view];
    [v13 removeFromSuperview];
  }
}

uint64_t __59__AVTCarouselController_showMultiAvatarControllerAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)showSingleAvatarControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AVTCarouselController *)self singleAvatarController];

  if (!v5)
  {
    id v6 = [AVTSingleAvatarController alloc];
    id v7 = [(AVTCarouselController *)self dataSource];
    id v8 = [(AVTCarouselController *)self environment];
    id v9 = [(AVTSingleAvatarController *)v6 initWithDataSource:v7 environment:v8];

    [(AVTSingleAvatarController *)v9 setDelegate:self];
    v10 = [(AVTSingleAvatarController *)v9 view];
    [v10 setAutoresizingMask:18];

    [(AVTCarouselController *)self setSingleAvatarController:v9];
  }
  id v11 = [(AVTCarouselController *)self view];
  id v12 = [(AVTCarouselController *)self singleAvatarController];
  v13 = [v12 view];
  [v11 insertSubview:v13 atIndex:0];

  id v14 = [(AVTCarouselController *)self avatarDisplayingController];
  [v14 stopUsingAVTViewSessionSynchronously:1 completionHandler:0];

  id v15 = [(AVTCarouselController *)self singleAvatarController];
  [(AVTCarouselController *)self setAvatarDisplayingController:v15];

  uint64_t v16 = [(AVTCarouselController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [(AVTCarouselController *)self avatarDisplayingController];
  double v26 = [v25 view];
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  v27 = [(AVTCarouselController *)self avatarDisplayingController];
  [v27 reloadData];

  v28 = [(AVTCarouselController *)self avatarDisplayingController];
  v29 = [(AVTCarouselController *)self currentAvatarRecord];
  [v28 displayAvatarForRecord:v29 animated:0];

  v30 = [(AVTCarouselController *)self multiAvatarController];
  id v53 = 0;
  [v30 prepareToTransitionToVisible:0 completionHandler:&v53];
  id v31 = v53;

  v32 = [(AVTCarouselController *)self singleAvatarController];
  id v52 = 0;
  [v32 prepareToTransitionToVisible:1 completionHandler:&v52];
  id v33 = v52;

  v34 = [(AVTCarouselController *)self avtViewSession];

  if (v34)
  {
    id v35 = [(AVTCarouselController *)self avatarDisplayingController];
    v36 = [(AVTCarouselController *)self avtViewSession];
    id v37 = [(AVTCarouselController *)self avtViewLayout];
    [v35 useAVTViewFromSession:v36 withLayout:v37];
  }
  id v38 = [(AVTCarouselController *)self avatarDisplayingController];
  v39 = [v38 view];
  [v39 setAlpha:1.0];

  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke;
  v51[3] = &unk_263FF03D8;
  v51[4] = self;
  v40 = (void (**)(void))MEMORY[0x210530210](v51);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_2;
  v48[3] = &unk_263FF2068;
  id v41 = v31;
  id v49 = v41;
  id v42 = v33;
  id v50 = v42;
  v48[4] = self;
  v43 = (void (**)(void))MEMORY[0x210530210](v48);
  v44 = v43;
  if (v3)
  {
    id v45 = (void *)MEMORY[0x263F1CB60];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_3;
    v46[3] = &unk_263FF0620;
    v47 = v43;
    [v45 animateWithDuration:v40 animations:v46 completion:0.3];
  }
  else
  {
    v40[2](v40);
    v44[2](v44);
  }
}

void __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) multiAvatarController];
  v1 = [v2 view];
  [v1 setAlpha:0.0];
}

void __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) multiAvatarController];
  BOOL v5 = [v4 view];
  id v6 = [v5 superview];
  id v7 = [*(id *)(a1 + 32) view];

  if (v6 == v7)
  {
    id v9 = [*(id *)(a1 + 32) multiAvatarController];
    id v8 = [v9 view];
    [v8 removeFromSuperview];
  }
}

uint64_t __60__AVTCarouselController_showSingleAvatarControllerAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)presentEditorForCreatingAvatar:(id)a3
{
  BOOL v4 = [(AVTCarouselController *)self dataSource];
  id v7 = [v4 internalRecordStore];

  BOOL v5 = [(AVTCarouselController *)self avtViewSessionProvider];
  id v6 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v7 avtViewSessionProvider:v5];

  [v6 setDelegate:self];
  [(AVTCarouselController *)self wrapAndPresentViewController:v6 animated:1];
}

- (void)presentActionsForAvatar:(id)a3
{
  id v4 = a3;
  if (([v4 isEditable] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Record %@ is not editable!", v4 format];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
  }
  id v17 = v4;
  BOOL v5 = [AVTAvatarActionsProvider alloc];
  id v6 = [(AVTCarouselController *)self dataSource];
  id v7 = [(AVTAvatarActionsProvider *)v5 initWithAvatarRecord:v17 dataSource:v6 allowCreate:0];

  id v8 = [AVTAvatarInlineActionsController alloc];
  id v9 = [(AVTCarouselController *)self dataSource];
  v10 = [(AVTCarouselController *)self avtViewSessionProvider];
  id v11 = [(AVTCarouselController *)self environment];
  id v12 = [(AVTAvatarInlineActionsController *)v8 initWithDataSource:v9 avtViewProvider:v10 environment:v11];

  [(AVTAvatarInlineActionsController *)v12 updateWithActionsModel:v7];
  v13 = [AVTAvatarActionsViewController alloc];
  id v14 = [(AVTCarouselController *)self avtViewSessionProvider];
  id v15 = [(AVTCarouselController *)self environment];
  uint64_t v16 = [(AVTAvatarActionsViewController *)v13 initWithAVTViewSessionProvider:v14 actionsController:v12 environment:v15];

  [(AVTAvatarActionsViewController *)v16 setDelegate:self];
  [(AVTCarouselController *)self wrapAndPresentViewController:v16 animated:1];
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(AVTCarouselController *)self presenterDelegate];
  [v5 presentAvatarUIController:v6 animated:1];
}

- (void)didBeginFocus:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTCarouselController *)self avatarDisplayingController];

  if (v5 == v4)
  {
    id v6 = [(AVTCarouselController *)self environment];
    id v7 = [v6 usageTrackingSession];
    id v8 = [(AVTCarouselController *)self currentAvatarRecord];
    [v7 didStartFaceTrackingInCarouselWithAvatar:v8];

    id v11 = [(AVTCarouselController *)self currentAvatarRecord];
    id v9 = [(AVTCarouselController *)self avtViewSession];
    v10 = [v9 avtView];
    [(AVTCarouselController *)self notifyDelegateDidFocusRecord:v11 avtView:v10];
  }
}

- (void)willEndFocus:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTCarouselController *)self avatarDisplayingController];

  if (v5 == v4)
  {
    id v6 = [(AVTCarouselController *)self environment];
    id v7 = [v6 usageTrackingSession];
    [v7 didStopFaceTrackingInCarousel];

    id v10 = [(AVTCarouselController *)self currentAvatarRecord];
    id v8 = [(AVTCarouselController *)self avtViewSession];
    id v9 = [v8 avtView];
    [(AVTCarouselController *)self notifyDelegateWillEndFocusOnRecord:v10 avtView:v9];
  }
}

- (void)displayingController:(id)a3 didChangeCurrentRecord:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(AVTCarouselController *)self avatarDisplayingController];

  if (v7 == v6)
  {
    [(AVTCarouselController *)self setCurrentAvatarRecord:v10];
    id v8 = [(AVTCarouselController *)self environment];
    id v9 = [v8 usageTrackingSession];
    [v9 didChangeCurrentAvatarInCarousel:v10];

    [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v10];
  }
}

- (void)displayingControllerWantsToPresentEditorForCreation:(id)a3
{
  id v7 = a3;
  id v4 = [(AVTCarouselController *)self avatarDisplayingController];

  id v5 = v7;
  if (v4 == v7)
  {
    id v6 = [v7 view];
    [(AVTCarouselController *)self presentEditorForCreatingAvatar:v6];

    id v5 = v7;
  }
}

- (void)displayingController:(id)a3 didMoveTowardRecord:(id)a4 withFactor:(double)a5
{
  id v10 = a4;
  id v8 = a3;
  id v9 = [(AVTCarouselController *)self avatarDisplayingController];

  if (v9 == v8) {
    [(AVTCarouselController *)self notifyDelegateNearnessFactorDidChange:v10 towardRecord:a5];
  }
}

- (void)notifyDelegateDidFocusRecord:(id)a3 avtView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTCarouselController *)self environment];
  id v9 = [v8 logger];
  id v10 = [v6 description];
  [v9 logCarouselDelegateDidFocusRecord:v10];

  int64_t v11 = [(AVTCarouselController *)self mode];
  if (v11 == 1)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__14;
    id v31 = __Block_byref_object_dispose__14;
    id v32 = 0;
    if (v6)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __62__AVTCarouselController_notifyDelegateDidFocusRecord_avtView___block_invoke;
      v26[3] = &unk_263FF2090;
      v26[4] = &v27;
      [v7 downcastWithAVTViewHandler:0 recordViewHandler:v26];
    }
    double v20 = [(AVTCarouselController *)self recordingDelegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      double v22 = [(AVTCarouselController *)self recordingDelegate];
      [v22 carouselController:self didFocusOnRecordView:v28[5]];
    }
    double v23 = [(AVTCarouselController *)self recordingDelegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      double v25 = [(AVTCarouselController *)self recordingDelegate];
      [v25 carouselController:self didUpdateWithRecord:v6];
    }
    _Block_object_dispose(&v27, 8);
  }
  else if (!v11)
  {
    if (v6) {
      id v12 = v7;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    id v14 = [(AVTCarouselController *)self displayingDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(AVTCarouselController *)self displayingDelegate];
      [v16 carouselController:self didFocusOnView:v13];
    }
    id v17 = [(AVTCarouselController *)self displayingDelegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      double v19 = [(AVTCarouselController *)self displayingDelegate];
      [v19 carouselController:self didUpdateWithRecord:v6];
    }
  }
}

void __62__AVTCarouselController_notifyDelegateDidFocusRecord_avtView___block_invoke(uint64_t a1, void *a2)
{
}

- (void)notifyDelegateWillEndFocusOnRecord:(id)a3 avtView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVTCarouselController *)self environment];
  id v9 = [v8 logger];
  id v10 = [v6 description];
  [v9 logCarouselDelegateWillEndFocusRecord:v10];

  int64_t v11 = [(AVTCarouselController *)self mode];
  if (v11 == 1)
  {
    uint64_t v21 = 0;
    double v22 = &v21;
    uint64_t v23 = 0x3032000000;
    char v24 = __Block_byref_object_copy__14;
    double v25 = __Block_byref_object_dispose__14;
    id v26 = 0;
    if (v6)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __68__AVTCarouselController_notifyDelegateWillEndFocusOnRecord_avtView___block_invoke;
      v20[3] = &unk_263FF2090;
      v20[4] = &v21;
      [v7 downcastWithAVTViewHandler:0 recordViewHandler:v20];
    }
    id v17 = [(AVTCarouselController *)self recordingDelegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      double v19 = [(AVTCarouselController *)self recordingDelegate];
      [v19 carouselController:self willEndFocusOnRecordView:v22[5]];
    }
    _Block_object_dispose(&v21, 8);
  }
  else if (!v11)
  {
    if (v6) {
      id v12 = v7;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    id v14 = [(AVTCarouselController *)self displayingDelegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(AVTCarouselController *)self displayingDelegate];
      [v16 carouselController:self willEndFocusOnView:v13];
    }
  }
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v6];
}

void __68__AVTCarouselController_notifyDelegateWillEndFocusOnRecord_avtView___block_invoke(uint64_t a1, void *a2)
{
}

- (void)notifyDelegateNearnessFactorDidChange:(double)a3 towardRecord:(id)a4
{
  id v21 = a4;
  id v6 = [(AVTCarouselController *)self environment];
  id v7 = [v6 logger];
  objc_msgSend(v7, "logCarouselDelegateNearnessFactorDidChange:towardRecord:editable:", v21 != 0, objc_msgSend(v21, "isEditable"), a3);

  int64_t v8 = [(AVTCarouselController *)self mode];
  if (v8 == 1)
  {
    char v15 = [(AVTCarouselController *)self recordingDelegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(AVTCarouselController *)self recordingDelegate];
      [v17 carouselController:self didMoveTowardRecord:v21 withFactor:a3];
    }
    char v18 = [(AVTCarouselController *)self recordingDelegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v14 = [(AVTCarouselController *)self recordingDelegate];
      goto LABEL_11;
    }
  }
  else if (!v8)
  {
    id v9 = [(AVTCarouselController *)self displayingDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int64_t v11 = [(AVTCarouselController *)self displayingDelegate];
      [v11 carouselController:self didMoveTowardRecord:v21 withFactor:a3];
    }
    id v12 = [(AVTCarouselController *)self displayingDelegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [(AVTCarouselController *)self displayingDelegate];
LABEL_11:
      double v20 = v14;
      [v14 carouselController:self didMoveToNearestRecord:v21 withFactor:a3];
    }
  }
}

- (void)notifyDelegateDidUpdateWithRecord:(id)a3
{
  id v14 = a3;
  id v4 = [(AVTCarouselController *)self environment];
  id v5 = [v4 logger];
  id v6 = [v14 description];
  [v5 logCarouselDelegateDidUpdateRecord:v6];

  int64_t v7 = [(AVTCarouselController *)self mode];
  if (v7 == 1)
  {
    int64_t v11 = [(AVTCarouselController *)self recordingDelegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_8;
    }
    char v10 = [(AVTCarouselController *)self recordingDelegate];
    goto LABEL_7;
  }
  if (!v7)
  {
    int64_t v8 = [(AVTCarouselController *)self displayingDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      char v10 = [(AVTCarouselController *)self displayingDelegate];
LABEL_7:
      char v13 = v10;
      [v10 carouselController:self didUpdateWithRecord:v14];
    }
  }
LABEL_8:
}

- (AVTRecordView)focusedRecordingView
{
  if ([(AVTCarouselController *)self mode] == 1
    && ([(AVTCarouselController *)self avtViewSession],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isActive],
        v3,
        v4))
  {
    uint64_t v10 = 0;
    int64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    char v13 = __Block_byref_object_copy__14;
    id v14 = __Block_byref_object_dispose__14;
    id v15 = 0;
    id v5 = [(AVTCarouselController *)self avtViewSession];
    id v6 = [v5 avtView];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__AVTCarouselController_focusedRecordingView__block_invoke;
    v9[3] = &unk_263FF2090;
    v9[4] = &v10;
    [v6 downcastWithAVTViewHandler:0 recordViewHandler:v9];

    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = 0;
  }
  return (AVTRecordView *)v7;
}

void __45__AVTCarouselController_focusedRecordingView__block_invoke(uint64_t a1, void *a2)
{
}

- (AVTView)focusedDisplayView
{
  if ([(AVTCarouselController *)self mode]
    || ([(AVTCarouselController *)self avtViewSession],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isActive],
        v3,
        !v4))
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    int64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    char v13 = __Block_byref_object_copy__14;
    id v14 = __Block_byref_object_dispose__14;
    id v15 = 0;
    id v5 = [(AVTCarouselController *)self avtViewSession];
    id v6 = [v5 avtView];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__AVTCarouselController_focusedDisplayView__block_invoke;
    v9[3] = &unk_263FF20B8;
    v9[4] = &v10;
    [v6 downcastWithAVTViewHandler:v9 recordViewHandler:0];

    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return (AVTView *)v7;
}

void __43__AVTCarouselController_focusedDisplayView__block_invoke(uint64_t a1, void *a2)
{
}

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v6];
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v6];
}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v6];
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v6];
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  int64_t v8 = [(AVTCarouselController *)self dataSource];
  id v12 = [v8 indexSetForEditableRecords];

  if ([v12 count])
  {
    char v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F088D0] indexSetWithIndex:0];

    char v9 = (void *)v10;
  }
  id v13 = v9;
  int64_t v11 = objc_msgSend(v7, "recordAtIndex:", objc_msgSend(v9, "closestIndexToIndex:greaterIndexesFirst:", a5, 1));

  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v11];
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v11];
}

- (void)significantRecordChangeInDataSource:(id)a3
{
  int v4 = [(AVTCarouselController *)self dataSource];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__AVTCarouselController_significantRecordChangeInDataSource___block_invoke;
  v9[3] = &unk_263FF0DB8;
  v9[4] = self;
  uint64_t v5 = [v4 indexOfRecordPassingTest:v9];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = [(AVTCarouselController *)self dataSource];
  int64_t v8 = [v7 recordAtIndex:v6];

  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v8];
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v8];
}

uint64_t __61__AVTCarouselController_significantRecordChangeInDataSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 currentAvatarRecord];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v3 identifier];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

- (id)avatarActionsViewController:(id)a3 recordUpdateForDeletingRecord:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AVTCarouselController *)self dataSource];
  uint64_t v7 = +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:v5 withDataSource:v6];

  return v7;
}

- (void)avatarActionsViewControllerDidFinish:(id)a3
{
  int v4 = [(AVTCarouselController *)self presenterDelegate];
  [v4 dismissAvatarUIControllerAnimated:1];

  [(AVTCarouselController *)self beginAVTViewSession];
}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v5 = a4;
  [(AVTCarouselController *)self reloadDataCenteringToAvatarRecord:v5];
  [(AVTCarouselController *)self notifyDelegateDidUpdateWithRecord:v5];

  uint64_t v6 = [(AVTCarouselController *)self presenterDelegate];
  [v6 dismissAvatarUIControllerAnimated:1];

  [(AVTCarouselController *)self beginAVTViewSession];
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  int v4 = [(AVTCarouselController *)self presenterDelegate];
  [v4 dismissAvatarUIControllerAnimated:1];

  [(AVTCarouselController *)self beginAVTViewSession];
}

- (id)snapshotProviderFocusedOnRecordWithIdentifier:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  int64_t v8 = [(AVTCarouselController *)self avtViewSessionProvider];
  [v8 avtViewBackingSize];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(AVTCarouselController *)self dataSource];
  id v14 = [(AVTCarouselController *)self environment];
  id v15 = +[AVTMultiAvatarController snapshotProviderFocusedOnRecordWithIdentifier:size:avtViewAspectRatio:dataSource:environment:](AVTMultiAvatarController, "snapshotProviderFocusedOnRecordWithIdentifier:size:avtViewAspectRatio:dataSource:environment:", v7, v13, v14, width, height, v10, v12);

  return v15;
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (AVTDisplayingCarouselControllerDelegate)displayingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayingDelegate);
  return (AVTDisplayingCarouselControllerDelegate *)WeakRetained;
}

- (void)setDisplayingDelegate:(id)a3
{
}

- (AVTRecordingCarouselControllerDelegate)recordingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->recordingDelegate);
  return (AVTRecordingCarouselControllerDelegate *)WeakRetained;
}

- (void)setRecordingDelegate:(id)a3
{
}

- (BOOL)singleAvatarMode
{
  return self->_singleAvatarMode;
}

- (BOOL)isPostponingBeginSession
{
  return self->_isPostponingBeginSession;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarRecord)currentAvatarRecord
{
  return self->_currentAvatarRecord;
}

- (void)setCurrentAvatarRecord:(id)a3
{
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (AVTMultiAvatarController)multiAvatarController
{
  return self->_multiAvatarController;
}

- (void)setMultiAvatarController:(id)a3
{
}

- (AVTSingleAvatarController)singleAvatarController
{
  return self->_singleAvatarController;
}

- (void)setSingleAvatarController:(id)a3
{
}

- (AVTAvatarDisplayingController)avatarDisplayingController
{
  return self->_avatarDisplayingController;
}

- (void)setAvatarDisplayingController:(id)a3
{
}

- (AVTViewCarouselLayout)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void)setAvtViewLayout:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayout, 0);
  objc_storeStrong((id *)&self->_avatarDisplayingController, 0);
  objc_storeStrong((id *)&self->_singleAvatarController, 0);
  objc_storeStrong((id *)&self->_multiAvatarController, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avtViewContainer, 0);
  objc_storeStrong((id *)&self->_currentAvatarRecord, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->recordingDelegate);
  objc_destroyWeak((id *)&self->displayingDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

@end