@interface HUClipScrubberViewController
- (BOOL)_cellBoundsContainsPlayhead:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isVisible;
- (BOOL)userIsScrubbing;
- (CADisplayLink)scrubberUpdateDisplayLink;
- (HFCameraAnalyticsCameraClipExportSessionEvent)exportSessionEvent;
- (HFCameraPlaybackEngine)playbackEngine;
- (HMCameraClipFetchVideoAssetContextOperation)exportDownloadOperation;
- (HUClipScrubberDataSource)dataSource;
- (HUClipScrubberScrollDelegate)clipScrollDelegate;
- (HUClipScrubberView)scrubberView;
- (HUClipScrubberViewController)initWithPlaybackEngine:(id)a3;
- (NSLayoutConstraint)feedbackPlatterTopAnchorConstraint;
- (NSLayoutConstraint)nearbyAccessoriesPlatterTopAnchorConstraint;
- (NSLayoutConstraint)scrubberViewLeftAnchorConstraint;
- (NSLayoutConstraint)scrubberViewRightAnchorConstraint;
- (NSLayoutConstraint)selectionPlatterTopAnchorConstraint;
- (UIButton)feedbackButton;
- (UIButton)nearbyAccessoriesButton;
- (UIButton)selectionButton;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (UIView)feedbackPlatter;
- (UIView)nearbyAccessoriesPlatter;
- (UIView)selectionPlatter;
- (double)currentScrubberResolution;
- (id)_displayableURLForCameraClipURL:(id)a3;
- (id)_feedbackClip;
- (id)accessoryButtonHandler;
- (id)beginEditingHandler;
- (id)endEditingHandler;
- (id)platterWithView:(id)a3;
- (unint64_t)displayMode;
- (unint64_t)lastEngineMode;
- (unint64_t)pinchGestureCount;
- (void)_addConstraints;
- (void)_createAndStartDisplayLink;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)_removeDisplayLink;
- (void)_scrubberDisplayLinkTick:(id)a3;
- (void)changeToLiveMode;
- (void)changeToLiveModeIfNeeded;
- (void)consentController:(id)a3 didFinishConsentWithAnswer:(BOOL)a4;
- (void)dealloc;
- (void)deleteClip;
- (void)didDoubleTap:(id)a3;
- (void)didPinch:(id)a3;
- (void)didSelectFeedbackButton;
- (void)didSelectRightActionButton:(id)a3;
- (void)didTap:(id)a3;
- (void)dismissEditInterface;
- (void)donateAllClips;
- (void)donateClip:(id)a3;
- (void)exportCurrentClipWithCompletion:(id)a3;
- (void)exportLocalClipAtURL:(id)a3;
- (void)loadView;
- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4;
- (void)presentFeedbackConsent;
- (void)presentFeedbackOptions;
- (void)presentPreviouslySubmittedClipAlert;
- (void)reloadClipManager:(id)a3;
- (void)removeLiveButtonHighlighting;
- (void)resetPinchGestureCount;
- (void)setAccessoryButtonHandler:(id)a3;
- (void)setBeginEditingHandler:(id)a3;
- (void)setClipScrollDelegate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setEndEditingHandler:(id)a3;
- (void)setExportDownloadOperation:(id)a3;
- (void)setExportSessionEvent:(id)a3;
- (void)setFeedbackButton:(id)a3;
- (void)setFeedbackPlatter:(id)a3;
- (void)setFeedbackPlatterTopAnchorConstraint:(id)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setLastEngineMode:(unint64_t)a3;
- (void)setNearbyAccessoriesButton:(id)a3;
- (void)setNearbyAccessoriesPlatter:(id)a3;
- (void)setNearbyAccessoriesPlatterTopAnchorConstraint:(id)a3;
- (void)setPinchGestureCount:(unint64_t)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setScrubberUpdateDisplayLink:(id)a3;
- (void)setScrubberView:(id)a3;
- (void)setScrubberViewLeftAnchorConstraint:(id)a3;
- (void)setScrubberViewRightAnchorConstraint:(id)a3;
- (void)setSelectionButton:(id)a3;
- (void)setSelectionPlatter:(id)a3;
- (void)setSelectionPlatterTopAnchorConstraint:(id)a3;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)showAssociatedAccessories;
- (void)showDeleteInterface;
- (void)showEditInterface;
- (void)submitCurrentClip;
- (void)togglePlayPause;
- (void)updateAccessoryViews;
- (void)updateDisplayForLiveMode;
- (void)updatePlaybackPosition:(id)a3 animated:(BOOL)a4;
- (void)updateScrubberDisplayLinkState;
- (void)updateScrubberViewAndAssociatedConstraints;
- (void)updateSelectionPlatterDisplay;
- (void)verifySubmitAllClips;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUClipScrubberViewController

- (HUClipScrubberViewController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUClipScrubberViewController;
  v5 = [(HUClipScrubberViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v8 = [MEMORY[0x1E4F68FC0] defaultOptions];
    [v4 addObserver:v6 withOptions:v8];

    v9 = [v4 cameraProfile];
    v10 = [v9 clipManager];
    [(HUClipScrubberViewController *)v6 reloadClipManager:v10];
  }
  return v6;
}

- (void)dealloc
{
  +[HUPosterFrameViewCache purgeCache];
  v3 = [MEMORY[0x1E4F69138] sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  [(HUClipScrubberViewController *)&v4 dealloc];
}

- (void)reloadClipManager:(id)a3
{
  objc_super v4 = [(HUClipScrubberViewController *)self dataSource];

  if (v4)
  {
    v5 = [(HUClipScrubberViewController *)self dataSource];
    [v5 reloadEvents];
  }
  else
  {
    v6 = [HUClipScrubberDataSource alloc];
    id v7 = [(HUClipScrubberViewController *)self playbackEngine];
    v8 = [(HUClipScrubberDataSource *)v6 initWithPlaybackEngine:v7];
    [(HUClipScrubberViewController *)self setDataSource:v8];

    v9 = [(HUClipScrubberViewController *)self playbackEngine];
    v10 = [(HUClipScrubberViewController *)self dataSource];
    [v10 setPlaybackEngine:v9];

    v11 = [[HUClipScrubberScrollDelegate alloc] initWithDataSource:self->_dataSource];
    [(HUClipScrubberViewController *)self setClipScrollDelegate:v11];

    objc_super v12 = [(HUClipScrubberViewController *)self playbackEngine];
    v13 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    [v13 setPlaybackEngine:v12];

    v14 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    v15 = [(HUClipScrubberViewController *)self scrubberView];
    v16 = [v15 clipCollectionView];
    [v16 setDelegate:v14];

    v17 = [(HUClipScrubberViewController *)self scrubberView];
    v18 = [v17 clipCollectionView];
    v19 = [(HUClipScrubberViewController *)self dataSource];
    [v19 setClipCollectionView:v18];

    v5 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    v20 = [(HUClipScrubberViewController *)self scrubberView];
    v21 = [v20 clipCollectionView];
    [v5 updateCollectionView:v21];
  }

  [(HUClipScrubberViewController *)self updateSelectionPlatterDisplay];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  objc_super v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUClipScrubberViewController *)self setView:v4];

  v5 = [(HUClipScrubberViewController *)self view];
  v6 = [(HUClipScrubberViewController *)self scrubberView];
  [v5 addSubview:v6];

  id v7 = [(HUClipScrubberViewController *)self view];
  v8 = [(HUClipScrubberViewController *)self selectionPlatter];
  [v7 addSubview:v8];

  v9 = [(HUClipScrubberViewController *)self view];
  v10 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatter];
  [v9 addSubview:v10];

  v11 = [(HUClipScrubberViewController *)self view];
  objc_super v12 = [(HUClipScrubberViewController *)self feedbackPlatter];
  [v11 addSubview:v12];

  [(HUClipScrubberViewController *)self changeToLiveModeIfNeeded];
  [(HUClipScrubberViewController *)self updateAccessoryViews];
  v13 = [(HUClipScrubberViewController *)self scrubberView];
  [v13 updateDisplayMode:0];

  [(HUClipScrubberViewController *)self updateScrubberViewAndAssociatedConstraints];
  id v14 = [MEMORY[0x1E4F69138] sharedInstance];
  [v14 addObserver:self];
}

