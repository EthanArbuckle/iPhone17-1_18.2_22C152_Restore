@interface MessagesViewController
- (AVTPaddleView)paddleView;
- (BOOL)canPeelSticker;
- (BOOL)canTakeSendingAction;
- (BOOL)displaysLaunchScreen;
- (BOOL)isExpanded;
- (BOOL)isInternalBuild;
- (BOOL)isLandcapeTrapOverlayShown;
- (BOOL)isLandscapeMode;
- (BOOL)isSpeculatingLayout;
- (BOOL)presentsLaunchScreenInFullScreenModal;
- (BOOL)requestsExpandedOnLaunchScreenDismissal;
- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4;
- (BOOL)shouldPresentPaddleView;
- (BOOL)shouldShowDisclosureAlertForSendingMessage;
- (BOOL)shouldShowLaunchScreen;
- (BOOL)shouldZoomWhileRecording;
- (BOOL)waitingOnPresentationStyleRequestFulfillment;
- (CGSize)defaultVideoExportDimensions;
- (MessagesViewController)initWithCoder:(id)a3;
- (UIEdgeInsets)accessoryButtonContentInsets;
- (UIEdgeInsets)contentInsetForPuppetCollectionViewController:(id)a3;
- (double)carouselHeight;
- (double)edgeMargin;
- (double)horizontalCellSpacingForPuppetCollectionViewController:(id)a3;
- (double)verticalCellSpacingForPuppetCollectionViewController:(id)a3;
- (double)widthScaleFactor;
- (id)defaultExportVideoOptionsForSize:(CGSize)a3;
- (id)faceTrackingRecordingURL;
- (id)puppetSnapshotWithContentMode:(int64_t)a3;
- (id)retargetableSpringBehavior;
- (id)setRestorableValue:(id)a3 forKeyPath:(id)a4 onViews:(id)a5;
- (id)stickerImageUsingLargeSticker:(BOOL)a3;
- (id)stickerUsingLargeSticker:(BOOL)a3;
- (id)trackingLostReason;
- (int)widthExtent;
- (int64_t)puppetsPerRow;
- (unint64_t)actualPresentationStyle;
- (unint64_t)presentationStyle;
- (void)_launchTapToRadarWithAttachments:(id)a3;
- (void)addInternalARSessionObserverIfNecessary;
- (void)addPuppetCollectionViewControllerInNecessary;
- (void)afterExportMovie;
- (void)beforeExportMovie;
- (void)beginObservingFaceTrackingIfNecessary;
- (void)captureSnapshotMetricsIfNeeded;
- (void)carouselController:(id)a3 didFocusOnRecordView:(id)a4;
- (void)carouselController:(id)a3 didMoveTowardRecord:(id)a4 withFactor:(double)a5;
- (void)carouselController:(id)a3 didUpdateWithRecord:(id)a4;
- (void)carouselController:(id)a3 willEndFocusOnRecordView:(id)a4;
- (void)changeUserInfoLabelForTrackingState;
- (void)checkLightingAndObscuredSensorAfterTrackingLost;
- (void)checkLightingAndObscuredSensorWhileTracking;
- (void)cleanUpOnExit;
- (void)conditionallyPerformWithDisclosureAlertForSendingMessageWithConfirmTitle:(id)a3 result:(id)a4;
- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5;
- (void)dealloc;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)disableIdleTimer;
- (void)discardRecording;
- (void)dismissAvatarUIControllerAnimated:(BOOL)a3;
- (void)dismissLaunchScreenIfNecessaryForPresentationStyle:(unint64_t)a3 controller:(id)a4;
- (void)dismissPaddleViewIfNecessary;
- (void)endObservingFaceTrackingIfNecessary;
- (void)exportVideoWithCompletion:(id)a3;
- (void)fadeIn:(id)a3;
- (void)fadeOut:(id)a3;
- (void)handleInterruptionEnded;
- (void)handleRecordingButtonTouchUp:(id)a3;
- (void)handleResumeTrackingTap:(id)a3;
- (void)handleSceneLongPress:(id)a3;
- (void)handleSceneShortPress:(id)a3;
- (void)hideUserInfoLabel;
- (void)hideUserInfoLabelWithDuration:(double)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)interfaceObscuredByOverlayOrPresentationChanged:(BOOL)a3;
- (void)launchTapToRadar;
- (void)launchViewControllerDidCancel:(id)a3;
- (void)launchViewControllerDidConfirm:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onCancelSendingMessage:(id)a3;
- (void)onConfirmSendingMessage:(id)a3;
- (void)onEditAvatar:(id)a3;
- (void)onReplayMessage:(id)a3;
- (void)onTapToRadarButtonPressed:(id)a3;
- (void)overlayPresentationNotification:(id)a3;
- (void)overrideUserInfoLabelStateWithText:(id)a3 alpha:(double)a4;
- (void)paddleViewTapped:(id)a3;
- (void)pauseFaceTrackingWithReason:(id)a3;
- (void)performWhileOverridingPresentationStyle:(unint64_t)a3 block:(id)a4;
- (void)performWithFadeAnimation:(id)a3 enabled:(BOOL)a4;
- (void)playPreviewOnce;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)preparePuppetViewForReuse;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
- (void)presentPaddleView;
- (void)puppetCollectionViewController:(id)a3 didSelectPuppetRecord:(id)a4;
- (void)puppetCollectionViewControllerDidRequestMemojiLaunch:(id)a3;
- (void)recordView:(id)a3 previewDidChangeStatus:(int64_t)a4;
- (void)recordView:(id)a3 session:(id)a4 didFailWithError:(id)a5;
- (void)recordView:(id)a3 sessionInterruptionEnded:(id)a4;
- (void)recordView:(id)a3 sessionWasInterrupted:(id)a4;
- (void)recordingButton:(id)a3 didEndLongPress:(BOOL)a4;
- (void)recordingButtonDidStartLongPress:(id)a3;
- (void)recordingDidFinish:(BOOL)a3;
- (void)recordingWillStart;
- (void)removeInternalARSessionObserverIfNecessary;
- (void)removePuppetCollectionViewControllerIfNecessary;
- (void)requestPresentationStyle:(unint64_t)a3;
- (void)restoreIdleTimer;
- (void)resumeFaceTrackingIfNecessary;
- (void)sendVideoMessage;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplaysLaunchScreen:(BOOL)a3;
- (void)setPaddleView:(id)a3;
- (void)setSingleAvatarMode:(BOOL)a3 animated:(BOOL)a4;
- (void)setWaitingOnPresentationStyleRequestFulfillment:(BOOL)a3;
- (void)showAlertForDisclosureWarningWithConfirmTitle:(id)a3 completionBlock:(id)a4;
- (void)showFileRadarWarningPopup;
- (void)showUserInfoLabelWithText:(id)a3;
- (void)significantRecordChangeInDataSource:(id)a3;
- (void)snapshottingEnabledChangedNotification:(id)a3;
- (void)startObservingBaseMessagesNotifications;
- (void)startTrackingLostTimer;
- (void)startTrackingStartTimerWithCounter:(unint64_t)a3;
- (void)stopObservingBaseMessagesNotifications;
- (void)stopOverridingUserInfoLabelState:(BOOL)a3;
- (void)stopPreviewing;
- (void)stopRecordingAndPlayPreview:(BOOL)a3;
- (void)strongPopupPresentationNotification:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)upateReplayButtonImageForContentSize;
- (void)updateARSessionStateResettingState:(BOOL)a3;
- (void)updateButtonsImages;
- (void)updateConstraintConstants;
- (void)updateEditButtonVisibilityForceHide:(BOOL)a3;
- (void)updateForNewPuppetView;
- (void)updateLayoutForPresentationStyle;
- (void)updatePaddleViewLayoutIfNecessary;
- (void)updatePuppetCollectionViewIfNecessary;
- (void)updatePuppetCollectionViewWithCurrentFocusedRecordIfNecessary;
- (void)updateRecording;
- (void)updateRecordingTime;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)updateTapToRadarVisibilityForceHide:(BOOL)a3;
- (void)updateUIState:(unint64_t)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation MessagesViewController

- (MessagesViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[AVAudioSession sharedInstance];
  [v5 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:0 error:0];
  id v11 = 0;
  [v5 setActive:1 error:&v11];
  id v6 = v11;
  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)MessagesViewController;
  v8 = [(MessagesViewController *)&v10 initWithCoder:v4];

  return v8;
}

