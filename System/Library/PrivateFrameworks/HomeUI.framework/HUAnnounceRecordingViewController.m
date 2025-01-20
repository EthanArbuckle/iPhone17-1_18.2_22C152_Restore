@interface HUAnnounceRecordingViewController
- (ANAnnounce)announce;
- (BOOL)_areAllHomePodsOffline;
- (BOOL)_isHomeContext;
- (BOOL)_isRoomContext;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (BOOL)recordingDismissedByUser;
- (HFAudioRecorder)audioRecorder;
- (HMHome)currentHome;
- (HUAnnounceRecordingViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4;
- (HUHomeControlServiceContext)serviceContext;
- (HURecordingButton)recordButton;
- (HUWaveformView)audioWaveformView;
- (NSLayoutConstraint)closeButtonTopConstraint;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)contentViewTrailingConstraint;
- (NSLayoutConstraint)contentViewWidthConstraint;
- (NSLayoutConstraint)dismissLabelTopConstraint;
- (NSURL)recordedAnnouncementURL;
- (UIBlurEffect)blurEffect;
- (UIButton)closeButton;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILabel)announcementDeliveryFailureLabel;
- (UILabel)dismissLabel;
- (UILabel)errorStatusLabel;
- (UILabel)largeTitleLabel;
- (UILabel)recordingStateChangeLabel;
- (UILabel)subTitleLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)contentView;
- (UIVisualEffectView)closeButtonVisualEffectView;
- (UIVisualEffectView)dismissLabelVisualEffectView;
- (double)recordedDuration;
- (id)_contentViewBackgroundColor;
- (id)_fontForTimeCodeLabel;
- (id)_largeTitleTextColor;
- (id)_stringForDuration:(double)a3;
- (id)_waveformColor;
- (void)_commonInit;
- (void)_deleteAudioFile;
- (void)_deleteRecording:(id)a3;
- (void)_didPan:(id)a3;
- (void)_didTap:(id)a3;
- (void)_dismissDownRecordingView:(id)a3;
- (void)_dismissUpRecordingView:(id)a3;
- (void)_dismissViewOrDisplayError:(id)a3;
- (void)_hideRecordingUI;
- (void)_restoreRecordingUI;
- (void)_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4;
- (void)_updateUIBasedOnReachabilityStatus;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateReachableTransports:(id)a3;
- (void)audioRecorderDidStartRecording:(id)a3;
- (void)audioRecorderFailedToFinishRecording:(id)a3;
- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4;
- (void)beginRecording:(id)a3;
- (void)dealloc;
- (void)didUpdateAveragePower:(float)a3;
- (void)sendAnnouncement:(id)a3;
- (void)setAnnounce:(id)a3;
- (void)setAnnouncementDeliveryFailureLabel:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioWaveformView:(id)a3;
- (void)setBlurEffect:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseButtonTopConstraint:(id)a3;
- (void)setCloseButtonVisualEffectView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setContentViewTrailingConstraint:(id)a3;
- (void)setContentViewWidthConstraint:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setDismissLabel:(id)a3;
- (void)setDismissLabelTopConstraint:(id)a3;
- (void)setDismissLabelVisualEffectView:(id)a3;
- (void)setErrorStatusLabel:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setLargeTitleLabel:(id)a3;
- (void)setRecordButton:(id)a3;
- (void)setRecordedAnnouncementURL:(id)a3;
- (void)setRecordedDuration:(double)a3;
- (void)setRecordingDismissedByUser:(BOOL)a3;
- (void)setRecordingStateChangeLabel:(id)a3;
- (void)setServiceContext:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)stopRecordAndSend:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUAnnounceRecordingViewController

- (HUAnnounceRecordingViewController)initWithServiceContext:(id)a3 blurEffectStyle:(int64_t)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUAnnounceRecordingViewController;
  v8 = [(HUAnnounceRecordingViewController *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F427D8] effectWithStyle:a4];
    blurEffect = v8->_blurEffect;
    v8->_blurEffect = (UIBlurEffect *)v9;

    objc_storeStrong((id *)&v8->_serviceContext, a3);
    v11 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42AA8]);
    feedbackGenerator = v8->_feedbackGenerator;
    v8->_feedbackGenerator = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v8 action:sel__didTap_];
    tapGestureRecognizer = v8->_tapGestureRecognizer;
    v8->_tapGestureRecognizer = (UITapGestureRecognizer *)v13;

    [(UITapGestureRecognizer *)v8->_tapGestureRecognizer setDelegate:v8];
    v15 = [(HUAnnounceRecordingViewController *)v8 view];
    [v15 addGestureRecognizer:v8->_tapGestureRecognizer];

    v16 = (ANAnnounce *)objc_alloc_init(MEMORY[0x1E4F4A888]);
    announce = v8->_announce;
    v8->_announce = v16;

    [(HUAnnounceRecordingViewController *)v8 _commonInit];
  }

  return v8;
}

- (void)_commonInit
{
  v3 = [(HUAnnounceRecordingViewController *)self serviceContext];
  v4 = [v3 homeIdentifier];

  v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v6 = [v5 allHomesFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HUAnnounceRecordingViewController__commonInit__block_invoke;
  v9[3] = &unk_1E638C300;
  id v10 = v4;
  v11 = self;
  id v7 = v4;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

void __48__HUAnnounceRecordingViewController__commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Error fetching HomeKit Homes: %@", buf, 0xCu);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__HUAnnounceRecordingViewController__commonInit__block_invoke_2;
    v13[3] = &unk_1E638C2D8;
    v14 = *(id *)(a1 + 32);
    id v8 = objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    [*(id *)(a1 + 40) setCurrentHome:v8];
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 40) currentHome];
      v11 = [v10 uniqueIdentifier];
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Fetched HomeKit Homes: [%@] currentHome ID = [%@] ANHomeID = [%@]", buf, 0x20u);
    }
    [*(id *)(a1 + 40) _updateUIBasedOnReachabilityStatus];

    id v7 = v14;
  }
}

