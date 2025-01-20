@interface HUDropInViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasAttemptedDropInSessionCall;
- (BOOL)hasAttemptedEndingDropInSessionCall;
- (BOOL)hasSessionStarted;
- (BOOL)prefersStatusBarHidden;
- (DIAudioPowerController)dropInAudioPowerController;
- (DIDropInCenter)dropInCenter;
- (DIDropInSession)activeDropInSession;
- (HMAccessory)currentAccessory;
- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber;
- (HMCameraProfile)nearbyCameraProfile;
- (HMHome)currentHome;
- (HUCameraLiveStreamViewController)liveStreamController;
- (HUDropInViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4;
- (HUHomeControlServiceContext)serviceContext;
- (HUIconView)iconView;
- (HULegibilityLabel)descriptionLabel;
- (HUWaveformView)audioWaveformView;
- (NSArray)eventBulletins;
- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToDescriptionTextView;
- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToSpinnerLabel;
- (NSLayoutConstraint)closeButtonTopConstraint;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)contentViewWidthConstraint;
- (NSLayoutConstraint)dismissLabelTopConstraint;
- (NSTimer)startSessionRequestTimer;
- (UIActivityIndicatorView)spinner;
- (UIBlurEffect)blurEffect;
- (UIButton)closeButton;
- (UIButton)doneButton;
- (UIButton)talkButton;
- (UIImageView)iconImageView;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILabel)dismissLabel;
- (UILabel)spinnerLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UITextView)descriptionTextView;
- (UIView)contentView;
- (UIView)liveCameraView;
- (UIVisualEffectView)closeButtonVisualEffectView;
- (UIVisualEffectView)dismissLabelVisualEffectView;
- (double)recordedDuration;
- (id)_contentViewBackgroundColor;
- (id)_recordButtonMicOffColor;
- (id)_recordButtonMicOnColor;
- (id)_waveformColor;
- (id)hu_preloadContent;
- (void)_cancelStartSessionRequestTimerIfNeeded;
- (void)_cleanUp;
- (void)_didPan:(id)a3;
- (void)_didTap:(id)a3;
- (void)_dismissDownRecordingView:(id)a3;
- (void)_dismissRecordingUIWithError:(id)a3;
- (void)_dismissUpRecordingView:(id)a3;
- (void)_endDropInSession;
- (void)_hideSpinner;
- (void)_launchDropInSessionIfNeeded;
- (void)_preloadContent:(id)a3;
- (void)_refreshHomeGraph:(id)a3;
- (void)_showSpinner;
- (void)_toggleMicrophone:(id)a3;
- (void)_updateRecordingUIWithConnectedState;
- (void)_updateRecordingUIWithDefaultState;
- (void)_updateRecordingUIWithMicrophoneOff;
- (void)_updateRecordingUIWithMicrophoneOn;
- (void)controller:(id)a3 didUpdateAudioPowerForDropInDevice:(float)a4;
- (void)dealloc;
- (void)device:(id)a3 didUpdateState:(int64_t)a4;
- (void)manager:(id)a3 didAddDevice:(id)a4;
- (void)manager:(id)a3 didUpdateActiveSession:(id)a4;
- (void)managerDidUpdateDevices:(id)a3;
- (void)serverDisconnectedForDropInCenter:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4;
- (void)setActiveDropInSession:(id)a3;
- (void)setAudioWaveformView:(id)a3;
- (void)setBlurEffect:(id)a3;
- (void)setCameraLiveStreamViewTopConstraintToDescriptionTextView:(id)a3;
- (void)setCameraLiveStreamViewTopConstraintToSpinnerLabel:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseButtonTopConstraint:(id)a3;
- (void)setCloseButtonVisualEffectView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setContentViewWidthConstraint:(id)a3;
- (void)setCurrentAccessory:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDismissLabel:(id)a3;
- (void)setDismissLabelTopConstraint:(id)a3;
- (void)setDismissLabelVisualEffectView:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setDropInAudioPowerController:(id)a3;
- (void)setDropInCenter:(id)a3;
- (void)setEventBulletins:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHasAttemptedDropInSessionCall:(BOOL)a3;
- (void)setHasAttemptedEndingDropInSessionCall:(BOOL)a3;
- (void)setHasSessionStarted:(BOOL)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setLastKnownEventSubscriber:(id)a3;
- (void)setLiveCameraView:(id)a3;
- (void)setLiveStreamController:(id)a3;
- (void)setNearbyCameraProfile:(id)a3;
- (void)setRecordedDuration:(double)a3;
- (void)setServiceContext:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerLabel:(id)a3;
- (void)setStartSessionRequestTimer:(id)a3;
- (void)setTalkButton:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)streamControllerStateDidUpdate:(id)a3;
- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUDropInViewController

- (HUDropInViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUDropInViewController;
  v8 = [(HUDropInViewController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F427D8] effectWithStyle:a4];
    blurEffect = v8->_blurEffect;
    v8->_blurEffect = (UIBlurEffect *)v9;

    objc_storeStrong((id *)&v8->_serviceContext, a3);
  }

  return v8;
}

