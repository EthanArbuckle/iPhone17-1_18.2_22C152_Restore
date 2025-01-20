uint64_t sub_100002854(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000029A8();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002900()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100002958()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000029A8()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for MeasureSettingsAppIntentsExtensionExtension()
{
  return &type metadata for MeasureSettingsAppIntentsExtensionExtension;
}

uint64_t sub_100002A0C()
{
  uint64_t v0 = sub_1000030AC(&qword_10000C058);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003058();
  sub_100006A40();
  uint64_t v4 = sub_1000069D0();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100006A40();
  uint64_t v6 = sub_1000069D0();
  v5(v3, v0);
  sub_1000030AC(&qword_10000C060);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100006EA0;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_1000069C0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100002BC0()
{
  uint64_t v0 = sub_100006A30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100003164();
  sub_1000069B0();
  swift_release();
  sub_100003058();
  sub_100006A20();
  uint64_t v4 = sub_100006A10();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000030AC(&qword_10000C050);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006EB0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006A00();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002D28()
{
  return sub_100002D4C();
}

uint64_t sub_100002D40()
{
  return sub_100002D4C();
}

uint64_t sub_100002D4C()
{
  uint64_t v0 = sub_1000069F0();
  sub_1000030AC(&qword_10000C038);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100006EB0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000069E0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100002DB0()
{
  uint64_t v0 = sub_100006A70();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_10000543C();
  sub_100003058();
  sub_100006A80();
  uint64_t v4 = sub_100006A60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000030AC(&qword_10000C040);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006EB0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006A50();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002F10()
{
  uint64_t v0 = sub_1000069A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003058();
  sub_100006990();
  uint64_t v4 = sub_100006980();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1000030AC(&qword_10000C030);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006EB0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006970();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for MeasureAssistantIntents()
{
  return &type metadata for MeasureAssistantIntents;
}

unint64_t sub_100003058()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

uint64_t sub_1000030AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000030F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006940();
  *a1 = v3;
  return result;
}

uint64_t sub_10000312C()
{
  return sub_100006950();
}

unint64_t sub_100003164()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_1000031B8()
{
  sub_100006940();
  return v1;
}

uint64_t sub_1000031EC()
{
  uint64_t v0 = sub_1000030AC(&qword_10000C170);
  sub_1000059D8(v0, qword_10000CDB0);
  sub_1000059A0(v0, (uint64_t)qword_10000CDB0);
  sub_1000030AC(&qword_10000C178);
  uint64_t v1 = *(void *)(sub_1000030AC(&qword_10000C180) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006F50;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100003FF0();
  sub_100006AE0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100006AE0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100006AE0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_100006AE0();
  sub_1000033F0(v4);
  return sub_100006AF0();
}

unint64_t sub_1000033F0(uint64_t a1)
{
  uint64_t v2 = sub_1000030AC(&qword_10000C180);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000030AC(&qword_10000C188);
  uint64_t v6 = sub_100006C00();
  uint64_t v7 = (void *)v6;
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
    sub_1000067E0(v12, (uint64_t)v5, &qword_10000C180);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005140(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_1000030AC((uint64_t *)&unk_10000C190);
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

unint64_t sub_1000035F0(uint64_t a1)
{
  uint64_t v2 = sub_1000030AC(&qword_10000C158);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000030AC(&qword_10000C168);
  uint64_t v6 = sub_100006C00();
  uint64_t v7 = (void *)v6;
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
    sub_1000067E0(v12, (uint64_t)v5, &qword_10000C158);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005140(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006AD0();
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

uint64_t sub_1000037E8()
{
  uint64_t v0 = sub_1000030AC(&qword_10000C120);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_100006B70();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006BB0();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100006BE0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_100006B80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_100006B60();
  sub_1000059D8(v10, qword_10000CDC8);
  sub_1000059A0(v10, (uint64_t)qword_10000CDC8);
  sub_100006BD0();
  sub_100006BA0();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_100006B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_100006B50();
}

uint64_t sub_100003ACC(unsigned __int8 *a1, char *a2)
{
  return sub_100003B30(*a1, *a2);
}

unint64_t sub_100003ADC()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

uint64_t sub_100003B30(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x556572757361656DLL;
      unint64_t v3 = 0xEC0000007374696ELL;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6C61697265706D69;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x63697274656DLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEC0000007374696ELL;
      if (v5 == 0x556572757361656DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x6C61697265706D69;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x63697274656DLL) {
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
        char v7 = sub_100006C20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_100003CB8()
{
  return sub_100006C40();
}

uint64_t sub_100003D90()
{
  sub_100006BF0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003E50()
{
  return sub_100006C40();
}

uint64_t sub_100003F24@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100006844(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100003F54(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1953460082;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEC0000007374696ELL;
      uint64_t v3 = 0x556572757361656DLL;
      goto LABEL_3;
    case 2:
      *a1 = 0x6C61697265706D69;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x63697274656DLL;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_100003FF0()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100004048()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_10000409C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000030AC(&qword_10000C170);
  uint64_t v3 = sub_1000059A0(v2, (uint64_t)qword_10000CDB0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000414C()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_1000041A4()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_1000041FC()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

void *sub_100004250()
{
  return &protocol witness table for String;
}

uint64_t sub_10000425C()
{
  sub_10000594C();
  uint64_t v2 = sub_100006A90();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000067CC(v3, v0, v2, v1);
}

unint64_t sub_1000042F4()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_10000434C()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_1000043A8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_100004400@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C84(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CDC8, a1);
}

uint64_t sub_100004438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004C04(a1, a2, a3, (void (*)(void))sub_100003FF0);
}

uint64_t sub_100004464(uint64_t a1)
{
  unint64_t v2 = sub_100003FF0();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000044B4()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_10000450C()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100004564()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_1000045BC(uint64_t a1)
{
  unint64_t v2 = sub_1000043A8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000460C()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    sub_100004668(&qword_10000C0E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_100004668(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000046B0(void *a1@<X8>)
{
  *a1 = &off_1000087F8;
}

unint64_t sub_1000046C4()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

uint64_t sub_100004718()
{
  uint64_t v0 = sub_100006B70();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006BB0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100006BE0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100006B80();
  sub_1000059D8(v6, qword_10000CDE0);
  sub_1000059A0(v6, (uint64_t)qword_10000CDE0);
  sub_100006BD0();
  sub_100006BA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006B90();
}

uint64_t sub_100004908@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006940();
  *a1 = v3;
  return result;
}

uint64_t sub_100004944()
{
  return sub_100006950();
}

void (*sub_10000497C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006930();
  return sub_1000049D8;
}

void sub_1000049D8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100004A28(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000058A4();
  unint64_t v5 = sub_10000594C();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100004A94()
{
  uint64_t v0 = qword_10000C068;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004AD4()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

unint64_t sub_100004B2C()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

unint64_t sub_100004B84()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100004BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004C04(a1, a2, a3, (void (*)(void))sub_100003058);
}

uint64_t sub_100004C04(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004C4C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C84(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CDE0, a1);
}

uint64_t sub_100004C84@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000059A0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004D28()
{
  return 0;
}

uint64_t sub_100004D34()
{
  return 1;
}

uint64_t sub_100004D44(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000058A4();
  unint64_t v6 = sub_1000058F8();
  unint64_t v7 = sub_10000594C();
  *unint64_t v4 = v2;
  v4[1] = sub_100004E10;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100004E10()
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

uint64_t sub_100004F18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000543C();
  *a1 = result;
  return result;
}

uint64_t sub_100004F40(uint64_t a1)
{
  unint64_t v2 = sub_100003058();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenMeasureSettingsDeepLinks()
{
  return &type metadata for OpenMeasureSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for MeasureSettingsAppIntentsExtensionDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MeasureSettingsAppIntentsExtensionDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MeasureSettingsAppIntentsExtensionDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000050F8);
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

uint64_t sub_100005120(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005128(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MeasureSettingsAppIntentsExtensionDeepLinks()
{
  return &type metadata for MeasureSettingsAppIntentsExtensionDeepLinks;
}

unint64_t sub_100005140(unsigned __int8 a1)
{
  sub_100006C30();
  sub_100006BF0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100006C40();

  return sub_10000523C(a1, v2);
}

unint64_t sub_10000523C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      uint64_t v8 = 1953460082;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v8 = 0x556572757361656DLL;
          unint64_t v7 = 0xEC0000007374696ELL;
          break;
        case 2:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x6C61697265706D69;
          break;
        case 3:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x63697274656DLL;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xEC0000007374696ELL;
          if (v8 == 0x556572757361656DLL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v9 = 0xE800000000000000;
          uint64_t v10 = 0x6C61697265706D69;
          goto LABEL_11;
        case 3:
          unint64_t v9 = 0xE600000000000000;
          if (v8 == 0x63697274656DLL) {
            goto LABEL_14;
          }
          goto LABEL_15;
        default:
LABEL_11:
          if (v8 != v10) {
            goto LABEL_15;
          }
LABEL_14:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_15:
          char v11 = sub_100006C20();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_10000543C()
{
  uint64_t v0 = sub_100006B20();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v22 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000030AC(&qword_10000C118);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  BOOL v21 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - v4;
  uint64_t v6 = sub_1000030AC(&qword_10000C120);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006B70();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006BB0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100006BE0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100006B80();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v20 = sub_1000030AC(&qword_10000C128);
  sub_100006BD0();
  sub_100006BA0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  sub_100006B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v8, 1, 1, v15);
  char v25 = 4;
  uint64_t v17 = sub_100006920();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  v18(v5, 1, 1, v17);
  v18(v21, 1, 1, v17);
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v22, enum case for InputConnectionBehavior.default(_:), v24);
  sub_100003FF0();
  return sub_100006960();
}

unint64_t sub_1000058A4()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_1000058F8()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

unint64_t sub_10000594C()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

uint64_t sub_1000059A0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000059D8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100005A3C()
{
  uint64_t v0 = sub_1000030AC(&qword_10000C148);
  __chkstk_darwin(v0 - 8);
  v59 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000030AC(&qword_10000C120);
  __chkstk_darwin(v2 - 8);
  v45 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006B70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006BB0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100006BE0();
  __chkstk_darwin(v9 - 8);
  uint64_t v58 = sub_100006B80();
  uint64_t v10 = *(void *)(v58 - 8);
  uint64_t v11 = __chkstk_darwin(v58);
  v60 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v57 = (char *)&v36 - v13;
  sub_1000030AC(&qword_10000C150);
  uint64_t v14 = sub_1000030AC(&qword_10000C158);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v49 = *(void *)(v15 + 72);
  uint64_t v16 = v14 - 8;
  v53 = (unsigned char *)(v14 - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = swift_allocObject();
  uint64_t v43 = v18;
  *(_OWORD *)(v18 + 16) = xmmword_100006F50;
  unint64_t v48 = v18 + v17;
  uint64_t v41 = v18 + v17 + *(int *)(v16 + 56);
  *(unsigned char *)(v18 + v17) = 0;
  unint64_t v42 = 0xD000000000000010;
  sub_100006BD0();
  sub_100006BA0();
  uint64_t v19 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v20(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  uint64_t v44 = v5 + 104;
  sub_100006B90();
  unint64_t v52 = 0x8000000100007540;
  sub_100006BD0();
  sub_100006BA0();
  v20(v7, v19, v4);
  BOOL v21 = v45;
  sub_100006B90();
  v51 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  v51(v21, 0, 1, v58);
  unint64_t v47 = 0xD000000000000011;
  unint64_t v50 = 0x8000000100007560;
  uint64_t v22 = v59;
  sub_100006AA0();
  uint64_t v56 = sub_100006AB0();
  uint64_t v23 = *(void *)(v56 - 8);
  v55 = *(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56);
  uint64_t v46 = v23 + 56;
  v55(v22, 0, 1, v56);
  sub_1000030AC(&qword_10000C160);
  uint64_t v54 = v10 + 56;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006EA0;
  sub_100006BD0();
  sub_100006BA0();
  v20(v7, v19, v4);
  sub_100006B90();
  unint64_t v40 = 0xD00000000000001ELL;
  sub_100006BD0();
  sub_100006BA0();
  v20(v7, v19, v4);
  v37 = v20;
  sub_100006B90();
  sub_100006BD0();
  sub_100006BA0();
  v20(v7, v19, v4);
  sub_100006B90();
  uint64_t v24 = v45;
  sub_100006AC0();
  uint64_t v41 = v48 + v49 + *((int *)v53 + 14);
  *(unsigned char *)(v48 + v49) = 1;
  sub_100006BD0();
  sub_100006BA0();
  char v25 = v37;
  v37(v7, v19, v4);
  sub_100006B90();
  sub_100006BD0();
  sub_100006BA0();
  unsigned int v39 = v19;
  v25(v7, v19, v4);
  v26 = v25;
  sub_100006B90();
  v51(v24, 0, 1, v58);
  v27 = v59;
  sub_100006AA0();
  v55(v27, 0, 1, v56);
  sub_100006BD0();
  sub_100006BA0();
  v26(v7, v19, v4);
  sub_100006B90();
  sub_100006AC0();
  uint64_t v41 = 2 * v49;
  v28 = (unsigned char *)(v48 + 2 * v49);
  unint64_t v40 = (unint64_t)&v28[*((int *)v53 + 14)];
  unsigned char *v28 = 2;
  sub_100006BD0();
  sub_100006BA0();
  uint64_t v29 = v39;
  v26(v7, v39, v4);
  sub_100006B90();
  sub_100006BD0();
  sub_100006BA0();
  uint64_t v30 = v29;
  uint64_t v38 = v4;
  v26(v7, v29, v4);
  v31 = v45;
  sub_100006B90();
  v51(v31, 0, 1, v58);
  v32 = v59;
  sub_100006AA0();
  v55(v32, 0, 1, v56);
  sub_100006BD0();
  sub_100006BA0();
  v26(v7, v30, v4);
  sub_100006B90();
  sub_100006AC0();
  v33 = (unsigned char *)(v48 + v41 + v49);
  v53 = &v33[*((int *)v53 + 14)];
  unsigned char *v33 = 3;
  sub_100006BD0();
  sub_100006BA0();
  uint64_t v34 = v38;
  v26(v7, v30, v38);
  sub_100006B90();
  sub_100006BD0();
  sub_100006BA0();
  v26(v7, v30, v34);
  sub_100006B90();
  v51(v31, 0, 1, v58);
  sub_100006AA0();
  v55(v32, 0, 1, v56);
  sub_100006BD0();
  sub_100006BA0();
  v26(v7, v30, v34);
  sub_100006B90();
  sub_100006AC0();
  return sub_1000035F0(v43);
}

uint64_t sub_1000067CC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000067E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000030AC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006844(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008778;
  v6._object = a2;
  unint64_t v4 = sub_100006C10(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006890()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_1000068A0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_1000068B0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000068D0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000068E0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000068F0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006920()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006930()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006940()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006950()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006960()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006970()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100006980()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100006990()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_1000069A0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_1000069B0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_1000069C0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_1000069D0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000069E0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000069F0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006A00()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100006A10()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100006A20()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100006A30()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006A40()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006A50()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006A60()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006A70()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006A80()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006A90()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006AA0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100006AB0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006AC0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006AD0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006AE0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006AF0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_100006B20()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006B40()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006B50()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006B60()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006B70()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006B90()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006BA0()
{
  return static Locale.current.getter();
}

uint64_t sub_100006BB0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006BC0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006BD0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100006BE0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100006BF0()
{
  return String.hash(into:)();
}

uint64_t sub_100006C00()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006C10(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006C20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006C30()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006C40()
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