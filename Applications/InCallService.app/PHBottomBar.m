@interface PHBottomBar
+ (double)ambientWidth;
+ (double)defaultBottomMargin;
+ (double)defaultBottomSupplementalButtonSpacing;
+ (double)defaultInterButtonSpacing;
+ (double)defaultSideMarginForDoubleButton;
+ (double)defaultSideMarginForSingleButton;
+ (double)defaultWidth;
+ (double)defaultYOffsetForBottomButtons;
- (BOOL)animateFromState:(int64_t)a3 toState:(int64_t)a4 completion:(id)a5;
- (BOOL)animating;
- (BOOL)blursBackground;
- (BOOL)callScreeningAvailable;
- (BOOL)currentCallIsMuted;
- (BOOL)declineAndMessageIsAvailable;
- (BOOL)declineAndRemindIsAvailable;
- (BOOL)isShowingButtonCountdown;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldShowActionTypeAudioRoute;
- (BOOL)shouldShowActionTypeCameraFlip;
- (BOOL)shouldShowActionTypeEffects;
- (BOOL)shouldShowActionTypePhotoCapture;
- (BOOL)shouldShowActionTypePunchOut;
- (BOOL)shouldShowActionTypeSendToVoicemail;
- (BOOL)shouldShowAnswerRTTButton;
- (BOOL)shouldShowUseRTTButton;
- (BOOL)shouldUseLayoutAsCallScreening;
- (BOOL)updatedSelectedStateForActionType:(int64_t)a3;
- (BOOL)usesLowerButtons;
- (CGRect)frameForControlWithActionType:(int64_t)a3;
- (CGSize)effectiveSize;
- (CGSize)intrinsicContentSize;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSArray)buttonLayoutConstraints;
- (NSArray)buttonsForAmbientTransition;
- (NSArray)horizontalConstraintsForSupplementalButtons;
- (NSMutableArray)pendingStateBlocks;
- (PHBottomBar)initWithCallDisplayStyleManager:(id)a3;
- (PHBottomBar)initWithFrame:(CGRect)a3;
- (PHBottomBarDelegateProtocol)delegate;
- (PHSlidingButton)slidingButton;
- (TUCallCenter)callCenter;
- (UIButton)mainLeftButton;
- (UIButton)mainRightButton;
- (UIButton)sideButtonLeft;
- (UIButton)sideButtonRight;
- (UIButton)supplementalBottomLeftButton;
- (UIButton)supplementalBottomRightButton;
- (UIButton)supplementalTopLeftButton;
- (UIButton)supplementalTopRightButton;
- (UIButton)useRTTButton;
- (UINotificationFeedbackGenerator)alertFeedbackGenerator;
- (UIView)mainButtonLayoutGuide;
- (UIView)topLayoutGuide;
- (_UIVisualEffectBackdropView)captureView;
- (double)bottomMargin;
- (double)heightOfCallScreeningButtonPlusButtonSpacing;
- (double)sideMarginForDoubleButton;
- (double)sideMarginForFaceTimeButtons;
- (double)sideMarginForFaceTimeInCallButtons;
- (double)yOffsetForLoweredButtons;
- (id)_supplementalBottomLeftButtonLayoutConstraints;
- (id)_supplementalBottomRightButtonLayoutConstraints;
- (id)audioRouteImageWithColor:(id)a3;
- (id)constraintsForState:(int64_t)a3;
- (id)controlForActionType:(int64_t)a3;
- (id)customTitleStringForActionType:(int64_t)a3 givenDefaultTitle:(id)a4;
- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8;
- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8 diameter:(double)a9;
- (id)makeCaptureButtonWithDiameter:(double)a3;
- (id)makeSlidingButtonWithType:(int)a3;
- (id)nameForActionType:(int64_t)a3;
- (id)statusChangedHandler;
- (id)updatedImageForActionType:(int64_t)a3 givenDefaultImage:(id)a4;
- (id)updatedSelectedImageForActionType:(int64_t)a3 givenDefaultSelectedImage:(id)a4;
- (id)viewLabels;
- (int64_t)_gestureStateToCompletionState:(int64_t)a3;
- (int64_t)currentBottomBarCallState;
- (int64_t)currentState;
- (int64_t)orientation;
- (int64_t)updatedActionTypeForActionType:(int64_t)a3;
- (void)_startShopDemoMode;
- (void)addSubview:(id)a3;
- (void)ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:(id)a3;
- (void)animateFromFaceTimeOutgoingStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4;
- (void)animateFromIncomingCallStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4;
- (void)animateFromIncomingCallStateToInCallState:(int64_t)a3 withCompletion:(id)a4;
- (void)animateFromOutgoingStateToCallbackAndMessageUIToState:(int64_t)a3 withCompletion:(id)a4;
- (void)animateFromOutgoingStateToInCallStateWithCompletion:(id)a3;
- (void)animateInSupplementalBottomRightButton:(id)a3 WithCompletion:(id)a4;
- (void)animateOutSupplementalBottomLeftButtonToState:(int64_t)a3 withCompletion:(id)a4;
- (void)buttonLongPressed:(id)a3;
- (void)buttonPressed:(id)a3;
- (void)dealloc;
- (void)didFinishSlideForSlidingButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareButtonsForAnimationBegin;
- (void)prepareButtonsForAnimationEnd;
- (void)refreshCustomizedActionTypeTitleForButton:(id)a3;
- (void)refreshCustomizedActionTypeTitles;
- (void)refreshEndCallButton;
- (void)refreshUseRTTButton;
- (void)removeAllButtons;
- (void)setAction:(int64_t)a3 enabled:(BOOL)a4;
- (void)setAction:(int64_t)a3 selected:(BOOL)a4;
- (void)setAlertFeedbackGenerator:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBlursBackground:(BOOL)a3;
- (void)setBottomMargin:(double)a3;
- (void)setButtonLayoutConstraints:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCaptureView:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5;
- (void)setDeclineAndMessageIsAvailable:(BOOL)a3;
- (void)setDeclineAndRemindIsAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalConstraintsForSupplementalButtons:(id)a3;
- (void)setMainButtonLayoutGuide:(id)a3;
- (void)setMainLeftButton:(id)a3;
- (void)setMainRightButton:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPrefersWhiteButtonTextColor:(BOOL)a3;
- (void)setSideButtonLeft:(id)a3;
- (void)setSideButtonRight:(id)a3;
- (void)setSlidingButton:(id)a3;
- (void)setStatusChangedHandler:(id)a3;
- (void)setSupplementalBottomLeftButton:(id)a3;
- (void)setSupplementalBottomRightButton:(id)a3;
- (void)setSupplementalTopLeftButton:(id)a3;
- (void)setSupplementalTopRightButton:(id)a3;
- (void)setTopLayoutGuide:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUsesLowerButtons:(BOOL)a3;
- (void)setYOffsetForLoweredButtons:(double)a3;
- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMainButtonLayoutGuide;
- (void)updateTopLayoutGuide;
- (void)willFinishSlideForSlidingButton:(id)a3;
@end

@implementation PHBottomBar

+ (double)defaultSideMarginForSingleButton
{
  return 16.0;
}

+ (double)defaultSideMarginForDoubleButton
{
  double v2 = 228.0;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] != (id)6
    && (id)+[PHUIConfiguration inCallBottomBarSpacing] != (id)3)
  {
    if (sub_1000FD8C4()) {
      return 25.0;
    }
    else {
      return 31.0;
    }
  }
  return v2;
}

+ (double)defaultInterButtonSpacing
{
  unint64_t v2 = +[PHUIConfiguration inCallBottomBarSpacing];
  double result = 30.0;
  if (v2 != 6)
  {
    unint64_t v4 = +[PHUIConfiguration inCallBottomBarSpacing];
    double result = 24.0;
    if (v4 == 3) {
      return 30.0;
    }
  }
  return result;
}

+ (double)defaultWidth
{
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6) {
    return 414.0;
  }
  unint64_t v3 = +[PHUIConfiguration inCallBottomBarSpacing];
  double result = 320.0;
  if (v3 == 3) {
    return 414.0;
  }
  return result;
}

+ (double)ambientWidth
{
  +[PHUIConfiguration ambientInCallControlSize];
  double v3 = v2;
  +[PHUIConfiguration ambientInCallControlSpacing];
  return v4 + v4 + v3 * 3.0;
}

+ (double)defaultBottomMargin
{
  return 61.0;
}

+ (double)defaultBottomSupplementalButtonSpacing
{
  double v2 = 4.5;
  if (+[PHUIConfiguration inCallBottomBarSpacing]
    && !sub_1000FD8C4())
  {
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)4) {
      return 28.0;
    }
    else {
      return 14.0;
    }
  }
  return v2;
}

+ (double)defaultYOffsetForBottomButtons
{
  double v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  double result = 0.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    unint64_t v5 = +[PHUIConfiguration inCallBottomBarSpacing];
    double result = 40.0;
    if (!v5) {
      return 30.0;
    }
  }
  return result;
}

- (PHBottomBar)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PHBottomBar;
  unint64_t v3 = -[PHBottomBar initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PHBottomBar *)v3 setDeclineAndMessageIsAvailable:1];
    [(PHBottomBar *)v4 setDeclineAndRemindIsAvailable:1];
    unint64_t v5 = +[UIColor clearColor];
    [(PHBottomBar *)v4 setBackgroundColor:v5];

    [(PHBottomBar *)v4 setOpaque:0];
    v6 = [(PHBottomBar *)v4 layer];
    [v6 setHitTestsAsOpaque:1];

    +[PHBottomBar defaultBottomMargin];
    -[PHBottomBar setBottomMargin:](v4, "setBottomMargin:");
    +[PHBottomBar defaultYOffsetForBottomButtons];
    -[PHBottomBar setYOffsetForLoweredButtons:](v4, "setYOffsetForLoweredButtons:");
    v4->_blursBackground = 1;
    v4->_currentState = -1;
    v7 = [(PHBottomBar *)v4 layer];
    [v7 setAllowsGroupOpacity:0];

    v8 = [(PHBottomBar *)v4 layer];
    [v8 setAllowsGroupBlending:0];

    uint64_t v9 = +[NSMutableArray array];
    pendingStateBlocks = v4->_pendingStateBlocks;
    v4->_pendingStateBlocks = (NSMutableArray *)v9;

    uint64_t v11 = +[TUCallCenter sharedInstance];
    callCenter = v4->_callCenter;
    v4->_callCenter = (TUCallCenter *)v11;

    id v13 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
    [(PHBottomBar *)v4 setAlertFeedbackGenerator:v13];

    if ([(PHBottomBar *)v4 callScreeningAvailable]
      || [(PHBottomBar *)v4 shouldUseLayoutAsCallScreening])
    {
      v14 = [(PHBottomBar *)v4 captureView];

      if (!v14)
      {
        id v15 = objc_alloc((Class)_UIVisualEffectBackdropView);
        [(PHBottomBar *)v4 intrinsicContentSize];
        double v17 = v16;
        [(PHBottomBar *)v4 intrinsicContentSize];
        id v19 = [v15 initWithFrame:0.0, 0.0, v17, v18];
        [(PHBottomBar *)v4 setCaptureView:v19];

        v20 = [(PHBottomBar *)v4 captureView];
        [v20 setAutoresizingMask:18];

        v21 = [(PHBottomBar *)v4 captureView];
        [(PHBottomBar *)v4 insertSubview:v21 atIndex:0];

        v22 = [(PHBottomBar *)v4 captureView];
        [v22 setRenderMode:1];

        v23 = [(PHBottomBar *)v4 captureView];
        v24 = [v23 captureGroup];
        [v24 setGroupName:@"PHBottomBarButtonCaptureGroup"];
      }
    }
  }
  return v4;
}

- (PHBottomBar)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v6 = -[PHBottomBar initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(PHSlidingButton *)self->_slidingButton setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBar;
  [(PHBottomBar *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(PHBottomBar *)self callDisplayStyleManager];
  id v4 = [v3 callDisplayStyle];

  if (v4 == (id)3)
  {
    +[PHBottomBar ambientWidth];
    double v6 = v5;
    v7 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v7 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v17 = v8;
  }
  else if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening] {
         || [(PHBottomBar *)self callScreeningAvailable])
  }
  {
    uint64_t v9 = +[UIScreen mainScreen];
    [v9 bounds];
    double v6 = v10;
    double v12 = v11;

    if (v6 >= v12) {
      double v13 = v6;
    }
    else {
      double v13 = v12;
    }
    if (v6 >= v12) {
      double v6 = v12;
    }
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio];
    double v15 = v14 * v13;
    double v16 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v16 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }

    float v18 = v6 * 0.1976;
    double v19 = roundf(v18);
    +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio];
    double v21 = v13 * v20;
    unsigned int v22 = +[PHInCallUIUtilities isSpringBoardPasscodeLocked];
    double v23 = v19 + 12.0;
    double v24 = v15 + -6.0;
    double v25 = v21 + -6.0;
    if (!v22)
    {
      double v24 = v15;
      double v23 = v19;
      double v25 = v21;
    }
    double v17 = v25 + v23 + v24 + 44.0;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FE0A8;
    block[3] = &unk_1002CD518;
    block[4] = self;
    if (qword_100326370 != -1) {
      dispatch_once(&qword_100326370, block);
    }
    double v6 = *(double *)&qword_100326360;
    double v17 = *(double *)&qword_100326368;
  }
  double v26 = v6;
  double v27 = v17;
  result.height = v27;
  result.width = v26;
  return result;
}

- (BOOL)callScreeningAvailable
{
  double v2 = +[TUCallCenter sharedInstance];
  objc_super v3 = [v2 frontmostAudioOrVideoCall];

  id v4 = [v3 provider];
  if ([v4 isFaceTimeProvider])
  {
    double v5 = +[TUCallCenter sharedInstance];
    BOOL v6 = (unint64_t)[v5 currentCallCount] < 2;
  }
  else
  {
    BOOL v6 = 1;
  }

  if (TUCallScreeningEnabledM3())
  {
    v7 = +[UIDevice currentDevice];
    if ([v7 userInterfaceIdiom])
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      uint64_t v9 = +[UIApplication sharedApplication];
      double v10 = [v9 delegate];
      if ([v10 isAnsweringMachineAvailable]
        && [v3 isEligibleForManualScreening])
      {
        double v11 = [v3 provider];
        unsigned int v8 = [v11 isSystemProvider] & v6;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldUseLayoutAsCallScreening
{
  double v2 = +[CNKFeatures sharedInstance];
  unsigned __int8 v3 = [v2 isButtonLayoutEnabled];

  return v3;
}

- (CGSize)effectiveSize
{
  [(PHBottomBar *)self intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if (*(_OWORD *)&self->_supplementalTopLeftButton == 0)
  {
    v7 = [(PHBottomBar *)self callDisplayStyleManager];
    id v8 = [v7 callDisplayStyle];

    if (v8 != (id)3)
    {
      if (self->_sideButtonLeft || self->_sideButtonRight)
      {
        unsigned int v9 = [(PHBottomBar *)self usesLowerButtons];
        double v10 = [(PHBottomBar *)self callDisplayStyleManager];
        id v11 = [v10 callDisplayStyle];
        if (v9)
        {
          if (v11 == (id)3) {
            +[PHUIConfiguration ambientInCallControlSize];
          }
          else {
            +[PHBottomBarButtonConfiguration defaultHeight];
          }
          double v14 = v12;
          unint64_t v15 = +[PHUIConfiguration inCallBottomBarSpacing];
          double v16 = 30.0;
          if (v15 != 6)
          {
            unint64_t v17 = +[PHUIConfiguration inCallBottomBarSpacing];
            double v16 = 24.0;
            if (v17 == 3) {
              double v16 = 30.0;
            }
          }
          double v18 = v14 + v16;
          *(float *)&double v18 = v18;
          double v19 = +[NSNumber numberWithFloat:v18];
          [v19 floatValue];
          double v21 = v20;
          [(PHBottomBar *)self yOffsetForLoweredButtons];
          double v23 = v22 + v21;
        }
        else
        {
          if (v11 == (id)3) {
            +[PHUIConfiguration ambientInCallControlSize];
          }
          else {
            +[PHBottomBarButtonConfiguration defaultHeight];
          }
          double v24 = v13;
          unint64_t v25 = +[PHUIConfiguration inCallBottomBarSpacing];
          double v26 = 30.0;
          if (v25 != 6)
          {
            unint64_t v27 = +[PHUIConfiguration inCallBottomBarSpacing];
            double v26 = 24.0;
            if (v27 == 3) {
              double v26 = 30.0;
            }
          }
          double v28 = v24 + v26;
          *(float *)&double v28 = v28;
          v29 = +[NSNumber numberWithFloat:v28];
          [v29 floatValue];
          double v23 = v30;
        }
      }
      else
      {
        double v10 = [(PHBottomBar *)self callDisplayStyleManager];
        if ([v10 callDisplayStyle] == (id)3) {
          +[PHUIConfiguration ambientInCallControlSize];
        }
        else {
          +[PHBottomBarButtonConfiguration defaultHeight];
        }
        double v23 = v31;
      }
      double v6 = v6 - v23;
    }
  }
  double v32 = v4;
  double v33 = v6;
  result.height = v33;
  result.width = v32;
  return result;
}

- (double)sideMarginForFaceTimeButtons
{
  if (qword_100326380 != -1) {
    dispatch_once(&qword_100326380, &stru_1002D09C8);
  }
  return *(double *)&qword_100326378;
}

- (double)sideMarginForFaceTimeInCallButtons
{
  if (qword_100326390 != -1) {
    dispatch_once(&qword_100326390, &stru_1002D09E8);
  }
  return *(double *)&qword_100326388;
}

- (double)sideMarginForDoubleButton
{
  if ([(PHBottomBar *)self callScreeningAvailable]
    || (+[CNKFeatures sharedInstance],
        double v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isButtonLayoutEnabled],
        v3,
        v4))
  {
    double v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    if (v7 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v7;
    }
    double v11 = 0.102;
  }
  else
  {
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6) {
      double v12 = 228.0;
    }
    else {
      double v12 = dbl_100285160[(id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)3];
    }
    [(PHBottomBar *)self bounds];
    double v14 = v13 - v12;
    +[PHBottomBarButtonConfiguration defaultWidth];
    double v10 = v14 - v15;
    double v11 = 0.5;
  }
  return v10 * v11;
}

- (double)heightOfCallScreeningButtonPlusButtonSpacing
{
  double v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 < v7) {
    double v5 = v7;
  }
  if ((id)[(PHBottomBar *)self currentState] == (id)4
    || (id)[(PHBottomBar *)self currentState] == (id)5)
  {
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio];
    return v5 * v8 + 44.0 + -6.0;
  }
  else
  {
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio];
    return v5 * v10 + 44.0;
  }
}

