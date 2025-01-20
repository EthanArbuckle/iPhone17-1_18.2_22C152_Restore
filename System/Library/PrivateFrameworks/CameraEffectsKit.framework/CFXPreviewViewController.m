@interface CFXPreviewViewController
+ (id)liveCaptureSnapshotView;
+ (void)setLiveCaptureSnapshotView:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CFX_previewPlayerCurrentTime;
- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea;
- (BOOL)CFX_canApplyFaceTracking;
- (BOOL)CFX_saveImageToURL:(id)a3 image:(id)a4 compressionQuality:(double)a5 asHEIF:(BOOL)a6 metadata:(CGImageMetadata *)a7;
- (BOOL)capturedWithBackCamera;
- (BOOL)dockIsMagnified;
- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4;
- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4;
- (BOOL)isEditingEffect;
- (BOOL)isPresentingFilterPicker;
- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4;
- (BOOL)saveMediaItemToFunCamPhotosAlbumUponExport;
- (BOOL)shouldExportOnly;
- (BOOL)shouldKeepPlayButtonHidden;
- (BOOL)shouldUseFaceTracking;
- (BOOL)userInterfaceIsHidden;
- (CFXClip)previewClip;
- (CFXClipPlayerViewController)previewPlayer;
- (CFXControlsViewController)previewControls;
- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController;
- (CFXEffectEditorView)effectEditor;
- (CFXMediaItem)mediaItem;
- (CFXPlayButtonView)playButton;
- (CFXPreviewViewControllerDelegate)delegate;
- (CGPoint)bottomControlsCenter;
- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6;
- (CGRect)bottomControlsBounds;
- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6;
- (CGRect)playerContentFrame;
- (JFXCompositionExporter)exporter;
- (JFXEffectsPreviewGenerator)stillImagePreviewGenerator;
- (JFXOrientationMonitor)orientationMonitor;
- (NSLayoutConstraint)previewControlsContainerHeightConstraint;
- (NSLayoutConstraint)previewControlsContainerLeadingConstraint;
- (NSLayoutConstraint)previewControlsContainerTopConstraint;
- (NSLayoutConstraint)previewControlsContainerTrailingConstraint;
- (NSLayoutConstraint)previewControlsContainerWidthConstraint;
- (UIButton)exportButton;
- (UISlider)playbackSlider;
- (UIView)appStripAndPreviewControlsContainer;
- (UIView)bottomControlsDrawer;
- (UIView)effectsPickerDrawer;
- (UIView)playerContainerView;
- (UIView)previewControlsContainerView;
- (double)animationDurationForCompositionTransition:(id)a3 shouldScale:(BOOL *)a4;
- (double)dockMagnifiedHeightDelta;
- (id)CFX_AVAssetExportPresetWithColorSpace:(id)a3;
- (id)CFX_fetchAssetWithLocalIdentifier:(id)a3;
- (id)bottomControlsSnapshot;
- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4;
- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textForEffect:(id)a4;
- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3;
- (unint64_t)appliedDirectOverlayEditingGestures;
- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4;
- (void)CFX_addAssetAtURL:(id)a3 resourceType:(int64_t)a4 completionHandler:(id)a5;
- (void)CFX_addAssetWithIdentifier:(id)a3 intoAlbum:(id)a4 completionHandler:(id)a5;
- (void)CFX_addEffect:(id)a3;
- (void)CFX_addURLToCameraRoll:(id)a3 isStill:(BOOL)a4 completionHandler:(id)a5;
- (void)CFX_createAlbumWithCompletionHandler:(id)a3;
- (void)CFX_exportPhotoWithEffects;
- (void)CFX_hidePreviewUI;
- (void)CFX_layoutPlayerContainerView;
- (void)CFX_notifyDelegateExportMediaItemFinishedWithError:(id)a3;
- (void)CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:(id)a3;
- (void)CFX_setEffectAnimationsEnabledIfPossible:(BOOL)a3 updatePlayer:(BOOL)a4;
- (void)CFX_setFrameAndRenderSizes;
- (void)CFX_setIsExporting:(BOOL)a3;
- (void)CFX_showPreviewUI;
- (void)CFX_togglePreviewUI;
- (void)addEffect:(id)a3 completion:(id)a4;
- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6 completion:(id)a7;
- (void)configureBottomControlsForOrientation;
- (void)configureUIForOrientation;
- (void)didFinishExport:(int64_t)a3;
- (void)dispatchWhenPlayerReadyForDisplayEffectUpdate:(id)a3;
- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4;
- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4;
- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5;
- (void)effectEditorView:(id)a3 didEndEditingByTappingOutSideEffectAtScreenPoint:(CGPoint)a4;
- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5;
- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5;
- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4;
- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6;
- (void)effectEditorViewDidBeginEditing:(id)a3;
- (void)effectEditorViewDidEndEditing:(id)a3;
- (void)exportButtonTapped:(id)a3;
- (void)exportMediaItemToFileURL:(id)a3;
- (void)exportProgressedTo:(float)a3;
- (void)filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a3 completion:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5;
- (void)hideBottomControls;
- (void)playButtonViewDidTapPause:(id)a3;
- (void)playButtonViewDidTapPlay:(id)a3;
- (void)playbackAreaPanned:(id)a3 gesture:(id)a4 normalizedClipPoint:(CGPoint)a5 normalizedMinimumSize:(id)a6 translationDelta:(CGPoint)a7 atTime:(int)a8 timeScale:(int)a9;
- (void)playbackAreaPinched:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 scaleDelta:(double)a8 atTime:(int)a9 timeScale:(int)a10;
- (void)playbackAreaRotated:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 rotateDelta:(double)a8 atTime:(int)a9;
- (void)playbackAreaTapped:(id)a3 normalizedClipPoint:(CGPoint)a4 normalizedMinimumSize:(id)a5 atTime:(int)a6;
- (void)playbackDidStart:(id)a3;
- (void)playbackDidStop:(id)a3 currentTime:(int)a4;
- (void)playbackSliderValueChanged:(id)a3;
- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)removeEffectEditor;
- (void)setAppStripAndPreviewControlsContainer:(id)a3;
- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3;
- (void)setBottomControlsDrawer:(id)a3;
- (void)setCapturedWithBackCamera:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDockIsMagnified:(BOOL)a3;
- (void)setDockMagnifiedHeightDelta:(double)a3;
- (void)setEffectAnimationsEnabledIfPossible:(BOOL)a3;
- (void)setEffectBrowserContentPresenterViewController:(id)a3;
- (void)setEffectEditor:(id)a3;
- (void)setEffectsPickerDrawer:(id)a3;
- (void)setExportButton:(id)a3;
- (void)setExporter:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setOrientationMonitor:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayButtonHiddenIfPossible:(BOOL)a3;
- (void)setPlaybackSlider:(id)a3;
- (void)setPlayerContainerView:(id)a3;
- (void)setPresentingFilterPicker:(BOOL)a3;
- (void)setPreviewControls:(id)a3;
- (void)setPreviewControlsContainerHeightConstraint:(id)a3;
- (void)setPreviewControlsContainerLeadingConstraint:(id)a3;
- (void)setPreviewControlsContainerTopConstraint:(id)a3;
- (void)setPreviewControlsContainerTrailingConstraint:(id)a3;
- (void)setPreviewControlsContainerView:(id)a3;
- (void)setPreviewControlsContainerWidthConstraint:(id)a3;
- (void)setPreviewPlayer:(id)a3;
- (void)setSaveMediaItemToFunCamPhotosAlbumUponExport:(BOOL)a3;
- (void)setStillImagePreviewGenerator:(id)a3;
- (void)setUserInterfaceHidden:(BOOL)a3;
- (void)showBottomControls;
- (void)updateEffectEditorLayout;
- (void)updateFullScreenTextEditorLayout;
- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CFXPreviewViewController

