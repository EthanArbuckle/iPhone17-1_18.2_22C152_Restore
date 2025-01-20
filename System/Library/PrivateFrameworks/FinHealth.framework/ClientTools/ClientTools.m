ValueMetadata *_s8FeaturesVMa()
{
  return &_s8FeaturesVN;
}

uint64_t sub_100003B10()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000356D8);
  sub_100003FE8(v0, (uint64_t)qword_1000356D8);
  sub_100004084(&qword_1000346A0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100028910;
  uint64_t v2 = _s18ReevaluateFeaturesVMa();
  uint64_t v3 = sub_1000040C8(&qword_1000346A8, (void (*)(uint64_t))_s18ReevaluateFeaturesVMa);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = _s17RecomputeFeaturesVMa();
  uint64_t v5 = sub_1000040C8(&qword_1000346B0, (void (*)(uint64_t))_s17RecomputeFeaturesVMa);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + 56) = v5;
  uint64_t v6 = _s17TopMapsCategoriesVMa();
  uint64_t v7 = sub_1000040C8(&qword_1000346B8, (void (*)(uint64_t))_s17TopMapsCategoriesVMa);
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 72) = v7;
  uint64_t v8 = _s14ReceiptLinkingVMa();
  uint64_t v9 = sub_1000040C8(&qword_1000346C0, (void (*)(uint64_t))_s14ReceiptLinkingVMa);
  *(void *)(v1 + 80) = v8;
  *(void *)(v1 + 88) = v9;
  uint64_t v10 = _s22FeaturesForApplicationVMa();
  uint64_t v11 = sub_1000040C8(&qword_1000346C8, (void (*)(uint64_t))_s22FeaturesForApplicationVMa);
  *(void *)(v1 + 96) = v10;
  *(void *)(v1 + 104) = v11;
  uint64_t v12 = _s19SendAllTransactionsVMa();
  uint64_t v13 = sub_1000040C8(&qword_1000346D0, (void (*)(uint64_t))_s19SendAllTransactionsVMa);
  *(void *)(v1 + 112) = v12;
  *(void *)(v1 + 120) = v13;
  sub_100004084(&qword_1000346D8);
  __chkstk_darwin();
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100003E04@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000345F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000356D8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100003EAC()
{
  return static ParsableCommand._commandName.getter();
}

void sub_100003EC4()
{
}

void sub_100003EE0()
{
}

uint64_t sub_100003EF8()
{
  return static ParsableArguments._errorLabel.getter();
}

uint64_t sub_100003F10(uint64_t a1)
{
  return sub_100004110(a1);
}

unint64_t sub_100003F3C()
{
  unint64_t result = qword_100034690;
  if (!qword_100034690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034690);
  }
  return result;
}

unint64_t sub_100003F94()
{
  unint64_t result = qword_100034698;
  if (!qword_100034698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034698);
  }
  return result;
}

uint64_t sub_100003FE8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100004020(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004084(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000040C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004110(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100004160(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100004168@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for FHMerchantCategory(uint64_t a1)
{
}

void type metadata accessor for FHInsightTrendDirection(uint64_t a1)
{
}

void sub_10000419C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t *sub_1000041E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004084(&qword_1000346F0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004084(&qword_1000346F8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_1000042F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004084(&qword_1000346F8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_1000043A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_100004464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100004524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000045E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000046A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000046B8);
}

uint64_t sub_1000046B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004084(&qword_1000346F8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000047B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000047CC);
}

uint64_t sub_1000047CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004084(&qword_1000346F0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004084(&qword_1000346F8);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t _s12SignalStatusVMa()
{
  uint64_t result = qword_100034758;
  if (!qword_100034758) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100004924()
{
  sub_100004A0C(319, (unint64_t *)&qword_100034768);
  if (v0 <= 0x3F)
  {
    sub_100004A0C(319, (unint64_t *)&unk_100034770);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100004A0C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Option();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100004A54()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000356F0);
  sub_100003FE8(v0, (uint64_t)qword_1000356F0);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  unint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100004BA4()
{
  *(void *)(v1 + 120) = v0;
  return _swift_task_switch(sub_100004BC4, 0, 0);
}

uint64_t sub_100004BC4()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[16] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[17] = v2;
  id v3 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  v0[18] = v3;
  [v3 setNumberStyle:1];
  [v3 setMaximumFractionDigits:2];
  _s12SignalStatusVMa();
  sub_100004084(&qword_1000346F8);
  Option.wrappedValue.getter();
  id v4 = [objc_allocWithZone((Class)NSDecimalNumber) initWithInteger:v0[10]];
  v0[19] = v4;
  v0[20] = sub_100004084(&qword_1000352D0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100028A20;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 32) = 0xD000000000000018;
  *(void *)(v5 + 40) = 0x800000010002B310;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_100004084(&qword_1000346F0);
  Option.wrappedValue.getter();
  NSString v6 = String._bridgeToObjectiveC()();
  v0[21] = v6;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_100004E54;
  uint64_t v7 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000050EC;
  v0[13] = &unk_100031070;
  v0[14] = v7;
  [v2 updatePeerPaymentForecastingSuggestionStatus:1 counterpartHandle:v6 amount:v4 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100004E54()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    id v2 = sub_100005054;
  }
  else {
    id v2 = sub_100004F64;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004F64()
{
  id v2 = *(void **)(v0 + 144);
  uint64_t v1 = *(void **)(v0 + 152);
  id v3 = *(void **)(v0 + 128);
  uint64_t v4 = *(void **)(v0 + 136);

  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100028A20;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 32) = 0xD000000000000017;
  *(void *)(v5 + 40) = 0x800000010002B350;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  NSString v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100005054()
{
  uint64_t v1 = (void *)v0[21];
  id v3 = (void *)v0[18];
  id v2 = (void *)v0[19];
  uint64_t v5 = (void *)v0[16];
  uint64_t v4 = (void *)v0[17];
  swift_willThrow();

  NSString v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1000050EC(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = swift_allocError();
    *NSString v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

BOOL sub_1000051A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000051B8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100005200()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000522C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100005270()
{
  uint64_t v21 = *(void *)(*(void *)(sub_100004084(&qword_1000347C8) - 8) + 64);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v22 = (v0 + 15) & 0xFFFFFFFFFFFFFFF0;
  Swift::UInt v1 = (char *)v15 - v22;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v2 = type metadata accessor for ArgumentHelp();
  uint64_t v3 = *(void *)(v2 - 8);
  v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
  uint64_t v20 = v3 + 56;
  v19(v1, 0, 1, v2);
  uint64_t v4 = *(void *)(*(void *)(sub_100004084(&qword_1000347D0) - 8) + 64);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v18 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = (char *)v15 - v18;
  uint64_t v6 = type metadata accessor for CompletionKind();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v17 = v7 + 56;
  v16(v5, 1, 1, v6);
  uint64_t v8 = *(void *)(*(void *)(type metadata accessor for NameSpecification() - 8) + 64);
  ((void (*)(void))__chkstk_darwin)();
  v15[2] = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v9 = *(void *)(*(void *)(type metadata accessor for SingleValueParsingStrategy() - 8) + 64);
  ((void (*)(void))__chkstk_darwin)();
  v15[1] = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(name:parsing:help:completion:)();
  _s12SignalStatusVMa();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)v15 - v22;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v11 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v19)(v10, 0, 1, v2);
  __chkstk_darwin(v11);
  uint64_t v12 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v16)((char *)v15 - v18, 1, 1, v6);
  __chkstk_darwin(v12);
  uint64_t v13 = static NameSpecification.long.getter();
  __chkstk_darwin(v13);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(name:parsing:help:completion:)();
}

uint64_t sub_1000055FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v54 = a1;
  uint64_t v41 = a2;
  uint64_t v2 = sub_100004084(&qword_1000347D8);
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  __chkstk_darwin(v2);
  v55 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s12SignalStatusVMa();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v57 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004084(&qword_1000347C8);
  uint64_t v52 = *(void *)(*(void *)(v7 - 8) + 64);
  __chkstk_darwin(v7 - 8);
  unint64_t v53 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)&v40 - v53;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v50 = type metadata accessor for ArgumentHelp();
  uint64_t v10 = *(void *)(v50 - 8);
  v49 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  uint64_t v51 = v10 + 56;
  v49(v9, 0, 1, v50);
  uint64_t v11 = sub_100004084(&qword_1000347D0);
  uint64_t v47 = *(void *)(*(void *)(v11 - 8) + 64);
  __chkstk_darwin(v11 - 8);
  unint64_t v48 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)&v40 - v48;
  uint64_t v14 = type metadata accessor for CompletionKind();
  uint64_t v15 = *(void *)(v14 - 8);
  v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v46 = v15 + 56;
  v45(v13, 1, 1, v14);
  uint64_t v16 = type metadata accessor for NameSpecification();
  uint64_t v17 = *(void *)(*(void *)(v16 - 8) + 64);
  __chkstk_darwin(v16 - 8);
  unint64_t v44 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v18 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v18 - 8);
  static SingleValueParsingStrategy.next.getter();
  uint64_t v19 = v57;
  uint64_t v20 = Option<A>.init(name:parsing:help:completion:)();
  uint64_t v21 = v19 + *(int *)(v5 + 28);
  __chkstk_darwin(v20);
  unint64_t v22 = (char *)&v40 - v53;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v23 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v49)(v22, 0, 1, v50);
  __chkstk_darwin(v23);
  uint64_t v24 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v45)((char *)&v40 - v48, 1, 1, v14);
  v25 = v54;
  __chkstk_darwin(v24);
  uint64_t v26 = static NameSpecification.long.getter();
  __chkstk_darwin(v26);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(name:parsing:help:completion:)();
  sub_100006118(v25, v25[3]);
  sub_10000615C();
  uint64_t v27 = v56;
  v28 = v55;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v27)
  {
    sub_100004110((uint64_t)v25);
    uint64_t v39 = v19;
  }
  else
  {
    uint64_t v29 = sub_100004084(&qword_1000346F0);
    uint64_t v30 = *(void *)(v29 - 8);
    __chkstk_darwin(v29);
    v32 = (char *)&v40 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v59 = 0;
    sub_100006254((unint64_t *)&qword_1000347E8, &qword_1000346F0);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 40))(v57, v32, v29);
    uint64_t v33 = sub_100004084(&qword_1000346F8);
    uint64_t v56 = *(void *)(v33 - 8);
    __chkstk_darwin(v33);
    v35 = (char *)&v40 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v58 = 1;
    sub_100006254(&qword_1000347F0, &qword_1000346F8);
    uint64_t v36 = v43;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v28, v36);
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 40))(v21, v35, v33);
    uint64_t v38 = v57;
    sub_100006298(v57, v41);
    sub_100004110((uint64_t)v25);
    uint64_t v39 = v38;
  }
  return sub_1000061B0(v39);
}

uint64_t sub_100005CE4()
{
  if (*v0) {
    return 0x746E756F6D61;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_100005D20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000065BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100005D48()
{
  return 0;
}

void sub_100005D54(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100005D60(uint64_t a1)
{
  unint64_t v2 = sub_10000615C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005D9C(uint64_t a1)
{
  unint64_t v2 = sub_10000615C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100005DD8()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100005E80;
  v2[15] = v0;
  return _swift_task_switch(sub_100004BC4, 0, 0);
}

uint64_t sub_100005E80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005F74@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000345F8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000356F0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100006020@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000055FC(a1, a2);
}

uint64_t sub_100006038()
{
  return sub_1000060D4(&qword_1000347A0);
}

uint64_t sub_10000606C()
{
  return sub_1000060D4((unint64_t *)&unk_1000347A8);
}

uint64_t sub_1000060A0()
{
  return sub_1000060D4(&qword_1000347B8);
}

uint64_t sub_1000060D4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s12SignalStatusVMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100006118(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000615C()
{
  unint64_t result = qword_1000347E0;
  if (!qword_1000347E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347E0);
  }
  return result;
}

uint64_t sub_1000061B0(uint64_t a1)
{
  uint64_t v2 = _s12SignalStatusVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000620C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006254(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000620C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s12SignalStatusVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s12SignalStatusV10CodingKeysOwCP(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s12SignalStatusV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12SignalStatusV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006468);
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

uint64_t sub_100006490(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006498(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s12SignalStatusV10CodingKeysOMa()
{
  return &_s12SignalStatusV10CodingKeysON;
}

unint64_t sub_1000064B8()
{
  unint64_t result = qword_1000347F8;
  if (!qword_1000347F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347F8);
  }
  return result;
}

unint64_t sub_100006510()
{
  unint64_t result = qword_100034800;
  if (!qword_100034800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034800);
  }
  return result;
}

unint64_t sub_100006568()
{
  unint64_t result = qword_100034808;
  if (!qword_100034808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034808);
  }
  return result;
}

uint64_t sub_1000065BC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000010002B390
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F6D61 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t *sub_1000066A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004084(&qword_100034810);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004084(&qword_1000346F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_1000067B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_100006864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_100006924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000069E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100006AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100006B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006B78);
}

uint64_t sub_100006B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004084(&qword_1000346F0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100006C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006C8C);
}

uint64_t sub_100006C8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004084(&qword_100034810);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004084(&qword_1000346F0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t _s14ReceiptLinkingVMa()
{
  uint64_t result = qword_100034870;
  if (!qword_100034870) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006DE4()
{
  sub_100006EAC();
  if (v0 <= 0x3F)
  {
    sub_100006F40();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100006EAC()
{
  if (!qword_100034880)
  {
    type metadata accessor for CommonOptions();
    sub_100008CF0((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
    unint64_t v0 = type metadata accessor for OptionGroup();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100034880);
    }
  }
}

void sub_100006F40()
{
  if (!qword_100034768)
  {
    unint64_t v0 = type metadata accessor for Option();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100034768);
    }
  }
}

uint64_t sub_100006F98()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035708);
  sub_100003FE8(v0, (uint64_t)qword_100035708);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_1000070E0()
{
  *(void *)(v1 + 144) = v0;
  type metadata accessor for CommonOptions();
  *(void *)(v1 + 152) = swift_task_alloc();
  return _swift_task_switch(sub_100007170, 0, 0);
}

uint64_t sub_100007170()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[20] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[21] = v2;
  _s14ReceiptLinkingVMa();
  sub_100004084(&qword_1000346F0);
  Option.wrappedValue.getter();
  NSString v3 = String._bridgeToObjectiveC()();
  v0[22] = v3;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 17;
  v0[3] = sub_100007304;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100007FC0;
  v0[13] = &unk_100031118;
  v0[14] = v4;
  [v2 getDisputeDocumentSuggestionsForTransactionId:v3 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100007304()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    id v2 = sub_100007EC4;
  }
  else {
    id v2 = sub_100007414;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_100007414()
{
  uint64_t v73 = v0;
  Class v1 = *(Class *)(v0 + 136);

  sub_100004084(&qword_1000352D0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100028A20;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD00000000000001CLL;
  *(void *)(v2 + 40) = 0x800000010002B410;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v3 = *(void *)(((unint64_t)v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_100028A20;
    *(void *)(v57 + 56) = &type metadata for String;
    *(void *)(v57 + 32) = 0xD000000000000049;
    *(void *)(v57 + 40) = 0x800000010002B4C0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_100004084(&qword_100034810);
    OptionGroup.wrappedValue.getter();
    char v58 = (void *)swift_task_alloc();
    *(void *)(v59 + 192) = v58;
    *char v58 = v59;
    v58[1] = sub_100007D08;
    sub_10001E400(0, 1);
    return;
  }
LABEL_25:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_26;
  }
LABEL_3:
  unint64_t v65 = (unint64_t)v1 & 0xC000000000000001;
  id v64 = self;
  unint64_t v4 = 0;
  v60 = (char *)v1 + 32;
  uint64_t v61 = (unint64_t)v1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v62 = v3;
  v63 = v1;
  while (1)
  {
    if (v65)
    {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (v4 >= *(void *)(v61 + 16)) {
        goto LABEL_24;
      }
      id v5 = *(id *)&v60[8 * v4];
    }
    v71 = v5;
    BOOL v6 = __OFADD__(v4, 1);
    unint64_t v7 = v4 + 1;
    if (v6)
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_100028A20;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 32) = 0xD000000000000031;
    *(void *)(v8 + 40) = 0x800000010002B430;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100028A20;
    id v10 = [v71 UUID];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    v72[0] = v11;
    v72[1] = v13;
    v14._countAndFlagsBits = 537468972;
    v14._object = (void *)0xE400000000000000;
    String.append(_:)(v14);
    id v15 = [v71 rankScore];
    id v16 = [v15 description];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();

    uint64_t v21 = v72[0];
    uint64_t v22 = v72[1];
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 32) = v21;
    *(void *)(v9 + 40) = v22;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    id v23 = [v71 UUID];
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    id v27 = [objc_allocWithZone((Class)PHFetchOptions) init];
    sub_100004084(&qword_1000348D8);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_100028A20;
    *(void *)(v28 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v28 + 40) = v29;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v27 setFetchPropertySets:isa];

    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_100028A20;
    *(void *)(v31 + 32) = v24;
    *(void *)(v31 + 40) = v26;
    swift_bridgeObjectRetain();
    Class v1 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v32 = [v64 fetchAssetsWithLocalIdentifiers:v1 options:v27];

    swift_bridgeObjectRelease();
    id v70 = v32;
    unint64_t v33 = (unint64_t)[v32 count];
    if ((v33 & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    unint64_t v66 = v7;
    if (v33) {
      break;
    }
LABEL_4:

    Class v1 = v63;
    unint64_t v4 = v66;
    if (v66 == v62) {
      goto LABEL_26;
    }
  }
  uint64_t v34 = 0;
  unint64_t v69 = v33;
  while (1)
  {
    id v35 = [v70 objectAtIndex:v34];
    id v36 = [v35 characterRecognitionProperties];
    if (!v36) {
      break;
    }
    v37 = v36;
    id v38 = [v36 characterRecognitionData];

    if (!v38) {
      goto LABEL_30;
    }
    uint64_t v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = v40;

    sub_100008D90(0, &qword_1000348E0);
    sub_100008D90(0, &qword_1000348E8);
    uint64_t v42 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    uint64_t v43 = v42;
    if (!v42) {
      goto LABEL_31;
    }
    id v44 = [v42 getTranscript];
    if (v44)
    {
      v45 = v44;
      uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v68 = v46;
    }
    else
    {
      uint64_t v67 = 0;
      uint64_t v68 = 0;
    }
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_100028A20;
    strcpy((char *)v72, "OCR of UUID: ");
    HIWORD(v72[1]) = -4864;
    id v48 = [v71 UUID];
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v51 = v50;

    v52._countAndFlagsBits = v49;
    v52._object = v51;
    String.append(_:)(v52);
    swift_bridgeObjectRelease();
    uint64_t v53 = v72[0];
    uint64_t v54 = v72[1];
    *(void *)(v47 + 56) = &type metadata for String;
    *(void *)(v47 + 32) = v53;
    *(void *)(v47 + 40) = v54;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_100028A20;
    *(void *)(v55 + 56) = &type metadata for String;
    *(void *)(v55 + 32) = 0xD000000000000031;
    *(void *)(v55 + 40) = 0x800000010002B510;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_100028A20;
    if (!v68) {
      goto LABEL_32;
    }
    *(void *)(v56 + 56) = &type metadata for String;
    *(void *)(v56 + 32) = v67;
    *(void *)(v56 + 40) = v68;
    print(_:separator:terminator:)();
    sub_100008D38(v39, v41);

    swift_bridgeObjectRelease();
    if (v69 == ++v34) {
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
}

uint64_t sub_100007D08()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  sub_100008E20(*(void *)(v2 + 152), (uint64_t (*)(void))type metadata accessor for CommonOptions);
  if (v0) {
    uint64_t v3 = sub_100007F50;
  }
  else {
    uint64_t v3 = sub_100007E50;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100007E50()
{
  Class v1 = *(void **)(v0 + 160);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100007EC4()
{
  Class v1 = (void *)v0[22];
  uint64_t v3 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100007F50()
{
  Class v1 = *(void **)(v0 + 160);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100007FC0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_100008D90(0, &qword_1000348F0);
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000809C()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100008CF0((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  _s14ReceiptLinkingVMa();
  uint64_t v1 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v4 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  uint64_t v5 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v9 - 8);
  static NameSpecification.long.getter();
  uint64_t v10 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v10 - 8);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(name:parsing:help:completion:)();
}

uint64_t sub_100008380@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v4 = sub_100004084(&qword_1000348F8);
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s14ReceiptLinkingVMa();
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100008CF0((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  uint64_t v12 = &v10[*(int *)(v8 + 28)];
  uint64_t v13 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v16 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  uint64_t v17 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v21 - 8);
  static NameSpecification.long.getter();
  uint64_t v22 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v22 - 8);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(name:parsing:help:completion:)();
  sub_100006118(a1, a1[3]);
  sub_100008DCC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v34 = v12;
    uint64_t v23 = sub_100004084(&qword_100034810);
    uint64_t v24 = *(void *)(v23 - 8);
    __chkstk_darwin(v23);
    uint64_t v26 = (char *)&v32 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v39 = 0;
    sub_100008E80((unint64_t *)&qword_100034908, &qword_100034810);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v10, v26, v23);
    uint64_t v27 = sub_100004084(&qword_1000346F0);
    uint64_t v33 = *(void *)(v27 - 8);
    __chkstk_darwin(v27);
    uint64_t v29 = (char *)&v32 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v38 = 1;
    sub_100008E80((unint64_t *)&qword_1000347E8, &qword_1000346F0);
    uint64_t v30 = v37;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v30);
    (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v34, v29, v27);
    sub_100008EC4((uint64_t)v10, v35);
  }
  sub_100004110((uint64_t)a1);
  return sub_100008E20((uint64_t)v10, (uint64_t (*)(void))_s14ReceiptLinkingVMa);
}

uint64_t sub_1000089D4()
{
  if (*v0) {
    return 0x746361736E617274;
  }
  else {
    return 0x704F6E6F6D6D6F63;
  }
}

uint64_t sub_100008A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009134(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100008A50(uint64_t a1)
{
  unint64_t v2 = sub_100008DCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008A8C(uint64_t a1)
{
  unint64_t v2 = sub_100008DCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008AC8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_1000070E0();
}

uint64_t sub_100008B54@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034600 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035708);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100008C00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008380(a1, a2);
}

uint64_t sub_100008C18()
{
  return sub_100008CF0((unint64_t *)&unk_1000348B8, (void (*)(uint64_t))_s14ReceiptLinkingVMa);
}

uint64_t sub_100008C60()
{
  return sub_100008CF0(&qword_1000346C0, (void (*)(uint64_t))_s14ReceiptLinkingVMa);
}

uint64_t sub_100008CA8()
{
  return sub_100008CF0(&qword_1000348C8, (void (*)(uint64_t))_s14ReceiptLinkingVMa);
}

uint64_t sub_100008CF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008D38(uint64_t a1, unint64_t a2)
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

uint64_t sub_100008D90(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100008DCC()
{
  unint64_t result = qword_100034900;
  if (!qword_100034900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034900);
  }
  return result;
}

uint64_t sub_100008E20(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008E80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000620C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s14ReceiptLinkingVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s14ReceiptLinkingV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008FF4);
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

ValueMetadata *_s14ReceiptLinkingV10CodingKeysOMa()
{
  return &_s14ReceiptLinkingV10CodingKeysON;
}

unint64_t sub_100009030()
{
  unint64_t result = qword_100034910;
  if (!qword_100034910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034910);
  }
  return result;
}

unint64_t sub_100009088()
{
  unint64_t result = qword_100034918;
  if (!qword_100034918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034918);
  }
  return result;
}

unint64_t sub_1000090E0()
{
  unint64_t result = qword_100034920;
  if (!qword_100034920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034920);
  }
  return result;
}

uint64_t sub_100009134(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x704F6E6F6D6D6F63 && a2 == 0xED0000736E6F6974;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746361736E617274 && a2 == 0xED000064496E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

ValueMetadata *_s12TransactionsVMa()
{
  return &_s12TransactionsVN;
}

uint64_t sub_100009280()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035720);
  sub_100003FE8(v0, (uint64_t)qword_100035720);
  sub_100004084(&qword_1000346A0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100028E30;
  unint64_t v2 = sub_100009620();
  *(void *)(v1 + 32) = &_s18InsertTransactionsVN;
  *(void *)(v1 + 40) = v2;
  uint64_t v3 = _s18ImportTransactionsVMa();
  uint64_t v4 = sub_1000096C8(&qword_100034940, (void (*)(uint64_t))_s18ImportTransactionsVMa);
  *(void *)(v1 + 48) = v3;
  *(void *)(v1 + 56) = v4;
  unint64_t v5 = sub_100009674();
  *(void *)(v1 + 64) = &_s9DeleteAllVN;
  *(void *)(v1 + 72) = v5;
  uint64_t v6 = _s17DeleteForSourceIDVMa();
  uint64_t v7 = sub_1000096C8(&qword_100034950, (void (*)(uint64_t))_s17DeleteForSourceIDVMa);
  *(void *)(v1 + 80) = v6;
  *(void *)(v1 + 88) = v7;
  uint64_t v8 = _s16ListTransactionsVMa();
  uint64_t v9 = sub_1000096C8(&qword_100034958, (void (*)(uint64_t))_s16ListTransactionsVMa);
  *(void *)(v1 + 96) = v8;
  *(void *)(v1 + 104) = v9;
  uint64_t v10 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_1000094C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034608 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035720);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_100009574()
{
  unint64_t result = qword_100034928;
  if (!qword_100034928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034928);
  }
  return result;
}

unint64_t sub_1000095CC()
{
  unint64_t result = qword_100034930;
  if (!qword_100034930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034930);
  }
  return result;
}

