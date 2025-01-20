@interface PersonalAudioEnrollmentViewController
- (BOOL)personalAudioWasEnabled;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (HKAudiogramSample)selectedAudiogram;
- (NSArray)audiograms;
- (OBBoldTrayButton)introControllerNextButton;
- (OBTextWelcomeController)introController;
- (PAConfiguration)currentPersonalAudioConfiguration;
- (PAEnrollment)enrollment;
- (PAEnrollmentNode)currentNode;
- (PersonalAudioEnrollmentViewController)init;
- (int)currentListeningMode;
- (unint64_t)currentPersonalAudioAccommodationTypes;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelModalFlow;
- (void)didSelectAudiogram:(id)a3;
- (void)didSelectEnrollmentNode:(id)a3;
- (void)headphoneStateChangedNotification:(id)a3;
- (void)mediaServerDied;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)overviewNextButtonTapped:(id)a3;
- (void)registerNotifications;
- (void)setAudiograms:(id)a3;
- (void)setCurrentListeningMode:(int)a3;
- (void)setCurrentNode:(id)a3;
- (void)setCurrentPersonalAudioAccommodationTypes:(unint64_t)a3;
- (void)setCurrentPersonalAudioConfiguration:(id)a3;
- (void)setEnrollment:(id)a3;
- (void)setIntroController:(id)a3;
- (void)setIntroControllerNextButton:(id)a3;
- (void)setPersonalAudioWasEnabled:(BOOL)a3;
- (void)setSelectedAudiogram:(id)a3;
- (void)showOverview;
- (void)startEnrollmentWithAudiogram:(id)a3;
- (void)updateHeadphoneState;
- (void)updateIntroButtonTrayCaption:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PersonalAudioEnrollmentViewController

- (PersonalAudioEnrollmentViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PersonalAudioEnrollmentViewController;
  v2 = [(PersonalAudioEnrollmentViewController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(PersonalAudioEnrollmentViewController *)v2 setDelegate:v2];
    v4 = +[PASettings sharedInstance];
    -[PersonalAudioEnrollmentViewController setPersonalAudioWasEnabled:](v3, "setPersonalAudioWasEnabled:", [v4 personalMediaEnabled]);

    v5 = +[PASettings sharedInstance];
    v6 = [v5 personalMediaConfiguration];
    [(PersonalAudioEnrollmentViewController *)v3 setCurrentPersonalAudioConfiguration:v6];

    v7 = +[PASettings sharedInstance];
    -[PersonalAudioEnrollmentViewController setCurrentPersonalAudioAccommodationTypes:](v3, "setCurrentPersonalAudioAccommodationTypes:", [v7 personalAudioAccommodationTypes]);

    v8 = +[PASettings sharedInstance];
    [v8 setPersonalMediaConfiguration:0];

    v9 = +[PASettings sharedInstance];
    [v9 setPersonalMediaEnabled:1];

    v10 = +[PASettings sharedInstance];
    [v10 personalAudioAccommodationTypes];

    uint64_t v11 = compoundAttributeByAddingAttribute();
    v12 = +[PASettings sharedInstance];
    [v12 setPersonalAudioAccommodationTypes:v11];

    v13 = [(PersonalAudioEnrollmentViewController *)v3 presentationController];
    [v13 setDelegate:v3];
  }
  return v3;
}

- (void)registerNotifications
{
  v3 = +[AVSystemController sharedAVSystemController];
  v14[0] = AVSystemController_HeadphoneJackIsConnectedDidChangeNotification;
  v14[1] = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v14[2] = AVSystemController_ServerConnectionDiedNotification;
  v4 = +[NSArray arrayWithObjects:v14 count:3];
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"headphoneStateChangedNotification:" name:AVSystemController_HeadphoneJackIsConnectedDidChangeNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  v7 = +[AVAudioSession sharedInstance];
  [v6 addObserver:self selector:"headphoneStateChangedNotification:" name:AVAudioSessionRouteChangeNotification object:v7];

  v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v10 = +[AVSystemController sharedAVSystemController];
  [v8 addObserver:self selector:"headphoneStateChangedNotification:" name:v9 object:v10];

  uint64_t v11 = +[NSNotificationCenter defaultCenter];
  uint64_t v12 = AVSystemController_ServerConnectionDiedNotification;
  v13 = +[AVSystemController sharedAVSystemController];
  [v11 addObserver:self selector:"mediaServerDied" name:v12 object:v13];
}

- (void)mediaServerDied
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(PersonalAudioEnrollmentViewController *)self performSelector:"registerNotifications" withObject:0 afterDelay:2.0];

  [(PersonalAudioEnrollmentViewController *)self headphoneStateChangedNotification:0];
}

- (void)headphoneStateChangedNotification:(id)a3
{
}

- (void)updateHeadphoneState
{
}