- (void)viewDidLoad
{
  v81[4] = *MEMORY[0x263EF8340];
  v79.receiver = self;
  v79.super_class = (Class)CFXPreviewViewController;
  [(CFXPreviewViewController *)&v79 viewDidLoad];
  uint64_t v3 = [(CFXPreviewViewController *)self shouldExportOnly] ^ 1;
  v4 = [(CFXPreviewViewController *)self exportButton];
  [v4 setHidden:v3];

  v5 = [(CFXPreviewViewController *)self playButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v70 = (void *)MEMORY[0x263F08938];
  v77 = [(CFXPreviewViewController *)self playButton];
  v76 = [v77 widthAnchor];
  v75 = [v76 constraintEqualToConstant:70.0];
  v81[0] = v75;
  v74 = [(CFXPreviewViewController *)self playButton];
  v73 = [v74 heightAnchor];
  v72 = [v73 constraintEqualToConstant:70.0];
  v81[1] = v72;
  v71 = [(CFXPreviewViewController *)self playButton];
  v69 = [v71 centerXAnchor];
  v6 = [(CFXPreviewViewController *)self playerContainerView];
  v7 = [v6 centerXAnchor];
  v8 = [v69 constraintEqualToAnchor:v7];
  v81[2] = v8;
  v9 = [(CFXPreviewViewController *)self playButton];
  v10 = [v9 centerYAnchor];
  v11 = [(CFXPreviewViewController *)self playerContainerView];
  v12 = [v11 centerYAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v81[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
  [v70 activateConstraints:v14];

  v15 = [(CFXPreviewViewController *)self previewClip];
  v16 = [(CFXPreviewViewController *)self mediaItem];
  v17 = [v16 metadataURL];
  [v15 setMetadataURL:v17];

  v18 = [(CFXPreviewViewController *)self delegate];
  objc_msgSend(v15, "setMediaInterfaceOrientationForDisplay:", objc_msgSend(v18, "calculateMediaInterfaceOrientationForDisplay"));

  v19 = (void *)MEMORY[0x263EFFA08];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v80[3] = objc_opt_class();
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:4];
  v21 = [v19 setWithArray:v20];

  v22 = (void *)MEMORY[0x263F08928];
  v23 = [(CFXPreviewViewController *)self delegate];
  v24 = [v23 animojiMetadata];
  id v78 = 0;
  v25 = [v22 unarchivedObjectOfClasses:v21 fromData:v24 error:&v78];
  id v26 = v78;

  v27 = [v25 objectForKey:@"JFXAnimojiEffectDataRepresentationKey"];
  [v15 setOriginalAnimojiDataRepresentation:v27];

  v28 = [v25 objectForKey:@"JFXAnimojiEffectAvatarVersionNumberKey"];
  objc_msgSend(v15, "setOriginalAnimojiVersionNumber:", objc_msgSend(v28, "unsignedIntegerValue"));

  [(CFXPreviewViewController *)self CFX_setFrameAndRenderSizes];
  v29 = [(CFXPreviewViewController *)self previewPlayer];
  [v29 setClip:v15];

  [(CFXPreviewViewController *)self setPlayButtonHiddenIfPossible:0];
  [(CFXPreviewViewController *)self setEffectAnimationsEnabledIfPossible:0];
  v30 = +[JFXOrientationMonitor keyWindow];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarFrameForReferenceBounds:", v32, v34, v36, v38);
  double v40 = v39;
  v41 = [(CFXPreviewViewController *)self previewControlsContainerHeightConstraint];
  [v41 setConstant:v40];

  [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:0];
  if (s_LiveCaptureSnapshotView)
  {
    id v42 = objc_alloc(MEMORY[0x263F1CB60]);
    v43 = [(CFXPreviewViewController *)self playerContainerView];
    [v43 frame];
    double Width = CGRectGetWidth(v82);
    v45 = [(CFXPreviewViewController *)self playerContainerView];
    [v45 frame];
    v46 = objc_msgSend(v42, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v83));

    [v46 addSubview:s_LiveCaptureSnapshotView];
    v47 = [(CFXPreviewViewController *)self previewPlayer];
    [v47 dispatchBlockWhenDone:&__block_literal_global_25];

    v48 = [(CFXPreviewViewController *)self previewPlayer];
    [v48 displayCompositionUpdateLoadingView:v46];
  }
  v49 = [(CFXPreviewViewController *)self effectBrowserContentPresenterViewController];
  [(UIViewController *)self jfxAddChildViewController:v49];

  v50 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v51 = [v50 userInterfaceIdiom];

  if (!v51)
  {
    v52 = [(CFXPreviewViewController *)self previewControls];
    v53 = [v52 controlsContainerViewWidthConstraint];
    LODWORD(v54) = 1132068864;
    [v53 setPriority:v54];

    v55 = [(CFXPreviewViewController *)self previewControls];
    v56 = [v55 controlsContainerViewHeightConstraint];
    LODWORD(v57) = 1132068864;
    [v56 setPriority:v57];

    v58 = [(CFXPreviewViewController *)self previewControls];
    v59 = [v58 controlsContainerViewLeadingConstraint];
    LODWORD(v60) = 1144750080;
    [v59 setPriority:v60];

    v61 = [(CFXPreviewViewController *)self previewControls];
    v62 = [v61 controlsContainerViewTrailingConstraint];
    LODWORD(v63) = 1144750080;
    [v62 setPriority:v63];

    v64 = [(CFXPreviewViewController *)self previewControls];
    v65 = [v64 controlsContainerViewTopConstraint];
    LODWORD(v66) = 1144750080;
    [v65 setPriority:v66];
  }
  uint64_t v67 = isShowPlayerScrubbingControlsEnabled() ^ 1;
  v68 = [(CFXPreviewViewController *)self playbackSlider];
  [v68 setHidden:v67];
}

uint64_t __39__CFXPreviewViewController_viewDidLoad__block_invoke()
{
  return +[CFXPreviewViewController setLiveCaptureSnapshotView:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXPreviewViewController;
  [(CFXPreviewViewController *)&v3 viewDidLayoutSubviews];
  [(CFXPreviewViewController *)self configureUIForOrientation];
}

- (void)configureBottomControlsForOrientation
{
  objc_super v3 = +[JFXOrientationMonitor keyWindow];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int64_t v12 = +[JFXOrientationMonitor interfaceOrientation];
  v13 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (!v14)
  {
    unint64_t v22 = v12 - 3;
    objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarFrameForReferenceBounds:", v5, v7, v9, v11);
    double v24 = v23;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v12, v5, v7, v9, v11);
    if ([(CFXPreviewViewController *)self dockIsMagnified])
    {
      [(CFXPreviewViewController *)self dockMagnifiedHeightDelta];
      *((double *)&v81 + 1) = v25 + *((double *)&v81 + 1);
    }
    id v26 = [(CFXPreviewViewController *)self previewControlsContainerTopConstraint];
    v28 = v26;
    float v29 = 750.0;
    if (v22 >= 2) {
      float v30 = 250.0;
    }
    else {
      float v30 = 750.0;
    }
    if (v22 >= 2) {
      float v31 = 750.0;
    }
    else {
      float v31 = 250.0;
    }
    *(float *)&double v27 = v30;
    [v26 setPriority:v27];

    double v32 = [(CFXPreviewViewController *)self previewControlsContainerWidthConstraint];
    *(float *)&double v33 = v30;
    [v32 setPriority:v33];

    double v34 = [(CFXPreviewViewController *)self previewControlsContainerHeightConstraint];
    *(float *)&double v35 = v31;
    [v34 setPriority:v35];

    double v36 = [(CFXPreviewViewController *)self view];
    [v36 bounds];
    if (v22 > 1)
    {
      double v46 = CGRectGetHeight(*(CGRect *)&v37) - v24;

      if ([(CFXPreviewViewController *)self dockIsMagnified])
      {
        [(CFXPreviewViewController *)self dockMagnifiedHeightDelta];
        double v46 = v46 + v47;
      }
      v48 = [(CFXPreviewViewController *)self previewControlsContainerHeightConstraint];
      [v48 setConstant:v46];

      v49 = [(CFXPreviewViewController *)self previewControlsContainerLeadingConstraint];
      LODWORD(v50) = 1144750080;
      [v49 setPriority:v50];
    }
    else
    {
      CGFloat v41 = CGRectGetWidth(*(CGRect *)&v37) - v24;

      id v42 = [(CFXPreviewViewController *)self previewControlsContainerWidthConstraint];
      [v42 setConstant:v41];

      v43 = [(CFXPreviewViewController *)self previewControlsContainerLeadingConstraint];
      v45 = v43;
      if (v12 == 4) {
        *(float *)&double v44 = 750.0;
      }
      else {
        *(float *)&double v44 = 250.0;
      }
      if (v12 == 4) {
        float v29 = 250.0;
      }
      [v43 setPriority:v44];
    }
    uint64_t v51 = [(CFXPreviewViewController *)self previewControlsContainerTrailingConstraint];
    *(float *)&double v52 = v29;
    [v51 setPriority:v52];

    double v53 = *((double *)&v82 + 1);
    double v54 = *(double *)&v82;
    if (![(CFXPreviewViewController *)self dockIsMagnified]) {
      goto LABEL_34;
    }
    [(CFXPreviewViewController *)self dockMagnifiedHeightDelta];
    double v56 = ceil(v55 * 0.5);
    double v57 = [MEMORY[0x263F1C5C0] currentDevice];
    if (![v57 userInterfaceIdiom])
    {
      v58 = [MEMORY[0x263F1C920] mainScreen];
      [v58 bounds];
      if ((uint64_t)v59 < 812)
      {
        double v60 = [MEMORY[0x263F1C920] mainScreen];
        [v60 bounds];
        uint64_t v62 = (uint64_t)v61;

        if (v62 < 812)
        {
LABEL_28:
          double v66 = 0.0;
          if (v22 >= 2) {
            double v67 = v56;
          }
          else {
            double v67 = 0.0;
          }
          double v53 = *((double *)&v82 + 1) - v67;
          if (v22 < 2) {
            double v66 = v56;
          }
          double v54 = *(double *)&v82 - v66;
LABEL_34:
          v68 = [(CFXPreviewViewController *)self bottomControlsDrawer];
          objc_msgSend(v68, "setCenter:", v54, v53);

          long long v69 = v80;
          long long v70 = v81;
          v71 = [(CFXPreviewViewController *)self bottomControlsDrawer];
          objc_msgSend(v71, "setBounds:", v69, v70);

          long long v77 = v83;
          long long v78 = v84;
          long long v79 = v85;
          v21 = [(CFXPreviewViewController *)self bottomControlsDrawer];
          v76[0] = v77;
          v76[1] = v78;
          v76[2] = v79;
          [v21 setTransform:v76];
          goto LABEL_35;
        }
      }
      else
      {
      }
      double v57 = [(CFXPreviewViewController *)self view];
      [v57 safeAreaInsets];
      double v64 = v63;
      [(CFXPreviewViewController *)self dockMagnifiedHeightDelta];
      double v56 = v56 - (v64 - v65);
    }

    goto LABEL_28;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v12, v5, v7, v9, v11);
  long long v15 = v80;
  long long v16 = v81;
  v17 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  objc_msgSend(v17, "setBounds:", v15, v16);

  long long v18 = v82;
  v19 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v19 setCenter:v18];

  long long v73 = v83;
  long long v74 = v84;
  long long v75 = v85;
  v20 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  v72[0] = v73;
  v72[1] = v74;
  v72[2] = v75;
  [v20 setTransform:v72];

  v21 = [(CFXPreviewViewController *)self previewControlsContainerHeightConstraint];
  [v21 setActive:0];
LABEL_35:
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CFXPreviewViewController;
  [(CFXPreviewViewController *)&v13 viewWillAppear:a3];
  double v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_JFX_orientationMonitorInterfaceOrientationNotification_ name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];

  double v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    double v7 = [(CFXPreviewViewController *)self bottomControlsDrawer];
    double v8 = [v7 constraints];

    if (v8)
    {
      double v9 = [(CFXPreviewViewController *)self bottomControlsDrawer];
      double v10 = [(CFXPreviewViewController *)self bottomControlsDrawer];
      double v11 = [v10 constraints];
      [v9 removeConstraints:v11];

      int64_t v12 = [(CFXPreviewViewController *)self bottomControlsDrawer];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:1];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXPreviewViewController;
  [(CFXPreviewViewController *)&v6 viewDidAppear:a3];
  double v4 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v4 frame];
  BOOL v5 = CGRectEqualToRect(v7, *MEMORY[0x263F001A8]);

  if (v5) {
    [(CFXPreviewViewController *)self configureBottomControlsForOrientation];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXPreviewViewController;
  [(CFXPreviewViewController *)&v6 viewDidDisappear:a3];
  double v4 = [(CFXPreviewViewController *)self previewPlayer];
  [v4 pause];

  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v14 = a3;
  BOOL v5 = [v14 destinationViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGRect v7 = [v14 destinationViewController];
    [(CFXPreviewViewController *)self setPreviewPlayer:v7];

    double v8 = [(CFXPreviewViewController *)self previewPlayer];
    [v8 setDisplayName:@"CFXPreviewPlayer"];

    double v9 = [(CFXPreviewViewController *)self previewPlayer];
    [v9 setParentCode:301];

    double v10 = [(CFXPreviewViewController *)self previewPlayer];
    [v10 setDelegate:self];
  }
  double v11 = [v14 destinationViewController];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    objc_super v13 = [v14 destinationViewController];
    [(CFXPreviewViewController *)self setPreviewControls:v13];
  }
}

- (UIView)effectsPickerDrawer
{
  [(CFXPreviewViewController *)self loadViewIfNeeded];
  objc_super v3 = [(CFXPreviewViewController *)self previewControls];
  double v4 = [v3 effectsPickerDrawer];

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v13 = a3;
  [(CFXPreviewViewController *)self loadViewIfNeeded];
  [(CFXPreviewViewController *)self setBottomControlsDrawer:v13];
  double v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5)
  {
    objc_super v6 = [(CFXPreviewViewController *)self view];
    [v6 addSubview:v13];
  }
  else
  {
    CGRect v7 = [(CFXPreviewViewController *)self mediaItem];
    double v8 = [v7 clip];
    int v9 = [v8 isStill];

    if (v9)
    {
      double v10 = [MEMORY[0x263F1C550] blackColor];
      double v11 = [(CFXPreviewViewController *)self bottomControlsDrawer];
      [v11 setBackgroundColor:v10];
    }
    objc_super v6 = [(CFXPreviewViewController *)self appStripAndPreviewControlsContainer];
    char v12 = [(CFXPreviewViewController *)self previewControlsContainerView];
    [v6 insertSubview:v13 belowSubview:v12];
  }
}

- (void)setPresentingFilterPicker:(BOOL)a3
{
  if (self->_presentingFilterPicker != a3)
  {
    BOOL v3 = a3;
    self->_presentingFilterPicker = a3;
    if (a3)
    {
      uint64_t v5 = [(CFXPreviewViewController *)self previewPlayer];
      [v5 pause];
    }
    [(CFXPreviewViewController *)self setPlayButtonHiddenIfPossible:v3];
  }
}

- (CFXClip)previewClip
{
  v2 = [(CFXPreviewViewController *)self mediaItem];
  BOOL v3 = [v2 clip];

  return (CFXClip *)v3;
}

- (BOOL)shouldExportOnly
{
  if (shouldExportOnly_onceToken != -1) {
    dispatch_once(&shouldExportOnly_onceToken, &__block_literal_global_33);
  }
  return shouldExportOnly_shouldExportOnly;
}

void __44__CFXPreviewViewController_shouldExportOnly__block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  shouldExportOnly_shouldExportOnly = [v0 BOOLForKey:@"funCameraShouldExportOnly"];
}

+ (id)liveCaptureSnapshotView
{
  return (id)s_LiveCaptureSnapshotView;
}

+ (void)setLiveCaptureSnapshotView:(id)a3
{
}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
  if (!effectBrowserContentPresenterViewController)
  {
    double v4 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    uint64_t v5 = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v4;

    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
  }
  return effectBrowserContentPresenterViewController;
}

- (void)exportButtonTapped:(id)a3
{
}

- (void)playbackSliderValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CFXPreviewViewController *)self previewPlayer];
  float v6 = (float)(int)[v5 duration];
  [v4 value];
  float v8 = v7;

  id v9 = [(CFXPreviewViewController *)self previewPlayer];
  [v9 seekToTime:(int)(float)(v8 * v6)];
}

- (void)CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = +[JFXVideoCameraController sharedInstance];
  float v6 = [v5 mostRecentARMetadata];
  uint64_t v7 = [v6 faceAnchor];
  if (v7)
  {
    float v8 = (void *)v7;
    id v9 = +[JFXVideoCameraController sharedInstance];
    int v10 = [v9 hasValidFaceData];

    if (v10)
    {
      v4[2](v4);
      goto LABEL_9;
    }
  }
  else
  {
  }
  double v11 = [(CFXPreviewViewController *)self previewClip];
  char v12 = [(CFXPreviewViewController *)self previewPlayer];
  id v13 = v12;
  if (v12) {
    [v12 currentCMTime];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke;
  v14[3] = &unk_264C0B278;
  long long v15 = v4;
  +[JFXFaceTrackingPlaybackUtilities arDataForPlaybackElement:v11 atPlaybackTime:v16 completion:v14];

LABEL_9:
}

void __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[JFXVideoCameraController sharedInstance];
  [v4 setMostRecentARMetadata:v3];

  uint64_t v5 = [v3 faceAnchor];

  float v6 = +[JFXVideoCameraController sharedInstance];
  [v6 setHasValidFaceData:v5 != 0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke_2;
  block[3] = &unk_264C0A3F0;
  id v8 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addEffect:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = JFXLog_effects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 jtEffect];
    int v10 = NSStringFromJFXEffectType([v9 type]);
    double v11 = [v6 localizedTitle];
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    __int16 v29 = 2114;
    float v30 = v11;
    _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@", buf, 0x16u);
  }
  char v12 = [v6 jtEffect];
  int v13 = [v12 type];

  if (v13 == 2)
  {
    id v14 = [v6 jtEffect];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke;
    v23[3] = &unk_264C0B2C8;
    v23[4] = self;
    id v24 = v14;
    id v25 = v6;
    id v26 = v7;
    id v15 = v7;
    id v16 = v6;
    id v17 = v14;
    [(CFXPreviewViewController *)self CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:v23];
  }
  else
  {
    long long v18 = [(CFXPreviewViewController *)self previewPlayer];
    [v18 pause];

    v19 = [v6 jtEffect];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke_3;
    v20[3] = &unk_264C0B2F0;
    v20[4] = self;
    id v21 = v6;
    id v22 = v7;
    id v16 = v7;
    id v17 = v6;
    [v19 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v20];
  }
}

void __49__CFXPreviewViewController_addEffect_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0x3FD6666666666666;
  if (!objc_msgSend(*(id *)(a1 + 32), "CFX_canApplyFaceTracking")) {
    goto LABEL_5;
  }
  id v3 = +[JFXVideoCameraController sharedInstance];
  id v4 = [v3 mostRecentARMetadata];

  uint64_t v5 = [v4 faceAnchor];

  if (!v5)
  {

LABEL_5:
    char v6 = 0;
    id v4 = 0;
    goto LABEL_6;
  }
  char v6 = 1;
  uint64_t v2 = 0x3FE399999999999ALL;
LABEL_6:
  id v7 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke_2;
  v9[3] = &unk_264C0B2A0;
  uint64_t v15 = v2;
  char v16 = v6;
  id v10 = v7;
  id v11 = v4;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v8 = v4;
  [v10 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v9];
}