- (UIView)topLayoutGuide
{
  if (!self->_topLayoutGuide)
  {
    double v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 10.0, 1.0];
    topLayoutGuide = self->_topLayoutGuide;
    self->_topLayoutGuide = v3;

    [(PHBottomBar *)self addSubview:self->_topLayoutGuide];
    [(UIView *)self->_topLayoutGuide setHidden:1];
  }
  [(PHBottomBar *)self updateTopLayoutGuide];
  double v5 = self->_topLayoutGuide;

  return v5;
}

- (UIView)mainButtonLayoutGuide
{
  if (!self->_mainButtonLayoutGuide)
  {
    double v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 10.0, 1.0];
    mainButtonLayoutGuide = self->_mainButtonLayoutGuide;
    self->_mainButtonLayoutGuide = v3;

    [(PHBottomBar *)self addSubview:self->_mainButtonLayoutGuide];
    [(UIView *)self->_mainButtonLayoutGuide setHidden:1];
  }
  [(PHBottomBar *)self updateMainButtonLayoutGuide];
  double v5 = self->_mainButtonLayoutGuide;

  return v5;
}

- (void)updateTopLayoutGuide
{
  [(PHBottomBar *)self bounds];
  double v4 = v3;
  [(PHBottomBar *)self bounds];
  long long v28 = 0u;
  long long v29 = 0u;
  double v6 = v5 * 0.5;
  long long v30 = 0u;
  long long v31 = 0u;
  double v7 = [(PHBottomBar *)self subviews];
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v29;
    double v12 = v6;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v7);
        }
        double v14 = *(UIView **)(*((void *)&v28 + 1) + 8 * i);
        if (v14 != self->_topLayoutGuide)
        {
          [*(id *)(*((void *)&v28 + 1) + 8 * i) frame];
          if (v15 < v4)
          {
            [(UIView *)v14 frame];
            double v4 = v16;
          }
          [(UIView *)v14 frame];
          if (v17 < v12)
          {
            [(UIView *)v14 frame];
            double v12 = v18;
          }
          [(UIView *)v14 frame];
          double v20 = v19;
          [(UIView *)v14 frame];
          double v9 = v20 + v21;
          if (v20 + v21 > v6)
          {
            [(UIView *)v14 frame];
            double v23 = v22;
            [(UIView *)v14 frame];
            double v6 = v23 + v24;
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = v6;
  }

  [(UIView *)self->_topLayoutGuide frame];
  if (v4 != v25)
  {
    if (v4 < 0.0)
    {
      double v26 = sub_1000D5130();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting topLayoutGuide to 0", v27, 2u);
      }

      double v4 = 0.0;
    }
    -[UIView setFrame:](self->_topLayoutGuide, "setFrame:", v12, v4, v6, 1.0);
  }
}

- (void)updateMainButtonLayoutGuide
{
  [(PHBottomBar *)self bounds];
  double v4 = v3;
  [(PHBottomBar *)self bounds];
  uint64_t v6 = 120;
  mainLeftButton = self->_mainLeftButton;
  if (!mainLeftButton)
  {
    uint64_t v6 = 128;
    mainRightButton = self->_mainRightButton;
    if (!mainRightButton)
    {
      uint64_t v6 = 168;
      mainRightButton = self->_slidingButton;
      if (!mainRightButton)
      {
        double v10 = v5;
        double v16 = 10.0;
        goto LABEL_9;
      }
    }
    [mainRightButton frame];
    double v4 = v13;
    [*(id *)((char *)&self->super.super.super.isa + v6) frame];
    double v10 = v14;
    goto LABEL_7;
  }
  [(UIButton *)mainLeftButton frame];
  double v4 = v8;
  [(UIButton *)self->_mainLeftButton frame];
  double v10 = v9;
  uint64_t v11 = self->_mainRightButton;
  if (!v11) {
LABEL_7:
  }
    uint64_t v11 = *(UIButton **)((char *)&self->super.super.super.isa + v6);
  [(UIButton *)v11 frame];
  double v16 = v4 + v15;
LABEL_9:
  [(UIView *)self->_mainButtonLayoutGuide frame];
  if (v4 != v17 || ([(UIView *)self->_mainButtonLayoutGuide frame], v10 != v18))
  {
    if (v4 < 0.0)
    {
      double v19 = sub_1000D5130();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting mainButtonLayoutGuide x value to 0", buf, 2u);
      }

      double v4 = 0.0;
    }
    if (v10 < 0.0)
    {
      double v20 = sub_1000D5130();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting mainButtonLayoutGuide y value to 0", v21, 2u);
      }

      double v10 = 0.0;
    }
    -[UIView setFrame:](self->_mainButtonLayoutGuide, "setFrame:", v4, v10, v16, 1.0);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = [(PHBottomBar *)self subviews];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v14 isHidden] & 1) == 0
          && [v14 isUserInteractionEnabled])
        {
          -[PHBottomBar convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          v11 |= [v14 pointInside:v7];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

- (void)setAction:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(PHBottomBar *)self controlForActionType:a3];
  [v5 setSelected:v4];
}

- (void)setAction:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = -[PHBottomBar controlForActionType:](self, "controlForActionType:");
  id v7 = v6;
  if (a3 == 31)
  {
    [v6 setShowDisabled:v4 ^ 1];
    uint64_t v6 = v7;
  }
  [v6 setEnabled:v4];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHBottomBar *)self isUserInteractionEnabled] != a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(PHBottomBar *)self viewLabels];
    uint64_t v6 = [v5 allValues];

    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setEnabled:v3];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PHBottomBar;
  [(PHBottomBar *)&v11 setUserInteractionEnabled:v3];
}

- (void)setDeclineAndMessageIsAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[TUCallCenter sharedInstance];
  id v11 = [v5 frontmostAudioOrVideoCall];

  if (v3) {
    uint64_t v6 = [v11 isBranded] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(PHBottomBar *)self controlForActionType:12];
  [v7 setEnabled:v6];

  id v8 = [(PHBottomBar *)self controlForActionType:9];
  [v8 setEnabled:v6];

  uint64_t v9 = [(PHBottomBar *)self controlForActionType:12];
  [v9 setHidden:!v3];

  id v10 = [(PHBottomBar *)self controlForActionType:9];
  [v10 setHidden:!v3];

  self->_declineAndMessageIsAvailable = v3;
}

- (void)setDeclineAndRemindIsAvailable:(BOOL)a3
{
  BOOL v5 = !a3;
  uint64_t v6 = [(PHBottomBar *)self controlForActionType:13];
  [v6 setHidden:v5];

  self->_declineAndRemindIsAvailable = a3;
}

- (void)setCurrentState:(int64_t)a3
{
}

- (int64_t)_gestureStateToCompletionState:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 4) {
    int64_t v3 = 2;
  }
  if (a3 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if (![(PHBottomBar *)self animating])
  {
    long long v12 = +[TUCallCenter sharedInstance];
    long long v13 = [v12 frontmostAudioOrVideoCall];

    unsigned int v14 = [(PHBottomBar *)self callScreeningAvailable];
    long long v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v222 = (int64_t)self;
      __int16 v223 = 2048;
      int64_t v224 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BottomBar (%@) set to state: %ld", buf, 0x16u);
    }

    if ([(PHBottomBar *)self currentState] == a3) {
      goto LABEL_84;
    }
    if (v5
      && [(PHBottomBar *)self animateFromState:self->_currentState toState:a3 completion:v8])
    {
      char v16 = 1;
      goto LABEL_63;
    }
    [(PHBottomBar *)self removeAllButtons];
    if (a3)
    {
      if (a3 == 11)
      {
        long long v17 = [(PHBottomBar *)self makeButtonWithType:15 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setMainLeftButton:v17];

        long long v18 = [(PHBottomBar *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          long long v19 = [(PHBottomBar *)self delegate];
          unsigned int v20 = [v19 shouldShowHardPauseNumbers];

          if (!v20)
          {
LABEL_19:
            double v25 = [(PHBottomBar *)self useRTTButton];
            [(PHBottomBar *)self setSupplementalBottomRightButton:v25];

            unsigned int v26 = [(PHBottomBar *)self shouldShowUseRTTButton];
            unint64_t v27 = [(PHBottomBar *)self supplementalBottomRightButton];
            [v27 setAlpha:(double)v26];

            goto LABEL_57;
          }
          unint64_t v21 = +[PHUIConfiguration inCallBottomBarSpacing];
          double v22 = 15.0;
          if (!v21) {
            double v22 = 14.0;
          }
          long long v18 = +[UIFont systemFontOfSize:v22];
          double v23 = +[UIColor whiteColor];
          double v24 = [(PHBottomBar *)self makeButtonWithType:23 title:&stru_1002D6110 image:0 color:0 font:v18 fontColor:v23];
          [(PHBottomBar *)self setSupplementalBottomLeftButton:v24];
        }
        goto LABEL_19;
      }
      if ((unint64_t)(a3 - 1) <= 2)
      {
        double v32 = [(PHBottomBar *)self makeButtonWithType:8 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setMainLeftButton:v32];

        if (a3 == 1) {
          uint64_t v33 = 3;
        }
        else {
          uint64_t v33 = 1;
        }
        v34 = [(PHBottomBar *)self makeButtonWithType:v33 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setMainRightButton:v34];

        v35 = [(PHBottomBar *)self callDisplayStyleManager];
        BOOL v36 = [v35 callDisplayStyle] == (id)3;

        if (v36)
        {
          if (v14)
          {
            v37 = [(PHBottomBar *)self makeButtonWithType:25 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonLeft:v37];
          }
        }
        else if (v14)
        {
          v52 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
          [(PHBottomBar *)self setSupplementalTopLeftButton:v52];

          v53 = [(PHBottomBar *)self makeButtonWithType:25 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
          [(PHBottomBar *)self setSupplementalTopRightButton:v53];
        }
        else
        {
          if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening])
          {
LABEL_150:
            v191 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
            [(PHBottomBar *)self setSupplementalTopLeftButton:v191];

            [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
          }
          else
          {
LABEL_162:
            v207 = [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSupplementalTopLeftButton:v207];

            [(PHBottomBar *)self makeButtonWithType:9 title:0 image:0 color:0 font:0 fontColor:0];
          v192 = };
          [(PHBottomBar *)self setSupplementalTopRightButton:v192];
        }
        goto LABEL_57;
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        switch(a3)
        {
          case 6:
            v47 = [(PHBottomBar *)self callDisplayStyleManager];
            BOOL v48 = [v47 callDisplayStyle] == (id)3;

            if (v48)
            {
              v49 = [(PHBottomBar *)self makeButtonWithType:8 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainLeftButton:v49];

              v50 = [(PHBottomBar *)self makeButtonWithType:3 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainRightButton:v50];

              v51 = [(PHBottomBar *)self makeButtonWithType:9 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v51];
            }
            else
            {
              if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening])
              {
                v175 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
                [(PHBottomBar *)self setSupplementalTopLeftButton:v175];

                [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
              }
              else
              {
                v204 = [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0];
                [(PHBottomBar *)self setSupplementalTopLeftButton:v204];

                [(PHBottomBar *)self makeButtonWithType:9 title:0 image:0 color:0 font:0 fontColor:0];
              v205 = };
              [(PHBottomBar *)self setSupplementalTopRightButton:v205];

              if ([(PHBottomBar *)self shouldShowActionTypeCameraFlip]) {
                [(PHBottomBar *)self makeSlidingButtonWithType:2];
              }
              else {
              v206 = [(PHBottomBar *)self makeSlidingButtonWithType:3];
              }
              [(PHBottomBar *)self setSlidingButton:v206];
            }
            break;
          case 7:
            if ([(PHBottomBar *)self shouldShowActionTypeSendToVoicemail]) {
              uint64_t v109 = 24;
            }
            else {
              uint64_t v109 = 7;
            }
            v110 = [(PHBottomBar *)self makeButtonWithType:v109 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v110];

            v111 = [(PHBottomBar *)self callCenter];
            unsigned int v112 = [v111 isEndAndAnswerAllowed];

            if (v112)
            {
              v113 = [(PHBottomBar *)self makeButtonWithType:4 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v113];
            }
            else
            {
              v113 = +[NSBundle mainBundle];
              v176 = [v113 localizedStringForKey:@"END_CURRENT" value:&stru_1002D6110 table:@"BottomBar"];
              v177 = [(PHBottomBar *)self makeButtonWithType:15 title:v176 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v177];
            }
            v178 = [(PHBottomBar *)self makeButtonWithType:6 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonRight:v178];

            v179 = [(PHBottomBar *)self callDisplayStyleManager];
            BOOL v180 = [v179 callDisplayStyle] == (id)3;

            if (!v180)
            {
              if (![(PHBottomBar *)self shouldUseLayoutAsCallScreening]) {
                goto LABEL_162;
              }
              goto LABEL_150;
            }
            break;
          case 8:
            if ([(PHBottomBar *)self shouldShowActionTypeSendToVoicemail]) {
              uint64_t v114 = 24;
            }
            else {
              uint64_t v114 = 7;
            }
            v115 = [(PHBottomBar *)self makeButtonWithType:v114 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v115];

            v116 = [(PHBottomBar *)self callCenter];
            unsigned int v117 = [v116 isEndAndAnswerAllowed];

            if (v117)
            {
              v118 = [(PHBottomBar *)self makeButtonWithType:4 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v118];
            }
            else
            {
              v118 = +[NSBundle mainBundle];
              v181 = [v118 localizedStringForKey:@"END_CURRENT" value:&stru_1002D6110 table:@"BottomBar"];
              v182 = [(PHBottomBar *)self makeButtonWithType:15 title:v181 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v182];
            }
            v183 = [(PHBottomBar *)self makeButtonWithType:5 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonRight:v183];

            v184 = [(PHBottomBar *)self callDisplayStyleManager];
            BOOL v185 = [v184 callDisplayStyle] == (id)3;

            if (!v185)
            {
              if (![(PHBottomBar *)self shouldUseLayoutAsCallScreening]) {
                goto LABEL_162;
              }
              goto LABEL_150;
            }
            break;
          case 9:
            v119 = [(PHBottomBar *)self callCenter];
            unsigned int v120 = [v119 isEndAndAnswerAllowed];

            if (v120)
            {
              v121 = [(PHBottomBar *)self makeButtonWithType:4 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainRightButton:v121];
            }
            else
            {
              v121 = +[NSBundle mainBundle];
              v186 = [v121 localizedStringForKey:@"END_CURRENT" value:&stru_1002D6110 table:@"BottomBar"];
              v187 = [(PHBottomBar *)self makeButtonWithType:15 title:v186 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainRightButton:v187];
            }
            v188 = [(PHBottomBar *)self makeButtonWithType:7 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v188];

            v189 = [(PHBottomBar *)self callDisplayStyleManager];
            BOOL v190 = [v189 callDisplayStyle] == (id)3;

            if (!v190)
            {
              if (![(PHBottomBar *)self shouldUseLayoutAsCallScreening]) {
                goto LABEL_162;
              }
              goto LABEL_150;
            }
            break;
          case 10:
            v122 = [(PHBottomBar *)self makeSlidingButtonWithType:4];
            [(PHBottomBar *)self setSlidingButton:v122];

            break;
          case 12:
            v131 = [(PHBottomBar *)self makeSlidingButtonWithType:5];
            [(PHBottomBar *)self setSlidingButton:v131];

            break;
          case 13:
            v132 = [(PHBottomBar *)self makeButtonWithType:19 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v132];

            v133 = [(PHBottomBar *)self makeButtonWithType:18 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainRightButton:v133];

            break;
          case 14:
            v134 = [(PHBottomBar *)self makeButtonWithType:15 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v134];

            if ([(PHBottomBar *)self shouldShowActionTypeAudioRoute]) {
              uint64_t v135 = 22;
            }
            else {
              uint64_t v135 = 21;
            }
            +[PHBottomBarButtonConfiguration smallHeight];
            v136 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v135, 0, 0, 0, 0, 0);
            [(PHBottomBar *)self setSideButtonRight:v136];

            +[PHBottomBarButtonConfiguration smallHeight];
            v137 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 20, 0, 0, 0, 0, 0);
            [(PHBottomBar *)self setSideButtonLeft:v137];

            break;
          case 15:
            v138 = [(PHBottomBar *)self makeButtonWithType:15 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v138];

            if ([(PHBottomBar *)self shouldShowActionTypeAudioRoute]) {
              uint64_t v139 = 22;
            }
            else {
              uint64_t v139 = 21;
            }
            +[PHBottomBarButtonConfiguration smallHeight];
            v140 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v139, 0, 0, 0, 0, 0);
            [(PHBottomBar *)self setSideButtonRight:v140];

            if ([(PHBottomBar *)self shouldShowActionTypePunchOut])
            {
              v141 = [(PHBottomBar *)self delegate];
              v142 = [v141 imageForItemInBar:self withActionType:29];
              v143 = +[UIColor whiteColor];
              v144 = [(PHBottomBar *)self makeButtonWithType:29 title:0 image:v142 color:v143 font:0 fontColor:0];
              [(PHBottomBar *)self setSideButtonLeft:v144];
            }
            else if ([(PHBottomBar *)self shouldShowActionTypePhotoCapture])
            {
              +[PHBottomBarButtonConfiguration smallHeight];
              v193 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 31, 0, 0, 0, 0, 0);
              [(PHBottomBar *)self setSideButtonLeft:v193];
            }
            else if ([(PHBottomBar *)self shouldShowActionTypeEffects])
            {
              +[PHBottomBarButtonConfiguration smallHeight];
              v208 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 32, 0, 0, 0, 0, 0);
              [(PHBottomBar *)self setSideButtonLeft:v208];
            }
            else
            {
              [(PHBottomBar *)self setSideButtonLeft:0];
            }
            break;
          case 16:
            v145 = [(PHBottomBar *)self makeSlidingButtonWithType:6];
            [(PHBottomBar *)self setSlidingButton:v145];

            break;
          case 17:
            v146 = [(PHBottomBar *)self makeButtonWithType:18 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonLeft:v146];

            v147 = [(PHBottomBar *)self makeButtonWithType:19 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v147];

            v148 = [(PHBottomBar *)self makeButtonWithType:27 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonRight:v148];

            break;
          case 18:
            v149 = +[NSBundle mainBundle];
            v150 = [v149 localizedStringForKey:@"DONE" value:&stru_1002D6110 table:@"BottomBar"];
            v151 = +[UIFont systemFontOfSize:28.0];
            v152 = +[UIColor whiteColor];
            v153 = [(PHBottomBar *)self makeButtonWithType:14 title:v150 image:0 color:0 font:v151 fontColor:v152];
            [(PHBottomBar *)self setMainLeftButton:v153];

            break;
          case 19:
            v154 = +[CNKFeatures sharedInstance];
            unsigned int v155 = [v154 isDialPadEnabled];

            v156 = [(PHBottomBar *)self makeButtonWithType:15 title:0 image:0 color:0 font:0 fontColor:0];
            if (v155)
            {
              [(PHBottomBar *)self setSupplementalBottomLeftButton:v156];

              v157 = +[NSBundle mainBundle];
              v158 = [v157 localizedStringForKey:@"HIDE_KEYPAD" value:&stru_1002D6110 table:@"BottomBar"];
              unint64_t v159 = +[PHUIConfiguration inCallBottomBarSpacing];
              double v160 = 15.0;
              if (!v159) {
                double v160 = 14.0;
              }
              v161 = +[UIFont systemFontOfSize:v160];
              v162 = +[UIColor whiteColor];
              v163 = [(PHBottomBar *)self makeButtonWithType:17 title:v158 image:0 color:0 font:v161 fontColor:v162];
              [(PHBottomBar *)self setMainRightButton:v163];
            }
            else
            {
              [(PHBottomBar *)self setMainLeftButton:v156];

              v194 = +[NSBundle mainBundle];
              v195 = [v194 localizedStringForKey:@"HIDE" value:&stru_1002D6110 table:@"BottomBar"];
              unint64_t v196 = +[PHUIConfiguration inCallBottomBarSpacing];
              double v197 = 15.0;
              if (!v196) {
                double v197 = 14.0;
              }
              v198 = +[UIFont systemFontOfSize:v197];
              v199 = +[UIColor whiteColor];
              v200 = [(PHBottomBar *)self makeButtonWithType:17 title:v195 image:0 color:0 font:v198 fontColor:v199];
              [(PHBottomBar *)self setSupplementalBottomRightButton:v200];
            }
            break;
          case 20:
            v164 = [(PHBottomBar *)self makeButtonWithType:15 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v164];

            unint64_t v165 = +[PHUIConfiguration inCallBottomBarSpacing];
            double v166 = 15.0;
            if (!v165) {
              double v166 = 14.0;
            }
            v167 = +[UIFont systemFontOfSize:v166];
            v168 = +[UIColor whiteColor];
            v169 = [(PHBottomBar *)self makeButtonWithType:23 title:&stru_1002D6110 image:0 color:0 font:v167 fontColor:v168];
            [(PHBottomBar *)self setSupplementalBottomLeftButton:v169];

            break;
          case 21:
            v170 = [(PHBottomBar *)self makeButtonWithType:26 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v170];

            break;
          case 24:
            v171 = [(PHBottomBar *)self makeSlidingButtonWithType:0];
            [(PHBottomBar *)self setSlidingButton:v171];

            break;
          case 26:
            v172 = [(PHBottomBar *)self makeButtonWithType:33 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonLeft:v172];

            v173 = [(PHBottomBar *)self makeButtonWithType:35 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setMainLeftButton:v173];

            v174 = [(PHBottomBar *)self makeButtonWithType:34 title:0 image:0 color:0 font:0 fontColor:0];
            [(PHBottomBar *)self setSideButtonRight:v174];

            break;
          default:
            if (a3 == 22)
            {
              v201 = [(PHBottomBar *)self makeButtonWithType:37 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainLeftButton:v201];

              v202 = [(PHBottomBar *)self makeButtonWithType:36 title:0 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainRightButton:v202];

              v203 = [(PHBottomBar *)self alertFeedbackGenerator];
              [v203 notificationOccurred:0];
            }
            else if (a3 == 25 || a3 == 23)
            {
              v123 = [(PHBottomBar *)self callDisplayStyleManager];
              BOOL v124 = [v123 callDisplayStyle] == (id)3;

              if (!v124)
              {
                if (a3 == 25)
                {
                  v125 = +[CNKFeatures sharedInstance];
                  unsigned int v126 = [v125 lvm_stopEnabled];

                  v127 = +[NSBundle mainBundle];
                  v128 = v127;
                  if (v126)
                  {
                    v129 = [v127 localizedStringForKey:@"SCREENING_STOP" value:&stru_1002D6110 table:@"BottomBar"];
                    [(PHBottomBar *)self makeButtonWithType:11 title:v129 image:0 color:0 font:0 fontColor:0];
                  }
                  else
                  {
                    v129 = [v127 localizedStringForKey:@"SCREENING_BLOCK" value:&stru_1002D6110 table:@"BottomBar"];
                    [(PHBottomBar *)self makeButtonWithType:10 title:v129 image:0 color:0 font:0 fontColor:0];
                  uint64_t v130 = };
                }
                else
                {
                  v128 = +[NSBundle mainBundle];
                  v129 = [v128 localizedStringForKey:@"SCREENING_MESSAGE" value:&stru_1002D6110 table:@"BottomBar"];
                  uint64_t v130 = [(PHBottomBar *)self makeButtonWithType:28 title:v129 image:0 color:0 font:0 fontColor:0];
                }
                v209 = (void *)v130;
                [(PHBottomBar *)self setMainLeftButton:v130];
              }
              if (TUCallScreeningRTTEnabled())
              {
                if ([(PHBottomBar *)self shouldShowAnswerRTTButton]) {
                  uint64_t v210 = 2;
                }
                else {
                  uint64_t v210 = 1;
                }
              }
              else
              {
                uint64_t v210 = 1;
              }
              v211 = +[NSBundle mainBundle];
              v212 = [v211 localizedStringForKey:@"ACCEPT" value:&stru_1002D6110 table:@"BottomBar"];
              v213 = [(PHBottomBar *)self makeButtonWithType:v210 title:v212 image:0 color:0 font:0 fontColor:0];
              [(PHBottomBar *)self setMainRightButton:v213];
            }
            break;
        }
        goto LABEL_57;
      }
      if (v14)
      {
        v38 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
        [(PHBottomBar *)self setSupplementalTopLeftButton:v38];

        uint64_t v39 = [(PHBottomBar *)self makeButtonWithType:25 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
      }
      else
      {
        if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening])
        {
          v55 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
          [(PHBottomBar *)self setSupplementalTopLeftButton:v55];

          [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
        }
        else
        {
          v103 = [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0];
          [(PHBottomBar *)self setSupplementalTopLeftButton:v103];

          [(PHBottomBar *)self makeButtonWithType:9 title:0 image:0 color:0 font:0 fontColor:0];
        uint64_t v39 = };
      }
      v104 = (void *)v39;
      [(PHBottomBar *)self setSupplementalTopRightButton:v39];

      v105 = [(PHBottomBar *)self makeSlidingButtonWithType:a3 == 5];
      [(PHBottomBar *)self setSlidingButton:v105];

      if (![(PHBottomBar *)self shouldShowAnswerRTTButton])
      {
LABEL_57:
        v57 = [(PHBottomBar *)self mainRightButton];
        [(PHBottomBar *)self addSubview:v57];

        v58 = [(PHBottomBar *)self mainLeftButton];
        [(PHBottomBar *)self addSubview:v58];

        v59 = [(PHBottomBar *)self supplementalTopLeftButton];
        [(PHBottomBar *)self addSubview:v59];

        v60 = [(PHBottomBar *)self supplementalTopRightButton];
        [(PHBottomBar *)self addSubview:v60];

        v61 = [(PHBottomBar *)self supplementalBottomLeftButton];
        [(PHBottomBar *)self addSubview:v61];

        v62 = [(PHBottomBar *)self supplementalBottomRightButton];
        [(PHBottomBar *)self addSubview:v62];

        v63 = [(PHBottomBar *)self slidingButton];
        [(PHBottomBar *)self addSubview:v63];

        v64 = [(PHBottomBar *)self sideButtonLeft];
        [(PHBottomBar *)self addSubview:v64];

        v65 = [(PHBottomBar *)self sideButtonRight];
        [(PHBottomBar *)self addSubview:v65];

        if ([(PHBottomBar *)self declineAndMessageIsAvailable]) {
          uint64_t v66 = [v13 isBranded] ^ 1;
        }
        else {
          uint64_t v66 = 0;
        }
        v67 = [(PHBottomBar *)self controlForActionType:12];
        [v67 setEnabled:v66];

        v68 = [(PHBottomBar *)self controlForActionType:9];
        [v68 setEnabled:v66];

        LODWORD(v68) = [(PHBottomBar *)self declineAndMessageIsAvailable];
        v69 = [(PHBottomBar *)self controlForActionType:12];
        [v69 setHidden:v68 ^ 1];

        LODWORD(v68) = [(PHBottomBar *)self declineAndMessageIsAvailable];
        v70 = [(PHBottomBar *)self controlForActionType:9];
        [v70 setHidden:v68 ^ 1];

        LODWORD(v68) = [(PHBottomBar *)self declineAndRemindIsAvailable];
        v71 = [(PHBottomBar *)self controlForActionType:13];
        [v71 setHidden:v68 ^ 1];

        v72 = [(PHBottomBar *)self buttonLayoutConstraints];

        if (v72)
        {
          v73 = [(PHBottomBar *)self buttonLayoutConstraints];
          [(PHBottomBar *)self removeConstraints:v73];
        }
        v74 = [(PHBottomBar *)self constraintsForState:a3];
        [(PHBottomBar *)self setButtonLayoutConstraints:v74];

        v75 = [(PHBottomBar *)self buttonLayoutConstraints];
        [(PHBottomBar *)self addConstraints:v75];

        char v16 = 0;
LABEL_63:
        self->_currentState = a3;
        [(PHBottomBar *)self setNeedsLayout];
        if (v8) {
          char v76 = v16;
        }
        else {
          char v76 = 1;
        }
        if ((v76 & 1) == 0) {
          v8[2](v8, 1);
        }
        v77 = [(PHBottomBar *)self statusChangedHandler];

        if (v77)
        {
          v78 = [(PHBottomBar *)self statusChangedHandler];
          v78[2]();
        }
        if (!v5) {
          [(PHBottomBar *)self layoutIfNeeded];
        }
        v79 = [(PHBottomBar *)self captureView];
        if (!v79) {
          goto LABEL_84;
        }
        if ([(PHBottomBar *)self callScreeningAvailable])
        {
        }
        else
        {
          unsigned __int8 v80 = [(PHBottomBar *)self shouldUseLayoutAsCallScreening];

          if ((v80 & 1) == 0)
          {
LABEL_84:

            goto LABEL_85;
          }
        }
        v81 = [(PHBottomBar *)self slidingButton];

        if (v81)
        {
          v82 = [(PHBottomBar *)self slidingButton];
          v83 = [v82 acceptButton];
          v84 = [v83 trackSolidViewBackDropVisualEffectView];
          [v84 _setGroupName:@"PHBottomBarButtonCaptureGroup"];

          v85 = [(PHBottomBar *)self captureView];
          v86 = [(PHBottomBar *)self slidingButton];
          v87 = [v86 acceptButton];
          v88 = [v87 trackSolidViewBackDropVisualEffectView];
          [v88 _setCaptureView:v85];
        }
        v89 = [(PHBottomBar *)self supplementalTopLeftButton];
        if (v89)
        {
          v90 = [(PHBottomBar *)self supplementalTopLeftButton];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v92 = [(PHBottomBar *)self supplementalTopLeftButton];
            v93 = [v92 effectView];
            [v93 _setGroupName:@"PHBottomBarButtonCaptureGroup"];

            v94 = [(PHBottomBar *)self captureView];
            v95 = [v92 effectView];
            [v95 _setCaptureView:v94];
          }
        }
        v96 = [(PHBottomBar *)self supplementalTopRightButton];
        if (v96)
        {
          v97 = [(PHBottomBar *)self supplementalTopRightButton];
          objc_opt_class();
          char v98 = objc_opt_isKindOfClass();

          if (v98)
          {
            v99 = [(PHBottomBar *)self supplementalTopRightButton];
            v100 = [v99 effectView];
            [v100 _setGroupName:@"PHBottomBarButtonCaptureGroup"];

            v101 = [(PHBottomBar *)self captureView];
            v102 = [v99 effectView];
            [v102 _setCaptureView:v101];
          }
        }
        goto LABEL_84;
      }
      v106 = +[UIImage imageNamed:@"Call Accept RTT"];
      long long v31 = [v106 imageWithRenderingMode:2];

      if (v31)
      {
        v107 = [(PHBottomBar *)self slidingButton];
        v108 = [v107 acceptButton];
        [v108 setKnobImage:v31];
      }