- (void)viewDidLoad
{
  v250.receiver = self;
  v250.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v250 viewDidLoad];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] viewDidLoad", buf, 2u);
  }
  if (!self->_hasLoadedBefore)
  {
    kdebug_trace();
    self->_hasLoadedBefore = 1;
    v3 = +[AVTUIColorRepository appBackgroundColor];
    id v4 = [(MessagesViewController *)self view];
    [v4 setBackgroundColor:v3];

    v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [v5 objectForKey:@"LastPuppetIdentifier"];

    v224 = v6;
    v7 = +[NSUserDefaults standardUserDefaults];
    LODWORD(v6) = [v7 BOOLForKey:@"kJFDefaults_AlwaysStartWithTiger"];

    v8 = v224;
    if (v6)
    {

      v8 = @"tiger";
    }
    v9 = +[AVTAvatarRecordDataSource defaultUIDataSourceWithDomainIdentifier:AVTAvatarStoreDomainMessages];
    avatarDataSource = self->_avatarDataSource;
    self->_avatarDataSource = v9;

    [(AVTAvatarRecordDataSource *)self->_avatarDataSource addObserver:self];
    id v11 = +[AVTUsageTracker currentSession];
    usageTrackingSession = self->_usageTrackingSession;
    self->_usageTrackingSession = v11;

    v13 = self->_usageTrackingSession;
    v14 = [(AVTAvatarRecordDataSource *)self->_avatarDataSource recordStore];
    [(AVTUsageTrackingSession *)v13 beginWithStore:v14];

    v15 = (AVTAvatarRecordImageProvider *)objc_alloc_init((Class)AVTAvatarRecordImageProvider);
    imageProvider = self->_imageProvider;
    self->_imageProvider = v15;

    self->_ignoreViewWillDisappearCount = 0;
    self->_waitingOnPresentationStyleRequestFulfillment = 0;
    self->_lastPreviewStatus = 1;
    self->_isUpdatingAvatarMode = 0;
    self->_didStopPreviewBecauseOfOverladouble y = 0;
    self->_arSessionState = 5;
    self->_isTransitioningBetweenLayouts = 0;
    self->_hasAppeared = 0;
    self->_observingFacetracking = 0;
    self->_exportingMovie = 0;
    self->_usePresentationStyleOverride = 0;
    self->_userInfoIsBeingOverridden = 0;
    self->_capturedSnapshotMetrics = 0;
    v17 = +[AVTCarouselController recordingCarouselForRecordDataSource:self->_avatarDataSource];
    avatarListController = self->_avatarListController;
    self->_avatarListController = v17;

    if ([(MessagesViewController *)self shouldShowLaunchScreen]) {
      [(AVTRecordingCarouselController *)self->_avatarListController setIsPostponingBeginSession:1];
    }
    [(AVTRecordingCarouselController *)self->_avatarListController setRecordingDelegate:self];
    [(AVTRecordingCarouselController *)self->_avatarListController setPresenterDelegate:self];
    v19 = (UIView *)objc_alloc_init((Class)UIView);
    carouselView = self->_carouselView;
    self->_carouselView = v19;

    [(UIView *)self->_carouselView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_carouselView setClipsToBounds:1];
    v21 = [(MessagesViewController *)self view];
    v22 = self->_carouselView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    [v21 insertSubview:v22 belowSubview:WeakRetained];

    *(void *)buf = 0;
    v245 = buf;
    uint64_t v246 = 0x3032000000;
    v247 = sub_10000ADF8;
    v248 = sub_10000AE08;
    id v249 = 0;
    v241[0] = _NSConcreteStackBlock;
    v241[1] = 3221225472;
    v241[2] = sub_10000AE10;
    v241[3] = &unk_1000348F8;
    v243 = buf;
    v241[4] = self;
    v188 = v8;
    v242 = v188;
    +[UIView performWithoutAnimation:v241];
    id v24 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v25 = objc_alloc((Class)AVTCircularButton);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id obj = [v25 initWithFrame:CGRectZero.origin.x, y, width, height];
    v29 = +[UIColor systemRedColor];
    [obj setTintColor:v29];

    [obj setTranslatesAutoresizingMaskIntoConstraints:0];
    [obj addTarget:self action:"onCancelSendingMessage:" forControlEvents:64];
    v30 = [(MessagesViewController *)self view];
    [v30 addSubview:obj];

    p_cancelSendingMessageButton = &self->_cancelSendingMessageButton;
    objc_storeStrong((id *)&self->_cancelSendingMessageButton, obj);
    id v233 = [objc_alloc((Class)AVTCircularButton) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v233 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v233 addTarget:self action:"onEditAvatar:" forControlEvents:64];
    v31 = [(MessagesViewController *)self view];
    [v31 addSubview:v233];

    p_editButton = &self->_editButton;
    objc_storeStrong((id *)&self->_editButton, v233);
    [(MessagesViewController *)self updateButtonsImages];
    id v236 = +[UIButton buttonWithType:1];
    [v236 setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = +[NSBundle mainBundle];
    v33 = [v32 localizedStringForKey:@"sJFReplay" value:&stru_100035088 table:@"JFStrings"];
    [v236 setTitle:v33 forState:0];

    [v236 addTarget:self action:"onReplayMessage:" forControlEvents:64];
    v34 = [(MessagesViewController *)self view];
    v35 = [v34 tintColor];
    [v236 setTintColor:v35];

    v36 = [(MessagesViewController *)self view];
    [v36 insertSubview:v236 aboveSubview:*((void *)v245 + 5)];

    objc_storeStrong((id *)&self->_replayMessageButton, v236);
    [(MessagesViewController *)self upateReplayButtonImageForContentSize];
    id v37 = [objc_alloc((Class)AVTUserInfoView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v37 setAlpha:0.0];
    v38 = [(MessagesViewController *)self view];
    [v38 addSubview:v37];
    id v198 = v37;

    objc_storeStrong((id *)&self->_userInfoView, v37);
    v39 = -[RecordingTimeDisplayView initWithFrame:]([RecordingTimeDisplayView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(RecordingTimeDisplayView *)v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RecordingTimeDisplayView *)v39 setAlpha:0.0];
    v40 = [(MessagesViewController *)self view];
    [v40 insertSubview:v39 aboveSubview:*((void *)v245 + 5)];
    v197 = v39;

    objc_storeStrong((id *)&self->_recordingTimeDisplayView, v39);
    id v227 = objc_alloc_init((Class)UIView);
    [v227 setTranslatesAutoresizingMaskIntoConstraints:0];
    v41 = +[UIColor clearColor];
    [v227 setBackgroundColor:v41];

    v42 = [(MessagesViewController *)self view];
    [v42 insertSubview:v227 aboveSubview:*((void *)v245 + 5)];

    p_recordingButtonSuperview = &self->_recordingButtonSuperview;
    objc_storeStrong((id *)&self->_recordingButtonSuperview, v227);
    id v234 = objc_alloc_init((Class)AVTRecordingButton);
    [v234 setLongPressDelegate:self];
    [v234 addTarget:self action:"handleRecordingButtonTouchUp:" forControlEvents:64];
    v43 = +[NSUserDefaults standardUserDefaults];
    [v234 setEnabled:[v43 BOOLForKey:@"JFDefaults_NeverDisableRecordButton"]];

    [(UIView *)self->_recordingButtonSuperview addSubview:v234];
    objc_storeStrong((id *)&self->_recordingButton, v234);
    id v232 = +[UIButton buttonWithType:0];
    [v232 setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = +[UIImage imageNamed:@"tap-to-radar-96"];
    [v232 setImage:v44 forState:0];

    [v232 addTarget:self action:"onTapToRadarButtonPressed:" forControlEvents:64];
    v45 = [(MessagesViewController *)self view];
    [v45 insertSubview:v232 aboveSubview:*((void *)v245 + 5)];

    p_tapToRadar = &self->_tapToRadar;
    objc_storeStrong((id *)&self->_tapToRadar, v232);
    v46 = +[NSFileManager defaultManager];
    v189 = [v46 URLsForDirectory:13 inDomains:0xFFFFLL];

    v47 = [v189 objectAtIndexedSubscript:0];
    stickerFolder = self->_stickerFolder;
    self->_stickerFolder = v47;

    v49 = +[NSFileManager defaultManager];
    [v49 createDirectoryAtURL:self->_stickerFolder withIntermediateDirectories:1 attributes:0 error:0];

    v50 = +[NSFileManager defaultManager];
    v51 = [v50 temporaryDirectory];
    videoLoggingFolder = self->_videoLoggingFolder;
    self->_videoLoggingFolder = v51;

    v53 = [(UIView *)self->_carouselView heightAnchor];
    v54 = [v53 constraintEqualToConstant:0.0];
    carouselHeightConstraint = self->_carouselHeightConstraint;
    self->_carouselHeightConstraint = v54;

    v260[0] = self->_carouselHeightConstraint;
    v212 = [(UIView *)self->_carouselView widthAnchor];
    v220 = [(MessagesViewController *)self view];
    v216 = [v220 safeAreaLayoutGuide];
    v208 = [v216 widthAnchor];
    v205 = [v212 constraintEqualToAnchor:v208];
    v260[1] = v205;
    v199 = [(UIView *)self->_carouselView centerXAnchor];
    v202 = [(MessagesViewController *)self view];
    v56 = [v202 safeAreaLayoutGuide];
    v57 = [v56 centerXAnchor];
    v58 = [v199 constraintEqualToAnchor:v57];
    v260[2] = v58;
    v59 = [(UIView *)self->_carouselView topAnchor];
    v60 = [(MessagesViewController *)self view];
    v61 = [v60 safeAreaLayoutGuide];
    v62 = [v61 topAnchor];
    v63 = [v59 constraintEqualToAnchor:v62];
    v260[3] = v63;
    v64 = +[NSArray arrayWithObjects:v260 count:4];
    +[NSLayoutConstraint activateConstraints:v64];

    v221 = [*((id *)v245 + 5) widthAnchor];
    v217 = [(UIView *)self->_carouselView widthAnchor];
    v213 = [v221 constraintEqualToAnchor:v217 constant:0.0];
    v259[0] = v213;
    v209 = [*((id *)v245 + 5) heightAnchor];
    v65 = [(UIView *)self->_carouselView heightAnchor];
    v66 = [v209 constraintEqualToAnchor:v65 constant:0.0];
    v259[1] = v66;
    v67 = [*((id *)v245 + 5) centerXAnchor];
    v68 = [(UIView *)self->_carouselView centerXAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    v259[2] = v69;
    v70 = [*((id *)v245 + 5) centerYAnchor];
    v71 = [(UIView *)self->_carouselView centerYAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    v259[3] = v72;
    v73 = +[NSArray arrayWithObjects:v259 count:4];
    +[NSLayoutConstraint activateConstraints:v73];

    id v222 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    v218 = [v222 topAnchor];
    v214 = [*((id *)v245 + 5) bottomAnchor];
    v210 = [v218 constraintEqualToAnchor:v214 constant:0.0];
    v258[0] = v210;
    id v206 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    v195 = [v206 widthAnchor];
    v203 = [(MessagesViewController *)self view];
    v200 = [v203 safeAreaLayoutGuide];
    v194 = [v200 widthAnchor];
    v193 = [v195 constraintEqualToAnchor:v194];
    v258[1] = v193;
    id v192 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    v190 = [v192 bottomAnchor];
    v191 = [(MessagesViewController *)self view];
    v74 = [v191 bottomAnchor];
    v75 = [v190 constraintEqualToAnchor:v74];
    v258[2] = v75;
    id v76 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    v77 = [v76 centerXAnchor];
    v78 = [(MessagesViewController *)self view];
    v79 = [v78 safeAreaLayoutGuide];
    v80 = [v79 centerXAnchor];
    v81 = [v77 constraintEqualToAnchor:v80];
    v258[3] = v81;
    v82 = +[NSArray arrayWithObjects:v258 count:4];
    +[NSLayoutConstraint activateConstraints:v82];

    v83 = [(AVTUserInfoView *)self->_userInfoView widthAnchor];
    v84 = [(MessagesViewController *)self view];
    v85 = [v84 safeAreaLayoutGuide];
    v86 = [v85 widthAnchor];
    v87 = [v83 constraintLessThanOrEqualToAnchor:v86 constant:0.0];
    userInfoMaximumWidthConstraint = self->_userInfoMaximumWidthConstraint;
    self->_userInfoMaximumWidthConstraint = v87;

    v219 = [(AVTUserInfoView *)self->_userInfoView centerXAnchor];
    location = [(MessagesViewController *)self view];
    v223 = [location safeAreaLayoutGuide];
    v215 = [v223 centerXAnchor];
    v211 = [v219 constraintEqualToAnchor:v215];
    v257[0] = v211;
    v207 = [(AVTUserInfoView *)self->_userInfoView centerYAnchor];
    v204 = [(UIView *)self->_recordingButtonSuperview centerYAnchor];
    v201 = [v207 constraintEqualToAnchor:v204];
    v89 = self->_userInfoMaximumWidthConstraint;
    v257[1] = v201;
    v257[2] = v89;
    v196 = [(AVTUserInfoView *)self->_userInfoView leadingAnchor];
    v90 = [(AVTCircularButton *)self->_editButton trailingAnchor];
    v91 = [v196 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v90 multiplier:1.0];
    v257[3] = v91;
    v92 = [(AVTUserInfoView *)self->_userInfoView leadingAnchor];
    v93 = [(AVTCircularButton *)self->_cancelSendingMessageButton trailingAnchor];
    v94 = [v92 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v93 multiplier:1.0];
    v257[4] = v94;
    v95 = [(AVTUserInfoView *)self->_userInfoView trailingAnchor];
    v96 = [(UIView *)self->_recordingButtonSuperview leadingAnchor];
    v97 = [v95 constraintLessThanOrEqualToSystemSpacingAfterAnchor:v96 multiplier:1.0];
    v257[5] = v97;
    v98 = +[NSArray arrayWithObjects:v257 count:6];
    +[NSLayoutConstraint activateConstraints:v98];

    locationa = [(UIButton *)self->_replayMessageButton leadingAnchor];
    v231 = [(MessagesViewController *)self view];
    v99 = [v231 safeAreaLayoutGuide];
    v100 = [v99 leadingAnchor];
    v101 = [locationa constraintEqualToAnchor:v100];
    v256[0] = v101;
    v102 = [(UIButton *)self->_replayMessageButton topAnchor];
    v103 = [(MessagesViewController *)self view];
    v104 = [v103 safeAreaLayoutGuide];
    v105 = [v104 topAnchor];
    v106 = [v102 constraintEqualToAnchor:v105];
    v256[1] = v106;
    v107 = +[NSArray arrayWithObjects:v256 count:2];
    +[NSLayoutConstraint activateConstraints:v107];

    v108 = [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView leadingAnchor];
    v109 = [(MessagesViewController *)self view];
    v110 = [v109 safeAreaLayoutGuide];
    v111 = [v110 leadingAnchor];
    v112 = [v108 constraintEqualToAnchor:v111 constant:0.0];
    recordingDisplayLeadingOffsetConstraint = self->_recordingDisplayLeadingOffsetConstraint;
    self->_recordingDisplayLeadingOffsetConstraint = v112;

    v255[0] = self->_recordingDisplayLeadingOffsetConstraint;
    v114 = [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView centerYAnchor];
    v115 = [(UIButton *)self->_replayMessageButton centerYAnchor];
    v116 = [v114 constraintEqualToAnchor:v115];
    v255[1] = v116;
    v117 = +[NSArray arrayWithObjects:v255 count:2];
    +[NSLayoutConstraint activateConstraints:v117];

    v118 = [(UIView *)self->_recordingButtonSuperview bottomAnchor];
    v119 = [(UIView *)self->_carouselView bottomAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    recordButtonBottomConstraint = self->_recordButtonBottomConstraint;
    self->_recordButtonBottomConstraint = v120;

    v122 = +[UIDevice currentDevice];
    if ([v122 userInterfaceIdiom] == (id)1)
    {
    }
    else
    {
      v123 = +[UIDevice currentDevice];
      BOOL v124 = [v123 userInterfaceIdiom] == (id)5;

      if (!v124)
      {
        v125 = [(UIView *)*p_recordingButtonSuperview trailingAnchor];
        v126 = [(MessagesViewController *)self view];
        v128 = [v126 safeAreaLayoutGuide];
        v129 = [v128 trailingAnchor];
        v130 = [v125 constraintEqualToAnchor:v129 constant:0.0];
        recordButtonHorizontalConstraint = self->_recordButtonHorizontalConstraint;
        self->_recordButtonHorizontalConstraint = v130;

        goto LABEL_15;
      }
    }
    v125 = [(UIView *)*p_recordingButtonSuperview trailingAnchor];
    v126 = [(UIView *)self->_carouselView trailingAnchor];
    v127 = [v125 constraintEqualToAnchor:v126 constant:0.0];
    v128 = self->_recordButtonHorizontalConstraint;
    self->_recordButtonHorizontalConstraint = v127;
LABEL_15:

    v132 = [(UIView *)*p_recordingButtonSuperview widthAnchor];
    v133 = [v132 constraintEqualToConstant:0.0];
    recordButtonWidthConstraint = self->_recordButtonWidthConstraint;
    self->_recordButtonWidthConstraint = v133;

    v135 = [(UIView *)*p_recordingButtonSuperview heightAnchor];
    v136 = [v135 constraintEqualToConstant:0.0];
    recordButtonHeightConstraint = self->_recordButtonHeightConstraint;
    self->_recordButtonHeightConstraint = v136;

    v138 = self->_recordButtonHorizontalConstraint;
    v254[0] = self->_recordButtonBottomConstraint;
    v254[1] = v138;
    v139 = self->_recordButtonHeightConstraint;
    v254[2] = self->_recordButtonWidthConstraint;
    v254[3] = v139;
    v140 = +[NSArray arrayWithObjects:v254 count:4];
    +[NSLayoutConstraint activateConstraints:v140];

    v141 = [(AVTCircularButton *)*p_editButton widthAnchor];
    v142 = [v141 constraintEqualToConstant:0.0];
    editButtonWidthConstraint = self->_editButtonWidthConstraint;
    self->_editButtonWidthConstraint = v142;

    v144 = [(AVTCircularButton *)*p_editButton heightAnchor];
    v145 = [v144 constraintEqualToConstant:0.0];
    editButtonHeightConstraint = self->_editButtonHeightConstraint;
    self->_editButtonHeightConstraint = v145;

    v147 = [(AVTCircularButton *)*p_editButton leadingAnchor];
    v148 = [(MessagesViewController *)self view];
    v149 = [v148 leadingAnchor];
    v150 = [v147 constraintEqualToAnchor:v149 constant:0.0];
    editButtonLeadingOffsetConstraint = self->_editButtonLeadingOffsetConstraint;
    self->_editButtonLeadingOffsetConstraint = v150;

    v152 = self->_editButtonHeightConstraint;
    v253[0] = self->_editButtonWidthConstraint;
    v253[1] = v152;
    v253[2] = self->_editButtonLeadingOffsetConstraint;
    v153 = [(AVTCircularButton *)*p_editButton centerYAnchor];
    v154 = [(UIView *)*p_recordingButtonSuperview centerYAnchor];
    v155 = [v153 constraintEqualToAnchor:v154];
    v253[3] = v155;
    v156 = +[NSArray arrayWithObjects:v253 count:4];
    +[NSLayoutConstraint activateConstraints:v156];

    v157 = [(AVTCircularButton *)*p_cancelSendingMessageButton widthAnchor];
    v158 = [v157 constraintEqualToConstant:0.0];
    cancelSendingButtonWidthConstraint = self->_cancelSendingButtonWidthConstraint;
    self->_cancelSendingButtonWidthConstraint = v158;

    v160 = [(AVTCircularButton *)*p_cancelSendingMessageButton heightAnchor];
    v161 = [v160 constraintEqualToConstant:0.0];
    cancelSendingButtonHeightConstraint = self->_cancelSendingButtonHeightConstraint;
    self->_cancelSendingButtonHeightConstraint = v161;

    v163 = self->_cancelSendingButtonHeightConstraint;
    v252[0] = self->_cancelSendingButtonWidthConstraint;
    v252[1] = v163;
    v164 = [(AVTCircularButton *)*p_cancelSendingMessageButton leadingAnchor];
    v165 = [(AVTCircularButton *)*p_editButton leadingAnchor];
    v166 = [v164 constraintEqualToAnchor:v165];
    v252[2] = v166;
    v167 = [(AVTCircularButton *)*p_cancelSendingMessageButton topAnchor];
    v168 = [v233 topAnchor];
    v169 = [v167 constraintEqualToAnchor:v168];
    v252[3] = v169;
    v170 = +[NSArray arrayWithObjects:v252 count:4];
    +[NSLayoutConstraint activateConstraints:v170];

    v171 = [(UIButton *)*p_tapToRadar leadingAnchor];
    v172 = [(MessagesViewController *)self view];
    v173 = [v172 leadingAnchor];
    v174 = [v171 constraintEqualToAnchor:v173 constant:0.0];
    tapToRadarLeadingOffsetConstraint = self->_tapToRadarLeadingOffsetConstraint;
    self->_tapToRadarLeadingOffsetConstraint = v174;

    v251[0] = self->_tapToRadarLeadingOffsetConstraint;
    v176 = [(UIButton *)*p_tapToRadar topAnchor];
    v177 = [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView bottomAnchor];
    v178 = [v176 constraintEqualToAnchor:v177 constant:20.0];
    v251[1] = v178;
    v179 = [(UIButton *)*p_tapToRadar widthAnchor];
    v180 = [v179 constraintEqualToConstant:32.0];
    v251[2] = v180;
    v181 = [(UIButton *)*p_tapToRadar heightAnchor];
    v182 = [v181 constraintEqualToConstant:32.0];
    v251[3] = v182;
    v183 = +[NSArray arrayWithObjects:v251 count:4];
    +[NSLayoutConstraint activateConstraints:v183];

    objc_initWeak(&from, self);
    v238[0] = _NSConcreteStackBlock;
    v238[1] = 3221225472;
    v238[2] = sub_10000AF1C;
    v238[3] = &unk_1000347E0;
    objc_copyWeak(&v239, &from);
    v184 = objc_retainBlock(v238);
    id pendingLayoutUpdate = self->_pendingLayoutUpdate;
    self->_id pendingLayoutUpdate = v184;

    [(MessagesViewController *)self updateConstraintConstants];
    v186 = [(MessagesViewController *)self view];
    [v186 setNeedsLayout];

    [(MessagesViewController *)self updateUIState:0 animated:0];
    v187 = +[NSNotificationCenter defaultCenter];
    [v187 addObserver:self selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    kdebug_trace();
    objc_destroyWeak(&v239);
    objc_destroyWeak(&from);

    _Block_object_dispose(buf, 8);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] viewDidLoad already called, returning early", buf, 2u);
  }
}

- (double)edgeMargin
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];
  if (v5 != (id)1)
  {
    v2 = +[UIDevice currentDevice];
    if ([v2 userInterfaceIdiom] != (id)5)
    {
      BOOL v10 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  id v6 = [(MessagesViewController *)self view];
  [v6 bounds];
  if (v7 <= 400.0)
  {
    BOOL v10 = 0;
  }
  else
  {
    v8 = [(MessagesViewController *)self view];
    v9 = [v8 traitCollection];
    BOOL v10 = [v9 horizontalSizeClass] == (id)2
       || [(MessagesViewController *)self presentationStyle] == 0;
  }
  if (v5 != (id)1) {
    goto LABEL_11;
  }
LABEL_12:

  double result = 16.0;
  if (v10) {
    return 20.0;
  }
  return result;
}

- (UIEdgeInsets)accessoryButtonContentInsets
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];
  if (v5 != (id)1)
  {
    v2 = +[UIDevice currentDevice];
    if ([v2 userInterfaceIdiom] != (id)5)
    {
      BOOL v10 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  id v6 = [(MessagesViewController *)self view];
  [v6 bounds];
  if (v7 <= 400.0)
  {
    BOOL v10 = 0;
  }
  else
  {
    v8 = [(MessagesViewController *)self view];
    v9 = [v8 traitCollection];
    BOOL v10 = [v9 horizontalSizeClass] == (id)2
       || [(MessagesViewController *)self presentationStyle] == 0;
  }
  if (v5 != (id)1) {
    goto LABEL_11;
  }
LABEL_12:

  if (v10) {
    double v11 = 15.0;
  }
  else {
    double v11 = 12.0;
  }
  [(MessagesViewController *)self edgeMargin];
  double v13 = v12;
  double v14 = v11;
  double v15 = v11;
  double v16 = v13;
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v8 traitCollectionDidChange:a3];
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {
    BOOL isTransitioningBetweenLayouts = self->_isTransitioningBetweenLayouts;

    if (isTransitioningBetweenLayouts) {
      return;
    }
LABEL_6:
    [(MessagesViewController *)self updateConstraintConstants];
    [(MessagesViewController *)self updateButtonsImages];
    return;
  }
  id v6 = +[UIDevice currentDevice];
  if ([v6 userInterfaceIdiom] == (id)5)
  {
    BOOL v7 = self->_isTransitioningBetweenLayouts;

    if (v7) {
      return;
    }
    goto LABEL_6;
  }
}

- (void)updateButtonsImages
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];
  if (v5 != (id)1)
  {
    v2 = +[UIDevice currentDevice];
    if ([v2 userInterfaceIdiom] != (id)5) {
      goto LABEL_7;
    }
  }
  id v6 = [(MessagesViewController *)self view];
  [v6 bounds];
  if (v7 <= 400.0)
  {

    if (v5 == (id)1)
    {
LABEL_8:

      goto LABEL_14;
    }
LABEL_7:

    goto LABEL_8;
  }
  objc_super v8 = [(MessagesViewController *)self view];
  v9 = [v8 traitCollection];
  BOOL v10 = [v9 horizontalSizeClass] == (id)2
     || [(MessagesViewController *)self presentationStyle] == 0;

  if (v5 != (id)1) {
  if (v10)
  }
  {
    double v11 = 31.0;
    double v12 = 36.0;
    goto LABEL_15;
  }
LABEL_14:
  double v11 = 18.0;
  double v12 = 21.0;
LABEL_15:
  id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v12];
  double v13 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:v11];
  [(AVTCircularButton *)self->_editButton setSymbolImageWithName:kAVTCircularButtonEllipsisImageName configuration:v14];
  [(AVTCircularButton *)self->_cancelSendingMessageButton setSymbolImageWithName:kAVTCircularButtonTrashImageName configuration:v13];
}

- (void)updateConstraintConstants
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];
  if (v5 != (id)1)
  {
    v2 = +[UIDevice currentDevice];
    if ([v2 userInterfaceIdiom] != (id)5)
    {
      BOOL v10 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  id v6 = [(MessagesViewController *)self view];
  [v6 bounds];
  if (v7 <= 400.0)
  {
    BOOL v10 = 0;
  }
  else
  {
    objc_super v8 = [(MessagesViewController *)self view];
    v9 = [v8 traitCollection];
    BOOL v10 = [v9 horizontalSizeClass] == (id)2
       || [(MessagesViewController *)self presentationStyle] == 0;
  }
  if (v5 != (id)1) {
    goto LABEL_11;
  }
LABEL_12:

  [(MessagesViewController *)self edgeMargin];
  double v12 = v11;
  [(MessagesViewController *)self carouselHeight];
  double v14 = v13;
  [(MessagesViewController *)self accessoryButtonContentInsets];
  double v16 = v15;
  double v18 = -v17;
  double v19 = -v15;
  double v21 = -v20;
  double v23 = -v22;
  -[AVTCircularButton _setTouchInsets:](self->_cancelSendingMessageButton, "_setTouchInsets:", -v17, -v15, -v20, -v22);
  -[AVTCircularButton _setTouchInsets:](self->_editButton, "_setTouchInsets:", v18, v19, v21, v23);
  if (v10) {
    double v24 = 56.0;
  }
  else {
    double v24 = 32.0;
  }
  if (v10) {
    double v25 = 72.0;
  }
  else {
    double v25 = 52.0;
  }
  if (v10) {
    double v26 = -20.0;
  }
  else {
    double v26 = -18.0;
  }
  [(NSLayoutConstraint *)self->_userInfoMaximumWidthConstraint setConstant:-(v12 + v12 + v24 * 2.0)];
  [(NSLayoutConstraint *)self->_carouselHeightConstraint setConstant:v14];
  -[AVTRecordingButton setFrame:](self->_recordingButton, "setFrame:", 0.0, 0.0, v25, v25);
  [(AVTRecordingButton *)self->_recordingButton setForceUsePhoneStyle:!v10];
  if ([(MessagesViewController *)self isExpanded]) {
    double v27 = v26;
  }
  else {
    double v27 = 0.0;
  }
  [(NSLayoutConstraint *)self->_recordButtonBottomConstraint setConstant:v27];
  [(NSLayoutConstraint *)self->_recordButtonHorizontalConstraint setConstant:-v12];
  [(NSLayoutConstraint *)self->_recordButtonWidthConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_recordButtonHeightConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_recordingDisplayLeadingOffsetConstraint setConstant:v16];
  [(NSLayoutConstraint *)self->_editButtonWidthConstraint setConstant:v24];
  [(NSLayoutConstraint *)self->_editButtonHeightConstraint setConstant:v24];
  [(NSLayoutConstraint *)self->_editButtonLeadingOffsetConstraint setConstant:v16];
  [(NSLayoutConstraint *)self->_cancelSendingButtonWidthConstraint setConstant:v24];
  [(NSLayoutConstraint *)self->_cancelSendingButtonHeightConstraint setConstant:v24];
  tapToRadarLeadingOffsetConstraint = self->_tapToRadarLeadingOffsetConstraint;

  [(NSLayoutConstraint *)tapToRadarLeadingOffsetConstraint setConstant:v12];
}

- (void)upateReplayButtonImageForContentSize
{
  [(MessagesViewController *)self accessoryButtonContentInsets];
  -[UIButton setContentEdgeInsets:](self->_replayMessageButton, "setContentEdgeInsets:");
  v3 = [UIApp preferredContentSizeCategory];
  id v4 = +[UIFont appropriateContentSizeCategoryForCategory:v3 maxCategory:UIContentSizeCategoryAccessibilityMedium];
  id v5 = (void *)CTFontDescriptorCreateWithTextStyle();
  UIFontDescriptorAttributeName v20 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v18 = UIFontSymbolicTrait;
  double v19 = &off_1000360B8;
  id v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  double v21 = v6;
  double v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  objc_super v8 = [v5 fontDescriptorByAddingAttributes:v7];

  v9 = +[UIFont fontWithDescriptor:v8 size:0.0];
  BOOL v10 = [(UIButton *)self->_replayMessageButton titleLabel];
  [v10 setFont:v9];

  double v11 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v11);

  if (IsAccessibilityCategory)
  {
    [(UIButton *)self->_replayMessageButton setImage:0 forState:0];
    -[UIButton setTitleEdgeInsets:](self->_replayMessageButton, "setTitleEdgeInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  else
  {
    double v13 = +[UIImageSymbolConfiguration configurationWithFont:v9 scale:2];
    double v14 = +[UIImage systemImageNamed:@"arrow.clockwise" withConfiguration:v13];

    [(UIButton *)self->_replayMessageButton setImage:v14 forState:0];
    id v15 = [(UIButton *)self->_replayMessageButton effectiveUserInterfaceLayoutDirection];
    if (v15 == (id)1) {
      double v16 = -4.0;
    }
    else {
      double v16 = 4.0;
    }
    if (v15 == (id)1) {
      double v17 = 4.0;
    }
    else {
      double v17 = -4.0;
    }
    -[UIButton setTitleEdgeInsets:](self->_replayMessageButton, "setTitleEdgeInsets:", 0.0, v16, 0.0, v17);
  }
  [(UIButton *)self->_replayMessageButton sizeToFit];
}

- (void)updateTapToRadarVisibilityForceHide:(BOOL)a3
{
  if (a3
    || ![(MessagesViewController *)self isInternalBuild]
    || (+[NSUserDefaults standardUserDefaults],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 BOOLForKey:@"JFDefaults_HideTapToRadar"],
        v4,
        v5))
  {
    tapToRadar = self->_tapToRadar;
    [(UIButton *)tapToRadar setAlpha:0.0];
  }
  else
  {
    [(UIButton *)self->_tapToRadar setAlpha:1.0];
    if (!self->_configuredTapToRadar)
    {
      self->_configuredTapToRadar = 1;
      double v7 = +[NSUserDefaults standardUserDefaults];
      unsigned int v8 = [v7 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"];

      if (v8)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10000BC6C;
        v9[3] = &unk_100034790;
        v9[4] = self;
        +[UIView performWithoutAnimation:v9];
      }
    }
  }
}

- (void)updateEditButtonVisibilityForceHide:(BOOL)a3
{
  unsigned int v5 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
  double v6 = 0.0;
  id v7 = v5;
  if (!a3 && v5) {
    double v6 = [v5 isEditable:0.0];
  }
  [(AVTCircularButton *)self->_editButton setAlpha:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v7 viewWillAppear:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] viewWillAppear", v6, 2u);
  }
  self->_recordingStartTime = 0.0;
  self->_recordingElapsedTime = 0.0;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 BOOLForKey:@"JFDefaults_UseFacetrackingInternalPipeline"];

  +[AVTRecordView setUsesInternalTrackingPipeline:v5];
  [(MessagesViewController *)self updateLayoutForPresentationStyle];
}

