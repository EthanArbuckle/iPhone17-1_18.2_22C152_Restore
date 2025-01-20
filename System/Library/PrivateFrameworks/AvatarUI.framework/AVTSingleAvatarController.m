@interface AVTSingleAvatarController
- (AVTAdaptativeLayoutView)view;
- (AVTAvatarDisplayingControllerDelegate)delegate;
- (AVTAvatarRecord)displayedRecord;
- (AVTImageTransitioningContainerView)transitioningContainer;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTRenderingScope)renderingScope;
- (AVTSingleAvatarController)initWithDataSource:(id)a3 environment:(id)a4;
- (AVTTransition)currentTransition;
- (AVTUILogger)logger;
- (AVTViewSession)avtViewSession;
- (BOOL)isViewLoaded;
- (_AVTAvatarRecordImageProvider)thumbnailRenderer;
- (id)liveView;
- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4;
- (void)loadView;
- (void)prepareViewWithLayout:(id)a3;
- (void)setAvtViewSession:(id)a3;
- (void)setCurrentTransition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedRecord:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)setThumbnailRenderer:(id)a3;
- (void)setTransitioningContainer:(id)a3;
- (void)setView:(id)a3;
- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4;
- (void)transitionLiveViewToFront;
- (void)transitionStaticViewToFront;
- (void)transitionToOtherDisplayedRecord;
- (void)transitionToShowingDisplayedRecordWithCompletionHandler:(id)a3;
- (void)updateImageViewWithAVTViewSnapshot;
- (void)updateImageViewWithDisplayedRecord;
- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4;
@end

@implementation AVTSingleAvatarController

- (AVTSingleAvatarController)initWithDataSource:(id)a3 environment:(id)a4
{
  id v5 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTSingleAvatarController;
  v6 = [(AVTSingleAvatarController *)&v14 init];
  if (v6)
  {
    v7 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v5];
    thumbnailRenderer = v6->_thumbnailRenderer;
    v6->_thumbnailRenderer = v7;

    uint64_t v9 = +[AVTRenderingScope listControllerThumbnailScope];
    renderingScope = v6->_renderingScope;
    v6->_renderingScope = (AVTRenderingScope *)v9;

    uint64_t v11 = [v5 logger];
    logger = v6->_logger;
    v6->_logger = (AVTUILogger *)v11;
  }
  return v6;
}

- (AVTAdaptativeLayoutView)view
{
  if (![(AVTSingleAvatarController *)self isViewLoaded])
  {
    [(AVTSingleAvatarController *)self loadView];
    [(AVTSingleAvatarController *)self viewDidLoad];
  }
  view = self->_view;
  return view;
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (void)loadView
{
  v3 = -[AVTImageTransitioningContainerView initWithFrame:]([AVTImageTransitioningContainerView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  [(AVTSingleAvatarController *)self setTransitioningContainer:v3];

  v4 = [AVTAdaptativeLayoutView alloc];
  id v5 = [(AVTSingleAvatarController *)self transitioningContainer];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_super v14 = [(AVTSingleAvatarController *)self transitioningContainer];
  v15 = -[AVTAdaptativeLayoutView initWithFrame:contentView:](v4, "initWithFrame:contentView:", v14, v7, v9, v11, v13);

  [(AVTSingleAvatarController *)self setView:v15];
}

- (void)prepareViewWithLayout:(id)a3
{
  id v4 = a3;
  if (![(AVTSingleAvatarController *)self isViewLoaded]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Hey, you haven't even loaded my view first" format];
  }
  id v5 = [(AVTSingleAvatarController *)self view];
  [v5 setLayout:v4];
}

- (void)useAVTViewFromSession:(id)a3 withLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (![(AVTSingleAvatarController *)self isViewLoaded]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Hey, you haven't even loaded my view first" format];
  }
  double v8 = [(AVTSingleAvatarController *)self displayedRecord];

  if (!v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't show an avatar if you don't give me one"];
  }
  double v9 = [(AVTSingleAvatarController *)self logger];
  double v10 = [v7 avtView];
  double v11 = [v10 description];
  [v9 logSingleModeControllerStartUsingLiveView:v11];

  [(AVTSingleAvatarController *)self setAvtViewSession:v7];
  [v7 aspectRatio];
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVTSingleAvatarController *)self transitioningContainer];
  objc_msgSend(v16, "setAspectRatio:", v13, v15);

  v17 = [(AVTSingleAvatarController *)self view];
  [v17 setLayout:v6];

  v18 = [(AVTSingleAvatarController *)self transitioningContainer];
  v19 = [v7 avtViewContainer];

  [v18 setLiveView:v19];
  v20 = [(AVTSingleAvatarController *)self delegate];
  [v20 willBeginFocus:self];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__AVTSingleAvatarController_useAVTViewFromSession_withLayout___block_invoke;
  v21[3] = &unk_263FF04A0;
  v21[4] = self;
  [(AVTSingleAvatarController *)self transitionToShowingDisplayedRecordWithCompletionHandler:v21];
}