LABEL_56:

      goto LABEL_57;
    }
    long long v28 = [(PHBottomBar *)self makeButtonWithType:7 title:0 image:0 color:0 font:0 fontColor:0];
    [(PHBottomBar *)self setMainLeftButton:v28];

    if ([(PHBottomBar *)self shouldShowAnswerRTTButton])
    {
      long long v29 = +[UIImage imageNamed:@"Call Accept RTT"];
      long long v30 = +[UIColor whiteColor];
      long long v31 = [v29 _flatImageWithColor:v30];
    }
    else
    {
      long long v31 = 0;
    }
    v40 = [(PHBottomBar *)self makeButtonWithType:1 title:0 image:v31 color:0 font:0 fontColor:0];
    [(PHBottomBar *)self setMainRightButton:v40];

    v41 = [(PHBottomBar *)self callDisplayStyleManager];
    BOOL v42 = [v41 callDisplayStyle] == (id)3;

    if (v42)
    {
      v43 = [v13 provider];
      unsigned int v44 = [v43 isSystemProvider];

      if (!v44) {
        goto LABEL_56;
      }
      if (v14)
      {
        v45 = [(PHBottomBar *)self makeButtonWithType:25 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setSideButtonLeft:v45];
      }
      else
      {
        if (![(PHBottomBar *)self shouldShowActionTypeSendToVoicemail]) {
          goto LABEL_56;
        }
        v45 = [(PHBottomBar *)self makeButtonWithType:24 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setSideButtonLeft:v45];
      }
    }
    else if (v14)
    {
      v46 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
      [(PHBottomBar *)self setSupplementalTopLeftButton:v46];

      v45 = [(PHBottomBar *)self makeButtonWithType:25 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
      [(PHBottomBar *)self setSupplementalTopRightButton:v45];
    }
    else
    {
      if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening])
      {
        v54 = [(PHBottomBar *)self makeButtonWithType:12 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
        [(PHBottomBar *)self setSupplementalTopLeftButton:v54];

        [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0 diameter:44.0];
      }
      else
      {
        v56 = [(PHBottomBar *)self makeButtonWithType:13 title:0 image:0 color:0 font:0 fontColor:0];
        [(PHBottomBar *)self setSupplementalTopLeftButton:v56];

        [(PHBottomBar *)self makeButtonWithType:9 title:0 image:0 color:0 font:0 fontColor:0];
      v45 = };
      [(PHBottomBar *)self setSupplementalTopRightButton:v45];
    }

    goto LABEL_56;
  }
  uint64_t v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v222 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Bottom bar is currently animating, we will pend this bottom bar state change to state %ld until that's over", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v10 = [(PHBottomBar *)self pendingStateBlocks];
  v214 = _NSConcreteStackBlock;
  uint64_t v215 = 3221225472;
  v216 = sub_100101820;
  v217 = &unk_1002D0A10;
  objc_copyWeak(v219, (id *)buf);
  v219[1] = (id)a3;
  BOOL v220 = v5;
  v218 = v8;
  id v11 = objc_retainBlock(&v214);
  [v10 addObject:v11, v214, v215, v216, v217];

  objc_destroyWeak(v219);
  objc_destroyWeak((id *)buf);
LABEL_85:
}

- (id)_supplementalBottomLeftButtonLayoutConstraints
{
  int64_t v3 = +[NSMutableArray array];
  BOOL v4 = [(PHBottomBar *)self centerXAnchor];
  BOOL v5 = [(PHBottomBar *)self supplementalBottomLeftButton];
  uint64_t v6 = [v5 centerXAnchor];
  +[PHInCallNumberPadButton defaultSize];
  double v8 = v7;
  BOOL v9 = sub_1000FD8C4();
  double v10 = 0.0;
  if (v9) {
    double v10 = 12.0;
  }
  id v11 = [v4 constraintEqualToAnchor:v6 constant:v8 + v10];

  [v11 setIdentifier:@"supplementalBottomLeftButtonCenterXAnchorLayoutConstraint"];
  [v3 addObject:v11];
  long long v12 = [(PHBottomBar *)self supplementalBottomLeftButton];
  long long v13 = [v12 centerYAnchor];
  unsigned int v14 = [(PHBottomBar *)self mainLeftButton];
  long long v15 = [v14 centerYAnchor];
  char v16 = [v13 constraintEqualToAnchor:v15];

  [v16 setIdentifier:@"supplementalBottomLeftButtonCenterYAnchorLayoutConstraint"];
  [v3 addObject:v16];

  return v3;
}

- (id)_supplementalBottomRightButtonLayoutConstraints
{
  int64_t v3 = +[NSMutableArray array];
  BOOL v4 = [(PHBottomBar *)self supplementalBottomRightButton];
  BOOL v5 = [v4 centerXAnchor];
  uint64_t v6 = [(PHBottomBar *)self centerXAnchor];
  +[PHInCallNumberPadButton defaultSize];
  double v8 = v7;
  BOOL v9 = sub_1000FD8C4();
  double v10 = 0.0;
  if (v9) {
    double v10 = 12.0;
  }
  id v11 = [v5 constraintEqualToAnchor:v6 constant:v8 + v10];

  [v11 setIdentifier:@"supplementalBottomRightButtonCenterXAnchorLayoutConstraint"];
  [v3 addObject:v11];
  long long v12 = [(PHBottomBar *)self supplementalBottomRightButton];
  long long v13 = [v12 centerYAnchor];
  unsigned int v14 = [(PHBottomBar *)self mainLeftButton];
  long long v15 = [v14 centerYAnchor];
  char v16 = [v13 constraintEqualToAnchor:v15];

  [v16 setIdentifier:@"supplementalBottomRightButtonCenterYAnchorLayoutConstraint"];
  [v3 addObject:v16];

  return v3;
}

