@interface PersonalAudioStimuliViewController
- (MPVolumeSlider)volumeSlider;
- (NSArray)currentLayout;
- (NSString)captionText;
- (OBLinkTrayButton)linkButton;
- (OBTrayButton)nextButton;
- (PAEnrollmentNode)currentNode;
- (PAEnrollmentNode)previousNode;
- (PAEnrollmentNode)selectedNode;
- (PersonalAudioOptionControl)optionControl;
- (PersonalAudioStimuliViewController)initWithEnrollmentNode:(id)a3 previousNode:(id)a4 andDelegate:(id)a5;
- (PersonalAudioStimuliViewControllerDelegate)delegate;
- (PersonalAudioVisualizerView)visualizerView;
- (UILabel)instructions;
- (int64_t)contentViewLayout;
- (unint64_t)tuningIndex;
- (void)_startPlayingStimuli;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)didSelectOptionControl:(id)a3;
- (void)headphoneStateChangedNotification:(id)a3;
- (void)mediaServerDied;
- (void)nextButtonTapped:(id)a3;
- (void)registerNotifications;
- (void)setCaptionText:(id)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setCurrentNode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setOptionControl:(id)a3;
- (void)setPreviousNode:(id)a3;
- (void)setSelectedNode:(id)a3;
- (void)setTuningIndex:(unint64_t)a3;
- (void)setVisualizerView:(id)a3;
- (void)setVolumeSlider:(id)a3;
- (void)skipButtonTapped:(id)a3;
- (void)updateButtonTrayCaption:(id)a3;
- (void)updateHeadphoneState;
- (void)updateViewForCurrentNode;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)volumeDidChanged:(id)a3;
@end

@implementation PersonalAudioStimuliViewController

- (PersonalAudioStimuliViewController)initWithEnrollmentNode:(id)a3 previousNode:(id)a4 andDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 section] == (char *)&dword_4 + 1;
  v12 = [v8 heading];
  v13 = [v8 instructions];
  v18.receiver = self;
  v18.super_class = (Class)PersonalAudioStimuliViewController;
  v14 = [(PersonalAudioStimuliViewController *)&v18 initWithTitle:v12 detailText:v13 icon:0 adoptTableViewScrollView:v11];

  if (v14)
  {
    [(PersonalAudioStimuliViewController *)v14 setDelegate:v10];
    [(PersonalAudioStimuliViewController *)v14 setCurrentNode:v8];
    [(PersonalAudioStimuliViewController *)v14 setPreviousNode:v9];
    if (+[HCUtilities deviceIsSmallPhone])
    {
      v15 = &layouts;
    }
    else if ((+[HCUtilities deviceIsBigPhone] & 1) != 0 {
           || +[HCUtilities deviceIsPad])
    }
    {
      v15 = &xmmword_466A0;
    }
    else
    {
      v15 = &xmmword_46680;
    }
    long long v16 = v15[1];
    xmmword_469F0 = *v15;
    *(_OWORD *)&qword_46A00 = v16;
    [(PersonalAudioStimuliViewController *)v14 registerNotifications];
    [(PersonalAudioStimuliViewController *)v14 updateHeadphoneState];
  }

  return v14;
}

- (int64_t)contentViewLayout
{
  if ([(PAEnrollmentNode *)self->_currentNode section] == (char *)&dword_4 + 1) {
    return 3;
  }
  else {
    return 2;
  }
}

- (void)registerNotifications
{
  v3 = +[AVSystemController sharedAVSystemController];
  v13[0] = AVSystemController_HeadphoneJackIsConnectedDidChangeNotification;
  v13[1] = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v13[2] = AVSystemController_SystemVolumeDidChangeNotification;
  v13[3] = AVSystemController_ServerConnectionDiedNotification;
  v4 = +[NSArray arrayWithObjects:v13 count:4];
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"headphoneStateChangedNotification:" name:AVSystemController_HeadphoneJackIsConnectedDidChangeNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"headphoneStateChangedNotification:" name:AVAudioSessionRouteChangeNotification object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"headphoneStateChangedNotification:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"volumeDidChanged:" name:AVSystemController_SystemVolumeDidChangeNotification object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"audioSessionWasInterrupted:" name:AVAudioSessionInterruptionNotification object:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  uint64_t v11 = AVSystemController_ServerConnectionDiedNotification;
  v12 = +[AVSystemController sharedAVSystemController];
  [v10 addObserver:self selector:"mediaServerDied" name:v11 object:v12];
}

