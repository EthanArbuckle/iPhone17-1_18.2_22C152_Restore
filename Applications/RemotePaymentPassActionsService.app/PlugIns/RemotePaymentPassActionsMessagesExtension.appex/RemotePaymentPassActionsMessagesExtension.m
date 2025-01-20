void sub_100004180(id a1)
{
  uint64_t vars8;

  qword_10001A3B8 = objc_alloc_init(NPKRemotePassActionCompanionConversationManager);

  _objc_release_x1();
}

void sub_100004658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000467C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000468C(uint64_t a1)
{
}

uint64_t sub_100004694(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_1000047C4(void *a1)
{
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3) {
    [v2 setObject:v3 forKey:a1[6]];
  }
  else {
    [v2 removeObjectForKey:a1[6]];
  }
  v4 = pk_RemotePassAction_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[6];
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notice: Setting object %@ for identifier %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

id sub_100004DB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTap];
}

void sub_100008398(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a3;
  id v7 = a4;
  if (v7) {
    [*(id *)(a1 + 32) _presentAlertWithDisplayableError:v7];
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v8 = +[NPKRemotePassActionCompanionConversationManager sharedInstance];
    int v9 = [*(id *)(a1 + 40) response];
    uint64_t v10 = [v9 identifier];
    __int16 v11 = [v8 requestForIdentifier:v10];

    [*(id *)(a1 + 32) _restoreRequestDataURLForResponseMessage:*(void *)(a1 + 40) toMatchRequest:v11];
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v13);
  }
}

void sub_100008498(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 givenName];
  if ([*(id *)(a1 + 32) supportsTopUp])
  {
    v4 = *(void **)(a1 + 40);
    BOOL v5 = [*(id *)(a1 + 48) currencyAmount];
    v6 = [*(id *)(a1 + 48) passOrganizationName];
    id v7 = [*(id *)(a1 + 32) action];
    uint64_t v8 = [*(id *)(a1 + 48) passLocalizedDescription];
    int v9 = [v4 _serviceProviderPaymentRequestForEnteredValueAmount:v5 recipientName:v3 organization:v6 action:v7 forLocalizedPassName:v8];
  }
  else
  {
    if (![*(id *)(a1 + 32) supportsCommutePlanRenewal]) {
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    id v10 = *(id *)(a1 + 48);
    if (!v10) {
      goto LABEL_11;
    }
    BOOL v5 = v10;
    __int16 v11 = *(void **)(a1 + 40);
    v6 = [v10 serviceProviderData];
    id v7 = [*(id *)(a1 + 48) currencyAmount];
    uint64_t v8 = [*(id *)(a1 + 48) passOrganizationName];
    uint64_t v12 = [*(id *)(a1 + 32) action];
    id v13 = [*(id *)(a1 + 48) passLocalizedDescription];
    int v9 = [v11 _serviceProviderPaymentRequestForSelectedItemWithServiceProviderData:v6 amount:v7 recipientName:v3 organization:v8 action:v12 forLocalizedPassName:v13];
  }
  if (v9)
  {
    [*(id *)(a1 + 40) _presentPaymentSheetForPaymentRequest:v9 withCompletion:*(void *)(a1 + 56)];
LABEL_14:

    goto LABEL_15;
  }
LABEL_11:
  v14 = pk_RemotePassAction_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

  if (v15)
  {
    int v9 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 138412802;
      uint64_t v19 = 0;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: Failed to construct a payment request (%@) for response: %@ to request: %@!", (uint8_t *)&v18, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void sub_100008C28(id a1, UIViewController *a2, unint64_t a3, BOOL *a4)
{
  BOOL v5 = a2;
  [(UIViewController *)v5 willMoveToParentViewController:0];
  v4 = [(UIViewController *)v5 view];
  [v4 removeFromSuperview];

  [(UIViewController *)v5 removeFromParentViewController];
}

void sub_100009670(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 remotePassUIService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = nullsub_1;
  v7[3] = &unk_1000145B0;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  [v5 presentRemotePassValueEntryViewControllerForRequest:v6 contact:v4 completion:v7];
}

void sub_100009720(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 remotePassUIService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = nullsub_2;
  v7[3] = &unk_1000145B0;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  [v5 presentRemotePassItemSelectionViewControllerForRequest:v6 contact:v4 completion:v7];
}

void sub_1000097D0(id a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  v1 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  [v2 openSensitiveURL:v1 withOptions:0];
}

id *sub_100009A40(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] _presentAlertWithDisplayableError:a2];
  }
  return result;
}

id *sub_100009C50(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] _presentAlertWithDisplayableError:a2];
  }
  return result;
}

void sub_100009E8C(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_retainBlock(WeakRetained[4]);
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Authorization request for payment authorization coordinator: %@ did finish; _authorizationCoordinatorHandler: %@",
        (uint8_t *)&v10,
        0x16u);
    }
  }
  id v8 = WeakRetained[4];
  if (v8)
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, *((unsigned __int8 *)WeakRetained + 24), 0, 0);
    id v9 = WeakRetained[4];
    WeakRetained[4] = 0;
  }
  [*(id *)(a1 + 32) dismissWithCompletion:0];
}

