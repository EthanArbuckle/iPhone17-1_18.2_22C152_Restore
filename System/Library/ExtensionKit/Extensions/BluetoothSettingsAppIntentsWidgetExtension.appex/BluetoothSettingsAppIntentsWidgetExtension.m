unint64_t sub_100005398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  void (*v17)(char *, void, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t result;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;

  sub_100007CB8(&qword_1000142C8);
  ((void (*)(void))__chkstk_darwin)();
  v34 = (char *)&v24 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007CB8(&qword_1000142A0);
  ((void (*)(void))__chkstk_darwin)();
  v35 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_10000D030();
  v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D080();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000D140();
  ((void (*)(void))__chkstk_darwin)();
  v33 = sub_10000D040();
  v6 = *(void *)(v33 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v31 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v28 = (char *)&v24 - v9;
  sub_100007CB8(&qword_1000142D0);
  v10 = *(void *)(sub_100007CB8(&qword_1000142D8) - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10000D460;
  v29 = v12 + v11;
  v30 = v12;
  sub_10000D130();
  sub_10000D070();
  v13 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v14(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v26 = v3 + 104;
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v14(v5, v13, v2);
  v15 = v14;
  v16 = v35;
  sub_10000D050();
  v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  v6 += 56;
  v17(v16, 0, 1, v33);
  v18 = v34;
  sub_10000CEB0();
  v19 = sub_10000CEC0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
  sub_100007CB8(&qword_1000142E0);
  v20 = (*(unsigned __int8 *)(v6 + 24) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 24);
  v32 = *(void *)(v6 + 16);
  v21 = swift_allocObject();
  v27 = v21;
  *(_OWORD *)(v21 + 16) = xmmword_10000D470;
  v33 = v21 + v20;
  sub_10000D130();
  sub_10000D070();
  v15(v5, v13, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v15(v5, v13, v2);
  sub_10000D050();
  v24 = v33 + 2 * v32;
  sub_10000D130();
  sub_10000D070();
  v25 = v13;
  v15(v5, v13, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v15(v5, v13, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v22 = v25;
  v15(v5, v25, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v15(v5, v22, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v15(v5, v22, v2);
  sub_10000D050();
  sub_10000CED0();
  result = sub_100005CA4(v30);
  qword_100014688 = result;
  return result;
}

unint64_t sub_100005CA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_100007CB8(&qword_1000142D8) - 8);
  __chkstk_darwin();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007CB8(&qword_1000142E8);
  uint64_t v5 = sub_10000D1D0();
  v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  uint64_t v9 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v10 = *(void *)(v2 + 72);
  swift_retain();
  while (1)
  {
    sub_100007E94(v9, (uint64_t)v4);
    unint64_t result = sub_1000077E8();
    if (v12) {
      break;
    }
    unint64_t v13 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v14 = v6[7];
    uint64_t v15 = sub_10000CEE0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * v13, v4, v15);
    uint64_t v16 = v6[2];
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (v17) {
      goto LABEL_11;
    }
    v6[2] = v18;
    v9 += v10;
    if (!--v7)
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

uint64_t sub_100005E68()
{
  sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin();
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_10000D030();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D080();
  __chkstk_darwin();
  sub_10000D140();
  __chkstk_darwin();
  uint64_t v5 = sub_10000D040();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_10000CFF0();
  sub_100007E30(v7, qword_100014690);
  sub_100007DF8(v7, (uint64_t)qword_100014690);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v9[0]);
  sub_10000D050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_10000CFE0();
}

uint64_t sub_100006150()
{
  return 1;
}

unint64_t sub_10000615C()
{
  unint64_t result = qword_1000141E0;
  if (!qword_1000141E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141E0);
  }
  return result;
}

Swift::Int sub_1000061B0()
{
  return sub_10000D200();
}

uint64_t sub_100006208()
{
  return sub_10000D160();
}

Swift::Int sub_100006224()
{
  return sub_10000D200();
}

uint64_t sub_100006278@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100010BF0;
  v7._object = v3;
  Swift::Int v5 = sub_10000D1E0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000062CC(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x800000010000E420;
}

unint64_t sub_1000062F0()
{
  unint64_t result = qword_1000141E8;
  if (!qword_1000141E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141E8);
  }
  return result;
}

unint64_t sub_100006348()
{
  unint64_t result = qword_1000141F0;
  if (!qword_1000141F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141F0);
  }
  return result;
}

uint64_t sub_10000639C(uint64_t a1)
{
  unint64_t v2 = sub_1000062F0();

  return _EnumURLRepresentation.init(stringLiteral:)(0xD000000000000016, 0x800000010000E550, a1, v2);
}

unint64_t sub_1000063FC()
{
  unint64_t result = qword_1000141F8;
  if (!qword_1000141F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000141F8);
  }
  return result;
}

unint64_t sub_100006454()
{
  unint64_t result = qword_100014200;
  if (!qword_100014200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014200);
  }
  return result;
}

unint64_t sub_1000064AC()
{
  unint64_t result = qword_100014208;
  if (!qword_100014208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014208);
  }
  return result;
}

