id sub_4BD4()
{
  void *v0;
  id v1;
  void *v2;
  void v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_11A38;
  v8 = qword_11A38;
  if (!qword_11A38)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_4D74;
    v4[3] = &unk_C2B0;
    v4[4] = &v5;
    sub_4D74((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 sharedStyle];

  return v2;
}

void sub_4CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_4D74(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_11A40)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_4EB8;
    v4[4] = &unk_C2E8;
    v4[5] = v4;
    long long v5 = off_C2D0;
    uint64_t v6 = 0;
    qword_11A40 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_11A40)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_8AA0();
LABEL_8:
    free(v2);
  }
  qword_11A38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_4EB8()
{
  uint64_t result = _sl_dlopen();
  qword_11A40 = result;
  return result;
}

void sub_5FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id *a26,id *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v35 - 216));
  _Unwind_Resume(a1);
}

id sub_60D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"VOICEOVER_TITLE", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"VoiceOverController" title:v2];

  return v3;
}

id sub_6154(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"ZOOM_TITLE", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"ZoomController" title:v2];

  return v3;
}

id sub_61D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"DISPLAY_AND_TEXT", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"AXDisplayController" title:v2];

  return v3;
}

id sub_625C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"MOTION_TITLE", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"AXMotionController" title:v2];

  return v3;
}

id sub_62E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"SPEECH_TITLE", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"SpeechController" title:v2];

  return v3;
}

id sub_6364(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"TOUCH", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"AXTouchAndReachability" title:v2];

  return v3;
}

id sub_63E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AXBuddyBundleLocString(@"SWITCH_CONTROL_TITLE");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"SCATController" title:v2];

  return v3;
}

id sub_6464(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = settingsLocString(@"KEYBOARDS", @"Accessibility");
  v3 = [WeakRetained createWelcomeControllerWithAXSettingsController:@"AXKeyboardsController" title:v2];

  return v3;
}

id sub_68E4()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)qword_11A48;
  uint64_t v8 = qword_11A48;
  if (!qword_11A48)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_6AFC;
    v4[3] = &unk_C2B0;
    v4[4] = &v5;
    sub_6AFC((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 sharedStyle];

  return v2;
}

void sub_69B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_6AFC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_11A50)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_6C40;
    v4[4] = &unk_C2E8;
    void v4[5] = v4;
    long long v5 = off_C330;
    uint64_t v6 = 0;
    qword_11A50 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_11A50)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_8AA0();
LABEL_8:
    free(v2);
  }
  qword_11A48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6C40()
{
  uint64_t result = _sl_dlopen();
  qword_11A50 = result;
  return result;
}

id AXBuddyBundleLocString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.accessibility.AXBuddyBundle"];
  v3 = [v2 localizedStringForKey:v1 value:&stru_C7B8 table:@"Localizable"];

  return v3;
}

NSBundle *AXBuddyBundleBundle()
{
  return +[NSBundle bundleWithIdentifier:@"com.apple.accessibility.AXBuddyBundle"];
}

id AXSettingsBundle()
{
  if (qword_11A60 != -1) {
    dispatch_once(&qword_11A60, &stru_C368);
  }
  v0 = (void *)qword_11A58;

  return v0;
}

void sub_6DA4(id a1)
{
  id v3 = [(id)_AXSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccessibilitySettings.bundle"];
  uint64_t v1 = +[NSBundle bundleWithPath:v3];
  v2 = (void *)qword_11A58;
  qword_11A58 = v1;
}

id settingsLocString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  long long v5 = AXSettingsBundle();
  uint64_t v6 = [v5 localizedStringForKey:v4 value:v4 table:v3];

  return v6;
}

id sub_715C()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)qword_11A68;
  uint64_t v8 = qword_11A68;
  if (!qword_11A68)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_73EC;
    v4[3] = &unk_C2B0;
    v4[4] = &v5;
    sub_73EC((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 sharedStyle];

  return v2;
}

void sub_7230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_73EC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_11A70)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_7530;
    v4[4] = &unk_C2E8;
    void v4[5] = v4;
    long long v5 = off_C388;
    uint64_t v6 = 0;
    qword_11A70 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_11A70)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_8AA0();
LABEL_8:
    free(v2);
  }
  qword_11A68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_7530()
{
  uint64_t result = _sl_dlopen();
  qword_11A70 = result;
  return result;
}

id sub_7FA8()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)qword_11A78;
  uint64_t v8 = qword_11A78;
  if (!qword_11A78)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_88E8;
    v4[3] = &unk_C2B0;
    v4[4] = &v5;
    sub_88E8((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 sharedStyle];

  return v2;
}

void sub_807C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_88E8(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_11A80)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_8A2C;
    v4[4] = &unk_C2E8;
    void v4[5] = v4;
    long long v5 = off_C3A0;
    uint64_t v6 = 0;
    qword_11A80 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_11A80)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BFFStyle");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_8AA0();
LABEL_8:
    free(v2);
  }
  qword_11A78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_8A2C()
{
  uint64_t result = _sl_dlopen();
  qword_11A80 = result;
  return result;
}

uint64_t sub_8AA0()
{
  uint64_t v0 = abort_report_np();
  return sub_8AC8(v0);
}

void sub_8AC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error loading AXSettingsController for buddy: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXLocStringKeyForModel()
{
  return _AXLocStringKeyForModel();
}

uint64_t AXLogSettings()
{
  return _AXLogSettings();
}

uint64_t AXUIIconImageWithBackgroundForImage()
{
  return _AXUIIconImageWithBackgroundForImage();
}

uint64_t AXUISettingsCleanUpWelcomeControllerTableViewObservations()
{
  return _AXUISettingsCleanUpWelcomeControllerTableViewObservations();
}

uint64_t AXUISettingsCreateWelcomeController()
{
  return _AXUISettingsCreateWelcomeController();
}

uint64_t AXUISettingsHandleWelcomeControllerTableViewUpdate()
{
  return _AXUISettingsHandleWelcomeControllerTableViewUpdate();
}

uint64_t LIIconContinuousCornerRadiusForVariant()
{
  return _LIIconContinuousCornerRadiusForVariant();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSystemRootDirectory()
{
  return __AXSystemRootDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_msgSend__baseTableControllerCommonInit(void *a1, const char *a2, ...)
{
  return [a1 _baseTableControllerCommonInit];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return [a1 _commonInit];
}

id objc_msgSend__commonSwitchCellInit(void *a1, const char *a2, ...)
{
  return [a1 _commonSwitchCellInit];
}

id objc_msgSend__largeTableCellCommonInit(void *a1, const char *a2, ...)
{
  return [a1 _largeTableCellCommonInit];
}

id objc_msgSend__registerCellClassesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _registerCellClassesIfNecessary];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_cellClass(void *a1, const char *a2, ...)
{
  return [a1 cellClass];
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

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return [a1 footerText];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sharedStyle(void *a1, const char *a2, ...)
{
  return [a1 sharedStyle];
}

id objc_msgSend_subitems(void *a1, const char *a2, ...)
{
  return [a1 subitems];
}

id objc_msgSend_tableSections(void *a1, const char *a2, ...)
{
  return [a1 tableSections];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tallRowHeight(void *a1, const char *a2, ...)
{
  return [a1 tallRowHeight];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerInstantiator(void *a1, const char *a2, ...)
{
  return [a1 viewControllerInstantiator];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}