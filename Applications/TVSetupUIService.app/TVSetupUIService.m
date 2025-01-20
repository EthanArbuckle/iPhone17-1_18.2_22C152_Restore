void sub_100002E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100002EAC(uint64_t a1)
{
  sub_100002F04();
  Class result = objc_getClass("TVRViewServiceConfigContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100011FE0();
  }
  qword_10001E810 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100002F04()
{
  v1[0] = 0;
  if (!qword_10001E818)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100003000;
    v1[4] = &unk_100018790;
    v1[5] = v1;
    long long v2 = off_100018778;
    uint64_t v3 = 0;
    qword_10001E818 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10001E818)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100003000()
{
  uint64_t result = _sl_dlopen();
  qword_10001E818 = result;
  return result;
}

Class sub_100003074(uint64_t a1)
{
  sub_100002F04();
  Class result = objc_getClass("TVRViewServiceManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100012008();
  }
  qword_10001E820 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000030CC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005B94(v0, qword_10001E830);
  uint64_t v1 = sub_100005818(v0, (uint64_t)qword_10001E830);
  uint64_t v2 = sub_100006384();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100003158()
{
  return 0;
}

uint64_t sub_100003164()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_1000031B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_100003220(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_1000032A8;
}

void sub_1000032A8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_100003330()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_100003388(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1000033E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100003444()
{
  return 256;
}

uint64_t sub_100003454()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode);
  swift_beginAccess();
  return *v1 | (v1[1] << 8);
}

uint64_t sub_1000034A4(__int16 a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  v3[1] = HIBYTE(a1) & 1;
  return result;
}

uint64_t (*sub_1000034F8())()
{
  return j__swift_endAccess;
}

uint64_t sub_100003558()
{
  return 0;
}

void sub_100003560()
{
  uint64_t v1 = v0;
  v46.receiver = v0;
  v46.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  [super viewDidLoad];
  sub_10001128C(0x415F50555F544553, (void *)0xEF56545F454C5050);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v2];

  [v1 setDismissalType:3];
  sub_10001128C(0x50555F544553, (void *)0xE600000000000000);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v44 = sub_100004EC4;
  uint64_t v45 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003C94;
  v43 = &unk_1000188C8;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = [self actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();

  if (((*(uint64_t (**)(void))((swift_isaMask & *v1) + 0xA0))() & 0x100) == 0) {
    sub_100007DD4();
  }
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v40 = [self imageNamed:v7];

  id v8 = [objc_allocWithZone((Class)UIImageView) initWithImage:v40];
  [v8 setContentMode:1];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [v1 contentView];
  [v9 addSubview:v8];

  sub_1000050B8(0, (unint64_t *)&qword_10001E378);
  v43 = (void *)sub_1000050B8(0, &qword_10001E380);
  v41[3] = v43;
  aBlock[0] = v8;
  v41[0] = v8;
  id v10 = v8;
  [v10 frame];
  double v12 = v11;
  [v10 frame];
  id v14 = sub_100003CFC(aBlock, 7, 0, v41, 8, v12 / v13, 0.0);
  [v10 addConstraint:v14];

  id v39 = self;
  sub_1000050F4(&qword_10001E388);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100012CF0;
  id v16 = [v10 centerXAnchor];
  id v17 = [v1 contentView];
  id v18 = [v17 mainContentGuide];

  id v19 = [v18 centerXAnchor];
  id v20 = [v16 constraintEqualToAnchor:v19];

  *(void *)(v15 + 32) = v20;
  id v21 = [v10 centerYAnchor];
  id v22 = [v1 contentView];
  id v23 = [v22 mainContentGuide];

  id v24 = [v23 centerYAnchor];
  id v25 = [v21 constraintEqualToAnchor:v24];

  *(void *)(v15 + 40) = v25;
  id v26 = [v10 topAnchor];
  id v27 = [v1 contentView];
  id v28 = [v27 mainContentGuide];

  id v29 = [v28 topAnchor];
  id v30 = [v26 constraintGreaterThanOrEqualToAnchor:v29];

  *(void *)(v15 + 48) = v30;
  id v31 = [v10 bottomAnchor];
  id v32 = [v1 contentView];
  id v33 = [v32 mainContentGuide];

  id v34 = [v33 bottomAnchor];
  id v35 = [v31 constraintLessThanOrEqualToAnchor:v34];

  *(void *)(v15 + 56) = v35;
  id v36 = [v10 heightAnchor];
  id v37 = [v36 constraintEqualToConstant:75.0];

  *(void *)(v15 + 64) = v37;
  aBlock[0] = v15;
  specialized Array._endMutation()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v39 activateConstraints:isa];
}

uint64_t type metadata accessor for TVSetupStartViewController()
{
  return self;
}

void sub_100003C94(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100003CFC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_100005BF8(a1, a1[3]);
  uint64_t v14 = _bridgeAnythingToObjectiveC<A>(_:)();
  uint64_t v15 = a4[3];
  if (v15)
  {
    id v16 = sub_100005BF8(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16, v16);
    id v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_100005B40((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_100005B40((uint64_t)a1);
  return v22;
}

void sub_100003F18(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  [super viewWillAppear:a1 & 1];
  id v3 = [self defaultCenter];
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [self mainQueue];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_100005138;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100004B5C;
  v9[3] = &unk_1000188F0;
  NSString v7 = _Block_copy(v9);
  swift_release();
  id v8 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v7];
  _Block_release(v7);
  swift_unknownObjectRelease();
}

void sub_1000040B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  NSString v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v5, v8);
  double v11 = (char *)&v63 - v10;
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v63 - v13;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v16 = (void *)Strong;
    if (qword_10001E828 != -1) {
      swift_once();
    }
    v73 = v7;
    uint64_t v17 = type metadata accessor for Logger();
    uint64_t v18 = sub_100005818(v17, (uint64_t)qword_10001E830);
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19(v14, a1, v2);
    v70 = v19;
    v19(v11, a1, v2);
    uint64_t v71 = v18;
    id v20 = Logger.logObject.getter();
    int v21 = static os_log_type_t.default.getter();
    BOOL v22 = os_log_type_enabled(v20, (os_log_type_t)v21);
    uint64_t v69 = v3;
    if (v22)
    {
      int v65 = v21;
      os_log_t v66 = v20;
      uint64_t v67 = a1;
      v68 = v16;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      v76[0] = v64;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v24 = (void *)Notification.name.getter();
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v27 = v26;

      *(void *)&long long v77 = sub_1000051C0(v25, v27, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v72 = *(void (**)(char *, uint64_t))(v3 + 8);
      v72(v14, v2);
      *(_WORD *)(v23 + 12) = 2080;
      if (!Notification.userInfo.getter()) {
        sub_100004A2C((uint64_t)&_swiftEmptyArrayStorage);
      }
      uint64_t v28 = Dictionary.description.getter();
      unint64_t v30 = v29;
      swift_bridgeObjectRelease();
      *(void *)&long long v77 = sub_1000051C0(v28, v30, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v72(v11, v2);
      os_log_t v31 = v66;
      _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v65, "Device setup notification: '%s', %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v67;
      id v16 = v68;
    }
    else
    {
      id v32 = *(void (**)(char *, uint64_t))(v3 + 8);
      v32(v14, v2);
      v72 = v32;
      v32(v11, v2);
    }
    uint64_t v33 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted;
    if ((*((unsigned char *)v16 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) & 1) == 0)
    {
      uint64_t v34 = (*(uint64_t (**)(void))((swift_isaMask & *v16) + 0x88))();
      if (v35)
      {
        uint64_t v36 = v34;
        uint64_t v37 = v35;
        uint64_t v38 = Notification.userInfo.getter();
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v74 = 0x746553736465656ELL;
          unint64_t v75 = 0xEA00000000007075;
          AnyHashable.init<A>(_:)();
          if (*(void *)(v39 + 16) && (unint64_t v40 = sub_100005850((uint64_t)v76), (v41 & 1) != 0))
          {
            sub_100005948(*(void *)(v39 + 56) + 32 * v40, (uint64_t)&v77);
          }
          else
          {
            long long v77 = 0u;
            long long v78 = 0u;
          }
          sub_100005894((uint64_t)v76);
          if (*((void *)&v78 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0 && v74 == 1)
            {

              swift_bridgeObjectRelease();
LABEL_45:
              swift_bridgeObjectRelease();
              return;
            }
          }
          else
          {
            sub_1000058E8((uint64_t)&v77);
          }
          uint64_t v74 = 0x4449656369766564;
          unint64_t v75 = 0xE800000000000000;
          AnyHashable.init<A>(_:)();
          if (*(void *)(v39 + 16) && (unint64_t v54 = sub_100005850((uint64_t)v76), (v55 & 1) != 0))
          {
            sub_100005948(*(void *)(v39 + 56) + 32 * v54, (uint64_t)&v77);
          }
          else
          {
            long long v77 = 0u;
            long long v78 = 0u;
          }
          swift_bridgeObjectRelease();
          sub_100005894((uint64_t)v76);
          if (!*((void *)&v78 + 1))
          {

            swift_bridgeObjectRelease();
            sub_1000058E8((uint64_t)&v77);
            return;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {

            goto LABEL_45;
          }
          if (v74 == v36 && v37 == v75)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v56 & 1) == 0)
            {
LABEL_51:

              return;
            }
          }
          v57 = Logger.logObject.getter();
          os_log_type_t v58 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v57, v58))
          {
            v59 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v59 = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "Setup started - auto dismissing.", v59, 2u);
            swift_slowDealloc();
          }

          if ((*(uint64_t (**)(void))((swift_isaMask & *v16) + 0x70))())
          {
            uint64_t v61 = v60;
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void *, uint64_t, uint64_t))(v61 + 16))(v16, ObjectType, v61);

            swift_unknownObjectRelease();
            return;
          }
          goto LABEL_51;
        }
        swift_bridgeObjectRelease();
      }
    }
    v42 = v73;
    v70(v73, a1, v2);
    v43 = v16;
    v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = 7104878;
      uint64_t v47 = swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      v76[0] = v71;
      *(_DWORD *)uint64_t v47 = 67109634;
      LODWORD(v77) = *((unsigned __int8 *)v16 + v33);
      uint64_t v48 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v47 + 8) = 2080;
      uint64_t v49 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v43) + 0x88))(v48);
      if (!v50) {
        uint64_t v49 = 7104878;
      }
      unint64_t v51 = 0xE300000000000000;
      if (v50) {
        unint64_t v52 = v50;
      }
      else {
        unint64_t v52 = 0xE300000000000000;
      }
      *(void *)&long long v77 = sub_1000051C0(v49, v52, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 18) = 2080;
      if (Notification.userInfo.getter())
      {
        uint64_t v46 = Dictionary.description.getter();
        unint64_t v51 = v53;
        swift_bridgeObjectRelease();
      }
      *(void *)&long long v77 = sub_1000051C0(v46, v51, v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v72(v73, v2);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Failed to handle device setup notification: isStarted=%{BOOL}d, deviceIdentifier=%s, userInfo=%s", (uint8_t *)v47, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v72(v42, v2);
    }
  }
}

unint64_t sub_100004A2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000050F4((uint64_t *)&unk_10001E530);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_1000059A4(v6, (uint64_t)v15);
    unint64_t result = sub_100005850((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100005A0C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_100004B5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v7 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v7(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

id sub_100004CA4(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithContentView:a1];

  return v3;
}

id sub_100004CE8(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  id v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier];
  *id v3 = 0;
  v3[1] = 0;
  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode] = 256;
  v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  [super initWithContentView:a1];

  return v4;
}

id sub_100004E08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  return [super dealloc];
}

uint64_t sub_100004E8C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004EC4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if ((*(unsigned char *)(Strong + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) & 1) == 0)
    {
      *(unsigned char *)(Strong + OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted) = 1;
      if (qword_10001E828 != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      sub_100005818(v2, (uint64_t)qword_10001E830);
      id v3 = Logger.logObject.getter();
      os_log_type_t v4 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tapped start button", v5, 2u);
        swift_slowDealloc();
      }

      sub_10001128C(0x495443454E4E4F43, (void *)0xEA0000000000474ELL);
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v1 showActivityIndicatorWithStatus:v6];

      if ((*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x70))())
      {
        uint64_t v8 = v7;
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t))(v8 + 8))(v1, ObjectType, v8);
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_1000050A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000050B0()
{
  return swift_release();
}