void *sub_100006500()
{
  return &protocol witness table for String;
}

uint64_t sub_10000650C()
{
  sub_100007DA4();
  uint64_t v2 = sub_10000CF00();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007EFC(v3, v0, v2, v1);
}

unint64_t sub_1000065A4()
{
  unint64_t result = qword_100014218;
  if (!qword_100014218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014218);
  }
  return result;
}

unint64_t sub_1000065FC()
{
  unint64_t result = qword_100014220;
  if (!qword_100014220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014220);
  }
  return result;
}

unint64_t sub_100006654()
{
  unint64_t result = qword_100014228;
  if (!qword_100014228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014228);
  }
  return result;
}

unint64_t sub_1000066AC()
{
  unint64_t result = qword_100014230;
  if (!qword_100014230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014230);
  }
  return result;
}

uint64_t sub_100006704@<X0>(uint64_t a1@<X8>)
{
  return sub_100007310(&qword_100014190, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100014690, a1);
}

uint64_t sub_10000673C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007290(a1, a2, a3, (void (*)(void))sub_1000062F0);
}

uint64_t sub_100006768(uint64_t a1)
{
  unint64_t v2 = sub_1000062F0();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000067B8()
{
  unint64_t result = qword_100014238;
  if (!qword_100014238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014238);
  }
  return result;
}

unint64_t sub_100006810()
{
  unint64_t result = qword_100014240;
  if (!qword_100014240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014240);
  }
  return result;
}

unint64_t sub_100006868()
{
  unint64_t result = qword_100014248;
  if (!qword_100014248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014248);
  }
  return result;
}

uint64_t sub_1000068BC()
{
  if (qword_100014188 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100006918(uint64_t a1)
{
  unint64_t v2 = sub_1000066AC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006968()
{
  unint64_t result = qword_100014250;
  if (!qword_100014250)
  {
    sub_1000069C4(&qword_100014258);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014250);
  }
  return result;
}

uint64_t sub_1000069C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100006A0C(void *a1@<X8>)
{
  *a1 = &off_100010C28;
}

unint64_t sub_100006A20()
{
  unint64_t result = qword_100014260;
  if (!qword_100014260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014260);
  }
  return result;
}

uint64_t sub_100006A74()
{
  uint64_t v0 = sub_10000D030();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D080();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000D140();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10000D040();
  sub_100007E30(v6, qword_1000146A8);
  sub_100007DF8(v6, (uint64_t)qword_1000146A8);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10000D050();
}

uint64_t sub_100006C64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_10000D030();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10000D080();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_10000D140();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10000D040();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_10000D050();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_10000CE70();
  uint64_t v13 = sub_10000CE60();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 0, 1, v13);
}

uint64_t sub_100006F6C()
{
  return sub_10000CE00();
}

uint64_t sub_100006F90()
{
  return sub_10000CE10();
}