- (id)constraintsForState:(int64_t)a3
{
  uint64_t v4 = +[NSMutableArray array];
  unsigned __int8 v256 = [(PHBottomBar *)self callScreeningAvailable];
  uint64_t v5 = [(PHBottomBar *)self viewLabels];
  v266[0] = @"SideMarginForDoubleButton";
  [(PHBottomBar *)self sideMarginForDoubleButton];
  v252 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[0] = v252;
  v266[1] = @"SideMarginForFaceTimeButtons";
  [(PHBottomBar *)self sideMarginForFaceTimeButtons];
  v251 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[1] = v251;
  v266[2] = @"SideMarginForFaceTimeInCallButtons";
  [(PHBottomBar *)self sideMarginForFaceTimeInCallButtons];
  v250 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[2] = v250;
  v266[3] = @"TopMarginForFaceTimeButtons";
  unsigned int v6 = [(PHBottomBar *)self usesLowerButtons];
  v249 = [(PHBottomBar *)self callDisplayStyleManager];
  id v7 = [v249 callDisplayStyle];
  unsigned int v248 = v6;
  if (v6)
  {
    if (v7 == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v9 = v8;
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
      || (unint64_t v10 = +[PHUIConfiguration inCallBottomBarSpacing],
          double v11 = 24.0,
          v10 == 3))
    {
      double v11 = 30.0;
    }
    double v12 = v9 + v11;
    *(float *)&double v12 = v12;
    v247 = +[NSNumber numberWithFloat:v12];
    [v247 floatValue];
    double v14 = v13;
    [(PHBottomBar *)self yOffsetForLoweredButtons];
    double v16 = v15 + v14;
    *(float *)&double v16 = v16;
    uint64_t v17 = +[NSNumber numberWithFloat:v16];
  }
  else
  {
    if (v7 == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v19 = v18;
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
      || (unint64_t v20 = +[PHUIConfiguration inCallBottomBarSpacing],
          double v21 = 24.0,
          v20 == 3))
    {
      double v21 = 30.0;
    }
    double v22 = v19 + v21;
    *(float *)&double v22 = v22;
    uint64_t v17 = +[NSNumber numberWithFloat:v22];
    v247 = (void *)v17;
  }
  v245 = (void *)v17;
  v267[3] = v17;
  v266[4] = @"ButtonSpacing";
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
    || (unint64_t v24 = +[PHUIConfiguration inCallBottomBarSpacing],
        LODWORD(v23) = 24.0,
        v24 == 3))
  {
    LODWORD(v23) = 30.0;
  }
  v246 = +[NSNumber numberWithFloat:v23];
  v267[4] = v246;
  v266[5] = @"AmbientButtonSpacing";
  +[PHUIConfiguration ambientInCallControlSpacing];
  double v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[5] = v25;
  v266[6] = @"ButtonSliderSpacing";
  v260 = (void *)v4;
  v261 = (void *)v5;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
    || (id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)3)
  {
    LODWORD(v26) = 25.0;
  }
  else
  {
    LODWORD(v26) = 1102315520;
  }
  unint64_t v27 = +[NSNumber numberWithFloat:v26];
  v267[6] = v27;
  v266[7] = @"BottomSupplementalButtonSpacing";
  +[PHBottomBar defaultBottomSupplementalButtonSpacing];
  long long v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[7] = v28;
  v267[8] = &off_1002DF9A8;
  v266[8] = @"TopSupplementalButtonSpacing";
  v266[9] = @"HeightOfAButtonPlusButtonSpacing";
  long long v29 = [(PHBottomBar *)self callDisplayStyleManager];
  if ([v29 callDisplayStyle] == (id)3) {
    +[PHUIConfiguration ambientInCallControlSize];
  }
  else {
    +[PHBottomBarButtonConfiguration defaultHeight];
  }
  double v31 = v30;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
    || (unint64_t v32 = +[PHUIConfiguration inCallBottomBarSpacing],
        double v33 = 24.0,
        v32 == 3))
  {
    double v33 = 30.0;
  }
  double v34 = v31 + v33;
  *(float *)&double v34 = v34;
  v35 = +[NSNumber numberWithFloat:v34];
  v267[9] = v35;
  v266[10] = @"ButtonSpacingCallScreening";
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
    || (unint64_t v37 = +[PHUIConfiguration inCallBottomBarSpacing],
        LODWORD(v36) = 24.0,
        v37 == 3))
  {
    LODWORD(v36) = 30.0;
  }
  v38 = +[NSNumber numberWithFloat:v36];
  v267[10] = v38;
  v266[11] = @"HeightOfCallScreeningButtonPlusButtonSpacing";
  v262 = self;
  [(PHBottomBar *)self heightOfCallScreeningButtonPlusButtonSpacing];
  uint64_t v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v267[11] = v39;
  v266[12] = @"ButtonSliderSpacingCallScreeningSlider";
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6
    || (id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)3)
  {
    LODWORD(v40) = 25.0;
  }
  else
  {
    LODWORD(v40) = 1102315520;
  }
  v41 = +[NSNumber numberWithFloat:v40];
  v267[12] = v41;
  BOOL v42 = +[NSDictionary dictionaryWithObjects:v267 forKeys:v266 count:13];

  if (v248) {
  v43 = v261;
  }
  unsigned int v44 = v262;
  supplementalTopLeftButton = v262->_supplementalTopLeftButton;
  v46 = v260;
  if (!supplementalTopLeftButton) {
    supplementalTopLeftButton = v262->_supplementalTopRightButton;
  }
  v47 = supplementalTopLeftButton;
  BOOL v48 = v42;
  if ((v256 & 1) != 0 || [(PHBottomBar *)v262 shouldUseLayoutAsCallScreening])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v49 = [v42 mutableCopy];
      v50 = +[UIScreen mainScreen];
      [v50 bounds];
      double v52 = v51;
      double v54 = v53;

      if (v52 < v54) {
        double v52 = v54;
      }
      +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio];
      double v56 = v55 * v52;
      v57 = +[NSNumber numberWithDouble:v56];
      [v49 setObject:v57 forKeyedSubscript:@"ButtonSpacingCallScreening"];

      v58 = +[NSNumber numberWithDouble:v56 + -6.0];
      [v49 setObject:v58 forKeyedSubscript:@"ButtonSliderSpacingCallScreeningSlider"];

      BOOL v48 = v49;
    }
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 9:
      goto LABEL_47;
    case 4:
    case 5:
      goto LABEL_74;
    case 6:
      v144 = [(PHBottomBar *)v262 callDisplayStyleManager];
      id v145 = [v144 callDisplayStyle];

      if (v145 != (id)3)
      {
LABEL_74:
        v146 = [(PHBottomBar *)v262 slidingButton];
        v147 = +[NSLayoutConstraint constraintWithItem:v146 attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
        [v260 addObject:v147];

        if ((v256 & 1) != 0 || [(PHBottomBar *)v262 shouldUseLayoutAsCallScreening])
        {
          v148 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[_supplementalTopLeftButton]-(ButtonSliderSpacingCallScreeningSlider)-[_slidingButton]", 0, v48, v261);
          [v260 addObjectsFromArray:v148];

          v149 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[_supplementalTopRightButton]-(ButtonSliderSpacingCallScreeningSlider)-[_slidingButton]", 0, v48, v261);
          [v260 addObjectsFromArray:v149];

          v150 = [(PHBottomBar *)v262 slidingButton];
          [v150 knobWidth];
          double v152 = v151;

          double v153 = (v152 + -44.0) * 0.5 + 6.0;
        }
        else
        {
          v201 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[_supplementalTopLeftButton]-(ButtonSliderSpacing)-[_slidingButton]", 0, v48, v261);
          [v260 addObjectsFromArray:v201];

          v202 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[_supplementalTopRightButton]-(ButtonSliderSpacing)-[_slidingButton]", 0, v48, v261);
          [v260 addObjectsFromArray:v202];

          double v153 = 0.0;
        }
        v203 = [(PHBottomBar *)v262 supplementalTopLeftButton];
        v204 = [(PHBottomBar *)v262 slidingButton];
        v205 = +[NSLayoutConstraint constraintWithItem:v203 attribute:5 relatedBy:0 toItem:v204 attribute:5 multiplier:1.0 constant:v153];
        [v260 addObject:v205];

        unsigned int v126 = [(PHBottomBar *)v262 supplementalTopRightButton];
        v128 = [(PHBottomBar *)v262 slidingButton];
        double v130 = -v153;
        double v129 = 1.0;
        v131 = v126;
        uint64_t v132 = 6;
        v133 = v128;
        uint64_t v134 = 6;
        goto LABEL_96;
      }
LABEL_47:
      v59 = [(PHBottomBar *)v262 callDisplayStyleManager];
      id v60 = [v59 callDisplayStyle];

      if (v60 == (id)3)
      {
        v257 = v47;
        v61 = [(PHBottomBar *)v262 sideButtonLeft];

        v253 = v48;
        if (v61)
        {
          v62 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|[_sideButtonLeft]-(AmbientButtonSpacing)-[_mainLeftButton]-(AmbientButtonSpacing)-[_mainRightButton]|", 0, v48, v261);
          [v260 addObjectsFromArray:v62];

          v63 = [(PHBottomBar *)v262 mainLeftButton];
          v64 = [v63 centerXAnchor];
          v65 = [(PHBottomBar *)v262 centerXAnchor];
          uint64_t v66 = [v64 constraintEqualToAnchor:v65];
          v264[0] = v66;
          v67 = [(PHBottomBar *)v262 sideButtonLeft];
          v68 = [v67 topAnchor];
          v69 = [(PHBottomBar *)v262 topAnchor];
          [v68 constraintEqualToAnchor:v69];
          v71 = v70 = v260;
          v264[1] = v71;
          v72 = +[NSArray arrayWithObjects:v264 count:2];
          [v260 addObjectsFromArray:v72];

          unsigned int v44 = v262;
        }
        else
        {
          v63 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(>=0)-[_mainLeftButton]-(AmbientButtonSpacing)-[_mainRightButton]-|", 0, v48, v261);
          [v260 addObjectsFromArray:v63];
          v70 = v260;
        }

        uint64_t v135 = [(PHBottomBar *)v44 mainLeftButton];
        v136 = [v135 topAnchor];
        v137 = [(PHBottomBar *)v44 topAnchor];
        v138 = [v136 constraintEqualToAnchor:v137];
        v263[0] = v138;
        uint64_t v139 = [(PHBottomBar *)v44 mainRightButton];
        v140 = [v139 topAnchor];
        v141 = [(PHBottomBar *)v44 topAnchor];
        v142 = [v140 constraintEqualToAnchor:v141];
        v263[1] = v142;
        v143 = +[NSArray arrayWithObjects:v263 count:2];
        [v70 addObjectsFromArray:v143];

        v116 = 0;
        v46 = v70;
        v43 = v261;
        BOOL v48 = v253;
        v47 = v257;
        goto LABEL_99;
      }
      v83 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|", 0, v48, v261);
      [v260 addObjectsFromArray:v83];

      CFStringRef v84 = @"V:|[_supplementalTopRightButton]-(ButtonSpacingCallScreening)-[_mainRightButton]";
      CFStringRef v85 = @"V:|[_supplementalTopLeftButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]";
      if (v256)
      {
        v86 = v262;
      }
      else
      {
        v86 = v262;
        if (![(PHBottomBar *)v262 shouldUseLayoutAsCallScreening])
        {
          CFStringRef v85 = @"V:|[_supplementalTopLeftButton]-(ButtonSpacing)-[_mainLeftButton]";
          CFStringRef v84 = @"V:|[_supplementalTopRightButton]-(ButtonSpacing)-[_mainRightButton]";
        }
      }
      v121 = +[NSLayoutConstraint constraintsWithVisualFormat:v85 options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v121];

      v122 = +[NSLayoutConstraint constraintsWithVisualFormat:v84 options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v122];

      v123 = [(PHBottomBar *)v86 supplementalTopLeftButton];
      BOOL v124 = [(PHBottomBar *)v86 mainLeftButton];
      v125 = +[NSLayoutConstraint constraintWithItem:v123 attribute:9 relatedBy:0 toItem:v124 attribute:9 multiplier:1.0 constant:0.0];
      [v260 addObject:v125];

      unsigned int v126 = [(PHBottomBar *)v86 supplementalTopRightButton];
      uint64_t v127 = [(PHBottomBar *)v86 mainRightButton];
      goto LABEL_70;
    case 11:
    case 18:
    case 21:
      v258 = v47;
      v73 = [(PHBottomBar *)v262 mainLeftButton];
      v74 = [v73 centerXAnchor];
      v75 = [(PHBottomBar *)v262 centerXAnchor];
      char v76 = [v74 constraintEqualToAnchor:v75];

      [v76 setIdentifier:@"mainLeftButtonCenterXAnchorLayoutConstraint"];
      [v260 addObject:v76];
      v77 = [(PHBottomBar *)v262 mainLeftButton];
      v78 = [v77 topAnchor];
      v79 = [(PHBottomBar *)v262 topAnchor];
      unsigned __int8 v80 = [(PHBottomBar *)v262 callDisplayStyleManager];
      if ([v80 callDisplayStyle] == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v82 = v81;
      unint64_t v110 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v111 = 30.0;
      if (v110 != 6)
      {
        unint64_t v112 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v111 = 24.0;
        if (v112 == 3) {
          double v111 = 30.0;
        }
      }
      double v113 = v82 + v111;
      *(float *)&double v113 = v113;
      uint64_t v114 = +[NSNumber numberWithFloat:v113];
      [v114 floatValue];
      v116 = [v78 constraintEqualToAnchor:v79 constant:v115];

      [v116 setIdentifier:@"mainLeftButtonTopAnchorLayoutConstraint"];
      [v260 addObject:v116];
      unsigned int v117 = [(PHBottomBar *)v262 supplementalBottomLeftButton];

      if (v117)
      {
        v118 = [(PHBottomBar *)v262 _supplementalBottomLeftButtonLayoutConstraints];
        [v260 addObjectsFromArray:v118];
      }
      v119 = [(PHBottomBar *)v262 supplementalBottomRightButton];

      v47 = v258;
      if (v119)
      {
        unsigned int v120 = [(PHBottomBar *)v262 _supplementalBottomRightButtonLayoutConstraints];
        [v260 addObjectsFromArray:v120];
      }
      goto LABEL_99;
    case 12:
    case 16:
      v87 = +[NSString stringWithFormat:@"|[_slidingButton]|"];
      v88 = +[NSLayoutConstraint constraintsWithVisualFormat:v87 options:0 metrics:0 views:v261];
      [v260 addObjectsFromArray:v88];

      CFStringRef v89 = @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_slidingButton]";
      goto LABEL_93;
    case 13:
    case 22:
      v90 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]", 0, v48, v261);
      [v260 addObjectsFromArray:v90];

      CFStringRef v91 = @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainRightButton]";
      goto LABEL_92;
    case 17:
    case 26:
      v92 = +[NSLayoutConstraint constraintWithItem:v262->_mainLeftButton attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
      [v260 addObject:v92];

      v93 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"[_sideButtonLeft]-(SideMarginForFaceTimeButtons)-[_mainLeftButton]-(SideMarginForFaceTimeButtons)-[_sideButtonRight]", 24, v48, v261);
      [v260 addObjectsFromArray:v93];

      v94 = +[NSLayoutConstraint constraintWithItem:v262->_sideButtonLeft attribute:7 relatedBy:0 toItem:v262->_sideButtonRight attribute:7 multiplier:1.0 constant:0.0];
      [v260 addObject:v94];

      CFStringRef v89 = @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]";
      goto LABEL_93;
    case 19:
      v163 = +[CNKFeatures sharedInstance];
      unsigned int v164 = [v163 isDialPadEnabled];

      if (v164)
      {
        unint64_t v165 = +[UIScreen mainScreen];
        [v165 bounds];
        double v167 = v166;
        double v169 = v168;

        if (v167 >= v169) {
          double v170 = v169;
        }
        else {
          double v170 = v167;
        }
        if (v167 >= v169) {
          double v169 = v167;
        }
        +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio];
        double v172 = v171;
        v173 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[_mainRightButton]" options:0 metrics:v48 views:v261];
        [v260 addObjectsFromArray:v173];

        v174 = [(PHBottomBar *)v262 supplementalBottomLeftButton];
        v175 = +[NSLayoutConstraint constraintWithItem:v174 attribute:4 relatedBy:0 toItem:v262 attribute:4 multiplier:1.0 constant:-(v172 * v169)];
        [v260 addObject:v175];

        v176 = [(PHBottomBar *)v262 mainRightButton];
        v177 = +[NSLayoutConstraint constraintWithItem:v176 attribute:6 relatedBy:0 toItem:v262 attribute:6 multiplier:1.0 constant:v170 * -0.102];
        [v260 addObject:v177];

        v178 = [(PHBottomBar *)v262 mainRightButton];
        v179 = [(PHBottomBar *)v262 supplementalBottomLeftButton];
        BOOL v180 = +[NSLayoutConstraint constraintWithItem:v178 attribute:10 relatedBy:0 toItem:v179 attribute:10 multiplier:1.0 constant:0.0];
        [v260 addObject:v180];

        v181 = +[NSLayoutConstraint constraintWithItem:v262->_supplementalBottomLeftButton attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
        [v260 addObject:v181];

        supplementalBottomLeftButton = v262->_supplementalBottomLeftButton;
        v183 = [(PHBottomBar *)v262 mainRightButton];
        v184 = +[NSLayoutConstraint constraintWithItem:supplementalBottomLeftButton attribute:6 relatedBy:-1 toItem:v183 attribute:5 multiplier:1.0 constant:-8.0];
        [v260 addObject:v184];

        LODWORD(v185) = 1132068864;
        [(UIButton *)v262->_mainRightButton setContentCompressionResistancePriority:0 forAxis:v185];
        goto LABEL_98;
      }
      v208 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[_mainLeftButton]" options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v208];

      v209 = +[NSLayoutConstraint constraintWithItem:v262->_mainLeftButton attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
      [v260 addObject:v209];

      uint64_t v210 = [(PHBottomBar *)v262 supplementalBottomRightButton];
      v211 = +[NSLayoutConstraint constraintWithItem:v210 attribute:10 relatedBy:0 toItem:v262->_mainLeftButton attribute:10 multiplier:1.0 constant:0.0];
      [v260 addObject:v211];

      +[TPNumberPadButton defaultSize];
      double v213 = v212;
      BOOL v214 = sub_1000FD8C4();
      double v215 = 12.0;
      if (!v214) {
        double v215 = 0.0;
      }
      double v216 = v213 + v215;
      unsigned int v126 = [(PHBottomBar *)v262 supplementalBottomRightButton];
      v217 = +[NSLayoutConstraint constraintWithItem:v126 attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:v216];
      [v260 addObject:v217];
      goto LABEL_111;
    case 20:
      v186 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[_mainLeftButton]" options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v186];

      v187 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]-(BottomSupplementalButtonSpacing)-[_supplementalBottomLeftButton]", 0, v48, v261);
      [v260 addObjectsFromArray:v187];

      v188 = +[NSLayoutConstraint constraintWithItem:v262->_mainLeftButton attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
      [v260 addObject:v188];

      +[TPNumberPadButton defaultSize];
      double v190 = v189;
      BOOL v191 = sub_1000FD8C4();
      double v192 = 12.0;
      if (!v191) {
        double v192 = 0.0;
      }
      double v193 = v190 + v192;
      v194 = [(PHBottomBar *)v262 supplementalBottomLeftButton];
      v195 = +[NSLayoutConstraint constraintWithItem:v194 attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:-v193];
      [v260 addObject:v195];

      CFStringRef v89 = @"|-[_supplementalBottomLeftButton]";
      goto LABEL_93;
    case 23:
    case 25:
      v95 = [(PHBottomBar *)v262 callDisplayStyleManager];
      id v96 = [v95 callDisplayStyle];

      if (v96 == (id)3)
      {
        +[PHUIConfiguration ambientInCallControlSize];
        double v98 = v97;
        +[PHUIConfiguration ambientInCallControlSpacing];
        double v100 = v98 + v99;
        v255 = [(PHBottomBar *)v262 mainRightButton];
        v101 = [v255 topAnchor];
        v102 = [(PHBottomBar *)v262 topAnchor];
        v103 = [v101 constraintEqualToAnchor:v102];
        v265[0] = v103;
        [(PHBottomBar *)v262 mainRightButton];
        v104 = v259 = v47;
        v105 = [v104 centerXAnchor];
        v106 = [(PHBottomBar *)v262 centerXAnchor];
        v107 = [v105 constraintEqualToAnchor:v106 constant:v100];
        v265[1] = v107;
        +[NSArray arrayWithObjects:v265 count:2];
        uint64_t v109 = v108 = v48;
        [v260 addObjectsFromArray:v109];

        BOOL v48 = v108;
        v46 = v260;

        v47 = v259;
        goto LABEL_98;
      }
      v198 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainLeftButton]", 0, v48, v261);
      [v260 addObjectsFromArray:v198];

      CFStringRef v91 = @"V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainRightButton]";
