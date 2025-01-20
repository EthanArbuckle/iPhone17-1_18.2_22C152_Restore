unint64_t GMAvailability.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_5E30@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_5E4C(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_5E58()
{
  Swift::UInt v1 = *v0;
  sub_69A0();
  sub_69B0(v1);
  return sub_69C0();
}

void sub_5EA0()
{
  sub_69B0(*v0);
}

Swift::Int sub_5ECC()
{
  Swift::UInt v1 = *v0;
  sub_69A0();
  sub_69B0(v1);
  return sub_69C0();
}

BOOL sub_5F10(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t variable initialization expression of GenerativeModelAvailabilityControl.available()
{
  uint64_t v0 = sub_6980();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  BOOL v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_6950();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6940();
  sub_6970();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_6960();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t GenerativeModelAvailabilityControl.getAvailability()()
{
  uint64_t v1 = sub_6930();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl_available, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (&enum case for GenerativeModelsAvailability.Availability.restricted(_:)
    && v5 == enum case for GenerativeModelsAvailability.Availability.restricted(_:))
  {
    uint64_t v6 = 1;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v6;
  }
  if (&enum case for GenerativeModelsAvailability.Availability.unavailable(_:)
    && v5 == enum case for GenerativeModelsAvailability.Availability.unavailable(_:))
  {
    uint64_t v6 = 2;
    goto LABEL_7;
  }
  if (&enum case for GenerativeModelsAvailability.Availability.available(_:)
    && v5 == enum case for GenerativeModelsAvailability.Availability.available(_:))
  {
    return 0;
  }
  uint64_t result = sub_6990();
  __break(1u);
  return result;
}

id GenerativeModelAvailabilityControl.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id GenerativeModelAvailabilityControl.init()()
{
  uint64_t v1 = sub_6980();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6950();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = v0;
  sub_6940();
  sub_6970();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_6960();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v10 = (objc_class *)type metadata accessor for GenerativeModelAvailabilityControl();
  v12.receiver = v9;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t type metadata accessor for GenerativeModelAvailabilityControl()
{
  uint64_t result = qword_CBC0;
  if (!qword_CBC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id GenerativeModelAvailabilityControl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelAvailabilityControl();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_67C8()
{
  unint64_t result = qword_CA08;
  if (!qword_CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_CA08);
  }
  return result;
}

ValueMetadata *type metadata accessor for GMAvailability()
{
  return &type metadata for GMAvailability;
}

uint64_t sub_6898()
{
  return type metadata accessor for GenerativeModelAvailabilityControl();
}

uint64_t sub_68A0()
{
  uint64_t result = sub_6930();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_6930()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t sub_6940()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
}

uint64_t sub_6950()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t sub_6960()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t sub_6970()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t sub_6980()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t sub_6990()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_69A0()
{
  return Hasher.init(_seed:)();
}

void sub_69B0(Swift::UInt a1)
{
}

Swift::Int sub_69C0()
{
  return Hasher._finalize()();
}

uint64_t TUCallTranscriptionSupported()
{
  return _TUCallTranscriptionSupported();
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

void objc_destroyWeak(id *location)
{
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_activeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 activeSpecifier];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
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

id objc_msgSend_configurationProvider(void *a1, const char *a2, ...)
{
  return _[a1 configurationProvider];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEvent];
}

id objc_msgSend_getAvailability(void *a1, const char *a2, ...)
{
  return _[a1 getAvailability];
}

id objc_msgSend_getBooleanFromUserDefaults_default_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBooleanFromUserDefaults:default:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_isCallRecordingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCallRecordingAvailable];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return _[a1 localizationTableName];
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return _[a1 parentListController];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_setActiveSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveSpecifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValueInUserDefaults_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueInUserDefaults:forKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}