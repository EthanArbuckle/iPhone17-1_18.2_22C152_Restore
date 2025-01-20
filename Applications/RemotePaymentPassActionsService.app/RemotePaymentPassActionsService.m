BOOL sub_1000055C0(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGPoint *v7;
  CGPoint *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGSize size;
  CGRect v26;

  v2 = *(void *)(a1 + 32);
  v3 = *(double *)(v2 + 48);
  v4 = *(double *)(v2 + 56);
  v5 = *(double *)(v2 + 64);
  v6 = *(double *)(v2 + 72);
  *(unsigned char *)(v2 + 40) = 1;
  v7 = *(CGPoint **)(a1 + 32);
  v8 = v7 + 3;
  if (*(void *)(a1 + 40))
  {
    v9 = [(CGPoint *)v7 view];
    [*(id *)(a1 + 40) CGRectValue];
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = [*(id *)(a1 + 32) view];
    v19 = [v18 window];
    [v9 convertRect:v19 fromView:v11, v13, v15, v17];
    v8->x = v20;
    v8->y = v21;
    v8[1].x = v22;
    v8[1].y = v23;
  }
  else
  {
    size = CGRectNull.size;
    *v8 = CGRectNull.origin;
    v7[4] = (CGPoint)size;
  }
  v26.origin.x = v3;
  v26.origin.y = v4;
  v26.size.width = v5;
  v26.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 48), v26);
}

BOOL sub_1000057CC(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = v2 + 6;
  CGFloat v4 = *((double *)v2 + 6);
  CGFloat v5 = *((double *)v2 + 7);
  CGFloat v6 = *((double *)v2 + 8);
  CGFloat v7 = *((double *)v2 + 9);
  v8 = [v2 view];
  [*(id *)(a1 + 40) CGRectValue];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [*(id *)(a1 + 32) view];
  v18 = [v17 window];
  [v8 convertRect:v18 fromView:v10];
  void *v3 = v19;
  v3[1] = v20;
  v3[2] = v21;
  v3[3] = v22;

  v24.origin.x = v4;
  v24.origin.y = v5;
  v24.size.width = v6;
  v24.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 48), v24);
}

BOOL sub_100005938(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 48);
  *(unsigned char *)(v1 + 40) = 0;
  uint64_t v2 = *(void *)(a1 + 32) + 48;
  CGSize size = CGRectNull.size;
  *(CGPoint *)uint64_t v2 = CGRectNull.origin;
  *(CGSize *)(v2 + 16) = size;
  size.width = *(CGFloat *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
  return !CGRectEqualToRect(*(CGRect *)&size.width, v8);
}

id sub_100005AA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

Class sub_100005FE0()
{
  if (qword_100017500 != -1) {
    dispatch_once(&qword_100017500, &stru_1000103D0);
  }
  Class result = objc_getClass("FAProfilePictureStore");
  qword_1000174F0 = (uint64_t)result;
  off_100017238 = (uint64_t (*)())sub_100006044;
  return result;
}

id sub_100006044()
{
  return (id)qword_1000174F0;
}

void sub_100006050(id a1)
{
  qword_1000174F8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FamilyCircleUI.framework/FamilyCircleUI", 2);
}

void sub_100006D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v5 = v3;
  NPKGuaranteeMainThread();
}

void sub_100006E58(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v14 = [*(id *)(a1 + 40) delegate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(v2 + 56) identifier];
    [v14 selectItemViewController:v2 didFinishWithRenewalAmount:v3 serviceProviderData:v4 forRequestIdentifier:v5];
  }
  else
  {
    id v6 = pk_RemotePassAction_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      CGRect v8 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: Unable to identify selected item! currencyAmount: %@ serviceProviderData: %@", buf, 0x16u);
      }
    }
    double v11 = [*(id *)(a1 + 40) delegate];
    uint64_t v12 = *(void *)(a1 + 40);
    double v13 = [*(id *)(v12 + 56) identifier];
    [v11 selectItemViewController:v12 didCancelForRequestIdentifier:v13];
  }
}

void sub_100007850(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  NPKGuaranteeMainThread();
}

id sub_1000078E4(uint64_t a1)
{
  [*(id *)(a1 + 32) _showLoadingView:0];
  id v2 = *(id **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong(v2 + 6, v3);
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _reloadSelectItemView];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000079A4;
    v6[3] = &unk_100010390;
    v6[4] = v2;
    return [v2 _showGenericErrorAlert:v6];
  }
}

uint64_t sub_1000079A4()
{
  return NPKGuaranteeMainThread();
}

void sub_100007A14(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(v2 + 56) identifier];
  [v4 selectItemViewController:v2 didCancelForRequestIdentifier:v3];
}

uint64_t sub_100007DC4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

Class sub_100007F40()
{
  if (qword_100017520 != -1) {
    dispatch_once(&qword_100017520, &stru_1000104D0);
  }
  Class result = objc_getClass("FAProfilePictureStore");
  qword_100017510 = (uint64_t)result;
  off_100017360 = (uint64_t (*)())sub_100007FA4;
  return result;
}

id sub_100007FA4()
{
  return (id)qword_100017510;
}

void sub_100007FB0(id a1)
{
  qword_100017518 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FamilyCircleUI.framework/FamilyCircleUI", 2);
}

