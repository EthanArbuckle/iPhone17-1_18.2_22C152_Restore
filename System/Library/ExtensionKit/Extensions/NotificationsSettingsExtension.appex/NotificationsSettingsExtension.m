uint64_t sub_1000038BC()
{
  unint64_t v0;
  uint64_t vars8;

  v0 = sub_1000039B8();

  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for PlaceholderWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003938()
{
  unint64_t result = qword_100010020;
  if (!qword_100010020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010020);
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationsSettingsExtensionBundle()
{
  return &type metadata for NotificationsSettingsExtensionBundle;
}

uint64_t sub_10000399C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000039B8()
{
  unint64_t result = qword_100010028;
  if (!qword_100010028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010028);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceholderWidget()
{
  return &type metadata for PlaceholderWidget;
}

uint64_t sub_100003A1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003A68()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100003A84()
{
  return &protocol witness table for EmptyWidgetConfiguration;
}

uint64_t sub_100003A90()
{
  sub_100007E1C(&qword_100010110);
  __chkstk_darwin();
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_100009840();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009880();
  __chkstk_darwin();
  sub_1000098C0();
  __chkstk_darwin();
  uint64_t v5 = sub_100009850();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_100009820();
  sub_100007F94(v7, qword_100010DC8);
  sub_100007F5C(v7, (uint64_t)qword_100010DC8);
  sub_1000098B0();
  sub_100009870();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v9[0]);
  sub_100009860();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_100009810();
}

unint64_t sub_100003D70(uint64_t a1)
{
  uint64_t v2 = sub_100007E1C(&qword_100010148);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007E1C(&qword_100010158);
  uint64_t v6 = sub_1000098E0();
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
    sub_10000800C(v12, (uint64_t)v5, &qword_100010148);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005DF8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100009780();
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

unint64_t sub_100003F68(uint64_t a1)
{
  uint64_t v2 = sub_100007E1C(&qword_100010170);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007E1C(&qword_100010178);
  uint64_t v6 = sub_1000098E0();
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
    sub_10000800C(v12, (uint64_t)v5, &qword_100010170);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100005DF8(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100007E1C(&qword_100010180);
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

uint64_t sub_100004168()
{
  uint64_t v0 = sub_100007E1C(&qword_100010160);
  sub_100007F94(v0, qword_100010DE0);
  sub_100007F5C(v0, (uint64_t)qword_100010DE0);
  sub_100007E1C(&qword_100010168);
  uint64_t v1 = *(void *)(sub_100007E1C(&qword_100010170) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000AF90;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100004BD4();
  sub_1000097A0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_1000097A0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_1000097A0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_1000097A0();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_1000097A0();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_1000097A0();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_1000097A0();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_1000097A0();
  *(unsigned char *)(v5 + 8 * v2) = 8;
  sub_1000097A0();
  sub_100003F68(v4);
  return sub_1000097B0();
}

uint64_t sub_10000448C()
{
  uint64_t v0 = sub_100009760();
  sub_100007F94(v0, qword_100010030);
  sub_100007F5C(v0, (uint64_t)qword_100010030);
  return sub_100009750();
}

unint64_t sub_1000044F0(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4179616C70736964;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x76657250776F6873;
      break;
    case 4:
      unint64_t result = 0x68536E6565726373;
      break;
    case 5:
      unint64_t result = 1769105779;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0x6767755369726973;
      break;
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004630(unsigned __int8 *a1, char *a2)
{
  return sub_100004694(*a1, *a2);
}

unint64_t sub_100004640()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

uint64_t sub_100004694(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x4179616C70736964;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 2:
      unint64_t v3 = 0x8000000100009A40;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v5 = 0x76657250776F6873;
      unint64_t v3 = 0xEC00000073776569;
      break;
    case 4:
      unint64_t v5 = 0x68536E6565726373;
      unint64_t v3 = 0xED0000676E697261;
      break;
    case 5:
      unint64_t v5 = 1769105779;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v6 = "announceNotifications";
      goto LABEL_10;
    case 7:
      unint64_t v5 = 0x6767755369726973;
      unint64_t v3 = 0xEF736E6F69747365;
      break;
    case 8:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "notificationStyle";
LABEL_10:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x4179616C70736964;
      unint64_t v7 = 0xE900000000000073;
      break;
    case 2:
      unint64_t v7 = 0x8000000100009A40;
      unint64_t v2 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v2 = 0x76657250776F6873;
      unint64_t v7 = 0xEC00000073776569;
      break;
    case 4:
      unint64_t v2 = 0x68536E6565726373;
      unint64_t v7 = 0xED0000676E697261;
      break;
    case 5:
      unint64_t v2 = 1769105779;
      break;
    case 6:
      unint64_t v2 = 0xD000000000000015;
      uint64_t v8 = "announceNotifications";
      goto LABEL_20;
    case 7:
      unint64_t v2 = 0x6767755369726973;
      unint64_t v7 = 0xEF736E6F69747365;
      break;
    case 8:
      unint64_t v2 = 0xD000000000000011;
      uint64_t v8 = "notificationStyle";
LABEL_20:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_100009900();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_10000496C()
{
  return sub_100009920();
}

uint64_t sub_1000049B4()
{
  return sub_1000049BC();
}

uint64_t sub_1000049BC()
{
  sub_1000098D0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004B30()
{
  return sub_100009920();
}

uint64_t sub_100004B74@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100007AE0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100004BA4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000044F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100004BD4()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

unint64_t sub_100004C2C()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010068);
  }
  return result;
}

uint64_t sub_100004C80@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010008 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007E1C(&qword_100010160);
  uint64_t v3 = sub_100007F5C(v2, (uint64_t)qword_100010DE0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100004D30()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010070);
  }
  return result;
}

unint64_t sub_100004D88()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100004DE0()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

void *sub_100004E34()
{
  return &protocol witness table for String;
}

uint64_t sub_100004E40()
{
  sub_100007F08();
  uint64_t v2 = sub_100009790();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007FF8(v3, v0, v2, v1);
}

unint64_t sub_100004ED8()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

unint64_t sub_100004F30()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

unint64_t sub_100004F88()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

unint64_t sub_100004FE0()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

uint64_t sub_100005038@<X0>(uint64_t a1@<X8>)
{
  return sub_100005934(&qword_100010000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100010DC8, a1);
}

uint64_t sub_100005070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000058B4(a1, a2, a3, (void (*)(void))sub_100004BD4);
}

uint64_t sub_10000509C(uint64_t a1)
{
  unint64_t v2 = sub_100004BD4();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000050EC()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_100005144()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

unint64_t sub_10000519C()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }
  return result;
}

uint64_t sub_1000051F4(uint64_t a1)
{
  unint64_t v2 = sub_100004FE0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100005244()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    sub_1000052A0(&qword_1000100D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }
  return result;
}

uint64_t sub_1000052A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000052E8(void *a1@<X8>)
{
  *a1 = &off_10000C8B8;
}

unint64_t sub_1000052FC()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

uint64_t sub_100005350()
{
  uint64_t v0 = sub_100009840();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009880();
  __chkstk_darwin();
  sub_1000098C0();
  __chkstk_darwin();
  uint64_t v4 = sub_100009850();
  sub_100007F94(v4, qword_100010DF8);
  sub_100007F5C(v4, (uint64_t)qword_100010DF8);
  sub_1000098B0();
  sub_100009870();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100009860();
}

uint64_t sub_100005530()
{
  sub_100009600();
  return v1;
}

uint64_t sub_100005564@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009600();
  *a1 = v3;
  return result;
}

uint64_t sub_1000055A0()
{
  return sub_100009610();
}

void (*sub_1000055D8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000095F0();
  return sub_100005634;
}

void sub_100005634(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100005684()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_1000056DC()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

uint64_t sub_100005730(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100007E60();
  unint64_t v5 = sub_100007F08();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000579C()
{
  uint64_t v0 = qword_100010048;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000057DC()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

unint64_t sub_100005834()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

uint64_t sub_100005888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000058B4(a1, a2, a3, (void (*)(void))sub_100005684);
}

uint64_t sub_1000058B4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000058FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100005934(&qword_100010018, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100010DF8, a1);
}

uint64_t sub_100005934@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007F5C(v7, a3);
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000059D8()
{
  return 0;
}

uint64_t sub_1000059E4()
{
  return 1;
}

uint64_t sub_1000059F4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007E60();
  unint64_t v7 = sub_100007EB4();
  unint64_t v8 = sub_100007F08();
  *unint64_t v5 = v2;
  v5[1] = sub_100005AC8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100005AC8()
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

uint64_t sub_100005BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007B2C();
  *a1 = result;
  return result;
}

uint64_t sub_100005BF8(uint64_t a1)
{
  unint64_t v2 = sub_100005684();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenNotificationsSettingsDeepLinks()
{
  return &type metadata for OpenNotificationsSettingsDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for NotificationsSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotificationsSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NotificationsSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100005DB0);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_100005DD8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005DE0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NotificationsSettingsDeepLinks()
{
  return &type metadata for NotificationsSettingsDeepLinks;
}

unint64_t sub_100005DF8(unsigned __int8 a1)
{
  sub_100009910();
  sub_1000049BC();
  Swift::Int v2 = sub_100009920();

  return sub_100005E64(a1, v2);
}

unint64_t sub_100005E64(unsigned __int8 a1, uint64_t a2)
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
          unint64_t v8 = 0x4179616C70736964;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 2:
          unint64_t v7 = 0x8000000100009A40;
          unint64_t v8 = 0xD000000000000010;
          break;
        case 3:
          unint64_t v8 = 0x76657250776F6873;
          unint64_t v7 = 0xEC00000073776569;
          break;
        case 4:
          unint64_t v8 = 0x68536E6565726373;
          unint64_t v7 = 0xED0000676E697261;
          break;
        case 5:
          unint64_t v8 = 1769105779;
          break;
        case 6:
          unint64_t v8 = 0xD000000000000015;
          unint64_t v7 = 0x8000000100009A80;
          break;
        case 7:
          unint64_t v8 = 0x6767755369726973;
          unint64_t v7 = 0xEF736E6F69747365;
          break;
        case 8:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x8000000100009AB0;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE900000000000073;
          if (v8 == 0x4179616C70736964) {
            goto LABEL_27;
          }
          goto LABEL_28;
        case 2:
          unint64_t v9 = 0x8000000100009A40;
          if (v8 != 0xD000000000000010) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 3:
          unint64_t v9 = 0xEC00000073776569;
          if (v8 != 0x76657250776F6873) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 4:
          unint64_t v9 = 0xED0000676E697261;
          if (v8 != 0x68536E6565726373) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 5:
          if (v8 != 1769105779) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 6:
          unint64_t v9 = 0x8000000100009A80;
          if (v8 != 0xD000000000000015) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 7:
          uint64_t v10 = 0x6767755369726973;
          unint64_t v9 = 0xEF736E6F69747365;
          goto LABEL_26;
        case 8:
          unint64_t v9 = 0x8000000100009AB0;
          if (v8 != 0xD000000000000011) {
            goto LABEL_28;
          }
          goto LABEL_27;
        default:
LABEL_26:
          if (v8 != v10) {
            goto LABEL_28;
          }
LABEL_27:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_28:
          char v11 = sub_100009900();
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

unint64_t sub_1000061EC()
{
  uint64_t v110 = sub_100009840();
  uint64_t v98 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  unsigned __int8 v1 = (char *)v88 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009880();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_1000098C0();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007E1C(&qword_100010138);
  __chkstk_darwin(v6 - 8);
  v95 = (char *)v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007E1C(&qword_100010110);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009850();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v111 = (char *)v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v16 = (char *)v88 - v15;
  sub_100007E1C(&qword_100010140);
  uint64_t v17 = sub_100007E1C(&qword_100010148);
  unint64_t v18 = (*(unsigned __int8 *)(*(void *)(v17 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80);
  v97 = *(unsigned char **)(*(void *)(v17 - 8) + 72);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10000AF90;
  uint64_t v89 = v19;
  uint64_t v20 = (unsigned char *)(v19 + v18);
  uint64_t v106 = v17;
  uint64_t v21 = *(int *)(v17 + 48);
  *uint64_t v20 = 0;
  v96 = v16;
  sub_100009830();
  uint64_t v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  v112 = v10;
  uint64_t v108 = v12 + 56;
  uint64_t v109 = v11;
  v107 = v22;
  v22(v10, 1, 1, v11);
  if (qword_100010010 != -1) {
    swift_once();
  }
  v88[4] = &v20[v21];
  uint64_t v23 = sub_100009760();
  uint64_t v105 = sub_100007F5C(v23, (uint64_t)qword_100010030);
  uint64_t v100 = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v102 = v24 + 16;
  v103 = v25;
  v26 = v95;
  v25(v95, v105, v23);
  v101 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
  uint64_t v104 = v24 + 56;
  v101(v26, 0, 1, v23);
  sub_100007E1C(&qword_100010150);
  v27 = *(unsigned char **)(v12 + 72);
  unint64_t v28 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v88[2] = 8 * (void)v27;
  uint64_t v29 = swift_allocObject();
  v88[3] = v29;
  *(_OWORD *)(v29 + 16) = xmmword_10000AFA0;
  uint64_t v30 = v29 + v28;
  v88[5] = 0xD000000000000011;
  sub_1000098B0();
  sub_100009870();
  uint64_t v31 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v32 = v98 + 104;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v98 + 104);
  uint64_t v34 = v110;
  v33(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v110);
  sub_100009860();
  v99 = v20;
  uint64_t v92 = v30;
  v91 = v27;
  sub_1000098B0();
  sub_100009870();
  v33(v1, v31, v34);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  v33(v1, v31, v34);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  uint64_t v35 = v110;
  v33(v1, v31, v110);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  v33(v1, v31, v35);
  sub_100009860();
  v88[6] = 0xD000000000000016;
  sub_1000098B0();
  sub_100009870();
  v33(v1, v31, v35);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  v33(v1, v31, v35);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  unsigned int v94 = v31;
  v33(v1, v31, v35);
  sub_100009860();
  sub_1000098B0();
  sub_100009870();
  uint64_t v36 = v35;
  v33(v1, v31, v35);
  uint64_t v98 = v32;
  sub_100009860();
  v37 = v112;
  v38 = v95;
  sub_100009770();
  uint64_t v92 = (uint64_t)&v97[(void)v99 + *(int *)(v106 + 48)];
  v97[(void)v99] = 1;
  sub_1000098B0();
  sub_100009870();
  v33(v1, v94, v36);
  v93 = v33;
  sub_100009860();
  sub_100009830();
  v107(v37, 0, 1, v109);
  uint64_t v39 = v100;
  v103(v38, v105, v100);
  v40 = v38;
  v101(v38, 0, 1, v39);
  sub_1000098B0();
  sub_100009870();
  uint64_t v41 = v94;
  uint64_t v42 = v110;
  v33(v1, v94, v110);
  sub_100009860();
  v43 = v112;
  sub_100009770();
  uint64_t v92 = 2 * (void)v97;
  v44 = &v99[2 * (void)v97];
  v91 = &v44[*(int *)(v106 + 48)];
  unsigned char *v44 = 2;
  sub_1000098B0();
  sub_100009870();
  v93(v1, v41, v42);
  sub_100009860();
  sub_100009830();
  v107(v43, 0, 1, v109);
  uint64_t v45 = v100;
  v103(v38, v105, v100);
  v101(v38, 0, 1, v45);
  sub_1000098B0();
  sub_100009870();
  uint64_t v46 = v94;
  uint64_t v47 = v110;
  v48 = v93;
  v93(v1, v94, v110);
  sub_100009860();
  v49 = v112;
  sub_100009770();
  v50 = &v97[v92 + (void)v99];
  uint64_t v92 = (uint64_t)&v50[*(int *)(v106 + 48)];
  unsigned char *v50 = 3;
  sub_1000098B0();
  sub_100009870();
  v48(v1, v46, v47);
  sub_100009860();
  sub_100009830();
  v107(v49, 0, 1, v109);
  uint64_t v51 = v100;
  v103(v40, v105, v100);
  v101(v40, 0, 1, v51);
  sub_1000098B0();
  sub_100009870();
  uint64_t v52 = v47;
  uint64_t v53 = v47;
  v54 = v93;
  v93(v1, v46, v52);
  v55 = v1;
  sub_100009860();
  v56 = v112;
  sub_100009770();
  uint64_t v92 = 4 * (void)v97;
  v57 = &v99[4 * (void)v97];
  v91 = &v57[*(int *)(v106 + 48)];
  unsigned char *v57 = 4;
  sub_1000098B0();
  sub_100009870();
  v54(v55, v46, v53);
  v58 = v54;
  sub_100009860();
  sub_100009830();
  v107(v56, 0, 1, v109);
  v59 = v95;
  uint64_t v60 = v100;
  v103(v95, v105, v100);
  v101(v59, 0, 1, v60);
  sub_1000098B0();
  sub_100009870();
  v90 = v55;
  uint64_t v61 = v94;
  uint64_t v62 = v110;
  v58(v55, v94, v110);
  sub_100009860();
  v63 = v112;
  sub_100009770();
  v64 = &v97[v92 + (void)v99];
  uint64_t v92 = (uint64_t)&v64[*(int *)(v106 + 48)];
  unsigned char *v64 = 5;
  sub_1000098B0();
  sub_100009870();
  v65 = v90;
  v58(v90, v61, v62);
  v66 = v65;
  sub_100009860();
  sub_100009830();
  v107(v63, 0, 1, v109);
  v67 = v95;
  uint64_t v68 = v100;
  v103(v95, v105, v100);
  v101(v67, 0, 1, v68);
  sub_1000098B0();
  sub_100009870();
  v69 = v66;
  v70 = v66;
  uint64_t v71 = v110;
  v72 = v93;
  v93(v70, v61, v110);
  sub_100009860();
  sub_100009770();
  v73 = &v99[6 * (void)v97];
  uint64_t v92 = (uint64_t)&v73[*(int *)(v106 + 48)];
  unsigned char *v73 = 6;
  sub_1000098B0();
  sub_100009870();
  v72(v69, v61, v71);
  sub_100009860();
  v74 = v112;
  sub_100009830();
  v107(v74, 0, 1, v109);
  uint64_t v75 = v100;
  v103(v67, v105, v100);
  v101(v67, 0, 1, v75);
  sub_1000098B0();
  sub_100009870();
  uint64_t v76 = v61;
  uint64_t v77 = v110;
  v72(v69, v61, v110);
  sub_100009860();
  sub_100009770();
  uint64_t v92 = 8 * (void)v97;
  v78 = &v99[7 * (void)v97];
  v97 = &v78[*(int *)(v106 + 48)];
  unsigned char *v78 = 7;
  sub_1000098B0();
  sub_100009870();
  v72(v69, v61, v77);
  v79 = v5;
  sub_100009860();
  v80 = v112;
  sub_100009830();
  v107(v80, 0, 1, v109);
  v81 = v95;
  uint64_t v82 = v100;
  v103(v95, v105, v100);
  v101(v81, 0, 1, v82);
  v88[1] = v79;
  sub_1000098B0();
  sub_100009870();
  v72(v69, v61, v77);
  v83 = v72;
  sub_100009860();
  v84 = v112;
  sub_100009770();
  uint64_t v106 = (uint64_t)&v99[v92 + *(int *)(v106 + 48)];
  v99[v92] = 8;
  sub_1000098B0();
  sub_100009870();
  v85 = v90;
  v83(v90, v76, v77);
  sub_100009860();
  sub_100009830();
  v107(v84, 0, 1, v109);
  uint64_t v86 = v100;
  v103(v81, v105, v100);
  v101(v81, 0, 1, v86);
  sub_1000098B0();
  sub_100009870();
  v83(v85, v94, v110);
  sub_100009860();
  sub_100009770();
  return sub_100003D70(v89);
}

uint64_t sub_100007AE0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C7C0;
  v6._object = a2;
  unint64_t v4 = sub_1000098F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_100007B2C()
{
  uint64_t v16 = sub_1000097C0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E1C(&qword_100010108);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100007E1C(&qword_100010110);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100009850();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100007E1C(&qword_100010118);
  sub_100009830();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 9;
  uint64_t v13 = sub_1000095E0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100004BD4();
  return sub_100009620();
}

uint64_t sub_100007E1C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100007E60()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

unint64_t sub_100007EB4()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

unint64_t sub_100007F08()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_100007F5C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007F94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007FF8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000800C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007E1C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008070()
{
  uint64_t v0 = sub_100007E1C(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009700();
  uint64_t v4 = sub_100009690();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100009700();
  uint64_t v6 = sub_100009690();
  v5(v3, v0);
  sub_100009700();
  uint64_t v7 = sub_100009690();
  v5(v3, v0);
  sub_100007E1C((uint64_t *)&unk_1000101B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10000B4F0;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_100009680();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000827C()
{
  return sub_100008BF0();
}

uint64_t sub_100008294()
{
  return sub_100008D68();
}

uint64_t sub_1000082B8()
{
  return sub_100008A80();
}

uint64_t sub_1000082D4()
{
  return sub_100008BF0();
}

uint64_t sub_1000082EC()
{
  return sub_100008D68();
}

uint64_t sub_100008308()
{
  uint64_t v0 = sub_100007E1C(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009700();
  uint64_t v4 = sub_100009690();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100009700();
  uint64_t v6 = sub_100009690();
  v5(v3, v0);
  sub_100007E1C((uint64_t *)&unk_1000101B0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10000B500;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100009680();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1000084BC()
{
  return sub_100008BF0();
}

uint64_t sub_1000084D4()
{
  return sub_100008D68();
}

uint64_t sub_1000084F0()
{
  uint64_t v0 = sub_100007E1C(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009700();
  uint64_t v4 = sub_100009690();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100009700();
  uint64_t v6 = sub_100009690();
  v5(v3, v0);
  sub_100009700();
  uint64_t v7 = sub_100009690();
  v5(v3, v0);
  sub_100007E1C((uint64_t *)&unk_1000101B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10000B4F0;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_100009680();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000086FC()
{
  return sub_100008BF0();
}

uint64_t sub_100008714()
{
  return sub_100008D68();
}

uint64_t sub_100008730()
{
  return sub_100008A80();
}

uint64_t sub_10000874C()
{
  return sub_100008BF0();
}

uint64_t sub_100008764()
{
  return sub_100008D68();
}

uint64_t sub_100008780()
{
  return sub_100008A80();
}

uint64_t sub_10000879C()
{
  return sub_100008BF0();
}

uint64_t sub_1000087B4()
{
  return sub_100008D68();
}

uint64_t sub_1000087D0()
{
  uint64_t v0 = sub_100007E1C(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009700();
  uint64_t v4 = sub_100009690();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_100009700();
  uint64_t v6 = sub_100009690();
  v5(v3, v0);
  sub_100009700();
  uint64_t v7 = sub_100009690();
  v5(v3, v0);
  sub_100007E1C((uint64_t *)&unk_1000101B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10000B4F0;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_100009680();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000089E0()
{
  return sub_100008BF0();
}

uint64_t sub_1000089F8()
{
  return sub_100008D68();
}

uint64_t sub_100008A14()
{
  return sub_100008A80();
}

uint64_t sub_100008A30()
{
  return sub_100008BF0();
}

uint64_t sub_100008A48()
{
  return sub_100008D68();
}

uint64_t sub_100008A64()
{
  return sub_100008A80();
}

uint64_t sub_100008A80()
{
  uint64_t v0 = sub_100007E1C(&qword_1000101A8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009700();
  uint64_t v4 = sub_100009690();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007E1C((uint64_t *)&unk_1000101B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B510;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009680();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100008BD8()
{
  return sub_100008BF0();
}

uint64_t sub_100008BF0()
{
  uint64_t v0 = sub_1000096F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100004F88();
  sub_100009670();
  swift_release();
  sub_100005684();
  sub_1000096E0();
  uint64_t v4 = sub_1000096D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007E1C(&qword_1000101A0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B510;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000096C0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100008D4C()
{
  return sub_100008D68();
}

uint64_t sub_100008D68()
{
  uint64_t v0 = sub_1000096B0();
  sub_100007E1C(&qword_100010190);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10000B510;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_1000096A0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100008DCC()
{
  uint64_t v0 = sub_1000096B0();
  uint64_t v1 = sub_1000096B0();
  uint64_t v2 = sub_1000096B0();
  sub_100007E1C(&qword_100010190);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10000B4F0;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_1000096A0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100008EA8()
{
  uint64_t v0 = sub_100009660();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005684();
  sub_100009650();
  uint64_t v4 = sub_100009640();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007E1C(&qword_100010188);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000B510;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100009630();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for NotificationsSettingsAssistantIntents()
{
  return &type metadata for NotificationsSettingsAssistantIntents;
}

uint64_t sub_100008FF0()
{
  uint64_t v0 = sub_100009730();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100007B2C();
  sub_100005684();
  sub_100009740();
  uint64_t v19 = sub_100009720();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v18 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v17 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v16 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v5 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v6 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v7 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v8 = sub_100009720();
  v4(v3, v0);
  uint64_t v20 = sub_100007B2C();
  sub_100009740();
  uint64_t v9 = sub_100009720();
  v4(v3, v0);
  sub_100007E1C(&qword_100010198);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10000AF90;
  uint64_t v11 = v18;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v11;
  uint64_t v12 = v16;
  *(void *)(v10 + 48) = v17;
  *(void *)(v10 + 56) = v12;
  *(void *)(v10 + 64) = v5;
  *(void *)(v10 + 72) = v6;
  *(void *)(v10 + 80) = v7;
  *(void *)(v10 + 88) = v8;
  *(void *)(v10 + 96) = v9;
  uint64_t v13 = sub_100009710();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000094EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009600();
  *a1 = v3;
  return result;
}

uint64_t sub_100009528()
{
  return sub_100009610();
}

uint64_t sub_100009560()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100009570()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009580()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000095A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000095B0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000095C0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000095E0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000095F0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009600()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009610()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009620()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100009630()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100009640()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100009650()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100009660()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100009670()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100009680()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100009690()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000096A0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000096B0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000096C0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000096D0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000096E0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000096F0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100009700()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100009710()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100009720()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100009730()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100009740()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100009750()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100009760()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009770()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009780()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100009790()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_1000097A0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_1000097B0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_1000097C0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009800()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009810()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009820()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009830()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009840()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100009850()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009860()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100009870()
{
  return static Locale.current.getter();
}

uint64_t sub_100009880()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100009890()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000098B0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000098C0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_1000098D0()
{
  return String.hash(into:)();
}

uint64_t sub_1000098E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_1000098F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100009900()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009910()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009920()
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