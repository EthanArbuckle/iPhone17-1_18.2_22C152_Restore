@interface TrainDetectorController
- (AXSDLearnMoreDelegate)learnMoreDelegate;
- (CheckmarkTrainingView)checkmarkView;
- (NSMutableArray)checkmarkViews;
- (NSString)category;
- (SoundDetectionAudioVisualizationView)visualizationView;
- (UIButton)learnMoreLinkButton;
- (UILabel)label;
- (UILabel)savedSoundLabel;
- (UIStackView)checkmarkStackView;
- (UIStackView)verticalStackView;
- (id)locStringForKShotCategory:(id)a3 key:(id)a4;
- (void)_constrainCheckmarkStackView;
- (void)_constrainSavedSoundLabel;
- (void)_constrainVerticalStackView;
- (void)_constrainVisualizationView;
- (void)_setupCheckmarkViews;
- (void)_setupLabel;
- (void)_setupLearnMoreLinkButton;
- (void)_setupSavedSoundLabel;
- (void)_setupVerticalStackView;
- (void)_setupVisualizationView;
- (void)_updateLabelText:(id)a3;
- (void)_updateVisualizerWithValues:(id)a3;
- (void)enterDoneState;
- (void)enterListeningStateWithCheckmarkIndex:(int)a3;
- (void)enterModelSimilarityWarningState:(int)a3;
- (void)enterPreListeningState;
- (void)enterSavingStateWithCheckmarkIndex:(int)a3;
- (void)enterTimeoutState;
- (void)enterWaitingForSaveState:(int)a3;
- (void)enterWaitingForSoundState;
- (void)presentLearnMorePane;
- (void)resetCheckmarkIndex:(int)a3;
- (void)setCategory:(id)a3;
- (void)setCheckmarkStackView:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setCheckmarkViews:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLearnMoreDelegate:(id)a3;
- (void)setLearnMoreLinkButton:(id)a3;
- (void)setSavedSoundLabel:(id)a3;
- (void)setVerticalStackView:(id)a3;
- (void)setVisualizationView:(id)a3;
- (void)updateCheckmarkState:(int64_t)a3 checkmarkIndex:(int)a4;
- (void)updateProgressToState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TrainDetectorController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TrainDetectorController;
  [(TrainDetectorController *)&v3 viewDidLoad];
  [(TrainDetectorController *)self _setupCheckmarkViews];
  [(TrainDetectorController *)self _constrainCheckmarkStackView];
  [(TrainDetectorController *)self _setupSavedSoundLabel];
  [(TrainDetectorController *)self _constrainSavedSoundLabel];
  [(TrainDetectorController *)self _setupVerticalStackView];
  [(TrainDetectorController *)self _constrainVerticalStackView];
  [(TrainDetectorController *)self _setupVisualizationView];
  [(TrainDetectorController *)self _constrainVisualizationView];
  [(TrainDetectorController *)self _setupLabel];
  [(TrainDetectorController *)self updateProgressToState:self->_state];
  [(TrainDetectorController *)self enterPreListeningState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TrainDetectorController;
  [(TrainDetectorController *)&v6 viewDidAppear:a3];
  v4 = +[AXSDAudioLevelsHelper sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __41__TrainDetectorController_viewDidAppear___block_invoke;
  v5[3] = &unk_20AC00;
  v5[4] = self;
  objc_msgSend(v4, "registerListener:forAudioLevelUpdates:withBucketCount:", self, v5, -[SoundDetectionAudioVisualizationView pipCount](self->_visualizationView, "pipCount"));
}

void __41__TrainDetectorController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    id v3 = v2;
    AXPerformBlockOnMainThread();
  }
}

id __41__TrainDetectorController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisualizerWithValues:*(void *)(a1 + 40)];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TrainDetectorController;
  [(TrainDetectorController *)&v5 viewWillDisappear:a3];
  v4 = +[AXSDAudioLevelsHelper sharedInstance];
  [v4 deregisterListener:self];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)TrainDetectorController;
  [(TrainDetectorController *)&v2 viewDidLayoutSubviews];
}