- (void)viewDidLoad
{
  v378[1] = *MEMORY[0x1E4F143B8];
  v375.receiver = self;
  v375.super_class = (Class)HUDropInViewController;
  [(HUDropInViewController *)&v375 viewDidLoad];
  uint64_t v3 = [(HUDropInViewController *)self currentHome];
  if (!v3
    || (v4 = (void *)v3,
        [(HUDropInViewController *)self currentAccessory],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 87);
    [(HUDropInViewController *)self _dismissRecordingUIWithError:v6];
  }
  id v7 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42AA8]);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v7;

  uint64_t v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__didTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v9;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  v11 = [(HUDropInViewController *)self view];
  [v11 addGestureRecognizer:self->_tapGestureRecognizer];

  objc_super v12 = [(HUDropInViewController *)self view];
  [v12 setAlpha:0.0];

  v13 = (void *)MEMORY[0x1E4F42FE8];
  v14 = [(HUDropInViewController *)self blurEffect];
  v15 = [v13 effectForBlurEffect:v14 style:1];

  v16 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v15];
  dismissLabelVisualEffectView = self->_dismissLabelVisualEffectView;
  self->_dismissLabelVisualEffectView = v16;

  v18 = [(HUDropInViewController *)self view];
  objc_msgSend(v18, "naui_addAutoLayoutSubview:", self->_dismissLabelVisualEffectView);

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  dismissLabel = self->_dismissLabel;
  self->_dismissLabel = v19;

  uint64_t v368 = *MEMORY[0x1E4F43870];
  v21 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:");
  [(UILabel *)self->_dismissLabel setFont:v21];

  [(UILabel *)self->_dismissLabel setTextAlignment:1];
  v22 = self->_dismissLabel;
  v23 = _HULocalizedStringWithDefaultValue(@"HUDropInDismissLabel_Title", @"HUDropInDismissLabel_Title", 1);
  [(UILabel *)v22 setText:v23];

  v24 = self->_dismissLabel;
  v25 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v24 setTextColor:v25];

  [(UILabel *)self->_dismissLabel setAlpha:0.0];
  v26 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView contentView];
  objc_msgSend(v26, "naui_addAutoLayoutSubview:", self->_dismissLabel);

  v27 = [(UILabel *)self->_dismissLabel text];
  v28 = [(HUDropInViewController *)self view];
  [v28 bounds];
  double v30 = v29;
  uint64_t v377 = *MEMORY[0x1E4F42508];
  v31 = [(UILabel *)self->_dismissLabel font];
  v378[0] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v378 forKeys:&v377 count:1];
  objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 1, v32, 0, v30, 3.40282347e38);
  double v367 = v33;

  v34 = (void *)MEMORY[0x1E4F42FE8];
  v35 = [MEMORY[0x1E4F427D8] effectWithStyle:4];
  uint64_t v36 = [v34 effectForBlurEffect:v35 style:1];

  v371 = (void *)v36;
  v37 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v36];
  closeButtonVisualEffectView = self->_closeButtonVisualEffectView;
  self->_closeButtonVisualEffectView = v37;

  v39 = [(HUDropInViewController *)self view];
  objc_msgSend(v39, "naui_addAutoLayoutSubview:", self->_closeButtonVisualEffectView);

  v40 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  closeButton = self->_closeButton;
  self->_closeButton = v40;

  [(UIButton *)self->_closeButton addTarget:self action:sel__dismissDownRecordingView_ forControlEvents:64];
  v42 = self->_closeButton;
  v43 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_closeButtonImage");
  [(UIButton *)v42 setImage:v43 forState:0];

  v44 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView contentView];
  objc_msgSend(v44, "naui_addAutoLayoutSubview:", self->_closeButton);

  id v45 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v46 = *MEMORY[0x1E4F1DB28];
  double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v50 = (UIView *)objc_msgSend(v45, "initWithFrame:", *MEMORY[0x1E4F1DB28], v47, v48, v49);
  contentView = self->_contentView;
  self->_contentView = v50;

  v52 = self->_contentView;
  v53 = [(HUDropInViewController *)self _contentViewBackgroundColor];
  [(UIView *)v52 setBackgroundColor:v53];

  [(UIView *)self->_contentView _setContinuousCornerRadius:16.0];
  [(UIView *)self->_contentView setAlpha:0.0];
  v54 = [(HUDropInViewController *)self view];
  objc_msgSend(v54, "naui_addAutoLayoutSubview:", self->_contentView);

  v55 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v46, v47, v48, v49);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v55;

  [(UIImageView *)self->_iconImageView setContentMode:4];
  [(UIImageView *)self->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_iconImageView];
  v57 = (HUIconView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F6A428]), "initWithFrame:contentMode:", 1, v46, v47, v48, v49);
  iconView = self->_iconView;
  self->_iconView = v57;

  [(HUIconView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v59 = (void *)MEMORY[0x1E4F42A98];
  v60 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v376[0] = v60;
  v61 = [MEMORY[0x1E4F428B8] systemRedColor];
  v376[1] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v376 count:2];
  uint64_t v63 = [v59 configurationWithPaletteColors:v62];

  v64 = self->_iconView;
  v370 = (void *)v63;
  v65 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"waveform.badge.magnifyingglass.circle.fill" configuration:v63];
  [(HUIconView *)v64 updateWithIconDescriptor:v65 displayStyle:1 animated:0];

  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_iconView];
  v66 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v46, v47, v48, v49);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v66;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_titleLabel];
  v68 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:", v46, v47, v48, v49);
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v68;

  v70 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [(UITextView *)self->_descriptionTextView setTextColor:v70];

  [(UITextView *)self->_descriptionTextView setScrollEnabled:0];
  [(UITextView *)self->_descriptionTextView setEditable:0];
  v71 = [(UITextView *)self->_descriptionTextView textContainer];
  [v71 setLineFragmentPadding:0.0];

  double v72 = *MEMORY[0x1E4F437F8];
  double v73 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v75 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v74 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], v73, v75, v74);
  -[UITextView setContentInset:](self->_descriptionTextView, "setContentInset:", v72, v73, v75, v74);
  v76 = [MEMORY[0x1E4F428B8] clearColor];
  [(UITextView *)self->_descriptionTextView setBackgroundColor:v76];

  [(UITextView *)self->_descriptionTextView setDataDetectorTypes:2];
  [(UITextView *)self->_descriptionTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_descriptionTextView setAdjustsFontForContentSizeCategory:1];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_descriptionTextView];
  v77 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:v368 traits:32770];
  v78 = [(HUDropInViewController *)self titleLabel];
  [v78 setFont:v77];

  v79 = [(HUDropInViewController *)self titleLabel];
  [v79 setNumberOfLines:0];

  v80 = [(HUDropInViewController *)self titleLabel];
  [v80 sizeToFit];

  uint64_t v81 = *MEMORY[0x1E4F438C0];
  v82 = [MEMORY[0x1E4F6A420] preferredFontForTextStyle:*MEMORY[0x1E4F438C0] traits:0x8000];
  v83 = [(HUDropInViewController *)self descriptionTextView];
  [v83 setFont:v82];

  v84 = [(HUDropInViewController *)self descriptionTextView];
  v85 = [v84 textContainer];
  [v85 setMaximumNumberOfLines:0];

  v86 = [(HUDropInViewController *)self descriptionTextView];
  [v86 sizeToFit];

  v369 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__didPan_];
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:");
  v87 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v87;

  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_spinner];
  v89 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  spinnerLabel = self->_spinnerLabel;
  self->_spinnerLabel = v89;

  v91 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v81];
  [(UILabel *)self->_spinnerLabel setFont:v91];

  v92 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_spinnerLabel setTextColor:v92];

  [(UILabel *)self->_spinnerLabel setTextAlignment:1];
  [(UILabel *)self->_spinnerLabel setAlpha:0.0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_spinnerLabel];
  v93 = [HUWaveformView alloc];
  v94 = [(HUDropInViewController *)self _waveformColor];
  v95 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v96 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v93, "initWithFrame:waveformColor:backgroundColor:", v94, v95, v46, v47, v48, v49);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v96;

  [(HUWaveformView *)self->_audioWaveformView setAlpha:0.0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_audioWaveformView];
  v98 = [(HUDropInViewController *)self talkButton];
  [v98 setAlpha:0.0];

  v99 = [(HUDropInViewController *)self talkButton];
  [v99 setIsAccessibilityElement:1];

  v100 = [(HUDropInViewController *)self talkButton];
  [v100 addTarget:self action:sel__toggleMicrophone_ forControlEvents:64];

  v101 = self->_contentView;
  v102 = [(HUDropInViewController *)self talkButton];
  [(UIView *)v101 naui_addAutoLayoutSubview:v102];

  v103 = [(HUDropInViewController *)self doneButton];
  [v103 setAlpha:0.0];

  v104 = [(HUDropInViewController *)self doneButton];
  [v104 setIsAccessibilityElement:1];

  v105 = [(HUDropInViewController *)self doneButton];
  [v105 addTarget:self action:sel__toggleMicrophone_ forControlEvents:64];

  v106 = self->_contentView;
  v107 = [(HUDropInViewController *)self doneButton];
  [(UIView *)v106 naui_addAutoLayoutSubview:v107];

  v108 = [(HUDropInViewController *)self nearbyCameraProfile];

  if (v108)
  {
    v109 = [(HUDropInViewController *)self liveStreamController];
    v110 = [v109 view];
    liveCameraView = self->_liveCameraView;
    self->_liveCameraView = v110;

    [(UIView *)self->_liveCameraView _setContinuousCornerRadius:14.0];
    [(UIView *)self->_liveCameraView setClipsToBounds:1];
    [(UIView *)self->_liveCameraView setAlpha:0.0];
    [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_liveCameraView];
    v112 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:0];
    v113 = [(HUDropInViewController *)self nearbyCameraProfile];
    v114 = [v113 streamControl];
    v115 = 0;
    if ([v114 streamState] == 2)
    {
      v115 = _HULocalizedStringWithDefaultValue(@"HUCameraLive", @"HUCameraLive", 1);
    }

    v116 = (void *)MEMORY[0x1E4F42A30];
    [MEMORY[0x1E4F42A30] systemFontSize];
    v117 = objc_msgSend(v116, "monospacedDigitSystemFontOfSize:weight:");
    v118 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F438C8]];
    v119 = [v118 scaledFontForFont:v117];

    v120 = [HULegibilityLabel alloc];
    v121 = [(HULegibilityLabel *)v120 initWithSettings:v112 strength:v115 text:v119 font:*MEMORY[0x1E4F440F8] options:*MEMORY[0x1E4F440D8]];
    descriptionLabel = self->_descriptionLabel;
    self->_descriptionLabel = v121;

    [(HULegibilityLabel *)self->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
    [(HULegibilityLabel *)self->_descriptionLabel setTextAlignment:4];
    [(HULegibilityLabel *)self->_descriptionLabel setLineBreakMode:4];
    [(HULegibilityLabel *)self->_descriptionLabel setUserInteractionEnabled:0];
    [(HULegibilityLabel *)self->_descriptionLabel setAlpha:0.0];
    [(HULegibilityLabel *)self->_descriptionLabel setMaximumContentSizeCategory:*MEMORY[0x1E4F43790]];
    LODWORD(v123) = 1144766464;
    [(HULegibilityLabel *)self->_descriptionLabel setContentCompressionResistancePriority:0 forAxis:v123];
    LODWORD(v124) = 1132134400;
    [(HULegibilityLabel *)self->_descriptionLabel setContentHuggingPriority:0 forAxis:v124];
    [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_descriptionLabel];
  }
  v125 = objc_opt_new();
  v126 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v127 = [v126 userInterfaceIdiom];

  v128 = self->_dismissLabelVisualEffectView;
  if ((v127 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v129 = [(UIVisualEffectView *)v128 centerXAnchor];
    v130 = [(UIView *)self->_contentView centerXAnchor];
    v131 = [v129 constraintEqualToAnchor:v130];
    [v125 addObject:v131];
  }
  else
  {
    v129 = [(UIVisualEffectView *)v128 leadingAnchor];
    v130 = [(HUDropInViewController *)self view];
    v131 = [v130 safeAreaLayoutGuide];
    v132 = [v131 leadingAnchor];
    v133 = [v129 constraintEqualToAnchor:v132];
    [v125 addObject:v133];
  }
  v134 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView trailingAnchor];
  v135 = [(HUDropInViewController *)self view];
  v136 = [v135 safeAreaLayoutGuide];
  v137 = [v136 trailingAnchor];
  v138 = [v134 constraintEqualToAnchor:v137];
  [v125 addObject:v138];

  v139 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView topAnchor];
  v140 = [(HUDropInViewController *)self view];
  v141 = [v140 safeAreaLayoutGuide];
  v142 = [v141 topAnchor];
  v143 = [v139 constraintEqualToAnchor:v142 constant:-25.0];
  dismissLabelTopConstraint = self->_dismissLabelTopConstraint;
  self->_dismissLabelTopConstraint = v143;

  [v125 addObject:self->_dismissLabelTopConstraint];
  v145 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView heightAnchor];
  v146 = [v145 constraintEqualToConstant:v367];
  [v125 addObject:v146];

  v147 = [(UILabel *)self->_dismissLabel leadingAnchor];
  v148 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView leadingAnchor];
  v149 = [v147 constraintEqualToAnchor:v148];
  [v125 addObject:v149];

  v150 = [(UILabel *)self->_dismissLabel trailingAnchor];
  v151 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView trailingAnchor];
  v152 = [v150 constraintEqualToAnchor:v151];
  [v125 addObject:v152];

  v153 = [(UILabel *)self->_dismissLabel topAnchor];
  v154 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView topAnchor];
  v155 = [v153 constraintEqualToAnchor:v154];
  [v125 addObject:v155];

  v156 = [(UILabel *)self->_dismissLabel heightAnchor];
  v157 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView heightAnchor];
  v158 = [v156 constraintEqualToAnchor:v157];
  [v125 addObject:v158];

  v159 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView topAnchor];
  v160 = [(HUDropInViewController *)self view];
  v161 = [v160 topAnchor];
  v162 = [v159 constraintEqualToAnchor:v161 constant:30.0];
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v162;

  [v125 addObject:self->_closeButtonTopConstraint];
  v164 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView trailingAnchor];
  v165 = [(HUDropInViewController *)self view];
  v166 = [v165 safeAreaLayoutGuide];
  v167 = [v166 trailingAnchor];
  v168 = [v164 constraintEqualToAnchor:v167 constant:-16.0];
  [v125 addObject:v168];

  v169 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v170 = [v169 constraintEqualToConstant:30.0];
  [v125 addObject:v170];

  v171 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView widthAnchor];
  v172 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v173 = [v171 constraintEqualToAnchor:v172];
  [v125 addObject:v173];

  v174 = [(UIButton *)self->_closeButton topAnchor];
  v175 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView topAnchor];
  v176 = [v174 constraintEqualToAnchor:v175];
  [v125 addObject:v176];

  v177 = [(UIButton *)self->_closeButton trailingAnchor];
  v178 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView trailingAnchor];
  v179 = [v177 constraintEqualToAnchor:v178];
  [v125 addObject:v179];

  v180 = [(UIButton *)self->_closeButton heightAnchor];
  v181 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v182 = [v180 constraintEqualToAnchor:v181];
  [v125 addObject:v182];

  v183 = [(UIButton *)self->_closeButton widthAnchor];
  v184 = [(UIButton *)self->_closeButton heightAnchor];
  v185 = [v183 constraintEqualToAnchor:v184];
  [v125 addObject:v185];

  v186 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v187 = [v186 userInterfaceIdiom];

  unint64_t v188 = v187 & 0xFFFFFFFFFFFFFFFBLL;
  v189 = [(UIView *)self->_contentView topAnchor];
  if (v188 == 1)
  {
    v190 = [(HUDropInViewController *)self view];
    v191 = [v190 topAnchor];
    v192 = [v189 constraintEqualToAnchor:v191 constant:30.0];
    contentViewTopConstraint = self->_contentViewTopConstraint;
    self->_contentViewTopConstraint = v192;

    [v125 addObject:self->_contentViewTopConstraint];
    v194 = [(UIView *)self->_contentView trailingAnchor];
    v195 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView leadingAnchor];
    v196 = [v194 constraintEqualToAnchor:v195 constant:-8.0];
    [v125 addObject:v196];
  }
  else
  {
    v197 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView bottomAnchor];
    v198 = [v189 constraintEqualToAnchor:v197 constant:8.0];
    [v125 addObject:v198];

    v194 = [(UIView *)self->_contentView trailingAnchor];
    v195 = [(HUDropInViewController *)self view];
    v196 = [v195 safeAreaLayoutGuide];
    v199 = [v196 trailingAnchor];
    v200 = [v194 constraintEqualToAnchor:v199 constant:-10.0];
    [v125 addObject:v200];
  }
  v201 = [(UIView *)self->_contentView widthAnchor];
  v202 = [v201 constraintEqualToConstant:100.0];
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v202;

  [v125 addObject:self->_contentViewWidthConstraint];
  v204 = [(UIView *)self->_contentView heightAnchor];
  double v205 = 0.0;
  v206 = [v204 constraintEqualToConstant:0.0];
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v206;

  [v125 addObject:self->_contentViewHeightConstraint];
  v208 = [(HUDropInViewController *)self view];
  [v208 frame];
  unint64_t v211 = HUViewSizeSubclassForViewSize(v209, v210);

  if (v211 > 0xA) {
    uint64_t v212 = 1;
  }
  else {
    uint64_t v212 = qword_1BEA1A518[v211];
  }
  v213 = +[HUGridBannerCellLayoutOptions defaultOptionsForCellSizeSubclass:v212];
  v214 = [(HUDropInViewController *)self iconView];
  v215 = [v214 leadingAnchor];
  v216 = [(UIView *)self->_contentView leadingAnchor];
  [v213 leadingInset];
  v217 = objc_msgSend(v215, "constraintEqualToAnchor:constant:", v216);
  [v125 addObject:v217];

  v218 = [(HUDropInViewController *)self iconImageView];
  v219 = [v218 leadingAnchor];
  v220 = [(HUDropInViewController *)self iconView];
  v221 = [v220 leadingAnchor];
  v222 = [v219 constraintEqualToAnchor:v221];
  [v125 addObject:v222];

  v223 = [(HUDropInViewController *)self iconView];
  v224 = [v223 topAnchor];
  v225 = [(UIView *)self->_contentView topAnchor];
  [v213 titleTopInset];
  v226 = objc_msgSend(v224, "constraintEqualToAnchor:constant:", v225);
  [v125 addObject:v226];

  v227 = [(HUDropInViewController *)self iconImageView];
  v228 = [v227 topAnchor];
  v229 = [(HUDropInViewController *)self iconView];
  v230 = [v229 topAnchor];
  v231 = [v228 constraintEqualToAnchor:v230];
  [v125 addObject:v231];

  v232 = [(HUDropInViewController *)self iconView];
  v233 = [v232 heightAnchor];
  [v213 iconHeight];
  v234 = objc_msgSend(v233, "constraintEqualToConstant:");
  [v125 addObject:v234];

  v235 = [(HUDropInViewController *)self iconImageView];
  v236 = [v235 heightAnchor];
  v237 = [(HUDropInViewController *)self iconImageView];
  v238 = [v237 image];
  if (v238)
  {
    [v213 iconHeight];
    double v205 = v239;
  }
  v240 = [v236 constraintEqualToConstant:v205];
  [v125 addObject:v240];

  v241 = [(HUDropInViewController *)self iconView];
  v242 = [v241 widthAnchor];
  v243 = [(HUDropInViewController *)self iconView];
  v244 = [v243 heightAnchor];
  v245 = [v242 constraintEqualToAnchor:v244];
  [v125 addObject:v245];

  v246 = [(HUDropInViewController *)self iconImageView];
  v247 = [v246 widthAnchor];
  v248 = [(HUDropInViewController *)self iconImageView];
  v249 = [v248 heightAnchor];
  v250 = [v247 constraintEqualToAnchor:v249];
  [v125 addObject:v250];

  v251 = [(HUDropInViewController *)self traitCollection];
  v252 = [v251 preferredContentSizeCategory];
  unint64_t v253 = *MEMORY[0x1E4F43770];

  v254 = [(HUDropInViewController *)self titleLabel];
  v255 = [v254 topAnchor];
  if ((unint64_t)v252 >= v253)
  {
    v263 = [(HUDropInViewController *)self iconView];
    v264 = [v263 bottomAnchor];
    [v213 verticalSpacingForLipElements];
    v265 = objc_msgSend(v255, "constraintEqualToAnchor:constant:", v264);
    [v125 addObject:v265];

    v258 = [(HUDropInViewController *)self titleLabel];
    v259 = [v258 leadingAnchor];
    v260 = [(UIView *)self->_contentView leadingAnchor];
    [v213 leadingInset];
    v261 = objc_msgSend(v259, "constraintEqualToAnchor:constant:", v260);
    [v125 addObject:v261];
  }
  else
  {
    v256 = [(UIView *)self->_contentView topAnchor];
    [v213 titleTopInset];
    v257 = objc_msgSend(v255, "constraintEqualToAnchor:constant:", v256);
    [v125 addObject:v257];

    v258 = [(HUDropInViewController *)self titleLabel];
    v259 = [v258 leadingAnchor];
    v260 = [(HUDropInViewController *)self iconView];
    v261 = [v260 trailingAnchor];
    [v213 horizontalItemSpacing];
    v262 = objc_msgSend(v259, "constraintEqualToAnchor:constant:", v261);
    [v125 addObject:v262];
  }
  v266 = [(HUDropInViewController *)self titleLabel];
  v267 = [v266 trailingAnchor];
  v268 = [(UIView *)self->_contentView trailingAnchor];
  [v213 trailingInset];
  v270 = [v267 constraintEqualToAnchor:v268 constant:-v269];
  [v125 addObject:v270];

  v271 = [(HUDropInViewController *)self descriptionTextView];
  v272 = [v271 topAnchor];
  v273 = [(HUDropInViewController *)self titleLabel];
  v274 = [v273 bottomAnchor];
  [v213 verticalLabelSpacing];
  v275 = objc_msgSend(v272, "constraintEqualToAnchor:constant:", v274);
  [v125 addObject:v275];

  v276 = [(HUDropInViewController *)self traitCollection];
  v277 = [v276 preferredContentSizeCategory];

  v278 = [(HUDropInViewController *)self descriptionTextView];
  v279 = [v278 leadingAnchor];
  if ((unint64_t)v277 >= v253)
  {
    v280 = [(UIView *)self->_contentView leadingAnchor];
    [v213 leadingInset];
    v281 = objc_msgSend(v279, "constraintEqualToAnchor:constant:", v280);
    [v125 addObject:v281];
  }
  else
  {
    v280 = [(HUDropInViewController *)self iconView];
    v281 = [v280 trailingAnchor];
    [v213 horizontalItemSpacing];
    v282 = objc_msgSend(v279, "constraintEqualToAnchor:constant:", v281);
    [v125 addObject:v282];
  }
  v283 = [(HUDropInViewController *)self descriptionTextView];
  v284 = [v283 trailingAnchor];
  v285 = [(UIView *)self->_contentView trailingAnchor];
  [v213 trailingInset];
  v287 = [v284 constraintEqualToAnchor:v285 constant:-v286];
  [v125 addObject:v287];

  v288 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v289 = [(UIView *)self->_contentView centerYAnchor];
  v290 = [v288 constraintEqualToAnchor:v289];
  [v125 addObject:v290];

  v291 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v292 = [(UIView *)self->_contentView centerXAnchor];
  v293 = [v291 constraintEqualToAnchor:v292];
  [v125 addObject:v293];

  v294 = [(UILabel *)self->_spinnerLabel leadingAnchor];
  v295 = [(UIView *)self->_contentView leadingAnchor];
  v296 = [v294 constraintEqualToAnchor:v295];
  [v125 addObject:v296];

  v297 = [(UILabel *)self->_spinnerLabel trailingAnchor];
  v298 = [(UIView *)self->_contentView trailingAnchor];
  v299 = [v297 constraintEqualToAnchor:v298];
  [v125 addObject:v299];

  v300 = [(UILabel *)self->_spinnerLabel topAnchor];
  v301 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v302 = [v300 constraintEqualToAnchor:v301 constant:24.0];
  [v125 addObject:v302];

  v303 = [(UILabel *)self->_spinnerLabel centerXAnchor];
  v304 = [(UIView *)self->_contentView centerXAnchor];
  v305 = [v303 constraintEqualToAnchor:v304];
  [v125 addObject:v305];

  v306 = [(HUDropInViewController *)self nearbyCameraProfile];

  if (v306)
  {
    v307 = [(UIView *)self->_liveCameraView centerXAnchor];
    v308 = [(UIView *)self->_contentView centerXAnchor];
    v309 = [v307 constraintEqualToAnchor:v308];
    [v125 addObject:v309];

    v310 = [(HUDropInViewController *)self liveCameraView];
    v311 = [v310 topAnchor];
    v312 = [(UILabel *)self->_spinnerLabel bottomAnchor];
    v313 = [v311 constraintEqualToAnchor:v312 constant:20.0];
    [(HUDropInViewController *)self setCameraLiveStreamViewTopConstraintToSpinnerLabel:v313];

    v314 = [(HUDropInViewController *)self liveCameraView];
    v315 = [v314 topAnchor];
    v316 = [(UITextView *)self->_descriptionTextView bottomAnchor];
    v317 = [v315 constraintEqualToAnchor:v316 constant:20.0];
    [(HUDropInViewController *)self setCameraLiveStreamViewTopConstraintToDescriptionTextView:v317];

    v318 = [(UIView *)self->_liveCameraView widthAnchor];
    v319 = [(UIView *)self->_contentView widthAnchor];
    v320 = [v318 constraintEqualToAnchor:v319 multiplier:0.85];
    [v125 addObject:v320];

    v321 = [(UIView *)self->_liveCameraView heightAnchor];
    v322 = [(UIView *)self->_liveCameraView widthAnchor];
    v323 = [v321 constraintEqualToAnchor:v322 multiplier:0.5625];
    [v125 addObject:v323];

    v324 = [(HUWaveformView *)self->_audioWaveformView topAnchor];
    v325 = [(UIView *)self->_liveCameraView bottomAnchor];
    v326 = [v324 constraintEqualToAnchor:v325 constant:20.0];
    [v125 addObject:v326];

    v327 = [(HULegibilityLabel *)self->_descriptionLabel bottomAnchor];
    v328 = [(UIView *)self->_liveCameraView bottomAnchor];
    v329 = [v327 constraintEqualToAnchor:v328 constant:-10.0];
    [v125 addObject:v329];

    v330 = [(HULegibilityLabel *)self->_descriptionLabel leadingAnchor];
    v331 = [(UIView *)self->_liveCameraView leadingAnchor];
    v332 = [v330 constraintEqualToAnchor:v331 constant:10.0];
    [v125 addObject:v332];

    v333 = [(HULegibilityLabel *)self->_descriptionLabel trailingAnchor];
    v334 = [(UIView *)self->_liveCameraView trailingAnchor];
    [v333 constraintLessThanOrEqualToAnchor:v334 constant:-10.0];
  }
  else
  {
    v333 = [(HUWaveformView *)self->_audioWaveformView centerYAnchor];
    v334 = [(UIView *)self->_contentView centerYAnchor];
    [v333 constraintEqualToAnchor:v334];
  v335 = };
  [v125 addObject:v335];

  v336 = [(HUWaveformView *)self->_audioWaveformView leadingAnchor];
  v337 = [(UIView *)self->_contentView leadingAnchor];
  v338 = [v336 constraintEqualToAnchor:v337];
  [v125 addObject:v338];

  v339 = [(HUWaveformView *)self->_audioWaveformView trailingAnchor];
  v340 = [(UIView *)self->_contentView trailingAnchor];
  v341 = [v339 constraintEqualToAnchor:v340];
  [v125 addObject:v341];

  v342 = [(HUWaveformView *)self->_audioWaveformView heightAnchor];
  v343 = [v342 constraintEqualToConstant:70.0];
  [v125 addObject:v343];

  v344 = [(UIButton *)self->_talkButton heightAnchor];
  v345 = [v344 constraintEqualToConstant:44.0];
  [v125 addObject:v345];

  v346 = [(UIButton *)self->_talkButton widthAnchor];
  v347 = [v346 constraintLessThanOrEqualToConstant:355.0];
  [v125 addObject:v347];

  v348 = [(UIButton *)self->_talkButton centerXAnchor];
  v349 = [(UIView *)self->_contentView centerXAnchor];
  v350 = [v348 constraintEqualToAnchor:v349];
  [v125 addObject:v350];

  v351 = [(UIButton *)self->_talkButton bottomAnchor];
  v352 = [(UIView *)self->_contentView bottomAnchor];
  v353 = [v351 constraintEqualToAnchor:v352 constant:-45.0];
  [v125 addObject:v353];

  v354 = [(UIButton *)self->_doneButton heightAnchor];
  v355 = [v354 constraintEqualToConstant:44.0];
  [v125 addObject:v355];

  v356 = [(UIButton *)self->_doneButton widthAnchor];
  v357 = [v356 constraintLessThanOrEqualToConstant:355.0];
  [v125 addObject:v357];

  v358 = [(UIButton *)self->_doneButton centerXAnchor];
  v359 = [(UIView *)self->_contentView centerXAnchor];
  v360 = [v358 constraintEqualToAnchor:v359];
  [v125 addObject:v360];

  v361 = [(UIButton *)self->_doneButton bottomAnchor];
  v362 = [(UIView *)self->_contentView bottomAnchor];
  v363 = [v361 constraintEqualToAnchor:v362 constant:-45.0];
  [v125 addObject:v363];

  [MEMORY[0x1E4F28DC8] activateConstraints:v125];
  v364 = [(HUDropInViewController *)self view];
  [v364 layoutIfNeeded];

  v365 = [(HUDropInViewController *)self titleLabel];
  [v365 becomeFirstResponder];

  v366 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v366 addAccessoryObserver:self];

  v374[0] = MEMORY[0x1E4F143A8];
  v374[1] = 3221225472;
  v374[2] = __37__HUDropInViewController_viewDidLoad__block_invoke;
  v374[3] = &unk_1E6386018;
  v374[4] = self;
  v373[0] = MEMORY[0x1E4F143A8];
  v373[1] = 3221225472;
  v373[2] = __37__HUDropInViewController_viewDidLoad__block_invoke_3;
  v373[3] = &unk_1E638F8A0;
  v373[4] = self;
  v373[5] = a2;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v374 animations:v373 completion:0.5];
}