LABEL_92:
      v199 = +[NSLayoutConstraint constraintsWithVisualFormat:v91 options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v199];

      CFStringRef v89 = @"|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|";
      goto LABEL_93;
    case 24:
      unint64_t v196 = +[NSString stringWithFormat:@"|[_slidingButton]|"];
      double v197 = +[NSLayoutConstraint constraintsWithVisualFormat:v196 options:0 metrics:0 views:v261];
      [v260 addObjectsFromArray:v197];

      CFStringRef v89 = @"V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_slidingButton]";
      goto LABEL_93;
    default:
      if ((unint64_t)(a3 - 7) <= 1)
      {
        v154 = [(PHBottomBar *)v262 callDisplayStyleManager];
        id v155 = [v154 callDisplayStyle];

        v156 = [(PHBottomBar *)v262 mainLeftButton];
        v157 = +[NSLayoutConstraint constraintWithItem:v156 attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
        [v260 addObject:v157];

        if (v155 == (id)3)
        {
          v158 = [(PHBottomBar *)v262 mainLeftButton];
          unint64_t v159 = [v158 topAnchor];
          double v160 = [(PHBottomBar *)v262 topAnchor];
          v161 = [v159 constraintEqualToAnchor:v160];
          [v260 addObject:v161];

          v162 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-[_sideButtonLeft]-(>=0)-[_mainLeftButton]-(>=0)-[_sideButtonRight]-|", 24, v48, v261);
          [v260 addObjectsFromArray:v162];

          unsigned int v126 = [(PHBottomBar *)v262 sideButtonLeft];
          v128 = [(PHBottomBar *)v262 sideButtonRight];
          double v129 = 1.0;
          double v130 = 0.0;
          v131 = v126;
          uint64_t v132 = 7;
          v133 = v128;
          uint64_t v134 = 7;
        }
        else
        {
          if ([(PHBottomBar *)v262 shouldUseLayoutAsCallScreening]) {
            CFStringRef v218 = @"V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainLeftButton]";
          }
          else {
            CFStringRef v218 = @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]";
          }
          v219 = +[NSLayoutConstraint constraintsWithVisualFormat:v218 options:0 metrics:v48 views:v261];
          [v260 addObjectsFromArray:v219];

          BOOL v220 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"[_sideButtonLeft]-(SideMarginForFaceTimeButtons)-[_mainLeftButton]-(SideMarginForFaceTimeButtons)-[_sideButtonRight]", 24, v48, v261);
          [v260 addObjectsFromArray:v220];

          v221 = [(PHBottomBar *)v262 sideButtonLeft];
          int64_t v222 = [(PHBottomBar *)v262 sideButtonRight];
          __int16 v223 = +[NSLayoutConstraint constraintWithItem:v221 attribute:7 relatedBy:0 toItem:v222 attribute:7 multiplier:1.0 constant:0.0];
          [v260 addObject:v223];

          unsigned int v224 = [(PHBottomBar *)v262 shouldUseLayoutAsCallScreening];
          if (v224) {
            CFStringRef v225 = @"V:|[_supplementalTopLeftButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]";
          }
          else {
            CFStringRef v225 = @"V:|[_supplementalTopLeftButton]-(ButtonSpacing)-[_mainLeftButton]";
          }
          if (v224) {
            CFStringRef v226 = @"V:|[_supplementalTopRightButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]";
          }
          else {
            CFStringRef v226 = @"V:|[_supplementalTopRightButton]-(ButtonSpacing)-[_mainLeftButton]";
          }
          v227 = +[NSLayoutConstraint constraintsWithVisualFormat:v225 options:0 metrics:v48 views:v261];
          [v260 addObjectsFromArray:v227];

          v228 = +[NSLayoutConstraint constraintsWithVisualFormat:v226 options:0 metrics:v48 views:v261];
          [v260 addObjectsFromArray:v228];

          v229 = [(PHBottomBar *)v262 supplementalTopLeftButton];
          v230 = [(PHBottomBar *)v262 sideButtonLeft];
          v231 = +[NSLayoutConstraint constraintWithItem:v229 attribute:9 relatedBy:0 toItem:v230 attribute:9 multiplier:1.0 constant:0.0];
          [v260 addObject:v231];

          unsigned int v126 = [(PHBottomBar *)v262 supplementalTopRightButton];
          uint64_t v127 = [(PHBottomBar *)v262 sideButtonRight];
LABEL_70:
          v128 = (void *)v127;
          double v129 = 1.0;
          double v130 = 0.0;
          v131 = v126;
          uint64_t v132 = 9;
          v133 = (void *)v127;
          uint64_t v134 = 9;
        }
LABEL_96:
        v206 = +[NSLayoutConstraint constraintWithItem:v131 attribute:v132 relatedBy:0 toItem:v133 attribute:v134 multiplier:v129 constant:v130];
        [v260 addObject:v206];

LABEL_97:
        goto LABEL_98;
      }
      switch(a3)
      {
        case 10:
          v232 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_slidingButton]", 0, v48, v261);
          [v260 addObjectsFromArray:v232];

          unsigned int v126 = +[NSString stringWithFormat:@"|[_slidingButton]|"];
          v217 = +[NSLayoutConstraint constraintsWithVisualFormat:v126 options:0 metrics:0 views:v261];
          [v260 addObjectsFromArray:v217];
LABEL_111:

          goto LABEL_97;
        case 14:
          if ([(PHBottomBar *)v262 shouldShowActionTypeCameraFlip])
          {
LABEL_124:
            v233 = +[NSLayoutConstraint constraintWithItem:v262->_mainLeftButton attribute:9 relatedBy:0 toItem:v262 attribute:9 multiplier:1.0 constant:0.0];
            [v260 addObject:v233];

            v234 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"[_sideButtonLeft]-(SideMarginForFaceTimeInCallButtons)-[_mainLeftButton]-(SideMarginForFaceTimeInCallButtons)-[_sideButtonRight]", 1024, v48, v261);
            [v260 addObjectsFromArray:v234];

            v235 = +[NSLayoutConstraint constraintWithItem:v262->_sideButtonLeft attribute:7 relatedBy:0 toItem:v262->_sideButtonRight attribute:7 multiplier:1.0 constant:0.0];
            [v260 addObject:v235];
            break;
          }
          v235 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|", 0, v48, v261);
          [v260 addObjectsFromArray:v235];
          break;
        case 15:
          if ([(PHBottomBar *)v262 shouldShowActionTypePhotoCapture]
            || [(PHBottomBar *)v262 shouldShowActionTypeEffects])
          {
            goto LABEL_124;
          }
          v236 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"[_mainLeftButton]-(SideMarginForFaceTimeInCallButtons)-[_sideButtonRight]", 0, v48, v261);
          [v260 addObjectsFromArray:v236];

          v237 = [(PHBottomBar *)v262 mainLeftButton];
          v238 = [v237 centerXAnchor];
          v239 = [(PHBottomBar *)v262 centerXAnchor];
          v240 = [v238 constraintEqualToAnchor:v239];
          [v260 addObject:v240];

          v235 = [(PHBottomBar *)v262 sideButtonRight];
          v241 = [v235 centerYAnchor];
          v242 = [(PHBottomBar *)v262 mainLeftButton];
          v243 = [v242 centerYAnchor];
          v244 = [v241 constraintEqualToAnchor:v243];
          [v260 addObject:v244];

          break;
        default:
          goto LABEL_98;
      }

      CFStringRef v89 = @"V:|-(TopMarginForFaceTimeButtons)-[_mainLeftButton]";
LABEL_93:
      v200 = +[NSLayoutConstraint constraintsWithVisualFormat:v89 options:0 metrics:v48 views:v261];
      [v260 addObjectsFromArray:v200];

LABEL_98:
      v116 = 0;
LABEL_99:

      return v46;
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIButton *)self->_mainLeftButton setOrientation:a3];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIButton *)self->_mainRightButton setOrientation:a3];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIButton *)self->_sideButtonLeft setOrientation:a3];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIButton *)self->_sideButtonRight setOrientation:a3];
    }
    [(PHBottomBar *)self setNeedsLayout];
    [(PHBottomBar *)self layoutIfNeeded];
  }
}

- (void)setUsesLowerButtons:(BOOL)a3
{
  if (self->_usesLowerButtons != a3)
  {
    self->_usesLowerButtons = a3;
    uint64_t v4 = [(PHBottomBar *)self buttonLayoutConstraints];

    if (v4)
    {
      uint64_t v5 = [(PHBottomBar *)self buttonLayoutConstraints];
      [(PHBottomBar *)self removeConstraints:v5];
    }
    unsigned int v6 = [(PHBottomBar *)self constraintsForState:[(PHBottomBar *)self currentState]];
    [(PHBottomBar *)self setButtonLayoutConstraints:v6];

    id v7 = [(PHBottomBar *)self buttonLayoutConstraints];
    [(PHBottomBar *)self addConstraints:v7];

    [(PHBottomBar *)self setNeedsLayout];
    [(PHBottomBar *)self layoutIfNeeded];
  }
}

- (BOOL)shouldShowActionTypeCameraFlip
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypeCameraFlip];

  return v6;
}

- (BOOL)shouldShowActionTypeAudioRoute
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypeAudioRoute];

  return v6;
}

- (BOOL)shouldShowActionTypeSendToVoicemail
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypeSendToVoicemail];

  return v6;
}

- (BOOL)shouldShowActionTypePunchOut
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypePunchOut];

  return v6;
}

- (BOOL)shouldShowActionTypePhotoCapture
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypePhotoCapture];

  return v6;
}

- (BOOL)shouldShowActionTypeEffects
{
  int64_t v3 = [(PHBottomBar *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(PHBottomBar *)self delegate];
  unsigned __int8 v6 = [v5 shouldShowActionTypeEffects];

  return v6;
}

- (BOOL)currentCallIsMuted
{
  double v2 = [(PHBottomBar *)self callCenter];
  int64_t v3 = [v2 audioOrVideoCallWithStatus:1];
  unsigned __int8 v4 = [v3 isUplinkMuted];

  return v4;
}

- (int64_t)currentBottomBarCallState
{
  if (+[PHSOSViewController isCallBufferDismissalAssertionActive])
  {
    return 2;
  }
  unsigned __int8 v4 = [(PHBottomBar *)self delegate];
  id v5 = [v4 bottomBarCallStateInBar:self];

  return (int64_t)v5;
}

- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  double v19 = [(PHBottomBar *)self callDisplayStyleManager];
  if ([v19 callDisplayStyle] == (id)3) {
    +[PHUIConfiguration ambientInCallControlSize];
  }
  else {
    +[PHBottomBarButtonConfiguration defaultHeight];
  }
  unint64_t v20 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", a3, v18, v17, v16, v15, v14);

  return v20;
}

- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8 diameter:(double)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  unint64_t v20 = [(PHBottomBar *)self customTitleStringForActionType:a3 givenDefaultTitle:a4];
  double v21 = [PHBottomBarButtonConfiguration alloc];
  int64_t v22 = [(PHBottomBar *)self currentBottomBarCallState];
  double v23 = [(PHBottomBar *)self captureView];
  unint64_t v24 = [(PHBottomBarButtonConfiguration *)v21 initWithAction:a3 diameter:v22 callState:v23 captureView:a9];

  if (a3 == 21)
  {
    double v25 = PHBottomBarMuteButton;
LABEL_3:
    double v26 = (PHBottomBarSupplementalButton *)[[v25 alloc] initWithConfiguration:v24];
    goto LABEL_4;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 9)
  {
    long long v28 = [(PHBottomBar *)self callDisplayStyleManager];
    id v29 = [v28 callDisplayStyle];

    if (v29 != (id)3)
    {
      if ([(PHBottomBar *)self shouldUseLayoutAsCallScreening])
      {
        double v25 = PHBottomBarButton;
        goto LABEL_3;
      }
      double v26 = [[PHBottomBarSupplementalButton alloc] initWithAction:a3];
LABEL_4:
      unint64_t v27 = (PHBottomBarButton *)v26;
      if (!v20) {
        goto LABEL_19;
      }
LABEL_18:
      [(PHBottomBarButton *)v27 setTitle:v20 forState:0];
      goto LABEL_19;
    }
  }
  if (v24)
  {
    unint64_t v27 = [[PHBottomBarButton alloc] initWithConfiguration:v24];
    id v30 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"buttonLongPressed:"];
    [v30 setMinimumPressDuration:2.5];
    [(PHBottomBarButton *)v27 intrinsicContentSize];
    [v30 setAllowableMovement:v31 * 0.5];
    [(PHBottomBarButton *)v27 addGestureRecognizer:v30];
    goto LABEL_15;
  }
  if (a3 == 31)
  {
    double v26 = [(PHBottomBar *)self makeCaptureButtonWithDiameter:a9];
    goto LABEL_4;
  }
  unint64_t v27 = +[UIButton buttonWithType:1];
  unint64_t v32 = +[UIColor clearColor];
  [(PHBottomBarButton *)v27 setBackgroundColor:v32];

  id v30 = +[UIColor systemGrayColor];
  [(PHBottomBarButton *)v27 setTitleColor:v30 forState:2];
LABEL_15:

  if (a3 == 17)
  {
    double v33 = [(PHBottomBarButton *)v27 titleLabel];
    [v33 setNumberOfLines:2];

    double v34 = [(PHBottomBarButton *)v27 titleLabel];
    [v34 setTextAlignment:1];
  }
  if (v20) {
    goto LABEL_18;
  }
LABEL_19:
  if (v18)
  {
    v35 = [(PHBottomBarButton *)v27 titleLabel];
    [v35 setFont:v18];
  }
  if (v19) {
    [(PHBottomBarButton *)v27 setTitleColor:v19 forState:0];
  }
  if (v17) {
    [(PHBottomBarButton *)v27 setBackgroundColor:v17];
  }
  if (v16)
  {
    [(PHBottomBarButton *)v27 setImage:v16 forState:0];
    [(PHBottomBarButton *)v27 setAdjustsImageWhenDisabled:0];
    [(PHBottomBarButton *)v27 setAdjustsImageWhenHighlighted:0];
  }
  [(PHBottomBarButton *)v27 setAction:a3];
  [(PHBottomBarButton *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHBottomBarButton *)v27 addTarget:self action:"buttonPressed:" forControlEvents:64];

  return v27;
}

- (id)makeCaptureButtonWithDiameter:(double)a3
{
  unsigned __int8 v4 = +[CUShutterButton smallShutterButton];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:self action:"buttonPressed:" forControlEvents:64];
  [v4 setAction:31];
  [v4 setShowDisabled:1];

  return v4;
}

- (id)makeSlidingButtonWithType:(int)a3
{
  if ((a3 - 1) > 7) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = dword_1002851D8[a3 - 1];
  }
  id v5 = [[PHSlidingButton alloc] initWithSlidingButtonType:*(void *)&a3 appearanceType:v4 callState:[(PHBottomBar *)self currentBottomBarCallState]];
  [(PHSlidingButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHSlidingButton *)v5 setDelegate:self];

  return v5;
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  id v5 = [v4 superview];

  if (v4 && v5 != self)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHBottomBar;
    [(PHBottomBar *)&v6 addSubview:v4];
  }
}

- (void)removeAllButtons
{
  [(UIButton *)self->_supplementalTopLeftButton removeFromSuperview];
  supplementalTopLeftButton = self->_supplementalTopLeftButton;
  self->_supplementalTopLeftButton = 0;

  [(UIButton *)self->_supplementalTopRightButton removeFromSuperview];
  supplementalTopRightButton = self->_supplementalTopRightButton;
  self->_supplementalTopRightButton = 0;

  [(UIButton *)self->_supplementalBottomLeftButton removeFromSuperview];
  supplementalBottomLeftButton = self->_supplementalBottomLeftButton;
  self->_supplementalBottomLeftButton = 0;

  [(UIButton *)self->_supplementalBottomRightButton removeFromSuperview];
  supplementalBottomRightButton = self->_supplementalBottomRightButton;
  self->_supplementalBottomRightButton = 0;

  [(UIButton *)self->_mainLeftButton removeFromSuperview];
  mainLeftButton = self->_mainLeftButton;
  self->_mainLeftButton = 0;

  [(UIButton *)self->_mainRightButton removeFromSuperview];
  mainRightButton = self->_mainRightButton;
  self->_mainRightButton = 0;

  [(PHSlidingButton *)self->_slidingButton removeFromSuperview];
  slidingButton = self->_slidingButton;
  self->_slidingButton = 0;

  [(UIButton *)self->_sideButtonRight removeFromSuperview];
  sideButtonRight = self->_sideButtonRight;
  self->_sideButtonRight = 0;

  [(UIButton *)self->_sideButtonLeft removeFromSuperview];
  sideButtonLeft = self->_sideButtonLeft;
  self->_sideButtonLeft = 0;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (!a3)
    {
      id v4 = [(PHBottomBar *)self pendingStateBlocks];
      id v5 = [v4 count];

      if (v5)
      {
        objc_super v6 = sub_1000D5130();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [(PHBottomBar *)self pendingStateBlocks];
          *(_DWORD *)buf = 134217984;
          id v20 = [v7 count];
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bottom bar has %ld pending state block(s) waiting for the animation to finish, we'll run those now", buf, 0xCu);
        }
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        double v8 = [(PHBottomBar *)self pendingStateBlocks];
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))();
            }
            id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v10);
        }

        float v13 = [(PHBottomBar *)self pendingStateBlocks];
        [v13 removeAllObjects];
      }
    }
  }
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(PHBottomBar *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if ([v4 action] == (id)30)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100104A84;
      v8[3] = &unk_1002CD518;
      id v9 = v4;
      +[UIView animateWithDuration:v8 animations:0 completion:0.25];
    }
    id v7 = [(PHBottomBar *)self delegate];
    [v7 bottomBarActionPerformed:[v4 action] withCompletionState:1 fromBar:self];
  }
}