uint64_t __49__CFXPreviewViewController_addEffect_completion___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 72);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = [*(id *)(a1 + 48) previewClip];
  uint64_t v7 = [v6 playableMediaContentMode];
  id v8 = [*(id *)(a1 + 48) previewClip];
  uint64_t v9 = [v8 mediaInterfaceOrientationForDisplay];
  long long v30 = *MEMORY[0x263F010E0];
  long long v27 = v30;
  *(void *)&long long v31 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v10 = v31;
  +[JFXEffectEditingUtilities nextNormalizedInsertionPointForOverlay:v4 scaleRelativeToCenterSquare:&v30 atTime:v3 applyTracking:v5 withARMetadata:0 transformAnimation:v7 playableMediaContentMode:v2 playableInterfaceOrientation:v9];
  double v12 = v11;
  double v14 = v13;

  double v15 = *(double *)(a1 + 72);
  unsigned int v29 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 32);
  id v17 = [*(id *)(a1 + 48) previewClip];
  LODWORD(v7) = [v17 playableMediaContentMode];
  long long v18 = [*(id *)(a1 + 48) previewClip];
  uint64_t v19 = [v18 mediaInterfaceOrientationForDisplay];
  v20 = [*(id *)(a1 + 48) previewClip];
  uint64_t v21 = [v20 playableAspectRatio];
  id v22 = [*(id *)(a1 + 48) previewClip];
  uint64_t v23 = [v22 playableAspectRatioPreservationMode];
  long long v33 = v27;
  uint64_t v34 = v10;
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v30 = *MEMORY[0x263F000D0];
  long long v31 = v24;
  long long v32 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  LODWORD(v26) = v7;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v28, &v33, 1, 1, v29, 0, v12, v14, v15, 0.0, v16, &v30, 0, v26,
    v19,
    v21,
    v23);

  objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:", *(void *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __49__CFXPreviewViewController_addEffect_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_addEffect:", *(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea
{
  double v2 = [(CFXPreviewViewController *)self playerContainerView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = 44.0 / v4;
  double v8 = 44.0 / v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6 completion:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a7;
  uint64_t v16 = JFXLog_effects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v14 jtEffect];
    long long v18 = NSStringFromJFXEffectType([v17 type]);
    uint64_t v19 = [v14 localizedTitle];
    v64.double x = x;
    v64.double y = y;
    v20 = NSStringFromCGPoint(v64);
    v65.double width = width;
    v65.double height = height;
    uint64_t v21 = NSStringFromCGSize(v65);
    *(_DWORD *)buf = 138544386;
    double v54 = v18;
    __int16 v55 = 2114;
    double v56 = v19;
    __int16 v57 = 2114;
    v58 = v20;
    __int16 v59 = 2114;
    double v60 = v21;
    __int16 v61 = 2048;
    double v62 = a6;
    _os_log_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, screenLocation: %{public}@, screenSize: %{public}@, rotationAngle: %f", buf, 0x34u);
  }
  id v22 = [(CFXPreviewViewController *)self previewPlayer];
  [v22 pause];

  uint64_t v23 = [(CFXPreviewViewController *)self playerContainerView];
  objc_msgSend(v23, "convertPoint:fromView:", 0, x, y);
  double v25 = v24;
  [v23 frame];
  double v27 = v25 / v26;
  objc_msgSend(v23, "convertSize:fromView:", 0, width, height);
  double v29 = v28;
  double v31 = v30;
  +[JFXMediaSettings renderSize];
  double v33 = v32;
  double v35 = v34;
  [v23 frame];
  double v37 = v33 * (v29 / v36);
  [v23 frame];
  double v39 = CGRectMakeWithSizeAndCenterPoint(v37, v35 * (v31 / v38), v27 * v33);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke;
  v45[3] = &unk_264C0B340;
  v45[4] = self;
  id v46 = v14;
  double v48 = v39;
  uint64_t v49 = v40;
  uint64_t v50 = v41;
  uint64_t v51 = v42;
  double v52 = a6;
  id v47 = v15;
  id v43 = v15;
  id v44 = v14;
  [(CFXPreviewViewController *)self CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:v45];
}

void __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "CFX_canApplyFaceTracking"))
  {
    double v2 = +[JFXVideoCameraController sharedInstance];
    double v3 = [v2 mostRecentARMetadata];

    id v4 = [v3 faceAnchor];
    BOOL v5 = v4 != 0;

    if (v4) {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = 0;
    BOOL v5 = 0;
  }
  double v6 = [*(id *)(a1 + 40) jtEffect];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke_2;
  v11[3] = &unk_264C0B318;
  long long v7 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v18 = v7;
  uint64_t v19 = *(void *)(a1 + 88);
  BOOL v20 = v5;
  id v12 = v6;
  id v13 = v4;
  double v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v9 = v4;
  id v10 = v6;
  [v10 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v11];
}

uint64_t __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 104);
  unsigned int v20 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 48) previewClip];
  int v6 = [v5 playableMediaContentMode];
  long long v7 = [*(id *)(a1 + 48) previewClip];
  uint64_t v8 = [v7 mediaInterfaceOrientationForDisplay];
  id v9 = [*(id *)(a1 + 48) previewClip];
  uint64_t v10 = [v9 playableAspectRatio];
  double v11 = [*(id *)(a1 + 48) previewClip];
  uint64_t v12 = [v11 playableAspectRatioPreservationMode];
  double v13 = *(double *)(a1 + 72);
  double v14 = *(double *)(a1 + 80);
  double v15 = *(double *)(a1 + 88);
  double v16 = *(double *)(a1 + 96);
  long long v22 = *MEMORY[0x263F010E0];
  uint64_t v23 = *(void *)(MEMORY[0x263F010E0] + 16);
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v21[0] = *MEMORY[0x263F000D0];
  v21[1] = v17;
  v21[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  LODWORD(v19) = v6;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v4, &v22, v20, 1, v3, v21, v13, v14, v15, v16, v2, 0, v19, v8, v10,
    v12);

  objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:", *(void *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)CFX_addEffect:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CFXPreviewViewController *)self removeEffectEditor];
  BOOL v5 = [v4 jtEffect];
  int v6 = [v5 type];
  if (v6 == 7)
  {
    long long v7 = [(CFXPreviewViewController *)self previewClip];
    uint64_t v8 = v7;
    uint64_t v9 = 7;
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    long long v7 = [(CFXPreviewViewController *)self previewClip];
    uint64_t v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 removeAllEffectsOfType:v9];

LABEL_6:
  if (+[JFXEffectEditingUtilities canEditTextForEffect:v5])
  {
    uint64_t v10 = [v4 jtEffect];
    [v10 setHidden:1];
  }
  if (([v5 isNone] & 1) == 0)
  {
    double v11 = [(CFXPreviewViewController *)self previewClip];
    [v11 addEffect:v5];

    uint64_t v12 = JFXLog_effects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = NSStringFromJFXEffectType([v5 type]);
      double v14 = [v4 localizedTitle];
      *(_DWORD *)double v27 = 138543618;
      *(void *)&v27[4] = v13;
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v14;
      _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "Added effect - type: %{public}@, name: %{public}@", v27, 0x16u);
    }
  }
  double v15 = [(CFXPreviewViewController *)self previewPlayer];
  [v15 updateCompositionForEffectChange];

  double v16 = [v4 localizedTitle];
  int v17 = [v5 type];
  switch(v17)
  {
    case 1:
      unsigned int v20 = JFXLog_automation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v27 = 138412290;
        *(void *)&v27[4] = v16;
        uint64_t v21 = "Element Added: Filter - %@";
        goto LABEL_26;
      }
      break;
    case 7:
      unsigned int v20 = JFXLog_automation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v27 = 138412290;
        *(void *)&v27[4] = v16;
        uint64_t v21 = "Element Added: Animoji - %@";
        goto LABEL_26;
      }
      break;
    case 2:
      if (+[JFXEffectEditingUtilities canEditTextForEffect:v5]&& ![(CFXPreviewViewController *)self presentFullScreenTextEditorForEffect:v5 insertingEffect:1])
      {
        long long v18 = JFXLog_DebugViewerUI();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController CFX_addEffect:]();
        }

        uint64_t v19 = [(CFXPreviewViewController *)self previewClip];
        [v19 removeEffect:v5];
      }
      unsigned int v20 = JFXLog_automation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v27 = 138412290;
        *(void *)&v27[4] = v16;
        uint64_t v21 = "Element Added: Overlay - %@";
LABEL_26:
        _os_log_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEFAULT, v21, v27, 0xCu);
      }
      break;
    default:
      goto LABEL_28;
  }

LABEL_28:
  long long v22 = +[CFXAnalyticsManager sharedInstance];
  [v22 trackEffect:v4];

  uint64_t v23 = CFXLog_action();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = [(CFXPreviewViewController *)self previewClip];
    double v25 = [v24 effectStack];
    double v26 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect added" atLocation:@"post-capture" withEffectStack:v25];
    *(_DWORD *)double v27 = 138543362;
    *(void *)&v27[4] = v26;
    _os_log_impl(&dword_234C41000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@", v27, 0xCu);
  }
}

- (void)filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a3 completion:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  memset(&v18, 0, sizeof(v18));
  uint64_t v8 = [(CFXPreviewViewController *)self previewPlayer];
  int64_t v9 = (int)[v8 currentTime];
  uint64_t v10 = [(CFXPreviewViewController *)self previewPlayer];
  CMTimeMake(&v18, v9, [v10 frameRate]);

  double v11 = dispatch_get_global_queue(21, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke;
  v13[3] = &unk_264C0B390;
  CMTime v17 = v18;
  CGFloat v15 = width;
  CGFloat v16 = height;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async(v11, v13);
}

void __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) previewClip];
  uint64_t v3 = (void *)[v2 copy];

  [v3 removeAllEffects];
  id v4 = [*(id *)(a1 + 32) previewClip];
  BOOL v5 = [v4 effectsOfType:7];
  int v6 = [v5 firstObject];

  if (v6)
  {
    id v7 = (void *)[v6 copy];
    [v3 addEffect:v7];
  }
  uint64_t v8 = [[CFXExportClipDataSource alloc] initWithClip:v3];
  int64_t v9 = [[JFXComposition alloc] initWithClipsDataSource:v8];
  [(JFXComposition *)v9 setParentCode:303];
  [(CFXExportClipDataSource *)v8 renderSize];
  -[JFXComposition setViewSize:](v9, "setViewSize:");
  uint64_t v10 = [(JFXComposition *)v9 playerItem];
  [(JFXComposition *)v9 applyPlayerItemProperties];
  double v11 = [v10 asset];
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFA4B0]) initWithAsset:v11];
  double v13 = [v10 videoComposition];
  [v12 setVideoComposition:v13];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = *(_OWORD *)(a1 + 64);
  uint64_t v27 = *(void *)(a1 + 80);
  CGFloat v15 = [MEMORY[0x263F08D40] valueWithCMTime:&v26];
  [v14 addObject:v15];
  objc_msgSend(v12, "setMaximumSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v12 setAppliesPreferredTrackTransform:1];
  long long v24 = *MEMORY[0x263F010E0];
  long long v18 = v24;
  uint64_t v19 = v3;
  CGFloat v16 = v6;
  uint64_t v25 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v17 = v25;
  [v12 setRequestedTimeToleranceBefore:&v24];
  long long v22 = v18;
  uint64_t v23 = v17;
  [v12 setRequestedTimeToleranceAfter:&v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_2;
  v20[3] = &unk_264C0B368;
  id v21 = *(id *)(a1 + 40);
  [v12 generateCGImagesAsynchronouslyForTimes:v14 completionHandler:v20];
}

void __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a6;
  if (a3)
  {
    int64_t v9 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_4;
    v12[3] = &unk_264C0AF38;
    id v10 = *(id *)(a1 + 32);
    id v13 = v9;
    id v14 = v10;
    id v11 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_3;
    block[3] = &unk_264C0AF38;
    id v17 = *(id *)(a1 + 32);
    id v16 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v11 = v17;
  }
}