- (void)captureSnapshotMetricsIfNeeded
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if ([(MessagesViewController *)self presentationStyle]
    || [(MessagesViewController *)self isSpeculatingLayout]
    || [(MessagesViewController *)self isLandscapeMode] && !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109632;
      *(_DWORD *)UIFontDescriptorAttributeName v20 = [(MessagesViewController *)self isLandscapeMode];
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = [(MessagesViewController *)self presentationStyle] != 0;
      LOWORD(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 2) = [(MessagesViewController *)self isSpeculatingLayout];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] not capturing snapshot metrics: landscape %i; compact %i; speculating %i",
        (uint8_t *)&v19,
        0x14u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MessagesViewController *)self view];
      [v5 bounds];
      double v6 = NSStringFromCGRect(v22);
      objc_super v7 = [(AVTRecordingCarouselController *)self->_avatarListController view];
      [v7 frame];
      unsigned int v8 = NSStringFromCGRect(v23);
      int v19 = 138412546;
      *(void *)UIFontDescriptorAttributeName v20 = v6;
      *(_WORD *)&v20[8] = 2112;
      double v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] capturing snapshot metrics, snapshotBounds %@; controllerFrame %@",
        (uint8_t *)&v19,
        0x16u);
    }
    v9 = [(MessagesViewController *)self view];
    [v9 bounds];
    self->_snapshotBounds.origin.x = v10;
    self->_snapshotBounds.origin.double y = v11;
    self->_snapshotBounds.size.double width = v12;
    self->_snapshotBounds.size.double height = v13;

    double v14 = [(AVTRecordingCarouselController *)self->_avatarListController view];
    [v14 frame];
    self->_avatarControllerFrame.origin.x = v15;
    self->_avatarControllerFrame.origin.double y = v16;
    self->_avatarControllerFrame.size.double width = v17;
    self->_avatarControllerFrame.size.double height = v18;

    self->_capturedSnapshotMetrics = 1;
  }
}

- (BOOL)requestsExpandedOnLaunchScreenDismissal
{
  BOOL v3 = [(MessagesViewController *)self presentsLaunchScreenInFullScreenModal];
  if (v3) {
    LOBYTE(v3) = [(MessagesViewController *)self actualPresentationStyle] == 0;
  }
  return v3;
}

- (BOOL)presentsLaunchScreenInFullScreenModal
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (id)1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == (id)5;
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v33.receiver = self;
  v33.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v33 viewDidAppear:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] viewDidAppear", buf, 2u);
  }
  self->_hasAppeared = 1;
  self->_isDisappearing = 0;
  if (self->_displaysLaunchScreen)
  {
    unsigned int v4 = [(MessagesViewController *)self presentsLaunchScreenInFullScreenModal];
    if (v4)
    {
      id v5 = [[LaunchViewController alloc] initWithNibName:0 bundle:0];
      -[LaunchViewController setAdditionalSafeAreaInsets:](v5, "setAdditionalSafeAreaInsets:", 44.0, 10.0, 0.0, 10.0);
      [(LaunchViewController *)v5 setDelegate:self];
      +[BaseMessagesViewController setPendingChildViewController:v5];

      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 1;
    }
    if (v6 == [(MessagesViewController *)self actualPresentationStyle])
    {
      objc_initWeak((id *)buf, self);
      int v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      double v21 = sub_10000C644;
      CGRect v22 = &unk_1000347E0;
      objc_copyWeak(&v23, (id *)buf);
      objc_super v7 = objc_retainBlock(&v19);
      id pendingLayoutUpdate = self->_pendingLayoutUpdate;
      self->_id pendingLayoutUpdate = v7;

      objc_destroyWeak(&v23);
      p_id location = (id *)buf;
    }
    else
    {
      [(MessagesViewController *)self setWaitingOnPresentationStyleRequestFulfillment:v4 ^ 1];
      [(MessagesViewController *)self requestPresentationStyle:v6];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] starting request expanded timer", buf, 2u);
      }
      objc_initWeak(&location, self);
      *(void *)buf = 0;
      double v27 = buf;
      uint64_t v28 = 0x3032000000;
      v29 = sub_10000C4DC;
      v30 = sub_10000C508;
      id v31 = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000C510;
      v24[3] = &unk_100034920;
      objc_copyWeak(v25, &location);
      v25[1] = (id)v6;
      v24[4] = buf;
      CGFloat v10 = objc_retainBlock(v24);
      CGFloat v11 = (void *)*((void *)v27 + 5);
      *((void *)v27 + 5) = v10;

      dispatch_time_t v12 = dispatch_time(0, 500000000);
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, *((dispatch_block_t *)v27 + 5));
      objc_destroyWeak(v25);
      _Block_object_dispose(buf, 8);

      p_id location = &location;
    }
    objc_destroyWeak(p_location);
  }
  CGFloat v13 = +[NSDate date];
  sessionStartDate = self->_sessionStartDate;
  self->_sessionStartDate = v13;

  lastExportError = self->_lastExportError;
  self->_lastExportError = 0;

  lastSendError = self->_lastSendError;
  self->_lastSendError = 0;

  lastInsertError = self->_lastInsertError;
  self->_lastInsertError = 0;

  lastMovieDoesNotExistError = self->_lastMovieDoesNotExistError;
  self->_lastMovieDoesNotExistError = (NSString *)@"NoError";
}

- (void)viewWillDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v13 viewWillDisappear:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int64_t ignoreViewWillDisappearCount = self->_ignoreViewWillDisappearCount;
    *(_DWORD *)buf = 134217984;
    int64_t v15 = ignoreViewWillDisappearCount;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] viewWillDisappear, ignoreCount %li", buf, 0xCu);
  }
  int64_t v5 = self->_ignoreViewWillDisappearCount;
  BOOL v6 = v5 < 1;
  int64_t v7 = v5 - 1;
  if (v6)
  {
    self->_isDisappearing = 1;
    [(MessagesViewController *)self cleanUpOnExit];
    [(NSTimer *)self->_trackingLostTimer invalidate];
    [(NSTimer *)self->_lightingCheckTimer invalidate];
    lightingCheckTimer = self->_lightingCheckTimer;
    self->_lightingCheckTimer = 0;

    [(AVTUsageTrackingSession *)self->_usageTrackingSession end];
    v9 = +[AVAudioSession sharedInstance];
    id v12 = 0;
    [v9 setActive:0 withOptions:1 error:&v12];
    id v10 = v12;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v11 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        int64_t v15 = (int64_t)v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@", buf, 0xCu);
      }
    }
  }
  else
  {
    self->_int64_t ignoreViewWillDisappearCount = v7;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)MessagesViewController;
  id v8 = a4;
  -[MessagesViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromSelector(a2);
    unint64_t v10 = [(MessagesViewController *)self presentationStyle];
    CGFloat v11 = [(MessagesViewController *)self view];
    [v11 bounds];
    id v12 = NSStringFromCGRect(v22);
    *(_DWORD *)buf = 138412802;
    CGFloat v17 = v9;
    __int16 v18 = 2048;
    unint64_t v19 = v10;
    __int16 v20 = 2112;
    double v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; style %lu; view.bounds %@",
      buf,
      0x20u);
  }
  v13[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CA5C;
  v14[3] = &unk_100034948;
  v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CAD4;
  v13[3] = &unk_100034948;
  [v8 animateAlongsideTransition:v14 completion:v13];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v13 viewWillLayoutSubviews];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = NSStringFromSelector(a2);
    unint64_t v5 = [(MessagesViewController *)self presentationStyle];
    BOOL v6 = [(MessagesViewController *)self view];
    [v6 bounds];
    int64_t v7 = NSStringFromCGRect(v22);
    id v8 = [(MessagesViewController *)self view];
    [v8 safeAreaInsets];
    v9 = NSStringFromUIEdgeInsets(v23);
    *(_DWORD *)buf = 138413058;
    objc_super v15 = v4;
    __int16 v16 = 2048;
    unint64_t v17 = v5;
    __int16 v18 = 2112;
    unint64_t v19 = v7;
    __int16 v20 = 2112;
    double v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; style %lu; view.bounds %@; insets %@",
      buf,
      0x2Au);
  }
  id pendingLayoutUpdate = self->_pendingLayoutUpdate;
  if (pendingLayoutUpdate)
  {
    CGFloat v11 = (void (**)(void))objc_retainBlock(pendingLayoutUpdate);
    id v12 = self->_pendingLayoutUpdate;
    self->_id pendingLayoutUpdate = 0;

    v11[2](v11);
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v9 viewDidLayoutSubviews];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = NSStringFromSelector(a2);
    unint64_t v5 = [(MessagesViewController *)self presentationStyle];
    BOOL v6 = [(MessagesViewController *)self view];
    [v6 bounds];
    int64_t v7 = NSStringFromCGRect(v18);
    [(UIView *)self->_carouselView bounds];
    id v8 = NSStringFromCGRect(v19);
    *(_DWORD *)buf = 138413058;
    CGFloat v11 = v4;
    __int16 v12 = 2048;
    unint64_t v13 = v5;
    __int16 v14 = 2112;
    objc_super v15 = v7;
    __int16 v16 = 2112;
    unint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; style %lu; view.bounds %@; carousel.bounds %@",
      buf,
      0x2Au);
  }
  [(MessagesViewController *)self captureSnapshotMetricsIfNeeded];
}

- (void)requestPresentationStyle:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    unint64_t v10 = v6;
    __int16 v11 = 2048;
    unint64_t v12 = [(MessagesViewController *)self presentationStyle];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; requestPresentationStyle %lu",
      buf,
      0x16u);
  }
  BOOL v7 = [(MessagesViewController *)self actualPresentationStyle] != a3 && a3 != 3;
  if (a3 == 3) {
    self->_ignoreViewWillDisappearCount += 2;
  }
  v8.receiver = self;
  v8.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v8 requestPresentationStyle:a3];
  if (v7) {
    self->_BOOL isTransitioningBetweenLayouts = 1;
  }
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v21 = v6;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; style %lu",
      buf,
      0x16u);
  }
  self->_BOOL isTransitioningBetweenLayouts = 1;
  [(MessagesViewController *)self setWaitingOnPresentationStyleRequestFulfillment:0];
  if (a3 == 1 || [(MessagesViewController *)self isLandcapeTrapOverlayShown])
  {
LABEL_12:
    unint64_t v12 = +[UIDevice currentDevice];
    if ([v12 userInterfaceIdiom] == (id)1)
    {
    }
    else
    {
      unint64_t v13 = +[UIDevice currentDevice];
      id v14 = [v13 userInterfaceIdiom];

      if (v14 != (id)5)
      {
        if (a3 != 1) {
          return;
        }
        goto LABEL_19;
      }
    }
    if (a3 != 1)
    {
      objc_super v15 = [(MessagesViewController *)self view];
      __int16 v16 = [v15 snapshotViewAfterScreenUpdates:0];
      presentationStyleTransitionSnapshotView = self->_presentationStyleTransitionSnapshotView;
      self->_presentationStyleTransitionSnapshotView = v16;

      CGRect v18 = [(MessagesViewController *)self view];
      [v18 addSubview:self->_presentationStyleTransitionSnapshotView];

      return;
    }
    [(MessagesViewController *)self setSingleAvatarMode:1 animated:1];
LABEL_19:
    [(AVTUsageTrackingSession *)self->_usageTrackingSession didShowExpandedMode];
    return;
  }
  if (self->_UIState != 1)
  {
    [(MessagesViewController *)self dismissPaddleViewIfNecessary];
    goto LABEL_12;
  }
  BOOL v7 = [(MessagesViewController *)self parentMessagesViewController];
  objc_super v8 = [v7 launchViewController];
  [v8 setFreezeLayout:1];

  if (![(MessagesViewController *)self shouldShowLaunchScreen])
  {
    unint64_t v10 = [(MessagesViewController *)self parentMessagesViewController];
    __int16 v11 = [v10 launchViewController];
    [(MessagesViewController *)self dismissLaunchScreenIfNecessaryForPresentationStyle:a3 controller:v11];

    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] Splash screen canceled via swipe. Exiting.", buf, 2u);
  }
  dispatch_time_t v9 = dispatch_time(0, 300000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D22C;
  block[3] = &unk_100034790;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)performWhileOverridingPresentationStyle:(unint64_t)a3 block:(id)a4
{
  BOOL usePresentationStyleOverride = self->_usePresentationStyleOverride;
  unint64_t presentationStyleOverride = self->_presentationStyleOverride;
  self->_BOOL usePresentationStyleOverride = 1;
  self->_unint64_t presentationStyleOverride = a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_BOOL usePresentationStyleOverride = usePresentationStyleOverride;
  self->_unint64_t presentationStyleOverride = presentationStyleOverride;
}

- (BOOL)isSpeculatingLayout
{
  BOOL v3 = [(MessagesViewController *)self presentationStyle];
  return v3 != (void *)[(MessagesViewController *)self actualPresentationStyle]
      || !self->_hasAppeared;
}

- (unint64_t)actualPresentationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesViewController;
  return [(MessagesViewController *)&v3 presentationStyle];
}

- (unint64_t)presentationStyle
{
  if (self->_usePresentationStyleOverride) {
    return self->_presentationStyleOverride;
  }
  else {
    return [(MessagesViewController *)self actualPresentationStyle];
  }
}

- (BOOL)isExpanded
{
  return (id)[(MessagesViewController *)self presentationStyle] == (id)1;
}

- (BOOL)shouldPresentPaddleView
{
  objc_super v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1) {
    goto LABEL_4;
  }
  unsigned int v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)5)
  {

LABEL_4:
    goto LABEL_5;
  }
  unsigned __int8 v6 = [(MessagesViewController *)self isLandscapeMode];

  if (v6) {
    goto LABEL_9;
  }
LABEL_5:
  if (AVTUIHasDisplayedPaddleView())
  {
LABEL_9:
    LOBYTE(v5) = 0;
    return v5;
  }
  BOOL v5 = [(MessagesViewController *)self isExpanded];
  if (v5) {
    LOBYTE(v5) = self->_paddleView == 0;
  }
  return v5;
}

- (void)presentPaddleView
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = NSStringFromSelector(a2);
    int v10 = 138412290;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@", (uint8_t *)&v10, 0xCu);
  }
  BOOL v5 = [(MessagesViewController *)self view];
  [v5 layoutIfNeeded];

  unsigned __int8 v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:1];
  BOOL v7 = (AVTPaddleView *)[objc_alloc((Class)AVTPaddleView) initWithLayoutDirection:0 symbolConfiguration:v6];
  paddleView = self->_paddleView;
  self->_paddleView = v7;

  [(AVTPaddleView *)self->_paddleView setDelegate:self];
  dispatch_time_t v9 = [(MessagesViewController *)self view];
  [v9 addSubview:self->_paddleView];

  [(MessagesViewController *)self updatePaddleViewLayoutIfNecessary];
  AVTUISetHasDisplayedPaddleView();
  [(AVTPaddleView *)self->_paddleView showAnimated:1];
}

- (void)updatePaddleViewLayoutIfNecessary
{
  if (self->_paddleView)
  {
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController reloadData];
    objc_super v3 = [(PuppetCollectionViewController *)self->_puppetCollectionViewController puppetCollectionView];
    unsigned int v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
    [v3 scrollToItemAtIndexPath:v4 atScrollPosition:1 animated:0];

    BOOL v5 = [(PuppetCollectionViewController *)self->_puppetCollectionViewController puppetCollectionView];
    [v5 layoutIfNeeded];

    paddleView = self->_paddleView;
    id v7 = [(PuppetCollectionViewController *)self->_puppetCollectionViewController plusButtonView];
    [(AVTPaddleView *)paddleView updateLayoutFromPlusButtonView:v7 videoView:0];
  }
}

- (void)dismissPaddleViewIfNecessary
{
  paddleView = self->_paddleView;
  if (paddleView)
  {
    [(AVTPaddleView *)paddleView dismissAnimated:1];
    unsigned int v4 = self->_paddleView;
    self->_paddleView = 0;
  }
}

- (void)paddleViewTapped:(id)a3
{
  [(MessagesViewController *)self dismissPaddleViewIfNecessary];
  avatarListController = self->_avatarListController;

  [(AVTRecordingCarouselController *)avatarListController presentEditorForCreatingAvatar:self];
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = NSStringFromSelector(a2);
    id v7 = [(MessagesViewController *)self view];
    [v7 bounds];
    objc_super v8 = NSStringFromCGRect(v21);
    int v15 = 138412802;
    __int16 v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; style %lu; view.bounds %@",
      (uint8_t *)&v15,
      0x20u);
  }
  self->_BOOL isTransitioningBetweenLayouts = 0;
  if (self->_displaysLaunchScreen)
  {
    unint64_t UIState = self->_UIState;
    if (UIState == 1)
    {
      unsigned __int8 v10 = [(MessagesViewController *)self isLandcapeTrapOverlayShown];
      if (a3 == 1 && (v10 & 1) == 0)
      {
        __int16 v11 = [(MessagesViewController *)self parentMessagesViewController];
        unint64_t v12 = [v11 launchViewController];
        [v12 setFreezeLayout:0];
      }
    }
    else if (!UIState)
    {
      [(MessagesViewController *)self updateUIState:1 animated:0];
    }
  }
  else
  {
    [(MessagesViewController *)self updateLayoutForPresentationStyle];
    if ([(MessagesViewController *)self shouldPresentPaddleView]) {
      [(MessagesViewController *)self presentPaddleView];
    }
  }
  presentationStyleTransitionSnapshotView = self->_presentationStyleTransitionSnapshotView;
  if (presentationStyleTransitionSnapshotView)
  {
    [(UIView *)presentationStyleTransitionSnapshotView removeFromSuperview];
    id v14 = self->_presentationStyleTransitionSnapshotView;
    self->_presentationStyleTransitionSnapshotView = 0;
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v7 viewSafeAreaInsetsDidChange];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = NSStringFromSelector(a2);
    BOOL v5 = [(MessagesViewController *)self view];
    [v5 safeAreaInsets];
    unsigned __int8 v6 = NSStringFromUIEdgeInsets(v12);
    *(_DWORD *)buf = 138412546;
    dispatch_time_t v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@, insets %@", buf, 0x16u);
  }
  if (!self->_pendingLayoutUpdate && !self->_isTransitioningBetweenLayouts) {
    [(MessagesViewController *)self updateLayoutForPresentationStyle];
  }
}

