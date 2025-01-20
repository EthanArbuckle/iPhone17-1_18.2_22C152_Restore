@interface TPSSIMPasscodeUnlockViewController
- (BOOL)isLocking;
- (NSNumberFormatter)numberFormatter;
- (TPSSIMPasscodeUnlockViewController)initWithSubscriberController:(id)a3 forLocking:(BOOL)a4;
- (TPSSIMPasscodeUnlockViewControllerDelegate)delegate;
- (TPSSubscriberTelephonyController)subscriberController;
- (TPSetPINViewController)setPINViewController;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setLocking:(BOOL)a3;
- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6;
- (void)setSetPINViewController:(id)a3;
- (void)subscriberController:(id)a3 SIMLockDidCompleteWithResult:(BOOL)a4;
@end

@implementation TPSSIMPasscodeUnlockViewController

- (TPSSIMPasscodeUnlockViewController)initWithSubscriberController:(id)a3 forLocking:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TPSSIMPasscodeUnlockViewController;
  v8 = [(TPSSIMPasscodeUnlockViewController *)&v25 init];
  v9 = v8;
  if (v8)
  {
    p_subscriberController = (id *)&v8->_subscriberController;
    objc_storeStrong((id *)&v8->_subscriberController, a3);
    [*p_subscriberController addDelegate:v9 queue:&_dispatch_main_q];
    v9->_locking = v4;
    id v11 = [objc_alloc((Class)TPSetPINViewController) initForNewPINWithMinLength:4 maxLength:8 confirmPIN:0];
    id v12 = objc_alloc_init((Class)UIView);
    v13 = +[UIColor blackColor];
    [v12 setBackgroundColor:v13];

    [v11 setCustomBackgroundView:v12];
    [v11 setDelegate:v9];
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*p_subscriberController SIMPasscodeRemainingAttempts]);
    v15 = TPSPasscodeStringForRemainingSIMPINAttempts(v14, v4, 0);
    [v11 setPromptTextForNewPIN:v15];

    if (v4) {
      CFStringRef v16 = @"LOCKING";
    }
    else {
      CFStringRef v16 = @"UNLOCKING";
    }
    v17 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:v16];
    [v11 setPromptTextForSavingPIN:v17];

    v18 = [v11 navigationItem];
    v19 = [v18 leftBarButtonItem];
    v20 = [(TPSSIMPasscodeUnlockViewController *)v9 navigationItem];
    [v20 setLeftBarButtonItem:v19];

    v21 = [v11 navigationItem];
    v22 = [v21 rightBarButtonItem];
    v23 = [(TPSSIMPasscodeUnlockViewController *)v9 navigationItem];
    [v23 setRightBarButtonItem:v22];

    [(TPSSIMPasscodeUnlockViewController *)v9 setSetPINViewController:v11];
    [(TPSSIMPasscodeUnlockViewController *)v9 addChildViewController:v11];
  }
  return v9;
}

- (void)dealloc
{
  [(TPSetPINViewController *)self->_setPINViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TPSSIMPasscodeUnlockViewController;
  [(TPSSIMPasscodeUnlockViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  BOOL v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v7 = objc_msgSend(v3, "initWithFrame:");

  v5 = [(TPSSIMPasscodeUnlockViewController *)self setPINViewController];
  v6 = [v5 view];
  [v7 addSubview:v6];

  [(TPSSIMPasscodeUnlockViewController *)self setView:v7];
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    BOOL v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109634;
    *(_DWORD *)v17 = v7;
    *(_WORD *)&v17[4] = 2112;
    *(void *)&v17[6] = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Asked to set PIN view controller finished with success: %d oldPIN: %@ newPIN: %@", (uint8_t *)&v16, 0x1Cu);
  }

  if (v7)
  {
    id v12 = TPSSIMPasscodeLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [(TPSSIMPasscodeUnlockViewController *)self isLocking];
      CFStringRef v14 = @"unlock";
      if (v13) {
        CFStringRef v14 = @"lock";
      }
      int v16 = 138412290;
      *(void *)v17 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Issuing request to %@ the SIM.", (uint8_t *)&v16, 0xCu);
    }

    v15 = [(TPSSIMPasscodeUnlockViewController *)self subscriberController];
    objc_msgSend(v15, "setSIMLockEnabled:pin:", -[TPSSIMPasscodeUnlockViewController isLocking](self, "isLocking"), v10);
  }
  else
  {
    v15 = [(TPSSIMPasscodeUnlockViewController *)self delegate];
    [v15 SIMPINUnlockViewControllerCanceled:self];
  }
}

- (void)subscriberController:(id)a3 SIMLockDidCompleteWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = TPSSIMPasscodeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"unsuccessful";
    if (v4) {
      CFStringRef v8 = @"successful";
    }
    int v14 = 138412290;
    CFStringRef v15 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "SIM lock save request was %@.", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    id v9 = [(TPSSIMPasscodeUnlockViewController *)self delegate];
    objc_msgSend(v9, "SIMPINUnlockViewController:finishedSuccessfullyWithSIMLocked:", self, objc_msgSend(v6, "isSIMPasscodeLockEnabled"));
  }
  else
  {
    id v10 = [v6 SIMPasscodeRemainingAttempts];
    if ((uint64_t)v10 < 1)
    {
      id v9 = [(TPSSIMPasscodeUnlockViewController *)self delegate];
      [v9 SIMPINUnlockViewControllerFailedWithZeroAttemptsRemaining:self];
    }
    else
    {
      id v11 = +[NSNumber numberWithInteger:v10];
      id v12 = TPSPasscodeStringForRemainingSIMPINAttempts(v11, [(TPSSIMPasscodeUnlockViewController *)self isLocking], 1);
      unsigned int v13 = [(TPSSIMPasscodeUnlockViewController *)self setPINViewController];
      [v13 setPromptTextForNewPIN:v12];

      id v9 = [(TPSSIMPasscodeUnlockViewController *)self setPINViewController];
      [v9 resetWithErrorPrompt:0];
    }
  }
}

- (TPSSIMPasscodeUnlockViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSSIMPasscodeUnlockViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isLocking
{
  return self->_locking;
}

- (void)setLocking:(BOOL)a3
{
  self->_locking = a3;
}

- (TPSSubscriberTelephonyController)subscriberController
{
  return self->_subscriberController;
}

- (TPSetPINViewController)setPINViewController
{
  return self->_setPINViewController;
}

- (void)setSetPINViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPINViewController, 0);
  objc_storeStrong((id *)&self->_subscriberController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end