id sub_100004438()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t vars8;

  v0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  v1 = [v0 fontDescriptorWithSymbolicTraits:2];

  v2 = +[UIFont fontWithDescriptor:v1 size:0.0];

  return v2;
}

double sub_1000044BC()
{
  return 0.0;
}

double sub_1000044D0()
{
  return 5.0;
}

uint64_t sub_1000044E4(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:kCTSIMSupportSIMStatusPINLocked] & 1) != 0
    || ([v1 isEqualToString:kCTSIMSupportSIMStatusPUKLocked] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:kCTSIMSupportSIMStatusPermanentlyLocked];
  }

  return v2;
}

void sub_100004B54(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 _entryView];
  id v4 = [v3 unsignedIntegerValue];

  [v5 setAttemptsRemaining:v4];
}

void sub_100004BC4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 _entryView];
  id v4 = [v3 unsignedIntegerValue];

  [v5 setAttemptsRemaining:v4];
}

void sub_1000056E4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[2];
    uint64_t v4 = v2[3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005784;
    v5[3] = &unk_100020680;
    v5[4] = v2;
    [v3 getRemainingPINAttemptCount:v4 completion:v5];
  }
}

void sub_100005784(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 unsignedIntegerValue])
  {
    uint64_t v4 = [*(id *)(a1 + 32) _detailView];
    [v4 setUnlocking:0];

    id v5 = [*(id *)(a1 + 32) _entryView];
    [v5 setAttemptsRemaining:[v3 unsignedIntegerValue]];

    v6 = [*(id *)(a1 + 32) _entryView];
    [v6 resetEnteredTextWithShakeAnimation:1];
  }
  else
  {
    v6 = sub_100010734();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[TSSIMUnlockDetailViewController simPinEntryErrorDidOccur:status:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "wait for sim status change @%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t sub_100005A3C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    if ([a1[4] isEqualToString:kCTSIMSupportSIMStatusPermanentlyLocked])
    {
      id v3 = [a1[5] _entryView];
      [v3 resignFirstResponder];

      uint64_t v4 = [v9 delegate];
      id v5 = v4;
      v6 = v9;
      uint64_t v7 = 6;
    }
    else
    {
      if (![a1[4] isEqualToString:kCTSIMSupportSIMStatusPUKLocked]) {
        goto LABEL_7;
      }
      uint64_t v4 = [v9 delegate];
      id v5 = v4;
      v6 = v9;
      uint64_t v7 = 5;
    }
    [v4 unlockDetailViewController:v6 didCompleteWithResult:v7];
  }
LABEL_7:

  return _objc_release_x1();
}

void sub_100005D08(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100005D9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_100006584(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
  if (sub_1000107CC())
  {
    uint64_t v2 = sub_100010734();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100013170(&state64, v2);
    }
  }
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 screenLockDidUpdate:state64 == 1];
}

int64_t sub_100006690(id a1, CTXPCServiceSubscriptionContext *a2, CTXPCServiceSubscriptionContext *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = [(CTXPCServiceSubscriptionContext *)v4 slotID];
  if ((uint64_t)v6 <= (uint64_t)[(CTXPCServiceSubscriptionContext *)v5 slotID])
  {
    id v8 = [(CTXPCServiceSubscriptionContext *)v4 slotID];
    if ((uint64_t)v8 >= (uint64_t)[(CTXPCServiceSubscriptionContext *)v5 slotID]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

void sub_100006E10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100006E38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentUnlockViewController];
    id WeakRetained = v2;
  }
}

void sub_100006E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = sub_100010734();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100013218((uint64_t)v3, v5);
  }

  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [v3 subscriptions];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v11 isSimHidden] & 1) == 0)
          {
            v12 = [*((id *)WeakRetained + 4) getSIMStatus:v11 error:0];
            [WeakRetained _queue_processSubscriptionContext:v11 withSubscriptionSIMStatus:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 3));
  }
}

unsigned char *sub_10000708C(uint64_t a1, void *a2)
{
  result = [a2 events];
  if ((result & 0x10) != 0)
  {
    result = *(unsigned char **)(a1 + 32);
    if (!result[8])
    {
      return [result _dismissUnlockViewControllerAndDeactivate];
    }
  }
  return result;
}

