uint64_t sub_100004830()
{
  sub_10000496C();
  return sub_100006D10();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000048D0()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100004928()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000496C()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

ValueMetadata *type metadata accessor for SensitiveContentAnalysisConfigurationExtensionExtension()
{
  return &type metadata for SensitiveContentAnalysisConfigurationExtensionExtension;
}

unint64_t sub_1000049D4()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100004A2C()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100004A80()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100004AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005644(a1, a2, a3, (void (*)(void))sub_100004AD4);
}

unint64_t sub_100004AD4()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100004B28()
{
  uint64_t v0 = sub_100006DD0();
  sub_1000067E4(v0, qword_10000CF90);
  sub_1000067AC(v0, (uint64_t)qword_10000CF90);
  return sub_100006DC0();
}

uint64_t sub_100004B8C(uint64_t a1)
{
  v1[2] = a1;
  v1[3] = type metadata accessor for SensitiveContentAnalysisConfigurationEntity();
  v1[4] = swift_task_alloc();
  return _swift_task_switch(sub_100004C20, 0, 0);
}

uint64_t sub_100004C20()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  id v3 = [objc_allocWithZone((Class)SCSensitivityAnalyzer) init];
  id v4 = [v3 analysisPolicy];

  sub_100006D50();
  uint64_t v5 = *(int *)(v2 + 20);
  sub_10000688C(&qword_10000C1E8);
  sub_100006DD0();
  swift_task_alloc();
  sub_100006DC0();
  sub_10000568C();
  uint64_t v6 = sub_100006D40();
  swift_task_dealloc();
  *(void *)(v1 + v5) = v6;
  if (v4 == (id)2) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (v4 == (id)1) {
    char v7 = 0;
  }
  *(unsigned char *)(v0 + 40) = v7;
  sub_100006D30();
  sub_100006848(&qword_10000C110);
  sub_100006D20();
  sub_100006C24(v1);
  swift_task_dealloc();
  v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100004DD4@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DC0(&qword_10000C010, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CF90, a1);
}

uint64_t sub_100004E00()
{
  return sub_100006CC0() & 1;
}

uint64_t sub_100004E1C()
{
  return sub_100006CF0();
}

uint64_t sub_100004E34()
{
  return 0;
}

uint64_t sub_100004E3C()
{
  return sub_100006CE0();
}

uint64_t sub_100004E54()
{
  return sub_100006CD0();
}

uint64_t sub_100004E6C(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_100004F04;
  return sub_100004B8C(a1);
}

uint64_t sub_100004F04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004FF8()
{
  return sub_100006D00();
}

uint64_t sub_100005028(uint64_t a1)
{
  return sub_10000504C(a1, qword_10000CFA8);
}

uint64_t sub_10000504C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006DA0();
  sub_1000067E4(v3, a2);
  sub_1000067AC(v3, (uint64_t)a2);
  return sub_100006D90();
}

uint64_t sub_1000050AC(uint64_t a1)
{
  return sub_10000504C(a1, qword_10000CFC0);
}