unint64_t sub_100009620()
{
  unint64_t result = qword_100034938;
  if (!qword_100034938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034938);
  }
  return result;
}

unint64_t sub_100009674()
{
  unint64_t result = qword_100034948;
  if (!qword_100034948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034948);
  }
  return result;
}

uint64_t sub_1000096C8(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *_s18InsertTransactionsVMa()
{
  return &_s18InsertTransactionsVN;
}

uint64_t sub_100009720()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035738);
  sub_100003FE8(v0, (uint64_t)qword_100035738);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100009864@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034610 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035738);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10000990C()
{
  sub_100004084(&qword_1000352D0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100028A20;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD000000000000022;
  *(void *)(v0 + 40) = 0x800000010002B570;
  print(_:separator:terminator:)();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1000099A0()
{
  unint64_t result = qword_100034960;
  if (!qword_100034960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034960);
  }
  return result;
}

unint64_t sub_1000099F8()
{
  unint64_t result = qword_100034968;
  if (!qword_100034968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034968);
  }
  return result;
}

uint64_t sub_100009A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_100009ABC(uint64_t a1)
{
  uint64_t v2 = sub_100004084(&qword_1000346F0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_100009B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100009CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009CD8);
}

uint64_t sub_100009CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_100009D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009D5C);
}

uint64_t sub_100009D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s22PeerPaymentForecastingVMa()
{
  uint64_t result = qword_1000349C8;
  if (!qword_1000349C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100009E1C()
{
  sub_100006F40();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100009EA8()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035750);
  sub_100003FE8(v0, (uint64_t)qword_100035750);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100009FFC()
{
  v1[18] = v0;
  sub_100004084(&qword_100034A28);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  sub_100004084(&qword_100034A30);
  v1[22] = swift_task_alloc();
  return _swift_task_switch(sub_10000A0DC, 0, 0);
}

uint64_t sub_10000A0DC()
{
  uint64_t v1 = v0[22];
  id v2 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[23] = v2;
  id v3 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v2];
  v0[24] = v3;
  id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
  v0[25] = v4;
  NSString v5 = String._bridgeToObjectiveC()();
  [v4 setDateFormat:v5];

  TimeZone.init(secondsFromGMT:)();
  uint64_t v6 = type metadata accessor for TimeZone();
  uint64_t v7 = *(void *)(v6 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v1, 1, v6) != 1)
  {
    uint64_t v9 = v0[22];
    Class isa = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  [v4 setTimeZone:isa];

  sub_100004084(&qword_1000346F0);
  Option.wrappedValue.getter();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v4 dateFromString:v10];

  uint64_t v12 = v0[20];
  if (v11)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  }
  uint64_t v14 = v0[21];
  sub_10000B58C(v0[20], v14);
  v0[26] = sub_100004084(&qword_1000352D0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100028A20;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 32) = 0xD00000000000002DLL;
  *(void *)(v15 + 40) = 0x800000010002B630;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  uint64_t v16 = *(void *)(v13 - 8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v13) == 1)
  {
    uint64_t v18 = v0[21];
    type metadata accessor for ValidationError();
    sub_10000B5F4();
    swift_allocError();
    ValidationError.init(_:)();
    swift_willThrow();

    sub_10000B640(v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
  else
  {
    uint64_t v21 = v0[19];
    sub_10000B6A0(v0[21], v21);
    uint64_t v22 = v17(v21, 1, v13);
    if (v22 == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v23 = v0[19];
      Class v24 = Date._bridgeToObjectiveC()().super.isa;
      v0[27] = v24;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v23, v13);
      v0[2] = v0;
      v0[7] = v0 + 17;
      v0[3] = sub_10000A630;
      uint64_t v25 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_10000AA5C;
      v0[13] = &unk_100031200;
      v0[14] = v25;
      [v3 peerPaymentForecastingSignals:v24 withCompletion:v0 + 10];
      uint64_t v22 = (uint64_t)(v0 + 2);
    }
    return _swift_continuation_await(v22);
  }
}

uint64_t sub_10000A630()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    id v2 = sub_10000A8C0;
  }
  else {
    id v2 = sub_10000A740;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000A740()
{
  uint64_t v1 = *(void *)(v0 + 136);

  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100028A20;
  *(void *)(v2 + 56) = sub_100004084(&qword_100034A40);
  *(void *)(v2 + 32) = v1;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  id v3 = *(void **)(v0 + 200);
  NSString v5 = *(void **)(v0 + 184);
  uint64_t v4 = *(void **)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 168);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100028A20;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 32) = 0xD000000000000034;
  *(void *)(v7 + 40) = 0x800000010002B6B0;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
  sub_10000B640(v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000A8C0()
{
  uint64_t v1 = (void *)v0[27];
  swift_willThrow();

  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100028A20;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD000000000000027;
  *(void *)(v2 + 40) = 0x800000010002B680;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  id v3 = (void *)v0[25];
  uint64_t v4 = (void *)v0[23];
  NSString v5 = (void *)v0[24];
  uint64_t v6 = v0[21];
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100028A20;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 32) = 0xD000000000000034;
  *(void *)(v7 + 40) = 0x800000010002B6B0;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
  sub_10000B640(v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000AA5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000B708();
    **(void **)(*(void *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000AB28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v4 = sub_100004084(&qword_100034A50);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s22PeerPaymentForecastingVMa();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v13 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  uint64_t v14 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v18 - 8);
  static NameSpecification.long.getter();
  uint64_t v19 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v19 - 8);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(name:parsing:help:completion:)();
  sub_100006118(a1, a1[3]);
  sub_10000B748();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v20 = sub_100004084(&qword_1000346F0);
    uint64_t v25 = (uint64_t)&v25;
    uint64_t v21 = *(void *)(v20 - 8);
    __chkstk_darwin(v20);
    uint64_t v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10000B7F8();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
    (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v9, v23, v20);
    sub_10000B848((uint64_t)v9, v26);
  }
  sub_100004110((uint64_t)a1);
  return sub_10000B79C((uint64_t)v9);
}

uint64_t sub_10000AF78()
{
  return 1;
}

Swift::Int sub_10000AF80()
{
  return Hasher._finalize()();
}

void sub_10000AFC4()
{
}

Swift::Int sub_10000AFEC()
{
  return Hasher._finalize()();
}

uint64_t sub_10000B02C()
{
  return 1702125924;
}

uint64_t sub_10000B03C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_10000B0C4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000B0D0(uint64_t a1)
{
  unint64_t v2 = sub_10000B748();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000B10C(uint64_t a1)
{
  unint64_t v2 = sub_10000B748();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000B148()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_100009FFC();
}

uint64_t sub_10000B1D4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034618 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035750);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10000B27C()
{
  uint64_t v0 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v3 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  uint64_t v4 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v8 - 8);
  static NameSpecification.long.getter();
  uint64_t v9 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v9 - 8);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(name:parsing:help:completion:)();
}

uint64_t sub_10000B494@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000AB28(a1, a2);
}

uint64_t sub_10000B4AC()
{
  return sub_10000B548(&qword_100034A00);
}

uint64_t sub_10000B4E0()
{
  return sub_10000B548((unint64_t *)&unk_100034A08);
}

uint64_t sub_10000B514()
{
  return sub_10000B548(&qword_100034A18);
}

uint64_t sub_10000B548(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s22PeerPaymentForecastingVMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B5F4()
{
  unint64_t result = qword_100034A38;
  if (!qword_100034A38)
  {
    type metadata accessor for ValidationError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A38);
  }
  return result;
}

uint64_t sub_10000B640(uint64_t a1)
{
  uint64_t v2 = sub_100004084(&qword_100034A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B708()
{
  unint64_t result = qword_100034A48;
  if (!qword_100034A48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100034A48);
  }
  return result;
}

unint64_t sub_10000B748()
{
  unint64_t result = qword_100034A58;
  if (!qword_100034A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A58);
  }
  return result;
}

uint64_t sub_10000B79C(uint64_t a1)
{
  uint64_t v2 = _s22PeerPaymentForecastingVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B7F8()
{
  unint64_t result = qword_1000347E8;
  if (!qword_1000347E8)
  {
    sub_10000620C(&qword_1000346F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347E8);
  }
  return result;
}

uint64_t sub_10000B848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s22PeerPaymentForecastingVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s22PeerPaymentForecastingV10CodingKeysOwet(unsigned int *a1, int a2)
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

unsigned char *_s22PeerPaymentForecastingV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000B99CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B9C4()
{
  return 0;
}

ValueMetadata *_s22PeerPaymentForecastingV10CodingKeysOMa()
{
  return &_s22PeerPaymentForecastingV10CodingKeysON;
}

unint64_t sub_10000B9E0()
{
  unint64_t result = qword_100034A60;
  if (!qword_100034A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A60);
  }
  return result;
}

unint64_t sub_10000BA38()
{
  unint64_t result = qword_100034A68;
  if (!qword_100034A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A68);
  }
  return result;
}

unint64_t sub_10000BA90()
{
  unint64_t result = qword_100034A70;
  if (!qword_100034A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A70);
  }
  return result;
}

uint64_t *sub_10000BAE4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004084(&qword_1000346F0);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100004084(&qword_100034A78);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]), v7);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100004084(&qword_100034A80);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100004084(&qword_1000346F8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_10000BCBC(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5(a1 + a2[6], v4);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = sub_100004084(&qword_1000346F8);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  return v12(v10, v11);
}

uint64_t sub_10000BE20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_10000BFA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t sub_10000C130(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_10000C2B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[6], a2 + a3[6], v6);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_10000C440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C454);
}

uint64_t sub_10000C454(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004084(&qword_1000346F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004084(&qword_100034A78);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100004084(&qword_100034A80);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_7;
  }
  uint64_t v16 = sub_100004084(&qword_1000346F8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[8];
  return v17(v19, a2, v18);
}

uint64_t sub_10000C5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C610);
}

uint64_t sub_10000C610(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100004084(&qword_1000346F0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100004084(&qword_100034A78);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t v16 = sub_100004084(&qword_100034A80);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_7;
  }
  uint64_t v18 = sub_100004084(&qword_1000346F8);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[8];
  return v19(v21, a2, a2, v20);
}

uint64_t _s16ListTransactionsVMa()
{
  uint64_t result = qword_100034AE0;
  if (!qword_100034AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C810()
{
  sub_100004A0C(319, (unint64_t *)&qword_100034768);
  if (v0 <= 0x3F)
  {
    sub_100004A0C(319, &qword_100034AF0);
    if (v1 <= 0x3F)
    {
      sub_100004A0C(319, (unint64_t *)&unk_100034AF8);
      if (v2 <= 0x3F)
      {
        sub_100004A0C(319, (unint64_t *)&unk_100034770);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for MerchantCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MerchantCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x10000CAECLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MerchantCategory()
{
  return &type metadata for MerchantCategory;
}

uint64_t getEnumTagSinglePayload for TransactionAccountType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TransactionAccountType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000CC80);
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

ValueMetadata *type metadata accessor for TransactionAccountType()
{
  return &type metadata for TransactionAccountType;
}

uint64_t sub_10000CCB8()
{
  return sub_10000D2E4(&qword_100034B38, &qword_100034B40);
}

uint64_t sub_10000CCE0(unsigned __int8 *a1, char *a2)
{
  return sub_100012054(*a1, *a2);
}

Swift::Int sub_10000CCEC()
{
  return Hasher._finalize()();
}

uint64_t sub_10000CDDC()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000CEB4()
{
  return Hasher._finalize()();
}

unint64_t sub_10000CFA0@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100010688(*a1);
  *a2 = result;
  return result;
}

void sub_10000CFD0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEB00000000746E65;
  uint64_t v3 = 0x6D79615072656570;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x79617764616F7262;
      goto LABEL_3;
    case 2:
      *a1 = 0x73676E69766173;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x6E6E6F436B6E6162;
      a1[1] = 0xEB00000000746365;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10000D080()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10000D0E0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10000D130()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t sub_10000D198()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t sub_10000D1E0(uint64_t a1, uint64_t a2)
{
  return sub_10000D634(a1, a2, (void (*)(void))sub_10001081C, (void (*)(void))sub_1000107C8);
}

uint64_t sub_10000D20C()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

void sub_10000D254(void *a1@<X8>)
{
  *a1 = &off_100030C50;
}

unint64_t sub_10000D268()
{
  unint64_t result = qword_100034B48;
  if (!qword_100034B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B48);
  }
  return result;
}

uint64_t sub_10000D2BC()
{
  return sub_10000D2E4(&qword_100034B50, &qword_100034B58);
}

uint64_t sub_10000D2E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000620C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D334(unsigned __int8 *a1, char *a2)
{
  return sub_100012200(*a1, *a2);
}

Swift::Int sub_10000D340()
{
  return sub_100012CC8();
}

uint64_t sub_10000D34C()
{
  return sub_1000129B4();
}

Swift::Int sub_10000D354()
{
  return sub_100012CC8();
}

unint64_t sub_10000D35C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000106D4(*a1);
  *a2 = result;
  return result;
}

void sub_10000D38C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xED0000736B6E6972;
      uint64_t v3 = 0x44646E41646F6F66;
      goto LABEL_3;
    case 2:
      *a1 = 0x676E6970706F6873;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x6C6576617274;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 0x7365636976726573;
      a1[1] = 0xE800000000000000;
      break;
    case 5:
      *a1 = 7239014;
      a1[1] = 0xE300000000000000;
      break;
    case 6:
      *a1 = 0x68746C616568;
      a1[1] = 0xE600000000000000;
      break;
    case 7:
      *a1 = 0x726F70736E617274;
      a1[1] = 0xE900000000000074;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10000D4A8()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10000D508()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10000D558()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t sub_10000D5C0()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t sub_10000D608(uint64_t a1, uint64_t a2)
{
  return sub_10000D634(a1, a2, (void (*)(void))sub_100010774, (void (*)(void))sub_100010720);
}

uint64_t sub_10000D634(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  return static ExpressibleByArgument<>.allValueStrings.getter();
}

uint64_t sub_10000D69C()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

void sub_10000D6E4(void *a1@<X8>)
{
  *a1 = &off_100030D58;
}

unint64_t sub_10000D6F8()
{
  unint64_t result = qword_100034B60;
  if (!qword_100034B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B60);
  }
  return result;
}

uint64_t sub_10000D74C()
{
  return sub_10000FFA4((unint64_t *)&unk_100034B68);
}

uint64_t sub_10000D780()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035768);
  sub_100003FE8(v0, (uint64_t)qword_100035768);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10000D8C0()
{
  v1[14] = v0;
  uint64_t v2 = *(void *)(_s16ListTransactionsVMa() - 8);
  v1[15] = v2;
  v1[16] = *(void *)(v2 + 64);
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_10000D984, 0, 0);
}

uint64_t sub_10000D984()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = objc_allocWithZone((Class)FHDatabaseEntity);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithEntity:v5];

  BOOL v7 = self;
  sub_10000FFE8(v2, v1);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  sub_10001022C(v1, v9 + v8);
  v0[6] = sub_100010290;
  v0[7] = v9;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000E02C;
  v0[5] = &unk_1000313F0;
  uint64_t v10 = _Block_copy(v0 + 2);
  swift_release();
  uint64_t v11 = (void *)FHLogicalOperatorAnd;
  Class v12 = (Class)[v7 initWithBuilder:v10 logicalOperator:FHLogicalOperatorAnd];
  _Block_release(v10);
  if (v6)
  {
    id v13 = v6;
    id v14 = v11;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    v0[12] = sub_10000E098;
    v0[13] = 0;
    v0[8] = _NSConcreteStackBlock;
    v0[9] = 1107296256;
    v0[10] = sub_10000FBC0;
    v0[11] = &unk_100031418;
    uint64_t v16 = _Block_copy(v0 + 8);
    [v13 queryDataWithBlock:v12 logicalOperator:v14 selectFields:isa usingBlock:v16];

    _Block_release(v16);
    Class v12 = isa;
  }

  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_10000DC28(void *a1)
{
  sub_100004084(&qword_1000346F0);
  Option.wrappedValue.getter();
  swift_bridgeObjectRelease();
  uint64_t v2 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0) {
    uint64_t v2 = *(void *)v15 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    if (a1)
    {
      id v3 = FHComparisonOperatorEquals;
      NSString v4 = String._bridgeToObjectiveC()();
      Option.wrappedValue.getter();
      NSString v5 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [a1 addStringClause:v3 fieldName:v4 expression:v5];
    }
  }
  else
  {
    if (a1)
    {
      id v6 = FHComparisonOperatorEquals;
      NSString v7 = String._bridgeToObjectiveC()();
      _s16ListTransactionsVMa();
      sub_100004084(&qword_100034A78);
      Option.wrappedValue.getter();
      [a1 addIntegerClause:v6 fieldName:v7 expression:v15[0] + 1];
    }
    _s16ListTransactionsVMa();
    Option.wrappedValue.getter();
    swift_bridgeObjectRelease();
    uint64_t v8 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0) {
      uint64_t v8 = *(void *)v15 & 0xFFFFFFFFFFFFLL;
    }
    if (a1 && v8)
    {
      id v9 = FHComparisonOperatorLike;
      NSString v10 = String._bridgeToObjectiveC()();
      Option.wrappedValue.getter();
      NSString v11 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [a1 addStringClause:v9 fieldName:v10 expression:v11];
    }
    sub_100004084(&qword_100034A80);
    Option.wrappedValue.getter();
    switch(v15[0])
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (a1 && (v12 & 1) == 0)
        {
          id v13 = FHComparisonOperatorEquals;
          NSString v14 = String._bridgeToObjectiveC()();
          Option.wrappedValue.getter();
          [a1 addIntegerClause:v13 fieldName:v14 expression:v15[0]];
        }
        break;
      default:
        swift_bridgeObjectRelease();
        break;
    }
  }
}

