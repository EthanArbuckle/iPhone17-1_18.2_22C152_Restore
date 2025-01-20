uint64_t sub_100004C88()
{
  char *v0;
  char *v1;
  objc_class *v2;
  id v3;
  id v4;
  char *v5;
  id v6;
  char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  objc_super v20;

  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession] = 0;
  v1 = &v0[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router];
  v2 = (objc_class *)type metadata accessor for ASUIRootViewController();
  *((void *)v1 + 1) = 0;
  *((void *)v1 + 2) = 0;
  *(void *)v1 = 0;
  v20.receiver = v0;
  v20.super_class = v2;
  [super initWithNibName:0 bundle:0];
  v4 = objc_allocWithZone((Class)type metadata accessor for ASUIRouter());
  v5 = (char *)v3;
  v6 = [v4 init];
  v7 = &v5[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router];
  *(void *)v7 = v6;
  *((void *)v7 + 1) = &off_100059E48;
  *((void *)v7 + 2) = &off_100059EB0;
  swift_unknownObjectRelease();
  v8 = [objc_allocWithZone((Class)type metadata accessor for ASUIPickingSession()) init];
  v9 = OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession;
  v10 = *(void **)&v5[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession];
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_pickingSession] = v8;

  v11 = *(void *)&v5[v9];
  if (!v11)
  {
    __break(1u);
    goto LABEL_7;
  }
  v12 = *(void *)v7;
  if (!*(void *)v7)
  {
LABEL_7:
    *(void *)(v11 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_delegate + 8) = 0;
    result = swift_unknownObjectWeakAssign();
    __break(1u);
    return result;
  }
  *(void *)(v11 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_delegate + 8) = *((void *)v7 + 1);
  swift_unknownObjectWeakAssign();
  v13 = *(void **)&v5[v9];
  v14 = *(void **)(v12 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  *(void *)(v12 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession) = v13;
  v15 = v13;

  if (qword_1000629B0 != -1) {
    swift_once();
  }
  v16 = qword_100064A90;

  v17 = *((void *)v7 + 2);
  v18 = v16 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_router;
  *(_OWORD *)v18 = *(_OWORD *)v7;
  *(void *)(v18 + 16) = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return (uint64_t)v5;
}

void sub_100004F7C()
{
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v1)
  {
    int v2 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType);
    if (!v2)
    {
      if (!*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router])
      {
LABEL_21:
        __break(1u);
        return;
      }
      swift_unknownObjectRetain();
      sub_100021F30(v0);
      goto LABEL_15;
    }
    if (v2 == 2)
    {
      if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router])
      {
        swift_unknownObjectRetain();
        sub_100022318(v0);
        swift_unknownObjectRelease();
        v3 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
        if (v3)
        {
          [v3 pickerStartedRename];
        }
        return;
      }
      goto LABEL_20;
    }
  }
  if (!*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI22ASUIRootViewController_router])
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_unknownObjectRetain();
  sub_1000221F4(v0);
LABEL_15:

  swift_unknownObjectRelease();
}

void sub_1000050EC(void (*a1)(void))
{
  if (a1) {
    a1();
  }
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  [Strong invalidate];
}

id sub_1000052EC()
{
  return sub_10000555C(type metadata accessor for ASUIRootViewController);
}

uint64_t type metadata accessor for ASUIRootViewController()
{
  return self;
}

id sub_100005388(void *a1, void *a2)
{
  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for ASUIHostingWindow();
  id v5 = [super initWithWindowScene:a1];
  v6 = self;
  id v7 = v5;
  id v8 = [v6 clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setOpaque:0];
  [v7 makeKeyAndVisible];
  id v9 = v7;
  [v9 setClipsToBounds:1];

  return v9;
}

void sub_100005520()
{
}

id sub_100005544()
{
  return sub_10000555C(type metadata accessor for ASUIHostingWindow);
}

id sub_10000555C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIHostingWindow()
{
  return self;
}

uint64_t sub_1000055B8(uint64_t a1)
{
  uint64_t v2 = sub_100005BB4(&qword_100062B68, type metadata accessor for ASError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005624(uint64_t a1)
{
  uint64_t v2 = sub_100005BB4(&qword_100062B68, type metadata accessor for ASError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005694(uint64_t a1)
{
  uint64_t v2 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100005700()
{
  return *v0;
}

uint64_t sub_100005708@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100005710()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005720(uint64_t a1)
{
  uint64_t v2 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000578C(uint64_t a1)
{
  uint64_t v2 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000057F8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100005888()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000058C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10000593C()
{
  return Hasher._finalize()();
}

void *sub_10000599C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000059AC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000059B8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100005A00()
{
  sub_1000050EC(*(void (**)(void))(v0 + 16));
}

uint64_t sub_100005A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005A1C()
{
  return swift_release();
}

uint64_t sub_100005A24(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100005A34(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100005A44()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005A7C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void type metadata accessor for ASError(uint64_t a1)
{
}

uint64_t sub_100005AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005B24()
{
  return sub_100005BB4(&qword_100062B58, type metadata accessor for ASError);
}

uint64_t sub_100005B6C()
{
  return sub_100005BB4(&qword_100062B60, type metadata accessor for ASError);
}

uint64_t sub_100005BB4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005BFC()
{
  return sub_100005BB4(&qword_100062B68, type metadata accessor for ASError);
}

uint64_t sub_100005C44()
{
  return sub_100005BB4(&qword_100062B70, type metadata accessor for ASError);
}

uint64_t sub_100005C8C()
{
  return sub_100005BB4(&qword_100062B78, type metadata accessor for ASError);
}

uint64_t sub_100005CD4()
{
  return sub_100005BB4(&qword_100062B80, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100005D30(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005D78()
{
  return sub_100005BB4(&qword_100062B88, type metadata accessor for Code);
}

unint64_t sub_100005DC4()
{
  unint64_t result = qword_100062B90;
  if (!qword_100062B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100062B90);
  }
  return result;
}

uint64_t sub_100005E18()
{
  return sub_100005BB4(&qword_100062B98, type metadata accessor for Code);
}

uint64_t sub_100005E60()
{
  return sub_100005BB4(&qword_100062BA0, type metadata accessor for ASError);
}

BOOL sub_100005EA8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005EBC(uint64_t a1)
{
  return sub_100005FF4(a1, qword_100064A10);
}

uint64_t sub_100005EDC(uint64_t a1)
{
  return sub_100005FF4(a1, qword_100064A28);
}

uint64_t *sub_100005F08(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005F6C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005FA4(uint64_t a1)
{
  return sub_100005FF4(a1, qword_100064A40);
}

uint64_t sub_100005FC8(uint64_t a1)
{
  return sub_100005FF4(a1, qword_100064A58);
}

uint64_t sub_100005FF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005F08(v3, a2);
  sub_100005F6C(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000606C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100062C70);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100062C70);
  if (qword_1000628E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A10);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

double sub_100006134()
{
  double result = PRXMainContentMargin;
  qword_100062C88 = PRXMainContentMargin;
  return result;
}

double sub_10000614C()
{
  double result = PRXTitleToSubtitleMargin;
  qword_100062C90 = PRXTitleToSubtitleMargin;
  return result;
}

double sub_100006164()
{
  double result = PRXMainContentMargin + 14.0;
  *(double *)&qword_100062C98 = PRXMainContentMargin + 14.0;
  return result;
}

void sub_100006184()
{
  qword_100062CA0 = 0x4028000000000000;
}

void sub_100006194()
{
  qword_100062CA8 = 0x4000000000000000;
}

double sub_1000061A4()
{
  if (qword_1000629A0 != -1) {
    swift_once();
  }
  double result = *(double *)&productImageBoxHeight;
  carouselVisibleHeight = productImageBoxHeight;
  return result;
}

uint64_t *carouselVisibleHeight.unsafeMutableAddressor()
{
  if (qword_100062930 != -1) {
    swift_once();
  }
  return &carouselVisibleHeight;
}

void sub_100006248()
{
  qword_100062CB0 = 0x404E000000000000;
}

void sub_100006258()
{
  qword_100062CB8 = 0x404E000000000000;
}

void sub_100006268()
{
  qword_100062CC0 = 0x402E000000000000;
}

void sub_100006278()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)v25 - v7;
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (!v9)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (*(unsigned char *)(v9 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType) == 1) {
    goto LABEL_19;
  }
  uint64_t v10 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
  unint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx);
  uint64_t v12 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices;
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices);
  if ((v13 & 0xC000000000000001) == 0)
  {
    if ((v11 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v11 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      v14 = (char *)*(id *)(v13 + 8 * v11 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  v14 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
  swift_bridgeObjectRelease();
LABEL_9:
  v15 = *(void **)&v14[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (v15)
  {
    id v16 = [v15 appAccessInfoMap];
    if (v16)
    {
      v17 = v16;
      v25[0] = v10;
      sub_10000C108(0, (unint64_t *)&qword_100062DB0);
      uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v19 = *(void *)(v18 + 16);
      swift_bridgeObjectRelease();
      if (v19)
      {
        unint64_t v20 = *(void *)(v0 + v25[0]);
        uint64_t v21 = *(void *)(v0 + v12);
        if ((v21 & 0xC000000000000001) == 0)
        {
          if ((v20 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v20 < *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            v22 = (char *)*(id *)(v21 + 8 * v20 + 32);
            goto LABEL_16;
          }
          __break(1u);
          goto LABEL_26;
        }
LABEL_23:
        swift_bridgeObjectRetain();
        v22 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_bridgeObjectRelease();
LABEL_16:
        uint64_t v24 = *(void *)&v22[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
        v23 = *(void **)&v22[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
        swift_bridgeObjectRetain();

        if (v23)
        {
          sub_10004525C(v24, v23);
          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_28;
      }
    }
    else
    {
    }
LABEL_19:
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

void sub_100006668()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx);
  uint64_t v3 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices);
  if ((v4 & 0xC000000000000001) == 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v2 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v5 = (char *)*(id *)(v4 + 8 * v2 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v6 = *(void **)&v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v6) {
    goto LABEL_22;
  }
  id v7 = [v6 appAccessInfoMap];
  if (!v7)
  {

LABEL_10:
    unint64_t v11 = *(void *)(v0 + v1);
    uint64_t v12 = *(void *)(v0 + v3);
    if ((v12 & 0xC000000000000001) == 0)
    {
      if ((v11 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v11 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v13 = (char *)*(id *)(v12 + 8 * v11 + 32);
        goto LABEL_14;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      return;
    }
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v13 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v15 = *(void *)&v13[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
    v14 = *(void **)&v13[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
    swift_bridgeObjectRetain();

    if (v14)
    {
      uint64_t v16 = v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName;
      uint64_t v17 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName);
      uint64_t v18 = *(void **)(v16 + 8);
      swift_bridgeObjectRetain();
      sub_100045484(v15, v14, v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_23;
  }
  id v8 = v7;
  sub_10000C108(0, (unint64_t *)&qword_100062DB0);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_10;
  }
}

id sub_10000686C(id a1, uint64_t a2)
{
  double v3 = 0.0;
  if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_shouldOnlyDisplayCenterPage) & 1) == 0) {
    [a1 alpha:0.0];
  }

  return [a1 setAlpha:v3];
}

char *sub_1000068CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_100062900 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100005F6C(v8, (uint64_t)qword_100062C70);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v21 = v4;
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 136315138;
    type metadata accessor for ASUIDevice();
    swift_bridgeObjectRetain();
    uint64_t v12 = Array.description.getter();
    uint64_t v13 = a3;
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = v12;
    uint64_t v4 = v21;
    sub_100023B0C(v16, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v13;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "init ASUIProductCarouselView with devices %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v17 = (char *)[objc_allocWithZone(v4) initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&v17[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices] = a1;
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = &v18[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName];
  *(void *)uint64_t v19 = a2;
  *((void *)v19 + 1) = a3;
  swift_bridgeObjectRelease();
  sub_100008A40();

  return v18;
}

uint64_t sub_100006B2C(unint64_t a1)
{
  double v3 = v1;
  if (qword_100062900 != -1) {
    goto LABEL_50;
  }
  while (1)
  {
    uint64_t v5 = type metadata accessor for Logger();
    sub_100005F6C(v5, (uint64_t)qword_100062C70);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    v73 = v3;
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v2 = swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v2 = 136315138;
      type metadata accessor for ASUIDevice();
      swift_bridgeObjectRetain();
      uint64_t v8 = Array.description.getter();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      uint64_t v11 = v8;
      double v3 = v73;
      uint64_t v82 = sub_100023B0C(v11, v10, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "update with devices %s", (uint8_t *)v2, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (!*(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView])
    {
      *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices] = a1;
      swift_bridgeObjectRetain();
      return swift_bridgeObjectRelease();
    }
    uint64_t v12 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages;
    unint64_t v13 = a1 >> 62;
    if (a1 >> 62)
    {
      Swift::Int v15 = *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages];
      swift_bridgeObjectRetain();
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)&v3[v12];
    }
    else
    {
      uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      Swift::Int v15 = *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages];
      uint64_t v16 = v15;
    }
    *(void *)&v3[v12] = v14;
    if (v16 > 1 || v14 < 2)
    {
      sub_100008448();
    }
    else
    {
      uint64_t aBlock = v14;
      swift_retain();
      CurrentValueSubject.send(_:)();
      swift_release();
    }
    uint64_t v18 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices;
    *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices] = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v14 < v15)
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    if (v13)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v19 < v15) {
      goto LABEL_53;
    }
    if (v15 < 0) {
      goto LABEL_54;
    }
    if (v13)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v20 < v14) {
      goto LABEL_55;
    }
    if ((a1 & 0xC000000000000001) != 0 && v15 != v14)
    {
      if (v15 >= (unint64_t)v14)
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
      type metadata accessor for ASUIDevice();
      Swift::Int v21 = v15;
      do
      {
        Swift::Int v22 = v21 + 1;
        _ArrayBuffer._typeCheckSlowPath(_:)(v21);
        Swift::Int v21 = v22;
      }
      while (v14 != v22);
    }
    uint64_t v67 = v18;
    if (v13) {
      break;
    }
    uint64_t v72 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    swift_bridgeObjectRetain();
    uint64_t v2 = v15;
    if (v15 == v14) {
      goto LABEL_32;
    }
LABEL_37:
    v29 = &v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
    uint64_t v30 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView;
    id v71 = self;
    swift_beginAccess();
    uint64_t v69 = v14;
    uint64_t v70 = v30;
    v68 = v29;
    while (v2 < v14)
    {
      v74 = (uint8_t *)v2;
      v31 = *(void **)(v72 + 8 * v2);
      if (*(void *)v29 >> 62)
      {
        id v61 = v31;
        swift_bridgeObjectRetain();
        uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v32 = *(void *)((*(void *)v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v33 = v31;
      }
      uint64_t v2 = (uint64_t)&selRef_viewDidLoad;
      v34 = (objc_class *)type metadata accessor for ASUIProductPageView();
      v35 = (char *)objc_allocWithZone(v34);
      *(void *)&v35[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView] = 0;
      v36 = v35;
      NSString v37 = String._bridgeToObjectiveC()();
      id v38 = [v71 systemImageNamed:v37];

      if (!v38) {
        goto LABEL_61;
      }
      *(void *)&v36[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_defaultSymbolImage] = v38;
      *(void *)&v36[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_device] = v31;
      *(void *)&v36[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_index] = v32;
      id v39 = v31;

      v81.receiver = v36;
      v81.super_class = v34;
      id v40 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
      sub_10002EDB0();

      [v40 setAlpha:0.0];
      swift_beginAccess();
      id v41 = v40;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((*(void *)v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v29 & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_endAccess();
      v42 = *(void **)&v73[v70];
      if (!v42) {
        goto LABEL_62;
      }
      [v42 addArrangedSubview:v41];
      sub_10000BEA4(&qword_100062D98);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_100049250;
      id v44 = [v41 widthAnchor];
      id v45 = [v73 widthAnchor];
      id v46 = [v44 constraintEqualToAnchor:v45];

      *(void *)(v43 + 32) = v46;
      id v47 = [v41 heightAnchor];
      v48 = *(void **)&v73[v70];
      if (!v48) {
        goto LABEL_63;
      }
      v49 = v47;
      uint64_t v2 = (uint64_t)(v74 + 1);
      v50 = self;
      id v51 = [v48 heightAnchor];
      id v52 = [v49 constraintEqualToAnchor:v51];

      *(void *)(v43 + 40) = v52;
      uint64_t aBlock = v43;
      specialized Array._endMutation()();
      sub_10000C108(0, (unint64_t *)&qword_100062DA0);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v50 activateConstraints:isa];

      v54 = self;
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = v41;
      v79 = sub_10000C028;
      uint64_t v80 = v55;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v76 = 1107296256;
      v77 = sub_100015768;
      v78 = &unk_100059360;
      v56 = _Block_copy(&aBlock);
      id v57 = v41;
      swift_release();
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = v57;
      *(void *)(v58 + 24) = v73;
      v79 = sub_10000C080;
      uint64_t v80 = v58;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v76 = 1107296256;
      v77 = sub_10002F7C0;
      v78 = &unk_1000593B0;
      v59 = _Block_copy(&aBlock);
      a1 = (unint64_t)v57;
      v60 = v73;
      swift_release();
      [v54 animateWithDuration:v56 animations:v59 completion:0.00001];
      _Block_release(v59);
      _Block_release(v56);

      uint64_t v14 = v69;
      double v3 = v73;
      v29 = v68;
      if ((uint8_t *)v69 == v74 + 1) {
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_50:
    swift_once();
  }
  swift_bridgeObjectRetain();
  _CocoaArrayWrapper.subscript.getter();
  uint64_t v72 = v23;
  uint64_t v2 = (uint64_t)v24;
  unint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v14 = v26 >> 1;
  if (v2 != v26 >> 1) {
    goto LABEL_37;
  }
LABEL_32:
  swift_unknownObjectRelease();
  sub_1000076C8(*(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx], 0);
  uint64_t v12 = v67;
  unint64_t v27 = *(void *)&v3[v67];
  if (!(v27 >> 62))
  {
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_34;
  }
LABEL_56:
  swift_bridgeObjectRetain();
  uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_34:
  uint64_t v2 = (uint64_t)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
  uint64_t result = swift_beginAccess();
  if (*(void *)v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v62 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v28 == v62) {
      return result;
    }
  }
  else if (v28 == *(void *)((*(void *)v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return result;
  }
  _StringGuts.grow(_:)(62);
  v63._countAndFlagsBits = 0xD000000000000032;
  v63._object = (void *)0x800000010004A1D0;
  String.append(_:)(v63);
  if (*(void *)&v3[v12] >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  v64._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v64);
  swift_bridgeObjectRelease();
  v65._countAndFlagsBits = 0x3A7365676170202CLL;
  v65._object = (void *)0xE800000000000000;
  String.append(_:)(v65);
  if (*(void *)v2 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  v66._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v66);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_1000076C8(id result, char a2)
{
  double v3 = v2;
  uint64_t v4 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages;
  if (*(void *)&v2[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages] <= (uint64_t)result) {
    return result;
  }
  id v6 = result;
  uint64_t result = [v3 layoutIfNeeded];
  uint64_t v7 = *(void *)&v3[v4];
  BOOL v8 = __OFSUB__(v7, v6);
  uint64_t v9 = v7 - (void)v6;
  if (v8)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v10 = v9 - 1;
  if (__OFSUB__(v9, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v11 = [v3 effectiveUserInterfaceLayoutDirection];
  uint64_t v12 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView;
  uint64_t result = *(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [result bounds];
  double Width = CGRectGetWidth(v16);
  uint64_t result = *(id *)&v3[v12];
  if (!result)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  if (v11 == (id)1) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = (uint64_t)v6;
  }
  uint64_t result = [result setContentOffset:Width * (double)v14 animated:0.0];
  uint64_t v15 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
  if (*(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] != v6)
  {
    *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] = v6;
    swift_retain();
    CurrentValueSubject.send(_:)();
    swift_release();
    uint64_t result = *(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl];
    if (result) {
      return [result setCurrentPage:*(void *)&v3[v15]];
    }
  }
  return result;
}

void sub_100007814()
{
  sub_100006668();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(v4) & 0xF;
  }
  else {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel);
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  id v7 = [v6 topAnchor];
  BOOL v8 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel);
  if (!v8)
  {
LABEL_15:
    __break(1u);
    return;
  }
  id v9 = [v8 bottomAnchor];
  if (v5)
  {
    if (qword_100062910 != -1) {
      swift_once();
    }
    double v10 = *(double *)&qword_100062C90;
  }
  else
  {
    double v10 = 0.0;
  }
  id v11 = [v7 constraintEqualToAnchor:v9 constant:v10];

  [v11 setActive:1];
}

void sub_100007950()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel);
  if (!v1)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v2 = v1;
  sub_100006278();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v2 setText:v3];

  unint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel);
  if (!v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v5 = v4;
  sub_100006668();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setText:v6];

  sub_100007814();
  id v7 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel);
  if (!v7)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx);
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices);
  if ((v9 & 0xC000000000000001) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      double v10 = *(void **)(v9 + 8 * v8 + 32);
      id v11 = v7;
      uint64_t v12 = v10;
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_20;
  }
  id v17 = v7;
  swift_bridgeObjectRetain();
  uint64_t v12 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  uint64_t v14 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v14)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v15 = [v14 bluetoothOTAName];
  if (v15) {
    goto LABEL_12;
  }
  CGRect v16 = *(void **)&v12[v13];
  if (!v16)
  {
LABEL_24:
    __break(1u);
    return;
  }
  id v15 = [v16 SSID];
  if (!v15)
  {

    NSString v18 = 0;
    [v7 setText:0];
    goto LABEL_13;
  }
LABEL_12:
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v7 setText:v18];
LABEL_13:
}

void sub_100007B70()
{
  sub_100006668();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel;
  id v7 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel];
  if (v5)
  {
    if (v7)
    {
      id v8 = [v7 superview];

      if (!v8)
      {
        sub_100008130();
        uint64_t v9 = *(void **)&v0[v6];
        if (v9)
        {
          [v9 setAlpha:0.0];
          double v10 = *(void **)&v0[v6];
          if (v10)
          {
            id v11 = v10;
            sub_100006668();
            NSString v12 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            [v11 setText:v12];

            uint64_t v13 = self;
            uint64_t v14 = swift_allocObject();
            *(void *)(v14 + 16) = v0;
            v29 = (uint64_t (*)())sub_10000C000;
            uint64_t v30 = v14;
            unint64_t v25 = _NSConcreteStackBlock;
            uint64_t v26 = 1107296256;
            unint64_t v27 = sub_100015768;
            uint64_t v28 = &unk_100059310;
            id v15 = _Block_copy(&v25);
            CGRect v16 = v0;
            swift_release();
            [v13 animateWithDuration:v15 animations:0.5];
            _Block_release(v15);
LABEL_13:
            char v19 = 1;
LABEL_15:
            uint64_t v20 = self;
            v29 = nullsub_1;
            uint64_t v30 = 0;
            unint64_t v25 = _NSConcreteStackBlock;
            uint64_t v26 = 1107296256;
            unint64_t v27 = sub_100015768;
            uint64_t v28 = &unk_100059270;
            Swift::Int v21 = _Block_copy(&v25);
            uint64_t v22 = swift_allocObject();
            *(void *)(v22 + 16) = v0;
            *(unsigned char *)(v22 + 24) = v19;
            v29 = (uint64_t (*)())sub_10000BFF4;
            uint64_t v30 = v22;
            unint64_t v25 = _NSConcreteStackBlock;
            uint64_t v26 = 1107296256;
            unint64_t v27 = sub_10002F7C0;
            uint64_t v28 = &unk_1000592C0;
            uint64_t v23 = _Block_copy(&v25);
            uint64_t v24 = v0;
            swift_release();
            [v20 animateWithDuration:v21 animations:v23 completion:0.3];
            _Block_release(v23);
            _Block_release(v21);
            return;
          }
          goto LABEL_19;
        }
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_14:
      char v19 = 0;
      goto LABEL_15;
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!v7) {
    goto LABEL_17;
  }
  id v17 = [v7 superview];

  if (!v17) {
    goto LABEL_14;
  }
  NSString v18 = *(void **)&v0[v6];
  if (v18)
  {
    [v18 removeFromSuperview];
    goto LABEL_13;
  }
LABEL_20:
  __break(1u);
}

void sub_100007EA0(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v3 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel);
  if (!v3)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v6 = v3;
  sub_100006278();
  sub_10000BB68(0.2);
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 setText:v7];

  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0)
  {
    id v8 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel);
    if (!v8)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    id v9 = v8;
    sub_100006668();
    sub_10000BB68(0.2);
    NSString v10 = String._bridgeToObjectiveC()();
    [v9 setText:v10];

    swift_bridgeObjectRelease();
  }
  id v11 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel);
  if (!v11) {
    goto LABEL_25;
  }
  unint64_t v12 = *(void *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx);
  uint64_t v13 = *(void *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices);
  if ((v13 & 0xC000000000000001) == 0)
  {
    if ((v12 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v12 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v14 = *(void **)(v13 + 8 * v12 + 32);
      id v15 = v11;
      CGRect v16 = v14;
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_24;
  }
  id v24 = v11;
  swift_bridgeObjectRetain();
  CGRect v16 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
  swift_bridgeObjectRelease();
LABEL_10:
  uint64_t v17 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  NSString v18 = *(void **)&v16[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v19 = [v18 bluetoothOTAName];
  if (v19) {
    goto LABEL_14;
  }
  uint64_t v20 = *(void **)&v16[v17];
  if (!v20)
  {
LABEL_28:
    __break(1u);
    return;
  }
  id v19 = [v20 SSID];
  if (!v19)
  {

    sub_10000BB68(0.2);
    goto LABEL_17;
  }
LABEL_14:
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  sub_10000BB68(0.2);
  if (!v22)
  {
LABEL_17:
    NSString v23 = 0;
    goto LABEL_18;
  }
  NSString v23 = String._bridgeToObjectiveC()();
LABEL_18:
  id v25 = v23;
  [v11 setText:];

  swift_bridgeObjectRelease();
}

void sub_100008130()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel];
  if (!v2)
  {
    __break(1u);
    goto LABEL_17;
  }
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v3 = *(void **)&v0[v1];
  if (!v3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  [v3 setNumberOfLines:0];
  unint64_t v4 = *(void **)&v0[v1];
  if (!v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  [v4 setTextAlignment:1];
  if (!*(void *)&v0[v1])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  [v0 addSubview:];
  sub_10000BEA4(&qword_100062D98);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100049260;
  id v6 = *(void **)&v0[v1];
  if (!v6)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v7 = [v6 topAnchor];
  id v8 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel];
  if (!v8)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v9 = [v8 bottomAnchor];
  if (qword_100062910 != -1) {
    swift_once();
  }
  id v10 = [v7 constraintEqualToAnchor:v9 constant:*(double *)&qword_100062C90];

  *(void *)(v5 + 32) = v10;
  id v11 = *(void **)&v0[v1];
  if (!v11) {
    goto LABEL_22;
  }
  id v12 = [v11 centerXAnchor];
  id v13 = [v0 centerXAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v5 + 40) = v14;
  id v15 = *(void **)&v0[v1];
  if (!v15)
  {
LABEL_23:
    __break(1u);
    return;
  }
  CGRect v16 = self;
  id v17 = [v15 widthAnchor];
  id v18 = [v0 widthAnchor];
  if (qword_100062908 != -1) {
    swift_once();
  }
  id v19 = [v17 constraintEqualToAnchor:v18 constant:*(double *)&qword_100062C88 * -2.0];

  *(void *)(v5 + 48) = v19;
  specialized Array._endMutation()();
  sub_10000C108(0, (unint64_t *)&qword_100062DA0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v16 activateConstraints:isa];
}

void sub_100008448()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl];
  if (!v2) {
    return;
  }
  uint64_t v3 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages;
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages];
  id v11 = v2;
  id v5 = [v11 superview];

  if (v4 > 1)
  {
    if (v5)
    {
      LODWORD(v5) = 0;
      goto LABEL_9;
    }
    sub_100008618();
  }
  else
  {
    if (!v5) {
      goto LABEL_9;
    }
    [v11 removeFromSuperview];
  }
  LODWORD(v5) = 1;
LABEL_9:
  id v6 = *(void **)&v0[v1];
  if (v6)
  {
    [v6 setNumberOfPages:*(void *)&v0[v3]];
    if (v5)
    {
      [v11 setAlpha:0.0];
      id v7 = self;
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v0;
      aBlock[4] = sub_10000BF7C;
      aBlock[5] = v8;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100015768;
      aBlock[3] = &unk_100059248;
      id v9 = _Block_copy(aBlock);
      id v10 = v0;
      swift_release();
      [v7 animateWithDuration:v9 animations:0.333];

      _Block_release(v9);
    }
    else
    {
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100008618()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl];
  if (!v2)
  {
    __break(1u);
    goto LABEL_20;
  }
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = *(void **)&v0[v1];
  if (!v3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  [v3 addTarget:v0 action:"pageControlChangedWithPageControl:" forControlEvents:4096];
  uint64_t v4 = *(void **)&v0[v1];
  if (!v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  [v4 setHidesForSinglePage:1];
  id v5 = *(void **)&v0[v1];
  if (!v5)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v6 = self;
  id v7 = v5;
  id v8 = [v6 labelColor];
  [v7 setCurrentPageIndicatorTintColor:v8];

  id v9 = *(void **)&v0[v1];
  if (!v9)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v10 = v9;
  id v11 = [v6 secondaryLabelColor];
  [v10 setPageIndicatorTintColor:v11];

  id v12 = *(void **)&v0[v1];
  if (!v12)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  [v12 setCurrentPage:*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx]];
  id v13 = *(void **)&v0[v1];
  if (!v13)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v14 = &v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
  swift_beginAccess();
  unint64_t v15 = *(void *)v14;
  if (v15 >> 62)
  {
    id v34 = v13;
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v17 = v13;
  }
  [v13 setNumberOfPages:v16];

  if (!*(void *)&v0[v1]) {
    goto LABEL_26;
  }
  [v0 addSubview:];
  sub_10000BEA4(&qword_100062D98);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100049260;
  id v19 = *(void **)&v0[v1];
  if (!v19)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v20 = [v19 topAnchor];
  uint64_t v21 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel];
  if (!v21)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v22 = [v21 bottomAnchor];
  if (qword_100062928 != -1) {
    swift_once();
  }
  id v23 = [v20 constraintEqualToAnchor:v22 constant:*(double *)&qword_100062CA8];

  *(void *)(v18 + 32) = v23;
  id v24 = *(void **)&v0[v1];
  if (!v24) {
    goto LABEL_29;
  }
  id v25 = [v24 centerXAnchor];
  id v26 = [v0 centerXAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  *(void *)(v18 + 40) = v27;
  uint64_t v28 = *(void **)&v0[v1];
  if (v28)
  {
    v29 = self;
    id v30 = [v28 bottomAnchor];
    id v31 = [v0 bottomAnchor];
    id v32 = [v30 constraintEqualToAnchor:v31];

    *(void *)(v18 + 48) = v32;
    specialized Array._endMutation()();
    sub_10000C108(0, (unint64_t *)&qword_100062DA0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v29 activateConstraints:isa, v18];

    return;
  }
LABEL_30:
  __break(1u);
}

void sub_100008A40()
{
  uint64_t v3 = v0;
  id v4 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:0];
  uint64_t v5 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel;
  id v6 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel] = v4;

  id v7 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:0];
  uint64_t v8 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel;
  id v9 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel] = v7;

  id v10 = *(void **)&v3[v8];
  if (!v10)
  {
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  [v10 setAlpha:0.0];
  sub_10000BEA4(&qword_100062D90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100049270;
  Class isa = *(SEL **)&v3[v5];
  *(void *)(inited + 32) = isa;
  uint64_t v285 = v8;
  uint64_t v13 = *(void *)&v3[v8];
  *(void *)(inited + 40) = v13;
  uint64_t aBlock = (void **)inited;
  p_uint64_t aBlock = &aBlock;
  specialized Array._endMutation()();
  unint64_t v15 = aBlock;
  v290 = aBlock + 4;
  id v16 = (id)v13;
  id v17 = isa;
  char v18 = 0;
  unint64_t v19 = 0;
  while (1)
  {
    char v20 = v18;
    if (v19 >= (unint64_t)v15[2]) {
      break;
    }
    uint64_t v21 = v290[v19];
    if (!v21) {
      goto LABEL_196;
    }
    id v22 = v21;
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 setNumberOfLines:0];
    [v22 setTextAlignment:1];
    sub_100006278();
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v22 setText:v23];

    [v3 addSubview:v22];
    uint64_t v1 = (char *)self;
    sub_10000BEA4(&qword_100062D98);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100049260;
    id v25 = [v22 topAnchor];
    id v26 = [v3 topAnchor];
    id v27 = [v25 constraintEqualToAnchor:v26];

    *(void *)(v24 + 32) = v27;
    id v28 = [v22 centerXAnchor];
    id v29 = [v3 centerXAnchor];
    id v30 = [v28 constraintEqualToAnchor:v29];

    *(void *)(v24 + 40) = v30;
    id v31 = [v22 widthAnchor];
    id v32 = [v3 widthAnchor];
    if (qword_100062908 != -1) {
      swift_once();
    }
    uint64_t v2 = (char *)[v31 constraintEqualToAnchor:v32 constant:*(double *)&qword_100062C88 * -2.0];

    *(void *)(v24 + 48) = v2;
    uint64_t aBlock = (void **)v24;
    specialized Array._endMutation()();
    p_uint64_t aBlock = (void ***)aBlock;
    uint64_t v13 = sub_10000C108(0, (unint64_t *)&qword_100062DA0);
    Class isa = (SEL *)Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v1 activateConstraints:isa];

    char v18 = 1;
    unint64_t v19 = 1;
    if (v20)
    {
      uint64_t v2 = v1;
      swift_bridgeObjectRelease();
      id v33 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:1];
      uint64_t v34 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel;
      v35 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel];
      *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel] = v33;

      id v36 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:1];
      uint64_t v1 = (char *)OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel;
      NSString v37 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel];
      *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel] = v36;

      id v38 = *(void **)&v1[(void)v3];
      if (v38)
      {
        [v38 setAlpha:0.0];
        uint64_t v39 = swift_allocObject();
        long long v270 = xmmword_100049280;
        *(_OWORD *)(v39 + 16) = xmmword_100049280;
        id v40 = *(void **)&v1[(void)v3];
        *(void *)(v39 + 32) = v40;
        uint64_t aBlock = (void **)v39;
        specialized Array._endMutation()();
        v299 = aBlock;
        id v41 = v40;
        sub_100006668();
        uint64_t v43 = v42;
        unint64_t v45 = v44;
        swift_bridgeObjectRelease();
        uint64_t v46 = HIBYTE(v45) & 0xF;
        if ((v45 & 0x2000000000000000) == 0) {
          uint64_t v46 = v43 & 0xFFFFFFFFFFFFLL;
        }
        if (v46)
        {
          id v47 = *(id *)&v3[v34];
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if ((unint64_t)v299[2] >= (unint64_t)v299[3] >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
        v289 = v2;
        v48 = v299;
        v49 = v299[2];
        Class isa = (SEL *)&selRef_viewDidLoad;
        if (v49)
        {
          v281 = v1;
          swift_bridgeObjectRetain();
          v50 = 0;
          do
          {
            id v51 = v48[(void)v50 + 4];
            if (!v51) {
              goto LABEL_196;
            }
            id v52 = v51;
            [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
            [v52 setNumberOfLines:0];
            [v52 setTextAlignment:1];
            sub_100006668();
            NSString v53 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            [v52 setText:v53];

            [v3 addSubview:v52];
            uint64_t v54 = swift_allocObject();
            *(_OWORD *)(v54 + 16) = xmmword_100049260;
            id v55 = [v52 topAnchor];
            v56 = *(void **)&v3[v285];
            if (!v56) {
              goto LABEL_146;
            }
            id v57 = [v56 bottomAnchor];
            if (qword_100062910 != -1) {
              swift_once();
            }
            v50 = (char *)v50 + 1;
            id v58 = [v55 constraintEqualToAnchor:v57 constant:*(double *)&qword_100062C90];

            *(void *)(v54 + 32) = v58;
            id v59 = [v52 centerXAnchor];
            id v60 = [v3 centerXAnchor];
            id v61 = [v59 constraintEqualToAnchor:v60];

            *(void *)(v54 + 40) = v61;
            id v62 = [v52 widthAnchor];
            id v63 = [v3 widthAnchor];
            id v64 = [v62 constraintEqualToAnchor:v63 constant:*(double *)&qword_100062C88 * -2.0];

            *(void *)(v54 + 48) = v64;
            uint64_t aBlock = (void **)v54;
            specialized Array._endMutation()();
            Class v65 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            uint64_t v2 = v289;
            [v289 activateConstraints:v65];
          }
          while (v49 != v50);
          swift_bridgeObjectRelease();
          Class isa = (SEL *)&selRef_viewDidLoad;
          uint64_t v1 = v281;
        }
        sub_100007814();
        id v66 = [objc_allocWithZone((Class)UIScrollView) init];
        uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView;
        uint64_t v67 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView];
        *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView] = v66;

        v68 = *(void **)&v3[v13];
        if (v68)
        {
          [v68 setScrollEnabled:1];
          uint64_t v69 = *(void **)&v3[v13];
          if (v69)
          {
            [v69 setTranslatesAutoresizingMaskIntoConstraints:0];
            uint64_t v70 = *(void **)&v3[v13];
            if (v70)
            {
              [v70 setDelegate:v3];
              id v71 = *(void **)&v3[v13];
              if (v71)
              {
                [v71 setDecelerationRate:UIScrollViewDecelerationRateFast];
                uint64_t v72 = *(void **)&v3[v13];
                if (v72)
                {
                  [v72 setClipsToBounds:0];
                  v73 = *(void **)&v3[v13];
                  if (v73)
                  {
                    [v73 setShowsHorizontalScrollIndicator:0];
                    v74 = *(void **)&v3[v13];
                    if (v74)
                    {
                      [v74 _setInterpageSpacing:0.0, 0.0];
                      v75 = *(void **)&v3[v13];
                      if (v75)
                      {
                        uint64_t v76 = qword_100062938;
                        p_uint64_t aBlock = v75;
                        if (v76 == -1) {
                          goto LABEL_32;
                        }
                        goto LABEL_84;
                      }
LABEL_160:
                      __break(1u);
LABEL_161:
                      __break(1u);
                      goto LABEL_162;
                    }
LABEL_159:
                    __break(1u);
                    goto LABEL_160;
                  }
LABEL_158:
                  __break(1u);
                  goto LABEL_159;
                }
LABEL_157:
                __break(1u);
                goto LABEL_158;
              }
LABEL_156:
              __break(1u);
              goto LABEL_157;
            }
LABEL_155:
            __break(1u);
            goto LABEL_156;
          }
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }
LABEL_153:
        __break(1u);
        goto LABEL_154;
      }
LABEL_152:
      __break(1u);
      goto LABEL_153;
    }
  }
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  swift_once();
LABEL_32:
  double v77 = -*(double *)&qword_100062CB0;
  if (qword_100062940 != -1) {
    swift_once();
  }
  [p_aBlock _setTouchInsets:v77 top:0.0 left:-*(double *)&qword_100062CB8 bottom:0.0];

  if (!*(void *)&v3[v13]) {
    goto LABEL_161;
  }
  [v3 addSubview:];
  uint64_t v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_100049290;
  v79 = *(void **)&v3[v13];
  if (!v79)
  {
LABEL_162:
    __break(1u);
    goto LABEL_163;
  }
  id v80 = [v79 topAnchor];
  objc_super v81 = *(void **)&v1[(void)v3];
  if (!v81)
  {
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
    goto LABEL_166;
  }
  id v82 = [v81 isa[29]];
  if (qword_100062918 != -1) {
    swift_once();
  }
  id v83 = [v80 constraintEqualToAnchor:v82 constant:*(double *)&qword_100062C98];

  *(void *)(v78 + 32) = v83;
  v84 = *(void **)&v3[v13];
  if (!v84) {
    goto LABEL_164;
  }
  id v85 = [v84 heightAnchor];
  if (qword_100062930 != -1) {
    swift_once();
  }
  id v86 = [v85 constraintEqualToConstant:*(double *)&carouselVisibleHeight];

  *(void *)(v78 + 40) = v86;
  v87 = *(void **)&v3[v13];
  if (!v87) {
    goto LABEL_165;
  }
  id v88 = [v87 leadingAnchor];
  id v89 = [v3 leadingAnchor];
  id v90 = [v88 constraintEqualToAnchor:v89];

  *(void *)(v78 + 48) = v90;
  v279 = (char **)v13;
  v91 = *(void **)&v3[v13];
  if (!v91)
  {
LABEL_166:
    __break(1u);
    goto LABEL_167;
  }
  id v92 = [v91 trailingAnchor];
  id v93 = [v3 trailingAnchor];
  id v94 = [v92 constraintEqualToAnchor:v93];

  *(void *)(v78 + 56) = v94;
  uint64_t aBlock = (void **)v78;
  specialized Array._endMutation()();
  Class v95 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 activateConstraints:v95];

  id v96 = [objc_allocWithZone((Class)UIStackView) init];
  uint64_t v97 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView;
  v98 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView] = v96;

  v99 = *(void **)&v3[v97];
  if (!v99)
  {
LABEL_167:
    __break(1u);
    goto LABEL_168;
  }
  [v99 setTranslatesAutoresizingMaskIntoConstraints:0];
  v100 = *(void **)&v3[v97];
  if (!v100)
  {
LABEL_168:
    __break(1u);
    goto LABEL_169;
  }
  [v100 setSpacing:0.0];
  v101 = *(void **)&v3[v97];
  if (!v101)
  {
LABEL_169:
    __break(1u);
    goto LABEL_170;
  }
  [v101 setAxis:0];
  v102 = *(void **)&v3[v13];
  if (!v102)
  {
LABEL_170:
    __break(1u);
    goto LABEL_171;
  }
  if (!*(void *)&v3[v97])
  {
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  [v102 addSubview:];
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_1000492A0;
  v104 = *(void **)&v3[v97];
  if (!v104)
  {
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  uint64_t v276 = v97;
  id v105 = [v104 topAnchor];
  v106 = *(void **)&v3[v13];
  if (!v106)
  {
LABEL_173:
    __break(1u);
    goto LABEL_174;
  }
  id v107 = [v106 topAnchor];
  id v108 = [v105 constraintEqualToAnchor:v107];

  *(void *)(v103 + 32) = v108;
  v109 = *(void **)&v3[v276];
  if (!v109)
  {
LABEL_174:
    __break(1u);
    goto LABEL_175;
  }
  id v110 = [v109 leadingAnchor];
  v111 = *(void **)&v3[v13];
  if (!v111)
  {
LABEL_175:
    __break(1u);
    goto LABEL_176;
  }
  id v112 = [v111 leadingAnchor];
  id v113 = [v110 constraintEqualToAnchor:v112];

  *(void *)(v103 + 40) = v113;
  v114 = *(void **)&v3[v276];
  if (!v114)
  {
LABEL_176:
    __break(1u);
    goto LABEL_177;
  }
  id v115 = [v114 trailingAnchor];
  v116 = *(void **)&v3[v13];
  if (!v116)
  {
LABEL_177:
    __break(1u);
    goto LABEL_178;
  }
  id v117 = [v116 trailingAnchor];
  id v118 = [v115 constraintEqualToAnchor:v117];

  *(void *)(v103 + 48) = v118;
  v119 = *(void **)&v3[v276];
  if (!v119)
  {
LABEL_178:
    __break(1u);
    goto LABEL_179;
  }
  id v120 = [v119 bottomAnchor];
  v121 = *(void **)&v3[v13];
  if (!v121)
  {
LABEL_179:
    __break(1u);
    goto LABEL_180;
  }
  id v122 = [v121 bottomAnchor];
  id v123 = [v120 constraintEqualToAnchor:v122];

  *(void *)(v103 + 56) = v123;
  v124 = *(void **)&v3[v276];
  if (!v124)
  {
LABEL_180:
    __break(1u);
    goto LABEL_181;
  }
  id v125 = [v124 heightAnchor];
  v126 = *(void **)&v3[v13];
  if (!v126)
  {
LABEL_181:
    __break(1u);
    goto LABEL_182;
  }
  id v127 = [v126 heightAnchor];
  uint64_t v1 = (char *)[v125 constraintEqualToAnchor:v127];

  *(void *)(v103 + 64) = v1;
  uint64_t aBlock = (void **)v103;
  specialized Array._endMutation()();
  Class v128 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 activateConstraints:v128];

  uint64_t v278 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices;
  unint64_t v129 = *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices];
  if (v129 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v130 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v130 = *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v131 = *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages];
  uint64_t v271 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages] = v130;
  if (v131 > 1 || v130 < 2)
  {
    sub_100008448();
  }
  else
  {
    uint64_t aBlock = (void **)v130;
    swift_retain();
    CurrentValueSubject.send(_:)();
    swift_release();
  }
  unint64_t v132 = *(void *)&v3[v278];
  if (v132 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v133 = _CocoaArrayWrapper.endIndex.getter();
    if (v133)
    {
LABEL_67:
      uint64_t v2 = &v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
      unint64_t v275 = v132 & 0xC000000000000001;
      id v274 = self;
      swift_beginAccess();
      uint64_t v13 = 4;
      uint64_t v272 = v133;
      unint64_t v273 = v132;
      while (1)
      {
        Class isa = (SEL *)(v13 - 4);
        if (v275) {
          v134 = (void ***)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          v134 = (void ***)*(id *)(v132 + 8 * v13);
        }
        p_uint64_t aBlock = v134;
        if (__OFADD__(isa, 1)) {
          goto LABEL_83;
        }
        uint64_t v286 = v13 - 3;
        if (*(void *)v2 >> 62)
        {
          v162 = v134;
          swift_bridgeObjectRetain();
          uint64_t v135 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v135 = *(void *)((*(void *)v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v136 = v134;
        }
        v137 = (objc_class *)type metadata accessor for ASUIProductPageView();
        v138 = (char *)objc_allocWithZone(v137);
        *(void *)&v138[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView] = 0;
        v139 = v138;
        NSString v140 = String._bridgeToObjectiveC()();
        id v141 = [v274 systemImageNamed:v140];

        if (!v141) {
          goto LABEL_147;
        }
        *(void *)&v139[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_defaultSymbolImage] = v141;
        *(void *)&v139[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_device] = p_aBlock;
        *(void *)&v139[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_index] = v135;
        v142 = p_aBlock;

        v298.receiver = v139;
        v298.super_class = v137;
        id v143 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
        sub_10002EDB0();

        v282 = v142;
        [v143 setAlpha:0.0];
        swift_beginAccess();
        id v144 = v143;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*(void *)v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v2 & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_endAccess();
        v145 = *(void **)&v3[v276];
        if (!v145) {
          break;
        }
        [v145 addArrangedSubview:v144];
        uint64_t v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = xmmword_100049250;
        id v147 = [v144 widthAnchor];
        id v148 = [v3 widthAnchor];
        id v149 = [v147 constraintEqualToAnchor:v148];

        *(void *)(v146 + 32) = v149;
        id v150 = [v144 heightAnchor];
        v151 = *(void **)&v3[v276];
        if (!v151) {
          goto LABEL_149;
        }
        id v152 = [v151 heightAnchor];
        id v153 = [v150 constraintEqualToAnchor:v152];

        *(void *)(v146 + 40) = v153;
        uint64_t aBlock = (void **)v146;
        specialized Array._endMutation()();
        Class v154 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v289 activateConstraints:v154];

        v155 = self;
        uint64_t v156 = swift_allocObject();
        *(void *)(v156 + 16) = v144;
        v296 = sub_10000C184;
        uint64_t v297 = v156;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v293 = 1107296256;
        v294 = sub_100015768;
        v295 = &unk_100059158;
        uint64_t v1 = (char *)_Block_copy(&aBlock);
        id v157 = v144;
        swift_release();
        uint64_t v158 = swift_allocObject();
        *(void *)(v158 + 16) = v157;
        *(void *)(v158 + 24) = v3;
        v296 = sub_10000BF38;
        uint64_t v297 = v158;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v293 = 1107296256;
        v294 = sub_10002F7C0;
        v295 = &unk_1000591A8;
        v159 = _Block_copy(&aBlock);
        id v160 = v157;
        v161 = v3;
        swift_release();
        [v155 animateWithDuration:v1 animations:v159 completion:0.00001];
        _Block_release(v159);
        _Block_release(v1);

        ++v13;
        unint64_t v132 = v273;
        if (v286 == v272) {
          goto LABEL_87;
        }
      }
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
      goto LABEL_151;
    }
  }
  else
  {
    uint64_t v133 = *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v133) {
      goto LABEL_67;
    }
  }
LABEL_87:
  swift_bridgeObjectRelease();
  uint64_t v287 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
  sub_1000076C8(*(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx], 0);
  id v163 = [objc_allocWithZone((Class)PRXLabel) init];
  v164 = (char **)OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel;
  v165 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel] = v163;

  v166 = *(char **)((char *)v164 + (void)v3);
  if (!v166)
  {
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    __break(1u);
LABEL_186:
    __break(1u);
LABEL_187:
    __break(1u);
LABEL_188:
    __break(1u);
    goto LABEL_189;
  }
  unint64_t v167 = self;
  uint64_t v168 = qword_100062948;
  v169 = v166;
  if (v168 != -1) {
    goto LABEL_143;
  }
LABEL_89:
  id v170 = [(id)v167 systemFontOfSize:*(double *)&qword_100062CC0];
  [v169 setFont:v170];

  v171 = *(char **)((char *)v164 + (void)v3);
  if (!v171) {
    goto LABEL_183;
  }
  v172 = self;
  id v173 = v171;
  id v174 = [v172 secondaryLabelColor];
  [v173 setTextColor:v174];

  id v175 = [objc_allocWithZone((Class)PRXLabel) init];
  uint64_t v176 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel;
  v177 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel] = v175;

  v178 = *(void **)&v3[v176];
  if (!v178) {
    goto LABEL_184;
  }
  double v179 = *(double *)&qword_100062CC0;
  id v180 = v178;
  id v181 = [(id)v167 systemFontOfSize:v179];
  [v180 setFont:v181];

  v182 = *(void **)&v3[v176];
  if (!v182) {
    goto LABEL_185;
  }
  uint64_t v183 = v176;
  [v182 setAlpha:0.0];
  uint64_t v184 = swift_initStackObject();
  *(_OWORD *)(v184 + 16) = xmmword_100049270;
  v185 = *(char **)((char *)v164 + (void)v3);
  *(void *)(v184 + 32) = v185;
  uint64_t v277 = v183;
  v186 = *(void **)&v3[v183];
  *(void *)(v184 + 40) = v186;
  uint64_t aBlock = (void **)v184;
  unint64_t v167 = (unint64_t)&aBlock;
  specialized Array._endMutation()();
  v169 = aBlock;
  v283 = aBlock + 4;
  id v187 = v186;
  id v188 = v185;
  char v189 = 0;
  unint64_t v190 = 0;
  do
  {
    char v191 = v189;
    if (v190 >= (unint64_t)v169[2])
    {
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      swift_once();
      goto LABEL_89;
    }
    v192 = v283[v190];
    if (!v192) {
      goto LABEL_196;
    }
    id v193 = v192;
    [v193 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v193 setTextAlignment:1];
    [v193 setNumberOfLines:1];
    id v194 = v193;
    id v195 = [v172 secondaryLabelColor];
    [v194 setTextColor:v195];

    unint64_t v167 = *(void *)&v3[v287];
    v164 = v279;
    uint64_t v196 = *(void *)&v3[v278];
    if ((v196 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v197 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v167 & 0x8000000000000000) != 0) {
        goto LABEL_141;
      }
      if (v167 >= *(void *)((v196 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_142;
      }
      v197 = (char *)*(id *)(v196 + 8 * v167 + 32);
    }
    uint64_t v198 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
    v199 = *(void **)&v197[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
    if (!v199)
    {
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
    id v200 = [v199 bluetoothOTAName];
    if (v200) {
      goto LABEL_103;
    }
    v201 = *(void **)&v197[v198];
    if (!v201) {
      goto LABEL_150;
    }
    id v200 = [v201 SSID];
    if (v200)
    {
LABEL_103:
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      NSString v202 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {

      NSString v202 = 0;
    }
    [v194 setText:v202];

    [v3 addSubview:v194];
    uint64_t v203 = swift_allocObject();
    *(_OWORD *)(v203 + 16) = xmmword_100049260;
    id v204 = [v194 centerXAnchor];
    id v205 = [v3 centerXAnchor];
    id v206 = [v204 constraintEqualToAnchor:v205];

    *(void *)(v203 + 32) = v206;
    id v207 = [v194 topAnchor];
    v208 = *(char **)((char *)v279 + (void)v3);
    if (!v208) {
      goto LABEL_145;
    }
    id v209 = [v208 bottomAnchor];
    if (qword_100062920 != -1) {
      swift_once();
    }
    v164 = &selRef_viewDidLoad;
    id v210 = [v207 constraintEqualToAnchor:v209 constant:*(double *)&qword_100062CA0];

    *(void *)(v203 + 40) = v210;
    id v211 = [v194 widthAnchor];
    id v212 = [v3 widthAnchor];
    id v213 = [v211 constraintEqualToAnchor:v212 constant:*(double *)&qword_100062C88 * -2.0];

    *(void *)(v203 + 48) = v213;
    uint64_t aBlock = (void **)v203;
    specialized Array._endMutation()();
    unint64_t v167 = (unint64_t)aBlock;
    Class v214 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v215 = v289;
    [v289 activateConstraints:v214];

    char v189 = 1;
    unint64_t v190 = 1;
  }
  while ((v191 & 1) == 0);
  swift_bridgeObjectRelease();
  id v216 = [objc_allocWithZone((Class)UIPageControl) init];
  uint64_t v217 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl;
  v218 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl] = v216;

  id v219 = [objc_allocWithZone((Class)UIPageControl) init];
  uint64_t v220 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl;
  v221 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl];
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl] = v219;

  v222 = *(void **)&v3[v220];
  if (!v222) {
    goto LABEL_186;
  }
  [v222 setAlpha:0.0];
  v223 = *(void **)&v3[v220];
  v224 = &selRef_viewDidLoad;
  if (!v223) {
    goto LABEL_187;
  }
  id v225 = [v223 heightAnchor];
  id v226 = [v225 constraintEqualToConstant:0.0];

  v227 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint];
  uint64_t v280 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint] = v226;

  sub_10000BEA4(&qword_100062DA8);
  uint64_t v228 = swift_allocObject();
  *(_OWORD *)(v228 + 16) = v270;
  v229 = *(void **)&v3[v220];
  *(void *)(v228 + 32) = v229;
  uint64_t aBlock = (void **)v228;
  specialized Array._endMutation()();
  v230 = aBlock;
  v291 = aBlock;
  uint64_t v284 = v217;
  uint64_t v288 = v220;
  if (*(uint64_t *)&v3[v271] < 2)
  {
    id v234 = v229;
    v233 = v230[2];
    if (!v233) {
      goto LABEL_126;
    }
    goto LABEL_119;
  }
  id v231 = *(id *)&v3[v217];
  id v232 = v229;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if ((unint64_t)v291[2] >= (unint64_t)v291[3] >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  v230 = v291;
  v233 = v291[2];
  if (v233)
  {
LABEL_119:
    v235 = &v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v236 = 0;
    while (1)
    {
      v237 = v230[(void)v236 + 4];
      if (!v237) {
        goto LABEL_196;
      }
      id v238 = v237;
      [v238 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v238 addTarget:v3 action:"pageControlChangedWithPageControl:" forControlEvents:4096];
      [v238 setHidesForSinglePage:1];
      id v239 = [v172 labelColor];
      [v238 setCurrentPageIndicatorTintColor:v239];

      id v240 = [v172 secondaryLabelColor];
      [v238 setPageIndicatorTintColor:v240];

      [v238 setCurrentPage:0];
      if (*(void *)v235 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v241 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v241 = *(void *)((*(void *)v235 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v236 = (char *)v236 + 1;
      [v238 setNumberOfPages:v241];
      [v3 addSubview:v238];

      if (v233 == v236)
      {
        swift_bridgeObjectRelease();
        v215 = v289;
        v224 = &selRef_viewDidLoad;
        break;
      }
    }
  }
LABEL_126:
  uint64_t v242 = swift_allocObject();
  *(_OWORD *)(v242 + 16) = xmmword_100049260;
  v243 = *(void **)&v3[v288];
  if (!v243) {
    goto LABEL_188;
  }
  id v244 = [v243 topAnchor];
  v245 = *(void **)&v3[v277];
  if (v245)
  {
    id v246 = [v245 v224[29]];
    if (qword_100062928 != -1) {
      swift_once();
    }
    id v247 = [v244 constraintEqualToAnchor:v246 constant:*(double *)&qword_100062CA8];

    *(void *)(v242 + 32) = v247;
    v248 = *(void **)&v3[v288];
    if (!v248) {
      goto LABEL_190;
    }
    id v249 = [v248 centerXAnchor];
    id v250 = [v3 centerXAnchor];
    id v251 = [v249 constraintEqualToAnchor:v250];

    *(void *)(v242 + 40) = v251;
    v252 = *(void **)&v3[v288];
    if (!v252) {
      goto LABEL_191;
    }
    id v253 = [v252 bottomAnchor];
    id v254 = [v3 bottomAnchor];
    id v255 = [v253 constraintEqualToAnchor:v254];

    *(void *)(v242 + 48) = v255;
    specialized Array._endMutation()();
    Class v256 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v215 activateConstraints:v256];

    if (*(uint64_t *)&v3[v271] <= 1)
    {
      v257 = *(void **)&v3[v280];
      if (!v257) {
        goto LABEL_192;
      }
      Class v258 = v257;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      [(objc_class *)v258 setActive:1];
LABEL_139:

      return;
    }
    uint64_t v259 = swift_allocObject();
    *(_OWORD *)(v259 + 16) = xmmword_100049250;
    v260 = *(void **)&v3[v284];
    if (!v260) {
      goto LABEL_193;
    }
    id v261 = [v260 topAnchor];
    v262 = *(void **)&v3[v277];
    if (v262)
    {
      id v263 = [v262 bottomAnchor];
      id v264 = [v261 constraintEqualToAnchor:v263 constant:*(double *)&qword_100062CA8];

      *(void *)(v259 + 32) = v264;
      v265 = *(void **)&v3[v284];
      if (!v265) {
        goto LABEL_195;
      }
      id v266 = v265;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v267 = [v266 centerXAnchor];

      id v268 = [v3 centerXAnchor];
      id v269 = [v267 constraintEqualToAnchor:v268];

      *(void *)(v259 + 40) = v269;
      specialized Array._endMutation()();
      Class v258 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v215 activateConstraints:v258];
      goto LABEL_139;
    }
    goto LABEL_194;
  }
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000ACF0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10 = self;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  v15[4] = a5;
  v15[5] = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100015768;
  v15[3] = a6;
  id v12 = _Block_copy(v15);
  id v13 = a2;
  id v14 = a3;
  swift_release();
  [v10 animateWithDuration:0 delay:v12 usingSpringWithDamping:0 initialSpringVelocity:1.0 options:0.0 animations:0.8 completion:0.0];
  _Block_release(v12);
}

uint64_t sub_10000AE68(char *a1)
{
  uint64_t v2 = &a1[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!(*(void *)v2 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v4 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v3 + 8 * i + 32);
      }
      uint64_t v8 = v7;
      sub_10002F3AC(a1);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_10000B090(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdxPublisher;
  sub_10000BEA4(&qword_100062DB8);
  swift_allocObject();
  id v10 = v4;
  *(void *)&v4[v9] = CurrentValueSubject.init(_:)();
  uint64_t v11 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentNumberOfPagesPublisher;
  uint64_t v15 = -1;
  swift_allocObject();
  *(void *)&v10[v11] = CurrentValueSubject.init(_:)();
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages] = &_swiftEmptyArrayStorage;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices] = &_swiftEmptyArrayStorage;
  id v12 = &v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName];
  *(void *)id v12 = 0;
  *((void *)v12 + 1) = 0xE000000000000000;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] = 0;
  v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_shouldOnlyDisplayCenterPage] = 0;
  *(void *)&v10[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages] = 0;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for ASUIProductCarouselView();
  return [super initWithFrame:a1, a2, a3, a4];
}

id sub_10000B284(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdxPublisher;
  sub_10000BEA4(&qword_100062DB8);
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = CurrentValueSubject.init(_:)();
  uint64_t v5 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentNumberOfPagesPublisher;
  uint64_t v10 = -1;
  swift_allocObject();
  *(void *)&v4[v5] = CurrentValueSubject.init(_:)();
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices] = &_swiftEmptyArrayStorage;
  id v6 = &v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] = 0;
  v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_shouldOnlyDisplayCenterPage] = 0;
  *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages] = 0;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ASUIProductCarouselView();
  [super initWithCoder:a1];

  return v7;
}

id sub_10000B468()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIProductCarouselView();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIProductCarouselView()
{
  return self;
}

void *sub_10000B650(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView;
  uint64_t result = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView);
  if (!result)
  {
    __break(1u);
    goto LABEL_31;
  }
  id v5 = [result hitTest:0];
  if (v5)
  {
    id v6 = v5;
    uint64_t result = *(void **)(v1 + v2);
    if (result)
    {
      id v7 = [result arrangedSubviews];
      sub_10000C108(0, &qword_100062D88);
      unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000B9CC((uint64_t)v6, v8);
      uint64_t v10 = v9;
      char v12 = v11;
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
LABEL_20:

        return (void *)v10;
      }
      uint64_t result = *(void **)(v1 + v2);
      if (result)
      {
        [result frame];
        double v13 = CGRectGetWidth(v22) / a1;
        if ((~*(void *)&v13 & 0x7FF0000000000000) != 0)
        {
          if (v13 > -9.22337204e18)
          {
            if (v13 < 9.22337204e18)
            {
              uint64_t v10 = (uint64_t)v13 - 1;
              if (!__OFSUB__((uint64_t)v13, 1))
              {
                uint64_t result = *(void **)(v1 + v2);
                if (result)
                {
                  id v14 = [result arrangedSubviews];
                  unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

                  if (!(v15 >> 62))
                  {
                    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    goto LABEL_13;
                  }
LABEL_29:
                  swift_bridgeObjectRetain();
                  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
                  swift_bridgeObjectRelease();
LABEL_13:
                  swift_bridgeObjectRelease();
                  if (v10 < v16 && (v10 & 0x8000000000000000) == 0)
                  {
                    if (qword_100062900 != -1) {
                      swift_once();
                    }
                    uint64_t v17 = type metadata accessor for Logger();
                    sub_100005F6C(v17, (uint64_t)qword_100062C70);
                    char v18 = Logger.logObject.getter();
                    os_log_type_t v19 = static os_log_type_t.error.getter();
                    if (os_log_type_enabled(v18, v19))
                    {
                      char v20 = (uint8_t *)swift_slowAlloc();
                      *(_DWORD *)char v20 = 134217984;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Manually calculating current index between page updates and scrolling to %ld", v20, 0xCu);
                      swift_slowDealloc();
                    }

                    goto LABEL_20;
                  }

                  goto LABEL_22;
                }
LABEL_33:
                __break(1u);
                return result;
              }
LABEL_28:
              __break(1u);
              goto LABEL_29;
            }
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_27;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_22:

  return (void *)NSNotFound.getter();
}

void sub_10000B9CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      id v5 = v4;
      sub_10000C108(0, &qword_100062D88);
      char v6 = static NSObject.== infix(_:_:)();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = static NSObject.== infix(_:_:)();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_10000BB68(double a1)
{
  id v3 = [objc_allocWithZone((Class)CATransition) init];
  id v4 = self;
  id v5 = v3;
  id v6 = [v4 functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v5 setTimingFunction:v6];

  [v5 setType:kCATransitionFade];
  [v5 setDuration:a1];
  id v7 = [v1 layer];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v7 addAnimation:v5 forKey:v8];
}

uint64_t sub_10000BCBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!(*(void *)v2 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v4 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v3 + 8 * i + 32);
      }
      NSString v8 = v7;
      sub_10002F3AC(v1);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_10000BDB4(double *a1, double a2)
{
  uint64_t v3 = v2;
  [v3 bounds];
  double Width = CGRectGetWidth(v14);
  double v7 = *a1 / Width;
  double v8 = floor(v7);
  double v9 = ceil(v7);
  if (a2 <= 0.0) {
    double v9 = v8;
  }
  double v10 = Width * v9;
  *a1 = v10;
  id v11 = sub_10000B650(v10);
  id result = (id)NSNotFound.getter();
  if (v11 != result)
  {
    uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
    if (*(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] != v11)
    {
      *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx] = v11;
      swift_retain();
      CurrentValueSubject.send(_:)();
      swift_release();
      id result = *(id *)&v3[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl];
      if (result) {
        return [result setCurrentPage:*(void *)&v3[v13]];
      }
    }
  }
  return result;
}

uint64_t sub_10000BEA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000BEE8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BF20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BF30()
{
  return swift_release();
}

void sub_10000BF38(uint64_t a1)
{
  sub_10000ACF0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), (uint64_t)&unk_1000591E0, (uint64_t)sub_10000BF78, (uint64_t)&unk_1000591F8);
}

id sub_10000BF7C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id result = *(id *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl);
  if (result)
  {
    double v3 = 0.0;
    if (*(uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages) > 1) {
      double v3 = 1.0;
    }
    return [result setAlpha:v3];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BFBC()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000BFF4(uint64_t a1)
{
  sub_100007EA0(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

id sub_10000C000()
{
  id result = *(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel);
  if (result) {
    return [result setAlpha:1.0];
  }
  __break(1u);
  return result;
}

id sub_10000C028()
{
  return [*(id *)(v0 + 16) setAlpha:0.00001];
}

uint64_t sub_10000C040()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000C080(uint64_t a1)
{
  sub_10000ACF0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), (uint64_t)&unk_1000593E8, (uint64_t)sub_10000BF78, (uint64_t)&unk_100059400);
}

id sub_10000C0C0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_10002F3AC(*(void **)(v0 + 24));

  return [v1 setAlpha:1.0];
}

uint64_t sub_10000C108(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C144()
{
  return sub_10000AE68(*(char **)(v0 + 16));
}

void sub_10000C1BC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v44 = sub_10000CB2C;
  uint64_t v45 = v4;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v41 = 1107296256;
  uint64_t v42 = sub_10002F814;
  uint64_t v43 = &unk_100059500;
  id v6 = _Block_copy(&aBlock);
  double v7 = self;
  id v8 = [v7 actionWithTitle:v5 style:0 handler:v6];

  _Block_release(v6);
  swift_release();
  swift_release();
  uint64_t v39 = v8;

  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v44 = sub_10000CB64;
  uint64_t v45 = v9;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v41 = 1107296256;
  uint64_t v42 = sub_10002F814;
  uint64_t v43 = &unk_100059528;
  id v11 = _Block_copy(&aBlock);
  id v12 = [v7 actionWithTitle:v10 style:1 handler:v11];

  _Block_release(v11);
  swift_release();
  swift_release();

  uint64_t v13 = (void *)a1[17];
  if (!v13)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v14 = a1[19];
  if (!v14)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v15 = a1[21];
  if (v15)
  {
    uint64_t v16 = a1[18];
    uint64_t v17 = a1[20];
    id v18 = objc_allocWithZone((Class)type metadata accessor for ASUIAppHeaderView());
    swift_bridgeObjectRetain();
    id v19 = v13;
    swift_bridgeObjectRetain();
    char v20 = sub_100020890(v13, v16, v14, v17, v15);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v21 = [v2 contentView];
    [v21 addSubview:v20];

    id v22 = [v2 contentView];
    id v23 = [v22 mainContentGuide];

    uint64_t v24 = self;
    sub_10000BEA4(&qword_100062D98);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100049290;
    id v26 = [v20 topAnchor];
    id v27 = [v23 topAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];

    *(void *)(v25 + 32) = v28;
    id v29 = [v20 leadingAnchor];
    id v30 = [v23 leadingAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30];

    *(void *)(v25 + 40) = v31;
    id v32 = [v20 trailingAnchor];
    id v33 = [v23 trailingAnchor];
    id v34 = [v32 constraintEqualToAnchor:v33];

    *(void *)(v25 + 48) = v34;
    id v35 = [v20 bottomAnchor];
    id v36 = [v23 bottomAnchor];
    id v37 = [v35 constraintEqualToAnchor:v36];

    *(void *)(v25 + 56) = v37;
    uint64_t aBlock = (void **)v25;
    specialized Array._endMutation()();
    sub_10000CB84();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v24 activateConstraints:isa];

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_10000C730(uint64_t a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v5 = (void *)Strong;
    uint64_t v6 = Strong + OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_routingContext;
    uint64_t v7 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_routingContext);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = *(void *)(v6 + 16);
    *(void *)uint64_t v6 = 1;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    sub_10000CBC4(v7, v8, v9);
    if (*(void *)(v6 + 16) != 1) {
      *(unsigned char *)uint64_t v6 = a3;
    }
    uint64_t v10 = swift_unknownObjectWeakLoadStrong();
    if (v10)
    {
      sub_10003509C((uint64_t)v5, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_10000C91C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t type metadata accessor for ASUILearnMoreViewController()
{
  return self;
}

uint64_t sub_10000C9D8()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_type);
}

uint64_t sub_10000C9E8@<X0>(uint64_t *a1@<X8>)
{
  double v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10000CA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000CAF4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000CB2C(uint64_t a1)
{
  sub_10000C730(a1, v1, 1);
}

uint64_t sub_10000CB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CB5C()
{
  return swift_release();
}

void sub_10000CB64(uint64_t a1)
{
  sub_10000C730(a1, v1, 0);
}

unint64_t sub_10000CB84()
{
  unint64_t result = qword_100062DA0;
  if (!qword_100062DA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100062DA0);
  }
  return result;
}

uint64_t sub_10000CBC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000CC2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000CC5C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100062E00);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100062E00);
  if (qword_1000628E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A28);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10000CD24()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID + 8);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID);
    uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 16);
      swift_bridgeObjectRetain();
      if (v6)
      {
        swift_bridgeObjectRetain();
        unint64_t v7 = sub_10001B800(v3, v1);
        if (v8)
        {
          uint64_t v9 = *(void **)(*(void *)(v5 + 56) + 8 * v7);
          swift_endAccess();
          v9;
LABEL_11:
          swift_bridgeObjectRelease_n();
          return;
        }
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap);
      swift_beginAccess();
      uint64_t v11 = *v10;
      if (v11)
      {
        if (*(void *)(v11 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v12 = sub_10001B800(v3, v1);
          if (v13)
          {
            uint64_t v14 = *(void **)(*(void *)(v11 + 56) + 8 * v12);
            swift_endAccess();
            id v15 = v14;
            goto LABEL_11;
          }
          swift_bridgeObjectRelease();
        }
        swift_endAccess();
        if (qword_1000629B0 != -1) {
          swift_once();
        }
        uint64_t v16 = *(char **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
        if (!v16) {
          goto LABEL_23;
        }
        uint64_t v17 = *(void **)&v16[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory];
        if (!v17)
        {
          swift_bridgeObjectRelease();
          return;
        }
        id v18 = v16;
        id v19 = v17;
        id v20 = [v19 identifier];
        uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v23 = v22;

        if (v3 == v21 && v1 == v23)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v25 & 1) == 0)
          {

LABEL_23:
            swift_bridgeObjectRelease();
            return;
          }
        }
        id v26 = [objc_allocWithZone((Class)DADevice) init];
        NSString v27 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v26 setIdentifier:v27];

        id v28 = [v19 displayName];
        uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v31 = v30;

        id v32 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID);
        uint64_t v33 = *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8);
        if (v33)
        {
          uint64_t v34 = *v32;
          objc_allocWithZone((Class)type metadata accessor for ASUIDevice());
          swift_bridgeObjectRetain();
          sub_10002DE7C(v29, v31, v26, v34, v33);

          return;
        }
LABEL_31:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
}

unsigned char *sub_10000D050()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems] = 0;
  uint64_t v4 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap;
  uint64_t v5 = v0;
  *(void *)&v1[v4] = sub_10002F944((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_session] = 0;
  v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap] = 0;
  uint64_t v6 = &v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationItems] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices] = &_swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_cancellable] = 0;
  v5[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingDiscoveryStart] = 0;

  v32.receiver = v5;
  v32.super_class = ObjectType;
  [super init];
  uint64_t v8 = qword_1000629B0;
  uint64_t v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v10)
  {
    uint64_t v11 = (uint64_t *)(v10 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID);
    uint64_t v12 = v11[1];
    if (v12)
    {
      uint64_t v13 = *v11;
      uint64_t v12 = swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v14 = &v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
  void *v14 = v13;
  v14[1] = v12;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v15)
  {
    aBlock[0] = *(void *)(v15 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItemsPublisher);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_10000BEA4(&qword_100062F20);
    sub_10001E6B4(&qword_100062F28, &qword_100062F20);
    uint64_t v16 = Publisher<>.sink(receiveValue:)();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v16 = 0;
  }
  *(void *)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_cancellable] = v16;
  swift_release();
  unint64_t v17 = sub_10002F950((uint64_t)&_swiftEmptyArrayStorage);
  id v18 = (unint64_t *)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
  swift_beginAccess();
  *id v18 = v17;
  swift_bridgeObjectRelease();
  unint64_t v19 = sub_10002F950((uint64_t)&_swiftEmptyArrayStorage);
  id v20 = (unint64_t *)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
  swift_beginAccess();
  *id v20 = v19;
  swift_bridgeObjectRelease();
  unint64_t v21 = sub_10002FA74((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v22 = (unint64_t *)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
  swift_beginAccess();
  unint64_t *v22 = v21;
  swift_bridgeObjectRelease();
  v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] = 0;
  uint64_t v23 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v23 && *(void *)(v23 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory))
  {
    id v24 = [objc_allocWithZone((Class)DASession) init];
    if (v14[1])
    {
      swift_bridgeObjectRetain();
      NSString v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v25 = 0;
    }
    [v24 setBundleID:v25];

    uint64_t v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_10001E6F8;
    aBlock[5] = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E4BC;
    aBlock[3] = &unk_100059A78;
    NSString v27 = _Block_copy(aBlock);
    swift_release();
    [v24 setEventHandler:v27];
    _Block_release(v27);
    id v28 = *(void **)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_session];
    *(void *)&v9[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_session] = v24;
    id v29 = v24;

    [v29 activate];
  }

  return v9;
}

void sub_10000D56C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    if (!v1)
    {
LABEL_30:

      return;
    }
    uint64_t v4 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems;
    *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v5 = *(void *)&v3[v4];
    if (v5)
    {
      uint64_t v31 = v3;
      if (v5 >> 62) {
        goto LABEL_27;
      }
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      while (v6)
      {
        id v7 = &v31[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap];
        unint64_t v32 = v5;
        unint64_t v33 = v5 & 0xC000000000000001;
        uint64_t v8 = 4;
        while (1)
        {
          id v10 = v33 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v5 + 8 * v8);
          uint64_t v11 = v10;
          if (__OFADD__(v8 - 4, 1)) {
            break;
          }
          uint64_t v34 = v8 - 3;
          id v12 = [v10 identifier];
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;

          swift_beginAccess();
          id v16 = v11;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          id v18 = *(void **)v7;
          id v35 = *(void **)v7;
          *(void *)id v7 = 0x8000000000000000;
          unint64_t v20 = sub_10001B800(v13, v15);
          uint64_t v21 = v18[2];
          BOOL v22 = (v19 & 1) == 0;
          uint64_t v23 = v21 + v22;
          if (__OFADD__(v21, v22)) {
            goto LABEL_25;
          }
          unint64_t v5 = v19;
          if (v18[3] >= v23)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v26 = v35;
              if (v19) {
                goto LABEL_7;
              }
            }
            else
            {
              sub_10001C578(&qword_100062F30);
              uint64_t v26 = v35;
              if (v5) {
                goto LABEL_7;
              }
            }
          }
          else
          {
            sub_10001BA8C(v23, isUniquelyReferenced_nonNull_native, &qword_100062F30);
            unint64_t v24 = sub_10001B800(v13, v15);
            if ((v5 & 1) != (v25 & 1)) {
              goto LABEL_33;
            }
            unint64_t v20 = v24;
            uint64_t v26 = v35;
            if (v5)
            {
LABEL_7:
              uint64_t v9 = v26[7];

              *(void *)(v9 + 8 * v20) = v16;
              goto LABEL_8;
            }
          }
          v26[(v20 >> 6) + 8] |= 1 << v20;
          NSString v27 = (uint64_t *)(v26[6] + 16 * v20);
          *NSString v27 = v13;
          v27[1] = v15;
          *(void *)(v26[7] + 8 * v20) = v16;
          uint64_t v28 = v26[2];
          BOOL v29 = __OFADD__(v28, 1);
          uint64_t v30 = v28 + 1;
          if (v29) {
            goto LABEL_26;
          }
          v26[2] = v30;
          swift_bridgeObjectRetain();
LABEL_8:
          *(void *)id v7 = v26;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();

          ++v8;
          unint64_t v5 = v32;
          if (v34 == v6) {
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        swift_bridgeObjectRetain_n();
        uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
LABEL_28:
      swift_bridgeObjectRelease_n();
      uint64_t v3 = v31;
      if (v31[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingDiscoveryStart]) {
        sub_10000D894();
      }
      goto LABEL_30;
    }
    __break(1u);
LABEL_33:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
}

void sub_10000D894()
{
  unint64_t v2 = (unint64_t)v0;
  unint64_t v3 = type metadata accessor for UUID();
  os_log_t v4 = *(os_log_t *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000BEA4(&qword_100062EE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery]) {
    return;
  }
  uint64_t v59 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems;
  uint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems];
  if (v10)
  {
    uint64_t v58 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
    id v61 = v6;
    if ((unint64_t)v10 >> 62) {
      goto LABEL_44;
    }
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v12 = v0;
    swift_bridgeObjectRetain();
    while (1)
    {
      id v60 = (char *)v2;
      if (!v11) {
        break;
      }
      os_log_t v63 = v4;
      unint64_t v65 = (unint64_t)&_swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)();
      if (v11 < 0) {
        goto LABEL_93;
      }
      unint64_t v2 = 0;
      os_log_t v4 = (os_log_t)&v60[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
      while (v11 != v2)
      {
        if ((v10 & 0xC000000000000001) != 0) {
          id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v13 = *(id *)(v10 + 8 * v2 + 32);
        }
        uint64_t v14 = v13;
        if (!v4[1].isa)
        {
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
          goto LABEL_114;
        }
        ++v2;
        swift_bridgeObjectRetain();
        sub_100013A80();

        swift_bridgeObjectRelease();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v1 = *(void *)(v65 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v11 == v2)
        {
          unint64_t v1 = v65;
          swift_bridgeObjectRelease();
          unint64_t v2 = (unint64_t)v60;

          os_log_t v4 = v63;
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_44:
      id v30 = (id)v2;
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    }
    swift_bridgeObjectRelease();

    unint64_t v1 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_24:
    unint64_t v66 = (unint64_t)&_swiftEmptyArrayStorage;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v10 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v10)
      {
LABEL_26:
        if (v10 < 1) {
          goto LABEL_94;
        }
        uint64_t v19 = 0;
        unint64_t v62 = v1 & 0xC000000000000001;
        os_log_t v63 = (os_log_t)v1;
        unint64_t v20 = v4 + 4;
        uint64_t v21 = v4 + 7;
        BOOL v22 = (unsigned int (**)(uint64_t, uint64_t, unint64_t))&v4[6];
        uint64_t v23 = v61;
        while (1)
        {
          Class v24 = v62
              ? (Class)specialized _ArrayBuffer._getElementSlowPath(_:)()
              : (Class)*(id *)(v1 + 8 * v19 + 32);
          Class v25 = v24;
          id v26 = [(objc_class *)v24 bluetoothIdentifier];
          if (!v26) {
            break;
          }
          NSString v27 = v26;
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          ((void (*)(uint64_t, char *, unint64_t))v20->isa)(v9, v23, v3);
          ((void (*)(uint64_t, void, uint64_t, unint64_t))v21->isa)(v9, 0, 1, v3);
          if ((*v22)(v9, 1, v3) == 1) {
            goto LABEL_37;
          }
          sub_10001E478(v9, &qword_100062EE0);
LABEL_29:
          ++v19;

          unint64_t v1 = (unint64_t)v63;
          if (v10 == v19)
          {
            swift_bridgeObjectRelease();
            unint64_t v2 = (unint64_t)v60;
            goto LABEL_47;
          }
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))v21->isa)(v9, 1, 1, v3);
LABEL_37:
        sub_10001E478(v9, &qword_100062EE0);
        uint64_t v28 = (objc_class *)[(objc_class *)v25 networkHotspotSSID];
        if (v28)
        {
          BOOL v29 = v28;

          Class v25 = v29;
        }
        else
        {
          Class v25 = v25;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          uint64_t v23 = v61;
        }
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRelease();
LABEL_47:
    uint64_t v10 = v59;
    unint64_t v3 = *(void *)(v2 + v59);
    if (!v3)
    {
LABEL_114:
      __break(1u);
      goto LABEL_115;
    }
    unint64_t v65 = (unint64_t)&_swiftEmptyArrayStorage;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
      if (v31) {
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v31)
      {
LABEL_50:
        if (v31 < 1) {
          goto LABEL_95;
        }
        if ((v3 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
            self;
            if (swift_dynamicCastObjCClass())
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            else
            {
              swift_unknownObjectRelease();
            }
          }
        }
        else
        {
          unint64_t v33 = (void **)(v3 + 32);
          do
          {
            uint64_t v34 = *v33;
            self;
            if (swift_dynamicCastObjCClass())
            {
              id v35 = v34;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            ++v33;
            --v31;
          }
          while (v31);
        }
      }
    }
    swift_bridgeObjectRelease();
    id v36 = v65;
    swift_bridgeObjectRelease();
    id v37 = (unint64_t *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems);
    swift_beginAccess();
    *id v37 = (unint64_t)v36;
    swift_bridgeObjectRelease();
    unint64_t v3 = *v37;
    unint64_t v1 = (unint64_t)&unk_100062000;
    if (*v37)
    {
      uint64_t v9 = v3 >> 62;
      if (v3 >> 62) {
        goto LABEL_96;
      }
      uint64_t v38 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      while (v38 >= 1)
      {
        unint64_t v39 = *(void *)(v2 + v10);
        if (!v39) {
          goto LABEL_116;
        }
        if (v39 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v49 != v38)
          {
LABEL_99:
            swift_bridgeObjectRelease();
            if (qword_100062950 != -1) {
              swift_once();
            }
            uint64_t v50 = type metadata accessor for Logger();
            sub_100005F6C(v50, (uint64_t)qword_100062E00);
            id v51 = Logger.logObject.getter();
            os_log_type_t v52 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v51, v52))
            {
              NSString v53 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)NSString v53 = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "New display + Migration displayItems so start new setup first", v53, 2u);
              swift_slowDealloc();
            }

            goto LABEL_104;
          }
        }
        else if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) != v38)
        {
          goto LABEL_99;
        }
        if (v9)
        {
          id v41 = (id)v2;
          swift_bridgeObjectRetain();
          uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v40 = (id)v2;
        }
        if (!v9)
        {

LABEL_86:
          sub_100011B48();
          swift_bridgeObjectRelease();
          if (qword_100062950 != -1) {
            swift_once();
          }
          uint64_t v45 = type metadata accessor for Logger();
          sub_100005F6C(v45, (uint64_t)qword_100062E00);
          swift_bridgeObjectRetain();
          uint64_t v46 = Logger.logObject.getter();
          os_log_type_t v47 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v46, v47))
          {
            v48 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v48 = 134217984;
            swift_bridgeObjectRelease();
            id v64 = (void *)v38;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v46, v47, "Only Migration displayItems so dismiss after migration complete Count : %ld", v48, 0xCu);
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          *(unsigned char *)(v2 + *(void *)(v1 + 3664)) = 1;
          goto LABEL_105;
        }
        uint64_t v10 = v2;
        id v64 = &_swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)();
        if (v9 < 0)
        {
          __break(1u);
          goto LABEL_112;
        }
        uint64_t v42 = 0;
        unint64_t v2 = v3 & 0xC000000000000001;
        unint64_t v1 = v10 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID;
        while (v9 != v42)
        {
          if (v2) {
            id v43 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v43 = *(id *)(v3 + 8 * v42 + 32);
          }
          unint64_t v44 = v43;
          if (!*(void *)(v1 + 8)) {
            goto LABEL_113;
          }
          ++v42;
          swift_bridgeObjectRetain();
          sub_100013A80();

          swift_bridgeObjectRelease();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          if (v9 == v42)
          {
            unint64_t v2 = v10;

            unint64_t v1 = 0x100062000;
            goto LABEL_86;
          }
        }
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        swift_bridgeObjectRetain_n();
        uint64_t v38 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
LABEL_104:
    swift_bridgeObjectRetain();
    sub_10000E758();
    swift_bridgeObjectRelease();
LABEL_105:
    uint64_t v54 = v58;
    if (*(unsigned char *)(v2 + *(void *)(v1 + 3664)) == 1)
    {
      id v55 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery);
      if (v55) {
        goto LABEL_109;
      }
      __break(1u);
    }
    id v55 = *(void **)(v2 + v54);
    if (v55)
    {
LABEL_109:
      id v56 = v55;
      swift_bridgeObjectRelease();
      [v56 activate];

      if (*(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_cancellable))
      {
        swift_retain();
        AnyCancellable.cancel()();
        swift_release();
      }
      return;
    }
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
    return;
  }
  v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingDiscoveryStart] = 1;
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100005F6C(v15, (uint64_t)qword_100062E00);
  os_log_t v63 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, v16, "Delaying discovery start because we're waiting for displayItems from client", v17, 2u);
    swift_slowDealloc();
  }
  os_log_t v18 = v63;
}

void sub_10000E460(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v3 = (void *)Strong;
    sub_10001E1C8(a1);
  }
}

void sub_10000E4BC(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_10000E548()
{
  ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
  if (v2) {
    [v2 invalidate];
  }
  unint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIPickingSession()
{
  return self;
}

void sub_10000E758()
{
  uint64_t v1 = v0;
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100062E00);
  swift_bridgeObjectRetain_n();
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)objc_super v5 = 136315138;
    sub_10000C108(0, &qword_100062F08);
    swift_bridgeObjectRetain();
    uint64_t v6 = Array.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_100023B0C(v6, v8, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "configs: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v9 = objc_allocWithZone((Class)DADiscovery);
  swift_bridgeObjectRetain();
  id v10 = sub_10001B638();
  uint64_t v11 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
  id v12 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery) = v10;

  id v13 = *(void **)(v1 + v11);
  if (!v13)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8))
  {
    id v14 = v13;
    swift_bridgeObjectRetain();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = v13;
    NSString v15 = 0;
  }
  [v13 setBundleID:v15, v23, aBlock[0]];

  unint64_t v17 = *(void **)(v1 + v11);
  if (!v17) {
    goto LABEL_14;
  }
  id v18 = v17;
  [v18 setFlags:[v18 flags] | 4];

  uint64_t v19 = *(void **)(v1 + v11);
  if (v19)
  {
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_10001E4D4;
    aBlock[5] = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000E4BC;
    aBlock[3] = (uint64_t)&unk_100059820;
    uint64_t v21 = _Block_copy(aBlock);
    id v22 = v19;
    swift_release();
    [v22 setEventHandler:v21];
    _Block_release(v21);

    return;
  }
LABEL_15:
  __break(1u);
}

void sub_10000EAF8(void **a1)
{
  uint64_t v2 = sub_10000BEA4(&qword_100062F10);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  objc_super v5 = (char *)&v299 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (unint64_t)&v299 - v6;
  uint64_t v312 = type metadata accessor for URL();
  uint64_t v311 = *(void *)(v312 - 8);
  uint64_t v8 = __chkstk_darwin(v312);
  v306 = (char *)&v299 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v308 = (char *)&v299 - v11;
  __chkstk_darwin(v10);
  v309 = (char *)&v299 - v12;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v316 = v13;
  uint64_t v317 = v14;
  __chkstk_darwin(v13);
  v315 = (char *)&v299 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = (char *)type metadata accessor for DispatchQoS();
  id v17 = (id)*((void *)v16 - 1);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v299 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100062950 != -1) {
    goto LABEL_162;
  }
  while (2)
  {
    uint64_t v20 = type metadata accessor for Logger();
    uint64_t v21 = sub_100005F6C(v20, (uint64_t)qword_100062E00);
    id v22 = a1;
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    BOOL v25 = os_log_type_enabled(v23, v24);
    v310 = v7;
    v307 = v5;
    if (v25)
    {
      uint64_t v26 = swift_slowAlloc();
      v313 = v16;
      NSString v27 = (uint8_t *)v26;
      uint64_t v28 = swift_slowAlloc();
      id v305 = v17;
      BOOL v29 = (void *)v28;
      v314 = v19;
      *(_DWORD *)NSString v27 = 138412290;
      uint64_t aBlock = v22;
      id v30 = v22;
      uint64_t v19 = v314;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v29 = v22;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "discovery event: %@", v27, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      id v17 = v305;
      swift_slowDealloc();
      id v16 = v313;
      swift_slowDealloc();
    }
    else
    {
    }
    switch((unint64_t)[v22 eventType])
    {
      case 0xAuLL:
        a1 = v318;
        uint64_t v31 = *(void **)((char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
        if (!v31)
        {
          __break(1u);
LABEL_200:
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
          goto LABEL_207;
        }
        id v32 = [v31 discoveredDevices];
        sub_10000C108(0, &qword_100063D00);
        unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        id v17 = (id)v21;
        if (v7 >> 62)
        {
          swift_bridgeObjectRetain();
          objc_super v5 = (char *)_CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v5)
          {
LABEL_16:
            swift_bridgeObjectRelease();
            id v37 = (char *)a1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices;
            swift_beginAccess();
            unint64_t v38 = *(void *)v37;
            if (v38 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v280 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
              if (v280 >= 1) {
                goto LABEL_18;
              }
            }
            else if (*(uint64_t *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
            {
LABEL_18:
              sub_10001928C();
              return;
            }
            v281 = self;
            uint64_t v282 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v323 = sub_10001E578;
            v324 = (void *)v282;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v321 = sub_10002F814;
            v322 = &unk_1000599D8;
            v283 = _Block_copy(&aBlock);
            swift_release();
            id v284 = [v281 scheduledTimerWithTimeInterval:0 repeats:v283 block:30.0];
            _Block_release(v283);
            uint64_t v285 = *(void **)((char *)a1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer);
            *(void **)((char *)a1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer) = v284;

            return;
          }
        }
        else
        {
          objc_super v5 = *(char **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v5) {
            goto LABEL_16;
          }
        }
        uint64_t v33 = 4;
LABEL_10:
        if ((v7 & 0xC000000000000001) != 0) {
          id v34 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v34 = *(id *)(v7 + 8 * v33);
        }
        id v35 = v34;
        id v16 = (char *)(v33 - 3);
        if (__OFADD__(v33 - 4, 1))
        {
          __break(1u);
LABEL_162:
          swift_once();
          continue;
        }
        id v36 = [v34 identifier];
        if (v36)
        {

          uint64_t v19 = sub_100016EA0(v35);
          ++v33;
          if (v16 == v5) {
            goto LABEL_16;
          }
          goto LABEL_10;
        }
        swift_bridgeObjectRelease();
        id v115 = v35;
        id v41 = Logger.logObject.getter();
        os_log_type_t v116 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v41, v116))
        {
          id v117 = (uint8_t *)swift_slowAlloc();
          id v118 = (void *)swift_slowAlloc();
          *(_DWORD *)id v117 = 138412290;
          uint64_t aBlock = v115;
          v119 = v115;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *id v118 = v115;

          _os_log_impl((void *)&_mh_execute_header, v41, v116, "DADevice does not have an identifier, ignoring. %@", v117, 0xCu);
          sub_10000BEA4(&qword_100062ED8);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          goto LABEL_135;
        }

LABEL_137:
        return;
      case 0x14uLL:
        NSString v53 = Logger.logObject.getter();
        os_log_type_t v54 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v53, v54))
        {
          id v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, v54, "XPC connection to dataaccessd invalidated, clearing devices", v55, 2u);
          swift_slowDealloc();
        }

        id v56 = v318;
        uint64_t v57 = (char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap;
        swift_beginAccess();
        if (!*(void *)v57) {
          goto LABEL_200;
        }
        *(void *)uint64_t v57 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v58 = (char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap;
        swift_beginAccess();
        if (!*(void *)v58) {
          goto LABEL_201;
        }
        *(void *)uint64_t v58 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v59 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
        id v60 = *(void **)((char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
        if (v60)
        {
          [v60 invalidateWithReason:0];
          id v61 = *(void **)((char *)v56 + v59);
        }
        else
        {
          id v61 = 0;
        }
        *(void **)((char *)v56 + v59) = 0;

        if (*((unsigned char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration) != 1) {
          goto LABEL_70;
        }
        id v113 = (char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap;
        swift_beginAccess();
        if (!*(void *)v113) {
          goto LABEL_206;
        }
        *(void *)id v113 = &_swiftEmptyDictionarySingleton;
LABEL_69:
        swift_bridgeObjectRelease();
LABEL_70:
        v114 = *(void **)((char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer);
        if (v114) {
          [v114 invalidate];
        }
        return;
      case 0x28uLL:
        sub_1000199CC();
        if (!v73) {
          return;
        }
        v74 = v72;
        v75 = v318;
        uint64_t v76 = sub_100016EA0(v72);
        if (v76)
        {

          double v77 = *(void **)((char *)v75 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer);
          if (v77) {
            [v77 invalidate];
          }
          sub_10001928C();
        }
        goto LABEL_78;
      case 0x29uLL:
        uint64_t v78 = sub_1000199CC();
        if (!v79) {
          return;
        }
        id v22 = (void **)v78;
        uint64_t v81 = v79;
        v74 = v80;
        id v82 = (char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap;
        swift_beginAccess();
        uint64_t v83 = *(void *)v82;
        if (!v83) {
          goto LABEL_205;
        }
        if (!*(void *)(v83 + 16)) {
          goto LABEL_77;
        }
        swift_bridgeObjectRetain();
        unint64_t v84 = sub_10001B800((uint64_t)v22, v81);
        if (v85)
        {
          id v86 = *(id *)(*(void *)(v83 + 56) + 8 * v84);
          swift_endAccess();
          swift_bridgeObjectRelease();
          sub_10002DAC4();
          if (v87 == 25)
          {
            id v88 = Logger.logObject.getter();
            os_log_type_t v89 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v88, v89))
            {
              id v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v90 = 0;
              _os_log_impl((void *)&_mh_execute_header, v88, v89, "BUG? Device is already authorized, Discovery is stopped, but we still got a lost event for this device. Ignoring.", v90, 2u);
              swift_slowDealloc();

              swift_bridgeObjectRelease();
            }
            else
            {

              swift_bridgeObjectRelease();
            }
            return;
          }
          v139 = v318;
          NSString v140 = (void **)((char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap);
          swift_beginAccess();
          if (!*v140) {
            goto LABEL_210;
          }
          swift_bridgeObjectRetain();
          id v141 = v86;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v326 = *v140;
          *NSString v140 = (void *)0x8000000000000000;
          sub_10001C288((uint64_t)v141, (uint64_t)v22, v81, isUniquelyReferenced_nonNull_native);
          *NSString v140 = v326;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();
          uint64_t v143 = *(uint64_t *)((char *)v139 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID + 8);
          if (v143
            && (*(void **)((char *)v139 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID) == v22
             && v143 == v81
             || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
          {
            sub_10000C108(0, (unint64_t *)&qword_100063180);
            uint64_t v312 = static OS_dispatch_queue.main.getter();
            uint64_t v144 = swift_allocObject();
            swift_unknownObjectWeakInit();
            uint64_t v145 = swift_allocObject();
            *(void *)(v145 + 16) = v144;
            *(void *)(v145 + 24) = v141;
            v323 = sub_10001E570;
            v324 = (void *)v145;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v321 = sub_100015768;
            v322 = &unk_1000599B0;
            uint64_t v146 = _Block_copy(&aBlock);
            v318 = (void **)v141;
            swift_retain();
            static DispatchQoS.unspecified.getter();
            v326 = &_swiftEmptyArrayStorage;
            sub_10001D79C();
            v313 = v16;
            sub_10000BEA4((uint64_t *)&unk_100063190);
            id v147 = v19;
            sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
            id v148 = v315;
            uint64_t v149 = v316;
            dispatch thunk of SetAlgebra.init<A>(_:)();
            id v150 = (void *)v312;
            OS_dispatch_queue.async(group:qos:flags:execute:)();
            _Block_release(v146);

            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v317 + 8))(v148, v149);
            (*((void (**)(char *, char *))v17 + 1))(v147, v313);
LABEL_154:
            swift_release();
            swift_release();
            return;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
LABEL_77:
          swift_endAccess();
        }
LABEL_78:

        swift_bridgeObjectRelease();
        return;
      case 0x2AuLL:
        uint64_t v91 = sub_1000199CC();
        if (!v92) {
          return;
        }
        uint64_t v94 = v91;
        uint64_t v95 = v92;
        id v22 = v93;
        id v96 = v318;
        uint64_t v97 = sub_100016EA0(v93);
        if (v97)
        {
          v98 = v97;
          v99 = (void **)((char *)v96 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID);
          v100 = *(char **)((char *)v96 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8);
          if (v100)
          {
            uint64_t v301 = v21;
            uint64_t v101 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
            v102 = *(void **)&v98[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
            if (!v102)
            {
LABEL_207:
              __break(1u);
              goto LABEL_208;
            }
            id v305 = *v99;
            v313 = v100;
            swift_bridgeObjectRetain();
            id v103 = [v102 appAccessInfoMap];
            uint64_t v303 = v94;
            if (v103)
            {
              v104 = v103;
              sub_10000C108(0, (unint64_t *)&qword_100062DB0);
              uint64_t v105 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

              if (*(void *)(v105 + 16))
              {
                uint64_t v106 = (uint64_t)v313;
                swift_bridgeObjectRetain();
                unint64_t v107 = sub_10001B800((uint64_t)v305, v106);
                if (v108)
                {
                  id v109 = *(id *)(*(void *)(v105 + 56) + 8 * v107);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  id v110 = [v109 appDiscoveryConfiguration];

                  if (v110)
                  {
                    unint64_t v111 = (unint64_t)[v110 flags];

                    uint64_t v112 = (v111 >> 4) & 1;
                    goto LABEL_116;
                  }
                }
                else
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                }
                LOBYTE(v112) = 0;
LABEL_116:
                sub_10002DAC4();
                if (v165 != 25)
                {
                  sub_10002DAC4();
                  char v167 = v166 == 20 ? v112 : 1;
                  if (v167)
                  {
                    swift_bridgeObjectRelease();
                    sub_10000C108(0, (unint64_t *)&qword_100063180);
                    v313 = (char *)static OS_dispatch_queue.main.getter();
                    uint64_t v168 = swift_allocObject();
                    swift_unknownObjectWeakInit();
                    v169 = (void *)swift_allocObject();
                    uint64_t v170 = v303;
                    v169[2] = v168;
                    v169[3] = v170;
                    v169[4] = v95;
                    v169[5] = v22;
                    v323 = sub_10001E508;
                    v324 = v169;
                    uint64_t aBlock = _NSConcreteStackBlock;
                    unint64_t v320 = 1107296256;
                    v321 = sub_100015768;
                    v322 = &unk_100059910;
                    v171 = _Block_copy(&aBlock);
                    v318 = v22;
                    swift_retain();
                    swift_bridgeObjectRetain();
                    static DispatchQoS.unspecified.getter();
                    v326 = &_swiftEmptyArrayStorage;
                    sub_10001D79C();
                    sub_10000BEA4((uint64_t *)&unk_100063190);
                    uint64_t v304 = v95;
                    sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
                    v172 = v98;
                    id v173 = v315;
                    uint64_t v174 = v316;
                    dispatch thunk of SetAlgebra.init<A>(_:)();
                    id v175 = v313;
                    OS_dispatch_queue.async(group:qos:flags:execute:)();
                    _Block_release(v171);

                    swift_bridgeObjectRelease();
                    (*(void (**)(char *, uint64_t))(v317 + 8))(v173, v174);
                    (*((void (**)(char *, char *))v17 + 1))(v19, v16);
                    swift_release();
                    swift_release();
                    return;
                  }
                }
                uint64_t v176 = *(uint64_t *)((char *)v318
                                  + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID
                                  + 8);
                v302 = v98;
                if (v176)
                {
                  uint64_t v304 = v95;
                  v177 = *(void **)&v98[v101];
                  if (!v177)
                  {
LABEL_208:
                    __break(1u);
                    goto LABEL_209;
                  }
                  v314 = v19;
                  uint64_t v178 = *(uint64_t *)((char *)v318
                                    + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID);
                  swift_bridgeObjectRetain();
                  id v179 = [v177 identifier];
                  if (!v179)
                  {
LABEL_209:
                    __break(1u);
LABEL_210:
                    __break(1u);
                    swift_errorRelease();
LABEL_211:
                    __break(1u);
LABEL_212:
                    uint64_t aBlock = 0;
                    unint64_t v320 = 0xE000000000000000;
                    _StringGuts.grow(_:)(102);
                    v287._countAndFlagsBits = 0xD000000000000064;
                    v287._object = (void *)0x800000010004A6D0;
                    String.append(_:)(v287);
                    id v288 = [v22 description];
                    uint64_t v289 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                    v291 = v290;

                    v292._countAndFlagsBits = v289;
                    v292._object = v291;
                    String.append(_:)(v292);
                    swift_bridgeObjectRelease();
LABEL_214:
                    _assertionFailure(_:_:file:line:flags:)();
                    __break(1u);
                    JUMPOUT(0x100011A7CLL);
                  }
                  id v180 = v179;
                  uint64_t v181 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                  uint64_t v183 = v182;

                  if (v178 == v181 && v176 == v183)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    uint64_t v184 = v304;
                    goto LABEL_129;
                  }
                  char v185 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v184 = v304;
                  if (v185)
                  {
LABEL_129:
                    v186 = v22;
                    if ([v186 discoveredInExtension])
                    {
                      id v22 = (void **)OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image;
                      uint64_t v187 = v312;
                      if (*(void *)&v98[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image]
                        || (id v226 = [v186 displayImageName]) == 0)
                      {
                        swift_bridgeObjectRelease();
                        v313 = 0;
                      }
                      else
                      {

                        id v227 = objc_allocWithZone((Class)LSApplicationRecord);
                        uint64_t v228 = (char *)sub_10001B724((uint64_t)v305, (uint64_t)v313, 0);
                        v313 = 0;
                        if (!v228) {
                          goto LABEL_211;
                        }
                        v306 = v228;
                        id v229 = [v228 URL];
                        v230 = v309;
                        static URL._unconditionallyBridgeFromObjectiveC(_:)();

                        id v231 = objc_allocWithZone((Class)NSBundle);
                        URL._bridgeToObjectiveC()(v232);
                        id v234 = v233;
                        id v235 = [v231 initWithURL:v233];

                        (*(void (**)(char *, uint64_t))(v311 + 8))(v230, v187);
                        v300 = v186;
                        id v236 = [v186 displayImageName];
                        if (v236)
                        {
                          v237 = v236;
                          static String._unconditionallyBridgeFromObjectiveC(_:)();
                        }
                        id v238 = v235;
                        NSString v239 = String._bridgeToObjectiveC()();
                        swift_bridgeObjectRelease();
                        id v240 = (char *)[self imageNamed:v239 inBundle:v238 compatibleWithTraitCollection:0];

                        id v305 = v238;
                        v307 = v240;
                        uint64_t v241 = v240;
                        uint64_t v242 = Logger.logObject.getter();
                        os_log_type_t v243 = static os_log_type_t.default.getter();
                        if (os_log_type_enabled(v242, v243))
                        {
                          id v244 = (uint8_t *)swift_slowAlloc();
                          v299 = (void *)swift_slowAlloc();
                          *(_DWORD *)id v244 = 138412290;
                          if (v241)
                          {
                            uint64_t aBlock = (void **)&v241->isa;
                            v245 = v241;
                            UnsafeMutableRawBufferPointer.copyMemory(from:)();
                            id v246 = v307;
                          }
                          else
                          {
                            uint64_t aBlock = 0;
                            UnsafeMutableRawBufferPointer.copyMemory(from:)();
                            id v246 = 0;
                          }
                          void *v299 = v246;

                          _os_log_impl((void *)&_mh_execute_header, v242, v243, "deviceChanged device.image: %@", v244, 0xCu);
                          sub_10000BEA4(&qword_100062ED8);
                          swift_arrayDestroy();
                          swift_slowDealloc();
                          swift_slowDealloc();
                          uint64_t v184 = v304;
                          uint64_t v187 = v312;
                        }
                        else
                        {

                          uint64_t v242 = v241;
                        }

                        v98 = v302;
                        id v247 = *(void **)((char *)v22 + (void)v302);
                        *(void **)((char *)v22 + (void)v302) = v307;

                        v186 = v300;
                      }
                      id v248 = [v186 displayImageFileURL:v299];
                      if (v248)
                      {
                        id v249 = v248;
                        id v250 = v22;
                        static URL._unconditionallyBridgeFromObjectiveC(_:)();

                        v300 = v186;
                        uint64_t v251 = v311;
                        v252 = *(void (**)(void))(v311 + 32);
                        id v253 = v310;
                        v252();
                        (*(void (**)(NSObject *, void, uint64_t, uint64_t))(v251 + 56))(v253, 0, 1, v187);
                        uint64_t v254 = v251;
                        v186 = v300;
                        if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v254 + 48))(v253, 1, v187) != 1)
                        {
                          ((void (*)(char *, NSObject *, uint64_t))v252)(v308, v253, v187);
                          id v255 = *(UIImage **)((char *)v250 + (void)v98);
                          if (v255
                            && (Class v256 = UIImagePNGRepresentation(v255)) != 0)
                          {
                            v257 = v256;
                            uint64_t v258 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
                            unint64_t v260 = v259;

                            id v261 = v313;
                            Data.write(to:options:)();
                            if (v261)
                            {
                              swift_errorRetain();
                              swift_errorRetain();
                              v262 = Logger.logObject.getter();
                              os_log_type_t v263 = static os_log_type_t.error.getter();
                              if (os_log_type_enabled(v262, v263))
                              {
                                v313 = v16;
                                id v264 = (uint8_t *)swift_slowAlloc();
                                uint64_t v265 = swift_slowAlloc();
                                v310 = v262;
                                id v266 = (void *)v265;
                                *(_DWORD *)id v264 = 138412290;
                                swift_errorRetain();
                                id v267 = v17;
                                uint64_t v268 = _swift_stdlib_bridgeErrorToNSError();
                                uint64_t aBlock = (void **)v268;
                                id v16 = v313;
                                uint64_t v184 = v304;
                                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                                *id v266 = v268;
                                id v17 = v267;
                                uint64_t v187 = v312;
                                swift_errorRelease();
                                swift_errorRelease();
                                _os_log_impl((void *)&_mh_execute_header, v310, v263, "Error writing image to file: %@", v264, 0xCu);
                                sub_10000BEA4(&qword_100062ED8);
                                swift_arrayDestroy();
                                swift_slowDealloc();
                                swift_slowDealloc();
                                sub_10001E394(v258, v260);
                              }
                              else
                              {
                                sub_10001E394(v258, v260);

                                swift_errorRelease();
                                swift_errorRelease();
                              }
                              v186 = v300;
                              swift_errorRelease();
                              (*(void (**)(char *, uint64_t))(v311 + 8))(v308, v187);
                            }
                            else
                            {
                              (*(void (**)(char *, uint64_t))(v311 + 8))(v308, v187);
                              sub_10001E394(v258, v260);
                            }
                          }
                          else
                          {
                            (*(void (**)(char *, uint64_t))(v311 + 8))(v308, v187);
                          }
                          goto LABEL_187;
                        }
                      }
                      else
                      {
                        id v253 = v310;
                        (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(v311 + 56))(v310, 1, 1, v187);
                      }
                      uint64_t v269 = (uint64_t)v253;
                      goto LABEL_179;
                    }
                    id v193 = [v186 appAccessInfoMap];
                    uint64_t v194 = v312;
                    if (v193)
                    {
                      id v195 = v193;
                      sub_10000C108(0, (unint64_t *)&qword_100062DB0);
                      uint64_t v196 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

                      if (*(void *)(v196 + 16)
                        && (unint64_t v197 = sub_10001B800((uint64_t)v305, (uint64_t)v313), (v198 & 1) != 0))
                      {
                        id v199 = *(id *)(*(void *)(v196 + 56) + 8 * v197);
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        id v200 = [v199 associationIdentifier];

                        if (v200)
                        {
                          v300 = v186;
                          uint64_t v201 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                          uint64_t v203 = v202;

                          id v204 = (char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap;
                          swift_beginAccess();
                          uint64_t v205 = *(void *)v204;
                          if (*(void *)(*(void *)v204 + 16))
                          {
                            swift_bridgeObjectRetain();
                            unint64_t v206 = sub_10001B800(v201, v203);
                            if (v207)
                            {
                              v208 = *(id *)(*(void *)(v205 + 56) + 8 * v206);
                              swift_endAccess();
                              swift_bridgeObjectRelease_n();
                              v186 = v300;
                              id v209 = [v300 displayImageFileURL];
                              if (v209)
                              {
                                id v210 = v209;
                                id v211 = v309;
                                static URL._unconditionallyBridgeFromObjectiveC(_:)();

                                v310 = v208;
                                uint64_t v212 = v311;
                                id v213 = *(void (**)(char *, char *, uint64_t))(v311 + 32);
                                uint64_t v214 = (uint64_t)v307;
                                v213(v307, v211, v194);
                                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v212 + 56))(v214, 0, 1, v194);
                                uint64_t v215 = v212;
                                v208 = v310;
                                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v215 + 48))(v214, 1, v194) != 1)
                                {
                                  v313 = v16;
                                  id v305 = v17;
                                  v213(v306, (char *)v214, v194);
                                  id v216 = (UIImage *)[v208 productImage];
                                  uint64_t v217 = UIImagePNGRepresentation(v216);

                                  if (v217)
                                  {
                                    uint64_t v218 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
                                    unint64_t v220 = v219;

                                    Data.write(to:options:)();
                                    (*(void (**)(char *, uint64_t))(v311 + 8))(v306, v312);

                                    sub_10001E394(v218, v220);
                                  }
                                  else
                                  {

                                    (*(void (**)(char *, uint64_t))(v311 + 8))(v306, v312);
                                  }
                                  id v17 = v305;
                                  id v16 = v313;
                                  uint64_t v184 = v304;
                                  goto LABEL_184;
                                }
                              }
                              else
                              {
                                uint64_t v214 = (uint64_t)v307;
                                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v311 + 56))(v307, 1, 1, v194);
                              }

                              uint64_t v269 = v214;
LABEL_179:
                              sub_10001E478(v269, &qword_100062F10);
                              goto LABEL_187;
                            }
                            swift_bridgeObjectRelease();
                          }
                          swift_endAccess();
                          swift_bridgeObjectRelease();
LABEL_184:
                          v186 = v300;
                        }
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                    }
LABEL_187:
                    sub_10000C108(0, (unint64_t *)&qword_100063180);
                    v313 = (char *)static OS_dispatch_queue.main.getter();
                    uint64_t v270 = swift_allocObject();
                    swift_unknownObjectWeakInit();
                    uint64_t v271 = (void *)swift_allocObject();
                    uint64_t v272 = v303;
                    v271[2] = v270;
                    v271[3] = v272;
                    v271[4] = v184;
                    v271[5] = v186;
                    v323 = sub_10001E560;
                    v324 = v271;
                    uint64_t aBlock = _NSConcreteStackBlock;
                    unint64_t v320 = 1107296256;
                    v321 = sub_100015768;
                    v322 = &unk_100059960;
                    unint64_t v273 = _Block_copy(&aBlock);
                    id v274 = v186;
                    swift_retain();
                    swift_bridgeObjectRetain();
                    unint64_t v275 = v314;
                    static DispatchQoS.unspecified.getter();
                    v326 = &_swiftEmptyArrayStorage;
                    sub_10001D79C();
                    sub_10000BEA4((uint64_t *)&unk_100063190);
                    sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
                    uint64_t v276 = v315;
                    uint64_t v277 = v316;
                    dispatch thunk of SetAlgebra.init<A>(_:)();
                    uint64_t v278 = v313;
                    OS_dispatch_queue.async(group:qos:flags:execute:)();

                    _Block_release(v273);
                    swift_bridgeObjectRelease();

                    (*(void (**)(char *, uint64_t))(v317 + 8))(v276, v277);
                    (*((void (**)(char *, char *))v17 + 1))(v275, v16);
                    swift_release();
                    swift_release();
                    v279 = *(void **)((char *)v318
                                    + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest);
                    *(void **)((char *)v318
                             + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest) = 0;

                    return;
                  }
                }
                swift_bridgeObjectRelease();
                id v188 = v22;
                id v115 = v22;
                swift_bridgeObjectRetain();
                id v41 = Logger.logObject.getter();
                os_log_type_t v189 = static os_log_type_t.error.getter();
                if (!os_log_type_enabled(v41, v189))
                {

                  swift_bridgeObjectRelease_n();
                  goto LABEL_137;
                }
                unint64_t v190 = (uint8_t *)swift_slowAlloc();
                char v191 = (void *)swift_slowAlloc();
                *(_DWORD *)unint64_t v190 = 138412290;
                uint64_t aBlock = v115;
                v192 = v115;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *char v191 = v188;

                swift_bridgeObjectRelease();
                _os_log_impl((void *)&_mh_execute_header, v41, v189, "BUG?: This device was never picked %@", v190, 0xCu);
                sub_10000BEA4(&qword_100062ED8);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                goto LABEL_134;
              }
              swift_bridgeObjectRelease();
            }
            LOBYTE(v112) = 0;
            goto LABEL_116;
          }
          unint64_t v129 = v22;
          uint64_t v130 = v98;
          uint64_t v131 = v98;
          id v41 = Logger.logObject.getter();
          os_log_type_t v132 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v41, v132))
          {
            uint64_t v304 = v95;
            uint64_t v133 = (uint8_t *)swift_slowAlloc();
            v134 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v133 = 138412290;
            uint64_t aBlock = v131;
            uint64_t v135 = v131;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v134 = v130;

            _os_log_impl((void *)&_mh_execute_header, v41, v132, "BUG?: No appBundleID to setup %@", v133, 0xCu);
            sub_10000BEA4(&qword_100062ED8);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            goto LABEL_134;
          }
        }
        else
        {
          id v41 = Logger.logObject.getter();
          os_log_type_t v120 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v41, v120))
          {
            v121 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v121 = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, v120, "BUG?: No appBundleID", v121, 2u);
            swift_slowDealloc();

LABEL_134:
            swift_bridgeObjectRelease();
LABEL_135:

            return;
          }
        }
        swift_bridgeObjectRelease();
        return;
      case 0x32uLL:
        self;
        uint64_t v39 = swift_dynamicCastObjCClass();
        if (!v39) {
          goto LABEL_212;
        }
        id v40 = (void *)v39;
        id v41 = v22;
        if (![v40 devicesMigrated]) {
          goto LABEL_135;
        }
        id v42 = [v40 devices];
        if (v42)
        {
          id v43 = v42;
          sub_10000C108(0, &qword_100063D00);
          unint64_t v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v45 = v318;
          sub_10001E0B0(v44, (uint64_t)v45);
          swift_bridgeObjectRelease();

          uint64_t v46 = &v45[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
          swift_beginAccess();
          unint64_t v47 = *(void *)v46;
          if (v47 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v286 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v286 < 1) {
              goto LABEL_135;
            }
          }
          else if (*(uint64_t *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
          {
            goto LABEL_135;
          }
          v48 = *(void **)&v45[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
          BOOL v49 = v45[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] == 1;
          v313 = (char *)v41;
          if (v49)
          {
            if (v48) {
              [v48 invalidate];
            }
            uint64_t v50 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
            id v51 = *(void **)&v45[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
            if (v51)
            {
              [v51 invalidateWithReason:0];
              os_log_type_t v52 = *(void **)&v45[v50];
            }
            else
            {
              os_log_type_t v52 = 0;
            }
            *(void *)&v45[v50] = 0;

            sub_10000C108(0, (unint64_t *)&qword_100063180);
            v221 = (void *)static OS_dispatch_queue.main.getter();
            uint64_t v222 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v323 = sub_10001E454;
            v324 = (void *)v222;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v321 = sub_100015768;
            v322 = &unk_1000598C0;
            v223 = _Block_copy(&aBlock);
            swift_retain();
            static DispatchQoS.unspecified.getter();
            v325 = &_swiftEmptyArrayStorage;
            sub_10001D79C();
            sub_10000BEA4((uint64_t *)&unk_100063190);
            sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
            id v163 = v315;
            uint64_t v164 = v316;
            dispatch thunk of SetAlgebra.init<A>(_:)();
            OS_dispatch_queue.async(group:qos:flags:execute:)();
            _Block_release(v223);
          }
          else
          {
            if (v48) {
              [v48 invalidate];
            }
            uint64_t v136 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
            v137 = *(void **)&v45[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
            if (v137)
            {
              [v137 invalidateWithReason:0];
              v138 = *(void **)&v45[v136];
            }
            else
            {
              v138 = 0;
            }
            *(void *)&v45[v136] = 0;

            sub_10000C108(0, (unint64_t *)&qword_100063180);
            v221 = (void *)static OS_dispatch_queue.main.getter();
            uint64_t v224 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v323 = sub_10001E41C;
            v324 = (void *)v224;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v321 = sub_100015768;
            v322 = &unk_100059898;
            id v225 = _Block_copy(&aBlock);
            swift_retain();
            static DispatchQoS.unspecified.getter();
            v325 = &_swiftEmptyArrayStorage;
            sub_10001D79C();
            sub_10000BEA4((uint64_t *)&unk_100063190);
            sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
            id v163 = v315;
            uint64_t v164 = v316;
            dispatch thunk of SetAlgebra.init<A>(_:)();
            OS_dispatch_queue.async(group:qos:flags:execute:)();

            _Block_release(v225);
          }
        }
        else
        {
          v313 = (char *)v41;
          id v122 = Logger.logObject.getter();
          os_log_type_t v123 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v122, v123))
          {
            v124 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v124 = 0;
            _os_log_impl((void *)&_mh_execute_header, v122, v123, "No present devices to migrate.", v124, 2u);
            swift_slowDealloc();
          }

          uint64_t v125 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
          v126 = v318;
          id v127 = *(void **)((char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
          if (v127)
          {
            [v127 invalidateWithReason:0];
            Class v128 = *(void **)((char *)v126 + v125);
          }
          else
          {
            Class v128 = 0;
          }
          *(void **)((char *)v126 + v125) = 0;

          v151 = *(void **)((char *)v126 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer);
          if (v151) {
            [v151 invalidate];
          }
          int v152 = *((unsigned __int8 *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration);
          id v153 = Logger.logObject.getter();
          os_log_type_t v154 = static os_log_type_t.default.getter();
          BOOL v155 = os_log_type_enabled(v153, v154);
          if (v152 == 1)
          {
            if (v155)
            {
              uint64_t v156 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v156 = 0;
              _os_log_impl((void *)&_mh_execute_header, v153, v154, "Dismiss the UI, not allowed to migrate", v156, 2u);
              swift_slowDealloc();
            }

            sub_10000C108(0, (unint64_t *)&qword_100063180);
            id v157 = (void *)static OS_dispatch_queue.main.getter();
            uint64_t v158 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v323 = sub_10001E438;
            v324 = (void *)v158;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v159 = &unk_100059870;
          }
          else
          {
            if (v155)
            {
              id v160 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v160 = 0;
              _os_log_impl((void *)&_mh_execute_header, v153, v154, "Migration not allowed, show done view", v160, 2u);
              swift_slowDealloc();
            }

            sub_10000C108(0, (unint64_t *)&qword_100063180);
            id v157 = (void *)static OS_dispatch_queue.main.getter();
            uint64_t v161 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v323 = sub_10001E41C;
            v324 = (void *)v161;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v320 = 1107296256;
            v159 = &unk_100059848;
          }
          v321 = sub_100015768;
          v322 = v159;
          v162 = _Block_copy(&aBlock);
          swift_retain();
          static DispatchQoS.unspecified.getter();
          v326 = &_swiftEmptyArrayStorage;
          sub_10001D79C();
          sub_10000BEA4((uint64_t *)&unk_100063190);
          sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
          id v163 = v315;
          uint64_t v164 = v316;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();

          _Block_release(v162);
        }
        (*(void (**)(char *, uint64_t))(v317 + 8))(v163, v164);
        (*((void (**)(char *, char *))v17 + 1))(v19, v16);
        goto LABEL_154;
      case 0x37uLL:
        self;
        uint64_t v62 = swift_dynamicCastObjCClass();
        if (v62)
        {
          os_log_t v63 = (void *)v62;
          id v64 = v22;
          sub_100019FE4(v63);

          return;
        }
        uint64_t aBlock = 0;
        unint64_t v320 = 0xE000000000000000;
        _StringGuts.grow(_:)(83);
        v293._object = (void *)0x800000010004A740;
        v293._countAndFlagsBits = 0xD000000000000051;
        String.append(_:)(v293);
        id v294 = [v22 description];
        uint64_t v295 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v297 = v296;

        v298._countAndFlagsBits = v295;
        v298._object = v297;
        String.append(_:)(v298);
        swift_bridgeObjectRelease();
        goto LABEL_214;
      case 0x3CuLL:
        unint64_t v65 = Logger.logObject.getter();
        os_log_type_t v66 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v67 = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "XPC connection to dataaccessd interrupted, clearing devices", v67, 2u);
          swift_slowDealloc();
        }

        id v56 = v318;
        v68 = (char *)v318 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap;
        swift_beginAccess();
        if (!*(void *)v68) {
          goto LABEL_202;
        }
        *(void *)v68 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v69 = (char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap;
        swift_beginAccess();
        if (!*(void *)v69) {
          goto LABEL_203;
        }
        *(void *)uint64_t v69 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v70 = (char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap;
        swift_beginAccess();
        if (!*(void *)v70) {
          goto LABEL_204;
        }
        *(void *)uint64_t v70 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        id v71 = (char *)v56 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices;
        swift_beginAccess();
        *(void *)id v71 = &_swiftEmptyArrayStorage;
        goto LABEL_69;
      default:
        return;
    }
  }
}

void sub_100011B48()
{
  uint64_t v1 = v0;
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100062E00);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    objc_super v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)objc_super v5 = 136315138;
    sub_10000C108(0, &qword_100062F08);
    swift_bridgeObjectRetain();
    uint64_t v6 = Array.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_100023B0C(v6, v8, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "configureMigration: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v9 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery);
  if (!v10)
  {
    id v11 = objc_allocWithZone((Class)DADiscovery);
    swift_bridgeObjectRetain();
    id v12 = sub_10001B638();
    uint64_t v13 = *(void **)(v1 + v9);
    *(void *)(v1 + v9) = v12;

    uint64_t v10 = *(void **)(v1 + v9);
    if (!v10) {
      goto LABEL_44;
    }
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8))
  {
    id v14 = v10;
    swift_bridgeObjectRetain();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = v10;
    NSString v15 = 0;
  }
  [v10 setBundleID:v15, v33];

  id v17 = *(void **)(v1 + v9);
  if (!v17) {
    goto LABEL_40;
  }
  id v18 = v17;
  [v18 setFlags:((unint64_t)[v18 flags] | 4)];

  unint64_t v19 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems);
  if (!v19)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  if (v19 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    if (!v20) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v20) {
      goto LABEL_31;
    }
  }
  if (v20 < 1)
  {
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if ((v19 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      self;
      if (swift_dynamicCastObjCClass())
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    id v22 = (void **)(v19 + 32);
    do
    {
      uint64_t v23 = *v22;
      self;
      if (swift_dynamicCastObjCClass())
      {
        id v24 = v23;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      ++v22;
      --v20;
    }
    while (v20);
  }
LABEL_31:
  swift_bridgeObjectRelease();
  unint64_t v25 = aBlock[0];
  swift_bridgeObjectRelease();
  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v26 <= 0)
  {
LABEL_36:
    BOOL v29 = *(void **)(v1 + v9);
    if (v29)
    {
      uint64_t v30 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_10001E3EC;
      aBlock[5] = v30;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10000E4BC;
      aBlock[3] = (uint64_t)&unk_100059690;
      uint64_t v31 = _Block_copy(aBlock);
      id v32 = v29;
      swift_release();
      [v32 setEventHandler:v31];
      _Block_release(v31);

      return;
    }
    goto LABEL_42;
  }
  NSString v27 = *(void **)(v1 + v9);
  if (v27)
  {
    id v28 = v27;
    [v28 setFlags:((unint64_t)[v28 flags] | 8)];

    goto LABEL_36;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

void sub_100012128(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    a3(a1);
  }
}

void sub_100012198(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v135 = v4;
  uint64_t v136 = v5;
  __chkstk_darwin(v4);
  v134 = (char *)&v133 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = type metadata accessor for DispatchQoS();
  unint64_t v7 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  v137 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100062950 != -1) {
LABEL_96:
  }
    swift_once();
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = sub_100005F6C(v9, (uint64_t)qword_100062E00);
  id v11 = a1;
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v133 = (void *)swift_slowAlloc();
    id v139 = (id)v10;
    *(_DWORD *)id v14 = 138412290;
    uint64_t aBlock = v11;
    NSString v15 = v11;
    uint64_t v10 = (uint64_t)v139;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v133 = v11;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Migration discovery event: %@", v14, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v16 = (uint64_t)[v11 eventType];
  if (v16 > 19)
  {
    if (v16 == 20)
    {
      uint64_t v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v33, v34))
      {
        id v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Migration discovery: XPC connection to dataaccessd invalidated, clearing devices", v35, 2u);
        swift_slowDealloc();
      }

      uint64_t v36 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
      id v37 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
      if (v37)
      {
        [v37 invalidateWithReason:0];
        unint64_t v38 = *(void **)&v2[v36];
      }
      else
      {
        unint64_t v38 = 0;
      }
      *(void *)&v2[v36] = 0;

      sub_1000144CC(0, 0);
      uint64_t v58 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
      swift_beginAccess();
      if (*v58)
      {
        *uint64_t v58 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v59 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
        swift_beginAccess();
        if (*v59)
        {
          void *v59 = &_swiftEmptyDictionarySingleton;
          swift_bridgeObjectRelease();
          id v60 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
          swift_beginAccess();
          if (*v60)
          {
            void *v60 = &_swiftEmptyDictionarySingleton;
LABEL_61:
            swift_bridgeObjectRelease();
            id v61 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
            if (v61) {
              [v61 invalidate];
            }
            return;
          }
          goto LABEL_140;
        }
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
        goto LABEL_141;
      }
LABEL_138:
      __break(1u);
      goto LABEL_139;
    }
    if (v16 != 50)
    {
      if (v16 != 60) {
        return;
      }
      id v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        unint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Migration discovery: XPC connection to dataaccessd interrupted, clearing devices", v19, 2u);
        swift_slowDealloc();
      }

      uint64_t v20 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
      swift_beginAccess();
      if (*v20)
      {
        *uint64_t v20 = &_swiftEmptyDictionarySingleton;
        swift_bridgeObjectRelease();
        uint64_t v21 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
        swift_beginAccess();
        *uint64_t v21 = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease();
        id v22 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
        swift_beginAccess();
        if (*v22)
        {
          void *v22 = &_swiftEmptyDictionarySingleton;
          swift_bridgeObjectRelease();
          uint64_t v23 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
          swift_beginAccess();
          if (*v23)
          {
            void *v23 = &_swiftEmptyDictionarySingleton;
            goto LABEL_61;
          }
          goto LABEL_136;
        }
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
        goto LABEL_137;
      }
LABEL_134:
      __break(1u);
      goto LABEL_135;
    }
    self;
    uint64_t v39 = swift_dynamicCastObjCClass();
    if (v39)
    {
      id v40 = (void *)v39;
      uint64_t v26 = v11;
      if (![v40 devicesMigrated]) {
        goto LABEL_130;
      }
      id v41 = (void **)[v40 devices];
      if (v41)
      {
        id v11 = v41;
        sub_10000C108(0, &qword_100063D00);
        unint64_t v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v42 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
          if (!v43) {
            goto LABEL_112;
          }
        }
        else
        {
          uint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v43) {
            goto LABEL_112;
          }
        }
        if (v43 >= 1)
        {
          uint64_t v44 = 0;
          do
          {
            if ((v42 & 0xC000000000000001) != 0) {
              id v45 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v45 = *(id *)(v42 + 8 * v44 + 32);
            }
            uint64_t v46 = v45;
            ++v44;
            uint64_t aBlock = (void **)v45;
            sub_10001A46C((void **)&aBlock, (uint64_t)v2, "Migration discovery: Error writing image to file for migration: %@");
          }
          while (v43 != v44);
LABEL_112:
          swift_bridgeObjectRelease_n();
          unint64_t v111 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
          swift_beginAccess();
          if (*v111 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v126 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v126 > 0) {
              goto LABEL_114;
            }
          }
          else if (*(uint64_t *)((*v111 & 0xFFFFFFFFFFFFFF8) + 0x10) > 0)
          {
LABEL_114:
            uint64_t v112 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
            if (v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] == 1)
            {
              id v139 = v26;
              if (v112) {
                [v112 invalidate];
              }
              sub_10000C108(0, (unint64_t *)&qword_100063180);
              uint64_t v106 = (void *)static OS_dispatch_queue.main.getter();
              uint64_t v113 = swift_allocObject();
              swift_unknownObjectWeakInit();
              uint64_t v144 = sub_10001E454;
              uint64_t v145 = v113;
              uint64_t aBlock = _NSConcreteStackBlock;
              unint64_t v141 = 1107296256;
              char v108 = &unk_100059730;
LABEL_118:
              v142 = sub_100015768;
              uint64_t v143 = v108;
              v114 = _Block_copy(&aBlock);
              swift_retain();
              id v115 = v137;
              static DispatchQoS.unspecified.getter();
              uint64_t v146 = &_swiftEmptyArrayStorage;
              sub_10001D79C();
              sub_10000BEA4((uint64_t *)&unk_100063190);
              sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
              os_log_type_t v116 = v134;
              uint64_t v117 = v135;
              dispatch thunk of SetAlgebra.init<A>(_:)();
              OS_dispatch_queue.async(group:qos:flags:execute:)();
              _Block_release(v114);

              (*(void (**)(char *, uint64_t))(v136 + 8))(v116, v117);
              (*(void (**)(char *, uint64_t))(v7 + 8))(v115, v138);
              swift_release();
              swift_release();
              uint64_t v118 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
              v119 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
              if (v119)
              {
                [v119 invalidateWithReason:0];
                os_log_type_t v120 = *(void **)&v2[v118];
              }
              else
              {
                os_log_type_t v120 = 0;
              }
              v124 = v139;
              *(void *)&v2[v118] = 0;

              sub_1000144CC(0, 0);
              return;
            }
            char v85 = v26;
            if (v112) {
              [v112 invalidate];
            }
            sub_10000C108(0, (unint64_t *)&qword_100063180);
            uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
            uint64_t v121 = swift_allocObject();
            swift_unknownObjectWeakInit();
            uint64_t v144 = sub_10001E41C;
            uint64_t v145 = v121;
            uint64_t aBlock = _NSConcreteStackBlock;
            unint64_t v141 = 1107296256;
            id v110 = &unk_100059708;
LABEL_123:
            v142 = sub_100015768;
            uint64_t v143 = v110;
            uint64_t v101 = _Block_copy(&aBlock);
            swift_retain();
            v102 = v137;
            static DispatchQoS.unspecified.getter();
            uint64_t v146 = &_swiftEmptyArrayStorage;
            sub_10001D79C();
            sub_10000BEA4((uint64_t *)&unk_100063190);
            sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
            goto LABEL_124;
          }
LABEL_130:

          return;
        }
LABEL_133:
        __break(1u);
        goto LABEL_134;
      }
      v68 = Logger.logObject.getter();
      os_log_type_t v69 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v68, v69))
      {
        uint64_t v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "Migration discovery: No present devices to migrate.", v70, 2u);
        swift_slowDealloc();
      }

      uint64_t v71 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
      uint64_t v72 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
      if (v72)
      {
        [v72 invalidateWithReason:0];
        uint64_t v73 = *(void **)&v2[v71];
      }
      else
      {
        uint64_t v73 = 0;
      }
      *(void *)&v2[v71] = 0;

      sub_1000144CC(0, 0);
      id v80 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
      if (v80) {
        [v80 invalidate];
      }
      int v81 = v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration];
      id v82 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.default.getter();
      BOOL v84 = os_log_type_enabled(v82, v83);
      char v85 = v26;
      if (v81 == 1)
      {
        if (v84)
        {
          id v86 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v86 = 0;
          _os_log_impl((void *)&_mh_execute_header, v82, v83, "Migration discovery: Dismiss the UI, not allowed to migrate", v86, 2u);
          swift_slowDealloc();
        }

        sub_10000C108(0, (unint64_t *)&qword_100063180);
        uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v88 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v144 = sub_10001E438;
        uint64_t v145 = v88;
        uint64_t aBlock = _NSConcreteStackBlock;
        unint64_t v141 = 1107296256;
        os_log_type_t v89 = &unk_1000596E0;
      }
      else
      {
        if (v84)
        {
          id v90 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v90 = 0;
          _os_log_impl((void *)&_mh_execute_header, v82, v83, "Migration discovery: Migration not allowed, show done view", v90, 2u);
          swift_slowDealloc();
        }

        sub_10000C108(0, (unint64_t *)&qword_100063180);
        uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v91 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v144 = sub_10001E41C;
        uint64_t v145 = v91;
        uint64_t aBlock = _NSConcreteStackBlock;
        unint64_t v141 = 1107296256;
        os_log_type_t v89 = &unk_1000596B8;
      }
LABEL_94:
      v142 = sub_100015768;
      uint64_t v143 = v89;
      uint64_t v101 = _Block_copy(&aBlock);
      swift_retain();
      v102 = v137;
      static DispatchQoS.unspecified.getter();
      id v147 = &_swiftEmptyArrayStorage;
      sub_10001D79C();
      sub_10000BEA4((uint64_t *)&unk_100063190);
      sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
LABEL_124:
      id v122 = v134;
      uint64_t v123 = v135;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();

      _Block_release(v101);
      (*(void (**)(char *, uint64_t))(v136 + 8))(v122, v123);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v102, v138);
      swift_release();
      swift_release();
      return;
    }
LABEL_141:
    uint64_t aBlock = 0;
    unint64_t v141 = 0xE000000000000000;
    _StringGuts.grow(_:)(123);
    v127._object = (void *)0x800000010004A5F0;
    v127._countAndFlagsBits = 0xD000000000000079;
    String.append(_:)(v127);
    id v128 = [v11 description];
    uint64_t v129 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v131 = v130;

    v132._countAndFlagsBits = v129;
    v132._object = v131;
    String.append(_:)(v132);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  if (v16 != 10)
  {
    if (v16 != 15) {
      return;
    }
    self;
    uint64_t v24 = swift_dynamicCastObjCClass();
    if (!v24) {
      goto LABEL_141;
    }
    unint64_t v25 = (void *)v24;
    uint64_t v26 = v11;
    if (![v25 devicesMigrated]) {
      goto LABEL_130;
    }
    NSString v27 = (void **)[v25 devices];
    if (!v27)
    {
      v74 = Logger.logObject.getter();
      os_log_type_t v75 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v76 = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "Migration discovery: No present devices to migrate.", v76, 2u);
        swift_slowDealloc();
      }

      uint64_t v77 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
      uint64_t v78 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
      if (v78)
      {
        [v78 invalidateWithReason:0];
        uint64_t v79 = *(void **)&v2[v77];
      }
      else
      {
        uint64_t v79 = 0;
      }
      *(void *)&v2[v77] = 0;

      sub_1000144CC(0, 0);
      uint64_t v92 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
      if (v92) {
        [v92 invalidate];
      }
      int v93 = v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration];
      uint64_t v94 = Logger.logObject.getter();
      os_log_type_t v95 = static os_log_type_t.default.getter();
      BOOL v96 = os_log_type_enabled(v94, v95);
      char v85 = v26;
      if (v93 == 1)
      {
        if (v96)
        {
          uint64_t v97 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v97 = 0;
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "Migration discovery: Dismiss the UI, not allowed to migrate", v97, 2u);
          swift_slowDealloc();
        }

        sub_10000C108(0, (unint64_t *)&qword_100063180);
        uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v98 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v144 = sub_10001E438;
        uint64_t v145 = v98;
        uint64_t aBlock = _NSConcreteStackBlock;
        unint64_t v141 = 1107296256;
        os_log_type_t v89 = &unk_100059780;
      }
      else
      {
        if (v96)
        {
          v99 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v99 = 0;
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "Migration discovery: Migration not allowed, show done view", v99, 2u);
          swift_slowDealloc();
        }

        sub_10000C108(0, (unint64_t *)&qword_100063180);
        uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v100 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v144 = sub_10001E41C;
        uint64_t v145 = v100;
        uint64_t aBlock = _NSConcreteStackBlock;
        unint64_t v141 = 1107296256;
        os_log_type_t v89 = &unk_100059758;
      }
      goto LABEL_94;
    }
    id v11 = v27;
    sub_10000C108(0, &qword_100063D00);
    unint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
      if (!v29) {
        goto LABEL_102;
      }
    }
    else
    {
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_102;
      }
    }
    if (v29 < 1)
    {
      __break(1u);
      goto LABEL_133;
    }
    uint64_t v30 = 0;
    do
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v31 = *(id *)(v28 + 8 * v30 + 32);
      }
      id v32 = v31;
      ++v30;
      uint64_t aBlock = (void **)v31;
      sub_10001A46C((void **)&aBlock, (uint64_t)v2, "Migration discovery: Error writing image to file for migration: %@");
    }
    while (v29 != v30);
LABEL_102:
    swift_bridgeObjectRelease_n();
    v104 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
    swift_beginAccess();
    if (*v104 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v125 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v125 <= 0) {
        goto LABEL_130;
      }
    }
    else if (*(uint64_t *)((*v104 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0)
    {
      goto LABEL_130;
    }
    uint64_t v105 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
    if (v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] == 1)
    {
      id v139 = v26;
      if (v105) {
        [v105 invalidate];
      }
      sub_10000C108(0, (unint64_t *)&qword_100063180);
      uint64_t v106 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v107 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v144 = sub_10001E454;
      uint64_t v145 = v107;
      uint64_t aBlock = _NSConcreteStackBlock;
      unint64_t v141 = 1107296256;
      char v108 = &unk_1000597D0;
      goto LABEL_118;
    }
    char v85 = v26;
    if (v105) {
      [v105 invalidate];
    }
    sub_10000C108(0, (unint64_t *)&qword_100063180);
    uint64_t v87 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v109 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v144 = sub_10001E41C;
    uint64_t v145 = v109;
    uint64_t aBlock = _NSConcreteStackBlock;
    unint64_t v141 = 1107296256;
    id v110 = &unk_1000597A8;
    goto LABEL_123;
  }
  unint64_t v47 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery];
  if (!v47)
  {
LABEL_137:
    __break(1u);
    goto LABEL_138;
  }
  id v48 = [v47 discoveredDevices];
  sub_10000C108(0, &qword_100063D00);
  unint64_t v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v139 = (id)v10;
  uint64_t v50 = v2;
  if (!(v49 >> 62))
  {
    uint64_t v51 = *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v51) {
      goto LABEL_46;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    uint64_t v57 = &v50[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
    swift_beginAccess();
    if (*v57 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v103 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v103 < 1) {
        return;
      }
    }
    else if (*(uint64_t *)((*v57 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
    {
      return;
    }
    sub_10001928C();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v51) {
    goto LABEL_53;
  }
LABEL_46:
  unint64_t v7 = v49 & 0xC000000000000001;
  uint64_t v52 = 4;
  while (1)
  {
    a1 = (void *)(v52 - 4);
    if (v7) {
      NSString v53 = (unsigned char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      NSString v53 = *(id *)(v49 + 8 * v52);
    }
    uint64_t v2 = v53;
    uint64_t v54 = v52 - 3;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
      goto LABEL_96;
    }
    id v55 = [v53 identifier];
    if (!v55) {
      break;
    }

    id v56 = sub_100016EA0(v2);
    ++v52;
    if (v54 == v51) {
      goto LABEL_53;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v62 = v2;
  os_log_t v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v63, v64))
  {
    unint64_t v65 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v66 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v65 = 138412290;
    uint64_t aBlock = v62;
    uint64_t v67 = v62;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v66 = v62;

    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Migration discovery: DADevice does not have an identifier, ignoring. %@", v65, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

id sub_100013A80()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000BEA4(&qword_100062EE0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)DADiscoveryConfiguration) init];
  NSString v10 = String._bridgeToObjectiveC()();
  [v9 setBundleID:v10];

  NSString v11 = [v1 identifier];
  if (!v11)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [v9 setAssociationIdentifier:v11];

  NSString v12 = [v1 name];
  if (!v12)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [v9 setDisplayName:v12];

  [v9 setAllowsRename:[v1 setupOptions] & 1];
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = v1;
    id v16 = [v14 peripheralIdentifier];
    if (v16)
    {
      id v17 = v16;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
      {
        Class isa = 0;
      }
      else
      {
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
      Class isa = 0;
    }
    [v9 setBluetoothIdentifier:isa];

    id v19 = [v14 hotspotSSID];
    [v9 setNetworkHotspotSSID:v19];
  }
  id v20 = [v1 descriptor];
  id v21 = [v20 SSID];

  if (v21)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    sub_10000BEA4(&qword_100062EF8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_100049280;
    *(void *)(v25 + 32) = v22;
    *(void *)(v25 + 40) = v24;
    Class v26 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 setHotspotSSIDs:v26];
  }
  id v27 = [v1 descriptor];
  id v28 = [v27 SSIDPrefix];

  if (v28)
  {
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v30;

    sub_10000BEA4(&qword_100062EF8);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_100049280;
    *(void *)(v32 + 32) = v29;
    *(void *)(v32 + 40) = v31;
    Class v33 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 setHotspotSSIDPrefixes:v33];
  }
  if (([v1 setupOptions] & 2) != 0) {
    [v9 setFlags:[v9 flags] | 0x10];
  }
  id v34 = [v1 descriptor];
  unsigned int v35 = [v34 bluetoothCompanyIdentifier];

  if (v35)
  {
    sub_10000BEA4(&qword_100062D98);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_100049330;
    id v37 = [v1 descriptor];
    id v38 = [v37 bluetoothCompanyIdentifier];

    *(void *)(v36 + 32) = [objc_allocWithZone((Class)NSNumber) initWithUnsignedShort:v38];
    uint64_t v77 = v36;
    specialized Array._endMutation()();
    sub_10000C108(0, &qword_100062EF0);
    Class v39 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 setBluetoothCompanyIdentifiers:v39];
  }
  id v40 = [v1 descriptor];
  id v41 = [v40 bluetoothServiceUUID];

  if (v41)
  {
    sub_10000BEA4(&qword_100062D98);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_100049330;
    *(void *)(v42 + 32) = v41;
    uint64_t v77 = v42;
    specialized Array._endMutation()();
    sub_10000C108(0, &qword_100062EE8);
    id v43 = v41;
    Class v44 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 setBluetoothServices:v44];
  }
  id v45 = [v1 descriptor];
  unsigned __int8 v46 = [v45 supportedOptions];

  if ((v46 & 2) != 0) {
    [v9 setFlags:[v9 flags] | 2];
  }
  id v47 = [v1 descriptor];
  unsigned __int8 v48 = [v47 supportedOptions];

  if ((v48 & 4) != 0) {
    [v9 setFlags:[v9 flags] | 4];
  }
  if ([v1 renameOptions]) {
    [v9 setFlags:[v9 flags] | 8];
  }
  id v49 = [v1 descriptor];
  id v50 = [v49 bluetoothRange];

  [v9 setBluetoothRange:v50];
  id v51 = [v1 descriptor];
  id v52 = [v51 bluetoothNameSubstring];

  [v9 setBluetoothNameSubstring:v52];
  id v53 = [v1 descriptor];
  Class v54 = (Class)[v53 bluetoothServiceDataBlob];

  if (v54)
  {
    uint64_t v55 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v57 = v56;

    Class v54 = Data._bridgeToObjectiveC()().super.isa;
    sub_10001E394(v55, v57);
  }
  [v9 setBluetoothServicePayload:v54];

  id v58 = [v1 descriptor];
  Class v59 = (Class)[v58 bluetoothServiceDataMask];

  if (v59)
  {
    uint64_t v60 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v62 = v61;

    Class v59 = Data._bridgeToObjectiveC()().super.isa;
    sub_10001E394(v60, v62);
  }
  [v9 setBluetoothServicePayloadMask:v59];

  id v63 = [v1 descriptor];
  Class v64 = (Class)[v63 bluetoothManufacturerDataBlob];

  if (v64)
  {
    uint64_t v65 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v67 = v66;

    Class v64 = Data._bridgeToObjectiveC()().super.isa;
    sub_10001E394(v65, v67);
  }
  [v9 setBluetoothCompanyPayload:v64];

  id v68 = [v1 descriptor];
  Class v69 = (Class)[v68 bluetoothManufacturerDataMask];

  if (v69)
  {
    uint64_t v70 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v72 = v71;

    Class v69 = Data._bridgeToObjectiveC()().super.isa;
    sub_10001E394(v70, v72);
  }
  [v9 setBluetoothCompanyPayloadMask:v69];

  id v73 = [v1 descriptor];
  id v74 = [v73 bluetoothNameSubstringCompareOptions];

  [v9 setBluetoothNameSubstringCompareOptions:v74];
  return v9;
}

void sub_1000144CC(uint64_t a1, char a2)
{
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery);
  if (a2)
  {
    if (v4) {
      [v4 invalidate:a1];
    }
  }
  else if (v4)
  {
    [v4 invalidateWithReason:a1];
  }
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap);
  swift_beginAccess();
  if (*v5)
  {
    *uint64_t v5 = &_swiftEmptyDictionarySingleton;
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems);
    swift_beginAccess();
    if (*v6)
    {
      void *v6 = &_swiftEmptyArrayStorage;
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery);
    *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery) = 0;
  }
  else
  {
    __break(1u);
  }
}

void sub_1000145BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100014628(uint64_t a1, NSObject *isa)
{
  uint64_t v119 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(NSObject **)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v8 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v118 = (char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = v2;
  NSString v12 = (uint64_t *)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
  swift_beginAccess();
  uint64_t v13 = *v12;
  if (!v13)
  {
    __break(1u);
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (!*(void *)(v13 + 16))
  {
LABEL_96:
    swift_endAccess();
    uint64_t aBlock = 0;
    unint64_t v132 = 0xE000000000000000;
    _StringGuts.grow(_:)(63);
    v106._countAndFlagsBits = 0xD00000000000003DLL;
    v106._object = (void *)0x800000010004A440;
    String.append(_:)(v106);
    v107._countAndFlagsBits = a1;
    v107._object = isa;
    String.append(_:)(v107);
    goto LABEL_99;
  }
  uint64_t v114 = v10;
  id v115 = v8;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_10001B800(a1, (uint64_t)isa);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_96;
  }
  uint64_t v116 = v9;
  uint64_t v117 = v6;
  id v16 = *(void **)(*(void *)(v13 + 56) + 8 * v14);
  swift_endAccess();
  id v17 = v16;
  swift_bridgeObjectRelease();
  os_log_type_t v18 = v124;
  uint64_t v19 = *(void *)&v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8];
  if (!v19) {
    goto LABEL_99;
  }
  uint64_t v121 = (uint64_t *)&v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
  uint64_t v120 = *(void *)&v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
  uint64_t v123 = v19;
  swift_bridgeObjectRetain();
  sub_10002D958();
  uint64_t v21 = v20;
  uint64_t v6 = v22;
  uint64_t v23 = &v18[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
  swift_beginAccess();
  uint64_t v24 = *(void *)v23;
  if (!v24) {
    goto LABEL_82;
  }
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_10001B800(v21, (uint64_t)v6), (v26 & 1) == 0))
  {
LABEL_94:
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t aBlock = 0;
    unint64_t v132 = 0xE000000000000000;
    _StringGuts.grow(_:)(65);
    v104._countAndFlagsBits = 0xD00000000000003FLL;
    v104._object = (void *)0x800000010004A4A0;
    String.append(_:)(v104);
    v105._countAndFlagsBits = a1;
    v105._object = isa;
    String.append(_:)(v105);
LABEL_99:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  unint64_t v3 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v122 = v17;
  if (v3 >> 62)
  {
LABEL_72:
    swift_bridgeObjectRetain();
    unint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v29 = &unk_100062000;
    if (v27) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v27 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v29 = &unk_100062000;
    if (v27)
    {
LABEL_10:
      uint64_t v30 = &v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
      uint64_t v129 = (void *)(v3 & 0xC000000000000001);
      uint64_t v125 = (char *)(v3 + 32);
      uint64_t v126 = v3 & 0xFFFFFFFFFFFFFF8;
      *(void *)&long long v28 = 138412290;
      long long v128 = v28;
      Swift::String v127 = &v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
      while (1)
      {
        if (__OFSUB__(v27--, 1))
        {
          __break(1u);
LABEL_70:
          __break(1u);
LABEL_71:
          __break(1u);
          goto LABEL_72;
        }
        if (v129)
        {
          unsigned int v35 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v27 & 0x8000000000000000) != 0) {
            goto LABEL_70;
          }
          if (v27 >= *(void *)(v126 + 16)) {
            goto LABEL_71;
          }
          unsigned int v35 = (char *)*(id *)&v125[8 * v27];
        }
        uint64_t v36 = v35;
        uint64_t v37 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
        id v38 = *(void **)&v35[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
        if (!v38)
        {
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        id v39 = [v38 identifier];
        if (!v39) {
          goto LABEL_78;
        }
        id v40 = v39;
        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v43 = v42;

        swift_beginAccess();
        uint64_t v44 = *(void *)v30;
        if (!*(void *)v30) {
          goto LABEL_79;
        }
        if (!*(void *)(v44 + 16)) {
          break;
        }
        unint64_t v45 = sub_10001B800(v41, v43);
        if ((v46 & 1) == 0) {
          break;
        }
        id v47 = *(void **)(*(void *)(v44 + 56) + 8 * v45);
        swift_endAccess();
        Class v33 = v47;
        swift_bridgeObjectRelease();
        if (v29[298] != -1) {
          swift_once();
        }
        uint64_t v48 = type metadata accessor for Logger();
        sub_100005F6C(v48, (uint64_t)qword_100062E00);
        id v49 = v36;
        uint64_t v32 = Logger.logObject.getter();
        os_log_type_t v50 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v32, v50))
        {
          id v51 = v29;
          unint64_t v52 = v3;
          uint64_t v53 = swift_slowAlloc();
          Class v54 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v53 = v128;
          *(void *)(v53 + 4) = v49;
          void *v54 = v49;
          _os_log_impl((void *)&_mh_execute_header, v32, v50, "current backing device was lost, check if we have older ones that are available %@", (uint8_t *)v53, 0xCu);
          sub_10000BEA4(&qword_100062ED8);
          swift_arrayDestroy();
          swift_slowDealloc();
          unint64_t v3 = v52;
          uint64_t v29 = v51;
          uint64_t v30 = v127;
          swift_slowDealloc();
          uint64_t v31 = v49;
        }
        else
        {

          uint64_t v31 = v33;
          uint64_t v32 = v49;
          Class v33 = v49;
        }

        if (!v27) {
          goto LABEL_73;
        }
      }
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v55 = v36;
      swift_bridgeObjectRelease_n();
      if (v29[298] != -1) {
        swift_once();
      }
      uint64_t v56 = type metadata accessor for Logger();
      sub_100005F6C(v56, (uint64_t)qword_100062E00);
      uint64_t v6 = v55;
      Class isa = Logger.logObject.getter();
      os_log_type_t v57 = static os_log_type_t.default.getter();
      a1 = v57;
      if (os_log_type_enabled(isa, v57))
      {
        id v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v129 = (void *)swift_slowAlloc();
        *(_DWORD *)id v58 = v128;
        uint64_t aBlock = (void **)&v6->isa;
        unint64_t v3 = v6;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        Class v59 = v129;
        *uint64_t v129 = v6;

        _os_log_impl((void *)&_mh_execute_header, isa, (os_log_type_t)a1, "Pick device: %@", v58, 0xCu);
        sub_10000BEA4(&qword_100062ED8);
        a1 = (uint64_t)v59;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        Class isa = v6;
      }
      uint64_t v60 = v121;

      unint64_t v61 = *(void **)&v36[v37];
      if (v61)
      {
        id v62 = [v61 appAccessInfoMap];
        if (v62)
        {
          id v63 = v62;
          sub_10000C108(0, (unint64_t *)&qword_100062DB0);
          uint64_t v64 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          Class isa = v60[1];
          if (!isa) {
            goto LABEL_91;
          }
          if (*(void *)(v64 + 16))
          {
            a1 = *v60;
            swift_bridgeObjectRetain();
            unint64_t v65 = sub_10001B800(a1, (uint64_t)isa);
            if (v66)
            {
              unint64_t v67 = *(void **)(*(void *)(v64 + 56) + 8 * v65);
              id v68 = v67;
            }
            else
            {
              unint64_t v67 = 0;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v67 = 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          unint64_t v67 = 0;
        }
        sub_10002DAC4();
        if (v69 && !v67)
        {

          uint64_t aBlock = 0;
          unint64_t v132 = 0xE000000000000000;
          _StringGuts.grow(_:)(67);
          v108._countAndFlagsBits = 0xD000000000000041;
          v108._object = (void *)0x800000010004A500;
          String.append(_:)(v108);
          id v109 = [v6 description];
          uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v112 = v111;

          v113._countAndFlagsBits = v110;
          v113._object = v112;
          String.append(_:)(v113);
          swift_bridgeObjectRelease();
          goto LABEL_99;
        }
        uint64_t v70 = *(void **)&v36[v37];
        if (!v70) {
          goto LABEL_84;
        }
        unint64_t v71 = [v70 identifier];
        if (v71)
        {
          Class isa = v71;
          unint64_t v3 = (unint64_t)v6;
          uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          a1 = v73;

          uint64_t v6 = &v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID];
          v6->Class isa = (Class)v72;
          v6[1].Class isa = (Class)a1;
          swift_bridgeObjectRelease();
          if (qword_1000629B0 != -1) {
            swift_once();
          }
          id v74 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
          if (v74) {
            [v74 pickerDidSelectAccessory];
          }
          if (v60[1])
          {
            Class isa = v6[1].isa;
            if (!isa) {
              goto LABEL_87;
            }
            uint64_t v6 = v6->isa;
            id v75 = objc_allocWithZone((Class)DADeviceAppAccessInfo);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            a1 = (uint64_t)String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            NSString v76 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            id v77 = [v75 initWithBundleIdentifier:a1 deviceIdentifier:v76 state:10];

            uint64_t v78 = *(void **)&v36[v37];
            if (v78)
            {
              uint64_t v79 = [v78 discoveryConfiguration];
              if (!v79) {
                goto LABEL_61;
              }
              Class isa = v79;
              a1 = (uint64_t)[v79 associationIdentifier];

              if (!a1) {
                goto LABEL_61;
              }
              uint64_t v80 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              Class isa = v81;

              uint64_t v6 = *(NSObject **)&v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItems];
              if (!v6) {
                goto LABEL_93;
              }
              swift_bridgeObjectRetain();
              unint64_t v82 = swift_bridgeObjectRetain();
              a1 = 0;
              os_log_type_t v83 = sub_10001D574(v82, v80, (uint64_t)isa);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              if (v83)
              {
                a1 = v123;
                Class isa = sub_100013A80();
                swift_bridgeObjectRelease();
                [v77 setAppDiscoveryConfiguration:isa];

                BOOL v84 = *(void **)(qword_100064A90
                               + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
                if (v84)
                {
                  Class isa = v84;
                  a1 = (uint64_t)[v83 renameOptions];

                  *((unsigned char *)&isa->isa + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_accessoryRenamingSSID) = a1 & 1;
                }
                else
                {
                }
              }
              else
              {
LABEL_61:
                swift_bridgeObjectRelease();
              }
              if (*(unsigned char *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_needsBluetoothSetup) == 1)
              {
                char v85 = *(void **)&v36[v37];
                if (!v85) {
                  goto LABEL_92;
                }
                Class isa = v85;
                [isa setFlags:(unint64_t)[isa flags] | 0x10];
              }
              a1 = *(void *)&v124[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
              if (a1)
              {
                uint64_t v6 = *(NSObject **)&v36[v37];
                if (!v6) {
                  goto LABEL_90;
                }
                uint64_t v86 = swift_allocObject();
                uint64_t v87 = v124;
                *(void *)(v86 + 16) = v124;
                uint64_t v135 = sub_10001B8B0;
                uint64_t v136 = v86;
                uint64_t aBlock = _NSConcreteStackBlock;
                unint64_t v132 = 1107296256;
                uint64_t v133 = sub_1000145BC;
                v134 = &unk_100059578;
                uint64_t v88 = _Block_copy(&aBlock);
                id v89 = (id)a1;
                id v90 = v6;
                id v91 = v87;
                swift_release();
                [v89 setDeviceAppAccessInfo:v77 device:v90 completionHandler:v88];

                _Block_release(v88);
                return;
              }
              goto LABEL_89;
            }
LABEL_88:

            __break(1u);
LABEL_89:

            __break(1u);
LABEL_90:
            id v103 = (id)a1;

            __break(1u);
LABEL_91:

            __break(1u);
LABEL_92:

            __break(1u);
LABEL_93:

            __break(1u);
            goto LABEL_94;
          }
LABEL_86:

          __break(1u);
LABEL_87:
          swift_bridgeObjectRetain();

          __break(1u);
          goto LABEL_88;
        }
LABEL_85:
        __break(1u);
        goto LABEL_86;
      }
LABEL_83:

      __break(1u);
LABEL_84:
      __break(1u);
      goto LABEL_85;
    }
  }
LABEL_73:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29[298] != -1) {
LABEL_80:
  }
    swift_once();
  uint64_t v92 = type metadata accessor for Logger();
  sub_100005F6C(v92, (uint64_t)qword_100062E00);
  int v93 = Logger.logObject.getter();
  os_log_type_t v94 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v93, v94))
  {
    os_log_type_t v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v95 = 0;
    _os_log_impl((void *)&_mh_execute_header, v93, v94, "no available backing device, showing connection error directly", v95, 2u);
    swift_slowDealloc();
  }

  sub_10000C108(0, (unint64_t *)&qword_100063180);
  BOOL v96 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v97 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v98 = swift_allocObject();
  *(void *)(v98 + 16) = v97;
  *(void *)(v98 + 24) = v3;
  uint64_t v135 = sub_10001D794;
  uint64_t v136 = v98;
  uint64_t aBlock = _NSConcreteStackBlock;
  unint64_t v132 = 1107296256;
  uint64_t v133 = sub_100015768;
  v134 = &unk_1000595F0;
  v99 = _Block_copy(&aBlock);
  swift_retain();
  uint64_t v100 = v118;
  static DispatchQoS.unspecified.getter();
  uint64_t v130 = &_swiftEmptyArrayStorage;
  sub_10001D79C();
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  uint64_t v101 = v115;
  uint64_t v102 = v119;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();

  _Block_release(v99);
  ((void (*)(char *, uint64_t))v117[1].isa)(v101, v102);
  (*(void (**)(char *, uint64_t))(v114 + 8))(v100, v116);
  swift_release();
  swift_release();
}

void sub_100015638(uint64_t a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  id v4 = (void *)Strong;
  if (!swift_unknownObjectWeakLoadStrong())
  {

    return;
  }
  if (!(a2 >> 62))
  {
    uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  if (!v5) {
    goto LABEL_14;
  }
LABEL_5:
  unint64_t v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_16:
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_10;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v6 < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(a2 + 8 * v6 + 32);
LABEL_10:
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_1000241E0((uint64_t)v8);

    swift_unknownObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_100015768(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000157AC(uint64_t result, uint64_t a2)
{
  if (result)
  {
    swift_errorRetain();
    if (qword_100062950 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100005F6C(v3, (uint64_t)qword_100062E00);
    swift_errorRetain();
    swift_errorRetain();
    id v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      id v7 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v6 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v7 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "error when picking a device: %@", v6, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
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
    uint64_t v8 = (void *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pickedDeviceID);
    *uint64_t v8 = 0;
    v8[1] = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10001599C()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems];
  swift_beginAccess();
  unint64_t v3 = *(void *)v2;
  if (*(void *)v2)
  {
    if (v3 >> 62)
    {
LABEL_23:
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter() > 0)
      {
        swift_bridgeObjectRetain();
        os_log_type_t v18 = v1;
        uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v4)
        {
          swift_bridgeObjectRelease();

LABEL_13:
          uint64_t v10 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
          uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
          if (v11)
          {
            [v11 invalidateWithReason:0];
            NSString v12 = *(void **)&v1[v10];
          }
          else
          {
            NSString v12 = 0;
          }
          *(void *)&v1[v10] = 0;

          sub_100011B48();
          swift_bridgeObjectRelease();
          v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_dismissOnMigration] = 0;
          if (qword_100062950 != -1) {
            swift_once();
          }
          uint64_t v13 = type metadata accessor for Logger();
          sub_100005F6C(v13, (uint64_t)qword_100062E00);
          unint64_t v14 = Logger.logObject.getter();
          os_log_type_t v15 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v14, v15))
          {
            id v16 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, v15, "Migration displayItems after setup so dismiss after migration complete", v16, 2u);
            swift_slowDealloc();
          }

          id v17 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery];
          if (v17)
          {
            [v17 migrateDevices];
            return;
          }
          goto LABEL_44;
        }
        specialized ContiguousArray.reserveCapacity(_:)();
        if ((v4 & 0x8000000000000000) == 0)
        {
LABEL_5:
          uint64_t v6 = 0;
          id v7 = &v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
          while (1)
          {
            if (v4 == v6)
            {
              __break(1u);
              goto LABEL_23;
            }
            id v8 = (v3 & 0xC000000000000001) != 0
               ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
               : *(id *)(v3 + 8 * v6 + 32);
            uint64_t v9 = v8;
            if (!*((void *)v7 + 1)) {
              break;
            }
            ++v6;
            swift_bridgeObjectRetain();
            sub_100013A80();

            swift_bridgeObjectRelease();
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
            if (v4 == v6)
            {
              swift_bridgeObjectRelease();

              goto LABEL_13;
            }
          }
          __break(1u);
LABEL_44:
          __break(1u);
          return;
        }
        __break(1u);
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4)
      {
        os_log_type_t v5 = v1;
        specialized ContiguousArray.reserveCapacity(_:)();
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discoveryTimer];
  if (v19) {
    [v19 invalidate];
  }
  uint64_t v20 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
  uint64_t v21 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
  if (v21)
  {
    [v21 invalidateWithReason:0];
    uint64_t v22 = *(void **)&v1[v20];
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)&v1[v20] = 0;

  sub_1000144CC(0, 1);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v24 = Strong;
    if (qword_100062970 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_100005F6C(v25, (uint64_t)qword_100063070);
    char v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      long long v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Showing Done View", v28, 2u);
      swift_slowDealloc();
    }

    uint64_t v29 = *(void **)(v24 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = sub_100030D84();
      [v30 pushViewController:v31 animated:1];
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

void sub_100015E48(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (!v10) {
    goto LABEL_31;
  }
  uint64_t v11 = qword_100062950;
  NSString v12 = v10;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100005F6C(v13, (uint64_t)qword_100062E00);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    swift_bridgeObjectRetain();
    sub_100023B0C(a3, a4, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_100023B0C(a1, (unint64_t)a2, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "New Name: \"%s\", for ID: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  id v17 = [objc_allocWithZone((Class)DADeviceSettings) init];
  [v17 setUserInitiated:1];
  NSString v18 = String._bridgeToObjectiveC()();
  [v17 setDisplayName:v18];

  if (v12[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_accessoryRenamingSSID] == 1)
  {
    NSString v19 = String._bridgeToObjectiveC()();
    [v17 setSSID:v19];
  }
  uint64_t v20 = *(void **)(v5 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_session);
  if (v20)
  {
    id v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    os_log_type_t v57 = sub_10001671C;
    uint64_t v58 = 0;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v54 = 1107296256;
    uint64_t v55 = sub_1000145BC;
    uint64_t v56 = &unk_100059668;
    uint64_t v23 = _Block_copy(&aBlock);
    [v21 modifyDeviceWithIdentifier:v22 settings:v17 completionHandler:v23];
    _Block_release(v23);

    uint64_t v24 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory];
    if (v24)
    {
      id v25 = v24;
      NSString v26 = String._bridgeToObjectiveC()();
      [v25 setDisplayName:v26];
    }
    os_log_type_t v27 = (char *)v17;
    goto LABEL_24;
  }
  id v51 = v12;
  long long v28 = (uint64_t *)(v5 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap);
  swift_beginAccess();
  uint64_t v29 = *v28;
  if (!*v28)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (*(void *)(v29 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v30 = sub_10001B800(a1, (uint64_t)a2);
    if (v31)
    {
      uint64_t v32 = *(void **)(*(void *)(v29 + 56) + 8 * v30);
      swift_endAccess();
      id v33 = v32;
      uint64_t v49 = (uint64_t)a2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      id v34 = (char *)v33;
      unsigned int v35 = Logger.logObject.getter();
      os_log_type_t v36 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v35, v36))
      {
        os_log_type_t type = v36;
        unint64_t v50 = a4;
        uint64_t v37 = swift_slowAlloc();
        id v47 = (void *)swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315394;
        swift_bridgeObjectRetain();
        sub_100023B0C(a3, v50, &aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v37 + 12) = 2112;
        id v38 = v34;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v47 = v34;

        _os_log_impl((void *)&_mh_execute_header, v35, type, "New Name: \"%s\", for device: %@", (uint8_t *)v37, 0x16u);
        sub_10000BEA4(&qword_100062ED8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        a4 = v50;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v39 = *(void **)(v5 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
      if (v39)
      {
        id v40 = v39;
        NSString v41 = String._bridgeToObjectiveC()();
        os_log_type_t v57 = sub_10001671C;
        uint64_t v58 = 0;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        unint64_t v54 = 1107296256;
        uint64_t v55 = sub_1000145BC;
        uint64_t v56 = &unk_100059640;
        uint64_t v42 = _Block_copy(&aBlock);
        [v40 modifyDeviceWithIdentifier:v41 settings:v17 completionHandler:v42];
        _Block_release(v42);

        uint64_t v43 = (uint64_t *)&v34[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
        *uint64_t v43 = a3;
        v43[1] = a4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        if (*v28)
        {
          swift_bridgeObjectRetain();
          os_log_type_t v27 = v34;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v52 = *v28;
          *long long v28 = 0x8000000000000000;
          sub_10001C288((uint64_t)v27, a1, v49, isUniquelyReferenced_nonNull_native);
          *long long v28 = v52;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();
          id v21 = v17;
          NSString v12 = v51;
LABEL_24:

          return;
        }
        goto LABEL_27;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  uint64_t aBlock = 0;
  unint64_t v54 = 0xE000000000000000;
  _StringGuts.grow(_:)(85);
  v45._countAndFlagsBits = 0xD000000000000053;
  v45._object = (void *)0x800000010004A570;
  String.append(_:)(v45);
  v46._countAndFlagsBits = a1;
  v46._object = a2;
  String.append(_:)(v46);
LABEL_31:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10001671C(uint64_t a1)
{
  sub_100016774(a1);
}

void sub_100016774(uint64_t a1)
{
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100062E00);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    if (a1)
    {
      swift_errorRetain();
      uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v6 = 0;
    }
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "error when renaming a device: %@", v4, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_1000169A8(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest);
  if (v5)
  {
    id v9 = v5;
    id v10 = [v9 pairingInfo];
    [v10 setAccept:a1 & 1];
    if (!a3) {
      goto LABEL_46;
    }
    uint64_t v11 = HIBYTE(a3) & 0xF;
    uint64_t v12 = a2 & 0xFFFFFFFFFFFFLL;
    if (!((a3 & 0x2000000000000000) != 0 ? HIBYTE(a3) & 0xF : a2 & 0xFFFFFFFFFFFFLL)) {
      goto LABEL_46;
    }
    if ((a3 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      Swift::Int v17 = (Swift::Int)sub_10001C8DC(a2, a3, 10);
      char v38 = v37;
      swift_bridgeObjectRelease();
      if ((v38 & 1) == 0) {
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    if ((a3 & 0x2000000000000000) == 0)
    {
      if ((a2 & 0x1000000000000000) != 0) {
        unint64_t v14 = (unsigned __int8 *)((a3 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        unint64_t v14 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      os_log_type_t v15 = sub_10001C9C4(v14, v12, 10);
      if ((v16 & 1) == 0)
      {
        Swift::Int v17 = (Swift::Int)v15;
LABEL_45:
        sub_10000C108(0, &qword_100062EF0);
        Class isa = NSNumber.init(integerLiteral:)(v17).super.super.isa;
        [v10 setPasskey:isa];
      }
LABEL_46:
      NSString v26 = *(void **)(v4 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
      if (v26)
      {
        uint64_t v44 = nullsub_1;
        uint64_t v45 = 0;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v41 = 1107296256;
        uint64_t v42 = sub_1000145BC;
        uint64_t v43 = &unk_100059618;
        os_log_type_t v27 = _Block_copy(&aBlock);
        id v28 = v26;
        [v28 respondToBluetoothPairingRequest:v10 completionHandler:v27];
        _Block_release(v27);

        return;
      }
      goto LABEL_70;
    }
    uint64_t aBlock = (void **)a2;
    uint64_t v41 = a3 & 0xFFFFFFFFFFFFFFLL;
    if (a2 == 43)
    {
      if (!v11) {
        goto LABEL_69;
      }
      if (v11 == 1) {
        goto LABEL_67;
      }
      if ((BYTE1(a2) - 48) > 9u) {
        goto LABEL_41;
      }
      Swift::Int v17 = (BYTE1(a2) - 48);
      if (v11 != 2)
      {
        if ((BYTE2(a2) - 48) > 9u) {
          goto LABEL_41;
        }
        Swift::Int v17 = 10 * (BYTE1(a2) - 48) + (BYTE2(a2) - 48);
        uint64_t v21 = v11 - 3;
        if (v11 != 3)
        {
          NSString v22 = (unsigned __int8 *)&aBlock + 3;
          while (1)
          {
            unsigned int v23 = *v22 - 48;
            if (v23 > 9) {
              goto LABEL_41;
            }
            uint64_t v24 = 10 * v17;
            if ((unsigned __int128)(v17 * (__int128)10) >> 64 != (10 * v17) >> 63) {
              goto LABEL_41;
            }
            Swift::Int v17 = v24 + v23;
            if (__OFADD__(v24, v23)) {
              goto LABEL_41;
            }
            LOBYTE(v11) = 0;
            ++v22;
            if (!--v21) {
              goto LABEL_44;
            }
          }
        }
      }
    }
    else
    {
      if (a2 == 45)
      {
        if (v11)
        {
          if (v11 != 1)
          {
            if ((BYTE1(a2) - 48) > 9u) {
              goto LABEL_41;
            }
            if (v11 == 2)
            {
              LOBYTE(v11) = 0;
              Swift::Int v17 = -(uint64_t)(BYTE1(a2) - 48);
              goto LABEL_44;
            }
            if ((BYTE2(a2) - 48) > 9u) {
              goto LABEL_41;
            }
            Swift::Int v17 = -10 * (BYTE1(a2) - 48) - (BYTE2(a2) - 48);
            uint64_t v33 = v11 - 3;
            if (v11 != 3)
            {
              id v34 = (unsigned __int8 *)&aBlock + 3;
              while (1)
              {
                unsigned int v35 = *v34 - 48;
                if (v35 > 9) {
                  goto LABEL_41;
                }
                uint64_t v36 = 10 * v17;
                if ((unsigned __int128)(v17 * (__int128)10) >> 64 != (10 * v17) >> 63) {
                  goto LABEL_41;
                }
                Swift::Int v17 = v36 - v35;
                if (__OFSUB__(v36, v35)) {
                  goto LABEL_41;
                }
                LOBYTE(v11) = 0;
                ++v34;
                if (!--v33) {
                  goto LABEL_44;
                }
              }
            }
            goto LABEL_43;
          }
LABEL_67:
          Swift::Int v17 = 0;
LABEL_44:
          if (v11) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
        return;
      }
      if (!v11 || (a2 - 48) > 9u)
      {
LABEL_41:
        Swift::Int v17 = 0;
        LOBYTE(v11) = 1;
        goto LABEL_44;
      }
      Swift::Int v17 = (a2 - 48);
      if (v11 != 1)
      {
        if ((BYTE1(a2) - 48) > 9u) {
          goto LABEL_41;
        }
        Swift::Int v17 = 10 * (a2 - 48) + (BYTE1(a2) - 48);
        uint64_t v29 = v11 - 2;
        if (v11 != 2)
        {
          unint64_t v30 = (unsigned __int8 *)&aBlock + 2;
          while (1)
          {
            unsigned int v31 = *v30 - 48;
            if (v31 > 9) {
              goto LABEL_41;
            }
            uint64_t v32 = 10 * v17;
            if ((unsigned __int128)(v17 * (__int128)10) >> 64 != (10 * v17) >> 63) {
              goto LABEL_41;
            }
            Swift::Int v17 = v32 + v31;
            if (__OFADD__(v32, v31)) {
              goto LABEL_41;
            }
            LOBYTE(v11) = 0;
            ++v30;
            if (!--v29) {
              goto LABEL_44;
            }
          }
        }
      }
    }
LABEL_43:
    LOBYTE(v11) = 0;
    goto LABEL_44;
  }
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_100005F6C(v18, (uint64_t)qword_100062E00);
  oslog = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v19, "No current pairing request to respond to", v20, 2u);
    swift_slowDealloc();
  }
}

char *sub_100016EA0(void *a1)
{
  uint64_t v2 = v1;
  sub_10000BEA4(&qword_100062F10);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v295 = (char *)&v286 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::String v292 = (char *)&v286 - v6;
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v289 = (char *)&v286 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v291 = (char *)&v286 - v12;
  __chkstk_darwin(v11);
  v290 = (char *)&v286 - v13;
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = sub_100005F6C(v14, (uint64_t)qword_100062E00);
  id v16 = a1;
  uint64_t v296 = v15;
  Swift::Int v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v293 = v8;
  uint64_t v294 = v7;
  uint64_t v297 = v2;
  if (v19)
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 138412290;
    v298[0] = v16;
    id v22 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v21 = v16;

    uint64_t v2 = v297;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "updateDeviceMapWith device: %@", v20, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unsigned int v23 = (uint64_t *)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID];
  uint64_t v24 = *(void *)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8];
  if (!v24) {
LABEL_174:
  }
    __break(1u);
  uint64_t v25 = *v23;
  objc_allocWithZone((Class)type metadata accessor for ASUIDevice());
  unint64_t v26 = (unint64_t)v16;
  swift_bridgeObjectRetain();
  uint64_t v27 = (uint64_t)sub_10002DE7C(0, 0, (void *)v26, v25, v24);

  if ([(id)v26 discoveredInExtension])
  {
    uint64_t v28 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
    uint64_t v29 = *(void **)(v27 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
    if (!v29)
    {
      __break(1u);
      goto LABEL_176;
    }
    id v30 = [v29 appAccessInfoMap];
    Swift::String v287 = v23;
    if (v30
      && (unsigned int v31 = v30,
          sub_10000C108(0, (unint64_t *)&qword_100062DB0),
          uint64_t v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
          v31,
          uint64_t v33 = *(void *)(v32 + 16),
          swift_bridgeObjectRelease(),
          v33))
    {
      id v34 = *(void **)(v27 + v28);
      if (!v34)
      {
LABEL_184:
        __break(1u);
        goto LABEL_185;
      }
      id v35 = [v34 name];
      if (!v35) {
        goto LABEL_13;
      }
    }
    else
    {
      id v35 = [(id)v26 name];
      if (!v35)
      {
LABEL_13:
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        goto LABEL_27;
      }
    }
    Class v59 = v35;
    uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v37 = v60;

LABEL_27:
    unint64_t v61 = (uint64_t *)(v27 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName);
    *unint64_t v61 = v36;
    v61[1] = v37;
    swift_bridgeObjectRelease();
    sub_10002D958();
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    char v66 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
    swift_beginAccess();
    if (*(void *)v66)
    {
      if (*(void *)(*(void *)v66 + 16))
      {
        swift_bridgeObjectRetain();
        sub_10001B800(v63, v65);
        if (v67)
        {
          swift_bridgeObjectRetain();
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v295 = (char *)v26;
          id v68 = [(id)v26 identifier];
          if (!v68)
          {
LABEL_185:
            __break(1u);
            goto LABEL_186;
          }
          uint64_t v69 = v68;
          uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v72 = v71;

          uint64_t v73 = &v297[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
          swift_beginAccess();
          uint64_t v74 = *(void *)v73;
          if (!v74)
          {
LABEL_186:
            __break(1u);
            goto LABEL_187;
          }
          if (!*(void *)(v74 + 16))
          {
            swift_endAccess();
            uint64_t v289 = 0;
            goto LABEL_73;
          }
          sub_10001B800(v70, v72);
          char v76 = v75;
          swift_endAccess();
          swift_bridgeObjectRelease();
          if ((v76 & 1) == 0)
          {
            uint64_t v289 = 0;
LABEL_74:
            swift_beginAccess();
            if (!*(void *)v66)
            {
LABEL_187:
              __break(1u);
              goto LABEL_188;
            }
            swift_bridgeObjectRetain();
            v134 = sub_10001B564(v298, v63, v65);
            if (*v133)
            {
              uint64_t v135 = v133;
              id v136 = (id)v27;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((*v135 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v135 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              ((void (*)(void *, void))v134)(v298, 0);
            }
            else
            {
              ((void (*)(void *, void))v134)(v298, 0);
            }
            swift_endAccess();
            swift_bridgeObjectRelease_n();
            id v137 = (id)v27;
            uint64_t v138 = Logger.logObject.getter();
            os_log_type_t v139 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v138, v139))
            {
              NSString v140 = (uint8_t *)swift_slowAlloc();
              uint64_t v141 = swift_slowAlloc();
              uint64_t v288 = v27;
              v142 = (void *)v141;
              *(_DWORD *)NSString v140 = 138412290;
              v298[0] = v137;
              id v143 = v137;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              void *v142 = v137;

              _os_log_impl((void *)&_mh_execute_header, v138, v139, "New backing device added to an already displayed device. New device:\n %@", v140, 0xCu);
              sub_10000BEA4(&qword_100062ED8);
              swift_arrayDestroy();
              uint64_t v27 = v288;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
            }
            int v105 = 0;
            unint64_t v26 = (unint64_t)v295;
            goto LABEL_84;
          }
          uint64_t v77 = v28;
          uint64_t v288 = v27;
          uint64_t v78 = Logger.logObject.getter();
          os_log_type_t v79 = static os_log_type_t.default.getter();
          BOOL v80 = os_log_type_enabled(v78, v79);
          int v81 = v295;
          if (v80)
          {
            unint64_t v82 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v82 = 0;
            _os_log_impl((void *)&_mh_execute_header, v78, v79, "Remove stale backing device to be replaced by the new one that has the same ID.", v82, 2u);
            swift_slowDealloc();
          }

          uint64_t result = (char *)swift_beginAccess();
          if (!*(void *)v66) {
            goto LABEL_191;
          }
          swift_bridgeObjectRetain();
          os_log_type_t v83 = sub_10001B564(v298, v63, v65);
          if (!*v84)
          {
            ((void (*)(void *, void))v83)(v298, 0);
            swift_endAccess();
            uint64_t v289 = 0;
            uint64_t v27 = v288;
            uint64_t v28 = v77;
            goto LABEL_73;
          }
          char v85 = v84;
          uint64_t v86 = (void (*)(void *, void))v83;
          uint64_t v87 = v81;
          uint64_t v88 = 0;
          id v89 = sub_10001DB1C(v85, v87);
          uint64_t v289 = 0;

          unint64_t v26 = *v85;
          if (*v85 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v27 >= (uint64_t)v89) {
              goto LABEL_40;
            }
          }
          else
          {
            uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v27 >= (uint64_t)v89)
            {
LABEL_40:
              uint64_t v90 = (uint64_t)v89;
              uint64_t v28 = v77;
              sub_10001D83C(v90, v27);
              v86(v298, 0);
              swift_endAccess();
              uint64_t v27 = v288;
LABEL_73:
              swift_bridgeObjectRelease();
              goto LABEL_74;
            }
          }
          __break(1u);
          goto LABEL_171;
        }
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      sub_10000BEA4(&qword_100062D98);
      uint64_t v101 = swift_allocObject();
      *(_OWORD *)(v101 + 16) = xmmword_100049330;
      *(void *)(v101 + 32) = v27;
      v298[0] = v101;
      specialized Array._endMutation()();
      uint64_t v102 = v298[0];
      swift_beginAccess();
      if (!*(void *)v66)
      {
LABEL_183:
        __break(1u);
        goto LABEL_184;
      }
      id v103 = (id)v27;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v299 = *(void *)v66;
      *(void *)char v66 = 0x8000000000000000;
      sub_10001C408(v102, v63, v65, isUniquelyReferenced_nonNull_native);
      *(void *)char v66 = v299;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      uint64_t v289 = 0;
      int v105 = 1;
LABEL_84:
      uint64_t v144 = v297;
      uint64_t v145 = *(void **)(v27 + v28);
      if (v145)
      {
        id v146 = [v145 identifier];
        if (v146)
        {
          id v147 = v146;
          uint64_t v148 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v150 = v149;

          v151 = &v144[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
          swift_beginAccess();
          if (*(void *)v151)
          {
            int v152 = (char *)(id)v27;
            char v153 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v299 = *(void *)v151;
            *(void *)v151 = 0x8000000000000000;
            uint64_t v295 = v152;
            sub_10001C288((uint64_t)v152, v148, v150, v153);
            *(void *)v151 = v299;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_endAccess();
            os_log_type_t v154 = *(void **)(v27 + v28);
            if (v154)
            {
              id v155 = [v154 identifier];
              uint64_t v156 = v297;
              if (v155)
              {
                id v157 = v155;
                uint64_t v158 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v160 = v159;

                uint64_t v161 = &v156[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
                swift_beginAccess();
                uint64_t v162 = v294;
                if (*(void *)v161)
                {
                  id v163 = (void *)sub_10001B9B4(v158, v160);
                  swift_endAccess();
                  swift_bridgeObjectRelease();

                  if (v105)
                  {
                    uint64_t v164 = &v156[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
                    swift_beginAccess();
                    uint64_t v165 = v295;
                    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                    if (*(void *)((*(void *)v164 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v164 & 0xFFFFFFFFFFFFFF8)
                                                                                                  + 0x18) >> 1)
                      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
                    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                    specialized Array._endMutation()();
                    swift_endAccess();
                  }
                  else
                  {
                    uint64_t v166 = v295;
                    char v167 = Logger.logObject.getter();
                    os_log_type_t v168 = static os_log_type_t.default.getter();
                    if (os_log_type_enabled(v167, v168))
                    {
                      uint64_t v169 = swift_slowAlloc();
                      uint64_t v288 = v27;
                      uint64_t v170 = (uint8_t *)v169;
                      v171 = (void *)swift_slowAlloc();
                      *(_DWORD *)uint64_t v170 = 138412290;
                      v298[0] = v166;
                      unint64_t v172 = v26;
                      id v173 = v166;
                      uint64_t v162 = v294;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      void *v171 = v166;

                      unint64_t v26 = v172;
                      _os_log_impl((void *)&_mh_execute_header, v167, v168, "Already displaying device with the same visual: %@", v170, 0xCu);
                      sub_10000BEA4(&qword_100062ED8);
                      swift_arrayDestroy();
                      swift_slowDealloc();
                      uint64_t v27 = v288;
                      swift_slowDealloc();
                    }
                    else
                    {
                    }
                  }
                  uint64_t v174 = v293;
                  id v175 = [(id)v26 displayImageFileURL];
                  uint64_t v176 = v292;
                  if (v175)
                  {
                    v177 = v175;
                    uint64_t v178 = v291;
                    static URL._unconditionallyBridgeFromObjectiveC(_:)();

                    id v179 = *(void (**)(char *, char *, uint64_t))(v174 + 32);
                    v179(v176, v178, v162);
                    (*(void (**)(char *, void, uint64_t, uint64_t))(v174 + 56))(v176, 0, 1, v162);
                    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v174 + 48))(v176, 1, v162) != 1)
                    {
                      id v180 = v290;
                      v179(v290, v176, v162);
                      id v181 = [(id)v26 appAccessInfoMap];
                      if (v181
                        && (uint64_t v182 = v181,
                            sub_10000C108(0, (unint64_t *)&qword_100062DB0),
                            uint64_t v183 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
                            v182,
                            uint64_t v184 = *(void *)(v183 + 16),
                            swift_bridgeObjectRelease(),
                            v184))
                      {
                        char v185 = (void *)v26;
                        URL.path(percentEncoded:)(1);
                        id v186 = objc_allocWithZone((Class)UIImage);
                        NSString v187 = String._bridgeToObjectiveC()();
                        swift_bridgeObjectRelease();
                        id v188 = [v186 initWithContentsOfFile:v187];

                        os_log_type_t v189 = *(void **)&v295[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image];
                        *(void *)&v295[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image] = v188;
                      }
                      else
                      {
                        char v185 = (void *)v26;
                      }
                      (*(void (**)(char *, uint64_t))(v174 + 8))(v180, v162);
LABEL_106:
                      uint64_t v190 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image;
                      if (*(void *)&v295[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image]) {
                        return (char *)v27;
                      }
                      id v191 = [v185 displayImageName];
                      if (!v191) {
                        return (char *)v27;
                      }

                      uint64_t v192 = v287[1];
                      if (v192)
                      {
                        uint64_t v193 = *v287;
                        objc_allocWithZone((Class)LSApplicationRecord);
                        swift_bridgeObjectRetain();
                        uint64_t v194 = v289;
                        uint64_t result = (char *)sub_10001B724(v193, v192, 0);
                        if (!v194)
                        {
                          if (result)
                          {
                            uint64_t v297 = result;
                            id v195 = [result URL];
                            uint64_t v196 = v291;
                            static URL._unconditionallyBridgeFromObjectiveC(_:)();

                            id v197 = objc_allocWithZone((Class)NSBundle);
                            URL._bridgeToObjectiveC()(v198);
                            id v200 = v199;
                            id v201 = [v197 initWithURL:v199];

                            (*(void (**)(char *, uint64_t))(v174 + 8))(v196, v162);
                            id v202 = [v185 displayImageName];
                            uint64_t v288 = v27;
                            if (v202)
                            {
                              uint64_t v203 = v202;
                              static String._unconditionallyBridgeFromObjectiveC(_:)();
                            }
                            id v204 = (char *)v201;
                            NSString v205 = String._bridgeToObjectiveC()();
                            swift_bridgeObjectRelease();
                            id v206 = [self imageNamed:v205 inBundle:v204 compatibleWithTraitCollection:0];

                            char v207 = v206;
                            v208 = Logger.logObject.getter();
                            os_log_type_t v209 = static os_log_type_t.default.getter();
                            if (os_log_type_enabled(v208, v209))
                            {
                              Swift::String v292 = v204;
                              id v210 = (uint8_t *)swift_slowAlloc();
                              id v211 = (void *)swift_slowAlloc();
                              *(_DWORD *)id v210 = 138412290;
                              if (v207)
                              {
                                v298[0] = v207;
                                uint64_t v212 = v207;
                                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                                id v213 = v206;
                              }
                              else
                              {
                                v298[0] = 0;
                                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                                id v213 = 0;
                              }
                              *id v211 = v213;

                              _os_log_impl((void *)&_mh_execute_header, v208, v209, "device.image: %@", v210, 0xCu);
                              sub_10000BEA4(&qword_100062ED8);
                              swift_arrayDestroy();
                              swift_slowDealloc();
                              swift_slowDealloc();
                              id v204 = v292;
                            }
                            else
                            {

                              v208 = v207;
                            }

                            uint64_t v214 = *(char **)&v295[v190];
                            *(void *)&v295[v190] = v206;

                            uint64_t v27 = v288;
                            goto LABEL_120;
                          }
                          goto LABEL_190;
                        }
LABEL_189:
                        uint64_t result = (char *)swift_errorRelease();
LABEL_190:
                        __break(1u);
LABEL_191:
                        __break(1u);
                        goto LABEL_192;
                      }
LABEL_188:
                      __break(1u);
                      goto LABEL_189;
                    }
                  }
                  else
                  {
                    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v174 + 56))(v292, 1, 1, v162);
                  }
                  char v185 = (void *)v26;
                  sub_10001E478((uint64_t)v176, &qword_100062F10);
                  goto LABEL_106;
                }
                goto LABEL_182;
              }
LABEL_181:
              __break(1u);
LABEL_182:
              __break(1u);
              goto LABEL_183;
            }
LABEL_180:
            __break(1u);
            goto LABEL_181;
          }
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
LABEL_178:
        __break(1u);
        goto LABEL_179;
      }
LABEL_177:
      __break(1u);
      goto LABEL_178;
    }
LABEL_176:
    __break(1u);
    goto LABEL_177;
  }
  if (!v23[1])
  {
    id v91 = v2;
    uint64_t v92 = Logger.logObject.getter();
    os_log_type_t v93 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v92, v93)) {
      goto LABEL_56;
    }
    os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
    v99 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v94 = 138412290;
    v298[0] = v91;
    BOOL v96 = (void *)v27;
    uint64_t v100 = v91;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v99 = v91;

    uint64_t v98 = "Bad session: no bundle ID provided for %@";
    goto LABEL_54;
  }
  id v38 = [(id)v26 discoveryConfiguration];
  if (!v38
    || (id v39 = v38,
        id v40 = [v38 associationIdentifier],
        v39,
        !v40))
  {
    id v91 = (char *)(id)v26;
    uint64_t v92 = Logger.logObject.getter();
    os_log_type_t v93 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v92, v93)) {
      goto LABEL_56;
    }
    os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v95 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v94 = 138412290;
    v298[0] = v91;
    BOOL v96 = (void *)v27;
    uint64_t v97 = v91;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v95 = v91;

    uint64_t v98 = "Bad device: no association ID for ASK device %@";
LABEL_54:
    _os_log_impl((void *)&_mh_execute_header, v92, v93, v98, v94, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return 0;
  }
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v43 = v42;

  uint64_t v44 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap];
  swift_beginAccess();
  uint64_t v45 = *(void *)v44;
  if (!*(void *)(*(void *)v44 + 16)) {
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  unint64_t v46 = sub_10001B800(v41, v43);
  if ((v47 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_52:
    BOOL v96 = (void *)v27;
    swift_endAccess();
    swift_bridgeObjectRelease();
    id v91 = (char *)(id)v26;
    uint64_t v92 = Logger.logObject.getter();
    os_log_type_t v93 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v92, v93))
    {
      os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
      Swift::String v106 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v94 = 138412290;
      v298[0] = v91;
      Swift::String v107 = v91;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v106 = v91;

      uint64_t v98 = "Bad device: could not map device back to a picker display item %@";
      goto LABEL_54;
    }
LABEL_56:

    return 0;
  }
  Swift::String v292 = (char *)*(id *)(*(void *)(v45 + 56) + 8 * v46);
  swift_endAccess();
  swift_bridgeObjectRelease_n();
  uint64_t v48 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  uint64_t result = *(char **)(v27 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
  if (!result)
  {
LABEL_192:
    __break(1u);
LABEL_193:
    __break(1u);
    goto LABEL_194;
  }
  id v50 = [result appAccessInfoMap];
  v290 = (char *)v48;
  if (v50
    && (id v51 = v50,
        sub_10000C108(0, (unint64_t *)&qword_100062DB0),
        uint64_t v52 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v51,
        uint64_t v53 = *(void *)(v52 + 16),
        swift_bridgeObjectRelease(),
        v53))
  {
    uint64_t result = *(char **)(v27 + v48);
    if (!result)
    {
LABEL_201:
      __break(1u);
      goto LABEL_202;
    }
    id v54 = [result name];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v58 = v57;
    }
    else
    {
      uint64_t v56 = 0;
      uint64_t v58 = 0;
    }
  }
  else
  {
    id v108 = [v292 name];
    uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v58 = v109;
  }
  uint64_t v110 = (uint64_t *)(v27 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName);
  *uint64_t v110 = v56;
  v110[1] = v58;
  swift_bridgeObjectRelease();
  sub_10002D958();
  uint64_t v112 = v111;
  uint64_t v114 = v113;
  id v115 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_backingDeviceMap];
  uint64_t result = (char *)swift_beginAccess();
  if (!*(void *)v115) {
    goto LABEL_193;
  }
  if (!*(void *)(*(void *)v115 + 16)) {
    goto LABEL_124;
  }
  swift_bridgeObjectRetain();
  sub_10001B800(v112, v114);
  if ((v116 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_124:
    swift_endAccess();
    sub_10000BEA4(&qword_100062D98);
    uint64_t v215 = swift_allocObject();
    *(_OWORD *)(v215 + 16) = xmmword_100049330;
    *(void *)(v215 + 32) = v27;
    v298[0] = v215;
    specialized Array._endMutation()();
    uint64_t v216 = v298[0];
    uint64_t result = (char *)swift_beginAccess();
    if (!*(void *)v115)
    {
LABEL_200:
      __break(1u);
      goto LABEL_201;
    }
    id v217 = (id)v27;
    char v218 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v299 = *(void *)v115;
    *(void *)id v115 = 0x8000000000000000;
    sub_10001C408(v216, v112, v114, v218);
    *(void *)id v115 = v299;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    int v219 = 1;
LABEL_126:
    unint64_t v220 = v290;
    uint64_t result = *(char **)&v290[v27];
    if (!result)
    {
LABEL_194:
      __break(1u);
      goto LABEL_195;
    }
    uint64_t result = (char *)[result identifier];
    if (!result)
    {
LABEL_195:
      __break(1u);
      goto LABEL_196;
    }
    v221 = result;
    uint64_t v222 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v224 = v223;

    id v225 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
    uint64_t result = (char *)swift_beginAccess();
    if (!*(void *)v225)
    {
LABEL_196:
      __break(1u);
      goto LABEL_197;
    }
    id v226 = (char *)(id)v27;
    char v227 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v299 = *(void *)v225;
    *(void *)id v225 = 0x8000000000000000;
    uint64_t v297 = v226;
    sub_10001C288((uint64_t)v226, v222, v224, v227);
    *(void *)id v225 = v299;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t result = *(char **)&v220[v27];
    if (!result)
    {
LABEL_197:
      __break(1u);
      goto LABEL_198;
    }
    uint64_t result = (char *)[result identifier];
    uint64_t v77 = v293;
    if (!result)
    {
LABEL_198:
      __break(1u);
      goto LABEL_199;
    }
    uint64_t v228 = result;
    uint64_t v229 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v231 = v230;

    id v232 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_lostDeviceMap];
    uint64_t result = (char *)swift_beginAccess();
    uint64_t v88 = v297;
    if (!*(void *)v232)
    {
LABEL_199:
      __break(1u);
      goto LABEL_200;
    }
    v233 = (void *)sub_10001B9B4(v229, v231);
    swift_endAccess();
    swift_bridgeObjectRelease();

    if (!v219)
    {
      id v236 = v88;
      v237 = Logger.logObject.getter();
      os_log_type_t v238 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v237, v238))
      {
        uint64_t v288 = v27;
        NSString v239 = (uint8_t *)swift_slowAlloc();
        id v240 = (void *)swift_slowAlloc();
        *(_DWORD *)NSString v239 = 138412290;
        v298[0] = v236;
        uint64_t v241 = v236;
        uint64_t v88 = v297;
        uint64_t v27 = v288;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v240 = v236;

        _os_log_impl((void *)&_mh_execute_header, v237, v238, "Already displaying device with the same visual: %@", v239, 0xCu);
        sub_10000BEA4(&qword_100062ED8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v77 = v293;
LABEL_139:
      uint64_t v242 = v294;
      id v204 = v292;
      os_log_type_t v243 = &selRef_viewDidLoad;
      unsigned __int8 v244 = [v292 setupOptions];
      v88[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_allowsRename] = v244 & 1;
      id v245 = [(id)v26 appAccessInfoMap];
      if (v245)
      {
        id v246 = v245;
        sub_10000C108(0, (unint64_t *)&qword_100062DB0);
        uint64_t v247 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v248 = *(void *)(v247 + 16);
        swift_bridgeObjectRelease();
        if (v248 <= 1)
        {
          id v249 = v88;
          id v250 = Logger.logObject.getter();
          os_log_type_t v251 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v250, v251))
          {
            uint64_t v288 = v27;
            v252 = (uint8_t *)swift_slowAlloc();
            id v253 = (void *)swift_slowAlloc();
            *(_DWORD *)v252 = 138412290;
            v298[0] = v249;
            uint64_t v254 = v249;
            uint64_t v88 = v297;
            uint64_t v27 = v288;
            uint64_t v242 = v294;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *id v253 = v249;

            id v204 = v292;
            _os_log_impl((void *)&_mh_execute_header, v250, v251, "Appending bridging setup for: %@", v252, 0xCu);
            sub_10000BEA4(&qword_100062ED8);
            swift_arrayDestroy();
            swift_slowDealloc();
            os_log_type_t v243 = &selRef_viewDidLoad;
            swift_slowDealloc();
          }
          else
          {

            id v250 = v249;
          }

          id v255 = [v204 descriptor];
          unsigned __int8 v256 = [v255 supportedOptions];

          *((unsigned char *)&v249->isa + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_needsBluetoothSetup) = (v256 & 4) != 0;
          uint64_t v77 = v293;
        }
      }
      unsigned __int8 v257 = [v204 v243[91]];
      v88[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_finishSetupInApp] = (v257 & 4) != 0;
      id v258 = [(id)v26 displayImageFileURL];
      if (v258)
      {
        unint64_t v259 = v258;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v260 = *(void (**)(void))(v77 + 32);
        id v261 = v295;
        v260();
        (*(void (**)(char *, void, uint64_t, uint64_t))(v77 + 56))(v261, 0, 1, v242);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v261, 1, v242) != 1)
        {
          v262 = v289;
          ((void (*)(char *, char *, uint64_t))v260)(v289, v261, v242);
          id v263 = [(id)v26 appAccessInfoMap];
          if (v263
            && (id v264 = v263,
                sub_10000C108(0, (unint64_t *)&qword_100062DB0),
                uint64_t v265 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
                v264,
                uint64_t v266 = *(void *)(v265 + 16),
                swift_bridgeObjectRelease(),
                v266))
          {
            URL.path(percentEncoded:)(1);
            id v267 = objc_allocWithZone((Class)UIImage);
            NSString v268 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            id v269 = [v267 initWithContentsOfFile:v268];

            uint64_t v270 = v297;
            uint64_t v271 = *(void **)&v297[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image];
            *(void *)&v297[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image] = v269;

            uint64_t v272 = v262;
            uint64_t v88 = v270;
            (*(void (**)(char *, uint64_t))(v77 + 8))(v272, v242);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v77 + 8))(v262, v242);
            uint64_t v88 = v297;
          }
          goto LABEL_153;
        }
      }
      else
      {
        id v261 = v295;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56))(v295, 1, 1, v242);
      }
      sub_10001E478((uint64_t)v261, &qword_100062F10);
LABEL_153:
      uint64_t v273 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image;
      if (*(void *)&v88[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image]) {
        goto LABEL_121;
      }
      id v274 = [v204 productImage];
      uint64_t v214 = *(char **)&v88[v273];
      *(void *)&v88[v273] = v274;
LABEL_120:

      id v204 = v214;
LABEL_121:

      return (char *)v27;
    }
    id v234 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
    swift_beginAccess();
    id v235 = v88;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*(void *)v234 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*(void *)v234 & 0xFFFFFFFFFFFFFF8)
                                                                                 + 0x18) >> 1)
    {
LABEL_134:
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      swift_endAccess();
      goto LABEL_139;
    }
LABEL_171:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_134;
  }
  uint64_t v288 = v27;
  swift_bridgeObjectRetain();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = (char *)[(id)v26 identifier];
  if (!result)
  {
LABEL_202:
    __break(1u);
    goto LABEL_203;
  }
  uint64_t v117 = result;
  uint64_t v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v120 = v119;

  uint64_t v121 = &v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap];
  uint64_t result = (char *)swift_beginAccess();
  if (!*(void *)v121)
  {
LABEL_203:
    __break(1u);
    goto LABEL_204;
  }
  if (!*(void *)(*(void *)v121 + 16))
  {
    swift_endAccess();
    uint64_t v27 = v288;
    goto LABEL_158;
  }
  sub_10001B800(v118, v120);
  char v123 = v122;
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v27 = v288;
  if ((v123 & 1) == 0) {
    goto LABEL_159;
  }
  v124 = Logger.logObject.getter();
  os_log_type_t v125 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v124, v125))
  {
    uint64_t v126 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v126 = 0;
    _os_log_impl((void *)&_mh_execute_header, v124, v125, "Remove stale backing device to be replaced by the new one that has the same ID.", v126, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (char *)swift_beginAccess();
  if (!*(void *)v115) {
    goto LABEL_205;
  }
  swift_bridgeObjectRetain();
  Swift::String v127 = sub_10001B564(v298, v112, v114);
  if (!*v128)
  {
    ((void (*)(void *, void))v127)(v298, 0);
    swift_endAccess();
    goto LABEL_158;
  }
  uint64_t v129 = v128;
  Swift::String v287 = (uint64_t *)v127;
  id v130 = (id)v26;
  id v131 = sub_10001DB1C(v129, v130);

  if (*v129 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v132 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v132 >= (uint64_t)v131) {
      goto LABEL_71;
    }
    goto LABEL_173;
  }
  uint64_t v132 = *(void *)((*v129 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v132 < (uint64_t)v131)
  {
LABEL_173:
    __break(1u);
    goto LABEL_174;
  }
LABEL_71:
  sub_10001D83C((uint64_t)v131, v132);
  ((void (*)(void *, void))v287)(v298, 0);
  swift_endAccess();
  uint64_t v27 = v288;
LABEL_158:
  swift_bridgeObjectRelease();
LABEL_159:
  uint64_t result = (char *)swift_beginAccess();
  if (*(void *)v115)
  {
    swift_bridgeObjectRetain();
    uint64_t v276 = sub_10001B564(v298, v112, v114);
    if (*v275)
    {
      uint64_t v277 = v275;
      id v278 = (id)v27;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((*v277 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v277 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      ((void (*)(void *, void))v276)(v298, 0);
    }
    else
    {
      ((void (*)(void *, void))v276)(v298, 0);
    }
    swift_endAccess();
    swift_bridgeObjectRelease_n();
    id v279 = (id)v27;
    uint64_t v280 = Logger.logObject.getter();
    os_log_type_t v281 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v280, v281))
    {
      uint64_t v282 = (uint8_t *)swift_slowAlloc();
      v283 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v282 = 138412290;
      v298[0] = v279;
      unint64_t v284 = v26;
      id v285 = v279;
      uint64_t v27 = v288;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v283 = v279;

      unint64_t v26 = v284;
      uint64_t v2 = v297;
      _os_log_impl((void *)&_mh_execute_header, v280, v281, "New backing device added to an already displayed device. New device:\n %@", v282, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    int v219 = 0;
    goto LABEL_126;
  }
LABEL_204:
  __break(1u);
LABEL_205:
  __break(1u);
  return result;
}

uint64_t sub_10001928C()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v12 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v3 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C108(0, (unint64_t *)&qword_100063180);
  uint64_t v6 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10001E470;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015768;
  aBlock[3] = &unk_1000597F8;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v13 = &_swiftEmptyArrayStorage;
  sub_10001D79C();
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v8);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v11);
  swift_release();
  return swift_release();
}

uint64_t sub_100019558(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v14[0] - 8);
  __chkstk_darwin(v14[0]);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 invalidate];
  sub_10000C108(0, (unint64_t *)&qword_100063180);
  uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10001E580;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015768;
  aBlock[3] = &unk_100059A00;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v14[1] = &_swiftEmptyArrayStorage;
  sub_10001D79C();
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, void))(v8 + 8))(v10, v14[0]);
  return swift_release();
}

void sub_100019804()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
    uint64_t v3 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery);
    if (v3)
    {
      [v3 invalidateWithReason:5];
      uint64_t v4 = *(void **)&v1[v2];
    }
    else
    {
      uint64_t v4 = 0;
    }
    *(void *)&v1[v2] = 0;

    uint64_t v5 = swift_unknownObjectWeakLoadStrong();
    if (v5)
    {
      uint64_t v6 = v5;
      if (qword_100062970 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for Logger();
      sub_100005F6C(v7, (uint64_t)qword_100063070);
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Showing Discovery Error View", v10, 2u);
        swift_slowDealloc();
      }

      uint64_t v11 = *(void **)(v6 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = sub_1000310F0();
        [v12 pushViewController:v13 animated:1];

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
}

uint64_t sub_1000199CC()
{
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClass();
  if (!v1) {
    return 0;
  }
  id v2 = v0;
  id v3 = [v1 device];
  id v4 = [v3 identifier];

  if (v4)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    [v1 device];
  }
  else
  {
    if (qword_100062950 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100005F6C(v6, (uint64_t)qword_100062E00);
    id v7 = v2;
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412290;
      id v13 = [v1 device];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v11 = v13;

      _os_log_impl((void *)&_mh_execute_header, v8, v9, "DADevice does not have an identifier, ignoring. %@", v10, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  return v5;
}

void sub_100019C2C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1000241E0(a2);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_100019CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    id v7 = (uint64_t *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap);
    swift_beginAccess();
    uint64_t v8 = *v7;
    if (!v8)
    {
      __break(1u);
      return;
    }
    if (*(void *)(v8 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v9 = sub_10001B800(a2, a3);
      if (v10)
      {
        uint64_t v11 = *(void **)(*(void *)(v8 + 56) + 8 * v9);
        swift_endAccess();
        id v12 = v11;
        swift_bridgeObjectRelease();
        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10002486C();

          swift_unknownObjectRelease();
        }
        else
        {
        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
  }
}

void sub_100019DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v6 = (void *)Strong;
  id v7 = (uint64_t *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_deviceMap);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (!v8)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (!*(void *)(v8 + 16))
  {
LABEL_11:
    swift_endAccess();

    return;
  }
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_10001B800(a2, a3);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v11 = *(void **)(*(void *)(v8 + 56) + 8 * v9);
  swift_endAccess();
  id v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_unknownObjectWeakLoadStrong();
  if (!v13)
  {

    return;
  }
  if (!*(void *)(v13 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter)) {
    goto LABEL_17;
  }
  uint64_t v14 = swift_unknownObjectWeakLoadStrong();
  if (!v14)
  {
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v15 = v14 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  uint64_t v16 = swift_unknownObjectWeakLoadStrong();
  uint64_t v17 = *(void *)(v15 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (v16)
  {
    uint64_t ObjectType = swift_getObjectType();
    char v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(ObjectType, v17);
    sub_10003F198(v19, (uint64_t)v20);
    (*(void (**)(void *, uint64_t, uint64_t))(v17 + 72))(v20, ObjectType, v17);
    sub_10001E588(v20);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
}

uint64_t sub_100019FE4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for DispatchQoS();
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  id v30 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100005F6C(v8, (uint64_t)qword_100062E00);
  id v9 = a1;
  char v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v28 = v2;
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)id v12 = 138412290;
    aBlock[0] = v9;
    id v14 = v9;
    uint64_t v29 = v5;
    uint64_t v15 = v4;
    id v16 = v14;
    uint64_t v2 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v13 = v9;

    uint64_t v4 = v15;
    uint64_t v5 = v29;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "handleBluetoothPairingRequest: %@", v12, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest);
  *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest) = v9;

  sub_10000C108(0, (unint64_t *)&qword_100063180);
  id v18 = v9;
  char v19 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v18;
  aBlock[4] = sub_10001E6A4;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015768;
  aBlock[3] = &unk_100059A50;
  id v22 = _Block_copy(aBlock);
  id v23 = v18;
  swift_retain();
  uint64_t v24 = v30;
  static DispatchQoS.unspecified.getter();
  id v34 = &_swiftEmptyArrayStorage;
  sub_10001D79C();
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  uint64_t v25 = v32;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v25, v4);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v33);
  swift_release();
  return swift_release();
}

void sub_10001A46C(void **a1, uint64_t a2, const char *a3)
{
  id v54 = a3;
  uint64_t v6 = sub_10000BEA4(&qword_100062F10);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v57 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v55 = (char *)&v51 - v13;
  id v14 = *a1;

  uint64_t v15 = *(void *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID + 8);
  if (!v15) {
    return;
  }
  uint64_t v53 = v9;
  uint64_t v16 = *(void *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_appBundleID);
  swift_bridgeObjectRetain();
  id v17 = [v14 appAccessInfoMap];
  if (!v17)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  id v18 = v17;
  sub_10000C108(0, (unint64_t *)&qword_100062DB0);
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v19 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  unint64_t v20 = sub_10001B800(v16, v15);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  id v22 = *(id *)(*(void *)(v19 + 56) + 8 * v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v23 = [v22 associationIdentifier];

  if (v23)
  {
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    uint64_t v27 = (uint64_t *)(a2 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_displayItemMap);
    swift_beginAccess();
    uint64_t v28 = *v27;
    if (*(void *)(v28 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v29 = sub_10001B800(v24, v26);
      if (v30)
      {
        uint64_t v31 = *(void **)(*(void *)(v28 + 56) + 8 * v29);
        swift_endAccess();
        id v32 = v31;
        swift_bridgeObjectRelease_n();
        id v33 = [v14 displayImageFileURL];
        if (v33)
        {
          id v34 = v33;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v35 = v57;
          uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
          uint64_t v37 = v53;
          v36(v8, v12, v53);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v8, 0, 1, v37);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v8, 1, v37) != 1)
          {
            id v38 = v55;
            v36(v55, v8, v37);
            id v39 = (UIImage *)[v32 productImage];
            id v40 = UIImagePNGRepresentation(v39);

            if (v40)
            {
              uint64_t v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
              unint64_t v43 = v42;

              Data.write(to:options:)();
              if (v3)
              {
                uint64_t v52 = v41;
                if (qword_100062950 != -1) {
                  swift_once();
                }
                uint64_t v44 = type metadata accessor for Logger();
                sub_100005F6C(v44, (uint64_t)qword_100062E00);
                swift_errorRetain();
                swift_errorRetain();
                uint64_t v45 = Logger.logObject.getter();
                os_log_type_t v46 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v45, v46))
                {
                  char v47 = (uint8_t *)swift_slowAlloc();
                  uint64_t v48 = swift_slowAlloc();
                  unint64_t v51 = v43;
                  uint64_t v49 = (void *)v48;
                  *(_DWORD *)char v47 = 138412290;
                  swift_errorRetain();
                  uint64_t v50 = _swift_stdlib_bridgeErrorToNSError();
                  uint64_t v56 = v50;
                  uint64_t v37 = v53;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  void *v49 = v50;
                  id v38 = v55;
                  swift_errorRelease();
                  swift_errorRelease();
                  _os_log_impl((void *)&_mh_execute_header, v45, v46, v54, v47, 0xCu);
                  sub_10000BEA4(&qword_100062ED8);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  uint64_t v35 = v57;
                  swift_slowDealloc();

                  sub_10001E394(v52, v51);
                }
                else
                {

                  sub_10001E394(v52, v43);
                  swift_errorRelease();
                  swift_errorRelease();
                }
                swift_errorRelease();
                (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v37);
              }
              else
              {
                (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v37);

                sub_10001E394(v41, v43);
              }
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v37);
            }
            return;
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v8, 1, 1, v53);
        }

        sub_10001E478((uint64_t)v8, &qword_100062F10);
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
}

void sub_10001AAE4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
      if (v3) {
        [v3 dismissViewControllerAnimated:1 completion:0];
      }

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10001AB84()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_100022C68();

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10001AC00()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      uint64_t v3 = v2;
      if (qword_100062970 != -1) {
        swift_once();
      }
      uint64_t v4 = type metadata accessor for Logger();
      sub_100005F6C(v4, (uint64_t)qword_100063070);
      uint64_t v5 = Logger.logObject.getter();
      os_log_type_t v6 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Showing Done View", v7, 2u);
        swift_slowDealloc();
      }

      uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = sub_100030D84();
        [v9 pushViewController:v10 animated:1];

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {
    }
  }
}

void sub_10001AD94(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_10000CD24();
    if (!v5)
    {
LABEL_34:

      return;
    }
    os_log_type_t v6 = v5;
    if (qword_1000629B0 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
    if (v7) {
      [v7 pickerStartedPairing];
    }
    id v8 = [a2 pairingInfo];
    id v9 = [v8 pairingType];

    switch((unint64_t)v9)
    {
      case 0x14uLL:
        sub_10001B3CC();
        if (v10)
        {
          swift_bridgeObjectRelease();
          uint64_t v11 = swift_unknownObjectWeakLoadStrong();
          if (v11)
          {
            uint64_t v12 = v11;
            if (qword_100062970 != -1) {
              swift_once();
            }
            uint64_t v13 = type metadata accessor for Logger();
            sub_100005F6C(v13, (uint64_t)qword_100063070);
            id v14 = Logger.logObject.getter();
            os_log_type_t v15 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v14, v15))
            {
              uint64_t v16 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v16 = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, v15, "Showing Passkey Display View", v16, 2u);
              swift_slowDealloc();
            }

            id v17 = *(void **)(v12 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = sub_100031338();
LABEL_31:
              uint64_t v35 = v19;
              [v18 pushViewController:v19 animated:1];

              swift_unknownObjectRelease();
LABEL_33:
              uint64_t v4 = v6;
              goto LABEL_34;
            }
            goto LABEL_36;
          }
          goto LABEL_32;
        }
        _StringGuts.grow(_:)(55);
        v36._object = (void *)0x800000010004A7C0;
        v36._countAndFlagsBits = 0xD000000000000035;
        String.append(_:)(v36);
        id v37 = [a2 description];
        uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        id v40 = v39;

        v41._countAndFlagsBits = v38;
        v41._object = v40;
        String.append(_:)(v41);
        swift_bridgeObjectRelease();
        break;
      case 0x1EuLL:
        uint64_t v20 = swift_unknownObjectWeakLoadStrong();
        if (!v20) {
          goto LABEL_32;
        }
        uint64_t v21 = v20;
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v22 = type metadata accessor for Logger();
        sub_100005F6C(v22, (uint64_t)qword_100063070);
        id v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Showing Passkey Entry View", v25, 2u);
          swift_slowDealloc();
        }

        uint64_t v26 = *(void **)(v21 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
        if (!v26) {
          goto LABEL_36;
        }
        id v18 = v26;
        uint64_t v19 = sub_10003145C();
        goto LABEL_31;
      case 0x28uLL:
        sub_10001B3CC();
        if (v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v28 = swift_unknownObjectWeakLoadStrong();
          if (v28)
          {
            uint64_t v29 = v28;
            if (qword_100062970 != -1) {
              swift_once();
            }
            uint64_t v30 = type metadata accessor for Logger();
            sub_100005F6C(v30, (uint64_t)qword_100063070);
            uint64_t v31 = Logger.logObject.getter();
            os_log_type_t v32 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v31, v32))
            {
              id v33 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v33 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, v32, "Showing Numeric Comparison View", v33, 2u);
              swift_slowDealloc();
            }

            id v34 = *(void **)(v29 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
            if (v34)
            {
              id v18 = v34;
              uint64_t v19 = sub_100031214();
              goto LABEL_31;
            }
LABEL_36:

            swift_unknownObjectRelease();
            goto LABEL_33;
          }
LABEL_32:

          goto LABEL_33;
        }
        _StringGuts.grow(_:)(58);
        v42._countAndFlagsBits = 0xD000000000000038;
        v42._object = (void *)0x800000010004A800;
        String.append(_:)(v42);
        id v43 = [a2 description];
        uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        os_log_type_t v46 = v45;

        v47._countAndFlagsBits = v44;
        v47._object = v46;
        String.append(_:)(v47);
        swift_bridgeObjectRelease();
        break;
      default:
        goto LABEL_32;
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x10001B350);
  }
}

void sub_10001B3CC()
{
  id v1 = [v0 pairingInfo];
  id v2 = [v1 passkey];

  if (v2)
  {
    sub_10000BEA4(&qword_100062F00);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_100049280;
    id v4 = [v0 pairingInfo];
    id v5 = [v4 passkey];

    if (v5)
    {
      id v6 = [v5 unsignedIntegerValue];

      *(void *)(v3 + 56) = &type metadata for UInt;
      *(void *)(v3 + 64) = &protocol witness table for UInt;
      *(void *)(v3 + 32) = v6;
      String.init(format:_:)();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10001B4E8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_100024948();

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void (*sub_10001B564(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  id v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_10001D12C(v6, a2, a3);
  return sub_10001B5E4;
}

void sub_10001B5E4(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();

  free(v1);
}

id sub_10001B638()
{
  sub_10000C108(0, &qword_100062F08);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithConfigurations:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

id sub_10001B724(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_10001B800(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001B8D0(a1, a2, v4);
}

uint64_t sub_10001B878()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B8B0(uint64_t a1)
{
  return sub_1000157AC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001B8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B8C8()
{
  return swift_release();
}

unint64_t sub_10001B8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_10001B9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10001B800(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10001C578((uint64_t *)&unk_100063B10);
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10001C0B0(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001BA8C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_10000BEA4(a3);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  Swift::String v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    id v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    id v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  id v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_10001BD98(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000BEA4(&qword_100062F18);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_10001C0B0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_10001C288(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001B800(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10001C578((uint64_t *)&unk_100063B10);
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10001BA8C(v15, a4 & 1, (uint64_t *)&unk_100063B10);
  unint64_t v20 = sub_10001B800(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_10001C408(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001B800(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10001C724();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10001BD98(v15, a4 & 1);
  unint64_t v21 = sub_10001B800(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

id sub_10001C578(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000BEA4(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    char v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001C724()
{
  uint64_t v1 = v0;
  sub_10000BEA4(&qword_100062F18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unsigned __int8 *sub_10001C8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_10001CC40();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_10001C9C4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10001C9C4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10001CC40()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_10001CCC0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10001CCC0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10001CE18(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100023FAC(v9, 0),
          unint64_t v12 = sub_10001CF18((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10001CE18(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_100024014(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100024014(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10001CF18(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    id result = v12;
    if (v17 == v15) {
      id result = sub_100024014(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      id result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        id result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          id result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    id result = sub_100024014(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void (*sub_10001D12C(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_10001D3E4(v6);
  v6[10] = sub_10001D24C(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_10001D1D8;
}

void sub_10001D1D8(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  unint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);

  free(v1);
}

void (*sub_10001D24C(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  unint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_10001B800(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *unint64_t v10 = v19;
        return sub_10001D394;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_10001C724();
      goto LABEL_7;
    }
    sub_10001BD98(v16, a4 & 1);
    unint64_t v20 = sub_10001B800(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  id result = (void (*)(uint64_t **))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_10001D394(uint64_t **a1)
{
  unint64_t v1 = *a1;
  sub_10001D420(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_10001D3E4(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *unint64_t v1 = 0x8000000000000000;
  return sub_10001D414;
}

uint64_t sub_10001D414(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_10001D420(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    uint64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      unint64_t v10 = (void *)(v9[6] + 16 * a4);
      *unint64_t v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_10001C0B0(a4, *a3);
  }

  return (uint64_t *)swift_bridgeObjectRetain();
}

uint64_t sub_10001D4F8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

void *sub_10001D574(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = [v10 identifier:v22];
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10001D71C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001D754()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001D794()
{
  sub_100015638(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10001D79C()
{
  unint64_t result = qword_100063CD0;
  if (!qword_100063CD0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063CD0);
  }
  return result;
}

uint64_t sub_10001D7F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001D83C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v18 < v2) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v8 = v19 + v5;
    if (!__OFADD__(v19, v5)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v3 >> 62) {
    goto LABEL_32;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      unint64_t *v3 = v9;
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  type metadata accessor for ASUIDevice();
  swift_arrayDestroy();
  if (v5)
  {
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v13 = v20 - v2;
      if (!__OFSUB__(v20, v2))
      {
LABEL_17:
        if (v13 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v14 = (const void *)(v11 + 32 + 8 * v2);
        if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v14 + 8 * v13) {
          memmove((void *)(v11 + 32 + 8 * v4), v14, 8 * v13);
        }
        if (!(v9 >> 62))
        {
          uint64_t v15 = *(void *)(v11 + 16);
          uint64_t v16 = v15 + v5;
          if (!__OFADD__(v15, v5))
          {
LABEL_23:
            *(void *)(v11 + 16) = v16;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v16 = v21 + v5;
        if (!__OFADD__(v21, v5)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(v11 + 16);
      uint64_t v13 = v12 - v2;
      if (!__OFSUB__(v12, v2)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:

  return specialized Array._endMutation()();
}

id sub_10001DB1C(unint64_t *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (*a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    if (!(*a1 >> 62)) {
      return *(id *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRetain();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    return (id)v22;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_20;
  }
LABEL_3:
  unint64_t v4 = 0;
  uint64_t v5 = &selRef_viewDidLoad;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      uint64_t v6 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      uint64_t v6 = (char *)*(id *)(v2 + 8 * v4 + 32);
    }
    uint64_t v7 = v6;
    id result = *(id *)&v6[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
    if (!result) {
      goto LABEL_90;
    }
    id result = [result v5[76]];
    if (!result)
    {
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
      return result;
    }
    unint64_t v9 = result;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    id v13 = [a2 v5[76]];
    if (!v13)
    {

      swift_bridgeObjectRelease();
      unint64_t v20 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    if (v10 == v15 && v12 == v17) {
      break;
    }
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_23;
    }
    unint64_t v20 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
LABEL_19:
    ++v4;
    uint64_t v5 = &selRef_viewDidLoad;
    if (v20 == v3) {
      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
LABEL_23:
  id result = (id)swift_bridgeObjectRelease();
  unint64_t v21 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else if (!(*a1 >> 62))
  {
    if (v21 == *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      return (id)v4;
    }
LABEL_33:
    unint64_t v24 = v4 + 5;
    while (2)
    {
      unint64_t v25 = v24 - 4;
      unint64_t v26 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v28 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v27 = &selRef_viewDidLoad;
      }
      else
      {
        unint64_t v27 = &selRef_viewDidLoad;
        if ((v25 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
          goto LABEL_91;
        }
        if (v25 >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_81;
        }
        uint64_t v28 = (char *)*(id *)(v26 + 8 * v24);
      }
      id result = *(id *)&v28[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
      if (!result) {
        goto LABEL_92;
      }
      id result = [result v27[76]];
      if (!result) {
        goto LABEL_93;
      }
      uint64_t v29 = result;
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v32 = v31;

      id v33 = [a2 v27[76]];
      if (v33)
      {
        int64_t v34 = v33;
        uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v37 = v36;

        if (v30 == v35 && v32 == v37)
        {

          id result = (id)swift_bridgeObjectRelease_n();
          unint64_t v49 = v24 - 3;
          if (__OFADD__(v25, 1)) {
            goto LABEL_82;
          }
        }
        else
        {
          char v39 = _stringCompareWithSmolCheck(_:_:expecting:)();

          swift_bridgeObjectRelease();
          id result = (id)swift_bridgeObjectRelease();
          if ((v39 & 1) == 0)
          {
            if (v25 == v4) {
              goto LABEL_67;
            }
LABEL_49:
            unint64_t v40 = *a1;
            if ((*a1 & 0xC000000000000001) != 0)
            {
              id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
              id v41 = result;
              unint64_t v40 = *a1;
              if ((*a1 & 0xC000000000000001) == 0) {
                goto LABEL_53;
              }
            }
            else
            {
              if ((v4 & 0x8000000000000000) != 0) {
                goto LABEL_84;
              }
              if (v4 >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_85;
              }
              id result = *(id *)(v40 + 8 * v4 + 32);
              id v41 = result;
              if ((v40 & 0xC000000000000001) == 0)
              {
LABEL_53:
                if ((v25 & 0x8000000000000000) != 0) {
                  goto LABEL_86;
                }
                if (v25 >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_87;
                }
                id v42 = *(id *)(v40 + 8 * v24);
                goto LABEL_56;
              }
            }
            id v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            unint64_t v40 = *a1;
LABEL_56:
            int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *a1 = v40;
            if (!isUniquelyReferenced_nonNull_bridgeObject
              || (v40 & 0x8000000000000000) != 0
              || (v40 & 0x4000000000000000) != 0)
            {
              unint64_t v40 = sub_10001D4F8(v40);
              *a1 = v40;
            }
            uint64_t v44 = *(void **)((v40 & 0xFFFFFFFFFFFFFF8) + 8 * v4 + 0x20);
            *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 8 * v4 + 0x20) = v42;

            specialized Array._endMutation()();
            unint64_t v45 = *a1;
            id result = (id)swift_isUniquelyReferenced_nonNull_bridgeObject();
            *a1 = v45;
            if (!result || (v45 & 0x8000000000000000) != 0 || (v45 & 0x4000000000000000) != 0)
            {
              id result = (id)sub_10001D4F8(v45);
              unint64_t v45 = (unint64_t)result;
              *a1 = (unint64_t)result;
            }
            if ((v25 & 0x8000000000000000) != 0) {
              goto LABEL_88;
            }
            uint64_t v46 = v45 & 0xFFFFFFFFFFFFFF8;
            if (v25 >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_89;
            }
            Swift::String v47 = *(void **)(v46 + 8 * v24);
            *(void *)(v46 + 8 * v24) = v41;

            id result = (id)specialized Array._endMutation()();
            goto LABEL_67;
          }
LABEL_68:
          unint64_t v49 = v24 - 3;
          if (__OFADD__(v25, 1)) {
            goto LABEL_82;
          }
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v50 = _CocoaArrayWrapper.endIndex.getter();
          id result = (id)swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v50 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v24;
        if (v49 == v50) {
          return (id)v4;
        }
        continue;
      }
      break;
    }

    id result = (id)swift_bridgeObjectRelease();
    if (v25 != v4) {
      goto LABEL_49;
    }
LABEL_67:
    if (__OFADD__(v4++, 1)) {
      goto LABEL_83;
    }
    goto LABEL_68;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
  id result = (id)swift_bridgeObjectRelease();
  if (v21 != v23) {
    goto LABEL_33;
  }
  return (id)v4;
}

void sub_10001E0B0(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      uint64_t v10 = v7;
      sub_10001A46C(&v10, a2, "Error writing image to file for migration: %@");
      if (v2)
      {
        swift_bridgeObjectRelease();

        return;
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
}

void sub_10001E1C8(void *a1)
{
  if (qword_100062950 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100062E00);
  id v8 = a1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "session event: %@", v5, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10001E394(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

void sub_10001E3EC(uint64_t a1)
{
  sub_100012128(a1, v1, (void (*)(uint64_t))sub_100012198);
}

void sub_10001E41C()
{
}

void sub_10001E438()
{
}

void sub_10001E454()
{
}

void sub_10001E470()
{
}

uint64_t sub_10001E478(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000BEA4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10001E4D4(uint64_t a1)
{
  sub_100012128(a1, v1, (void (*)(uint64_t))sub_10000EAF8);
}

void sub_10001E508()
{
  sub_100019DD0(v0[2], v0[3], v0[4]);
}

uint64_t sub_10001E518()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001E560()
{
  sub_100019CB8(v0[2], v0[3], v0[4]);
}

void sub_10001E570()
{
  sub_100019C2C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001E578(void *a1)
{
  return sub_100019558(a1, v1);
}

void sub_10001E580()
{
}

void *sub_10001E588(void *a1)
{
  uint64_t v2 = (void *)a1[12];
  uint64_t v3 = (void *)a1[13];
  uint64_t v5 = (void *)a1[17];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001E664()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001E6A4()
{
  sub_10001AD94(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10001E6AC(uint64_t *a1)
{
}

uint64_t sub_10001E6B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D7F4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10001E6F8(void *a1)
{
}

void sub_10001E7D0(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_capabilities] = *(void *)(a1 + 176);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v41 = sub_10001F30C;
  uint64_t v42 = v5;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256;
  char v39 = sub_10002F814;
  unint64_t v40 = &unk_100059B28;
  id v7 = _Block_copy(&aBlock);
  id v8 = self;
  id v36 = [v8 actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();

  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v41 = sub_10001F32C;
  uint64_t v42 = v9;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256;
  char v39 = sub_10002F814;
  unint64_t v40 = &unk_100059B50;
  uint64_t v11 = _Block_copy(&aBlock);
  id v12 = [v8 actionWithTitle:v10 style:1 handler:v11];

  _Block_release(v11);
  swift_release();
  swift_release();

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v14 = [self _systemImageNamed:v13];

  id v15 = [objc_allocWithZone((Class)UIImageView) initWithImage:v14];
  id v16 = [self systemBlueColor];
  [v15 setTintColor:v16];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [self configurationWithPointSize:72.0];
  [v15 setPreferredSymbolConfiguration:v17];

  id v18 = [v1 contentView];
  [v18 addSubview:v15];

  id v19 = [v1 contentView];
  id v20 = [v19 mainContentGuide];

  unint64_t v21 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100049290;
  id v23 = [v15 topAnchor];
  id v24 = [v20 topAnchor];
  id v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];

  *(void *)(v22 + 32) = v25;
  id v26 = [v15 bottomAnchor];
  id v27 = [v20 bottomAnchor];
  id v28 = [v26 constraintLessThanOrEqualToAnchor:v27];

  *(void *)(v22 + 40) = v28;
  id v29 = [v15 centerXAnchor];
  id v30 = [v20 centerXAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v22 + 48) = v31;
  id v32 = [v15 centerYAnchor];
  id v33 = [v20 centerYAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];

  *(void *)(v22 + 56) = v34;
  uint64_t aBlock = (void **)v22;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v21 activateConstraints:isa];
}

void sub_10001EE80()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10001EED4();
  }
}

uint64_t sub_10001EED4()
{
  sub_10002FCB4();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext + 8);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext + 16);
  *(void *)uint64_t v1 = 1;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  sub_10000CBC4(v2, v3, v4);
  if (*(void *)(v1 + 16) != 1)
  {
    *(void *)(v1 + 64) = *(void *)(v0
                                     + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_capabilities);
    *(unsigned char *)uint64_t v1 = 1;
  }
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_1000350CC(v0, result);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_10001EFB4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext;
    uint64_t v3 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext);
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    uint64_t v6 = swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_1000350CC((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for ASUITurnOnTransportsViewController()
{
  return self;
}

uint64_t sub_10001F220()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_type);
}

uint64_t sub_10001F230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10001F2D4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001F30C()
{
}

uint64_t sub_10001F314(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F324()
{
  return swift_release();
}

void sub_10001F32C()
{
}

void sub_10001F33C()
{
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 setSubtitle:v2];

  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_10001FD3C;
  uint64_t v39 = v3;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  id v36 = sub_10002F814;
  uint64_t v37 = &unk_100059C00;
  uint64_t v5 = _Block_copy(&aBlock);
  uint64_t v6 = self;
  id v7 = [v6 actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();
  id v33 = v7;

  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_10001FD5C;
  uint64_t v39 = v8;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  id v36 = sub_10002F814;
  uint64_t v37 = &unk_100059C28;
  uint64_t v10 = _Block_copy(&aBlock);
  id v11 = [v6 actionWithTitle:v9 style:1 handler:v10];

  _Block_release(v10);
  swift_release();
  swift_release();

  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [self imageNamed:v12];

  if (v13)
  {
    id v14 = [objc_allocWithZone((Class)UIImageView) initWithImage:v13];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v15 = [v0 contentView];
    [v15 addSubview:v14];

    id v16 = [v0 contentView];
    id v17 = [v16 mainContentGuide];

    id v18 = self;
    sub_10000BEA4(&qword_100062D98);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100049290;
    id v20 = [v14 topAnchor];
    id v21 = [v17 topAnchor];
    id v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];

    *(void *)(v19 + 32) = v22;
    id v23 = [v14 bottomAnchor];
    id v24 = [v17 bottomAnchor];
    id v25 = [v23 constraintLessThanOrEqualToAnchor:v24];

    *(void *)(v19 + 40) = v25;
    id v26 = [v14 centerXAnchor];
    id v27 = [v17 centerXAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];

    *(void *)(v19 + 48) = v28;
    id v29 = [v14 centerYAnchor];
    id v30 = [v17 centerYAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30];

    *(void *)(v19 + 56) = v31;
    uint64_t aBlock = (void **)v19;
    specialized Array._endMutation()();
    sub_10000CB84();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v18 activateConstraints:isa];
  }
  else
  {
    __break(1u);
  }
}

char *sub_10001F910()
{
  swift_beginAccess();
  uint64_t result = (char *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    NSString v1 = result;
    NSString v2 = &result[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext];
    uint64_t v3 = *(void *)&result[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext];
    uint64_t v4 = *((void *)v2 + 1);
    uint64_t v5 = *((void *)v2 + 2);
    *(void *)NSString v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*((void *)v2 + 2) != 1) {
      *NSString v2 = 1;
    }
    uint64_t result = (char *)swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_100036278((uint64_t)v1, result);

      return (char *)swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_10001F9EC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext;
    uint64_t v3 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext);
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    uint64_t v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_100036278((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for ASUIMigrationViewController()
{
  return self;
}

uint64_t sub_10001FC50()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_type);
}

uint64_t sub_10001FC60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10001FD04()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

char *sub_10001FD3C()
{
  return sub_10001F910();
}

uint64_t sub_10001FD44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001FD54()
{
  return swift_release();
}

void sub_10001FD5C()
{
}

void sub_10001FD6C(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v49 = sub_1000207FC;
  uint64_t v50 = v5;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v46 = 1107296256;
  Swift::String v47 = sub_10002F814;
  uint64_t v48 = &unk_100059CD8;
  uint64_t v7 = _Block_copy(&aBlock);
  uint64_t v8 = self;
  id v9 = [v8 actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();
  uint64_t v44 = v9;

  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unint64_t v49 = sub_100020834;
  uint64_t v50 = v10;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v46 = 1107296256;
  Swift::String v47 = sub_10002F814;
  uint64_t v48 = &unk_100059D00;
  uint64_t v12 = _Block_copy(&aBlock);
  id v13 = [v8 actionWithTitle:v11 style:1 handler:v12];

  _Block_release(v12);
  swift_release();
  swift_release();

  uint64_t v14 = *(void *)(a1 + 136);
  if (v14)
  {
    id v15 = [objc_allocWithZone((Class)UIImageView) initWithImage:v14];
  }
  else
  {
    NSString v16 = String._bridgeToObjectiveC()();
    id v17 = [self systemImageNamed:v16];

    id v18 = [objc_allocWithZone((Class)UIImageView) initWithImage:v17];
    uint64_t v19 = self;
    id v15 = v18;
    id v20 = [v19 systemGreenColor];
    [v15 setTintColor:v20];

    id v21 = [self configurationWithPointSize:72.0];
    [v15 setPreferredSymbolConfiguration:v21];
  }
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v22 = [v1 contentView];
  [v22 addSubview:v15];

  id v23 = [v1 contentView];
  id v24 = [v23 mainContentGuide];

  if (v14)
  {
    id v25 = [v15 widthAnchor];
    id v26 = [v25 constraintEqualToConstant:70.0];

    [v26 setActive:1];
    id v27 = [v15 heightAnchor];
    id v28 = [v27 constraintEqualToConstant:70.0];

    [v28 setActive:1];
  }
  id v29 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100049290;
  id v31 = [v15 topAnchor];
  id v32 = [v24 topAnchor];
  id v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];

  *(void *)(v30 + 32) = v33;
  id v34 = [v15 bottomAnchor];
  id v35 = [v24 bottomAnchor];
  id v36 = [v34 constraintLessThanOrEqualToAnchor:v35];

  *(void *)(v30 + 40) = v36;
  id v37 = [v15 centerXAnchor];
  id v38 = [v24 centerXAnchor];
  id v39 = [v37 constraintEqualToAnchor:v38];

  *(void *)(v30 + 48) = v39;
  id v40 = [v15 centerYAnchor];
  id v41 = [v24 centerYAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v30 + 56) = v42;
  uint64_t aBlock = (void **)v30;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v29 activateConstraints:isa];
}

uint64_t sub_1000204A4(uint64_t a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = result + OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_routingContext;
    uint64_t v7 = *(void *)(result + OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_routingContext);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = *(void *)(v6 + 16);
    *(void *)uint64_t v6 = 1;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    sub_10000CBC4(v7, v8, v9);
    if (*(void *)(v6 + 16) != 1) {
      *(unsigned char *)uint64_t v6 = a3;
    }
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_1000362A8((uint64_t)v5, result);

      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for ASUIDoneViewController()
{
  return self;
}

uint64_t sub_100020710()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_type);
}

uint64_t sub_100020720@<X0>(uint64_t *a1@<X8>)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_1000207C4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000207FC(uint64_t a1)
{
  return sub_1000204A4(a1, v1, 1);
}

uint64_t sub_10002081C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002082C()
{
  return swift_release();
}

uint64_t sub_100020834(uint64_t a1)
{
  return sub_1000204A4(a1, v1, 0);
}

void sub_10002085C()
{
  qword_100063000 = 0x4051800000000000;
}

void sub_100020870()
{
  qword_100063008 = 0x4024000000000000;
}

void sub_100020880()
{
  qword_100063010 = 0x4032000000000000;
}

char *sub_100020890(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon] = 0;
  uint64_t v11 = &v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appName];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsage];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel] = 0;
  v20.receiver = v5;
  v20.super_class = (Class)type metadata accessor for ASUIAppHeaderView();
  id v13 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v14 = *(void **)&v13[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon];
  *(void *)&v13[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon] = a1;
  id v15 = v13;
  id v16 = a1;

  id v17 = &v15[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appName];
  *(void *)id v17 = a2;
  *((void *)v17 + 1) = a3;
  swift_bridgeObjectRelease();
  id v18 = &v15[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsage];
  *(void *)id v18 = a4;
  *((void *)v18 + 1) = a5;
  swift_bridgeObjectRelease();
  sub_1000209E0();

  return v15;
}

void sub_1000209E0()
{
  id v1 = [objc_allocWithZone((Class)UIImageView) initWithImage:*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon]];
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView;
  NSString v3 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView] = v1;

  id v4 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:0];
  uint64_t v5 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel;
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel] = v4;

  uint64_t v7 = *(void **)&v0[v5];
  if (!v7)
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appName + 8])
  {
    id v8 = v7;
    swift_bridgeObjectRetain();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = v7;
    NSString v9 = 0;
  }
  [v7 setText:v9];

  uint64_t v11 = *(void **)&v0[v5];
  if (!v11) {
    goto LABEL_39;
  }
  [v11 setTextAlignment:1];
  uint64_t v12 = *(void **)&v0[v5];
  if (!v12)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  [v12 setNumberOfLines:0];
  id v13 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:2];
  uint64_t v14 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel;
  id v15 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel] = v13;

  id v16 = *(void **)&v0[v14];
  if (!v16)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsage + 8])
  {
    id v17 = v16;
    swift_bridgeObjectRetain();
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v19 = v16;
    NSString v18 = 0;
  }
  [v16 setText:v18];

  objc_super v20 = *(void **)&v0[v14];
  if (!v20) {
    goto LABEL_42;
  }
  [v20 setNumberOfLines:0];
  id v21 = *(void **)&v0[v14];
  if (!v21)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  [v21 setTextAlignment:1];
  id v22 = *(void **)&v0[v2];
  if (!v22)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  id v23 = *(void **)&v0[v5];
  if (!v23)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  id v24 = *(void **)&v0[v14];
  if (!v24)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  id v25 = v23;
  id v26 = v24;
  id v27 = v22;
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 addSubview:v27];
  id v28 = v25;
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 addSubview:v28];

  id v29 = v26;
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 addSubview:v29];

  sub_10000BEA4(&qword_100062D98);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100049420;
  id v31 = *(void **)&v0[v2];
  if (!v31)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  id v32 = [v31 widthAnchor];
  if (qword_100062958 != -1) {
    swift_once();
  }
  id v33 = [v32 constraintEqualToConstant:*(double *)&qword_100063000];

  *(void *)(v30 + 32) = v33;
  id v34 = *(void **)&v0[v2];
  if (!v34) {
    goto LABEL_48;
  }
  id v35 = [v34 heightAnchor];
  id v36 = [v35 constraintEqualToConstant:*(double *)&qword_100063000];

  *(void *)(v30 + 40) = v36;
  id v37 = *(void **)&v0[v2];
  if (!v37)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  id v38 = [v37 centerXAnchor];
  id v39 = [v0 centerXAnchor];
  id v40 = [v38 constraintEqualToAnchor:v39];

  *(void *)(v30 + 48) = v40;
  id v41 = *(void **)&v0[v2];
  if (!v41)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  id v42 = [v41 topAnchor];
  id v43 = [v0 topAnchor];
  [v0 layoutMargins];
  [v42 constraintEqualToAnchor:v43];

  *(void *)(v30 + 56) = v44;
  unint64_t v45 = *(void **)&v0[v5];
  if (!v45)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  id v46 = [v45 topAnchor];
  Swift::String v47 = *(void **)&v0[v2];
  if (!v47)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  id v48 = [v47 bottomAnchor];
  if (qword_100062960 != -1) {
    swift_once();
  }
  id v49 = [v46 constraintEqualToAnchor:v48 constant:*(double *)&qword_100063008];

  *(void *)(v30 + 64) = v49;
  uint64_t v50 = *(void **)&v0[v5];
  if (!v50) {
    goto LABEL_53;
  }
  id v51 = [v50 centerXAnchor];
  id v52 = [v0 centerXAnchor];
  id v53 = [v51 constraintEqualToAnchor:v52];

  *(void *)(v30 + 72) = v53;
  id v54 = *(void **)&v0[v5];
  if (!v54)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  id v55 = [v54 widthAnchor];
  id v56 = [v0 widthAnchor];
  id v57 = [v55 constraintEqualToAnchor:v56];

  *(void *)(v30 + 80) = v57;
  uint64_t v58 = *(void **)&v0[v14];
  if (!v58)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  id v59 = [v58 topAnchor];
  uint64_t v60 = *(void **)&v0[v5];
  if (!v60)
  {
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  id v61 = [v60 bottomAnchor];
  if (qword_100062968 != -1) {
    swift_once();
  }
  id v62 = [v59 constraintEqualToAnchor:v61 constant:*(double *)&qword_100063010];

  *(void *)(v30 + 88) = v62;
  uint64_t v63 = *(void **)&v0[v14];
  if (!v63) {
    goto LABEL_57;
  }
  id v64 = [v63 centerXAnchor];
  id v65 = [v0 centerXAnchor];
  id v66 = [v64 constraintEqualToAnchor:v65];

  *(void *)(v30 + 96) = v66;
  char v67 = *(void **)&v0[v14];
  if (!v67)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v68 = [v67 widthAnchor];
  id v69 = [v0 widthAnchor];
  id v70 = [v68 constraintEqualToAnchor:v69];

  *(void *)(v30 + 104) = v70;
  uint64_t v71 = *(void **)&v0[v14];
  if (!v71)
  {
LABEL_59:
    __break(1u);
    return;
  }
  uint64_t v72 = self;
  id v73 = [v71 bottomAnchor];
  id v74 = [v0 bottomAnchor];
  id v75 = [v73 constraintEqualToAnchor:v74];

  *(void *)(v30 + 112) = v75;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v72 activateConstraints:isa];
}

id sub_100021264()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIAppHeaderView();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIAppHeaderView()
{
  return self;
}

void sub_100021350()
{
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon] = 0;
  id v1 = &v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appName];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  objc_super v2 = &v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsage];
  *(void *)objc_super v2 = 0;
  *((void *)v2 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100021400()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100063070);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100063070);
  if (qword_1000628E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A10);
  NSString v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

BOOL sub_1000214C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000214DC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100021524()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100021550()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100021594()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000BEA4(&qword_100062EE0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(55);
  v8._object = (void *)0x800000010004ACA0;
  v8._countAndFlagsBits = 0xD000000000000035;
  String.append(_:)(v8);
  NSString v9 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  if (!v9)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v10 = v9;
  sub_10000CD24();
  uint64_t v12 = v11;

  if (!v12)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v13 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  id v14 = v13;

  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v15 = [v14 bluetoothIdentifier];

  if (!v15)
  {
LABEL_10:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v7, 1, 1, v1);
    goto LABEL_11;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v4, v1);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v1);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1);
  if (result != 1)
  {
    uint64_t v17 = UUID.uuidString.getter();
    id v19 = v18;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    URL.init(string:)();
    return swift_bridgeObjectRelease();
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100021840(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000629B0 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v13 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
  if (v13)
  {
    uint64_t v14 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    if (v14)
    {
      if (*(unsigned char *)(v14 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1) {
        uint64_t v15 = ~*(unsigned __int8 *)(v13 + 84) & 1;
      }
      else {
        uint64_t v15 = 0;
      }
      if (*(unsigned char *)(v14 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) == 1 && !*(unsigned char *)(v13 + 86)) {
        v15 |= 2uLL;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    sub_100024B64();
    id v16 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v15;
    *(void *)(v17 + 24) = a3;
    aBlock[4] = sub_100024BDC;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015768;
    aBlock[3] = &unk_100059FD0;
    NSString v18 = _Block_copy(aBlock);
    id v19 = a3;
    static DispatchQoS.unspecified.getter();
    v20[1] = &_swiftEmptyArrayStorage;
    sub_100024BFC((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000BEA4((uint64_t *)&unk_100063190);
    sub_100024C44();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100021BA8(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    if (qword_100062970 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100005F6C(v7, (uint64_t)qword_100063070);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Showing Connect View", v10, 2u);
      swift_slowDealloc();
    }

    uint64_t v11 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = sub_1000307DC();
      [v12 pushViewController:v13 animated:1];
    }
    uint64_t v14 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
    if (v14)
    {
      id v15 = v14;
      sub_10000D894();

      if (qword_1000629B0 != -1) {
        swift_once();
      }
      uint64_t v16 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
      if (v16)
      {
        uint64_t v17 = *(void *)(v16 + 40);
        *(void *)(v16 + 40) = 0;
        *(void *)(v16 + 48) = 0;
        sub_100005A34(v17);
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
  uint64_t v4 = a2 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 16))(v28, ObjectType, v5);
    sub_100024CA0((uint64_t)v28, (uint64_t)v29, (uint64_t *)&unk_1000631A0);
    if (v30 == 1)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v18 = v31;
      int v19 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
      swift_unknownObjectRelease();
      sub_100024D04(v28);
      if (v19) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = (v18 & a1) == a1;
      }
      if (v20) {
        return;
      }
    }
  }
  if (qword_100062970 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  sub_100005F6C(v21, (uint64_t)qword_100063070);
  id v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Showing Turn On Transports View", v24, 2u);
    swift_slowDealloc();
  }

  id v25 = *(void **)(a2 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
  if (v25)
  {
    id v26 = v25;
    id v27 = sub_100030A18();
    [v26 pushViewController:v27 animated:1];
  }
}

void sub_100021F30(void *a1)
{
  uint64_t v2 = v1;
  v1[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType] = 0;
  type metadata accessor for ASUIPresenter();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = (uint64_t *)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter];
  *uint64_t v5 = v4;
  v5[1] = (uint64_t)&off_10005B218;
  swift_unknownObjectRelease();
  if (!*v5)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(*v5 + 24) = &off_100059EB0;
  swift_unknownObjectWeakAssign();
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
  if (!v6) {
    goto LABEL_34;
  }
  uint64_t v7 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v7)
  {
    if (*(unsigned char *)(v7 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1)
    {
      int v8 = *(unsigned __int8 *)(v7 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi);
      if (v8)
      {
        if ((*(unsigned char *)(v6 + 86) & *(unsigned char *)(v6 + 84) & 1) == 0)
        {
          if (*(unsigned char *)(v6 + 84)) {
            char v9 = 0;
          }
          else {
            char v9 = *(unsigned char *)(v6 + 85) ^ 1;
          }
LABEL_18:
          if (*(unsigned char *)(v6 + 84) == 1)
          {
            if ((v8 & 1) == 0) {
              goto LABEL_25;
            }
          }
          else if (!v8)
          {
            goto LABEL_25;
          }
LABEL_24:
          if ((*(unsigned char *)(v6 + 86) & 1) == 0)
          {
            if (v9 & 1 | ((*(unsigned char *)(v6 + 87) & 1) == 0)) {
              goto LABEL_26;
            }
            goto LABEL_28;
          }
LABEL_25:
          if (v9)
          {
LABEL_26:
            swift_retain();
            uint64_t v14 = sub_1000308F4();
LABEL_29:
            id v12 = v14;
            goto LABEL_30;
          }
LABEL_28:
          uint64_t v15 = swift_allocObject();
          *(void *)(v15 + 16) = v2;
          uint64_t v16 = *(void *)(v6 + 40);
          *(void *)(v6 + 40) = sub_100024D84;
          *(void *)(v6 + 48) = v15;
          swift_retain();
          v2;
          sub_100005A34(v16);
          uint64_t v14 = sub_100030A18();
          goto LABEL_29;
        }
      }
      else if (!*(unsigned char *)(v6 + 84))
      {
        char v9 = *(unsigned char *)(v6 + 85) ^ 1;
        goto LABEL_18;
      }
    }
    else if ((*(unsigned char *)(v7 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) & 1) != 0 {
           && (*(unsigned char *)(v6 + 86) & 1) == 0)
    }
    {
      char v9 = 0;
      goto LABEL_24;
    }
  }
  swift_retain();
  id v10 = sub_1000307DC();
  uint64_t v11 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
  if (!v11)
  {
LABEL_35:
    __break(1u);
    return;
  }
  id v12 = v10;
  id v13 = v11;
  sub_10000D894();

LABEL_30:
  id v17 = [a1 presentProxCardFlowWithDelegate:v2 initialViewController:v12];
  swift_release();

  uint64_t v18 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
  *(void *)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController] = v17;
}

void sub_1000221F4(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType) = 1;
  type metadata accessor for ASUIPresenter();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  *uint64_t v4 = v3;
  v4[1] = (uint64_t)&off_10005B218;
  swift_unknownObjectRelease();
  if (!*v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(void *)(*v4 + 24) = &off_100059EB0;
  swift_unknownObjectWeakAssign();
  uint64_t v5 = sub_100030B3C();
  id v6 = [a1 presentProxCardFlowWithDelegate:v1 initialViewController:v5];
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController) = v6;

  int v8 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  if (!v8)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v9 = v8;
  sub_10000D894();
}

void sub_100022318(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType) = 2;
  type metadata accessor for ASUIPresenter();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  *uint64_t v4 = v3;
  v4[1] = (uint64_t)&off_10005B218;
  swift_unknownObjectRelease();
  if (*v4)
  {
    *(void *)(*v4 + 24) = &off_100059EB0;
    swift_unknownObjectWeakAssign();
    uint64_t v5 = sub_1000306B8();
    id v6 = [a1 presentProxCardFlowWithDelegate:v1 initialViewController:v5];

    uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController) = v6;
  }
  else
  {
    __break(1u);
  }
}

void sub_10002240C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000BEA4(&qword_100062EE0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v58 - v6;
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (!v8 || *(unsigned char *)(v8 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType)) {
    goto LABEL_17;
  }
  uint64_t v9 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession;
  id v10 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  if (!v10)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  id v11 = v10;
  sub_10000CD24();
  id v13 = v12;

  if (!v13)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  int v14 = v13[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_allowsRename];

  if (v14 != 1) {
    goto LABEL_17;
  }
  uint64_t v15 = *(void **)(v1 + v9);
  if (!v15)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  id v16 = v15;
  sub_10000CD24();
  uint64_t v18 = v17;

  if (!v18)
  {
    uint64_t v23 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v7, 1, 1, v23);
LABEL_16:
    sub_100024B04((uint64_t)v7);
    goto LABEL_17;
  }
  int v19 = *(void **)&v18[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  id v20 = v19;

  if (!v19)
  {
LABEL_56:
    __break(1u);
    return;
  }
  id v21 = [v20 bluetoothIdentifier];

  if (v21)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 0, 1, v22);
  }
  else
  {
    uint64_t v22 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 1, 1, v22);
  }
  sub_100024CA0((uint64_t)v5, (uint64_t)v7, &qword_100062EE0);
  type metadata accessor for UUID();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v7, 1, v22) == 1) {
    goto LABEL_16;
  }
  sub_100024B04((uint64_t)v7);
  uint64_t v30 = v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  if (!swift_unknownObjectWeakLoadStrong()
    || (uint64_t v31 = *(void *)(v30 + 8),
        uint64_t ObjectType = swift_getObjectType(),
        LODWORD(v31) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v31 + 8))(ObjectType, v31),
        swift_unknownObjectRelease(),
        v31 != 7))
  {
    if (qword_100062970 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_100005F6C(v33, (uint64_t)qword_100063070);
    id v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Showing Naming View", v36, 2u);
      swift_slowDealloc();
    }

    id v37 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
    if (v37)
    {
      id v38 = v37;
      id v39 = sub_1000306B8();
      [v38 pushViewController:v39 animated:1];
    }
    id v40 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
    if (v40) {
      [v40 pickerStartedRename];
    }
    return;
  }
LABEL_17:
  uint64_t v24 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession;
  uint64_t v25 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  if (!v25)
  {
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  id v26 = (unint64_t *)(v25 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems);
  swift_beginAccess();
  unint64_t v27 = *v26;
  if (v27)
  {
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v41 >= 1)
      {
LABEL_21:
        id v28 = *(void **)(v1 + v24);
        if (v28)
        {
          id v29 = v28;
          sub_10001599C();

          return;
        }
        goto LABEL_50;
      }
    }
    else if (*(uint64_t *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
    {
      goto LABEL_21;
    }
  }
  uint64_t v42 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v42 && !*(unsigned char *)(v42 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType))
  {
    id v43 = *(void **)(v1 + v24);
    if (!v43)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    id v44 = v43;
    sub_10000CD24();
    id v46 = v45;

    if (!v46)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    int v47 = v46[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_needsBluetoothSetup];

    if (v47 == 1)
    {
      uint64_t v48 = v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
      if (!swift_unknownObjectWeakLoadStrong()
        || (uint64_t v49 = *(void *)(v48 + 8),
            uint64_t v50 = swift_getObjectType(),
            LODWORD(v49) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v49 + 8))(v50, v49),
            swift_unknownObjectRelease(),
            v49 != 8))
      {
        sub_100022AD8();
        return;
      }
    }
  }
  if (qword_100062970 != -1) {
    swift_once();
  }
  uint64_t v51 = type metadata accessor for Logger();
  sub_100005F6C(v51, (uint64_t)qword_100063070);
  id v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    id v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "Showing Done View", v54, 2u);
    swift_slowDealloc();
  }

  id v55 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
  if (v55)
  {
    id v56 = v55;
    id v57 = sub_100030D84();
    [v56 pushViewController:v57 animated:1];
  }
}

id sub_100022AD8()
{
  uint64_t v1 = v0;
  if (qword_100062970 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063070);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Showing Bluetooth Setup View", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_100030EA8();
    [v7 pushViewController:v8 animated:1];
  }
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  id result = *(id *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
  if (result)
  {
    return [result pickerStartedBridging];
  }
  return result;
}

void sub_100022C68()
{
  uint64_t v1 = v0;
  if (qword_100062970 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063070);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Showing Migration Done View", v5, 2u);
    swift_slowDealloc();
  }

  if (!*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v7 = Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  uint64_t v8 = swift_unknownObjectWeakLoadStrong();
  uint64_t v9 = *(void *)(v7 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (v8)
  {
    uint64_t ObjectType = swift_getObjectType();
    char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
    sub_10003F198(v11, (uint64_t)v12);
    (*(void (**)(void *, uint64_t, uint64_t))(v9 + 72))(v12, ObjectType, v9);
    sub_10001E588(v12);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

id sub_100022E48()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType] = 3;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter];
  *uint64_t v2 = 0;
  v2[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_rootController] = 0;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return [super init];
}

uint64_t type metadata accessor for ASUIRouter()
{
  return self;
}

void sub_100022FD4()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession;
  uint64_t v2 = *(char **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  if (!v2)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v3 = v0;
  uint64_t v4 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
  uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
  uint64_t v6 = v2;
  if (v5)
  {
    [v5 invalidateWithReason:10];
    uint64_t v5 = *(void **)&v2[v4];
  }
  *(void *)&v2[v4] = 0;

  uint64_t v7 = *(void **)(v3 + v1);
  if (!v7) {
    goto LABEL_19;
  }
  id v8 = v7;
  sub_1000144CC(10, 0);

  uint64_t v9 = v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  if (!swift_unknownObjectWeakLoadStrong())
  {
    type metadata accessor for ASError(0);
    sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
    sub_100024BFC(&qword_100062BA0, type metadata accessor for ASError);
    _BridgedStoredNSError.init(_:userInfo:)();
LABEL_11:
    id v13 = v17;
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  uint64_t ObjectType = swift_getObjectType();
  id v12 = *(unsigned __int8 (**)(uint64_t, uint64_t))(v10 + 8);
  if (v12(ObjectType, v10) != 7 && v12(ObjectType, v10) != 9 && v12(ObjectType, v10) != 12)
  {
    type metadata accessor for ASError(0);
    sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
    sub_100024BFC(&qword_100062BA0, type metadata accessor for ASError);
    _BridgedStoredNSError.init(_:userInfo:)();
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  swift_unknownObjectRelease();
  id v13 = 0;
LABEL_12:
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  sub_100037C0C(v13);
  uint64_t v14 = v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v15 = *(void *)(v14 + 8);
    uint64_t v16 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v15);
    swift_errorRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_errorRelease();
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for ASUIViewType(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ASUIFlowType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ASUIFlowType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 2;
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
        JUMPOUT(0x10002346CLL);
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
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100023494(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10002349C(unsigned char *result, char a2)
{
  *id result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASUIFlowType()
{
  return &type metadata for ASUIFlowType;
}

uint64_t initializeBufferWithCopyOfBuffer for ASUIRoutingContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ASUIRoutingContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ASUIRoutingContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASUIRoutingContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for ASUIRoutingContext(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ASUIRoutingContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASUIRoutingContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASUIRoutingContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASUIRoutingContext()
{
  return &type metadata for ASUIRoutingContext;
}

unint64_t sub_1000237CC()
{
  unint64_t result = qword_100063148;
  if (!qword_100063148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063148);
  }
  return result;
}

unint64_t sub_100023820(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BEA4((uint64_t *)&unk_100063AF0);
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
    sub_1000247F4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10002394C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10002485C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10002394C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000239C4(a1, a2, v4);
}

unint64_t sub_1000239C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100023B0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100023BE0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100024794((uint64_t)v12, *a3);
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
      sub_100024794((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100024744((uint64_t)v12);
  return v7;
}

uint64_t sub_100023BE0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100023D9C(a5, a6);
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

uint64_t sub_100023D9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100023E34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100024090(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100024090(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100023E34(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100023FAC(v2, 0);
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

void *sub_100023FAC(uint64_t a1, uint64_t a2)
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
  sub_10000BEA4((uint64_t *)&unk_100063160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100024014(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100024090(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000BEA4((uint64_t *)&unk_100063160);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
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

void sub_1000241E0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = &v1[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView];
  if (!swift_unknownObjectWeakLoadStrong()
    || (uint64_t v5 = *((void *)v4 + 1),
        uint64_t v6 = swift_getObjectType(),
        LODWORD(v5) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v5 + 8))(v6, v5),
        swift_unknownObjectRelease(),
        v5 != 11))
  {
    if (!swift_unknownObjectWeakLoadStrong()
      || (uint64_t v7 = *((void *)v4 + 1),
          uint64_t ObjectType = swift_getObjectType(),
          LODWORD(v7) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v7 + 8))(ObjectType, v7),
          swift_unknownObjectRelease(),
          v7 != 9))
    {
      if (qword_100062970 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      sub_100005F6C(v15, (uint64_t)qword_100063070);
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Showing Error View", v18, 2u);
        swift_slowDealloc();
      }

      int v19 = *(void **)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v19)
      {
        id v20 = v19;
        id v21 = sub_100030FCC();
        [v20 pushViewController:v21 animated:1];
      }
      uint64_t v22 = *(void **)(a1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
      if (!v22)
      {
        __break(1u);
        return;
      }
      unsigned int v23 = [v22 allowPairing];
      uint64_t v24 = *(char **)&v2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (v23)
      {
        if (!v24) {
          goto LABEL_30;
        }
        uint64_t v25 = (void **)&v24[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
        id v26 = *(void **)&v24[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
        if (v26)
        {
          unint64_t v27 = v24;
          [v26 invalidateWithReason:1];
LABEL_27:
          id v26 = *v25;
LABEL_29:
          *uint64_t v25 = 0;

LABEL_30:
          if (qword_1000629B0 != -1) {
            swift_once();
          }
          uint64_t v28 = qword_100064A90;
          type metadata accessor for ASError(0);
          sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
          sub_100024BFC(&qword_100062BA0, type metadata accessor for ASError);
          _BridgedStoredNSError.init(_:userInfo:)();
          uint64_t v10 = v34;
          id v29 = *(void **)(v28 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
          if (v29)
          {
            swift_unknownObjectRetain();
            uint64_t v30 = (void *)_convertErrorToNSError(_:)();
            [v29 pickerSetupFailed:v30];

            swift_unknownObjectRelease();
            return;
          }
          goto LABEL_35;
        }
      }
      else
      {
        if (!v24) {
          goto LABEL_30;
        }
        uint64_t v25 = (void **)&v24[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
        id v26 = *(void **)&v24[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
        if (v26)
        {
          unint64_t v27 = v24;
          [v26 invalidateWithReason:2];
          goto LABEL_27;
        }
      }
      unint64_t v27 = v24;
      goto LABEL_29;
    }
  }
  if (qword_100062970 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100005F6C(v9, (uint64_t)qword_100063070);
  uint64_t v33 = v1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    id v34 = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v13 = *((void *)v4 + 1);
      uint64_t v14 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v13);
      swift_unknownObjectRelease();
    }
    sub_10000BEA4(&qword_100063158);
    uint64_t v31 = String.init<A>(describing:)();
    sub_100023B0C(v31, v32, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "ignoring error event from DA, UI is already in the state of %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_35:

    return;
  }
}

uint64_t sub_100024744(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100024794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000247F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BEA4((uint64_t *)&unk_100063170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10002485C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10002486C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  if (!swift_unknownObjectWeakLoadStrong()
    || (uint64_t v2 = *(void *)(v1 + 8),
        uint64_t v3 = swift_getObjectType(),
        LODWORD(v2) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v2 + 8))(v3, v2),
        swift_unknownObjectRelease(),
        v2 != 9))
  {
    if (!swift_unknownObjectWeakLoadStrong()
      || (uint64_t v4 = *(void *)(v1 + 8),
          uint64_t ObjectType = swift_getObjectType(),
          LODWORD(v4) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v4 + 8))(ObjectType, v4),
          swift_unknownObjectRelease(),
          v4 != 8))
    {
      sub_10002240C();
    }
  }
}

uint64_t sub_100024948()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v2 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    LODWORD(v2) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
    uint64_t result = swift_unknownObjectRelease();
    if (v2 == 2) {
      goto LABEL_17;
    }
  }
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v1 + 8);
    uint64_t v6 = swift_getObjectType();
    LODWORD(v5) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v5 + 8))(v6, v5);
    uint64_t result = swift_unknownObjectRelease();
    if (v5 == 12)
    {
LABEL_17:
      if (*(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter))
      {
        uint64_t result = swift_unknownObjectWeakLoadStrong();
        if (result)
        {
          uint64_t v7 = result + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView;
          uint64_t Strong = swift_unknownObjectWeakLoadStrong();
          uint64_t v9 = *(void *)(v7 + 8);
          swift_unknownObjectRetain();
          swift_unknownObjectRelease();
          if (Strong)
          {
            uint64_t v10 = swift_getObjectType();
            char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v9);
            sub_10003F198(v11, (uint64_t)v12);
            (*(void (**)(void *, uint64_t, uint64_t))(v9 + 72))(v12, v10, v9);
            sub_10001E588(v12);
            swift_unknownObjectRelease();
            return swift_unknownObjectRelease();
          }
          else
          {
            return swift_unknownObjectRelease();
          }
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100024B04(uint64_t a1)
{
  uint64_t v2 = sub_10000BEA4(&qword_100062EE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100024B64()
{
  unint64_t result = qword_100063180;
  if (!qword_100063180)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100063180);
  }
  return result;
}

uint64_t sub_100024BA4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100024BDC()
{
  sub_100021BA8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100024BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100024BF4()
{
  return swift_release();
}

uint64_t sub_100024BFC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100024C44()
{
  unint64_t result = qword_100063CE0;
  if (!qword_100063CE0)
  {
    sub_10001D7F4((uint64_t *)&unk_100063190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063CE0);
  }
  return result;
}

uint64_t sub_100024CA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000BEA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100024D04(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100024D4C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100024D84(uint64_t a1, uint64_t a2)
{
  return sub_100021840(a1, a2, *(void **)(v2 + 16));
}

void sub_100024D8C()
{
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 setSubtitle:v2];

  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v30[4] = sub_100025588;
  v30[5] = v3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 1107296256;
  v30[2] = sub_10002F814;
  v30[3] = &unk_10005A0A8;
  uint64_t v5 = _Block_copy(v30);
  id v6 = [self actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();

  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [self systemImageNamed:v7];

  id v9 = [objc_allocWithZone((Class)UIImageView) initWithImage:v8];
  id v10 = [self systemBlueColor];
  [v9 setTintColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [self configurationWithPointSize:72.0];
  [v9 setPreferredSymbolConfiguration:v11];

  id v12 = [v0 contentView];
  [v12 addSubview:v9];

  id v13 = [v0 contentView];
  id v14 = [v13 mainContentGuide];

  uint64_t v15 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100049290;
  id v17 = [v9 topAnchor];
  id v18 = [v14 topAnchor];
  id v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];

  *(void *)(v16 + 32) = v19;
  id v20 = [v9 bottomAnchor];
  id v21 = [v14 bottomAnchor];
  id v22 = [v20 constraintLessThanOrEqualToAnchor:v21];

  *(void *)(v16 + 40) = v22;
  id v23 = [v9 centerXAnchor];
  id v24 = [v14 centerXAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];

  *(void *)(v16 + 48) = v25;
  id v26 = [v9 centerYAnchor];
  id v27 = [v14 centerYAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];

  *(void *)(v16 + 56) = v28;
  v30[0] = v16;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v15 activateConstraints:isa];
}

uint64_t sub_1000252B4()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    NSString v1 = (void *)result;
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_1000362D8((uint64_t)v1, result);

      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for ASUIConnectionErrorViewController()
{
  return self;
}

uint64_t sub_10002549C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_type);
}

uint64_t sub_1000254AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_100025550()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100025588()
{
  return sub_1000252B4();
}

uint64_t sub_100025590(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000255A0()
{
  return swift_release();
}

void sub_1000255A8(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  uint64_t v5 = (void *)swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1000263B8;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10002F814;
  aBlock[3] = &unk_10005A158;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [self actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();

  NSString v9 = String._bridgeToObjectiveC()();
  [v1 setBottomTrayTitle:v9];

  sub_1000263D8(a1 + 104, (uint64_t)aBlock);
  uint64_t v10 = &v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device];
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device];
  sub_1000263D8((uint64_t)aBlock, (uint64_t)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device]);
  sub_100026440(aBlock);

  id v12 = [objc_allocWithZone((Class)PRXTextField) init];
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField;
  id v14 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField];
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField] = v12;

  uint64_t v15 = *(void **)&v1[v13];
  if (!v15)
  {
    __break(1u);
    goto LABEL_18;
  }
  [v15 addTarget:v1 action:"textFieldDidChange" forControlEvents:0x20000];
  uint64_t v16 = *(void **)&v1[v13];
  if (!v16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v17 = self;
  id v18 = v16;
  id v19 = [v17 systemFontOfSize:18.0 weight:UIFontWeightMedium];
  [v18 setFont:v19];

  id v20 = *(void **)&v1[v13];
  if (!v20)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v21 = *(void **)&v1[v13];
  if (!v21)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v22 = self;
  id v23 = v21;
  id v24 = [v22 secondarySystemBackgroundColor];
  [v23 setBackgroundColor:v24];

  id v25 = *(void **)&v1[v13];
  if (!v25)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (!*(void *)v10)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (*(void *)(*(void *)v10 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8))
  {
    id v26 = v25;
    swift_bridgeObjectRetain();
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v28 = v25;
    NSString v27 = 0;
  }
  [v25 setPlaceholder:v27];

  id v29 = [v1 contentView];
  if (!*(void *)&v1[v13]) {
    goto LABEL_23;
  }
  uint64_t v30 = v29;
  [v29 addSubview:];

  id v31 = [v1 contentView];
  id v32 = [v31 mainContentGuide];

  sub_10000BEA4(&qword_100062D98);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1000492A0;
  id v34 = *(void **)&v1[v13];
  if (!v34)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v35 = [v34 topAnchor];
  id v36 = [v32 topAnchor];
  id v37 = [v35 constraintEqualToAnchor:v36];

  *(void *)(v33 + 32) = v37;
  id v38 = *(void **)&v1[v13];
  if (!v38)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v39 = [v38 centerXAnchor];
  id v40 = [v32 centerXAnchor];
  id v41 = [v39 constraintEqualToAnchor:v40];

  *(void *)(v33 + 40) = v41;
  uint64_t v42 = *(void **)&v1[v13];
  if (!v42)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v43 = [v42 bottomAnchor];
  id v44 = [v32 bottomAnchor];
  id v45 = [v43 constraintLessThanOrEqualToAnchor:v44];

  *(void *)(v33 + 48) = v45;
  id v46 = *(void **)&v1[v13];
  if (!v46)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v47 = [v46 heightAnchor];
  id v48 = [v47 constraintEqualToConstant:62.0];

  *(void *)(v33 + 56) = v48;
  uint64_t v49 = *(void **)&v1[v13];
  if (v49)
  {
    uint64_t v50 = self;
    id v51 = [v49 widthAnchor];
    id v52 = [v32 widthAnchor];
    id v53 = [v51 constraintEqualToAnchor:v52];

    *(void *)(v33 + 64) = v53;
    specialized Array._endMutation()();
    sub_10000CB84();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v50 activateConstraints:isa];

    return;
  }
LABEL_28:
  __break(1u);
}

void sub_100025C58()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100025CAC();
  }
}

id sub_100025CAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CharacterSet();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField;
  id result = *(id *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField);
  if (!result)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [result resignFirstResponder];
  uint64_t v8 = v1 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext;
  swift_beginAccess();
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v11 = *(void *)(v8 + 16);
  *(void *)uint64_t v8 = 1;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  sub_10000CBC4(v9, v10, v11);
  swift_beginAccess();
  if (*(void *)(v8 + 16) == 1) {
    goto LABEL_6;
  }
  *(unsigned char *)uint64_t v8 = 1;
  id result = *(id *)(v1 + v6);
  if (!result) {
    goto LABEL_15;
  }
  id result = [result text];
  if (!result)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v12 = result;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

  v26[0] = v13;
  v26[1] = v15;
  static CharacterSet.whitespacesAndNewlines.getter();
  sub_10002646C();
  uint64_t v16 = StringProtocol.trimmingCharacters(in:)();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  *(void *)(v8 + 8) = v16;
  *(void *)(v8 + 16) = v18;
  swift_bridgeObjectRelease();
LABEL_6:
  swift_endAccess();
  id result = (id)swift_beginAccess();
  if (*(void *)(v8 + 16) == 1) {
    goto LABEL_11;
  }
  id v19 = *(char **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device);
  if (!v19) {
    goto LABEL_17;
  }
  id v20 = *(void **)&v19[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v20)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v21 = v19;
  id result = [v20 identifier];
  if (!result)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  id v22 = result;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  *(void *)(v8 + 40) = v23;
  *(void *)(v8 + 48) = v25;
  swift_bridgeObjectRelease();
LABEL_11:
  swift_endAccess();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100036308(v1, (char *)result);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_100025FD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CharacterSet();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField;
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField);
  if (!v7)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v8 = [v7 text];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    v20[0] = v10;
    v20[1] = v12;
    static CharacterSet.whitespacesAndNewlines.getter();
    sub_10002646C();
    uint64_t v13 = StringProtocol.trimmingCharacters(in:)();
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0) {
      uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
    }
    if (!v16)
    {
      uint64_t v17 = *(void **)(v1 + v6);
      if (v17)
      {
        id v18 = v17;
        NSString v19 = String._bridgeToObjectiveC()();
        [v18 setText:v19];

        return;
      }
LABEL_10:
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for ASUINamingViewController()
{
  return self;
}

uint64_t sub_1000262B8()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_type);
}

uint64_t sub_1000262C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v13 = v3[8];
  uint64_t result = sub_10000CA8C(*v3, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v13;
  return result;
}

uint64_t sub_100026380()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000263B8()
{
}

uint64_t sub_1000263C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000263D0()
{
  return swift_release();
}

uint64_t sub_1000263D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BEA4(&qword_100063248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id *sub_100026440(id *a1)
{
  id v2 = *a1;
  return a1;
}

unint64_t sub_10002646C()
{
  unint64_t result = qword_100063250;
  if (!qword_100063250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063250);
  }
  return result;
}

id sub_1000264C0(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_type] = 7;
  uint64_t v4 = &v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_routingContext];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 1;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_router + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_textField] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_device] = 0;
  v1[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_updatingSSID] = 0;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  return [super initWithContentView:a1];
}

uint64_t getEnumTagSinglePayload for ASUIViewType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ASUIViewType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x1000266E4);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASUIViewType()
{
  return &type metadata for ASUIViewType;
}

unint64_t sub_100026720()
{
  unint64_t result = qword_100063258;
  if (!qword_100063258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100063258);
  }
  return result;
}

uint64_t sub_100026774()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100063260);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100063260);
  if (qword_1000628F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A58);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_10002683C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100026848(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100026850@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100026864@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100026878@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10002688C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1000268BC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000268E8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10002690C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100026920(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100026934(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100026948@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10002695C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100026970(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100026984(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100026998()
{
  return *v0 == 0;
}

uint64_t sub_1000269A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_1000269C0(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_1000269D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100029DD0(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_100026A14()
{
  NSString v0 = String._bridgeToObjectiveC()();
  char v1 = MGGetBoolAnswer();

  byte_100064A78 = v1;
}

uint64_t sub_100026A58(uint64_t result)
{
  if (!result)
  {
    uint64_t v3 = *(void (**)(uint64_t))(v1 + 24);
    if (v3)
    {
      uint64_t v4 = swift_retain();
      v3(v4);
      uint64_t result = sub_100005A34((uint64_t)v3);
    }
    *(void *)(v1 + 56) = 0;
    return result;
  }
  char v2 = result;
  *(void *)(v1 + 56) = result;
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(v1 + 80))
  {
    *(void *)(v1 + 56) = result & 0xFFFFFFFFFFFFFFFELL;
    if ((result & 0xFFFFFFFFFFFFFFFELL) == 0)
    {
LABEL_16:
      unsigned int v6 = *(void (**)(uint64_t))(v1 + 24);
      if (v6)
      {
        uint64_t v7 = swift_retain();
        v6(v7);
        return sub_100005A34((uint64_t)v6);
      }
      return result;
    }
LABEL_5:
    if ((result & 2) == 0) {
      return result;
    }
    goto LABEL_12;
  }
  uint64_t result = sub_100026B64();
  if ((v2 & 2) == 0) {
    return result;
  }
LABEL_12:
  if (*(unsigned char *)(v1 + 81))
  {
    uint64_t v5 = *(void *)(v1 + 56);
    if ((v5 & 2) != 0)
    {
      v5 &= ~2uLL;
      *(void *)(v1 + 56) = v5;
    }
    if (!v5) {
      goto LABEL_16;
    }
  }
  else
  {
    return (uint64_t)sub_100027830();
  }
  return result;
}

uint64_t sub_100026B64()
{
  uint64_t v1 = v0;
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063260);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Configuring CBController", v5, 2u);
    swift_slowDealloc();
  }

  unsigned int v6 = *(void **)(v1 + 64);
  uint64_t v16 = sub_100029F20;
  uint64_t v17 = v1;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  unint64_t v14 = sub_100015768;
  unint64_t v15 = &unk_10005A350;
  uint64_t v7 = _Block_copy(&v12);
  swift_retain_n();
  swift_release();
  [v6 setBluetoothStateChangedHandler:v7];
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100029F18;
  *(void *)(v8 + 24) = v1;
  uint64_t v16 = sub_100029F60;
  uint64_t v17 = v8;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  unint64_t v14 = sub_100015768;
  unint64_t v15 = &unk_10005A3A0;
  uint64_t v9 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  [v6 setInterruptionHandler:v9];
  _Block_release(v9);
  uint64_t v16 = sub_100029F68;
  uint64_t v17 = v1;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  unint64_t v14 = sub_1000145BC;
  unint64_t v15 = &unk_10005A3C8;
  uint64_t v10 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  [v6 activateWithCompletion:v10];
  _Block_release(v10);
  return swift_release();
}

void sub_100026E2C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  v3[4] = sub_100029F68;
  v3[5] = a1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 1107296256;
  v3[2] = sub_1000145BC;
  v3[3] = &unk_10005A3F0;
  uint64_t v2 = _Block_copy(v3);
  swift_retain();
  swift_release();
  [v1 activateWithCompletion:v2];
  _Block_release(v2);
}

void sub_100026EF4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100062978 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005F6C(v2, (uint64_t)qword_100063260);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v5 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Unable to activate CBController: %@", v4, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
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
  }
  else
  {
    *(unsigned char *)(a2 + 80) = 1;
    *(unsigned char *)(a2 + 84) = [*(id *)(a2 + 64) bluetoothState] == (id)5;
    uint64_t v7 = *(void *)(a2 + 56);
    if (v7)
    {
      v7 &= ~1uLL;
      *(void *)(a2 + 56) = v7;
    }
    if (!v7)
    {
      uint64_t v8 = *(void (**)(uint64_t))(a2 + 24);
      if (v8)
      {
        uint64_t v9 = swift_retain();
        v8(v9);
        sub_100005A34((uint64_t)v8);
        uint64_t v10 = *(void *)(a2 + 24);
      }
      else
      {
        uint64_t v10 = 0;
      }
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      sub_100005A34(v10);
    }
  }
}

void sub_100027194(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  *(unsigned char *)(a1 + 84) = [v2 bluetoothState] == (id)5;
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005F6C(v3, (uint64_t)qword_100063260);
  swift_retain_n();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v4, v5))
  {

    swift_release_n();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(a1 + 40);
    if (!v9) {
      return;
    }
    goto LABEL_7;
  }
  unsigned int v6 = (uint8_t *)swift_slowAlloc();
  uint64_t v11 = swift_slowAlloc();
  *(_DWORD *)unsigned int v6 = 136315138;
  sub_100029F70((unint64_t)[v2 bluetoothState]);
  uint64_t v7 = String.init(cString:)();
  sub_100023B0C(v7, v8, &v11);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v4, v5, "New Bluetooth State:  %s", v6, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(a1 + 40);
  if (v9)
  {
LABEL_7:
    uint64_t v10 = *(unsigned __int8 *)(a1 + 84);
    swift_retain();
    v9(v10, 1);
    sub_100005A34((uint64_t)v9);
  }
}

uint64_t sub_1000273AC(uint64_t (*a1)(void))
{
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063260);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Connection to CoreBluetooth interrupted - Re-activating", v5, 2u);
    swift_slowDealloc();
  }

  return a1();
}

void sub_1000274A0()
{
  if ((*(unsigned char *)(v0 + 82) & 1) == 0)
  {
    uint64_t v1 = v0;
    if ((*(unsigned char *)(v0 + 84) & 1) == 0)
    {
      if (qword_100062978 != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      sub_100005F6C(v2, (uint64_t)qword_100063260);
      uint64_t v3 = Logger.logObject.getter();
      os_log_type_t v4 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v3, v4))
      {
        os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Turning on Bluetooth", v5, 2u);
        swift_slowDealloc();
      }

      *(unsigned char *)(v1 + 82) = 1;
      unsigned int v6 = *(void **)(v1 + 64);
      v8[4] = sub_100029F10;
      v8[5] = v1;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 1107296256;
      v8[2] = sub_1000145BC;
      v8[3] = &unk_10005A328;
      uint64_t v7 = _Block_copy(v8);
      swift_retain();
      swift_release();
      [v6 setPowerState:5 completion:v7];
      _Block_release(v7);
    }
  }
}

void sub_100027638(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(unsigned char *)(a2 + 82) = 0;
    swift_errorRetain();
    if (qword_100062978 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005F6C(v2, (uint64_t)qword_100063260);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *os_log_type_t v5 = v7;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Unable to turn on Bluetooth: %@", v4, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
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
  }
}

id sub_100027830()
{
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005F6C(v1, (uint64_t)qword_100063260);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Configuring CWFInterface", v4, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v5 = *(void **)(v0 + 72);
  uint64_t v24 = sub_100029F00;
  uint64_t v25 = v0;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  id v22 = sub_10000E4BC;
  uint64_t v23 = &unk_10005A2D8;
  unsigned int v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v5 setEventHandler:v6];
  _Block_release(v6);
  uint64_t v24 = sub_100029F08;
  uint64_t v25 = v0;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v21 = 1107296256;
  id v22 = sub_100015768;
  uint64_t v23 = &unk_10005A300;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v5 setInterruptionHandler:v7];
  _Block_release(v7);
  [v5 activate];
  id aBlock = 0;
  if ([v5 startMonitoringEventType:1 error:&aBlock])
  {
    id v8 = aBlock;
  }
  else
  {
    id v9 = aBlock;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      id aBlock = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v13 = Error.localizedDescription.getter();
      sub_100023B0C(v13, v14, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "unable to monitor Wi-Fi events, error: %s", v12, 0xCu);
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
  }
  *(unsigned char *)(v0 + 81) = 1;
  id result = [v5 powerOn];
  *(unsigned char *)(v0 + 86) = (_BYTE)result;
  uint64_t v16 = *(void *)(v0 + 56);
  if ((v16 & 2) != 0)
  {
    unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFFDLL;
    *(void *)(v0 + 56) = v17;
    if (!v17)
    {
      id v18 = *(void (**)(uint64_t))(v0 + 24);
      if (v18)
      {
        uint64_t v19 = swift_retain();
        v18(v19);
        return (id)sub_100005A34((uint64_t)v18);
      }
    }
  }
  return result;
}

id sub_100027C84(void *a1, uint64_t a2)
{
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005F6C(v4, (uint64_t)qword_100063260);
  id v5 = a1;
  unsigned int v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "CWFInterface event %@", v8, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id result = [v5 type];
  if (result == (id)1)
  {
    *(unsigned char *)(a2 + 83) = 0;
    id result = [*(id *)(a2 + 72) powerOn];
    *(unsigned char *)(a2 + 86) = (_BYTE)result;
    uint64_t v12 = *(void *)(a2 + 56);
    if (!v12)
    {
      unint64_t v17 = *(void (**)(id, uint64_t))(a2 + 40);
      if (!v17) {
        return result;
      }
      id v18 = result;
      swift_retain();
      v17(v18, 2);
      uint64_t v16 = (uint64_t)v17;
      return (id)sub_100005A34(v16);
    }
    if ((v12 & 2) != 0)
    {
      unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFDLL;
      *(void *)(a2 + 56) = v13;
      if (!v13)
      {
        unint64_t v14 = *(void (**)(uint64_t))(a2 + 24);
        if (v14)
        {
          uint64_t v15 = swift_retain();
          v14(v15);
          uint64_t v16 = (uint64_t)v14;
          return (id)sub_100005A34(v16);
        }
      }
    }
  }
  return result;
}

id sub_100027ED0(uint64_t a1)
{
  if (qword_100062978 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063260);
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Connection to CoreWiFi interrupted - Re-activating", v5, 2u);
    swift_slowDealloc();
  }

  unsigned int v6 = *(void **)(a1 + 72);

  return [v6 activate];
}

uint64_t sub_100027FC8()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v0 + 83) & 1) == 0 && (*(unsigned char *)(v0 + 86) & 1) == 0)
  {
    *(unsigned char *)(v0 + 83) = 1;
    uint64_t v14 = *(void *)(v0 + 16);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_100029E40;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100015768;
    aBlock[3] = &unk_10005A288;
    unint64_t v13 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v15 = &_swiftEmptyArrayStorage;
    sub_100029E60((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000BEA4((uint64_t *)&unk_100063190);
    sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    os_log_type_t v11 = v13;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v11);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1000282A0()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v30 = v5;
    if (qword_100062978 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100005F6C(v10, (uint64_t)qword_100063260);
    os_log_type_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Turning on Wi-Fi", v13, 2u);
      swift_slowDealloc();
    }

    uint64_t v14 = *(void **)(v9 + 72);
    aBlock[0] = 0;
    unsigned int v15 = [v14 setPower:1 error:aBlock];
    id v16 = aBlock[0];
    if (v15)
    {
      *(unsigned char *)(v9 + 83) = 0;
      id v17 = v16;
      *(unsigned char *)(v9 + 86) = [v14 powerOn];
      sub_100024B64();
      uint64_t v29 = static OS_dispatch_queue.main.getter();
      id v18 = (void *)swift_allocObject();
      swift_weakInit();
      aBlock[4] = sub_100029EF8;
      aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_100015768;
      aBlock[3] = &unk_10005A2B0;
      uint64_t v19 = _Block_copy(aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      id v31 = &_swiftEmptyArrayStorage;
      sub_100029E60((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      uint64_t v28 = v4;
      sub_10000BEA4((uint64_t *)&unk_100063190);
      sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
      dispatch thunk of SetAlgebra.init<A>(_:)();
      id v20 = (void *)v29;
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v19);
      swift_release();

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v28);
      swift_release();
      swift_release();
    }
    else
    {
      id v21 = aBlock[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
      *(unsigned char *)(v9 + 83) = 0;
      swift_errorRetain();
      swift_errorRetain();
      id v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 138412290;
        swift_errorRetain();
        id v26 = (void *)_swift_stdlib_bridgeErrorToNSError();
        aBlock[0] = v26;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v25 = v26;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to turn on Wi-Fi: %@", v24, 0xCu);
        sub_10000BEA4(&qword_100062ED8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_release();

        swift_errorRelease();
      }
      else
      {
        swift_release();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
  }
}

uint64_t sub_100028844()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void *)(result + 56);
    if (v1)
    {
      if ((v1 & 2) == 0) {
        return swift_release();
      }
      unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFFDLL;
      *(void *)(result + 56) = v2;
      if (v2) {
        return swift_release();
      }
      uint64_t v3 = *(void (**)(uint64_t))(result + 24);
      if (!v3) {
        return swift_release();
      }
      uint64_t v4 = swift_retain();
      v3(v4);
    }
    else
    {
      uint64_t v3 = *(void (**)(uint64_t))(result + 40);
      if (!v3) {
        return swift_release();
      }
      uint64_t v5 = *(unsigned __int8 *)(result + 86);
      swift_retain();
      ((void (*)(uint64_t, uint64_t))v3)(v5, 2);
    }
    sub_100005A34((uint64_t)v3);
    return swift_release();
  }
  return result;
}

uint64_t sub_10002890C()
{
  [*(id *)(v0 + 64) invalidate];
  [*(id *)(v0 + 72) invalidate];

  sub_100005A34(*(void *)(v0 + 24));
  sub_100005A34(*(void *)(v0 + 40));

  return v0;
}

uint64_t sub_100028970()
{
  sub_10002890C();

  return _swift_deallocClassInstance(v0, 88, 7);
}

unsigned char *sub_1000289A4()
{
  uint64_t v1 = (unsigned char *)v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  v14[0] = sub_100024B64();
  static DispatchQoS.userInitiated.getter();
  v14[1] = &_swiftEmptyArrayStorage;
  sub_100029E60((unint64_t *)&unk_100063D80, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000BEA4(&qword_1000634D8);
  sub_100029EA8(&qword_100063D90, &qword_1000634D8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v2);
  *(void *)(v0 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = [objc_allocWithZone((Class)CBController) init];
  *(void *)(v0 + 72) = [objc_allocWithZone((Class)CWFInterface) initWithServiceType:1];
  *(_DWORD *)(v0 + 80) = 0;
  *(unsigned char *)(v0 + 84) = 0;
  uint64_t v8 = self;
  uint64_t result = [v8 sharedConnection];
  if (result)
  {
    uint64_t v10 = result;
    unsigned __int8 v11 = [result isBluetoothModificationAllowed];

    v1[85] = v11;
    v1[86] = 0;
    uint64_t result = [v8 sharedConnection];
    if (result)
    {
      os_log_type_t v12 = result;
      unsigned __int8 v13 = [result isWiFiPowerModificationAllowed];

      v1[87] = v13;
      return v1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t OptionSet<>.elements.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __chkstk_darwin(AssociatedTypeWitness);
  swift_checkMetadataState();
  uint64_t v6 = swift_allocBox();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v7 = swift_allocBox();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v8[5] = v6;
  void v8[6] = v7;
  type metadata accessor for AnyIterator();
  swift_getWitnessTable();
  return AnySequence.init<A>(_:)();
}

uint64_t sub_100028EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  os_log_type_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  uint64_t v12[3] = a4;
  v12[4] = a5;
  v12[5] = a1;
  v12[6] = a2;
  swift_retain();
  swift_retain();
  uint64_t result = AnyIterator.init(_:)();
  *a6 = result;
  return result;
}

uint64_t sub_100028F58@<X0>(uint64_t *a1@<X8>)
{
  return sub_100028EB0(v1[5], v1[6], v1[2], v1[3], v1[4], a1);
}

uint64_t sub_100028F68@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v58 = a4;
  uint64_t v65 = a3;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 8) + 24) + 16);
  uint64_t v64 = a2;
  uint64_t v57 = *(void *)(a2 + 8);
  uint64_t v66 = a1;
  swift_getAssociatedTypeWitness();
  uint64_t v63 = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __chkstk_darwin(AssociatedTypeWitness);
  id v61 = (char *)&v53 - v5;
  uint64_t v6 = swift_checkMetadataState();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v54 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  id v55 = (char *)&v53 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  id v59 = (char *)&v53 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  char v67 = (char *)&v53 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  id v68 = (char *)&v53 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v60 = (char *)&v53 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  id v22 = (char *)&v53 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v53 - v23;
  uint64_t v25 = swift_projectBox();
  uint64_t v26 = swift_projectBox();
  swift_beginAccess();
  uint64_t v70 = v25;
  swift_beginAccess();
  uint64_t v69 = v26;
  swift_beginAccess();
  uint64_t v27 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v56 = v7;
  uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v72 = v7 + 16;
  v71(v24, v70, v6);
  while (1)
  {
    if (dispatch thunk of static BinaryInteger.isSigned.getter())
    {
      if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64) {
        goto LABEL_13;
      }
    }
    else
    {
      char v29 = dispatch thunk of static BinaryInteger.isSigned.getter();
      uint64_t v30 = dispatch thunk of BinaryInteger.bitWidth.getter();
      if (v29)
      {
        if (v30 <= 64)
        {
          swift_getAssociatedConformanceWitness();
          dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
          dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
          char v31 = dispatch thunk of static Comparable.>= infix(_:_:)();
          id v32 = *v27;
          (*v27)(v22, v6);
          uint64_t v33 = v60;
          v71(v60, (uint64_t)v24, v6);
          if (v31)
          {
            uint64_t v34 = dispatch thunk of BinaryInteger._lowWord.getter();
            v32(v33, v6);
            v32(v24, v6);
            if (!v34) {
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v58, 1, 1);
            }
          }
          else
          {
            v32(v33, v6);
            v32(v24, v6);
          }
          goto LABEL_16;
        }
      }
      else if (v30 < 64)
      {
LABEL_13:
        uint64_t v35 = dispatch thunk of BinaryInteger._lowWord.getter();
        id v32 = *v27;
        (*v27)(v24, v6);
        if (!v35) {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v58, 1, 1);
        }
        goto LABEL_16;
      }
    }
    uint64_t v73 = 0;
    sub_100029FE8();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v36 = dispatch thunk of static Equatable.== infix(_:_:)();
    id v32 = *v27;
    (*v27)(v22, v6);
    v32(v24, v6);
    if (v36) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v58, 1, 1);
    }
LABEL_16:
    id v37 = v71;
    v71(v22, v70, v6);
    id v38 = v67;
    v37(v67, v69, v6);
    id v39 = v68;
    dispatch thunk of static BinaryInteger.& infix(_:_:)();
    v32(v38, v6);
    v32(v22, v6);
    if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) == 0) {
      break;
    }
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64) {
      goto LABEL_2;
    }
LABEL_24:
    uint64_t v44 = dispatch thunk of BinaryInteger._lowWord.getter();
LABEL_25:
    v32(v39, v6);
    if (v44) {
      goto LABEL_30;
    }
LABEL_3:
    sub_1000299A0(v69);
    v71(v24, v70, v6);
  }
  char v40 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v41 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v40 & 1) == 0)
  {
    if (v41 >= 64)
    {
LABEL_2:
      uint64_t v73 = 0;
      sub_100029FE8();
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v28 = dispatch thunk of static Equatable.== infix(_:_:)();
      v32(v22, v6);
      v32(v39, v6);
      if ((v28 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_3;
    }
    goto LABEL_24;
  }
  if (v41 > 64) {
    goto LABEL_2;
  }
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  id v39 = v68;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  char v42 = dispatch thunk of static Comparable.>= infix(_:_:)();
  v32(v22, v6);
  id v43 = v59;
  v71(v59, (uint64_t)v39, v6);
  if (v42)
  {
    uint64_t v44 = dispatch thunk of BinaryInteger._lowWord.getter();
    v32(v43, v6);
    goto LABEL_25;
  }
  v32(v43, v6);
  v32(v39, v6);
LABEL_30:
  uint64_t v46 = v70;
  swift_beginAccess();
  id v47 = v71;
  v71(v67, v46, v6);
  uint64_t v48 = v69;
  swift_beginAccess();
  uint64_t v49 = v54;
  v47(v54, v48, v6);
  uint64_t v50 = v55;
  dispatch thunk of static BinaryInteger.~ prefix(_:)();
  v32(v49, v6);
  id v51 = v67;
  dispatch thunk of static BinaryInteger.& infix(_:_:)();
  v32(v50, v6);
  v32(v51, v6);
  uint64_t v52 = v70;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 40))(v52, v22, v6);
  swift_beginAccess();
  v47(v22, v48, v6);
  dispatch thunk of RawRepresentable.init(rawValue:)();
  return sub_1000299A0(v48);
}

uint64_t sub_1000299A0(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v3 = swift_checkMetadataState();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = &v15[-v9];
  __chkstk_darwin(v8);
  uint64_t v12 = &v15[-v11];
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v10, a1, v3);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  dispatch thunk of static FixedWidthInteger.&* infix(_:_:)();
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v13(v7, v3);
  v13(v10, v3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v4 + 40))(a1, v12, v3);
}

uint64_t type metadata accessor for ASUISystemMonitor()
{
  return self;
}

ValueMetadata *type metadata accessor for ASUISystemCapabilities()
{
  return &type metadata for ASUISystemCapabilities;
}

unint64_t sub_100029C74()
{
  unint64_t result = qword_1000634B8;
  if (!qword_1000634B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000634B8);
  }
  return result;
}

unint64_t sub_100029CCC()
{
  unint64_t result = qword_1000634C0;
  if (!qword_1000634C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000634C0);
  }
  return result;
}

unint64_t sub_100029D24()
{
  unint64_t result = qword_1000634C8;
  if (!qword_1000634C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000634C8);
  }
  return result;
}

unint64_t sub_100029D7C()
{
  unint64_t result = qword_1000634D0;
  if (!qword_1000634D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000634D0);
  }
  return result;
}

uint64_t sub_100029DD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100029E08()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100029E40()
{
}

uint64_t sub_100029E48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029E58()
{
  return swift_release();
}

uint64_t sub_100029E60(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100029EA8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D7F4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100029EF8()
{
  return sub_100028844();
}

id sub_100029F00(void *a1)
{
  return sub_100027C84(a1, v1);
}

id sub_100029F08()
{
  return sub_100027ED0(v0);
}

void sub_100029F10(uint64_t a1)
{
  sub_100027638(a1, v1);
}

void sub_100029F18()
{
  sub_100026E2C(v0);
}

void sub_100029F20()
{
  sub_100027194(v0);
}

uint64_t sub_100029F28()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100029F60()
{
  return sub_1000273AC(*(uint64_t (**)(void))(v0 + 16));
}

void sub_100029F68(uint64_t a1)
{
  sub_100026EF4(a1, v1);
}

const char *sub_100029F70(unint64_t a1)
{
  if (a1 > 0xA) {
    return "?";
  }
  else {
    return off_10005A440[a1];
  }
}

uint64_t sub_100029F98()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100029FD8@<X0>(uint64_t a1@<X8>)
{
  return sub_100028F68(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_100029FE8()
{
  unint64_t result = qword_1000634E0;
  if (!qword_1000634E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000634E0);
  }
  return result;
}

void sub_10002A080()
{
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 setSubtitle:v2];

  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_10002AC04;
  uint64_t v17 = v3;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_10002F814;
  uint64_t v15 = &unk_10005A520;
  uint64_t v5 = _Block_copy(&v12);
  uint64_t v6 = self;
  id v7 = [v6 actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();
  [v7 setEnabled:0];

  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_10002AC24;
  uint64_t v17 = v8;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_10002F814;
  uint64_t v15 = &unk_10005A548;
  uint64_t v10 = _Block_copy(&v12);
  id v11 = [v6 actionWithTitle:v9 style:1 handler:v10];

  _Block_release(v10);
  swift_release();
  swift_release();

  [v0 setNumberOfDigits:6];
}

void sub_10002A37C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v1 = (void *)Strong;
    sub_10002A3D0();
  }
}

char *sub_10002A3D0()
{
  sub_10002FCB4();
  id v1 = [v0 passcodeEntryView];
  [v1 resignFirstResponder];

  id v2 = [v0 passcodeEntryView];
  [v2 setEnabled:0];

  uint64_t v3 = &v0[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext];
  swift_beginAccess();
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *((void *)v3 + 1);
  uint64_t v6 = *((void *)v3 + 2);
  uint64_t v7 = *((void *)v3 + 8);
  *(void *)uint64_t v3 = 1;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  uint64_t v14 = v7;
  sub_10000CBC4(v4, v5, v6);
  swift_beginAccess();
  if (*((void *)v3 + 2) != 1)
  {
    char *v3 = 1;
    id v8 = [v0 passcodeEntryView:v14];
    id v9 = [v8 text];

    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    *((void *)v3 + 3) = v10;
    *((void *)v3 + 4) = v12;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  unint64_t result = (char *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100036338((uint64_t)v0, result);
    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_10002A564()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext;
    swift_beginAccess();
    uint64_t v3 = *(void *)v2;
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    uint64_t v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_100036338((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10002A6BC(void *a1)
{
  id v2 = [a1 text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v3 >= (uint64_t)[v1 numberOfDigits]) {
    return;
  }
  id v4 = [v1 actions];
  sub_10002AC2C();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_12;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v6 = *(id *)(v5 + 32);
    goto LABEL_7;
  }
LABEL_13:
  id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_7:
  id v8 = v6;
  swift_bridgeObjectRelease();
  [v8 setEnabled:0];
}

uint64_t type metadata accessor for ASUIPasskeyEntryViewController()
{
  return self;
}

uint64_t sub_10002AB04()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_type);
}

uint64_t sub_10002AB14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_routingContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v13 = v3[8];
  uint64_t result = sub_10000CA8C(*v3, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v13;
  return result;
}

uint64_t sub_10002ABCC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002AC04()
{
}

uint64_t sub_10002AC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002AC1C()
{
  return swift_release();
}

void sub_10002AC24()
{
}

unint64_t sub_10002AC2C()
{
  unint64_t result = qword_100063528;
  if (!qword_100063528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100063528);
  }
  return result;
}

void sub_10002AC74(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  char v40 = sub_10002B6C0;
  uint64_t v41 = v5;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  id v38 = sub_10002F814;
  id v39 = &unk_10005A5F8;
  uint64_t v7 = _Block_copy(&aBlock);
  uint64_t v8 = self;
  id v9 = [v8 actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();
  uint64_t v35 = v9;

  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  char v40 = sub_10002B6E0;
  uint64_t v41 = v10;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  id v38 = sub_10002F814;
  id v39 = &unk_10005A620;
  uint64_t v12 = _Block_copy(&aBlock);
  id v13 = [v8 actionWithTitle:v11 style:1 handler:v12];

  _Block_release(v12);
  swift_release();
  swift_release();

  id v14 = [objc_allocWithZone((Class)UILabel) init];
  sub_10002B6E8(a1 + 120, (uint64_t)v42);
  sub_10002B6E8((uint64_t)v42, (uint64_t)&aBlock);
  if (v37)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    [v14 setText:v15];

    id v16 = [self monospacedDigitSystemFontOfSize:48.0 weight:UIFontWeightMedium];
    [v14 setFont:v16];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v17 = [v1 contentView];
    [v17 addSubview:v14];

    id v18 = [v1 contentView];
    id v19 = [v18 mainContentGuide];

    uint64_t v20 = self;
    sub_10000BEA4(&qword_100062D98);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100049290;
    id v22 = [v14 topAnchor];
    id v23 = [v19 topAnchor];
    id v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];

    *(void *)(v21 + 32) = v24;
    id v25 = [v14 bottomAnchor];
    id v26 = [v19 bottomAnchor];
    id v27 = [v25 constraintLessThanOrEqualToAnchor:v26];

    *(void *)(v21 + 40) = v27;
    id v28 = [v14 centerXAnchor];
    id v29 = [v19 centerXAnchor];
    id v30 = [v28 constraintEqualToAnchor:v29];

    *(void *)(v21 + 48) = v30;
    id v31 = [v14 centerYAnchor];
    id v32 = [v19 centerYAnchor];
    id v33 = [v31 constraintEqualToAnchor:v32];

    *(void *)(v21 + 56) = v33;
    specialized Array._endMutation()();
    sub_10000CB84();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v20 activateConstraints:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_10002B280()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    sub_10002FCB4();
    uint64_t v2 = &v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext];
    uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext + 8];
    uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext + 16];
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*((void *)v2 + 2) != 1) {
      *uint64_t v2 = 1;
    }
    NSString v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_100036368((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10002B364()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext;
    uint64_t v3 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext);
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    NSString v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_100036368((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for ASUINumericComparisonViewController()
{
  return self;
}

uint64_t sub_10002B5D4()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_type);
}

uint64_t sub_10002B5E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10002B688()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002B6C0()
{
}

uint64_t sub_10002B6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002B6D8()
{
  return swift_release();
}

void sub_10002B6E0()
{
}

uint64_t sub_10002B6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BEA4((uint64_t *)&unk_100063570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B758()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100063580);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100063580);
  if (qword_1000628E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A10);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_10002B9DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  return self;
}

void sub_10002BA44(void *a1, void *a2)
{
  uint64_t v3 = v2;
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = a1;
    id v9 = [v7 configurationIdentifier];
    if (v9)
    {

      [v7 setOrientationChangedEventsDisabled:1];
      [v7 setAllowsMenuButtonDismissal:0];
      [v7 setDesiredHardwareButtonEvents:0];
      id v10 = objc_allocWithZone((Class)type metadata accessor for ASUIHostingWindow());
      id v36 = v8;
      id v11 = sub_100005388(v7, a2);
      uint64_t v12 = OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window;
      id v13 = *(void **)(v3 + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window);
      *(void *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI24RemoteAlertSceneDelegate_window) = v11;

      id v14 = [objc_allocWithZone((Class)type metadata accessor for ASUIRootViewController()) init];
      id v15 = [v14 view];
      if (v15)
      {
        id v16 = v15;
        sub_10002BF78();
        static Color.clear.getter();
        id v17 = (void *)UIColor.init(_:)();
        [v16 setBackgroundColor:v17];

        id v18 = [v14 view];
        if (v18)
        {
          id v19 = v18;
          id v20 = [v18 layer];

          [v20 setAllowsHitTesting:0];
          uint64_t v21 = *(void **)(v3 + v12);
          if (v21)
          {
            [v21 setRootViewController:v14];
            id v22 = *(void **)(v3 + v12);
            if (v22)
            {
              [v22 makeKeyAndVisible];
              id v23 = *(void **)(v3 + v12);
              if (v23)
              {
                id v24 = v23;
                [v24 setHidden:0];
              }
            }
          }

          goto LABEL_22;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
    if (qword_100062988 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_100005F6C(v31, (uint64_t)qword_100063580);
    id v36 = v8;
    id v26 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      *(_DWORD *)id v33 = 138412290;
      uint64_t v37 = (uint64_t)v7;
      id v35 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v34 = v7;

      _os_log_impl((void *)&_mh_execute_header, v26, v32, "Could not find configuration identifier on remote alert scene: %@", v33, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_18;
    }
  }
  else
  {
    if (qword_100062988 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_100005F6C(v25, (uint64_t)qword_100063580);
    id v36 = a1;
    id v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)id v28 = 136315138;
      swift_getObjectType();
      uint64_t v29 = _typeName(_:qualified:)();
      sub_100023B0C(v29, v30, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Cannot configure scene, expected a remote alert scene but got a scene of type: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
LABEL_18:

      return;
    }
  }
LABEL_22:
}

unint64_t sub_10002BF78()
{
  unint64_t result = qword_1000635D0;
  if (!qword_1000635D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000635D0);
  }
  return result;
}

uint64_t type metadata accessor for ASUIListViewController()
{
  return self;
}

uint64_t sub_10002C150()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIListViewController_type);
}

uint64_t sub_10002C160@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIListViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI22ASUIListViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

void sub_10002C204()
{
  sub_10000BEA4((uint64_t *)&unk_100063790);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100049270;
  *(void *)(inited + 32) = 0x696669746E656449;
  *(void *)(inited + 40) = 0xEA00000000007265;
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device;
  uint64_t v3 = *(char **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device);
  if (!v3)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v4 = *(void **)&v3[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = (void *)inited;
  uint64_t v6 = v3;
  id v7 = [v4 identifier];
  if (!v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  v5[6] = v9;
  v5[7] = v11;
  v5[8] = 0x656D614E2041544FLL;
  v5[9] = 0xE800000000000000;
  uint64_t v12 = *(char **)(v0 + v2);
  if (!v12)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  id v14 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v14)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v15 = v12;
  id v16 = [v14 bluetoothOTAName];
  if (v16) {
    goto LABEL_9;
  }
  id v17 = *(void **)&v12[v13];
  if (v17)
  {
    id v16 = [v17 SSID];
    if (!v16)
    {

      uint64_t v18 = 0;
      unint64_t v20 = 0xE000000000000000;
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

LABEL_10:
    v5[10] = v18;
    v5[11] = v20;
    sub_10002FB90((uint64_t)v5);
    return;
  }
LABEL_17:
  __break(1u);
}

void sub_10002C3A8()
{
  v27.receiver = v0;
  v27.super_class = (Class)type metadata accessor for ASUIDeviceInfoPopoverViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  uint64_t v3 = self;
  id v4 = [v3 systemWhiteColor];
  [v2 setBackgroundColor:v4];

  [v0 preferredContentSize];
  double v6 = v5;
  id v7 = [v0 view];
  if (!v7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  [v7 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  id v17 = [objc_allocWithZone((Class)UITableView) initWithFrame:2, 0.0, 0.0, v6 + -20.0, CGRectGetHeight(v28)];
  uint64_t v18 = OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView;
  unint64_t v19 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView] = v17;

  unint64_t v20 = *(void **)&v0[v18];
  if (!v20)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  [v20 setDelegate:v0];
  uint64_t v21 = *(void **)&v0[v18];
  if (!v21)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  [v21 setDataSource:v0];
  id v22 = *(void **)&v0[v18];
  if (!v22)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v23 = v22;
  id v24 = [v3 systemGroupedBackgroundColor];
  [v23 setBackgroundColor:v24];

  id v25 = [v0 view];
  if (!v25)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(void *)&v0[v18])
  {
    id v26 = v25;
    [v25 addSubview:];

    return;
  }
LABEL_15:
  __break(1u);
}

id sub_10002C898(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView] = 0;
  double v5 = &v3[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_idKey];
  *(void *)double v5 = 0x696669746E656449;
  *((void *)v5 + 1) = 0xEA00000000007265;
  double v6 = &v3[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_otaKey];
  *(void *)double v6 = 0x656D614E2041544FLL;
  *((void *)v6 + 1) = 0xE800000000000000;
  id v7 = &v3[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_typeKey];
  *(void *)id v7 = 0x7954207465737341;
  *((void *)v7 + 1) = 0xEA00000000006570;
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
  v11.super_class = (Class)type metadata accessor for ASUIDeviceInfoPopoverViewController();
  [super initWithNibName:v8 bundle:a3];

  return v9;
}

id sub_10002CA00(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_tableView] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_idKey];
  *(void *)uint64_t v3 = 0x696669746E656449;
  *((void *)v3 + 1) = 0xEA00000000007265;
  id v4 = &v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_otaKey];
  *(void *)id v4 = 0x656D614E2041544FLL;
  *((void *)v4 + 1) = 0xE800000000000000;
  double v5 = &v1[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_typeKey];
  *(void *)double v5 = 0x7954207465737341;
  *((void *)v5 + 1) = 0xEA00000000006570;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ASUIDeviceInfoPopoverViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_10002CB00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIDeviceInfoPopoverViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIDeviceInfoPopoverViewController()
{
  return self;
}

unint64_t sub_10002CBE0()
{
  uint64_t v1 = type metadata accessor for UIListContentConfiguration();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v21[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_idKey + 8);
  v22[0] = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_idKey);
  v22[1] = v5;
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_otaKey + 8);
  v22[2] = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_otaKey);
  v22[3] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t result = IndexPath.row.getter();
  if (result > 1)
  {
    __break(1u);
  }
  else
  {
    objc_super v8 = &v22[2 * result];
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    swift_bridgeObjectRetain();
    swift_arrayDestroy();
    sub_10002C204();
    if (*(void *)(v11 + 16))
    {
      swift_bridgeObjectRetain();
      sub_10001B800(v9, v10);
      if (v12) {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    id v13 = [objc_allocWithZone((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:0];
    UITableViewCell.defaultContentConfiguration()();
    UIListContentConfiguration.text.setter();
    UIListContentConfiguration.secondaryText.setter();
    CGFloat v14 = self;
    id v15 = [v14 labelColor];
    CGFloat v16 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v16(v21, 0);
    id v17 = [v14 secondaryLabelColor];
    uint64_t v18 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v18(v21, 0);
    v21[3] = v1;
    v21[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    unint64_t v19 = sub_10002CEC4(v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v19, v4, v1);
    UITableViewCell.contentConfiguration.setter();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (unint64_t)v13;
  }
  return result;
}

uint64_t *sub_10002CEC4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_10002CF28(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_restrictedCapabilities] = *(void *)(a1 + 184);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_10002D928;
  uint64_t v42 = v5;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256;
  id v39 = sub_10002F814;
  char v40 = &unk_10005A730;
  id v7 = _Block_copy(&aBlock);
  objc_super v8 = self;
  id v36 = [v8 actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();

  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_10002D948;
  uint64_t v42 = v9;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v38 = 1107296256;
  id v39 = sub_10002F814;
  char v40 = &unk_10005A758;
  uint64_t v11 = _Block_copy(&aBlock);
  id v12 = [v8 actionWithTitle:v10 style:1 handler:v11];

  _Block_release(v11);
  swift_release();
  swift_release();

  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v14 = [self _systemImageNamed:v13];

  id v15 = [objc_allocWithZone((Class)UIImageView) initWithImage:v14];
  id v16 = [self systemBlueColor];
  [v15 setTintColor:v16];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [self configurationWithPointSize:72.0];
  [v15 setPreferredSymbolConfiguration:v17];

  id v18 = [v1 contentView];
  [v18 addSubview:v15];

  id v19 = [v1 contentView];
  id v20 = [v19 mainContentGuide];

  uint64_t v21 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100049290;
  id v23 = [v15 topAnchor];
  id v24 = [v20 topAnchor];
  id v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];

  *(void *)(v22 + 32) = v25;
  id v26 = [v15 bottomAnchor];
  id v27 = [v20 bottomAnchor];
  id v28 = [v26 constraintLessThanOrEqualToAnchor:v27];

  *(void *)(v22 + 40) = v28;
  id v29 = [v15 centerXAnchor];
  id v30 = [v20 centerXAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v22 + 48) = v31;
  id v32 = [v15 centerYAnchor];
  id v33 = [v20 centerYAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];

  *(void *)(v22 + 56) = v34;
  id aBlock = (void **)v22;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v21 activateConstraints:isa];
}

void sub_10002D5D8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      sub_100036398((uint64_t)v1, v2);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10002D65C()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong) {
}
  }

uint64_t type metadata accessor for ASUITransportsRestrictedViewController()
{
  return self;
}

uint64_t sub_10002D83C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_type);
}

uint64_t sub_10002D84C@<X0>(uint64_t *a1@<X8>)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10002D8F0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002D928()
{
}

uint64_t sub_10002D930(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002D940()
{
  return swift_release();
}

void sub_10002D948()
{
}

void sub_10002D958()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
  if (!v2)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v3 = v0;
  id v4 = [v2 discoveryConfiguration];
  if (!v4)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v5 = v4;
  id v6 = [v4 associationIdentifier];

  if (!v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = 43;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(v3 + v1);
  if (!v8)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v9 = [v8 bluetoothOTAName];
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = *(void **)(v3 + v1);
  if (v10)
  {
    id v9 = [v10 SSID];
    if (!v9)
    {
      uint64_t v11 = 0;
      NSString v13 = (void *)0xE000000000000000;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v13 = v12;

LABEL_9:
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_15:
  __break(1u);
}

void sub_10002DAC4()
{
  uint64_t v1 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
  if (!v2)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v3 = v0;
  id v4 = [v2 appAccessInfoMap];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_10002DF74();
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_appBundleID + 8);
    if (!v7)
    {
LABEL_15:
      __break(1u);
      return;
    }
    if (*(void *)(v6 + 16))
    {
      uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_appBundleID);
      swift_bridgeObjectRetain();
      unint64_t v9 = sub_10001B800(v8, v7);
      if (v10)
      {
        id v11 = *(id *)(*(void *)(v6 + 56) + 8 * v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        [v11 state];

        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = *(void **)(v3 + v1);
  if (!v12)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  [v12 state];
}

unint64_t sub_10002DC78()
{
  uint64_t v1 = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8);
  if (v2) {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName);
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2) {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8);
  }
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v3;
  v4._object = v1;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x6369766544414420;
  v5._object = (void *)0xEB00000000203A65;
  String.append(_:)(v5);
  id v6 = *(id *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice);
  sub_10000BEA4(&qword_1000638A8);
  v7._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  return 0xD00000000000001ALL;
}

id sub_10002DDB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIDevice();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIDevice()
{
  return self;
}

id sub_10002DE7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_allowsRename] = 0;
  v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_finishSetupInApp] = 0;
  unint64_t v9 = &v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
  *unint64_t v9 = 0;
  v9[1] = 0;
  v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_needsBluetoothSetup] = 0;
  uint64_t v10 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice] = 0;
  id v11 = &v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_appBundleID];
  *id v11 = 0;
  v11[1] = 0;
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image] = 0;
  *unint64_t v9 = a1;
  v9[1] = a2;
  uint64_t v12 = v5;
  swift_bridgeObjectRelease();
  NSString v13 = *(void **)&v5[v10];
  *(void *)&v5[v10] = a3;
  id v14 = a3;

  *id v11 = a4;
  v11[1] = a5;

  swift_bridgeObjectRelease();
  v16.receiver = v12;
  v16.super_class = (Class)type metadata accessor for ASUIDevice();
  return [super init];
}

unint64_t sub_10002DF74()
{
  unint64_t result = qword_100062DB0;
  if (!qword_100062DB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100062DB0);
  }
  return result;
}

void sub_10002DFB4(uint64_t a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  [v1 setTitle:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v1 setSubtitle:v4];

  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  char v40 = sub_10002EA00;
  uint64_t v41 = v5;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_10002F814;
  id v39 = &unk_10005A808;
  Swift::String v7 = _Block_copy(&aBlock);
  uint64_t v8 = self;
  id v9 = [v8 actionWithTitle:v6 style:0 handler:v7];

  _Block_release(v7);
  swift_release();
  swift_release();
  id v35 = v9;

  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  char v40 = sub_10002EA20;
  uint64_t v41 = v10;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_10002F814;
  id v39 = &unk_10005A830;
  uint64_t v12 = _Block_copy(&aBlock);
  id v13 = [v8 actionWithTitle:v11 style:1 handler:v12];

  _Block_release(v12);
  swift_release();
  swift_release();

  id v14 = [objc_allocWithZone((Class)UILabel) init];
  sub_10002B6E8(a1 + 120, (uint64_t)v42);
  sub_10002B6E8((uint64_t)v42, (uint64_t)&aBlock);
  if (v37)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    [v14 setText:v15];

    id v16 = [self monospacedDigitSystemFontOfSize:48.0 weight:UIFontWeightMedium];
    [v14 setFont:v16];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v17 = [v1 contentView];
    [v17 addSubview:v14];

    id v18 = [v1 contentView];
    id v19 = [v18 mainContentGuide];

    id v20 = self;
    sub_10000BEA4(&qword_100062D98);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100049290;
    id v22 = [v14 topAnchor];
    id v23 = [v19 topAnchor];
    id v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];

    *(void *)(v21 + 32) = v24;
    id v25 = [v14 bottomAnchor];
    id v26 = [v19 bottomAnchor];
    id v27 = [v25 constraintLessThanOrEqualToAnchor:v26];

    *(void *)(v21 + 40) = v27;
    id v28 = [v14 centerXAnchor];
    id v29 = [v19 centerXAnchor];
    id v30 = [v28 constraintEqualToAnchor:v29];

    *(void *)(v21 + 48) = v30;
    id v31 = [v14 centerYAnchor];
    id v32 = [v19 centerYAnchor];
    id v33 = [v31 constraintEqualToAnchor:v32];

    *(void *)(v21 + 56) = v33;
    specialized Array._endMutation()();
    sub_10000CB84();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v20 activateConstraints:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_10002E5C0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    sub_10002FCB4();
    objc_super v2 = &v1[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext];
    uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext + 8];
    uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext + 16];
    *(void *)objc_super v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*((void *)v2 + 2) != 1) {
      *objc_super v2 = 1;
    }
    NSString v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_1000363C8((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10002E6A4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext;
    uint64_t v3 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext);
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    NSString v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_1000363C8((uint64_t)v1, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for ASUIPasskeyDisplayViewController()
{
  return self;
}

uint64_t sub_10002E914()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_type);
}

uint64_t sub_10002E924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_10002E9C8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002EA00()
{
}

uint64_t sub_10002EA08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002EA18()
{
  return swift_release();
}

void sub_10002EA20()
{
}

id sub_10002EBC8()
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
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t *productImageBoxHeight.unsafeMutableAddressor()
{
  if (qword_1000629A0 != -1) {
    swift_once();
  }
  return &productImageBoxHeight;
}

void sub_10002ED08()
{
  qword_100063980 = 0x4044000000000000;
}

void sub_10002ED18()
{
  productImageBoxdouble Width = 0x4066800000000000;
}

uint64_t *productImageBoxWidth.unsafeMutableAddressor()
{
  if (qword_100062998 != -1) {
    swift_once();
  }
  return &productImageBoxWidth;
}

void sub_10002ED78()
{
  productImageBoxHeight = 0x405E000000000000;
}

void sub_10002EDB0()
{
  uint64_t v1 = *(void **)(*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_device]
                + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image);
  if (v1) {
    id v2 = *(id *)(*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_device]
  }
               + OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_image);
  else {
    id v2 = *(id *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_defaultSymbolImage];
  }
  id v3 = objc_allocWithZone((Class)UIImageView);
  id v4 = v1;
  id v5 = [v3 initWithImage:v2];

  uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView;
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView] = v5;

  uint64_t v8 = *(void **)&v0[v6];
  if (!v8)
  {
    __break(1u);
    goto LABEL_33;
  }
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = *(void **)&v0[v6];
  if (!v9)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  [v9 setContentMode:1];
  uint64_t v10 = *(void **)&v0[v6];
  if (!v10)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v11 = [v10 layer];
  [v11 setAllowsEdgeAntialiasing:1];

  uint64_t v12 = *(void **)&v0[v6];
  if (!v12)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v13 = [v12 layer];
  [v13 setShouldRasterize:1];

  id v14 = *(void **)&v0[v6];
  if (!v14)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v15 = [v14 layer];
  id v16 = [v0 traitCollection];
  [v16 displayScale];
  double v18 = v17;

  [v15 setRasterizationScale:v18];
  id v19 = self;
  id v20 = [v19 configurationWithPointSize:4 weight:100.0];
  id v21 = [self systemBlueColor];
  id v22 = [v19 configurationWithHierarchicalColor:v21];

  id v23 = [v20 configurationByApplyingConfiguration:v22];
  id v24 = *(void **)&v0[v6];
  if (!v24)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  [v24 setPreferredSymbolConfiguration:v23];
  if (!*(void *)&v0[v6])
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  [v0 addSubview:];
  sub_10000BEA4(&qword_100062D98);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100049290;
  id v26 = *(void **)&v0[v6];
  if (!v26)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  id v27 = [v26 widthAnchor];
  id v28 = *(void **)&v0[v6];
  if (!v28)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  id v29 = [v28 image];
  if (!v29)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  id v30 = v29;
  if (qword_100062998 != -1) {
    swift_once();
  }
  double v31 = *(double *)&productImageBoxWidth;
  if (qword_1000629A0 != -1) {
    swift_once();
  }
  double v32 = *(double *)&productImageBoxHeight;
  [v30 size];
  double v34 = v33;
  [v30 size];
  double v36 = v35;

  if (v31 / v32 >= v34 / v36) {
    double v37 = v32 * (v34 / v36);
  }
  else {
    double v37 = v31;
  }
  id v38 = [v27 constraintEqualToConstant:v37 v31 / v32];

  *(void *)(v25 + 32) = v38;
  id v39 = *(void **)&v0[v6];
  if (!v39) {
    goto LABEL_42;
  }
  id v40 = [v39 heightAnchor];
  uint64_t v41 = *(void **)&v0[v6];
  if (!v41)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  id v42 = [v41 image];
  if (!v42)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  id v43 = v42;
  double v44 = *(double *)&productImageBoxWidth;
  double v45 = *(double *)&productImageBoxHeight;
  [v42 size];
  double v47 = v46;
  [v43 size];
  double v49 = v48;

  if (v44 / v45 >= v47 / v49) {
    double v50 = v45;
  }
  else {
    double v50 = v44 / (v47 / v49);
  }
  id v51 = [v40 constraintEqualToConstant:v50, v44 / v45];

  *(void *)(v25 + 40) = v51;
  uint64_t v52 = *(void **)&v0[v6];
  if (!v52) {
    goto LABEL_45;
  }
  id v53 = [v52 centerXAnchor];
  id v54 = [v0 centerXAnchor];
  id v55 = [v53 constraintEqualToAnchor:v54];

  *(void *)(v25 + 48) = v55;
  uint64_t v56 = *(void **)&v0[v6];
  if (!v56)
  {
LABEL_46:
    __break(1u);
    return;
  }
  uint64_t v57 = self;
  id v58 = [v56 centerYAnchor];
  id v59 = [v0 centerYAnchor];
  id v60 = [v58 constraintEqualToAnchor:v59];

  *(void *)(v25 + 56) = v60;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v57 activateConstraints:isa];
}

void sub_10002F3AC(void *a1)
{
  [v1 bounds];
  [a1 convertRect:v1 fromCoordinateSpace:];
  double x = v27.origin.x;
  double Width = CGRectGetWidth(v27);
  if (Width == 0.0) {
    return;
  }
  if (Width >= 0.0)
  {
    uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView;
    uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView];
    if (v8)
    {
      double v9 = Width;
      [v8 center];
      id v11 = *(void **)&v1[v2];
      if (v11)
      {
        double v3 = v10;
        id v12 = [v11 image];
        if (v12)
        {
          a1 = v12;
          double x = x + v9 + x + v9;
          double v4 = v9 + v9;
          if (qword_100062998 == -1) {
            goto LABEL_7;
          }
          goto LABEL_21;
        }
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  __break(1u);
LABEL_21:
  swift_once();
LABEL_7:
  double v13 = *(double *)&productImageBoxWidth;
  double v14 = x / v4;
  if (qword_1000629A0 != -1) {
    swift_once();
  }
  double v15 = v14 + -1.0;
  double v16 = *(double *)&productImageBoxHeight;
  [a1 size];
  double v18 = v17;
  [a1 size];
  double v20 = v19;

  if (v13 / v16 >= v18 / v20) {
    double v21 = v16 * (v18 / v20);
  }
  else {
    double v21 = v13;
  }
  double v22 = v3 + v21 * -0.5;
  if (qword_100062990 != -1) {
    swift_once();
  }
  CGAffineTransformMakeTranslation(&v26, -(v15 * (v22 + *(double *)&qword_100063980)), 0.0);
  id v23 = *(void **)&v1[v2];
  if (!v23) {
    goto LABEL_25;
  }
  [v23 setTransform:&v26];
  id v24 = *(void **)&v1[v2];
  if (!v24)
  {
LABEL_26:
    __break(1u);
    return;
  }
  double v25 = 1.0 - fabs(v15);
  if (v25 <= 0.3) {
    double v25 = 0.3;
  }
  [v24 setAlpha:v25];
}

id sub_10002F634()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIProductPageView();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIProductPageView()
{
  return self;
}

void sub_10002F6E8()
{
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_imageView] = 0;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [self systemImageNamed:v1];

  if (!v2) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI19ASUIProductPageView_defaultSymbolImage] = v2;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10002F7C0(uint64_t a1, uint64_t a2)
{
  double v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

unint64_t sub_10002F818(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BEA4((uint64_t *)&unk_100063AF0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  double v3 = (void *)v2;
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
    sub_1000247F4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001B800(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10002485C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10002F944(uint64_t a1)
{
  return sub_10002F95C(a1, &qword_100062F30);
}

unint64_t sub_10002F950(uint64_t a1)
{
  return sub_10002F95C(a1, (uint64_t *)&unk_100063B10);
}

unint64_t sub_10002F95C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BEA4(a2);
  double v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_10001B800(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

unint64_t sub_10002FA74(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BEA4(&qword_100062F18);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001B800(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_10002FB90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000BEA4((uint64_t *)&unk_100063B00);
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
    unint64_t result = sub_10001B800(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
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

void sub_10002FCB4()
{
  uint64_t v4 = v0;
  unint64_t v5 = (unint64_t)&selRef_viewDidLoad;
  id v6 = [(SEL *)v0 bottomTray];
  id v7 = [v6 actionButtons];

  sub_10000C108(0, &qword_100063AE8);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  uint64_t v67 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v67) {
    goto LABEL_53;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_54:
    id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_56;
  }
  id v9 = *(id *)(v8 + 32);
LABEL_6:
  char v10 = v9;
  swift_bridgeObjectRelease();
  NSString v11 = String._bridgeToObjectiveC()();
  [v10 setTitle:v11 forState:0];

  id v12 = [(SEL *)v4 bottomTray];
  id v13 = [v12 actionButtons];

  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!(v8 >> 62))
  {
    BOOL v14 = *(void **)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_8;
    }
LABEL_57:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_58;
  }
LABEL_56:
  swift_bridgeObjectRetain();
  BOOL v14 = (void *)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_57;
  }
LABEL_8:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_58:
    id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_11;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_60;
  }
  id v15 = *(id *)(v8 + 32);
LABEL_11:
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  [v16 setEnabled:0];

  id v71 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  BOOL v14 = self;
  id v17 = [v14 systemGrayColor];
  [v71 setColor:v17];

  [v71 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v71 startAnimating];
  id v18 = [(SEL *)v4 bottomTray];
  id v19 = [v18 actionButtons];

  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!(v8 >> 62))
  {
    id v20 = *(id *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20) {
      goto LABEL_13;
    }
LABEL_61:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_62;
  }
LABEL_60:
  swift_bridgeObjectRetain();
  id v20 = (id)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_61;
  }
LABEL_13:
  if ((v8 & 0xC000000000000001) != 0)
  {
LABEL_62:
    id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_16;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_64;
  }
  id v21 = *(id *)(v8 + 32);
LABEL_16:
  double v22 = v21;
  swift_bridgeObjectRelease();
  [v22 addSubview:v71];

  sub_10000BEA4(&qword_100062D98);
  unint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100049250;
  uint64_t v2 = &selRef_viewDidLoad;
  id v20 = [v71 centerXAnchor];
  id v23 = [(SEL *)v4 bottomTray];
  id v24 = [v23 actionButtons];

  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_18;
    }
LABEL_65:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_66;
  }
LABEL_64:
  swift_bridgeObjectRetain();
  uint64_t v68 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v68) {
    goto LABEL_65;
  }
LABEL_18:
  if ((v5 & 0xC000000000000001) != 0)
  {
LABEL_66:
    id v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_21;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_68;
  }
  id v25 = *(id *)(v5 + 32);
LABEL_21:
  CGAffineTransform v26 = v25;
  swift_bridgeObjectRelease();
  id v27 = [v26 v2[25]];

  uint64_t v2 = &selRef_viewDidLoad;
  id v28 = [v20 constraintEqualToAnchor:v27];

  *(void *)(v8 + 32) = v28;
  uint64_t v3 = &selRef_viewDidLoad;
  id v20 = [v71 centerYAnchor];
  id v29 = [(SEL *)v4 bottomTray];
  id v30 = [v29 actionButtons];

  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!(v5 >> 62))
  {
    double v31 = *(_UNKNOWN ***)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v31) {
      goto LABEL_23;
    }
LABEL_69:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_70;
  }
LABEL_68:
  swift_bridgeObjectRetain();
  double v31 = (_UNKNOWN **)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v31) {
    goto LABEL_69;
  }
LABEL_23:
  if ((v5 & 0xC000000000000001) != 0)
  {
LABEL_70:
    double v32 = v2;
    id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_26;
  }
  if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_72;
  }
  double v32 = v2;
  id v33 = *(id *)(v5 + 32);
LABEL_26:
  double v34 = v33;
  swift_bridgeObjectRelease();
  double v31 = NSLayoutConstraint_ptr;
  double v35 = self;
  id v36 = [v34 v3[168]];

  id v37 = [v20 v32[24] v36];
  *(void *)(v8 + 40) = v37;
  specialized Array._endMutation()();
  sub_10000C108(0, (unint64_t *)&qword_100062DA0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v35 activateConstraints:isa];

  unint64_t v5 = (unint64_t)&selRef_viewDidLoad;
  NSString v1 = v4;
  id v39 = [(SEL *)v4 bottomTray];
  uint64_t v4 = (SEL *)&selRef_viewDidLoad;
  id v40 = [v39 actionButtons];

  unint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!(v41 >> 62))
  {
    uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_28;
  }
LABEL_72:
  swift_bridgeObjectRetain();
  uint64_t v42 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_28:
  swift_bridgeObjectRelease();
  if (v42 >= 2)
  {
    id v43 = [v1 *(SEL *)(v5 + 1896)];
    id v44 = [v1 *(SEL *)(v5 + 1896)];
    id v45 = [v44 v4[239]];

    unint64_t v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    if (v46 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v47 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v47 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v47 < 1)
    {
      __break(1u);
    }
    else
    {
      id v48 = [v43 v4[239]];

      unint64_t v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
      double v31 = (_UNKNOWN **)(v46 >> 62);
      if (!(v46 >> 62))
      {
        uint64_t v49 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
        double v50 = &selRef_viewDidLoad;
        id v51 = &selRef_viewDidLoad;
        if (!v49)
        {
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        if (v49 >= v47)
        {
LABEL_35:
          if (v47 != 1 && (v46 & 0xC000000000000001) != 0)
          {
            Swift::Int v52 = 1;
            do
            {
              Swift::Int v53 = v52 + 1;
              _ArrayBuffer._typeCheckSlowPath(_:)(v52);
              Swift::Int v52 = v53;
            }
            while (v47 != v53);
          }
          if (v31)
          {
            swift_bridgeObjectRetain();
            _CocoaArrayWrapper.subscript.getter();
            uint64_t v54 = v58;
            uint64_t v55 = v59;
            unint64_t v61 = v60;
            swift_bridgeObjectRelease_n();
            v61 >>= 1;
            uint64_t v57 = v61 - v55;
            BOOL v56 = (uint64_t)v61 <= v55;
            if (v61 == v55) {
              goto LABEL_49;
            }
          }
          else
          {
            uint64_t v54 = (v46 & 0xFFFFFFFFFFFFFF8) + 32;
            uint64_t v55 = 1;
            uint64_t v57 = v47 - 1;
            BOOL v56 = v47 <= 1;
            if (v47 == 1) {
              goto LABEL_49;
            }
          }
          if (!v56)
          {
            id v62 = (void **)(v54 + 8 * v55);
            do
            {
              uint64_t v63 = *v62++;
              id v64 = v63;
              [v64 v50[196]];
              id v65 = v64;
              id v66 = [v14 v51[248]];
              [v65 setTintColor:v66];

              --v57;
            }
            while (v57);
LABEL_49:

            swift_unknownObjectRelease();
            return;
          }
          goto LABEL_79;
        }
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v69 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    double v50 = &selRef_viewDidLoad;
    id v51 = &selRef_viewDidLoad;
    if (v69 < 1)
    {
LABEL_80:
      __break(1u);
      return;
    }
    swift_bridgeObjectRetain();
    uint64_t v70 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v70 >= v47) {
      goto LABEL_35;
    }
    goto LABEL_77;
  }
}

char *sub_1000306B8()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUINamingViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI24ASUINamingViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_1000255A8((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A0D0;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_1000307DC()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIConnectViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_100031580();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A858;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_1000308F4()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUITransportsRestrictedViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI38ASUITransportsRestrictedViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10002CF28((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A6A8;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030A18()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUITurnOnTransportsViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10001E7D0((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_100059AA0;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030B3C()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIMigrationViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI27ASUIMigrationViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10001F33C();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_100059B78;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030C60()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUILearnMoreViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10000C1BC(v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_100059478;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030D84()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIDoneViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10001FD6C((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_100059C50;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030EA8()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIBluetoothSetupViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_100044860();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005B320;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100030FCC()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIConnectionErrorViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_100024D8C();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A020;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_1000310F0()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIDiscoveryErrorViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_100043E84();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005B248;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100031214()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUINumericComparisonViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI35ASUINumericComparisonViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10002AC74((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A570;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100031338()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIPasskeyDisplayViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI32ASUIPasskeyDisplayViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10002DFB4((uint64_t)v7);
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A780;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_10003145C()
{
  uint64_t v1 = v0;
  type metadata accessor for ASUIPasskeyEntryViewController();
  unint64_t result = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:0 bundle:0];
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter);
  if (v3)
  {
    uint64_t v4 = result;
    char v5 = result[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_type];
    swift_unknownObjectRetain();
    id v6 = v4;
    sub_10003F198(v5, (uint64_t)v7);
    swift_unknownObjectWeakLoadStrong();
    *(void *)&v6[OBJC_IVAR____TtC16AccessorySetupUI30ASUIPasskeyEntryViewController_router + 8] = *(void *)(v3 + 24);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    sub_10002A080();
    sub_10001E588(v7);
    swift_unknownObjectRelease();

    *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView + 8) = &off_10005A498;
    swift_unknownObjectWeakAssign();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100031580()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)PRXLabel) initWithStyle:0];
  uint64_t v3 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel;
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel];
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel] = v2;

  char v5 = *(void **)&v0[v3];
  if (!v5)
  {
    __break(1u);
    goto LABEL_17;
  }
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = *(void **)&v0[v3];
  if (!v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  [v6 setAlpha:0.0];
  id v7 = *(void **)&v0[v3];
  if (!v7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v8 = v7;
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 setText:v9];

  id v10 = [v1 contentView];
  if (!*(void *)&v1[v3])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  NSString v11 = v10;
  [v10 addSubview:];

  id v12 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner;
  BOOL v14 = *(void **)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner];
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner] = v12;

  id v15 = *(void **)&v1[v13];
  if (!v15)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v16 = *(void **)&v1[v13];
  if (!v16)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  [v16 startAnimating];
  id v17 = [v1 contentView];
  if (!*(void *)&v1[v13])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v18 = v17;
  [v17 addSubview:];

  id v19 = [v1 contentView];
  id v20 = [v19 mainContentGuide];

  sub_10000BEA4(&qword_100062D98);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100049A60;
  double v22 = *(void **)&v1[v3];
  if (!v22)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v23 = [v22 topAnchor];
  id v24 = [v20 topAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];

  *(void *)(v21 + 32) = v25;
  CGAffineTransform v26 = *(void **)&v1[v3];
  if (!v26)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v27 = [v26 centerXAnchor];
  id v28 = [v20 centerXAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28];

  *(void *)(v21 + 40) = v29;
  id v30 = *(void **)&v1[v13];
  if (!v30)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  id v31 = [v30 topAnchor];
  double v32 = *(void **)&v1[v3];
  if (!v32)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v33 = [v32 bottomAnchor];
  id v34 = [v31 constraintGreaterThanOrEqualToAnchor:v33];

  *(void *)(v21 + 48) = v34;
  double v35 = *(void **)&v1[v13];
  if (!v35)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v36 = [v35 bottomAnchor];
  id v37 = [v20 bottomAnchor];
  id v38 = [v36 constraintLessThanOrEqualToAnchor:v37];

  *(void *)(v21 + 56) = v38;
  id v39 = *(void **)&v1[v13];
  if (!v39)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v40 = [v39 centerXAnchor];
  id v41 = [v20 centerXAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v21 + 64) = v42;
  id v43 = *(void **)&v1[v13];
  if (v43)
  {
    id v44 = self;
    id v45 = [v43 centerYAnchor];
    id v46 = [v20 centerYAnchor];
    id v47 = [v45 constraintEqualToAnchor:v46];

    *(void *)(v21 + 72) = v47;
    specialized Array._endMutation()();
    sub_10000C108(0, (unint64_t *)&qword_100062DA0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v44 activateConstraints:isa, v21];

    uint64_t v49 = self;
    uint64_t v50 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v53[4] = sub_100037648;
    v53[5] = v50;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 1107296256;
    v53[2] = sub_10002F814;
    v53[3] = &unk_10005AAE8;
    id v51 = _Block_copy(v53);
    swift_release();
    id v52 = [v49 scheduledTimerWithTimeInterval:0 repeats:v51 block:0.7];
    _Block_release(v51);

    return;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_100031B54(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v14 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 invalidate];
  sub_10000C108(0, (unint64_t *)&qword_100063180);
  id v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject();
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  aBlock[4] = sub_100037650;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015768;
  aBlock[3] = &unk_10005AB10;
  NSString v11 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  id v15 = &_swiftEmptyArrayStorage;
  sub_100037658((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_10001E6B4((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
  swift_release();
  return swift_release();
}

void sub_100031E90(uint64_t a1)
{
  uint64_t v2 = self;
  v4[4] = sub_1000376A0;
  v4[5] = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_100015768;
  v4[3] = &unk_10005AB38;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_release();
  [v2 animateWithDuration:v3 animations:0.5];
  _Block_release(v3);
}

void sub_100031F68()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel);
    id v3 = v2;

    if (v2)
    {
      [v3 setAlpha:1.0];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100031FF4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000BEA4(&qword_100063AB0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView);
  if (v8)
  {
    uint64_t v9 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices;
    uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices);
    uint64_t v10 = a1[14];
    if (v10)
    {
      uint64_t v13 = a1[14];
      id v11 = v8;
      sub_10000BEA4(&qword_100063AB8);
      sub_10001E6B4(&qword_100063AC0, &qword_100063AB8);
      sub_100037658(&qword_100063AC8, (void (*)(uint64_t))type metadata accessor for ASUIDevice);
      BidirectionalCollection<>.difference<A>(from:)();
      sub_10001E6B4((unint64_t *)&unk_100063AD0, &qword_100063AB0);
      dispatch thunk of Collection.startIndex.getter();
      dispatch thunk of Collection.endIndex.getter();
      if (v14 == v13)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      else
      {
        *(void *)(v2 + v9) = v10;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        unint64_t v12 = swift_bridgeObjectRetain();
        sub_100006B2C(v12);

        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_100032288(a1);
  }
}

void sub_100032288(void *a1)
{
  id v3 = v1;
  uint64_t v5 = type metadata accessor for Locale();
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for String.LocalizationValue();
  uint64_t v9 = __chkstk_darwin(v8);
  id v11 = (char *)&v123 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v15 = (char *)&v123 - v14;
  uint64_t v16 = a1[14];
  if (!v16)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  id v124 = v7;
  os_log_type_t v125 = v13;
  id v126 = v12;
  uint64_t v17 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices;
  *(void *)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a1[19];
  if (!v18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  id v19 = (uint64_t *)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_appName);
  *id v19 = a1[18];
  v19[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for ASUIProductCarouselView();
  uint64_t v20 = *(void *)((char *)v3 + v17);
  uint64_t v21 = *v19;
  uint64_t v22 = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = sub_1000068CC(v20, v21, v22);
  id v24 = (char **)OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView;
  id v25 = *(void **)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView);
  *(void *)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView) = v23;

  CGAffineTransform v26 = *(char **)((char *)v24 + (void)v3);
  if (!v26)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v27 = *(uint64_t *)((char *)v24 + (void)v3);
  if (!v27)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  id aBlock = *(void ***)(v27 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdxPublisher);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_10000BEA4(&qword_100062DB8);
  sub_10001E6B4(&qword_100063AE0, &qword_100062DB8);
  uint64_t v28 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  *(void *)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellable) = v28;
  swift_release();
  uint64_t v29 = *(uint64_t *)((char *)v24 + (void)v3);
  if (!v29)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  id aBlock = *(void ***)(v29 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentNumberOfPagesPublisher);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  uint64_t v30 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  *(void *)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellablePageControl) = v30;
  swift_release();
  id v31 = (char *)OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel;
  double v32 = *(void **)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel);
  if (!v32)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  [v32 setAlpha:0.0];
  uint64_t v33 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner;
  id v34 = *(void **)((char *)v3 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner);
  if (!v34)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  [v34 setAlpha:0.0];
  unint64_t v35 = *(void *)((char *)v3 + v17);
  if (!(v35 >> 62))
  {
    uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v36) {
      goto LABEL_10;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_36;
  }
LABEL_10:
  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_37:
    id v37 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_13;
  }
  if (!*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_39;
  }
  id v37 = (char *)*(id *)(v35 + 32);
LABEL_13:
  id v38 = v37;
  *(void *)&long long v129 = v33;
  swift_bridgeObjectRelease();
  id v39 = *(void **)&v38[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v39)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  id v40 = [v39 appAccessInfoMap];
  id v127 = v38;
  long long v128 = v31;
  id v130 = v24;
  if (v40
    && (id v41 = v40,
        sub_10000C108(0, (unint64_t *)&qword_100062DB0),
        uint64_t v42 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v41,
        uint64_t v43 = *(void *)(v42 + 16),
        swift_bridgeObjectRelease(),
        v43))
  {
    String.LocalizationValue.init(stringLiteral:)();
    id v45 = v125;
    id v44 = v126;
    ((void (**)(char *, char *, id))v125)[2](v11, v15, v126);
    static Locale.current.getter();
    String.init(localized:table:bundle:locale:comment:)();
    ((void (*)(char *, id))v45[1])(v15, v44);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v47 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v135 = (uint64_t (*)())sub_100035044;
  uint64_t v136 = v46;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v2 = 1107296256;
  uint64_t v132 = 1107296256;
  uint64_t v133 = sub_10002F814;
  v134 = &unk_10005A8E0;
  id v48 = _Block_copy(&aBlock);
  uint64_t v49 = self;
  id v50 = [v49 actionWithTitle:v47 style:0 handler:v48];

  _Block_release(v48);
  swift_release();
  swift_release();
  id v126 = v50;

  uint64_t v51 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v52 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v135 = (uint64_t (*)())sub_10003508C;
  uint64_t v136 = v51;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v132 = 1107296256;
  uint64_t v133 = sub_10002F814;
  v134 = &unk_10005A908;
  Swift::Int v53 = _Block_copy(&aBlock);
  id v54 = [v49 actionWithTitle:v52 style:1 handler:v53];

  _Block_release(v53);
  swift_release();
  swift_release();

  id v55 = [v3 contentView];
  BOOL v56 = v130;
  if (!*(char **)((char *)v130 + (void)v3)) {
    goto LABEL_51;
  }
  uint64_t v57 = v55;
  [v55 addSubview:];

  uint64_t v58 = v129;
  uint64_t v59 = *(void **)&v128[(void)v3];
  if (!v59)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  [v59 removeFromSuperview];
  unint64_t v60 = *(void **)((char *)v3 + v58);
  if (!v60)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  os_log_type_t v125 = (void (**)(void, void, void))v54;
  [v60 removeFromSuperview];
  id v61 = [v3 contentView];
  id v62 = [v61 mainContentGuide];

  sub_10000BEA4(&qword_100062D98);
  uint64_t v63 = swift_allocObject();
  long long v129 = xmmword_100049290;
  *(_OWORD *)(v63 + 16) = xmmword_100049290;
  id v64 = *(char **)((char *)v56 + (void)v3);
  if (!v64)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  id v65 = [v64 topAnchor];
  id v66 = [v62 topAnchor];
  id v67 = [v65 constraintEqualToAnchor:v66];

  *(void *)(v63 + 32) = v67;
  uint64_t v68 = *(char **)((char *)v56 + (void)v3);
  if (!v68)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  id v69 = [v68 bottomAnchor];
  id v70 = [v62 bottomAnchor];
  id v71 = [v69 constraintEqualToAnchor:v70];

  *(void *)(v63 + 40) = v71;
  uint64_t v72 = *(char **)((char *)v56 + (void)v3);
  if (!v72)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  id v124 = v62;
  id v73 = [v72 leadingAnchor];
  id v74 = [v3 contentView];
  id v75 = [v74 leadingAnchor];

  id v76 = [v73 constraintEqualToAnchor:v75];
  *(void *)(v63 + 48) = v76;
  uint64_t v77 = *(char **)((char *)v56 + (void)v3);
  if (!v77)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  uint64_t v78 = (char *)self;
  long long v128 = v78;
  id v79 = [v77 trailingAnchor];
  id v80 = [v3 contentView];
  id v81 = [v80 trailingAnchor];

  id v82 = [v79 constraintEqualToAnchor:v81];
  *(void *)(v63 + 56) = v82;
  id aBlock = (void **)v63;
  specialized Array._endMutation()();
  sub_10000C108(0, (unint64_t *)&qword_100062DA0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v78 activateConstraints:isa];

  id v15 = (char *)[objc_allocWithZone((Class)UIView) init];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v84 = [self systemBackgroundColor];
  [v15 setBackgroundColor:v84];

  id v85 = [v3 bottomTray];
  [v85 insertSubview:v15 atIndex:0];

  uint64_t v86 = swift_allocObject();
  *(_OWORD *)(v86 + 16) = v129;
  id v87 = [v15 topAnchor];
  id v88 = [v3 bottomTray];
  id v89 = [v88 topAnchor];

  id v90 = [v87 constraintEqualToAnchor:v89];
  *(void *)(v86 + 32) = v90;
  id v91 = [v15 leadingAnchor];
  id v92 = [v3 bottomTray];
  id v93 = [v92 leadingAnchor];

  id v94 = [v91 constraintEqualToAnchor:v93];
  *(void *)(v86 + 40) = v94;
  id v95 = [v15 trailingAnchor];
  id v96 = [v3 bottomTray];
  id v97 = [v96 trailingAnchor];

  id v98 = [v95 constraintEqualToAnchor:v97];
  *(void *)(v86 + 48) = v98;
  id v99 = [v15 bottomAnchor];
  id v100 = [v3 bottomTray];
  id v101 = [v100 bottomAnchor];

  id v102 = [v99 constraintEqualToAnchor:v101];
  *(void *)(v86 + 56) = v102;
  id aBlock = (void **)v86;
  specialized Array._endMutation()();
  Class v103 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v128 activateConstraints:v103];

  Swift::String v104 = *(char **)((char *)v130 + (void)v3);
  if (!v104)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v24 = &selRef_viewDidLoad;
  [v104 setAlpha:0.0];
  id v105 = [v3 bottomTray];
  id v106 = [v105 actionButtons];

  sub_10000C108(0, &qword_100063AE8);
  unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v35 >> 62))
  {
    if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_41;
  }
LABEL_39:
  swift_bridgeObjectRetain();
  uint64_t v122 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v122) {
    goto LABEL_40;
  }
LABEL_28:
  if ((v35 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v107 = *(id *)(v35 + 32);
      goto LABEL_31;
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_41:
  id v107 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_31:
  id v108 = v107;
  swift_bridgeObjectRelease();
  [v108 setValue:0.0 forKey:v24[4]];

  sub_1000344C8();
  if (!v109)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  uint64_t v110 = v109;
  [v109 setValue:0.0 forKey:@"someKey"];

  id v111 = [v3 view];
  if (!v111)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v112 = v111;
  [v111 setNeedsLayout];

  id v113 = [v3 view];
  if (v113)
  {
    uint64_t v114 = v113;
    [v113 layoutIfNeeded];

    id v115 = self;
    uint64_t v116 = swift_allocObject();
    *(void *)(v116 + 16) = v3;
    uint64_t v135 = sub_100037BF0;
    uint64_t v136 = v116;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v132 = v2;
    uint64_t v133 = sub_100015768;
    v134 = &unk_10005A958;
    uint64_t v117 = _Block_copy(&aBlock);
    id v118 = v3;
    swift_release();
    [v115 animateWithDuration:2 delay:v117 usingSpringWithDamping:0 initialSpringVelocity:1.0 options:0.0 animations:0.7 completion:0.0];
    _Block_release(v117);
    uint64_t v119 = swift_allocObject();
    *(void *)(v119 + 16) = v118;
    uint64_t v135 = (uint64_t (*)())sub_100035094;
    uint64_t v136 = v119;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v132 = v2;
    uint64_t v133 = sub_100015768;
    v134 = &unk_10005A9A8;
    uint64_t v120 = _Block_copy(&aBlock);
    id v121 = v118;
    swift_release();
    [v115 animateWithDuration:0 delay:v120 options:0 animations:0.6 completion:0.0];

    _Block_release(v120);
    return;
  }
LABEL_61:
  __break(1u);
}

void sub_10003333C(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v46 - v8;
  if (*a1 != -1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v11 = Strong;
      uint64_t v47 = v4;
      unint64_t v12 = (char *)OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView;
      uint64_t v13 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView);
      if (!v13)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      id v14 = v13;
      sub_100007950();

      id v15 = (char *)self;
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v11;
      NSString v52 = (void (*)(int))sub_100037BF0;
      Swift::Int v53 = (void *)v16;
      id aBlock = _NSConcreteStackBlock;
      uint64_t v49 = 1107296256;
      id v50 = sub_100015768;
      uint64_t v51 = &unk_10005ACF0;
      uint64_t v17 = _Block_copy(&aBlock);
      uint64_t v18 = (char *)(id)v11;
      swift_release();
      [v15 animateWithDuration:2 delay:v17 usingSpringWithDamping:0 initialSpringVelocity:0.8 options:0.0 animations:0.7 completion:0.0];
      _Block_release(v17);
      id v19 = v18;
      id v20 = [v19 bottomTray];
      id v21 = [v20 actionButtons];

      sub_10000C108(0, &qword_100063AE8);
      unint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v22 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v44 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v44)
        {
LABEL_6:
          if ((v22 & 0xC000000000000001) == 0)
          {
            if (!*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_26;
            }
            id v23 = *(id *)(v22 + 32);
LABEL_9:
            id v24 = v23;
            uint64_t v46 = v15;

            swift_bridgeObjectRelease();
            id v25 = [v24 titleLabel];

            if (!v25)
            {
LABEL_30:
              __break(1u);
              goto LABEL_31;
            }

            id v15 = v12;
            unint64_t v12 = *(char **)&v12[v11];
            if (!v12)
            {
LABEL_31:
              __break(1u);
              goto LABEL_32;
            }
            unint64_t v26 = *(void *)&v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx];
            uint64_t v27 = *(void *)&v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices];
            if ((v27 & 0xC000000000000001) == 0)
            {
              if ((v26 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v26 < *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                uint64_t v28 = (char *)*(id *)(v27 + 8 * v26 + 32);
                goto LABEL_15;
              }
              __break(1u);
              goto LABEL_29;
            }
LABEL_26:
            swift_bridgeObjectRetain();
            id v45 = v12;
            uint64_t v28 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();

            swift_bridgeObjectRelease();
LABEL_15:
            uint64_t v29 = *(void **)&v28[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
            if (v29)
            {
              id v30 = [v29 appAccessInfoMap];
              if (v30)
              {
                id v31 = v30;
                sub_10000C108(0, (unint64_t *)&qword_100062DB0);
                static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

                swift_bridgeObjectRelease();
              }
              else
              {
              }
              double v32 = v15;
              String.LocalizationValue.init(stringLiteral:)();
              uint64_t v33 = v47;
              (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v7, v9, v3);
              static Locale.current.getter();
              id v34 = v46;
              uint64_t v35 = String.init(localized:table:bundle:locale:comment:)();
              uint64_t v37 = v36;
              (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v3);
              NSString v52 = (void (*)(int))nullsub_1;
              Swift::Int v53 = 0;
              id aBlock = _NSConcreteStackBlock;
              uint64_t v49 = 1107296256;
              id v50 = sub_100015768;
              uint64_t v51 = &unk_10005AD18;
              id v38 = _Block_copy(&aBlock);
              id v39 = (void *)swift_allocObject();
              v39[2] = v19;
              v39[3] = v35;
              v39[4] = v37;
              NSString v52 = sub_10003774C;
              Swift::Int v53 = v39;
              id aBlock = _NSConcreteStackBlock;
              uint64_t v49 = 1107296256;
              id v50 = sub_10002F7C0;
              uint64_t v51 = &unk_10005AD68;
              id v40 = _Block_copy(&aBlock);
              id v41 = v19;
              swift_release();
              [v34 animateWithDuration:v38 animations:v40 completion:0.3];
              _Block_release(v40);
              _Block_release(v38);
              uint64_t v42 = *(void **)&v32[v11];
              if (v42)
              {
                id v43 = v42;
                sub_100007B70();

                return;
              }
LABEL_33:
              __break(1u);
              return;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_24:
          id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          goto LABEL_9;
        }
      }
      else if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_6;
      }

      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_24;
    }
  }
}

void sub_1000339F4(int a1, id a2)
{
  id v2 = [a2 bottomTray];
  id v3 = [v2 actionButtons];

  sub_10000C108(0, &qword_100063AE8);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v5 = *(id *)(v4 + 32);
LABEL_6:
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  sub_10000BB68(0.2);
  NSString v8 = String._bridgeToObjectiveC()();
  [v6 setTitle:v8 forState:0];
}

void sub_100033B64(void *a1)
{
  if (*a1 != -1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v2 = (char *)Strong;
      uint64_t v3 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView;
      unint64_t v4 = *(char **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView);
      if (v4)
      {
        id v5 = *(void **)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl];
        if (v5)
        {
          uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages;
          uint64_t v7 = *(void *)&v4[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_numberOfPages];
          NSString v8 = v4;
          [v5 setNumberOfPages:v7];
          uint64_t v9 = *(void **)&v8[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint];
          if (v9)
          {
            [v9 setActive:*(void *)&v4[v6] < 2];

            uint64_t v10 = self;
            uint64_t v11 = swift_allocObject();
            *(void *)(v11 + 16) = v2;
            id v21 = sub_1000376F0;
            uint64_t v22 = v11;
            id aBlock = _NSConcreteStackBlock;
            uint64_t v18 = 1107296256;
            id v19 = sub_100015768;
            id v20 = &unk_10005AC78;
            unint64_t v12 = _Block_copy(&aBlock);
            uint64_t v13 = v2;
            swift_release();
            id v21 = (void (*)())nullsub_1;
            uint64_t v22 = 0;
            id aBlock = _NSConcreteStackBlock;
            uint64_t v18 = 1107296256;
            id v19 = sub_10002F7C0;
            id v20 = &unk_10005ACA0;
            id v14 = _Block_copy(&aBlock);
            [v10 animateWithDuration:2 delay:v12 usingSpringWithDamping:v14 initialSpringVelocity:0.8 options:0.0 animations:0.7 completion:0.0];
            _Block_release(v14);
            _Block_release(v12);
            id v15 = *(void **)&v2[v3];
            if (v15)
            {
              id v16 = v15;
              sub_100008448();

              return;
            }
LABEL_12:
            __break(1u);
            return;
          }
LABEL_11:
          __break(1u);
          goto LABEL_12;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_11;
    }
  }
}

void sub_100033DB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - v8;
  String.LocalizationValue.init(stringLiteral:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  static Locale.current.getter();
  String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 showActivityIndicatorWithStatus:v10];

  uint64_t v11 = OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView;
  unint64_t v12 = *(unsigned char **)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView];
  if (!v12)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_shouldOnlyDisplayCenterPage;
  v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_shouldOnlyDisplayCenterPage] = 1;
  id v14 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView];
  if (!v14)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  id v15 = v12;
  [v14 setUserInteractionEnabled:0];
  id v16 = *(void **)((char *)v15 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl);
  if (!v16)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v44 = v11;
  id v45 = v1;
  [v16 setHidden:v12[v13]];
  uint64_t v17 = (unint64_t *)((char *)v15 + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages);
  swift_beginAccess();
  unint64_t v18 = *v17;
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    if (!v19) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19) {
      goto LABEL_16;
    }
  }
  if (v19 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v20 = 0;
  uint64_t v21 = OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx;
  uint64_t v46 = v48;
  do
  {
    if ((v18 & 0xC000000000000001) != 0) {
      id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v27 = *(id *)(v18 + 8 * v20 + 32);
    }
    uint64_t v28 = v27;
    if (v20 == *(uint64_t *)((char *)v15 + v21))
    {
    }
    else
    {
      uint64_t v22 = self;
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v28;
      *(void *)(v23 + 24) = v15;
      v48[2] = sub_1000376E8;
      v48[3] = v23;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v48[0] = sub_100015768;
      v48[1] = &unk_10005AC28;
      id v24 = _Block_copy(aBlock);
      id v25 = v15;
      id v26 = v28;
      swift_release();
      [v22 animateWithDuration:0 delay:v24 options:0 animations:0.333 completion:0.0];

      _Block_release(v24);
    }
    ++v20;
  }
  while (v19 != v20);
LABEL_16:

  swift_bridgeObjectRelease();
  uint64_t v29 = (uint64_t)v45;
  id v15 = (uint64_t *)&v45[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext];
  swift_beginAccess();
  uint64_t v30 = *v15;
  uint64_t v31 = v15[1];
  uint64_t v32 = v15[2];
  uint64_t *v15 = 1;
  *(_OWORD *)(v15 + 1) = 0u;
  *(_OWORD *)(v15 + 3) = 0u;
  *(_OWORD *)(v15 + 5) = 0u;
  *(_OWORD *)(v15 + 7) = 0u;
  sub_10000CBC4(v30, v31, v32);
  swift_beginAccess();
  if (v15[2] == 1) {
    goto LABEL_25;
  }
  *(unsigned char *)id v15 = 1;
  unint64_t v12 = *(unsigned char **)(v29 + v44);
  if (!v12) {
    goto LABEL_35;
  }
  unint64_t v33 = *(void *)&v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx];
  uint64_t v34 = *(void *)&v12[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices];
  if ((v34 & 0xC000000000000001) == 0)
  {
    if ((v33 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v33 < *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v35 = (char *)*(id *)(v34 + 8 * v33 + 32);
      goto LABEL_22;
    }
    __break(1u);
    goto LABEL_32;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  id v43 = v12;
  uint64_t v35 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();

  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v36 = *(void **)&v35[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
  if (!v36)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v37 = [v36 identifier];
  if (!v37)
  {
LABEL_37:
    __break(1u);
    return;
  }
  id v38 = v37;
  uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v41 = v40;

  v15[5] = v39;
  void v15[6] = v41;
  swift_bridgeObjectRelease();
  uint64_t v29 = (uint64_t)v45;
LABEL_25:
  swift_endAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    sub_1000363F8(v29, Strong, &OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext, (uint64_t)&unk_10005A9E0, (uint64_t)sub_100024D84);
    swift_unknownObjectRelease();
  }
}

void sub_1000343A8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = Strong + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext;
    swift_beginAccess();
    uint64_t v3 = *(void *)v2;
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t v5 = *(void *)(v2 + 16);
    *(void *)uint64_t v2 = 1;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    sub_10000CBC4(v3, v4, v5);
    if (*(void *)(v2 + 16) != 1) {
      *(unsigned char *)uint64_t v2 = 0;
    }
    uint64_t v6 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v6)
    {
      sub_1000363F8((uint64_t)v1, v6, &OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext, (uint64_t)&unk_10005A9E0, (uint64_t)sub_100024D84);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_1000344C8()
{
  id v1 = [v0 bottomTray];
  id v2 = [v1 actionButtons];

  sub_10000C108(0, &qword_100063AE8);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v4 >= 2)
  {
    id v5 = [v0 bottomTray];
    id v6 = [v5 actionButtons];

    uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    if ((v7 & 0xC000000000000001) != 0)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v8 = *(id *)(v7 + 40);
LABEL_7:
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
}

void sub_100034638(void *a1)
{
  id v1 = [a1 view];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 window];

    if (v3)
    {
      [v3 layoutIfNeeded];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000346D4(char *a1)
{
  id v2 = *(void **)&a1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView];
  if (!v2) {
    goto LABEL_15;
  }
  [v2 setAlpha:1.0];
  id v3 = [a1 bottomTray];
  id v4 = [v3 actionButtons];

  sub_10000C108(0, &qword_100063AE8);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v5 >> 62))
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_12;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v6 = *(id *)(v5 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_13:
  id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_7:
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  [v7 setAlpha:1.0];

  sub_1000344C8();
  if (!v8)
  {
LABEL_16:
    __break(1u);
    return;
  }
  id v10 = v8;
  [v8 setAlpha:1.0];
}

void sub_1000348BC()
{
  id v1 = *(char **)&v0[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView];
  if (!v1) {
    goto LABEL_15;
  }
  unint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdx];
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices];
  if ((v3 & 0xC000000000000001) == 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_6;
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = v1;
  id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();

  swift_bridgeObjectRelease();
LABEL_6:
  unint64_t v5 = (char *)[objc_allocWithZone((Class)type metadata accessor for ASUIDeviceInfoPopoverViewController()) init];
  id v6 = *(void **)&v5[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device];
  *(void *)&v5[OBJC_IVAR____TtC16AccessorySetupUI35ASUIDeviceInfoPopoverViewController_device] = v4;

  [v5 setModalPresentationStyle:7];
  uint64_t v7 = self;
  id v8 = v5;
  id v9 = [v7 mainScreen];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v37.origin.double x = v11;
  v37.origin.y = v13;
  v37.size.width = v15;
  v37.size.height = v17;
  [v8 setPreferredContentSize:CGRectGetWidth(v37) + -20.0, 300.0];

  id v35 = [v8 popoverPresentationController];
  if (v35)
  {
    id v18 = v35;
    id v19 = [v0 infoButton];
    [v18 setSourceView:v19];

    id v20 = v18;
    id v21 = [v0 infoButton];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 bounds];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      [v20 setSourceRect:v24, v26, v28, v30];
      [v20 setPermittedArrowDirections:2];
      [v20 setDelegate:v0];
      uint64_t v31 = self;
      id v32 = v20;
      id v33 = [v31 systemWhiteColor];
      [v32 setBackgroundColor:v33];

      goto LABEL_9;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_9:
  [v0 presentViewController:v8 animated:1 completion:0];
}

void sub_100034BE4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v5 = (void *)Strong;
    a3();
  }
}

id sub_100034CAC()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellable])
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  if (*(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellablePageControl])
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIConnectViewController()
{
  return self;
}

uint64_t sub_100034EC8()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_type);
}

uint64_t sub_100034ED8@<X0>(uint64_t *a1@<X8>)
{
  objc_super v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v13 = v3[8];
  uint64_t result = sub_10000CA8C(*v3, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v13;
  return result;
}

uint64_t sub_100034FFC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100035034(void *a1)
{
}

void sub_10003503C(void *a1)
{
}

void sub_100035044(uint64_t a1)
{
  sub_100034BE4(a1, v1, sub_100033DB8);
}

uint64_t sub_100035074(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100035084()
{
  return swift_release();
}

void sub_10003508C()
{
}

void sub_100035094()
{
  sub_1000346D4(*(char **)(v0 + 16));
}

uint64_t sub_10003509C(uint64_t a1, uint64_t a2)
{
  return sub_1000350FC(a1, a2, &OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI27ASUILearnMoreViewController_routingContext, &unk_10005AA08, sub_100037B5C);
}

uint64_t sub_1000350CC(uint64_t a1, uint64_t a2)
{
  return sub_1000350FC(a1, a2, &OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI34ASUITurnOnTransportsViewController_routingContext, &unk_10005AAD0, sub_100037B5C);
}

void sub_1000350FC(uint64_t a1, char *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_10000BEA4(&qword_100062F10);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  double v14 = (char *)&v140 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  CGFloat v17 = (char *)&v140 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  id v20 = (char *)&v140 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v140 - v21;
  switch(*(unsigned char *)(a1 + *a3))
  {
    case 1:
    case 0xB:
      goto LABEL_53;
    case 2:
      uint64_t v40 = a1 + *a4;
      if (*(void *)(v40 + 16) == 1) {
        return;
      }
      if (*(unsigned char *)v40)
      {
        id v94 = *(NSObject **)(v40 + 48);
        if (v94)
        {
          id v95 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
          if (v95)
          {
            uint64_t v96 = *(void *)(v40 + 40);
            swift_bridgeObjectRetain();
            id v140 = v95;
            sub_100014628(v96, v94);
            swift_bridgeObjectRelease();
            goto LABEL_124;
          }
        }
      }
      else
      {
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v41 = type metadata accessor for Logger();
        sub_100005F6C(v41, (uint64_t)qword_100063070);
        uint64_t v42 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Showing Learn More View", v44, 2u);
          swift_slowDealloc();
        }

        id v45 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v45)
        {
          id v46 = v45;
          uint64_t v47 = sub_100030C60();
          goto LABEL_42;
        }
      }
      return;
    case 3:
      goto LABEL_139;
    case 4:
    case 5:
    case 6:
      double v23 = (uint64_t *)(a1 + *a4);
      uint64_t v24 = v23[2];
      if (v24 == 1) {
        return;
      }
      uint64_t v25 = *v23;
      if ((*v23 & 1) == 0)
      {
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v26 = type metadata accessor for Logger();
        sub_100005F6C(v26, (uint64_t)qword_100063070);
        double v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          double v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)double v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Showing Error View", v29, 2u);
          swift_slowDealloc();
        }

        double v30 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v30)
        {
          id v31 = v30;
          id v32 = sub_100030FCC();
          [v31 pushViewController:v32 animated:1];
        }
        id v33 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
        if (v33)
        {
          id v140 = v33;
          sub_1000169A8(0, 0, 0);
          goto LABEL_124;
        }
        return;
      }
      id v90 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v90) {
        return;
      }
      uint64_t v91 = v23[1];
      uint64_t v92 = v23[3];
      unint64_t v93 = v23[4];
      sub_10000CA8C(v25, v91, v24);
      id v140 = v90;
      sub_1000169A8(1, v92, v93);
      sub_10000CBC4(v25, v91, v24);
      goto LABEL_124;
    case 7:
      id v70 = (void *)(a1 + *a4);
      unint64_t v71 = v70[2];
      if (v71 == 1) {
        return;
      }
      uint64_t v72 = (void *)v70[6];
      if (v71) {
        BOOL v73 = (*v70 & 1) == 0;
      }
      else {
        BOOL v73 = 1;
      }
      if (!v73 && v72 != 0)
      {
        uint64_t v113 = v70[1];
        uint64_t v114 = HIBYTE(v71) & 0xF;
        if ((v71 & 0x2000000000000000) == 0) {
          uint64_t v114 = v113 & 0xFFFFFFFFFFFFLL;
        }
        if (v114)
        {
          id v115 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
          if (v115)
          {
            uint64_t v116 = v70[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            id v117 = v115;
            sub_100015E48(v116, v72, v113, v71);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
      }
      uint64_t v75 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession;
      uint64_t v76 = *(void *)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v76)
      {
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
LABEL_147:
        __break(1u);
LABEL_148:
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
        goto LABEL_151;
      }
      uint64_t v77 = (unint64_t *)(v76 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems);
      swift_beginAccess();
      unint64_t v78 = *v77;
      if (v78)
      {
        if (v78 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v139 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v139 >= 1)
          {
LABEL_81:
            id v79 = *(void **)&a2[v75];
            if (v79)
            {
              id v80 = v79;
              sub_10001599C();

              return;
            }
            goto LABEL_147;
          }
        }
        else if (*(uint64_t *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
        {
          goto LABEL_81;
        }
      }
LABEL_139:
      sub_10002240C();
      return;
    case 8:
      uint64_t v48 = a1 + *a4;
      if (*(void *)(v48 + 16) == 1) {
        return;
      }
      if ((*(unsigned char *)v48 & 1) == 0)
      {
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v49 = type metadata accessor for Logger();
        sub_100005F6C(v49, (uint64_t)qword_100063070);
        id v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v50, v51))
        {
          NSString v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)NSString v52 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Showing Done View", v52, 2u);
          swift_slowDealloc();
        }

        Swift::Int v53 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v53)
        {
          id v46 = v53;
          uint64_t v47 = sub_100030D84();
LABEL_42:
          [v46 pushViewController:v47 animated:1];

LABEL_124:
          id v112 = v140;
LABEL_125:
        }
        return;
      }
      id v97 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v97) {
        [v97 dismissViewControllerAnimated:1 completion:0];
      }
      id v98 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v98) {
        goto LABEL_145;
      }
      id v99 = v98;
      sub_10000CD24();
      id v101 = v100;

      if (v101)
      {
        id v102 = *(void **)&v101[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
        id v103 = v102;

        if (v102)
        {
          unsigned __int8 v104 = [v103 flags];
          id v105 = [self defaultWorkspace];
          id v106 = v105;
          if ((v104 & 0x20) != 0)
          {
            if (!v105)
            {
LABEL_152:
              __break(1u);
              JUMPOUT(0x100036240);
            }
            sub_100021594();
            uint64_t v126 = type metadata accessor for URL();
            uint64_t v127 = *(void *)(v126 - 8);
            uint64_t v110 = 0;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v127 + 48))(v22, 1, v126) != 1)
            {
              URL._bridgeToObjectiveC()(v128);
              uint64_t v110 = v129;
              (*(void (**)(char *, uint64_t))(v127 + 8))(v22, v126);
            }
          }
          else
          {
            if (!v105)
            {
LABEL_151:
              __break(1u);
              goto LABEL_152;
            }
            URL.init(string:)();
            uint64_t v107 = type metadata accessor for URL();
            uint64_t v108 = *(void *)(v107 - 8);
            uint64_t v110 = 0;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v108 + 48))(v20, 1, v107) != 1)
            {
              URL._bridgeToObjectiveC()(v109);
              uint64_t v110 = v111;
              (*(void (**)(char *, uint64_t))(v108 + 8))(v20, v107);
            }
          }
          sub_10002F818((uint64_t)&_swiftEmptyArrayStorage);
          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v106 openSensitiveURL:v110 withOptions:isa];
        }
        return;
      }
      goto LABEL_146;
    case 9:
      id v81 = (uint64_t *)(a1 + *a4);
      if (v81[2] == 1) {
        return;
      }
      uint64_t v82 = *v81;
      os_log_type_t v83 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v83) {
        [v83 dismissViewControllerAnimated:1 completion:0];
      }
      if (v82) {
        return;
      }
      id v84 = [self defaultWorkspace];
      if (!v84) {
        goto LABEL_144;
      }
      uint64_t v63 = v84;
      URL.init(string:)();
      uint64_t v85 = type metadata accessor for URL();
      uint64_t v86 = *(void *)(v85 - 8);
      id v67 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v17, 1, v85) != 1)
      {
        URL._bridgeToObjectiveC()(v87);
        id v67 = v88;
        (*(void (**)(char *, uint64_t))(v86 + 8))(v17, v85);
      }
      goto LABEL_90;
    case 0xA:
      uint64_t v54 = a1 + *a4;
      if (*(void *)(v54 + 16) == 1) {
        return;
      }
      if (*(unsigned char *)v54) {
        goto LABEL_53;
      }
      if (qword_1000629B0 != -1) {
        swift_once();
      }
      uint64_t v55 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
      if (!v55) {
        goto LABEL_142;
      }
      uint64_t v56 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
      if (!v56) {
        goto LABEL_116;
      }
      if (*(unsigned char *)(v56 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1)
      {
        char v57 = *(unsigned char *)(v55 + 84);
        if ((*(unsigned char *)(v56 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) & 1) == 0)
        {
          if (!*(unsigned char *)(v55 + 84)) {
            goto LABEL_132;
          }
          goto LABEL_116;
        }
      }
      else
      {
        if (*(unsigned char *)(v56 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) != 1) {
          goto LABEL_116;
        }
        char v57 = 1;
      }
      if (*(unsigned char *)(v55 + 86) != 1 || (v57 & 1) == 0)
      {
LABEL_132:
        uint64_t v131 = swift_allocObject();
        *(void *)(v131 + 16) = a2;
        uint64_t v132 = *(void *)(v55 + 40);
        *(void *)(v55 + 40) = a6;
        *(void *)(v55 + 48) = v131;
        uint64_t v133 = a2;
        sub_100005A34(v132);
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v134 = type metadata accessor for Logger();
        sub_100005F6C(v134, (uint64_t)qword_100063070);
        uint64_t v135 = Logger.logObject.getter();
        os_log_type_t v136 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v135, v136))
        {
          id v137 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v137 = 0;
          _os_log_impl((void *)&_mh_execute_header, v135, v136, "Showing Turn On Transports View", v137, 2u);
          swift_slowDealloc();
        }

        uint64_t v138 = *(void **)&v133[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v138)
        {
          id v46 = v138;
          uint64_t v47 = sub_100030A18();
          goto LABEL_42;
        }
        return;
      }
LABEL_116:
      if (qword_100062970 != -1) {
        swift_once();
      }
      uint64_t v118 = type metadata accessor for Logger();
      sub_100005F6C(v118, (uint64_t)qword_100063070);
      uint64_t v119 = Logger.logObject.getter();
      os_log_type_t v120 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v119, v120))
      {
        id v121 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v121 = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, v120, "Showing Connect View", v121, 2u);
        swift_slowDealloc();
      }

      uint64_t v122 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v122)
      {
        id v123 = v122;
        id v124 = sub_1000307DC();
        [v123 pushViewController:v124 animated:1];
      }
      os_log_type_t v125 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v125) {
        goto LABEL_148;
      }
      id v140 = v125;
      sub_10000D894();
      goto LABEL_124;
    case 0xC:
      uint64_t v59 = (uint64_t *)(a1 + *a4);
      if (v59[2] == 1) {
        return;
      }
      uint64_t v60 = *v59;
      id v61 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v61) {
        [v61 dismissViewControllerAnimated:1 completion:0];
      }
      if (v60) {
        return;
      }
      id v62 = [self defaultWorkspace];
      if (!v62) {
        goto LABEL_143;
      }
      uint64_t v63 = v62;
      URL.init(string:)();
      uint64_t v64 = type metadata accessor for URL();
      uint64_t v65 = *(void *)(v64 - 8);
      id v67 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v14, 1, v64) != 1)
      {
        URL._bridgeToObjectiveC()(v66);
        id v67 = v68;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v14, v64);
      }
LABEL_90:
      sub_10002F818((uint64_t)&_swiftEmptyArrayStorage);
      Class v89 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v63 openSensitiveURL:v67 withOptions:v89];

      return;
    case 0xD:
      uint64_t v69 = a1 + *a4;
      if (*(void *)(v69 + 16) == 1) {
        return;
      }
      uint64_t v58 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if ((*(unsigned char *)v69 & 1) == 0)
      {
        if (v58) {
          goto LABEL_54;
        }
        return;
      }
      if (!v58) {
        return;
      }
      id v112 = [v58 popViewControllerAnimated:1];
      goto LABEL_125;
    default:
      uint64_t v34 = (uint64_t *)(a1 + *a4);
      uint64_t v35 = v34[2];
      if (v35 == 1) {
        return;
      }
      uint64_t v36 = *v34;
      if (*v34)
      {
        uint64_t v37 = v34[8];
        if (v37)
        {
          uint64_t v38 = v34[1];
          uint64_t v39 = qword_1000629B0;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v39 != -1) {
            swift_once();
          }
          if (!*(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor)) {
            goto LABEL_149;
          }
          swift_retain();
          sub_1000274A0();
          swift_release();
          sub_10000CBC4(v36, v38, v35);
        }
        if ((v37 & 2) != 0)
        {
          if (qword_1000629B0 != -1) {
            swift_once();
          }
          if (!*(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor)) {
            goto LABEL_150;
          }
          swift_retain();
          sub_100027FC8();
          swift_release();
        }
      }
      else
      {
LABEL_53:
        uint64_t v58 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v58)
        {
LABEL_54:
          [v58 dismissViewControllerAnimated:1 completion:0];
        }
      }
      return;
  }
}

void sub_100036278(uint64_t a1, char *a2)
{
}

uint64_t sub_1000362A8(uint64_t a1, uint64_t a2)
{
  return sub_1000350FC(a1, a2, &OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI22ASUIDoneViewController_routingContext, &unk_10005AAA8, sub_100037B5C);
}

uint64_t sub_1000362D8(uint64_t a1, uint64_t a2)
{
  return sub_1000350FC(a1, a2, &OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI33ASUIConnectionErrorViewController_routingContext, &unk_10005AA30, sub_100037B5C);
}

void sub_100036308(uint64_t a1, char *a2)
{
}

void sub_100036338(uint64_t a1, char *a2)
{
}

void sub_100036368(uint64_t a1, char *a2)
{
}

void sub_100036398(uint64_t a1, char *a2)
{
}

void sub_1000363C8(uint64_t a1, char *a2)
{
}

void sub_1000363F8(uint64_t a1, char *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_10000BEA4(&qword_100062F10);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  double v14 = (char *)&v140 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  CGFloat v17 = (char *)&v140 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  id v20 = (char *)&v140 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  double v23 = (char *)&v140 - v22;
  switch(*(unsigned char *)(a1 + *a3))
  {
    case 1:
    case 0xB:
      uint64_t v36 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (!v36) {
        return;
      }
      goto LABEL_15;
    case 2:
      uint64_t v43 = a1 + *a4;
      swift_beginAccess();
      if (*(void *)(v43 + 16) == 1) {
        return;
      }
      if (*(unsigned char *)v43)
      {
        id v95 = *(NSObject **)(v43 + 48);
        if (v95)
        {
          uint64_t v96 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
          if (v96)
          {
            uint64_t v97 = *(void *)(v43 + 40);
            swift_bridgeObjectRetain();
            id v35 = v96;
            sub_100014628(v97, v95);
            swift_bridgeObjectRelease();
            goto LABEL_124;
          }
        }
      }
      else
      {
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v44 = type metadata accessor for Logger();
        sub_100005F6C(v44, (uint64_t)qword_100063070);
        id v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "Showing Learn More View", v47, 2u);
          swift_slowDealloc();
        }

        uint64_t v48 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v48)
        {
          id v49 = v48;
          id v50 = sub_100030C60();
          goto LABEL_44;
        }
      }
      return;
    case 3:
      goto LABEL_136;
    case 4:
    case 5:
    case 6:
      uint64_t v24 = (uint64_t *)(a1 + *a4);
      swift_beginAccess();
      uint64_t v25 = v24[2];
      if (v25 == 1) {
        return;
      }
      uint64_t v26 = *v24;
      if ((*v24 & 1) == 0)
      {
        if (qword_100062970 != -1) {
          swift_once();
        }
        uint64_t v27 = type metadata accessor for Logger();
        sub_100005F6C(v27, (uint64_t)qword_100063070);
        os_log_type_t v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v28, v29))
        {
          double v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)double v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Showing Error View", v30, 2u);
          swift_slowDealloc();
        }

        id v31 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v31)
        {
          id v32 = v31;
          id v33 = sub_100030FCC();
          [v32 pushViewController:v33 animated:1];
        }
        uint64_t v34 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
        if (v34)
        {
          id v35 = v34;
          sub_1000169A8(0, 0, 0);
          goto LABEL_124;
        }
        return;
      }
      uint64_t v92 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v92) {
        return;
      }
      uint64_t v141 = v24[1];
      uint64_t v93 = v24[3];
      unint64_t v94 = v24[4];
      sub_10000CA8C(v26, v141, v25);
      id v35 = v92;
      sub_1000169A8(1, v93, v94);
      sub_10000CBC4(v26, v141, v25);
      goto LABEL_124;
    case 7:
      BOOL v73 = (void *)(a1 + *a4);
      swift_beginAccess();
      unint64_t v74 = v73[2];
      if (v74 == 1) {
        return;
      }
      uint64_t v75 = (void *)v73[6];
      if (v74) {
        BOOL v76 = (*v73 & 1) == 0;
      }
      else {
        BOOL v76 = 1;
      }
      if (!v76 && v75 != 0)
      {
        uint64_t v113 = v73[1];
        uint64_t v114 = HIBYTE(v74) & 0xF;
        if ((v74 & 0x2000000000000000) == 0) {
          uint64_t v114 = v113 & 0xFFFFFFFFFFFFLL;
        }
        if (v114)
        {
          id v115 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
          if (v115)
          {
            uint64_t v116 = v73[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            id v117 = v115;
            sub_100015E48(v116, v75, v113, v74);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
      }
      uint64_t v78 = OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession;
      uint64_t v79 = *(void *)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
      if (!v79)
      {
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
        goto LABEL_142;
      }
      id v80 = (unint64_t *)(v79 + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems);
      uint64_t v21 = swift_beginAccess();
      unint64_t v81 = *v80;
      if (v81)
      {
        if (v81 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v139 = _CocoaArrayWrapper.endIndex.getter();
          uint64_t v21 = swift_bridgeObjectRelease();
          if (v139 >= 1)
          {
LABEL_79:
            uint64_t v82 = *(void **)&a2[v78];
            if (v82)
            {
              id v35 = v82;
              sub_10001599C();
LABEL_124:

              return;
            }
            goto LABEL_144;
          }
        }
        else if (*(uint64_t *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
        {
          goto LABEL_79;
        }
      }
LABEL_136:
      sub_10002240C(v21);
      return;
    case 8:
      uint64_t v51 = a1 + *a4;
      swift_beginAccess();
      if (*(void *)(v51 + 16) == 1) {
        return;
      }
      if (*(unsigned char *)v51)
      {
        id v98 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v98) {
          [v98 dismissViewControllerAnimated:1 completion:0];
        }
        id v99 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
        if (v99)
        {
          id v100 = v99;
          sub_10000CD24();
          id v102 = v101;

          if (v102)
          {
            id v103 = *(void **)&v102[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_underlyingDADevice];
            id v104 = v103;

            if (v103)
            {
              unsigned __int8 v105 = [v104 flags];
              id v106 = [self defaultWorkspace];
              uint64_t v107 = v106;
              if ((v105 & 0x20) != 0)
              {
                if (!v106)
                {
LABEL_149:
                  __break(1u);
                  JUMPOUT(0x1000375B0);
                }
                sub_100021594();
                uint64_t v126 = type metadata accessor for URL();
                uint64_t v127 = *(void *)(v126 - 8);
                id v111 = 0;
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v127 + 48))(v23, 1, v126) != 1)
                {
                  URL._bridgeToObjectiveC()(v128);
                  id v111 = v129;
                  (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v126);
                }
              }
              else
              {
                if (!v106)
                {
LABEL_148:
                  __break(1u);
                  goto LABEL_149;
                }
                URL.init(string:)();
                uint64_t v108 = type metadata accessor for URL();
                uint64_t v109 = *(void *)(v108 - 8);
                id v111 = 0;
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v109 + 48))(v20, 1, v108) != 1)
                {
                  URL._bridgeToObjectiveC()(v110);
                  id v111 = v112;
                  (*(void (**)(char *, uint64_t))(v109 + 8))(v20, v108);
                }
              }
              sub_10002F818((uint64_t)&_swiftEmptyArrayStorage);
              Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v107 openSensitiveURL:v111 withOptions:isa];
            }
            return;
          }
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          goto LABEL_148;
        }
LABEL_142:
        __break(1u);
        goto LABEL_143;
      }
      if (qword_100062970 != -1) {
        swift_once();
      }
      uint64_t v52 = type metadata accessor for Logger();
      sub_100005F6C(v52, (uint64_t)qword_100063070);
      Swift::Int v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v55 = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Showing Done View", v55, 2u);
        swift_slowDealloc();
      }

      uint64_t v56 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (!v56) {
        return;
      }
      id v49 = v56;
      id v50 = sub_100030D84();
      goto LABEL_44;
    case 9:
      os_log_type_t v83 = (uint64_t *)(a1 + *a4);
      swift_beginAccess();
      if (v83[2] == 1) {
        return;
      }
      uint64_t v84 = *v83;
      uint64_t v85 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v85) {
        [v85 dismissViewControllerAnimated:1 completion:0];
      }
      if (v84) {
        return;
      }
      id v86 = [self defaultWorkspace];
      if (!v86) {
        goto LABEL_141;
      }
      id v66 = v86;
      URL.init(string:)();
      uint64_t v87 = type metadata accessor for URL();
      uint64_t v88 = *(void *)(v87 - 8);
      id v70 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v88 + 48))(v17, 1, v87) != 1)
      {
        URL._bridgeToObjectiveC()(v89);
        id v70 = v90;
        (*(void (**)(char *, uint64_t))(v88 + 8))(v17, v87);
      }
      goto LABEL_88;
    case 0xA:
      uint64_t v58 = a1 + *a4;
      swift_beginAccess();
      if (*(void *)(v58 + 16) == 1) {
        return;
      }
      if (*(unsigned char *)v58) {
        goto LABEL_91;
      }
      if (qword_1000629B0 != -1) {
        swift_once();
      }
      uint64_t v59 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
      if (!v59) {
        goto LABEL_139;
      }
      uint64_t v60 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
      if (!v60) {
        goto LABEL_116;
      }
      if (*(unsigned char *)(v60 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1)
      {
        char v61 = *(unsigned char *)(v59 + 84);
        if ((*(unsigned char *)(v60 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) & 1) == 0)
        {
          if (!*(unsigned char *)(v59 + 84))
          {
LABEL_129:
            uint64_t v131 = swift_allocObject();
            *(void *)(v131 + 16) = a2;
            uint64_t v132 = *(void *)(v59 + 40);
            *(void *)(v59 + 40) = a6;
            *(void *)(v59 + 48) = v131;
            uint64_t v133 = a2;
            sub_100005A34(v132);
            if (qword_100062970 != -1) {
              swift_once();
            }
            uint64_t v134 = type metadata accessor for Logger();
            sub_100005F6C(v134, (uint64_t)qword_100063070);
            uint64_t v135 = Logger.logObject.getter();
            os_log_type_t v136 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v135, v136))
            {
              id v137 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v137 = 0;
              _os_log_impl((void *)&_mh_execute_header, v135, v136, "Showing Turn On Transports View", v137, 2u);
              swift_slowDealloc();
            }

            uint64_t v138 = *(void **)&v133[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
            if (!v138) {
              return;
            }
            id v49 = v138;
            id v50 = sub_100030A18();
LABEL_44:
            char v57 = v50;
            [v49 pushViewController:v50 animated:1];

            return;
          }
LABEL_116:
          if (qword_100062970 != -1) {
            swift_once();
          }
          uint64_t v118 = type metadata accessor for Logger();
          sub_100005F6C(v118, (uint64_t)qword_100063070);
          uint64_t v119 = Logger.logObject.getter();
          os_log_type_t v120 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v119, v120))
          {
            id v121 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v121 = 0;
            _os_log_impl((void *)&_mh_execute_header, v119, v120, "Showing Connect View", v121, 2u);
            swift_slowDealloc();
          }

          uint64_t v122 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
          if (v122)
          {
            id v123 = v122;
            id v124 = sub_1000307DC();
            [v123 pushViewController:v124 animated:1];
          }
          os_log_type_t v125 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession];
          if (v125)
          {
            id v35 = v125;
            sub_10000D894();
            goto LABEL_124;
          }
          goto LABEL_145;
        }
      }
      else
      {
        if (*(unsigned char *)(v60 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) != 1) {
          goto LABEL_116;
        }
        char v61 = 1;
      }
      if (*(unsigned char *)(v59 + 86) != 1 || (v61 & 1) == 0) {
        goto LABEL_129;
      }
      goto LABEL_116;
    case 0xC:
      id v62 = (uint64_t *)(a1 + *a4);
      swift_beginAccess();
      if (v62[2] == 1) {
        return;
      }
      uint64_t v63 = *v62;
      uint64_t v64 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (v64) {
        [v64 dismissViewControllerAnimated:1 completion:0];
      }
      if (v63) {
        return;
      }
      id v65 = [self defaultWorkspace];
      if (!v65) {
        goto LABEL_140;
      }
      id v66 = v65;
      URL.init(string:)();
      uint64_t v67 = type metadata accessor for URL();
      uint64_t v68 = *(void *)(v67 - 8);
      id v70 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v14, 1, v67) != 1)
      {
        URL._bridgeToObjectiveC()(v69);
        id v70 = v71;
        (*(void (**)(char *, uint64_t))(v68 + 8))(v14, v67);
      }
LABEL_88:
      sub_10002F818((uint64_t)&_swiftEmptyArrayStorage);
      Class v91 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v66 openSensitiveURL:v70 withOptions:v91];

      return;
    case 0xD:
      uint64_t v72 = a1 + *a4;
      swift_beginAccess();
      if (*(void *)(v72 + 16) == 1) {
        return;
      }
      uint64_t v36 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
      if (*(unsigned char *)v72)
      {
        if (v36) {
      }
        }
      else if (v36)
      {
        goto LABEL_15;
      }
      return;
    default:
      uint64_t v37 = (uint64_t *)(a1 + *a4);
      swift_beginAccess();
      uint64_t v38 = v37[2];
      if (v38 == 1) {
        return;
      }
      uint64_t v39 = *v37;
      if (*v37)
      {
        uint64_t v40 = v37[8];
        if (v40)
        {
          uint64_t v41 = v37[1];
          uint64_t v42 = qword_1000629B0;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v42 != -1) {
            swift_once();
          }
          if (!*(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor)) {
            goto LABEL_146;
          }
          swift_retain();
          sub_1000274A0();
          swift_release();
          sub_10000CBC4(v39, v41, v38);
        }
        if ((v40 & 2) != 0)
        {
          if (qword_1000629B0 != -1) {
            swift_once();
          }
          if (*(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor))
          {
            swift_retain();
            sub_100027FC8();
            swift_release();
            return;
          }
          goto LABEL_147;
        }
      }
      else
      {
LABEL_91:
        uint64_t v36 = *(void **)&a2[OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController];
        if (v36) {
LABEL_15:
        }
          [v36 dismissViewControllerAnimated:1 completion:0];
      }
      return;
  }
}

void sub_1000375E8(uint64_t a1, char *a2)
{
}

uint64_t sub_100037618(uint64_t a1, uint64_t a2)
{
  return sub_1000350FC(a1, a2, &OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_type, &OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_routingContext, &unk_10005AA80, sub_100037B5C);
}

uint64_t sub_100037648(void *a1)
{
  return sub_100031B54(a1);
}

void sub_100037650()
{
  sub_100031E90(v0);
}

uint64_t sub_100037658(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000376A0()
{
}

uint64_t sub_1000376A8()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000376E8()
{
  return sub_10000686C(*(id *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_1000376F0()
{
  sub_100034638(*(void **)(v0 + 16));
}

uint64_t sub_10003770C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10003774C(int a1)
{
  sub_1000339F4(a1, *(id *)(v1 + 16));
}

void sub_100037758(uint64_t a1)
{
  if (IsAppleInternalBuild() && a1 == 1)
  {
    id v3 = [v1 infoButtonAction];

    if (!v3)
    {
      uint64_t v4 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_retain();
      NSString v5 = String._bridgeToObjectiveC()();
      v8[4] = sub_100037AF4;
      v8[5] = v4;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 1107296256;
      v8[2] = sub_10002F814;
      v8[3] = &unk_10005AD90;
      uint64_t v6 = _Block_copy(v8);
      id v7 = [self actionWithTitle:v5 style:0 handler:v6];

      _Block_release(v6);
      swift_release();
      swift_release();
      [v1 setInfoButtonAction:v7];
    }
  }
}

id sub_1000378CC(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_type] = 2;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_router + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = &v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 1;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_carouselView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_otaLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellable] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellablePageControl] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices] = &_swiftEmptyArrayStorage;
  NSString v5 = &v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_appName];
  *NSString v5 = 0;
  v5[1] = 0xE000000000000000;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoveryTitleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner] = 0;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  return [super initWithContentView:a1];
}

void sub_1000379E0()
{
  id v1 = [v0 infoButton];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [self secondaryLabelColor];
    [v2 setTintColor:v3];
  }
  id v4 = [v0 infoButton];
  if (v4)
  {
    NSString v5 = v4;
    id v6 = [self secondarySystemBackgroundColor];
    [v5 setBackgroundColor:v6];
  }
}

void sub_100037AF4(uint64_t a1)
{
  sub_100034BE4(a1, v1, sub_1000348BC);
}

uint64_t sub_100037B24()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100037C0C(void *a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor) = 0;
  swift_release();
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel) = 0;

  uint64_t v4 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient;
  NSString v5 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
  if (v5)
  {
    swift_unknownObjectRetain();
    if (a1) {
      a1 = (void *)_convertErrorToNSError(_:)();
    }
    [v5 pickerDidDismiss:a1];

    swift_unknownObjectRelease();
  }
  *(void *)(v1 + v4) = 0;
  swift_unknownObjectRelease();
  uint64_t v6 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection;
  objc_super v7 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection);
  if (v7)
  {
    [v7 invalidate];
    uint64_t v8 = *(void **)(v1 + v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)(v1 + v6) = 0;

  uint64_t v9 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle);
  if (v10)
  {
    [v10 invalidate];
    uint64_t v10 = *(void **)(v1 + v9);
  }
  *(void *)(v1 + v9) = 0;
}

uint64_t sub_100037D20()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100063B20);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100063B20);
  if (qword_1000628F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A40);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_100037DE8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ASUIServerManager()) init];
  qword_100064A90 = (uint64_t)result;
  return result;
}

void sub_100037E18()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v20 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = &v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_router];
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)uint64_t v6 = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_migrationDisplayCount] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_listener] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle] = 0;
  uint64_t v19 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_queue;
  uint64_t v18 = sub_10000C108(0, (unint64_t *)&qword_100063180);
  objc_super v7 = v0;
  static DispatchQoS.userInitiated.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10003D46C((unint64_t *)&unk_100063D80, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000BEA4(&qword_1000634D8);
  sub_100029EA8(&qword_100063D90, &qword_1000634D8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v20);
  *(void *)&v0[v19] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v7[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient] = 0;
  *(void *)&v7[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel] = 0;

  v25.receiver = v7;
  v25.super_class = ObjectType;
  [super init];
  id v23 = v8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10003D4B4;
  *(void *)(v9 + 24) = &v22;
  aBlock[4] = sub_10003D518;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100038330;
  aBlock[3] = &unk_10005B0D8;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = self;
  uint64_t v12 = (char *)v8;
  swift_retain();
  id v13 = [v11 listenerWithConfigurator:v10];
  _Block_release(v10);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    uint64_t v14 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_listener;
    uint64_t v15 = *(void **)&v12[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_listener];
    *(void *)&v12[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_listener] = v13;

    uint64_t v16 = *(void **)&v12[v14];
    if (v16)
    {
      id v17 = v16;
      [v17 activate];

      return;
    }
  }
  __break(1u);
}

id sub_100038270(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

id sub_100038358()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id result = *(id *)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_listener];
  if (result)
  {
    [result invalidate];
    id v3 = *(void **)&v0[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection];
    if (v3) {
      [v3 invalidate];
    }
    v4.receiver = v0;
    v4.super_class = ObjectType;
    return [super dealloc];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ASUIServerManager()
{
  return self;
}

uint64_t sub_1000384D4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  objc_super v4 = &qword_100063000;
  NSString v5 = &selRef_viewDidLoad;
  uint64_t v6 = &unk_100062000;
  if (a2)
  {
    objc_super v7 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection);
    if (!v7) {
      goto LABEL_24;
    }
    swift_bridgeObjectRetain();
    id v10 = [v7 remoteProcess];
    NSString v11 = String._bridgeToObjectiveC()();
    unsigned int v12 = [v10 hasEntitlement:v11];

    if (v12)
    {
      if (qword_1000629A8 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_100005F6C(v13, (uint64_t)qword_100063B20);
      swift_bridgeObjectRetain_n();
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_bridgeObjectRetain();
        sub_100023B0C(a1, a2, &v31);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Override client bundleID with %s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return a1;
      }

      goto LABEL_22;
    }
    if (qword_1000629A8 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100005F6C(v17, (uint64_t)qword_100063B20);
    swift_bridgeObjectRetain();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      sub_100023B0C(a1, a2, &v31);
      objc_super v4 = &qword_100063000;
      NSString v5 = &selRef_viewDidLoad;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Remote process is not entitled to override bundleID with %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v6 = (void *)&unk_100062000;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  uint64_t v21 = *(void **)(v3 + v4[363]);
  if (v21)
  {
    id v22 = [v21 v5[274]];
    id v23 = [v22 bundleIdentifier];

    if (v23)
    {
      a1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = v24;

      if (v6[309] != -1) {
        swift_once();
      }
      uint64_t v26 = type metadata accessor for Logger();
      sub_100005F6C(v26, (uint64_t)qword_100063B20);
      swift_bridgeObjectRetain_n();
      uint64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v29 = 136315138;
        swift_bridgeObjectRetain();
        sub_100023B0C(a1, v25, &v31);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Using authentic bundle ID of remote process: %s", v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return a1;
      }

LABEL_22:
      swift_bridgeObjectRelease_n();
      return a1;
    }
  }
LABEL_24:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100038AB8()
{
  *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor) = 0;
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel) = 0;

  *(void *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient) = 0;
  swift_unknownObjectRelease();
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection);
  if (v3)
  {
    [v3 invalidate];
    objc_super v4 = *(void **)(v0 + v2);
  }
  else
  {
    objc_super v4 = 0;
  }
  *(void *)(v0 + v2) = 0;

  uint64_t v5 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle);
  if (v6)
  {
    [v6 invalidate];
    uint64_t v6 = *(void **)(v0 + v5);
  }
  *(void *)(v0 + v5) = 0;
}

void sub_100038B78(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [self interfaceWithIdentifier:v4];

  uint64_t v6 = self;
  id v7 = [v6 protocolForProtocol:&OBJC_PROTOCOL___ASUIServer];
  [v5 setServer:v7];

  id v8 = [v6 protocolForProtocol:&OBJC_PROTOCOL___ASUIClient];
  [v5 setClient:v8];

  [v5 setClientMessagingExpectation:0];
  sub_10000C108(0, (unint64_t *)&qword_100063180);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  [a1 setTargetQueue:v9];

  id v10 = [self userInitiated];
  [a1 setServiceQuality:v10];

  [a1 setInterface:v5];
  [a1 setInterfaceTarget:a2];
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = sub_10003D424;
  uint64_t v21 = v11;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_10000E4BC;
  os_log_type_t v19 = &unk_10005B010;
  unsigned int v12 = _Block_copy(&v16);
  swift_release();
  [a1 setActivationHandler:v12];
  _Block_release(v12);
  uint64_t v20 = sub_1000390C8;
  uint64_t v21 = 0;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_10000E4BC;
  os_log_type_t v19 = &unk_10005B038;
  uint64_t v13 = _Block_copy(&v16);
  [a1 setInterruptionHandler:v13];
  _Block_release(v13);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v20 = sub_10003D464;
  uint64_t v21 = v14;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_10000E4BC;
  os_log_type_t v19 = &unk_10005B088;
  os_log_type_t v15 = _Block_copy(&v16);
  swift_release();
  [a1 setInvalidationHandler:v15];
  _Block_release(v15);
}

void sub_100038EFC(void *a1)
{
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063B20);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ASUIServerManager: connection activated from client!", v5, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v7 = (char *)Strong;
    if ([a1 remoteTarget])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v9, 0, sizeof(v9));
    }
    sub_10003D35C((uint64_t)v9, (uint64_t)v10);
    if (v11)
    {
      sub_10000BEA4(&qword_100063D78);
      if (swift_dynamicCast())
      {
        *(void *)&v7[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient] = v8;

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {

      sub_10003D3C4((uint64_t)v10);
    }
  }
}

id sub_1000390C8(void *a1)
{
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063B20);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ASUIServerManager: connection interrupted, reconnecting", v5, 2u);
    swift_slowDealloc();
  }

  return [a1 activate];
}

void sub_1000391C0()
{
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F6C(v0, (uint64_t)qword_100063B20);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ASUIServerManager: connection invalidated from client!", v3, 2u);
    swift_slowDealloc();
  }

  id Strong = (id)swift_unknownObjectUnownedLoadStrong();
  sub_100038AB8();
}

uint64_t sub_1000392CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void sub_1000393B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(char **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v3)
  {
    os_log_type_t v4 = &v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID];
    if (*(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8])
    {
      id v7 = objc_allocWithZone((Class)DADeviceAppAccessInfo);
      swift_bridgeObjectRetain();
      uint64_t v8 = v3;
      swift_bridgeObjectRetain();
      NSString v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      NSString v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v11 = [v7 initWithBundleIdentifier:v9 deviceIdentifier:v10 state:0];

      id v12 = [objc_allocWithZone((Class)DADevice) init];
      NSString v13 = String._bridgeToObjectiveC()();
      [v12 setIdentifier:v13];

      id v14 = [objc_allocWithZone((Class)DASession) init];
      if (*((void *)v4 + 1))
      {
        swift_bridgeObjectRetain();
        NSString v15 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v15 = 0;
      }
      [v14 setBundleID:v15];

      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      os_log_type_t v19 = (void *)swift_allocObject();
      v19[2] = v18;
      v19[3] = a1;
      v19[4] = a2;
      v19[5] = v11;
      v19[6] = v14;
      aBlock[4] = sub_10003D2D4;
      aBlock[5] = v19;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = (id)1107296256;
      void aBlock[2] = sub_10003A454;
      aBlock[3] = &unk_10005AF70;
      uint64_t v20 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      id v21 = v11;
      id v22 = v14;
      swift_release();
      [v22 getDevicesWithFlags:8 completionHandler:v20];
      _Block_release(v20);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
    if (v16)
    {
      type metadata accessor for ASError(0);
      void aBlock[6] = (id)550;
      swift_unknownObjectRetain();
      sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
      sub_10003D46C(&qword_100062BA0, type metadata accessor for ASError);
      _BridgedStoredNSError.init(_:userInfo:)();
      uint64_t v17 = (void *)_convertErrorToNSError(_:)();

      [v16 relayPickerCompletion:v17];
      swift_unknownObjectRelease();
    }
  }
}

void sub_100039714(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_1000629A8 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100005F6C(v7, (uint64_t)qword_100063B20);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      NSString v10 = (uint8_t *)swift_slowAlloc();
      id v11 = (id *)swift_slowAlloc();
      *(_DWORD *)NSString v10 = 138412290;
      swift_errorRetain();
      v68[0] = (id)_swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v11 = v68[0];
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error fetching accessories: %@", v10, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      swift_errorRelease();
      return;
    }
    unint64_t v24 = (void *)Strong;
    unint64_t v25 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
    if (v25)
    {
      swift_unknownObjectRetain();

      type metadata accessor for ASError(0);
      sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
      sub_10003D46C(&qword_100062BA0, type metadata accessor for ASError);
      _BridgedStoredNSError.init(_:userInfo:)();
      uint64_t v26 = (void *)_convertErrorToNSError(_:)();

      [v25 relayPickerCompletion:v26];
      swift_errorRelease();

LABEL_21:
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_22;
  }
  if (a1 && (swift_bridgeObjectRetain(), id v17 = sub_10003C85C(a1, a4, a5), swift_bridgeObjectRelease(), v17))
  {
    if ([v17 state] != (id)20)
    {
      if (qword_1000629A8 != -1) {
        swift_once();
      }
      uint64_t v30 = type metadata accessor for Logger();
      sub_100005F6C(v30, (uint64_t)qword_100063B20);
      swift_bridgeObjectRetain_n();
      uint64_t v31 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v31, v32))
      {
        id v33 = (uint8_t *)swift_slowAlloc();
        v68[0] = (id)swift_slowAlloc();
        *(_DWORD *)id v33 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v67 = (void *)sub_100023B0C(a4, a5, (uint64_t *)v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Error failing accessory %s since accessory is not pending authorization", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_beginAccess();
      uint64_t v46 = swift_unknownObjectWeakLoadStrong();
      if (!v46) {
        goto LABEL_56;
      }
      uint64_t v47 = (void *)v46;
      uint64_t v48 = *(void **)(v46 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
      if (v48)
      {
        swift_unknownObjectRetain();

        type metadata accessor for ASError(0);
        sub_10000BEA4(&qword_100063D08);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100049280;
        *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 40) = v50;
        *(void *)(inited + 72) = &type metadata for String;
        *(void *)(inited + 48) = 0xD00000000000002ELL;
        *(void *)(inited + 56) = 0x800000010004B7F0;
        sub_10002F818(inited);
        sub_10003D46C(&qword_100062BA0, type metadata accessor for ASError);
        _BridgedStoredNSError.init(_:userInfo:)();
        uint64_t v51 = (void *)_convertErrorToNSError(_:)();

        [v48 relayPickerCompletion:v51];
LABEL_55:
        swift_unknownObjectRelease();
        goto LABEL_56;
      }
LABEL_57:

      return;
    }
    if (qword_1000629A8 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100005F6C(v18, (uint64_t)qword_100063B20);
    id v65 = v17;
    id v17 = v17;
    os_log_type_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    uint64_t v64 = v18;
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = (void *)swift_slowAlloc();
      *(_DWORD *)id v21 = 138412290;
      v68[0] = v17;
      id v22 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v63 = v65;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Fail accessory setup for %@", v21, 0xCu);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v68[0] = 0;
    unsigned int v34 = [self setDeviceAppAccessInfo:a6 device:v17 session:a7 error:v68];
    id v35 = v68[0];
    if (v34)
    {
      swift_beginAccess();
      uint64_t v36 = swift_unknownObjectWeakLoadStrong();
      if (v36)
      {
        uint64_t v37 = (void *)v36;
        uint64_t v38 = *(void *)(v36 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_router);
        swift_unknownObjectRetain();
        id v39 = v35;

        if (!v38)
        {
          __break(1u);
          return;
        }
        if (qword_100062970 != -1) {
          swift_once();
        }
        sub_100005F6C(v64, (uint64_t)qword_100063070);
        uint64_t v40 = Logger.logObject.getter();
        os_log_type_t v41 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "Showing Error View", v42, 2u);
          swift_slowDealloc();
        }

        uint64_t v43 = *(void **)(v38 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_navigationController);
        if (v43)
        {
          id v44 = v43;
          id v45 = sub_100030FCC();
          [v44 pushViewController:v45 animated:1];
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      else
      {
        id v60 = v35;
      }
      swift_beginAccess();
      uint64_t v61 = swift_unknownObjectWeakLoadStrong();
      if (!v61)
      {
LABEL_56:

        return;
      }
      uint64_t v47 = (void *)v61;
      id v62 = *(void **)(v61 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
      if (v62)
      {
        swift_unknownObjectRetain();

        [v62 relayPickerCompletion:0];
        goto LABEL_55;
      }
      goto LABEL_57;
    }
    id v52 = v68[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    Swift::Int v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      id v66 = v17;
      uint64_t v56 = (void *)swift_slowAlloc();
      v68[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 136315394;
      swift_bridgeObjectRetain();
      sub_100023B0C(a4, a5, (uint64_t *)v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v55 + 12) = 2112;
      swift_errorRetain();
      uint64_t v67 = (void *)_swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v56 = v67;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Error failing accessory %s due to %@", (uint8_t *)v55, 0x16u);
      sub_10000BEA4(&qword_100062ED8);
      swift_arrayDestroy();
      id v17 = v66;
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_beginAccess();
    uint64_t v57 = swift_unknownObjectWeakLoadStrong();
    if (v57)
    {
      unint64_t v24 = (void *)v57;
      uint64_t v58 = *(void **)(v57 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
      if (!v58)
      {

LABEL_22:
        swift_errorRelease();
LABEL_23:

        return;
      }
      swift_unknownObjectRetain();

      type metadata accessor for ASError(0);
      sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
      sub_10003D46C(&qword_100062BA0, type metadata accessor for ASError);
      _BridgedStoredNSError.init(_:userInfo:)();
      uint64_t v59 = (void *)_convertErrorToNSError(_:)();

      [v58 relayPickerCompletion:v59];
      swift_unknownObjectRelease();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v27 = swift_unknownObjectWeakLoadStrong();
    if (v27)
    {
      unint64_t v24 = (void *)v27;
      os_log_type_t v28 = *(void **)(v27 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
      if (v28)
      {
        swift_unknownObjectRetain();

        type metadata accessor for ASError(0);
        sub_100023820((uint64_t)&_swiftEmptyArrayStorage);
        sub_10003D46C(&qword_100062BA0, type metadata accessor for ASError);
        _BridgedStoredNSError.init(_:userInfo:)();
        os_log_type_t v29 = (void *)_convertErrorToNSError(_:)();

        [v28 relayPickerCompletion:v29];
        goto LABEL_21;
      }
      goto LABEL_23;
    }
  }
}

uint64_t sub_10003A454(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10000C108(0, &qword_100063D00);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10003A560(void *a1)
{
  id v2 = [a1 integerValue];
  *(void *)&v1[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_migrationDisplayCount] = v2;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005F6C(v3, (uint64_t)qword_100063B20);
  uint64_t v7 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 134217984;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Only Migration displayItems Count : %ld", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10003A738(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v86 = a1;
  os_log_type_t v9 = (void *)type metadata accessor for DispatchWorkItemFlags();
  uint64_t v82 = *(v9 - 1);
  __chkstk_darwin(v9);
  id v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v78 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100005F6C(v15, (uint64_t)qword_100063B20);
  swift_bridgeObjectRetain_n();
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = v16;
  id v20 = v17;
  id v21 = v18;
  id v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  int v24 = v23;
  BOOL v25 = os_log_type_enabled(v22, v23);
  id v80 = v11;
  uint64_t v81 = v12;
  uint64_t v79 = v13;
  id v83 = v19;
  unint64_t v84 = a2;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    int v75 = v24;
    uint64_t v27 = v26;
    os_log_type_t v28 = (void *)swift_slowAlloc();
    uint64_t v76 = swift_slowAlloc();
    aBlock[0] = v76;
    *(_DWORD *)uint64_t v27 = 136315906;
    BOOL v29 = a2 == 0;
    uint64_t v30 = v19;
    unint64_t v31 = a2;
    if (a2) {
      uint64_t v32 = v86;
    }
    else {
      uint64_t v32 = 0;
    }
    id v74 = v20;
    if (v29) {
      unint64_t v33 = 0xE000000000000000;
    }
    else {
      unint64_t v33 = v31;
    }
    uint64_t v77 = v9;
    swift_bridgeObjectRetain();
    id v87 = (id)sub_100023B0C(v32, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2112;
    id v87 = v30;
    id v34 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v28 = v30;

    *(_WORD *)(v27 + 22) = 2112;
    id v35 = v74;
    id v87 = v74;
    id v36 = v74;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v28[1] = v35;

    *(_WORD *)(v27 + 32) = 2112;
    id v87 = v21;
    id v37 = v21;
    os_log_type_t v9 = v77;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void v28[2] = v21;

    _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)v75, "showPickerWithOverrideBundleID: %s, shouldRetrieveDisplayItems: %@, needsBluetooth: %@, needsWiFi: %@", (uint8_t *)v27, 0x2Au);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v38 = v21;
    id v39 = v35;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v38 = v21;
    id v39 = v20;
  }
  id v40 = [self identityOfCurrentProcess];
  os_log_type_t v41 = v85;
  if (v40)
  {
    uint64_t v42 = v40;
    uint64_t v43 = v39;
    uint64_t v44 = [v39 BOOLValue];
    uint64_t v77 = v38;
    if ([v38 BOOLValue]) {
      uint64_t v45 = v44 | 2;
    }
    else {
      uint64_t v45 = v44;
    }
    type metadata accessor for ASUISystemMonitor();
    swift_allocObject();
    uint64_t v46 = sub_1000289A4();
    *((void *)v46 + 7) = v45;
    uint64_t v47 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor;
    *(void *)&v41[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor] = v46;
    swift_release();
    uint64_t v48 = *(void *)&v41[v47];
    if (v48)
    {
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = v42;
      *(void *)(v49 + 24) = v41;
      uint64_t v50 = *(void *)(v48 + 24);
      *(void *)(v48 + 24) = sub_10003D1D4;
      *(void *)(v48 + 32) = v49;
      uint64_t v51 = v41;
      id v52 = v42;
      sub_100005A34(v50);
      if (*(void *)&v41[v47])
      {
        swift_retain();
        sub_100026A58(v45);
        swift_release();
        uint64_t v53 = sub_1000384D4(v86, v84);
        unint64_t v55 = v54;
        id v56 = objc_allocWithZone((Class)type metadata accessor for ASUIClientModel());
        uint64_t v57 = sub_10003D848(v53, v55, 0);
        uint64_t v58 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel;
        uint64_t v59 = *(void **)&v51[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel];
        *(void *)&v51[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel] = v57;

        id v60 = *(void **)&v51[v58];
        if (v60)
        {
          uint64_t v61 = v60;
          unsigned __int8 v62 = [v43 BOOLValue];
          v61[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth] = v62;

          uint64_t v63 = *(void **)&v51[v58];
          if (v63)
          {
            uint64_t v64 = v63;
            unsigned __int8 v65 = [v77 BOOLValue];
            v64[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi] = v65;
          }
        }
        if ([v83 BOOLValue])
        {
          uint64_t v66 = swift_allocObject();
          swift_unknownObjectWeakInit();
          aBlock[4] = (uint64_t)sub_10003D1DC;
          aBlock[5] = v66;
          aBlock[0] = (uint64_t)_NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          void aBlock[2] = (uint64_t)sub_100015768;
          aBlock[3] = (uint64_t)&unk_10005AED0;
          uint64_t v67 = _Block_copy(aBlock);
          swift_retain();
          uint64_t v68 = v52;
          uint64_t v69 = v78;
          static DispatchQoS.unspecified.getter();
          id v87 = &_swiftEmptyArrayStorage;
          sub_10003D46C((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_10000BEA4((uint64_t *)&unk_100063190);
          sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
          id v70 = v80;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();
          _Block_release(v67);

          (*(void (**)(char *, void *))(v82 + 8))(v70, v9);
          (*(void (**)(char *, uint64_t))(v79 + 8))(v69, v81);
          swift_release();
          swift_release();
        }
        else
        {
          unint64_t v71 = *(void **)&v51[v58];
          if (v71)
          {
            id v72 = v71;
            sub_10003D7A8((uint64_t)&_swiftEmptyArrayStorage);
          }
        }
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

void sub_10003AF14(void *a1, uint64_t a2)
{
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005F6C(v4, (uint64_t)qword_100063B20);
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "System Capabilities Preliminary Check Complete: activate remote UI", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
  id v9 = a1;
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v8 initWithSceneProvidingProcess:v9 configurationIdentifier:v10];

  id v12 = [self newHandleWithDefinition:v11 configurationContext:0];
  id v13 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
  [v12 registerObserver:a2];
  [v12 activateWithContext:v13];
}

void *sub_10003B0E4(uint64_t a1)
{
  os_log_type_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_100024794(i, (uint64_t)v5);
    sub_10000C108(0, (unint64_t *)&unk_100063CF0);
    if (!swift_dynamicCast()) {
      break;
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void sub_10003B2B8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v41 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v39 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for DispatchQoS();
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  id v37 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100005F6C(v9, (uint64_t)qword_100063B20);
  swift_bridgeObjectRetain_n();
  NSString v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v36 = a1;
  if (v12)
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v35 = v14;
    *(_DWORD *)id v13 = 136315138;
    aBlock[0] = v14;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 0;
    }
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v42 = (void *)sub_100023B0C(v15, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "showMigrationPickerWithOverrideBundleID: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v17 = [self identityOfCurrentProcess];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = sub_1000384D4(v36, a2);
    unint64_t v21 = v20;
    id v22 = objc_allocWithZone((Class)type metadata accessor for ASUIClientModel());
    os_log_type_t v23 = sub_10003D848(v19, v21, 1);
    int v24 = *(void **)(v3 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    *(void *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel) = v23;

    uint64_t v36 = *(void *)(v3 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_queue);
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_10003D130;
    aBlock[5] = v25;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    void aBlock[2] = (uint64_t)sub_100015768;
    aBlock[3] = (uint64_t)&unk_10005AE30;
    uint64_t v26 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v27 = v37;
    static DispatchQoS.unspecified.getter();
    uint64_t v42 = &_swiftEmptyArrayStorage;
    sub_10003D46C((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000BEA4((uint64_t *)&unk_100063190);
    sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
    os_log_type_t v28 = v39;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v26);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v28, v6);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v40);
    swift_release();
    swift_release();
    id v29 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    id v30 = v18;
    NSString v31 = String._bridgeToObjectiveC()();
    id v32 = [v29 initWithSceneProvidingProcess:v30 configurationIdentifier:v31];

    id v33 = [self newHandleWithDefinition:v32 configurationContext:0];
    id v34 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
    [v33 registerObserver:v3];
    [v33 activateWithContext:v34];
  }
}

uint64_t sub_10003B884(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v51 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v49 = v13;
  uint64_t v50 = v14;
  __chkstk_darwin(v13);
  uint64_t v48 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v47 = a1 + 16;
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v17 = Strong;
    id v18 = *(void **)&Strong[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient];
    if (v18)
    {
      swift_unknownObjectRetain();

      id v19 = [v18 retrieveDisplayItems];
      swift_unknownObjectRelease();
      uint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v21 = sub_10003B0E4(v20);
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v21 = &_swiftEmptyArrayStorage;
LABEL_7:
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  sub_100005F6C(v22, (uint64_t)qword_100063B20);
  swift_bridgeObjectRetain_n();
  os_log_type_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v45 = a5;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v46 = v11;
    aBlock[0] = v27;
    uint64_t v43 = a2;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v42 = v26 + 4;
    sub_10000C108(0, (unint64_t *)&unk_100063CF0);
    uint64_t v28 = a4;
    swift_bridgeObjectRetain();
    uint64_t v29 = Array.description.getter();
    uint64_t v44 = a3;
    uint64_t v30 = v10;
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v33 = v29;
    a4 = v28;
    uint64_t aBlock[6] = sub_100023B0C(v33, v32, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    uint64_t v10 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, v43, v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v11 = v46;
    swift_slowDealloc();
    a5 = v45;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_10000C108(0, (unint64_t *)&qword_100063180);
  id v34 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v35 = swift_allocObject();
  swift_beginAccess();
  uint64_t v36 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v35;
  *(void *)(v37 + 24) = v21;
  aBlock[4] = a4;
  aBlock[5] = v37;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = (uint64_t)sub_100015768;
  aBlock[3] = a5;
  uint64_t v38 = _Block_copy(aBlock);
  swift_retain();
  id v39 = v48;
  static DispatchQoS.unspecified.getter();
  id v52 = &_swiftEmptyArrayStorage;
  sub_10003D46C((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  uint64_t v40 = v51;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v38);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v40, v10);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v39, v49);
  swift_release();
  return swift_release();
}

void sub_10003BE40()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    if (v2)
    {
      id v3 = v2;

      uint64_t v4 = swift_bridgeObjectRetain();
      uint64_t v1 = v3;
      sub_10003D7A8(v4);
    }
  }
}

void sub_10003BF3C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6, unint64_t a7)
{
  uint64_t v8 = v7;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100005F6C(v14, (uint64_t)qword_100063B20);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v15 = a5;
  unint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v51 = v15;
    unint64_t v52 = a2;
    uint64_t v18 = swift_slowAlloc();
    id v19 = (void *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315906;
    swift_bridgeObjectRetain();
    sub_100023B0C(a1, v52, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_100023B0C(a3, a4, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2112;
    id v20 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v19 = v51;

    *(_WORD *)(v18 + 32) = 2080;
    if (a7) {
      uint64_t v21 = a6;
    }
    else {
      uint64_t v21 = 0;
    }
    if (a7) {
      unint64_t v22 = a7;
    }
    else {
      unint64_t v22 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_100023B0C(v21, v22, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "renameAccessory: %s, %s, %@, overrideBundleID: %s", (uint8_t *)v18, 0x2Au);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    id v15 = v51;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  id v23 = [self identityOfCurrentProcess];
  if (v23)
  {
    os_log_type_t v24 = v23;
    uint64_t v25 = sub_1000384D4(a6, a7);
    unint64_t v27 = v26;
    id v28 = objc_allocWithZone((Class)type metadata accessor for ASUIClientModel());
    uint64_t v29 = sub_10003D848(v25, v27, 2);
    uint64_t v30 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel;
    unint64_t v31 = *(void **)(v8 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    *(void *)(v8 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel) = v29;

    id v32 = [objc_allocWithZone((Class)ASAccessory) init];
    NSString v33 = String._bridgeToObjectiveC()();
    [v32 setIdentifier:v33];

    NSString v34 = String._bridgeToObjectiveC()();
    [v32 setDisplayName:v34];

    uint64_t v35 = *(void *)(v8 + v30);
    if (v35)
    {
      uint64_t v36 = *(void **)(v35 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory);
      *(void *)(v35 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory) = v32;
      id v37 = v32;

      uint64_t v38 = *(void **)(v8 + v30);
      if (v38)
      {
        id v39 = v38;
        unsigned __int8 v40 = [v15 BOOLValue];
        v39[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_accessoryRenamingSSID] = v40;

        uint64_t v41 = *(void **)(v8 + v30);
        if (v41)
        {
          id v42 = v41;
          sub_10003D7A8((uint64_t)&_swiftEmptyArrayStorage);
        }
      }
    }
    id v43 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    id v44 = v24;
    NSString v45 = String._bridgeToObjectiveC()();
    id v46 = [v43 initWithSceneProvidingProcess:v44 configurationIdentifier:v45];

    id v47 = [self newHandleWithDefinition:v46 configurationContext:0];
    id v48 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
    [v47 registerObserver:v8];
    [v47 activateWithContext:v48];
  }
}

id sub_10003C59C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005F6C(v3, (uint64_t)qword_100063B20);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "remoteAlertHandleDidActivate!", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle);
  *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_remoteAlertHandle) = a1;

  uint64_t v8 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient;
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
  if (v9)
  {
    id v10 = a1;
    [v9 pickerDidPresent];
    id result = *(id *)(v2 + v8);
    if (result)
    {
      return [result relayPickerCompletion:0];
    }
  }
  else
  {
    return a1;
  }
  return result;
}

void *sub_10003C85C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 identifier];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10003C9F0(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005F6C(v4, (uint64_t)qword_100063B20);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    aBlock[0] = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "ASUIServerManager received a connection %@", v8, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10003D31C;
  *(void *)(v12 + 24) = v11;
  os_log_type_t v24 = sub_10003D334;
  uint64_t v25 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100038330;
  id v23 = &unk_10005AFE8;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = v2;
  swift_retain();
  swift_release();
  [v5 configureConnection:v13];
  _Block_release(v13);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    [v5 activate];
    uint64_t v16 = OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection;
    os_log_type_t v17 = *(void **)&v14[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection];
    if (v17)
    {
      [v17 invalidate];
      uint64_t v18 = *(void **)&v14[v16];
      *(void *)&v14[v16] = 0;

      id v19 = *(void **)&v14[v16];
    }
    else
    {
      id v19 = 0;
    }
    *(void *)&v14[v16] = v5;

    if ([v5 remoteTarget])
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v21, 0, sizeof(v21));
    }
    sub_10003D35C((uint64_t)v21, (uint64_t)aBlock);
    if (v23)
    {
      sub_10000BEA4(&qword_100063D78);
      if (swift_dynamicCast())
      {
        *(void *)&v14[OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient] = v20;
        swift_release();
        return swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10003D3C4((uint64_t)aBlock);
    }
    return swift_release();
  }
  return result;
}

id sub_10003CDAC()
{
  uint64_t v1 = v0;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005F6C(v2, (uint64_t)qword_100063B20);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "remoteAlertHandleDidDeactivate!", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClient);
  if (v6) {
    [v6 pickerDidDismiss:0];
  }
  id result = *(id *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection);
  if (result)
  {
    return [result invalidate];
  }
  return result;
}

id sub_10003CEE0(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_1000629A8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005F6C(v4, (uint64_t)qword_100063B20);
  swift_errorRetain();
  swift_errorRetain();
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138412290;
    if (a1)
    {
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v9 = 0;
    }
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "didInvalidateWithError! %@", v7, 0xCu);
    sub_10000BEA4(&qword_100062ED8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id result = *(id *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_connection);
  if (result) {
    return [result invalidate];
  }
  return result;
}

uint64_t sub_10003D0F8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003D130()
{
  return sub_10003B884(v0, "Did fetch migrationDisplayItems: %s", (uint64_t)&unk_10005AE68, (uint64_t)sub_10003D4CC, (uint64_t)&unk_10005AE80);
}

uint64_t sub_10003D178(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003D188()
{
  return swift_release();
}

uint64_t sub_10003D194()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003D1D4()
{
  sub_10003AF14(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10003D1DC()
{
  return sub_10003B884(v0, "Did fetch displayItems: %s", (uint64_t)&unk_10005AF08, (uint64_t)sub_10003D268, (uint64_t)&unk_10005AF20);
}

uint64_t sub_10003D228()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003D268()
{
}

uint64_t sub_10003D284()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10003D2D4(unint64_t a1, uint64_t a2)
{
  sub_100039714(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_10003D2E4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003D31C(void *a1)
{
  sub_100038B78(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003D324()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003D334()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10003D35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BEA4(&qword_100063D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003D3C4(uint64_t a1)
{
  uint64_t v2 = sub_10000BEA4(&qword_100063D70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10003D424(void *a1)
{
}

uint64_t sub_10003D42C()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003D464()
{
}

uint64_t sub_10003D46C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_10003D4B4(void *a1)
{
  return sub_100038270(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003D4BC()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10003D5D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_10003D640()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F08(v0, qword_100063E90);
  uint64_t v1 = sub_100005F6C(v0, (uint64_t)qword_100063E90);
  if (qword_1000628F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005F6C(v0, (uint64_t)qword_100064A40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10003D708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName);
  void *v3 = a1;
  v3[1] = a2;
  uint64_t result = swift_bridgeObjectRelease();
  if (v3[1] && *(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon))
  {
    if (*(void *)(v2 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      CurrentValueSubject.send(_:)();
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10003D7A8(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems;
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems) = a1;
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName + 8)
    && *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon))
  {
    if (*(void *)(v1 + v2))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      CurrentValueSubject.send(_:)();
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

unsigned char *sub_10003D848(uint64_t a1, unint64_t a2, int a3)
{
  int v30 = a3;
  unint64_t v29 = a2;
  uint64_t v31 = a1;
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  __chkstk_darwin(v4);
  os_log_type_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v7);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = &v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID];
  *uint64_t v9 = 0;
  v9[1] = 0;
  id v10 = &v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName];
  *id v10 = 0;
  v10[1] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory] = 0;
  v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_accessoryRenamingSSID] = 0;
  v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType] = 3;
  v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth] = 0;
  v3[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi] = 0;
  uint64_t v11 = OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItemsPublisher;
  NSString v34 = 0;
  sub_10000BEA4(&qword_100062F20);
  swift_allocObject();
  uint64_t v12 = v3;
  *(void *)&v3[v11] = CurrentValueSubject.init(_:)();
  uint64_t v13 = OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_queue;
  sub_100024B64();
  static DispatchQoS.unspecified.getter();
  NSString v34 = &_swiftEmptyArrayStorage;
  sub_10003F138((unint64_t *)&unk_100063D80, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000BEA4(&qword_1000634D8);
  sub_100029EA8(&qword_100063D90, &qword_1000634D8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v28);
  *(void *)&v12[v13] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  uint64_t v14 = (objc_class *)type metadata accessor for ASUIClientModel();
  v33.receiver = v12;
  v33.super_class = v14;
  [super init];
  uint64_t v16 = qword_1000629B8;
  os_log_type_t v17 = v15;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_100005F6C(v18, (uint64_t)qword_100063E90);
  unint64_t v19 = v29;
  swift_bridgeObjectRetain_n();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    NSString v34 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = v31;
    uint64_t v32 = sub_100023B0C(v31, v19, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Creating client model for: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v23 = v31;
  }
  v17[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_flowType] = v30;
  os_log_type_t v24 = (uint64_t *)&v17[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID];
  *os_log_type_t v24 = v23;
  v24[1] = v19;
  swift_bridgeObjectRelease();
  sub_10003DD24();

  return v17;
}

uint64_t sub_10003DD24()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v14 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v4 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  os_log_type_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_queue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10003EFD4;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100015768;
  void aBlock[3] = &unk_10005B128;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = v7;
  swift_retain();
  static DispatchQoS.unspecified.getter();
  id v15 = &_swiftEmptyArrayStorage;
  sub_10003F138((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000BEA4((uint64_t *)&unk_100063190);
  sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  swift_release();
  return swift_release();
}

void sub_10003DFF8()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v64 = (void *)Strong;
    id v10 = (uint64_t *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID);
    uint64_t v11 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8);
    if (v11)
    {
      uint64_t v12 = *v10;
      id v13 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain();
      id v14 = sub_10001B724(v12, v11, 1);
      uint64_t v63 = v5;
      uint64_t v65 = v6;
      id v60 = v14;
      id v15 = [v14 localizedName];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v61 = v8;
      uint64_t v18 = v17;

      unint64_t v59 = sub_100024B64();
      uint64_t v62 = static OS_dispatch_queue.main.getter();
      uint64_t v0 = (void *)swift_allocObject();
      swift_unknownObjectWeakInit();
      unint64_t v19 = (void *)swift_allocObject();
      v19[2] = v16;
      v19[3] = v18;
      uint64_t v20 = v4;
      os_log_type_t v21 = v61;
      v19[4] = v0;
      unint64_t v71 = sub_10003F03C;
      id v72 = v19;
      id aBlock = _NSConcreteStackBlock;
      uint64_t v68 = 1107296256;
      uint64_t v69 = sub_100015768;
      id v70 = &unk_10005B1A0;
      unint64_t v22 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v66 = &_swiftEmptyArrayStorage;
      uint64_t v23 = sub_10003F138((unint64_t *)&qword_100063CD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      uint64_t v24 = sub_10000BEA4((uint64_t *)&unk_100063190);
      uint64_t v25 = sub_100029EA8((unint64_t *)&qword_100063CE0, (uint64_t *)&unk_100063190);
      uint64_t v57 = v24;
      uint64_t v56 = v25;
      uint64_t v58 = v23;
      uint64_t v26 = v21;
      uint64_t v27 = v20;
      uint64_t v28 = v65;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      unint64_t v29 = (void *)v62;
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v22);

      int v30 = *(void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v31 = v2 + 8;
      uint64_t v32 = v1;
      uint64_t v62 = v31;
      v30(v27, v1);
      uint64_t v35 = *(void (**)(char *, uint64_t))(v28 + 8);
      uint64_t v34 = v28 + 8;
      objc_super v33 = v35;
      v35(v26, v63);
      swift_release();
      swift_release();
      if (v10[1])
      {
        id v36 = objc_allocWithZone((Class)ISIcon);
        swift_bridgeObjectRetain();
        NSString v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v38 = [v36 initWithBundleIdentifier:v37];

        id v39 = [self imageDescriptorNamed:kISImageDescriptorLargeHomeScreen];
        id v40 = [v38 imageForDescriptor:v39];
        uint64_t v0 = v40;
        uint64_t v65 = v34;
        unint64_t v55 = v30;
        unint64_t v54 = v33;
        id v53 = v38;
        id v52 = v39;
        if (!v40 || objc_msgSend(v40, "placeholder", v52, v53, v54, v55))
        {
          id v41 = [v38 prepareImageForDescriptor:v39, v52];
          if (v41)
          {
            id v42 = v41;

            uint64_t v0 = v42;
          }
          else if (!v0)
          {
            id v45 = [objc_allocWithZone((Class)UIImage) init];
            goto LABEL_11;
          }
        }
        id v43 = [v0 CGImage];
        if (v43)
        {
          id v44 = v43;
          id v45 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v43];

LABEL_11:
          id v46 = (void *)static OS_dispatch_queue.main.getter();
          uint64_t v47 = swift_allocObject();
          id v48 = v64;
          swift_unknownObjectWeakInit();
          uint64_t v49 = swift_allocObject();
          *(void *)(v49 + 16) = v47;
          *(void *)(v49 + 24) = v45;
          unint64_t v71 = sub_10003F088;
          id v72 = (void *)v49;
          id aBlock = _NSConcreteStackBlock;
          uint64_t v68 = 1107296256;
          uint64_t v69 = sub_100015768;
          id v70 = &unk_10005B1F0;
          uint64_t v50 = _Block_copy(&aBlock);
          swift_retain();
          id v51 = v45;
          static DispatchQoS.unspecified.getter();
          uint64_t v66 = &_swiftEmptyArrayStorage;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();
          _Block_release(v50);

          v55(v27, v32);
          v54(v26, v63);
          swift_release();
          swift_release();
          return;
        }
LABEL_16:

        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
}

void sub_10003EA58(uint64_t a1, unint64_t a2)
{
  if (qword_1000629B8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005F6C(v4, (uint64_t)qword_100063E90);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    v15[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v14 = a1;
    sub_100023B0C(a1, a2, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong
      || (uint64_t v9 = (void *)Strong,
          uint64_t v11 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID),
          unint64_t v10 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8),
          swift_bridgeObjectRetain(),
          v9,
          !v10))
    {
      swift_bridgeObjectRelease();
      uint64_t v11 = 0;
      unint64_t v10 = 0xE000000000000000;
    }
    sub_100023B0C(v11, v10, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetched appName: %s for appBundleID: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a1 = v14;
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  if (v12)
  {
    id v13 = (void *)v12;
    swift_bridgeObjectRetain();
    sub_10003D708(a1, a2);
  }
}

void sub_10003ED04(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    id v5 = a2;
    sub_10003F090(a2);
  }
}

void sub_10003ED74()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = [objc_allocWithZone((Class)UIImage) init];
    sub_10003F090(v2);
  }
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectWeakLoadStrong();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    swift_beginAccess();
    uint64_t v5 = swift_unknownObjectWeakLoadStrong();
    if (v5)
    {
      os_log_type_t v6 = (void *)v5;
      uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID);
      uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
    sub_10003D708(v7, v8);
  }
}

id sub_10003EE70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIClientModel();
  [super dealloc];
}

uint64_t type metadata accessor for ASUIClientModel()
{
  return self;
}

uint64_t sub_10003EF9C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003EFD4()
{
}

uint64_t sub_10003EFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003EFEC()
{
  return swift_release();
}

void sub_10003EFF4()
{
}

uint64_t sub_10003EFFC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10003F03C()
{
  sub_10003EA58(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10003F048()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003F088()
{
  sub_10003ED04(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10003F090(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon);
  *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon) = a1;
  id v4 = a1;

  if (*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName + 8) && *(void *)(v1 + v2))
  {
    if (*(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_displayItems))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      CurrentValueSubject.send(_:)();
      swift_bridgeObjectRelease();
      swift_release();
    }
  }
}

uint64_t sub_10003F138(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10003F198(char a1@<W0>, uint64_t a2@<X8>)
{
  long long v2 = 0uLL;
  unint64_t v3 = 0xE000000000000000;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0xE000000000000000;
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  long long v10 = 0uLL;
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  long long v17 = 0uLL;
  long long v18 = 0uLL;
  long long v19 = 0uLL;
  switch(a1)
  {
    case 1:
      sub_1000421BC((uint64_t)&v20);
      goto LABEL_15;
    case 2:
      sub_10003F39C((uint64_t)&v20);
      goto LABEL_15;
    case 3:
      goto LABEL_16;
    case 4:
      sub_1000400D4(&v20);
      goto LABEL_15;
    case 5:
      sub_10003FB84(&v20);
      goto LABEL_15;
    case 6:
      sub_100040558(&v20);
      goto LABEL_15;
    case 7:
      sub_100040AA8(&v20);
      goto LABEL_15;
    case 8:
      sub_100042C0C(&v20);
      goto LABEL_15;
    case 9:
      sub_10004122C(&v20);
      goto LABEL_15;
    case 10:
      sub_100043078(&v20);
      goto LABEL_15;
    case 11:
      sub_100041DA0(&v20);
      goto LABEL_15;
    case 12:
      sub_1000434D8(&v20);
      goto LABEL_15;
    case 13:
      sub_100043994(&v20);
      goto LABEL_15;
    default:
      sub_100042648((uint64_t)&v20);
LABEL_15:
      long long v18 = v34;
      long long v19 = v35;
      long long v14 = v32;
      long long v17 = v33;
      long long v10 = v30;
      long long v11 = v31;
      long long v2 = v29;
      uint64_t v15 = v27;
      unint64_t v16 = v28;
      uint64_t v12 = v25;
      unint64_t v13 = v26;
      uint64_t v8 = v23;
      unint64_t v9 = v24;
      uint64_t v6 = v21;
      unint64_t v7 = v22;
      unint64_t v3 = *((void *)&v20 + 1);
      uint64_t v5 = v20;
LABEL_16:
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v3;
      *(void *)(a2 + 16) = v6;
      *(void *)(a2 + 24) = v7;
      *(void *)(a2 + 32) = v8;
      *(void *)(a2 + 40) = v9;
      *(void *)(a2 + 48) = v12;
      *(void *)(a2 + 56) = v13;
      *(void *)(a2 + 64) = v15;
      *(void *)(a2 + 72) = v16;
      *(_OWORD *)(a2 + 80) = v2;
      *(_OWORD *)(a2 + 96) = v10;
      *(_OWORD *)(a2 + 112) = v11;
      *(_OWORD *)(a2 + 128) = v14;
      *(_OWORD *)(a2 + 144) = v17;
      *(_OWORD *)(a2 + 160) = v18;
      *(_OWORD *)(a2 + 176) = v19;
      return;
  }
}

uint64_t sub_10003F340()
{
  sub_10000CC2C(v0 + 16);

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ASUIPresenter()
{
  return self;
}

uint64_t sub_10003F39C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v69 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v11 = (char *)&v57 - v10;
  uint64_t v12 = v1 + 16;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_21;
  }
  long long v14 = *(void **)(result + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  uint64_t v15 = v14;
  uint64_t result = swift_unknownObjectRelease();
  if (!v14)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v16 = &v15[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_devices];
  swift_beginAccess();
  unint64_t v17 = *(void *)v16;
  swift_bridgeObjectRetain();

  if (!(v17 >> 62))
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v18) {
      goto LABEL_5;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(stringLiteral:)();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    static Locale.current.getter();
    uint64_t v51 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v53 = v52;
    uint64_t v54 = v5;
    uint64_t v55 = v51;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v54);
    swift_bridgeObjectRetain();
    unint64_t v43 = 0xE000000000000000;
    swift_bridgeObjectRelease();
    uint64_t v72 = v55;
    uint64_t v73 = v53;
    uint64_t v74 = 0;
    unint64_t v75 = 0xE000000000000000;
    uint64_t v76 = 0;
    unint64_t v77 = 0xE000000000000000;
    uint64_t v78 = 0;
    unint64_t v79 = 0xE000000000000000;
    uint64_t v80 = 0;
    unint64_t v81 = 0xE000000000000000;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    sub_100043DA8(&v72);
    swift_bridgeObjectRelease();
    uint64_t v70 = v55;
    uint64_t v71 = v53;
    uint64_t v89 = v55;
    uint64_t v90 = v53;
    uint64_t v91 = 0;
    unint64_t v92 = 0xE000000000000000;
    uint64_t v93 = 0;
    unint64_t v94 = 0xE000000000000000;
    uint64_t v95 = 0;
    unint64_t v96 = 0xE000000000000000;
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    unsigned long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t result = (uint64_t)sub_10001E588(&v89);
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    NSString v37 = 0;
    unint64_t v46 = 0;
    unint64_t v48 = 0;
    unint64_t v47 = 0;
    unint64_t v45 = 0xE000000000000000;
LABEL_19:
    uint64_t v56 = v71;
    *(void *)a1 = v70;
    *(void *)(a1 + 8) = v56;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0xE000000000000000;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0xE000000000000000;
    *(void *)(a1 + 48) = v18;
    *(void *)(a1 + 56) = v43;
    *(void *)(a1 + 64) = v49;
    *(void *)(a1 + 72) = v45;
    *(void *)(a1 + 80) = v50;
    *(void *)(a1 + 88) = v37;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = v46;
    *(void *)(a1 + 120) = 0;
    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 144) = v48;
    *(void *)(a1 + 152) = v47;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v65 = a1;
  uint64_t v66 = v12;
  unint64_t v64 = v17;
  swift_bridgeObjectRetain();
  String.LocalizationValue.init(stringLiteral:)();
  long long v19 = v9;
  uint64_t v20 = v6 + 16;
  uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v67(v19, v11, v5);
  static Locale.current.getter();
  uint64_t v70 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v22 = v21;
  uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v11, v5);
  uint64_t v71 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  unint64_t v24 = v67;
  v67(v19, v11, v5);
  static Locale.current.getter();
  uint64_t v68 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v25 = v6 + 8;
  unint64_t v27 = v26;
  v23(v11, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v59 = v20;
  v24(v19, v11, v5);
  unint64_t v28 = v19;
  static Locale.current.getter();
  uint64_t v63 = String.init(localized:table:bundle:locale:comment:)();
  unint64_t v30 = v29;
  uint64_t v60 = v25;
  v23(v11, v5);
  unint64_t v62 = v30;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (qword_1000629B0 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v31 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (!v31) {
    goto LABEL_22;
  }
  long long v32 = (void *)(v31 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName);
  uint64_t result = v32[1];
  a1 = v65;
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v33 = v27;
  uint64_t v58 = v5;
  *(void *)&long long v61 = *v32;
  *((void *)&v61 + 1) = result;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  long long v34 = *(void **)(result + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  id v35 = v34;
  uint64_t result = swift_unknownObjectRelease();
  if (v34)
  {
    sub_10000CD24();
    NSString v37 = v36;

    if (v37)
    {
      sub_10002DAC4();
      if (v38 == 10)
      {
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v39 = v58;
        v67(v28, v11, v58);
        static Locale.current.getter();
        uint64_t v40 = String.init(localized:table:bundle:locale:comment:)();
        id v42 = v41;
        v23(v11, v39);
        swift_bridgeObjectRelease();

        NSString v37 = v42;
      }
      else
      {

        uint64_t v40 = 0;
        NSString v37 = 0;
      }
    }
    else
    {
      uint64_t v40 = 0;
    }
    unint64_t v43 = v33;
    uint64_t v69 = (char *)v40;
    uint64_t v72 = v70;
    uint64_t v73 = v71;
    uint64_t v74 = 0;
    unint64_t v75 = 0xE000000000000000;
    uint64_t v76 = 0;
    unint64_t v77 = 0xE000000000000000;
    uint64_t v78 = v68;
    unint64_t v79 = v33;
    unint64_t v45 = v62;
    uint64_t v44 = v63;
    uint64_t v80 = v63;
    unint64_t v81 = v62;
    *(void *)&long long v82 = v40;
    *((void *)&v82 + 1) = v37;
    long long v83 = 0uLL;
    unint64_t v46 = v64;
    long long v84 = v64;
    long long v85 = 0uLL;
    unint64_t v47 = *((void *)&v61 + 1);
    unint64_t v48 = v61;
    long long v86 = v61;
    long long v87 = 0u;
    long long v88 = 0u;
    swift_bridgeObjectRetain();
    sub_100043DA8(&v72);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v89 = v70;
    uint64_t v90 = v71;
    uint64_t v91 = 0;
    unint64_t v92 = 0xE000000000000000;
    uint64_t v93 = 0;
    unint64_t v94 = 0xE000000000000000;
    uint64_t v95 = v68;
    unint64_t v96 = v43;
    uint64_t v97 = v44;
    unint64_t v98 = v45;
    *(void *)&long long v99 = v69;
    *((void *)&v99 + 1) = v37;
    long long v100 = 0uLL;
    long long v101 = v46;
    long long v102 = 0uLL;
    unsigned long long v103 = __PAIR128__(v47, v48);
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v49 = v44;
    uint64_t v18 = v68;
    uint64_t result = (uint64_t)sub_10001E588(&v89);
    uint64_t v50 = v69;
    goto LABEL_19;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_10003FB84(_OWORD *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v53 - v9;
  uint64_t v61 = v1 + 16;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  id v13 = v12;
  swift_unknownObjectRelease();
  if (!v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v59 = a1;
  sub_10000CD24();
  uint64_t v15 = v14;

  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v60(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v58 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v10, v4);
  uint64_t v57 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v56 = v15;
  long long v19 = *(void **)&v15[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
  if (!v19)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v20 = *(void *)&v15[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_100045B20(v20, v19);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v55 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v23 = v60;
  v60(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v54 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v25 = v24;
  v18(v10, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v23(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v26 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v28 = v27;
  v18(v10, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = swift_unknownObjectWeakLoadStrong();
  if (!v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v30 = *(void **)(v29 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  uint64_t v31 = v30;
  swift_unknownObjectRelease();
  if (!v30)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  long long v32 = *(void **)&v31[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest];
  uint64_t v60 = (void (*)(char *, char *, uint64_t))v26;
  if (!v32)
  {
    uint64_t v38 = v28;
    uint64_t v39 = v25;

    uint64_t v61 = 0;
    uint64_t v37 = 0;
    goto LABEL_11;
  }
  id v33 = v32;

  sub_10001B3CC();
  uint64_t v35 = v34;
  uint64_t v37 = v36;

  if (v37)
  {
    uint64_t v38 = v28;
    uint64_t v39 = v25;

    uint64_t v61 = v35;
LABEL_11:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v40 = v57;
    uint64_t v41 = v58;
    *(void *)&long long v63 = v58;
    *((void *)&v63 + 1) = v57;
    uint64_t v42 = v61;
    uint64_t v43 = v54;
    uint64_t v44 = v55;
    *(void *)&long long v64 = v62;
    *((void *)&v64 + 1) = v55;
    *(void *)&long long v65 = 0;
    *((void *)&v65 + 1) = 0xE000000000000000;
    *(void *)&long long v66 = v54;
    *((void *)&v66 + 1) = v39;
    unint64_t v45 = v60;
    *(void *)&long long v67 = v60;
    *((void *)&v67 + 1) = v38;
    long long v68 = 0u;
    long long v69 = 0u;
    *(void *)&long long v70 = 0;
    *((void *)&v70 + 1) = v61;
    *(_OWORD *)((char *)v71 + 8) = 0u;
    *(_OWORD *)((char *)&v71[1] + 8) = 0u;
    *(_OWORD *)((char *)&v71[2] + 8) = 0u;
    *(void *)&v71[0] = v37;
    *((void *)&v71[3] + 1) = 0;
    sub_100043DA8(&v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v72[0] = v41;
    v72[1] = v40;
    v72[2] = v62;
    v72[3] = v44;
    v72[4] = 0;
    v72[5] = 0xE000000000000000;
    v72[6] = v43;
    v72[7] = v39;
    v72[8] = v45;
    v72[9] = v38;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v75 = 0;
    uint64_t v76 = v42;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v77 = v37;
    uint64_t v81 = 0;
    sub_10001E588(v72);
    long long v46 = v71[1];
    unint64_t v47 = v59;
    v59[8] = v71[0];
    v47[9] = v46;
    long long v48 = v71[3];
    v47[10] = v71[2];
    v47[11] = v48;
    long long v49 = v68;
    v47[4] = v67;
    v47[5] = v49;
    long long v50 = v70;
    v47[6] = v69;
    v47[7] = v50;
    long long v51 = v64;
    *unint64_t v47 = v63;
    v47[1] = v51;
    long long v52 = v66;
    v47[2] = v65;
    v47[3] = v52;
    return;
  }
LABEL_18:
  __break(1u);
}

void sub_1000400D4(_OWORD *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v57 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v56 = a1;
  uint64_t v10 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  id v11 = v10;
  swift_unknownObjectRelease();
  if (!v10)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v12 = v3;
  sub_10000CD24();
  long long v14 = v13;

  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v15 = v57;
  long long v52 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v52(v57, v8, v12);
  static Locale.current.getter();
  uint64_t v55 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v50 = v4 + 8;
  long long v51 = v18;
  v18(v8, v12);
  uint64_t v54 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v53 = v14;
  long long v19 = *(void **)&v14[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
  if (v19)
  {
    uint64_t v20 = *(void *)&v14[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100045D48(v20, v19);
    uint64_t v48 = v22;
    uint64_t v49 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v23 = v52;
    v52(v15, v8, v12);
    static Locale.current.getter();
    uint64_t v24 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v46 = v25;
    uint64_t v47 = v24;
    uint64_t v45 = v4 + 16;
    uint64_t v26 = v51;
    v51(v8, v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(stringLiteral:)();
    v23(v15, v8, v12);
    static Locale.current.getter();
    uint64_t v27 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v28 = v8;
    uint64_t v29 = v27;
    uint64_t v31 = v30;
    v26(v28, v12);

    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v33 = v54;
    uint64_t v32 = v55;
    *(void *)&long long v58 = v55;
    *((void *)&v58 + 1) = v54;
    uint64_t v34 = v48;
    uint64_t v35 = v49;
    *(void *)&long long v59 = v49;
    *((void *)&v59 + 1) = v48;
    *(void *)&long long v60 = 0;
    *((void *)&v60 + 1) = 0xE000000000000000;
    uint64_t v37 = v46;
    uint64_t v36 = v47;
    *(void *)&long long v61 = v47;
    *((void *)&v61 + 1) = v46;
    *(void *)&long long v62 = v29;
    *((void *)&v62 + 1) = v31;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    sub_100043DA8(&v58);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v70[0] = v32;
    v70[1] = v33;
    v70[2] = v35;
    v70[3] = v34;
    v70[4] = 0;
    v70[5] = 0xE000000000000000;
    v70[6] = v36;
    v70[7] = v37;
    v70[8] = v29;
    v70[9] = v31;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    sub_10001E588(v70);
    long long v38 = v67;
    uint64_t v39 = v56;
    v56[8] = v66;
    v39[9] = v38;
    long long v40 = v69;
    v39[10] = v68;
    v39[11] = v40;
    long long v41 = v63;
    v39[4] = v62;
    v39[5] = v41;
    long long v42 = v65;
    v39[6] = v64;
    v39[7] = v42;
    long long v43 = v59;
    *uint64_t v39 = v58;
    v39[1] = v43;
    long long v44 = v61;
    v39[2] = v60;
    v39[3] = v44;
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_100040558(_OWORD *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v53 - v9;
  uint64_t v61 = v1 + 16;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  id v13 = v12;
  swift_unknownObjectRelease();
  if (!v12)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  long long v59 = a1;
  sub_10000CD24();
  uint64_t v15 = v14;

  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  String.LocalizationValue.init(stringLiteral:)();
  long long v60 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v60(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v58 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v10, v4);
  uint64_t v57 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v56 = v15;
  long long v19 = *(void **)&v15[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
  if (!v19)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v20 = *(void *)&v15[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_100045F70(v20, v19);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  uint64_t v55 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v23 = v60;
  v60(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v54 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v25 = v24;
  v18(v10, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v23(v8, v10, v4);
  static Locale.current.getter();
  uint64_t v26 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v28 = v27;
  v18(v10, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = swift_unknownObjectWeakLoadStrong();
  if (!v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v30 = *(void **)(v29 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  uint64_t v31 = v30;
  swift_unknownObjectRelease();
  if (!v30)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v32 = *(void **)&v31[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest];
  long long v60 = (void (*)(char *, char *, uint64_t))v26;
  if (!v32)
  {
    uint64_t v38 = v28;
    uint64_t v39 = v25;

    uint64_t v61 = 0;
    uint64_t v37 = 0;
    goto LABEL_11;
  }
  id v33 = v32;

  sub_10001B3CC();
  uint64_t v35 = v34;
  uint64_t v37 = v36;

  if (v37)
  {
    uint64_t v38 = v28;
    uint64_t v39 = v25;

    uint64_t v61 = v35;
LABEL_11:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v40 = v57;
    uint64_t v41 = v58;
    *(void *)&long long v63 = v58;
    *((void *)&v63 + 1) = v57;
    uint64_t v42 = v61;
    uint64_t v43 = v54;
    uint64_t v44 = v55;
    *(void *)&long long v64 = v62;
    *((void *)&v64 + 1) = v55;
    *(void *)&long long v65 = 0;
    *((void *)&v65 + 1) = 0xE000000000000000;
    *(void *)&long long v66 = v54;
    *((void *)&v66 + 1) = v39;
    uint64_t v45 = v60;
    *(void *)&long long v67 = v60;
    *((void *)&v67 + 1) = v38;
    long long v68 = 0u;
    long long v69 = 0u;
    *(void *)&long long v70 = 0;
    *((void *)&v70 + 1) = v61;
    *(_OWORD *)((char *)v71 + 8) = 0u;
    *(_OWORD *)((char *)&v71[1] + 8) = 0u;
    *(_OWORD *)((char *)&v71[2] + 8) = 0u;
    *(void *)&v71[0] = v37;
    *((void *)&v71[3] + 1) = 0;
    sub_100043DA8(&v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v72[0] = v41;
    v72[1] = v40;
    v72[2] = v62;
    v72[3] = v44;
    v72[4] = 0;
    v72[5] = 0xE000000000000000;
    v72[6] = v43;
    v72[7] = v39;
    v72[8] = v45;
    v72[9] = v38;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v75 = 0;
    uint64_t v76 = v42;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v77 = v37;
    uint64_t v81 = 0;
    sub_10001E588(v72);
    long long v46 = v71[1];
    uint64_t v47 = v59;
    v59[8] = v71[0];
    v47[9] = v46;
    long long v48 = v71[3];
    v47[10] = v71[2];
    v47[11] = v48;
    long long v49 = v68;
    v47[4] = v67;
    v47[5] = v49;
    long long v50 = v70;
    v47[6] = v69;
    v47[7] = v50;
    long long v51 = v64;
    *uint64_t v47 = v63;
    v47[1] = v51;
    long long v52 = v66;
    v47[2] = v65;
    v47[3] = v52;
    return;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_100040AA8@<X0>(_OWORD *a1@<X8>)
{
  long long v66 = a1;
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  long long v72 = (char *)v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  long long v71 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v60 - v7;
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v9 = *(void **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (!v9) {
    goto LABEL_23;
  }
  long long v73 = v9;
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v11 = v4 + 16;
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v12 = v71;
  v10(v71, v8, v3);
  static Locale.current.getter();
  uint64_t v70 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v14 = v13;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v15 = v4 + 8;
  v16(v8, v3);
  uint64_t v68 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v10(v12, v8, v3);
  static Locale.current.getter();
  uint64_t v65 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v67 = v17;
  v16(v8, v3);
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v64 = v11;
  uint64_t v62 = v10;
  v10(v12, v8, v3);
  static Locale.current.getter();
  uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v20 = v19;
  uint64_t v63 = v3;
  uint64_t v61 = v16;
  v16(v8, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_22;
  }
  int v22 = *(unsigned __int8 *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType);
  swift_unknownObjectRelease();
  if (v22 == 2)
  {
    v60[1] = v15;
    uint64_t v23 = *(void **)&v73[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory];
    if (!v23)
    {
LABEL_23:
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    id v24 = objc_allocWithZone((Class)DADevice);
    id v25 = v23;
    id v26 = [v24 init];
    NSString v27 = [v25 identifier];
    if (!v27)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    [v26 setIdentifier:v27];

    uint64_t v28 = *(void *)&v73[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8];
    if (v28)
    {
      uint64_t v29 = *(void *)&v73[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID];
      id v30 = objc_allocWithZone((Class)type metadata accessor for ASUIDevice());
      swift_bridgeObjectRetain();
      id v31 = v26;
      uint64_t v32 = (char *)sub_10002DE7C(0, 0, v31, v29, v28);

      id v33 = [v25 displayName];
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v36 = v35;

      long long v69 = v32;
      uint64_t v37 = (uint64_t *)&v32[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
      *uint64_t v37 = v34;
      v37[1] = v36;

      swift_bridgeObjectRelease();
LABEL_16:
      uint64_t v39 = v70;
      goto LABEL_17;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v38 = swift_unknownObjectWeakLoadStrong();
  uint64_t v39 = v70;
  if (v38)
  {
    uint64_t v40 = *(void **)(v38 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
    id v41 = v40;
    swift_unknownObjectRelease();
    if (v40)
    {
      sub_10000CD24();
      long long v69 = v42;
    }
    else
    {
      long long v69 = 0;
    }
    goto LABEL_16;
  }
  long long v69 = 0;
LABEL_17:
  uint64_t v43 = v65;
  if (v73[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_accessoryRenamingSSID] == 1)
  {
    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v70 = v18;
    uint64_t v44 = v39;
    uint64_t v45 = v63;
    v62(v71, v8, v63);
    static Locale.current.getter();
    uint64_t v43 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v47 = v46;
    uint64_t v48 = v45;
    uint64_t v39 = v44;
    uint64_t v18 = v70;
    v61(v8, v48);
    swift_bridgeObjectRelease();
    uint64_t v49 = v47;
  }
  else
  {
    uint64_t v49 = v67;
  }

  uint64_t v50 = v68;
  long long v51 = v69;
  *(void *)&long long v74 = v39;
  *((void *)&v74 + 1) = v68;
  *(void *)&long long v75 = v43;
  *((void *)&v75 + 1) = v49;
  *(void *)&long long v76 = 0;
  *((void *)&v76 + 1) = 0xE000000000000000;
  *(void *)&long long v77 = v18;
  *((void *)&v77 + 1) = v20;
  *(void *)&long long v78 = 0;
  *((void *)&v78 + 1) = 0xE000000000000000;
  long long v79 = 0uLL;
  *(void *)&long long v80 = 0;
  *((void *)&v80 + 1) = v69;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  sub_100043DA8(&v74);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v86[0] = v39;
  v86[1] = v50;
  v86[2] = v43;
  v86[3] = v49;
  v86[4] = 0;
  v86[5] = 0xE000000000000000;
  v86[6] = v18;
  v86[7] = v20;
  v86[8] = 0;
  v86[9] = 0xE000000000000000;
  memset(&v86[10], 0, 24);
  v86[13] = v51;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t result = (uint64_t)sub_10001E588(v86);
  long long v53 = v83;
  uint64_t v54 = v66;
  v66[8] = v82;
  v54[9] = v53;
  long long v55 = v85;
  v54[10] = v84;
  v54[11] = v55;
  long long v56 = v79;
  v54[4] = v78;
  v54[5] = v56;
  long long v57 = v81;
  v54[6] = v80;
  v54[7] = v57;
  long long v58 = v75;
  _OWORD *v54 = v74;
  v54[1] = v58;
  long long v59 = v77;
  v54[2] = v76;
  v54[3] = v59;
  return result;
}

uint64_t sub_10004122C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v118 = a1;
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for String.LocalizationValue();
  uint64_t v5 = *(void *)(v124 - 8);
  uint64_t v6 = __chkstk_darwin(v124);
  uint64_t v119 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v109 - v8;
  uint64_t v10 = v1 + 16;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v12 = (char *)Strong;
  if (Strong)
  {
    uint64_t v13 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
    id v14 = v13;
    swift_unknownObjectRelease();
    if (v13)
    {
      sub_10000CD24();
      uint64_t v12 = v15;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  uint64_t v16 = swift_unknownObjectWeakLoadStrong();
  if (!v16)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  int v17 = *(unsigned __int8 *)(v16 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType);
  swift_unknownObjectRelease();
  os_log_type_t v120 = v4;
  uint64_t v121 = v5;
  uint64_t v122 = v10;
  if (v17 == 2)
  {
    uint64_t v18 = v12;
    if (qword_1000629B0 != -1) {
      swift_once();
    }
    uint64_t v19 = *(char **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    if (!v19) {
      goto LABEL_79;
    }
    uint64_t v20 = *(void **)&v19[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_renameAccessory];
    if (!v20) {
      goto LABEL_79;
    }
    id v21 = objc_allocWithZone((Class)DADevice);
    int v22 = v19;
    id v23 = v20;
    id v24 = [v21 init];
    NSString v25 = [v23 identifier];
    if (!v25)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    [v24 setIdentifier:v25];

    uint64_t v26 = *(void *)&v22[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID + 8];
    if (!v26) {
      goto LABEL_66;
    }
    uint64_t v27 = *(void *)&v22[OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appBundleID];
    id v28 = objc_allocWithZone((Class)type metadata accessor for ASUIDevice());
    swift_bridgeObjectRetain();
    id v29 = v24;
    id v30 = (char *)sub_10002DE7C(0, 0, v29, v27, v26);

    id v31 = [v23 displayName];
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = v33;

    uint64_t v35 = (uint64_t *)&v30[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
    uint64_t *v35 = v32;
    v35[1] = v34;

    swift_bridgeObjectRelease();
    uint64_t v12 = v30;
    uint64_t v36 = v9;
    uint64_t v5 = v121;
  }
  else
  {
    if (!v12)
    {
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    id v30 = v12;
    uint64_t v36 = v9;
  }
  uint64_t v37 = v119;
  if (v30[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_finishSetupInApp] == 1)
  {
    uint64_t v38 = swift_unknownObjectWeakLoadStrong();
    if (!v38)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    int v39 = *(unsigned __int8 *)(v38 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_flowType);
    swift_unknownObjectRelease();
    BOOL v40 = v39 == 0;
  }
  else
  {
    BOOL v40 = 0;
  }
  id v123 = v12;
  uint64_t v41 = swift_unknownObjectWeakLoadStrong();
  if (!v41) {
    goto LABEL_63;
  }
  uint64_t v42 = *(void **)(v41 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  uint64_t v43 = v42;
  swift_unknownObjectRelease();
  if (!v42)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v44 = &v43[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_pendingMigrationItems];
  swift_beginAccess();
  unint64_t v45 = *(void *)v44;
  if (*(void *)v44)
  {
    if (v45 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v47 = v123;
  }
  else
  {

    uint64_t v46 = 0;
    uint64_t v47 = v123;
  }
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v114 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v114(v37, v36, v124);
  static Locale.current.getter();
  uint64_t v116 = String.init(localized:table:bundle:locale:comment:)();
  unint64_t v49 = v48;
  uint64_t v50 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v117 = v5 + 8;
  uint64_t v113 = v50;
  v50(v36, v124);
  unint64_t v115 = v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v40)
  {
    if (v46 < 1)
    {
      uint64_t v137 = 10256610;
      unint64_t v138 = 0xA300000000000000;
      long long v72 = (uint64_t *)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
      long long v73 = *(void **)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
      if (!v73)
      {
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v74 = *v72;
      swift_bridgeObjectRetain();
      v75._countAndFlagsBits = v74;
      v75._object = v73;
      String.append(_:)(v75);
      swift_bridgeObjectRelease();
      v76._countAndFlagsBits = 10322146;
      v76._object = (void *)0xA300000000000000;
      String.append(_:)(v76);
      uint64_t v77 = v137;
      unint64_t v78 = v138;
      swift_bridgeObjectRelease();
      uint64_t v79 = swift_unknownObjectWeakLoadStrong();
      if (!v79)
      {
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
      unint64_t v111 = v78;
      uint64_t v112 = v77;
      long long v80 = *(void **)(v79 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
      id v71 = v80;
      swift_unknownObjectRelease();
      if (!v80)
      {
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      sub_1000144CC(0, 1);
LABEL_58:
      uint64_t v110 = 0;
      goto LABEL_59;
    }
    if (v47)
    {
      long long v60 = (uint64_t *)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
      uint64_t v61 = *(void **)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
      if (!v61)
      {
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      uint64_t v62 = *v60;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_1000467A4(v46, v62, v61);
      unint64_t v65 = v64;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v66 = swift_unknownObjectWeakLoadStrong();
      if (!v66)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      uint64_t v67 = *(void **)(v66 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
      uint64_t v68 = v67;
      swift_unknownObjectRelease();
      if (!v67)
      {
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      uint64_t v69 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
      uint64_t v70 = *(void **)&v68[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
      unint64_t v111 = v65;
      uint64_t v112 = v63;
      if (v70)
      {
        [v70 invalidateWithReason:0];
        id v71 = *(id *)&v68[v69];
      }
      else
      {
        id v71 = 0;
      }
      *(void *)&v68[v69] = 0;

      goto LABEL_58;
    }
    __break(1u);
    goto LABEL_62;
  }
  long long v51 = (uint64_t *)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName];
  long long v52 = *(void **)&v47[OBJC_IVAR____TtC16AccessorySetupUI10ASUIDevice_displayName + 8];
  if (!v52)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v53 = *v51;
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_100046198(v46, v53, v52);
  unint64_t v56 = v55;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v57 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v57)
  {
    long long v58 = *(void **)(v57 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon);
    id v59 = v58;
  }
  else
  {
    long long v58 = 0;
  }
  uint64_t v81 = swift_unknownObjectWeakLoadStrong();
  unint64_t v111 = v56;
  uint64_t v112 = v54;
  uint64_t v110 = v58;
  if (v46 >= 1)
  {
    if (v81)
    {
      long long v82 = *(void **)(v81 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
      long long v83 = v82;
      swift_unknownObjectRelease();
      if (v82)
      {
        uint64_t v84 = OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery;
        long long v85 = *(void **)&v83[OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_discovery];
        if (v85)
        {
          [v85 invalidateWithReason:0];
          id v71 = *(id *)&v83[v84];
        }
        else
        {
          id v71 = 0;
        }
        *(void *)&v83[v84] = 0;

        goto LABEL_59;
      }
      goto LABEL_70;
    }
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (!v81)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  long long v86 = *(void **)(v81 + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession);
  id v71 = v86;
  swift_unknownObjectRelease();
  if (v86)
  {
    sub_1000144CC(0, 1);
LABEL_59:

    String.LocalizationValue.init(stringLiteral:)();
    uint64_t v87 = v124;
    long long v88 = v114;
    v114(v37, v36, v124);
    static Locale.current.getter();
    uint64_t v122 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v90 = v89;
    long long v91 = v113;
    v113(v36, v87);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(stringLiteral:)();
    v88(v37, v36, v87);
    static Locale.current.getter();
    uint64_t v92 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v121 = v92;
    uint64_t v94 = v93;
    v91(v36, v87);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v96 = v115;
    uint64_t v95 = v116;
    *(void *)&long long v125 = v116;
    *((void *)&v125 + 1) = v115;
    unint64_t v98 = v111;
    uint64_t v97 = v112;
    *(void *)&long long v126 = v112;
    *((void *)&v126 + 1) = v111;
    *(void *)&long long v127 = 0;
    *((void *)&v127 + 1) = 0xE000000000000000;
    uint64_t v99 = v122;
    *(void *)&long long v128 = v122;
    *((void *)&v128 + 1) = v90;
    *(void *)&long long v129 = v92;
    *((void *)&v129 + 1) = v94;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v100 = v110;
    *(void *)&long long v133 = 0;
    *((void *)&v133 + 1) = v110;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    swift_bridgeObjectRetain();
    sub_100043DA8(&v125);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v137 = v95;
    unint64_t v138 = v96;
    uint64_t v139 = v97;
    unint64_t v140 = v98;
    uint64_t v141 = 0;
    unint64_t v142 = 0xE000000000000000;
    uint64_t v143 = v99;
    uint64_t v144 = v90;
    uint64_t v145 = v121;
    uint64_t v146 = v94;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    uint64_t v150 = 0;
    v151 = v100;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    uint64_t result = (uint64_t)sub_10001E588(&v137);
    long long v102 = v134;
    unsigned long long v103 = v118;
    v118[8] = v133;
    v103[9] = v102;
    long long v104 = v136;
    v103[10] = v135;
    v103[11] = v104;
    long long v105 = v130;
    v103[4] = v129;
    v103[5] = v105;
    long long v106 = v132;
    v103[6] = v131;
    v103[7] = v106;
    long long v107 = v126;
    *unsigned long long v103 = v125;
    v103[1] = v107;
    long long v108 = v128;
    v103[2] = v127;
    v103[3] = v108;
    return result;
  }
LABEL_78:
  __break(1u);
LABEL_79:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

double sub_100041DA0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v38 = a1;
  if (Strong
    && (uint64_t v10 = *(void **)(Strong + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_pickingSession),
        id v11 = v10,
        swift_unknownObjectRelease(),
        v10))
  {
    sub_10000CD24();
    id v36 = v12;
  }
  else
  {
    id v36 = 0;
  }
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v13 = v41;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v37(v6, v8, v3);
  static Locale.current.getter();
  uint64_t v14 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  uint64_t v16 = v3;
  int v17 = *(void (**)(char *, uint64_t))(v13 + 8);
  v17(v8, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v18 = v3;
  uint64_t v19 = v37;
  v37(v6, v8, v18);
  static Locale.current.getter();
  uint64_t v41 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v21 = v20;
  v17(v8, v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v19(v6, v8, v16);
  static Locale.current.getter();
  uint64_t v22 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v24 = v23;
  v17(v8, v16);

  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = v39;
  uint64_t v25 = v40;
  *(void *)&long long v42 = v40;
  *((void *)&v42 + 1) = v39;
  uint64_t v27 = v41;
  *(void *)&long long v43 = v41;
  *((void *)&v43 + 1) = v21;
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = 0xE000000000000000;
  *(void *)&long long v45 = v22;
  *((void *)&v45 + 1) = v24;
  *(void *)&long long v46 = 0;
  *((void *)&v46 + 1) = 0xE000000000000000;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  sub_100043DA8(&v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54[0] = v25;
  v54[1] = v26;
  v54[2] = v27;
  v54[3] = v21;
  v54[4] = 0;
  v54[5] = 0xE000000000000000;
  v54[6] = v22;
  v54[7] = v24;
  v54[8] = 0;
  v54[9] = 0xE000000000000000;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  sub_10001E588(v54);
  long long v28 = v51;
  id v29 = v38;
  v38[8] = v50;
  v29[9] = v28;
  long long v30 = v53;
  v29[10] = v52;
  v29[11] = v30;
  long long v31 = v47;
  v29[4] = v46;
  v29[5] = v31;
  long long v32 = v49;
  v29[6] = v48;
  v29[7] = v32;
  long long v33 = v43;
  _OWORD *v29 = v42;
  v29[1] = v33;
  double result = *(double *)&v44;
  long long v35 = v45;
  v29[2] = v44;
  v29[3] = v35;
  return result;
}

uint64_t sub_1000421BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v32 - v9;
  if (qword_1000629B0 != -1) {
    uint64_t result = swift_once();
  }
  id v11 = *(unsigned char **)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
  if (v11)
  {
    uint64_t v12 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    if (!v12)
    {
LABEL_18:
      int v22 = 0;
      goto LABEL_19;
    }
    char v13 = *(unsigned char *)(v12 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1
       && (v11[84] & 1) == 0;
    int v14 = *(unsigned __int8 *)(v12 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi);
    if (v14 == 1 && !v11[86]) {
      v13 |= 2u;
    }
    if (v13)
    {
      char v15 = v11[85] ^ 1;
      if (!v14) {
        goto LABEL_16;
      }
    }
    else
    {
      char v15 = 0;
      if (!v14)
      {
LABEL_16:
        if (v15) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    if ((v11[86] & 1) == 0)
    {
      int v29 = v11[87];
      if (v15)
      {
        if ((v29 & 1) == 0)
        {
          swift_retain();
          uint64_t v20 = sub_1000456D4();
          uint64_t v36 = v30;
          uint64_t v21 = 3;
          long long v35 = (void (*)(char *, char *, uint64_t))sub_10004570C();
          uint64_t v19 = v31;
          goto LABEL_22;
        }
LABEL_17:
        swift_retain();
        String.LocalizationValue.init(stringLiteral:)();
        long long v35 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
        v35(v7, v10, v3);
        static Locale.current.getter();
        uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
        uint64_t v36 = v17;
        long long v33 = *(void (**)(char *, uint64_t))(v4 + 8);
        uint64_t v34 = v16;
        v33(v10, v3);
        swift_bridgeObjectRelease();
        String.LocalizationValue.init(stringLiteral:)();
        v35(v7, v10, v3);
        static Locale.current.getter();
        long long v35 = (void (*)(char *, char *, uint64_t))String.init(localized:table:bundle:locale:comment:)();
        uint64_t v19 = v18;
        v33(v10, v3);
        uint64_t v20 = v34;
        swift_bridgeObjectRelease();
        uint64_t v21 = 1;
LABEL_22:
        String.LocalizationValue.init(stringLiteral:)();
        (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
        static Locale.current.getter();
        uint64_t v25 = String.init(localized:table:bundle:locale:comment:)();
        uint64_t v27 = v26;
        (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
        swift_bridgeObjectRelease();
        uint64_t result = swift_release();
        uint64_t v28 = v36;
        *(void *)a1 = v20;
        *(void *)(a1 + 8) = v28;
        *(void *)(a1 + 16) = v35;
        *(void *)(a1 + 24) = v19;
        *(void *)(a1 + 32) = 0;
        *(void *)(a1 + 40) = 0xE000000000000000;
        *(void *)(a1 + 48) = v25;
        *(void *)(a1 + 56) = v27;
        *(void *)(a1 + 64) = 0;
        *(void *)(a1 + 72) = 0xE000000000000000;
        *(_OWORD *)(a1 + 80) = 0u;
        *(_OWORD *)(a1 + 96) = 0u;
        *(_OWORD *)(a1 + 112) = 0u;
        *(_OWORD *)(a1 + 128) = 0u;
        *(_OWORD *)(a1 + 144) = 0u;
        *(_OWORD *)(a1 + 160) = 0u;
        *(void *)(a1 + 176) = 0;
        *(void *)(a1 + 184) = v21;
        return result;
      }
      int v22 = v29 ^ 1;
LABEL_19:
      swift_retain();
      uint64_t v20 = sub_100045744();
      uint64_t v36 = v23;
      long long v35 = (void (*)(char *, char *, uint64_t))sub_10004577C();
      uint64_t v19 = v24;
      if (v22) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 0;
      }
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100042648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v10 = (char *)v47 - v9;
  if (qword_1000629B0 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v11 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_systemMonitor);
  if (v11)
  {
    uint64_t v12 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
    if (v12)
    {
      if (*(unsigned char *)(v12 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsBluetooth) == 1) {
        uint64_t v13 = ~*(unsigned __int8 *)(v11 + 84) & 1;
      }
      else {
        uint64_t v13 = 0;
      }
      if (*(unsigned char *)(v12 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_needsWiFi) == 1 && !*(unsigned char *)(v11 + 86)) {
        v13 |= 2uLL;
      }
      if (v13)
      {
        uint64_t v51 = v3;
        uint64_t v48 = v4;
        uint64_t v49 = v13;
        if (v13 == 3)
        {
          uint64_t v22 = sub_1000457B4();
          unint64_t v54 = v23;
          uint64_t v55 = v22;
          uint64_t v53 = sub_1000457EC();
          unint64_t v50 = v24;
          uint64_t v25 = sub_100045824();
        }
        else
        {
          if (v13)
          {
            String.LocalizationValue.init(stringLiteral:)();
            uint64_t v31 = v10;
            long long v52 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
            uint64_t v32 = v51;
            v52(v7, v10, v51);
            static Locale.current.getter();
            uint64_t v33 = String.init(localized:table:bundle:locale:comment:)();
            unint64_t v54 = v34;
            uint64_t v55 = v33;
            uint64_t v36 = v4 + 8;
            long long v35 = *(void (**)(char *, uint64_t))(v4 + 8);
            v35(v31, v32);
            v47[1] = v36;
            swift_bridgeObjectRelease();
            String.LocalizationValue.init(stringLiteral:)();
            uint64_t v37 = v52;
            v52(v7, v31, v32);
            static Locale.current.getter();
            uint64_t v53 = String.init(localized:table:bundle:locale:comment:)();
            unint64_t v50 = v38;
            v35(v31, v32);
            swift_bridgeObjectRelease();
            String.LocalizationValue.init(stringLiteral:)();
            v37(v7, v31, v32);
            static Locale.current.getter();
            long long v52 = (void (*)(char *, char *, uint64_t))String.init(localized:table:bundle:locale:comment:)();
            unint64_t v30 = v39;
            uint64_t v10 = v31;
            v35(v31, v32);
            swift_bridgeObjectRelease();
            goto LABEL_20;
          }
          uint64_t v27 = sub_10004585C();
          unint64_t v54 = v28;
          uint64_t v55 = v27;
          uint64_t v53 = sub_1000458A0();
          unint64_t v50 = v29;
          uint64_t v25 = sub_1000458D8();
        }
        long long v52 = (void (*)(char *, char *, uint64_t))v25;
        unint64_t v30 = v26;
LABEL_20:
        String.LocalizationValue.init(stringLiteral:)();
        uint64_t v40 = v48;
        uint64_t v41 = v51;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v7, v10, v51);
        static Locale.current.getter();
        uint64_t v42 = String.init(localized:table:bundle:locale:comment:)();
        unint64_t v21 = v43;
        (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        unint64_t v44 = v54;
        uint64_t v45 = v55;
        v56[0] = v55;
        v56[1] = v54;
        unint64_t v19 = v50;
        v56[2] = v53;
        v56[3] = v50;
        v56[4] = 0;
        v56[5] = 0xE000000000000000;
        v56[6] = v52;
        v56[7] = v30;
        unint64_t v20 = v30;
        v56[8] = v42;
        v56[9] = v21;
        uint64_t v17 = v42;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v46 = v49;
        uint64_t v63 = v49;
        uint64_t v64 = 0;
        sub_100043DA8(v56);
        swift_bridgeObjectRelease();
        v65[0] = v45;
        v65[1] = v44;
        uint64_t v16 = v52;
        uint64_t v15 = v53;
        v65[2] = v53;
        v65[3] = v19;
        v65[4] = 0;
        v65[5] = 0xE000000000000000;
        v65[6] = v52;
        v65[7] = v20;
        v65[8] = v42;
        v65[9] = v21;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v72 = v46;
        uint64_t v73 = 0;
        uint64_t result = (uint64_t)sub_10001E588(v65);
        unint64_t v18 = v54;
        uint64_t v14 = v55;
        uint64_t v13 = v46;
        goto LABEL_21;
      }
      unint64_t v18 = 0xE000000000000000;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      unint64_t v19 = 0xE000000000000000;
      uint64_t v16 = 0;
      unint64_t v20 = 0xE000000000000000;
      uint64_t v17 = 0;
      unint64_t v21 = 0xE000000000000000;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v13 = 0;
      unint64_t v18 = 0xE000000000000000;
      unint64_t v19 = 0xE000000000000000;
      unint64_t v20 = 0xE000000000000000;
      unint64_t v21 = 0xE000000000000000;
    }
LABEL_21:
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v18;
    *(void *)(a1 + 16) = v15;
    *(void *)(a1 + 24) = v19;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0xE000000000000000;
    *(void *)(a1 + 48) = v16;
    *(void *)(a1 + 56) = v20;
    *(void *)(a1 + 64) = v17;
    *(void *)(a1 + 72) = v21;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(void *)(a1 + 176) = v13;
    *(void *)(a1 + 184) = 0;
    return result;
  }
  __break(1u);
  return result;
}

double sub_100042C0C@<D0>(_OWORD *a1@<X8>)
{
  unint64_t v39 = a1;
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v34 - v7;
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v10 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v40 = v11;
  uint64_t v41 = v10;
  long long v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v12 = v9;
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v13 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v37 = v14;
  uint64_t v38 = v13;
  uint64_t v15 = v35;
  v35(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v36 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v17 = v16;
  v15(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v12(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v20 = v19;
  v15(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = v40;
  uint64_t v21 = v41;
  *(void *)&long long v42 = v41;
  *((void *)&v42 + 1) = v40;
  uint64_t v23 = v37;
  uint64_t v24 = v38;
  *(void *)&long long v43 = v38;
  *((void *)&v43 + 1) = v37;
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = 0xE000000000000000;
  uint64_t v25 = v36;
  *(void *)&long long v45 = v36;
  *((void *)&v45 + 1) = v17;
  *(void *)&long long v46 = v18;
  *((void *)&v46 + 1) = v20;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  sub_100043DA8(&v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54[0] = v21;
  v54[1] = v22;
  v54[2] = v24;
  v54[3] = v23;
  v54[4] = 0;
  v54[5] = 0xE000000000000000;
  v54[6] = v25;
  v54[7] = v17;
  v54[8] = v18;
  v54[9] = v20;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  sub_10001E588(v54);
  long long v26 = v51;
  uint64_t v27 = v39;
  v39[8] = v50;
  v27[9] = v26;
  long long v28 = v53;
  v27[10] = v52;
  v27[11] = v28;
  long long v29 = v47;
  v27[4] = v46;
  v27[5] = v29;
  long long v30 = v49;
  v27[6] = v48;
  v27[7] = v30;
  long long v31 = v43;
  *uint64_t v27 = v42;
  v27[1] = v31;
  double result = *(double *)&v44;
  long long v33 = v45;
  v27[2] = v44;
  v27[3] = v33;
  return result;
}

double sub_100043078@<D0>(_OWORD *a1@<X8>)
{
  unint64_t v39 = a1;
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v34 - v7;
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v10 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v40 = v11;
  uint64_t v41 = v10;
  long long v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  uint64_t v12 = v9;
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v13 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v37 = v14;
  uint64_t v38 = v13;
  uint64_t v15 = v35;
  v35(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v9(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v36 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v17 = v16;
  v15(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  String.LocalizationValue.init(stringLiteral:)();
  v12(v6, v8, v2);
  static Locale.current.getter();
  uint64_t v18 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v20 = v19;
  v15(v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = v40;
  uint64_t v21 = v41;
  *(void *)&long long v42 = v41;
  *((void *)&v42 + 1) = v40;
  uint64_t v23 = v37;
  uint64_t v24 = v38;
  *(void *)&long long v43 = v38;
  *((void *)&v43 + 1) = v37;
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = 0xE000000000000000;
  uint64_t v25 = v36;
  *(void *)&long long v45 = v36;
  *((void *)&v45 + 1) = v17;
  *(void *)&long long v46 = v18;
  *((void *)&v46 + 1) = v20;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  sub_100043DA8(&v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54[0] = v21;
  v54[1] = v22;
  v54[2] = v24;
  v54[3] = v23;
  v54[4] = 0;
  v54[5] = 0xE000000000000000;
  v54[6] = v25;
  v54[7] = v17;
  v54[8] = v18;
  v54[9] = v20;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  sub_10001E588(v54);
  long long v26 = v51;
  uint64_t v27 = v39;
  v39[8] = v50;
  v27[9] = v26;
  long long v28 = v53;
  v27[10] = v52;
  v27[11] = v28;
  long long v29 = v47;
  v27[4] = v46;
  v27[5] = v29;
  long long v30 = v49;
  v27[6] = v48;
  v27[7] = v30;
  long long v31 = v43;
  *uint64_t v27 = v42;
  v27[1] = v31;
  double result = *(double *)&v44;
  long long v33 = v45;
  v27[2] = v44;
  v27[3] = v33;
  return result;
}

uint64_t sub_1000434D8@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v40 - v8;
  if (qword_1000629B0 != -1) {
    swift_once();
  }
  uint64_t v46 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_migrationDisplayCount);
  String.LocalizationValue.init(stringLiteral:)();
  long long v50 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v48 = v4 + 16;
  v50(v7, v9, v3);
  static Locale.current.getter();
  uint64_t v10 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v12 = v11;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v13 = v4 + 8;
  long long v47 = v14;
  v14(v9, v3);
  uint64_t v49 = v12;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v16)
  {
    long long v43 = a1;
    uint64_t v44 = v10;
    uint64_t v45 = v13;
    uint64_t v17 = (uint64_t *)(v16 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName);
    uint64_t v18 = (void *)v17[1];
    if (v18)
    {
      uint64_t v19 = *v17;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100046D64(v46, v19, v18);
      uint64_t v42 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      String.LocalizationValue.init(stringLiteral:)();
      v50(v7, v9, v3);
      static Locale.current.getter();
      uint64_t v21 = String.init(localized:table:bundle:locale:comment:)();
      uint64_t v40 = v22;
      uint64_t v41 = v21;
      uint64_t v23 = v47;
      v47(v9, v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      String.LocalizationValue.init(stringLiteral:)();
      v50(v7, v9, v3);
      static Locale.current.getter();
      uint64_t v24 = String.init(localized:table:bundle:locale:comment:)();
      uint64_t v26 = v25;
      v23(v9, v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v27 = v44;
      uint64_t v28 = v49;
      *(void *)&long long v51 = v44;
      *((void *)&v51 + 1) = v49;
      uint64_t v29 = v46;
      uint64_t v31 = v41;
      uint64_t v30 = v42;
      *(void *)&long long v52 = v46;
      *((void *)&v52 + 1) = v42;
      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = 0xE000000000000000;
      uint64_t v32 = v40;
      *(void *)&long long v54 = v41;
      *((void *)&v54 + 1) = v40;
      *(void *)&long long v55 = v24;
      *((void *)&v55 + 1) = v26;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      sub_100043DA8(&v51);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v63[0] = v27;
      v63[1] = v28;
      v63[2] = v29;
      v63[3] = v30;
      v63[4] = 0;
      v63[5] = 0xE000000000000000;
      v63[6] = v31;
      v63[7] = v32;
      v63[8] = v24;
      v63[9] = v26;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t result = (uint64_t)sub_10001E588(v63);
      long long v33 = v60;
      uint64_t v34 = v43;
      v43[8] = v59;
      v34[9] = v33;
      long long v35 = v62;
      v34[10] = v61;
      v34[11] = v35;
      long long v36 = v56;
      v34[4] = v55;
      v34[5] = v36;
      long long v37 = v58;
      v34[6] = v57;
      v34[7] = v37;
      long long v38 = v52;
      _OWORD *v34 = v51;
      v34[1] = v38;
      long long v39 = v54;
      v34[2] = v53;
      v34[3] = v39;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100043994@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v46 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)__chkstk_darwin(v5);
  uint64_t v10 = (char *)&v37 - v9;
  if (qword_1000629B0 != -1) {
    id result = (id)swift_once();
  }
  uint64_t v11 = *(void *)(qword_100064A90 + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
  if (v11
    && (uint64_t v12 = (uint64_t *)(v11 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName),
        uint64_t v13 = *(void **)(v11 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appName + 8),
        id v44 = *(id *)(v11 + OBJC_IVAR____TtC16AccessorySetupUI15ASUIClientModel_appIcon),
        id result = v44,
        v13))
  {
    uint64_t v14 = result;
    uint64_t v15 = *v12;
    uint64_t v42 = v15;
    swift_bridgeObjectRetain_n();
    id v43 = v14;
    uint64_t v16 = sub_100047240(v15, v13);
    uint64_t v40 = v17;
    uint64_t v41 = v16;
    swift_bridgeObjectRetain();
    String.LocalizationValue.init(stringLiteral:)();
    long long v37 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
    v37(v7, v10, v3);
    static Locale.current.getter();
    uint64_t v38 = String.init(localized:table:bundle:locale:comment:)();
    long long v39 = v13;
    uint64_t v19 = v18;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
    v20(v10, v3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    String.LocalizationValue.init(stringLiteral:)();
    v37(v7, v10, v3);
    static Locale.current.getter();
    uint64_t v21 = String.init(localized:table:bundle:locale:comment:)();
    uint64_t v46 = (char *)v21;
    uint64_t v23 = v22;
    v20(v10, v3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)&long long v47 = 0;
    *((void *)&v47 + 1) = 0xE000000000000000;
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = 0xE000000000000000;
    *(void *)&long long v49 = 0;
    *((void *)&v49 + 1) = 0xE000000000000000;
    uint64_t v24 = v38;
    uint64_t v25 = v39;
    *(void *)&long long v50 = v38;
    *((void *)&v50 + 1) = v19;
    *(void *)&long long v51 = v21;
    *((void *)&v51 + 1) = v23;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v26 = v44;
    *(void *)&long long v55 = 0;
    *((void *)&v55 + 1) = v44;
    uint64_t v28 = v41;
    uint64_t v27 = v42;
    *(void *)&long long v56 = v42;
    *((void *)&v56 + 1) = v39;
    uint64_t v29 = v40;
    *(void *)&long long v57 = v41;
    *((void *)&v57 + 1) = v40;
    long long v58 = 0uLL;
    sub_100043DA8(&v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v59[0] = 0;
    v59[1] = 0xE000000000000000;
    v59[2] = 0;
    v59[3] = 0xE000000000000000;
    v59[4] = 0;
    v59[5] = 0xE000000000000000;
    v59[6] = v24;
    v59[7] = v19;
    v59[8] = v46;
    v59[9] = v23;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v63 = 0;
    id v64 = v26;
    uint64_t v65 = v27;
    long long v66 = v25;
    uint64_t v67 = v28;
    uint64_t v68 = v29;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    id result = sub_10001E588(v59);
    long long v30 = v56;
    uint64_t v31 = v45;
    v45[8] = v55;
    v31[9] = v30;
    long long v32 = v58;
    v31[10] = v57;
    v31[11] = v32;
    long long v33 = v52;
    v31[4] = v51;
    v31[5] = v33;
    long long v34 = v54;
    v31[6] = v53;
    v31[7] = v34;
    long long v35 = v48;
    _OWORD *v31 = v47;
    v31[1] = v35;
    long long v36 = v50;
    v31[2] = v49;
    v31[3] = v36;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100043DA8(void *a1)
{
  uint64_t v2 = (void *)a1[12];
  uint64_t v3 = (void *)a1[13];
  uint64_t v8 = (void *)a1[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  id v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v8;
  swift_bridgeObjectRetain();
  return a1;
}

void sub_100043E84()
{
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 setSubtitle:v2];

  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  long long v39 = sub_100044800;
  uint64_t v40 = v3;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  long long v37 = sub_10002F814;
  uint64_t v38 = &unk_10005B2D0;
  id v5 = _Block_copy(&aBlock);
  id v6 = self;
  id v34 = [v6 actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();

  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  long long v39 = sub_100044838;
  uint64_t v40 = v7;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  long long v37 = sub_10002F814;
  uint64_t v38 = &unk_10005B2F8;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = [v6 actionWithTitle:v8 style:1 handler:v9];

  _Block_release(v9);
  swift_release();
  swift_release();

  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [self systemImageNamed:v11];

  id v13 = [objc_allocWithZone((Class)UIImageView) initWithImage:v12];
  id v14 = [self systemBlueColor];
  [v13 setTintColor:v14];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [self configurationWithPointSize:72.0];
  [v13 setPreferredSymbolConfiguration:v15];

  id v16 = [v0 contentView];
  [v16 addSubview:v13];

  id v17 = [v0 contentView];
  id v18 = [v17 mainContentGuide];

  uint64_t v19 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_100049290;
  id v21 = [v13 topAnchor];
  id v22 = [v18 topAnchor];
  id v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22];

  *(void *)(v20 + 32) = v23;
  id v24 = [v13 bottomAnchor];
  id v25 = [v18 bottomAnchor];
  id v26 = [v24 constraintLessThanOrEqualToAnchor:v25];

  *(void *)(v20 + 40) = v26;
  id v27 = [v13 centerXAnchor];
  id v28 = [v18 centerXAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28];

  *(void *)(v20 + 48) = v29;
  id v30 = [v13 centerYAnchor];
  id v31 = [v18 centerYAnchor];
  id v32 = [v30 constraintEqualToAnchor:v31];

  *(void *)(v20 + 56) = v32;
  id aBlock = (void **)v20;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:isa];
}

void sub_1000444C8(uint64_t a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (void *)Strong;
    uint64_t v6 = Strong + OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_routingContext;
    uint64_t v7 = *(void *)(Strong + OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_routingContext);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = *(void *)(v6 + 16);
    *(void *)uint64_t v6 = 1;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    sub_10000CBC4(v7, v8, v9);
    if (*(void *)(v6 + 16) != 1) {
      *(unsigned char *)uint64_t v6 = a3;
    }
    id v10 = (char *)swift_unknownObjectWeakLoadStrong();
    if (v10)
    {
      sub_1000375E8((uint64_t)v5, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for ASUIDiscoveryErrorViewController()
{
  return self;
}

uint64_t sub_100044714()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_type);
}

uint64_t sub_100044724@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIDiscoveryErrorViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_1000447C8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100044800(uint64_t a1)
{
  sub_1000444C8(a1, v1, 1);
}

uint64_t sub_100044820(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100044830()
{
  return swift_release();
}

void sub_100044838(uint64_t a1)
{
  sub_1000444C8(a1, v1, 0);
}

void sub_100044860()
{
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setTitle:v1];

  NSString v2 = String._bridgeToObjectiveC()();
  [v0 setSubtitle:v2];

  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  long long v39 = sub_1000451FC;
  uint64_t v40 = v3;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  long long v37 = sub_10002F814;
  uint64_t v38 = &unk_10005B3A8;
  uint64_t v5 = _Block_copy(&aBlock);
  uint64_t v6 = self;
  id v34 = [v6 actionWithTitle:v4 style:0 handler:v5];

  _Block_release(v5);
  swift_release();
  swift_release();

  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  long long v39 = sub_100045234;
  uint64_t v40 = v7;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v36 = 1107296256;
  long long v37 = sub_10002F814;
  uint64_t v38 = &unk_10005B3D0;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = [v6 actionWithTitle:v8 style:1 handler:v9];

  _Block_release(v9);
  swift_release();
  swift_release();

  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [self _systemImageNamed:v11];

  id v13 = [objc_allocWithZone((Class)UIImageView) initWithImage:v12];
  id v14 = [self systemBlueColor];
  [v13 setTintColor:v14];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [self configurationWithPointSize:72.0];
  [v13 setPreferredSymbolConfiguration:v15];

  id v16 = [v0 contentView];
  [v16 addSubview:v13];

  id v17 = [v0 contentView];
  id v18 = [v17 mainContentGuide];

  uint64_t v19 = self;
  sub_10000BEA4(&qword_100062D98);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_100049290;
  id v21 = [v13 topAnchor];
  id v22 = [v18 topAnchor];
  id v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22];

  *(void *)(v20 + 32) = v23;
  id v24 = [v13 bottomAnchor];
  id v25 = [v18 bottomAnchor];
  id v26 = [v24 constraintLessThanOrEqualToAnchor:v25];

  *(void *)(v20 + 40) = v26;
  id v27 = [v13 centerXAnchor];
  id v28 = [v18 centerXAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28];

  *(void *)(v20 + 48) = v29;
  id v30 = [v13 centerYAnchor];
  id v31 = [v18 centerYAnchor];
  id v32 = [v30 constraintEqualToAnchor:v31];

  *(void *)(v20 + 56) = v32;
  id aBlock = (void **)v20;
  specialized Array._endMutation()();
  sub_10000CB84();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 activateConstraints:isa];
}

uint64_t sub_100044EA4(uint64_t a1, uint64_t a2, char a3)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = result + OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_routingContext;
    uint64_t v7 = *(void *)(result + OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_routingContext);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = *(void *)(v6 + 16);
    *(void *)uint64_t v6 = 1;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    sub_10000CBC4(v7, v8, v9);
    if (*(void *)(v6 + 16) != 1) {
      *(unsigned char *)uint64_t v6 = a3;
    }
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      sub_100037618((uint64_t)v5, result);

      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t type metadata accessor for ASUIBluetoothSetupViewController()
{
  return self;
}

uint64_t sub_100045110()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_type);
}

uint64_t sub_100045120@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_routingContext);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC16AccessorySetupUI32ASUIBluetoothSetupViewController_routingContext);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  uint64_t result = sub_10000CA8C(v4, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  return result;
}

uint64_t sub_1000451C4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000451FC(uint64_t a1)
{
  return sub_100044EA4(a1, v1, 1);
}

uint64_t sub_10004521C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004522C()
{
  return swift_release();
}

uint64_t sub_100045234(uint64_t a1)
{
  return sub_100044EA4(a1, v1, 0);
}

uint64_t sub_10004525C(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v18[-v10];
  uint64_t v12 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v12 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  v14._countAndFlagsBits = a1;
  v14._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v14);
  v15._object = (void *)0x800000010004CDD0;
  v15._countAndFlagsBits = 0xD000000000000012;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  static Locale.current.getter();
  uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_100045484(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for Locale();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for String.LocalizationValue();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  Swift::String v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  Swift::String v15 = &v24[-v14];
  uint64_t v16 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v16 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v17._object = (void *)0x800000010004CDB0;
  v17._countAndFlagsBits = 0xD000000000000011;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
  v18._countAndFlagsBits = a1;
  v18._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v18);
  v19._countAndFlagsBits = 32;
  v19._object = (void *)0xE100000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v19);
  v20._countAndFlagsBits = a3;
  v20._object = a4;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v20);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v21);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v13, v15, v9);
  static Locale.current.getter();
  uint64_t v22 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v15, v9);
  return v22;
}

uint64_t sub_1000456D4()
{
  return sub_100045918();
}

uint64_t sub_10004570C()
{
  return sub_100045918();
}

uint64_t sub_100045744()
{
  return sub_100045918();
}

uint64_t sub_10004577C()
{
  return sub_100045918();
}

uint64_t sub_1000457B4()
{
  return sub_100045918();
}

uint64_t sub_1000457EC()
{
  return sub_100045918();
}

uint64_t sub_100045824()
{
  return sub_100045918();
}

uint64_t sub_10004585C()
{
  return sub_100045918();
}

uint64_t sub_1000458A0()
{
  return sub_100045918();
}

uint64_t sub_1000458D8()
{
  return sub_100045918();
}

uint64_t sub_100045918()
{
  uint64_t v0 = type metadata accessor for Locale();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = type metadata accessor for String.LocalizationValue();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v7 = &v10[-v6];
  if (qword_1000629C0 != -1) {
    swift_once();
  }
  String.LocalizationValue.init(stringLiteral:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 16))(v5, v7, v1);
  static Locale.current.getter();
  uint64_t v8 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v7, v1);
  return v8;
}

uint64_t sub_100045B20(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v18[-v10];
  uint64_t v12 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v12 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v13._object = (void *)0x800000010004C080;
  v13._countAndFlagsBits = 0xD000000000000019;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  v14._countAndFlagsBits = a1;
  v14._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  static Locale.current.getter();
  uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_100045D48(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v18[-v10];
  uint64_t v12 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v12 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v13._object = (void *)0x800000010004C0A0;
  v13._countAndFlagsBits = 0xD000000000000017;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  v14._countAndFlagsBits = a1;
  v14._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  static Locale.current.getter();
  uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_100045F70(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v18[-v10];
  uint64_t v12 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v12 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v13._object = (void *)0x800000010004C0C0;
  v13._countAndFlagsBits = 0xD00000000000001CLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  v14._countAndFlagsBits = a1;
  v14._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  static Locale.current.getter();
  uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_100046198(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Locale();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for String.LocalizationValue();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  Swift::String v13 = (char *)v46 - v12;
  uint64_t v14 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v14 - 8);
  switch(a1)
  {
    case 0:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v15._countAndFlagsBits = 10256610;
      v15._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
      v16._countAndFlagsBits = a2;
      v16._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v16);
      v17._countAndFlagsBits = 0x1000000000000076;
      v17._object = (void *)0x800000010004C700;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    case 1:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v22._countAndFlagsBits = 10256610;
      v22._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v22);
      v23._countAndFlagsBits = a2;
      v23._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v23);
      uint64_t v24 = 0x100000000000008FLL;
      id v25 = "” and one other accessory are now paired, but may need to finish setting up in the app. You can manage these"
            " accessories in Settings anytime.";
      goto LABEL_14;
    case 2:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v26._countAndFlagsBits = 10256610;
      v26._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v26);
      v27._countAndFlagsBits = a2;
      v27._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v27);
      uint64_t v24 = 0x1000000000000091;
      id v25 = "” and two other accessories are now paired, but may need to finish setting up in the app. You can manage the"
            "se accessories in Settings anytime.";
      goto LABEL_14;
    case 3:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v28._countAndFlagsBits = 10256610;
      v28._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v28);
      v29._countAndFlagsBits = a2;
      v29._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v29);
      uint64_t v24 = 0x1000000000000093;
      id v25 = "” and three other accessories are now paired, but may need to finish setting up in the app. You can manage t"
            "hese accessories in Settings anytime.";
      goto LABEL_14;
    case 4:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v30._countAndFlagsBits = 10256610;
      v30._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v30);
      v31._countAndFlagsBits = a2;
      v31._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v31);
      id v32 = "” and four other accessories are now paired, but may need to finish setting up in the app. You can manage th"
            "ese accessories in Settings anytime.";
      goto LABEL_12;
    case 5:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v33._countAndFlagsBits = 10256610;
      v33._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v33);
      v34._countAndFlagsBits = a2;
      v34._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v34);
      id v32 = "” and five other accessories are now paired, but may need to finish setting up in the app. You can manage th"
            "ese accessories in Settings anytime.";
      goto LABEL_12;
    case 6:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v35._countAndFlagsBits = 10256610;
      v35._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v35);
      v36._countAndFlagsBits = a2;
      v36._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v36);
      uint64_t v24 = 0x1000000000000091;
      id v25 = "” and six other accessories are now paired, but may need to finish setting up in the app. You can manage the"
            "se accessories in Settings anytime.";
      goto LABEL_14;
    case 7:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v37._countAndFlagsBits = 10256610;
      v37._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v37);
      v38._countAndFlagsBits = a2;
      v38._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v38);
      uint64_t v24 = 0x1000000000000093;
      id v25 = "” and seven other accessories are now paired, but may need to finish setting up in the app. You can manage t"
            "hese accessories in Settings anytime.";
      goto LABEL_14;
    case 8:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v42._countAndFlagsBits = 10256610;
      v42._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v42);
      v43._countAndFlagsBits = a2;
      v43._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v43);
      uint64_t v24 = 0x1000000000000093;
      id v25 = "” and eight other accessories are now paired, but may need to finish setting up in the app. You can manage t"
            "hese accessories in Settings anytime.";
LABEL_14:
      unint64_t v41 = (unint64_t)(v25 - 32) | 0x8000000000000000;
      goto LABEL_15;
    case 9:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v39._countAndFlagsBits = 10256610;
      v39._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v39);
      v40._countAndFlagsBits = a2;
      v40._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v40);
      id v32 = "” and nine other accessories are now paired, but may need to finish setting up in the app. You can manage th"
            "ese accessories in Settings anytime.";
LABEL_12:
      unint64_t v41 = (unint64_t)(v32 - 32) | 0x8000000000000000;
      uint64_t v24 = 0x1000000000000092;
LABEL_15:
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    default:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v18._countAndFlagsBits = 10256610;
      v18._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v18);
      v19._countAndFlagsBits = a2;
      v19._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v19);
      v20._countAndFlagsBits = 0x20646E61209D80E2;
      v20._object = (void *)0xA800000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v20);
      v46[3] = a1;
      String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
      v21._object = (void *)0x800000010004C0E0;
      v21._countAndFlagsBits = 0xD000000000000086;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v21);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
  }
  uint64_t v44 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v44;
}

uint64_t sub_1000467A4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Locale();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for String.LocalizationValue();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  Swift::String v13 = (char *)v44 - v12;
  uint64_t v14 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v14 - 8);
  switch(a1)
  {
    case 1:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v15._countAndFlagsBits = 10256610;
      v15._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
      v16._countAndFlagsBits = a2;
      v16._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v16);
      v17._countAndFlagsBits = 0x1000000000000037;
      v17._object = (void *)0x800000010004C9B0;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    case 2:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v22._countAndFlagsBits = 10256610;
      v22._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v22);
      v23._countAndFlagsBits = a2;
      v23._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v23);
      uint64_t v24 = 0x1000000000000039;
      id v25 = "” and two other accessories are manageable in Settings.";
      goto LABEL_11;
    case 3:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v26._countAndFlagsBits = 10256610;
      v26._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v26);
      v27._countAndFlagsBits = a2;
      v27._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v27);
      uint64_t v24 = 0x100000000000003BLL;
      id v25 = "” and three other accessories are manageable in Settings.";
      goto LABEL_11;
    case 4:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v28._countAndFlagsBits = 10256610;
      v28._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v28);
      v29._countAndFlagsBits = a2;
      v29._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v29);
      Swift::String v30 = "” and four other accessories are manageable in Settings.";
      goto LABEL_13;
    case 5:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v31._countAndFlagsBits = 10256610;
      v31._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v31);
      v32._countAndFlagsBits = a2;
      v32._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v32);
      Swift::String v30 = "” and five other accessories are manageable in Settings.";
      goto LABEL_13;
    case 6:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v33._countAndFlagsBits = 10256610;
      v33._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v33);
      v34._countAndFlagsBits = a2;
      v34._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v34);
      uint64_t v24 = 0x1000000000000039;
      id v25 = "” and six other accessories are manageable in Settings.";
      goto LABEL_11;
    case 7:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v35._countAndFlagsBits = 10256610;
      v35._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v35);
      v36._countAndFlagsBits = a2;
      v36._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v36);
      uint64_t v24 = 0x100000000000003BLL;
      id v25 = "” and seven other accessories are manageable in Settings.";
      goto LABEL_11;
    case 8:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v37._countAndFlagsBits = 10256610;
      v37._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v37);
      v38._countAndFlagsBits = a2;
      v38._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v38);
      uint64_t v24 = 0x100000000000003BLL;
      id v25 = "” and eight other accessories are manageable in Settings.";
LABEL_11:
      unint64_t v39 = (unint64_t)(v25 - 32) | 0x8000000000000000;
      goto LABEL_14;
    case 9:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v40._countAndFlagsBits = 10256610;
      v40._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v40);
      v41._countAndFlagsBits = a2;
      v41._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v41);
      Swift::String v30 = "” and nine other accessories are manageable in Settings.";
LABEL_13:
      unint64_t v39 = (unint64_t)(v30 - 32) | 0x8000000000000000;
      uint64_t v24 = 0x100000000000003ALL;
LABEL_14:
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    default:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v18._countAndFlagsBits = 10256610;
      v18._object = (void *)0xA300000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v18);
      v19._countAndFlagsBits = a2;
      v19._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v19);
      v20._countAndFlagsBits = 0x20646E61209D80E2;
      v20._object = (void *)0xA800000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v20);
      v44[3] = a1;
      String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
      v21._object = (void *)0x800000010004C780;
      v21._countAndFlagsBits = 0xD00000000000002ELL;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v21);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
  }
  uint64_t v42 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v42;
}

uint64_t sub_100046D64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Locale();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = type metadata accessor for String.LocalizationValue();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  Swift::String v13 = (char *)v30 - v12;
  uint64_t v14 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v14 - 8);
  switch(a1)
  {
    case 1:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v15._countAndFlagsBits = 0x1000000000000045;
      v15._object = (void *)0x800000010004CCC0;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
      v16._countAndFlagsBits = a2;
      v16._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v16);
      v17._countAndFlagsBits = 0x2E707061209D80E2;
      v17._object = (void *)0xA800000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    case 2:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v22 = 0x1000000000000048;
      Swift::String v23 = "Two accessories that were previously paired can now be used with the “";
      goto LABEL_11;
    case 3:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v22 = 0x100000000000004ALL;
      Swift::String v23 = "Three accessories that were previously paired can now be used with the “";
      goto LABEL_11;
    case 4:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v24 = "Four accessories that were previously paired can now be used with the “";
      goto LABEL_13;
    case 5:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v24 = "Five accessories that were previously paired can now be used with the “";
      goto LABEL_13;
    case 6:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v22 = 0x1000000000000048;
      Swift::String v23 = "Six accessories that were previously paired can now be used with the “";
      goto LABEL_11;
    case 7:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v22 = 0x100000000000004ALL;
      Swift::String v23 = "Seven accessories that were previously paired can now be used with the “";
      goto LABEL_11;
    case 8:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v22 = 0x100000000000004ALL;
      Swift::String v23 = "Eight accessories that were previously paired can now be used with the “";
LABEL_11:
      unint64_t v25 = (unint64_t)(v23 - 32) | 0x8000000000000000;
      goto LABEL_14;
    case 9:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v24 = "Nine accessories that were previously paired can now be used with the “";
LABEL_13:
      unint64_t v25 = (unint64_t)(v24 - 32) | 0x8000000000000000;
      uint64_t v22 = 0x1000000000000049;
LABEL_14:
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
      v26._countAndFlagsBits = a2;
      v26._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v26);
      v27._countAndFlagsBits = 0x2E707061209D80E2;
      v27._object = (void *)0xA800000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v27);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
    default:
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v18._countAndFlagsBits = 0;
      v18._object = (void *)0xE000000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v18);
      v30[3] = a1;
      String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
      v19._countAndFlagsBits = 0x1000000000000045;
      v19._object = (void *)0x800000010004C9F0;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v19);
      v20._countAndFlagsBits = a2;
      v20._object = a3;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v20);
      v21._countAndFlagsBits = 0x2E707061209D80E2;
      v21._object = (void *)0xA800000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v21);
      String.LocalizationValue.init(stringInterpolation:)();
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      static Locale.current.getter();
      break;
  }
  uint64_t v28 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v28;
}

uint64_t sub_100047240(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v18[-v10];
  uint64_t v12 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v12 - 8);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v13._countAndFlagsBits = 0x1000000000000050;
  v13._object = (void *)0x800000010004CD10;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  v14._countAndFlagsBits = a1;
  v14._object = a2;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v14);
  v15._object = (void *)0x800000010004CD70;
  v15._countAndFlagsBits = 0x100000000000003FLL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  static Locale.current.getter();
  uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_10004747C()
{
  if (qword_100062980 != -1) {
    uint64_t result = swift_once();
  }
  byte_100064A98 = byte_100064A78;
  return result;
}

id sub_10004765C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  return [super dealloc];
}

uint64_t type metadata accessor for ASUIDeviceTableViewCell()
{
  return self;
}

uint64_t sub_1000476C4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
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

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t UIListContentConfiguration.secondaryTextProperties.modify()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t CurrentValueSubject.send(_:)()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
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

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
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

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return UITableViewCell.defaultContentConfiguration()();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t dispatch thunk of static BinaryInteger.& infix(_:_:)()
{
  return dispatch thunk of static BinaryInteger.& infix(_:_:)();
}

uint64_t dispatch thunk of static BinaryInteger.~ prefix(_:)()
{
  return dispatch thunk of static BinaryInteger.~ prefix(_:)();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return dispatch thunk of BinaryInteger._lowWord.getter();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return dispatch thunk of BinaryInteger.bitWidth.getter();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return dispatch thunk of static BinaryInteger.isSigned.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t type metadata accessor for AnyIterator()
{
  return type metadata accessor for AnyIterator();
}

uint64_t AnyIterator.init(_:)()
{
  return AnyIterator.init(_:)();
}

uint64_t AnySequence.init<A>(_:)()
{
  return AnySequence.init<A>(_:)();
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

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of static FixedWidthInteger.&* infix(_:_:)()
{
  return dispatch thunk of static FixedWidthInteger.&* infix(_:_:)();
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

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
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

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}