uint64_t __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)CFX_exportPhotoWithEffects
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CFXPreviewViewController *)self mediaItem];
  id v4 = [v3 originalAssetURL];

  BOOL v5 = [(CFXPreviewViewController *)self previewClip];
  int v6 = [v5 effectStack];

  id v7 = [JFXEffectsPreviewGenerator alloc];
  uint64_t v17 = *MEMORY[0x263F61718];
  v18[0] = MEMORY[0x263EFFA80];
  id v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  int64_t v9 = [(JFXEffectsPreviewGenerator *)v7 initWithRendererOptions:v8];

  [(CFXPreviewViewController *)self setStillImagePreviewGenerator:v9];
  id v10 = dispatch_get_global_queue(21, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke;
  v13[3] = &unk_264C0A888;
  id v14 = v4;
  id v15 = v6;
  id v16 = self;
  id v11 = v6;
  id v12 = v4;
  dispatch_async(v10, v13);
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke(id *a1)
{
  v83[4] = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v3 = [a1[4] path];
  id v4 = [v2 imageWithContentsOfFile:v3];

  BOOL v5 = objc_msgSend(v4, "jfx_renderedImageWithUpOrientation");

  int v6 = [MEMORY[0x263F61268] imageWithUIImage:v5];
  id v7 = (void *)[a1[5] mutableDeepCopy];
  [v6 size];
  double v9 = v8;
  double v11 = v10;
  uint64_t v81 = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  PVTransformAnimationInfoIdentity();
  id v12 = [a1[6] delegate];
  uint64_t v13 = [v12 cameraModeUsedForCapture];

  BOOL v14 = JFXIsCTMCroppedCameraMode(v13);
  if (v14)
  {
    double v15 = 1.77777778;
    if (v9 <= v11) {
      double v15 = 0.5625;
    }
    if (v13 == 9) {
      double v15 = 1.0;
    }
    if (v9 / v15 <= v11) {
      double v16 = v9 / v15;
    }
    else {
      double v16 = v11;
    }
    double v17 = v15 * v16;
    PVTransformAnimationInfoForLiveCapture();
    long long v78 = v74;
    long long v79 = v75;
    long long v80 = v76;
    uint64_t v81 = v77;
  }
  else
  {
    double v17 = v9;
    double v16 = v11;
  }
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_2;
  v73[3] = &__block_descriptor_48_e26_v32__0__JFXEffect_8Q16_B24l;
  *(double *)&v73[4] = v17;
  *(double *)&v73[5] = v16;
  [v7 enumerateObjectsUsingBlock:v73];
  long long v18 = [JFXEffectsPreviewGenerationRequest alloc];
  long long v74 = kDefaultEffectPreviewRenderTime;
  *(void *)&long long v75 = 0;
  uint64_t v19 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v18, "initWithInput:effectStack:outputSize:renderTime:", v6, v7, &v74, v17, v16);
  unsigned int v20 = v19;
  if (v14)
  {
    long long v74 = v78;
    long long v75 = v79;
    long long v76 = v80;
    uint64_t v77 = v81;
    [(JFXEffectsPreviewGenerationRequest *)v19 setTransformAnimationInfo:&v74 scaleToOutput:0];
  }
  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  long long v22 = [a1[6] previewClip];
  uint64_t v23 = [v22 effectsOfType:7];
  uint64_t v24 = [v23 count];

  unint64_t v25 = 0x263EFF000;
  if (v24)
  {
    double v66 = v21;
    double v67 = v7;
    v68 = v6;
    long long v69 = v5;
    long long v26 = NSString;
    uint64_t v27 = [a1[6] previewClip];
    uint64_t v28 = [v27 uuid];
    uint64_t v29 = [v26 stringWithFormat:@"%@_%@", @"exportPhotoWithEffects_arMetadataMediaReader", v28];

    double v30 = +[JFXMediaDataReaderFactory sharedInstance];
    double v31 = [a1[6] previewClip];
    CGSize v65 = (void *)v29;
    double v32 = [v30 createARMetadataReaderWithCreationAttributesProvider:v31 name:v29];

    [v32 beginReading];
    long long v74 = *MEMORY[0x263F010E0];
    long long v62 = v74;
    *(void *)&long long v75 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v33 = v75;
    CGPoint v64 = v32;
    double v34 = [v32 arMetadataItemForTime:&v74];
    uint64_t v35 = [v34 arMetadata];

    double v36 = NSString;
    double v37 = [a1[6] previewClip];
    double v38 = [v37 uuid];
    uint64_t v39 = [v36 stringWithFormat:@"%@_%@", @"exportPhotoWithEffects_depthMediaReader", v38];

    uint64_t v40 = +[JFXMediaDataReaderFactory sharedInstance];
    uint64_t v41 = [a1[6] previewClip];
    __int16 v61 = (void *)v39;
    uint64_t v42 = [v40 createDepthDataReaderWithCreationAttributesProvider:v41 name:v39];

    [v42 beginReading];
    long long v74 = v62;
    *(void *)&long long v75 = v33;
    double v60 = [v42 depthDataForTime:&v74];
    id v43 = [v60 avDepthData];
    id v44 = objc_alloc_init(JFXAnimojiEffectRenderer);
    [(JFXAnimojiEffectRenderer *)v44 setAllowAntialiasing:0];
    v45 = v44;
    id v46 = [a1[6] delegate];
    uint64_t v47 = [v46 calculateMediaInterfaceOrientationForDisplay];

    +[JFXAnimojiEffectRenderer animojiBufferSizeWithImageSize:interfaceOrientation:](JFXAnimojiEffectRenderer, "animojiBufferSizeWithImageSize:interfaceOrientation:", v47, v9, v11);
    uint64_t v63 = (void *)v35;
    v83[0] = v35;
    v82[0] = @"JFXAnimojiRendererMetadata_JFXARMetadata";
    v82[1] = @"JFXAnimojiRendererMetadata_RenderSize";
    v72[0] = v48;
    v72[1] = v49;
    uint64_t v50 = [MEMORY[0x263F08D40] valueWithBytes:v72 objCType:"{CGSize=dd}"];
    v83[1] = v50;
    v82[2] = @"JFXAnimojiRendererMetadata_UIInterfaceOrientation";
    uint64_t v51 = [NSNumber numberWithInteger:v47];
    v83[2] = v51;
    v82[3] = @"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation";
    double v52 = [NSNumber numberWithInteger:4];
    v83[3] = v52;
    double v53 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:4];
    double v54 = (void *)[v53 mutableCopy];

    if (v43) {
      [v54 setObject:v43 forKeyedSubscript:@"JFXAnimojiRendererMetadata_DepthData"];
    }
    __int16 v55 = [a1[6] previewClip];
    double v56 = [v55 originalAnimojiDataRepresentation];

    if (v56) {
      [v54 setObject:v56 forKeyedSubscript:@"JFXAnimojiRendererMetadata_DataRepresentation"];
    }
    id v57 = +[JFXCustomRenderProperties newCustomRenderProperties:v45 metadata:v54];
    [v66 setObject:v57 forKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];

    id v21 = v66;
    int v6 = v68;
    BOOL v5 = v69;
    id v7 = v67;
    unint64_t v25 = 0x263EFF000uLL;
  }
  v58 = [*(id *)(v25 + 2352) dictionaryWithDictionary:v21];
  [(JFXEffectsPreviewGenerationRequest *)v20 setCustomRenderingProperties:v58];

  [(JFXEffectsPreviewGenerationRequest *)v20 setHighQuality:1];
  __int16 v59 = [a1[6] stillImagePreviewGenerator];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3;
  v70[3] = &unk_264C0B3D8;
  v70[4] = a1[6];
  id v71 = a1[4];
  [v59 generatePreviewRequest:v20 completionHandler:v70];
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "setRenderSize:", v2, v3);
  BOOL v5 = [v4 renderEffect];

  v6[0] = kDefaultEffectPreviewAnimationRange;
  v6[1] = xmmword_234D62718;
  v6[2] = xmmword_234D62728;
  [v5 setEffectRange:v6];
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = [a2 objectEnumerator];
  id v4 = [v3 nextObject];

  BOOL v5 = [v4 uiImage];
  int v6 = [*(id *)(a1 + 32) mediaItem];
  id v7 = [v6 adjustedAssetURL];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v24 = 0;
    double v9 = +[JFXMediaURLManager photoExportURL:&v24 isHEIF:0];
    id v8 = v24;
    double v10 = [*(id *)(a1 + 32) mediaItem];
    [v10 setAdjustedAssetURL:v9];
  }
  double v11 = [*(id *)(a1 + 32) mediaItem];
  id v12 = [v11 adjustedAssetURL];

  if (v12)
  {
    uint64_t v13 = [v12 pathExtension];
    BOOL v14 = ![v13 caseInsensitiveCompare:@"heic"]
       || ![v13 caseInsensitiveCompare:@"heif"];
    double v15 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 40), 0);
    double v16 = CGImageSourceCopyMetadataAtIndex(v15, 0, 0);
    MutableCopdouble y = CGImageMetadataCreateMutableCopy(v16);
    CGImageMetadataRemoveTagWithPath(MutableCopy, 0, @"tiff:Orientation");
    if (v16) {
      CFRelease(v16);
    }
    if (v15) {
      CFRelease(v15);
    }
    char v18 = objc_msgSend(*(id *)(a1 + 32), "CFX_saveImageToURL:image:compressionQuality:asHEIF:metadata:", v12, v5, v14, MutableCopy, 1.0);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if ((v18 & 1) == 0)
    {
      uint64_t v19 = JFXLog_export();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_2();
      }
    }
  }
  else
  {
    uint64_t v13 = JFXLog_export();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_1();
    }
  }

  unsigned int v20 = +[JFXVideoCameraController sharedInstance];
  [v20 clear];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_79;
  block[3] = &unk_264C09F10;
  void block[4] = *(void *)(a1 + 32);
  id v23 = v8;
  id v21 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_notifyDelegateExportMediaItemFinishedWithError:", *(void *)(a1 + 40));
  double v2 = [*(id *)(a1 + 32) mediaItem];
  double v3 = [v2 clip];
  [v3 removeAllEffects];

  id v4 = *(void **)(a1 + 32);
  return [v4 setStillImagePreviewGenerator:0];
}

- (BOOL)CFX_saveImageToURL:(id)a3 image:(id)a4 compressionQuality:(double)a5 asHEIF:(BOOL)a6 metadata:(CGImageMetadata *)a7
{
  BOOL v8 = a6;
  v21[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = (CFStringRef *)MEMORY[0x263EF9870];
  if (!v8) {
    id v12 = (CFStringRef *)MEMORY[0x263EF9880];
  }
  CGImageDestinationRef v13 = CGImageDestinationCreateWithURL((CFURLRef)a3, *v12, 1uLL, 0);
  if (v13)
  {
    BOOL v14 = v13;
    uint64_t v20 = *MEMORY[0x263F0EFE8];
    double v15 = [NSNumber numberWithDouble:a5];
    v21[0] = v15;
    CFDictionaryRef v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    double v17 = (CGImage *)[v11 CGImage];
    if (a7) {
      CGImageDestinationAddImageAndMetadata(v14, v17, a7, v16);
    }
    else {
      CGImageDestinationAddImage(v14, v17, v16);
    }
    BOOL v18 = CGImageDestinationFinalize(v14);
    CFRelease(v14);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)exportMediaItemToFileURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke;
  _OWORD v6[3] = &unk_264C09F10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:0];

  double v3 = [*(id *)(a1 + 32) previewPlayer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_2;
  v5[3] = &unk_264C09F10;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 pauseWithCompletionBlock:v5];
}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_3;
  v2[3] = &unk_264C09F10;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_3(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x237DD1350]();
  id v3 = [*(id *)(a1 + 32) previewPlayer];
  [v3 didReceiveMemoryWarning];

  id v4 = [*(id *)(a1 + 32) previewClip];
  int v5 = [v4 isStill];
  [*(id *)(a1 + 32) setSaveMediaItemToFunCamPhotosAlbumUponExport:*(void *)(a1 + 40) == 0];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) mediaItem];
  [v7 setAdjustedAssetURL:v6];

  objc_msgSend(*(id *)(a1 + 32), "CFX_setIsExporting:", 1);
  [*(id *)(a1 + 32) setPlayButtonHiddenIfPossible:1];
  objc_msgSend(*(id *)(a1 + 32), "CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:", 1, 0);
  if (([*(id *)(a1 + 32) shouldExportOnly] & 1) == 0)
  {
    BOOL v8 = [*(id *)(a1 + 32) delegate];
    double v9 = *(void **)(a1 + 32);
    double v10 = [v9 mediaItem];
    [v8 previewViewController:v9 didStartExportingMediaItem:v10];
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "CFX_exportPhotoWithEffects");
    CFXLog_action();
    id v11 = (CFXExportClipDataSource *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 effectStack];
      CGImageDestinationRef v13 = +[CFXActionLogging actionLogAsJSONForEvent:@"exported still" atLocation:@"post-capture" withEffectStack:v12];
      *(_DWORD *)buf = 138543362;
      double v38 = v13;
      _os_log_impl(&dword_234C41000, &v11->super, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = [[CFXExportClipDataSource alloc] initWithClip:v4];
    BOOL v14 = [[JFXCompositionExporter alloc] initWithClipsDataSource:v11];
    [*(id *)(a1 + 32) setExporter:v14];

    double v15 = *(void **)(a1 + 32);
    CFDictionaryRef v16 = [v15 exporter];
    [v16 setDelegate:v15];

    double v17 = [*(id *)(a1 + 32) mediaItem];
    BOOL v18 = [v17 adjustedAssetURL];

    if (!v18)
    {
      id v35 = 0;
      uint64_t v19 = +[JFXMediaURLManager videoExportURL:&v35];
      id v20 = v35;
      id v21 = [*(id *)(a1 + 32) mediaItem];
      [v21 setAdjustedAssetURL:v19];
    }
    long long v22 = [v4 mediaItem];
    id v23 = [v22 colorSpace];
    id v24 = objc_msgSend(*(id *)(a1 + 32), "CFX_AVAssetExportPresetWithColorSpace:", v23);
    unint64_t v25 = [*(id *)(a1 + 32) mediaItem];
    long long v26 = [v25 adjustedAssetURL];
    uint64_t v27 = [v26 path];

    uint64_t v28 = [*(id *)(a1 + 32) exporter];
    double v36 = v24;
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    [v28 startWithPresets:v29 toFilePath:v27 poster:0];

    double v30 = CFXLog_action();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      [v4 effectStack];
      double v34 = v23;
      v32 = double v31 = v22;
      uint64_t v33 = +[CFXActionLogging actionLogAsJSONForEvent:@"exported video" atLocation:@"post-capture" withEffectStack:v32];
      *(_DWORD *)buf = 138543362;
      double v38 = v33;
      _os_log_impl(&dword_234C41000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

      long long v22 = v31;
      id v23 = v34;
    }
  }
}

- (id)CFX_AVAssetExportPresetWithColorSpace:(id)a3
{
  id v3 = a3;
  id v4 = +[CFXMediaSettings sharedInstance];
  [v4 frameSize];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = (int)v6;
  double v10 = [MEMORY[0x263F307D8] preferences];
  int v11 = [v10 usingMostCompatibleEncoding];

  int v12 = [v3 isHDRSpace];
  int v13 = [v3 isWideGamutSpace];

  BOOL v14 = [MEMORY[0x263F30780] capabilities];
  int v15 = [v14 isHEVCEncodingSupported];

  int v16 = v12 | ~v11 | v13;
  BOOL v17 = (v16 & v15) == 0;
  if ((v16 & v15) != 0) {
    BOOL v18 = JFXAssetExportPresetHEVC1920x1080;
  }
  else {
    BOOL v18 = (__CFString *)*MEMORY[0x263EF9538];
  }
  uint64_t v19 = JFXAssetExportPresetHEVC1280x720;
  if (v17) {
    uint64_t v19 = (__CFString *)*MEMORY[0x263EF9530];
  }
  if (v12) {
    BOOL v18 = JFXAssetExportPresetHEVC1920x1080HDR;
  }
  id v20 = JFXAssetExportPresetHEVC1280x720HDR;
  if (!v12) {
    id v20 = v19;
  }
  if ((uint64_t)(v9 | ((unint64_t)(int)v8 << 32)) <= 0x500FFFFFFFFLL && (int)v9 <= 1280) {
    BOOL v18 = v20;
  }
  long long v22 = v18;
  return v22;
}

