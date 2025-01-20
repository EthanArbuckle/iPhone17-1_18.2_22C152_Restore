uint64_t sub_100002BD8()
{
  return 1;
}

unint64_t sub_100002BE4()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

Swift::Int sub_100002C38()
{
  return sub_1000067E0();
}

uint64_t sub_100002C88()
{
  return sub_1000067B0();
}

Swift::Int sub_100002C9C()
{
  return sub_1000067E0();
}

uint64_t sub_100002CE8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  v3 = (void *)a1[1];
  v4._rawValue = &off_100008810;
  v7._object = v3;
  Swift::Int v5 = sub_1000067C0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100002D3C(void *a1@<X8>)
{
  *a1 = 0x746F6F7223;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_100002D54()
{
  return sub_1000043F4(&qword_10000C028, &qword_10000C030);
}

uint64_t sub_100002D90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100002DD8(void *a1@<X8>)
{
  *a1 = &off_100008848;
}

uint64_t sub_100002DE8()
{
  return 0x746F6F7223;
}

uint64_t sub_100002DFC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  swift_bridgeObjectRetain();
  v6._rawValue = &off_100008870;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  Swift::Int v7 = sub_1000067C0(v6, v9);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7 != 0;
  return result;
}

unint64_t sub_100002E64()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_100002EB8()
{
  sub_100005A38(&qword_10000C140);
  __chkstk_darwin();
  v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_100006730();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin();
  Swift::OpaquePointer v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006770();
  __chkstk_darwin();
  sub_1000067A0();
  __chkstk_darwin();
  uint64_t v5 = sub_100006740();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v7 = sub_100006710();
  sub_100005BB0(v7, qword_10000C1E0);
  sub_100005B78(v7, (uint64_t)qword_10000C1E0);
  sub_100006790();
  sub_100006760();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v9[0]);
  sub_100006750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_100006700();
}

uint64_t sub_10000319C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = a1;
  sub_100005A38(&qword_10000C168);
  __chkstk_darwin();
  v18 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005A38(&qword_10000C140);
  __chkstk_darwin();
  v16 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006730();
  uint64_t v15 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006770();
  __chkstk_darwin();
  sub_1000067A0();
  __chkstk_darwin();
  uint64_t v7 = sub_100006740();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  sub_100006790();
  sub_100006760();
  uint64_t v9 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v10(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_100006750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v16, 1, 1, v7);
  v11 = v18;
  sub_100006650();
  uint64_t v12 = sub_100006660();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  sub_100005A38(&qword_10000C170);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000069A0;
  sub_100006790();
  sub_100006760();
  v10(v6, v9, v15);
  sub_100006750();
  return sub_100006670();
}

uint64_t sub_1000035D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1A0 + dword_10000C1A0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000367C;
  return v4();
}

uint64_t sub_10000367C(uint64_t a1)
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

unint64_t sub_100003794()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

unint64_t sub_1000037EC()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100003844()
{
  unint64_t result = qword_10000C058[0];
  if (!qword_10000C058[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C058);
  }
  return result;
}

uint64_t sub_10000389C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C198 + dword_10000C198);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100003944;
  return v5(a1);
}

uint64_t sub_100003944(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003A44(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C188 + dword_10000C188);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005C2C;
  return v4();
}

unint64_t sub_100003AEC()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100003B44()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100003B9C()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    sub_100002D90(qword_10000C088);
    sub_100003B44();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100003C10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100002E64();
  *uint64_t v5 = v2;
  v5[1] = sub_100003CC4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100003CC4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003DB8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C178 + dword_10000C178);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100003E5C;
  return v4();
}

uint64_t sub_100003E5C(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1 & 1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100003F7C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100003FD0(uint64_t a1)
{
  unint64_t v2 = sub_100003844();

  return EntityURLRepresentation.init(stringLiteral:)(0xD00000000000002FLL, 0x8000000100007380, a1, v2);
}

unint64_t sub_100004030()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_100004088()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_1000040E0()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_100004138()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_10000418C()
{
  sub_100005B24();
  uint64_t v2 = sub_1000066A0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005C14(v3, v0, v2, v1);
}

unint64_t sub_100004224()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_10000427C()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_1000042D4()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_10000432C()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_100004380@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B14(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C1E0, a1);
}

uint64_t sub_1000043B8()
{
  return sub_1000043F4(&qword_10000C0F0, &qword_10000C0F8);
}

