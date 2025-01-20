id sub_1D98()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of ActionButtonSettings.rootTintColor()
{
  return 0;
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

Swift::Void __swiftcall ActionButtonSettings.viewDidLoad()()
{
  v1 = v0;
  v21.super_class = (Class)ActionButtonSettings;
  objc_msgSendSuper2(&v21, "viewDidLoad");
  id v2 = objc_allocWithZone((Class)sub_36A0());
  v3 = (void *)sub_3690();
  id v4 = [v1 view];
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  id v6 = [v3 view];
  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v7 = v6;
  [v5 addSubview:v6];

  id v8 = [v3 view];
  if (!v8)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v9 = v8;
  id v10 = [v1 view];
  if (!v10)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v11 = v10;
  [v10 bounds];
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v13, v15);
  id v16 = [v3 view];
  if (!v16)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v17 = v16;
  [v16 setAutoresizingMask:18];

  id v18 = [v3 view];
  if (v18)
  {
    v19 = v18;
    NSString v20 = sub_3700();
    [v19 setAccessibilityIdentifier:v20];

    [v1 addChildViewController:v3];
    [v3 didMoveToParentViewController:v1];

    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_2024()
{
  uint64_t v0 = sub_36B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = sub_36E0();
  uint64_t v4 = *(void *)(v14[0] - 8);
  __chkstk_darwin();
  id v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_32FC(0, &qword_8350);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.userInteractive(_:), v7);
  v11 = (void *)sub_3760();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  aBlock[4] = sub_2340;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_261C;
  aBlock[3] = &unk_4388;
  double v12 = _Block_copy(aBlock);
  sub_36D0();
  v14[1] = &_swiftEmptyArrayStorage;
  sub_3350();
  sub_3244(&qword_8360);
  sub_33A8();
  sub_3770();
  sub_3750();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, void))(v4 + 8))(v6, v14[0]);
}

void sub_2340()
{
  sub_3244(&qword_8308);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v10 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v2 = [self defaultWorkspace];
  if (v2)
  {
    v3 = v2;
    sub_3640();
    uint64_t v4 = sub_3650();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v7 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v1, 1, v4) != 1)
    {
      sub_3620(v6);
      uint64_t v7 = v8;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v1, v4);
    }
    sub_24F0((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_36F0().super.isa;
    swift_bridgeObjectRelease();
    [v3 openSensitiveURL:v7 withOptions:isa];
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_24F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3244(&qword_8370);
  uint64_t v2 = sub_37A0();
  v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_34C4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_344C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_352C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_261C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_26A8()
{
  id v1 = [v0 rootController];
  if (!v1)
  {
    id v6 = [v0 navigationController];
    if (v6)
    {
      uint64_t v2 = v6;
      id v5 = [v6 navigationBar];
      goto LABEL_6;
    }
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = [v1 navigationController];
  if (!v3)
  {

    return 0;
  }
  uint64_t v4 = v3;
  id v5 = [v3 navigationBar];

LABEL_6:
  return v5;
}

Swift::Void __swiftcall ActionButtonSettings.viewWillAppear(_:)(Swift::Bool a1)
{
  v8.super_class = (Class)ActionButtonSettings;
  objc_msgSendSuper2(&v8, "viewWillAppear:", a1);
  id v2 = sub_26A8();
  id v3 = [v2 tintColor];

  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___ActionButtonSettings_rootTintColor);
  *(void *)(v1 + OBJC_IVAR___ActionButtonSettings_rootTintColor) = v3;

  id v5 = sub_26A8();
  if (v5)
  {
    id v6 = v5;
    id v7 = [self whiteColor];
    [v6 setTintColor:v7];
  }
}

Swift::Void __swiftcall ActionButtonSettings.viewWillDisappear(_:)(Swift::Bool a1)
{
  v7.super_class = (Class)ActionButtonSettings;
  objc_msgSendSuper2(&v7, "viewWillDisappear:", a1);
  id v2 = sub_26A8();
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void **)(v1 + OBJC_IVAR___ActionButtonSettings_rootTintColor);
    if (v4)
    {
      id v5 = *(id *)(v1 + OBJC_IVAR___ActionButtonSettings_rootTintColor);
    }
    else
    {
      id v5 = [self systemBlueColor];
      uint64_t v4 = 0;
    }
    id v6 = v4;
    [v3 setTintColor:v5];
  }
}