void sub_10000E02C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000E098(uint64_t result)
{
  if (result)
  {
    id v1 = objc_allocWithZone((Class)NSArray);
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v3 = [v1 initWithArray:isa];

    sub_100004084(&qword_100034B88);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100028910;
    *(void *)(inited + 32) = 0x746361736E617254;
    *(void *)(inited + 40) = 0xEF2E6F4E206E6F69;
    *(_DWORD *)(inited + 48) = [v3 unsignedIntAtIndex:0];
    *(void *)(inited + 72) = &type metadata for UInt32;
    *(void *)(inited + 80) = 0xD000000000000011;
    *(void *)(inited + 88) = 0x800000010002B790;
    id v5 = [v3 stringAtIndex:1];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v9 = v8;

      NSString v10 = (uint64_t *)(inited + 96);
      *(void *)(inited + 120) = &type metadata for String;
      if (v9)
      {
        *NSString v10 = v7;
        goto LABEL_7;
      }
    }
    else
    {
      NSString v10 = (uint64_t *)(inited + 96);
      *(void *)(inited + 120) = &type metadata for String;
    }
    *NSString v10 = 9;
    unint64_t v9 = 0xE100000000000000;
LABEL_7:
    *(void *)(inited + 104) = v9;
    strcpy((char *)(inited + 128), "Account Type");
    *(unsigned char *)(inited + 141) = 0;
    *(_WORD *)(inited + 142) = -5120;
    id v11 = [v3 stringAtIndex:3];
    if (v11)
    {
      char v12 = v11;
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      unint64_t v16 = (uint64_t *)(inited + 144);
      *(void *)(inited + 168) = &type metadata for String;
      if (v15)
      {
        *unint64_t v16 = v13;
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v16 = (uint64_t *)(inited + 144);
      *(void *)(inited + 168) = &type metadata for String;
    }
    *unint64_t v16 = 9;
    unint64_t v15 = 0xE100000000000000;
LABEL_12:
    *(void *)(inited + 152) = v15;
    *(void *)(inited + 176) = 0x746E756F6D41;
    *(void *)(inited + 184) = 0xE600000000000000;
    id v17 = [v3 stringAtIndex:2];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v21 = v20;

      uint64_t v22 = (uint64_t *)(inited + 192);
      *(void *)(inited + 216) = &type metadata for String;
      if (v21)
      {
        *uint64_t v22 = v19;
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v22 = (uint64_t *)(inited + 192);
      *(void *)(inited + 216) = &type metadata for String;
    }
    *uint64_t v22 = 9;
    unint64_t v21 = 0xE100000000000000;
LABEL_17:
    *(void *)(inited + 200) = v21;
    *(void *)(inited + 224) = 0x79726F6765746143;
    *(void *)(inited + 232) = 0xE800000000000000;
    id v23 = [v3 stringAtIndex:4];
    if (v23)
    {
      Class v24 = v23;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v27 = v26;

      uint64_t v28 = (uint64_t *)(inited + 240);
      *(void *)(inited + 264) = &type metadata for String;
      if (v27)
      {
        uint64_t *v28 = v25;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v28 = (uint64_t *)(inited + 240);
      *(void *)(inited + 264) = &type metadata for String;
    }
    uint64_t *v28 = 9;
    unint64_t v27 = 0xE100000000000000;
LABEL_22:
    *(void *)(inited + 248) = v27;
    *(void *)(inited + 272) = 0x746E61686372654DLL;
    *(void *)(inited + 280) = 0xE800000000000000;
    id v29 = [v3 stringAtIndex:5];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v33 = v32;

      uint64_t v34 = (uint64_t *)(inited + 288);
      *(void *)(inited + 312) = &type metadata for String;
      if (v33)
      {
        *uint64_t v34 = v31;
LABEL_27:
        *(void *)(inited + 296) = v33;
        sub_10000E4C8(inited);
        sub_100004084(&qword_1000352D0);
        uint64_t v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = xmmword_100028A20;
        _StringGuts.grow(_:)(20);
        swift_bridgeObjectRelease();
        v36._countAndFlagsBits = Dictionary.description.getter();
        String.append(_:)(v36);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(void *)(v35 + 56) = &type metadata for String;
        *(void *)(v35 + 32) = 0xD000000000000012;
        *(void *)(v35 + 40) = 0x800000010002B7B0;
        print(_:separator:terminator:)();

        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v34 = (uint64_t *)(inited + 288);
      *(void *)(inited + 312) = &type metadata for String;
    }
    *uint64_t v34 = 9;
    unint64_t v33 = 0xE100000000000000;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000E4C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004084(&qword_100034B90);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
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
    sub_100010390(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100010318(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000103F8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10000E5F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  uint64_t v2 = sub_100004084(&qword_1000347C8);
  uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v50 = v3;
  unint64_t v52 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (char *)v43 - v52;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v5 = type metadata accessor for ArgumentHelp();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v54 = v6 + 56;
  uint64_t v55 = v7;
  uint64_t v51 = v5;
  v7(v4, 0, 1, v5);
  uint64_t v8 = sub_100004084(&qword_1000347D0);
  uint64_t v53 = *(void *)(*(void *)(v8 - 8) + 64);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v44 = v10;
  uint64_t v46 = type metadata accessor for CompletionKind();
  uint64_t v11 = *(void *)(v46 - 8);
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v49 = v11 + 56;
  v56((char *)v43 - v10, 1, 1, v46);
  uint64_t v12 = type metadata accessor for NameSpecification();
  uint64_t v13 = *(void *)(*(void *)(v12 - 8) + 64);
  __chkstk_darwin(v12 - 8);
  v43[1] = v13;
  unint64_t v45 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v14 = type metadata accessor for SingleValueParsingStrategy();
  uint64_t v47 = *(void *)(*(void *)(v14 - 8) + 64);
  __chkstk_darwin(v14 - 8);
  unint64_t v48 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  static SingleValueParsingStrategy.next.getter();
  uint64_t v58 = a1;
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v57 = (int *)_s16ListTransactionsVMa();
  v43[0] = a1 + v57[5];
  LOBYTE(v59) = 1;
  __chkstk_darwin(v57);
  unint64_t v16 = v52;
  ArgumentHelp.init(stringLiteral:)();
  long long v17 = v55;
  uint64_t v18 = v55((char *)v43 - v16, 0, 1, v5);
  __chkstk_darwin(v18);
  uint64_t v19 = (char *)v43 - v10;
  uint64_t v20 = v46;
  uint64_t v21 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v56)(v19, 1, 1, v46);
  __chkstk_darwin(v21);
  uint64_t v22 = static NameSpecification.long.getter();
  __chkstk_darwin(v22);
  static SingleValueParsingStrategy.next.getter();
  sub_1000104EC();
  uint64_t v23 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  v43[0] = v58 + v57[6];
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  __chkstk_darwin(v23);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v24 = v17((char *)v43 - v16, 0, 1, v51);
  __chkstk_darwin(v24);
  unint64_t v25 = v44;
  uint64_t v26 = v20;
  unint64_t v27 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v56;
  uint64_t v28 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v56)((char *)v43 - v44, 1, 1, v26);
  __chkstk_darwin(v28);
  uint64_t v29 = static NameSpecification.long.getter();
  __chkstk_darwin(v29);
  static SingleValueParsingStrategy.next.getter();
  uint64_t v30 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  v43[0] = v58 + v57[7];
  LOBYTE(v59) = 0;
  __chkstk_darwin(v30);
  uint64_t v31 = (char *)v43 - v52;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v32 = v55(v31, 0, 1, v51);
  __chkstk_darwin(v32);
  unint64_t v33 = (char *)v43 - v25;
  uint64_t v34 = v46;
  uint64_t v35 = v27(v33, 1, 1, v46);
  __chkstk_darwin(v35);
  uint64_t v36 = static NameSpecification.long.getter();
  __chkstk_darwin(v36);
  static SingleValueParsingStrategy.next.getter();
  sub_100010540();
  uint64_t v37 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v59 = 30;
  __chkstk_darwin(v37);
  char v38 = (char *)v43 - v52;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v39 = v55(v38, 0, 1, v51);
  __chkstk_darwin(v39);
  uint64_t v40 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v56)((char *)v43 - v44, 1, 1, v34);
  __chkstk_darwin(v40);
  uint64_t v41 = static NameSpecification.long.getter();
  __chkstk_darwin(v41);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(wrappedValue:name:parsing:help:completion:)();
}

uint64_t sub_10000ED90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v79 = a1;
  uint64_t v72 = a2;
  uint64_t v75 = sub_100004084(&qword_100034BA0);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  v80 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = _s16ListTransactionsVMa() - 8;
  v83 = (int *)v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  uint64_t v6 = sub_100004084(&qword_1000347C8);
  uint64_t v84 = *(void *)(*(void *)(v6 - 8) + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v90 = type metadata accessor for ArgumentHelp();
  uint64_t v10 = *(void *)(v90 - 8);
  v86 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  uint64_t v91 = v10 + 56;
  v86(v8, 0, 1, v90);
  uint64_t v11 = sub_100004084(&qword_1000347D0);
  uint64_t v12 = *(void *)(*(void *)(v11 - 8) + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v81 = v12;
  unint64_t v85 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)&v71 - v85;
  uint64_t v88 = type metadata accessor for CompletionKind();
  uint64_t v14 = *(void *)(v88 - 8);
  v94 = *(uint64_t **)(v14 + 56);
  uint64_t v89 = v14 + 56;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v94)(v13, 1, 1, v88);
  uint64_t v15 = type metadata accessor for NameSpecification();
  uint64_t v93 = *(void *)(*(void *)(v15 - 8) + 64);
  __chkstk_darwin(v15 - 8);
  unint64_t v87 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v17 = type metadata accessor for SingleValueParsingStrategy();
  uint64_t v92 = *(void *)(*(void *)(v17 - 8) + 64);
  __chkstk_darwin(v17 - 8);
  unint64_t v98 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  static SingleValueParsingStrategy.next.getter();
  v95 = v5;
  uint64_t v19 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v20 = &v5[*(int *)(v3 + 28)];
  LOBYTE(v96) = 1;
  __chkstk_darwin(v19);
  unint64_t v82 = v9;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v21 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v86;
  uint64_t v22 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v86)((char *)&v71 - v9, 0, 1, v90);
  __chkstk_darwin(v22);
  unint64_t v23 = v85;
  uint64_t v24 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v94)((char *)&v71 - v85, 1, 1, v88);
  __chkstk_darwin(v24);
  uint64_t v25 = static NameSpecification.long.getter();
  __chkstk_darwin(v25);
  static SingleValueParsingStrategy.next.getter();
  sub_1000104EC();
  uint64_t v73 = v20;
  uint64_t v26 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  v78 = &v95[v83[8]];
  uint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  __chkstk_darwin(v26);
  ArgumentHelp.init(stringLiteral:)();
  unint64_t v27 = (char *)&v71 - v9;
  uint64_t v28 = v90;
  uint64_t v29 = v21(v27, 0, 1, v90);
  __chkstk_darwin(v29);
  uint64_t v30 = (char *)&v71 - v23;
  uint64_t v31 = v88;
  uint64_t v32 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v94)(v30, 1, 1, v88);
  __chkstk_darwin(v32);
  uint64_t v33 = static NameSpecification.long.getter();
  __chkstk_darwin(v33);
  static SingleValueParsingStrategy.next.getter();
  uint64_t v34 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  v77 = &v95[v83[9]];
  LOBYTE(v96) = 0;
  __chkstk_darwin(v34);
  uint64_t v35 = (char *)&v71 - v82;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v36 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v86)(v35, 0, 1, v28);
  __chkstk_darwin(v36);
  uint64_t v37 = v31;
  char v38 = v94;
  uint64_t v39 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v94)((char *)&v71 - v85, 1, 1, v37);
  __chkstk_darwin(v39);
  uint64_t v40 = static NameSpecification.long.getter();
  __chkstk_darwin(v40);
  static SingleValueParsingStrategy.next.getter();
  sub_100010540();
  uint64_t v41 = (uint64_t)v95;
  uint64_t v42 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  unint64_t v43 = v41 + v83[10];
  uint64_t v96 = 30;
  __chkstk_darwin(v42);
  unint64_t v44 = (char *)&v71 - v82;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v45 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v86)(v44, 0, 1, v90);
  uint64_t v46 = v79;
  __chkstk_darwin(v45);
  uint64_t v47 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v38)((char *)&v71 - v85, 1, 1, v88);
  __chkstk_darwin(v47);
  uint64_t v48 = static NameSpecification.long.getter();
  __chkstk_darwin(v48);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  sub_100006118(v46, v46[3]);
  sub_100010594();
  uint64_t v49 = v76;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v49)
  {
    unint64_t v98 = v43;
    uint64_t v50 = sub_100004084(&qword_1000346F0);
    uint64_t v51 = *(void *)(v50 - 8);
    uint64_t v52 = *(void *)(v51 + 64);
    __chkstk_darwin(v50);
    LOBYTE(v96) = 0;
    uint64_t v53 = sub_100010644((unint64_t *)&qword_1000347E8, &qword_1000346F0);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v93 = v53;
    uint64_t v54 = *(void (**)(char *, char *, uint64_t))(v51 + 40);
    v54(v95, (char *)&v71 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), v50);
    uint64_t v55 = sub_100004084(&qword_100034A78);
    v94 = &v71;
    uint64_t v56 = *(void *)(v55 - 8);
    __chkstk_darwin(v55);
    uint64_t v58 = (char *)&v71 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v96) = 1;
    sub_100010644(&qword_100034BC0, &qword_100034A78);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v59 = (*(uint64_t (**)(char *, char *, uint64_t))(v56 + 40))(v73, v58, v55);
    __chkstk_darwin(v59);
    LOBYTE(v96) = 2;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v54(v78, (char *)&v71 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), v50);
    uint64_t v60 = sub_100004084(&qword_100034A80);
    uint64_t v61 = *(void *)(v60 - 8);
    __chkstk_darwin(v60);
    v63 = (char *)&v71 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v96) = 3;
    sub_100010644(&qword_100034BC8, &qword_100034A80);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v61 + 40))(v77, v63, v60);
    uint64_t v65 = sub_100004084(&qword_1000346F8);
    uint64_t v66 = *(void *)(v65 - 8);
    __chkstk_darwin(v65);
    uint64_t v68 = (char *)&v71 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v96) = 4;
    sub_100010644(&qword_1000347F0, &qword_1000346F8);
    uint64_t v69 = v75;
    id v70 = v80;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v70, v69);
    uint64_t v46 = v79;
    uint64_t v41 = (uint64_t)v95;
    (*(void (**)(unint64_t, char *, uint64_t))(v66 + 40))(v98, v68, v65);
    sub_10000FFE8(v41, v72);
  }
  sub_100004110((uint64_t)v46);
  return sub_1000105E8(v41);
}

