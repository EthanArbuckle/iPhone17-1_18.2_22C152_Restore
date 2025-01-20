@interface HUAnnouncementsBrowserViewController
- (ANAnnounce)announce;
- (BOOL)_isHomeContext;
- (BOOL)_isNotificationPayloadValid;
- (BOOL)_isRoomContext;
- (BOOL)isTearingDown;
- (BOOL)shouldNotSendCurrentRecording;
- (HFAudioRecorder)audioRecorder;
- (HMHome)currentHome;
- (HUAnnouncementGlobeView)announcementGlobeView;
- (HUAnnouncementsBrowserViewController)initWithNotificationPayload:(id)a3 delegate:(id)a4;
- (HUAnnouncementsBrowserViewControllerDelegate)delegate;
- (HURecordingButton)recordButton;
- (HUWaveformView)audioWaveformView;
- (NSDictionary)notificationPayload;
- (NSLayoutConstraint)audioWaveformViewLeadingConstraint;
- (NSLayoutConstraint)audioWaveformViewTrailingConstraint;
- (NSString)recipientTitle;
- (NSString)senderName;
- (NSURL)recordedAnnouncementURL;
- (UIBlurEffect)blurEffect;
- (UIButton)nextAnnouncementButton;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILabel)announcementDeliveryFailureLabel;
- (UILabel)announcementProgressLabel;
- (UILabel)errorStatusLabel;
- (UILabel)largeTitleLabel;
- (UILabel)recordButtonLabel;
- (UILabel)subTitleLabel;
- (UILabel)transcriptionText;
- (UILabel)transcriptionTitleLabel;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIScrollView)transcriptionScrollView;
- (UIStackView)transcriptionStackView;
- (UIView)lightedCircleView;
- (UIVisualEffectView)largeTitleVisualEffectView;
- (UIVisualEffectView)recordButtonLabelVisualEffectView;
- (UIVisualEffectView)subTitleVisualEffectView;
- (double)_transcriptionStackViewHeight;
- (double)notificationDismissTimeInterval;
- (double)notificationLaunchTimeInterval;
- (double)recordedDuration;
- (id)_announcerNameFromNotificationPayload:(id)a3;
- (id)_backgroundColorForNextAnnouncementButton;
- (id)_fontForAnnouncementProgressLabel;
- (id)_lightedCircleBackgroundColorForCurrentInterfaceStyle;
- (id)_lightedCircleShadowColorForCurrentInterfaceStyle;
- (id)_waveformColor;
- (void)_addCommonTranscriptionConstraints;
- (void)_addTranscriptionConstraintsForValidNotificationPayload;
- (void)_applyTranscriptionText:(id)a3;
- (void)_beginRecordingReply:(id)a3;
- (void)_commonInit;
- (void)_configureSubViewsForValidNotificationPayload;
- (void)_configureVisualStyleForLightedCircleView;
- (void)_deleteAudioFile;
- (void)_deleteRecording:(id)a3;
- (void)_dismissViewOrDisplayError:(id)a3;
- (void)_hideRecordingUI;
- (void)_recordButtonLongPressGesture:(id)a3;
- (void)_recordButtonTapped:(id)a3;
- (void)_sendAnnouncement:(id)a3;
- (void)_sendAnnouncementReply:(id)a3;
- (void)_setupRecipientInformation;
- (void)_skipToNextAnnouncement:(id)a3;
- (void)_stopRecordingAndSendReply:(id)a3;
- (void)_submitAnalyticsForAnnounceNotificationUsage;
- (void)_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4;
- (void)_updateUIBasedOnReachabilityStatus;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)accessoryDidUpdateReachableTransports:(id)a3;
- (void)audioRecorderDidStartRecording:(id)a3;
- (void)audioRecorderFailedToFinishRecording:(id)a3;
- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4;
- (void)dealloc;
- (void)didSelectItemWithInfo:(id)a3 totalNumberOfAnnouncements:(unint64_t)a4;
- (void)didUpdateAveragePower:(float)a3;
- (void)setAnnounce:(id)a3;
- (void)setAnnouncementDeliveryFailureLabel:(id)a3;
- (void)setAnnouncementGlobeView:(id)a3;
- (void)setAnnouncementProgressLabel:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioWaveformView:(id)a3;
- (void)setAudioWaveformViewLeadingConstraint:(id)a3;
- (void)setAudioWaveformViewTrailingConstraint:(id)a3;
- (void)setBlurEffect:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorStatusLabel:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setIsTearingDown:(BOOL)a3;
- (void)setLargeTitleLabel:(id)a3;
- (void)setLargeTitleVisualEffectView:(id)a3;
- (void)setLightedCircleView:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setNextAnnouncementButton:(id)a3;
- (void)setNotificationDismissTimeInterval:(double)a3;
- (void)setNotificationLaunchTimeInterval:(double)a3;
- (void)setNotificationPayload:(id)a3;
- (void)setRecipientTitle:(id)a3;
- (void)setRecordButton:(id)a3;
- (void)setRecordButtonLabel:(id)a3;
- (void)setRecordButtonLabelVisualEffectView:(id)a3;
- (void)setRecordedAnnouncementURL:(id)a3;
- (void)setRecordedDuration:(double)a3;
- (void)setSenderName:(id)a3;
- (void)setShouldNotSendCurrentRecording:(BOOL)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setSubTitleVisualEffectView:(id)a3;
- (void)setTranscriptionScrollView:(id)a3;
- (void)setTranscriptionStackView:(id)a3;
- (void)setTranscriptionText:(id)a3;
- (void)setTranscriptionTitleLabel:(id)a3;
- (void)tearDownAudioActivity;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUAnnouncementsBrowserViewController

- (HUAnnouncementsBrowserViewController)initWithNotificationPayload:(id)a3 delegate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUAnnouncementsBrowserViewController;
  v9 = [(HUAnnouncementsBrowserViewController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_notificationPayload, a3);
    BOOL v11 = [(HUAnnouncementsBrowserViewController *)v10 _isNotificationPayloadValid];
    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = @"NO";
      if (v11) {
        v13 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Notification payload is valid = [%@]", buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSince1970];
    v10->_notificationLaunchTimeInterval = v15;

    [(HUAnnouncementsBrowserViewController *)v10 _commonInit];
  }

  return v10;
}

- (void)tearDownAudioActivity
{
  [(HUAnnouncementsBrowserViewController *)self setIsTearingDown:1];
  v3 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    self->_shouldNotSendCurrentRecording = 1;
    v5 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    [v5 stopRecording];
  }
  v6 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
  [v6 teardownAnnouncements];

  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  -[HUAnnouncementsBrowserViewController setNotificationDismissTimeInterval:](self, "setNotificationDismissTimeInterval:");

  [(HUAnnouncementsBrowserViewController *)self _submitAnalyticsForAnnounceNotificationUsage];
}

- (void)dealloc
{
  v3 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    self->_shouldNotSendCurrentRecording = 1;
    [(HUAnnouncementsBrowserViewController *)self _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:1 interruptedByUser:1];
    v5 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    [v5 stopRecording];
  }
  [(HUAnnouncementsBrowserViewController *)self _deleteAudioFile];
  v6 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
  [v6 teardownAnnouncements];

  v7.receiver = self;
  v7.super_class = (Class)HUAnnouncementsBrowserViewController;
  [(HUAnnouncementsBrowserViewController *)&v7 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HUAnnouncementsBrowserViewController;
  [(HUAnnouncementsBrowserViewController *)&v4 viewDidLoad];
  [(HUAnnouncementsBrowserViewController *)self setIsTearingDown:0];
  [(HUAnnouncementsBrowserViewController *)self _configureSubViewsForValidNotificationPayload];
  [(HUAnnouncementsBrowserViewController *)self _updateUIBasedOnReachabilityStatus];
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 addAccessoryObserver:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = [(HUAnnouncementsBrowserViewController *)self nextAnnouncementButton];
  v5 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_fastForwardButtonImage");
  [v4 setImage:v5 forState:0];

  v6 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
  objc_super v7 = [(HUAnnouncementsBrowserViewController *)self _waveformColor];
  [v6 setWaveformColor:v7];

  [(HUAnnouncementsBrowserViewController *)self _configureVisualStyleForLightedCircleView];
}

- (void)_commonInit
{
  v3 = (HFAudioRecorder *)[objc_alloc(MEMORY[0x1E4F68F28]) initWithAudioRecorderDelegate:self];
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = v3;

  [(HFAudioRecorder *)self->_audioRecorder setRecordingDurationLimit:60.0];
  [(HUAnnouncementsBrowserViewController *)self _setupRecipientInformation];
  v5 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42AA8]);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v5;

  objc_super v7 = (ANAnnounce *)objc_alloc_init(MEMORY[0x1E4F4A888]);
  announce = self->_announce;
  self->_announce = v7;

  v9 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4A768]];

  BOOL v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v12 = [v11 allHomesFuture];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke;
  v15[3] = &unk_1E638C300;
  id v16 = v10;
  objc_super v17 = self;
  id v13 = v10;
  id v14 = (id)[v12 addCompletionBlock:v15];
}

void __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = HFLogForCategory();
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
    v13[2] = __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke_2;
    v13[3] = &unk_1E638C2D8;
    id v14 = *(id *)(a1 + 32);
    id v8 = objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
    [*(id *)(a1 + 40) setCurrentHome:v8];
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [*(id *)(a1 + 40) currentHome];
      BOOL v11 = [v10 uniqueIdentifier];
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

    objc_super v7 = v14;
  }
}