- (void)updateScrubberViewAndAssociatedConstraints
{
  id v3 = [(HUClipScrubberViewController *)self dataSource];
  int v4 = [v3 isEditing];

  if (!v4)
  {
    v5 = [(HUClipScrubberViewController *)self traitCollection];
    int v6 = objc_msgSend(v5, "hu_hasExtendedWidth");

    id v7 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatterTopAnchorConstraint];
    v8 = v7;
    if (v6)
    {
      [v7 setConstant:63.0];

      v9 = [(HUClipScrubberViewController *)self selectionPlatterTopAnchorConstraint];
      [v9 setConstant:63.0];

      v10 = [(HUClipScrubberViewController *)self scrubberViewLeftAnchorConstraint];
      [v10 setConstant:63.0];

      v11 = [(HUClipScrubberViewController *)self scrubberViewRightAnchorConstraint];
      double v12 = -63.0;
      goto LABEL_6;
    }
    [v7 setConstant:0.0];

    v13 = [(HUClipScrubberViewController *)self selectionPlatterTopAnchorConstraint];
    [v13 setConstant:0.0];
  }
  id v14 = [(HUClipScrubberViewController *)self scrubberViewLeftAnchorConstraint];
  [v14 setConstant:0.0];

  v11 = [(HUClipScrubberViewController *)self scrubberViewRightAnchorConstraint];
  double v12 = 0.0;
LABEL_6:
  id v15 = v11;
  [v11 setConstant:v12];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)HUClipScrubberViewController;
  id v7 = a4;
  -[HUClipScrubberViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(HUClipScrubberViewController *)self dataSource];
  [v8 setSelectionViewHidden:1];

  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6385548;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E6385548;
  [v7 animateAlongsideTransition:v10 completion:v9];
}

uint64_t __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) traitCollection];
  int v3 = objc_msgSend(v2, "hu_hasExtendedWidth");

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) dataSource];
    uint64_t v5 = [v4 displayMode];

    if (!v5)
    {
      int v6 = [*(id *)(a1 + 32) scrubberView];
      [v6 updateDisplayMode:0];
    }
  }
  id v7 = *(void **)(a1 + 32);

  return [v7 updateScrubberViewAndAssociatedConstraints];
}

void __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dataSource];
  [v1 updateSelectionViewIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  [(HUClipScrubberViewController *)&v4 viewWillAppear:a3];
  [(HUClipScrubberViewController *)self setIsVisible:1];
  [(HUClipScrubberViewController *)self _addConstraints];
  [(HUClipScrubberViewController *)self _createAndStartDisplayLink];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  [(HUClipScrubberViewController *)&v4 viewWillDisappear:a3];
  [(HUClipScrubberViewController *)self _removeDisplayLink];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  [(HUClipScrubberViewController *)&v4 viewDidDisappear:a3];
  [(HUClipScrubberViewController *)self setIsVisible:0];
}

- (void)_createAndStartDisplayLink
{
  int v3 = [(HUClipScrubberViewController *)self scrubberUpdateDisplayLink];

  if (v3)
  {
    objc_super v4 = [(HUClipScrubberViewController *)self scrubberUpdateDisplayLink];
    [v4 invalidate];
  }
  uint64_t v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__scrubberDisplayLinkTick_];
  [(HUClipScrubberViewController *)self setScrubberUpdateDisplayLink:v5];

  int v6 = [(HUClipScrubberViewController *)self scrubberUpdateDisplayLink];
  id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

  [(HUClipScrubberViewController *)self updateScrubberDisplayLinkState];
}

- (void)_removeDisplayLink
{
  id v2 = [(HUClipScrubberViewController *)self scrubberUpdateDisplayLink];
  [v2 invalidate];
}

- (void)_addConstraints
{
  v75[16] = *MEMORY[0x1E4F143B8];
  int v3 = [(HUClipScrubberViewController *)self scrubberView];
  objc_super v4 = [v3 rightAnchor];
  uint64_t v5 = [(HUClipScrubberViewController *)self view];
  int v6 = [v5 rightAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [(HUClipScrubberViewController *)self setScrubberViewRightAnchorConstraint:v7];

  v8 = [(HUClipScrubberViewController *)self scrubberView];
  v9 = [v8 leftAnchor];
  v10 = [(HUClipScrubberViewController *)self view];
  objc_super v11 = [v10 leftAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  [(HUClipScrubberViewController *)self setScrubberViewLeftAnchorConstraint:v12];

  v13 = [(HUClipScrubberViewController *)self selectionPlatter];
  id v14 = [v13 topAnchor];
  id v15 = [(HUClipScrubberViewController *)self view];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [(HUClipScrubberViewController *)self setSelectionPlatterTopAnchorConstraint:v17];

  v18 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatter];
  v19 = [v18 topAnchor];
  v20 = [(HUClipScrubberViewController *)self view];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [(HUClipScrubberViewController *)self setNearbyAccessoriesPlatterTopAnchorConstraint:v22];

  v23 = [(HUClipScrubberViewController *)self feedbackPlatter];
  v24 = [v23 topAnchor];
  v25 = [(HUClipScrubberViewController *)self view];
  v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [(HUClipScrubberViewController *)self setFeedbackPlatterTopAnchorConstraint:v27];

  v74 = [(HUClipScrubberViewController *)self scrubberViewLeftAnchorConstraint];
  v75[0] = v74;
  v73 = [(HUClipScrubberViewController *)self scrubberViewRightAnchorConstraint];
  v75[1] = v73;
  v72 = [(HUClipScrubberViewController *)self scrubberView];
  v71 = [v72 heightAnchor];
  v70 = [v71 constraintEqualToConstant:47.0];
  v75[2] = v70;
  v69 = [(HUClipScrubberViewController *)self scrubberView];
  v67 = [v69 topAnchor];
  v68 = [(HUClipScrubberViewController *)self view];
  v66 = [v68 topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:63.0];
  v75[3] = v65;
  v64 = [(HUClipScrubberViewController *)self selectionPlatter];
  v62 = [v64 leftAnchor];
  v63 = [(HUClipScrubberViewController *)self view];
  v61 = [v63 leftAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v75[4] = v60;
  v59 = [(HUClipScrubberViewController *)self selectionPlatter];
  v58 = [v59 widthAnchor];
  v57 = [v58 constraintEqualToConstant:54.0];
  v75[5] = v57;
  v56 = [(HUClipScrubberViewController *)self selectionPlatter];
  v55 = [v56 heightAnchor];
  v54 = [v55 constraintEqualToConstant:47.0];
  v75[6] = v54;
  v53 = [(HUClipScrubberViewController *)self selectionPlatterTopAnchorConstraint];
  v75[7] = v53;
  v52 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatter];
  v50 = [v52 rightAnchor];
  v51 = [(HUClipScrubberViewController *)self view];
  v49 = [v51 rightAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v75[8] = v48;
  v46 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatter];
  v45 = [v46 heightAnchor];
  v44 = [v45 constraintEqualToConstant:47.0];
  v75[9] = v44;
  v43 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatter];
  v42 = [v43 widthAnchor];
  v41 = [v42 constraintEqualToConstant:54.0];
  v75[10] = v41;
  v40 = [(HUClipScrubberViewController *)self nearbyAccessoriesPlatterTopAnchorConstraint];
  v75[11] = v40;
  v39 = [(HUClipScrubberViewController *)self feedbackPlatter];
  v38 = [v39 rightAnchor];
  v28 = [(HUClipScrubberViewController *)self view];
  v29 = [v28 rightAnchor];
  v30 = [v38 constraintEqualToAnchor:v29];
  v75[12] = v30;
  v31 = [(HUClipScrubberViewController *)self feedbackPlatter];
  v32 = [v31 heightAnchor];
  v33 = [v32 constraintEqualToConstant:45.0];
  v75[13] = v33;
  v34 = [(HUClipScrubberViewController *)self feedbackPlatter];
  v35 = [v34 widthAnchor];
  v36 = [v35 constraintEqualToConstant:45.0];
  v75[14] = v36;
  v37 = [(HUClipScrubberViewController *)self feedbackPlatterTopAnchorConstraint];
  v75[15] = v37;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:16];

  [MEMORY[0x1E4F28DC8] activateConstraints:v47];
}

- (void)togglePlayPause
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = [(HUClipScrubberViewController *)self playbackEngine];
  uint64_t v4 = [v3 timeControlStatus];

  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4 != 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "User toggled playback engine [Playing:%{BOOL}d].", (uint8_t *)v8, 8u);
  }

  int v6 = [(HUClipScrubberViewController *)self playbackEngine];
  id v7 = v6;
  if (v4) {
    [v6 pause];
  }
  else {
    [v6 play];
  }
}

- (void)changeToLiveModeIfNeeded
{
  int v3 = [(HUClipScrubberViewController *)self playbackEngine];
  uint64_t v4 = [v3 currentClip];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    int v6 = [(HUClipScrubberViewController *)self playbackEngine];
    id v7 = [v6 playbackPosition];
    uint64_t v8 = [v7 contentType];

    if (v8) {
      return;
    }
  }
  else
  {
  }

  [(HUClipScrubberViewController *)self changeToLiveMode];
}

