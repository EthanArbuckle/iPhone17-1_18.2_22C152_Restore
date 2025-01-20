uint64_t variable initialization expression of BrandServiceImplementation.queue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void v5[2];

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_1000027D0();
  static DispatchQoS.unspecified.getter();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100002E28((unint64_t *)&qword_100021DF8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100002810(&qword_100021E00);
  sub_100002854();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

unint64_t sub_1000027D0()
{
  unint64_t result = qword_100021DF0;
  if (!qword_100021DF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021DF0);
  }
  return result;
}

uint64_t sub_100002810(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002854()
{
  unint64_t result = qword_100021E08;
  if (!qword_100021E08)
  {
    sub_1000028B0(&qword_100021E00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021E08);
  }
  return result;
}

uint64_t sub_1000028B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

float variable initialization expression of BrandServiceImplementation.kBlastDoorDefaultMaxPixelDimension()
{
  return 540.0;
}

float variable initialization expression of BrandServiceImplementation.kBlastDoorDefaultScale()
{
  return 1.0;
}

void type metadata accessor for BCSType(uint64_t a1)
{
}

void *sub_100002920@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002930(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000293C(uint64_t a1, uint64_t a2)
{
  return sub_100002A34(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002954()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000029A8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100002A1C(uint64_t a1, uint64_t a2)
{
  return sub_100002A34(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002A34(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100002A78(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100002AF0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100002B70@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002BB4()
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

uint64_t sub_100002C40@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002C88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002CB4(uint64_t a1)
{
  uint64_t v2 = sub_100002E28(&qword_100021EA0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100002E28(&qword_100021EA8, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for BSBrandAssetType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_100002D98(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002DE0()
{
  return sub_100002E28(&qword_100021E88, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100002E28(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002E70()
{
  return sub_100002E28(&qword_100021E90, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100002EB8()
{
  return sub_100002E28(&qword_100021E98, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100002F00@<X0>(uint64_t a1@<X8>)
{
  sub_100002810((uint64_t *)&unk_100022640);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)v14 - v6;
  uint64_t v8 = v1 + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___rcsChatbotAssetDataSource;
  swift_beginAccess();
  sub_100003DE4(v8, (uint64_t)v7, (uint64_t *)&unk_100022640);
  uint64_t v9 = type metadata accessor for BrandAssetNetworkFetcher();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v7, v9);
  }
  sub_100003D38((uint64_t)v7, (uint64_t *)&unk_100022640);
  uint64_t v11 = type metadata accessor for RCSChatBotNetworkProvider();
  swift_allocObject();
  uint64_t v12 = RCSChatBotNetworkProvider.init(customURLCache:waitsForConnectivity:)();
  v14[3] = v11;
  v14[4] = &protocol witness table for RCSChatBotNetworkProvider;
  v14[0] = v12;
  BrandAssetNetworkFetcher.init(networkProvider:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v5, a1, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  swift_beginAccess();
  sub_100003E48((uint64_t)v5, v8);
  return swift_endAccess();
}

id sub_100003118()
{
  uint64_t v1 = type metadata accessor for BrandAssetNetworkFetcher();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  char v5 = (char *)&v19[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v19[-1] - v6;
  uint64_t v8 = OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService;
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService);
  if (v9)
  {
    id v10 = *(id *)(v0 + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService);
  }
  else
  {
    sub_10000E94C((uint64_t)&v19[-1] - v6);
    v19[3] = v1;
    v19[4] = (uint64_t)&protocol witness table for BrandAssetNetworkFetcher;
    uint64_t v11 = sub_100003888(v19);
    sub_100002F00((uint64_t)v11);
    uint64_t v12 = sub_10000EB54();
    v13 = (char *)objc_allocWithZone((Class)type metadata accessor for BrandServiceImplementation());
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
    id v14 = sub_1000038EC((uint64_t)v5, (uint64_t)v19, v12, v13);
    swift_release();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    v15 = *(void **)(v0 + v8);
    *(void *)(v0 + v8) = v14;
    id v10 = v14;

    uint64_t v9 = 0;
  }
  id v16 = v9;
  return v10;
}

void sub_1000032B8()
{
  String.utf8CString.getter();
  char v0 = _set_user_dir_suffix();
  swift_release();
  if (v0)
  {
    uint64_t v1 = NSTemporaryDirectory();
  }
  else
  {
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100003850(v2, (uint64_t)qword_100023050);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      char v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unable to set private sandox for com.apple.businessservicesd", v5, 2u);
      swift_slowDealloc();
    }

    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

void sub_100003430()
{
  uint64_t v1 = v0;
  sub_10000E4A8();
  sub_100014534();
  swift_release();
  sub_10000E544();
  sub_100014534();
  swift_release();
  sub_10000E5E0();
  sub_100014534();
  swift_release();
  sub_10000E67C();
  sub_100014534();
  swift_release();
  sub_100002810(&qword_100022258);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100017960;
  id v3 = sub_10000E718();
  if (v3)
  {
    id v4 = v3;
    *(void *)(v2 + 56) = sub_100003C40(0, &qword_100022260);
    *(void *)(v2 + 32) = v4;
    id v5 = sub_100003118();
    *(void *)(v2 + 88) = type metadata accessor for BrandServiceImplementation();
    *(void *)(v2 + 64) = v5;
    id v6 = objc_allocWithZone((Class)BSXPCDaemonServer);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithServices:isa];

    uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC17businessservicesd6Daemon_XPCServer);
    *(void *)(v1 + OBJC_IVAR____TtC17businessservicesd6Daemon_XPCServer) = v8;
  }
  else
  {
    __break(1u);
  }
}

void sub_100003638()
{
  sub_100003D38(v0 + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___rcsChatbotAssetDataSource, (uint64_t *)&unk_100022640);
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService);
}

id sub_100003680()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iOSDaemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000370C()
{
  return type metadata accessor for iOSDaemon();
}

uint64_t type metadata accessor for iOSDaemon()
{
  uint64_t result = qword_100022248;
  if (!qword_100022248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100003760()
{
  sub_1000037F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000037F8()
{
  if (!qword_100022590)
  {
    type metadata accessor for BrandAssetNetworkFetcher();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100022590);
    }
  }
}

uint64_t sub_100003850(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003888(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id sub_1000038EC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v6 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v9);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = type metadata accessor for BrandAssetNetworkFetcher();
  v26[3] = v11;
  v26[4] = (uint64_t)&protocol witness table for BrandAssetNetworkFetcher;
  uint64_t v12 = sub_100003888(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v12, a1, v11);
  uint64_t v20 = OBJC_IVAR___BSBrandServiceImplementation_queue;
  sub_100003C40(0, (unint64_t *)&qword_100021DF0);
  v13 = a4;
  static DispatchQoS.unspecified.getter();
  v25 = &_swiftEmptyArrayStorage;
  sub_100003C7C();
  sub_100002810(&qword_100021E00);
  sub_100002854();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v21);
  *(void *)&a4[v20] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(_DWORD *)&v13[OBJC_IVAR___BSBrandServiceImplementation_kBlastDoorDefaultMaxPixelDimension] = 1141309440;
  *(_DWORD *)&v13[OBJC_IVAR___BSBrandServiceImplementation_kBlastDoorDefaultScale] = 1065353216;
  sub_100003CD4((uint64_t)v26, (uint64_t)&v13[OBJC_IVAR___BSBrandServiceImplementation_businessConnectAssetDataSource]);
  uint64_t v14 = v22;
  sub_100003DE4(v22, (uint64_t)&v13[OBJC_IVAR___BSBrandServiceImplementation_rcsChatbotAssetDataSource], &qword_100022268);
  *(void *)&v13[OBJC_IVAR___BSBrandServiceImplementation_cachedLogoDataSource] = v23;
  id v15 = objc_allocWithZone((Class)BCSEntitlementVerifier);
  swift_retain();
  id v16 = [v15 init];
  *(void *)&v13[OBJC_IVAR___BSBrandServiceImplementation_entitlementVerifier] = v16;

  v17 = (objc_class *)type metadata accessor for BrandServiceImplementation();
  v24.receiver = v13;
  v24.super_class = v17;
  id v18 = objc_msgSendSuper2(&v24, "init");
  sub_100003D38(v14, &qword_100022268);
  sub_100003D94((uint64_t)v26);
  return v18;
}

uint64_t sub_100003C40(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100003C7C()
{
  unint64_t result = qword_100021DF8;
  if (!qword_100021DF8)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DF8);
  }
  return result;
}

uint64_t sub_100003CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003D38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002810(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003D94(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003DE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002810(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002810((uint64_t *)&unk_100022640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_100003EB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100003EC4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100003F0C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100003F38()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t BrandServiceImplementation.assetData(for:url:type:usingSim:cachingEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(void *)(v8 + 368) = a6;
  *(void *)(v8 + 376) = v7;
  *(unsigned char *)(v8 + 577) = a7;
  *(void *)(v8 + 352) = a4;
  *(void *)(v8 + 360) = a5;
  *(void *)(v8 + 336) = a2;
  *(void *)(v8 + 344) = a3;
  *(void *)(v8 + 328) = a1;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 384) = v9;
  *(void *)(v8 + 392) = *(void *)(v9 - 8);
  *(void *)(v8 + 400) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for StyleSheet();
  *(void *)(v8 + 408) = v10;
  *(void *)(v8 + 416) = *(void *)(v10 - 8);
  *(void *)(v8 + 424) = swift_task_alloc();
  uint64_t v11 = type metadata accessor for URL();
  *(void *)(v8 + 432) = v11;
  *(void *)(v8 + 440) = *(void *)(v11 - 8);
  *(void *)(v8 + 448) = swift_task_alloc();
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  return _swift_task_switch(sub_100004130, 0, 0);
}

uint64_t sub_100004130()
{
  uint64_t v55 = v0;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 344);
  *(void *)(v0 + 472) = sub_100003850(*(void *)(v0 + 384), (uint64_t)qword_100023050);
  v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v53(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 464);
  uint64_t v10 = *(void *)(v0 + 432);
  uint64_t v9 = *(void *)(v0 + 440);
  if (v7)
  {
    uint64_t v50 = *(void *)(v0 + 432);
    uint64_t v51 = *(void *)(v0 + 352);
    os_log_type_t type = v6;
    uint64_t v12 = *(void *)(v0 + 328);
    unint64_t v11 = *(void *)(v0 + 336);
    uint64_t v13 = swift_slowAlloc();
    v54[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 312) = sub_10000A270(v12, v11, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v14 = URL.absoluteString.getter();
    *(void *)(v0 + 320) = sub_10000A270(v14, v15, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v16 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v16(v8, v50);
    *(_WORD *)(v13 + 22) = 2048;
    *(void *)(v0 + 296) = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, type, "Fetching assetData for brandURI %s with URL %s of type %ld", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    id v16 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v16(v8, v10);
  }
  *(void *)(v0 + 480) = v16;
  if (*(void *)(v0 + 352) == 3 && (_BSIsInternalInstall() & 1) != 0)
  {
    id v17 = [self sharedDefaults];
    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v17 valueForKey:v18];

    if (v19)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 208) = 0u;
      *(_OWORD *)(v0 + 224) = 0u;
    }
    sub_10000BB84(v0 + 208, v0 + 176);
    if (*(void *)(v0 + 200))
    {
      if (swift_dynamicCast())
      {
        StyleSheet.init(css:)();
        type metadata accessor for JSONEncoder();
        swift_allocObject();
        JSONEncoder.init()();
        sub_10000DFDC(&qword_1000222B8, (void (*)(uint64_t))&type metadata accessor for StyleSheet);
        uint64_t v20 = dispatch thunk of JSONEncoder.encode<A>(_:)();
        uint64_t v22 = v21;
        (*(void (**)(void, void))(*(void *)(v0 + 416) + 8))(*(void *)(v0 + 424), *(void *)(v0 + 408));
        swift_release();
LABEL_31:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v48 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
        return v48(v20, v22);
      }
    }
    else
    {
      sub_100003D38(v0 + 176, &qword_1000222B0);
    }
  }
  if (URL.hasSecureScheme.getter())
  {
    int v23 = *(unsigned __int8 *)(v0 + 577);
    *(void *)(v0 + 488) = sub_10000B218();
    *(void *)(v0 + 496) = v24;
    if (v23 == 1)
    {
      uint64_t v25 = *(void *)(v0 + 328);
      uint64_t v26 = *(void *)(v0 + 336);
      *(void *)(v0 + 504) = *(void *)(*(void *)(v0 + 376)
                                        + OBJC_IVAR___BSBrandServiceImplementation_cachedLogoDataSource);
      uint64_t v20 = (uint64_t)sub_100010864(v25, v26);
      uint64_t v22 = v47;
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    NSString v37 = String._bridgeToObjectiveC()();
    int IsBusinessID = IMStringIsBusinessID();

    uint64_t v39 = *(void *)(v0 + 376);
    if (IsBusinessID)
    {
      sub_100003CD4(v39 + OBJC_IVAR___BSBrandServiceImplementation_businessConnectAssetDataSource, v0 + 16);
LABEL_28:
      sub_10000E100((long long *)(v0 + 16), v0 + 96);
      uint64_t v43 = *(void *)(v0 + 120);
      uint64_t v44 = *(void *)(v0 + 128);
      sub_10000B7F8((void *)(v0 + 96), v43);
      v45 = (void *)swift_task_alloc();
      *(void *)(v0 + 512) = v45;
      void *v45 = v0;
      v45[1] = sub_100004C74;
      uint64_t v46 = *(void *)(v0 + 344);
      return dispatch thunk of BrandAssetDataSource.assetData(for:)(v46, v43, v44);
    }
    sub_100003DE4(v39 + OBJC_IVAR___BSBrandServiceImplementation_rcsChatbotAssetDataSource, v0 + 16, &qword_100022268);
    if (*(void *)(v0 + 40)) {
      goto LABEL_28;
    }
    sub_100003D38(v0 + 16, &qword_100022268);
    sub_10000A21C();
    swift_allocError();
    unsigned char *v49 = 0;
  }
  else
  {
    v53(*(void *)(v0 + 456), *(void *)(v0 + 344), *(void *)(v0 + 432));
    swift_bridgeObjectRetain_n();
    v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = *(void *)(v0 + 456);
    uint64_t v31 = *(void *)(v0 + 432);
    unint64_t v32 = *(void *)(v0 + 336);
    if (v29)
    {
      uint64_t v33 = *(void *)(v0 + 328);
      uint64_t v34 = swift_slowAlloc();
      v54[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 304) = sub_10000A270(v33, v32, v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2080;
      uint64_t v35 = URL.absoluteString.getter();
      *(void *)(v0 + 264) = sub_10000A270(v35, v36, v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v16(v30, v31);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "assetData() The brand %s is using the URL scheme which is not supported. URL: %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v16(v30, v31);
    }

    sub_10000A21C();
    swift_allocError();
    unsigned char *v40 = 4;
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

uint64_t sub_100004C74(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 520) = v2;
  swift_task_dealloc();
  if (v2)
  {
    BOOL v7 = sub_1000055FC;
  }
  else
  {
    *(void *)(v6 + 528) = a2;
    *(void *)(v6 + 536) = a1;
    BOOL v7 = sub_100004DAC;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100004DAC()
{
  sub_100003D94((uint64_t)(v0 + 12));
  uint64_t v1 = v0[67];
  uint64_t v2 = v0[66];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_100004E64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[69] = a1;
  v4[70] = a2;
  v4[71] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_10000554C;
  }
  else
  {
    uint64_t v5 = sub_100004F88;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100004F88()
{
  uint64_t v55 = v0;
  unint64_t v1 = *(void *)(v0 + 560);
  uint64_t v2 = *(void *)(v0 + 552);
  unint64_t v3 = *(void *)(v0 + 368);
  (*(void (**)(void, void, void))(*(void *)(v0 + 392) + 16))(*(void *)(v0 + 400), *(void *)(v0 + 472), *(void *)(v0 + 384));
  sub_10000B83C(v2, v1);
  swift_bridgeObjectRetain();
  sub_10000B83C(v2, v1);
  swift_bridgeObjectRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v53 = v5;
    uint64_t v6 = *(void *)(v0 + 352);
    uint64_t v7 = *(void *)(v0 + 560) >> 62;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134218498;
    *(void *)(v0 + 256) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 2048;
    switch(v7)
    {
      case 1:
        uint64_t v16 = *(void *)(v0 + 552);
        sub_10000B894(v16, *(void *)(v0 + 560));
        LODWORD(v10) = HIDWORD(v16) - v16;
        if (__OFSUB__(HIDWORD(v16), v16))
        {
          __break(1u);
          JUMPOUT(0x10000553CLL);
        }
        uint64_t v10 = (int)v10;
        break;
      case 2:
        uint64_t v17 = *(void *)(v0 + 552);
        uint64_t v19 = *(void *)(v17 + 16);
        uint64_t v18 = *(void *)(v17 + 24);
        sub_10000B894(v17, *(void *)(v0 + 560));
        uint64_t v10 = v18 - v19;
        if (__OFSUB__(v18, v19))
        {
          __break(1u);
          goto LABEL_10;
        }
        break;
      case 3:
LABEL_10:
        sub_10000B894(*(void *)(v0 + 552), *(void *)(v0 + 560));
        uint64_t v10 = 0;
        break;
      default:
        unint64_t v9 = *(void *)(v0 + 560);
        sub_10000B894(*(void *)(v0 + 552), v9);
        uint64_t v10 = BYTE6(v9);
        break;
    }
    unint64_t v20 = *(void *)(v0 + 560);
    uint64_t v21 = *(void *)(v0 + 552);
    uint64_t v22 = *(void *)(v0 + 392);
    uint64_t v51 = *(void *)(v0 + 384);
    uint64_t v52 = *(void *)(v0 + 400);
    uint64_t v23 = *(void *)(v0 + 360);
    uint64_t v24 = *(void *)(v0 + 368);
    *(void *)(v0 + 272) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_10000B894(v21, v20);
    *(_WORD *)(v8 + 22) = 2080;
    if (v24) {
      uint64_t v25 = v23;
    }
    else {
      uint64_t v25 = 7104878;
    }
    if (v24) {
      unint64_t v26 = v3;
    }
    else {
      unint64_t v26 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 280) = sub_10000A270(v25, v26, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v53, "Successfully fetched asset of type %ld from remote source of size %ld using SIM %s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v52, v51);
  }
  else
  {
    unint64_t v11 = *(void *)(v0 + 560);
    uint64_t v12 = *(void *)(v0 + 552);
    uint64_t v14 = *(void *)(v0 + 392);
    uint64_t v13 = *(void *)(v0 + 400);
    uint64_t v15 = *(void *)(v0 + 384);
    sub_10000B894(v12, v11);
    sub_10000B894(v12, v11);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  unint64_t v27 = *(void *)(v0 + 352);
  if (v27 >= 3)
  {
    if (v27 == 3)
    {
      uint64_t v31 = *(void *)(v0 + 568);
      BOOL v29 = sub_10000BA68();
      if (!v31) {
        goto LABEL_25;
      }
      unint64_t v32 = *(void *)(v0 + 560);
      uint64_t v33 = *(void *)(v0 + 552);
      swift_bridgeObjectRelease();
      uint64_t v46 = v33;
      unint64_t v47 = v32;
    }
    else
    {
      unint64_t v43 = *(void *)(v0 + 560);
      uint64_t v44 = *(void *)(v0 + 552);
      swift_bridgeObjectRelease();
      sub_10000B8EC();
      swift_allocError();
      unsigned char *v45 = 1;
      swift_willThrow();
      uint64_t v46 = v44;
      unint64_t v47 = v43;
    }
    sub_10000B894(v46, v47);
    goto LABEL_27;
  }
  uint64_t v28 = *(void *)(v0 + 568);
  BOOL v29 = sub_10000B940();
  if (v28)
  {
    sub_10000B894(*(void *)(v0 + 552), *(void *)(v0 + 560));
    swift_bridgeObjectRelease();
LABEL_27:
    sub_100003D94(v0 + 136);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
LABEL_25:
  uint64_t v34 = (uint64_t)v29;
  uint64_t v35 = (void *)v30;
  uint64_t v36 = *(void *)(v0 + 496);
  NSString v37 = *(void (**)(char *, uint64_t))(v0 + 488);
  uint64_t v38 = *(void *)(v0 + 448);
  v40 = *(void ***)(v0 + 328);
  uint64_t v39 = *(void *)(v0 + 336);
  sub_10000B83C((uint64_t)v29, v30);
  sub_100010F20(v40, v39, v34, v35, v37, v36, v38);
  unint64_t v41 = *(void *)(v0 + 560);
  uint64_t v42 = *(void *)(v0 + 552);
  (*(void (**)(void, void))(v0 + 480))(*(void *)(v0 + 448), *(void *)(v0 + 432));
  sub_10000E0EC(v34, (unint64_t)v35);
  sub_10000B894(v42, v41);
  swift_bridgeObjectRelease();
  sub_100003D94(v0 + 136);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v50 = *(uint64_t (**)(uint64_t, void *))(v0 + 8);
  return v50(v34, v35);
}

uint64_t sub_10000554C()
{
  sub_100003D94(v0 + 136);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000055FC()
{
  sub_100003D94(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, const void *a6, void *a7)
{
  v7[2] = a7;
  uint64_t v13 = type metadata accessor for URL();
  v7[3] = v13;
  v7[4] = *(void *)(v13 - 8);
  uint64_t v14 = swift_task_alloc();
  v7[5] = v14;
  v7[6] = _Block_copy(a6);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  v7[7] = v16;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    a4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v7[8] = v19;
  a7;
  unint64_t v20 = (void *)swift_task_alloc();
  v7[9] = v20;
  *unint64_t v20 = v7;
  v20[1] = sub_1000059F4;
  return BrandServiceImplementation.assetData(for:url:type:usingSim:cachingEnabled:)(v15, v17, v14, a3, a4, v19, a5 & 1);
}

uint64_t sub_1000059F4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = (void *)*v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = (void *)*v3;
  swift_task_dealloc();
  uint64_t v10 = (void *)v7[2];
  (*(void (**)(void, void))(v7[4] + 8))(v7[5], v7[3]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    uint64_t v11 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v13 = (void *)v11;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000B894(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = isa;
  }
  uint64_t v14 = (void (**)(void, void, void))v8[6];
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v9[1];
  return v15();
}

id BrandServiceImplementation.logoFileURL(for:remoteUrl:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v114 = a5;
  v115 = a4;
  uint64_t v10 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002810(&qword_1000222C8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v105 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v97 - v16;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v107 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v104 = (char *)&v97 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v102 = (char *)&v97 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  *(void *)&long long v108 = (char *)&v97 - v27;
  uint64_t v103 = v28;
  __chkstk_darwin(v26);
  unint64_t v30 = (char *)&v97 - v29;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v31 = type metadata accessor for Logger();
  uint64_t v32 = sub_100003850(v31, (uint64_t)qword_100023050);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v113 = a3;
  v110 = v33;
  uint64_t v111 = v19 + 16;
  v33(v30, a3, v18);
  swift_bridgeObjectRetain_n();
  uint64_t v109 = v32;
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  BOOL v36 = os_log_type_enabled(v34, v35);
  v106 = v12;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    v99 = v17;
    uint64_t v38 = v37;
    uint64_t v98 = swift_slowAlloc();
    *(void *)&v122[0] = v98;
    *(_DWORD *)uint64_t v38 = 136315394;
    os_log_t v97 = v34;
    swift_bridgeObjectRetain();
    *(void *)&long long v120 = sub_10000A270(a1, a2, (uint64_t *)v122);
    *(void *)&long long v101 = v19;
    uint64_t v100 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v39 = URL.absoluteString.getter();
    *(void *)&long long v120 = sub_10000A270(v39, v40, (uint64_t *)v122);
    uint64_t v41 = v100;
    uint64_t v42 = v101;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v19 = v42;
    unint64_t v43 = v30;
    uint64_t v44 = v41;
    v112 = *(void (**)(char *, uint64_t))(v42 + 8);
    v112(v43, v41);
    uint64_t v34 = v97;
    _os_log_impl((void *)&_mh_execute_header, v97, v35, "Fetching logoData for brandURI %s with URL %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v17 = v99;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v45 = v30;
    uint64_t v44 = v18;
    v112 = *(void (**)(char *, uint64_t))(v19 + 8);
    v112(v45, v18);
  }

  uint64_t v46 = v113;
  char v47 = URL.hasSecureScheme.getter();
  v48 = v115;
  if ((v47 & 1) == 0)
  {
    uint64_t v67 = a1;
    v68 = (char *)v108;
    uint64_t v69 = v44;
    v110((char *)v108, v46, v44);
    swift_bridgeObjectRetain_n();
    v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = swift_slowAlloc();
      uint64_t v113 = swift_slowAlloc();
      *(void *)&v122[0] = v113;
      *(_DWORD *)uint64_t v72 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)&long long v120 = sub_10000A270(v67, a2, (uint64_t *)v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v72 + 12) = 2080;
      uint64_t v73 = URL.absoluteString.getter();
      *(void *)&long long v120 = sub_10000A270(v73, v74, (uint64_t *)v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v112(v68, v69);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "logoFileURL() The brand %s is using the URL scheme which is not supported. URL: %s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      v48 = v115;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v112(v68, v69);
    }

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v69);
    sub_10000A21C();
    uint64_t v76 = swift_allocError();
    char v77 = 4;
    goto LABEL_16;
  }
  id result = [self currentConnection];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v50 = result;
  [result auditToken];
  long long v108 = v120;
  long long v101 = v121;

  v122[0] = v108;
  v122[1] = v101;
  uint64_t v51 = *(void **)(v6 + OBJC_IVAR___BSBrandServiceImplementation_entitlementVerifier);
  char v123 = 0;
  if (![v51 auditToken:v122 hasEntitlement:BSBrandLogoEntitlement])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v44);
    sub_10000B8EC();
    uint64_t v76 = swift_allocError();
    char v77 = 3;
LABEL_16:
    char *v75 = v77;
    v48(v17, 0, 0, v76);
    swift_errorRelease();
    return (id)sub_100003D38((uint64_t)v17, &qword_1000222C8);
  }
  uint64_t v52 = a1;
  os_log_type_t v53 = sub_10000B218();
  uint64_t v55 = v54;
  uint64_t v56 = swift_allocObject();
  uint64_t v57 = v6;
  uint64_t v58 = v114;
  *(void *)&long long v101 = v56;
  *(void *)(v56 + 16) = v48;
  *(void *)(v56 + 24) = v58;
  uint64_t v98 = v57;
  uint64_t v59 = *(void *)(v57 + OBJC_IVAR___BSBrandServiceImplementation_cachedLogoDataSource);
  *(void *)&long long v108 = v52;
  *(void *)&long long v120 = v52;
  *((void *)&v120 + 1) = a2;
  v99 = (char *)a2;
  uint64_t v118 = 0x3A7A69623A6E7275;
  unint64_t v119 = 0xE800000000000000;
  uint64_t v116 = 0;
  unint64_t v117 = 0xE000000000000000;
  sub_10000BC2C();
  swift_retain();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v60 = v107;
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  v61 = v104;
  os_log_t v97 = v53;
  uint64_t v100 = v55;
  URL.appendingPathComponent(_:)();
  v62 = v112;
  v112(v60, v44);
  v63 = *(void **)(v59 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  URL.path.getter();
  NSString v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LODWORD(v52) = [v63 fileExistsAtPath:v64];

  if (v52)
  {
    uint64_t v65 = (uint64_t)v105;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v105, v61, v44);
    uint64_t v66 = 0;
  }
  else
  {
    v62(v61, v44);
    uint64_t v66 = 1;
    uint64_t v65 = (uint64_t)v105;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v65, v66, 1, v44);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v65, 1, v44) == 1)
  {
    uint64_t v78 = v108;
    sub_100003D38(v65, &qword_1000222C8);
    v79 = Logger.logObject.getter();
    os_log_type_t v80 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v81 = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Brand logo not found in cache. Will attempt to fetch from server.", v81, 2u);
      swift_slowDealloc();
    }

    uint64_t v82 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v106, 1, 1, v82);
    v83 = v107;
    v110(v107, v113, v44);
    unint64_t v84 = (*(unsigned __int8 *)(v19 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    unint64_t v85 = (v103 + v84 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v86 = (v85 + 23) & 0xFFFFFFFFFFFFFFF8;
    v87 = (char *)swift_allocObject();
    *((void *)v87 + 2) = 0;
    *((void *)v87 + 3) = 0;
    v88 = (void *)v98;
    *((void *)v87 + 4) = v98;
    *((void *)v87 + 5) = v78;
    *((void *)v87 + 6) = v99;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v87[v84], v83, v44);
    v89 = &v87[v85];
    uint64_t v90 = v100;
    *(void *)v89 = v97;
    *((void *)v89 + 1) = v90;
    v91 = (uint64_t (**)(uint64_t))&v87[v86];
    v92 = (uint64_t (*)(uint64_t))v101;
    *v91 = sub_10000BC24;
    v91[1] = v92;
    v93 = &v87[(v86 + 23) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v94 = v114;
    *(void *)v93 = v115;
    *((void *)v93 + 1) = v94;
    swift_bridgeObjectRetain();
    swift_retain();
    id v95 = v88;
    sub_100007880((uint64_t)v106, (uint64_t)&unk_1000222E8, (uint64_t)v87);
    return (id)swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v96 = (uint64_t)v102;
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v102, v65, v44);
    sub_1000068D0(v96, v115);
    swift_release();
    return (id)((uint64_t (*)(uint64_t, uint64_t))v62)(v96, v44);
  }
}

uint64_t sub_1000068D0(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = sub_100002810(&qword_1000222C8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[0] = URL.path.getter();
  v29[1] = v11;
  static String.Encoding.utf8.getter();
  sub_10000BC2C();
  StringProtocol.cString(using:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  uint64_t v12 = sandbox_extension_issue_file();
  swift_bridgeObjectRelease();
  if (v12)
  {
    uint64_t v13 = String.init(utf8String:)();
    uint64_t v15 = v14;
    uint64_t v16 = type metadata accessor for URL();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = v17;
    if (v15)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v6, a1, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v6, 0, 1, v16);
      a2(v6, v13, v15, 0);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v6, 1, 1, v16);
      sub_10000B8EC();
      uint64_t v27 = swift_allocError();
      *uint64_t v28 = 2;
      a2(v6, v13, 0, v27);
      swift_errorRelease();
    }
    sub_100003D38((uint64_t)v6, &qword_1000222C8);
    return swift_slowDealloc();
  }
  else
  {
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100003850(v19, (uint64_t)qword_100023050);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 67109120;
      LODWORD(v29[0]) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Could not obtain sandbox access token. Error: %d", v22, 8u);
      swift_slowDealloc();
    }

    uint64_t v23 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
    sub_10000B8EC();
    uint64_t v24 = swift_allocError();
    unsigned char *v25 = 2;
    a2(v6, 0, 0, v24);
    swift_errorRelease();
    return sub_100003D38((uint64_t)v6, &qword_1000222C8);
  }
}

uint64_t sub_100006D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 176) = v14;
  *(_OWORD *)(v8 + 144) = v12;
  *(_OWORD *)(v8 + 160) = v13;
  *(void *)(v8 + 128) = a7;
  *(void *)(v8 + 136) = a8;
  *(void *)(v8 + 112) = a5;
  *(void *)(v8 + 120) = a6;
  *(void *)(v8 + 104) = a4;
  sub_100002810(&qword_1000222C8);
  *(void *)(v8 + 184) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  *(void *)(v8 + 192) = v9;
  *(void *)(v8 + 200) = *(void *)(v9 - 8);
  *(void *)(v8 + 208) = swift_task_alloc();
  return _swift_task_switch(sub_100006E40, 0, 0);
}

uint64_t sub_100006E40()
{
  NSString v1 = String._bridgeToObjectiveC()();
  int IsBusinessID = IMStringIsBusinessID();

  uint64_t v3 = *(void *)(v0 + 104);
  if (IsBusinessID)
  {
    sub_100003CD4(v3 + OBJC_IVAR___BSBrandServiceImplementation_businessConnectAssetDataSource, v0 + 56);
LABEL_4:
    sub_10000E100((long long *)(v0 + 56), v0 + 16);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v5 = *(void *)(v0 + 48);
    sub_10000B7F8((void *)(v0 + 16), v4);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000071F8;
    uint64_t v7 = *(void *)(v0 + 128);
    return dispatch thunk of BrandAssetDataSource.assetData(for:)(v7, v4, v5);
  }
  sub_100003DE4(v3 + OBJC_IVAR___BSBrandServiceImplementation_rcsChatbotAssetDataSource, v0 + 56, &qword_100022268);
  if (*(void *)(v0 + 80)) {
    goto LABEL_4;
  }
  sub_100003D38(v0 + 56, &qword_100022268);
  sub_10000A21C();
  uint64_t v8 = swift_allocError();
  *uint64_t v9 = 0;
  swift_willThrow();
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100003850(v10, (uint64_t)qword_100023050);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    long long v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v13 = 138412290;
    swift_errorRetain();
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 96) = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v14 = v15;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Fetching of brand logo failed with error %@", v13, 0xCu);
    sub_100002810(&qword_100022630);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 200);
  uint64_t v18 = *(void *)(v0 + 184);
  uint64_t v19 = *(void (**)(uint64_t, void, void, uint64_t))(v0 + 168);

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v18, 1, 1, v16);
  swift_errorRetain();
  v19(v18, 0, 0, v8);
  swift_errorRelease();
  swift_errorRelease();
  sub_100003D38(v18, &qword_1000222C8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_1000071F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[28] = a1;
  v4[29] = a2;
  v4[30] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_100007610;
  }
  else {
    uint64_t v5 = sub_100007310;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100007310()
{
  uint64_t v1 = *(void *)(v0 + 240);
  sub_100010F20(*(void ***)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 224), *(void **)(v0 + 232), *(void (**)(char *, uint64_t))(v0 + 136), *(void *)(v0 + 144), *(void *)(v0 + 208));
  uint64_t v3 = *(void *)(v0 + 224);
  unint64_t v2 = *(void *)(v0 + 232);
  if (v1)
  {
    sub_10000B894(*(void *)(v0 + 224), *(void *)(v0 + 232));
    sub_100003D94(v0 + 16);
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100003850(v4, (uint64_t)qword_100023050);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 96) = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v8 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetching of brand logo failed with error %@", v7, 0xCu);
      sub_100002810(&qword_100022630);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v13 = *(void *)(v0 + 192);
    uint64_t v14 = *(void *)(v0 + 200);
    uint64_t v15 = *(void *)(v0 + 184);
    uint64_t v16 = *(void (**)(uint64_t, void, void, uint64_t))(v0 + 168);

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v15, 1, 1, v13);
    swift_errorRetain();
    v16(v15, 0, 0, v1);
    swift_errorRelease();
    swift_errorRelease();
    sub_100003D38(v15, &qword_1000222C8);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 192);
    (*(void (**)(uint64_t))(v0 + 152))(v10);
    sub_10000B894(v3, v2);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    sub_100003D94(v0 + 16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_100007610()
{
  sub_100003D94((uint64_t)(v0 + 2));
  uint64_t v1 = v0[30];
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100003850(v2, (uint64_t)qword_100023050);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching of brand logo failed with error %@", v5, 0xCu);
    sub_100002810(&qword_100022630);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = v0[24];
  uint64_t v9 = v0[25];
  uint64_t v10 = v0[23];
  uint64_t v11 = (void (*)(uint64_t, void, void, uint64_t))v0[21];

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v10, 1, 1, v8);
  swift_errorRetain();
  v11(v10, 0, 0, v1);
  swift_errorRelease();
  swift_errorRelease();
  sub_100003D38(v10, &qword_1000222C8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_100007880(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100003D38(a1, &qword_1000222C0);
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

void sub_100007B70(uint64_t a1, uint64_t a2, NSString a3, void *a4, uint64_t a5)
{
  uint64_t v9 = sub_100002810(&qword_1000222C8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003DE4(a1, (uint64_t)v11, &qword_1000222C8);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    uint64_t v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
  }
  if (a3) {
    a3 = String._bridgeToObjectiveC()();
  }
  if (a4) {
    a4 = (void *)_convertErrorToNSError(_:)();
  }
  (*(void (**)(uint64_t, void *, NSString, void *))(a5 + 16))(a5, v15, a3, a4);
}

uint64_t BrandServiceImplementation.fetchAsset(withURL:assetType:)(uint64_t a1, uint64_t a2)
{
  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  uint64_t v4 = type metadata accessor for URL();
  v3[17] = v4;
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return _swift_task_switch(sub_100007DC0, 0, 0);
}

uint64_t sub_100007DC0()
{
  uint64_t v35 = v0;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v5 = type metadata accessor for Logger();
  sub_100003850(v5, (uint64_t)qword_100023050);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v32(v2, v1, v4);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 144);
  if (v8)
  {
    uint64_t v31 = *(void *)(v0 + 136);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v12 = URL.absoluteString.getter();
    *(void *)(v0 + 104) = sub_10000A270(v12, v13, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v9, v31);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "fetchAsset for URL %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v14(v9, *(void *)(v0 + 136));
  }

  if ((URL.hasSecureScheme.getter() & 1) == 0)
  {
    v32(*(void *)(v0 + 152), *(void *)(v0 + 112), *(void *)(v0 + 136));
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v20 = *(void *)(v0 + 152);
    if (v19)
    {
      uint64_t v33 = *(void *)(v0 + 136);
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      v34[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v21 = 136315138;
      uint64_t v22 = URL.absoluteString.getter();
      *(void *)(v0 + 96) = sub_10000A270(v22, v23, v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v14(v20, v33);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "fetchAsset() URL scheme is not supported. URL: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v14(*(void *)(v0 + 152), *(void *)(v0 + 136));
    }

    char v16 = 4;
    goto LABEL_18;
  }
  uint64_t v15 = *(void *)(v0 + 128);
  if ((*(void *)(v0 + 120) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    sub_100003DE4(v15 + OBJC_IVAR___BSBrandServiceImplementation_rcsChatbotAssetDataSource, v0 + 56, &qword_100022268);
    if (!*(void *)(v0 + 80))
    {
      sub_100003D38(v0 + 56, &qword_100022268);
      char v16 = 0;
LABEL_18:
      sub_10000A21C();
      swift_allocError();
      *uint64_t v28 = v16;
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
      return v29();
    }
  }
  else
  {
    sub_100003CD4(v15 + OBJC_IVAR___BSBrandServiceImplementation_businessConnectAssetDataSource, v0 + 56);
  }
  sub_10000E100((long long *)(v0 + 56), v0 + 16);
  uint64_t v24 = *(void *)(v0 + 40);
  uint64_t v25 = *(void *)(v0 + 48);
  sub_10000B7F8((void *)(v0 + 16), v24);
  uint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_1000082AC;
  uint64_t v27 = *(void *)(v0 + 112);
  return dispatch thunk of BrandAssetDataSource.assetData(for:)(v27, v24, v25);
}

uint64_t sub_1000082AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[22] = a1;
  v4[23] = a2;
  v4[24] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_100008538;
  }
  else {
    uint64_t v5 = sub_1000083C4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000083C4()
{
  unint64_t v1 = v0[15];
  if (v1 >= 3)
  {
    if (v1 != 3)
    {
      uint64_t v13 = v0[22];
      unint64_t v12 = v0[23];
      sub_10000A21C();
      swift_allocError();
      *uint64_t v14 = 1;
      swift_willThrow();
      uint64_t v5 = v13;
      unint64_t v6 = v12;
      goto LABEL_10;
    }
    uint64_t v7 = v0[24];
    uint64_t v3 = sub_10000BA68();
    if (v7)
    {
LABEL_3:
      uint64_t v5 = v0[22];
      unint64_t v6 = v0[23];
LABEL_10:
      sub_10000B894(v5, v6);
      sub_100003D94((uint64_t)(v0 + 2));
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v15 = (uint64_t (*)(void))v0[1];
      return v15();
    }
  }
  else
  {
    uint64_t v2 = v0[24];
    uint64_t v3 = sub_10000B940();
    if (v2) {
      goto LABEL_3;
    }
  }
  BOOL v8 = v3;
  uint64_t v9 = v4;
  sub_10000B894(v0[22], v0[23]);
  sub_100003D94((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void *, uint64_t))v0[1];
  return v10(v8, v9);
}

uint64_t sub_100008538()
{
  sub_100003D94(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000872C(uint64_t a1, uint64_t a2, const void *a3, void *a4)
{
  v4[2] = a4;
  uint64_t v8 = type metadata accessor for URL();
  v4[3] = v8;
  v4[4] = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  v4[5] = v9;
  v4[6] = _Block_copy(a3);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[7] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_10000886C;
  return BrandServiceImplementation.fetchAsset(withURL:assetType:)(v9, a2);
}

uint64_t sub_10000886C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = (void *)*v3;
  uint64_t v7 = (void *)*v3;
  uint64_t v9 = (void *)*v3;
  swift_task_dealloc();
  uint64_t v10 = (void *)v7[2];
  (*(void (**)(void, void))(v7[4] + 8))(v7[5], v7[3]);

  if (v4)
  {
    uint64_t v11 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v13 = (void *)v11;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000B894(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = isa;
  }
  uint64_t v14 = (void (**)(void, void, void))v8[6];
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v9[1];
  return v15();
}

uint64_t BrandServiceImplementation.clearCachedAssets(for:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return _swift_task_switch(sub_100008A7C, 0, 0);
}

uint64_t sub_100008A7C()
{
  uint64_t v11 = v0;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100003850(v1, (uint64_t)qword_100023050);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 32);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 24);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_10000A270(v6, v5, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "clearCachedAssets for brand %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1000117E0(*(void **)(v0 + 24), *(void **)(v0 + 32));
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100008E14(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  v3[4] = v6;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_100008F00;
  v9[4] = v7;
  v9[5] = v8;
  v9[3] = v5;
  return _swift_task_switch(sub_100008A7C, 0, 0);
}

uint64_t sub_100008F00()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    id v8 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t BrandServiceImplementation.clearUnusedCachedLogos()()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_1000090C0, 0, 0);
}

uint64_t sub_1000090C0()
{
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100003850(v1, (uint64_t)qword_100023050);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "clearUnusedCachedLogos", v4, 2u);
    swift_slowDealloc();
  }

  sub_100011B10();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100009368(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100009428;
  v5[2] = v4;
  return _swift_task_switch(sub_1000090C0, 0, 0);
}

uint64_t sub_100009428()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    id v8 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_1000095AC(unint64_t a1, unint64_t a2)
{
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_100002810(&qword_100022438);
  if (swift_dynamicCast())
  {
    sub_10000E100(v38, (uint64_t)&v41);
    sub_10000B7F8(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_100003D94((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_100003D38((uint64_t)v38, &qword_100022440);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    id v8 = sub_10000B114(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  id v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_10000B178(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin(*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_10000A944((void *(*)(uint64_t *__return_ptr, char *, char *))sub_10000E080);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_10000A778(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_10000A778(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  id v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    sub_10000E0EC(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_10000E0EC((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

id BrandServiceImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void BrandServiceImplementation.init()()
{
}

id BrandServiceImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandServiceImplementation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100009C28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000E198;
  return v6();
}

uint64_t sub_100009CF4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000E198;
  return v7();
}

uint64_t sub_100009DC0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100003D38(a1, &qword_1000222C0);
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

uint64_t sub_100009F6C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000E1AC;
  return v6(a1);
}

uint64_t sub_10000A048(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000A124;
  return v6(a1);
}

uint64_t sub_10000A124()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10000A21C()
{
  unint64_t result = qword_100022278;
  if (!qword_100022278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022278);
  }
  return result;
}

uint64_t sub_10000A270(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A344(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E138((uint64_t)v12, *a3);
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
      sub_10000E138((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003D94((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A344(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000A500(a5, a6);
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

uint64_t sub_10000A500(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000A598(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A7F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A7F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000A598(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000A710(v2, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000A710(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100002810(&qword_100022448);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000A778(unsigned __int16 a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10000A7F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002810(&qword_100022448);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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

char *sub_10000A944(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)id v1 = xmmword_1000179E0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_10000AD30((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = sub_10000AD30(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_10000AC48@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_10000AF50(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_10000B014((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_10000B090((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_10000ACC0(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_10000AD30(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_10000ADE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for SHA256();
      sub_10000DFDC(&qword_100022410, (void (*)(uint64_t))&type metadata accessor for SHA256);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AEC4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
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

uint64_t sub_10000AF50(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10000B014(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_10000B090(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_10000B114(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_10000AF50(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_10000B014((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_10000B090((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_10000B178(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_10000B218()
{
  uint64_t v0 = type metadata accessor for SHA256();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  char v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SHA256Digest();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v41 - v8;
  unint64_t v10 = URL.absoluteString.getter();
  uint64_t v12 = sub_1000095AC(v10, v11);
  unint64_t v14 = v13;
  sub_10000DFDC(&qword_100022410, (void (*)(uint64_t))&type metadata accessor for SHA256);
  dispatch thunk of HashFunction.init()();
  uint64_t v44 = v9;
  unint64_t v45 = v14;
  switch(v14 >> 62)
  {
    case 1uLL:
      uint64_t v18 = (int)v12;
      uint64_t v19 = v12;
      uint64_t v20 = v12 >> 32;
      if (v20 < v18) {
        goto LABEL_24;
      }
      *(void *)&long long v47 = v1;
      unint64_t v21 = v45;
      sub_10000B83C(v19, v45);
      sub_10000ADE4(v18, v20);
      unint64_t v22 = v21;
      uint64_t v1 = v47;
      sub_10000B894(v19, v22);
      uint64_t v9 = v44;
      uint64_t v12 = v19;
      break;
    case 2uLL:
      *(void *)&long long v47 = v1;
      unint64_t v23 = v45;
      uint64_t v24 = v12;
      uint64_t v25 = *(void *)(v12 + 16);
      uint64_t v26 = *(void *)(v24 + 24);
      sub_10000B83C(v24, v45);
      swift_retain();
      swift_retain();
      sub_10000ADE4(v25, v26);
      uint64_t v12 = v24;
      uint64_t v9 = v44;
      swift_release();
      swift_release();
      uint64_t v16 = v24;
      unint64_t v17 = v23;
      uint64_t v1 = v47;
      goto LABEL_7;
    case 3uLL:
      *(void *)((char *)&v48 + 6) = 0;
      *(void *)&long long v48 = 0;
      dispatch thunk of HashFunction.update(bufferPointer:)();
      uint64_t v16 = v12;
      unint64_t v17 = v45;
      goto LABEL_7;
    default:
      *(void *)&long long v48 = v12;
      unint64_t v15 = v45;
      DWORD2(v48) = v45;
      WORD6(v48) = WORD2(v45);
      dispatch thunk of HashFunction.update(bufferPointer:)();
      uint64_t v16 = v12;
      unint64_t v17 = v15;
LABEL_7:
      sub_10000B894(v16, v17);
      break;
  }
  dispatch thunk of HashFunction.finalize()();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v7, v9, v4);
  sub_10000DFDC(&qword_100022418, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
  dispatch thunk of Sequence.makeIterator()();
  unint64_t v27 = *((void *)&v48 + 1);
  uint64_t v28 = v48;
  uint64_t v29 = *(void *)(v48 + 16);
  uint64_t v42 = v12;
  uint64_t v43 = v4;
  if (*((void *)&v48 + 1) != v29)
  {
    if (*((uint64_t *)&v48 + 1) < v29)
    {
      unint64_t v30 = _swiftEmptyArrayStorage;
      long long v47 = xmmword_1000179F0;
      while ((v27 & 0x8000000000000000) == 0)
      {
        if (v27 >= *(void *)(v28 + 16)) {
          goto LABEL_22;
        }
        char v33 = *(unsigned char *)(v28 + 32 + v27);
        sub_100002810(&qword_100022420);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = v47;
        *(void *)(v34 + 56) = &type metadata for UInt8;
        *(void *)(v34 + 64) = &protocol witness table for UInt8;
        *(unsigned char *)(v34 + 32) = v33;
        uint64_t v35 = String.init(format:_:)();
        uint64_t v37 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v30 = sub_100013468(0, v30[2] + 1, 1, v30);
        }
        unint64_t v39 = v30[2];
        unint64_t v38 = v30[3];
        if (v39 >= v38 >> 1) {
          unint64_t v30 = sub_100013468((void *)(v38 > 1), v39 + 1, 1, v30);
        }
        ++v27;
        v30[2] = v39 + 1;
        long long v40 = &v30[2 * v39];
        v40[4] = v35;
        v40[5] = v37;
        if (v29 == v27) {
          goto LABEL_10;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
    }
    __break(1u);
LABEL_24:
    __break(1u);
  }
  unint64_t v30 = _swiftEmptyArrayStorage;
LABEL_10:
  swift_bridgeObjectRelease();
  *(void *)&long long v48 = v30;
  sub_100002810(&qword_100022428);
  sub_10000E024();
  uint64_t v31 = BidirectionalCollection<>.joined(separator:)();
  sub_10000B894(v42, v45);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v44, v43);
  return v31;
}

void *sub_10000B7F8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B83C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000B894(uint64_t a1, unint64_t a2)
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

unint64_t sub_10000B8EC()
{
  unint64_t result = qword_1000222A8;
  if (!qword_1000222A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000222A8);
  }
  return result;
}

void *sub_10000B940()
{
  id v0 = [self defaultHelper];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v8 = 0;
  LODWORD(v2) = 1141309440;
  LODWORD(v3) = 1.0;
  id v4 = [v0 safeImageFromImage:isa maxPixelDimension:&v8 scale:v2 error:v3];

  id v5 = v8;
  if (v4)
  {
    uint64_t v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return v6;
}

void *sub_10000BA68()
{
  id v0 = [self defaultHelper];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = 0;
  id v2 = [v0 safeCSSFromData:isa error:&v6];

  id v3 = v6;
  if (v2)
  {
    id v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    id v4 = v3;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return v4;
}

uint64_t sub_10000BB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002810(&qword_1000222B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BBEC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BC24(uint64_t a1)
{
  return sub_1000068D0(a1, *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 16));
}

unint64_t sub_10000BC2C()
{
  unint64_t result = qword_1000222D8;
  if (!qword_1000222D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000222D8);
  }
  return result;
}

uint64_t sub_10000BC84(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = v1[3];
  uint64_t v13 = v1[2];
  uint64_t v5 = v1[5];
  uint64_t v11 = v1[4];
  uint64_t v6 = v1[6];
  uint64_t v7 = (uint64_t)v1 + v4;
  uint64_t v8 = *(void *)((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000E198;
  return sub_100006D34(a1, v13, v12, v11, v5, v6, v7, v8);
}

uint64_t type metadata accessor for BrandServiceImplementation()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for BrandService(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrandService(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BrandService(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10000BF9CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000BFC4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BFD0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BrandService()
{
  return &type metadata for BrandService;
}

unint64_t sub_10000BFEC()
{
  unint64_t result = qword_100022348;
  if (!qword_100022348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022348);
  }
  return result;
}

uint64_t sub_10000C040()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C080()
{
  int v2 = *(const void **)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unsigned int v4 = v1;
  v4[1] = sub_10000E198;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100022350 + dword_100022350);
  return v5(v2, v3);
}

uint64_t sub_10000C130()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E198;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100022360 + dword_100022360);
  return v6(v2, v3, v4);
}

uint64_t sub_10000C1F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000E198;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100022370 + dword_100022370);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000C2C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000E198;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100022380 + dword_100022380);
  return v6(a1, v4);
}

uint64_t sub_10000C378()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C3C0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000E198;
  unsigned int v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100022390 + dword_100022390);
  return v6(v2, v3, v4);
}

uint64_t sub_10000C47C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000C4C4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (const void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned int v6 = v1;
  v6[1] = sub_10000C584;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, const void *, void *))((char *)&dword_1000223B0 + dword_1000223B0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000C584()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C680(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a2;
  uint64_t v3 = sub_100002810(&qword_1000222C8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unsigned int v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v55 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v55 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v55 = (char *)&v55 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v55 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v55 - v18;
  uint64_t v20 = type metadata accessor for String.Encoding();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = URL.path.getter();
  uint64_t v58 = v24;
  static String.Encoding.utf8.getter();
  sub_10000BC2C();
  StringProtocol.cString(using:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  swift_bridgeObjectRelease();
  uint64_t v25 = sandbox_extension_issue_file();
  swift_bridgeObjectRelease();
  if (v25)
  {
    String.init(utf8String:)();
    uint64_t v27 = v26;
    uint64_t v28 = type metadata accessor for URL();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = v29;
    if (v27)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v19, a1, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v19, 0, 1, v28);
      sub_100003DE4((uint64_t)v19, (uint64_t)v17, &qword_1000222C8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v17, 1, v28) == 1)
      {
        uint64_t v32 = 0;
      }
      else
      {
        URL._bridgeToObjectiveC()(v31);
        uint64_t v32 = v52;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v28);
      }
      uint64_t v53 = v56;
      NSString v54 = String._bridgeToObjectiveC()();
      (*(void (**)(uint64_t, void *, NSString, void))(v53 + 16))(v53, v32, v54, 0);
      swift_bridgeObjectRelease();

      uint64_t v51 = (uint64_t)v19;
    }
    else
    {
      uint64_t v45 = (uint64_t)v55;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v55, 1, 1, v28);
      sub_10000B8EC();
      swift_allocError();
      *uint64_t v46 = 2;
      sub_100003DE4(v45, (uint64_t)v12, &qword_1000222C8);
      long long v48 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v12, 1, v28) != 1)
      {
        URL._bridgeToObjectiveC()(v47);
        long long v48 = v49;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v28);
      }
      uint64_t v50 = (void *)_convertErrorToNSError(_:)();
      (*(void (**)(uint64_t, void *, void, void *))(v56 + 16))(v56, v48, 0, v50);

      swift_errorRelease();
      uint64_t v51 = v45;
    }
    sub_100003D38(v51, &qword_1000222C8);
    return swift_slowDealloc();
  }
  else
  {
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_100003850(v33, (uint64_t)qword_100023050);
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 67109120;
      LODWORD(v57) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Could not obtain sandbox access token. Error: %d", v36, 8u);
      swift_slowDealloc();
    }

    uint64_t v37 = type metadata accessor for URL();
    uint64_t v38 = *(void *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v9, 1, 1, v37);
    sub_10000B8EC();
    swift_allocError();
    *unint64_t v39 = 2;
    sub_100003DE4((uint64_t)v9, (uint64_t)v6, &qword_1000222C8);
    uint64_t v41 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v6, 1, v37) != 1)
    {
      URL._bridgeToObjectiveC()(v40);
      uint64_t v41 = v42;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v37);
    }
    uint64_t v43 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *, void, void *))(v56 + 16))(v56, v41, 0, v43);

    swift_errorRelease();
    return sub_100003D38((uint64_t)v9, &qword_1000222C8);
  }
}

void sub_10000CD3C(uint64_t a1, unint64_t a2, uint64_t a3, char *a4, const void *a5)
{
  uint64_t v10 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v10 - 8);
  uint64_t v120 = (uint64_t)v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002810(&qword_1000222C8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  v124 = (char *)v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v125 = (char *)v113 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v116 = (uint64_t)v113 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  unint64_t v117 = (char *)v113 - v20;
  __chkstk_darwin(v19);
  unint64_t v119 = (char *)v113 - v21;
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v22);
  long long v121 = (char *)v113 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v118 = (char *)v113 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v114 = (char *)v113 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  *(void *)&long long v133 = (char *)v113 - v31;
  uint64_t v115 = v32;
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)v113 - v33;
  uint64_t v132 = swift_allocObject();
  *(void *)(v132 + 16) = a5;
  _Block_copy(a5);
  _Block_copy(a5);
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v35 = type metadata accessor for Logger();
  uint64_t v36 = sub_100003850(v35, (uint64_t)qword_100023050);
  uint64_t v37 = *(void (**)(void, void, void))(v23 + 16);
  uint64_t v131 = a3;
  uint64_t v129 = v23 + 16;
  v128 = v37;
  v37(v34, a3, v22);
  swift_bridgeObjectRetain_n();
  uint64_t v127 = v36;
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    v122 = a4;
    uint64_t v41 = v40;
    uint64_t v42 = swift_slowAlloc();
    char v123 = a5;
    v113[1] = v42;
    *(void *)&v140[0] = v42;
    *(_DWORD *)uint64_t v41 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)&long long v138 = sub_10000A270(a1, a2, (uint64_t *)v140);
    *(void *)&long long v126 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v41 + 12) = 2080;
    uint64_t v43 = URL.absoluteString.getter();
    *(void *)&long long v138 = sub_10000A270(v43, v44, (uint64_t *)v140);
    uint64_t v23 = v126;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v130 = *(void (**)(char *, uint64_t))(v23 + 8);
    v130(v34, v22);
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Fetching logoData for brandURI %s with URL %s", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy();
    a5 = v123;
    swift_slowDealloc();
    a4 = v122;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v130 = *(void (**)(char *, uint64_t))(v23 + 8);
    v130(v34, v22);
  }

  uint64_t v45 = v131;
  char v46 = URL.hasSecureScheme.getter();
  long long v47 = v133;
  if ((v46 & 1) == 0)
  {
    v128(v133, v45, v22);
    swift_bridgeObjectRetain_n();
    uint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = swift_slowAlloc();
      *(void *)&v140[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)&long long v138 = sub_10000A270(a1, a2, (uint64_t *)v140);
      *(void *)&long long v126 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v69 + 12) = 2080;
      v70 = v133;
      uint64_t v71 = URL.absoluteString.getter();
      *(void *)&long long v138 = sub_10000A270(v71, v72, (uint64_t *)v140);
      uint64_t v23 = v126;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v73 = (void (*)(void, void))v130;
      v130((char *)v70, v22);
      os_log_type_t v74 = v68;
      v75 = v73;
      _os_log_impl((void *)&_mh_execute_header, v67, v74, "logoFileURL() The brand %s is using the URL scheme which is not supported. URL: %s", (uint8_t *)v69, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v75 = (void (*)(uint64_t, uint64_t))v130;
      v130((char *)v47, v22);
    }

    uint64_t v76 = (uint64_t)v125;
    uint64_t v77 = (uint64_t)v124;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v125, 1, 1, v22);
    sub_10000A21C();
    swift_allocError();
    *uint64_t v78 = 4;
    sub_100003DE4(v76, v77, &qword_1000222C8);
    os_log_type_t v80 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v77, 1, v22) != 1)
    {
      URL._bridgeToObjectiveC()(v79);
      os_log_type_t v80 = v81;
      v75(v77, v22);
    }
    uint64_t v82 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(const void *, void *, void, void *))a5 + 2))(a5, v80, 0, v82);

    swift_errorRelease();
    uint64_t v83 = v76;
    goto LABEL_20;
  }
  id v48 = [self currentConnection];
  if (v48)
  {
    v49 = v48;
    [v48 auditToken];
    long long v133 = v138;
    long long v126 = v139;

    v140[0] = v133;
    v140[1] = v126;
    uint64_t v50 = *(void **)&a4[OBJC_IVAR___BSBrandServiceImplementation_entitlementVerifier];
    char v141 = 0;
    if ([v50 auditToken:v140 hasEntitlement:BSBrandLogoEntitlement])
    {
      char v123 = a5;
      uint64_t v51 = (char *)a1;
      uint64_t v52 = sub_10000B218();
      uint64_t v54 = v53;
      uint64_t v55 = swift_allocObject();
      uint64_t v56 = v132;
      *(void *)&long long v133 = v55;
      *(void *)(v55 + 16) = sub_10000DC70;
      *(void *)(v55 + 24) = v56;
      uint64_t v57 = v22;
      v122 = a4;
      uint64_t v58 = *(void *)&a4[OBJC_IVAR___BSBrandServiceImplementation_cachedLogoDataSource];
      v125 = v51;
      *(void *)&long long v138 = v51;
      *((void *)&v138 + 1) = a2;
      uint64_t v136 = 0x3A7A69623A6E7275;
      unint64_t v137 = 0xE800000000000000;
      uint64_t v134 = 0;
      unint64_t v135 = 0xE000000000000000;
      sub_10000BC2C();
      swift_retain();
      StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
      uint64_t v59 = v121;
      URL.appendingPathComponent(_:isDirectory:)();
      swift_bridgeObjectRelease();
      v60 = v118;
      v124 = (char *)v52;
      *(void *)&long long v126 = v54;
      URL.appendingPathComponent(_:)();
      v61 = v59;
      v62 = v130;
      v130(v61, v57);
      v63 = *(void **)(v58 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
      URL.path.getter();
      NSString v64 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      LODWORD(v63) = [v63 fileExistsAtPath:v64];

      if (v63)
      {
        uint64_t v65 = (uint64_t)v119;
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v119, v60, v57);
        uint64_t v66 = 0;
      }
      else
      {
        v62(v60, v57);
        uint64_t v66 = 1;
        uint64_t v65 = (uint64_t)v119;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v65, v66, 1, v57);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v65, 1, v57) == 1)
      {
        sub_100003D38(v65, &qword_1000222C8);
        v92 = Logger.logObject.getter();
        os_log_type_t v93 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v92, v93))
        {
          uint64_t v94 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v94 = 0;
          _os_log_impl((void *)&_mh_execute_header, v92, v93, "Brand logo not found in cache. Will attempt to fetch from server.", v94, 2u);
          swift_slowDealloc();
        }

        uint64_t v95 = type metadata accessor for TaskPriority();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v120, 1, 1, v95);
        uint64_t v96 = v121;
        v128(v121, v131, v57);
        unint64_t v97 = (*(unsigned __int8 *)(v23 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
        uint64_t v98 = v23;
        unint64_t v99 = (v115 + v97 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v100 = (v99 + 23) & 0xFFFFFFFFFFFFFFF8;
        long long v101 = (char *)swift_allocObject();
        *((void *)v101 + 2) = 0;
        *((void *)v101 + 3) = 0;
        v102 = v122;
        uint64_t v103 = v125;
        *((void *)v101 + 4) = v122;
        *((void *)v101 + 5) = v103;
        *((void *)v101 + 6) = a2;
        (*(void (**)(char *, char *, uint64_t))(v98 + 32))(&v101[v97], v96, v57);
        v104 = &v101[v99];
        uint64_t v105 = v126;
        *(void *)v104 = v124;
        *((void *)v104 + 1) = v105;
        v106 = (uint64_t (**)(uint64_t))&v101[v100];
        uint64_t v108 = v132;
        v107 = (uint64_t (*)(uint64_t))v133;
        char *v106 = sub_10000E1A8;
        v106[1] = v107;
        uint64_t v109 = (void (**)(uint64_t, uint64_t, void *, void *))&v101[(v100 + 23) & 0xFFFFFFFFFFFFFFF8];
        *uint64_t v109 = sub_10000DC70;
        v109[1] = (void (*)(uint64_t, uint64_t, void *, void *))v108;
        swift_bridgeObjectRetain();
        swift_retain();
        v110 = v102;
        sub_100007880(v120, (uint64_t)&unk_1000223D0, (uint64_t)v101);
        swift_release();
        swift_release();
        uint64_t v111 = v123;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v112 = (uint64_t)v114;
        (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(v114, v65, v57);
        uint64_t v111 = v123;
        _Block_copy(v123);
        sub_10000C680(v112, (uint64_t)v111);
        _Block_release(v111);
        swift_release();
        v62((char *)v112, v57);
        swift_release();
      }
      v91 = v111;
      goto LABEL_28;
    }
    uint64_t v84 = (uint64_t)v117;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v117, 1, 1, v22);
    sub_10000B8EC();
    swift_allocError();
    *unint64_t v85 = 3;
    uint64_t v86 = v116;
    sub_100003DE4(v84, v116, &qword_1000222C8);
    v88 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v86, 1, v22) != 1)
    {
      URL._bridgeToObjectiveC()(v87);
      v88 = v89;
      v130((char *)v86, v22);
    }
    uint64_t v90 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(const void *, void *, void, void *))a5 + 2))(a5, v88, 0, v90);

    swift_errorRelease();
    uint64_t v83 = v84;
LABEL_20:
    sub_100003D38(v83, &qword_1000222C8);
    swift_release();
    v91 = a5;
LABEL_28:
    _Block_release(v91);
    return;
  }
  _Block_release(a5);
  _Block_release(a5);
  __break(1u);
}

uint64_t sub_10000DC38()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DC70(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  sub_100007B70(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_10000DC7C()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10000DDA8()
{
  _Block_release(*(const void **)(v0 + 56));

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000DE00()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  char v6 = *(unsigned char *)(v0 + 48);
  uint64_t v8 = *(const void **)(v0 + 56);
  uint64_t v7 = *(void **)(v0 + 64);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_10000E198;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char, const void *, void *))((char *)&dword_1000223D8
                                                                                               + dword_1000223D8);
  return v10(v2, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_10000DEE4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000DF24(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000C584;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000223F8 + dword_1000223F8);
  return v6(a1, v4);
}

uint64_t sub_10000DFDC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000E024()
{
  unint64_t result = qword_100022430;
  if (!qword_100022430)
  {
    sub_1000028B0(&qword_100022428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022430);
  }
  return result;
}

void *sub_10000E080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_10000ACC0((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000E118, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000E0EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000B894(a1, a2);
  }
  return a1;
}

uint64_t sub_10000E100(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000E118@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_10000AEC4(a1, a2);
}

uint64_t sub_10000E138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000E1B0()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___shardStore, (Class *)BCSShardItemPersistentStore_ptr);
}

id sub_10000E1C4()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___domainShardStore, (Class *)BCSDomainItemPersistentStore_ptr);
}

id sub_10000E1D8()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___itemCache, (Class *)BCSItemCache_ptr);
}

id sub_10000E1EC()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___userDefaults;
  long long v2 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___userDefaults);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___userDefaults);
  }
  else
  {
    id v4 = [self sharedDefaults];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    long long v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_10000E268()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___isInternalInstall;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___isInternalInstall);
  if (v2 != 2) {
    return v2 & 1;
  }
  uint64_t result = _BSIsInternalInstall();
  *(unsigned char *)(v0 + v1) = result;
  return result;
}

id sub_10000E2AC()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryOperationFactory, (Class *)BCSQueryOperationFactory_ptr);
}

id sub_10000E2C0()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cacheManager;
  int v2 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cacheManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cacheManager);
  }
  else
  {
    id v4 = sub_10000E1B0();
    id v5 = sub_10000E1C4();
    id v6 = sub_10000E1D8();
    id v7 = [objc_allocWithZone((Class)BCSCacheManager) initWithBloomFilterShardCache:v4 domainItemCache:v5 itemCache:v6];

    uint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    int v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_10000E370()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___measurementFactory, (Class *)BCSMeasurementFactory_ptr);
}

id sub_10000E384()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___metricFactory;
  int v2 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___metricFactory);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___metricFactory);
  }
  else
  {
    id v4 = sub_10000E370();
    id v5 = [objc_allocWithZone((Class)BCSMetricFactory) initWithMeasurementFactory:v4];

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    int v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_10000E414()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___bloomFilterExtractor, (Class *)BCSBloomFilterExtractor_ptr);
}

id sub_10000E428()
{
  return sub_10000E43C(&OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___operationGroupFactory, (Class *)BCSOperationGroupFactory_ptr);
}

id sub_10000E43C(uint64_t *a1, Class *a2)
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [objc_allocWithZone(*a2) init];
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

uint64_t sub_10000E4A8()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___chatSuggestShardServiceDomain;
  if (*(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___chatSuggestShardServiceDomain))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___chatSuggestShardServiceDomain);
  }
  else
  {
    type metadata accessor for ShardServiceDomain();
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(void *)(v2 + 16) = 1;
    swift_unknownObjectWeakAssign();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_10000E544()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessLinkShardServiceDomain;
  if (*(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessLinkShardServiceDomain))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessLinkShardServiceDomain);
  }
  else
  {
    type metadata accessor for ShardServiceDomain();
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(void *)(v2 + 16) = 2;
    swift_unknownObjectWeakAssign();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_10000E5E0()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessCallerShardServiceDomain;
  if (*(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessCallerShardServiceDomain))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessCallerShardServiceDomain);
  }
  else
  {
    type metadata accessor for ShardServiceDomain();
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(void *)(v2 + 16) = 3;
    swift_unknownObjectWeakAssign();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_10000E67C()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessEmailShardServiceDomain;
  if (*(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessEmailShardServiceDomain))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessEmailShardServiceDomain);
  }
  else
  {
    type metadata accessor for ShardServiceDomain();
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(void *)(v2 + 16) = 4;
    swift_unknownObjectWeakAssign();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_10000E718()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryController);
  id v2 = v1;
  if (v1 == (void *)1)
  {
    uint64_t v3 = v0;
    uint64_t v22 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryController;
    sub_10000E4A8();
    uint64_t v21 = (void *)sub_100014344();
    swift_release();
    sub_10000E544();
    uint64_t v20 = (void *)sub_100014344();
    swift_release();
    sub_10000E5E0();
    uint64_t v19 = (void *)sub_100014344();
    swift_release();
    sub_10000E67C();
    uint64_t v18 = (void *)sub_100014344();
    swift_release();
    id v4 = sub_10000E2C0();
    id v5 = sub_10000E2C0();
    sub_10000E4A8();
    uint64_t v6 = sub_1000141A8();
    swift_release();
    sub_10000E544();
    uint64_t v13 = (void *)sub_1000141A8();
    swift_release();
    sub_10000E5E0();
    uint64_t v14 = (void *)sub_1000141A8();
    swift_release();
    sub_10000E67C();
    uint64_t v15 = (void *)sub_1000141A8();
    swift_release();
    id v16 = sub_10000E1EC();
    id v17 = sub_10000E384();
    uint64_t v12 = v6;
    id v7 = (void *)v6;
    id v8 = v5;
    id v2 = [objc_allocWithZone((Class)BCSBusinessQueryController) initWithChatSuggestMegashardFetcher:v21 businessLinkMegashardFetcher:v20 businessCallerMegashardFetcher:v19 businessEmailMegashardFetcher:v18 shardCache:v4 cacheManager:v5 chatSuggestRemoteFetcher:v12 businessLinkRemoteFetcher:v13 businessCallerRemoteFetcher:v14 businessEmailRemoteFetcher:v15 userDefaults:v16 metricFactory:v17];

    id v9 = *(void **)(v3 + v22);
    *(void *)(v3 + v22) = v2;
    id v10 = v2;
    sub_100010240(v9);
  }
  sub_100010318(v1);
  return v2;
}