uint64_t sub_10000FBC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a3)
  {
LABEL_3:
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_4:
  swift_retain();
  v6(v7, v5, a4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

BOOL sub_10000FC84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000FC98()
{
  uint64_t result = 0x4449656372756F73;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x54746E756F636361;
      break;
    case 2:
      uint64_t result = 0x746E61686372656DLL;
      break;
    case 3:
      uint64_t result = 0x79726F6765746163;
      break;
    case 4:
      uint64_t result = 0x746E756F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000FD40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100010B14(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000FD68(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10000FD74(uint64_t a1)
{
  unint64_t v2 = sub_100010594();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000FDB0(uint64_t a1)
{
  unint64_t v2 = sub_100010594();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000FDEC()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *id v1 = v0;
  v1[1] = sub_100005E80;
  return sub_10000D8C0();
}

uint64_t sub_10000FE78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000ED90(a1, a2);
}

uint64_t sub_10000FE90@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034620 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035768);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10000FF3C()
{
  return sub_10000FFA4(&qword_100034958);
}

uint64_t sub_10000FF70()
{
  return sub_10000FFA4(&qword_100034B78);
}

uint64_t sub_10000FFA4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s16ListTransactionsVMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s16ListTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001004C()
{
  id v1 = (int *)(_s16ListTransactionsVMa() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_100004084(&qword_1000346F0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  uint64_t v9 = v6 + v1[7];
  uint64_t v10 = sub_100004084(&qword_100034A78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v8(v6 + v1[8], v7);
  uint64_t v11 = v6 + v1[9];
  uint64_t v12 = sub_100004084(&qword_100034A80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v6 + v1[10];
  uint64_t v14 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10001022C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s16ListTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100010290(void *a1)
{
  _s16ListTransactionsVMa();
  sub_10000DC28(a1);
}

uint64_t sub_100010300(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010310()
{
  return swift_release();
}

unint64_t sub_100010318(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100010408(a1, a2, v4);
}

uint64_t sub_100010390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000103F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100010408(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000104EC()
{
  unint64_t result = qword_100034BA8;
  if (!qword_100034BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BA8);
  }
  return result;
}

unint64_t sub_100010540()
{
  unint64_t result = qword_100034BB0;
  if (!qword_100034BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BB0);
  }
  return result;
}

unint64_t sub_100010594()
{
  unint64_t result = qword_100034BB8;
  if (!qword_100034BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BB8);
  }
  return result;
}

uint64_t sub_1000105E8(uint64_t a1)
{
  uint64_t v2 = _s16ListTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010644(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000620C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100010688(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030BD0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

unint64_t sub_1000106D4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030C78, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

unint64_t sub_100010720()
{
  unint64_t result = qword_100034BD0;
  if (!qword_100034BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BD0);
  }
  return result;
}

unint64_t sub_100010774()
{
  unint64_t result = qword_100034BD8;
  if (!qword_100034BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BD8);
  }
  return result;
}

unint64_t sub_1000107C8()
{
  unint64_t result = qword_100034BE0;
  if (!qword_100034BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BE0);
  }
  return result;
}

unint64_t sub_10001081C()
{
  unint64_t result = qword_100034BE8;
  if (!qword_100034BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BE8);
  }
  return result;
}

uint64_t _s16ListTransactionsV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16ListTransactionsV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000109CCLL);
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

unsigned char *sub_1000109F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s16ListTransactionsV10CodingKeysOMa()
{
  return &_s16ListTransactionsV10CodingKeysON;
}

unint64_t sub_100010A10()
{
  unint64_t result = qword_100034BF0;
  if (!qword_100034BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BF0);
  }
  return result;
}

unint64_t sub_100010A68()
{
  unint64_t result = qword_100034BF8;
  if (!qword_100034BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034BF8);
  }
  return result;
}

unint64_t sub_100010AC0()
{
  unint64_t result = qword_100034C00;
  if (!qword_100034C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034C00);
  }
  return result;
}

uint64_t sub_100010B14(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449656372756F73 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x54746E756F636361 && a2 == 0xEB00000000657079 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E61686372656DLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t *sub_100010D54(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100004084(&qword_100034810);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    BOOL v14 = (char *)a2 + v12;
    uint64_t v15 = sub_100004084(&qword_100034C08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_100004084(&qword_100034C10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_100004084(&qword_1000346F8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[9];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = sub_100004084(&qword_100034C18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t sub_100010F68(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_100004084(&qword_100034C08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_100004084(&qword_100034C10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = sub_100004084(&qword_1000346F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[9];
  uint64_t v13 = sub_100004084(&qword_100034C18);
  BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
  return v14(v12, v13);
}

void *sub_1000110FC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100004084(&qword_100034810);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100034C08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100004084(&qword_100034C10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_100004084(&qword_1000346F8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_100004084(&qword_100034C18);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

void *sub_1000112C0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100004084(&qword_100034810);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100004084(&qword_100034C08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100004084(&qword_100034C10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_100004084(&qword_1000346F8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = sub_100004084(&qword_100034C18);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(v23, v24, v25);
  return a1;
}

_OWORD *sub_100011498(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100004084(&qword_100034810);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100004084(&qword_100034C08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100004084(&qword_100034C10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = sub_100004084(&qword_1000346F8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = sub_100004084(&qword_100034C18);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

void *sub_100011658(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100034810);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100034C08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100004084(&qword_100034C10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  uint64_t v22 = sub_100004084(&qword_1000346F8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_100004084(&qword_100034C18);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  return a1;
}

uint64_t sub_100011820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011834);
}

uint64_t sub_100011834(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_100004084(&qword_100034810);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_13:
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v15(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_100004084(&qword_100034C08);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_13;
  }
  uint64_t v13 = sub_100004084(&qword_100034C10);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_13;
  }
  uint64_t v14 = sub_100004084(&qword_1000346F8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_13;
  }
  uint64_t v16 = sub_100004084(&qword_100034C18);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[9];
  return v17(v19, a2, v18);
}

uint64_t sub_100011A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011A6C);
}

uint64_t sub_100011A6C(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_100004084(&qword_100034810);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_11:
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v15(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_100004084(&qword_100034C08);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_11;
  }
  uint64_t v13 = sub_100004084(&qword_100034C10);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_11;
  }
  uint64_t v14 = sub_100004084(&qword_1000346F8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a3)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_11;
  }
  uint64_t v16 = sub_100004084(&qword_100034C18);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = v5 + a4[9];
  return v17(v19, a2, a2, v18);
}

uint64_t _s16SpendingInsightsVMa()
{
  uint64_t result = qword_100034C78;
  if (!qword_100034C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100011CDC()
{
  sub_100006EAC();
  if (v0 <= 0x3F)
  {
    sub_100011EC4(319, &qword_100034C88, (uint64_t)&_s16SpendingInsightsV11InsightTypeON, (uint64_t (*)(void, uint64_t))&type metadata accessor for Option);
    if (v1 <= 0x3F)
    {
      sub_100011EC4(319, &qword_100034C90, (uint64_t)&_s16SpendingInsightsV11TrendWindowON, (uint64_t (*)(void, uint64_t))&type metadata accessor for Option);
      if (v2 <= 0x3F)
      {
        sub_100011EC4(319, (unint64_t *)&unk_100034770, (uint64_t)&type metadata for Int, (uint64_t (*)(void, uint64_t))&type metadata accessor for Option);
        if (v3 <= 0x3F)
        {
          sub_100011EC4(319, (unint64_t *)&unk_100034C98, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Flag);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_100011EC4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *_s16SpendingInsightsV11TrendWindowOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100011FDCLL);
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

ValueMetadata *_s16SpendingInsightsV11TrendWindowOMa()
{
  return &_s16SpendingInsightsV11TrendWindowON;
}

ValueMetadata *_s16SpendingInsightsV11InsightTypeOMa()
{
  return &_s16SpendingInsightsV11InsightTypeON;
}

uint64_t sub_10001202C()
{
  return sub_10000D2E4(&qword_100034CD8, &qword_100034CE0);
}

uint64_t sub_100012054(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6D79615072656570;
  unint64_t v3 = 0xEB00000000746E65;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6D79615072656570;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x79617764616F7262;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x73676E69766173;
      break;
    case 3:
      uint64_t v5 = 0x6E6E6F436B6E6162;
      unint64_t v3 = 0xEB00000000746365;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xEB00000000746E65;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x79617764616F7262) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x73676E69766173;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEB00000000746365;
      if (v5 == 0x6E6E6F436B6E6162) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100012200(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x44646E41646F6F66;
      unint64_t v3 = 0xED0000736B6E6972;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x676E6970706F6873;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6C6576617274;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7365636976726573;
      break;
    case 5:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7239014;
      break;
    case 6:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x68746C616568;
      break;
    case 7:
      uint64_t v5 = 0x726F70736E617274;
      unint64_t v3 = 0xE900000000000074;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED0000736B6E6972;
      if (v5 == 0x44646E41646F6F66) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x676E6970706F6873) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6C6576617274) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7365636976726573) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 7239014) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x68746C616568;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xE900000000000074;
      if (v5 != 0x726F70736E617274) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10001248C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000067;
  uint64_t v3 = 0x6E6967617373654DLL;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x686372616553;
    }
    else {
      uint64_t v5 = 0x20746E656D796150;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xEC000000676E6952;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6E6967617373654DLL;
  unint64_t v6 = 0xE900000000000067;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x686372616553;
    }
    else {
      uint64_t v3 = 0x20746E656D796150;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE600000000000000;
    }
    else {
      unint64_t v2 = 0xEC000000676E6952;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1000125B0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701736302;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1701736302;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v6 = 1801807223;
      goto LABEL_5;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x796C68746E6F6DLL;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v6 = 1918985593;
LABEL_5:
      unint64_t v5 = v6 & 0xFFFF0000FFFFFFFFLL | 0x796C00000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 1801807223;
      goto LABEL_12;
    case 2:
      unint64_t v7 = 0xE700000000000000;
      uint64_t v2 = 0x796C68746E6F6DLL;
      goto LABEL_9;
    case 3:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 1918985593;
LABEL_12:
      if (v5 == (v8 & 0xFFFF0000FFFFFFFFLL | 0x796C00000000)) {
        goto LABEL_13;
      }
      goto LABEL_15;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_15;
      }
LABEL_13:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_15:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_100012710(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x800000010002B1C0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "FHInsightTypeCategorySpend";
      goto LABEL_7;
    case 2:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "FHInsightTypeMerchantSpend";
      goto LABEL_7;
    case 3:
      uint64_t v6 = "FHInsightTypeAggregateTag";
      goto LABEL_7;
    case 4:
      unint64_t v5 = 0xD000000000000018;
      uint64_t v6 = "FHInsightTypeCompoundTag";
      goto LABEL_7;
    case 5:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "FHInsightTypeNone";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000010002B1C0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001ALL;
      uint64_t v8 = "FHInsightTypeCategorySpend";
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD00000000000001ALL;
      uint64_t v8 = "FHInsightTypeMerchantSpend";
      goto LABEL_14;
    case 3:
      uint64_t v8 = "FHInsightTypeAggregateTag";
      goto LABEL_14;
    case 4:
      unint64_t v2 = 0xD000000000000018;
      uint64_t v8 = "FHInsightTypeCompoundTag";
      goto LABEL_14;
    case 5:
      unint64_t v2 = 0xD000000000000011;
      uint64_t v8 = "FHInsightTypeNone";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_1000128B4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000129B4()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100012AEC()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100012BCC()
{
  return Hasher._finalize()();
}

Swift::Int sub_100012CC8()
{
  return Hasher._finalize()();
}

uint64_t sub_100012E10()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035780);
  sub_100003FE8(v0, (uint64_t)qword_100035780);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  unint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

unint64_t sub_100012F58(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100013004(unsigned __int8 *a1, char *a2)
{
  return sub_100012710(*a1, *a2);
}

Swift::Int sub_100013010()
{
  return sub_1000128B4();
}

uint64_t sub_100013018()
{
  return sub_100012AEC();
}

Swift::Int sub_100013020()
{
  return sub_100012BCC();
}

unint64_t sub_100013028@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000180F4(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100013058@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100012F58(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100013084()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t sub_1000130EC()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t sub_100013134(uint64_t a1, uint64_t a2)
{
  return sub_100013618(a1, a2, (void (*)(void))sub_100018234, (void (*)(void))sub_100018288);
}

uint64_t sub_100013160()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

void sub_1000131A8(void *a1@<X8>)
{
  *a1 = &off_100030EB0;
}

unint64_t sub_1000131BC()
{
  unint64_t result = qword_100034CE8;
  if (!qword_100034CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034CE8);
  }
  return result;
}

uint64_t sub_100013210()
{
  return sub_10000D2E4(&qword_100034CF0, &qword_100034CF8);
}

uint64_t sub_100013238(unsigned __int8 *a1, char *a2)
{
  return sub_1000125B0(*a1, *a2);
}

Swift::Int sub_100013244()
{
  return Hasher._finalize()();
}

uint64_t sub_10001330C()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000133BC()
{
  return Hasher._finalize()();
}

unint64_t sub_100013480@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100018140(*a1);
  *a2 = result;
  return result;
}

void sub_1000134B0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701736302;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE600000000000000;
      uint64_t v3 = 0x796C6B656577;
      goto LABEL_3;
    case 2:
      *a1 = 0x796C68746E6F6DLL;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x796C72616579;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10001353C()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t sub_1000135A4()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t sub_1000135EC(uint64_t a1, uint64_t a2)
{
  return sub_100013618(a1, a2, (void (*)(void))sub_10001818C, (void (*)(void))sub_1000181E0);
}

uint64_t sub_100013618(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  return static ExpressibleByArgument<>.allValueStrings.getter();
}

uint64_t sub_100013680()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

void sub_1000136C8(void *a1@<X8>)
{
  *a1 = &off_100030F58;
}

unint64_t sub_1000136DC()
{
  unint64_t result = qword_100034D00;
  if (!qword_100034D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D00);
  }
  return result;
}

uint64_t sub_100013730()
{
  v1[25] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  sub_100004084(&qword_100034A28);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  return _swift_task_switch(sub_100013858, 0, 0);
}

uint64_t sub_100013858()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  *(void *)(v0 + 288) = sub_100004084(&qword_1000352D0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100028A20;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD000000000000015;
  *(void *)(v2 + 40) = 0x800000010002B830;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD0000000000000E9;
  *(void *)(v3 + 40) = 0x800000010002B850;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v4 = _s16SpendingInsightsVMa();
  *(void *)(v0 + 296) = v4;
  sub_100004084(&qword_1000346F8);
  Option.wrappedValue.getter();
  uint64_t v5 = *(void *)(v0 + 184);
  *(void *)(v0 + 304) = v5;
  if (v5 < 1)
  {
    __break(1u);
    JUMPOUT(0x100013E64);
  }
  *(_DWORD *)(v0 + 352) = *(_DWORD *)(v4 + 28);
  uint64_t v6 = 1;
  while (1)
  {
    *(void *)(v0 + 312) = v6;
    uint64_t v8 = *(void *)(v0 + 256);
    uint64_t v7 = *(void *)(v0 + 264);
    *(void *)(v0 + 320) = sub_100004084(&qword_100034C10);
    Option.wrappedValue.getter();
    sub_100014BA0(v7, v8, *(unsigned char *)(v0 + 357), v6);
    Option.wrappedValue.getter();
    uint64_t v9 = *(unsigned __int8 *)(v0 + 361);
    uint64_t v10 = *(void *)(v0 + 248);
    uint64_t v11 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 216);
    sub_10000B6A0(*(void *)(v0 + 264), v10);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    int v14 = v13(v10, 1, v11);
    uint64_t v15 = *(void *)(v0 + 256);
    if (v14 != 1) {
      break;
    }
    uint64_t v16 = (uint64_t *)(v0 + 248);
LABEL_7:
    sub_10000B640(v15);
    uint64_t v20 = *v16;
    uint64_t v22 = *(void *)(v0 + 304);
    uint64_t v21 = *(void *)(v0 + 312);
    sub_10000B640(*(void *)(v0 + 264));
    sub_10000B640(v20);
    if (v21 == v22) {
      goto LABEL_11;
    }
    uint64_t v23 = *(void *)(v0 + 312);
    uint64_t v6 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
LABEL_11:
      uint64_t v24 = *(void **)(v0 + 280);
      uint64_t v25 = *(void **)(v0 + 272);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_100028A20;
      *(void *)(v26 + 56) = &type metadata for String;
      *(void *)(v26 + 32) = 0xD00000000000001BLL;
      *(void *)(v26 + 40) = 0x800000010002B940;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
      return v27();
    }
  }
  uint64_t v17 = *(void *)(v0 + 240);
  uint64_t v18 = *(void *)(v0 + 208);
  uint64_t v19 = *(void (**)(void, void, uint64_t))(*(void *)(v0 + 216) + 32);
  v19(*(void *)(v0 + 232), *(void *)(v0 + 248), v18);
  sub_10000B6A0(v15, v17);
  if (v13(v17, 1, v18) == 1)
  {
    uint64_t v15 = *(void *)(v0 + 256);
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 208));
    uint64_t v16 = (uint64_t *)(v0 + 240);
    goto LABEL_7;
  }
  v19(*(void *)(v0 + 224), *(void *)(v0 + 240), *(void *)(v0 + 208));
  v37.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  *(NSDate *)(v0 + 328) = v37;
  v29.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  *(NSDate *)(v0 + 336) = v29;
  sub_100004084(&qword_1000348D8);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_100028A20;
  sub_100004084(&qword_100034C08);
  Option.wrappedValue.getter();
  unint64_t v31 = 0x800000010002B1C0;
  unint64_t v32 = 0xD000000000000019;
  switch(*(unsigned char *)(v0 + 356))
  {
    case 1:
      unint64_t v32 = 0xD00000000000001ALL;
      uint64_t v33 = "FHInsightTypeCategorySpend";
      goto LABEL_20;
    case 2:
      unint64_t v32 = 0xD00000000000001ALL;
      uint64_t v33 = "FHInsightTypeMerchantSpend";
      goto LABEL_20;
    case 3:
      uint64_t v33 = "FHInsightTypeAggregateTag";
      goto LABEL_20;
    case 4:
      unint64_t v32 = 0xD000000000000018;
      uint64_t v33 = "FHInsightTypeCompoundTag";
      goto LABEL_20;
    case 5:
      unint64_t v32 = 0xD000000000000011;
      uint64_t v33 = "FHInsightTypeNone";
LABEL_20:
      unint64_t v31 = (unint64_t)(v33 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  uint64_t v34 = *(void **)(v0 + 280);
  *(void *)(v30 + 32) = v32;
  *(void *)(v30 + 40) = v31;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 344) = isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 192;
  *(void *)(v0 + 24) = sub_100013E7C;
  uint64_t v36 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100015C4C;
  *(void *)(v0 + 104) = &unk_1000315F0;
  *(void *)(v0 + 112) = v36;
  [v34 allFeatureInsightsWithStartDate:v37.super.isa endDate:v29.super.isa insightTypeItems:isa trendWindow:v9 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100013E7C()
{
  return _swift_task_switch(sub_100013F5C, 0, 0);
}

uint64_t sub_100013F5C()
{
  unint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void **)(v0 + 336);
  uint64_t v3 = *(void **)(v0 + 328);

  unint64_t v99 = v1;
  if (v1)
  {
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100028A20;
    *(void *)(v0 + 152) = 0;
    *(void *)(v0 + 160) = 0xE000000000000000;
    _StringGuts.grow(_:)(52);
    *(void *)(v0 + 168) = *(void *)(v0 + 152);
    *(void *)(v0 + 176) = *(void *)(v0 + 160);
    v5._countAndFlagsBits = 0xD000000000000015;
    v5._object = (void *)0x800000010002B980;
    String.append(_:)(v5);
    Option.wrappedValue.getter();
    *(unsigned char *)(v0 + 358) = *(unsigned char *)(v0 + 362);
    _print_unlocked<A, B>(_:_:)();
    v6._countAndFlagsBits = 0xD000000000000012;
    v6._object = (void *)0x800000010002B9A0;
    String.append(_:)(v6);
    id v7 = [objc_allocWithZone((Class)NSDateFormatter) init];
    NSString v8 = String._bridgeToObjectiveC()();
    [v7 setDateFormat:v8];

    Class isa = Date._bridgeToObjectiveC()().super.isa;
    id v10 = [v7 stringFromDate:isa];

    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    v14._countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 2108704;
    v15._object = (void *)0xE300000000000000;
    String.append(_:)(v15);
    id v16 = [objc_allocWithZone((Class)NSDateFormatter) init];
    NSString v17 = String._bridgeToObjectiveC()();
    [v16 setDateFormat:v17];

    Class v18 = Date._bridgeToObjectiveC()().super.isa;
    id v19 = [v16 stringFromDate:v18];

    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;

    v23._countAndFlagsBits = v20;
    v23._object = v22;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    v24._countAndFlagsBits = 1027423520;
    v24._object = (void *)0xE400000000000000;
    String.append(_:)(v24);
    uint64_t v25 = *(void *)(v0 + 168);
    uint64_t v26 = *(void *)(v0 + 176);
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 32) = v25;
    *(void *)(v4 + 40) = v26;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_100004084(&qword_100034C18);
    Flag.wrappedValue.getter();
    if (*(unsigned char *)(v0 + 359) == 1)
    {
      uint64_t v27 = *(uint64_t **)(v0 + 200);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_100028A20;
      *(void *)(v0 + 120) = 0;
      *(void *)(v0 + 128) = 0xE000000000000000;
      _StringGuts.grow(_:)(155);
      uint64_t v29 = *(void *)(v0 + 128);
      *(void *)(v0 + 136) = *(void *)(v0 + 120);
      *(void *)(v0 + 144) = v29;
      v30._countAndFlagsBits = 0x7461447472617473;
      v30._object = (void *)0xE900000000000065;
      String.append(_:)(v30);
      uint64_t v32 = *v27;
      unint64_t v31 = (void *)v27[1];
      swift_bridgeObjectRetain();
      v33._countAndFlagsBits = v32;
      v33._object = v31;
      String.append(_:)(v33);
      swift_bridgeObjectRelease();
      v34._countAndFlagsBits = 0x65746144646E65;
      v34._object = (void *)0xE700000000000000;
      String.append(_:)(v34);
      swift_bridgeObjectRetain();
      v35._countAndFlagsBits = v32;
      v35._object = v31;
      String.append(_:)(v35);
      swift_bridgeObjectRelease();
      v36._countAndFlagsBits = 1701869940;
      v36._object = (void *)0xE400000000000000;
      String.append(_:)(v36);
      swift_bridgeObjectRetain();
      v37._countAndFlagsBits = v32;
      v37._object = v31;
      String.append(_:)(v37);
      swift_bridgeObjectRelease();
      v38._object = (void *)0xE90000000000006ELL;
      v38._countAndFlagsBits = 0x6F69746365726964;
      String.append(_:)(v38);
      swift_bridgeObjectRetain();
      v39._countAndFlagsBits = v32;
      v39._object = v31;
      String.append(_:)(v39);
      swift_bridgeObjectRelease();
      v40._countAndFlagsBits = 0x6F6D41646E657073;
      v40._object = (void *)0xEB00000000746E75;
      String.append(_:)(v40);
      swift_bridgeObjectRetain();
      v41._countAndFlagsBits = v32;
      v41._object = v31;
      String.append(_:)(v41);
      swift_bridgeObjectRelease();
      v42._object = (void *)0x800000010002B9E0;
      v42._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v42);
      swift_bridgeObjectRetain();
      v43._countAndFlagsBits = v32;
      v43._object = v31;
      String.append(_:)(v43);
      swift_bridgeObjectRelease();
      v44._countAndFlagsBits = 0xD00000000000001ELL;
      v44._object = (void *)0x800000010002BA00;
      String.append(_:)(v44);
      swift_bridgeObjectRetain();
      v45._countAndFlagsBits = v32;
      v45._object = v31;
      String.append(_:)(v45);
      swift_bridgeObjectRelease();
      v46._object = (void *)0x800000010002BA20;
      v46._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v46);
      swift_bridgeObjectRetain();
      v47._countAndFlagsBits = v32;
      v47._object = v31;
      String.append(_:)(v47);
      swift_bridgeObjectRelease();
      v48._countAndFlagsBits = 0x746E61686372656DLL;
      v48._object = (void *)0xED00003F656D614ELL;
      String.append(_:)(v48);
      swift_bridgeObjectRetain();
      v49._countAndFlagsBits = v32;
      v49._object = v31;
      String.append(_:)(v49);
      swift_bridgeObjectRelease();
      v50._countAndFlagsBits = 0x6154686372616573;
      v50._object = (void *)0xEE003F656D614E67;
      String.append(_:)(v50);
      swift_bridgeObjectRetain();
      v51._countAndFlagsBits = v32;
      v51._object = v31;
      String.append(_:)(v51);
      swift_bridgeObjectRelease();
      uint64_t v52 = *(void *)(v0 + 136);
      uint64_t v53 = *(void *)(v0 + 144);
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 32) = v52;
      *(void *)(v28 + 40) = v53;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
    }
    if (v99 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v54 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v54) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v54 = *(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v54)
      {
LABEL_6:
        if (v54 < 1)
        {
LABEL_39:
          __break(1u);
          JUMPOUT(0x100014B88);
        }
        uint64_t v55 = 0;
        do
        {
          if ((v99 & 0xC000000000000001) != 0) {
            id v58 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v58 = *(id *)(v99 + 8 * v55 + 32);
          }
          uint64_t v59 = v58;
          uint64_t v60 = swift_allocObject();
          *(_OWORD *)(v60 + 16) = xmmword_100028A20;
          Flag.wrappedValue.getter();
          if (*(unsigned char *)(v0 + 360) == 1)
          {
            id v57 = sub_100015CCC(v59);
            *(void *)(v60 + 40) = v61;
            uint64_t v56 = &type metadata for String;
          }
          else
          {
            uint64_t v56 = (void *)sub_100017E94();
            id v57 = v59;
          }
          ++v55;
          *(void *)(v60 + 56) = v56;
          *(void *)(v60 + 32) = v57;
          print(_:separator:terminator:)();
          swift_bridgeObjectRelease();
        }
        while (v54 != v55);
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v62 = *(void *)(v0 + 232);
  uint64_t v63 = *(void *)(v0 + 208);
  id v64 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 216) + 8);
  v64(*(void *)(v0 + 224), v63);
  v64(v62, v63);
  uint64_t v65 = *(void *)(v0 + 264);
  uint64_t v67 = *(void *)(v0 + 304);
  uint64_t v66 = *(void *)(v0 + 312);
  sub_10000B640(*(void *)(v0 + 256));
  sub_10000B640(v65);
  if (v66 == v67)
  {
LABEL_18:
    uint64_t v68 = *(void **)(v0 + 280);
    uint64_t v69 = *(void **)(v0 + 272);
    uint64_t v70 = swift_allocObject();
    *(_OWORD *)(v70 + 16) = xmmword_100028A20;
    *(void *)(v70 + 56) = &type metadata for String;
    *(void *)(v70 + 32) = 0xD00000000000001BLL;
    *(void *)(v70 + 40) = 0x800000010002B940;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v71 = *(uint64_t (**)(void))(v0 + 8);
    return v71();
  }
  while (1)
  {
    uint64_t v77 = *(void *)(v0 + 312);
    uint64_t v78 = v77 + 1;
    if (__OFADD__(v77, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    *(void *)(v0 + 312) = v78;
    uint64_t v80 = *(void *)(v0 + 256);
    uint64_t v79 = *(void *)(v0 + 264);
    *(void *)(v0 + 320) = sub_100004084(&qword_100034C10);
    Option.wrappedValue.getter();
    sub_100014BA0(v79, v80, *(unsigned char *)(v0 + 357), v78);
    Option.wrappedValue.getter();
    uint64_t v81 = *(unsigned __int8 *)(v0 + 361);
    uint64_t v82 = *(void *)(v0 + 248);
    uint64_t v83 = *(void *)(v0 + 208);
    uint64_t v84 = *(void *)(v0 + 216);
    sub_10000B6A0(*(void *)(v0 + 264), v82);
    unint64_t v85 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v84 + 48);
    int v86 = v85(v82, 1, v83);
    uint64_t v87 = *(void *)(v0 + 256);
    if (v86 != 1) {
      break;
    }
    uint64_t v73 = (uint64_t *)(v0 + 248);
LABEL_23:
    sub_10000B640(v87);
    uint64_t v74 = *v73;
    uint64_t v76 = *(void *)(v0 + 304);
    uint64_t v75 = *(void *)(v0 + 312);
    sub_10000B640(*(void *)(v0 + 264));
    sub_10000B640(v74);
    if (v75 == v76) {
      goto LABEL_18;
    }
  }
  uint64_t v88 = *(void *)(v0 + 240);
  uint64_t v89 = *(void *)(v0 + 208);
  uint64_t v90 = *(void (**)(void, void, uint64_t))(*(void *)(v0 + 216) + 32);
  v90(*(void *)(v0 + 232), *(void *)(v0 + 248), v89);
  sub_10000B6A0(v87, v88);
  if (v85(v88, 1, v89) == 1)
  {
    uint64_t v87 = *(void *)(v0 + 256);
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 208));
    uint64_t v73 = (uint64_t *)(v0 + 240);
    goto LABEL_23;
  }
  v90(*(void *)(v0 + 224), *(void *)(v0 + 240), *(void *)(v0 + 208));
  v100.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  *(NSDate *)(v0 + 328) = v100;
  v91.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  *(NSDate *)(v0 + 336) = v91;
  sub_100004084(&qword_1000348D8);
  uint64_t v92 = swift_allocObject();
  *(_OWORD *)(v92 + 16) = xmmword_100028A20;
  sub_100004084(&qword_100034C08);
  Option.wrappedValue.getter();
  unint64_t v93 = 0xD000000000000019;
  unint64_t v94 = 0x800000010002B1C0;
  switch(*(unsigned char *)(v0 + 356))
  {
    case 1:
      unint64_t v93 = 0xD00000000000001ALL;
      v95 = "FHInsightTypeCategorySpend";
      goto LABEL_33;
    case 2:
      unint64_t v93 = 0xD00000000000001ALL;
      v95 = "FHInsightTypeMerchantSpend";
      goto LABEL_33;
    case 3:
      unint64_t v93 = 0xD000000000000019;
      v95 = "FHInsightTypeAggregateTag";
      goto LABEL_33;
    case 4:
      unint64_t v93 = 0xD000000000000018;
      v95 = "FHInsightTypeCompoundTag";
LABEL_33:
      unint64_t v94 = (unint64_t)(v95 - 32) | 0x8000000000000000;
      break;
    case 5:
      unint64_t v94 = 0x800000010002B260;
      unint64_t v93 = 0xD000000000000011;
      break;
    default:
      break;
  }
  uint64_t v96 = *(void **)(v0 + 280);
  *(void *)(v92 + 32) = v93;
  *(void *)(v92 + 40) = v94;
  Class v97 = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 344) = v97;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 192;
  *(void *)(v0 + 24) = sub_100013E7C;
  uint64_t v98 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100015C4C;
  *(void *)(v0 + 104) = &unk_1000315F0;
  *(void *)(v0 + 112) = v98;
  [v96 allFeatureInsightsWithStartDate:v100.super.isa endDate:v91.super.isa insightTypeItems:v97 trendWindow:v81 completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100014BA0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  v178 = (char *)a4;
  uint64_t v179 = a2;
  uint64_t v180 = a1;
  uint64_t v5 = type metadata accessor for Date();
  Swift::String v6 = *(void **)(v5 - 8);
  uint64_t v185 = v5;
  v186 = v6;
  __chkstk_darwin(v5);
  v177 = (char *)&v158 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Calendar.Component();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v166 = (char *)&v158 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v168 = (char *)&v158 - v13;
  __chkstk_darwin(v12);
  v184 = (char *)&v158 - v14;
  uint64_t v15 = type metadata accessor for Calendar();
  v181 = *(void (***)(char *, uint64_t))(v15 - 8);
  uint64_t v182 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  v165 = (char *)&v158 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  v167 = (char *)&v158 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v158 - v20;
  uint64_t v22 = sub_100004084(&qword_100034A28);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v26 = __chkstk_darwin(v25);
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v30 = __chkstk_darwin(v29);
  v174 = (char *)&v158 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  v172 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v158 - v33);
  uint64_t v34 = __chkstk_darwin(v32);
  v171 = (char *)&v158 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v170 = (uint64_t)&v158 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v173 = (void (*)(char *, uint64_t))((char *)&v158 - v39);
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v41 = __chkstk_darwin(v40);
  v176 = (char *)&v158 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  Swift::String v45 = (char *)&v158 - v44;
  uint64_t v46 = __chkstk_darwin(v43);
  Swift::String v48 = (char *)&v158 - v47;
  uint64_t v49 = __chkstk_darwin(v46);
  Swift::String v51 = (char *)&v158 - v50;
  uint64_t v52 = __chkstk_darwin(v49);
  v175 = (char *)&v158 - v53;
  __chkstk_darwin(v52);
  uint64_t v183 = (uint64_t)&v158 - v62;
  char v63 = a3;
  switch(a3)
  {
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      uint64_t v64 = v58;
      uint64_t v161 = v57;
      uint64_t v169 = v56;
      uint64_t v162 = v55;
      uint64_t v163 = v54;
      uint64_t v164 = v61;
      uint64_t v159 = v60;
      uint64_t v160 = v59;
      char v65 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v65)
      {
LABEL_4:
        static Calendar.current.getter();
        (*(void (**)(char *, void, uint64_t))(v9 + 104))(v184, enum case for Calendar.Component.day(_:), v8);
        if (__OFSUB__(v178, 1))
        {
          __break(1u);
        }
        else if ((unsigned __int128)((uint64_t)(v178 - 1) * (__int128)-7) >> 64 == (-7 * (uint64_t)(v178 - 1)) >> 63)
        {
          v174 = v48;
          v178 = v45;
          uint64_t v66 = v177;
          static Date.now.getter();
          uint64_t v67 = v183;
          uint64_t v68 = v184;
          Calendar.date(byAdding:value:to:wrappingComponents:)();
          uint64_t v69 = (void (*)(char *, uint64_t))v186[1];
          uint64_t v70 = v66;
          uint64_t v71 = v185;
          v69(v70, v185);
          (*(void (**)(char *, uint64_t))(v9 + 8))(v68, v8);
          v181[1](v21, v182);
          sub_10000B6A0(v67, (uint64_t)v51);
          uint64_t v72 = (uint64_t (*)(char *, uint64_t, uint64_t))v186[6];
          int v73 = v72(v51, 1, v71);
          v173 = v69;
          if (v73 == 1)
          {
            Class isa = 0;
          }
          else
          {
            Class isa = Date._bridgeToObjectiveC()().super.isa;
            v69(v51, v71);
          }
          uint64_t v75 = (uint64_t)v175;
          uint64_t v76 = (uint64_t)v178;
          id v77 = (id)FHDateStartOfWeekOnMonday();

          uint64_t v78 = v179;
          uint64_t v79 = (uint64_t)v174;
          if (v77)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v80 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v186[7];
            uint64_t v81 = (char *)v79;
            uint64_t v82 = 0;
          }
          else
          {
            uint64_t v80 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v186[7];
            uint64_t v81 = v174;
            uint64_t v82 = 1;
          }
          uint64_t v83 = v185;
          v80(v81, v82, 1, v185);
          sub_100017ED4(v79, v75, &qword_100034A28);
          sub_10000B6A0(v75, v76);
          if (v72((char *)v76, 1, v83) == 1)
          {
            Class v84 = 0;
          }
          else
          {
            uint64_t v85 = v83;
            Class v84 = Date._bridgeToObjectiveC()().super.isa;
            v173((char *)v76, v85);
          }
          uint64_t v86 = v180;
          uint64_t v87 = (uint64_t)v176;
          id v88 = (id)FHDateEndOfWeekStartingOnMonday();

          if (v88)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v89 = 0;
          }
          else
          {
            uint64_t v89 = 1;
          }
          sub_10000B640(v183);
          v80((char *)v87, v89, 1, v185);
          sub_100017ED4(v87, v78, &qword_100034A28);
          uint64_t v90 = v75;
          goto LABEL_37;
        }
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        JUMPOUT(0x100015C1CLL);
      }
      switch(v63)
      {
        case 0:
        case 1:
        case 3:
          char v91 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v91) {
            goto LABEL_22;
          }
          uint64_t v107 = v9;
          switch(v63)
          {
            case 0:
            case 1:
            case 2:
              char v118 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              v119 = v181;
              if (v118) {
                goto LABEL_44;
              }
              uint64_t v120 = v185;
              v121 = (char *)v186[7];
              v186 += 7;
              v184 = v121;
              ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v121)(v180, 1, 1, v185);
              uint64_t v122 = v179;
              v123 = v184;
              return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v123)(v122, 1, 1, v120);
            case 3:
              swift_bridgeObjectRelease();
              v119 = v181;
LABEL_44:
              static Calendar.current.getter();
              int v124 = enum case for Calendar.Component.year(_:);
              v125 = *(void (***)(char *, uint64_t))(v9 + 104);
              ((void (*)(char *, void, uint64_t))v125)(v184, enum case for Calendar.Component.year(_:), v8);
              if (__OFSUB__(v178, 1)) {
                goto LABEL_58;
              }
              LODWORD(v175) = v124;
              v181 = v125;
              uint64_t v183 = v9 + 104;
              uint64_t v126 = v182;
              if (v178 == (char *)0x8000000000000001) {
                goto LABEL_59;
              }
              v127 = v177;
              static Date.now.getter();
              v178 = (char *)v64;
              v128 = v184;
              Calendar.date(byAdding:value:to:wrappingComponents:)();
              uint64_t v129 = v185;
              v130 = (char *)(v186 + 1);
              v131 = v127;
              v132 = (void (*)(char *, uint64_t))v186[1];
              v132(v131, v185);
              v133 = v128;
              v134 = *(void (**)(char *, uint64_t))(v107 + 8);
              v177 = (char *)(v107 + 8);
              v134(v133, v8);
              v135 = v119[1];
              v135(v21, v126);
              uint64_t v136 = v161;
              sub_10000B6A0((uint64_t)v178, v161);
              v137 = v186 + 6;
              v138 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v186[6];
              int v139 = v138(v136, 1, v129);
              Class v140 = 0;
              if (v139 != 1)
              {
                Class v140 = Date._bridgeToObjectiveC()().super.isa;
                v132((char *)v136, v185);
              }
              v184 = (char *)v132;
              id v141 = (id)FHStartOfYear();

              v176 = v130;
              v174 = (char *)v134;
              if (v141)
              {
                uint64_t v142 = v162;
                static Date._unconditionallyBridgeFromObjectiveC(_:)();

                uint64_t v143 = 0;
              }
              else
              {
                uint64_t v143 = 1;
                uint64_t v142 = v162;
              }
              v172 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v138;
              v173 = v135;
              uint64_t v144 = v185;
              ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v186[7])(v142, v143, 1, v185);
              uint64_t v145 = v164;
              sub_100017ED4(v142, v164, &qword_100034A28);
              v146 = v167;
              static Calendar.current.getter();
              v147 = v168;
              ((void (*)(char *, void, uint64_t))v181)(v168, v175, v8);
              uint64_t v148 = v163;
              sub_10000B6A0(v145, v163);
              int v149 = v138(v148, 1, v144);
              v186 = v137;
              if (v149 == 1) {
                goto LABEL_60;
              }
              uint64_t v150 = v159;
              Calendar.date(byAdding:value:to:wrappingComponents:)();
              v151 = (void (*)(char *, uint64_t))v174;
              ((void (*)(char *, uint64_t))v174)(v147, v8);
              v152 = v146;
              v153 = v173;
              v173(v152, v182);
              uint64_t v154 = v185;
              ((void (*)(uint64_t, uint64_t))v184)(v148, v185);
              v155 = v165;
              static Calendar.current.getter();
              v156 = v166;
              ((void (*)(char *, void, uint64_t))v181)(v166, enum case for Calendar.Component.second(_:), v8);
              uint64_t v157 = v160;
              sub_10000B6A0(v150, v160);
              if (v172(v157, 1, v154) == 1) {
                goto LABEL_61;
              }
              Calendar.date(byAdding:value:to:wrappingComponents:)();
              v151(v156, v8);
              v153(v155, v182);
              sub_10000B640(v150);
              sub_10000B640((uint64_t)v178);
              ((void (*)(uint64_t, uint64_t))v184)(v157, v185);
              uint64_t v90 = v164;
              uint64_t v116 = v180;
              break;
            default:
              goto LABEL_62;
          }
          return sub_100017ED4(v90, v116, &qword_100034A28);
        case 2:
          swift_bridgeObjectRelease();
LABEL_22:
          static Calendar.current.getter();
          (*(void (**)(char *, void, uint64_t))(v9 + 104))(v184, enum case for Calendar.Component.month(_:), v8);
          if (__OFSUB__(v178, 1)) {
            goto LABEL_56;
          }
          if (v178 == (char *)0x8000000000000001) {
            goto LABEL_57;
          }
          uint64_t v92 = v177;
          static Date.now.getter();
          uint64_t v93 = v169;
          unint64_t v94 = v184;
          Calendar.date(byAdding:value:to:wrappingComponents:)();
          uint64_t v95 = v185;
          uint64_t v96 = (void (*)(char *, uint64_t))v186[1];
          v96(v92, v185);
          (*(void (**)(char *, uint64_t))(v9 + 8))(v94, v8);
          v181[1](v21, v182);
          uint64_t v97 = v170;
          sub_10000B6A0(v93, v170);
          uint64_t v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v186[6];
          int v99 = v98(v97, 1, v95);
          Class v100 = 0;
          if (v99 != 1)
          {
            Class v100 = Date._bridgeToObjectiveC()().super.isa;
            v96((char *)v97, v185);
          }
          id v101 = (id)FHDateStartOfMonth();

          uint64_t v102 = (uint64_t)v173;
          uint64_t v103 = (uint64_t)v171;
          if (v101)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v104 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v186[7];
            v105 = (char *)v103;
            uint64_t v106 = 0;
          }
          else
          {
            v104 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v186[7];
            v105 = v171;
            uint64_t v106 = 1;
          }
          uint64_t v108 = v185;
          v104(v105, v106, 1, v185);
          uint64_t v109 = (uint64_t)v172;
          sub_100017ED4(v103, v102, &qword_100034A28);
          sub_10000B6A0(v102, v109);
          if (v98(v109, 1, v108) == 1)
          {
            Class v110 = 0;
          }
          else
          {
            uint64_t v111 = v108;
            Class v110 = Date._bridgeToObjectiveC()().super.isa;
            v96((char *)v109, v111);
          }
          uint64_t v86 = v180;
          uint64_t v112 = (uint64_t)v174;
          id v113 = (id)FHDateEndOfMonth();

          uint64_t v114 = v179;
          if (v113)
          {
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v115 = 0;
          }
          else
          {
            uint64_t v115 = 1;
          }
          sub_10000B640(v169);
          v104((char *)v112, v115, 1, v185);
          sub_100017ED4(v112, v114, &qword_100034A28);
          uint64_t v90 = v102;
          break;
        default:
LABEL_62:
          JUMPOUT(0);
      }
LABEL_37:
      uint64_t v116 = v86;
      return sub_100017ED4(v90, v116, &qword_100034A28);
  }
}

