int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter();
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

uint64_t sub_100004C00(uint64_t a1, uint64_t a2)
{
  return sub_100004D6C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004C18(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100004C90(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004D10@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004D54(uint64_t a1, uint64_t a2)
{
  return sub_100004D6C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004D6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004DB0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004E04()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_100004E78(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100004E80@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100004E94(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100004EC4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100004ED8(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_100004EEC()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_100004F78@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100004F84@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004FF8(uint64_t a1)
{
  uint64_t v2 = sub_100005184((unint64_t *)&qword_1000196D0);
  uint64_t v3 = sub_100005184(&qword_1000196D8);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for Key()
{
  if (!qword_1000196B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000196B0);
    }
  }
}

uint64_t sub_1000050E8()
{
  return sub_100005184(&qword_1000196B8);
}

uint64_t sub_10000511C()
{
  return sub_100005184(&qword_1000196C0);
}

uint64_t sub_100005150()
{
  return sub_100005184(&qword_1000196C8);
}

uint64_t sub_100005184(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_1000051C8()
{
  return MKBGetDeviceLockState() == 0;
}

uint64_t sub_1000051EC()
{
  return _swift_task_switch(sub_100005208, 0, 0);
}

uint64_t sub_100005208()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000052D8;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 1702259052, 0xE400000000000000, sub_1000053F0, 0, &type metadata for Bool);
}

uint64_t sub_1000052D8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000053D4, 0, 0);
}

uint64_t sub_1000053D4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 24));
}

void sub_1000053F0(uint64_t a1)
{
  uint64_t v2 = sub_10000593C(&qword_100019700);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_100005A14;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005580;
  aBlock[3] = &unk_100014888;
  v7 = _Block_copy(aBlock);
  swift_release();
  SBSRequestPasscodeUnlockUI();
  _Block_release(v7);
}

uint64_t sub_100005580(uint64_t a1, int a2)
{
  uint64_t v2 = *(void (**)(BOOL))(a1 + 32);
  BOOL v3 = a2 != 0;
  swift_retain();
  v2(v3);

  return swift_release();
}

uint64_t sub_1000055D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000055F8, 0, 0);
}

uint64_t sub_1000055F8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  BOOL v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *BOOL v3 = v0;
  v3[1] = sub_1000056D8;
  return withCheckedContinuation<A>(isolation:function:_:)(v3, 0, 0, 1702259052, 0xE400000000000000, sub_100005934, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_1000056D8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1000057F0, 0, 0);
}

uint64_t sub_1000057F0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005808()
{
  id v0 = [self defaultWorkspace];
  if (v0)
  {
    uint64_t v2 = v0;
    URL._bridgeToObjectiveC()(v1);
    uint64_t v4 = v3;
    sub_10000593C(&qword_1000196F0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100011570;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v6;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = 1;
    sub_10000EC20(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 openSensitiveURL:v4 withOptions:isa];
  }
  sub_10000593C(&qword_1000196E8);
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100005934()
{
  return sub_100005808();
}

uint64_t sub_10000593C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005980()
{
  uint64_t v1 = sub_10000593C(&qword_100019700);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100005A14()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100005AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005AB0()
{
  return swift_release();
}

uint64_t sub_100005AB8()
{
  return 1;
}

void sub_100005AC4()
{
}

void sub_100005AF0()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView];
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setContentMode:2];
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self imageNamed:v2];

  [v1 setImage:v3];
  id v4 = [v0 contentView];
  [v4 addSubview:v1];
}

void sub_100005BEC()
{
  uint64_t v1 = v0;
  id v2 = [v0 contentView];
  id v3 = [v2 mainContentGuide];

  id v4 = self;
  sub_10000593C(&qword_100019790);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100011580;
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView];
  id v7 = [v6 topAnchor];
  id v8 = [v3 topAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];

  *(void *)(v5 + 32) = v9;
  id v10 = [v6 bottomAnchor];
  id v11 = [v3 bottomAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];

  *(void *)(v5 + 40) = v12;
  id v13 = [v6 leadingAnchor];
  id v14 = [v3 leadingAnchor];
  id v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];

  *(void *)(v5 + 48) = v15;
  id v16 = [v6 trailingAnchor];
  id v17 = [v3 trailingAnchor];
  id v18 = [v16 constraintLessThanOrEqualToAnchor:v17];

  *(void *)(v5 + 56) = v18;
  id v19 = [v6 centerYAnchor];
  id v20 = [v3 centerYAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];

  *(void *)(v5 + 64) = v21;
  id v22 = [v6 centerXAnchor];
  id v23 = [v3 centerXAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];

  *(void *)(v5 + 72) = v24;
  specialized Array._endMutation()();
  sub_100007450(0, &qword_100019798);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];
}

void sub_100005F50()
{
  uint64_t v1 = self;
  id v2 = [v1 mainBundle];
  v3._countAndFlagsBits = 0xD00000000000001DLL;
  v24._object = (void *)0xE000000000000000;
  v3._object = (void *)0x8000000100010A70;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v24._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v24);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v5];

  uint64_t v6 = sub_10000628C(*(void *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo], *(void *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 8], *(void *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 16], *(void *)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo + 24]);
  if (v7)
  {
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    uint64_t v10 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v10 = v6 & 0xFFFFFFFFFFFFLL;
    }
    if (v10)
    {
      id v11 = [v1 mainBundle];
      v25._object = (void *)0xE000000000000000;
      v12._object = (void *)0x8000000100010A90;
      v12._countAndFlagsBits = 0xD000000000000016;
      v13._countAndFlagsBits = 0;
      v13._object = (void *)0xE000000000000000;
      v25._countAndFlagsBits = 0;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v25);

      sub_10000593C(&qword_100019770);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100011570;
      *(void *)(v14 + 56) = &type metadata for String;
      *(void *)(v14 + 64) = sub_1000073A4();
      *(void *)(v14 + 32) = v8;
      *(void *)(v14 + 40) = v9;
      static String.localizedStringWithFormat(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10000593C(&qword_100019780);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100011570;
      *(void *)(inited + 32) = NSForegroundColorAttributeName;
      id v16 = self;
      id v17 = NSForegroundColorAttributeName;
      id v18 = [v16 secondaryLabelColor];
      *(void *)(inited + 64) = sub_100007450(0, &qword_100019788);
      *(void *)(inited + 40) = v18;
      sub_10000ED58(inited);
      id v19 = objc_allocWithZone((Class)NSAttributedString);
      NSString v20 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      type metadata accessor for Key();
      sub_1000073F8();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v22 = [v19 initWithString:v20 attributes:isa];

      [v0 setAttributedSubtitle:v22];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_10000628C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = a3;
    uint64_t v5 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v5) {
      goto LABEL_9;
    }
  }
  if (!a2) {
    return 0;
  }
  uint64_t v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = a1;
  if (!v6) {
    return 0;
  }