- (void)enterPreListeningState
{
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  v4 = [(TrainDetectorController *)self savedSoundLabel];
  objc_super v5 = [v4 text];
  UIAccessibilityPostNotification(v3, v5);

  objc_super v6 = [(TrainDetectorController *)self visualizationView];
  [v6 setHidden:1];

  v7 = [(TrainDetectorController *)self visualizationView];
  v8 = +[UIColor systemGrayColor];
  [v7 setTintColor:v8];

  v9 = [(TrainDetectorController *)self category];
  v10 = [(TrainDetectorController *)self locStringForKShotCategory:v9 key:@"PRE_LISTENING_LABEL"];
  [(TrainDetectorController *)self _updateLabelText:v10];

  v11 = +[UIColor labelColor];
  v12 = [(TrainDetectorController *)self label];
  [v12 setTextColor:v11];

  id v13 = [(TrainDetectorController *)self learnMoreLinkButton];
  [v13 setHidden:1];
}

- (void)enterWaitingForSoundState
{
  if (self->_state != 5)
  {
    UIAccessibilityNotifications v3 = [(TrainDetectorController *)self savedSoundLabel];
    [v3 setHidden:1];

    v4 = [(TrainDetectorController *)self visualizationView];
    [v4 setHidden:0];

    objc_super v5 = [(TrainDetectorController *)self visualizationView];
    objc_super v6 = +[UIColor systemGrayColor];
    [v5 setTintColor:v6];

    v7 = [(TrainDetectorController *)self category];
    v8 = [(TrainDetectorController *)self locStringForKShotCategory:v7 key:@"START_LISTENING_LABEL"];
    [(TrainDetectorController *)self _updateLabelText:v8];

    v9 = +[UIColor systemGrayColor];
    v10 = [(TrainDetectorController *)self label];
    [v10 setTextColor:v9];

    v11 = [(TrainDetectorController *)self learnMoreLinkButton];
    [v11 setHidden:1];

    dispatch_time_t v12 = dispatch_time(0, 2000000000);
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_65);
  }
}

void __52__TrainDetectorController_enterWaitingForSoundState__block_invoke(id a1)
{
  id v1 = +[AXSDSettings sharedInstance];
  [v1 setSoundDetectionKShotListeningState:1];
}

- (void)enterListeningStateWithCheckmarkIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = [(TrainDetectorController *)self savedSoundLabel];
  [v5 setHidden:1];

  objc_super v6 = [(TrainDetectorController *)self visualizationView];
  [v6 setHidden:0];

  v7 = [(TrainDetectorController *)self visualizationView];
  v8 = +[UIColor systemBlueColor];
  [v7 setTintColor:v8];

  [(TrainDetectorController *)self updateCheckmarkState:1 checkmarkIndex:v3];
  v9 = [(TrainDetectorController *)self category];
  v10 = [(TrainDetectorController *)self locStringForKShotCategory:v9 key:@"LISTENING"];
  [(TrainDetectorController *)self _updateLabelText:v10];

  id v11 = [(TrainDetectorController *)self learnMoreLinkButton];
  [v11 setHidden:1];
}

- (void)updateCheckmarkState:(int64_t)a3 checkmarkIndex:(int)a4
{
  id v7 = [(TrainDetectorController *)self checkmarkViews];
  objc_super v6 = [v7 objectAtIndexedSubscript:a4];
  [v6 setCheckmarkState:a3];
}

- (void)enterTimeoutState
{
  uint64_t v3 = [(TrainDetectorController *)self category];
  v4 = [(TrainDetectorController *)self locStringForKShotCategory:v3 key:@"TIMEOUT"];
  [(TrainDetectorController *)self _updateLabelText:v4];

  objc_super v5 = +[UIColor labelColor];
  objc_super v6 = [(TrainDetectorController *)self label];
  [v6 setTextColor:v5];

  id v7 = [(TrainDetectorController *)self savedSoundLabel];
  [v7 setHidden:1];

  v8 = [(TrainDetectorController *)self visualizationView];
  [v8 setHidden:1];

  if (self->_learnMoreLinkButton)
  {
    id v9 = [(TrainDetectorController *)self learnMoreLinkButton];
    [v9 setHidden:0];
  }
  else
  {
    [(TrainDetectorController *)self _setupLearnMoreLinkButton];
  }
}