void sub_100008314(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      BOOL v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: NPKRemotePassActionCompanionValueEntryAlertViewController: Failed to configure remote VC proxy! Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100008470(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      BOOL v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: NPKRemotePassActionCompanionValueEntryAlertViewController: Failed to activate remote VC! Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100008B2C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      BOOL v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: NPKRemotePassActionCompanionItemSelectionAlertViewController: Failed to configure remote VC proxy! Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100008C88(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      BOOL v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: NPKRemotePassActionCompanionItemSelectionAlertViewController: Failed to activate remote VC! Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100009860(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: Failed to get view service host proxy: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_10000994C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: Failed to get view service presenter proxy: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100009AE4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t NPKGuaranteeMainThread()
{
  return _NPKGuaranteeMainThread();
}

uint64_t NPKSecureUnarchiveObject()
{
  return _NPKSecureUnarchiveObject();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PKContentAlignmentMake()
{
  return _PKContentAlignmentMake();
}

uint64_t PKCurrencyAmountMake()
{
  return _PKCurrencyAmountMake();
}

uint64_t PKSizeAlignedInRect()
{
  return _PKSizeAlignedInRect();
}

uint64_t PKUIGetMinScreenWidthType()
{
  return _PKUIGetMinScreenWidthType();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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
  return [super a2];
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__action(void *a1, const char *a2, ...)
{
  return [a1 _action];
}

id objc_msgSend__fetchRemoteContentIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _fetchRemoteContentIfNeeded];
}

id objc_msgSend__passImageSize(void *a1, const char *a2, ...)
{
  return [a1 _passImageSize];
}

id objc_msgSend__primaryFont(void *a1, const char *a2, ...)
{
  return [a1 _primaryFont];
}

id objc_msgSend__primaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 _primaryTextColor];
}

id objc_msgSend__registerObservers(void *a1, const char *a2, ...)
{
  return [a1 _registerObservers];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__setUpAppearance(void *a1, const char *a2, ...)
{
  return [a1 _setUpAppearance];
}

id objc_msgSend__setUpContactImageView(void *a1, const char *a2, ...)
{
  return [a1 _setUpContactImageView];
}

id objc_msgSend__setUpNavigationItem(void *a1, const char *a2, ...)
{
  return [a1 _setUpNavigationItem];
}

id objc_msgSend__setUpPassView(void *a1, const char *a2, ...)
{
  return [a1 _setUpPassView];
}

id objc_msgSend__setUpTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 _setUpTitleLabel];
}

id objc_msgSend__shouldHideNonEssentialUI(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideNonEssentialUI];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__updateFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 _updateFirstResponder];
}

id objc_msgSend__updateViewVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateViewVisibility];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_amountTextField(void *a1, const char *a2, ...)
{
  return [a1 amountTextField];
}

id objc_msgSend_balance(void *a1, const char *a2, ...)
{
  return [a1 balance];
}

id objc_msgSend_balanceField(void *a1, const char *a2, ...)
{
  return [a1 balanceField];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cardType(void *a1, const char *a2, ...)
{
  return [a1 cardType];
}

id objc_msgSend_commutePlanField(void *a1, const char *a2, ...)
{
  return [a1 commutePlanField];
}

id objc_msgSend_confirmationTitle(void *a1, const char *a2, ...)
{
  return [a1 confirmationTitle];
}

id objc_msgSend_contactImageSize(void *a1, const char *a2, ...)
{
  return [a1 contactImageSize];
}

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return [a1 currencyCode];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_enteredValueItem(void *a1, const char *a2, ...)
{
  return [a1 enteredValueItem];
}

id objc_msgSend_establishConnection(void *a1, const char *a2, ...)
{
  return [a1 establishConnection];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_maxLoadAmount(void *a1, const char *a2, ...)
{
  return [a1 maxLoadAmount];
}

id objc_msgSend_maxLoadedBalance(void *a1, const char *a2, ...)
{
  return [a1 maxLoadedBalance];
}

id objc_msgSend_minLoadAmount(void *a1, const char *a2, ...)
{
  return [a1 minLoadAmount];
}

id objc_msgSend_minLoadedBalance(void *a1, const char *a2, ...)
{
  return [a1 minLoadedBalance];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsRegistration(void *a1, const char *a2, ...)
{
  return [a1 needsRegistration];
}

id objc_msgSend_passSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 passSerialNumber];
}

id objc_msgSend_passTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 passTypeIdentifier];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_remoteContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 remoteContentConfiguration];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 sheetPresentationController];
}

id objc_msgSend_silhouetteMonogram(void *a1, const char *a2, ...)
{
  return [a1 silhouetteMonogram];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transactionAmount(void *a1, const char *a2, ...)
{
  return [a1 transactionAmount];
}

id objc_msgSend_transactionCurrency(void *a1, const char *a2, ...)
{
  return [a1 transactionCurrency];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_viewServicePresenter(void *a1, const char *a2, ...)
{
  return [a1 viewServicePresenter];
}

id objc_msgSend_willDismissViewController(void *a1, const char *a2, ...)
{
  return [a1 willDismissViewController];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}

id objc_msgSend_zero(void *a1, const char *a2, ...)
{
  return [a1 zero];
}