@interface TPSSIMPasscodeListController
- (BOOL)isSIMLockAllowed;
- (BOOL)isSIMPasscodeChangeAllowed;
- (BOOL)isSIMPasscodeProtected;
- (NSString)SIMStatus;
- (TPSSIMPasscodeChangeViewController)changePINViewController;
- (TPSSIMPasscodeListController)init;
- (TPSSIMPasscodeUnlockViewController)unlockPINViewController;
- (TPSSubscriberTelephonyController)subscriberController;
- (UINavigationController)changePINNavigationController;
- (UINavigationController)unlockPINNavigationController;
- (UIPopoverController)changePINPopoverController;
- (UIPopoverController)unlockPINPopoverController;
- (id)_popoverPresentationView;
- (id)isSIMPasscodeProtected:(id)a3;
- (id)setCellEnabled:(BOOL)a3 atIndex:(unsigned int)a4;
- (id)setCellLoading:(BOOL)a3 atIndex:(unsigned int)a4;
- (id)setControlEnabled:(BOOL)a3 atIndex:(int64_t)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_dismissChangeController;
- (void)_dismissUnlockController;
- (void)changePIN:(id)a3;
- (void)dealloc;
- (void)handleUIApplicationSuspendedNotification:(id)a3;
- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentSIMPasscodeAlert;
- (void)setChangePINNavigationController:(id)a3;
- (void)setChangePINPopoverController:(id)a3;
- (void)setChangePINViewController:(id)a3;
- (void)setSIMPasscodeProtected:(id)a3 specifier:(id)a4;
- (void)setSIMStatus:(id)a3;
- (void)setUnlockPINNavigationController:(id)a3;
- (void)setUnlockPINPopoverController:(id)a3;
- (void)setUnlockPINViewController:(id)a3;
- (void)subscriberController:(id)a3 SIMPasscodeLockEnabledDidChange:(BOOL)a4;
- (void)subscriberController:(id)a3 SIMStatusDidChange:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TPSSIMPasscodeListController

- (TPSSIMPasscodeListController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSSIMPasscodeListController;
  v2 = [(TPSSIMPasscodeListController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"handleUIApplicationSuspendedNotification:" name:UIApplicationSuspendedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  unlockPINPopoverController = self->_unlockPINPopoverController;
  if (unlockPINPopoverController) {
    [(UIPopoverController *)unlockPINPopoverController dismissPopoverAnimated:0];
  }
  changePINPopoverController = self->_changePINPopoverController;
  if (changePINPopoverController) {
    [(UIPopoverController *)changePINPopoverController dismissPopoverAnimated:0];
  }
  [(UIPopoverController *)self->_unlockPINPopoverController setDelegate:0];
  [(TPSSIMPasscodeUnlockViewController *)self->_unlockPINViewController setDelegate:0];
  [(UIPopoverController *)self->_changePINPopoverController setDelegate:0];
  [(TPSSIMPasscodeChangeViewController *)self->_changePINViewController setDelegate:0];
  v6.receiver = self;
  v6.super_class = (Class)TPSSIMPasscodeListController;
  [(TPSSIMPasscodeListController *)&v6 dealloc];
}

- (TPSSubscriberTelephonyController)subscriberController
{
  subscriberController = self->_subscriberController;
  if (!subscriberController)
  {
    id v4 = objc_alloc((Class)TPSSubscriberTelephonyController);
    objc_super v5 = [(TPSSIMPasscodeListController *)self subscriptionContext];
    objc_super v6 = (TPSSubscriberTelephonyController *)[v4 initWithSubscriptionContext:v5];
    v7 = self->_subscriberController;
    self->_subscriberController = v6;

    [(TPSSubscriberTelephonyController *)self->_subscriberController addDelegate:self queue:&_dispatch_main_q];
    subscriberController = self->_subscriberController;
  }

  return subscriberController;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->TPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"SIM_PIN"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setSIMPasscodeProtected:specifier:" get:"isSIMPasscodeProtected:" detail:0 cell:6 edit:0];

    [v8 setIdentifier:@"SET_SIM_PIN_ID"];
    [v5 addObject:v8];
    v9 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"CHANGE_PIN"];

    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v10 setIdentifier:@"CHANGE_PIN_ID"];
    [v10 setButtonAction:"changePIN:"];
    [v5 addObject:v10];
    id v11 = [v5 copy];
    v12 = *(void **)&self->TPSListController_opaque[v3];
    *(void *)&self->TPSListController_opaque[v3] = v11;

    id v4 = *(void **)&self->TPSListController_opaque[v3];
  }

  return v4;
}