uint64_t __51__HUAnnouncementsBrowserViewController__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  objc_super v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_setupRecipientInformation
{
  v3 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v20 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4A7F0]];

  if ([v20 count])
  {
    objc_super v4 = [v20 allValues];
    if ([v4 count])
    {
      unint64_t v5 = 0;
      do
      {
        if ((unint64_t)[v4 count] > 1 && v5 == objc_msgSend(v4, "count") - 1)
        {
          recipientTitle = self->_recipientTitle;
          objc_super v7 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecipientTitle_Concatenator", @"HUAnnounceRecipientTitle_Concatenator", 1);
          id v8 = [(NSString *)recipientTitle stringByAppendingString:v7];
          v9 = self->_recipientTitle;
          self->_recipientTitle = v8;
        }
        v10 = self->_recipientTitle;
        BOOL v11 = [v4 objectAtIndexedSubscript:v5];
        uint64_t v12 = v11;
        if (v10)
        {
          id v13 = [(NSString *)v10 stringByAppendingString:v11];
          id v14 = self->_recipientTitle;
          self->_recipientTitle = v13;
        }
        else
        {
          double v15 = self->_recipientTitle;
          self->_recipientTitle = v11;
          uint64_t v12 = v15;
        }

        if (++v5 < [v4 count])
        {
          id v16 = [(NSString *)self->_recipientTitle stringByAppendingString:@", "];
          __int16 v17 = self->_recipientTitle;
          self->_recipientTitle = v16;
        }
      }
      while (v5 < [v4 count]);
    }
  }
  else
  {
    objc_super v4 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
    v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A780]];
    __int16 v19 = self->_recipientTitle;
    self->_recipientTitle = v18;
  }
}

- (void)_addCommonTranscriptionConstraints
{
  v78[1] = *MEMORY[0x1E4F143B8];
  if (_AXSShowAudioTranscriptions())
  {
    v3 = [(HUAnnouncementsBrowserViewController *)self announcementProgressLabel];
    [v3 setAlpha:0.0];

    objc_super v4 = [(HUAnnouncementsBrowserViewController *)self transcriptionTitleLabel];
    unint64_t v5 = [v4 text];
    id v6 = [(HUAnnouncementsBrowserViewController *)self view];
    [v6 frame];
    double v8 = v7;
    uint64_t v77 = *MEMORY[0x1E4F42508];
    uint64_t v9 = v77;
    v10 = [(UILabel *)self->_transcriptionTitleLabel font];
    v78[0] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v8, 3.40282347e38);
    double v13 = v12;

    id v14 = [(UILabel *)self->_transcriptionTitleLabel font];
    [v14 lineHeight];
    double v16 = ceil(v13 / v15);

    __int16 v17 = [(HUAnnouncementsBrowserViewController *)self transcriptionText];
    v18 = [v17 text];
    __int16 v19 = [(HUAnnouncementsBrowserViewController *)self view];
    [v19 frame];
    double v21 = v20;
    uint64_t v75 = v9;
    v22 = [(UILabel *)self->_transcriptionText font];
    v76 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 1, v23, 0, v21, 3.40282347e38);
    double v25 = v24;

    v26 = [(UILabel *)self->_transcriptionText font];
    [v26 lineHeight];
    double v28 = ceil(v25 / v27);

    v29 = [(UILabel *)self->_transcriptionTitleLabel font];
    [v29 _scaledValueForValue:32.0];
    double v31 = v30 * (double)(unint64_t)v16;

    v32 = [(UILabel *)self->_transcriptionText font];
    [v32 _scaledValueForValue:20.0];
    double v34 = v33 * (double)(unint64_t)v28;

    double v35 = v31 + v34 + 6.0;
    v36 = [(UIScrollView *)self->_transcriptionScrollView heightAnchor];
    v37 = [v36 constraintEqualToConstant:v35];

    LODWORD(v38) = 1132003328;
    [v37 setPriority:v38];
    p_announcementGlobeView = (id *)&self->_announcementGlobeView;
    announcementGlobeView = self->_announcementGlobeView;
    v41 = [(UIScrollView *)self->_transcriptionScrollView topAnchor];
    if (!announcementGlobeView) {
      p_announcementGlobeView = (id *)&self->_announcementDeliveryFailureLabel;
    }
    v42 = [*p_announcementGlobeView bottomAnchor];
    v73 = [v41 constraintEqualToAnchor:v42 constant:6.0];

    v62 = (void *)MEMORY[0x1E4F28DC8];
    v74[0] = v37;
    v74[1] = v73;
    v71 = [(UIScrollView *)self->_transcriptionScrollView leadingAnchor];
    v72 = [(HUAnnouncementsBrowserViewController *)self view];
    v70 = [v72 safeAreaLayoutGuide];
    v69 = [v70 leadingAnchor];
    v68 = [v71 constraintEqualToAnchor:v69];
    v74[2] = v68;
    v66 = [(UIScrollView *)self->_transcriptionScrollView trailingAnchor];
    v67 = [(HUAnnouncementsBrowserViewController *)self view];
    v65 = [v67 safeAreaLayoutGuide];
    v64 = [v65 trailingAnchor];
    v63 = [v66 constraintEqualToAnchor:v64];
    v74[3] = v63;
    v60 = [(UIStackView *)self->_transcriptionStackView topAnchor];
    v59 = [(UIScrollView *)self->_transcriptionScrollView topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v74[4] = v58;
    v57 = [(UIStackView *)self->_transcriptionStackView leadingAnchor];
    v56 = [(UIScrollView *)self->_transcriptionScrollView leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v74[5] = v55;
    v54 = [(UIStackView *)self->_transcriptionStackView trailingAnchor];
    v53 = [(UIScrollView *)self->_transcriptionScrollView trailingAnchor];
    v43 = [v54 constraintEqualToAnchor:v53];
    v74[6] = v43;
    [(UIStackView *)self->_transcriptionStackView bottomAnchor];
    v44 = v61 = v37;
    v45 = [(UIScrollView *)self->_transcriptionScrollView bottomAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v74[7] = v46;
    v47 = [(UIStackView *)self->_transcriptionStackView heightAnchor];
    v48 = [v47 constraintEqualToConstant:v35];
    v74[8] = v48;
    v49 = [(UIStackView *)self->_transcriptionStackView widthAnchor];
    v50 = [(UIScrollView *)self->_transcriptionScrollView widthAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v74[9] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:10];
    [v62 activateConstraints:v52];
  }
}

- (void)_addTranscriptionConstraintsForValidNotificationPayload
{
  [(HUAnnouncementsBrowserViewController *)self _addCommonTranscriptionConstraints];
  if (_AXSShowAudioTranscriptions())
  {
    v3 = (void *)MEMORY[0x1E4F1CA48];
    objc_super v4 = [(UIScrollView *)self->_transcriptionScrollView bottomAnchor];
    unint64_t v5 = [(HURecordingButton *)self->_recordButton topAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5 constant:-20.0];
    id v12 = [v3 arrayWithObject:v6];

    double v7 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView topAnchor];
    double v8 = [(UILabel *)self->_subTitleLabel bottomAnchor];
    uint64_t v9 = [v7 constraintEqualToAnchor:v8 constant:40.0];
    objc_msgSend(v12, "na_safeAddObject:", v9);

    v10 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v11 = (void *)[v12 copy];
    [v10 activateConstraints:v11];
  }
}