- (void)enterWaitingForSaveState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = [(TrainDetectorController *)self savedSoundLabel];
  [v5 setHidden:1];

  objc_super v6 = [(TrainDetectorController *)self visualizationView];
  [v6 setHidden:1];

  id v7 = +[UIColor labelColor];
  v8 = [(TrainDetectorController *)self label];
  [v8 setTextColor:v7];

  id v9 = [(TrainDetectorController *)self category];
  v10 = [(TrainDetectorController *)self locStringForKShotCategory:v9 key:@"WAITING_FOR_SAVE"];
  [(TrainDetectorController *)self _updateLabelText:v10];

  [(TrainDetectorController *)self updateCheckmarkState:3 checkmarkIndex:v3];
}

- (void)enterSavingStateWithCheckmarkIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = settingsLocString(@"SAVING_SOUND", @"SoundDetection");
  [(TrainDetectorController *)self _updateLabelText:v5];

  [(TrainDetectorController *)self updateCheckmarkState:4 checkmarkIndex:v3];
}

- (void)resetCheckmarkIndex:(int)a3
{
}

- (void)presentLearnMorePane
{
  id v2 = [(TrainDetectorController *)self learnMoreDelegate];
  [v2 presentLearnMorePane];
}

- (void)enterModelSimilarityWarningState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = settingsLocString(@"MODEL_SIMILARITY_WARNING", @"SoundDetection");
  [(TrainDetectorController *)self _updateLabelText:v5];

  [(TrainDetectorController *)self updateCheckmarkState:5 checkmarkIndex:v3];
}

- (void)enterDoneState
{
  uint64_t v3 = [(TrainDetectorController *)self headerView];
  v4 = settingsLocString(@"RECORDING_COMPLETE", @"SoundDetection");
  [v3 setDetailText:v4];

  objc_super v5 = [(TrainDetectorController *)self visualizationView];
  [v5 setHidden:1];

  objc_super v6 = [(TrainDetectorController *)self savedSoundLabel];
  [v6 setHidden:1];

  id v7 = [(TrainDetectorController *)self learnMoreLinkButton];
  [v7 setHidden:1];

  v8 = +[UIColor labelColor];
  id v9 = [(TrainDetectorController *)self label];
  [v9 setTextColor:v8];

  settingsLocString(@"TRAINING_TIME_EXPLANATION", @"SoundDetection");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(TrainDetectorController *)self _updateLabelText:v10];
}

- (void)_updateLabelText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TrainDetectorController *)self label];
  [v5 setText:v4];

  objc_super v6 = [(TrainDetectorController *)self label];
  [v6 sizeToFit];

  LODWORD(v6) = UIAccessibilityLayoutChangedNotification;
  id v7 = [(TrainDetectorController *)self label];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v7);
}

- (void)_updateVisualizerWithValues:(id)a3
{
  id v4 = a3;
  id v5 = [(TrainDetectorController *)self visualizationView];
  [v5 updateWithMagnitudes:v4];
}

- (void)_setupVerticalStackView
{
  id v3 = objc_alloc_init((Class)UIStackView);
  [(TrainDetectorController *)self setVerticalStackView:v3];

  id v4 = [(TrainDetectorController *)self verticalStackView];
  [v4 setDistribution:4];

  id v5 = [(TrainDetectorController *)self verticalStackView];
  [v5 setAxis:1];

  objc_super v6 = [(TrainDetectorController *)self verticalStackView];
  [v6 setSpacing:10.0];

  id v7 = [(TrainDetectorController *)self verticalStackView];
  [v7 setAlignment:3];

  id v9 = [(TrainDetectorController *)self contentView];
  v8 = [(TrainDetectorController *)self verticalStackView];
  [v9 addSubview:v8];
}

