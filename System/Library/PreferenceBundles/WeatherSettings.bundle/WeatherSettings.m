id sub_5DB8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t vars8;

  v10 = *(void *)(a1 + 32);
  v11 = a6;
  v12 = a5;
  v13 = a2;
  v14 = +[PSSpecifier preferenceSpecifierNamed:a3 target:v10 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:a4 edit:0];
  [v14 setObject:v13 forKeyedSubscript:PSIDKey];

  [v14 setObject:v12 forKeyedSubscript:PSKeyNameKey];
  [v14 setObject:v11 forKeyedSubscript:PSDefaultValueKey];
  [v14 setObject:v11 forKeyedSubscript:PSValueKey];

  [v14 setObject:@"com.apple.weather" forKeyedSubscript:PSDefaultsKey];
  [v14 setObject:@"com.apple.weather" forKeyedSubscript:PSContainerBundleIDKey];

  return v14;
}

id sub_60FC(uint64_t a1)
{
  v2 = +[WeatherSettingsState defaultState];
  v3 = [v2 units];
  [v3 setPreferredTemperatureUnit:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) reloadWidget];
  v4 = *(void **)(a1 + 40);

  return [v4 updateSelectedUnit];
}

id sub_6B80(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue] ^ 1;
  v3 = +[WeatherSettingsState defaultState];
  [v3 setResetIdentifier:v2];

  v4 = *(void **)(a1 + 40);

  return _[v4 reload];
}

id sub_6BE8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue] ^ 1;
  v3 = +[WeatherSettingsState defaultState];
  [v3 setShowHomeWorkLabels:v2];

  v4 = *(void **)(a1 + 40);

  return _[v4 reload];
}

id WSBundle()
{
  if (qword_113B8 != -1) {
    dispatch_once(&qword_113B8, &stru_C470);
  }
  v0 = (void *)qword_113B0;

  return v0;
}

void sub_7058(id a1)
{
  qword_113B0 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

unint64_t sub_70B4()
{
  return sub_72A4(63);
}

unint64_t sub_70EC()
{
  return sub_72A4(80);
}

unint64_t sub_7124()
{
  return sub_72A4(77);
}

unint64_t sub_715C()
{
  return sub_72A4(85);
}

id sub_7194(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  NSString v3 = sub_8B60();
  swift_bridgeObjectRelease();

  return v3;
}

id sub_71E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_7244()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WeatherSettingsConstants()
{
  return self;
}

unint64_t sub_72A4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

id sub_72AC()
{
  uint64_t v1 = sub_8B50();
  swift_allocObject();
  uint64_t v6 = v1;
  v7 = &protocol witness table for NanoPreferencesSynchronizer;
  uint64_t v5 = sub_8B40();
  sub_8B00();
  swift_allocObject();
  sub_8AF0();
  sub_8AE0();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for WeatherSettingsUnits();
  id v2 = objc_msgSendSuper2(&v4, "init");
  swift_release();
  return v2;
}

uint64_t sub_73C0()
{
  sub_8AD0();
  sub_8AC0();
  sub_8AA0();

  return swift_release();
}

uint64_t sub_7444()
{
  return _swift_task_switch(sub_7460, 0, 0);
}

uint64_t sub_7460()
{
  sub_8634();
  sub_8AD0();
  *(void *)(v0 + 16) = sub_8AC0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7504;
  return UnitManager.refreshUnitsFromStorage()();
}

uint64_t sub_7504()
{
  sub_8634();
  sub_85F0();
  uint64_t v1 = *v0;
  sub_8608();
  void *v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_8640();
  return v3();
}

uint64_t sub_765C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_7700;
  return sub_7444();
}

uint64_t sub_7700()
{
  sub_8634();
  sub_85F0();
  id v2 = *(void (***)(void))(v1 + 24);
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *v0;
  sub_8608();
  *uint64_t v5 = v4;
  swift_task_dealloc();

  v2[2](v2);
  _Block_release(v2);
  sub_8640();
  return v6();
}