uint64_t sub_100015C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100017E94();
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v5 = v3;
  sub_100017ED4((uint64_t)&v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_100034D40);
  return swift_continuation_resume();
}

id sub_100015CCC(void *a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004084(&qword_100034A28);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v97 - v10;
  uint64_t v106 = 0;
  unint64_t v107 = 0xE000000000000000;
  id v12 = [a1 startDate];
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1, 1, v2);
    goto LABEL_35;
  }
  uint64_t v13 = v12;
  uint64_t v102 = v9;
  id v103 = a1;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  int v99 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  Class v100 = v5;
  v99(v11, v5, v2);
  id v101 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v101(v11, 0, 1, v2);
  uint64_t v98 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v98(v11, 1, v2) == 1)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v14 = [objc_allocWithZone((Class)NSDateFormatter) init];
  v97[1] = ") between dates : ";
  NSString v15 = String._bridgeToObjectiveC()();
  [v14 setDateFormat:v15];

  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v17 = [v14 stringFromDate:isa];

  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;

  uint64_t v21 = *(void (**)(char *, uint64_t))(v3 + 8);
  v97[2] = v3 + 8;
  v97[0] = v21;
  v21(v11, v2);
  uint64_t v22 = *v104;
  uint64_t v23 = (void *)v104[1];
  v105._countAndFlagsBits = v18;
  v105._object = v20;
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = v22;
  v24._object = v23;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  id v25 = v103;
  id v26 = [v103 endDate];
  if (!v26)
  {
LABEL_36:
    id result = (id)v101(v102, 1, 1, v2);
    goto LABEL_37;
  }
  uint64_t v27 = v26;
  uint64_t v28 = v100;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v29 = v102;
  v99(v102, v28, v2);
  v101(v29, 0, 1, v2);
  id result = (id)((uint64_t (*)(char *, uint64_t, uint64_t))v98)(v29, 1, v2);
  if (result == 1)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v31 = [objc_allocWithZone((Class)NSDateFormatter) init];
  NSString v32 = String._bridgeToObjectiveC()();
  [v31 setDateFormat:v32];

  Class v33 = Date._bridgeToObjectiveC()().super.isa;
  id v34 = [v31 stringFromDate:v33];

  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v37 = v36;

  ((void (*)(char *, uint64_t))v97[0])(v29, v2);
  uint64_t v38 = *v104;
  uint64_t v39 = (void *)v104[1];
  v105._countAndFlagsBits = v35;
  v105._object = v37;
  swift_bridgeObjectRetain();
  v40._countAndFlagsBits = v38;
  v40._object = v39;
  String.append(_:)(v40);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  id result = [v25 type];
  if (!result)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v41 = result;
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v44 = v43;

  v105._countAndFlagsBits = v42;
  v105._object = v44;
  swift_bridgeObjectRetain();
  v45._countAndFlagsBits = v38;
  v45._object = v39;
  String.append(_:)(v45);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  v105._countAndFlagsBits = (uint64_t)[v25 direction];
  type metadata accessor for FHInsightTrendDirection(0);
  v105._countAndFlagsBits = String.init<A>(describing:)();
  v105._object = v46;
  swift_bridgeObjectRetain();
  v47._countAndFlagsBits = v38;
  v47._object = v39;
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  id v48 = [v25 spendAmount];

  if (v48)
  {
    id result = [v25 spendAmount];
    if (result)
    {
      uint64_t v49 = result;
      id v50 = [result description];
      uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v53 = v52;

      goto LABEL_10;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v51 = 0;
  uint64_t v53 = (void *)0xE000000000000000;
LABEL_10:
  v105._countAndFlagsBits = v51;
  v105._object = v53;
  swift_bridgeObjectRetain();
  v54._countAndFlagsBits = v38;
  v54._object = v39;
  String.append(_:)(v54);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  id v55 = [v25 spendingInsightAmount];

  if (v55)
  {
    id result = [v25 spendingInsightAmount];
    if (result)
    {
      uint64_t v56 = result;
      id v57 = [result description];
      uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v60 = v59;

      goto LABEL_14;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v58 = 0;
  uint64_t v60 = (void *)0xE000000000000000;
LABEL_14:
  v105._countAndFlagsBits = v58;
  v105._object = v60;
  swift_bridgeObjectRetain();
  v61._countAndFlagsBits = v38;
  v61._object = v39;
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  id v62 = [v25 spendingInsightPercentageValue];

  if (!v62)
  {
    uint64_t v65 = 0;
    uint64_t v67 = (void *)0xE000000000000000;
    goto LABEL_18;
  }
  id result = [v25 spendingInsightPercentageValue];
  if (!result)
  {
LABEL_41:
    __break(1u);
    return result;
  }
  char v63 = result;
  id v64 = [result description];
  uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v67 = v66;

LABEL_18:
  v105._countAndFlagsBits = v65;
  v105._object = v67;
  swift_bridgeObjectRetain();
  v68._countAndFlagsBits = v38;
  v68._object = v39;
  String.append(_:)(v68);
  swift_bridgeObjectRelease();
  String.append(_:)(v105);
  swift_bridgeObjectRelease();
  self;
  uint64_t v69 = swift_dynamicCastObjCClass();
  if (v69)
  {
    uint64_t v70 = (void *)v69;
    id v71 = v25;
    v105._countAndFlagsBits = (uint64_t)[v70 merchantCategory];
    type metadata accessor for FHMerchantCategory(0);
    v105._countAndFlagsBits = String.init<A>(describing:)();
    v105._object = v72;
    swift_bridgeObjectRetain();
    v73._countAndFlagsBits = v38;
    v73._object = v39;
    String.append(_:)(v73);
    swift_bridgeObjectRelease();
    String.append(_:)(v105);

    swift_bridgeObjectRelease();
  }
  else
  {
    v74._countAndFlagsBits = v38;
    v74._object = v39;
    String.append(_:)(v74);
  }
  self;
  uint64_t v75 = swift_dynamicCastObjCClass();
  if (v75)
  {
    uint64_t v76 = (void *)v75;
    id v77 = v25;
    id v78 = [v76 merchantName];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v82 = v81;
    }
    else
    {
      uint64_t v80 = 0;
      uint64_t v82 = 0;
    }
    v105._countAndFlagsBits = v80;
    v105._object = v82;
    sub_100004084(&qword_100034D38);
    v105._countAndFlagsBits = String.init<A>(describing:)();
    v105._object = v84;
    swift_bridgeObjectRetain();
    v85._countAndFlagsBits = v38;
    v85._object = v39;
    String.append(_:)(v85);
    swift_bridgeObjectRelease();
    String.append(_:)(v105);

    swift_bridgeObjectRelease();
  }
  else
  {
    v83._countAndFlagsBits = v38;
    v83._object = v39;
    String.append(_:)(v83);
  }
  self;
  uint64_t v86 = swift_dynamicCastObjCClass();
  if (v86)
  {
    uint64_t v87 = (void *)v86;
    id v88 = v25;
    id v89 = [v87 searchTagName];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v93 = v92;
    }
    else
    {
      uint64_t v91 = 0;
      uint64_t v93 = 0;
    }
    v105._countAndFlagsBits = v91;
    v105._object = v93;
    sub_100004084(&qword_100034D38);
    v105._countAndFlagsBits = String.init<A>(describing:)();
    v105._object = v95;
    swift_bridgeObjectRetain();
    v96._countAndFlagsBits = v38;
    v96._object = v39;
    String.append(_:)(v96);
    swift_bridgeObjectRelease();
    String.append(_:)(v105);

    swift_bridgeObjectRelease();
  }
  else
  {
    v94._countAndFlagsBits = v38;
    v94._object = v39;
    String.append(_:)(v94);
  }
  return (id)v106;
}

uint64_t sub_1000166C0@<X0>(void *a1@<X8>)
{
  *a1 = 124;
  a1[1] = 0xE100000000000000;
  uint64_t v44 = _s16SpendingInsightsVMa();
  uint64_t v2 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v2 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100017E4C((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  uint64_t v41 = (char *)a1 + *(int *)(v44 + 24);
  uint64_t v3 = a1;
  uint64_t v35 = a1;
  char v54 = 0;
  uint64_t v4 = sub_100004084(&qword_1000347C8);
  uint64_t v42 = *(void *)(*(void *)(v4 - 8) + 64);
  __chkstk_darwin(v4 - 8);
  unint64_t v43 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = (char *)&v35 - v43;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v7 = type metadata accessor for ArgumentHelp();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  uint64_t v40 = v8 + 56;
  uint64_t v36 = v7;
  v39(v6, 0, 1, v7);
  uint64_t v9 = sub_100004084(&qword_1000347D0);
  uint64_t v47 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  unint64_t v46 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (char *)&v35 - v46;
  uint64_t v51 = type metadata accessor for CompletionKind();
  uint64_t v12 = *(void *)(v51 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v49 = v12 + 56;
  id v50 = v13;
  v13(v11, 1, 1, v51);
  uint64_t v14 = type metadata accessor for NameSpecification();
  uint64_t v48 = *(void *)(*(void *)(v14 - 8) + 64);
  __chkstk_darwin(v14 - 8);
  unint64_t v45 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v16 = type metadata accessor for SingleValueParsingStrategy();
  uint64_t v17 = *(void *)(*(void *)(v16 - 8) + 64);
  __chkstk_darwin(v16 - 8);
  uint64_t v37 = v17;
  unint64_t v38 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  static SingleValueParsingStrategy.next.getter();
  sub_100017F38();
  uint64_t v18 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v19 = v44;
  uint64_t v41 = (char *)v3 + *(int *)(v44 + 28);
  char v53 = 1;
  __chkstk_darwin(v18);
  unint64_t v20 = v43;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v21 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v39;
  uint64_t v22 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v39)((char *)&v35 - v20, 0, 1, v7);
  __chkstk_darwin(v22);
  uint64_t v23 = v50((char *)&v35 - v46, 1, 1, v51);
  __chkstk_darwin(v23);
  uint64_t v24 = static NameSpecification.long.getter();
  __chkstk_darwin(v24);
  static SingleValueParsingStrategy.next.getter();
  sub_100017F8C();
  uint64_t v25 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v41 = (char *)v35 + *(int *)(v19 + 32);
  uint64_t v52 = 1;
  __chkstk_darwin(v25);
  ArgumentHelp.init(stringLiteral:)();
  id v26 = (char *)&v35 - v20;
  uint64_t v27 = v36;
  uint64_t v28 = v21(v26, 0, 1, v36);
  __chkstk_darwin(v28);
  uint64_t v29 = v50((char *)&v35 - v46, 1, 1, v51);
  __chkstk_darwin(v29);
  uint64_t v30 = static NameSpecification.long.getter();
  __chkstk_darwin(v30);
  static SingleValueParsingStrategy.next.getter();
  uint64_t v31 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  __chkstk_darwin(v31);
  NSString v32 = (char *)&v35 - v43;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v33 = v21(v32, 0, 1, v27);
  __chkstk_darwin(v33);
  static NameSpecification.long.getter();
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t sub_100016D4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a1;
  uint64_t v76 = a2;
  uint64_t v2 = sub_100004084(&qword_100034D58);
  uint64_t v79 = *(void *)(v2 - 8);
  uint64_t v80 = v2;
  __chkstk_darwin(v2);
  Swift::String v85 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s16SpendingInsightsVMa();
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (uint64_t *)((char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = 124;
  v7[1] = 0xE100000000000000;
  uint64_t v8 = v5;
  uint64_t v9 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v10 = v7;
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100017E4C((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  id v78 = v9;
  OptionGroup.init(title:visibility:)();
  uint64_t v12 = *(int *)(v8 + 32);
  uint64_t v13 = v8;
  uint64_t v86 = v8;
  Class v84 = (char *)v10 + v12;
  uint64_t v98 = v10;
  LOBYTE(v100) = 0;
  uint64_t v14 = sub_100004084(&qword_1000347C8);
  uint64_t v88 = *(void *)(*(void *)(v14 - 8) + 64);
  __chkstk_darwin(v14 - 8);
  unint64_t v99 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (char *)&v75 - v99;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v17 = type metadata accessor for ArgumentHelp();
  uint64_t v87 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v89 = v17;
  v87(v16, 0, 1, v17);
  uint64_t v18 = sub_100004084(&qword_1000347D0);
  uint64_t v96 = *(void *)(*(void *)(v18 - 8) + 64);
  __chkstk_darwin(v18 - 8);
  unint64_t v97 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v20 = (char *)&v75 - v97;
  uint64_t v94 = type metadata accessor for CompletionKind();
  uint64_t v21 = *(void *)(v94 - 8);
  uint64_t v93 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v95 = v21 + 56;
  v93(v20, 1, 1, v94);
  uint64_t v22 = type metadata accessor for NameSpecification();
  uint64_t v91 = *(void *)(*(void *)(v22 - 8) + 64);
  __chkstk_darwin(v22 - 8);
  unint64_t v92 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  static NameSpecification.long.getter();
  uint64_t v24 = type metadata accessor for SingleValueParsingStrategy();
  uint64_t v90 = *(void *)(*(void *)(v24 - 8) + 64);
  __chkstk_darwin(v24 - 8);
  unint64_t v81 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  static SingleValueParsingStrategy.next.getter();
  sub_100017F38();
  uint64_t v26 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v27 = (char *)v10 + *(int *)(v13 + 36);
  LOBYTE(v100) = 1;
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v75 - v99;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v29 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v87;
  uint64_t v30 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v87)(v28, 0, 1, v17);
  __chkstk_darwin(v30);
  uint64_t v31 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v93)((char *)&v75 - v97, 1, 1, v94);
  __chkstk_darwin(v31);
  uint64_t v32 = static NameSpecification.long.getter();
  __chkstk_darwin(v32);
  static SingleValueParsingStrategy.next.getter();
  sub_100017F8C();
  id v77 = v27;
  uint64_t v33 = v98;
  uint64_t v34 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v35 = (char *)v33 + *(int *)(v86 + 40);
  uint64_t v100 = 1;
  __chkstk_darwin(v34);
  uint64_t v36 = (char *)&v75 - v99;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v37 = v29(v36, 0, 1, v89);
  __chkstk_darwin(v37);
  uint64_t v38 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v93)((char *)&v75 - v97, 1, 1, v94);
  __chkstk_darwin(v38);
  uint64_t v39 = static NameSpecification.long.getter();
  __chkstk_darwin(v39);
  static SingleValueParsingStrategy.next.getter();
  unint64_t v97 = (unint64_t)v35;
  uint64_t v40 = v82;
  uint64_t v41 = Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  uint64_t v42 = (char *)v33 + *(int *)(v86 + 44);
  __chkstk_darwin(v41);
  unint64_t v43 = (char *)&v75 - v99;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v44 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v87)(v43, 0, 1, v89);
  __chkstk_darwin(v44);
  static NameSpecification.long.getter();
  unint64_t v45 = v42;
  Flag<A>.init(wrappedValue:name:help:)();
  sub_100006118(v40, v40[3]);
  sub_100017FE0();
  uint64_t v46 = v83;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v46)
  {
    sub_100004110((uint64_t)v40);
    Swift::String v74 = v98;
  }
  else
  {
    LOBYTE(v100) = 0;
    uint64_t v47 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v48 = v98;
    *uint64_t v98 = v47;
    v48[1] = v49;
    uint64_t v50 = sub_100004084(&qword_100034810);
    uint64_t v51 = *(void *)(v50 - 8);
    __chkstk_darwin(v50);
    char v53 = (char *)&v75 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v100) = 1;
    sub_100008E80((unint64_t *)&qword_100034908, &qword_100034810);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v51 + 40))(v78, v53, v50);
    uint64_t v54 = sub_100004084(&qword_100034C08);
    uint64_t v55 = *(void *)(v54 - 8);
    __chkstk_darwin(v54);
    id v57 = (char *)&v75 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v100) = 2;
    sub_100008E80(&qword_100034D68, &qword_100034C08);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v55 + 40))(v84, v57, v54);
    uint64_t v58 = sub_100004084(&qword_100034C10);
    uint64_t v59 = *(void *)(v58 - 8);
    __chkstk_darwin(v58);
    Swift::String v61 = (char *)&v75 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v100) = 3;
    sub_100008E80(&qword_100034D70, &qword_100034C10);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v77, v61, v58);
    uint64_t v62 = sub_100004084(&qword_1000346F8);
    uint64_t v63 = *(void *)(v62 - 8);
    __chkstk_darwin(v62);
    uint64_t v65 = (char *)&v75 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v100) = 4;
    sub_100008E80(&qword_1000347F0, &qword_1000346F8);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unint64_t, char *, uint64_t))(v63 + 40))(v97, v65, v62);
    uint64_t v67 = sub_100004084(&qword_100034C18);
    uint64_t v68 = *(void *)(v67 - 8);
    __chkstk_darwin(v67);
    uint64_t v70 = (char *)&v75 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v100) = 5;
    sub_100008E80(&qword_100034D78, &qword_100034C18);
    uint64_t v71 = v80;
    uint64_t v72 = v85;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v72, v71);
    (*(void (**)(char *, char *, uint64_t))(v68 + 40))(v45, v70, v67);
    Swift::String v73 = v98;
    sub_100018090((uint64_t)v98, v76);
    sub_100004110((uint64_t)v40);
    Swift::String v74 = v73;
  }
  return sub_100018034((uint64_t)v74);
}

uint64_t sub_100017A9C()
{
  uint64_t result = 0x6F74617261706573;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x704F6E6F6D6D6F63;
      break;
    case 2:
      uint64_t result = 0x5474686769736E69;
      break;
    case 3:
      uint64_t result = 0x6E6957646E657274;
      break;
    case 4:
      uint64_t result = 0x746E756F63;
      break;
    case 5:
      uint64_t result = 7762787;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100017B78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100018578(a1, a2);
  *a3 = result;
  return result;
}

void sub_100017BA0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100017BAC(uint64_t a1)
{
  unint64_t v2 = sub_100017FE0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017BE8(uint64_t a1)
{
  unint64_t v2 = sub_100017FE0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100017C24()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_100013730();
}

uint64_t sub_100017CB0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034628 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035780);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100017D5C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100016D4C(a1, a2);
}

