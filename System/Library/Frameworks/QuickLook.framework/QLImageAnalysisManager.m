@interface QLImageAnalysisManager
+ (BOOL)shouldStartImageAnalysisForPresentationMode:(unint64_t)a3;
- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3;
- (BOOL)addInteractionIfNeeded;
- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3;
- (BOOL)hasActiveTextSelection;
- (BOOL)hasAnalysis;
- (BOOL)hasResultsForVisualSearch;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3;
- (BOOL)isAnalysisOngoing;
- (BOOL)isImageSubjectHighlightingEnabled;
- (BOOL)isInteractionActive;
- (BOOL)isTextSelectionEnabled;
- (BOOL)isVisualSearchEnabled;
- (BOOL)shouldEnterVisualSearchAfterNextAnalysis;
- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis;
- (BOOL)shouldUpliftSubjectAfterNextAnalysis;
- (BOOL)textExistsAtPoint:(CGPoint)a3;
- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3;
- (QLImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4;
- (QLImageAnalysisManagerDelegate)delegate;
- (QLToolbarButton)imageAnalysisToolbarButton;
- (VKCImageAnalysisInteraction)imageInteraction;
- (VKCImageAnalyzer)imageAnalyzer;
- (id)image;
- (id)imageAnalysisQueue;
- (id)infoButtonGlyphName;
- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3;
- (int)imageAnalysisRequestId;
- (unint64_t)_defaultInteractionTypes;
- (void)_activateInteractionTypes:(unint64_t)a3;
- (void)_handleImageAnalysis:(id)a3 error:(id)a4;
- (void)_setupAnalysisButtonsContainerInView:(id)a3;
- (void)_setupImageAnalysis;
- (void)_setupNotificationsObservation;
- (void)_startImageAnalysisWithRequest:(id)a3;
- (void)_updateAnalysisButtonContainerWithAnimation:(BOOL)a3;
- (void)_updateAnalysisButtonWithAnimation:(BOOL)a3;
- (void)_updateInfoButtonWithAnimation:(BOOL)a3;
- (void)activateVisualSearchInteraction;
- (void)adjustImageInteractionForScrollView:(id)a3;
- (void)cancelAllRequests;
- (void)dealloc;
- (void)enableMarkupMode:(BOOL)a3;
- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5;
- (void)imageAnalysisPopoverDidDisappear;
- (void)imageAnalysisPopoverWillAppear;
- (void)infoButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setImageAnalysisRequestId:(int)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setImageInteraction:(id)a3;
- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3;
- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3;
- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3;
- (void)setupAnalysisButtonsContainer;
- (void)shouldHideInteraction:(BOOL)a3 animated:(BOOL)a4;
- (void)startImageAnalysis;
- (void)stopImageAnalysis;
- (void)updateBottomRightContainerPositionForImageView:(id)a3 view:(id)a4;
- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation QLImageAnalysisManager

- (QLImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLImageAnalysisManager;
  v8 = [(QLImageAnalysisManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(QLImageAnalysisManager *)v8 setDelegate:v6];
    objc_storeWeak((id *)&v9->_presentingView, v7);
  }
  [(QLImageAnalysisManager *)v9 _setupImageAnalysis];
  [(QLImageAnalysisManager *)v9 _setupNotificationsObservation];
  [(QLImageAnalysisManager *)v9 startImageAnalysis];
  [(QLImageAnalysisManager *)v9 setupAnalysisButtonsContainer];

  return v9;
}

- (void)_setupImageAnalysis
{
  id v3 = objc_alloc_init(MEMORY[0x263F847E0]);
  [(QLImageAnalysisManager *)self setImageInteraction:v3];

  unint64_t v4 = [(QLImageAnalysisManager *)self _defaultInteractionTypes];
  v5 = [(QLImageAnalysisManager *)self imageInteraction];
  [v5 setActiveInteractionTypes:v4];

  id v6 = [(QLImageAnalysisManager *)self imageInteraction];
  [v6 setDelegate:self];

  id v7 = [(QLImageAnalysisManager *)self imageInteraction];
  [v7 setAutomaticallyShowVisualSearchResults:1];

  v8 = [(QLImageAnalysisManager *)self delegate];
  v9 = [v8 imageAnalysisView];
  v10 = [(QLImageAnalysisManager *)self imageInteraction];
  [v9 addInteraction:v10];

  [(QLImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];
}

- (void)_setupNotificationsObservation
{
  gotLoadHelper_x8__DDDetectionControllerWillPresentActionNotification(v2);
  id v11 = **(id **)(v4 + 1232);
  if (v11)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_dataDetectorDetectionControllerWillPresentAction_ name:v11 object:0];
  }
  double Helper_x8__DDDetectionControllerDidDismissActionNotification = gotLoadHelper_x8__DDDetectionControllerDidDismissActionNotification(v5);
  uint64_t v9 = **(void **)(v8 + 1224);
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", Helper_x8__DDDetectionControllerDidDismissActionNotification);
    [v10 addObserver:self selector:sel_dataDetectorDetectionControllerDidDismissAction_ name:v9 object:0];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)QLImageAnalysisManager;
  [(QLImageAnalysisManager *)&v4 dealloc];
}