- (id)isSIMPasscodeProtected:(id)a3
{
  BOOL v3 = [(TPSSIMPasscodeListController *)self isSIMPasscodeProtected];

  return +[NSNumber numberWithBool:v3];
}

- (void)setSIMPasscodeProtected:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  objc_super v6 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "User requested to set passcode protection to %@", (uint8_t *)&v32, 0xCu);
  }

  id v7 = [(TPSSIMPasscodeListController *)self setControlEnabled:0 atIndex:1];
  if (v5)
  {
    v8 = [(TPSSIMPasscodeListController *)self unlockPINViewController];

    if (!v8)
    {
      v9 = [(TPSSIMPasscodeListController *)self unlockPINViewController];
      [v9 setDelegate:0];

      v10 = [TPSSIMPasscodeUnlockViewController alloc];
      id v11 = [(TPSSIMPasscodeListController *)self subscriberController];
      v12 = -[TPSSIMPasscodeUnlockViewController initWithSubscriberController:forLocking:](v10, "initWithSubscriberController:forLocking:", v11, [v5 BOOLValue]);
      [(TPSSIMPasscodeListController *)self setUnlockPINViewController:v12];

      v13 = [(TPSSIMPasscodeListController *)self unlockPINViewController];
      [v13 setDelegate:self];

      id v14 = objc_alloc((Class)TPPortraitOnlyNavigationController);
      v15 = [(TPSSIMPasscodeListController *)self unlockPINViewController];
      id v16 = [v14 initWithRootViewController:v15];
      [(TPSSIMPasscodeListController *)self setUnlockPINNavigationController:v16];

      v17 = +[UIDevice currentDevice];
      v18 = (char *)[v17 userInterfaceIdiom];

      v19 = [(TPSSIMPasscodeListController *)self unlockPINNavigationController];
      v20 = v19;
      if (v18 == (unsigned char *)&dword_0 + 1)
      {
        objc_msgSend(v19, "setPreferredContentSize:", 320.0, 480.0);

        id v21 = objc_alloc((Class)UIPopoverController);
        v22 = [(TPSSIMPasscodeListController *)self unlockPINNavigationController];
        id v23 = [v21 initWithContentViewController:v22];
        [(TPSSIMPasscodeListController *)self setUnlockPINPopoverController:v23];

        v24 = [(TPSSIMPasscodeListController *)self unlockPINPopoverController];
        [v24 setDelegate:self];

        v25 = +[UIApplication sharedApplication];
        v26 = [v25 keyWindow];
        [v26 frame];
        double v28 = v27;
        double v30 = v29;

        v20 = [(TPSSIMPasscodeListController *)self unlockPINPopoverController];
        v31 = [(TPSSIMPasscodeListController *)self _popoverPresentationView];
        objc_msgSend(v20, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v31, 0, 1, v28 * 0.5, v30 * 0.5, 1.0, 1.0);
      }
      else
      {
        [(TPSSIMPasscodeListController *)self presentViewController:v19 animated:1 completion:0];
      }
    }
  }
}