uint64_t sub_1000050B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000050F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100005138(uint64_t a1)
{
}

uint64_t sub_100005140(uint64_t a1)
{
  return a1;
}

void type metadata accessor for SFDeviceModelCode()
{
  if (!qword_10001E3C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001E3C0);
    }
  }
}

uint64_t sub_1000051C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005294(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005948((uint64_t)v12, *a3);
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
      sub_100005948((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005B40((uint64_t)v12);
  return v7;
}

uint64_t sub_100005294(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005450(a5, a6);
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

uint64_t sub_100005450(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000054E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000056C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000056C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000054E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005660(v2, 0);
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

void *sub_100005660(uint64_t a1, uint64_t a2)
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
  sub_1000050F4(&qword_10001E3D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000056C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000050F4(&qword_10001E3D8);
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
  BOOL v13 = a4 + 32;
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

uint64_t sub_100005818(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100005850(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100005A1C(a1, v4);
}

uint64_t sub_100005894(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000058E8(uint64_t a1)
{
  uint64_t v2 = sub_1000050F4(&qword_10001E3C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005948(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000059A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000050F4(&qword_10001E3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100005A0C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100005A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100005AE4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100005894((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100005AE4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100005B40(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_100005B94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_100005BF8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_100005C3C()
{
}

uint64_t sub_100005C5C()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_100005CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_100005D18(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_1000032A8;
}

uint64_t sub_100005DA0(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  [super viewWillAppear:a1 & 1];
  sub_10001128C(0x49544E4548545541, (void *)0xEE004E4F49544143);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v3];

  sub_10001128C(0xD00000000000001BLL, (void *)0x8000000100015840);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setSubtitle:v4];

  [v1 setDismissalType:1];
  return (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x70))(0);
}

uint64_t type metadata accessor for TVSetupAuthViewController()
{
  return self;
}

void sub_100005F48(int a1)
{
  [v1 hideActivityIndicator];
  if ((a1 & 0x10000) != 0)
  {
    uint64_t v4 = 0xD00000000000001DLL;
    NSString v3 = (void *)0x8000000100015860;
  }
  else
  {
    NSString v3 = (void *)0x8000000100015840;
    uint64_t v4 = 0xD00000000000001BLL;
  }
  sub_10001128C(v4, v3);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setSubtitle:v5];

  id v6 = [v1 passcodeEntryView];
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 setText:v7];
}

uint64_t sub_10000604C(void *a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  [super didCompleteTextEntry:a1];
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 showActivityIndicatorWithStatus:v3];

  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x58))();
  if (result)
  {
    uint64_t v6 = v5;
    uint64_t ObjectType = swift_getObjectType();
    id v8 = [a1 text];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    (*(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(v1, v9, v11, ObjectType, v6);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_1000061E8(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  id v3 = [super initWithContentView:a1];

  return v3;
}

id sub_1000062B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  return [super dealloc];
}

uint64_t sub_1000062F4(uint64_t a1)
{
  return sub_1000064C8(a1, qword_10001EBD0);
}

uint64_t sub_100006318()
{
  return sub_100006564(&qword_10001E848, (uint64_t)qword_10001EBD0);
}

uint64_t sub_10000633C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000065DC(&qword_10001E848, (uint64_t)qword_10001EBD0, a1);
}

uint64_t sub_100006360(uint64_t a1)
{
  return sub_1000064C8(a1, qword_10001EBE8);
}

uint64_t sub_100006384()
{
  return sub_100006564(&qword_10001E850, (uint64_t)qword_10001EBE8);
}

uint64_t sub_1000063A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000065DC(&qword_10001E850, (uint64_t)qword_10001EBE8, a1);
}

uint64_t sub_1000063CC(uint64_t a1)
{
  return sub_1000064C8(a1, qword_10001EC00);
}

uint64_t sub_1000063F0()
{
  return sub_100006564(&qword_10001E858, (uint64_t)qword_10001EC00);
}

uint64_t sub_100006414@<X0>(uint64_t a1@<X8>)
{
  return sub_1000065DC(&qword_10001E858, (uint64_t)qword_10001EC00, a1);
}

uint64_t sub_100006438(uint64_t a1)
{
  return sub_1000064C8(a1, qword_10001EC18);
}

uint64_t sub_10000645C()
{
  return sub_100006564(&qword_10001E860, (uint64_t)qword_10001EC18);
}

uint64_t sub_100006480@<X0>(uint64_t a1@<X8>)
{
  return sub_1000065DC(&qword_10001E860, (uint64_t)qword_10001EC18, a1);
}

uint64_t sub_1000064A4(uint64_t a1)
{
  return sub_1000064C8(a1, qword_10001EC30);
}

uint64_t sub_1000064C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005B94(v3, a2);
  sub_100005818(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006540()
{
  return sub_100006564(&qword_10001E868, (uint64_t)qword_10001EC30);
}

uint64_t sub_100006564(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return sub_100005818(v3, a2);
}

uint64_t sub_1000065B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000065DC(&qword_10001E868, (uint64_t)qword_10001EC30, a1);
}

uint64_t sub_1000065DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = sub_100005818(v5, a2);
  NSString v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_100006674()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005B94(v0, qword_10001E878);
  uint64_t v1 = sub_100005818(v0, (uint64_t)qword_10001E878);
  uint64_t v2 = sub_1000063F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_100006700()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode);
  swift_beginAccess();
  return *v1 | (v1[1] << 8);
}

uint64_t sub_100006750(__int16 a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  v3[1] = HIBYTE(a1) & 1;
  return result;
}

uint64_t (*sub_1000067A4())()
{
  return j__swift_endAccess;
}

void sub_100006800()
{
  uint64_t v1 = v0;
  v41.receiver = v0;
  v41.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  [super viewDidLoad];
  sub_10001128C(0xD000000000000013, (void *)0x80000001000159B0);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v2];

  id v3 = [v1 setDismissalType:1];
  if (((*(uint64_t (**)(id))((swift_isaMask & *v1) + 0x58))(v3) & 0x100) == 0) {
    sub_100007DD4();
  }
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v37 = [self imageNamed:v4];

  id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v37];
  [v5 setContentMode:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [v1 contentView];
  [v6 addSubview:v5];

  sub_1000050B8(0, (unint64_t *)&qword_10001E378);
  uint64_t v40 = sub_1000050B8(0, &qword_10001E380);
  v38[3] = v40;
  v39[0] = v5;
  v38[0] = v5;
  id v7 = v5;
  [v7 frame];
  double v9 = v8;
  [v7 frame];
  id v11 = sub_100003CFC(v39, 7, 0, v38, 8, v9 / v10, 0.0);
  [v7 addConstraint:v11];

  id v36 = self;
  sub_1000050F4(&qword_10001E388);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100012CF0;
  id v13 = [v7 centerXAnchor];
  id v14 = [v1 contentView];
  id v15 = [v14 mainContentGuide];

  id v16 = [v15 centerXAnchor];
  id v17 = [v13 constraintEqualToAnchor:v16];

  *(void *)(v12 + 32) = v17;
  id v18 = [v7 centerYAnchor];
  id v19 = [v1 contentView];
  id v20 = [v19 mainContentGuide];

  id v21 = [v20 centerYAnchor];
  id v22 = [v18 constraintEqualToAnchor:v21];

  *(void *)(v12 + 40) = v22;
  id v23 = [v7 topAnchor];
  id v24 = [v1 contentView];
  id v25 = [v24 mainContentGuide];

  id v26 = [v25 topAnchor];
  id v27 = [v23 constraintGreaterThanOrEqualToAnchor:v26];

  *(void *)(v12 + 48) = v27;
  id v28 = [v7 bottomAnchor];
  id v29 = [v1 contentView];
  id v30 = [v29 mainContentGuide];

  id v31 = [v30 bottomAnchor];
  id v32 = [v28 constraintLessThanOrEqualToAnchor:v31];

  *(void *)(v12 + 56) = v32;
  id v33 = [v7 heightAnchor];
  id v34 = [v33 constraintEqualToConstant:75.0];

  *(void *)(v12 + 64) = v34;
  v39[0] = (id)v12;
  specialized Array._endMutation()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v36 activateConstraints:isa];
}

uint64_t type metadata accessor for TVSetupProgressViewController()
{
  return self;
}

void sub_100006E34(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  [super viewWillAppear:a1 & 1];
  sub_10001128C(0x5F474E4954544553, (void *)0xEA00000000005055);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 showActivityIndicatorWithStatus:v3];
}

void sub_100006F70(int a1)
{
  NSString v2 = v1;
  if (qword_10001E870 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005818(v4, (uint64_t)qword_10001E878);
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    sub_100007408(a1);
    uint64_t v8 = String.init(cString:)();
    sub_1000051C0(v8, v9, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "handleProgressEvent: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  switch(a1)
  {
    case 200:
      NSString v10 = String._bridgeToObjectiveC()();
      id v11 = (id)SFLocalizableWAPIStringKeyForKey();

      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v14 = v13;

      sub_10001128C(v12, v14);
      swift_bridgeObjectRelease();
      goto LABEL_20;
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 218:
    case 219:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 227:
    case 228:
    case 229:
    case 231:
    case 232:
    case 233:
    case 235:
      return;
    case 210:
      uint64_t v15 = 0x415649544341;
      goto LABEL_11;
    case 220:
      unint64_t v16 = 0xD000000000000011;
      id v18 = "SETTING_UP_ICLOUD";
      goto LABEL_15;
    case 230:
      id v19 = "WAITING_FOR_HOMEKIT";
      goto LABEL_17;
    case 234:
      unint64_t v16 = 0xD000000000000012;
      id v18 = "SETTING_UP_HOMEKIT";
LABEL_15:
      id v17 = (void *)((unint64_t)(v18 - 32) | 0x8000000000000000);
      goto LABEL_19;
    case 236:
      id v19 = "SETTING_UP_SECURITY";
LABEL_17:
      id v17 = (void *)((unint64_t)(v19 - 32) | 0x8000000000000000);
      unint64_t v16 = 0xD000000000000013;
      goto LABEL_19;
    default:
      if (a1 == 80)
      {
        id v17 = (void *)0xEA00000000005055;
        unint64_t v16 = 0x5F474E4954544553;
      }
      else
      {
        if (a1 != 35) {
          return;
        }
        uint64_t v15 = 0x43454E4E4F43;
LABEL_11:
        unint64_t v16 = v15 & 0xFFFFFFFFFFFFLL | 0x4954000000000000;
        id v17 = (void *)0xEA0000000000474ELL;
      }
LABEL_19:
      sub_10001128C(v16, v17);
LABEL_20:
      NSString v20 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v2 showActivityIndicatorWithStatus:v20];

      return;
  }
}

id sub_10000731C(void *a1)
{
  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode] = 256;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  id v3 = [super initWithContentView:a1];

  return v3;
}

id sub_1000073D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  [super dealloc];
}

const char *sub_100007408(int a1)
{
  if (a1 > 299)
  {
    if (a1 <= 799)
    {
      if (a1 <= 519)
      {
        if (a1 <= 410)
        {
          if (a1 <= 399)
          {
            if (a1 == 300) {
              return "BackupProgress";
            }
            if (a1 == 310) {
              return "SyncProgress";
            }
          }
          else
          {
            switch(a1)
            {
              case 400:
                return "StopSetup";
              case 401:
                return "PINPair";
              case 410:
                return "MigrateStart";
            }
          }
        }
        else if (a1 > 430)
        {
          switch(a1)
          {
            case 431:
              return "eSimExternal2FAStop";
            case 500:
              return "SiriWelcome";
            case 510:
              return "SiriDialogA";
          }
        }
        else
        {
          switch(a1)
          {
            case 411:
              return "MigrateStop";
            case 420:
              return "FileTransferReady";
            case 430:
              return "eSimExternal2FAStart";
          }
        }
      }
      else if (a1 > 559)
      {
        if (a1 > 599)
        {
          switch(a1)
          {
            case 600:
              return "SiriSkipDemo";
            case 700:
              return "StopSetupLEDs";
            case 710:
              return "AudioPasscodeEnded";
          }
        }
        else
        {
          switch(a1)
          {
            case 560:
              return "SiriDialogCMusic";
            case 570:
              return "SiriDialogCNews";
            case 580:
              return "SiriDialogCWeather";
          }
        }
      }
      else if (a1 > 549)
      {
        switch(a1)
        {
          case 550:
            return "SiriDialogBWeather";
          case 555:
            return "SiriDialogBClock";
          case 558:
            return "SiriDialogBMusic";
        }
      }
      else
      {
        switch(a1)
        {
          case 520:
            return "SiriDialogBStart";
          case 530:
            return "SiriDialogBHome";
          case 540:
            return "SiriDialogBNews";
        }
      }
      return "?";
    }
    if (a1 > 999)
    {
      if (a1 <= 1099)
      {
        if (a1 == 1000) {
          return "SecureIntentStart";
        }
        if (a1 == 1001) {
          return "SecureIntentFinish";
        }
      }
      else
      {
        switch(a1)
        {
          case 1100:
            return "OneTimeCodeDetected";
          case 2000:
            return "DependentStart";
          case 2001:
            return "DependentEnd";
        }
      }
      return "?";
    }
    switch(a1)
    {
      case 900:
        uint64_t result = "SU-No-SetupScanAttempt";
        break;
      case 901:
        uint64_t result = "SU-No-SetupStatusUpdate";
        break;
      case 902:
        uint64_t result = "SU-No-SetupWipeWifi";
        break;
      case 903:
        uint64_t result = "SU-No-SetupCancelled";
        break;
      case 904:
        uint64_t result = "SU-No-SetupObliterate";
        break;
      case 905:
        uint64_t result = "SU-No-SetupCannotCancel";
        break;
      case 906:
        uint64_t result = "SysDrop AirDrop Event";
        break;
      case 907:
        uint64_t result = "SysDrop Sysdiagnose Event";
        break;
      case 908:
        uint64_t result = "SysDrop Cancel Event";
        break;
      case 909:
        uint64_t result = "File Transfer Progress Event";
        break;
      case 910:
        uint64_t result = "File Transfer Completed Event";
        break;
      case 911:
        uint64_t result = "iOSWiFiSetup";
        break;
      case 912:
        uint64_t result = "HKPrimaryResidentSSIDFetchStart";
        break;
      case 913:
        uint64_t result = "LoggingProfileTransfer";
        break;
      default:
        switch(a1)
        {
          case 800:
            uint64_t result = "AuthAccountsStart";
            break;
          case 803:
            uint64_t result = "AuthAccountsiCloudProgress";
            break;
          case 804:
            uint64_t result = "AuthAccountsStoreProgress";
            break;
          case 805:
            uint64_t result = "AuthAccountsGameCenterProgress";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  else if (a1 > 129)
  {
    if (a1 > 249)
    {
      switch(a1)
      {
        case 260:
          uint64_t result = "TVLSStart";
          break;
        case 261:
        case 262:
        case 263:
        case 265:
        case 266:
        case 267:
        case 268:
        case 269:
        case 271:
        case 273:
        case 275:
          return "?";
        case 264:
          uint64_t result = "TVLSFinish";
          break;
        case 270:
          uint64_t result = "TVLSEstimateStart";
          break;
        case 272:
          uint64_t result = "TVLSEstimateFinal";
          break;
        case 274:
          uint64_t result = "TVLSEstimateFailed";
          break;
        case 276:
          uint64_t result = "TVLSTryAgain";
          break;
        case 277:
          uint64_t result = "TVLSToneBegan";
          break;
        case 278:
          uint64_t result = "TVLCalStart";
          break;
        case 279:
          uint64_t result = "TVLCalStep";
          break;
        case 280:
          uint64_t result = "TVLCalFailed";
          break;
        case 281:
          uint64_t result = "TVLCalTryAgain";
          break;
        case 282:
          uint64_t result = "TVLCalFinal";
          break;
        default:
          if (a1 != 250) {
            return "?";
          }
          uint64_t result = "ReportSuccess";
          break;
      }
    }
    else
    {
      if (a1 <= 219)
      {
        if (a1 <= 149)
        {
          if (a1 == 130) {
            return "WiFiPoweredOff";
          }
          if (a1 == 140) {
            return "RecognizeVoice";
          }
        }
        else
        {
          switch(a1)
          {
            case 150:
              return "SiriForEveryone";
            case 200:
              return "WiFiStart";
            case 210:
              return "ActivationStart";
          }
        }
        return "?";
      }
      switch(a1)
      {
        case 230:
          return "HomeKitStart";
        case 231:
        case 232:
        case 233:
        case 235:
        case 237:
        case 238:
        case 239:
          return "?";
        case 234:
          return "HomeKitSetupStart";
        case 236:
          return "CDPSetupStart";
        case 240:
          return "BuddyStarting";
        case 241:
          return "BuddyProgress";
        case 242:
          return "BuddyFinished";
        default:
          if (a1 == 220)
          {
            uint64_t result = "iCloudStart";
          }
          else
          {
            if (a1 != 224) {
              return "?";
            }
            uint64_t result = "AppleIDSetupStart";
          }
          break;
      }
    }
  }
  else
  {
    if (a1 <= 79)
    {
      if (a1 > 49)
      {
        if (a1 > 64)
        {
          if (a1 == 65) {
            return "SecurityAPCLoopStart";
          }
          if (a1 == 70) {
            return "SecurityFinish";
          }
        }
        else
        {
          if (a1 == 50) {
            return "PreAuthFinish";
          }
          if (a1 == 60) {
            return "SecurityStart";
          }
        }
      }
      else
      {
        if (a1 > 29)
        {
          switch(a1)
          {
            case 30:
              uint64_t result = "Error";
              break;
            case 31:
              uint64_t result = "SessionStarted";
              break;
            case 32:
              uint64_t result = "SessionEnded";
              break;
            case 33:
              uint64_t result = "SessionSecured";
              break;
            case 35:
              uint64_t result = "ConnectStart";
              break;
            case 40:
              uint64_t result = "PreAuthStart";
              break;
            default:
              return "?";
          }
          return result;
        }
        switch(a1)
        {
          case 0:
            return "Invalid";
          case 10:
            return "Start";
          case 20:
            return "Final";
        }
      }
      return "?";
    }
    if (a1 > 119)
    {
      switch(a1)
      {
        case 'x':
          return "CheckingiCloud";
        case 'z':
          return "CheckingAppleMusic";
        case '|':
          return "CheckingAccount";
      }
      return "?";
    }
    switch(a1)
    {
      case 'P':
        uint64_t result = "BasicConfigStart";
        break;
      case 'Z':
        uint64_t result = "BasicConfigFinish";
        break;
      case '\\':
        uint64_t result = "StepStart";
        break;
      case '^':
        uint64_t result = "StepFinish";
        break;
      case '_':
        uint64_t result = "PreFinish";
        break;
        uint64_t result = "SetupFinished";
        break;
      case 'a':
        uint64_t result = "SetupResumed";
        break;
      case 'b':
        uint64_t result = "SetupSuspend";
        break;
      case 'c':
        uint64_t result = "SetupPeerSWUpdate";
        break;
      case 'd':
        uint64_t result = "Finished";
        break;
      default:
        return "?";
    }
  }
  return result;
}

uint64_t sub_100007D20()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005B94(v0, qword_10001E898);
  uint64_t v1 = sub_100005818(v0, (uint64_t)qword_10001E898);
  uint64_t v2 = sub_100006318();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100007DAC()
{
  byte_10001E8B8 = 1;
  qword_10001E8C0 = 0xEF65646F436C6564;
}

void *sub_100007DD4()
{
  return &unk_100012E90;
}

uint64_t sub_100007DE0()
{
  return 0;
}

uint64_t sub_100007DE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UUID();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_100007E54()
{
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000C790((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    sub_1000050F4((uint64_t *)&unk_10001E5A0);
    if (swift_dynamicCast()) {
      return v6;
    }
  }
  else
  {
    sub_10000C458((uint64_t)v8, &qword_10001E3C8);
  }
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005818(v2, (uint64_t)qword_10001E898);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Could not get remote view controller proxy", v5, 2u);
    swift_slowDealloc();
  }

  return 0;
}

void *sub_100007FD0(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000050F4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v8 - 8, v9);
  id v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  unint64_t v16 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_100005818(v12, (uint64_t)qword_10001E898);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v17, v12);
  id v18 = a1;
  id v19 = Logger.logObject.getter();
  int v52 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v19, (os_log_type_t)v52);
  unint64_t v50 = v11;
  if (!v20)
  {

    id v24 = *(void (**)(char *, uint64_t))(v13 + 8);
    v13 += 8;
    v24(v16, v12);
    if (a1) {
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_9;
  }
  id v51 = v18;
  id v18 = (_DWORD *)swift_slowAlloc();
  uint64_t result = (void *)swift_slowAlloc();
  uint64_t v49 = result;
  char v55 = result;
  *id v18 = 136315138;
  if (!a1)
  {
    __break(1u);
    return result;
  }
  v47[0] = v4;
  id v22 = [v51 userInfo];
  v47[1] = a3;
  uint64_t v48 = a2;
  if (!v22)
  {
LABEL_9:
    sub_100004A2C((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_10;
  }
  id v23 = v22;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_10:
  uint64_t v25 = Dictionary.description.getter();
  unint64_t v27 = v26;
  swift_bridgeObjectRelease();
  *(void *)&long long v56 = sub_1000051C0(v25, v27, (uint64_t *)&v55);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  id v28 = v51;

  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v52, "Main configuration: %s", (uint8_t *)v18, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  id v18 = v28;
  swift_slowDealloc();

  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  a2 = v48;
  uint64_t v4 = v47[0];
LABEL_11:
  id v29 = [v18 userInfo];
  if (!v29)
  {
    long long v56 = 0u;
    long long v57 = 0u;
LABEL_20:
    sub_10000C458((uint64_t)&v56, &qword_10001E3C8);
    goto LABEL_21;
  }
  id v30 = v29;
  uint64_t v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v53 = 0xD000000000000010;
  unint64_t v54 = 0x80000001000155D0;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v31 + 16) && (unint64_t v32 = sub_100005850((uint64_t)&v55), (v33 & 1) != 0))
  {
    sub_100005948(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  sub_100005894((uint64_t)&v55);
  swift_bridgeObjectRelease();
  if (!*((void *)&v57 + 1)) {
    goto LABEL_20;
  }
  if (swift_dynamicCast())
  {
    uint64_t v34 = (uint64_t)v50;
    UUID.init(uuidString:)();
    swift_bridgeObjectRelease();
    uint64_t v35 = v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier;
    swift_beginAccess();
    sub_10000C3F4(v34, v35, (uint64_t *)&unk_10001E440);
    swift_endAccess();
  }
LABEL_21:
  id v36 = [v18 userInfo];
  if (!v36)
  {
    long long v56 = 0u;
    long long v57 = 0u;
LABEL_34:
    sub_10000C458((uint64_t)&v56, &qword_10001E3C8);
    goto LABEL_35;
  }
  id v37 = v36;
  uint64_t v38 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_10001E8B0 != -1) {
    swift_once();
  }
  uint64_t v39 = 0x6F4D656369766564;
  if (!byte_10001E8B8) {
    uint64_t v39 = 0;
  }
  *(void *)&long long v56 = v39;
  *((void *)&v56 + 1) = qword_10001E8C0;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v38 + 16) && (unint64_t v40 = sub_100005850((uint64_t)&v55), (v41 & 1) != 0))
  {
    sub_100005948(*(void *)(v38 + 56) + 32 * v40, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  sub_100005894((uint64_t)&v55);
  swift_bridgeObjectRelease();
  if (!*((void *)&v57 + 1)) {
    goto LABEL_34;
  }
  if (!swift_dynamicCast())
  {
LABEL_35:
    char v42 = 0;
    goto LABEL_36;
  }
  char v42 = (char)v55;
LABEL_36:
  v43 = (unsigned char *)(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode);
  unsigned char *v43 = v42;
  v43[1] = 0;
  id v44 = [v18 userInfo];
  if (v44)
  {
    os_log_type_t v45 = v44;
    uint64_t v46 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v46 = 0;
  }
  *(void *)(v4 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo) = v46;
  swift_bridgeObjectRelease();
  uint64_t result = (void *)sub_100007E54();
  if (result)
  {
    [result setAllowsAlertStacking:1];
    uint64_t result = (void *)swift_unknownObjectRelease();
  }
  if (a2) {
    return (void *)a2(result);
  }
  return result;
}

unint64_t sub_10000868C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000050F4(&qword_10001E518);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_10000C72C(v6, (uint64_t)&v15, (uint64_t *)&unk_10001E520);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000BA04(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100005A0C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1000088A4()
{
  return _PRXSupportedInterfaceOrientations(v0, 0);
}

void *sub_1000088B0(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  [super viewWillAppear:a1 & 1];
  unint64_t result = (void *)sub_100007E54();
  if (result)
  {
    [result setStatusBarHidden:1 withDuration:0.0];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000089B4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000050F4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v13 = (objc_class *)type metadata accessor for TVSetupAlertViewController();
  v40.receiver = v2;
  v40.super_class = v13;
  [super viewDidAppear:a1 & 1];
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100005818(v14, (uint64_t)qword_10001E898);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    long long v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "viewDidAppear(_:)", v17, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for TVSetupStartViewController();
  id v18 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v19 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController;
  BOOL v20 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController];
  *(void *)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = v18;

  uint64_t v21 = *(void **)&v2[v19];
  if (!v21) {
    goto LABEL_13;
  }
  uint64_t v22 = (uint64_t)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  swift_beginAccess();
  sub_10000C72C(v22, (uint64_t)v12, (uint64_t *)&unk_10001E440);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4))
  {
    id v23 = v21;
    sub_10000C458((uint64_t)v12, (uint64_t *)&unk_10001E440);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v12, v4);
    unint64_t v26 = v21;
    sub_10000C458((uint64_t)v12, (uint64_t *)&unk_10001E440);
    uint64_t v24 = UUID.uuidString.getter();
    uint64_t v25 = v27;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v21) + 0x90))(v24, v25);

  id v28 = *(void **)&v2[v19];
  if (!v28) {
    goto LABEL_13;
  }
  id v29 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v28) + 0x78);
  id v30 = v28;
  uint64_t v31 = v2;
  v29(v2, &off_100018988);

  unint64_t v32 = *(void **)&v2[v19];
  if (!v32) {
    goto LABEL_13;
  }
  int v33 = v31[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode];
  int v34 = v31[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode + 1];
  uint64_t v35 = *(void (**)(void))((swift_isaMask & *v32) + 0xA8);
  id v36 = v32;
  v35(v33 | (v34 << 8));

  if (*(void *)&v2[v19])
  {
    id v37 = [v31 presentProxCardFlowWithDelegate:v31 initialViewController:v31];
    uint64_t v38 = *(void **)&v31[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    *(void *)&v31[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = v37;
  }
  else
  {
LABEL_13:
    __break(1u);
  }
}

id sub_100008E18(char a1)
{
  uint64_t v2 = v1;
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005818(v4, (uint64_t)qword_10001E898);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "viewDidDisappear(_:)", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = sub_100007E54();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    NSString v10 = String._bridgeToObjectiveC()();
    [v9 setIdleTimerDisabled:0 forReason:v10];

    swift_unknownObjectRelease();
  }
  if ((v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Main disappeared without dismiss (device locked?)... dismissing UI", v13, 2u);
      swift_slowDealloc();
    }

    sub_10000907C(0, 0);
  }
  [*(id *)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] invalidate];
  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  return [super viewDidDisappear:a1 & 1];
}