- (void)_configureSubViewsForValidNotificationPayload
{
  v304[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  objc_super v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4A848]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  largeTitleLabel = self->_largeTitleLabel;
  self->_largeTitleLabel = v6;

  double v8 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438E8]];
  uint64_t v9 = [v8 fontDescriptorWithSymbolicTraits:2];

  double v10 = 0.0;
  v301 = (void *)v9;
  BOOL v11 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v9 size:0.0];
  [(UILabel *)self->_largeTitleLabel setFont:v11];

  [(UILabel *)self->_largeTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_largeTitleLabel setLineBreakMode:0];
  id v12 = self->_largeTitleLabel;
  double v13 = [MEMORY[0x1E4F428B8] labelColor];
  [(UILabel *)v12 setTextColor:v13];

  id v14 = self->_largeTitleLabel;
  double v15 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  double v16 = [(HUAnnouncementsBrowserViewController *)self _announcerNameFromNotificationPayload:v15];
  [(UILabel *)v14 setText:v16];

  [(UILabel *)self->_largeTitleLabel setTextAlignment:1];
  __int16 v17 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v17, "naui_addAutoLayoutSubview:", self->_largeTitleLabel);

  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  subTitleLabel = self->_subTitleLabel;
  self->_subTitleLabel = v18;

  uint64_t v300 = *MEMORY[0x1E4F43870];
  double v20 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:");
  [(UILabel *)self->_subTitleLabel setFont:v20];

  double v21 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_subTitleLabel setTextColor:v21];

  [(UILabel *)self->_subTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subTitleLabel setLineBreakMode:0];
  v22 = self->_subTitleLabel;
  v23 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  double v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F4A810]];
  [(UILabel *)v22 setText:v24];

  [(UILabel *)self->_subTitleLabel setTextAlignment:1];
  double v25 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v25, "naui_addAutoLayoutSubview:", self->_subTitleLabel);

  v26 = (double *)MEMORY[0x1E4F1DB28];
  if (v5)
  {
    double v27 = self->_largeTitleLabel;
    double v28 = [(HUAnnouncementsBrowserViewController *)self recipientTitle];
    double v35 = HULocalizedStringWithFormat(@"HUAnnounceRecipient_Title", @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
    [(UILabel *)v27 setText:v35];

    v36 = self->_subTitleLabel;
    v37 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSubtitle_Title", @"HUAnnounceSubtitle_Title", 1);
    [(UILabel *)v36 setText:v37];
    double v38 = 1.0;
    unint64_t v39 = 0x1E4F42000;
  }
  else
  {
    v40 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    lightedCircleView = self->_lightedCircleView;
    self->_lightedCircleView = v40;

    [(UIView *)self->_lightedCircleView setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [(UIView *)self->_lightedCircleView layer];
    [v42 setCornerRadius:74.0];

    [(HUAnnouncementsBrowserViewController *)self _configureVisualStyleForLightedCircleView];
    v43 = [(HUAnnouncementsBrowserViewController *)self view];
    objc_msgSend(v43, "naui_addAutoLayoutSubview:", self->_lightedCircleView);

    v44 = [HUAnnouncementGlobeView alloc];
    v45 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
    v46 = [(HUAnnouncementGlobeView *)v44 initWithAnnouncementPayload:v45 delegate:self];
    announcementGlobeView = self->_announcementGlobeView;
    self->_announcementGlobeView = v46;

    id v48 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v49 = [v48 CGColor];
    v50 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView layer];
    [v50 setBackgroundColor:v49];

    [(HUAnnouncementGlobeView *)self->_announcementGlobeView setOpaque:0];
    v51 = [(HUAnnouncementsBrowserViewController *)self view];
    objc_msgSend(v51, "naui_addAutoLayoutSubview:", self->_announcementGlobeView);

    unint64_t v39 = 0x1E4F42000uLL;
    v52 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    announcementProgressLabel = self->_announcementProgressLabel;
    self->_announcementProgressLabel = v52;

    v54 = [(HUAnnouncementsBrowserViewController *)self _fontForAnnouncementProgressLabel];
    [(UILabel *)self->_announcementProgressLabel setFont:v54];

    v55 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)self->_announcementProgressLabel setTextColor:v55];

    v56 = self->_announcementProgressLabel;
    v63 = HULocalizedStringWithFormat(@"HUAnnounceProgressLabel_Description", @"%lu %lu", v57, v58, v59, v60, v61, v62, 1);
    [(UILabel *)v56 setText:v63];

    [(UILabel *)self->_announcementProgressLabel setTextAlignment:1];
    v37 = [(HUAnnouncementsBrowserViewController *)self view];
    objc_msgSend(v37, "naui_addAutoLayoutSubview:", self->_announcementProgressLabel);
    double v38 = 0.0;
    double v10 = 1.0;
  }

  v64 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4F42DB0]);
  transcriptionScrollView = self->_transcriptionScrollView;
  self->_transcriptionScrollView = v64;

  v66 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v66, "naui_addAutoLayoutSubview:", self->_transcriptionScrollView);

  v67 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 2872));
  transcriptionTitleLabel = self->_transcriptionTitleLabel;
  self->_transcriptionTitleLabel = v67;

  [(UILabel *)self->_transcriptionTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_transcriptionTitleLabel setNumberOfLines:0];
  [(UILabel *)self->_transcriptionTitleLabel setLineBreakMode:0];
  v69 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
  [(UILabel *)self->_transcriptionTitleLabel setFont:v69];

  v70 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_transcriptionTitleLabel setTextColor:v70];

  [(UILabel *)self->_transcriptionTitleLabel setTextAlignment:1];
  v71 = self->_transcriptionTitleLabel;
  v72 = _HULocalizedStringWithDefaultValue(@"HUAnnounceTranscript_Title", @"HUAnnounceTranscript_Title", 1);
  [(UILabel *)v71 setText:v72];

  v73 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 2872));
  transcriptionText = self->_transcriptionText;
  self->_transcriptionText = v73;

  [(UILabel *)self->_transcriptionText setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_transcriptionText setNumberOfLines:0];
  [(UILabel *)self->_transcriptionText setLineBreakMode:0];
  uint64_t v75 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v300];
  [(UILabel *)self->_transcriptionText setFont:v75];

  v76 = [MEMORY[0x1E4F428B8] labelColor];
  [(UILabel *)self->_transcriptionText setTextColor:v76];

  uint64_t v77 = [MEMORY[0x1E4F428B8] clearColor];
  [(UILabel *)self->_transcriptionText setBackgroundColor:v77];

  v78 = self->_transcriptionText;
  v79 = _HULocalizedStringWithDefaultValue(@"HUAnnounceTranscript_NoTranscript", @"HUAnnounceTranscript_NoTranscript", 1);
  [(UILabel *)v78 setText:v79];

  [(UILabel *)self->_transcriptionText setTextAlignment:1];
  id v80 = objc_alloc(MEMORY[0x1E4F42E20]);
  v81 = self->_transcriptionText;
  v304[0] = self->_transcriptionTitleLabel;
  v304[1] = v81;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v304 count:2];
  v83 = (UIStackView *)[v80 initWithArrangedSubviews:v82];
  transcriptionStackView = self->_transcriptionStackView;
  self->_transcriptionStackView = v83;

  [(UIStackView *)self->_transcriptionStackView setAxis:1];
  [(UIStackView *)self->_transcriptionStackView setSpacing:6.0];
  [(UIStackView *)self->_transcriptionStackView setDistribution:0];
  [(UIStackView *)self->_transcriptionStackView setAlignment:0];
  [(UIScrollView *)self->_transcriptionScrollView naui_addAutoLayoutSubview:self->_transcriptionStackView];
  v85 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  v86 = [v85 objectForKeyedSubscript:*MEMORY[0x1E4F4A820]];
  [(HUAnnouncementsBrowserViewController *)self _applyTranscriptionText:v86];

  v87 = [HUWaveformView alloc];
  v88 = [(HUAnnouncementsBrowserViewController *)self _waveformColor];
  v89 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
  double v90 = *v26;
  double v91 = v26[1];
  double v92 = v26[2];
  double v93 = v26[3];
  v94 = -[HUWaveformView initWithFrame:waveformColor:backgroundColor:](v87, "initWithFrame:waveformColor:backgroundColor:", v88, v89, *v26, v91, v92, v93);
  audioWaveformView = self->_audioWaveformView;
  self->_audioWaveformView = v94;

  [(HUWaveformView *)self->_audioWaveformView setAlpha:0.0];
  v96 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v96, "naui_addAutoLayoutSubview:", self->_audioWaveformView);

  v97 = (UILabel *)objc_msgSend(objc_alloc(*(Class *)(v39 + 2872)), "initWithFrame:", v90, v91, v92, v93);
  announcementDeliveryFailureLabel = self->_announcementDeliveryFailureLabel;
  self->_announcementDeliveryFailureLabel = v97;

  [(UILabel *)self->_announcementDeliveryFailureLabel setAlpha:v38];
  v99 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
  [(UILabel *)self->_announcementDeliveryFailureLabel setFont:v99];

  [(UILabel *)self->_announcementDeliveryFailureLabel setTextAlignment:1];
  v100 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_announcementDeliveryFailureLabel setTextColor:v100];

  v101 = [(HUAnnouncementsBrowserViewController *)self recipientTitle];
  v108 = HULocalizedStringWithFormat(@"HUAnnounceNotDeliveredLabel_Description", @"%@", v102, v103, v104, v105, v106, v107, (uint64_t)v101);
  [(UILabel *)self->_announcementDeliveryFailureLabel setText:v108];

  [(UILabel *)self->_announcementDeliveryFailureLabel setNumberOfLines:0];
  [(UILabel *)self->_announcementDeliveryFailureLabel setLineBreakMode:0];
  v109 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v109, "naui_addAutoLayoutSubview:", self->_announcementDeliveryFailureLabel);

  v110 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__recordButtonLongPressGesture_];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v110;

  v112 = [HURecordingButton alloc];
  v113 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
  v114 = -[HURecordingButton initWithSize:state:image:](v112, "initWithSize:state:image:", 0, v113, 64.0, 64.0);
  recordButton = self->_recordButton;
  self->_recordButton = v114;

  [(HURecordingButton *)self->_recordButton addTarget:self action:sel__recordButtonTapped_ forControlEvents:64];
  [(HURecordingButton *)self->_recordButton addGestureRecognizer:self->_longPressGestureRecognizer];
  [(HURecordingButton *)self->_recordButton setIsAccessibilityElement:1];
  v116 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
  [(HURecordingButton *)self->_recordButton setAccessibilityLabel:v116];

  v117 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v117, "naui_addAutoLayoutSubview:", self->_recordButton);

  v118 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 2872));
  recordButtonLabel = self->_recordButtonLabel;
  self->_recordButtonLabel = v118;

  uint64_t v120 = *MEMORY[0x1E4F43890];
  v121 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [(UILabel *)self->_recordButtonLabel setFont:v121];

  [(UILabel *)self->_recordButtonLabel setTextAlignment:1];
  v122 = self->_recordButtonLabel;
  v123 = _HULocalizedStringWithDefaultValue(@"HUAnnounceButton_Title", @"HUAnnounceButton_Title", 1);
  [(UILabel *)v122 setText:v123];

  [(UILabel *)self->_recordButtonLabel setIsAccessibilityElement:0];
  v124 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v124, "naui_addAutoLayoutSubview:", self->_recordButtonLabel);

  v125 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  nextAnnouncementButton = self->_nextAnnouncementButton;
  self->_nextAnnouncementButton = v125;

  v127 = self->_nextAnnouncementButton;
  v128 = [MEMORY[0x1E4F428B8] secondarySystemFillColor];
  [(UIButton *)v127 setBackgroundColor:v128];

  v129 = self->_nextAnnouncementButton;
  v130 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_fastForwardButtonImage");
  [(UIButton *)v129 setImage:v130 forState:0];

  v131 = [(UIButton *)self->_nextAnnouncementButton layer];
  [v131 setCornerRadius:22.0];

  v132 = [(UIButton *)self->_nextAnnouncementButton layer];
  [v132 setMasksToBounds:1];

  [(UIButton *)self->_nextAnnouncementButton addTarget:self action:sel__skipToNextAnnouncement_ forControlEvents:64];
  v133 = _HULocalizedStringWithDefaultValue(@"HUAnnounceNextButton_AX_Label_Title", @"HUAnnounceNextButton_AX_Label_Title", 1);
  [(UIButton *)self->_nextAnnouncementButton setAccessibilityLabel:v133];

  [(UIButton *)self->_nextAnnouncementButton setAlpha:v10];
  v134 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v134, "naui_addAutoLayoutSubview:", self->_nextAnnouncementButton);

  v135 = [(UILabel *)self->_recordButtonLabel text];
  v136 = [(HUAnnouncementsBrowserViewController *)self view];
  [v136 bounds];
  double v138 = v137;
  uint64_t v302 = *MEMORY[0x1E4F42508];
  v139 = [(UILabel *)self->_recordButtonLabel font];
  v303 = v139;
  v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v303 forKeys:&v302 count:1];
  objc_msgSend(v135, "boundingRectWithSize:options:attributes:context:", 1, v140, 0, v138, 3.40282347e38);
  double v142 = v141;

  v143 = (UILabel *)objc_alloc_init(*(Class *)(v39 + 2872));
  errorStatusLabel = self->_errorStatusLabel;
  self->_errorStatusLabel = v143;

  v145 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v120];
  [(UILabel *)self->_errorStatusLabel setFont:v145];

  v146 = [MEMORY[0x1E4F428B8] systemRedColor];
  [(UILabel *)self->_errorStatusLabel setTextColor:v146];

  [(UILabel *)self->_errorStatusLabel setTextAlignment:1];
  [(UILabel *)self->_errorStatusLabel setNumberOfLines:0];
  [(UILabel *)self->_errorStatusLabel setAlpha:v38];
  v147 = [(HUAnnouncementsBrowserViewController *)self view];
  objc_msgSend(v147, "naui_addAutoLayoutSubview:", self->_errorStatusLabel);

  v148 = objc_opt_new();
  v149 = [(UILabel *)self->_largeTitleLabel leadingAnchor];
  v150 = [(HUAnnouncementsBrowserViewController *)self view];
  v151 = [v150 safeAreaLayoutGuide];
  v152 = [v151 leadingAnchor];
  v153 = [v149 constraintEqualToAnchor:v152 constant:24.0];
  [v148 addObject:v153];

  v154 = [(UILabel *)self->_largeTitleLabel trailingAnchor];
  v155 = [(HUAnnouncementsBrowserViewController *)self view];
  v156 = [v155 safeAreaLayoutGuide];
  v157 = [v156 trailingAnchor];
  v158 = [v154 constraintEqualToAnchor:v157 constant:-24.0];
  [v148 addObject:v158];

  v159 = [(UILabel *)self->_largeTitleLabel topAnchor];
  v160 = [(HUAnnouncementsBrowserViewController *)self view];
  v161 = [v160 safeAreaLayoutGuide];
  v162 = [v161 topAnchor];
  v163 = [v159 constraintEqualToAnchor:v162 constant:20.0];
  [v148 addObject:v163];

  v164 = [(UILabel *)self->_subTitleLabel leadingAnchor];
  v165 = [(HUAnnouncementsBrowserViewController *)self view];
  v166 = [v165 safeAreaLayoutGuide];
  v167 = [v166 leadingAnchor];
  v168 = [(HUAnnouncementsBrowserViewController *)self view];
  [v168 safeAreaInsets];
  v170 = [v164 constraintEqualToAnchor:v167 constant:v169];
  [v148 addObject:v170];

  v171 = [(UILabel *)self->_subTitleLabel trailingAnchor];
  v172 = [(HUAnnouncementsBrowserViewController *)self view];
  v173 = [v172 safeAreaLayoutGuide];
  v174 = [v173 trailingAnchor];
  v175 = [(HUAnnouncementsBrowserViewController *)self view];
  [v175 safeAreaInsets];
  v177 = [v171 constraintEqualToAnchor:v174 constant:v176];
  [v148 addObject:v177];

  v178 = [(UILabel *)self->_subTitleLabel topAnchor];
  v179 = [(UILabel *)self->_largeTitleLabel bottomAnchor];
  v180 = [v178 constraintEqualToAnchor:v179];
  [v148 addObject:v180];

  if (self->_announcementGlobeView)
  {
    v181 = [(UIView *)self->_lightedCircleView centerXAnchor];
    v182 = [(HUAnnouncementsBrowserViewController *)self view];
    v183 = [v182 centerXAnchor];
    v184 = [v181 constraintEqualToAnchor:v183];
    [v148 addObject:v184];

    v185 = [(UIView *)self->_lightedCircleView topAnchor];
    v186 = [(UILabel *)self->_subTitleLabel bottomAnchor];
    v187 = [v185 constraintEqualToAnchor:v186 constant:56.0];
    [v148 addObject:v187];

    v188 = [(UIView *)self->_lightedCircleView heightAnchor];
    v189 = [v188 constraintEqualToConstant:148.0];
    [v148 addObject:v189];

    v190 = [(UIView *)self->_lightedCircleView widthAnchor];
    v191 = [(UIView *)self->_lightedCircleView heightAnchor];
    v192 = [v190 constraintEqualToAnchor:v191];
    [v148 addObject:v192];

    v193 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView centerXAnchor];
    v194 = [(HUAnnouncementsBrowserViewController *)self view];
    v195 = [v194 centerXAnchor];
    v196 = [v193 constraintEqualToAnchor:v195];
    [v148 addObject:v196];

    v197 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView topAnchor];
    v198 = [(UILabel *)self->_subTitleLabel bottomAnchor];
    v199 = [v197 constraintEqualToAnchor:v198 constant:44.0];
    [v148 addObject:v199];

    v200 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView heightAnchor];
    v201 = [v200 constraintEqualToConstant:176.0];
    [v148 addObject:v201];

    v202 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView widthAnchor];
    v203 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView heightAnchor];
    v204 = [v202 constraintEqualToAnchor:v203];
    [v148 addObject:v204];

    v205 = [(UILabel *)self->_announcementProgressLabel centerXAnchor];
    v206 = [(HUAnnouncementsBrowserViewController *)self view];
    v207 = [v206 centerXAnchor];
    v208 = [v205 constraintEqualToAnchor:v207];
    [v148 addObject:v208];

    v209 = [(UILabel *)self->_announcementProgressLabel topAnchor];
    v210 = [(HUAnnouncementGlobeView *)self->_announcementGlobeView bottomAnchor];
    v211 = [v209 constraintEqualToAnchor:v210 constant:10.0];
    [v148 addObject:v211];
  }
  v212 = [(HUWaveformView *)self->_audioWaveformView leadingAnchor];
  v213 = [(HUAnnouncementsBrowserViewController *)self view];
  v214 = [v213 safeAreaLayoutGuide];
  v215 = [v214 leadingAnchor];
  v216 = [v212 constraintEqualToAnchor:v215 constant:100.0];
  audioWaveformViewLeadingConstraint = self->_audioWaveformViewLeadingConstraint;
  self->_audioWaveformViewLeadingConstraint = v216;

  v218 = [(HUWaveformView *)self->_audioWaveformView trailingAnchor];
  v219 = [(HUAnnouncementsBrowserViewController *)self view];
  v220 = [v219 safeAreaLayoutGuide];
  v221 = [v220 trailingAnchor];
  v222 = [v218 constraintEqualToAnchor:v221 constant:-100.0];
  audioWaveformViewTrailingConstraint = self->_audioWaveformViewTrailingConstraint;
  self->_audioWaveformViewTrailingConstraint = v222;

  [v148 addObject:self->_audioWaveformViewLeadingConstraint];
  [v148 addObject:self->_audioWaveformViewTrailingConstraint];
  v224 = [(HUWaveformView *)self->_audioWaveformView centerYAnchor];
  v225 = [(HUAnnouncementsBrowserViewController *)self view];
  v226 = [v225 centerYAnchor];
  v227 = [v224 constraintEqualToAnchor:v226];
  [v148 addObject:v227];

  v228 = [(HUWaveformView *)self->_audioWaveformView heightAnchor];
  v229 = [v228 constraintEqualToConstant:100.0];
  [v148 addObject:v229];

  v230 = [(UILabel *)self->_announcementDeliveryFailureLabel leadingAnchor];
  v231 = [(HUAnnouncementsBrowserViewController *)self view];
  v232 = [v231 safeAreaLayoutGuide];
  v233 = [v232 leadingAnchor];
  v234 = [v230 constraintEqualToAnchor:v233];
  [v148 addObject:v234];

  v235 = [(UILabel *)self->_announcementDeliveryFailureLabel trailingAnchor];
  v236 = [(HUAnnouncementsBrowserViewController *)self view];
  v237 = [v236 safeAreaLayoutGuide];
  v238 = [v237 trailingAnchor];
  v239 = [v235 constraintEqualToAnchor:v238];
  [v148 addObject:v239];

  v240 = [(UILabel *)self->_announcementDeliveryFailureLabel centerYAnchor];
  v241 = [(HUAnnouncementsBrowserViewController *)self view];
  v242 = [v241 centerYAnchor];
  v243 = [v240 constraintEqualToAnchor:v242];
  [v148 addObject:v243];

  v244 = [(HURecordingButton *)self->_recordButton topAnchor];
  v245 = [(UILabel *)self->_announcementDeliveryFailureLabel bottomAnchor];
  v246 = [v244 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v245 multiplier:1.0];
  [v148 addObject:v246];

  v247 = [(HURecordingButton *)self->_recordButton topAnchor];
  v248 = [(UILabel *)self->_errorStatusLabel bottomAnchor];
  v249 = [v247 constraintEqualToAnchor:v248 constant:20.0];
  [v148 addObject:v249];

  v250 = [(UILabel *)self->_errorStatusLabel centerXAnchor];
  v251 = [(HUAnnouncementsBrowserViewController *)self view];
  v252 = [v251 centerXAnchor];
  v253 = [v250 constraintEqualToAnchor:v252];
  [v148 addObject:v253];

  v254 = [(UILabel *)self->_errorStatusLabel leadingAnchor];
  v255 = [(HUAnnouncementsBrowserViewController *)self view];
  v256 = [v255 leadingAnchor];
  v257 = [v254 constraintEqualToAnchor:v256];
  [v148 addObject:v257];

  v258 = [(UILabel *)self->_errorStatusLabel trailingAnchor];
  v259 = [(HUAnnouncementsBrowserViewController *)self view];
  v260 = [v259 trailingAnchor];
  v261 = [v258 constraintEqualToAnchor:v260];
  [v148 addObject:v261];

  v262 = [(HURecordingButton *)self->_recordButton centerXAnchor];
  v263 = [(HUAnnouncementsBrowserViewController *)self view];
  v264 = [v263 centerXAnchor];
  v265 = [v262 constraintEqualToAnchor:v264];
  [v148 addObject:v265];

  v266 = [(HURecordingButton *)self->_recordButton heightAnchor];
  v267 = [v266 constraintEqualToConstant:64.0];
  [v148 addObject:v267];

  v268 = [(HURecordingButton *)self->_recordButton widthAnchor];
  v269 = [(HURecordingButton *)self->_recordButton heightAnchor];
  v270 = [v268 constraintEqualToAnchor:v269];
  [v148 addObject:v270];

  if (_AXSShowAudioTranscriptions())
  {
    [(HUAnnouncementsBrowserViewController *)self _transcriptionStackViewHeight];
    double v272 = v271 + 132.0;
  }
  else
  {
    double v272 = 132.0;
  }
  v273 = [(HURecordingButton *)self->_recordButton topAnchor];
  v274 = [(HUAnnouncementsBrowserViewController *)self view];
  v275 = [v274 centerYAnchor];
  v276 = [v273 constraintEqualToAnchor:v275 constant:v272];
  [v148 addObject:v276];

  v277 = [(UILabel *)self->_recordButtonLabel centerXAnchor];
  v278 = [(HURecordingButton *)self->_recordButton centerXAnchor];
  v279 = [v277 constraintEqualToAnchor:v278];
  [v148 addObject:v279];

  v280 = [(UILabel *)self->_recordButtonLabel topAnchor];
  v281 = [(HURecordingButton *)self->_recordButton bottomAnchor];
  v282 = [v280 constraintEqualToAnchor:v281 constant:6.0];
  [v148 addObject:v282];

  v283 = [(UILabel *)self->_recordButtonLabel heightAnchor];
  v284 = [v283 constraintEqualToConstant:v142];
  [v148 addObject:v284];

  v285 = [(UILabel *)self->_recordButtonLabel bottomAnchor];
  v286 = [(HUAnnouncementsBrowserViewController *)self view];
  v287 = [v286 bottomAnchor];
  v288 = [v285 constraintEqualToAnchor:v287 constant:-20.0];
  [v148 addObject:v288];

  v289 = [(UIButton *)self->_nextAnnouncementButton centerYAnchor];
  v290 = [(HURecordingButton *)self->_recordButton centerYAnchor];
  v291 = [v289 constraintEqualToAnchor:v290];
  [v148 addObject:v291];

  v292 = [(UIButton *)self->_nextAnnouncementButton leadingAnchor];
  v293 = [(UILabel *)self->_recordButtonLabel trailingAnchor];
  v294 = [v292 constraintEqualToAnchor:v293 constant:48.0];
  [v148 addObject:v294];

  v295 = [(UIButton *)self->_nextAnnouncementButton heightAnchor];
  v296 = [v295 constraintEqualToConstant:44.0];
  [v148 addObject:v296];

  v297 = [(UIButton *)self->_nextAnnouncementButton widthAnchor];
  v298 = [(UIButton *)self->_nextAnnouncementButton heightAnchor];
  v299 = [v297 constraintEqualToAnchor:v298];
  [v148 addObject:v299];

  [MEMORY[0x1E4F28DC8] activateConstraints:v148];
  [(HUAnnouncementsBrowserViewController *)self _addTranscriptionConstraintsForValidNotificationPayload];
}

