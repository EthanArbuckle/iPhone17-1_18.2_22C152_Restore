uint64_t sub_100003CBC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_1000066B8(&qword_10000C118);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006DC0();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v4 = sub_100006DA0();
  sub_100006830(v4, qword_10000C1A0);
  sub_1000067F8(v4, (uint64_t)qword_10000C1A0);
  sub_100006DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100006D90();
}

unint64_t sub_100003E28()
{
  sub_1000066B8(&qword_10000C140);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)v12 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000066B8(&qword_10000C118);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v6);
  sub_1000066B8(&qword_10000C148);
  uint64_t v7 = *(void *)(sub_1000066B8(&qword_10000C150) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100006F50;
  v12[1] = v9 + v8;
  sub_100006DB0();
  sub_100006DB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  sub_100006CE0();
  uint64_t v10 = sub_100006CF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v1, 0, 1, v10);
  sub_1000066B8(&qword_10000C158);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006F60;
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006DB0();
  sub_100006D00();
  unint64_t result = sub_100004310(v9);
  qword_10000C1B8 = result;
  return result;
}

unint64_t sub_100004310(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_1000066B8(&qword_10000C150) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000066B8(&qword_10000C160);
  uint64_t v5 = sub_100006DF0();
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v20[1] = a1;
  uint64_t v10 = a1 + v9;
  uint64_t v11 = *(void *)(v2 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068A8(v10, (uint64_t)v4, &qword_10000C150);
    unint64_t result = sub_100006368();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_100006D10();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v4, v16);
    uint64_t v17 = v6[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v6[2] = v19;
    v10 += v11;
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

unint64_t sub_1000044EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_1000066B8(&qword_10000C178) - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000066B8(&qword_10000C180);
  uint64_t v5 = sub_100006DF0();
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v20[1] = a1;
  uint64_t v10 = a1 + v9;
  uint64_t v11 = *(void *)(v2 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068A8(v10, (uint64_t)v4, &qword_10000C178);
    unint64_t result = sub_100006368();
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v6[7];
    uint64_t v16 = sub_1000066B8(&qword_10000C188);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v4, v16);
    uint64_t v17 = v6[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v6[2] = v19;
    v10 += v11;
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

uint64_t sub_1000046CC()
{
  uint64_t v0 = sub_1000066B8(&qword_10000C168);
  sub_100006830(v0, qword_10000C1C0);
  sub_1000067F8(v0, (uint64_t)qword_10000C1C0);
  sub_1000066B8(&qword_10000C170);
  sub_1000066B8(&qword_10000C178);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100006F50;
  sub_100004974();
  sub_100006D20();
  sub_1000044EC(v1);
  return sub_100006D30();
}

uint64_t sub_100004804()
{
  return 1;
}

unint64_t sub_100004810()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

Swift::Int sub_100004864()
{
  return sub_100006E20();
}

uint64_t sub_1000048B0()
{
  return sub_100006DE0();
}

Swift::Int sub_1000048C0()
{
  return sub_100006E20();
}

uint64_t sub_100004908@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100008700;
  v7._object = v3;
  Swift::Int v5 = sub_100006E00(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000495C(void *a1@<X8>)
{
  *a1 = 1953460082;
  a1[1] = 0xE400000000000000;
}

unint64_t sub_100004974()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_1000049CC()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_100004A20@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000066B8(&qword_10000C168);
  uint64_t v3 = sub_1000067F8(v2, (uint64_t)qword_10000C1C0);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100004AD0()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_100004B28()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100004B80()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

void *sub_100004BD4()
{
  return &protocol witness table for String;
}

uint64_t sub_100004BE0()
{
  sub_1000067A4();
  uint64_t v2 = sub_100006CD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100006894(v3, v0, v2, v1);
}

unint64_t sub_100004C78()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100004CD0()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100004D28()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100004D80()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100004DD8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005574(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C1A0, a1);
}

uint64_t sub_100004E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000054F4(a1, a2, a3, (void (*)(void))sub_100004974);
}

uint64_t sub_100004E3C(uint64_t a1)
{
  unint64_t v2 = sub_100004974();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004E8C()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100004EE4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100004F3C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_100004F90()
{
  if (qword_10000C008 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100004FEC(uint64_t a1)
{
  unint64_t v2 = sub_100004D80();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000503C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    sub_100005098(&qword_10000C0A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100005098(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000050E0(void *a1@<X8>)
{
  *a1 = &off_100008738;
}

unint64_t sub_1000050F4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100005148()
{
  uint64_t v0 = sub_100006DC0();
  sub_100006830(v0, qword_10000C1D8);
  sub_1000067F8(v0, (uint64_t)qword_10000C1D8);
  return sub_100006DB0();
}

uint64_t sub_1000051AC()
{
  return sub_100006B70();
}

uint64_t sub_1000051D0()
{
  return sub_100006B70();
}

uint64_t sub_1000051F4()
{
  return sub_100006B80();
}

void (*sub_100005218(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006B60();
  return sub_100005274;
}

void sub_100005274(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000052C4()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100005318(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000066FC();
  unint64_t v5 = sub_1000067A4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100005384()
{
  uint64_t v0 = qword_10000C020;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000053C4()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_10000541C()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100005474()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_1000054C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000054F4(a1, a2, a3, (void (*)(void))sub_1000052C4);
}

uint64_t sub_1000054F4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000553C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005574(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C1D8, a1);
}

uint64_t sub_100005574@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000067F8(v7, a3);
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005618()
{
  return 0;
}

uint64_t sub_10000562C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000066FC();
  unint64_t v6 = sub_100006750();
  unint64_t v7 = sub_1000067A4();
  *unint64_t v4 = v2;
  v4[1] = sub_1000056F8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000056F8()
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

uint64_t sub_100005800@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000063C8();
  *a1 = result;
  return result;
}

uint64_t sub_100005828(uint64_t a1)
{
  unint64_t v2 = sub_1000052C4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100005864(uint64_t a1)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_1000066B8(&qword_10000C0F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  uint64_t v32 = v2;
  __chkstk_darwin(v1);
  unint64_t v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = sub_100006BB0();
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  unint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000066B8(&qword_10000C100);
  __chkstk_darwin(v8);
  sub_1000052C4();
  sub_100006C70();
  v33._countAndFlagsBits = 0x206E65704FLL;
  v33._object = (void *)0xE500000000000000;
  sub_100006C60(v33);
  swift_getKeyPath();
  unint64_t v29 = sub_100004D28();
  sub_100006BA0();
  swift_release();
  sub_100006C50();
  swift_release();
  v34._countAndFlagsBits = 544106784;
  v34._object = (void *)0xE400000000000000;
  sub_100006C60(v34);
  uint64_t v9 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v28 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 104);
  unsigned int v21 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v10 = v24;
  v28(v7, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v24);
  sub_100006C40();
  uint64_t v11 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  uint64_t v26 = v5 + 8;
  v27 = v11;
  v11(v7, v10);
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_100006C60(v35);
  sub_100006C80();
  uint64_t v23 = sub_100006BD0();
  v12 = *(void (**)(unsigned char *, uint64_t))(v32 + 8);
  v32 += 8;
  v25 = v12;
  v12(v4, v31);
  sub_100006C70();
  v36._countAndFlagsBits = 0x206F74206F47;
  v36._object = (void *)0xE600000000000000;
  sub_100006C60(v36);
  swift_getKeyPath();
  sub_100006BA0();
  swift_release();
  sub_100006C50();
  swift_release();
  v37._countAndFlagsBits = 544106784;
  v37._object = (void *)0xE400000000000000;
  sub_100006C60(v37);
  uint64_t v13 = v9;
  uint64_t v14 = v24;
  v28(v7, v13, v24);
  sub_100006C40();
  v27(v7, v14);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_100006C60(v38);
  sub_100006C80();
  uint64_t v22 = sub_100006BD0();
  v25(v4, v31);
  sub_100006C70();
  v39._countAndFlagsBits = 0x20656D20776F6853;
  v39._object = (void *)0xE800000000000000;
  sub_100006C60(v39);
  swift_getKeyPath();
  sub_100006BA0();
  swift_release();
  sub_100006C50();
  swift_release();
  v40._countAndFlagsBits = 544106784;
  v40._object = (void *)0xE400000000000000;
  sub_100006C60(v40);
  v28(v7, v21, v14);
  sub_100006C40();
  v27(v7, v14);
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_100006C60(v41);
  sub_100006C80();
  uint64_t v15 = sub_100006BD0();
  v25(v4, v31);
  sub_1000066B8(&qword_10000C108);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100006F70;
  uint64_t v17 = v22;
  *(void *)(v16 + 32) = v23;
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = v15;
  uint64_t v18 = sub_100006BC0();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_100005DE4()
{
  return sub_100006B70();
}

uint64_t sub_100005E08()
{
  return sub_100006B80();
}

uint64_t sub_100005E2C()
{
  uint64_t v0 = sub_100006C30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004D28();
  sub_100006BA0();
  swift_release();
  sub_1000052C4();
  sub_100006C20();
  uint64_t v4 = sub_100006C10();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000066B8(&qword_10000C0E8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006F50;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006C00();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100005F94()
{
  uint64_t v0 = sub_100006BF0();
  uint64_t v1 = sub_100006BF0();
  uint64_t v2 = sub_100006BF0();
  uint64_t v3 = sub_100006BF0();
  sub_1000066B8(&qword_10000C0F0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006F80;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_100006BE0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006080()
{
  uint64_t v0 = sub_100006CB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000063C8();
  sub_1000052C4();
  sub_100006CC0();
  uint64_t v4 = sub_100006CA0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000066B8(&qword_10000C0E0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006F50;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006C90();
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_1000061E0()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for MCUIAssistantIntents()
{
  return &type metadata for MCUIAssistantIntents;
}

ValueMetadata *type metadata accessor for OpenMCUIStaticDeepLinks()
{
  return &type metadata for OpenMCUIStaticDeepLinks;
}

uint64_t getEnumTagSinglePayload for MCUIStaticDeepLinks(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MCUIStaticDeepLinks(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100006300);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MCUIStaticDeepLinks()
{
  return &type metadata for MCUIStaticDeepLinks;
}

uint64_t sub_10000633C(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100006368()
{
  sub_100006E10();
  sub_100006DE0();
  Swift::Int v0 = sub_100006E20();

  return sub_10000633C(v0);
}

uint64_t sub_1000063C8()
{
  uint64_t v17 = sub_100006D60();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000066B8(&qword_10000C110);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_1000066B8(&qword_10000C118);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006DC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_1000066B8(&qword_10000C120);
  sub_100006DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_100006B50();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100004974();
  return sub_100006B90();
}

uint64_t sub_1000066B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000066FC()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100006750()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_1000067A4()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_1000067F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006830(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006894(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000068A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000066B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000690C(uint64_t a1)
{
  unint64_t v2 = sub_100006A5C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000069B4()
{
  unint64_t result = qword_10000C190;
  if (!qword_10000C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

uint64_t sub_100006A0C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100006A5C()
{
  unint64_t result = qword_10000C198;
  if (!qword_10000C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C198);
  }
  return result;
}

ValueMetadata *type metadata accessor for MCUIAppIntentsExtension()
{
  return &type metadata for MCUIAppIntentsExtension;
}

uint64_t sub_100006AC0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006AD0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006AE0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006B00()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006B10()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006B20()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006B50()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006B60()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006B70()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006B80()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006B90()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006BA0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006BB0()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_100006BC0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006BD0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100006BE0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006BF0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006C00()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006C10()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006C20()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100006C30()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006C40()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_100006C50()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100006C60(Swift::String a1)
{
}

uint64_t sub_100006C70()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100006C80()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100006C90()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006CA0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006CB0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006CC0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006CD0()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006CE0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006D00()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006D10()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006D20()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006D30()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006D60()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006D80()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006D90()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006DB0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006DC0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006DD0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006DE0()
{
  return String.hash(into:)();
}

uint64_t sub_100006DF0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006E00(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006E10()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006E20()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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