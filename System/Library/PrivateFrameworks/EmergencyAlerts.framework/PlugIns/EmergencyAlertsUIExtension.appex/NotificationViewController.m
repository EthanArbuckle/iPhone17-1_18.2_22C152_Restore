@interface NotificationViewController
- (BOOL)doesContainValidAppleSafetyAlertData:(id)a3;
- (BOOL)drawIcon:(id)a3;
- (BOOL)isScreenLocked;
- (BOOL)userDidTapOnUnlockedScreen;
- (CGSize)getImageBounds;
- (CGSize)getImageBoundsForPhone;
- (CGSize)getImageBoundsForWatch;
- (UIActivityIndicatorView)safetyAlertSpinner;
- (UIImageView)centerAlertIcon;
- (UIImageView)topAlertIcon;
- (UILabel)additionalDetails;
- (UILabel)centerTitle;
- (UILabel)topTitle;
- (UIStackView)safetyAlertStack;
- (UIStackView)weaStackCenterAligned;
- (UIStackView)weaStackTopAligned;
- (UIView)dividerStack;
- (UnselectableUITextView)centerBody;
- (UnselectableUITextView)instructionText;
- (UnselectableUITextView)topBody;
- (void)addGestureRecognizer;
- (void)cellBroadcastMessageReceived:(id)a3;
- (void)didReceiveNotification:(id)a3;
- (void)displayDividerStack:(BOOL)a3;
- (void)displaySafetyAlertStack:(BOOL)a3 withSpinner:(BOOL)a4;
- (void)displayWeaStackCenterAligned:(BOOL)a3;
- (void)displayWeaStackTopAligned:(BOOL)a3;
- (void)drawAllIcons;
- (void)gestureTap:(id)a3;
- (void)hideAllViews;
- (void)renderBasedOnScreenState;
- (void)renderSafetyAlertDetailedView;
- (void)renderSafetyAlertWithSpinnerView;
- (void)renderSafetyAlertsView;
- (void)renderTopView;
- (void)setAdditionalDetails:(id)a3;
- (void)setCenterAlertIcon:(id)a3;
- (void)setCenterBody:(id)a3;
- (void)setCenterTitle:(id)a3;
- (void)setDividerStack:(id)a3;
- (void)setInstructionText:(id)a3;
- (void)setLabel:(id)a3 withText:(id)a4 isBold:(BOOL)a5;
- (void)setSafetyAlertSpinner:(id)a3;
- (void)setSafetyAlertStack:(id)a3;
- (void)setTextView:(id)a3 withText:(id)a4 isBold:(BOOL)a5;
- (void)setTopAlertIcon:(id)a3;
- (void)setTopBody:(id)a3;
- (void)setTopTitle:(id)a3;
- (void)setUserDidTapOnUnlockedScreen:(BOOL)a3;
- (void)setWeaStackCenterAligned:(id)a3;
- (void)setWeaStackTopAligned:(id)a3;
- (void)setupAlertWithNotification:(id)a3;
- (void)setupTextsWithNotification:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NotificationViewController

- (BOOL)isScreenLocked
{
  v2 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isScreenLocked];

  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NotificationViewController;
  [(NotificationViewController *)&v4 viewDidLoad];
  if (qword_10000CF20 != -1) {
    dispatch_once(&qword_10000CF20, &stru_100008310);
  }
  v2 = qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "View did load", v3, 2u);
  }
  TUAddTelephonyCenterObserver();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "viewWillDisappear %p", buf, 0xCu);
  }
  TURemoveTelephonyCenterObserver();
  v6.receiver = self;
  v6.super_class = (Class)NotificationViewController;
  [(NotificationViewController *)&v6 viewWillDisappear:v3];
}