- (void)_applyTranscriptionText:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_AXSShowAudioTranscriptions())
  {
    if ([v4 length]) {
      [NSString stringWithFormat:@"\"%@\"", v4];
    }
    else {
    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUAnnounceTranscript_NoTranscript", @"HUAnnounceTranscript_NoTranscript", 1);
    }
    [(UILabel *)self->_transcriptionText setText:v5];

    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = [(UILabel *)self->_transcriptionText text];
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_INFO, "Setting transcript text: %@", buf, 0xCu);
    }
  }
}

- (void)_recordButtonLongPressGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  switch(v5)
  {
    case 4:
      uint64_t v10 = [v4 view];
      [(HUAnnouncementsBrowserViewController *)self _deleteRecording:v10];

      double v7 = (void *)MEMORY[0x1E4F42FF0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_3;
      v12[3] = &unk_1E6386018;
      v12[4] = self;
      double v8 = 0.25;
      uint64_t v9 = v12;
      goto LABEL_7;
    case 3:
      BOOL v11 = [v4 view];
      [(HUAnnouncementsBrowserViewController *)self _stopRecordingAndSendReply:v11];

      double v7 = (void *)MEMORY[0x1E4F42FF0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_2;
      v13[3] = &unk_1E6386018;
      void v13[4] = self;
      double v8 = 0.25;
      uint64_t v9 = v13;
      goto LABEL_7;
    case 1:
      id v6 = [v4 view];
      [(HUAnnouncementsBrowserViewController *)self _beginRecordingReply:v6];

      double v7 = (void *)MEMORY[0x1E4F42FF0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke;
      v14[3] = &unk_1E6386018;
      v14[4] = self;
      double v8 = 0.25;
      uint64_t v9 = v14;
LABEL_7:
      [v7 animateWithDuration:v9 animations:v8];
      break;
  }
}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 1.2, 1.2);
  v2 = [*(id *)(a1 + 32) recordButton];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) recordButton];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