- (void)_setupAnalysisButtonsContainerInView:(id)a3
{
  v98[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0 && !self->_bottomRightButtonsContainer)
  {
    double v5 = (UIView *)objc_opt_new();
    bottomRightButtonsContainer = self->_bottomRightButtonsContainer;
    self->_bottomRightButtonsContainer = v5;

    [(UIView *)self->_bottomRightButtonsContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:self->_bottomRightButtonsContainer];
    id v7 = [v4 rightAnchor];
    uint64_t v8 = [(UIView *)self->_bottomRightButtonsContainer rightAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8];
    bottomRightButtonsContainerRightConstraint = self->_bottomRightButtonsContainerRightConstraint;
    self->_bottomRightButtonsContainerRightConstraint = v9;

    LODWORD(v11) = 1148829696;
    [(NSLayoutConstraint *)self->_bottomRightButtonsContainerRightConstraint setPriority:v11];
    v12 = [v4 bottomAnchor];
    v13 = [(UIView *)self->_bottomRightButtonsContainer bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    bottomRightButtonsContainerBottomConstraint = self->_bottomRightButtonsContainerBottomConstraint;
    self->_bottomRightButtonsContainerBottomConstraint = v14;

    LODWORD(v16) = 1148829696;
    [(NSLayoutConstraint *)self->_bottomRightButtonsContainerBottomConstraint setPriority:v16];
    v17 = (void *)MEMORY[0x263F08938];
    v18 = [v4 rightAnchor];
    v19 = [(UIView *)self->_bottomRightButtonsContainer rightAnchor];
    v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19 constant:16.0];
    v98[0] = v20;
    v93 = v4;
    v21 = [v4 safeAreaLayoutGuide];
    v22 = [v21 bottomAnchor];
    v23 = [(UIView *)self->_bottomRightButtonsContainer bottomAnchor];
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23 constant:12.0];
    v25 = self->_bottomRightButtonsContainerRightConstraint;
    v26 = self->_bottomRightButtonsContainerBottomConstraint;
    v98[1] = v24;
    v98[2] = v25;
    v98[3] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:4];
    [v17 activateConstraints:v27];

    v28 = [(QLImageAnalysisManager *)self imageInteraction];
    v29 = [v28 visualSearchCornerView];

    v30 = [v29 superview];

    if (!v30)
    {
      v31 = (UIView *)objc_opt_new();
      visualSearchViewContainer = self->_visualSearchViewContainer;
      self->_visualSearchViewContainer = v31;

      [(UIView *)self->_visualSearchViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_bottomRightButtonsContainer addSubview:self->_visualSearchViewContainer];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_visualSearchViewContainer addSubview:v29];
      v71 = (void *)MEMORY[0x263F08938];
      v89 = [v29 topAnchor];
      v87 = [(UIView *)self->_visualSearchViewContainer topAnchor];
      v85 = [v89 constraintEqualToAnchor:v87];
      v97[0] = v85;
      v83 = [v29 bottomAnchor];
      v81 = [(UIView *)self->_visualSearchViewContainer bottomAnchor];
      v79 = [v83 constraintEqualToAnchor:v81];
      v97[1] = v79;
      v77 = [v29 trailingAnchor];
      v75 = [(UIView *)self->_visualSearchViewContainer trailingAnchor];
      v73 = [v77 constraintEqualToAnchor:v75];
      v97[2] = v73;
      v69 = [v29 leadingAnchor];
      v67 = [(UIView *)self->_visualSearchViewContainer leadingAnchor];
      v65 = [v69 constraintEqualToAnchor:v67];
      v97[3] = v65;
      v63 = [(UIView *)self->_visualSearchViewContainer trailingAnchor];
      v61 = [(UIView *)self->_bottomRightButtonsContainer trailingAnchor];
      v59 = [v63 constraintEqualToAnchor:v61];
      v97[4] = v59;
      v57 = [(UIView *)self->_visualSearchViewContainer bottomAnchor];
      v33 = [(UIView *)self->_bottomRightButtonsContainer bottomAnchor];
      v34 = [v57 constraintEqualToAnchor:v33];
      v97[5] = v34;
      v35 = [(UIView *)self->_visualSearchViewContainer widthAnchor];
      v36 = [(UIView *)self->_bottomRightButtonsContainer widthAnchor];
      [v35 constraintLessThanOrEqualToAnchor:v36];
      v37 = v91 = v29;
      v97[6] = v37;
      v38 = [(UIView *)self->_visualSearchViewContainer heightAnchor];
      v39 = [(UIView *)self->_bottomRightButtonsContainer heightAnchor];
      v40 = [v38 constraintLessThanOrEqualToAnchor:v39];
      v97[7] = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:8];
      [v71 activateConstraints:v41];

      v29 = v91;
    }
    v42 = [(QLImageAnalysisManager *)self imageInteraction];
    v43 = [v42 analysisButton];

    v44 = [v43 superview];

    if (!v44)
    {
      v45 = (UIView *)objc_opt_new();
      analysisButtonContainer = self->_analysisButtonContainer;
      self->_analysisButtonContainer = v45;

      [(UIView *)self->_analysisButtonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_bottomRightButtonsContainer addSubview:self->_analysisButtonContainer];
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_analysisButtonContainer addSubview:v43];
      v72 = (void *)MEMORY[0x263F08938];
      v90 = [v43 topAnchor];
      v88 = [(UIView *)self->_analysisButtonContainer topAnchor];
      v86 = [v90 constraintEqualToAnchor:v88];
      v96[0] = v86;
      v84 = [v43 bottomAnchor];
      v82 = [(UIView *)self->_analysisButtonContainer bottomAnchor];
      v80 = [v84 constraintEqualToAnchor:v82];
      v96[1] = v80;
      v78 = [v43 trailingAnchor];
      v76 = [(UIView *)self->_analysisButtonContainer trailingAnchor];
      v74 = [v78 constraintEqualToAnchor:v76];
      v96[2] = v74;
      v70 = [v43 leadingAnchor];
      v68 = [(UIView *)self->_analysisButtonContainer leadingAnchor];
      v66 = [v70 constraintEqualToAnchor:v68];
      v96[3] = v66;
      v64 = [(UIView *)self->_analysisButtonContainer trailingAnchor];
      v62 = [(UIView *)self->_bottomRightButtonsContainer trailingAnchor];
      v60 = [v64 constraintEqualToAnchor:v62];
      v96[4] = v60;
      v58 = [(UIView *)self->_analysisButtonContainer bottomAnchor];
      v47 = [(UIView *)self->_bottomRightButtonsContainer bottomAnchor];
      v48 = [v58 constraintEqualToAnchor:v47];
      v96[5] = v48;
      v49 = [(UIView *)self->_analysisButtonContainer widthAnchor];
      [(UIView *)self->_bottomRightButtonsContainer widthAnchor];
      v50 = v92 = v29;
      v51 = [v49 constraintLessThanOrEqualToAnchor:v50];
      v96[6] = v51;
      v52 = [(UIView *)self->_analysisButtonContainer heightAnchor];
      v53 = [(UIView *)self->_bottomRightButtonsContainer heightAnchor];
      v54 = [v52 constraintLessThanOrEqualToAnchor:v53];
      v96[7] = v54;
      v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:8];
      [v72 activateConstraints:v55];

      v29 = v92;
    }
    v56 = (void *)MEMORY[0x263F82E00];
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __63__QLImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke;
    v94[3] = &unk_2642F5430;
    id v4 = v93;
    id v95 = v93;
    [v56 performWithoutAnimation:v94];
  }
}

