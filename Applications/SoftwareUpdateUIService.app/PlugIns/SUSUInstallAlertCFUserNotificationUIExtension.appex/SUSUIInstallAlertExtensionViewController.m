@interface SUSUIInstallAlertExtensionViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (SUSUIInstallAlertExtensionViewController)init;
- (id)_createView;
- (id)_messageTextWithCountdown;
- (void)_clearCountdownTimer;
- (void)_countdownTimerFired;
- (void)_startCountdownTimerWithInitialTime:(unint64_t)a3;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)client:(id)a3 installWantsToStart:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)loadView;
- (void)reboot;
- (void)userWantsToDeferInstall:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUSUIInstallAlertExtensionViewController

- (SUSUIInstallAlertExtensionViewController)init
{
  v3 = SUSUILogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = (id)objc_opt_class();
    id v4 = v13;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Initing %@", buf, 0xCu);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  v5 = [(SUSUIInstallAlertExtensionViewController *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.susui.countdownInstallQueue", 0);
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = (SUManagerClient *)[objc_alloc((Class)SUManagerClient) initWithDelegate:v5 queue:v5->_clientQueue clientType:0];
    client = v5->_client;
    v5->_client = v8;
  }
  return v5;
}

- (void)dealloc
{
  v3 = SUSUILogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Deallocating %@", buf, 0xCu);
  }
  [(SUSUIInstallAlertExtensionViewController *)self invalidate];
  clientQueue = self->_clientQueue;
  if (clientQueue)
  {
    self->_clientQueue = 0;
  }
  client = self->_client;
  if (client)
  {
    [(SUManagerClient *)client invalidate];
    v7 = self->_client;
    self->_client = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  [(SUSUIInstallAlertExtensionViewController *)&v8 dealloc];
}

- (void)loadView
{
  v3 = SUSUILogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Loading view", (uint8_t *)&v29, 2u);
  }

  id v4 = [(SUSUIInstallAlertExtensionViewController *)self extensionContext];
  v5 = [v4 inputItems];

  if (v5 && [v5 count])
  {
    dispatch_queue_t v6 = [v5 objectAtIndexedSubscript:0];
    v7 = v6;
    if (!v6)
    {
      v9 = SUSUILogExtension();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Failed to get extension item", (uint8_t *)&v29, 2u);
      }
      goto LABEL_40;
    }
    objc_super v8 = [v6 userInfo];
    v9 = v8;
    if (v8)
    {
      id v10 = [v8 objectForKeyedSubscript:@"ExtensionAlertKeyHumanReadableUpdateName"];
      updateName = self->_updateName;
      self->_updateName = v10;

      if (self->_updateName)
      {
        v12 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeyCompletionAction"];
        completionAction = self->_completionAction;
        self->_completionAction = v12;

        if (!self->_completionAction) {
          objc_storeStrong((id *)&self->_completionAction, @"ExtensionAlertKeyCompletionActionInstall");
        }
        v14 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeyIsAutoInstall"];
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
          self->_autoUpdate = [v14 BOOLValue];
        }
        else {
          self->_autoUpdate = 0;
        }
        v16 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeySingularText"];
        singularText = self->_singularText;
        self->_singularText = v16;

        if (!self->_singularText)
        {
          self->_singularText = (NSString *)@"SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_SINGULAR";
        }
        v18 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeyPluralText"];
        pluralText = self->_pluralText;
        self->_pluralText = v18;

        if (!self->_pluralText)
        {
          self->_pluralText = (NSString *)@"SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_PLURAL";
        }
        v20 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeyCountdown"];
        v21 = v20;
        if (v20 && [v20 unsignedLongValue])
        {
          self->_unint64_t countdownTimeout = (unint64_t)[v21 unsignedLongValue];
          v22 = SUSUILogExtension();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t countdownTimeout = self->_countdownTimeout;
            int v29 = 134217984;
            unint64_t v30 = countdownTimeout;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Alert item has asked to use countdown = %lu", (uint8_t *)&v29, 0xCu);
          }
        }
        else
        {
          self->_unint64_t countdownTimeout = 10;
          v22 = SUSUILogExtension();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v24 = self->_countdownTimeout;
            int v29 = 134217984;
            unint64_t v30 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Use default countdown = %lu", (uint8_t *)&v29, 0xCu);
          }
        }

        v25 = (SUInstallOptions *)objc_alloc_init((Class)SUInstallOptions);
        installOptions = self->_installOptions;
        self->_installOptions = v25;

        if (self->_autoUpdate)
        {
          [(SUInstallOptions *)self->_installOptions setDarkBoot:1];
          [(SUInstallOptions *)self->_installOptions setAutomaticInstallation:1];
        }
        v27 = [v9 objectForKeyedSubscript:@"ExtensionAlertKeyIgnorableConstraints"];
        if (v27)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[SUInstallOptions setIgnorableConstraints:](self->_installOptions, "setIgnorableConstraints:", [v27 unsignedIntegerValue]);
          }
        }
        [(SUSUIInstallAlertExtensionViewController *)self _clearCountdownTimer];
        [(SUSUIInstallAlertExtensionViewController *)self _startCountdownTimerWithInitialTime:self->_countdownTimeout];
        v28 = [(SUSUIInstallAlertExtensionViewController *)self _createView];
        [(SUSUIInstallAlertExtensionViewController *)self setView:v28];

        goto LABEL_39;
      }
      v14 = SUSUILogExtension();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v15 = "[SUSUIInstallAlertExtensionViewController] Failed to get update name";
        goto LABEL_38;
      }
    }
    else
    {
      v14 = SUSUILogExtension();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v15 = "[SUSUIInstallAlertExtensionViewController] Failed to get user info";
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, 2u);
      }
    }
