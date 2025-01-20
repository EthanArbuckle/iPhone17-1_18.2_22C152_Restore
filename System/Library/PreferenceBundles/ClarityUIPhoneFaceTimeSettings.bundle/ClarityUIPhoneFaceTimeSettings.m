BOOL sub_2D74(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  unsigned __int8 v5;

  v4 = [(PSSpecifier *)a2 identifier];
  v5 = [v4 isEqualToString:@"UI_OPTION_SPEAKER"];

  return v5;
}

id CLCreatePrivacySpecifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [v4 parentViewController];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    id v4 = v6;
  }
  v7 = +[PSSpecifier emptyGroupSpecifier];
  [v7 setProperty:@"PrivacyDisplay" forKey:PSIDKey];
  [v7 setProperty:@"CLPrivacyLinkDisplayView" forKey:PSHeaderCellClassGroupKey];
  [v7 setProperty:v3 forKey:CLFPrivacyLinkBundleIdentifier];
  objc_initWeak(&location, v4);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_3400;
  v13 = &unk_41C8;
  objc_copyWeak(&v14, &location);
  v8 = objc_retainBlock(&v10);
  objc_msgSend(v7, "setProperty:forKey:", v8, CLFPrivacyCallbackIdentifier, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void sub_33E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3400(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addChildViewController:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v3 didMoveToParentViewController:v5];
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_msgSend__axLoadSpecifiersFromPlist(void *a1, const char *a2, ...)
{
  return [a1 _axLoadSpecifiersFromPlist];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_communicationLimitSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 communicationLimitSpecifiers];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inCallKeypadEnabled(void *a1, const char *a2, ...)
{
  return [a1 inCallKeypadEnabled];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_speakerOptionEnabled(void *a1, const char *a2, ...)
{
  return [a1 speakerOptionEnabled];
}