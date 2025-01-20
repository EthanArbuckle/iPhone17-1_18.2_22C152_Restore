id sub_4ECC(uint64_t a1, void *a2)
{
  return [a2 _updateLockoutState];
}

id sub_4ED4(uint64_t a1, void *a2)
{
  return [a2 _updateSimplePasscodeState];
}

id sub_4EDC(uint64_t a1, void *a2)
{
  return [a2 _updateUnlockState];
}

id sub_4EE4(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifierID:@"WRIST_DETECTION_CELL_ID"];
}

void sub_5208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5230(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeActivityFlag:2];
}

void sub_5374(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_5390(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5) {
    [WeakRetained _handleError:v5];
  }
  else {
    [WeakRetained _setGizmoState:v8];
  }
}

void sub_54D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_54EC(id *a1, void *a2)
{
  BOOL v3 = [a2 count] != 0;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setGizmoHasPaymentPasses:v3];

  id v5 = objc_loadWeakRetained(a1);
  [v5 _removeActivityFlag:8];
}

void sub_5634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_5650(id *a1, void *a2)
{
  BOOL v3 = [a2 count] != 0;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setGizmoHasCredentialedPasses:v3];

  id v5 = objc_loadWeakRetained(a1);
  [v5 _removeActivityFlag:64];
}

void sub_57F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_581C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = pu_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Paired unlock enabled=%{BOOL}u", (uint8_t *)v9, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDevicesArePairedForUnlocking:a2];

  if (v5) {
    [*(id *)(a1 + 32) _handleError:v5];
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 _removeActivityFlag:16];
}

void sub_5A18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_5A34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    id v8 = pu_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_ABB8((uint64_t)v6, v8);
    }
    id v9 = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isDefaultPairedDevice", (void)v14))
          {
            id v9 = [v12 unlockEnabled];
            v13 = pu_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v19 = (int)v9;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Gizmo unlocks phone enabled=%{BOOL}u", buf, 8u);
            }

            goto LABEL_17;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
LABEL_17:

  [WeakRetained setGizmoUnlocksPhone:v9];
}

void sub_5E90(uint64_t a1)
{
  id v2 = objc_alloc((Class)UIAlertView);
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:*(void *)(a1 + 40) value:&stru_107E8 table:@"PasscodeSettings"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BUSY_TEXT" value:&stru_107E8 table:@"PasscodeSettings"];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"BUSY_OK_BUTTON" value:&stru_107E8 table:@"PasscodeSettings"];
  id v9 = [v2 initWithTitle:v4 message:v6 delegate:0 cancelButtonTitle:v8 otherButtonTitles:0];

  [v9 show];
}

id sub_6000(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUnknownError];
}

uint64_t sub_6138()
{
  return BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
}

void sub_61B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = [v2 popViewControllerAnimated:1];
}

void sub_6200(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_6288;
  v2[3] = &unk_10528;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_6288(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transitionCoordinator];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) transitionCoordinator];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6370;
    v5[3] = &unk_10500;
    id v6 = *(id *)(a1 + 40);
    [v3 animateAlongsideTransition:0 completion:v5];
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t sub_6370(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_63F4(uint64_t a1)
{
  id v2 = objc_alloc((Class)UIAlertView);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ALERT_NEED_UNLOCK_TITLE" value:&stru_107E8 table:@"PasscodeSettings"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ALERT_NEED_UNLOCK_TEXT" value:&stru_107E8 table:@"PasscodeSettings"];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ALERT_NEED_UNLOCK_CANCEL" value:&stru_107E8 table:@"PasscodeSettings"];
  id v10 = [v2 initWithTitle:v4 message:v6 delegate:v7 cancelButtonTitle:v9 otherButtonTitles:0];

  [v10 setDelegate:*(void *)(a1 + 32)];
  [v10 show];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 184);
  *(void *)(v11 + 184) = v10;
}

id sub_6858(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 228) = CFPreferencesGetAppBooleanValue(@"InLockout", @"com.apple.Carousel", 0) != 0;
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

unsigned __int8 *sub_6990(unsigned __int8 *result)
{
  int v1 = result[40];
  uint64_t v2 = *((void *)result + 4);
  if (v1 != *(unsigned __int8 *)(v2 + 208))
  {
    *(unsigned char *)(v2 + 208) = v1;
    return (unsigned __int8 *)[*((id *)result + 4) reloadSpecifiers];
  }
  return result;
}