LABEL_39:

LABEL_40:
    goto LABEL_41;
  }
  v7 = SUSUILogExtension();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] extension input items null or empty. Unable to create alert view", (uint8_t *)&v29, 2u);
  }
LABEL_41:
}

- (void)viewDidLoad
{
  v3 = SUSUILogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View did load", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  [(SUSUIInstallAlertExtensionViewController *)&v4 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = SUSUILogExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    countdownTimer = self->_countdownTimer;
    *(_DWORD *)buf = 138412290;
    unint64_t v12 = (unint64_t)countdownTimer;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View will appear, _countdownTimer:%@", buf, 0xCu);
  }

  if (!self->_countdownTimer)
  {
    if (self->_timeLeftUntilInstall - 1 >= self->_countdownTimeout)
    {
      v7 = SUSUILogExtension();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t timeLeftUntilInstall = self->_timeLeftUntilInstall;
        unint64_t countdownTimeout = self->_countdownTimeout;
        *(_DWORD *)buf = 134218240;
        unint64_t v12 = timeLeftUntilInstall;
        __int16 v13 = 2048;
        unint64_t v14 = countdownTimeout;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Invalid _unint64_t timeLeftUntilInstall = %lu, set it to %lu", buf, 0x16u);
      }

      self->_unint64_t timeLeftUntilInstall = self->_countdownTimeout;
    }
    -[SUSUIInstallAlertExtensionViewController _startCountdownTimerWithInitialTime:](self, "_startCountdownTimerWithInitialTime:");
  }
  v10.receiver = self;
  v10.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  [(SUSUIInstallAlertExtensionViewController *)&v10 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = SUSUILogExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View will disappear", buf, 2u);
  }

  [(SUSUIInstallAlertExtensionViewController *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  [(SUSUIInstallAlertExtensionViewController *)&v6 viewWillDisappear:v3];
}

- (void)userWantsToDeferInstall:(id)a3
{
  objc_super v4 = SUSUILogExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install wants to defer install, invalidating", v5, 2u);
  }

  [(SUSUIInstallAlertExtensionViewController *)self invalidate];
}

- (void)client:(id)a3 installWantsToStart:(id)a4 completion:(id)a5
{
  objc_super v6 = SUSUILogExtension();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install wants to start, invalidating", v7, 2u);
  }

  [(SUSUIInstallAlertExtensionViewController *)self invalidate];
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  v5 = SUSUILogExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install did start, invalidating", v6, 2u);
  }

  [(SUSUIInstallAlertExtensionViewController *)self invalidate];
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(SUSUIInstallAlertExtensionViewController *)obj _clearCountdownTimer];
  objc_sync_exit(obj);
}