uint64_t __48__HUAnnounceRecordingViewController__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)viewDidLoad
{
  v297[1] = *MEMORY[0x1E4F143B8];
  v295.receiver = self;
  v295.super_class = (Class)HUAnnounceRecordingViewController;
  [(HUAnnounceRecordingViewController *)&v295 viewDidLoad];
  v3 = [(HUAnnounceRecordingViewController *)self view];
  [v3 setAlpha:0.0];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F68F28]) initWithAudioRecorderDelegate:self];
  [(HUAnnounceRecordingViewController *)self setAudioRecorder:v4];

  uint64_t v5 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v5 prepareRecording];

  id v6 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v6 playAlertSoundForType:0 withCompletion:0];

  id v7 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
  [v7 clearPowerLevels];

  id v8 = (void *)MEMORY[0x1E4F42FE8];
  uint64_t v9 = [(HUAnnounceRecordingViewController *)self blurEffect];
  id v10 = [v8 effectForBlurEffect:v9 style:1];

  v11 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v10];
  dismissLabelVisualEffectView = self->_dismissLabelVisualEffectView;
  self->_dismissLabelVisualEffectView = v11;

  uint64_t v13 = [(HUAnnounceRecordingViewController *)self view];
  objc_msgSend(v13, "naui_addAutoLayoutSubview:", self->_dismissLabelVisualEffectView);

  v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  dismissLabel = self->_dismissLabel;
  self->_dismissLabel = v14;

  id v16 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(UILabel *)self->_dismissLabel setFont:v16];

  [(UILabel *)self->_dismissLabel setTextAlignment:1];
  __int16 v17 = self->_dismissLabel;
  v18 = _HULocalizedStringWithDefaultValue(@"HUAnnounceDismissLabel_Title", @"HUAnnounceDismissLabel_Title", 1);
  [(UILabel *)v17 setText:v18];

  __int16 v19 = self->_dismissLabel;
  uint64_t v20 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v19 setTextColor:v20];

  [(UILabel *)self->_dismissLabel setAlpha:0.0];
  uint64_t v21 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView contentView];
  objc_msgSend(v21, "naui_addAutoLayoutSubview:", self->_dismissLabel);

  v22 = [(UILabel *)self->_dismissLabel text];
  v23 = [(HUAnnounceRecordingViewController *)self view];
  [v23 bounds];
  double v25 = v24;
  uint64_t v296 = *MEMORY[0x1E4F42508];
  v26 = [(UILabel *)self->_dismissLabel font];
  v297[0] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v297 forKeys:&v296 count:1];
  objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v27, 0, v25, 3.40282347e38);
  double v29 = v28;

  v30 = (void *)MEMORY[0x1E4F42FE8];
  v31 = [MEMORY[0x1E4F427D8] effectWithStyle:4];
  uint64_t v32 = [v30 effectForBlurEffect:v31 style:1];

  v290 = (void *)v32;
  v33 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v32];
  closeButtonVisualEffectView = self->_closeButtonVisualEffectView;
  self->_closeButtonVisualEffectView = v33;

  v35 = [(HUAnnounceRecordingViewController *)self view];
  objc_msgSend(v35, "naui_addAutoLayoutSubview:", self->_closeButtonVisualEffectView);

  v36 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  closeButton = self->_closeButton;
  self->_closeButton = v36;

  [(UIButton *)self->_closeButton addTarget:self action:sel__dismissDownRecordingView_ forControlEvents:64];
  v38 = self->_closeButton;
  v39 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_closeButtonImage");
  [(UIButton *)v38 setImage:v39 forState:0];

  v40 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView contentView];
  objc_msgSend(v40, "naui_addAutoLayoutSubview:", self->_closeButton);

  id v41 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v43 = *MEMORY[0x1E4F1DB28];
  double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v46 = (UIView *)objc_msgSend(v41, "initWithFrame:", *MEMORY[0x1E4F1DB28], v42, v45, v44);
  contentView = self->_contentView;
  self->_contentView = v46;

  v48 = self->_contentView;
  v49 = [(HUAnnounceRecordingViewController *)self _contentViewBackgroundColor];
  [(UIView *)v48 setBackgroundColor:v49];

  [(UIView *)self->_contentView _setContinuousCornerRadius:16.0];
  [(UIView *)self->_contentView setAlpha:0.0];
  v50 = [(HUAnnounceRecordingViewController *)self view];
  objc_msgSend(v50, "naui_addAutoLayoutSubview:", self->_contentView);

  v289 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__didPan_];
  -[UIView addGestureRecognizer:](self->_contentView, "addGestureRecognizer:");
  v51 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  largeTitleLabel = self->_largeTitleLabel;
  self->_largeTitleLabel = v51;

  v53 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438E8]];
  v54 = [v53 fontDescriptorWithSymbolicTraits:2];

  v55 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v54 size:0.0];
  [(UILabel *)self->_largeTitleLabel setFont:v55];

  [(UILabel *)self->_largeTitleLabel setTextAlignment:1];
  v56 = self->_largeTitleLabel;
  v57 = [(HUAnnounceRecordingViewController *)self _largeTitleTextColor];
  [(UILabel *)v56 setTextColor:v57];

  [(UILabel *)self->_largeTitleLabel setAlpha:0.0];
  [(UILabel *)self->_largeTitleLabel setLineBreakMode:4];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_largeTitleLabel];
  v58 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  subTitleLabel = self->_subTitleLabel;
  self->_subTitleLabel = v58;

  v60 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C0]];
  [(UILabel *)self->_subTitleLabel setFont:v60];

  v61 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_subTitleLabel setTextColor:v61];

  [(UILabel *)self->_subTitleLabel setTextAlignment:1];
  [(UILabel *)self->_subTitleLabel setAlpha:0.0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_subTitleLabel];
  v62 = [HUWaveformView alloc];
  v63 = [(HUAnnounceRecordingViewController *)self _waveformColor];
  v64 = [MEMORY[0x1E4F428B8] systemGrayColor];
  v65 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v62, "initWithFrame:waveformColor:backgroundColor:", v63, v64, v43, v42, v45, v44);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v65;

  [(HUWaveformView *)self->_audioWaveformView setAlpha:0.0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_audioWaveformView];
  v67 = [(HUAnnounceRecordingViewController *)self serviceContext];
  v68 = [v67 roomName];
  v69 = v68;
  if (v68)
  {
    id v291 = v68;
  }
  else
  {
    v70 = [(HUAnnounceRecordingViewController *)self serviceContext];
    id v291 = [v70 homeName];
  }
  v71 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v43, v42, v45, v44);
  announcementDeliveryFailureLabel = self->_announcementDeliveryFailureLabel;
  self->_announcementDeliveryFailureLabel = v71;

  [(UILabel *)self->_announcementDeliveryFailureLabel setAlpha:0.0];
  v73 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  [(UILabel *)self->_announcementDeliveryFailureLabel setFont:v73];

  [(UILabel *)self->_announcementDeliveryFailureLabel setTextAlignment:1];
  v74 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_announcementDeliveryFailureLabel setTextColor:v74];

  v81 = HULocalizedStringWithFormat(@"HUAnnounceNotDeliveredLabel_Description", @"%@", v75, v76, v77, v78, v79, v80, (uint64_t)v291);
  [(UILabel *)self->_announcementDeliveryFailureLabel setText:v81];

  [(UILabel *)self->_announcementDeliveryFailureLabel setNumberOfLines:0];
  [(UILabel *)self->_announcementDeliveryFailureLabel setLineBreakMode:0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_announcementDeliveryFailureLabel];
  v82 = [HURecordingButton alloc];
  v83 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
  v84 = -[HURecordingButton initWithSize:state:image:](v82, "initWithSize:state:image:", 0, v83, 72.0, 72.0);
  recordButton = self->_recordButton;
  self->_recordButton = v84;

  [(HURecordingButton *)self->_recordButton setAlpha:0.0];
  [(HURecordingButton *)self->_recordButton setIsAccessibilityElement:1];
  v86 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
  [(HURecordingButton *)self->_recordButton setAccessibilityLabel:v86];

  v87 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Hint", @"HUAnnounceRecordButton_AX_Label_Hint", 1);
  [(HURecordingButton *)self->_recordButton setAccessibilityHint:v87];

  [(HURecordingButton *)self->_recordButton addTarget:self action:sel_beginRecording_ forControlEvents:64];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_recordButton];
  v88 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  recordingStateChangeLabel = self->_recordingStateChangeLabel;
  self->_recordingStateChangeLabel = v88;

  uint64_t v90 = *MEMORY[0x1E4F43890];
  v91 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [(UILabel *)self->_recordingStateChangeLabel setFont:v91];

  v92 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [(UILabel *)self->_recordingStateChangeLabel setTextColor:v92];

  [(UILabel *)self->_recordingStateChangeLabel setTextAlignment:1];
  [(UILabel *)self->_recordingStateChangeLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_recordingStateChangeLabel setAlpha:0.0];
  [(UILabel *)self->_recordingStateChangeLabel setIsAccessibilityElement:0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_recordingStateChangeLabel];
  v93 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  errorStatusLabel = self->_errorStatusLabel;
  self->_errorStatusLabel = v93;

  v95 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v90];
  [(UILabel *)self->_errorStatusLabel setFont:v95];

  v96 = [MEMORY[0x1E4F428B8] systemRedColor];
  [(UILabel *)self->_errorStatusLabel setTextColor:v96];

  [(UILabel *)self->_errorStatusLabel setTextAlignment:1];
  [(UILabel *)self->_errorStatusLabel setNumberOfLines:0];
  [(UILabel *)self->_errorStatusLabel setAlpha:0.0];
  [(UIView *)self->_contentView naui_addAutoLayoutSubview:self->_errorStatusLabel];
  v97 = objc_opt_new();
  v98 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v99 = [v98 userInterfaceIdiom];

  v100 = self->_dismissLabelVisualEffectView;
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v101 = [(UIVisualEffectView *)v100 centerXAnchor];
    v102 = [(UIView *)self->_contentView centerXAnchor];
    v103 = [v101 constraintEqualToAnchor:v102];
    [v97 addObject:v103];
  }
  else
  {
    v101 = [(UIVisualEffectView *)v100 leadingAnchor];
    v102 = [(HUAnnounceRecordingViewController *)self view];
    v103 = [v102 safeAreaLayoutGuide];
    v104 = [v103 leadingAnchor];
    v105 = [v101 constraintEqualToAnchor:v104];
    [v97 addObject:v105];
  }
  v106 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView trailingAnchor];
  v107 = [(HUAnnounceRecordingViewController *)self view];
  v108 = [v107 safeAreaLayoutGuide];
  v109 = [v108 trailingAnchor];
  v110 = [v106 constraintEqualToAnchor:v109];
  [v97 addObject:v110];

  v111 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView topAnchor];
  v112 = [(HUAnnounceRecordingViewController *)self view];
  v113 = [v112 safeAreaLayoutGuide];
  v114 = [v113 topAnchor];
  v115 = [v111 constraintEqualToAnchor:v114 constant:-25.0];
  dismissLabelTopConstraint = self->_dismissLabelTopConstraint;
  self->_dismissLabelTopConstraint = v115;

  [v97 addObject:self->_dismissLabelTopConstraint];
  v117 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView heightAnchor];
  v118 = [v117 constraintEqualToConstant:v29];
  [v97 addObject:v118];

  v119 = [(UILabel *)self->_dismissLabel leadingAnchor];
  v120 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView leadingAnchor];
  v121 = [v119 constraintEqualToAnchor:v120];
  [v97 addObject:v121];

  v122 = [(UILabel *)self->_dismissLabel trailingAnchor];
  v123 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView trailingAnchor];
  v124 = [v122 constraintEqualToAnchor:v123];
  [v97 addObject:v124];

  v125 = [(UILabel *)self->_dismissLabel topAnchor];
  v126 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView topAnchor];
  v127 = [v125 constraintEqualToAnchor:v126];
  [v97 addObject:v127];

  v128 = [(UILabel *)self->_dismissLabel heightAnchor];
  v129 = [(UIVisualEffectView *)self->_dismissLabelVisualEffectView heightAnchor];
  v130 = [v128 constraintEqualToAnchor:v129];
  [v97 addObject:v130];

  v131 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView topAnchor];
  v132 = [(HUAnnounceRecordingViewController *)self view];
  v133 = [v132 topAnchor];
  v134 = [v131 constraintEqualToAnchor:v133 constant:30.0];
  closeButtonTopConstraint = self->_closeButtonTopConstraint;
  self->_closeButtonTopConstraint = v134;

  [v97 addObject:self->_closeButtonTopConstraint];
  v136 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView trailingAnchor];
  v137 = [(HUAnnounceRecordingViewController *)self view];
  v138 = [v137 safeAreaLayoutGuide];
  v139 = [v138 trailingAnchor];
  v140 = [v136 constraintEqualToAnchor:v139 constant:-16.0];
  [v97 addObject:v140];

  v141 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v142 = [v141 constraintEqualToConstant:30.0];
  [v97 addObject:v142];

  v143 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView widthAnchor];
  v144 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v145 = [v143 constraintEqualToAnchor:v144];
  [v97 addObject:v145];

  v146 = [(UIButton *)self->_closeButton topAnchor];
  v147 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView topAnchor];
  v148 = [v146 constraintEqualToAnchor:v147];
  [v97 addObject:v148];

  v149 = [(UIButton *)self->_closeButton trailingAnchor];
  v150 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView trailingAnchor];
  v151 = [v149 constraintEqualToAnchor:v150];
  [v97 addObject:v151];

  v152 = [(UIButton *)self->_closeButton heightAnchor];
  v153 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView heightAnchor];
  v154 = [v152 constraintEqualToAnchor:v153];
  [v97 addObject:v154];

  v155 = [(UIButton *)self->_closeButton widthAnchor];
  v156 = [(UIButton *)self->_closeButton heightAnchor];
  v157 = [v155 constraintEqualToAnchor:v156];
  [v97 addObject:v157];

  v158 = [MEMORY[0x1E4F42D90] mainScreen];
  [v158 bounds];
  double v160 = v159;

  v161 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v162 = [v161 userInterfaceIdiom];

  unint64_t v163 = v162 & 0xFFFFFFFFFFFFFFFBLL;
  v164 = [(UIView *)self->_contentView topAnchor];
  if (v163 == 1)
  {
    v165 = [(HUAnnounceRecordingViewController *)self view];
    v166 = [v165 topAnchor];
    v167 = [v164 constraintEqualToAnchor:v166 constant:30.0];
    contentViewTopConstraint = self->_contentViewTopConstraint;
    self->_contentViewTopConstraint = v167;

    [v97 addObject:self->_contentViewTopConstraint];
    v169 = [(HUAnnounceRecordingViewController *)self serviceContext];
    [v169 animationOriginRect];
    v300.origin.x = v43;
    v300.origin.y = v42;
    v300.size.width = v45;
    v300.size.height = v44;
    BOOL v170 = CGRectEqualToRect(v298, v300);

    if (v170)
    {
      v171 = [(UIView *)self->_contentView trailingAnchor];
      v172 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView leadingAnchor];
      v173 = [v171 constraintEqualToAnchor:v172 constant:-8.0];
      [v97 addObject:v173];
    }
    else
    {
      v183 = [(HUAnnounceRecordingViewController *)self serviceContext];
      [v183 animationOriginRect];
      double v185 = v160 - v184 + 30.0;

      v186 = [(UIView *)self->_contentView trailingAnchor];
      v187 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView leadingAnchor];
      v188 = [v186 constraintEqualToAnchor:v187 constant:v185];
      contentViewTrailingConstraint = self->_contentViewTrailingConstraint;
      self->_contentViewTrailingConstraint = v188;

      [v97 addObject:self->_contentViewTrailingConstraint];
    }
  }
  else
  {
    v174 = [(UIVisualEffectView *)self->_closeButtonVisualEffectView bottomAnchor];
    v175 = [v164 constraintEqualToAnchor:v174 constant:8.0];
    [v97 addObject:v175];

    v176 = [(HUAnnounceRecordingViewController *)self serviceContext];
    [v176 animationOriginRect];
    v301.origin.x = v43;
    v301.origin.y = v42;
    v301.size.width = v45;
    v301.size.height = v44;
    BOOL v177 = CGRectEqualToRect(v299, v301);

    if (v177)
    {
      v178 = [(UIView *)self->_contentView trailingAnchor];
      v179 = [(HUAnnounceRecordingViewController *)self view];
      v180 = [v179 safeAreaLayoutGuide];
      v181 = [v180 trailingAnchor];
      v182 = [v178 constraintEqualToAnchor:v181 constant:-10.0];
      [v97 addObject:v182];
    }
    else
    {
      v190 = [(HUAnnounceRecordingViewController *)self serviceContext];
      [v190 animationOriginRect];
      double v192 = v160 - v191;

      v193 = [(UIView *)self->_contentView trailingAnchor];
      v194 = [(HUAnnounceRecordingViewController *)self view];
      v195 = [v194 safeAreaLayoutGuide];
      v196 = [v195 trailingAnchor];
      v197 = [v193 constraintEqualToAnchor:v196 constant:-v192];
      v198 = self->_contentViewTrailingConstraint;
      self->_contentViewTrailingConstraint = v197;

      [v97 addObject:self->_contentViewTrailingConstraint];
    }
  }
  v199 = [(UIView *)self->_contentView widthAnchor];
  v200 = [v199 constraintEqualToConstant:100.0];
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v200;

  [v97 addObject:self->_contentViewWidthConstraint];
  v202 = [(UIView *)self->_contentView heightAnchor];
  v203 = [v202 constraintEqualToConstant:0.0];
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v203;

  [v97 addObject:self->_contentViewHeightConstraint];
  v205 = [(UILabel *)self->_largeTitleLabel topAnchor];
  v206 = [(UIView *)self->_contentView topAnchor];
  v207 = [v205 constraintEqualToAnchor:v206 constant:48.0];
  [v97 addObject:v207];

  v208 = [(UILabel *)self->_largeTitleLabel centerXAnchor];
  v209 = [(UIView *)self->_contentView centerXAnchor];
  v210 = [v208 constraintEqualToAnchor:v209];
  [v97 addObject:v210];

  v211 = [(UILabel *)self->_largeTitleLabel leadingAnchor];
  v212 = [(UIView *)self->_contentView leadingAnchor];
  v213 = [v211 constraintEqualToAnchor:v212];
  [v97 addObject:v213];

  v214 = [(UILabel *)self->_largeTitleLabel trailingAnchor];
  v215 = [(UIView *)self->_contentView trailingAnchor];
  v216 = [v214 constraintEqualToAnchor:v215];
  [v97 addObject:v216];

  v217 = [(UILabel *)self->_subTitleLabel topAnchor];
  v218 = [(UILabel *)self->_largeTitleLabel bottomAnchor];
  v219 = [v217 constraintEqualToAnchor:v218];
  [v97 addObject:v219];

  v220 = [(UILabel *)self->_subTitleLabel centerXAnchor];
  v221 = [(UIView *)self->_contentView centerXAnchor];
  v222 = [v220 constraintEqualToAnchor:v221];
  [v97 addObject:v222];

  v223 = [(HUWaveformView *)self->_audioWaveformView leadingAnchor];
  v224 = [(UIView *)self->_contentView leadingAnchor];
  v225 = [v223 constraintEqualToAnchor:v224];
  [v97 addObject:v225];

  v226 = [(HUWaveformView *)self->_audioWaveformView trailingAnchor];
  v227 = [(UIView *)self->_contentView trailingAnchor];
  v228 = [v226 constraintEqualToAnchor:v227];
  [v97 addObject:v228];

  v229 = [(HUWaveformView *)self->_audioWaveformView centerYAnchor];
  v230 = [(UIView *)self->_contentView centerYAnchor];
  v231 = [v229 constraintEqualToAnchor:v230];
  [v97 addObject:v231];

  v232 = [(HUWaveformView *)self->_audioWaveformView heightAnchor];
  v233 = [v232 constraintEqualToConstant:100.0];
  [v97 addObject:v233];

  v234 = [(HUWaveformView *)self->_audioWaveformView topAnchor];
  v235 = [(UILabel *)self->_subTitleLabel bottomAnchor];
  v236 = [v234 constraintEqualToAnchor:v235 constant:20.0];

  LODWORD(v237) = 1132068864;
  [v236 setPriority:v237];
  [v97 addObject:v236];
  v238 = [(UILabel *)self->_announcementDeliveryFailureLabel leadingAnchor];
  v239 = [(UIView *)self->_contentView leadingAnchor];
  v240 = [v238 constraintEqualToAnchor:v239];
  [v97 addObject:v240];

  v241 = [(UILabel *)self->_announcementDeliveryFailureLabel trailingAnchor];
  v242 = [(UIView *)self->_contentView trailingAnchor];
  v243 = [v241 constraintEqualToAnchor:v242];
  [v97 addObject:v243];

  v244 = [(UILabel *)self->_announcementDeliveryFailureLabel centerYAnchor];
  v245 = [(UIView *)self->_contentView centerYAnchor];
  v246 = [v244 constraintEqualToAnchor:v245];
  [v97 addObject:v246];

  v247 = [(HURecordingButton *)self->_recordButton topAnchor];
  v248 = [(UILabel *)self->_announcementDeliveryFailureLabel bottomAnchor];
  v249 = [v247 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v248 multiplier:1.0];
  [v97 addObject:v249];

  v250 = [(HURecordingButton *)self->_recordButton heightAnchor];
  v251 = [v250 constraintEqualToConstant:72.0];
  [v97 addObject:v251];

  v252 = [(HURecordingButton *)self->_recordButton widthAnchor];
  v253 = [(HURecordingButton *)self->_recordButton heightAnchor];
  v254 = [v252 constraintEqualToAnchor:v253];
  [v97 addObject:v254];

  v255 = [(HURecordingButton *)self->_recordButton centerXAnchor];
  v256 = [(UIView *)self->_contentView centerXAnchor];
  v257 = [v255 constraintEqualToAnchor:v256];
  [v97 addObject:v257];

  v258 = [(UILabel *)self->_recordingStateChangeLabel centerXAnchor];
  v259 = [(UIView *)self->_contentView centerXAnchor];
  v260 = [v258 constraintEqualToAnchor:v259];
  [v97 addObject:v260];

  v261 = [(UILabel *)self->_recordingStateChangeLabel topAnchor];
  v262 = [(HURecordingButton *)self->_recordButton bottomAnchor];
  v263 = [v261 constraintEqualToAnchor:v262 constant:8.0];
  [v97 addObject:v263];

  v264 = [(UILabel *)self->_recordingStateChangeLabel bottomAnchor];
  v265 = [(UIView *)self->_contentView bottomAnchor];
  v266 = [v264 constraintEqualToAnchor:v265 constant:-20.0];
  [v97 addObject:v266];

  v267 = [(HURecordingButton *)self->_recordButton topAnchor];
  v268 = [(UILabel *)self->_errorStatusLabel bottomAnchor];
  v269 = [v267 constraintEqualToAnchor:v268 constant:20.0];
  [v97 addObject:v269];

  v270 = [(UILabel *)self->_errorStatusLabel centerXAnchor];
  v271 = [(UIView *)self->_contentView centerXAnchor];
  v272 = [v270 constraintEqualToAnchor:v271];
  [v97 addObject:v272];

  v273 = [(UILabel *)self->_errorStatusLabel leadingAnchor];
  v274 = [(UIView *)self->_contentView leadingAnchor];
  v275 = [v273 constraintEqualToAnchor:v274];
  [v97 addObject:v275];

  v276 = [(UILabel *)self->_errorStatusLabel trailingAnchor];
  v277 = [(UIView *)self->_contentView trailingAnchor];
  v278 = [v276 constraintEqualToAnchor:v277];
  [v97 addObject:v278];

  [MEMORY[0x1E4F28DC8] activateConstraints:v97];
  v279 = [(HUAnnounceRecordingViewController *)self view];
  [v279 layoutIfNeeded];

  v280 = [(HUAnnounceRecordingViewController *)self largeTitleLabel];
  [v280 becomeFirstResponder];

  v281 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v281 addAccessoryObserver:self];

  v282 = [(HUAnnounceRecordingViewController *)self serviceContext];
  v283 = [v282 roomName];
  v284 = v283;
  if (v283)
  {
    id v285 = v283;
  }
  else
  {
    v286 = [(HUAnnounceRecordingViewController *)self serviceContext];
    id v285 = [v286 homeName];
  }
  v287 = (void *)MEMORY[0x1E4F42FF0];
  v292[4] = self;
  v293[0] = MEMORY[0x1E4F143A8];
  v293[1] = 3221225472;
  v293[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke;
  v293[3] = &unk_1E63850E0;
  v293[4] = self;
  id v294 = v285;
  v292[0] = MEMORY[0x1E4F143A8];
  v292[1] = 3221225472;
  v292[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_3;
  v292[3] = &unk_1E6386730;
  id v288 = v285;
  [v287 animateWithDuration:v293 animations:v292 completion:0.5];
}

void __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_1E63850E0;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v10, v7, v8, v9);
}

