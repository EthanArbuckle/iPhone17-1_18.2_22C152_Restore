@interface PHVoicemailGreetingViewController
- (BOOL)hasRecordedNewGreeting;
- (BOOL)isPresentedFromSetup;
- (MPAnalyticsLogger)analyticsReporter;
- (MPGreetingAccount)account;
- (PHVoicemailGreetingModel)greetingModel;
- (PHVoicemailGreetingViewController)init;
- (PHVoicemailGreetingViewController)initWithAccount:(id)a3;
- (PHVoicemailGreetingViewController)initWithCoder:(id)a3;
- (PHVoicemailGreetingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHVoicemailGreetingViewController)initWithStyle:(int64_t)a3;
- (PHVoicemailGreetingViewControllerDelegate)greetingDelegate;
- (UIBarButtonItem)progressItem;
- (UIBarButtonItem)saveItem;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_selectedCellIndexPath;
- (id)_titleForCellAtIndexPath:(id)a3;
- (id)getGreetingPrompt;
- (id)playbackControlsCell;
- (id)sliderCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)cellSelectionStyleForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedGreetingType;
- (void)_cancelButtonTapped;
- (void)_saveButtonTapped;
- (void)_selectCell:(id)a3;
- (void)handlePhoneApplicationDeactivatedNotification:(id)a3;
- (void)playStopButtonTapped;
- (void)recordStopButtonTapped;
- (void)setAnalyticsReporter:(id)a3;
- (void)setGreetingDelegate:(id)a3;
- (void)setGreetingModel:(id)a3;
- (void)setHasRecordedNewGreeting:(BOOL)a3;
- (void)setPresentedFromSetup:(BOOL)a3;
- (void)setProgressItem:(id)a3;
- (void)setSaveItem:(id)a3;
- (void)setSelectedGreetingType:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCustomizedGreetingCell;
- (void)updateDefaultGreetingCell;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voicemailGreetingAudioControllerDidChangeState:(int64_t)a3;
- (void)voicemailGreetingDidFinishRecording;
- (void)voicemailGreetingDidSave;
- (void)voicemailGreetingDurationChanged:(double)a3;
- (void)voicemailGreetingFailedWithError:(id)a3;
- (void)voicemailGreetingPlayingProgressChanged:(double)a3;
- (void)voicemailGreetingRecordingProgressChanged:(double)a3;
@end

@implementation PHVoicemailGreetingViewController

- (PHVoicemailGreetingViewController)init
{
  return 0;
}

