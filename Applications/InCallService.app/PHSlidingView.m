@interface PHSlidingView
- (AVCaptureDevice)avCaptureDevice;
- (BOOL)deviceSupportsFindMy;
- (BOOL)hasTwoMiddleSliders;
- (BOOL)isCallDueToMountedState;
- (BOOL)shouldPowerDownViewShowFindMyAlert;
- (BOOL)userWantsFindMySuppressed;
- (BOOL)wasMounted;
- (CGRect)lockButtonDimension;
- (CGRect)volumeButtonDimension;
- (CMMotionActivityManager)cmMotionActivityManager;
- (NSLayoutConstraint)animatedSliderTopConstraint;
- (NSLayoutConstraint)medicalIDSliderBottomConstraint;
- (NSLayoutConstraint)volumeButtonHighlightViewCenterYConstraint;
- (NSLayoutConstraint)volumeButtonHighlightViewHeightConstraint;
- (NSMutableArray)motionActivityList;
- (NSOperationQueue)motionActivityQueue;
- (NSTimer)clawHoldInitialTimer;
- (NSTimer)releaseToCallTimer;
- (NSTimer)releaseToCallVoiceLoopTimer;
- (OS_dispatch_queue)avCaptureDispatchQueue;
- (PHSOSAlertController)alertController;
- (PHSlidingButton)animatedSlidingButton;
- (PHSlidingButton)medicalIDSlidingButton;
- (PHSlidingButton)powerOffSlidingButton;
- (PHSlidingView)initWithFrame:(CGRect)a3;
- (PHSlidingViewDelegate)delegate;
- (SBSHardwareButtonHintViewContentVisibilityControlling)sideButtonHintViewVisibilityControlling;
- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeButtonHintViewVisibilityControlling;
- (SBUIShapeView)darkeningOverlayView;
- (SBUIShapeView)darkeningUnderlayView;
- (SOSVoiceMessageManager)voiceMessageManager;
- (SPBeaconManager)beaconManager;
- (UIButton)findMyButton;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)lockButtonHighlightView;
- (UIView)volumeButtonHighlightView;
- (UIViewPropertyAnimator)sliderAnimator;
- (double)animatedSliderTopConstraintConstant;
- (double)distanceBetweenMiddleSliders;
- (double)medicalIDSliderBottomConstraintConstant;
- (double)releaseToCallStartTime;
- (double)sliderButtonWidth;
- (double)sliderViewCreationTime;
- (double)titleDistanceFromTop;
- (id)_createPowerDownSlider;
- (id)animatedSlidingButtonCompletionBlock;
- (id)interactivelyAnimateSlidingButtonBlock;
- (id)medicalIDSlidingButtonCompletionBlock;
- (id)powerDownCompletionBlock;
- (id)shouldMaxVolumeCompletionBlock;
- (id)sliderTimingBlock;
- (int64_t)numberOfEpochsForMountProbability;
- (int64_t)timeToReleaseClaw;
- (int64_t)wasMountedProbability;
- (unint64_t)slidingViewState;
- (void)_animatePowerDown;
- (void)_powerOff;
- (void)_readIODeviceSupportsFindMy;
- (void)_readShouldPowerDownViewShowFindMyAlert;
- (void)_updatePowerOffSliderExclusionPath;
- (void)clearClawHoldInitialTimer;
- (void)clearMetricItems;
- (void)clearReleaseToCallState;
- (void)clearReleaseToCallTimer;
- (void)clearReleaseToCallVoiceLoopTimer;
- (void)commonInit;
- (void)createFindMyUI;
- (void)createHintView;
- (void)createPowerDownConstraints;
- (void)didAcknowledgeFindMyInfo;
- (void)didFinishSOSSliding:(unint64_t)a3;
- (void)didFinishSlideForSlidingButton:(id)a3;
- (void)didSuppressFindMy;
- (void)hideHardwareButtonView;
- (void)interactiveStartWithCountdownModel:(id)a3;
- (void)interactiveStop:(id)a3;
- (void)invalidateCountdownAndStopSounds;
- (void)layoutSubviews;
- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4;
- (void)resetAnimatedSlider;
- (void)setAlertController:(id)a3;
- (void)setAnimatedSliderCompletion:(id)a3;
- (void)setAnimatedSliderTopConstraint:(id)a3;
- (void)setAnimatedSliderTopConstraintConstant:(double)a3;
- (void)setAnimatedSlidingButton:(id)a3;
- (void)setAnimatedSlidingButtonCompletionBlock:(id)a3;
- (void)setAvCaptureDevice:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setClawHoldInitialTimer:(id)a3;
- (void)setCmMotionActivityManager:(id)a3;
- (void)setDarkeningOverlayView:(id)a3;
- (void)setDarkeningUnderlayView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDeviceSupportsFindMy:(BOOL)a3;
- (void)setFindMyButton:(id)a3;
- (void)setHasTwoMiddleSliders:(BOOL)a3;
- (void)setInteractivelyAnimateSlidingButtonBlock:(id)a3;
- (void)setLockButtonHighlightView:(id)a3;
- (void)setMedicalIDSliderBottomConstraint:(id)a3;
- (void)setMedicalIDSliderBottomConstraintConstant:(double)a3;
- (void)setMedicalIDSlidingButton:(id)a3;
- (void)setMedicalIDSlidingButtonCompletionBlock:(id)a3;
- (void)setMotionActivityList:(id)a3;
- (void)setMotionActivityQueue:(id)a3;
- (void)setNumberOfEpochsForMountProbability:(int64_t)a3;
- (void)setPowerDownCompletionBlock:(id)a3;
- (void)setPowerOffSlidingButton:(id)a3;
- (void)setReleaseToCallStartTime:(double)a3;
- (void)setReleaseToCallTimer:(id)a3;
- (void)setReleaseToCallVoiceLoopTimer:(id)a3;
- (void)setShouldMaxVolumeCompletionBlock:(id)a3;
- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3;
- (void)setSideButtonHintViewVisibilityControlling:(id)a3;
- (void)setSliderAnimator:(id)a3;
- (void)setSliderTimingBlock:(id)a3;
- (void)setSliderViewCreationTime:(double)a3;
- (void)setSlidingViewState:(unint64_t)a3;
- (void)setTimeToReleaseClaw:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUserWantsFindMySuppressed:(BOOL)a3;
- (void)setVoiceMessageManager:(id)a3;
- (void)setVolumeButtonHighlightView:(id)a3;
- (void)setVolumeButtonHighlightViewCenterYConstraint:(id)a3;
- (void)setVolumeButtonHighlightViewHeightConstraint:(id)a3;
- (void)setVolumeButtonHintViewVisibilityControlling:(id)a3;
- (void)setWasMounted:(BOOL)a3;
- (void)setWasMountedProbability:(int64_t)a3;
- (void)showHardwareButtonView;
- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4;
- (void)startMotionStateTracking;
- (void)startVoiceLoopMessagePlaybackWithMessageType:(int64_t)a3;
- (void)stopFlash;
- (void)stopVoiceLoopMessagePlayback;
- (void)toggleFlash;
- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(double)a4 completion:(id)a5;
- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(unint64_t)a4 afterDelay:(double)a5 completion:(id)a6;
- (void)updateMiddleViewSliderConstraintConstants;
@end

@implementation PHSlidingView