void __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentViewHeightConstraint];
  [v2 setConstant:500.0];

  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v5 = *(void **)(a1 + 32);
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v6 = [v5 contentViewWidthConstraint];
    [v6 setConstant:395.0];

    double v7 = [*(id *)(a1 + 32) contentViewTrailingConstraint];

    if (!v7) {
      goto LABEL_7;
    }
    double v8 = [*(id *)(a1 + 32) contentViewTrailingConstraint];
    double v9 = v8;
    double v10 = -8.0;
  }
  else
  {
    id v11 = [v5 view];
    [v11 bounds];
    double v13 = v12 + -20.0;
    v14 = [*(id *)(a1 + 32) contentViewWidthConstraint];
    [v14 setConstant:v13];

    v15 = [*(id *)(a1 + 32) contentViewTrailingConstraint];

    if (!v15) {
      goto LABEL_7;
    }
    double v8 = [*(id *)(a1 + 32) contentViewTrailingConstraint];
    double v9 = v8;
    double v10 = -10.0;
  }
  [v8 setConstant:v10];

LABEL_7:
  id v16 = [*(id *)(a1 + 32) contentView];
  [v16 setAlpha:1.0];

  __int16 v17 = [*(id *)(a1 + 32) view];
  [v17 setAlpha:1.0];

  v18 = [*(id *)(a1 + 32) largeTitleLabel];
  [v18 setAlpha:1.0];

  __int16 v19 = [*(id *)(a1 + 32) subTitleLabel];
  [v19 setAlpha:1.0];

  uint64_t v20 = [*(id *)(a1 + 32) recordButton];
  [v20 setAlpha:1.0];

  uint64_t v21 = [*(id *)(a1 + 32) recordingStateChangeLabel];
  [v21 setAlpha:1.0];

  v22 = [*(id *)(a1 + 32) largeTitleLabel];
  double v29 = HULocalizedStringWithFormat(@"HUAnnounceRecipient_Title", @"%@", v23, v24, v25, v26, v27, v28, *(void *)(a1 + 40));
  [v22 setText:v29];

  v30 = [*(id *)(a1 + 32) subTitleLabel];
  v31 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSubtitle_Title", @"HUAnnounceSubtitle_Title", 1);
  [v30 setText:v31];

  uint64_t v32 = [*(id *)(a1 + 32) recordingStateChangeLabel];
  v33 = _HULocalizedStringWithDefaultValue(@"HUAnnounceBeginRecordingLabel_Title", @"HUAnnounceBeginRecordingLabel_Title", 1);
  [v32 setText:v33];

  id v34 = [*(id *)(a1 + 32) view];
  [v34 layoutIfNeeded];
}

