@interface TSSIMUnlockDetailViewController
- (BOOL)_appearingOrAppeared;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSString)lockedSIMName;
- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 lockedSIMName:(id)a5 delegate:(id)a6;
- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6;
- (TSSIMUnlockDetailViewControllerDelegate)delegate;
- (TSSubscriptionAction)subscriptionAction;
- (id)_entryView;
- (void)_cancelButtonPressed:(id)a3;
- (void)entryView:(id)a3 didEnterText:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4;
- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSSIMUnlockDetailViewController

- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 lockedSIMName:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (sub_1000107CC())
  {
    v14 = sub_100010734();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100012C04();
    }
  }
  v15 = [(TSSIMUnlockDetailViewController *)self initWithSubscriptionContext:v10 subscriptionAction:v11 suppressCancellation:0 delegate:v13];
  if (v15)
  {
    v16 = (NSString *)[v12 copy];
    lockedSIMName = v15->_lockedSIMName;
    v15->_lockedSIMName = v16;
  }
  return v15;
}

- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (sub_1000107CC())
  {
    v14 = sub_100010734();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100012CB0();
    }
  }
  v15 = [(TSSIMUnlockDetailViewController *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_subscriptionContext, a3);
    objc_storeStrong((id *)&v16->_subscriptionAction, a4);
    objc_storeWeak((id *)&v16->_delegate, v13);
    v16->_suppressCancellation = a5;
    v17 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    telephonyClient = v16->_telephonyClient;
    v16->_telephonyClient = v17;

    [(CoreTelephonyClient *)v16->_telephonyClient setDelegate:v16];
  }

  return v16;
}

- (void)loadView
{
  if (sub_1000107CC())
  {
    v3 = sub_100010734();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100012D5C(v3);
    }
  }
  v4 = [[TSSIMUnlockDetailView alloc] initWithActionType:[(TSSubscriptionAction *)self->_subscriptionAction actionType] actionSubtype:[(TSSubscriptionAction *)self->_subscriptionAction actionSubtype] lockedSIMName:self->_lockedSIMName];
  [(TSSIMUnlockDetailView *)v4 setAutoresizingMask:18];
  [(TSSIMUnlockDetailViewController *)self setView:v4];
  id v5 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"_cancelButtonPressed:"];
  [v5 setDirection:8];
  [v5 setDelegate:self];
  v6 = [(TSSIMUnlockDetailViewController *)self view];
  [v6 addGestureRecognizer:v5];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)TSSIMUnlockDetailViewController;
  [(TSSIMUnlockDetailViewController *)&v12 viewDidLoad];
  [(TSSIMUnlockDetailViewController *)self setEdgesForExtendedLayout:0];
  v3 = [(TSSIMUnlockDetailViewController *)self _entryView];
  [v3 setDelegate:self];

  if (!self->_suppressCancellation)
  {
    v4 = [(TSSIMUnlockDetailViewController *)self navigationController];
    id v5 = [v4 viewControllers];
    v6 = [v5 firstObject];

    if (v6 == self)
    {
      id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonPressed:"];
      v8 = [(TSSIMUnlockDetailViewController *)self navigationItem];
      [v8 setLeftBarButtonItem:v7];

      v9 = +[UIColor systemBackgroundColor];
      id v10 = [(TSSIMUnlockDetailViewController *)self navigationController];
      id v11 = [v10 view];
      [v11 setBackgroundColor:v9];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSSIMUnlockDetailViewController;
  [(TSSIMUnlockDetailViewController *)&v12 viewWillAppear:a3];
  [(TSSIMUnlockDetailViewController *)self becomeFirstResponder];
  if (sub_1000107CC())
  {
    v4 = sub_100010734();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100012DEC((uint64_t)self);
    }
  }
  int64_t v5 = [(TSSubscriptionAction *)self->_subscriptionAction actionType];
  if (v5 == 3)
  {
    if ((id)[(TSSubscriptionAction *)self->_subscriptionAction actionSubtype] == (id)1)
    {
      telephonyClient = self->_telephonyClient;
      subscriptionContext = self->_subscriptionContext;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100004BC4;
      v10[3] = &unk_100020680;
      v10[4] = self;
      [(CoreTelephonyClient *)telephonyClient getRemainingPUKAttemptCount:subscriptionContext completion:v10];
    }
  }
  else if (v5 == 2)
  {
    v6 = self->_telephonyClient;
    id v7 = self->_subscriptionContext;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004B54;
    v11[3] = &unk_100020680;
    v11[4] = self;
    [(CoreTelephonyClient *)v6 getRemainingPINAttemptCount:v7 completion:v11];
  }
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(TSSIMUnlockDetailViewController *)self _appearingOrAppeared];
  if (v3)
  {
    v4 = [(TSSIMUnlockDetailViewController *)self _entryView];
    unsigned __int8 v5 = [v4 becomeFirstResponder];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  BOOL v3 = [(TSSIMUnlockDetailViewController *)self _appearingOrAppeared];
  if (v3)
  {
    v4 = [(TSSIMUnlockDetailViewController *)self _entryView];
    unsigned __int8 v5 = [v4 canBecomeFirstResponder];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(TSSIMUnlockDetailViewController *)self _entryView];
  unsigned __int8 v3 = [v2 resignFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(TSSIMUnlockDetailViewController *)self _entryView];
  unsigned __int8 v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)isFirstResponder
{
  v2 = [(TSSIMUnlockDetailViewController *)self _entryView];
  unsigned __int8 v3 = [v2 isFirstResponder];

  return v3;
}