- (void)changeToLiveMode
{
  int v3 = [MEMORY[0x1E4F68FC8] livePosition];
  uint64_t v4 = [(HUClipScrubberViewController *)self playbackEngine];
  [v4 setPlaybackPosition:v3];

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    id v7 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    uint64_t v5 = [(HUClipScrubberViewController *)self scrubberView];
    int v6 = [v5 rightActionButton];
    [v6 setBackgroundColor:v7];
  }
}

- (void)updateDisplayForLiveMode
{
  int v3 = [(HUClipScrubberViewController *)self selectionButton];
  [v3 setEnabled:0];

  uint64_t v4 = [(HUClipScrubberViewController *)self clipScrollDelegate];
  char v5 = [v4 isUserScrubbing];

  if ((v5 & 1) == 0)
  {
    int v6 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    [v6 setShouldIgnoreScrolling:1];

    id v7 = [(HUClipScrubberViewController *)self scrubberView];
    [v7 navigateToLivePosition];

    id v8 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    [v8 setShouldIgnoreScrolling:0];
  }
}

- (void)showAssociatedAccessories
{
  id v2 = [(HUClipScrubberViewController *)self accessoryButtonHandler];
  v2[2]();
}

- (void)resetPinchGestureCount
{
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = [v6 isUserScrubbing];
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "User Scrubbing:%{BOOL}d updated playback position:%@", (uint8_t *)v9, 0x12u);
  }

  [(HUClipScrubberViewController *)self updateAccessoryViews];
  [(HUClipScrubberViewController *)self updatePlaybackPosition:v7 animated:1];
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 timeControlStatusDescription];
    int v8 = 138412290;
    uint64_t v9 = v7;
  }
  [(HUClipScrubberViewController *)self updateAccessoryViews];
  [(HUClipScrubberViewController *)self updateScrubberDisplayLinkState];
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HUClipScrubberViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  v7[3] = &unk_1E63850E0;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __70__HUClipScrubberViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return [*(id *)(result + 40) removeLiveButtonHighlighting];
  }
  return result;
}

- (double)currentScrubberResolution
{
  int v3 = [(HUClipScrubberViewController *)self playbackEngine];
  uint64_t v4 = [v3 currentClip];

  if (v4)
  {
    id v5 = [(HUClipScrubberViewController *)self dataSource];
    [v5 scrubbingResolutionForClip:v4];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)updateScrubberDisplayLinkState
{
  id v5 = [(HUClipScrubberViewController *)self playbackEngine];
  if ([v5 timeControlStatus]) {
    uint64_t v3 = [(HUClipScrubberViewController *)self isVisible] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = [(HUClipScrubberViewController *)self scrubberUpdateDisplayLink];
  [v4 setPaused:v3];
}

- (void)_scrubberDisplayLinkTick:(id)a3
{
  id v5 = [(HUClipScrubberViewController *)self playbackEngine];
  uint64_t v4 = [v5 playbackPosition];
  [(HUClipScrubberViewController *)self updatePlaybackPosition:v4 animated:0];
}

- (void)updateAccessoryViews
{
  uint64_t v3 = [(HUClipScrubberViewController *)self playbackEngine];
  BOOL v4 = [v3 timelineState] == 2;
  id v5 = [(HUClipScrubberViewController *)self selectionButton];
  [v5 setEnabled:v4];

  id v7 = [(HUClipScrubberViewController *)self scrubberView];
  double v6 = [(HUClipScrubberViewController *)self playbackEngine];
  [v7 didUpdatePlaybackEngine:v6];
}

- (void)updatePlaybackPosition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HUClipScrubberViewController *)self dataSource];
  id v8 = [v6 clipPlaybackDate];
  unint64_t v9 = [(HUClipScrubberViewController *)self lastEngineMode];
  uint64_t v10 = [(HUClipScrubberViewController *)self playbackEngine];
  uint64_t v11 = [v10 engineMode];

  if (v9 != v11)
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(HUClipScrubberViewController *)self lastEngineMode];
      id v14 = [(HUClipScrubberViewController *)self playbackEngine];
      *(_DWORD *)buf = 134218240;
      unint64_t v37 = v13;
      __int16 v38 = 2048;
      uint64_t v39 = [v14 engineMode];
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Updating the last engine mode from %lu to %lu", buf, 0x16u);
    }
    id v15 = [(HUClipScrubberViewController *)self playbackEngine];
    -[HUClipScrubberViewController setLastEngineMode:](self, "setLastEngineMode:", [v15 engineMode]);

    [(HUClipScrubberViewController *)self updateAccessoryViews];
    if ([v6 contentType] && objc_msgSend(v7, "currentTimelineState") != 1)
    {
      if (![MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
        goto LABEL_11;
      }
      uint64_t v16 = [MEMORY[0x1E4F428B8] clearColor];
    }
    else
    {
      [(HUClipScrubberViewController *)self updateDisplayForLiveMode];
      if (![MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
        goto LABEL_11;
      }
      uint64_t v16 = [MEMORY[0x1E4F428B8] orangeColor];
    }
    v17 = (void *)v16;
    v18 = [(HUClipScrubberViewController *)self scrubberView];
    v19 = [v18 rightActionButton];
    [v19 setBackgroundColor:v17];
  }
LABEL_11:
  if ([v6 contentType])
  {
    [v7 setCurrentDate:v8];
    v20 = [(HUClipScrubberViewController *)self clipScrollDelegate];
    char v21 = [v20 isUserScrubbing];

    if ((v21 & 1) == 0)
    {
      v22 = [v6 clip];
      v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        v25 = [(HUClipScrubberViewController *)self playbackEngine];
        id v24 = [v25 currentClip];
      }
      [v7 setCurrentEvent:v24];
      v26 = [v6 clipPlaybackDate];
      [v7 setCurrentDate:v26];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke;
      aBlock[3] = &unk_1E6386340;
      id v27 = v24;
      id v33 = v27;
      v34 = self;
      id v35 = v7;
      v28 = _Block_copy(aBlock);
      v29 = v28;
      if (v4)
      {
        v30 = [(HUClipScrubberViewController *)self clipScrollDelegate];
        [v30 setShouldIgnoreScrolling:1];

        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke_2;
        v31[3] = &unk_1E6386730;
        v31[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v29 animations:v31 completion:0.2];
      }
      else
      {
        (*((void (**)(void *))v28 + 2))(v28);
      }
    }
  }
  else
  {
    [(HUClipScrubberViewController *)self updateDisplayForLiveMode];
  }
}

void __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) scrubberView];
    [*(id *)(a1 + 48) offsetForEvent:*(void *)(a1 + 32)];
    objc_msgSend(v2, "navigateToOffset:");
  }
}

void __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clipScrollDelegate];
  [v1 setShouldIgnoreScrolling:0];
}

- (BOOL)userIsScrubbing
{
  id v2 = [(HUClipScrubberViewController *)self scrubberView];
  uint64_t v3 = [v2 clipCollectionView];
  char v4 = [v3 isTracking];

  return v4;
}

- (void)didPinch:(id)a3
{
  id v8 = a3;
  char v4 = [(HUClipScrubberViewController *)self dataSource];
  id v5 = [v4 timeController];
  [v5 setUserControlled:1];

  switch([v8 state])
  {
    case 1:
      [(HUClipScrubberViewController *)self setPinchGestureCount:[(HUClipScrubberViewController *)self pinchGestureCount] + 1];
      id v7 = [(HUClipScrubberViewController *)self clipScrollDelegate];
      [v7 setShouldIgnoreScrolling:1];

      id v6 = [(HUClipScrubberViewController *)self dataSource];
      [v6 beginTimeScaleTrackingForPinchGesture:v8];
      goto LABEL_5;
    case 2:
      id v6 = [(HUClipScrubberViewController *)self dataSource];
      [v6 changeTimeScaleForPinchGesture:v8];
      goto LABEL_5;
    case 3:
    case 5:
      id v6 = [(HUClipScrubberViewController *)self clipScrollDelegate];
      [v6 setShouldIgnoreScrolling:0];
LABEL_5:

      break;
    default:
      break;
  }
}