- (void)changePIN:(id)a3
{
  id v4 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v29 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User requested to change PIN", v29, 2u);
  }

  if ([(TPSSIMPasscodeListController *)self isSIMPasscodeChangeAllowed])
  {
    id v5 = [(TPSSIMPasscodeListController *)self changePINViewController];

    if (!v5)
    {
      objc_super v6 = [(TPSSIMPasscodeListController *)self changePINViewController];
      [v6 setDelegate:0];

      id v7 = [TPSSIMPasscodeChangeViewController alloc];
      v8 = [(TPSSIMPasscodeListController *)self subscriberController];
      v9 = [(TPSSIMPasscodeChangeViewController *)v7 initWithSubscriberController:v8];
      [(TPSSIMPasscodeListController *)self setChangePINViewController:v9];

      v10 = [(TPSSIMPasscodeListController *)self changePINViewController];
      [v10 setDelegate:self];

      id v11 = objc_alloc((Class)TPPortraitOnlyNavigationController);
      v12 = [(TPSSIMPasscodeListController *)self changePINViewController];
      id v13 = [v11 initWithRootViewController:v12];
      [(TPSSIMPasscodeListController *)self setChangePINNavigationController:v13];

      id v14 = +[UIDevice currentDevice];
      v15 = (char *)[v14 userInterfaceIdiom];

      id v16 = [(TPSSIMPasscodeListController *)self changePINNavigationController];
      v17 = v16;
      if (v15 == (unsigned char *)&dword_0 + 1)
      {
        objc_msgSend(v16, "setPreferredContentSize:", 320.0, 480.0);

        id v18 = objc_alloc((Class)UIPopoverController);
        v19 = [(TPSSIMPasscodeListController *)self changePINNavigationController];
        id v20 = [v18 initWithContentViewController:v19];
        [(TPSSIMPasscodeListController *)self setChangePINPopoverController:v20];

        id v21 = [(TPSSIMPasscodeListController *)self changePINPopoverController];
        [v21 setDelegate:self];

        v22 = +[UIApplication sharedApplication];
        id v23 = [v22 keyWindow];
        [v23 frame];
        double v25 = v24;
        double v27 = v26;

        v17 = [(TPSSIMPasscodeListController *)self changePINPopoverController];
        double v28 = [(TPSSIMPasscodeListController *)self _popoverPresentationView];
        objc_msgSend(v17, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v28, 0, 1, v25 * 0.5, v27 * 0.5, 1.0, 1.0);
      }
      else
      {
        [(TPSSIMPasscodeListController *)self presentViewController:v16 animated:1 completion:0];
      }
    }
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TPSSIMPasscodeListController;
  [(TPSSIMPasscodeListController *)&v4 viewDidLoad];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleUIApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TPSSIMPasscodeListController;
  [(TPSSIMPasscodeListController *)&v11 viewWillAppear:a3];
  objc_super v4 = [(TPSSIMPasscodeListController *)self SIMStatus];

  if (!v4)
  {
    id v5 = [(TPSSIMPasscodeListController *)self subscriberController];
    objc_super v6 = [v5 SIMStatus];

    id v7 = TPSSIMPasscodeLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(TPSSIMPasscodeListController *)self subscriptionContext];
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Initializing SIM status to %@ for subscription context %@.", buf, 0x16u);
    }
    v9 = [(TPSSIMPasscodeListController *)self subscriberController];
    v10 = [v9 SIMStatus];
    [(TPSSIMPasscodeListController *)self setSIMStatus:v10];
  }
}