- (id)_createView
{
  BOOL v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:2];
  objc_super v4 = +[UIFont fontWithDescriptor:v3 size:14.0];
  v5 = [objc_alloc((Class)UILabel) initWithSize:0.0, 0.0];
  label = self->_label;
  self->_label = v5;

  v7 = self->_label;
  objc_super v8 = [(SUSUIInstallAlertExtensionViewController *)self _messageTextWithCountdown];
  [(UILabel *)v7 setText:v8];

  [(UILabel *)self->_label setAutoresizingMask:40];
  [(UILabel *)self->_label setLineBreakMode:0];
  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setFont:v4];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", 220.0, 1000.0);
  double v10 = v9;
  double v12 = v11;
  -[UILabel setSize:](self->_label, "setSize:");
  -[SUSUIInstallAlertExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
  __int16 v13 = self->_label;

  return v13;
}

- (void)_countdownTimerFired
{
  BOOL v3 = SUSUILogExtension();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    countdownTimer = self->_countdownTimer;
    *(_DWORD *)buf = 138412290;
    double v11 = countdownTimer;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Countdown timer hit, timer:%@", buf, 0xCu);
  }

  unint64_t timeLeftUntilInstall = self->_timeLeftUntilInstall - 1;
  self->_unint64_t timeLeftUntilInstall = timeLeftUntilInstall;
  label = self->_label;
  if (label)
  {
    v7 = [(SUSUIInstallAlertExtensionViewController *)self _messageTextWithCountdown];
    [(UILabel *)label setText:v7];

    unint64_t timeLeftUntilInstall = self->_timeLeftUntilInstall;
  }
  if (!timeLeftUntilInstall)
  {
    [(SUSUIInstallAlertExtensionViewController *)self _clearCountdownTimer];
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005264;
    block[3] = &unk_1000081C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)clientQueue, block);
    [(SUSUIInstallAlertExtensionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)reboot
{
  id v3 = objc_alloc_init((Class)FBSSystemService);
  id v2 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"OTA Software Update"];
  [v2 setRebootType:1];
  [v3 shutdownWithOptions:v2];
}

- (id)_messageTextWithCountdown
{
  id v3 = self->_pluralText;
  if (self->_timeLeftUntilInstall == 1)
  {
    objc_super v4 = self->_singularText;

    id v3 = v4;
  }
  if (qword_10000CDB0 != -1) {
    dispatch_once(&qword_10000CDB0, &stru_100008200);
  }
  v5 = [(id)qword_10000CDA8 localizedStringForKey:v3 value:&stru_100008330 table:@"ui_alerts"];
  objc_super v6 = +[NSString stringWithFormat:@"%@\n", v5];

  updateName = self->_updateName;
  objc_super v8 = +[NSNumber numberWithUnsignedInteger:self->_timeLeftUntilInstall];
  double v9 = +[NSString stringWithValidatedFormat:v6, @"%@ %@", 0, updateName, v8 validFormatSpecifiers error];

  return v9;
}

- (void)_clearCountdownTimer
{
  if (self->_countdownTimer)
  {
    id v3 = SUSUILogExtension();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      countdownTimer = self->_countdownTimer;
      int v6 = 138412290;
      v7 = countdownTimer;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Clearing countdown timer %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSTimer *)self->_countdownTimer invalidate];
    v5 = self->_countdownTimer;
    self->_countdownTimer = 0;
  }
}

- (void)_startCountdownTimerWithInitialTime:(unint64_t)a3
{
  self->_unint64_t timeLeftUntilInstall = a3;
  v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_countdownTimerFired" selector:0 userInfo:1 repeats:1.0];
  countdownTimer = self->_countdownTimer;
  self->_countdownTimer = v5;

  v7 = SUSUILogExtension();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = self->_countdownTimer;
    int v9 = 138412546;
    double v10 = v8;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Started countdown timer %@ with initial time %lu", (uint8_t *)&v9, 0x16u);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_singularText, 0);
  objc_storeStrong((id *)&self->_pluralText, 0);
  objc_storeStrong((id *)&self->_completionAction, 0);
  objc_storeStrong((id *)&self->_updateName, 0);

  objc_storeStrong((id *)&self->_countdownTimer, 0);
}

@end