void __70__HUAnnouncementsBrowserViewController__recordButtonLongPressGesture___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) recordButton];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

- (void)_recordButtonTapped:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2080;
    BOOL v11 = "-[HUAnnouncementsBrowserViewController _recordButtonTapped:]";
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped record button", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  char v7 = [v6 isRecording];

  if (v7) {
    [(HUAnnouncementsBrowserViewController *)self _stopRecordingAndSendReply:v4];
  }
  else {
    [(HUAnnouncementsBrowserViewController *)self _beginRecordingReply:v4];
  }
}

- (void)_beginRecordingReply:(id)a3
{
  id v4 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
  [v4 stopPlayback];

  uint64_t v5 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  char v6 = [v5 isRecording];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F4A888]);
    [v7 prewarmWithHandler:0];
    int v8 = [(HUAnnouncementsBrowserViewController *)self feedbackGenerator];
    [v8 prepare];

    uint64_t v9 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    [v9 playAlertSoundForType:0 withCompletion:0];

    __int16 v10 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
    [v10 clearPowerLevels];

    BOOL v11 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    [v11 prepareRecording];

    uint64_t v12 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    double v13 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonStopImage");
    [v12 setImage:v13 forState:4 animated:1];

    id v14 = [(HUAnnouncementsBrowserViewController *)self recordButtonLabel];
    double v15 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordingStopLabel_Title", @"HUAnnounceRecordingStopLabel_Title", 1);
    [v14 setText:v15];

    v17[4] = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke;
    v18[3] = &unk_1E6386018;
    v18[4] = self;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_2;
    v17[3] = &unk_1E6386730;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v18 animations:v17 completion:0.25];
    double v16 = [(HUAnnouncementsBrowserViewController *)self view];
    [v16 layoutIfNeeded];
  }
}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) recordButtonLabel];
  [v2 setEnabled:1];

  CGAffineTransform v3 = [*(id *)(a1 + 32) transcriptionStackView];
  [v3 setHidden:1];

  id v4 = [*(id *)(a1 + 32) largeTitleLabel];
  uint64_t v5 = [*(id *)(a1 + 32) recipientTitle];
  uint64_t v12 = HULocalizedStringWithFormat(@"HUAnnounceRecipient_Title", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  [v4 setText:v12];

  double v13 = [*(id *)(a1 + 32) subTitleLabel];
  id v14 = _HULocalizedStringWithDefaultValue(@"HUAnnounceSubtitle_Title", @"HUAnnounceSubtitle_Title", 1);
  [v13 setText:v14];

  double v15 = [*(id *)(a1 + 32) nextAnnouncementButton];
  [v15 setAlpha:0.0];

  double v16 = [*(id *)(a1 + 32) announcementProgressLabel];
  [v16 setAlpha:0.0];

  CGAffineTransformMakeScale(&v26, 0.1, 0.1);
  __int16 v17 = [*(id *)(a1 + 32) announcementGlobeView];
  CGAffineTransform v25 = v26;
  [v17 setTransform:&v25];

  v18 = [*(id *)(a1 + 32) announcementGlobeView];
  [v18 setAlpha:0.0];

  __int16 v19 = [*(id *)(a1 + 32) lightedCircleView];
  [v19 setAlpha:0.0];

  CGAffineTransformMakeScale(&v24, 0.1, 0.1);
  double v20 = [*(id *)(a1 + 32) lightedCircleView];
  CGAffineTransform v23 = v24;
  [v20 setTransform:&v23];

  double v21 = [*(id *)(a1 + 32) nextAnnouncementButton];
  [v21 setIsAccessibilityElement:0];

  v22 = [*(id *)(a1 + 32) announcementDeliveryFailureLabel];
  [v22 setAlpha:0.0];
}

uint64_t __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    CGAffineTransform v3 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopRecordButton_AX_Label_Title", @"HUAnnounceStopRecordButton_AX_Label_Title", 1);
    id v4 = [*(id *)(v2 + 32) recordButton];
    [v4 setAccessibilityLabel:v3];

    uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopRecordButton_AX_Label_Hint", @"HUAnnounceStopRecordButton_AX_Label_Hint", 1);
    uint64_t v6 = [*(id *)(v2 + 32) recordButton];
    [v6 setAccessibilityHint:v5];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_3;
    v8[3] = &unk_1E6386018;
    uint64_t v9 = *(void *)(v2 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_4;
    v7[3] = &unk_1E6386730;
    v7[4] = v9;
    return [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:v7 completion:0.5];
  }
  return result;
}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) audioWaveformViewLeadingConstraint];
  [v2 setConstant:0.0];

  CGAffineTransform v3 = [*(id *)(a1 + 32) audioWaveformViewTrailingConstraint];
  [v3 setConstant:0.0];

  id v4 = [*(id *)(a1 + 32) audioWaveformView];
  [v4 setAlpha:1.0];

  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];
}