LABEL_9:
  swift_bridgeObjectRetain();
  return v4;
}

id sub_100006338()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for FMLostDeviceCardViewController()
{
  return self;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.AssetMetrics()
{
  return &type metadata for FMLostDeviceCardViewController.AssetMetrics;
}

uint64_t initializeBufferWithCopyOfBuffer for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FMLostDeviceCardViewController.LostModeContactInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FMLostDeviceCardViewController.LostModeContactInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FMLostDeviceCardViewController.LostModeContactInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FMLostDeviceCardViewController.LostModeContactInfo(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for FMLostDeviceCardViewController.LostModeContactInfo(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMLostDeviceCardViewController.LostModeContactInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.LostModeContactInfo()
{
  return &type metadata for FMLostDeviceCardViewController.LostModeContactInfo;
}

Swift::Int sub_100006644()
{
  return Hasher._finalize()();
}

Swift::Int sub_100006688()
{
  return Hasher._finalize()();
}

uint64_t sub_1000066C8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_100019708);
  uint64_t v1 = sub_1000075A4(v0, (uint64_t)qword_100019708);
  if (qword_100019608 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000075A4(v0, (uint64_t)qword_100019720);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100006790@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v47 = a5;
  uint64_t v8 = type metadata accessor for URLComponents();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  uint64_t v46 = v9;
  __chkstk_darwin(v8);
  id v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000593C(&qword_1000197A0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  id v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  id v18 = (char *)&v44 - v17;
  __chkstk_darwin(v16);
  NSString v20 = (char *)&v44 - v19;
  uint64_t v21 = type metadata accessor for URLQueryItem();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  Swift::String v24 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v25 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v25 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v25)
  {
    URLComponents.init(string:)();
    URLQueryItem.init(name:value:)();
    uint64_t v26 = v45;
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
    if (!v27(v20, 1, v45))
    {
      sub_10000593C(&qword_1000197A8);
      unint64_t v28 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_100011570;
      (*(void (**)(unint64_t, char *, uint64_t))(v22 + 16))(v29 + v28, v24, v21);
      URLComponents.queryItems.setter();
    }
    if (v27(v20, 1, v26))
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      uint64_t v30 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v47, 1, 1, v30);
    }
    else
    {
      uint64_t v43 = v46;
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v11, v20, v26);
      URLComponents.url.getter();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v26);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    }
    return sub_100007548((uint64_t)v20, &qword_1000197A0);
  }
  else
  {
    if (!a2) {
      goto LABEL_15;
    }
LABEL_12:
    uint64_t v31 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v31 = v44 & 0xFFFFFFFFFFFFLL;
    }
    if (v31)
    {
      sub_10000593C(&qword_100019770);
      uint64_t v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_100011570;
      *(void *)(v32 + 56) = &type metadata for String;
      *(void *)(v32 + 64) = sub_1000073A4();
      *(void *)(v32 + 32) = v44;
      *(void *)(v32 + 40) = a2;
      swift_bridgeObjectRetain();
      String.init(format:_:)();
      URLComponents.init(string:)();
      swift_bridgeObjectRelease();
      sub_10000748C((uint64_t)v18, (uint64_t)v15);
      uint64_t v33 = v45;
      uint64_t v34 = v46;
      int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48))(v15, 1, v45);
      uint64_t v36 = v47;
      if (v35 == 1)
      {
        sub_100007548((uint64_t)v18, &qword_1000197A0);
        sub_100007548((uint64_t)v15, &qword_1000197A0);
        uint64_t v37 = type metadata accessor for URL();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v36, 1, 1, v37);
      }
      else
      {
        URLComponents.url.getter();
        sub_100007548((uint64_t)v18, &qword_1000197A0);
        return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v15, v33);
      }
    }
    else
    {
LABEL_15:
      uint64_t v39 = type metadata accessor for URL();
      v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56);
      uint64_t v41 = v39;
      uint64_t v42 = v47;
      return v40(v42, 1, 1, v41);
    }
  }
}