- (void)_dismissUnlockController
{
  [(TPSSIMPasscodeListController *)self reloadSpecifiers];
  BOOL v3 = [(TPSSIMPasscodeListController *)self unlockPINPopoverController];

  if (v3)
  {
    objc_super v4 = [(TPSSIMPasscodeListController *)self unlockPINPopoverController];
    [v4 dismissPopoverAnimated:1];

    id v5 = [(TPSSIMPasscodeListController *)self unlockPINPopoverController];
    [v5 setDelegate:0];

    [(TPSSIMPasscodeListController *)self setUnlockPINPopoverController:0];
  }
  else
  {
    [(TPSSIMPasscodeListController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(TPSSIMPasscodeListController *)self setUnlockPINNavigationController:0];
  objc_super v6 = [(TPSSIMPasscodeListController *)self unlockPINViewController];
  [v6 setDelegate:0];

  [(TPSSIMPasscodeListController *)self setUnlockPINViewController:0];
}

- (void)_dismissChangeController
{
  [(TPSSIMPasscodeListController *)self reloadSpecifiers];
  BOOL v3 = [(TPSSIMPasscodeListController *)self changePINPopoverController];

  if (v3)
  {
    objc_super v4 = [(TPSSIMPasscodeListController *)self changePINPopoverController];
    [v4 dismissPopoverAnimated:1];

    id v5 = [(TPSSIMPasscodeListController *)self changePINPopoverController];
    [v5 setDelegate:0];

    [(TPSSIMPasscodeListController *)self setChangePINPopoverController:0];
  }
  else
  {
    [(TPSSIMPasscodeListController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(TPSSIMPasscodeListController *)self setChangePINNavigationController:0];
  objc_super v6 = [(TPSSIMPasscodeListController *)self changePINViewController];
  [v6 setDelegate:0];

  [(TPSSIMPasscodeListController *)self setChangePINViewController:0];
}

- (id)_popoverPresentationView
{
  BOOL v3 = [(TPSSIMPasscodeListController *)self navigationController];
  objc_super v4 = [v3 presentingViewController];
  id v5 = [v4 view];

  if (!v5)
  {
    objc_super v6 = [(TPSSIMPasscodeListController *)self navigationController];
    id v7 = [v6 parentViewController];
    id v5 = [v7 view];
  }

  return v5;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(TPSSIMPasscodeListController *)self _dismissChangeController];

  [(TPSSIMPasscodeListController *)self _dismissUnlockController];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)TPSSIMPasscodeListController;
    id v8 = [(TPSSIMPasscodeListController *)&v16 tableView:v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v8;
      v9 = [v8 specifier];
      v10 = [v9 identifier];
      unsigned int v11 = [v10 isEqualToString:@"SET_SIM_PIN_ID"];

      if (v11)
      {
        objc_msgSend(v8, "setCellEnabled:", -[TPSSIMPasscodeListController isSIMLockAllowed](self, "isSIMLockAllowed"));
        v12 = [v9 propertyForKey:PSControlKey];
        objc_msgSend(v12, "setEnabled:", -[TPSSIMPasscodeListController isSIMLockAllowed](self, "isSIMLockAllowed"));
      }
      else
      {
        id v13 = [v9 identifier];
        unsigned int v14 = [v13 isEqualToString:@"CHANGE_PIN_ID"];

        if (v14)
        {
          objc_msgSend(v8, "setCellEnabled:", -[TPSSIMPasscodeListController isSIMPasscodeChangeAllowed](self, "isSIMPasscodeChangeAllowed"));
          [v8 setAlignment:1];
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)setControlEnabled:(BOOL)a3 atIndex:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(TPSSIMPasscodeListController *)self table];
  id v8 = [(TPSSIMPasscodeListController *)self indexPathForIndex:a4];
  v9 = [(TPSSIMPasscodeListController *)self tableView:v7 cellForRowAtIndexPath:v8];

  if (objc_opt_respondsToSelector())
  {
    v10 = [v9 control];
    [v10 setEnabled:v5];
  }

  return v9;
}

- (id)setCellEnabled:(BOOL)a3 atIndex:(unsigned int)a4
{
  BOOL v5 = a3;
  id v7 = [(TPSSIMPasscodeListController *)self table];
  id v8 = [(TPSSIMPasscodeListController *)self indexPathForIndex:a4];
  v9 = [(TPSSIMPasscodeListController *)self tableView:v7 cellForRowAtIndexPath:v8];

  [v9 setCellEnabled:v5];

  return v9;
}

- (id)setCellLoading:(BOOL)a3 atIndex:(unsigned int)a4
{
  BOOL v5 = a3;
  id v7 = [(TPSSIMPasscodeListController *)self table];
  uint64_t v8 = a4;
  v9 = [(TPSSIMPasscodeListController *)self indexPathForIndex:a4];
  v10 = [(TPSSIMPasscodeListController *)self tableView:v7 cellForRowAtIndexPath:v9];

  unsigned int v11 = [(TPSSIMPasscodeListController *)self specifierAtIndex:v8];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = PSControlIsLoadingKey;
    unsigned int v14 = [v11 propertyForKey:PSControlIsLoadingKey];
    unsigned int v15 = [v14 BOOLValue];

    if (v15 != v5)
    {
      objc_super v16 = +[NSNumber numberWithBool:v5];
      [v12 setProperty:v16 forKey:v13];

      [(TPSSIMPasscodeListController *)self reloadSpecifier:v12 animated:0];
    }
  }

  return v10;
}

- (BOOL)isSIMLockAllowed
{
  v2 = [(TPSSIMPasscodeListController *)self subscriberController];
  BOOL v3 = [v2 SIMStatus];
  unsigned __int8 v4 = [v3 isEqualToString:kCTSIMSupportSIMStatusReady];

  return v4;
}

- (BOOL)isSIMPasscodeChangeAllowed
{
  BOOL v3 = [(TPSSIMPasscodeListController *)self isSIMLockAllowed];
  if (v3)
  {
    LOBYTE(v3) = [(TPSSIMPasscodeListController *)self isSIMPasscodeProtected];
  }
  return v3;
}

- (BOOL)isSIMPasscodeProtected
{
  v2 = [(TPSSIMPasscodeListController *)self subscriberController];
  unsigned __int8 v3 = [v2 isSIMPasscodeLockEnabled];

  return v3;
}

- (void)setSIMStatus:(id)a3
{
  unsigned __int8 v4 = (NSString *)a3;
  SIMStatus = self->_SIMStatus;
  if (SIMStatus != v4)
  {
    v9 = v4;
    id v6 = SIMStatus;
    id v7 = (NSString *)[(NSString *)v9 copy];
    uint64_t v8 = self->_SIMStatus;
    self->_SIMStatus = v7;

    if ([(NSString *)v9 isEqualToString:kCTSIMSupportSIMStatusPINLocked])
    {
      if (!v6) {
        [(TPSSIMPasscodeListController *)self presentSIMPasscodeAlert];
      }
    }
    else if ([(NSString *)v9 isEqualToString:kCTSIMSupportSIMStatusReady])
    {
      [(TPSSIMPasscodeListController *)self reloadSpecifiers];
    }
  }

  _objc_release_x1();
}

- (void)presentSIMPasscodeAlert
{
  unsigned __int8 v3 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = [(TPSSIMPasscodeListController *)self subscriptionContext];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Authentication is required in order to proceed; presenting passcode alert for subscription context %@.",
      (uint8_t *)&v6,
      0xCu);
  }
  BOOL v5 = [(TPSSIMPasscodeListController *)self subscriberController];
  [v5 presentSIMPasscodeAlert];
}