- (PHSlidingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingView;
  v3 = -[PHSlidingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHSlidingView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v66 = objc_alloc_init((Class)SPBeaconManager);
  -[PHSlidingView setBeaconManager:](self, "setBeaconManager:");
  [(PHSlidingView *)self _readIODeviceSupportsFindMy];
  [(PHSlidingView *)self _readShouldPowerDownViewShowFindMyAlert];
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.incallservice.slidingView.avCapture", 0);
  avCaptureDispatchQueue = self->_avCaptureDispatchQueue;
  self->_avCaptureDispatchQueue = v3;

  v5 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  avCaptureDevice = self->_avCaptureDevice;
  self->_avCaptureDevice = v5;

  if (+[SOSUtilities isMountStateTrackingEnabled])
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    motionActivityQueue = self->_motionActivityQueue;
    self->_motionActivityQueue = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    motionActivityList = self->_motionActivityList;
    self->_motionActivityList = v9;

    v11 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    cmMotionActivityManager = self->_cmMotionActivityManager;
    self->_cmMotionActivityManager = v11;
  }
  v13 = [[PHSlidingButton alloc] initWithSlidingButtonType:7 appearanceType:0 callState:2];
  animatedSlidingButton = self->_animatedSlidingButton;
  self->_animatedSlidingButton = v13;

  [(PHSlidingButton *)self->_animatedSlidingButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHSlidingButton *)self->_animatedSlidingButton setDelegate:self];
  [(PHSlidingView *)self addSubview:self->_animatedSlidingButton];
  v15 = [[PHSlidingButton alloc] initWithSlidingButtonType:9 appearanceType:0 callState:2];
  medicalIDSlidingButton = self->_medicalIDSlidingButton;
  self->_medicalIDSlidingButton = v15;

  [(PHSlidingButton *)self->_medicalIDSlidingButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHSlidingButton *)self->_medicalIDSlidingButton setDelegate:self];
  [(PHSlidingView *)self addSubview:self->_medicalIDSlidingButton];
  v17 = [(PHSlidingView *)self _createPowerDownSlider];
  powerOffSlidingButton = self->_powerOffSlidingButton;
  self->_powerOffSlidingButton = v17;

  [(PHSlidingView *)self addSubview:self->_powerOffSlidingButton];
  v19 = (UILabel *)objc_alloc_init((Class)UILabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v19;

  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = +[UIFont systemFontOfSize:15.0];
  [(UILabel *)self->_descriptionLabel setFont:v21];

  v22 = +[UIColor whiteColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v22];

  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL" value:&stru_1002D6110 table:@"InCallService"];
  [(UILabel *)self->_descriptionLabel setText:v24];

  +[SOSUtilities clawReleaseToCallSupport];
  if (v25 == 0.0) {
    [(UILabel *)self->_descriptionLabel setAlpha:0.0];
  }
  [(PHSlidingView *)self addSubview:self->_descriptionLabel];
  id v26 = objc_alloc((Class)SBUIShapeView);
  v27 = +[UIScreen mainScreen];
  [v27 bounds];
  v28 = [v26 initWithFrame:];
  darkeningUnderlayView = self->_darkeningUnderlayView;
  self->_darkeningUnderlayView = v28;

  v30 = self->_darkeningUnderlayView;
  v31 = +[UIColor blackColor];
  [(SBUIShapeView *)v30 setFillColor:v31];

  [(SBUIShapeView *)self->_darkeningUnderlayView setFillRule:1];
  [(SBUIShapeView *)self->_darkeningUnderlayView setAlpha:0.0];
  [(PHSlidingView *)self addSubview:self->_darkeningUnderlayView];
  id v32 = objc_alloc((Class)SBUIShapeView);
  v33 = +[UIScreen mainScreen];
  [v33 bounds];
  v34 = [v32 initWithFrame:];
  darkeningOverlayView = self->_darkeningOverlayView;
  self->_darkeningOverlayView = v34;

  v36 = self->_darkeningOverlayView;
  v37 = +[UIColor blackColor];
  [(SBUIShapeView *)v36 setBackgroundColor:v37];

  [(SBUIShapeView *)self->_darkeningOverlayView setAlpha:0.0];
  [(PHSlidingView *)self addSubview:self->_darkeningOverlayView];
  v38 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v38;

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = +[UIFont boldSystemFontOfSize:34.0];
  [(UILabel *)self->_titleLabel setFont:v40];

  v41 = +[UIColor whiteColor];
  [(UILabel *)self->_titleLabel setTextColor:v41];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v42 = +[NSBundle mainBundle];
  v43 = [v42 localizedStringForKey:@"SOS_RELEASE_TO_CALL_LABEL" value:&stru_1002D6110 table:@"InCallService"];
  [(UILabel *)self->_titleLabel setText:v43];

  [(UILabel *)self->_titleLabel setAlpha:0.0];
  [(PHSlidingView *)self addSubview:self->_titleLabel];
  id v44 = objc_alloc((Class)UIView);
  [(PHSlidingView *)self sliderButtonWidth];
  double v46 = v45;
  [(PHSlidingView *)self volumeButtonDimension];
  v47 = [v44 initWithFrame:CGRectMake(0.0, 0.0, v46, CGRectGetHeight(v68))];
  volumeButtonHighlightView = self->_volumeButtonHighlightView;
  self->_volumeButtonHighlightView = v47;

  [(UIView *)self->_volumeButtonHighlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v49 = +[UIColor systemRedColor];
  [(UIView *)self->_volumeButtonHighlightView setBackgroundColor:v49];

  [(PHSlidingView *)self sliderButtonWidth];
  double v51 = v50 * 0.5;
  v52 = [(UIView *)self->_volumeButtonHighlightView layer];
  [v52 setCornerRadius:v51];

  if ((SBSUIHardwareButtonHintViewsSupported() & 1) == 0) {
    [(UIView *)self->_volumeButtonHighlightView setAlpha:0.0];
  }
  [(PHSlidingView *)self addSubview:self->_volumeButtonHighlightView];
  id v53 = objc_alloc((Class)UIView);
  [(PHSlidingView *)self sliderButtonWidth];
  double v55 = v54;
  [(PHSlidingView *)self lockButtonDimension];
  v56 = [v53 initWithFrame:CGRectMake(0.0, 0.0, v55, CGRectGetHeight(v69))];
  lockButtonHighlightView = self->_lockButtonHighlightView;
  self->_lockButtonHighlightView = v56;

  [(UIView *)self->_lockButtonHighlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v58 = +[UIColor systemRedColor];
  [(UIView *)self->_lockButtonHighlightView setBackgroundColor:v58];

  [(PHSlidingView *)self sliderButtonWidth];
  double v60 = v59 * 0.5;
  v61 = [(UIView *)self->_lockButtonHighlightView layer];
  [v61 setCornerRadius:v60];

  if ((SBSUIHardwareButtonHintViewsSupported() & 1) == 0) {
    [(UIView *)self->_lockButtonHighlightView setAlpha:0.0];
  }
  [(PHSlidingView *)self addSubview:self->_lockButtonHighlightView];
  v62 = objc_alloc_init(PHSOSAlertController);
  alertController = self->_alertController;
  self->_alertController = v62;

  v64 = +[NSDate date];
  [v64 timeIntervalSince1970];
  self->_sliderViewCreationTime = v65;

  [(PHSlidingView *)self setUpConstraints];
  [(PHSlidingView *)self clearMetricItems];
  if (SBSUIHardwareButtonHintViewsSupported())
  {
    [(UIView *)self->_lockButtonHighlightView setHidden:1];
    [(UIView *)self->_volumeButtonHighlightView setHidden:1];
  }
}

- (void)createHintView
{
  v3 = +[SOSManager sharedInstance];
  id v10 = [v3 currentSOSButtonPressState];

  if ([v10 volumeUpPressed] && !objc_msgSend(v10, "volumeDownPressed")
    || ([v10 volumeUpPressed] & 1) == 0
    && ([v10 volumeDownPressed] & 1) != 0
    || [v10 volumeUpPressed] && objc_msgSend(v10, "volumeDownPressed"))
  {
    v4 = [(PHSlidingView *)self volumeButtonHintViewVisibilityControlling];

    if (v4)
    {
      v5 = [(PHSlidingView *)self volumeButtonHintViewVisibilityControlling];
      [v5 invalidate];
    }
    objc_super v6 = SBSUIRegisterHardwareButtonHintView();
    [(PHSlidingView *)self setVolumeButtonHintViewVisibilityControlling:v6];

    v7 = [(PHSlidingView *)self volumeButtonHintViewVisibilityControlling];
    [v7 setContentVisibility:1 animationSettings:0];
  }
  v8 = SBSUIRegisterHardwareButtonHintView();
  [(PHSlidingView *)self setSideButtonHintViewVisibilityControlling:v8];

  v9 = [(PHSlidingView *)self sideButtonHintViewVisibilityControlling];
  [v9 setContentVisibility:1 animationSettings:0];
}

- (void)hideHardwareButtonView
{
  if (SBSUIHardwareButtonHintViewsSupported())
  {
    v3 = [(PHSlidingView *)self sideButtonHintViewVisibilityControlling];
    [v3 invalidate];

    v4 = [(PHSlidingView *)self volumeButtonHintViewVisibilityControlling];
    [v4 invalidate];

    [(UIView *)self->_lockButtonHighlightView setHidden:1];
    volumeButtonHighlightView = self->_volumeButtonHighlightView;
    [(UIView *)volumeButtonHighlightView setHidden:1];
  }
  else
  {
    objc_super v6 = [(PHSlidingView *)self volumeButtonHighlightView];
    [v6 setAlpha:0.0];

    id v7 = [(PHSlidingView *)self lockButtonHighlightView];
    [v7 setAlpha:0.0];
  }
}

- (void)showHardwareButtonView
{
  if (SBSUIHardwareButtonHintViewsSupported())
  {
    [(PHSlidingView *)self createHintView];
    [(UIView *)self->_lockButtonHighlightView setHidden:0];
    volumeButtonHighlightView = self->_volumeButtonHighlightView;
    [(UIView *)volumeButtonHighlightView setHidden:0];
  }
  else
  {
    v4 = [(PHSlidingView *)self volumeButtonHighlightView];
    [v4 setAlpha:1.0];

    id v5 = [(PHSlidingView *)self lockButtonHighlightView];
    [v5 setAlpha:1.0];
  }
}

- (void)setSlidingViewState:(unint64_t)a3
{
  if (self->_slidingViewState != a3)
  {
    self->_unint64_t slidingViewState = a3;
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t slidingViewState = self->_slidingViewState;
      *(_DWORD *)buf = 134217984;
      unint64_t v101 = slidingViewState;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSlidingView,slidingViewState:%lu", buf, 0xCu);
    }

    switch(a3)
    {
      case 0uLL:
        +[SOSUtilities clawReleaseToCallSupport];
        BOOL v8 = v7 != 0.0;
        v9 = [(PHSlidingView *)self descriptionLabel];
        id v10 = v9;
        if (v8)
        {
          [v9 setAlpha:1.0];

          id v10 = [(PHSlidingView *)self descriptionLabel];
          v11 = +[NSBundle mainBundle];
          v12 = [v11 localizedStringForKey:@"SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL" value:&stru_1002D6110 table:@"InCallService"];
          [v10 setText:v12];
        }
        else
        {
          [v9 setAlpha:0.0];
        }

        v79 = [(PHSlidingView *)self titleLabel];
        [v79 setAlpha:0.0];

        v80 = [(PHSlidingView *)self animatedSlidingButton];
        [v80 setAlpha:1.0];

        if ([(PHSlidingView *)self hasTwoMiddleSliders])
        {
          v81 = [(PHSlidingView *)self medicalIDSlidingButton];
          [v81 setAlpha:1.0];
        }
        [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
        v82 = [(PHSlidingView *)self powerOffSlidingButton];
        [v82 setAlpha:1.0];

        if ([(PHSlidingView *)self deviceSupportsFindMy])
        {
          v83 = [(PHSlidingView *)self findMyButton];
          [v83 setAlpha:1.0];
        }
        goto LABEL_29;
      case 1uLL:
        v13 = [(PHSlidingView *)self descriptionLabel];
        [v13 setAlpha:0.0];

        v14 = [(PHSlidingView *)self titleLabel];
        [v14 setAlpha:0.0];

        v15 = [(PHSlidingView *)self animatedSlidingButton];
        [v15 setAlpha:1.0];

        +[SOSUtilities clawReleaseToCallSupport];
        if (v16 != 0.0)
        {
          v17 = [(PHSlidingView *)self medicalIDSlidingButton];
          [v17 setAlpha:0.0];

          v18 = [(PHSlidingView *)self powerOffSlidingButton];
          [v18 setAlpha:0.0];

          if ([(PHSlidingView *)self deviceSupportsFindMy])
          {
            v19 = [(PHSlidingView *)self findMyButton];
            [v19 setAlpha:0.0];
          }
          v20 = [(PHSlidingView *)self titleLabel];
          [v20 setAlpha:1.0];

          v21 = [(PHSlidingView *)self titleLabel];
          v22 = +[NSBundle mainBundle];
          v23 = [v22 localizedStringForKey:@"SOS_HOLDING_LABEL" value:&stru_1002D6110 table:@"InCallService"];
          [v21 setText:v23];

          v24 = +[UIColor whiteColor];
          double v25 = [(PHSlidingView *)self titleLabel];
          [v25 setTextColor:v24];

          id v26 = [(PHSlidingView *)self descriptionLabel];
          [v26 setAlpha:0.0];

          [(PHSlidingView *)self showHardwareButtonView];
          [(PHSlidingView *)self volumeButtonDimension];
          CGFloat x = v102.origin.x;
          double y = v102.origin.y;
          CGFloat width = v102.size.width;
          CGFloat height = v102.size.height;
          double v31 = CGRectGetHeight(v102);
          id v32 = [(PHSlidingView *)self volumeButtonHighlightViewCenterYConstraint];
          [v32 setConstant:y + v31 * 0.5];

          v103.origin.CGFloat x = x;
          v103.origin.double y = y;
          v103.size.CGFloat width = width;
          v103.size.CGFloat height = height;
          double v33 = CGRectGetHeight(v103);
          v34 = [(PHSlidingView *)self volumeButtonHighlightViewHeightConstraint];
          [v34 setConstant:v33];
        }
        break;
      case 2uLL:
        [(PHSlidingView *)self setReleaseToCallStartTime:CFAbsoluteTimeGetCurrent()];
        v35 = [(PHSlidingView *)self descriptionLabel];
        [v35 setAlpha:0.0];

        v36 = [(PHSlidingView *)self titleLabel];
        [v36 setAlpha:1.0];

        v37 = [(PHSlidingView *)self titleLabel];
        v38 = +[NSBundle mainBundle];
        v39 = [v38 localizedStringForKey:@"SOS_RELEASE_TO_CALL_LABEL" value:&stru_1002D6110 table:@"InCallService"];
        [v37 setText:v39];

        v40 = +[UIColor systemRedColor];
        v41 = [(PHSlidingView *)self titleLabel];
        [v41 setTextColor:v40];

        v42 = [(PHSlidingView *)self animatedSlidingButton];
        [v42 setAlpha:0.0];

        v43 = [(PHSlidingView *)self medicalIDSlidingButton];
        [v43 setAlpha:0.0];

        id v44 = [(PHSlidingView *)self powerOffSlidingButton];
        [v44 setAlpha:0.0];

        if ([(PHSlidingView *)self deviceSupportsFindMy])
        {
          double v45 = [(PHSlidingView *)self findMyButton];
          [v45 setAlpha:0.0];
        }
        [(PHSlidingView *)self showHardwareButtonView];
        [(PHSlidingView *)self volumeButtonDimension];
        CGFloat v46 = v104.origin.x;
        double v47 = v104.origin.y;
        CGFloat v48 = v104.size.width;
        CGFloat v49 = v104.size.height;
        double v50 = CGRectGetHeight(v104);
        double v51 = [(PHSlidingView *)self volumeButtonHighlightViewCenterYConstraint];
        [v51 setConstant:v47 + v50 * 0.5];

        v105.origin.CGFloat x = v46;
        v105.origin.double y = v47;
        v105.size.CGFloat width = v48;
        v105.size.CGFloat height = v49;
        double v52 = CGRectGetHeight(v105);
        uint64_t v53 = [(PHSlidingView *)self volumeButtonHighlightViewHeightConstraint];
        [(id)v53 setConstant:v52];

        double v54 = [(PHSlidingView *)self shouldMaxVolumeCompletionBlock];
        LOBYTE(v53) = v54 == 0;

        if ((v53 & 1) == 0)
        {
          double v55 = [(PHSlidingView *)self shouldMaxVolumeCompletionBlock];
          v55[2](v55, 1);
        }
        [(PHSlidingView *)self startVoiceLoopMessagePlaybackWithMessageType:102];
        v56 = [(PHSlidingView *)self releaseToCallVoiceLoopTimer];
        if (v56)
        {
        }
        else
        {
          +[SOSUtilities clawReleaseToCallSupport];
          if (v84 > 0.0)
          {
            objc_initWeak((id *)buf, self);
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = sub_100070318;
            v98[3] = &unk_1002CDA48;
            objc_copyWeak(&v99, (id *)buf);
            v85 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v98 block:3.0];
            [(PHSlidingView *)self setReleaseToCallVoiceLoopTimer:v85];

            v86 = [(PHSlidingView *)self releaseToCallVoiceLoopTimer];
            v87 = [v86 fireDate];
            v88 = [v87 dateByAddingTimeInterval:1.0];
            v89 = [(PHSlidingView *)self releaseToCallVoiceLoopTimer];
            [v89 setFireDate:v88];

            objc_destroyWeak(&v99);
            objc_destroyWeak((id *)buf);
          }
        }
        v90 = [(PHSlidingView *)self releaseToCallTimer];
        if (v90)
        {
        }
        else
        {
          +[SOSUtilities clawReleaseToCallSupport];
          if (v91 > 0.0)
          {
            objc_initWeak((id *)buf, self);
            v93 = _NSConcreteStackBlock;
            uint64_t v94 = 3221225472;
            v95 = sub_100070360;
            v96 = &unk_1002CDA48;
            objc_copyWeak(&v97, (id *)buf);
            v92 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v93 block:10.0];
            -[PHSlidingView setReleaseToCallTimer:](self, "setReleaseToCallTimer:", v92, v93, v94, v95, v96);

            objc_destroyWeak(&v97);
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 3uLL:
        [(PHSlidingView *)self resetAnimatedSlider];
        v57 = [(PHSlidingView *)self titleLabel];
        [v57 setAlpha:0.0];

        v58 = [(PHSlidingView *)self descriptionLabel];
        [v58 setAlpha:1.0];

        double v59 = [(PHSlidingView *)self descriptionLabel];
        double v60 = +[NSBundle mainBundle];
        v61 = [v60 localizedStringForKey:@"SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL" value:&stru_1002D6110 table:@"InCallService"];
        [v59 setText:v61];

        v62 = [(PHSlidingView *)self animatedSlidingButton];
        [v62 setAlpha:1.0];

        if ([(PHSlidingView *)self hasTwoMiddleSliders])
        {
          v63 = [(PHSlidingView *)self medicalIDSlidingButton];
          [v63 setAlpha:1.0];
        }
        [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
        v64 = [(PHSlidingView *)self powerOffSlidingButton];
        [v64 setAlpha:1.0];

        if ([(PHSlidingView *)self deviceSupportsFindMy])
        {
          double v65 = [(PHSlidingView *)self findMyButton];
          [v65 setAlpha:1.0];
        }
        [(PHSlidingView *)self hideHardwareButtonView];
        [(PHSlidingView *)self stopVoiceLoopMessagePlayback];
        id v66 = [(PHSlidingView *)self shouldMaxVolumeCompletionBlock];
        BOOL v67 = v66 == 0;

        if (!v67)
        {
          CGRect v68 = [(PHSlidingView *)self shouldMaxVolumeCompletionBlock];
          v68[2](v68, 0);
        }
        [(PHSlidingView *)self clearReleaseToCallVoiceLoopTimer];
        CGRect v69 = [(PHSlidingView *)self releaseToCallTimer];
        [v69 invalidate];

        [(PHSlidingView *)self setReleaseToCallTimer:0];
        break;
      case 5uLL:
        [(PHSlidingView *)self resetAnimatedSlider];
        v70 = [(PHSlidingView *)self titleLabel];
        [v70 setAlpha:0.0];

        v71 = [(PHSlidingView *)self descriptionLabel];
        [v71 setAlpha:1.0];

        v72 = [(PHSlidingView *)self descriptionLabel];
        v73 = +[NSBundle mainBundle];
        v74 = [v73 localizedStringForKey:@"SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL" value:&stru_1002D6110 table:@"InCallService"];
        [v72 setText:v74];

        v75 = [(PHSlidingView *)self animatedSlidingButton];
        [v75 setAlpha:1.0];

        if ([(PHSlidingView *)self hasTwoMiddleSliders])
        {
          v76 = [(PHSlidingView *)self medicalIDSlidingButton];
          [v76 setAlpha:1.0];
        }
        [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
        v77 = [(PHSlidingView *)self powerOffSlidingButton];
        [v77 setAlpha:1.0];

        if ([(PHSlidingView *)self deviceSupportsFindMy])
        {
          v78 = [(PHSlidingView *)self findMyButton];
          [v78 setAlpha:1.0];
        }
LABEL_29:
        [(PHSlidingView *)self hideHardwareButtonView];
        break;
      default:
        return;
    }
  }
}

- (double)sliderButtonWidth
{
  int v2 = SBSUIHardwareButtonHintViewsSupported();
  double result = 25.0;
  if (v2) {
    return 5.0;
  }
  return result;
}

- (id)_createPowerDownSlider
{
  v3 = [[PHSlidingButton alloc] initWithSlidingButtonType:8 appearanceType:1 callState:2];
  v4 = +[UIColor redColor];
  [(PHSlidingButton *)v3 setTintColor:v4];

  [(PHSlidingButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHSlidingButton *)v3 setDelegate:self];

  return v3;
}

- (void)createPowerDownConstraints
{
  id v17 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(PHSlidingView *)self powerOffSlidingButton];
  v4 = [v3 centerXAnchor];
  id v5 = [(PHSlidingView *)self centerXAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  [v17 addObject:v6];

  double v7 = [(PHSlidingView *)self powerOffSlidingButton];
  BOOL v8 = [v7 topAnchor];
  v9 = [(PHSlidingView *)self safeAreaLayoutGuide];
  id v10 = [v9 topAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:52.0];
  [v17 addObject:v11];

  v12 = [(PHSlidingView *)self findMyButton];

  if (v12)
  {
    v13 = [(PHSlidingView *)self findMyButton];
    v14 = [v13 topAnchor];
    v15 = [(PHSlidingButton *)self->_powerOffSlidingButton bottomAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:4.0];
    [v17 addObject:v16];
  }
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)createFindMyUI
{
  uint64_t v3 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:13.0];
  id v32 = +[UIColor systemGrayColor];
  v40 = (void *)v3;
  v41 = +[UIImage _systemImageNamed:@"location.fill.radiowaves.left.and.right" withConfiguration:v3];
  v39 = +[NSTextAttachment textAttachmentWithImage:v41];
  v35 = +[NSAttributedString attributedStringWithAttachment:v39];
  v4 = +[UIImage systemImageNamed:@"chevron.right" withConfiguration:v3];
  v38 = [v4 imageFlippedForRightToLeftLayoutDirection];

  v37 = +[NSTextAttachment textAttachmentWithImage:v38];
  double v33 = +[NSAttributedString attributedStringWithAttachment:v37];
  id v5 = +[NSBundle mainBundle];
  v36 = [v5 localizedStringForKey:@"POWER_DOWN_FIND_MY_ACTIVE" value:&stru_1002D6110 table:@"InCallService"];

  id v34 = [objc_alloc((Class)NSAttributedString) initWithString:v36];
  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  id v7 = objc_alloc_init((Class)NSMutableAttributedString);
  [v7 appendAttributedString:v35];
  [v7 appendAttributedString:v6];
  [v7 appendAttributedString:v34];
  [v7 appendAttributedString:v6];
  [v7 appendAttributedString:v33];
  id v8 = [v7 length];
  double v31 = +[UIFont systemFontOfSize:13.0];
  [v7 addAttribute:NSFontAttributeName value:v31 range:0, v8];
  [v7 addAttribute:NSForegroundColorAttributeName value:v32 range:0, v8];
  id v9 = [objc_alloc((Class)UIButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(PHSlidingView *)self setFindMyButton:v9];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAlpha:0.0];
  id v10 = +[UIColor clearColor];
  [v9 setBackgroundColor:v10];

  [v9 setAttributedTitle:v7 forState:0];
  v11 = [v9 titleLabel];
  [v11 setNumberOfLines:0];

  v12 = [v9 titleLabel];
  [v12 setTextAlignment:1];

  v13 = [v9 titleLabel];
  [v13 setLineBreakMode:0];

  v14 = [(PHSlidingView *)self delegate];
  [v9 addTarget:v14 action:"didTapFindMy" forControlEvents:64];

  v15 = [(PHSlidingView *)self powerOffSlidingButton];
  [(PHSlidingView *)self insertSubview:v9 above:v15];

  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = [v9 centerXAnchor];
  v18 = [(PHSlidingView *)self centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v16 addObject:v19];

  v20 = [v9 leadingAnchor];
  v21 = [(PHSlidingView *)self leadingAnchor];
  v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21 constant:20.0];

  v23 = [v9 trailingAnchor];
  v24 = [(PHSlidingView *)self trailingAnchor];
  double v25 = [v23 constraintLessThanOrEqualToAnchor:v24 constant:20.0];

  [v16 addObject:v22];
  [v16 addObject:v25];
  id v26 = [v9 topAnchor];
  v27 = [(PHSlidingButton *)self->_powerOffSlidingButton bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:4.0];
  [v16 addObject:v28];

  v29 = [v9 heightAnchor];
  v30 = [v29 constraintGreaterThanOrEqualToConstant:40.0];
  [v16 addObject:v30];

  +[NSLayoutConstraint activateConstraints:v16];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100070BFC;
  v42[3] = &unk_1002CD518;
  v42[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v42 completion:0];
}

- (void)didSuppressFindMy
{
  [(PHSlidingView *)self setUserWantsFindMySuppressed:1];
  findMyButton = self->_findMyButton;

  [(UIButton *)findMyButton setAlpha:0.0];
}

- (void)didAcknowledgeFindMyInfo
{
}

- (void)_readIODeviceSupportsFindMy
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PHSlidingView *)self beaconManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100070D40;
  v4[3] = &unk_1002CDBE0;
  objc_copyWeak(&v5, &location);
  [v3 isLPEMModeSupported:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_readShouldPowerDownViewShowFindMyAlert
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PHSlidingView *)self beaconManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100070F04;
  v4[3] = &unk_1002CDBE0;
  objc_copyWeak(&v5, &location);
  [v3 userHasAcknowledgeFindMyWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHSlidingView;
  [(PHSlidingView *)&v3 layoutSubviews];
  [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
  [(PHSlidingView *)self _updatePowerOffSliderExclusionPath];
}

- (void)setAnimatedSliderCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id animatedSlidingButtonCompletionBlock = self->_animatedSlidingButtonCompletionBlock;
  self->_id animatedSlidingButtonCompletionBlock = v4;

  [(PHSlidingView *)self setSlidingViewState:0];

  [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
}

- (void)setMedicalIDSlidingButtonCompletionBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id medicalIDSlidingButtonCompletionBlock = self->_medicalIDSlidingButtonCompletionBlock;
  self->_id medicalIDSlidingButtonCompletionBlock = v4;

  id v6 = self->_medicalIDSlidingButtonCompletionBlock;
  if (v6) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [(PHSlidingView *)self setHasTwoMiddleSliders:v6 != 0];
  id v8 = [(PHSlidingView *)self medicalIDSlidingButton];
  [v8 setAlpha:v7];

  [(PHSlidingView *)self updateMiddleViewSliderConstraintConstants];
}

- (void)interactiveStartWithCountdownModel:(id)a3
{
  id v4 = a3;
  if ([(PHSlidingView *)self slidingViewState])
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = [(PHSlidingView *)self slidingViewState];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSlidingView,ignoring interactive start in state %d", buf, 8u);
    }

    goto LABEL_13;
  }
  +[SOSUtilities clawReleaseToCallSupport];
  double v7 = v6;
  [(PHSlidingView *)self clearMetricItems];
  if (v7 <= 0.0)
  {
LABEL_12:
    [(PHSlidingView *)self setSlidingViewState:1];
    [(PHSlidingView *)self startMotionStateTracking];
    -[PHSlidingView repeatingUpdateAnimatedSliderForCountdownNumber:forModel:](self, "repeatingUpdateAnimatedSliderForCountdownNumber:forModel:", [v4 countdown], v4);
    goto LABEL_13;
  }
  [(PHSlidingView *)self clearClawHoldInitialTimer];
  id v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  double v10 = v9;
  [(PHSlidingView *)self sliderViewCreationTime];
  double v12 = v11;

  v13 = [(PHSlidingView *)self clawHoldInitialTimer];

  if (v13 || (double v14 = v12 - v10 + 1.5, v14 <= 0.0))
  {
    [(PHSlidingView *)self clearMetricItems];
    goto LABEL_12;
  }
  v15 = sub_1000D5130();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PHSlidingView,interactiveStartWithCountdownModel,wait for %f seconds before moving to slider progressing state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000713B0;
  v20 = &unk_1002CEF70;
  objc_copyWeak(&v22, (id *)buf);
  id v21 = v4;
  id v16 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v17 block:v14];
  -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", v16, v17, v18, v19, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