uint64_t __63__QLImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (unint64_t)_defaultInteractionTypes
{
  if (_os_feature_enabled_impl()) {
    return 9;
  }
  else {
    return 1;
  }
}

- (id)image
{
  double v2 = [(QLImageAnalysisManager *)self delegate];
  id v3 = [v2 imageForAnalysis];

  return v3;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  imageAnalyzer = self->_imageAnalyzer;
  if (!imageAnalyzer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F847E8]);
    [(QLImageAnalysisManager *)self setImageAnalyzer:v4];

    double v5 = [(QLImageAnalysisManager *)self imageAnalysisQueue];
    id v6 = [(QLImageAnalysisManager *)self imageAnalyzer];
    [v6 setCallbackQueue:v5];

    imageAnalyzer = self->_imageAnalyzer;
  }

  return imageAnalyzer;
}

- (void)_updateAnalysisButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    double v5 = [(QLImageAnalysisManager *)self imageInteraction];
    id v11 = [v5 analysis];

    id v6 = v11;
    if (v11)
    {
      int v7 = [v11 hasResultsForAnalysisTypes:29];
      if (self->_isFullScreen)
      {
        if ([(QLImageAnalysisManager *)self isVisualSearchEnabled]) {
          BOOL isImageAnalysisPopoverPresented = self->_isImageAnalysisPopoverPresented;
        }
        else {
          BOOL isImageAnalysisPopoverPresented = 0;
        }
      }
      else
      {
        BOOL isImageAnalysisPopoverPresented = 1;
      }
      uint64_t v9 = v7 & isImageAnalysisPopoverPresented ^ 1u;
      v10 = [(QLImageAnalysisManager *)self imageInteraction];
      [v10 setActionInfoViewHidden:v9 animated:v3];

      id v6 = v11;
    }
  }
  else
  {
    [(QLImageAnalysisManager *)self _updateAnalysisButtonContainerWithAnimation:v3];
  }
}

- (void)_updateAnalysisButtonContainerWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(QLImageAnalysisManager *)self imageInteraction];
  id v6 = [v5 analysis];

  if (v6) {
    int v7 = [v6 hasResultsForAnalysisTypes:13];
  }
  else {
    int v7 = 0;
  }
  int v8 = v7 & ![(QLImageAnalysisManager *)self isVisualSearchEnabled];
  if (self->_isFullScreen)
  {
    uint64_t v9 = [(QLImageAnalysisManager *)self imageInteraction];
    v10 = [v9 analysisButton];
    uint64_t v11 = [v10 state];

    char v12 = v8 ^ 1;
    if (v11 != 4) {
      char v12 = 1;
    }
    if ((v12 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    char v16 = 0;
    goto LABEL_13;
  }
  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  [(UIView *)self->_analysisButtonContainer setHidden:0];
  v13 = [(QLImageAnalysisManager *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(QLImageAnalysisManager *)self delegate];
    [v15 imageAnalyzerWantsUpdateOverlayViews];
  }
  char v16 = 1;
LABEL_13:
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__QLImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke;
  v19[3] = &unk_2642F55E0;
  v19[4] = self;
  char v20 = v16;
  v17 = _Block_copy(v19);
  v18 = v17;
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:5242880 delay:v17 options:0 animations:0.4 completion:0.0];
  }
  else {
    (*((void (**)(void *))v17 + 2))(v17);
  }
}

uint64_t __70__QLImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:v1];
}

- (void)_activateInteractionTypes:(unint64_t)a3
{
  double v5 = [(QLImageAnalysisManager *)self imageInteraction];
  [v5 setActiveInteractionTypes:a3];

  [(QLImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];

  [(QLImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
}

- (void)setupAnalysisButtonsContainer
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);

    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)&self->_presentingView);
      [(QLImageAnalysisManager *)self _setupAnalysisButtonsContainerInView:v4];
    }
  }
}

- (id)imageAnalysisQueue
{
  if (imageAnalysisQueue_once != -1) {
    dispatch_once(&imageAnalysisQueue_once, &__block_literal_global_12);
  }
  double v2 = (void *)imageAnalysisQueue_imageAnalysisQueue;

  return v2;
}

void __44__QLImageAnalysisManager_imageAnalysisQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.quicklook.image-analysis", attr);
  double v2 = (void *)imageAnalysisQueue_imageAnalysisQueue;
  imageAnalysisQueue_imageAnalysisQueue = (uint64_t)v1;
}