- (PHVoicemailGreetingViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PHVoicemailGreetingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PHVoicemailGreetingViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (PHVoicemailGreetingViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHVoicemailGreetingViewController;
  v6 = -[PHVoicemailGreetingViewController initWithStyle:](&v12, "initWithStyle:", [v5 customGreetingSupported]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = objc_alloc_init(MPAnalyticsLogger);
    analyticsReporter = v7->_analyticsReporter;
    v7->_analyticsReporter = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"handlePhoneApplicationDeactivatedNotification:" name:@"PhoneApplicationDeactivatedNotification" object:0];
  }
  return v7;
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)PHVoicemailGreetingViewController;
  [(PHVoicemailGreetingViewController *)&v40 viewDidLoad];
  v3 = [(PHVoicemailGreetingViewController *)self tableView];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  v4 = [(PHVoicemailGreetingViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"kPHVoicemailGreetingSelectionCellIdentifier"];

  id v5 = [(PHVoicemailGreetingViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = +[PHVoicemailGreetingSliderCell reuseIdentifier];
  [v5 registerClass:v6 forCellReuseIdentifier:v7];

  v8 = [(PHVoicemailGreetingViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"kPHVoicemailGreetingPlaybackCellIdentifier"];

  v9 = [(PHVoicemailGreetingViewController *)self account];
  unsigned int v10 = [v9 customGreetingSupported];
  if (v10)
  {
    v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v11 = [v7 localizedStringForKey:@"GREETING" value:&stru_100285990 table:@"Voicemail"];
  }
  else
  {
    v11 = 0;
  }
  objc_super v12 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v12 setTitle:v11];

  if (v10)
  {
  }
  id v13 = objc_alloc((Class)UIBarButtonItem);
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"General"];
  id v16 = [v13 initWithTitle:v15 style:0 target:self action:"_cancelButtonTapped"];
  v17 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v17 setLeftBarButtonItem:v16];

  id v18 = objc_alloc((Class)UIBarButtonItem);
  LODWORD(v14) = [(PHVoicemailGreetingViewController *)self isPresentedFromSetup];
  v19 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v20 = v19;
  if (v14) {
    CFStringRef v21 = @"DONE";
  }
  else {
    CFStringRef v21 = @"SAVE";
  }
  v22 = [v19 localizedStringForKey:v21 value:&stru_100285990 table:@"Voicemail"];
  id v23 = [v18 initWithTitle:v22 style:2 target:self action:"_saveButtonTapped"];
  [(PHVoicemailGreetingViewController *)self setSaveItem:v23];

  id v24 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v24 startAnimating];
  id v25 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v24];
  [(PHVoicemailGreetingViewController *)self setProgressItem:v25];

  v26 = [(PHVoicemailGreetingViewController *)self account];
  unsigned int v27 = [v26 customGreetingSupported];
  if (v27)
  {
    v28 = [(PHVoicemailGreetingViewController *)self saveItem];
  }
  else
  {
    v28 = 0;
  }
  v29 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v29 setRightBarButtonItem:v28];

  if (v27) {
  BOOL v30 = [(PHVoicemailGreetingViewController *)self isPresentedFromSetup];
  }
  v31 = [(PHVoicemailGreetingViewController *)self navigationItem];
  v32 = [v31 rightBarButtonItem];
  [v32 setEnabled:v30];

  v33 = [(PHVoicemailGreetingViewController *)self getGreetingPrompt];
  v34 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v34 setPrompt:v33];

  v35 = [PHVoicemailGreetingModel alloc];
  v36 = [(PHVoicemailGreetingViewController *)self account];
  v37 = [(PHVoicemailGreetingModel *)v35 initWithAccount:v36];
  [(PHVoicemailGreetingViewController *)self setGreetingModel:v37];

  v38 = [(PHVoicemailGreetingViewController *)self greetingModel];
  [v38 setDelegate:self];

  v39 = [(PHVoicemailGreetingViewController *)self greetingModel];
  [v39 fetchGreeting];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailGreetingViewController;
  [(PHVoicemailGreetingViewController *)&v7 viewWillAppear:a3];
  v4 = [(PHVoicemailGreetingViewController *)self greetingModel];
  unsigned int v5 = [v4 isCustomized];

  uint64_t v6 = +[NSIndexPath indexPathForRow:v5 inSection:0];
  [(PHVoicemailGreetingViewController *)self _selectCell:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailGreetingViewController;
  [(PHVoicemailGreetingViewController *)&v7 viewWillDisappear:a3];
  v4 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v5 = [v4 greetingState];

  if (v5 == (id)4)
  {
    uint64_t v6 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v6 stopRecording];
  }
}

- (void)handlePhoneApplicationDeactivatedNotification:(id)a3
{
  v4 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v5 = [v4 greetingState];

  if (v5 == (id)3)
  {
    uint64_t v6 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v6 pauseGreeting];
  }
  objc_super v7 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v8 = [v7 greetingState];

  if (v8 == (id)4)
  {
    v9 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v9 stopRecording];
  }
  unsigned int v10 = [(PHVoicemailGreetingViewController *)self greetingDelegate];

  if (v10)
  {
    id v11 = [(PHVoicemailGreetingViewController *)self greetingDelegate];
    [v11 voicemailGreetingViewControllerFinished:self];
  }
}

- (id)sliderCell
{
  v2 = [(PHVoicemailGreetingViewController *)self tableView];
  v3 = +[NSIndexPath indexPathForRow:0 inSection:1];
  v4 = [v2 cellForRowAtIndexPath:v3];

  return v4;
}