uint64_t __48__HUAnnounceRecordingViewController_viewDidLoad__block_invoke_3(uint64_t result, int a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = result;
    int v3 = [*(id *)(result + 32) _areAllHomePodsOffline];
    if ([*(id *)(v2 + 32) _isRoomContext])
    {
      uint64_t v4 = [*(id *)(v2 + 32) currentHome];
      id v5 = objc_alloc(MEMORY[0x1E4F29128]);
      id v6 = [*(id *)(v2 + 32) serviceContext];
      double v7 = [v6 roomIdentifier];
      double v8 = (void *)[v5 initWithUUIDString:v7];
      double v9 = objc_msgSend(v4, "hf_roomWithIdentifier:", v8);

      int v10 = objc_msgSend(v9, "hf_hasAtLeastOneAnnounceSupportedAccessory");
      if (v10) {
        int v11 = objc_msgSend(v9, "hf_hasAtLeastOneReachableHomeMediaAccessory");
      }
      else {
        int v11 = 0;
      }
      double v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v9 uniqueIdentifier];
        int v20 = 138412802;
        *(void *)uint64_t v21 = v14;
        *(_WORD *)&v21[8] = 1024;
        int v22 = v10;
        __int16 v23 = 1024;
        int v24 = v11;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Room ID [%@], hasAtleastOneHomePodInThisRoom:%{BOOL}d, isAtleastOneHomePodOnlineInThisRoom:%{BOOL}d", (uint8_t *)&v20, 0x18u);
      }
      int v12 = v10 ^ 1;
    }
    else
    {
      int v11 = 0;
      int v12 = 1;
    }
    if ([*(id *)(v2 + 32) _isRoomContext]) {
      int v15 = v11 | v12;
    }
    else {
      int v15 = 0;
    }
    int v16 = [*(id *)(v2 + 32) _isHomeContext] & (v3 ^ 1);
    __int16 v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109376;
      *(_DWORD *)uint64_t v21 = v15;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v16;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "shouldBeginRecordingForRoom:%{BOOL}d, shouldBeginRecordingForHome:%{BOOL}d", (uint8_t *)&v20, 0xEu);
    }

    v18 = *(void **)(v2 + 32);
    if ((v15 | v16) == 1)
    {
      __int16 v19 = [v18 feedbackGenerator];
      [v19 prepare];

      return [*(id *)(v2 + 32) beginRecording:0];
    }
    else
    {
      return [v18 _updateUIBasedOnReachabilityStatus];
    }
  }
  return result;
}