uint64_t sub_1000050D0()
{
  sub_10000688C(&qword_10000C1F0);
  uint64_t v0 = *(void *)(sub_10000688C(&qword_10000C1F8) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100007110;
  uint64_t v4 = (unsigned char *)(v3 + v2);
  *uint64_t v4 = 0;
  sub_100006D50();
  v4[v1] = 1;
  sub_100006D50();
  unint64_t v5 = sub_1000069FC(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_10000CFD8 = v5;
  return result;
}

BOOL sub_100005218(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_100005234()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

Swift::Int sub_100005288()
{
  Swift::UInt v1 = *v0;
  sub_100006E10();
  sub_100006E20(v1);
  return sub_100006E30();
}

void sub_1000052D0()
{
  sub_100006E20(*v0);
}

Swift::Int sub_1000052FC()
{
  Swift::UInt v1 = *v0;
  sub_100006E10();
  sub_100006E20(v1);
  return sub_100006E30();
}

void *sub_100005340@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_100005360(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_100005370()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_1000053C8()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100005420()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

void *sub_100005474()
{
  return &protocol witness table for UInt;
}

unint64_t sub_100005484()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_1000054DC()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_100005534()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_10000558C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_1000055E0()
{
  return sub_100006D80();
}

uint64_t sub_1000055F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DC0(&qword_10000C020, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CFC0, a1);
}

uint64_t sub_100005624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005644(a1, a2, a3, (void (*)(void))sub_10000568C);
}

uint64_t sub_100005644(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000568C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_1000056E0()
{
  return sub_100006CA0();
}

unint64_t sub_100005724()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_10000577C()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_1000057D4()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_100005828()
{
  if (qword_10000C028 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10000CFD8;

  return _swift_bridgeObjectRetain(v0);
}

uint64_t sub_100005884()
{
  return sub_100006D70();
}

unint64_t sub_1000058C8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    sub_100005924(&qword_10000C0C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_100005924(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000596C(void *a1@<X8>)
{
  *a1 = &off_100008620;
}

uint64_t sub_10000597C()
{
  return sub_100006848(&qword_10000C0D0);
}

uint64_t type metadata accessor for SensitiveContentAnalysisConfigurationEntity()
{
  uint64_t result = qword_10000C198;
  if (!qword_10000C198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000059FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100006D50();
  uint64_t v4 = *(int *)(a1 + 20);
  sub_10000688C(&qword_10000C1E8);
  sub_100006DD0();
  __chkstk_darwin();
  sub_100006DC0();
  sub_10000568C();
  uint64_t result = sub_100006D40();
  *(void *)(a2 + v4) = result;
  return result;
}

uint64_t sub_100005AE4()
{
  return sub_100006848(&qword_10000C0D8);
}

uint64_t sub_100005B18()
{
  return sub_100006848(&qword_10000C0E0);
}

uint64_t sub_100005B4C()
{
  return sub_100006848(&qword_10000C0E8);
}

uint64_t sub_100005B80()
{
  return sub_100006768(&qword_10000C0F0, &qword_10000C0F8);
}

void *sub_100005BB0()
{
  return &protocol witness table for UUID;
}

uint64_t sub_100005BBC()
{
  return sub_100006C80();
}

uint64_t sub_100005C18()
{
  return sub_100006848(&qword_10000C100);
}

uint64_t sub_100005C4C()
{
  return sub_100006848(&qword_10000C108);
}

uint64_t sub_100005C80()
{
  return sub_100006848(&qword_10000C110);
}

uint64_t sub_100005CB4()
{
  return sub_100006848(&qword_10000C118);
}

unint64_t sub_100005CEC()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    sub_100006DE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100005D38()
{
  return sub_100006C90();
}

uint64_t sub_100005D94@<X0>(uint64_t a1@<X8>)
{
  return sub_100005DC0(&qword_10000C018, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CFA8, a1);
}

uint64_t sub_100005DC0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_1000067AC(v7, a3);
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100005E64()
{
  return sub_100006768(&qword_10000C128, &qword_10000C130);
}

uint64_t sub_100005E94()
{
  return sub_100006CB0();
}

uint64_t sub_100005EF0()
{
  return sub_100006848(&qword_10000C138);
}

uint64_t sub_100005F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006D60();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100005F8C()
{
  return sub_100006DB0();
}

unsigned char *initializeBufferWithCopyOfBuffer for SensitiveContentAnalysisConfigurationEntity.SensitiveContentPolicy(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SensitiveContentAnalysisConfigurationEntity.SensitiveContentPolicy(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SensitiveContentAnalysisConfigurationEntity.SensitiveContentPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x100006154);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000617C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006184(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SensitiveContentAnalysisConfigurationEntity.SensitiveContentPolicy()
{
  return &type metadata for SensitiveContentAnalysisConfigurationEntity.SensitiveContentPolicy;
}

uint64_t *sub_1000061A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100006D60();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_10000626C(uint64_t a1)
{
  uint64_t v2 = sub_100006D60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_1000062E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_100006360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000063EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100006468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_1000064EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006500);
}

uint64_t sub_100006500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006D60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000065C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000065D4);
}

uint64_t sub_1000065D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100006D60();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100006690()
{
  uint64_t result = sub_100006D60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SensitiveContentAnalysisConfigurationExtension()
{
  return &type metadata for SensitiveContentAnalysisConfigurationExtension;
}

uint64_t sub_100006738()
{
  return sub_100006768(&qword_10000C1D0, &qword_10000C1D8);
}

uint64_t sub_100006768(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005924(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000067AC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000067E4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006848(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SensitiveContentAnalysisConfigurationEntity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000688C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000068D0(char a1)
{
  char v2 = a1 & 1;
  sub_100006E10();
  sub_100006E20(a1 & 1);
  Swift::Int v3 = sub_100006E30();

  return sub_100006940(v2, v3);
}

unint64_t sub_100006940(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000069FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000688C(&qword_10000C200);
    Swift::Int v3 = (void *)sub_100006E00();
  }
  else
  {
    Swift::Int v3 = &_swiftEmptyDictionarySingleton;
  }
  sub_10000688C(&qword_10000C1F8);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v2) {
    return (unint64_t)v3;
  }
  uint64_t v8 = &v7[*(int *)(v4 + 48)];
  uint64_t v9 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v10 = *(void *)(v5 + 72);
  while (1)
  {
    sub_100006BBC(v9, (uint64_t)v7);
    char v11 = *v7;
    unint64_t result = sub_1000068D0(*v7);
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v11;
    uint64_t v15 = v3[7];
    uint64_t v16 = sub_100006D60();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
    uint64_t v17 = v3[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v3[2] = v19;
    v9 += v10;
    if (!--v2) {
      return (unint64_t)v3;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100006BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000688C(&qword_10000C1F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006C24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SensitiveContentAnalysisConfigurationEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006C80()
{
  return static TransientAppEntity.defaultQuery.getter();
}

uint64_t sub_100006C90()
{
  return TransientAppEntity.id.getter();
}

uint64_t sub_100006CA0()
{
  return static AppEnum.defaultResolverSpecification.getter();
}

uint64_t sub_100006CB0()
{
  return static AppEntity.defaultResolverSpecification.getter();
}

uint64_t sub_100006CC0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006CD0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100006CE0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006CF0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006D00()
{
  return static AppIntent.persistentIdentifier.getter();
}

uint64_t sub_100006D10()
{
  return AppIntentsExtension.configuration.getter();
}

uint64_t sub_100006D20()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_100006D30()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_100006D40()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100006D50()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006D60()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100006D70()
{
  return CaseDisplayRepresentable.localizedStringResource.getter();
}

uint64_t sub_100006D80()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006D90()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100006DB0()
{
  return InstanceDisplayRepresentable.localizedStringResource.getter();
}

uint64_t sub_100006DC0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006DE0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100006DF0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006E00()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006E10()
{
  return Hasher.init(_seed:)();
}

void sub_100006E20(Swift::UInt a1)
{
}

Swift::Int sub_100006E30()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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