- (void)didTap:(id)a3
{
  id v32 = a3;
  if ([v32 numberOfTouches] == 1)
  {
    char v4 = [(HUClipScrubberViewController *)self scrubberView];
    id v5 = [v4 clipCollectionView];
    [v32 locationOfTouch:0 inView:v5];
    double v7 = v6;
    double v9 = v8;

    uint64_t v10 = [(HUClipScrubberViewController *)self scrubberView];
    uint64_t v11 = [v10 clipCollectionView];
    uint64_t v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v7, v9);

    unint64_t v13 = [(HUClipScrubberViewController *)self dataSource];
    LODWORD(v11) = [v13 isValidRecordingEventAtIndexPath:v12];

    if (!v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v14 = [(HUClipScrubberViewController *)self dataSource];
    [v14 updateToClipAtIndexPath:v12];

    id v15 = [(HUClipScrubberViewController *)self scrubberView];
    uint64_t v16 = [v15 clipCollectionView];
    v17 = [v16 cellForItemAtIndexPath:v12];

    LODWORD(v15) = [(HUClipScrubberViewController *)self _cellBoundsContainsPlayhead:v17];
    v18 = [(HUClipScrubberViewController *)self dataSource];
    v19 = v18;
    if (v15) {
      [v18 selectedDateFromCell:v17 atOffset:v7];
    }
    else {
    v20 = [v18 startDateFromCell:v17];
    }

    objc_opt_class();
    char v21 = [(HUClipScrubberViewController *)self dataSource];
    v22 = [v21 currentEvent];
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    v25 = [(HUClipScrubberViewController *)self playbackEngine];
    [v25 updatePlaybackPositionToDate:v20 usingClip:v24];

    v26 = [(HUClipScrubberViewController *)self dataSource];
    LODWORD(v25) = [v26 isEditing];

    if (v25)
    {
      id v27 = [(HUClipScrubberViewController *)self scrubberView];
      v28 = [v27 clipCollectionView];
      [v28 selectItemAtIndexPath:v12 animated:0 scrollPosition:0];
    }
    else
    {
      v29 = [(HUClipScrubberViewController *)self dataSource];
      v30 = [v29 timeController];
      int v31 = [v30 isAtMinimumZoom];

      if (!v31)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v27 = [(HUClipScrubberViewController *)self playbackEngine];
      [v27 play];
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (void)didDoubleTap:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v4 = [(HUClipScrubberViewController *)self dataSource];
  id v5 = [v4 timeController];
  [v5 setUserControlled:1];

  double v6 = [(HUClipScrubberViewController *)self dataSource];
  double v7 = [v6 timeController];
  int v8 = [v7 isAtMinimumZoom];

  double v9 = [(HUClipScrubberViewController *)self dataSource];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 expandToMaximumZoom];

    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(HUClipScrubberViewController *)self dataSource];
      unint64_t v13 = [v12 timeController];
      [v13 timeScale];
      int v17 = 134217984;
      uint64_t v18 = v14;
      id v15 = "Double tapped the time scale = %.2f to zoom in.";
LABEL_6:
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    [v9 shrinkToMinimumZoom];

    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(HUClipScrubberViewController *)self dataSource];
      unint64_t v13 = [v12 timeController];
      [v13 timeScale];
      int v17 = 134217984;
      uint64_t v18 = v16;
      id v15 = "Double tapped the time scale = %.2f to zoom out.";
      goto LABEL_6;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HUClipScrubberViewController *)self singleTapGestureRecognizer];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [(HUClipScrubberViewController *)self doubleTapGestureRecognizer];
    char v11 = [v6 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)didSelectRightActionButton:(id)a3
{
  char v4 = [(HUClipScrubberViewController *)self dataSource];
  uint64_t v5 = [v4 displayMode];

  if (v5)
  {
    [(HUClipScrubberViewController *)self showDeleteInterface];
  }
  else
  {
    [(HUClipScrubberViewController *)self changeToLiveMode];
  }
}

- (HUClipScrubberView)scrubberView
{
  scrubberView = self->_scrubberView;
  if (!scrubberView)
  {
    char v4 = [HUClipScrubberView alloc];
    uint64_t v5 = -[HUClipScrubberView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_scrubberView;
    self->_scrubberView = v5;

    [(HUClipScrubberView *)self->_scrubberView setTranslatesAutoresizingMaskIntoConstraints:0];
    clipScrollDelegate = self->_clipScrollDelegate;
    int v8 = [(HUClipScrubberView *)self->_scrubberView clipCollectionView];
    [v8 setDelegate:clipScrollDelegate];

    int v9 = [(HUClipScrubberView *)self->_scrubberView playPauseButton];
    [v9 addTarget:self action:sel_togglePlayPause forControlEvents:64];

    uint64_t v10 = [(HUClipScrubberView *)self->_scrubberView rightActionButton];
    [v10 addTarget:self action:sel_didSelectRightActionButton_ forControlEvents:64];

    char v11 = (void *)[objc_alloc(MEMORY[0x1E4F42C80]) initWithTarget:self action:sel_didPinch_];
    uint64_t v12 = [(HUClipScrubberViewController *)self view];
    [v12 addGestureRecognizer:v11];

    unint64_t v13 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_didTap_];
    singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
    self->_singleTapGestureRecognizer = v13;

    [(UITapGestureRecognizer *)self->_singleTapGestureRecognizer setDelegate:self];
    id v15 = [(HUClipScrubberView *)self->_scrubberView clipCollectionView];
    [v15 addGestureRecognizer:self->_singleTapGestureRecognizer];

    uint64_t v16 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_didDoubleTap_];
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v16;

    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setMaximumIntervalBetweenSuccessiveTaps:0.15];
    uint64_t v18 = [(HUClipScrubberView *)self->_scrubberView clipCollectionView];
    [v18 addGestureRecognizer:self->_doubleTapGestureRecognizer];

    if ([MEMORY[0x1E4F68FF8] internalCameraFeedbackSupported])
    {
      uint64_t v19 = [(HUClipScrubberViewController *)self feedbackButton];
      [v19 addTarget:self action:sel_didSelectFeedbackButton forControlEvents:64];
    }
    scrubberView = self->_scrubberView;
  }

  return scrubberView;
}

- (UIButton)selectionButton
{
  selectionButton = self->_selectionButton;
  if (!selectionButton)
  {
    char v4 = +[HUClipScrubberControlButton buttonWithType:1];
    [(UIButton *)v4 addTarget:self action:sel_showEditInterface forControlEvents:64];
    uint64_t v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIButton *)v4 setTintColor:v5];

    id v6 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"square.and.arrow.up"];
    id v7 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
    int v8 = [v6 imageWithConfiguration:v7];

    [(UIButton *)v4 setImage:v8 forState:0];
    int v9 = self->_selectionButton;
    self->_selectionButton = v4;

    selectionButton = self->_selectionButton;
  }

  return selectionButton;
}

- (UIButton)nearbyAccessoriesButton
{
  nearbyAccessoriesButton = self->_nearbyAccessoriesButton;
  if (!nearbyAccessoriesButton)
  {
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberNearbyAccessoryButton");
    char v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    [(UIButton *)v4 addTarget:self action:sel_showAssociatedAccessories forControlEvents:64];
    uint64_t v5 = self->_nearbyAccessoriesButton;
    self->_nearbyAccessoriesButton = v4;

    nearbyAccessoriesButton = self->_nearbyAccessoriesButton;
  }

  return nearbyAccessoriesButton;
}

- (UIButton)feedbackButton
{
  feedbackButton = self->_feedbackButton;
  if (!feedbackButton)
  {
    char v4 = +[HUClipScrubberControlButton buttonWithType:1];
    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = [(UIButton *)v4 layer];
    [v5 setCornerRadius:8.0];

    id v6 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"apple.bubble.middle.bottom"];
    id v7 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
    int v8 = [v6 imageWithConfiguration:v7];

    [(UIButton *)v4 setImage:v8 forState:0];
    int v9 = self->_feedbackButton;
    self->_feedbackButton = v4;

    feedbackButton = self->_feedbackButton;
  }

  return feedbackButton;
}

- (UIView)feedbackPlatter
{
  feedbackPlatter = self->_feedbackPlatter;
  if (!feedbackPlatter)
  {
    char v4 = [(HUClipScrubberViewController *)self feedbackButton];
    uint64_t v5 = [(HUClipScrubberViewController *)self platterWithView:v4];

    [(UIView *)v5 setHidden:1];
    id v6 = self->_feedbackPlatter;
    self->_feedbackPlatter = v5;

    feedbackPlatter = self->_feedbackPlatter;
  }

  return feedbackPlatter;
}

- (id)platterWithView:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F16708];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [v5 addSubview:v4 applyingMaterialStyle:0 tintEffectStyle:1];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 _setContinuousCornerRadius:8.0];

  return v5;
}

- (UIView)selectionPlatter
{
  selectionPlatter = self->_selectionPlatter;
  if (!selectionPlatter)
  {
    id v4 = [(HUClipScrubberViewController *)self selectionButton];
    id v5 = [(HUClipScrubberViewController *)self platterWithView:v4];

    id v6 = self->_selectionPlatter;
    self->_selectionPlatter = v5;

    selectionPlatter = self->_selectionPlatter;
  }

  return selectionPlatter;
}