uint64_t sub_100006D04(uint64_t *a1, uint64_t *a2)
{
  return sub_1000072F0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_100006D20()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_100019720);
  sub_1000075A4(v0, (uint64_t)qword_100019720);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006DA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v9;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_10000F948((uint64_t)v36), (v11 & 1) != 0))
  {
    sub_1000075DC(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  sub_1000074F4((uint64_t)v36);
  if (!*((void *)&v38 + 1))
  {
    swift_bridgeObjectRelease();
    sub_100007548((uint64_t)&v37, &qword_1000197B0);
LABEL_19:
    if (qword_100019600 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1000075A4(v2, (uint64_t)qword_100019708);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v21, v2);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      Swift::String v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "No lost mode device type key, this is an invalid payload", v24, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v13 = v34;
  uint64_t v12 = v35;
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v13 && v14 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_100019600 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_1000075A4(v2, (uint64_t)qword_100019708);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v17, v2);
      id v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        NSString v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Device type did not match", v20, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
  }
  *(void *)&long long v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *((void *)&v37 + 1) = v27;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v28 = sub_10000F948((uint64_t)v36), (v29 & 1) != 0))
  {
    sub_1000075DC(*(void *)(a1 + 56) + 32 * v28, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  sub_1000074F4((uint64_t)v36);
  if (*((void *)&v38 + 1))
  {
    if (swift_dynamicCast()) {
      uint64_t v25 = v34;
    }
    else {
      uint64_t v25 = 0;
    }
  }
  else
  {
    sub_100007548((uint64_t)&v37, &qword_1000197B0);
    uint64_t v25 = 0;
  }
  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v30;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v31 = sub_10000F948((uint64_t)v36), (v32 & 1) != 0))
  {
    sub_1000075DC(*(void *)(a1 + 56) + 32 * v31, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1000074F4((uint64_t)v36);
  if (*((void *)&v38 + 1)) {
    swift_dynamicCast();
  }
  else {
    sub_100007548((uint64_t)&v37, &qword_1000197B0);
  }
  return v25;
}

uint64_t sub_1000072F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2)
  {
    if (a6) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!a6) {
    return 0;
  }
  if (a1 == a5 && a2 == a6 || (v12 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v12 & 1) != 0))
  {
LABEL_8:
    if (a4)
    {
      if (a8 && (a3 == a7 && a4 == a8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
        return 1;
      }
    }
    else if (!a8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_1000073A4()
{
  unint64_t result = qword_100019778;
  if (!qword_100019778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019778);
  }
  return result;
}

unint64_t sub_1000073F8()
{
  unint64_t result = qword_1000196D0;
  if (!qword_1000196D0)
  {
    type metadata accessor for Key();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000196D0);
  }
  return result;
}

uint64_t sub_100007450(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000748C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000593C(&qword_1000197A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000074F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007548(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000593C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000075A4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000075DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100007638(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000076AC()
{
  return 0;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.AssetMetrics.DeviceType()
{
  return &type metadata for FMLostDeviceCardViewController.AssetMetrics.DeviceType;
}

uint64_t _s21FindMyRemoteUIService30FMLostDeviceCardViewControllerC19LostModeContactInfoV10DeviceTypeOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s21FindMyRemoteUIService30FMLostDeviceCardViewControllerC19LostModeContactInfoV10DeviceTypeOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000077B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMLostDeviceCardViewController.LostModeContactInfo.DeviceType()
{
  return &type metadata for FMLostDeviceCardViewController.LostModeContactInfo.DeviceType;
}

unint64_t sub_1000077F0()
{
  unint64_t result = qword_1000197B8;
  if (!qword_1000197B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000197B8);
  }
  return result;
}

unint64_t sub_100007848()
{
  unint64_t result = qword_1000197C0;
  if (!qword_1000197C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000197C0);
  }
  return result;
}

uint64_t _s12DependenciesVwxx()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t _s12DependenciesVwcp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *_s12DependenciesVwca(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 _s12DependenciesVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *_s12DependenciesVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t _s12DependenciesVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s12DependenciesVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s12DependenciesVMa()
{
  return &_s12DependenciesVN;
}

uint64_t sub_100007AD8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_1000197C8);
  uint64_t v1 = sub_1000075A4(v0, (uint64_t)qword_1000197C8);
  if (qword_100019618 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000075A4(v0, (uint64_t)qword_1000197E0);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100007BA0()
{
  sub_10000AFD0(v0, (uint64_t)v4);
  if (!v5)
  {
    _StringGuts.grow(_:)(18);
    unint64_t v2 = 0x8000000100010BD0;
    unint64_t v1 = 0xD000000000000010;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    _StringGuts.grow(_:)(20);
    unint64_t v1 = 0xD000000000000012;
    unint64_t v2 = 0x8000000100010BB0;
LABEL_5:
    String.append(_:)(*(Swift::String *)&v1);
    _print_unlocked<A, B>(_:_:)();
    return 0;
  }
  if (v4[3] | v4[2] | v4[1] | v4[0]) {
    return 0x64656873696E6966;
  }
  else {
    return 0x7472617453746F6ELL;
  }
}

uint64_t sub_100007D08(long long *a1, long long *a2)
{
  sub_10000AFD0(a1, (uint64_t)v4);
  sub_10000AFD0(a2, (uint64_t)v5);
  return sub_10000B474(v4, v5) & 1;
}

uint64_t sub_100007D54()
{
  sub_10000AFD0(v0, (uint64_t)v2);
  return sub_100007BA0();
}

void sub_100007E30(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = a1;
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_10000F948((uint64_t)v21), (v6 & 1) != 0))
  {
    sub_1000075DC(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  sub_1000074F4((uint64_t)v21);
  if (!*((void *)&v23 + 1))
  {
    sub_100007548((uint64_t)&v22, &qword_1000197B0);
    goto LABEL_14;
  }
  sub_10000593C(&qword_1000198A8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    if (qword_100019610 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_1000075A4(v16, (uint64_t)qword_1000197C8);
    char v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_19;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    id v15 = "We neither have user info or a valid value for SPRemoteUILostModeInfoKey.  Bailing";
    goto LABEL_18;
  }
  uint64_t v7 = sub_100006DA4(v20);
  if (v8 == 1)
  {
    if (qword_100019610 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000075A4(v11, (uint64_t)qword_1000197C8);
    char v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_19;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    id v15 = "Lost mode dict is malformed and can't create lost mode info.  Bailing";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v15, v14, 2u);
    swift_slowDealloc();
LABEL_19:

    return;
  }
  uint64_t v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  uint64_t v19 = *(void *)(v2 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8);
  *uint64_t v17 = v7;
  v17[1] = v8;
  v17[2] = v9;
  v17[3] = v10;
  sub_10000B650(v18, v19);
}

uint64_t sub_1000080C4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8);
  if (v2 == 1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v3 = v0;
    uint64_t v4 = *v1;
    uint64_t v6 = v1[2];
    uint64_t v5 = v1[3];
    uint64_t v7 = qword_100019610;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_1000075A4(v8, (uint64_t)qword_1000197C8);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Checking if device is unlocked", v11, 2u);
      swift_slowDealloc();
    }

    char v12 = (*(uint64_t (**)(void))(v3
                               + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies))();
    os_log_type_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v15 = 67109120;
      LODWORD(v18) = v12 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "isUnlocked = %{BOOL}d", v15, 8u);
      swift_slowDealloc();
    }

    if (v12)
    {
      *(void *)&long long v18 = v4;
      char v16 = 1;
    }
    else
    {
      char v16 = 0;
      *(void *)&long long v18 = v4;
    }
    *((void *)&v18 + 1) = v2;
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    char v21 = v16;
    sub_100008338(&v18);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100008338(long long *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = (uint64_t)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
  sub_10000AFD0((long long *)&v1[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state], (uint64_t)v77);
  if (sub_10000B474(v77, a1))
  {
    if (qword_100019610 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_1000075A4(v5, (uint64_t)qword_1000197C8);
    uint64_t v6 = v1;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      v76[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      sub_10000AFD0((long long *)v4, (uint64_t)&aBlock);
      sub_10000B698((uint64_t)&aBlock, (void (*)(void, void, void, void, void))sub_10000AD18);
      uint64_t v10 = sub_100007BA0();
      unint64_t v12 = v11;
      sub_10000B698((uint64_t)&aBlock, (void (*)(void, void, void, void, void))sub_10000AD78);
      uint64_t v71 = sub_10000DB50(v10, v12, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Got a duplicate state %s so bailing", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
LABEL_16:

    return;
  }
  if (qword_100019610 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_1000075A4(v13, (uint64_t)qword_1000197C8);
  os_log_type_t v14 = v1;
  sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD18);
  id v15 = v14;
  sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD18);
  char v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_10000AFD0((long long *)v4, (uint64_t)v76);
    sub_10000B698((uint64_t)v76, (void (*)(void, void, void, void, void))sub_10000AD18);
    uint64_t v19 = sub_100007BA0();
    os_log_type_t type = v17;
    uint64_t v20 = v15;
    unint64_t v22 = v21;
    sub_10000B698((uint64_t)v76, (void (*)(void, void, void, void, void))sub_10000AD78);
    uint64_t v71 = sub_10000DB50(v19, v22, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    id v15 = v20;
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2080;
    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD18);
    uint64_t v23 = sub_100007BA0();
    unint64_t v25 = v24;
    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD78);
    uint64_t v71 = sub_10000DB50(v23, v25, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD78);
    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD78);
    _os_log_impl((void *)&_mh_execute_header, v16, type, "Updating state from %s to state %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD78);
    sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD78);
  }

  uint64_t v26 = *(void *)v4;
  uint64_t v27 = *(void *)(v4 + 8);
  uint64_t v28 = *(void *)(v4 + 16);
  uint64_t v29 = *(void *)(v4 + 24);
  unsigned __int8 v30 = *(unsigned char *)(v4 + 32);
  sub_10000AFD0(a1, v4);
  sub_10000B698((uint64_t)a1, (void (*)(void, void, void, void, void))sub_10000AD18);
  sub_10000AD78(v26, v27, v28, v29, v30);
  sub_10000AFD0(a1, (uint64_t)&v71);
  uint64_t v31 = v71;
  if (v75)
  {
    if (v75 == 1)
    {
      uint64_t v7 = sub_100009638(v71, v72, v73, v74);
      uint64_t v32 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
      uint64_t v33 = *(void **)&v15[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
      if (!v33)
      {
        id v58 = [v15 presentProxCardFlowWithDelegate:v15 initialViewController:v7];
        v59 = *(void **)&v15[v32];
        *(void *)&v15[v32] = v58;

        return;
      }
      [v33 pushViewController:v7 animated:1];
      goto LABEL_16;
    }
    if (v72 | v71 | v73 | v74)
    {
      v55 = *(void **)&v15[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
      if (v55)
      {
        v69 = sub_10000EB38;
        v70 = 0;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v66 = 1107296256;
        v67 = sub_10000B068;
        v68 = &unk_100014B98;
        v56 = _Block_copy(&aBlock);
        id v57 = v55;
        swift_release();
        [v57 dismissViewControllerAnimated:1 completion:v56];
        _Block_release(v56);
      }
    }
  }
  else
  {
    v63 = v15;
    uint64_t v34 = v72;
    uint64_t v35 = v73;
    uint64_t v36 = v74;
    long long v37 = (objc_class *)type metadata accessor for FMLostDeviceCardViewController();
    long long v38 = (char *)objc_allocWithZone(v37);
    uint64_t v39 = (uint64_t *)&v38[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo];
    *uint64_t v39 = v31;
    v39[1] = v34;
    v39[2] = v35;
    v39[3] = v36;
    id v40 = objc_allocWithZone((Class)UIImageView);
    swift_bridgeObjectRetain();
    uint64_t v41 = v38;
    swift_bridgeObjectRetain();
    id v42 = [v40 init];
    *(void *)&v41[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView] = v42;

    v64.receiver = v41;
    v64.super_class = v37;
    id v43 = [super initWithContentView:0];
    sub_100005AF0();
    sub_100005BEC();
    sub_100005F50();
    [v43 setDismissalType:3];
    id v44 = [self mainBundle];
    v78._object = (void *)0xE000000000000000;
    v45._object = (void *)0x8000000100010C70;
    v45._countAndFlagsBits = 0xD000000000000017;
    v46._countAndFlagsBits = 0;
    v46._object = (void *)0xE000000000000000;
    v78._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v45, (Swift::String_optional)0, (NSBundle)v44, v46, v78);

    uint64_t v47 = (void *)swift_allocObject();
    v47[2] = v63;
    v47[3] = v31;
    v47[4] = v34;
    v47[5] = v35;
    v47[6] = v36;
    v47[7] = ObjectType;
    v48 = v63;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v69 = sub_10000B738;
    v70 = v47;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v66 = 1107296256;
    v67 = sub_10000EE88;
    v68 = &unk_100014BE8;
    v50 = _Block_copy(&aBlock);
    id v51 = [self actionWithTitle:v49 style:0 handler:v50];

    _Block_release(v50);
    swift_release();
    id v52 = [v43 addAction:v51];

    uint64_t v53 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
    v54 = *(void **)&v48[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
    if (v54)
    {
      [v54 pushViewController:v43 animated:1];
    }
    else
    {
      id v60 = [v48 presentProxCardFlowWithDelegate:v48 initialViewController:v43];
      v61 = *(void **)&v48[v53];
      *(void *)&v48[v53] = v60;
    }
  }
}

uint64_t sub_100008C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  sub_10000593C(&qword_100019898);
  v5[10] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[15] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[16] = v8;
  v5[17] = v7;
  return _swift_task_switch(sub_100008D9C, v8, v7);
}

uint64_t sub_100008D9C()
{
  uint64_t v31 = v0;
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  sub_100006790(v0[5], v0[6], v0[7], v0[8], v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[10];
    swift_release();
    sub_100007548(v4, &qword_100019898);
    if (qword_100019610 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_1000075A4(v5, (uint64_t)qword_1000197C8);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "No punch out URL to execute", v8, 2u);
      swift_slowDealloc();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[12] + 32))(v0[14], v0[10], v0[11]);
    if (qword_100019610 != -1) {
      swift_once();
    }
    uint64_t v12 = v0[13];
    uint64_t v11 = v0[14];
    uint64_t v13 = v0[11];
    uint64_t v14 = v0[12];
    uint64_t v15 = type metadata accessor for Logger();
    v0[18] = sub_1000075A4(v15, (uint64_t)qword_1000197C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v11, v13);
    char v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v20 = v0[12];
    uint64_t v19 = v0[13];
    uint64_t v21 = v0[11];
    if (v18)
    {
      os_log_type_t type = v17;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 141558275;
      v0[3] = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v22 + 12) = 2081;
      sub_10000BCDC();
      uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[4] = sub_10000DB50(v23, v24, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v25(v19, v21);
      _os_log_impl((void *)&_mh_execute_header, v16, type, "Opening URL %{private,mask.hash}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      unint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v25(v0[13], v0[11]);
    }

    v0[19] = v25;
    uint64_t v29 = (uint64_t (*)(uint64_t))(*(void *)(v0[9]
                                                      + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                                                      + 32)
                                          + **(int **)(v0[9]
                                                     + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                                                     + 32));
    uint64_t v26 = (void *)swift_task_alloc();
    v0[20] = v26;
    *uint64_t v26 = v0;
    v26[1] = sub_100009200;
    uint64_t v27 = v0[14];
    return v29(v27);
  }
}

uint64_t sub_100009200()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_10000944C;
  }
  else {
    uint64_t v5 = sub_10000933C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000933C()
{
  swift_release();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Successfully opened URL", v3, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(void, void))(v0 + 152))(*(void *)(v0 + 112), *(void *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000944C()
{
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Punch out failed with error %@", v3, 0xCu);
    sub_10000593C(&qword_100019860);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();
  (*(void (**)(void, void))(v0 + 152))(*(void *)(v0 + 112), *(void *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

id sub_100009638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (objc_class *)type metadata accessor for FMLostDeviceCardViewController();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  uint64_t v10 = &v9[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_lostModeInfo];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  *((void *)v10 + 2) = a3;
  *((void *)v10 + 3) = a4;
  id v11 = objc_allocWithZone((Class)UIImageView);
  swift_bridgeObjectRetain();
  uint64_t v12 = v9;
  swift_bridgeObjectRetain();
  id v13 = [v11 init];
  *(void *)&v12[OBJC_IVAR____TtC21FindMyRemoteUIService30FMLostDeviceCardViewController_imageView] = v13;

  v26.receiver = v12;
  v26.super_class = v8;
  id v14 = [super initWithContentView:0];
  sub_100005AF0();
  sub_100005BEC();
  sub_100005F50();
  [v14 setDismissalType:3];
  id v15 = [self mainBundle];
  v27._object = (void *)0xE000000000000000;
  v16._object = (void *)0x8000000100010CB0;
  v16._countAndFlagsBits = 0xD00000000000001ELL;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v27._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v27);

  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a3;
  v19[6] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10000BAE8;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000EE88;
  aBlock[3] = &unk_100014CB0;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = [self actionWithTitle:v20 style:0 handler:v21];

  _Block_release(v21);
  swift_release();
  swift_release();
  id v23 = [v14 addAction:v22];

  return v14;
}

uint64_t sub_10000993C()
{
  sub_10000B650(*(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo), *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo + 8));
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 8);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 16);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 24);
  unsigned __int8 v5 = *(unsigned char *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state + 32);

  return sub_10000AD78(v1, v2, v3, v4, v5);
}