uint64_t sub_10000E94C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100002810((uint64_t *)&unk_100022640);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)v15 - v7;
  uint64_t v9 = v1 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessConnectAssetDataSource;
  swift_beginAccess();
  sub_1000102B0(v9, (uint64_t)v8);
  uint64_t v10 = type metadata accessor for BrandAssetNetworkFetcher();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_100010250((uint64_t)v8);
  uint64_t v12 = type metadata accessor for NetworkProvider();
  swift_allocObject();
  uint64_t v13 = NetworkProvider.init(customURLCache:waitsForConnectivity:)();
  v15[3] = v12;
  v15[4] = &protocol witness table for NetworkProvider;
  v15[0] = v13;
  BrandAssetNetworkFetcher.init(networkProvider:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_100003E48((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_10000EB54()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cachedLogoDataSource;
  if (*(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cachedLogoDataSource))
  {
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cachedLogoDataSource);
  }
  else
  {
    id v7 = [self sharedInstance];
    id v8 = [v7 brandLogoCacheURL];

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    type metadata accessor for BrandLogoPersistentStore();
    uint64_t v6 = swift_allocObject();
    uint64_t v9 = OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager;
    *(void *)(v6 + v9) = [self defaultManager];
    *(void *)(v6 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_maxNumberOfUnusedDays) = 0x403E000000000000;
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v6 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_cacheURL, v4, v1);
    *(void *)(v0 + v5) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

id sub_10000ED08()
{
  uint64_t v1 = OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___xpcListener;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___xpcListener);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___xpcListener);
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v4 = objc_allocWithZone((Class)NSXPCListener);
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = [v4 initWithMachServiceName:v5];

    [v6 setDelegate:v0];
    id v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_10000EDDC()
{
  uint64_t v1 = v0;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100003850(v2, (uint64_t)qword_100023050);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    NSString v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting businessservicesd daemon", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = OBJC_IVAR____TtC17businessservicesd6Daemon_sandboxInitialized;
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC17businessservicesd6Daemon_sandboxInitialized) != 1)
  {
    (*(void (**)(void))((swift_isaMask & *v1) + 0x338))();
    *((unsigned char *)v1 + v6) = 1;
  }
  (*(void (**)(void))((swift_isaMask & *v1) + 0x310))();
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Listening for incoming connections", v9, 2u);
    swift_slowDealloc();
  }

  id v10 = sub_10000ED08();
  [v10 resume];

  id v11 = [self mainRunLoop];
  [v11 run];

  oslog = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Daemon exiting", v13, 2u);
    swift_slowDealloc();
  }
}