- (UIView)nearbyAccessoriesPlatter
{
  nearbyAccessoriesPlatter = self->_nearbyAccessoriesPlatter;
  if (!nearbyAccessoriesPlatter)
  {
    id v4 = [(HUClipScrubberViewController *)self nearbyAccessoriesButton];
    id v5 = [(HUClipScrubberViewController *)self platterWithView:v4];

    id v6 = self->_nearbyAccessoriesPlatter;
    self->_nearbyAccessoriesPlatter = v5;

    nearbyAccessoriesPlatter = self->_nearbyAccessoriesPlatter;
  }

  return nearbyAccessoriesPlatter;
}

- (BOOL)_cellBoundsContainsPlayhead:(id)a3
{
  id v4 = a3;
  id v5 = [(HUClipScrubberViewController *)self scrubberView];
  id v6 = [v5 clipCollectionView];
  [v4 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = [(HUClipScrubberViewController *)self scrubberView];
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  id v24 = [(HUClipScrubberViewController *)self scrubberView];
  v25 = [v24 playheadView];
  [v25 frame];
  v28.origin.x = v17;
  v28.origin.y = v19;
  v28.size.double width = v21;
  v28.size.double height = v23;
  LOBYTE(v5) = CGRectIntersectsRect(v27, v28);

  return (char)v5;
}

- (unint64_t)displayMode
{
  id v2 = [(HUClipScrubberViewController *)self dataSource];
  unint64_t v3 = [v2 displayMode];

  return v3;
}

- (void)presentFeedbackConsent
{
  id v5 = [[HUFeedbackConsentViewController alloc] initWithConsentDelegate:self];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
  [v3 setModalPresentationStyle:2];
  id v4 = [(HUClipScrubberViewController *)self parentViewController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (void)consentController:(id)a3 didFinishConsentWithAnswer:(BOOL)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__HUClipScrubberViewController_consentController_didFinishConsentWithAnswer___block_invoke;
    v4[3] = &unk_1E6386018;
    v4[4] = self;
    [(HUClipScrubberViewController *)self dismissViewControllerAnimated:1 completion:v4];
  }
}

uint64_t __77__HUClipScrubberViewController_consentController_didFinishConsentWithAnswer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didSelectFeedbackButton];
}

- (void)exportCurrentClipWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = [(HUClipScrubberViewController *)self dataSource];
  id v6 = [v5 currentEvent];
  uint64_t v7 = [v6 containerType];

  if (v7 == 2)
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = [(HUClipScrubberViewController *)self dataSource];
      double v10 = [v9 currentEvent];
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Unable to share event:%@.", buf, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    double v11 = [(HUClipScrubberViewController *)self dataSource];
    double v12 = [v11 currentEvent];
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
    double v8 = v13;

    if (v8)
    {
      double v14 = (void *)[objc_alloc(MEMORY[0x1E4F68F48]) initWithCameraClip:v8];
      [(HUClipScrubberViewController *)self setExportSessionEvent:v14];

      id v15 = [MEMORY[0x1E4F68FF8] videoDestinationURLForCameraClip:v8];
      int v16 = [MEMORY[0x1E4F68F68] hasCachedRecordingForCameraClip:v8];
      CGFloat v17 = HFLogForCategory();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Exportable file already exists at path:%@.", buf, 0xCu);
        }

        v4[2](v4);
        [(HUClipScrubberViewController *)self exportLocalClipAtURL:v15];
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v36 = v8;
          _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Requesting downloaded video asset for export for clip:%@", buf, 0xCu);
        }

        id v21 = objc_alloc(MEMORY[0x1E4F2E6F0]);
        double v22 = [(HUClipScrubberViewController *)self dataSource];
        CGFloat v23 = [v22 playbackEngine];
        id v24 = [v23 cameraProfile];
        v25 = [v24 clipManager];
        v26 = (void *)[v21 initWithClipManager:v25 clip:v8];

        [v26 setClipDestinationFileURL:v15];
        [v26 setDownloadProgressHandler:&__block_literal_global_211];
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_64;
        v30 = &unk_1E638F270;
        int v31 = v8;
        id v32 = self;
        v34 = v4;
        id v15 = v15;
        id v33 = v15;
        [v26 setFetchVideoAssetContextCompletionBlock:&v27];
        objc_msgSend(v26, "start", v27, v28, v29, v30);
        [(HUClipScrubberViewController *)self setExportDownloadOperation:v26];
      }
    }
    else
    {
      CGFloat v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE345000, v19, OS_LOG_TYPE_ERROR, "Unable to share nil clip.", buf, 2u);
      }

      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
      double v20 = [MEMORY[0x1E4F69110] sharedHandler];
      [v20 handleError:v15];
    }
  }
}

void __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Exporting with progress ...%lu", (uint8_t *)&v4, 0xCu);
  }
}

void __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error: %@ fetching clip: %@.", buf, 0x16u);
    }

    if ([v4 code] != 12)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_65;
      v12[3] = &unk_1E63850E0;
      id v9 = v4;
      uint64_t v10 = *(void *)(a1 + 40);
      id v13 = v9;
      uint64_t v14 = v10;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v6, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 40) exportLocalClipAtURL:*(void *)(a1 + 48)];
  }
}

uint64_t __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_65(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F69110] sharedHandler];
  [v2 handleError:*(void *)(a1 + 32)];

  unint64_t v3 = [*(id *)(a1 + 40) exportSessionEvent];
  id v4 = (id)[v3 sendEventForState:1];

  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 setExportSessionEvent:0];
}

- (void)exportLocalClipAtURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke;
  v6[3] = &unk_1E63850E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _displayableURLForCameraClipURL:*(void *)(a1 + 40)];
  [MEMORY[0x1E4F68FF8] durationOfRecordingAtURL:v2];
  double v4 = v3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v2;
    __int16 v52 = 2048;
    double v53 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Preparing file for export at path:%@ for duration:%.2f.", buf, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) exportSessionEvent];
  [v6 setRecordingDuration:v4];

  id v7 = [*(id *)(a1 + 32) exportSessionEvent];
  id v8 = (id)[v7 sendEventForState:0];

  [*(id *)(a1 + 32) setExportSessionEvent:0];
  v41 = [[HUClipExporterItemProvider alloc] initWithURL:v2];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [*(id *)(a1 + 32) dataSource];
  id v11 = [v10 currentEvent];
  if (!v11) {
    goto LABEL_9;
  }
  if (objc_opt_isKindOfClass()) {
    double v12 = v11;
  }
  else {
    double v12 = 0;
  }
  id v13 = v11;
  if (!v12)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];

LABEL_9:
    id v13 = 0;
  }

  if (v13)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v16 = [HUCameraRecordingFeedbackActivity alloc];
    __int16 v17 = [*(id *)(a1 + 32) playbackEngine];
    uint64_t v18 = [v17 cameraProfile];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_69;
    v44[3] = &unk_1E638F298;
    objc_copyWeak(&v46, (id *)buf);
    id v19 = v13;
    id v45 = v19;
    double v20 = [(HUCameraRecordingFeedbackActivity *)v16 initWithCameraClip:v19 cameraProfile:v18 completionHandler:v44];

    if ([MEMORY[0x1E4F69758] isInternalInstall])
    {
      v49 = v20;
      id v21 = &v49;
    }
    else
    {
      if (![v19 canAskForUserFeedback])
      {
        double v22 = 0;
        goto LABEL_18;
      }
      v48 = v20;
      id v21 = &v48;
    }
    double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
LABEL_18:

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
    goto LABEL_19;
  }
  double v22 = 0;
LABEL_19:
  id v23 = objc_alloc(MEMORY[0x1E4F42718]);
  v47 = v41;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v25 = (void *)[v23 initWithActivityItems:v24 applicationActivities:v22];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_3;
  v42[3] = &unk_1E638F2C0;
  id v43 = v2;
  id v26 = v2;
  [v25 setCompletionWithItemsHandler:v42];
  [v25 setExcludedActivityTypes:&unk_1F19B59A8];
  uint64_t v28 = *(void **)(a1 + 32);
  uint64_t v27 = (id *)(a1 + 32);
  v29 = [v28 view];
  v30 = [v25 popoverPresentationController];
  [v30 setSourceView:v29];

  int v31 = [*v27 scrubberView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  uint64_t v40 = [v25 popoverPresentationController];
  objc_msgSend(v40, "setSourceRect:", v33, v35, v37, v39);

  [*v27 presentViewController:v25 animated:1 completion:0];
}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_69(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_2;
    v4[3] = &unk_1E63850E0;
    id v5 = *(id *)(a1 + 32);
    id v6 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:v4];
  }
}

