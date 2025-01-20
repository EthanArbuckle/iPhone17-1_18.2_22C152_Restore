id CLCreatePrivacySpecifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void ***v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  v5 = [v4 parentViewController];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;

    v4 = v6;
  }
  v7 = +[PSSpecifier emptyGroupSpecifier];
  [v7 setProperty:@"PrivacyDisplay" forKey:PSIDKey];
  [v7 setProperty:@"CLPrivacyLinkDisplayView" forKey:PSHeaderCellClassGroupKey];
  [v7 setProperty:v3 forKey:CLFPrivacyLinkBundleIdentifier];
  objc_initWeak(&location, v4);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_33E8;
  v13 = &unk_4108;
  objc_copyWeak(&v14, &location);
  v8 = objc_retainBlock(&v10);
  objc_msgSend(v7, "setProperty:forKey:", v8, CLFPrivacyCallbackIdentifier, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void sub_33CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_33E8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addChildViewController:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v3 didMoveToParentViewController:v5];
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_msgSend_allowPhotoCapture(void *a1, const char *a2, ...)
{
  return [a1 allowPhotoCapture];
}

id objc_msgSend_allowSelfieCapture(void *a1, const char *a2, ...)
{
  return [a1 allowSelfieCapture];
}

id objc_msgSend_allowSelfieVideoCapture(void *a1, const char *a2, ...)
{
  return [a1 allowSelfieVideoCapture];
}

id objc_msgSend_allowVideoCapture(void *a1, const char *a2, ...)
{
  return [a1 allowVideoCapture];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}