void sub_10000907C(uint64_t a1, uint64_t a2)
{
  if ((v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 1;
    uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v3)
    {
      os_log_type_t v6 = (void *)swift_allocObject();
      v6[2] = a1;
      v6[3] = a2;
      v6[4] = v2;
      v10[4] = sub_10000C828;
      v10[5] = v6;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      v10[2] = sub_100009214;
      v10[3] = &unk_100018B68;
      uint64_t v7 = _Block_copy(v10);
      id v8 = v3;
      sub_10000C71C(a1);
      uint64_t v9 = v2;
      swift_release();
      [v8 dismissViewControllerAnimated:1 completion:v7];
      _Block_release(v7);
    }
  }
}

void *sub_1000091A8(void (*a1)(void))
{
  if (a1) {
    a1();
  }
  unint64_t result = (void *)sub_100007E54();
  if (result)
  {
    [result dismiss];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100009214(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100009258()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000050F4((uint64_t *)&unk_10001E440);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self sharedConnection];
  if (!v6)
  {
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  unsigned __int8 v8 = [v6 isPasscodeSet];

  if (v8)
  {
    id v9 = [objc_allocWithZone((Class)SFDevice) init];
    uint64_t v10 = v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier;
    swift_beginAccess();
    sub_10000C72C(v10, (uint64_t)v5, (uint64_t *)&unk_10001E440);
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = *(void *)(v11 - 8);
    Class isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
    {
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
    }
    [v9 setIdentifier:isa];

    uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo);
    if (v14)
    {
      uint64_t v42 = 0x6F6973726556736FLL;
      unint64_t v43 = 0xE90000000000006ELL;
      swift_bridgeObjectRetain();
      AnyHashable.init<A>(_:)();
      if (*(void *)(v14 + 16) && (unint64_t v15 = sub_100005850((uint64_t)&aBlock), (v16 & 1) != 0))
      {
        sub_100005948(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v44);
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
      }
      sub_100005894((uint64_t)&aBlock);
      swift_bridgeObjectRelease();
      if (*((void *)&v45 + 1))
      {
        if (swift_dynamicCast()) {
          [v9 setOsVersion:aBlock];
        }
        goto LABEL_18;
      }
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
    }
    sub_10000C458((uint64_t)&v44, &qword_10001E3C8);
LABEL_18:
    id v20 = [objc_allocWithZone((Class)SFDeviceSetupAppleTVSession) init];
    [v20 setPeerDevice:v9];
    [v20 setPresentingViewController:*(void *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController)];
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    objc_super v40 = sub_10000C4F0;
    uint64_t v41 = v21;
    aBlock = _NSConcreteStackBlock;
    uint64_t v37 = 1107296256;
    uint64_t v38 = sub_1000098EC;
    uint64_t v39 = &unk_100018AA0;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_release();
    [v20 setProgressHandler:v22];
    _Block_release(v22);
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    objc_super v40 = sub_10000C560;
    uint64_t v41 = v23;
    aBlock = _NSConcreteStackBlock;
    uint64_t v37 = 1107296256;
    uint64_t v38 = sub_100009214;
    uint64_t v39 = &unk_100018AC8;
    uint64_t v24 = _Block_copy(&aBlock);
    swift_release();
    [v20 setPromptForCaptiveNetworkHandler:v24];
    _Block_release(v24);
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    objc_super v40 = sub_10000C5B4;
    uint64_t v41 = v25;
    aBlock = _NSConcreteStackBlock;
    uint64_t v37 = 1107296256;
    uint64_t v38 = sub_100009214;
    uint64_t v39 = &unk_100018AF0;
    unint64_t v26 = _Block_copy(&aBlock);
    swift_release();
    [v20 setPromptForHomeiCloudHandler:v26];
    _Block_release(v26);
    uint64_t v27 = swift_allocObject();
    swift_unknownObjectWeakInit();
    objc_super v40 = sub_10000C674;
    uint64_t v41 = v27;
    aBlock = _NSConcreteStackBlock;
    uint64_t v37 = 1107296256;
    uint64_t v38 = sub_100009984;
    uint64_t v39 = &unk_100018B18;
    id v28 = _Block_copy(&aBlock);
    swift_release();
    [v20 setPromptForPINHandler:v28];
    _Block_release(v28);
    [v20 activate];
    id v29 = *(void **)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession);
    *(void *)(v1 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession) = v20;
    id v30 = v20;

    uint64_t v31 = sub_100007E54();
    if (v31)
    {
      unint64_t v32 = (void *)v31;
      NSString v33 = String._bridgeToObjectiveC()();
      [v32 setIdleTimerDisabled:1 forReason:v33];

      swift_unknownObjectRelease();
    }

    return;
  }
  id v17 = objc_allocWithZone((Class)NSError);
  NSString v18 = String._bridgeToObjectiveC()();
  id v35 = [v17 initWithDomain:v18 code:301001 userInfo:0];

  sub_10000A12C(v35, 0);
  uint64_t v19 = v35;
}