- (CGSize)getImageBoundsForPhone
{
  double v2 = 36.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)getImageBoundsForWatch
{
  double v2 = [(NotificationViewController *)self view];
  double v3 = [v2 window];
  [v3 frame];
  double v5 = v4 * 0.5;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)getImageBounds
{
  double v3 = +[UIDevice currentDevice];
  double v4 = [v3 model];

  double v5 = [v4 lowercaseString];
  unsigned int v6 = [v5 containsString:@"phone"];

  if (v6) {
    [(NotificationViewController *)self getImageBoundsForPhone];
  }
  else {
    [(NotificationViewController *)self getImageBoundsForWatch];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)drawIcon:(id)a3
{
  id v4 = a3;
  double v5 = +[NSBundle bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.cmas.bundle"];
  if (v5)
  {
    unsigned int v6 = +[UIImage imageNamed:@"emergency-216" inBundle:v5 withConfiguration:0];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      [(NotificationViewController *)self getImageBounds];
      double v9 = v8;
      double v11 = v10;
      double v12 = qword_10000CF18;
      if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 134218240;
        double v22 = v9;
        __int16 v23 = 2048;
        double v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Icon size: [w: %lf, h: %lf]", (uint8_t *)&v21, 0x16u);
      }
      v13 = objc_msgSend(v6, "imageWithSize:", v9, v11);
      [v4 setImage:v13];

      v14 = [(NotificationViewController *)self view];
      [v14 frame];
      double v16 = v15;
      v17 = [(NotificationViewController *)self view];
      [v17 frame];
      [v4 setFrame:v16];
    }
    else
    {
      v19 = qword_10000CF18;
      if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Icon could not be loaded", (uint8_t *)&v21, 2u);
      }
    }
  }
  else
  {
    v18 = qword_10000CF18;
    if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR)) {
      sub_100004CF0(@"/System/Library/UserNotifications/Bundles/com.apple.cmas.bundle", v18);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setLabel:(id)a3 withText:(id)a4 isBold:(BOOL)a5
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 font];
  [v8 pointSize];
  double v9 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  id v11 = +[NSDictionary dictionaryWithObject:v9 forKey:NSFontAttributeName];

  id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v6 attributes:v11];
  [v7 setAttributedText:v10];
  [v7 setNumberOfLines:0];
  [v7 setLineBreakMode:0];
}

- (void)setTextView:(id)a3 withText:(id)a4 isBold:(BOOL)a5
{
  id v6 = &UIFontWeightBold;
  if (!a5) {
    id v6 = &UIFontWeightRegular;
  }
  double v7 = *v6;
  id v8 = a4;
  id v9 = a3;
  +[UIFont systemFontSize];
  id v11 = +[UIFont systemFontOfSize:v10 + 3.0 weight:v7];
  double v12 = +[NSDictionary dictionaryWithObject:v11 forKey:NSFontAttributeName];

  id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8 attributes:v12];
  id v26 = 0;
  v14 = +[NSDataDetector dataDetectorWithTypes:2096 error:&v26];
  id v15 = v26;
  id v16 = [v8 length];
  int v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  __int16 v23 = sub_100002974;
  double v24 = &unk_1000082A8;
  id v25 = v13;
  id v17 = v13;
  objc_msgSend(v14, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v16, &v21);

  objc_msgSend(v9, "setAttributedText:", v17, v21, v22, v23, v24);
  [v9 setUserInteractionEnabled:1];
  [v9 setScrollEnabled:0];
  [v9 setEditable:0];
  [v9 setSelectable:1];
  v18 = [v9 textContainer];
  [v18 setLineFragmentPadding:0.0];

  objc_msgSend(v9, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v19 = +[UIColor clearColor];
  [v9 setBackgroundColor:v19];

  v20 = +[UIColor labelColor];
  [v9 setTextColor:v20];
}