uint64_t __37__HUDropInViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HUDropInViewController_viewDidLoad__block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __37__HUDropInViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentViewHeightConstraint];
  [v2 setConstant:500.0];

  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  CAFrameRateRange v5 = *(void **)(a1 + 32);
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v6 = [v5 contentViewWidthConstraint];
    [v6 setConstant:395.0];
  }
  else
  {
    v6 = [v5 view];
    [v6 bounds];
    double v8 = v7 + -20.0;
    uint64_t v9 = [*(id *)(a1 + 32) contentViewWidthConstraint];
    [v9 setConstant:v8];
  }
  v10 = [*(id *)(a1 + 32) contentView];
  [v10 setAlpha:1.0];

  v11 = [*(id *)(a1 + 32) view];
  [v11 setAlpha:1.0];

  objc_super v12 = [*(id *)(a1 + 32) spinnerLabel];
  [v12 setAlpha:1.0];

  v13 = [*(id *)(a1 + 32) talkButton];
  [v13 setAlpha:0.0];

  v14 = [*(id *)(a1 + 32) doneButton];
  [v14 setAlpha:0.0];

  v15 = [*(id *)(a1 + 32) audioWaveformView];
  [v15 setAlpha:0.0];

  v16 = [*(id *)(a1 + 32) liveCameraView];
  [v16 setAlpha:0.0];

  v17 = [*(id *)(a1 + 32) descriptionLabel];
  [v17 setAlpha:0.0];

  [*(id *)(a1 + 32) _showSpinner];
  v18 = [*(id *)(a1 + 32) titleLabel];
  v19 = _HULocalizedStringWithDefaultValue(@"HUDropInBanner_Title_String", @"HUDropInBanner_Title_String", 1);
  [v18 setText:v19];

  v20 = [*(id *)(a1 + 32) spinnerLabel];
  v21 = _HULocalizedStringWithDefaultValue(@"HUDropIn_Label_Connecting_State", @"HUDropIn_Label_Connecting_State", 1);
  [v20 setText:v21];

  v22 = [*(id *)(a1 + 32) currentAccessory];
  v23 = objc_msgSend(v22, "hf_serviceNameComponents");
  v24 = [v23 composedString];
  v31 = HULocalizedStringWithFormat(@"HUDropInBanner_Title_FormatString", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
  v32 = [*(id *)(a1 + 32) descriptionTextView];
  [v32 setText:v31];

  id v33 = [*(id *)(a1 + 32) view];
  [v33 layoutIfNeeded];
}