void (*sub_100006FB4(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000CDF0();
  return sub_100007010;
}

void sub_100007010(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100007060()
{
  unint64_t result = qword_100014268;
  if (!qword_100014268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014268);
  }
  return result;
}

unint64_t sub_1000070B8()
{
  unint64_t result = qword_100014270;
  if (!qword_100014270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014270);
  }
  return result;
}

uint64_t sub_10000710C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100007CFC();
  unint64_t v5 = sub_100007DA4();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100007178()
{
  uint64_t v0 = qword_1000141A0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000071B8()
{
  unint64_t result = qword_100014278;
  if (!qword_100014278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014278);
  }
  return result;
}

unint64_t sub_100007210()
{
  unint64_t result = qword_100014280;
  if (!qword_100014280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014280);
  }
  return result;
}

uint64_t sub_100007264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007290(a1, a2, a3, (void (*)(void))sub_100007060);
}

uint64_t sub_100007290(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000072D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100007310(&qword_100014198, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000146A8, a1);
}

uint64_t sub_100007310@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007DF8(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000073B4()
{
  return 0;
}

uint64_t sub_1000073C8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007CFC();
  unint64_t v7 = sub_100007D50();
  unint64_t v8 = sub_100007DA4();
  *unint64_t v5 = v2;
  v5[1] = sub_10000749C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000749C()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_1000075A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007854();
  *a1 = result;
  return result;
}

uint64_t sub_1000075CC(uint64_t a1)
{
  unint64_t v2 = sub_100007060();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

void type metadata accessor for CBManagerState()
{
  if (!qword_100014290)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100014290);
    }
  }
}

ValueMetadata *type metadata accessor for OpenBluetoothSettingsDeepLinks()
{
  return &type metadata for OpenBluetoothSettingsDeepLinks;
}

uint64_t getEnumTagSinglePayload for BluetoothSettingsStaticDeepLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BluetoothSettingsStaticDeepLinks(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100007764);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BluetoothSettingsStaticDeepLinks()
{
  return &type metadata for BluetoothSettingsStaticDeepLinks;
}

void *sub_1000077A0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000077B0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000077BC(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_1000077E8()
{
  sub_10000D1F0();
  sub_10000D160();
  Swift::Int v0 = sub_10000D200();

  return sub_1000077BC(v0);
}

uint64_t sub_100007854()
{
  uint64_t v0 = sub_10000CF40();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007CB8(&qword_100014298);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000D030();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000D080();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10000D140();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10000D040();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100007CB8(&qword_1000142A8);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10000D050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 1;
  uint64_t v18 = sub_10000CDB0();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_1000062F0();
  return sub_10000CE20();
}

uint64_t sub_100007CB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100007CFC()
{
  unint64_t result = qword_1000142B0;
  if (!qword_1000142B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142B0);
  }
  return result;
}

unint64_t sub_100007D50()
{
  unint64_t result = qword_1000142B8;
  if (!qword_1000142B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142B8);
  }
  return result;
}

unint64_t sub_100007DA4()
{
  unint64_t result = qword_1000142C0;
  if (!qword_1000142C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000142C0);
  }
  return result;
}