- (void)cellBroadcastMessageReceived:(id)a3
{
  uint64_t v4 = kCTSMSAppleSafetyAlertData;
  id v5 = a3;
  id v6 = [v5 objectForKey:v4];
  double v7 = [v5 objectForKey:@"kCTSMSAppleSafetyAlertMissingForHash"];

  if (!v7) {
    goto LABEL_6;
  }
  id v8 = [(NotificationViewController *)self centerBody];
  id v9 = [v8 text];
  double v10 = ea_getHashForString(v9);
  unsigned int v11 = [v7 isEqualToString:v10];

  if (v11)
  {
    double v12 = qword_10000CF18;
    if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing spinner for safety alert...", buf, 2u);
    }
    id v13 = [(NotificationViewController *)self safetyAlertSpinner];
    [v13 setHidden:1];
  }
  else
  {
LABEL_6:
    if (v6)
    {
      v14 = [v6 objectForKeyedSubscript:@"CmamText"];
      uint64_t v15 = ea_getHashForString(v14);

      id v16 = [v6 objectForKeyedSubscript:@"CmamLongText"];
      uint64_t v17 = ea_getHashForString(v16);

      if (v15 | v17)
      {
        v18 = [(NotificationViewController *)self centerBody];
        v19 = [v18 text];
        v20 = ea_getHashForString(v19);

        if (([v20 isEqualToString:v15] & 1) != 0
          || ([v20 isEqualToString:v17] & 1) != 0)
        {
          int v21 = [v6 objectForKeyedSubscript:@"Instruction"];
          if (ea_isValidString(v21)
            && ([(NotificationViewController *)self centerBody],
                uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                [v22 text],
                __int16 v23 = objc_claimAutoreleasedReturnValue(),
                id v24 = [v23 rangeOfString:v21],
                v23,
                v22,
                v24 == (id)0x7FFFFFFFFFFFFFFFLL))
          {
            id v25 = [(NotificationViewController *)self instructionText];
            id v26 = self;
            v27 = v25;
            CFStringRef v28 = v21;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR)) {
              sub_100004D68();
            }
            id v25 = [(NotificationViewController *)self instructionText];
            CFStringRef v28 = &stru_1000084B8;
            id v26 = self;
            v27 = v25;
          }
          [(NotificationViewController *)v26 setTextView:v27 withText:v28 isBold:0];

          v30 = [(NotificationViewController *)self instructionText];
          [v30 setTextAlignment:1];

          v31 = +[NSBundle bundleForClass:objc_opt_class()];
          v32 = [v31 localizedStringForKey:@"ADDITIONAL_DETAILS" value:@"Additional Details" table:0];

          v33 = [(NotificationViewController *)self additionalDetails];
          [(NotificationViewController *)self setLabel:v33 withText:v32 isBold:1];

          v34 = [(NotificationViewController *)self centerBody];
          v35 = [v34 text];
          ea_sendSafetyAlertTapIndication(v35, 1);

          [(NotificationViewController *)self renderBasedOnScreenState];
        }
        else
        {
          v36 = qword_10000CF18;
          if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v37 = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Ignoring received apple safety alert...", v37, 2u);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR))
      {
        sub_100004D9C();
      }
    }
    else
    {
      v29 = qword_10000CF18;
      if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Ignoring non safety alert content", v38, 2u);
      }
    }
  }
}

- (BOOL)doesContainValidAppleSafetyAlertData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 request];
  id v5 = [v4 content];
  id v6 = [v5 userInfo];
  double v7 = [v6 objectForKeyedSubscript:@"Instruction"];

  id v8 = [v3 request];
  id v9 = [v8 content];
  double v10 = [v9 userInfo];
  unsigned int v11 = [v10 objectForKeyedSubscript:@"EffectiveTimestamp"];

  if (!ea_isValidString(v7)) {
    goto LABEL_4;
  }
  double v12 = [v3 request];
  id v13 = [v12 content];
  v14 = [v13 body];
  id v15 = [v14 rangeOfString:v7];

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unsigned __int8 v16 = 1;
  }
  else {
LABEL_4:
  }
    unsigned __int8 v16 = ea_isValidString(v11);

  return v16;
}

- (void)drawAllIcons
{
  id v3 = [(NotificationViewController *)self centerAlertIcon];
  unsigned __int8 v4 = [(NotificationViewController *)self drawIcon:v3];

  if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR)) {
    sub_100004E04();
  }
  id v5 = [(NotificationViewController *)self topAlertIcon];
  unsigned __int8 v6 = [(NotificationViewController *)self drawIcon:v5];

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR)) {
    sub_100004DD0();
  }
}