id sub_1000072EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentUnlockViewController];
}

void sub_1000075C8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[6] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v5 = *(void **)(a1 + 40);
    id v6 = [v4 carrierName];
    LOBYTE(v5) = [v5 isEqualToString:v6];

    if ((v5 & 1) == 0)
    {
      [v4 setCarrierName:*(void *)(a1 + 40)];
      id v7 = sub_100010734();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v4 carrierName];
        int v9 = 138412546;
        uint64_t v10 = v8;
        __int16 v11 = 2080;
        v12 = "-[TSSIMUnlockViewController carrierBundleChange:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "update carrier name (%@) @%s", (uint8_t *)&v9, 0x16u);
      }
      [v3 _applySubscriptionContext:*(void *)(a1 + 48) withSubscriptionAction:v4];
    }
  }
}

void sub_1000078C0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[6] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v5 = *(void **)(a1 + 40);
    id v6 = [v4 phoneNumber];
    LOBYTE(v5) = [v5 isEqualToString:v6];

    if ((v5 & 1) == 0)
    {
      [v4 setPhoneNumber:*(void *)(a1 + 40)];
      id v7 = sub_100010734();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v4 phoneNumber];
        int v9 = 138412546;
        uint64_t v10 = v8;
        __int16 v11 = 2080;
        v12 = "-[TSSIMUnlockViewController phoneNumberChanged:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "update phone number (%@) @%s", (uint8_t *)&v9, 0x16u);
      }
      [v3 _applySubscriptionContext:*(void *)(a1 + 48) withSubscriptionAction:v4];
    }
  }
}

void sub_100007CE8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[2] && (v3 = [*(id *)(a1 + 40) slotID], id v2 = *(void **)(a1 + 32), v3 != (id)v2[2]))
  {
    id v6 = sub_100010734();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CTSubscriptionSlotAsString();
      [*(id *)(a1 + 40) slotID];
      int v8 = 136315650;
      uint64_t v9 = v7;
      __int16 v10 = 2080;
      uint64_t v11 = CTSubscriptionSlotAsString();
      __int16 v12 = 2080;
      long long v13 = "-[TSSIMUnlockViewController _queue_processSubscriptionContext:withSubscriptionSIMStatus:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "user selected slot %s, ignoring slot %s @%s", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v2 _applySubscriptionContext:v4 withSubscriptionAction:v5];
  }
}

id sub_100008648(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) SIMUnlockProcedureDidComplete];
  id v2 = *(void **)(a1 + 32);

  return [v2 _deactivate];
}

id sub_100008738(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

void sub_100008864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000887C(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v7 = [a2 uuid];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_100008A18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFStringRef sub_10000A36C(unint64_t a1)
{
  if (a1 > 4) {
    return @"???";
  }
  else {
    return *(&off_100020848 + a1);
  }
}

CFStringRef sub_10000A390(unint64_t a1)
{
  if (a1 > 3) {
    return @"???";
  }
  else {
    return *(&off_100020870 + a1);
  }
}

void sub_10000C7E4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v15 = objc_alloc_init((Class)UILabel);
  [v15 setText:v4];

  uint64_t v5 = +[UIColor systemGrayColor];
  [v15 setTextColor:v5];

  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v15 setFont:v6];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 sizeToFit];
  [v3 addSubview:v15];
  uint64_t v7 = [v15 trailingAnchor];
  unsigned int v8 = [v3 layoutMarginsGuide];
  uint64_t v9 = [v8 trailingAnchor];
  __int16 v10 = [v7 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  uint64_t v11 = [v15 centerYAnchor];
  __int16 v12 = [v3 layoutMarginsGuide];

  long long v13 = [v12 centerYAnchor];
  long long v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = UIApplicationMain(a1, a2, 0, 0);
  return v5;
}