- (void)updateIntroButtonTrayCaption:(id)a3
{
  introController = self->_introController;
  id v4 = a3;
  id v5 = [(OBTextWelcomeController *)introController buttonTray];
  [v5 setCaptionText:v4 style:2];
}

- (void)cancelModalFlow
{
  v3 = paLocString();
  id v4 = +[UIAlertController alertControllerWithTitle:0 message:v3 preferredStyle:0];

  id v5 = paLocString();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_16B44;
  v9[3] = &unk_3CC98;
  v9[4] = self;
  v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:v9];
  [v4 addAction:v6];

  v7 = paLocString();
  v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:&stru_3CCB8];
  [v4 addAction:v8];

  [(PersonalAudioEnrollmentViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    v7 = [v6 performSelector:"currentNode"];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v7 stimuli];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [(PAEnrollmentNode *)self->_currentNode stimuli];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_16E04;
    v15[3] = &unk_3CD08;
    id v16 = v7;
    [v10 enumerateObjectsUsingBlock:v15];
  }
  else
  {
    uint64_t v11 = +[PAStimulus sinStimulus];
    [v11 stop];

    uint64_t v12 = +[PAStimulus musicStimulus];
    [v12 stop];
  }
  [(PersonalAudioEnrollmentViewController *)self setCurrentNode:v7];
  if ((unint64_t)[v7 section] <= 4)
  {
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelModalFlow"];
    v14 = [v6 navigationItem];
    [v14 setRightBarButtonItem:v13];
  }
}

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)PersonalAudioEnrollmentViewController;
  [(PersonalAudioEnrollmentViewController *)&v43 viewDidLoad];
  id v3 = objc_alloc((Class)OBWelcomeController);
  id v4 = paLocString();
  id v5 = [v3 initWithTitle:v4 detailText:0 icon:0];

  id v6 = [v5 headerView];
  [v6 setTitleHyphenationFactor:0.0];

  v7 = +[OBBoldTrayButton boldButton];
  v8 = paLocString();
  [v7 setTitle:v8 forState:0];

  [v7 addTarget:self action:"welcomeNextButtonTapped:" forControlEvents:64];
  id v9 = [v5 buttonTray];
  [v9 addButton:v7];

  v10 = +[UIImage systemImageNamed:@"phone.fill"];
  uint64_t v11 = +[UIColor systemBlueColor];
  uint64_t v12 = [v10 imageWithTintColor:v11 renderingMode:1];
  id v13 = objc_msgSend(v12, "resizeHearingImageToNewSize:", 48.0, 48.0);

  if ([UIApp userInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    uint64_t v14 = [v13 imageWithHorizontallyFlippedOrientation];

    id v13 = (void *)v14;
  }
  objc_super v15 = paLocString();
  id v16 = paLocString();
  [v5 addBulletedListItemWithTitle:v15 description:v16 image:v13];

  v17 = +[UIImage _systemImageNamed:@"music"];
  v18 = +[UIColor systemBlueColor];
  v19 = [v17 imageWithTintColor:v18 renderingMode:1];
  v20 = objc_msgSend(v19, "resizeHearingImageToNewSize:", 48.0, 48.0);

  [v20 size];
  double v22 = v21;
  double v24 = v23;
  v25 = +[UIColor systemBlueColor];
  v26 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v25, 0, v20, 0, v22, v24);

  v27 = paLocString();
  v28 = paLocString();
  [v5 addBulletedListItemWithTitle:v27 description:v28 image:v26];

  if (paPairedDeviceSupportsTransparencyAccommodations())
  {
    v29 = +[UIImage _systemImageNamed:@"person.open.fill"];
    v30 = +[UIColor systemBlueColor];
    v31 = [v29 imageWithTintColor:v30 renderingMode:1];
    v32 = objc_msgSend(v31, "resizeHearingImageToNewSize:", 48.0, 48.0);

    [v32 size];
    double v34 = v33;
    double v36 = v35;
    v37 = +[UIColor systemBlueColor];
    v38 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v37, 0, v32, 0, v34, v36);

    v39 = paLocString();
    v40 = paLocString();
    [v5 addBulletedListItemWithTitle:v39 description:v40 image:v38];
  }
  id v41 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelModalFlow"];
  v42 = [v5 navigationItem];
  [v42 setRightBarButtonItem:v41];

  [(PersonalAudioEnrollmentViewController *)self pushViewController:v5 animated:1];
}

- (void)overviewNextButtonTapped:(id)a3
{
  introController = self->_introController;
  self->_introController = 0;

  introControllerNextButton = self->_introControllerNextButton;
  self->_introControllerNextButton = 0;

  id v6 = [(PersonalAudioEnrollmentViewController *)self selectedAudiogram];
  [(PersonalAudioEnrollmentViewController *)self startEnrollmentWithAudiogram:v6];
}