id sub_10000F0AC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for iOSDaemon()) init];
  qword_100023040 = (uint64_t)result;
  return result;
}

uint64_t sub_10000F0E4(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (__CocoaSet.count.getter()) {
      goto LABEL_3;
    }
LABEL_6:
    id v3 = &_swiftEmptySetSingleton;
    if (v2) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v30 = v1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v1 + 56);
    swift_bridgeObjectRetain();
    uint64_t result = swift_retain();
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  sub_100002810(&qword_100022638);
  id v3 = (void *)static _SetStorage.allocate(capacity:)();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  __CocoaSet.makeIterator()();
  sub_100003C40(0, &qword_1000225C0);
  sub_100010178();
  uint64_t result = Set.Iterator.init(_cocoa:)();
  uint64_t v1 = v34;
  uint64_t v30 = v35;
  uint64_t v5 = v36;
  uint64_t v6 = v37;
  unint64_t v7 = v38;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  id v11 = (char *)(v3 + 7);
  while (v1 < 0)
  {
    uint64_t v16 = __CocoaSet.Iterator.next()();
    if (!v16) {
      goto LABEL_45;
    }
    *(void *)&long long v31 = v16;
    sub_100003C40(0, &qword_1000225C0);
    swift_dynamicCast();
LABEL_36:
    sub_100003C40(0, &qword_1000225C0);
    swift_dynamicCast();
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v22 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)&v11[8 * (v23 >> 6)]) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)&v11[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)&v11[8 * v24];
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)&v11[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
    uint64_t v13 = v3[6] + 40 * v12;
    *(_OWORD *)uint64_t v13 = v31;
    *(_OWORD *)(v13 + 16) = v32;
    *(void *)(v13 + 32) = v33;
    ++v3[2];
  }
  if (v7)
  {
    unint64_t v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_35:
    id v21 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    goto LABEL_36;
  }
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v29) {
      goto LABEL_45;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    uint64_t v19 = v6 + 1;
    if (!v18)
    {
      uint64_t v19 = v6 + 2;
      if (v6 + 2 >= v29) {
        goto LABEL_45;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v19);
      if (!v18)
      {
        uint64_t v19 = v6 + 3;
        if (v6 + 3 >= v29) {
          goto LABEL_45;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v19);
        if (!v18)
        {
          uint64_t v19 = v6 + 4;
          if (v6 + 4 >= v29) {
            goto LABEL_45;
          }
          unint64_t v18 = *(void *)(v30 + 8 * v19);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            if (v6 + 5 >= v29) {
              goto LABEL_45;
            }
            unint64_t v18 = *(void *)(v30 + 8 * v19);
            if (!v18)
            {
              uint64_t v20 = v6 + 6;
              while (v29 != v20)
              {
                unint64_t v18 = *(void *)(v30 + 8 * v20++);
                if (v18)
                {
                  uint64_t v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_100010238();
              return (uint64_t)v3;
            }
          }
        }
      }
    }
LABEL_34:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v19 << 6);
    uint64_t v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

void sub_10000F50C(void *a1)
{
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100003850(v2, (uint64_t)qword_100023050);
  id v8 = a1;
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v6 = v8;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Connection invalidated: %@", v5, 0xCu);
    sub_100002810(&qword_100022630);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10000F6D8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000F77C()
{
}

id sub_10000F7D8()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC17businessservicesd6Daemon_bundleId];
  void *v1 = 0xD00000000000001BLL;
  v1[1] = 0x8000000100016AF0;
  v0[OBJC_IVAR____TtC17businessservicesd6Daemon_sandboxInitialized] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___shardStore] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___domainShardStore] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___itemCache] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___userDefaults] = 0;
  v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___isInternalInstall] = 2;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryOperationFactory] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cacheManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___measurementFactory] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___metricFactory] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___bloomFilterExtractor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___operationGroupFactory] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___chatSuggestShardServiceDomain] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessLinkShardServiceDomain] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessCallerShardServiceDomain] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessEmailShardServiceDomain] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryController] = 1;
  uint64_t v2 = &v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessConnectAssetDataSource];
  uint64_t v3 = type metadata accessor for BrandAssetNetworkFetcher();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cachedLogoDataSource] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon_XPCServer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___xpcListener] = 0;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for Daemon();
  return objc_msgSendSuper2(&v5, "init");
}