uint64_t sub_100007DF8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007E30(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007CB8(&qword_1000142D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007EFC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100007F10()
{
  type metadata accessor for BluetoothAppIntentsManager();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = [objc_allocWithZone((Class)CBController) init];
  *(void *)(v0 + 24) = 0;
  uint64_t result = sub_10000D060();
  qword_1000146C0 = v0;
  return result;
}

uint64_t sub_100007F88()
{
  sub_10000D060();
  [*(id *)(v0 + 16) invalidate];

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for BluetoothAppIntentsManager()
{
  return self;
}

uint64_t sub_100008018(uint64_t result)
{
  if (result)
  {
    sub_10000D1B0(19);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    sub_100007CB8(&qword_1000143D8);
    v1._countAndFlagsBits = sub_10000D150();
    sub_10000D170(v1);
    swift_bridgeObjectRelease();
    uint64_t result = sub_10000D1C0();
    __break(1u);
  }
  return result;
}

BOOL sub_1000080E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000D110();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  *(void *)(v8 + 24) = v6;
  aBlock[4] = sub_1000083C8;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000083D0;
  aBlock[3] = &unk_100010D78;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = v7;
  swift_retain();
  uint64_t v11 = v6;
  swift_release();
  [v10 getPowerStateWithCompletion:v9];
  _Block_release(v9);

  sub_10000D100();
  sub_10000D190();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return *(void *)(v1 + 24) == 5;
}

Swift::Int sub_1000082A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    sub_10000D1B0(16);
    swift_bridgeObjectRelease();
    swift_errorRetain();
    sub_100007CB8(&qword_1000143D8);
    v4._countAndFlagsBits = sub_10000D150();
    sub_10000D170(v4);
    swift_bridgeObjectRelease();
    Swift::Int result = sub_10000D1C0();
    __break(1u);
  }
  else
  {
    *(void *)(a3 + 24) = a1;
    return sub_10000D1A0();
  }
  return result;
}

uint64_t sub_100008388()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_1000083C8(uint64_t a1, uint64_t a2)
{
  return sub_1000082A0(a1, a2, *(void *)(v2 + 16));
}

void sub_1000083D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100008448(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008458()
{
  return swift_release();
}

uint64_t sub_100008460()
{
  unint64_t v0 = sub_10000855C();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for BluetoothPowerToggle, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000084DC()
{
  unint64_t result = qword_1000143E0;
  if (!qword_1000143E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000143E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BluetoothSettingsAppIntentsWidgetBundle()
{
  return &type metadata for BluetoothSettingsAppIntentsWidgetBundle;
}

uint64_t sub_100008540()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000855C()
{
  unint64_t result = qword_1000143E8;
  if (!qword_1000143E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000143E8);
  }
  return result;
}

uint64_t sub_1000085B0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008600()
{
  unint64_t result = qword_100014410;
  if (!qword_100014410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014410);
  }
  return result;
}

uint64_t sub_100008654()
{
  return sub_10000CBB4(&qword_100014418, &qword_100014420);
}

void sub_100008690(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000086FC()
{
  uint64_t v0 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v0 - 8);
  uint64_t v16 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10000D030();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D080();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000D140();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000D040();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v15[0] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000CFF0();
  sub_100007E30(v11, qword_1000146C8);
  v15[1] = sub_100007DF8(v11, (uint64_t)qword_1000146C8);
  sub_10000D130();
  sub_10000D070();
  uint64_t v12 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v13(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000D050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v16, 1, 1, v8);
  sub_100007CB8(&qword_1000142E0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000DB10;
  sub_10000D130();
  sub_10000D070();
  v13(v5, v12, v2);
  sub_10000D050();
  sub_10000D130();
  sub_10000D070();
  v13(v5, v12, v2);
  sub_10000D050();
  return sub_10000CFD0();
}

uint64_t sub_100008B34()
{
  uint64_t v0 = sub_10000D040();
  sub_100007E30(v0, qword_1000146E0);
  sub_100007DF8(v0, (uint64_t)qword_1000146E0);
  return sub_10000D020();
}

uint64_t sub_100008B98()
{
  uint64_t v0 = sub_100007CB8(&qword_1000145C0);
  sub_100007E30(v0, qword_1000146F8);
  uint64_t v1 = sub_100007DF8(v0, (uint64_t)qword_1000146F8);
  sub_10000CE50();
  uint64_t v2 = sub_10000CE60();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100008C50()
{
  uint64_t result = swift_getKeyPath();
  qword_100014710 = result;
  return result;
}

uint64_t sub_100008C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_100008CA0, 0, 0);
}

uint64_t sub_100008CA0()
{
  sub_10000CE00();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10000CE00();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_1000141D0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100014710;
  *(void *)(v0 + 80) = qword_100014710;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_10000CBB4(&qword_100014590, &qword_100014598);
  *(void *)(v0 + 96) = v4;
  *uint64_t v3 = v0;
  v3[1] = sub_100008DFC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_100008DFC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100009208;
  }
  else {
    uint64_t v2 = sub_100008F50;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008F50()
{
  sub_10000CE00();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_100014710;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10000902C;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_10000902C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100009220;
  }
  else {
    uint64_t v2 = sub_100009180;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100009180()
{
  *(unsigned char *)(v0 + 147) = *(unsigned char *)(v0 + 144);
  sub_10000CAC0();
  sub_10000CDC0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100009208()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009220()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009238@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10000CE00();
  *a1 = v3;
  return result;
}

uint64_t sub_100009274()
{
  return swift_release();
}

void (*sub_1000092BC(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000CDF0();
  return sub_100009318;
}

uint64_t sub_10000931C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000CE00();
  *a1 = v3;
  return result;
}

uint64_t sub_100009358()
{
  return sub_10000CE10();
}

void (*sub_100009390(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10000CDF0();
  return sub_100009318;
}

uint64_t sub_1000093EC()
{
  if (qword_1000141D0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100009448()
{
  return 0xD000000000000015;
}

unint64_t sub_100009468()
{
  unint64_t result = qword_100014428;
  if (!qword_100014428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014428);
  }
  return result;
}

unint64_t sub_1000094C0()
{
  unint64_t result = qword_100014430;
  if (!qword_100014430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014430);
  }
  return result;
}

uint64_t sub_100009514()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100009548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B990(a1, a2, a3, (void (*)(void))sub_100008600);
}

uint64_t sub_100009560@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BA1C(&qword_1000141C0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000146E0, a1);
}

uint64_t sub_1000095A0@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000141C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007CB8(&qword_1000145C0);
  uint64_t v3 = sub_100007DF8(v2, (uint64_t)qword_1000146F8);

  return sub_10000CB20(v3, a1);
}

uint64_t sub_10000961C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000096D0;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_100008CA0, 0, 0);
}