- (id)playbackControlsCell
{
  v2 = [(PHVoicemailGreetingViewController *)self tableView];
  v3 = +[NSIndexPath indexPathForRow:1 inSection:1];
  v4 = [v2 cellForRowAtIndexPath:v3];

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    objc_super v7 = 0;
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 indexPathForSelectedRow];
    v9 = [v5 cellForRowAtIndexPath:v8];
    [v9 setAccessoryType:0];

    objc_super v7 = v6;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v33 = a4;
  id v6 = [a3 cellForRowAtIndexPath:v33];
  [v6 setSelected:0 animated:1];
  [v6 setAccessoryType:3];
  if ([v33 row] == (id)1)
  {
    objc_super v7 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v7 didSelectCustomizedGreeting];

    id v8 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    [v8 setUserInteractionEnabled:1];

    v9 = [(PHVoicemailGreetingViewController *)self greetingModel];
    id v10 = [v9 greetingExists];

    id v11 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v11 setUserInteractionEnabled:v10];

    if (v10)
    {
      objc_super v12 = [(PHVoicemailGreetingViewController *)self greetingModel];
      id v13 = [v12 isCustomized];
    }
    else
    {
      id v13 = 0;
    }
    v22 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    id v23 = [v22 playStopButton];
    [v23 setEnabled:v13];
  }
  else
  {
    if ([v33 row]) {
      goto LABEL_14;
    }
    v14 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v14 didSelectDefaultGreeting];

    v15 = [(PHVoicemailGreetingViewController *)self greetingModel];
    id v16 = [v15 shouldShowPlayButtonForDefaultGreeting];

    v17 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v17 setUserInteractionEnabled:v16];

    id v18 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    v19 = [v18 playStopButton];
    [v19 setEnabled:v16];

    v20 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    CFStringRef v21 = [v20 recordStopButton];
    [v21 setEnabled:0];
  }
  id v24 = [(PHVoicemailGreetingViewController *)self greetingModel];
  if ([v24 greetingState] != (id)2)
  {

    goto LABEL_12;
  }
  id v25 = [(PHVoicemailGreetingViewController *)self greetingModel];
  unsigned int v26 = [v25 shouldShowSaveButton];

  if (!v26)
  {
LABEL_12:
    BOOL v31 = [(PHVoicemailGreetingViewController *)self isPresentedFromSetup];
    unsigned int v27 = [(PHVoicemailGreetingViewController *)self navigationItem];
    v28 = [v27 rightBarButtonItem];
    v29 = v28;
    uint64_t v30 = v31;
    goto LABEL_13;
  }
  unsigned int v27 = [(PHVoicemailGreetingViewController *)self navigationItem];
  v28 = [v27 rightBarButtonItem];
  v29 = v28;
  uint64_t v30 = 1;
LABEL_13:
  [v28 setEnabled:v30];

LABEL_14:
  v32 = [(PHVoicemailGreetingViewController *)self greetingModel];
  [v32 resetPlayerToBeginning];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v8 = 2;
  }
  else if (a4)
  {
    int64_t v8 = 0;
  }
  else
  {
    objc_super v7 = [(PHVoicemailGreetingViewController *)self account];
    if ([v7 customGreetingSupported]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 0;
    }
  }
  return v8;
}