void sub_10000DDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000DE18(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v5 = [WeakRetained presentProxCardFlowWithDelegate:WeakRetained initialViewController:v3];
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 setPkNavigationController:v5];
  }
  else
  {
    uint64_t v7 = sub_100010734();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000138CC((uint64_t)v3, v7);
    }

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 simSetupFlowCompleted:1];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

id sub_10000DF84(uint64_t a1, void *a2)
{
  id result = [a2 events];
  if ((result & 0x11) != 0)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000E018;
    v5[3] = &unk_1000207B0;
    v5[4] = v4;
    return [v4 dismissViewControllerWithTransition:3 completion:v5];
  }
  return result;
}

id sub_10000E018(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

id sub_10000E0E8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

id sub_10000E518(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

void sub_10000EE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EE1C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[8] setFrame:*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

void sub_10001014C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010188(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v3 = (id *)(a1 + 32);
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _handleLayoutUpdate:v4];
  }
}

id sub_100010734()
{
  if (qword_10002B8A0 != -1) {
    dispatch_once(&qword_10002B8A0, &stru_100020958);
  }
  v0 = (void *)qword_10002B898;

  return v0;
}

void sub_100010788(id a1)
{
  qword_10002B898 = (uint64_t)os_log_create("com.apple.SIMSetupUIService", "log");

  _objc_release_x1();
}

uint64_t sub_1000107CC()
{
  return _MGGetBoolAnswer(@"apple-internal-install");
}

void sub_1000110A0(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:TSNotificationUserCanceled object:TSNotificationUserCanceledReason_SwapOutEvent];
}

void sub_10001180C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100011844(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [WeakRetained presentProxCardFlowWithDelegate:WeakRetained initialViewController:v3];
      id v6 = WeakRetained[3];
      WeakRetained[3] = (id)v5;
    }
    else
    {
      uint64_t v7 = sub_100010734();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100013C68();
      }

      [WeakRetained simSetupFlowCompleted:1];
    }
    [WeakRetained[5] registerForLockNotifications];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001192C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [WeakRetained presentProxCardFlowWithDelegate:WeakRetained initialViewController:v3];
      id v6 = WeakRetained[3];
      WeakRetained[3] = (id)v5;
    }
    else
    {
      uint64_t v7 = sub_100010734();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100013C68();
      }

      [WeakRetained simSetupFlowCompleted:1];
    }
    [WeakRetained[5] registerForLockNotifications];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100011A14(uint64_t a1)
{
  return [*(id *)(a1 + 32) simSetupFlowCompleted:2];
}