uint64_t __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isDonated];
  double v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return [v3 presentPreviouslySubmittedClipAlert];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [v3 donateClip:v5];
  }
}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_3(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = [*(id *)(a1 + 32) path];
  id v17 = 0;
  [v10 removeItemAtPath:v11 error:&v17];
  id v12 = v17;

  if (v12)
  {
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v19 = v16;
      __int16 v20 = 2112;
      *(void *)id v21 = v12;
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "Unable to remove file:%@ with error:%@", buf, 0x16u);
    }

    int v14 = 0;
  }
  else
  {
    int v14 = 1;
  }
  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = v8;
    __int16 v20 = 1024;
    *(_DWORD *)id v21 = a3;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v14;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Finished export activity for activityType:%@ completed:%{BOOL}d removedClip:%{BOOL}d with error:%@", buf, 0x22u);
  }
}

- (id)_displayableURLForCameraClipURL:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F68F68];
  id v6 = [(HUClipScrubberViewController *)self playbackEngine];
  id v7 = [v6 cameraProfile];
  id v8 = [v7 accessory];
  id v9 = [v8 name];
  uint64_t v10 = [(HUClipScrubberViewController *)self playbackEngine];
  id v11 = [v10 currentClip];
  id v12 = [v11 dateOfOccurrence];
  id v13 = [v5 userFriendlyExportURLForCameraName:v9 withStartDate:v12];

  if (!v13) {
    goto LABEL_5;
  }
  int v14 = [v13 absoluteString];
  if ([v14 isEqualToString:@"null"])
  {

LABEL_5:
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [(HUClipScrubberViewController *)self dataSource];
      v29 = [v28 currentEvent];
      v30 = [v29 uniqueIdentifier];
      int v31 = [(HUClipScrubberViewController *)self playbackEngine];
      double v32 = [v31 cameraProfile];
      double v33 = [v32 accessory];
      double v34 = [v33 name];
      *(_DWORD *)buf = 138412546;
      id v42 = v30;
      __int16 v43 = 2112;
      id v44 = v34;
      _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "Failure to create URL using clip:%@ and camera profile:%@", buf, 0x16u);
    }
    id v18 = v4;
LABEL_8:
    id v19 = v18;
    goto LABEL_9;
  }
  id v15 = [v13 absoluteString];
  int v16 = [v15 isEqualToString:@"(null)"];

  if (v16) {
    goto LABEL_5;
  }
  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v40 = 0;
  [v21 copyItemAtURL:v4 toURL:v13 error:&v40];
  id v22 = v40;

  if (!v22) {
    goto LABEL_25;
  }
  if ([v22 code] != 516)
  {
    double v35 = HFLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v22;
      goto LABEL_29;
    }
LABEL_19:

    id v19 = v4;
    goto LABEL_9;
  }
  id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v24 = [v13 path];
  id v39 = v22;
  [v23 removeItemAtPath:v24 error:&v39];
  id v25 = v39;

  id v26 = HFLogForCategory();
  uint64_t v27 = v26;
  if (!v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v13;
      _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "Second attempt to copy file after removal for displayableURL:%@.", buf, 0xCu);
    }

    double v36 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v38 = 0;
    [v36 copyItemAtURL:v4 toURL:v13 error:&v38];
    id v22 = v38;

    if (v22)
    {
      double v35 = HFLogForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v22;
LABEL_29:
        _os_log_error_impl(&dword_1BE345000, v35, OS_LOG_TYPE_ERROR, "Failure creating user-friendly export link: %@", buf, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
LABEL_25:
    double v37 = HFLogForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v13;
      _os_log_impl(&dword_1BE345000, v37, OS_LOG_TYPE_DEFAULT, "Displaying user-friendly export link: %@", buf, 0xCu);
    }

    id v18 = v13;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = v13;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_error_impl(&dword_1BE345000, v27, OS_LOG_TYPE_ERROR, "Failure to remove file at displayableURL:%@. Bailing and using url:%@", buf, 0x16u);
  }

  id v19 = v4;
LABEL_9:

  return v19;
}

- (void)updateSelectionPlatterDisplay
{
  double v3 = [(HUClipScrubberViewController *)self dataSource];
  int v4 = [v3 isEditing];

  if (v4)
  {
    id v7 = [(HUClipScrubberViewController *)self selectionPlatter];
    [v7 setHidden:1];
  }
  else
  {
    id v7 = [(HUClipScrubberViewController *)self playbackEngine];
    uint64_t v5 = [v7 hasRecordingEvents] ^ 1;
    id v6 = [(HUClipScrubberViewController *)self selectionPlatter];
    [v6 setHidden:v5];
  }
}

- (void)deleteClip
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  objc_opt_class();
  double v3 = [(HUClipScrubberViewController *)self dataSource];
  int v4 = [v3 currentEvent];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = [(HUClipScrubberViewController *)self playbackEngine];
    id v8 = [v7 cameraProfile];
    id v9 = [v8 clipManager];
    uint64_t v10 = [v6 uniqueIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__HUClipScrubberViewController_deleteClip__block_invoke;
    v14[3] = &unk_1E6386E70;
    objc_copyWeak(&v16, location);
    id v15 = v6;
    [v9 deleteClipWithUUID:v10 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(HUClipScrubberViewController *)self dataSource];
      id v13 = [v12 currentEvent];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Unable to delete clip:%@", (uint8_t *)location, 0xCu);
    }
  }
}

void __42__HUClipScrubberViewController_deleteClip__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = HFLogForCategory();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v12 = [*(id *)(a1 + 32) uniqueIdentifier];
      id v13 = [v12 UUIDString];
      int v14 = 138412546;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Unable to delete clip:%@ %@.", (uint8_t *)&v14, 0x16u);
    }
    id v7 = HFLocalizedString();
    id v8 = HFLocalizedString();
    id v9 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    id v6 = HFLocalizedString();

    uint64_t v10 = [MEMORY[0x1E4F42720] actionWithTitle:v6 style:0 handler:0];
    [v9 addAction:v10];
    [WeakRetained presentViewController:v9 animated:1 completion:0];

    goto LABEL_7;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v11 = [v8 UUIDString];
    int v14 = 138412290;
    id v15 = v11;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Deleted clip:%@.", (uint8_t *)&v14, 0xCu);

LABEL_7:
  }
}

- (void)showDeleteInterface
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    id v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F68410] code:40 userInfo:0];
    id v3 = [MEMORY[0x1E4F69110] sharedHandler];
    [v3 handleError:v49];
  }
  else
  {
    int v4 = [(HUClipScrubberViewController *)self playbackEngine];
    [v4 pause];

    uint64_t v5 = [(HUClipScrubberViewController *)self dataSource];
    id v6 = [v5 currentEvent];
    char v7 = [v6 isComplete];

    if (v7)
    {
      id v8 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberDeleteClipTitle", @"HUClipScrubberDeleteClipTitle", 1);
      id v9 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberDeleteClipMessage", @"HUClipScrubberDeleteClipMessage", 1);
      uint64_t v10 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v8 message:v9 preferredStyle:0];
      id v11 = [(HUClipScrubberViewController *)self view];
      id v12 = [v10 popoverPresentationController];
      [v12 setSourceView:v11];

      id v13 = [(HUClipScrubberViewController *)self view];
      int v14 = [(HUClipScrubberViewController *)self scrubberView];
      id v15 = [v14 rightActionButton];
      [v15 frame];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      uint64_t v24 = [(HUClipScrubberViewController *)self scrubberView];
      objc_msgSend(v13, "convertRect:fromView:", v24, v17, v19, v21, v23);
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v33 = [v10 popoverPresentationController];
      objc_msgSend(v33, "setSourceRect:", v26, v28, v30, v32);

      double v34 = (void *)MEMORY[0x1E4F42720];
      double v35 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberDeleteClipButtonTitle", @"HUClipScrubberDeleteClipButtonTitle", 1);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __51__HUClipScrubberViewController_showDeleteInterface__block_invoke;
      v50[3] = &unk_1E6385188;
      v50[4] = self;
      double v36 = [v34 actionWithTitle:v35 style:2 handler:v50];

      [v10 addAction:v36];
      double v37 = (void *)MEMORY[0x1E4F42720];
      id v38 = _HULocalizedStringWithDefaultValue(@"HUCameraCancelText", @"HUCameraCancelText", 1);
      id v39 = [v37 actionWithTitle:v38 style:0 handler:0];

      [v10 addAction:v39];
      [(HUClipScrubberViewController *)self presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      id v40 = HFLogForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [(HUClipScrubberViewController *)self dataSource];
        id v42 = [v41 currentEvent];
        *(_DWORD *)buf = 138412290;
        __int16 v52 = v42;
        _os_log_impl(&dword_1BE345000, v40, OS_LOG_TYPE_DEFAULT, "Not allowing deletion of an in-progress clips. User is unable to delete clip: %@", buf, 0xCu);
      }
      __int16 v43 = (void *)MEMORY[0x1E4F42728];
      id v44 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberDeletionBlockedTitle", @"HUClipScrubberDeletionBlockedTitle", 1);
      uint64_t v45 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberDeletionBlockedMessage", @"HUClipScrubberDeletionBlockedMessage", 1);
      id v8 = [v43 alertControllerWithTitle:v44 message:v45 preferredStyle:1];

      id v46 = (void *)MEMORY[0x1E4F42720];
      v47 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
      v48 = [v46 actionWithTitle:v47 style:0 handler:0];
      [v8 addAction:v48];

      [(HUClipScrubberViewController *)self presentViewController:v8 animated:1 completion:0];
    }
  }
}