uint64_t sub_100017D74()
{
  return sub_100017E4C(&qword_100034D08, (void (*)(uint64_t))_s16SpendingInsightsVMa);
}

uint64_t sub_100017DBC()
{
  return sub_100017E4C((unint64_t *)&qword_100034D10, (void (*)(uint64_t))_s16SpendingInsightsVMa);
}

uint64_t sub_100017E04()
{
  return sub_100017E4C(&qword_100034D20, (void (*)(uint64_t))_s16SpendingInsightsVMa);
}

uint64_t sub_100017E4C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100017E94()
{
  unint64_t result = qword_100034D30;
  if (!qword_100034D30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100034D30);
  }
  return result;
}

uint64_t sub_100017ED4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004084(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100017F38()
{
  unint64_t result = qword_100034D48;
  if (!qword_100034D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D48);
  }
  return result;
}

unint64_t sub_100017F8C()
{
  unint64_t result = qword_100034D50;
  if (!qword_100034D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D50);
  }
  return result;
}

unint64_t sub_100017FE0()
{
  unint64_t result = qword_100034D60;
  if (!qword_100034D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D60);
  }
  return result;
}

uint64_t sub_100018034(uint64_t a1)
{
  uint64_t v2 = _s16SpendingInsightsVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s16SpendingInsightsVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000180F4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030E00, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

unint64_t sub_100018140(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030ED8, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

unint64_t sub_10001818C()
{
  unint64_t result = qword_100034D80;
  if (!qword_100034D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D80);
  }
  return result;
}

unint64_t sub_1000181E0()
{
  unint64_t result = qword_100034D88;
  if (!qword_100034D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D88);
  }
  return result;
}

unint64_t sub_100018234()
{
  unint64_t result = qword_100034D90;
  if (!qword_100034D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D90);
  }
  return result;
}

unint64_t sub_100018288()
{
  unint64_t result = qword_100034D98;
  if (!qword_100034D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D98);
  }
  return result;
}

uint64_t _s16SpendingInsightsV11InsightTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s16SpendingInsightsV11InsightTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x100018438);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s16SpendingInsightsV10CodingKeysOMa()
{
  return &_s16SpendingInsightsV10CodingKeysON;
}

unint64_t sub_100018474()
{
  unint64_t result = qword_100034DA0;
  if (!qword_100034DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DA0);
  }
  return result;
}

unint64_t sub_1000184CC()
{
  unint64_t result = qword_100034DA8;
  if (!qword_100034DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DA8);
  }
  return result;
}

unint64_t sub_100018524()
{
  unint64_t result = qword_100034DB0;
  if (!qword_100034DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DB0);
  }
  return result;
}

uint64_t sub_100018578(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F74617261706573 && a2 == 0xE900000000000072;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x704F6E6F6D6D6F63 && a2 == 0xED0000736E6F6974 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x5474686769736E69 && a2 == 0xEB00000000657079 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6957646E657274 && a2 == 0xEB00000000776F64 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 7762787 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

ValueMetadata *_s9DeleteAllVMa()
{
  return &_s9DeleteAllVN;
}

uint64_t sub_100018854()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035798);
  sub_100003FE8(v0, (uint64_t)qword_100035798);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_1000189A0()
{
  int v3 = (uint64_t (__cdecl *)())((char *)&dword_100034DD0 + dword_100034DD0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return v3();
}

uint64_t sub_100018A40@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034630 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035798);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_100018AEC()
{
  unint64_t result = qword_100034DB8;
  if (!qword_100034DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DB8);
  }
  return result;
}

unint64_t sub_100018B48()
{
  unint64_t result = qword_100034DC8;
  if (!qword_100034DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034DC8);
  }
  return result;
}

uint64_t sub_100018B9C()
{
  return _swift_task_switch(sub_100018BB8, 0, 0);
}

uint64_t sub_100018BB8()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[15] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[16] = v2;
  v0[17] = sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000004ALL;
  *(void *)(v3 + 40) = 0x800000010002BAE0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 19;
  v0[3] = sub_100018D70;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000050EC;
  v0[13] = &unk_1000316B8;
  v0[14] = v4;
  [v2 deleteAllData:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100018D70()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    id v2 = sub_100018F54;
  }
  else {
    id v2 = sub_100018E80;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100018E80()
{
  uint64_t v1 = (void *)v0[16];
  id v2 = (void *)v0[15];
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000018;
  *(void *)(v3 + 40) = 0x800000010002BB30;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100018F54()
{
  uint64_t v1 = (void *)v0[15];
  id v2 = (void *)v0[16];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100018FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_10001903C(uint64_t a1)
{
  uint64_t v2 = sub_100004084(&qword_100034810);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_1000190A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001910C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100019174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000191DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100019244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019258);
}

uint64_t sub_100019258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1000192C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000192DC);
}

uint64_t sub_1000192DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s17RecomputeFeaturesVMa()
{
  uint64_t result = qword_100034E30;
  if (!qword_100034E30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001939C()
{
  sub_100006EAC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100019428()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000357B0);
  sub_100003FE8(v0, (uint64_t)qword_1000357B0);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100019574()
{
  *(void *)(v1 + 16) = v0;
  type metadata accessor for CommonOptions();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100019604, 0, 0);
}

uint64_t sub_100019604()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[4] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[5] = v2;
  v0[6] = sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000017;
  *(void *)(v3 + 40) = 0x800000010002BB90;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  [v2 sendAllTransactionFeatures];
  sub_100004084(&qword_100034810);
  OptionGroup.wrappedValue.getter();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100019780;
  return sub_10001E400(0, 1);
}

uint64_t sub_100019780()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  sub_10001A22C(v2, (uint64_t (*)(void))type metadata accessor for CommonOptions);
  if (v0) {
    uint64_t v3 = sub_1000199A0;
  }
  else {
    uint64_t v3 = sub_1000198C4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000198C4()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000001BLL;
  *(void *)(v3 + 40) = 0x800000010002BBB0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000199A0()
{
  uint64_t v1 = *(void **)(v0 + 32);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100019A14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_100004084(&qword_100034E88);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s17RecomputeFeaturesVMa();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001A190((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  sub_100006118(a1, a1[3]);
  sub_10001A1D8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v12 = sub_100004084(&qword_100034810);
    v16[1] = v16;
    v16[0] = *(void *)(v12 - 8);
    __chkstk_darwin(v12);
    uint64_t v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10001A28C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v16[0] + 40))(v10, v14, v12);
    sub_10001A2DC((uint64_t)v10, v17);
  }
  sub_100004110((uint64_t)a1);
  return sub_10001A22C((uint64_t)v10, (uint64_t (*)(void))_s17RecomputeFeaturesVMa);
}

uint64_t sub_100019D40()
{
  return 0x704F6E6F6D6D6F63;
}

uint64_t sub_100019D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x704F6E6F6D6D6F63 && a2 == 0xED0000736E6F6974)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100019E20(uint64_t a1)
{
  unint64_t v2 = sub_10001A1D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100019E5C(uint64_t a1)
{
  unint64_t v2 = sub_10001A1D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100019E98()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_100019574();
}

uint64_t sub_100019F24@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034638 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000357B0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100019FCC()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001A190((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  return OptionGroup.init(title:visibility:)();
}

uint64_t sub_10001A0A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100019A14(a1, a2);
}

uint64_t sub_10001A0B8()
{
  return sub_10001A190((unint64_t *)&unk_100034E68, (void (*)(uint64_t))_s17RecomputeFeaturesVMa);
}

uint64_t sub_10001A100()
{
  return sub_10001A190(&qword_1000346B0, (void (*)(uint64_t))_s17RecomputeFeaturesVMa);
}

uint64_t sub_10001A148()
{
  return sub_10001A190(&qword_100034E78, (void (*)(uint64_t))_s17RecomputeFeaturesVMa);
}

uint64_t sub_10001A190(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001A1D8()
{
  unint64_t result = qword_100034E90;
  if (!qword_100034E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034E90);
  }
  return result;
}

uint64_t sub_10001A22C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10001A28C()
{
  unint64_t result = qword_100034908;
  if (!qword_100034908)
  {
    sub_10000620C(&qword_100034810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034908);
  }
  return result;
}

uint64_t sub_10001A2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s17RecomputeFeaturesVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s17RecomputeFeaturesV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001A3DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s17RecomputeFeaturesV10CodingKeysOMa()
{
  return &_s17RecomputeFeaturesV10CodingKeysON;
}

unint64_t sub_10001A418()
{
  unint64_t result = qword_100034E98;
  if (!qword_100034E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034E98);
  }
  return result;
}

unint64_t sub_10001A470()
{
  unint64_t result = qword_100034EA0;
  if (!qword_100034EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EA0);
  }
  return result;
}

unint64_t sub_10001A4C8()
{
  unint64_t result = qword_100034EA8;
  if (!qword_100034EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EA8);
  }
  return result;
}

uint64_t sub_10001A51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A530);
}

uint64_t sub_10001A530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10001A5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A5B4);
}

uint64_t sub_10001A5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s17TopMapsCategoriesVMa()
{
  uint64_t result = qword_100034F08;
  if (!qword_100034F08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001A674()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000357C8);
  sub_100003FE8(v0, (uint64_t)qword_1000357C8);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10001A7C8()
{
  *(void *)(v1 + 128) = v0;
  type metadata accessor for CommonOptions();
  *(void *)(v1 + 136) = swift_task_alloc();
  return _swift_task_switch(sub_10001A858, 0, 0);
}

uint64_t sub_10001A858()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[18] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[19] = v2;
  v0[20] = sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000023;
  *(void *)(v3 + 40) = 0x800000010002BC30;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  v0[21] = v4;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10001AA34;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001B2F4;
  v0[13] = &unk_100031760;
  v0[14] = v5;
  [v2 getTopTransactionCategoriesWithCountryCode:v4 timeWindow:2 minRegularTransactionRatio:0 discretizedTimeOfDay:v0 + 10 completion:0.0];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10001AA34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    id v2 = sub_10001AEC4;
  }
  else {
    id v2 = sub_10001AB44;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001AB44()
{
  uint64_t v1 = (void *)v0[21];
  id v2 = (void *)v0[15];
  v0[23] = v2;

  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  id v4 = [v2 description];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v7;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_100004084(&qword_100034810);
  OptionGroup.wrappedValue.getter();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[24] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001AC90;
  return sub_10001E400(0, 1);
}

uint64_t sub_10001AC90()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  sub_10001B7C0(*(void *)(v2 + 136), (uint64_t (*)(void))type metadata accessor for CommonOptions);
  if (v0) {
    uint64_t v3 = sub_10001AF50;
  }
  else {
    uint64_t v3 = sub_10001ADD8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10001ADD8()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = (void *)v0[19];
  uint64_t v3 = (void *)v0[18];
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100028A20;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 32) = 0xD00000000000001CLL;
  *(void *)(v4 + 40) = 0x800000010002BC90;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10001AEC4()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v3 = (void *)v0[18];
  uint64_t v2 = (void *)v0[19];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10001AF50()
{
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = *(void **)(v0 + 152);

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001AFC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_100004084(&qword_100034F60);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s17TopMapsCategoriesVMa();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001B724((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  sub_100006118(a1, a1[3]);
  sub_10001B76C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v12 = sub_100004084(&qword_100034810);
    v16[1] = v16;
    v16[0] = *(void *)(v12 - 8);
    __chkstk_darwin(v12);
    uint64_t v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10001A28C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v16[0] + 40))(v10, v14, v12);
    sub_10001B820((uint64_t)v10, v17);
  }
  sub_100004110((uint64_t)a1);
  return sub_10001B7C0((uint64_t)v10, (uint64_t (*)(void))_s17TopMapsCategoriesVMa);
}

uint64_t sub_10001B2F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_10001B3B4(uint64_t a1)
{
  unint64_t v2 = sub_10001B76C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B3F0(uint64_t a1)
{
  unint64_t v2 = sub_10001B76C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001B42C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_10001A7C8();
}

uint64_t sub_10001B4B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034640 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000357C8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10001B560()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001B724((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  return OptionGroup.init(title:visibility:)();
}

uint64_t sub_10001B634@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001AFC8(a1, a2);
}

uint64_t sub_10001B64C()
{
  return sub_10001B724((unint64_t *)&unk_100034F40, (void (*)(uint64_t))_s17TopMapsCategoriesVMa);
}

uint64_t sub_10001B694()
{
  return sub_10001B724(&qword_1000346B8, (void (*)(uint64_t))_s17TopMapsCategoriesVMa);
}

uint64_t sub_10001B6DC()
{
  return sub_10001B724(&qword_100034F50, (void (*)(uint64_t))_s17TopMapsCategoriesVMa);
}

uint64_t sub_10001B724(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001B76C()
{
  unint64_t result = qword_100034F68;
  if (!qword_100034F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F68);
  }
  return result;
}

uint64_t sub_10001B7C0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001B820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s17TopMapsCategoriesVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s17TopMapsCategoriesV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001B920);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s17TopMapsCategoriesV10CodingKeysOMa()
{
  return &_s17TopMapsCategoriesV10CodingKeysON;
}

unint64_t sub_10001B95C()
{
  unint64_t result = qword_100034F70;
  if (!qword_100034F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F70);
  }
  return result;
}

unint64_t sub_10001B9B4()
{
  unint64_t result = qword_100034F78;
  if (!qword_100034F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F78);
  }
  return result;
}

unint64_t sub_10001BA0C()
{
  unint64_t result = qword_100034F80;
  if (!qword_100034F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034F80);
  }
  return result;
}

uint64_t sub_10001BA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001BA74);
}

uint64_t sub_10001BA74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10001BAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001BAF8);
}

uint64_t sub_10001BAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s19SendAllTransactionsVMa()
{
  uint64_t result = qword_100034FE0;
  if (!qword_100034FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001BBB8()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000357E0);
  sub_100003FE8(v0, (uint64_t)qword_1000357E0);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10001BD00()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  id v1 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v0];
  sub_100004084(&qword_1000352D0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100028A20;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD000000000000025;
  *(void *)(v2 + 40) = 0x800000010002BCB0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  [v1 sendAllTransactionFeatures];
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000003FLL;
  *(void *)(v3 + 40) = 0x800000010002BCE0;
  print(_:separator:terminator:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001BE64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_100004084(&qword_100035030);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s19SendAllTransactionsVMa();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001C500((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  sub_100006118(a1, a1[3]);
  sub_10001C554();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v12 = sub_100004084(&qword_100034810);
    v16[1] = v16;
    v16[0] = *(void *)(v12 - 8);
    __chkstk_darwin(v12);
    uint64_t v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10001A28C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v16[0] + 40))(v10, v14, v12);
    sub_10001C604((uint64_t)v10, v17);
  }
  sub_100004110((uint64_t)a1);
  return sub_10001C5A8((uint64_t)v10);
}

uint64_t sub_10001C17C(uint64_t a1)
{
  unint64_t v2 = sub_10001C554();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C1B8(uint64_t a1)
{
  unint64_t v2 = sub_10001C554();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C1F4()
{
  sub_10001BD00();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_10001C548(v1);
}

uint64_t sub_10001C27C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034648 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000357E0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10001C324()
{
  return sub_10001BD00();
}

uint64_t sub_10001C33C()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_10001C500((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  return OptionGroup.init(title:visibility:)();
}

uint64_t sub_10001C410@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001BE64(a1, a2);
}

uint64_t sub_10001C428()
{
  return sub_10001C500((unint64_t *)&unk_100035018, (void (*)(uint64_t))_s19SendAllTransactionsVMa);
}

uint64_t sub_10001C470()
{
  return sub_10001C500(&qword_1000346D0, (void (*)(uint64_t))_s19SendAllTransactionsVMa);
}

uint64_t sub_10001C4B8()
{
  return sub_10001C500(&qword_100035028, (void (*)(uint64_t))_s19SendAllTransactionsVMa);
}

uint64_t sub_10001C500(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001C548(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_10001C554()
{
  unint64_t result = qword_100035038;
  if (!qword_100035038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035038);
  }
  return result;
}

uint64_t sub_10001C5A8(uint64_t a1)
{
  uint64_t v2 = _s19SendAllTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001C604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s19SendAllTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s19SendAllTransactionsV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001C704);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s19SendAllTransactionsV10CodingKeysOMa()
{
  return &_s19SendAllTransactionsV10CodingKeysON;
}

unint64_t sub_10001C740()
{
  unint64_t result = qword_100035040;
  if (!qword_100035040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035040);
  }
  return result;
}

unint64_t sub_10001C798()
{
  unint64_t result = qword_100035048;
  if (!qword_100035048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035048);
  }
  return result;
}

unint64_t sub_10001C7F0()
{
  unint64_t result = qword_100035050;
  if (!qword_100035050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035050);
  }
  return result;
}

uint64_t sub_10001C844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001C858);
}

uint64_t sub_10001C858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10001C8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001C8DC);
}

uint64_t sub_10001C8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_1000346F0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s17DeleteForSourceIDVMa()
{
  uint64_t result = qword_1000350B0;
  if (!qword_1000350B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001C99C()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000357F8);
  sub_100003FE8(v0, (uint64_t)qword_1000357F8);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10001CAEC()
{
  *(void *)(v1 + 208) = v0;
  return _swift_task_switch(sub_10001CB0C, 0, 0);
}

uint64_t sub_10001CB0C()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[27] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[28] = v2;
  v0[29] = sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000036;
  *(void *)(v3 + 40) = 0x800000010002BDA0;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_100004084(&qword_1000348D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100028A20;
  sub_100004084(&qword_1000346F0);
  Option.wrappedValue.getter();
  uint64_t v5 = v0[22];
  *(void *)(inited + 32) = v0[21];
  *(void *)(inited + 40) = v5;
  sub_10001DAB8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v0[30] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 32;
  v0[3] = sub_10001CD74;
  uint64_t v7 = swift_continuation_init();
  v0[16] = _NSConcreteStackBlock;
  v0[17] = 0x40000000;
  v0[18] = sub_1000050EC;
  v0[19] = &unk_100031898;
  v0[20] = v7;
  [v2 deleteDataForPassesWithSourceIdentifiers:isa completion:v0 + 16];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10001CD74()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 248) = v1;
  if (v1) {
    id v2 = sub_10001CF60;
  }
  else {
    id v2 = sub_10001CE84;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001CE84()
{
  id v2 = *(void **)(v0 + 216);
  uint64_t v1 = *(void **)(v0 + 224);

  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000032;
  *(void *)(v3 + 40) = 0x800000010002BE20;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001CF60()
{
  id v2 = (void *)v0[30];
  uint64_t v1 = v0[31];
  uint64_t v3 = (void *)v0[28];
  uint64_t v4 = (void *)v0[27];
  swift_willThrow();

  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100028A20;
  _StringGuts.grow(_:)(60);
  v0[23] = 0;
  v0[24] = 0xE000000000000000;
  v6._object = (void *)0x800000010002BDE0;
  v6._countAndFlagsBits = 0xD00000000000003ALL;
  String.append(_:)(v6);
  v0[25] = v1;
  sub_100004084((uint64_t *)&unk_1000352E0);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v7 = v0[23];
  uint64_t v8 = v0[24];
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v8;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
  swift_errorRelease();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001D0C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v4 = sub_100004084(&qword_100035110);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s17DeleteForSourceIDVMa();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v13 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  uint64_t v14 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v18 - 8);
  static NameSpecification.long.getter();
  uint64_t v19 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v19 - 8);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(name:parsing:help:completion:)();
  sub_100006118(a1, a1[3]);
  sub_10001DC5C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v20 = sub_100004084(&qword_1000346F0);
    uint64_t v25 = (uint64_t)&v25;
    uint64_t v21 = *(void *)(v20 - 8);
    __chkstk_darwin(v20);
    uint64_t v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10000B7F8();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
    (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v9, v23, v20);
    sub_10001DD0C((uint64_t)v9, v26);
  }
  sub_100004110((uint64_t)a1);
  return sub_10001DCB0((uint64_t)v9);
}

uint64_t sub_10001D524()
{
  return 0x6449656372756F73;
}

uint64_t sub_10001D53C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6449656372756F73 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10001D5D4(uint64_t a1)
{
  unint64_t v2 = sub_10001DC5C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D610(uint64_t a1)
{
  unint64_t v2 = sub_10001DC5C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001D64C()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100005E80;
  v2[26] = v0;
  return _swift_task_switch(sub_10001CB0C, 0, 0);
}

uint64_t sub_10001D6F4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034650 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000357F8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_10001D79C()
{
  uint64_t v0 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v3 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  uint64_t v4 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v4 - 8);
  Swift::String v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v8 - 8);
  static NameSpecification.long.getter();
  uint64_t v9 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v9 - 8);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(name:parsing:help:completion:)();
}

uint64_t sub_10001D9C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001D0C8(a1, a2);
}

uint64_t sub_10001D9D8()
{
  return sub_10001DA74((unint64_t *)&unk_1000350E8);
}

uint64_t sub_10001DA0C()
{
  return sub_10001DA74(&qword_100034950);
}

uint64_t sub_10001DA40()
{
  return sub_10001DA74(&qword_1000350F8);
}

uint64_t sub_10001DA74(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s17DeleteForSourceIDVMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

Swift::Int sub_10001DAB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100004084(&qword_100035108);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      Swift::String v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_10001DC5C()
{
  unint64_t result = qword_100035118;
  if (!qword_100035118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035118);
  }
  return result;
}

uint64_t sub_10001DCB0(uint64_t a1)
{
  uint64_t v2 = _s17DeleteForSourceIDVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001DD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s17DeleteForSourceIDVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s17DeleteForSourceIDV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001DE0CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s17DeleteForSourceIDV10CodingKeysOMa()
{
  return &_s17DeleteForSourceIDV10CodingKeysON;
}

unint64_t sub_10001DE48()
{
  unint64_t result = qword_100035120;
  if (!qword_100035120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035120);
  }
  return result;
}

unint64_t sub_10001DEA0()
{
  unint64_t result = qword_100035128;
  if (!qword_100035128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035128);
  }
  return result;
}

unint64_t sub_10001DEF8()
{
  unint64_t result = qword_100035130;
  if (!qword_100035130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035130);
  }
  return result;
}

uint64_t sub_10001DF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_10001DFBC(uint64_t a1)
{
  uint64_t v2 = sub_100004084(&qword_100035138);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_10001E024(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001E08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001E0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001E15C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10001E1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E1D8);
}

uint64_t sub_10001E1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10001E248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001E25C);
}

uint64_t sub_10001E25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100035138);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CommonOptions()
{
  uint64_t result = qword_100035198;
  if (!qword_100035198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001E31C()
{
  sub_10001E3A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10001E3A8()
{
  if (!qword_1000351A8)
  {
    unint64_t v0 = type metadata accessor for Option();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000351A8);
    }
  }
}

uint64_t sub_10001E400(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 33) = a2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = v2;
  uint64_t v4 = type metadata accessor for ContinuousClock();
  *(void *)(v3 + 64) = v4;
  *(void *)(v3 + 72) = *(void *)(v4 - 8);
  *(void *)(v3 + 80) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v3 + 88) = v5;
  *(void *)(v3 + 96) = *(void *)(v5 - 8);
  *(void *)(v3 + 104) = swift_task_alloc();
  *(void *)(v3 + 112) = swift_task_alloc();
  type metadata accessor for CommonOptions();
  *(void *)(v3 + 120) = swift_task_alloc();
  return _swift_task_switch(sub_10001E55C, 0, 0);
}