- (void)updateLayoutForPresentationStyle
{
  unint64_t v3 = [(MessagesViewController *)self presentationStyle];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"EXPANDED";
    if (!v3) {
      CFStringRef v4 = @"COMPACT";
    }
    int v7 = 138412290;
    CFStringRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] updateLayoutForPresentationStyle using style: %@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
  unsigned __int8 v6 = WeakRetained;
  if (v3 == 1)
  {
    [WeakRetained setAlpha:1.0];

    [(MessagesViewController *)self addPuppetCollectionViewControllerInNecessary];
  }
  else
  {
    [WeakRetained setAlpha:0.0];

    [(MessagesViewController *)self removePuppetCollectionViewControllerIfNecessary];
  }
  [(MessagesViewController *)self updatePuppetCollectionViewIfNecessary];
  [(MessagesViewController *)self updateConstraintConstants];
  [(MessagesViewController *)self updateButtonsImages];
  [(MessagesViewController *)self setSingleAvatarMode:v3 == 1 animated:1];
}

- (void)setSingleAvatarMode:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = NSStringFromSelector(a2);
    int v9 = 138412802;
    __int16 v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] %@; singleMode %i; animated %i",
      (uint8_t *)&v9,
      0x18u);
  }
  if ([(AVTRecordingCarouselController *)self->_avatarListController singleAvatarMode] != v5)
  {
    self->_isUpdatingAvatarMode = 1;
    [(AVTRecordingCarouselController *)self->_avatarListController setSingleAvatarMode:v5 fillContainer:[(MessagesViewController *)self isExpanded] animated:v4];
  }
}

- (void)setAllowsCreate:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(AVTRecordingCarouselController *)self->_avatarListController allowsCreate] != a3) {
    [(AVTRecordingCarouselController *)self->_avatarListController setAllowsCreate:v5 animated:v4];
  }
  puppetCollectionViewController = self->_puppetCollectionViewController;

  [(PuppetCollectionViewController *)puppetCollectionViewController setPlusButtonCellEnabled:v5];
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] dealloc", buf, 2u);
  }
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained setRecordDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v5 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v2 didReceiveMemoryWarning];
}

- (void)cleanUpOnExit
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] cleanUpOnExit", v5, 2u);
  }
  unint64_t UIState = self->_UIState;
  if (UIState == 6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    [WeakRetained cancelMovieExport];
LABEL_8:

    return;
  }
  if (UIState != 5)
  {
    if (UIState != 4) {
      return;
    }
    [(MessagesViewController *)self stopRecordingAndPlayPreview:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    [WeakRetained cancelRecording];
    goto LABEL_8;
  }
  [(MessagesViewController *)self stopPreviewing];
}

- (void)preparePuppetViewForReuse
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained removeAllGestureRecognizers];

  [(MessagesViewController *)self endObservingFaceTrackingIfNecessary];
}

- (void)updateForNewPuppetView
{
  p_puppetView = &self->_puppetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);

  if (!WeakRetained) {
    return;
  }
  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"JFDefaults_DisableRecordingTimer"];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_puppetView);
    LODWORD(v8) = 1142292480;
    [v7 setMaxRecordingDuration:v8];
  }
  if (!self->_longPressGestureRecognizer)
  {
    int v9 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleSceneLongPress:"];
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = v9;

    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setMinimumPressDuration:0.300000012];
  }
  id v11 = objc_loadWeakRetained((id *)p_puppetView);
  [v11 addGestureRecognizer:self->_longPressGestureRecognizer];

  if (!self->_doubleTapGestureRecognizer)
  {
    BOOL v12 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"doubleTap:"];
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v12;

    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
  }
  id v14 = objc_loadWeakRetained((id *)p_puppetView);
  [v14 addGestureRecognizer:self->_doubleTapGestureRecognizer];

  if (!self->_tapGestureRecognizer)
  {
    int v15 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleSceneShortPress:"];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v15;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setNumberOfTapsRequired:1];
  }
  id v17 = objc_loadWeakRetained((id *)p_puppetView);
  [v17 addGestureRecognizer:self->_tapGestureRecognizer];

  unint64_t v18 = +[NSUserDefaults standardUserDefaults];
  if (![v18 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"])
  {

    goto LABEL_14;
  }
  videoLoggingFolder = self->_videoLoggingFolder;

  if (!videoLoggingFolder)
  {
LABEL_14:
    __int16 v20 = objc_loadWeakRetained((id *)p_puppetView);
    [v20 setFaceTrackingRecordingURL:0];
    goto LABEL_15;
  }
  __int16 v20 = [(MessagesViewController *)self faceTrackingRecordingURL];
  id v21 = objc_loadWeakRetained((id *)p_puppetView);
  [v21 setFaceTrackingRecordingURL:v20];

LABEL_15:
  __int16 v22 = +[NSUserDefaults standardUserDefaults];
  unsigned int v23 = [v22 BOOLForKey:@"JFDefaults_PlayBakedAnimation"];

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)p_puppetView);
    [v24 setPlayBakedAnimation:1];
  }
  double v25 = +[NSUserDefaults standardUserDefaults];
  unsigned int v26 = [v25 BOOLForKey:@"JFDefaults_DisablePuppetRendering"];

  if (v26)
  {
    id v27 = objc_loadWeakRetained((id *)p_puppetView);
    [v27 setDisableRendering:1];
  }
  uint64_t v28 = +[NSUserDefaults standardUserDefaults];
  id v29 = [v28 BOOLForKey:@"JFDefaults_UseDirectRetargetingMode"];

  id v30 = objc_loadWeakRetained((id *)p_puppetView);
  [v30 setDirectRetargetingMode:v29];

  if (!self->_displaysLaunchScreen)
  {
    [(MessagesViewController *)self beginObservingFaceTrackingIfNecessary];
    if (self->_UIState == 2)
    {
      id v31 = objc_loadWeakRetained((id *)p_puppetView);
      unsigned int v32 = [v31 isPreviewing];

      if (v32) {
        uint64_t v33 = 5;
      }
      else {
        uint64_t v33 = 3;
      }
      [(MessagesViewController *)self updateUIState:v33 animated:0];
    }
  }
  id v34 = objc_loadWeakRetained((id *)p_puppetView);
  [v34 setMute:0];

  dispatch_time_t v35 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E3EC;
  block[3] = &unk_100034790;
  block[4] = self;
  dispatch_after(v35, (dispatch_queue_t)&_dispatch_main_q, block);
  [(MessagesViewController *)self checkLightingAndObscuredSensorWhileTracking];
  if (self->_UIState == 5 && !self->_isUpdatingAvatarMode) {
    [(MessagesViewController *)self playPreviewOnce];
  }
}

- (void)beginObservingFaceTrackingIfNecessary
{
  p_puppetView = &self->_puppetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  if (WeakRetained)
  {
    BOOL observingFacetracking = self->_observingFacetracking;

    if (!observingFacetracking)
    {
      [(MessagesViewController *)self startTrackingStartTimerWithCounter:4];
      self->_BOOL observingFacetracking = 1;
      self->_exportingMovie = 0;
      id v6 = objc_loadWeakRetained((id *)p_puppetView);
      objc_storeWeak((id *)&self->_puppetViewForKVO, v6);

      id v7 = objc_loadWeakRetained((id *)p_puppetView);
      [v7 addObserver:self forKeyPath:@"faceIsTracked" options:5 context:0];

      id v9 = objc_loadWeakRetained((id *)p_puppetView);
      double v8 = [v9 arSession];
      [v8 addObserver:self forKeyPath:@"state" options:5 context:0];
    }
  }
}

- (void)endObservingFaceTrackingIfNecessary
{
  if (self->_observingFacetracking)
  {
    p_puppetViewForKVO = &self->_puppetViewForKVO;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetViewForKVO);
    [WeakRetained removeObserver:self forKeyPath:@"faceIsTracked"];

    id v5 = objc_loadWeakRetained((id *)p_puppetViewForKVO);
    id v6 = [v5 arSession];
    [v6 removeObserver:self forKeyPath:@"state"];

    objc_storeWeak((id *)p_puppetViewForKVO, 0);
    self->_BOOL observingFacetracking = 0;
  }
}

- (void)startObservingBaseMessagesNotifications
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"strongPopupPresentationNotification:" name:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:0];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"overlayPresentationNotification:" name:@"BaseMessagesViewControllerOverlayPresentationNotification" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"snapshottingEnabledChangedNotification:" name:@"BaseMessagesViewControllerSnapshottingEnabledChangedNotification" object:0];
}

- (void)stopObservingBaseMessagesNotifications
{
  unint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:0];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"BaseMessagesViewControllerOverlayPresentationNotification" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"BaseMessagesViewControllerSnapshottingEnabledChangedNotification" object:0];
}

- (void)strongPopupPresentationNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"BaseMessagesViewControllerStrongPopupPresentedKey"];
  id v6 = [v5 BOOLValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] strongPopupPresentationNotification, presentedOver %i", (uint8_t *)v8, 8u);
  }
  [(MessagesViewController *)self interfaceObscuredByOverlayOrPresentationChanged:v6];
  paddleView = self->_paddleView;
  if (paddleView)
  {
    if (v6) {
      [(AVTPaddleView *)paddleView pauseVideo];
    }
    else {
      [(AVTPaddleView *)paddleView playVideo];
    }
  }
}

- (void)overlayPresentationNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"BaseMessagesViewControllerOverlayPresentedKey"];
  id v6 = [v5 BOOLValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] overlayPresentationNotification, shown %i", (uint8_t *)v7, 8u);
  }
  [(MessagesViewController *)self interfaceObscuredByOverlayOrPresentationChanged:v6];
}

- (void)interfaceObscuredByOverlayOrPresentationChanged:(BOOL)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EA60;
  v4[3] = &unk_100034970;
  v4[4] = self;
  BOOL v5 = a3;
  unint64_t v3 = objc_retainBlock(v4);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v3[2])(v3);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

- (void)snapshottingEnabledChangedNotification:(id)a3
{
  BOOL v4 = [(MessagesViewController *)self parentMessagesViewController];
  unsigned int v5 = [v4 snapshottingEnabled];

  if (v5)
  {
    [(MessagesViewController *)self captureSnapshotMetricsIfNeeded];
  }
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v13 = a3;
  unsigned int v5 = [v13 identifier];
  unsigned int v6 = [v5 isEqualToString:@"MessagesViewController"];

  if (v6)
  {
    id v7 = [(MessagesViewController *)self parentMessagesViewController];
    double v8 = [v7 messagesViewContainer];
    [v8 setAlpha:0.0];
  }
  else
  {
    id v9 = [v13 identifier];
    unsigned int v10 = [v9 isEqualToString:@"LaunchViewController"];

    if (!v10) {
      goto LABEL_6;
    }
    id v11 = [(MessagesViewController *)self parentMessagesViewController];
    BOOL v12 = [v11 launchViewContainer];
    [v12 setAlpha:0.0];

    id v7 = [(MessagesViewController *)self parentMessagesViewController];
    double v8 = [v7 launchViewController];
    [v8 setDelegate:self];
  }

LABEL_6:
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  id v5 = a3;
  unsigned int v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"JFDefaults_AlwaysShowLaunchScreen"];

  if (v7)
  {
    AVTUISetHasDisplayedAnimojiSplashScreen();
    double v8 = +[NSUserDefaults standardUserDefaults];
    [v8 removeObjectForKey:@"LastPuppetIdentifier"];

    AVTUISetHasDisplayedSplashScreen();
  }
  if (![v5 isEqualToString:@"LaunchViewController"]) {
    goto LABEL_9;
  }
  BOOL v9 = [(MessagesViewController *)self shouldShowLaunchScreen];
  self->_displaysLaunchScreen = v9;
  if (v9)
  {
    unsigned int v10 = +[UIDevice currentDevice];
    if ([v10 userInterfaceIdiom] == (id)1)
    {

      goto LABEL_8;
    }
    id v11 = +[UIDevice currentDevice];
    id v12 = [v11 userInterfaceIdiom];

    if (v12 == (id)5) {
      goto LABEL_8;
    }
LABEL_9:
    BOOL v16 = 1;
    goto LABEL_10;
  }
LABEL_8:
  id v13 = [(MessagesViewController *)self parentMessagesViewController];
  id v14 = [v13 launchViewContainer];
  [v14 removeFromSuperview];

  int v15 = [(MessagesViewController *)self parentMessagesViewController];
  [v15 setLaunchViewContainer:0];

  BOOL v16 = 0;
LABEL_10:

  return v16;
}

- (BOOL)shouldShowLaunchScreen
{
  char v2 = AVTUIHasDisplayedAnimojiSplashScreen();
  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || AVTDeviceIsGreenTea()) {
    int v3 = AVTUIHasDisplayedCameraDisclosureSplashScreen() ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v2 ^ 1 | v3;
}

- (void)addPuppetCollectionViewControllerInNecessary
{
  if (!self->_puppetCollectionViewController)
  {
    int v3 = [[PuppetCollectionViewController alloc] initWithNibName:0 bundle:0];
    puppetCollectionViewController = self->_puppetCollectionViewController;
    self->_puppetCollectionViewController = v3;

    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setDelegate:self];
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setAvatarDataSource:self->_avatarDataSource];
    id v5 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setSelectedRecord:v5];

    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setPlusButtonCellEnabled:[(AVTRecordingCarouselController *)self->_avatarListController allowsCreate]];
    [(MessagesViewController *)self addChildViewController:self->_puppetCollectionViewController];
    id v8 = [(PuppetCollectionViewController *)self->_puppetCollectionViewController view];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    [WeakRetained bounds];
    [v8 setFrame:];

    [v8 setAutoresizingMask:18];
    id v7 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
    [v7 addSubview:v8];

    [(PuppetCollectionViewController *)self->_puppetCollectionViewController didMoveToParentViewController:self];
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController reloadData];
  }
}

- (void)removePuppetCollectionViewControllerIfNecessary
{
  puppetCollectionViewController = self->_puppetCollectionViewController;
  if (puppetCollectionViewController)
  {
    [(PuppetCollectionViewController *)puppetCollectionViewController willMoveToParentViewController:0];
    BOOL v4 = [(PuppetCollectionViewController *)self->_puppetCollectionViewController view];
    [v4 removeFromSuperview];

    [(MessagesViewController *)self removeChildViewController:self->_puppetCollectionViewController];
    id v5 = self->_puppetCollectionViewController;
    self->_puppetCollectionViewController = 0;
  }
}

- (void)onTapToRadarButtonPressed:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] tap to radar tapped", buf, 2u);
  }
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"];

  if (v6)
  {
    [(MessagesViewController *)self showFileRadarWarningPopup];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F3E4;
    block[3] = &unk_100034790;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)showFileRadarWarningPopup
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] showFileRadarWarningPopup", buf, 2u);
  }
  int v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"];

  if (v4)
  {
    id v5 = +[UIAlertController alertControllerWithTitle:@"File Radar" message:@"This will allow you to submit data associated with pictures of your face and renderings made by the camera and Pearl.  This data may include metadata generated during the capture or processing of such images or renderings. \n\nYou will have an opportunity to review the data that you are submitting before the Radar is filed.   Only submit data you are comfortable having attached to Radars and used by Apple.\n\n I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images and videos that I am providing with this bug report (“Media”), for the purpose of improving Apple products and services.  Please do not submit any Media that contain third parties or for which you do not have sufficient rights.\n\nBy submitting a Radar, I agree to these terms." preferredStyle:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F774;
    v12[3] = &unk_100034998;
    v12[4] = self;
    unsigned __int8 v6 = +[UIAlertAction actionWithTitle:@"File Radar" style:0 handler:v12];
    [v5 addAction:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F7B4;
    v11[3] = &unk_100034998;
    v11[4] = self;
    id v7 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v11];
    [v5 addAction:v7];

    [v5 _setShouldAlignToKeyboard:0];
    [(MessagesViewController *)self requestPresentationStyle:1];
    id v8 = [(MessagesViewController *)self view];
    BOOL v9 = [v8 window];
    unsigned int v10 = [v9 rootViewController];
    [v10 presentViewController:v5 animated:0 completion:0];
  }
  else
  {
    [(MessagesViewController *)self launchTapToRadar];
  }
}

- (void)_launchTapToRadarWithAttachments:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"];

  if (v6)
  {
    [@"ComponentName=Purple AppleCVA" URLEncodedString_ch];
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    [@"ComponentVersion=FaceKit Secure" URLEncodedString_ch];
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v42 = @"ComponentID=933150";
  }
  else
  {
    @"ComponentName=Animoji App".URLEncodedString_ch
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    v42 = @"ComponentID=830570";
    v43 = @"ComponentVersion=All";
  }
  if ([v4 count])
  {
    unint64_t v7 = 0;
    id v8 = @"Attachments=";
    do
    {
      if (v7)
      {
        uint64_t v9 = [(__CFString *)v8 stringByAppendingString:@","];

        id v8 = (__CFString *)v9;
      }
      unsigned int v10 = [v4 objectAtIndexedSubscript:v7];

      if (v10)
      {
        id v11 = [v4 objectAtIndexedSubscript:v7];
        uint64_t v12 = [(__CFString *)v8 stringByAppendingString:v11];

        id v8 = (__CFString *)v12;
      }
      ++v7;
    }
    while ((unint64_t)[v4 count] > v7);
  }
  else
  {
    id v8 = @"Attachments=";
  }
  v49 = +[NSDate date];
  [v49 timeIntervalSinceDate:self->_sessionStartDate];
  uint64_t v14 = v13;
  if ([(MessagesViewController *)self presentationStyle]) {
    int v15 = @"Expanded";
  }
  else {
    int v15 = @"Compact";
  }
  lastExportError = self->_lastExportError;
  if (lastExportError)
  {
    id v17 = [(NSError *)lastExportError localizedDescription];
  }
  else
  {
    id v17 = @"NoError";
  }
  lastSendError = self->_lastSendError;
  if (lastSendError)
  {
    __int16 v19 = [(NSError *)lastSendError localizedDescription];
  }
  else
  {
    __int16 v19 = @"NoError";
  }
  lastInsertError = self->_lastInsertError;
  if (lastInsertError)
  {
    id v21 = [(NSError *)lastInsertError localizedDescription];
  }
  else
  {
    id v21 = @"NoError";
  }
  __int16 v22 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
  unsigned int v23 = [v22 identifier];
  id v24 = [(__CFString *)v15 cStringUsingEncoding:4];
  double v25 = ARKitBuildVersionString();
  v48 = v17;
  id v26 = [(__CFString *)v48 cStringUsingEncoding:4];
  v47 = v19;
  id v27 = [(__CFString *)v47 cStringUsingEncoding:4];
  v46 = v21;
  uint64_t v28 = +[NSString stringWithFormat:@"Description=Provide a detailed description of the issue including specific steps to reproduce.  Attachments you submit will be part of the Radar.  Only submit attachments you are comfortable having attached to Radars.\n\nANIMOJI SESSION INFO: puppet:%@ mode:%s sessionLength:%f  AnimojiVersion:%@  AvatarKitVersion:%i  SceneKitVersion:%i  ARKitVersion:%@  lastExportError:%s   lastSendError:%s  lastInsertError:%s   lastMovieExists:%s", v23, v24, v14, @"363.300.1", 346, 603, v25, v26, v27, [(__CFString *)v46 cStringUsingEncoding:4], [(NSString *)self->_lastMovieDoesNotExistError cStringUsingEncoding:4]];

  id v29 = [v28 URLEncodedString_ch];

  id v45 = v41;
  id v30 = [v45 cStringUsingEncoding:4];
  id v31 = [(__CFString *)v42 cStringUsingEncoding:4];
  v44 = v43;
  id v32 = [(__CFString *)v44 cStringUsingEncoding:4];
  id v33 = [@"Classification=UI/Usability" cStringUsingEncoding:4];
  id v34 = [@"Reproducibility=Always" cStringUsingEncoding:4];
  dispatch_time_t v35 = v8;
  id v36 = [(__CFString *)v35 cStringUsingEncoding:4];
  id v37 = v29;
  v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"tap-to-radar://new?%s&%s&%s&%s&%s&%s&%s", v30, v31, v32, v33, v34, v36, [v37 cStringUsingEncoding:4]);
  v39 = +[NSURL URLWithString:v38];
  v40 = +[LSApplicationWorkspace defaultWorkspace];
  [v40 openURL:v39 configuration:0 completionHandler:0];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] didSendTapToRadar", buf, 2u);
  }
}