void sub_10000A0C0(uint64_t a1)
{
  id v2 = pk_RemotePassAction_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = objc_retainBlock(*(id *)(a1 + 56));
      int v12 = 138412802;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Payment authorization coordinator: %@ did authorize payment %@ with handler: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, void, void, void))(v8 + 16))(v8, 0, 0, 0);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = 0;
  }
  id v11 = objc_alloc_init((Class)PKPaymentAuthorizationResult);
  [v11 setStatus:1];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10000A3B0(uint64_t a1)
{
  id v2 = pk_RemotePassAction_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = objc_retainBlock(*(id *)(a1 + 48));
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Payment authorization coordinator: %@ did authorize purchase %@ with completion: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = *(void *)(a1 + 40);
  WeakRetained[24] = v9 != 0;
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v9 == 0);
  }
}

void sub_10000AF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AFAC(uint64_t a1, int a2)
{
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    WeakRetained[24] = 0;
    id v3 = objc_retainBlock(*(id *)(a1 + 48));
    BOOL v4 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = v3;
  }
  else
  {
    uint64_t v5 = pk_RemotePassAction_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error: Device failed to present payment coordinator!", buf, 2u);
      }
    }
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 32) _genericErrorForAction:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);
  }
}

void sub_10000B81C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = pk_RemotePassAction_log();
  uint64_t v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = [v3 localizedDescription];
        int v16 = 138412802;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error: Unable to insert message: %@ for response: %@ with error: %@", (uint8_t *)&v16, 0x20u);
      }
    }
    [*(id *)(a1 + 48) _restoreRequestDataURLForResponseMessage:*(void *)(a1 + 32) toMatchRequest:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      uint64_t v12 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        int v16 = 138412546;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Successfully inserted message %@ with response %@!", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  uint64_t v15 = *(void *)(a1 + 64);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
}

void sub_10000BD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 64);
  BOOL v6 = pk_RemotePassAction_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (a3 || !v5)
  {
    if (v7)
    {
      uint64_t v12 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = 138412546;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Error alert with title: %@ message: %@ dismissed", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        int v15 = 138412802;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notice: Error alert with title: %@ message: %@ selected action (%@)", (uint8_t *)&v15, 0x20u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_10000BFDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t NPKDisplayableError()
{
  return _NPKDisplayableError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities()
{
  return _PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities();
}

uint64_t PKIsMac()
{
  return _PKIsMac();
}

uint64_t PKIsPad()
{
  return _PKIsPad();
}

uint64_t PKIsPhone()
{
  return _PKIsPhone();
}

uint64_t PKIsPod()
{
  return _PKIsPod();
}

uint64_t PKMessageForDisplayableError()
{
  return _PKMessageForDisplayableError();
}

uint64_t PKTitleForDisplayableError()
{
  return _PKTitleForDisplayableError();
}

uint64_t PKiMessageIsActive()
{
  return _PKiMessageIsActive();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NPKAssertAbort()
{
  return __NPKAssertAbort();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

uint64_t pk_General_log()
{
  return _pk_General_log();
}

uint64_t pk_RemotePassAction_log()
{
  return _pk_RemotePassAction_log();
}

id objc_msgSend__balloonMaskEdgeInsets(void *a1, const char *a2, ...)
{
  return [a1 _balloonMaskEdgeInsets];
}

id objc_msgSend__defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return [a1 _defaultParagraphStyle];
}

id objc_msgSend__makeHorizontalConstraints(void *a1, const char *a2, ...)
{
  return [a1 _makeHorizontalConstraints];
}

id objc_msgSend__makeRelativeConstraints(void *a1, const char *a2, ...)
{
  return [a1 _makeRelativeConstraints];
}

id objc_msgSend__makeVerticalConstraints(void *a1, const char *a2, ...)
{
  return [a1 _makeVerticalConstraints];
}

id objc_msgSend__primaryFont(void *a1, const char *a2, ...)
{
  return [a1 _primaryFont];
}

id objc_msgSend__removeAllChildViewControllers(void *a1, const char *a2, ...)
{
  return [a1 _removeAllChildViewControllers];
}

id objc_msgSend__requestResizeIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _requestResizeIfNeeded];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend__secondaryFont(void *a1, const char *a2, ...)
{
  return [a1 _secondaryFont];
}

id objc_msgSend__setUpActionButton(void *a1, const char *a2, ...)
{
  return [a1 _setUpActionButton];
}

id objc_msgSend__setUpAppearance(void *a1, const char *a2, ...)
{
  return [a1 _setUpAppearance];
}

id objc_msgSend__setUpCardArtImageView(void *a1, const char *a2, ...)
{
  return [a1 _setUpCardArtImageView];
}

id objc_msgSend__setUpConstraints(void *a1, const char *a2, ...)
{
  return [a1 _setUpConstraints];
}

id objc_msgSend__setUpDetailLabel(void *a1, const char *a2, ...)
{
  return [a1 _setUpDetailLabel];
}

id objc_msgSend__setUpLabelStackView(void *a1, const char *a2, ...)
{
  return [a1 _setUpLabelStackView];
}

id objc_msgSend__setUpSubviews(void *a1, const char *a2, ...)
{
  return [a1 _setUpSubviews];
}

id objc_msgSend__setUpTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 _setUpTapGestureRecognizer];
}

id objc_msgSend__setUpTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 _setUpTitleLabel];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return [a1 actionButton];
}