void __62__AVTSingleAvatarController_useAVTViewFromSession_withLayout___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didBeginFocus:*(void *)(a1 + 32)];
}

- (void)stopUsingAVTViewSessionSynchronously:(BOOL)a3 completionHandler:(id)a4
{
  id v13 = a4;
  id v5 = [(AVTSingleAvatarController *)self logger];
  id v6 = [(AVTSingleAvatarController *)self liveView];
  id v7 = [v6 description];
  [v5 logSingleModeControllerStopUsingLiveView:v7];

  double v8 = [(AVTSingleAvatarController *)self delegate];
  [v8 willEndFocus:self];

  double v9 = [(AVTSingleAvatarController *)self delegate];
  [v9 didEndFocus:self];

  double v10 = [(AVTSingleAvatarController *)self currentTransition];
  [v10 cancel];

  [(AVTSingleAvatarController *)self setCurrentTransition:0];
  [(AVTSingleAvatarController *)self updateImageViewWithAVTViewSnapshot];
  double v11 = [(AVTSingleAvatarController *)self transitioningContainer];
  [v11 setLiveView:0];

  [(AVTSingleAvatarController *)self setAvtViewSession:0];
  double v12 = v13;
  if (v13)
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    double v12 = v13;
  }
}

- (void)displayAvatarForRecord:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTSingleAvatarController *)self setDisplayedRecord:v6];
  id v7 = [(AVTSingleAvatarController *)self avtViewSession];
  int v8 = [v7 isActive];

  if (v8) {
    [(AVTSingleAvatarController *)self transitionToOtherDisplayedRecord];
  }
  double v9 = (void *)MEMORY[0x263F1CB60];
  v12[1] = 3221225472;
  v12[0] = MEMORY[0x263EF8330];
  v12[2] = __61__AVTSingleAvatarController_displayAvatarForRecord_animated___block_invoke;
  v12[3] = &unk_263FF0780;
  if (v4) {
    double v10 = 0.3;
  }
  else {
    double v10 = 0.0;
  }
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 animateWithDuration:v12 animations:v10];
}

void __61__AVTSingleAvatarController_displayAvatarForRecord_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 displayingController:*(void *)(a1 + 32) didMoveTowardRecord:*(void *)(a1 + 40) withFactor:1.0];
}

- (void)updateImageViewWithDisplayedRecord
{
  v3 = [(AVTSingleAvatarController *)self displayedRecord];

  if (v3)
  {
    BOOL v4 = [(AVTSingleAvatarController *)self displayedRecord];
    id v5 = [(AVTSingleAvatarController *)self thumbnailRenderer];
    id v6 = [(AVTSingleAvatarController *)self displayedRecord];
    id v7 = [(AVTSingleAvatarController *)self renderingScope];
    int v8 = [v5 providerForRecord:v6 scope:v7];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__AVTSingleAvatarController_updateImageViewWithDisplayedRecord__block_invoke;
    v13[3] = &unk_263FF1998;
    v13[4] = self;
    id v14 = v4;
    double v9 = (uint64_t (*)(void *, void *, uint64_t))v8[2];
    id v10 = v4;
    id v11 = (id)v9(v8, v13, 1);
  }
  else
  {
    id v12 = [(AVTSingleAvatarController *)self transitioningContainer];
    [v12 setStaticImage:0];
  }
}