- (void)showOverview
{
  id v3 = objc_alloc((Class)OBTextWelcomeController);
  id v4 = paLocString();
  id v5 = (OBTextWelcomeController *)[v3 initWithTitle:v4 detailText:0 symbolName:0];
  introController = self->_introController;
  self->_introController = v5;

  v7 = self->_introController;
  v8 = paLocString();
  [(OBTextWelcomeController *)v7 addBulletedListItemWithTitle:v8 description:&stru_3D6D8];

  id v9 = self->_introController;
  v10 = paLocString();
  [(OBTextWelcomeController *)v9 addBulletedListItemWithTitle:v10 description:&stru_3D6D8];

  uint64_t v11 = paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations();

  if (v11)
  {
    uint64_t v12 = self->_introController;
    id v13 = paLocString();
    [(OBTextWelcomeController *)v12 addBulletedListItemWithTitle:v13 description:&stru_3D6D8];
  }
  uint64_t v14 = self->_introController;
  objc_super v15 = paLocString();
  [(OBTextWelcomeController *)v14 addBulletedListItemWithTitle:v15 description:&stru_3D6D8];

  id v16 = +[OBBoldTrayButton boldButton];
  introControllerNextButton = self->_introControllerNextButton;
  self->_introControllerNextButton = v16;

  v18 = self->_introControllerNextButton;
  v19 = paLocString();
  [(OBBoldTrayButton *)v18 setTitle:v19 forState:0];

  [(OBBoldTrayButton *)self->_introControllerNextButton addTarget:self action:"overviewNextButtonTapped:" forControlEvents:64];
  v20 = [(OBTextWelcomeController *)self->_introController buttonTray];
  [v20 addButton:self->_introControllerNextButton];

  [(PersonalAudioEnrollmentViewController *)self pushViewController:self->_introController animated:1];
  [(PersonalAudioEnrollmentViewController *)self registerNotifications];
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)startEnrollmentWithAudiogram:(id)a3
{
  id v5 = +[PAEnrollment enrollmentWithAudiogram:](PAEnrollment, "enrollmentWithAudiogram:");
  [(PersonalAudioEnrollmentViewController *)self setEnrollment:v5];
  id v6 = [v5 enrollmentNodeAfter:0 withSelectedNode:0];
  if (v6)
  {
    PAInitializeLogging();
    v7 = +[NSString stringWithFormat:@"Found first node. Starting enrollment %@", v6];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioEnrollmentViewController startEnrollmentWithAudiogram:]", 323, v7);
    id v9 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      uint64_t v11 = v9;
      *(_DWORD *)buf = 136446210;
      id v29 = [v10 UTF8String];
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(PersonalAudioEnrollmentViewController *)self setCurrentNode:v6];
    uint64_t v12 = [[PersonalAudioStimuliViewController alloc] initWithEnrollmentNode:v6 previousNode:0 andDelegate:self];
    [(PersonalAudioEnrollmentViewController *)self pushViewController:v12 animated:1];

    id v13 = paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations();
    PAInitializeLogging();
    uint64_t v14 = +[NSString stringWithFormat:@"Setting ANC for %@", v13];
    objc_super v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioEnrollmentViewController startEnrollmentWithAudiogram:]", 329, v14);
    id v16 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      v18 = v16;
      id v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v29 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [v13 setListeningMode:2];
  }
  else
  {
    v20 = +[PASettings sharedInstance];
    [v20 setConfigurationCameFromEnrollment:1];

    PAInitializeLogging();
    double v21 = +[PASettings sharedInstance];
    double v22 = [v21 audiogramConfiguration];
    double v23 = +[NSString stringWithFormat:@"Skipping enrollment because no first node. Audiogram: %d, %d", a3 != 0, v22 != 0];

    double v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioEnrollmentViewController startEnrollmentWithAudiogram:]", 335, v23);
    v25 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v24;
      v27 = v25;
      *(_DWORD *)buf = 136446210;
      id v29 = [v26 UTF8String];
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(PersonalAudioEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:&stru_3CD28];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PersonalAudioEnrollmentViewController;
  [(PersonalAudioEnrollmentViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PersonalAudioEnrollmentViewController;
  [(PersonalAudioEnrollmentViewController *)&v5 viewDidDisappear:a3];
  objc_super v3 = +[AVAudioSession sharedInstance];
  [v3 setActive:0 error:0];

  id v4 = +[PASettings sharedInstance];
  [v4 setCurrentEnrollmentProgress:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)didSelectAudiogram:(id)a3
{
  id v4 = a3;
  [(PersonalAudioEnrollmentViewController *)self setSelectedAudiogram:v4];
  if (v4) {
    [(PersonalAudioEnrollmentViewController *)self startEnrollmentWithAudiogram:v4];
  }
  else {
    [(PersonalAudioEnrollmentViewController *)self showOverview];
  }
}

- (void)didSelectEnrollmentNode:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PersonalAudioEnrollmentViewController *)self enrollment];
  id v6 = [(PersonalAudioEnrollmentViewController *)self currentNode];
  v7 = [v5 enrollmentNodeAfter:v6 withSelectedNode:v4];

  if ([v7 section] == (char *)&dword_4 + 1)
  {
    v8 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    self->_currentListeningMode = [v8 listeningMode];
    PAInitializeLogging();
    id v9 = +[NSString stringWithFormat:@"Setting transparency for %@", v8];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioEnrollmentViewController didSelectEnrollmentNode:]", 382, v9);
    uint64_t v11 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)buf = 136446210;
      id v34 = [v12 UTF8String];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [v8 setListeningMode:3];
  }
  if (!v7)
  {
    id v17 = [(PersonalAudioEnrollmentViewController *)self currentNode];
    v18 = [v17 stimuli];

    id v19 = +[PASettings sharedInstance];
    [v19 setConfigurationCameFromEnrollment:1];

    v20 = [(PersonalAudioEnrollmentViewController *)self currentNode];
    double v21 = [v20 configuration];

    if (v21)
    {
      double v22 = [(PersonalAudioEnrollmentViewController *)self currentNode];
      double v23 = [v22 configuration];
      double v24 = (int *)[v23 level];

      v25 = +[PASettings sharedInstance];
      id v26 = [(PersonalAudioEnrollmentViewController *)self currentNode];
      v27 = [v26 configuration];
      if (v24 == &dword_C)
      {
        [v25 setAudiogramConfiguration:v27];

LABEL_13:
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_17F24;
        v31[3] = &unk_3C850;
        v32 = v18;
        objc_super v15 = v18;
        [(PersonalAudioEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:v31];
        id v16 = v32;
        goto LABEL_14;
      }
      [v25 setPersonalMediaConfiguration:v27];

      id v29 = +[PASettings sharedInstance];
      v25 = v29;
      uint64_t v30 = 1;
    }
    else
    {
      v28 = +[PASettings sharedInstance];
      [v28 setPersonalMediaConfiguration:0];

      id v29 = +[PASettings sharedInstance];
      v25 = v29;
      uint64_t v30 = 0;
    }
    [v29 setPersonalMediaEnabled:v30];
    goto LABEL_13;
  }
  uint64_t v14 = [PersonalAudioStimuliViewController alloc];
  objc_super v15 = [(PersonalAudioEnrollmentViewController *)self currentNode];
  id v16 = [(PersonalAudioStimuliViewController *)v14 initWithEnrollmentNode:v7 previousNode:v15 andDelegate:self];
  [(PersonalAudioEnrollmentViewController *)self pushViewController:v16 animated:1];
LABEL_14:
}

