id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_D1C8 != -1) {
    dispatch_once(&qword_D1C8, &stru_83B0);
  }
  v0 = (void *)qword_D1C0;

  return v0;
}

void sub_3590(id a1)
{
  qword_D1C0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_D1D8 != -1) {
    dispatch_once(&qword_D1D8, &stru_83D0);
  }
  v0 = (void *)qword_D1D0;

  return v0;
}

void sub_3628(id a1)
{
  qword_D1D0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_D1E8 != -1) {
    dispatch_once(&qword_D1E8, &stru_83F0);
  }
  v0 = (void *)qword_D1E0;

  return v0;
}

void sub_36C0(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_D1E0;
  qword_D1E0 = (uint64_t)v1;
}

uint64_t sub_37C8(uint64_t a1)
{
  qword_D1F0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = +[NSBundle mainBundle];
    v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
  else {
    v6 = 0;
  }

  return v6;
}

void PHPreferencesSetValue(void *a1, void *a2)
{
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  key = a1;
  id v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = +[NSBundle mainBundle];
    v6 = [v7 bundleIdentifier];
  }
  if ([(__CFString *)key length] && [(__CFString *)v6 length])
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

uint64_t sub_48A0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_48C0, 0, 0);
}

uint64_t sub_48C0()
{
  sub_5410();
  uint64_t v1 = sub_5420();
  uint64_t v3 = v2;
  v0[3] = v2;
  uint64_t v4 = sub_5420();
  uint64_t v6 = v5;
  v0[4] = v5;
  v7 = (void *)swift_task_alloc();
  v0[5] = v7;
  void *v7 = v0;
  v7[1] = sub_49B8;
  return static TipEventProxy.donate(eventIdentifier:for:with:)(v1, v3, v4, v6, 0);
}

uint64_t sub_49B8()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v2 = sub_53C8;
  }
  else
  {
    uint64_t v2 = sub_4B14;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_4B14()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 48) != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id ICSTipsHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ICSTipsHelper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ICSTipsHelper();
  return objc_msgSendSuper2(&v2, "init");
}

id ICSTipsHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ICSTipsHelper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4C1C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_4CFC;
  return v5(v2 + 32);
}

uint64_t sub_4CFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t _s17ICSSettingsBundle13ICSTipsHelperC30donateEventAnnouceCallsEnabledyyFZ_0()
{
  sub_5060(&qword_D0F8);
  __chkstk_darwin();
  uint64_t v1 = (char *)v10 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_5450();
  uint64_t v3 = *(void *)(v2 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_5278((uint64_t)v1);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    sub_5440();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v1, v2);
    if (*(void *)(v4 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v5 = sub_5430();
      uint64_t v6 = v7;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
    }
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = &unk_D108;
  *(void *)(v8 + 24) = v4;
  sub_5060(&qword_D120);
  if (v6 | v5)
  {
    v10[0] = 0;
    v10[1] = 0;
    v10[2] = v5;
    v10[3] = v6;
  }
  swift_task_create();
  return swift_release();
}

uint64_t type metadata accessor for ICSTipsHelper()
{
  return self;
}

uint64_t sub_5060(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_50A4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_50DC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_5184;
  v3[2] = a1;
  return _swift_task_switch(sub_48C0, 0, 0);
}

uint64_t sub_5184()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5278(uint64_t a1)
{
  uint64_t v2 = sub_5060(&qword_D0F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_52D8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5310(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_5184;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_D110 + dword_D110);
  return v6(a1, v4);
}

uint64_t sub_53CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_5410()
{
  return type metadata accessor for TipEventProxy();
}

uint64_t sub_5420()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_5430()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_5440()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_5450()
{
  return type metadata accessor for TaskPriority();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_alwaysListItemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 alwaysListItemSpecifier];
}

id objc_msgSend_announceCallStyleIcon(void *a1, const char *a2, ...)
{
  return _[a1 announceCallStyleIcon];
}

id objc_msgSend_announceCalls(void *a1, const char *a2, ...)
{
  return _[a1 announceCalls];
}

id objc_msgSend_announceCallsSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 announceCallsSpecifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateAnnounceCallsEnabledSignalForState_previousState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateAnnounceCallsEnabledSignalForState:previousState:");
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEvent];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 groupSpecifier];
}

id objc_msgSend_handsFreeListItemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 handsFreeListItemSpecifier];
}

id objc_msgSend_headphonesOnlyListItemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 headphonesOnlyListItemSpecifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadDataSource(void *a1, const char *a2, ...)
{
  return _[a1 loadDataSource];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return _[a1 localizationTableName];
}

id objc_msgSend_localizedDescriptionForAnnounceCallsConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescriptionForAnnounceCallsConfiguration:");
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedlabelTextForAnnounceCallsConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedlabelTextForAnnounceCallsConfiguration:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_neverListItemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 neverListItemSpecifier];
}

id objc_msgSend_numberForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:defaultValue:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return _[a1 parentListController];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferencesValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:");
}

id objc_msgSend_preferencesValueForKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesValueForKey:domain:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_refreshGroupForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshGroupForSpecifier:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_setAlwaysListItemSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysListItemSpecifier:");
}

id objc_msgSend_setAnnounceCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceCalls:");
}

id objc_msgSend_setAnnounceCallsSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceCallsSpecifier:");
}

id objc_msgSend_setGroupSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupSpecifier:");
}

id objc_msgSend_setHandsFreeListItemSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandsFreeListItemSpecifier:");
}

id objc_msgSend_setHeadphonesOnlyListItemSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadphonesOnlyListItemSpecifier:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setNeverListItemSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeverListItemSpecifier:");
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:");
}

id objc_msgSend_setPreferencesValue_forKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferencesValue:forKey:domain:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setUserConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserConfiguration:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return _[a1 specifierID];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_tu_userConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_userConfiguration");
}

id objc_msgSend_unsignedIntegerForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerForKey:defaultValue:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_userConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 userConfiguration];
}