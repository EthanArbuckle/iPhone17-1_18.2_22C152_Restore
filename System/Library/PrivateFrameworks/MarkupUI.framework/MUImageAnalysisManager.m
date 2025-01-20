@interface MUImageAnalysisManager
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
- (BOOL)isFullScreen;
- (BOOL)isImageAnalysisPopoverPresented;
- (BOOL)isImageSubjectHighlightingEnabled;
- (BOOL)isInteractionActive;
- (BOOL)isTextSelectionEnabled;
- (BOOL)isVisualSearchEnabled;
- (BOOL)shouldEnterVisualSearchAfterNextAnalysis;
- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis;
- (BOOL)shouldUpliftSubjectAfterNextAnalysis;
- (BOOL)textExistsAtPoint:(CGPoint)a3;
- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3;
- (MUImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4;
- (MUImageAnalysisManagerDelegate)delegate;
- (NSLayoutConstraint)bottomRightButtonsContainerBottomConstraint;
- (NSLayoutConstraint)bottomRightButtonsContainerRightConstraint;
- (NSString)filledInfoButtonGlyphName;
- (NSString)infoButtonGlyphName;
- (UIView)analysisButtonContainer;
- (UIView)bottomRightButtonsContainer;
- (UIView)presentingView;
- (UIView)visualSearchViewContainer;
- (VKCImageAnalysisInteraction)imageInteraction;
- (VKCImageAnalyzer)imageAnalyzer;
- (id)image;
- (id)imageAnalysisQueue;
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
- (void)setAnalysisButtonContainer:(id)a3;
- (void)setBottomRightButtonsContainer:(id)a3;
- (void)setBottomRightButtonsContainerBottomConstraint:(id)a3;
- (void)setBottomRightButtonsContainerRightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageAnalysisRequestId:(int)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setImageInteraction:(id)a3;
- (void)setIsFullScreen:(BOOL)a3;
- (void)setIsImageAnalysisPopoverPresented:(BOOL)a3;
- (void)setPresentingView:(id)a3;
- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3;
- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3;
- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3;
- (void)setVisualSearchViewContainer:(id)a3;
- (void)setupAnalysisButtonsContainer;
- (void)shouldHideInteraction:(BOOL)a3 animated:(BOOL)a4;
- (void)startImageAnalysis;
- (void)stopImageAnalysis;
- (void)updateBottomRightContainerPositionForImageView:(id)a3 view:(id)a4;
- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MUImageAnalysisManager

- (MUImageAnalysisManager)initWithDelegate:(id)a3 presentingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUImageAnalysisManager;
  v8 = [(MUImageAnalysisManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MUImageAnalysisManager *)v8 setDelegate:v6];
    [(MUImageAnalysisManager *)v9 setPresentingView:v7];
  }
  [(MUImageAnalysisManager *)v9 _setupImageAnalysis];
  [(MUImageAnalysisManager *)v9 _setupNotificationsObservation];
  [(MUImageAnalysisManager *)v9 startImageAnalysis];
  [(MUImageAnalysisManager *)v9 setupAnalysisButtonsContainer];

  return v9;
}