uint64_t sub_1000098EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100009984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

void sub_1000099E4(uint64_t a1, uint64_t a2)
{
  if ((int)a1 > 79)
  {
    if ((a1 - 200) > 0x24 || ((1 << (a1 + 56)) & 0x1440100401) == 0)
    {
      if (a1 != 96)
      {
        if (a1 != 80) {
          return;
        }
        goto LABEL_10;
      }
      uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController);
      if (v11)
      {
        *(void *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController) = 0;
      }
      if (qword_10001E890 != -1) {
        swift_once();
      }
      uint64_t v12 = type metadata accessor for Logger();
      sub_100005818(v12, (uint64_t)qword_10001E898);
      BOOL v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        unint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Setup completed", v15, 2u);
        swift_slowDealloc();
      }

      char v7 = 0;
      goto LABEL_29;
    }
LABEL_10:
    sub_10000A5CC(a1);
    return;
  }
  if (a1 == 20)
  {
    if (qword_10001E890 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100005818(v3, (uint64_t)qword_10001E898);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Setup finalized", v6, 2u);
      swift_slowDealloc();
    }

    char v7 = 1;
LABEL_29:
    sub_10000A12C(0, v7);
    return;
  }
  if (a1 != 30)
  {
    if (a1 != 70) {
      return;
    }
    goto LABEL_10;
  }
  if (a2)
  {
    *(void *)&long long v27 = 28517;
    *((void *)&v27 + 1) = 0xE200000000000000;
    AnyHashable.init<A>(_:)();
    if (*(void *)(a2 + 16) && (unint64_t v9 = sub_100005850((uint64_t)v26), (v10 & 1) != 0))
    {
      sub_100005948(*(void *)(a2 + 56) + 32 * v9, (uint64_t)&v27);
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100005894((uint64_t)v26);
    if (*((void *)&v28 + 1))
    {
      sub_1000050B8(0, &qword_10001E500);
      if (swift_dynamicCast()) {
        char v16 = (void *)v26[0];
      }
      else {
        char v16 = 0;
      }
      goto LABEL_39;
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_10000C458((uint64_t)&v27, &qword_10001E3C8);
  char v16 = 0;
LABEL_39:
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  sub_100005818(v17, (uint64_t)qword_10001E898);
  id v18 = v16;
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)&long long v27 = v16;
    uint64_t v25 = v16;
    id v22 = v18;
    sub_1000050F4(&qword_10001E4F8);
    uint64_t v23 = String.init<A>(describing:)();
    *(void *)&long long v27 = sub_1000051C0(v23, v24, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    char v16 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Setup failed: %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000A12C(v16, 1);
}

void sub_100009EE8(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005818(v4, (uint64_t)qword_10001E898);
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "showAuth(flags:)", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController;
  unint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController];
  if (v9)
  {
    char v10 = *(void (**)(uint64_t))((swift_isaMask & *v9) + 0x70);
    id v18 = v9;
    v10(a1);
  }
  else
  {
    type metadata accessor for TVSetupAuthViewController();
    id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v12 = *(void **)&v2[v8];
    *(void *)&v2[v8] = v11;

    BOOL v13 = *(void **)&v2[v8];
    if (v13)
    {
      os_log_type_t v14 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v13) + 0x60);
      unint64_t v15 = v13;
      char v16 = v2;
      v14(v2, &off_1000189A0);
    }
    uint64_t v17 = *(void **)&v2[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v17)
    {
      if (*(void *)&v2[v8])
      {
        [v17 pushViewController:animated:];
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_10000A12C(void *a1, char a2)
{
  uint64_t v3 = v2;
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100005818(v6, (uint64_t)qword_10001E898);
  id v7 = a1;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  unint64_t v43 = v7;
  long long v44 = a1;
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)char v10 = 136315138;
    id v11 = v7;
    sub_1000050F4(&qword_10001E4F8);
    uint64_t v12 = String.init<A>(describing:)();
    sub_1000051C0(v12, v13, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Show done: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v14 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController;
  if (*(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController]) {
    goto LABEL_21;
  }
  type metadata accessor for TVSetupDoneViewController();
  id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  char v16 = *(void **)&v3[v14];
  *(void *)&v3[v14] = v15;

  uint64_t v17 = *(void **)&v3[v14];
  if (v17)
  {
    id v18 = *(void (**)(void *))((swift_isaMask & *v17) + 0xA0);
    id v19 = v43;
    os_log_type_t v20 = v17;
    v18(v44);

    uint64_t v21 = *(void **)&v3[v14];
    if (v21)
    {
      id v22 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v21) + 0x70);
      uint64_t v23 = v21;
      unint64_t v24 = v3;
      v22(v3, &off_1000189B0);

      uint64_t v25 = *(void **)&v3[v14];
      if (v25)
      {
        unint64_t v26 = *(void **)&v24[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession];
        if (v26)
        {
          long long v27 = v25;
          id v28 = [v26 peerDevice];
          unint64_t v26 = v28;
          if (v28)
          {
            id v29 = [v28 mediaRemoteID];

            if (v29)
            {
              unint64_t v26 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v31 = v30;

LABEL_17:
              (*(void (**)(void *, uint64_t))((swift_isaMask & *v25) + 0x88))(v26, v31);

              goto LABEL_18;
            }
            unint64_t v26 = 0;
          }
        }
        else
        {
          unint64_t v32 = v25;
        }
        uint64_t v31 = 0;
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  NSString v33 = *(void **)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
  if (v33)
  {
    uint64_t v34 = *(void *)&v3[v14];
    if (!v34)
    {
      __break(1u);
      return;
    }
    [v33 pushViewController:v34 animated:1];
  }
LABEL_21:
  if (a2)
  {
    id v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Invalidating session", v37, 2u);
      swift_slowDealloc();
    }

    uint64_t v38 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession;
    [*(id *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] invalidate];
    uint64_t v39 = *(void **)&v3[v38];
    *(void *)&v3[v38] = 0;

    uint64_t v40 = sub_100007E54();
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      NSString v42 = String._bridgeToObjectiveC()();
      [v41 setIdleTimerDisabled:0 forReason:v42];

      swift_unknownObjectRelease();
    }
  }
}

void sub_10000A5CC(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005818(v4, (uint64_t)qword_10001E898);
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "showProgress(_:)", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController;
  os_log_type_t v9 = *(void **)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController);
  if (v9) {
    goto LABEL_6;
  }
  type metadata accessor for TVSetupProgressViewController();
  id v18 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v19 = *(void **)(v2 + v8);
  *(void *)(v2 + v8) = v18;

  os_log_type_t v20 = *(void **)(v2 + v8);
  if (v20)
  {
    int v21 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode);
    int v22 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode + 1);
    uint64_t v23 = *(void (**)(void))((swift_isaMask & *v20) + 0x60);
    unint64_t v24 = v20;
    v23(v21 | (v22 << 8));

    os_log_type_t v9 = *(void **)(v2 + v8);
    if (v9)
    {
LABEL_6:
      char v10 = *(void (**)(uint64_t))((swift_isaMask & *v9) + 0x70);
      id v11 = v9;
      v10(a1);
    }
  }
  uint64_t v12 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController;
  id v13 = [*(id *)(v2 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController) visibleViewController];
  uint64_t v14 = *(void *)(v2 + v8);
  if (v13)
  {
    if (!v14)
    {

      uint64_t v25 = *(void **)(v2 + v12);
      if (!v25) {
        return;
      }
      goto LABEL_18;
    }
    id v35 = *(id *)(v2 + v8);
    sub_1000050B8(0, &qword_10001E4F0);
    id v15 = v35;
    id v16 = v13;
    char v17 = static NSObject.== infix(_:_:)();

    if (v17) {
      return;
    }
  }
  else if (!v14)
  {
    id v34 = 0;
    return;
  }
  uint64_t v25 = *(void **)(v2 + v12);
  if (!v25) {
    return;
  }