- (void)_constrainVerticalStackView
{
  id v3 = [(TrainDetectorController *)self verticalStackView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(TrainDetectorController *)self verticalStackView];
  id v5 = [v4 leftAnchor];
  objc_super v6 = [(TrainDetectorController *)self contentView];
  id v7 = [v6 leftAnchor];
  v8 = [v5 constraintEqualToAnchor:v7 constant:10.0];
  [v8 setActive:1];

  id v9 = [(TrainDetectorController *)self verticalStackView];
  id v10 = [v9 rightAnchor];
  id v11 = [(TrainDetectorController *)self contentView];
  dispatch_time_t v12 = [v11 rightAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
  [v13 setActive:1];

  v14 = [(TrainDetectorController *)self verticalStackView];
  v15 = [v14 topAnchor];
  v16 = [(TrainDetectorController *)self checkmarkStackView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:70.0];
  [v18 setActive:1];

  id v23 = [(TrainDetectorController *)self verticalStackView];
  v19 = [v23 bottomAnchor];
  v20 = [(TrainDetectorController *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:-70.0];
  [v22 setActive:1];
}

- (void)_setupVisualizationView
{
  id v3 = objc_alloc_init(SoundDetectionAudioVisualizationView);
  [(TrainDetectorController *)self setVisualizationView:v3];

  id v4 = [(TrainDetectorController *)self verticalStackView];
  id v5 = [(TrainDetectorController *)self visualizationView];
  [v4 addArrangedSubview:v5];

  id v6 = [(TrainDetectorController *)self visualizationView];
  [v6 setHidden:1];
}

- (void)_setupCheckmarkViews
{
  id v3 = [(TrainDetectorController *)self checkmarkViews];

  if (!v3)
  {
    id v4 = +[NSMutableArray array];
    [(TrainDetectorController *)self setCheckmarkViews:v4];
  }
  int v5 = 5;
  do
  {
    id v6 = objc_alloc_init(CheckmarkTrainingView);
    id v7 = [(TrainDetectorController *)self checkmarkViews];
    [v7 addObject:v6];

    --v5;
  }
  while (v5);
  id v8 = objc_alloc((Class)UIStackView);
  id v9 = [(TrainDetectorController *)self checkmarkViews];
  id v10 = [v8 initWithArrangedSubviews:v9];
  [(TrainDetectorController *)self setCheckmarkStackView:v10];

  id v11 = [(TrainDetectorController *)self checkmarkStackView];
  [v11 setDistribution:4];

  dispatch_time_t v12 = [(TrainDetectorController *)self checkmarkStackView];
  [v12 setAxis:0];

  id v13 = [(TrainDetectorController *)self checkmarkStackView];
  [v13 setSpacing:10.0];

  v14 = [(TrainDetectorController *)self checkmarkStackView];
  [v14 setAlignment:3];

  id v16 = [(TrainDetectorController *)self contentView];
  v15 = [(TrainDetectorController *)self checkmarkStackView];
  [v16 addSubview:v15];
}

- (void)_constrainCheckmarkStackView
{
  id v3 = [(TrainDetectorController *)self checkmarkStackView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(TrainDetectorController *)self checkmarkStackView];
  int v5 = [v4 leftAnchor];
  id v6 = [(TrainDetectorController *)self contentView];
  id v7 = [v6 leftAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7 constant:10.0];
  [v8 setActive:1];

  id v9 = [(TrainDetectorController *)self checkmarkStackView];
  id v10 = [v9 rightAnchor];
  id v11 = [(TrainDetectorController *)self contentView];
  dispatch_time_t v12 = [v11 rightAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
  [v13 setActive:1];

  id v18 = [(TrainDetectorController *)self checkmarkStackView];
  v14 = [v18 topAnchor];
  v15 = [(TrainDetectorController *)self contentView];
  id v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:70.0];
  [v17 setActive:1];
}

- (void)_setupLabel
{
  id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v3;

  int v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v6 = [(TrainDetectorController *)self label];
  [v6 setFont:v5];

  id v7 = [(TrainDetectorController *)self label];
  [v7 setTextAlignment:1];

  id v8 = [(TrainDetectorController *)self label];
  [v8 setNumberOfLines:0];

  id v9 = [(TrainDetectorController *)self label];
  [v9 setLineBreakMode:0];

  id v10 = [(TrainDetectorController *)self label];
  [v10 setAdjustsFontForContentSizeCategory:1];

  id v12 = [(TrainDetectorController *)self verticalStackView];
  id v11 = [(TrainDetectorController *)self label];
  [v12 addArrangedSubview:v11];
}

- (void)_setupSavedSoundLabel
{
  id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  savedSoundLabel = self->_savedSoundLabel;
  self->_savedSoundLabel = v3;

  int v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v6 = [(TrainDetectorController *)self savedSoundLabel];
  [v6 setFont:v5];

  id v7 = [(TrainDetectorController *)self savedSoundLabel];
  [v7 setTextAlignment:1];

  id v8 = +[UIColor secondaryLabelColor];
  id v9 = [(TrainDetectorController *)self savedSoundLabel];
  [v9 setTextColor:v8];

  id v10 = [(TrainDetectorController *)self savedSoundLabel];
  [v10 setNumberOfLines:0];

  id v11 = [(TrainDetectorController *)self savedSoundLabel];
  [v11 setLineBreakMode:0];

  id v12 = [(TrainDetectorController *)self savedSoundLabel];
  [v12 setAdjustsFontForContentSizeCategory:1];

  id v13 = [(TrainDetectorController *)self contentView];
  v14 = [(TrainDetectorController *)self savedSoundLabel];
  [v13 addSubview:v14];

  id v15 = [(TrainDetectorController *)self savedSoundLabel];
  [v15 setHidden:1];
}

- (void)_constrainSavedSoundLabel
{
  id v3 = [(TrainDetectorController *)self savedSoundLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(TrainDetectorController *)self savedSoundLabel];
  int v5 = [v4 leftAnchor];
  id v6 = [(TrainDetectorController *)self contentView];
  id v7 = [v6 leftAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7 constant:10.0];
  [v8 setActive:1];

  id v9 = [(TrainDetectorController *)self savedSoundLabel];
  id v10 = [v9 rightAnchor];
  id v11 = [(TrainDetectorController *)self contentView];
  id v12 = [v11 rightAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
  [v13 setActive:1];

  id v18 = [(TrainDetectorController *)self savedSoundLabel];
  v14 = [v18 topAnchor];
  id v15 = [(TrainDetectorController *)self checkmarkStackView];
  id v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:10.0];
  [v17 setActive:1];
}

- (void)_setupLearnMoreLinkButton
{
  id v3 = +[UIButton buttonWithType:1];
  learnMoreLinkButton = self->_learnMoreLinkButton;
  self->_learnMoreLinkButton = v3;

  int v5 = [(TrainDetectorController *)self learnMoreLinkButton];
  [v5 addTarget:self action:"presentLearnMorePane" forControlEvents:64];

  id v6 = [(TrainDetectorController *)self learnMoreLinkButton];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, 150.0, 50.0);

  id v7 = [(TrainDetectorController *)self learnMoreLinkButton];
  id v8 = +[UIColor systemBlueColor];
  [v7 setTitleColor:v8 forState:0];

  id v9 = [(TrainDetectorController *)self learnMoreLinkButton];
  id v10 = settingsLocString(@"LEARN_MORE_BUTTON", @"SoundDetection");
  [v9 setTitle:v10 forState:0];

  id v11 = [(TrainDetectorController *)self learnMoreLinkButton];
  id v12 = [v11 titleLabel];
  id v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v12 setFont:v13];

  v14 = [(TrainDetectorController *)self learnMoreLinkButton];
  id v15 = [v14 titleLabel];
  [v15 setAdjustsFontForContentSizeCategory:1];

  id v16 = [(TrainDetectorController *)self learnMoreLinkButton];
  v17 = [v16 titleLabel];
  [v17 setNumberOfLines:0];

  id v18 = [(TrainDetectorController *)self learnMoreLinkButton];
  v19 = [v18 titleLabel];
  [v19 setLineBreakMode:0];

  v20 = [(TrainDetectorController *)self learnMoreLinkButton];
  v21 = [v20 titleLabel];
  [v21 setTextAlignment:1];

  id v23 = [(TrainDetectorController *)self verticalStackView];
  v22 = [(TrainDetectorController *)self learnMoreLinkButton];
  [v23 addArrangedSubview:v22];
}