void __37__HUDropInViewController_viewDidLoad__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      CAFrameRateRange v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = [*(id *)(a1 + 32) dropInCenter];
      double v7 = [v6 deviceManager];
      double v8 = [v7 devices];
      int v9 = 138412802;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      objc_super v12 = v5;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUDropInViewController;
  [(HUDropInViewController *)&v7 viewWillDisappear:a3];
  CAFrameRateRange v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [(HUDropInViewController *)self _endDropInSession];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    double v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  if (![(HUDropInViewController *)self hasAttemptedEndingDropInSessionCall]) {
    [(HUDropInViewController *)self _endDropInSession];
  }
  v6.receiver = self;
  v6.super_class = (Class)HUDropInViewController;
  [(HUDropInViewController *)&v6 dealloc];
}

- (void)_endDropInSession
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  objc_super v6 = [(HUDropInViewController *)self dropInCenter];
  objc_super v7 = [v6 deviceManager];
  double v8 = [v7 devices];

  __int16 v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", buf, 0x20u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__HUDropInViewController__endDropInSession__block_invoke;
  v22[3] = &unk_1E638F8C8;
  v22[4] = self;
  uint64_t v11 = objc_msgSend(v8, "na_firstObjectPassingTest:", v22);
  [v11 setDelegate:0];
  if (!v11)
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "No dropin device found in HomeKit", buf, 2u);
    }
  }
  __int16 v13 = [(HUDropInViewController *)self dropInCenter];
  v14 = [v13 sessionManager];
  uint64_t v15 = [v14 activeSession];

  v16 = HFLogForCategory();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E4F5FA00], "stringForDropInSessionState:", objc_msgSend(v15, "state"));
      v18 = (HUDropInViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Current dropin session state: %@", buf, 0xCu);
    }
    [(HUDropInViewController *)self setHasAttemptedEndingDropInSessionCall:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__HUDropInViewController__endDropInSession__block_invoke_66;
    v19[3] = &unk_1E6385A20;
    id v20 = v15;
    v21 = self;
    [v20 endWithCompletionHandler:v19];
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "No active dropin session. Cannot end session", buf, 2u);
    }

    [(HUDropInViewController *)self _cleanUp];
  }
}

uint64_t __43__HUDropInViewController__endDropInSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 homeKitIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) currentAccessory];
  CAFrameRateRange v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __43__HUDropInViewController__endDropInSession__block_invoke_66(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  CAFrameRateRange v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Failed to end dropin session with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Successfully ended dropin session", (uint8_t *)&v6, 2u);
  }

  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 40) _cleanUp];
}

- (void)_cleanUp
{
  [(HUDropInViewController *)self _cancelStartSessionRequestTimerIfNeeded];
  id v3 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v4 = [v3 deviceManager];
  [v4 setDelegate:0];

  CAFrameRateRange v5 = [(HUDropInViewController *)self dropInCenter];
  int v6 = [v5 sessionManager];
  [v6 setDelegate:0];

  id v7 = [(HUDropInViewController *)self dropInAudioPowerController];
  [v7 setDelegate:0];

  uint64_t v8 = [(HUDropInViewController *)self lastKnownEventSubscriber];
  [v8 setDelegate:0];

  __int16 v9 = [(HUDropInViewController *)self liveStreamController];
  [v9 setLiveStreamControllerDelegate:0];

  [(HUDropInViewController *)self setLiveStreamController:0];
  [(HUDropInViewController *)self setLastKnownEventSubscriber:0];
  [(HUDropInViewController *)self setDropInAudioPowerController:0];
  __int16 v10 = [(HUDropInViewController *)self audioWaveformView];
  [v10 clearPowerLevels];

  [(HUDropInViewController *)self setAudioWaveformView:0];
  [(HUDropInViewController *)self setDropInCenter:0];

  [(HUDropInViewController *)self setActiveDropInSession:0];
}

- (void)_cancelStartSessionRequestTimerIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUDropInViewController *)self startSessionRequestTimer];

  if (v3)
  {
    uint64_t v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CAFrameRateRange v5 = [(HUDropInViewController *)self startSessionRequestTimer];
      int v7 = 138412546;
      uint64_t v8 = self;
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Cancelling start session request timer %@", (uint8_t *)&v7, 0x16u);
    }
    int v6 = [(HUDropInViewController *)self startSessionRequestTimer];
    [v6 invalidate];

    [(HUDropInViewController *)self setStartSessionRequestTimer:0];
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [(HUDropInViewController *)self contentView];
  CAFrameRateRange v5 = [(HUDropInViewController *)self _contentViewBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v7 = [(HUDropInViewController *)self audioWaveformView];
  int v6 = [(HUDropInViewController *)self _waveformColor];
  [v7 setWaveformColor:v6];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUDropInViewController;
  -[HUDropInViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  CAFrameRateRange v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v7 = [(HUDropInViewController *)self contentViewWidthConstraint];
    [v7 setConstant:395.0];
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_showSpinner
{
  id v3 = [(HUDropInViewController *)self spinnerLabel];
  [v3 setHidden:0];

  uint64_t v4 = [(HUDropInViewController *)self spinner];
  [v4 setHidden:0];

  CAFrameRateRange v5 = [(HUDropInViewController *)self spinner];
  [v5 startAnimating];

  uint64_t v6 = [(HUDropInViewController *)self cameraLiveStreamViewTopConstraintToDescriptionTextView];
  [v6 setActive:0];

  id v7 = [(HUDropInViewController *)self cameraLiveStreamViewTopConstraintToSpinnerLabel];
  [v7 setActive:1];

  id v8 = [(HUDropInViewController *)self contentView];
  [v8 setNeedsLayout];
}

- (void)_hideSpinner
{
  id v3 = [(HUDropInViewController *)self spinnerLabel];
  [v3 setHidden:1];

  uint64_t v4 = [(HUDropInViewController *)self spinner];
  [v4 setHidden:1];

  CAFrameRateRange v5 = [(HUDropInViewController *)self spinner];
  [v5 stopAnimating];

  uint64_t v6 = [(HUDropInViewController *)self cameraLiveStreamViewTopConstraintToSpinnerLabel];
  [v6 setActive:0];

  id v7 = [(HUDropInViewController *)self cameraLiveStreamViewTopConstraintToDescriptionTextView];
  [v7 setActive:1];

  id v8 = [(HUDropInViewController *)self contentView];
  [v8 setNeedsLayout];
}

- (void)_toggleMicrophone:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CAFrameRateRange v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector(a2);
    int v14 = 138412546;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v14, 0x16u);
  }
  id v7 = [(HUDropInViewController *)self dropInCenter];
  id v8 = [v7 sessionManager];
  __int16 v9 = [v8 activeSession];
  uint64_t v10 = [v9 isUplinkMuted] ^ 1;
  uint64_t v11 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v12 = [v11 sessionManager];
  __int16 v13 = [v12 activeSession];
  [v13 setUplinkMuted:v10];
}

- (void)_updateRecordingUIWithDefaultState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    int v13 = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v13, 0x16u);
  }
  [(HUDropInViewController *)self _showSpinner];
  uint64_t v6 = [(HUDropInViewController *)self talkButton];
  [v6 setAlpha:0.0];

  id v7 = [(HUDropInViewController *)self doneButton];
  [v7 setAlpha:0.0];

  id v8 = [(HUDropInViewController *)self audioWaveformView];
  [v8 clearPowerLevels];

  __int16 v9 = [(HUDropInViewController *)self audioWaveformView];
  [v9 setAlpha:0.0];

  uint64_t v10 = [(HUDropInViewController *)self liveCameraView];
  [v10 setAlpha:0.0];

  uint64_t v11 = [(HUDropInViewController *)self descriptionLabel];
  [v11 setAlpha:0.0];

  uint64_t v12 = [(HUDropInViewController *)self view];
  [v12 layoutIfNeeded];
}

- (void)_updateRecordingUIWithConnectedState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [(HUDropInViewController *)self _hideSpinner];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HUDropInViewController__updateRecordingUIWithConnectedState__block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.25];
}

void __62__HUDropInViewController__updateRecordingUIWithConnectedState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) talkButton];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) doneButton];
  [v3 setAlpha:0.0];

  uint64_t v4 = [*(id *)(a1 + 32) audioWaveformView];
  [v4 setAlpha:1.0];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) liveCameraView];
  [v5 setAlpha:0.0];

  uint64_t v6 = [*(id *)(a1 + 32) descriptionLabel];
  [v6 setAlpha:0.0];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

- (void)_updateRecordingUIWithMicrophoneOn
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [(HUDropInViewController *)self _hideSpinner];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HUDropInViewController__updateRecordingUIWithMicrophoneOn__block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.25];
}

void __60__HUDropInViewController__updateRecordingUIWithMicrophoneOn__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) talkButton];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) doneButton];
  [v3 setAlpha:1.0];

  uint64_t v4 = [*(id *)(a1 + 32) audioWaveformView];
  [v4 setAlpha:1.0];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) liveCameraView];
  [v5 setAlpha:1.0];

  uint64_t v6 = [*(id *)(a1 + 32) descriptionLabel];
  [v6 setAlpha:1.0];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

- (void)_updateRecordingUIWithMicrophoneOff
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CAFrameRateRange v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  [(HUDropInViewController *)self _hideSpinner];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HUDropInViewController__updateRecordingUIWithMicrophoneOff__block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.25];
}

void __61__HUDropInViewController__updateRecordingUIWithMicrophoneOff__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) talkButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) doneButton];
  [v3 setAlpha:0.0];

  uint64_t v4 = [*(id *)(a1 + 32) audioWaveformView];
  [v4 setAlpha:1.0];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) liveCameraView];
  [v5 setAlpha:1.0];

  uint64_t v6 = [*(id *)(a1 + 32) descriptionLabel];
  [v6 setAlpha:1.0];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

- (void)_dismissRecordingUIWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Dismissing UI due to error: %@", buf, 0x20u);
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __55__HUDropInViewController__dismissRecordingUIWithError___block_invoke;
  int v13 = &unk_1E63865B8;
  int v14 = self;
  id v15 = v5;
  id v8 = v5;
  __int16 v9 = _Block_copy(&v10);
  -[HUDropInViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:", v9, v10, v11, v12, v13, v14);
}