- (void)playbackDidStart:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CFXPreviewViewController_playbackDidStart___block_invoke;
  _OWORD v6[3] = &unk_264C09FA8;
  v6[4] = self;
  double v4 = *MEMORY[0x263F1D4D8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__CFXPreviewViewController_playbackDidStart___block_invoke_2;
  v5[3] = &unk_264C0B400;
  v5[4] = self;
  +[JTAnimation performAnimation:v6 duration:v5 completion:v4];
  [(CFXPreviewViewController *)self CFX_hidePreviewUI];
}

void __45__CFXPreviewViewController_playbackDidStart___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playButton];
  [v1 setAlpha:0.0];
}

void __45__CFXPreviewViewController_playbackDidStart___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playButton];
  [v1 notifyPlaybackDidStart];
}

- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4
{
  float v5 = (double)a4 / (double)(int)[a3 duration];
  id v7 = [(CFXPreviewViewController *)self playbackSlider];
  *(float *)&double v6 = v5;
  [v7 setValue:v6];
}

- (void)playbackDidStop:(id)a3 currentTime:(int)a4
{
  id v6 = a3;
  id v7 = [(CFXPreviewViewController *)self previewPlayer];
  double v8 = [v7 clip];
  int v9 = [v8 duration];

  if (v9 <= a4) {
    [v6 seekToTime:0];
  }
  [(CFXPreviewViewController *)self setEffectAnimationsEnabledIfPossible:0];
  double v10 = [(CFXPreviewViewController *)self playButton];
  [v10 notifyPlaybackDidStop];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__CFXPreviewViewController_playbackDidStop_currentTime___block_invoke;
  v11[3] = &unk_264C09FA8;
  void v11[4] = self;
  +[JTAnimation performAnimation:v11 duration:0 completion:*MEMORY[0x263F1D4D8]];
  [(CFXPreviewViewController *)self CFX_showPreviewUI];
}

void __56__CFXPreviewViewController_playbackDidStop_currentTime___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) playButton];
  [v1 setAlpha:1.0];
}

- (void)playbackAreaTapped:(id)a3 normalizedClipPoint:(CGPoint)a4 normalizedMinimumSize:(id)a5 atTime:(int)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  double y = a4.y;
  double x = a4.x;
  int v11 = [(CFXPreviewViewController *)self previewClip];
  int v12 = [v11 effectsOfType:2];

  int v13 = [(CFXPreviewViewController *)self previewPlayer];
  char v14 = [v13 isPlaying];

  if ((v14 & 1) != 0
    || (long long v19 = *MEMORY[0x263F010E0],
        uint64_t v20 = *(void *)(MEMORY[0x263F010E0] + 16),
        +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v12, &v19, 1, x, y, var0, var1), (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v17 = [(CFXPreviewViewController *)self delegate];
    BOOL v18 = [v17 selectedAppIdentifierForPreviewViewController:self];

    if (!v18) {
      [(CFXPreviewViewController *)self CFX_togglePreviewUI];
    }
  }
  else
  {
    int v16 = (void *)v15;
    [(CFXPreviewViewController *)self displayEffectEditorForEffect:v15 forMode:0];
  }
}

- (void)playbackAreaPanned:(id)a3 gesture:(id)a4 normalizedClipPoint:(CGPoint)a5 normalizedMinimumSize:(id)a6 translationDelta:(CGPoint)a7 atTime:(int)a8 timeScale:(int)a9
{
  double var1 = a6.var1;
  double var0 = a6.var0;
  double y = a5.y;
  double x = a5.x;
  id v14 = a4;
  uint64_t v15 = [(CFXPreviewViewController *)self previewClip];
  if (!v15) {
    goto LABEL_43;
  }
  if ([v14 state] == 1)
  {
    int v16 = [(CFXPreviewViewController *)self previewPlayer];
    char v17 = [v16 isPlaying];

    if (v17) {
      goto LABEL_43;
    }
  }
  uint64_t v18 = [v14 state];
  if ((unint64_t)(v18 - 3) < 2)
  {
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 1) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      double v31 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.8();
      }

      double v32 = [(CFXPreviewViewController *)self effectEditor];
      [v32 handlePanGesture:v14];

      unint64_t v33 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFELL;
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v33];
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v33];
      if (![(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v34 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.7();
        }

        [(CFXPreviewViewController *)self removeEffectEditor];
      }
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1) {
        goto LABEL_43;
      }
      long long v19 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.5();
      }

      if ([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        uint64_t v20 = [(CFXPreviewViewController *)self effectEditor];
        id v21 = [v20 editEffect];

        long long v22 = [v21 jtEffect];
        id v23 = CFXLog_DebugEffectEditingUI();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          unint64_t v25 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.4();
          }
        }
        if (v22) {
          goto LABEL_36;
        }
      }
      long long v26 = [(CFXPreviewViewController *)self previewClip];
      uint64_t v27 = [v26 effectsOfType:2];

      long long v40 = *MEMORY[0x263F010E0];
      uint64_t v41 = *(void *)(MEMORY[0x263F010E0] + 16);
      long long v22 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v27, &v40, 1, x, y, var0, var1);
      uint64_t v28 = CFXLog_DebugEffectEditingUI();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      BOOL v30 = v29;
      if (v22)
      {

        if (!v30)
        {
LABEL_35:

LABEL_36:
          if ([v22 type] == 2)
          {
            unint64_t v37 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] | 1;
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v37];
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v37];
            if (![(CFXPreviewViewController *)self isEditingEffect]) {
              [(CFXPreviewViewController *)self displayEffectEditorForEffect:v22 forMode:1];
            }
            double v38 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:]();
            }

            uint64_t v39 = [(CFXPreviewViewController *)self effectEditor];
            [v39 handlePanGesture:v14];
          }
          goto LABEL_43;
        }
        uint64_t v28 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:]();
        }
      }
      else if (v29)
      {
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:]();
      }

      goto LABEL_35;
    }
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 1) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      id v35 = [(CFXPreviewViewController *)self effectEditor];
      [v35 handlePanGesture:v14];

      double v36 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.6();
      }
    }
  }
LABEL_43:
}

- (void)playbackAreaPinched:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 scaleDelta:(double)a8 atTime:(int)a9 timeScale:(int)a10
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  double y = a6.y;
  double x = a6.x;
  id v15 = a4;
  int v16 = [(CFXPreviewViewController *)self previewClip];
  if (!v16) {
    goto LABEL_43;
  }
  if ([v15 state] == 1)
  {
    char v17 = [(CFXPreviewViewController *)self previewPlayer];
    char v18 = [v17 isPlaying];

    if (v18) {
      goto LABEL_43;
    }
  }
  uint64_t v19 = [v15 state];
  if ((unint64_t)(v19 - 3) < 2)
  {
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 2) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      double v32 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.8();
      }

      unint64_t v33 = [(CFXPreviewViewController *)self effectEditor];
      [v33 handlePinchGesture:v15];

      unint64_t v34 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFDLL;
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v34];
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v34];
      if (![(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        id v35 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.7();
        }

        [(CFXPreviewViewController *)self removeEffectEditor];
      }
    }
  }
  else
  {
    if (v19 != 2)
    {
      if (v19 != 1) {
        goto LABEL_43;
      }
      uint64_t v20 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.5();
      }

      if ([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        id v21 = [(CFXPreviewViewController *)self effectEditor];
        long long v22 = [v21 editEffect];

        id v23 = [v22 jtEffect];
        BOOL v24 = CFXLog_DebugEffectEditingUI();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

        if (v25)
        {
          long long v26 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.4();
          }
        }
        if (v23) {
          goto LABEL_36;
        }
      }
      uint64_t v27 = [(CFXPreviewViewController *)self previewClip];
      uint64_t v28 = [v27 effectsOfType:2];

      long long v41 = *MEMORY[0x263F010E0];
      uint64_t v42 = *(void *)(MEMORY[0x263F010E0] + 16);
      id v23 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v28, &v41, 1, x, y, var0, var1);
      BOOL v29 = CFXLog_DebugEffectEditingUI();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      BOOL v31 = v30;
      if (v23)
      {

        if (!v31)
        {
LABEL_35:

LABEL_36:
          if ([v23 type] == 2)
          {
            unint64_t v38 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] | 2;
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v38];
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v38];
            if (![(CFXPreviewViewController *)self isEditingEffect]) {
              [(CFXPreviewViewController *)self displayEffectEditorForEffect:v23 forMode:1];
            }
            uint64_t v39 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
              -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:]();
            }

            long long v40 = [(CFXPreviewViewController *)self effectEditor];
            [v40 handlePinchGesture:v15];
          }
          goto LABEL_43;
        }
        BOOL v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:]();
        }
      }
      else if (v30)
      {
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:]();
      }

      goto LABEL_35;
    }
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 2) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      double v36 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.6();
      }

      unint64_t v37 = [(CFXPreviewViewController *)self effectEditor];
      [v37 handlePinchGesture:v15];
    }
  }
LABEL_43:
}

- (void)playbackAreaRotated:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 rotateDelta:(double)a8 atTime:(int)a9
{
  double var1 = a7.var1;
  double var0 = a7.var0;
  double y = a6.y;
  double x = a6.x;
  id v14 = a4;
  id v15 = [(CFXPreviewViewController *)self previewClip];
  if (!v15) {
    goto LABEL_43;
  }
  if ([v14 state] == 1)
  {
    int v16 = [(CFXPreviewViewController *)self previewPlayer];
    char v17 = [v16 isPlaying];

    if (v17) {
      goto LABEL_43;
    }
  }
  uint64_t v18 = [v14 state];
  if ((unint64_t)(v18 - 3) < 2)
  {
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 4) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      BOOL v31 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.8();
      }

      double v32 = [(CFXPreviewViewController *)self effectEditor];
      [v32 handleRotateGesture:v14];

      unint64_t v33 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFBLL;
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v33];
      [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v33];
      if (![(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        unint64_t v34 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.7();
        }

        [(CFXPreviewViewController *)self removeEffectEditor];
      }
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1) {
        goto LABEL_43;
      }
      uint64_t v19 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.5();
      }

      if ([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures])
      {
        uint64_t v20 = [(CFXPreviewViewController *)self effectEditor];
        id v21 = [v20 editEffect];

        long long v22 = [v21 jtEffect];
        id v23 = CFXLog_DebugEffectEditingUI();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          BOOL v25 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.4();
          }
        }
        if (v22) {
          goto LABEL_36;
        }
      }
      long long v26 = [(CFXPreviewViewController *)self previewClip];
      uint64_t v27 = [v26 effectsOfType:2];

      long long v40 = *MEMORY[0x263F010E0];
      uint64_t v41 = *(void *)(MEMORY[0x263F010E0] + 16);
      long long v22 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v27, &v40, 1, x, y, var0, var1);
      uint64_t v28 = CFXLog_DebugEffectEditingUI();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      BOOL v30 = v29;
      if (v22)
      {

        if (!v30)
        {
LABEL_35:

LABEL_36:
          if ([v22 type] == 2)
          {
            unint64_t v37 = [(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] | 4;
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v37];
            [(CFXPreviewViewController *)self setAppliedDirectOverlayEditingGestures:v37];
            if (![(CFXPreviewViewController *)self isEditingEffect]) {
              [(CFXPreviewViewController *)self displayEffectEditorForEffect:v22 forMode:1];
            }
            unint64_t v38 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:]();
            }

            uint64_t v39 = [(CFXPreviewViewController *)self effectEditor];
            [v39 handleRotateGesture:v14];
          }
          goto LABEL_43;
        }
        uint64_t v28 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:]();
        }
      }
      else if (v29)
      {
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:]();
      }

      goto LABEL_35;
    }
    if (([(CFXPreviewViewController *)self appliedDirectOverlayEditingGestures] & 4) != 0
      && [(CFXPreviewViewController *)self isEditingEffect])
    {
      id v35 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.6();
      }

      double v36 = [(CFXPreviewViewController *)self effectEditor];
      [v36 handleRotateGesture:v14];
    }
  }
LABEL_43:
}

- (double)animationDurationForCompositionTransition:(id)a3 shouldScale:(BOOL *)a4
{
  float v5 = +[CFXPreviewViewController liveCaptureSnapshotView];
  if (v5) {
    double v6 = 0.25;
  }
  else {
    double v6 = 0.0;
  }

  *a4 = 0;
  return v6;
}

- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CFXPreviewViewController *)self previewPlayer];
  char v8 = [v7 isPlaying];

  if ((v8 & 1) == 0)
  {
    int v9 = [(CFXPreviewViewController *)self effectEditor];

    if (v9)
    {
      double v10 = [(CFXPreviewViewController *)self effectEditor];
      if ([v10 mode] == a4)
      {
        int v11 = [(CFXPreviewViewController *)self effectEditor];
        int v12 = [v11 editEffect];
        char v13 = [v12 isEqual:v6];

        if (v13) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      [(CFXPreviewViewController *)self removeEffectEditor];
    }
    if (a4
      || !+[JFXEffectEditingUtilities canEditTextForEffect:v6])
    {
      id v15 = +[CFXEffect effectWithJTEffect:v6];
      int v16 = [[CFXEffectEditorView alloc] initWithMode:a4 delegate:self];
      [(CFXPreviewViewController *)self setEffectEditor:v16];

      char v17 = [(CFXPreviewViewController *)self view];
      uint64_t v18 = [(CFXPreviewViewController *)self effectEditor];
      uint64_t v19 = [(CFXPreviewViewController *)self previewPlayer];
      uint64_t v20 = [v19 view];
      [v17 insertSubview:v18 aboveSubview:v20];

      id v21 = [(CFXPreviewViewController *)self playerContainerView];
      [v21 frame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      BOOL v30 = [(CFXPreviewViewController *)self effectEditor];
      objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

      BOOL v31 = [(CFXPreviewViewController *)self effectEditor];
      [v31 beginEditingEffect:v15];

      [(CFXPreviewViewController *)self setPlayButtonHiddenIfPossible:1];
    }
    else if (![(CFXPreviewViewController *)self presentFullScreenTextEditorForEffect:v6 insertingEffect:0])
    {
      id v14 = JFXLog_DebugViewerUI();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[CFXPreviewViewController displayEffectEditorForEffect:forMode:]();
      }
    }
  }
LABEL_15:
}

