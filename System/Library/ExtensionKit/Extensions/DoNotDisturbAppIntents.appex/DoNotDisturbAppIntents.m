uint64_t sub_10000355C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_100006708(&qword_100018238);
  sub_1000068D4(v0, qword_100018440);
  sub_10000689C(v0, (uint64_t)qword_100018440);
  sub_100006708(&qword_100018240);
  v1 = *(void *)(sub_100006708(&qword_100018248) - 8);
  v2 = *(void *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100010E90;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100004128();
  sub_100010530();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_100010530();
  sub_1000036F0(v4);
  return sub_100010540();
}

unint64_t sub_1000036F0(uint64_t a1)
{
  uint64_t v2 = sub_100006708(&qword_100018248);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006708(&qword_100018250);
  uint64_t v6 = sub_100010940();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100006A48(v12, (uint64_t)v5, &qword_100018248);
    char v14 = *v5;
    unint64_t result = sub_100005808(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006708(&qword_100018258);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
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

unint64_t sub_1000038F0(uint64_t a1)
{
  uint64_t v2 = sub_100006708(&qword_100018228);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006708(&qword_100018230);
  uint64_t v6 = sub_100010940();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100006A48(v12, (uint64_t)v5, &qword_100018228);
    char v14 = *v5;
    unint64_t result = sub_100005808(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100010520();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
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

uint64_t sub_100003AE8()
{
  sub_100006708(&qword_1000181C8);
  __chkstk_darwin();
  v9[0] = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = sub_100010680();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000106C0();
  __chkstk_darwin();
  sub_100010780();
  __chkstk_darwin();
  uint64_t v5 = sub_100010690();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_100010620();
  sub_1000068D4(v7, qword_100018458);
  sub_10000689C(v7, (uint64_t)qword_100018458);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  sub_1000106A0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v6 + 56))(v9[0], 1, 1, v5);
  return sub_100010610();
}

uint64_t sub_100003DD0(char a1)
{
  if (a1) {
    return 0x6174537375636F66;
  }
  else {
    return 1953460082;
  }
}

uint64_t sub_100003E08(char *a1, char *a2)
{
  return sub_100003E6C(*a1, *a2);
}

unint64_t sub_100003E18()
{
  unint64_t result = qword_1000180E0;
  if (!qword_1000180E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180E0);
  }
  return result;
}

uint64_t sub_100003E6C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6174537375636F66;
  }
  else {
    uint64_t v3 = 1953460082;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEB00000000737574;
  }
  if (a2) {
    uint64_t v5 = 0x6174537375636F66;
  }
  else {
    uint64_t v5 = 1953460082;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000737574;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100010970();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100003F10()
{
  return sub_100003F18();
}

Swift::Int sub_100003F18()
{
  return sub_1000109E0();
}

uint64_t sub_100003F9C()
{
  return sub_100003FA4();
}

uint64_t sub_100003FA4()
{
  sub_1000107C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004010()
{
  return sub_100004018();
}

Swift::Int sub_100004018()
{
  return sub_1000109E0();
}

uint64_t sub_100004098@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100014CF8;
  v8._object = v3;
  Swift::Int v5 = sub_100010960(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_1000040F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003DD0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100004128()
{
  unint64_t result = qword_1000180E8;
  if (!qword_1000180E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180E8);
  }
  return result;
}

unint64_t sub_100004180()
{
  unint64_t result = qword_1000180F0;
  if (!qword_1000180F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180F0);
  }
  return result;
}

uint64_t sub_1000041D4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100018080 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006708(&qword_100018238);
  uint64_t v3 = sub_10000689C(v2, (uint64_t)qword_100018440);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100004284()
{
  unint64_t result = qword_1000180F8;
  if (!qword_1000180F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180F8);
  }
  return result;
}

unint64_t sub_1000042DC()
{
  unint64_t result = qword_100018100;
  if (!qword_100018100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018100);
  }
  return result;
}

unint64_t sub_100004334()
{
  unint64_t result = qword_100018108;
  if (!qword_100018108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018108);
  }
  return result;
}

void *sub_100004388()
{
  return &protocol witness table for String;
}

uint64_t sub_100004394()
{
  sub_1000069E0();
  uint64_t v2 = sub_1000104C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006A34(v3, v0, v2, v1);
}

unint64_t sub_10000442C()
{
  unint64_t result = qword_100018118;
  if (!qword_100018118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018118);
  }
  return result;
}

unint64_t sub_100004484()
{
  unint64_t result = qword_100018120;
  if (!qword_100018120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018120);
  }
  return result;
}

unint64_t sub_1000044DC()
{
  unint64_t result = qword_100018128;
  if (!qword_100018128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018128);
  }
  return result;
}

unint64_t sub_100004534()
{
  unint64_t result = qword_100018130;
  if (!qword_100018130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018130);
  }
  return result;
}

uint64_t sub_10000458C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005458(&qword_100018088, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100018458, a1);
}

uint64_t sub_1000045C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000053D8(a1, a2, a3, (void (*)(void))sub_100004128);
}

uint64_t sub_1000045F0(uint64_t a1)
{
  unint64_t v2 = sub_100004128();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004640()
{
  unint64_t result = qword_100018138;
  if (!qword_100018138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018138);
  }
  return result;
}

unint64_t sub_100004698()
{
  unint64_t result = qword_100018140;
  if (!qword_100018140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018140);
  }
  return result;
}

unint64_t sub_1000046F0()
{
  unint64_t result = qword_100018148;
  if (!qword_100018148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018148);
  }
  return result;
}

uint64_t sub_100004748(uint64_t a1)
{
  unint64_t v2 = sub_100004534();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004798()
{
  unint64_t result = qword_100018150;
  if (!qword_100018150)
  {
    sub_1000047F4(&qword_100018158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018150);
  }
  return result;
}

uint64_t sub_1000047F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000483C(void *a1@<X8>)
{
  *a1 = &off_100014D48;
}

unint64_t sub_100004850()
{
  unint64_t result = qword_100018160;
  if (!qword_100018160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018160);
  }
  return result;
}

uint64_t sub_1000048A4(uint64_t a1)
{
  return sub_100004ED8(a1, qword_100018470);
}

uint64_t sub_1000048B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100010440();
  *a1 = v3;
  return result;
}

uint64_t sub_1000048EC()
{
  return sub_100010450();
}

uint64_t (*sub_100004924(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100010430();
  return sub_100004980;
}

unint64_t sub_100004988()
{
  unint64_t result = qword_100018168;
  if (!qword_100018168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018168);
  }
  return result;
}

uint64_t sub_1000049DC(uint64_t a1, uint64_t a2)
{
  return sub_10000523C(a1, a2, (uint64_t (*)(void))sub_100006938, (uint64_t (*)(void))sub_1000069E0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&static URLRepresentableIntent<>.urlRepresentation.getter);
}

uint64_t sub_100004A20()
{
  uint64_t v0 = qword_100018098;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004A60()
{
  unint64_t result = qword_100018170;
  if (!qword_100018170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018170);
  }
  return result;
}

unint64_t sub_100004AB8()
{
  unint64_t result = qword_100018178;
  if (!qword_100018178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018178);
  }
  return result;
}

unint64_t sub_100004B10()
{
  unint64_t result = qword_100018180;
  if (!qword_100018180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018180);
  }
  return result;
}

uint64_t sub_100004B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000053D8(a1, a2, a3, (void (*)(void))sub_100004988);
}

uint64_t sub_100004B90@<X0>(uint64_t a1@<X8>)
{
  return sub_100005458(&qword_100018090, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100018470, a1);
}

uint64_t sub_100004BC8()
{
  return 0;
}

uint64_t sub_100004BD4()
{
  return 1;
}

uint64_t sub_100004BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100006938();
  unint64_t v6 = sub_10000698C();
  unint64_t v7 = sub_1000069E0();
  *uint64_t v4 = v2;
  v4[1] = sub_100004CB0;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100004CB0()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100004DB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005E34();
  *a1 = result;
  return result;
}

uint64_t sub_100004DE0(uint64_t a1)
{
  unint64_t v2 = sub_100004988();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100004E20()
{
  unint64_t result = qword_100018190;
  if (!qword_100018190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018190);
  }
  return result;
}

unint64_t sub_100004E78()
{
  unint64_t result = qword_100018198;
  if (!qword_100018198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018198);
  }
  return result;
}

uint64_t sub_100004ECC(uint64_t a1)
{
  return sub_100004ED8(a1, qword_100018488);
}

uint64_t sub_100004ED8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100010680();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000106C0();
  __chkstk_darwin();
  sub_100010780();
  __chkstk_darwin();
  uint64_t v7 = sub_100010690();
  sub_1000068D4(v7, a2);
  sub_10000689C(v7, (uint64_t)a2);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return sub_1000106A0();
}

double sub_1000050C4@<D0>(uint64_t a1@<X8>)
{
  sub_100010440();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 48) = v7;
  return result;
}

uint64_t sub_100005110()
{
  return sub_100010450();
}

void sub_100005158(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000051A8()
{
  unint64_t result = qword_1000181A0;
  if (!qword_1000181A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A0);
  }
  return result;
}

uint64_t sub_1000051FC(uint64_t a1, uint64_t a2)
{
  return sub_10000523C(a1, a2, (uint64_t (*)(void))sub_1000067A0, (uint64_t (*)(void))sub_100006848, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&static URLRepresentableIntent<>.urlRepresentation.getter);
}