uint64_t sub_10001E55C()
{
  char v1 = *(unsigned char *)(v0 + 33);
  sub_10001F28C(*(void *)(v0 + 56), *(void *)(v0 + 120));
  if (v1)
  {
    sub_100004084(&qword_100035138);
    Option.wrappedValue.getter();
  }
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 88);
  sub_10001F1E0(*(void *)(v0 + 120));
  static ContinuousClock.Instant.now.getter();
  static Duration.seconds(_:)();
  ContinuousClock.Instant.advanced(by:)();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 128) = v5;
  *(void *)(v0 + 136) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v2, v4);
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  static Clock<>.continuous.getter();
  Swift::String v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v6;
  uint64_t v7 = sub_10001F2F0(&qword_100035200, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  *Swift::String v6 = v0;
  v6[1] = sub_10001E6F0;
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 64);
  return static Task<>.sleep<A>(until:tolerance:clock:)(v8, v0 + 16, v9, v10, v7);
}

uint64_t sub_10001E6F0()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 128);
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 80);
  uint64_t v6 = *(void *)(*v1 + 72);
  uint64_t v7 = *(void *)(*v1 + 64);
  uint64_t v8 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_10001E940, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v8 + 8);
    return v9();
  }
}

uint64_t sub_10001E940()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001E9CC()
{
  v11[1] = 0x405E000000000000;
  uint64_t v0 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v0 - 8);
  static NameSpecification.shortAndLong.getter();
  uint64_t v1 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v4 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  uint64_t v5 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v9 - 8);
  static SingleValueParsingStrategy.next.getter();
  return Option<A>.init(wrappedValue:name:parsing:help:completion:)();
}

uint64_t sub_10001EC00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v4 = sub_100004084(&qword_1000351E0);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CommonOptions();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = 0x405E000000000000;
  uint64_t v10 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v10 - 8);
  static NameSpecification.shortAndLong.getter();
  uint64_t v11 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v14 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  uint64_t v15 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v15 - 8);
  BOOL v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v19 - 8);
  static SingleValueParsingStrategy.next.getter();
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  sub_100006118(a1, a1[3]);
  sub_10001F18C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v20 = sub_100004084(&qword_100035138);
    v25[1] = v25;
    uint64_t v21 = *(void *)(v20 - 8);
    __chkstk_darwin(v20);
    BOOL v23 = (char *)v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10001F23C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v4);
    (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v9, v23, v20);
    sub_10001F28C((uint64_t)v9, v26);
  }
  sub_100004110((uint64_t)a1);
  return sub_10001F1E0((uint64_t)v9);
}

unint64_t sub_10001F068()
{
  return 0xD000000000000011;
}

uint64_t sub_10001F084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001F514(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001F0B0(uint64_t a1)
{
  unint64_t v2 = sub_10001F18C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001F0EC(uint64_t a1)
{
  unint64_t v2 = sub_10001F18C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001F12C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001EC00(a1, a2);
}

uint64_t sub_10001F144()
{
  return sub_10001F2F0(&qword_1000351D8, (void (*)(uint64_t))type metadata accessor for CommonOptions);
}

unint64_t sub_10001F18C()
{
  unint64_t result = qword_1000351E8;
  if (!qword_1000351E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000351E8);
  }
  return result;
}

uint64_t sub_10001F1E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CommonOptions();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001F23C()
{
  unint64_t result = qword_1000351F0;
  if (!qword_1000351F0)
  {
    sub_10000620C(&qword_100035138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000351F0);
  }
  return result;
}

uint64_t sub_10001F28C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CommonOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F2F0(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for CommonOptions.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001F3D4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonOptions.CodingKeys()
{
  return &type metadata for CommonOptions.CodingKeys;
}

unint64_t sub_10001F410()
{
  unint64_t result = qword_100035208;
  if (!qword_100035208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035208);
  }
  return result;
}

unint64_t sub_10001F468()
{
  unint64_t result = qword_100035210;
  if (!qword_100035210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035210);
  }
  return result;
}

unint64_t sub_10001F4C0()
{
  unint64_t result = qword_100035218;
  if (!qword_100035218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035218);
  }
  return result;
}

uint64_t sub_10001F514(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000010002BE90)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

ValueMetadata *_s11PaymentRingVMa()
{
  return &_s11PaymentRingVN;
}

uint64_t sub_10001F5AC()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035810);
  sub_100003FE8(v0, (uint64_t)qword_100035810);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  char v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10001F6E8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034658 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035810);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_10001F794()
{
  unint64_t result = qword_100035220;
  if (!qword_100035220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035220);
  }
  return result;
}

unint64_t sub_10001F7EC()
{
  unint64_t result = qword_100035228;
  if (!qword_100035228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035228);
  }
  return result;
}

ValueMetadata *_s8InsightsVMa()
{
  return &_s8InsightsVN;
}

uint64_t sub_10001F850()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035828);
  sub_100003FE8(v0, (uint64_t)qword_100035828);
  sub_100004084(&qword_1000346A0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100028A20;
  uint64_t v2 = _s16SpendingInsightsVMa();
  unint64_t v3 = sub_10001FB18();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10001F9C0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034660 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035828);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_10001FA6C()
{
  unint64_t result = qword_100035230;
  if (!qword_100035230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035230);
  }
  return result;
}

unint64_t sub_10001FAC4()
{
  unint64_t result = qword_100035238;
  if (!qword_100035238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035238);
  }
  return result;
}

unint64_t sub_10001FB18()
{
  unint64_t result = qword_100034D10;
  if (!qword_100034D10)
  {
    _s16SpendingInsightsVMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D10);
  }
  return result;
}

id sub_10001FCA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FinHealthControllerFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FinHealthControllerFactory()
{
  return self;
}

uint64_t sub_10001FD00(uint64_t result, char a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    sub_100004084(&qword_1000352D0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100028A20;
    swift_errorRetain();
    _StringGuts.grow(_:)(27);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    sub_100004084((uint64_t *)&unk_1000352E0);
    v6._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    *(void *)(v5 + 56) = &type metadata for String;
    *(void *)(v5 + 32) = 0xD000000000000019;
    *(void *)(v5 + 40) = 0x800000010002BFA0;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else if (a2)
  {
    if (a3)
    {
      unint64_t v8 = result;
      sub_100004084(&qword_1000352D0);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_100028A20;
      swift_retain();
      _StringGuts.grow(_:)(34);
      swift_bridgeObjectRelease();
      if (v8)
      {
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain();
          _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
      }
      sub_100004084(&qword_1000352D8);
      v11._countAndFlagsBits = String.init<A>(describing:)();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      *(void *)(v9 + 56) = &type metadata for String;
      *(void *)(v9 + 32) = 0xD000000000000020;
      *(void *)(v9 + 40) = 0x800000010002BF70;
      print(_:separator:terminator:)();
      uint64_t v12 = swift_bridgeObjectRelease();
      a3(v12);
      return sub_100020000((uint64_t)a3);
    }
  }
  else
  {
    sub_100004084(&qword_1000352D0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100028A20;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 32) = 0xD00000000000001ALL;
    *(void *)(v10 + 40) = 0x800000010002BF50;
    print(_:separator:terminator:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100020000(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100020010()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020048()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_100020058()
{
  unint64_t result = qword_1000352C8;
  if (!qword_1000352C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000352C8);
  }
  return result;
}

ValueMetadata *_s12PeerPaymentsVMa()
{
  return &_s12PeerPaymentsVN;
}

uint64_t sub_1000200A8()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035840);
  sub_100003FE8(v0, (uint64_t)qword_100035840);
  sub_100004084(&qword_1000346A0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10002A7A0;
  uint64_t v2 = _s12SignalStatusVMa();
  uint64_t v3 = sub_1000203E4((unint64_t *)&unk_1000347A8, (void (*)(uint64_t))_s12SignalStatusVMa);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = _s22PeerPaymentForecastingVMa();
  uint64_t v5 = sub_1000203E4((unint64_t *)&unk_100034A08, (void (*)(uint64_t))_s22PeerPaymentForecastingVMa);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + 56) = v5;
  uint64_t v6 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_10002028C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034668 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035840);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

unint64_t sub_100020338()
{
  unint64_t result = qword_100035350;
  if (!qword_100035350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035350);
  }
  return result;
}

unint64_t sub_100020390()
{
  unint64_t result = qword_100035358;
  if (!qword_100035358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035358);
  }
  return result;
}

uint64_t sub_1000203E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002042C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020440);
}

uint64_t sub_100020440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1000204B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000204C4);
}

uint64_t sub_1000204C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s18ReevaluateFeaturesVMa()
{
  uint64_t result = qword_1000353B8;
  if (!qword_1000353B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100020584()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035858);
  sub_100003FE8(v0, (uint64_t)qword_100035858);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_1000206D0()
{
  *(void *)(v1 + 16) = v0;
  type metadata accessor for CommonOptions();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100020760, 0, 0);
}

uint64_t sub_100020760()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  v0[4] = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  v0[5] = v2;
  v0[6] = sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000017;
  *(void *)(v3 + 40) = 0x800000010002C020;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  [v2 reevaluateTransactionFeatures];
  sub_100004084(&qword_100034810);
  OptionGroup.wrappedValue.getter();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000208DC;
  return sub_10001E400(0, 1);
}

uint64_t sub_1000208DC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  sub_100021234(v2, (uint64_t (*)(void))type metadata accessor for CommonOptions);
  if (v0) {
    uint64_t v3 = sub_1000199A0;
  }
  else {
    uint64_t v3 = sub_100020A20;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100020A20()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD00000000000001BLL;
  *(void *)(v3 + 40) = 0x800000010002C040;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100020AFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_100004084(&qword_100035410);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s18ReevaluateFeaturesVMa();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100021198((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  sub_100006118(a1, a1[3]);
  sub_1000211E0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v12 = sub_100004084(&qword_100034810);
    v16[1] = v16;
    v16[0] = *(void *)(v12 - 8);
    __chkstk_darwin(v12);
    uint64_t v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_10001A28C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v16[0] + 40))(v10, v14, v12);
    sub_100021294((uint64_t)v10, v17);
  }
  sub_100004110((uint64_t)a1);
  return sub_100021234((uint64_t)v10, (uint64_t (*)(void))_s18ReevaluateFeaturesVMa);
}

uint64_t sub_100020E28(uint64_t a1)
{
  unint64_t v2 = sub_1000211E0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100020E64(uint64_t a1)
{
  unint64_t v2 = sub_1000211E0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100020EA0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_1000206D0();
}

uint64_t sub_100020F2C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034670 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035858);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100020FD4()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100021198((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  return OptionGroup.init(title:visibility:)();
}

uint64_t sub_1000210A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100020AFC(a1, a2);
}

uint64_t sub_1000210C0()
{
  return sub_100021198((unint64_t *)&unk_1000353F0, (void (*)(uint64_t))_s18ReevaluateFeaturesVMa);
}

uint64_t sub_100021108()
{
  return sub_100021198(&qword_1000346A8, (void (*)(uint64_t))_s18ReevaluateFeaturesVMa);
}

uint64_t sub_100021150()
{
  return sub_100021198(&qword_100035400, (void (*)(uint64_t))_s18ReevaluateFeaturesVMa);
}

uint64_t sub_100021198(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000211E0()
{
  unint64_t result = qword_100035418;
  if (!qword_100035418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035418);
  }
  return result;
}

uint64_t sub_100021234(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100021294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s18ReevaluateFeaturesVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *_s18ReevaluateFeaturesV10CodingKeysOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100021394);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s18ReevaluateFeaturesV10CodingKeysOMa()
{
  return &_s18ReevaluateFeaturesV10CodingKeysON;
}

unint64_t sub_1000213D0()
{
  unint64_t result = qword_100035420;
  if (!qword_100035420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035420);
  }
  return result;
}

unint64_t sub_100021428()
{
  unint64_t result = qword_100035428;
  if (!qword_100035428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035428);
  }
  return result;
}

unint64_t sub_100021480()
{
  unint64_t result = qword_100035430;
  if (!qword_100035430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035430);
  }
  return result;
}

uint64_t *sub_1000214D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004084(&qword_100034810);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004084(&qword_100035438);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_100004084(&qword_100035440);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100021638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004084(&qword_100035438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_100004084(&qword_100035440);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t sub_100021734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100035440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_100021848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100035440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_10002195C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100035440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_100021A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004084(&qword_100035440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100021B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100021B98);
}

uint64_t sub_100021B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100004084(&qword_100035438);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_100004084(&qword_100035440);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t sub_100021CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100021D04);
}

uint64_t sub_100021D04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004084(&qword_100034810);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100004084(&qword_100035438);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_100004084(&qword_100035440);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

uint64_t _s18ImportTransactionsVMa()
{
  uint64_t result = qword_1000354A0;
  if (!qword_1000354A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100021EB4()
{
  sub_100006EAC();
  if (v0 <= 0x3F)
  {
    sub_100021FB8();
    if (v1 <= 0x3F)
    {
      sub_100022014();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100021FB8()
{
  if (!qword_1000354B0)
  {
    sub_10000620C(&qword_100034D38);
    unint64_t v0 = type metadata accessor for Argument();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000354B0);
    }
  }
}

void sub_100022014()
{
  if (!qword_1000354B8)
  {
    unint64_t v0 = type metadata accessor for Argument();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000354B8);
    }
  }
}

uint64_t sub_10002206C()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035870);
  sub_100003FE8(v0, (uint64_t)qword_100035870);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_1000221B0()
{
  *(void *)(v1 + 168) = v0;
  return _swift_task_switch(sub_100022240, 0, 0);
}

uint64_t sub_100022240()
{
  _s18ImportTransactionsVMa();
  sub_100004084(&qword_100035438);
  Argument.wrappedValue.getter();
  if (!*(void *)(v0 + 88)) {
    goto LABEL_16;
  }
  sub_100004084(&qword_100035440);
  Argument.wrappedValue.getter();
  if (*(void *)(v0 + 80) == 1852797802 && *(void *)(v0 + 88) == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v1 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  id v2 = [self defaultManager];
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 contentsAtPath:v3];

  if (v4)
  {
    uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;

    *(void *)(v0 + 176) = v5;
    *(void *)(v0 + 184) = v7;
    uint64_t v8 = self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 80) = 0;
    id v10 = [v8 JSONObjectWithData:isa options:0 error:v0 + 80];

    id v11 = *(id *)(v0 + 80);
    if (v10)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100023FD4(v0 + 120, v0 + 80);
      sub_100004084(&qword_100035510);
      if (swift_dynamicCast())
      {
        uint64_t v12 = *(void *)(v0 + 152);
        *(void *)(v0 + 192) = v12;
        id v13 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
        *(void *)(v0 + 200) = v13;
        id v14 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v13];
        *(void *)(v0 + 208) = v14;
        uint64_t v15 = *(void *)(v12 + 16);
        *(void *)(v0 + 216) = v15;
        if (v15)
        {
          *(void *)(v0 + 224) = 0;
          uint64_t v16 = swift_bridgeObjectRetain();
          sub_100022D3C(v16);
          swift_bridgeObjectRelease();
          id v17 = objc_allocWithZone((Class)FHTransaction);
          Class v18 = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          id v19 = [v17 initWithDictionary:v18];
          *(void *)(v0 + 232) = v19;

          *(void *)(v0 + 16) = v0;
          *(void *)(v0 + 56) = v0 + 152;
          *(void *)(v0 + 24) = sub_10002292C;
          uint64_t v20 = swift_continuation_init();
          *(void *)(v0 + 80) = _NSConcreteStackBlock;
          *(void *)(v0 + 88) = 0x40000000;
          *(void *)(v0 + 96) = sub_100023104;
          *(void *)(v0 + 104) = &unk_100031AE8;
          *(void *)(v0 + 112) = v20;
          [v14 transactionUpdated:v19 deferFeatureComputation:0 completion:v0 + 80];
          return _swift_continuation_await(v0 + 16);
        }
        uint64_t v28 = *(void **)(v0 + 200);
        uint64_t v30 = *(void *)(v0 + 176);
        unint64_t v29 = *(void *)(v0 + 184);
        swift_bridgeObjectRelease();
        sub_100004084(&qword_1000352D0);
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_10002A7A0;
        *(void *)(v31 + 32) = 0xD00000000000002BLL;
        *(void *)(v31 + 40) = 0x800000010002C180;
        *(void *)(v31 + 88) = &type metadata for Int;
        *(void *)(v31 + 56) = &type metadata for String;
        *(void *)(v31 + 64) = 0;
        print(_:separator:terminator:)();
        sub_100008D38(v30, v29);
        swift_bridgeObjectRelease();

        sub_100004110(v0 + 120);
        goto LABEL_20;
      }
      type metadata accessor for ValidationError();
      sub_10000B5F4();
      uint64_t v23 = swift_allocError();
      ValidationError.init(_:)();
      swift_willThrow();
      sub_100004110(v0 + 120);
    }
    else
    {
      uint64_t v22 = v11;
      uint64_t v23 = _convertNSErrorToError(_:)();

      swift_willThrow();
    }
    sub_100004084(&qword_1000352D0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100028A20;
    _StringGuts.grow(_:)(49);
    *(void *)(v0 + 80) = 0;
    *(void *)(v0 + 88) = 0xE000000000000000;
    v25._countAndFlagsBits = 0xD00000000000002FLL;
    v25._object = (void *)0x800000010002C100;
    String.append(_:)(v25);
    *(void *)(v0 + 120) = v23;
    sub_100004084((uint64_t *)&unk_1000352E0);
    _print_unlocked<A, B>(_:_:)();
    uint64_t v26 = *(void *)(v0 + 80);
    uint64_t v27 = *(void *)(v0 + 88);
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 32) = v26;
    *(void *)(v24 + 40) = v27;
    print(_:separator:terminator:)();
    sub_100008D38(v5, v7);
    swift_bridgeObjectRelease();
    swift_errorRelease();
LABEL_20:
    uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_21;
  }
LABEL_16:
  type metadata accessor for ValidationError();
  sub_10000B5F4();
  swift_allocError();
  ValidationError.init(_:)();
  swift_willThrow();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
LABEL_21:
  return v21();
}

uint64_t sub_10002292C()
{
  return _swift_task_switch(sub_100022A38, 0, 0);
}

uint64_t sub_100022A38()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 216);

  swift_errorRelease();
  if (v1 + 1 == v2)
  {
    NSString v3 = *(void **)(v0 + 208);
    uint64_t v4 = *(void *)(v0 + 216);
    uint64_t v5 = *(void **)(v0 + 200);
    uint64_t v7 = *(void *)(v0 + 176);
    unint64_t v6 = *(void *)(v0 + 184);
    swift_bridgeObjectRelease();
    sub_100004084(&qword_1000352D0);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 32) = 0xD00000000000002BLL;
    *(void *)(v8 + 40) = 0x800000010002C180;
    *(_OWORD *)(v8 + 16) = xmmword_10002A7A0;
    *(void *)(v8 + 88) = &type metadata for Int;
    *(void *)(v8 + 56) = &type metadata for String;
    *(void *)(v8 + 64) = v4;
    print(_:separator:terminator:)();
    sub_100008D38(v7, v6);
    swift_bridgeObjectRelease();

    sub_100004110(v0 + 120);
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
  else
  {
    ++*(void *)(v0 + 224);
    id v11 = *(void **)(v0 + 208);
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_100022D3C(v12);
    swift_bridgeObjectRelease();
    id v13 = objc_allocWithZone((Class)FHTransaction);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v15 = [v13 initWithDictionary:isa];
    *(void *)(v0 + 232) = v15;

    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 152;
    *(void *)(v0 + 24) = sub_10002292C;
    uint64_t v16 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100023104;
    *(void *)(v0 + 104) = &unk_100031AE8;
    *(void *)(v0 + 112) = v16;
    [v11 transactionUpdated:v15 deferFeatureComputation:0 completion:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_100022D3C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100004084(&qword_100035518);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  unint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_100023FD4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000103F8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000103F8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000103F8(v36, v37);
    sub_1000103F8(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000103F8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100024030();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100023104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40);
  *uint64_t v4 = a2;
  v4[1] = a3;
  id v5 = a2;
  id v6 = a3;
  return swift_continuation_resume();
}

uint64_t sub_100023160@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v2 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100023F8C((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  uint64_t v22 = a1;
  OptionGroup.init(title:visibility:)();
  uint64_t v3 = _s18ImportTransactionsVMa();
  uint64_t v20 = a1 + *(int *)(v3 + 20);
  uint64_t v21 = v3;
  uint64_t v4 = sub_100004084(&qword_1000347C8);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v7 = type metadata accessor for ArgumentHelp();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  uint64_t v19 = v8 + 56;
  v18((char *)&v17 - v6, 0, 1, v7);
  uint64_t v9 = sub_100004084(&qword_1000347D0);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = type metadata accessor for CompletionKind();
  int64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v13((char *)&v17 - v11, 1, 1, v12);
  uint64_t v14 = Argument.init<A>(help:completion:)();
  uint64_t v23 = 1852797802;
  unint64_t v24 = 0xE400000000000000;
  __chkstk_darwin(v14);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v15 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v18)((char *)&v17 - v6, 0, 1, v7);
  __chkstk_darwin(v15);
  v13((char *)&v17 - v11, 1, 1, v12);
  return Argument<A>.init(wrappedValue:help:completion:)();
}

uint64_t sub_1000234A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v43 = a2;
  uint64_t v2 = sub_100004084(&qword_100035520);
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  __chkstk_darwin(v2);
  uint64_t v56 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s18ImportTransactionsVMa();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v8 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100023F8C((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  char v53 = v7;
  OptionGroup.init(title:visibility:)();
  uint64_t v52 = &v7[*(int *)(v5 + 28)];
  uint64_t v9 = sub_100004084(&qword_1000347C8);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  unint64_t v49 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v11 = (char *)&v42 - v49;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v12 = type metadata accessor for ArgumentHelp();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v47 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  uint64_t v48 = v13 + 56;
  v47(v11, 0, 1, v12);
  uint64_t v14 = sub_100004084(&qword_1000347D0);
  uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
  __chkstk_darwin(v14 - 8);
  unint64_t v46 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  int64_t v16 = (char *)&v42 - v46;
  uint64_t v17 = type metadata accessor for CompletionKind();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  uint64_t v19 = Argument.init<A>(help:completion:)();
  uint64_t v20 = (uint64_t)v53;
  uint64_t v21 = &v53[*(int *)(v5 + 32)];
  uint64_t v54 = 1852797802;
  unint64_t v55 = 0xE400000000000000;
  uint64_t v22 = v21;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v42 - v49;
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v24 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v47)(v23, 0, 1, v12);
  __chkstk_darwin(v24);
  v18((char *)&v42 - v46, 1, 1, v17);
  BOOL v25 = v50;
  Argument<A>.init(wrappedValue:help:completion:)();
  sub_100006118(v25, v25[3]);
  sub_100024038();
  uint64_t v26 = v51;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v26)
  {
    uint64_t v51 = v22;
    uint64_t v27 = v44;
    uint64_t v28 = sub_100004084(&qword_100034810);
    uint64_t v29 = *(void *)(v28 - 8);
    __chkstk_darwin(v28);
    uint64_t v31 = (char *)&v42 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v54) = 0;
    sub_100008E80((unint64_t *)&qword_100034908, &qword_100034810);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v20 = (uint64_t)v53;
    (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v53, v31, v28);
    uint64_t v32 = sub_100004084(&qword_100035438);
    uint64_t v33 = *(void *)(v32 - 8);
    __chkstk_darwin(v32);
    uint64_t v35 = (char *)&v42 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v54) = 1;
    sub_100008E80(&qword_100035530, &qword_100035438);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v52, v35, v32);
    uint64_t v37 = sub_100004084(&qword_100035440);
    uint64_t v52 = *(char **)(v37 - 8);
    __chkstk_darwin(v37);
    long long v39 = (char *)&v42 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v54) = 2;
    sub_100008E80(&qword_100035538, &qword_100035440);
    uint64_t v40 = v45;
    uint64_t v41 = v56;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v41, v40);
    (*((void (**)(char *, char *, uint64_t))v52 + 5))(v51, v39, v37);
    sub_1000240E8(v20, v43);
  }
  sub_100004110((uint64_t)v25);
  return sub_10002408C(v20);
}

uint64_t sub_100023C40()
{
  uint64_t v1 = 1701603686;
  if (*v0 != 1) {
    uint64_t v1 = 0x74616D726F66;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x704F6E6F6D6D6F63;
  }
}

