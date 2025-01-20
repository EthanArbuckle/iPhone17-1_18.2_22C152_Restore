@interface FBAPinPairingViewController
- (BOOL)isModalInPresentation;
- (FBKGroupedDevice)device;
- (id)platform;
- (int64_t)context;
- (void)awakeFromNib;
- (void)didCancel;
- (void)setContext:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)showPINEntryUIWithFlags:(unsigned int)a3;
- (void)showPINEntryUIWithFlags:(unsigned int)a3 inThrottleSeconds:(float)a4;
- (void)tryPin:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBAPinPairingViewController

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)FBAPinPairingViewController;
  [(FBAPinPairingViewController *)&v5 awakeFromNib];
  [(FBAPinPairingViewController *)self setContext:0];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(FBAPinPairingViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FBAPinPairingViewController;
  [(FBAPinPairingViewController *)&v12 viewWillAppear:a3];
  if ((id)[(FBAPinPairingViewController *)self context] == (id)1)
  {
    id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"didCancel"];
    objc_super v5 = [(FBAPinPairingViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:v4];
  }
  self->_failCount = 0;
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10003C814;
  v9 = &unk_1000F3AA0;
  objc_copyWeak(&v10, &location);
  [(FBAPINEntryView *)self->_pinEntryView setTextChangedHandler:&v6];
  [(FBAPINEntryView *)self->_pinEntryView becomeFirstResponder];
  [(FBAPinPairingViewController *)self showPINEntryUIWithFlags:2];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBAPINEntryView *)self->_pinEntryView setTextChangedHandler:0];
  v5.receiver = self;
  v5.super_class = (Class)FBAPinPairingViewController;
  [(FBAPinPairingViewController *)&v5 viewDidDisappear:v3];
}

- (void)didCancel
{
  id v4 = +[NSNotificationCenter defaultCenter];
  BOOL v3 = [(FBAPinPairingViewController *)self device];
  [v4 postNotificationName:@"FBAPinPairingViewControllerDidCancel" object:v3];
}

- (void)tryPin:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[FBALog ded];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000A65C4(v5);
  }

  v6 = +[FBKDeviceManager sharedInstance];
  uint64_t v7 = [(FBAPinPairingViewController *)self device];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003CA4C;
  v8[3] = &unk_1000F3AC8;
  v8[4] = self;
  [v6 tryPairingDevice:v7 withPin:v4 completion:v8];
}

- (void)showPINEntryUIWithFlags:(unsigned int)a3
{
  if (a3)
  {
    ++self->_failCount;
    [(FBAPINEntryView *)self->_pinEntryView shake];
    if (self->_failCount < 2) {
      goto LABEL_10;
    }
    objc_super v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"PAIR_RETRY_PIN" value:&stru_1000F6658 table:0];
    p_infoLabel = &self->_infoLabel;
    [(UILabel *)self->_infoLabel setText:v13];

    uint64_t v11 = +[UIColor redColor];
  }
  else
  {
    if ((a3 & 2) == 0) {
      goto LABEL_10;
    }
    id v4 = [(FBAPinPairingViewController *)self platform];
    unsigned int v5 = [v4 isEqualToString:DEDDevicePlatformTV];

    v6 = +[NSBundle mainBundle];
    uint64_t v7 = v6;
    if (v5) {
      CFStringRef v8 = @"PAIR_ENTER_PIN_TV";
    }
    else {
      CFStringRef v8 = @"PAIR_ENTER_PIN";
    }
    v9 = [v6 localizedStringForKey:v8 value:&stru_1000F6658 table:0];
    p_infoLabel = &self->_infoLabel;
    [(UILabel *)self->_infoLabel setText:v9];

    uint64_t v11 = +[UIColor labelColor];
  }
  v14 = (void *)v11;
  [(UILabel *)*p_infoLabel setTextColor:v11];

LABEL_10:
  pinEntryView = self->_pinEntryView;

  [(FBAPINEntryView *)pinEntryView setText:&stru_1000F6658];
}

- (void)showPINEntryUIWithFlags:(unsigned int)a3 inThrottleSeconds:(float)a4
{
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(float)(a4 * 1000000000.0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CD04;
  v7[3] = &unk_1000F3AF0;
  v7[4] = self;
  unsigned int v8 = a3;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (id)platform
{
  v2 = [(FBAPinPairingViewController *)self device];
  BOOL v3 = [v2 platform];

  id v4 = (void *)DEDDevicePlatformTV;
  if (([v3 isEqualToString:DEDDevicePlatformTV] & 1) == 0)
  {
    unsigned int v5 = +[FBALog ded];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing to device with usupported/unknown platform.", v8, 2u);
    }
  }
  id v6 = v4;

  return v6;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_pinEntryView, 0);

  objc_storeStrong((id *)&self->_infoLabel, 0);
}

@end