void __63__AVTSingleAvatarController_updateImageViewWithDisplayedRecord__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) displayedRecord];
  BOOL v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    id v5 = [*(id *)(a1 + 32) transitioningContainer];
    [v5 setStaticImage:v6];
  }
}

- (void)updateImageViewWithAVTViewSnapshot
{
  v3 = [(AVTSingleAvatarController *)self transitioningContainer];
  BOOL v4 = [v3 staticView];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F296E0];
    id v7 = [(AVTSingleAvatarController *)self avtViewSession];
    int v8 = [v7 avtView];
    double v9 = [(AVTSingleAvatarController *)self transitioningContainer];
    id v10 = [v9 staticView];
    id v11 = [(AVTSingleAvatarController *)self logger];
    id v14 = [v6 snapshotAVTView:v8 matchingViewSize:v10 highQuality:1 logger:v11];

    id v12 = [(AVTSingleAvatarController *)self transitioningContainer];
    [v12 setStaticImage:v14];

    id v13 = [(AVTSingleAvatarController *)self transitioningContainer];
    [v13 transitionStaticViewToFront];
  }
  else
  {
    id v14 = [(AVTSingleAvatarController *)self logger];
    [v14 logSingleModeCantSnapshotForLackOfWindow];
  }
}

- (void)transitionToOtherDisplayedRecord
{
  v3 = [(AVTSingleAvatarController *)self avtViewSession];
  char v4 = [v3 isActive];

  if ((v4 & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't transition to other record without an AVTView"];
  }
  [(AVTSingleAvatarController *)self updateImageViewWithAVTViewSnapshot];
  id v5 = [(AVTSingleAvatarController *)self avtViewSession];
  id v6 = [v5 avtViewUpdater];
  id v7 = [(AVTSingleAvatarController *)self displayedRecord];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke;
  v8[3] = &unk_263FF04A0;
  v8[4] = self;
  [v6 setAvatarRecord:v7 completionHandler:v8];
}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    char v4 = *(void **)(a1 + 32);
    id v5 = [v4 displayedRecord];
    [v3 displayingController:v4 didChangeCurrentRecord:v5];

    id v6 = (void *)MEMORY[0x263F1CB60];
    id v7 = [*(id *)(a1 + 32) transitioningContainer];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_2;
    v9[3] = &unk_263FF03D8;
    uint64_t v10 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_3;
    v8[3] = &unk_263FF04A0;
    v8[4] = v10;
    [v6 transitionWithView:v7 duration:0 options:v9 animations:v8 completion:0.3];
  }
}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) transitioningContainer];
  [v1 transitionLiveViewToFront];
}

void __61__AVTSingleAvatarController_transitionToOtherDisplayedRecord__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avtViewSession];
  v3 = [v2 avtView];
  char v4 = [v3 enableFaceTracking];

  if ((v4 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 transitionToShowingDisplayedRecordWithCompletionHandler:0];
  }
}

