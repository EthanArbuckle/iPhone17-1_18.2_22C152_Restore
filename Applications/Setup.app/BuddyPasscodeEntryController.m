@interface BuddyPasscodeEntryController
- (BOOL)isNumeric;
- (BOOL)usesSimplePasscodeEntry;
- (BuddyPasscodeEntryDelegate)delegate;
- (NSString)instructions;
- (NSString)titleText;
- (id)passcodeView;
- (unint64_t)numericLength;
- (void)_finishedWithPasscode:(id)a3;
- (void)_setupFirstEntry;
- (void)clear;
- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)nextButtonPressed;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)passcodeInput:(id)a3 willChangeContents:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setNumeric:(BOOL)a3;
- (void)setNumericLength:(unint64_t)a3;
- (void)setTitleText:(id)a3;
- (void)updateStatusMessage;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BuddyPasscodeEntryController

- (void)loadView
{
  v13 = self;
  location[1] = (id)a2;
  v2 = (DevicePINController *)objc_alloc_init((Class)DevicePINController);
  pinController = v13->_pinController;
  v13->_pinController = v2;

  location[0] = [objc_alloc((Class)BFFPasscodeView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [location[0] setAutoresizingMask:18];
  [location[0] setPasscodeViewController:v13];
  id v4 = +[BFFStyle sharedStyle];
  id v5 = [v4 backgroundColor];
  [location[0] setBackgroundColor:v5];

  [(BuddyPasscodeEntryController *)v13 setView:location[0]];
  v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  statusLabel = v13->_statusLabel;
  v13->_statusLabel = v6;

  v8 = v13->_statusLabel;
  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)v8 setFont:v9];

  [(UILabel *)v13->_statusLabel setTextAlignment:1];
  [(UILabel *)v13->_statusLabel setNumberOfLines:0];
  [(UILabel *)v13->_statusLabel setLineBreakMode:0];
  id v10 = [(BuddyPasscodeEntryController *)v13 view];
  [v10 addSubview:v13->_statusLabel];

  v11 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v11 addObserver:v13 selector:"updateStatusMessage" name:UIApplicationDidBecomeActiveNotification object:0];

  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  [(NSTimer *)self->_statusTimer invalidate];
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v3 dealloc];
}

- (id)passcodeView
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  return [(BuddyPasscodeEntryController *)&v3 view];
}

- (BOOL)usesSimplePasscodeEntry
{
  unsigned __int8 v2 = [(BuddyPasscodeEntryController *)self isNumeric];
  BOOL v3 = 0;
  if (v2)
  {
    unint64_t v4 = [(BuddyPasscodeEntryController *)self numericLength];
    BOOL v3 = 1;
    if (v4 != 4) {
      return (id)[(BuddyPasscodeEntryController *)self numericLength] == (id)6;
    }
  }
  return v3;
}