- (void)dealloc
{
  int v3 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    id v5 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    [v5 stopRecording];
  }
  [(HUAnnounceRecordingViewController *)self _deleteAudioFile];
  v6.receiver = self;
  v6.super_class = (Class)HUAnnounceRecordingViewController;
  [(HUAnnounceRecordingViewController *)&v6 dealloc];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  int v4 = [(HUAnnounceRecordingViewController *)self contentView];
  id v5 = [(HUAnnounceRecordingViewController *)self _contentViewBackgroundColor];
  [v4 setBackgroundColor:v5];

  objc_super v6 = [(HUAnnounceRecordingViewController *)self largeTitleLabel];
  double v7 = [(HUAnnounceRecordingViewController *)self _largeTitleTextColor];
  [v6 setTextColor:v7];

  id v9 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
  double v8 = [(HUAnnounceRecordingViewController *)self _waveformColor];
  [v9 setWaveformColor:v8];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUAnnounceRecordingViewController;
  -[HUAnnounceRecordingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v7 = [(HUAnnounceRecordingViewController *)self contentViewWidthConstraint];
    [v7 setConstant:395.0];
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)beginRecording:(id)a3
{
  int v4 = [(HUAnnounceRecordingViewController *)self view];
  [v4 layoutIfNeeded];

  id v5 = [(HUAnnounceRecordingViewController *)self audioRecorder];

  if (!v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F68F28]) initWithAudioRecorderDelegate:self];
    [(HUAnnounceRecordingViewController *)self setAudioRecorder:v6];

    double v7 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    [v7 prepareRecording];

    objc_super v8 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    [v8 playAlertSoundForType:0 withCompletion:0];

    id v9 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
    [v9 clearPowerLevels];
  }
  int v10 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  char v11 = [v10 isRecording];

  if ((v11 & 1) == 0)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F4A888]);
    [v12 prewarmWithHandler:0];
    double v13 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
    [v13 impactOccurredWithIntensity:1.0];

    v14 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
    [v14 prepare];

    int v15 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    [v15 setRecordingDurationLimit:60.0];

    int v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Calling startRecording", buf, 2u);
    }

    __int16 v17 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    [v17 startRecording];

    v18 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    __int16 v19 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordingStopLabel_Title", @"HUAnnounceRecordingStopLabel_Title", 1);
    [v18 setText:v19];

    int v20 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    [v20 setEnabled:1];

    uint64_t v21 = [(HUAnnounceRecordingViewController *)self recordButton];
    int v22 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonStopImage");
    [v21 setImage:v22 forState:4 animated:1];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__HUAnnounceRecordingViewController_beginRecording___block_invoke;
    v27[3] = &unk_1E6386018;
    v27[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v27 animations:0.25];
    __int16 v23 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopRecordButton_AX_Label_Title", @"HUAnnounceStopRecordButton_AX_Label_Title", 1);
    int v24 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v24 setAccessibilityLabel:v23];

    uint64_t v25 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopRecordButton_AX_Label_Hint", @"HUAnnounceStopRecordButton_AX_Label_Hint", 1);
    uint64_t v26 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v26 setAccessibilityHint:v25];
  }
}

void __52__HUAnnounceRecordingViewController_beginRecording___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) audioWaveformView];
  [v2 setAlpha:1.0];

  int v3 = [*(id *)(a1 + 32) announcementDeliveryFailureLabel];
  [v3 setAlpha:0.0];

  int v4 = [*(id *)(a1 + 32) errorStatusLabel];
  [v4 setAlpha:0.0];

  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];

  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Waveform is now shown", v7, 2u);
  }
}

- (void)stopRecordAndSend:(id)a3
{
  int v4 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
  [v4 prepare];

  id v5 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v5 setEnabled:0];

  id v6 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v6 stopRecording];
}

- (void)sendAnnouncement:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  int v4 = [(HUAnnounceRecordingViewController *)self serviceContext];
  id v5 = [v4 roomIdentifier];

  id v6 = [(HUAnnounceRecordingViewController *)self announce];
  double v7 = [(HUAnnounceRecordingViewController *)self recordedAnnouncementURL];
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  id v9 = [(HUAnnounceRecordingViewController *)self serviceContext];
  int v10 = v9;
  if (v5)
  {
    char v11 = [v9 roomIdentifier];
    id v12 = (void *)[v8 initWithUUIDString:v11];
    v20[0] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v14 = objc_alloc(MEMORY[0x1E4F29128]);
    int v15 = [(HUAnnounceRecordingViewController *)self serviceContext];
    int v16 = [v15 homeIdentifier];
    __int16 v17 = (void *)[v14 initWithUUIDString:v16];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke;
    v19[3] = &unk_1E638C328;
    v19[4] = self;
    [v6 sendAnnouncement:v7 toRoomsWithIDs:v13 andZonesWithIDs:MEMORY[0x1E4F1CBF0] inHomeWithID:v17 completion:v19];
  }
  else
  {
    char v11 = [v9 homeIdentifier];
    id v12 = (void *)[v8 initWithUUIDString:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_2;
    v18[3] = &unk_1E638C328;
    v18[4] = self;
    [v6 sendAnnouncement:v7 toHomeWithID:v12 completion:v18];
  }
}