- (void)interactiveStop:(id)a3
{
  uint64_t v18 = (void (**)(double))a3;
  if (+[SOSUtilities isMountStateTrackingEnabled])
  {
    id v4 = [(PHSlidingView *)self cmMotionActivityManager];

    if (v4)
    {
      id v5 = [(PHSlidingView *)self cmMotionActivityManager];
      [v5 stopPeriodicActivityUpdates];

      double v6 = [(PHSlidingView *)self motionActivityList];
      [v6 removeAllObjects];
    }
  }
  if ([(PHSlidingView *)self slidingViewState])
  {
    if ((id)[(PHSlidingView *)self slidingViewState] == (id)1)
    {
      double v7 = [(PHSlidingView *)self animatedSlidingButton];
      id v8 = [v7 acceptButton];
      [v8 knobPosition];
      double v10 = v9;

      [(PHSlidingView *)self setSlidingViewState:0];
      +[SOSUtilities clawReleaseToCallSupport];
      if (v11 != 0.0)
      {
        double v12 = [(PHSlidingView *)self clawHoldInitialTimer];
        [v12 invalidate];

        [(PHSlidingView *)self setClawHoldInitialTimer:0];
      }
      [(PHSlidingView *)self invalidateCountdownAndStopSounds];
      [(PHSlidingView *)self resetAnimatedSlider];
      [(PHSlidingView *)self stopFlash];
      v18[2](v10);
    }
    else if ((id)[(PHSlidingView *)self slidingViewState] == (id)2)
    {
      [(PHSlidingView *)self releaseToCallStartTime];
      if (v13 >= 0.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [(PHSlidingView *)self releaseToCallStartTime];
        [(PHSlidingView *)self setTimeToReleaseClaw:vcvtpd_s64_f64(vabdd_f64(Current, v15))];
      }
      id v16 = [(PHSlidingView *)self clawHoldInitialTimer];
      [v16 invalidate];

      [(PHSlidingView *)self setClawHoldInitialTimer:0];
      [(PHSlidingView *)self clearReleaseToCallState];
      [(PHSlidingView *)self setSlidingViewState:4];
      [(PHSlidingView *)self didFinishSOSSliding:4];
    }
    else if ((id)[(PHSlidingView *)self slidingViewState] == (id)3 {
           || (id)[(PHSlidingView *)self slidingViewState] == (id)5)
    }
    {
      id v17 = [(PHSlidingView *)self clawHoldInitialTimer];
      [v17 invalidate];

      [(PHSlidingView *)self setClawHoldInitialTimer:0];
      [(PHSlidingView *)self setSlidingViewState:0];
    }
  }
  else
  {
    [(PHSlidingView *)self clearClawHoldInitialTimer];
  }
}