- (void)_setupFirstEntry
{
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = +[MCProfileConnection sharedConnection];
  int v14 = 0;
  unsigned int v13 = [v15[0] unlockScreenTypeWithOutSimplePasscodeType:&v14];
  if (v13)
  {
    if (v13 == 1)
    {
      [(BuddyPasscodeEntryController *)v16 setNumeric:1];
      [(BuddyPasscodeEntryController *)v16 setNumericLength:0];
    }
    else
    {
      [(BuddyPasscodeEntryController *)v16 setNumeric:0];
    }
  }
  else
  {
    [(BuddyPasscodeEntryController *)v16 setNumeric:1];
    if (v14) {
      unsigned int v2 = 6;
    }
    else {
      unsigned int v2 = 4;
    }
    [(BuddyPasscodeEntryController *)v16 setNumericLength:v2];
  }
  [(BuddyPasscodeEntryController *)v16 configurePasscodeTypeUsingAnimations:0];
  id v3 = [(BuddyPasscodeEntryController *)v16 passcodeView];
  unint64_t v4 = [(BuddyPasscodeEntryController *)v16 titleText];
  [v3 setTitle:v4];

  id location = 0;
  if ([(BuddyPasscodeEntryController *)v16 usesSimplePasscodeEntry])
  {
    id v5 = objc_alloc((Class)BFFSimplePasscodeInputView);
    id v6 = [v5 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height numberOfEntryFields:[BuddyPasscodeEntryController numericLength](v16, "numericLength")];
  }
  else
  {
    id v8 = objc_alloc((Class)BFFComplexPasscodeInputView);
    id v6 = [v8 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, -[BuddyPasscodeEntryController isNumeric](v16, "isNumeric")];
  }
  id v7 = location;
  id location = v6;

  id v9 = [location instructions];
  id v10 = [(BuddyPasscodeEntryController *)v16 instructions];
  [v9 setText:v10];

  id v11 = [(BuddyPasscodeEntryController *)v16 passcodeView];
  [v11 transitionToPasscodeInput:location delegate:v16];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)viewDidLoad
{
  unint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v2 viewDidLoad];
  [(BuddyPasscodeEntryController *)v4 setExtendedLayoutIncludesOpaqueBars:1];
  [(BuddyPasscodeEntryController *)v4 _setupFirstEntry];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v8 viewWillAppear:a3];
  id v3 = [(BuddyPasscodeEntryController *)v11 passcodeView];
  id v7 = [v3 passcodeInputView];

  [v7 becomeFirstResponder];
  id v4 = [(BuddyPasscodeEntryController *)v11 navigationItem];
  id v5 = [v4 rightBarButtonItem];
  id v6 = [v7 passcode];
  [v5 setEnabled:[v6 length] != 0];

  [(BuddyPasscodeEntryController *)v11 updateStatusMessage];
  objc_storeStrong(&v7, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v5 viewWillDisappear:a3];
  id v3 = [(BuddyPasscodeEntryController *)v8 view];
  id v4 = [v3 passcodeInputView];

  [v4 resignFirstResponder];
  objc_storeStrong(&v4, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v3 viewDidDisappear:a3];
  [(BuddyPasscodeEntryController *)v6 clear];
}

- (void)viewDidLayoutSubviews
{
  v42 = self;
  SEL v41 = a2;
  uint64_t v40 = 0x4024000000000000;
  v39.receiver = self;
  v39.super_class = (Class)BuddyPasscodeEntryController;
  [(BuddyPasscodeEntryController *)&v39 viewDidLayoutSubviews];
  id v2 = [(BuddyPasscodeEntryController *)v42 view];
  id v3 = [(BuddyPasscodeEntryController *)v42 passcodeView];
  id v4 = [v3 passcodeInputView];
  id v5 = [v4 passcodeField];
  [v5 frame];
  double v35 = v6;
  double v34 = v7;
  double v37 = v8;
  double v36 = v9;
  id v10 = [(BuddyPasscodeEntryController *)v42 passcodeView];
  id v11 = [v10 passcodeInputView];
  [v2 convertRect:v11 fromView:v34, v35, v36, v37];
  v38.origin.y = v12;
  v38.origin.x = v13;
  v38.size.height = v14;
  v38.size.width = v15;

  id v16 = [(BuddyPasscodeEntryController *)v42 view];
  [v16 bounds];
  double v32 = v17;

  statusLabel = v42->_statusLabel;
  sub_10006217C();
  -[UILabel sizeThatFits:](statusLabel, "sizeThatFits:", v19, v20);
  double v33 = v21;
  id v22 = [(BuddyPasscodeEntryController *)v42 view];
  [v22 bounds];
  uint64_t v28 = v23;
  uint64_t v27 = v24;
  uint64_t v30 = v25;
  double v29 = v26;
  *(float *)&uint64_t v24 = (v26 - v32) / 2.0;
  double v31 = floorf(*(float *)&v24);

  -[UILabel setFrame:](v42->_statusLabel, "setFrame:", v31, CGRectGetMaxY(v38) + 10.0, v32, v33, v27, v28, *(void *)&v29, v30);
}

- (void)_finishedWithPasscode:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(DevicePINController *)v5->_pinController attemptValidationWithPIN:location[0]])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
    [WeakRetained passcodeEntryController:v5 didEnterPasscode:location[0]];
  }
  else
  {
    [(BuddyPasscodeEntryController *)v5 updateStatusMessage];
    [(BuddyPasscodeEntryController *)v5 clear];
  }
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed
{
  id v5 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyPasscodeEntryController *)self passcodeView];
  id v3 = [v2 passcodeInputView];
  location[0] = [v3 passcode];

  [(BuddyPasscodeEntryController *)v5 passcodeInput:0 enteredPasscode:location[0]];
  objc_storeStrong(location, 0);
}