LABEL_18:
  id v26 = [v25 viewControllers:v35];
  sub_1000050B8(0, &qword_10001E4F0);
  unint64_t v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v28 = *(void **)(v2 + v8);
  if (!v28)
  {
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v29 = v28;
  char v30 = sub_10000A99C((uint64_t)v29, v27);
  swift_bridgeObjectRelease();

  uint64_t v31 = *(void **)(v2 + v12);
  if (v30)
  {
    if (!v31) {
      return;
    }
    uint64_t v32 = *(void *)(v2 + v8);
    if (v32)
    {
      id v33 = [v31 popToViewController:v32 animated:1];

      return;
    }
    goto LABEL_35;
  }
  if (!v31) {
    return;
  }
  if (!*(void *)(v2 + v8))
  {
LABEL_36:
    __break(1u);
    return;
  }

  [v31 pushViewController:animated:];
}

uint64_t sub_10000A99C(uint64_t a1, unint64_t a2)
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
      os_log_type_t v6 = v5;
      sub_1000050B8(0, &qword_10001E4F0);
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

id sub_10000AB24()
{
  uint64_t v1 = v0;
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005818(v2, (uint64_t)qword_10001E898);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "showCaptiveNetworkWarning()", v5, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v7 = OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController;
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController];
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = v6;

  uint64_t v9 = *(void **)&v1[v7];
  if (v9)
  {
    uint64_t v10 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v9) + 0x68);
    char v11 = v9;
    unint64_t v12 = v1;
    v10(v1, &off_1000189C8);
  }
  id result = *(id *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
  if (result)
  {
    if (*(void *)&v1[v7])
    {
      return [result pushViewController:animated:];
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_10000ACDC(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_10000AD54(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] = 0;
  NSString v6 = &v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  uint64_t v7 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_WORD *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode] = 256;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo] = 0;
  v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = 0;
  if (a2)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  [super initWithNibName:v8 bundle:a3];

  return v9;
}

id sub_10000AF14(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_10000AF58(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession] = 0;
  id v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceIdentifier];
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_WORD *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_deviceModelCode] = 256;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_userInfo] = 0;
  v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_startViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_authViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_doneViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_progressViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_captiveNetworkWarningViewController] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  id v5 = [super initWithCoder:a1];

  return v5;
}

id sub_10000B0A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupAlertViewController();
  [super dealloc];
}

void sub_10000B1A0()
{
}

void sub_10000B23C()
{
}

void sub_10000B278(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

id sub_10000B284()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession) homeiCloudEnable];
}

uint64_t sub_10000B29C(uint64_t a1, char a2)
{
  return sub_10000BF34(a2);
}

uint64_t sub_10000B2A4(uint64_t a1, char *a2)
{
  uint64_t v3 = sub_1000050F4(&qword_10001E508);
  __chkstk_darwin(v3 - 8, v4);
  NSString v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  unint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  id v16 = (char *)&v51 - v15;
  __chkstk_darwin(v14, v17);
  id v19 = (char *)&v51 - v18;
  uint64_t v20 = swift_projectBox();
  swift_beginAccess();
  sub_10000C72C(v20, (uint64_t)v6, &qword_10001E508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_10000C458((uint64_t)v6, &qword_10001E508);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v19, v6, v7);
  if (qword_10001E890 != -1) {
    swift_once();
  }
  long long v57 = a2;
  uint64_t v22 = type metadata accessor for Logger();
  uint64_t v23 = sub_100005818(v22, (uint64_t)qword_10001E898);
  unint64_t v53 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v54 = v8 + 16;
  v53(v16, v19, v7);
  char v55 = (void *)v23;
  unint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  BOOL v26 = os_log_type_enabled(v24, v25);
  long long v56 = v12;
  if (v26)
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    id v59 = (id)swift_slowAlloc();
    *(_DWORD *)unint64_t v27 = 136315138;
    uint64_t v52 = v7;
    uint64_t v28 = URL.debugDescription.getter();
    uint64_t v58 = sub_1000051C0(v28, v29, (uint64_t *)&v59);
    uint64_t v7 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    char v30 = *(void (**)(char *, uint64_t))(v8 + 8);
    v30(v16, v7);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Open settings: %s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    char v30 = *(void (**)(char *, uint64_t))(v8 + 8);
    v30(v16, v7);
  }

  id v31 = [self defaultWorkspace];
  if (!v31) {
    return ((uint64_t (*)(char *, uint64_t))v30)(v19, v7);
  }
  id v33 = v31;
  URL._bridgeToObjectiveC()(v32);
  id v35 = v34;
  os_log_type_t v36 = v19;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v59 = 0;
  unsigned __int8 v38 = [v33 openSensitiveURL:v35 withOptions:isa error:&v59];

  if (v38)
  {
    id v39 = v59;
    return ((uint64_t (*)(char *, uint64_t))v30)(v36, v7);
  }
  else
  {
    id v40 = v59;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v41 = v56;
    v53(v56, v36, v7);
    swift_errorRetain();
    swift_errorRetain();
    NSString v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    int v44 = v43;
    uint64_t v45 = v36;
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v46 = swift_slowAlloc();
      char v55 = (void *)swift_slowAlloc();
      id v59 = v55;
      *(_DWORD *)uint64_t v46 = 136315394;
      long long v57 = v45;
      LODWORD(v54) = v44;
      uint64_t v47 = URL.debugDescription.getter();
      uint64_t v58 = sub_1000051C0(v47, v48, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v30(v41, v7);
      *(_WORD *)(v46 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v49 = Error.localizedDescription.getter();
      uint64_t v58 = sub_1000051C0(v49, v50, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v54, "Failed to open settings: %s %s", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return ((uint64_t (*)(char *, uint64_t))v30)(v57, v7);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      v30(v41, v7);
      swift_errorRelease();
      return ((uint64_t (*)(char *, uint64_t))v30)(v36, v7);
    }
  }
}

id sub_10000B978()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession) captiveConfirmed];
}

uint64_t type metadata accessor for TVSetupAlertViewController()
{
  uint64_t result = qword_10001E918;
  if (!qword_10001E918) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_10000B9E0()
{
  return sub_1000091A8(*(void (**)(void))(v0 + 16));
}

uint64_t sub_10000B9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B9FC()
{
  return swift_release();
}

unint64_t sub_10000BA04(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000BA7C(a1, a2, v4);
}

unint64_t sub_10000BA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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

void sub_10000BB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] & 1) == 0)
  {
    v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_isDismissed] = 1;
    uint64_t v4 = *(void **)&v3[OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_navigationViewController];
    if (v4)
    {
      uint64_t v7 = (void *)swift_allocObject();
      _OWORD v7[2] = 0;
      v7[3] = 0;
      v7[4] = v3;
      v11[4] = a2;
      v11[5] = v7;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 1107296256;
      v11[2] = sub_100009214;
      v11[3] = a3;
      uint64_t v8 = _Block_copy(v11);
      id v9 = v4;
      uint64_t v10 = v3;
      swift_release();
      [v9 dismissViewControllerAnimated:1 completion:v8];
      _Block_release(v8);
    }
  }
}

void sub_10000BC58(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001E890 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_100005818(v6, (uint64_t)qword_10001E898);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v21[0] = v3;
    BOOL v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)BOOL v14 = 136315138;
    int v15 = IsAppleInternalBuild();
    v21[1] = a1;
    if (v15)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = a1;
      unint64_t v17 = a2;
    }
    else
    {
      unint64_t v17 = 0xE100000000000000;
      uint64_t v16 = 42;
    }
    v21[2] = sub_1000051C0(v16, v17, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Trying PIN: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v3 = v21[0];
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC16TVSetupUIService26TVSetupAlertViewController_setupSession);
  if (v18)
  {
    id v19 = v18;
    NSString v20 = String._bridgeToObjectiveC()();
    [v19 pairSetupTryPIN:v20];
  }
}

uint64_t sub_10000BF34(char a1)
{
  uint64_t v2 = sub_1000050F4(&qword_10001E508);
  uint64_t v4 = __chkstk_darwin(v2, v3);
  uint64_t v6 = &v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __chkstk_darwin(v4, v7);
  uint64_t v10 = &v25[-v9];
  __chkstk_darwin(v8, v11);
  os_log_type_t v13 = &v25[-v12];
  sub_1000050F4(&qword_10001E510);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100012E80;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v15;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v16;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 1;
  unint64_t v17 = sub_10000868C(inited);
  uint64_t v18 = swift_allocBox();
  uint64_t v20 = v19;
  uint64_t v21 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  switch(a1)
  {
    case 1:
      URL.init(string:)();
      goto LABEL_5;
    case 2:
      URL.init(string:)();
      os_log_type_t v13 = v10;
      goto LABEL_5;
    case 3:
      NSString v22 = String._bridgeToObjectiveC()();
      MGGetBoolAnswer();

      URL.init(string:)();
      os_log_type_t v13 = v6;
LABEL_5:
      sub_10000C3F4((uint64_t)v13, v20, &qword_10001E508);
      break;
    default:
      break;
  }
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v18;
  *(void *)(v23 + 24) = v17;
  swift_retain();
  sub_10000907C((uint64_t)sub_10000C3EC, v23);
  swift_release();
  return swift_release();
}