- (void)clearClawHoldInitialTimer
{
  objc_super v3 = [(PHSlidingView *)self clawHoldInitialTimer];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating clawHoldInitialTimer", v7, 2u);
    }

    double v6 = [(PHSlidingView *)self clawHoldInitialTimer];
    [v6 invalidate];

    [(PHSlidingView *)self setClawHoldInitialTimer:0];
  }
}

- (void)startMotionStateTracking
{
  if (+[SOSUtilities isMountStateTrackingEnabled])
  {
    objc_super v3 = [(PHSlidingView *)self cmMotionActivityManager];

    if (v3)
    {
      unsigned int v4 = sub_1000D5130();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSlidingView,CMMotionActivity,about to call startPeriodicActivityUpdatesToQueue", (uint8_t *)buf, 2u);
      }

      id v5 = [(PHSlidingView *)self motionActivityList];
      [v5 removeAllObjects];

      objc_initWeak(buf, self);
      double v6 = [(PHSlidingView *)self cmMotionActivityManager];
      double v7 = [(PHSlidingView *)self motionActivityQueue];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000718A8;
      v8[3] = &unk_1002CEF98;
      objc_copyWeak(&v9, buf);
      [v6 startPeriodicActivityUpdatesToQueue:v7 withHandler:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
    }
  }
}