- (void)_setupImageAnalysis
{
  id v3 = objc_alloc_init(MEMORY[0x263F847E0]);
  [(MUImageAnalysisManager *)self setImageInteraction:v3];

  unint64_t v4 = [(MUImageAnalysisManager *)self _defaultInteractionTypes];
  v5 = [(MUImageAnalysisManager *)self imageInteraction];
  [v5 setActiveInteractionTypes:v4];

  id v6 = [(MUImageAnalysisManager *)self imageInteraction];
  [v6 setDelegate:self];

  id v7 = [(MUImageAnalysisManager *)self imageInteraction];
  [v7 setAutomaticallyShowVisualSearchResults:1];

  v8 = [(MUImageAnalysisManager *)self delegate];
  v9 = [v8 imageAnalysisView];
  v10 = [(MUImageAnalysisManager *)self imageInteraction];
  [v9 addInteraction:v10];

  [(MUImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];
}

- (void)_setupNotificationsObservation
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v3 = (id *)getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr;
  uint64_t v15 = getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr;
  if (!getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr)
  {
    unint64_t v4 = (void *)DataDetectorsUILibrary();
    v13[3] = (uint64_t)dlsym(v4, "DDDetectionControllerWillPresentActionNotification");
    getDDDetectionControllerWillPresentActionNotificationSymbolLoc_ptr = v13[3];
    id v3 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v3) {
    +[MUImageReader imageDescriptionFromSourceContent:]();
  }
  id v5 = *v3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_dataDetectorDetectionControllerWillPresentAction_ name:v5 object:0];
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v7 = (id *)getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr;
  uint64_t v15 = getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr;
  if (!getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr)
  {
    v8 = (void *)DataDetectorsUILibrary();
    v13[3] = (uint64_t)dlsym(v8, "DDDetectionControllerDidDismissActionNotification");
    getDDDetectionControllerDidDismissActionNotificationSymbolLoc_ptr = v13[3];
    id v7 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v7) {
    +[MUImageReader imageDescriptionFromSourceContent:]();
  }
  if (*v7)
  {
    v9 = (void *)MEMORY[0x263F08A00];
    id v10 = *v7;
    objc_super v11 = [v9 defaultCenter];
    [v11 addObserver:self selector:sel_dataDetectorDetectionControllerDidDismissAction_ name:v10 object:0];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MUImageAnalysisManager;
  [(MUImageAnalysisManager *)&v4 dealloc];
}

- (void)_setupAnalysisButtonsContainerInView:(id)a3
{
  v96[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = [(MUImageAnalysisManager *)self bottomRightButtonsContainer];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [(MUImageAnalysisManager *)self setBottomRightButtonsContainer:v6];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v4 addSubview:v6];
      [v4 rightAnchor];
      id v7 = v90 = self;
      v8 = [v6 rightAnchor];
      uint64_t v9 = [v7 constraintEqualToAnchor:v8];

      [(MUImageAnalysisManager *)v90 setBottomRightButtonsContainerRightConstraint:v9];
      LODWORD(v10) = 1148829696;
      [(NSLayoutConstraint *)v90->_bottomRightButtonsContainerRightConstraint setPriority:v10];
      objc_super v11 = [v4 bottomAnchor];
      uint64_t v12 = [v6 bottomAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];

      [(MUImageAnalysisManager *)v90 setBottomRightButtonsContainerBottomConstraint:v13];
      LODWORD(v14) = 1148829696;
      [v13 setPriority:v14];
      v83 = (void *)MEMORY[0x263F08938];
      uint64_t v15 = [v4 rightAnchor];
      v16 = [v6 rightAnchor];
      v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16 constant:16.0];
      v96[0] = v17;
      v88 = v4;
      v18 = [v4 safeAreaLayoutGuide];
      v19 = [v18 bottomAnchor];
      v89 = v6;
      v20 = [v6 bottomAnchor];
      v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20 constant:12.0];
      v96[1] = v21;
      v96[2] = v9;
      v86 = v13;
      v87 = (void *)v9;
      v96[3] = v13;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
      [v83 activateConstraints:v22];

      v23 = v90;
      v24 = [(MUImageAnalysisManager *)v90 imageInteraction];
      v25 = [v24 visualSearchCornerView];

      v26 = [v25 superview];

      if (!v26)
      {
        v27 = objc_opt_new();
        [(MUImageAnalysisManager *)v90 setVisualSearchViewContainer:v27];
        [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v89 addSubview:v27];
        [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v27 addSubview:v25];
        v63 = (void *)MEMORY[0x263F08938];
        v84 = [v25 topAnchor];
        v81 = [v27 topAnchor];
        v79 = [v84 constraintEqualToAnchor:v81];
        v95[0] = v79;
        v77 = [v25 bottomAnchor];
        v75 = [v27 bottomAnchor];
        v73 = [v77 constraintEqualToAnchor:v75];
        v95[1] = v73;
        v71 = [v25 trailingAnchor];
        v69 = [v27 trailingAnchor];
        v67 = [v71 constraintEqualToAnchor:v69];
        v95[2] = v67;
        v65 = [v25 leadingAnchor];
        v61 = [v27 leadingAnchor];
        v59 = [v65 constraintEqualToAnchor:v61];
        v95[3] = v59;
        v57 = [v27 trailingAnchor];
        v55 = [v89 trailingAnchor];
        v53 = [v57 constraintEqualToAnchor:v55];
        v95[4] = v53;
        v51 = [v27 bottomAnchor];
        v49 = [v89 bottomAnchor];
        v28 = [v51 constraintEqualToAnchor:v49];
        v95[5] = v28;
        v29 = [v27 widthAnchor];
        v30 = [v89 widthAnchor];
        v31 = [v29 constraintLessThanOrEqualToAnchor:v30];
        v95[6] = v31;
        v32 = [v27 heightAnchor];
        v33 = [v89 heightAnchor];
        v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
        v95[7] = v34;
        v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:8];
        [v63 activateConstraints:v35];

        v23 = v90;
      }
      v36 = [(MUImageAnalysisManager *)v23 imageInteraction];
      v37 = [v36 analysisButton];

      v38 = [v37 superview];

      if (!v38)
      {
        v39 = objc_opt_new();
        [(MUImageAnalysisManager *)v23 setAnalysisButtonContainer:v39];
        [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v89 addSubview:v39];
        [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v39 addSubview:v37];
        v66 = (void *)MEMORY[0x263F08938];
        v91 = [v37 topAnchor];
        v85 = [v39 topAnchor];
        v82 = [v91 constraintEqualToAnchor:v85];
        v94[0] = v82;
        v80 = [v37 bottomAnchor];
        v78 = [v39 bottomAnchor];
        v76 = [v80 constraintEqualToAnchor:v78];
        v94[1] = v76;
        v74 = [v37 trailingAnchor];
        v72 = [v39 trailingAnchor];
        v70 = [v74 constraintEqualToAnchor:v72];
        v94[2] = v70;
        v68 = [v37 leadingAnchor];
        v64 = [v39 leadingAnchor];
        v62 = [v68 constraintEqualToAnchor:v64];
        v94[3] = v62;
        v60 = [v39 trailingAnchor];
        v58 = [v89 trailingAnchor];
        v56 = [v60 constraintEqualToAnchor:v58];
        v94[4] = v56;
        v54 = [v39 bottomAnchor];
        v52 = [v89 bottomAnchor];
        v50 = [v54 constraintEqualToAnchor:v52];
        v94[5] = v50;
        v40 = [v39 widthAnchor];
        v41 = [v89 widthAnchor];
        v42 = [v40 constraintLessThanOrEqualToAnchor:v41];
        v94[6] = v42;
        v43 = [v39 heightAnchor];
        v44 = [v89 heightAnchor];
        [v43 constraintLessThanOrEqualToAnchor:v44];
        v46 = v45 = v25;
        v94[7] = v46;
        v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:8];
        [v66 activateConstraints:v47];

        v25 = v45;
      }
      v48 = (void *)MEMORY[0x263F1CB60];
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __63__MUImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke;
      v92[3] = &unk_2649C2828;
      id v4 = v88;
      id v93 = v88;
      [v48 performWithoutAnimation:v92];
    }
  }
}