- (void)startImageAnalysis
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [(QLImageAnalysisManager *)self image];
  id v4 = (NSObject **)MEMORY[0x263F62940];
  double v5 = *MEMORY[0x263F62940];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      double v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "Creating image analysis request for image: %@ #ImageAnalysis", (uint8_t *)&v16, 0xCu);
    }
    id v6 = [(QLImageAnalysisManager *)self delegate];
    int v7 = [v6 shouldDetectMachineReadableCode];

    if (v7) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = -13;
    }
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F847F0]) initWithImage:v3 requestType:v8];
    v10 = [(QLImageAnalysisManager *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      char v12 = [(QLImageAnalysisManager *)self delegate];
      v13 = [v12 clientPreviewOptions];

      char v14 = [v13 objectForKeyedSubscript:@"imageURL"];
      [v9 setImageURL:v14];

      v15 = [v13 objectForKeyedSubscript:@"pageURL"];
      [v9 setPageURL:v15];
    }
    [(QLImageAnalysisManager *)self _startImageAnalysisWithRequest:v9];
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      double v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Could not create image analysis request because image is nil #ImageAnalysis", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)_startImageAnalysisWithRequest:(id)a3
{
  id v4 = a3;
  [(QLImageAnalysisManager *)self cancelAllRequests];
  double v5 = [(QLImageAnalysisManager *)self imageInteraction];
  [v5 setAnalysis:0];

  objc_initWeak(&location, self);
  id v6 = [(QLImageAnalysisManager *)self imageAnalysisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke;
  block[3] = &unk_2642F5B90;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  dispatch_async(v6, block);

  [(QLImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (NSObject **)MEMORY[0x263F62940];
    double v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "Processing image analysis request: %@ #ImageAnalysis", buf, 0xCu);
    }
    id v7 = [WeakRetained imageAnalyzer];
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_61;
    v9[3] = &unk_2642F6A60;
    objc_copyWeak(&v10, v2);
    objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", objc_msgSend(v7, "processRequest:progressHandler:completionHandler:", v8, 0, v9));

    objc_destroyWeak(&v10);
  }
}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == -2
      && ([v7 domain],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"com.apple.VisionKit.ImageAnalyzer"],
          v8,
          v9))
    {
      id v10 = (NSObject **)MEMORY[0x263F62940];
      char v11 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        char v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        uint64_t v12 = "Image analysis cancelled: %@ #ImageAnalysis";
        uint64_t v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl(&dword_217F61000, v13, v14, v12, buf, 0xCu);
      }
    }
    else
    {
      v15 = (NSObject **)MEMORY[0x263F62940];
      int v16 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        int v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        uint64_t v12 = "Image analysis failed with error %@ #ImageAnalysis";
        uint64_t v13 = v16;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
  }
  v17 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v17);
  [WeakRetained setImageAnalysisRequestId:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_65;
  block[3] = &unk_2642F4F60;
  objc_copyWeak(&v24, v17);
  id v22 = v5;
  id v23 = v7;
  id v19 = v7;
  id v20 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v24);
}

void __57__QLImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleImageAnalysis:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_handleImageAnalysis:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(QLImageAnalysisManager *)self imageInteraction];
  int v9 = v8;
  if (!v6 || v7) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  [v8 setAnalysis:v10];

  [(QLImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];
  [(QLImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  if (self->_shouldEnterVisualSearchAfterNextAnalysis)
  {
    self->_shouldEnterVisualSearchAfterNextAnalysis = 0;
    [(QLImageAnalysisManager *)self activateVisualSearchInteraction];
  }
  else if (self->_shouldHighlightTextAndDDAfterNextAnalysis)
  {
    self->_shouldHighlightTextAndDDAfterNextAnalysis = 0;
    dispatch_time_t v11 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__QLImageAnalysisManager__handleImageAnalysis_error___block_invoke;
    block[3] = &unk_2642F5430;
    void block[4] = self;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
  else if (self->_shouldUpliftSubjectAfterNextAnalysis)
  {
    self->_shouldUpliftSubjectAfterNextAnalysis = 0;
    uint64_t v12 = [(QLImageAnalysisManager *)self imageInteraction];
    [v12 setSubjectHighlightActive:1];
  }
}

void __53__QLImageAnalysisManager__handleImageAnalysis_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageInteraction];
  [v1 setHighlightSelectableItems:1];
}

- (void)_updateInfoButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLImageAnalysisManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(QLImageAnalysisManager *)self delegate];
    [v7 imageAnalyzerWantsUpdateInfoButtonWithAnimation:v3];
  }
}