id objc_msgSend_actionButtonText(void *a1, const char *a2, ...)
{
  return [a1 actionButtonText];
}

id objc_msgSend_actionDescription(void *a1, const char *a2, ...)
{
  return [a1 actionDescription];
}

id objc_msgSend_actionText(void *a1, const char *a2, ...)
{
  return [a1 actionText];
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return [a1 activeConversation];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_availableFrom(void *a1, const char *a2, ...)
{
  return [a1 availableFrom];
}

id objc_msgSend_availableUntil(void *a1, const char *a2, ...)
{
  return [a1 availableUntil];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomContentStackView(void *a1, const char *a2, ...)
{
  return [a1 bottomContentStackView];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return [a1 caption];
}

id objc_msgSend_cardArtImage(void *a1, const char *a2, ...)
{
  return [a1 cardArtImage];
}

id objc_msgSend_cardArtImageView(void *a1, const char *a2, ...)
{
  return [a1 cardArtImageView];
}

id objc_msgSend_cardArtImageViewHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 cardArtImageViewHeightConstraint];
}

id objc_msgSend_cardType(void *a1, const char *a2, ...)
{
  return [a1 cardType];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_contactResolver(void *a1, const char *a2, ...)
{
  return [a1 contactResolver];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currency(void *a1, const char *a2, ...)
{
  return [a1 currency];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailLabel(void *a1, const char *a2, ...)
{
  return [a1 detailLabel];
}

id objc_msgSend_detailText(void *a1, const char *a2, ...)
{
  return [a1 detailText];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_enterValueRequest(void *a1, const char *a2, ...)
{
  return [a1 enterValueRequest];
}

id objc_msgSend_enteredValueItem(void *a1, const char *a2, ...)
{
  return [a1 enteredValueItem];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 filledButtonConfiguration];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return [a1 formattedStringValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 gestureRecognizers];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isResponse(void *a1, const char *a2, ...)
{
  return [a1 isResponse];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_labelStackView(void *a1, const char *a2, ...)
{
  return [a1 labelStackView];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_npkBaseAddress(void *a1, const char *a2, ...)
{
  return [a1 npkBaseAddress];
}

id objc_msgSend_passLocalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 passLocalizedDescription];
}

id objc_msgSend_passOrganizationName(void *a1, const char *a2, ...)
{
  return [a1 passOrganizationName];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return [a1 recipientAddresses];
}

id objc_msgSend_remotePassAction(void *a1, const char *a2, ...)
{
  return [a1 remotePassAction];
}

id objc_msgSend_remotePassUIService(void *a1, const char *a2, ...)
{
  return [a1 remotePassUIService];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestResize(void *a1, const char *a2, ...)
{
  return [a1 requestResize];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_selectItemRequest(void *a1, const char *a2, ...)
{
  return [a1 selectItemRequest];
}

id objc_msgSend_selectedActionItems(void *a1, const char *a2, ...)
{
  return [a1 selectedActionItems];
}

id objc_msgSend_selectedMessage(void *a1, const char *a2, ...)
{
  return [a1 selectedMessage];
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return [a1 senderAddress];
}

id objc_msgSend_serviceProviderAcceptedNetworks(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderAcceptedNetworks];
}

id objc_msgSend_serviceProviderCapabilities(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderCapabilities];
}

id objc_msgSend_serviceProviderCountryCode(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderCountryCode];
}

id objc_msgSend_serviceProviderData(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderData];
}

id objc_msgSend_serviceProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderIdentifier];
}

id objc_msgSend_serviceProviderSupportedCountries(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderSupportedCountries];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldDimPass(void *a1, const char *a2, ...)
{
  return [a1 shouldDimPass];
}

id objc_msgSend_showsActionButton(void *a1, const char *a2, ...)
{
  return [a1 showsActionButton];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_supportsCommutePlanRenewal(void *a1, const char *a2, ...)
{
  return [a1 supportsCommutePlanRenewal];
}

id objc_msgSend_supportsTopUp(void *a1, const char *a2, ...)
{
  return [a1 supportsTopUp];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_tapGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 tapGestureRecognizer];
}

id objc_msgSend_tertiarySystemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 tertiarySystemGroupedBackgroundColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unavailableActionBehavior(void *a1, const char *a2, ...)
{
  return [a1 unavailableActionBehavior];
}

id objc_msgSend_underlyingMessage(void *a1, const char *a2, ...)
{
  return [a1 underlyingMessage];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return [a1 viewModel];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}