uint64_t sub_1000096D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000097C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000BE20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000097EC()
{
  return 0xD000000000000025;
}

unint64_t sub_10000980C()
{
  unint64_t result = qword_100014440;
  if (!qword_100014440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014440);
  }
  return result;
}

unint64_t sub_100009864()
{
  unint64_t result = qword_100014448;
  if (!qword_100014448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014448);
  }
  return result;
}

unint64_t sub_1000098BC()
{
  unint64_t result = qword_100014450;
  if (!qword_100014450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014450);
  }
  return result;
}

uint64_t sub_100009910(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100009930, 0, 0);
}

uint64_t sub_100009930()
{
  if (qword_1000141B0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(BOOL **)(v0 + 16);
  BOOL *v1 = sub_1000080E0();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000099D4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 64) = *a2;
  return _swift_task_switch(sub_1000099F8, 0, 0);
}

uint64_t sub_1000099F8()
{
  if (qword_1000141B0 != -1) {
    swift_once();
  }
  if (*(unsigned char *)(v0 + 64)) {
    uint64_t v1 = 5;
  }
  else {
    uint64_t v1 = 4;
  }
  uint64_t v2 = *(void **)(qword_1000146C0 + 16);
  *(void *)(v0 + 48) = sub_100008018;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_100008690;
  *(void *)(v0 + 40) = &unk_100010EB0;
  uint64_t v3 = _Block_copy((const void *)(v0 + 16));
  id v4 = v2;
  [v4 setPowerState:v1 completion:v3];
  _Block_release(v3);

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100009B30(uint64_t a1)
{
  unint64_t v2 = sub_10000980C();

  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000025, 0x800000010000E7B0, a1, v2);
}

uint64_t sub_100009B8C()
{
  uint64_t v0 = qword_1000143F0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100009BC8()
{
  unint64_t result = qword_100014458;
  if (!qword_100014458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014458);
  }
  return result;
}