uint64_t sub_10000C238()
{
  return type metadata accessor for TVSetupAlertViewController();
}

void sub_10000C240()
{
  sub_10000C2FC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000C2FC()
{
  if (!qword_10001E480)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10001E480);
    }
  }
}

uint64_t sub_10000C354(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000C364()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C39C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000C3AC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C3EC()
{
  return sub_10000B2A4(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_10000C3F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000050F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C458(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000050F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C4B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000C4F0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_1000099E4(a1, a2);
  }
}

void sub_10000C560()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10000AB24();
  }
}

void sub_10000C5B4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = objc_allocWithZone((Class)NSError);
    NSString v3 = String._bridgeToObjectiveC()();
    id v4 = [v2 initWithDomain:v3 code:301010 userInfo:0];

    sub_10000A12C(v4, 0);
  }
}

void sub_10000C674(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v3 = (void *)Strong;
    sub_100009EE8(a1);
  }
}

uint64_t sub_10000C6D4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C71C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000C72C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000050F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000050F4(&qword_10001E3C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_10000C82C(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000C83C(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000C864(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_10000C8AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C8C0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C908()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000C934()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000C978()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005B94(v0, qword_10001E938);
  uint64_t v1 = sub_100005818(v0, (uint64_t)qword_10001E938);
  uint64_t v2 = sub_10000645C();
  NSString v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10000CA04()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10000CA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_10000CAC0(void *a1))(uint64_t a1, char a2)
{
  NSString v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_1000032A8;
}

uint64_t sub_10000CB48()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_10000CBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000CC00())()
{
  return j__swift_endAccess;
}

void *sub_10000CC5C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000CCAC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_10000CD00())()
{
  return j_j__swift_endAccess;
}

void sub_10000CD5C()
{
  v184.receiver = v0;
  v184.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  [super viewDidLoad];
  id v1 = [v0 setDismissalType:3];
  uint64_t v2 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x98);
  id v3 = (void *)((uint64_t (*)(id))v2)(v1);

  if (v3)
  {
    uint64_t v4 = v0;
    uint64_t v5 = 19279;
    uint64_t v6 = (void *)0xE200000000000000;
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = 0x4D45525F4E45504FLL;
    uint64_t v6 = (void *)0xEB0000000045544FLL;
  }
  sub_10001128C(v5, v6);
  uint64_t v7 = (void *)v2();

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)v2();
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v8 code];

    if (v10 == (id)301010)
    {
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v182 = sub_10000FCE8;
    uint64_t v183 = v11;
    aBlock = _NSConcreteStackBlock;
    uint64_t v179 = 1107296256;
    v180 = sub_100003C94;
    v181 = &unk_100018BB8;
    os_log_type_t v13 = _Block_copy(&aBlock);
    id v14 = [self actionWithTitle:v12 style:0 handler:v13];

    _Block_release(v13);
    swift_release();
    swift_release();
    id v15 = [v4 addAction:v14];

LABEL_9:
    sub_10001128C(0x45535F4F545F4F47, (void *)0xEE0053474E495454);
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v182 = sub_10000FEC4;
    uint64_t v183 = v16;
    aBlock = _NSConcreteStackBlock;
    uint64_t v179 = 1107296256;
    v180 = sub_100003C94;
    v181 = &unk_100018BE0;
    uint64_t v18 = _Block_copy(&aBlock);
    uint64_t v19 = self;
    id v20 = [v19 actionWithTitle:v17 style:1 handler:v18];

    _Block_release(v18);
    swift_release();
    uint64_t v21 = swift_release();
    NSString v22 = (void *)((uint64_t (*)(uint64_t))v2)(v21);
    if (!v22)
    {
      NSString v24 = String._bridgeToObjectiveC()();
      id v25 = (id)SFAddSuffixForCurrentDeviceClass();

      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = v27;

      sub_10001128C(v26, v28);
      swift_bridgeObjectRelease();
      NSString v29 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v29];

      sub_10001128C(0xD000000000000011, (void *)0x80000001000163C0);
      NSString v30 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v30];

      NSString v23 = String._bridgeToObjectiveC()();
      id v31 = [self imageNamed:v23];
LABEL_16:

      if (!v31)
      {
LABEL_19:

        return;
      }
      id v46 = objc_allocWithZone((Class)UIImageView);
      id v174 = v31;
      id v47 = [v46 initWithImage:v174];
      [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v48 = [v4 contentView];
      [v48 addSubview:v47];

      id v173 = self;
      sub_1000050F4(&qword_10001E388);
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_100012FD0;
      id v176 = v20;
      id v50 = [v47 centerXAnchor];
      id v51 = [v4 contentView];
      id v52 = [v51 mainContentGuide];

      id v53 = [v52 centerXAnchor];
      id v54 = [v50 constraintEqualToAnchor:v53];

      *(void *)(v49 + 32) = v54;
      id v55 = [v47 centerYAnchor];
      id v56 = [v4 contentView];
      id v57 = [v56 mainContentGuide];

      id v58 = [v57 centerYAnchor];
      id v59 = [v55 constraintEqualToAnchor:v58];

      *(void *)(v49 + 40) = v59;
      id v60 = [v47 topAnchor];
      id v61 = [v4 contentView];
      id v62 = [v61 mainContentGuide];

      id v63 = [v62 topAnchor];
      id v64 = [v60 constraintGreaterThanOrEqualToAnchor:v63 constant:10.0];

      *(void *)(v49 + 48) = v64;
      id v65 = [v47 bottomAnchor];
      id v66 = [v4 contentView];
      id v67 = [v66 mainContentGuide];

      id v68 = [v67 bottomAnchor];
      id v69 = [v65 constraintLessThanOrEqualToAnchor:v68 constant:-10.0];

      id v70 = v176;
      *(void *)(v49 + 56) = v69;
      aBlock = (void **)v49;
      specialized Array._endMutation()();
      sub_1000050B8(0, (unint64_t *)&qword_10001E378);
      v71.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      id v72 = v174;
      swift_bridgeObjectRelease();
      [v173 activateConstraints:v71.super.isa];
      NSString v23 = v174;
LABEL_18:

      id v20 = v23;
      goto LABEL_19;
    }
    NSString v23 = v22;
    if ([v22 code] == (id)301004 || objc_msgSend(v23, "code") == (id)301000)
    {
      NSString v32 = String._bridgeToObjectiveC()();
      id v33 = (id)SFLocalizableWAPIStringKeyForKey();

      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      os_log_type_t v36 = v35;

      sub_10001128C(v34, v36);
      swift_bridgeObjectRelease();
      NSString v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v37];

      NSString v38 = String._bridgeToObjectiveC()();
      id v39 = (id)SFLocalizableWAPIStringKeyForKey();

      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v42 = v41;

      sub_10001128C(v40, v42);
      swift_bridgeObjectRelease();
      NSString v43 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v43];

      NSString v44 = String._bridgeToObjectiveC()();
      id v31 = [self imageNamed:v44];

      id v45 = [v4 addAction:v20];
LABEL_15:

      goto LABEL_16;
    }
    if ([v23 code] == (id)301010)
    {
      sub_10001128C(0xD000000000000015, (void *)0x80000001000164F0);
      NSString v73 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v73];

      sub_10001128C(0xD000000000000014, (void *)0x8000000100016510);
      NSString v74 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v74];

      NSString v75 = String._bridgeToObjectiveC()();
      v76 = self;
      id v77 = [v76 imageNamed:v75];

      id v78 = [objc_allocWithZone((Class)UIImageView) initWithImage:v77];
      [v78 _setContinuousCornerRadius:17.5];
      id v79 = [v78 layer];
      v177 = v20;
      id v80 = [objc_allocWithZone((Class)UIColor) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.21];
      id v81 = [v80 CGColor];

      [v79 setBorderColor:v81];
      id v82 = [v78 layer];
      [v82 setBorderWidth:1.0];

      id v83 = [v78 layer];
      [v83 setMasksToBounds:1];

      NSString v84 = String._bridgeToObjectiveC()();
      id v85 = [v76 imageNamed:v84];

      id v86 = [objc_allocWithZone((Class)UIImageView) initWithImage:v85];
      [v86 _setContinuousCornerRadius:17.5];
      id v87 = [v86 layer];
      id v88 = [objc_allocWithZone((Class)UIColor) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.21];
      id v89 = [v88 CGColor];

      [v87 setBorderColor:v89];
      id v90 = [v86 layer];
      [v90 setBorderWidth:1.0];

      id v91 = [v86 layer];
      [v91 setMasksToBounds:1];

      sub_1000050F4(&qword_10001E388);
      uint64_t v92 = swift_allocObject();
      *(_OWORD *)(v92 + 16) = xmmword_100012FB0;
      *(void *)(v92 + 32) = v78;
      *(void *)(v92 + 40) = v86;
      aBlock = (void **)v92;
      specialized Array._endMutation()();
      id v93 = objc_allocWithZone((Class)UIStackView);
      sub_1000050B8(0, &qword_10001E630);
      id v175 = v78;
      id v172 = v86;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v95 = [v93 initWithArrangedSubviews:isa];

      [v95 setAxis:0];
      [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v95 setClipsToBounds:0];
      v96 = self;
      id v70 = v95;
      id v97 = [v96 clearColor];
      [v70 setBackgroundColor:v97];

      [v70 setSpacing:12.0];
      id v98 = [v70 layer];
      id v99 = [v96 blackColor];
      id v100 = [v99 CGColor];

      [v98 setShadowColor:v100];
      id v101 = [v70 layer];
      LODWORD(v102) = 1045220557;
      [v101 setShadowOpacity:v102];

      id v103 = [v70 layer];
      [v103 setShadowRadius:10.0];

      id v104 = [v70 layer];
      [v104 setShadowOffset:0.0, 8.0];

      id v105 = [v4 contentView];
      [v105 addSubview:v70];

      id v171 = self;
      uint64_t v106 = swift_allocObject();
      *(_OWORD *)(v106 + 16) = xmmword_100012FC0;
      id v107 = [v70 centerXAnchor];
      id v108 = [v4 contentView];
      id v109 = [v108 mainContentGuide];

      id v110 = [v109 centerXAnchor];
      id v111 = [v107 constraintEqualToAnchor:v110];

      *(void *)(v106 + 32) = v111;
      id v112 = [v70 centerYAnchor];
      id v113 = [v4 contentView];
      id v114 = [v113 mainContentGuide];

      id v115 = [v114 centerYAnchor];
      id v116 = [v112 constraintEqualToAnchor:v115];

      *(void *)(v106 + 40) = v116;
      id v117 = [v70 topAnchor];
      id v118 = [v4 contentView];
      id v119 = [v118 mainContentGuide];

      id v120 = [v119 topAnchor];
      id v121 = [v117 constraintGreaterThanOrEqualToAnchor:v120];

      *(void *)(v106 + 48) = v121;
      id v122 = [v70 bottomAnchor];
      id v123 = [v4 contentView];
      id v124 = [v123 mainContentGuide];

      id v125 = [v124 bottomAnchor];
      id v126 = [v122 constraintLessThanOrEqualToAnchor:v125];

      *(void *)(v106 + 56) = v126;
      id v127 = [v175 heightAnchor];
      id v128 = [v127 constraintEqualToConstant:75.0];

      *(void *)(v106 + 64) = v128;
      id v129 = [v175 widthAnchor];
      id v130 = [v129 constraintEqualToConstant:75.0];

      *(void *)(v106 + 72) = v130;
      id v47 = v172;
      id v131 = [v172 heightAnchor];
      id v132 = [v131 constraintEqualToConstant:75.0];

      *(void *)(v106 + 80) = v132;
      id v133 = [v172 widthAnchor];
      id v134 = [v133 constraintEqualToConstant:75.0];

      *(void *)(v106 + 88) = v134;
      aBlock = (void **)v106;
      specialized Array._endMutation()();
      sub_1000050B8(0, (unint64_t *)&qword_10001E378);
      Class v135 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v171 activateConstraints:v135];

      sub_10001128C(0x45554E49544E4F43, (void *)0xE800000000000000);
      uint64_t v136 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      NSString v137 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      v182 = sub_10000FEC4;
      uint64_t v183 = v136;
      aBlock = _NSConcreteStackBlock;
      uint64_t v179 = 1107296256;
      v180 = sub_100003C94;
      v181 = &unk_100018C30;
      v138 = _Block_copy(&aBlock);
      v71.super.Class isa = (Class)[v19 actionWithTitle:v137 style:0 handler:v138];

      _Block_release(v138);
      swift_release();
      swift_release();
      id v72 = [v4 addAction:v71.super.isa];

      goto LABEL_18;
    }
    if ([v23 code] == (id)301005)
    {
      sub_10001128C(0xD00000000000001ALL, (void *)0x80000001000164B0);
      NSString v139 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v139];

      sub_10001128C(0xD000000000000019, (void *)0x80000001000164D0);
      NSString v140 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v140];

      NSString v141 = String._bridgeToObjectiveC()();
      id v31 = [self imageNamed:v141];

      id v45 = [v4 addAction:v20];
      goto LABEL_15;
    }
    if ([v23 code] == (id)301001)
    {
      sub_10001128C(0xD000000000000017, (void *)0x8000000100016470);
      NSString v142 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v142];

      NSString v143 = String._bridgeToObjectiveC()();
      id v144 = (id)SFAddSuffixForCurrentDeviceClass();

      uint64_t v145 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v147 = v146;

      sub_10001128C(v145, v147);
      swift_bridgeObjectRelease();
      NSString v148 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v148];

      NSString v149 = String._bridgeToObjectiveC()();
      id v150 = [self imageNamed:v149];

      if (v150)
      {
        id v151 = [self redColor];
        id v31 = [v150 flattenedImageWithColor:v151];
      }
      else
      {
        id v31 = 0;
      }
      id v45 = [v4 addAction:v20];
      goto LABEL_15;
    }
    if ([v23 code] == (id)301021)
    {
      NSString v152 = String._bridgeToObjectiveC()();
      id v153 = (id)SFLocalizableWAPIStringKeyForKey();

      uint64_t v154 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v156 = v155;

      sub_10001128C(v154, v156);
      swift_bridgeObjectRelease();
      NSString v157 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v157];

      if (!IsAppleInternalBuild())
      {
        NSString v158 = String._bridgeToObjectiveC()();
        id v31 = [self imageNamed:v158];

        goto LABEL_32;
      }
    }
    else
    {
      sub_10001128C(0xD000000000000013, (void *)0x80000001000163E0);
      sub_1000050F4(&qword_10001E628);
      uint64_t v159 = swift_allocObject();
      *(_OWORD *)(v159 + 16) = xmmword_100012FA0;
      id v160 = [v23 code];
      *(void *)(v159 + 56) = &type metadata for Int;
      *(void *)(v159 + 64) = &protocol witness table for Int;
      *(void *)(v159 + 32) = v160;
      String.init(format:_:)();
      swift_bridgeObjectRelease();
      NSString v161 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setTitle:v161];
    }
    id v31 = 0;