uint64_t sub_100011A20(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _presentFirstController:a2 isRemoteSignup:0];
  }
  else
  {
    id v3 = sub_100010734();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100013CE8(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    [*(id *)(a1 + 32) _deactivate];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100011B14(uint64_t a1, void *a2)
{
  id result = [a2 events];
  if ((result & 0x10) != 0)
  {
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:TSNotificationUserCanceled object:TSNotificationUserCanceledReason_HomeButtonEvent];

    uint64_t v5 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011BD4;
    v6[3] = &unk_1000207B0;
    v6[4] = v5;
    return [v5 dismissViewControllerWithTransition:3 completion:v6];
  }
  return result;
}

id sub_100011BD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

id sub_100011C94(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

id sub_100011E78(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

void sub_100012214(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];

  [v4 setModalPresentationStyle:2];
  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

id sub_100012518(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];

  id v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

Class sub_1000126BC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10002B8B0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100012800;
    v3[4] = &unk_100020A48;
    v3[5] = v3;
    long long v4 = off_100020A30;
    uint64_t v5 = 0;
    qword_10002B8B0 = _sl_dlopen();
    if (!qword_10002B8B0)
    {
      abort_report_np();
LABEL_8:
      sub_100013E88();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LAContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10002B8A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100012800()
{
  uint64_t result = _sl_dlopen();
  qword_10002B8B0 = result;
  return result;
}

void sub_100012C04()
{
  sub_100005D90();
  [v1 slotID];
  CTSubscriptionSlotAsString();
  id v2 = sub_10000A36C((unint64_t)[v0 actionType]);
  sub_100005D50();
  sub_100005D08((void *)&_mh_execute_header, v3, v4, "[Db] initWithSubscriptionContext, context %s, action %@ @%s", v5, v6, v7, v8, v9);
}

void sub_100012CB0()
{
  sub_100005D90();
  [v1 slotID];
  CTSubscriptionSlotAsString();
  id v2 = sub_10000A36C((unint64_t)[v0 actionType]);
  sub_100005D50();
  sub_100005D08((void *)&_mh_execute_header, v3, v4, "[Db] initWithSubscriptionContext, context %s, action %@ @%s", v5, v6, v7, v8, v9);
}

void sub_100012D5C(os_log_t log)
{
  int v1 = 136315394;
  id v2 = "-[TSSIMUnlockDetailViewController loadView]";
  __int16 v3 = 2080;
  uint64_t v4 = "-[TSSIMUnlockDetailViewController loadView]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db] %s @%s", (uint8_t *)&v1, 0x16u);
}

void sub_100012DEC(uint64_t a1)
{
  int v1 = sub_10000A36C((unint64_t)[*(id *)(a1 + 32) actionType]);
  sub_100005D70();
  sub_100005D08((void *)&_mh_execute_header, v2, v3, "[Db] %s, action %@ @%s", v4, v5, v6, v7, 2u);
}

void sub_100012E8C(void *a1, NSObject *a2)
{
  uint64_t v3 = sub_10000A390((unint64_t)[a1 actionSubtype]);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = "-[TSSIMUnlockDetailViewController entryView:didEnterText:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] action sub type %@ @%s", (uint8_t *)&v4, 0x16u);
}

void sub_100012F3C(uint64_t a1)
{
  int v1 = sub_10000A36C((unint64_t)[*(id *)(a1 + 32) actionType]);
  sub_100005D70();
  sub_100005D08((void *)&_mh_execute_header, v2, v3, "[Db] %s, action %@ @%s", v4, v5, v6, v7, 2u);
}

void sub_100012FDC()
{
  sub_100005D90();
  [v0 slotID];
  CTSubscriptionSlotAsString();
  sub_100005D28();
  sub_100005D9C((void *)&_mh_execute_header, v1, v2, "[Db] %s: context %s, status %@ @%s", v3, v4, v5, v6, 2u);
}

void sub_100013064()
{
  sub_100005D90();
  [v0 slotID];
  CTSubscriptionSlotAsString();
  sub_100005D28();
  sub_100005D9C((void *)&_mh_execute_header, v1, v2, "[Db] %s: context %s, status %@ @%s", v3, v4, v5, v6, 2u);
}

void sub_1000130EC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[TSScreenLockObserver registerForLockNotifications]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]unable to register @%s", (uint8_t *)&v1, 0xCu);
}

void sub_100013170(void *a1, NSObject *a2)
{
  uint64_t v2 = "";
  if (!*a1) {
    uint64_t v2 = "un";
  }
  int v3 = 136315394;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  uint64_t v6 = "-[TSScreenLockObserver registerForLockNotifications]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] lockHandler: Screne %slocked @%s", (uint8_t *)&v3, 0x16u);
}

void sub_100013218(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  __int16 v5 = "-[TSSIMUnlockViewController prepareForActivationWithContext:completion:]_block_invoke_2";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] subscription info: %@ @%s", (uint8_t *)&v2, 0x16u);
}

void sub_1000132A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001331C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013394(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001340C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013484(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 slotID];
  int v5 = 136315650;
  uint64_t v6 = CTSubscriptionSlotAsString();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = "-[TSSIMUnlockViewController _queue_processSubscriptionContext:withSubscriptionSIMStatus:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[Db] context %s, status %@ @%s", (uint8_t *)&v5, 0x20u);
}

void sub_100013538(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TSSIMUnlockViewController _deactivate]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db]  @%s", (uint8_t *)&v1, 0xCu);
}

void sub_1000135BC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TSSIMUnlockListViewController initWithSubscriptionContexts:subscriptionActions:suppressCancellation:delegate:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db] initWithSubscriptionContexts @%s", (uint8_t *)&v1, 0xCu);
}