void __55__HUDropInViewController__dismissRecordingUIWithError___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (([*(id *)(a1 + 32) hasAttemptedEndingDropInSessionCall] & 1) == 0)
    {
      id v3 = [*(id *)(a1 + 32) currentAccessory];
      uint64_t v4 = objc_msgSend(v3, "hf_serviceNameComponents");
      id v5 = [v4 composedString];

      uint64_t v6 = [*(id *)(a1 + 32) serviceContext];
      id v7 = [v6 actions];
      id v8 = [v7 anyObject];

      id v9 = objc_alloc(MEMORY[0x1E4F627D8]);
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = [*(id *)(a1 + 40) code];
      if (v5) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = &stru_1F18F92B8;
      }
      int v13 = objc_msgSend(v10, "hf_errorWithCode:description:", v11, v12);
      int v14 = (void *)[v9 initWithInfo:0 error:v13];

      [v8 sendResponse:v14];
    }
    id v16 = [*(id *)(a1 + 32) serviceContext];
    id v15 = [v16 remoteViewControllerProxy];
    [v15 invalidate];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 view];
  uint64_t v10 = [(HUDropInViewController *)self talkButton];
  if (v9 != v10)
  {
    uint64_t v4 = [v8 view];
    uint64_t v11 = [(HUDropInViewController *)self doneButton];
    if (v4 != v11)
    {
      BOOL v12 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  id v13 = [(HUDropInViewController *)self tapGestureRecognizer];
  BOOL v12 = v13 == v7;

  uint64_t v11 = v4;
  if (v9 != v10) {
    goto LABEL_5;
  }
LABEL_6:

  return !v12;
}

- (void)_didTap:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDropInViewController *)self view];
  [v4 locationOfTouch:0 inView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(HUDropInViewController *)self contentView];
  [v10 frame];
  double v12 = v11;
  id v13 = [(HUDropInViewController *)self contentView];
  [v13 frame];
  if (v9 > v12 + v14)
  {
    BOOL v17 = 1;
  }
  else
  {
    id v15 = [(HUDropInViewController *)self contentView];
    [v15 frame];
    BOOL v17 = v9 < v16;
  }
  __int16 v18 = [(HUDropInViewController *)self contentView];
  [v18 frame];
  double v20 = v19;

  id v21 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  char v23 = v7 < v20 || v17;
  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    char v24 = v23;
  }
  else {
    char v24 = 0;
  }
  if ((v24 & 1) != 0 || v17)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__HUDropInViewController__didTap___block_invoke;
    aBlock[3] = &unk_1E6386730;
    aBlock[4] = self;
    __int16 v25 = _Block_copy(aBlock);
    [(HUDropInViewController *)self _dismissUpRecordingView:v25];
  }
}

void __34__HUDropInViewController__didTap___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) serviceContext];
    v2 = [v3 remoteViewControllerProxy];
    [v2 invalidate];
  }
}

- (void)_didPan:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDropInViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;

  uint64_t v8 = [v4 state];
  if (v8 == 3)
  {
    double v9 = [(HUDropInViewController *)self closeButtonTopConstraint];
    [v9 constant];
    double v11 = v10;

    if (v11 > 120.0)
    {
      [(HUDropInViewController *)self _dismissDownRecordingView:0];
      return;
    }
    uint64_t v22 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v23 = [v22 userInterfaceIdiom];

    if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      char v24 = [(HUDropInViewController *)self contentViewTopConstraint];
      [v24 setConstant:30.0];
    }
    __int16 v25 = [(HUDropInViewController *)self closeButtonTopConstraint];
    [v25 setConstant:30.0];

    [(NSLayoutConstraint *)self->_dismissLabelTopConstraint setConstant:-25.0];
    [(UILabel *)self->_dismissLabel setAlpha:0.0];
    id v26 = [(HUDropInViewController *)self view];
    [v26 setNeedsLayout];
    goto LABEL_15;
  }
  if (v7 > 49.0)
  {
    double v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v14 = [(HUDropInViewController *)self contentViewTopConstraint];
      [v14 setConstant:v7];
    }
    id v15 = [(HUDropInViewController *)self closeButtonTopConstraint];
    [v15 setConstant:v7];

    double v16 = v7 + -25.0;
    [(NSLayoutConstraint *)self->_dismissLabelTopConstraint setConstant:v16];
    BOOL v17 = [(HUDropInViewController *)self dismissLabel];
    [v17 setAlpha:v16 / 120.0];

    __int16 v18 = [(HUDropInViewController *)self view];
    [v18 layoutIfNeeded];

    double v19 = [(HUDropInViewController *)self closeButtonTopConstraint];
    [v19 constant];
    double v21 = v20;

    if (v21 > 120.0)
    {
      id v26 = [(HUDropInViewController *)self feedbackGenerator];
      [v26 impactOccurredWithIntensity:1.0];
LABEL_15:
    }
  }
}

- (void)_dismissUpRecordingView:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__HUDropInViewController__dismissUpRecordingView___block_invoke;
  v3[3] = &unk_1E6386018;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v3 options:a3 animations:0.25 completion:0.0];
}

uint64_t __50__HUDropInViewController__dismissUpRecordingView___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HUDropInViewController__dismissUpRecordingView___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __50__HUDropInViewController__dismissUpRecordingView___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dismissLabel];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) contentViewHeightConstraint];
  [v3 setConstant:0.0];

  id v4 = [*(id *)(a1 + 32) contentViewWidthConstraint];
  [v4 setConstant:100.0];

  CAFrameRateRange v5 = [*(id *)(a1 + 32) contentView];
  [v5 setAlpha:0.0];

  double v6 = [*(id *)(a1 + 32) view];
  [v6 setAlpha:0.0];

  double v7 = [*(id *)(a1 + 32) spinnerLabel];
  [v7 setAlpha:0.0];

  uint64_t v8 = [*(id *)(a1 + 32) talkButton];
  [v8 setAlpha:0.0];

  double v9 = [*(id *)(a1 + 32) doneButton];
  [v9 setAlpha:0.0];

  double v10 = [*(id *)(a1 + 32) parentViewController];
  double v11 = [v10 view];
  [v11 setAlpha:0.0];

  id v12 = [*(id *)(a1 + 32) view];
  [v12 layoutIfNeeded];
}

- (void)_dismissDownRecordingView:(id)a3
{
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke;
  v4[3] = &unk_1E6386018;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_3;
  v3[3] = &unk_1E6386730;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:v3 animations:0.5 completion:0.0];
}

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v4 = [*(id *)(a1 + 32) view];
    [v4 bounds];
    double v6 = v5;
    double v7 = [*(id *)(a1 + 32) contentViewTopConstraint];
    [v7 setConstant:v6];
  }
  uint64_t v8 = [*(id *)(a1 + 32) view];
  [v8 bounds];
  double v10 = v9;
  double v11 = [*(id *)(a1 + 32) closeButtonTopConstraint];
  [v11 setConstant:v10];

  id v12 = [*(id *)(a1 + 32) dismissLabel];
  [v12 setAlpha:0.0];

  id v13 = [*(id *)(a1 + 32) view];
  [v13 layoutIfNeeded];
}

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 32) contentView];
    [v3 setAlpha:0.0];

    id v4 = [*(id *)(v2 + 32) closeButtonVisualEffectView];
    [v4 setAlpha:0.0];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_4;
    v6[3] = &unk_1E6386018;
    uint64_t v7 = *(void *)(v2 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_6;
    v5[3] = &unk_1E6386730;
    v5[4] = v7;
    return [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5 completion:0.25];
  }
  return result;
}

uint64_t __52__HUDropInViewController__dismissDownRecordingView___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__HUDropInViewController__dismissDownRecordingView___block_invoke_5;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  v1 = [v2 view];
  [v1 setAlpha:0.0];
}

void __52__HUDropInViewController__dismissDownRecordingView___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceContext];
  v1 = [v2 remoteViewControllerProxy];
  [v1 invalidate];
}

- (id)_recordButtonMicOnColor
{
  return (id)[MEMORY[0x1E4F428B8] systemMidGrayColor];
}

- (id)_recordButtonMicOffColor
{
  return (id)[MEMORY[0x1E4F428B8] systemYellowColor];
}

- (id)_waveformColor
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  id v4 = [(HUDropInViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (id)_contentViewBackgroundColor
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  id v4 = [(HUDropInViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemBlackColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (void)_launchDropInSessionIfNeeded
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v5 = [v4 deviceManager];
  uint64_t v6 = [v5 devices];

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    v38 = v8;
    __int16 v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Device list for drop-in: %@", buf, 0x20u);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke;
  v34[3] = &unk_1E638F8C8;
  v34[4] = self;
  double v9 = objc_msgSend(v6, "na_firstObjectPassingTest:", v34);
  [v9 setDelegate:self];
  double v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ DIDevice = %@", buf, 0x20u);
  }
  if ([(HUDropInViewController *)self hasAttemptedDropInSessionCall])
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ A dropin session has already been attempted before. No more attempts will occur.", buf, 0x16u);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    double v14 = [(HUDropInViewController *)self dropInCenter];
    id v15 = [v14 sessionManager];
    double v16 = [v15 activeSession];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      if ([v9 state] != 2 && objc_msgSend(v9, "state") != 3)
      {
        double v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          double v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v36 = self;
          __int16 v37 = 2112;
          v38 = v20;
          _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ This device is supposedly not available for DropIn at this time. Will attempt session start anyway.", buf, 0x16u);
        }
        double v21 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v22 = HFLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = NSStringFromSelector(a2);
          char v24 = [v9 stateExpiration];
          *(_DWORD *)buf = 138413058;
          uint64_t v36 = self;
          __int16 v37 = 2112;
          v38 = v23;
          __int16 v39 = 2112;
          v40 = v21;
          __int16 v41 = 2112;
          v42 = v24;
          _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@: %@ Current date (%@) vs DropIn expiration date (%@)", buf, 0x2Au);
        }
      }
      __int16 v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        v38 = v26;
        __int16 v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@: %@ No active dropin session. Will launch new session for device %@.", buf, 0x20u);
      }
      id v12 = [objc_alloc(MEMORY[0x1E4F5F9F8]) initWithDevice:v9];
      __int16 v27 = [(HUDropInViewController *)self dropInCenter];
      uint64_t v28 = [v27 sessionManager];
      [v28 setDelegate:self];

      [(HUDropInViewController *)self setHasAttemptedDropInSessionCall:1];
      [(HUDropInViewController *)self _updateRecordingUIWithDefaultState];
      uint64_t v29 = [(HUDropInViewController *)self spinnerLabel];
      uint64_t v30 = _HULocalizedStringWithDefaultValue(@"HUDropIn_Label_Connecting_State", @"HUDropIn_Label_Connecting_State", 1);
      [v29 setText:v30];

      objc_initWeak((id *)buf, self);
      v31 = [(HUDropInViewController *)self dropInCenter];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_76;
      v32[3] = &unk_1E638F8F0;
      objc_copyWeak(&v33, (id *)buf);
      [v31 startSessionWithRequest:v12 completionHandler:v32];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
LABEL_10:
      id v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        v38 = v18;
        __int16 v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ A dropin session is already active or device is not found: %@.", buf, 0x20u);
      }
    }
  }
}

uint64_t __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 homeKitIdentifier];
  id v4 = [*(id *)(a1 + 32) currentAccessory];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v9 = HFLogForCategory();
  double v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Failed to start dropin session with error: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_77;
    block[3] = &unk_1E63850E0;
    id v17 = v6;
    id v18 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "state"));
      *(_DWORD *)buf = 138412802;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = 0x4010000000000000;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Successfully started dropin session: %@ with state %@. We will update the session state in UI in about %lf seconds.", buf, 0x20u);
    }
    dispatch_time_t v12 = dispatch_time(0, 4000000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_79;
    v13[3] = &unk_1E63882F0;
    objc_copyWeak(&v15, v7);
    id v14 = v5;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);

    objc_destroyWeak(&v15);
  }
}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_77(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 4)
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 91;
  }
  else if ([*(id *)(a1 + 32) code] == 5)
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 92;
  }
  else if ([*(id *)(a1 + 32) code] == 8)
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 93;
  }
  else if ([*(id *)(a1 + 32) code] == 6)
  {
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = 94;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) code];
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    if (v5 == 7) {
      uint64_t v4 = 95;
    }
    else {
      uint64_t v4 = 86;
    }
  }
  objc_msgSend(v3, "hf_errorWithCode:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissRecordingUIWithError:");
}

void __54__HUDropInViewController__launchDropInSessionIfNeeded__block_invoke_79(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setActiveDropInSession:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) state] == 1)
  {
    uint64_t v3 = [WeakRetained spinnerLabel];
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUDropIn_Label_Announcing_State", @"HUDropIn_Label_Announcing_State", 1);
    [v3 setText:v4];
  }
  [WeakRetained _updateRecordingUIWithDefaultState];
  uint64_t v5 = [WeakRetained dropInCenter];
  id v6 = [v5 createAudioPowerController];
  [WeakRetained setDropInAudioPowerController:v6];

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Created audio power controller", v9, 2u);
  }

  uint64_t v8 = [WeakRetained dropInAudioPowerController];
  [v8 setDelegate:WeakRetained];
}