void __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v7 = [*(id *)(a1 + 32) serviceContext];
      id v8 = [v7 roomIdentifier];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Room with ID [%@] - [%@]", buf, 0x16u);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_72;
  v9[3] = &unk_1E63850E0;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewOrDisplayError:*(void *)(a1 + 40)];
}

void __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v7 = [*(id *)(a1 + 32) serviceContext];
      id v8 = [v7 homeIdentifier];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Home with ID [%@] - [%@]", buf, 0x16u);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_74;
  v9[3] = &unk_1E63850E0;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __54__HUAnnounceRecordingViewController_sendAnnouncement___block_invoke_74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewOrDisplayError:*(void *)(a1 + 40)];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  double v7 = [a4 view];
  id v8 = [(HUAnnounceRecordingViewController *)self recordButton];
  if (v7 == v8)
  {
    id v10 = [(HUAnnounceRecordingViewController *)self tapGestureRecognizer];
    BOOL v9 = v10 != v6;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_didTap:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAnnounceRecordingViewController *)self view];
  [v4 locationOfTouch:0 inView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(HUAnnounceRecordingViewController *)self contentView];
  [v10 frame];
  double v12 = v11;
  __int16 v13 = [(HUAnnounceRecordingViewController *)self contentView];
  [v13 frame];
  if (v9 > v12 + v14)
  {
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v15 = [(HUAnnounceRecordingViewController *)self contentView];
    [v15 frame];
    BOOL v17 = v9 < v16;
  }
  v18 = [(HUAnnounceRecordingViewController *)self contentView];
  [v18 frame];
  double v20 = v19;

  uint64_t v21 = [MEMORY[0x1E4F42948] currentDevice];
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
    [(HUAnnounceRecordingViewController *)self _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:1 interruptedByUser:1];
    [(HUAnnounceRecordingViewController *)self _dismissUpRecordingView:0];
  }
}

- (void)_didPan:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAnnounceRecordingViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;

  uint64_t v8 = [v4 state];
  if (v8 == 3)
  {
    double v9 = [(HUAnnounceRecordingViewController *)self closeButtonTopConstraint];
    [v9 constant];
    double v11 = v10;

    if (v11 > 120.0)
    {
      [(HUAnnounceRecordingViewController *)self _dismissDownRecordingView:0];
      return;
    }
    uint64_t v22 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v23 = [v22 userInterfaceIdiom];

    if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      char v24 = [(HUAnnounceRecordingViewController *)self contentViewTopConstraint];
      [v24 setConstant:30.0];
    }
    uint64_t v25 = [(HUAnnounceRecordingViewController *)self closeButtonTopConstraint];
    [v25 setConstant:30.0];

    [(NSLayoutConstraint *)self->_dismissLabelTopConstraint setConstant:-25.0];
    [(UILabel *)self->_dismissLabel setAlpha:0.0];
    id v26 = [(HUAnnounceRecordingViewController *)self view];
    [v26 setNeedsLayout];
    goto LABEL_15;
  }
  if (v7 > 49.0)
  {
    double v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v14 = [(HUAnnounceRecordingViewController *)self contentViewTopConstraint];
      [v14 setConstant:v7];
    }
    uint64_t v15 = [(HUAnnounceRecordingViewController *)self closeButtonTopConstraint];
    [v15 setConstant:v7];

    double v16 = v7 + -25.0;
    [(NSLayoutConstraint *)self->_dismissLabelTopConstraint setConstant:v16];
    BOOL v17 = [(HUAnnounceRecordingViewController *)self dismissLabel];
    [v17 setAlpha:v16 / 120.0];

    v18 = [(HUAnnounceRecordingViewController *)self view];
    [v18 layoutIfNeeded];

    double v19 = [(HUAnnounceRecordingViewController *)self closeButtonTopConstraint];
    [v19 constant];
    double v21 = v20;

    if (v21 > 120.0)
    {
      id v26 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
      [v26 impactOccurredWithIntensity:1.0];
LABEL_15:
    }
  }
}

- (void)_dismissUpRecordingView:(id)a3
{
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke;
  v4[3] = &unk_1E6386018;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_3;
  v3[3] = &unk_1E6386730;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:v3 animations:0.25 completion:0.0];
}

uint64_t __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dismissLabel];
  [v2 setAlpha:0.0];

  int v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = [*(id *)(a1 + 32) contentViewTrailingConstraint];

  if (v6)
  {
    double v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = [*(id *)(a1 + 32) serviceContext];
    [v9 animationOriginRect];
    double v11 = v10;

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v12 = v5 - (v11 + 8.0);
    }
    else {
      double v12 = -(v5 - v11);
    }
    uint64_t v13 = [*(id *)(a1 + 32) contentViewTrailingConstraint];
    [v13 setConstant:v12];
  }
  double v14 = [*(id *)(a1 + 32) contentViewHeightConstraint];
  [v14 setConstant:0.0];

  uint64_t v15 = [*(id *)(a1 + 32) contentViewWidthConstraint];
  [v15 setConstant:100.0];

  double v16 = [*(id *)(a1 + 32) contentView];
  [v16 setAlpha:0.0];

  BOOL v17 = [*(id *)(a1 + 32) view];
  [v17 setAlpha:0.0];

  v18 = [*(id *)(a1 + 32) largeTitleLabel];
  [v18 setAlpha:0.0];

  double v19 = [*(id *)(a1 + 32) subTitleLabel];
  [v19 setAlpha:0.0];

  double v20 = [*(id *)(a1 + 32) recordButton];
  [v20 setAlpha:0.0];

  double v21 = [*(id *)(a1 + 32) recordingStateChangeLabel];
  [v21 setAlpha:0.0];

  uint64_t v22 = [*(id *)(a1 + 32) parentViewController];
  uint64_t v23 = [v22 view];
  [v23 setAlpha:0.0];

  id v24 = [*(id *)(a1 + 32) view];
  [v24 layoutIfNeeded];
}

void __61__HUAnnounceRecordingViewController__dismissUpRecordingView___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) serviceContext];
    uint64_t v2 = [v3 remoteViewControllerProxy];
    [v2 invalidate];
  }
}

- (void)_dismissDownRecordingView:(id)a3
{
  [(HUAnnounceRecordingViewController *)self _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:1 interruptedByUser:1];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke;
  v5[3] = &unk_1E6386018;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_3;
  v4[3] = &unk_1E6386730;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v5 options:v4 animations:0.5 completion:0.0];
}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_2;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v4 = [*(id *)(a1 + 32) view];
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

  double v12 = [*(id *)(a1 + 32) dismissLabel];
  [v12 setAlpha:0.0];

  id v13 = [*(id *)(a1 + 32) view];
  [v13 layoutIfNeeded];
}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 32) contentView];
    [v3 setAlpha:0.0];

    double v4 = [*(id *)(v2 + 32) closeButtonVisualEffectView];
    [v4 setAlpha:0.0];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_4;
    v6[3] = &unk_1E6386018;
    uint64_t v7 = *(void *)(v2 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_6;
    v5[3] = &unk_1E6386730;
    v5[4] = v7;
    return [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5 completion:0.25];
  }
  return result;
}

uint64_t __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_5;
  v4[3] = &unk_1E6386018;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1769474, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentViewController];
  v1 = [v2 view];
  [v1 setAlpha:0.0];
}

void __63__HUAnnounceRecordingViewController__dismissDownRecordingView___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceContext];
  v1 = [v2 remoteViewControllerProxy];
  [v1 invalidate];
}

- (id)_fontForTimeCodeLabel
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880] addingSymbolicTraits:0x8000 options:0];
  uint64_t v3 = *MEMORY[0x1E4F43850];
  v12[0] = *MEMORY[0x1E4F43858];
  v12[1] = v3;
  v13[0] = &unk_1F19B4790;
  v13[1] = &unk_1F19B47A8;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  CAFrameRateRange v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  uint64_t v10 = *MEMORY[0x1E4F43808];
  double v11 = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  uint64_t v7 = [v2 fontDescriptorByAddingAttributes:v6];

  uint64_t v8 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v7 size:0.0];

  return v8;
}