uint64_t type metadata accessor for FMLostModeAlertContentViewController()
{
  return self;
}

uint64_t sub_100009A84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = sub_10000593C(&qword_100019838);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  type metadata accessor for MainActor();
  swift_bridgeObjectRetain();
  id v17 = a2;
  swift_bridgeObjectRetain();
  uint64_t v18 = static MainActor.shared.getter();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v17;
  v19[5] = a3;
  v19[6] = a4;
  v19[7] = a5;
  v19[8] = a6;
  v19[9] = a7;
  sub_10000A4F0((uint64_t)v15, (uint64_t)&unk_100019848, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_100009BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[16] = a7;
  v8[17] = a8;
  v8[14] = a5;
  v8[15] = a6;
  v8[13] = a4;
  v8[18] = type metadata accessor for MainActor();
  v8[19] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v8[20] = v10;
  v8[21] = v9;
  return _swift_task_switch(sub_100009C8C, v10, v9);
}

uint64_t sub_100009C8C()
{
  if (qword_100019610 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[22] = sub_1000075A4(v1, (uint64_t)qword_1000197C8);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Attempting to unlock device", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[13];

  uint64_t v8 = (uint64_t (*)(void))(*(void *)(v5
                                     + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                                     + 16)
                         + **(int **)(v5
                                    + OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies
                                    + 16));
  uint64_t v6 = (void *)swift_task_alloc();
  v0[23] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_100009E24;
  return v8();
}

uint64_t sub_100009E24(char a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(unsigned char *)(v4 + 49) = a1;
  *(void *)(v4 + 192) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 168);
  uint64_t v6 = *(void *)(v3 + 160);
  if (v1) {
    uint64_t v7 = sub_10000A334;
  }
  else {
    uint64_t v7 = sub_100009F6C;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100009F6C()
{
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = *(unsigned __int8 *)(v0 + 49);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    *(_DWORD *)(v0 + 52) = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Passcode isUnlocked = %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  if (*(unsigned char *)(v0 + 49) == 1) {
    uint64_t v5 = sub_10000A090;
  }
  else {
    uint64_t v5 = sub_10000A214;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000A090()
{
  *(void *)(v0 + 200) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000A11C, v2, v1);
}

uint64_t sub_10000A11C()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  long long v6 = *(_OWORD *)(v0 + 112);
  swift_release();
  *(_OWORD *)(v0 + 56) = v6;
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 80) = v1;
  *(unsigned char *)(v0 + 88) = 1;
  sub_100008338((long long *)(v0 + 56));
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  return _swift_task_switch(sub_10000A1B4, v3, v4);
}

uint64_t sub_10000A1B4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A214()
{
  *(void *)(v0 + 208) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000A2A0, v2, v1);
}