void __61__HUAnnouncementsBrowserViewController__beginRecordingReply___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    CGAffineTransform v3 = [*(id *)(a1 + 32) audioRecorder];
    [v3 startRecording];

    id v4 = [*(id *)(a1 + 32) feedbackGenerator];
    [v4 impactOccurredWithIntensity:1.0];
  }
}

- (void)_stopRecordingAndSendReply:(id)a3
{
  id v4 = [(HUAnnouncementsBrowserViewController *)self recordButton];
  [v4 setEnabled:0];

  id v5 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  [v5 stopRecording];

  id v6 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  [v6 playAlertSoundForType:0 withCompletion:0];
}

- (void)_sendAnnouncementReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [(HUAnnouncementsBrowserViewController *)self shouldNotSendCurrentRecording];

    if (!v7)
    {
      uint64_t v8 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4A848]];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if (v10 == 1)
      {
        [(HUAnnouncementsBrowserViewController *)self _sendAnnouncement:v4];
      }
      else
      {
        uint64_t v11 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
        uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

        double v13 = [(HUAnnouncementsBrowserViewController *)self announce];
        id v14 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke;
        v16[3] = &unk_1E6390D18;
        id v17 = v12;
        v18 = self;
        id v15 = v12;
        [v13 broadcastReply:v14 forAnnouncementID:v15 completion:v16];
      }
    }
  }
}

void __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Failed to reply to announcement with ID - [%@] - [%@]", buf, 0x16u);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke_91;
  v8[3] = &unk_1E63850E0;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __63__HUAnnouncementsBrowserViewController__sendAnnouncementReply___block_invoke_91(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewOrDisplayError:*(void *)(a1 + 40)];
}

- (void)_sendAnnouncement:(id)a3
{
  id v4 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A7F0]];

  uint64_t v6 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A768]];

  uint64_t v8 = [v5 allKeys];
  if ([v8 count])
  {
    id v9 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke;
    v24[3] = &unk_1E638FF38;
    id v10 = v9;
    id v25 = v10;
    objc_msgSend(v8, "na_each:", v24);
    uint64_t v11 = [(HUAnnouncementsBrowserViewController *)self announce];
    __int16 v12 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2;
    v21[3] = &unk_1E6390D18;
    id v22 = v10;
    CGAffineTransform v23 = self;
    id v14 = v10;
    [v11 sendAnnouncement:v12 toRoomsWithIDs:v14 andZonesWithIDs:MEMORY[0x1E4F1CBF0] inHomeWithID:v13 completion:v21];
  }
  else
  {
    id v15 = [(HUAnnouncementsBrowserViewController *)self announce];
    double v16 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2_96;
    v18[3] = &unk_1E6390D18;
    id v19 = v7;
    double v20 = self;
    [v15 sendAnnouncement:v16 toHomeWithID:v17 completion:v18];

    id v14 = v19;
  }
}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  CGAffineTransform v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithUUIDString:v4];

  objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", v5);
}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Rooms with IDs [%@] - [%@]", buf, 0x16u);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_95;
  v8[3] = &unk_1E63850E0;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_95(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewOrDisplayError:*(void *)(a1 + 40)];
}

void __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_2_96(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Error sending announcement to Home with ID [%@] - [%@]", buf, 0x16u);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_97;
  v8[3] = &unk_1E63850E0;
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __58__HUAnnouncementsBrowserViewController__sendAnnouncement___block_invoke_97(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissViewOrDisplayError:*(void *)(a1 + 40)];
}

- (void)_deleteRecording:(id)a3
{
  [(HUAnnouncementsBrowserViewController *)self _deleteAudioFile];
  id v4 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
  [v4 clearPowerLevels];

  [(HUAnnouncementsBrowserViewController *)self _hideRecordingUI];
}

- (void)_deleteAudioFile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
    uint64_t v7 = [v6 path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v10 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];
      id v13 = 0;
      [v9 removeItemAtURL:v10 error:&v13];
      id v11 = v13;

      if (v11)
      {
        __int16 v12 = HFLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v11;
          _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Error deleting audio file [%@]", buf, 0xCu);
        }
      }
    }
  }
}

- (void)_hideRecordingUI
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_2;
    v4[3] = &unk_1E6386018;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_3;
    _OWORD v3[3] = &unk_1E6386730;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3 completion:0.25];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideRecordingUI];
}

void __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) largeTitleLabel];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 notificationPayload];
  id v5 = [v3 _announcerNameFromNotificationPayload:v4];
  [v2 setText:v5];

  id v6 = [*(id *)(a1 + 32) subTitleLabel];
  uint64_t v7 = [*(id *)(a1 + 32) notificationPayload];
  int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4A810]];
  [v6 setText:v8];

  id v9 = [*(id *)(a1 + 32) recordButtonLabel];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUAnnounceButton_Title", @"HUAnnounceButton_Title", 1);
  [v9 setText:v10];

  id v11 = [*(id *)(a1 + 32) recordButtonLabel];
  [v11 setAlpha:1.0];

  __int16 v12 = [*(id *)(a1 + 32) audioWaveformViewLeadingConstraint];
  [v12 setConstant:100.0];

  id v13 = [*(id *)(a1 + 32) audioWaveformViewTrailingConstraint];
  [v13 setConstant:-100.0];

  uint64_t v14 = [*(id *)(a1 + 32) announcementGlobeView];
  [v14 setAlpha:1.0];

  id v15 = [*(id *)(a1 + 32) lightedCircleView];
  [v15 setAlpha:1.0];

  uint64_t v16 = [*(id *)(a1 + 32) lightedCircleView];
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v29[0] = *MEMORY[0x1E4F1DAB8];
  long long v26 = v29[0];
  v29[1] = v27;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v25 = v30;
  [v16 setTransform:v29];

  id v17 = [*(id *)(a1 + 32) announcementGlobeView];
  v28[0] = v26;
  v28[1] = v27;
  v28[2] = v25;
  [v17 setTransform:v28];

  v18 = [*(id *)(a1 + 32) nextAnnouncementButton];
  [v18 setAlpha:1.0];

  id v19 = [*(id *)(a1 + 32) nextAnnouncementButton];
  [v19 setIsAccessibilityElement:1];

  double v20 = [*(id *)(a1 + 32) announcementProgressLabel];
  [v20 setAlpha:1.0];

  double v21 = [*(id *)(a1 + 32) audioWaveformView];
  [v21 setAlpha:0.0];

  id v22 = [*(id *)(a1 + 32) recordButton];
  [v22 setAlpha:1.0];

  CGAffineTransform v23 = [*(id *)(a1 + 32) transcriptionStackView];
  [v23 setHidden:0];

  CGAffineTransform v24 = [*(id *)(a1 + 32) view];
  [v24 layoutIfNeeded];
}

void __56__HUAnnouncementsBrowserViewController__hideRecordingUI__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
    id v4 = [*(id *)(a1 + 32) recordButton];
    [v4 setAccessibilityLabel:v3];

    id v5 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Hint", @"HUAnnounceRecordButton_AX_Label_Hint", 1);
    id v6 = [*(id *)(a1 + 32) recordButton];
    [v6 setAccessibilityHint:v5];

    uint64_t v7 = [*(id *)(a1 + 32) recordButton];
    [v7 setEnabled:1];

    int v8 = [*(id *)(a1 + 32) recordButton];
    id v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
    [v8 setImage:v9 forState:0 animated:1];

    id v10 = [*(id *)(a1 + 32) view];
    [v10 layoutIfNeeded];
  }
}

- (void)_dismissViewOrDisplayError:(id)a3
{
  if (a3)
  {
    id v4 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
    [v4 setAlpha:0.0];

    id v5 = [(HUAnnouncementsBrowserViewController *)self announcementDeliveryFailureLabel];
    [v5 setAlpha:1.0];

    id v6 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    [v6 setEnabled:1];

    uint64_t v7 = [(HUAnnouncementsBrowserViewController *)self recordButtonLabel];
    int v8 = _HULocalizedStringWithDefaultValue(@"HUAnnounceButton_Title", @"HUAnnounceButton_Title", 1);
    [v7 setText:v8];

    id v13 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    id v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_recordingButtonWaveformImage");
    [v13 setImage:v9 forState:0 animated:1];
  }
  else
  {
    uint64_t v10 = [(HUAnnouncementsBrowserViewController *)self delegate];
    if (!v10) {
      return;
    }
    id v13 = (id)v10;
    id v9 = [(HUAnnouncementsBrowserViewController *)self delegate];
    if ([v9 conformsToProtocol:&unk_1F1AD9630])
    {
      id v11 = [(HUAnnouncementsBrowserViewController *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        return;
      }
      id v13 = [(HUAnnouncementsBrowserViewController *)self delegate];
      id v9 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
      [v13 didSendAnnouncementReplyforNotificationPayload:v9];
    }
  }
}

- (void)_skipToNextAnnouncement:(id)a3
{
  id v3 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
  [v3 skipToNextAnnouncement];
}

- (double)_transcriptionStackViewHeight
{
  id v3 = [(UILabel *)self->_transcriptionTitleLabel font];
  [v3 _scaledValueForValue:32.0];
  double v5 = v4;

  id v6 = [(UILabel *)self->_transcriptionText font];
  [v6 _scaledValueForValue:20.0];
  double v8 = v7;

  return v5 + v8 + 6.0;
}

- (void)_configureVisualStyleForLightedCircleView
{
  id v3 = [(HUAnnouncementsBrowserViewController *)self _lightedCircleBackgroundColorForCurrentInterfaceStyle];
  double v4 = [(HUAnnouncementsBrowserViewController *)self lightedCircleView];
  [v4 setBackgroundColor:v3];

  id v10 = [(UIView *)self->_lightedCircleView layer];
  LODWORD(v5) = 0.5;
  [v10 setShadowOpacity:v5];
  id v6 = [(HUAnnouncementsBrowserViewController *)self _lightedCircleShadowColorForCurrentInterfaceStyle];
  objc_msgSend(v10, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v10, "setShadowOffset:", 0.0, 12.0);
  [v10 setShadowRadius:16.0];
  double v7 = (void *)MEMORY[0x1E4F427D0];
  double v8 = [(HUAnnouncementsBrowserViewController *)self lightedCircleView];
  [v8 bounds];
  objc_msgSend(v7, "bezierPathWithOvalInRect:");
  id v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPath:", objc_msgSend(v9, "CGPath"));
}

- (id)_lightedCircleBackgroundColorForCurrentInterfaceStyle
{
  id v3 = [MEMORY[0x1E4F428B8] colorWithRed:0.31372549 green:0.333333333 blue:0.360784314 alpha:1.0];
  double v4 = [(HUAnnouncementsBrowserViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] whiteColor];

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)_lightedCircleShadowColorForCurrentInterfaceStyle
{
  id v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  double v4 = [(HUAnnouncementsBrowserViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] whiteColor];

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)_fontForAnnouncementProgressLabel
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880] addingSymbolicTraits:0x8000 options:0];
  uint64_t v3 = *MEMORY[0x1E4F43850];
  v12[0] = *MEMORY[0x1E4F43858];
  v12[1] = v3;
  v13[0] = &unk_1F19B5168;
  v13[1] = &unk_1F19B5180;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  uint64_t v10 = *MEMORY[0x1E4F43808];
  id v11 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  double v7 = [v2 fontDescriptorByAddingAttributes:v6];

  double v8 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v7 size:0.0];

  return v8;
}