- (id)_titleForCellAtIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [v5 row];
  if (v6 == (id)1)
  {
    objc_super v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    int64_t v8 = v7;
    CFStringRef v9 = @"CUSTOM_GREETING_TITLE";
    goto LABEL_5;
  }
  if (!v6)
  {
    objc_super v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    int64_t v8 = v7;
    CFStringRef v9 = @"DEFAULT_GREETING_TITLE";
LABEL_5:
    id v10 = [v7 localizedStringForKey:v9 value:&stru_100285990 table:@"Voicemail"];
LABEL_8:

    goto LABEL_9;
  }
  id v11 = [NSString stringWithFormat:@"Asked for table view cell at index path with section %ld row %ld, which is invalid" [v5 section], [v5 row]];
  NSLog(@"** TUAssertion failure: %@", v11);

  if (_TUAssertShouldCrashApplication())
  {
    int64_t v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PHVoicemailGreetingViewController.m", 264, @"Asked for table view cell at index path with section %ld row %ld, which is invalid", [v5 section], [v5 row]];
    id v10 = 0;
    goto LABEL_8;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [v6 section];
  if (v7 == (id)1)
  {
    id v12 = [v6 row];
    id v13 = [(PHVoicemailGreetingViewController *)self tableView];
    v14 = v13;
    if (v12 == (id)1)
    {
      CFStringRef v9 = [v13 dequeueReusableCellWithIdentifier:@"kPHVoicemailGreetingPlaybackCellIdentifier" forIndexPath:v6];

      [v9 setDelegate:self];
    }
    else
    {
      v17 = +[PHVoicemailGreetingSliderCell reuseIdentifier];
      CFStringRef v9 = [v14 dequeueReusableCellWithIdentifier:v17 forIndexPath:v6];
    }
    [v9 setSelectionStyle:0];
    id v18 = [(PHVoicemailGreetingViewController *)self account];
    unsigned __int8 v19 = [v18 customGreetingSupported];

    if ((v19 & 1) == 0)
    {
      v20 = +[UIColor secondarySystemGroupedBackgroundColor];
      [v9 setBackgroundColor:v20];
    }
  }
  else if (v7)
  {
    v15 = [NSString stringWithFormat:@"Asked for table view cell at index path with section %ld row %ld, which is invalid" [v6 section] [v6 row]];
    NSLog(@"** TUAssertion failure: %@", v15);

    if (_TUAssertShouldCrashApplication())
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PHVoicemailGreetingViewController.m", 292, @"Asked for table view cell at index path with section %ld row %ld, which is invalid", [v6 section], [v6 row]];
    }
    CFStringRef v9 = 0;
  }
  else
  {
    int64_t v8 = [(PHVoicemailGreetingViewController *)self tableView];
    CFStringRef v9 = [v8 dequeueReusableCellWithIdentifier:@"kPHVoicemailGreetingSelectionCellIdentifier" forIndexPath:v6];

    id v10 = [(PHVoicemailGreetingViewController *)self _titleForCellAtIndexPath:v6];
    id v11 = [v9 textLabel];
    [v11 setText:v10];

    [v9 setSelectionStyle:[self cellSelectionStyleForIndexPath:v6]];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  id v5 = [v4 section];
  if (v5 == (id)1)
  {
    if ([v4 row] == (id)1)
    {
      +[PHVoicemailGreetingPlaybackCell rowHeight];
      double v6 = v9;
    }
    else
    {
      double v6 = 43.0;
    }
  }
  else
  {
    double v6 = 0.0;
    if (!v5)
    {
      id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [v7 _scaledValueForValue:43.0];
      double v6 = v8;
    }
  }

  return v6;
}