uint64_t sub_10000A2A0()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  long long v6 = *(_OWORD *)(v0 + 112);
  swift_release();
  *(_OWORD *)(v0 + 16) = v6;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  *(unsigned char *)(v0 + 48) = 0;
  sub_100008338((long long *)(v0 + 16));
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  return _swift_task_switch(sub_10000BD4C, v3, v4);
}

uint64_t sub_10000A334()
{
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 96) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to request for unlock with error %@", v3, 0xCu);
    sub_10000593C(&qword_100019860);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  long long v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000A4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007548(a1, &qword_100019838);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000A69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007548(a1, &qword_100019838);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_10000593C(&qword_100019888);
  return swift_task_create();
}

uint64_t sub_10000A850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_10000593C(&qword_100019838);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  type metadata accessor for MainActor();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v15 = static MainActor.shared.getter();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = a5;
  v16[8] = a6;
  sub_10000A69C((uint64_t)v13, (uint64_t)&unk_100019870, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_10000A9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a1;
  v8[6] = a4;
  type metadata accessor for MainActor();
  v8[11] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  v8[12] = v10;
  v8[13] = v9;
  return _swift_task_switch(sub_10000AA40, v10, v9);
}

uint64_t sub_10000AA40()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 112) = Strong;
  if (Strong)
  {
    os_log_type_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v2;
    *os_log_type_t v2 = v0;
    v2[1] = sub_10000AB54;
    uint64_t v3 = *(void *)(v0 + 72);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v5 = *(void *)(v0 + 64);
    return sub_100008C60(v6, v5, v3, v4);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 40) = *(void *)(v0 + 112) == 0;
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_10000AB54()
{
  uint64_t v1 = *v0;
  os_log_type_t v2 = *(void **)(*v0 + 112);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 104);
  uint64_t v4 = *(void *)(v1 + 96);
  return _swift_task_switch(sub_10000AC94, v4, v3);
}