- (void)_constrainVisualizationView
{
  id v3 = [(TrainDetectorController *)self visualizationView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(TrainDetectorController *)self visualizationView];
  int v5 = [v4 leftAnchor];
  id v6 = [(TrainDetectorController *)self verticalStackView];
  id v7 = [v6 leftAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7 constant:10.0];
  [v8 setActive:1];

  id v9 = [(TrainDetectorController *)self visualizationView];
  id v10 = [v9 rightAnchor];
  id v11 = [(TrainDetectorController *)self verticalStackView];
  id v12 = [v11 rightAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
  [v13 setActive:1];

  id v16 = [(TrainDetectorController *)self visualizationView];
  v14 = [v16 heightAnchor];
  id v15 = [v14 constraintEqualToConstant:90.0];
  [v15 setActive:1];
}

- (void)updateProgressToState:(int64_t)a3
{
  self->_state = a3;
  int64_t v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 4)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [(TrainDetectorController *)self checkmarkViews];
      id v8 = [v7 objectAtIndexedSubscript:v6];
      [v8 setCheckmarkState:2];

      ++v6;
    }
    while (a3 != v6);
    switch(v3)
    {
      case 0:
        id v9 = [(TrainDetectorController *)self savedSoundLabel];
        id v10 = @"FIRST_SOUND_SAVED";
        goto LABEL_10;
      case 1:
        id v9 = [(TrainDetectorController *)self savedSoundLabel];
        id v10 = @"SECOND_SOUND_SAVED";
        goto LABEL_10;
      case 2:
        id v9 = [(TrainDetectorController *)self savedSoundLabel];
        id v10 = @"THIRD_SOUND_SAVED";
        goto LABEL_10;
      case 3:
        id v9 = [(TrainDetectorController *)self savedSoundLabel];
        id v10 = @"FOURTH_SOUND_SAVED";
LABEL_10:
        id v11 = settingsLocString(v10, @"SoundDetection");
        [v9 setText:v11];

        break;
      default:
        break;
    }
    id v12 = [(TrainDetectorController *)self savedSoundLabel];
    [v12 setHidden:0];

    id v13 = [(TrainDetectorController *)self savedSoundLabel];
    [v13 sizeToFit];
  }
}