- (void)updateBottomRightContainerPositionForImageView:(id)a3 view:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    [v7 bounds];
    double MaxX = CGRectGetMaxX(v25);
    [v7 bounds];
    objc_msgSend(v7, "convertPoint:toView:", v6, MaxX, CGRectGetMaxY(v26));
    double v10 = v9;
    double v12 = v11;

    [v6 frame];
    CGFloat v13 = CGRectGetMaxX(v27) - v10 + 16.0;
    [v6 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    double v22 = CGRectGetMaxY(v28) - v12 + 12.0;
    [(NSLayoutConstraint *)self->_bottomRightButtonsContainerRightConstraint setConstant:v13];
    bottomRightButtonsContainerBottomConstraint = self->_bottomRightButtonsContainerBottomConstraint;
    [(NSLayoutConstraint *)bottomRightButtonsContainerBottomConstraint setConstant:v22];
  }
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  self->_isFullScreen = a3;
  [(QLImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:a4];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = [(QLImageAnalysisManager *)self imageInteraction];
    if (!v5) {
      goto LABEL_10;
    }
    BOOL v6 = [(QLImageAnalysisManager *)self isVisualSearchEnabled];
    if (v6) {
      BOOL v6 = [(QLImageAnalysisManager *)self hasResultsForVisualSearch];
    }
    BOOL v7 = !self->_isFullScreen || self->_isImageAnalysisPopoverPresented;
    if (v7 && v6)
    {
      [(UIView *)self->_visualSearchViewContainer setHidden:0];
      char v8 = 1;
    }
    else
    {
LABEL_10:
      char v8 = 0;
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__QLImageAnalysisManager_updateForFullScreen_animated___block_invoke;
    v10[3] = &unk_2642F55E0;
    v10[4] = self;
    char v11 = v8;
    double v9 = _Block_copy(v10);
    [MEMORY[0x263F82E00] animateWithDuration:5242880 delay:v9 options:0 animations:0.4 completion:0.0];
  }
}

uint64_t __55__QLImageAnalysisManager_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:v1];
}

- (void)stopImageAnalysis
{
  [(QLImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  [(QLImageAnalysisManager *)self cancelAllRequests];
  BOOL v3 = [(QLImageAnalysisManager *)self delegate];
  id v4 = [v3 imageAnalysisView];
  id v5 = [(QLImageAnalysisManager *)self imageInteraction];
  [v4 removeInteraction:v5];

  [(UIView *)self->_bottomRightButtonsContainer removeFromSuperview];
  bottomRightButtonsContainer = self->_bottomRightButtonsContainer;
  self->_bottomRightButtonsContainer = 0;
}

- (void)cancelAllRequests
{
  BOOL v3 = (NSObject **)MEMORY[0x263F62940];
  id v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "Cancel all image analysis requests #ImageAnalysis", v6, 2u);
  }
  id v5 = [(QLImageAnalysisManager *)self imageAnalyzer];
  [v5 cancelAllRequests];
}

- (QLToolbarButton)imageAnalysisToolbarButton
{
  if (!self->_imageAnalysisToolbarButton)
  {
    BOOL v3 = (QLToolbarButton *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"QLVisualSearchButton"];
    imageAnalysisToolbarButton = self->_imageAnalysisToolbarButton;
    self->_imageAnalysisToolbarButton = v3;

    [(QLToolbarButton *)self->_imageAnalysisToolbarButton setPlacement:0];
    [(QLToolbarButton *)self->_imageAnalysisToolbarButton setAccessibilityIdentifier:@"QLOverlayImageAnalysisButtonAccessibilityIdentifier"];
  }
  id v5 = [(QLImageAnalysisManager *)self infoButtonGlyphName];
  [(QLToolbarButton *)self->_imageAnalysisToolbarButton setSymbolImageName:v5];

  [(QLToolbarButton *)self->_imageAnalysisToolbarButton setUseInternalSymbolImage:1];
  BOOL v6 = self->_imageAnalysisToolbarButton;

  return v6;
}

- (BOOL)hasAnalysis
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  BOOL v3 = [v2 analysis];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isAnalysisOngoing
{
  return [(QLImageAnalysisManager *)self imageAnalysisRequestId] != 0;
}