- (void)invalidateCountdownAndStopSounds
{
  objc_super v3 = [(PHSlidingView *)self interactivelyAnimateSlidingButtonBlock];

  if (v3)
  {
    unsigned int v4 = [(PHSlidingView *)self interactivelyAnimateSlidingButtonBlock];
    dispatch_block_cancel(v4);

    [(PHSlidingView *)self setInteractivelyAnimateSlidingButtonBlock:0];
  }
  id v5 = [(PHSlidingView *)self sliderTimingBlock];

  if (v5)
  {
    double v6 = [(PHSlidingView *)self sliderTimingBlock];
    dispatch_block_cancel(v6);

    [(PHSlidingView *)self setSliderTimingBlock:0];
  }
  double v7 = [(PHSlidingView *)self sliderAnimator];

  if (v7)
  {
    id v8 = [(PHSlidingView *)self sliderAnimator];
    [v8 stopAnimation:1];
  }
  id v9 = [(PHSlidingView *)self alertController];
  [v9 stopAlert];
}

- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4
{
  id v6 = a4;
  BOOL v7 = (unint64_t)[v6 countdownWithAudio] < a3;
  id v8 = [v6 countdown];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100071EC0;
  v27[3] = &unk_1002CEFC0;
  v27[4] = self;
  BOOL v29 = v7;
  id v9 = v6;
  id v28 = v9;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100071FB0;
  v23[3] = &unk_1002CF010;
  v23[4] = self;
  double v25 = objc_retainBlock(v27);
  unint64_t v26 = a3;
  id v10 = v9;
  id v24 = v10;
  double v11 = v25;
  double v12 = objc_retainBlock(v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000720A4;
  v22[3] = &unk_1002CD518;
  v22[4] = self;
  double v13 = objc_retainBlock(v22);
  if ((id)[(PHSlidingView *)self slidingViewState] == (id)1)
  {
    [v10 countdownTickDuration];
    double v15 = 0.200000003;
    if (v8 != (id)a3) {
      double v15 = 0.0;
    }
    if (a3) {
      id v16 = v12;
    }
    else {
      id v16 = v13;
    }
    if (a3) {
      double v17 = v15 + v14 + -0.25 + -0.280999988;
    }
    else {
      double v17 = v14;
    }
    id v18 = objc_retainBlock(v16);
    dispatch_block_t v19 = dispatch_block_create((dispatch_block_flags_t)0, v18);
    [(PHSlidingView *)self setSliderTimingBlock:v19];

    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    id v21 = [(PHSlidingView *)self sliderTimingBlock];
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, v21);
  }
}

- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(unint64_t)a4 afterDelay:(double)a5 completion:(id)a6
{
  id v10 = a6;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072384;
  block[3] = &unk_1002CF038;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v18[2] = (id)a4;
  id v11 = v10;
  id v17 = v11;
  dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [(PHSlidingView *)self setInteractivelyAnimateSlidingButtonBlock:v12];

  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  id v14 = &_dispatch_main_q;
  double v15 = [(PHSlidingView *)self interactivelyAnimateSlidingButtonBlock];
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(double)a4 completion:(id)a5
{
  id v8 = a5;
  if ((id)[(PHSlidingView *)self slidingViewState] == (id)1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100072510;
    v13[3] = &unk_1002CF060;
    v13[4] = self;
    v13[5] = a3;
    *(double *)&v13[6] = a4;
    id v9 = objc_retainBlock(v13);
    id v10 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v9 controlPoint1:0.25 controlPoint2:0.25 animations:0.1];
    [(PHSlidingView *)self setSliderAnimator:v10];

    if (v8)
    {
      id v11 = [(PHSlidingView *)self sliderAnimator];
      [v11 addCompletion:v8];
    }
    dispatch_block_t v12 = [(PHSlidingView *)self sliderAnimator];
    [v12 startAnimation];
  }
}

- (void)resetAnimatedSlider
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000726A0;
  v4[3] = &unk_1002CD518;
  void v4[4] = self;
  int v2 = objc_retainBlock(v4);
  id v3 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v2 controlPoint1:0.25 controlPoint2:0.25 animations:0.1];
  [v3 startAnimation];
}

- (void)setUpConstraints
{
  [(PHSlidingView *)self createPowerDownConstraints];
  id v3 = [(PHSlidingView *)self medicalIDSlidingButton];
  unsigned int v4 = [v3 bottomAnchor];
  id v5 = [(PHSlidingView *)self centerYAnchor];
  [(PHSlidingView *)self medicalIDSliderBottomConstraintConstant];
  [v4 constraintEqualToAnchor:v5];
  id v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  medicalIDSliderBottomConstraint = self->_medicalIDSliderBottomConstraint;
  self->_medicalIDSliderBottomConstraint = v6;

  id v8 = [(PHSlidingView *)self animatedSlidingButton];
  id v9 = [v8 topAnchor];
  id v10 = [(PHSlidingView *)self centerYAnchor];
  [(PHSlidingView *)self animatedSliderTopConstraintConstant];
  [v9 constraintEqualToAnchor:v10];
  id v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  animatedSliderTopConstraint = self->_animatedSliderTopConstraint;
  self->_animatedSliderTopConstraint = v11;

  dispatch_time_t v13 = [(PHSlidingView *)self medicalIDSlidingButton];
  id v14 = [v13 centerXAnchor];
  double v15 = [(PHSlidingView *)self centerXAnchor];
  v100 = [v14 constraintEqualToAnchor:v15];

  id v16 = [(PHSlidingView *)self animatedSlidingButton];
  id v17 = [v16 centerXAnchor];
  id v18 = [(PHSlidingView *)self centerXAnchor];
  id v99 = [v17 constraintEqualToAnchor:v18];

  dispatch_block_t v19 = [(PHSlidingView *)self descriptionLabel];
  dispatch_time_t v20 = [v19 leadingAnchor];
  id v21 = [(PHSlidingView *)self leadingAnchor];
  v98 = [v20 constraintEqualToAnchor:v21];

  id v22 = [(PHSlidingView *)self descriptionLabel];
  v23 = [v22 trailingAnchor];
  id v24 = [(PHSlidingView *)self trailingAnchor];
  id v97 = [v23 constraintEqualToAnchor:v24];

  double v25 = [(PHSlidingView *)self descriptionLabel];
  unint64_t v26 = [v25 topAnchor];
  v27 = [(PHSlidingView *)self animatedSlidingButton];
  id v28 = [v27 bottomAnchor];
  v96 = [v26 constraintEqualToAnchor:v28 constant:15.0];

  BOOL v29 = [(PHSlidingView *)self descriptionLabel];
  v30 = [v29 centerXAnchor];
  double v31 = [(PHSlidingView *)self centerXAnchor];
  v95 = [v30 constraintEqualToAnchor:v31];

  id v32 = [(PHSlidingView *)self titleLabel];
  double v33 = [v32 leadingAnchor];
  id v34 = [(PHSlidingView *)self leadingAnchor];
  [(PHSlidingView *)self sliderButtonWidth];
  uint64_t v94 = [v33 constraintEqualToAnchor:v34 constant:v35 * 0.5 + 16.0];

  v36 = [(PHSlidingView *)self titleLabel];
  v37 = [v36 trailingAnchor];
  v38 = [(PHSlidingView *)self trailingAnchor];
  [(PHSlidingView *)self sliderButtonWidth];
  v93 = [v37 constraintEqualToAnchor:v38 constant:-(v39 * 0.5 + 16.0)];

  v40 = [(PHSlidingView *)self titleLabel];
  v41 = [v40 centerXAnchor];
  v42 = [(PHSlidingView *)self centerXAnchor];
  v92 = [v41 constraintEqualToAnchor:v42];

  v43 = [(PHSlidingView *)self titleLabel];
  id v44 = [v43 topAnchor];
  double v45 = [(PHSlidingView *)self safeAreaLayoutGuide];
  CGFloat v46 = [v45 topAnchor];
  [(PHSlidingView *)self titleDistanceFromTop];
  double v47 = [v44 constraintEqualToAnchor:v46];

  [(PHSlidingView *)self volumeButtonDimension];
  CGFloat x = v102.origin.x;
  CGFloat y = v102.origin.y;
  CGFloat width = v102.size.width;
  CGFloat height = v102.size.height;
  CGFloat v52 = v102.origin.y + CGRectGetHeight(v102) * 0.5;
  uint64_t v53 = [(PHSlidingView *)self volumeButtonHighlightView];
  double v54 = [v53 centerXAnchor];
  double v55 = [(PHSlidingView *)self leftAnchor];
  double v91 = [v54 constraintEqualToAnchor:v55];

  v56 = [(PHSlidingView *)self volumeButtonHighlightView];
  v57 = [v56 centerYAnchor];
  v58 = [(PHSlidingView *)self topAnchor];
  double v59 = [v57 constraintEqualToAnchor:v58 constant:v52];
  volumeButtonHighlightViewCenterYConstraint = self->_volumeButtonHighlightViewCenterYConstraint;
  self->_volumeButtonHighlightViewCenterYConstraint = v59;

  v61 = [(PHSlidingView *)self volumeButtonHighlightView];
  v62 = [v61 widthAnchor];
  [(PHSlidingView *)self sliderButtonWidth];
  v90 = [v62 constraintEqualToConstant:];

  v63 = [(PHSlidingView *)self volumeButtonHighlightView];
  v64 = [v63 heightAnchor];
  v103.origin.CGFloat x = x;
  v103.origin.CGFloat y = y;
  v103.size.CGFloat width = width;
  v103.size.CGFloat height = height;
  double v65 = [v64 constraintEqualToConstant:CGRectGetHeight(v103)];
  volumeButtonHighlightViewHeightConstraint = self->_volumeButtonHighlightViewHeightConstraint;
  self->_volumeButtonHighlightViewHeightConstraint = v65;

  [(PHSlidingView *)self lockButtonDimension];
  CGFloat v67 = v104.origin.x;
  CGFloat v68 = v104.origin.y;
  CGFloat v69 = v104.size.width;
  CGFloat v70 = v104.size.height;
  CGFloat v71 = v104.origin.y + CGRectGetHeight(v104) * 0.5;
  v72 = [(PHSlidingView *)self lockButtonHighlightView];
  v73 = [v72 centerXAnchor];
  v74 = [(PHSlidingView *)self rightAnchor];
  v89 = [v73 constraintEqualToAnchor:v74];

  v75 = [(PHSlidingView *)self lockButtonHighlightView];
  v76 = [v75 centerYAnchor];
  v77 = [(PHSlidingView *)self topAnchor];
  v88 = [v76 constraintEqualToAnchor:v77 constant:v71];

  v78 = [(PHSlidingView *)self lockButtonHighlightView];
  v79 = [v78 widthAnchor];
  [(PHSlidingView *)self sliderButtonWidth];
  v87 = [v79 constraintEqualToConstant:];

  v80 = [(PHSlidingView *)self lockButtonHighlightView];
  v81 = [v80 heightAnchor];
  v105.origin.CGFloat x = v67;
  v105.origin.CGFloat y = v68;
  v105.size.CGFloat width = v69;
  v105.size.CGFloat height = v70;
  v82 = [v81 constraintEqualToConstant:CGRectGetHeight(v105)];

  v83 = self->_animatedSliderTopConstraint;
  v101[0] = self->_medicalIDSliderBottomConstraint;
  v101[1] = v83;
  v101[2] = v100;
  v101[3] = v99;
  v101[4] = v98;
  v101[5] = v97;
  v101[6] = v96;
  v101[7] = v95;
  v101[8] = v92;
  v101[9] = v47;
  v101[10] = v94;
  v101[11] = v93;
  double v84 = self->_volumeButtonHighlightViewCenterYConstraint;
  v101[12] = v91;
  v101[13] = v84;
  v85 = self->_volumeButtonHighlightViewHeightConstraint;
  v101[14] = v90;
  v101[15] = v85;
  v101[16] = v89;
  v101[17] = v88;
  v101[18] = v87;
  v101[19] = v82;
  v86 = +[NSArray arrayWithObjects:v101 count:20];
  +[NSLayoutConstraint activateConstraints:v86];
}