- (void)launchTapToRadar
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] willSendTapToRadar", buf, 2u);
  }
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"];

  if (v5)
  {
    v42 = v3;
    unsigned int v6 = +[NSFileManager defaultManager];
    id v41 = self;
    unint64_t v7 = [(NSURL *)self->_stickerFolder path];
    id v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];

    v43 = +[NSMutableArray array];
    uint64_t v9 = +[NSMutableArray array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          BOOL v16 = [v15 pathExtension];
          unsigned int v17 = [v16 isEqualToString:@"mov"];

          if (v17) {
            [v43 addObject:v15];
          }
          unint64_t v18 = [v15 pathExtension];
          unsigned int v19 = [v18 isEqualToString:@"png"];

          if (v19) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v12);
    }

    __int16 v20 = [v43 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
    id v21 = [v9 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
    __int16 v22 = [v20 lastObject];
    unsigned int v23 = [v21 lastObject];
    if (v22)
    {
      id v24 = [(NSURL *)v41->_stickerFolder path];
      double v25 = [v24 stringByAppendingString:@"/"];
      id v26 = [v25 stringByAppendingString:v22];

      [v42 addObject:v26];
    }
    self = v41;
    if (v23)
    {
      id v27 = [(NSURL *)v41->_stickerFolder path];
      uint64_t v28 = [v27 stringByAppendingString:@"/"];
      id v29 = [v28 stringByAppendingString:v23];

      [v42 addObject:v29];
    }

    id v3 = v42;
  }
  id v30 = +[NSUserDefaults standardUserDefaults];
  if ([v30 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"])
  {
    id v31 = +[NSFileManager defaultManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    id v33 = [WeakRetained faceTrackingRecordingURL];
    id v34 = [v33 path];
    unsigned int v35 = [v31 fileExistsAtPath:v34];

    if (!v35) {
      goto LABEL_24;
    }
    id v30 = objc_loadWeakRetained((id *)&self->_puppetView);
    id v36 = [v30 faceTrackingRecordingURL];
    id v37 = [v36 path];
    v38 = [v37 URLEncodedString_ch];
    [v3 addObject:v38];
  }
LABEL_24:
  v39 = +[NSUserDefaults standardUserDefaults];
  if (![v39 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"])
  {

    goto LABEL_28;
  }
  unint64_t UIState = self->_UIState;

  if (UIState != 5)
  {
LABEL_28:
    [(MessagesViewController *)self _launchTapToRadarWithAttachments:v3];
    goto LABEL_29;
  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000101AC;
  v44[3] = &unk_100034A00;
  id v45 = v3;
  v46 = self;
  [(MessagesViewController *)self exportVideoWithCompletion:v44];

LABEL_29:
}

- (BOOL)canTakeSendingAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)onCancelSendingMessage:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] onCancelSendingMessage", v5, 2u);
  }
  if ([(MessagesViewController *)self canTakeSendingAction])
  {
    [(MessagesViewController *)self discardRecording];
    [(AVTUsageTrackingSession *)self->_usageTrackingSession didDiscardVideoWithDuration:self->_recordingElapsedTime];
  }
}

- (void)discardRecording
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] discardRecording", buf, 2u);
  }
  [(MessagesViewController *)self updateUIState:3 animated:1];
  [(MessagesViewController *)self hideUserInfoLabel];
  [(MessagesViewController *)self stopPreviewing];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000103C4;
  block[3] = &unk_100034790;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)onConfirmSendingMessage:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] onConfirmSendingMessage", buf, 2u);
  }
  if ([(MessagesViewController *)self canTakeSendingAction])
  {
    unsigned int v5 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v6 = [v5 BOOLForKey:@"JFDefaults_DontExitPreviewOnSend"];

    if ((v6 & 1) == 0) {
      [(MessagesViewController *)self stopPreviewing];
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100010584;
    v7[3] = &unk_100034A28;
    v7[4] = self;
    [(MessagesViewController *)self conditionallyPerformWithDisclosureAlertForSendingMessageWithConfirmTitle:@"Send" result:v7];
  }
}

- (void)onReplayMessage:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] onReplayMessage", v5, 2u);
  }
  if ([(MessagesViewController *)self canTakeSendingAction])
  {
    [(MessagesViewController *)self playPreviewOnce];
    [(AVTUsageTrackingSession *)self->_usageTrackingSession didReplayVideo];
  }
}

- (BOOL)shouldShowDisclosureAlertForSendingMessage
{
  int v3 = AVTUIMemojiClassicShowDisclosureWarning_once();
  if (v3)
  {
    id v4 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
    unsigned int v5 = [v4 isEditable];

    if (v5) {
      LOBYTE(v3) = !self->_hasConfirmedDisclosureWarning;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)conditionallyPerformWithDisclosureAlertForSendingMessageWithConfirmTitle:(id)a3 result:(id)a4
{
  id v7 = a3;
  unsigned __int8 v6 = (void (**)(id, uint64_t))a4;
  if ([(MessagesViewController *)self shouldShowDisclosureAlertForSendingMessage])
  {
    [(MessagesViewController *)self showAlertForDisclosureWarningWithConfirmTitle:v7 completionBlock:v6];
  }
  else
  {
    v6[2](v6, 1);
  }
}

- (void)showAlertForDisclosureWarningWithConfirmTitle:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIAlertController alertControllerWithTitle:0 message:@"Please ensure all recipients are disclosed on pre-release Memoji features prior to sending." preferredStyle:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000108E0;
  v15[3] = &unk_100034A78;
  id v9 = v6;
  id v16 = v9;
  id v10 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v15];
  [v8 addAction:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010980;
  v13[3] = &unk_100034AA0;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v13];

  [v8 addAction:v12];
  [v8 _setShouldAlignToKeyboard:0];
  [(MessagesViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (CGSize)defaultVideoExportDimensions
{
  char v2 = +[NSUserDefaults standardUserDefaults];
  int v3 = [v2 objectForKey:@"JFDefaults_VideoExportWidth"];

  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    double v5 = (double)(uint64_t)[v4 integerForKey:@"JFDefaults_VideoExportWidth"];
  }
  else
  {
    double v5 = 640.0;
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 objectForKey:@"JFDefaults_VideoExportHeight"];

  if (v7)
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    double v9 = (double)(uint64_t)[v8 integerForKey:@"JFDefaults_VideoExportHeight"];
  }
  else
  {
    double v9 = 480.0;
  }
  double v10 = 100.0;
  if (v5 >= 100.0) {
    double v11 = v5;
  }
  else {
    double v11 = 100.0;
  }
  if (v9 >= 100.0) {
    double v10 = v9;
  }
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (id)defaultExportVideoOptionsForSize:(CGSize)a3
{
  v6[0] = @"size";
  int v3 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", a3.width, a3.height);
  v7[0] = v3;
  v7[1] = &off_1000360D0;
  v6[1] = @"rate";
  v6[2] = AVVideoCodecKey;
  _DWORD v7[2] = AVVideoCodecTypeH264;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (void)exportVideoWithCompletion:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] exporting video for TTR", buf, 2u);
  }
  double v5 = [(NSURL *)self->_stickerFolder path];
  id v6 = +[NSString stringWithFormat:@"/EmojiMovieExport.mov"];
  id v7 = [v5 stringByAppendingString:v6];

  id v8 = +[NSURL fileURLWithPath:v7];
  [(MessagesViewController *)self defaultVideoExportDimensions];
  double v9 = -[MessagesViewController defaultExportVideoOptionsForSize:](self, "defaultExportVideoOptionsForSize:");
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010DEC;
  v14[3] = &unk_100034AC8;
  id v16 = v7;
  id v17 = v4;
  id v15 = v8;
  id v11 = v7;
  id v12 = v4;
  id v13 = v8;
  [WeakRetained exportMovieToURL:v13 options:v9 completionHandler:v14];
}

- (void)sendVideoMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] will send video", buf, 2u);
  }
  [(MessagesViewController *)self updateUIState:6 animated:1];
  uint64_t v3 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
  id v4 = [(NSURL *)self->_stickerFolder path];
  double v5 = +[NSString stringWithFormat:@"/EmojiMovie%d.mov", (int)self->_recordingStartTime];
  uint64_t v6 = [v4 stringByAppendingString:v5];

  id v7 = +[NSURL fileURLWithPath:v6];
  [(MessagesViewController *)self defaultVideoExportDimensions];
  id v8 = -[MessagesViewController defaultExportVideoOptionsForSize:](self, "defaultExportVideoOptionsForSize:");
  double v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"JFDefaults_SaveVideosToCameraRoll"];
  if (v7) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = 0;
  }

  id v29 = (void *)v6;
  if (v11 == 1)
  {
    id v12 = +[NSUserDefaults standardUserDefaults];
    unsigned int v13 = [v12 BOOLForKey:@"JFDefaults_SaveVideosUsingMatte"];
  }
  else
  {
    unsigned int v13 = 0;
  }
  uint64_t v28 = (void *)v3;
  id v14 = +[NSUserDefaults standardUserDefaults];
  id v15 = [v14 objectForKey:@"JFDefaults_SendVideosWithAlpha"];

  if (v15) {
    unsigned int v16 = [v15 BOOLValue];
  }
  else {
    unsigned int v16 = 1;
  }
  if (v13)
  {
    id v17 = [(NSURL *)self->_stickerFolder path];
    unint64_t v18 = +[NSString stringWithFormat:@"/AlphaMatteEmojiMovie%d.mov", (int)self->_recordingStartTime];
    unsigned int v19 = [v17 stringByAppendingString:v18];

    __int16 v20 = +[NSURL fileURLWithPath:v19];
    id v21 = +[NSMutableDictionary dictionaryWithDictionary:v8];
    [v21 setObject:v20 forKeyedSubscript:AVTMovieGenerateAlphaMask];

    id v8 = v21;
    if (!v16) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  __int16 v20 = 0;
  if (v16)
  {
LABEL_16:
    __int16 v22 = +[NSMutableDictionary dictionaryWithDictionary:v8];
    [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:AVTMovieTransparentBackground];

    id v8 = v22;
  }
LABEL_17:
  kdebug_trace();
  [(MessagesViewController *)self beforeExportMovie];
  unsigned int v23 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000113B8;
  block[3] = &unk_100034BE0;
  block[4] = self;
  id v31 = v7;
  id v32 = v8;
  id v33 = v28;
  char v35 = v11;
  id v34 = v20;
  char v36 = v13;
  id v24 = v20;
  id v25 = v28;
  id v26 = v8;
  id v27 = v7;
  dispatch_async(v23, block);
}

- (void)afterExportMovie
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] afterExportMovie", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000120C8;
  block[3] = &unk_100034790;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"JFDefaults_DontExitPreviewOnSend"];

  if (v4)
  {
    [(MessagesViewController *)self updateUIState:5 animated:0];
  }
  else
  {
    [(MessagesViewController *)self updateUIState:3 animated:1];
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000120D0;
    void v6[3] = &unk_100034790;
    v6[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
  self->_exportingMovie = 0;
}

- (void)beforeExportMovie
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] beforeExportMovie", v3, 2u);
  }
  self->_exportingMovie = 1;
  if ([(MessagesViewController *)self isExpanded]) {
    [(MessagesViewController *)self requestPresentationStyle:0];
  }
}

- (void)onEditAvatar:(id)a3
{
  unsigned int v4 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
  if (v4)
  {
    dispatch_time_t v5 = v4;
    if ([v4 isEditable]) {
      [(AVTRecordingCarouselController *)self->_avatarListController presentActionsForAvatar:v5];
    }
  }

  _objc_release_x1();
}

- (void)carouselController:(id)a3 didFocusOnRecordView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_storeWeak((id *)&self->_puppetView, v6);
    [v6 updateInterfaceOrientation];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    [WeakRetained setRecordDelegate:self];

    [(MessagesViewController *)self updateForNewPuppetView];
    [(MessagesViewController *)self resumeFaceTrackingIfNecessary];
  }
  else
  {
    if (self->_UIState == 5) {
      [(MessagesViewController *)self stopPreviewing];
    }
    [(MessagesViewController *)self updateUIState:2 animated:0];
  }
  self->_isUpdatingAvatarMode = 0;
}

- (void)carouselController:(id)a3 didUpdateWithRecord:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v6 identifier];
    [v8 setValue:v9 forKey:@"LastPuppetIdentifier"];
  }
  else
  {
    [v7 removeObjectForKey:@"LastPuppetIdentifier"];
  }

  puppetCollectionViewController = self->_puppetCollectionViewController;
  if (puppetCollectionViewController)
  {
    id v11 = [(PuppetCollectionViewController *)puppetCollectionViewController selectedRecord];

    if (v11 != v6)
    {
      [(PuppetCollectionViewController *)self->_puppetCollectionViewController setSelectedRecord:v6];
      [(PuppetCollectionViewController *)self->_puppetCollectionViewController reloadSelection];
    }
  }
  if (self->_UIState == 3) {
    [(MessagesViewController *)self updateEditButtonVisibilityForceHide:0];
  }
}

- (void)carouselController:(id)a3 willEndFocusOnRecordView:(id)a4
{
  [(MessagesViewController *)self preparePuppetViewForReuse];
  if (!self->_isUpdatingAvatarMode) {
    [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
  }
  p_puppetView = &self->_puppetView;
  id WeakRetained = objc_loadWeakRetained((id *)p_puppetView);
  [WeakRetained setRecordDelegate:0];

  objc_storeWeak((id *)p_puppetView, 0);
}

- (void)carouselController:(id)a3 didMoveTowardRecord:(id)a4 withFactor:(double)a5
{
  id v27 = a3;
  id v8 = a4;
  if (self->_UIState != 3) {
    goto LABEL_42;
  }
  [(MessagesViewController *)self resumeFaceTrackingIfNecessary];
  double v9 = fmin(a5 * 5.0 + -3.0, 1.0);
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  if (v8)
  {
    unsigned int v11 = [v8 isEditable];
    p_userInfoIsBeingOverridden = &self->_userInfoIsBeingOverridden;
  }
  else
  {
    p_userInfoIsBeingOverridden = &self->_userInfoIsBeingOverridden;
    if (self->_userInfoIsBeingOverridden)
    {
      unsigned int v11 = 0;
      goto LABEL_11;
    }
    id v26 = [v27 focusedRecord];

    unsigned int v11 = 0;
    if (a5 < 0.5 && v26) {
      goto LABEL_42;
    }
  }
  if (*p_userInfoIsBeingOverridden)
  {
LABEL_11:
    id v13 = [v27 focusedRecord];

    if (a5 < 0.5 && v13 == v8) {
      goto LABEL_42;
    }
  }
  if (v11)
  {
    [(AVTCircularButton *)self->_editButton alpha];
    if (v10 >= v14) {
      double v14 = v10;
    }
  }
  else
  {
    [(AVTCircularButton *)self->_editButton alpha];
    if (1.0 - v10 < v14) {
      double v14 = 1.0 - v10;
    }
  }
  [(AVTCircularButton *)self->_editButton setAlpha:v14];
  if (v8)
  {
    [(UIView *)self->_recordingButtonSuperview alpha];
    if (v10 >= v15) {
      double v15 = v10;
    }
    [(UIView *)self->_recordingButtonSuperview setAlpha:v15];
    if (*p_userInfoIsBeingOverridden) {
      [(MessagesViewController *)self stopOverridingUserInfoLabelState:1];
    }
    double userInfoAlpha = self->_userInfoAlpha;
    double v17 = 1.0 - v10;
    [(AVTUserInfoView *)self->_userInfoView alpha];
    if (v17 >= v18) {
      double v19 = v18;
    }
    else {
      double v19 = v17;
    }
    if (v17 >= v18) {
      double v18 = v17;
    }
    if (userInfoAlpha <= 0.0) {
      double v18 = v19;
    }
    [(AVTUserInfoView *)self->_userInfoView setAlpha:v18];
  }
  else
  {
    [(UIView *)self->_recordingButtonSuperview alpha];
    if (1.0 - v10 < v20) {
      double v20 = 1.0 - v10;
    }
    [(UIView *)self->_recordingButtonSuperview setAlpha:v20];
    [(AVTUserInfoView *)self->_userInfoView alpha];
    if (v10 >= v21) {
      double v22 = v10;
    }
    else {
      double v22 = v21;
    }
    if (!*p_userInfoIsBeingOverridden || ([(AVTUserInfoView *)self->_userInfoView alpha], v23 != v22))
    {
      id v24 = +[NSBundle mainBundle];
      id v25 = [v24 localizedStringForKey:@"sJFNewMemoji" value:&stru_100035088 table:@"JFStrings"];
      [(MessagesViewController *)self overrideUserInfoLabelStateWithText:v25 alpha:v22];
    }
  }
LABEL_42:
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)significantRecordChangeInDataSource:(id)a3
{
}

- (void)dismissLaunchScreenIfNecessaryForPresentationStyle:(unint64_t)a3 controller:(id)a4
{
  id v6 = a4;
  AVTUISetHasDisplayedAnimojiSplashScreen();
  AVTUISetHasDisplayedAnimojiCameraDisclosureSplashScreen();
  self->_displaysLaunchScreen = 0;
  unsigned int v7 = [(MessagesViewController *)self presentsLaunchScreenInFullScreenModal];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  id v25[2] = sub_100012ACC;
  v25[3] = &unk_100034C30;
  char v26 = v7;
  v25[4] = self;
  v25[5] = &v27;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100012B28;
  v22[3] = &unk_100034C58;
  char v24 = v7;
  id v8 = objc_retainBlock(v25);
  id v23 = v8;
  [(MessagesViewController *)self performWhileOverridingPresentationStyle:a3 block:v22];
  [(MessagesViewController *)self beginObservingFaceTrackingIfNecessary];
  if (v7)
  {
    id v9 = [v6 parentViewController];
    [v9 dismiss];
    if ([(MessagesViewController *)self requestsExpandedOnLaunchScreenDismissal])
    {
      dispatch_time_t v10 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012B54;
      block[3] = &unk_100034790;
      block[4] = self;
      dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    unsigned int v11 = [(MessagesViewController *)self parentMessagesViewController];
    id v12 = [v11 launchViewContainer];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100012B60;
    v17[3] = &unk_100034808;
    id v13 = v6;
    id v18 = v13;
    double v19 = self;
    id v9 = v12;
    id v20 = v9;
    double v14 = objc_retainBlock(v17);
    double v15 = +[LaunchTransitionController controllerForTransitioningBetweenMessagesController:self andLaunchController:v13];
    unsigned int v16 = v15;
    if (*((unsigned char *)v28 + 24)) {
      [v15 performAnimatedTransitionByMovingVideo:v14];
    }
    else {
      [v15 performAnimatedTransitionByFadingSplash:v14];
    }
  }
  _Block_object_dispose(&v27, 8);
}

- (void)launchViewControllerDidConfirm:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] launchViewControllerDidConfirm", v5, 2u);
  }
  [(AVTRecordingCarouselController *)self->_avatarListController setIsPostponingBeginSession:0];
  [(MessagesViewController *)self dismissLaunchScreenIfNecessaryForPresentationStyle:[(MessagesViewController *)self presentationStyle] controller:v4];
}

- (void)launchViewControllerDidCancel:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] launchViewControllerDidCancel", v4, 2u);
  }
  [(MessagesViewController *)self dismiss];
}

- (void)puppetCollectionViewController:(id)a3 didSelectPuppetRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v7 identifier];
    int v18 = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    double v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] puppetCollectionViewController: %@ identifier: %@", (uint8_t *)&v18, 0x16u);
  }
  kdebug_trace();
  [(MessagesViewController *)self resumeFaceTrackingIfNecessary];
  if (v7)
  {
    uint64_t v9 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
    if (!v9
      || (dispatch_time_t v10 = (void *)v9,
          [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord],
          unsigned int v11 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v12 = [v11 isEqual:v7],
          v11,
          v10,
          (v12 & 1) == 0))
    {
      id v13 = +[NSUserDefaults standardUserDefaults];
      double v14 = [v7 identifier];
      [v13 setValue:v14 forKey:@"LastPuppetIdentifier"];

      avatarListController = self->_avatarListController;
      unsigned int v16 = [v7 identifier];
      [(AVTRecordingCarouselController *)avatarListController displayAvatarRecordWithIdentifier:v16 animated:1];

      if (self->_UIState == 5) {
        [(MessagesViewController *)self playPreviewOnce];
      }
    }
  }
  else
  {
    double v17 = +[NSUserDefaults standardUserDefaults];
    [v17 removeObjectForKey:@"LastPuppetIdentifier"];
  }
  kdebug_trace();
}