- (void)displayWeaStackCenterAligned:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NotificationViewController *)self weaStackCenterAligned];
  BOOL v6 = !v3;
  [v5 setHidden:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v7 = [(NotificationViewController *)self weaStackCenterAligned];
  id v8 = [v7 subviews];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setHidden:v6];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)displaySafetyAlertStack:(BOOL)a3 withSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(NotificationViewController *)self safetyAlertStack];
  [v7 setHidden:!v5];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [(NotificationViewController *)self safetyAlertStack];
  id v9 = [v8 subviews];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) setHidden:!v5];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if (v5)
  {
    long long v14 = qword_10000CF18;
    BOOL v15 = os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Showing spinner view", buf, 2u);
      }
      long long v16 = [(NotificationViewController *)self safetyAlertStack];
      [v16 setHidden:0];

      uint64_t v17 = [(NotificationViewController *)self additionalDetails];
      [v17 setHidden:1];

      dispatch_time_t v18 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003650;
      block[3] = &unk_1000082D0;
      block[4] = self;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Showing safety alert detailed view", buf, 2u);
      }
      v19 = [(NotificationViewController *)self additionalDetails];
      [v19 setHidden:0];

      v20 = [(NotificationViewController *)self safetyAlertSpinner];
      [v20 setHidden:1];
    }
  }
}

- (void)displayWeaStackTopAligned:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NotificationViewController *)self weaStackTopAligned];
  BOOL v6 = !v3;
  [v5 setHidden:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v7 = [(NotificationViewController *)self weaStackTopAligned];
  id v8 = [v7 subviews];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setHidden:v6];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)displayDividerStack:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NotificationViewController *)self dividerStack];
  [v4 setHidden:!v3];
}

- (void)hideAllViews
{
  [(NotificationViewController *)self displayDividerStack:0];
  [(NotificationViewController *)self displayWeaStackTopAligned:0];
  [(NotificationViewController *)self displaySafetyAlertStack:0 withSpinner:0];
  [(NotificationViewController *)self displayWeaStackCenterAligned:0];
}

- (void)renderTopView
{
}

- (void)renderSafetyAlertWithSpinnerView
{
  [(NotificationViewController *)self displayWeaStackCenterAligned:1];
  [(NotificationViewController *)self displayDividerStack:0];
  [(NotificationViewController *)self displaySafetyAlertStack:1 withSpinner:1];
}

- (void)renderSafetyAlertDetailedView
{
  [(NotificationViewController *)self displayDividerStack:1];
  [(NotificationViewController *)self displayWeaStackCenterAligned:1];
  [(NotificationViewController *)self displaySafetyAlertStack:1 withSpinner:0];
}

- (void)renderSafetyAlertsView
{
  BOOL v3 = [(NotificationViewController *)self instructionText];
  id v4 = [v3 text];
  unsigned int v5 = ea_isValidString(v4);

  BOOL v6 = qword_10000CF18;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rendering detailed view", buf, 2u);
    }
    [(NotificationViewController *)self renderSafetyAlertDetailedView];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rendering spinner view", v8, 2u);
    }
    [(NotificationViewController *)self renderSafetyAlertWithSpinnerView];
  }
}

- (void)renderBasedOnScreenState
{
  unsigned int v3 = [(NotificationViewController *)self isScreenLocked];
  id v4 = qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"unlocked";
    if (v3) {
      CFStringRef v5 = @"locked";
    }
    int v11 = 138412290;
    CFStringRef v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen state: %@", (uint8_t *)&v11, 0xCu);
  }
  [(NotificationViewController *)self hideAllViews];
  if ((v3 & 1) != 0 || [(NotificationViewController *)self userDidTapOnUnlockedScreen])
  {
    [(NotificationViewController *)self renderSafetyAlertsView];
  }
  else
  {
    BOOL v6 = qword_10000CF18;
    if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rendering Top view", (uint8_t *)&v11, 2u);
    }
    [(NotificationViewController *)self renderTopView];
  }
  BOOL v7 = [(NotificationViewController *)self instructionText];
  [v7 setSelectable:1];

  id v8 = [(NotificationViewController *)self centerBody];
  [v8 setSelectable:1];

  id v9 = [(NotificationViewController *)self topBody];
  [v9 setSelectable:1];

  id v10 = [(NotificationViewController *)self view];
  [v10 layoutIfNeeded];
}