- (id)_stringForDuration:(double)a3
{
  if (qword_1EA12E040 != -1) {
    dispatch_once(&qword_1EA12E040, &__block_literal_global_133);
  }
  double v4 = (void *)_MergedGlobals_3_5;

  return (id)[v4 stringFromTimeInterval:a3];
}

uint64_t __56__HUAnnounceRecordingViewController__stringForDuration___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_MergedGlobals_3_5;
  _MergedGlobals_3_5 = (uint64_t)v0;

  [(id)_MergedGlobals_3_5 setUnitsStyle:0];
  [(id)_MergedGlobals_3_5 setZeroFormattingBehavior:0x10000];
  id v2 = (void *)_MergedGlobals_3_5;

  return [v2 setAllowedUnits:192];
}

- (void)_restoreRecordingUI
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v3 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    double v4 = _HULocalizedStringWithDefaultValue(@"HUAnnounceBeginRecordingLabel_Title", @"HUAnnounceBeginRecordingLabel_Title", 1);
    [v3 setText:v4];

    CAFrameRateRange v5 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    [v5 setAlpha:1.0];

    double v6 = [(HUAnnounceRecordingViewController *)self recordButton];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
    [v6 setImage:v7 forState:0 animated:1];

    uint64_t v8 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
    [v8 setAlpha:0.0];

    double v9 = [(HUAnnounceRecordingViewController *)self view];
    [v9 layoutIfNeeded];

    uint64_t v10 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v10 setEnabled:1];

    id v11 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v11 setContentMode:2];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HUAnnounceRecordingViewController__restoreRecordingUI__block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__HUAnnounceRecordingViewController__restoreRecordingUI__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restoreRecordingUI];
}

- (BOOL)_areAllHomePodsOffline
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(HUAnnounceRecordingViewController *)self _isRoomContext])
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Room", (uint8_t *)&v17, 2u);
    }

    double v4 = [(HUAnnounceRecordingViewController *)self currentHome];
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    double v6 = [(HUAnnounceRecordingViewController *)self serviceContext];
    uint64_t v7 = [v6 roomIdentifier];
    uint64_t v8 = (void *)[v5 initWithUUIDString:v7];
    double v9 = objc_msgSend(v4, "hf_roomWithIdentifier:", v8);

    int v10 = objc_msgSend(v9, "hf_hasAtLeastOneReachableHomeMediaAccessory") ^ 1;
  }
  else if ([(HUAnnounceRecordingViewController *)self _isHomeContext])
  {
    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Home", (uint8_t *)&v17, 2u);
    }

    double v12 = [(HUAnnounceRecordingViewController *)self currentHome];
    int v13 = objc_msgSend(v12, "hf_hasAtLeastOneReachableHomeMediaAccessory");

    int v10 = v13 ^ 1;
  }
  else
  {
    int v10 = 0;
  }
  double v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = @"NO";
    if (v10) {
      uint64_t v15 = @"YES";
    }
    int v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "allHomePodsAreOffline = [%@]", (uint8_t *)&v17, 0xCu);
  }

  return v10;
}

- (void)_updateUIBasedOnReachabilityStatus
{
  BOOL v3 = [(HUAnnounceRecordingViewController *)self _areAllHomePodsOffline];
  double v4 = [(HUAnnounceRecordingViewController *)self recordedAnnouncementURL];

  if (v3)
  {
    if (v4) {
      goto LABEL_7;
    }
    id v5 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    double v6 = _HULocalizedStringWithDefaultValue(@"HUAnnounceButton_Title", @"HUAnnounceButton_Title", 1);
    [v5 setText:v6];

    uint64_t v7 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
    [v7 setAlpha:1.0];

    uint64_t v8 = [(HUAnnounceRecordingViewController *)self recordButton];
    double v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
    [v8 setImage:v9 forState:0 animated:1];

    int v10 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v10 setEnabled:0];

    id v11 = [(HUAnnounceRecordingViewController *)self errorStatusLabel];
    double v12 = _HULocalizedStringWithDefaultValue(@"HUAnnounceHomePodsUnavailable_Error_Message", @"HUAnnounceHomePodsUnavailable_Error_Message", 1);
    [v11 setText:v12];

    int v13 = [(HUAnnounceRecordingViewController *)self errorStatusLabel];
    double v14 = v13;
    double v15 = 1.0;
  }
  else
  {
    if (v4) {
      goto LABEL_7;
    }
    double v16 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v16 setEnabled:1];

    int v13 = [(HUAnnounceRecordingViewController *)self errorStatusLabel];
    double v14 = v13;
    double v15 = 0.0;
  }
  [v13 setAlpha:v15];

LABEL_7:
  id v17 = [(HUAnnounceRecordingViewController *)self view];
  [v17 layoutIfNeeded];
}

- (BOOL)_isRoomContext
{
  BOOL v3 = [(HUAnnounceRecordingViewController *)self serviceContext];
  double v4 = [v3 roomIdentifier];
  if (v4)
  {
    id v5 = [(HUAnnounceRecordingViewController *)self serviceContext];
    double v6 = [v5 homeIdentifier];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isHomeContext
{
  BOOL v3 = [(HUAnnounceRecordingViewController *)self serviceContext];
  double v4 = [v3 roomIdentifier];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [(HUAnnounceRecordingViewController *)self serviceContext];
    BOOL v7 = [v6 homeIdentifier];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)_deleteRecording:(id)a3
{
  [(HUAnnounceRecordingViewController *)self _deleteAudioFile];
  double v4 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
  [v4 clearPowerLevels];

  [(HUAnnounceRecordingViewController *)self _hideRecordingUI];
}

- (void)_deleteAudioFile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAnnounceRecordingViewController *)self recordedAnnouncementURL];
  if (v3)
  {
    double v4 = (void *)v3;
    BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v6 = [(HUAnnounceRecordingViewController *)self recordedAnnouncementURL];
    BOOL v7 = [v6 path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8)
    {
      double v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v10 = [(HUAnnounceRecordingViewController *)self recordedAnnouncementURL];
      id v13 = 0;
      [v9 removeItemAtURL:v10 error:&v13];
      id v11 = v13;

      if (v11)
      {
        double v12 = HFLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v11;
          _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Error deleting audio file [%@]", buf, 0xCu);
        }
      }
    }
  }
  [(HUAnnounceRecordingViewController *)self setRecordedAnnouncementURL:0];
}

- (void)_hideRecordingUI
{
  uint64_t v3 = [(HUAnnounceRecordingViewController *)self recordButton];
  double v4 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
  [v3 setImage:v4 forState:0 animated:1];

  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke;
  v6[3] = &unk_1E6386018;
  void v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke_2;
  v5[3] = &unk_1E6386730;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5 completion:0.25];
}

void __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recordingStateChangeLabel];
  uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUAnnounceBeginRecordingLabel_Title", @"HUAnnounceBeginRecordingLabel_Title", 1);
  [v2 setText:v3];

  double v4 = [*(id *)(a1 + 32) recordingStateChangeLabel];
  [v4 setAlpha:1.0];

  BOOL v5 = [*(id *)(a1 + 32) audioWaveformView];
  [v5 setAlpha:0.0];

  double v6 = [*(id *)(a1 + 32) recordButton];
  [v6 setAlpha:1.0];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];
}

void __53__HUAnnounceRecordingViewController__hideRecordingUI__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recordButton];
  [v2 setEnabled:1];

  [*(id *)(a1 + 32) setAudioRecorder:0];
  uint64_t v3 = [*(id *)(a1 + 32) recordButton];
  [v3 removeTarget:*(void *)(a1 + 32) action:sel_stopRecordAndSend_ forControlEvents:64];

  double v4 = [*(id *)(a1 + 32) recordButton];
  [v4 addTarget:*(void *)(a1 + 32) action:sel_beginRecording_ forControlEvents:64];

  BOOL v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];

  double v6 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
  id v7 = [*(id *)(a1 + 32) recordButton];
  [v7 setAccessibilityLabel:v6];

  _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Hint", @"HUAnnounceRecordButton_AX_Label_Hint", 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  int v8 = [*(id *)(a1 + 32) recordButton];
  [v8 setAccessibilityHint:v9];
}

- (id)_largeTitleTextColor
{
  return (id)[MEMORY[0x1E4F428B8] labelColor];
}