- (void)puppetCollectionViewControllerDidRequestMemojiLaunch:(id)a3
{
}

- (double)verticalCellSpacingForPuppetCollectionViewController:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    dispatch_time_t v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    double result = 16.0;
    if (v6 != (id)5) {
      return result;
    }
  }
  [(MessagesViewController *)self isLandscapeMode];
  return 20.0;
}

- (double)horizontalCellSpacingForPuppetCollectionViewController:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    dispatch_time_t v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    double result = 16.0;
    if (v6 != (id)5) {
      return result;
    }
  }
  [(MessagesViewController *)self isLandscapeMode];
  return 20.0;
}

- (UIEdgeInsets)contentInsetForPuppetCollectionViewController:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {

LABEL_4:
    [(MessagesViewController *)self isLandscapeMode];
    goto LABEL_5;
  }
  dispatch_time_t v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)5) {
    goto LABEL_4;
  }
LABEL_5:
  double v7 = 16.0;
  double v8 = 16.0;
  double v9 = 16.0;
  double v10 = 16.0;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (int)widthExtent
{
  unsigned int v3 = [(MessagesViewController *)self isLandscapeMode];
  id v4 = [(MessagesViewController *)self view];
  dispatch_time_t v5 = [v4 window];
  [v5 bounds];
  double Width = CGRectGetWidth(v25);

  double v7 = +[UIScreen mainScreen];
  [v7 _referenceBounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  uint64_t v16 = v9;
  uint64_t v17 = v11;
  uint64_t v18 = v13;
  uint64_t v19 = v15;
  if (v3)
  {
    double v20 = Width / CGRectGetHeight(*(CGRect *)&v16);
    if (fabs(v20 + -1.0) <= 0.05) {
      return 0;
    }
    if (fabs(v20 + -0.75) <= 0.05) {
      return 1;
    }
    if (fabs(v20 + -0.5) <= 0.05) {
      return 2;
    }
    BOOL v21 = fabs(v20 + -0.25) > 0.05;
    int v22 = 3;
  }
  else
  {
    double v23 = Width / CGRectGetWidth(*(CGRect *)&v16);
    if (fabs(v23 + -1.0) <= 0.05) {
      return 4;
    }
    if (fabs(v23 + -0.6) <= 0.05) {
      return 5;
    }
    BOOL v21 = fabs(v23 + -0.36) > 0.05;
    int v22 = 6;
  }
  if (v21) {
    return 7;
  }
  else {
    return v22;
  }
}

- (int64_t)puppetsPerRow
{
  unsigned int v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)1)
  {
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    id v5 = [v4 userInterfaceIdiom];

    if (v5 != (id)5) {
      return 4;
    }
  }
  unsigned int v6 = [(MessagesViewController *)self widthExtent];
  if (v6 < 7) {
    return qword_100031A48[v6];
  }
  uint64_t v8 = [(MessagesViewController *)self view];
  uint64_t v9 = [v8 window];
  [v9 bounds];
  int64_t v7 = (uint64_t)(CGRectGetWidth(v11) / 100.0);

  return v7;
}

- (double)widthScaleFactor
{
  unsigned int v3 = [(MessagesViewController *)self isLandscapeMode];
  id v4 = [(MessagesViewController *)self view];
  id v5 = [v4 window];
  [v5 bounds];
  double Width = CGRectGetWidth(v22);

  int64_t v7 = +[UIScreen mainScreen];
  [v7 _referenceBounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  uint64_t v16 = v9;
  uint64_t v17 = v11;
  uint64_t v18 = v13;
  uint64_t v19 = v15;
  if (v3) {
    double Height = CGRectGetHeight(*(CGRect *)&v16);
  }
  else {
    double Height = CGRectGetWidth(*(CGRect *)&v16);
  }
  return Width / Height;
}

- (double)carouselHeight
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];
  if (v5 != (id)1)
  {
    char v2 = +[UIDevice currentDevice];
    if ([v2 userInterfaceIdiom] != (id)5)
    {
      BOOL v10 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  unsigned int v6 = [(MessagesViewController *)self view];
  [v6 bounds];
  if (v7 <= 400.0)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v8 = [(MessagesViewController *)self view];
    uint64_t v9 = [v8 traitCollection];
    BOOL v10 = [v9 horizontalSizeClass] == (id)2
       || [(MessagesViewController *)self presentationStyle] == 0;
  }
  if (v5 != (id)1) {
    goto LABEL_11;
  }
LABEL_12:

  unsigned int v11 = [(MessagesViewController *)self isSpeculatingLayout];
  if ((id)[(MessagesViewController *)self presentationStyle] != (id)1)
  {
    if (v11)
    {
      uint64_t v19 = &__NSArray0__struct;
      if (!v10) {
        goto LABEL_25;
      }
      goto LABEL_30;
    }
    double v23 = [(MessagesViewController *)self view];
    char v24 = [v23 window];

    CGRect v25 = [v24 _rootSheetPresentationController];
    uint64_t v19 = [v25 _detentValues];
    if ((unint64_t)[v19 count] <= 1)
    {

      if (v10) {
        goto LABEL_30;
      }
    }
    else
    {
      char v26 = [v19 objectAtIndexedSubscript:1];
      [v26 doubleValue];
      double v28 = v27;

      if (v28 != UISheetPresentationControllerDetentInactive)
      {
        id v34 = [(MessagesViewController *)self view];
        [v34 safeAreaInsets];
        double v36 = v35;

        id v37 = [v19 objectAtIndexedSubscript:1];
        [v37 doubleValue];
        double v16 = v38 - v36;

        goto LABEL_42;
      }
      if (v10)
      {
LABEL_30:
        unsigned int v29 = [(MessagesViewController *)self isLandscapeMode];
        char v30 = +[UIScreen mainScreen];
        [v30 _referenceBounds];
        double v32 = v31;

        if (v29)
        {
          if (v32 > 1194.0)
          {
            double v16 = 406.0;
LABEL_42:

            return v16;
          }
          *(double *)&uint64_t v33 = 336.0;
        }
        else
        {
          if (v32 > 1194.0)
          {
            double v16 = 311.0;
            goto LABEL_42;
          }
          *(double *)&uint64_t v33 = 248.0;
        }
        double v16 = *(double *)&v33;
        goto LABEL_42;
      }
    }
LABEL_25:
    double v20 = +[UIScreen mainScreen];
    [v20 _referenceBounds];
    double v22 = v21;

    if (v22 <= 812.0) {
      double v16 = 233.0;
    }
    else {
      double v16 = 243.0;
    }
    goto LABEL_42;
  }
  if (v10) {
    double v12 = 480.0;
  }
  else {
    double v12 = 292.0;
  }
  uint64_t v13 = +[UIScreen mainScreen];
  [v13 _referenceBounds];
  double v15 = v14;

  if (v15 <= 812.0) {
    double v16 = v12;
  }
  else {
    double v16 = 311.0;
  }
  if (((v11 | !v10) & 1) == 0)
  {
    [(MessagesViewController *)self widthScaleFactor];
    double v18 = v16 * v17;
    if (v16 * 0.65 >= v18) {
      return v16 * 0.65;
    }
    else {
      return v18;
    }
  }
  return v16;
}

- (void)updatePuppetCollectionViewIfNecessary
{
  if (self->_puppetCollectionViewController)
  {
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setPuppetsPerRow:[(MessagesViewController *)self puppetsPerRow]];
    [(MessagesViewController *)self updatePaddleViewLayoutIfNecessary];
  }
}

- (void)updatePuppetCollectionViewWithCurrentFocusedRecordIfNecessary
{
  if (self->_puppetCollectionViewController)
  {
    id v3 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
    [(PuppetCollectionViewController *)self->_puppetCollectionViewController setSelectedRecord:v3];
    [(MessagesViewController *)self updatePuppetCollectionViewIfNecessary];
  }
}

- (void)recordView:(id)a3 previewDidChangeStatus:(int64_t)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordView:previewDidChangeStatus", buf, 2u);
  }
  if (a4 == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] AVTPuppetPreviewStatusDidFinishPlaying", v7, 2u);
    }
    [(MessagesViewController *)self fadeIn:self->_replayMessageButton];
  }
  else if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] AVTPuppetPreviewStatusDidStartPlaying", v8, 2u);
    }
    [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
  }
  self->_lastPreviewStatus = a4;
}

- (void)recordView:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] ARSession didFailWithError", v18, 2u);
  }
  self->_arSessionState = 2;
  [(NSTimer *)self->_trackingLostTimer invalidate];
  trackingLostTimer = self->_trackingLostTimer;
  self->_trackingLostTimer = 0;

  [(NSTimer *)self->_trackingStartTimer invalidate];
  trackingStartTimer = self->_trackingStartTimer;
  self->_trackingStartTimer = 0;

  uint64_t v13 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v14 = [v13 BOOLForKey:@"JFDefaults_NeverDisableRecordButton"];

  if ((v14 & 1) == 0) {
    [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
  }
  unint64_t UIState = self->_UIState;
  if (UIState == 3) {
    goto LABEL_8;
  }
  if (UIState == 4)
  {
    [(MessagesViewController *)self stopRecordingAndPlayPreview:0];
    [(MessagesViewController *)self discardRecording];
LABEL_8:
    double v16 = +[NSBundle mainBundle];
    double v17 = [v16 localizedStringForKey:@"sJFARSessionFailed" value:&stru_100035088 table:@"JFStrings"];
    [(MessagesViewController *)self pauseFaceTrackingWithReason:v17];
  }
}

- (void)recordView:(id)a3 sessionWasInterrupted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sessionWasInterrupted", v15, 2u);
  }
  self->_arSessionState = 3;
  [(NSTimer *)self->_trackingLostTimer invalidate];
  trackingLostTimer = self->_trackingLostTimer;
  self->_trackingLostTimer = 0;

  [(NSTimer *)self->_trackingStartTimer invalidate];
  trackingStartTimer = self->_trackingStartTimer;
  self->_trackingStartTimer = 0;

  id v10 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v11 = [v10 BOOLForKey:@"JFDefaults_NeverDisableRecordButton"];

  if ((v11 & 1) == 0) {
    [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
  }
  unint64_t UIState = self->_UIState;
  if (UIState == 3) {
    goto LABEL_8;
  }
  if (UIState == 4)
  {
    [(MessagesViewController *)self stopRecordingAndPlayPreview:0];
    [(MessagesViewController *)self discardRecording];
LABEL_8:
    uint64_t v13 = +[NSBundle mainBundle];
    unsigned __int8 v14 = [v13 localizedStringForKey:@"sJFARSessionWasInterrupted" value:&stru_100035088 table:@"JFStrings"];
    [(MessagesViewController *)self showUserInfoLabelWithText:v14];
  }
  [(MessagesViewController *)self addInternalARSessionObserverIfNecessary];
}

- (void)recordView:(id)a3 sessionInterruptionEnded:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sessionInterruptionEnded", v5, 2u);
  }
  [(MessagesViewController *)self handleInterruptionEnded];
}

- (void)handleInterruptionEnded
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] handleInterruptionEnded", v6, 2u);
  }
  [(MessagesViewController *)self removeInternalARSessionObserverIfNecessary];
  [(MessagesViewController *)self updateARSessionStateResettingState:1];
  if (self->_arSessionState)
  {
    [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)&self->_puppetView);
      if ([v4 faceIsTracked])
      {
        id v5 = objc_loadWeakRetained((id *)&self->_puppetView);
        -[AVTRecordingButton setEnabled:](self->_recordingButton, "setEnabled:", [v5 faceIsFullyActive]);
      }
      else
      {
        [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
      }
    }
    else
    {
      [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
    }
  }
  if (self->_UIState - 3 <= 1)
  {
    [(MessagesViewController *)self hideUserInfoLabel];
    [(MessagesViewController *)self startTrackingStartTimerWithCounter:3];
  }
}

- (void)addInternalARSessionObserverIfNecessary
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observingSession);
    int v7 = 138412290;
    id v8 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] addInternalARSessionObserverIfNecessary observing %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_observingSession);

  if (!v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_puppetView);
    id v6 = [v5 arSession];

    if (v6)
    {
      [v6 _addObserver:self];
      objc_storeWeak((id *)&self->_observingSession, v6);
    }
  }
}

- (void)removeInternalARSessionObserverIfNecessary
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observingSession);
    int v7 = 138412290;
    id v8 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] removeInternalARSessionObserverIfNecessary observing %@", (uint8_t *)&v7, 0xCu);
  }
  p_observingSession = &self->_observingSession;
  id v5 = objc_loadWeakRetained((id *)&self->_observingSession);

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_observingSession);
    [v6 _removeObserver:self];

    objc_storeWeak((id *)p_observingSession, 0);
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] session didChangeState %lu", buf, 0xCu);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000141F4;
  void v6[3] = &unk_1000348D0;
  v6[4] = self;
  void v6[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)updateARSessionStateResettingState:(BOOL)a3
{
  if (a3) {
    self->_arSessionState = 5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  if (WeakRetained
    || ([(AVTRecordingCarouselController *)self->_avatarListController focusedRecordingView],
        (id WeakRetained = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (self->_arSessionState == 5)
    {
      id v8 = WeakRetained;
      id v5 = [WeakRetained arSession];
      id v6 = [v5 state];

      if (v6)
      {
        if (v6 == (id)2)
        {
          unint64_t v7 = 3;
        }
        else
        {
          id WeakRetained = v8;
          if (v6 != (id)1)
          {
            unint64_t v7 = 5;
            goto LABEL_14;
          }
          unint64_t v7 = [v8 faceIsTracked] ^ 1;
        }
      }
      else
      {
        unint64_t v7 = 4;
      }
      id WeakRetained = v8;
LABEL_14:
      self->_arSessionState = v7;
    }
  }
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] presentAvatarViewController:animated:", buf, 2u);
  }
  if (self->_UIState == 5) {
    goto LABEL_15;
  }
  id v6 = +[AVTUIControllerPresentation pendingGlobalPresentation];

  if (!v6)
  {
    +[AVTUIControllerPresentation setPendingGlobalPresentation:v5];
    [(MessagesViewController *)self requestPresentationStyle:3];
    goto LABEL_12;
  }
  if (self->_UIState == 5)
  {
LABEL_15:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      unint64_t v7 = "[Jellyfish] ignoring presentAvatarViewController:animated: since we are recording or confirming send";
      id v8 = (uint8_t *)&v10;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = 0;
    unint64_t v7 = "[Jellyfish] ignoring presentAvatarViewController:animated: since we already have a pending presentation";
    id v8 = (uint8_t *)&v9;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] dismissAvatarViewControllerAnimated:", buf, 2u);
  }
  if (!self->_isDismissingAvatarUIController)
  {
    self->_isDismissingAvatarUIController = 1;
    [(MessagesViewController *)self updatePuppetCollectionViewIfNecessary];
    id v4 = +[AVTUIControllerPresentation pendingGlobalPresentation];
    id v5 = [v4 modalMessagesController];
    [v5 dismiss];

    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001458C;
    block[3] = &unk_100034790;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateUIState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v48 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] updateUIState (%lu)", buf, 0xCu);
  }
  [(UIView *)self->_carouselView setUserInteractionEnabled:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
  [WeakRetained setUserInteractionEnabled:1];

  unint64_t v8 = [(MessagesViewController *)self presentationStyle];
  self->_unint64_t UIState = a3;
  switch(a3)
  {
    case 0uLL:
      __int16 v9 = [(MessagesViewController *)self parentMessagesViewController];
      __int16 v10 = [v9 messagesViewContainer];
      [v10 setAlpha:0.0];

      unsigned __int8 v11 = [(MessagesViewController *)self parentMessagesViewController];
      double v12 = [v11 launchViewContainer];
      [v12 setAlpha:0.0];

      id v13 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
      [v13 setAlpha:0.0];

      [(UIView *)self->_carouselView setAlpha:0.0];
      [(MessagesViewController *)self updateTapToRadarVisibilityForceHide:1];
      [(MessagesViewController *)self updateEditButtonVisibilityForceHide:1];
      [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView setAlpha:0.0];
      [(UIView *)self->_recordingButtonSuperview setAlpha:0.0];
      [(AVTCircularButton *)self->_cancelSendingMessageButton setAlpha:0.0];
      [(UIButton *)self->_replayMessageButton setAlpha:0.0];
      return;
    case 1uLL:
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100014DFC;
      v46[3] = &unk_100034790;
      v46[4] = self;
      char v24 = (void ***)v46;
      goto LABEL_12;
    case 2uLL:
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100014E94;
      v45[3] = &unk_100034790;
      v45[4] = self;
      [(MessagesViewController *)self performWithFadeAnimation:v45 enabled:1];
      [(MessagesViewController *)self fadeOut:self->_recordingButtonSuperview];
      [(MessagesViewController *)self fadeOut:self->_cancelSendingMessageButton];
      [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
      [(MessagesViewController *)self fadeOut:self->_recordingTimeDisplayView];
      [(MessagesViewController *)self fadeOut:self->_userInfoView];
      return;
    case 3uLL:
      unint64_t v14 = v8;
      [(AVTRecordingButton *)self->_recordingButton setUIState:0];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100014EA0;
      v44[3] = &unk_100034790;
      void v44[4] = self;
      [(MessagesViewController *)self performWithFadeAnimation:v44 enabled:v4];
      double v15 = [(MessagesViewController *)self parentMessagesViewController];
      double v16 = [v15 launchViewContainer];
      double v17 = v16;
      if (v4)
      {
        [(MessagesViewController *)self fadeIn:v16];

        double v18 = [(MessagesViewController *)self parentMessagesViewController];
        uint64_t v19 = [v18 messagesViewContainer];
        [(MessagesViewController *)self fadeIn:v19];

        [(MessagesViewController *)self fadeIn:self->_carouselView];
        id v20 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
        if (v14 == 1) {
          [(MessagesViewController *)self fadeIn:v20];
        }
        else {
          [(MessagesViewController *)self fadeOut:v20];
        }

        [(MessagesViewController *)self fadeIn:self->_recordingButtonSuperview];
        [(MessagesViewController *)self fadeOut:self->_cancelSendingMessageButton];
        [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
        [(MessagesViewController *)self fadeOut:self->_recordingTimeDisplayView];
      }
      else
      {
        double v29 = 1.0;
        [v16 setAlpha:1.0];

        char v30 = [(MessagesViewController *)self parentMessagesViewController];
        double v31 = [v30 messagesViewContainer];
        [v31 setAlpha:1.0];

        [(UIView *)self->_carouselView setAlpha:1.0];
        if (v14 != 1) {
          double v29 = 0.0;
        }
        id v32 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
        [v32 setAlpha:v29];

        [(UIView *)self->_recordingButtonSuperview setAlpha:1.0];
        [(AVTCircularButton *)self->_cancelSendingMessageButton setAlpha:0.0];
        [(UIButton *)self->_replayMessageButton setAlpha:0.0];
        [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView setAlpha:0.0];
      }
      double v22 = self;
      uint64_t v23 = 1;
      goto LABEL_21;
    case 4uLL:
      [(AVTRecordingButton *)self->_recordingButton setUIState:1];
      [(UIView *)self->_carouselView setUserInteractionEnabled:0];
      id v21 = objc_loadWeakRetained((id *)&self->_puppetCollectionViewContainer);
      [v21 setUserInteractionEnabled:0];

      [(MessagesViewController *)self fadeIn:self->_recordingTimeDisplayView];
      [(MessagesViewController *)self fadeIn:self->_recordingButtonSuperview];
      [(MessagesViewController *)self fadeOut:self->_cancelSendingMessageButton];
      [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100014EE4;
      v43[3] = &unk_100034790;
      v43[4] = self;
      [(MessagesViewController *)self performWithFadeAnimation:v43 enabled:v4];
      double v22 = self;
      uint64_t v23 = 0;
LABEL_21:
      [(MessagesViewController *)v22 setAllowsCreate:v23 animated:v4];
      return;
    case 5uLL:
      [(AVTRecordingButton *)self->_recordingButton setUIState:2];
      [(MessagesViewController *)self fadeIn:self->_cancelSendingMessageButton];
      [(MessagesViewController *)self fadeIn:self->_recordingButtonSuperview];
      [(MessagesViewController *)self fadeOut:self->_recordingTimeDisplayView];
      [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
      [(MessagesViewController *)self hideUserInfoLabel];
      double v38 = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_100014EF0;
      id v41 = &unk_100034790;
      v42 = self;
      char v24 = &v38;
LABEL_12:
      CGRect v25 = self;
      uint64_t v26 = v4;
      goto LABEL_14;
    case 6uLL:
      [(AVTRecordingButton *)self->_recordingButton setUIState:3];
      [(MessagesViewController *)self fadeIn:self->_recordingButtonSuperview];
      [(MessagesViewController *)self fadeOut:self->_cancelSendingMessageButton];
      [(MessagesViewController *)self fadeOut:self->_replayMessageButton];
      double v27 = +[NSBundle mainBundle];
      double v28 = [v27 localizedStringForKey:@"sJFSendingVideoMessage" value:&stru_100035088 table:@"JFStrings"];
      [(MessagesViewController *)self showUserInfoLabelWithText:v28];

      uint64_t v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      double v35 = sub_100014EFC;
      double v36 = &unk_100034790;
      id v37 = self;
      char v24 = &v33;
      CGRect v25 = self;
      uint64_t v26 = 1;
LABEL_14:
      -[MessagesViewController performWithFadeAnimation:enabled:](v25, "performWithFadeAnimation:enabled:", v24, v26, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42);
      break;
    default:
      return;
  }
}

- (void)handleResumeTrackingTap:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] handleResumeTrackingTap", v4, 2u);
  }
  [(MessagesViewController *)self resumeFaceTrackingIfNecessary];
}

- (void)resumeFaceTrackingIfNecessary
{
  if (self->_resumeTrackingTapGestureRecognizer)
  {
    -[UIView removeGestureRecognizer:](self->_carouselView, "removeGestureRecognizer:");
    resumeTrackingTapGestureRecognizer = self->_resumeTrackingTapGestureRecognizer;
    self->_resumeTrackingTapGestureRecognizer = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else
  {
    id v6 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecordingView];
  }
  id v11 = v6;

  if (([v11 faceTrackingIsPaused] & 1) != 0 || self->_arSessionState == 4)
  {
    [v11 setFaceTrackingPaused:0];
    [(AVTUsageTrackingSession *)self->_usageTrackingSession didResumeFaceTracking];
    [(MessagesViewController *)self updateARSessionStateResettingState:1];
    unint64_t arSessionState = self->_arSessionState;
    if (arSessionState)
    {
      if (arSessionState != 4 || v11 == 0) {
        goto LABEL_18;
      }
    }
    else if (!v11)
    {
      id v11 = 0;
      goto LABEL_21;
    }
    if (([v11 faceIsTracked] & 1) == 0)
    {
      self->_unint64_t arSessionState = 1;
      [(MessagesViewController *)self startTrackingLostTimer];
    }
LABEL_18:
    if (self->_arSessionState)
    {
      [(MessagesViewController *)self changeUserInfoLabelForTrackingState];
LABEL_22:
      if (self->_arSessionState == 3)
      {
        __int16 v9 = +[NSUserDefaults standardUserDefaults];
        unsigned __int8 v10 = [v9 BOOLForKey:@"JFDefaults_NeverDisableRecordButton"];

        if ((v10 & 1) == 0) {
          [(AVTRecordingButton *)self->_recordingButton setEnabled:0];
        }
      }
      goto LABEL_25;
    }
LABEL_21:
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:1];
    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setEnabled:1];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setEnabled:1];
    [(MessagesViewController *)self hideUserInfoLabel];
    [(MessagesViewController *)self startTrackingStartTimerWithCounter:3];
    goto LABEL_22;
  }