- (double)titleDistanceFromTop
{
  double v2 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v2 = v4 * 0.0599999987;
  }
  return v2;
}

- (double)distanceBetweenMiddleSliders
{
  if (qword_100325FF8 != -1) {
    dispatch_once(&qword_100325FF8, &stru_1002CF080);
  }
  return *(double *)&qword_100325FF0;
}

- (double)medicalIDSliderBottomConstraintConstant
{
  id v3 = [(PHSlidingView *)self powerOffSlidingButton];
  [v3 frame];
  double v5 = v4;
  id v6 = [(PHSlidingView *)self powerOffSlidingButton];
  [v6 frame];
  double v8 = (v5 + v7) * 0.5;
  [(PHSlidingView *)self distanceBetweenMiddleSliders];
  double v10 = v8 - v9 * 0.5;

  return v10;
}

- (double)animatedSliderTopConstraintConstant
{
  unsigned int v3 = [(PHSlidingView *)self hasTwoMiddleSliders];
  double v4 = [(PHSlidingView *)self powerOffSlidingButton];
  [v4 frame];
  double v6 = v5;
  double v7 = [(PHSlidingView *)self powerOffSlidingButton];
  [v7 frame];
  double v9 = (v6 + v8) * 0.5;
  if (v3)
  {
    [(PHSlidingView *)self distanceBetweenMiddleSliders];
    double v11 = v10 * 0.5 + v9;
  }
  else
  {
    dispatch_block_t v12 = [(PHSlidingView *)self animatedSlidingButton];
    [v12 frame];
    double v11 = v9 + v13 * -0.5;
  }
  return v11;
}

- (void)updateMiddleViewSliderConstraintConstants
{
  [(PHSlidingView *)self medicalIDSliderBottomConstraintConstant];
  double v4 = v3;
  double v5 = [(PHSlidingView *)self medicalIDSliderBottomConstraint];
  [v5 setConstant:v4];

  [(PHSlidingView *)self animatedSliderTopConstraintConstant];
  double v7 = v6;
  id v8 = [(PHSlidingView *)self animatedSliderTopConstraint];
  [v8 setConstant:v7];
}

- (void)didFinishSOSSliding:(unint64_t)a3
{
  double v5 = [(PHSlidingView *)self animatedSlidingButtonCompletionBlock];

  if (v5)
  {
    double v6 = [(PHSlidingView *)self animatedSlidingButtonCompletionBlock];
    v6[2](v6, a3);
  }
}

- (BOOL)isCallDueToMountedState
{
  if (!+[SOSUtilities isMountStateTrackingEnabled])goto LABEL_12; {
  double v3 = [(PHSlidingView *)self motionActivityList];
  }
  if (!v3) {
    return (char)v3;
  }
  double v4 = [(PHSlidingView *)self motionActivityList];
  id v5 = [v4 count];

  if (!v5)
  {
LABEL_12:
    LOBYTE(v3) = 0;
    return (char)v3;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v6 = [(PHSlidingView *)self motionActivityList];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) mountedProbability];
        double v10 = v10 + v12;
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  id v14 = [(PHSlidingView *)self motionActivityList];
  double v15 = v10 / (double)(unint64_t)[v14 count];

  id v16 = sub_1000D5130();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PHSlidingView,averageMountedProbability:%lf", buf, 0xCu);
  }

  [(PHSlidingView *)self setWasMountedProbability:vcvtpd_s64_f64(v15 * 100.0)];
  double v3 = [(PHSlidingView *)self motionActivityList];
  [(PHSlidingView *)self setNumberOfEpochsForMountProbability:[v3 count]];

  [(PHSlidingView *)self setWasMounted:0];
  +[SOSUtilities mountProbabilityThreshold];
  LOBYTE(v3) = 0;
  if (v15 >= v17)
  {
    double v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHSlidingView,device is in mounted state", buf, 2u);
    }

    LOBYTE(v3) = 1;
    [(PHSlidingView *)self setWasMounted:1];
  }
  return (char)v3;
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PHSlidingView *)self animatedSlidingButton];

  if (v5 == v4)
  {
    [(PHSlidingView *)self setSlidingViewState:4];
    [(PHSlidingView *)self didFinishSOSSliding:1];
  }
  else
  {
    id v6 = [(PHSlidingView *)self medicalIDSlidingButton];

    if (v6 == v4)
    {
      double v11 = [(PHSlidingView *)self medicalIDSlidingButtonCompletionBlock];

      if (v11)
      {
        double v12 = [(PHSlidingView *)self medicalIDSlidingButtonCompletionBlock];
        v12[2]();
      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100073700;
      v13[3] = &unk_1002CD518;
      v13[4] = self;
      +[UIView animateWithDuration:v13 animations:0.3];
    }
    else
    {
      id v7 = [(PHSlidingView *)self powerOffSlidingButton];

      if (v7 == v4)
      {
        id v8 = [(PHSlidingView *)self powerDownCompletionBlock];

        if (v8)
        {
          uint64_t v9 = [(PHSlidingView *)self powerDownCompletionBlock];
          v9[2]();
        }
        double v10 = +[SOSStatusReporter sharedInstance];
        [v10 updateSOSFlowState:6];

        [(PHSlidingView *)self _animatePowerDown];
      }
    }
  }
}

- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4
{
  id v6 = a3;
  id v7 = [(PHSlidingView *)self powerOffSlidingButton];

  if (v7 == v6)
  {
    [(SBUIShapeView *)self->_darkeningUnderlayView setAlpha:a4];
    [(SBUIShapeView *)self->_darkeningOverlayView setAlpha:a4 * 0.5];
    [(PHSlidingView *)self _updatePowerOffSliderExclusionPath];
  }
}