- (id)_backgroundColorForNextAnnouncementButton
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] secondarySystemFillColor];
  double v4 = [(HUAnnouncementsBrowserViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (id)_waveformColor
{
  uint64_t v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  double v4 = [(HUAnnouncementsBrowserViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (BOOL)_isNotificationPayloadValid
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];

  if (!v3) {
    return 0;
  }
  double v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
    int v24 = 138412290;
    long long v25 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Received Notification with payload %@", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v6 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A548]];

  double v8 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4A810]];

  uint64_t v10 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4A568]];

  char v12 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4A768]];

  uint64_t v14 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F4A780]];

  if (v13) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  char v17 = !v16;
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v19 = [v18 fileExistsAtPath:v11];

  double v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 67109120;
    LODWORD(v25) = v19;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "AudioAssetExistsOnDisk = [%d]", (uint8_t *)&v24, 8u);
  }

  if (v7) {
    char v21 = v17;
  }
  else {
    char v21 = 0;
  }
  if (!v9) {
    char v21 = 0;
  }
  char v22 = v21 & v19;

  return v22;
}

- (void)_updateUIBasedOnReachabilityStatus
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(HUAnnouncementsBrowserViewController *)self _isRoomContext])
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Room", (uint8_t *)&v33, 2u);
    }

    double v4 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A7F0]];

    uint64_t v6 = [v5 allKeys];
    double v7 = [(HUAnnouncementsBrowserViewController *)self currentHome];
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v6 firstObject];
    uint64_t v10 = (void *)[v8 initWithUUIDString:v9];
    id v11 = objc_msgSend(v7, "hf_roomWithIdentifier:", v10);

    int v12 = objc_msgSend(v11, "hf_hasAtLeastOneAnnounceSupportedAccessory");
    if (v12) {
      int v13 = objc_msgSend(v11, "hf_hasAtLeastOneReachableHomeMediaAccessory");
    }
    else {
      int v13 = 0;
    }
    double v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [v11 uniqueIdentifier];
      int v33 = 138412802;
      *(void *)uint64_t v34 = v21;
      *(_WORD *)&v34[8] = 1024;
      int v35 = v12;
      __int16 v36 = 1024;
      int v37 = v13;
      _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "Room ID [%@], hasAtleastOneHomePodInThisRoom:%{BOOL}d, isAtleastOneHomePodOnlineInThisRoom:%{BOOL}d", (uint8_t *)&v33, 0x18u);
    }
    int v22 = v12 ^ 1;
    int v16 = v13;
  }
  else
  {
    if ([(HUAnnouncementsBrowserViewController *)self _isHomeContext])
    {
      uint64_t v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Checking reachability for context Home", (uint8_t *)&v33, 2u);
      }

      id v15 = [(HUAnnouncementsBrowserViewController *)self currentHome];
      int v16 = objc_msgSend(v15, "hf_hasAtLeastOneReachableHomeMediaAccessory");

      char v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(HUAnnouncementsBrowserViewController *)self currentHome];
        int v19 = [v18 uniqueIdentifier];
        int v33 = 138412546;
        *(void *)uint64_t v34 = v19;
        *(_WORD *)&v34[8] = 1024;
        int v35 = v16;
        _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Home ID [%@], hf_hasAtLeastOneReachableHomeMediaAccessory:%{BOOL}d", (uint8_t *)&v33, 0x12u);
      }
      int v13 = 0;
    }
    else
    {
      int v13 = 0;
      int v16 = 0;
    }
    int v22 = 1;
  }
  if ([(HUAnnouncementsBrowserViewController *)self _isRoomContext]) {
    int v23 = v13 | v22;
  }
  else {
    int v23 = 0;
  }
  BOOL v24 = [(HUAnnouncementsBrowserViewController *)self _isHomeContext];
  int v25 = v24 & v16;
  char v26 = v23 | v24 & v16;
  long long v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109376;
    *(_DWORD *)uint64_t v34 = v23;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v25;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "shouldAllowRecordingForRoom:%{BOOL}d, shouldAllowRecordingForHome:%{BOOL}d", (uint8_t *)&v33, 0xEu);
  }

  double v28 = [(HUAnnouncementsBrowserViewController *)self recordedAnnouncementURL];

  if (v26)
  {
    if (!v28)
    {
      uint64_t v29 = [(HUAnnouncementsBrowserViewController *)self recordButton];
      long long v30 = v29;
      uint64_t v31 = 1;
LABEL_28:
      [v29 setEnabled:v31];
    }
  }
  else if (!v28)
  {
    uint64_t v29 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    long long v30 = v29;
    uint64_t v31 = 0;
    goto LABEL_28;
  }
  uint64_t v32 = [(HUAnnouncementsBrowserViewController *)self view];
  [v32 layoutIfNeeded];
}

- (BOOL)_isRoomContext
{
  uint64_t v3 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];

  if (!v3) {
    return 0;
  }
  double v4 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A768]];

  uint64_t v6 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A7F0]];

  if (v5) {
    BOOL v8 = [v7 count] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isHomeContext
{
  uint64_t v3 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];

  if (!v3) {
    return 0;
  }
  double v4 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A768]];

  uint64_t v6 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A7F0]];

  if (v5) {
    BOOL v8 = [v7 count] == 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_announcerNameFromNotificationPayload:(id)a3
{
  id v3 = a3;
  double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4A558]];
  uint64_t v5 = [MEMORY[0x1E4F69758] preferredNameFromUserID:v4];
  if ([v5 isEqualToString:v4])
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4A548]];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

- (void)didUpdateAveragePower:(float)a3
{
  id v4 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
  [v4 appendPowerLevel:a3];
}

- (void)audioRecorderDidStartRecording:(id)a3
{
  id v4 = [(HUAnnouncementsBrowserViewController *)self recordButton];
  [v4 setEnabled:1];

  id v5 = [(HUAnnouncementsBrowserViewController *)self recordButtonLabel];
  [v5 setEnabled:1];
}

- (void)audioRecorderFailedToFinishRecording:(id)a3
{
  [(HUAnnouncementsBrowserViewController *)self _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:0 interruptedByUser:0];

  [(HUAnnouncementsBrowserViewController *)self _hideRecordingUI];
}

- (void)audioRecorderFinishedRecording:(id)a3 audioFile:(id)a4
{
  id v14 = a4;
  [(HUAnnouncementsBrowserViewController *)self _submitAnalyticsForAnnounceRecordingCompletedSuccessfully:1 interruptedByUser:0];
  id v5 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
  [v5 currentRecordedDuration];
  double v7 = v6;

  if (v7 >= 0.5)
  {
    [(HUAnnouncementsBrowserViewController *)self setRecordedAnnouncementURL:v14];
    BOOL v8 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    [v8 setEnabled:1];

    id v9 = [(HUAnnouncementsBrowserViewController *)self audioWaveformView];
    [v9 setAlpha:0.0];

    [(HUAnnouncementsBrowserViewController *)self _sendAnnouncementReply:0];
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Title", @"HUAnnounceRecordButton_AX_Label_Title", 1);
    id v11 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    [v11 setAccessibilityLabel:v10];

    int v12 = _HULocalizedStringWithDefaultValue(@"HUAnnounceRecordButton_AX_Label_Hint", @"HUAnnounceRecordButton_AX_Label_Hint", 1);
    int v13 = [(HUAnnouncementsBrowserViewController *)self recordButton];
    [v13 setAccessibilityHint:v12];
  }
  else
  {
    [(HUAnnouncementsBrowserViewController *)self _deleteRecording:0];
  }
}