LABEL_25:
}

- (void)handleSceneShortPress:(id)a3
{
  id v4 = a3;
  if ([(MessagesViewController *)self canPeelSticker])
  {
    self->_isMakingSticker = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] handleSceneShortPress", buf, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    id v6 = [WeakRetained superview];
    [v4 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    id v11 = objc_loadWeakRetained((id *)&self->_puppetView);
    [v11 center];
    double v13 = v12;
    double v15 = v14;

    double v16 = sqrt((v10 - v15) * (v10 - v15) + (v8 - v13) * (v8 - v13));
    if (([(MessagesViewController *)self presentationStyle] || v16 <= 100.0)
      && (![(MessagesViewController *)self isExpanded] || v16 <= 160.0))
    {
      id v17 = objc_loadWeakRetained((id *)&self->_puppetView);
      double v18 = [v17 superview];
      [(UIView *)self->_recordingButtonSuperview center];
      double v20 = v19;
      double v22 = v21;
      id v23 = objc_loadWeakRetained((id *)&self->_puppetView);
      char v24 = [v23 superview];
      [v18 convertPoint:v24 toView:v20];
      double v26 = v25;
      double v28 = v27;

      if (sqrt((v10 - v28) * (v10 - v28) + (v8 - v26) * (v8 - v26)) >= 40.0 && [v4 state] == (id)3)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000153CC;
        v29[3] = &unk_100034A28;
        v29[4] = self;
        [(MessagesViewController *)self conditionallyPerformWithDisclosureAlertForSendingMessageWithConfirmTitle:@"Send" result:v29];
      }
    }
    else
    {
      self->_isMakingSticker = 0;
    }
  }
}

- (void)handleSceneLongPress:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] handleSceneLongPress", buf, 2u);
  }
  if ([v4 state] == (id)1)
  {
    if ([(MessagesViewController *)self shouldShowDisclosureAlertForSendingMessage])
    {
      [v4 setEnabled:0];
      [v4 setEnabled:1];
      [(MessagesViewController *)self showAlertForDisclosureWarningWithConfirmTitle:@"OK" completionBlock:0];
    }
    else if ([(MessagesViewController *)self canPeelSticker])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sticker peeled", buf, 2u);
      }
      editButton = self->_editButton;
      v61[0] = self->_recordingButton;
      v61[1] = editButton;
      double v14 = +[NSArray arrayWithObjects:v61 count:2];
      double v15 = [(MessagesViewController *)self setRestorableValue:&__kCFBooleanFalse forKeyPath:@"enabled" onViews:v14];

      dispatch_time_t v16 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016234;
      block[3] = &unk_100034D20;
      id v59 = v15;
      id v17 = v4;
      id v57 = v17;
      v58 = self;
      id v50 = v15;
      dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
      [(AVTUserInfoView *)self->_userInfoView setHidden:1];
      double v18 = [(MessagesViewController *)self stickerUsingLargeSticker:0];
      id v19 = objc_alloc((Class)MSStickerView);
      double y = CGPointZero.y;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
      [WeakRetained bounds];
      double v22 = (MSStickerView *)[v19 initWithFrame:v18 sticker:CGPointZero.x, y];

      id v23 = +[UIColor clearColor];
      [(MSStickerView *)v22 setBackgroundColor:v23];

      [(MSStickerView *)v22 setUserInteractionEnabled:0];
      char v24 = [(MessagesViewController *)self view];
      [v24 addSubview:v22];

      [(MSStickerView *)v22 sizeToFit];
      [(MSStickerView *)v22 frame];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      id v33 = objc_loadWeakRetained((id *)&self->_puppetView);
      [v33 frame];
      double Width = CGRectGetWidth(v62);

      id v35 = objc_loadWeakRetained((id *)&self->_puppetView);
      [v35 frame];
      double Height = CGRectGetHeight(v63);

      if (Width < Height) {
        double Height = Width;
      }
      v64.origin.x = v26;
      v64.origin.double y = v28;
      v64.size.double width = v30;
      v64.size.double height = v32;
      double v37 = CGRectGetWidth(v64);
      v65.origin.x = v26;
      v65.origin.double y = v28;
      v65.size.double width = v30;
      v65.size.double height = v32;
      double v38 = CGRectGetHeight(v65);
      if (v37 < v38) {
        double v38 = v37;
      }
      -[MSStickerView setFrame:](v22, "setFrame:", v26, v28, v30 * (Height / v38), v32 * (Height / v38), v50);
      uint64_t v39 = [(MSStickerView *)v22 superview];
      id v40 = objc_loadWeakRetained((id *)&self->_puppetView);
      [v40 center];
      double v42 = v41;
      double v44 = v43;
      id v45 = objc_loadWeakRetained((id *)&self->_puppetView);
      v46 = [v45 superview];
      [v39 convertPoint:v46 fromView:v42];
      -[MSStickerView setCenter:](v22, "setCenter:");

      id v47 = objc_loadWeakRetained((id *)&self->_puppetView);
      [v47 setAlpha:0.0];

      unint64_t v48 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
      [(AVTUsageTrackingSession *)self->_usageTrackingSession didSendStickerWithAvatar:v48];
      [(MSStickerView *)v22 layoutIfNeeded];
      [(MSStickerView *)v22 handleLongPress:v17];
      stickerView = self->_stickerView;
      self->_stickerView = v22;
    }
  }
  else if ([v4 state] == (id)3 {
         || [v4 state] == (id)5
  }
         || [v4 state] == (id)4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] sticker dropped on transcript", buf, 2u);
    }
    id v5 = self->_stickerView;
    if (v5)
    {
      id v6 = v5;
      double v7 = [(AVTRecordingCarouselController *)self->_avatarListController view];
      [v7 center];
      -[MSStickerView setCenter:](v6, "setCenter:");

      double v8 = self->_stickerView;
      self->_stickerView = 0;

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10001633C;
      v54[3] = &unk_100034AF0;
      v54[4] = self;
      v55 = v6;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_100016398;
      v52[3] = &unk_100034D48;
      v52[4] = self;
      double v9 = v55;
      v53 = v9;
      +[UIView animateWithDuration:0 delay:v54 options:v52 animations:0.3 completion:0.85];
      id v10 = objc_retainBlock(self->_stickerHiddenViewsRestorationBlock);
      id stickerHiddenViewsRestorationBlock = self->_stickerHiddenViewsRestorationBlock;
      self->_id stickerHiddenViewsRestorationBlock = 0;

      if (v10)
      {
        dispatch_time_t v12 = dispatch_time(0, 1000000000);
        dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v10);
      }
    }
  }
}

- (void)playPreviewOnce
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] playPreviewOnce", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained playPreviewOnce];
}

- (void)stopPreviewing
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] stopPreviewing", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained stopPreviewing];
}

- (void)handleRecordingButtonTouchUp:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] handleRecordingButtonTouchUp", v8, 2u);
  }
  unint64_t UIState = self->_UIState;
  switch(UIState)
  {
    case 3uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
      unsigned int v7 = [WeakRetained faceIsTracked];

      if (v7)
      {
        [(MessagesViewController *)self recordingWillStart];
        [(MessagesViewController *)self updateUIState:4 animated:1];
        [(MessagesViewController *)self updateRecording];
        break;
      }
      unint64_t UIState = self->_UIState;
      break;
    case 5uLL:
      [(MessagesViewController *)self onConfirmSendingMessage:v4];
      break;
    case 4uLL:
      [(MessagesViewController *)self stopRecordingAndPlayPreview:1];
      break;
  }
}

- (void)recordingButtonDidStartLongPress:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingButtonDidStartLongPress", v7, 2u);
  }
  if (self->_UIState == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    unsigned int v6 = [WeakRetained faceIsTracked];

    if (v6)
    {
      [(MessagesViewController *)self recordingWillStart];
      [(MessagesViewController *)self updateUIState:4 animated:1];
      [(MessagesViewController *)self updateRecording];
    }
  }
}

- (void)recordingButton:(id)a3 didEndLongPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingButtonDidEndLongPress cancelled:%d", (uint8_t *)v7, 8u);
  }
  if (self->_UIState == 4)
  {
    [(AVTRecordingButton *)self->_recordingButton cancelTrackingWithEvent:0];
    if (v4)
    {
      [(MessagesViewController *)self stopRecordingAndPlayPreview:0];
      [(MessagesViewController *)self discardRecording];
    }
    else
    {
      [(MessagesViewController *)self stopRecordingAndPlayPreview:1];
    }
  }
}

- (void)updateRecording
{
  if (self->_recording)
  {
    [(NSTimer *)self->_recordTimer invalidate];
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"JFDefaults_DisableRecordingTimer"];

    if (v4)
    {
      recordingTimeDisplayView = self->_recordingTimeDisplayView;
      [(RecordingTimeDisplayView *)recordingTimeDisplayView setHidden:1];
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      _DWORD v8[2] = sub_1000168FC;
      v8[3] = &unk_100034D70;
      v8[4] = self;
      id v6 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v8 block:0.0166666667];
      recordTimer = self->_recordTimer;
      self->_recordTimer = v6;
    }
  }
}

- (void)stopRecordingAndPlayPreview:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] stopRecording", v6, 2u);
  }
  [(NSTimer *)self->_recordTimer invalidate];
  recordTimer = self->_recordTimer;
  self->_recordTimer = 0;

  [(MessagesViewController *)self recordingDidFinish:v3];
}

- (void)updateRecordingTime
{
  if (self->_recordingElapsedTime <= 30.0) {
    double recordingElapsedTime = self->_recordingElapsedTime;
  }
  else {
    double recordingElapsedTime = 30.0;
  }
  id v11 = objc_alloc_init((Class)NSDateComponentsFormatter);
  [v11 setUnitsStyle:0];
  [v11 setAllowedUnits:192];
  [v11 setZeroFormattingBehavior:0x10000];
  unsigned __int8 v4 = [v11 stringFromTimeInterval:(double)(60 * ((int)recordingElapsedTime / 60) - (int)recordingElapsedTime + 30)];
  id v5 = [v4 substringWithRange:0, 1];
  id v6 = [v4 substringWithRange:0, 2];
  unsigned int v7 = [v5 stringByAppendingString:v5];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView timerLabel];
    [v9 setText:v4];
  }
  else
  {
    double v9 = [v5 stringByAppendingString:v4];
    id v10 = [(RecordingTimeDisplayView *)self->_recordingTimeDisplayView timerLabel];
    [v10 setText:v9];
  }
  if (self->_recording && recordingElapsedTime == 30.0) {
    [(MessagesViewController *)self stopRecordingAndPlayPreview:1];
  }
}

- (id)retargetableSpringBehavior
{
  id v2 = objc_alloc_init((Class)UIViewSpringAnimationBehavior);

  return v2;
}

- (BOOL)shouldZoomWhileRecording
{
  id v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (void)disableIdleTimer
{
  if (!self->_idleTimerAssertion)
  {
    BOOL v3 = +[ITIdleTimerState sharedInstance];
    id v8 = 0;
    unsigned __int8 v4 = (BSInvalidatable *)[v3 newAssertionToDisableIdleTimerForReason:@"RecordingAnimojiClip" error:&v8];
    id v5 = v8;
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v4;

    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = [v5 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] disableIdleTimer: Failed to disable idle timer with error %@", buf, 0xCu);
      }
    }
  }
}

- (void)restoreIdleTimer
{
  idleTimerAssertion = self->_idleTimerAssertion;
  if (idleTimerAssertion)
  {
    [(BSInvalidatable *)idleTimerAssertion invalidate];
    unsigned __int8 v4 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;
  }
}

- (void)recordingWillStart
{
  self->_recording = 1;
  self->_double recordingElapsedTime = 0.0;
  self->_int recordingStartTime = CFAbsoluteTimeGetCurrent();
  recordingDisableTimerBlock = (void (**)(void))self->_recordingDisableTimerBlock;
  if (recordingDisableTimerBlock)
  {
    recordingDisableTimerBlock[2]();
    id v4 = self->_recordingDisableTimerBlock;
    self->_recordingDisableTimerBlock = 0;
  }
  [(MessagesViewController *)self disableIdleTimer];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int recordingStartTime = (int)self->_recordingStartTime;
    *(_DWORD *)buf = 67109120;
    int v13 = recordingStartTime;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingWillStart: %d", buf, 8u);
  }
  [(MessagesViewController *)self setSingleAvatarMode:1 animated:1];
  id v6 = +[NSUserDefaults standardUserDefaults];
  if ([v6 BOOLForKey:@"JFDefaults_ShouldLogFacetracking"])
  {
    videoLoggingFolder = self->_videoLoggingFolder;

    if (!videoLoggingFolder) {
      goto LABEL_9;
    }
    id v6 = [(MessagesViewController *)self faceTrackingRecordingURL];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
    [WeakRetained setFaceTrackingRecordingURL:v6];
  }
LABEL_9:
  id v9 = objc_loadWeakRetained((id *)&self->_puppetView);
  [v9 startRecording];

  if ([(MessagesViewController *)self shouldZoomWhileRecording])
  {
    id v10 = [(MessagesViewController *)self retargetableSpringBehavior];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017014;
    v11[3] = &unk_100034790;
    v11[4] = self;
    +[UIView _animateUsingSpringBehavior:v10 tracking:0 animations:v11 completion:0];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingDidStart", buf, 2u);
  }
}

- (void)recordingDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingWillFinish", buf, 2u);
  }
  self->_recording = 0;
  if ([(MessagesViewController *)self shouldZoomWhileRecording])
  {
    id v5 = [(MessagesViewController *)self retargetableSpringBehavior];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000172EC;
    v12[3] = &unk_100034790;
    v12[4] = self;
    +[UIView _animateUsingSpringBehavior:v5 tracking:0 animations:v12 completion:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained stopRecording];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] recordingDidFinish", buf, 2u);
  }
  [(MessagesViewController *)self setSingleAvatarMode:[(MessagesViewController *)self isExpanded] animated:1];
  [(MessagesViewController *)self restoreIdleTimer];
  unsigned int v7 = +[NSUserDefaults standardUserDefaults];
  unsigned int v8 = [v7 BOOLForKey:@"JFDefaults_SaveLogVideosToCameraRoll"];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_puppetView);
    id v10 = [v9 faceTrackingRecordingURL];

    if (v10)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100017350;
      v11[3] = &unk_100034D98;
      v11[4] = self;
      +[PHPhotoLibrary requestAuthorization:v11];
    }
  }
  [(AVTUsageTrackingSession *)self->_usageTrackingSession didRecordVideo];
  if (v3)
  {
    [(MessagesViewController *)self playPreviewOnce];
    [(MessagesViewController *)self updateUIState:5 animated:1];
  }
}

- (BOOL)canPeelSticker
{
  p_puppetView = &self->_puppetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  if ([WeakRetained faceIsTracked] && !self->_recording)
  {
    id v7 = objc_loadWeakRetained((id *)p_puppetView);
    BOOL v5 = [v7 faceIsFullyActive]
      && !self->_isTransitioningBetweenLayouts
      && !self->_isMakingSticker
      && !self->_exportingMovie
      && self->_UIState == 3
      && self->_arSessionState == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)stickerImageUsingLargeSticker:(BOOL)a3
{
  if (a3)
  {
    [(MessagesViewController *)self defaultVideoExportDimensions];
    double v5 = v4;
    id v6 = +[UIScreen mainScreen];
    [v6 scale];
    double v8 = v7;

    int v9 = (int)(v5 / v8);
    float v10 = v8;
  }
  else
  {
    int v9 = 375;
    float v10 = 1.0;
  }
  id v11 = +[NSUserDefaults standardUserDefaults];
  dispatch_time_t v12 = [v11 objectForKey:@"JFDefaults_StickerExportWidth"];

  int v13 = v9;
  if (v12)
  {
    double v14 = +[NSUserDefaults standardUserDefaults];
    int v13 = [v14 integerForKey:@"JFDefaults_StickerExportWidth"];
  }
  double v15 = +[NSUserDefaults standardUserDefaults];
  dispatch_time_t v16 = [v15 objectForKey:@"JFDefaults_StickerExportHeight"];

  if (v16)
  {
    id v17 = +[NSUserDefaults standardUserDefaults];
    int v9 = [v17 integerForKey:@"JFDefaults_StickerExportHeight"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  *(float *)&double v19 = v10;
  double v20 = [WeakRetained snapshotWithSize:(double)v13 scaleFactor:(double)v9 v19];

  return v20;
}

- (id)stickerUsingLargeSticker:(BOOL)a3
{
  double v4 = [(MessagesViewController *)self stickerImageUsingLargeSticker:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] stickerUsingLargeSticker  image: %@", buf, 0xCu);
  }
  double v5 = UIImagePNGRepresentation(v4);
  id v6 = [(NSURL *)self->_stickerFolder path];
  double v7 = +[NSString stringWithFormat:@"/View%d.png", (int)CFAbsoluteTimeGetCurrent()];
  double v8 = [v6 stringByAppendingString:v7];

  int v9 = +[NSURL fileURLWithPath:v8];
  [v5 writeToURL:v9 atomically:1];
  float v10 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
  id v11 = +[AXUIAvatarUtilities descriptionForAvatarWithRecord:v10 includeVideoPrefix:0];

  id v12 = [objc_alloc((Class)MSSticker) initWithContentsOfFileURL:v9 localizedDescription:v11 error:0];

  return v12;
}

- (id)puppetSnapshotWithContentMode:(int64_t)a3
{
  p_puppetView = &self->_puppetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  id v6 = [WeakRetained snapshot];

  id v7 = objc_alloc((Class)UIImageView);
  id v8 = objc_loadWeakRetained((id *)p_puppetView);
  [v8 frame];
  id v9 = [v7 initWithFrame:];

  [v9 setImage:v6];
  [v9 setContentMode:a3];

  return v9;
}

- (void)performWithFadeAnimation:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = (void (**)(void))a3;
  id v6 = v5;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100017CFC;
    void v7[3] = &unk_100034A50;
    id v8 = v5;
    +[UIView animateWithDuration:v7 animations:0.2];
  }
  else
  {
    v5[2](v5);
  }
}

