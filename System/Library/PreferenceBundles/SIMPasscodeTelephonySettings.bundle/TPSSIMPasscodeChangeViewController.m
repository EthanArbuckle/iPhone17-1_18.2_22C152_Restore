@interface TPSSIMPasscodeChangeViewController
- (NSNumberFormatter)numberFormatter;
- (TPSSIMPasscodeChangeViewController)initWithSubscriberController:(id)a3;
- (TPSSIMPasscodeChangeViewControllerDelegate)delegate;
- (TPSSubscriberTelephonyController)subscriberController;
- (TPSetPINViewController)changePINViewController;
- (void)dealloc;
- (void)loadView;
- (void)setChangePINViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6;
- (void)subscriberController:(id)a3 SIMPasscodeChangeDidCompleteWithResult:(BOOL)a4;
@end

@implementation TPSSIMPasscodeChangeViewController

- (TPSSIMPasscodeChangeViewController)initWithSubscriberController:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSSIMPasscodeChangeViewController;
  v6 = [(TPSSIMPasscodeChangeViewController *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriberController, a3);
    [(TPSSubscriberTelephonyController *)v7->_subscriberController addDelegate:v7 queue:&_dispatch_main_q];
    id v8 = [objc_alloc((Class)TPSetPINViewController) initForChangePINWithMinLength:4 maxLength:8 confirmPIN:1];
    id v9 = objc_alloc_init((Class)UIView);
    v10 = +[UIColor blackColor];
    [v9 setBackgroundColor:v10];

    [v8 setCustomBackgroundView:v9];
    [v8 setDelegate:v7];
    v11 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"CURRENT_PIN"];
    [v8 setPromptTextForOldPIN:v11];

    v12 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"NEW_PIN"];
    [v8 setPromptTextForNewPIN:v12];

    v13 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"CONFIRM_NEW_PIN"];
    [v8 setPromptTextForConfirmingNewPIN:v13];

    v14 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"CHANGING_PIN"];
    [v8 setPromptTextForSavingPIN:v14];

    [(TPSSIMPasscodeChangeViewController *)v7 setChangePINViewController:v8];
    [(TPSSIMPasscodeChangeViewController *)v7 addChildViewController:v8];
    v15 = [v8 navigationItem];
    v16 = [v15 leftBarButtonItem];
    v17 = [(TPSSIMPasscodeChangeViewController *)v7 navigationItem];
    [v17 setLeftBarButtonItem:v16];

    v18 = [v8 navigationItem];
    v19 = [v18 rightBarButtonItem];
    v20 = [(TPSSIMPasscodeChangeViewController *)v7 navigationItem];
    [v20 setRightBarButtonItem:v19];
  }
  return v7;
}

- (void)dealloc
{
  [(TPSetPINViewController *)self->_changePINViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TPSSIMPasscodeChangeViewController;
  [(TPSSIMPasscodeChangeViewController *)&v3 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  id v7 = objc_msgSend(v3, "initWithFrame:");

  id v5 = [(TPSSIMPasscodeChangeViewController *)self changePINViewController];
  v6 = [v5 view];
  [v7 addSubview:v6];

  [(TPSSIMPasscodeChangeViewController *)self setView:v7];
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    id v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6
{
  BOOL v7 = a4;
  id v11 = a5;
  id v9 = a6;
  if (v7)
  {
    v10 = [(TPSSIMPasscodeChangeViewController *)self subscriberController];
    [v10 changePIN:v11 newPin:v9];
  }
  else
  {
    v10 = [(TPSSIMPasscodeChangeViewController *)self delegate];
    [v10 TPSSIMPasscodeChangeViewControllerCanceled:self];
  }
}

- (void)subscriberController:(id)a3 SIMPasscodeChangeDidCompleteWithResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v19 = v6;
  if (v4)
  {
    BOOL v7 = [(TPSSIMPasscodeChangeViewController *)self delegate];
    [v7 TPSSIMPasscodeChangeViewControllerFinishedSuccessfully:self];
    goto LABEL_9;
  }
  id v8 = (char *)[v6 SIMPasscodeRemainingAttempts];
  id v9 = v8;
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    CFStringRef v10 = @"%@_SIM_ATTEMPT_REMAINING";
  }
  else
  {
    if (!v8)
    {
      BOOL v7 = [(TPSSIMPasscodeChangeViewController *)self delegate];
      [v7 TPSSIMPasscodeChangeViewControllerFailedWithZeroAttemptsRemaining:self];
      goto LABEL_9;
    }
    CFStringRef v10 = @"%@_SIM_ATTEMPTS_REMAINING";
  }
  BOOL v7 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:v10];
  id v11 = [(TPSSIMPasscodeChangeViewController *)self numberFormatter];
  v12 = +[NSNumber numberWithInteger:v9];
  v13 = [v11 stringFromNumber:v12];

  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v13);

  v15 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:@"COULD_NOT_CHANGE_PIN_REASON_%@"];
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v14);
  v17 = [(TPSSIMPasscodeChangeViewController *)self changePINViewController];
  [v17 setPromptTextForOldPIN:v16];

  v18 = [(TPSSIMPasscodeChangeViewController *)self changePINViewController];
  [v18 resetWithErrorPrompt:0];

LABEL_9:
}

- (TPSSIMPasscodeChangeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSSIMPasscodeChangeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TPSSubscriberTelephonyController)subscriberController
{
  return self->_subscriberController;
}

- (TPSetPINViewController)changePINViewController
{
  return self->_changePINViewController;
}

- (void)setChangePINViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePINViewController, 0);
  objc_storeStrong((id *)&self->_subscriberController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end