unint64_t sub_100009C20()
{
  unint64_t result = qword_100014460;
  if (!qword_100014460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014460);
  }
  return result;
}

unint64_t sub_100009C78()
{
  unint64_t result = qword_100014468;
  if (!qword_100014468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014468);
  }
  return result;
}

unint64_t sub_100009CD0()
{
  unint64_t result = qword_100014470;
  if (!qword_100014470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014470);
  }
  return result;
}

void *sub_100009D24()
{
  return &protocol witness table for String;
}

uint64_t sub_100009D30()
{
  sub_10000CA54();
  uint64_t v2 = sub_10000CF50();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007EFC(v3, v0, v2, v1);
}

unint64_t sub_100009DC8()
{
  unint64_t result = qword_100014480;
  if (!qword_100014480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014480);
  }
  return result;
}

unint64_t sub_100009E20()
{
  unint64_t result = qword_100014488;
  if (!qword_100014488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014488);
  }
  return result;
}

unint64_t sub_100009E78()
{
  unint64_t result = qword_100014490;
  if (!qword_100014490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014490);
  }
  return result;
}

unint64_t sub_100009ED0()
{
  unint64_t result = qword_100014498;
  if (!qword_100014498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014498);
  }
  return result;
}

void *sub_100009F24()
{
  return &protocol witness table for String;
}

uint64_t sub_100009F30@<X0>(uint64_t *a1@<X8>)
{
  sub_10000A17C();
  uint64_t result = sub_10000CDE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009F70@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BA1C(&qword_1000141B8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000146C8, a1);
}

uint64_t sub_100009FA8()
{
  return sub_10000CBB4(&qword_1000144A0, &qword_1000144A8);
}

uint64_t sub_100009FE4(uint64_t a1)
{
  unint64_t v2 = sub_10000980C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000A034()
{
  unint64_t result = qword_1000144B0;
  if (!qword_1000144B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144B0);
  }
  return result;
}

uint64_t sub_10000A088(uint64_t a1)
{
  unint64_t v2 = sub_10000A17C();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10000A0D4(uint64_t a1)
{
  unint64_t v2 = sub_100009ED0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000A124()
{
  unint64_t result = qword_1000144B8;
  if (!qword_1000144B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144B8);
  }
  return result;
}

unint64_t sub_10000A17C()
{
  unint64_t result = qword_1000144C0[0];
  if (!qword_1000144C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000144C0);
  }
  return result;
}

uint64_t sub_10000A1D0@<X0>(uint64_t a1@<X8>)
{
  v11[1] = a1;
  uint64_t v1 = sub_100007CB8(&qword_1000145C8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = sub_100007CB8(&qword_1000145D0);
  uint64_t v5 = *(void *)(v11[0] - 8);
  __chkstk_darwin(v11[0]);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007CB8(&qword_1000145D8);
  sub_10000A17C();
  sub_10000CBB4(&qword_1000145E0, &qword_1000145D8);
  sub_10000D120();
  sub_10000D0A0();
  uint64_t v8 = sub_10000CBB4(&qword_1000145E8, &qword_1000145C8);
  sub_10000D0D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_10000D0A0();
  v11[2] = v1;
  v11[3] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = v11[0];
  sub_10000D0C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v9);
}

uint64_t sub_10000A538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100007CB8(&qword_1000145D8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D0A0();
  sub_10000D0F0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
}

uint64_t sub_10000A668@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000D030();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D080();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000D140();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000D040();
  __chkstk_darwin(v8 - 8);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000D050();
  uint64_t result = sub_10000D0E0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10000A88C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000D030();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D080();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10000D140();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10000D040();
  __chkstk_darwin(v8 - 8);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000D050();
  uint64_t result = sub_10000D0E0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10000AAC4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100014578 + dword_100014578);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000CCB4;
  return v4();
}

uint64_t sub_10000AB68(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100009864();
  void *v4 = v2;
  v4[1] = sub_10000AC18;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10000AC18(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_10000AD30()
{
  unint64_t result = qword_1000144D8;
  if (!qword_1000144D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144D8);
  }
  return result;
}

unint64_t sub_10000AD88()
{
  unint64_t result = qword_1000144E0[0];
  if (!qword_1000144E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000144E0);
  }
  return result;
}