- (void)didSelectItemWithInfo:(id)a3 totalNumberOfAnnouncements:(unint64_t)a4
{
  id v29 = a3;
  double v6 = [(HUAnnouncementsBrowserViewController *)self largeTitleLabel];
  double v7 = [(HUAnnouncementsBrowserViewController *)self _announcerNameFromNotificationPayload:v29];
  [v6 setText:v7];

  BOOL v8 = [(HUAnnouncementsBrowserViewController *)self subTitleLabel];
  id v9 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F4A810]];
  [v8 setText:v9];

  uint64_t v10 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F4A788]];
  uint64_t v11 = [v10 unsignedIntegerValue];

  int v12 = [(HUAnnouncementsBrowserViewController *)self announcementProgressLabel];
  unint64_t v13 = v11 + 1;
  double v20 = HULocalizedStringWithFormat(@"HUAnnounceProgressLabel_Description", @"%lu %lu", v14, v15, v16, v17, v18, v19, v11 + 1);
  [v12 setText:v20];

  char v21 = [(HUAnnouncementsBrowserViewController *)self announcementProgressLabel];
  [v21 setHidden:a4 == 1];

  int v22 = [(HUAnnouncementsBrowserViewController *)self nextAnnouncementButton];
  int v23 = v22;
  if (v13 >= a4)
  {
    [v22 setEnabled:0];
  }
  else
  {
    BOOL v24 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
    objc_msgSend(v23, "setEnabled:", objc_msgSend(v24, "hasActivePlaybackSession"));
  }
  int v25 = [(HUAnnouncementsBrowserViewController *)self nextAnnouncementButton];
  char v26 = v25;
  if (a4 == 1)
  {
    [v25 setHidden:1];
  }
  else
  {
    long long v27 = [(HUAnnouncementsBrowserViewController *)self announcementGlobeView];
    objc_msgSend(v26, "setHidden:", objc_msgSend(v27, "hasActivePlaybackSession") ^ 1);
  }
  double v28 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F4A820]];
  [(HUAnnouncementsBrowserViewController *)self _applyTranscriptionText:v28];
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v7 = a3;
  if (objc_msgSend(v7, "hf_isHomeMediaAccessory"))
  {
    id v4 = [v7 home];
    id v5 = [(HUAnnouncementsBrowserViewController *)self currentHome];
    int v6 = [v4 isEqual:v5];

    if (v6) {
      [(HUAnnouncementsBrowserViewController *)self _updateUIBasedOnReachabilityStatus];
    }
  }
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  id v7 = a3;
  if (objc_msgSend(v7, "hf_isHomeMediaAccessory"))
  {
    id v4 = [v7 home];
    id v5 = [(HUAnnouncementsBrowserViewController *)self currentHome];
    int v6 = [v4 isEqual:v5];

    if (v6) {
      [(HUAnnouncementsBrowserViewController *)self _updateUIBasedOnReachabilityStatus];
    }
  }
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v7 = a3;
  if (objc_msgSend(v7, "hf_isHomeMediaAccessory"))
  {
    id v4 = [v7 home];
    id v5 = [(HUAnnouncementsBrowserViewController *)self currentHome];
    int v6 = [v4 isEqual:v5];

    if (v6) {
      [(HUAnnouncementsBrowserViewController *)self _updateUIBasedOnReachabilityStatus];
    }
  }
}

- (void)_submitAnalyticsForAnnounceRecordingCompletedSuccessfully:(BOOL)a3 interruptedByUser:(BOOL)a4
{
  BOOL v4 = a3;
  int v6 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];

  if (v6)
  {
    id v7 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    uint64_t v8 = [v7 recordingStopSource];

    id v9 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    [v9 currentRecordedDuration];
    double v11 = v10;

    int v12 = [(HUAnnouncementsBrowserViewController *)self notificationPayload];
    id v25 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

    unint64_t v13 = objc_opt_new();
    uint64_t v14 = [NSNumber numberWithDouble:v11];
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F680B0]];

    uint64_t v15 = [NSNumber numberWithInt:!v4];
    [v13 setObject:v15 forKey:*MEMORY[0x1E4F680B8]];

    [v13 setObject:v25 forKey:*MEMORY[0x1E4F680A8]];
    uint64_t v16 = [NSNumber numberWithInt:v8 == 0];
    [v13 setObject:v16 forKey:*MEMORY[0x1E4F680E0]];

    uint64_t v17 = [NSNumber numberWithInt:(unint64_t)(v8 - 1) < 2];
    [v13 setObject:v17 forKey:*MEMORY[0x1E4F680D8]];

    uint64_t v18 = [NSNumber numberWithInt:v8 == 3];
    [v13 setObject:v18 forKey:*MEMORY[0x1E4F680D0]];

    uint64_t v19 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
    double v20 = [v19 routeChangeReason];

    if (v20)
    {
      char v21 = [(HUAnnouncementsBrowserViewController *)self audioRecorder];
      int v22 = [v21 routeChangeReason];
      [v13 setObject:v22 forKey:*MEMORY[0x1E4F682C8]];
    }
    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F680E8]];
    int v23 = (void *)MEMORY[0x1E4F68EE0];
    BOOL v24 = (void *)[v13 copy];
    [v23 sendEvent:18 withData:v24];
  }
}

- (void)_submitAnalyticsForAnnounceNotificationUsage
{
  id v9 = (id)objc_opt_new();
  [(HUAnnouncementsBrowserViewController *)self notificationDismissTimeInterval];
  double v4 = v3;
  [(HUAnnouncementsBrowserViewController *)self notificationLaunchTimeInterval];
  int v6 = [NSNumber numberWithDouble:v4 - v5];
  [v9 setObject:v6 forKey:*MEMORY[0x1E4F68068]];

  id v7 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v8 = (void *)[v9 copy];
  [v7 sendEvent:20 withData:v8];
}

- (NSDictionary)notificationPayload
{
  return self->_notificationPayload;
}

- (void)setNotificationPayload:(id)a3
{
}

- (BOOL)isTearingDown
{
  return self->_isTearingDown;
}

- (void)setIsTearingDown:(BOOL)a3
{
  self->_isTearingDown = a3;
}

- (UILabel)largeTitleLabel
{
  return self->_largeTitleLabel;
}

- (void)setLargeTitleLabel:(id)a3
{
}

- (UIVisualEffectView)largeTitleVisualEffectView
{
  return self->_largeTitleVisualEffectView;
}

- (void)setLargeTitleVisualEffectView:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (UIVisualEffectView)subTitleVisualEffectView
{
  return self->_subTitleVisualEffectView;
}

- (void)setSubTitleVisualEffectView:(id)a3
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

- (UILabel)recordButtonLabel
{
  return self->_recordButtonLabel;
}

- (void)setRecordButtonLabel:(id)a3
{
}

- (UIVisualEffectView)recordButtonLabelVisualEffectView
{
  return self->_recordButtonLabelVisualEffectView;
}

- (void)setRecordButtonLabelVisualEffectView:(id)a3
{
}

- (UIScrollView)transcriptionScrollView
{
  return self->_transcriptionScrollView;
}

- (void)setTranscriptionScrollView:(id)a3
{
}

- (UIStackView)transcriptionStackView
{
  return self->_transcriptionStackView;
}

- (void)setTranscriptionStackView:(id)a3
{
}

- (UILabel)transcriptionText
{
  return self->_transcriptionText;
}

- (void)setTranscriptionText:(id)a3
{
}

- (UILabel)transcriptionTitleLabel
{
  return self->_transcriptionTitleLabel;
}

- (void)setTranscriptionTitleLabel:(id)a3
{
}

- (UILabel)errorStatusLabel
{
  return self->_errorStatusLabel;
}

- (void)setErrorStatusLabel:(id)a3
{
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (HFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
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

- (HUAnnouncementsBrowserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAnnouncementsBrowserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)lightedCircleView
{
  return self->_lightedCircleView;
}

- (void)setLightedCircleView:(id)a3
{
}

- (HUAnnouncementGlobeView)announcementGlobeView
{
  return self->_announcementGlobeView;
}

- (void)setAnnouncementGlobeView:(id)a3
{
}

- (UILabel)announcementProgressLabel
{
  return self->_announcementProgressLabel;
}

- (void)setAnnouncementProgressLabel:(id)a3
{
}

- (UIButton)nextAnnouncementButton
{
  return self->_nextAnnouncementButton;
}

- (void)setNextAnnouncementButton:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (NSLayoutConstraint)audioWaveformViewLeadingConstraint
{
  return self->_audioWaveformViewLeadingConstraint;
}

- (void)setAudioWaveformViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)audioWaveformViewTrailingConstraint
{
  return self->_audioWaveformViewTrailingConstraint;
}

- (void)setAudioWaveformViewTrailingConstraint:(id)a3
{
}

- (NSString)recipientTitle
{
  return self->_recipientTitle;
}

- (void)setRecipientTitle:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)shouldNotSendCurrentRecording
{
  return self->_shouldNotSendCurrentRecording;
}

- (void)setShouldNotSendCurrentRecording:(BOOL)a3
{
  self->_shouldNotSendCurrentRecording = a3;
}

- (double)notificationLaunchTimeInterval
{
  return self->_notificationLaunchTimeInterval;
}

- (void)setNotificationLaunchTimeInterval:(double)a3
{
  self->_notificationLaunchTimeInterval = a3;
}

- (double)notificationDismissTimeInterval
{
  return self->_notificationDismissTimeInterval;
}

- (void)setNotificationDismissTimeInterval:(double)a3
{
  self->_notificationDismissTimeInterval = a3;
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
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_recipientTitle, 0);
  objc_storeStrong((id *)&self->_audioWaveformViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_audioWaveformViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_nextAnnouncementButton, 0);
  objc_storeStrong((id *)&self->_announcementProgressLabel, 0);
  objc_storeStrong((id *)&self->_announcementGlobeView, 0);
  objc_storeStrong((id *)&self->_lightedCircleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_recordedAnnouncementURL, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_errorStatusLabel, 0);
  objc_storeStrong((id *)&self->_transcriptionTitleLabel, 0);
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_transcriptionStackView, 0);
  objc_storeStrong((id *)&self->_transcriptionScrollView, 0);
  objc_storeStrong((id *)&self->_recordButtonLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_recordButtonLabel, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_announcementDeliveryFailureLabel, 0);
  objc_storeStrong((id *)&self->_audioWaveformView, 0);
  objc_storeStrong((id *)&self->_subTitleVisualEffectView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_largeTitleVisualEffectView, 0);
  objc_storeStrong((id *)&self->_largeTitleLabel, 0);

  objc_storeStrong((id *)&self->_notificationPayload, 0);
}

@end