uint64_t __63__MUImageAnalysisManager__setupAnalysisButtonsContainerInView___block_invoke(uint64_t a1)
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
  v2 = [(MUImageAnalysisManager *)self delegate];
  id v3 = [v2 imageForAnalysis];

  return v3;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  imageAnalyzer = self->_imageAnalyzer;
  if (!imageAnalyzer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F847E8]);
    [(MUImageAnalysisManager *)self setImageAnalyzer:v4];

    id v5 = [(MUImageAnalysisManager *)self imageAnalysisQueue];
    id v6 = [(MUImageAnalysisManager *)self imageAnalyzer];
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
    id v5 = [(MUImageAnalysisManager *)self imageInteraction];
    id v11 = [v5 analysis];

    id v6 = v11;
    if (v11)
    {
      int v7 = [v11 hasResultsForAnalysisTypes:29];
      if ([(MUImageAnalysisManager *)self isFullScreen])
      {
        BOOL v8 = [(MUImageAnalysisManager *)self isVisualSearchEnabled];
        if (v8) {
          BOOL v8 = [(MUImageAnalysisManager *)self isImageAnalysisPopoverPresented];
        }
      }
      else
      {
        BOOL v8 = 1;
      }
      uint64_t v9 = v7 & v8 ^ 1u;
      double v10 = [(MUImageAnalysisManager *)self imageInteraction];
      [v10 setActionInfoViewHidden:v9 animated:v3];

      id v6 = v11;
    }
  }
  else
  {
    [(MUImageAnalysisManager *)self _updateAnalysisButtonContainerWithAnimation:v3];
  }
}

- (void)_updateAnalysisButtonContainerWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MUImageAnalysisManager *)self imageInteraction];
  id v6 = [v5 analysis];

  if (v6) {
    int v7 = [v6 hasResultsForAnalysisTypes:13];
  }
  else {
    int v7 = 0;
  }
  int v8 = v7 & ![(MUImageAnalysisManager *)self isVisualSearchEnabled];
  if ([(MUImageAnalysisManager *)self isFullScreen])
  {
    uint64_t v9 = [(MUImageAnalysisManager *)self imageInteraction];
    double v10 = [v9 analysisButton];
    if ([v10 state] != 4) {
      LOBYTE(v8) = 0;
    }
  }
  if (v8)
  {
    id v11 = [(MUImageAnalysisManager *)self analysisButtonContainer];
    [v11 setHidden:0];

    uint64_t v12 = [(MUImageAnalysisManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 imageAnalyzerWantsUpdateOverlayViews];
    }
    char v13 = 1;
  }
  else
  {
    uint64_t v12 = [(MUImageAnalysisManager *)self delegate];
    char v13 = 0;
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__MUImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke;
  v16[3] = &unk_2649C2E78;
  objc_copyWeak(&v17, &location);
  char v18 = v13;
  uint64_t v14 = MEMORY[0x230F8ECA0](v16);
  uint64_t v15 = (void *)v14;
  if (v3) {
    [MEMORY[0x263F1CB60] animateWithDuration:5242880 delay:v14 options:0 animations:0.4 completion:0.0];
  }
  else {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __70__MUImageAnalysisManager__updateAnalysisButtonContainerWithAnimation___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained analysisButtonContainer];
  [v2 setAlpha:v1];
}

- (void)_activateInteractionTypes:(unint64_t)a3
{
  id v5 = [(MUImageAnalysisManager *)self imageInteraction];
  [v5 setActiveInteractionTypes:a3];

  [(MUImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];
  [(MUImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
}

- (void)setupAnalysisButtonsContainer
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v3 = [(MUImageAnalysisManager *)self presentingView];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = v3;
      uint64_t v3 = [(MUImageAnalysisManager *)self _setupAnalysisButtonsContainerInView:v3];
      uint64_t v4 = v5;
    }
    MEMORY[0x270F9A758](v3, v4);
  }
}

- (id)imageAnalysisQueue
{
  if (imageAnalysisQueue_once != -1) {
    dispatch_once(&imageAnalysisQueue_once, &__block_literal_global_2);
  }
  v2 = (void *)imageAnalysisQueue_queue;
  return v2;
}

void __44__MUImageAnalysisManager_imageAnalysisQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.markup.image-analysis", attr);
  v2 = (void *)imageAnalysisQueue_queue;
  imageAnalysisQueue_queue = (uint64_t)v1;
}

- (void)startImageAnalysis
{
  uint64_t v3 = [(MUImageAnalysisManager *)self image];
  id v9 = (id)v3;
  if (v3)
  {
    NSLog(&cfstr_CreatingImageA.isa, v3);
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F847F0]) initWithImage:v9 requestType:-1];
    uint64_t v5 = [(MUImageAnalysisManager *)self delegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v6 = [v5 clientPreviewOptions];
      int v7 = [v6 objectForKeyedSubscript:@"imageURL"];
      [v4 setImageURL:v7];

      int v8 = [v6 objectForKeyedSubscript:@"pageURL"];
      [v4 setPageURL:v8];
    }
    [(MUImageAnalysisManager *)self _startImageAnalysisWithRequest:v4];
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate.isa);
  }
}

