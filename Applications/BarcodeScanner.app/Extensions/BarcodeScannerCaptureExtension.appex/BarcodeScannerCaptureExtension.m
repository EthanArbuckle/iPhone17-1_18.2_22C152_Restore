id sub_100004360()
{
  id v0;
  uint64_t vars8;

  sub_100006CF0();
  sub_100006CE0();
  v0 = objc_allocWithZone((Class)BCSRootViewController);

  return [v0 init];
}

uint64_t sub_1000043C8()
{
  return sub_100006D90();
}

uint64_t sub_100004404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100004974();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100004468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100004974();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000044CC()
{
  return sub_100006E10();
}

void sub_1000044E8()
{
}

uint64_t sub_100004510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_retain();
  uint64_t v4 = sub_100006D60();
  uint64_t result = sub_100006E00();
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100004554()
{
  uint64_t v0 = sub_100004798(&qword_10000C048);
  unint64_t v1 = sub_1000047DC();

  return LockedCameraCaptureUIScene.init(content:)(sub_100004510, 0, v0, v1);
}

uint64_t sub_1000045BC(uint64_t a1)
{
  unint64_t v2 = sub_100004744();

  return LockedCameraCaptureExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100004664()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScannerCaptureExtension()
{
  return &type metadata for BarcodeScannerCaptureExtension;
}

uint64_t sub_1000046CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000046EC()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    sub_100006CD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100004744()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_100004798(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000047DC()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    sub_100004858(&qword_10000C048);
    sub_1000048A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100004858(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000048A0()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScanner()
{
  return &type metadata for BarcodeScanner;
}

unint64_t sub_100004908()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    sub_100004858(&qword_10000C068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

void *sub_100004968()
{
  return &protocol witness table for Never;
}

unint64_t sub_100004974()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_1000049CC()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100004A24()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100004A78()
{
  uint64_t v0 = sub_100006C80();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CC0();
  __chkstk_darwin();
  sub_100006E30();
  __chkstk_darwin();
  uint64_t v4 = sub_100006C90();
  sub_100006A28(v4, qword_10000CC60);
  sub_1000069F0(v4, (uint64_t)qword_10000CC60);
  sub_100006E20();
  sub_100006CB0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006CA0();
}

uint64_t sub_100004C68(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_100006D50();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_100006E70();
  v1[6] = sub_100006E60();
  uint64_t v4 = sub_100006E50();
  return _swift_task_switch(sub_100004D5C, v4, v3);
}

uint64_t sub_100004D5C()
{
  swift_release();
  sub_100006D30();
  uint64_t v1 = sub_100006D40();
  os_log_type_t v2 = sub_100006E80();
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

uint64_t sub_100004EB8()
{
  return sub_100006BD0();
}

uint64_t sub_100004EDC()
{
  return sub_100006BE0();
}

void (*sub_100004F00(void *a1))(void *a1)
{
  os_log_type_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006BC0();
  return sub_100004F5C;
}

void sub_100004F5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100004FAC()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100005004()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

uint64_t sub_100005058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005FF8(a1, a2, a3, (void (*)(void))sub_1000050A0);
}

unint64_t sub_1000050A0()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_1000050F4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005F28(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CC60, a1);
}

uint64_t sub_10000512C()
{
  return 1;
}

uint64_t sub_100005138()
{
  return 0;
}

uint64_t sub_100005148(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000051E0;
  return sub_100004C68(a1);
}

uint64_t sub_1000051E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000052D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006498();
  *a1 = result;
  return result;
}

void *sub_1000052FC()
{
  return &protocol witness table for Never;
}

void *sub_100005308()
{
  return &protocol witness table for Never;
}

uint64_t sub_100005318(uint64_t a1)
{
  unint64_t v2 = sub_1000050A0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100005354()
{
  uint64_t v0 = sub_100006E30();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100004798(&qword_10000C128);
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
  sub_100006A28(v10, qword_10000CC78);
  sub_1000069F0(v10, (uint64_t)qword_10000CC78);
  sub_100006E20();
  sub_100006CB0();
  (*(void (**)(char *, void, void))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100006CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  return sub_100006C60();
}

unint64_t sub_100005638()
{
  uint64_t v0 = sub_100006E30();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100004798(&qword_10000C120);
  __chkstk_darwin(v1 - 8);
  v17 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004798(&qword_10000C128);
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
  sub_100004798(&qword_10000C130);
  sub_100004798(&qword_10000C138);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100007250;
  sub_100006E20();
  sub_100006CB0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_100006CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v16, 1, 1, v10);
  uint64_t v13 = sub_100006C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v17, 1, 1, v13);
  sub_100006C10();
  unint64_t result = sub_100005A28(v12);
  qword_10000CC90 = result;
  return result;
}

unint64_t sub_100005A28(uint64_t a1)
{
  uint64_t v2 = sub_100004798(&qword_10000C138);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004798(&qword_10000C140);
  uint64_t v6 = sub_100006E90();
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
    sub_100006988(v10, (uint64_t)v5);
    unint64_t result = sub_100006924();
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

unint64_t sub_100005BF4()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_100005C54@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008820;
  v7._object = v3;
  Swift::Int v5 = sub_100006EA0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100005CA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006A8C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100005CD4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_100005D2C()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

void *sub_100005D80()
{
  return &protocol witness table for String;
}

unint64_t sub_100005D90()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100005DE8()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100005E40()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100005E98()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_100005EF0@<X0>(uint64_t a1@<X8>)
{
  return sub_100005F28(&qword_10000C020, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CC78, a1);
}

uint64_t sub_100005F28@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000069F0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005FF8(a1, a2, a3, (void (*)(void))sub_100006040);
}

uint64_t sub_100005FF8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006040()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_100006094(uint64_t a1)
{
  unint64_t v2 = sub_100006040();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000060E4()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_10000613C()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

unint64_t sub_100006194()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_1000061E8()
{
  if (qword_10000C028 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000CC90;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_100006244(uint64_t a1)
{
  unint64_t v2 = sub_100005E98();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100006290()
{
  return sub_100006454(&qword_10000C100, &qword_10000C108);
}

void sub_1000062CC(void *a1@<X8>)
{
  *a1 = &off_100008858;
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
      JUMPOUT(0x1000063D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
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

uint64_t sub_100006418()
{
  return sub_100006454(&qword_10000C110, &qword_10000C118);
}

uint64_t sub_100006454(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004858(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006498()
{
  sub_100006E30();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = sub_100006C30();
  uint64_t v22 = *(void *)(v0 - 8);
  uint64_t v23 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v21 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004798(&qword_10000C148);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v20 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - v4;
  uint64_t v6 = sub_100004798(&qword_10000C128);
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
  sub_100006E20();
  uint64_t v19 = sub_100004798(&qword_10000C150);
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
  sub_100006040();
  return sub_100006BF0();
}

uint64_t sub_1000068F8(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100006924()
{
  sub_100006EB0();
  sub_100006E40();
  Swift::Int v0 = sub_100006EC0();

  return sub_1000068F8(v0);
}

uint64_t sub_100006988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004798(&qword_10000C138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000069F0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006A28(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006A8C()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100006AA0()
{
  return sub_100006EC0();
}

uint64_t sub_100006AF0()
{
  return sub_100006E40();
}

Swift::Int sub_100006B04()
{
  return sub_100006EC0();
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
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_100006CE0()
{
  return static BCSSecureCaptureSession.setSession(session:)();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for BCSSecureCaptureSession();
}

uint64_t sub_100006D00()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100006D30()
{
  return static Logger.intent.getter();
}

uint64_t sub_100006D40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006D50()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006D60()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_100006D70()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_100006D80()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_100006D90()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_100006DB0()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_100006DC0()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100006DD0()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_100006DF0()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_100006E00()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100006E10()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006E20()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006E30()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006E40()
{
  return String.hash(into:)();
}

uint64_t sub_100006E50()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006E60()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006E70()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006E80()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006E90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006EA0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006EB0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006EC0()
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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