- (BOOL)addInteractionIfNeeded
{
  BOOL v3 = [(QLImageAnalysisManager *)self delegate];
  BOOL v4 = [v3 imageAnalysisView];

  if (v4)
  {
    id v5 = [(QLImageAnalysisManager *)self imageInteraction];
    if (v5
      && ([v4 interactions],
          BOOL v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 containsObject:v5],
          v6,
          (v7 & 1) == 0))
    {
      [v4 addInteraction:v5];
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)enableMarkupMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLImageAnalysisManager *)self delegate];
  id v10 = [v5 imageAnalysisView];

  if (v10)
  {
    uint64_t v6 = [(QLImageAnalysisManager *)self imageInteraction];
    char v7 = (void *)v6;
    if (v3 || !v6)
    {
      if (v3)
      {
        BOOL v8 = [v10 interactions];
        int v9 = [v8 containsObject:v7];

        if (v9)
        {
          if (([v7 activeInteractionTypes] & 4) != 0) {
            [(QLImageAnalysisManager *)self _activateInteractionTypes:[(QLImageAnalysisManager *)self _defaultInteractionTypes]];
          }
          [(QLImageAnalysisManager *)self cancelAllRequests];
          [v7 setAnalysis:0];
          [v10 removeInteraction:v7];
        }
      }
    }
    else
    {
      [v10 addInteraction:v6];
    }
  }
}

- (BOOL)isInteractionActive
{
  BOOL v3 = [(QLImageAnalysisManager *)self delegate];
  BOOL v4 = [v3 imageAnalysisView];

  if (v4)
  {
    id v5 = [(QLImageAnalysisManager *)self imageInteraction];
    if (v5)
    {
      uint64_t v6 = [v4 interactions];
      char v7 = [v6 containsObject:v5];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasResultsForVisualSearch
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  BOOL v3 = [v2 analysis];

  if (v3) {
    char v4 = [v3 hasResultsForAnalysisTypes:16];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isVisualSearchEnabled
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = ((unint64_t)[v2 activeInteractionTypes] >> 2) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)infoButtonGlyphName
{
  BOOL v3 = [(QLImageAnalysisManager *)self imageInteraction];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  unint64_t v4 = [(QLImageAnalysisManager *)self imageInteraction];
  id v5 = [v4 visualSearchResultItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    char v7 = [(QLImageAnalysisManager *)self imageInteraction];
    BOOL v8 = [v7 visualSearchResultItems];
    BOOL v3 = [v8 firstObject];

    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v3 infoButtonGlyphName],
            int v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v9))
      {
        id v10 = [v3 infoButtonGlyphName];
      }
      else
      {
        id v10 = @"info.circle.and.sparkles";
      }
      if (objc_opt_respondsToSelector())
      {
        CGFloat v15 = [v3 filledInfoButtonGlyphName];

        if (v15)
        {
          char v11 = [v3 filledInfoButtonGlyphName];
          goto LABEL_9;
        }
      }
LABEL_8:
      char v11 = @"info.circle.and.sparkles.fill";
LABEL_9:

      goto LABEL_10;
    }
LABEL_7:
    id v10 = @"info.circle.and.sparkles";
    goto LABEL_8;
  }
  id v10 = @"info.circle.and.sparkles";
  char v11 = @"info.circle.and.sparkles.fill";
LABEL_10:
  if ([(QLImageAnalysisManager *)self isVisualSearchEnabled]) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  CGFloat v13 = v12;

  return v13;
}

- (BOOL)isTextSelectionEnabled
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  BOOL v3 = v2;
  if (v2 && ([v2 activeInteractionTypes] & 1) != 0) {
    char v4 = [v3 highlightSelectableItems];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isImageSubjectHighlightingEnabled
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = ((unint64_t)[v2 activeInteractionTypes] >> 3) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)infoButtonTapped
{
  if ([(QLImageAnalysisManager *)self isVisualSearchEnabled]) {
    unint64_t v3 = [(QLImageAnalysisManager *)self _defaultInteractionTypes];
  }
  else {
    unint64_t v3 = 4;
  }

  [(QLImageAnalysisManager *)self _activateInteractionTypes:v3];
}

- (void)shouldHideInteraction:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char v7 = [(QLImageAnalysisManager *)self delegate];
  id v13 = [v7 imageAnalysisView];

  if (v13)
  {
    BOOL v8 = [(QLImageAnalysisManager *)self imageInteraction];
    if (v8)
    {
      int v9 = [v13 interactions];
      int v10 = [v9 containsObject:v8];

      if (v5 && v10)
      {
        char v11 = [(QLImageAnalysisManager *)self delegate];
        double v12 = [v11 imageAnalysisView];
        [v12 removeInteraction:v8];
LABEL_8:

        [(QLImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:v4];
        [(QLImageAnalysisManager *)self _updateInfoButtonWithAnimation:v4];
        goto LABEL_9;
      }
      if (((v5 | v10) & 1) == 0)
      {
        char v11 = [(QLImageAnalysisManager *)self delegate];
        double v12 = [v11 imageAnalysisView];
        [v12 addInteraction:v8];
        goto LABEL_8;
      }
    }
LABEL_9:
  }
}