LABEL_32:
    if (IsAppleInternalBuild())
    {
      id v162 = [v23 description];
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v163 = v20;

      NSString v164 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v4 setSubtitle:v164];

      sub_10001128C(0xD000000000000020, (void *)0x8000000100016400);
      uint64_t v165 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      NSString v166 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      v182 = sub_10000FEDC;
      uint64_t v183 = v165;
      aBlock = _NSConcreteStackBlock;
      uint64_t v179 = 1107296256;
      v180 = sub_100003C94;
      v181 = &unk_100018C08;
      v167 = _Block_copy(&aBlock);
      id v168 = [v19 actionWithTitle:v166 style:1 handler:v167];

      v169 = v167;
      id v20 = v163;
      _Block_release(v169);
      swift_release();
      swift_release();
      id v170 = [v4 addAction:v168];
    }
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t type metadata accessor for TVSetupDoneViewController()
{
  return self;
}

void sub_10000EAD4()
{
  id v1 = v0;
  if (qword_10001E930 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005818(v2, (uint64_t)qword_10001E938);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Action button", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x98))();
  if (v6)
  {
    id v22 = v6;
    if ([v6 code] == (id)301000 || objc_msgSend(v22, "code") == (id)301004)
    {
      if (!(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))())
      {
LABEL_11:

        return;
      }
      uint64_t v8 = v7;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v8 + 16))(v1, 1, ObjectType, v8);
    }
    else if ([v22 code] == (id)301010)
    {
      if (!(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))()) {
        goto LABEL_11;
      }
      uint64_t v14 = v13;
      uint64_t v15 = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v14 + 8))(v1, v15, v14);
    }
    else
    {
      id v16 = [v22 code];
      uint64_t v17 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
      uint64_t v19 = v18;
      if (v16 == (id)301005)
      {
        if (!v17) {
          goto LABEL_11;
        }
        uint64_t v20 = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, 2, v20, v19);
      }
      else
      {
        if (!v17) {
          goto LABEL_11;
        }
        uint64_t v21 = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, 3, v21, v19);
      }
    }
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  if ((*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))())
  {
    uint64_t v11 = v10;
    uint64_t v12 = swift_getObjectType();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 16))(v1, 0, v12, v11);
    swift_unknownObjectRelease();
  }

  sub_10000EE60();
}

void sub_10000EE60()
{
  if (qword_10001E930 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005818(v1, (uint64_t)qword_10001E938);
  uint64_t v2 = v0;
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x80))();
    if (v7)
    {
      unint64_t v8 = v7;
    }
    else
    {
      uint64_t v6 = 7104878;
      unint64_t v8 = 0xE300000000000000;
    }
    sub_1000051C0(v6, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Launching the TVRemote with deviceIdentifier=%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x80))(v9);
  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  [self launchRemoteWithDeviceIdentifier:v11];
}

uint64_t sub_10000F0C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URLComponents();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000050F4(&qword_10001E508);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000050F4(&qword_10001E668);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001E930 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100005818(v15, (uint64_t)qword_10001E938);
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "handleReportBugButton()", v18, 2u);
    swift_slowDealloc();
  }

  sub_1000050F4(&qword_10001E670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100012FE0;
  strcpy((char *)(inited + 32), "Classification");
  *(unsigned char *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0x2073756F69726553;
  *(void *)(inited + 56) = 0xEB00000000677542;
  *(void *)(inited + 64) = 0x6E656E6F706D6F43;
  *(void *)(inited + 72) = 0xEB00000000444974;
  *(void *)(inited + 80) = 0x353634303532;
  *(void *)(inited + 88) = 0xE600000000000000;
  strcpy((char *)(inited + 96), "ComponentName");
  *(_WORD *)(inited + 110) = -4864;
  *(void *)(inited + 112) = 0x565420656C707041;
  *(void *)(inited + 120) = 0xE800000000000000;
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x8000000100016600;
  *(void *)(inited + 144) = 0x736775422077654ELL;
  *(void *)(inited + 152) = 0xE800000000000000;
  *(void *)(inited + 160) = 0xD000000000000014;
  *(void *)(inited + 168) = 0x8000000100016620;
  *(void *)(inited + 176) = 0xD000000000000028;
  *(void *)(inited + 184) = 0x8000000100016640;
  *(void *)(inited + 192) = 0x6375646F72706552;
  *(void *)(inited + 200) = 0xEF7974696C696269;
  strcpy((char *)(inited + 208), "I Didn't Try");
  *(unsigned char *)(inited + 221) = 0;
  *(_WORD *)(inited + 222) = -5120;
  *(void *)(inited + 224) = 0x656C746954;
  *(void *)(inited + 232) = 0xE500000000000000;
  unint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  _StringGuts.grow(_:)(29);
  uint64_t v20 = swift_bridgeObjectRelease();
  unint64_t v36 = 0xD00000000000001BLL;
  unint64_t v37 = 0x8000000100016670;
  v35[2] = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x98))(v20);
  sub_1000050F4(&qword_10001E4F8);
  v21._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  unint64_t v22 = v37;
  *(void *)(inited + 240) = v36;
  *(void *)(inited + 248) = v22;
  unint64_t v23 = sub_10000F6E8(inited);
  sub_10000F80C(v23);
  swift_bridgeObjectRelease();
  URLComponents.init(string:)();
  NSString v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v24(v14, 1, v2)) {
    uint64_t result = swift_bridgeObjectRelease();
  }
  else {
    uint64_t result = URLComponents.queryItems.setter();
  }
  uint64_t v26 = (void *)UIApp;
  if (UIApp)
  {
    if (v24(v14, 1, v2))
    {
      uint64_t v27 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 1, 1, v27);
      id v28 = v26;
      NSString v29 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v14, v2);
      id v30 = v26;
      URLComponents.url.getter();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      uint64_t v31 = type metadata accessor for URL();
      uint64_t v32 = *(void *)(v31 - 8);
      NSString v29 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v10, 1, v31) != 1)
      {
        URL._bridgeToObjectiveC()(v33);
        NSString v29 = v34;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v31);
      }
    }
    [v26 openURL:v29 withCompletionHandler:0];

    return sub_100010160((uint64_t)v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_10000F6E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000050F4(&qword_10001E680);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000BA04(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t sub_10000F80C(uint64_t a1)
{
  uint64_t v34 = type metadata accessor for URLQueryItem();
  uint64_t v3 = *(void *)(v34 - 8);
  __chkstk_darwin(v34, v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v7) {
    return (uint64_t)v8;
  }
  uint64_t v32 = v6;
  uint64_t v26 = v1;
  unint64_t v36 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_1000101C0(0, v7, 0);
  uint64_t v8 = v36;
  uint64_t result = sub_100010420(a1);
  uint64_t v11 = result;
  uint64_t v12 = 0;
  uint64_t v13 = a1 + 64;
  uint64_t v30 = a1 + 64;
  uint64_t v31 = v3 + 32;
  uint64_t v27 = a1 + 80;
  int64_t v28 = v7;
  uint64_t v33 = v3;
  uint64_t v29 = v10;
  BOOL v14 = v32;
  while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v17 = (unint64_t)v11 >> 6;
    if ((*(void *)(v13 + 8 * ((unint64_t)v11 >> 6)) & (1 << v11)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v10) {
      goto LABEL_24;
    }
    uint64_t v35 = v12;
    uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    URLQueryItem.init(name:value:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v36 = v8;
    unint64_t v20 = v8[2];
    unint64_t v19 = v8[3];
    if (v20 >= v19 >> 1)
    {
      sub_1000101C0(v19 > 1, v20 + 1, 1);
      uint64_t v8 = v36;
    }
    v8[2] = v20 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v33 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v20, v14, v34);
    int64_t v15 = 1 << *(unsigned char *)(v18 + 32);
    if (v11 >= v15) {
      goto LABEL_25;
    }
    uint64_t v13 = v30;
    uint64_t v21 = *(void *)(v30 + 8 * v17);
    if ((v21 & (1 << v11)) == 0) {
      goto LABEL_26;
    }
    a1 = v18;
    LODWORD(v10) = v29;
    if (*(_DWORD *)(v18 + 36) != v29) {
      goto LABEL_27;
    }
    unint64_t v22 = v21 & (-2 << (v11 & 0x3F));
    if (v22)
    {
      int64_t v15 = __clz(__rbit64(v22)) | v11 & 0xFFFFFFFFFFFFFFC0;
      int64_t v16 = v28;
    }
    else
    {
      unint64_t v23 = v17 + 1;
      unint64_t v24 = (unint64_t)(v15 + 63) >> 6;
      int64_t v16 = v28;
      if (v17 + 1 < v24)
      {
        unint64_t v25 = *(void *)(v30 + 8 * v23);
        if (v25)
        {
LABEL_20:
          int64_t v15 = __clz(__rbit64(v25)) + (v23 << 6);
        }
        else
        {
          while (v24 - 2 != v17)
          {
            unint64_t v25 = *(void *)(v27 + 8 * v17++);
            if (v25)
            {
              unint64_t v23 = v17 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v12 = v35 + 1;
    uint64_t v11 = v15;
    if (v35 + 1 == v16) {
      return (uint64_t)v8;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

id sub_10000FB1C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = &v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  id v4 = [super initWithContentView:a1];

  return v4;
}

id sub_10000FC1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  [super dealloc];
}

uint64_t sub_10000FCB0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000FCE8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if (qword_10001E930 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005818(v2, (uint64_t)qword_10001E938);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tapped done button", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v6 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x68))();
    if (v6)
    {
      uint64_t v8 = v7;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 16))(v1, 0, ObjectType, v8);
      uint64_t v6 = swift_unknownObjectRelease();
    }
    uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x98))(v6);

    if (!v10) {
      sub_10000EE60();
    }
  }
}

uint64_t sub_10000FEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000FEBC()
{
  return swift_release();
}

void sub_10000FEC4(uint64_t a1)
{
}

void sub_10000FEDC(uint64_t a1)
{
}

void sub_10000FEF4(uint64_t a1, void (*a2)(void))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v4 = (void *)Strong;
    a2();
  }
}

unint64_t sub_10000FF54()
{
  unint64_t result = qword_10001E638;
  if (!qword_10001E638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E638);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for TVSetupDoneViewControllerDismissReason(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TVSetupDoneViewControllerDismissReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TVSetupDoneViewControllerDismissReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100010114);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10001013C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100010148(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TVSetupDoneViewControllerDismissReason()
{
  return &type metadata for TVSetupDoneViewControllerDismissReason;
}

uint64_t sub_100010160(uint64_t a1)
{
  uint64_t v2 = sub_1000050F4(&qword_10001E668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000101C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000101E0(a1, a2, a3, (void *)*v3);
  *int v3 = result;
  return result;
}

uint64_t sub_1000101E0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000050F4(&qword_10001E678);
  uint64_t v10 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100010420(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000104C0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005B94(v0, qword_10001EA58);
  uint64_t v1 = sub_100005818(v0, (uint64_t)qword_10001EA58);
  uint64_t v2 = sub_100006540();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10001054C()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10001059C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_100010608(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_1000032A8;
}

void sub_100010690()
{
  uint64_t v1 = v0;
  v38.receiver = v0;
  v38.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  [super viewDidLoad];
  [v0 setDismissalType:3];
  sub_10001128C(0xD00000000000001DLL, (void *)0x80000001000166B0);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v2];

  uint64_t v3 = WiFiCopyCurrentNetworkInfo();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    aBlock[0] = 0;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  swift_bridgeObjectRelease();
  sub_10001128C(0xD000000000000024, (void *)0x80000001000166F0);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setSubtitle:v5];

  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [self imageNamed:v6];

  if (v7)
  {
    id v8 = [self systemBlueColor];
    id v9 = [v7 imageWithTintColor:v8];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [objc_allocWithZone((Class)UIImageView) initWithImage:v9];
  [v10 setContentMode:1];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [v1 contentView];
  [v11 addSubview:v10];

  id v12 = [v1 contentView];
  id v13 = [v12 mainContentGuide];

  size_t v14 = self;
  sub_1000050F4(&qword_10001E388);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100012CF0;
  id v16 = [v10 centerXAnchor];
  id v17 = [v13 centerXAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];

  *(void *)(v15 + 32) = v18;
  id v19 = [v10 centerYAnchor];
  id v20 = [v13 centerYAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];

  *(void *)(v15 + 40) = v21;
  id v22 = [v10 leadingAnchor];
  id v23 = [v13 leadingAnchor];
  id v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];

  *(void *)(v15 + 48) = v24;
  id v25 = [v10 trailingAnchor];
  id v26 = [v13 trailingAnchor];
  id v27 = [v25 constraintLessThanOrEqualToAnchor:v26];

  *(void *)(v15 + 56) = v27;
  id v28 = [v10 bottomAnchor];
  id v29 = [v13 bottomAnchor];
  id v30 = [v28 constraintLessThanOrEqualToAnchor:v29];

  *(void *)(v15 + 64) = v30;
  aBlock[0] = v15;
  specialized Array._endMutation()();
  sub_1000111A8();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v14 activateConstraints:isa];

  sub_10001128C(0x45554E49544E4F43, (void *)0xE800000000000000);
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100011220;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003C94;
  void aBlock[3] = &unk_100018D10;
  uint64_t v34 = _Block_copy(aBlock);
  id v35 = [self actionWithTitle:v33 style:0 handler:v34];

  _Block_release(v34);
  swift_release();
  swift_release();
  id v36 = [v1 addAction:v35];
}

uint64_t type metadata accessor for TVSetupCaptiveNetworkWarningViewController()
{
  return self;
}

void sub_100010E68()
{
  if ((*((unsigned char *)v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue) & 1) == 0)
  {
    uint64_t v1 = v0;
    *((unsigned char *)v0 + OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue) = 1;
    if (qword_10001EA50 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005818(v2, (uint64_t)qword_10001EA58);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      NSString v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tapped continue button", v5, 2u);
      swift_slowDealloc();
    }

    sub_10001128C(0x495443454E4E4F43, (void *)0xEA0000000000474ELL);
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 showActivityIndicatorWithStatus:v6];

    if ((*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x60))())
    {
      uint64_t v8 = v7;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v8 + 8))(v1, ObjectType, v8);
      swift_unknownObjectRelease();
    }
  }
}