Swift::Void __swiftcall ActionButtonSettings.viewDidAppear(_:)(Swift::Bool a1)
{
  uint64_t v34 = sub_3680();
  uint64_t v3 = *(void *)(v34 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3244(&qword_8308);
  ((void (*)(void))__chkstk_darwin)();
  objc_super v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3650();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v33 - v13;
  v35.receiver = v1;
  v35.super_class = (Class)ActionButtonSettings;
  objc_msgSendSuper2(&v35, "viewDidAppear:", a1);
  sub_3640();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_3288((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    uint64_t v15 = sub_3670();
    type metadata accessor for ActionButtonSettings(v15);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v17 = [self bundleForClass:ObjCClassFromMetadata];
    id v18 = [v17 bundleURL];

    sub_3630();
    id v19 = objc_allocWithZone((Class)_NSLocalizedStringResource);
    NSString v20 = sub_3700();
    id v33 = v1;
    objc_super v21 = v20;
    Class isa = sub_3660().super.isa;
    sub_3620(v23);
    v25 = v24;
    id v26 = [v19 initWithKey:v21 table:0 locale:isa bundleURL:v24];

    v27 = *(void (**)(char *, uint64_t))(v9 + 8);
    v27(v12, v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v34);
    NSString v28 = sub_3700();
    sub_32FC(0, &qword_8310);
    Class v29 = sub_3730().super.isa;
    sub_3620(v30);
    v32 = v31;
    objc_msgSend(v33, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v28, v26, v29, v31);

    v27(v14, v8);
  }
}

Swift::Void __swiftcall ActionButtonSettings.viewDidDisappear(_:)(Swift::Bool a1)
{
  id v2 = v1;
  v11.receiver = v2;
  v11.super_class = (Class)ActionButtonSettings;
  objc_msgSendSuper2(&v11, "viewDidDisappear:", a1);
  id v4 = [v2 childViewControllers];
  sub_32FC(0, &qword_8318);
  unint64_t v5 = sub_3740();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_3790();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_10;
  }
LABEL_3:
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    BOOL v8 = a1;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_3780();
      }
      else {
        id v9 = *(id *)(v5 + 8 * v7 + 32);
      }
      uint64_t v10 = v9;
      ++v7;
      [v9 viewDidDisappear:v8];
    }
    while (v6 != v7);
    goto LABEL_10;
  }
  __break(1u);
}

void __swiftcall ActionButtonSettings.init(nibName:bundle:)(ActionButtonSettings *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_3700();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id ActionButtonSettings.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___ActionButtonSettings_rootTintColor] = 0;
  if (a2)
  {
    NSString v5 = sub_3700();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)ActionButtonSettings;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall ActionButtonSettings.init(coder:)(ActionButtonSettings_optional *__return_ptr retstr, NSCoder coder)
{
}

id ActionButtonSettings.init(coder:)(void *a1)
{
  *(void *)(v1 + OBJC_IVAR___ActionButtonSettings_rootTintColor) = 0;
  v5.super_class = (Class)ActionButtonSettings;
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

uint64_t sub_3244(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3288(uint64_t a1)
{
  uint64_t v2 = sub_3244(&qword_8308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ActionButtonSettings(uint64_t a1)
{
  return sub_32FC(a1, &qword_8348);
}

uint64_t sub_32FC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_3338(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_3348()
{
  return swift_release();
}

unint64_t sub_3350()
{
  unint64_t result = qword_8358;
  if (!qword_8358)
  {
    sub_36B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8358);
  }
  return result;
}

unint64_t sub_33A8()
{
  unint64_t result = qword_8368;
  if (!qword_8368)
  {
    sub_3404(&qword_8360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8368);
  }
  return result;
}

uint64_t sub_3404(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_344C(uint64_t a1, uint64_t a2)
{
  sub_37C0();
  sub_3720();
  Swift::Int v4 = sub_37D0();

  return sub_353C(a1, a2, v4);
}

uint64_t sub_34C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3244(&qword_8378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_352C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_353C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_37B0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_37B0() & 1) == 0);
    }
  }
  return v6;
}

void sub_3620(NSURL *retstr@<X8>)
{
}

uint64_t sub_3630()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3640()
{
  return URL.init(string:)();
}

uint64_t sub_3650()
{
  return type metadata accessor for URL();
}

NSLocale sub_3660()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_3670()
{
  return static Locale.current.getter();
}

uint64_t sub_3680()
{
  return type metadata accessor for Locale();
}

uint64_t sub_3690()
{
  return ConfigurationViewController.init(mode:dismissHandler:)();
}

uint64_t sub_36A0()
{
  return type metadata accessor for ConfigurationViewController();
}

uint64_t sub_36B0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_36C0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_36D0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_36E0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_36F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_3700()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3710()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3720()
{
  return String.hash(into:)();
}

NSArray sub_3730()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_3740()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3750()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_3760()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_3770()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_3780()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_3790()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_37A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_37B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_37C0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_37D0()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}