- (int64_t)cellSelectionStyleForIndexPath:(id)a3
{
  id v4 = [a3 row];
  if (v4 == (id)1)
  {
    id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
    unsigned int v6 = [v5 isCustomized];
  }
  else
  {
    if (v4) {
      return 0;
    }
    id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
    unsigned int v6 = [v5 isDefault];
  }
  if (v6) {
    int64_t v7 = 3;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_selectedCellIndexPath
{
  v3 = [(PHVoicemailGreetingViewController *)self account];
  unsigned int v4 = [v3 customGreetingSupported];

  if (v4
    && ([(PHVoicemailGreetingViewController *)self tableView],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (uint64_t)[v5 numberOfRowsInSection:0],
        v5,
        v6 >= 1))
  {
    uint64_t v7 = 0;
    double v8 = 0;
    do
    {
      double v9 = +[NSIndexPath indexPathForRow:v7 inSection:0];
      id v10 = [(PHVoicemailGreetingViewController *)self tableView];
      id v11 = [v10 cellForRowAtIndexPath:v9];
      id v12 = [v11 accessoryType];

      if (v12 == (id)3)
      {
        id v13 = v9;

        double v8 = v13;
      }

      ++v7;
      v14 = [(PHVoicemailGreetingViewController *)self tableView];
      id v15 = [v14 numberOfRowsInSection:0];
    }
    while ((uint64_t)v15 > v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_cancelButtonTapped
{
  v3 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v4 = [v3 greetingState];

  id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
  uint64_t v6 = v5;
  if (v4 == (id)3)
  {
    [v5 pauseGreeting];
  }
  else
  {
    id v7 = [v5 greetingState];

    if (v7 != (id)5) {
      goto LABEL_6;
    }
    uint64_t v6 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v6 saveGreeting];
  }

LABEL_6:
  id v8 = [(PHVoicemailGreetingViewController *)self greetingDelegate];
  [v8 voicemailGreetingViewControllerFinished:self];
}

- (void)_saveButtonTapped
{
  v3 = [(PHVoicemailGreetingViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v6 = [v5 greetingState];

  if (v6 == (id)3)
  {
    id v7 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v7 pauseGreeting];
  }
  id v8 = [(PHVoicemailGreetingViewController *)self greetingModel];
  [v8 saveGreeting];
}

- (void)playStopButtonTapped
{
  v3 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v4 = [v3 greetingState];

  id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v9 = v5;
  if (v4 == (id)2)
  {
    [v5 playGreeting];

    id v6 = +[PHAudioDeviceController sharedAudioDeviceController];
    unsigned int v7 = [v6 receiverRouteIsPicked];

    id v8 = +[PHAudioDeviceController sharedAudioDeviceController];
    id v9 = v8;
    if (v7) {
      [v8 pickSpeakerRoute];
    }
    else {
      [v8 restorePickedRoute];
    }
  }
  else
  {
    [v5 pauseGreeting];
  }
}

- (void)recordStopButtonTapped
{
  v3 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v4 = [v3 greetingState];

  if (v4 == (id)2)
  {
    id v5 = [(PHVoicemailGreetingViewController *)self navigationItem];
    id v6 = [v5 rightBarButtonItem];
    [v6 setEnabled:0];

    id v7 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v7 startRecording];
  }
  else
  {
    if (v4 != (id)4) {
      return;
    }
    id v7 = [(PHVoicemailGreetingViewController *)self greetingModel];
    [v7 stopRecording];
  }
}

- (void)voicemailGreetingDidSave
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHVoicemailGreetingAudioController: voicemail greeting did save", v6, 2u);
  }

  id v4 = [(PHVoicemailGreetingViewController *)self analyticsReporter];
  [v4 logCustomGreetingUpdated];

  id v5 = [(PHVoicemailGreetingViewController *)self greetingDelegate];
  [v5 voicemailGreetingViewControllerFinished:self];
}

- (void)_selectCell:(id)a3
{
  id v13 = a3;
  id v4 = [(PHVoicemailGreetingViewController *)self tableView];
  id v5 = [v4 cellForRowAtIndexPath:v13];

  if (v5)
  {
    id v6 = [(PHVoicemailGreetingViewController *)self tableView];
    id v7 = [v6 indexPathForSelectedRow];
    unsigned __int8 v8 = [v13 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      [v5 setSelectionStyle:0];
      id v9 = [(PHVoicemailGreetingViewController *)self tableView];
      id v10 = [(PHVoicemailGreetingViewController *)self tableView:v9 willSelectRowAtIndexPath:v13];

      id v11 = [(PHVoicemailGreetingViewController *)self tableView];
      [v11 selectRowAtIndexPath:v13 animated:1 scrollPosition:0];

      id v12 = [(PHVoicemailGreetingViewController *)self tableView];
      [(PHVoicemailGreetingViewController *)self tableView:v12 didSelectRowAtIndexPath:v13];

      [v5 setSelectionStyle:3];
    }
  }
}

- (void)updateDefaultGreetingCell
{
  v3 = [(PHVoicemailGreetingViewController *)self greetingModel];
  unsigned __int8 v4 = [v3 isCallScreeningEnabled];

  if (v4)
  {
    id v5 = [(PHVoicemailGreetingViewController *)self greetingModel];
    id v6 = [v5 shouldShowPlayButtonForDefaultGreeting];

    id v7 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v7 showTimelineSlider];

    unsigned __int8 v8 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v8 setUserInteractionEnabled:v6];

    id v9 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    [v9 setUserInteractionEnabled:1];

    id v10 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    id v11 = [v10 playStopButton];
    [v11 setEnabled:v6];

    id v12 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    id v13 = [v12 playStopButton];
    v14 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    id v15 = [v14 localizedStringForKey:@"PLAY" value:&stru_100285990 table:@"Voicemail"];
    [v13 setTitle:v15 forState:0];

    id v16 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    v17 = [v16 recordStopButton];
    [v17 setEnabled:0];

    id v18 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    unsigned __int8 v19 = [v18 recordStopButton];
    v20 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    CFStringRef v21 = [v20 localizedStringForKey:@"RECORD" value:&stru_100285990 table:@"Voicemail"];
    [v19 setTitle:v21 forState:0];

    v22 = [(PHVoicemailGreetingViewController *)self account];
    LODWORD(v21) = [v22 customGreetingSupported];

    if (v21)
    {
      id v23 = +[NSIndexPath indexPathForRow:0 inSection:0];
      [(PHVoicemailGreetingViewController *)self _selectCell:v23];
    }
    id v30 = [(PHVoicemailGreetingViewController *)self getGreetingPrompt];
    id v24 = [(PHVoicemailGreetingViewController *)self navigationItem];
    [v24 setPrompt:v30];
  }
  else
  {
    id v25 = [(PHVoicemailGreetingViewController *)self getGreetingPrompt];
    unsigned int v26 = [(PHVoicemailGreetingViewController *)self navigationItem];
    [v26 setPrompt:v25];

    unsigned int v27 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v27 showProgressView];

    v28 = [(PHVoicemailGreetingViewController *)self sliderCell];
    [v28 setUserInteractionEnabled:0];

    v29 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
    [v29 setUserInteractionEnabled:0];

    id v30 = +[NSIndexPath indexPathForRow:0 inSection:0];
    [(PHVoicemailGreetingViewController *)self _selectCell:v30];
  }
}