- (void)_startImageAnalysisWithRequest:(id)a3
{
  id v4 = a3;
  [(MUImageAnalysisManager *)self cancelAllRequests];
  uint64_t v5 = [(MUImageAnalysisManager *)self imageInteraction];
  [v5 setAnalysis:0];

  objc_initWeak(&location, self);
  id v6 = [(MUImageAnalysisManager *)self imageAnalysisQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke;
  block[3] = &unk_2649C2A50;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  dispatch_async(v6, block);

  [(MUImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    NSLog(&cfstr_ProcessingImag.isa, *(void *)(a1 + 32));
    id v4 = [WeakRetained imageAnalyzer];
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_2;
    v6[3] = &unk_2649C2EA0;
    objc_copyWeak(&v7, v2);
    objc_msgSend(WeakRetained, "setImageAnalysisRequestId:", objc_msgSend(v4, "processRequest:progressHandler:completionHandler:", v5, 0, v6));

    objc_destroyWeak(&v7);
  }
}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ([v6 code] == -2
      && ([v7 domain],
          int v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isEqualToString:@"com.apple.VisionKit.ImageAnalyzer"],
          v8,
          (v9 & 1) != 0))
    {
      NSLog(&cfstr_ImageAnalysisC.isa, v7);
    }
    else
    {
      NSLog(&cfstr_ImageAnalysisF.isa, v7);
    }
  }
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained setImageAnalysisRequestId:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_3;
  block[3] = &unk_2649C28F0;
  objc_copyWeak(&v17, v10);
  id v15 = v5;
  id v16 = v7;
  id v12 = v7;
  id v13 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v17);
}

void __57__MUImageAnalysisManager__startImageAnalysisWithRequest___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleImageAnalysis:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_handleImageAnalysis:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MUImageAnalysisManager *)self imageInteraction];
  char v9 = v8;
  if (!v6 || v7) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  [v8 setAnalysis:v10];

  [(MUImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:1];
  [(MUImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  if (self->_shouldEnterVisualSearchAfterNextAnalysis)
  {
    self->_shouldEnterVisualSearchAfterNextAnalysis = 0;
    [(MUImageAnalysisManager *)self activateVisualSearchInteraction];
  }
  else if (self->_shouldHighlightTextAndDDAfterNextAnalysis)
  {
    self->_shouldHighlightTextAndDDAfterNextAnalysis = 0;
    dispatch_time_t v11 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__MUImageAnalysisManager__handleImageAnalysis_error___block_invoke;
    block[3] = &unk_2649C2828;
    void block[4] = self;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
  else if (self->_shouldUpliftSubjectAfterNextAnalysis)
  {
    self->_shouldUpliftSubjectAfterNextAnalysis = 0;
    id v12 = [(MUImageAnalysisManager *)self imageInteraction];
    [v12 setSubjectHighlightActive:1];
  }
}

void __53__MUImageAnalysisManager__handleImageAnalysis_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageInteraction];
  [v1 setHighlightSelectableItems:1];
}

- (void)_updateInfoButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(MUImageAnalysisManager *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 imageAnalyzerWantsUpdateInfoButtonWithAnimation:v3];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)updateBottomRightContainerPositionForImageView:(id)a3 view:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    [v7 bounds];
    double MaxX = CGRectGetMaxX(v26);
    [v7 bounds];
    objc_msgSend(v7, "convertPoint:toView:", v6, MaxX, CGRectGetMaxY(v27));
    double v10 = v9;
    double v12 = v11;

    [v6 frame];
    CGFloat v13 = CGRectGetMaxX(v28) - v10 + 16.0;
    [v6 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v29.origin.x = v15;
    v29.origin.y = v17;
    v29.size.width = v19;
    v29.size.height = v21;
    CGFloat v22 = CGRectGetMaxY(v29) - v12 + 12.0;
    v23 = [(MUImageAnalysisManager *)self bottomRightButtonsContainerRightConstraint];
    [v23 setConstant:v13];

    id v24 = [(MUImageAnalysisManager *)self bottomRightButtonsContainerBottomConstraint];
    [v24 setConstant:v22];
  }
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(MUImageAnalysisManager *)self setIsFullScreen:a3];
  [(MUImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:v4];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v6 = [(MUImageAnalysisManager *)self imageInteraction];
    if (v6
      && (![(MUImageAnalysisManager *)self isVisualSearchEnabled]
        ? (BOOL v7 = 0)
        : (BOOL v7 = [(MUImageAnalysisManager *)self hasResultsForVisualSearch]),
          ![(MUImageAnalysisManager *)self isFullScreen]
        ? (BOOL v8 = 1)
        : (BOOL v8 = [(MUImageAnalysisManager *)self isImageAnalysisPopoverPresented]),
          v8 && v7))
    {
      double v9 = [(MUImageAnalysisManager *)self visualSearchViewContainer];
      [v9 setHidden:0];

      char v10 = 1;
    }
    else
    {
      char v10 = 0;
    }
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__MUImageAnalysisManager_updateForFullScreen_animated___block_invoke;
    v12[3] = &unk_2649C2E78;
    objc_copyWeak(&v13, &location);
    char v14 = v10;
    double v11 = (void *)MEMORY[0x230F8ECA0](v12);
    [MEMORY[0x263F1CB60] animateWithDuration:5242880 delay:v11 options:0 animations:0.4 completion:0.0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __55__MUImageAnalysisManager_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained visualSearchViewContainer];
  [v2 setAlpha:v1];
}