uint64_t sub_100023C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000243E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_100023CC4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100023CD0(uint64_t a1)
{
  unint64_t v2 = sub_100024038();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100023D0C(uint64_t a1)
{
  unint64_t v2 = sub_100024038();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100023D48()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100005E80;
  v2[21] = v0;
  return _swift_task_switch(sub_100022240, 0, 0);
}

uint64_t sub_100023DF0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034678 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035870);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100023E9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000234A4(a1, a2);
}

uint64_t sub_100023EB4()
{
  return sub_100023F8C((unint64_t *)&unk_1000354F0, (void (*)(uint64_t))_s18ImportTransactionsVMa);
}

uint64_t sub_100023EFC()
{
  return sub_100023F8C(&qword_100034940, (void (*)(uint64_t))_s18ImportTransactionsVMa);
}

uint64_t sub_100023F44()
{
  return sub_100023F8C(&qword_100035500, (void (*)(uint64_t))_s18ImportTransactionsVMa);
}

uint64_t sub_100023F8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100023FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100024030()
{
  return swift_release();
}

unint64_t sub_100024038()
{
  unint64_t result = qword_100035528;
  if (!qword_100035528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035528);
  }
  return result;
}

uint64_t sub_10002408C(uint64_t a1)
{
  uint64_t v2 = _s18ImportTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000240E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s18ImportTransactionsVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s18ImportTransactionsV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18ImportTransactionsV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000242A8);
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

ValueMetadata *_s18ImportTransactionsV10CodingKeysOMa()
{
  return &_s18ImportTransactionsV10CodingKeysON;
}

unint64_t sub_1000242E4()
{
  unint64_t result = qword_100035540;
  if (!qword_100035540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035540);
  }
  return result;
}

unint64_t sub_10002433C()
{
  unint64_t result = qword_100035548;
  if (!qword_100035548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035548);
  }
  return result;
}

unint64_t sub_100024394()
{
  unint64_t result = qword_100035550;
  if (!qword_100035550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035550);
  }
  return result;
}

uint64_t sub_1000243E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x704F6E6F6D6D6F63 && a2 == 0xED0000736E6F6974;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701603686 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616D726F66 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t *sub_10002454C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100004084(&qword_100034810);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004084(&qword_100035558);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_10002465C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004084(&qword_100035558);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_10002470C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000247CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002488C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002494C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004084(&qword_100035558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100024A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024A20);
}

uint64_t sub_100024A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004084(&qword_100034810);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004084(&qword_100035558);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100024B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024B34);
}

uint64_t sub_100024B34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100004084(&qword_100034810);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004084(&qword_100035558);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t _s22FeaturesForApplicationVMa()
{
  uint64_t result = qword_1000355B8;
  if (!qword_1000355B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100024C8C()
{
  sub_100006EAC();
  if (v0 <= 0x3F)
  {
    sub_100024D54();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100024D54()
{
  if (!qword_1000355C8)
  {
    unint64_t v0 = type metadata accessor for Option();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000355C8);
    }
  }
}

unsigned char *_s22FeaturesForApplicationV15ApplicationNameOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100024E78);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s22FeaturesForApplicationV15ApplicationNameOMa()
{
  return &_s22FeaturesForApplicationV15ApplicationNameON;
}

unint64_t sub_100024EB4()
{
  unint64_t result = qword_1000355F8;
  if (!qword_1000355F8)
  {
    sub_10000620C(&qword_100035600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000355F8);
  }
  return result;
}

uint64_t sub_100024F10()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_100035888);
  sub_100003FE8(v0, (uint64_t)qword_100035888);
  uint64_t v1 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v1 - 8);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100025054(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10001248C(*a1, *a2);
}

Swift::Int sub_100025060()
{
  return Hasher._finalize()();
}

uint64_t sub_10002510C()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000251A4()
{
  return Hasher._finalize()();
}

unint64_t sub_10002524C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100027154(*a1);
  *a2 = result;
  return result;
}

void sub_10002527C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000067;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x686372616553;
  if (v2 != 1)
  {
    uint64_t v5 = 0x20746E656D796150;
    unint64_t v4 = 0xEC000000676E6952;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E6967617373654DLL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1000252E4()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t sub_10002534C()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t sub_100025394()
{
  return static ExpressibleByArgument<>.allValueStrings.getter();
}

uint64_t sub_1000253E8()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

void sub_100025430(void *a1@<X8>)
{
  *a1 = &off_100030FE8;
}

unint64_t sub_100025444()
{
  unint64_t result = qword_100035608;
  if (!qword_100035608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035608);
  }
  return result;
}

uint64_t sub_100025498()
{
  *(void *)(v1 + 152) = v0;
  type metadata accessor for CommonOptions();
  *(void *)(v1 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_100025528, 0, 0);
}

uint64_t sub_100025528()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for FinHealthControllerFactory()) init];
  *(void *)(v0 + 168) = v1;
  id v2 = [objc_allocWithZone((Class)FHSearchSuggestionController) initWithDelegate:v1];
  *(void *)(v0 + 176) = v2;
  *(_DWORD *)(v0 + 224) = *(_DWORD *)(_s22FeaturesForApplicationVMa() + 20);
  *(void *)(v0 + 184) = sub_100004084(&qword_100035558);
  Option.wrappedValue.getter();
  NSString v3 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 192) = v3;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 136;
  *(void *)(v0 + 24) = sub_10002571C;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100025F08;
  *(void *)(v0 + 104) = &unk_100031C20;
  *(void *)(v0 + 112) = v4;
  [v2 featuresForApplication:v3 withCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10002571C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    id v2 = sub_100025CE8;
  }
  else {
    id v2 = sub_10002582C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002582C()
{
  uint64_t v1 = *(void *)(v0 + 136);

  if (*(void *)(v1 + 16))
  {
    sub_100004084(&qword_1000352D0);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_100028A20;
    *(void *)(v2 + 56) = &type metadata for String;
    *(void *)(v2 + 32) = 0x6546207472616D53;
    *(void *)(v2 + 40) = 0xEF3A736572757461;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    sub_100025FE4(v1);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100004084(&qword_1000352D0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_100028A20;
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    Option.wrappedValue.getter();
    unint64_t v4 = 0xE600000000000000;
    uint64_t v5 = 0x686372616553;
    if (*(unsigned char *)(v0 + 229) != 1)
    {
      uint64_t v5 = 0x20746E656D796150;
      unint64_t v4 = 0xEC000000676E6952;
    }
    if (*(unsigned char *)(v0 + 229)) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0x6E6967617373654DLL;
    }
    if (*(unsigned char *)(v0 + 229)) {
      unint64_t v7 = v4;
    }
    else {
      unint64_t v7 = 0xE900000000000067;
    }
    unint64_t v8 = v7;
    String.append(_:)(*(Swift::String *)&v6);
    swift_bridgeObjectRelease();
    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 32) = 0xD000000000000029;
    *(void *)(v3 + 40) = 0x800000010002C2D0;
    print(_:separator:terminator:)();
  }
  swift_bridgeObjectRelease();
  sub_100004084(&qword_100034810);
  OptionGroup.wrappedValue.getter();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100025AB8;
  return sub_10001E400(0, 1);
}

uint64_t sub_100025AB8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  sub_100027090(*(void *)(v2 + 160), (uint64_t (*)(void))type metadata accessor for CommonOptions);
  if (v0) {
    uint64_t v3 = sub_100025E94;
  }
  else {
    uint64_t v3 = sub_100025C00;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100025C00()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[22];
  sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = 0xD000000000000031;
  *(void *)(v3 + 40) = 0x800000010002C290;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100025CE8()
{
  uint64_t v2 = (void *)v0[24];
  uint64_t v1 = v0[25];
  swift_willThrow();

  sub_100004084(&qword_1000352D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100028A20;
  _StringGuts.grow(_:)(50);
  v0[15] = 0;
  v0[16] = 0xE000000000000000;
  v4._object = (void *)0x800000010002C250;
  v4._countAndFlagsBits = 0xD000000000000030;
  String.append(_:)(v4);
  v0[18] = v1;
  sub_100004084((uint64_t *)&unk_1000352E0);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[16];
  *(void *)(v3 + 56) = &type metadata for String;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  sub_100004084(&qword_100034810);
  OptionGroup.wrappedValue.getter();
  unint64_t v7 = (void *)swift_task_alloc();
  v0[26] = v7;
  *unint64_t v7 = v0;
  v7[1] = sub_100025AB8;
  return sub_10001E400(0, 1);
}

uint64_t sub_100025E94()
{
  uint64_t v1 = *(void **)(v0 + 168);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100025F08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004084((uint64_t *)&unk_1000352E0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100025FE4(uint64_t a1)
{
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v21 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      unint64_t v7 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v8 = v7 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v21) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v15 + 8 * v12);
    ++v6;
    if (!v13)
    {
      int64_t v6 = v12 + 1;
      if (v12 + 1 >= v21) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v15 + 8 * v6);
      if (!v13)
      {
        int64_t v6 = v12 + 2;
        if (v12 + 2 >= v21) {
          return swift_release();
        }
        unint64_t v13 = *(void *)(v15 + 8 * v6);
        if (!v13)
        {
          int64_t v6 = v12 + 3;
          if (v12 + 3 >= v21) {
            return swift_release();
          }
          unint64_t v13 = *(void *)(v15 + 8 * v6);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v4 = (v13 - 1) & v13;
    unint64_t v8 = __clz(__rbit64(v13)) + (v6 << 6);
LABEL_5:
    sub_100026F2C(*(void *)(a1 + 48) + 40 * v8, (uint64_t)v18);
    sub_100023FD4(*(void *)(a1 + 56) + 32 * v8, (uint64_t)v19 + 8);
    void v16[2] = v19[0];
    v16[3] = v19[1];
    uint64_t v17 = v20;
    v16[0] = v18[0];
    v16[1] = v18[1];
    sub_100004084(&qword_1000352D0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100028A20;
    v10._countAndFlagsBits = AnyHashable.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 8250;
    v11._object = (void *)0xE200000000000000;
    String.append(_:)(v11);
    _print_unlocked<A, B>(_:_:)();
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 32) = 0;
    *(void *)(v9 + 40) = 0xE000000000000000;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    uint64_t result = sub_100026F88((uint64_t)v16);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v21) {
    return swift_release();
  }
  unint64_t v13 = *(void *)(v15 + 8 * v14);
  if (v13)
  {
    int64_t v6 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v6 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v6 >= v21) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v15 + 8 * v6);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10002628C()
{
  uint64_t v0 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v0 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100026EE4((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  _s22FeaturesForApplicationVMa();
  v12[15] = 0;
  uint64_t v1 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v4 = type metadata accessor for ArgumentHelp();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  uint64_t v5 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for CompletionKind();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v9 - 8);
  static NameSpecification.long.getter();
  uint64_t v10 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v10 - 8);
  static SingleValueParsingStrategy.next.getter();
  sub_100026FE8();
  return Option<A>.init(wrappedValue:name:parsing:help:completion:)();
}

uint64_t sub_100026574@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v4 = sub_100004084(&qword_100035640);
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s22FeaturesForApplicationVMa();
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ArgumentVisibility();
  __chkstk_darwin(v11 - 8);
  static ArgumentVisibility.default.getter();
  type metadata accessor for CommonOptions();
  sub_100026EE4((unint64_t *)&unk_100034888, (void (*)(uint64_t))type metadata accessor for CommonOptions);
  OptionGroup.init(title:visibility:)();
  int64_t v12 = &v10[*(int *)(v8 + 28)];
  char v40 = 0;
  uint64_t v13 = sub_100004084(&qword_1000347C8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  ArgumentHelp.init(stringLiteral:)();
  uint64_t v16 = type metadata accessor for ArgumentHelp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  uint64_t v17 = sub_100004084(&qword_1000347D0);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CompletionKind();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = type metadata accessor for NameSpecification();
  __chkstk_darwin(v21 - 8);
  static NameSpecification.long.getter();
  uint64_t v22 = type metadata accessor for SingleValueParsingStrategy();
  __chkstk_darwin(v22 - 8);
  static SingleValueParsingStrategy.next.getter();
  sub_100026FE8();
  Option<A>.init(wrappedValue:name:parsing:help:completion:)();
  sub_100006118(a1, a1[3]);
  sub_10002703C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v34 = v12;
    uint64_t v23 = sub_100004084(&qword_100034810);
    uint64_t v24 = *(void *)(v23 - 8);
    __chkstk_darwin(v23);
    uint64_t v26 = (char *)&v32 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v39 = 0;
    sub_100008E80((unint64_t *)&qword_100034908, &qword_100034810);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v10, v26, v23);
    uint64_t v27 = sub_100004084(&qword_100035558);
    uint64_t v33 = *(void *)(v27 - 8);
    __chkstk_darwin(v27);
    uint64_t v29 = (char *)&v32 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v38 = 1;
    sub_100008E80(&qword_100035650, &qword_100035558);
    uint64_t v30 = v37;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v30);
    (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v34, v29, v27);
    sub_1000270F0((uint64_t)v10, v35);
  }
  sub_100004110((uint64_t)a1);
  return sub_100027090((uint64_t)v10, (uint64_t (*)(void))_s22FeaturesForApplicationVMa);
}

uint64_t sub_100026BC8()
{
  if (*v0) {
    return 0x746163696C707061;
  }
  else {
    return 0x704F6E6F6D6D6F63;
  }
}

uint64_t sub_100026C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100027454(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100026C44(uint64_t a1)
{
  unint64_t v2 = sub_10002703C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100026C80(uint64_t a1)
{
  unint64_t v2 = sub_10002703C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100026CBC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005E80;
  return sub_100025498();
}

uint64_t sub_100026D48@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034680 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_100035888);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_100026DF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100026574(a1, a2);
}

uint64_t sub_100026E0C()
{
  return sub_100026EE4((unint64_t *)&unk_100035610, (void (*)(uint64_t))_s22FeaturesForApplicationVMa);
}

uint64_t sub_100026E54()
{
  return sub_100026EE4(&qword_1000346C8, (void (*)(uint64_t))_s22FeaturesForApplicationVMa);
}

uint64_t sub_100026E9C()
{
  return sub_100026EE4(&qword_100035620, (void (*)(uint64_t))_s22FeaturesForApplicationVMa);
}

uint64_t sub_100026EE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100026F2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100026F88(uint64_t a1)
{
  uint64_t v2 = sub_100004084(&qword_100035630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100026FE8()
{
  unint64_t result = qword_100035638;
  if (!qword_100035638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035638);
  }
  return result;
}

unint64_t sub_10002703C()
{
  unint64_t result = qword_100035648;
  if (!qword_100035648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035648);
  }
  return result;
}

uint64_t sub_100027090(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000270F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s22FeaturesForApplicationVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100027154(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030F80, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_1000271A0()
{
  unint64_t result = qword_100035658;
  if (!qword_100035658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035658);
  }
  return result;
}

unint64_t sub_1000271F4()
{
  unint64_t result = qword_100035660;
  if (!qword_100035660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035660);
  }
  return result;
}

unsigned char *_s22FeaturesForApplicationV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100027314);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s22FeaturesForApplicationV10CodingKeysOMa()
{
  return &_s22FeaturesForApplicationV10CodingKeysON;
}

unint64_t sub_100027350()
{
  unint64_t result = qword_100035668;
  if (!qword_100035668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035668);
  }
  return result;
}

unint64_t sub_1000273A8()
{
  unint64_t result = qword_100035670;
  if (!qword_100035670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035670);
  }
  return result;
}

unint64_t sub_100027400()
{
  unint64_t result = qword_100035678;
  if (!qword_100035678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035678);
  }
  return result;
}

uint64_t sub_100027454(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x704F6E6F6D6D6F63 && a2 == 0xED0000736E6F6974;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746163696C707061 && a2 == 0xEF656D614E6E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100027590()
{
  uint64_t v0 = type metadata accessor for CommandConfiguration();
  sub_100004020(v0, qword_1000358A0);
  sub_100003FE8(v0, (uint64_t)qword_1000358A0);
  sub_100004084(&qword_1000346A0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100028E30;
  unint64_t v2 = sub_100027CAC();
  *(void *)(v1 + 32) = &_s8FeaturesVN;
  *(void *)(v1 + 40) = v2;
  unint64_t v3 = sub_100027D00();
  *(void *)(v1 + 48) = &_s12TransactionsVN;
  *(void *)(v1 + 56) = v3;
  unint64_t v4 = sub_100027D54();
  *(void *)(v1 + 64) = &_s12PeerPaymentsVN;
  *(void *)(v1 + 72) = v4;
  unint64_t v5 = sub_100027DA8();
  *(void *)(v1 + 80) = &_s11PaymentRingVN;
  *(void *)(v1 + 88) = v5;
  unint64_t v6 = sub_100027DFC();
  *(void *)(v1 + 96) = &_s8InsightsVN;
  *(void *)(v1 + 104) = v6;
  uint64_t v7 = sub_100004084(&qword_1000346D8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for NameSpecification();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t sub_100027754()
{
  sub_100027C58();
  ParsableCommand.run()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_10001C548(v1);
}

uint64_t sub_1000277FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100034688 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CommandConfiguration();
  uint64_t v3 = sub_100003FE8(v2, (uint64_t)qword_1000358A0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  swift_task_create();
  swift_task_getMainExecutor();
  swift_job_run();
  int result = swift_task_asyncMainDrainQueue();
  __break(1u);
  return result;
}

uint64_t sub_10002790C()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  sub_100027B40();
  *uint64_t v1 = v0;
  v1[1] = sub_1000279CC;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_1000279CC()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100027B08, v1, v0);
}

void sub_100027B08()
{
}

unint64_t sub_100027B40()
{
  unint64_t result = qword_100035688;
  if (!qword_100035688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035688);
  }
  return result;
}

ValueMetadata *type metadata accessor for FinHealthClient()
{
  return &type metadata for FinHealthClient;
}

unint64_t sub_100027BA8()
{
  unint64_t result = qword_100035690;
  if (!qword_100035690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035690);
  }
  return result;
}

unint64_t sub_100027C00()
{
  unint64_t result = qword_100035698;
  if (!qword_100035698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100035698);
  }
  return result;
}

unint64_t sub_100027C58()
{
  unint64_t result = qword_1000356A0;
  if (!qword_1000356A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356A0);
  }
  return result;
}

unint64_t sub_100027CAC()
{
  unint64_t result = qword_1000356B0;
  if (!qword_1000356B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356B0);
  }
  return result;
}

unint64_t sub_100027D00()
{
  unint64_t result = qword_1000356B8;
  if (!qword_1000356B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356B8);
  }
  return result;
}

unint64_t sub_100027D54()
{
  unint64_t result = qword_1000356C0;
  if (!qword_1000356C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356C0);
  }
  return result;
}

unint64_t sub_100027DA8()
{
  unint64_t result = qword_1000356C8;
  if (!qword_1000356C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356C8);
  }
  return result;
}

unint64_t sub_100027DFC()
{
  unint64_t result = qword_1000356D0;
  if (!qword_1000356D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000356D0);
  }
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t ExpressibleByArgument<>.defaultValueDescription.getter()
{
  return ExpressibleByArgument<>.defaultValueDescription.getter();
}

uint64_t static ExpressibleByArgument<>.allValueStrings.getter()
{
  return static ExpressibleByArgument<>.allValueStrings.getter();
}

uint64_t static ExpressibleByArgument<>.defaultCompletionKind.getter()
{
  return static ExpressibleByArgument<>.defaultCompletionKind.getter();
}

uint64_t Argument.wrappedValue.getter()
{
  return Argument.wrappedValue.getter();
}

uint64_t Argument.init<A>(help:completion:)()
{
  return Argument.init<A>(help:completion:)();
}

uint64_t Argument<A>.init(wrappedValue:help:completion:)()
{
  return Argument<A>.init(wrappedValue:help:completion:)();
}

uint64_t type metadata accessor for Argument()
{
  return type metadata accessor for Argument();
}

uint64_t static ArgumentVisibility.default.getter()
{
  return static ArgumentVisibility.default.getter();
}

uint64_t type metadata accessor for ArgumentVisibility()
{
  return type metadata accessor for ArgumentVisibility();
}

uint64_t ArgumentHelp.init(stringLiteral:)()
{
  return ArgumentHelp.init(stringLiteral:)();
}

uint64_t type metadata accessor for ArgumentHelp()
{
  return type metadata accessor for ArgumentHelp();
}

uint64_t OptionGroup.wrappedValue.getter()
{
  return OptionGroup.wrappedValue.getter();
}

uint64_t OptionGroup.init(title:visibility:)()
{
  return OptionGroup.init(title:visibility:)();
}

uint64_t type metadata accessor for OptionGroup()
{
  return type metadata accessor for OptionGroup();
}

uint64_t type metadata accessor for CompletionKind()
{
  return type metadata accessor for CompletionKind();
}

uint64_t static ParsableCommand._commandName.getter()
{
  return static ParsableCommand._commandName.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableCommand.run()()
{
}

uint64_t type metadata accessor for ValidationError()
{
  return type metadata accessor for ValidationError();
}

uint64_t ValidationError.init(_:)()
{
  return ValidationError.init(_:)();
}

uint64_t static NameSpecification.shortAndLong.getter()
{
  return static NameSpecification.shortAndLong.getter();
}

uint64_t static NameSpecification.long.getter()
{
  return static NameSpecification.long.getter();
}

uint64_t type metadata accessor for NameSpecification()
{
  return type metadata accessor for NameSpecification();
}

uint64_t static ParsableArguments._errorLabel.getter()
{
  return static ParsableArguments._errorLabel.getter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParsableArguments.validate()()
{
}

uint64_t CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)()
{
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)();
}

uint64_t type metadata accessor for CommandConfiguration()
{
  return type metadata accessor for CommandConfiguration();
}

uint64_t static SingleValueParsingStrategy.next.getter()
{
  return static SingleValueParsingStrategy.next.getter();
}

uint64_t type metadata accessor for SingleValueParsingStrategy()
{
  return type metadata accessor for SingleValueParsingStrategy();
}

uint64_t Flag.wrappedValue.getter()
{
  return Flag.wrappedValue.getter();
}

uint64_t Flag<A>.init(wrappedValue:name:help:)()
{
  return Flag<A>.init(wrappedValue:name:help:)();
}

uint64_t Option.wrappedValue.getter()
{
  return Option.wrappedValue.getter();
}

uint64_t Option<A>.init(wrappedValue:name:parsing:help:completion:)()
{
  return Option<A>.init(wrappedValue:name:parsing:help:completion:)();
}

uint64_t Option<A>.init(name:parsing:help:completion:)()
{
  return Option<A>.init(name:parsing:help:completion:)();
}

uint64_t type metadata accessor for Option()
{
  return type metadata accessor for Option();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
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

uint64_t RawRepresentable<>.init(argument:)()
{
  return RawRepresentable<>.init(argument:)();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
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

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t AnyHashable.description.getter()
{
  return AnyHashable.description.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t static ContinuousClock.Instant.now.getter()
{
  return static ContinuousClock.Instant.now.getter();
}

uint64_t ContinuousClock.Instant.advanced(by:)()
{
  return ContinuousClock.Instant.advanced(by:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t static Clock<>.continuous.getter()
{
  return static Clock<>.continuous.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t FHDateEndOfMonth()
{
  return _FHDateEndOfMonth();
}

uint64_t FHDateEndOfWeekStartingOnMonday()
{
  return _FHDateEndOfWeekStartingOnMonday();
}

uint64_t FHDateStartOfMonth()
{
  return _FHDateStartOfMonth();
}

uint64_t FHDateStartOfWeekOnMonday()
{
  return _FHDateStartOfWeekOnMonday();
}

uint64_t FHStartOfYear()
{
  return _FHStartOfYear();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void exit(int a1)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_job_run()
{
  return _swift_job_run();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_asyncMainDrainQueue()
{
  return _swift_task_asyncMainDrainQueue();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}