- (void)updateCustomizedGreetingCell
{
  v3 = [(PHVoicemailGreetingViewController *)self greetingModel];
  id v4 = [v3 greetingExists];

  id v5 = [(PHVoicemailGreetingViewController *)self sliderCell];
  [v5 showTimelineSlider];

  id v6 = [(PHVoicemailGreetingViewController *)self sliderCell];
  [v6 setUserInteractionEnabled:v4];

  id v7 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
  unsigned __int8 v8 = [v7 playStopButton];
  [v8 setEnabled:v4];

  id v9 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
  id v10 = [v9 playStopButton];
  id v11 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v12 = [v11 localizedStringForKey:@"PLAY" value:&stru_100285990 table:@"Voicemail"];
  [v10 setTitle:v12 forState:0];

  id v13 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
  v14 = [v13 recordStopButton];
  [v14 setEnabled:1];

  id v15 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
  id v16 = [v15 recordStopButton];
  v17 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v18 = [v17 localizedStringForKey:@"RECORD" value:&stru_100285990 table:@"Voicemail"];
  [v16 setTitle:v18 forState:0];

  unsigned __int8 v19 = +[NSIndexPath indexPathForRow:1 inSection:0];
  [(PHVoicemailGreetingViewController *)self _selectCell:v19];

  id v21 = [(PHVoicemailGreetingViewController *)self getGreetingPrompt];
  v20 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v20 setPrompt:v21];
}

