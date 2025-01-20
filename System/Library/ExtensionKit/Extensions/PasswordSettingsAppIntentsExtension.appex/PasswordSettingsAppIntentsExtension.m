uint64_t sub_100002FE4(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003138();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003090()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_1000030E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003138()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for PasswordSettingsAppIntentsExtensionExtension()
{
  return &type metadata for PasswordSettingsAppIntentsExtensionExtension;
}

uint64_t sub_10000319C()
{
  uint64_t v0 = sub_100003930(&qword_10000C058);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000038DC();
  sub_100006800();
  uint64_t v4 = sub_100006790();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100006800();
  uint64_t v6 = sub_100006790();
  v5(v3, v0);
  sub_100006800();
  uint64_t v7 = sub_100006790();
  v5(v3, v0);
  sub_100003930(&qword_10000C060);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000074E0;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_100006780();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000033A8()
{
  uint64_t v0 = sub_1000067F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000039E8();
  sub_100006770();
  swift_release();
  sub_1000038DC();
  sub_1000067E0();
  uint64_t v4 = sub_1000067D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003930(&qword_10000C050);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000074F0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000067C0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100003510()
{
  uint64_t v0 = sub_1000067B0();
  sub_100003930(&qword_10000C038);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000074F0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000067A0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000358C()
{
  uint64_t v0 = sub_1000067B0();
  uint64_t v1 = sub_1000067B0();
  sub_100003930(&qword_10000C038);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100007500;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_1000067A0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100003634()
{
  uint64_t v0 = sub_100006830();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000059E0();
  sub_1000038DC();
  sub_100006840();
  uint64_t v4 = sub_100006820();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003930(&qword_10000C040);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000074F0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006810();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100003794()
{
  uint64_t v0 = sub_100006760();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000038DC();
  sub_100006750();
  uint64_t v4 = sub_100006740();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003930(&qword_10000C030);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000074F0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006730();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for PasswordAssistantIntents()
{
  return &type metadata for PasswordAssistantIntents;
}

unint64_t sub_1000038DC()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

uint64_t sub_100003930(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003974@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006700();
  *a1 = v3;
  return result;
}

uint64_t sub_1000039B0()
{
  return sub_100006710();
}

unint64_t sub_1000039E8()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100003A3C()
{
  sub_100006700();
  return v1;
}

uint64_t sub_100003A70()
{
  uint64_t v0 = sub_100003930(&qword_10000C160);
  sub_100005E04(v0, qword_10000CDA0);
  sub_100005DCC(v0, (uint64_t)qword_10000CDA0);
  sub_100003930(&qword_10000C168);
  uint64_t v1 = *(void *)(sub_100003930(&qword_10000C170) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000075A0;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_10000474C();
  sub_1000068A0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_1000068A0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_1000068A0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_1000068A0();
  sub_100003C78(v4);
  return sub_1000068B0();
}

unint64_t sub_100003C78(uint64_t a1)
{
  uint64_t v2 = sub_100003930(&qword_10000C170);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003930(&qword_10000C178);
  uint64_t v6 = sub_100006970();
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
    sub_100006590(v12, (uint64_t)v5, &qword_10000C170);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_1000056DC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100003930((uint64_t *)&unk_10000C180);
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

unint64_t sub_100003E78(uint64_t a1)
{
  uint64_t v2 = sub_100003930(&qword_10000C148);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003930(&qword_10000C158);
  uint64_t v6 = sub_100006970();
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
    sub_100006590(v12, (uint64_t)v5, &qword_10000C148);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_1000056DC(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006890();
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

uint64_t sub_100004070()
{
  uint64_t v0 = sub_100003930(&qword_10000C110);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006940();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100006920();
  sub_100005E04(v5, qword_10000CDB8);
  sub_100005DCC(v5, (uint64_t)qword_10000CDB8);
  sub_100006930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100006910();
}

uint64_t sub_1000041DC(unsigned __int8 *a1, char *a2)
{
  return sub_100004240(*a1, *a2);
}

unint64_t sub_1000041EC()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_100004240(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6C6C69466F747561;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v3 = 0x8000000100006AD0;
      break;
    case 3:
      unint64_t v3 = 0x8000000100006AF0;
      unint64_t v5 = 0xD000000000000016;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x6C6C69466F747561) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xD000000000000018;
      unint64_t v6 = 0x8000000100006AD0;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0x8000000100006AF0;
      if (v5 == 0xD000000000000016) {
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
        char v7 = sub_100006990();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_1000043D8()
{
  return sub_1000043E0();
}

Swift::Int sub_1000043E0()
{
  return sub_1000069B0();
}

uint64_t sub_1000044C0()
{
  return sub_1000044C8();
}

uint64_t sub_1000044C8()
{
  sub_100006960();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004594()
{
  return sub_10000459C();
}

Swift::Int sub_10000459C()
{
  return sub_1000069B0();
}

uint64_t sub_100004678@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000065F4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_1000046A8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1953460082;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x6C6C69466F747561;
      goto LABEL_3;
    case 2:
      *a1 = 0xD000000000000018;
      a1[1] = 0x8000000100006AD0;
      break;
    case 3:
      *a1 = 0xD000000000000016;
      a1[1] = 0x8000000100006AF0;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_10000474C()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_1000047A4()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

uint64_t sub_1000047F8@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C000 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003930(&qword_10000C160);
  uint64_t v3 = sub_100005DCC(v2, (uint64_t)qword_10000CDA0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000048A8()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_100004900()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100004958()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

void *sub_1000049AC()
{
  return &protocol witness table for String;
}

uint64_t sub_1000049B8()
{
  sub_100005D78();
  uint64_t v2 = sub_100006850();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000657C(v3, v0, v2, v1);
}

unint64_t sub_100004A50()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_100004AA8()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_100004B04()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

uint64_t sub_100004B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005220(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CDB8, a1);
}

uint64_t sub_100004B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000051A0(a1, a2, a3, (void (*)(void))sub_10000474C);
}

uint64_t sub_100004BC0(uint64_t a1)
{
  unint64_t v2 = sub_10000474C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004C10()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_100004C68()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100004CC0()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100004D18(uint64_t a1)
{
  unint64_t v2 = sub_100004B04();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004D68()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    sub_100004DC4(&qword_10000C0D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_100004DC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100004E0C(void *a1@<X8>)
{
  *a1 = &off_1000087C8;
}

unint64_t sub_100004E20()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_100004E74()
{
  uint64_t v0 = sub_100006940();
  sub_100005E04(v0, qword_10000CDD0);
  sub_100005DCC(v0, (uint64_t)qword_10000CDD0);
  return sub_100006930();
}

uint64_t sub_100004ED8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006700();
  *a1 = v3;
  return result;
}

uint64_t sub_100004F14()
{
  return sub_100006710();
}

void (*sub_100004F4C(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000066F0();
  return sub_100004FA8;
}

void sub_100004FA8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100004FF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005CD0();
  unint64_t v5 = sub_100005D78();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100005070()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

unint64_t sub_1000050C8()
{
  unint64_t result = qword_10000C0F0;
  if (!qword_10000C0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F0);
  }
  return result;
}

unint64_t sub_100005120()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_100005174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000051A0(a1, a2, a3, (void (*)(void))sub_1000038DC);
}

uint64_t sub_1000051A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000051E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005220(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CDD0, a1);
}

uint64_t sub_100005220@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005DCC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000052C4()
{
  return 0;
}

uint64_t sub_1000052D0()
{
  return 1;
}

uint64_t sub_1000052E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005CD0();
  unint64_t v6 = sub_100005D24();
  unint64_t v7 = sub_100005D78();
  *unint64_t v4 = v2;
  v4[1] = sub_1000053AC;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000053AC()
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

uint64_t sub_1000054B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000059E0();
  *a1 = result;
  return result;
}

uint64_t sub_1000054DC(uint64_t a1)
{
  unint64_t v2 = sub_1000038DC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenPasswordSettingsDeepLinks()
{
  return &type metadata for OpenPasswordSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for PasswordSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PasswordSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PasswordSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100005694);
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

uint64_t sub_1000056BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000056C4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PasswordSettingsDeepLinks()
{
  return &type metadata for PasswordSettingsDeepLinks;
}

unint64_t sub_1000056DC(unsigned __int8 a1)
{
  sub_1000069A0();
  sub_100006960();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_1000069B0();

  return sub_1000057E0(a1, v2);
}

unint64_t sub_1000057E0(unsigned __int8 a1, uint64_t a2)
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
      unint64_t v8 = 1953460082;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x6C6C69466F747561;
          break;
        case 2:
          unint64_t v8 = 0xD000000000000018;
          unint64_t v7 = 0x8000000100006AD0;
          break;
        case 3:
          unint64_t v7 = 0x8000000100006AF0;
          unint64_t v8 = 0xD000000000000016;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      unint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE800000000000000;
          if (v8 == 0x6C6C69466F747561) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v10 = 0xD000000000000018;
          unint64_t v9 = 0x8000000100006AD0;
          goto LABEL_11;
        case 3:
          unint64_t v9 = 0x8000000100006AF0;
          if (v8 == 0xD000000000000016) {
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
          char v11 = sub_100006990();
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

uint64_t sub_1000059E0()
{
  uint64_t v16 = sub_1000068E0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003930(&qword_10000C108);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100003930(&qword_10000C110);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006940();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100003930(&qword_10000C118);
  sub_100006930();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 4;
  uint64_t v13 = sub_1000066E0();
  unsigned __int8 v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_10000474C();
  return sub_100006720();
}

unint64_t sub_100005CD0()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100005D24()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100005D78()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_100005DCC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005E04(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100005E68()
{
  uint64_t v0 = sub_100003930(&qword_10000C138);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100003930(&qword_10000C110);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006940();
  uint64_t v46 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  sub_100003930(&qword_10000C140);
  uint64_t v11 = sub_100003930(&qword_10000C148);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v42 = *(void *)(v12 + 72);
  uint64_t v13 = v11 - 8;
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  uint64_t v35 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_1000075A0;
  unint64_t v40 = v15 + v14;
  unint64_t v44 = v15 + v14 + *(int *)(v13 + 56);
  uint64_t v45 = v13;
  *(unsigned char *)(v15 + v14) = 0;
  sub_100006930();
  sub_100006930();
  v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v39(v5, 0, 1, v6);
  unint64_t v41 = 0x8000000100006C30;
  sub_100006860();
  uint64_t v37 = sub_100006870();
  uint64_t v16 = *(void *)(v37 - 8);
  v43 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
  uint64_t v38 = v16 + 56;
  v43(v2, 0, 1, v37);
  uint64_t v17 = sub_100003930(&qword_10000C150);
  uint64_t v30 = v7 + 56;
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v31 = *(void *)(v7 + 72);
  uint64_t v32 = (v18 + 32) & ~v18;
  uint64_t v33 = v18 | 7;
  uint64_t v34 = v17;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007500;
  sub_100006930();
  sub_100006930();
  v36 = v10;
  sub_100006930();
  sub_100006880();
  uint64_t v19 = v42;
  unint64_t v20 = v40;
  uint64_t v29 = v40 + v42 + *(int *)(v13 + 56);
  *(unsigned char *)(v40 + v42) = 1;
  sub_100006930();
  unint64_t v44 = 0x8000000100006CC0;
  sub_100006930();
  BOOL v21 = v39;
  v39(v5, 0, 1, v46);
  sub_100006860();
  uint64_t v22 = v37;
  v43(v2, 0, 1, v37);
  sub_100006930();
  sub_100006880();
  uint64_t v29 = 2 * v19;
  v23 = (unsigned char *)(v20 + 2 * v19);
  v28 = &v23[*(int *)(v45 + 56)];
  unsigned char *v23 = 2;
  sub_100006930();
  sub_100006930();
  uint64_t v24 = v46;
  v21(v5, 0, 1, v46);
  sub_100006860();
  uint64_t v25 = v22;
  v26 = v43;
  v43(v2, 0, 1, v25);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000074F0;
  sub_100006930();
  sub_100006930();
  sub_100006880();
  *(unsigned char *)(v40 + v29 + v42) = 3;
  sub_100006930();
  sub_100006930();
  v39(v5, 0, 1, v24);
  sub_100006860();
  v26(v2, 0, 1, v37);
  sub_100006930();
  sub_100006880();
  return sub_100003E78(v35);
}

uint64_t sub_10000657C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006590(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003930(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000065F4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008748;
  v6._object = a2;
  unint64_t v4 = sub_100006980(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006640()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006650()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006660()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100006670()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100006690()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000066A0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000066B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000066E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000066F0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006700()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006710()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006720()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100006730()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100006740()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100006750()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100006760()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100006770()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006780()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006790()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000067A0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000067B0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000067C0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000067D0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000067E0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000067F0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006800()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006810()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006820()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006830()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006840()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006850()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100006860()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006870()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006880()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006890()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000068A0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000068B0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000068E0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006900()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006910()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006920()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006930()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006940()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006950()
{
  return static AppExtension.main()();
}

uint64_t sub_100006960()
{
  return String.hash(into:)();
}

uint64_t sub_100006970()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100006980(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006990()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000069A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000069B0()
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