- (PAEnrollment)enrollment
{
  return self->_enrollment;
}

- (void)setEnrollment:(id)a3
{
}

- (OBTextWelcomeController)introController
{
  return self->_introController;
}

- (void)setIntroController:(id)a3
{
}

- (OBBoldTrayButton)introControllerNextButton
{
  return self->_introControllerNextButton;
}

- (void)setIntroControllerNextButton:(id)a3
{
}

- (PAEnrollmentNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
}

- (HKAudiogramSample)selectedAudiogram
{
  return self->_selectedAudiogram;
}

- (void)setSelectedAudiogram:(id)a3
{
}

- (NSArray)audiograms
{
  return self->_audiograms;
}

- (void)setAudiograms:(id)a3
{
}

- (BOOL)personalAudioWasEnabled
{
  return self->_personalAudioWasEnabled;
}

- (void)setPersonalAudioWasEnabled:(BOOL)a3
{
  self->_personalAudioWasEnabled = a3;
}

- (PAConfiguration)currentPersonalAudioConfiguration
{
  return self->_currentPersonalAudioConfiguration;
}

- (void)setCurrentPersonalAudioConfiguration:(id)a3
{
}

- (unint64_t)currentPersonalAudioAccommodationTypes
{
  return self->_currentPersonalAudioAccommodationTypes;
}

- (void)setCurrentPersonalAudioAccommodationTypes:(unint64_t)a3
{
  self->_currentPersonalAudioAccommodationTypes = a3;
}

- (int)currentListeningMode
{
  return self->_currentListeningMode;
}

- (void)setCurrentListeningMode:(int)a3
{
  self->_currentListeningMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPersonalAudioConfiguration, 0);
  objc_storeStrong((id *)&self->_audiograms, 0);
  objc_storeStrong((id *)&self->_selectedAudiogram, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_introControllerNextButton, 0);
  objc_storeStrong((id *)&self->_introController, 0);

  objc_storeStrong((id *)&self->_enrollment, 0);
}

@end