uint64_t __51__HUClipScrubberViewController_showDeleteInterface__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteClip];
}

- (void)removeLiveButtonHighlighting
{
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  id v3 = [(HUClipScrubberViewController *)self scrubberView];
  int v4 = [v3 rightActionButton];
  [v4 setBackgroundColor:v5];
}

- (void)dismissEditInterface
{
  uint64_t v3 = [(HUClipScrubberViewController *)self exportDownloadOperation];
  if (v3)
  {
    int v4 = (void *)v3;
    id v5 = [(HUClipScrubberViewController *)self exportDownloadOperation];
    char v6 = [v5 isFinished];

    if ((v6 & 1) == 0)
    {
      char v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling previous un-finished export operation.", buf, 2u);
      }

      id v8 = [(HUClipScrubberViewController *)self exportDownloadOperation];
      [v8 cancel];

      [(HUClipScrubberViewController *)self setExportDownloadOperation:0];
    }
  }
  id v9 = [(HUClipScrubberViewController *)self dataSource];
  [v9 setEditing:0];

  uint64_t v10 = [(HUClipScrubberViewController *)self clipScrollDelegate];
  [v10 finishEditing];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HUClipScrubberViewController_dismissEditInterface__block_invoke;
  v11[3] = &unk_1E6386018;
  v11[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:0.2];
}

void __52__HUClipScrubberViewController_dismissEditInterface__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) endEditingHandler];
  v2[2]();

  if ([MEMORY[0x1E4F68FF8] internalCameraFeedbackSupported])
  {
    uint64_t v3 = [*(id *)(a1 + 32) feedbackPlatter];
    [v3 setHidden:1];
  }
  int v4 = [*(id *)(a1 + 32) nearbyAccessoriesPlatter];
  [v4 setHidden:0];

  id v5 = [*(id *)(a1 + 32) selectionPlatter];
  [v5 setHidden:0];

  [*(id *)(a1 + 32) updateScrubberViewAndAssociatedConstraints];
  char v6 = [*(id *)(a1 + 32) scrubberView];
  [v6 updateDisplayMode:0];

  char v7 = [*(id *)(a1 + 32) scrubberView];
  id v8 = [v7 rightActionButton];
  [v8 setEnabled:1];

  id v9 = [*(id *)(a1 + 32) view];
  [v9 layoutIfNeeded];
}

- (void)showEditInterface
{
  if ([(HUClipScrubberViewController *)self displayMode] != 1)
  {
    uint64_t v3 = [(HUClipScrubberViewController *)self dataSource];
    [v3 setEditing:1];

    int v4 = [(HUClipScrubberViewController *)self playbackEngine];
    id v5 = [v4 playbackPosition];
    char v6 = [MEMORY[0x1E4F68FC8] livePosition];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = [(HUClipScrubberViewController *)self dataSource];
      id v9 = [v8 currentEvents];
      uint64_t v10 = [v9 lastObject];

      if (v10)
      {
        id v11 = [(HUClipScrubberViewController *)self playbackEngine];
        id v12 = (void *)MEMORY[0x1E4F68FC8];
        id v13 = [v10 dateOfOccurrence];
        int v14 = [v12 clipPositionWithDate:v13];
        [v11 setPlaybackPosition:v14];
      }
      else
      {
        double v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE345000, v18, OS_LOG_TYPE_ERROR, "Failure to find a valid clip when attempting to display edit mode.", buf, 2u);
        }

        uint64_t v10 = 0;
      }
    }
    else
    {
      id v15 = [(HUClipScrubberViewController *)self playbackEngine];
      uint64_t v16 = [v15 timeControlStatus];

      if (!v16)
      {
LABEL_16:
        v19[4] = self;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49__HUClipScrubberViewController_showEditInterface__block_invoke;
        v20[3] = &unk_1E6386018;
        v20[4] = self;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __49__HUClipScrubberViewController_showEditInterface__block_invoke_2;
        v19[3] = &unk_1E6386730;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v20 animations:v19 completion:0.2];
        return;
      }
      double v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Pausing playback for switch to edit mode.", buf, 2u);
      }

      uint64_t v10 = [(HUClipScrubberViewController *)self playbackEngine];
      [v10 pause];
    }

    goto LABEL_16;
  }

  [(HUClipScrubberViewController *)self showDeleteInterface];
}

void __49__HUClipScrubberViewController_showEditInterface__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F68FF8] internalCameraFeedbackSupported])
  {
    int v2 = [*(id *)(a1 + 32) feedbackPlatter];
    [v2 setHidden:0];
  }
  uint64_t v3 = [*(id *)(a1 + 32) nearbyAccessoriesPlatter];
  [v3 setHidden:1];

  int v4 = [*(id *)(a1 + 32) selectionPlatter];
  [v4 setHidden:1];

  [*(id *)(a1 + 32) updateScrubberViewAndAssociatedConstraints];
  id v5 = [*(id *)(a1 + 32) scrubberView];
  [v5 updateDisplayMode:1];

  char v6 = [*(id *)(a1 + 32) beginEditingHandler];
  v6[2]();

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

void __49__HUClipScrubberViewController_showEditInterface__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) clipScrollDelegate];
  [v1 beginEditing];
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F42728], "hu_alertControllerForAcknowledgementWithTitle:message:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HUClipScrubberViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)didSelectFeedbackButton
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUClipScrubberViewController *)self playbackEngine];
  [v3 pause];

  if ([MEMORY[0x1E4F68FF8] hasAcceptedCameraFeedbackEmployeeConsent])
  {
    int v4 = [(HUClipScrubberViewController *)self _feedbackClip];
    id v5 = v4;
    if (v4)
    {
      if (objc_msgSend(v4, "hf_isPlayable"))
      {
        if ([v5 isDonated]) {
          [(HUClipScrubberViewController *)self presentPreviouslySubmittedClipAlert];
        }
        else {
          [(HUClipScrubberViewController *)self presentFeedbackOptions];
        }
        goto LABEL_15;
      }
      char v6 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackBadClipSubmissionTitle", @"HUCameraFeedbackBadClipSubmissionTitle", 1);
      id v7 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackBadClipSubmissionMessage", @"HUCameraFeedbackBadClipSubmissionMessage", 1);
      [(HUClipScrubberViewController *)self _presentAlertWithTitle:v6 message:v7];
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v5 uniqueIdentifier];
        uint64_t v10 = [v9 UUIDString];
        int v11 = 138412290;
        id v12 = v10;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Preventing submission of unplayable clip:%@.", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      char v6 = HFLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Failed attempt to submit current clip when none available.", (uint8_t *)&v11, 2u);
      }
    }

LABEL_15:
    return;
  }

  [(HUClipScrubberViewController *)self presentFeedbackConsent];
}

- (void)presentFeedbackOptions
{
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackAlertTitle", @"HUCameraFeedbackAlertTitle", 1);
  int v4 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackLegalMessage", @"HUCameraFeedbackLegalMessage", 1);
  id v5 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  char v6 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackSubmitOneTitle", @"HUCameraFeedbackSubmitOneTitle", 1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke;
  v13[3] = &unk_1E6385188;
  v13[4] = self;
  id v7 = [MEMORY[0x1E4F42720] actionWithTitle:v6 style:0 handler:v13];
  [v5 addAction:v7];
  id v8 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackSubmitAllTitle", @"HUCameraFeedbackSubmitAllTitle", 1);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke_2;
  v12[3] = &unk_1E6385188;
  void v12[4] = self;
  id v9 = [MEMORY[0x1E4F42720] actionWithTitle:v8 style:0 handler:v12];
  [v5 addAction:v9];
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackCancelTitle", @"HUCameraFeedbackCancelTitle", 1);

  int v11 = [MEMORY[0x1E4F42720] actionWithTitle:v10 style:1 handler:&__block_literal_global_138];
  [v5 addAction:v11];
  [(HUClipScrubberViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) submitCurrentClip];
}

