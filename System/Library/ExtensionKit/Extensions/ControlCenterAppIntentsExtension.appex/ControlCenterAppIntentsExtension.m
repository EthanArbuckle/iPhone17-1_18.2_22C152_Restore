unint64_t sub_100003710()
{
  unint64_t result;

  result = qword_10000C030;
  if (!qword_10000C030)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_100003768()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_1000037BC()
{
  uint64_t v0 = sub_100006C20();
  sub_1000044FC(v0, qword_10000C190);
  sub_1000044C4(v0, (uint64_t)qword_10000C190);
  return sub_100006C00();
}

uint64_t sub_100003820()
{
  sub_100006A10();
  return v1;
}

uint64_t sub_100003854@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006A10();
  *a1 = v3;
  return result;
}

uint64_t sub_100003890()
{
  return sub_100006A20();
}

void (*sub_1000038C8(void *a1))(void *a1)
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006A00();
  return sub_100003924;
}

void sub_100003924(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100003974()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_1000039CC()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100003A20(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000043C8();
  unint64_t v5 = sub_100004470();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100003A8C()
{
  uint64_t v0 = qword_10000C008;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100003ACC()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100003B24()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

uint64_t sub_100003B78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003BC8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006C20();
  uint64_t v3 = sub_1000044C4(v2, (uint64_t)qword_10000C190);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100003C70()
{
  return 0;
}

uint64_t sub_100003C7C()
{
  return 1;
}

uint64_t sub_100003C8C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000043C8();
  unint64_t v7 = sub_10000441C();
  unint64_t v8 = sub_100004470();
  *unint64_t v5 = v2;
  v5[1] = sub_100003D60;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100003D60()
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

uint64_t sub_100003E68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003EDC();
  *a1 = result;
  return result;
}

uint64_t sub_100003E90(uint64_t a1)
{
  unint64_t v2 = sub_100003974();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenControlCenterDeepLinks()
{
  return &type metadata for OpenControlCenterDeepLinks;
}

uint64_t sub_100003EDC()
{
  uint64_t v0 = sub_100006B90();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v22 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004330(&qword_10000C068);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - v4;
  uint64_t v6 = sub_100004330(&qword_10000C070);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006C10();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006C50();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006C80();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100006C20();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v20 = sub_100004330(&qword_10000C078);
  sub_100006C70();
  sub_100006C40();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_100006C30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v25 = 3;
  uint64_t v17 = sub_1000069F0();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v21, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100004374();
  return sub_100006A30();
}

uint64_t sub_100004330(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004374()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_1000043C8()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_10000441C()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100004470()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_1000044C4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000044FC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004560(uint64_t a1)
{
  unint64_t v2 = sub_1000046B4();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000460C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100004664()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000046B4()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterAppIntentsExtension()
{
  return &type metadata for ControlCenterAppIntentsExtension;
}

uint64_t sub_100004718()
{
  uint64_t v0 = sub_100004330(&qword_10000C0D0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003974();
  sub_100006AD0();
  uint64_t v4 = sub_100006A60();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100006AD0();
  uint64_t v6 = sub_100006A60();
  v5(v3, v0);
  sub_100006AD0();
  uint64_t v7 = sub_100006A60();
  v5(v3, v0);
  sub_100006AD0();
  uint64_t v8 = sub_100006A60();
  v5(v3, v0);
  sub_100004330(&qword_10000C0D8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100007130;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_100006A50();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100004970()
{
  uint64_t v0 = sub_100006AC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004DB0();
  sub_100006A40();
  swift_release();
  sub_100003974();
  sub_100006AB0();
  uint64_t v4 = sub_100006AA0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100004330(&qword_10000C0C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007140;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006A90();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100004AD8()
{
  uint64_t v0 = sub_100006A80();
  sub_100004330(&qword_10000C0C8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100007140;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100006A70();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_100004B5C()
{
  qword_10000C1A8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100004B70()
{
  uint64_t v0 = sub_100006B00();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100003EDC();
  sub_100003974();
  sub_100006B10();
  uint64_t v4 = sub_100006AF0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100004330(&qword_10000C0B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100007140;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006AE0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100004CD0()
{
  if (qword_10000C018 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for ControlCenterAssistantIntents()
{
  return &type metadata for ControlCenterAssistantIntents;
}

uint64_t sub_100004D3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006A10();
  *a1 = v3;
  return result;
}

uint64_t sub_100004D78()
{
  return sub_100006A20();
}

unint64_t sub_100004DB0()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100004E04()
{
  uint64_t v0 = sub_100004330(&qword_10000C168);
  sub_1000044FC(v0, qword_10000C1B0);
  sub_1000044C4(v0, (uint64_t)qword_10000C1B0);
  sub_100004330(&qword_10000C170);
  uint64_t v1 = *(void *)(sub_100004330(&qword_10000C178) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000071E0;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100004374();
  sub_100006B70();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100006B70();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100006B70();
  sub_100004FD4(v4);
  return sub_100006B80();
}

unint64_t sub_100004FD4(uint64_t a1)
{
  uint64_t v2 = sub_100004330(&qword_10000C178);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004330(&qword_10000C180);
  uint64_t v6 = sub_100006CA0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068B0(v12, (uint64_t)v5, &qword_10000C178);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_1000061BC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100004330(&qword_10000C188);
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

unint64_t sub_1000051D4(uint64_t a1)
{
  uint64_t v2 = sub_100004330(&qword_10000C158);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004330(&qword_10000C160);
  uint64_t v6 = sub_100006CA0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000068B0(v12, (uint64_t)v5, &qword_10000C158);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_1000061BC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006B50();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

uint64_t sub_1000053CC()
{
  uint64_t v0 = sub_100004330(&qword_10000C070);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006C20();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100006BF0();
  sub_1000044FC(v5, qword_10000C1C8);
  sub_1000044C4(v5, (uint64_t)qword_10000C1C8);
  sub_100006C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100006BE0();
}

uint64_t sub_100005540(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1000055A4(*a1, *a2);
}

unint64_t sub_100005550()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_1000055A4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x6957737365636361;
    }
    else {
      unint64_t v3 = 0xD000000000000012;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEF7070416E696874;
    }
    else {
      unint64_t v4 = 0x8000000100007510;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x6957737365636361;
      }
      else {
        unint64_t v6 = 0xD000000000000012;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEF7070416E696874;
      }
      else {
        unint64_t v7 = 0x8000000100007510;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    unint64_t v3 = 1953460082;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1953460082)
  {
LABEL_21:
    char v8 = sub_100006CC0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_1000056C8()
{
  return sub_100006CE0();
}

uint64_t sub_100005774()
{
  sub_100006C90();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000580C()
{
  return sub_100006CE0();
}

uint64_t sub_1000058B4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100006914(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_1000058E4(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xEF7070416E696874;
  unint64_t v5 = 0x6957737365636361;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000012;
    unint64_t v4 = 0x8000000100007510;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1953460082;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_100005954()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_1000059A8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C020 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004330(&qword_10000C168);
  uint64_t v3 = sub_1000044C4(v2, (uint64_t)qword_10000C1B0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100005A58()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

unint64_t sub_100005AB0()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

void *sub_100005B04()
{
  return &protocol witness table for String;
}

uint64_t sub_100005B10()
{
  sub_100004470();
  uint64_t v2 = sub_100006B60();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000689C(v3, v0, v2, v1);
}

unint64_t sub_100005BA8()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_100005C00()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100005C5C()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

uint64_t sub_100005CB4@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C028 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006BF0();
  uint64_t v3 = sub_1000044C4(v2, (uint64_t)qword_10000C1C8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100005D5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005DAC(uint64_t a1)
{
  unint64_t v2 = sub_100004374();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005DFC()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100005E54()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100005EAC()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_100005F04(uint64_t a1)
{
  unint64_t v2 = sub_100005C5C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005F54()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    sub_100005FB0(&qword_10000C140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_100005FB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005FF8(void *a1@<X8>)
{
  *a1 = &off_1000087C8;
}

unsigned char *initializeBufferWithCopyOfBuffer for ControlCenterDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ControlCenterDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ControlCenterDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006174);
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

uint64_t sub_10000619C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000061A4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterDeepLinks()
{
  return &type metadata for ControlCenterDeepLinks;
}

unint64_t sub_1000061BC(unsigned __int8 a1)
{
  sub_100006CD0();
  sub_100006C90();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006CE0();

  return sub_10000628C(a1, v2);
}

unint64_t sub_10000628C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          unint64_t v7 = 0x6957737365636361;
          unint64_t v8 = 0xEF7070416E696874;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v8 = 0x8000000100007510;
          unint64_t v7 = 0xD000000000000012;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xE400000000000000;
            if (v7 != 1953460082) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v8 = 0xE400000000000000;
        unint64_t v7 = 1953460082;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        unint64_t v10 = 0x6957737365636361;
      }
      else {
        unint64_t v10 = 0xD000000000000012;
      }
      if (v9 == 1) {
        unint64_t v11 = 0xEF7070416E696874;
      }
      else {
        unint64_t v11 = 0x8000000100007510;
      }
      if (v7 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v8 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_100006CC0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_100006434()
{
  uint64_t v0 = sub_100004330(&qword_10000C148);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004330(&qword_10000C070);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006C20();
  uint64_t v24 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v29 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004330(&qword_10000C150);
  int v9 = (int *)(sub_100004330(&qword_10000C158) - 8);
  uint64_t v10 = *(void *)(*(void *)v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v9 + 80);
  uint64_t v27 = 2 * v10;
  uint64_t v12 = swift_allocObject();
  uint64_t v28 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_1000071E0;
  unint64_t v13 = v12 + v11;
  unint64_t v22 = v12 + v11 + v9[14];
  unint64_t v23 = v12 + v11;
  *(unsigned char *)(v12 + v11) = 0;
  sub_100006C00();
  unsigned __int8 v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  uint64_t v25 = v7 + 56;
  v26 = v14;
  v14(v5, 1, 1, v6);
  sub_100006B20();
  uint64_t v15 = sub_100006B30();
  char v16 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v21 = v15;
  v16(v2, 0, 1, v15);
  sub_100006B40();
  unint64_t v22 = v13 + v10 + v9[14];
  *(unsigned char *)(v13 + v10) = 1;
  sub_100006C00();
  sub_100006C00();
  uint64_t v17 = v24;
  uint64_t v18 = v26;
  v26(v5, 0, 1, v24);
  sub_100006B20();
  v16(v2, 0, 1, v15);
  sub_100006B40();
  *(unsigned char *)(v23 + v27) = 2;
  sub_100006C00();
  sub_100006C00();
  v18(v5, 0, 1, v17);
  sub_100006B20();
  v16(v2, 0, 1, v21);
  sub_100006B40();
  return sub_1000051D4(v28);
}

uint64_t sub_10000689C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000068B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004330(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006914(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008760;
  v6._object = a2;
  unint64_t v4 = sub_100006CB0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006960()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006970()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006980()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000069A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000069B0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000069C0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000069F0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006A00()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006A10()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006A20()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006A30()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006A40()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006A50()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006A60()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100006A70()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006A80()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006A90()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006AA0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006AB0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100006AC0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006AD0()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006AE0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006AF0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006B00()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006B10()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006B20()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_100006B30()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006B40()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100006B50()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006B60()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006B70()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006B80()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006B90()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006BD0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006BE0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006BF0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006C00()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006C10()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006C20()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006C30()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006C40()
{
  return static Locale.current.getter();
}

uint64_t sub_100006C50()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006C60()
{
  return static AppExtension.main()();
}

uint64_t sub_100006C70()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006C80()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006C90()
{
  return String.hash(into:)();
}

uint64_t sub_100006CA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006CB0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006CC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006CD0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006CE0()
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
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