- (void)_updatePowerOffSliderExclusionPath
{
  double v3 = +[UIScreen mainScreen];
  [v3 bounds];
  id v4 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");

  id v5 = [(PHSlidingView *)self powerOffSlidingButton];
  id v6 = [v5 acceptButton];
  id v7 = [v6 knobMaskPath];

  id v8 = [(PHSlidingView *)self powerOffSlidingButton];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v12;
  v20.size.CGFloat width = v14;
  v20.size.CGFloat height = v16;
  CGFloat MinX = CGRectGetMinX(v20);
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v12;
  v21.size.CGFloat width = v14;
  v21.size.CGFloat height = v16;
  CGFloat MinY = CGRectGetMinY(v21);
  CGAffineTransformMakeTranslation(&v19, MinX, MinY);
  [v7 applyTransform:&v19];
  [v4 appendBezierPath:v7];
  [(SBUIShapeView *)self->_darkeningUnderlayView setPath:v4];
  [(SBUIShapeView *)self->_darkeningOverlayView setPath:v4];
}

- (void)_animatePowerDown
{
  if ([(PHSlidingView *)self deviceSupportsFindMy]
    && [(PHSlidingView *)self shouldPowerDownViewShowFindMyAlert])
  {
    [(PHSlidingButton *)self->_powerOffSlidingButton removeFromSuperview];
    double v3 = [(PHSlidingView *)self _createPowerDownSlider];
    powerOffSlidingButton = self->_powerOffSlidingButton;
    self->_powerOffSlidingButton = v3;

    [(PHSlidingView *)self addSubview:self->_powerOffSlidingButton];
    [(PHSlidingView *)self createPowerDownConstraints];
    [(PHSlidingView *)self setNeedsLayout];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100073BA0;
    v10[3] = &unk_1002CD518;
    v10[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v10 completion:0];
    id v5 = [(PHSlidingView *)self delegate];
    void v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100073BFC;
    v9[3] = &unk_1002CD518;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100073E48;
    v8[3] = &unk_1002CD518;
    [v5 showPowerDownFindMyInfoAlertWithProceed:v9 cancelCompletion:v8];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100073EB4;
    v7[3] = &unk_1002CD518;
    v7[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100073F10;
    v6[3] = &unk_1002CD540;
    v6[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:v6];
  }
}

- (void)_powerOff
{
  BOOL v3 = [(PHSlidingView *)self userWantsFindMySuppressed];
  if (v3)
  {
    id v4 = [(PHSlidingView *)self beaconManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100074090;
    v5[3] = &unk_1002CDA98;
    id v6 = &stru_1002CF0C0;
    [v4 setSuppressLPEMBeaconing:1 completion:v5];
  }
  else
  {
    sub_100073FE0((id)v3);
  }
}

- (void)clearReleaseToCallState
{
  [(PHSlidingView *)self clearReleaseToCallTimer];
  [(PHSlidingView *)self stopVoiceLoopMessagePlayback];
  [(PHSlidingView *)self clearReleaseToCallVoiceLoopTimer];

  [(PHSlidingView *)self setSlidingViewState:4];
}

- (void)clearReleaseToCallTimer
{
  BOOL v3 = [(PHSlidingView *)self releaseToCallTimer];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating PHSOSReleaseToCallCountdown timer", v7, 2u);
    }

    id v6 = [(PHSlidingView *)self releaseToCallTimer];
    [v6 invalidate];

    [(PHSlidingView *)self setReleaseToCallTimer:0];
  }
}

- (void)startVoiceLoopMessagePlaybackWithMessageType:(int64_t)a3
{
  [(PHSlidingView *)self stopVoiceLoopMessagePlayback];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0x66)
  {
    double v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHSlidingView,startVoiceLoopMessagePlaybackWithMessageType,unsupported message,ignoring request", v10, 2u);
    }
    goto LABEL_10;
  }
  +[SOSUtilities clawReleaseToCallSupport];
  if (v5 != 0.0)
  {
    if (+[SOSUtilities shouldPlayAudioDuringCountdown])
    {
      id v6 = [(PHSlidingView *)self voiceMessageManager];

      if (!v6)
      {
        id v7 = [objc_alloc((Class)SOSVoiceMessageManager) initWithMessageType:a3];
        [(PHSlidingView *)self setVoiceMessageManager:v7];

        id v8 = sub_1000D5130();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHSlidingView,startVoiceLoopMessagePlaybackWithMessageType,starting release to call voice message", buf, 2u);
        }

        double v9 = [(PHSlidingView *)self voiceMessageManager];
        [v9 startMessagePlayback];
LABEL_10:
      }
    }
  }
}

- (void)stopVoiceLoopMessagePlayback
{
  BOOL v3 = [(PHSlidingView *)self voiceMessageManager];

  if (v3)
  {
    unsigned int v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSlidingView,stopVoiceLoopMessagePlayback", v6, 2u);
    }

    double v5 = [(PHSlidingView *)self voiceMessageManager];
    [v5 stopMessagePlayback];

    [(PHSlidingView *)self setVoiceMessageManager:0];
  }
}

- (void)clearReleaseToCallVoiceLoopTimer
{
  BOOL v3 = [(PHSlidingView *)self releaseToCallVoiceLoopTimer];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    double v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating PHSOSReleaseToCallVoiceLoop timer", v7, 2u);
    }

    id v6 = [(PHSlidingView *)self releaseToCallVoiceLoopTimer];
    [v6 invalidate];

    [(PHSlidingView *)self setReleaseToCallVoiceLoopTimer:0];
  }
}

- (void)toggleFlash
{
  +[SOSUtilities clawReleaseToCallSupport];
  if (v3 != 0.0 && (id)[(PHSlidingView *)self slidingViewState] == (id)1)
  {
    if (+[SOSUtilities shouldPlayAudioDuringCountdown])
    {
      unsigned int v4 = [(PHSlidingView *)self avCaptureDispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007457C;
      block[3] = &unk_1002CD518;
      void block[4] = self;
      dispatch_async(v4, block);
    }
  }
}

- (void)stopFlash
{
  +[SOSUtilities clawReleaseToCallSupport];
  if (v3 != 0.0)
  {
    unsigned int v4 = [(PHSlidingView *)self avCaptureDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074790;
    block[3] = &unk_1002CD518;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

- (CGRect)lockButtonDimension
{
  if (qword_100326020 != -1) {
    dispatch_once(&qword_100326020, &stru_1002CF0E0);
  }
  double v2 = sub_1000D5130();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = NSStringFromCGRect(*(CGRect *)ymmword_100326000);
    int v8 = 138412290;
    double v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PHSlidingView,lockButtonDimension,lock button frame - %@", (uint8_t *)&v8, 0xCu);
  }
  double v5 = *(double *)&ymmword_100326000[8];
  double v4 = *(double *)ymmword_100326000;
  double v6 = *(double *)&ymmword_100326000[16];
  double v7 = *(double *)&ymmword_100326000[24];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)volumeButtonDimension
{
  double v2 = +[SOSManager sharedInstance];
  double v3 = [v2 currentSOSButtonPressState];

  double v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)double v39 = [v3 volumeUpPressed];
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = [v3 volumeDownPressed];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,VolumeUpPressed=%d,VolumeDownPressed=%d", buf, 0xEu);
  }

  double v5 = +[UIScreen mainScreen];
  [v5 _referenceBounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  id v32 = sub_10007511C;
  double v33 = &unk_1002CF120;
  uint64_t v34 = v7;
  uint64_t v35 = v9;
  uint64_t v36 = v11;
  uint64_t v37 = v13;
  if (qword_100326078 != -1) {
    dispatch_once(&qword_100326078, &v30);
  }
  if (objc_msgSend(v3, "volumeUpPressed", v30, v31, v32, v33, v34, v35, v36, v37)
    && ([v3 volumeDownPressed] & 1) == 0)
  {
    CGFloat v14 = sub_1000D5130();
    double v15 = (double *)ymmword_100326038;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v16 = NSStringFromCGRect(*(CGRect *)ymmword_100326038);
      *(_DWORD *)buf = 138412546;
      *(void *)double v39 = v16;
      *(_WORD *)&v39[8] = 2048;
      double v40 = *(double *)&ymmword_100326038[8] + *(double *)&ymmword_100326038[24] * 0.5;
      double v17 = "PHSlidingView,volumeButtonDimension,volume UP frame - %@,CenterY - %f";
      goto LABEL_22;
    }
LABEL_23:

    double v25 = *v15;
    CGFloat v18 = v15[1];
    double v22 = v15[2];
    double v19 = v15[3];
    goto LABEL_24;
  }
  if (([v3 volumeUpPressed] & 1) == 0
    && [v3 volumeDownPressed])
  {
    CGFloat v14 = sub_1000D5130();
    double v15 = (double *)ymmword_100326058;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v16 = NSStringFromCGRect(*(CGRect *)ymmword_100326058);
      *(_DWORD *)buf = 138412546;
      *(void *)double v39 = v16;
      *(_WORD *)&v39[8] = 2048;
      double v40 = *(double *)&ymmword_100326058[8] + *(double *)&ymmword_100326058[24] * 0.5;
      double v17 = "PHSlidingView,volumeButtonDimension,volume DOWN frame - %@,CenterY - %f";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if ([v3 volumeUpPressed] && objc_msgSend(v3, "volumeDownPressed"))
  {
    CGFloat v18 = *(double *)&ymmword_100326038[8];
    double v19 = *(double *)&ymmword_100326058[8] + *(double *)&ymmword_100326058[24] - *(double *)&ymmword_100326038[8];
    CGRect v20 = sub_1000D5130();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v41.origin.CGFloat x = 0.0;
      v41.size.CGFloat width = 0.0;
      v41.origin.CGFloat y = v18;
      v41.size.CGFloat height = v19;
      CGRect v21 = NSStringFromCGRect(v41);
      *(_DWORD *)buf = 138412290;
      *(void *)double v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,combined volume frame - %@", buf, 0xCu);
    }
    double v22 = 0.0;
  }
  else
  {
    double v23 = sub_1000D5130();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v42.origin.CGFloat x = 0.0;
      v42.origin.CGFloat y = 0.0;
      v42.size.CGFloat width = 0.0;
      v42.size.CGFloat height = 0.0;
      id v24 = NSStringFromCGRect(v42);
      *(_DWORD *)buf = 138412290;
      *(void *)double v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,no button pressed frame - %@", buf, 0xCu);
    }
    double v19 = 0.0;
    double v22 = 0.0;
    CGFloat v18 = 0.0;
  }
  double v25 = 0.0;
LABEL_24:

  double v26 = v25;
  double v27 = v18;
  double v28 = v22;
  double v29 = v19;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)clearMetricItems
{
  [(PHSlidingView *)self setWasMounted:0];
  [(PHSlidingView *)self setWasMountedProbability:-1];
  [(PHSlidingView *)self setNumberOfEpochsForMountProbability:-1];
  [(PHSlidingView *)self setReleaseToCallStartTime:-1.0];

  [(PHSlidingView *)self setTimeToReleaseClaw:-1];
}