- (void)stopImageAnalysis
{
  [(MUImageAnalysisManager *)self _updateInfoButtonWithAnimation:1];
  [(MUImageAnalysisManager *)self cancelAllRequests];
  BOOL v3 = [(MUImageAnalysisManager *)self delegate];
  BOOL v4 = [v3 imageAnalysisView];
  id v5 = [(MUImageAnalysisManager *)self imageInteraction];
  [v4 removeInteraction:v5];

  id v6 = [(MUImageAnalysisManager *)self bottomRightButtonsContainer];
  [v6 removeFromSuperview];

  [(MUImageAnalysisManager *)self setBottomRightButtonsContainer:0];
}

- (void)cancelAllRequests
{
  NSLog(&cfstr_CancelAllImage.isa, a2);
  id v3 = [(MUImageAnalysisManager *)self imageAnalyzer];
  [v3 cancelAllRequests];
}

- (BOOL)hasAnalysis
{
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
  id v3 = [v2 analysis];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isAnalysisOngoing
{
  return [(MUImageAnalysisManager *)self imageAnalysisRequestId] != 0;
}

- (BOOL)addInteractionIfNeeded
{
  id v3 = [(MUImageAnalysisManager *)self delegate];
  BOOL v4 = [v3 imageAnalysisView];

  if (v4)
  {
    id v5 = [(MUImageAnalysisManager *)self imageInteraction];
    if (v5
      && ([v4 interactions],
          id v6 = objc_claimAutoreleasedReturnValue(),
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
  id v5 = [(MUImageAnalysisManager *)self delegate];
  id v10 = [v5 imageAnalysisView];

  if (v10)
  {
    uint64_t v6 = [(MUImageAnalysisManager *)self imageInteraction];
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
            [(MUImageAnalysisManager *)self _activateInteractionTypes:[(MUImageAnalysisManager *)self _defaultInteractionTypes]];
          }
          [(MUImageAnalysisManager *)self cancelAllRequests];
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
  BOOL v3 = [(MUImageAnalysisManager *)self delegate];
  BOOL v4 = [v3 imageAnalysisView];

  if (v4)
  {
    id v5 = [(MUImageAnalysisManager *)self imageInteraction];
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
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
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
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = ((unint64_t)[v2 activeInteractionTypes] >> 2) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSString)infoButtonGlyphName
{
  BOOL v3 = [(MUImageAnalysisManager *)self imageInteraction];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUImageAnalysisManager *)self imageInteraction];
    uint64_t v6 = [v5 visualSearchResultItems];
    char v7 = [v6 firstObject];

    if (objc_opt_respondsToSelector())
    {
      BOOL v8 = [v7 infoButtonGlyphName];
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
  return (NSString *)v8;
}

- (NSString)filledInfoButtonGlyphName
{
  BOOL v3 = [(MUImageAnalysisManager *)self imageInteraction];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUImageAnalysisManager *)self imageInteraction];
    uint64_t v6 = [v5 visualSearchResultItems];
    char v7 = [v6 firstObject];

    if (objc_opt_respondsToSelector())
    {
      BOOL v8 = [v7 filledInfoButtonGlyphName];
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
  return (NSString *)v8;
}

- (BOOL)isTextSelectionEnabled
{
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
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
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
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
  if ([(MUImageAnalysisManager *)self isVisualSearchEnabled]) {
    unint64_t v3 = [(MUImageAnalysisManager *)self _defaultInteractionTypes];
  }
  else {
    unint64_t v3 = 4;
  }
  [(MUImageAnalysisManager *)self _activateInteractionTypes:v3];
}

- (void)shouldHideInteraction:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v12 = [(MUImageAnalysisManager *)self delegate];
  char v7 = [v12 imageAnalysisView];
  if (v7)
  {
    BOOL v8 = [(MUImageAnalysisManager *)self imageInteraction];
    if (v8)
    {
      int v9 = [v7 interactions];
      int v10 = [v9 containsObject:v8];

      if (v5 && v10)
      {
        double v11 = [v12 imageAnalysisView];
        [v11 removeInteraction:v8];
LABEL_8:

        [(MUImageAnalysisManager *)self _updateAnalysisButtonWithAnimation:v4];
        [(MUImageAnalysisManager *)self _updateInfoButtonWithAnimation:v4];
        goto LABEL_9;
      }
      if (((v5 | v10) & 1) == 0)
      {
        double v11 = [v12 imageAnalysisView];
        [v11 addInteraction:v8];
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
  BOOL v5 = [(MUImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "dataDetectorExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)textExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(MUImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "textExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(MUImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "imageSubjectExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(MUImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "visualSearchExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(MUImageAnalysisManager *)self imageInteraction];
  char v6 = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", x, y);

  return v6;
}

- (BOOL)hasActiveTextSelection
{
  v2 = [(MUImageAnalysisManager *)self imageInteraction];
  char v3 = [v2 hasActiveTextSelection];

  return v3;
}

- (void)adjustImageInteractionForScrollView:(id)a3
{
  id v23 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v4 = [(MUImageAnalysisManager *)self delegate];
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
      CGFloat v22 = [(MUImageAnalysisManager *)self imageInteraction];
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
  [(MUImageAnalysisManager *)self setIsImageAnalysisPopoverPresented:1];
  id v3 = [(MUImageAnalysisManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 imageAnalysisInteractionWillPresentVisualSearchController];
  }
}

- (void)imageAnalysisPopoverDidDisappear
{
  [(MUImageAnalysisManager *)self setIsImageAnalysisPopoverPresented:0];
  id v3 = [(MUImageAnalysisManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 imageAnalysisInteractionDidDismissVisualSearchController];
  }
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  char v9 = (void (**)(void))a5;
  id v7 = NSStringFromSelector(a4);
  char v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"_define:", @"_translate:", @"_share:", @"_addShortcut:", 0);
  if ([v8 containsObject:v7]) {
    [(MUImageAnalysisManager *)self imageAnalysisPopoverWillAppear];
  }
  v9[2]();
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MUImageAnalysisManager *)self delegate];
  double v6 = [v5 presentingViewControllerForImageAnalysisInteraction:v4];

  return v6;
}

+ (BOOL)shouldStartImageAnalysisForPresentationMode:(unint64_t)a3
{
  return a3 == 0;
}

- (MUImageAnalysisManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUImageAnalysisManagerDelegate *)WeakRetained;
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

- (UIView)visualSearchViewContainer
{
  return self->_visualSearchViewContainer;
}

- (void)setVisualSearchViewContainer:(id)a3
{
}

- (UIView)analysisButtonContainer
{
  return self->_analysisButtonContainer;
}

- (void)setAnalysisButtonContainer:(id)a3
{
}

- (UIView)bottomRightButtonsContainer
{
  return self->_bottomRightButtonsContainer;
}

- (void)setBottomRightButtonsContainer:(id)a3
{
}

- (NSLayoutConstraint)bottomRightButtonsContainerRightConstraint
{
  return self->_bottomRightButtonsContainerRightConstraint;
}

- (void)setBottomRightButtonsContainerRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomRightButtonsContainerBottomConstraint
{
  return self->_bottomRightButtonsContainerBottomConstraint;
}

- (void)setBottomRightButtonsContainerBottomConstraint:(id)a3
{
}

- (UIView)presentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  return (UIView *)WeakRetained;
}

- (void)setPresentingView:(id)a3
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

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (BOOL)isImageAnalysisPopoverPresented
{
  return self->_isImageAnalysisPopoverPresented;
}

- (void)setIsImageAnalysisPopoverPresented:(BOOL)a3
{
  self->_isImageAnalysisPopoverPresented = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRightButtonsContainer, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_visualSearchViewContainer, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end