id sub_10000F9A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Daemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  if (qword_100021DE0 != -1) {
    swift_once();
  }
  sub_10000EDDC();
  return 0;
}

uint64_t sub_10000FBAC()
{
  return type metadata accessor for Daemon();
}

uint64_t type metadata accessor for Daemon()
{
  uint64_t result = qword_100022580;
  if (!qword_100022580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000FC00()
{
  sub_1000037F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10000FCDC(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100021DE8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100003850(v4, (uint64_t)qword_100023050);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    v28[0] = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Incoming XPC connection: %@", v8, 0xCu);
    sub_100002810(&qword_100022630);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100002810(&qword_100022258);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100017960;
  uint64_t v12 = sub_100003C40(0, &qword_1000225A0);
  *(void *)(v11 + 56) = sub_100002810(&qword_1000225A8);
  *(void *)(v11 + 32) = v12;
  uint64_t v13 = sub_100003C40(0, &qword_1000225B0);
  *(void *)(v11 + 88) = sub_100002810(&qword_1000225B8);
  *(void *)(v11 + 64) = v13;
  id v14 = objc_allocWithZone((Class)NSSet);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithArray:isa];

  sub_100003C40(0, &qword_1000225C0);
  sub_100010178();
  uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v18 = self;
  id v19 = [v18 interfaceWithProtocol:&OBJC_PROTOCOL____TtP17businessservicesd24XPCDaemonServerInterface_];
  [v5 setExportedInterface:v19];

  id v20 = [v5 exportedInterface];
  if (v20)
  {
    id v21 = v20;
    sub_10000F0E4(v17);
    swift_bridgeObjectRelease();
    Class v22 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v21 setClasses:v22 forSelector:"fetchBusinessMetadataForEmails:forClientBundleID:requestId:completion:" argumentIndex:0 ofReply:0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v5, "setExportedObject:", *(void *)(v2 + OBJC_IVAR____TtC17businessservicesd6Daemon_XPCServer), v28[0]);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v5;
  v28[4] = sub_100010218;
  v28[5] = v23;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 1107296256;
  v28[2] = sub_10000F6D8;
  v28[3] = &unk_10001D048;
  unint64_t v24 = _Block_copy(v28);
  id v25 = v5;
  swift_release();
  [v25 setInvalidationHandler:v24];
  _Block_release(v24);
  id v26 = [v18 interfaceWithProtocol:&OBJC_PROTOCOL___BCSXPCDaemonBusinessEmailClientInterface];
  [v25 setRemoteObjectInterface:v26];

  [v25 resume];
  return 1;
}

unint64_t sub_100010178()
{
  unint64_t result = qword_1000225C8;
  if (!qword_1000225C8)
  {
    sub_100003C40(255, &qword_1000225C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000225C8);
  }
  return result;
}

uint64_t sub_1000101E0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100010218()
{
  sub_10000F50C(*(void **)(v0 + 16));
}

uint64_t sub_100010220(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010230()
{
  return swift_release();
}

uint64_t sub_100010238()
{
  return swift_release();
}

void sub_100010240(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_100010250(uint64_t a1)
{
  uint64_t v2 = sub_100002810((uint64_t *)&unk_100022640);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000102B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002810((uint64_t *)&unk_100022640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_100010318(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_100010328()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001039C(v0, qword_100023050);
  sub_100003850(v0, (uint64_t)qword_100023050);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_10001039C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_100010400(uint64_t a1)
{
  sub_1000106D8(0, 2, 0);
  unint64_t v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 3)
  {
    unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v3 = (void *)0xED00006C69616D65;
    uint64_t v4 = 0x7373656E69737562;
    uint64_t v5 = 0x7373656E69737562;
    uint64_t v6 = (void *)0xED00006C69616D65;
    if (v2 < 3)
    {
      uint64_t v5 = *(void *)&aChatsuggbusine[8 * v2];
      uint64_t v6 = *(void **)&aChatsuggbusine[8 * v2 + 24];
    }
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = v5;
    v7._object = v6;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v8._countAndFlagsBits = 0xD000000000000022;
    v8._object = &off_100016080;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v10 = _swiftEmptyArrayStorage[2];
    unint64_t v9 = _swiftEmptyArrayStorage[3];
    if (v10 >= v9 >> 1) {
      sub_1000106D8(v9 > 1, v10 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v10 + 1;
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage[2 * v10];
    *((void *)v11 + 4) = 0xD00000000000001CLL;
    *((void *)v11 + 5) = 0x8000000100016B20;
    if (v2 <= 2)
    {
      uint64_t v4 = *(void *)&aChatsuggbusine[8 * v2];
      uint64_t v3 = *(void **)&aChatsuggbusine[8 * v2 + 24];
    }
    swift_bridgeObjectRetain();
    v12._countAndFlagsBits = v4;
    v12._object = v3;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v13._countAndFlagsBits = 0xD000000000000013;
    v13._object = "arOrWifi.megashard";
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v15 = _swiftEmptyArrayStorage[2];
    unint64_t v14 = _swiftEmptyArrayStorage[3];
    if (v15 >= v14 >> 1) {
      sub_1000106D8(v14 > 1, v15 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v15 + 1;
    id v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
    *((void *)v16 + 4) = 0xD00000000000001CLL;
    *((void *)v16 + 5) = 0x8000000100016B20;
    swift_arrayDestroy();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1000106D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000106F8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000106F8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002810(&qword_100022650);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  Swift::String v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100010864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v37 - v11;
  uint64_t v37 = a1;
  v43[0] = a1;
  v43[1] = a2;
  unint64_t v44 = a2;
  uint64_t v41 = 0x3A7A69623A6E7275;
  unint64_t v42 = 0xE800000000000000;
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_10000BC2C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:)();
  Swift::String v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v10, v6);
  URL.path.getter();
  v13(v12, v6);
  unint64_t v14 = *(void **)(v3 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [v14 fileExistsAtPath:v15];

  if (!v16)
  {
    swift_bridgeObjectRelease();
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100003850(v22, (uint64_t)qword_100023050);
    unint64_t v23 = v44;
    swift_bridgeObjectRetain_n();
    unint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      id v16 = (void *)swift_slowAlloc();
      v43[0] = (uint64_t)v16;
      *(_DWORD *)id v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_10000A270(v37, v23, v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "No cached item found for brand URI: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_11;
  }
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v14 contentsAtPath:v17];

  if (!v18)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    sub_10000B8EC();
    swift_allocError();
    unsigned char *v27 = 1;
    swift_willThrow();
    return v16;
  }
  id v16 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  uint64_t v21 = v38;
  sub_100012D34();
  if (v21)
  {
    sub_10000B894((uint64_t)v16, v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100003850(v29, (uint64_t)qword_100023050);
    sub_10000B83C((uint64_t)v16, v20);
    swift_bridgeObjectRetain();
    sub_10000B83C((uint64_t)v16, v20);
    swift_bridgeObjectRetain();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v43[0] = v38;
      *(_DWORD *)uint64_t v32 = 134218242;
      switch(v20 >> 62)
      {
        case 1uLL:
          sub_10000B894((uint64_t)v16, v20);
          LODWORD(v33) = HIDWORD(v16) - v16;
          if (__OFSUB__(HIDWORD(v16), v16))
          {
            __break(1u);
            JUMPOUT(0x100010F10);
          }
          uint64_t v33 = (int)v33;
          break;
        case 2uLL:
          uint64_t v35 = v16[2];
          uint64_t v34 = v16[3];
          sub_10000B894((uint64_t)v16, v20);
          uint64_t v33 = v34 - v35;
          if (__OFSUB__(v34, v35))
          {
            __break(1u);
            goto LABEL_24;
          }
          break;
        case 3uLL:
LABEL_24:
          sub_10000B894((uint64_t)v16, v20);
          uint64_t v33 = 0;
          break;
        default:
          sub_10000B894((uint64_t)v16, v20);
          uint64_t v33 = BYTE6(v20);
          break;
      }
      uint64_t v41 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10000B894((uint64_t)v16, v20);
      *(_WORD *)(v32 + 12) = 2080;
      unint64_t v36 = v44;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_10000A270(v37, v36, v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Found cached item of size %ld for brand URI: %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000B894((uint64_t)v16, v20);
      sub_10000B894((uint64_t)v16, v20);

      swift_bridgeObjectRelease_n();
    }
  }
  return v16;
}

uint64_t sub_100010F20@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void (*a5)(char *, uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v51 = a4;
  uint64_t v8 = v7;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v50 = a3;
  uint64_t v46 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v45 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v43 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for DispatchQoS();
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  v49 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for DispatchTime();
  uint64_t v53 = *(void *)(v48 - 8);
  uint64_t v14 = __chkstk_darwin(v48);
  uint64_t v41 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  long long v47 = (char *)&v40 - v16;
  uint64_t v17 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v40 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = a1;
  uint64_t v57 = a2;
  uint64_t v64 = 0x3A7A69623A6E7275;
  unint64_t v65 = 0xE800000000000000;
  uint64_t v62 = 0;
  unint64_t v63 = 0xE000000000000000;
  sub_10000BC2C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:)();
  uint64_t v55 = v8;
  unint64_t v24 = *(void **)(v8 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  id v26 = v25;
  aBlock = 0;
  LODWORD(v24) = [v24 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&aBlock];

  if (v24)
  {
    BOOL v27 = aBlock;
    uint64_t v28 = v52;
    Data.write(to:options:)();
    if (!v28)
    {
      sub_1000027D0();
      uint64_t v29 = v40;
      (*(void (**)(char *, void, uint64_t))(v40 + 104))(v19, enum case for DispatchQoS.QoSClass.background(_:), v17);
      uint64_t v52 = static OS_dispatch_queue.global(qos:)();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v17);
      uint64_t v30 = v41;
      static DispatchTime.now()();
      + infix(_:_:)();
      os_log_type_t v31 = *(void (**)(char *, uint64_t))(v53 + 8);
      v53 += 8;
      uint64_t v54 = v31;
      v31(v30, v48);
      v60 = sub_100013E54;
      uint64_t v61 = v55;
      aBlock = _NSConcreteStackBlock;
      uint64_t v57 = 1107296256;
      uint64_t v58 = sub_10000F6D8;
      uint64_t v59 = &unk_10001D128;
      uint64_t v51 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v64 = (uint64_t)_swiftEmptyArrayStorage;
      sub_100013E74(&qword_1000227A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100002810(&qword_1000227B0);
      sub_100013EBC();
      uint64_t v32 = v43;
      uint64_t v33 = v46;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      uint64_t v34 = v47;
      unint64_t v36 = v51;
      uint64_t v35 = (void *)v52;
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v36);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v33);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v49, v44);
      v54(v34, v48);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      return swift_release();
    }
  }
  else
  {
    uint64_t v38 = aBlock;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v39(a7, v20);
  return ((uint64_t (*)(char *, uint64_t))v39)(v23, v20);
}

void sub_1000115E4()
{
}

uint64_t sub_1000117E0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = a1;
  v26[1] = a2;
  v25[3] = 0x3A7A69623A6E7275;
  v25[4] = 0xE800000000000000;
  v25[1] = 0;
  v25[2] = 0xE000000000000000;
  sub_10000BC2C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void **)(v3 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  URL.path.getter();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LODWORD(a2) = [v10 fileExistsAtPath:v11];

  if (a2)
  {
    URL._bridgeToObjectiveC()(v12);
    uint64_t v14 = v13;
    v26[0] = 0;
    unsigned __int8 v15 = [v10 removeItemAtURL:v13 error:v26];

    if (v15)
    {
      uint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
      id v17 = v26[0];
      return v16(v9, v6);
    }
    id v24 = v26[0];
    _convertNSErrorToError(_:)();
  }
  else
  {
    if (qword_100021DE8 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100003850(v19, (uint64_t)qword_100023050);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Trying to remove an item that does not exist", v22, 2u);
      swift_slowDealloc();
    }

    sub_10000B8EC();
    swift_allocError();
    *unint64_t v23 = 1;
  }
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100011B10()
{
  uint64_t v1 = sub_100002810(&qword_1000227A0);
  __chkstk_darwin(v1 - 8);
  uint64_t v83 = (char *)v69 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  os_log_type_t v93 = *(void (**)(void))(v3 - 8);
  uint64_t v94 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v69 - v7;
  uint64_t v9 = sub_100002810(&qword_1000222C8);
  __chkstk_darwin(v9 - 8);
  NSString v11 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)v69 - v18;
  __chkstk_darwin(v17);
  os_log_type_t v21 = (char *)v69 - v20;
  uint64_t v22 = v95;
  sub_100012854();
  if (!v22)
  {
    uint64_t v95 = 0;
    v91 = v11;
    v92 = v8;
    uint64_t v84 = v16;
    uint64_t v78 = v6;
    uint64_t v79 = v12;
    id v24 = v93;
    uint64_t v25 = *(void *)(v23 + 16);
    if (!v25)
    {
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v77 = v0;
    uint64_t v26 = v23;
    Date.init()();
    uint64_t v82 = v19;
    v70 = v21;
    Date.addingTimeInterval(_:)();
    uint64_t v28 = (void (*)(void))*((void *)v24 + 2);
    BOOL v27 = (char *)v24 + 16;
    os_log_type_t v93 = v28;
    uint64_t v76 = OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager;
    unint64_t v29 = (v27[64] + 32) & ~(unint64_t)v27[64];
    v69[1] = v26;
    uint64_t v30 = v26 + v29;
    uint64_t v31 = *((void *)v27 + 7);
    v88 = (unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 32);
    v89 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 40);
    v87 = (void (**)(char *, char *, uint64_t))(v27 + 16);
    uint64_t v85 = v31;
    uint64_t v86 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    os_log_type_t v80 = (void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    v81 = (void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v90 = (void (**)(char *, uint64_t))(v27 - 8);
    *(void *)&long long v32 = 136315138;
    long long v72 = v32;
    uint64_t v71 = (char *)&type metadata for Any + 8;
    uint64_t v33 = v79;
    uint64_t v34 = (uint64_t)v83;
    uint64_t v35 = v91;
    unint64_t v36 = v92;
    uint64_t v37 = v94;
    while (1)
    {
      uint64_t v38 = v33;
      uint64_t v39 = v35;
      v93();
      uint64_t v40 = *v89;
      (*v89)(v39, 0, 1, v37);
      if ((*v88)(v39, 1, v37) == 1) {
        break;
      }
      (*v87)(v36, v39, v37);
      URL.path.getter();
      uint64_t v41 = v95;
      sub_1000123EC(v34);
      uint64_t v95 = v41;
      if (v41)
      {
        swift_bridgeObjectRelease();
        (*v90)(v92, v94);
        swift_bridgeObjectRelease();
        uint64_t v64 = *v81;
        (*v81)(v82, v38);
        v64(v70, v38);
        return;
      }
      swift_bridgeObjectRelease();
      uint64_t v33 = v38;
      if ((*v86)(v34, 1, v38) == 1)
      {
        unint64_t v36 = v92;
        uint64_t v37 = v94;
        (*v90)(v92, v94);
        sub_100003D38(v34, &qword_1000227A0);
      }
      else
      {
        uint64_t v42 = v84;
        (*v80)(v84, v34, v38);
        char v43 = static Date.< infix(_:_:)();
        unint64_t v36 = v92;
        if (v43)
        {
          uint64_t v44 = *(Class *)((char *)&v77->super.isa + v76);
          URL._bridgeToObjectiveC()(v77);
          uint64_t v46 = v45;
          id v96 = 0;
          LODWORD(v44) = [v44 removeItemAtURL:v45 error:&v96];

          if (!v44)
          {
            id v66 = v96;
            swift_bridgeObjectRelease();
            _convertNSErrorToError(_:)();

            swift_willThrow();
            uint64_t v67 = *v81;
            uint64_t v68 = v79;
            (*v81)(v84, v79);
            (*v90)(v36, v94);
            v67(v82, v68);
            v67(v70, v68);
            return;
          }
          uint64_t v47 = qword_100021DE8;
          id v48 = v96;
          if (v47 != -1) {
            swift_once();
          }
          uint64_t v49 = type metadata accessor for Logger();
          sub_100003850(v49, (uint64_t)qword_100023050);
          uint64_t v50 = v78;
          uint64_t v51 = v94;
          ((void (*)(char *, char *, uint64_t))v93)(v78, v36, v94);
          uint64_t v52 = Logger.logObject.getter();
          os_log_type_t v53 = static os_log_type_t.debug.getter();
          int v54 = v53;
          if (os_log_type_enabled(v52, v53))
          {
            uint64_t v55 = swift_slowAlloc();
            int v75 = v54;
            uint64_t v56 = v55;
            os_log_type_t v74 = (void *)swift_slowAlloc();
            id v96 = v74;
            *(_DWORD *)uint64_t v56 = v72;
            os_log_t v73 = v52;
            uint64_t v57 = URL.lastPathComponent.getter();
            *(void *)(v56 + 4) = sub_10000A270(v57, v58, (uint64_t *)&v96);
            swift_bridgeObjectRelease();
            uint64_t v59 = *v90;
            (*v90)(v50, v51);
            v60 = v59;
            os_log_t v61 = v73;
            _os_log_impl((void *)&_mh_execute_header, v73, (os_log_type_t)v75, "Deleted unused logo: %s", (uint8_t *)v56, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v33 = v79;
            (*v81)(v84, v79);
            uint64_t v37 = v94;
            v60(v36, v94);
            uint64_t v34 = (uint64_t)v83;
          }
          else
          {

            uint64_t v62 = *v90;
            (*v90)(v50, v51);
            uint64_t v63 = v79;
            (*v81)(v84, v79);
            v62(v36, v51);
            uint64_t v33 = v63;
            uint64_t v34 = (uint64_t)v83;
            uint64_t v37 = v51;
          }
        }
        else
        {
          (*v81)(v42, v38);
          uint64_t v37 = v94;
          (*v90)(v36, v94);
        }
      }
      v30 += v85;
      --v25;
      uint64_t v35 = v91;
      if (!v25)
      {
        v40(v91, 1, 1, v37);
        goto LABEL_21;
      }
    }
    uint64_t v33 = v38;
LABEL_21:
    swift_bridgeObjectRelease();
    unint64_t v65 = *v81;
    (*v81)(v82, v33);
    v65(v70, v33);
  }
}

uint64_t sub_1000123EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_100002810(&qword_1000227A0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(fileURLWithPath:)();
  id v8 = [self defaultManager];
  URL.path.getter();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)&long long v26 = 0;
  id v10 = [v8 attributesOfItemAtPath:v9 error:&v26];

  NSString v11 = (void *)v26;
  if (!v10)
  {
    id v17 = (id)v26;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  type metadata accessor for FileAttributeKey(0);
  sub_100013E74(&qword_100021EA0, type metadata accessor for FileAttributeKey);
  uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = v11;

  if (*(void *)(v12 + 16))
  {
    uint64_t v14 = NSFileModificationDate;
    unint64_t v15 = sub_1000137E0((uint64_t)v14);
    if (v16)
    {
      sub_10000E138(*(void *)(v12 + 56) + 32 * v15, (uint64_t)&v26);
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!*((void *)&v27 + 1))
  {
    sub_100003D38((uint64_t)&v26, &qword_1000222B0);
    uint64_t v19 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v3, 1, 1, v19);
LABEL_13:
    sub_100003D38((uint64_t)v3, &qword_1000227A0);
    type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v25, 1, 1, v19);
  }
  uint64_t v19 = type metadata accessor for Date();
  int v20 = swift_dynamicCast();
  uint64_t v21 = *(void *)(v19 - 8);
  uint64_t v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
  v22(v3, v20 ^ 1u, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v3, 1, v19) == 1) {
    goto LABEL_13;
  }
  uint64_t v23 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v25, v3, v19);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v22)(v23, 0, 1, v19);
}

void sub_100012854()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  unint64_t v36 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v34 - v5;
  uint64_t v7 = sub_100002810(&qword_1000222C8);
  __chkstk_darwin(v7 - 8);
  NSString v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [self defaultManager];
  uint64_t v47 = _swiftEmptyArrayStorage;
  URL._bridgeToObjectiveC()((NSURL *)_swiftEmptyArrayStorage);
  uint64_t v12 = v11;
  id v46 = 0;
  id v13 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:4 error:&v46];

  id v14 = v46;
  if (v13)
  {
    id v41 = v10;
    uint64_t v37 = v0;
    uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v16 = v14;

    uint64_t v17 = *(void *)(v15 + 16);
    uint64_t v34[2] = v15;
    if (v17)
    {
      uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
      uint64_t v18 = v2 + 16;
      unint64_t v35 = (*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64);
      unint64_t v20 = v15 + v35;
      uint64_t v42 = *(void *)(v18 + 56);
      uint64_t v43 = v18;
      uint64_t v44 = (void (**)(char *, char *, uint64_t))(v18 + 16);
      uint64_t v45 = v19;
      uint64_t v38 = (void (**)(char *, uint64_t))(v18 - 8);
      uint64_t v39 = (unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 32);
      uint64_t v40 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 40);
      v34[1] = (v18 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      v19(v9, v15 + v35, v1);
      while (1)
      {
        uint64_t v21 = *v40;
        (*v40)(v9, 0, 1, v1);
        if ((*v39)(v9, 1, v1) == 1) {
          goto LABEL_21;
        }
        uint64_t v22 = *v44;
        (*v44)(v6, v9, v1);
        LOBYTE(v46) = 0;
        uint64_t v23 = v6;
        URL.path.getter();
        NSString v24 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        unsigned int v25 = [v41 fileExistsAtPath:v24 isDirectory:&v46];

        if (!v25) {
          goto LABEL_5;
        }
        if (v46 != 1) {
          break;
        }
        uint64_t v6 = v23;
        uint64_t v26 = v37;
        uint64_t v27 = sub_100012854(v23);
        uint64_t v37 = v26;
        if (v26)
        {

          (*v38)(v23, v1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return;
        }
        sub_100013A64(v27);
LABEL_6:
        (*v38)(v6, v1);
        v20 += v42;
        if (!--v17)
        {
          v21(v9, 1, 1, v1);
          goto LABEL_21;
        }
        v45(v9, v20, v1);
      }
      v45(v36, (unint64_t)v23, v1);
      unint64_t v28 = (unint64_t)v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v28 = sub_100013578(0, *(void *)(v28 + 16) + 1, 1, v28);
      }
      unint64_t v30 = *(void *)(v28 + 16);
      unint64_t v29 = *(void *)(v28 + 24);
      unint64_t v31 = v30 + 1;
      if (v30 >= v29 >> 1)
      {
        v34[0] = v30 + 1;
        uint64_t v32 = sub_100013578(v29 > 1, v30 + 1, 1, v28);
        unint64_t v31 = v34[0];
        unint64_t v28 = v32;
      }
      *(void *)(v28 + 16) = v31;
      v22((char *)(v28 + v35 + v30 * v42), v36, v1);
      uint64_t v47 = (void *)v28;
LABEL_5:
      uint64_t v6 = v23;
      goto LABEL_6;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v9, 1, 1, v1);
LABEL_21:

    swift_bridgeObjectRelease();
  }
  else
  {
    id v33 = v46;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t sub_100012D34()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_fileManager);
  sub_100002810(&qword_100022780);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000179F0;
  *(void *)(inited + 32) = NSFileModificationDate;
  *(void *)(inited + 64) = v1;
  uint64_t v7 = sub_100003888((uint64_t *)(inited + 40));
  (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v7, v4, v1);
  uint64_t v8 = NSFileModificationDate;
  sub_100012FB0(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_100013E74(&qword_100021EA0, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  id v17 = 0;
  unsigned __int8 v11 = [v5 setAttributes:isa ofItemAtPath:v10 error:&v17];

  if (v11)
  {
    uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
    id v13 = v17;
    return v12(v4, v1);
  }
  else
  {
    id v15 = v17;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

unint64_t sub_100012FB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002810(&qword_100022788);
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
    sub_100013874(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1000137E0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000138DC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
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

uint64_t sub_1000130CC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17businessservicesd24BrandLogoPersistentStore_cacheURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10001317C()
{
  return type metadata accessor for BrandLogoPersistentStore();
}

uint64_t type metadata accessor for BrandLogoPersistentStore()
{
  uint64_t result = qword_100022698;
  if (!qword_100022698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000131D0()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BrandLogoFetchError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BrandLogoFetchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1000133D8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandLogoFetchError()
{
  return &type metadata for BrandLogoFetchError;
}

unint64_t sub_100013414()
{
  unint64_t result = qword_100022778;
  if (!qword_100022778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022778);
  }
  return result;
}

void *sub_100013468(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100002810(&qword_100022650);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100013C08(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013578(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002810(&qword_100022798);
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100013CFC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_1000137E0(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_1000138EC(a1, v2);
}

uint64_t sub_100013874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002810(&qword_100022790);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000138DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1000138EC(uint64_t a1, uint64_t a2)
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

uint64_t sub_100013A64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_100013578(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100013C08(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100013CFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for URL() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100013E54()
{
}

uint64_t sub_100013E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013E6C()
{
  return swift_release();
}

uint64_t sub_100013E74(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100013EBC()
{
  unint64_t result = qword_1000227B8;
  if (!qword_1000227B8)
  {
    sub_1000028B0(&qword_1000227B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000227B8);
  }
  return result;
}

uint64_t sub_100013F18()
{
  unint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
LABEL_6:
    id v11 = v1;
    return (uint64_t)v2;
  }
  uint64_t v3 = v0;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v5 = (void *)result;
    id v6 = sub_10000E1EC();

    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      uint64_t v7 = (void *)result;
      char v8 = sub_10000E268();

      id v9 = [objc_allocWithZone((Class)BCSICloudServerEnvironment) initWithUserDefaults:v6 isInternalInstall:v8 & 1 type:*(void *)(v3 + 16)];
      uint64_t v10 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = v9;
      id v2 = v9;

      unint64_t v1 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100013FE4()
{
  unint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = *(id *)(v0 + 40);
  }
  else
  {
    uint64_t v3 = self;
    uint64_t v4 = (void *)sub_100013F18();
    id v5 = [v4 containerID];

    id v6 = (void *)sub_100013F18();
    id v7 = [v6 containerEnvironment];

    id v8 = [v3 containerIDForContainerIdentifier:v5 environment:v7];
    id v9 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v8;
    id v2 = v8;

    unint64_t v1 = 0;
  }
  id v10 = v1;
  return v2;
}

id sub_1000140B8()
{
  unint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = *(id *)(v0 + 48);
  }
  else
  {
    id v3 = sub_100013FE4();
    id v4 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v3];

    id v5 = *(void **)(v0 + 48);
    *(void *)(v0 + 48) = v4;
    id v2 = v4;

    unint64_t v1 = 0;
  }
  id v6 = v1;
  return v2;
}

id sub_100014138()
{
  unint64_t v1 = *(void **)(v0 + 56);
  if (v1)
  {
    id v2 = *(id *)(v0 + 56);
  }
  else
  {
    id v3 = [objc_allocWithZone((Class)BCSCoalesceHelper) initWithQOSClass:25];
    id v4 = *(void **)(v0 + 56);
    *(void *)(v0 + 56) = v3;
    id v2 = v3;

    unint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t sub_1000141A8()
{
  unint64_t v1 = *(void **)(v0 + 64);
  if (v1)
  {
    id v2 = *(id *)(v0 + 64);
LABEL_8:
    id v20 = v1;
    return (uint64_t)v2;
  }
  uint64_t v3 = v0;
  id v4 = (void *)sub_100013F18();
  id v5 = sub_1000140B8();
  id v6 = [v5 publicCloudDatabase];

  id v7 = sub_1000140B8();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v9 = (void *)result;
  id v10 = sub_10000E2AC();

  id v11 = sub_100014138();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v12 = (void *)result;
  id v13 = sub_10000E414();

  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v14 = (void *)result;
  id v15 = sub_10000E428();

  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    unint64_t v16 = (void *)result;
    id v17 = sub_10000E384();

    id v18 = [objc_allocWithZone((Class)BCSRemoteFetchCloudKit) initWithEnvironment:v4 database:v6 databaseContainer:v7 queryOperationFactory:v10 coalesceHelper:v11 bloomFilterExtractor:v13 operationGroupFactory:v15 metricFactory:v17];
    uint64_t v19 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v18;
    id v2 = v18;

    unint64_t v1 = 0;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100014344()
{
  unint64_t v1 = *(void **)(v0 + 72);
  if (v1)
  {
    id v2 = *(id *)(v0 + 72);
LABEL_10:
    id v25 = v1;
    return (uint64_t)v2;
  }
  uint64_t v3 = v0;
  unint64_t v4 = *(void *)(v0 + 16) - 1;
  if (v4 < 4)
  {
    uint64_t v5 = qword_100017D18[v4];
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v7 = (void *)Strong;
      id v8 = sub_10000E2C0();

      uint64_t v9 = swift_unknownObjectWeakLoadStrong();
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = sub_10000E2C0();

        uint64_t v12 = swift_unknownObjectWeakLoadStrong();
        if (v12)
        {
          id v13 = (void *)v12;
          id v14 = sub_10000E2C0();

          id v15 = (void *)sub_1000141A8();
          unint64_t v16 = (void *)sub_1000141A8();
          uint64_t v17 = swift_unknownObjectWeakLoadStrong();
          if (v17)
          {
            id v18 = (void *)v17;
            id v19 = sub_10000E1EC();

            uint64_t v20 = swift_unknownObjectWeakLoadStrong();
            if (v20)
            {
              uint64_t v21 = (void *)v20;
              id v22 = sub_10000E384();

              id v23 = [objc_allocWithZone((Class)BCSMegashardFetcher) initWithShardType:v5 configCache:v8 shardCache:v11 shardCacheSkipper:v14 shardInstantiator:v15 megashardRemoteFetcher:v16 userDefaults:v19 metricFactory:v22];
              NSString v24 = *(void **)(v3 + 72);
              *(void *)(v3 + 72) = v23;
              id v2 = v23;

              unint64_t v1 = 0;
              goto LABEL_10;
            }
            goto LABEL_15;
          }
LABEL_14:
          __break(1u);
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
LABEL_16:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100014534()
{
  unint64_t v1 = sub_100010400(*(void *)(v0 + 16));
  uint64_t v2 = v1[2];
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v1 + 5;
    while (1)
    {
      swift_bridgeObjectRetain();
      unint64_t v4 = (void *)sub_100014344();
      id v5 = objc_allocWithZone((Class)BCSXPCLaunchEventPrefetchTrigger);
      swift_bridgeObjectRetain();
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v7 = [v5 initWithActivityName:v6];

      if (!v7) {
        break;
      }
      v3 += 2;
      [v4 addFetchTrigger:v7];
      swift_bridgeObjectRelease();

      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100014654()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ShardServiceDomain()
{
  return self;
}

void sub_100014B70(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [v3 eligibleToRun];
  id v5 = ABSLogCommon();
  NSString v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) activityName];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduled background task started for %@", buf, 0xCu);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100014D80;
    v15[3] = &unk_10001D158;
    v15[4] = *(void *)(a1 + 32);
    [v3 setExpirationHandler:v15];
    uint64_t v8 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014E38;
    uint64_t v12[3] = &unk_10001D180;
    id v9 = v3;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    (*(void (**)(uint64_t, id, uint64_t, void *))(v8 + 16))(v8, v9, 6, v12);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) activityName];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Scheduled background task is not eligible to run for %@", buf, 0xCu);
    }
    [v3 setTaskCompleted];
  }
}

void sub_100014D80(uint64_t a1)
{
  uint64_t v2 = ABSLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) activityName];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Background task %@ expired.", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100014E38(uint64_t a1)
{
  [*(id *)(a1 + 32) setTaskCompleted];
  uint64_t v2 = ABSLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 40) activityName];
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Background task completed for %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.hasSecureScheme.getter()
{
  return URL.hasSecureScheme.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
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

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t NetworkProvider.init(customURLCache:waitsForConnectivity:)()
{
  return NetworkProvider.init(customURLCache:waitsForConnectivity:)();
}

uint64_t type metadata accessor for NetworkProvider()
{
  return type metadata accessor for NetworkProvider();
}

uint64_t BrandAssetNetworkFetcher.init(networkProvider:)()
{
  return BrandAssetNetworkFetcher.init(networkProvider:)();
}

uint64_t type metadata accessor for BrandAssetNetworkFetcher()
{
  return type metadata accessor for BrandAssetNetworkFetcher();
}

uint64_t RCSChatBotNetworkProvider.init(customURLCache:waitsForConnectivity:)()
{
  return RCSChatBotNetworkProvider.init(customURLCache:waitsForConnectivity:)();
}

uint64_t type metadata accessor for RCSChatBotNetworkProvider()
{
  return type metadata accessor for RCSChatBotNetworkProvider();
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

uint64_t StyleSheet.init(css:)()
{
  return StyleSheet.init(css:)();
}

uint64_t type metadata accessor for StyleSheet()
{
  return type metadata accessor for StyleSheet();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t String.init(utf8String:)()
{
  return String.init(utf8String:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
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

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
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

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
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

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.cString(using:)()
{
  return StringProtocol.cString(using:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
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

uint64_t ABSLogCommon()
{
  return _ABSLogCommon();
}

uint64_t IMStringIsBusinessID()
{
  return _IMStringIsBusinessID();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t _BSIsInternalInstall()
{
  return __BSIsInternalInstall();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_activityName(void *a1, const char *a2, ...)
{
  return _[a1 activityName];
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _[a1 build];
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_eligibleToRun(void *a1, const char *a2, ...)
{
  return _[a1 eligibleToRun];
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return _[a1 selector];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setTaskCompleted];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}