- (void)buttonLongPressed:(id)a3
{
  id v9 = a3;
  id v4 = [(PHBottomBar *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [v9 view];
    id v7 = [v6 action];

    if (v7 == (id)15)
    {
      double v8 = [(PHBottomBar *)self delegate];
      [v8 bottomBarActionPerformed:16 withCompletionState:1 fromBar:self];
    }
  }
}

- (void)willFinishSlideForSlidingButton:(id)a3
{
  [(PHBottomBar *)self setAnimating:1];
  id v4 = [(PHBottomBar *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(PHBottomBar *)self delegate];
    [v6 bottomBarActionPerformed:1 withCompletionState:1 fromBar:self];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100104C6C;
  v7[3] = &unk_1002CD518;
  v7[4] = self;
  +[UIView animateWithDuration:v7 animations:0 completion:0.200000003];
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
}

- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4
{
  char v6 = [(PHBottomBar *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = [(PHBottomBar *)self delegate];
    *(float *)&double v8 = a4;
    [v9 sliderActionFromBar:self slidToProportion:v8];
  }
}

- (id)viewLabels
{
  int64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  mainLeftButton = self->_mainLeftButton;
  if (mainLeftButton) {
    [v3 setValue:mainLeftButton forKey:@"_mainLeftButton"];
  }
  mainRightButton = self->_mainRightButton;
  if (mainRightButton) {
    [v4 setValue:mainRightButton forKey:@"_mainRightButton"];
  }
  supplementalTopRightButton = self->_supplementalTopRightButton;
  if (supplementalTopRightButton) {
    [v4 setValue:supplementalTopRightButton forKey:@"_supplementalTopRightButton"];
  }
  supplementalTopLeftButton = self->_supplementalTopLeftButton;
  if (supplementalTopLeftButton) {
    [v4 setValue:supplementalTopLeftButton forKey:@"_supplementalTopLeftButton"];
  }
  supplementalBottomRightButton = self->_supplementalBottomRightButton;
  if (supplementalBottomRightButton) {
    [v4 setValue:supplementalBottomRightButton forKey:@"_supplementalBottomRightButton"];
  }
  supplementalBottomLeftButton = self->_supplementalBottomLeftButton;
  if (supplementalBottomLeftButton) {
    [v4 setValue:supplementalBottomLeftButton forKey:@"_supplementalBottomLeftButton"];
  }
  slidingButton = self->_slidingButton;
  if (slidingButton) {
    [v4 setValue:slidingButton forKey:@"_slidingButton"];
  }
  sideButtonLeft = self->_sideButtonLeft;
  if (sideButtonLeft) {
    [v4 setValue:sideButtonLeft forKey:@"_sideButtonLeft"];
  }
  sideButtonRight = self->_sideButtonRight;
  if (sideButtonRight) {
    [v4 setValue:sideButtonRight forKey:@"_sideButtonRight"];
  }

  return v4;
}

- (CGRect)frameForControlWithActionType:(int64_t)a3
{
  int64_t v3 = [(PHBottomBar *)self controlForActionType:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 frame];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)controlForActionType:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PHBottomBar *)self viewLabels];
  double v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 action] == (id)a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)customTitleStringForActionType:(int64_t)a3 givenDefaultTitle:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(PHBottomBar *)self delegate];
    id v10 = [v9 customizedTitleForItemInBar:self withActionType:a3];

    if (v10)
    {
      id v11 = v10;

      id v6 = v11;
    }
  }

  return v6;
}

- (id)updatedImageForActionType:(int64_t)a3 givenDefaultImage:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 21) <= 1)
  {
    id v7 = +[PHBottomBarButtonConfiguration imageColorForState:0];
    uint64_t v8 = [(PHBottomBar *)self audioRouteImageWithColor:v7];

    id v6 = (id)v8;
  }

  return v6;
}

- (id)updatedSelectedImageForActionType:(int64_t)a3 givenDefaultSelectedImage:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 21) <= 1)
  {
    id v7 = +[PHBottomBarButtonConfiguration imageColorForState:4];
    uint64_t v8 = [(PHBottomBar *)self audioRouteImageWithColor:v7];

    id v6 = (id)v8;
  }

  return v6;
}

- (id)audioRouteImageWithColor:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHBottomBar *)self shouldShowActionTypeAudioRoute];
  int64_t v6 = [(PHBottomBar *)self currentBottomBarCallState];
  if (v5) {
    uint64_t v7 = 22;
  }
  else {
    uint64_t v7 = 21;
  }
  uint64_t v8 = +[PHBottomBarButtonConfiguration imageForAction:v7 callState:v6];
  double v9 = [v8 _flatImageWithColor:v4];

  return v9;
}

- (BOOL)updatedSelectedStateForActionType:(int64_t)a3
{
  if (a3 == 21)
  {
    if ([(PHBottomBar *)self shouldShowActionTypeAudioRoute])
    {
      return 0;
    }
    else
    {
      return [(PHBottomBar *)self currentCallIsMuted];
    }
  }
  else
  {
    unsigned int v5 = -[PHBottomBar controlForActionType:](self, "controlForActionType:");
    unsigned __int8 v6 = [v5 isSelected];

    return v6;
  }
}

- (int64_t)updatedActionTypeForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 21) <= 1)
  {
    if ([(PHBottomBar *)self shouldShowActionTypeAudioRoute]) {
      return 22;
    }
    else {
      return 21;
    }
  }
  return a3;
}

- (void)refreshCustomizedActionTypeTitles
{
  uint64_t v3 = [(PHBottomBar *)self mainLeftButton];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v3];

  uint64_t v4 = [(PHBottomBar *)self mainRightButton];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v4];

  unsigned int v5 = [(PHBottomBar *)self sideButtonLeft];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v5];

  unsigned __int8 v6 = [(PHBottomBar *)self sideButtonRight];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v6];

  uint64_t v7 = [(PHBottomBar *)self supplementalBottomLeftButton];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v7];

  id v8 = [(PHBottomBar *)self supplementalBottomRightButton];
  [(PHBottomBar *)self refreshCustomizedActionTypeTitleForButton:v8];
}

- (void)refreshCustomizedActionTypeTitleForButton:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [v11 action];
    unsigned int v5 = [v11 titleForState:0];
    unsigned __int8 v6 = [(PHBottomBar *)self customTitleStringForActionType:v4 givenDefaultTitle:v5];

    [v11 setTitle:v6 forState:0];
    uint64_t v7 = [v11 imageForState:0];
    id v8 = [(PHBottomBar *)self updatedImageForActionType:v4 givenDefaultImage:v7];

    [v11 setImage:v8 forState:0];
    double v9 = [v11 imageForState:4];
    id v10 = [(PHBottomBar *)self updatedSelectedImageForActionType:v4 givenDefaultSelectedImage:v9];

    if (v10) {
      [v11 setImage:v10 forState:4];
    }
    [v11 setAction:[self updatedActionTypeForActionType:[v11 action]]];
    [v11 setSelected:[self updatedSelectedStateForActionType:v4]];
  }
}

- (void)refreshEndCallButton
{
  id v3 = [(PHBottomBar *)self mainLeftButton];
  [v3 refreshForCallState:[self currentBottomBarCallState]];
}

- (UIButton)useRTTButton
{
  id v3 = sub_10010C7DC();
  id v4 = +[TUCallCenter sharedInstance];
  unsigned int v5 = [v4 frontmostCall];

  unsigned __int8 v6 = [v5 localSenderIdentityUUID];
  uint64_t v7 = [v3 rttDisplayName:0 forSubscriptionContextUUID:v6];
  unint64_t v8 = +[PHUIConfiguration inCallBottomBarSpacing];
  double v9 = 15.0;
  if (!v8) {
    double v9 = 14.0;
  }
  id v10 = +[UIFont systemFontOfSize:v9];
  id v11 = +[UIColor whiteColor];
  double v12 = [(PHBottomBar *)self makeButtonWithType:30 title:v7 image:0 color:0 font:v10 fontColor:v11];

  return (UIButton *)v12;
}

- (void)refreshUseRTTButton
{
  if ((id)[(PHBottomBar *)self currentState] == (id)11)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100105834;
    v3[3] = &unk_1002CD518;
    v3[4] = self;
    +[UIView animateWithDuration:v3 animations:0 completion:0.25];
  }
}

- (BOOL)shouldShowAnswerRTTButton
{
  id v3 = [(PHBottomBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(PHBottomBar *)self delegate];
    unsigned __int8 v5 = [v4 shouldShowAnswerRTT];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowUseRTTButton
{
  id v3 = [(PHBottomBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(PHBottomBar *)self delegate];
    unsigned __int8 v5 = [v4 shouldShowUseRTT];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setPrefersWhiteButtonTextColor:(BOOL)a3
{
  if (a3) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v13 = +[UIColor blackColor];
  }
  id v4 = [(PHBottomBar *)self supplementalTopLeftButton];

  if (v4)
  {
    unsigned __int8 v5 = [(PHBottomBar *)self supplementalTopLeftButton];
    [v5 setTitleColor:v13 forState:0];
  }
  unsigned __int8 v6 = [(PHBottomBar *)self supplementalTopRightButton];

  if (v6)
  {
    uint64_t v7 = [(PHBottomBar *)self supplementalTopRightButton];
    [v7 setTitleColor:v13 forState:0];
  }
  unint64_t v8 = [(PHBottomBar *)self mainLeftButton];

  if (v8)
  {
    double v9 = [(PHBottomBar *)self mainLeftButton];
    [v9 setTitleColor:v13 forState:0];
  }
  id v10 = [(PHBottomBar *)self mainRightButton];

  id v11 = (void *)v13;
  if (v10)
  {
    double v12 = [(PHBottomBar *)self mainRightButton];
    [v12 setTitleColor:v13 forState:0];

    id v11 = (void *)v13;
  }
}

- (void)prepareButtonsForAnimationBegin
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(PHBottomBar *)self viewLabels];
  id v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 performSelector:"_animationWillBegin"];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)prepareButtonsForAnimationEnd
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(PHBottomBar *)self viewLabels];
  id v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 performSelector:"_animationDidEnd"];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)animateFromState:(int64_t)a3 toState:(int64_t)a4 completion:(id)a5
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100106054;
  v26[3] = &unk_1002CE9D0;
  v26[4] = self;
  id v27 = a5;
  unint64_t v8 = objc_retainBlock(v26);
  long long v9 = objc_retainBlock(v8);
  if (!a3 && a4 == 11)
  {
    [(PHBottomBar *)self animateFromIncomingCallStateToInCallState:11 withCompletion:v9];
LABEL_35:
    BOOL v22 = 1;
    goto LABEL_36;
  }
  if (a4 == 19 && (a3 == 20 || a3 == 11))
  {
    long long v10 = +[NSBundle mainBundle];
    long long v11 = [v10 localizedStringForKey:@"HIDE" value:&stru_1002D6110 table:@"BottomBar"];
    unint64_t v12 = +[PHUIConfiguration inCallBottomBarSpacing];
    double v13 = 15.0;
    if (!v12) {
      double v13 = 14.0;
    }
    long long v14 = +[UIFont systemFontOfSize:v13];
    long long v15 = +[UIColor whiteColor];
    long long v16 = [(PHBottomBar *)self makeButtonWithType:17 title:v11 image:0 color:0 font:v14 fontColor:v15];

    [(PHBottomBar *)self animateInSupplementalBottomRightButton:v16 WithCompletion:v9];
    goto LABEL_35;
  }
  BOOL v18 = a4 == 11 || a4 == 20;
  if (a3 == 19 && v18)
  {
    id v19 = [(PHBottomBar *)self useRTTButton];
    [(PHBottomBar *)self animateInSupplementalBottomRightButton:v19 WithCompletion:v9];

    goto LABEL_35;
  }
  if (!a3 && a4 == 15)
  {
    [(PHBottomBar *)self animateFromIncomingCallStateToFaceTimeInCallState:15 withCompletion:v9];
    goto LABEL_35;
  }
  if (a3 == 20 && a4 == 11)
  {
    [(PHBottomBar *)self animateOutSupplementalBottomLeftButtonToState:11 withCompletion:v9];
    goto LABEL_35;
  }
  if (a3 == 21 && a4 == 11)
  {
    [(PHBottomBar *)self animateFromOutgoingStateToInCallStateWithCompletion:v9];
    goto LABEL_35;
  }
  if (a3 == 15 && a4 == 17)
  {
    id v20 = self;
    uint64_t v21 = 17;
LABEL_34:
    [(PHBottomBar *)v20 animateFromOutgoingStateToCallbackAndMessageUIToState:v21 withCompletion:v9];
    goto LABEL_35;
  }
  if (a3 == 15 && a4 == 26)
  {
    id v20 = self;
    uint64_t v21 = 26;
    goto LABEL_34;
  }
  if (a3 == 14 && a4 == 15)
  {
    [(PHBottomBar *)self animateFromFaceTimeOutgoingStateToFaceTimeInCallState:15 withCompletion:v9];
    goto LABEL_35;
  }
  BOOL v22 = 0;
  if (!a3 && a4 == 23)
  {
    unint64_t v24 = [(PHBottomBar *)self callDisplayStyleManager];
    id v25 = [v24 callDisplayStyle];

    if (v25 != (id)3)
    {
      BOOL v22 = 0;
      goto LABEL_36;
    }
    [(PHBottomBar *)self ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:v9];
    goto LABEL_35;
  }
LABEL_36:

  return v22;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBar;
  [(PHBottomBar *)&v3 layoutSubviews];
  [(PHBottomBar *)self updateTopLayoutGuide];
  [(PHBottomBar *)self updateMainButtonLayoutGuide];
}

- (void)animateFromOutgoingStateToInCallStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PHBottomBar *)self callDisplayStyleManager];
  id v6 = [v5 callDisplayStyle];

  if (v6 != (id)3)
  {
    [(PHBottomBar *)self prepareButtonsForAnimationBegin];
    uint64_t v7 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    [v7 setMass:2.0];
    [v7 setStiffness:300.0];
    [v7 setDamping:50.0];
    [v7 setDuration:0.50999999];
    [v7 setToValue:&off_1002DFA28];
    [v7 setFillMode:kCAFillModeForwards];
    [v7 setRemovedOnCompletion:0];
    unint64_t v8 = +[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    id v9 = +[UIColor systemGreenColor];
    id v10 = [v9 CGColor];

    id v11 = +[UIColor systemRedColor];
    id v12 = [v11 CGColor];

    v31[0] = v10;
    v31[1] = v12;
    double v13 = +[NSArray arrayWithObjects:v31 count:2];
    [v8 setValues:v13];

    [v8 setKeyTimes:&off_1002DF8F0];
    [v8 setDuration:0.254999995];
    [v8 setFillMode:kCAFillModeForwards];
    [v8 setRemovedOnCompletion:0];
    long long v14 = [(PHBottomBar *)self mainLeftButton];
    long long v15 = [v14 imageView];
    [v15 setClipsToBounds:0];

    long long v16 = [(PHBottomBar *)self mainLeftButton];
    long long v17 = [v16 imageView];
    [v17 setContentMode:4];

    +[CATransaction begin];
    double v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    long long v28 = sub_1001064AC;
    id v29 = &unk_1002CDA98;
    id v30 = v4;
    +[CATransaction setCompletionBlock:&v26];
    BOOL v18 = [(PHBottomBar *)self mainLeftButton];
    uint64_t v19 = [v18 imageView];
    id v20 = [(id)v19 layer];
    [v20 addAnimation:v7 forKey:@"rollButtonAnimation"];

    uint64_t v21 = [(PHBottomBar *)self mainLeftButton];
    objc_opt_class();
    LOBYTE(v19) = objc_opt_isKindOfClass();

    BOOL v22 = [(PHBottomBar *)self mainLeftButton];
    double v23 = v22;
    if (v19)
    {
      unint64_t v24 = [v22 roundView];
      id v25 = [v24 layer];
      [v25 addAnimation:v8 forKey:@"buttonColorAnimation"];
    }
    else
    {
      unint64_t v24 = [v22 layer];
      [v24 addAnimation:v8 forKey:@"buttonColorAnimation"];
    }

    +[CATransaction commit];
  }
}

