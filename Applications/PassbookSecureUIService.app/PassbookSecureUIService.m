int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v7, v9);

  return (int)argv;
}

void sub_1000033C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000033E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000033FC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (PKPaymentTransactionShouldAuthenticateForMechanism())
    {
      v5 = [v7 authenticationContext];
      *((void *)WeakRetained + 5) = [v5 paymentPINFormat];

      objc_storeStrong((id *)WeakRetained + 4, a2);
      [*((id *)WeakRetained + 20) setDelegate:*(void *)(a1 + 32)];
    }
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

uint64_t sub_100003590(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) isViewLoaded]) {
    [*(id *)(a1 + 32) _transitionToState:2];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100003D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v18 - 104));
  _Unwind_Resume(a1);
}

void sub_100003D70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _footerButtonPressed];
}

void sub_1000045F0(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_1000046A0;
  v1[3] = &unk_10000C430;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[UIView pkui_animateUsingOptions:4 animations:v1 completion:0];
  objc_destroyWeak(&v2);
}

void sub_10000468C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000046A0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[12] setAlpha:1.0];
    id WeakRetained = v2;
  }
}

void sub_10000478C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    uint64_t v9 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    *(void *)(v8 + 32) = *(id *)(v9 + 8);
    goto LABEL_11;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    unsigned int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_10;
  }

LABEL_11:

  _objc_release_x1();
}

void sub_100004EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 104));
  _Unwind_Resume(a1);
}

void sub_100004EE8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PKAnalyticsSubjectSecureUIService;
    v4[0] = PKAnalyticsReportEventKey;
    v4[1] = PKAnalyticsReportButtonTagKey;
    v5[0] = PKAnalyticsReportEventTypeButtonTap;
    v5[1] = PKAnalyticsReportResetPaymentPINCancelButtonTag;
    v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
    +[PKAnalyticsReporter subject:v2 sendEvent:v3];

    [WeakRetained[23] becomeFirstResponder];
  }
}

void sub_100004FE4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = PKAnalyticsSubjectSecureUIService;
    v11[0] = PKAnalyticsReportEventKey;
    v11[1] = PKAnalyticsReportButtonTagKey;
    uint64_t v4 = *(void *)(a1 + 32);
    v12[0] = PKAnalyticsReportEventTypeButtonTap;
    v12[1] = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    +[PKAnalyticsReporter subject:v3 sendEvent:v5];

    [WeakRetained _transitionToState:1];
    id v6 = WeakRetained[21];
    if ([v6 isInstalled])
    {
      id v7 = WeakRetained[20];
      uint64_t v8 = [WeakRetained[2] uniqueID];
      uint64_t v9 = [v7 transactionsAppLaunchTokenForPassWithUniqueIdentifier:v8];

      id v10 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:WeakRetained[4] excludeTransactionIdentifier:1 pass:WeakRetained[2] pathSuffix:@"/resetPaymentCredential" appLaunchToken:v9];
    }
    else
    {
      id v10 = 0;
    }
    [v6 openApplication:*(void *)(a1 + 40) withLaunchOptions:1 launchURL:v10];
  }
}

id sub_10000523C(uint64_t a1)
{
  [*(id *)(a1 + 32) _encryptPasscodeInput];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _transitionToState:1];
}

void sub_100005550(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000556C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000564C;
  v6[3] = &unk_10000C4F8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [WeakRetained _encryptPIN:v5 withCertificates:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void sub_100005638(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000564C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 22);
    [v5 passcodeViewController:v4 didGenerateEncryptedPasscode:v6];
  }
}

void sub_1000057D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000057F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if (!v3)
  {
    id v8 = objc_loadWeakRetained(WeakRetained + 22);
    [v8 passcodeViewControllerDidEndSessionExchange:v5];

LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  id v6 = WeakRetained[20];
  uint64_t v7 = *(void *)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000593C;
  v9[3] = &unk_10000C548;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  [v6 retrievePINEncryptionCertificateForPassUniqueIdentifier:v7 sessionExchangeToken:v3 withCompletion:v9];

  objc_destroyWeak(&v11);
LABEL_6:
}

