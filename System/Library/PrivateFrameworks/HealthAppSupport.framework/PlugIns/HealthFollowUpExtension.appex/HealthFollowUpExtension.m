void sub_100005E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;

  _HKInitializeLogging();
  v5 = (void *)HKLogDefault;
  if (a3)
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = objc_opt_class();
      v8 = *(void *)(a1 + 32);
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@] Successfully cleared follow-up item with identifier %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
  {
    sub_100006F1C(a1, v5);
  }
}

void sub_100005FB4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100005FD4(id a1)
{
  return a1;
}

uint64_t static EmergencyAccessBuddyViewControllerCreator.makeFollowUpViewController(for:healthStore:followUpDelegate:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  id v44 = a3;
  uint64_t v45 = a4;
  uint64_t v6 = sub_100007040();
  uint64_t v42 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006FD0();
  uint64_t v10 = *(void *)(v9 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v12 = (uint64_t *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_100006FF0();
  uint64_t v13 = *(void *)(v43 - 8);
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v39 - v17;
  if (sub_100007050() == a1 && v19 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v40 = v6;
  unint64_t v41 = a2;
  char v21 = sub_1000070F0();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_14:
    sub_100006FE0();
    void *v12 = v45;
    v33 = (unsigned int *)&enum case for EmergencyAccessBuddyFlow.followUpOnboarding(_:);
LABEL_15:
    (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *v33, v9);
    uint64_t v34 = v43;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v43);
    id v35 = objc_allocWithZone((Class)sub_100007010());
    id v36 = v44;
    swift_unknownObjectRetain();
    uint64_t v37 = sub_100007000();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v34);
    return v37;
  }
  if (sub_100007050() == a1 && v22 == v41)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v24 = sub_1000070F0();
  swift_bridgeObjectRelease();
  if (v24)
  {
LABEL_18:
    sub_100006FE0();
    void *v12 = v45;
    v33 = (unsigned int *)&enum case for EmergencyAccessBuddyFlow.followUpReview(_:);
    goto LABEL_15;
  }
  sub_100007020();
  swift_bridgeObjectRetain_n();
  v25 = sub_100007030();
  os_log_type_t v26 = sub_100007070();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = v42;
  if (v27)
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315394;
    uint64_t v30 = sub_100007100();
    uint64_t v46 = sub_100006668(v30, v31, &v47);
    sub_100007080();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    unint64_t v32 = v41;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100006668(a1, v32, &v47);
    sub_100007080();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%s] Received an action identifier that we don't know how to handle: %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v40);
  return 0;
}

id EmergencyAccessBuddyViewControllerCreator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id EmergencyAccessBuddyViewControllerCreator.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmergencyAccessBuddyViewControllerCreator();
  return objc_msgSendSuper2(&v2, "init");
}

id EmergencyAccessBuddyViewControllerCreator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmergencyAccessBuddyViewControllerCreator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006668(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000673C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006D2C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100006D2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006CDC(v12);
  return v7;
}

uint64_t sub_10000673C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100007090();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000068F8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1000070B0();
  if (!v8)
  {
    sub_1000070C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000070D0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000068F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006990(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B6C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006B6C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006990(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100006B08(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000070A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000070C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007060();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000070D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000070C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006B08(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006D88();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006B6C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006D88();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000070D0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EmergencyAccessBuddyViewControllerCreator()
{
  return self;
}

uint64_t sub_100006CDC(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100006D88()
{
  if (!qword_10000C398)
  {
    unint64_t v0 = sub_1000070E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C398);
    }
  }
}

void sub_100006DE4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = sub_100005FD4(v2);
  sub_100005FB4((void *)&_mh_execute_header, v4, v5, "[%@] No view controller found for item with identifier: %@", v6, v7, v8, v9, v10);
}

void sub_100006E80(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = sub_100005FD4(v2);
  sub_100005FB4((void *)&_mh_execute_header, v4, v5, "[%@] Action did not have an accepted identifier for us to process: %@", v6, v7, v8, v9, v10);
}

void sub_100006F1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  sub_100005FB4((void *)&_mh_execute_header, v4, v5, "[%@] Failed to clear follow-up item with identifier %@", v6, v7, v8, v9, 2u);
}

uint64_t sub_100006FD0()
{
  return type metadata accessor for EmergencyAccessBuddyFlow();
}

uint64_t sub_100006FE0()
{
  return EmergencyAccessUserStatus.init(onboardingStatus:isStewieSupported:)();
}

uint64_t sub_100006FF0()
{
  return type metadata accessor for EmergencyAccessUserStatus();
}

uint64_t sub_100007000()
{
  return EmergencyAccessFollowUpStartViewController.init(healthStore:flow:emergencyStatus:)();
}

uint64_t sub_100007010()
{
  return type metadata accessor for EmergencyAccessFollowUpStartViewController();
}

uint64_t sub_100007020()
{
  return static Logger.general.getter();
}

uint64_t sub_100007030()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007040()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007050()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100007060()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007070()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007080()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007090()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000070A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000070B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000070C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000070D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000070E0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_1000070F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007100()
{
  return _typeName(_:qualified:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_actionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifiers];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_clearFollowUpItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFollowUpItemWithIdentifier:");
}

id objc_msgSend_clearPendingFollowUpItemsWithUniqueIdentifiers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return _[a1 finishProcessing];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_makeFollowUpViewControllerFor_healthStore_followUpDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFollowUpViewControllerFor:healthStore:followUpDelegate:");
}

id objc_msgSend_makeHealthStore(void *a1, const char *a2, ...)
{
  return _[a1 makeHealthStore];
}

id objc_msgSend_makeHealthViewControllerToPresent(void *a1, const char *a2, ...)
{
  return _[a1 makeHealthViewControllerToPresent];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}