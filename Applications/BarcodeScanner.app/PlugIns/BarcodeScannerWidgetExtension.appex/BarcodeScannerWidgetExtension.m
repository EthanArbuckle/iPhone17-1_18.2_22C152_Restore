unint64_t sub_1000038F8()
{
  unint64_t result;

  result = qword_10000C028;
  if (!qword_10000C028)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_100003950()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_1000039A4()
{
  uint64_t v0 = sub_100006C80();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CC0();
  __chkstk_darwin();
  sub_100006DA0();
  __chkstk_darwin();
  uint64_t v4 = sub_100006C90();
  sub_1000059E4(v4, qword_10000C180);
  sub_1000059AC(v4, (uint64_t)qword_10000C180);
  sub_100006D90();
  sub_100006CB0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006CA0();
}

uint64_t sub_100003B94(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100006CF0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_100006DF0();
  v1[6] = sub_100006DE0();
  uint64_t v4 = sub_100006DD0();
  return _swift_task_switch(sub_100003C88, v4, v3);
}

uint64_t sub_100003C88()
{
  swift_release();
  sub_100006CD0();
  uint64_t v1 = sub_100006CE0();
  os_log_type_t v2 = sub_100006E00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "BarcodeScannerIntent performed successfully", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  id v7 = [self defaultCenter];
  [v7 postNotificationName:BCSDidLaunchFromControlNotification object:0];

  sub_100006BB0();
  swift_task_dealloc();
  v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100003DE4()
{
  return sub_100006BD0();
}

uint64_t sub_100003E08()
{
  return sub_100006BE0();
}

void (*sub_100003E2C(void *a1))(void *a1)
{
  os_log_type_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006BC0();
  return sub_100003E88;
}

void sub_100003E88(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100003ED8()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100003F30()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_100003F84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004F24(a1, a2, a3, (void (*)(void))sub_100003FCC);
}

unint64_t sub_100003FCC()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100004020@<X0>(uint64_t a1@<X8>)
{
  return sub_100004E54(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C180, a1);
}

uint64_t sub_100004058()
{
  return 1;
}

uint64_t sub_100004064()
{
  return 0;
}

uint64_t sub_100004074(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000410C;
  return sub_100003B94(a1);
}

uint64_t sub_10000410C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005454();
  *a1 = result;
  return result;
}

void *sub_100004228()
{
  return &protocol witness table for Never;
}

void *sub_100004234()
{
  return &protocol witness table for Never;
}

uint64_t sub_100004244(uint64_t a1)
{
  unint64_t v2 = sub_100003FCC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100004280()
{
  uint64_t v0 = sub_100006DA0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100005410(&qword_10000C0D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_100006C80();
  uint64_t v4 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006CC0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100006C90();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100006C70();
  sub_1000059E4(v10, qword_10000C198);
  sub_1000059AC(v10, (uint64_t)qword_10000C198);
  sub_100006D90();
  sub_100006CB0();
  (*(void (**)(char *, void, void))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100006CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  return sub_100006C60();
}

unint64_t sub_100004564()
{
  uint64_t v0 = sub_100006DA0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100005410(&qword_10000C0D0);
  __chkstk_darwin(v1 - 8);
  v17 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005410(&qword_10000C0D8);
  __chkstk_darwin(v3 - 8);
  v16 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006C80();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006CC0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100006C90();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100005410(&qword_10000C0E0);
  sub_100005410(&qword_10000C0E8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100006FE0;
  sub_100006D90();
  sub_100006CB0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_100006CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  uint64_t v13 = sub_100006C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v17, 1, 1, v13);
  sub_100006C10();
  unint64_t result = sub_100004954(v12);
  qword_10000C1B0 = result;
  return result;
}

unint64_t sub_100004954(uint64_t a1)
{
  uint64_t v2 = sub_100005410(&qword_10000C0E8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005410(&qword_10000C0F0);
  uint64_t v6 = sub_100006E10();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100005944(v10, (uint64_t)v5);
    unint64_t result = sub_1000058E0();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[7];
    uint64_t v16 = sub_100006C20();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v5, v16);
    uint64_t v17 = v7[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v7[2] = v19;
    v10 += v11;
    if (!--v8)
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

unint64_t sub_100004B20()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

uint64_t sub_100004B80@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000087C0;
  v7._object = v3;
  Swift::Int v5 = sub_100006E20(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100004BD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005A48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100004C00()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100004C58()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

void *sub_100004CAC()
{
  return &protocol witness table for String;
}

unint64_t sub_100004CBC()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100004D14()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100004D6C()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100004DC4()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_100004E1C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004E54(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C198, a1);
}

uint64_t sub_100004E54@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000059AC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004F24(a1, a2, a3, (void (*)(void))sub_100004F6C);
}

uint64_t sub_100004F24(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004F6C()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100004FC0(uint64_t a1)
{
  unint64_t v2 = sub_100004F6C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005010()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100005068()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_1000050C0()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100005114()
{
  if (qword_10000C020 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100005170(uint64_t a1)
{
  unint64_t v2 = sub_100004DC4();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000051BC()
{
  return sub_1000053CC(&qword_10000C0B0, &qword_10000C0B8);
}

uint64_t sub_1000051F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005240(void *a1@<X8>)
{
  *a1 = &off_1000087F8;
}

uint64_t getEnumTagSinglePayload for LaunchCodeScannerAppEnum(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LaunchCodeScannerAppEnum(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100005344);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeScannerAppEnum()
{
  return &type metadata for LaunchCodeScannerAppEnum;
}

ValueMetadata *type metadata accessor for BarcodeScannerIntent()
{
  return &type metadata for BarcodeScannerIntent;
}

uint64_t sub_100005390()
{
  return sub_1000053CC(&qword_10000C0C0, &qword_10000C0C8);
}

uint64_t sub_1000053CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000051F8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005410(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005454()
{
  sub_100006DA0();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = sub_100006C30();
  uint64_t v22 = *(void *)(v0 - 8);
  uint64_t v23 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v21 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005410(&qword_10000C0F8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - v4;
  uint64_t v6 = sub_100005410(&qword_10000C0D8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006C80();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006CC0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006C90();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_100006D90();
  uint64_t v19 = sub_100005410(&qword_10000C100);
  sub_100006CB0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_100006CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v8, 1, 1, v14);
  char v24 = 1;
  uint64_t v16 = sub_100006BA0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v5, 1, 1, v16);
  v17(v20, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for InputConnectionBehavior.default(_:), v23);
  sub_100004F6C();
  return sub_100006BF0();
}

uint64_t sub_1000058B4(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1000058E0()
{
  sub_100006E30();
  sub_100006DC0();
  Swift::Int v0 = sub_100006E40();

  return sub_1000058B4(v0);
}

uint64_t sub_100005944(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005410(&qword_10000C0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000059AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000059E4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005A48()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100005A5C()
{
  return sub_100006E40();
}

uint64_t sub_100005AAC()
{
  return sub_100006DC0();
}

Swift::Int sub_100005AC0()
{
  return sub_100006E40();
}

uint64_t sub_100005B0C()
{
  uint64_t v0 = sub_100006DA0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100006CC0();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100005410(&qword_10000C118);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006D90();
  sub_100006CB0();
  v8[1] = sub_100006DB0();
  v8[2] = v6;
  sub_100005DB8();
  sub_100006D20();
  sub_100005E0C();
  sub_100006D10();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005D38()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScannerWidgetBundle()
{
  return &type metadata for BarcodeScannerWidgetBundle;
}

uint64_t sub_100005D9C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005DB8()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100005E0C()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    sub_1000051F8(&qword_10000C118);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_100005E68()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for BarcodeScannerWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BarcodeScannerWidget()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BarcodeScannerWidget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for BarcodeScannerWidget(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for BarcodeScannerWidget(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BarcodeScannerWidget(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BarcodeScannerWidget(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScannerWidget()
{
  return &type metadata for BarcodeScannerWidget;
}

uint64_t sub_100006014()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v5 = sub_100006DA0();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v49 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v57 = (char *)v42 - v8;
  uint64_t v9 = sub_100006C80();
  uint64_t v43 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006CC0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006C90();
  uint64_t v50 = *(void *)(v14 - 8);
  uint64_t v51 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  v55 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  BOOL v18 = (char *)v42 - v17;
  uint64_t v19 = sub_100005410(&qword_10000C130);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v46 = v19;
  uint64_t v47 = v20;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005410(&qword_10000C138);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v52 = v23;
  uint64_t v53 = v24;
  __chkstk_darwin(v23);
  v45 = (char *)v42 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100005410(&qword_10000C140);
  uint64_t v56 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  v48 = (char *)v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = a2;
  swift_bridgeObjectRetain();
  sub_100005410(&qword_10000C148);
  sub_1000053CC(&qword_10000C150, &qword_10000C148);
  sub_100006D80();
  sub_100006D90();
  sub_100006CB0();
  uint64_t v28 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v29 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v42[1] = v10 + 104;
  v44 = v29;
  v29(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v30 = v12;
  sub_100006CA0();
  uint64_t v31 = sub_1000053CC(&qword_10000C158, &qword_10000C130);
  uint64_t v32 = v46;
  sub_100006D40();
  uint64_t v33 = v51;
  v34 = *(void (**)(char *, uint64_t))(v50 + 8);
  v34(v18, v51);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v32);
  sub_100006D90();
  sub_100006CB0();
  v44(v30, v28, v43);
  v35 = v55;
  sub_100006CA0();
  uint64_t v59 = v32;
  uint64_t v60 = v31;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v37 = v48;
  uint64_t v38 = v52;
  v39 = v45;
  sub_100006D30();
  v34(v35, v33);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v38);
  uint64_t v59 = v38;
  uint64_t v60 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v54;
  sub_100006D50();
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v37, v40);
}

uint64_t sub_1000066D4(uint64_t a1, uint64_t a2)
{
  sub_100005454();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_bridgeObjectRetain();
  sub_100005410(&qword_10000C160);
  sub_1000053CC(&qword_10000C168, &qword_10000C160);
  sub_1000068A0();
  return sub_100006D70();
}

uint64_t sub_1000067B0()
{
  return sub_100006D60();
}

uint64_t sub_100006828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006948();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006850@<X0>(uint64_t a1@<X8>)
{
  return sub_100006030(*v1, v1[1], a1);
}

uint64_t sub_100006858()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006890()
{
  return sub_1000066D4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100006898()
{
  return sub_1000067B0();
}

unint64_t sub_1000068A0()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

unint64_t sub_1000068F4()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_100006948()
{
  uint64_t v0 = sub_100006DA0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100006CC0();
  __chkstk_darwin(v1 - 8);
  sub_100006D90();
  sub_100006CB0();
  return sub_100006DB0();
}

uint64_t sub_100006A58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006B60()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006B70()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006B80()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006BA0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006BB0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006BC0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006BD0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006BE0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006BF0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006C00()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006C10()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100006C20()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006C30()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006C50()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006C60()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006C70()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006C80()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006C90()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006CA0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006CB0()
{
  return static Locale.current.getter();
}

uint64_t sub_100006CC0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006CD0()
{
  return static Logger.intent.getter();
}

uint64_t sub_100006CE0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006D00()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100006D10()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100006D20()
{
  return _ControlWidgetAdaptor.init(_:)();
}

uint64_t sub_100006D30()
{
  return ControlWidgetConfiguration.description(_:)();
}

uint64_t sub_100006D40()
{
  return ControlWidgetConfiguration.displayName(_:)();
}

uint64_t sub_100006D50()
{
  return ControlWidgetConfiguration.showsInSystemSpaces()();
}

uint64_t sub_100006D60()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_100006D70()
{
  return ControlWidgetButton.init<>(action:label:)();
}

uint64_t sub_100006D80()
{
  return StaticControlConfiguration.init(kind:content:)();
}

uint64_t sub_100006D90()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006DB0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100006DC0()
{
  return String.hash(into:)();
}

uint64_t sub_100006DD0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006DE0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006DF0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006E00()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006E10()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006E20(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006E30()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006E40()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}