uint64_t sub_10000ADDC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009864();
  *uint64_t v5 = v2;
  v5[1] = sub_10000AE90;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000AE90(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000AF90(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100009864();
  void *v4 = v2;
  v4[1] = sub_10000CCB4;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000B044()
{
  unint64_t result = qword_1000144F8;
  if (!qword_1000144F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000144F8);
  }
  return result;
}

unint64_t sub_10000B09C()
{
  unint64_t result = qword_100014500;
  if (!qword_100014500)
  {
    sub_1000069C4(qword_100014508);
    sub_100009E78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014500);
  }
  return result;
}

uint64_t sub_10000B110(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100009CD0();
  *unint64_t v5 = v2;
  v5[1] = sub_10000CCB8;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000B1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000096D0;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_10000B280()
{
  unint64_t result = qword_100014520;
  if (!qword_100014520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014520);
  }
  return result;
}

uint64_t sub_10000B2D8()
{
  uint64_t v0 = sub_10000D030();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D080();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000D140();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10000D040();
  sub_100007E30(v6, qword_100014718);
  sub_100007DF8(v6, (uint64_t)qword_100014718);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10000D050();
}

uint64_t sub_10000B4C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_10000D030();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10000D080();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_10000D140();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10000D040();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  sub_10000D050();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_10000CE70();
  uint64_t v13 = sub_10000CE60();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 0, 1, v13);
}

unint64_t sub_10000B7D4()
{
  unint64_t result = qword_100014528;
  if (!qword_100014528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014528);
  }
  return result;
}

uint64_t sub_10000B828(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000C9AC();
  unint64_t v5 = sub_10000CA54();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000B890()
{
  uint64_t v0 = qword_100014400;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000B8CC()
{
  unint64_t result = qword_100014530;
  if (!qword_100014530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014530);
  }
  return result;
}

unint64_t sub_10000B924()
{
  unint64_t result = qword_100014538;
  if (!qword_100014538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014538);
  }
  return result;
}

uint64_t sub_10000B978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000B990(a1, a2, a3, (void (*)(void))sub_10000B7D4);
}

uint64_t sub_10000B990(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B9E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BA1C(&qword_1000141D8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100014718, a1);
}

uint64_t sub_10000BA1C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007DF8(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000BAC4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000C9AC();
  unint64_t v7 = sub_10000CA00();
  unint64_t v8 = sub_10000CA54();
  *unint64_t v5 = v2;
  v5[1] = sub_10000749C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000BB98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C554();
  *a1 = result;
  return result;
}