id sub_100011030(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  [super initWithContentView:a1];

  return v3;
}

id sub_100011110()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  return [super dealloc];
}

unint64_t sub_100011154()
{
  unint64_t result = qword_10001E690;
  if (!qword_10001E690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E690);
  }
  return result;
}

unint64_t sub_1000111A8()
{
  unint64_t result = qword_10001E378;
  if (!qword_10001E378)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001E378);
  }
  return result;
}

uint64_t sub_1000111E8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100011220()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100010E68();
  }
}

uint64_t sub_100011274(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011284()
{
  return swift_release();
}

uint64_t sub_10001128C(uint64_t a1, void *a2)
{
  id v4 = [self mainBundle];
  v10._object = (void *)0xE000000000000000;
  v5._uint64_t countAndFlagsBits = a1;
  v5._object = a2;
  v6.value._uint64_t countAndFlagsBits = 0x617A696C61636F4CLL;
  v6.value._object = (void *)0xEB00000000656C62;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v10._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v10)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100011338()
{
  return 1;
}

id sub_100011348()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_10001137C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super init];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void sub_100011414()
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v1 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v1) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v1);
}

id sub_1000114A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t sub_100011560(char a1)
{
  if (!a1) {
    return sub_10001128C(0xD000000000000013, (void *)0x80000001000167C0);
  }
  if (a1 == 1) {
    id v1 = "DEVICE_CLASS_IPAD";
  }
  else {
    id v1 = "DEVICE_CLASS_IPOD";
  }
  return sub_10001128C(0xD000000000000011, (void *)((unint64_t)(v1 - 32) | 0x8000000000000000));
}

uint64_t sub_1000115B8()
{
  if (qword_10001EA70 != -1) {
    swift_once();
  }
  NSString v0 = String._bridgeToObjectiveC()();
  int v1 = MGGetSInt32Answer();

  swift_beginAccess();
  uint64_t v2 = qword_10001EA78;
  if (*(void *)(qword_10001EA78 + 16) && (unint64_t v3 = sub_1000116B4(v1), (v4 & 1) != 0)) {
    uint64_t v5 = *(unsigned __int8 *)(*(void *)(v2 + 56) + v3);
  }
  else {
    uint64_t v5 = 3;
  }
  swift_endAccess();
  return v5;
}

unint64_t sub_10001168C()
{
  unint64_t result = sub_100011994((uint64_t)&off_100018D38);
  qword_10001EA78 = result;
  return result;
}

unint64_t sub_1000116B4(int a1)
{
  uint64_t v2 = static Hasher._hash(seed:bytes:count:)();

  return sub_1000118F8(a1, v2);
}

unint64_t sub_100011700()
{
  unint64_t result = qword_10001E760;
  if (!qword_10001E760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E760);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceInfo()
{
  return &type metadata for DeviceInfo;
}

uint64_t getEnumTagSinglePayload for DeviceInfo.DeviceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeviceInfo.DeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1000118C0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceInfo.DeviceType()
{
  return &type metadata for DeviceInfo.DeviceType;
}

unint64_t sub_1000118F8(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100011994(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1000050F4(&qword_10001E768);
    int v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (unsigned char *)(a1 + 36); ; i += 8)
    {
      int v5 = *((_DWORD *)i - 1);
      char v6 = *i;
      unint64_t result = sub_1000116B4(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_100011A6C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100011A7C()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10001EB88 = (uint64_t)result;
  return result;
}

uint64_t sub_100011AD0(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001EC48);
}

uint64_t sub_100011AF8()
{
  return sub_100011EAC(&qword_10001EB90, (uint64_t)qword_10001EC48);
}

uint64_t sub_100011B1C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EB90, (uint64_t)qword_10001EC48, a1);
}

uint64_t sub_100011B40(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001EC60);
}

uint64_t sub_100011B60()
{
  return sub_100011EAC(&qword_10001EB98, (uint64_t)qword_10001EC60);
}

uint64_t sub_100011B84@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EB98, (uint64_t)qword_10001EC60, a1);
}

uint64_t sub_100011BA8(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001EC78);
}

uint64_t sub_100011BD0()
{
  return sub_100011EAC(&qword_10001EBA0, (uint64_t)qword_10001EC78);
}

uint64_t sub_100011BF4@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBA0, (uint64_t)qword_10001EC78, a1);
}

uint64_t sub_100011C18(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001EC90);
}

uint64_t sub_100011C38()
{
  return sub_100011EAC(&qword_10001EBA8, (uint64_t)qword_10001EC90);
}

uint64_t sub_100011C5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBA8, (uint64_t)qword_10001EC90, a1);
}

uint64_t sub_100011C80(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001ECA8);
}

uint64_t sub_100011CA8()
{
  return sub_100011EAC(&qword_10001EBB0, (uint64_t)qword_10001ECA8);
}

uint64_t sub_100011CCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBB0, (uint64_t)qword_10001ECA8, a1);
}

uint64_t sub_100011CF0(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001ECC0);
}

uint64_t sub_100011D0C()
{
  return sub_100011EAC(&qword_10001EBB8, (uint64_t)qword_10001ECC0);
}

uint64_t sub_100011D30@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBB8, (uint64_t)qword_10001ECC0, a1);
}

uint64_t sub_100011D54(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001ECD8);
}

uint64_t sub_100011D78()
{
  return sub_100011EAC(&qword_10001EBC0, (uint64_t)qword_10001ECD8);
}

uint64_t sub_100011D9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBC0, (uint64_t)qword_10001ECD8, a1);
}

uint64_t sub_100011DC0(uint64_t a1)
{
  return sub_100011DE4(a1, qword_10001ECF0);
}

uint64_t sub_100011DE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for ImageResource();
  sub_100005B94(v3, a2);
  sub_100005818(v3, (uint64_t)a2);
  if (qword_10001EB80 != -1) {
    swift_once();
  }
  id v4 = (id)qword_10001EB88;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100011E88()
{
  return sub_100011EAC(&qword_10001EBC8, (uint64_t)qword_10001ECF0);
}

uint64_t sub_100011EAC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();

  return sub_100005818(v3, a2);
}

uint64_t sub_100011F00@<X0>(uint64_t a1@<X8>)
{
  return sub_100011F24(&qword_10001EBC8, (uint64_t)qword_10001ECF0, a1);
}

uint64_t sub_100011F24@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = sub_100005818(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100011FE0()
{
  uint64_t v0 = abort_report_np();
  sub_100012008(v0);
}

void sub_100012008()
{
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.name.getter()
{
  return Notification.name.getter();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
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
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.debugDescription.getter()
{
  return URL.debugDescription.getter();
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

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
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

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
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

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
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

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
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

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SFAddSuffixForCurrentDeviceClass()
{
  return _SFAddSuffixForCurrentDeviceClass();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

uint64_t WiFiCopyCurrentNetworkInfo()
{
  return _WiFiCopyCurrentNetworkInfo();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_initWithDeviceIdentifier_identifierType_deviceType_launchContext_launchMethod_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:];
}

id objc_msgSend_presentWithContext_(void *a1, const char *a2, ...)
{
  return [a1 presentWithContext:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}