- (void)animateInSupplementalBottomRightButton:(id)a3 WithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PHBottomBar *)self callDisplayStyleManager];
  id v9 = [v8 callDisplayStyle];

  if (v9 != (id)3)
  {
    v77 = [(PHBottomBar *)self supplementalBottomRightButton];
    [(PHBottomBar *)self setSupplementalBottomRightButton:v6];
    id v10 = [(PHBottomBar *)self supplementalBottomRightButton];
    [v10 setAlpha:0.0];

    id v11 = [(PHBottomBar *)self supplementalBottomRightButton];
    [(PHBottomBar *)self addSubview:v11];

    v79 = +[NSMutableArray array];
    v78 = [(PHBottomBar *)self viewLabels];
    v89[0] = @"SideMarginForDoubleButton";
    [(PHBottomBar *)self sideMarginForDoubleButton];
    char v76 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[0] = v76;
    v89[1] = @"SideMarginForFaceTimeButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeButtons];
    v75 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[1] = v75;
    v89[2] = @"SideMarginForFaceTimeInCallButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeInCallButtons];
    v74 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[2] = v74;
    v89[3] = @"TopMarginForFaceTimeButtons";
    LODWORD(v11) = [(PHBottomBar *)self usesLowerButtons];
    v73 = [(PHBottomBar *)self callDisplayStyleManager];
    id v12 = [v73 callDisplayStyle];
    int v72 = (int)v11;
    if (v11)
    {
      if (v12 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v14 = v13;
      unint64_t v15 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v16 = 30.0;
      if (v15 != 6)
      {
        unint64_t v17 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v16 = 24.0;
        if (v17 == 3) {
          double v16 = 30.0;
        }
      }
      double v18 = v14 + v16;
      *(float *)&double v18 = v18;
      v71 = +[NSNumber numberWithFloat:v18];
      [v71 floatValue];
      double v20 = v19;
      [(PHBottomBar *)self yOffsetForLoweredButtons];
      double v22 = v21 + v20;
      *(float *)&double v22 = v22;
      uint64_t v23 = +[NSNumber numberWithFloat:v22];
    }
    else
    {
      if (v12 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v25 = v24;
      unint64_t v26 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v27 = 30.0;
      if (v26 != 6)
      {
        unint64_t v28 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v27 = 24.0;
        if (v28 == 3) {
          double v27 = 30.0;
        }
      }
      double v29 = v25 + v27;
      *(float *)&double v29 = v29;
      uint64_t v23 = +[NSNumber numberWithFloat:v29];
      v71 = (void *)v23;
    }
    v68 = (void *)v23;
    v90[3] = v23;
    v89[4] = @"ButtonSpacing";
    unint64_t v30 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v31) = 30.0;
    if (v30 != 6)
    {
      unint64_t v32 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v31) = 24.0;
      if (v32 == 3) {
        *(float *)&double v31 = 30.0;
      }
    }
    v70 = +[NSNumber numberWithFloat:v31];
    v90[4] = v70;
    v89[5] = @"AmbientButtonSpacing";
    +[PHUIConfiguration ambientInCallControlSpacing];
    v69 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[5] = v69;
    v89[6] = @"ButtonSliderSpacing";
    unint64_t v33 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v34) = 25.0;
    if (v33 != 6)
    {
      unint64_t v35 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v34) = 1102315520;
      if (v35 == 3) {
        *(float *)&double v34 = 25.0;
      }
    }
    double v36 = +[NSNumber numberWithFloat:v34];
    v90[6] = v36;
    v89[7] = @"BottomSupplementalButtonSpacing";
    +[PHBottomBar defaultBottomSupplementalButtonSpacing];
    unint64_t v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[7] = v37;
    v90[8] = &off_1002DF9A8;
    v89[8] = @"TopSupplementalButtonSpacing";
    v89[9] = @"HeightOfAButtonPlusButtonSpacing";
    v38 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v38 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v40 = v39;
    double v81 = v6;
    unint64_t v41 = +[PHUIConfiguration inCallBottomBarSpacing];
    double v42 = 30.0;
    if (v41 != 6)
    {
      unint64_t v43 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v42 = 24.0;
      if (v43 == 3) {
        double v42 = 30.0;
      }
    }
    unsigned __int8 v80 = v7;
    double v44 = v40 + v42;
    *(float *)&double v44 = v44;
    v45 = +[NSNumber numberWithFloat:v44];
    v90[9] = v45;
    v89[10] = @"ButtonSpacingCallScreening";
    unint64_t v46 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v47) = 30.0;
    if (v46 != 6)
    {
      unint64_t v48 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v47) = 24.0;
      if (v48 == 3) {
        *(float *)&double v47 = 30.0;
      }
    }
    id v49 = +[NSNumber numberWithFloat:v47];
    v90[10] = v49;
    v89[11] = @"HeightOfCallScreeningButtonPlusButtonSpacing";
    [(PHBottomBar *)self heightOfCallScreeningButtonPlusButtonSpacing];
    v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90[11] = v50;
    v89[12] = @"ButtonSliderSpacingCallScreeningSlider";
    unint64_t v51 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v52) = 25.0;
    if (v51 != 6)
    {
      unint64_t v53 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v52) = 1102315520;
      if (v53 == 3) {
        *(float *)&double v52 = 25.0;
      }
    }
    double v54 = +[NSNumber numberWithFloat:v52];
    v90[12] = v54;
    double v55 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:13];

    if (v72) {
    double v56 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[_mainLeftButton]" options:0 metrics:v55 views:v78];
    }
    [v79 addObjectsFromArray:v56];

    v57 = [(PHBottomBar *)self supplementalBottomRightButton];
    v58 = +[NSLayoutConstraint constraintWithItem:v57 attribute:10 relatedBy:0 toItem:self->_mainLeftButton attribute:10 multiplier:1.0 constant:0.0];
    [v79 addObject:v58];

    v59 = +[NSLayoutConstraint constraintWithItem:self->_mainLeftButton attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [v79 addObject:v59];

    +[PHInCallNumberPadButton defaultSize];
    double v61 = v60;
    BOOL v62 = sub_1000FD8C4();
    double v63 = 12.0;
    if (!v62) {
      double v63 = 0.0;
    }
    double v64 = v61 + v63;
    v65 = [(PHBottomBar *)self supplementalBottomRightButton];
    uint64_t v66 = +[NSLayoutConstraint constraintWithItem:v65 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:v64];
    [v79 addObject:v66];

    [(PHBottomBar *)self addConstraints:v79];
    [(PHBottomBar *)self prepareButtonsForAnimationBegin];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100106D18;
    v85[3] = &unk_1002CDFE8;
    id v6 = v81;
    id v86 = v81;
    v87 = self;
    id v88 = v77;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_100106DF4;
    v82[3] = &unk_1002D0A38;
    id v7 = v80;
    id v83 = v88;
    id v84 = v80;
    id v67 = v88;
    +[UIView animateWithDuration:v85 animations:v82 completion:0.25];
  }
}

- (void)animateOutSupplementalBottomLeftButtonToState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 != (id)3)
  {
    v71 = v6;
    id v67 = [(PHBottomBar *)self supplementalBottomLeftButton];
    v70 = +[NSMutableArray array];
    v69 = [(PHBottomBar *)self viewLabels];
    v78[0] = @"SideMarginForDoubleButton";
    [(PHBottomBar *)self sideMarginForDoubleButton];
    uint64_t v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[0] = v66;
    v78[1] = @"SideMarginForFaceTimeButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeButtons];
    v65 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[1] = v65;
    v78[2] = @"SideMarginForFaceTimeInCallButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeInCallButtons];
    double v64 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[2] = v64;
    v78[3] = @"TopMarginForFaceTimeButtons";
    unsigned int v9 = [(PHBottomBar *)self usesLowerButtons];
    double v63 = [(PHBottomBar *)self callDisplayStyleManager];
    id v10 = [v63 callDisplayStyle];
    unsigned int v62 = v9;
    if (v9)
    {
      if (v10 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v12 = v11;
      unint64_t v13 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v14 = 30.0;
      if (v13 != 6)
      {
        unint64_t v15 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v14 = 24.0;
        if (v15 == 3) {
          double v14 = 30.0;
        }
      }
      double v16 = v12 + v14;
      *(float *)&double v16 = v16;
      double v61 = +[NSNumber numberWithFloat:v16];
      [v61 floatValue];
      double v18 = v17;
      [(PHBottomBar *)self yOffsetForLoweredButtons];
      double v20 = v19 + v18;
      *(float *)&double v20 = v20;
      uint64_t v21 = +[NSNumber numberWithFloat:v20];
    }
    else
    {
      if (v10 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v23 = v22;
      unint64_t v24 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v25 = 30.0;
      if (v24 != 6)
      {
        unint64_t v26 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v25 = 24.0;
        if (v26 == 3) {
          double v25 = 30.0;
        }
      }
      double v27 = v23 + v25;
      *(float *)&double v27 = v27;
      uint64_t v21 = +[NSNumber numberWithFloat:v27];
      double v61 = (void *)v21;
    }
    v58 = (void *)v21;
    v79[3] = v21;
    v78[4] = @"ButtonSpacing";
    unint64_t v28 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v29) = 30.0;
    if (v28 != 6)
    {
      unint64_t v30 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v29) = 24.0;
      if (v30 == 3) {
        *(float *)&double v29 = 30.0;
      }
    }
    double v60 = +[NSNumber numberWithFloat:v29];
    v79[4] = v60;
    v78[5] = @"AmbientButtonSpacing";
    +[PHUIConfiguration ambientInCallControlSpacing];
    v59 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[5] = v59;
    v78[6] = @"ButtonSliderSpacing";
    unint64_t v31 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v32) = 25.0;
    if (v31 != 6)
    {
      unint64_t v33 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v32) = 1102315520;
      if (v33 == 3) {
        *(float *)&double v32 = 25.0;
      }
    }
    double v34 = +[NSNumber numberWithFloat:v32];
    v79[6] = v34;
    v78[7] = @"BottomSupplementalButtonSpacing";
    +[PHBottomBar defaultBottomSupplementalButtonSpacing];
    unint64_t v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[7] = v35;
    v79[8] = &off_1002DF9A8;
    v78[8] = @"TopSupplementalButtonSpacing";
    v78[9] = @"HeightOfAButtonPlusButtonSpacing";
    double v36 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v36 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v38 = v37;
    unint64_t v39 = +[PHUIConfiguration inCallBottomBarSpacing];
    double v40 = 30.0;
    if (v39 != 6)
    {
      unint64_t v41 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v40 = 24.0;
      if (v41 == 3) {
        double v40 = 30.0;
      }
    }
    int64_t v68 = a3;
    double v42 = v38 + v40;
    *(float *)&double v42 = v42;
    unint64_t v43 = +[NSNumber numberWithFloat:v42];
    v79[9] = v43;
    v78[10] = @"ButtonSpacingCallScreening";
    unint64_t v44 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v45) = 30.0;
    if (v44 != 6)
    {
      unint64_t v46 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v45) = 24.0;
      if (v46 == 3) {
        *(float *)&double v45 = 30.0;
      }
    }
    double v47 = +[NSNumber numberWithFloat:v45];
    v79[10] = v47;
    v78[11] = @"HeightOfCallScreeningButtonPlusButtonSpacing";
    [(PHBottomBar *)self heightOfCallScreeningButtonPlusButtonSpacing];
    unint64_t v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v79[11] = v48;
    v78[12] = @"ButtonSliderSpacingCallScreeningSlider";
    unint64_t v49 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v50) = 25.0;
    if (v49 != 6)
    {
      unint64_t v51 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v50) = 1102315520;
      if (v51 == 3) {
        *(float *)&double v50 = 25.0;
      }
    }
    double v52 = +[NSNumber numberWithFloat:v50];
    v79[12] = v52;
    unint64_t v53 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:13];

    if (v62) {
    [(PHBottomBar *)self setSupplementalBottomLeftButton:0];
    }
    double v54 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]", 0, v53, v69);
    [v70 addObjectsFromArray:v54];

    double v55 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[_mainLeftButton]" options:0 metrics:v53 views:v69];
    [v70 addObjectsFromArray:v55];

    double v56 = +[NSLayoutConstraint constraintWithItem:self->_mainLeftButton attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [v70 addObject:v56];

    [(PHBottomBar *)self prepareButtonsForAnimationBegin];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1001075B4;
    v76[3] = &unk_1002CD518;
    id v77 = v67;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1001075C0;
    v72[3] = &unk_1002D0A60;
    int64_t v75 = v68;
    v72[4] = self;
    id v73 = v77;
    id v6 = v71;
    id v74 = v71;
    id v57 = v77;
    +[UIView animateWithDuration:v76 animations:v72 completion:0.25];
  }
}

- (void)ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PHBottomBar *)self sideButtonLeft];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001077C4;
  v13[3] = &unk_1002CD540;
  v13[4] = self;
  +[AmbientAnimationCoordinator hide:v5 completion:v13];

  id v6 = [(PHBottomBar *)self mainLeftButton];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100107810;
  v11[3] = &unk_1002CE9D0;
  v11[4] = self;
  id v12 = v4;
  id v7 = v4;
  +[AmbientAnimationCoordinator hide:v6 completion:v11];

  id v8 = +[NSBundle mainBundle];
  unsigned int v9 = [v8 localizedStringForKey:@"ACCEPT" value:&stru_1002D6110 table:@"BottomBar"];
  id v10 = [(PHBottomBar *)self mainRightButton];
  [v10 setTitle:v9];
}

- (void)animateFromFaceTimeOutgoingStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 != (id)3)
  {
    if ([(PHBottomBar *)self shouldShowActionTypeEffects]) {
      uint64_t v9 = 32;
    }
    else {
      uint64_t v9 = 31;
    }
    +[PHBottomBarButtonConfiguration smallHeight];
    id v10 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v9, 0, 0, 0, 0, 0);
    [v10 setAlpha:0.0];
    double v11 = [(PHBottomBar *)self sideButtonLeft];
    [(PHBottomBar *)self setSideButtonLeft:v10];
    [(PHBottomBar *)self addSubview:self->_sideButtonLeft];
    id v12 = [(PHBottomBar *)self buttonLayoutConstraints];

    if (v12)
    {
      unint64_t v13 = [(PHBottomBar *)self buttonLayoutConstraints];
      [(PHBottomBar *)self removeConstraints:v13];
    }
    double v14 = [(PHBottomBar *)self constraintsForState:15];
    [(PHBottomBar *)self setButtonLayoutConstraints:v14];

    unint64_t v15 = [(PHBottomBar *)self buttonLayoutConstraints];
    [(PHBottomBar *)self addConstraints:v15];

    [(PHBottomBar *)self setNeedsLayout];
    [(PHBottomBar *)self layoutIfNeeded];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100107AE8;
    v22[3] = &unk_1002CDDE0;
    id v23 = v11;
    id v24 = v10;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100107B2C;
    v18[3] = &unk_1002D0A60;
    int64_t v21 = a3;
    v18[4] = self;
    id v19 = v23;
    id v20 = v6;
    id v16 = v23;
    id v17 = v10;
    +[UIView animateWithDuration:v22 animations:v18 completion:0.25];
  }
}

- (void)animateFromOutgoingStateToCallbackAndMessageUIToState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 != (id)3)
  {
    uint64_t v9 = [(PHBottomBar *)self makeButtonWithType:18 title:0 image:0 color:0 font:0 fontColor:0];
    id v10 = [(PHBottomBar *)self makeButtonWithType:19 title:0 image:0 color:0 font:0 fontColor:0];
    double v11 = [(PHBottomBar *)self makeButtonWithType:27 title:0 image:0 color:0 font:0 fontColor:0];
    [v9 setAlpha:0.0];
    [v11 setAlpha:0.0];
    [v10 setAlpha:0.0];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100107DA4;
    v21[3] = &unk_1002CD518;
    v21[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100107DB0;
    v15[3] = &unk_1002D0A88;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v9;
    int64_t v20 = a3;
    id v19 = v6;
    id v12 = v9;
    id v13 = v11;
    id v14 = v10;
    +[UIView animateWithDuration:v21 animations:v15 completion:0.25];
  }
}

- (void)animateFromIncomingCallStateToInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 != (id)3)
  {
    int64_t v62 = a3;
    BOOL v9 = (id)[(PHBottomBar *)self currentBottomBarCallState] == (id)2
      || (id)[(PHBottomBar *)self currentBottomBarCallState] == (id)4;
    [(PHBottomBar *)self prepareButtonsForAnimationBegin];
    id v10 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v10 setFromValue:&off_1002DF9D8];
    [v10 setToValue:&off_1002DF9E8];
    double v11 = +[CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    [v10 setTimingFunction:v11];

    [v10 setDuration:0.0399999991];
    BOOL v66 = v9;
    if (v9)
    {
      int64_t v68 = +[PHBottomBarAnimations rollAnimation];
    }
    else
    {
      id v12 = [(PHBottomBar *)self mainRightButton];
      id v13 = [v12 imageView];
      id v14 = [v13 image];
      id v15 = [v14 CGImage];
      id v16 = +[PHBottomBarButtonConfiguration imageForAction:15 callState:1];
      int64_t v68 = +[PHBottomBarAnimations crossFadeAnimationFromImage:toImage:](PHBottomBarAnimations, "crossFadeAnimationFromImage:toImage:", v15, [v16 CGImage]);
    }
    id v17 = +[UIColor systemRedColor];
    id v18 = [v17 CGColor];

    id v19 = [(PHBottomBar *)self mainRightButton];
    id v20 = [v19 backgroundColor];
    id v65 = v18;
    id v67 = +[PHBottomBarAnimations backgroundColorAnimationFromColor:toColor:](PHBottomBarAnimations, "backgroundColorAnimationFromColor:toColor:", [v20 CGColor], v18);

    int64_t v21 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    [v21 setMass:2.0];
    [v21 setStiffness:300.0];
    [v21 setDamping:50.0];
    [v21 setDuration:0.910000026];
    double v22 = [(PHBottomBar *)self mainRightButton];
    id v23 = [v22 layer];
    [v23 position];
    id v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v21 setFromValue:v24];

    [(PHBottomBar *)self bounds];
    unint64_t v26 = +[NSNumber numberWithDouble:v25 * 0.5];
    [v21 setToValue:v26];

    double v27 = [(PHBottomBar *)self supplementalTopLeftButton];
    unint64_t v28 = [(PHBottomBar *)self supplementalTopRightButton];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100108948;
    v76[3] = &unk_1002CD518;
    void v76[4] = self;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1001089D4;
    v71[3] = &unk_1002D0AB0;
    v71[4] = self;
    int64_t v75 = v62;
    id v63 = v27;
    id v72 = v63;
    id v29 = v28;
    id v73 = v29;
    id v74 = v6;
    +[UIView animateWithDuration:0x20000 delay:v76 options:v71 animations:0.25 completion:0.0];
    unint64_t v30 = [PHBottomBarButtonConfiguration alloc];
    unint64_t v31 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v31 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    unint64_t v33 = [(PHBottomBarButtonConfiguration *)v30 initWithAction:1 diameter:[(PHBottomBar *)self currentBottomBarCallState] callState:v32];

    double v34 = [(PHBottomBar *)self mainRightButton];
    unint64_t v35 = [(PHBottomBarButtonConfiguration *)v33 icon];
    [v34 setImage:v35 forState:0];

    double v36 = [(PHBottomBar *)self mainRightButton];
    double v37 = [v36 imageView];
    [v37 setClipsToBounds:0];

    double v38 = [(PHBottomBar *)self mainRightButton];
    unint64_t v39 = [v38 imageView];
    [v39 setContentMode:4];

    double v40 = [(PHBottomBar *)self mainRightButton];
    unint64_t v41 = [v40 titleLabel];
    double v42 = [v41 layer];
    [v42 addAnimation:v10 forKey:@"acceptTitleAnimation"];

    unint64_t v43 = [(PHBottomBar *)self mainRightButton];
    unint64_t v44 = [v43 imageView];
    double v45 = [v44 layer];
    [v45 addAnimation:v68 forKey:@"mainRightButtonAnimation"];

    unint64_t v46 = [(PHBottomBar *)self mainRightButton];
    uint64_t v47 = [v46 layer];
    [(id)v47 addAnimation:v21 forKey:@"buttonSlideAnimation"];

    unint64_t v48 = [(PHBottomBar *)self mainRightButton];
    objc_opt_class();
    LOBYTE(v47) = objc_opt_isKindOfClass();

    unint64_t v49 = [(PHBottomBar *)self mainRightButton];
    double v50 = v49;
    if (v47)
    {
      unint64_t v51 = [v49 roundView];
      double v52 = [v51 layer];
      [v52 addAnimation:v67 forKey:@"buttonColorAnimation"];
    }
    else
    {
      unint64_t v51 = [v49 layer];
      [v51 addAnimation:v67 forKey:@"buttonColorAnimation"];
    }

    unint64_t v53 = [(PHBottomBar *)self mainRightButton];
    [v53 setAction:15];

    double v54 = [(PHBottomBar *)self mainRightButton];
    double v55 = [v54 titleLabel];
    double v56 = [v55 layer];
    [v56 setOpacity:0.0];

    id v57 = [(PHBottomBar *)self mainRightButton];
    v58 = +[UIColor colorWithCGColor:v65];
    [v57 setBackgroundColor:v58];

    if (v66)
    {
      CATransform3DMakeRotation(&v70, 2.35619449, 0.0, 0.0, 1.0);
      v59 = [(PHBottomBar *)self mainRightButton];
      double v60 = [v59 imageView];
      double v61 = [v60 layer];
      CATransform3D v69 = v70;
      [v61 setTransform:&v69];
    }
  }
}