void sub_100013640()
{
  v1[0] = 136315650;
  sub_10000C98C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[Db] %s: result %ld @%s", (uint8_t *)v1, 0x20u);
}

void sub_1000136C0()
{
  v1[0] = 136315650;
  sub_10000C98C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[Db] %s: index %ld @%s", (uint8_t *)v1, 0x20u);
}

void sub_100013740(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TSDeviceInfoViewController tableView:cellForRowAtIndexPath:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]Barcode length > view width! @%s", (uint8_t *)&v1, 0xCu);
}

void sub_1000137C4(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TSProximitySIMTransferViewController configureWithContext:completion:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]decode CBDevice failed @%s", (uint8_t *)&v1, 0xCu);
}

void sub_100013848(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[TSProximitySIMTransferViewController configureWithContext:completion:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]missing device @%s", (uint8_t *)&v1, 0xCu);
}

void sub_1000138CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[TSProximitySIMTransferViewController prepareForActivationWithContext:completion:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[E]unexpected view controller:%@ @%s", (uint8_t *)&v2, 0x16u);
}

void sub_100013958(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[TSProximitySIMTransferViewController simSetupFlowCompleted:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int16 v7 = "-[TSProximitySIMTransferViewController simSetupFlowCompleted:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] %s with completionType:%ld @%s", (uint8_t *)&v2, 0x20u);
}

void sub_1000139F0(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[SSRemoteAlertMonitor initWithBundleID:dismissHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]invalid dismiss handler @%s", (uint8_t *)&v1, 0xCu);
}

void sub_100013A74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[SSRemoteAlertMonitor initWithBundleID:dismissHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[E]invalid bundle id. try main bundle %@ @%s", (uint8_t *)&v2, 0x16u);
}

void sub_100013B00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013B78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013BF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013C68()
{
  sub_100012874();
  int v2 = "-[TSSIMSetupSupportViewController prepareForActivationWithContext:completion:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[E]unexpected view controller:%@ @%s", v1, 0x16u);
}

void sub_100013CE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013D60(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[TSSIMSetupSupportViewController simSetupFlowCompleted:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int16 v7 = "-[TSSIMSetupSupportViewController simSetupFlowCompleted:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] %s with completionType:%ld @%s", (uint8_t *)&v2, 0x20u);
}

void sub_100013DF8(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "-[TSSIMSetupSupportViewController userDidTapCancel]";
  __int16 v3 = 2080;
  __int16 v4 = "-[TSSIMSetupSupportViewController userDidTapCancel]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db] %s @%s", (uint8_t *)&v1, 0x16u);
}

void sub_100013E88()
{
}