void sub_6F4C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 248), v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  switch(*(void *)(v3 + 192))
  {
    case 1:
      if (!*(void *)(a1 + 32))
      {
        v4 = *(void **)(v3 + 248);
        [v4 setPasscodeSet:1];
      }
      break;
    case 2:
      if (!*(void *)(a1 + 32))
      {
        id v5 = *(void **)(v3 + 248);
        [v5 setUnlockOnly:0];
      }
      break;
    case 3:
      if (!*(void *)(a1 + 32))
      {
        [*(id *)(v3 + 248) setPasscodeSet:0];
        [*(id *)(*(void *)(a1 + 40) + 248) setUnlockOnly:0];
        uint64_t v3 = *(void *)(a1 + 40);
      }
      *(unsigned char *)(v3 + 226) = 0;
      break;
    case 4:
      *(unsigned char *)(v3 + 226) = 1;
      break;
    default:
      return;
  }
}

id sub_708C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 209) = 0;
  return [*(id *)(a1 + 32) _finishRemoteAction:*(unsigned __int8 *)(a1 + 40)];
}

void sub_7144(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isPasscodeLocked] & 1) == 0)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 184);
    if (v2) {
      [v2 dismissWithClickedButtonIndex:-1 animated:1];
    }
  }
  if (([*(id *)(a1 + 32) isPasscodeLocked] & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 40) + 228) = 0;
  }
  if (([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 248)] & 1) == 0)
  {
    uint64_t v3 = pu_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Received new gizmo state: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 248), *(id *)(a1 + 32));
    [*(id *)(a1 + 40) reloadSpecifiers];
  }
  if (([*(id *)(a1 + 32) isPasscodeLocked] & 1) == 0)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 256);
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v6 + 256);
      *(void *)(v6 + 256) = 0;
    }
  }
}

void sub_80A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_80C4(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v5);
    int v8 = v7;
    if (a2)
    {
      [v7 setGizmoIsInLockout:0];
      [v8 reloadSpecifiers];
    }
    else
    {
      [v7 _handleError:v9];
    }
  }
}

void sub_94B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_94D0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_15668;
  uint64_t v7 = qword_15668;
  if (!qword_15668)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_A10C;
    v3[3] = &unk_105C8;
    v3[4] = &v4;
    sub_A10C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_959C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9E90(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  if (v2[58])
  {
    id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v3 startAnimating];
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v3];

    uint64_t v2 = *(_DWORD **)(a1 + 32);
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v4 = [v2 navigationItem];
  [v4 setRightBarButtonItem:v5];

  [*(id *)(a1 + 32) reloadSpecifiers];
}

Class sub_A10C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_15670)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_A250;
    v3[4] = &unk_10600;
    void v3[5] = v3;
    long long v4 = off_105E8;
    uint64_t v5 = 0;
    qword_15670 = _sl_dlopen();
    if (!qword_15670)
    {
      abort_report_np();
LABEL_8:
      sub_AC98();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SOSUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_15668 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_A250()
{
  uint64_t result = _sl_dlopen();
  qword_15670 = result;
  return result;
}

void *sub_A2C4(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_15680)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_A404;
    void v5[4] = &unk_10600;
    v5[5] = v5;
    long long v6 = off_10620;
    uint64_t v7 = 0;
    qword_15680 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_15680;
    if (qword_15680)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_15680;
LABEL_5:
  uint64_t result = dlsym(v2, "HKFeatureFlagBloodOxygenSaturationEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_15678 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_A404()
{
  uint64_t result = _sl_dlopen();
  qword_15680 = result;
  return result;
}

void sub_ABB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to determine if gizmo can unlock phone, error %@", (uint8_t *)&v2, 0xCu);
}

void sub_AC30(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Note that isUnlockOnly is enabled. This likely means an alphanumeric passcode is being used.", v1, 2u);
}

void sub_AC74()
{
}

void sub_AC98()
{
}

uint64_t BPSApplyStyleToNavBar()
{
  return _BPSApplyStyleToNavBar();
}

uint64_t BPSBackgroundColor()
{
  return _BPSBackgroundColor();
}

uint64_t BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler()
{
  return _BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t MKBDeviceLockAssertion()
{
  return _MKBDeviceLockAssertion();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t PURemoteActionToString()
{
  return _PURemoteActionToString();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pu_log()
{
  return _pu_log();
}

id objc_msgSend__checkGizmoLockState(void *a1, const char *a2, ...)
{
  return [a1 _checkGizmoLockState];
}

id objc_msgSend__checkHasCredentialedPasses(void *a1, const char *a2, ...)
{
  return [a1 _checkHasCredentialedPasses];
}

id objc_msgSend__checkHasPaymentPasses(void *a1, const char *a2, ...)
{
  return [a1 _checkHasPaymentPasses];
}

id objc_msgSend__endLockoutAvailable(void *a1, const char *a2, ...)
{
  return [a1 _endLockoutAvailable];
}

id objc_msgSend__gizmoHardwareSupportsSEP(void *a1, const char *a2, ...)
{
  return [a1 _gizmoHardwareSupportsSEP];
}

id objc_msgSend__gizmoSupportEnvironmentalDosimetry(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportEnvironmentalDosimetry];
}

id objc_msgSend__gizmoSupportEucalyptus(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportEucalyptus];
}

id objc_msgSend__gizmoSupportHeartRateAlert(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportHeartRateAlert];
}

id objc_msgSend__gizmoSupportPasscodePolicySync(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportPasscodePolicySync];
}