uint64_t sub_10000523C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a3();
  uint64_t v9 = a4();

  return a5(a1, v8, a2, v9);
}

uint64_t sub_1000052C4()
{
  uint64_t v0 = qword_1000180B0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100005300()
{
  unint64_t result = qword_1000181A8;
  if (!qword_1000181A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181A8);
  }
  return result;
}

unint64_t sub_100005358()
{
  unint64_t result = qword_1000181B0;
  if (!qword_1000181B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181B0);
  }
  return result;
}

uint64_t sub_1000053AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000053D8(a1, a2, a3, (void (*)(void))sub_1000051A8);
}

uint64_t sub_1000053D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005420@<X0>(uint64_t a1@<X8>)
{
  return sub_100005458(&qword_1000180A8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100018488, a1);
}

uint64_t sub_100005458@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000689C(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000054FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000067A0();
  unint64_t v6 = sub_1000067F4();
  unint64_t v7 = sub_100006848();
  *uint64_t v4 = v2;
  v4[1] = sub_100006AAC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000055C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000062A0();
  *a1 = result;
  return result;
}

uint64_t sub_1000055F0(uint64_t a1)
{
  unint64_t v2 = sub_1000051A8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFocusSettingsDynamicDeepLinks()
{
  return &type metadata for OpenFocusSettingsDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for OpenFocusSettingsDeepLinks()
{
  return &type metadata for OpenFocusSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for FocusDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FocusDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FocusDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000057B8);
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

uint64_t sub_1000057E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000057EC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FocusDeepLinks()
{
  return &type metadata for FocusDeepLinks;
}

unint64_t sub_100005808(char a1)
{
  sub_1000109C0();
  sub_1000107C0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_1000109E0();

  return sub_1000058B0(a1 & 1, v2);
}

unint64_t sub_1000058B0(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x6174537375636F66;
    }
    else {
      uint64_t v6 = 1953460082;
    }
    if (a1) {
      unint64_t v7 = 0xEB00000000737574;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x6174537375636F66 : 1953460082;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEB00000000737574 : 0xE400000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_100010970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_1000059F8()
{
  uint64_t v0 = sub_100006708(&qword_100018218);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006708(&qword_1000181C8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v29 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)v23 - v6;
  uint64_t v8 = sub_100010690();
  uint64_t v24 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v27 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  __chkstk_darwin(v12);
  sub_100006708(&qword_100018220);
  uint64_t v13 = (int *)(sub_100006708(&qword_100018228) - 8);
  uint64_t v14 = *(void *)v13;
  uint64_t v26 = *(void *)(*(void *)v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v28 = v16;
  *(_OWORD *)(v16 + 16) = xmmword_100010E90;
  unint64_t v17 = v16 + v15;
  *(unsigned char *)(v16 + v15) = 0;
  v23[0] = v16 + v15 + v13[14];
  sub_100010670();
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v23[1] = v9 + 56;
  v25 = v18;
  v18(v7, 1, 1, v8);
  sub_1000104E0();
  uint64_t v19 = sub_1000104F0();
  uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v2, 0, 1, v19);
  sub_100010670();
  sub_100010500();
  *(unsigned char *)(v17 + v26) = 1;
  sub_100010670();
  BOOL v21 = v29;
  sub_100010670();
  v25(v21, 0, 1, v24);
  sub_1000104E0();
  v20(v2, 0, 1, v19);
  sub_100010670();
  sub_100010500();
  return sub_1000038F0(v28);
}

uint64_t sub_100005E34()
{
  uint64_t v0 = sub_1000105E0();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v22 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006708(&qword_1000181C0);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  BOOL v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - v4;
  uint64_t v6 = sub_100006708(&qword_1000181C8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010680();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000106C0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100010780();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100010690();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v20 = sub_100006708(&qword_1000181F8);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_1000106A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v25 = 2;
  uint64_t v17 = sub_100010400();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v21, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100004128();
  return sub_100010490();
}

uint64_t sub_1000062A0()
{
  uint64_t v0 = sub_1000105E0();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006708(&qword_1000181C0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v21 - v5;
  uint64_t v7 = sub_100006708(&qword_1000181C8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100010680();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000106C0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100010780();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_100010690();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v21[1] = sub_100006708(&qword_1000181D0);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_1000106A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  uint64_t v18 = sub_100010400();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_10000674C();
  return sub_1000104A0();
}

uint64_t sub_100006708(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000674C()
{
  unint64_t result = qword_1000181D8;
  if (!qword_1000181D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D8);
  }
  return result;
}

unint64_t sub_1000067A0()
{
  unint64_t result = qword_1000181E0;
  if (!qword_1000181E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E0);
  }
  return result;
}

unint64_t sub_1000067F4()
{
  unint64_t result = qword_1000181E8;
  if (!qword_1000181E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181E8);
  }
  return result;
}

unint64_t sub_100006848()
{
  unint64_t result = qword_1000181F0;
  if (!qword_1000181F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181F0);
  }
  return result;
}

uint64_t sub_10000689C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000068D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006938()
{
  unint64_t result = qword_100018200;
  if (!qword_100018200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018200);
  }
  return result;
}

unint64_t sub_10000698C()
{
  unint64_t result = qword_100018208;
  if (!qword_100018208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018208);
  }
  return result;
}

unint64_t sub_1000069E0()
{
  unint64_t result = qword_100018210;
  if (!qword_100018210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018210);
  }
  return result;
}

uint64_t sub_100006A34(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006A48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006708(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100006AB8()
{
  unint64_t result = qword_100018260;
  if (!qword_100018260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018260);
  }
  return result;
}

uint64_t sub_100006B0C()
{
  uint64_t v0 = sub_100006708(&qword_1000181C8);
  __chkstk_darwin(v0 - 8);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100010680();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000106C0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100010780();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100010690();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100010620();
  sub_1000068D4(v10, qword_1000184A0);
  sub_10000689C(v10, (uint64_t)qword_1000184A0);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_1000106A0();
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_100010610();
}

uint64_t sub_100006E04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = sub_100006708(&qword_100018218);
  __chkstk_darwin(v2 - 8);
  uint64_t v29 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006708(&qword_1000181C8);
  __chkstk_darwin(v4 - 8);
  long long v28 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100010680();
  uint64_t v6 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  long long v26 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000106C0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100010780();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100010690();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v24 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v24 - v18;
  uint64_t v25 = v1;
  swift_bridgeObjectRetain();
  sub_100010670();
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v26, enum case for LocalizedStringResource.BundleDescription.main(_:), v27);
  sub_1000106A0();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v20(v14, v19, v10);
  BOOL v21 = v28;
  v20(v28, v17, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v21, 0, 1, v10);
  sub_1000071F0(v29);
  sub_100010510();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v17, v10);
  return ((uint64_t (*)(char *, uint64_t))v22)(v19, v10);
}

id sub_1000071F0@<X0>(uint64_t a1@<X8>)
{
  if (!*(void *)(v1 + 40))
  {
    uint64_t v6 = sub_1000104F0();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    return (id)v7(a1, 1, 1, v6);
  }
  sub_10000A244(v1 + 48, (uint64_t)v8);
  sub_10000A244((uint64_t)v8, (uint64_t)v9);
  if (!v9[1])
  {
    swift_bridgeObjectRetain();
    return (id)sub_1000104D0();
  }
  sub_10000A2AC(0, &qword_100018378);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_10000A2E8((uint64_t)v8);
  sub_10000A2E8((uint64_t)v8);
  swift_bridgeObjectRetain();
  if (([ObjCClassFromMetadata respondsToSelector:sub_1000106D0()] & 1) == 0)
  {
    sub_10000A314((uint64_t)v8);
    return (id)sub_1000104D0();
  }
  id v4 = [ObjCClassFromMetadata performSelector:sub_1000106D0()];
  id result = ObjCClassFromMetadata;
  if (v4)
  {
    swift_unknownObjectRetain();
    self;
    if (!swift_dynamicCastObjCClass()) {
      swift_unknownObjectRelease();
    }
    return (id)sub_1000104D0();
  }
  __break(1u);
  return result;
}

uint64_t sub_1000073C0()
{
  uint64_t v0 = sub_100006708(&qword_100018380);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006708(&qword_100018388);
  __chkstk_darwin(v4);
  sub_10000674C();
  sub_1000105C0();
  v7._object = (void *)0x8000000100011F20;
  v7._countAndFlagsBits = 0xD00000000000002FLL;
  sub_1000105B0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000105A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_1000105B0(v8);
  return sub_1000105D0();
}

unint64_t sub_100007580()
{
  unint64_t result = qword_100018268;
  if (!qword_100018268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018268);
  }
  return result;
}

unint64_t sub_1000075D8()
{
  unint64_t result = qword_100018270;
  if (!qword_100018270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018270);
  }
  return result;
}

unint64_t sub_100007630()
{
  unint64_t result = qword_100018278;
  if (!qword_100018278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018278);
  }
  return result;
}

void *sub_100007684()
{
  return &protocol witness table for String;
}

uint64_t sub_100007690()
{
  sub_100006848();
  uint64_t v2 = sub_100010570();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006A34(v3, v0, v2, v1);
}

unint64_t sub_100007728()
{
  unint64_t result = qword_100018288;
  if (!qword_100018288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018288);
  }
  return result;
}