uint64_t sub_7804(uint64_t a1, uint64_t a2)
{
  sub_7BF4(&qword_11348);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_8BA0();
  sub_7C60((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_11358;
  v8[5] = v7;
  sub_8194((uint64_t)v5, (uint64_t)&unk_11368, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_7908(void *a1)
{
  sub_7BF4(&qword_11330);
  __chkstk_darwin();
  sub_8618();
  sub_8AD0();
  if (a1)
  {
    id v3 = a1;
    sub_8AC0();
    id v4 = v3;
    sub_8B30();
    sub_8A90();
  }
  else
  {
    sub_8AC0();
    uint64_t v5 = sub_8B20();
    sub_7C60(v1, 1, 1, v5);
    sub_8A90();
  }
  swift_release();
  return sub_8304(v1, &qword_11330);
}

uint64_t sub_7AA0()
{
  sub_7BF4(&qword_11330);
  __chkstk_darwin();
  sub_8618();
  sub_8AD0();
  sub_8AC0();
  sub_8A80();
  swift_release();
  uint64_t v1 = sub_8B20();
  if (sub_7C38(v0, 1, v1) == 1)
  {
    sub_8304(v0, &qword_11330);
    return 0;
  }
  else
  {
    uint64_t v2 = sub_8B10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0, v1);
  }
  return v2;
}

id sub_7B9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherSettingsUnits();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WeatherSettingsUnits()
{
  return self;
}

uint64_t sub_7BF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_7C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_7C88()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7CC8()
{
  uint64_t v1 = *(const void **)(v0 + 16);
  objc_super v2 = *(void **)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  id v4 = (void *)sub_864C(v3);
  void *v4 = v5;
  v4[1] = sub_7D70;
  uint64_t v6 = (uint64_t (*)(const void *, void *))((char *)&dword_11338 + dword_11338);
  return v6(v1, v2);
}

uint64_t sub_7D70()
{
  sub_8634();
  sub_85F0();
  uint64_t v1 = *v0;
  sub_8608();
  void *v2 = v1;
  swift_task_dealloc();
  sub_8640();
  return v3();
}

uint64_t sub_7E30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_85EC;
  return v6();
}

uint64_t sub_7F00()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_864C(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_85EC;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_11350 + dword_11350);
  return v7(v1, v2, v3);
}

uint64_t sub_7FBC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_85EC;
  return v7();
}

uint64_t sub_808C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_80CC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_864C(v6);
  void *v7 = v8;
  v7[1] = sub_85EC;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_11360 + dword_11360);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_8194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_8BA0();
  if (sub_7C38(a1, 1, v6) == 1)
  {
    sub_8304(a1, &qword_11348);
  }
  else
  {
    sub_8B90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_8B80();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_8304(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_7BF4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8360(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_843C;
  return v6(a1);
}

uint64_t sub_843C()
{
  sub_8634();
  sub_85F0();
  uint64_t v1 = *v0;
  sub_8608();
  void *v2 = v1;
  swift_task_dealloc();
  sub_8640();
  return v3();
}

uint64_t sub_8500()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8538(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_864C(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_7D70;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_11370 + dword_11370);
  return v7(a1, v3);
}

uint64_t sub_8618()
{
  return 0;
}

uint64_t sub_8640()
{
  return v0 + 8;
}

uint64_t sub_864C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

id sub_8658()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for WeatherSettingsState()) init];
  qword_113C0 = (uint64_t)result;
  return result;
}

id sub_8688()
{
  if (qword_112D0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_113C0;

  return v0;
}

id sub_8740()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15WeatherSettings20WeatherSettingsState_units);
}

id sub_883C(uint64_t a1, char a2)
{
  uint64_t v3 = self;
  NSString v4 = sub_8B60();
  id v5 = [v3 readBoolFromContainerPreferenceValueForKey:v4 defaultValue:a2 & 1];

  return v5;
}

void sub_890C()
{
  uint64_t v0 = self;
  NSString v1 = sub_8B60();
  Class isa = sub_8B70().super.super.isa;
  [v0 writePreferenceForKey:v1 value:isa];
}

id sub_89A0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC15WeatherSettings20WeatherSettingsState_units;
  id v3 = objc_allocWithZone((Class)type metadata accessor for WeatherSettingsUnits());
  NSString v4 = v0;
  *(void *)&v0[v2] = [v3 init];

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t type metadata accessor for WeatherSettingsState()
{
  return self;
}

uint64_t sub_8A80()
{
  return UnitManager.preferredTemperatureUnit.getter();
}

uint64_t sub_8A90()
{
  return UnitManager.setPreferredTemperatureUnit(_:)();
}

void sub_8AA0()
{
}

uint64_t sub_8AC0()
{
  return static UnitManager.standard.getter();
}

uint64_t sub_8AD0()
{
  return type metadata accessor for UnitManager();
}

void sub_8AE0()
{
}

uint64_t sub_8AF0()
{
  return UnitSetupManager.init(nanoPrefencesSynchronizer:)();
}

uint64_t sub_8B00()
{
  return type metadata accessor for UnitSetupManager();
}

uint64_t sub_8B10()
{
  return UnitConfiguration.Temperature.asUnit.getter();
}

uint64_t sub_8B20()
{
  return type metadata accessor for UnitConfiguration.Temperature();
}

uint64_t sub_8B30()
{
  return UnitConfiguration.Temperature.init(_:)();
}

uint64_t sub_8B40()
{
  return NanoPreferencesSynchronizer.init(domain:container:appGroupContainer:)();
}