- (id)locStringForKShotCategory:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:AXSDDetectorCategoryAlarm])
  {
    CFStringRef v7 = @"_ALARM";
  }
  else if ([v5 isEqualToString:AXSDDetectorCategoryHousehold])
  {
    CFStringRef v7 = @"_APPLIANCE";
  }
  else
  {
    CFStringRef v7 = &stru_20F6B8;
  }
  id v8 = [v6 stringByAppendingString:v7];

  id v9 = settingsLocString(v8, @"SoundDetection");

  return v9;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (AXSDLearnMoreDelegate)learnMoreDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_learnMoreDelegate);

  return (AXSDLearnMoreDelegate *)WeakRetained;
}

- (void)setLearnMoreDelegate:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (CheckmarkTrainingView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (SoundDetectionAudioVisualizationView)visualizationView
{
  return self->_visualizationView;
}

- (void)setVisualizationView:(id)a3
{
}

- (NSMutableArray)checkmarkViews
{
  return self->_checkmarkViews;
}

- (void)setCheckmarkViews:(id)a3
{
}

- (UIStackView)checkmarkStackView
{
  return self->_checkmarkStackView;
}

- (void)setCheckmarkStackView:(id)a3
{
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
}

- (UIButton)learnMoreLinkButton
{
  return self->_learnMoreLinkButton;
}

- (void)setLearnMoreLinkButton:(id)a3
{
}

- (UILabel)savedSoundLabel
{
  return self->_savedSoundLabel;
}

- (void)setSavedSoundLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedSoundLabel, 0);
  objc_storeStrong((id *)&self->_learnMoreLinkButton, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_checkmarkStackView, 0);
  objc_storeStrong((id *)&self->_checkmarkViews, 0);
  objc_storeStrong((id *)&self->_visualizationView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_learnMoreDelegate);

  objc_storeStrong((id *)&self->_label, 0);
}

@end