- (void)mediaServerDied
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(PersonalAudioStimuliViewController *)self performSelector:"registerNotifications" withObject:0 afterDelay:2.0];

  [(PersonalAudioStimuliViewController *)self headphoneStateChangedNotification:0];
}

- (void)headphoneStateChangedNotification:(id)a3
{
  id v3 = a3;
  PAInitializeLogging();
  v4 = +[NSString stringWithFormat:@"Headphone changed %@", v3];

  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioStimuliViewController headphoneStateChangedNotification:]", 160, v4);
  v6 = (void *)PAEngineeringLog;
  if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    id v10 = [v7 UTF8String];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)updateHeadphoneState
{
}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 valueForKey:AVAudioSessionInterruptionOptionKey];
  [v5 intValue];

  v6 = [v3 userInfo];

  id v7 = [v6 valueForKey:AVAudioSessionInterruptionTypeKey];
  LODWORD(v5) = [v7 intValue];

  if (!v5) {
    AXPerformBlockOnMainThread();
  }
}

- (void)volumeDidChanged:(id)a3
{
  id v3 = [(PersonalAudioStimuliViewController *)self currentNode];
  v4 = (char *)[v3 section];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)updateButtonTrayCaption:(id)a3
{
  objc_storeStrong((id *)&self->_captionText, a3);
  id v5 = a3;
  id v6 = [(PersonalAudioStimuliViewController *)self buttonTray];
  [v6 setCaptionText:v5 style:2];
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)PersonalAudioStimuliViewController;
  [(PersonalAudioStimuliViewController *)&v45 viewDidLoad];
  [(PersonalAudioStimuliViewController *)self setEdgesForExtendedLayout:5];
  id v3 = +[NSMutableArray array];
  v4 = +[OBBoldTrayButton boldButton];
  nextButton = self->_nextButton;
  self->_nextButton = v4;

  [(OBTrayButton *)self->_nextButton addTarget:self action:"nextButtonTapped:" forControlEvents:64];
  id v6 = [(PersonalAudioStimuliViewController *)self buttonTray];
  [v6 addButton:self->_nextButton];

  if ((+[HCUtilities deviceIsSmallPhone] & 1) == 0)
  {
    id v7 = [PersonalAudioVisualizerView alloc];
    id v8 = [(PersonalAudioStimuliViewController *)self currentNode];
    id v9 = -[PersonalAudioVisualizerView initWithTuningIndex:](v7, "initWithTuningIndex:", [v8 index]);
    visualizerView = self->_visualizerView;
    self->_visualizerView = v9;

    [(PersonalAudioVisualizerView *)self->_visualizerView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v11 = [(PersonalAudioStimuliViewController *)self contentView];
    [v11 addSubview:self->_visualizerView];

    v12 = _NSDictionaryOfVariableBindings(@"_visualizerView", self->_visualizerView, 0);
    v13 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_visualizerView]-|", 0, 0, v12);
    [v3 addObjectsFromArray:v13];
  }
  v14 = objc_alloc_init(PersonalAudioOptionControl);
  optionControl = self->_optionControl;
  self->_optionControl = v14;

  [(PersonalAudioOptionControl *)self->_optionControl setDelegate:self];
  [(PersonalAudioOptionControl *)self->_optionControl setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v16 = [(PersonalAudioStimuliViewController *)self contentView];
  [v16 addSubview:self->_optionControl];

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2050000000;
  v17 = (void *)qword_46A10;
  uint64_t v50 = qword_46A10;
  if (!qword_46A10)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_224FC;
    v46[3] = &unk_3C998;
    v46[4] = &v47;
    sub_224FC((uint64_t)v46);
    v17 = (void *)v48[3];
  }
  objc_super v18 = v17;
  _Block_object_dispose(&v47, 8);
  v19 = (MPVolumeSlider *)objc_msgSend([v18 alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  volumeSlider = self->_volumeSlider;
  self->_volumeSlider = v19;

  v21 = +[UIColor systemGrayColor];
  v22 = +[UIImage _systemImageNamed:@"speaker.fill"];
  uint64_t v23 = [v22 imageWithTintColor:v21 renderingMode:1];

  v24 = +[UIImage _systemImageNamed:@"speaker.wave.3.fill"];
  v25 = [v24 imageWithTintColor:v21 renderingMode:1];

  v44 = (void *)v23;
  [(MPVolumeSlider *)self->_volumeSlider setMinimumValueImage:v23];
  [(MPVolumeSlider *)self->_volumeSlider setMaximumValueImage:v25];
  [(MPVolumeSlider *)self->_volumeSlider setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [(PersonalAudioStimuliViewController *)self contentView];
  [v26 addSubview:self->_volumeSlider];

  v27 = (UILabel *)objc_alloc_init((Class)UILabel);
  instructions = self->_instructions;
  self->_instructions = v27;

  [(UILabel *)self->_instructions setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_instructions setTextAlignment:1];
  [(UILabel *)self->_instructions setNumberOfLines:0];
  v29 = self->_instructions;
  v30 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [(UILabel *)v29 setFont:v30];

  [(UILabel *)self->_instructions setText:0];
  v31 = [(PersonalAudioStimuliViewController *)self contentView];
  [v31 addSubview:self->_instructions];

  v32 = +[OBLinkTrayButton linkButton];
  linkButton = self->_linkButton;
  self->_linkButton = v32;

  [(OBLinkTrayButton *)self->_linkButton addTarget:self action:"skipButtonTapped:" forControlEvents:64];
  v34 = _NSDictionaryOfVariableBindings(@"_optionControl", self->_optionControl, 0);
  v35 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_optionControl]-|", 0, 0, v34);
  [v3 addObjectsFromArray:v35];

  v36 = _NSDictionaryOfVariableBindings(@"_instructions", self->_instructions, 0);
  v37 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_instructions]-|", 0, 0, v36);
  [v3 addObjectsFromArray:v37];

  v38 = _NSDictionaryOfVariableBindings(@"_volumeSlider", self->_volumeSlider, 0);
  v39 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_volumeSlider]-|", 0, 0, v38);
  [v3 addObjectsFromArray:v39];

  if (self->_visualizerView)
  {
    v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"V:|-(%lf)-[_visualizerView]-(%lf)-[_optionControl]-(%lf)-[_instructions]-(%lf)-[_volumeSlider]-|", xmmword_469F0, qword_46A00, qword_46A08);
    _NSDictionaryOfVariableBindings(@"_visualizerView, _optionControl, _instructions, _volumeSlider", self->_visualizerView, self->_optionControl, self->_instructions, self->_volumeSlider, 0);
  }
  else
  {
    v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"V:|-(%lf)-[_optionControl]-(%lf)-[_instructions]-(%lf)-[_volumeSlider]-|", *((void *)&xmmword_469F0 + 1), qword_46A00, qword_46A08);
    _NSDictionaryOfVariableBindings(@"_optionControl, _instructions, _volumeSlider", self->_optionControl, self->_instructions, self->_volumeSlider, 0);
  v41 = };
  v42 = +[NSLayoutConstraint constraintsWithVisualFormat:v40 options:0 metrics:0 views:v41];
  [v3 addObjectsFromArray:v42];

  v43 = [(PersonalAudioStimuliViewController *)self contentView];
  [v43 addConstraints:v3];

  [(PersonalAudioStimuliViewController *)self updateViewForCurrentNode];
}