- (UIButton)talkButton
{
  talkButton = self->_talkButton;
  if (!talkButton)
  {
    uint64_t v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUDropInButton_AX_Label_Title", @"HUDropInButton_AX_Label_Title", 1);
    [(UIButton *)v4 setAccessibilityLabel:v5];

    id v6 = _HULocalizedStringWithDefaultValue(@"HUDropInButton_AX_Label_Hint_Enable_Mic", @"HUDropInButton_AX_Label_Hint_Enable_Mic", 1);
    [(UIButton *)v4 setAccessibilityHint:v6];

    uint64_t v7 = [MEMORY[0x1E4F428B8] systemYellowColor];
    [(UIButton *)v4 setBackgroundColor:v7];

    uint64_t v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(UIButton *)v4 setTintColor:v8];

    [(UIButton *)v4 _setContinuousCornerRadius:16.0];
    double v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_microphoneGlyphForTalkingState:usingStandardSymbolConfiguration:", 0, 1);
    id v10 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setImage:v9];
    [(UIButton *)v4 addSubview:v10];
    id v11 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    dispatch_time_t v12 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [v11 setTextColor:v12];

    [(UIButton *)v4 addSubview:v11];
    id v13 = [v10 topAnchor];
    id v14 = [(UIButton *)v4 topAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14 constant:13.0];
    [v15 setActive:1];

    double v16 = [v10 leadingAnchor];
    id v17 = [(UIButton *)v4 leadingAnchor];
    id v18 = [v16 constraintEqualToAnchor:v17 constant:25.0];
    [v18 setActive:1];

    double v19 = [v10 widthAnchor];
    id v20 = [v19 constraintEqualToConstant:18.0];
    [v20 setActive:1];

    __int16 v21 = [v10 heightAnchor];
    uint64_t v22 = [v21 constraintEqualToConstant:18.0];
    [v22 setActive:1];

    __int16 v23 = [v11 topAnchor];
    uint64_t v24 = [(UIButton *)v4 topAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:13.0];
    [v25 setActive:1];

    id v26 = [v11 leadingAnchor];
    __int16 v27 = [v10 trailingAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:10.0];
    [v28 setActive:1];

    uint64_t v29 = [v11 trailingAnchor];
    uint64_t v30 = [(UIButton *)v4 trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-25.0];
    [v31 setActive:1];

    v32 = [v11 heightAnchor];
    id v33 = [v32 constraintEqualToConstant:18.0];
    [v33 setActive:1];

    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = _HULocalizedStringWithDefaultValue(@"HUDropInButton_Label_Talk_State", @"HUDropInButton_Label_Talk_State", 1);
    [v11 setText:v34];

    [(UIButton *)v4 sizeToFit];
    v35 = self->_talkButton;
    self->_talkButton = v4;

    talkButton = self->_talkButton;
  }

  return talkButton;
}

- (UIButton)doneButton
{
  doneButton = self->_doneButton;
  if (!doneButton)
  {
    uint64_t v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUDropInDoneButton_AX_Label_Title", @"HUDropInDoneButton_AX_Label_Title", 1);
    [(UIButton *)v4 setAccessibilityLabel:v5];

    id v6 = _HULocalizedStringWithDefaultValue(@"HUDropInButton_AX_Label_Hint_Disable_Mic", @"HUDropInButton_AX_Label_Hint_Disable_Mic", 1);
    [(UIButton *)v4 setAccessibilityHint:v6];

    uint64_t v7 = [MEMORY[0x1E4F428B8] systemYellowColor];
    [(UIButton *)v4 setBackgroundColor:v7];

    uint64_t v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(UIButton *)v4 setTintColor:v8];

    [(UIButton *)v4 _setContinuousCornerRadius:16.0];
    id v9 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [v9 setTextColor:v10];

    [(UIButton *)v4 addSubview:v9];
    id v11 = [v9 topAnchor];
    dispatch_time_t v12 = [(UIButton *)v4 topAnchor];
    id v13 = [v11 constraintEqualToAnchor:v12 constant:13.0];
    [v13 setActive:1];

    id v14 = [v9 leadingAnchor];
    id v15 = [(UIButton *)v4 leadingAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:25.0];
    [v16 setActive:1];

    id v17 = [v9 trailingAnchor];
    id v18 = [(UIButton *)v4 trailingAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18 constant:-25.0];
    [v19 setActive:1];

    id v20 = [v9 heightAnchor];
    __int16 v21 = [v20 constraintEqualToConstant:18.0];
    [v21 setActive:1];

    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HUDropInButton_Label_Done_State", @"HUDropInButton_Label_Done_State", 1);
    [v9 setText:v22];

    __int16 v23 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }

  return doneButton;
}

- (void)managerDidUpdateDevices:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v7;
    __int16 v39 = 2112;
    id v40 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Device manager: %@", buf, 0x20u);
  }
  uint64_t v8 = [(HUDropInViewController *)self dropInCenter];
  id v9 = [v8 deviceManager];
  id v10 = [v9 devices];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke;
  v34[3] = &unk_1E638F8C8;
  v34[4] = self;
  id v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", v34);

  if (v11)
  {
    dispatch_time_t v12 = [MEMORY[0x1E4F1C9C8] now];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    id v15 = [v11 stateExpiration];
    [v15 timeIntervalSince1970];
    BOOL v17 = v14 > v16;

    if ([v11 state]) {
      int v18 = v17;
    }
    else {
      int v18 = 1;
    }
    if (v18 == 1)
    {
      double v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v20;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ Requesting device state refresh for device: %@", buf, 0x20u);
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_105;
      v29[3] = &unk_1E638CA08;
      v29[4] = self;
      SEL v31 = a2;
      id v30 = v11;
      [v30 refreshStateWithCompletionHandler:v29];
    }
    [(HUDropInViewController *)self _launchDropInSessionIfNeeded];
  }
  else
  {
    __int16 v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = NSStringFromSelector(a2);
      __int16 v23 = [(HUDropInViewController *)self currentAccessory];
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v22;
      __int16 v39 = 2112;
      id v40 = v23;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@: %@ Unable to find dropin device for accessory %@", buf, 0x20u);
    }
    uint64_t v24 = [(HUDropInViewController *)self startSessionRequestTimer];
    BOOL v25 = v24 == 0;

    if (v25)
    {
      id v26 = HFLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = self;
        __int16 v37 = 2048;
        uint64_t v38 = 30;
        _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@: Starting start session request timer (%lus)", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      __int16 v27 = (void *)MEMORY[0x1E4F1CB00];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_103;
      v32[3] = &unk_1E6389EE0;
      objc_copyWeak(&v33, (id *)buf);
      uint64_t v28 = [v27 scheduledTimerWithTimeInterval:0 repeats:v32 block:30.0];
      [(HUDropInViewController *)self setStartSessionRequestTimer:v28];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
  }
}

uint64_t __50__HUDropInViewController_managerDidUpdateDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 homeKitIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) currentAccessory];
  id v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

void __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Start session request timer fired %@. No DIDevice was found after waiting. Will dismiss UI.", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 87);
  [WeakRetained _dismissRecordingUIWithError:v6];
}

void __50__HUDropInViewController_managerDidUpdateDevices___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 40);
      int v11 = 138413058;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      double v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Failed to request refresh of device state for device: %@ with error %@", (uint8_t *)&v11, 0x2Au);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138412802;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    double v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Succeeded to request refresh of device state for device: %@", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }
}

- (void)manager:(id)a3 didAddDevice:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Added Device: %@", buf, 0x20u);
  }
  uint64_t v9 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v10 = [v9 deviceManager];
  int v11 = [v10 devices];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__HUDropInViewController_manager_didAddDevice___block_invoke;
  v15[3] = &unk_1E638F8C8;
  v15[4] = self;
  uint64_t v12 = objc_msgSend(v11, "na_firstObjectPassingTest:", v15);

  if (v12)
  {
    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Found DIDevice in device manager list: %@", buf, 0x20u);
    }
    [(HUDropInViewController *)self _cancelStartSessionRequestTimerIfNeeded];
    [(HUDropInViewController *)self _launchDropInSessionIfNeeded];
  }
}

uint64_t __47__HUDropInViewController_manager_didAddDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 homeKitIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) currentAccessory];
  id v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)device:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    uint64_t v10 = [MEMORY[0x1E4F5F9E8] stringForDeviceState:a4];
    int v15 = 138413058;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated Device state to %@ for device: %@", (uint8_t *)&v15, 0x2Au);
  }
  int v11 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v12 = [v11 sessionManager];
  __int16 v13 = [v12 activeSession];
  uint64_t v14 = [v13 state];

  if (a4 == 2 && v14 == 2) {
    [(HUDropInViewController *)self _launchDropInSessionIfNeeded];
  }
}

- (id)hu_preloadContent
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    BOOL v25 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Preload content", buf, 0x16u);
  }
  uint64_t v6 = [(HUDropInViewController *)self serviceContext];
  id v7 = [v6 homeIdentifier];

  uint64_t v8 = [(HUDropInViewController *)self serviceContext];
  uint64_t v9 = [v8 accessoryIdentifier];

  objc_initWeak((id *)buf, self);
  uint64_t v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  int v11 = [v10 allHomesFuture];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke;
  v18[3] = &unk_1E638ADE0;
  objc_copyWeak(&v21, (id *)buf);
  id v12 = v7;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  uint64_t v14 = [v11 flatMap:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke_111;
  v17[3] = &unk_1E6385648;
  v17[4] = self;
  int v15 = [v14 flatMap:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v15;
}

id __43__HUDropInViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__HUDropInViewController_hu_preloadContent__block_invoke_2;
  v19[3] = &unk_1E638C2D8;
  id v20 = *(id *)(a1 + 32);
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v19);

  [WeakRetained setCurrentHome:v6];
  id v7 = [WeakRetained currentHome];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 40)];
  uint64_t v9 = objc_msgSend(v7, "hf_accessoryWithIdentifier:", v8);
  [WeakRetained setCurrentAccessory:v9];

  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [WeakRetained currentAccessory];
    id v12 = [WeakRetained currentHome];
    *(_DWORD *)buf = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Found current accessory? %@ | Found current home? %@", buf, 0x16u);
  }
  id v13 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v14 = NSNumber;
  int v15 = [WeakRetained currentAccessory];
  uint64_t v16 = [v14 numberWithInt:v15 == 0];
  __int16 v17 = [v13 futureWithResult:v16];

  return v17;
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

id __43__HUDropInViewController_hu_preloadContent__block_invoke_111(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  id v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Will attempt to refresh home graph to find accessory", buf, 2u);
    }

    uint64_t v6 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    __int16 v17 = __43__HUDropInViewController_hu_preloadContent__block_invoke_112;
    __int16 v18 = &unk_1E6385108;
    uint64_t v19 = *(void *)(a1 + 32);
    id v7 = &v15;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "No need to refresh home graph. Accessory was found.", buf, 2u);
    }

    uint64_t v6 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __43__HUDropInViewController_hu_preloadContent__block_invoke_114;
    id v13 = &unk_1E6385108;
    uint64_t v14 = *(void *)(a1 + 32);
    id v7 = &v10;
  }
  uint64_t v8 = objc_msgSend(v6, "futureWithBlock:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);

  return v8;
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_112(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _refreshHomeGraph:a2];
}

uint64_t __43__HUDropInViewController_hu_preloadContent__block_invoke_114(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _preloadContent:a2];
}