- (void)fadeIn:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017DA4;
  v5[3] = &unk_100034790;
  id v6 = a3;
  id v4 = v6;
  [(MessagesViewController *)self performWithFadeAnimation:v5 enabled:1];
}

- (void)fadeOut:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017E48;
  v5[3] = &unk_100034790;
  id v6 = a3;
  id v4 = v6;
  [(MessagesViewController *)self performWithFadeAnimation:v5 enabled:1];
}

- (void)showUserInfoLabelWithText:(id)a3
{
  id v5 = a3;
  if (!self->_displaysLaunchScreen && self->_UIState != 2)
  {
    self->_double userInfoAlpha = 1.0;
    objc_storeStrong((id *)&self->_userInfoText, a3);
    if (!self->_userInfoIsBeingOverridden)
    {
      [(AVTUserInfoView *)self->_userInfoView setText:v5];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100017F60;
      void v6[3] = &unk_100034790;
      v6[4] = self;
      +[UIView animateWithDuration:v6 animations:0.65];
    }
  }
}

- (void)hideUserInfoLabel
{
}

- (void)hideUserInfoLabelWithDuration:(double)a3
{
  self->_double userInfoAlpha = 0.0;
  userInfoText = self->_userInfoText;
  self->_userInfoText = 0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018038;
  void v6[3] = &unk_100034790;
  v6[4] = self;
  +[UIView animateWithDuration:v6 animations:0 completion:a3];
}

- (void)overrideUserInfoLabelStateWithText:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  self->_userInfoIsBeingOverridden = 1;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  float v10 = sub_100018124;
  id v11 = &unk_100034AF0;
  id v12 = self;
  id v13 = v6;
  id v7 = v6;
  +[UIView performWithoutAnimation:&v8];
  -[AVTUserInfoView setAlpha:](self->_userInfoView, "setAlpha:", a4, v8, v9, v10, v11, v12);
}

- (void)stopOverridingUserInfoLabelState:(BOOL)a3
{
  self->_userInfoIsBeingOverridden = 0;
  if (a3 && self->_userInfoAlpha > 0.0 && self->_userInfoText)
  {
    -[AVTUserInfoView setText:](self->_userInfoView, "setText:");
    double userInfoAlpha = self->_userInfoAlpha;
    userInfoView = self->_userInfoView;
    [(AVTUserInfoView *)userInfoView setAlpha:userInfoAlpha];
  }
}

- (id)setRestorableValue:(id)a3 forKeyPath:(id)a4 onViews:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000183B0;
  v22[3] = &unk_100034DC0;
  id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v9 count]];
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  id v25 = v7;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:v22];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001842C;
  v18[3] = &unk_100034808;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_time_t v16 = objc_retainBlock(v18);

  return v16;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if ([v7 isEqualToString:@"faceIsTracked"])
  {
    unsigned int v8 = +[NSThread isMainThread];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100018648;
    v11[3] = &unk_100034790;
    v11[4] = self;
    id v9 = objc_retainBlock(v11);
    id v10 = v9;
    if (v8) {
      ((void (*)(void *))v9[2])(v9);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
    }
  }
  else if ([v7 isEqualToString:@"state"])
  {
    [(MessagesViewController *)self updateARSessionStateResettingState:1];
  }
}

- (void)startTrackingLostTimer
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] startTrackingLostTimer", buf, 2u);
  }
  if (self->_arSessionState)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000189F0;
    block[3] = &unk_100034790;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startTrackingStartTimerWithCounter:(unint64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] startTrackingStartTimer", buf, 2u);
  }
  if (self->_arSessionState)
  {
    [(NSTimer *)self->_trackingStartTimer invalidate];
    trackingStartTimer = self->_trackingStartTimer;
    self->_trackingStartTimer = 0;

    self->_trackingStartCounter = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_100018CC0;
    v8[3] = &unk_100034E10;
    v8[4] = self;
    void v8[5] = a3;
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v8 block:1.0];
    id v7 = self->_trackingStartTimer;
    self->_trackingStartTimer = v6;
  }
}

- (void)changeUserInfoLabelForTrackingState
{
  switch(self->_arSessionState)
  {
    case 1uLL:
    case 5uLL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] JFARSessionUndefined || JFARSessionLost", v8, 2u);
      }
      BOOL v3 = [(MessagesViewController *)self trackingLostReason];
      [(MessagesViewController *)self showUserInfoLabelWithText:v3];

      [(MessagesViewController *)self checkLightingAndObscuredSensorAfterTrackingLost];
      break;
    case 2uLL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] JFARSessionFailed", v9, 2u);
      }
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"sJFARSessionFailed";
      goto LABEL_11;
    case 3uLL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] JFARSessionInterrupted", buf, 2u);
      }
      id v4 = +[NSBundle mainBundle];
      id v5 = v4;
      CFStringRef v6 = @"sJFARSessionWasInterrupted";
LABEL_11:
      id v7 = [v4 localizedStringForKey:v6 value:&stru_100035088 table:@"JFStrings"];
      [(MessagesViewController *)self showUserInfoLabelWithText:v7];

      break;
    default:
      return;
  }
}

- (id)trackingLostReason
{
  BOOL v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] != (id)1)
  {

    goto LABEL_5;
  }
  id v4 = [(MessagesViewController *)self parentMessagesViewController];
  id v5 = [v4 currentOrientation];

  if (v5 != (id)2)
  {
LABEL_5:
    p_puppetView = &self->_puppetView;
    id WeakRetained = objc_loadWeakRetained((id *)p_puppetView);
    unsigned int v12 = [WeakRetained isSensorCovered];

    if (v12)
    {
      id v13 = +[NSBundle mainBundle];
      CFStringRef v6 = v13;
      CFStringRef v14 = @"sJFCameraCovered";
    }
    else
    {
      id v15 = objc_loadWeakRetained((id *)p_puppetView);
      unsigned int v16 = [v15 captureImageIsTooDark];

      id v13 = +[NSBundle mainBundle];
      CFStringRef v6 = v13;
      if (v16) {
        CFStringRef v14 = @"sJFLowLight";
      }
      else {
        CFStringRef v14 = @"sJFLookAtCameraMessage";
      }
    }
    id v9 = [v13 localizedStringForKey:v14 value:&stru_100035088 table:@"JFStrings"];
    goto LABEL_11;
  }
  CFStringRef v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"sJFUpsideDownFormat" value:&stru_100035088 table:@"JFStrings"];
  unsigned int v8 = (void *)MGCopyAnswer();
  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8);

LABEL_11:

  return v9;
}

- (void)checkLightingAndObscuredSensorAfterTrackingLost
{
  if (self->_arSessionState)
  {
    BOOL v3 = [(AVTUserInfoView *)self->_userInfoView text];
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"sJFLowLight" value:&stru_100035088 table:@"JFStrings"];
    if (([v3 isEqualToString:v5] & 1) == 0)
    {
      CFStringRef v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"sJFCameraCovered" value:&stru_100035088 table:@"JFStrings"];
      if (([v3 isEqualToString:v7] & 1) == 0)
      {
        unsigned int v8 = +[NSBundle mainBundle];
        id v9 = [v8 localizedStringForKey:@"sJFLookAtCameraMessage" value:&stru_100035088 table:@"JFStrings"];
        if (([v3 isEqualToString:v9] & 1) == 0)
        {
          id v25 = +[NSBundle mainBundle];
          [v25 localizedStringForKey:@"sJFUpsideDownFormat" value:&stru_100035088 table:@"JFStrings"];
          id v21 = v26 = v8;
          double v22 = (void *)MGCopyAnswer();
          id v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v22);
          unsigned __int8 v24 = [v3 isEqualToString:v23];

          if ((v24 & 1) == 0) {
            goto LABEL_27;
          }
LABEL_8:
          id v10 = [(MessagesViewController *)self trackingLostReason];
          if ([v3 isEqualToString:v10])
          {
LABEL_26:
            [(MessagesViewController *)self performSelector:"checkLightingAndObscuredSensorAfterTrackingLost" withObject:0 afterDelay:1.0];

LABEL_27:
            return;
          }
          id v11 = +[UIDevice currentDevice];
          if ([v11 userInterfaceIdiom] == (id)1)
          {
            unsigned int v12 = [(MessagesViewController *)self parentMessagesViewController];
            id v13 = [v12 currentOrientation];

            if (v13 == (id)2)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v30 = 0;
                CFStringRef v14 = "[Jellyfish] showUserInfoLabelWithText:USER_INFO_UPSIDE_DOWN";
                id v15 = (uint8_t *)&v30;
LABEL_24:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
                goto LABEL_25;
              }
              goto LABEL_25;
            }
          }
          else
          {
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
          unsigned int v17 = [WeakRetained captureImageIsTooDark];

          if (v17)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v29 = 0;
              CFStringRef v14 = "[Jellyfish] showUserInfoLabelWithText:USER_INFO_LOW_LIGHT";
              id v15 = (uint8_t *)&v29;
              goto LABEL_24;
            }
          }
          else
          {
            id v18 = objc_loadWeakRetained((id *)&self->_puppetView);
            unsigned int v19 = [v18 isSensorCovered];

            BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v20)
              {
                __int16 v28 = 0;
                CFStringRef v14 = "[Jellyfish] showUserInfoLabelWithText:USER_INFO_CAMERA_COVERED";
                id v15 = (uint8_t *)&v28;
                goto LABEL_24;
              }
            }
            else if (v20)
            {
              *(_WORD *)buf = 0;
              CFStringRef v14 = "[Jellyfish] showUserInfoLabelWithText:USER_INFO_LOOK_AT_CAMERA";
              id v15 = buf;
              goto LABEL_24;
            }
          }
LABEL_25:
          [(MessagesViewController *)self showUserInfoLabelWithText:v10];
          goto LABEL_26;
        }
      }
    }

    goto LABEL_8;
  }
}

- (void)checkLightingAndObscuredSensorWhileTracking
{
  [(NSTimer *)self->_lightingCheckTimer invalidate];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000195D0;
  v5[3] = &unk_100034D70;
  void v5[4] = self;
  BOOL v3 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:1.0];
  lightingCheckTimer = self->_lightingCheckTimer;
  self->_lightingCheckTimer = v3;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] willBecomeActiveWithConversation", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v5 willBecomeActiveWithConversation:v4];
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:@"com.apple.Jellyfish"];
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4 = (MSConversation *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] didBecomeActiveWithConversation", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)MessagesViewController;
  [(MessagesViewController *)&v6 didBecomeActiveWithConversation:v4];
  conversation = self->_conversation;
  self->_conversation = v4;

  [(MessagesViewController *)self startObservingBaseMessagesNotifications];
}

- (void)willResignActiveWithConversation:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] willResignActiveWithConversation", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained setFaceTrackingPaused:1];

  [(AVTUsageTrackingSession *)self->_usageTrackingSession didPauseFaceTracking];
  [(MessagesViewController *)self restoreIdleTimer];
  [(MessagesViewController *)self endObservingFaceTrackingIfNecessary];
  [(MessagesViewController *)self stopObservingBaseMessagesNotifications];
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL displaysLaunchScreen = self->_displaysLaunchScreen;
    BOOL capturedSnapshotMetrics = self->_capturedSnapshotMetrics;
    BOOL isDisappearing = self->_isDisappearing;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)double v31 = displaysLaunchScreen;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = capturedSnapshotMetrics;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = isDisappearing;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] updateSnapshotWithCompletionBlock, splash %i; metric %i; disappearing %i",
      buf,
      0x14u);
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  double v27 = sub_10000ADF8;
  __int16 v28 = sub_10000AE08;
  unsigned int v8 = [(MessagesViewController *)self parentMessagesViewController];
  id v29 = [v8 emptySnapshotImage];

  if (!self->_displaysLaunchScreen && self->_capturedSnapshotMetrics && self->_isDisappearing)
  {
    id v10 = [(AVTRecordingCarouselController *)self->_avatarListController focusedRecord];
    uint64_t v11 = [v10 identifier];
    unsigned int v12 = (void *)v11;
    id v13 = @"mouse";
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    CFStringRef v14 = v13;

    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCGRect(self->_snapshotBounds);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(self->_avatarControllerFrame);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [(MessagesViewController *)self view];
      [v18 bounds];
      NSStringFromCGRect(v39);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v20 = [(AVTRecordingCarouselController *)self->_avatarListController view];
      [v20 frame];
      id v21 = NSStringFromCGRect(v40);
      *(_DWORD *)buf = 138413314;
      *(void *)double v31 = v14;
      *(_WORD *)&v31[8] = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v17;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 2112;
      double v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] updateSnapshot: taking snapshot of animoji %@, bounds %@; controllerFrame %@ self bounds %@, self.co"
        "ntrollerFrame %@",
        buf,
        0x34u);
    }
    double v22 = -[AVTRecordingCarouselController snapshotProviderFocusedOnRecordWithIdentifier:size:](self->_avatarListController, "snapshotProviderFocusedOnRecordWithIdentifier:size:", v14, self->_avatarControllerFrame.size.width, self->_avatarControllerFrame.size.height);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100019F38;
    v23[3] = &unk_100034E38;
    v23[4] = self;
    v23[5] = &v24;
    [v22 snapshotInBlock:v23];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v25[5];
    *(_DWORD *)buf = 138412290;
    *(void *)double v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] updateSnapshot: with image %@", buf, 0xCu);
  }
  v4[2](v4, v25[5]);
  _Block_object_dispose(&v24, 8);
}

- (BOOL)isInternalBuild
{
  return _MGGetBoolAnswer(@"apple-internal-install", a2);
}

- (BOOL)isLandcapeTrapOverlayShown
{
  id v2 = [(MessagesViewController *)self parentMessagesViewController];
  unsigned __int8 v3 = [v2 isLandcapeTrapOverlayShown];

  return v3;
}

- (BOOL)isLandscapeMode
{
  id v2 = [(MessagesViewController *)self parentMessagesViewController];
  unsigned __int8 v3 = [v2 isLandscapeMode];

  return v3;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] imagePickerController", buf, 2u);
  }
  objc_super v6 = [v5 objectForKeyedSubscript:UIImagePickerControllerPHAsset];
  id v7 = +[PHImageManager defaultManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10001A1F8;
  v8[3] = &unk_100034E60;
  v8[4] = self;
  [v7 requestAVAssetForVideo:v6 options:0 resultHandler:v8];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] imagePickerControllerDidCancel", v4, 2u);
  }
  [(MessagesViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)faceTrackingRecordingURL
{
  unsigned __int8 v3 = NSTemporaryDirectory();
  id v4 = +[NSString stringWithFormat:@"/EmojiMovieLogFacetracking%d.mov", (int)self->_recordingStartTime];
  id v5 = [v3 stringByAppendingPathComponent:v4];
  objc_super v6 = +[NSURL fileURLWithPath:v5];

  return v6;
}

- (void)pauseFaceTrackingWithReason:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[Jellyfish] pauseFaceTrackingWithReason: %@", (uint8_t *)&v10, 0xCu);
  }
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:0];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setEnabled:0];
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setEnabled:0];
  if (!self->_resumeTrackingTapGestureRecognizer)
  {
    id v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleResumeTrackingTap:"];
    resumeTrackingTapGestureRecognizer = self->_resumeTrackingTapGestureRecognizer;
    self->_resumeTrackingTapGestureRecognizer = v5;

    [(UIView *)self->_carouselView addGestureRecognizer:self->_resumeTrackingTapGestureRecognizer];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_puppetView);
  [WeakRetained setFaceTrackingPaused:1];

  [(AVTUsageTrackingSession *)self->_usageTrackingSession didPauseFaceTracking];
  self->_unint64_t arSessionState = 4;
  unsigned int v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"sJFTrackingPausedMessage" value:&stru_100035088 table:@"JFStrings"];
  [(MessagesViewController *)self showUserInfoLabelWithText:v9];
}

- (AVTPaddleView)paddleView
{
  return self->_paddleView;
}

- (void)setPaddleView:(id)a3
{
}

- (BOOL)displaysLaunchScreen
{
  return self->_displaysLaunchScreen;
}

- (void)setDisplaysLaunchScreen:(BOOL)a3
{
  self->_BOOL displaysLaunchScreen = a3;
}

- (BOOL)waitingOnPresentationStyleRequestFulfillment
{
  return self->_waitingOnPresentationStyleRequestFulfillment;
}

- (void)setWaitingOnPresentationStyleRequestFulfillment:(BOOL)a3
{
  self->_waitingOnPresentationStyleRequestFulfillment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_presentationStyleTransitionSnapshotView, 0);
  objc_storeStrong((id *)&self->_usageTrackingSession, 0);
  objc_storeStrong(&self->_pendingLayoutUpdate, 0);
  objc_storeStrong((id *)&self->_lastMovieDoesNotExistError, 0);
  objc_storeStrong((id *)&self->_lastInsertError, 0);
  objc_storeStrong((id *)&self->_lastSendError, 0);
  objc_storeStrong((id *)&self->_lastExportError, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_resumeTrackingTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lightingCheckTimer, 0);
  objc_storeStrong((id *)&self->_trackingStartTimer, 0);
  objc_storeStrong((id *)&self->_trackingLostTimer, 0);
  objc_storeStrong((id *)&self->_userInfoView, 0);
  objc_storeStrong((id *)&self->_userInfoText, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_recordingTimeDisplayView, 0);
  objc_storeStrong(&self->_recordingDisableTimerBlock, 0);
  objc_storeStrong((id *)&self->_recordTimer, 0);
  objc_storeStrong((id *)&self->_recordingButton, 0);
  objc_storeStrong((id *)&self->_recordingButtonSuperview, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToRadar, 0);
  objc_storeStrong((id *)&self->_replayMessageButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_cancelSendingMessageButton, 0);
  objc_storeStrong((id *)&self->_videoLoggingFolder, 0);
  objc_storeStrong((id *)&self->_stickerFolder, 0);
  objc_storeStrong(&self->_stickerHiddenViewsRestorationBlock, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_storeStrong((id *)&self->_puppetCollectionViewController, 0);
  objc_destroyWeak((id *)&self->_puppetCollectionViewContainer);
  objc_destroyWeak((id *)&self->_observingSession);
  objc_destroyWeak((id *)&self->_puppetViewForKVO);
  objc_destroyWeak((id *)&self->_puppetView);
  objc_storeStrong((id *)&self->_tapToRadarLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_recordingDisplayLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_cancelSendingButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_cancelSendingButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_editButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_editButtonLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_editButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_userInfoMaximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_carouselHeightConstraint, 0);
  objc_storeStrong((id *)&self->_avatarListController, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_avatarDataSource, 0);

  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end