- (void)skipButtonTapped:(id)a3
{
  self->_skippedSection = 1;
  v4 = (char *)[(PAEnrollmentNode *)self->_currentNode section];
  if (v4 == (unsigned char *)&dword_4 + 1)
  {
    id v7 = +[PASettings sharedInstance];
    [v7 resetValueForSelector:"transparencyAmplification"];

    id v8 = +[PASettings sharedInstance];
    [v8 resetValueForSelector:"transparencyBalance"];

    id v9 = +[PASettings sharedInstance];
    [v9 resetValueForSelector:"transparencyTone"];

    id v10 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    id v6 = [v10 address];

    uint64_t v11 = +[PASettings sharedInstance];
    [v11 setTransparencyCustomized:0 forAddress:v6];
  }
  else
  {
    if (v4 != (unsigned char *)&dword_4 + 2) {
      goto LABEL_6;
    }
    id v5 = +[PASettings sharedInstance];
    [v5 setPersonalMediaConfiguration:0];

    id v6 = +[PASettings sharedInstance];
    [v6 setPersonalMediaEnabled:0];
  }

LABEL_6:

  [(PersonalAudioStimuliViewController *)self nextButtonTapped:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PersonalAudioStimuliViewController;
  [(PersonalAudioStimuliViewController *)&v4 viewWillAppear:a3];
  [(PersonalAudioStimuliViewController *)self updateButtonTrayCaption:self->_captionText];
  [(PersonalAudioStimuliViewController *)self registerNotifications];
  [(PersonalAudioStimuliViewController *)self updateHeadphoneState];
  [(PersonalAudioStimuliViewController *)self updateViewForCurrentNode];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PersonalAudioStimuliViewController;
  [(PersonalAudioStimuliViewController *)&v4 viewDidAppear:a3];
  [(PersonalAudioStimuliViewController *)self updateButtonTrayCaption:self->_captionText];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PersonalAudioStimuliViewController;
  [(PersonalAudioStimuliViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)updateViewForCurrentNode
{
  self->_skippedSection = 0;
  if (!self->_currentRouteSupported)
  {
    [(PersonalAudioStimuliViewController *)self setSelectedNode:0];
    v13 = [(PersonalAudioStimuliViewController *)self currentNode];
    v14 = [v13 stimuli];
    [v14 enumerateObjectsUsingBlock:&stru_3CE70];

    [(PersonalAudioOptionControl *)self->_optionControl setHidden:1];
    [(PersonalAudioVisualizerView *)self->_visualizerView setHidden:1];
    [(MPVolumeSlider *)self->_volumeSlider setHidden:1];
    [(UILabel *)self->_instructions setHidden:1];
    v15 = paLocString();
    [(PersonalAudioStimuliViewController *)self updateButtonTrayCaption:v15];

    nextButton = self->_nextButton;
    v17 = paLocString();
    [(OBTrayButton *)nextButton setTitle:v17 forState:0];

    goto LABEL_31;
  }
  [(PersonalAudioStimuliViewController *)self updateButtonTrayCaption:&stru_3D6D8];
  id v3 = paLocString();
  visualizerView = self->_visualizerView;
  objc_super v5 = [(PersonalAudioStimuliViewController *)self currentNode];
  id v6 = [v5 stimuli];
  -[PersonalAudioVisualizerView setHidden:](visualizerView, "setHidden:", [v6 count] == 0);

  [(UILabel *)self->_instructions setHidden:0];
  id v7 = [(PersonalAudioStimuliViewController *)self currentNode];
  id v8 = [v7 options];

  if ((unint64_t)[v8 count] >= 2)
  {
    id v9 = [(PersonalAudioStimuliViewController *)self currentNode];
    id v10 = (char *)[v9 section];

    if (v10 != (unsigned char *)&dword_4 + 1)
    {
      p_optionControl = &self->_optionControl;
      optionControl = self->_optionControl;
      uint64_t v19 = [v8 firstObject];
      v20 = [v8 lastObject];
      [(PersonalAudioOptionControl *)optionControl updateWithLeftNode:v19 andRightNode:v20];

      v21 = [v8 lastObject];
      LOBYTE(v19) = [v21 isSelected];

      if (v19)
      {
        uint64_t v22 = 2;
      }
      else
      {
        uint64_t v23 = [v8 firstObject];
        unsigned int v24 = [v23 isSelected];

        if (!v24)
        {
LABEL_11:
          uint64_t v12 = 0;
          goto LABEL_12;
        }
        uint64_t v22 = 1;
      }
      [(PersonalAudioOptionControl *)*p_optionControl selectItem:v22];
      goto LABEL_11;
    }
  }
  p_optionControl = &self->_optionControl;
  uint64_t v12 = 1;
LABEL_12:
  [(PersonalAudioOptionControl *)*p_optionControl setHidden:v12];
  volumeSlider = self->_volumeSlider;
  v26 = [(PersonalAudioStimuliViewController *)self currentNode];
  -[MPVolumeSlider setHidden:](volumeSlider, "setHidden:", [v26 section] != &dword_4);

  v27 = [(PersonalAudioStimuliViewController *)self currentNode];
  v28 = [v27 options];
  v29 = (char *)[v28 count];

  if (v29 == (unsigned char *)&dword_0 + 1)
  {
    v30 = [(PersonalAudioStimuliViewController *)self currentNode];
    v31 = [v30 options];
    v32 = [v31 firstObject];
    [(PersonalAudioStimuliViewController *)self setSelectedNode:v32];
  }
  v33 = [(PersonalAudioStimuliViewController *)self currentNode];
  id v34 = [v33 section];

  BOOL v36 = 0;
  v37 = 0;
  switch((unint64_t)v34)
  {
    case 1uLL:
      v43 = paLocString();
      [(PersonalAudioStimuliViewController *)self updateButtonTrayCaption:v43];

      goto LABEL_18;
    case 2uLL:
      LODWORD(v35) = 0.5;
      [(MPVolumeSlider *)self->_volumeSlider setValue:v35];
      uint64_t v77 = 0;
      v78 = &v77;
      uint64_t v79 = 0x3032000000;
      v80 = sub_21964;
      v81 = sub_21974;
      id v82 = 0;
      v39 = [(PersonalAudioStimuliViewController *)self currentNode];
      v40 = [v39 options];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_2197C;
      v76[3] = &unk_3CE50;
      v76[4] = &v77;
      [v40 enumerateObjectsUsingBlock:v76];

      v41 = +[PASettings sharedInstance];
      [v41 setPersonalMediaConfiguration:v78[5]];

      v42 = +[PASettings sharedInstance];
      [v42 setPersonalMediaEnabled:v78[5] != 0];

      _Block_object_dispose(&v77, 8);
LABEL_18:
      v37 = 0;
      goto LABEL_27;
    case 4uLL:
      v44 = [(PersonalAudioStimuliViewController *)self previousNode];
      objc_super v45 = (char *)[v44 type];

      BOOL v36 = v45 == (unsigned char *)&dword_0 + 2;
      if (v45 == (unsigned char *)&dword_0 + 2)
      {
        LODWORD(v46) = 0.25;
        [(MPVolumeSlider *)self->_volumeSlider setValue:v46];
      }
      v37 = paLocString();
      break;
    case 5uLL:
      uint64_t v47 = +[PAStimulus sinStimulus];
      [v47 stop];

      v48 = +[PAStimulus musicStimulus];
      [v48 stop];

      uint64_t v49 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      uint64_t v50 = [v49 address];

      v51 = +[PASettings sharedInstance];
      [v51 setTransparencyCustomized:1 forAddress:v50];

      v52 = [(PersonalAudioStimuliViewController *)self tableView];

      if (!v52)
      {
        v53 = objc_alloc_init(AudioAccommodationsTransparencyViewController);
        [(AudioAccommodationsTransparencyViewController *)v53 setDisplayingInEnrollment:1];
        [(AudioAccommodationsTransparencyViewController *)v53 reloadSpecifiers];
        [(AudioAccommodationsTransparencyViewController *)v53 loadView];
        v54 = [(AudioAccommodationsTransparencyViewController *)v53 table];
        transparencyTable = self->_transparencyTable;
        self->_transparencyTable = v54;

        v56 = self->_transparencyTable;
        v57 = +[UIColor clearColor];
        [(UITableView *)v56 setBackgroundColor:v57];

        [(UITableView *)self->_transparencyTable setUserInteractionEnabled:1];
        [(PersonalAudioStimuliViewController *)self setTableView:self->_transparencyTable];
        v71 = _NSConcreteStackBlock;
        uint64_t v72 = 3221225472;
        v73 = sub_219D8;
        v74 = &unk_3C850;
        v75 = self;
        AXPerformSafeBlock();
      }
      linkButton = self->_linkButton;
      v59 = paLocString();
      [(OBLinkTrayButton *)linkButton setTitle:v59 forState:0];

      v60 = [(PersonalAudioStimuliViewController *)self buttonTray];
      [v60 addButton:self->_linkButton];

      uint64_t v38 = paLocString();

      goto LABEL_25;
    case 6uLL:
      v61 = [(PersonalAudioStimuliViewController *)self currentNode];
      v37 = [v61 tuningDescription];

      v62 = self->_linkButton;
      v63 = paLocString();
      [(OBLinkTrayButton *)v62 setTitle:v63 forState:0];

      v64 = [(PersonalAudioStimuliViewController *)self buttonTray];
      [v64 addButton:self->_linkButton];

LABEL_27:
      BOOL v36 = 0;
      break;
    case 7uLL:
    case 8uLL:
      uint64_t v38 = paLocString();

LABEL_25:
      v37 = 0;
      BOOL v36 = 0;
      id v3 = (void *)v38;
      break;
    default:
      break;
  }
  v65 = [(PersonalAudioStimuliViewController *)self instructions];
  [v65 setText:v37];

  [(OBTrayButton *)self->_nextButton setTitle:v3 forState:0];
  if (!v36) {
    [(PersonalAudioStimuliViewController *)self _startPlayingStimuli];
  }

LABEL_31:
  v66 = self->_nextButton;
  if (self->_currentRouteSupported)
  {
    v67 = [(PersonalAudioStimuliViewController *)self selectedNode];
    if (v67)
    {
      [(OBTrayButton *)v66 setEnabled:1];
    }
    else
    {
      v68 = [(PersonalAudioStimuliViewController *)self currentNode];
      v69 = [v68 options];
      if ([v69 count])
      {
        v70 = [(PersonalAudioStimuliViewController *)self currentNode];
        -[OBTrayButton setEnabled:](v66, "setEnabled:", [v70 section] == (char *)&dword_4 + 1);
      }
      else
      {
        [(OBTrayButton *)v66 setEnabled:1];
      }
    }
  }
  else
  {
    [(OBTrayButton *)self->_nextButton setEnabled:0];
  }
}

- (void)_startPlayingStimuli
{
  if (self->_currentRouteSupported)
  {
    objc_initWeak(&location, self);
    id v3 = [(PersonalAudioStimuliViewController *)self currentNode];
    objc_super v4 = [v3 stimuli];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_21B1C;
    v5[3] = &unk_3CEC0;
    objc_copyWeak(&v6, &location);
    [v4 enumerateObjectsUsingBlock:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)didSelectOptionControl:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 selectedNode];
  [(PersonalAudioStimuliViewController *)self setSelectedNode:v5];

  id v6 = [(PersonalAudioStimuliViewController *)self currentNode];
  id v7 = [v6 options];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_21F2C;
  v26[3] = &unk_3CEE8;
  v26[4] = self;
  [v7 enumerateObjectsUsingBlock:v26];

  nextButton = self->_nextButton;
  id v9 = [(PersonalAudioStimuliViewController *)self selectedNode];
  [(OBTrayButton *)nextButton setEnabled:v9 != 0];

  id v10 = [(PersonalAudioStimuliViewController *)self currentNode];
  uint64_t v11 = (char *)[v10 section];

  if (v11 != (unsigned char *)&dword_0 + 2)
  {
    PAInitializeLogging();
    uint64_t v12 = [v4 selectedNode];
    v13 = [v12 configuration];
    v14 = +[NSString stringWithFormat:@"Using configuration: %@", v13];

    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioStimuliViewController didSelectOptionControl:]", 525, v14);
    long long v16 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      objc_super v18 = v16;
      id v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v28 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v20 = +[PASettings sharedInstance];
    v21 = [(PersonalAudioStimuliViewController *)self selectedNode];
    uint64_t v22 = [v21 configuration];
    [v20 setPersonalMediaConfiguration:v22];

    uint64_t v23 = +[PASettings sharedInstance];
    unsigned int v24 = [(PersonalAudioStimuliViewController *)self selectedNode];
    v25 = [v24 configuration];
    [v23 setPersonalMediaEnabled:v25 != 0];
  }
}

- (void)nextButtonTapped:(id)a3
{
  id v4 = [(PersonalAudioStimuliViewController *)self currentNode];
  objc_super v5 = [v4 stimuli];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_2215C;
  v17[3] = &unk_3CD08;
  v17[4] = self;
  [v5 enumerateObjectsUsingBlock:v17];

  if (!self->_skippedSection)
  {
    id v6 = [(PersonalAudioStimuliViewController *)self currentNode];
    id v7 = (char *)[v6 section];

    if (v7 == (unsigned char *)&dword_4 + 2)
    {
      id v8 = +[PASettings sharedInstance];
      id v9 = [(PersonalAudioStimuliViewController *)self currentNode];
      id v10 = [v9 configuration];
      [v8 setPersonalMediaEnabled:v10 != 0];

      uint64_t v11 = +[PASettings sharedInstance];
      uint64_t v12 = [(PersonalAudioStimuliViewController *)self currentNode];
      v13 = [v12 configuration];
      [v11 setPersonalMediaConfiguration:v13];

      v14 = [(PersonalAudioStimuliViewController *)self currentNode];
      [(PersonalAudioStimuliViewController *)self setSelectedNode:v14];
    }
  }
  v15 = [(PersonalAudioStimuliViewController *)self delegate];
  long long v16 = [(PersonalAudioStimuliViewController *)self selectedNode];
  [v15 didSelectEnrollmentNode:v16];
}

- (PAEnrollmentNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
}

- (PAEnrollmentNode)previousNode
{
  return self->_previousNode;
}

- (void)setPreviousNode:(id)a3
{
}

- (PersonalAudioStimuliViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (PAEnrollmentNode)selectedNode
{
  return self->_selectedNode;
}

- (void)setSelectedNode:(id)a3
{
}

- (unint64_t)tuningIndex
{
  return self->_tuningIndex;
}

- (void)setTuningIndex:(unint64_t)a3
{
  self->_tuningIndex = a3;
}

- (OBTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (PersonalAudioVisualizerView)visualizerView
{
  return self->_visualizerView;
}

- (void)setVisualizerView:(id)a3
{
}

- (MPVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
}

- (PersonalAudioOptionControl)optionControl
{
  return self->_optionControl;
}

- (void)setOptionControl:(id)a3
{
}

- (UILabel)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (NSString)captionText
{
  return self->_captionText;
}

- (void)setCaptionText:(id)a3
{
}

- (NSArray)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_optionControl, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_visualizerView, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_selectedNode, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_previousNode, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);

  objc_storeStrong((id *)&self->_transparencyTable, 0);
}

@end