- (void)entryView:(id)a3 didEnterText:(id)a4
{
  id v5 = a4;
  if (sub_1000107CC())
  {
    v6 = sub_100010734();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100012F3C((uint64_t)self);
    }
  }
  int64_t v7 = [(TSSubscriptionAction *)self->_subscriptionAction actionType];
  if (v7 == 3)
  {
    id v10 = self->_subscriptionAction;
    if (sub_1000107CC())
    {
      id v11 = sub_100010734();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100012E8C(v10, v11);
      }
    }
    id v12 = [(TSSubscriptionAction *)v10 actionSubtype];
    if (v12 == (id)3)
    {
      v14 = self->_subscriptionAction;
      v15 = [(TSSubscriptionAction *)v14 pin1];
      unsigned int v16 = [v15 isEqualToString:v5];

      if (v16)
      {
        v17 = [(TSSIMUnlockDetailViewController *)self _detailView];
        [v17 setUnlocking:1];

        telephonyClient = self->_telephonyClient;
        subscriptionContext = self->_subscriptionContext;
        WeakRetained = [(TSSubscriptionAction *)v14 puk];
        v21 = [(TSSubscriptionAction *)v14 pin1];
        [(CoreTelephonyClient *)telephonyClient unlockPUK:subscriptionContext puk:WeakRetained newPin:v21 error:0];
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained unlockDetailViewController:self didCompleteWithResult:4];
      }

      goto LABEL_23;
    }
    if (v12 == (id)2)
    {
      id v13 = [(TSSubscriptionAction *)v10 copyByApplyingPIN1:v5];
    }
    else
    {
      if (v12 != (id)1) {
        goto LABEL_23;
      }
      id v13 = [(TSSubscriptionAction *)v10 copyByApplyingPUK:v5];
    }
    v22 = v13;
    v23 = [[TSSIMUnlockDetailViewController alloc] initWithSubscriptionContext:self->_subscriptionContext subscriptionAction:v13 lockedSIMName:self->_lockedSIMName delegate:self];

    if (v23)
    {
      v24 = [(TSSIMUnlockDetailViewController *)self navigationController];
      [v24 pushViewController:v23 animated:1];

      id v10 = (TSSubscriptionAction *)v23;
      goto LABEL_23;
    }
  }
  else if (v7 == 2)
  {
    v8 = [(TSSIMUnlockDetailViewController *)self _detailView];
    [v8 setUnlocking:1];

    v9 = self->_telephonyClient;
    id v10 = [(TSSIMUnlockDetailViewController *)self subscriptionContext];
    [(CoreTelephonyClient *)v9 unlockPIN:v10 pin:v5 error:0];
LABEL_23:
  }
}

- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4
{
  v6 = sub_100010734();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    v18 = "-[TSSIMUnlockDetailViewController unlockDetailViewController:didCompleteWithResult:]";
    __int16 v19 = 2048;
    int64_t v20 = a4;
    __int16 v21 = 2080;
    v22 = "-[TSSIMUnlockDetailViewController unlockDetailViewController:didCompleteWithResult:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, result %ld @%s", (uint8_t *)&v17, 0x20u);
  }

  switch(a4)
  {
    case 0:
    case 3:
    case 6:
      int64_t v7 = [(TSSIMUnlockDetailViewController *)self delegate];
      v8 = v7;
      v9 = self;
      int64_t v10 = a4;
      goto LABEL_5;
    case 1:
    case 2:
      goto LABEL_9;
    case 4:
      id v11 = [(TSSIMUnlockDetailViewController *)self navigationController];
      id v12 = [v11 popToViewController:self animated:1];

      id v13 = [(TSSIMUnlockDetailViewController *)self _entryView];
      [v13 setPinMismatch:1];

      v8 = [(TSSIMUnlockDetailViewController *)self _entryView];
      [v8 resetEnteredTextWithShakeAnimation:0];
      goto LABEL_10;
    case 5:
      if ((id)[(TSSubscriptionAction *)self->_subscriptionAction actionSubtype] == (id)1)
      {
        v14 = [(TSSIMUnlockDetailViewController *)self _entryView];
        [v14 setPinMismatch:0];

        v15 = [(TSSIMUnlockDetailViewController *)self _entryView];
        [v15 resetEnteredTextWithShakeAnimation:1];

LABEL_9:
        v8 = [(TSSIMUnlockDetailViewController *)self navigationController];
        id v16 = [v8 popToViewController:self animated:1];
      }
      else
      {
        int64_t v7 = [(TSSIMUnlockDetailViewController *)self delegate];
        v8 = v7;
        v9 = self;
        int64_t v10 = 5;
LABEL_5:
        [v7 unlockDetailViewController:v9 didCompleteWithResult:v10];
      }
LABEL_10:

      return;
    default:
      return;
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = sub_100010734();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v6 slotID];
      uint64_t v9 = CTSubscriptionSlotAsString();
      int64_t v10 = sub_10000A36C([(TSSubscriptionAction *)self->_subscriptionAction actionType]);
      int v19 = 136316162;
      int64_t v20 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
      __int16 v21 = 2080;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      v26 = v10;
      __int16 v27 = 2080;
      v28 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: context %s, status %@, current action %@ @%s", (uint8_t *)&v19, 0x34u);
    }
    if ((id)[(TSSubscriptionAction *)self->_subscriptionAction actionType] == (id)2
      || (id)[(TSSubscriptionAction *)self->_subscriptionAction actionType] == (id)3)
    {
      id v11 = [v6 uuid];
      id v12 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext uuid];
      unsigned int v13 = [v11 isEqual:v12];

      if (v13)
      {
        if ([v7 isEqualToString:kCTSIMSupportSIMStatusPUKLocked])
        {
          v14 = [(TSSIMUnlockDetailViewController *)self delegate];
          v15 = v14;
          id v16 = self;
          uint64_t v17 = 3;
LABEL_17:
          [v14 unlockDetailViewController:v16 didCompleteWithResult:v17];

          goto LABEL_18;
        }
        if ([v7 isEqualToString:kCTSIMSupportSIMStatusPermanentlyLocked])
        {
          v14 = [(TSSIMUnlockDetailViewController *)self delegate];
          v15 = v14;
          id v16 = self;
          uint64_t v17 = 6;
          goto LABEL_17;
        }
        if ([v7 isEqualToString:kCTSIMSupportSIMStatusReady])
        {
          v14 = [(TSSIMUnlockDetailViewController *)self delegate];
          v15 = v14;
          id v16 = self;
          uint64_t v17 = 0;
          goto LABEL_17;
        }
        if ((sub_1000044E4(v7) & 1) == 0)
        {
          v18 = sub_100010734();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 136315138;
            int64_t v20 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sim not locked anymore, action complete @%s", (uint8_t *)&v19, 0xCu);
          }

          v14 = [(TSSIMUnlockDetailViewController *)self delegate];
          v15 = v14;
          id v16 = self;
          uint64_t v17 = 1;
          goto LABEL_17;
        }
      }
    }
  }
LABEL_18:
}

- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1000107CC())
  {
    v8 = sub_100010734();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100012FDC();
    }
  }
  if ((id)[(TSSubscriptionAction *)self->_subscriptionAction actionType] == (id)2)
  {
    uint64_t v9 = [v6 uuid];
    int64_t v10 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext uuid];
    unsigned int v11 = [v9 isEqual:v10];

    if (v11)
    {
      if ([v7 isEqualToString:kCTSIMSupportSIMStatusPUKLocked])
      {
        id v12 = [(TSSIMUnlockDetailViewController *)self _entryView];
        [v12 resignFirstResponder];

        unsigned int v13 = [(TSSIMUnlockDetailViewController *)self delegate];
        [v13 unlockDetailViewController:self didCompleteWithResult:3];
      }
      else if ([v7 isEqualToString:kCTSIMSupportSIMStatusPINLocked])
      {
        objc_initWeak(&location, self);
        dispatch_time_t v14 = dispatch_time(0, 500000000);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000056E4;
        v15[3] = &unk_1000206A8;
        objc_copyWeak(&v16, &location);
        dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1000107CC())
  {
    v8 = sub_100010734();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100013064();
    }
  }
  if ((id)[(TSSubscriptionAction *)self->_subscriptionAction actionSubtype] == (id)3)
  {
    uint64_t v9 = [v6 uuid];
    int64_t v10 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext uuid];
    unsigned int v11 = [v9 isEqual:v10];

    if (v11)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v12 = dispatch_time(0, 500000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005A3C;
      v13[3] = &unk_1000206D0;
      objc_copyWeak(&v16, &location);
      id v14 = v7;
      v15 = self;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_cancelButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained unlockDetailViewController:self didCompleteWithResult:2];
}

- (id)_entryView
{
  v2 = [(TSSIMUnlockDetailViewController *)self _detailView];
  unsigned __int8 v3 = [v2 entryView];

  return v3;
}

- (BOOL)_appearingOrAppeared
{
  unsigned int v3 = [(TSSIMUnlockDetailViewController *)self _appearState];
  if (v3 != 1) {
    LOBYTE(v3) = [(TSSIMUnlockDetailViewController *)self _appearState] == 2;
  }
  return v3;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (TSSubscriptionAction)subscriptionAction
{
  return self->_subscriptionAction;
}

- (NSString)lockedSIMName
{
  return self->_lockedSIMName;
}

- (TSSIMUnlockDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSSIMUnlockDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lockedSIMName, 0);
  objc_storeStrong((id *)&self->_subscriptionAction, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);

  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end