- (id)_waveformColor
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  double v4 = [(HUAnnounceRecordingViewController *)self traitCollection];
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
  double v4 = [(HUAnnounceRecordingViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemBlackColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (void)_dismissViewOrDisplayError:(id)a3
{
  if (a3)
  {
    double v4 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
    [v4 setAlpha:0.0];

    uint64_t v5 = [(HUAnnounceRecordingViewController *)self announcementDeliveryFailureLabel];
    [v5 setAlpha:1.0];

    uint64_t v6 = [(HUAnnounceRecordingViewController *)self errorStatusLabel];
    [v6 setAlpha:0.0];

    id v7 = [(HUAnnounceRecordingViewController *)self recordButton];
    [v7 setEnabled:1];
  }
  else
  {
    -[HUAnnounceRecordingViewController _dismissUpRecordingView:](self, "_dismissUpRecordingView:");
  }
}

- (void)didUpdateAveragePower:(float)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HUAnnounceRecordingViewController.m" lineNumber:844 description:@"didUpdateAveragePower called from secondary thread"];
  }
  id v7 = [(HUAnnounceRecordingViewController *)self audioWaveformView];
  [v7 appendPowerLevel:a3];
}

- (void)audioRecorderDidStartRecording:(id)a3
{
  double v4 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
  [v4 impactOccurredWithIntensity:1.0];

  uint64_t v5 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v5 setEnabled:1];

  uint64_t v6 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
  [v6 setEnabled:1];

  id v7 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v7 removeTarget:self action:sel_beginRecording_ forControlEvents:64];

  id v8 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v8 addTarget:self action:sel_stopRecordAndSend_ forControlEvents:64];
}

- (void)audioRecorderFailedToFinishRecording:(id)a3
{
  [(HUAnnounceRecordingViewController *)self _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:0 interruptedByUser:0];

  [(HUAnnounceRecordingViewController *)self _restoreRecordingUI];
}

- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUAnnounceRecordingViewController *)self _submitAnalyticsForAnnounceRecordingCompletdSuccessfully:1 interruptedByUser:0];
  id v8 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v8 currentRecordedDuration];
  if (v9 <= 0.5)
  {

    goto LABEL_7;
  }
  uint64_t v10 = [v6 recordingStopSource];

  if (v10)
  {
LABEL_7:
    [(HUAnnounceRecordingViewController *)self _deleteRecording:0];
    goto LABEL_8;
  }
  id v11 = [(HUAnnounceRecordingViewController *)self feedbackGenerator];
  [v11 impactOccurredWithIntensity:1.0];

  [(HUAnnounceRecordingViewController *)self setRecordedAnnouncementURL:v7];
  double v12 = [(HUAnnounceRecordingViewController *)self recordingStateChangeLabel];
  id v13 = _HULocalizedStringWithDefaultValue(@"HUAnnounceBeginRecordingLabel_Title", @"HUAnnounceBeginRecordingLabel_Title", 1);
  [v12 setText:v13];

  double v14 = [(HUAnnounceRecordingViewController *)self recordButton];
  id v15 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
  [v14 setImage:v15 forState:0 animated:1];

  uint64_t v16 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v16 removeTarget:self action:sel_stopRecordAndSend_ forControlEvents:64];

  id v17 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v17 addTarget:self action:sel_beginRecording_ forControlEvents:64];

  [(HUAnnounceRecordingViewController *)self sendAnnouncement:0];
  v18 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v18 currentRecordedDuration];
  double v20 = v19;

  if (v20 >= 60.0)
  {
    dispatch_time_t v21 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__HUAnnounceRecordingViewController_audioRecorderFinishedRecording_audioFile___block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_after(v21, MEMORY[0x1E4F14428], block);
  }
  uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
  uint64_t v23 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v23 setAccessibilityLabel:v22];

  id v24 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Hint", @"HUAnnounceRecordButton_AX_Label_Hint", 1);
  uint64_t v25 = [(HUAnnounceRecordingViewController *)self recordButton];
  [v25 setAccessibilityHint:v24];

LABEL_8:
}

void __78__HUAnnounceRecordingViewController_audioRecorderFinishedRecording_audioFile___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) recordButton];
  [v1 setEnabled:1];
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomeMediaAccessory"))
  {
    [(HUAnnounceRecordingViewController *)self _updateUIBasedOnReachabilityStatus];
  }
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomeMediaAccessory"))
  {
    [(HUAnnounceRecordingViewController *)self _updateUIBasedOnReachabilityStatus];
  }
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  if (objc_msgSend(a3, "hf_isHomeMediaAccessory"))
  {
    [(HUAnnounceRecordingViewController *)self _updateUIBasedOnReachabilityStatus];
  }
}

- (void)_submitAnalyticsForAnnounceRecordingCompletdSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  uint64_t v8 = [v7 recordingStopSource];

  double v9 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  [v9 currentRecordedDuration];
  double v11 = v10;

  id v25 = (id)objc_opt_new();
  double v12 = [NSNumber numberWithDouble:v11];
  [v25 setObject:v12 forKey:*MEMORY[0x1E4F680B0]];

  id v13 = [NSNumber numberWithInt:!v5];
  [v25 setObject:v13 forKey:*MEMORY[0x1E4F680B8]];

  double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HUAnnounceRecordingViewController _isHomeContext](self, "_isHomeContext"));
  [v25 setObject:v14 forKey:*MEMORY[0x1E4F680C0]];

  id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HUAnnounceRecordingViewController _isRoomContext](self, "_isRoomContext"));
  [v25 setObject:v15 forKey:*MEMORY[0x1E4F680C8]];

  uint64_t v16 = [NSNumber numberWithBool:v4];
  [v25 setObject:v16 forKey:*MEMORY[0x1E4F680E0]];

  id v17 = [NSNumber numberWithInt:(unint64_t)(v8 - 1) < 2];
  [v25 setObject:v17 forKey:*MEMORY[0x1E4F680D8]];

  v18 = [NSNumber numberWithInt:v8 == 3];
  [v25 setObject:v18 forKey:*MEMORY[0x1E4F680D0]];

  double v19 = [(HUAnnounceRecordingViewController *)self audioRecorder];
  double v20 = [v19 routeChangeReason];

  if (v20)
  {
    dispatch_time_t v21 = [(HUAnnounceRecordingViewController *)self audioRecorder];
    uint64_t v22 = [v21 routeChangeReason];
    [v25 setObject:v22 forKey:*MEMORY[0x1E4F682C8]];
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F68EE0];
  id v24 = (void *)[v25 copy];
  [v23 sendEvent:18 withData:v24];
}

- (HUHomeControlServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
}

- (HFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
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

- (UILabel)largeTitleLabel
{
  return self->_largeTitleLabel;
}

- (void)setLargeTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
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

- (UILabel)announcementDeliveryFailureLabel
{
  return self->_announcementDeliveryFailureLabel;
}

- (void)setAnnouncementDeliveryFailureLabel:(id)a3
{
}

- (HURecordingButton)recordButton
{
  return self->_recordButton;
}

- (void)setRecordButton:(id)a3
{
}

- (UILabel)recordingStateChangeLabel
{
  return self->_recordingStateChangeLabel;
}

- (void)setRecordingStateChangeLabel:(id)a3
{
}

- (UILabel)errorStatusLabel
{
  return self->_errorStatusLabel;
}

- (void)setErrorStatusLabel:(id)a3
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

- (NSURL)recordedAnnouncementURL
{
  return self->_recordedAnnouncementURL;
}

- (void)setRecordedAnnouncementURL:(id)a3
{
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

- (NSLayoutConstraint)contentViewTrailingConstraint
{
  return self->_contentViewTrailingConstraint;
}

- (void)setContentViewTrailingConstraint:(id)a3
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

- (BOOL)recordingDismissedByUser
{
  return self->_recordingDismissedByUser;
}

- (void)setRecordingDismissedByUser:(BOOL)a3
{
  self->_recordingDismissedByUser = a3;
}

- (ANAnnounce)announce
{
  return self->_announce;
}

- (void)setAnnounce:(id)a3
{
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_announce, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, 0);
  objc_storeStrong((id *)&self->_errorStatusLabel, 0);
  objc_storeStrong((id *)&self->_recordingStateChangeLabel, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVisualEffectView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_largeTitleLabel, 0);
  objc_storeStrong((id *)&self->_dismissLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);

  objc_storeStrong((id *)&self->_serviceContext, 0);
}

@end