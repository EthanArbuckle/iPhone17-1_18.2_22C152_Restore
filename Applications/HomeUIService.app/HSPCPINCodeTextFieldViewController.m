@interface HSPCPINCodeTextFieldViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (HFPinCodeManager)pinCodeManager;
- (HSPCPINCodeTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (PRXAction)optionalAction;
- (id)_skipPINCodeButtonTapped;
- (id)_updatePINCodesForAllUsers;
- (id)commitConfiguration;
- (int64_t)PINCodeLengthMax;
- (int64_t)PINCodeLengthMin;
- (void)_updateContinueActionEnabledFor:(id)a3;
- (void)_updateOnboardingFlags;
- (void)_updateSubtitle;
- (void)setOptionalAction:(id)a3;
- (void)setPINCodeLengthMax:(int64_t)a3;
- (void)setPINCodeLengthMin:(int64_t)a3;
- (void)setPinCodeManager:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCPINCodeTextFieldViewController

- (HSPCPINCodeTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HSPCPINCodeTextFieldViewController;
  v8 = [(HSPCTextFieldViewController *)&v28 initWithCoordinator:v6 config:v7 withTextFieldMinimumHeight:100.0];
  if (v8)
  {
    v9 = sub_100060C64(@"HSProximityCardPINCodeTextFieldTitle");
    [(HSPCPINCodeTextFieldViewController *)v8 setTitle:v9];

    v10 = sub_100060C64(@"HSProximityCardPINCodeTextFieldSubtitle");
    [(HSPCPINCodeTextFieldViewController *)v8 setSubtitle:v10];

    v11 = [(HSPCTextFieldViewController *)v8 continueAction];
    [v11 setEnabled:1];

    v12 = +[PRXLabel labelWithStyle:1];
    [(HSPCTextFieldViewController *)v8 setFootnoteLabel:v12];

    v8->_PINCodeLengthMin = 4;
    v8->_PINCodeLengthMax = 8;
    v13 = +[HFHomeKitDispatcher sharedDispatcher];
    v14 = [v7 home];
    uint64_t v15 = [v13 pinCodeManagerForHome:v14];
    pinCodeManager = v8->_pinCodeManager;
    v8->_pinCodeManager = (HFPinCodeManager *)v15;

    objc_initWeak(&location, v8);
    v17 = v8->_pinCodeManager;
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_100009350;
    v25 = &unk_1000A8F48;
    objc_copyWeak(&v26, &location);
    [(HFPinCodeManager *)v17 fetchPinCodeConstraints:&v22];
    if (!qword_1000CB558)
    {
      id v18 = objc_alloc_init((Class)NSNumberFormatter);
      v19 = (void *)qword_1000CB558;
      qword_1000CB558 = (uint64_t)v18;

      v20 = +[NSLocale autoupdatingCurrentLocale];
      [(id)qword_1000CB558 setLocale:v20];

      [(id)qword_1000CB558 setNumberStyle:0];
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)HSPCPINCodeTextFieldViewController;
  [(HSPCTextFieldViewController *)&v15 viewDidLoad];
  NSAttributedStringKey v16 = NSKernAttributeName;
  v17 = &off_1000B0C10;
  v3 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v4 = [(HSPCTextFieldViewController *)self textField];
  [v4 setDefaultTextAttributes:v3];

  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle];
  id v6 = [(HSPCTextFieldViewController *)self textField];
  [v6 setFont:v5];

  id v7 = +[UIColor labelColor];
  v8 = [(HSPCTextFieldViewController *)self textField];
  [v8 setTextColor:v7];

  v9 = [(HSPCTextFieldViewController *)self textField];
  [v9 setClearButtonMode:0];

  v10 = [(HSPCTextFieldViewController *)self textField];
  [v10 setTextAlignment:1];

  v11 = [(HSPCTextFieldViewController *)self textField];
  [v11 setKeyboardType:4];

  v12 = [(HSPCTextFieldViewController *)self textField];
  [v12 addTarget:self action:"textFieldDidChange:" forControlEvents:0x20000];

  v13 = [(HSPCTextFieldViewController *)self textField];
  v14 = [v13 layer];
  [v14 setDisableUpdateMask:16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HSPCPINCodeTextFieldViewController;
  [(HSPCTextFieldViewController *)&v13 viewWillAppear:a3];
  objc_initWeak(&location, self);
  v4 = [(HSPCPINCodeTextFieldViewController *)self pinCodeManager];
  v5 = [v4 fetchFromAccessoryCache];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009760;
  v10[3] = &unk_1000A8F70;
  objc_copyWeak(&v11, &location);
  id v6 = [v5 flatMap:v10];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000097C4;
  v8[3] = &unk_1000A8F98;
  objc_copyWeak(&v9, &location);
  id v7 = [v6 addCompletionBlock:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)commitConfiguration
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User tapped \"Continue\" from the PIN code text field prox card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009C58;
  v21[3] = &unk_1000A8FC0;
  objc_copyWeak(&v22, buf);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009D14;
  v19[3] = &unk_1000A9010;
  v19[4] = self;
  v4 = objc_retainBlock(v21);
  id v20 = v4;
  v5 = objc_retainBlock(v19);
  id v6 = [(HSPCPINCodeTextFieldViewController *)self pinCodeManager];
  id v7 = [v6 fetchFromAccessoryCache];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009FD8;
  v17[3] = &unk_1000A8F70;
  objc_copyWeak(&v18, buf);
  v8 = [v7 flatMap:v17];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A03C;
  v13[3] = &unk_1000A91C8;
  objc_copyWeak(&v16, buf);
  id v9 = v4;
  id v14 = v9;
  v10 = v5;
  id v15 = v10;
  id v11 = [v8 flatMap:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(buf);

  return v11;
}

- (id)_skipPINCodeButtonTapped
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2080;
    id v14 = "-[HSPCPINCodeTextFieldViewController _skipPINCodeButtonTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped \"Skip\" from HSPCPINCodeTextFieldViewController", buf, 0x16u);
  }

  [(HSPCPINCodeTextFieldViewController *)self _updateOnboardingFlags];
  v4 = [(HSPCTextFieldViewController *)self config];
  v5 = [v4 home];
  v10[0] = v5;
  v10[1] = &off_1000AFF98;
  v9[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v9[2] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v10[2] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  +[HFAnalytics sendEvent:26 withData:v6];
  id v7 = +[NAFuture futureWithResult:&off_1000AFF68];

  return v7;
}

- (void)_updateSubtitle
{
  v3 = [(HSPCTextFieldViewController *)self textField];
  unsigned int v4 = [v3 isFirstResponder];

  if (v4)
  {
    uint64_t v5 = [(HSPCPINCodeTextFieldViewController *)self PINCodeLengthMin];
    [(HSPCPINCodeTextFieldViewController *)self PINCodeLengthMax];
    sub_100060D80(@"HSProximityCardPINCodeTextFieldSubtitle_Edit", @"%lu%lu", v6, v7, v8, v9, v10, v11, v5);
  }
  else
  {
    sub_100060C64(@"HSProximityCardPINCodeTextFieldSubtitle");
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(HSPCPINCodeTextFieldViewController *)self setSubtitle:v12];
}

- (id)_updatePINCodesForAllUsers
{
  v3 = [(HSPCTextFieldViewController *)self config];
  unsigned int v4 = [v3 home];
  unsigned __int8 v5 = [v4 hf_currentUserIsAdministrator];

  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = [(HSPCPINCodeTextFieldViewController *)self pinCodeManager];
    uint64_t v7 = [(HSPCTextFieldViewController *)self config];
    uint64_t v8 = [v7 addedAccessory];
    uint64_t v9 = [v6 enablePinCodesForAllUsersOnNewAccessory:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B580;
    v12[3] = &unk_1000A91F0;
    objc_copyWeak(&v13, &location);
    uint64_t v10 = [v9 addCompletionBlock:v12];
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = +[NAFuture futureWithNoResult];
  }

  return v10;
}

- (void)_updateOnboardingFlags
{
  id v3 = objc_alloc((Class)HFUserItem);
  unsigned int v4 = [(HSPCTextFieldViewController *)self config];
  unsigned __int8 v5 = [v4 home];
  uint64_t v6 = [(HSPCTextFieldViewController *)self config];
  uint64_t v7 = [v6 home];
  uint64_t v8 = [v7 currentUser];
  id v15 = [v3 initWithHome:v5 user:v8 nameStyle:0];

  id v9 = [v15 setDismissAccessCodeOnboarding:1];
  uint64_t v10 = [(HSPCTextFieldViewController *)self config];
  uint64_t v11 = [v10 home];
  LODWORD(v5) = [v11 hf_currentUserIsAdministrator];

  if (v5)
  {
    id v12 = [(HSPCTextFieldViewController *)self config];
    id v13 = [v12 home];
    [v13 hf_setHasOnboardedForAccessCode];
  }
}

- (void)_updateContinueActionEnabledFor:(id)a3
{
  id v11 = a3;
  unsigned int v4 = [(HSPCTextFieldViewController *)self textField];
  unsigned __int8 v5 = [v4 isUserInteractionEnabled];

  if (v5)
  {
    id v6 = [v11 length];
    BOOL v7 = (uint64_t)v6 >= [(HSPCPINCodeTextFieldViewController *)self PINCodeLengthMin]
      && (uint64_t)v6 <= [(HSPCPINCodeTextFieldViewController *)self PINCodeLengthMax];
    uint64_t v8 = [(HSPCTextFieldViewController *)self continueAction];
    id v9 = v8;
    uint64_t v10 = v7;
  }
  else
  {
    uint64_t v8 = [(HSPCTextFieldViewController *)self continueAction];
    id v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setEnabled:v10];
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = [a3 text];
  [(HSPCPINCodeTextFieldViewController *)self _updateContinueActionEnabledFor:v4];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  id v9 = [(HSPCTextFieldViewController *)self textField];
  uint64_t v10 = [v9 text];
  id v11 = (void *)v10;
  id v12 = &stru_1000ABBA8;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  id v13 = v12;

  id v14 = -[__CFString stringByReplacingCharactersInRange:withString:](v13, "stringByReplacingCharactersInRange:withString:", location, length, v8);

  id v15 = [v14 length];
  LOBYTE(v15) = (uint64_t)v15 <= [(HSPCPINCodeTextFieldViewController *)self PINCodeLengthMax];

  return (char)v15;
}

- (PRXAction)optionalAction
{
  return self->_optionalAction;
}

- (void)setOptionalAction:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (int64_t)PINCodeLengthMin
{
  return self->_PINCodeLengthMin;
}

- (void)setPINCodeLengthMin:(int64_t)a3
{
  self->_PINCodeLengthMin = a3;
}

- (int64_t)PINCodeLengthMax
{
  return self->_PINCodeLengthMax;
}

- (void)setPINCodeLengthMax:(int64_t)a3
{
  self->_PINCodeLengthMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);

  objc_storeStrong((id *)&self->_optionalAction, 0);
}

@end