- (void)_preloadContent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HUDropInViewController.m", 1124, @"Invalid parameter not satisfying: %@", @"promise" object file lineNumber description];
  }
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HUDropInViewController *)self currentAccessory];
    uint64_t v8 = [(HUDropInViewController *)self currentHome];
    *(_DWORD *)buf = 138412546;
    __int16 v37 = v7;
    __int16 v38 = 2112;
    __int16 v39 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Current accessory = %@ | Current home = %@", buf, 0x16u);
  }
  uint64_t v9 = [(HUDropInViewController *)self currentHome];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [(HUDropInViewController *)self currentAccessory],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    id v12 = [(HUDropInViewController *)self currentHome];
    id v13 = [v12 createHomeAudioAnalysisEventSubscriber];
    [(HUDropInViewController *)self setLastKnownEventSubscriber:v13];

    uint64_t v14 = [(HUDropInViewController *)self lastKnownEventSubscriber];
    [v14 setDelegate:self];

    uint64_t v15 = [(HUDropInViewController *)self lastKnownEventSubscriber];
    uint64_t v16 = [(HUDropInViewController *)self currentAccessory];
    __int16 v17 = [v16 uniqueIdentifier];
    [v15 subscribeLastKnownEventsForAccessory:v17 completion:&__block_literal_global_224];

    id v18 = objc_alloc(MEMORY[0x1E4F5F9F0]);
    uint64_t v19 = [(HUDropInViewController *)self currentHome];
    id v20 = [v19 uniqueIdentifier];
    id v21 = (void *)[v18 initWithHomeIdentifier:v20 queue:MEMORY[0x1E4F14428]];
    [(HUDropInViewController *)self setDropInCenter:v21];

    id v22 = [(HUDropInViewController *)self dropInCenter];
    [v22 setDelegate:self];

    __int16 v23 = [(HUDropInViewController *)self dropInCenter];
    __int16 v24 = [v23 deviceManager];
    [v24 setDelegate:self];

    uint64_t v25 = [(HUDropInViewController *)self currentHome];
    uint64_t v26 = objc_msgSend(v25, "hf_allCameraProfiles");
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __42__HUDropInViewController__preloadContent___block_invoke_127;
    v35[3] = &unk_1E638F918;
    v35[4] = self;
    v35[5] = a2;
    __int16 v27 = objc_msgSend(v26, "na_firstObjectPassingTest:", v35);
    [(HUDropInViewController *)self setNearbyCameraProfile:v27];

    uint64_t v28 = [(HUDropInViewController *)self nearbyCameraProfile];

    if (v28)
    {
      uint64_t v29 = [HUCameraLiveStreamViewController alloc];
      id v30 = [(HUDropInViewController *)self nearbyCameraProfile];
      SEL v31 = [(HUCameraLiveStreamViewController *)v29 initWithCameraProfile:v30];
      [(HUDropInViewController *)self setLiveStreamController:v31];

      v32 = [(HUDropInViewController *)self liveStreamController];
      [v32 setLiveStreamControllerDelegate:self];
    }
  }
  else
  {
    id v33 = HFLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "No home and/or accessory found!", buf, 2u);
    }
  }
  [v5 finishWithNoResult];
}

void __42__HUDropInViewController__preloadContent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = HFLogForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }
}

uint64_t __42__HUDropInViewController__preloadContent___block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 accessory];
  int v5 = [v4 room];
  id v6 = [*(id *)(a1 + 32) currentAccessory];
  uint64_t v7 = [v6 room];
  if ([v5 isEqual:v7] && (objc_msgSend(v3, "hf_shouldDisableLiveStream") & 1) == 0)
  {
    uint64_t v9 = [v3 accessory];
    uint64_t v8 = [v9 isReachable];
  }
  else
  {
    uint64_t v8 = 0;
  }

  uint64_t v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v20 = [v3 accessory];
    int v13 = [v20 isReachable];
    int v14 = objc_msgSend(v3, "hf_shouldDisableLiveStream");
    uint64_t v15 = [v3 accessory];
    uint64_t v16 = [v15 room];
    __int16 v17 = [*(id *)(a1 + 32) currentAccessory];
    id v18 = [v17 room];
    *(_DWORD *)buf = 138413826;
    uint64_t v23 = v11;
    uint64_t v8 = v21;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 1024;
    unsigned int v27 = v21;
    __int16 v28 = 1024;
    int v29 = v13;
    __int16 v30 = 1024;
    int v31 = v14;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2112;
    v35 = v18;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@ : %@ Should show camera in DropIn UI? %{BOOL}d Is reachable? %{BOOL}d Is live stream disabled? %{BOOL}d Camera room: %@ Accessory Room: %@", buf, 0x3Cu);
  }
  return v8;
}

- (void)_refreshHomeGraph:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUDropInViewController.m", 1159, @"Invalid parameter not satisfying: %@", @"promise" object file lineNumber description];
  }
  id v6 = [(HUDropInViewController *)self serviceContext];
  uint64_t v7 = [v6 homeIdentifier];

  uint64_t v8 = [(HUDropInViewController *)self serviceContext];
  uint64_t v9 = [v8 accessoryIdentifier];

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v12 = [v11 homeManager];
  int v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke;
  v20[3] = &unk_1E6389958;
  id v21 = v10;
  id v22 = v5;
  uint64_t v23 = self;
  id v24 = v7;
  id v25 = v9;
  id v14 = v9;
  id v15 = v7;
  id v16 = v5;
  id v17 = v10;
  id v18 = (id)[v12 _refreshBeforeDate:v13 completionHandler:v20];
}

void __44__HUDropInViewController__refreshHomeGraph___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v6 = v5;

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
    __int16 v26 = 2048;
    uint64_t v27 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s Home graph refresh took %f", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_130;
  aBlock[3] = &unk_1E638F940;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void **)(a1 + 56);
  id v20 = v8;
  uint64_t v21 = v9;
  id v22 = v10;
  id v23 = *(id *)(a1 + 64);
  uint64_t v11 = _Block_copy(aBlock);
  if (a2)
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%s Unable to refresh home graph, force a retry after 1s", buf, 0xCu);
    }

    dispatch_time_t v13 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_133;
    block[3] = &unk_1E6386040;
    id v18 = v11;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
    id v14 = v18;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v15 = [v14 allHomesFuture];
    id v16 = (id)[v15 addCompletionBlock:v11];
  }
}

void __44__HUDropInViewController__refreshHomeGraph___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__HUDropInViewController__refreshHomeGraph___block_invoke_131;
    v13[3] = &unk_1E638C2D8;
    id v14 = *(id *)(a1 + 48);
    uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    [*(id *)(a1 + 40) setCurrentHome:v7];

    id v8 = [*(id *)(a1 + 40) currentHome];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 56)];
    uint64_t v10 = objc_msgSend(v8, "hf_accessoryWithIdentifier:", v9);
    [*(id *)(a1 + 40) setCurrentAccessory:v10];

    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke_2";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%s : Fetched all homes after home graph refresh. Homes: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) _preloadContent:*(void *)(a1 + 32)];
  }
  else
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "-[HUDropInViewController _refreshHomeGraph:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%s : Unable to fetch homes. Homes = %@ | Error: %@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) finishWithNoResult];
  }
}

uint64_t __44__HUDropInViewController__refreshHomeGraph___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __44__HUDropInViewController__refreshHomeGraph___block_invoke_133(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v2 = [v4 allHomesFuture];
  id v3 = (id)[v2 addCompletionBlock:*(void *)(a1 + 32)];
}

- (void)streamControllerStateDidUpdate:(id)a3
{
  id v11 = [(HUDropInViewController *)self nearbyCameraProfile];
  uint64_t v7 = [v11 streamControl];
  uint64_t v8 = [v7 streamState];
  if (v8 == 2)
  {
    _HULocalizedStringWithDefaultValue(@"HUCameraLive", @"HUCameraLive", 1);
  }
  else
  {
    id v3 = [(HUDropInViewController *)self nearbyCameraProfile];
    id v4 = [v3 snapshotControl];
    uint64_t v5 = [v4 mostRecentSnapshot];
    objc_msgSend(v5, "hf_localizedAge");
  uint64_t v9 = };
  uint64_t v10 = [(HUDropInViewController *)self descriptionLabel];
  [v10 setText:v9];

  if (v8 != 2)
  {

    uint64_t v9 = v3;
  }
}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v11 = NSStringFromSelector(a2);
    int v12 = 138412546;
    dispatch_time_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Disconnected from DropIn process", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [(HUDropInViewController *)self dropInCenter];
  uint64_t v7 = [v6 sessionManager];
  uint64_t v8 = [v7 activeSession];

  if (v8) {
    uint64_t v9 = 88;
  }
  else {
    uint64_t v9 = 86;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", v9);
  [(HUDropInViewController *)self _dismissRecordingUIWithError:v10];
}

- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(HUDropInViewController *)self activeDropInSession];
  id v11 = v10;
  if (v9 && v10)
  {
    id v12 = [(HUDropInViewController *)self activeDropInSession];

    if (v12 != v9)
    {
      dispatch_time_t v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = NSStringFromSelector(a2);
        id v15 = [(HUDropInViewController *)self activeDropInSession];
        int v33 = 138413058;
        __int16 v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = v14;
        __int16 v37 = 2112;
        id v38 = v9;
        __int16 v39 = 2112;
        uint64_t v40 = v15;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", (uint8_t *)&v33, 0x2Au);
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = NSStringFromSelector(a2);
    id v18 = [MEMORY[0x1E4F5FA00] stringForDropInSessionState:a4];
    __int16 v19 = [MEMORY[0x1E4F5FA00] stringForDropInSessionStateReason:a5];
    int v33 = 138413058;
    __int16 v34 = self;
    __int16 v35 = 2112;
    uint64_t v36 = v17;
    __int16 v37 = 2112;
    id v38 = v18;
    __int16 v39 = 2112;
    uint64_t v40 = v19;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin Session state: %@ with reason: %@", (uint8_t *)&v33, 0x2Au);
  }
  if ([v9 state] == 1)
  {
    id v20 = [(HUDropInViewController *)self spinnerLabel];
    uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUDropIn_Label_Connecting_State", @"HUDropIn_Label_Connecting_State", 1);
    [v20 setText:v21];
  }
  else if ([v9 state] == 4 && !-[HUDropInViewController hasSessionStarted](self, "hasSessionStarted"))
  {
    [(HUDropInViewController *)self setHasSessionStarted:1];
    id v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = NSStringFromSelector(a2);
      id v24 = [(HUDropInViewController *)self dropInCenter];
      id v25 = [v24 sessionManager];
      __int16 v26 = [v25 activeSession];
      int v27 = [v26 isUplinkMuted];
      int v33 = 138412802;
      __int16 v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      __int16 v37 = 1024;
      LODWORD(v38) = v27;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@: %@ Is uplink audio muted?: %{BOOL}d", (uint8_t *)&v33, 0x1Cu);
    }
    [(HUDropInViewController *)self _updateRecordingUIWithConnectedState];
    uint64_t v28 = [(HUDropInViewController *)self dropInCenter];
    int v29 = [v28 sessionManager];
    __int16 v30 = [v29 activeSession];
    int v31 = [v30 isUplinkMuted];

    if (v31) {
      [(HUDropInViewController *)self _updateRecordingUIWithMicrophoneOff];
    }
    else {
      [(HUDropInViewController *)self _updateRecordingUIWithMicrophoneOn];
    }
  }
  if ([v9 state] == 6 || objc_msgSend(v9, "state") == 7)
  {
    if (a5 == 6) {
      uint64_t v32 = 91;
    }
    else {
      uint64_t v32 = 90;
    }
    dispatch_time_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", v32);
    [(HUDropInViewController *)self _dismissRecordingUIWithError:v13];
    goto LABEL_24;
  }
LABEL_25:
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin session failed with error: %@", buf, 0x20u);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HUDropInViewController_session_didFailWithError___block_invoke;
  block[3] = &unk_1E638A900;
  void block[4] = self;
  id v13 = v7;
  SEL v14 = a2;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__HUDropInViewController_session_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) activeDropInSession];
  id v3 = v2;
  if (!v2 || (id v4 = *(void **)(a1 + 40)) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v5 = [*(id *)(a1 + 32) activeDropInSession];

  if (v4 == v5)
  {
LABEL_7:
    id v11 = [*(id *)(a1 + 32) dropInCenter];
    id v12 = [v11 deviceManager];
    id v6 = [v12 devices];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__HUDropInViewController_session_didFailWithError___block_invoke_134;
    v19[3] = &unk_1E638F8C8;
    void v19[4] = *(void *)(a1 + 32);
    id v8 = [v6 na_firstObjectPassingTest:v19];
    id v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Session failed for DIDevice : %@", buf, 0x20u);
    }
    if ([v8 state] == 2 || objc_msgSend(v8, "state") == 3)
    {
      uint64_t v16 = *(void **)(a1 + 32);
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = 89;
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 32);
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = 88;
    }
    uint64_t v10 = objc_msgSend(v17, "hf_errorWithCode:", v18);
    [v16 _dismissRecordingUIWithError:v10];
    goto LABEL_14;
  }
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) activeDropInSession];
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    int v27 = v10;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", buf, 0x2Au);
LABEL_14:
  }
}

