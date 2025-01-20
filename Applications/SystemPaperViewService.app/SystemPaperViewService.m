id sub_1000049AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) teardown];
}

void sub_100004F04(id a1, BOOL a2)
{
  if (!a2) {
    sleep(1u);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_allowsBackdropGroups(void *a1, const char *a2, ...)
{
  return [a1 allowsBackdropGroups];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_didPresent(void *a1, const char *a2, ...)
{
  return [a1 didPresent];
}

id objc_msgSend_didTeardown(void *a1, const char *a2, ...)
{
  return [a1 didTeardown];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_extensionHostViewController(void *a1, const char *a2, ...)
{
  return [a1 extensionHostViewController];
}

id objc_msgSend_hidesSourceLayer(void *a1, const char *a2, ...)
{
  return [a1 hidesSourceLayer];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_matchesOpacity(void *a1, const char *a2, ...)
{
  return [a1 matchesOpacity];
}

id objc_msgSend_matchesPosition(void *a1, const char *a2, ...)
{
  return [a1 matchesPosition];
}

id objc_msgSend_matchesTransform(void *a1, const char *a2, ...)
{
  return [a1 matchesTransform];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return [a1 portalLayer];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_sourceContextId(void *a1, const char *a2, ...)
{
  return [a1 sourceContextId];
}

id objc_msgSend_sourceLayerRenderId(void *a1, const char *a2, ...)
{
  return [a1 sourceLayerRenderId];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userActivityData(void *a1, const char *a2, ...)
{
  return [a1 userActivityData];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}