- (void)voicemailGreetingAudioControllerDidChangeState:(int64_t)a3
{
  id v5 = [(PHVoicemailGreetingViewController *)self tableView];
  [v5 setUserInteractionEnabled:1];

  id v6 = [(PHVoicemailGreetingViewController *)self tableView];
  [v6 setAllowsSelection:1];

  id v7 = [(PHVoicemailGreetingViewController *)self account];
  unsigned int v8 = [v7 customGreetingSupported];
  if (v8)
  {
    id v9 = [(PHVoicemailGreetingViewController *)self saveItem];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [(PHVoicemailGreetingViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  if (v8) {
  id v11 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
  }
  id v12 = [v11 recordStopButton];
  id v13 = [(PHVoicemailGreetingViewController *)self account];
  [v12 setHidden:[v13 customGreetingSupported] ^ 1];

  switch(a3)
  {
    case 0:
      v14 = [(PHVoicemailGreetingViewController *)self getGreetingPrompt];
      id v15 = [(PHVoicemailGreetingViewController *)self navigationItem];
      [v15 setPrompt:v14];

      id v16 = [(PHVoicemailGreetingViewController *)self sliderCell];
      [v16 showProgressView];

      v17 = [(PHVoicemailGreetingViewController *)self sliderCell];
      [v17 setUserInteractionEnabled:0];

      id v18 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      [v18 setUserInteractionEnabled:0];

      id v51 = +[NSIndexPath indexPathForRow:0 inSection:0];
      [(PHVoicemailGreetingViewController *)self _selectCell:v51];
      goto LABEL_23;
    case 1:
      id v30 = [(PHVoicemailGreetingViewController *)self tableView];
      [v30 setUserInteractionEnabled:0];

      BOOL v31 = [(PHVoicemailGreetingViewController *)self sliderCell];
      [v31 showProgressView];

      v32 = [(PHVoicemailGreetingViewController *)self progressItem];
      id v33 = [(PHVoicemailGreetingViewController *)self navigationItem];
      [v33 setRightBarButtonItem:v32];

      v34 = [(PHVoicemailGreetingViewController *)self account];
      unsigned int v35 = [v34 customGreetingSupported];
      if (v35)
      {
        id v12 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        v36 = [v12 localizedStringForKey:@"RETRIEVING_GREETING" value:&stru_100285990 table:@"Voicemail"];
      }
      else
      {
        v36 = 0;
      }
      v48 = [(PHVoicemailGreetingViewController *)self navigationItem];
      [v48 setPrompt:v36];

      if (v35)
      {
      }
      v41 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      v42 = [v41 playStopButton];
      [v42 setEnabled:0];
      goto LABEL_21;
    case 2:
      v37 = [(PHVoicemailGreetingViewController *)self greetingModel];
      unsigned int v38 = [v37 isDefault];

      if (v38)
      {
        [(PHVoicemailGreetingViewController *)self updateDefaultGreetingCell];
      }
      else
      {
        v49 = [(PHVoicemailGreetingViewController *)self greetingModel];
        unsigned int v50 = [v49 isCustomized];

        if (v50)
        {
          [(PHVoicemailGreetingViewController *)self updateCustomizedGreetingCell];
        }
      }
      return;
    case 3:
      v39 = [(PHVoicemailGreetingViewController *)self sliderCell];
      [v39 showTimelineSlider];

      objc_super v40 = [(PHVoicemailGreetingViewController *)self tableView];
      [v40 setAllowsSelection:0];

      v41 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      v42 = [v41 playStopButton];
      v43 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      v44 = [v43 localizedStringForKey:@"STOP" value:&stru_100285990 table:@"Voicemail"];
      [v42 setTitle:v44 forState:0];

LABEL_21:
      id v51 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      unsigned int v27 = [v51 recordStopButton];
      [v27 setEnabled:0];
      goto LABEL_22;
    case 4:
      unsigned __int8 v19 = [(PHVoicemailGreetingViewController *)self sliderCell];
      [v19 showProgressView];

      v20 = [(PHVoicemailGreetingViewController *)self tableView];
      [v20 setAllowsSelection:0];

      id v21 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      v22 = [v21 playStopButton];
      id v23 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      id v24 = [v23 localizedStringForKey:@"PLAY" value:&stru_100285990 table:@"Voicemail"];
      [v22 setTitle:v24 forState:0];

      id v25 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      unsigned int v26 = [v25 playStopButton];
      [v26 setEnabled:0];

      id v51 = [(PHVoicemailGreetingViewController *)self playbackControlsCell];
      unsigned int v27 = [v51 recordStopButton];
      v28 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      v29 = [v28 localizedStringForKey:@"STOP" value:&stru_100285990 table:@"Voicemail"];
      [v27 setTitle:v29 forState:0];

LABEL_22:
      goto LABEL_23;
    case 5:
      v45 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
      v46 = [v45 localizedStringForKey:@"SAVING_GREETING" value:&stru_100285990 table:@"Voicemail"];
      v47 = [(PHVoicemailGreetingViewController *)self navigationItem];
      [v47 setPrompt:v46];

      id v51 = [(PHVoicemailGreetingViewController *)self tableView];
      [v51 setUserInteractionEnabled:0];
LABEL_23:

      break;
    default:
      return;
  }
}

- (void)voicemailGreetingPlayingProgressChanged:(double)a3
{
  id v5 = [(PHVoicemailGreetingViewController *)self sliderCell];
  id v4 = [v5 timelineSlider];
  [v4 setElapsedTime:a3];
}

- (void)voicemailGreetingFailedWithError:(id)a3
{
  id v4 = a3;
  id v12 = [v4 localizedDescription];
  id v5 = [v4 localizedFailureReason];

  id v6 = +[UIAlertController alertControllerWithTitle:v12 message:v5 preferredStyle:1];
  id v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  unsigned int v8 = [v7 localizedStringForKey:@"OK" value:&stru_100285990 table:@"Voicemail"];
  id v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  [(PHVoicemailGreetingViewController *)self presentViewController:v6 animated:1 completion:0];
  if ([(PHVoicemailGreetingViewController *)self hasRecordedNewGreeting])
  {
    id v10 = [(PHVoicemailGreetingViewController *)self navigationItem];
    id v11 = [v10 rightBarButtonItem];
    [v11 setEnabled:1];
  }
}

- (void)voicemailGreetingRecordingProgressChanged:(double)a3
{
  float v3 = a3;
  id v6 = [(PHVoicemailGreetingViewController *)self sliderCell];
  id v4 = [v6 progressView];
  *(float *)&double v5 = v3;
  [v4 setProgress:v5];
}

- (void)voicemailGreetingDurationChanged:(double)a3
{
  id v5 = [(PHVoicemailGreetingViewController *)self sliderCell];
  id v4 = [v5 timelineSlider];
  [v4 setDuration:a3];
}

- (void)voicemailGreetingDidFinishRecording
{
  float v3 = [(PHVoicemailGreetingViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:1];

  [(PHVoicemailGreetingViewController *)self setHasRecordedNewGreeting:1];
}

- (id)getGreetingPrompt
{
  v2 = [(PHVoicemailGreetingViewController *)self account];
  if ([v2 customGreetingSupported])
  {
    float v3 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    id v4 = [v3 localizedStringForKey:@"GREETING_PROMPT" value:&stru_100285990 table:@"Voicemail"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isPresentedFromSetup
{
  return self->_presentedFromSetup;
}

- (void)setPresentedFromSetup:(BOOL)a3
{
  self->_presentedFromSetup = a3;
}

- (PHVoicemailGreetingViewControllerDelegate)greetingDelegate
{
  return self->_greetingDelegate;
}

- (void)setGreetingDelegate:(id)a3
{
  self->_greetingDelegate = (PHVoicemailGreetingViewControllerDelegate *)a3;
}

- (MPGreetingAccount)account
{
  return self->_account;
}

- (BOOL)hasRecordedNewGreeting
{
  return self->_hasRecordedNewGreeting;
}

- (void)setHasRecordedNewGreeting:(BOOL)a3
{
  self->_hasRecordedNewGreeting = a3;
}

- (PHVoicemailGreetingModel)greetingModel
{
  return self->_greetingModel;
}

- (void)setGreetingModel:(id)a3
{
}

- (unint64_t)selectedGreetingType
{
  return self->_selectedGreetingType;
}

- (void)setSelectedGreetingType:(unint64_t)a3
{
  self->_selectedGreetingType = a3;
}

- (UIBarButtonItem)saveItem
{
  return self->_saveItem;
}

- (void)setSaveItem:(id)a3
{
}

- (UIBarButtonItem)progressItem
{
  return self->_progressItem;
}

- (void)setProgressItem:(id)a3
{
}

- (MPAnalyticsLogger)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_progressItem, 0);
  objc_storeStrong((id *)&self->_saveItem, 0);
  objc_storeStrong((id *)&self->_greetingModel, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end