- (unint64_t)slidingViewState
{
  return self->_slidingViewState;
}

- (BOOL)wasMounted
{
  return self->_wasMounted;
}

- (void)setWasMounted:(BOOL)a3
{
  self->_wasMounted = a3;
}

- (int64_t)wasMountedProbability
{
  return self->_wasMountedProbability;
}

- (void)setWasMountedProbability:(int64_t)a3
{
  self->_wasMountedProbabilitCGFloat y = a3;
}

- (int64_t)numberOfEpochsForMountProbability
{
  return self->_numberOfEpochsForMountProbability;
}

- (void)setNumberOfEpochsForMountProbability:(int64_t)a3
{
  self->_numberOfEpochsForMountProbabilitCGFloat y = a3;
}

- (int64_t)timeToReleaseClaw
{
  return self->_timeToReleaseClaw;
}

- (void)setTimeToReleaseClaw:(int64_t)a3
{
  self->_timeToReleaseClaw = a3;
}

- (PHSlidingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHSlidingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)animatedSlidingButtonCompletionBlock
{
  return self->_animatedSlidingButtonCompletionBlock;
}

- (void)setAnimatedSlidingButtonCompletionBlock:(id)a3
{
}

- (id)medicalIDSlidingButtonCompletionBlock
{
  return self->_medicalIDSlidingButtonCompletionBlock;
}

- (id)shouldMaxVolumeCompletionBlock
{
  return self->_shouldMaxVolumeCompletionBlock;
}

- (void)setShouldMaxVolumeCompletionBlock:(id)a3
{
}

- (id)powerDownCompletionBlock
{
  return self->_powerDownCompletionBlock;
}

- (void)setPowerDownCompletionBlock:(id)a3
{
}

- (PHSlidingButton)animatedSlidingButton
{
  return self->_animatedSlidingButton;
}

- (void)setAnimatedSlidingButton:(id)a3
{
}

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
}

- (PHSlidingButton)powerOffSlidingButton
{
  return self->_powerOffSlidingButton;
}

- (void)setPowerOffSlidingButton:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)volumeButtonHighlightView
{
  return self->_volumeButtonHighlightView;
}

- (void)setVolumeButtonHighlightView:(id)a3
{
}

- (UIView)lockButtonHighlightView
{
  return self->_lockButtonHighlightView;
}

- (void)setLockButtonHighlightView:(id)a3
{
}

- (NSLayoutConstraint)volumeButtonHighlightViewCenterYConstraint
{
  return self->_volumeButtonHighlightViewCenterYConstraint;
}

- (void)setVolumeButtonHighlightViewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)volumeButtonHighlightViewHeightConstraint
{
  return self->_volumeButtonHighlightViewHeightConstraint;
}

- (void)setVolumeButtonHighlightViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)medicalIDSliderBottomConstraint
{
  return self->_medicalIDSliderBottomConstraint;
}

- (void)setMedicalIDSliderBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)animatedSliderTopConstraint
{
  return self->_animatedSliderTopConstraint;
}

- (void)setAnimatedSliderTopConstraint:(id)a3
{
}

- (void)setMedicalIDSliderBottomConstraintConstant:(double)a3
{
  self->_medicalIDSliderBottomConstraintConstant = a3;
}

- (void)setAnimatedSliderTopConstraintConstant:(double)a3
{
  self->_animatedSliderTopConstraintConstant = a3;
}

- (BOOL)hasTwoMiddleSliders
{
  return self->_hasTwoMiddleSliders;
}

- (void)setHasTwoMiddleSliders:(BOOL)a3
{
  self->_hasTwoMiddleSliders = a3;
}

- (UIViewPropertyAnimator)sliderAnimator
{
  return self->_sliderAnimator;
}

- (void)setSliderAnimator:(id)a3
{
}

- (id)interactivelyAnimateSlidingButtonBlock
{
  return self->_interactivelyAnimateSlidingButtonBlock;
}

- (void)setInteractivelyAnimateSlidingButtonBlock:(id)a3
{
}

- (id)sliderTimingBlock
{
  return self->_sliderTimingBlock;
}

- (void)setSliderTimingBlock:(id)a3
{
}

- (SBUIShapeView)darkeningUnderlayView
{
  return self->_darkeningUnderlayView;
}

- (void)setDarkeningUnderlayView:(id)a3
{
}

- (SBUIShapeView)darkeningOverlayView
{
  return self->_darkeningOverlayView;
}

- (void)setDarkeningOverlayView:(id)a3
{
}

- (UIButton)findMyButton
{
  return self->_findMyButton;
}

- (void)setFindMyButton:(id)a3
{
}

- (BOOL)deviceSupportsFindMy
{
  return self->_deviceSupportsFindMy;
}

- (void)setDeviceSupportsFindMy:(BOOL)a3
{
  self->_deviceSupportsFindMCGFloat y = a3;
}

- (BOOL)shouldPowerDownViewShowFindMyAlert
{
  return self->_shouldPowerDownViewShowFindMyAlert;
}

- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3
{
  self->_shouldPowerDownViewShowFindMyAlert = a3;
}

- (BOOL)userWantsFindMySuppressed
{
  return self->_userWantsFindMySuppressed;
}

- (void)setUserWantsFindMySuppressed:(BOOL)a3
{
  self->_userWantsFindMySuppressed = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (NSTimer)releaseToCallTimer
{
  return self->_releaseToCallTimer;
}

- (void)setReleaseToCallTimer:(id)a3
{
}

- (NSTimer)releaseToCallVoiceLoopTimer
{
  return self->_releaseToCallVoiceLoopTimer;
}

- (void)setReleaseToCallVoiceLoopTimer:(id)a3
{
}

- (NSTimer)clawHoldInitialTimer
{
  return self->_clawHoldInitialTimer;
}

- (void)setClawHoldInitialTimer:(id)a3
{
}

- (OS_dispatch_queue)avCaptureDispatchQueue
{
  return self->_avCaptureDispatchQueue;
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
}

- (PHSOSAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (AVCaptureDevice)avCaptureDevice
{
  return self->_avCaptureDevice;
}

- (void)setAvCaptureDevice:(id)a3
{
}

- (NSMutableArray)motionActivityList
{
  return self->_motionActivityList;
}

- (void)setMotionActivityList:(id)a3
{
}

- (NSOperationQueue)motionActivityQueue
{
  return self->_motionActivityQueue;
}

- (void)setMotionActivityQueue:(id)a3
{
}

- (CMMotionActivityManager)cmMotionActivityManager
{
  return self->_cmMotionActivityManager;
}

- (void)setCmMotionActivityManager:(id)a3
{
}

- (double)releaseToCallStartTime
{
  return self->_releaseToCallStartTime;
}

- (void)setReleaseToCallStartTime:(double)a3
{
  self->_releaseToCallStartTime = a3;
}

- (double)sliderViewCreationTime
{
  return self->_sliderViewCreationTime;
}

- (void)setSliderViewCreationTime:(double)a3
{
  self->_sliderViewCreationTime = a3;
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeButtonHintViewVisibilityControlling
{
  return self->_volumeButtonHintViewVisibilityControlling;
}

- (void)setVolumeButtonHintViewVisibilityControlling:(id)a3
{
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)sideButtonHintViewVisibilityControlling
{
  return self->_sideButtonHintViewVisibilityControlling;
}

- (void)setSideButtonHintViewVisibilityControlling:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideButtonHintViewVisibilityControlling, 0);
  objc_storeStrong((id *)&self->_volumeButtonHintViewVisibilityControlling, 0);
  objc_storeStrong((id *)&self->_cmMotionActivityManager, 0);
  objc_storeStrong((id *)&self->_motionActivityQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityList, 0);
  objc_storeStrong((id *)&self->_avCaptureDevice, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong((id *)&self->_avCaptureDispatchQueue, 0);
  objc_storeStrong((id *)&self->_clawHoldInitialTimer, 0);
  objc_storeStrong((id *)&self->_releaseToCallVoiceLoopTimer, 0);
  objc_storeStrong((id *)&self->_releaseToCallTimer, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_darkeningOverlayView, 0);
  objc_storeStrong((id *)&self->_darkeningUnderlayView, 0);
  objc_storeStrong(&self->_sliderTimingBlock, 0);
  objc_storeStrong(&self->_interactivelyAnimateSlidingButtonBlock, 0);
  objc_storeStrong((id *)&self->_sliderAnimator, 0);
  objc_storeStrong((id *)&self->_animatedSliderTopConstraint, 0);
  objc_storeStrong((id *)&self->_medicalIDSliderBottomConstraint, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_lockButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_powerOffSlidingButton, 0);
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_animatedSlidingButton, 0);
  objc_storeStrong(&self->_powerDownCompletionBlock, 0);
  objc_storeStrong(&self->_shouldMaxVolumeCompletionBlock, 0);
  objc_storeStrong(&self->_medicalIDSlidingButtonCompletionBlock, 0);
  objc_storeStrong(&self->_animatedSlidingButtonCompletionBlock, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end