unint64_t sub_100007780()
{
  unint64_t result = qword_100018290;
  if (!qword_100018290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018290);
  }
  return result;
}

unint64_t sub_1000077D8()
{
  unint64_t result = qword_100018298;
  if (!qword_100018298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018298);
  }
  return result;
}

unint64_t sub_100007830()
{
  unint64_t result = qword_1000182A0;
  if (!qword_1000182A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A0);
  }
  return result;
}

void *sub_100007884()
{
  return &protocol witness table for String;
}

uint64_t sub_100007890@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000789C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000180C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100010620();
  uint64_t v3 = sub_10000689C(v2, (uint64_t)qword_1000184A0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100007948()
{
  unint64_t result = qword_1000182A8;
  if (!qword_1000182A8)
  {
    sub_1000047F4(&qword_1000182B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A8);
  }
  return result;
}

uint64_t sub_1000079A4(uint64_t a1)
{
  unint64_t v2 = sub_10000674C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000079F4()
{
  unint64_t result = qword_1000182B8;
  if (!qword_1000182B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182B8);
  }
  return result;
}

uint64_t sub_100007A48@<X0>(uint64_t a1@<X8>)
{
  return sub_100006E04(a1);
}

uint64_t sub_100007A84(uint64_t a1)
{
  unint64_t v2 = sub_100007830();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100007AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  Swift::String v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100018360 + dword_100018360);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_10000A340;
  return v8(a2, a3);
}

unint64_t sub_100007B8C()
{
  unint64_t result = qword_1000182C8;
  if (!qword_1000182C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C8);
  }
  return result;
}

unint64_t sub_100007BE4()
{
  unint64_t result = qword_1000182D0[0];
  if (!qword_1000182D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000182D0);
  }
  return result;
}

uint64_t sub_100007C38(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100018358 + dword_100018358);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007CE0;
  return v5(a1);
}

uint64_t sub_100007CE0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100007DE0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100018328 + dword_100018328);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_10000A340;
  return v4();
}

unint64_t sub_100007E88()
{
  unint64_t result = qword_1000182E8;
  if (!qword_1000182E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182E8);
  }
  return result;
}

unint64_t sub_100007EE0()
{
  unint64_t result = qword_1000182F0;
  if (!qword_1000182F0)
  {
    sub_1000047F4(qword_1000182F8);
    sub_1000077D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182F0);
  }
  return result;
}

uint64_t sub_100007F54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007630();
  void *v5 = v2;
  v5[1] = sub_100008008;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100008008()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000080FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_10000A344;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_1000081B8()
{
  unint64_t result = qword_100018310[0];
  if (!qword_100018310[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100018310);
  }
  return result;
}

uint64_t sub_10000820C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100018328 + dword_100018328);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000082B0;
  return v4();
}

uint64_t sub_1000082B0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_1000083C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100008008;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

ValueMetadata *type metadata accessor for FocusEntity.FocusEntityOptionsProvider()
{
  return &type metadata for FocusEntity.FocusEntityOptionsProvider;
}