void sub_100005928(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000593C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 22);
    [v5 passcodeViewControllerDidEndSessionExchange:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005B24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100005B40(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if (!v3)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 22);
    [v6 passcodeViewControllerDidEndSessionExchange:v5];

LABEL_5:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_6;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005C9C;
  v7[3] = &unk_10000C598;
  objc_copyWeak(&v11, a1 + 7);
  id v10 = a1[6];
  id v8 = a1[4];
  id v9 = a1[5];
  +[PKSecureElement accessSecureElementManagerSessionWithSessionExchangeToken:v3 handler:v7];

  objc_destroyWeak(&v11);
LABEL_6:
}

void sub_100005C88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005C9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = PKEncryptTransactionAuthenticationPasscodeWithSession();
      id v6 = 0;
      if (v6)
      {
        uint64_t v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to encrypt PIN with error %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v5 = 0;
    }
    id v8 = objc_loadWeakRetained(WeakRetained + 22);
    [v8 passcodeViewControllerDidEndSessionExchange:WeakRetained];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000063B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000063CC(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000064E8;
      block[3] = &unk_10000C5E8;
      block[4] = WeakRetained;
      id v10 = *(id *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_9;
    }
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PIN view service failed to preflight collect passcode vc.", v8, 2u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
LABEL_9:
}

uint64_t sub_1000064E8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v5 = v2[1];
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];
  [v2 setViewControllers:v3 animated:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_100006670(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PKApplyDefaultIconToAlertController()
{
  return _PKApplyDefaultIconToAlertController();
}

uint64_t PKEncryptTransactionAuthenticationPasscodeWithSession()
{
  return _PKEncryptTransactionAuthenticationPasscodeWithSession();
}

uint64_t PKFloatRoundToPixel()
{
  return _PKFloatRoundToPixel();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPaymentTransactionShouldAuthenticateForMechanism()
{
  return _PKPaymentTransactionShouldAuthenticateForMechanism();
}

uint64_t PKSizeAspectFit()
{
  return _PKSizeAspectFit();
}

uint64_t PKUIGetMinScreenWidthType()
{
  return _PKUIGetMinScreenWidthType();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectCenteredAboutPoint()
{
  return _UIRectCenteredAboutPoint();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKFontForDefaultDesign(NSString *a1, NSString *a2)
{
  return PKFontForDefaultDesign(a1, a2);
}

uint64_t PKLocalizedAquamanString(NSString *a1)
{
  return PKLocalizedAquamanString(a1);
}

uint64_t PKLocalizedAquamanString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedAquamanString(a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__clearPasscodeField(void *a1, const char *a2, ...)
{
  return [a1 _clearPasscodeField];
}

id objc_msgSend__createPasscodeField(void *a1, const char *a2, ...)
{
  return [a1 _createPasscodeField];
}

id objc_msgSend__encryptPasscodeInput(void *a1, const char *a2, ...)
{
  return [a1 _encryptPasscodeInput];
}

id objc_msgSend__footerButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 _footerButtonPressed];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__isHostProcessEntitled(void *a1, const char *a2, ...)
{
  return [a1 _isHostProcessEntitled];
}

id objc_msgSend__passcodeInputFinished(void *a1, const char *a2, ...)
{
  return [a1 _passcodeInputFinished];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__updateFailureLabelVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateFailureLabelVisibility];
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return [a1 authenticationContext];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_compactBankLogoDarkImage(void *a1, const char *a2, ...)
{
  return [a1 compactBankLogoDarkImage];
}

id objc_msgSend_compactBankLogoLightImage(void *a1, const char *a2, ...)
{
  return [a1 compactBankLogoLightImage];
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return [a1 configureWithTransparentBackground];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_forceDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 forceDisplayIfNeeded];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return [a1 formattedStringValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageAsset(void *a1, const char *a2, ...)
{
  return [a1 imageAsset];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_merchant(void *a1, const char *a2, ...)
{
  return [a1 merchant];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_passcodeViewControllerDidCancel(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewControllerDidCancel];
}

id objc_msgSend_passcodeViewControllerDidEndSessionExchange(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewControllerDidEndSessionExchange];
}

id objc_msgSend_paymentPINFormat(void *a1, const char *a2, ...)
{
  return [a1 paymentPINFormat];
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return [a1 paymentPass];
}

id objc_msgSend_pinCode(void *a1, const char *a2, ...)
{
  return [a1 pinCode];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_reloadApplicationStateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 reloadApplicationStateIfNecessary];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}