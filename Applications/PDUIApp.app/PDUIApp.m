void sub_1000019B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  unsigned char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void v28[4];

  v2 = PDCGlobalConsentStoreInstance();
  DMGetUserDataDisposition();
  v3 = PDCGlobalDeviceSettings();
  v4 = PDCGlobalApplicationEnvironment();
  v5 = PDCPerformOneTimeImplicitConsentGrant();

  if (v5 && (v6 = *(unsigned char **)(a1 + 32), !v6[24]))
  {
    [v6 _dismissWithResponse:1];
  }
  else
  {
    v7 = [objc_alloc((Class)PDURootViewController) initWithApplicationIdentity:*(void *)(a1 + 40) consentStore:v2];
    v8 = [v7 view];
    [v7 setDelegate:*(void *)(a1 + 32)];
    v27 = v7;
    [*(id *)(a1 + 32) addChildViewController:v7];
    v9 = [*(id *)(a1 + 32) view];
    [v9 addSubview:v8];

    [v7 didMoveToParentViewController:*(void *)(a1 + 32)];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [v8 topAnchor];
    v26 = [*(id *)(a1 + 32) view];
    v24 = [v26 topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v21 = [v8 bottomAnchor];
    v22 = [*(id *)(a1 + 32) view];
    v20 = [v22 bottomAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v28[1] = v19;
    v18 = [v8 leadingAnchor];
    v10 = [*(id *)(a1 + 32) view];
    v11 = [v10 leadingAnchor];
    v12 = [v18 constraintEqualToAnchor:v11];
    v28[2] = v12;
    v13 = [v8 trailingAnchor];
    v14 = [*(id *)(a1 + 32) view];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v28[3] = v16;
    v17 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t DMGetUserDataDisposition()
{
  return _DMGetUserDataDisposition();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PDCGlobalApplicationEnvironment()
{
  return _PDCGlobalApplicationEnvironment();
}

uint64_t PDCGlobalConsentStoreInstance()
{
  return _PDCGlobalConsentStoreInstance();
}

uint64_t PDCGlobalDeviceSettings()
{
  return _PDCGlobalDeviceSettings();
}

uint64_t PDCPerformOneTimeImplicitConsentGrant()
{
  return _PDCPerformOneTimeImplicitConsentGrant();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return [a1 canSendResponse];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}