uint64_t BPSApplyStyleToNavBar()
{
  return _BPSApplyStyleToNavBar();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t CTSubscriptionSlotAsString()
{
  return _CTSubscriptionSlotAsString();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t ct_green_tea_logger_create()
{
  return _ct_green_tea_logger_create();
}

uint64_t ct_green_tea_logger_destroy()
{
  return _ct_green_tea_logger_destroy();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_SIMUnlockProcedureDidComplete(void *a1, const char *a2, ...)
{
  return [a1 SIMUnlockProcedureDidComplete];
}

id objc_msgSend__anESIMExistsInSubscriptionContexts(void *a1, const char *a2, ...)
{
  return [a1 _anESIMExistsInSubscriptionContexts];
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return [a1 _appearState];
}

id objc_msgSend__appearingOrAppeared(void *a1, const char *a2, ...)
{
  return [a1 _appearingOrAppeared];
}

id objc_msgSend__calculateEntryViewFrame(void *a1, const char *a2, ...)
{
  return [a1 _calculateEntryViewFrame];
}

id objc_msgSend__configureAncillaryViews(void *a1, const char *a2, ...)
{
  return [a1 _configureAncillaryViews];
}

id objc_msgSend__configureDescriptionLabelText(void *a1, const char *a2, ...)
{
  return [a1 _configureDescriptionLabelText];
}

id objc_msgSend__configureDetailLabelText(void *a1, const char *a2, ...)
{
  return [a1 _configureDetailLabelText];
}

id objc_msgSend__configureHeaderView(void *a1, const char *a2, ...)
{
  return [a1 _configureHeaderView];
}

id objc_msgSend__configureLabels(void *a1, const char *a2, ...)
{
  return [a1 _configureLabels];
}

id objc_msgSend__configureNavigationItem(void *a1, const char *a2, ...)
{
  return [a1 _configureNavigationItem];
}

id objc_msgSend__configureTableFooterView(void *a1, const char *a2, ...)
{
  return [a1 _configureTableFooterView];
}

id objc_msgSend__configureTitleLabelText(void *a1, const char *a2, ...)
{
  return [a1 _configureTitleLabelText];
}

id objc_msgSend__containerView(void *a1, const char *a2, ...)
{
  return [a1 _containerView];
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return [a1 _deactivate];
}

id objc_msgSend__detailView(void *a1, const char *a2, ...)
{
  return [a1 _detailView];
}

id objc_msgSend__dismissUnlockViewControllerAndDeactivate(void *a1, const char *a2, ...)
{
  return [a1 _dismissUnlockViewControllerAndDeactivate];
}

id objc_msgSend__doTwoEsimsExist(void *a1, const char *a2, ...)
{
  return [a1 _doTwoEsimsExist];
}

id objc_msgSend__doesPhysicalSimExist(void *a1, const char *a2, ...)
{
  return [a1 _doesPhysicalSimExist];
}

id objc_msgSend__entryView(void *a1, const char *a2, ...)
{
  return [a1 _entryView];
}

id objc_msgSend__numberOfLockedSubscriptionContexts(void *a1, const char *a2, ...)
{
  return [a1 _numberOfLockedSubscriptionContexts];
}

id objc_msgSend__presentDeviceInfoViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentDeviceInfoViewController];
}

id objc_msgSend__presentPolicyRejectionViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentPolicyRejectionViewController];
}

id objc_msgSend__presentUnlockViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentUnlockViewController];
}

id objc_msgSend__presentedUnlockViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentedUnlockViewController];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving];
}

id objc_msgSend_actionSubtype(void *a1, const char *a2, ...)
{
  return [a1 actionSubtype];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return [a1 actionType];
}

id objc_msgSend_activeInstance(void *a1, const char *a2, ...)
{
  return [a1 activeInstance];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 canBecomeFirstResponder];
}

id objc_msgSend_canResignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 canResignFirstResponder];
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return [a1 carrierName];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultContentConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didSetup(void *a1, const char *a2, ...)
{
  return [a1 didSetup];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_displayPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 displayPhoneNumber];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_enteredText(void *a1, const char *a2, ...)
{
  return [a1 enteredText];
}

id objc_msgSend_entryView(void *a1, const char *a2, ...)
{
  return [a1 entryView];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return [a1 externalizedContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstViewController(void *a1, const char *a2, ...)
{
  return [a1 firstViewController];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hardwareType(void *a1, const char *a2, ...)
{
  return [a1 hardwareType];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return [a1 homeButtonType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_inBuddy(void *a1, const char *a2, ...)
{
  return [a1 inBuddy];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 isFirstResponder];
}

id objc_msgSend_isOnScreen(void *a1, const char *a2, ...)
{
  return [a1 isOnScreen];
}

id objc_msgSend_isPad(void *a1, const char *a2, ...)
{
  return [a1 isPad];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return [a1 isUIApplicationElement];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return [a1 outputImage];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_pin1(void *a1, const char *a2, ...)
{
  return [a1 pin1];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_puk(void *a1, const char *a2, ...)
{
  return [a1 puk];
}

id objc_msgSend_registerForLockNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLockNotifications];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return [a1 secondaryTextProperties];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return [a1 setDefaults];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_simLocation(void *a1, const char *a2, ...)
{
  return [a1 simLocation];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unregisterFromLockNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterFromLockNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userDidTapCancel(void *a1, const char *a2, ...)
{
  return [a1 userDidTapCancel];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_visiblePeripheralFrame(void *a1, const char *a2, ...)
{
  return [a1 visiblePeripheralFrame];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}