- (void)gestureTap:(id)a3
{
  id v4 = a3;
  if (qword_10000CF20 != -1) {
    dispatch_once(&qword_10000CF20, &stru_100008310);
  }
  unsigned int v5 = [(NotificationViewController *)self isScreenLocked];
  BOOL v6 = qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"unlocked";
    if (v5) {
      CFStringRef v7 = @"locked";
    }
    int v10 = 138412290;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User tap detected in top view [screen: %@]", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(NotificationViewController *)self topBody];
  id v9 = [v8 text];
  ea_sendSafetyAlertTapIndication(v9, 2);

  if ((v5 & 1) == 0) {
    [(NotificationViewController *)self setUserDidTapOnUnlockedScreen:1];
  }
  [(NotificationViewController *)self hideAllViews];
  [(NotificationViewController *)self renderSafetyAlertsView];
}

- (void)addGestureRecognizer
{
  id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"gestureTap:"];
  unsigned int v3 = [(NotificationViewController *)self view];
  [v3 addGestureRecognizer:v4];
}

- (void)setupTextsWithNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 request];
  BOOL v6 = [v5 content];
  CFStringRef v7 = [v6 title];

  if (ea_isValidString(v7))
  {
    id v8 = [v4 request];
    id v9 = [v8 content];
    int v10 = [v9 body];

    if (ea_isValidString(v10))
    {
      CFStringRef v11 = [(NotificationViewController *)self topTitle];
      CFStringRef v12 = [v4 request];
      long long v13 = [v12 content];
      long long v14 = [v13 title];
      [(NotificationViewController *)self setLabel:v11 withText:v14 isBold:1];

      long long v15 = [(NotificationViewController *)self topBody];
      long long v16 = [v4 request];
      uint64_t v17 = [v16 content];
      dispatch_time_t v18 = [v17 body];
      [(NotificationViewController *)self setTextView:v15 withText:v18 isBold:0];

      v19 = [(NotificationViewController *)self centerTitle];
      v20 = [v4 request];
      int v21 = [v20 content];
      uint64_t v22 = [v21 title];
      [(NotificationViewController *)self setLabel:v19 withText:v22 isBold:1];

      long long v23 = [(NotificationViewController *)self centerBody];
      long long v24 = [v4 request];
      long long v25 = [v24 content];
      long long v26 = [v25 body];
      [(NotificationViewController *)self setTextView:v23 withText:v26 isBold:0];

      v27 = [(NotificationViewController *)self centerBody];
      [v27 setTextAlignment:1];

      CFStringRef v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"ADDITIONAL_DETAILS" value:@"Additional Details" table:0];

      v30 = [(NotificationViewController *)self additionalDetails];
      [(NotificationViewController *)self setLabel:v30 withText:v29 isBold:1];

      if ([(NotificationViewController *)self doesContainValidAppleSafetyAlertData:v4])
      {
        v31 = [v4 request];
        v32 = [v31 content];
        v33 = [v32 userInfo];
        v34 = [v33 objectForKeyedSubscript:@"Instruction"];

        if (ea_isValidString(v34))
        {
          v35 = [v4 request];
          v36 = [v35 content];
          v37 = [v36 body];
          id v38 = [v37 rangeOfString:v34];

          if (v38 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = [(NotificationViewController *)self instructionText];
            v44 = [v4 request];
            v40 = [v44 content];
            v41 = [v40 userInfo];
            v42 = [v41 objectForKeyedSubscript:@"Instruction"];
            [(NotificationViewController *)self setTextView:v39 withText:v42 isBold:0];

            v43 = [(NotificationViewController *)self instructionText];
            [v43 setTextAlignment:1];
          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR))
    {
      sub_100004E38();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_ERROR))
  {
    sub_100004E6C();
  }
}