ValueMetadata *type metadata accessor for FocusEntity.FocusEntityQuery()
{
  return &type metadata for FocusEntity.FocusEntityQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for FocusEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FocusEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FocusEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FocusEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FocusEntity(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for FocusEntity(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FocusEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FocusEntity()
{
  return &type metadata for FocusEntity;
}

void sub_100008750(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100010870();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_100008808(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008828(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_100008828(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006708(&qword_100018350);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100010950();
  __break(1u);
  return result;
}

int64_t sub_100008994(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_100008A78(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_1000108F0();
      sub_10000A2AC(0, &qword_100018330);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_1000108C0() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_1000108D0();
  sub_10000A2AC(0, &qword_100018330);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_100010850(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_100010860();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_100010860();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100008CF0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  id v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_100008D78()
{
  return _swift_task_switch(sub_100008E04, 0, 0);
}

uint64_t sub_100008E04()
{
  NSString v1 = sub_100010790();
  id v2 = [self serviceForClientIdentifier:v1];

  *(void *)(v0 + 16) = 0;
  id v3 = [v2 availableModesWithError:v0 + 16];
  uint64_t v52 = v0 + 16;
  unint64_t v4 = *(void **)(v0 + 16);
  sub_10000A2AC(0, &qword_100018330);
  sub_100009480();
  uint64_t v5 = sub_100010800();
  id v6 = v4;

  if (v6)
  {
    id v7 = v6;
    swift_bridgeObjectRelease();
    if (qword_1000180C8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100010710();
    sub_10000689C(v8, (uint64_t)qword_1000184B8);
    os_log_type_t v9 = sub_100010830();
    id v10 = v7;
    uint64_t v11 = sub_1000106F0();
    if (os_log_type_enabled(v11, v9))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      char v13 = (void *)swift_slowAlloc();
      *(_DWORD *)id v12 = 138412290;
      *(void *)(v0 + 16) = v10;
      id v14 = v10;
      sub_100010870();
      *char v13 = v4;

      _os_log_impl((void *)&_mh_execute_header, v11, v9, "Error querying all available modes: %@", v12, 0xCu);
      sub_100006708(&qword_100018348);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v19 = v10;
    swift_willThrow();

    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
  uint64_t v50 = v0;
  v51 = v2;
  unint64_t v54 = v5 & 0xC000000000000001;
  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v15 = sub_1000108E0();
    if (v15)
    {
LABEL_8:
      sub_100008808(0, v15 & ~(v15 >> 63), 0);
      if (v54)
      {
        uint64_t v16 = sub_1000108A0();
        char v18 = 1;
      }
      else
      {
        uint64_t v16 = sub_100008CF0(v5);
        char v18 = v22 & 1;
      }
      uint64_t v59 = v16;
      uint64_t v60 = v17;
      char v61 = v18;
      if (v15 < 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
      }
      uint64_t v53 = v5;
      do
      {
        while (1)
        {
          sub_100008A78(v59, v60, v61, v5);
          uint64_t v29 = v28;
          id v30 = [v28 modeIdentifier];
          uint64_t v31 = sub_1000107B0();
          uint64_t v58 = v32;

          id v33 = [v29 name];
          uint64_t v34 = sub_1000107B0();
          uint64_t v56 = v35;
          uint64_t v57 = v34;

          id v36 = [v29 symbolImageName];
          if (v36)
          {
            v37 = v36;
            uint64_t v55 = sub_1000107B0();
            uint64_t v39 = v38;
          }
          else
          {
            uint64_t v55 = 0;
            uint64_t v39 = 0;
          }
          id v40 = objc_msgSend(v29, "tintColorName", v50);
          if (v40)
          {
            v41 = v40;
            uint64_t v42 = sub_1000107B0();
            uint64_t v44 = v43;
          }
          else
          {

            uint64_t v42 = 0;
            uint64_t v44 = 0;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100008808(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v46 = _swiftEmptyArrayStorage[2];
          unint64_t v45 = _swiftEmptyArrayStorage[3];
          if (v46 >= v45 >> 1) {
            sub_100008808(v45 > 1, v46 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v46 + 1;
          v47 = &_swiftEmptyArrayStorage[8 * v46];
          v47[4] = v31;
          v47[5] = v58;
          v47[6] = v57;
          v47[7] = v56;
          v47[8] = v55;
          v47[9] = v39;
          v47[10] = v42;
          v47[11] = v44;
          if (v54) {
            break;
          }
          uint64_t v5 = v53;
          int64_t v23 = sub_100008994(v59, v60, v61, v53);
          uint64_t v25 = v24;
          char v27 = v26;
          sub_1000094E8(v59, v60, v61);
          uint64_t v59 = v23;
          uint64_t v60 = v25;
          char v61 = v27 & 1;
          if (!--v15) {
            goto LABEL_35;
          }
        }
        uint64_t v5 = v53;
        if ((v61 & 1) == 0) {
          goto LABEL_40;
        }
        if (sub_1000108B0()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_100006708(&qword_100018340);
        v48 = (void (*)(uint64_t, void))sub_100010810();
        sub_100010900();
        v48(v52, 0);
        --v15;
      }
      while (v15);
LABEL_35:
      sub_1000094E8(v59, v60, v61);

      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v15 = *(void *)(v5 + 16);
    if (v15) {
      goto LABEL_8;
    }
  }

  swift_bridgeObjectRelease();
LABEL_36:
  v49 = *(uint64_t (**)(void *))(v50 + 8);
  return v49(_swiftEmptyArrayStorage);
}

unint64_t sub_100009480()
{
  unint64_t result = qword_100018338;
  if (!qword_100018338)
  {
    sub_10000A2AC(255, &qword_100018330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018338);
  }
  return result;
}

uint64_t sub_1000094E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000094F8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    uint64_t v22 = -(uint64_t)v1;
    uint64_t v3 = result + 48;
    uint64_t v19 = result + 48;
    unint64_t v20 = *(void *)(result + 16);
    do
    {
      if (v2 <= v1) {
        unint64_t v4 = v1;
      }
      else {
        unint64_t v4 = v2;
      }
      uint64_t v23 = -(uint64_t)v4;
      uint64_t v5 = (uint64_t *)(v3 + (v2 << 6));
      unint64_t v6 = v2 + 1;
      while (1)
      {
        if (v23 + v6 == 1)
        {
          __break(1u);
          return result;
        }
        unint64_t v24 = v6;
        uint64_t v7 = *(v5 - 1);
        uint64_t v21 = *(v5 - 2);
        uint64_t v9 = *v5;
        uint64_t v8 = v5[1];
        uint64_t v11 = v5[2];
        uint64_t v10 = v5[3];
        uint64_t v12 = v5[4];
        uint64_t v13 = v5[5];
        sub_10000A1F0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (sub_100010890()) {
          break;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v6 = v24 + 1;
        v5 += 8;
        if (v22 + v24 + 1 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_100008808(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      uint64_t v14 = v21;
      uint64_t v15 = v11;
      unint64_t v17 = _swiftEmptyArrayStorage[2];
      unint64_t v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1)
      {
        uint64_t result = sub_100008808(v16 > 1, v17 + 1, 1);
        uint64_t v15 = v11;
        uint64_t v14 = v21;
      }
      _swiftEmptyArrayStorage[2] = v17 + 1;
      char v18 = &_swiftEmptyArrayStorage[8 * v17];
      v18[4] = v14;
      v18[5] = v7;
      v18[6] = v9;
      v18[7] = v8;
      v18[8] = v15;
      v18[9] = v10;
      v18[10] = v12;
      v18[11] = v13;
      unint64_t v2 = v24;
      uint64_t v3 = v19;
      unint64_t v1 = v20;
    }
    while (v22 + v24);
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_10000970C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return _swift_task_switch(sub_10000972C, 0, 0);
}

uint64_t sub_10000972C()
{
  uint64_t v12 = v0;
  if (qword_1000180C8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100010710();
  sub_10000689C(v1, (uint64_t)qword_1000184B8);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_1000106F0();
  os_log_type_t v3 = sub_100010840();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v0[3];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_bridgeObjectRetain();
    v0[2] = sub_10000E260(v6, v5, &v11);
    sub_100010870();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Focus string query for: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = (uint64_t (__cdecl *)())((char *)&dword_100018328 + dword_100018328);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[5] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100009964;
  return v10();
}

uint64_t sub_100009964(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    return _swift_task_switch(sub_100009AB4, 0, 0);
  }
}

uint64_t sub_100009AB4()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000094F8(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100009B58(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v23 = result + 32;
    uint64_t v21 = (void *)(a2 + 56);
    uint64_t v22 = _swiftEmptyArrayStorage;
    uint64_t v29 = a2;
    unint64_t v26 = *(void *)(result + 16);
    while (1)
    {
      if (v3 <= v2) {
        unint64_t v4 = v2;
      }
      else {
        unint64_t v4 = v3;
      }
      unint64_t v28 = v4;
      while (1)
      {
        if (v3 == v28) {
          goto LABEL_34;
        }
        uint64_t v5 = v3++;
        uint64_t v6 = *(void *)(a2 + 16);
        if (!v6) {
          goto LABEL_7;
        }
        uint64_t v7 = v23 + (v5 << 6);
        uint64_t v8 = *(void *)v7;
        uint64_t v9 = *(void *)(v7 + 8);
        uint64_t v10 = *(void *)(v7 + 24);
        uint64_t v24 = *(void *)(v7 + 32);
        uint64_t v25 = *(void *)(v7 + 16);
        long long v27 = *(_OWORD *)(v7 + 40);
        uint64_t v11 = *(void *)(v7 + 56);
        if (*(void *)(v29 + 32) == *(void *)v7 && *(void *)(v29 + 40) == v9) {
          break;
        }
        uint64_t result = sub_100010970();
        if (result) {
          break;
        }
        if (v6 != 1)
        {
          uint64_t v13 = v21;
          uint64_t v14 = 1;
          while (1)
          {
            uint64_t v15 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              break;
            }
            if (*(v13 - 1) == v8 && *v13 == v9) {
              goto LABEL_25;
            }
            uint64_t result = sub_100010970();
            if (result) {
              goto LABEL_25;
            }
            v13 += 2;
            ++v14;
            if (v15 == v6) {
              goto LABEL_7;
            }
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        a2 = v29;
        if (v3 == v26) {
          return (uint64_t)v22;
        }
      }
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v17 = v22;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_100008808(0, v22[2] + 1, 1);
        unint64_t v17 = v22;
      }
      unint64_t v19 = v17[2];
      unint64_t v18 = v17[3];
      if (v19 >= v18 >> 1)
      {
        uint64_t result = sub_100008808(v18 > 1, v19 + 1, 1);
        unint64_t v17 = v22;
      }
      v17[2] = v19 + 1;
      uint64_t v22 = v17;
      unint64_t v20 = &v17[8 * v19];
      v20[4] = v8;
      v20[5] = v9;
      v20[6] = v25;
      v20[7] = v10;
      v20[8] = v24;
      *(_OWORD *)(v20 + 9) = v27;
      v20[11] = v11;
      unint64_t v2 = v26;
      a2 = v29;
      if (v3 == v26) {
        return (uint64_t)v22;
      }
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_100009D8C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100009DAC, 0, 0);
}

uint64_t sub_100009DAC()
{
  uint64_t v12 = v0;
  if (qword_1000180C8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100010710();
  sub_10000689C(v1, (uint64_t)qword_1000184B8);
  swift_bridgeObjectRetain_n();
  unint64_t v2 = sub_1000106F0();
  os_log_type_t v3 = sub_100010840();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)unint64_t v4 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000107E0();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = sub_10000E260(v5, v7, &v11);
    sub_100010870();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Focus entities query for: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = (uint64_t (__cdecl *)())((char *)&dword_100018328 + dword_100018328);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10000A008;
  return v10();
}

uint64_t sub_10000A008(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    return _swift_task_switch(sub_10000A158, 0, 0);
  }
}

uint64_t sub_10000A158()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[3];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100009B58(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

unint64_t sub_10000A1F0()
{
  unint64_t result = qword_100018368;
  if (!qword_100018368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018368);
  }
  return result;
}

uint64_t sub_10000A244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006708(&qword_100018370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A2AC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000A2E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A314(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A348(uint64_t a1)
{
  unint64_t v2 = sub_10000A498();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000A3F0()
{
  unint64_t result = qword_100018390;
  if (!qword_100018390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018390);
  }
  return result;
}

uint64_t sub_10000A448()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000A498()
{
  unint64_t result = qword_100018398;
  if (!qword_100018398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018398);
  }
  return result;
}

ValueMetadata *type metadata accessor for DoNotDisturbAppIntentsExtension()
{
  return &type metadata for DoNotDisturbAppIntentsExtension;
}

uint64_t sub_10000A4FC()
{
  uint64_t v0 = sub_100010710();
  sub_1000068D4(v0, qword_1000184B8);
  sub_10000689C(v0, (uint64_t)qword_1000184B8);
  return sub_100010700();
}

unint64_t sub_10000A57C()
{
  unint64_t result = qword_1000183A8;
  if (!qword_1000183A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183A8);
  }
  return result;
}

unint64_t sub_10000A5D4()
{
  unint64_t result = qword_1000183B0;
  if (!qword_1000183B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183B0);
  }
  return result;
}

uint64_t sub_10000A628()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000A65C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000A6AC()
{
  unint64_t result = qword_1000183B8;
  if (!qword_1000183B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183B8);
  }
  return result;
}

uint64_t sub_10000A700()
{
  uint64_t v0 = sub_100010680();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000106C0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100010780();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100010690();
  sub_1000068D4(v6, qword_1000184D0);
  sub_10000689C(v6, (uint64_t)qword_1000184D0);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000106A0();
}

uint64_t sub_10000A900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[115] = a3;
  v3[114] = a2;
  v3[113] = a1;
  uint64_t v4 = sub_100010400();
  v3[116] = v4;
  v3[117] = *(void *)(v4 - 8);
  v3[118] = swift_task_alloc();
  sub_100010770();
  v3[119] = swift_task_alloc();
  v3[120] = swift_task_alloc();
  v3[121] = swift_task_alloc();
  v3[122] = swift_task_alloc();
  uint64_t v5 = sub_100010680();
  v3[123] = v5;
  v3[124] = *(void *)(v5 - 8);
  v3[125] = swift_task_alloc();
  sub_1000106C0();
  v3[126] = swift_task_alloc();
  sub_100010780();
  v3[127] = swift_task_alloc();
  sub_100010690();
  v3[128] = swift_task_alloc();
  sub_100006708(&qword_1000181C0);
  v3[129] = swift_task_alloc();
  v3[130] = swift_task_alloc();
  uint64_t v6 = sub_100010710();
  v3[131] = v6;
  v3[132] = *(void *)(v6 - 8);
  v3[133] = swift_task_alloc();
  return _swift_task_switch(sub_10000ABC4, 0, 0);
}

uint64_t sub_10000ABC4()
{
  uint64_t v23 = v0;
  if (qword_1000180C8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 1064);
  uint64_t v2 = *(void *)(v0 + 1056);
  uint64_t v3 = *(void *)(v0 + 1048);
  uint64_t v4 = sub_10000689C(v3, (uint64_t)qword_1000184B8);
  *(void *)(v0 + 1072) = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  os_log_type_t v5 = sub_100010820();
  swift_retain_n();
  swift_retain_n();
  uint64_t v6 = sub_1000106F0();
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109378;
    sub_100010440();
    *(_DWORD *)(v0 + 1288) = *(unsigned __int8 *)(v0 + 1293);
    sub_100010870();
    *(_WORD *)(v7 + 8) = 2080;
    sub_100010440();
    uint64_t v8 = *(void *)(v0 + 280);
    if (v8)
    {
      uint64_t v20 = *(void *)(v0 + 272);
      uint64_t v10 = *(void *)(v0 + 288);
      unint64_t v9 = *(void *)(v0 + 296);
      swift_bridgeObjectRetain();
      sub_10000FF08(v20, v8);
    }
    else
    {
      unint64_t v9 = 0xE500000000000000;
      uint64_t v10 = 0x3E6C696E3CLL;
    }
    uint64_t v21 = *(void *)(v0 + 1064);
    uint64_t v14 = *(void *)(v0 + 1056);
    uint64_t v15 = *(void *)(v0 + 1048);
    *(void *)(v0 + 896) = sub_10000E260(v10, v9, &v22);
    sub_100010870();
    swift_bridgeObjectRelease();
    swift_release_n();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "Receive Perform with enable: %{BOOL}d on focus name: %s", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v21, v15);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 1064);
    uint64_t v12 = *(void *)(v0 + 1056);
    uint64_t v13 = *(void *)(v0 + 1048);
    swift_release_n();
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  NSString v16 = sub_100010790();
  id v17 = [self serviceForClientIdentifier:v16];
  *(void *)(v0 + 1080) = v17;

  unint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 1088) = v18;
  *unint64_t v18 = v0;
  v18[1] = sub_10000AFC4;
  v18[5] = v0 + 208;
  v18[6] = v17;
  return _swift_task_switch(sub_10000F2BC, 0, 0);
}

uint64_t sub_10000AFC4()
{
  uint64_t v2 = *(_OWORD **)v1;
  *(void *)(*(void *)v1 + 1096) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_10000BFDC;
  }
  else
  {
    long long v4 = v2[14];
    v2[69] = v2[13];
    v2[70] = v4;
    long long v5 = v2[16];
    v2[71] = v2[15];
    v2[72] = v5;
    uint64_t v3 = sub_10000B124;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000B124()
{
  uint64_t v79 = v0;
  sub_100010440();
  if (*(unsigned char *)(v0 + 1292) != 1)
  {
    sub_100010440();
    uint64_t v7 = *(void *)(v0 + 344);
    if (v7)
    {
      uint64_t v8 = *(void *)(v0 + 352);
      uint64_t v74 = *(void *)(v0 + 360);
      uint64_t v76 = *(void *)(v0 + 336);
      sub_10000FE40(v0 + 208, v0 + 80);
      uint64_t v9 = *(void *)(v0 + 88);
      if (v9)
      {
        uint64_t v66 = v8;
        uint64_t v10 = (uint64_t *)(v0 + 96);
        uint64_t v11 = (uint64_t *)(v0 + 80);
        uint64_t v12 = *(void *)(v0 + 104);
        uint64_t v13 = (uint64_t *)(v0 + 112);
        uint64_t v14 = *(void *)(v0 + 120);
        uint64_t v15 = (uint64_t *)(v0 + 128);
        uint64_t v16 = *(void *)(v0 + 136);
LABEL_16:
        uint64_t v67 = *v15;
        uint64_t v21 = *v13;
        uint64_t v22 = *v10;
        uint64_t v23 = *v11;
        uint64_t v24 = v16;
        *(void *)(v0 + 1256) = v16;
        *(void *)(v0 + 1248) = v14;
        *(void *)(v0 + 1240) = v12;
        *(void *)(v0 + 1232) = v22;
        *(void *)(v0 + 1224) = v9;
        *(void *)(v0 + 1216) = v23;
        if ((v23 != v76 || v9 != v7) && (sub_100010970() & 1) == 0)
        {
          uint64_t v65 = *(void *)(v0 + 1032);
          uint64_t v69 = *(void *)(v0 + 936);
          uint64_t v77 = *(void *)(v0 + 928);
          *(void *)(v0 + 1264) = sub_100010460();
          *(void *)(v0 + 400) = v23;
          *(void *)(v0 + 408) = v9;
          *(void *)(v0 + 416) = v22;
          *(void *)(v0 + 424) = v12;
          *(void *)(v0 + 432) = v21;
          *(void *)(v0 + 440) = v14;
          *(void *)(v0 + 448) = v67;
          *(void *)(v0 + 456) = v24;
          sub_10000D904(v66, v74, v22, v12);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v65, 0, 1, v77);
          v41 = (void *)swift_task_alloc();
          *(void *)(v0 + 1272) = v41;
          void *v41 = v0;
          v41[1] = sub_10000CF30;
          uint64_t v42 = *(void *)(v0 + 1032);
          return IntentParameter.requestConfirmation(for:dialog:)(v0 + 400, v42);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_1000106F0();
        os_log_type_t v26 = sub_100010840();
        BOOL v27 = os_log_type_enabled(v25, v26);
        unint64_t v28 = *(void *)(v0 + 1240);
        if (v27)
        {
          uint64_t v29 = *(void *)(v0 + 1232);
          unint64_t v30 = *(void *)(v0 + 1224);
          uint64_t v71 = *(void *)(v0 + 1216);
          uint64_t v31 = swift_slowAlloc();
          v78[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 136446466;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 880) = sub_10000E260(v29, v28, v78);
          sub_100010870();
          swift_bridgeObjectRelease();
          *(_WORD *)(v31 + 12) = 2082;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 872) = sub_10000E260(v71, v30, v78);
          sub_100010870();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "Deactivating mode: %{public}s (%{public}s)", (uint8_t *)v31, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }

        id v33 = *(void **)(v0 + 1080);
        *(void *)(v0 + 888) = 0;
        unsigned int v34 = [v33 activateModeWithDetails:0 error:v0 + 888];
        uint64_t v35 = *(void **)(v0 + 888);
        id v36 = *(void **)(v0 + 1240);
        if (!v34)
        {
          uint64_t v32 = *(void **)(v0 + 1080);
          id v39 = v35;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100010660();

          goto LABEL_28;
        }
        uint64_t v37 = *(void *)(v0 + 1232);
        id v38 = v35;
        sub_100010760();
        v81._countAndFlagsBits = 539773775;
        v81._object = (void *)0xE400000000000000;
        sub_100010750(v81);
        v82._countAndFlagsBits = v37;
        v82._object = v36;
        sub_100010730(v82);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v83._countAndFlagsBits = 0x69207375636F4620;
        v83._object = (void *)0xEE002E66666F2073;
        sub_100010750(v83);
        sub_1000103F0();
LABEL_35:
        sub_100010420();
LABEL_36:
        uint64_t v44 = *(void *)(v0 + 944);
        uint64_t v45 = *(void *)(v0 + 936);
        uint64_t v46 = *(void *)(v0 + 928);

        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        id v40 = *(uint64_t (**)(void))(v0 + 8);
        goto LABEL_37;
      }
      sub_10000FF08(v76, v7);
    }
    else
    {
      sub_10000FE40(v0 + 208, v0 + 16);
      uint64_t v7 = *(void *)(v0 + 24);
      if (v7)
      {
        uint64_t v15 = (uint64_t *)(v0 + 1152);
        uint64_t v20 = *(void *)(v0 + 1160);
        uint64_t v13 = (uint64_t *)(v0 + 1136);
        uint64_t v10 = (uint64_t *)(v0 + 1120);
        uint64_t v11 = (uint64_t *)(v0 + 1104);
        uint64_t v14 = *(void *)(v0 + 1144);
        uint64_t v12 = *(void *)(v0 + 1128);
        uint64_t v9 = *(void *)(v0 + 1112);
        uint64_t v66 = *(void *)(v0 + 32);
        uint64_t v74 = *(void *)(v0 + 40);
        uint64_t v76 = *(void *)(v0 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v16 = v20;
        goto LABEL_16;
      }
    }
    sub_1000103E0();
    goto LABEL_35;
  }
  sub_100010440();
  uint64_t v1 = *(void *)(v0 + 664);
  sub_10000FF08(*(void *)(v0 + 656), v1);
  if (v1)
  {
    sub_100010440();
    unint64_t v2 = *(void *)(v0 + 728);
    if (v2)
    {
      uint64_t v3 = *(void *)(v0 + 720);
      unint64_t v4 = *(void *)(v0 + 744);
      uint64_t v73 = *(void *)(v0 + 736);
      uint64_t v75 = *(void *)(v0 + 752);
      uint64_t v70 = *(void *)(v0 + 760);
      uint64_t v72 = *(void *)(v0 + 768);
      uint64_t v5 = *(void *)(v0 + 776);
      sub_10000FE40(v0 + 208, v0 + 144);
      uint64_t v6 = *(void *)(v0 + 152);
      if (v6)
      {
        if (v2 == v6 && *(void *)(v0 + 144) == v3)
        {
          sub_10000FF6C((uint64_t *)(v0 + 208));
LABEL_34:
          sub_100010760();
          v84._countAndFlagsBits = 0;
          v84._object = (void *)0xE000000000000000;
          sub_100010750(v84);
          *(void *)(v0 + 592) = v3;
          *(void *)(v0 + 600) = v2;
          *(void *)(v0 + 608) = v73;
          *(void *)(v0 + 616) = v4;
          *(void *)(v0 + 624) = v75;
          *(void *)(v0 + 632) = v70;
          *(void *)(v0 + 640) = v72;
          *(void *)(v0 + 648) = v5;
          sub_1000079F4();
          sub_100010740();
          sub_10000FF08(v3, v2);
          v85._object = (void *)0x8000000100012150;
          v85._countAndFlagsBits = 0xD000000000000015;
          sub_100010750(v85);
          sub_1000103F0();
          goto LABEL_35;
        }
        char v43 = sub_100010970();
        sub_10000FF6C((uint64_t *)(v0 + 208));
        if (v43) {
          goto LABEL_34;
        }
      }
      id v47 = [self lifetimeUntilEndOfScheduleWithIdentifier:DNDDefaultScheduleIdentifier];
      swift_bridgeObjectRetain();
      id v48 = v47;
      NSString v49 = sub_100010790();
      uint64_t v50 = v3;
      NSString v51 = sub_100010790();
      swift_bridgeObjectRelease();
      id v52 = [self detailsWithIdentifier:v49 modeIdentifier:v51 lifetime:v48];
      v68 = v48;

      sub_10000FFFC(v50, v2);
      id v53 = v52;
      unint64_t v54 = sub_1000106F0();
      os_log_type_t v55 = sub_100010840();
      if (os_log_type_enabled(v54, v55))
      {
        os_log_type_t type = v55;
        uint64_t v56 = swift_slowAlloc();
        v78[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = 136446466;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 856) = sub_10000E260(v73, v4, v78);
        sub_100010870();
        swift_bridgeObjectRelease();
        *(_WORD *)(v56 + 12) = 2082;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 864) = sub_10000E260(v50, v2, v78);
        sub_100010870();
        swift_bridgeObjectRelease();
        uint64_t v57 = v50;
        sub_10000FF08(v50, v2);
        _os_log_impl((void *)&_mh_execute_header, v54, type, "Activating mode: %{public}s (%{public}s)", (uint8_t *)v56, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        uint64_t v57 = v50;
        sub_10000FF08(v50, v2);
      }

      uint64_t v58 = *(void **)(v0 + 1080);
      *(void *)(v0 + 848) = 0;
      unsigned int v59 = [v58 activateModeWithDetails:v53 error:v0 + 848];

      uint64_t v60 = *(void **)(v0 + 848);
      if (v59)
      {
        id v61 = v60;
        sub_100010760();
        v86._countAndFlagsBits = 539773775;
        v86._object = (void *)0xE400000000000000;
        sub_100010750(v86);
        *(void *)(v0 + 784) = v57;
        *(void *)(v0 + 792) = v2;
        *(void *)(v0 + 800) = v73;
        *(void *)(v0 + 808) = v4;
        *(void *)(v0 + 816) = v75;
        *(void *)(v0 + 824) = v70;
        *(void *)(v0 + 832) = v72;
        *(void *)(v0 + 840) = v5;
        sub_1000079F4();
        sub_100010740();
        sub_10000FF08(v57, v2);
        v87._countAndFlagsBits = 0x69207375636F4620;
        v87._object = (void *)0xED00002E6E6F2073;
        sub_100010750(v87);
        sub_1000103F0();
        sub_100010420();

        goto LABEL_36;
      }
      uint64_t v62 = *(void **)(v0 + 1080);
      id v63 = v60;
      sub_10000FF08(v57, v2);
      sub_100010660();

      swift_willThrow();
      uint64_t v32 = v68;
LABEL_29:

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v40 = *(uint64_t (**)(void))(v0 + 8);
LABEL_37:
      return v40();
    }
    uint64_t v32 = *(void **)(v0 + 1080);
    sub_10000FF6C((uint64_t *)(v0 + 208));
    sub_10000FFA8();
    swift_allocError();
LABEL_28:
    swift_willThrow();
    goto LABEL_29;
  }
  *(void *)(v0 + 1168) = sub_100010460();
  uint64_t v17 = dword_100018328;
  unint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 1176) = v18;
  *unint64_t v18 = v0;
  v18[1] = sub_10000C124;
  return ((uint64_t (__cdecl *)())((char *)&dword_100018328 + v17))();
}

uint64_t sub_10000BFDC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000C124(uint64_t a1)
{
  uint64_t v3 = *v2;
  v3[148] = a1;
  v3[149] = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    sub_10000FF6C(v3 + 26);
    unint64_t v4 = sub_10000C284;
  }
  else
  {
    unint64_t v4 = sub_10000C3CC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000C284()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000C3CC()
{
  uint64_t v1 = v0[130];
  uint64_t v2 = v0[125];
  uint64_t v3 = v0[124];
  uint64_t v4 = v0[123];
  uint64_t v5 = v0[117];
  uint64_t v6 = v0[116];
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_1000106A0();
  sub_100010410();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v1, 0, 1, v6);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[150] = v7;
  void *v7 = v0;
  v7[1] = sub_10000C594;
  uint64_t v8 = v0[148];
  uint64_t v9 = v0[130];
  return IntentParameter.requestDisambiguation(among:dialog:)(v0 + 66, v8, v9);
}

uint64_t sub_10000C594()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1208) = v0;
  swift_task_dealloc();
  sub_10000FEA8(*(void *)(v2 + 1040));
  swift_bridgeObjectRelease();
  swift_release();
  if (v0)
  {
    sub_10000FF6C((uint64_t *)(v2 + 208));
    uint64_t v3 = sub_10000D644;
  }
  else
  {
    uint64_t v3 = sub_10000C730;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000C730()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v2 = *(void *)(v0 + 552);
  *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 528);
  *(void *)(v0 + 480) = v1;
  *(void *)(v0 + 488) = v2;
  long long v3 = *(_OWORD *)(v0 + 576);
  *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 512) = v3;
  sub_100010450();
  sub_100010440();
  unint64_t v4 = *(void *)(v0 + 728);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 720);
    uint64_t v6 = *(void *)(v0 + 736);
    unint64_t v7 = *(void *)(v0 + 744);
    uint64_t v32 = *(void *)(v0 + 760);
    uint64_t v33 = *(void *)(v0 + 752);
    uint64_t v34 = *(void *)(v0 + 768);
    uint64_t v35 = *(void *)(v0 + 776);
    sub_10000FE40(v0 + 208, v0 + 144);
    uint64_t v8 = *(void *)(v0 + 152);
    if (v8)
    {
      if (v4 == v8 && *(void *)(v0 + 144) == v5)
      {
        sub_10000FF6C((uint64_t *)(v0 + 208));
LABEL_8:
        sub_100010760();
        v39._countAndFlagsBits = 0;
        v39._object = (void *)0xE000000000000000;
        sub_100010750(v39);
        *(void *)(v0 + 592) = v5;
        *(void *)(v0 + 600) = v4;
        *(void *)(v0 + 608) = v6;
        *(void *)(v0 + 616) = v7;
        *(void *)(v0 + 624) = v33;
        *(void *)(v0 + 632) = v32;
        *(void *)(v0 + 640) = v34;
        *(void *)(v0 + 648) = v35;
        sub_1000079F4();
        sub_100010740();
        sub_10000FF08(v5, v4);
        v40._object = (void *)0x8000000100012150;
        v40._countAndFlagsBits = 0xD000000000000015;
        sub_100010750(v40);
        sub_1000103F0();
        sub_100010420();
LABEL_14:
        uint64_t v24 = *(void *)(v0 + 944);
        uint64_t v25 = *(void *)(v0 + 936);
        uint64_t v26 = *(void *)(v0 + 928);

        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        BOOL v27 = *(uint64_t (**)(void))(v0 + 8);
        goto LABEL_17;
      }
      char v10 = sub_100010970();
      sub_10000FF6C((uint64_t *)(v0 + 208));
      if (v10) {
        goto LABEL_8;
      }
    }
    id v11 = [self lifetimeUntilEndOfScheduleWithIdentifier:DNDDefaultScheduleIdentifier];
    swift_bridgeObjectRetain();
    id v12 = v11;
    NSString v13 = sub_100010790();
    NSString v14 = sub_100010790();
    swift_bridgeObjectRelease();
    id v15 = [self detailsWithIdentifier:v13 modeIdentifier:v14 lifetime:v12];
    uint64_t v31 = v12;

    sub_10000FFFC(v5, v4);
    id v16 = v15;
    uint64_t v17 = sub_1000106F0();
    os_log_type_t v18 = sub_100010840();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      v36[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136446466;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 856) = sub_10000E260(v6, v7, v36);
      sub_100010870();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 864) = sub_10000E260(v5, v4, v36);
      sub_100010870();
      swift_bridgeObjectRelease();
      sub_10000FF08(v5, v4);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Activating mode: %{public}s (%{public}s)", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000FF08(v5, v4);
    }

    uint64_t v20 = *(void **)(v0 + 1080);
    *(void *)(v0 + 848) = 0;
    unsigned int v21 = [v20 activateModeWithDetails:v16 error:v0 + 848];

    uint64_t v22 = *(void **)(v0 + 848);
    if (v21)
    {
      id v23 = v22;
      sub_100010760();
      v41._countAndFlagsBits = 539773775;
      v41._object = (void *)0xE400000000000000;
      sub_100010750(v41);
      *(void *)(v0 + 784) = v5;
      *(void *)(v0 + 792) = v4;
      *(void *)(v0 + 800) = v6;
      *(void *)(v0 + 808) = v7;
      *(void *)(v0 + 816) = v33;
      *(void *)(v0 + 824) = v32;
      *(void *)(v0 + 832) = v34;
      *(void *)(v0 + 840) = v35;
      sub_1000079F4();
      sub_100010740();
      sub_10000FF08(v5, v4);
      v42._countAndFlagsBits = 0x69207375636F4620;
      v42._object = (void *)0xED00002E6E6F2073;
      sub_100010750(v42);
      sub_1000103F0();
      sub_100010420();

      goto LABEL_14;
    }
    unint64_t v28 = *(void **)(v0 + 1080);
    id v29 = v22;
    sub_10000FF08(v5, v4);
    sub_100010660();

    swift_willThrow();
    uint64_t v9 = v31;
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 1080);
    sub_10000FF6C((uint64_t *)(v0 + 208));
    sub_10000FFA8();
    swift_allocError();
    swift_willThrow();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v27 = *(uint64_t (**)(void))(v0 + 8);
LABEL_17:
  return v27();
}

uint64_t sub_10000CF30(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 1280) = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_10000FEA8(*(void *)(v4 + 1032));
    swift_release();
    uint64_t v5 = sub_10000D78C;
  }
  else
  {
    uint64_t v6 = *(void *)(v4 + 1032);
    *(unsigned char *)(v4 + 1294) = a1 & 1;
    sub_10000FEA8(v6);
    swift_release();
    uint64_t v5 = sub_10000D0AC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000D0AC()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void **)(v0 + 1240);
  if ((*(unsigned char *)(v0 + 1294) & 1) == 0)
  {
    uint64_t v8 = *(void *)(v0 + 1232);
    sub_100010760();
    v28._countAndFlagsBits = 539904847;
    v28._object = (void *)0xE400000000000000;
    sub_100010750(v28);
    v29._countAndFlagsBits = v8;
    v29._object = v1;
    sub_100010730(v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9._object = (void *)0x8000000100012130;
    v9._countAndFlagsBits = 0xD000000000000012;
LABEL_8:
    sub_100010750(v9);
    sub_1000103F0();
    sub_100010420();
    uint64_t v16 = *(void *)(v0 + 944);
    uint64_t v17 = *(void *)(v0 + 936);
    uint64_t v18 = *(void *)(v0 + 928);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000106F0();
  os_log_type_t v3 = sub_100010840();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 1240);
  if (v4)
  {
    unint64_t v6 = *(void *)(v0 + 1224);
    uint64_t v23 = *(void *)(v0 + 1232);
    uint64_t v24 = *(void *)(v0 + 1216);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446466;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 880) = sub_10000E260(v23, v5, &v25);
    sub_100010870();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 872) = sub_10000E260(v24, v6, &v25);
    sub_100010870();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Deactivating mode: %{public}s (%{public}s)", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  char v10 = *(void **)(v0 + 1080);
  *(void *)(v0 + 888) = 0;
  unsigned int v11 = [v10 activateModeWithDetails:0 error:v0 + 888];
  id v12 = *(void **)(v0 + 888);
  NSString v13 = *(void **)(v0 + 1240);
  if (v11)
  {
    uint64_t v14 = *(void *)(v0 + 1232);
    id v15 = v12;
    sub_100010760();
    v30._countAndFlagsBits = 539773775;
    v30._object = (void *)0xE400000000000000;
    sub_100010750(v30);
    v31._countAndFlagsBits = v14;
    v31._object = v13;
    sub_100010730(v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 0x69207375636F4620;
    v9._object = (void *)0xEE002E66666F2073;
    goto LABEL_8;
  }
  uint64_t v20 = *(void **)(v0 + 1080);
  id v21 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100010660();

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
LABEL_10:
  return v19();
}

uint64_t sub_10000D644()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000D78C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000D904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (objc_class *)[self mainBundle];
  v17._countAndFlagsBits = 0xD000000000000046;
  v13._countAndFlagsBits = 0x80000001000123E0;
  v15._object = (void *)0x8000000100012350;
  v17._object = (void *)0x8000000100012390;
  v15._countAndFlagsBits = 0xD000000000000034;
  v16.value._countAndFlagsBits = 0;
  v16.value._object = 0;
  v9.super.isa = v8;
  sub_100010640(v15, v16, v9, v17, v13);

  sub_100006708(&qword_100018418);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100010E90;
  *(void *)(v10 + 56) = &type metadata for String;
  unint64_t v11 = sub_10001010C();
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  *(void *)(v10 + 96) = &type metadata for String;
  *(void *)(v10 + 104) = v11;
  *(void *)(v10 + 64) = v11;
  *(void *)(v10 + 72) = a3;
  *(void *)(v10 + 80) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000107A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_1000103E0();
}

uint64_t sub_10000DA84@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000180D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100010690();
  uint64_t v3 = sub_10000689C(v2, (uint64_t)qword_1000184D0);
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000DB34(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_100008008;
  return sub_10000A900(a1, v5, v4);
}

unsigned char *sub_10000DBE0@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_10000E8B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000DC08(uint64_t a1)
{
  unint64_t v2 = sub_10000A6AC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for SetFocusState()
{
  swift_release();

  return swift_release();
}

void *_s22DoNotDisturbAppIntents13SetFocusStateVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SetFocusState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SetFocusState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SetFocusState(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SetFocusState(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SetFocusState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SetFocusState()
{
  return &type metadata for SetFocusState;
}

unint64_t sub_10000DE00()
{
  unint64_t result = qword_1000183C8;
  if (!qword_1000183C8)
  {
    sub_1000047F4(&qword_1000183D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183C8);
  }
  return result;
}

uint64_t sub_10000DE5C()
{
  uint64_t v0 = sub_100010680();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000106C0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100010780();
  __chkstk_darwin(v5 - 8);
  sub_100010720();
  sub_1000106B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000106A0();
}

Swift::Int sub_10000E02C()
{
  return sub_1000109E0();
}

void sub_10000E070()
{
}

Swift::Int sub_10000E098()
{
  return sub_1000109E0();
}

void sub_10000E0EC()
{
  id v0 = objc_allocWithZone((Class)NSError);
  NSString v1 = sub_100010790();
  id v2 = [v0 initWithDomain:v1 code:0 userInfo:0];

  qword_1000183A0 = (uint64_t)v2;
}

uint64_t sub_10000E164(uint64_t result, unsigned char **a2)
{
  id v2 = *a2;
  *id v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000E174(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_10000E1B0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000E1C0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000E1E8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000E260(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100010870();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000E260(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E334(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000100B0((uint64_t)v12, *a3);
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
      sub_1000100B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100010060((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E334(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100010880();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000E4F0(a5, a6);
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
  uint64_t v8 = sub_100010920();
  if (!v8)
  {
    sub_100010930();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100010950();
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

uint64_t sub_10000E4F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E588(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E768(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E768(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E588(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000E700(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100010910();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100010930();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000107D0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_100010950();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100010930();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000E700(uint64_t a1, uint64_t a2)
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
  sub_100006708(&qword_100018410);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E768(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006708(&qword_100018410);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  Swift::String v13 = a4 + 32;
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
  uint64_t result = sub_100010950();
  __break(1u);
  return result;
}

unsigned char *sub_10000E8B8()
{
  uint64_t v64 = sub_1000105E0();
  uint64_t v66 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v60 = &v42[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100006708(&qword_1000181C0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v56 = &v42[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __chkstk_darwin(v2);
  id v63 = &v42[-v5];
  __chkstk_darwin(v4);
  unint64_t v54 = &v42[-v6];
  uint64_t v7 = sub_100006708(&qword_1000183D8);
  __chkstk_darwin(v7 - 8);
  unsigned int v59 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100006708(&qword_1000181C8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  id v61 = &v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v58 = &v42[-v12];
  uint64_t v13 = sub_100010680();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  Swift::String_optional v16 = &v42[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_1000106C0();
  __chkstk_darwin(v17 - 8);
  uint64_t v18 = sub_100010780();
  __chkstk_darwin(v18 - 8);
  uint64_t v57 = sub_100010690();
  uint64_t v65 = *(void *)(v57 - 8);
  uint64_t v19 = __chkstk_darwin(v57);
  os_log_type_t v55 = &v42[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = __chkstk_darwin(v19);
  id v53 = &v42[-v22];
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v62 = &v42[-v24];
  uint64_t v25 = __chkstk_darwin(v23);
  id v52 = &v42[-v26];
  __chkstk_darwin(v25);
  uint64_t v50 = sub_100006708(&qword_1000183E0);
  sub_100010720();
  sub_1000106B0();
  uint64_t v27 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  Swift::String v28 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 104);
  unsigned int v43 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v44 = v13;
  v28(v16, enum case for LocalizedStringResource.BundleDescription.main(_:), v13);
  uint64_t v46 = v28;
  uint64_t v45 = v14 + 104;
  sub_1000106A0();
  Swift::String v29 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v65 + 56);
  v65 += 56;
  NSString v49 = v29;
  v29(v58, 1, 1, v57);
  LOBYTE(v67) = 2;
  uint64_t v30 = sub_1000107F0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v59, 1, 1, v30);
  sub_100010720();
  sub_1000106B0();
  v28(v16, v27, v13);
  sub_1000106A0();
  Swift::String v31 = v54;
  sub_100010410();
  uint64_t v32 = sub_100010400();
  uint64_t v33 = *(void *)(v32 - 8);
  id v47 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v33 + 56);
  uint64_t v48 = v33 + 56;
  v47(v31, 0, 1, v32);
  unsigned int v51 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v34 = *(void (**)(void))(v66 + 104);
  v66 += 104;
  id v52 = v34;
  v34(v60);
  unsigned int v59 = (unsigned char *)sub_1000104B0();
  sub_100010720();
  sub_1000106B0();
  uint64_t v35 = v43;
  uint64_t v36 = v44;
  uint64_t v37 = v46;
  v46(v16, v43, v44);
  sub_1000106A0();
  v49(v61, 1, 1, v57);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  sub_100010720();
  sub_1000106B0();
  v37(v16, v35, v36);
  sub_1000106A0();
  uint64_t v38 = v63;
  sub_100010410();
  Swift::String v39 = v47;
  v47(v38, 0, 1, v32);
  uint64_t v65 = sub_100006708(&qword_1000183E8);
  sub_100010720();
  sub_1000106B0();
  v37(v16, v35, v36);
  sub_1000106A0();
  Swift::String v40 = v56;
  sub_100010410();
  v39(v40, 0, 1, v32);
  ((void (*)(unsigned char *, void, uint64_t))v52)(v60, v51, v64);
  sub_10000674C();
  sub_1000104A0();
  return v59;
}

uint64_t sub_10000F22C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return _swift_task_switch(sub_10000F2BC, 0, 0);
}

void sub_10000F2BC()
{
  uint64_t v43 = v0;
  uint64_t v1 = (void *)v0;
  *(void *)(v0 + 16) = 0;
  uint64_t v2 = v0 + 16;
  id v3 = [*(id *)(v0 + 48) activeModeAssertionWithError:v0 + 16];
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = *(void **)(v0 + 16);
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = qword_1000180C8;
    id v7 = v4;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100010710();
    sub_10000689C(v8, (uint64_t)qword_1000184B8);
    os_log_type_t v9 = sub_100010820();
    id v10 = v5;
    uint64_t v11 = sub_1000106F0();
    if (os_log_type_enabled(v11, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v13 = v1;
      id v14 = [v10 debugDescription];
      uint64_t v15 = sub_1000107B0();
      unint64_t v17 = v16;

      uint64_t v1 = v13;
      v13[4] = sub_10000E260(v15, v17, &v42);
      sub_100010870();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v11, v9, "modeAssertion: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_100006708(&qword_100018430);
    uint64_t v25 = swift_allocObject();
    v1[8] = v25;
    *(_OWORD *)(v25 + 16) = xmmword_100011AE0;
    id v26 = [v10 details];
    id v27 = [v26 modeIdentifier];

    if (v27)
    {
      uint64_t v28 = sub_1000107B0();
      uint64_t v30 = v29;

      *(void *)(v25 + 32) = v28;
      *(void *)(v25 + 40) = v30;
      uint64_t v31 = dword_100018358;
      uint64_t v32 = (void *)swift_task_alloc();
      v1[9] = v32;
      *uint64_t v32 = v1;
      v32[1] = sub_10000F8C0;
      ((void (*)(uint64_t))((char *)&dword_100018358 + v31))(v25);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v18 = v4;
    sub_100010660();

    swift_willThrow();
    uint64_t v19 = (void *)sub_100010650();
    if (qword_1000180D8 != -1) {
      swift_once();
    }
    uint64_t v20 = (void *)qword_1000183A0;
    sub_100010160();
    id v21 = v20;
    char v22 = sub_100010860();

    if (v22)
    {

      swift_errorRelease();
      uint64_t v23 = (_OWORD *)v1[5];
      void v23[2] = 0u;
      v23[3] = 0u;
      *uint64_t v23 = 0u;
      v23[1] = 0u;
      uint64_t v24 = (void (*)(void))v1[1];
    }
    else
    {
      if (qword_1000180C8 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_100010710();
      sub_10000689C(v33, (uint64_t)qword_1000184B8);
      os_log_type_t v34 = sub_100010830();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v35 = sub_1000106F0();
      os_log_type_t v36 = v34;
      if (os_log_type_enabled(v35, v34))
      {
        uint64_t v37 = (uint64_t *)(v2 + 8);
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        Swift::String v41 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 138412290;
        swift_errorRetain();
        Swift::String v39 = v1;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t *v37 = v40;
        sub_100010870();
        void *v41 = v40;
        uint64_t v1 = v39;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Error querying active mode assertion: %@", v38, 0xCu);
        sub_100006708(&qword_100018348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      swift_willThrow();
      uint64_t v24 = (void (*)(void))v1[1];
    }
    v24();
  }
}

uint64_t sub_10000F8C0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_10000FB58;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_10000FA10;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000FA10()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)v0[7];
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    uint64_t v6 = *(void *)(v1 + 48);
    uint64_t v5 = *(void *)(v1 + 56);
    uint64_t v7 = *(void *)(v1 + 64);
    long long v13 = *(_OWORD *)(v1 + 72);
    uint64_t v8 = *(void *)(v1 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    long long v9 = v13;
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    uint64_t v3 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    long long v9 = 0uLL;
  }
  uint64_t v10 = v0[5];
  *(void *)uint64_t v10 = v4;
  *(void *)(v10 + 8) = v3;
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v5;
  *(void *)(v10 + 32) = v7;
  *(_OWORD *)(v10 + 40) = v9;
  *(void *)(v10 + 56) = v8;
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10000FB58()
{
  uint64_t v1 = (void *)v0[7];
  swift_bridgeObjectRelease();

  uint64_t v2 = (void *)sub_100010650();
  if (qword_1000180D8 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_1000183A0;
  sub_100010160();
  id v4 = v3;
  char v5 = sub_100010860();

  if (v5)
  {

    swift_errorRelease();
    uint64_t v6 = (_OWORD *)v0[5];
    v6[2] = 0u;
    v6[3] = 0u;
    *uint64_t v6 = 0u;
    v6[1] = 0u;
    uint64_t v7 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    if (qword_1000180C8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100010710();
    sub_10000689C(v8, (uint64_t)qword_1000184B8);
    os_log_type_t v9 = sub_100010830();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = sub_1000106F0();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      long long v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      v0[3] = v14;
      sub_100010870();
      *long long v13 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error querying active mode assertion: %@", v12, 0xCu);
      sub_100006708(&qword_100018348);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_willThrow();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
  }
  return v7();
}

uint64_t sub_10000FE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006708(&qword_100018400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FEA8(uint64_t a1)
{
  uint64_t v2 = sub_100006708(&qword_1000181C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FF08(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_10000FF6C(uint64_t *a1)
{
  return a1;
}

unint64_t sub_10000FFA8()
{
  unint64_t result = qword_100018408;
  if (!qword_100018408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018408);
  }
  return result;
}

uint64_t sub_10000FFFC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100010060(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000100B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10001010C()
{
  unint64_t result = qword_100018420;
  if (!qword_100018420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018420);
  }
  return result;
}

unint64_t sub_100010160()
{
  unint64_t result = qword_100018428;
  if (!qword_100018428)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100018428);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SetFocusState.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SetFocusState.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100010290);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SetFocusState.Error()
{
  return &type metadata for SetFocusState.Error;
}

unint64_t sub_1000102CC()
{
  unint64_t result = qword_100018438;
  if (!qword_100018438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018438);
  }
  return result;
}

uint64_t sub_100010320()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100010330()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100010360()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100010370()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100010380()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100010390()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000103A0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000103E0()
{
  return IntentDialog.init(stringLiteral:)();
}

uint64_t sub_1000103F0()
{
  return IntentDialog.init(stringInterpolation:)();
}

uint64_t sub_100010400()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100010410()
{
  return IntentDialog.init(_:)();
}

uint64_t sub_100010420()
{
  return static IntentResult.result<>(dialog:)();
}

uint64_t sub_100010430()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100010440()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100010450()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100010460()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100010490()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000104A0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000104B0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000104C0()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_1000104D0()
{
  return DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)();
}

uint64_t sub_1000104E0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_1000104F0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100010500()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100010510()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100010520()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100010530()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100010540()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100010560()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100010570()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000105A0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000105B0(Swift::String a1)
{
}

uint64_t sub_1000105C0()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000105D0()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000105E0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100010600()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100010610()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100010620()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100010640(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100010650()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100010660()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100010670()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100010680()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100010690()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000106A0()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t sub_1000106B0()
{
  return static Locale.current.getter();
}

uint64_t sub_1000106C0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000106D0()
{
  return Selector.init(_:)();
}

uint64_t sub_1000106E0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000106F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100010700()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100010710()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100010720()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_100010730(Swift::String a1)
{
}

uint64_t sub_100010740()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)();
}

void sub_100010750(Swift::String a1)
{
}

uint64_t sub_100010760()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100010770()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100010780()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100010790()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000107A0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_1000107B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000107C0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000107D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000107E0()
{
  return Array.description.getter();
}

uint64_t sub_1000107F0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100010800()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010810()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_100010820()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100010830()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100010840()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_100010850(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100010860()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100010870()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100010880()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100010890()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t sub_1000108A0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1000108B0()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_1000108C0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_1000108D0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1000108E0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000108F0()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_100010900()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

uint64_t sub_100010910()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100010920()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100010930()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100010940()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100010950()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100010960(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100010970()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100010980()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100010990()
{
  return Error._code.getter();
}

uint64_t sub_1000109A0()
{
  return Error._domain.getter();
}

uint64_t sub_1000109B0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000109C0()
{
  return Hasher.init(_seed:)();
}

void sub_1000109D0(Swift::UInt a1)
{
}

Swift::Int sub_1000109E0()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}