uint64_t sub_1000043F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002D90(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004438(uint64_t a1)
{
  unint64_t v2 = sub_100003844();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004488()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_1000044E0(uint64_t a1)
{
  unint64_t v2 = sub_1000042D4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004530()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_100004584()
{
  uint64_t v0 = sub_100006730();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006770();
  __chkstk_darwin();
  sub_1000067A0();
  __chkstk_darwin();
  uint64_t v4 = sub_100006740();
  sub_100005BB0(v4, qword_10000C1F8);
  sub_100005B78(v4, (uint64_t)qword_10000C1F8);
  sub_100006790();
  sub_100006760();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100006750();
}

uint64_t sub_100004770()
{
  return sub_100006540();
}

uint64_t sub_100004794()
{
  return sub_100006540();
}

uint64_t sub_1000047B8()
{
  return sub_100006550();
}

void (*sub_1000047DC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100006530();
  return sub_100004838;
}

void sub_100004838(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100004888()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_1000048DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005A7C();
  unint64_t v5 = sub_100005B24();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100004948()
{
  uint64_t v0 = qword_10000C010;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004988()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_1000049E0()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100004A38()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_100004A8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004ADC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B14(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C1F8, a1);
}

uint64_t sub_100004B14@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005B78(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004BB8()
{
  return 0;
}

uint64_t sub_100004BCC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005A7C();
  unint64_t v6 = sub_100005AD0();
  unint64_t v7 = sub_100005B24();
  *unint64_t v4 = v2;
  v4[1] = sub_100004C98;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100004C98()
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

uint64_t sub_100004DA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005550();
  *a1 = result;
  return result;
}

uint64_t sub_100004DC8(uint64_t a1)
{
  unint64_t v2 = sub_100004888();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SpotlightSettingsAppIntentsPackage()
{
  return &type metadata for SpotlightSettingsAppIntentsPackage;
}

ValueMetadata *type metadata accessor for OpenSpotlightSettingsDeepLinks()
{
  return &type metadata for OpenSpotlightSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for SpotlightSettingsDeepLinks()
{
  return &type metadata for SpotlightSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for SpotlightSettingsDeepLinks.SpotlightSettingsDeepLinksQuery()
{
  return &type metadata for SpotlightSettingsDeepLinks.SpotlightSettingsDeepLinksQuery;
}

uint64_t getEnumTagSinglePayload for SpotlightSettingsDynamicDestination(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SpotlightSettingsDynamicDestination(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100004F38);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SpotlightSettingsDynamicDestination()
{
  return &type metadata for SpotlightSettingsDynamicDestination;
}

char *sub_100004F70(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004FC0(a1, a2, a3, *v3, &qword_10000C190);
  char *v3 = result;
  return result;
}

char *sub_100004F98(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004FC0(a1, a2, a3, *v3, &qword_10000C180);
  char *v3 = result;
  return result;
}

char *sub_100004FC0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    sub_100005A38(a5);
    v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_release();
  return v11;
}

uint64_t sub_1000050A8()
{
  return _swift_task_switch(sub_1000050C4, 0, 0);
}

uint64_t sub_1000050C4()
{
  int64_t v1 = sub_1000051DC((uint64_t)&off_1000088A8)[2];
  if (v1)
  {
    sub_100004F70(0, v1, 0);
    unint64_t v2 = _swiftEmptyArrayStorage[2];
    do
    {
      unint64_t v3 = _swiftEmptyArrayStorage[3];
      unint64_t v4 = v2 + 1;
      if (v2 >= v3 >> 1) {
        sub_100004F70((char *)(v3 > 1), v2 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4;
      unint64_t v2 = v4;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(_swiftEmptyArrayStorage);
}

void *sub_1000051DC(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 16); i; --i)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_100004F98(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v3 = _swiftEmptyArrayStorage[2];
    unint64_t v2 = _swiftEmptyArrayStorage[3];
    unint64_t v4 = v3 + 1;
    if (v3 >= v2 >> 1) {
      sub_100004F98((char *)(v2 > 1), v3 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v4;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100005298(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000052B8, 0, 0);
}

uint64_t sub_1000052B8()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  unint64_t v2 = sub_1000051DC(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = v2[2];
  if (v3)
  {
    sub_100004F70(0, v3, 0);
    unint64_t v4 = _swiftEmptyArrayStorage[2];
    do
    {
      unint64_t v5 = _swiftEmptyArrayStorage[3];
      unint64_t v6 = v4 + 1;
      if (v4 >= v5 >> 1) {
        sub_100004F70((char *)(v5 > 1), v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6;
      unint64_t v4 = v6;
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(_swiftEmptyArrayStorage);
}

uint64_t sub_1000053DC()
{
  return _swift_task_switch(sub_1000053F8, 0, 0);
}

uint64_t sub_1000053F8()
{
  uint64_t v1 = sub_1000051DC((uint64_t)&off_1000088D0)[2];
  swift_bridgeObjectRelease();
  unint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v2(v1 == 0);
}

uint64_t sub_100005478()
{
  return _swift_task_switch(sub_100005494, 0, 0);
}

uint64_t sub_100005494()
{
  sub_100004F70(0, 1, 0);
  unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
  unint64_t v3 = v2 + 1;
  if (v2 >= v1 >> 1) {
    sub_100004F70((char *)(v1 > 1), v2 + 1, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100005550()
{
  uint64_t v0 = sub_1000066E0();
  uint64_t v26 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v25 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005A38(&qword_10000C138);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v24 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v23 = (char *)&v21 - v4;
  uint64_t v5 = sub_100005A38(&qword_10000C140);
  __chkstk_darwin(v5 - 8);
  v22 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006730();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  int64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006770();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_1000067A0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_100006740();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v21 = sub_100005A38(&qword_10000C148);
  sub_100006790();
  sub_100006760();
  uint64_t v15 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v16(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_100006750();
  sub_100006790();
  sub_100006760();
  v16(v10, v15, v7);
  uint64_t v17 = v22;
  sub_100006750();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
  char v28 = 1;
  uint64_t v18 = sub_100006520();
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v23, 1, 1, v18);
  v19(v24, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v25, enum case for InputConnectionBehavior.default(_:), v27);
  sub_100003844();
  return sub_100006560();
}

uint64_t sub_100005A38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005A7C()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_100005AD0()
{
  unint64_t result = qword_10000C158;
  if (!qword_10000C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

unint64_t sub_100005B24()
{
  unint64_t result = qword_10000C160;
  if (!qword_10000C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

uint64_t sub_100005B78(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005BB0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005C14(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005C30(uint64_t a1)
{
  unint64_t v2 = sub_100005D80();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005CD8()
{
  unint64_t result = qword_10000C1A8;
  if (!qword_10000C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A8);
  }
  return result;
}

uint64_t sub_100005D30()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005D80()
{
  unint64_t result = qword_10000C1B0;
  if (!qword_10000C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpotlightSettingsIntentsExtensionExtension()
{
  return &type metadata for SpotlightSettingsIntentsExtensionExtension;
}

uint64_t sub_100005DE4()
{
  uint64_t v0 = sub_100005A38(&qword_10000C1D0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004888();
  sub_100006600();
  uint64_t v13 = sub_100006590();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100006600();
  uint64_t v5 = sub_100006590();
  v4(v3, v0);
  sub_100006600();
  uint64_t v6 = sub_100006590();
  v4(v3, v0);
  sub_100006600();
  uint64_t v7 = sub_100006590();
  v4(v3, v0);
  sub_100006600();
  uint64_t v8 = sub_100006590();
  v4(v3, v0);
  sub_100005A38(&qword_10000C1D8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1000071C0;
  *(void *)(v9 + 32) = v13;
  *(void *)(v9 + 40) = v5;
  *(void *)(v9 + 48) = v6;
  *(void *)(v9 + 56) = v7;
  *(void *)(v9 + 64) = v8;
  uint64_t v10 = sub_100006580();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100006098()
{
  uint64_t v0 = sub_1000065F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100003B44();
  sub_100006570();
  swift_release();
  sub_100004888();
  sub_1000065E0();
  uint64_t v4 = sub_1000065D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005A38(&qword_10000C1C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000069A0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000065C0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100006200()
{
  uint64_t v0 = sub_1000065B0();
  uint64_t v1 = sub_1000065B0();
  sub_100005A38(&qword_10000C1C8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000071D0;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_1000065A0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1000062AC()
{
  uint64_t v0 = sub_100006630();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100005550();
  sub_100004888();
  sub_100006640();
  uint64_t v4 = sub_100006620();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100005A38(&qword_10000C1B8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000069A0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100006610();
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_10000640C()
{
  return &_swiftEmptyArrayStorage;
}

ValueMetadata *type metadata accessor for StorageSettingsAssistantIntents()
{
  return &type metadata for StorageSettingsAssistantIntents;
}

uint64_t sub_100006428()
{
  return sub_100006540();
}

uint64_t sub_10000644C()
{
  return sub_100006550();
}

uint64_t sub_100006470()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100006480()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100006490()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000064B0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000064C0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000064D0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000064F0()
{
  return static AppIntentsPackage.includedPackages.getter();
}

uint64_t sub_100006520()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006530()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100006540()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006550()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100006560()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006570()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100006580()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100006590()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_1000065A0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000065B0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000065C0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000065D0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000065E0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000065F0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100006600()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100006610()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100006620()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100006630()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100006640()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100006650()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100006660()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100006670()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_100006680()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100006690()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000066A0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000066E0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000066F0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006700()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100006710()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006730()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100006740()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006750()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100006760()
{
  return static Locale.current.getter();
}

uint64_t sub_100006770()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100006780()
{
  return static AppExtension.main()();
}

uint64_t sub_100006790()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000067A0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_1000067B0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000067C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000067D0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000067E0()
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