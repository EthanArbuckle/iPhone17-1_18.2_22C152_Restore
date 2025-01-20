@interface ICDocCamViewController
+ (float)cameraIntrinsicMatrixForWidth:(double)a1 height:(double)a2 pixelFocalLength:(float)a3;
+ (id)deviceWithMediaType:(id)a3 preferringPosition:(int64_t)a4;
+ (void)initialize;
+ (void)registerDefaults;
+ (void)warnAboutMaxScansReachedForViewController:(id)a3 completionHandler:(id)a4;
- (AVCaptureConnection)videoConnection;
- (AVCaptureDeviceInput)videoDeviceInput;
- (AVCaptureEventInteraction)captureEventInteraction;
- (AVCapturePhotoOutput)photoOutput;
- (AVCapturePhotoSettings)photoSettings;
- (AVCaptureSession)session;
- (AVCaptureVideoDataOutput)videoDataOutput;
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (BKSAccelerometer)accelerometer;
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (BOOL)adjustingFocus;
- (BOOL)autoMode;
- (BOOL)awaitingSnapshotCompletion;
- (BOOL)captureDebugDone;
- (BOOL)capturingFromPhysicalButton;
- (BOOL)debugRectanglesEnabled;
- (BOOL)deviceHasFlash;
- (BOOL)didAddAppLifetimeObservers;
- (BOOL)didWarnAboutMaxScans;
- (BOOL)displayStringEnabled;
- (BOOL)filterSettingUIShowing;
- (BOOL)flashSettingUIShowing;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasCandidateRectanglesForAX;
- (BOOL)hideUserPrompt;
- (BOOL)isConstantColorAvailable;
- (BOOL)isInRetakeMode;
- (BOOL)isObservingCaptureSession;
- (BOOL)isSessionRunning;
- (BOOL)prefersStatusBarHidden;
- (BOOL)realTimeRectangleDetection;
- (BOOL)rectangleDetectionEnabled;
- (BOOL)registrationEnabled;
- (BOOL)scanMovieRecordingDontShowWarning;
- (BOOL)scanMovieRecordingEnabled;
- (BOOL)segmentMeanComputed;
- (BOOL)shouldAutoShoot;
- (BOOL)shouldAutorotate;
- (BOOL)sufficientlyLarge:(id)a3 forImageSize:(CGSize)a4;
- (BOOL)synchronousRectangleDetection;
- (BOOL)useCustomRecropTransition;
- (BOOL)useCustomRetakeTransition;
- (BOOL)useCustomThumbnailZoomTransition;
- (BOOL)useDocumentSegmentation;
- (BOOL)validRect:(id)a3 forImageSize:(CGSize)a4;
- (BOOL)zoomTargetShouldUseCustomImageFrame;
- (CGPoint)segmentBottomLeft;
- (CGPoint)segmentBottomRight;
- (CGPoint)segmentTopLeft;
- (CGPoint)segmentTopRight;
- (CGRect)targetViewRect;
- (CGRect)zoomTargetCustomImageFrame;
- (CGRect)zoomTargetForIndexPath:(id)a3;
- (CGSize)streamingImageSize;
- (CGSize)viewBoundsSize;
- (CIContext)sharedCoreImageContext;
- (ICDocCamDebugMovieController)movieController;
- (ICDocCamDocumentInfo)markupDocumentInfo;
- (ICDocCamDocumentInfoCollection)documentInfoCollection;
- (ICDocCamImageCache)imageCache;
- (ICDocCamImageQuad)backupQuad;
- (ICDocCamImageSequenceAnalyzer)vkAnalyzer;
- (ICDocCamOverlayView)overlayView;
- (ICDocCamPreviewView)previewView;
- (ICDocCamProcessingBlocker)processRequestsBlocker;
- (ICDocCamProcessingBlocker)snapStillImageBlocker;
- (ICDocCamRectangleResultsQueue)rectResultsQueue;
- (ICDocCamSaveButton)saveButton;
- (ICDocCamShutterButton)shutterButton;
- (ICDocCamSpinner)snapshotSpinner;
- (ICDocCamThumbnailCollectionViewController)thumbnailViewController;
- (ICDocCamThumbnailContainerView)thumbnailContainerView;
- (ICDocCamViewController)initWithImageCache:(id)a3;
- (ICDocCamViewControllerDelegate)delegate;
- (NSArray)filterNames;
- (NSData)cameraIntrinsicData;
- (NSDate)lastAXPositionAnnouncementDate;
- (NSDate)lastSubjectAreaChange;
- (NSIndexPath)indexPathForRecrop;
- (NSIndexPath)indexPathForRetake;
- (NSIndexPath)indexPathForThumbnailZoom;
- (NSLayoutConstraint)autoButtonForIPhoneTrailingConstraint;
- (NSLayoutConstraint)autoShutterOffTopLayoutConstraint;
- (NSLayoutConstraint)autoShutterOnTopLayoutConstraint;
- (NSLayoutConstraint)cancelButtonForIPhoneLeadingConstraint;
- (NSLayoutConstraint)filterNameFeedbackViewTopLayoutConstraint;
- (NSLayoutConstraint)filterViewContainerHeightConstraint;
- (NSLayoutConstraint)filterViewContainerWidthConstraint;
- (NSLayoutConstraint)filterViewLeadingConstraint;
- (NSLayoutConstraint)filterViewTrailingConstraint;
- (NSLayoutConstraint)flashSettingViewHeightConstraint;
- (NSLayoutConstraint)flashSettingWidthConstraint;
- (NSLayoutConstraint)moveCameraCloserViewVerticalConstraint;
- (NSLayoutConstraint)saveButtonLandscapeTrailingConstraintForIPhone;
- (NSLayoutConstraint)saveButtonLandscapeVerticalConstraintForIPhone;
- (NSLayoutConstraint)shutterButtonBottomConstraintForLandscapeIPhone;
- (NSLayoutConstraint)shutterButtonBottomConstraintForPortraitIPhone;
- (NSLayoutConstraint)thumbnailContainerViewBottomConstraintForIPhone;
- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPad;
- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPhone;
- (NSLayoutConstraint)thumbnailContainerViewTrailingConstraintForIPad;
- (NSLayoutConstraint)topToolbarForIPhoneHeightConstraint;
- (NSLayoutConstraint)userPromptViewVerticalConstraint;
- (NSMutableArray)filterButtons;
- (NSMutableArray)iPadLayoutConstraints;
- (NSMutableArray)iPhoneCompactLandscapeLayoutConstraints;
- (NSMutableArray)iPhoneLandscapeLayoutConstraints;
- (NSMutableArray)iPhonePortraitLayoutConstraints;
- (NSMutableArray)recentRectangleObservations;
- (NSMutableDictionary)inProgressPhotoCaptureDelegates;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_queue)snapshotSpinnerQueue;
- (OS_dispatch_semaphore)flashAndFilterUISemaphore;
- (UIButton)autoButton;
- (UIButton)autoButtonForIPhone;
- (UIButton)cancelButton;
- (UIButton)cancelButtonForIPhone;
- (UIButton)filterButton;
- (UIButton)filterButtonForIPhone;
- (UIButton)filterViewButton;
- (UIButton)flashButton;
- (UIButton)flashButtonForIPhone;
- (UIButton)flashSettingViewAutoButton;
- (UIButton)flashSettingViewFlashIcon;
- (UIButton)flashSettingViewOffButton;
- (UIButton)flashSettingViewOnButton;
- (UIButton)manualButton;
- (UIButton)recordButton;
- (UIButton)resumeButton;
- (UIColor)cameraHighlightColor;
- (UIImage)filteredImageForRecrop;
- (UIImage)imageForRetake;
- (UIImage)imageForThumbnailZoom;
- (UIImage)unfilteredImageForRecrop;
- (UILabel)autoShutterOffLabel;
- (UILabel)autoShutterOnLabel;
- (UILabel)cameraUnavailableLabel;
- (UILabel)filterNameFeedbackLabel;
- (UILabel)moveCameraCloserLabel;
- (UILabel)userPromptLabel;
- (UIScrollView)filterScrollView;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (UIView)autoShutterOffView;
- (UIView)autoShutterOnView;
- (UIView)cameraUnavailableScrim;
- (UIView)cameraUnavailableView;
- (UIView)filterNameFeedbackView;
- (UIView)filterScrollViewContainer;
- (UIView)filterView;
- (UIView)filterViewContainer;
- (UIView)flashSettingButtonView;
- (UIView)flashSettingView;
- (UIView)moveCameraCloserView;
- (UIView)scrimView;
- (UIView)topToolbarForIPhone;
- (UIView)userPromptView;
- (VNRectangleObservation)lastHighConfidenceRectangle;
- (double)filterScrollViewContentWidthWithInterItemSpacing:(double)a3 startPadding:(double)a4 endPadding:(double)a5;
- (double)flashSettingViewWidthForIPad;
- (float)pixelFocalLength;
- (float)rectangleMaximumAspectRatio;
- (float)rectangleMinimumAspectRatio;
- (float)rectangleMinimumConfidence;
- (float)rectangleMinimumSize;
- (float)rectangleMinimumVisualConfidence;
- (float)rectangleQuadratureTolerance;
- (float)rectangleStabilityStdDev;
- (float)segmentMinimumVisualConfidence;
- (float)segmentMinimumVisualConfidence60Frames;
- (float)segmentMinimumVisualConfidenceFinalScan;
- (float)segmentStabilityStdDev;
- (float)segmentationFudgeFactor;
- (id)createNSDataFrom:(id)a3 metaData:(id)a4;
- (id)cropAndFilterImage:(id)a3 rects:(id)a4 filterType:(signed __int16)a5 constantColor:(BOOL)a6;
- (id)detectRectanglesRequest;
- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3;
- (id)filterButtonImage;
- (id)filteredImageForDocument:(id)a3;
- (id)flashButtonImage;
- (id)flashMenuButtonSizes;
- (id)imageMeshTransformWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 imageQuad:(id)a6 previewView:(id)a7 previewBounds:(CGRect)a8 scrimView:(id)a9;
- (id)markupDismissCompletionBlock;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)retakeCompletionBlock;
- (id)sessionStartNotificationBlock;
- (id)thumbnailZoomCompletionBlock;
- (int64_t)flashMode;
- (int64_t)orientationForRecrop;
- (int64_t)preferredStatusBarStyle;
- (int64_t)queueSizeForRectangleDetection;
- (int64_t)rectangleMaximumNumber;
- (int64_t)referenceOrientation;
- (int64_t)retakeIndex;
- (int64_t)setupResult;
- (int64_t)snapStillImageMode;
- (int64_t)statusBarOrientation;
- (signed)defaultFilter;
- (unint64_t)axConsecutiveRecognizerStateCount;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)imageOrientationFromDevice;
- (void)addNewDocument:(id)a3;
- (void)addObserversIfNecessary;
- (void)analyzerCallbackWithDictionaryResults:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cancelAction:(id)a3;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)changeFlashAction:(id)a3;
- (void)changeRecordButtonTitle:(id)a3;
- (void)clearQueue;
- (void)clearRectangles;
- (void)createCaptureEventInteractionIfNecessary;
- (void)dealloc;
- (void)detectRectanglesAndSaveCapturedImage:(__CVBuffer *)a3 metadata:(id)a4 constantColor:(BOOL)a5 completionHandler:(id)a6;
- (void)didFinishWithImage:(id)a3;
- (void)didRecognizeRectangleForAccessibility:(BOOL)a3;
- (void)disableRetakeMode;
- (void)dismissFilterAndFlashUI;
- (void)dismissFilterUI;
- (void)dismissFlashUI;
- (void)enableRecordButton:(BOOL)a3;
- (void)enableShutter:(BOOL)a3;
- (void)enableShutterButtonIfPossible;
- (void)enableUIElements:(BOOL)a3;
- (void)enableUIElementsForMovieRecording:(BOOL)a3;
- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5;
- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7;
- (void)extractedDocumentControllerDidDeleteDocument:(id)a3;
- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3;
- (void)extractedDocumentControllerDidTapRetake:(unint64_t)a3;
- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3;
- (void)filterButtonAction:(id)a3;
- (void)filterButtonCancelUI:(id)a3;
- (void)filterButtonChoiceAction:(id)a3;
- (void)flashButtonAction:(id)a3;
- (void)flashButtonCancelUI:(id)a3;
- (void)flashFilterButtonNameFeedback;
- (void)flashMoveCloserFeedback;
- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6;
- (void)handleCaptureEventInteractionEvent:(id)a3;
- (void)handlePhysicalButtonPressCancelled;
- (void)handlePhysicalButtonPressed;
- (void)handlePhysicalButtonReleased;
- (void)hideFilterSettingUI;
- (void)hideFlashSettingUI;
- (void)hideShutter:(BOOL)a3;
- (void)hideUIForInterruptedSession:(BOOL)a3;
- (void)image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5;
- (void)initializeFilters;
- (void)initializeUserInterface;
- (void)killFeedbackDisplayIncludingUserPrompts:(BOOL)a3;
- (void)killFeedbackDisplayInternalIncludingUserPrompts:(BOOL)a3;
- (void)launchCaptureSession;
- (void)logAlgoChoice;
- (void)markupCancelAction:(id)a3;
- (void)markupDoneAction:(id)a3;
- (void)myApplicationDidBecomeActive:(id)a3;
- (void)myApplicationWillResignActive:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseCaptureSessionForMovieRecording;
- (void)popViewController:(id)a3 subtype:(id)a4 duration:(double)a5 completion:(id)a6;
- (void)preWarmFilters;
- (void)prepareForDismissal;
- (void)pushViewController:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7;
- (void)removeAllNotifications;
- (void)removeObserversIfNecessary;
- (void)removeSaveActionBlockerForFiles;
- (void)restartImageCaptureSessionIfNecessary;
- (void)resumeCaptureSessionForMovieRecording;
- (void)resumeInterruptedSession:(id)a3;
- (void)retakeButtonWasPressed;
- (void)saveAction:(id)a3;
- (void)saveCapturedImage:(id)a3 metaData:(id)a4 rects:(id)a5 constantColor:(BOOL)a6 completionHandler:(id)a7;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionRuntimeError:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setAccelerometer:(id)a3;
- (void)setAdjustingFocus:(BOOL)a3;
- (void)setAutoButton:(id)a3;
- (void)setAutoButtonForIPhone:(id)a3;
- (void)setAutoButtonForIPhoneTrailingConstraint:(id)a3;
- (void)setAutoMode:(BOOL)a3;
- (void)setAutoShutterOffLabel:(id)a3;
- (void)setAutoShutterOffTopLayoutConstraint:(id)a3;
- (void)setAutoShutterOffView:(id)a3;
- (void)setAutoShutterOnLabel:(id)a3;
- (void)setAutoShutterOnTopLayoutConstraint:(id)a3;
- (void)setAutoShutterOnView:(id)a3;
- (void)setAwaitingSnapshotCompletion:(BOOL)a3;
- (void)setAxConsecutiveRecognizerStateCount:(unint64_t)a3;
- (void)setBackupQuad:(id)a3;
- (void)setCameraHighlightColor:(id)a3;
- (void)setCameraIntrinsicData:(id)a3;
- (void)setCameraUnavailableLabel:(id)a3;
- (void)setCameraUnavailableScrim:(id)a3;
- (void)setCameraUnavailableView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonForIPhone:(id)a3;
- (void)setCancelButtonForIPhoneLeadingConstraint:(id)a3;
- (void)setCaptureDebugDone:(BOOL)a3;
- (void)setCaptureEventInteraction:(id)a3;
- (void)setCapturingFromPhysicalButton:(BOOL)a3;
- (void)setDebugRectanglesEnabled:(BOOL)a3;
- (void)setDefaultFilter:(signed __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceHasFlash:(BOOL)a3;
- (void)setDidAddAppLifetimeObservers:(BOOL)a3;
- (void)setDidWarnAboutMaxScans:(BOOL)a3;
- (void)setDisplayStringEnabled:(BOOL)a3;
- (void)setDocumentInfoCollection:(id)a3;
- (void)setFilterButton:(id)a3;
- (void)setFilterButtonForIPhone:(id)a3;
- (void)setFilterButtons:(id)a3;
- (void)setFilterNameFeedbackLabel:(id)a3;
- (void)setFilterNameFeedbackView:(id)a3;
- (void)setFilterNameFeedbackViewTopLayoutConstraint:(id)a3;
- (void)setFilterNames:(id)a3;
- (void)setFilterScrollView:(id)a3;
- (void)setFilterScrollViewContainer:(id)a3;
- (void)setFilterSettingUIShowing:(BOOL)a3;
- (void)setFilterView:(id)a3;
- (void)setFilterViewButton:(id)a3;
- (void)setFilterViewContainer:(id)a3;
- (void)setFilterViewContainerHeightConstraint:(id)a3;
- (void)setFilterViewContainerWidthConstraint:(id)a3;
- (void)setFilterViewLeadingConstraint:(id)a3;
- (void)setFilterViewTrailingConstraint:(id)a3;
- (void)setFilteredImageForRecrop:(id)a3;
- (void)setFlashAndFilterUISemaphore:(id)a3;
- (void)setFlashButton:(id)a3;
- (void)setFlashButtonForIPhone:(id)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashSettingButtonView:(id)a3;
- (void)setFlashSettingUIShowing:(BOOL)a3;
- (void)setFlashSettingView:(id)a3;
- (void)setFlashSettingViewAutoButton:(id)a3;
- (void)setFlashSettingViewFlashIcon:(id)a3;
- (void)setFlashSettingViewHeightConstraint:(id)a3;
- (void)setFlashSettingViewOffButton:(id)a3;
- (void)setFlashSettingViewOnButton:(id)a3;
- (void)setFlashSettingWidthConstraint:(id)a3;
- (void)setHasCandidateRectanglesForAX:(BOOL)a3;
- (void)setHideUserPrompt:(BOOL)a3;
- (void)setIPadLayoutConstraints:(id)a3;
- (void)setIPhoneCompactLandscapeLayoutConstraints:(id)a3;
- (void)setIPhoneLandscapeLayoutConstraints:(id)a3;
- (void)setIPhonePortraitLayoutConstraints:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setImageForRetake:(id)a3;
- (void)setImageForThumbnailZoom:(id)a3;
- (void)setInProgressPhotoCaptureDelegates:(id)a3;
- (void)setIndexPathForRecrop:(id)a3;
- (void)setIndexPathForRetake:(id)a3;
- (void)setIndexPathForThumbnailZoom:(id)a3;
- (void)setIsObservingCaptureSession:(BOOL)a3;
- (void)setLastAXPositionAnnouncementDate:(id)a3;
- (void)setLastHighConfidenceRectangle:(id)a3;
- (void)setLastSubjectAreaChange:(id)a3;
- (void)setManualButton:(id)a3;
- (void)setMarkupDismissCompletionBlock:(id)a3;
- (void)setMarkupDocumentInfo:(id)a3;
- (void)setMoveCameraCloserLabel:(id)a3;
- (void)setMoveCameraCloserView:(id)a3;
- (void)setMoveCameraCloserViewVerticalConstraint:(id)a3;
- (void)setMovieController:(id)a3;
- (void)setOrientationForRecrop:(int64_t)a3;
- (void)setOverlayView:(id)a3;
- (void)setPhotoOutput:(id)a3;
- (void)setPhotoSettings:(id)a3;
- (void)setPixelFocalLength:(float)a3;
- (void)setPreviewView:(id)a3;
- (void)setProcessRequestsBlocker:(id)a3;
- (void)setQueueSizeForRectangleDetection:(int64_t)a3;
- (void)setRealTimeRectangleDetection:(BOOL)a3;
- (void)setRecentRectangleObservations:(id)a3;
- (void)setRecordButton:(id)a3;
- (void)setRectResultsQueue:(id)a3;
- (void)setRectangleDetectionEnabled:(BOOL)a3;
- (void)setRectangleMaximumAspectRatio:(float)a3;
- (void)setRectangleMaximumNumber:(int64_t)a3;
- (void)setRectangleMinimumAspectRatio:(float)a3;
- (void)setRectangleMinimumConfidence:(float)a3;
- (void)setRectangleMinimumSize:(float)a3;
- (void)setRectangleMinimumVisualConfidence:(float)a3;
- (void)setRectangleQuadratureTolerance:(float)a3;
- (void)setRectangleStabilityStdDev:(float)a3;
- (void)setReferenceOrientation:(int64_t)a3;
- (void)setRegistrationEnabled:(BOOL)a3;
- (void)setResumeButton:(id)a3;
- (void)setRetakeCompletionBlock:(id)a3;
- (void)setRetakeIndex:(int64_t)a3;
- (void)setSaveButton:(id)a3;
- (void)setSaveButtonLandscapeTrailingConstraintForIPhone:(id)a3;
- (void)setSaveButtonLandscapeVerticalConstraintForIPhone:(id)a3;
- (void)setScanMovieRecordingDontShowWarning:(BOOL)a3;
- (void)setScanMovieRecordingEnabled:(BOOL)a3;
- (void)setScrimView:(id)a3;
- (void)setSegmentBottomLeft:(CGPoint)a3;
- (void)setSegmentBottomRight:(CGPoint)a3;
- (void)setSegmentMeanComputed:(BOOL)a3;
- (void)setSegmentMinimumVisualConfidence60Frames:(float)a3;
- (void)setSegmentMinimumVisualConfidence:(float)a3;
- (void)setSegmentMinimumVisualConfidenceFinalScan:(float)a3;
- (void)setSegmentStabilityStdDev:(float)a3;
- (void)setSegmentTopLeft:(CGPoint)a3;
- (void)setSegmentTopRight:(CGPoint)a3;
- (void)setSegmentationFudgeFactor:(float)a3;
- (void)setSession:(id)a3;
- (void)setSessionQueue:(id)a3;
- (void)setSessionRunning:(BOOL)a3;
- (void)setSessionStartNotificationBlock:(id)a3;
- (void)setSetupResult:(int64_t)a3;
- (void)setSharedCoreImageContext:(id)a3;
- (void)setShutterButton:(id)a3;
- (void)setShutterButtonBottomConstraintForLandscapeIPhone:(id)a3;
- (void)setShutterButtonBottomConstraintForPortraitIPhone:(id)a3;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)setSnapStillImageBlocker:(id)a3;
- (void)setSnapStillImageMode:(int64_t)a3;
- (void)setSnapshotSpinner:(id)a3;
- (void)setSnapshotSpinnerQueue:(id)a3;
- (void)setStatusBarOrientation:(int64_t)a3;
- (void)setStreamingImageSize:(CGSize)a3;
- (void)setSynchronousRectangleDetection:(BOOL)a3;
- (void)setThumbnailContainerView:(id)a3;
- (void)setThumbnailContainerViewBottomConstraintForIPhone:(id)a3;
- (void)setThumbnailContainerViewLeadingConstraintForIPad:(id)a3;
- (void)setThumbnailContainerViewLeadingConstraintForIPhone:(id)a3;
- (void)setThumbnailContainerViewTrailingConstraintForIPad:(id)a3;
- (void)setThumbnailViewController:(id)a3;
- (void)setThumbnailZoomCompletionBlock:(id)a3;
- (void)setTopToolbarForIPhone:(id)a3;
- (void)setTopToolbarForIPhoneHeightConstraint:(id)a3;
- (void)setUnfilteredImageForRecrop:(id)a3;
- (void)setUpFilterScrollView;
- (void)setUpUserDefaults;
- (void)setUseCustomRecropTransition:(BOOL)a3;
- (void)setUseCustomRetakeTransition:(BOOL)a3;
- (void)setUseCustomThumbnailZoomTransition:(BOOL)a3;
- (void)setUserPromptLabel:(id)a3;
- (void)setUserPromptView:(id)a3;
- (void)setUserPromptViewVerticalConstraint:(id)a3;
- (void)setVideoConnection:(id)a3;
- (void)setVideoDataOutput:(id)a3;
- (void)setVideoDeviceInput:(id)a3;
- (void)setVideoPreviewLayer:(id)a3;
- (void)setViewBoundsSize:(CGSize)a3;
- (void)setViewControllers:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7;
- (void)setVkAnalyzer:(id)a3;
- (void)setZoomTargetCustomImageFrame:(CGRect)a3;
- (void)setZoomTargetShouldUseCustomImageFrame:(BOOL)a3;
- (void)setupAccessibilityInfo;
- (void)setupCaptureSession;
- (void)setupThumbnailViewControllerIfNecessary;
- (void)showErrorForMovieRecording:(id)a3;
- (void)shutterButtonAction:(id)a3;
- (void)singleTap;
- (void)snapStillImageWithMode:(int64_t)a3;
- (void)speakLabelTextForAccessibilityIfNecessary:(id)a3 afterDelay:(double)a4;
- (void)speakScannedDocumentForAccessibilityIfNecessary;
- (void)stopImageCaptureSession;
- (void)subjectAreaDidChange:(id)a3;
- (void)thumbnailViewDidTap:(id)a3;
- (void)toggleAutoCapture:(id)a3;
- (void)toggleRecording:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccessibilityEnabledStateForUIElements;
- (void)updateAccessibilityFocusForHidingFilterSettingsUI;
- (void)updateAccessibilityFocusForHidingFlashSettingsUI;
- (void)updateAccessibilityForAutoShutterMode:(BOOL)a3;
- (void)updateAccessibilityForCurrentFilter;
- (void)updateAccessibilityForCurrentFlashMode;
- (void)updateAllConstraints;
- (void)updateAutoButtonTitleForAutoMode:(BOOL)a3;
- (void)updateConstraintsForIPad;
- (void)updateConstraintsForIPhone;
- (void)updateFilterAndFlashButtons;
- (void)updateFilterButtonTint;
- (void)updateFilterChoiceButtonScrollPositionAnimated:(BOOL)a3;
- (void)updateFilterChoiceButtonSelection:(signed __int16)a3;
- (void)updateFonts;
- (void)updateLabelColors;
- (void)updateRecentlyObservedRectanglesWithRect:(id)a3;
- (void)updateThumbnailContainerViewConstraintConstantForIPad;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)warnAboutMaxScansIfNecessary;
@end

@implementation ICDocCamViewController

- (id)imageMeshTransformWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 imageQuad:(id)a6 previewView:(id)a7 previewBounds:(CGRect)a8 scrimView:(id)a9
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  double v16 = a5.size.height;
  double v17 = a5.size.width;
  double v18 = a5.origin.y;
  double v19 = a5.origin.x;
  id v22 = a9;
  id v23 = a7;
  id v24 = a6;
  id v25 = a4;
  id v26 = a3;
  v27 = [ICDocCamViewControllerMeshTransform alloc];
  v28 = [(ICDocCamViewController *)self view];
  v29 = -[ICDocCamViewControllerMeshTransform initWithImage:backgroundImage:imageViewFrame:view:imageQuad:previewView:previewBounds:scrimView:](v27, "initWithImage:backgroundImage:imageViewFrame:view:imageQuad:previewView:previewBounds:scrimView:", v26, v25, v28, v24, v23, v22, v19, v18, v17, v16, x, y, width, height);

  return v29;
}

- (void)pushViewController:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = [MEMORY[0x263F15910] animation];
  if (v14)
  {
    double v16 = (void *)MEMORY[0x21D44FA30](v14);
    [v15 setValue:v16 forKey:@"animationCompletionBlockKey"];

    double v17 = self;
  }
  else
  {
    double v17 = 0;
  }
  [v15 setDelegate:v17];
  [v15 setRemovedOnCompletion:1];
  [v15 setDuration:a6];
  double v18 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v15 setTimingFunction:v18];

  [v15 setType:v12];
  [v15 setSubtype:v13];
  double v19 = [(ICDocCamViewController *)self navigationController];
  v20 = [v19 view];
  v21 = [v20 layer];
  [v21 addAnimation:v15 forKey:0];

  id v22 = [(ICDocCamViewController *)self navigationController];
  [v22 pushViewController:v23 animated:0];
}

- (void)popViewController:(id)a3 subtype:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [MEMORY[0x263F15910] animation];
  if (v11)
  {
    id v13 = (void *)MEMORY[0x21D44FA30](v11);
    [v12 setValue:v13 forKey:@"animationCompletionBlockKey"];

    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }
  [v12 setDelegate:v14];
  [v12 setRemovedOnCompletion:1];
  [v12 setDuration:a5];
  v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v12 setTimingFunction:v15];

  [v12 setType:v21];
  [v12 setSubtype:v10];
  double v16 = [(ICDocCamViewController *)self navigationController];
  double v17 = [v16 view];
  double v18 = [v17 layer];
  [v18 addAnimation:v12 forKey:0];

  double v19 = [(ICDocCamViewController *)self navigationController];
  id v20 = (id)[v19 popViewControllerAnimated:0];
}

- (void)setViewControllers:(id)a3 type:(id)a4 subtype:(id)a5 duration:(double)a6 completion:(id)a7
{
  id v22 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = [MEMORY[0x263F15910] animation];
  if (v14)
  {
    double v16 = (void *)MEMORY[0x21D44FA30](v14);
    [v15 setValue:v16 forKey:@"animationCompletionBlockKey"];
  }
  [v15 setDelegate:self];
  [v15 setRemovedOnCompletion:0];
  [v15 setDuration:a6];
  double v17 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v15 setTimingFunction:v17];

  [v15 setType:v12];
  [v15 setSubtype:v13];
  double v18 = [(ICDocCamViewController *)self navigationController];
  double v19 = [v18 view];
  id v20 = [v19 layer];
  [v20 addAnimation:v15 forKey:0];

  id v21 = [(ICDocCamViewController *)self navigationController];
  [v21 setViewControllers:v22 animated:0];
}

- (CIContext)sharedCoreImageContext
{
  v2 = self;
  objc_sync_enter(v2);
  sharedCoreImageContext = v2->_sharedCoreImageContext;
  if (!sharedCoreImageContext)
  {
    uint64_t v4 = +[ICDocCamImageFilters sharedCoreImageContext];
    v5 = v2->_sharedCoreImageContext;
    v2->_sharedCoreImageContext = (CIContext *)v4;

    sharedCoreImageContext = v2->_sharedCoreImageContext;
  }
  v6 = sharedCoreImageContext;
  objc_sync_exit(v2);

  return v6;
}

+ (float)cameraIntrinsicMatrixForWidth:(double)a1 height:(double)a2 pixelFocalLength:(float)a3
{
  __asm
  {
    FMOV            V1.2S, #-1.0
    FMOV            V3.4S, #1.0
  }
  return a3;
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ICDocCamViewController;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1) {
    +[ICDocCamViewController registerDefaults];
  }
}

+ (void)registerDefaults
{
  v5[23] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4[0] = @"internalSettings.docCam.rectangle.segmentFudgeFactor";
  v4[1] = @"internalSettings.docCam.rectangle.segmentVisualConfidence";
  v5[0] = &unk_26C7ED5B0;
  v5[1] = &unk_26C7ED5C0;
  v4[2] = @"internalSettings.docCam.rectangle.segmentVisualConfidence60Frames";
  v4[3] = @"internalSettings.docCam.rectangle.segmentVisualConfidenceFinalScan";
  v5[2] = &unk_26C7ED5D0;
  v5[3] = &unk_26C7ED5E0;
  v4[4] = @"internalSettings.docCam.rectangle.segmentStabilityStdDev";
  v4[5] = @"internalSettings.docCam.rectangle.minimumAspectRatio";
  v5[4] = &unk_26C7ED5F0;
  v5[5] = &unk_26C7ED600;
  v4[6] = @"internalSettings.docCam.rectangle.maximumAspectRatio";
  v4[7] = @"internalSettings.docCam.rectangle.quadratureTolerance";
  v5[6] = &unk_26C7ED610;
  v5[7] = &unk_26C7ED620;
  v4[8] = @"internalSettings.docCam.rectangle.minimumSize";
  v4[9] = @"internalSettings.docCam.rectangle.minimumConfidence";
  v5[8] = &unk_26C7ED630;
  v5[9] = &unk_26C7ED5D0;
  v4[10] = @"internalSettings.docCam.rectangle.visualConfidence";
  v4[11] = @"internalSettings.docCam.rectangle.maximumNumber";
  v5[10] = &unk_26C7ED640;
  v5[11] = &unk_26C7ED838;
  v4[12] = @"internalSettings.docCam.rectangle.stabilityStdDev";
  v4[13] = @"internalSettings.docCam.rectangle.detectionEnabled";
  v5[12] = &unk_26C7ED650;
  v5[13] = MEMORY[0x263EFFA88];
  v4[14] = @"internalSettings.docCam.registration.enabled";
  v4[15] = @"internalSettings.docCam.debugRectangles.enabled";
  v5[14] = MEMORY[0x263EFFA80];
  v5[15] = MEMORY[0x263EFFA80];
  v4[16] = @"internalSettings.docCam.displayString.enabled";
  v4[17] = @"internalSettings.docCam.rectangle.realTime";
  v5[16] = MEMORY[0x263EFFA80];
  v5[17] = MEMORY[0x263EFFA80];
  v4[18] = @"internalSettings.docCam.rectangle.synchronous";
  v4[19] = @"internalSettings.docCam.rectangle.queueSize";
  v5[18] = MEMORY[0x263EFFA80];
  v5[19] = &unk_26C7ED850;
  v4[20] = @"internalSettings.docCam.imageStabilization.disabled";
  v4[21] = @"internalSettings.docCam.format";
  v5[20] = MEMORY[0x263EFFA80];
  v5[21] = &unk_26C7ED868;
  v4[22] = @"internalSettings.docCam.scanMovieRecording.enabled";
  v5[22] = MEMORY[0x263EFFA80];
  objc_super v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:23];
  [v2 registerDefaults:v3];
}

- (ICDocCamViewController)initWithImageCache:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14.receiver = self;
  v14.super_class = (Class)ICDocCamViewController;
  v6 = [(ICDocCamViewController *)&v14 initWithNibName:@"ICDocCamViewController" bundle:v5];

  if (v6)
  {
    v7 = objc_alloc_init(ICDocCamDocumentInfoCollection);
    documentInfoCollection = v6->_documentInfoCollection;
    v6->_documentInfoCollection = v7;

    [(ICDocCamViewController *)v6 setImageCache:v4];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("session queue", v9);
    sessionQueue = v6->_sessionQueue;
    v6->_sessionQueue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc_init(MEMORY[0x263F297E0]);
    [(ICDocCamViewController *)v6 setAccelerometer:v12];
  }
  return v6;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v31 viewDidLoad];
  objc_super v3 = (void *)UIAccessibilityLibrary();
  dlsym(v3, "_UIAccessibilityStart");
  id v4 = [(ICDocCamViewController *)self view];
  v5 = [v4 tintColor];
  objc_msgSend(v5, "dc_lighterColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  cameraHighlightColor = self->_cameraHighlightColor;
  self->_cameraHighlightColor = v6;

  [(ICDocCamViewController *)self preWarmFilters];
  [(ICDocCamViewController *)self setUpUserDefaults];
  [(ICDocCamViewController *)self setCaptureDebugDone:0];
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.documentcamera.DocCamSpinnerQueue", v8);
  [(ICDocCamViewController *)self setSnapshotSpinnerQueue:v9];

  dispatch_queue_t v10 = +[DCSettings sharedSettings];
  LOBYTE(v9) = [v10 finishAfterFirstScan];

  if ((v9 & 1) == 0)
  {
    id v11 = [ICDocCamSpinner alloc];
    id v12 = [(ICDocCamViewController *)self view];
    id v13 = [(ICDocCamSpinner *)v11 initWithView:v12 minimumDuration:1.0];
    [(ICDocCamViewController *)self setSnapshotSpinner:v13];
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
  [(ICDocCamViewController *)self setFlashAndFilterUISemaphore:v14];

  v15 = [(ICDocCamViewController *)self previewView];
  double v16 = [v15 layer];
  [v16 setOpacity:0.0];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_singleTap];
  [(ICDocCamViewController *)self setSingleTapGestureRecognizer:v17];

  double v18 = [(ICDocCamViewController *)self singleTapGestureRecognizer];
  [v18 setNumberOfTapsRequired:1];

  double v19 = [(ICDocCamViewController *)self singleTapGestureRecognizer];
  [v19 setDelegate:self];

  id v20 = [(ICDocCamViewController *)self view];
  id v21 = [(ICDocCamViewController *)self singleTapGestureRecognizer];
  [v20 addGestureRecognizer:v21];

  [(ICDocCamViewController *)self setSnapStillImageMode:0];
  [(ICDocCamViewController *)self setDefaultFilter:1];
  id v22 = [[ICDocCamProcessingBlocker alloc] initWithDelegate:self];
  [(ICDocCamViewController *)self setProcessRequestsBlocker:v22];

  id v23 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v23 addBlockerOfType:@"ViewLifetimeBlocker" clearRectangles:1 clearQueue:1];

  id v24 = [[ICDocCamProcessingBlocker alloc] initWithDelegate:self];
  [(ICDocCamViewController *)self setSnapStillImageBlocker:v24];

  id v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 addObserver:self selector:sel_myApplicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  id v26 = [MEMORY[0x263F08A00] defaultCenter];
  [v26 addObserver:self selector:sel_myApplicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  [(ICDocCamViewController *)self setDidAddAppLifetimeObservers:1];
  [(ICDocCamViewController *)self disableRetakeMode];
  v28 = [MEMORY[0x263EFF910] date];
  [(ICDocCamViewController *)self setLastSubjectAreaChange:v28];

  self->_requestTimeSum = 0.0;
  self->_requestTimeIndedouble x = 0;
  *(_OWORD *)&self->_requestTime[6] = 0u;
  *(_OWORD *)&self->_requestTime[8] = 0u;
  *(_OWORD *)&self->_requestTime[2] = 0u;
  *(_OWORD *)&self->_requestTime[4] = 0u;
  *(_OWORD *)self->_requestTime = 0u;
  v29 = objc_alloc_init(ICDocCamRectangleResultsQueue);
  [(ICDocCamViewController *)self setRectResultsQueue:v29];

  v30 = [MEMORY[0x263EFF980] array];
  [(ICDocCamViewController *)self setRecentRectangleObservations:v30];

  [(ICDocCamViewController *)self initializeUserInterface];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v10 viewWillAppear:a3];
  [(ICDocCamViewController *)self setupThumbnailViewControllerIfNecessary];
  id v4 = [(ICDocCamViewController *)self navigationController];
  [v4 setNavigationBarHidden:1 animated:0];

  v5 = [(ICDocCamViewController *)self session];

  if (v5) {
    [(ICDocCamViewController *)self launchCaptureSession];
  }
  [(ICDocCamViewController *)self updateFonts];
  v6 = [(ICDocCamViewController *)self documentInfoCollection];
  v7 = [v6 docInfos];
  if (![v7 count])
  {

    goto LABEL_7;
  }
  BOOL v8 = [(ICDocCamViewController *)self isInRetakeMode];

  if (v8)
  {
LABEL_7:
    dispatch_queue_t v9 = [(ICDocCamViewController *)self saveButton];
    [v9 setHidden:1];
    goto LABEL_8;
  }
  dispatch_queue_t v9 = [(ICDocCamViewController *)self saveButton];
  [v9 setHidden:0];
LABEL_8:
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v8 viewDidAppear:a3];
  id v4 = [(ICDocCamViewController *)self session];

  if (!v4)
  {
    [(ICDocCamViewController *)self setupCaptureSession];
    [(ICDocCamViewController *)self launchCaptureSession];
  }
  [(ICDocCamViewController *)self createCaptureEventInteractionIfNecessary];
  [(ICDocCamViewController *)self updateFilterButtonTint];
  v5 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v5 removeBlockerOfType:@"SaveActionBlocker"];

  v6 = [MEMORY[0x263F1C408] sharedApplication];
  [v6 setIdleTimerDisabled:1];

  v7 = [(ICDocCamViewController *)self userPromptLabel];
  [(ICDocCamViewController *)self speakLabelTextForAccessibilityIfNecessary:v7 afterDelay:3.0];

  [(ICDocCamViewController *)self logAlgoChoice];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v4 addBlockerOfType:@"ViewLifetimeBlocker" clearRectangles:1 clearQueue:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ICDocCamViewController_viewDidDisappear___block_invoke;
  block[3] = &unk_2642AA080;
  block[4] = self;
  dispatch_async(v5, block);

  v15.receiver = self;
  v15.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v15 viewDidDisappear:v3];
  v6 = [(ICDocCamViewController *)self previewView];
  v7 = [v6 layer];
  [v7 setOpacity:0.0];

  objc_super v8 = [MEMORY[0x263F1C408] sharedApplication];
  [v8 setIdleTimerDisabled:0];

  dispatch_queue_t v9 = [(ICDocCamViewController *)self presentedViewController];

  if (!v9)
  {
    objc_super v10 = [(ICDocCamViewController *)self thumbnailViewController];
    [v10 willMoveToParentViewController:0];

    id v11 = [(ICDocCamViewController *)self thumbnailViewController];
    [v11 removeFromParentViewController];

    id v12 = [(ICDocCamViewController *)self thumbnailViewController];
    id v13 = [v12 collectionView];
    [v13 removeFromSuperview];

    [(ICDocCamViewController *)self setThumbnailViewController:0];
  }
  dispatch_semaphore_t v14 = [(ICDocCamViewController *)self captureEventInteraction];
  [v14 setEnabled:0];
}

void __43__ICDocCamViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) setupResult])
  {
    v2 = [*(id *)(a1 + 32) session];
    int v3 = [v2 isRunning];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) session];
      [v4 stopRunning];

      objc_super v5 = *(void **)(a1 + 32);
      [v5 removeObserversIfNecessary];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  int v3 = [(ICDocCamViewController *)self view];
  [v3 bounds];
  -[ICDocCamViewController setViewBoundsSize:](self, "setViewBoundsSize:", v4, v5);

  v6 = [(ICDocCamViewController *)self view];
  v7 = [v6 window];
  objc_super v8 = [v7 windowScene];
  -[ICDocCamViewController setStatusBarOrientation:](self, "setStatusBarOrientation:", [v8 interfaceOrientation]);

  dispatch_queue_t v9 = [(ICDocCamViewController *)self view];
  objc_super v10 = [v9 tintColor];
  objc_msgSend(v10, "dc_lighterColor");
  id v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  cameraHighlightColor = self->_cameraHighlightColor;
  self->_cameraHighlightColor = v11;

  [(ICDocCamViewController *)self setupThumbnailViewControllerIfNecessary];
  [(ICDocCamViewController *)self updateAutoButtonTitleForAutoMode:[(ICDocCamViewController *)self autoMode]];
  [(ICDocCamViewController *)self updateFilterAndFlashButtons];
  [(ICDocCamViewController *)self updateAllConstraints];

  [(ICDocCamViewController *)self setUpFilterScrollView];
}

- (void)dealloc
{
  [(ICDocCamViewController *)self removeAllNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v3 dealloc];
}

- (void)viewSafeAreaInsetsDidChange
{
  [(ICDocCamViewController *)self setNeedsStatusBarAppearanceUpdate];
  objc_super v3 = [(ICDocCamViewController *)self view];
  [v3 setNeedsUpdateConstraints];

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v4 viewSafeAreaInsetsDidChange];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamViewController;
  [(ICDocCamViewController *)&v5 traitCollectionDidChange:v4];
  [(ICDocCamViewController *)self updateLabelColors];
}

- (void)initializeUserInterface
{
  BOOL v3 = [(ICDocCamViewController *)self scanMovieRecordingEnabled];
  id v4 = [(ICDocCamViewController *)self recordButton];
  id v191 = v4;
  if (v3)
  {
    [v4 setEnabled:1];

    id v192 = [(ICDocCamViewController *)self recordButton];
    [v192 setHidden:0];
  }
  else
  {
    [v4 setEnabled:0];

    id v192 = [(ICDocCamViewController *)self recordButton];
    [v192 setHidden:1];
  }

  id v193 = [(ICDocCamViewController *)self view];
  objc_super v5 = [v193 window];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  }
  v7 = [v6 windowScene];
  -[ICDocCamViewController setStatusBarOrientation:](self, "setStatusBarOrientation:", [v7 interfaceOrientation]);

  if (!v5) {
  [(ICDocCamViewController *)self setEdgesForExtendedLayout:15];
  }
  [(ICDocCamViewController *)self setExtendedLayoutIncludesOpaqueBars:0];
  id v194 = [(ICDocCamViewController *)self navigationController];
  objc_super v8 = [v194 navigationBar];
  [v8 setBarStyle:0];

  objc_msgSend(MEMORY[0x263F1C550], "dc_barColor");
  id v195 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v9 = [(ICDocCamViewController *)self navigationController];
  objc_super v10 = [v9 navigationBar];
  [v10 setBarTintColor:v195];

  [(ICDocCamViewController *)self setNeedsStatusBarAppearanceUpdate];
  id v196 = +[ICDocCamSaveButton buttonWithType:1];
  -[ICDocCamViewController setSaveButton:](self, "setSaveButton:");

  id v197 = [(ICDocCamViewController *)self saveButton];
  [v197 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v198 = [(ICDocCamViewController *)self saveButton];
  [v198 setHidden:1];

  id v199 = [(ICDocCamViewController *)self view];
  id v11 = [(ICDocCamViewController *)self saveButton];
  [v199 addSubview:v11];

  id v200 = [(ICDocCamViewController *)self documentInfoCollection];
  id v12 = [v200 docInfos];
  uint64_t v13 = [v12 count];
  dispatch_semaphore_t v14 = [(ICDocCamViewController *)self saveButton];
  [v14 setDocumentCount:v13];

  id v201 = [(ICDocCamViewController *)self saveButton];
  [v201 addTarget:self action:sel_saveAction_ forControlEvents:64];

  id v202 = [(ICDocCamViewController *)self autoShutterOnView];
  [v202 setHidden:0];

  id v203 = [(ICDocCamViewController *)self autoShutterOnView];
  [v203 setAlpha:1.0];

  id v204 = [(ICDocCamViewController *)self autoShutterOnView];
  objc_super v15 = [v204 layer];
  [v15 setOpacity:0.0];

  id v205 = [(ICDocCamViewController *)self autoShutterOffView];
  [v205 setHidden:0];

  id v206 = [(ICDocCamViewController *)self autoShutterOffView];
  [v206 setAlpha:1.0];

  id v207 = [(ICDocCamViewController *)self autoShutterOffView];
  double v16 = [v207 layer];
  [v16 setOpacity:0.0];

  id v208 = [(ICDocCamViewController *)self filterNameFeedbackView];
  [v208 setHidden:0];

  id v209 = [(ICDocCamViewController *)self filterNameFeedbackView];
  [v209 setAlpha:1.0];

  id v210 = [(ICDocCamViewController *)self filterNameFeedbackView];
  double v17 = [v210 layer];
  [v17 setOpacity:0.0];

  id v211 = [(ICDocCamViewController *)self moveCameraCloserView];
  [v211 setHidden:0];

  id v212 = [(ICDocCamViewController *)self moveCameraCloserView];
  [v212 setAlpha:1.0];

  id v213 = [(ICDocCamViewController *)self moveCameraCloserView];
  double v18 = [v213 layer];
  [v18 setOpacity:0.0];

  [(ICDocCamViewController *)self setFilterSettingUIShowing:0];
  id v214 = [(ICDocCamViewController *)self cameraUnavailableScrim];
  [v214 setHidden:1];

  id v215 = [MEMORY[0x263F1C550] blackColor];
  double v19 = [(ICDocCamViewController *)self autoShutterOnLabel];
  [v19 setTextColor:v215];

  id v216 = [MEMORY[0x263F1C550] blackColor];
  id v20 = [(ICDocCamViewController *)self autoShutterOffLabel];
  [v20 setTextColor:v216];

  id v217 = [MEMORY[0x263F1C550] blackColor];
  id v21 = [(ICDocCamViewController *)self filterNameFeedbackLabel];
  [v21 setTextColor:v217];

  id v218 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v22 = [v218 userInterfaceIdiom];

  if (v22)
  {
    id v219 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
    [v219 setHidden:1];

    id v220 = [(ICDocCamViewController *)self filterViewButton];
    [v220 setHidden:1];

    id v221 = [(ICDocCamViewController *)self filterViewContainer];
    [v221 setHidden:0];

    id v222 = [(ICDocCamViewController *)self filterViewButton];
    [v222 removeFromSuperview];

    [(ICDocCamViewController *)self setFilterViewButton:0];
  }
  else
  {
    id v223 = [(ICDocCamViewController *)self filterButton];
    [v223 setHidden:1];
  }
  id v224 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v23 = [v224 userInterfaceIdiom];

  if (v23)
  {
    id v225 = [(ICDocCamViewController *)self flashSettingView];
    id v24 = [v225 layer];
    [v24 setShadowRadius:0.0];

    id v226 = [(ICDocCamViewController *)self flashSettingView];
    id v25 = [v226 layer];
    LODWORD(v26) = 1050253722;
    [v25 setShadowOpacity:v26];

    id v227 = [(ICDocCamViewController *)self flashSettingView];
    v27 = [v227 layer];
    objc_msgSend(v27, "setShadowOffset:", 0.0, 0.0);

    id v228 = [(ICDocCamViewController *)self flashSettingView];
    v28 = [v228 layer];
    [v28 setMasksToBounds:0];

    id v229 = [(ICDocCamViewController *)self flashSettingView];
    v29 = [v229 layer];
    [v29 setCornerRadius:13.0];

    id v230 = [(ICDocCamViewController *)self flashSettingView];
    v30 = [v230 layer];
    [v30 setBorderWidth:0.0];
  }
  else
  {
    id v230 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    v30 = [(ICDocCamViewController *)self flashSettingView];
    [v30 setBackgroundColor:v230];
  }

  [(ICDocCamViewController *)self setFlashMode:2];
  id v231 = [(ICDocCamViewController *)self flashButtonImage];
  objc_super v31 = [(ICDocCamViewController *)self flashButton];
  [v31 setImage:v231 forState:0];

  v32 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v32 setImage:v231 forState:0];

  v33 = [(ICDocCamViewController *)self flashButton];
  v34 = [MEMORY[0x263F1C550] whiteColor];
  [v33 setTintColor:v34];

  v35 = [(ICDocCamViewController *)self flashButtonForIPhone];
  v36 = [MEMORY[0x263F1C550] whiteColor];
  [v35 setTintColor:v36];

  v37 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v37 setLargeContentImage:v231];

  [(ICDocCamViewController *)self setAutoMode:1];
  if ([(ICDocCamViewController *)self autoMode])
  {
    v38 = [(ICDocCamViewController *)self userPromptView];
    [v38 setHidden:0];
  }
  else
  {
    [(ICDocCamViewController *)self hideShutter:0];
    v38 = [(ICDocCamViewController *)self userPromptView];
    [v38 setHidden:1];
  }

  BOOL v39 = [(ICDocCamViewController *)self autoMode];
  v40 = [(ICDocCamViewController *)self overlayView];
  [v40 setShowGridAnimation:v39];

  v41 = [(ICDocCamViewController *)self cameraHighlightColor];
  v42 = [(ICDocCamViewController *)self overlayView];
  [v42 setRectColor:v41];

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v43 = objc_claimAutoreleasedReturnValue(),
        uint64_t v44 = [v43 userInterfaceIdiom],
        v43,
        v44 == 1))
  {
    v45 = [(ICDocCamViewController *)self flashButton];
    v46 = [v45 layer];
    [v46 setShadowOpacity:0.0];

    v47 = [(ICDocCamViewController *)self flashButton];
    v48 = [v47 layer];
    [v48 setShadowRadius:0.0];
  }
  v49 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v49 hasFlash])
  {
    v50 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v51 = [v50 userInterfaceIdiom];

    v52 = [(ICDocCamViewController *)self flashSettingView];
    if (v51) {
      [v52 setHidden:0];
    }
    else {
      [v52 setHidden:1];
    }
  }
  else
  {
    v53 = [(ICDocCamViewController *)self flashButton];
    [v53 setHidden:1];

    v52 = [(ICDocCamViewController *)self flashSettingView];
    [v52 setHidden:1];
  }

  [(ICDocCamViewController *)self enableUIElements:0];
  [(ICDocCamViewController *)self enableShutter:0];
  [(ICDocCamViewController *)self initializeFilters];
  v54 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v55 = [v54 userInterfaceIdiom];

  if (v55)
  {
    [(ICDocCamViewController *)self topToolbarForIPhone];
  }
  else
  {
    v57 = [(ICDocCamViewController *)self cancelButton];
    [v57 setHidden:1];

    v58 = [(ICDocCamViewController *)self flashButton];
    [v58 setHidden:1];

    v59 = [(ICDocCamViewController *)self filterButton];
    [v59 setHidden:1];

    v60 = [(ICDocCamViewController *)self autoButton];
    [v60 setHidden:1];

    [(ICDocCamViewController *)self manualButton];
  v56 = };
  [v56 setHidden:1];

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v61 = objc_claimAutoreleasedReturnValue(),
        uint64_t v62 = [v61 userInterfaceIdiom],
        v61,
        v62 == 1))
  {
    v63 = [(ICDocCamViewController *)self autoButton];
    [v63 sizeToFit];

    v64 = [(ICDocCamViewController *)self manualButton];
    [v64 sizeToFit];

    v65 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
    v66 = [MEMORY[0x263F1C550] clearColor];
    id v67 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v68 = [v67 CGColor];
    v69 = [(ICDocCamViewController *)self flashSettingView];
    v70 = [v69 layer];
    [v70 setBorderColor:v68];

    v71 = [(ICDocCamViewController *)self flashSettingView];
    v72 = [v71 layer];
    [v72 setBorderWidth:0.0];

    v73 = [(ICDocCamViewController *)self flashSettingView];
    [v73 frame];
    double v75 = v74;
    v76 = [(ICDocCamViewController *)self flashSettingView];
    v77 = [v76 layer];
    [v77 setCornerRadius:v75 * 0.5];

    v78 = [(ICDocCamViewController *)self flashSettingView];
    [v78 setBackgroundColor:v65];

    id v79 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v80 = [v79 CGColor];
    v81 = [(ICDocCamViewController *)self autoButton];
    v82 = [v81 layer];
    [v82 setBorderColor:v80];

    v83 = [(ICDocCamViewController *)self autoButton];
    v84 = [v83 layer];
    [v84 setBorderWidth:0.0];

    v85 = [(ICDocCamViewController *)self autoButton];
    [v85 frame];
    double v87 = v86;
    v88 = [(ICDocCamViewController *)self autoButton];
    v89 = [v88 layer];
    [v89 setCornerRadius:v87 * 0.5];

    if ([(ICDocCamViewController *)self autoMode]) {
      v90 = v65;
    }
    else {
      v90 = v66;
    }
    uint64_t v91 = [v90 CGColor];
    v92 = [(ICDocCamViewController *)self autoButton];
    v93 = [v92 layer];
    [v93 setBackgroundColor:v91];

    id v94 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v95 = [v94 CGColor];
    v96 = [(ICDocCamViewController *)self manualButton];
    v97 = [v96 layer];
    [v97 setBorderColor:v95];

    v98 = [(ICDocCamViewController *)self manualButton];
    v99 = [v98 layer];
    [v99 setBorderWidth:0.0];

    v100 = [(ICDocCamViewController *)self manualButton];
    [v100 frame];
    double v102 = v101;
    v103 = [(ICDocCamViewController *)self manualButton];
    v104 = [v103 layer];
    [v104 setCornerRadius:v102 * 0.5];

    if ([(ICDocCamViewController *)self autoMode]) {
      v105 = v66;
    }
    else {
      v105 = v65;
    }
    uint64_t v106 = [v105 CGColor];
    v107 = [(ICDocCamViewController *)self manualButton];
    v108 = [v107 layer];
    [v108 setBackgroundColor:v106];

    id v109 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v110 = [v109 CGColor];
    v111 = [(ICDocCamViewController *)self filterViewContainer];
    v112 = [v111 layer];
    [v112 setBorderColor:v110];

    v113 = [(ICDocCamViewController *)self filterViewContainer];
    v114 = [v113 layer];
    [v114 setBorderWidth:0.0];

    v115 = [(ICDocCamViewController *)self filterViewContainer];
    [v115 frame];
    double v117 = v116;
    v118 = [(ICDocCamViewController *)self filterViewContainer];
    v119 = [v118 layer];
    [v119 setCornerRadius:v117 * 0.5];

    v120 = [(ICDocCamViewController *)self filterViewContainer];
    [v120 setBackgroundColor:v65];
  }
  v121 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v122 = [v121 userInterfaceIdiom];

  v123 = (double *)MEMORY[0x263F1D338];
  if (!v122)
  {
    v124 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D338]];
    v125 = [(ICDocCamViewController *)self cancelButton];
    v126 = [v125 titleLabel];
    [v126 setFont:v124];
  }
  v127 = [(ICDocCamViewController *)self saveButton];
  v128 = [v127 layer];
  [v128 setMasksToBounds:0];

  id v129 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v130 = [v129 CGColor];
  v131 = [(ICDocCamViewController *)self saveButton];
  v132 = [v131 layer];
  [v132 setShadowColor:v130];

  v133 = [(ICDocCamViewController *)self saveButton];
  v134 = [v133 layer];
  LODWORD(v135) = 1047904911;
  [v134 setShadowOpacity:v135];

  v136 = [(ICDocCamViewController *)self saveButton];
  v137 = [v136 layer];
  [v137 setShadowRadius:2.0];

  v138 = [(ICDocCamViewController *)self saveButton];
  v139 = [v138 layer];
  objc_msgSend(v139, "setShadowOffset:", 0.0, 0.0);

  v140 = [(ICDocCamViewController *)self saveButton];
  [v140 sizeToFit];

  v141 = [(ICDocCamViewController *)self cancelButton];
  v142 = [v141 layer];
  [v142 setMasksToBounds:0];

  id v143 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v144 = [v143 CGColor];
  v145 = [(ICDocCamViewController *)self cancelButton];
  v146 = [v145 layer];
  [v146 setShadowColor:v144];

  v147 = [(ICDocCamViewController *)self cancelButton];
  v148 = [v147 layer];
  LODWORD(v149) = 1053609165;
  [v148 setShadowOpacity:v149];

  v150 = [(ICDocCamViewController *)self cancelButton];
  v151 = [v150 layer];
  [v151 setShadowRadius:2.0];

  v152 = [(ICDocCamViewController *)self cancelButton];
  v153 = [v152 layer];
  objc_msgSend(v153, "setShadowOffset:", 0.0, 1.0);

  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v154 = objc_claimAutoreleasedReturnValue(),
        uint64_t v155 = [v154 userInterfaceIdiom],
        v154,
        v155 == 1))
  {
    double v156 = *v123;
    v157 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:*v123];
    v158 = [(ICDocCamViewController *)self flashSettingViewOnButton];
    v159 = [v158 titleLabel];
    [v159 setFont:v157];

    v160 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v156];
    v161 = [(ICDocCamViewController *)self flashSettingViewOffButton];
    v162 = [v161 titleLabel];
    [v162 setFont:v160];

    v163 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v156];
    v164 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
    v165 = [v164 titleLabel];
    [v165 setFont:v163];
  }
  else
  {
    double v166 = *MEMORY[0x263F1D330];
    v167 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:*MEMORY[0x263F1D330]];
    v168 = [(ICDocCamViewController *)self flashSettingViewOnButton];
    v169 = [v168 titleLabel];
    [v169 setFont:v167];

    v170 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v166];
    v171 = [(ICDocCamViewController *)self flashSettingViewOffButton];
    v172 = [v171 titleLabel];
    [v172 setFont:v170];

    v163 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v166];
    v164 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
    v165 = [v164 titleLabel];
    [v165 setFont:v163];
  }

  v173 = [(ICDocCamViewController *)self filterViewContainer];
  [v173 setAccessibilityLabel:@"Filter View Container"];

  v174 = [(ICDocCamViewController *)self filterView];
  [v174 setAccessibilityLabel:@"Filter View"];

  v175 = [(ICDocCamViewController *)self filterScrollViewContainer];
  [v175 setAccessibilityLabel:@"Filter Scroll View Container"];

  v176 = [(ICDocCamViewController *)self filterScrollView];
  [v176 setAccessibilityLabel:@"Filter Scroll View"];

  v177 = [(ICDocCamViewController *)self flashSettingView];
  [v177 setAccessibilityLabel:@"Flash Setting View"];

  v178 = [(ICDocCamViewController *)self flashSettingButtonView];
  [v178 setAccessibilityLabel:@"Flash Setting Button View"];

  v179 = [(ICDocCamViewController *)self autoButton];
  [v179 _accessibilitySetInterfaceStyleIntent:2];

  v180 = [(ICDocCamViewController *)self manualButton];
  [v180 _accessibilitySetInterfaceStyleIntent:2];

  v181 = [(ICDocCamViewController *)self flashButton];
  [v181 _accessibilitySetInterfaceStyleIntent:2];

  v182 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v182 _accessibilitySetInterfaceStyleIntent:2];

  v183 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  [v183 _accessibilitySetInterfaceStyleIntent:2];

  v184 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  [v184 _accessibilitySetInterfaceStyleIntent:2];

  v185 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  [v185 _accessibilitySetInterfaceStyleIntent:2];

  v186 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  [v186 _accessibilitySetInterfaceStyleIntent:2];

  [(ICDocCamViewController *)self updateLabelColors];
  [(ICDocCamViewController *)self setupAccessibilityInfo];
  v187 = [(ICDocCamViewController *)self cancelButton];
  id v188 = objc_alloc_init(MEMORY[0x263F1C878]);
  [v187 addInteraction:v188];

  v189 = [(ICDocCamViewController *)self saveButton];
  id v190 = objc_alloc_init(MEMORY[0x263F1C878]);
  [v189 addInteraction:v190];
}

- (void)setUpUserDefaults
{
  -[ICDocCamViewController setSegmentTopLeft:](self, "setSegmentTopLeft:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentTopRight:](self, "setSegmentTopRight:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentBottomLeft:](self, "setSegmentBottomLeft:", 0.0, 0.0);
  -[ICDocCamViewController setSegmentBottomRight:](self, "setSegmentBottomRight:", 0.0, 0.0);
  [(ICDocCamViewController *)self setSegmentMeanComputed:0];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 floatForKey:@"internalSettings.docCam.rectangle.segmentFudgeFactor"];
  -[ICDocCamViewController setSegmentationFudgeFactor:](self, "setSegmentationFudgeFactor:");

  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 floatForKey:@"internalSettings.docCam.rectangle.segmentVisualConfidence"];
  -[ICDocCamViewController setSegmentMinimumVisualConfidence:](self, "setSegmentMinimumVisualConfidence:");

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 floatForKey:@"internalSettings.docCam.rectangle.segmentVisualConfidence60Frames"];
  -[ICDocCamViewController setSegmentMinimumVisualConfidence60Frames:](self, "setSegmentMinimumVisualConfidence60Frames:");

  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 floatForKey:@"internalSettings.docCam.rectangle.segmentVisualConfidenceFinalScan"];
  -[ICDocCamViewController setSegmentMinimumVisualConfidenceFinalScan:](self, "setSegmentMinimumVisualConfidenceFinalScan:");

  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 floatForKey:@"internalSettings.docCam.rectangle.segmentStabilityStdDev"];
  -[ICDocCamViewController setSegmentStabilityStdDev:](self, "setSegmentStabilityStdDev:");

  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 floatForKey:@"internalSettings.docCam.rectangle.minimumAspectRatio"];
  -[ICDocCamViewController setRectangleMinimumAspectRatio:](self, "setRectangleMinimumAspectRatio:");

  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v9 floatForKey:@"internalSettings.docCam.rectangle.maximumAspectRatio"];
  -[ICDocCamViewController setRectangleMaximumAspectRatio:](self, "setRectangleMaximumAspectRatio:");

  id v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v10 floatForKey:@"internalSettings.docCam.rectangle.quadratureTolerance"];
  -[ICDocCamViewController setRectangleQuadratureTolerance:](self, "setRectangleQuadratureTolerance:");

  id v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v11 floatForKey:@"internalSettings.docCam.rectangle.minimumSize"];
  -[ICDocCamViewController setRectangleMinimumSize:](self, "setRectangleMinimumSize:");

  id v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v12 floatForKey:@"internalSettings.docCam.rectangle.minimumConfidence"];
  -[ICDocCamViewController setRectangleMinimumConfidence:](self, "setRectangleMinimumConfidence:");

  id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 floatForKey:@"internalSettings.docCam.rectangle.visualConfidence"];
  -[ICDocCamViewController setRectangleMinimumVisualConfidence:](self, "setRectangleMinimumVisualConfidence:");

  id v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setRectangleMaximumNumber:](self, "setRectangleMaximumNumber:", [v14 integerForKey:@"internalSettings.docCam.rectangle.maximumNumber"]);

  id v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v15 floatForKey:@"internalSettings.docCam.rectangle.stabilityStdDev"];
  -[ICDocCamViewController setRectangleStabilityStdDev:](self, "setRectangleStabilityStdDev:");

  id v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setRectangleDetectionEnabled:](self, "setRectangleDetectionEnabled:", [v16 BOOLForKey:@"internalSettings.docCam.rectangle.detectionEnabled"]);

  id v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setRegistrationEnabled:](self, "setRegistrationEnabled:", [v17 BOOLForKey:@"internalSettings.docCam.registration.enabled"]);

  id v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setDebugRectanglesEnabled:](self, "setDebugRectanglesEnabled:", [v18 BOOLForKey:@"internalSettings.docCam.debugRectangles.enabled"]);

  id v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setDisplayStringEnabled:](self, "setDisplayStringEnabled:", [v19 BOOLForKey:@"internalSettings.docCam.displayString.enabled"]);

  id v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setRealTimeRectangleDetection:](self, "setRealTimeRectangleDetection:", [v20 BOOLForKey:@"internalSettings.docCam.rectangle.realTime"]);

  id v21 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setSynchronousRectangleDetection:](self, "setSynchronousRectangleDetection:", [v21 BOOLForKey:@"internalSettings.docCam.rectangle.synchronous"]);

  id v22 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setQueueSizeForRectangleDetection:](self, "setQueueSizeForRectangleDetection:", [v22 integerForKey:@"internalSettings.docCam.rectangle.queueSize"]);

  id v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setScanMovieRecordingEnabled:](self, "setScanMovieRecordingEnabled:", [v23 BOOLForKey:@"internalSettings.docCam.scanMovieRecording.enabled"]);

  id v24 = [MEMORY[0x263EFFA40] standardUserDefaults];
  -[ICDocCamViewController setScanMovieRecordingDontShowWarning:](self, "setScanMovieRecordingDontShowWarning:", [v24 BOOLForKey:@"internalSettings.docCam.scanMovieRecording.doNotShowWarning"]);
}

- (void)preWarmFilters
{
  if (-[ICDocCamViewController preWarmFilters]::onceToken != -1) {
    dispatch_once(&-[ICDocCamViewController preWarmFilters]::onceToken, &__block_literal_global_15);
  }
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke()
{
  v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_565);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF910] date];
  v22.double width = 32.0;
  v22.double height = 32.0;
  UIGraphicsBeginImageContext(v22);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v2 = [MEMORY[0x263F1C550] redColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v2 CGColor]);

  v23.size.double width = 32.0;
  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double height = 32.0;
  CGContextFillRect(CurrentContext, v23);
  id v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v4 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", 0.1, 0.1, 0.9, 0.1, 0.1, 0.9, 0.9, 0.9);
  id v5 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v3 normalizedImageQuad:v4];
  id v6 = +[ICDocCamImageFilters filteredImage:v5 orientation:0 imageFilterType:0];
  id v7 = +[ICDocCamImageFilters filteredImage:v5 orientation:0 imageFilterType:1];
  id v8 = +[ICDocCamImageFilters filteredImage:v5 orientation:0 imageFilterType:2];
  id v9 = +[ICDocCamImageFilters filteredImage:v5 orientation:0 imageFilterType:3];
  id v10 = [MEMORY[0x263EFF910] date];
  [v10 timeIntervalSinceDate:v0];
  uint64_t v12 = v11;
  id v13 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    uint64_t v20 = v12;
    _os_log_impl(&dword_217885000, v13, OS_LOG_TYPE_DEFAULT, "Finished prewarming filters in: %.2f seconds", (uint8_t *)&v19, 0xCu);
  }

  if (!v5)
  {
    id v14 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_5();
    }
  }
  if (!v6)
  {
    id v15 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_4();
    }
  }
  if (!v7)
  {
    id v16 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_3();
    }
  }
  if (!v8)
  {
    id v17 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_2();
    }
  }
  if (!v9)
  {
    id v18 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_1();
    }
  }
}

- (void)setupThumbnailViewControllerIfNecessary
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = [(ICDocCamViewController *)self thumbnailViewController];

  if (!v3)
  {
    id v4 = [[ICDocCamThumbnailCollectionViewController alloc] initWithDelegate:self];
    [(ICDocCamViewController *)self setThumbnailViewController:v4];

    id v5 = [(ICDocCamViewController *)self documentInfoCollection];
    id v6 = [v5 docInfos];
    id v7 = [(ICDocCamViewController *)self thumbnailViewController];
    [v7 setDocumentInfoArray:v6];

    id v8 = [(ICDocCamViewController *)self imageCache];
    id v9 = [(ICDocCamViewController *)self thumbnailViewController];
    [v9 setImageCache:v8];

    id v10 = [(ICDocCamViewController *)self thumbnailViewController];
    [(ICDocCamViewController *)self addChildViewController:v10];

    uint64_t v11 = [(ICDocCamViewController *)self thumbnailViewController];
    uint64_t v12 = [v11 collectionView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v13 = [(ICDocCamViewController *)self thumbnailContainerView];
    id v14 = [(ICDocCamViewController *)self thumbnailViewController];
    id v15 = [v14 collectionView];
    [v13 addSubview:v15];

    id v16 = [(ICDocCamViewController *)self thumbnailViewController];
    [v16 didMoveToParentViewController:self];

    id v17 = (void *)MEMORY[0x263F08938];
    v34 = @"childView";
    id v18 = [(ICDocCamViewController *)self thumbnailViewController];
    int v19 = [v18 collectionView];
    v35[0] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v21 = [v17 constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v20];

    CGSize v22 = (void *)MEMORY[0x263F08938];
    v32 = @"childView";
    CGRect v23 = [(ICDocCamViewController *)self thumbnailViewController];
    id v24 = [v23 collectionView];
    v33 = v24;
    id v25 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    double v26 = [v22 constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v25];

    v27 = [(ICDocCamViewController *)self thumbnailViewController];
    v28 = [v27 collectionView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    [MEMORY[0x263F08938] activateConstraints:v21];
    [MEMORY[0x263F08938] activateConstraints:v26];
    v29 = [(ICDocCamViewController *)self thumbnailViewController];
    v30 = [v29 collectionView];
    objc_super v31 = [(ICDocCamViewController *)self thumbnailContainerView];
    [v31 setCollectionView:v30];
  }
}

- (BOOL)useDocumentSegmentation
{
  if (-[ICDocCamViewController useDocumentSegmentation]::onceToken != -1) {
    dispatch_once(&-[ICDocCamViewController useDocumentSegmentation]::onceToken, &__block_literal_global_581);
  }
  return -[ICDocCamViewController useDocumentSegmentation]::isEnabled;
}

void __49__ICDocCamViewController_useDocumentSegmentation__block_invoke()
{
  if (MGIsQuestionValid() && MGGetBoolAnswer())
  {
    v0 = +[DCSettings sharedSettings];
    int v1 = [v0 useDocumentSegmentationRequest];

    if (v1) {
      -[ICDocCamViewController useDocumentSegmentation]::isEnabled = 1;
    }
  }
}

- (void)updateAllConstraints
{
  if (DCDebugInterfaceEnabled())
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 1;
  }
  int64_t v5 = [(ICDocCamViewController *)self statusBarOrientation];
  id v6 = [(ICDocCamViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = -60.0;
  if ((unint64_t)(v5 - 1) < 2) {
    double v8 = -104.0;
  }
  if (v3) {
    double v8 = -100.0;
  }
  double v9 = v8 - v7;

  id v10 = [(ICDocCamViewController *)self userPromptViewVerticalConstraint];
  [v10 setConstant:v9];

  uint64_t v11 = [(ICDocCamViewController *)self moveCameraCloserViewVerticalConstraint];
  [v11 setConstant:v9];

  if (v3)
  {
    [(ICDocCamViewController *)self updateConstraintsForIPad];
  }
  else
  {
    [(ICDocCamViewController *)self updateConstraintsForIPhone];
  }
}

- (void)updateConstraintsForIPad
{
  v195[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICDocCamViewController *)self iPadLayoutConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08938];
    id v191 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    [v4 activateConstraints:v191];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ICDocCamViewController *)self setIPadLayoutConstraints:v5];

    id v6 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
    [v6 setConstant:30.0];

    double v7 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    double v8 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
    [v7 addObject:v8];

    double v9 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    id v10 = [(ICDocCamViewController *)self shutterButton];
    uint64_t v11 = [v10 centerXAnchor];
    uint64_t v12 = [(ICDocCamViewController *)self view];
    id v13 = [v12 trailingAnchor];
    id v14 = [v11 constraintEqualToAnchor:v13 constant:-50.0];
    [v9 addObject:v14];

    id v15 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    id v16 = [(ICDocCamViewController *)self shutterButton];
    id v17 = [v16 centerYAnchor];
    id v18 = [(ICDocCamViewController *)self view];
    int v19 = [v18 centerYAnchor];
    uint64_t v20 = [v17 constraintEqualToAnchor:v19 constant:0.0];
    [v15 addObject:v20];

    uint64_t v21 = [(ICDocCamViewController *)self manualButton];
    CGSize v22 = [v21 titleLabel];
    CGRect v23 = [v22 text];

    id v24 = [(ICDocCamViewController *)self autoButton];
    id v25 = [v24 titleLabel];
    double v26 = [v25 text];

    uint64_t v194 = *MEMORY[0x263F1C238];
    uint64_t v27 = v194;
    v28 = [(ICDocCamViewController *)self manualButton];
    v29 = [v28 titleLabel];
    v30 = [v29 font];
    v195[0] = v30;
    objc_super v31 = [NSDictionary dictionaryWithObjects:v195 forKeys:&v194 count:1];
    [v23 sizeWithAttributes:v31];
    double v33 = v32;

    uint64_t v192 = v27;
    v34 = [(ICDocCamViewController *)self autoButton];
    v35 = [v34 titleLabel];
    v36 = [v35 font];
    id v193 = v36;
    v37 = [NSDictionary dictionaryWithObjects:&v193 forKeys:&v192 count:1];
    [v26 sizeWithAttributes:v37];
    double v39 = v38;

    if (v33 >= v39) {
      double v40 = v33;
    }
    else {
      double v40 = v39;
    }
    float v41 = v40;
    double v42 = ceilf(v41) + 32.0;
    v43 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    uint64_t v44 = [(ICDocCamViewController *)self manualButton];
    if (v42 * 0.5 >= 43.0)
    {
      v45 = [v44 trailingAnchor];
      v46 = [(ICDocCamViewController *)self view];
      v47 = [v46 trailingAnchor];
      [v45 constraintGreaterThanOrEqualToAnchor:v47 constant:-11.0];
    }
    else
    {
      v45 = [v44 centerXAnchor];
      v46 = [(ICDocCamViewController *)self shutterButton];
      v47 = [v46 centerXAnchor];
      [v45 constraintEqualToAnchor:v47 constant:0.0];
    v48 = };
    [v43 addObject:v48];

    v49 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v50 = [(ICDocCamViewController *)self manualButton];
    uint64_t v51 = [v50 centerYAnchor];
    v52 = [(ICDocCamViewController *)self view];
    v53 = [v52 centerYAnchor];
    v54 = [v51 constraintEqualToAnchor:v53 constant:164.0];
    [v49 addObject:v54];

    uint64_t v55 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v56 = [(ICDocCamViewController *)self manualButton];
    v57 = [v56 widthAnchor];
    v58 = [v57 constraintEqualToConstant:v42];
    [v55 addObject:v58];

    v59 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v60 = [(ICDocCamViewController *)self autoButton];
    if (v42 * 0.5 >= 43.0)
    {
      v61 = [v60 trailingAnchor];
      uint64_t v62 = [(ICDocCamViewController *)self view];
      v63 = [v62 trailingAnchor];
      [v61 constraintGreaterThanOrEqualToAnchor:v63 constant:-11.0];
    }
    else
    {
      v61 = [v60 centerXAnchor];
      uint64_t v62 = [(ICDocCamViewController *)self shutterButton];
      v63 = [v62 centerXAnchor];
      [v61 constraintEqualToAnchor:v63 constant:0.0];
    v64 = };
    [v59 addObject:v64];

    v65 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v66 = [(ICDocCamViewController *)self autoButton];
    id v67 = [v66 centerYAnchor];
    uint64_t v68 = [(ICDocCamViewController *)self view];
    v69 = [v68 centerYAnchor];
    v70 = [v67 constraintEqualToAnchor:v69 constant:118.0];
    [v65 addObject:v70];

    v71 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v72 = [(ICDocCamViewController *)self autoButton];
    v73 = [v72 widthAnchor];
    double v74 = [v73 constraintEqualToConstant:v42];
    [v71 addObject:v74];

    double v75 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v76 = [(ICDocCamViewController *)self saveButton];
    v77 = [v76 trailingAnchor];
    v78 = [(ICDocCamViewController *)self view];
    id v79 = [v78 trailingAnchor];
    uint64_t v80 = [v77 constraintEqualToAnchor:v79 constant:-21.0];
    [v75 addObject:v80];

    v81 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v82 = [(ICDocCamViewController *)self saveButton];
    v83 = [v82 centerYAnchor];
    v84 = [(ICDocCamViewController *)self cancelButton];
    v85 = [v84 centerYAnchor];
    double v86 = [v83 constraintEqualToAnchor:v85 constant:0.0];
    [v81 addObject:v86];

    double v87 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v88 = [(ICDocCamViewController *)self cancelButton];
    v89 = [v88 leadingAnchor];
    v90 = [(ICDocCamViewController *)self view];
    uint64_t v91 = [v90 leadingAnchor];
    v92 = [v89 constraintEqualToAnchor:v91 constant:21.0];
    [v87 addObject:v92];

    v93 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    id v94 = [(ICDocCamViewController *)self cancelButton];
    uint64_t v95 = [v94 firstBaselineAnchor];
    v96 = [(ICDocCamViewController *)self view];
    v97 = [v96 bottomAnchor];
    v98 = [v95 constraintEqualToAnchor:v97 constant:-40.0];
    [v93 addObject:v98];

    v99 = [(ICDocCamViewController *)self thumbnailContainerView];
    [v99 setTranslatesAutoresizingMaskIntoConstraints:0];

    v100 = [(ICDocCamViewController *)self thumbnailContainerView];
    double v101 = [v100 leadingAnchor];
    double v102 = [(ICDocCamViewController *)self cancelButton];
    v103 = [v102 trailingAnchor];
    v104 = [v101 constraintEqualToAnchor:v103 constant:48.0];
    [(ICDocCamViewController *)self setThumbnailContainerViewLeadingConstraintForIPad:v104];

    v105 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    uint64_t v106 = [(ICDocCamViewController *)self thumbnailContainerViewLeadingConstraintForIPad];
    [v105 addObject:v106];

    v107 = [(ICDocCamViewController *)self thumbnailContainerView];
    v108 = [v107 trailingAnchor];
    id v109 = [(ICDocCamViewController *)self saveButton];
    uint64_t v110 = [v109 leadingAnchor];
    v111 = [v108 constraintEqualToAnchor:v110 constant:48.0];
    [(ICDocCamViewController *)self setThumbnailContainerViewTrailingConstraintForIPad:v111];

    [(ICDocCamViewController *)self updateThumbnailContainerViewConstraintConstantForIPad];
    v112 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v113 = [(ICDocCamViewController *)self thumbnailContainerViewTrailingConstraintForIPad];
    [v112 addObject:v113];

    v114 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v115 = [(ICDocCamViewController *)self thumbnailContainerView];
    double v116 = [v115 bottomAnchor];
    double v117 = [(ICDocCamViewController *)self view];
    v118 = [v117 safeAreaLayoutGuide];
    v119 = [v118 bottomAnchor];
    v120 = [v116 constraintEqualToAnchor:v119 constant:-16.0];
    [v114 addObject:v120];

    v121 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    uint64_t v122 = [(ICDocCamViewController *)self flashSettingView];
    v123 = [v122 trailingAnchor];
    v124 = [(ICDocCamViewController *)self flashButton];
    v125 = [v124 trailingAnchor];
    v126 = [v123 constraintEqualToAnchor:v125 constant:0.0];
    [v121 addObject:v126];

    v127 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v128 = [(ICDocCamViewController *)self flashSettingView];
    id v129 = [v128 centerYAnchor];
    uint64_t v130 = [(ICDocCamViewController *)self flashButton];
    v131 = [v130 centerYAnchor];
    v132 = [v129 constraintEqualToAnchor:v131 constant:0.0];
    [v127 addObject:v132];

    v133 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v134 = [(ICDocCamViewController *)self flashSettingView];
    double v135 = [v134 heightAnchor];
    v136 = [v135 constraintEqualToConstant:44.0];
    [v133 addObject:v136];

    v137 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v138 = [(ICDocCamViewController *)self filterViewContainer];
    v139 = [v138 centerYAnchor];
    v140 = [(ICDocCamViewController *)self filterButton];
    v141 = [v140 centerYAnchor];
    v142 = [v139 constraintEqualToAnchor:v141 constant:0.0];
    [v137 addObject:v142];

    id v143 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    uint64_t v144 = [(ICDocCamViewController *)self filterViewContainer];
    v145 = [v144 heightAnchor];
    v146 = [v145 constraintEqualToConstant:44.0];
    [v143 addObject:v146];

    v147 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v148 = [(ICDocCamViewController *)self filterViewContainer];
    double v149 = [v148 trailingAnchor];
    v150 = [(ICDocCamViewController *)self filterButton];
    v151 = [v150 trailingAnchor];
    v152 = [v149 constraintEqualToAnchor:v151 constant:0.0];
    [v147 addObject:v152];

    v153 = [(ICDocCamViewController *)self filterScrollView];
    objc_msgSend(v153, "setContentInset:", 0.0, 6.0, 0.0, 0.0);

    v154 = [(ICDocCamViewController *)self filterViewContainer];
    uint64_t v155 = [v154 widthAnchor];
    double v156 = [v155 constraintEqualToConstant:44.0];
    [(ICDocCamViewController *)self setFilterViewContainerWidthConstraint:v156];

    v157 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v158 = [(ICDocCamViewController *)self filterViewContainerWidthConstraint];
    [v157 addObject:v158];

    v159 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v160 = [(ICDocCamViewController *)self filterViewContainer];
    v161 = [v160 centerYAnchor];
    v162 = [(ICDocCamViewController *)self filterButton];
    v163 = [v162 centerYAnchor];
    v164 = [v161 constraintEqualToAnchor:v163 constant:0.0];
    [v159 addObject:v164];

    v165 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    double v166 = [(ICDocCamViewController *)self filterScrollViewContainer];
    v167 = [v166 leadingAnchor];
    v168 = [(ICDocCamViewController *)self filterView];
    v169 = [v168 leadingAnchor];
    v170 = [v167 constraintEqualToAnchor:v169 constant:0.0];
    [v165 addObject:v170];

    v171 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v172 = [(ICDocCamViewController *)self filterScrollViewContainer];
    v173 = [v172 topAnchor];
    v174 = [(ICDocCamViewController *)self filterView];
    v175 = [v174 topAnchor];
    v176 = [v173 constraintEqualToAnchor:v175 constant:0.0];
    [v171 addObject:v176];

    v177 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v178 = [(ICDocCamViewController *)self filterScrollViewContainer];
    v179 = [v178 bottomAnchor];
    v180 = [(ICDocCamViewController *)self filterView];
    v181 = [v180 bottomAnchor];
    v182 = [v179 constraintEqualToAnchor:v181 constant:0.0];
    [v177 addObject:v182];

    v183 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    v184 = [(ICDocCamViewController *)self filterScrollViewContainer];
    v185 = [v184 trailingAnchor];
    v186 = [(ICDocCamViewController *)self filterView];
    v187 = [v186 trailingAnchor];
    id v188 = [v185 constraintEqualToAnchor:v187 constant:0.0];
    [v183 addObject:v188];

    v189 = (void *)MEMORY[0x263F08938];
    id v190 = [(ICDocCamViewController *)self iPadLayoutConstraints];
    [v189 activateConstraints:v190];
  }
}

- (void)updateConstraintsForIPhone
{
  uint64_t v667 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICDocCamViewController *)self view];
  objc_msgSend(v3, "dc_directionalSafeAreaInsets");
  double v656 = v4;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  unint64_t v11 = [(ICDocCamViewController *)self statusBarOrientation] - 1;
  if (v11 > 1)
  {
    id v14 = [(ICDocCamViewController *)self view];
    id v15 = [v14 window];
    int v16 = objc_msgSend(v15, "dc_requiresCompactLandscapeIcons");

    int v654 = v16;
    double v17 = 44.0;
    if (v16) {
      double v17 = 32.0;
    }
    double v655 = v17;
    id v18 = [(ICDocCamViewController *)self view];
    int v19 = [v18 window];
    uint64_t v20 = [v19 windowScene];
    uint64_t v21 = [v20 statusBarManager];
    [v21 statusBarFrame];
    double v23 = v22;

    double v12 = 0.0;
    double v6 = fmax(v6 - v23, 0.0);
    double v13 = v10;
  }
  else
  {
    int v654 = 0;
    if (v8 <= 0.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = 10.0;
    }
    double v13 = v8 + v12;
    double v655 = 44.0;
  }
  id v24 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
  double v25 = -(v13 + 13.0);
  if (v24
    || ([(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints],
        (id v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v93 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];

    if (!v93)
    {
      id v94 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(ICDocCamViewController *)self setIPhonePortraitLayoutConstraints:v94];

      id v95 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(ICDocCamViewController *)self setIPhoneLandscapeLayoutConstraints:v95];

      id v96 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(ICDocCamViewController *)self setIPhoneCompactLandscapeLayoutConstraints:v96];

      v97 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v98 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
      [v97 addObject:v98];

      v99 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v100 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
      [v99 addObject:v100];

      double v101 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      double v102 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
      [v101 addObject:v102];

      v103 = [(ICDocCamViewController *)self topToolbarForIPhone];
      [v103 setTranslatesAutoresizingMaskIntoConstraints:0];

      v104 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      [v104 setTranslatesAutoresizingMaskIntoConstraints:0];

      v105 = [(ICDocCamViewController *)self autoButtonForIPhone];
      [v105 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v106 = [(ICDocCamViewController *)self flashButtonForIPhone];
      [v106 setTranslatesAutoresizingMaskIntoConstraints:0];

      v107 = [(ICDocCamViewController *)self filterButtonForIPhone];
      [v107 setTranslatesAutoresizingMaskIntoConstraints:0];

      v108 = [(ICDocCamViewController *)self saveButton];
      [v108 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v109 = [(ICDocCamViewController *)self filterScrollViewContainer];
      [v109 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v110 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v111 = [(ICDocCamViewController *)self shutterButton];
      v112 = [v111 centerXAnchor];
      v113 = [(ICDocCamViewController *)self view];
      v114 = [v113 centerXAnchor];
      v115 = [v112 constraintEqualToAnchor:v114 constant:0.0];
      [v110 addObject:v115];

      double v116 = [(ICDocCamViewController *)self shutterButton];
      double v117 = [v116 bottomAnchor];
      v118 = [(ICDocCamViewController *)self view];
      v119 = [v118 bottomAnchor];
      v120 = [v117 constraintEqualToAnchor:v119 constant:-(v13 + 13.0)];
      [(ICDocCamViewController *)self setShutterButtonBottomConstraintForPortraitIPhone:v120];

      v121 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      uint64_t v122 = [(ICDocCamViewController *)self shutterButtonBottomConstraintForPortraitIPhone];
      [v121 addObject:v122];

      v123 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v124 = [(ICDocCamViewController *)self shutterButton];
      v125 = [v124 centerYAnchor];
      v126 = [(ICDocCamViewController *)self view];
      v127 = [v126 centerYAnchor];
      v128 = [v125 constraintEqualToAnchor:v127 constant:0.0];
      [v123 addObject:v128];

      id v129 = [(ICDocCamViewController *)self shutterButton];
      uint64_t v130 = [v129 trailingAnchor];
      v131 = [(ICDocCamViewController *)self view];
      v132 = [v131 trailingAnchor];
      v133 = [v130 constraintEqualToAnchor:v132 constant:-(v13 + 13.0)];
      [(ICDocCamViewController *)self setShutterButtonBottomConstraintForLandscapeIPhone:v133];

      v134 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      double v135 = [(ICDocCamViewController *)self shutterButtonBottomConstraintForLandscapeIPhone];
      [v134 addObject:v135];

      v136 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v137 = [(ICDocCamViewController *)self shutterButton];
      v138 = [v137 centerYAnchor];
      v139 = [(ICDocCamViewController *)self view];
      v140 = [v139 centerYAnchor];
      v141 = [v138 constraintEqualToAnchor:v140 constant:0.0];
      [v136 addObject:v141];

      v142 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      id v143 = [(ICDocCamViewController *)self shutterButtonBottomConstraintForLandscapeIPhone];
      [v142 addObject:v143];

      uint64_t v144 = [MEMORY[0x263EFF980] array];
      v145 = [(ICDocCamViewController *)self saveButton];
      v146 = [v145 centerYAnchor];
      v147 = [(ICDocCamViewController *)self shutterButton];
      v148 = [v147 centerYAnchor];
      double v149 = [v146 constraintEqualToAnchor:v148 constant:0.0];
      [v144 addObject:v149];

      v150 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v150 addObjectsFromArray:v144];

      [v144 removeAllObjects];
      v151 = [(ICDocCamViewController *)self saveButton];
      v152 = [v151 centerYAnchor];
      v153 = [(ICDocCamViewController *)self view];
      v154 = [v153 bottomAnchor];
      uint64_t v155 = [v152 constraintEqualToAnchor:v154 constant:-34.0];
      [(ICDocCamViewController *)self setSaveButtonLandscapeVerticalConstraintForIPhone:v155];

      double v156 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v157 = [(ICDocCamViewController *)self saveButtonLandscapeVerticalConstraintForIPhone];
      [v156 addObject:v157];

      v158 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v159 = [(ICDocCamViewController *)self saveButtonLandscapeVerticalConstraintForIPhone];
      [v158 addObject:v159];

      v160 = [(ICDocCamViewController *)self saveButton];
      v161 = [v160 trailingAnchor];
      v162 = [(ICDocCamViewController *)self view];
      v163 = [v162 trailingAnchor];
      v164 = [v161 constraintEqualToAnchor:v163 constant:-16.0];
      [v144 addObject:v164];

      v165 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v165 addObjectsFromArray:v144];

      [v144 removeAllObjects];
      double v166 = [(ICDocCamViewController *)self saveButton];
      v167 = [v166 trailingAnchor];
      v168 = [(ICDocCamViewController *)self view];
      v169 = [v168 trailingAnchor];
      v170 = [v167 constraintEqualToAnchor:v169 constant:0.0];
      [(ICDocCamViewController *)self setSaveButtonLandscapeTrailingConstraintForIPhone:v170];

      v171 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v172 = [(ICDocCamViewController *)self saveButtonLandscapeTrailingConstraintForIPhone];
      [v171 addObject:v172];

      v173 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v174 = [(ICDocCamViewController *)self saveButtonLandscapeTrailingConstraintForIPhone];
      [v173 addObject:v174];

      v175 = [MEMORY[0x263EFF980] array];
      v176 = [(ICDocCamViewController *)self filterViewContainer];
      v177 = [v176 leadingAnchor];
      v178 = [(ICDocCamViewController *)self view];
      v179 = [v178 leadingAnchor];
      v180 = [v177 constraintEqualToAnchor:v179 constant:0.0];
      [v175 addObject:v180];

      v181 = [(ICDocCamViewController *)self filterViewContainer];
      v182 = [v181 trailingAnchor];
      v183 = [(ICDocCamViewController *)self view];
      v184 = [v183 trailingAnchor];
      v185 = [v182 constraintEqualToAnchor:v184 constant:0.0];
      [v175 addObject:v185];

      v186 = [(ICDocCamViewController *)self filterViewContainer];
      v187 = [v186 topAnchor];
      id v188 = [(ICDocCamViewController *)self view];
      v189 = [v188 topAnchor];
      id v190 = [v187 constraintEqualToAnchor:v189 constant:0.0];
      [v175 addObject:v190];

      id v191 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v191 addObjectsFromArray:v175];

      uint64_t v192 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v192 addObjectsFromArray:v175];

      id v193 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v193 addObjectsFromArray:v175];

      uint64_t v194 = [(ICDocCamViewController *)self filterViewContainer];
      id v195 = [v194 heightAnchor];
      id v196 = [v195 constraintEqualToConstant:v655];
      [(ICDocCamViewController *)self setFilterViewContainerHeightConstraint:v196];

      id v197 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      id v198 = [(ICDocCamViewController *)self filterViewContainerHeightConstraint];
      [v197 addObject:v198];

      id v199 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      id v200 = [(ICDocCamViewController *)self filterViewContainerHeightConstraint];
      [v199 addObject:v200];

      id v201 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      id v202 = [(ICDocCamViewController *)self filterViewContainerHeightConstraint];
      [v201 addObject:v202];

      id v203 = [MEMORY[0x263EFF980] array];
      id v204 = [(ICDocCamViewController *)self filterViewButton];
      id v205 = [v204 leadingAnchor];
      id v206 = [(ICDocCamViewController *)self filterView];
      id v207 = [v206 leadingAnchor];
      id v208 = [v205 constraintEqualToAnchor:v207 constant:4.0];
      [v203 addObject:v208];

      id v209 = [(ICDocCamViewController *)self filterViewButton];
      id v210 = [v209 bottomAnchor];
      id v211 = [(ICDocCamViewController *)self filterView];
      id v212 = [v211 bottomAnchor];
      id v213 = [v210 constraintEqualToAnchor:v212 constant:0.0];
      [v203 addObject:v213];

      id v214 = [(ICDocCamViewController *)self filterScrollViewContainer];
      id v215 = [v214 leadingAnchor];
      id v216 = [(ICDocCamViewController *)self filterViewButton];
      id v217 = [v216 trailingAnchor];
      id v218 = [v215 constraintEqualToAnchor:v217 constant:0.0];
      [v203 addObject:v218];

      id v219 = [(ICDocCamViewController *)self filterScrollViewContainer];
      id v220 = [v219 bottomAnchor];
      id v221 = [(ICDocCamViewController *)self filterView];
      id v222 = [v221 bottomAnchor];
      id v223 = [v220 constraintEqualToAnchor:v222 constant:0.0];
      [v203 addObject:v223];

      id v224 = [(ICDocCamViewController *)self filterScrollViewContainer];
      id v225 = [v224 trailingAnchor];
      id v226 = [(ICDocCamViewController *)self filterView];
      id v227 = [v226 trailingAnchor];
      id v228 = [v225 constraintEqualToAnchor:v227 constant:0.0];
      [v203 addObject:v228];

      id v229 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v229 addObjectsFromArray:v203];

      id v230 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v230 addObjectsFromArray:v203];

      id v231 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v231 addObjectsFromArray:v203];

      [v203 removeAllObjects];
      v232 = [(ICDocCamViewController *)self filterViewButton];
      v233 = [v232 topAnchor];
      v234 = [(ICDocCamViewController *)self filterView];
      v235 = [v234 bottomAnchor];
      v236 = [v233 constraintEqualToAnchor:v235 constant:-44.0];
      [v203 addObject:v236];

      v237 = [(ICDocCamViewController *)self filterScrollViewContainer];
      v238 = [v237 topAnchor];
      v239 = [(ICDocCamViewController *)self filterView];
      v240 = [v239 bottomAnchor];
      v241 = [v238 constraintEqualToAnchor:v240 constant:-44.0];
      [v203 addObject:v241];

      v242 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v242 addObjectsFromArray:v203];

      [v203 removeAllObjects];
      v243 = [(ICDocCamViewController *)self filterViewButton];
      v244 = [v243 topAnchor];
      v245 = [(ICDocCamViewController *)self filterView];
      v246 = [v245 bottomAnchor];
      v247 = [v244 constraintEqualToAnchor:v246 constant:-44.0];
      [v203 addObject:v247];

      v248 = [(ICDocCamViewController *)self filterScrollViewContainer];
      v249 = [v248 topAnchor];
      v250 = [(ICDocCamViewController *)self filterView];
      v251 = [v250 bottomAnchor];
      v252 = [v249 constraintEqualToAnchor:v251 constant:-44.0];
      [v203 addObject:v252];

      v253 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v253 addObjectsFromArray:v203];

      [v203 removeAllObjects];
      v254 = [(ICDocCamViewController *)self filterViewButton];
      v255 = [v254 topAnchor];
      v256 = [(ICDocCamViewController *)self filterView];
      v257 = [v256 bottomAnchor];
      v258 = [v255 constraintEqualToAnchor:v257 constant:-32.0];
      [v203 addObject:v258];

      v259 = [(ICDocCamViewController *)self filterScrollViewContainer];
      v260 = [v259 topAnchor];
      v261 = [(ICDocCamViewController *)self filterView];
      v262 = [v261 bottomAnchor];
      v263 = [v260 constraintEqualToAnchor:v262 constant:-32.0];
      [v203 addObject:v263];

      v264 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v264 addObjectsFromArray:v203];

      v265 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v266 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      v267 = [v266 centerYAnchor];
      v268 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v269 = [v268 bottomAnchor];
      v270 = [v267 constraintEqualToAnchor:v269 constant:-22.0];
      [v265 addObject:v270];

      v271 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v272 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      v273 = [v272 centerYAnchor];
      v274 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v275 = [v274 bottomAnchor];
      v276 = [v273 constraintEqualToAnchor:v275 constant:-22.0];
      [v271 addObject:v276];

      v277 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v278 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      v279 = [v278 centerYAnchor];
      v280 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v281 = [v280 bottomAnchor];
      v282 = [v279 constraintEqualToAnchor:v281 constant:-16.0];
      [v277 addObject:v282];

      v283 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      v284 = [v283 leadingAnchor];
      v285 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v286 = [v285 leadingAnchor];
      v287 = [v284 constraintEqualToAnchor:v286 constant:0.0];
      [(ICDocCamViewController *)self setCancelButtonForIPhoneLeadingConstraint:v287];

      v288 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v289 = [(ICDocCamViewController *)self cancelButtonForIPhoneLeadingConstraint];
      [v288 addObject:v289];

      v290 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v291 = [(ICDocCamViewController *)self cancelButtonForIPhoneLeadingConstraint];
      [v290 addObject:v291];

      v292 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v293 = [(ICDocCamViewController *)self cancelButtonForIPhoneLeadingConstraint];
      [v292 addObject:v293];

      v294 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v295 = [(ICDocCamViewController *)self autoButtonForIPhone];
      v296 = [v295 centerYAnchor];
      v297 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v298 = [v297 bottomAnchor];
      v299 = [v296 constraintEqualToAnchor:v298 constant:-22.0];
      [v294 addObject:v299];

      v300 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v301 = [(ICDocCamViewController *)self autoButtonForIPhone];
      v302 = [v301 centerYAnchor];
      v303 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v304 = [v303 bottomAnchor];
      v305 = [v302 constraintEqualToAnchor:v304 constant:-22.0];
      [v300 addObject:v305];

      v306 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v307 = [(ICDocCamViewController *)self autoButtonForIPhone];
      v308 = [v307 centerYAnchor];
      v309 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v310 = [v309 bottomAnchor];
      v311 = [v308 constraintEqualToAnchor:v310 constant:-16.0];
      [v306 addObject:v311];

      v312 = [(ICDocCamViewController *)self autoButtonForIPhone];
      v313 = [v312 trailingAnchor];
      v314 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v315 = [v314 trailingAnchor];
      v316 = [v313 constraintEqualToAnchor:v315 constant:0.0];
      [(ICDocCamViewController *)self setAutoButtonForIPhoneTrailingConstraint:v316];

      v317 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v318 = [(ICDocCamViewController *)self autoButtonForIPhoneTrailingConstraint];
      [v317 addObject:v318];

      v319 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v320 = [(ICDocCamViewController *)self autoButtonForIPhoneTrailingConstraint];
      [v319 addObject:v320];

      v321 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v322 = [(ICDocCamViewController *)self autoButtonForIPhoneTrailingConstraint];
      [v321 addObject:v322];

      v323 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v324 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v325 = [v324 centerYAnchor];
      v326 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v327 = [v326 bottomAnchor];
      v328 = [v325 constraintEqualToAnchor:v327 constant:-22.0];
      [v323 addObject:v328];

      v329 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v330 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v331 = [v330 centerYAnchor];
      v332 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v333 = [v332 bottomAnchor];
      v334 = [v331 constraintEqualToAnchor:v333 constant:-22.0];
      [v329 addObject:v334];

      v335 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v336 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v337 = [v336 centerYAnchor];
      v338 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v339 = [v338 bottomAnchor];
      v340 = [v337 constraintEqualToAnchor:v339 constant:-16.0];
      [v335 addObject:v340];

      v341 = [(ICDocCamViewController *)self view];
      [v341 bounds];
      double v343 = v342;

      v344 = [(ICDocCamViewController *)self view];
      [v344 bounds];
      double v346 = v345;

      if (v343 >= v346) {
        double v347 = v346;
      }
      else {
        double v347 = v343;
      }
      v348 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      [v348 bounds];
      double v350 = v349;

      v351 = [(ICDocCamViewController *)self autoButtonForIPhone];
      [v351 bounds];
      double v352 = v350 + 12.0;
      double v354 = v353 + 12.0;

      if (v352 < v354) {
        double v352 = v354;
      }
      v355 = [MEMORY[0x263EFF980] array];
      v356 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v357 = [v356 centerXAnchor];
      v358 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v359 = [v358 centerXAnchor];
      double v653 = (v347 - (v352 + v352) + -88.0) / 3.0 * 0.5;
      v360 = [v357 constraintEqualToAnchor:v359 constant:-22.0 - v653];
      [v355 addObject:v360];

      v361 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v361 addObjectsFromArray:v355];

      [v355 removeAllObjects];
      v362 = [(ICDocCamViewController *)self view];
      [v362 bounds];
      double v364 = v363;

      v365 = [(ICDocCamViewController *)self view];
      [v365 bounds];
      double v367 = v366;

      if (v364 >= v367) {
        double v368 = v364;
      }
      else {
        double v368 = v367;
      }
      v369 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      [v369 bounds];
      double v371 = v370;

      v372 = [(ICDocCamViewController *)self autoButtonForIPhone];
      [v372 bounds];
      double v373 = v371 + 12.0;
      double v375 = v374 + 12.0;

      if (v373 < v375) {
        double v373 = v375;
      }
      v376 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v377 = [v376 centerXAnchor];
      v378 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v379 = [v378 centerXAnchor];
      double v652 = (v368 - (v373 + v373) + -88.0) / 3.0 * 0.5;
      v380 = [v377 constraintEqualToAnchor:v379 constant:-22.0 - v652];
      [v355 addObject:v380];

      v381 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v381 addObjectsFromArray:v355];

      [v355 removeAllObjects];
      v382 = [(ICDocCamViewController *)self view];
      [v382 bounds];
      double v384 = v383;

      v385 = [(ICDocCamViewController *)self view];
      [v385 bounds];
      double v387 = v386;

      if (v384 >= v387) {
        double v387 = v384;
      }
      v388 = [(ICDocCamViewController *)self cancelButtonForIPhone];
      [v388 bounds];
      double v390 = v389;

      v391 = [(ICDocCamViewController *)self autoButtonForIPhone];
      [v391 bounds];
      double v392 = v390 + 12.0;
      double v394 = v393 + 12.0;

      if (v392 < v394) {
        double v392 = v394;
      }
      v395 = [(ICDocCamViewController *)self flashButtonForIPhone];
      v396 = [v395 centerXAnchor];
      v397 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v398 = [v397 centerXAnchor];
      double v399 = (v387 - (v392 + v392) + -64.0) / 3.0 * 0.5;
      v400 = [v396 constraintEqualToAnchor:v398 constant:-16.0 - v399];
      [v355 addObject:v400];

      v401 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v401 addObjectsFromArray:v355];

      [v355 removeAllObjects];
      v402 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v403 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v404 = [v403 centerYAnchor];
      v405 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v406 = [v405 bottomAnchor];
      v407 = [v404 constraintEqualToAnchor:v406 constant:-22.0];
      [v402 addObject:v407];

      v408 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v409 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v410 = [v409 centerYAnchor];
      v411 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v412 = [v411 bottomAnchor];
      v413 = [v410 constraintEqualToAnchor:v412 constant:-22.0];
      [v408 addObject:v413];

      v414 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v415 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v416 = [v415 centerYAnchor];
      v417 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v418 = [v417 bottomAnchor];
      v419 = [v416 constraintEqualToAnchor:v418 constant:-16.0];
      [v414 addObject:v419];

      v420 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v421 = [v420 centerXAnchor];
      v422 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v423 = [v422 centerXAnchor];
      v424 = [v421 constraintEqualToAnchor:v423 constant:v653 + 22.0];
      [v355 addObject:v424];

      v425 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v425 addObjectsFromArray:v355];

      [v355 removeAllObjects];
      v426 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v427 = [v426 centerXAnchor];
      v428 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v429 = [v428 centerXAnchor];
      v430 = [v427 constraintEqualToAnchor:v429 constant:v652 + 22.0];
      [v355 addObject:v430];

      v431 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v431 addObjectsFromArray:v355];

      [v355 removeAllObjects];
      v432 = [(ICDocCamViewController *)self filterButtonForIPhone];
      v433 = [v432 centerXAnchor];
      v434 = [(ICDocCamViewController *)self topToolbarForIPhone];
      v435 = [v434 centerXAnchor];
      v436 = [v433 constraintEqualToAnchor:v435 constant:v399 + 16.0];
      [v355 addObject:v436];

      v437 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v437 addObjectsFromArray:v355];

      v438 = [MEMORY[0x263EFF980] array];
      long long v663 = 0u;
      long long v664 = 0u;
      long long v661 = 0u;
      long long v662 = 0u;
      v439 = [(ICDocCamViewController *)self flashSettingView];
      v440 = [v439 constraints];

      uint64_t v441 = [v440 countByEnumeratingWithState:&v661 objects:v666 count:16];
      if (v441)
      {
        uint64_t v442 = *(void *)v662;
        do
        {
          for (uint64_t i = 0; i != v441; ++i)
          {
            if (*(void *)v662 != v442) {
              objc_enumerationMutation(v440);
            }
            [v438 addObject:*(void *)(*((void *)&v661 + 1) + 8 * i)];
          }
          uint64_t v441 = [v440 countByEnumeratingWithState:&v661 objects:v666 count:16];
        }
        while (v441);
      }

      v444 = [(ICDocCamViewController *)self flashSettingView];
      [v444 removeConstraints:v438];

      v445 = [MEMORY[0x263EFF980] array];

      long long v659 = 0u;
      long long v660 = 0u;
      long long v657 = 0u;
      long long v658 = 0u;
      v446 = [(ICDocCamViewController *)self flashSettingButtonView];
      v447 = [v446 constraints];

      uint64_t v448 = [v447 countByEnumeratingWithState:&v657 objects:v665 count:16];
      if (v448)
      {
        uint64_t v449 = *(void *)v658;
        do
        {
          for (uint64_t j = 0; j != v448; ++j)
          {
            if (*(void *)v658 != v449) {
              objc_enumerationMutation(v447);
            }
            [v445 addObject:*(void *)(*((void *)&v657 + 1) + 8 * j)];
          }
          uint64_t v448 = [v447 countByEnumeratingWithState:&v657 objects:v665 count:16];
        }
        while (v448);
      }

      v451 = [(ICDocCamViewController *)self flashSettingButtonView];
      [v451 removeConstraints:v445];

      v452 = [(ICDocCamViewController *)self view];
      v453 = [(ICDocCamViewController *)self flashSettingView];
      objc_msgSend(v452, "dc_removeAllConstraintsForSubview:", v453);

      v454 = [(ICDocCamViewController *)self flashSettingView];
      [v454 setTranslatesAutoresizingMaskIntoConstraints:0];

      v455 = [(ICDocCamViewController *)self flashSettingView];
      v456 = [(ICDocCamViewController *)self flashSettingButtonView];
      objc_msgSend(v455, "dc_removeAllConstraintsForSubview:", v456);

      v457 = [(ICDocCamViewController *)self flashSettingButtonView];
      [v457 setTranslatesAutoresizingMaskIntoConstraints:0];

      v458 = [(ICDocCamViewController *)self flashSettingButtonView];
      v459 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      objc_msgSend(v458, "dc_removeAllConstraintsForSubview:", v459);

      v460 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      [v460 setTranslatesAutoresizingMaskIntoConstraints:0];

      v461 = [(ICDocCamViewController *)self flashSettingButtonView];
      v462 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      objc_msgSend(v461, "dc_removeAllConstraintsForSubview:", v462);

      v463 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      [v463 setTranslatesAutoresizingMaskIntoConstraints:0];

      v464 = [(ICDocCamViewController *)self flashSettingButtonView];
      v465 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      objc_msgSend(v464, "dc_removeAllConstraintsForSubview:", v465);

      v466 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      [v466 setTranslatesAutoresizingMaskIntoConstraints:0];

      v467 = [(ICDocCamViewController *)self flashSettingButtonView];
      v468 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      objc_msgSend(v467, "dc_removeAllConstraintsForSubview:", v468);

      v469 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      [v469 setTranslatesAutoresizingMaskIntoConstraints:0];

      v470 = [(ICDocCamViewController *)self flashButton];
      [v470 setHidden:1];

      v471 = [MEMORY[0x263EFF980] array];
      v472 = [(ICDocCamViewController *)self flashSettingView];
      v473 = [v472 leadingAnchor];
      v474 = [(ICDocCamViewController *)self view];
      v475 = [v474 leadingAnchor];
      v476 = [v473 constraintEqualToAnchor:v475 constant:0.0];
      [v471 addObject:v476];

      v477 = [(ICDocCamViewController *)self flashSettingView];
      v478 = [v477 trailingAnchor];
      v479 = [(ICDocCamViewController *)self view];
      v480 = [v479 trailingAnchor];
      v481 = [v478 constraintEqualToAnchor:v480 constant:0.0];
      [v471 addObject:v481];

      v482 = [(ICDocCamViewController *)self flashSettingView];
      v483 = [v482 topAnchor];
      v484 = [(ICDocCamViewController *)self view];
      v485 = [v484 topAnchor];
      v486 = [v483 constraintEqualToAnchor:v485 constant:0.0];
      [v471 addObject:v486];

      v487 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v487 addObjectsFromArray:v471];

      v488 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v488 addObjectsFromArray:v471];

      v489 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v489 addObjectsFromArray:v471];

      v490 = [(ICDocCamViewController *)self flashSettingView];
      v491 = [v490 heightAnchor];
      v492 = [v491 constraintEqualToConstant:v655];
      [(ICDocCamViewController *)self setFlashSettingViewHeightConstraint:v492];

      v493 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v494 = [(ICDocCamViewController *)self flashSettingViewHeightConstraint];
      [v493 addObject:v494];

      v495 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v496 = [(ICDocCamViewController *)self flashSettingViewHeightConstraint];
      [v495 addObject:v496];

      v497 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v498 = [(ICDocCamViewController *)self flashSettingViewHeightConstraint];
      [v497 addObject:v498];

      v499 = [MEMORY[0x263EFF980] array];
      v500 = [(ICDocCamViewController *)self flashSettingButtonView];
      v501 = [v500 leadingAnchor];
      v502 = [(ICDocCamViewController *)self flashSettingView];
      v503 = [v502 leadingAnchor];
      v504 = [v501 constraintEqualToAnchor:v503 constant:0.0];
      [v499 addObject:v504];

      v505 = [(ICDocCamViewController *)self flashSettingButtonView];
      v506 = [v505 trailingAnchor];
      v507 = [(ICDocCamViewController *)self flashSettingView];
      v508 = [v507 trailingAnchor];
      v509 = [v506 constraintEqualToAnchor:v508 constant:0.0];
      [v499 addObject:v509];

      v510 = [(ICDocCamViewController *)self flashSettingButtonView];
      v511 = [v510 bottomAnchor];
      v512 = [(ICDocCamViewController *)self flashSettingView];
      v513 = [v512 bottomAnchor];
      v514 = [v511 constraintEqualToAnchor:v513 constant:0.0];
      [v499 addObject:v514];

      v515 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v515 addObjectsFromArray:v499];

      v516 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v516 addObjectsFromArray:v499];

      v517 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v517 addObjectsFromArray:v499];

      v518 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      v519 = [(ICDocCamViewController *)self flashSettingButtonView];
      v520 = [v519 topAnchor];
      v521 = [(ICDocCamViewController *)self flashSettingView];
      v522 = [v521 bottomAnchor];
      v523 = [v520 constraintEqualToAnchor:v522 constant:-44.0];
      [v518 addObject:v523];

      v524 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      v525 = [(ICDocCamViewController *)self flashSettingButtonView];
      v526 = [v525 topAnchor];
      v527 = [(ICDocCamViewController *)self flashSettingView];
      v528 = [v527 bottomAnchor];
      v529 = [v526 constraintEqualToAnchor:v528 constant:-44.0];
      [v524 addObject:v529];

      v530 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      v531 = [(ICDocCamViewController *)self flashSettingButtonView];
      v532 = [v531 topAnchor];
      v533 = [(ICDocCamViewController *)self flashSettingView];
      v534 = [v533 bottomAnchor];
      v535 = [v532 constraintEqualToAnchor:v534 constant:-32.0];
      [v530 addObject:v535];

      v536 = [(ICDocCamViewController *)self view];
      [v536 bounds];
      double v538 = v537;

      v539 = [(ICDocCamViewController *)self view];
      [v539 bounds];
      double v541 = v540;

      if (v538 >= v541) {
        double v542 = v541;
      }
      else {
        double v542 = v538;
      }
      v543 = [MEMORY[0x263EFF980] array];
      v544 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      v545 = [v544 centerXAnchor];
      v546 = [(ICDocCamViewController *)self flashSettingButtonView];
      v547 = [v546 leadingAnchor];
      v548 = [v545 constraintEqualToAnchor:v547 constant:24.0];
      [v543 addObject:v548];

      v549 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      v550 = [v549 centerYAnchor];
      v551 = [(ICDocCamViewController *)self flashSettingButtonView];
      v552 = [v551 centerYAnchor];
      v553 = [v550 constraintEqualToAnchor:v552 constant:0.0];
      [v543 addObject:v553];

      v554 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v555 = [v554 centerXAnchor];
      v556 = [(ICDocCamViewController *)self flashSettingButtonView];
      v557 = [v556 leadingAnchor];
      double v558 = v542 * 0.5;
      double v559 = (v542 * 0.5 + -32.0) * 0.5;
      v560 = [v555 constraintEqualToAnchor:v557 constant:v559 + 32.0];
      [v543 addObject:v560];

      v561 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v562 = [v561 centerYAnchor];
      v563 = [(ICDocCamViewController *)self flashSettingButtonView];
      v564 = [v563 centerYAnchor];
      v565 = [v562 constraintEqualToAnchor:v564 constant:0.0];
      [v543 addObject:v565];

      v566 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v567 = [v566 centerXAnchor];
      v568 = [(ICDocCamViewController *)self flashSettingButtonView];
      v569 = [v568 leadingAnchor];
      v570 = [v567 constraintEqualToAnchor:v569 constant:v558];
      [v543 addObject:v570];

      v571 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v572 = [v571 centerYAnchor];
      v573 = [(ICDocCamViewController *)self flashSettingButtonView];
      v574 = [v573 centerYAnchor];
      v575 = [v572 constraintEqualToAnchor:v574 constant:0.0];
      [v543 addObject:v575];

      v576 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      v577 = [v576 centerXAnchor];
      v578 = [(ICDocCamViewController *)self flashSettingButtonView];
      v579 = [v578 leadingAnchor];
      v580 = [v577 constraintEqualToAnchor:v579 constant:v558 + v559];
      [v543 addObject:v580];

      v581 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      v582 = [v581 centerYAnchor];
      v583 = [(ICDocCamViewController *)self flashSettingButtonView];
      v584 = [v583 centerYAnchor];
      v585 = [v582 constraintEqualToAnchor:v584 constant:0.0];
      [v543 addObject:v585];

      v586 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v586 addObjectsFromArray:v543];

      v587 = [MEMORY[0x263EFF980] array];
      v588 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      v589 = [v588 trailingAnchor];
      v590 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v591 = [v590 leadingAnchor];
      v592 = [v589 constraintEqualToAnchor:v591 constant:-37.0];
      [v587 addObject:v592];

      v593 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      v594 = [v593 centerYAnchor];
      v595 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v596 = [v595 centerYAnchor];
      v597 = [v594 constraintEqualToAnchor:v596 constant:0.0];
      [v587 addObject:v597];

      v598 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v599 = [v598 trailingAnchor];
      v600 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v601 = [v600 leadingAnchor];
      v602 = [v599 constraintEqualToAnchor:v601 constant:-46.0];
      [v587 addObject:v602];

      v603 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      v604 = [v603 centerYAnchor];
      v605 = [(ICDocCamViewController *)self flashSettingButtonView];
      v606 = [v605 centerYAnchor];
      v607 = [v604 constraintEqualToAnchor:v606 constant:0.0];
      [v587 addObject:v607];

      v608 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v609 = [v608 centerXAnchor];
      v610 = [(ICDocCamViewController *)self flashSettingButtonView];
      v611 = [v610 centerXAnchor];
      v612 = [v609 constraintEqualToAnchor:v611 constant:0.0];
      [v587 addObject:v612];

      v613 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v614 = [v613 centerYAnchor];
      v615 = [(ICDocCamViewController *)self flashSettingButtonView];
      v616 = [v615 centerYAnchor];
      v617 = [v614 constraintEqualToAnchor:v616 constant:0.0];
      [v587 addObject:v617];

      v618 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      v619 = [v618 leadingAnchor];
      v620 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      v621 = [v620 trailingAnchor];
      v622 = [v619 constraintEqualToAnchor:v621 constant:46.0];
      [v587 addObject:v622];

      v623 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      v624 = [v623 centerYAnchor];
      v625 = [(ICDocCamViewController *)self flashSettingButtonView];
      v626 = [v625 centerYAnchor];
      v627 = [v624 constraintEqualToAnchor:v626 constant:0.0];
      [v587 addObject:v627];

      v628 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v628 addObjectsFromArray:v587];

      v629 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v629 addObjectsFromArray:v587];

      v630 = [MEMORY[0x263EFF980] array];
      v631 = [(ICDocCamViewController *)self view];
      v632 = [(ICDocCamViewController *)self thumbnailContainerView];
      objc_msgSend(v631, "dc_removeAllConstraintsForSubview:", v632);

      v633 = [(ICDocCamViewController *)self thumbnailContainerView];
      [v633 setTranslatesAutoresizingMaskIntoConstraints:0];

      v634 = [(ICDocCamViewController *)self thumbnailContainerView];
      v635 = [v634 leadingAnchor];
      v636 = [(ICDocCamViewController *)self view];
      v637 = [v636 leadingAnchor];
      v638 = [v635 constraintEqualToAnchor:v637 constant:16.0];
      [(ICDocCamViewController *)self setThumbnailContainerViewLeadingConstraintForIPhone:v638];

      v639 = [(ICDocCamViewController *)self thumbnailContainerViewLeadingConstraintForIPhone];
      [v630 addObject:v639];

      v640 = [(ICDocCamViewController *)self thumbnailContainerView];
      v641 = [v640 bottomAnchor];
      v642 = [(ICDocCamViewController *)self view];
      v643 = [v642 bottomAnchor];
      v644 = [v641 constraintEqualToAnchor:v643 constant:0.0];
      [(ICDocCamViewController *)self setThumbnailContainerViewBottomConstraintForIPhone:v644];

      v645 = [(ICDocCamViewController *)self thumbnailContainerViewBottomConstraintForIPhone];
      [v630 addObject:v645];

      v646 = [(ICDocCamViewController *)self thumbnailContainerView];
      v647 = [v646 widthAnchor];
      v648 = [v647 constraintEqualToConstant:100.0];
      [v630 addObject:v648];

      v649 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v649 addObjectsFromArray:v630];

      v650 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v650 addObjectsFromArray:v630];

      v651 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v651 addObjectsFromArray:v630];
    }
  }
  double v26 = [(ICDocCamViewController *)self autoShutterOnTopLayoutConstraint];
  [v26 setConstant:v6 + 60.0];

  uint64_t v27 = [(ICDocCamViewController *)self autoShutterOffTopLayoutConstraint];
  [v27 setConstant:v6 + 60.0];

  v28 = [(ICDocCamViewController *)self shutterButtonBottomConstraintForPortraitIPhone];
  [v28 setConstant:v25];

  v29 = [(ICDocCamViewController *)self shutterButtonBottomConstraintForLandscapeIPhone];
  [v29 setConstant:v25];

  v30 = [(ICDocCamViewController *)self filterViewContainerHeightConstraint];
  [v30 setConstant:v655 + v6];

  objc_super v31 = [(ICDocCamViewController *)self flashSettingViewHeightConstraint];
  [v31 setConstant:v655 + v6];

  double v32 = [(ICDocCamViewController *)self thumbnailContainerViewBottomConstraintForIPhone];
  [v32 setConstant:-16.0 - v8 - v12];

  double v33 = [(ICDocCamViewController *)self thumbnailContainerViewLeadingConstraintForIPhone];
  [v33 setConstant:v656 + 16.0];

  v34 = [(ICDocCamViewController *)self cancelButtonForIPhoneLeadingConstraint];
  [v34 setConstant:v656 + 12.0];

  v35 = [(ICDocCamViewController *)self autoButtonForIPhoneTrailingConstraint];
  [v35 setConstant:-12.0 - v10];

  v36 = [(ICDocCamViewController *)self saveButtonLandscapeVerticalConstraintForIPhone];
  [v36 setConstant:-34.0 - v8];

  v37 = [(ICDocCamViewController *)self saveButtonLandscapeTrailingConstraintForIPhone];
  [v37 setConstant:-21.0 - v10];

  double v38 = [(ICDocCamViewController *)self view];
  [v38 frame];
  double v40 = v39;

  float v41 = [(ICDocCamViewController *)self view];
  [v41 frame];
  double v43 = v42;

  if (v40 >= v43) {
    double v40 = v43;
  }
  uint64_t v44 = [(ICDocCamViewController *)self saveButton];
  [v44 setMaxWidthForPortraitIPhone:(uint64_t)(v40 * 0.5 + -43.0 + -16.0)];

  v45 = [(ICDocCamViewController *)self filterButtonImage];
  v46 = [(ICDocCamViewController *)self filterButton];
  [v46 setImage:v45 forState:0];

  v47 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v47 setImage:v45 forState:0];

  v48 = [(ICDocCamViewController *)self filterViewButton];
  [v48 setImage:v45 forState:0];

  v49 = [(ICDocCamViewController *)self flashButtonImage];
  v50 = [(ICDocCamViewController *)self flashButton];
  [v50 setImage:v49 forState:0];

  uint64_t v51 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v51 setImage:v49 forState:0];

  v52 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  [v52 setImage:v49 forState:0];

  [(ICDocCamViewController *)self filterScrollViewContentWidthWithInterItemSpacing:20.0 startPadding:10.0 endPadding:0.0];
  double v54 = v53;
  uint64_t v55 = [(ICDocCamViewController *)self filterViewButton];
  [v55 frame];
  double v57 = v56;

  v58 = [(ICDocCamViewController *)self view];
  [v58 bounds];
  double v60 = v59;

  v61 = [(ICDocCamViewController *)self filterViewLeadingConstraint];
  [v61 setConstant:0.0];

  uint64_t v62 = [(ICDocCamViewController *)self filterViewTrailingConstraint];
  [v62 setConstant:0.0];

  if (v60 - (v54 + v57) <= 0.0 || v11 < 2)
  {
    if (v11 <= 1)
    {
      v64 = (void *)MEMORY[0x263F08938];
      v65 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
      [v64 deactivateConstraints:v65];

      v66 = (void *)MEMORY[0x263F08938];
      id v67 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
      [v66 deactivateConstraints:v67];

      uint64_t v68 = (void *)MEMORY[0x263F08938];
      v69 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
      [v68 activateConstraints:v69];

      v70 = [(ICDocCamViewController *)self topToolbarForIPhoneHeightConstraint];
      [v70 setConstant:v6 + 44.0];

      v71 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
      [v71 setConstant:v6 + 59.0];
      goto LABEL_24;
    }
  }
  else
  {
    v72 = [(ICDocCamViewController *)self view];
    [v72 bounds];
    double v74 = v73;

    double v75 = [(ICDocCamViewController *)self filterViewButton];
    [v75 frame];
    double v77 = v76;
    v78 = [(ICDocCamViewController *)self filterViewLeadingConstraint];
    double v79 = v74 - v54 + -10.0;
    [v78 setConstant:v79 * 0.5 - v77 + -4.0];

    uint64_t v80 = [(ICDocCamViewController *)self filterViewTrailingConstraint];
    [v80 setConstant:v79 * -0.5];
  }
  v81 = (void *)MEMORY[0x263F08938];
  v82 = [(ICDocCamViewController *)self iPhonePortraitLayoutConstraints];
  [v81 deactivateConstraints:v82];

  v83 = (void *)MEMORY[0x263F08938];
  if (v654)
  {
    v84 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
    [v83 deactivateConstraints:v84];

    v85 = (void *)MEMORY[0x263F08938];
    double v86 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
    [v85 activateConstraints:v86];

    double v87 = [(ICDocCamViewController *)self topToolbarForIPhoneHeightConstraint];
    [v87 setConstant:v6 + 32.0];

    v71 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
    [v71 setConstant:v6 + 45.0];
  }
  else
  {
    v88 = [(ICDocCamViewController *)self iPhoneCompactLandscapeLayoutConstraints];
    [v83 deactivateConstraints:v88];

    v89 = (void *)MEMORY[0x263F08938];
    v90 = [(ICDocCamViewController *)self iPhoneLandscapeLayoutConstraints];
    [v89 activateConstraints:v90];

    uint64_t v91 = [(ICDocCamViewController *)self topToolbarForIPhoneHeightConstraint];
    [v91 setConstant:v6 + 44.0];

    v71 = [(ICDocCamViewController *)self filterNameFeedbackViewTopLayoutConstraint];
    [v71 setConstant:v6 + 59.0];
  }
LABEL_24:

  v92 = [(ICDocCamViewController *)self view];
  [v92 layoutIfNeeded];
}

- (void)updateThumbnailContainerViewConstraintConstantForIPad
{
  id v8 = [(ICDocCamViewController *)self cancelButton];
  [v8 bounds];
  double v4 = v3;

  id v9 = [(ICDocCamViewController *)self saveButton];
  [v9 bounds];
  double v6 = v5;

  double v7 = vabdd_f64(v4, v6);
  id v10 = [(ICDocCamViewController *)self thumbnailContainerViewLeadingConstraintForIPad];
  if (v4 >= v6)
  {
    [v10 setConstant:48.0];

    id v11 = [(ICDocCamViewController *)self thumbnailContainerViewTrailingConstraintForIPad];
    [v11 setConstant:-(v7 + 48.0)];
  }
  else
  {
    [v10 setConstant:v7 + 48.0];

    id v11 = [(ICDocCamViewController *)self thumbnailContainerViewTrailingConstraintForIPad];
    [v11 setConstant:-48.0];
  }
}

- (double)filterScrollViewContentWidthWithInterItemSpacing:(double)a3 startPadding:(double)a4 endPadding:(double)a5
{
  for (unint64_t i = 0; ; ++i)
  {
    id v10 = [(ICDocCamViewController *)self filterButtons];
    unint64_t v11 = [v10 count];

    if (v11 <= i) {
      break;
    }
    double v12 = [(ICDocCamViewController *)self filterButtons];
    double v13 = [v12 objectAtIndexedSubscript:i];

    [v13 frame];
    double v15 = v14;
    int v16 = [(ICDocCamViewController *)self filterNames];
    unint64_t v17 = [v16 count] - 1;

    if (v17 <= i) {
      double v18 = a5;
    }
    else {
      double v18 = a3;
    }
    a4 = a4 + v15 + v18;
  }
  return a4;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v8 addBlockerOfType:@"OrientationBlocker" clearRectangles:1 clearQueue:1];

  v19.receiver = self;
  v19.super_class = (Class)ICDocCamViewController;
  -[ICDocCamViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v9 = [(ICDocCamViewController *)self accelerometer];
  uint64_t v10 = [v9 currentDeviceOrientation];

  if ((unint64_t)(v10 - 1) <= 3)
  {
    unint64_t v11 = [(ICDocCamViewController *)self videoPreviewLayer];
    double v12 = [v11 connection];
    [v12 setVideoOrientation:v10];
  }
  double v13 = [(ICDocCamViewController *)self navigationController];
  double v14 = [v13 viewControllers];
  double v15 = [v14 lastObject];
  if (v15 == self)
  {
    int v16 = [(ICDocCamViewController *)self presentedViewController];

    if (v16) {
      goto LABEL_7;
    }
    double v13 = [(ICDocCamViewController *)self shutterButton];
    +[ICDocCamUtilities prepareForRotationIfNecessaryWithShutterButton:v13 coodinator:v7];
  }
  else
  {
  }
LABEL_7:
  v17[4] = self;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v18[3] = &unk_2642AA0A8;
  v18[4] = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v17[3] = &unk_2642AA0A8;
  [v7 animateAlongsideTransition:v18 completion:v17];
}

uint64_t __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) saveButton];
  [v2 setNeedsLayout];

  double v3 = [*(id *)(a1 + 32) saveButton];
  [v3 layoutIfNeeded];

  [*(id *)(a1 + 32) updateAllConstraints];
  [*(id *)(a1 + 32) setUpFilterScrollView];
  double v4 = *(void **)(a1 + 32);

  return [v4 updateFilterChoiceButtonScrollPositionAnimated:1];
}

void __77__ICDocCamViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  double v3 = [v2 window];
  double v4 = [v3 windowScene];
  objc_msgSend(*(id *)(a1 + 32), "setStatusBarOrientation:", objc_msgSend(v4, "interfaceOrientation"));

  double v5 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v5 removeBlockerOfType:@"OrientationBlocker"];

  double v6 = [*(id *)(a1 + 32) accelerometer];
  uint64_t v7 = [v6 currentDeviceOrientation];

  if ((unint64_t)(v7 - 1) <= 3)
  {
    id v8 = *(void **)(a1 + 32);
    [v8 setReferenceOrientation:v7];
  }
}

- (void)updateAutoButtonTitleForAutoMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v27 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
  double v5 = [MEMORY[0x263F1C550] clearColor];
  double v6 = [(ICDocCamViewController *)self view];
  uint64_t v7 = [v6 tintColor];

  if (v3)
  {
    id v8 = +[DCLocalization localizedStringForKey:@"Auto" value:@"Auto" table:@"Localizable"];
    id v9 = [(ICDocCamViewController *)self autoButtonForIPhone];
    [v9 setTitle:v8 forState:0];

    uint64_t v10 = [(ICDocCamViewController *)self autoButtonForIPhone];
    [v10 setLargeContentTitle:v8];

    unint64_t v11 = [(ICDocCamViewController *)self cameraHighlightColor];
    double v12 = [(ICDocCamViewController *)self autoButton];
    [v12 setTintColor:v11];

    double v13 = [MEMORY[0x263F1C550] whiteColor];
    double v14 = [(ICDocCamViewController *)self manualButton];
    [v14 setTintColor:v13];

    double v15 = [(ICDocCamViewController *)self autoButton];
    [v15 setBackgroundColor:v27];

    int v16 = [(ICDocCamViewController *)self manualButton];
    [v16 setBackgroundColor:v5];
  }
  else
  {
    id v8 = +[DCLocalization localizedStringForKey:@"Manual" value:@"Manual" table:@"Localizable"];
    unint64_t v17 = [(ICDocCamViewController *)self autoButtonForIPhone];
    [v17 setTitle:v8 forState:0];

    double v18 = [(ICDocCamViewController *)self autoButtonForIPhone];
    [v18 setLargeContentTitle:v8];

    objc_super v19 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v20 = [(ICDocCamViewController *)self autoButton];
    [v20 setTintColor:v19];

    uint64_t v21 = [(ICDocCamViewController *)self cameraHighlightColor];
    double v22 = [(ICDocCamViewController *)self manualButton];
    [v22 setTintColor:v21];

    double v23 = [(ICDocCamViewController *)self autoButton];
    [v23 setBackgroundColor:v5];

    int v16 = [(ICDocCamViewController *)self manualButton];
    [v16 setBackgroundColor:v27];
  }

  id v24 = [(ICDocCamViewController *)self autoShutterOnView];
  [v24 setBackgroundColor:v7];

  if (objc_msgSend(v7, "dc_colorIsLight")) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  double v25 = [MEMORY[0x263F1C550] whiteColor];
  }
  double v26 = [(ICDocCamViewController *)self autoShutterOnLabel];
  [v26 setTextColor:v25];
}

- (void)enableShutterButtonIfPossible
{
  if ([(ICDocCamViewController *)self isInRetakeMode])
  {
    uint64_t v3 = 1;
  }
  else
  {
    double v4 = [(ICDocCamViewController *)self delegate];
    double v5 = [(ICDocCamViewController *)self documentInfoCollection];
    double v6 = [v5 docInfos];
    uint64_t v3 = objc_msgSend(v4, "documentCameraController:canAddImages:", self, objc_msgSend(v6, "count") + 1);
  }

  [(ICDocCamViewController *)self enableShutter:v3];
}

- (void)enableUIElements:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ICDocCamViewController *)self flashButton];
  [v5 setEnabled:v3];

  double v6 = [(ICDocCamViewController *)self filterButton];
  [v6 setEnabled:v3];

  uint64_t v7 = [(ICDocCamViewController *)self autoButton];
  [v7 setEnabled:v3];

  id v8 = [(ICDocCamViewController *)self manualButton];
  [v8 setEnabled:v3];

  id v9 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v9 setEnabled:v3];

  uint64_t v10 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v10 setEnabled:v3];

  unint64_t v11 = [(ICDocCamViewController *)self autoButtonForIPhone];
  [v11 setEnabled:v3];

  [(ICDocCamViewController *)self updateAccessibilityEnabledStateForUIElements];
}

- (void)killFeedbackDisplayIncludingUserPrompts:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(ICDocCamViewController *)self killFeedbackDisplayInternalIncludingUserPrompts:v3];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__ICDocCamViewController_killFeedbackDisplayIncludingUserPrompts___block_invoke;
    v5[3] = &unk_2642AA0D0;
    v5[4] = self;
    BOOL v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __66__ICDocCamViewController_killFeedbackDisplayIncludingUserPrompts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) killFeedbackDisplayInternalIncludingUserPrompts:*(unsigned __int8 *)(a1 + 40)];
}

- (void)killFeedbackDisplayInternalIncludingUserPrompts:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(ICDocCamViewController *)self autoShutterOffView];
  double v5 = [v14 layer];
  [v5 removeAllAnimations];

  id v15 = [(ICDocCamViewController *)self autoShutterOnView];
  BOOL v6 = [v15 layer];
  [v6 removeAllAnimations];

  id v16 = [(ICDocCamViewController *)self filterNameFeedbackView];
  uint64_t v7 = [v16 layer];
  [v7 removeAllAnimations];

  id v17 = [(ICDocCamViewController *)self autoShutterOnView];
  [v17 setHidden:0];

  id v18 = [(ICDocCamViewController *)self autoShutterOnView];
  [v18 setAlpha:1.0];

  id v19 = [(ICDocCamViewController *)self autoShutterOnView];
  id v8 = [v19 layer];
  [v8 setOpacity:0.0];

  id v20 = [(ICDocCamViewController *)self autoShutterOffView];
  [v20 setHidden:0];

  id v21 = [(ICDocCamViewController *)self autoShutterOffView];
  [v21 setAlpha:1.0];

  id v22 = [(ICDocCamViewController *)self autoShutterOffView];
  id v9 = [v22 layer];
  [v9 setOpacity:0.0];

  id v23 = [(ICDocCamViewController *)self filterNameFeedbackView];
  [v23 setHidden:0];

  id v24 = [(ICDocCamViewController *)self filterNameFeedbackView];
  [v24 setAlpha:1.0];

  id v25 = [(ICDocCamViewController *)self filterNameFeedbackView];
  uint64_t v10 = [v25 layer];
  [v10 setOpacity:0.0];

  if (v3)
  {
    id v26 = [(ICDocCamViewController *)self moveCameraCloserView];
    unint64_t v11 = [v26 layer];
    [v11 removeAllAnimations];

    id v27 = [(ICDocCamViewController *)self userPromptView];
    double v12 = [v27 layer];
    [v12 removeAllAnimations];

    id v28 = [(ICDocCamViewController *)self moveCameraCloserView];
    [v28 setHidden:0];

    id v29 = [(ICDocCamViewController *)self moveCameraCloserView];
    [v29 setAlpha:1.0];

    id v30 = [(ICDocCamViewController *)self moveCameraCloserView];
    double v13 = [v30 layer];
    [v13 setOpacity:0.0];

    id v31 = [(ICDocCamViewController *)self userPromptView];
    [v31 setAlpha:0.0];

    id v32 = [(ICDocCamViewController *)self userPromptView];
    [v32 setHidden:1];
  }
}

- (void)updateLabelColors
{
  id v7 = [MEMORY[0x263F1C550] labelColor];
  BOOL v3 = [(ICDocCamViewController *)self autoShutterOffLabel];
  [v3 setTextColor:v7];

  objc_msgSend(MEMORY[0x263F1C550], "dc_labelBackgroundColor");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(ICDocCamViewController *)self autoShutterOffView];
  [v4 setBackgroundColor:v8];

  id v9 = [MEMORY[0x263F1C550] labelColor];
  double v5 = [(ICDocCamViewController *)self filterNameFeedbackLabel];
  [v5 setTextColor:v9];

  objc_msgSend(MEMORY[0x263F1C550], "dc_labelBackgroundColor");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v6 = [(ICDocCamViewController *)self filterNameFeedbackView];
  [v6 setBackgroundColor:v10];
}

- (BOOL)isInRetakeMode
{
  return [(ICDocCamViewController *)self retakeIndex] >= 0;
}

- (void)disableRetakeMode
{
}

- (void)retakeButtonWasPressed
{
  id v6 = [(ICDocCamViewController *)self delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [(ICDocCamViewController *)self delegate];
    double v4 = [(ICDocCamViewController *)self documentInfoCollection];
    double v5 = [v4 docInfos];
    objc_msgSend(v7, "documentCameraControllerDidRetake:pageCount:", self, objc_msgSend(v5, "count"));
  }
}

- (BOOL)autoMode
{
  return staticAutoMode;
}

- (void)setAutoMode:(BOOL)a3
{
  staticAutoMode = a3;
}

- (void)setFlashMode:(int64_t)a3
{
  self->_flashMode = a3;
  id v5 = [(ICDocCamViewController *)self photoOutput];
  double v4 = [v5 photoSettingsForSceneMonitoring];
  [v4 setFlashMode:a3];
}

- (void)setupCaptureSession
{
  v20[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFA638]);
  [(ICDocCamViewController *)self setSession:v3];

  double v4 = [(ICDocCamViewController *)self session];
  id v5 = [(ICDocCamViewController *)self previewView];
  [v5 setSession:v4];

  [(ICDocCamViewController *)self setSetupResult:0];
  uint64_t v6 = *MEMORY[0x263EF9D48];
  if ([MEMORY[0x263EFA598] authorizationStatusForMediaType:*MEMORY[0x263EF9D48]] != 3)
  {
    id v7 = [(ICDocCamViewController *)self sessionQueue];
    dispatch_suspend(v7);

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke;
    v18[3] = &unk_2642AA0F8;
    v18[4] = self;
    [MEMORY[0x263EFA598] requestAccessForMediaType:v6 completionHandler:v18];
  }
  v19[0] = @"ICDocCamImageSequenceAnalyzer_Rectangles";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICDocCamViewController rectangleDetectionEnabled](self, "rectangleDetectionEnabled"));
  v20[0] = v8;
  v19[1] = @"ICDocCamImageSequenceAnalyzer_Registration";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ICDocCamViewController registrationEnabled](self, "registrationEnabled"));
  v20[1] = v9;
  v20[2] = MEMORY[0x263EFFA80];
  v19[2] = @"ICDocCamImageSequenceAnalyzer_SceneClassification";
  v19[3] = @"ICDocCamImageSequenceAnalyzer_RealTime";
  v20[3] = MEMORY[0x263EFFA88];
  v20[4] = MEMORY[0x263EFFA88];
  v19[4] = @"ICDocCamImageSequenceAnalyzer_Synchronous";
  v19[5] = @"ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize";
  v19[6] = @"ICDocCamImageSequenceAnalyzer_Debug";
  v20[5] = &unk_26C7ED838;
  v20[6] = MEMORY[0x263EFFA88];
  id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_2;
  v15[3] = &unk_2642AA120;
  objc_copyWeak(&v16, &location);
  unint64_t v11 = (void *)MEMORY[0x21D44FA30](v15);
  double v12 = [[ICDocCamImageSequenceAnalyzer alloc] initWithOptions:v10 callback:v11];
  [(ICDocCamViewController *)self setVkAnalyzer:v12];

  double v13 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_3;
  block[3] = &unk_2642AA080;
  block[4] = self;
  dispatch_async(v13, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) setSetupResult:1];
  }
  id v3 = [*(id *)(a1 + 32) sessionQueue];
  dispatch_resume(v3);
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained analyzerCallbackWithDictionaryResults:v3];
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_3(uint64_t a1)
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) setupResult]) {
    return;
  }
  uint64_t v94 = *MEMORY[0x263EF9D48];
  id v2 = +[ICDocCamViewController deviceWithMediaType:preferringPosition:](ICDocCamViewController, "deviceWithMediaType:preferringPosition:");
  id v110 = 0;
  v97 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v2 error:&v110];
  id v95 = v110;
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  unsigned int v4 = [v3 integerForKey:@"internalSettings.docCam.format"];

  if (v4 <= 3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  unint64_t v11 = [MEMORY[0x263F1C920] mainScreen];
  [v11 scale];
  double v13 = v12;

  if (v8 >= v10) {
    double v14 = v8;
  }
  else {
    double v14 = v10;
  }
  if (v8 >= v10) {
    double v15 = v10;
  }
  else {
    double v15 = v8;
  }
  if (v5 == 2)
  {
    [v2 formats];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v16 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v31)
    {
      id v18 = 0;
      double v32 = v8 * v13;
      double v33 = v10 * v13;
      double v34 = v14 / v15;
      uint64_t v35 = *(void *)v107;
      if (v32 >= v33) {
        double v36 = v33;
      }
      else {
        double v36 = v32;
      }
      if (v32 >= v33) {
        double v37 = v32;
      }
      else {
        double v37 = v33;
      }
      double v38 = 3.40282347e38;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v107 != v35) {
            objc_enumerationMutation(v16);
          }
          id v40 = *(id *)(*((void *)&v106 + 1) + 8 * v39);
          float v41 = (const opaqueCMFormatDescription *)[v40 formatDescription];
          CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v41, 0, 0);
          FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v41);
          if (PresentationDimensions.width >= PresentationDimensions.height) {
            double width = PresentationDimensions.width;
          }
          else {
            double width = PresentationDimensions.height;
          }
          if (PresentationDimensions.width >= PresentationDimensions.height) {
            double height = PresentationDimensions.height;
          }
          else {
            double height = PresentationDimensions.width;
          }
          if (MediaSubType == 875704422
            && height >= v36
            && width >= v37
            && vabdd_f64(v34, width / height) < 0.1
            && PresentationDimensions.width * PresentationDimensions.height < v38)
          {
            id v49 = v40;

            objc_msgSend(*(id *)(a1 + 32), "setStreamingImageSize:", PresentationDimensions.width, PresentationDimensions.height);
            double v38 = PresentationDimensions.width * PresentationDimensions.height;
            id v18 = v49;
          }

          ++v39;
        }
        while (v31 != v39);
        uint64_t v50 = [v16 countByEnumeratingWithState:&v106 objects:v116 count:16];
        uint64_t v31 = v50;
      }
      while (v50);

      if (v18)
      {
        int v5 = 2;
        goto LABEL_76;
      }
    }
    else
    {
    }
    uint64_t v51 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_74;
    }
LABEL_75:

    int v5 = 0;
    id v18 = 0;
    goto LABEL_76;
  }
  if (v5 != 3)
  {
    id v18 = 0;
    goto LABEL_77;
  }
  [v2 formats];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v102 objects:v115 count:16];
  if (!v17)
  {

    goto LABEL_69;
  }
  id v18 = 0;
  uint64_t v19 = *(void *)v103;
  CGFloat v20 = 0.0;
  CGFloat v21 = 0.0;
  do
  {
    uint64_t v22 = 0;
    double v23 = v20;
    double v24 = v21;
    do
    {
      if (*(void *)v103 != v19) {
        objc_enumerationMutation(v16);
      }
      id v25 = *(id *)(*((void *)&v102 + 1) + 8 * v22);
      id v26 = (const opaqueCMFormatDescription *)[v25 formatDescription];
      CGSize v27 = CMVideoFormatDescriptionGetPresentationDimensions(v26, 0, 0);
      CGFloat v21 = v27.width;
      CGFloat v20 = v27.height;
      if (CMFormatDescriptionGetMediaSubType(v26) != 875704422 || v27.width < v24 || v27.height <= v23)
      {
        CGFloat v20 = v23;
        CGFloat v21 = v24;
      }
      else
      {
        id v30 = v25;

        id v18 = v30;
        objc_msgSend(*(id *)(a1 + 32), "setStreamingImageSize:", v27.width, v27.height);
      }

      ++v22;
      double v23 = v20;
      double v24 = v21;
    }
    while (v17 != v22);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v102 objects:v115 count:16];
  }
  while (v17);

  if (!v18)
  {
LABEL_69:
    uint64_t v51 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_74:
      _os_log_impl(&dword_217885000, v51, OS_LOG_TYPE_DEFAULT, "Unable to find chosenFormat, defaulting to PhotoPreset", buf, 2u);
      goto LABEL_75;
    }
    goto LABEL_75;
  }
  int v5 = 3;
LABEL_76:

LABEL_77:
  if (!v97)
  {
    v52 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      __45__ICDocCamViewController_setupCaptureSession__block_invoke_3_cold_1();
    }
  }
  double v53 = [*(id *)(a1 + 32) session];
  [v53 beginConfiguration];

  double v54 = [*(id *)(a1 + 32) session];
  AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();

  uint64_t v55 = [*(id *)(a1 + 32) session];
  int v56 = [v55 canAddInput:v97];

  if (v56)
  {
    double v57 = [*(id *)(a1 + 32) session];
    [v57 addInput:v97];

    [*(id *)(a1 + 32) setVideoDeviceInput:v97];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__ICDocCamViewController_setupCaptureSession__block_invoke_605;
    block[3] = &unk_2642AA080;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v58 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217885000, v58, OS_LOG_TYPE_DEFAULT, "Could not add video device input to the session", buf, 2u);
    }

    [*(id *)(a1 + 32) setSetupResult:2];
  }
  id v96 = objc_alloc_init(MEMORY[0x263EFA620]);
  double v59 = [*(id *)(a1 + 32) session];
  int v60 = [v59 canAddOutput:v96];

  if (v60)
  {
    v61 = [*(id *)(a1 + 32) session];
    [v61 addOutput:v96];

    [*(id *)(a1 + 32) setPhotoOutput:v96];
    uint64_t v62 = [*(id *)(a1 + 32) photoOutput];
    [v62 setHighResolutionCaptureEnabled:1];

    v63 = [*(id *)(a1 + 32) photoOutput];
    [v63 setLivePhotoCaptureEnabled:0];

    v64 = [MEMORY[0x263EFA628] photoSettings];
    objc_msgSend(v64, "setFlashMode:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
    v65 = [*(id *)(a1 + 32) photoOutput];
    [v65 setPhotoSettingsForSceneMonitoring:v64];

    v66 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setInProgressPhotoCaptureDelegates:v66];
  }
  else
  {
    id v67 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217885000, v67, OS_LOG_TYPE_DEFAULT, "Could not add still image output to the session", buf, 2u);
    }

    [*(id *)(a1 + 32) setSetupResult:2];
  }
  id v68 = objc_alloc_init(MEMORY[0x263EFA6A0]);
  v69 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v70 = dispatch_queue_create("VideoDataOutputQueue", v69);

  uint64_t v113 = *MEMORY[0x263F04180];
  v114 = &unk_26C7ED880;
  v71 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  [v68 setVideoSettings:v71];

  [v68 setSampleBufferDelegate:*(void *)(a1 + 32) queue:v70];
  v72 = [*(id *)(a1 + 32) session];
  int v73 = [v72 canAddOutput:v68];

  if (v73)
  {
    double v74 = [*(id *)(a1 + 32) session];
    [v74 addOutput:v68];

    [*(id *)(a1 + 32) setVideoDataOutput:v68];
  }
  double v75 = [v68 connectionWithMediaType:v94];
  [*(id *)(a1 + 32) setVideoConnection:v75];
  if ([v75 isCameraIntrinsicMatrixDeliverySupported])
  {
    [v75 setCameraIntrinsicMatrixDeliveryEnabled:1];
    [v75 setPreferredVideoStabilizationMode:0];
  }
  if ((v5 - 2) < 2)
  {
    id v100 = 0;
    int v77 = [v2 lockForConfiguration:&v100];
    id v78 = v100;
    if (!v77)
    {
      double v76 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v112 = v78;
        _os_log_impl(&dword_217885000, v76, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
      }
      goto LABEL_106;
    }
    [v2 setActiveFormat:v18];
    [v2 unlockForConfiguration];
  }
  else
  {
    if (!v5)
    {
      double v76 = [*(id *)(a1 + 32) session];
      [v76 setSessionPreset:*MEMORY[0x263EF9780]];
      goto LABEL_102;
    }
    if (v5 == 1)
    {
      double v76 = [*(id *)(a1 + 32) session];
      [v76 setSessionPreset:*MEMORY[0x263EF9758]];
LABEL_102:
      id v78 = 0;
LABEL_106:

      goto LABEL_107;
    }
    id v78 = 0;
  }
LABEL_107:

  id v99 = 0;
  int v79 = [v2 lockForConfiguration:&v99];
  id v80 = v99;
  if (v79)
  {
    [v2 setSubjectAreaChangeMonitoringEnabled:1];
    [v2 setProvidesStortorgetMetadata:1];
  }
  else
  {
    v81 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v112 = v80;
      _os_log_impl(&dword_217885000, v81, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
    }
  }
  id v98 = 0;
  int v82 = [v2 lockForConfiguration:&v98];
  id v83 = v98;
  if (v82)
  {
    if ([v2 isAutoFocusRangeRestrictionSupported]) {
      [v2 setAutoFocusRangeRestriction:1];
    }
    [v2 unlockForConfiguration];
  }
  else
  {
    v84 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v112 = v83;
      _os_log_impl(&dword_217885000, v84, OS_LOG_TYPE_DEFAULT, "Could not lock device for configuration: %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceHasFlash:", objc_msgSend(v2, "hasFlash"));
  v85 = [*(id *)(a1 + 32) session];
  [v85 commitConfiguration];

  if ([*(id *)(a1 + 32) scanMovieRecordingEnabled])
  {
    [*(id *)(a1 + 32) setReferenceOrientation:1];
    double v86 = [ICDocCamDebugMovieController alloc];
    double v87 = *(void **)(a1 + 32);
    v88 = [v87 videoConnection];
    v89 = -[ICDocCamDebugMovieController initWithDelegate:videoConnection:referenceOrientation:](v86, "initWithDelegate:videoConnection:referenceOrientation:", v87, v88, [*(id *)(a1 + 32) referenceOrientation]);
    [*(id *)(a1 + 32) setMovieController:v89];
  }
  if ([*(id *)(a1 + 32) isConstantColorAvailable])
  {
    v90 = [*(id *)(a1 + 32) photoOutput];
    [v90 setConstantColorEnabled:1];

    uint64_t v91 = [*(id *)(a1 + 32) photoOutput];
    [v91 setConstantColorClippingRecoveryEnabled:1];

    v92 = [*(id *)(a1 + 32) photoOutput];
    char v93 = objc_opt_respondsToSelector();

    if (v93) {
      [v96 setConstantColorSaturationBoostEnabled:1];
    }
  }
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_605(uint64_t a1)
{
  if ([*(id *)(a1 + 32) statusBarOrientation]) {
    uint64_t v2 = [*(id *)(a1 + 32) statusBarOrientation];
  }
  else {
    uint64_t v2 = 1;
  }
  id v17 = [*(id *)(a1 + 32) previewView];
  id v3 = [v17 videoPreviewLayer];
  [*(id *)(a1 + 32) setVideoPreviewLayer:v3];

  unsigned int v4 = (uint64_t *)MEMORY[0x263EF9C70];
  char v5 = DCDebugInterfaceEnabled();
  if ((v5 & 1) == 0)
  {
    id v17 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v17 userInterfaceIdiom] != 1) {
      unsigned int v4 = (uint64_t *)MEMORY[0x263EF9C78];
    }
  }
  uint64_t v6 = *v4;
  double v7 = [*(id *)(a1 + 32) videoPreviewLayer];
  [v7 setVideoGravity:v6];

  if ((v5 & 1) == 0) {
  id v18 = [*(id *)(a1 + 32) videoPreviewLayer];
  }
  double v8 = [v18 connection];
  [v8 setVideoOrientation:v2];

  id v19 = [*(id *)(a1 + 32) videoPreviewLayer];
  objc_msgSend(v19, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id v20 = [*(id *)(a1 + 32) overlayView];
  objc_msgSend(v20, "setPreviewBounds:", v10, v12, v14, v16);
}

- (void)launchCaptureSession
{
  id v3 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke;
  block[3] = &unk_2642AA080;
  block[4] = self;
  dispatch_async(v3, block);

  if ([(ICDocCamViewController *)self isInRetakeMode])
  {
    unsigned int v4 = [(ICDocCamViewController *)self processRequestsBlocker];
    [v4 addBlockerOfType:@"ViewLifetimeBlocker" clearRectangles:1 clearQueue:1];

    char v5 = [(ICDocCamViewController *)self overlayView];
    [v5 setHidden:1];

    uint64_t v6 = [(ICDocCamViewController *)self overlayView];
    [v6 clearRectangles];

    dispatch_time_t v7 = dispatch_time(0, 500000000);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_6;
    v8[3] = &unk_2642AA080;
    v8[4] = self;
    dispatch_after(v7, MEMORY[0x263EF83A0], v8);
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) setupResult];
  switch(v2)
  {
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_5;
      v8[3] = &unk_2642AA080;
      v8[4] = *(void *)(a1 + 32);
      uint64_t v6 = MEMORY[0x263EF83A0];
      dispatch_time_t v7 = v8;
LABEL_7:
      dispatch_async(v6, v7);
      return;
    case 1:
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_3;
      v9[3] = &unk_2642AA080;
      v9[4] = *(void *)(a1 + 32);
      uint64_t v6 = MEMORY[0x263EF83A0];
      dispatch_time_t v7 = v9;
      goto LABEL_7;
    case 0:
      [*(id *)(a1 + 32) addObserversIfNecessary];
      id v3 = [*(id *)(a1 + 32) session];
      [v3 startRunning];

      unsigned int v4 = [*(id *)(a1 + 32) session];
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v4, "isRunning"));

      [*(id *)(a1 + 32) clearQueue];
      dispatch_time_t v5 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__ICDocCamViewController_launchCaptureSession__block_invoke_2;
      block[3] = &unk_2642AA080;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v5, MEMORY[0x263EF83A0], block);
      break;
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v2 removeBlockerOfType:@"ViewLifetimeBlocker"];

  if ([*(id *)(a1 + 32) isSessionRunning])
  {
    [*(id *)(a1 + 32) enableShutterButtonIfPossible];
    [*(id *)(a1 + 32) enableUIElements:1];
    id v3 = [*(id *)(a1 + 32) captureEventInteraction];
    [v3 setEnabled:1];
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_3(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) previewView];
  id v2 = [v14 layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];

  id v15 = +[DCLocalization localizedStringForKey:@"Privacy or Restrictions settings have disabled use of the camera. You can change this in Settings." value:@"Privacy or Restrictions settings have disabled use of the camera. You can change this in Settings." table:@"Localizable"];
  unsigned int v4 = (void *)MEMORY[0x263F1C3F8];
  dispatch_time_t v5 = +[DCLocalization localizedStringForKey:@"Camera Unavailable" value:@"Camera Unavailable" table:@"Localizable"];
  uint64_t v6 = [v4 alertControllerWithTitle:v5 message:v15 preferredStyle:1];

  dispatch_time_t v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v6 setImage:v7];

  double v8 = (void *)MEMORY[0x263F1C3F0];
  double v9 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  double v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  [v6 addAction:v10];
  double v11 = (void *)MEMORY[0x263F1C3F0];
  double v12 = +[DCLocalization localizedStringForKey:@"Settings" value:@"Settings" table:@"Localizable"];
  double v13 = [v11 actionWithTitle:v12 style:0 handler:&__block_literal_global_637];

  [v6 addAction:v13];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_4()
{
  [NSURL URLWithString:@"prefs:root=ROOT"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  char v1 = [v0 openSensitiveURL:v4 withOptions:0];

  if ((v1 & 1) == 0)
  {
    id v2 = [MEMORY[0x263F1C408] sharedApplication];
    double v3 = [NSURL URLWithString:*MEMORY[0x263F1D088]];
    [v2 openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_5(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) previewView];
  id v2 = [v11 layer];
  LODWORD(v3) = 1.0;
  [v2 setOpacity:v3];

  id v12 = +[DCLocalization localizedStringForKey:@"Unable to capture media" value:@"Unable to capture media" table:@"Localizable"];
  id v4 = (void *)MEMORY[0x263F1C3F8];
  dispatch_time_t v5 = DCAppName();
  uint64_t v6 = [v4 alertControllerWithTitle:v5 message:v12 preferredStyle:1];

  dispatch_time_t v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v6 setImage:v7];

  double v8 = (void *)MEMORY[0x263F1C3F0];
  double v9 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  double v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  [v6 addAction:v10];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void __46__ICDocCamViewController_launchCaptureSession__block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) overlayView];
  [v2 setHidden:0];

  id v3 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v3 removeBlockerOfType:@"ViewLifetimeBlocker"];
}

- (void)restartImageCaptureSessionIfNecessary
{
  id v3 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ICDocCamViewController_restartImageCaptureSessionIfNecessary__block_invoke;
  block[3] = &unk_2642AA080;
  block[4] = self;
  dispatch_async(v3, block);
}

void __63__ICDocCamViewController_restartImageCaptureSessionIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserversIfNecessary];
  id v2 = [*(id *)(a1 + 32) session];
  [v2 startRunning];

  id v3 = [*(id *)(a1 + 32) session];
  objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));
}

- (void)stopImageCaptureSession
{
  id v3 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_stopImageCaptureSession__block_invoke;
  block[3] = &unk_2642AA080;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__ICDocCamViewController_stopImageCaptureSession__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) setupResult])
  {
    id v2 = [*(id *)(a1 + 32) session];
    int v3 = [v2 isRunning];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) session];
      [v4 stopRunning];

      dispatch_time_t v5 = [*(id *)(a1 + 32) session];
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v5, "isRunning"));

      uint64_t v6 = *(void **)(a1 + 32);
      [v6 removeObserversIfNecessary];
    }
  }
}

- (BOOL)isConstantColorAvailable
{
  int v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  dispatch_time_t v5 = [(ICDocCamViewController *)self photoOutput];
  char v6 = [v5 isConstantColorSupported];

  if (v4 == 1) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)initializeFilters
{
  int v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = +[ICDocCamImageFilters imageFilterNames];
  dispatch_time_t v5 = [v4 objectAtIndexedSubscript:1];
  char v6 = +[ICDocCamImageFilters imageFilterNames];
  dispatch_time_t v7 = [v6 objectAtIndexedSubscript:2];
  double v8 = +[ICDocCamImageFilters imageFilterNames];
  double v9 = [v8 objectAtIndexedSubscript:3];
  double v10 = +[ICDocCamImageFilters imageFilterNames];
  id v11 = [v10 objectAtIndexedSubscript:0];
  id v12 = objc_msgSend(v3, "arrayWithObjects:", v5, v7, v9, v11, 0);
  [(ICDocCamViewController *)self setFilterNames:v12];

  if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL"))
  {
    double v13 = [(ICDocCamViewController *)self filterNames];
    id v14 = [v13 reverseObjectEnumerator];
    id v15 = [v14 allObjects];
    [(ICDocCamViewController *)self setFilterNames:v15];
  }
  double v16 = [(ICDocCamViewController *)self filterButtons];

  if (!v16)
  {
    id v18 = [(ICDocCamViewController *)self filterScrollView];
    [v18 setShowsVerticalScrollIndicator:0];

    id v19 = [(ICDocCamViewController *)self filterScrollView];
    [v19 setShowsHorizontalScrollIndicator:0];

    id v20 = [(ICDocCamViewController *)self filterScrollView];
    [v20 setDelegate:self];

    CGFloat v21 = [(ICDocCamViewController *)self filterScrollView];
    [v21 setClipsToBounds:1];

    id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ICDocCamViewController *)self setFilterButtons:v22];

    unint64_t v23 = 0;
    double v24 = *MEMORY[0x263F1D338];
    while (1)
    {
      id v25 = [(ICDocCamViewController *)self filterNames];
      unint64_t v26 = [v25 count];

      if (v26 <= v23) {
        break;
      }
      CGSize v27 = [MEMORY[0x263F1C488] buttonWithType:1];
      id v28 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:v24];
      id v29 = [v27 titleLabel];
      [v29 setFont:v28];

      [v27 addTarget:self action:sel_filterButtonChoiceAction_ forControlEvents:64];
      id v30 = [(ICDocCamViewController *)self filterNames];
      uint64_t v31 = [v30 objectAtIndexedSubscript:v23];
      objc_msgSend(v27, "setTag:", +[ICDocCamImageFilters imageFilterTypeFromName:](ICDocCamImageFilters, "imageFilterTypeFromName:", v31));

      double v32 = [(ICDocCamViewController *)self filterNames];
      double v33 = [v32 objectAtIndexedSubscript:v23];
      [v27 setTitle:v33 forState:0];

      [v27 sizeToFit];
      [v27 _accessibilitySetInterfaceStyleIntent:2];
      double v34 = [(ICDocCamViewController *)self filterButtons];
      [v34 addObject:v27];

      uint64_t v35 = [(ICDocCamViewController *)self filterScrollView];
      [v35 addSubview:v27];

      [v27 _accessibilitySetIsSpeakThisElement:1];
      ++v23;
    }
  }
  uint64_t v17 = [(ICDocCamViewController *)self defaultFilter];

  [(ICDocCamViewController *)self updateFilterChoiceButtonSelection:v17];
}

- (void)updateFilterChoiceButtonSelection:(signed __int16)a3
{
  unint64_t v4 = 0;
  uint64_t v5 = a3;
  char v6 = MEMORY[0x263EF83A0];
  while (1)
  {
    dispatch_time_t v7 = [(ICDocCamViewController *)self filterButtons];
    unint64_t v8 = [v7 count];

    if (v8 <= v4) {
      break;
    }
    double v9 = [(ICDocCamViewController *)self filterButtons];
    double v10 = [v9 objectAtIndexedSubscript:v4];
    uint64_t v11 = [v10 tag];

    if (v11 == v5) {
      [(ICDocCamViewController *)self cameraHighlightColor];
    }
    else {
    id v12 = [MEMORY[0x263F1C550] whiteColor];
    }
    double v13 = [(ICDocCamViewController *)self filterButtons];
    id v14 = [v13 objectAtIndexedSubscript:v4];
    [v14 setTintColor:v12];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__ICDocCamViewController_updateFilterChoiceButtonSelection___block_invoke;
    v15[3] = &unk_2642AA148;
    void v15[4] = self;
    int v16 = v4;
    dispatch_async(v6, v15);
    ++v4;
  }
}

void __60__ICDocCamViewController_updateFilterChoiceButtonSelection___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) filterButtons];
  id v2 = [v4 objectAtIndexedSubscript:*(int *)(a1 + 40)];
  [v2 setNeedsDisplay];

  id v5 = [*(id *)(a1 + 32) filterButtons];
  int v3 = [v5 objectAtIndexedSubscript:*(int *)(a1 + 40)];
  [v3 forceDisplayIfNeeded];
}

- (void)hideFilterSettingUI
{
  if ([(ICDocCamViewController *)self filterSettingUIShowing])
  {
    int v3 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4)
    {
      id v5 = [(ICDocCamViewController *)self view];
      [v5 layoutIfNeeded];

      [(ICDocCamViewController *)self updateFilterChoiceButtonScrollPositionAnimated:0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_3;
      v11[3] = &unk_2642AA170;
      v11[4] = self;
      v11[5] = 0x4046000000000000;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_4;
      v10[3] = &unk_2642AA0F8;
      v10[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v11 animations:v10 completion:0.25];
    }
    else
    {
      char v6 = [(ICDocCamViewController *)self topToolbarForIPhone];
      [v6 setAlpha:0.0];

      dispatch_time_t v7 = [(ICDocCamViewController *)self topToolbarForIPhone];
      [v7 setHidden:0];

      unint64_t v8 = [(ICDocCamViewController *)self filterViewContainer];
      [v8 setAlpha:1.0];

      double v9 = [(ICDocCamViewController *)self filterViewContainer];
      [v9 setHidden:0];

      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke;
      v13[3] = &unk_2642AA080;
      v13[4] = self;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_2;
      v12[3] = &unk_2642AA0F8;
      v12[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v13 animations:v12 completion:0.5];
    }
  }
}

void __45__ICDocCamViewController_hideFilterSettingUI__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) filterViewContainer];
  [v3 setAlpha:0.0];
}

uint64_t __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) filterViewContainer];
  [v2 setHidden:1];

  [*(id *)(a1 + 32) setFilterSettingUIShowing:0];
  [*(id *)(a1 + 32) updateFilterChoiceButtonScrollPositionAnimated:0];
  [*(id *)(a1 + 32) updateAccessibilityForCurrentFilter];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateAccessibilityFocusForHidingFilterSettingsUI];
}

void __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) filterViewContainerWidthConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

uint64_t __45__ICDocCamViewController_hideFilterSettingUI__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setFilterSettingUIShowing:0];
  [*(id *)(a1 + 32) updateAccessibilityForCurrentFilter];
  double v2 = *(void **)(a1 + 32);

  return [v2 updateAccessibilityFocusForHidingFilterSettingsUI];
}

- (void)setUpFilterScrollView
{
  v82[4] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 20.0;
  double v6 = 22.0;
  if (!v4)
  {
    double v6 = 8.0;
    if ((unint64_t)([(ICDocCamViewController *)self statusBarOrientation] - 1) <= 1)
    {
      [(ICDocCamViewController *)self filterScrollViewContentWidthWithInterItemSpacing:20.0 startPadding:10.0 endPadding:0.0];
      double v8 = v7;
      double v9 = [(ICDocCamViewController *)self filterViewButton];
      [v9 frame];
      double v11 = v10;

      id v12 = [(ICDocCamViewController *)self view];
      [v12 bounds];
      double v14 = v13 + -12.0 - (v8 + v11 + 4.0);

      double v5 = 20.0;
      if (v14 > 0.0)
      {
        unint64_t v15 = 0;
        double v16 = 0.0;
        while (1)
        {
          uint64_t v17 = [(ICDocCamViewController *)self filterButtons];
          unint64_t v18 = [v17 count];

          if (v18 <= v15) {
            break;
          }
          id v19 = [(ICDocCamViewController *)self filterButtons];
          id v20 = [v19 objectAtIndexedSubscript:v15];

          [v20 frame];
          double v16 = v16 + v21;

          ++v15;
        }
        id v22 = [(ICDocCamViewController *)self filterScrollView];
        [v22 bounds];
        double v24 = v23;
        id v25 = [(ICDocCamViewController *)self filterButtons];
        double v5 = (v24 + -12.0 + -10.0 - v16) / (double)(unint64_t)([v25 count] - 1);
      }
    }
  }
  [(ICDocCamViewController *)self filterScrollViewContentWidthWithInterItemSpacing:v5 startPadding:10.0 endPadding:v6];
  double v27 = v26;
  id v28 = [(ICDocCamViewController *)self filterScrollView];
  [v28 bounds];
  double v30 = v29;
  uint64_t v31 = [(ICDocCamViewController *)self filterScrollView];
  objc_msgSend(v31, "setContentSize:", v27, v30);

  unint64_t v32 = 0;
  double v33 = 10.0;
  while (1)
  {
    double v34 = [(ICDocCamViewController *)self filterButtons];
    unint64_t v35 = [v34 count];

    if (v35 <= v32) {
      break;
    }
    double v36 = [(ICDocCamViewController *)self filterButtons];
    double v37 = [v36 objectAtIndexedSubscript:v32];

    [v37 frame];
    double v39 = v38;
    id v40 = [(ICDocCamViewController *)self filterScrollView];
    [v40 bounds];
    objc_msgSend(v37, "setFrame:", v33, 0.0, v39);

    float v41 = [(ICDocCamViewController *)self filterNames];
    unint64_t v42 = [v41 count] - 1;

    if (v42 <= v32) {
      double v43 = v6;
    }
    else {
      double v43 = v5;
    }
    double v33 = v33 + v39 + v43;

    ++v32;
  }
  uint64_t v44 = [MEMORY[0x263F157D0] layer];
  v45 = [(ICDocCamViewController *)self filterScrollViewContainer];
  [v45 bounds];
  objc_msgSend(v44, "setFrame:");

  v46 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v47 = [v46 userInterfaceIdiom];

  v48 = (void *)MEMORY[0x263EFF8C0];
  [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  if (v47)
  {
    id v49 = objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v49 CGColor];
    id v51 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v52 = [v51 CGColor];
    id v53 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v54 = [v53 CGColor];
    id v55 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    int v56 = objc_msgSend(v48, "arrayWithObjects:", v50, v52, v54, objc_msgSend(v55, "CGColor"), 0);
    [v44 setColors:v56];

    double v57 = NSNumber;
    [v44 frame];
    double v59 = [v57 numberWithDouble:8.0 / v58];
    v81[0] = v59;
    int v60 = NSNumber;
    [v44 frame];
    uint64_t v62 = [v60 numberWithDouble:16.0 / v61];
    v81[1] = v62;
    v63 = NSNumber;
    [v44 frame];
    v65 = [v63 numberWithDouble:-12.0 / v64 + 1.0];
    v81[2] = v65;
    v81[3] = &unk_26C7ED838;
    v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    [v44 setLocations:v66];
  }
  else
  {
    id v67 = objc_claimAutoreleasedReturnValue();
    uint64_t v68 = [v67 CGColor];
    id v69 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v70 = [v69 CGColor];
    id v71 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v72 = [v71 CGColor];
    id v73 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    double v74 = objc_msgSend(v48, "arrayWithObjects:", v68, v70, v72, objc_msgSend(v73, "CGColor"), 0);
    [v44 setColors:v74];

    v82[0] = &unk_26C7ED868;
    double v75 = NSNumber;
    [v44 frame];
    double v59 = [v75 numberWithDouble:8.0 / v76];
    v82[1] = v59;
    int v77 = NSNumber;
    [v44 frame];
    uint64_t v62 = [v77 numberWithDouble:-8.0 / v78 + 1.0];
    v82[2] = v62;
    v82[3] = &unk_26C7ED838;
    v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:4];
    [v44 setLocations:v65];
  }

  objc_msgSend(v44, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v44, "setEndPoint:", 1.0, 0.5);
  int v79 = [(ICDocCamViewController *)self filterScrollViewContainer];
  id v80 = [v79 layer];
  [v80 setMask:v44];
}

- (void)updateFilterButtonTint
{
  unint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x263EF83A0];
  while (1)
  {
    double v5 = [(ICDocCamViewController *)self filterButtons];
    unint64_t v6 = [v5 count];

    if (v6 <= v3) {
      break;
    }
    double v7 = [(ICDocCamViewController *)self filterButtons];
    double v8 = [v7 objectAtIndexedSubscript:v3];

    uint64_t v9 = [v8 tag];
    if (v9 == [(ICDocCamViewController *)self defaultFilter]) {
      [(ICDocCamViewController *)self cameraHighlightColor];
    }
    else {
    double v10 = [MEMORY[0x263F1C550] whiteColor];
    }
    [v8 setTintColor:v10];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ICDocCamViewController_updateFilterButtonTint__block_invoke;
    block[3] = &unk_2642AA080;
    id v13 = v8;
    id v11 = v8;
    dispatch_async(v4, block);

    ++v3;
  }
}

uint64_t __48__ICDocCamViewController_updateFilterButtonTint__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

- (void)updateFilterAndFlashButtons
{
  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        id v28 = (id)objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v28 userInterfaceIdiom],
        v28,
        v3 == 1))
  {
    id v29 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
    id v4 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v5 = [v4 CGColor];
    unint64_t v6 = [(ICDocCamViewController *)self flashSettingView];
    double v7 = [v6 layer];
    [v7 setBorderColor:v5];

    double v8 = [(ICDocCamViewController *)self flashSettingView];
    uint64_t v9 = [v8 layer];
    [v9 setBorderWidth:0.0];

    double v10 = [(ICDocCamViewController *)self flashSettingView];
    [v10 frame];
    double v12 = v11;
    id v13 = [(ICDocCamViewController *)self flashSettingView];
    double v14 = [v13 layer];
    [v14 setCornerRadius:v12 * 0.5];

    unint64_t v15 = [(ICDocCamViewController *)self flashSettingView];
    [v15 setBackgroundColor:v29];

    id v16 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v17 = [v16 CGColor];
    unint64_t v18 = [(ICDocCamViewController *)self filterViewContainer];
    id v19 = [v18 layer];
    [v19 setBorderColor:v17];

    id v20 = [(ICDocCamViewController *)self filterViewContainer];
    double v21 = [v20 layer];
    [v21 setBorderWidth:0.0];

    id v22 = [(ICDocCamViewController *)self filterViewContainer];
    [v22 frame];
    double v24 = v23;
    id v25 = [(ICDocCamViewController *)self filterViewContainer];
    double v26 = [v25 layer];
    [v26 setCornerRadius:v24 * 0.5];

    double v27 = [(ICDocCamViewController *)self filterViewContainer];
    [v27 setBackgroundColor:v29];
  }
}

- (id)flashMenuButtonSizes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_flashMenuButtonSizes__block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  if (-[ICDocCamViewController flashMenuButtonSizes]::onceToken != -1) {
    dispatch_once(&-[ICDocCamViewController flashMenuButtonSizes]::onceToken, block);
  }
  return (id)-[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionary;
}

void __46__ICDocCamViewController_flashMenuButtonSizes__block_invoke(uint64_t a1)
{
  v23[3] = *MEMORY[0x263EF8340];
  double v2 = [*(id *)(a1 + 32) flashSettingViewAutoButton];
  [v2 sizeToFit];

  uint64_t v3 = [*(id *)(a1 + 32) flashSettingViewOnButton];
  [v3 sizeToFit];

  id v4 = [*(id *)(a1 + 32) flashSettingViewOffButton];
  [v4 sizeToFit];

  v22[0] = @"Auto";
  uint64_t v5 = (void *)MEMORY[0x263F08D40];
  unint64_t v6 = [*(id *)(a1 + 32) flashSettingViewAutoButton];
  [v6 frame];
  uint64_t v9 = objc_msgSend(v5, "valueWithCGSize:", v7, v8);
  v23[0] = v9;
  v22[1] = @"On";
  double v10 = (void *)MEMORY[0x263F08D40];
  double v11 = [*(id *)(a1 + 32) flashSettingViewOnButton];
  [v11 frame];
  double v14 = objc_msgSend(v10, "valueWithCGSize:", v12, v13);
  v23[1] = v14;
  v22[2] = @"Off";
  unint64_t v15 = (void *)MEMORY[0x263F08D40];
  id v16 = [*(id *)(a1 + 32) flashSettingViewOffButton];
  [v16 frame];
  id v19 = objc_msgSend(v15, "valueWithCGSize:", v17, v18);
  v23[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  double v21 = (void *)-[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionary;
  -[ICDocCamViewController flashMenuButtonSizes]::buttonSizeDictionardouble y = v20;
}

- (double)flashSettingViewWidthForIPad
{
  double v2 = [(ICDocCamViewController *)self flashMenuButtonSizes];
  uint64_t v3 = [v2 objectForKey:@"Auto"];
  [v3 CGSizeValue];
  double v5 = v4;
  unint64_t v6 = [v2 objectForKey:@"On"];

  [v6 CGSizeValue];
  double v8 = v7;
  uint64_t v9 = [v2 objectForKey:@"Off"];

  [v9 CGSizeValue];
  double v11 = v5 + 0.0 + v8 + v10 + 72.0;

  return v11;
}

- (void)flashMoveCloserFeedback
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_flashMoveCloserFeedback__block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__ICDocCamViewController_flashMoveCloserFeedback__block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) moveCameraCloserView];
  double v2 = [v11 layer];
  uint64_t v3 = [v2 animationKeys];

  if (!v3)
  {
    id v12 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v12 setBeginTime:CACurrentMediaTime()];
    [v12 setDuration:2.0];
    [v12 setKeyTimes:&unk_26C7ED9A0];
    [v12 setValues:&unk_26C7ED9B8];
    [v12 setRemovedOnCompletion:1];
    [v12 setFillMode:*MEMORY[0x263F15AB0]];
    LODWORD(v4) = 1.0;
    [v12 setRepeatCount:v4];
    double v5 = [*(id *)(a1 + 32) moveCameraCloserView];
    unint64_t v6 = [v5 layer];
    [v6 addAnimation:v12 forKey:@"opacity"];

    double v7 = [*(id *)(a1 + 32) moveCameraCloserView];
    double v8 = [v7 layer];
    [v8 setOpacity:0.0];

    uint64_t v9 = [*(id *)(a1 + 32) moveCameraCloserLabel];
    double v10 = [v9 text];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
  }
}

- (void)flashFilterButtonNameFeedback
{
  [(ICDocCamViewController *)self killFeedbackDisplayIncludingUserPrompts:0];
  uint64_t v3 = +[ICDocCamImageFilters localizedImageFilterNameForType:[(ICDocCamViewController *)self defaultFilter]];
  double v4 = [(ICDocCamViewController *)self filterNameFeedbackLabel];
  [v4 setText:v3];

  double v5 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v5 setBeginTime:CACurrentMediaTime()];
  [v5 setDuration:2.0];
  [v5 setKeyTimes:&unk_26C7ED9D0];
  [v5 setValues:&unk_26C7ED9E8];
  [v5 setRemovedOnCompletion:1];
  [v5 setFillMode:*MEMORY[0x263F15AB0]];
  LODWORD(v6) = 1.0;
  [v5 setRepeatCount:v6];
  double v7 = [(ICDocCamViewController *)self filterNameFeedbackView];
  double v8 = [v7 layer];
  [v8 addAnimation:v5 forKey:@"filterName"];

  uint64_t v9 = [(ICDocCamViewController *)self filterNameFeedbackView];
  double v10 = [v9 layer];
  [v10 setOpacity:0.0];

  dispatch_time_t v11 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ICDocCamViewController_flashFilterButtonNameFeedback__block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
}

void __55__ICDocCamViewController_flashFilterButtonNameFeedback__block_invoke(uint64_t a1)
{
  id v6 = +[DCLocalization localizedStringForKey:@"Current filter: %@" value:@"Current filter: %@" table:@"Localizable"];
  double v2 = NSString;
  uint64_t v3 = [*(id *)(a1 + 32) filterNameFeedbackLabel];
  double v4 = [v3 text];
  double v5 = objc_msgSend(v2, "stringWithFormat:", v6, v4);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)filterButtonChoiceAction:(id)a3
{
  id v4 = a3;
  -[ICDocCamViewController setDefaultFilter:](self, "setDefaultFilter:", (__int16)[v4 tag]);
  [(ICDocCamViewController *)self updateFilterChoiceButtonSelection:[(ICDocCamViewController *)self defaultFilter]];
  [(ICDocCamViewController *)self hideFilterSettingUI];
  [(ICDocCamViewController *)self flashFilterButtonNameFeedback];
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamViewController_filterButtonChoiceAction___block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __51__ICDocCamViewController_filterButtonChoiceAction___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"FilterSettingBlocker"];
}

- (void)updateAccessibilityFocusForHidingFilterSettingsUI
{
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v3 userInterfaceIdiom]) {
    [(ICDocCamViewController *)self filterButton];
  }
  else {
  id argument = [(ICDocCamViewController *)self filterButtonForIPhone];
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
}

- (void)updateAccessibilityFocusForHidingFlashSettingsUI
{
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v3 userInterfaceIdiom]) {
    [(ICDocCamViewController *)self flashButton];
  }
  else {
  id argument = [(ICDocCamViewController *)self flashButtonForIPhone];
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
}

- (void)updateFilterChoiceButtonScrollPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = 0;
  double v7 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  while (1)
  {
    double v10 = [(ICDocCamViewController *)self filterButtons];
    unint64_t v11 = [v10 count];

    if (v11 <= v5) {
      break;
    }
    id v12 = [(ICDocCamViewController *)self filterButtons];
    double v13 = [v12 objectAtIndexedSubscript:v5];

    uint64_t v14 = [v13 tag];
    if (v14 == [(ICDocCamViewController *)self defaultFilter])
    {
      [v13 frame];
      double v6 = v15;
      double v8 = v16;
      double v7 = v17 + -16.0;
      double v9 = v18 + 32.0;

      break;
    }

    ++v5;
  }
  v27.origin.double x = v7;
  v27.origin.double y = v6;
  v27.size.double width = v9;
  v27.size.double height = v8;
  if (CGRectIsEmpty(v27))
  {
    id v19 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamViewController updateFilterChoiceButtonScrollPositionAnimated:]();
    }

    uint64_t v20 = [(ICDocCamViewController *)self filterButtons];
    double v21 = [v20 objectAtIndexedSubscript:0];
    [v21 frame];
    double v7 = v22;
    double v6 = v23;
    double v9 = v24;
    double v8 = v25;
  }
  double v26 = [(ICDocCamViewController *)self filterScrollView];
  objc_msgSend(v26, "scrollRectToVisible:animated:", v3, v7, v6, v9, v8);
}

- (id)filterButtonImage
{
  if ((unint64_t)([(ICDocCamViewController *)self statusBarOrientation] - 3) <= 1
    && ([(ICDocCamViewController *)self view],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 window],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = objc_msgSend(v4, "dc_requiresCompactLandscapeIcons"),
        v4,
        v3,
        v5))
  {
    double v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"camera.filters"];
  }
  else
  {
    double v6 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", @"camera.filters");
  }

  return v6;
}

- (id)flashButtonImage
{
  unint64_t v3 = [(ICDocCamViewController *)self flashMode];
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_2642AA570[v3];
  }
  if ((unint64_t)([(ICDocCamViewController *)self statusBarOrientation] - 3) <= 1
    && ([(ICDocCamViewController *)self view],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 window],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "dc_requiresCompactLandscapeIcons"),
        v6,
        v5,
        v7))
  {
    double v8 = [MEMORY[0x263F1C6B0] systemImageNamed:v4];
  }
  else
  {
    double v8 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_largeSystemImageNamed:", v4);
  }

  return v8;
}

- (void)myApplicationWillResignActive:(id)a3
{
  id v4 = [(ICDocCamViewController *)self captureEventInteraction];
  [v4 setEnabled:0];

  int v5 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v5 addBlockerOfType:@"ApplicationActiveBlocker" clearRectangles:1 clearQueue:1];

  [(ICDocCamViewController *)self dismissFilterAndFlashUI];
}

- (void)myApplicationDidBecomeActive:(id)a3
{
  [(ICDocCamViewController *)self clearRectangles];
  [(ICDocCamViewController *)self clearQueue];
  id v4 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v4 removeBlockerOfType:@"ApplicationActiveBlocker"];

  BOOL v5 = [(ICDocCamViewController *)self isSessionRunning];
  if (v5) {
    [(ICDocCamViewController *)self enableShutterButtonIfPossible];
  }
  else {
    [(ICDocCamViewController *)self enableShutter:0];
  }
  [(ICDocCamViewController *)self enableUIElements:v5];
  double v6 = [(ICDocCamViewController *)self view];
  int v7 = [v6 window];
  int v8 = [v7 isKeyWindow];

  if (v8)
  {
    double v9 = [(ICDocCamViewController *)self captureEventInteraction];
    [v9 setEnabled:1];
  }

  [(ICDocCamViewController *)self logAlgoChoice];
}

- (void)removeAllNotifications
{
  sessionQueue = self->_sessionQueue;
  if (sessionQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__ICDocCamViewController_removeAllNotifications__block_invoke;
    block[3] = &unk_2642AA080;
    void block[4] = self;
    dispatch_sync(sessionQueue, block);
  }
  if ([(ICDocCamViewController *)self didAddAppLifetimeObservers])
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];

    BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263F1D038] object:0];

    [(ICDocCamViewController *)self setDidAddAppLifetimeObservers:0];
  }
  double v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  if (self->_sessionQueue)
  {
    int v7 = [(ICDocCamViewController *)self sessionQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__ICDocCamViewController_removeAllNotifications__block_invoke_2;
    v9[3] = &unk_2642AA080;
    v9[4] = self;
    dispatch_sync(v7, v9);
  }
  int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x263F1D158] object:0];
}

uint64_t __48__ICDocCamViewController_removeAllNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserversIfNecessary];
}

void __48__ICDocCamViewController_removeAllNotifications__block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) setupResult])
  {
    id v3 = [*(id *)(a1 + 32) session];
    int v2 = [v3 isRunning];

    if (v2)
    {
      id v4 = [*(id *)(a1 + 32) session];
      [v4 stopRunning];

      id v5 = [*(id *)(a1 + 32) session];
      objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v5, "isRunning"));
    }
  }
}

- (void)addObserversIfNecessary
{
  if (![(ICDocCamViewController *)self isObservingCaptureSession])
  {
    id v3 = [(ICDocCamViewController *)self session];
    [v3 addObserver:self forKeyPath:@"running" options:1 context:SessionRunningContext];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = [(ICDocCamViewController *)self videoDeviceInput];
    double v6 = [v5 device];
    [v4 addObserver:self selector:sel_subjectAreaDidChange_ name:*MEMORY[0x263EF9618] object:v6];

    int v7 = [MEMORY[0x263F08A00] defaultCenter];
    int v8 = [(ICDocCamViewController *)self session];
    [v7 addObserver:self selector:sel_sessionRuntimeError_ name:*MEMORY[0x263EF9798] object:v8];

    double v9 = [MEMORY[0x263F08A00] defaultCenter];
    double v10 = [(ICDocCamViewController *)self session];
    [v9 addObserver:self selector:sel_sessionWasInterrupted_ name:*MEMORY[0x263EF97A0] object:v10];

    unint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
    id v12 = [(ICDocCamViewController *)self session];
    [v11 addObserver:self selector:sel_sessionInterruptionEnded_ name:*MEMORY[0x263EF9718] object:v12];

    double v13 = [(ICDocCamViewController *)self videoDeviceInput];
    uint64_t v14 = [v13 device];
    [v14 addObserver:self forKeyPath:@"adjustingFocus" options:1 context:0];

    [(ICDocCamViewController *)self setIsObservingCaptureSession:1];
  }
}

- (void)removeObserversIfNecessary
{
  if ([(ICDocCamViewController *)self isObservingCaptureSession])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = [(ICDocCamViewController *)self videoDeviceInput];
    id v5 = [v4 device];
    [v3 removeObserver:self name:*MEMORY[0x263EF9618] object:v5];

    double v6 = [MEMORY[0x263F08A00] defaultCenter];
    int v7 = [(ICDocCamViewController *)self session];
    [v6 removeObserver:self name:*MEMORY[0x263EF9798] object:v7];

    int v8 = [MEMORY[0x263F08A00] defaultCenter];
    double v9 = [(ICDocCamViewController *)self session];
    [v8 removeObserver:self name:*MEMORY[0x263EF97A0] object:v9];

    double v10 = [MEMORY[0x263F08A00] defaultCenter];
    unint64_t v11 = [(ICDocCamViewController *)self session];
    [v10 removeObserver:self name:*MEMORY[0x263EF9718] object:v11];

    id v12 = [(ICDocCamViewController *)self session];
    [v12 removeObserver:self forKeyPath:@"running" context:SessionRunningContext];

    double v13 = [(ICDocCamViewController *)self videoDeviceInput];
    uint64_t v14 = [v13 device];
    [v14 removeObserver:self forKeyPath:@"adjustingFocus"];

    [(ICDocCamViewController *)self setIsObservingCaptureSession:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"adjustingFocus"])
  {
    double v13 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v14 = [NSNumber numberWithInt:1];
    -[ICDocCamViewController setAdjustingFocus:](self, "setAdjustingFocus:", [v13 isEqualToNumber:v14]);
  }
  else if ((void *)SessionRunningContext == a6)
  {
    double v15 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    unsigned int v33 = [v15 BOOLValue];

    double v16 = [(ICDocCamViewController *)self processRequestsBlocker];
    if ([v16 blocked])
    {
      double v17 = [(ICDocCamViewController *)self processRequestsBlocker];
      double v18 = [v17 blockerSet];
      if ([v18 count] == 1)
      {
        id v19 = [(ICDocCamViewController *)self processRequestsBlocker];
        uint64_t v20 = [v19 blockerSet];
        double v21 = [v20 member:@"OrientationBlocker"];
        BOOL v22 = v21 == 0;
      }
      else
      {
        BOOL v22 = 1;
      }
    }
    else
    {
      BOOL v22 = 0;
    }

    int v23 = 0;
    if (v33 && !v22)
    {
      double v24 = [(ICDocCamViewController *)self snapStillImageBlocker];
      int v23 = [v24 blocked] ^ 1;
    }
    [(ICDocCamViewController *)self setSessionRunning:v33];
    double v25 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217885000, v25, OS_LOG_TYPE_DEFAULT, "observeValueForKeyPath(SessionRunningContext)", buf, 2u);
    }

    double v26 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      CGRect v27 = @"NO";
      if (v33) {
        CGRect v27 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v39 = v27;
      _os_log_impl(&dword_217885000, v26, OS_LOG_TYPE_DEFAULT, "  isSessionRunning: %@", buf, 0xCu);
    }

    id v28 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = @"NO";
      if (v23) {
        id v29 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      double v39 = v29;
      _os_log_impl(&dword_217885000, v28, OS_LOG_TYPE_DEFAULT, "  enableUI        : %@", buf, 0xCu);
    }

    if ((v23 & 1) == 0)
    {
      double v30 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = [(ICDocCamViewController *)self processRequestsBlocker];
        unint64_t v32 = [v31 blockerSet];
        *(_DWORD *)buf = 138412290;
        double v39 = v32;
        _os_log_impl(&dword_217885000, v30, OS_LOG_TYPE_DEFAULT, "  procReqBlockers : %@", buf, 0xCu);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2642AA198;
    char v36 = v33;
    void block[4] = self;
    char v37 = v23;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)ICDocCamViewController;
    [(ICDocCamViewController *)&v34 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) flashFilterButtonNameFeedback];
  }
  int v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 41)) {
    [v2 enableShutterButtonIfPossible];
  }
  else {
    [v2 enableShutter:0];
  }
  [*(id *)(a1 + 32) enableUIElements:*(unsigned __int8 *)(a1 + 41)];
  id v3 = [*(id *)(a1 + 32) previewView];
  id v4 = [v3 layer];
  [v4 opacity];
  if (v5 == 0.0)
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);

    if (v6)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v9[3] = &unk_2642AA080;
      v9[4] = *(void *)(a1 + 32);
      [MEMORY[0x263F1CB60] animateWithDuration:v9 animations:0.25];
    }
  }
  else
  {
  }
  int v7 = [*(id *)(a1 + 32) sessionStartNotificationBlock];

  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) sessionStartNotificationBlock];
    v8[2]();

    [*(id *)(a1 + 32) setSessionStartNotificationBlock:0];
  }
}

void __73__ICDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) previewView];
  id v1 = [v3 layer];
  LODWORD(v2) = 1.0;
  [v1 setOpacity:v2];
}

- (void)subjectAreaDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamViewController setLastSubjectAreaChange:](self, "setLastSubjectAreaChange:");
}

- (void)sessionRuntimeError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263EF9710]];

  int v7 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_217885000, v7, OS_LOG_TYPE_DEFAULT, "Capture session runtime error: %@", buf, 0xCu);
  }

  if ([v6 code] == -11819)
  {
    int v8 = [(ICDocCamViewController *)self sessionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ICDocCamViewController_sessionRuntimeError___block_invoke;
    block[3] = &unk_2642AA080;
    void block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    double v9 = [(ICDocCamViewController *)self resumeButton];
    [v9 setHidden:0];
  }
}

void __46__ICDocCamViewController_sessionRuntimeError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSessionRunning])
  {
    id v2 = [*(id *)(a1 + 32) session];
    [v2 startRunning];

    id v3 = [*(id *)(a1 + 32) session];
    objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ICDocCamViewController_sessionRuntimeError___block_invoke_2;
    block[3] = &unk_2642AA080;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __46__ICDocCamViewController_sessionRuntimeError___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resumeButton];
  [v1 setHidden:0];
}

- (void)hideUIForInterruptedSession:(BOOL)a3
{
  BOOL v3 = a3;
  if ((DCDebugInterfaceEnabled() & 1) != 0
    || ([MEMORY[0x263F1C5C0] currentDevice],
        float v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6 == 1))
  {
    if (v3)
    {
      [(ICDocCamViewController *)self enableShutter:0];
      int v7 = [(ICDocCamViewController *)self flashButton];
      [v7 setEnabled:0];

      int v8 = [(ICDocCamViewController *)self filterButton];
      [v8 setEnabled:0];

      double v9 = [(ICDocCamViewController *)self autoButton];
      [v9 setEnabled:0];

      id v10 = [(ICDocCamViewController *)self manualButton];
      [v10 setEnabled:0];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke;
      v17[3] = &unk_2642AA080;
      v17[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v17 animations:0.25];
    }
    else
    {
      id v11 = [(ICDocCamViewController *)self flashButton];
      [v11 setEnabled:1];

      id v12 = [(ICDocCamViewController *)self filterButton];
      [v12 setEnabled:1];

      uint64_t v13 = [(ICDocCamViewController *)self autoButton];
      [v13 setEnabled:1];

      uint64_t v14 = [(ICDocCamViewController *)self manualButton];
      [v14 setEnabled:1];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_2;
      v16[3] = &unk_2642AA080;
      v16[4] = self;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_3;
      v15[3] = &unk_2642AA0F8;
      void v15[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v16 animations:v15 completion:0.25];
    }
  }
}

void __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hideShutter:1];
  id v2 = [*(id *)(a1 + 32) flashButton];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) filterButton];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) userPromptView];
  [v4 setAlpha:0.0];

  id v5 = [*(id *)(a1 + 32) autoButton];
  [v5 setAlpha:0.0];

  id v6 = [*(id *)(a1 + 32) manualButton];
  [v6 setAlpha:0.0];

  id v7 = [*(id *)(a1 + 32) filterViewContainer];
  [v7 setAlpha:0.0];

  id v8 = [*(id *)(a1 + 32) flashSettingView];
  [v8 setAlpha:0.0];
}

void __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) hideShutter:0];
  id v2 = [*(id *)(a1 + 32) flashButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) filterButton];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) userPromptView];
  [v4 setAlpha:1.0];

  id v5 = [*(id *)(a1 + 32) autoButton];
  [v5 setAlpha:1.0];

  id v6 = [*(id *)(a1 + 32) manualButton];
  [v6 setAlpha:1.0];

  id v7 = [*(id *)(a1 + 32) filterViewContainer];
  [v7 setAlpha:1.0];

  id v8 = [*(id *)(a1 + 32) flashSettingView];
  [v8 setAlpha:1.0];
}

uint64_t __54__ICDocCamViewController_hideUIForInterruptedSession___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableShutter:1];
}

- (void)sessionWasInterrupted:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EF9720]];
  uint64_t v6 = [v5 integerValue];

  if ((unint64_t)(v6 - 1) >= 4) {
    id v7 = @"Unknown";
  }
  else {
    id v7 = off_2642AA588[v6 - 1];
  }
  id v8 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v18 = v7;
    _os_log_impl(&dword_217885000, v8, OS_LOG_TYPE_DEFAULT, "Capture session was interrupted with reason %@", buf, 0xCu);
  }

  [(ICDocCamViewController *)self dismissFilterAndFlashUI];
  [(ICDocCamViewController *)self hideUIForInterruptedSession:1];
  if (v6 != 1)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      double v9 = [(ICDocCamViewController *)self resumeButton];
      [v9 setAlpha:0.0];

      id v10 = [(ICDocCamViewController *)self resumeButton];
      [v10 setHidden:0];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __48__ICDocCamViewController_sessionWasInterrupted___block_invoke;
      v16[3] = &unk_2642AA080;
      v16[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v16 animations:0.25];
    }
    else if (v6 == 4)
    {
      id v11 = [(ICDocCamViewController *)self userPromptView];
      [v11 setHidden:1];

      id v12 = [(ICDocCamViewController *)self cameraUnavailableScrim];
      [v12 setAlpha:0.0];

      uint64_t v13 = [(ICDocCamViewController *)self cameraUnavailableScrim];
      [v13 setHidden:0];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __48__ICDocCamViewController_sessionWasInterrupted___block_invoke_2;
      v15[3] = &unk_2642AA080;
      void v15[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v15 animations:0.25];
      uint64_t v14 = [(ICDocCamViewController *)self cameraUnavailableLabel];
      [(ICDocCamViewController *)self speakLabelTextForAccessibilityIfNecessary:v14 afterDelay:1.0];
    }
  }
}

void __48__ICDocCamViewController_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resumeButton];
  [v1 setAlpha:1.0];
}

void __48__ICDocCamViewController_sessionWasInterrupted___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraUnavailableScrim];
  [v1 setAlpha:1.0];
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217885000, v4, OS_LOG_TYPE_DEFAULT, "Capture session interruption ended", buf, 2u);
  }

  id v5 = [(ICDocCamViewController *)self resumeButton];
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke;
    v12[3] = &unk_2642AA080;
    v12[4] = self;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_2;
    v11[3] = &unk_2642AA0F8;
    v11[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v12 animations:v11 completion:0.25];
  }
  id v7 = [(ICDocCamViewController *)self cameraUnavailableScrim];
  char v8 = [v7 isHidden];

  if ((v8 & 1) == 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_3;
    v10[3] = &unk_2642AA080;
    v10[4] = self;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_4;
    v9[3] = &unk_2642AA0F8;
    v9[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v10 animations:v9 completion:0.25];
  }
  [(ICDocCamViewController *)self hideUIForInterruptedSession:0];
}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resumeButton];
  [v1 setAlpha:0.0];
}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resumeButton];
  [v1 setHidden:1];
}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraUnavailableScrim];
  [v1 setAlpha:0.0];
}

void __51__ICDocCamViewController_sessionInterruptionEnded___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraUnavailableScrim];
  [v1 setHidden:1];
}

- (void)resumeInterruptedSession:(id)a3
{
  id v4 = [(ICDocCamViewController *)self sessionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) session];
  [v2 startRunning];

  id v3 = [*(id *)(a1 + 32) session];
  objc_msgSend(*(id *)(a1 + 32), "setSessionRunning:", objc_msgSend(v3, "isRunning"));

  id v4 = [*(id *)(a1 + 32) session];
  char v5 = [v4 isRunning];

  if (v5)
  {
    char v6 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    id v7 = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_3;
  }
  else
  {
    char v6 = block;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    id v7 = __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_2;
  }
  v6[2] = v7;
  v6[3] = &unk_2642AA080;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_2(uint64_t a1)
{
  id v9 = +[DCLocalization localizedStringForKey:@"Unable to resume" value:@"Unable to resume" table:@"Localizable"];
  id v2 = (void *)MEMORY[0x263F1C3F8];
  id v3 = DCAppName();
  id v4 = [v2 alertControllerWithTitle:v3 message:v9 preferredStyle:1];

  char v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v4 setImage:v5];

  char v6 = (void *)MEMORY[0x263F1C3F0];
  id v7 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  char v8 = [v6 actionWithTitle:v7 style:1 handler:0];

  [v4 addAction:v8];
  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

void __51__ICDocCamViewController_resumeInterruptedSession___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) resumeButton];
  [v1 setHidden:1];
}

- (id)createNSDataFrom:(id)a3 metaData:(id)a4
{
  char v5 = (UIImage *)a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF8F8];
  id v28 = v6;
  id v29 = v5;
  char v8 = UIImageJPEGRepresentation(v5, 1.0);
  CFDataRef v9 = [v7 dataWithData:v8];

  CFDataRef v27 = v9;
  id v10 = CGImageSourceCreateWithData(v9, 0);
  id v11 = (void *)[v6 mutableCopy];
  uint64_t v12 = *MEMORY[0x263F0F248];
  unsigned int v33 = [v11 objectForKey:*MEMORY[0x263F0F248]];
  uint64_t v13 = *MEMORY[0x263F0F3C0];
  unint64_t v32 = [v11 objectForKey:*MEMORY[0x263F0F3C0]];
  uint64_t v14 = *MEMORY[0x263F0F518];
  uint64_t v31 = [v11 objectForKey:*MEMORY[0x263F0F518]];
  uint64_t v15 = *MEMORY[0x263F0F508];
  double v30 = [v11 objectForKey:*MEMORY[0x263F0F508]];
  uint64_t v16 = *MEMORY[0x263F0F498];
  double v17 = [v11 objectForKey:*MEMORY[0x263F0F498]];
  uint64_t v18 = *MEMORY[0x263F0F370];
  uint64_t v19 = [v11 objectForKey:*MEMORY[0x263F0F370]];
  if (!v33)
  {
    unsigned int v33 = [MEMORY[0x263EFF9A0] dictionary];
  }
  if (!v32)
  {
    unint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
  }
  if (!v31)
  {
    uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
  }
  if (v30)
  {
    if (v17) {
      goto LABEL_9;
    }
LABEL_12:
    double v17 = [MEMORY[0x263EFF9A0] dictionary];
    if (v19) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  double v30 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v17) {
    goto LABEL_12;
  }
LABEL_9:
  if (v19) {
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_14:
  [v11 setObject:v33 forKey:v12];
  [v11 setObject:v32 forKey:v13];
  [v11 setObject:v31 forKey:v14];
  [v11 setObject:v30 forKey:v15];
  [v11 setObject:v17 forKey:v16];
  [v11 setObject:v19 forKey:v18];
  uint64_t v20 = [(UIImage *)v29 imageOrientation];
  if ((unint64_t)(v20 - 1) >= 3) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = dword_21791ACC4[v20 - 1];
  }
  BOOL v22 = [NSNumber numberWithInt:v21];
  [v11 setObject:v22 forKey:@"Orientation"];

  [v11 removeObjectForKey:@"Diagnostic"];
  CFStringRef Type = CGImageSourceGetType(v10);
  double v24 = [MEMORY[0x263EFF990] data];
  double v25 = CGImageDestinationCreateWithData(v24, Type, 1uLL, 0);
  CGImageDestinationAddImageFromSource(v25, v10, 0, (CFDictionaryRef)v11);
  CGImageDestinationFinalize(v25);
  CFRelease(v25);
  CFRelease(v10);

  return v24;
}

- (void)toggleAutoCapture:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDocCamViewController *)self manualButton];
  if (v5 == v4 && ![(ICDocCamViewController *)self autoMode])
  {

    goto LABEL_13;
  }
  id v6 = [(ICDocCamViewController *)self autoButton];
  if (v6 == v4)
  {
    BOOL v7 = [(ICDocCamViewController *)self autoMode];

    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  char v8 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v8 addBlockerOfType:@"ToggleAutoModeBlocker" clearRectangles:1 clearQueue:1];

  [(ICDocCamViewController *)self killFeedbackDisplayIncludingUserPrompts:1];
  CFDataRef v9 = [(ICDocCamViewController *)self autoButton];
  [v9 setEnabled:0];

  id v10 = [(ICDocCamViewController *)self manualButton];
  [v10 setEnabled:0];

  id v11 = [(ICDocCamViewController *)self autoButtonForIPhone];
  [v11 setEnabled:0];

  [(ICDocCamViewController *)self clearRectangles];
  [(ICDocCamViewController *)self clearQueue];
  if ([(ICDocCamViewController *)self autoMode])
  {
    [(ICDocCamViewController *)self setAutoMode:0];
    BOOL v12 = [(ICDocCamViewController *)self autoMode];
    uint64_t v13 = [(ICDocCamViewController *)self overlayView];
    [v13 setShowGridAnimation:v12];

    uint64_t v14 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (!v15)
    {
      [(ICDocCamViewController *)self updateConstraintsForIPhone];
      uint64_t v16 = [(ICDocCamViewController *)self thumbnailViewController];
      [v16 animateLayoutChange];
    }
    [(ICDocCamViewController *)self updateAutoButtonTitleForAutoMode:1];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke;
    v31[3] = &unk_2642AA080;
    v31[4] = self;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_2;
    v30[3] = &unk_2642AA0F8;
    v30[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v31 options:v30 animations:0.2 completion:0.0];
    double v17 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v17 setBeginTime:CACurrentMediaTime()];
    [v17 setDuration:2.0];
    [v17 setKeyTimes:&unk_26C7EDA00];
    [v17 setValues:&unk_26C7EDA18];
    [v17 setRemovedOnCompletion:1];
    [v17 setFillMode:*MEMORY[0x263F15AB0]];
    LODWORD(v18) = 1.0;
    [v17 setRepeatCount:v18];
    uint64_t v19 = [(ICDocCamViewController *)self autoShutterOffView];
    uint64_t v20 = [v19 layer];
    [v20 addAnimation:v17 forKey:@"autoOff"];

    uint64_t v21 = [(ICDocCamViewController *)self autoShutterOffView];
    BOOL v22 = [v21 layer];
    [v22 setOpacity:0.0];

    [(ICDocCamViewController *)self updateAccessibilityForAutoShutterMode:0];
  }
  else
  {
    [(ICDocCamViewController *)self setAutoMode:1];
    [(ICDocCamViewController *)self updateAutoButtonTitleForAutoMode:0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_3;
    v29[3] = &unk_2642AA080;
    v29[4] = self;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __44__ICDocCamViewController_toggleAutoCapture___block_invoke_4;
    v28[3] = &unk_2642AA0F8;
    v28[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v29 options:v28 animations:0.1 completion:0.0];
    double v17 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v17 setBeginTime:CACurrentMediaTime()];
    [v17 setDuration:2.0];
    [v17 setKeyTimes:&unk_26C7EDA00];
    [v17 setValues:&unk_26C7EDA18];
    [v17 setRemovedOnCompletion:1];
    [v17 setFillMode:*MEMORY[0x263F15AB0]];
    LODWORD(v23) = 1.0;
    [v17 setRepeatCount:v23];
    double v24 = [(ICDocCamViewController *)self autoShutterOnView];
    double v25 = [v24 layer];
    [v25 addAnimation:v17 forKey:@"autoOn"];

    double v26 = [(ICDocCamViewController *)self autoShutterOnView];
    CFDataRef v27 = [v26 layer];
    [v27 setOpacity:0.0];

    [(ICDocCamViewController *)self updateAccessibilityForAutoShutterMode:1];
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
LABEL_13:
}

uint64_t __44__ICDocCamViewController_toggleAutoCapture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAutoButtonTitleForAutoMode:0];
}

void __44__ICDocCamViewController_toggleAutoCapture___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) clearRectangles];
  id v2 = [*(id *)(a1 + 32) autoButton];
  [v2 setEnabled:1];

  id v3 = [*(id *)(a1 + 32) manualButton];
  [v3 setEnabled:1];

  id v4 = [*(id *)(a1 + 32) autoButtonForIPhone];
  [v4 setEnabled:1];

  id v5 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v5 removeBlockerOfType:@"ToggleAutoModeBlocker"];
}

uint64_t __44__ICDocCamViewController_toggleAutoCapture___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAutoButtonTitleForAutoMode:1];
}

void __44__ICDocCamViewController_toggleAutoCapture___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) clearRectangles];
  id v2 = [*(id *)(a1 + 32) autoButton];
  [v2 setEnabled:1];

  id v3 = [*(id *)(a1 + 32) manualButton];
  [v3 setEnabled:1];

  id v4 = [*(id *)(a1 + 32) autoButtonForIPhone];
  [v4 setEnabled:1];

  id v5 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v5 removeBlockerOfType:@"ToggleAutoModeBlocker"];
}

- (void)filterButtonCancelUI:(id)a3
{
  [(ICDocCamViewController *)self hideFilterSettingUI];
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ICDocCamViewController_filterButtonCancelUI___block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __47__ICDocCamViewController_filterButtonCancelUI___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"FilterSettingBlocker"];
}

- (void)filterButtonAction:(id)a3
{
  id v4 = a3;
  if ([(ICDocCamViewController *)self filterSettingUIShowing])
  {
    [(ICDocCamViewController *)self filterButtonCancelUI:v4];
  }
  else
  {
    id v5 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
    intptr_t v6 = dispatch_semaphore_wait(v5, 0);

    if (!v6)
    {
      BOOL v7 = [(ICDocCamViewController *)self processRequestsBlocker];
      [v7 addBlockerOfType:@"FilterSettingBlocker" clearRectangles:1 clearQueue:1];

      [(ICDocCamViewController *)self dismissFlashUI];
      char v8 = [(ICDocCamViewController *)self userPromptView];
      [v8 setHidden:1];

      CFDataRef v9 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v10 = [v9 userInterfaceIdiom];

      if (v10)
      {
        id v11 = [(ICDocCamViewController *)self view];
        [v11 layoutIfNeeded];

        [(ICDocCamViewController *)self setUpFilterScrollView];
        [(ICDocCamViewController *)self filterScrollViewContentWidthWithInterItemSpacing:20.0 startPadding:10.0 endPadding:22.0];
        double v13 = v12;
        uint64_t v14 = [(ICDocCamViewController *)self filterScrollView];
        [v14 contentInset];
        double v16 = v15;

        double v17 = [MEMORY[0x263F1C920] mainScreen];
        [v17 bounds];
        double v19 = v18;
        double v21 = v20;
        double v22 = v13 + 44.0 + v16;

        if (v19 >= v21) {
          double v23 = v21;
        }
        else {
          double v23 = v19;
        }
        double v24 = v23 + -66.0;
        if (v22 < v24) {
          double v24 = v22;
        }
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_3;
        v31[3] = &unk_2642AA170;
        v31[4] = self;
        *(double *)&void v31[5] = v24;
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_4;
        v30[3] = &unk_2642AA0F8;
        v30[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v31 animations:v30 completion:0.25];
      }
      else
      {
        double v25 = [(ICDocCamViewController *)self topToolbarForIPhone];
        [v25 setAlpha:1.0];

        double v26 = [(ICDocCamViewController *)self topToolbarForIPhone];
        [v26 setHidden:0];

        CFDataRef v27 = [(ICDocCamViewController *)self filterViewContainer];
        [v27 setAlpha:0.0];

        id v28 = [(ICDocCamViewController *)self filterViewContainer];
        [v28 setHidden:0];

        id v29 = [(ICDocCamViewController *)self view];
        [v29 layoutIfNeeded];

        [(ICDocCamViewController *)self setUpFilterScrollView];
        [(ICDocCamViewController *)self updateFilterChoiceButtonScrollPositionAnimated:0];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke;
        v33[3] = &unk_2642AA080;
        v33[4] = self;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __45__ICDocCamViewController_filterButtonAction___block_invoke_2;
        v32[3] = &unk_2642AA0F8;
        v32[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v33 animations:v32 completion:0.25];
      }
    }
  }
}

uint64_t __45__ICDocCamViewController_filterButtonAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) filterViewContainer];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];

  [*(id *)(a1 + 32) setUpFilterScrollView];
  id v5 = *(void **)(a1 + 32);

  return [v5 updateFilterChoiceButtonScrollPositionAnimated:0];
}

void __45__ICDocCamViewController_filterButtonAction___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v3 setHidden:1];

  [*(id *)(a1 + 32) setFilterSettingUIShowing:1];
  id v2 = [*(id *)(a1 + 32) flashAndFilterUISemaphore];
  dispatch_semaphore_signal(v2);

  [*(id *)(a1 + 32) updateAccessibilityForCurrentFilter];
  LODWORD(v2) = *MEMORY[0x263F1CE18];
  id v4 = [*(id *)(a1 + 32) filterViewContainer];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v4);
}

uint64_t __45__ICDocCamViewController_filterButtonAction___block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) filterViewContainerWidthConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];

  id v5 = *(void **)(a1 + 32);

  return [v5 setUpFilterScrollView];
}

void __45__ICDocCamViewController_filterButtonAction___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setFilterSettingUIShowing:1];
  double v2 = [*(id *)(a1 + 32) flashAndFilterUISemaphore];
  dispatch_semaphore_signal(v2);

  [*(id *)(a1 + 32) updateAccessibilityForCurrentFilter];
  LODWORD(v2) = *MEMORY[0x263F1CE18];
  id v3 = [*(id *)(a1 + 32) filterViewContainer];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v3);
}

- (void)cancelAction:(id)a3
{
  id v4 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v4 addBlockerOfType:@"CancelActionBlocker" clearRectangles:1 clearQueue:1];

  [(ICDocCamViewController *)self dismissFilterAndFlashUI];
  if ([(ICDocCamViewController *)self isInRetakeMode])
  {
    int64_t v5 = [(ICDocCamViewController *)self retakeIndex];
    [(ICDocCamViewController *)self disableRetakeMode];
    intptr_t v6 = [ICDocCamExtractedDocumentViewController alloc];
    BOOL v7 = [(ICDocCamViewController *)self documentInfoCollection];
    char v8 = [(ICDocCamViewController *)self imageCache];
    CFDataRef v9 = [(ICDocCamExtractedDocumentViewController *)v6 initWithDelegate:self documentInfoCollection:v7 imageCache:v8 currentIndex:v5 mode:0];

    uint64_t v10 = *MEMORY[0x263F15FD8];
    uint64_t v11 = *MEMORY[0x263F15FF8];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __39__ICDocCamViewController_cancelAction___block_invoke;
    v38[3] = &unk_2642AA080;
    v38[4] = self;
    [(ICDocCamViewController *)self pushViewController:v9 type:v10 subtype:v11 duration:v38 completion:0.25];
  }
  else
  {
    double v12 = [(ICDocCamViewController *)self documentInfoCollection];
    double v13 = [v12 docInfos];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      double v15 = [(ICDocCamViewController *)self documentInfoCollection];
      double v16 = [v15 docInfos];
      uint64_t v17 = [v16 count];

      if (v17 == 1) {
        double v18 = @"Discard Scan";
      }
      else {
        double v18 = @"Discard Scans";
      }
      double v21 = +[DCLocalization localizedStringForKey:v18 value:v18 table:@"Localizable"];
      double v22 = NSString;
      double v23 = +[DCLocalization localizedStringForKey:@"DISCARD_%lu_SCANNED_IMAGES_ALERT_MESSAGE" value:@"DISCARD_%lu_SCANNED_IMAGES_ALERT_MESSAGE" table:@"Localizable"];
      double v24 = [(ICDocCamViewController *)self documentInfoCollection];
      double v25 = [v24 docInfos];
      double v26 = objc_msgSend(v22, "localizedStringWithFormat:", v23, objc_msgSend(v25, "count"));

      CFDataRef v27 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v21 message:v26 preferredStyle:1];
      id v28 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
      [v27 setImage:v28];

      id v29 = (void *)MEMORY[0x263F1C3F0];
      double v30 = +[DCLocalization localizedStringForKey:@"Discard" value:@"Discard" table:@"Localizable"];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __39__ICDocCamViewController_cancelAction___block_invoke_2;
      v37[3] = &unk_2642AA1C0;
      v37[4] = self;
      uint64_t v31 = [v29 actionWithTitle:v30 style:0 handler:v37];

      [v27 addAction:v31];
      unint64_t v32 = (void *)MEMORY[0x263F1C3F0];
      unsigned int v33 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __39__ICDocCamViewController_cancelAction___block_invoke_4;
      v36[3] = &unk_2642AA1C0;
      v36[4] = self;
      objc_super v34 = [v32 actionWithTitle:v33 style:1 handler:v36];

      [v27 addAction:v34];
      [(ICDocCamViewController *)self presentViewController:v27 animated:1 completion:0];
    }
    else
    {
      double v19 = [(ICDocCamViewController *)self cameraUnavailableScrim];
      [v19 setHidden:1];

      double v20 = [(ICDocCamViewController *)self delegate];
      [v20 documentCameraControllerDidCancel:self];

      id v35 = [(ICDocCamViewController *)self processRequestsBlocker];
      [v35 removeBlockerOfType:@"CancelActionBlocker"];
    }
  }
}

void __39__ICDocCamViewController_cancelAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) saveButton];
  [v2 setHidden:0];

  id v3 = [*(id *)(a1 + 32) thumbnailContainerView];
  [v3 setHidden:0];

  id v4 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v4 removeBlockerOfType:@"CancelActionBlocker"];
}

void __39__ICDocCamViewController_cancelAction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 documentCameraControllerDidCancel:*(void *)(a1 + 32)];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ICDocCamViewController_cancelAction___block_invoke_3;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __39__ICDocCamViewController_cancelAction___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"CancelActionBlocker"];
}

void __39__ICDocCamViewController_cancelAction___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ICDocCamViewController_cancelAction___block_invoke_5;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

void __39__ICDocCamViewController_cancelAction___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"CancelActionBlocker"];
}

- (void)singleTap
{
  dispatch_time_t v3 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
  intptr_t v4 = dispatch_semaphore_wait(v3, 0);

  if (!v4)
  {
    [(ICDocCamViewController *)self dismissFilterAndFlashUI];
    int64_t v5 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
    dispatch_semaphore_signal(v5);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
  intptr_t v6 = dispatch_semaphore_wait(v5, 0);

  if (!v6)
  {
    id v8 = [(ICDocCamViewController *)self singleTapGestureRecognizer];

    if (v8 != v4)
    {
      LOBYTE(v7) = 1;
LABEL_12:
      double v19 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
      dispatch_semaphore_signal(v19);

      goto LABEL_13;
    }
    CFDataRef v9 = [(ICDocCamViewController *)self filterViewContainer];
    if ([v9 isHidden])
    {
      int v7 = [(ICDocCamViewController *)self flashSettingUIShowing];

      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v10 = [(ICDocCamViewController *)self view];
    [v4 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    double v15 = [(ICDocCamViewController *)self view];
    double v16 = objc_msgSend(v15, "hitTest:withEvent:", 0, v12, v14);

    uint64_t v17 = [(ICDocCamViewController *)self thumbnailContainerView];
    int v18 = [v16 isDescendantOfView:v17];

    if (v18) {
      [(ICDocCamViewController *)self dismissFilterAndFlashUI];
    }
    LOBYTE(v7) = v18 ^ 1;

    goto LABEL_12;
  }
  LOBYTE(v7) = 0;
LABEL_13:

  return v7;
}

- (void)shutterButtonAction:(id)a3
{
  id v4 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
  intptr_t v5 = dispatch_semaphore_wait(v4, 0);

  if (!v5)
  {
    [(ICDocCamViewController *)self dismissFilterAndFlashUI];
    intptr_t v6 = [(ICDocCamViewController *)self overlayView];
    int v7 = [v6 documentQuad];
    [(ICDocCamViewController *)self setBackupQuad:v7];

    [(ICDocCamViewController *)self snapStillImageWithMode:2];
    id v8 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
    dispatch_semaphore_signal(v8);
  }
}

- (void)saveAction:(id)a3
{
  for (unint64_t i = 0; ; ++i)
  {
    id v26 = [(ICDocCamViewController *)self documentInfoCollection];
    intptr_t v5 = [v26 docInfos];
    unint64_t v6 = [v5 count];

    if (v6 <= i) {
      break;
    }
    id v27 = [(ICDocCamViewController *)self documentInfoCollection];
    int v7 = [v27 docInfos];
    id v8 = [v7 objectAtIndexedSubscript:i];
    CFDataRef v9 = [v8 croppedAndFilteredImageUUID];

    if (!v9) {
      return;
    }
  }
  id v28 = [(ICDocCamViewController *)self processRequestsBlocker];
  uint64_t v10 = [v28 blockerSet];
  char v11 = [v10 containsObject:@"SaveActionBlocker"];

  if ((v11 & 1) == 0)
  {
    id v29 = [(ICDocCamViewController *)self processRequestsBlocker];
    [v29 addBlockerOfType:@"SaveActionBlocker" clearRectangles:1 clearQueue:1];

    [(ICDocCamViewController *)self dismissFilterAndFlashUI];
    id v30 = [(ICDocCamViewController *)self documentInfoCollection];
    double v12 = [v30 docInfos];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      id v31 = [(ICDocCamViewController *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v32 = [(ICDocCamViewController *)self delegate];
        double v15 = [(ICDocCamViewController *)self documentInfoCollection];
        double v16 = [(ICDocCamViewController *)self imageCache];
        [v32 documentCameraController:self didFinishWithDocInfoCollection:v15 imageCache:v16 warnUser:1];
      }
      else
      {
        id v33 = [(ICDocCamViewController *)self imageCache];
        uint64_t v17 = [(ICDocCamViewController *)self documentInfoCollection];
        int v18 = [v17 docInfos];
        double v19 = [v18 objectAtIndexedSubscript:0];
        double v20 = [v19 croppedAndFilteredImageUUID];
        uint64_t v21 = [v33 getImage:v20];

        double v22 = [(ICDocCamViewController *)self documentInfoCollection];
        double v23 = [v22 docInfos];
        double v24 = [v23 objectAtIndexedSubscript:0];
        double v25 = [v24 metaData];
        double v15 = [(ICDocCamViewController *)self createNSDataFrom:v21 metaData:v25];

        [(ICDocCamViewController *)self didFinishWithImage:v15];
        id v32 = (id)v21;
      }
    }
  }
}

- (void)enableShutter:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [(ICDocCamViewController *)self shutterButton];
    [v5 setPseudoDisabled:0];
  }
  id v6 = [(ICDocCamViewController *)self shutterButton];
  [v6 setUserInteractionEnabled:v3];

  id v7 = [(ICDocCamViewController *)self captureEventInteraction];
  [v7 setEnabled:v3];
}

- (void)dismissFilterUI
{
  BOOL v3 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v3 removeBlockerOfType:@"FilterSettingBlocker"];

  [(ICDocCamViewController *)self hideFilterSettingUI];
}

- (void)dismissFlashUI
{
  BOOL v3 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v3 removeBlockerOfType:@"FlashSettingBlocker"];

  [(ICDocCamViewController *)self hideFlashSettingUI];
}

- (void)dismissFilterAndFlashUI
{
  [(ICDocCamViewController *)self dismissFilterUI];

  [(ICDocCamViewController *)self dismissFlashUI];
}

- (void)hideShutter:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)!a3;
  id v6 = [(ICDocCamViewController *)self shutterButton];
  [v6 setAlpha:v5];

  id v7 = [(ICDocCamViewController *)self captureEventInteraction];
  [v7 setEnabled:v3];
}

- (void)hideFlashSettingUI
{
  if ([(ICDocCamViewController *)self flashSettingUIShowing])
  {
    BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_3;
      v10[3] = &unk_2642AA170;
      v10[4] = self;
      void v10[5] = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_4;
      v9[3] = &unk_2642AA0F8;
      v9[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v10 animations:v9 completion:0.25];
    }
    else
    {
      double v5 = [(ICDocCamViewController *)self topToolbarForIPhone];
      [v5 setHidden:0];

      id v6 = [(ICDocCamViewController *)self topToolbarForIPhone];
      [v6 setAlpha:0.0];

      id v7 = [(ICDocCamViewController *)self flashSettingView];
      [v7 setAlpha:1.0];

      id v8 = [(ICDocCamViewController *)self flashSettingView];
      [v8 setHidden:0];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke;
      v12[3] = &unk_2642AA080;
      v12[4] = self;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_2;
      v11[3] = &unk_2642AA0F8;
      v11[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v12 animations:v11 completion:0.25];
    }
  }
}

void __44__ICDocCamViewController_hideFlashSettingUI__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flashSettingView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v3 setAlpha:1.0];
}

uint64_t __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flashSettingView];
  [v2 setHidden:1];

  [*(id *)(a1 + 32) setFlashSettingUIShowing:0];
  [*(id *)(a1 + 32) updateAccessibilityForCurrentFlashMode];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateAccessibilityFocusForHidingFlashSettingsUI];
}

void __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) flashSettingWidthConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

uint64_t __44__ICDocCamViewController_hideFlashSettingUI__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setFlashSettingUIShowing:0];
  [*(id *)(a1 + 32) updateAccessibilityForCurrentFlashMode];
  double v2 = *(void **)(a1 + 32);

  return [v2 updateAccessibilityFocusForHidingFlashSettingsUI];
}

- (void)flashButtonCancelUI:(id)a3
{
  [(ICDocCamViewController *)self hideFlashSettingUI];
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICDocCamViewController_flashButtonCancelUI___block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __46__ICDocCamViewController_flashButtonCancelUI___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"FlashSettingBlocker"];
}

- (void)changeFlashAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDocCamViewController *)self flashSettingViewOffButton];

  if (v5 == v4)
  {
    [(ICDocCamViewController *)self setFlashMode:0];
    id v8 = [(ICDocCamViewController *)self flashButtonImage];
    CFDataRef v9 = [(ICDocCamViewController *)self flashButton];
    [v9 setImage:v8 forState:0];

    uint64_t v10 = [(ICDocCamViewController *)self flashButton];
    char v11 = [MEMORY[0x263F1C550] whiteColor];
    [v10 setTintColor:v11];

    double v12 = [(ICDocCamViewController *)self flashButtonForIPhone];
    [v12 setImage:v8 forState:0];

    uint64_t v13 = [(ICDocCamViewController *)self flashButtonForIPhone];
    char v14 = [MEMORY[0x263F1C550] whiteColor];
    [v13 setTintColor:v14];

    double v15 = [(ICDocCamViewController *)self flashButtonForIPhone];
    [v15 setLargeContentImage:v8];

    double v16 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
    [v16 setImage:v8 forState:0];

    uint64_t v17 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
    int v18 = [MEMORY[0x263F1C550] whiteColor];
    [v17 setTintColor:v18];
  }
  else
  {
    id v6 = [(ICDocCamViewController *)self flashSettingViewOnButton];

    if (v6 == v4)
    {
      [(ICDocCamViewController *)self setFlashMode:1];
      id v8 = [(ICDocCamViewController *)self flashButtonImage];
      double v19 = [(ICDocCamViewController *)self flashButton];
      [v19 setImage:v8 forState:0];

      double v20 = [(ICDocCamViewController *)self flashButton];
      uint64_t v21 = [(ICDocCamViewController *)self cameraHighlightColor];
      [v20 setTintColor:v21];

      double v22 = [(ICDocCamViewController *)self flashButtonForIPhone];
      [v22 setImage:v8 forState:0];

      double v23 = [(ICDocCamViewController *)self flashButtonForIPhone];
      double v24 = [(ICDocCamViewController *)self cameraHighlightColor];
      [v23 setTintColor:v24];

      double v25 = [(ICDocCamViewController *)self flashButtonForIPhone];
      [v25 setLargeContentImage:v8];

      id v26 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      [v26 setImage:v8 forState:0];

      uint64_t v17 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      int v18 = [(ICDocCamViewController *)self cameraHighlightColor];
      [v17 setTintColor:v18];
    }
    else
    {
      id v7 = [(ICDocCamViewController *)self flashSettingViewAutoButton];

      if (v7 != v4)
      {
        id v8 = 0;
        goto LABEL_9;
      }
      [(ICDocCamViewController *)self setFlashMode:2];
      id v8 = [(ICDocCamViewController *)self flashButtonImage];
      id v27 = [(ICDocCamViewController *)self flashButton];
      [v27 setImage:v8 forState:0];

      id v28 = [(ICDocCamViewController *)self flashButton];
      id v29 = [MEMORY[0x263F1C550] whiteColor];
      [v28 setTintColor:v29];

      id v30 = [(ICDocCamViewController *)self flashButtonForIPhone];
      [v30 setImage:v8 forState:0];

      id v31 = [(ICDocCamViewController *)self flashButtonForIPhone];
      id v32 = [MEMORY[0x263F1C550] whiteColor];
      [v31 setTintColor:v32];

      id v33 = [(ICDocCamViewController *)self flashButtonForIPhone];
      [v33 setLargeContentImage:v8];

      objc_super v34 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      [v34 setImage:v8 forState:0];

      uint64_t v17 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      int v18 = [MEMORY[0x263F1C550] whiteColor];
      [v17 setTintColor:v18];
    }
  }

LABEL_9:
  int64_t v35 = [(ICDocCamViewController *)self flashMode];
  if (v35)
  {
    if (v35 == 1)
    {
      uint64_t v36 = [(ICDocCamViewController *)self flashSettingViewOnButton];
    }
    else
    {
      if (v35 != 2)
      {
        char v37 = 0;
        goto LABEL_17;
      }
      uint64_t v36 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
    }
  }
  else
  {
    uint64_t v36 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  }
  char v37 = (void *)v36;
LABEL_17:
  double v38 = [MEMORY[0x263F1C550] whiteColor];
  double v39 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  [v39 setTintColor:v38];

  uint64_t v40 = [MEMORY[0x263F1C550] whiteColor];
  float v41 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  [v41 setTintColor:v40];

  unint64_t v42 = [MEMORY[0x263F1C550] whiteColor];
  double v43 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  [v43 setTintColor:v42];

  uint64_t v44 = [(ICDocCamViewController *)self cameraHighlightColor];
  [v37 setTintColor:v44];

  [(ICDocCamViewController *)self hideFlashSettingUI];
  dispatch_time_t v45 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ICDocCamViewController_changeFlashAction___block_invoke;
  block[3] = &unk_2642AA080;
  void block[4] = self;
  dispatch_after(v45, MEMORY[0x263EF83A0], block);
  [(ICDocCamViewController *)self updateAccessibilityForCurrentFlashMode];
}

void __44__ICDocCamViewController_changeFlashAction___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"FlashSettingBlocker"];
}

- (void)flashButtonAction:(id)a3
{
  id v4 = [(ICDocCamViewController *)self flashAndFilterUISemaphore];
  intptr_t v5 = dispatch_semaphore_wait(v4, 0);

  if (!v5)
  {
    id v6 = [(ICDocCamViewController *)self processRequestsBlocker];
    [v6 addBlockerOfType:@"FlashSettingBlocker" clearRectangles:1 clearQueue:1];

    [(ICDocCamViewController *)self dismissFilterUI];
    id v7 = [(ICDocCamViewController *)self userPromptView];
    [v7 setHidden:1];

    id v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9)
    {
      int64_t v10 = [(ICDocCamViewController *)self flashMode];
      if (v10)
      {
        if (v10 == 1)
        {
          uint64_t v11 = [(ICDocCamViewController *)self flashSettingViewOnButton];
        }
        else
        {
          if (v10 != 2)
          {
            int v18 = 0;
            goto LABEL_15;
          }
          uint64_t v11 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
        }
      }
      else
      {
        uint64_t v11 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      }
      int v18 = (void *)v11;
LABEL_15:
      double v19 = [MEMORY[0x263F1C550] whiteColor];
      double v20 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      [v20 setTintColor:v19];

      uint64_t v21 = [MEMORY[0x263F1C550] whiteColor];
      double v22 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      [v22 setTintColor:v21];

      double v23 = [MEMORY[0x263F1C550] whiteColor];
      double v24 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      [v24 setTintColor:v23];

      double v25 = [(ICDocCamViewController *)self cameraHighlightColor];
      [v18 setTintColor:v25];

      id v26 = [(ICDocCamViewController *)self view];
      [v26 layoutIfNeeded];

      BOOL v27 = [(ICDocCamViewController *)self flashSettingUIShowing];
      uint64_t v28 = 0;
      if (!v27) {
        [(ICDocCamViewController *)self flashSettingViewWidthForIPad];
      }
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_3;
      v41[3] = &unk_2642AA170;
      v41[4] = self;
      v41[5] = v28;
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_4;
      v40[3] = &unk_2642AA0F8;
      v40[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v41 animations:v40 completion:0.25];
      goto LABEL_23;
    }
    double v12 = [(ICDocCamViewController *)self flashButtonImage];
    uint64_t v13 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
    [v13 setImage:v12 forState:0];

    int64_t v14 = [(ICDocCamViewController *)self flashMode];
    if (v14)
    {
      if (v14 == 1)
      {
        uint64_t v15 = [(ICDocCamViewController *)self flashSettingViewOnButton];
        double v16 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
        uint64_t v17 = [(ICDocCamViewController *)self cameraHighlightColor];
        [v16 setTintColor:v17];
      }
      else
      {
        if (v14 != 2)
        {
          int v18 = 0;
          goto LABEL_22;
        }
        uint64_t v15 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
        double v16 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
        uint64_t v17 = [(ICDocCamViewController *)self cameraHighlightColor];
        [v16 setTintColor:v17];
      }
    }
    else
    {
      uint64_t v15 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      double v16 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
      uint64_t v17 = [MEMORY[0x263F1C550] whiteColor];
      [v16 setTintColor:v17];
    }

    int v18 = (void *)v15;
LABEL_22:
    id v29 = [MEMORY[0x263F1C550] whiteColor];
    id v30 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
    [v30 setTintColor:v29];

    id v31 = [MEMORY[0x263F1C550] whiteColor];
    id v32 = [(ICDocCamViewController *)self flashSettingViewOnButton];
    [v32 setTintColor:v31];

    id v33 = [MEMORY[0x263F1C550] whiteColor];
    objc_super v34 = [(ICDocCamViewController *)self flashSettingViewOffButton];
    [v34 setTintColor:v33];

    int64_t v35 = [(ICDocCamViewController *)self cameraHighlightColor];
    [v18 setTintColor:v35];

    uint64_t v36 = [(ICDocCamViewController *)self flashSettingView];
    [v36 setAlpha:0.0];

    char v37 = [(ICDocCamViewController *)self flashSettingView];
    [v37 setHidden:0];

    double v38 = [(ICDocCamViewController *)self topToolbarForIPhone];
    [v38 setAlpha:1.0];

    double v39 = [(ICDocCamViewController *)self topToolbarForIPhone];
    [v39 setHidden:0];

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke;
    v43[3] = &unk_2642AA080;
    v43[4] = self;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __44__ICDocCamViewController_flashButtonAction___block_invoke_2;
    v42[3] = &unk_2642AA0F8;
    v42[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v43 animations:v42 completion:0.25];

LABEL_23:
  }
}

void __44__ICDocCamViewController_flashButtonAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flashSettingView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v3 setAlpha:0.0];
}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) topToolbarForIPhone];
  [v3 setHidden:0];

  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing") ^ 1);
  id v2 = [*(id *)(a1 + 32) flashAndFilterUISemaphore];
  dispatch_semaphore_signal(v2);

  [*(id *)(a1 + 32) updateAccessibilityForCurrentFlashMode];
  LODWORD(v2) = *MEMORY[0x263F1CE18];
  id v4 = [*(id *)(a1 + 32) flashSettingView];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v2, v4);
}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) flashSettingWidthConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

void __44__ICDocCamViewController_flashButtonAction___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) flashAndFilterUISemaphore];
  dispatch_semaphore_signal(v2);

  objc_msgSend(*(id *)(a1 + 32), "setFlashSettingUIShowing:", objc_msgSend(*(id *)(a1 + 32), "flashSettingUIShowing") ^ 1);
  [*(id *)(a1 + 32) updateAccessibilityForCurrentFlashMode];
  uint64_t v3 = [*(id *)(a1 + 32) flashSettingUIShowing] ^ 1;
  id v6 = [*(id *)(a1 + 32) flashSettingButtonView];
  [v6 setAccessibilityElementsHidden:v3];

  char v4 = [*(id *)(a1 + 32) flashSettingUIShowing];
  intptr_t v5 = *(void **)(a1 + 32);
  if (v4) {
    [v5 flashSettingView];
  }
  else {
  id v7 = [v5 flashButton];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v7);
}

- (void)image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v5 = a4;
  if (v5)
  {
    id v6 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamViewController image:didFinishSavingWithError:contextInfo:]();
    }
  }
}

- (void)didFinishWithImage:(id)a3
{
  id v5 = a3;
  char v4 = [(ICDocCamViewController *)self delegate];
  [v4 documentCameraController:self didFinishWithImage:v5];
}

- (BOOL)validRect:(id)a3 forImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    [v9 topLeft];
    double v11 = v10;
    [v9 topRight];
    if (v11 < v12)
    {
      [v9 bottomLeft];
      double v14 = v13;
      [v9 bottomRight];
      if (v14 < v15)
      {
        [v9 topLeft];
        double v17 = v16;
        [v9 bottomLeft];
        if (v17 > v18)
        {
          [v9 topRight];
          double v20 = v19;
          [v9 bottomRight];
          if (v20 > v21)
          {
            if ([(ICDocCamViewController *)self useDocumentSegmentation])
            {
LABEL_8:
              BOOL v22 = 1;
LABEL_33:

              goto LABEL_34;
            }
            if (height <= width)
            {
              [(ICDocCamViewController *)self viewBoundsSize];
              double v39 = v38;
              [(ICDocCamViewController *)self viewBoundsSize];
              double v40 = height / (width / v39);
              double v41 = 0.0;
              if (v40 > v42)
              {
                [(ICDocCamViewController *)self viewBoundsSize];
                double v41 = (v40 - v43) * 0.5 / v40;
              }
              [v9 topLeft];
              if (v44 >= 0.0)
              {
                [v9 bottomLeft];
                if (v45 >= 0.0)
                {
                  [v9 topRight];
                  if (v46 <= 1.0)
                  {
                    [v9 bottomRight];
                    if (v47 <= 1.0)
                    {
                      [v9 topLeft];
                      if (v48 <= 1.0 - v41)
                      {
                        [v9 bottomLeft];
                        if (v49 >= v41)
                        {
                          [v9 topRight];
                          if (v50 <= 1.0 - v41)
                          {
                            [v9 bottomRight];
                            if (v51 >= v41) {
                              goto LABEL_8;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            else
            {
              [(ICDocCamViewController *)self viewBoundsSize];
              double v24 = v23;
              [(ICDocCamViewController *)self viewBoundsSize];
              double v25 = width / (height / v24);
              double v26 = 0.0;
              if (v25 > v27)
              {
                [(ICDocCamViewController *)self viewBoundsSize];
                double v26 = (v25 - v28) * 0.5 / v25;
              }
              [v9 topLeft];
              if (v29 >= v26)
              {
                [v9 bottomLeft];
                if (v30 >= v26)
                {
                  [v9 topRight];
                  double v31 = 1.0 - v26;
                  if (v32 <= v31)
                  {
                    [v9 bottomRight];
                    if (v33 <= v31)
                    {
                      [v9 topLeft];
                      if (v34 <= 1.0)
                      {
                        [v9 bottomLeft];
                        if (v35 >= 0.0)
                        {
                          [v9 topRight];
                          if (v36 <= 1.0)
                          {
                            [v9 bottomRight];
                            if (v37 >= 0.0) {
                              goto LABEL_8;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v22 = 0;
    goto LABEL_33;
  }
  BOOL v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)sufficientlyLarge:(id)a3 forImageSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = [(ICDocCamViewController *)self videoPreviewLayer];
    id v8 = [(ICDocCamViewController *)self videoPreviewLayer];
    [v8 frame];
    double v10 = v9;
    double v11 = [(ICDocCamViewController *)self videoPreviewLayer];
    [v11 frame];
    objc_msgSend(v7, "metadataOutputRectOfInterestForRect:", 0.0, 0.0, v10);
    double v13 = v12;
    double v15 = v14;

    double v16 = [(ICDocCamViewController *)self videoPreviewLayer];
    double v17 = [v16 connection];
    uint64_t v18 = [v17 videoOrientation];

    if ((unint64_t)(v18 - 1) >= 2) {
      double v19 = v15;
    }
    else {
      double v19 = v13;
    }
    if ((unint64_t)(v18 - 1) >= 2) {
      double v20 = v13;
    }
    else {
      double v20 = v15;
    }
    double v21 = [v6 objectAtIndexedSubscript:0];
    if ([(ICDocCamViewController *)self useDocumentSegmentation])
    {
      if (![(ICDocCamViewController *)self segmentMeanComputed])
      {
        [v21 confidence];
        float v23 = v22;
        [(ICDocCamViewController *)self segmentMinimumVisualConfidence60Frames];
        if (v23 < v24)
        {
          BOOL v25 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      if ([(ICDocCamViewController *)self segmentMeanComputed])
      {
        [(ICDocCamViewController *)self setSegmentMeanComputed:0];
        double v30 = [ICDocCamImageQuad alloc];
        [(ICDocCamViewController *)self segmentBottomLeft];
        double v32 = v31;
        double v34 = v33;
        [(ICDocCamViewController *)self segmentBottomRight];
        double v36 = v35;
        double v38 = v37;
        [(ICDocCamViewController *)self segmentTopLeft];
        double v40 = v39;
        double v42 = v41;
        [(ICDocCamViewController *)self segmentTopRight];
        double v45 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v30, "initWithBottomLeft:bottomRight:topLeft:topRight:", v32, v34, v36, v38, v40, v42, v43, v44);
      }
      else
      {
        double v45 = +[ICDocCamImageQuad quadFromVNRectangle:v21];
      }
      double v26 = v45;
      [(ICDocCamImageQuad *)v45 bounds];
      double v29 = 0.3;
    }
    else
    {
      double v26 = +[ICDocCamImageQuad quadFromVNRectangle:v21];
      [v26 bounds];
      double v29 = 0.6;
    }
    BOOL v25 = v28 > v19 * v29 || v27 > v20 * v29;

    goto LABEL_23;
  }
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (BOOL)shouldAutoShoot
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  if (![(ICDocCamViewController *)self autoMode]) {
    return 0;
  }
  if (![(ICDocCamViewController *)self isInRetakeMode])
  {
    uint64_t v3 = [(ICDocCamViewController *)self delegate];
    char v4 = [(ICDocCamViewController *)self documentInfoCollection];
    id v5 = [v4 docInfos];
    char v6 = objc_msgSend(v3, "documentCameraController:canAddImages:", self, objc_msgSend(v5, "count") + 1);

    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  id v7 = [(ICDocCamViewController *)self processRequestsBlocker];
  char v8 = [v7 blocked];

  if (v8) {
    return 0;
  }
  double v9 = [(ICDocCamViewController *)self snapStillImageBlocker];
  char v10 = [v9 blocked];

  if (v10) {
    return 0;
  }
  double v11 = [(ICDocCamViewController *)self rectResultsQueue];
  uint64_t v12 = [v11 size];

  if (!v12)
  {
    double v19 = [(ICDocCamViewController *)self overlayView];
    [v19 clearRectangles];

    return 0;
  }
  double v13 = [MEMORY[0x263EFF910] date];
  v182[0] = 0;
  v182[1] = v182;
  v182[2] = 0x2020000000;
  char v183 = 0;
  v180[0] = 0;
  v180[1] = v180;
  v180[2] = 0x2020000000;
  int v181 = 0;
  uint64_t v172 = 0;
  v173 = (double *)&v172;
  uint64_t v174 = 0x4012000000;
  v175 = __Block_byref_object_copy__4;
  v176 = __Block_byref_object_dispose__4;
  v177 = "";
  uint64_t v179 = 0;
  uint64_t v178 = 0;
  v171[0] = 0;
  v171[1] = v171;
  v171[2] = 0x4012000000;
  v171[3] = __Block_byref_object_copy__4;
  v171[4] = __Block_byref_object_dispose__4;
  v171[5] = "";
  v171[7] = 0;
  v171[6] = 0;
  uint64_t v167 = 0;
  v168 = &v167;
  uint64_t v169 = 0x2020000000;
  char v170 = 0;
  uint64_t v163 = 0;
  v164 = (float *)&v163;
  uint64_t v165 = 0x2020000000;
  int v166 = 0;
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x3032000000;
  v160 = __Block_byref_object_copy__774;
  v161 = __Block_byref_object_dispose__775;
  id v162 = [MEMORY[0x263EFF980] array];
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__774;
  uint64_t v155 = __Block_byref_object_dispose__775;
  id v156 = [MEMORY[0x263EFF980] array];
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __41__ICDocCamViewController_shouldAutoShoot__block_invoke;
  v140[3] = &unk_2642AA1E8;
  v142 = v180;
  id v143 = &v167;
  uint64_t v144 = v182;
  v145 = &v163;
  id v14 = v13;
  id v141 = v14;
  v146 = &v172;
  int v150 = 1101004800;
  v147 = v171;
  v148 = &v157;
  double v149 = &v151;
  double v15 = (void *)MEMORY[0x21D44FA30](v140);
  double v16 = [(ICDocCamViewController *)self rectResultsQueue];
  double v17 = [(ICDocCamViewController *)self rectResultsQueue];
  objc_msgSend(v16, "apply:fromIndex:toIndex:", v15, objc_msgSend(v17, "size") - 1, 0);

  if (v173[6] <= 20.0 && v173[7] <= 20.0 && !*((unsigned char *)v168 + 24) && v164[6] >= 2.0)
  {
    unint64_t v21 = [(id)v158[5] count];
    if (v21)
    {
      [(ICDocCamViewController *)self rectangleStabilityStdDev];
      if (v22 != -1.0)
      {
        if ([(ICDocCamViewController *)self useDocumentSegmentation])
        {
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          id v23 = (id)v152[5];
          int v24 = 0;
          uint64_t v25 = [v23 countByEnumeratingWithState:&v136 objects:v186 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v137;
            float v27 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v137 != v26) {
                  objc_enumerationMutation(v23);
                }
                [*(id *)(*((void *)&v136 + 1) + 8 * i) floatValue];
                if (v29 >= 0.99999) {
                  float v29 = -0.0;
                }
                else {
                  ++v24;
                }
                float v27 = v27 + v29;
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v136 objects:v186 count:16];
            }
            while (v25);
          }
          else
          {
            float v27 = 0.0;
          }

          [(ICDocCamViewController *)self segmentMinimumVisualConfidence60Frames];
          float v30 = (double)v24 + 0.001;
          if ((float)(v27 / v30) < v31) {
            goto LABEL_11;
          }
        }
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id v32 = (id)v158[5];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v132 objects:v185 count:16];
        if (v33)
        {
          double v34 = 0.0;
          double v124 = 0.0;
          double v126 = 0.0;
          uint64_t v35 = *(void *)v133;
          double v120 = 0.0;
          double v122 = 0.0;
          double v116 = 0.0;
          double v118 = 0.0;
          double v36 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              double v114 = v34;
              if (*(void *)v133 != v35) {
                objc_enumerationMutation(v32);
              }
              double v38 = *(void **)(*((void *)&v132 + 1) + 8 * j);
              [v38 topLeft];
              double v40 = v39;
              [v38 topLeft];
              double v42 = v41;
              [v38 topRight];
              double v44 = v43;
              [v38 topRight];
              double v46 = v45;
              [v38 bottomLeft];
              double v48 = v47;
              [v38 bottomLeft];
              double v50 = v49;
              [v38 bottomRight];
              double v52 = v51;
              [v38 bottomRight];
              double v36 = v36 + v40;
              double v116 = v116 + v42;
              double v118 = v118 + v44;
              double v120 = v120 + v46;
              double v122 = v122 + v48;
              double v124 = v124 + v50;
              double v126 = v126 + v52;
              double v34 = v114 + v53;
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v132 objects:v185 count:16];
          }
          while (v33);
        }
        else
        {
          double v34 = 0.0;
          double v124 = 0.0;
          double v126 = 0.0;
          double v120 = 0.0;
          double v122 = 0.0;
          double v116 = 0.0;
          double v118 = 0.0;
          double v36 = 0.0;
        }

        double v104 = v116 / (double)v21;
        double v105 = v36 / (double)v21;
        double v102 = v120 / (double)v21;
        double v103 = v118 / (double)v21;
        double v100 = v124 / (double)v21;
        double v101 = v122 / (double)v21;
        double v97 = (double)v21;
        double v98 = v34 / (double)v21;
        double v99 = v126 / (double)v21;
        if ([(ICDocCamViewController *)self useDocumentSegmentation])
        {
          -[ICDocCamViewController setSegmentTopLeft:](self, "setSegmentTopLeft:", v105, v104, *(void *)&v97);
          -[ICDocCamViewController setSegmentTopRight:](self, "setSegmentTopRight:", v103, v102);
          -[ICDocCamViewController setSegmentBottomLeft:](self, "setSegmentBottomLeft:", v101, v100);
          -[ICDocCamViewController setSegmentBottomRight:](self, "setSegmentBottomRight:", v99, v98);
          [(ICDocCamViewController *)self setSegmentMeanComputed:1];
        }
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        id v54 = (id)v158[5];
        uint64_t v55 = [v54 countByEnumeratingWithState:&v128 objects:v184 count:16];
        if (v55)
        {
          double v125 = 0.0;
          double v127 = 0.0;
          uint64_t v56 = *(void *)v129;
          double v121 = 0.0;
          double v123 = 0.0;
          double v117 = 0.0;
          double v119 = 0.0;
          double v113 = 0.0;
          double v115 = 0.0;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v129 != v56) {
                objc_enumerationMutation(v54);
              }
              double v58 = *(void **)(*((void *)&v128 + 1) + 8 * k);
              objc_msgSend(v58, "topLeft", *(void *)&v97);
              double v112 = v59;
              [v58 topLeft];
              double v111 = v60;
              [v58 topLeft];
              double v110 = v61;
              [v58 topLeft];
              double v109 = v62;
              [v58 topRight];
              double v108 = v63;
              [v58 topRight];
              double v107 = v64;
              [v58 topRight];
              double v106 = v65;
              [v58 topRight];
              double v67 = v66;
              [v58 bottomLeft];
              double v69 = v68;
              [v58 bottomLeft];
              double v71 = v70;
              [v58 bottomLeft];
              double v73 = v72;
              [v58 bottomLeft];
              double v75 = v74;
              [v58 bottomRight];
              double v77 = v76;
              [v58 bottomRight];
              double v79 = v78;
              [v58 bottomRight];
              double v81 = v80;
              [v58 bottomRight];
              double v113 = v113 + (v112 - v105) * (v111 - v105);
              double v115 = v115 + (v110 - v104) * (v109 - v104);
              double v117 = v117 + (v108 - v103) * (v107 - v103);
              double v119 = v119 + (v106 - v102) * (v67 - v102);
              double v121 = v121 + (v69 - v101) * (v71 - v101);
              double v123 = v123 + (v73 - v100) * (v75 - v100);
              double v125 = v125 + (v77 - v99) * (v79 - v99);
              double v127 = v127 + (v81 - v98) * (v82 - v98);
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v128 objects:v184 count:16];
          }
          while (v55);
        }
        else
        {
          double v125 = 0.0;
          double v127 = 0.0;
          double v121 = 0.0;
          double v123 = 0.0;
          double v117 = 0.0;
          double v119 = 0.0;
          double v113 = 0.0;
          double v115 = 0.0;
        }

        double v83 = sqrt(v113 / v97);
        double v84 = sqrt(v117 / v97);
        double v85 = sqrt(v119 / v97);
        double v86 = sqrt(v121 / v97);
        double v87 = sqrt(v123 / v97);
        double v88 = sqrt(v125 / v97);
        double v89 = sqrt(v127 / v97);
        if (v86 < v88) {
          double v86 = v88;
        }
        if (v84 < v86) {
          double v84 = v86;
        }
        if (v83 >= v84) {
          double v90 = v83;
        }
        else {
          double v90 = v84;
        }
        if (v87 >= v89) {
          double v91 = v87;
        }
        else {
          double v91 = v89;
        }
        if (v85 >= v91) {
          double v91 = v85;
        }
        double v92 = sqrt(v115 / v97);
        if (v92 >= v91) {
          double v93 = v92;
        }
        else {
          double v93 = v91;
        }
        [(ICDocCamViewController *)self rectangleStabilityStdDev];
        float v95 = v94;
        if ([(ICDocCamViewController *)self useDocumentSegmentation])
        {
          [(ICDocCamViewController *)self segmentStabilityStdDev];
          float v95 = v96;
        }
        if (v90 > v95 || v93 > v95)
        {
          [(ICDocCamViewController *)self setSegmentMeanComputed:0];
          BOOL v18 = 0;
          goto LABEL_12;
        }
      }
    }
    BOOL v18 = 1;
    goto LABEL_12;
  }
LABEL_11:
  BOOL v18 = 0;
LABEL_12:

  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v157, 8);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(v171, 8);
  _Block_object_dispose(&v172, 8);
  _Block_object_dispose(v180, 8);
  _Block_object_dispose(v182, 8);

  return v18;
}

uint64_t __41__ICDocCamViewController_shouldAutoShoot__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  char v4 = [v3 objectForKey:@"Rectangles"];
  id v5 = v4;
  if (!v4 || ![v4 count])
  {
    uint64_t v10 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    id v7 = [v3 valueForKey:@"RecognitionTime"];
    [*(id *)(a1 + 32) timeIntervalSinceDate:v7];
    *(float *)&double v8 = v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = LODWORD(v8);
    float v9 = *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

    if (v9 > 2.0)
    {
      uint64_t v10 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 1;
  }
  double v11 = [v3 valueForKey:@"RegistrationAlignmentVector"];
  if (!v11) {
    goto LABEL_21;
  }
  uint64_t v12 = [MEMORY[0x263EFF9D0] null];

  if (v11 == v12) {
    goto LABEL_21;
  }
  [v11 CGVectorValue];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  double v16 = *(double *)(v15 + 48);
  double v17 = -v13;
  if (v13 >= 0.0) {
    double v17 = v13;
  }
  if (v16 < v17) {
    double v16 = v17;
  }
  *(double *)(v15 + 48) = v16;
  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  double v19 = *(double *)(v18 + 56);
  double v20 = -v14;
  if (v14 >= 0.0) {
    double v20 = v14;
  }
  if (v19 < v20) {
    double v19 = v20;
  }
  *(double *)(v18 + 56) = v19;
  *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 48) = v13
                                                              + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                          + 48);
  *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 56) = v14
                                                              + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                          + 56);
  uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
  double v22 = *(float *)(a1 + 104);
  if (*(double *)(v21 + 48) <= v22 && *(double *)(v21 + 56) <= v22)
  {
LABEL_21:
    id v23 = [v5 objectAtIndexedSubscript:0];
    int v24 = objc_alloc_init(ICDocCamImageQuad);
    [v23 topLeft];
    -[ICDocCamImageQuad setTopLeft:](v24, "setTopLeft:");
    [v23 topRight];
    -[ICDocCamImageQuad setTopRight:](v24, "setTopRight:");
    [v23 bottomLeft];
    -[ICDocCamImageQuad setBottomLeft:](v24, "setBottomLeft:");
    [v23 bottomRight];
    -[ICDocCamImageQuad setBottomRight:](v24, "setBottomRight:");
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObject:v24];
    uint64_t v25 = NSNumber;
    uint64_t v26 = [v5 objectAtIndexedSubscript:0];
    [v26 confidence];
    float v27 = objc_msgSend(v25, "numberWithFloat:");

    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) addObject:v27];
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

LABEL_23:
  return v10;
}

- (id)cropAndFilterImage:(id)a3 rects:(id)a4 filterType:(signed __int16)a5 constantColor:(BOOL)a6
{
  unsigned int v41 = a5;
  BOOL v42 = a6;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  double v11 = (CGImage *)[v10 CGImage];
  size_t Width = CGImageGetWidth(v11);
  size_t Height = CGImageGetHeight(v11);
  double v14 = (void *)MEMORY[0x21D44F7D0]();
  if (v9 && [v9 count])
  {
    uint64_t v15 = [v9 objectAtIndexedSubscript:0];
    if (v15)
    {
      double v16 = v15;
      id v40 = v15;
      [v15 topLeft];
      double v18 = v17;
      double v20 = v19;
      [v16 topRight];
      double v22 = v21;
      double v24 = v23;
      [v16 bottomLeft];
      double v26 = v25;
      double v28 = v27;
      [v16 bottomRight];
      float v31 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v28, v29, v30, v18, v20, v22, v24);
      id v32 = -[ICDocCamImageQuad imageQuadByScalingBy:](v31, "imageQuadByScalingBy:", (double)Width, (double)Height);
      [v32 topLeft];
      [v32 topRight];
      [v32 bottomLeft];
      [v32 bottomRight];
      double v39 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCGImage:v11];
      uint64_t v33 = [(ICDocCamViewController *)self sharedCoreImageContext];
      double v34 = +[ICDocCamImageFilters perspectiveCorrectedCIImageFromCIImage:v39 imageQuad:v32];
      [v34 extent];
      uint64_t v35 = (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v34);
      if (v35)
      {
        id v36 = [MEMORY[0x263F1C6B0] imageWithCGImage:v35];
        CGImageRelease(v35);
      }
      else
      {
        id v36 = 0;
      }

      uint64_t v15 = v40;
    }
    else
    {
      id v36 = 0;
      float v31 = 0;
    }
  }
  else
  {
    id v36 = 0;
    float v31 = 0;
  }
  if (!v36) {
    id v36 = v10;
  }
  double v37 = +[ICDocCamImageFilters filteredImage:v36 orientation:0 imageFilterType:v41 constantColor:v42];

  return v37;
}

- (void)saveCapturedImage:(id)a3 metaData:(id)a4 rects:(id)a5 constantColor:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v135 = a6;
  id v136 = a3;
  id v138 = a4;
  id v11 = a5;
  long long v137 = (void (**)(double))a7;
  uint64_t v12 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:].cold.4();
  }

  if ([(ICDocCamViewController *)self isInRetakeMode]) {
    goto LABEL_5;
  }
  double v13 = [(ICDocCamViewController *)self delegate];
  double v14 = [(ICDocCamViewController *)self documentInfoCollection];
  uint64_t v15 = [v14 docInfos];
  char v16 = objc_msgSend(v13, "documentCameraController:canAddImages:", self, objc_msgSend(v15, "count") + 1);

  if (v16)
  {
LABEL_5:
    uint64_t v17 = objc_opt_class();
    double v18 = DCDynamicCast(v17, (uint64_t)v136);
    if (v18)
    {
      [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
      double v19 = [(ICDocCamViewController *)self saveButton];
      double v20 = [(ICDocCamViewController *)self documentInfoCollection];
      double v21 = [v20 docInfos];
      objc_msgSend(v19, "setDocumentCount:", objc_msgSend(v21, "count") + 1);

      [MEMORY[0x263F1CB60] setAnimationsEnabled:1];
      [(ICDocCamViewController *)self updateThumbnailContainerViewConstraintConstantForIPad];
      double v22 = [(ICDocCamViewController *)self documentInfoCollection];
      double v23 = [v22 docInfos];
      uint64_t v24 = [v23 count];

      if (!v24)
      {
        double v25 = [(ICDocCamViewController *)self saveButton];
        [v25 setHidden:0];

        double v26 = [(ICDocCamViewController *)self saveButton];
        [v26 setEnabled:0];

        double v27 = [(ICDocCamViewController *)self saveButton];
        [v27 setAlpha:0.0];

        v164[0] = MEMORY[0x263EF8330];
        v164[1] = 3221225472;
        v164[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke;
        v164[3] = &unk_2642AA080;
        v164[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v164 animations:0.15];
      }
      if ([(ICDocCamViewController *)self isInRetakeMode])
      {
        int64_t v28 = [(ICDocCamViewController *)self statusBarOrientation];
        double v29 = [(ICDocCamViewController *)self view];
        double v30 = [v29 window];
        +[ICDocCamExtractedDocumentViewController targetRectForOrientation:v28 window:v30];
        double v32 = v31;
        double v34 = v33;
      }
      else
      {
        [(ICDocCamViewController *)self targetViewRect];
        double v32 = v36;
        double v34 = v37;
      }
      if (v11)
      {
        if (![v11 count]) {
          goto LABEL_27;
        }
        double v38 = [v11 objectAtIndexedSubscript:0];
        if (!v38) {
          goto LABEL_27;
        }
        [v18 size];
        double v133 = v39;
        [v18 size];
        double v131 = v40;
        [v38 topLeft];
        double v127 = v42;
        double v129 = v41;
        [v38 topRight];
        double v44 = v43;
        double v46 = v45;
        [v38 bottomLeft];
        double v48 = v47;
        double v50 = v49;
        [v38 bottomRight];
        double v53 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v48, v50, v51, v52, v129, v127, v44, v46);
        id v54 = -[ICDocCamImageQuad imageQuadByScalingBy:](v53, "imageQuadByScalingBy:", (double)(unint64_t)v133, (double)(unint64_t)v131);
        [v54 bounds];
        if (v55 / v56 < v32 / v34) {
          double v57 = v34 / v56;
        }
        else {
          double v57 = v32 / v55;
        }
        if (MGGetProductType() != 1737882206)
        {
          double v58 = [MEMORY[0x263F1C920] mainScreen];
          [v58 scale];
          double v57 = v57 * v59;
        }
        uint64_t v60 = +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v18, 3, v57 * (double)(unint64_t)v133, v57 * (double)(unint64_t)v131);

        long long v132 = v60;
        if (!v60) {
LABEL_27:
        }
          long long v132 = v18;
        if ([v11 count])
        {
          double v61 = [v11 objectAtIndexedSubscript:0];
          double v62 = v61;
          if (v61)
          {
            [v61 topLeft];
            double v64 = v63;
            double v66 = v65;
            [v62 topRight];
            double v68 = v67;
            double v70 = v69;
            [v62 bottomLeft];
            double v72 = v71;
            double v74 = v73;
            [v62 bottomRight];
            double v76 = v75;
            double v78 = v77;
          }
          else
          {
            double v72 = 0.0;
            double v78 = 1.0;
            double v76 = 1.0;
            double v74 = 1.0;
            double v70 = 0.0;
            double v68 = 1.0;
            double v66 = 0.0;
            double v64 = 0.0;
          }

          goto LABEL_35;
        }
      }
      else
      {
        long long v132 = v18;
      }
      double v72 = 0.0;
      double v78 = 1.0;
      double v76 = 1.0;
      double v74 = 1.0;
      double v70 = 0.0;
      double v68 = 1.0;
      double v66 = 0.0;
      double v64 = 0.0;
LABEL_35:
      long long v134 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v72, v74, v76, v78, v64, v66, v68, v70);
      signed __int16 v130 = [(ICDocCamViewController *)self defaultFilter];
      v162[0] = 0;
      v162[1] = v162;
      v162[2] = 0x3032000000;
      v162[3] = __Block_byref_object_copy__774;
      v162[4] = __Block_byref_object_dispose__775;
      id v163 = 0;
      if ([(ICDocCamViewController *)self isInRetakeMode])
      {
        long long v128 = 0;
      }
      else
      {
        objc_initWeak(&location, self);
        double v79 = [(ICDocCamViewController *)self saveButton];
        [v79 setEnabled:0];

        double v80 = (void *)MEMORY[0x263F1CB60];
        v159[0] = MEMORY[0x263EF8330];
        v159[1] = 3221225472;
        v159[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2;
        v159[3] = &unk_2642AA210;
        objc_copyWeak(&v160, &location);
        [v80 animateWithDuration:v159 animations:0.15];
        double v81 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        double v82 = dispatch_queue_create("com.apple.documentcamera.cropped-and-filtered-image", v81);

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3;
        block[3] = &unk_2642AA238;
        uint64_t v155 = v162;
        objc_copyWeak(&v156, &location);
        uint64_t v153 = v18;
        id v154 = v11;
        signed __int16 v157 = v130;
        BOOL v158 = v135;
        long long v128 = v82;
        dispatch_async(v82, block);

        objc_destroyWeak(&v156);
        objc_destroyWeak(&v160);
        objc_destroyWeak(&location);
      }
      double v83 = [(ICDocCamViewController *)self cropAndFilterImage:v132 rects:v11 filterType:[(ICDocCamViewController *)self defaultFilter] constantColor:v135];
      double v84 = [(ICDocCamViewController *)self snapshotSpinnerQueue];
      v151[0] = MEMORY[0x263EF8330];
      v151[1] = 3221225472;
      v151[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4;
      v151[3] = &unk_2642AA080;
      v151[4] = self;
      dispatch_sync(v84, v151);

      double v85 = [ICDocCamDocumentInfo alloc];
      double v86 = [(ICDocCamViewController *)self delegate];
      double v87 = [(ICDocCamDocumentInfo *)v85 initWithDelegate:v86];

      [(ICDocCamDocumentInfo *)v87 setCurrentFilter:[(ICDocCamViewController *)self defaultFilter]];
      [(ICDocCamDocumentInfo *)v87 setMetaData:v138];
      [(ICDocCamDocumentInfo *)v87 setImageQuad:v134];
      double v88 = [(ICDocCamViewController *)self imageCache];
      double v89 = [v88 setImage:v83 metaData:v138 addToMemoryCache:1 completion:0];
      [(ICDocCamDocumentInfo *)v87 setMeshAnimImageUUID:v89];

      [(ICDocCamDocumentInfo *)v87 setCroppedAndFilteredImageUUID:0];
      [(ICDocCamDocumentInfo *)v87 setCroppedButNotFilteredImageUUID:0];
      double v90 = [(ICDocCamViewController *)self imageCache];
      double v91 = [v90 setImage:v18 metaData:v138];
      [(ICDocCamDocumentInfo *)v87 setFullImageUUID:v91];

      [(ICDocCamDocumentInfo *)v87 setConstantColor:v135];
      double v92 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
        -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:]();
      }

      double v93 = [(ICDocCamViewController *)self overlayView];
      [v93 setHidden:1];

      int64_t v94 = [(ICDocCamViewController *)self retakeIndex];
      if ([(ICDocCamViewController *)self isInRetakeMode])
      {
        [(ICDocCamViewController *)self stopImageCaptureSession];
        int64_t v95 = [(ICDocCamViewController *)self statusBarOrientation];
        float v96 = [(ICDocCamViewController *)self view];
        double v97 = [v96 window];
        +[ICDocCamExtractedDocumentViewController targetRectForOrientation:v95 window:v97];
        double v99 = v98;
        double v101 = v100;
        double v103 = v102;
        double v105 = v104;
      }
      else
      {
        [(ICDocCamViewController *)self targetViewRect];
        double v99 = v106;
        double v101 = v107;
        double v103 = v108;
        double v105 = v109;
      }
      double v110 = [(ICDocCamViewController *)self videoPreviewLayer];
      objc_msgSend(v110, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
      double v112 = v111;
      double v114 = v113;
      double v116 = v115;
      double v118 = v117;

      double v119 = [(ICDocCamViewController *)self previewView];
      double v120 = [(ICDocCamViewController *)self scrimView];
      double v121 = -[ICDocCamViewController imageMeshTransformWithImage:backgroundImage:imageViewFrame:imageQuad:previewView:previewBounds:scrimView:](self, "imageMeshTransformWithImage:backgroundImage:imageViewFrame:imageQuad:previewView:previewBounds:scrimView:", v83, v18, v134, v119, v120, v99, v101, v103, v105, v112, v114, v116, v118);

      v139[0] = MEMORY[0x263EF8330];
      v139[1] = v126;
      v139[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_790;
      v139[3] = &unk_2642AA328;
      v139[4] = self;
      double v122 = v18;
      v140 = v122;
      id v141 = v11;
      signed __int16 v149 = v130;
      BOOL v150 = v135;
      double v123 = v87;
      v142 = v123;
      int64_t v148 = v94;
      id v143 = v138;
      id v144 = v121;
      v146 = v137;
      double v124 = v128;
      v145 = v124;
      v147 = v162;
      id v125 = v121;
      [v125 startWithCompletionBlock:v139];

      _Block_object_dispose(v162, 8);
      double v18 = v122;
      goto LABEL_44;
    }
    [(ICDocCamViewController *)self restartImageCaptureSessionIfNecessary];
    if (v137) {
      v137[2](0.5);
    }
    uint64_t v35 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:]();
    }
  }
  else
  {
    [(ICDocCamViewController *)self warnAboutMaxScansIfNecessary];
    double v18 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICDocCamViewController saveCapturedImage:metaData:rects:constantColor:completionHandler:]();
    }
  }
LABEL_44:
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) saveButton];
  [v1 setAlpha:0.25];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained saveButton];
  [v1 setAlpha:0.25];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [WeakRetained cropAndFilterImage:*(void *)(a1 + 32) rects:*(void *)(a1 + 40) filterType:*(__int16 *)(a1 + 64) constantColor:*(unsigned __int8 *)(a1 + 66)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAwaitingSnapshotCompletion:0];
  id v2 = [*(id *)(a1 + 32) snapshotSpinner];
  [v2 hide];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_790(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInRetakeMode])
  {
    id v2 = [*(id *)(a1 + 32) cropAndFilterImage:*(void *)(a1 + 40) rects:*(void *)(a1 + 48) filterType:*(__int16 *)(a1 + 112) constantColor:*(unsigned __int8 *)(a1 + 114)];
    uint64_t v3 = [*(id *)(a1 + 32) imageCache];
    char v4 = [v3 setImage:v2 metaData:*(void *)(a1 + 64)];
    [*(id *)(a1 + 56) setCroppedAndFilteredImageUUID:v4];

    uint64_t v5 = *(void *)(a1 + 104);
    int v6 = [*(id *)(a1 + 32) isInRetakeMode];
    id v7 = *(void **)(a1 + 32);
    if (v6)
    {
      [v7 disableRetakeMode];
      uint64_t v8 = *(void *)(a1 + 56);
      id v9 = [*(id *)(a1 + 32) documentInfoCollection];
      id v10 = [v9 docInfos];
      [v10 setObject:v8 atIndexedSubscript:*(void *)(a1 + 104)];
    }
    else
    {
      double v20 = [v7 documentInfoCollection];
      double v21 = [v20 docInfos];
      uint64_t v5 = [v21 count];

      double v22 = [*(id *)(a1 + 32) documentInfoCollection];
      double v23 = [v22 docInfos];
      [v23 addObject:*(void *)(a1 + 56)];

      id v9 = [*(id *)(a1 + 32) saveButton];
      [v9 setHidden:0];
    }

    id v11 = [*(id *)(a1 + 32) documentInfoCollection];
    [v11 bumpModificationDate];

    uint64_t v24 = [ICDocCamExtractedDocumentViewController alloc];
    double v25 = *(void **)(a1 + 32);
    double v26 = [v25 documentInfoCollection];
    double v27 = [*(id *)(a1 + 32) imageCache];
    int64_t v28 = [(ICDocCamExtractedDocumentViewController *)v24 initWithDelegate:v25 documentInfoCollection:v26 imageCache:v27 currentIndex:v5 mode:0];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_791;
    v45[3] = &unk_2642AA288;
    objc_copyWeak(&v49, &location);
    double v46 = v28;
    id v47 = *(id *)(a1 + 72);
    id v48 = *(id *)(a1 + 88);
    double v29 = v28;
    dispatch_async(MEMORY[0x263EF83A0], v45);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v12 = +[DCSettings sharedSettings];
    int v13 = [v12 finishAfterFirstScan];

    if (v13)
    {
      [*(id *)(a1 + 32) addNewDocument:*(void *)(a1 + 56)];
      double v14 = *(NSObject **)(a1 + 80);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4_793;
      block[3] = &unk_2642AA2D8;
      uint64_t v15 = &v41;
      id v41 = *(id *)(a1 + 56);
      objc_copyWeak(&v44, &location);
      uint64_t v43 = *(void *)(a1 + 96);
      id v42 = *(id *)(a1 + 64);
      dispatch_async(v14, block);

      objc_destroyWeak(&v44);
    }
    else
    {
      char v16 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_790_cold_1(a1, v16);
      }

      uint64_t v17 = [*(id *)(a1 + 32) thumbnailViewController];
      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      double v33 = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_795;
      double v34 = &unk_2642AA300;
      id v35 = *(id *)(a1 + 80);
      id v36 = *(id *)(a1 + 56);
      objc_copyWeak(&v39, &location);
      uint64_t v38 = *(void *)(a1 + 96);
      id v37 = *(id *)(a1 + 64);
      [v17 addNewDocument:v18 completionBlock:&v31];

      objc_msgSend(*(id *)(a1 + 72), "hide", v31, v32, v33, v34, v35);
      uint64_t v15 = &v35;

      objc_destroyWeak(&v39);
    }

    [*(id *)(a1 + 32) clearRectangles];
    double v19 = [*(id *)(a1 + 32) overlayView];
    [v19 setHidden:0];

    (*(void (**)(double))(*(void *)(a1 + 88) + 16))(0.5);
    [*(id *)(a1 + 32) speakScannedDocumentForAccessibilityIfNecessary];
    objc_destroyWeak(&location);
  }
  double v30 = [*(id *)(a1 + 32) imageCache];
  [v30 clearInMemoryCache];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_791(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 56);
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  v12[0] = v3;
  v12[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_792;
  v8[3] = &unk_2642AA260;
  objc_copyWeak(&v11, v2);
  uint64_t v6 = *MEMORY[0x263F15FD8];
  uint64_t v7 = *MEMORY[0x263F15FF8];
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v3 setViewControllers:v5 type:v6 subtype:v7 duration:v8 completion:0.25];

  objc_destroyWeak(&v11);
}

uint64_t __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_792(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained clearRectangles];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 overlayView];
  [v5 setHidden:0];

  [*(id *)(a1 + 32) hide];
  uint64_t v6 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  v7.n128_u64[0] = 0.5;

  return v6(v7);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_4_793(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5_794;
  block[3] = &unk_2642AA2D8;
  id v5 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_5_794(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained imageCache];
  id v5 = [v4 setImage:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) metaData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCroppedAndFilteredImageUUID:v5];

  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 saveButton];
  [v7 setEnabled:1];

  id v8 = objc_loadWeakRetained(v2);
  id v9 = [v8 saveButton];
  [v9 setHidden:0];

  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v10 scrimView];
  [v11 setHidden:1];

  id v12 = objc_loadWeakRetained(v2);
  int v13 = [v12 saveButton];
  [v13 setAlpha:1.0];

  double v14 = [MEMORY[0x263F1C550] blackColor];
  id v15 = objc_loadWeakRetained(v2);
  char v16 = [v15 view];
  uint64_t v17 = [v16 superview];
  [v17 setBackgroundColor:v14];

  uint64_t v18 = (void *)MEMORY[0x263F1CB60];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_6;
  v21[3] = &unk_2642AA210;
  objc_copyWeak(&v22, v2);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_7;
  v19[3] = &unk_2642AA2B0;
  objc_copyWeak(&v20, v2);
  [v18 animateWithDuration:v21 animations:v19 completion:0.4];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained view];
  [v1 setAlpha:0.0];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained saveAction:0];
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_795(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_796;
  block[3] = &unk_2642AA2D8;
  id v2 = *(NSObject **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 64));
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  dispatch_async(v2, block);

  objc_destroyWeak(&v8);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_2_796(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_797;
  block[3] = &unk_2642AA2D8;
  id v5 = *(id *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_797(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v4 = [WeakRetained imageCache];
  id v5 = [v4 setImage:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) metaData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCroppedAndFilteredImageUUID:v5];

  long long v6 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 croppedAndFilteredImageUUID];
    __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_797_cold_1((uint64_t)v7, v8, buf, v6);
  }

  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 saveButton];
  [v10 setEnabled:1];

  id v11 = objc_loadWeakRetained(v2);
  id v12 = [v11 saveButton];
  [v12 setHidden:0];

  id v13 = objc_loadWeakRetained(v2);
  double v14 = [v13 scrimView];
  [v14 setHidden:1];

  id v15 = (void *)MEMORY[0x263F1CB60];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_798;
  v16[3] = &unk_2642AA210;
  objc_copyWeak(&v17, v2);
  [v15 animateWithDuration:v16 animations:0.15];
  objc_destroyWeak(&v17);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_798(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained saveButton];
  [v1 setAlpha:1.0];
}

- (id)detectRectanglesRequest
{
  if ([(ICDocCamViewController *)self useDocumentSegmentation])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1EE78]);
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1EEB0]);
    [(ICDocCamViewController *)self rectangleMinimumAspectRatio];
    objc_msgSend(v3, "setMinimumAspectRatio:");
    [(ICDocCamViewController *)self rectangleMaximumAspectRatio];
    objc_msgSend(v3, "setMaximumAspectRatio:");
    objc_msgSend(v3, "setMaximumObservations:", -[ICDocCamViewController rectangleMaximumNumber](self, "rectangleMaximumNumber"));
    [(ICDocCamViewController *)self rectangleMinimumConfidence];
    objc_msgSend(v3, "setMinimumConfidence:");
    [(ICDocCamViewController *)self rectangleQuadratureTolerance];
    objc_msgSend(v3, "setQuadratureTolerance:");
    [v3 setRequiredVersion:2];
  }

  return v3;
}

- (unsigned)imageOrientationFromDevice
{
  id v3 = [(ICDocCamViewController *)self videoDeviceInput];
  long long v4 = [v3 device];
  uint64_t v5 = [v4 position];

  long long v6 = [(ICDocCamViewController *)self accelerometer];
  uint64_t v7 = [v6 currentDeviceOrientation];

  if ((unint64_t)(v7 - 5) <= 1) {
    uint64_t v7 = [(ICDocCamViewController *)self statusBarOrientation];
  }
  switch(v7)
  {
    case 1:
      BOOL v8 = v5 == 2;
      unsigned int v9 = 6;
      goto LABEL_10;
    case 2:
      if (v5 == 2) {
        return 5;
      }
      else {
        return 8;
      }
    case 3:
      BOOL v8 = v5 == 2;
      unsigned int v9 = 1;
      goto LABEL_10;
    case 4:
      BOOL v8 = v5 == 2;
      unsigned int v9 = 3;
LABEL_10:
      if (v8) {
        unsigned int result = v9 + 1;
      }
      else {
        unsigned int result = v9;
      }
      break;
    default:
      unsigned int result = 1;
      break;
  }
  return result;
}

- (void)detectRectanglesAndSaveCapturedImage:(__CVBuffer *)a3 metadata:(id)a4 constantColor:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  v201[2] = *MEMORY[0x263EF8340];
  id v179 = a4;
  id v182 = a6;
  uint64_t v10 = [(ICDocCamViewController *)self imageOrientationFromDevice];
  id v11 = [(ICDocCamViewController *)self videoPreviewLayer];
  id v12 = [v11 connection];
  uint64_t v13 = [v12 videoOrientation];

  double v14 = [(ICDocCamViewController *)self accelerometer];
  uint64_t v15 = [v14 currentDeviceOrientation];

  if ((unint64_t)(v15 - 1) >= 4) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = v15;
  }
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v196.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v196.c = v17;
  *(_OWORD *)&v196.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (v16 == 1)
  {
    CGAffineTransformMakeRotation(&v196, -1.57079633);
  }
  else
  {
    if (v16 == 2)
    {
      CGFloat v18 = 1.57079633;
    }
    else if (v16 == 4)
    {
      CGFloat v18 = -3.14159265;
    }
    else
    {
      CGFloat v18 = 0.0;
    }
    CGAffineTransformMakeRotation(&v195, v18);
    CGAffineTransform v196 = v195;
  }
  uint64_t v19 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a3];
  BOOL v177 = v7;
  CGAffineTransform v194 = v196;
  char v183 = [v19 imageByApplyingTransform:&v194];

  [v183 extent];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v176 = [(ICDocCamViewController *)self sharedCoreImageContext];
  int64_t v28 = (CGImage *)objc_msgSend(v176, "createCGImage:fromRect:", v183, v21, v23, v25, v27);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t v31 = Height;
  if (Width <= Height) {
    unint64_t v32 = Height;
  }
  else {
    unint64_t v32 = Width;
  }
  [(ICDocCamViewController *)self streamingImageSize];
  double v34 = v33;
  [(ICDocCamViewController *)self streamingImageSize];
  if (v34 < v35) {
    double v34 = v35;
  }
  id v36 = [(ICDocCamViewController *)self cameraIntrinsicData];
  BOOL v37 = v36 == 0;

  *(float *)&uint64_t v38 = (float)v32 / (float)(unint64_t)v34;
  uint64_t v180 = v38;
  if (v37)
  {
    memset(&v195, 0, sizeof(v195));
    double v46 = objc_opt_class();
    [(ICDocCamViewController *)self pixelFocalLength];
    *(float *)&double v47 = (float)v31;
    HIDWORD(v48) = HIDWORD(v180);
    *(float *)&double v48 = *(float *)&v180 * v49;
    *(float *)&double v50 = (float)Width;
    [v46 cameraIntrinsicMatrixForWidth:v50 height:v47 pixelFocalLength:v48];
    LODWORD(v195.b) = v51;
    LODWORD(v195.d) = v52;
    v195.a = v53;
    v195.c = v54;
    LODWORD(v195.ty) = v55;
    v195.tdouble x = v56;
    CFDataRef v57 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&v195, 48);
    uint64_t v58 = *MEMORY[0x263F1F258];
    v199[0] = v57;
    uint64_t v59 = *MEMORY[0x263F1F250];
    v198[0] = v58;
    v198[1] = v59;
    uint64_t v60 = [(ICDocCamViewController *)self sharedCoreImageContext];
    v199[1] = v60;
    int v181 = [NSDictionary dictionaryWithObjects:v199 forKeys:v198 count:2];
  }
  else
  {
    id v39 = [(ICDocCamViewController *)self cameraIntrinsicData];
    [v39 getBytes:&v195 length:48];

    *(_OWORD *)bytes = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    float32x4_t v40 = vmulq_n_f32(*(float32x4_t *)&v195.a, *(float *)&v180);
    float32x4_t v41 = vmulq_n_f32(*(float32x4_t *)&v195.c, *(float *)&v180);
    *(_DWORD *)&bytes[8] = v40.i32[2];
    DWORD2(v192) = v41.i32[2];
    *(void *)bytes = v40.i64[0];
    *(void *)&long long v192 = v41.i64[0];
    DWORD2(v193) = 1065353216;
    *(void *)&long long v193 = vmulq_n_f32(*(float32x4_t *)&v195.tx, *(float *)&v180).u64[0];
    CFDataRef v42 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 48);
    uint64_t v43 = *MEMORY[0x263F1F258];
    v201[0] = v42;
    uint64_t v44 = *MEMORY[0x263F1F250];
    v200[0] = v43;
    v200[1] = v44;
    double v45 = [(ICDocCamViewController *)self sharedCoreImageContext];
    v201[1] = v45;
    int v181 = [NSDictionary dictionaryWithObjects:v201 forKeys:v200 count:2];
  }
  uint64_t v178 = (void *)[objc_alloc(MEMORY[0x263F1EF40]) initWithCVPixelBuffer:a3 orientation:v10 options:v181];
  double v61 = [(ICDocCamViewController *)self detectRectanglesRequest];
  id v197 = v61;
  double v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v197 count:1];
  id v190 = 0;
  int v63 = [v178 performRequests:v62 error:&v190];
  id v175 = v190;

  double v64 = [MEMORY[0x263F1C6B0] imageWithCGImage:v28];
  double v65 = [v61 results];
  if ((unint64_t)([(ICDocCamViewController *)self statusBarOrientation] - 3) > 1)
  {
    [v64 size];
    double v68 = v69;
    [v64 size];
    double v66 = v70;
  }
  else
  {
    [v64 size];
    double v68 = v67;
  }
  if (-[ICDocCamViewController validRect:forImageSize:](self, "validRect:forImageSize:", v65, v68, v66))
  {
    if (![(ICDocCamViewController *)self useDocumentSegmentation]
      || ([v65 objectAtIndexedSubscript:0],
          double v71 = objc_claimAutoreleasedReturnValue(),
          [v71 confidence],
          float v73 = v72,
          v71,
          [(ICDocCamViewController *)self segmentMinimumVisualConfidenceFinalScan], id v75 = 0, v73 < 0.99999)&& v73 > v74)
    {
      id v75 = v65;
    }
  }
  else
  {
    id v75 = 0;
  }
  double v76 = [(ICDocCamViewController *)self lastHighConfidenceRectangle];
  if (v76)
  {
    double v77 = [(ICDocCamViewController *)self overlayView];
    if (([v77 rectangleIsActive] & 1) == 0)
    {

LABEL_37:
      goto LABEL_38;
    }
    double v78 = [v75 firstObject];
    BOOL v79 = v78 == 0;

    if (!v79)
    {
      double v80 = [(ICDocCamViewController *)self lastHighConfidenceRectangle];
      [v80 boundingBox];
      CGFloat v82 = v81;
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      CGFloat v88 = v87;

      double v89 = [v75 firstObject];
      [v89 boundingBox];
      CGFloat v91 = v90;
      CGFloat v93 = v92;
      CGFloat v95 = v94;
      CGFloat v97 = v96;

      v202.origin.double x = v82;
      v202.origin.double y = v84;
      v202.size.double width = v86;
      v202.size.double height = v88;
      v203.origin.double x = v91;
      v203.origin.double y = v93;
      v203.size.double width = v95;
      v203.size.double height = v97;
      if (!CGRectIntersectsRect(v202, v203))
      {

        double v76 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v195.a) = 0;
          _os_log_impl(&dword_217885000, v76, OS_LOG_TYPE_DEFAULT, "The detected rectangle doesn't intersect with the last visible rectangle", (uint8_t *)&v195, 2u);
        }
        id v75 = 0;
        goto LABEL_37;
      }
    }
  }
LABEL_38:
  if (v63
    && [(ICDocCamViewController *)self autoMode]
    && [(ICDocCamViewController *)self snapStillImageMode] == 1
    && ([v75 firstObject],
        double v98 = objc_claimAutoreleasedReturnValue(),
        BOOL v99 = v98 == 0,
        v98,
        !v99))
  {
    if ([(ICDocCamViewController *)self useDocumentSegmentation])
    {
      double v100 = [v75 objectAtIndexedSubscript:0];
      [v100 topLeft];
      double v173 = v101;
      double v174 = v102;
      [v100 topRight];
      double v171 = v103;
      double v172 = v104;
      [v100 bottomLeft];
      double v170 = v105;
      double v107 = v106;
      [v100 bottomRight];
      float v110 = v171;
      double v167 = v108;
      double v168 = v107;
      float v111 = v108;
      if (v110 >= v111) {
        float v112 = v171;
      }
      else {
        float v112 = v108;
      }
      float v113 = v173;
      float v114 = v170;
      if (v114 < v113) {
        float v113 = v170;
      }
      float v165 = v113;
      float v166 = v112;
      float v115 = v174;
      float v116 = v172;
      if (v115 >= v116) {
        float v117 = v174;
      }
      else {
        float v117 = v172;
      }
      float v118 = v107;
      double v169 = v109;
      float v119 = v109;
      if (v119 < v118) {
        float v118 = v119;
      }
      float v163 = v118;
      float v164 = v117;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v121 = v120;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v123 = v122;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v125 = v124;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v127 = v126;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v129 = v128;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v131 = v130;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v133 = v132;
      [(ICDocCamViewController *)self segmentationFudgeFactor];
      float v135 = v134;
      id v136 = [ICDocCamImageQuad alloc];
      float v137 = v173 - (float)((float)(v166 - v165) * v121);
      double v138 = fmaxf(v137, 0.0001);
      float v139 = v174 + (float)((float)(v164 - v163) * v123);
      double v140 = fminf(v139, 0.9999);
      float v141 = v171 + (float)((float)(v166 - v165) * v125);
      double v142 = fminf(v141, 0.9999);
      float v143 = v172 + (float)((float)(v164 - v163) * v127);
      double v144 = fminf(v143, 0.9999);
      float v145 = v170 - (float)((float)(v166 - v165) * v129);
      float v146 = v168 - (float)((float)(v164 - v163) * v131);
      float v147 = v167 + (float)((float)(v166 - v165) * v133);
      float v148 = v169 - (float)((float)(v164 - v163) * v135);
      signed __int16 v149 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v136, "initWithBottomLeft:bottomRight:topLeft:topRight:", fmaxf(v145, 0.0001), fmaxf(v146, 0.0001), fminf(v147, 0.9999), fmaxf(v148, 0.0001), v138, v140, v142, v144);
      BOOL v150 = [MEMORY[0x263EFF980] array];
      [v150 addObject:v149];
      [(ICDocCamViewController *)self saveCapturedImage:v64 metaData:v179 rects:v150 constantColor:v177 completionHandler:v182];
    }
    else
    {
      [(ICDocCamViewController *)self saveCapturedImage:v64 metaData:v179 rects:v75 constantColor:v177 completionHandler:v182];
    }
  }
  else
  {
    uint64_t v151 = [(ICDocCamViewController *)self snapshotSpinnerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke;
    block[3] = &unk_2642AA080;
    void block[4] = self;
    dispatch_sync(v151, block);

    v152 = [v75 firstObject];
    uint64_t v153 = +[ICDocCamImageQuad quadFromVNRectangle:v152];

    if (!v153)
    {
      id v154 = [(ICDocCamViewController *)self backupQuad];
      BOOL v155 = v154 == 0;

      if (v155)
      {
        uint64_t v153 = 0;
      }
      else
      {
        uint64_t v156 = [(ICDocCamViewController *)self backupQuad];
        signed __int16 v157 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v195.a) = 0;
          _os_log_impl(&dword_217885000, v157, OS_LOG_TYPE_DEFAULT, "No Quad found in image, falling back to visible quad at shutter press", (uint8_t *)&v195, 2u);
        }

        uint64_t v153 = (void *)v156;
      }
    }
    BOOL v158 = [(ICDocCamViewController *)self userPromptView];
    [v158 setHidden:1];

    v184[0] = MEMORY[0x263EF8330];
    v184[1] = 3221225472;
    v184[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_802;
    v184[3] = &unk_2642AA378;
    v184[4] = self;
    id v185 = v75;
    BOOL v188 = v177;
    id v186 = v179;
    id v187 = v182;
    uint64_t v159 = (void *)MEMORY[0x21D44FA30](v184);
    id v160 = [[ICDocCamImageQuadEditViewController alloc] initWithImage:v64 quad:v153 scanDataDelegate:0 orientation:0 completionHandler:v159];
    [(ICDocCamImageQuadEditViewController *)v160 setInCaptureMode:1];
    [(ICDocCamViewController *)self setUseCustomRecropTransition:0];
    v161 = [(ICDocCamViewController *)self navigationController];
    [v161 setDelegate:0];

    id v162 = [(ICDocCamImageQuadEditViewController *)v160 navigationController];
    [v162 setDelegate:0];

    [(ICDocCamViewController *)self pushViewController:v160 type:*MEMORY[0x263F15FD8] subtype:*MEMORY[0x263F15FF8] duration:0 completion:0.5];
  }
  CGImageRelease(v28);
  [(ICDocCamViewController *)self setBackupQuad:0];
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAwaitingSnapshotCompletion:0];
  id v2 = [*(id *)(a1 + 32) snapshotSpinner];
  [v2 hide];
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_802(uint64_t a1, char a2, void *a3, void *a4, int a5)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a5)
  {
    id v11 = objc_msgSend(*(id *)(a1 + 32), "cropAndFilterImage:rects:filterType:constantColor:", v9, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "defaultFilter"), *(unsigned __int8 *)(a1 + 64));
    id v12 = [ICDocCamDocumentInfo alloc];
    uint64_t v13 = [*(id *)(a1 + 32) delegate];
    double v14 = [(ICDocCamDocumentInfo *)v12 initWithDelegate:v13];

    -[ICDocCamDocumentInfo setCurrentFilter:](v14, "setCurrentFilter:", [*(id *)(a1 + 32) defaultFilter]);
    [(ICDocCamDocumentInfo *)v14 setMetaData:*(void *)(a1 + 48)];
    [(ICDocCamDocumentInfo *)v14 setImageQuad:v10];
    [(ICDocCamDocumentInfo *)v14 setMeshAnimImageUUID:0];
    uint64_t v15 = [*(id *)(a1 + 32) imageCache];
    uint64_t v16 = [v15 setImage:v11 metaData:*(void *)(a1 + 48)];
    [(ICDocCamDocumentInfo *)v14 setCroppedAndFilteredImageUUID:v16];

    [(ICDocCamDocumentInfo *)v14 setCroppedButNotFilteredImageUUID:0];
    long long v17 = [*(id *)(a1 + 32) imageCache];
    CGFloat v18 = [v17 setImage:v9 metaData:*(void *)(a1 + 48)];
    [(ICDocCamDocumentInfo *)v14 setFullImageUUID:v18];

    [(ICDocCamDocumentInfo *)v14 setConstantColor:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v19 = [*(id *)(a1 + 32) documentInfoCollection];
    double v20 = [v19 docInfos];
    [v20 addObject:v14];

    double v21 = [*(id *)(a1 + 32) saveButton];
    [v21 setHidden:0];

    double v22 = [*(id *)(a1 + 32) documentInfoCollection];
    [v22 bumpModificationDate];

    double v23 = [*(id *)(a1 + 32) snapshotSpinnerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2_803;
    block[3] = &unk_2642AA080;
    void block[4] = *(void *)(a1 + 32);
    dispatch_sync(v23, block);
  }
  else
  {
    [*(id *)(a1 + 32) clearRectangles];
    if (a2)
    {
      if ([*(id *)(a1 + 32) isInRetakeMode])
      {
        double v24 = *(void **)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 48);
        v42[0] = v10;
        double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
        [v24 saveCapturedImage:v9 metaData:v25 rects:v26 constantColor:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
      }
      else
      {
        objc_initWeak(&location, *(id *)(a1 + 32));
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        unint64_t v32 = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_4;
        double v33 = &unk_2642AA350;
        objc_copyWeak(&v38, &location);
        id v34 = v9;
        id v35 = *(id *)(a1 + 48);
        id v36 = v10;
        char v39 = *(unsigned char *)(a1 + 64);
        id v37 = *(id *)(a1 + 56);
        [*(id *)(a1 + 32) setSessionStartNotificationBlock:&v30];
        double v27 = objc_msgSend(*(id *)(a1 + 32), "previewView", v30, v31, v32, v33);
        int64_t v28 = [v27 layer];
        LODWORD(v29) = 1.0;
        [v28 setOpacity:v29];

        [*(id *)(a1 + 32) restartImageCaptureSessionIfNecessary];
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      (*(void (**)(double))(*(void *)(a1 + 56) + 16))(1.0);
      [*(id *)(a1 + 32) popViewController:*MEMORY[0x263F15FD8] subtype:*MEMORY[0x263F15FF8] duration:0 completion:0.5];
      [*(id *)(a1 + 32) retakeButtonWasPressed];
    }
  }
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_2_803(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_3;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAwaitingSnapshotCompletion:0];
  id v2 = [*(id *)(a1 + 32) snapshotSpinner];
  [v2 hide];
}

void __104__ICDocCamViewController_detectRectanglesAndSaveCapturedImage_metadata_constantColor_completionHandler___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained popViewController:*MEMORY[0x263F15FD8] subtype:*MEMORY[0x263F15FF8] duration:0 completion:0.28];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 48);
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v4 saveCapturedImage:v5 metaData:v6 rects:v7 constantColor:*(unsigned __int8 *)(a1 + 72) completionHandler:*(void *)(a1 + 56)];
}

- (void)snapStillImageWithMode:(int64_t)a3
{
  uint64_t v5 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamViewController snapStillImageWithMode:]();
  }

  uint64_t v6 = [(ICDocCamViewController *)self processRequestsBlocker];
  char v7 = [v6 blocked];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = self;
    objc_sync_enter(v8);
    id v9 = [(ICDocCamViewController *)v8 snapStillImageBlocker];
    char v10 = [v9 blocked];

    if (v10)
    {
      objc_sync_exit(v8);
    }
    else
    {
      id v11 = [(ICDocCamViewController *)v8 snapStillImageBlocker];
      [v11 addBlockerOfType:@"SnapStillImageBlocker" clearRectangles:0 clearQueue:1];

      id v12 = [(ICDocCamViewController *)v8 processRequestsBlocker];
      [v12 addBlockerOfType:@"SnapshotDelayBlocker" clearRectangles:0 clearQueue:0];

      objc_sync_exit(v8);
      uint64_t v13 = [(ICDocCamViewController *)v8 inProgressPhotoCaptureDelegates];
      uint64_t v14 = [v13 count];

      uint64_t v15 = os_log_create("com.apple.documentcamera", "");
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v14)
      {
        if (v16) {
          -[ICDocCamViewController snapStillImageWithMode:]();
        }

        [(ICDocCamViewController *)v8 clearQueue];
      }
      else
      {
        if (v16) {
          -[ICDocCamViewController snapStillImageWithMode:]();
        }

        [(ICDocCamViewController *)v8 setSnapStillImageMode:a3];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke;
        block[3] = &unk_2642AA080;
        void block[4] = v8;
        dispatch_async(MEMORY[0x263EF83A0], block);
        long long v17 = [(ICDocCamViewController *)v8 videoPreviewLayer];
        CGFloat v18 = [v17 connection];
        uint64_t v19 = [v18 videoOrientation];

        double v20 = [(ICDocCamViewController *)v8 sessionQueue];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2;
        void v22[3] = &unk_2642AA170;
        v22[4] = v8;
        v22[5] = v19;
        dispatch_async(v20, v22);

        double v21 = [MEMORY[0x263EFF910] date];
        [(ICDocCamViewController *)v8 setLastAXPositionAnnouncementDate:v21];
      }
    }
  }
}

uint64_t __49__ICDocCamViewController_snapStillImageWithMode___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.2];
  [*(id *)(a1 + 32) enableShutter:0];
  id v2 = (void *)MEMORY[0x263F158F8];

  return [v2 commit];
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2(uint64_t a1)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) photoOutput];
  id v3 = [v2 connectionWithMediaType:*MEMORY[0x263EF9D48]];

  [v3 setVideoOrientation:*(void *)(a1 + 40)];
  if ([v3 isCameraIntrinsicMatrixDeliverySupported]) {
    [v3 setCameraIntrinsicMatrixDeliveryEnabled:1];
  }
  id v4 = [*(id *)(a1 + 32) photoOutput];
  if ([v4 isFlashScene])
  {

LABEL_6:
    uint64_t v6 = (void *)MEMORY[0x263EFA628];
    uint64_t v46 = *MEMORY[0x263F04180];
    double v47 = &unk_26C7ED880;
    char v7 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    BOOL v8 = [v6 photoSettingsWithFormat:v7];

    id v9 = [*(id *)(a1 + 32) photoOutput];
    char v10 = [v9 supportedFlashModes];

    for (unint64_t i = 0; [v10 count] > i; ++i)
    {
      id v12 = [v10 objectAtIndexedSubscript:i];
      uint64_t v13 = [v12 integerValue];
      LODWORD(v13) = v13 == [*(id *)(a1 + 32) flashMode];

      if (v13) {
        objc_msgSend(v8, "setFlashMode:", objc_msgSend(*(id *)(a1 + 32), "flashMode"));
      }
    }
    if ([*(id *)(a1 + 32) flashMode]
      && [*(id *)(a1 + 32) isConstantColorAvailable])
    {
      [v8 setConstantColorEnabled:1];
      [v8 setConstantColorFallbackPhotoDeliveryEnabled:1];
    }
    goto LABEL_19;
  }
  uint64_t v5 = [*(id *)(a1 + 32) flashMode];

  if (v5 == 1) {
    goto LABEL_6;
  }
  uint64_t v14 = (void *)MEMORY[0x263EFF980];
  uint64_t v15 = [*(id *)(a1 + 32) photoOutput];
  char v10 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "maxBracketedCapturePhotoCount"));

  unint64_t v16 = 0;
  int v17 = *MEMORY[0x263EF96A8];
  while (1)
  {
    CGFloat v18 = [*(id *)(a1 + 32) photoOutput];
    unint64_t v19 = [v18 maxBracketedCapturePhotoCount];

    if (v19 <= v16) {
      break;
    }
    LODWORD(v20) = v17;
    double v21 = [MEMORY[0x263EFA558] autoExposureSettingsWithExposureTargetBias:v20];
    [v10 addObject:v21];

    ++v16;
  }
  double v22 = (void *)MEMORY[0x263EFA618];
  uint64_t v48 = *MEMORY[0x263F04180];
  v49[0] = &unk_26C7ED880;
  double v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  BOOL v8 = [v22 photoBracketSettingsWithRawPixelFormatType:0 processedFormat:v23 bracketedSettings:v10];

  double v24 = [*(id *)(a1 + 32) photoOutput];
  int v25 = [v24 isLensStabilizationDuringBracketedCaptureSupported];

  if (v25) {
    [v8 setLensStabilizationEnabled:1];
  }
LABEL_19:

  [v8 setHighResolutionPhotoEnabled:1];
  [v8 setPreviewPhotoFormat:0];
  double v26 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v27 = [v26 BOOLForKey:@"internalSettings.docCam.imageStabilization.disabled"];

  if (v27) {
    [v8 setPhotoQualityPrioritization:1];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  int64_t v28 = [ICDocCamPhotoCaptureDelegate alloc];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_3;
  v44[3] = &unk_2642AA080;
  v44[4] = *(void *)(a1 + 32);
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  void v42[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6;
  v42[3] = &unk_2642AA418;
  objc_copyWeak(&v43, &location);
  v42[4] = *(void *)(a1 + 32);
  double v29 = [(ICDocCamPhotoCaptureDelegate *)v28 initWithRequestedPhotoSettings:v8 willCapturePhotoAnimation:v44 completed:v42];
  uint64_t v30 = [*(id *)(a1 + 32) inProgressPhotoCaptureDelegates];
  uint64_t v31 = NSNumber;
  unint64_t v32 = [(ICDocCamPhotoCaptureDelegate *)v29 requestedPhotoSettings];
  double v33 = objc_msgSend(v31, "numberWithLongLong:", objc_msgSend(v32, "uniqueID"));
  [v30 setObject:v29 forKeyedSubscript:v33];

  [*(id *)(a1 + 32) setAwaitingSnapshotCompletion:1];
  dispatch_time_t v34 = dispatch_time(0, 0);
  id v35 = [*(id *)(a1 + 32) snapshotSpinnerQueue];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_815;
  v41[3] = &unk_2642AA080;
  v41[4] = *(void *)(a1 + 32);
  dispatch_after(v34, v35, v41);

  id v36 = [*(id *)(a1 + 32) photoOutput];
  if (![v36 isConstantColorSupported]) {
    goto LABEL_27;
  }
  id v37 = [*(id *)(a1 + 32) photoOutput];
  if (([v37 isConstantColorEnabled] & 1) == 0)
  {

LABEL_27:
    goto LABEL_28;
  }
  int v38 = [v8 isConstantColorEnabled];

  if (v38)
  {
    char v39 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_1();
    }
    goto LABEL_30;
  }
LABEL_28:
  char v39 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_2();
  }
LABEL_30:

  float32x4_t v40 = [*(id *)(a1 + 32) photoOutput];
  [v40 capturePhotoWithSettings:v8 delegate:v29];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_4;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) videoPreviewLayer];
  [v2 setOpacity:0.0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_5;
  v4[3] = &unk_2642AA080;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:0.25];
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) videoPreviewLayer];
  LODWORD(v2) = 1.0;
  id v3 = v1;
  [v1 setOpacity:v2];
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6(uint64_t a1, void *a2, __CVBuffer *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v13 = [v11 objectForKey:@"constantColorPhoto"];
    uint64_t v14 = [v13 BOOLValue];

    uint64_t v15 = [v9 requestedPhotoSettings];
    uint64_t v16 = [v15 uniqueID];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_7;
    v20[3] = &unk_2642AA3F0;
    uint64_t v17 = *(void *)(a1 + 32);
    v20[4] = WeakRetained;
    v20[5] = v17;
    v20[6] = a3;
    v20[7] = v16;
    CGFloat v18 = (void (**)(void, double))MEMORY[0x21D44FA30](v20);
    CVPixelBufferRetain(a3);
    if (a3)
    {
      [*(id *)(a1 + 32) detectRectanglesAndSaveCapturedImage:a3 metadata:v10 constantColor:v14 completionHandler:v18];
    }
    else
    {
      unint64_t v19 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6_cold_1();
      }

      v18[2](v18, 0.5);
    }
  }
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_7(uint64_t a1, double a2)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) sessionQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_8;
  v5[3] = &unk_2642AA3C8;
  double v7 = a2;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async(v4, v5);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_8(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_9;
  block[3] = &unk_2642AA3A0;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) setSnapStillImageMode:0];
  [*(id *)(a1 + 32) enableShutterButtonIfPossible];
  dispatch_time_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = *(void **)(a1 + 32);
  long long v4 = [v3 documentInfoCollection];
  uint64_t v5 = [v4 docInfos];
  LODWORD(v3) = objc_msgSend(v2, "documentCameraController:canAddImages:", v3, objc_msgSend(v5, "count") + 1);

  if (v3 && [*(id *)(a1 + 32) autoMode])
  {
    int8x16_t v6 = +[DCLocalization localizedStringForKey:@"Ready for next scan." value:@"Ready for next scan." table:@"Localizable"];
    double v7 = [*(id *)(a1 + 32) userPromptLabel];
    [v7 setText:v6];

    uint64_t v8 = [*(id *)(a1 + 32) userPromptView];
    [v8 setHidden:0];

    id v9 = [*(id *)(a1 + 32) userPromptView];
    [v9 setAlpha:0.0];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_10;
    v14[3] = &unk_2642AA080;
    uint64_t v15 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_11;
    v13[3] = &unk_2642AA0F8;
    v13[4] = v15;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v14 options:v13 animations:0.2 completion:0.0];
  }
  dispatch_time_t v10 = dispatch_time(0, 300000000);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_13;
  void v12[3] = &unk_2642AA170;
  uint64_t v11 = *(void *)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  void v12[5] = v11;
  dispatch_after(v10, MEMORY[0x263EF83A0], v12);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_10(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userPromptView];
  [v1 setAlpha:1.0];
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) setHideUserPrompt:0];
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_12;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_12(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userPromptLabel];
  id v1 = [v2 text];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v1);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_13(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inProgressPhotoCaptureDelegates];
  id v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  [v3 setObject:0 forKeyedSubscript:v2];

  id v4 = [*(id *)(a1 + 32) snapStillImageBlocker];
  [v4 removeBlockerOfType:@"SnapStillImageBlocker"];

  id v5 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v5 removeBlockerOfType:@"SnapshotDelayBlocker"];
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_815(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_816;
  block[3] = &unk_2642AA080;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_816(uint64_t a1)
{
  if ([*(id *)(a1 + 32) awaitingSnapshotCompletion])
  {
    id v2 = [*(id *)(a1 + 32) snapshotSpinner];
    [v2 show];
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  v37[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  if ([(ICDocCamViewController *)self scanMovieRecordingEnabled])
  {
    uint64_t v8 = [(ICDocCamViewController *)self movieController];
    [v8 recordFrame:a4 fromConnection:v7];
  }
  [(ICDocCamViewController *)self setCameraIntrinsicData:0];
  if (![v7 isCameraIntrinsicMatrixDeliverySupported])
  {
    uint64_t v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].value) = 0;
      _os_log_impl(&dword_217885000, v11, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery is not supported.", (uint8_t *)buf, 2u);
    }
    goto LABEL_12;
  }
  if (![v7 isCameraIntrinsicMatrixDeliveryEnabled])
  {
    uint64_t v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].value) = 0;
      _os_log_impl(&dword_217885000, v11, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery is disabled.", (uint8_t *)buf, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  [(ICDocCamViewController *)self setCameraIntrinsicData:CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F01028], 0)];
  id v9 = [(ICDocCamViewController *)self cameraIntrinsicData];

  if (v9)
  {
    dispatch_time_t v10 = [(ICDocCamViewController *)self cameraIntrinsicData];
    [v10 getBytes:buf length:48];
  }
LABEL_13:
  if (a4)
  {
    if ([(ICDocCamViewController *)self adjustingFocus]) {
      goto LABEL_15;
    }
    id v12 = [(ICDocCamViewController *)self processRequestsBlocker];
    char v13 = [v12 blocked];

    if (v13) {
      goto LABEL_26;
    }
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    uint64_t v15 = [(ICDocCamViewController *)self lastSubjectAreaChange];
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;

    if (v17 < 1.0)
    {
LABEL_15:
      [(ICDocCamViewController *)self clearRectangles];
      [(ICDocCamViewController *)self clearQueue];
    }
    else
    {
      [(ICDocCamViewController *)self streamingImageSize];
      if (v19 == *MEMORY[0x263F001B0] && v18 == *(double *)(MEMORY[0x263F001B0] + 8))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a4);
        CVPixelBufferLockBaseAddress(ImageBuffer, 0);
        size_t Width = CVPixelBufferGetWidth(ImageBuffer);
        -[ICDocCamViewController setStreamingImageSize:](self, "setStreamingImageSize:", (double)Width, (double)CVPixelBufferGetHeight(ImageBuffer));
        CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
      }
      CFDictionaryRef v22 = CMCopyDictionaryOfAttachments(0, a4, 1u);
      CFTypeRef v23 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F01028], 0);
      double v24 = [(__CFDictionary *)v22 valueForKey:*MEMORY[0x263F2C510]];
      int v25 = v24;
      if (v24)
      {
        double v26 = [v24 valueForKey:*MEMORY[0x263F2D3D8]];
        [v26 floatValue];
        -[ICDocCamViewController setPixelFocalLength:](self, "setPixelFocalLength:");
      }
      CVImageBufferRef v27 = CMSampleBufferGetImageBuffer(a4);
      if (v27)
      {
        memset(buf, 0, 24);
        CMSampleBufferGetOutputPresentationTimeStamp(buf, a4);
        uint64_t v28 = [(ICDocCamViewController *)self imageOrientationFromDevice];
        v36[0] = @"ICDocCamImageSequenceFrame_Timestamp";
        CMTime v34 = buf[0];
        CFDictionaryRef v29 = CMTimeCopyAsDictionary(&v34, 0);
        v37[0] = v29;
        v36[1] = @"ICDocCamImageSequenceFrame_Orientation";
        uint64_t v30 = [NSNumber numberWithUnsignedInt:v28];
        v37[1] = v30;
        uint64_t v31 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

        unint64_t v32 = [(ICDocCamViewController *)self detectRectanglesRequest];
        double v33 = [(ICDocCamViewController *)self vkAnalyzer];
        [(ICDocCamViewController *)self pixelFocalLength];
        objc_msgSend(v33, "addFrame:metaData:frameOptions:rectangleRequest:pixelFocalLength:cameraIntrinsicData:", v27, v22, v31, v32, v23);
      }
    }
  }
LABEL_26:
}

- (void)clearRectangles
{
  id v2 = [(ICDocCamViewController *)self overlayView];
  [v2 clearRectangles];
}

- (void)clearQueue
{
  id v2 = [(ICDocCamViewController *)self rectResultsQueue];
  [v2 clear];
}

- (void)analyzerCallbackWithDictionaryResults:(id)a3
{
  v74[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(ICDocCamViewController *)self isInRetakeMode])
  {
    id v5 = [(ICDocCamViewController *)self delegate];
    int8x16_t v6 = [(ICDocCamViewController *)self documentInfoCollection];
    id v7 = [v6 docInfos];
    if (objc_msgSend(v5, "documentCameraController:canAddImages:", self, objc_msgSend(v7, "count") + 1))
    {
    }
    else
    {
      BOOL v8 = [(ICDocCamViewController *)self didWarnAboutMaxScans];

      if (v8) {
        goto LABEL_47;
      }
    }
  }
  id v9 = [(ICDocCamViewController *)self processRequestsBlocker];
  char v10 = [v9 blocked];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(ICDocCamViewController *)self snapStillImageBlocker];
    char v12 = [v11 blocked];

    if ((v12 & 1) == 0)
    {
      char v13 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzerResults"];
      if (v13)
      {
        uint64_t v14 = [(ICDocCamViewController *)self videoPreviewLayer];
        objc_msgSend(v14, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        CFTypeRef v23 = [(ICDocCamViewController *)self overlayView];
        objc_msgSend(v23, "setPreviewBounds:", v16, v18, v20, v22);

        double v24 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_Timestamp"];
        int v25 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_MetaData"];

        if (v25)
        {
          double v70 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_MetaData"];
        }
        else
        {
          double v70 = 0;
        }
        CVImageBufferRef v27 = [v13 objectForKeyedSubscript:@"ICDocCamImageSequenceAnalyzer_Rectangles"];
        if ((unint64_t)([(ICDocCamViewController *)self statusBarOrientation] - 3) > 1)
        {
          [(ICDocCamViewController *)self streamingImageSize];
          double v29 = v32;
          [(ICDocCamViewController *)self streamingImageSize];
          double v31 = v33;
        }
        else
        {
          [(ICDocCamViewController *)self streamingImageSize];
          double v29 = v28;
          double v31 = v30;
        }
        if (-[ICDocCamViewController validRect:forImageSize:](self, "validRect:forImageSize:", v27, v29, v31))
        {
          [(ICDocCamViewController *)self didRecognizeRectangleForAccessibility:1];
          if (v27)
          {
            id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v73[0] = @"Rectangles";
            v73[1] = @"Timestamp";
            v74[0] = v27;
            v74[1] = v24;
            v73[2] = @"RecognitionTime";
            id v35 = [MEMORY[0x263EFF910] date];
            v74[2] = v35;
            id v36 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
            [v34 addEntriesFromDictionary:v36];

            id v37 = [(ICDocCamViewController *)self rectResultsQueue];
            [v37 enqueue:v34];

            int v38 = [(ICDocCamViewController *)self rectResultsQueue];
            BOOL v39 = [v38 size] > 250;

            if (v39)
            {
              float32x4_t v40 = [(ICDocCamViewController *)self rectResultsQueue];
              id v41 = (id)[v40 dequeue];
            }
            if ([(ICDocCamViewController *)self debugRectanglesEnabled])
            {
              CFDataRef v42 = [(ICDocCamViewController *)self overlayView];
              [v42 setDocumentQuad:0];

              id v43 = [(ICDocCamViewController *)self overlayView];
              [v43 setDebugRects:v27];

              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke;
              block[3] = &unk_2642AA080;
              void block[4] = self;
              dispatch_async(MEMORY[0x263EF83A0], block);
            }
            else if ([v27 count])
            {
              uint64_t v48 = [v27 firstObject];
              if (![(ICDocCamViewController *)self useDocumentSegmentation]
                && ([v48 confidence],
                    float v50 = v49,
                    [(ICDocCamViewController *)self rectangleMinimumVisualConfidence],
                    v50 > v51)
                || [(ICDocCamViewController *)self useDocumentSegmentation]
                && ([v48 confidence],
                    float v53 = v52,
                    [(ICDocCamViewController *)self segmentMinimumVisualConfidence],
                    v53 > v54)
                && ([v48 confidence], v55 < 0.99999))
              {
                [(ICDocCamViewController *)self setLastHighConfidenceRectangle:v48];
                CGFloat v56 = +[ICDocCamImageQuad quadFromVNRectangle:v48];
                CFDataRef v57 = [(ICDocCamViewController *)self overlayView];
                [v57 setDocumentQuad:v56];

                uint64_t v58 = [(ICDocCamViewController *)self overlayView];
                [v58 setDebugRects:0];

                if (![(ICDocCamViewController *)self hideUserPrompt])
                {
                  [(ICDocCamViewController *)self setHideUserPrompt:1];
                  v71[0] = MEMORY[0x263EF8330];
                  v71[1] = 3221225472;
                  v71[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_2;
                  v71[3] = &unk_2642AA080;
                  v71[4] = self;
                  dispatch_async(MEMORY[0x263EF83A0], v71);
                }
                [(ICDocCamViewController *)self updateRecentlyObservedRectanglesWithRect:v48];
              }
            }
            else
            {
              uint64_t v59 = [(ICDocCamViewController *)self overlayView];
              [v59 setDocumentQuad:0];

              uint64_t v60 = [(ICDocCamViewController *)self overlayView];
              [v60 setDebugRects:v27];
            }
          }
          else
          {
            uint64_t v46 = [(ICDocCamViewController *)self overlayView];
            [v46 setDocumentQuad:0];

            double v47 = [(ICDocCamViewController *)self overlayView];
            [v47 setDebugRects:0];
          }
          double v61 = [MEMORY[0x263F089D8] string];
          double v62 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_RequestTime"];
          BOOL v63 = v62 == 0;

          if (!v63)
          {
            self->_requestTimeSum = self->_requestTimeSum - self->_requestTime[self->_requestTimeIndex];
            double v64 = [v4 objectForKeyedSubscript:@"ICDocCamImageSequenceFrame_RequestTime"];
            [v64 doubleValue];
            self->_requestTime[self->_requestTimeIndex] = v65;

            requestTimeIndedouble x = self->_requestTimeIndex;
            double v67 = self->_requestTime[requestTimeIndex] + self->_requestTimeSum;
            self->_requestTimeSum = v67;
            self->_requestTimeIndedouble x = ((int)requestTimeIndex + 1) % 10;
            double v68 = objc_msgSend(NSString, "stringWithFormat:", @"Average request time = %.1fms", v67 / 10.0 * 1000.0, v70);
            [v61 appendString:v68];
          }
          if ([(ICDocCamViewController *)self displayStringEnabled])
          {
            double v69 = [(ICDocCamViewController *)self overlayView];
            [v69 setDisplayString:v61];
          }
          else
          {
            double v69 = [(ICDocCamViewController *)self overlayView];
            [v69 setDisplayString:0];
          }

          if ([(ICDocCamViewController *)self shouldAutoShoot])
          {
            if (-[ICDocCamViewController sufficientlyLarge:forImageSize:](self, "sufficientlyLarge:forImageSize:", v27, v29, v31))
            {
              [(ICDocCamViewController *)self killFeedbackDisplayIncludingUserPrompts:1];
              [(ICDocCamViewController *)self snapStillImageWithMode:1];
            }
            else
            {
              [(ICDocCamViewController *)self clearQueue];
              [(ICDocCamViewController *)self flashMoveCloserFeedback];
            }
          }
        }
        else
        {
          uint64_t v44 = [(ICDocCamViewController *)self overlayView];
          [v44 setDocumentQuad:0];

          double v45 = [(ICDocCamViewController *)self overlayView];
          [v45 setDebugRects:v27];

          [(ICDocCamViewController *)self didRecognizeRectangleForAccessibility:0];
        }
      }
      else
      {
        double v26 = [(ICDocCamViewController *)self overlayView];
        [v26 clearRectangles];
      }
    }
  }
LABEL_47:
}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userPromptView];
  [v1 setHidden:1];
}

uint64_t __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userPromptView];
  [v2 setAlpha:1.0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_3;
  v5[3] = &unk_2642AA080;
  uint64_t v6 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_4;
  v4[3] = &unk_2642AA0F8;
  v4[4] = v6;
  return [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v5 options:v4 animations:0.6 completion:0.7];
}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userPromptView];
  [v1 setAlpha:0.0];
}

void __64__ICDocCamViewController_analyzerCallbackWithDictionaryResults___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userPromptView];
  [v1 setHidden:1];
}

- (void)logAlgoChoice
{
  BOOL v2 = [(ICDocCamViewController *)self useDocumentSegmentation];
  id v3 = os_log_create("com.apple.documentcamera", "");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      id v5 = "Using VNDetectDocumentSegmentationRequest";
      uint64_t v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_217885000, v3, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    id v5 = "Using VNDetectRectanglesRequest";
    uint64_t v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  char v12 = [(ICDocCamViewController *)self sessionQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke;
  v13[3] = &unk_2642AA440;
  v13[4] = self;
  void v13[5] = a3;
  *(CGFloat *)&v13[6] = x;
  *(CGFloat *)&v13[7] = y;
  v13[8] = a4;
  BOOL v14 = a6;
  dispatch_async(v12, v13);
}

void __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) videoDeviceInput];
  id v3 = [v2 device];

  id v7 = 0;
  int v4 = [v3 lockForConfiguration:&v7];
  id v5 = v7;
  if (v4)
  {
    if ([v3 isFocusPointOfInterestSupported]
      && [v3 isFocusModeSupported:*(void *)(a1 + 40)])
    {
      objc_msgSend(v3, "setFocusPointOfInterest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      [v3 setFocusMode:*(void *)(a1 + 40)];
    }
    if ([v3 isExposurePointOfInterestSupported]
      && [v3 isExposureModeSupported:*(void *)(a1 + 64)])
    {
      objc_msgSend(v3, "setExposurePointOfInterest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      [v3 setExposureMode:*(void *)(a1 + 64)];
    }
    [v3 setSubjectAreaChangeMonitoringEnabled:*(unsigned __int8 *)(a1 + 72)];
    [v3 unlockForConfiguration];
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke_cold_1();
    }
  }
}

+ (id)deviceWithMediaType:(id)a3 preferringPosition:(int64_t)a4
{
  int v4 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9670] mediaType:a3 position:a4];

  return v4;
}

- (void)prepareForDismissal
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "ICDocCamViewController prepareForDismissal", v2, v3, v4, v5, v6);
}

- (void)thumbnailViewDidTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDocCamViewController *)self processRequestsBlocker];
  char v6 = [v5 blocked];

  if ((v6 & 1) == 0)
  {
    unint64_t v7 = [v4 item];
    __int16 v8 = [(ICDocCamViewController *)self documentInfoCollection];
    id v9 = [v8 docInfos];

    if ((v7 & 0x8000000000000000) == 0 && v7 < [v9 count])
    {
      char v10 = [v9 objectAtIndexedSubscript:v7];
      uint64_t v11 = [v10 croppedAndFilteredImageUUID];

      if (v11)
      {
        char v12 = [(ICDocCamViewController *)self processRequestsBlocker];
        [v12 addBlockerOfType:@"ThumbnailTapBlocker" clearRectangles:1 clearQueue:1];

        char v13 = [(ICDocCamViewController *)self cameraUnavailableScrim];
        char v14 = [v13 isHidden];

        if ((v14 & 1) == 0) {
          [(ICDocCamViewController *)self dismissFilterAndFlashUI];
        }
        [(ICDocCamViewController *)self stopImageCaptureSession];
        [(ICDocCamViewController *)self clearRectangles];
        [(ICDocCamViewController *)self disableRetakeMode];
        double v15 = [ICDocCamExtractedDocumentViewController alloc];
        double v16 = [(ICDocCamViewController *)self documentInfoCollection];
        double v17 = [(ICDocCamViewController *)self imageCache];
        double v18 = [(ICDocCamExtractedDocumentViewController *)v15 initWithDelegate:self documentInfoCollection:v16 imageCache:v17 currentIndex:v7 mode:0];

        int v38 = v18;
        [(ICDocCamViewController *)self setUseCustomThumbnailZoomTransition:1];
        double v19 = [(ICDocCamViewController *)self navigationController];
        [v19 setDelegate:self];

        double v20 = [(ICDocCamExtractedDocumentViewController *)v18 navigationController];
        [v20 setDelegate:self];

        double v21 = [(ICDocCamViewController *)self thumbnailViewController];
        double v22 = [v21 collectionView];
        CFTypeRef v23 = [v22 cellForItemAtIndexPath:v4];

        double v24 = [(ICDocCamViewController *)self documentInfoCollection];
        int v25 = [v24 docInfos];
        double v26 = [v25 objectAtIndexedSubscript:v7];

        id v37 = v26;
        CVImageBufferRef v27 = [(ICDocCamViewController *)self imageCache];
        double v28 = [v26 croppedAndFilteredImageUUID];
        double v29 = [v27 getImage:v28];

        [(ICDocCamViewController *)self setImageForThumbnailZoom:v29];
        [(ICDocCamViewController *)self setIndexPathForThumbnailZoom:v4];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v23);
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __46__ICDocCamViewController_thumbnailViewDidTap___block_invoke;
        v39[3] = &unk_2642AA468;
        objc_copyWeak(&v40, &from);
        objc_copyWeak(&v41, &location);
        [(ICDocCamViewController *)self setThumbnailZoomCompletionBlock:v39];
        if (DCDebugInterfaceEnabled()) {
          goto LABEL_11;
        }
        double v30 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v31 = [v30 userInterfaceIdiom];

        if (v31 == 1
          || ([(ICDocCamViewController *)self documentInfoCollection],
              double v32 = objc_claimAutoreleasedReturnValue(),
              [v32 docInfos],
              double v33 = objc_claimAutoreleasedReturnValue(),
              uint64_t v34 = [v33 count],
              v33,
              v32,
              v34 != 1))
        {
LABEL_11:
          [v23 setHidden:1];
        }
        else
        {
          id v35 = [(ICDocCamViewController *)self thumbnailContainerView];
          [v35 setHidden:1];
        }
        id v36 = [(ICDocCamViewController *)self navigationController];
        [v36 pushViewController:v38 animated:1];

        objc_destroyWeak(&v41);
        objc_destroyWeak(&v40);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __46__ICDocCamViewController_thumbnailViewDidTap___block_invoke(uint64_t a1)
{
  if (DCDebugInterfaceEnabled()) {
    goto LABEL_3;
  }
  id v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v2 = [v8 userInterfaceIdiom];

  if (v2 == 1) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained documentInfoCollection];
  uint64_t v5 = [v4 docInfos];
  uint64_t v6 = [v5 count];

  if (v6 != 1)
  {
LABEL_3:
    id v9 = objc_loadWeakRetained((id *)(a1 + 32));
    [v9 setHidden:0];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    unint64_t v7 = [v9 thumbnailContainerView];
    [v7 setHidden:0];
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [v10 processRequestsBlocker];
  [v3 removeBlockerOfType:@"ThumbnailTapBlocker"];
}

- (void)addNewDocument:(id)a3
{
  id v7 = a3;
  id v4 = [(ICDocCamViewController *)self documentInfoCollection];
  uint64_t v5 = [v4 docInfos];
  [v5 addObject:v7];

  uint64_t v6 = [(ICDocCamViewController *)self documentInfoCollection];
  [v6 bumpModificationDate];

  [(ICDocCamViewController *)self warnAboutMaxScansIfNecessary];
}

- (CGRect)targetViewRect
{
  int64_t v3 = [(ICDocCamViewController *)self statusBarOrientation];
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  unint64_t v6 = v3 - 1;
  id v7 = [(ICDocCamViewController *)self view];
  id v8 = v7;
  if (v5)
  {
    [v7 bounds];
    double v10 = v9;

    uint64_t v11 = [(ICDocCamViewController *)self view];
    [v11 bounds];
    double v19 = v10 + -200.0;
    double v21 = v20 + -200.0;

    double v22 = 100.0;
    double v23 = 100.0;
  }
  else
  {
    [v7 bounds];
    double v13 = v12;

    char v14 = [(ICDocCamViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    if (v6 > 1)
    {
      double v17 = 32.0;
      *(double *)&unint64_t v18 = -64.0;
    }
    else
    {
      double v17 = 100.0;
      *(double *)&unint64_t v18 = -200.0;
    }
    double v24 = *(double *)&v18;

    int v25 = [(ICDocCamViewController *)self view];
    [v25 safeAreaInsets];
    double v27 = v26;
    double v29 = v28;
    double v30 = v16 + v24;
    double v19 = v13 + -64.0;

    double v23 = v17 + v27;
    double v31 = 0.0;
    if (v29 > 0.0) {
      double v31 = 10.0;
    }
    double v21 = v30 - (v27 + v29 + v31);
    double v22 = 32.0;
  }
  double v32 = v19;
  double v33 = v21;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)warnAboutMaxScansIfNecessary
{
  int64_t v3 = [(ICDocCamViewController *)self delegate];
  id v4 = [(ICDocCamViewController *)self documentInfoCollection];
  uint64_t v5 = [v4 docInfos];
  char v6 = objc_msgSend(v3, "documentCameraController:canAddImages:", self, objc_msgSend(v5, "count") + 1);

  if ((v6 & 1) == 0)
  {
    [(ICDocCamViewController *)self enableShutter:0];
    id v7 = [(ICDocCamViewController *)self shutterButton];
    [v7 setPseudoDisabled:1];

    if (![(ICDocCamViewController *)self didWarnAboutMaxScans])
    {
      [(ICDocCamViewController *)self setDidWarnAboutMaxScans:1];
      id v8 = [(ICDocCamViewController *)self processRequestsBlocker];
      [v8 addBlockerOfType:@"MaxImageAlertBlocker" clearRectangles:1 clearQueue:1];

      double v9 = objc_opt_class();
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __54__ICDocCamViewController_warnAboutMaxScansIfNecessary__block_invoke;
      v10[3] = &unk_2642AA1C0;
      v10[4] = self;
      [v9 warnAboutMaxScansReachedForViewController:self completionHandler:v10];
    }
  }
}

void __54__ICDocCamViewController_warnAboutMaxScansIfNecessary__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) processRequestsBlocker];
  [v1 removeBlockerOfType:@"MaxImageAlertBlocker"];
}

+ (void)warnAboutMaxScansReachedForViewController:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  char v6 = +[DCLocalization localizedStringForKey:@"Maximum Reached" value:@"Maximum Reached" table:@"Localizable"];
  id v7 = +[DCLocalization localizedStringForKey:@"You’ve added the maximum number of scans to this document. You can delete scans or create another document." value:@"You’ve added the maximum number of scans to this document. You can delete scans or create another document." table:@"Localizable"];
  id v8 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  double v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v8 setImage:v9];

  double v10 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v11 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  double v12 = [v10 actionWithTitle:v11 style:1 handler:v5];

  [v8 addAction:v12];
  [v13 presentViewController:v8 animated:1 completion:0];
}

- (id)filteredImageForDocument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 croppedButNotFilteredImageUUID];

  [(ICDocCamViewController *)self imageCache];
  if (v5) {
    char v6 = {;
  }
    id v7 = [v4 croppedButNotFilteredImageUUID];
    [v6 getImage:v7];
  }
  else {
    id v8 = {;
  }
    double v9 = [v4 fullImageUUID];
    char v6 = [v8 getImage:v9];

    id v7 = [v4 imageQuad];
    +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v6 normalizedImageQuad:v7];
  double v10 = };

  uint64_t v11 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v10, [v4 currentOrientation], objc_msgSend(v4, "currentFilter"), objc_msgSend(v4, "constantColor"));

  return v11;
}

- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7
{
  id v11 = a4;
  double v12 = (void (**)(id, void *))a6;
  id v30 = a7;
  id v13 = [(ICDocCamViewController *)self imageCache];
  char v14 = [v11 croppedAndFilteredImageUUID];
  double v31 = [v13 getImage:v14];

  double v15 = [(ICDocCamViewController *)self filteredImageForDocument:v11];
  double v16 = +[DCMarkupUtilities createMarkupViewController];
  [v16 setInkStyle:a5];
  double v17 = [MEMORY[0x263F1C550] DCExtractedDocumentViewControllerBackgroundColor];
  [v16 setBackgroundColor:v17];

  unint64_t v18 = [v11 markupModelData];
  double v19 = objc_msgSend(v15, "dc_JPEGData");
  [v16 setData:v19 withArchivedModelData:v18 placeholderImage:v31];

  double v20 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v16];
  double v21 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_markupDoneAction_];
  double v22 = [v16 navigationItem];
  [v22 setLeftBarButtonItem:v21];

  double v23 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_markupCancelAction_];
  double v24 = [v16 navigationItem];
  [v24 setRightBarButtonItem:v23];

  [v20 setModalTransitionStyle:2];
  [v20 setModalPresentationStyle:6];
  int v25 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  if (!v26)
  {
    double v27 = [v20 navigationBar];
    double v28 = [MEMORY[0x263F1C550] colorWithWhite:0.1 alpha:1.0];
    [v27 setBarTintColor:v28];
  }
  [(ICDocCamViewController *)self setMarkupDocumentInfo:v11];
  [(ICDocCamViewController *)self setMarkupDismissCompletionBlock:v30];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __126__ICDocCamViewController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke;
  v32[3] = &unk_2642AA490;
  v32[4] = self;
  id v29 = v20;
  id v33 = v29;
  v12[2](v12, v32);
}

void __126__ICDocCamViewController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)markupDoneAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  char v6 = [(ICDocCamViewController *)self navigationController];
  id v7 = [v6 topViewController];
  id v8 = DCDynamicCast(v5, (uint64_t)v7);

  uint64_t v9 = objc_opt_class();
  double v10 = [(ICDocCamViewController *)self presentedViewController];
  id v11 = DCDynamicCast(v9, (uint64_t)v10);

  double v12 = [(ICDocCamViewController *)self markupDocumentInfo];
  [(ICDocCamViewController *)self setMarkupDocumentInfo:0];
  id v13 = [v11 topViewController];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2050000000;
  char v14 = (void *)getMarkupViewControllerClass(void)::softClass;
  uint64_t v31 = getMarkupViewControllerClass(void)::softClass;
  if (!getMarkupViewControllerClass(void)::softClass)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZL28getMarkupViewControllerClassv_block_invoke;
    v27[3] = &unk_2642AA520;
    v27[4] = &v28;
    ___ZL28getMarkupViewControllerClassv_block_invoke((uint64_t)v27);
    char v14 = (void *)v29[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v28, 8);
  if ((objc_opt_isKindOfClass() & (v12 != 0)) == 1)
  {
    id v16 = v13;
    uint64_t v26 = v8;
    double v17 = [v16 createArchivedModelData];
    [v12 setMarkupModelData:v17];

    unint64_t v18 = [v16 dataRepresentationEmbeddingSourceImageAndEditModel:0 error:0];
    if (v18)
    {
      id v25 = v4;
      double v19 = [MEMORY[0x263F1C6B0] imageWithData:v18];
      double v20 = [(ICDocCamViewController *)self imageCache];
      double v21 = [v12 metaData];
      double v22 = [v12 croppedAndFilteredImageUUID];
      [v20 replaceImage:v19 metaData:v21 uuid:v22];

      [v26 didUpdateDocumentImage:v12];
      id v4 = v25;
    }

    id v8 = v26;
  }
  double v23 = [(ICDocCamViewController *)self markupDismissCompletionBlock];
  [(ICDocCamViewController *)self setMarkupDismissCompletionBlock:0];
  double v24 = [(ICDocCamViewController *)self presentedViewController];
  [v24 dismissViewControllerAnimated:1 completion:v23];
}

- (void)markupCancelAction:(id)a3
{
  id v5 = [(ICDocCamViewController *)self markupDismissCompletionBlock];
  [(ICDocCamViewController *)self setMarkupDismissCompletionBlock:0];
  [(ICDocCamViewController *)self setMarkupDocumentInfo:0];
  id v4 = [(ICDocCamViewController *)self presentedViewController];
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  int64_t v3 = [a3 markupModelData];

  return v3;
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
{
  id v12 = a3;
  [v12 setMarkupModelData:0];
  uint64_t v4 = objc_opt_class();
  id v5 = [(ICDocCamViewController *)self navigationController];
  char v6 = [v5 topViewController];
  id v7 = DCDynamicCast(v4, (uint64_t)v6);

  id v8 = [(ICDocCamViewController *)self filteredImageForDocument:v12];
  uint64_t v9 = [(ICDocCamViewController *)self imageCache];
  double v10 = [v12 metaData];
  id v11 = [v12 croppedAndFilteredImageUUID];
  [v9 replaceImage:v8 metaData:v10 uuid:v11];

  [v7 didUpdateDocumentImage:v12];
}

- (void)extractedDocumentControllerDidTapRetake:(unint64_t)a3
{
  id v5 = [(ICDocCamViewController *)self documentInfoCollection];
  char v6 = [v5 docInfos];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    id v8 = [(ICDocCamViewController *)self thumbnailViewController];
    [v8 update];

    [(ICDocCamViewController *)self setRetakeIndex:a3];
    uint64_t v9 = [(ICDocCamViewController *)self saveButton];
    [v9 setHidden:1];

    double v10 = [(ICDocCamViewController *)self thumbnailContainerView];
    [v10 setHidden:1];

    [(ICDocCamViewController *)self setUseCustomRetakeTransition:1];
    id v11 = [(ICDocCamViewController *)self navigationController];
    [v11 setDelegate:self];

    id v12 = [(ICDocCamViewController *)self navigationController];
    id v13 = [v12 topViewController];
    char v14 = [v13 navigationController];
    [v14 setDelegate:self];

    id v15 = [(ICDocCamViewController *)self documentInfoCollection];
    id v16 = [v15 docInfos];
    double v17 = [v16 objectAtIndexedSubscript:a3];

    unint64_t v18 = [(ICDocCamViewController *)self imageCache];
    double v19 = [v17 croppedAndFilteredImageUUID];
    double v20 = [v18 getImage:v19];

    double v21 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    [(ICDocCamViewController *)self setIndexPathForRetake:v21];

    [(ICDocCamViewController *)self setImageForRetake:v20];
    [(ICDocCamViewController *)self setRetakeCompletionBlock:0];
    objc_initWeak(&location, self);
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    double v27 = __66__ICDocCamViewController_extractedDocumentControllerDidTapRetake___block_invoke;
    uint64_t v28 = &unk_2642AA210;
    objc_copyWeak(&v29, &location);
    [(ICDocCamViewController *)self setSessionStartNotificationBlock:&v25];
    double v22 = [(ICDocCamViewController *)self previewView];
    double v23 = [v22 layer];
    LODWORD(v24) = 1.0;
    [v23 setOpacity:v24];

    [(ICDocCamViewController *)self restartImageCaptureSessionIfNecessary];
    [(ICDocCamViewController *)self retakeButtonWasPressed];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

void __66__ICDocCamViewController_extractedDocumentControllerDidTapRetake___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v29 = [(ICDocCamViewController *)self imageCache];
  double v10 = [v9 fullImageUUID];
  id v11 = [v29 getImage:v10];

  id v12 = [v9 imageQuad];
  uint64_t v13 = [v9 currentOrientation];
  char v14 = [ICDocCamImageQuadEditViewController alloc];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __73__ICDocCamViewController_extractedDocumentController_didTapRecrop_index___block_invoke;
  v30[3] = &unk_2642AA4B8;
  id v15 = v9;
  id v31 = v15;
  double v32 = self;
  id v16 = v8;
  id v33 = v16;
  int64_t v34 = a5;
  double v17 = [(ICDocCamImageQuadEditViewController *)v14 initWithImage:v11 quad:v12 scanDataDelegate:0 orientation:v13 completionHandler:v30];
  [(ICDocCamImageQuadEditViewController *)v17 setShowImageAsAspectFit:1];
  [(ICDocCamViewController *)self setUseCustomRecropTransition:1];
  unint64_t v18 = [(ICDocCamViewController *)self navigationController];
  [v18 setDelegate:self];

  double v19 = [(ICDocCamImageQuadEditViewController *)v17 navigationController];
  [v19 setDelegate:self];

  double v20 = [MEMORY[0x263F088C8] indexPathForItem:a5 inSection:0];
  [(ICDocCamViewController *)self setIndexPathForRecrop:v20];

  double v21 = [(ICDocCamViewController *)self imageCache];
  double v22 = [v15 croppedAndFilteredImageUUID];
  double v23 = [v21 getImage:v22];
  [(ICDocCamViewController *)self setFilteredImageForRecrop:v23];

  double v24 = [v16 croppedButNotFilteredImageForDocInfo:v15];
  [(ICDocCamViewController *)self setUnfilteredImageForRecrop:v24];

  id v25 = objc_alloc(MEMORY[0x263F1C6B0]);
  id v26 = [(ICDocCamViewController *)self unfilteredImageForRecrop];
  double v27 = objc_msgSend(v25, "initWithCGImage:scale:orientation:", objc_msgSend(v26, "CGImage"), objc_msgSend(v15, "currentOrientation"), 1.0);
  [(ICDocCamViewController *)self setUnfilteredImageForRecrop:v27];

  -[ICDocCamViewController setOrientationForRecrop:](self, "setOrientationForRecrop:", [v15 currentOrientation]);
  uint64_t v28 = [(ICDocCamViewController *)self navigationController];
  [v28 pushViewController:v17 animated:1];
}

void __73__ICDocCamViewController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v27 = a3;
  id v7 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) setImageQuad:v7];
    id v8 = +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:v27 normalizedImageQuad:v7];
    id v9 = [*(id *)(a1 + 40) imageCache];
    double v10 = [*(id *)(a1 + 32) metaData];
    id v11 = [*(id *)(a1 + 32) croppedButNotFilteredImageUUID];
    [v9 replaceImage:v8 metaData:v10 uuid:v11];

    id v12 = +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v8, [*(id *)(a1 + 32) currentOrientation], objc_msgSend(*(id *)(a1 + 32), "currentFilter"), objc_msgSend(*(id *)(a1 + 32), "constantColor"));
    uint64_t v13 = [*(id *)(a1 + 40) imageCache];
    char v14 = [*(id *)(a1 + 32) metaData];
    id v15 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
    [v13 replaceImage:v12 metaData:v14 uuid:v15];

    id v16 = [*(id *)(a1 + 40) thumbnailViewController];
    [v16 update];

    [*(id *)(a1 + 48) didUpdateDocumentImage:*(void *)(a1 + 32)];
  }
  double v17 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 56) inSection:0];
  [*(id *)(a1 + 40) setIndexPathForRecrop:v17];

  unint64_t v18 = [*(id *)(a1 + 40) imageCache];
  double v19 = [*(id *)(a1 + 32) croppedAndFilteredImageUUID];
  double v20 = [v18 getImage:v19];
  [*(id *)(a1 + 40) setFilteredImageForRecrop:v20];

  double v21 = [*(id *)(a1 + 48) croppedButNotFilteredImageForDocInfo:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setUnfilteredImageForRecrop:v21];

  id v22 = objc_alloc(MEMORY[0x263F1C6B0]);
  id v23 = [*(id *)(a1 + 40) unfilteredImageForRecrop];
  double v24 = objc_msgSend(v22, "initWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  [*(id *)(a1 + 40) setUnfilteredImageForRecrop:v24];

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  id v25 = [*(id *)(a1 + 40) navigationController];
  id v26 = (id)[v25 popViewControllerAnimated:1];
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
  [(ICDocCamViewController *)self disableRetakeMode];
  id v5 = [MEMORY[0x263F15910] animation];
  [v5 setRemovedOnCompletion:1];
  [v5 setDuration:0.25];
  uint64_t v6 = *MEMORY[0x263F15FD8];
  [v5 setType:*MEMORY[0x263F15FD8]];
  id v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v5 setTimingFunction:v7];

  id v8 = [(ICDocCamViewController *)self saveButton];
  id v9 = [v8 layer];
  [v9 addAnimation:v5 forKey:@"changeTextTransition"];

  double v10 = [(ICDocCamViewController *)self saveButton];
  id v11 = [(ICDocCamViewController *)self documentInfoCollection];
  id v12 = [v11 docInfos];
  objc_msgSend(v10, "setDocumentCount:", objc_msgSend(v12, "count"));

  [(ICDocCamViewController *)self updateThumbnailContainerViewConstraintConstantForIPad];
  uint64_t v13 = [(ICDocCamViewController *)self documentInfoCollection];
  char v14 = [v13 docInfos];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = [(ICDocCamViewController *)self saveButton];
    [v16 setHidden:0];
  }
  double v17 = [(ICDocCamViewController *)self thumbnailContainerView];
  [v17 setHidden:0];

  unint64_t v18 = [(ICDocCamViewController *)self thumbnailViewController];
  [v18 update];

  double v19 = [(ICDocCamViewController *)self documentInfoCollection];
  double v20 = [v19 docInfos];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    [(ICDocCamViewController *)self setUseCustomThumbnailZoomTransition:1];
    id v22 = [(ICDocCamViewController *)self view];
    [v22 setNeedsLayout];

    id v23 = [(ICDocCamViewController *)self view];
    [v23 layoutIfNeeded];

    double v24 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    id v25 = [(ICDocCamViewController *)self documentInfoCollection];
    id v26 = [v25 docInfos];
    id v27 = [v26 objectAtIndexedSubscript:a3];

    uint64_t v28 = [(ICDocCamViewController *)self imageCache];
    id v29 = [v27 croppedAndFilteredImageUUID];
    uint64_t v30 = [v28 getImage:v29];

    [(ICDocCamViewController *)self setIndexPathForThumbnailZoom:v24];
    [(ICDocCamViewController *)self setImageForThumbnailZoom:v30];
    objc_initWeak(&location, self);
    uint64_t v45 = MEMORY[0x263EF8330];
    uint64_t v46 = 3221225472;
    double v47 = __64__ICDocCamViewController_extractedDocumentControllerDidTapDone___block_invoke;
    uint64_t v48 = &unk_2642AA210;
    objc_copyWeak(&v49, &location);
    [(ICDocCamViewController *)self setSessionStartNotificationBlock:&v45];
    id v31 = [(ICDocCamViewController *)self previewView];
    double v32 = [v31 layer];
    LODWORD(v33) = 1.0;
    [v32 setOpacity:v33];

    [(ICDocCamViewController *)self restartImageCaptureSessionIfNecessary];
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ICDocCamViewController *)self setUseCustomThumbnailZoomTransition:0];
    int64_t v34 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v35 = [v34 userInterfaceIdiom];

    if (!v35)
    {
      id v36 = [(ICDocCamViewController *)self thumbnailContainerView];
      [v36 setHidden:0];
    }
    id v37 = [(ICDocCamViewController *)self navigationController];
    int v38 = [v37 topViewController];
    BOOL v39 = [v38 view];

    id v40 = [MEMORY[0x263F15910] animation];
    [v40 setDuration:0.25];
    [v40 setType:*MEMORY[0x263F16008]];
    [v40 setSubtype:v6];
    id v41 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v40 setTimingFunction:v41];

    CFDataRef v42 = [v39 layer];
    [v42 addAnimation:v40 forKey:&stru_26C7D5180];

    id v43 = [(ICDocCamViewController *)self navigationController];
    id v44 = (id)[v43 popViewControllerAnimated:0];
  }
}

void __64__ICDocCamViewController_extractedDocumentControllerDidTapDone___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (void)extractedDocumentControllerDidDeleteDocument:(id)a3
{
  id v3 = [(ICDocCamViewController *)self thumbnailViewController];
  [v3 update];
}

- (void)setupAccessibilityInfo
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v3 = [(ICDocCamViewController *)self userPromptLabel];
  [v3 setIsAccessibilityElement:0];

  uint64_t v4 = [(ICDocCamViewController *)self cameraUnavailableLabel];
  [v4 setIsAccessibilityElement:0];

  id v5 = [(ICDocCamViewController *)self cancelButtonForIPhone];
  [v5 setShowsLargeContentViewer:1];

  uint64_t v6 = [(ICDocCamViewController *)self cancelButtonForIPhone];
  id v7 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v6 addInteraction:v7];

  id v8 = [(ICDocCamViewController *)self cancelButton];
  [v8 setShowsLargeContentViewer:1];

  id v9 = [(ICDocCamViewController *)self cancelButton];
  id v10 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v9 addInteraction:v10];

  id v11 = [(ICDocCamViewController *)self flashButton];
  [v11 setShowsLargeContentViewer:1];

  id v12 = [(ICDocCamViewController *)self flashButton];
  id v13 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v12 addInteraction:v13];

  char v14 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  [v14 setShowsLargeContentViewer:1];

  uint64_t v15 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  id v16 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v15 addInteraction:v16];

  double v17 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v17 setShowsLargeContentViewer:1];

  unint64_t v18 = [(ICDocCamViewController *)self flashButtonForIPhone];
  id v19 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v18 addInteraction:v19];

  double v20 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  [v20 setShowsLargeContentViewer:1];

  uint64_t v21 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  id v22 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v21 addInteraction:v22];

  id v23 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  [v23 setShowsLargeContentViewer:1];

  double v24 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  id v25 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v24 addInteraction:v25];

  id v26 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  [v26 setShowsLargeContentViewer:1];

  id v27 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  id v28 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v27 addInteraction:v28];

  id v29 = +[DCLocalization localizedStringForKey:@"Show filter settings" value:@"Show filter settings" table:@"Localizable"];
  uint64_t v30 = [(ICDocCamViewController *)self filterButton];
  [v30 setAccessibilityLabel:v29];

  id v31 = +[DCLocalization localizedStringForKey:@"Double-tap to choose a filter to apply to this scan." value:@"Double-tap to choose a filter to apply to this scan." table:@"Localizable"];
  double v32 = [(ICDocCamViewController *)self filterButton];
  [v32 setAccessibilityHint:v31];

  double v33 = [(ICDocCamViewController *)self filterButton];
  [v33 setShowsLargeContentViewer:1];

  int64_t v34 = [(ICDocCamViewController *)self filterButton];
  id v35 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v34 addInteraction:v35];

  id v36 = [(ICDocCamViewController *)self filterButton];
  id v37 = [v36 accessibilityLabel];
  int v38 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v38 setAccessibilityLabel:v37];

  BOOL v39 = [(ICDocCamViewController *)self filterButton];
  id v40 = [v39 accessibilityHint];
  id v41 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v41 setAccessibilityHint:v40];

  CFDataRef v42 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v42 setShowsLargeContentViewer:1];

  id v43 = [(ICDocCamViewController *)self filterButtonForIPhone];
  id v44 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v43 addInteraction:v44];

  uint64_t v45 = +[DCLocalization localizedStringForKey:@"Hide filter settings" value:@"Hide filter settings" table:@"Localizable"];
  uint64_t v46 = [(ICDocCamViewController *)self filterViewButton];
  [v46 setAccessibilityLabel:v45];

  double v47 = [(ICDocCamViewController *)self filterViewButton];
  [v47 setShowsLargeContentViewer:1];

  uint64_t v48 = [(ICDocCamViewController *)self filterViewButton];
  id v49 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v48 addInteraction:v49];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  float v50 = [(ICDocCamViewController *)self filterButtons];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v82 != v52) {
          objc_enumerationMutation(v50);
        }
        float v54 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        [v54 setShowsLargeContentViewer:1];
        id v55 = objc_alloc_init(MEMORY[0x263F1C770]);
        [v54 addInteraction:v55];
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v81 objects:v85 count:16];
    }
    while (v51);
  }

  CGFloat v56 = +[DCLocalization localizedStringForKey:@"Double-tap to resume" value:@"Double-tap to resume" table:@"Localizable"];
  CFDataRef v57 = [(ICDocCamViewController *)self resumeButton];
  [v57 setAccessibilityLabel:v56];

  uint64_t v58 = [(ICDocCamViewController *)self autoButtonForIPhone];
  [v58 setShowsLargeContentViewer:1];

  uint64_t v59 = [(ICDocCamViewController *)self autoButtonForIPhone];
  id v60 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v59 addInteraction:v60];

  double v61 = [(ICDocCamViewController *)self autoButton];
  [v61 setShowsLargeContentViewer:1];

  double v62 = [(ICDocCamViewController *)self autoButton];
  id v63 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v62 addInteraction:v63];

  [(ICDocCamViewController *)self updateAccessibilityForCurrentFlashMode];
  [(ICDocCamViewController *)self updateAccessibilityForCurrentFilter];
  [(ICDocCamViewController *)self updateAccessibilityForAutoShutterMode:[(ICDocCamViewController *)self autoMode]];
  double v64 = [(ICDocCamViewController *)self filterButton];
  [v64 _accessibilitySetIsSpeakThisElement:1];

  double v65 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v65 _accessibilitySetIsSpeakThisElement:1];

  double v66 = [(ICDocCamViewController *)self flashButton];
  [v66 _accessibilitySetIsSpeakThisElement:1];

  double v67 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v67 _accessibilitySetIsSpeakThisElement:1];

  double v68 = [(ICDocCamViewController *)self autoButton];
  [v68 _accessibilitySetIsSpeakThisElement:1];

  double v69 = [(ICDocCamViewController *)self autoButtonForIPhone];
  [v69 _accessibilitySetIsSpeakThisElement:1];

  double v70 = [(ICDocCamViewController *)self manualButton];
  [v70 _accessibilitySetIsSpeakThisElement:1];

  double v71 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  float v72 = [v71 accessibilityLabel];
  float v73 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  [v73 setLargeContentTitle:v72];

  float v74 = [(ICDocCamViewController *)self filterViewButton];
  id v75 = [v74 accessibilityLabel];
  double v76 = [(ICDocCamViewController *)self filterViewButton];
  [v76 setLargeContentTitle:v75];

  double v77 = [(ICDocCamViewController *)self manualButton];
  [v77 setShowsLargeContentViewer:1];

  double v78 = [(ICDocCamViewController *)self manualButton];
  id v79 = objc_alloc_init(MEMORY[0x263F1C770]);
  [v78 addInteraction:v79];

  double v80 = [(ICDocCamViewController *)self view];
  [v80 setAccessibilityIgnoresInvertColors:1];
}

- (void)updateAccessibilityForCurrentFilter
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = [(ICDocCamViewController *)self filterButtons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
    uint64_t v6 = *MEMORY[0x263F1CF38];
    uint64_t v7 = ~*MEMORY[0x263F1CF38];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = [v9 tag];
        if (v10 == [(ICDocCamViewController *)self defaultFilter]) {
          uint64_t v11 = v6 | [v9 accessibilityTraits];
        }
        else {
          uint64_t v11 = [v9 accessibilityTraits] & v7;
        }
        [v9 setAccessibilityTraits:v11];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }

  id v12 = [(ICDocCamViewController *)self filterButton];
  [v12 setAccessibilityValue:0];

  if ([(ICDocCamViewController *)self filterSettingUIShowing])
  {
    id v13 = +[DCLocalization localizedStringForKey:@"Hide filter settings" value:@"Hide filter settings" table:@"Localizable"];
    char v14 = [(ICDocCamViewController *)self filterButton];
    [v14 setAccessibilityLabel:v13];

    uint64_t v15 = [(ICDocCamViewController *)self filterButton];
    [v15 setAccessibilityValue:0];
  }
  else
  {
    id v16 = +[DCLocalization localizedStringForKey:@"Show filter settings" value:@"Show filter settings" table:@"Localizable"];
    double v17 = [(ICDocCamViewController *)self filterButton];
    [v17 setAccessibilityLabel:v16];

    uint64_t v15 = +[ICDocCamImageFilters localizedImageFilterNameForType:[(ICDocCamViewController *)self defaultFilter]];
    unint64_t v18 = [(ICDocCamViewController *)self filterButton];
    [v18 setAccessibilityValue:v15];
  }
  id v19 = [(ICDocCamViewController *)self filterButton];
  double v20 = [v19 accessibilityValue];
  uint64_t v21 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v21 setAccessibilityValue:v20];

  id v22 = [(ICDocCamViewController *)self filterButton];
  id v23 = [v22 accessibilityLabel];
  double v24 = [(ICDocCamViewController *)self filterButton];
  [v24 setLargeContentTitle:v23];

  id v25 = [(ICDocCamViewController *)self filterButtonForIPhone];
  id v26 = [v25 accessibilityLabel];
  id v27 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v27 setLargeContentTitle:v26];
}

- (void)updateAccessibilityForCurrentFlashMode
{
  int64_t v3 = [(ICDocCamViewController *)self flashMode];
  switch(v3)
  {
    case 2:
      id v33 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      uint64_t v7 = [v33 accessibilityTraits];
      uint64_t v8 = *MEMORY[0x263F1CF38];
      [v33 setAccessibilityTraits:v7 & ~*MEMORY[0x263F1CF38]];

      id v34 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      objc_msgSend(v34, "setAccessibilityTraits:", objc_msgSend(v34, "accessibilityTraits") & ~v8);

      id v35 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      objc_msgSend(v35, "setAccessibilityTraits:", objc_msgSend(v35, "accessibilityTraits") | v8);

      id v36 = +[DCLocalization localizedStringForKey:@"auto" value:@"auto" table:@"Localizable"];
      id v9 = [(ICDocCamViewController *)self flashButton];
      [v9 setAccessibilityValue:v36];
      goto LABEL_7;
    case 1:
      id v37 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      uint64_t v10 = [v37 accessibilityTraits];
      uint64_t v11 = *MEMORY[0x263F1CF38];
      [v37 setAccessibilityTraits:v10 & ~*MEMORY[0x263F1CF38]];

      id v38 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      objc_msgSend(v38, "setAccessibilityTraits:", objc_msgSend(v38, "accessibilityTraits") | v11);

      id v39 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      objc_msgSend(v39, "setAccessibilityTraits:", objc_msgSend(v39, "accessibilityTraits") & ~v11);

      id v36 = +[DCLocalization localizedStringForKey:@"on" value:@"on" table:@"Localizable"];
      id v9 = [(ICDocCamViewController *)self flashButton];
      [v9 setAccessibilityValue:v36];
LABEL_7:

      break;
    case 0:
      id v29 = +[DCLocalization localizedStringForKey:@"off" value:@"off" table:@"Localizable"];
      uint64_t v4 = [(ICDocCamViewController *)self flashButton];
      [v4 setAccessibilityValue:v29];

      id v30 = [(ICDocCamViewController *)self flashSettingViewOffButton];
      uint64_t v5 = [v30 accessibilityTraits];
      uint64_t v6 = *MEMORY[0x263F1CF38];
      [v30 setAccessibilityTraits:*MEMORY[0x263F1CF38] | v5];

      id v31 = [(ICDocCamViewController *)self flashSettingViewOnButton];
      objc_msgSend(v31, "setAccessibilityTraits:", objc_msgSend(v31, "accessibilityTraits") & ~v6);

      id v32 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
      objc_msgSend(v32, "setAccessibilityTraits:", objc_msgSend(v32, "accessibilityTraits") & ~v6);

      break;
  }
  if ([(ICDocCamViewController *)self flashSettingUIShowing])
  {
    id v40 = +[DCLocalization localizedStringForKey:@"Hide flash settings" value:@"Hide flash settings" table:@"Localizable"];
    id v12 = [(ICDocCamViewController *)self flashButton];
    [v12 setAccessibilityLabel:v40];

    id v41 = [(ICDocCamViewController *)self flashButton];
    [v41 setAccessibilityHint:0];
  }
  else
  {
    id v42 = +[DCLocalization localizedStringForKey:@"Show flash settings" value:@"Show flash settings" table:@"Localizable"];
    id v13 = [(ICDocCamViewController *)self flashButton];
    [v13 setAccessibilityLabel:v42];

    id v41 = +[DCLocalization localizedStringForKey:@"Double-tap to change the flash setting" value:@"Double-tap to change the flash setting" table:@"Localizable"];
    char v14 = [(ICDocCamViewController *)self flashButton];
    [v14 setAccessibilityHint:v41];
  }
  id v43 = +[DCLocalization localizedStringForKey:@"Double-tap to turn flash off" value:@"Double-tap to turn flash off" table:@"Localizable"];
  uint64_t v15 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  [v15 setAccessibilityHint:v43];

  id v44 = +[DCLocalization localizedStringForKey:@"Double-tap to turn flash on" value:@"Double-tap to turn flash on" table:@"Localizable"];
  id v16 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  [v16 setAccessibilityHint:v44];

  id v45 = +[DCLocalization localizedStringForKey:@"Double-tap to set flash to auto" value:@"Double-tap to set flash to auto" table:@"Localizable"];
  double v17 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  [v17 setAccessibilityHint:v45];

  id v46 = +[DCLocalization localizedStringForKey:@"Hide flash settings" value:@"Hide flash settings" table:@"Localizable"];
  unint64_t v18 = [(ICDocCamViewController *)self flashSettingViewFlashIcon];
  [v18 setAccessibilityLabel:v46];

  id v47 = [(ICDocCamViewController *)self flashButton];
  id v19 = [v47 accessibilityLabel];
  double v20 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v20 setAccessibilityLabel:v19];

  id v48 = [(ICDocCamViewController *)self flashButton];
  uint64_t v21 = [v48 accessibilityHint];
  id v22 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v22 setAccessibilityHint:v21];

  id v49 = [(ICDocCamViewController *)self flashButton];
  id v23 = [v49 accessibilityValue];
  double v24 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v24 setAccessibilityValue:v23];

  id v50 = [(ICDocCamViewController *)self flashSettingViewOffButton];
  [v50 _accessibilitySetIsSpeakThisElement:1];

  id v51 = [(ICDocCamViewController *)self flashSettingViewOnButton];
  [v51 _accessibilitySetIsSpeakThisElement:1];

  id v52 = [(ICDocCamViewController *)self flashSettingViewAutoButton];
  [v52 _accessibilitySetIsSpeakThisElement:1];

  id v53 = [(ICDocCamViewController *)self flashButton];
  id v25 = [v53 accessibilityLabel];
  id v26 = [(ICDocCamViewController *)self flashButton];
  [v26 setLargeContentTitle:v25];

  id v54 = [(ICDocCamViewController *)self flashButtonForIPhone];
  id v27 = [v54 accessibilityLabel];
  long long v28 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v28 setLargeContentTitle:v27];
}

- (void)updateAccessibilityForAutoShutterMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v14 userInterfaceIdiom];

  if (v5)
  {
    id v15 = [(ICDocCamViewController *)self autoButton];
    uint64_t v6 = [v15 accessibilityTraits];
    if (v3)
    {
      uint64_t v7 = *MEMORY[0x263F1CF38];
      [v15 setAccessibilityTraits:*MEMORY[0x263F1CF38] | v6];

      id v16 = [(ICDocCamViewController *)self manualButton];
      objc_msgSend(v16, "setAccessibilityTraits:", objc_msgSend(v16, "accessibilityTraits") & ~v7);

      id v17 = [(ICDocCamViewController *)self autoButton];
      [v17 setAccessibilityHint:0];

      id v18 = +[DCLocalization localizedStringForKey:@"Double-tap to change shutter mode to manual." value:@"Double-tap to change shutter mode to manual." table:@"Localizable"];
      uint64_t v8 = [(ICDocCamViewController *)self manualButton];
      [v8 setAccessibilityHint:v18];
    }
    else
    {
      uint64_t v11 = *MEMORY[0x263F1CF38];
      [v15 setAccessibilityTraits:v6 & ~*MEMORY[0x263F1CF38]];

      id v20 = [(ICDocCamViewController *)self manualButton];
      objc_msgSend(v20, "setAccessibilityTraits:", objc_msgSend(v20, "accessibilityTraits") | v11);

      id v21 = +[DCLocalization localizedStringForKey:@"Double-tap to change shutter mode to automatic." value:@"Double-tap to change shutter mode to automatic." table:@"Localizable"];
      id v12 = [(ICDocCamViewController *)self autoButton];
      [v12 setAccessibilityHint:v21];

      id v18 = [(ICDocCamViewController *)self manualButton];
      [v18 setAccessibilityHint:0];
    }
  }
  else
  {
    id v19 = +[DCLocalization localizedStringForKey:@"Double-tap to toggle shutter mode." value:@"Double-tap to toggle shutter mode." table:@"Localizable"];
    id v9 = [(ICDocCamViewController *)self autoButtonForIPhone];
    [v9 setAccessibilityHint:v19];

    id v18 = [(ICDocCamViewController *)self autoButtonForIPhone];
    uint64_t v10 = [v18 accessibilityTraits];
    [v18 setAccessibilityTraits:v10 & ~*MEMORY[0x263F1CF20]];
  }

  id v22 = +[DCLocalization localizedStringForKey:@"Take picture" value:@"Take picture" table:@"Localizable"];
  id v13 = [(ICDocCamViewController *)self shutterButton];
  [v13 setAccessibilityLabel:v22];
}

- (void)speakLabelTextForAccessibilityIfNecessary:(id)a3 afterDelay:(double)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    do
    {
      char v8 = [v7 isHidden];
      if (v8) {
        break;
      }
      uint64_t v9 = [v7 superview];

      uint64_t v7 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v7 = 0;
    char v8 = 0;
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__ICDocCamViewController_speakLabelTextForAccessibilityIfNecessary_afterDelay___block_invoke;
  void v12[3] = &unk_2642AA0D0;
  char v14 = v8;
  id v13 = v6;
  id v11 = v6;
  dispatch_after(v10, MEMORY[0x263EF83A0], v12);
}

void __79__ICDocCamViewController_speakLabelTextForAccessibilityIfNecessary_afterDelay___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) text];
    uint64_t v3 = [v2 length];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) text];
      objc_msgSend(v4, "dc_stringByReplacingNewlineCharactersWithWhiteSpace");
      id argument = (id)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
    }
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)updateRecentlyObservedRectanglesWithRect:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ICDocCamViewController *)self recentRectangleObservations];
    objc_sync_enter(v5);
    uint64_t v6 = [(ICDocCamViewController *)self recentRectangleObservations];
    [v6 addObject:v4];

    uint64_t v7 = [(ICDocCamViewController *)self recentRectangleObservations];
    unint64_t v8 = [v7 count];

    if (v8 < 6)
    {
LABEL_29:
      objc_sync_exit(v5);

      goto LABEL_30;
    }
    uint64_t v9 = [(ICDocCamViewController *)self recentRectangleObservations];
    [v9 removeObjectAtIndex:0];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    dispatch_time_t v10 = [(ICDocCamViewController *)self recentRectangleObservations];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v52;
      double v13 = 0.0;
      double v49 = 0.0;
      double v50 = 0.0;
      double v14 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          double v48 = v13;
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          [v16 topLeft];
          double v18 = v17;
          [v16 bottomLeft];
          double v20 = v19;
          [v16 topLeft];
          double v22 = v21;
          [v16 topRight];
          double v24 = v23;
          [v16 topRight];
          double v26 = v25;
          [v16 bottomRight];
          double v28 = v27;
          [v16 bottomLeft];
          double v30 = v29;
          [v16 bottomRight];
          double v14 = v14 + (v18 + v20) * 0.5;
          double v49 = v49 + (v26 + v28) * 0.5;
          double v50 = v50 + (v22 + v24) * 0.5;
          double v13 = v48 + (v30 + v31) * 0.5;
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 0.0;
      double v49 = 0.0;
      double v50 = 0.0;
      double v14 = 0.0;
    }

    id v32 = [(ICDocCamViewController *)self recentRectangleObservations];
    unint64_t v33 = [v32 count];

    id v34 = [(ICDocCamViewController *)self recentRectangleObservations];
    unint64_t v35 = [v34 count];

    id v36 = [(ICDocCamViewController *)self recentRectangleObservations];
    unint64_t v37 = [v36 count];

    id v38 = [(ICDocCamViewController *)self recentRectangleObservations];
    unint64_t v39 = [v38 count];

    id v40 = [MEMORY[0x263EFF910] date];
    id v41 = [(ICDocCamViewController *)self lastAXPositionAnnouncementDate];
    [v40 timeIntervalSinceDate:v41];
    if (v42 > 2.5)
    {
    }
    else
    {
      id v43 = [(ICDocCamViewController *)self lastAXPositionAnnouncementDate];
      BOOL v44 = v43 == 0;

      if (!v44)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if (v14 / (double)v33 >= 0.075)
    {
      if (v50 / (double)v35 <= 0.925)
      {
        if (v49 / (double)v37 <= 0.925)
        {
          if (v13 / (double)v39 >= 0.075)
          {
            id v47 = 0;
            __UIAccessibilitySpeakAndDoNotBeInterrupted((NSString *)+[DCLocalization localizedStringForKey:@"Hold camera still" value:@"Hold camera still" table:@"Localizable"]);
LABEL_27:
            [(ICDocCamViewController *)self setLastAXPositionAnnouncementDate:v40];

            goto LABEL_28;
          }
          id v45 = @"Move camera slightly down and hold still";
        }
        else
        {
          id v45 = @"Move camera slightly right and hold still";
        }
      }
      else
      {
        id v45 = @"Move camera slightly up and hold still";
      }
    }
    else
    {
      id v45 = @"Move camera slightly left and hold still";
    }
    id v46 = +[DCLocalization localizedStringForKey:v45 value:v45 table:@"Localizable"];
    if (v46)
    {
      id v47 = v46;
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v46);
    }
    else
    {
      id v47 = 0;
    }
    goto LABEL_27;
  }
LABEL_30:
}

- (void)speakScannedDocumentForAccessibilityIfNecessary
{
}

void __73__ICDocCamViewController_speakScannedDocumentForAccessibilityIfNecessary__block_invoke()
{
  id v0 = +[DCLocalization localizedStringForKey:@"Scanned Documents" value:@"Scanned Documents" table:@"Localizable"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v0);
}

- (void)updateAccessibilityEnabledStateForUIElements
{
  v24[7] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICDocCamViewController *)self flashButton];
  v24[0] = v3;
  id v4 = [(ICDocCamViewController *)self filterButton];
  v24[1] = v4;
  id v5 = [(ICDocCamViewController *)self autoButton];
  v24[2] = v5;
  uint64_t v6 = [(ICDocCamViewController *)self manualButton];
  v24[3] = v6;
  uint64_t v7 = [(ICDocCamViewController *)self flashButtonForIPhone];
  v24[4] = v7;
  unint64_t v8 = [(ICDocCamViewController *)self filterButtonForIPhone];
  v24[5] = v8;
  uint64_t v9 = [(ICDocCamViewController *)self autoButtonForIPhone];
  v24[6] = v9;
  dispatch_time_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    uint64_t v14 = *MEMORY[0x263F1CF20];
    uint64_t v15 = ~*MEMORY[0x263F1CF20];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v17, "isEnabled", (void)v19)) {
          uint64_t v18 = [v17 accessibilityTraits] & v15;
        }
        else {
          uint64_t v18 = v14 | [v17 accessibilityTraits];
        }
        [v17 setAccessibilityTraits:v18];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)updateFonts
{
  uint64_t v3 = *MEMORY[0x263F1D260];
  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", *MEMORY[0x263F1D260], 16.0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(ICDocCamViewController *)self userPromptLabel];
  [v4 setFont:v9];

  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 16.0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(ICDocCamViewController *)self filterNameFeedbackLabel];
  [v5 setFont:v10];

  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 14.0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(ICDocCamViewController *)self autoShutterOnLabel];
  [v6 setFont:v11];

  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 14.0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(ICDocCamViewController *)self autoShutterOffLabel];
  [v7 setFont:v12];

  objc_msgSend(MEMORY[0x263F1C658], "dc_preferredFontForTextStyle:adjustedForDefaultSize:", v3, 16.0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [(ICDocCamViewController *)self moveCameraCloserLabel];
  [v8 setFont:v13];
}

- (void)didRecognizeRectangleForAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    int v5 = [(ICDocCamViewController *)self hasCandidateRectanglesForAX];
    if (v3)
    {
      if ((v5 & 1) == 0)
      {
        [(ICDocCamViewController *)self setHasCandidateRectanglesForAX:1];
        [(ICDocCamViewController *)self setAxConsecutiveRecognizerStateCount:1];
      }
      if ([(ICDocCamViewController *)self axConsecutiveRecognizerStateCount] != 5) {
        goto LABEL_17;
      }
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x2020000000;
      uint64_t v6 = (id *)getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr;
      uint64_t v13 = getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr;
      if (!getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr)
      {
        uint64_t v7 = (void *)AXRuntimeLibrary();
        v11[3] = (uint64_t)dlsym(v7, "kAXAnnouncementEnteredValidStateSound");
        getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr = v11[3];
        uint64_t v6 = (id *)v11[3];
      }
      _Block_object_dispose(&v10, 8);
      if (v6) {
        goto LABEL_16;
      }
      int v5 = -[ICRemoteDocCamViewController viewDidLoad]();
    }
    if (v5)
    {
      [(ICDocCamViewController *)self setHasCandidateRectanglesForAX:0];
      [(ICDocCamViewController *)self setAxConsecutiveRecognizerStateCount:1];
    }
    if ([(ICDocCamViewController *)self axConsecutiveRecognizerStateCount] != 5) {
      goto LABEL_17;
    }
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v6 = (id *)getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr;
    uint64_t v13 = getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr;
    if (!getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr)
    {
      unint64_t v8 = (void *)AXRuntimeLibrary();
      v11[3] = (uint64_t)dlsym(v8, "kAXAnnouncementExitedValidStateSound");
      getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr = v11[3];
      uint64_t v6 = (id *)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v6)
    {
      id v9 = (_Unwind_Exception *)-[ICRemoteDocCamViewController viewDidLoad]();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
LABEL_16:
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], *v6);
LABEL_17:
    [(ICDocCamViewController *)self setAxConsecutiveRecognizerStateCount:[(ICDocCamViewController *)self axConsecutiveRecognizerStateCount] + 1];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  objc_msgSend(a3, "valueForKey:", @"animationCompletionBlockKey", a4);
  id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4) {
    v4[2]();
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if ([(ICDocCamViewController *)self useCustomThumbnailZoomTransition])
  {
    [(ICDocCamViewController *)self setUseCustomThumbnailZoomTransition:0];
    unint64_t v8 = [ICDocCamThumbnailZoomTransitionAnimator alloc];
    id v9 = [(ICDocCamViewController *)self imageForThumbnailZoom];
    uint64_t v10 = [(ICDocCamViewController *)self indexPathForThumbnailZoom];
    id v11 = [(ICDocCamViewController *)self thumbnailZoomCompletionBlock];
    uint64_t v12 = [(ICDocCamThumbnailZoomTransitionAnimator *)v8 initWithImage:v9 indexPath:v10 duration:v11 completion:0.5];

    [(ICDocCamThumbnailZoomTransitionAnimator *)v12 setPresenting:a4 == 1];
    [(ICDocCamViewController *)self setImageForThumbnailZoom:0];
  }
  else
  {
    BOOL v13 = [(ICDocCamViewController *)self useCustomRetakeTransition];
    if (a4 == 2 && v13)
    {
      [(ICDocCamViewController *)self setUseCustomRetakeTransition:0];
      uint64_t v14 = [ICDocCamRetakeTransitionAnimator alloc];
      uint64_t v15 = [(ICDocCamViewController *)self imageForRetake];
      id v16 = [(ICDocCamViewController *)self indexPathForRetake];
      double v17 = [(ICDocCamViewController *)self retakeCompletionBlock];
      uint64_t v12 = [(ICDocCamRetakeTransitionAnimator *)v14 initWithImage:v15 indexPath:v16 duration:v17 completion:0.28];

      [(ICDocCamThumbnailZoomTransitionAnimator *)v12 setPresenting:0];
      [(ICDocCamViewController *)self setImageForRetake:0];
    }
    else if ([(ICDocCamViewController *)self useCustomRecropTransition])
    {
      uint64_t v18 = [ICDocCamRecropTransitionAnimator alloc];
      long long v19 = [(ICDocCamViewController *)self filteredImageForRecrop];
      long long v20 = [(ICDocCamViewController *)self unfilteredImageForRecrop];
      int64_t v21 = [(ICDocCamViewController *)self orientationForRecrop];
      long long v22 = [(ICDocCamViewController *)self indexPathForRecrop];
      double v23 = [(ICDocCamRecropTransitionAnimator *)v18 initWithImage:v19 unfilteredImage:v20 orientation:v21 indexPath:v22 duration:0 completion:0.65];

      [(ICDocCamViewController *)self setFilteredImageForRecrop:0];
      [(ICDocCamViewController *)self setUnfilteredImageForRecrop:0];
      [(ICDocCamRecropTransitionAnimator *)v23 setPresenting:a4 == 1];
      if (![(ICDocCamRecropTransitionAnimator *)v23 presenting]) {
        [(ICDocCamViewController *)self setUseCustomRecropTransition:0];
      }
      uint64_t v12 = (ICDocCamThumbnailZoomTransitionAnimator *)v23;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

- (CGRect)zoomTargetForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(ICDocCamViewController *)self zoomTargetShouldUseCustomImageFrame])
  {
    [(ICDocCamViewController *)self zoomTargetCustomImageFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    id v13 = v4;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [(ICDocCamViewController *)self thumbnailContainerView];
    id v16 = [v15 collectionView];
    double v17 = [v16 collectionViewLayout];
    uint64_t v18 = DCDynamicCast(v14, (uint64_t)v17);

    if ([v18 compactLayout])
    {
      long long v19 = (void *)MEMORY[0x263F088C8];
      long long v20 = [(ICDocCamViewController *)self documentInfoCollection];
      int64_t v21 = [v20 docInfos];
      uint64_t v22 = objc_msgSend(v19, "indexPathForItem:inSection:", objc_msgSend(v21, "count") - 1, 0);

      id v13 = (id)v22;
    }
    double v23 = [(ICDocCamViewController *)self thumbnailViewController];
    double v24 = [v23 collectionView];
    double v25 = [v24 cellForItemAtIndexPath:v13];

    double v26 = [(ICDocCamViewController *)self thumbnailViewController];
    double v27 = [v26 collectionView];
    [v25 frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    id v36 = [(ICDocCamViewController *)self view];
    objc_msgSend(v27, "convertRect:toView:", v36, v29, v31, v33, v35);
    double v6 = v37;
    double v8 = v38;
    double v10 = v39;
    double v12 = v40;
  }
  double v41 = v6;
  double v42 = v8;
  double v43 = v10;
  double v44 = v12;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (void)toggleRecording:(id)a3
{
  id v4 = [(ICDocCamViewController *)self recordButton];
  [v4 setEnabled:0];

  double v5 = [(ICDocCamViewController *)self movieController];
  int v6 = [v5 isRecording];

  if (!v6)
  {
    if ([(ICDocCamViewController *)self autoMode])
    {
      double v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Scan Movie Recording" message:@"Recording only works with manual shutter mode." preferredStyle:1];
      double v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
      [v7 setImage:v8];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __42__ICDocCamViewController_toggleRecording___block_invoke;
      v18[3] = &unk_2642AA1C0;
      v18[4] = self;
      double v9 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:1 handler:v18];
      [v7 addAction:v9];

      [(ICDocCamViewController *)self presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      if ([(ICDocCamViewController *)self scanMovieRecordingDontShowWarning])
      {
        id v14 = [(ICDocCamViewController *)self movieController];
        [v14 startRecording];
        goto LABEL_3;
      }
      double v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Scan Movie Recording" message:@"Do not:\nRotate device.\nPut app into background.\nInvoke Split View or Slide Over mode.\nDo anything other than hit the Stop button." preferredStyle:1];
      double v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
      [v7 setImage:v10];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_2;
      v17[3] = &unk_2642AA1C0;
      v17[4] = self;
      double v11 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Do not show again" style:0 handler:v17];
      [v7 addAction:v11];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_3;
      v16[3] = &unk_2642AA1C0;
      void v16[4] = self;
      double v12 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Cancel" style:1 handler:v16];
      [v7 addAction:v12];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __42__ICDocCamViewController_toggleRecording___block_invoke_4;
      v15[3] = &unk_2642AA1C0;
      void v15[4] = self;
      id v13 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:v15];
      [v7 addAction:v13];

      [(ICDocCamViewController *)self presentViewController:v7 animated:1 completion:0];
    }

    return;
  }
  id v14 = [(ICDocCamViewController *)self movieController];
  [v14 stopRecording];
LABEL_3:
}

void __42__ICDocCamViewController_toggleRecording___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) recordButton];
  [v1 setEnabled:1];
}

void __42__ICDocCamViewController_toggleRecording___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setScanMovieRecordingDontShowWarning:1];
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"internalSettings.docCam.scanMovieRecording.doNotShowWarning"];

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 synchronize];

  id v4 = [*(id *)(a1 + 32) movieController];
  [v4 startRecording];
}

void __42__ICDocCamViewController_toggleRecording___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) recordButton];
  [v1 setEnabled:1];
}

void __42__ICDocCamViewController_toggleRecording___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) movieController];
  [v1 startRecording];
}

- (void)enableUIElementsForMovieRecording:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICDocCamViewController *)self flashButton];
  [v5 setEnabled:v3];

  id v6 = [(ICDocCamViewController *)self filterButton];
  [v6 setEnabled:v3];

  id v7 = [(ICDocCamViewController *)self autoButton];
  [v7 setEnabled:v3];

  id v8 = [(ICDocCamViewController *)self manualButton];
  [v8 setEnabled:v3];

  id v9 = [(ICDocCamViewController *)self shutterButton];
  [v9 setEnabled:v3];

  id v10 = [(ICDocCamViewController *)self cancelButton];
  [v10 setEnabled:v3];

  id v11 = [(ICDocCamViewController *)self flashButtonForIPhone];
  [v11 setEnabled:v3];

  id v12 = [(ICDocCamViewController *)self filterButtonForIPhone];
  [v12 setEnabled:v3];

  id v13 = [(ICDocCamViewController *)self autoButtonForIPhone];
  [v13 setEnabled:v3];

  id v14 = [(ICDocCamViewController *)self cancelButtonForIPhone];
  [v14 setEnabled:v3];
}

- (void)showErrorForMovieRecording:(id)a3
{
  id v4 = a3;
  Main = CFRunLoopGetMain();
  id v6 = (const void *)*MEMORY[0x263EFFE78];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __53__ICDocCamViewController_showErrorForMovieRecording___block_invoke;
  v8[3] = &unk_2642AA490;
  id v7 = v4;
  id v9 = v7;
  id v10 = self;
  CFRunLoopPerformBlock(Main, v6, v8);
}

void __53__ICDocCamViewController_showErrorForMovieRecording___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F1C3F8];
  BOOL v3 = [*(id *)(a1 + 32) localizedDescription];
  id v4 = [*(id *)(a1 + 32) localizedFailureReason];
  id v9 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"exclamationmark.triangle"];
  [v9 setImage:v5];

  id v6 = (void *)MEMORY[0x263F1C3F0];
  id v7 = +[DCLocalization localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
  id v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v9 addAction:v8];

  [*(id *)(a1 + 40) presentViewController:v9 animated:1 completion:0];
}

- (void)pauseCaptureSessionForMovieRecording
{
  id v4 = [(ICDocCamViewController *)self session];
  int v3 = [v4 isRunning];

  if (v3)
  {
    id v5 = [(ICDocCamViewController *)self session];
    [v5 stopRunning];
  }
}

- (void)resumeCaptureSessionForMovieRecording
{
  id v4 = [(ICDocCamViewController *)self session];
  char v3 = [v4 isRunning];

  if ((v3 & 1) == 0)
  {
    id v5 = [(ICDocCamViewController *)self session];
    [v5 startRunning];
  }
}

- (void)enableRecordButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICDocCamViewController *)self recordButton];
  [v4 setEnabled:v3];
}

- (void)changeRecordButtonTitle:(id)a3
{
  id v5 = a3;
  id v4 = [(ICDocCamViewController *)self recordButton];
  [v4 setTitle:v5 forState:0];
}

- (void)createCaptureEventInteractionIfNecessary
{
  BOOL v3 = [(ICDocCamViewController *)self captureEventInteraction];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263EFA988]);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __66__ICDocCamViewController_createCaptureEventInteractionIfNecessary__block_invoke;
    id v11 = &unk_2642AA4E0;
    objc_copyWeak(&v12, &location);
    id v5 = (void *)[v4 initWithEventHandler:&v8];
    -[ICDocCamViewController setCaptureEventInteraction:](self, "setCaptureEventInteraction:", v5, v8, v9, v10, v11);

    id v6 = [(ICDocCamViewController *)self view];
    id v7 = [(ICDocCamViewController *)self captureEventInteraction];
    [v6 addInteraction:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __66__ICDocCamViewController_createCaptureEventInteractionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleCaptureEventInteractionEvent:v3];
}

- (void)handleCaptureEventInteractionEvent:(id)a3
{
  id v8 = a3;
  id v4 = [(ICDocCamViewController *)self view];
  id v5 = [v4 window];
  char v6 = [v5 isKeyWindow];

  if (v6)
  {
    uint64_t v7 = [v8 phase];
    if (v7)
    {
      if (v7 == 1)
      {
        [(ICDocCamViewController *)self handlePhysicalButtonReleased];
      }
      else if (v7 == 2)
      {
        [(ICDocCamViewController *)self handlePhysicalButtonPressCancelled];
      }
    }
    else
    {
      [(ICDocCamViewController *)self handlePhysicalButtonPressed];
    }
  }
}

- (void)handlePhysicalButtonPressed
{
  id v4 = [(ICDocCamViewController *)self shutterButton];
  int v3 = [v4 isEnabled];
  if (((v3 ^ 1 | [v4 isTouchInside]) & 1) == 0)
  {
    [(ICDocCamViewController *)self setCapturingFromPhysicalButton:1];
    [v4 setHighlighted:1];
  }
}

- (void)handlePhysicalButtonReleased
{
  if ([(ICDocCamViewController *)self capturingFromPhysicalButton])
  {
    id v3 = [(ICDocCamViewController *)self shutterButton];
    [v3 setHighlighted:0];
    [(ICDocCamViewController *)self shutterButtonAction:0];
    [(ICDocCamViewController *)self setCapturingFromPhysicalButton:0];
  }
}

- (void)handlePhysicalButtonPressCancelled
{
  if ([(ICDocCamViewController *)self capturingFromPhysicalButton])
  {
    id v3 = [(ICDocCamViewController *)self shutterButton];
    [v3 setHighlighted:0];
    [(ICDocCamViewController *)self setCapturingFromPhysicalButton:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)removeSaveActionBlockerForFiles
{
  id v2 = [(ICDocCamViewController *)self processRequestsBlocker];
  [v2 removeBlockerOfType:@"SaveActionBlocker"];
}

- (ICDocCamViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICDocCamThumbnailContainerView)thumbnailContainerView
{
  return self->_thumbnailContainerView;
}

- (void)setThumbnailContainerView:(id)a3
{
}

- (ICDocCamThumbnailCollectionViewController)thumbnailViewController
{
  return self->_thumbnailViewController;
}

- (void)setThumbnailViewController:(id)a3
{
}

- (int64_t)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(int64_t)a3
{
  self->_setupResult = a3;
}

- (ICDocCamPreviewView)previewView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewView);

  return (ICDocCamPreviewView *)WeakRetained;
}

- (void)setPreviewView:(id)a3
{
}

- (UIView)cameraUnavailableScrim
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraUnavailableScrim);

  return (UIView *)WeakRetained;
}

- (void)setCameraUnavailableScrim:(id)a3
{
}

- (UIView)cameraUnavailableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraUnavailableView);

  return (UIView *)WeakRetained;
}

- (void)setCameraUnavailableView:(id)a3
{
}

- (UILabel)cameraUnavailableLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraUnavailableLabel);

  return (UILabel *)WeakRetained;
}

- (void)setCameraUnavailableLabel:(id)a3
{
}

- (UIButton)resumeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resumeButton);

  return (UIButton *)WeakRetained;
}

- (void)setResumeButton:(id)a3
{
}

- (ICDocCamShutterButton)shutterButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shutterButton);

  return (ICDocCamShutterButton *)WeakRetained;
}

- (void)setShutterButton:(id)a3
{
}

- (NSLayoutConstraint)shutterButtonBottomConstraintForPortraitIPhone
{
  return self->_shutterButtonBottomConstraintForPortraitIPhone;
}

- (void)setShutterButtonBottomConstraintForPortraitIPhone:(id)a3
{
}

- (NSLayoutConstraint)shutterButtonBottomConstraintForLandscapeIPhone
{
  return self->_shutterButtonBottomConstraintForLandscapeIPhone;
}

- (void)setShutterButtonBottomConstraintForLandscapeIPhone:(id)a3
{
}

- (UIView)autoShutterOnView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOnView);

  return (UIView *)WeakRetained;
}

- (void)setAutoShutterOnView:(id)a3
{
}

- (UILabel)autoShutterOnLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOnLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAutoShutterOnLabel:(id)a3
{
}

- (NSLayoutConstraint)autoShutterOnTopLayoutConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOnTopLayoutConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAutoShutterOnTopLayoutConstraint:(id)a3
{
}

- (UIView)autoShutterOffView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOffView);

  return (UIView *)WeakRetained;
}

- (void)setAutoShutterOffView:(id)a3
{
}

- (UILabel)autoShutterOffLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOffLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAutoShutterOffLabel:(id)a3
{
}

- (NSLayoutConstraint)autoShutterOffTopLayoutConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoShutterOffTopLayoutConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAutoShutterOffTopLayoutConstraint:(id)a3
{
}

- (UIView)filterNameFeedbackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterNameFeedbackView);

  return (UIView *)WeakRetained;
}

- (void)setFilterNameFeedbackView:(id)a3
{
}

- (UILabel)filterNameFeedbackLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterNameFeedbackLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFilterNameFeedbackLabel:(id)a3
{
}

- (NSLayoutConstraint)filterNameFeedbackViewTopLayoutConstraint
{
  return self->_filterNameFeedbackViewTopLayoutConstraint;
}

- (void)setFilterNameFeedbackViewTopLayoutConstraint:(id)a3
{
}

- (ICDocCamOverlayView)overlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayView);

  return (ICDocCamOverlayView *)WeakRetained;
}

- (void)setOverlayView:(id)a3
{
}

- (UIView)userPromptView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userPromptView);

  return (UIView *)WeakRetained;
}

- (void)setUserPromptView:(id)a3
{
}

- (UILabel)userPromptLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userPromptLabel);

  return (UILabel *)WeakRetained;
}

- (void)setUserPromptLabel:(id)a3
{
}

- (UIView)moveCameraCloserView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moveCameraCloserView);

  return (UIView *)WeakRetained;
}

- (void)setMoveCameraCloserView:(id)a3
{
}

- (UILabel)moveCameraCloserLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moveCameraCloserLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMoveCameraCloserLabel:(id)a3
{
}

- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPad
{
  return self->_thumbnailContainerViewLeadingConstraintForIPad;
}

- (void)setThumbnailContainerViewLeadingConstraintForIPad:(id)a3
{
}

- (NSLayoutConstraint)thumbnailContainerViewTrailingConstraintForIPad
{
  return self->_thumbnailContainerViewTrailingConstraintForIPad;
}

- (void)setThumbnailContainerViewTrailingConstraintForIPad:(id)a3
{
}

- (NSLayoutConstraint)thumbnailContainerViewBottomConstraintForIPhone
{
  return self->_thumbnailContainerViewBottomConstraintForIPhone;
}

- (void)setThumbnailContainerViewBottomConstraintForIPhone:(id)a3
{
}

- (NSLayoutConstraint)thumbnailContainerViewLeadingConstraintForIPhone
{
  return self->_thumbnailContainerViewLeadingConstraintForIPhone;
}

- (void)setThumbnailContainerViewLeadingConstraintForIPhone:(id)a3
{
}

- (UIView)scrimView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrimView);

  return (UIView *)WeakRetained;
}

- (void)setScrimView:(id)a3
{
}

- (UIButton)cancelButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButton);

  return (UIButton *)WeakRetained;
}

- (void)setCancelButton:(id)a3
{
}

- (ICDocCamSaveButton)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (NSLayoutConstraint)saveButtonLandscapeVerticalConstraintForIPhone
{
  return self->_saveButtonLandscapeVerticalConstraintForIPhone;
}

- (void)setSaveButtonLandscapeVerticalConstraintForIPhone:(id)a3
{
}

- (NSLayoutConstraint)saveButtonLandscapeTrailingConstraintForIPhone
{
  return self->_saveButtonLandscapeTrailingConstraintForIPhone;
}

- (void)setSaveButtonLandscapeTrailingConstraintForIPhone:(id)a3
{
}

- (UIButton)autoButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoButton);

  return (UIButton *)WeakRetained;
}

- (void)setAutoButton:(id)a3
{
}

- (UIButton)manualButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manualButton);

  return (UIButton *)WeakRetained;
}

- (void)setManualButton:(id)a3
{
}

- (UIButton)flashButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashButton);

  return (UIButton *)WeakRetained;
}

- (void)setFlashButton:(id)a3
{
}

- (UIButton)filterButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterButton);

  return (UIButton *)WeakRetained;
}

- (void)setFilterButton:(id)a3
{
}

- (BOOL)filterSettingUIShowing
{
  return self->_filterSettingUIShowing;
}

- (void)setFilterSettingUIShowing:(BOOL)a3
{
  self->_filterSettingUIShowing = a3;
}

- (BOOL)capturingFromPhysicalButton
{
  return self->_capturingFromPhysicalButton;
}

- (void)setCapturingFromPhysicalButton:(BOOL)a3
{
  self->_capturingFromPhysicalButton = a3;
}

- (UIView)flashSettingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingView);

  return (UIView *)WeakRetained;
}

- (void)setFlashSettingView:(id)a3
{
}

- (NSLayoutConstraint)flashSettingViewHeightConstraint
{
  return self->_flashSettingViewHeightConstraint;
}

- (void)setFlashSettingViewHeightConstraint:(id)a3
{
}

- (UIView)flashSettingButtonView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingButtonView);

  return (UIView *)WeakRetained;
}

- (void)setFlashSettingButtonView:(id)a3
{
}

- (UIButton)flashSettingViewFlashIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingViewFlashIcon);

  return (UIButton *)WeakRetained;
}

- (void)setFlashSettingViewFlashIcon:(id)a3
{
}

- (UIButton)flashSettingViewAutoButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingViewAutoButton);

  return (UIButton *)WeakRetained;
}

- (void)setFlashSettingViewAutoButton:(id)a3
{
}

- (UIButton)flashSettingViewOnButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingViewOnButton);

  return (UIButton *)WeakRetained;
}

- (void)setFlashSettingViewOnButton:(id)a3
{
}

- (UIButton)flashSettingViewOffButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingViewOffButton);

  return (UIButton *)WeakRetained;
}

- (void)setFlashSettingViewOffButton:(id)a3
{
}

- (NSLayoutConstraint)flashSettingWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashSettingWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFlashSettingWidthConstraint:(id)a3
{
}

- (BOOL)flashSettingUIShowing
{
  return self->_flashSettingUIShowing;
}

- (void)setFlashSettingUIShowing:(BOOL)a3
{
  self->_flashSettingUIShowing = a3;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AVCaptureDeviceInput)videoDeviceInput
{
  return self->_videoDeviceInput;
}

- (void)setVideoDeviceInput:(id)a3
{
}

- (AVCapturePhotoSettings)photoSettings
{
  return self->_photoSettings;
}

- (void)setPhotoSettings:(id)a3
{
}

- (AVCapturePhotoOutput)photoOutput
{
  return self->_photoOutput;
}

- (void)setPhotoOutput:(id)a3
{
}

- (NSMutableDictionary)inProgressPhotoCaptureDelegates
{
  return self->_inProgressPhotoCaptureDelegates;
}

- (void)setInProgressPhotoCaptureDelegates:(id)a3
{
}

- (AVCaptureVideoDataOutput)videoDataOutput
{
  return self->_videoDataOutput;
}

- (void)setVideoDataOutput:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoPreviewLayer);

  return (AVCaptureVideoPreviewLayer *)WeakRetained;
}

- (void)setVideoPreviewLayer:(id)a3
{
}

- (int64_t)statusBarOrientation
{
  return self->_statusBarOrientation;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  self->_statusBarOrientation = a3;
}

- (CGSize)viewBoundsSize
{
  double width = self->_viewBoundsSize.width;
  double height = self->_viewBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewBoundsSize:(CGSize)a3
{
  self->_viewBoundsSize = a3;
}

- (UIColor)cameraHighlightColor
{
  return self->_cameraHighlightColor;
}

- (void)setCameraHighlightColor:(id)a3
{
}

- (BOOL)isSessionRunning
{
  return self->_sessionRunning;
}

- (void)setSessionRunning:(BOOL)a3
{
  self->_sessionRunning = a3;
}

- (ICDocCamImageSequenceAnalyzer)vkAnalyzer
{
  return self->_vkAnalyzer;
}

- (void)setVkAnalyzer:(id)a3
{
}

- (ICDocCamRectangleResultsQueue)rectResultsQueue
{
  return (ICDocCamRectangleResultsQueue *)objc_getProperty(self, a2, 1616, 1);
}

- (void)setRectResultsQueue:(id)a3
{
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (float)pixelFocalLength
{
  return self->_pixelFocalLength;
}

- (void)setPixelFocalLength:(float)a3
{
  self->_pixelFocalLength = a3;
}

- (NSData)cameraIntrinsicData
{
  return self->_cameraIntrinsicData;
}

- (void)setCameraIntrinsicData:(id)a3
{
}

- (BOOL)hideUserPrompt
{
  return self->_hideUserPrompt;
}

- (void)setHideUserPrompt:(BOOL)a3
{
  self->_hideUserPrompt = a3;
}

- (BOOL)adjustingFocus
{
  return self->_adjustingFocus;
}

- (void)setAdjustingFocus:(BOOL)a3
{
  self->_adjustingFocus = a3;
}

- (NSDate)lastSubjectAreaChange
{
  return (NSDate *)objc_getProperty(self, a2, 1640, 1);
}

- (void)setLastSubjectAreaChange:(id)a3
{
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
}

- (int64_t)retakeIndex
{
  return self->_retakeIndex;
}

- (void)setRetakeIndex:(int64_t)a3
{
  self->_retakeIndeCGFloat x = a3;
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void)setSharedCoreImageContext:(id)a3
{
}

- (NSLayoutConstraint)userPromptViewVerticalConstraint
{
  return self->_userPromptViewVerticalConstraint;
}

- (void)setUserPromptViewVerticalConstraint:(id)a3
{
}

- (NSLayoutConstraint)moveCameraCloserViewVerticalConstraint
{
  return self->_moveCameraCloserViewVerticalConstraint;
}

- (void)setMoveCameraCloserViewVerticalConstraint:(id)a3
{
}

- (ICDocCamDocumentInfo)markupDocumentInfo
{
  return self->_markupDocumentInfo;
}

- (void)setMarkupDocumentInfo:(id)a3
{
}

- (id)markupDismissCompletionBlock
{
  return self->_markupDismissCompletionBlock;
}

- (void)setMarkupDismissCompletionBlock:(id)a3
{
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (float)rectangleMinimumAspectRatio
{
  return self->_rectangleMinimumAspectRatio;
}

- (void)setRectangleMinimumAspectRatio:(float)a3
{
  self->_rectangleMinimumAspectRatio = a3;
}

- (float)rectangleMaximumAspectRatio
{
  return self->_rectangleMaximumAspectRatio;
}

- (void)setRectangleMaximumAspectRatio:(float)a3
{
  self->_rectangleMaximumAspectRatio = a3;
}

- (float)rectangleQuadratureTolerance
{
  return self->_rectangleQuadratureTolerance;
}

- (void)setRectangleQuadratureTolerance:(float)a3
{
  self->_rectangleQuadratureTolerance = a3;
}

- (float)rectangleMinimumSize
{
  return self->_rectangleMinimumSize;
}

- (void)setRectangleMinimumSize:(float)a3
{
  self->_rectangleMinimumSize = a3;
}

- (float)rectangleMinimumConfidence
{
  return self->_rectangleMinimumConfidence;
}

- (void)setRectangleMinimumConfidence:(float)a3
{
  self->_rectangleMinimumConfidence = a3;
}

- (float)rectangleMinimumVisualConfidence
{
  return self->_rectangleMinimumVisualConfidence;
}

- (void)setRectangleMinimumVisualConfidence:(float)a3
{
  self->_rectangleMinimumVisualConfidence = a3;
}

- (int64_t)rectangleMaximumNumber
{
  return self->_rectangleMaximumNumber;
}

- (void)setRectangleMaximumNumber:(int64_t)a3
{
  self->_rectangleMaximumNumber = a3;
}

- (float)rectangleStabilityStdDev
{
  return self->_rectangleStabilityStdDev;
}

- (void)setRectangleStabilityStdDev:(float)a3
{
  self->_rectangleStabilityStdDev = a3;
}

- (float)segmentMinimumVisualConfidence
{
  return self->_segmentMinimumVisualConfidence;
}

- (void)setSegmentMinimumVisualConfidence:(float)a3
{
  self->_segmentMinimumVisualConfidence = a3;
}

- (float)segmentMinimumVisualConfidence60Frames
{
  return self->_segmentMinimumVisualConfidence60Frames;
}

- (void)setSegmentMinimumVisualConfidence60Frames:(float)a3
{
  self->_segmentMinimumVisualConfidence60Frames = a3;
}

- (float)segmentMinimumVisualConfidenceFinalScan
{
  return self->_segmentMinimumVisualConfidenceFinalScan;
}

- (void)setSegmentMinimumVisualConfidenceFinalScan:(float)a3
{
  self->_segmentMinimumVisualConfidenceFinalScan = a3;
}

- (float)segmentStabilityStdDev
{
  return self->_segmentStabilityStdDev;
}

- (void)setSegmentStabilityStdDev:(float)a3
{
  self->_segmentStabilityStdDev = a3;
}

- (float)segmentationFudgeFactor
{
  return self->_segmentationFudgeFactor;
}

- (void)setSegmentationFudgeFactor:(float)a3
{
  self->_segmentationFudgeFactor = a3;
}

- (CGPoint)segmentTopLeft
{
  objc_copyStruct(v4, &self->_segmentTopLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setSegmentTopLeft:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_segmentTopLeft, &v3, 16, 1, 0);
}

- (CGPoint)segmentTopRight
{
  objc_copyStruct(v4, &self->_segmentTopRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setSegmentTopRight:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_segmentTopRight, &v3, 16, 1, 0);
}

- (CGPoint)segmentBottomLeft
{
  objc_copyStruct(v4, &self->_segmentBottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setSegmentBottomLeft:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_segmentBottomLeft, &v3, 16, 1, 0);
}

- (CGPoint)segmentBottomRight
{
  objc_copyStruct(v4, &self->_segmentBottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setSegmentBottomRight:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_segmentBottomRight, &v3, 16, 1, 0);
}

- (BOOL)segmentMeanComputed
{
  return self->_segmentMeanComputed;
}

- (void)setSegmentMeanComputed:(BOOL)a3
{
  self->_segmentMeanComputed = a3;
}

- (BOOL)rectangleDetectionEnabled
{
  return self->_rectangleDetectionEnabled;
}

- (void)setRectangleDetectionEnabled:(BOOL)a3
{
  self->_rectangleDetectionEnabled = a3;
}

- (BOOL)registrationEnabled
{
  return self->_registrationEnabled;
}

- (void)setRegistrationEnabled:(BOOL)a3
{
  self->_registrationEnabled = a3;
}

- (BOOL)debugRectanglesEnabled
{
  return self->_debugRectanglesEnabled;
}

- (void)setDebugRectanglesEnabled:(BOOL)a3
{
  self->_debugRectanglesEnabled = a3;
}

- (BOOL)displayStringEnabled
{
  return self->_displayStringEnabled;
}

- (void)setDisplayStringEnabled:(BOOL)a3
{
  self->_displayStringEnabled = a3;
}

- (BOOL)realTimeRectangleDetection
{
  return self->_realTimeRectangleDetection;
}

- (void)setRealTimeRectangleDetection:(BOOL)a3
{
  self->_realTimeRectangleDetection = a3;
}

- (BOOL)synchronousRectangleDetection
{
  return self->_synchronousRectangleDetection;
}

- (void)setSynchronousRectangleDetection:(BOOL)a3
{
  self->_synchronousRectangleDetection = a3;
}

- (int64_t)queueSizeForRectangleDetection
{
  return self->_queueSizeForRectangleDetection;
}

- (void)setQueueSizeForRectangleDetection:(int64_t)a3
{
  self->_queueSizeForRectangleDetection = a3;
}

- (ICDocCamProcessingBlocker)processRequestsBlocker
{
  return self->_processRequestsBlocker;
}

- (void)setProcessRequestsBlocker:(id)a3
{
}

- (ICDocCamProcessingBlocker)snapStillImageBlocker
{
  return self->_snapStillImageBlocker;
}

- (void)setSnapStillImageBlocker:(id)a3
{
}

- (BOOL)didWarnAboutMaxScans
{
  return self->_didWarnAboutMaxScans;
}

- (void)setDidWarnAboutMaxScans:(BOOL)a3
{
  self->_didWarnAboutMaxScans = a3;
}

- (BOOL)isObservingCaptureSession
{
  return self->_isObservingCaptureSession;
}

- (void)setIsObservingCaptureSession:(BOOL)a3
{
  self->_isObservingCaptureSession = a3;
}

- (BOOL)didAddAppLifetimeObservers
{
  return self->_didAddAppLifetimeObservers;
}

- (void)setDidAddAppLifetimeObservers:(BOOL)a3
{
  self->_didAddAppLifetimeObservers = a3;
}

- (int64_t)snapStillImageMode
{
  return self->_snapStillImageMode;
}

- (void)setSnapStillImageMode:(int64_t)a3
{
  self->_snapStillImageMode = a3;
}

- (ICDocCamImageQuad)backupQuad
{
  return self->_backupQuad;
}

- (void)setBackupQuad:(id)a3
{
}

- (VNRectangleObservation)lastHighConfidenceRectangle
{
  return self->_lastHighConfidenceRectangle;
}

- (void)setLastHighConfidenceRectangle:(id)a3
{
}

- (NSMutableArray)filterButtons
{
  return self->_filterButtons;
}

- (void)setFilterButtons:(id)a3
{
}

- (UIView)filterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterView);

  return (UIView *)WeakRetained;
}

- (void)setFilterView:(id)a3
{
}

- (UIButton)filterViewButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterViewButton);

  return (UIButton *)WeakRetained;
}

- (void)setFilterViewButton:(id)a3
{
}

- (NSArray)filterNames
{
  return self->_filterNames;
}

- (void)setFilterNames:(id)a3
{
}

- (UIView)filterViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setFilterViewContainer:(id)a3
{
}

- (NSLayoutConstraint)filterViewContainerHeightConstraint
{
  return self->_filterViewContainerHeightConstraint;
}

- (void)setFilterViewContainerHeightConstraint:(id)a3
{
}

- (UIScrollView)filterScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setFilterScrollView:(id)a3
{
}

- (UIView)filterScrollViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterScrollViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setFilterScrollViewContainer:(id)a3
{
}

- (NSLayoutConstraint)filterViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterViewLeadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFilterViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)filterViewTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterViewTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFilterViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)filterViewContainerWidthConstraint
{
  return self->_filterViewContainerWidthConstraint;
}

- (void)setFilterViewContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)topToolbarForIPhoneHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topToolbarForIPhoneHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTopToolbarForIPhoneHeightConstraint:(id)a3
{
}

- (UIView)topToolbarForIPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topToolbarForIPhone);

  return (UIView *)WeakRetained;
}

- (void)setTopToolbarForIPhone:(id)a3
{
}

- (UIButton)cancelButtonForIPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelButtonForIPhone);

  return (UIButton *)WeakRetained;
}

- (void)setCancelButtonForIPhone:(id)a3
{
}

- (UIButton)flashButtonForIPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashButtonForIPhone);

  return (UIButton *)WeakRetained;
}

- (void)setFlashButtonForIPhone:(id)a3
{
}

- (UIButton)filterButtonForIPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterButtonForIPhone);

  return (UIButton *)WeakRetained;
}

- (void)setFilterButtonForIPhone:(id)a3
{
}

- (UIButton)autoButtonForIPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_autoButtonForIPhone);

  return (UIButton *)WeakRetained;
}

- (void)setAutoButtonForIPhone:(id)a3
{
}

- (NSLayoutConstraint)cancelButtonForIPhoneLeadingConstraint
{
  return self->_cancelButtonForIPhoneLeadingConstraint;
}

- (void)setCancelButtonForIPhoneLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)autoButtonForIPhoneTrailingConstraint
{
  return self->_autoButtonForIPhoneTrailingConstraint;
}

- (void)setAutoButtonForIPhoneTrailingConstraint:(id)a3
{
}

- (signed)defaultFilter
{
  return self->_defaultFilter;
}

- (void)setDefaultFilter:(signed __int16)a3
{
  self->_defaultFilter = a3;
}

- (NSMutableArray)recentRectangleObservations
{
  return self->_recentRectangleObservations;
}

- (void)setRecentRectangleObservations:(id)a3
{
}

- (NSDate)lastAXPositionAnnouncementDate
{
  return self->_lastAXPositionAnnouncementDate;
}

- (void)setLastAXPositionAnnouncementDate:(id)a3
{
}

- (BOOL)hasCandidateRectanglesForAX
{
  return self->_hasCandidateRectanglesForAX;
}

- (void)setHasCandidateRectanglesForAX:(BOOL)a3
{
  self->_hasCandidateRectanglesForAX = a3;
}

- (unint64_t)axConsecutiveRecognizerStateCount
{
  return self->_axConsecutiveRecognizerStateCount;
}

- (void)setAxConsecutiveRecognizerStateCount:(unint64_t)a3
{
  self->_axConsecutiveRecognizerStateCount = a3;
}

- (NSMutableArray)iPadLayoutConstraints
{
  return self->_iPadLayoutConstraints;
}

- (void)setIPadLayoutConstraints:(id)a3
{
}

- (NSMutableArray)iPhonePortraitLayoutConstraints
{
  return self->_iPhonePortraitLayoutConstraints;
}

- (void)setIPhonePortraitLayoutConstraints:(id)a3
{
}

- (NSMutableArray)iPhoneLandscapeLayoutConstraints
{
  return self->_iPhoneLandscapeLayoutConstraints;
}

- (void)setIPhoneLandscapeLayoutConstraints:(id)a3
{
}

- (NSMutableArray)iPhoneCompactLandscapeLayoutConstraints
{
  return self->_iPhoneCompactLandscapeLayoutConstraints;
}

- (void)setIPhoneCompactLandscapeLayoutConstraints:(id)a3
{
}

- (AVCaptureEventInteraction)captureEventInteraction
{
  return self->_captureEventInteraction;
}

- (void)setCaptureEventInteraction:(id)a3
{
}

- (CGSize)streamingImageSize
{
  double width = self->_streamingImageSize.width;
  double height = self->_streamingImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setStreamingImageSize:(CGSize)a3
{
  self->_streamingImageSize = a3;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (OS_dispatch_semaphore)flashAndFilterUISemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 2000, 1);
}

- (void)setFlashAndFilterUISemaphore:(id)a3
{
}

- (BOOL)useCustomThumbnailZoomTransition
{
  return self->_useCustomThumbnailZoomTransition;
}

- (void)setUseCustomThumbnailZoomTransition:(BOOL)a3
{
  self->_useCustomThumbnailZoomTransition = a3;
}

- (NSIndexPath)indexPathForThumbnailZoom
{
  return self->_indexPathForThumbnailZoom;
}

- (void)setIndexPathForThumbnailZoom:(id)a3
{
}

- (UIImage)imageForThumbnailZoom
{
  return self->_imageForThumbnailZoom;
}

- (void)setImageForThumbnailZoom:(id)a3
{
}

- (id)thumbnailZoomCompletionBlock
{
  return self->_thumbnailZoomCompletionBlock;
}

- (void)setThumbnailZoomCompletionBlock:(id)a3
{
}

- (BOOL)zoomTargetShouldUseCustomImageFrame
{
  return self->_zoomTargetShouldUseCustomImageFrame;
}

- (void)setZoomTargetShouldUseCustomImageFrame:(BOOL)a3
{
  self->_zoomTargetShouldUseCustomImageFrame = a3;
}

- (CGRect)zoomTargetCustomImageFrame
{
  double x = self->_zoomTargetCustomImageFrame.origin.x;
  double y = self->_zoomTargetCustomImageFrame.origin.y;
  double width = self->_zoomTargetCustomImageFrame.size.width;
  double height = self->_zoomTargetCustomImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomTargetCustomImageFrame:(CGRect)a3
{
  self->_zoomTargetCustomImageFrame = a3;
}

- (BOOL)useCustomRetakeTransition
{
  return self->_useCustomRetakeTransition;
}

- (void)setUseCustomRetakeTransition:(BOOL)a3
{
  self->_useCustomRetakeTransition = a3;
}

- (NSIndexPath)indexPathForRetake
{
  return self->_indexPathForRetake;
}

- (void)setIndexPathForRetake:(id)a3
{
}

- (UIImage)imageForRetake
{
  return self->_imageForRetake;
}

- (void)setImageForRetake:(id)a3
{
}

- (id)retakeCompletionBlock
{
  return self->_retakeCompletionBlock;
}

- (void)setRetakeCompletionBlock:(id)a3
{
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
}

- (id)sessionStartNotificationBlock
{
  return self->_sessionStartNotificationBlock;
}

- (void)setSessionStartNotificationBlock:(id)a3
{
}

- (BOOL)captureDebugDone
{
  return self->_captureDebugDone;
}

- (void)setCaptureDebugDone:(BOOL)a3
{
  self->_captureDebugDone = a3;
}

- (OS_dispatch_queue)snapshotSpinnerQueue
{
  return self->_snapshotSpinnerQueue;
}

- (void)setSnapshotSpinnerQueue:(id)a3
{
}

- (ICDocCamSpinner)snapshotSpinner
{
  return self->_snapshotSpinner;
}

- (void)setSnapshotSpinner:(id)a3
{
}

- (BOOL)awaitingSnapshotCompletion
{
  return self->_awaitingSnapshotCompletion;
}

- (void)setAwaitingSnapshotCompletion:(BOOL)a3
{
  self->_awaitingSnapshotCompletion = a3;
}

- (ICDocCamDebugMovieController)movieController
{
  return self->_movieController;
}

- (void)setMovieController:(id)a3
{
}

- (int64_t)referenceOrientation
{
  return self->_referenceOrientation;
}

- (void)setReferenceOrientation:(int64_t)a3
{
  self->_referenceOrientation = a3;
}

- (AVCaptureConnection)videoConnection
{
  return self->_videoConnection;
}

- (void)setVideoConnection:(id)a3
{
}

- (UIButton)recordButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordButton);

  return (UIButton *)WeakRetained;
}

- (void)setRecordButton:(id)a3
{
}

- (BOOL)scanMovieRecordingEnabled
{
  return self->_scanMovieRecordingEnabled;
}

- (void)setScanMovieRecordingEnabled:(BOOL)a3
{
  self->_scanMovieRecordingEnabled = a3;
}

- (BOOL)scanMovieRecordingDontShowWarning
{
  return self->_scanMovieRecordingDontShowWarning;
}

- (void)setScanMovieRecordingDontShowWarning:(BOOL)a3
{
  self->_scanMovieRecordingDontShowWarning = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordButton);
  objc_storeStrong((id *)&self->_videoConnection, 0);
  objc_storeStrong((id *)&self->_movieController, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);
  objc_storeStrong((id *)&self->_snapshotSpinnerQueue, 0);
  objc_storeStrong(&self->_sessionStartNotificationBlock, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_storeStrong(&self->_retakeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageForRetake, 0);
  objc_storeStrong((id *)&self->_indexPathForRetake, 0);
  objc_storeStrong(&self->_thumbnailZoomCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageForThumbnailZoom, 0);
  objc_storeStrong((id *)&self->_indexPathForThumbnailZoom, 0);
  objc_storeStrong((id *)&self->_flashAndFilterUISemaphore, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_captureEventInteraction, 0);
  objc_storeStrong((id *)&self->_iPhoneCompactLandscapeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPhoneLandscapeLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPhonePortraitLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_iPadLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_lastAXPositionAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_recentRectangleObservations, 0);
  objc_storeStrong((id *)&self->_autoButtonForIPhoneTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonForIPhoneLeadingConstraint, 0);
  objc_destroyWeak((id *)&self->_autoButtonForIPhone);
  objc_destroyWeak((id *)&self->_filterButtonForIPhone);
  objc_destroyWeak((id *)&self->_flashButtonForIPhone);
  objc_destroyWeak((id *)&self->_cancelButtonForIPhone);
  objc_destroyWeak((id *)&self->_topToolbarForIPhone);
  objc_destroyWeak((id *)&self->_topToolbarForIPhoneHeightConstraint);
  objc_storeStrong((id *)&self->_filterViewContainerWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_filterViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_filterViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_filterScrollViewContainer);
  objc_destroyWeak((id *)&self->_filterScrollView);
  objc_storeStrong((id *)&self->_filterViewContainerHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_filterViewContainer);
  objc_storeStrong((id *)&self->_filterNames, 0);
  objc_destroyWeak((id *)&self->_filterViewButton);
  objc_destroyWeak((id *)&self->_filterView);
  objc_storeStrong((id *)&self->_filterButtons, 0);
  objc_storeStrong((id *)&self->_lastHighConfidenceRectangle, 0);
  objc_storeStrong((id *)&self->_backupQuad, 0);
  objc_storeStrong((id *)&self->_snapStillImageBlocker, 0);
  objc_storeStrong((id *)&self->_processRequestsBlocker, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong(&self->_markupDismissCompletionBlock, 0);
  objc_storeStrong((id *)&self->_markupDocumentInfo, 0);
  objc_storeStrong((id *)&self->_moveCameraCloserViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_userPromptViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_sharedCoreImageContext, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_lastSubjectAreaChange, 0);
  objc_storeStrong((id *)&self->_cameraIntrinsicData, 0);
  objc_storeStrong((id *)&self->_rectResultsQueue, 0);
  objc_storeStrong((id *)&self->_vkAnalyzer, 0);
  objc_storeStrong((id *)&self->_cameraHighlightColor, 0);
  objc_destroyWeak((id *)&self->_videoPreviewLayer);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_inProgressPhotoCaptureDelegates, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_photoSettings, 0);
  objc_storeStrong((id *)&self->_videoDeviceInput, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_destroyWeak((id *)&self->_flashSettingWidthConstraint);
  objc_destroyWeak((id *)&self->_flashSettingViewOffButton);
  objc_destroyWeak((id *)&self->_flashSettingViewOnButton);
  objc_destroyWeak((id *)&self->_flashSettingViewAutoButton);
  objc_destroyWeak((id *)&self->_flashSettingViewFlashIcon);
  objc_destroyWeak((id *)&self->_flashSettingButtonView);
  objc_storeStrong((id *)&self->_flashSettingViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_flashSettingView);
  objc_destroyWeak((id *)&self->_filterButton);
  objc_destroyWeak((id *)&self->_flashButton);
  objc_destroyWeak((id *)&self->_manualButton);
  objc_destroyWeak((id *)&self->_autoButton);
  objc_storeStrong((id *)&self->_saveButtonLandscapeTrailingConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_saveButtonLandscapeVerticalConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_destroyWeak((id *)&self->_cancelButton);
  objc_destroyWeak((id *)&self->_scrimView);
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewBottomConstraintForIPhone, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewTrailingConstraintForIPad, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerViewLeadingConstraintForIPad, 0);
  objc_destroyWeak((id *)&self->_moveCameraCloserLabel);
  objc_destroyWeak((id *)&self->_moveCameraCloserView);
  objc_destroyWeak((id *)&self->_userPromptLabel);
  objc_destroyWeak((id *)&self->_userPromptView);
  objc_destroyWeak((id *)&self->_overlayView);
  objc_storeStrong((id *)&self->_filterNameFeedbackViewTopLayoutConstraint, 0);
  objc_destroyWeak((id *)&self->_filterNameFeedbackLabel);
  objc_destroyWeak((id *)&self->_filterNameFeedbackView);
  objc_destroyWeak((id *)&self->_autoShutterOffTopLayoutConstraint);
  objc_destroyWeak((id *)&self->_autoShutterOffLabel);
  objc_destroyWeak((id *)&self->_autoShutterOffView);
  objc_destroyWeak((id *)&self->_autoShutterOnTopLayoutConstraint);
  objc_destroyWeak((id *)&self->_autoShutterOnLabel);
  objc_destroyWeak((id *)&self->_autoShutterOnView);
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForLandscapeIPhone, 0);
  objc_storeStrong((id *)&self->_shutterButtonBottomConstraintForPortraitIPhone, 0);
  objc_destroyWeak((id *)&self->_shutterButton);
  objc_destroyWeak((id *)&self->_resumeButton);
  objc_destroyWeak((id *)&self->_cameraUnavailableLabel);
  objc_destroyWeak((id *)&self->_cameraUnavailableView);
  objc_destroyWeak((id *)&self->_cameraUnavailableScrim);
  objc_destroyWeak((id *)&self->_previewView);
  objc_storeStrong((id *)&self->_thumbnailViewController, 0);
  objc_storeStrong((id *)&self->_thumbnailContainerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Prewarming black and white filter failed", v2, v3, v4, v5, v6);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Prewarming grayscale filter failed", v2, v3, v4, v5, v6);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Prewarming color filter failed", v2, v3, v4, v5, v6);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Prewarming photo filter failed", v2, v3, v4, v5, v6);
}

void __40__ICDocCamViewController_preWarmFilters__block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Prewarming crop filter failed", v2, v3, v4, v5, v6);
}

void __45__ICDocCamViewController_setupCaptureSession__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "Could not create video device input: %@", v2, v3, v4, v5, v6);
}

- (void)updateFilterChoiceButtonScrollPositionAnimated:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "Did not find frame for current filter.", v2, v3, v4, v5, v6);
}

- (void)image:didFinishSavingWithError:contextInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "error saving: %@", v2, v3, v4, v5, v6);
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "saveCapturedImage null image", v2, v3, v4, v5, v6);
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_217885000, v0, OS_LOG_TYPE_DEBUG, "saveCapturedImage created docInfo %p", v1, 0xCu);
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "saveCapturedImage warnAboutMaxScansIfNecessary", v2, v3, v4, v5, v6);
}

- (void)saveCapturedImage:metaData:rects:constantColor:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "saveCapturedImage", v2, v3, v4, v5, v6);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_790_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_217885000, a2, OS_LOG_TYPE_DEBUG, "saveCapturedImage addNewDocument docInfo %p", (uint8_t *)&v3, 0xCu);
}

void __91__ICDocCamViewController_saveCapturedImage_metaData_rects_constantColor_completionHandler___block_invoke_3_797_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "saveCapturedImage completion docInfo %p croppedAndFilteredImageUUID %@", buf, 0x16u);
}

- (void)snapStillImageWithMode:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "snapStillImageWithMode NOT returning early -- capturing NOT in progress", v2, v3, v4, v5, v6);
}

- (void)snapStillImageWithMode:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "snapStillImageWithMode returning early - capturing in progress", v2, v3, v4, v5, v6);
}

- (void)snapStillImageWithMode:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "snapStillImageWithMode", v2, v3, v4, v5, v6);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "snapStillImage: color constancy enabled for capture", v2, v3, v4, v5, v6);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "snapStillImage: color constancy NOT enabled for capture", v2, v3, v4, v5, v6);
}

void __49__ICDocCamViewController_snapStillImageWithMode___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_217885000, v0, v1, "snapStillImage: error capturing photo.", v2, v3, v4, v5, v6);
}

void __94__ICDocCamViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "Could not lock device for configuration: %@", v2, v3, v4, v5, v6);
}

@end