uint64_t sub_10000BBC0(uint64_t a1)
{
  unint64_t v2 = sub_10000B7D4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenBluetoothPowerDeepLink()
{
  return &type metadata for OpenBluetoothPowerDeepLink;
}

ValueMetadata *type metadata accessor for BluetoothPowerEntityQuery()
{
  return &type metadata for BluetoothPowerEntityQuery;
}

ValueMetadata *type metadata accessor for BluetoothPowerEntity()
{
  return &type metadata for BluetoothPowerEntity;
}

uint64_t destroy for BluetoothPowerEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s42BluetoothSettingsAppIntentsWidgetExtension20BluetoothPowerEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for BluetoothPowerEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for BluetoothPowerEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for BluetoothPowerEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BluetoothPowerEntity.UpdateIntent_value(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BluetoothPowerEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BluetoothPowerEntity.UpdateIntent_value()
{
  return &type metadata for BluetoothPowerEntity.UpdateIntent_value;
}

uint64_t sub_10000BDE4()
{
  return sub_10000CBB4(&qword_100014548, &qword_100014550);
}

uint64_t sub_10000BE20()
{
  uint64_t v0 = sub_100007CB8(&qword_1000145A0);
  __chkstk_darwin(v0 - 8);
  v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10000CF40();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  unint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007CB8(&qword_100014298);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v13;
  uint64_t v14 = sub_10000D040();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100007CB8(&qword_100014558);
  sub_10000D020();
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10000CDB0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  char v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000980C();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10000CE30();
  sub_100007CB8(&qword_1000145A8);
  sub_10000D020();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10000D180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10000CE40();
  return v24;
}

uint64_t sub_10000C260()
{
  uint64_t v1 = sub_10000D030();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10000D080();
  v0[5] = swift_task_alloc();
  sub_10000D140();
  v0[6] = swift_task_alloc();
  sub_10000D040();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10000C3A0, 0, 0);
}

uint64_t sub_10000C3A0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007CB8(&qword_100014420);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10000D050();
  sub_10000CBB4(&qword_100014590, &qword_100014598);
  uint64_t v4 = sub_10000D010();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10000C554()
{
  uint64_t v0 = sub_10000CF40();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  v23 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007CB8(&qword_100014298);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v21 - v5;
  uint64_t v7 = sub_100007CB8(&qword_1000142A0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000D030();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000D080();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10000D140();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10000D040();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v21[1] = sub_100007CB8(&qword_100014558);
  sub_10000D130();
  sub_10000D070();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10000D050();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  uint64_t v26 = 0;
  uint64_t v18 = sub_10000CDB0();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_10000980C();
  return sub_10000CE30();
}

unint64_t sub_10000C9AC()
{
  unint64_t result = qword_100014560;
  if (!qword_100014560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014560);
  }
  return result;
}

unint64_t sub_10000CA00()
{
  unint64_t result = qword_100014568;
  if (!qword_100014568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014568);
  }
  return result;
}

unint64_t sub_10000CA54()
{
  unint64_t result = qword_100014570;
  if (!qword_100014570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014570);
  }
  return result;
}

uint64_t sub_10000CAA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CAB8()
{
  return swift_release();
}

unint64_t sub_10000CAC0()
{
  unint64_t result = qword_1000145B8;
  if (!qword_1000145B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000145B8);
  }
  return result;
}

uint64_t sub_10000CB14@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000CB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007CB8(&qword_1000145C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for BluetoothPowerToggle()
{
  return &type metadata for BluetoothPowerToggle;
}

uint64_t sub_10000CB98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CBB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000069C4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000CBF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CCBC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10000CCF0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10000CD00()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10000CD50()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10000CD60()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10000CD70()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000CD80()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000CDB0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10000CDC0()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_10000CDE0()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_10000CDF0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10000CE00()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000CE10()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000CE20()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10000CE30()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000CE40()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000CE50()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10000CE60()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10000CE70()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_10000CEB0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_10000CEC0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000CED0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10000CEE0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10000CEF0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10000CF00()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10000CF20()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10000CF40()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000CF50()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10000CFB0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10000CFD0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:synonyms:)();
}

uint64_t sub_10000CFE0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10000CFF0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10000D010()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10000D020()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000D030()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10000D040()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000D050()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10000D060()
{
  return NSLog(_:_:)();
}

uint64_t sub_10000D070()
{
  return static Locale.current.getter();
}

uint64_t sub_10000D080()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000D090()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10000D0A0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10000D0C0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10000D0D0()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10000D0E0()
{
  return Text.init(_:)();
}

uint64_t sub_10000D0F0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_10000D100()
{
  return static DispatchTime.distantFuture.getter();
}

uint64_t sub_10000D110()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10000D120()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_10000D130()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000D140()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_10000D150()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000D160()
{
  return String.hash(into:)();
}

void sub_10000D170(Swift::String a1)
{
}

uint64_t sub_10000D180()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10000D190()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_10000D1A0()
{
  return OS_dispatch_semaphore.signal()();
}

void sub_10000D1B0(Swift::Int a1)
{
}

uint64_t sub_10000D1C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000D1D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10000D1E0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000D1F0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000D200()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

void objc_release(id a1)
{
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

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}