id objc_msgSend__gizmoSupportWatchGestures(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportWatchGestures];
}

id objc_msgSend__gizmoSupportsKappaDetection(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportsKappaDetection];
}

id objc_msgSend__gizmoSupportsRespiratoryRate(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportsRespiratoryRate];
}

id objc_msgSend__gizmoSupportsSEPWristDetectSetting(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportsSEPWristDetectSetting];
}

id objc_msgSend__gizmoSupportsScandium(void *a1, const char *a2, ...)
{
  return [a1 _gizmoSupportsScandium];
}

id objc_msgSend__passcodeMinimumLength(void *a1, const char *a2, ...)
{
  return [a1 _passcodeMinimumLength];
}

id objc_msgSend__passcodeModificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 _passcodeModificationAllowed];
}

id objc_msgSend__promptForGizmoUnlock(void *a1, const char *a2, ...)
{
  return [a1 _promptForGizmoUnlock];
}

id objc_msgSend__resetSimplePasscodeChangeIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _resetSimplePasscodeChangeIfNeeded];
}

id objc_msgSend__showWristDetectDisableConfirmation(void *a1, const char *a2, ...)
{
  return [a1 _showWristDetectDisableConfirmation];
}

id objc_msgSend__updateLockoutState(void *a1, const char *a2, ...)
{
  return [a1 _updateLockoutState];
}

id objc_msgSend__updateSimplePasscodeState(void *a1, const char *a2, ...)
{
  return [a1 _updateSimplePasscodeState];
}

id objc_msgSend__updateUnlockPhoneEnabled(void *a1, const char *a2, ...)
{
  return [a1 _updateUnlockPhoneEnabled];
}

id objc_msgSend__updateUnlockState(void *a1, const char *a2, ...)
{
  return [a1 _updateUnlockState];
}

id objc_msgSend_activityFlags(void *a1, const char *a2, ...)
{
  return [a1 activityFlags];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crashDetectionWristDetectionWarningDescription(void *a1, const char *a2, ...)
{
  return [a1 crashDetectionWristDetectionWarningDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getDevices(void *a1, const char *a2, ...)
{
  return [a1 getDevices];
}

id objc_msgSend_gizmoIsInLockout(void *a1, const char *a2, ...)
{
  return [a1 gizmoIsInLockout];
}

id objc_msgSend_gizmoUnlocksPhone(void *a1, const char *a2, ...)
{
  return [a1 gizmoUnlocksPhone];
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 hasPasscodeSet];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isKappaDetectionSupportedOnActiveWatch(void *a1, const char *a2, ...)
{
  return [a1 isKappaDetectionSupportedOnActiveWatch];
}

id objc_msgSend_isModificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isModificationAllowed];
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeLocked];
}

id objc_msgSend_isPasscodeModificationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeModificationAllowed];
}

id objc_msgSend_isPasscodeRequired(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeRequired];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isUnlockOnly(void *a1, const char *a2, ...)
{
  return [a1 isUnlockOnly];
}

id objc_msgSend_isWristDetectEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWristDetectEnabled];
}

id objc_msgSend_kappaTriggersEmergencySOS(void *a1, const char *a2, ...)
{
  return [a1 kappaTriggersEmergencySOS];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
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

id objc_msgSend_newtonTriggersEmergencySOS(void *a1, const char *a2, ...)
{
  return [a1 newtonTriggersEmergencySOS];
}

id objc_msgSend_passcodeMinimumLength(void *a1, const char *a2, ...)
{
  return [a1 passcodeMinimumLength];
}

id objc_msgSend_passcodePolicy(void *a1, const char *a2, ...)
{
  return [a1 passcodePolicy];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_reloadUI(void *a1, const char *a2, ...)
{
  return [a1 reloadUI];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedUnlockManager(void *a1, const char *a2, ...)
{
  return [a1 sharedUnlockManager];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 transitionCoordinator];
}

id objc_msgSend_unlockEnabled(void *a1, const char *a2, ...)
{
  return [a1 unlockEnabled];
}

id objc_msgSend_unpairForUnlock(void *a1, const char *a2, ...)
{
  return [a1 unpairForUnlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}