- (void)transitionToShowingDisplayedRecordWithCompletionHandler:(id)a3
{
  char v4 = (void (**)(id, uint64_t))a3;
  if ([(AVTSingleAvatarController *)self isViewLoaded])
  {
    id v5 = [(AVTSingleAvatarController *)self avtViewSession];
    if (([v5 isActive] & 1) == 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    id v6 = [(AVTSingleAvatarController *)self displayedRecord];

    if (v6)
    {
      id v7 = [(AVTSingleAvatarController *)self avtViewSession];
      id v5 = [v7 avtViewUpdater];

      int v8 = [v5 avatarRecord];
      double v9 = [(AVTSingleAvatarController *)self displayedRecord];
      int v10 = [v8 isEqual:v9];

      if (v10)
      {
        id v11 = [AVTAvatarToLiveTransition alloc];
        id v12 = [(AVTSingleAvatarController *)self logger];
        id v13 = [(AVTAvatarToLiveTransition *)v11 initWithModel:self animated:0 setupHandler:0 completionHandler:&__block_literal_global_33 logger:v12];

        [(AVTTransition *)v13 start];
        if (v4) {
          v4[2](v4, 1);
        }
      }
      else
      {
        [(AVTSingleAvatarController *)self updateImageViewWithDisplayedRecord];
        uint64_t v21 = 0;
        v22 = (id *)&v21;
        uint64_t v23 = 0x3042000000;
        v24 = __Block_byref_object_copy__23;
        v25 = __Block_byref_object_dispose__23;
        id v26 = 0;
        id v14 = [AVTAvatarToLiveTransition alloc];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_17;
        v20[3] = &unk_263FF2FC0;
        v20[4] = self;
        uint64_t v17 = MEMORY[0x263EF8330];
        v19 = &v21;
        v18 = v4;
        double v15 = [(AVTSingleAvatarController *)self logger];
        v16 = [(AVTAvatarToLiveTransition *)v14 initWithModel:self animated:1 setupHandler:v20 completionHandler:&v17 logger:v15];

        objc_storeWeak(v22 + 5, v16);
        [(AVTSingleAvatarController *)self setCurrentTransition:v16];
        [(AVTTransition *)v16 start];

        _Block_object_dispose(&v21, 8);
        objc_destroyWeak(&v26);
      }
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) avtViewSession];
  id v5 = [v4 avtViewUpdater];
  id v6 = [*(id *)(a1 + 32) displayedRecord];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_263FF0620;
  id v9 = v3;
  id v7 = v3;
  [v5 setAvatarRecord:v6 completionHandler:v8];
}

uint64_t __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__AVTSingleAvatarController_transitionToShowingDisplayedRecordWithCompletionHandler___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) transitioningContainer];
    [v3 setStaticImage:0];

    id v4 = [*(id *)(a1 + 32) currentTransition];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

    if (v4 == WeakRetained) {
      [*(id *)(a1 + 32) setCurrentTransition:0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)transitionStaticViewToFront
{
  id v2 = [(AVTSingleAvatarController *)self transitioningContainer];
  [v2 transitionStaticViewToFront];
}

- (void)transitionLiveViewToFront
{
  id v2 = [(AVTSingleAvatarController *)self transitioningContainer];
  [v2 transitionLiveViewToFront];
}

- (id)liveView
{
  id v2 = [(AVTSingleAvatarController *)self avtViewSession];
  id v3 = [v2 avtView];

  return v3;
}

- (AVTAvatarDisplayingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTAvatarDisplayingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (void)setView:(id)a3
{
}

- (AVTImageTransitioningContainerView)transitioningContainer
{
  return self->_transitioningContainer;
}

- (void)setTransitioningContainer:(id)a3
{
}

- (AVTAvatarRecord)displayedRecord
{
  return self->_displayedRecord;
}

- (void)setDisplayedRecord:(id)a3
{
}

- (AVTViewSession)avtViewSession
{
  return self->_avtViewSession;
}

- (void)setAvtViewSession:(id)a3
{
}

- (_AVTAvatarRecordImageProvider)thumbnailRenderer
{
  return self->_thumbnailRenderer;
}

- (void)setThumbnailRenderer:(id)a3
{
}

- (AVTRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderer, 0);
  objc_storeStrong((id *)&self->_avtViewSession, 0);
  objc_storeStrong((id *)&self->_displayedRecord, 0);
  objc_storeStrong((id *)&self->_transitioningContainer, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

@end