uint64_t sub_10000AC94()
{
  swift_release();
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 112) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000AD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 1u)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FMLostModeAlertContentViewController.State(uint64_t a1)
{
  return sub_10000AD78(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_10000AD78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 1u)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_10000AD18(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_10000AD18(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_10000AD78(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FMLostModeAlertContentViewController.State(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_10000AD78(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLostModeAlertContentViewController.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FMLostModeAlertContentViewController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10000AF8C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_10000AFA4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMLostModeAlertContentViewController.State()
{
  return &type metadata for FMLostModeAlertContentViewController.State;
}

uint64_t sub_10000AFD0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000AFE8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_1000197E0);
  sub_1000075A4(v0, (uint64_t)qword_1000197E0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000B068(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000B0AC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_10000B188;
  return v6(a1);
}

uint64_t sub_10000B188()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B280(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_10000B360;
  return v5(v2 + 32);
}

uint64_t sub_10000B360()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10000B474(long long *a1, long long *a2)
{
  sub_10000AFD0(a1, (uint64_t)&v15);
  unint64_t v3 = v15;
  if (!v19)
  {
    unint64_t v9 = v16;
    uint64_t v4 = v17;
    uint64_t v6 = v18;
    sub_10000AFD0(a2, (uint64_t)&v12);
    if (v14) {
      return 0;
    }
    uint64_t v7 = v13.i64[1];
    uint64_t v8 = v13.i64[0];
    if (v9)
    {
      if (!v12.i64[1]
        || __PAIR128__(v9, v3) != *(_OWORD *)&v12 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        return 0;
      }
    }
    else if (v12.i64[1])
    {
      return 0;
    }
    if (v6) {
      return v7 && (v4 == v8 && v6 == v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0);
    }
    return !v7;
  }
  if (v19 == 1)
  {
    unint64_t v5 = v16;
    uint64_t v4 = v17;
    uint64_t v6 = v18;
    sub_10000AFD0(a2, (uint64_t)&v12);
    if (v14 != 1) {
      return 0;
    }
    uint64_t v7 = v13.i64[1];
    uint64_t v8 = v13.i64[0];
    if (v5)
    {
      if (!v12.i64[1]
        || __PAIR128__(v5, v3) != *(_OWORD *)&v12 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        return 0;
      }
    }
    else if (v12.i64[1])
    {
      return 0;
    }
    if (v6) {
      return v7 && (v4 == v8 && v6 == v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0);
    }
    return !v7;
  }
  if (v16 | v15 | v17 | v18)
  {
    sub_10000AFD0(a2, (uint64_t)&v12);
    if (v14 != 2 || v12.i64[0] != 1 || v13.i64[0] | v13.i64[1] | v12.i64[1]) {
      return 0;
    }
  }
  else
  {
    sub_10000AFD0(a2, (uint64_t)&v12);
    if (v14 != 2) {
      return 0;
    }
    int8x16_t v10 = vorrq_s8(v12, v13);
    if (vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL))) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_10000B650(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000B698(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10000B6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B6E8()
{
  return swift_release();
}

uint64_t sub_10000B6F0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000B738(uint64_t a1)
{
  return sub_100009A84(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_10000B748()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10000B798(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000B884;
  return sub_100009BE4(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000B884()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B978()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B9B0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000BD34;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100019850 + dword_100019850);
  return v6(a1, v4);
}

uint64_t sub_10000BA68()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BAA0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000BAE8(uint64_t a1)
{
  return sub_10000A850(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_10000BAF8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000BB48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_10000BD34;
  return sub_10000A9A0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000BC24(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B884;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100019878 + dword_100019878);
  return v6(a1, v4);
}

unint64_t sub_10000BCDC()
{
  unint64_t result = qword_1000198A0;
  if (!qword_1000198A0)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000198A0);
  }
  return result;
}

uint64_t sub_10000BD50()
{
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10000D9E8((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_10000593C(&qword_1000199E0);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000DA50((uint64_t)v4);
    return 0;
  }
}

uint64_t sub_10000BE0C(uint64_t a1)
{
  return sub_10000CF54(a1, qword_1000198B0, &qword_100019630, (uint64_t)qword_10001A3F8);
}

void sub_10000BE38(void *a1, void (*a2)(void))
{
  uint64_t v3 = v2;
  if (qword_100019620 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000075A4(v6, (uint64_t)qword_1000198B0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "configure(with context:, completion:) being called", v9, 2u);
    swift_slowDealloc();
  }

  if ([v3 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v33, 0, sizeof(v33));
  }
  sub_10000D9E8((uint64_t)v33, (uint64_t)v34);
  if (v34[3])
  {
    sub_10000593C(&qword_1000199E0);
    if (swift_dynamicCast())
    {
      [v32 setAllowsAlertStacking:1];
      if (a1)
      {
        id v10 = a1;
        sub_10000BD50();
        type metadata accessor for FMRemoteUIAlertServiceConfigurationContext();
        swift_allocObject();
        uint64_t v11 = v3;
        uint64_t v12 = sub_10000D01C(v10, v3);
        if (v12)
        {
          uint64_t v13 = v12;
          *(void *)&v11[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = v12;
          swift_retain();
          swift_release();
          if (*(unsigned char *)(v13 + 16))
          {
            char v14 = (objc_class *)type metadata accessor for FMLostModeAlertContentViewController();
            unint64_t v15 = (char *)objc_allocWithZone(v14);
            unint64_t v16 = &v15[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_lostModeInfo];
            *(_OWORD *)unint64_t v16 = xmmword_100011710;
            *((void *)v16 + 2) = 0;
            *((void *)v16 + 3) = 0;
            uint64_t v17 = &v15[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_state];
            *(_OWORD *)uint64_t v17 = 0u;
            *((_OWORD *)v17 + 1) = 0u;
            v17[32] = 2;
            uint64_t v18 = (BOOL (**)())&v15[OBJC_IVAR____TtC21FindMyRemoteUIService36FMLostModeAlertContentViewController_dependencies];
            *uint64_t v18 = sub_1000051C8;
            v18[1] = 0;
            v18[2] = (BOOL (*)())&unk_1000196F8;
            v18[3] = 0;
            v18[4] = (BOOL (*)())&unk_1000196E0;
            v18[5] = 0;
            v31.receiver = v15;
            v31.super_class = v14;
            [super initWithNibName:0 bundle:0];
          }
          else
          {
            type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
            id v19 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
          }
          objc_super v26 = v19;
          swift_getObjectType();
          v34[0] = v26;
          id v27 = v26;
          sub_10000E6E0();

          uint64_t v28 = &v11[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
          uint64_t v29 = *(void **)&v11[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
          *(void *)uint64_t v28 = v27;
          *((void *)v28 + 1) = &off_100014E08;
          id v30 = v27;

          sub_10000C2C8();
          if (a2) {
            a2();
          }
          swift_unknownObjectRelease();
          swift_release();

          return;
        }
        id v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v23, v24))
        {
          unint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unable to create a context", v25, 2u);
          swift_slowDealloc();
        }

        if (a2)
        {
          a2();
          swift_unknownObjectRelease();
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
  }
  else
  {
    sub_10000DA50((uint64_t)v34);
  }
  NSString v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "No remote view controller proxy", v22, 2u);
    swift_slowDealloc();
  }
}

void sub_10000C2C8()
{
  if (![v0 isViewLoaded]) {
    return;
  }
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
  if (!v1) {
    return;
  }
  id v2 = v1;
  id v3 = [v0 childViewControllers];
  sub_10000D950();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v21 = v2;
  LOBYTE(v2) = sub_10000C77C((uint64_t)v21, v4);
  swift_bridgeObjectRelease();

  if ((v2 & 1) == 0)
  {
    id v5 = [v0 view];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [v21 view];
      if (v7)
      {
        os_log_type_t v8 = v7;
        [v6 addSubview:v7];

        id v9 = [v21 view];
        if (v9)
        {
          id v10 = v9;
          id v11 = [v0 view];
          if (v11)
          {
            uint64_t v12 = v11;
            [v11 bounds];
            double v14 = v13;
            double v16 = v15;
            double v18 = v17;
            double v20 = v19;

            [v10 setFrame:v14, v16, v18, v20];
            [v0 addChildViewController:v21];
            [v21 didMoveToParentViewController:v0];
            goto LABEL_9;
          }
LABEL_16:
          __break(1u);
          return;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_9:
}

uint64_t sub_10000C77C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_5:
      uint64_t v6 = v5;
      sub_10000D950();
      char v7 = static NSObject.== infix(_:_:)();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = static NSObject.== infix(_:_:)();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = static NSObject.== infix(_:_:)();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_10000C8F4()
{
  v14.receiver = v0;
  v14.super_class = (Class)swift_getObjectType();
  [super viewDidLayoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
  if (v1)
  {
    id v2 = [v1 view];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [v0 view];
      if (v4)
      {
        id v5 = v4;
        [v4 bounds];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;

        [v3 setFrame:v7, v9, v11, v13];
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t type metadata accessor for FMRemoteUIAlertServiceViewController()
{
  return self;
}

uint64_t sub_10000CBF0(char a1)
{
  if (a1) {
    return 0x65646F4D74736F6CLL;
  }
  else {
    return 0x556579656B776168;
  }
}

uint64_t sub_10000CC34(char *a1, char *a2)
{
  return sub_10000CC40(*a1, *a2);
}

uint64_t sub_10000CC40(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65646F4D74736F6CLL;
  }
  else {
    uint64_t v3 = 0x556579656B776168;
  }
  if (v2) {
    unint64_t v4 = 0xED00006C6C657370;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65646F4D74736F6CLL;
  }
  else {
    uint64_t v5 = 0x556579656B776168;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xED00006C6C657370;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10000CCF0()
{
  return sub_10000CCF8();
}

Swift::Int sub_10000CCF8()
{
  return Hasher._finalize()();
}

uint64_t sub_10000CD88()
{
  return sub_10000CD90();
}

uint64_t sub_10000CD90()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000CE08()
{
  return sub_10000CE10();
}

Swift::Int sub_10000CE10()
{
  return Hasher._finalize()();
}

uint64_t sub_10000CE9C@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000147E8, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_10000CEFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000CBF0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000CF28(uint64_t a1)
{
  return sub_10000CF54(a1, qword_1000198C8, &qword_100019638, (uint64_t)qword_10001A410);
}

uint64_t sub_10000CF54(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  sub_100007638(v7, a2);
  uint64_t v8 = sub_1000075A4(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1000075A4(v7, a4);
  double v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v10(v8, v9, v7);
}

uint64_t sub_10000D01C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + 40;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v7 = [a1 userInfo];
  if (!v7)
  {
    long long v32 = 0u;
    long long v33 = 0u;
LABEL_12:
    sub_10000DA50((uint64_t)&v32);
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_10000F948((uint64_t)v31), (v11 & 1) != 0))
  {
    sub_1000075DC(*(void *)(v9 + 56) + 32 * v10, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }
  sub_1000074F4((uint64_t)v31);
  swift_bridgeObjectRelease();
  if (!*((void *)&v33 + 1)) {
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    if (qword_100019628 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_1000075A4(v15, (uint64_t)qword_1000198C8);
    double v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      double v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "No alert type as string specified", v18, 2u);
      swift_slowDealloc();
    }

    swift_unknownObjectRelease();
    goto LABEL_18;
  }
  id v30 = a2;
  uint64_t v12 = v31[0];
  unint64_t v13 = v31[1];
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() != v12 || v14 != v13)
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_21;
    }
    if (v12 == 0x2D6579656B776168 && v13 == 0xEE006C6C65737075
      || (uint64_t v29 = v12, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      char v21 = 0;
      goto LABEL_26;
    }
    if (qword_100019628 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_1000075A4(v25, (uint64_t)qword_1000198C8);
    swift_bridgeObjectRetain();
    objc_super v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      v31[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v32 = sub_10000DB50(v29, v13, v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Alert type is not supported %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_unknownObjectRelease();

LABEL_18:
    swift_unknownObjectWeakDestroy();
    sub_10000D928(v6);
    swift_deallocPartialClassInstance();
    return 0;
  }
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  char v21 = 1;
LABEL_26:
  *(unsigned char *)(v3 + 16) = v21;
  id v22 = [a1 userInfo];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {

    uint64_t v24 = 0;
  }
  *(void *)(v3 + 24) = v24;
  swift_unknownObjectWeakAssign();

  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_10000D5B4()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  sub_10000D928(v0 + 40);

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for FMRemoteUIAlertServiceConfigurationContext()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for FMRemoteUIAlertServiceConfigurationContext.ServiceType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMRemoteUIAlertServiceConfigurationContext.ServiceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMRemoteUIAlertServiceConfigurationContext.ServiceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000D788);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000D7B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000D7B8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FMRemoteUIAlertServiceConfigurationContext.ServiceType()
{
  return &type metadata for FMRemoteUIAlertServiceConfigurationContext.ServiceType;
}

unint64_t sub_10000D7D8()
{
  unint64_t result = qword_1000199D0;
  if (!qword_1000199D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000199D0);
  }
  return result;
}

uint64_t sub_10000D82C(uint64_t a1)
{
  return sub_10000D874(a1, qword_10001A3F8);
}

uint64_t sub_10000D850(uint64_t a1)
{
  return sub_10000D874(a1, qword_10001A410);
}

uint64_t sub_10000D874(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100007638(v3, a2);
  sub_1000075A4(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D8EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000D928(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000D950()
{
  unint64_t result = qword_1000199D8;
  if (!qword_1000199D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000199D8);
  }
  return result;
}

uint64_t sub_10000D990(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000D9A0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D9D8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000D9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000593C(&qword_1000197B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DA50(uint64_t a1)
{
  uint64_t v2 = sub_10000593C(&qword_1000197B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DAB0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000DAD8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000DB50(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000DB50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000DC24(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000075DC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000075DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E1B8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000DC24(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000DDE0(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000DDE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000DE78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E058(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E058(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000DE78(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000DFF0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000DFF0(uint64_t a1, uint64_t a2)
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
  sub_10000593C(&qword_1000199E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  long long v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E058(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000593C(&qword_1000199E8);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_10000E1A8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000E1B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000E214(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = a1;
  swift_retain();

  return swift_release();
}

uint64_t sub_10000E258()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_1000199F0);
  uint64_t v1 = sub_1000075A4(v0, (uint64_t)qword_1000199F0);
  if (qword_100019648 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000075A4(v0, (uint64_t)qword_10001A428);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10000E320()
{
}

uint64_t sub_10000E37C(char a1)
{
  uint64_t v2 = v1;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  [super viewDidAppear:a1 & 1];
  if (qword_100019640 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000075A4(v4, (uint64_t)qword_1000199F0);
  size_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "View did appear, calling presentFlow()", v7, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x98))();
}

id sub_10000E63C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  [super dealloc];
}

uint64_t type metadata accessor for FMRemoteUIPRXFlowContentViewController()
{
  return self;
}

uint64_t sub_10000E6E0()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **v0) + 0x90))();
}

void sub_10000E734()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context))
  {
    uint64_t v1 = qword_100019640;
    swift_retain();
    if (v1 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_1000075A4(v2, (uint64_t)qword_1000199F0);
    unint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      size_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)size_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Prox card flow dismissed. Requesting host to deactivate.", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      [Strong deactivate];
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    if (qword_100019640 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000075A4(v7, (uint64_t)qword_1000199F0);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      objc_super v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Trying to dismiss PRX flow with a nil context. This is not possible.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000EAA8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007638(v0, qword_10001A428);
  sub_1000075A4(v0, (uint64_t)qword_10001A428);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000EB28(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_10000EB38()
{
  if (qword_100019640 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000075A4(v0, (uint64_t)qword_1000199F0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Successfully dismissed PRX flow", v2, 2u);
    swift_slowDealloc();
  }
}

unint64_t sub_10000EC20(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000593C(&qword_100019B30);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  unint64_t v3 = (void *)v2;
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
    sub_10000FF38(v6, (uint64_t)&v15, &qword_100019B38);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000F83C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    size_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *size_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000FECC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
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

unint64_t sub_10000ED58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000593C(&qword_100019B40);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  unint64_t v3 = (void *)v2;
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
    sub_10000FF38(v6, (uint64_t)&v13, &qword_100019B48);
    uint64_t v7 = v13;
    unint64_t result = sub_10000F8B4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000FECC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v12;
    v6 += 40;
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

void sub_10000EE88(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000EEF0()
{
  uint64_t ObjectType = swift_getObjectType();
  id v1 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  [v1 setDismissalType:3];
  uint64_t v2 = self;
  id v3 = v1;
  id v4 = [v2 mainBundle];
  v5._countAndFlagsBits = 0xD000000000000026;
  v45._object = (void *)0xE000000000000000;
  v5._object = (void *)0x8000000100011250;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v45);

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 setTitle:v7];

  id v8 = [v2 mainBundle];
  v46._object = (void *)0xE000000000000000;
  v9._object = (void *)0x8000000100011280;
  v9._countAndFlagsBits = 0xD000000000000029;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v46._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v46);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 setBodyText:v11];

  id v12 = sub_10000FCB0();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_10000593C(&qword_100019790);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1000119E0;
    *(void *)(v14 + 32) = v13;
    uint64_t aBlock = (void **)v14;
    specialized Array._endMutation()();
    sub_10000FE8C();
    id v15 = v13;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v3 setImages:isa];
  }
  id v17 = [v2 mainBundle];
  v47._object = (void *)0xE000000000000000;
  v18._object = (void *)0x80000001000112B0;
  v18._countAndFlagsBits = 0xD000000000000029;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v47._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v47);

  id v20 = [v2 mainBundle];
  v21._countAndFlagsBits = 0xD000000000000027;
  v48._object = (void *)0xE000000000000000;
  v21._object = (void *)0x80000001000112E0;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v48._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v48);

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = ObjectType;
  swift_retain();
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v43 = sub_10000FE64;
  uint64_t v44 = v24;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v40 = 1107296256;
  uint64_t v41 = sub_10000EE88;
  id v42 = &unk_100014E68;
  objc_super v26 = _Block_copy(&aBlock);
  os_log_type_t v27 = self;
  id v37 = [v27 actionWithTitle:v25 style:0 handler:v26];

  _Block_release(v26);
  swift_release();
  swift_release();
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v43 = sub_10000FE84;
  uint64_t v44 = v28;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v40 = 1107296256;
  uint64_t v41 = sub_10000EE88;
  id v42 = &unk_100014E90;
  id v30 = _Block_copy(&aBlock);
  id v31 = [v27 actionWithTitle:v29 style:1 handler:v30];

  _Block_release(v30);
  swift_release();
  swift_release();

  uint64_t v32 = OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController;
  long long v33 = *(void **)&v38[OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController];
  if (v33)
  {
    [v33 pushViewController:v3 animated:1];
  }
  else
  {
    id v34 = v3;
    id v35 = [v38 presentProxCardFlowWithDelegate:v38 initialViewController:v34];
    uint64_t v36 = *(void **)&v38[v32];
    *(void *)&v38[v32] = v35;

    id v31 = v36;
  }
}

void sub_10000F4A8()
{
  uint64_t v0 = sub_10000593C(&qword_100019898);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = [self defaultWorkspace];
  if (v3)
  {
    id v4 = v3;
    URL.init(string:)();
    uint64_t v5 = type metadata accessor for URL();
    uint64_t v6 = *(void *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
    {
      __break(1u);
      return;
    }
    URL._bridgeToObjectiveC()(v7);
    Swift::String v9 = v8;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v2, v5);
    sub_10000EC20((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v4 openSensitiveURL:v9 withOptions:isa];
  }
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v12 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_10000F694()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
  }
}

id sub_10000F7E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for FMRemoteUIHawkeyeUpsellContentViewController()
{
  return self;
}

unint64_t sub_10000F83C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000F98C(a1, a2, v4);
}

unint64_t sub_10000F8B4(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_10000FA70(a1, v2);
}

unint64_t sub_10000F948(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000FBE8(a1, v4);
}

unint64_t sub_10000F98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    Swift::String v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000FA70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_10000FBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000FEDC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000074F4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_10000FCB0()
{
  id v0 = objc_allocWithZone((Class)ISIcon);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithBundleIdentifier:v1];

  id v3 = [self imageDescriptorNamed:kISImageDescriptorHomeScreen];
  id v4 = [v2 imageForImageDescriptor:v3];
  id result = [v4 CGImage];
  if (result)
  {
    char v6 = result;
    [v4 scale];
    id v8 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v6 scale:0 orientation:v7];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000FDF4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000FE2C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000FE64()
{
}

uint64_t sub_10000FE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000FE7C()
{
  return swift_release();
}

void sub_10000FE84()
{
}

unint64_t sub_10000FE8C()
{
  unint64_t result = qword_100019B28;
  if (!qword_100019B28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100019B28);
  }
  return result;
}

_OWORD *sub_10000FECC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000FEDC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000FF38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000593C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FFA4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return _SBSRequestPasscodeUnlockUI();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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
  return [super a2];
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}