- (BOOL)isEditingEffect
{
  double v2 = [(CFXPreviewViewController *)self effectEditor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGRect)playerContentFrame
{
  BOOL v3 = +[CFXMediaSettings sharedInstance];
  [v3 renderSize];
  CGFloat v5 = v4;
  CGFloat v7 = v6;

  char v8 = [(CFXPreviewViewController *)self playerContainerView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v25.CGFloat width = v5;
  v25.CGFloat height = v7;
  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  CGRect v26 = AVMakeRectWithAspectRatioInsideRect(v25, v28);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)updateEffectEditorLayout
{
  BOOL v3 = [(CFXPreviewViewController *)self effectEditor];

  if (v3)
  {
    [(CFXPreviewViewController *)self playerContentFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(CFXPreviewViewController *)self effectEditor];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)removeEffectEditor
{
  BOOL v3 = [(CFXPreviewViewController *)self effectEditor];

  if (v3)
  {
    double v4 = [(CFXPreviewViewController *)self effectEditor];
    objc_initWeak(&location, v4);

    [(CFXPreviewViewController *)self setEffectEditor:0];
    id v5 = objc_loadWeakRetained(&location);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    double v8 = __46__CFXPreviewViewController_removeEffectEditor__block_invoke;
    double v9 = &unk_264C0B428;
    objc_copyWeak(&v10, &location);
    [v5 endEditingAnimated:1 withCompletionBlock:&v6];

    -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", 0, v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__CFXPreviewViewController_removeEffectEditor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeFromSuperview];
}

- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CFXPreviewViewController *)self view];
  double v8 = [(CFXPreviewViewController *)self playerContainerView];
  [v8 frame];
  objc_msgSend(v7, "convertRect:toView:", 0);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  char v17 = +[CFXEffect effectWithJTEffect:v6];

  uint64_t v18 = [(CFXPreviewViewController *)self delegate];
  [v18 previewViewControllerDidStartEditingText:self];

  BOOL v19 = +[CFXFullScreenTextEditViewController displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:](CFXFullScreenTextEditViewController, "displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:", v17, self, self, v4, v10, v12, v14, v16);
  uint64_t v20 = [(CFXPreviewViewController *)self effectBrowserContentPresenterViewController];

  if (v20)
  {
    double v21 = [(CFXPreviewViewController *)self view];
    double v22 = [(CFXPreviewViewController *)self effectBrowserContentPresenterViewController];
    double v23 = [v22 view];
    [v21 bringSubviewToFront:v23];
  }
  return v19;
}

- (void)updateFullScreenTextEditorLayout
{
  if (+[CFXFullScreenTextEditViewController isFullScreenTextEditorPresented])
  {
    [(CFXPreviewViewController *)self playerContentFrame];
    +[CFXFullScreenTextEditViewController notifyCameraViewWindowFrameChanged:](CFXFullScreenTextEditViewController, "notifyCameraViewWindowFrameChanged:");
  }
}

- (void)exportProgressedTo:(float)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__CFXPreviewViewController_exportProgressedTo___block_invoke;
  v3[3] = &unk_264C0B450;
  v3[4] = self;
  float v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __47__CFXPreviewViewController_exportProgressedTo___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldExportOnly])
  {
    double v2 = NSString;
    BOOL v3 = [NSNumber numberWithInt:(int)(float)(*(float *)(a1 + 40) * 100.0)];
    id v7 = [v2 stringWithFormat:@"-EXPORTING- %@%%", v3];

    float v4 = [*(id *)(a1 + 32) exportButton];
    [v4 setTitle:v7 forState:0];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    id v5 = *(void **)(a1 + 32);
    double v6 = *(float *)(a1 + 40);
    float v4 = [v5 mediaItem];
    [v7 previewViewController:v5 didProgress:v4 exportingMediaItem:v6];
  }
}

- (void)didFinishExport:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__CFXPreviewViewController_didFinishExport___block_invoke;
  v3[3] = &unk_264C0A3A0;
  v3[4] = self;
  void v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __44__CFXPreviewViewController_didFinishExport___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExporter:0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    double v10 = (void *)MEMORY[0x263F087E8];
    id v5 = [MEMORY[0x263F086E0] jfxBundle];
    double v6 = [v5 bundleIdentifier];
    id v7 = v10;
    double v8 = v6;
    uint64_t v9 = 1001;
  }
  else
  {
    id v3 = 0;
    if (v2 != 3) {
      goto LABEL_6;
    }
    float v4 = (void *)MEMORY[0x263F087E8];
    id v5 = [MEMORY[0x263F086E0] jfxBundle];
    double v6 = [v5 bundleIdentifier];
    id v7 = v4;
    double v8 = v6;
    uint64_t v9 = 1000;
  }
  id v12 = [v7 errorWithDomain:v8 code:v9 userInfo:0];

  id v3 = v12;
LABEL_6:
  id v13 = v3;
  double v11 = [*(id *)(a1 + 32) view];
  [v11 setUserInteractionEnabled:1];

  objc_msgSend(*(id *)(a1 + 32), "CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "CFX_notifyDelegateExportMediaItemFinishedWithError:", v13);
}

- (void)playButtonViewDidTapPlay:(id)a3
{
  float v4 = [(CFXPreviewViewController *)self exporter];

  if (!v4)
  {
    [(CFXPreviewViewController *)self removeEffectEditor];
    id v5 = [(CFXPreviewViewController *)self previewPlayer];
    [v5 play];

    [(CFXPreviewViewController *)self setEffectAnimationsEnabledIfPossible:1];
  }
}

- (void)playButtonViewDidTapPause:(id)a3
{
  id v3 = [(CFXPreviewViewController *)self previewPlayer];
  [v3 pause];
}

- (BOOL)shouldKeepPlayButtonHidden
{
  id v3 = [(CFXPreviewViewController *)self previewClip];
  if ([v3 isVideo]
    && ![(CFXPreviewViewController *)self isPresentingFilterPicker])
  {
    id v5 = [(CFXPreviewViewController *)self exporter];
    BOOL v4 = v5 != 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)setPlayButtonHiddenIfPossible:(BOOL)a3
{
  if ([(CFXPreviewViewController *)self shouldKeepPlayButtonHidden])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 1;
    if (![(CFXPreviewViewController *)self userInterfaceIsHidden] && !a3)
    {
      double v6 = [(CFXPreviewViewController *)self playButton];
      [v6 setAlpha:1.0];

      uint64_t v5 = 0;
    }
  }
  id v7 = [(CFXPreviewViewController *)self playButton];
  [v7 setHidden:v5];
}

- (void)setUserInterfaceHidden:(BOOL)a3
{
  if (self->_userInterfaceHidden != a3)
  {
    BOOL v3 = a3;
    self->_userInterfaceHidden = a3;
    uint64_t v5 = [(CFXPreviewViewController *)self shouldKeepPlayButtonHidden] | a3;
    double v6 = [(CFXPreviewViewController *)self playButton];
    [v6 setHidden:v5];

    LOBYTE(v5) = !v3;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__CFXPreviewViewController_setUserInterfaceHidden___block_invoke;
    v9[3] = &unk_264C0A3A0;
    void v9[4] = self;
    *(double *)&v9[5] = (double)!v3;
    +[JTAnimation performAnimation:v9 duration:0 completion:*MEMORY[0x263F1D4D8]];
    id v7 = [(CFXPreviewViewController *)self delegate];
    double v8 = v7;
    if (v5) {
      [v7 previewViewControllerDidShowUserInterface:self];
    }
    else {
      [v7 previewViewControllerDidHideUserInterface:self];
    }
  }
}

void __51__CFXPreviewViewController_setUserInterfaceHidden___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) previewControls];
  BOOL v4 = [v3 view];
  [v4 setAlpha:v2];

  double v5 = *(double *)(a1 + 40);
  double v6 = [*(id *)(a1 + 32) playButton];
  [v6 setAlpha:v5];

  double v7 = *(double *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) bottomControlsDrawer];
  [v8 setAlpha:v7];
}

- (void)CFX_showPreviewUI
{
}

- (void)CFX_hidePreviewUI
{
}

- (void)CFX_togglePreviewUI
{
  uint64_t v3 = [(CFXPreviewViewController *)self userInterfaceIsHidden] ^ 1;
  [(CFXPreviewViewController *)self setUserInterfaceHidden:v3];
}

- (void)configureUIForOrientation
{
  [(CFXPreviewViewController *)self CFX_layoutPlayerContainerView];
  [(CFXPreviewViewController *)self configureBottomControlsForOrientation];
  uint64_t v3 = [(CFXPreviewViewController *)self effectBrowserContentPresenterViewController];
  objc_msgSend(v3, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));

  [(CFXPreviewViewController *)self updateEffectEditorLayout];
  [(CFXPreviewViewController *)self updateFullScreenTextEditorLayout];
}

- (void)CFX_layoutPlayerContainerView
{
  uint64_t v3 = [(CFXPreviewViewController *)self delegate];
  uint64_t v4 = [v3 cameraModeUsedForCapture];

  double v5 = +[CFXMediaSettings sharedInstance];
  [v5 renderSize];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = +[JFXOrientationMonitor interfaceOrientation];
  double v11 = +[JFXOrientationMonitor keyWindow];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double Width = v18;

  if (v4 == 9)
  {
    if ((unint64_t)(v10 - 3) <= 1)
    {
      v38.origin.CGFloat x = v13;
      v38.origin.CGFloat y = v15;
      v38.size.CGFloat width = v17;
      v38.size.CGFloat height = Width;
      CGFloat Height = CGRectGetHeight(v38);
      v39.origin.CGFloat x = v13;
      v39.origin.CGFloat y = v15;
      v39.size.CGFloat width = v17;
      v39.size.CGFloat height = Width;
      double Width = CGRectGetWidth(v39);
      double v17 = Height;
    }
    id v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F307C0]), "initWithReferenceBounds:shutterIntrinsicSize:", v13, v15, v17, Width, 72.0, 72.0);
    [v36 viewportFrameForAspectRatio:3 usingAppDrawer:1 accessoryAreaExpanded:0];
    double v23 = v22;
    double v24 = v21;
    double v26 = v25;
    double v28 = v27;
    if ((unint64_t)(v10 - 3) <= 1)
    {
      if (v10 == 3)
      {
        double v29 = v21;
      }
      else
      {
        double v32 = [(CFXPreviewViewController *)self view];
        [v32 frame];
        double v33 = CGRectGetWidth(v40);
        v41.origin.CGFloat x = v23;
        v41.origin.CGFloat y = v24;
        v41.size.CGFloat width = v26;
        v41.size.CGFloat height = v28;
        double v29 = v33 - (v24 + CGRectGetWidth(v41));
      }
      v42.origin.CGFloat x = v23;
      v42.origin.CGFloat y = v24;
      v42.size.CGFloat width = v26;
      v42.size.CGFloat height = v28;
      CGFloat v34 = CGRectGetWidth(v42);
      v43.origin.CGFloat x = v23;
      v43.origin.CGFloat y = v24;
      v43.size.CGFloat width = v26;
      v43.size.CGFloat height = v28;
      double v28 = CGRectGetHeight(v43);
      double v26 = v34;
      double v24 = v23;
      double v23 = v29;
    }
    id v35 = [(CFXPreviewViewController *)self playerContainerView];
    objc_msgSend(v35, "setFrame:", v23, v24, v26, v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F5E478], "reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:", v10, v13, v15, v17, Width, v7, v9);
    BOOL v30 = [(CFXPreviewViewController *)self playerContainerView];
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, 0.0, 0.0);

    BOOL v31 = [(CFXPreviewViewController *)self playerContainerView];
    objc_msgSend(v31, "setCenter:", 0.0, 0.0);
  }
}

- (void)CFX_notifyDelegateExportMediaItemFinishedWithError:(id)a3
{
  id v11 = a3;
  if ([(CFXPreviewViewController *)self saveMediaItemToFunCamPhotosAlbumUponExport])
  {
    uint64_t v4 = [(CFXPreviewViewController *)self mediaItem];
    double v5 = [v4 adjustedAssetURL];

    double v6 = [(CFXPreviewViewController *)self mediaItem];
    double v7 = [v6 clip];
    uint64_t v8 = [v7 isStill];

    [(CFXPreviewViewController *)self CFX_addURLToCameraRoll:v5 isStill:v8 completionHandler:&__block_literal_global_100];
  }
  [(CFXPreviewViewController *)self CFX_setIsExporting:0];
  if (![(CFXPreviewViewController *)self shouldExportOnly])
  {
    double v9 = [(CFXPreviewViewController *)self delegate];
    int64_t v10 = [(CFXPreviewViewController *)self mediaItem];
    [v9 previewViewController:self didFinishExportingMediaItem:v10 withError:v11];
  }
}

- (void)CFX_setIsExporting:(BOOL)a3
{
  if ([(CFXPreviewViewController *)self shouldExportOnly])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__CFXPreviewViewController_CFX_setIsExporting___block_invoke;
    v5[3] = &unk_264C0A0C0;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __47__CFXPreviewViewController_CFX_setIsExporting___block_invoke(uint64_t a1)
{
  BOOL v2 = *(unsigned char *)(a1 + 40) == 0;
  uint64_t v3 = [*(id *)(a1 + 32) exportButton];
  [v3 setEnabled:v2];

  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x263F1C550] redColor];
  }
  else {
  uint64_t v4 = [MEMORY[0x263F1C550] blueColor];
  }
  double v5 = [*(id *)(a1 + 32) exportButton];
  [v5 setBackgroundColor:v4];

  BOOL v6 = [*(id *)(a1 + 32) exportButton];
  id v8 = v6;
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = @"-EXPORTING-";
  }
  else {
    double v7 = @"EXPORT";
  }
  [v6 setTitle:v7 forState:0];
}