- (void)subscriberController:(id)a3 SIMPasscodeLockEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      CFStringRef v7 = @"enabled";
    }
    else {
      CFStringRef v7 = @"disabled";
    }
    uint64_t v8 = [(TPSSIMPasscodeListController *)self subscriptionContext];
    int v9 = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SIM passcode protection changed to %@ for subscription context %@.", (uint8_t *)&v9, 0x16u);
  }
  [(TPSSIMPasscodeListController *)self reloadSpecifiers];
}

- (void)subscriberController:(id)a3 SIMStatusDidChange:(id)a4
{
  id v5 = a4;
  int v6 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = [(TPSSIMPasscodeListController *)self subscriptionContext];
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SIM status changed to %@ for subscription context %@.", (uint8_t *)&v8, 0x16u);
  }
  [(TPSSIMPasscodeListController *)self setSIMStatus:v5];
}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  id v5 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v9, 0x16u);
  }
  CFStringRef v7 = [(TPSSIMPasscodeListController *)self SIMStatus];
  unsigned int v8 = [v7 isEqualToString:kCTSIMSupportSIMStatusPINLocked];

  if (v8) {
    [(TPSSIMPasscodeListController *)self presentSIMPasscodeAlert];
  }
}

- (void)handleUIApplicationSuspendedNotification:(id)a3
{
  id v4 = a3;
  id v5 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v7, 0x16u);
  }
  [(TPSSIMPasscodeListController *)self _dismissChangeController];
  [(TPSSIMPasscodeListController *)self _dismissUnlockController];
}

- (UIPopoverController)unlockPINPopoverController
{
  return (UIPopoverController *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUnlockPINPopoverController:(id)a3
{
}

- (UINavigationController)unlockPINNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 200, 1);
}

- (void)setUnlockPINNavigationController:(id)a3
{
}

- (TPSSIMPasscodeUnlockViewController)unlockPINViewController
{
  return (TPSSIMPasscodeUnlockViewController *)objc_getProperty(self, a2, 208, 1);
}

- (void)setUnlockPINViewController:(id)a3
{
}

- (UIPopoverController)changePINPopoverController
{
  return (UIPopoverController *)objc_getProperty(self, a2, 216, 1);
}

- (void)setChangePINPopoverController:(id)a3
{
}

- (UINavigationController)changePINNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 224, 1);
}

- (void)setChangePINNavigationController:(id)a3
{
}

- (TPSSIMPasscodeChangeViewController)changePINViewController
{
  return (TPSSIMPasscodeChangeViewController *)objc_getProperty(self, a2, 232, 1);
}

- (void)setChangePINViewController:(id)a3
{
}

- (NSString)SIMStatus
{
  return self->_SIMStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMStatus, 0);
  objc_storeStrong((id *)&self->_changePINViewController, 0);
  objc_storeStrong((id *)&self->_changePINNavigationController, 0);
  objc_storeStrong((id *)&self->_changePINPopoverController, 0);
  objc_storeStrong((id *)&self->_unlockPINViewController, 0);
  objc_storeStrong((id *)&self->_unlockPINNavigationController, 0);
  objc_storeStrong((id *)&self->_unlockPINPopoverController, 0);

  objc_storeStrong((id *)&self->_subscriberController, 0);
}

@end