uint64_t sub_8B50()
{
  return type metadata accessor for NanoPreferencesSynchronizer();
}

NSString sub_8B60()
{
  return String._bridgeToObjectiveC()();
}

NSNumber sub_8B70()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_8B80()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_8B90()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_8BA0()
{
  return type metadata accessor for TaskPriority();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return __CFPreferencesAppSynchronizeWithContainer();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return __CFPreferencesCopyAppValueWithContainer();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return __CFPreferencesSetAppValueWithContainer();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
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

id objc_msgSend_PrivacyHomeWorkShowLabelsNavigationUrl(void *a1, const char *a2, ...)
{
  return _[a1 PrivacyHomeWorkShowLabelsNavigationUrl];
}

id objc_msgSend_PrivacyResetNavigationUrl(void *a1, const char *a2, ...)
{
  return _[a1 PrivacyResetNavigationUrl];
}

id objc_msgSend_RootNavigationUrl(void *a1, const char *a2, ...)
{
  return _[a1 RootNavigationUrl];
}

id objc_msgSend_TemperatureNavigationUrl(void *a1, const char *a2, ...)
{
  return _[a1 TemperatureNavigationUrl];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:suspensionBehavior:");
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_celsius(void *a1, const char *a2, ...)
{
  return _[a1 celsius];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultState(void *a1, const char *a2, ...)
{
  return _[a1 defaultState];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_fahrenheit(void *a1, const char *a2, ...)
{
  return _[a1 fahrenheit];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerURLs];
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundleIdentifier:delegate:onQueue:");
}

id objc_msgSend_initWithExtensionBundleIdentifier_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionBundleIdentifier:kind:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedButtonTitle];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return _[a1 locationManager];
}

id objc_msgSend_locationPermissionsSupportHomeAndWork(void *a1, const char *a2, ...)
{
  return _[a1 locationPermissionsSupportHomeAndWork];
}

id objc_msgSend_mirrorSystem(void *a1, const char *a2, ...)
{
  return _[a1 mirrorSystem];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_pe_registerUndoActionName_associatedDeepLink_undoAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_registerUndoActionName:associatedDeepLink:undoAction:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredTemperatureUnit(void *a1, const char *a2, ...)
{
  return _[a1 preferredTemperatureUnit];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_privacyButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 privacyButtonTitle];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return _[a1 privacyFlow];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readContainerPreferenceValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readContainerPreferenceValueForKey:");
}

id objc_msgSend_readPreferenceValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readPreferenceValue:");
}

id objc_msgSend_refreshUnits(void *a1, const char *a2, ...)
{
  return _[a1 refreshUnits];
}

id objc_msgSend_registerUndoActionWithKey_urlString_undoAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUndoActionWithKey:urlString:undoAction:");
}

id objc_msgSend_reloadTimeline(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimeline];
}

id objc_msgSend_reloadWidget(void *a1, const char *a2, ...)
{
  return _[a1 reloadWidget];
}

id objc_msgSend_reloadWithSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadWithSpecifier:animated:");
}

id objc_msgSend_resetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 resetIdentifier];
}

id objc_msgSend_setAppPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPolicy:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCelsius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCelsius:");
}

id objc_msgSend_setCelsiusValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCelsiusValue:");
}

id objc_msgSend_setChecked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChecked:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFahrenheit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFahrenheit:");
}

id objc_msgSend_setFahrenheitValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFahrenheitValue:");
}

id objc_msgSend_setLocationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationManager:");
}

id objc_msgSend_setMirrorSystem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMirrorSystem:");
}

id objc_msgSend_setMirrorSystemValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMirrorSystemValue:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferredTemperatureUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredTemperatureUnit:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setResetIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetIdentifier:");
}

id objc_msgSend_setShowHomeAndWorkLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowHomeAndWorkLabels:");
}

id objc_msgSend_setShowHomeWorkLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowHomeWorkLabels:");
}

id objc_msgSend_setTemperatureUnitGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemperatureUnitGroup:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_showHomeAndWorkLabels(void *a1, const char *a2, ...)
{
  return _[a1 showHomeAndWorkLabels];
}

id objc_msgSend_showHomeWorkLabels(void *a1, const char *a2, ...)
{
  return _[a1 showHomeWorkLabels];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_temperatureUnitGroup(void *a1, const char *a2, ...)
{
  return _[a1 temperatureUnitGroup];
}

id objc_msgSend_units(void *a1, const char *a2, ...)
{
  return _[a1 units];
}

id objc_msgSend_updateHomeAndWorkSwitch(void *a1, const char *a2, ...)
{
  return _[a1 updateHomeAndWorkSwitch];
}

id objc_msgSend_updateSelectedUnit(void *a1, const char *a2, ...)
{
  return _[a1 updateSelectedUnit];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}