uint64_t __51__HUDropInViewController_session_didFailWithError___block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = [a2 homeKitIdentifier];
  id v4 = [*(id *)(a1 + 32) currentAccessory];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(HUDropInViewController *)self activeDropInSession];
  id v9 = v8;
  if (v7 && v8)
  {
    id v10 = [(HUDropInViewController *)self activeDropInSession];

    if (v10 != v7)
    {
      id v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = [(HUDropInViewController *)self activeDropInSession];
        *(_DWORD *)buf = 138413058;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        id v38 = v12;
        __int16 v39 = 2112;
        id v40 = v7;
        __int16 v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", buf, 0x2Au);

LABEL_16:
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 1024;
    LODWORD(v40) = v4;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ Uplink dropin audio muted? %{BOOL}d", buf, 0x1Cu);
  }
  BOOL v34 = v4;

  uint64_t v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = NSStringFromSelector(a2);
    uint64_t v18 = (void *)MEMORY[0x1E4F5FA00];
    __int16 v19 = [(HUDropInViewController *)self dropInCenter];
    id v20 = [v19 sessionManager];
    uint64_t v21 = [v20 activeSession];
    __int16 v22 = objc_msgSend(v18, "stringForDropInSessionState:", objc_msgSend(v21, "state"));
    *(_DWORD *)buf = 138412802;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2112;
    id v40 = v22;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin Session state: %@", buf, 0x20u);
  }
  id v23 = [(HUDropInViewController *)self dropInCenter];
  __int16 v24 = [v23 sessionManager];
  id v25 = [v24 activeSession];
  if ([v25 state] == 6)
  {

    goto LABEL_14;
  }
  __int16 v26 = [(HUDropInViewController *)self dropInCenter];
  int v27 = [v26 sessionManager];
  uint64_t v28 = [v27 activeSession];
  uint64_t v29 = [v28 state];

  if (v29 == 7)
  {
LABEL_14:
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Active session is already ended or removed. Ignoring mute status change.", buf, 0x16u);
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  __int16 v30 = [(HUDropInViewController *)self dropInCenter];
  int v31 = [v30 sessionManager];
  uint64_t v32 = [v31 activeSession];
  uint64_t v33 = [v32 state];

  if (v33 == 4)
  {
    if (![(HUDropInViewController *)self hasSessionStarted])
    {
      [(HUDropInViewController *)self setHasSessionStarted:1];
      [(HUDropInViewController *)self _updateRecordingUIWithConnectedState];
    }
    if (v34) {
      [(HUDropInViewController *)self _updateRecordingUIWithMicrophoneOff];
    }
    else {
      [(HUDropInViewController *)self _updateRecordingUIWithMicrophoneOn];
    }
  }
LABEL_18:
}

- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v43 = self;
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletins: %@", buf, 0x20u);
  }
  [(HUDropInViewController *)self setEventBulletins:v6];
  id v9 = [(HUDropInViewController *)self eventBulletins];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __56__HUDropInViewController_subscriber_didUpdateBulletins___block_invoke;
  v41[3] = &unk_1E638F968;
  v41[4] = self;
  id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v41);

  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint64_t v43 = self;
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Found last known event for accessory: %@", buf, 0x20u);
  }
  id v13 = [v10 startDate];
  uint64_t v14 = [v10 dateOfOccurrence];
  id v15 = [(HUDropInViewController *)self currentAccessory];
  uint64_t v16 = objc_msgSend(v15, "hf_serviceNameComponents");
  __int16 v17 = [v16 composedString];

  uint64_t v18 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v13 dateStyle:0 timeStyle:1];
  if (![v10 state])
  {
    if (objc_msgSend(v13, "hf_isSingularHour")) {
      __int16 v37 = @"HUDropIn_Description_Alarm_Started_SingularHour_FormatString";
    }
    else {
      __int16 v37 = @"HUDropIn_Description_Alarm_Started_PluralHour_FormatString";
    }
    HULocalizedStringWithFormat(v37, @"%@%@", v31, v32, v33, v34, v35, v36, (uint64_t)v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [(HUDropInViewController *)self descriptionTextView];
    [v20 setText:v19];
LABEL_21:

    goto LABEL_22;
  }
  if ([v10 state] == 1)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    [v19 setUnitsStyle:3];
    [v19 setAllowedUnits:64];
    id v20 = [v19 stringFromDate:v13 toDate:v14];
    [v14 timeIntervalSinceDate:v13];
    double v22 = v21;
    int v23 = objc_msgSend(v13, "hf_isSingularHour");
    if (v22 >= 60.0)
    {
      if (v23) {
        id v38 = @"HUDropIn_Description_Alarm_Ended_SingularHour_FormatString";
      }
      else {
        id v38 = @"HUDropIn_Description_Alarm_Ended_PluralHour_FormatString";
      }
      HULocalizedStringWithFormat(v38, @"%@%@%@", v24, v25, v26, v27, v28, v29, (uint64_t)v17);
    }
    else
    {
      if (v23) {
        __int16 v30 = @"HUDropIn_Description_Alarm_Ended_SingularHour_LessThanOneMin_FormatString";
      }
      else {
        __int16 v30 = @"HUDropIn_Description_Alarm_Ended_PluralHour_LessThanOneMin_FormatString";
      }
      HULocalizedStringWithFormat(v30, @"%@%@", v24, v25, v26, v27, v28, v29, (uint64_t)v17);
    __int16 v39 = };
    id v40 = [(HUDropInViewController *)self descriptionTextView];
    [v40 setText:v39];

    goto LABEL_21;
  }
LABEL_22:
}

uint64_t __56__HUDropInViewController_subscriber_didUpdateBulletins___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryIdentifier];
  BOOL v4 = [*(id *)(a1 + 32) currentAccessory];
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)controller:(id)a3 didUpdateAudioPowerForDropInDevice:(float)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HUDropInViewController.m" lineNumber:1370 description:@"didUpdateAudioPowerForDropInDevice called from secondary thread"];
  }
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    long double v9 = a4;
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    long double v17 = v9;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated audio power: %f", (uint8_t *)&v12, 0x20u);
  }
  else
  {
    long double v9 = a4;
  }

  id v10 = [(HUDropInViewController *)self audioWaveformView];
  [v10 appendPowerLevel:(double)(log10(v9) * 20.0)];
}

- (void)manager:(id)a3 didUpdateActiveSession:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HUDropInViewController *)self activeDropInSession];
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(HUDropInViewController *)self activeDropInSession];

    if (v9 != v6)
    {
      id v10 = HFLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      id v11 = NSStringFromSelector(a2);
      int v12 = [(HUDropInViewController *)self activeDropInSession];
      int v23 = 138413058;
      uint64_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      __int16 v30 = v12;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Received callback for session %@ which is different from current Session %@. Not Handling...", (uint8_t *)&v23, 0x2Au);
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = NSStringFromSelector(a2);
    int v23 = 138412802;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated active session: %@", (uint8_t *)&v23, 0x20u);
  }
  id v15 = [(HUDropInViewController *)self dropInCenter];
  __int16 v16 = [v15 sessionManager];
  long double v17 = [v16 activeSession];
  uint64_t v18 = [v17 delegate];

  if (!v18)
  {
    id v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(HUDropInViewController *)self dropInCenter];
      double v21 = [v20 sessionManager];
      double v22 = [v21 activeSession];
      int v23 = 138412290;
      uint64_t v24 = v22;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Active dropin session == %@", (uint8_t *)&v23, 0xCu);
    }
    id v10 = [(HUDropInViewController *)self dropInCenter];
    id v11 = [v10 sessionManager];
    int v12 = [v11 activeSession];
    [v12 setDelegate:self];
    goto LABEL_13;
  }
LABEL_15:
}

- (HUHomeControlServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
}

- (UILabel)dismissLabel
{
  return self->_dismissLabel;
}

- (void)setDismissLabel:(id)a3
{
}

- (UIVisualEffectView)dismissLabelVisualEffectView
{
  return self->_dismissLabelVisualEffectView;
}

- (void)setDismissLabelVisualEffectView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UILabel)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (UIVisualEffectView)closeButtonVisualEffectView
{
  return self->_closeButtonVisualEffectView;
}

- (void)setCloseButtonVisualEffectView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (HUWaveformView)audioWaveformView
{
  return self->_audioWaveformView;
}

- (void)setAudioWaveformView:(id)a3
{
}

- (void)setTalkButton:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (double)recordedDuration
{
  return self->_recordedDuration;
}

- (void)setRecordedDuration:(double)a3
{
  self->_recordedDuration = a3;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewWidthConstraint
{
  return self->_contentViewWidthConstraint;
}

- (void)setContentViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)closeButtonTopConstraint
{
  return self->_closeButtonTopConstraint;
}

- (void)setCloseButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dismissLabelTopConstraint
{
  return self->_dismissLabelTopConstraint;
}

- (void)setDismissLabelTopConstraint:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
}

- (HMAccessory)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
{
}

- (NSArray)eventBulletins
{
  return self->_eventBulletins;
}

- (void)setEventBulletins:(id)a3
{
}

- (DIDropInCenter)dropInCenter
{
  return self->_dropInCenter;
}

- (void)setDropInCenter:(id)a3
{
}

- (DIAudioPowerController)dropInAudioPowerController
{
  return self->_dropInAudioPowerController;
}

- (void)setDropInAudioPowerController:(id)a3
{
}

- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber
{
  return self->_lastKnownEventSubscriber;
}

- (void)setLastKnownEventSubscriber:(id)a3
{
}

- (BOOL)hasAttemptedDropInSessionCall
{
  return self->_hasAttemptedDropInSessionCall;
}

- (void)setHasAttemptedDropInSessionCall:(BOOL)a3
{
  self->_hasAttemptedDropInSessionCall = a3;
}

- (BOOL)hasAttemptedEndingDropInSessionCall
{
  return self->_hasAttemptedEndingDropInSessionCall;
}

- (void)setHasAttemptedEndingDropInSessionCall:(BOOL)a3
{
  self->_hasAttemptedEndingDropInSessionCall = a3;
}

- (BOOL)hasSessionStarted
{
  return self->_hasSessionStarted;
}

- (void)setHasSessionStarted:(BOOL)a3
{
  self->_hasSessionStarted = a3;
}

- (DIDropInSession)activeDropInSession
{
  return self->_activeDropInSession;
}

- (void)setActiveDropInSession:(id)a3
{
}

- (NSTimer)startSessionRequestTimer
{
  return self->_startSessionRequestTimer;
}

- (void)setStartSessionRequestTimer:(id)a3
{
}

- (HMCameraProfile)nearbyCameraProfile
{
  return self->_nearbyCameraProfile;
}

- (void)setNearbyCameraProfile:(id)a3
{
}

- (UIView)liveCameraView
{
  return self->_liveCameraView;
}

- (void)setLiveCameraView:(id)a3
{
}

- (HUCameraLiveStreamViewController)liveStreamController
{
  return self->_liveStreamController;
}

- (void)setLiveStreamController:(id)a3
{
}

- (HULegibilityLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToSpinnerLabel
{
  return self->_cameraLiveStreamViewTopConstraintToSpinnerLabel;
}

- (void)setCameraLiveStreamViewTopConstraintToSpinnerLabel:(id)a3
{
}

- (NSLayoutConstraint)cameraLiveStreamViewTopConstraintToDescriptionTextView
{
  return self->_cameraLiveStreamViewTopConstraintToDescriptionTextView;
}

- (void)setCameraLiveStreamViewTopConstraintToDescriptionTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToDescriptionTextView, 0);
  objc_storeStrong((id *)&self->_cameraLiveStreamViewTopConstraintToSpinnerLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_liveStreamController, 0);
  objc_storeStrong((id *)&self->_liveCameraView, 0);
  objc_storeStrong((id *)&self->_nearbyCameraProfile, 0);
  objc_storeStrong((id *)&self->_startSessionRequestTimer, 0);
  objc_storeStrong((id *)&self->_activeDropInSession, 0);
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, 0);
  objc_storeStrong((id *)&self->_dropInAudioPowerController, 0);
  objc_storeStrong((id *)&self->_dropInCenter, 0);
  objc_storeStrong((id *)&self->_eventBulletins, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_talkButton, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_spinnerLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_dismissLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);

  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end