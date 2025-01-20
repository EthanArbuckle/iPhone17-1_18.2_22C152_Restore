uint64_t sub_1000011D0()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_100008990;
  v5 = qword_100008990;
  if (!qword_100008990)
  {
    v6 = *(_OWORD *)off_1000041B8;
    v7 = *(_OWORD *)&off_1000041C8;
    v3[3] = _sl_dlopen();
    qword_100008990 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1000012E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000012F8(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100008990 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100001388()
{
  uint64_t v0 = sub_1000011D0();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_1000013E4()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100008998;
  uint64_t v7 = qword_100008998;
  if (!qword_100008998)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000014C8;
    v3[3] = &unk_100004208;
    v3[4] = &v4;
    sub_1000014C8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000014B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000014C8(uint64_t a1)
{
  sub_100001388();
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100002640();
  }
  qword_100008998 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100001520()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000089A0;
  uint64_t v7 = qword_1000089A0;
  if (!qword_1000089A0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100001604;
    v3[3] = &unk_100004208;
    v3[4] = &v4;
    sub_100001604((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000015EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100001604(uint64_t a1)
{
  sub_100001388();
  Class result = objc_getClass("AKBasicLoginContentViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100002668();
  }
  qword_1000089A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100002640()
{
  uint64_t v0 = abort_report_np();
  sub_100002668(v0);
}

void sub_100002668()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return __UIContentSizeCategoryCompareToContentSizeCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__configureCodeGenView(void *a1, const char *a2, ...)
{
  return [a1 _configureCodeGenView];
}

id objc_msgSend__configureFooterView(void *a1, const char *a2, ...)
{
  return [a1 _configureFooterView];
}

id objc_msgSend__configureTitleHeaderView(void *a1, const char *a2, ...)
{
  return [a1 _configureTitleHeaderView];
}

id objc_msgSend__generatorLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _generatorLabelFont];
}

id objc_msgSend__interpolatedReason(void *a1, const char *a2, ...)
{
  return [a1 _interpolatedReason];
}

id objc_msgSend__message(void *a1, const char *a2, ...)
{
  return [a1 _message];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generatedCode(void *a1, const char *a2, ...)
{
  return [a1 generatedCode];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_notificationDisclaimer(void *a1, const char *a2, ...)
{
  return [a1 notificationDisclaimer];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}