- (void)animateFromIncomingCallStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(PHBottomBar *)self callDisplayStyleManager];
  id v8 = [v7 callDisplayStyle];

  if (v8 != (id)3)
  {
    int64_t v119 = a3;
    if ([(PHBottomBar *)self shouldShowActionTypePhotoCapture])
    {
      +[PHBottomBarButtonConfiguration smallHeight];
      BOOL v9 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 31, 0, 0, 0, 0, 0);
      [(PHBottomBar *)self setSideButtonLeft:v9];
    }
    else
    {
      [(PHBottomBar *)self setSideButtonLeft:0];
    }
    if ([(PHBottomBar *)self shouldShowActionTypeAudioRoute]) {
      uint64_t v10 = 22;
    }
    else {
      uint64_t v10 = 21;
    }
    +[PHBottomBarButtonConfiguration smallHeight];
    double v11 = -[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v10, 0, 0, 0, 0, 0);
    [(PHBottomBar *)self setSideButtonRight:v11];

    [(UIButton *)self->_sideButtonRight setAlpha:0.0];
    [(UIButton *)self->_sideButtonLeft setAlpha:0.0];
    [(PHBottomBar *)self addSubview:self->_sideButtonRight];
    [(PHBottomBar *)self addSubview:self->_sideButtonLeft];
    v122 = +[NSMutableArray array];
    v121 = [(PHBottomBar *)self viewLabels];
    v135[0] = @"SideMarginForDoubleButton";
    [(PHBottomBar *)self sideMarginForDoubleButton];
    unsigned int v117 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[0] = v117;
    v135[1] = @"SideMarginForFaceTimeButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeButtons];
    float v115 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[1] = v115;
    v135[2] = @"SideMarginForFaceTimeInCallButtons";
    [(PHBottomBar *)self sideMarginForFaceTimeInCallButtons];
    uint64_t v114 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[2] = v114;
    v135[3] = @"TopMarginForFaceTimeButtons";
    LODWORD(v11) = [(PHBottomBar *)self usesLowerButtons];
    double v113 = [(PHBottomBar *)self callDisplayStyleManager];
    id v12 = [v113 callDisplayStyle];
    int v112 = (int)v11;
    if (v11)
    {
      if (v12 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v14 = v13;
      unint64_t v15 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v16 = 30.0;
      if (v15 != 6)
      {
        unint64_t v17 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v16 = 24.0;
        if (v17 == 3) {
          double v16 = 30.0;
        }
      }
      double v18 = v14 + v16;
      *(float *)&double v18 = v18;
      double v111 = +[NSNumber numberWithFloat:v18];
      [v111 floatValue];
      double v20 = v19;
      [(PHBottomBar *)self yOffsetForLoweredButtons];
      double v22 = v21 + v20;
      *(float *)&double v22 = v22;
      uint64_t v23 = +[NSNumber numberWithFloat:v22];
    }
    else
    {
      if (v12 == (id)3) {
        +[PHUIConfiguration ambientInCallControlSize];
      }
      else {
        +[PHBottomBarButtonConfiguration defaultHeight];
      }
      double v25 = v24;
      unint64_t v26 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v27 = 30.0;
      if (v26 != 6)
      {
        unint64_t v28 = +[PHUIConfiguration inCallBottomBarSpacing];
        double v27 = 24.0;
        if (v28 == 3) {
          double v27 = 30.0;
        }
      }
      double v29 = v25 + v27;
      *(float *)&double v29 = v29;
      uint64_t v23 = +[NSNumber numberWithFloat:v29];
      double v111 = (void *)v23;
    }
    v136[3] = v23;
    v135[4] = @"ButtonSpacing";
    unint64_t v30 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v31) = 30.0;
    if (v30 != 6)
    {
      unint64_t v32 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v31) = 24.0;
      if (v32 == 3) {
        *(float *)&double v31 = 30.0;
      }
    }
    v123 = v6;
    unint64_t v110 = +[NSNumber numberWithFloat:v31];
    v136[4] = v110;
    v135[5] = @"AmbientButtonSpacing";
    +[PHUIConfiguration ambientInCallControlSpacing];
    unint64_t v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[5] = v33;
    v135[6] = @"ButtonSliderSpacing";
    unint64_t v34 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v35) = 25.0;
    if (v34 != 6)
    {
      unint64_t v36 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v35) = 1102315520;
      if (v36 == 3) {
        *(float *)&double v35 = 25.0;
      }
    }
    double v37 = +[NSNumber numberWithFloat:v35];
    v136[6] = v37;
    v135[7] = @"BottomSupplementalButtonSpacing";
    +[PHBottomBar defaultBottomSupplementalButtonSpacing];
    double v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[7] = v38;
    v136[8] = &off_1002DF9A8;
    v135[8] = @"TopSupplementalButtonSpacing";
    v135[9] = @"HeightOfAButtonPlusButtonSpacing";
    unint64_t v39 = [(PHBottomBar *)self callDisplayStyleManager];
    if ([v39 callDisplayStyle] == (id)3) {
      +[PHUIConfiguration ambientInCallControlSize];
    }
    else {
      +[PHBottomBarButtonConfiguration defaultHeight];
    }
    double v41 = v40;
    unint64_t v42 = +[PHUIConfiguration inCallBottomBarSpacing];
    double v43 = 30.0;
    if (v42 != 6)
    {
      unint64_t v44 = +[PHUIConfiguration inCallBottomBarSpacing];
      double v43 = 24.0;
      if (v44 == 3) {
        double v43 = 30.0;
      }
    }
    double v45 = v41 + v43;
    *(float *)&double v45 = v45;
    unint64_t v46 = +[NSNumber numberWithFloat:v45];
    v136[9] = v46;
    v135[10] = @"ButtonSpacingCallScreening";
    unint64_t v47 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v48) = 30.0;
    if (v47 != 6)
    {
      unint64_t v49 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v48) = 24.0;
      if (v49 == 3) {
        *(float *)&double v48 = 30.0;
      }
    }
    double v50 = +[NSNumber numberWithFloat:v48];
    v136[10] = v50;
    v135[11] = @"HeightOfCallScreeningButtonPlusButtonSpacing";
    [(PHBottomBar *)self heightOfCallScreeningButtonPlusButtonSpacing];
    unint64_t v51 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v136[11] = v51;
    v135[12] = @"ButtonSliderSpacingCallScreeningSlider";
    unint64_t v52 = +[PHUIConfiguration inCallBottomBarSpacing];
    LODWORD(v53) = 25.0;
    if (v52 != 6)
    {
      unint64_t v54 = +[PHUIConfiguration inCallBottomBarSpacing];
      LODWORD(v53) = 1102315520;
      if (v54 == 3) {
        *(float *)&double v53 = 25.0;
      }
    }
    double v55 = +[NSNumber numberWithFloat:v53];
    v136[12] = v55;
    uint64_t v56 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:13];

    if (v112) {
    v118 = (void *)v56;
    }
    id v57 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainRightButton]", 0, v56, v121);
    [v122 addObjectsFromArray:v57];

    v58 = [(PHBottomBar *)self mainRightButton];
    v59 = [v58 centerXAnchor];
    double v60 = [(PHBottomBar *)self centerXAnchor];
    double v61 = [v59 constraintEqualToAnchor:v60];
    [v122 addObject:v61];

    int64_t v62 = [(PHBottomBar *)self constraintsForState:v119];
    [v122 addObjectsFromArray:v62];

    [(PHBottomBar *)self prepareButtonsForAnimationBegin];
    id v63 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v63 setFromValue:&off_1002DF9D8];
    [v63 setToValue:&off_1002DF9E8];
    double v64 = +[CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    [v63 setTimingFunction:v64];

    [v63 setDuration:0.0399999991];
    id v65 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    [v65 setMass:2.0];
    [v65 setStiffness:300.0];
    [v65 setDamping:50.0];
    [v65 setDuration:0.50999999];
    [v65 setEndAngle:2.35619449];
    [v65 setRemovedOnCompletion:0];
    BOOL v66 = +[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    id v67 = +[UIColor systemGreenColor];
    id v68 = [v67 CGColor];

    id v69 = +[UIColor systemRedColor];
    id v70 = [v69 CGColor];

    v134[0] = v68;
    id v116 = v70;
    v134[1] = v70;
    v71 = +[NSArray arrayWithObjects:v134 count:2];
    [v66 setValues:v71];

    [v66 setKeyTimes:&off_1002DF908];
    [v66 setDuration:0.254999995];
    [v66 setRemovedOnCompletion:0];
    id v72 = +[CASpringAnimation animationWithKeyPath:@"buttonSlideAnimation"];
    [v72 setMass:2.0];
    [v72 setStiffness:300.0];
    [v72 setDamping:50.0];
    [v72 setDuration:0.50999999];
    [v72 setKeyPath:@"position.x"];
    id v73 = [(PHBottomBar *)self mainRightButton];
    id v74 = [v73 layer];
    [v74 position];
    int64_t v75 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v72 setFromValue:v75];

    [(PHBottomBar *)self bounds];
    id v77 = +[NSNumber numberWithDouble:v76 * 0.5];
    [v72 setToValue:v77];

    v78 = [(PHBottomBar *)self mainLeftButton];
    v79 = [(PHBottomBar *)self mainRightButton];
    [v78 setAlpha:0.0];
    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_100109A70;
    v132[3] = &unk_1002CDDE0;
    v132[4] = self;
    id v80 = v78;
    id v133 = v80;
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_100109AE4;
    v131[3] = &unk_1002CD540;
    v131[4] = self;
    +[UIView animateWithDuration:0x20000 delay:v132 options:v131 animations:0.25 completion:0.0];
    [(PHBottomBar *)self setSupplementalTopLeftButton:0];
    [(PHBottomBar *)self setSupplementalTopRightButton:0];
    double v81 = [(PHBottomBar *)self mainRightButton];
    double v82 = [v81 imageView];
    [v82 setClipsToBounds:0];

    id v83 = [(PHBottomBar *)self mainRightButton];
    id v84 = [v83 imageView];
    [v84 setContentMode:4];

    +[CATransaction begin];
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_100109B4C;
    v126[3] = &unk_1002D0AD8;
    v126[4] = self;
    int64_t v130 = v119;
    id v129 = v123;
    id v120 = v79;
    id v127 = v120;
    id v85 = v80;
    id v128 = v85;
    +[CATransaction setCompletionBlock:v126];
    id v86 = [(PHBottomBar *)self mainRightButton];
    v87 = [v86 titleLabel];
    id v88 = [v87 layer];
    [v88 addAnimation:v63 forKey:@"acceptTitleAnimation"];

    CFStringRef v89 = [(PHBottomBar *)self mainRightButton];
    v90 = [v89 imageView];
    CFStringRef v91 = [v90 layer];
    [v91 addAnimation:v65 forKey:@"rollButtonAnimation"];

    v92 = [(PHBottomBar *)self mainRightButton];
    uint64_t v93 = [v92 layer];
    [(id)v93 addAnimation:v72 forKey:@"buttonSlideAnimation"];

    v94 = [(PHBottomBar *)self mainRightButton];
    objc_opt_class();
    LOBYTE(v93) = objc_opt_isKindOfClass();

    v95 = [(PHBottomBar *)self mainRightButton];
    id v96 = v95;
    if (v93)
    {
      double v97 = [v95 roundView];
      double v98 = [v97 layer];
      [v98 addAnimation:v66 forKey:@"buttonColorAnimation"];
    }
    else
    {
      double v97 = [v95 layer];
      [v97 addAnimation:v66 forKey:@"buttonColorAnimation"];
    }

    +[CATransaction commit];
    double v99 = [(PHBottomBar *)self mainRightButton];
    double v100 = [v99 titleLabel];
    v101 = [v100 layer];
    [v101 setOpacity:0.0];

    v102 = [(PHBottomBar *)self mainRightButton];
    v103 = +[UIColor colorWithCGColor:v116];
    [v102 setBackgroundColor:v103];

    CATransform3DMakeRotation(&v125, 2.35619449, 0.0, 0.0, 1.0);
    v104 = [(PHBottomBar *)self mainRightButton];
    v105 = [v104 imageView];
    v106 = [v105 layer];
    CATransform3D v124 = v125;
    [v106 setTransform:&v124];

    v107 = [(PHBottomBar *)self buttonLayoutConstraints];
    [(PHBottomBar *)self removeConstraints:v107];

    [(PHBottomBar *)self setButtonLayoutConstraints:v122];
    v108 = [(PHBottomBar *)self buttonLayoutConstraints];
    [(PHBottomBar *)self addConstraints:v108];

    [(PHBottomBar *)self setNeedsLayout];
    [(PHBottomBar *)self layoutIfNeeded];
    [(PHBottomBar *)self setNeedsDisplay];
    [(PHBottomBar *)self forceDisplayIfNeeded];

    id v6 = v123;
  }
}

- (void)_startShopDemoMode
{
  if (qword_100320238 <= 25) {
    uint64_t v3 = qword_100320238 + 1;
  }
  else {
    uint64_t v3 = 0;
  }
  qword_100320238 = v3;
  -[PHBottomBar setCurrentState:](self, "setCurrentState:");

  [(PHBottomBar *)self performSelector:"_startShopDemoMode" withObject:0 afterDelay:1.0];
}

- (id)nameForActionType:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 0x25 && ((0x1FFFFFFBFFuLL >> v3))
  {
    id v4 = off_1002D0B38[v3];
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"Unknown (%ld)", a3];
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHBottomBar;
  id v4 = a3;
  [(PHBottomBar *)&v11 traitCollectionDidChange:v4];
  id v5 = [v4 _backlightLuminance];

  id v6 = [(PHBottomBar *)self traitCollection];
  id v7 = [v6 _backlightLuminance];

  if (v5 != v7)
  {
    id v8 = [(PHBottomBar *)self traitCollection];
    id v9 = [v8 _backlightLuminance];

    [(PHBottomBar *)self setUserInteractionEnabled:v9 != (id)1];
    uint64_t v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v13 = v9 != (id)1;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting userInteractionEnabled of bottom bar to %d because of back light change", buf, 8u);
    }
  }
}

- (NSArray)buttonsForAmbientTransition
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = v3;
  if (self->_mainLeftButton) {
    [v3 addObject:];
  }
  if (self->_mainRightButton) {
    [v4 addObject:];
  }
  if (self->_supplementalTopLeftButton) {
    [v4 addObject:];
  }
  if (self->_supplementalTopRightButton) {
    [v4 addObject:];
  }
  if (self->_supplementalBottomLeftButton) {
    [v4 addObject:];
  }
  if (self->_supplementalBottomRightButton) {
    [v4 addObject:];
  }
  if (self->_sideButtonLeft) {
    [v4 addObject:];
  }
  if (self->_sideButtonRight) {
    [v4 addObject:];
  }
  id v5 = [v4 _cn_flatMap:&stru_1002D0B18];

  return (NSArray *)v5;
}

- (PHBottomBarDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHBottomBarDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)declineAndRemindIsAvailable
{
  return self->_declineAndRemindIsAvailable;
}

- (BOOL)declineAndMessageIsAvailable
{
  return self->_declineAndMessageIsAvailable;
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (void)setBlursBackground:(BOOL)a3
{
  self->_blursBackground = a3;
}

- (BOOL)usesLowerButtons
{
  return self->_usesLowerButtons;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)yOffsetForLoweredButtons
{
  return self->_yOffsetForLoweredButtons;
}

- (void)setYOffsetForLoweredButtons:(double)a3
{
  self->_yOffsetForLoweredButtons = a3;
}

- (void)setTopLayoutGuide:(id)a3
{
}

- (void)setMainButtonLayoutGuide:(id)a3
{
}

- (BOOL)isShowingButtonCountdown
{
  return self->_isShowingButtonCountdown;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (NSArray)buttonLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setButtonLayoutConstraints:(id)a3
{
}

- (NSArray)horizontalConstraintsForSupplementalButtons
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHorizontalConstraintsForSupplementalButtons:(id)a3
{
}

- (UIButton)supplementalTopLeftButton
{
  return self->_supplementalTopLeftButton;
}

- (void)setSupplementalTopLeftButton:(id)a3
{
}

- (UIButton)supplementalTopRightButton
{
  return self->_supplementalTopRightButton;
}

- (void)setSupplementalTopRightButton:(id)a3
{
}

- (UIButton)mainLeftButton
{
  return self->_mainLeftButton;
}

- (void)setMainLeftButton:(id)a3
{
}

- (UIButton)mainRightButton
{
  return self->_mainRightButton;
}

- (void)setMainRightButton:(id)a3
{
}

- (UIButton)sideButtonLeft
{
  return self->_sideButtonLeft;
}

- (void)setSideButtonLeft:(id)a3
{
}

- (UIButton)sideButtonRight
{
  return self->_sideButtonRight;
}

- (void)setSideButtonRight:(id)a3
{
}

- (UIButton)supplementalBottomRightButton
{
  return self->_supplementalBottomRightButton;
}

- (void)setSupplementalBottomRightButton:(id)a3
{
}

- (UIButton)supplementalBottomLeftButton
{
  return self->_supplementalBottomLeftButton;
}

- (void)setSupplementalBottomLeftButton:(id)a3
{
}

- (PHSlidingButton)slidingButton
{
  return self->_slidingButton;
}

- (void)setSlidingButton:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (NSMutableArray)pendingStateBlocks
{
  return self->_pendingStateBlocks;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
}

- (UINotificationFeedbackGenerator)alertFeedbackGenerator
{
  return self->_alertFeedbackGenerator;
}

- (void)setAlertFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_pendingStateBlocks, 0);
  objc_storeStrong((id *)&self->_slidingButton, 0);
  objc_storeStrong((id *)&self->_supplementalBottomLeftButton, 0);
  objc_storeStrong((id *)&self->_supplementalBottomRightButton, 0);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);
  objc_storeStrong((id *)&self->_sideButtonLeft, 0);
  objc_storeStrong((id *)&self->_mainRightButton, 0);
  objc_storeStrong((id *)&self->_mainLeftButton, 0);
  objc_storeStrong((id *)&self->_supplementalTopRightButton, 0);
  objc_storeStrong((id *)&self->_supplementalTopLeftButton, 0);
  objc_storeStrong((id *)&self->_horizontalConstraintsForSupplementalButtons, 0);
  objc_storeStrong((id *)&self->_buttonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_mainButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topLayoutGuide, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end