- (void)setEffectAnimationsEnabledIfPossible:(BOOL)a3
{
}

- (void)CFX_setEffectAnimationsEnabledIfPossible:(BOOL)a3 updatePlayer:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v7 = [(CFXPreviewViewController *)self previewClip];
  int v8 = [v7 isStill];

  double v9 = [(CFXPreviewViewController *)self previewClip];
  int64_t v10 = [v9 effectsOfType:2];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  double v13 = v11;
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v14 = v12;
  int v15 = 0;
  uint64_t v16 = *(void *)v20;
  uint64_t v17 = v8 | !v5;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v20 != v16) {
        objc_enumerationMutation(v11);
      }
      v15 |= objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "enablePresentationState:", v17, (void)v19);
    }
    uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v14);

  if ((v4 & v15) == 1)
  {
    double v13 = [(CFXPreviewViewController *)self previewPlayer];
    [v13 updateCompositionForEffectChange];
LABEL_10:
  }
}

- (void)CFX_setFrameAndRenderSizes
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CFXPreviewViewController *)self delegate];
  uint64_t v4 = [v3 cameraModeUsedForCapture];

  BOOL v5 = [(CFXPreviewViewController *)self previewClip];
  [v5 mediaSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v9;
  double v11 = v7;
  if (v4)
  {
    if (v7 <= v9) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 4;
    }
    double v11 = JFXCroppedFrameSizeForCameraModeAndOrientation(v4, v12);
    double v10 = v13;
  }
  BOOL v14 = JFXIsCTMCameraMode(v4);
  BOOL v15 = CGSizeCouldContainSize(v11, v10, v7, v9);
  if (v15) {
    double v16 = v9;
  }
  else {
    double v16 = v10;
  }
  if (v15) {
    double v17 = v7;
  }
  else {
    double v17 = v11;
  }
  double v18 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v18, "setFrameSize:", v7, v9);

  long long v19 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v19, "setRenderSize:", v17, v16);

  long long v20 = JFXLog_playback();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = v11 != v7;
    if (v10 != v9) {
      BOOL v21 = 1;
    }
    int v22 = v14 && v21;
    v37.CGFloat width = v7;
    v37.CGFloat height = v9;
    double v23 = NSStringFromCGSize(v37);
    if (v7 > v9) {
      uint64_t v24 = @"UIInterfaceOrientationLandscapeLeft";
    }
    else {
      uint64_t v24 = @"UIInterfaceOrientationPortrait";
    }
    v38.CGFloat width = v17;
    v38.CGFloat height = v16;
    double v25 = NSStringFromCGSize(v38);
    int v26 = 134219010;
    uint64_t v27 = v4;
    __int16 v28 = 2114;
    double v29 = v23;
    __int16 v30 = 2114;
    BOOL v31 = v24;
    __int16 v32 = 2114;
    double v33 = v25;
    __int16 v34 = 1024;
    int v35 = v22;
    _os_log_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEFAULT, "cameraModeUsedForCapture: %ld, mediaSize: %{public}@, mediaOrientation: %{public}@, renderSize: %{public}@, mediaIsCropped: %d", (uint8_t *)&v26, 0x30u);
  }
}

- (BOOL)shouldUseFaceTracking
{
  uint64_t v3 = [(CFXPreviewViewController *)self delegate];
  int v4 = [v3 mediaCapturedInFunCam];

  int v5 = ![(CFXPreviewViewController *)self capturedWithBackCamera];
  if ((v5 & 1) != 0 || !v4) {
    return v5 & v4;
  }
  return isFaceTrackingEnabledOnBackCamera();
}

- (BOOL)CFX_canApplyFaceTracking
{
  BOOL v2 = [(CFXPreviewViewController *)self shouldUseFaceTracking];
  if (v2)
  {
    LOBYTE(v2) = +[JFXEffectEditingUtilities isFaceTrackingDataAvailable];
  }
  return v2;
}

- (void)CFX_addURLToCameraRoll:(id)a3 isStill:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke;
  v12[3] = &unk_264C0B4E8;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a4;
  void v12[4] = self;
  id v10 = v8;
  id v11 = v9;
  [(CFXPreviewViewController *)self CFX_createAlbumWithCompletionHandler:v12];
}

void __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    int v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_2;
    v9[3] = &unk_264C0B4C0;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    void v9[4] = v8;
    id v10 = v3;
    objc_msgSend(v5, "CFX_addAssetAtURL:resourceType:completionHandler:", v6, v4, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_3;
    v7[3] = &unk_264C0B498;
    id v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "CFX_addAssetWithIdentifier:intoAlbum:completionHandler:", a2, v5, v7);
  }
}

uint64_t __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)CFX_createAlbumWithCompletionHandler:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v5 = [v4 stringForKey:@"saveClipAlbumPrefKey"];

  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)MEMORY[0x263F14D28];
  v39[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  id v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:0];

  id v9 = [v8 firstObject];

  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke;
    block[3] = &unk_264C0AF38;
    id v37 = v3;
    id v10 = v9;
    id v36 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v11 = v37;
  }
  else
  {
LABEL_4:
    [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:1 subtype:2 options:0];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v32;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        BOOL v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        double v16 = [v15 localizedTitle];
        char v17 = [v16 isEqual:@"FunCam"];

        if (v17) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v12) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v18 = v15;

      if (!v18) {
        goto LABEL_15;
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2;
      v28[3] = &unk_264C0AF38;
      id v30 = v3;
      id v10 = v18;
      id v29 = v10;
      dispatch_async(MEMORY[0x263EF83A0], v28);
    }
    else
    {
LABEL_12:

LABEL_15:
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__9;
      v26[4] = __Block_byref_object_dispose__9;
      id v27 = 0;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_129;
      v25[3] = &unk_264C0B510;
      v25[4] = v26;
      long long v19 = (void *)MEMORY[0x237DD15A0](v25);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2_131;
      v22[3] = &unk_264C0B560;
      uint64_t v24 = v26;
      id v23 = v3;
      long long v20 = (void *)MEMORY[0x237DD15A0](v22);
      BOOL v21 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
      [v21 performChanges:v19 completionHandler:v20];

      _Block_object_dispose(v26, 8);
      id v10 = 0;
    }
  }
}

uint64_t __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_129(uint64_t a1)
{
  id v7 = [MEMORY[0x263F14D30] creationRequestForAssetCollectionWithTitle:@"FunCam"];
  BOOL v2 = [v7 placeholderForCreatedAssetCollection];
  id v3 = [v2 localIdentifier];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2_131(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3;
  block[3] = &unk_264C0B538;
  char v12 = a2;
  id v10 = v5;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56) && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:@"saveClipAlbumPrefKey"];

    id v3 = (void *)MEMORY[0x263F14D28];
    v13[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    id v5 = [v3 fetchAssetCollectionsWithLocalIdentifiers:v4 options:0];

    id v6 = [v5 firstObject];
  }
  else
  {
    id v5 = JFXLog_core();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);
    }
    id v6 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)CFX_addAssetAtURL:(id)a3 resourceType:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__9;
  void v22[4] = __Block_byref_object_dispose__9;
  id v23 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke;
  v18[3] = &unk_264C0B588;
  long long v20 = v22;
  int64_t v21 = a4;
  id v9 = v7;
  id v19 = v9;
  uint64_t v10 = (void *)MEMORY[0x237DD15A0](v18);
  uint64_t v11 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2;
  v14[3] = &unk_264C0B5D8;
  char v17 = v22;
  id v12 = v9;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v11 performChanges:v10 completionHandler:v14];

  _Block_object_dispose(v22, 8);
}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke(void *a1)
{
  id v8 = [MEMORY[0x263F14D48] creationRequestForAsset];
  BOOL v2 = [v8 placeholderForCreatedAsset];
  id v3 = [v2 localIdentifier];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = objc_alloc_init(MEMORY[0x263F14D78]);
  [v7 setShouldMoveFile:0];
  [v8 addResourceWithType:a1[6] fileURL:a1[4] options:v7];
}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    id v8 = JFXLog_core();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_136;
  block[3] = &unk_264C0B5B0;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v14 = v9;
  uint64_t v15 = v10;
  id v13 = v5;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_136(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (void)CFX_addAssetWithIdentifier:(id)a3 intoAlbum:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CFXPreviewViewController *)self CFX_fetchAssetWithLocalIdentifier:a3];
  if (!v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke;
    block[3] = &unk_264C0A3F0;
    id v24 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_2;
  v20[3] = &unk_264C09F10;
  id v21 = v8;
  id v11 = v10;
  id v22 = v11;
  id v12 = v8;
  id v13 = (void *)MEMORY[0x237DD15A0](v20);
  id v14 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_3;
  v17[3] = &unk_264C0B628;
  id v18 = v11;
  id v19 = v9;
  id v15 = v9;
  id v16 = v11;
  [v14 performChanges:v13 completionHandler:v17];
}

uint64_t __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v2 = [MEMORY[0x263F14D30] changeRequestForAssetCollection:*(void *)(a1 + 32)];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 addAssets:v3];
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4;
  v8[3] = &unk_264C0B600;
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  if (!*(unsigned char *)(a1 + 56) || *(void *)(a1 + 40))
  {

    uint64_t v4 = JFXLog_core();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }

    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)CFX_fetchAssetWithLocalIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F14E18]);
  [v4 setWantsIncrementalChangeDetails:0];
  uint64_t v5 = (void *)MEMORY[0x263F14D18];
  v15[0] = v3;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v7 = [v5 fetchAssetsWithLocalIdentifiers:v6 options:v4];

  if (![v7 count])
  {
    uint64_t v8 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:200 options:0];
    if ([v8 count])
    {
      uint64_t v9 = [v8 firstObject];
      id v10 = objc_alloc_init(MEMORY[0x263F14E18]);

      [v10 setWantsIncrementalChangeDetails:0];
      [v10 setIncludeHiddenAssets:1];
      id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"localIdentifier = %@", v3];
      [v10 setPredicate:v11];

      uint64_t v12 = [MEMORY[0x263F14D18] fetchAssetsInAssetCollection:v9 options:v10];

      uint64_t v7 = (void *)v12;
      id v4 = v10;
    }
  }
  id v13 = [v7 firstObject];

  return v13;
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  [(CFXPreviewViewController *)self setDockIsMagnified:a3];
  [(CFXPreviewViewController *)self setDockMagnifiedHeightDelta:a4];
  [(CFXPreviewViewController *)self configureBottomControlsForOrientation];
  id v6 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v6 layoutIfNeeded];
}

- (id)bottomControlsSnapshot
{
  id v3 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(CFXPreviewViewController *)self appStripAndPreviewControlsContainer];
  id v13 = objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

  return v13;
}

- (void)hideBottomControls
{
  id v3 = [(CFXPreviewViewController *)self previewControls];
  double v4 = [v3 view];
  [v4 setHidden:1];

  id v5 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v5 setHidden:1];
}

- (void)showBottomControls
{
  id v3 = [(CFXPreviewViewController *)self previewControls];
  double v4 = [v3 view];
  [v4 setHidden:0];

  id v5 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v5 setHidden:0];
}

- (CGRect)bottomControlsBounds
{
  id v2 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGPoint)bottomControlsCenter
{
  id v2 = [(CFXPreviewViewController *)self bottomControlsDrawer];
  [v2 center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (CFXPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXPreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresentingFilterPicker
{
  return self->_presentingFilterPicker;
}

- (BOOL)capturedWithBackCamera
{
  return self->_capturedWithBackCamera;
}

- (void)setCapturedWithBackCamera:(BOOL)a3
{
  self->_capturedWithBackCamera = a3;
}

- (CFXControlsViewController)previewControls
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewControls);
  return (CFXControlsViewController *)WeakRetained;
}

- (void)setPreviewControls:(id)a3
{
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
}

- (UIView)playerContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerContainerView);
  return (UIView *)WeakRetained;
}

- (void)setPlayerContainerView:(id)a3
{
}

- (UIView)appStripAndPreviewControlsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStripAndPreviewControlsContainer);
  return (UIView *)WeakRetained;
}

- (void)setAppStripAndPreviewControlsContainer:(id)a3
{
}

- (UIButton)exportButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportButton);
  return (UIButton *)WeakRetained;
}

- (void)setExportButton:(id)a3
{
}

- (NSLayoutConstraint)previewControlsContainerHeightConstraint
{
  return self->_previewControlsContainerHeightConstraint;
}

- (void)setPreviewControlsContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)previewControlsContainerWidthConstraint
{
  return self->_previewControlsContainerWidthConstraint;
}

- (void)setPreviewControlsContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)previewControlsContainerTrailingConstraint
{
  return self->_previewControlsContainerTrailingConstraint;
}

- (void)setPreviewControlsContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)previewControlsContainerLeadingConstraint
{
  return self->_previewControlsContainerLeadingConstraint;
}

- (void)setPreviewControlsContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)previewControlsContainerTopConstraint
{
  return self->_previewControlsContainerTopConstraint;
}

- (void)setPreviewControlsContainerTopConstraint:(id)a3
{
}

- (BOOL)userInterfaceIsHidden
{
  return self->_userInterfaceHidden;
}

- (BOOL)saveMediaItemToFunCamPhotosAlbumUponExport
{
  return self->_saveMediaItemToFunCamPhotosAlbumUponExport;
}

- (void)setSaveMediaItemToFunCamPhotosAlbumUponExport:(BOOL)a3
{
  self->_saveMediaItemToFunCamPhotosAlbumUponExport = a3;
}

- (unint64_t)appliedDirectOverlayEditingGestures
{
  return self->_appliedDirectOverlayEditingGestures;
}

- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3
{
  self->_appliedDirectOverlayEditingGestures = a3;
}

- (UIView)bottomControlsDrawer
{
  return self->_bottomControlsDrawer;
}

- (void)setBottomControlsDrawer:(id)a3
{
}

- (BOOL)dockIsMagnified
{
  return self->_dockIsMagnified;
}

- (void)setDockIsMagnified:(BOOL)a3
{
  self->_dockIsMagnified = a3;
}

- (double)dockMagnifiedHeightDelta
{
  return self->_dockMagnifiedHeightDelta;
}

- (void)setDockMagnifiedHeightDelta:(double)a3
{
  self->_dockMagnifiedHeightDelta = a3;
}

- (UISlider)playbackSlider
{
  return self->_playbackSlider;
}

- (void)setPlaybackSlider:(id)a3
{
}

- (UIView)previewControlsContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewControlsContainerView);
  return (UIView *)WeakRetained;
}

- (void)setPreviewControlsContainerView:(id)a3
{
}

- (CFXPlayButtonView)playButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playButton);
  return (CFXPlayButtonView *)WeakRetained;
}

- (void)setPlayButton:(id)a3
{
}

- (CFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (CFXClipPlayerViewController)previewPlayer
{
  return self->_previewPlayer;
}

- (void)setPreviewPlayer:(id)a3
{
}

- (JFXCompositionExporter)exporter
{
  return self->_exporter;
}

- (void)setExporter:(id)a3
{
}

- (JFXEffectsPreviewGenerator)stillImagePreviewGenerator
{
  return self->_stillImagePreviewGenerator;
}

- (void)setStillImagePreviewGenerator:(id)a3
{
}

- (JFXOrientationMonitor)orientationMonitor
{
  return self->_orientationMonitor;
}

- (void)setOrientationMonitor:(id)a3
{
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_orientationMonitor, 0);
  objc_storeStrong((id *)&self->_stillImagePreviewGenerator, 0);
  objc_storeStrong((id *)&self->_exporter, 0);
  objc_storeStrong((id *)&self->_previewPlayer, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_destroyWeak((id *)&self->_playButton);
  objc_destroyWeak((id *)&self->_previewControlsContainerView);
  objc_storeStrong((id *)&self->_playbackSlider, 0);
  objc_storeStrong((id *)&self->_bottomControlsDrawer, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_exportButton);
  objc_destroyWeak((id *)&self->_appStripAndPreviewControlsContainer);
  objc_destroyWeak((id *)&self->_playerContainerView);
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_destroyWeak((id *)&self->_previewControls);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  double v4 = [(CFXPreviewViewController *)self previewPlayer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__CFXPreviewViewController_EffectEditingAdditions__effectEditorViewDidBeginEditing___block_invoke;
  v5[3] = &unk_264C09FA8;
  v5[4] = self;
  [v4 pauseWithCompletionBlock:v5];
}

uint64_t __84__CFXPreviewViewController_EffectEditingAdditions__effectEditorViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEffectAnimationsEnabledIfPossible:0];
}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXPreviewViewController *)self effectEditor];

  if (v5 == v4) {
    [(CFXPreviewViewController *)self removeEffectEditor];
  }
  [(CFXPreviewViewController *)self setEffectAnimationsEnabledIfPossible:0];
}

- (void)effectEditorView:(id)a3 didEndEditingByTappingOutSideEffectAtScreenPoint:(CGPoint)a4
{
}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(CFXPreviewViewController *)self previewClip];
  double v9 = [v8 effectsOfType:2];

  if ([v9 count])
  {
    [v7 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
    [(CFXPreviewViewController *)self normalizedMinimumHitTestArea];
    long long v20 = +[JFXEffectEditingUtilities hitTestOverlays:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlays:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v9, v23, 1, x, y, v11, v13, v15, v17, v18, v19);
    if (v20)
    {
      id v21 = +[CFXEffect effectWithJTEffect:v20];
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v30[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  double v11 = [v10 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v13 = [v10 jtEffect];
    v30[0] = v13;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v9 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(CFXPreviewViewController *)self normalizedMinimumHitTestArea];
    long long v28 = *MEMORY[0x263F010E0];
    uint64_t v29 = *(void *)(MEMORY[0x263F010E0] + 16);
    double v25 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v14, &v28, 1, x, y, v16, v18, v20, v22, v23, v24);

    BOOL v26 = v25 != 0;
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  double v11 = [v10 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v13 = [v10 jtEffect];
    [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
    objc_msgSend(v13, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", v26, 1, 1, 1, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  BOOL v6 = a5;
  id v8 = a4;
  id v9 = [v8 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v11 = [v8 jtEffect];
    [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
    [(CFXPreviewViewController *)self normalizedMinimumHitTestArea];
    objc_msgSend(v11, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", v24, 1, 1, v6, 1);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v13 = *MEMORY[0x263F001A8];
    double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v8 = objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
    id v10 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v9, 1, v12, 1, 1, 1, width, height);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v18[0] = *MEMORY[0x263F000D0];
  v18[1] = v11;
  void v18[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v10, v19, v18, x, y, width, height);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.y;
  double v11 = a5.x;
  double v13 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v13, v20, v11, v10, x, y, width, height);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v12 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
  long long v13 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v13;
  void v15[2] = *(_OWORD *)&a5->tx;
  +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, v15, v16, 1, x, y, width, height);

  double v14 = [(CFXPreviewViewController *)self previewPlayer];
  [v14 updateCompositionForEffectChange];
}

- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  double v11 = [v10 jtEffect];
  if ([v11 type] != 2)
  {
LABEL_6:

    goto LABEL_7;
  }
  BOOL v12 = [(CFXPreviewViewController *)self shouldUseFaceTracking];

  if (v12)
  {
    double v11 = [v10 jtEffect];
    long long v13 = +[JFXVideoCameraController sharedInstance];
    id v36 = [v13 mostRecentARMetadata];

    double v14 = [v11 trackingProps];
    uint64_t v35 = [v14 trackingType];

    [v9 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [v36 faceAnchor];
    double v24 = [(CFXPreviewViewController *)self previewClip];
    unsigned int v33 = [v24 playableMediaContentMode];
    double v25 = [(CFXPreviewViewController *)self previewClip];
    uint64_t v26 = [v25 mediaInterfaceOrientationForDisplay];
    uint64_t v27 = [v11 playableAspectRatio];
    uint64_t v28 = [v11 playableAspectRatioPreservationMode];
    long long v40 = *MEMORY[0x263F010E0];
    long long v34 = v40;
    uint64_t v41 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v29 = v41;
    int64_t v30 = +[JFXEffectEditingUtilities trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v40, v35, v23, 0, v33, v26, x, y, v16, v18, v20, v22, v27, v28);

    long long v31 = [(CFXPreviewViewController *)self previewClip];
    uint64_t v32 = [v31 mediaInterfaceOrientationForDisplay];
    long long v40 = v34;
    uint64_t v41 = v29;
    LODWORD(v25) = +[JFXEffectEditingUtilities makeOverlayTrackedMaintainingAppearance:v11 atTime:&v40 newTrackingType:v30 arMetadata:v36 playableInterfaceOrientation:v32];

    if (v25)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __98__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke;
      block[3] = &unk_264C09F10;
      id v38 = v9;
      id v39 = v11;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __98__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) trackingProps];
  objc_msgSend(v1, "notifyEffectTrackingDidChangeToType:", objc_msgSend(v2, "trackingType"));
}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXPreviewViewController *)self CFX_previewPlayerCurrentTime];
  id v11 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v10, v13, 0, x, y, width, height);

  return v11;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  id v5 = +[JFXEffectEditingUtilities textForEffect:v4];

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  id v5 = objc_msgSend(a4, "jtEffect", a3);
  +[JFXEffectEditingUtilities beginTextEditingForEffect:v5];

  id v6 = [(CFXPreviewViewController *)self previewPlayer];
  [v6 updateCompositionForEffectChange];
}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v7 = a5;
  id v8 = [a4 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v8 newText:v7];

  id v9 = [(CFXPreviewViewController *)self previewPlayer];
  [v9 updateCompositionForEffectChange];
}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  id v6 = a4;
  id v7 = [v6 jtEffect];
  +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:v7];

  id v8 = [v6 jtEffect];

  +[JFXEffectEditingUtilities endTextEditingForEffect:v8];
  id v9 = [(CFXPreviewViewController *)self previewPlayer];
  [v9 updateCompositionForEffectChange];
}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  BOOL v5 = +[JFXEffectEditingUtilities canEditTextForEffect:v4];

  return v5;
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  unint64_t v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:v4];

  return v5;
}

- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXPreviewViewController *)self presentFullScreenTextEditorForEffect:v5 insertingEffect:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  return 1;
}

uint64_t __96__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeEffectEditor];
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(CFXPreviewViewController *)self previewClip];
  id v7 = [v5 jtEffect];

  [v6 removeEffect:v7];
  id v8 = [(CFXPreviewViewController *)self previewPlayer];
  [v8 updateCompositionForEffectChange];

  id v9 = CFXLog_action();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CFXPreviewViewController *)self previewClip];
    id v11 = [v10 effectStack];
    BOOL v12 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect removed" atLocation:@"post-capture" withEffectStack:v11];
    int v13 = 138543362;
    double v14 = v12;
    _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v13, 0xCu);
  }
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  int v5 = [v4 type];

  if (v5 != 2) {
    return 0;
  }
  return +[JFXEffectEditingUtilities isFaceTrackingDataAvailable];
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  id v4 = a4;
  int v5 = [v4 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 jtEffect];
    char v8 = [v7 isCurrentlyTracking];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CFX_previewPlayerCurrentTime
{
  id v8 = [(CFXPreviewViewController *)self previewPlayer];
  int64_t v5 = (int)[v8 currentTime];
  id v6 = [(CFXPreviewViewController *)self previewPlayer];
  CMTimeMake((CMTime *)retstr, v5, [v6 frameRate]);

  return result;
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v7 = [a4 jtEffect];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setHidden:1];
    id v8 = [(CFXPreviewViewController *)self previewPlayer];
    [v8 updateCompositionForEffectChange];

    [(CFXPreviewViewController *)self dispatchWhenPlayerReadyForDisplayEffectUpdate:v9];
  }
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4
{
  objc_msgSend(a4, "jtEffect", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setHidden:1];
    int64_t v5 = [(CFXPreviewViewController *)self previewPlayer];
    [v5 updateCompositionForEffectChange];
  }
}

- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5
{
  id v7 = a5;
  id v8 = [a4 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v8 newText:v7];

  id v9 = [(CFXPreviewViewController *)self previewPlayer];
  [v9 updateCompositionForEffectChange];
}

- (void)dispatchWhenPlayerReadyForDisplayEffectUpdate:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CFXPreviewViewController *)self previewPlayer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke;
  v7[3] = &unk_264C0A3C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchBlockWhenDone:v7];
}

void __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewPlayer];
  [v2 updateCompositionForEffectChange];

  double v3 = [*(id *)(a1 + 32) previewPlayer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_2;
  v5[3] = &unk_264C0A3C8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 dispatchBlockWhenDone:v5];
}

void __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewPlayer];
  [v2 updateCompositionForEffectChange];

  double v3 = [*(id *)(a1 + 32) previewPlayer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_3;
  v4[3] = &unk_264C0A3F0;
  id v5 = *(id *)(a1 + 40);
  [v3 dispatchBlockWhenDone:v4];
}

uint64_t __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v7 = [a4 jtEffect];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setHidden:0];
    id v8 = [(CFXPreviewViewController *)self previewPlayer];
    [v8 updateCompositionForEffectChange];

    [(CFXPreviewViewController *)self dispatchWhenPlayerReadyForDisplayEffectUpdate:v9];
  }
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5
{
  id v11 = a5;
  id v7 = [a4 jtEffect];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    +[JFXEffectEditingUtilities updateEffectText:v8 newText:v11];
    [v8 setHidden:0];

    id v9 = [(CFXPreviewViewController *)self previewPlayer];
    [v9 updateCompositionForEffectChange];

    id v10 = [(CFXPreviewViewController *)self delegate];
    [v10 previewViewControllerDidStopEditingText:self];
  }
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(CFXPreviewViewController *)self previewClip];
  id v7 = [v5 jtEffect];

  [v6 removeEffect:v7];
  id v8 = [(CFXPreviewViewController *)self previewPlayer];
  [v8 updateCompositionForEffectChange];

  id v9 = [(CFXPreviewViewController *)self delegate];
  [v9 previewViewControllerDidStopEditingText:self];

  id v10 = CFXLog_action();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(CFXPreviewViewController *)self previewClip];
    BOOL v12 = [v11 effectStack];
    int v13 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect removed" atLocation:@"post-capture" withEffectStack:v12];
    int v14 = 138543362;
    uint64_t v15 = v13;
    _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3
{
  double v3 = [(CFXPreviewViewController *)self previewClip];
  int64_t v4 = [v3 mediaInterfaceOrientationForDisplay];

  return v4;
}

- (void)CFX_addEffect:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Cannot display text editor on insert because its already open", v2, v3, v4, v5, v6);
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "could not generate export file name", v1, 2u);
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_234C41000, v0, v1, "could not write to file %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture begin - apply pan", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct pan gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct pan gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture begin", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture changed - apply pan", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pan gesture finished - apply pan", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture begin - apply pinch", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct pinch gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct pinch gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture begin", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture changed - apply pinch", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct pinch gesture finished - apply pinch", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotate gesture begin - apply rotate", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotated gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct rotated gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "playback direct rotated gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotate gesture begin", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotate gesture changed - apply pinch", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotate gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "playback direct rotate gesture finished - apply rotate", v2, v3, v4, v5, v6);
}

- (void)displayEffectEditorForEffect:forMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Request to display text editor for edit ignored because already open", v2, v3, v4, v5, v6);
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "ERROR: failed to move asset (%@) to the album (%@)", (uint8_t *)&v4, 0x16u);
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end