- (void)updateStatusMessage
{
  uint64_t v25 = self;
  SEL v24 = a2;
  unsigned __int8 v23 = 0;
  unsigned __int8 v23 = [(DevicePINController *)self->_pinController isBlocked] & 1;
  id v2 = [(BuddyPasscodeEntryController *)v25 passcodeView];
  id v3 = [v2 passcodeInputView];
  [v3 setEnabled:(v23 ^ 1) & 1];

  if (v23)
  {
    double v22 = 0.0;
    [(DevicePINController *)v25->_pinController unblockTime];
    double v5 = v4;
    +[NSDate timeIntervalSinceReferenceDate];
    double v22 = v5 - v6;
    *(float *)&double v6 = (v5 - v6) / 60.0;
    unint64_t v21 = (unint64_t)ceilf(*(float *)&v6);
    id location = (id)objc_opt_new();
    [location setUnitsStyle:3];
    [location setAllowedUnits:64];
    statusLabel = v25->_statusLabel;
    double v8 = +[NSBundle mainBundle];
    double v9 = [(NSBundle *)v8 localizedStringForKey:@"PASSCODE_BLOCKED_TRY_AGAIN_%@" value:&stru_1002B4E18 table:@"Localizable"];
    id v10 = [location stringFromTimeInterval:(double)v21 * 60.0];
    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10);
    [(UILabel *)statusLabel setText:v11];

    [(NSTimer *)v25->_statusTimer invalidate];
    CGFloat v12 = +[NSTimer scheduledTimerWithTimeInterval:v25 target:"updateStatusMessage" selector:0 userInfo:0 repeats:(double)((int)v22 % 60 + 1)];
    statusTimer = v25->_statusTimer;
    v25->_statusTimer = v12;

    objc_storeStrong(&location, 0);
  }
  else
  {
    unint64_t v19 = (unint64_t)[(DevicePINController *)v25->_pinController numberOfFailedAttempts];
    if ((v19 & 0x8000000000000000) != 0)
    {
      [(UILabel *)v25->_statusLabel setText:&stru_1002B4E18];
    }
    else
    {
      CGFloat v14 = v25->_statusLabel;
      CGFloat v15 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v15 localizedStringForKey:@"PASSCODE_ATTEMPT_FAILURES" value:&stru_1002B4E18 table:@"Localizable"];
      double v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v19);
      [(UILabel *)v14 setText:v17];
    }
  }
  id v18 = [(BuddyPasscodeEntryController *)v25 view];
  [v18 setNeedsLayout];
}

- (void)passcodeInput:(id)a3 willChangeContents:(id)a4
{
  double v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = [(BuddyPasscodeEntryController *)v9 navigationItem];
  id v6 = [v5 rightBarButtonItem];
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "length") != 0);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [location[0] passcodeField];
  [v5 forceDisplayIfNeeded];

  uint64_t v15 = 0x3FB374BC6A7EF9DBLL;
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)(0.076 * 1000000000.0));
  id v6 = &_dispatch_main_q;
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_10006293C;
  id v11 = &unk_1002B12F0;
  CGFloat v12 = v18;
  id v13 = v16;
  dispatch_after(v14, (dispatch_queue_t)v6, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)clear
{
  id v2 = [(BuddyPasscodeEntryController *)self passcodeView];
  id v3 = [v2 passcodeInputView];
  [v3 setPasscode:&stru_1002B4E18];
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  if ([(BuddyPasscodeEntryController *)self usesSimplePasscodeEntry])
  {
    id v3 = [(BuddyPasscodeEntryController *)v11 navigationItem];
    [v3 setRightBarButtonItem:0 animated:v9];
  }
  else
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    id v5 = +[NSBundle mainBundle];
    id v6 = [(NSBundle *)v5 localizedStringForKey:@"NEXT" value:&stru_1002B4E18 table:@"Localizable"];
    id v8 = [v4 initWithTitle:v6 style:2 target:v11 action:"nextButtonPressed"];

    id v7 = [(BuddyPasscodeEntryController *)v11 navigationItem];
    [v7 setRightBarButtonItem:v8 animated:v9];

    objc_storeStrong(&v8, 0);
  }
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (BuddyPasscodeEntryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyPasscodeEntryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end