- (void)setupAlertWithNotification:(id)a3
{
  id v6 = a3;
  id v4 = [(NotificationViewController *)self view];
  [v4 setNeedsDisplay];

  unsigned int v5 = [(NotificationViewController *)self view];
  [v5 setNeedsLayout];

  [(NotificationViewController *)self drawAllIcons];
  [(NotificationViewController *)self addGestureRecognizer];
  [(NotificationViewController *)self setupTextsWithNotification:v6];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NotificationViewController *)self isScreenLocked];
  id v6 = (void *)qword_10000CF18;
  if (os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = v6;
    id v8 = [v4 request];
    id v9 = [v8 content];
    int v10 = [v9 userInfo];
    int v16 = 138412290;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification userInfo: %@", (uint8_t *)&v16, 0xCu);
  }
  [(NotificationViewController *)self setupAlertWithNotification:v4];
  CFStringRef v11 = qword_10000CF18;
  BOOL v12 = os_log_type_enabled((os_log_t)qword_10000CF18, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v12)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User tap detected in notification [screen: locked]", (uint8_t *)&v16, 2u);
    }
    long long v13 = [v4 request];
    long long v14 = [v13 content];
    long long v15 = [v14 body];
    ea_sendSafetyAlertTapIndication(v15, 2);
  }
  else if (v12)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notification received in unlocked screen", (uint8_t *)&v16, 2u);
  }
  [(NotificationViewController *)self renderBasedOnScreenState];
}

- (UILabel)topTitle
{
  return self->_topTitle;
}

- (void)setTopTitle:(id)a3
{
}

- (UnselectableUITextView)topBody
{
  return self->_topBody;
}

- (void)setTopBody:(id)a3
{
}

- (UIImageView)topAlertIcon
{
  return self->_topAlertIcon;
}

- (void)setTopAlertIcon:(id)a3
{
}

- (UIStackView)weaStackCenterAligned
{
  return self->_weaStackCenterAligned;
}

- (void)setWeaStackCenterAligned:(id)a3
{
}

- (UIStackView)weaStackTopAligned
{
  return self->_weaStackTopAligned;
}

- (void)setWeaStackTopAligned:(id)a3
{
}

- (UIView)dividerStack
{
  return self->_dividerStack;
}

- (void)setDividerStack:(id)a3
{
}

- (UIStackView)safetyAlertStack
{
  return self->_safetyAlertStack;
}

- (void)setSafetyAlertStack:(id)a3
{
}

- (UILabel)centerTitle
{
  return self->_centerTitle;
}

- (void)setCenterTitle:(id)a3
{
}

- (UnselectableUITextView)centerBody
{
  return self->_centerBody;
}

- (void)setCenterBody:(id)a3
{
}

- (UnselectableUITextView)instructionText
{
  return self->_instructionText;
}

- (void)setInstructionText:(id)a3
{
}

- (UIImageView)centerAlertIcon
{
  return self->_centerAlertIcon;
}

- (void)setCenterAlertIcon:(id)a3
{
}

- (UIActivityIndicatorView)safetyAlertSpinner
{
  return self->_safetyAlertSpinner;
}

- (void)setSafetyAlertSpinner:(id)a3
{
}

- (UILabel)additionalDetails
{
  return self->_additionalDetails;
}

- (void)setAdditionalDetails:(id)a3
{
}

- (BOOL)userDidTapOnUnlockedScreen
{
  return self->_userDidTapOnUnlockedScreen;
}

- (void)setUserDidTapOnUnlockedScreen:(BOOL)a3
{
  self->_userDidTapOnUnlockedScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDetails, 0);
  objc_storeStrong((id *)&self->_safetyAlertSpinner, 0);
  objc_storeStrong((id *)&self->_centerAlertIcon, 0);
  objc_storeStrong((id *)&self->_instructionText, 0);
  objc_storeStrong((id *)&self->_centerBody, 0);
  objc_storeStrong((id *)&self->_centerTitle, 0);
  objc_storeStrong((id *)&self->_safetyAlertStack, 0);
  objc_storeStrong((id *)&self->_dividerStack, 0);
  objc_storeStrong((id *)&self->_weaStackTopAligned, 0);
  objc_storeStrong((id *)&self->_weaStackCenterAligned, 0);
  objc_storeStrong((id *)&self->_topAlertIcon, 0);
  objc_storeStrong((id *)&self->_topBody, 0);
  objc_storeStrong((id *)&self->_topTitle, 0);
}

@end