uint64_t __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) verifySubmitAllClips];
}

- (void)presentPreviouslySubmittedClipAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackAlreadySubmittedTitle", @"HUCameraFeedbackAlreadySubmittedTitle", 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackAlreadySubmittedMessage", @"HUCameraFeedbackAlreadySubmittedMessage", 1);
  [(HUClipScrubberViewController *)self _presentAlertWithTitle:v4 message:v3];
}

- (id)_feedbackClip
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUClipScrubberViewController *)self playbackEngine];
  id v4 = [v3 currentClip];
  id v5 = [(HUClipScrubberViewController *)self playbackEngine];
  char v6 = v5;
  if (v4)
  {
    id v7 = [v5 currentClip];
  }
  else
  {
    id v8 = [v5 cameraClips];
    id v7 = [v8 lastObject];
  }
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      int v14 = v7;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Internal install - allowing submission of feedback for clip:%@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_9;
  }
  if ([v7 canAskForUserFeedback])
  {
LABEL_9:
    id v10 = v7;
    goto LABEL_13;
  }
  int v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    int v14 = v7;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Preventing submission of feedback for clip:%@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = 0;
LABEL_13:

  return v10;
}

- (void)submitCurrentClip
{
  uint64_t v3 = [(HUClipScrubberViewController *)self _feedbackClip];
  id v4 = v3;
  if (v3)
  {
    if ([v3 isDonated]) {
      [(HUClipScrubberViewController *)self presentPreviouslySubmittedClipAlert];
    }
    else {
      [(HUClipScrubberViewController *)self donateClip:v4];
    }
  }
  else
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v6 = 0;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed attempt to submit current clip when none available.", v6, 2u);
    }
  }
}

- (void)verifySubmitAllClips
{
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackVerifyAlertTitle", @"HUCameraFeedbackVerifyAlertTitle", 1);
  id v4 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackVerifyLegalMessage", @"HUCameraFeedbackVerifyLegalMessage", 1);
  id v5 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  char v6 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackVerifyAcceptTitle", @"HUCameraFeedbackVerifyAcceptTitle", 1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HUClipScrubberViewController_verifySubmitAllClips__block_invoke;
  v10[3] = &unk_1E6385188;
  v10[4] = self;
  id v7 = [MEMORY[0x1E4F42720] actionWithTitle:v6 style:0 handler:v10];
  [v5 addAction:v7];
  id v8 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackVerifyDeclineTitle", @"HUCameraFeedbackVerifyDeclineTitle", 1);

  id v9 = [MEMORY[0x1E4F42720] actionWithTitle:v8 style:0 handler:&__block_literal_global_158];
  [v5 addAction:v9];
  [(HUClipScrubberViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __52__HUClipScrubberViewController_verifySubmitAllClips__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) donateAllClips];
}

- (void)donateClip:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F68F70];
  char v6 = [(HUClipScrubberViewController *)self playbackEngine];
  id v7 = [v6 cameraProfile];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __43__HUClipScrubberViewController_donateClip___block_invoke;
  v9[3] = &unk_1E6385A20;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  [v5 donateCameraClip:v8 forCameraProfile:v7 completion:v9];
}

void __43__HUClipScrubberViewController_donateClip___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error donating clip:%@. %@", (uint8_t *)&v9, 0x16u);
    }
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackFailureToSubmitTitle", @"HUCameraFeedbackFailureToSubmitTitle", 1);
    char v6 = @"HUCameraFeedbackFailureToSubmitMessage";
  }
  else
  {
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackSubmittedTitle", @"HUCameraFeedbackSubmittedTitle", 1);
    char v6 = @"HUCameraFeedbackSubmittedMessage";
  }
  id v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  [*(id *)(a1 + 40) _presentAlertWithTitle:v5 message:v7];
}

- (void)donateAllClips
{
  id v3 = (void *)MEMORY[0x1E4F68F70];
  id v4 = [(HUClipScrubberViewController *)self playbackEngine];
  id v5 = [v4 cameraProfile];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HUClipScrubberViewController_donateAllClips__block_invoke;
  v6[3] = &unk_1E6386708;
  v6[4] = self;
  [v3 donateAllCameraClipsForCameraProfile:v5 completion:v6];
}

void __46__HUClipScrubberViewController_donateAllClips__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error donating all clips. %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackFailureToSubmitTitle", @"HUCameraFeedbackFailureToSubmitTitle", 1);
    char v6 = @"HUCameraFeedbackFailureToSubmitMessage";
  }
  else
  {
    id v5 = _HULocalizedStringWithDefaultValue(@"HUCameraFeedbackSubmittedAllTitle", @"HUCameraFeedbackSubmittedAllTitle", 1);
    char v6 = @"HUCameraFeedbackSubmittedAllMessage";
  }
  id v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
  [*(id *)(a1 + 32) _presentAlertWithTitle:v5 message:v7];
}

- (id)accessoryButtonHandler
{
  return self->_accessoryButtonHandler;
}

- (void)setAccessoryButtonHandler:(id)a3
{
}

- (id)beginEditingHandler
{
  return self->_beginEditingHandler;
}

- (void)setBeginEditingHandler:(id)a3
{
}

- (id)endEditingHandler
{
  return self->_endEditingHandler;
}

- (void)setEndEditingHandler:(id)a3
{
}

- (unint64_t)pinchGestureCount
{
  return self->_pinchGestureCount;
}

- (void)setPinchGestureCount:(unint64_t)a3
{
  self->_pinchGestureCount = a3;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (void)setScrubberView:(id)a3
{
}

- (void)setSelectionButton:(id)a3
{
}

- (void)setNearbyAccessoriesButton:(id)a3
{
}

- (void)setFeedbackButton:(id)a3
{
}

- (void)setSelectionPlatter:(id)a3
{
}

- (void)setFeedbackPlatter:(id)a3
{
}

- (void)setNearbyAccessoriesPlatter:(id)a3
{
}

- (HUClipScrubberDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (HUClipScrubberScrollDelegate)clipScrollDelegate
{
  return self->_clipScrollDelegate;
}

- (void)setClipScrollDelegate:(id)a3
{
}

- (NSLayoutConstraint)scrubberViewRightAnchorConstraint
{
  return self->_scrubberViewRightAnchorConstraint;
}

- (void)setScrubberViewRightAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrubberViewLeftAnchorConstraint
{
  return self->_scrubberViewLeftAnchorConstraint;
}

- (void)setScrubberViewLeftAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)feedbackPlatterTopAnchorConstraint
{
  return self->_feedbackPlatterTopAnchorConstraint;
}

- (void)setFeedbackPlatterTopAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)nearbyAccessoriesPlatterTopAnchorConstraint
{
  return self->_nearbyAccessoriesPlatterTopAnchorConstraint;
}

- (void)setNearbyAccessoriesPlatterTopAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)selectionPlatterTopAnchorConstraint
{
  return self->_selectionPlatterTopAnchorConstraint;
}

- (void)setSelectionPlatterTopAnchorConstraint:(id)a3
{
}

- (CADisplayLink)scrubberUpdateDisplayLink
{
  return self->_scrubberUpdateDisplayLink;
}

- (void)setScrubberUpdateDisplayLink:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (unint64_t)lastEngineMode
{
  return self->_lastEngineMode;
}

- (void)setLastEngineMode:(unint64_t)a3
{
  self->_lastEngineMode = a3;
}

- (HMCameraClipFetchVideoAssetContextOperation)exportDownloadOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportDownloadOperation);

  return (HMCameraClipFetchVideoAssetContextOperation *)WeakRetained;
}

- (void)setExportDownloadOperation:(id)a3
{
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (HFCameraAnalyticsCameraClipExportSessionEvent)exportSessionEvent
{
  return self->_exportSessionEvent;
}

- (void)setExportSessionEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSessionEvent, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_exportDownloadOperation);
  objc_storeStrong((id *)&self->_scrubberUpdateDisplayLink, 0);
  objc_storeStrong((id *)&self->_selectionPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_clipScrollDelegate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatter, 0);
  objc_storeStrong((id *)&self->_feedbackPlatter, 0);
  objc_storeStrong((id *)&self->_selectionPlatter, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesButton, 0);
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong(&self->_endEditingHandler, 0);
  objc_storeStrong(&self->_beginEditingHandler, 0);

  objc_storeStrong(&self->_accessoryButtonHandler, 0);
}

@end