- (void)activateVisualSearchInteraction
{
}

- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(QLImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "dataDetectorExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)textExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(QLImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "textExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(QLImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "imageSubjectExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(QLImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "visualSearchExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(QLImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)hasActiveTextSelection
{
  double v2 = [(QLImageAnalysisManager *)self imageInteraction];
  char v3 = [v2 hasActiveTextSelection];

  return v3;
}

- (void)adjustImageInteractionForScrollView:(id)a3
{
  id v23 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v4 = [(QLImageAnalysisManager *)self delegate];
    BOOL v5 = [v4 imageAnalysisView];

    if (v23 && v5)
    {
      [v23 bounds];
      objc_msgSend(v23, "convertRect:toView:", v5);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      [v5 bounds];
      double v15 = v7 / v14;
      [v5 bounds];
      double v17 = v9 / v16;
      [v5 bounds];
      double v19 = v11 / v18;
      [v5 bounds];
      double v21 = v13 / v20;
      double v22 = [(QLImageAnalysisManager *)self imageInteraction];
      objc_msgSend(v22, "scrollViewDidZoomToUnitRect:", v15, v17, v19, v21);
    }
  }
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  char v8 = objc_msgSend(v7, "textExistsAtPoint:", x, y);
  char v9 = objc_msgSend(v7, "imageSubjectExistsAtPoint:", x, y);
  char v10 = objc_msgSend(v7, "dataDetectorExistsAtPoint:", x, y);
  char v11 = objc_msgSend(v7, "visualSearchExistsAtPoint:", x, y);
  char v12 = 1;
  if ((v8 & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0) {
    char v12 = [v7 hasActiveTextSelection];
  }

  return v12;
}

- (void)imageAnalysisPopoverWillAppear
{
  self->_BOOL isImageAnalysisPopoverPresented = 1;
  char v3 = [(QLImageAnalysisManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLImageAnalysisManager *)self delegate];
    [v5 imageAnalysisInteractionWillPresentVisualSearchController];
  }
}

- (void)imageAnalysisPopoverDidDisappear
{
  self->_BOOL isImageAnalysisPopoverPresented = 0;
  char v3 = [(QLImageAnalysisManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(QLImageAnalysisManager *)self delegate];
    [v5 imageAnalysisInteractionDidDismissVisualSearchController];
  }
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  char v9 = (void (**)(void))a5;
  id v7 = NSStringFromSelector(a4);
  char v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"_define:", @"_translate:", @"_share:", @"_addShortcut:", 0);
  if ([v8 containsObject:v7]) {
    [(QLImageAnalysisManager *)self imageAnalysisPopoverWillAppear];
  }
  v9[2]();
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(QLImageAnalysisManager *)self delegate];
  double v6 = [v5 presentingViewControllerForImageAnalysisInteraction:v4];

  return v6;
}

+ (BOOL)shouldStartImageAnalysisForPresentationMode:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 && a3 != 5;
}

- (QLImageAnalysisManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (QLImageAnalysisManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  return self->_shouldHighlightTextAndDDAfterNextAnalysis;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  self->_shouldHighlightTextAndDDAfterNextAnalysis = a3;
}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  return self->_shouldEnterVisualSearchAfterNextAnalysis;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  self->_shouldEnterVisualSearchAfterNextAnalysis = a3;
}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  return self->_shouldUpliftSubjectAfterNextAnalysis;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  self->_shouldUpliftSubjectAfterNextAnalysis = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (void)setImageInteraction:(id)a3
{
}

- (void)setImageAnalyzer:(id)a3
{
}

- (int)imageAnalysisRequestId
{
  return self->_imageAnalysisRequestId;
}

- (void)setImageAnalysisRequestId:(int)a3
{
  self->_imageAnalysisRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_visualSearchViewContainer, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainer, 0);
  objc_destroyWeak((id *)&self->_presentingView);

  objc_storeStrong((id *)&self->_imageAnalysisToolbarButton, 0);
}

@end