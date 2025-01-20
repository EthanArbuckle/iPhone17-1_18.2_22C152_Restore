uint64_t static TokenHandoff.handoffUTToken(tokenData:advertisedItemID:hasSKANAdData:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  unsigned char *v8;
  uint64_t v10;

  v0 = sub_243039520();
  v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_243023F5C();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_243039500();
  v6 = sub_2430396C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_243006000, v5, v6, "This SPI is no longer available", v7, 2u);
    MEMORY[0x245672970](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_243008464();
  swift_allocError();
  *v8 = 0;
  return swift_willThrow();
}

unint64_t sub_243008464()
{
  unint64_t result = qword_268D6FFA0;
  if (!qword_268D6FFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFA0);
  }
  return result;
}

uint64_t static TokenHandoff.handoffUTToken(tokenData:advertisedItemID:skanEnvironment:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  int v8 = *a4;
  if (v8 == 2) {
    char v9 = 2;
  }
  else {
    char v9 = v8 & 1;
  }
  v10 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v10;
  void *v10 = v4;
  v10[1] = sub_24300857C;
  return sub_243029F20(a3, a1, a2, v9);
}

uint64_t sub_24300857C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t static TokenHandoff.handoffUTMetrics(eventsData:advertisedItemID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2430095CC;
  return sub_24302A1EC(a3, a1, a2, 2);
}

uint64_t static TokenHandoff.handoffPODToken(tokenData:advertisedItemID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24302A3D4(a3, a1, a2, 2);
}

BOOL static TokenHandoff.SKAdNetworkEnvironment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.hash(into:)()
{
  return sub_243039A50();
}

uint64_t sub_243008794(char a1)
{
  if (a1) {
    return 0x69746375646F7270;
  }
  else {
    return 0x6D706F6C65766564;
  }
}

BOOL sub_2430087D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2430087F4()
{
  return sub_243039A50();
}

uint64_t sub_243008824()
{
  return sub_243008794(*v0);
}

uint64_t sub_24300882C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2430094BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_243008854()
{
  return 0;
}

void sub_243008860(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24300886C(uint64_t a1)
{
  unint64_t v2 = sub_243008E44();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430088A8(uint64_t a1)
{
  unint64_t v2 = sub_243008E44();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430088E4()
{
  return 0;
}

void sub_2430088F0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2430088FC(uint64_t a1)
{
  unint64_t v2 = sub_243008EEC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243008938(uint64_t a1)
{
  unint64_t v2 = sub_243008EEC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243008974@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2430089A4(uint64_t a1)
{
  unint64_t v2 = sub_243008E98();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430089E0(uint64_t a1)
{
  unint64_t v2 = sub_243008E98();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D6FFB8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D6FFC0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D6FFC8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243008E44();
  sub_243039A90();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_243008E98();
    v14 = v18;
    sub_2430398F0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_243008EEC();
    sub_2430398F0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

uint64_t TokenHandoff.SKAdNetworkEnvironment.hashValue.getter()
{
  return sub_243039A60();
}

uint64_t sub_243008D08()
{
  return sub_243039A60();
}

uint64_t sub_243008D50()
{
  return sub_243039A60();
}

uint64_t sub_243008D94(void *a1)
{
  return TokenHandoff.SKAdNetworkEnvironment.encode(to:)(a1);
}

uint64_t sub_243008DAC(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  *unint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_243008E44()
{
  unint64_t result = qword_268D6FFD0;
  if (!qword_268D6FFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFD0);
  }
  return result;
}

unint64_t sub_243008E98()
{
  unint64_t result = qword_268D6FFD8;
  if (!qword_268D6FFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFD8);
  }
  return result;
}

unint64_t sub_243008EEC()
{
  unint64_t result = qword_268D6FFE0;
  if (!qword_268D6FFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFE0);
  }
  return result;
}

unint64_t sub_243008F44()
{
  unint64_t result = qword_268D6FFE8;
  if (!qword_268D6FFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff()
{
  return &type metadata for TokenHandoff;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment;
}

__n128 __swift_memcpy20_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_243008FE8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_243009008(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 20) = v3;
  return result;
}

void type metadata accessor for Decimal()
{
  if (!qword_268D6FFF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268D6FFF0);
    }
  }
}

uint64_t getEnumTagSinglePayload for PostbackUpdate.ConversionType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16AdAttributionKit12TokenHandoffO22SKAdNetworkEnvironmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x2430091E8);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_243009210(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_243009218(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.CodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.CodingKeys;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.DevelopmentCodingKeys;
}

ValueMetadata *type metadata accessor for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys()
{
  return &type metadata for TokenHandoff.SKAdNetworkEnvironment.ProductionCodingKeys;
}

unint64_t sub_243009258()
{
  unint64_t result = qword_268D6FFF8;
  if (!qword_268D6FFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D6FFF8);
  }
  return result;
}

unint64_t sub_2430092B0()
{
  unint64_t result = qword_268D70000;
  if (!qword_268D70000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70000);
  }
  return result;
}

unint64_t sub_243009308()
{
  unint64_t result = qword_268D70008;
  if (!qword_268D70008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70008);
  }
  return result;
}

unint64_t sub_243009360()
{
  unint64_t result = qword_268D70010;
  if (!qword_268D70010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70010);
  }
  return result;
}

unint64_t sub_2430093B8()
{
  unint64_t result = qword_268D70018;
  if (!qword_268D70018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70018);
  }
  return result;
}

unint64_t sub_243009410()
{
  unint64_t result = qword_268D70020;
  if (!qword_268D70020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70020);
  }
  return result;
}

unint64_t sub_243009468()
{
  unint64_t result = qword_268D70028;
  if (!qword_268D70028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70028);
  }
  return result;
}

uint64_t sub_2430094BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D706F6C65766564 && a2 == 0xEB00000000746E65;
  if (v3 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746375646F7270 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t static AppImpression.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 60);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  BOOL v7 = (void *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1]) {
    return 1;
  }

  return sub_2430399C0();
}

uint64_t AppImpression.hash(into:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  swift_bridgeObjectRetain();
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t AppImpression.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  uint64_t v4 = sub_2430394E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t AppImpression.publisherItemID.getter()
{
  uint64_t v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  return *(void *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 20));
}

uint64_t AppImpression.advertisedItemID.getter()
{
  uint64_t v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  return *(void *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
}

uint64_t AppImpression.sourceID.getter()
{
  uint64_t v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  return *(void *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 28));
}

uint64_t AppImpression.keyID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppImpression.adNetworkID.getter()
{
  uint64_t v1 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 40) + v1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t AppImpression.timestamp.getter()
{
  uint64_t v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  v2.n128_f64[0] = (double)*(unint64_t *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 32))
                 / 1000.0;

  return MEMORY[0x270EF0AF0](v2);
}

uint64_t AppImpression.eligibleForReengagement.getter()
{
  uint64_t v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  return *(unsigned char *)(v1 + *(int *)(type metadata accessor for AppImpressionPayload() + 44)) & 1;
}

uint64_t AppImpression.compactJWSRepresentation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppImpression.init(compactJWS:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = sub_243039520();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  v3[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243009A5C, 0, 0);
}

uint64_t sub_243009A5C()
{
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[4];
  unint64_t v2 = v0[5];
  unint64_t v4 = type metadata accessor for AppImpressionPayload();
  unint64_t v5 = sub_24300A1D8();
  uint64_t v6 = sub_24300C4C4(&qword_268D70048, (void (*)(uint64_t))type metadata accessor for AppImpressionPayload);
  swift_bridgeObjectRetain();
  sub_24302BF70(v3, v2, v4, v5, v6, v1);
  v0[11] = 0;
  uint64_t v7 = v0[9];
  uint64_t v8 = v0[3];
  sub_24300C324(v0[10], v8);
  uint64_t v9 = v8 + *(int *)(v7 + 52);
  uint64_t v10 = *(void *)(v9 + *(int *)(v4 + 24));
  v11 = (uint64_t *)(v9 + *(int *)(v4 + 40));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  v0[12] = v13;
  swift_bridgeObjectRetain();
  v14 = (void *)swift_task_alloc();
  v0[13] = v14;
  void *v14 = v0;
  v14[1] = sub_243009DFC;
  uint64_t v15 = v0[4];
  uint64_t v16 = v0[5];
  return sub_243017108(v10, v15, v16, v12, v13);
}

uint64_t sub_243009DFC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](sub_243009F94, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243009F94()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = sub_243023D24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x245672840](v1);
  MEMORY[0x245672840](v1);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    MEMORY[0x245672840](v1);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_2430396F0();
    *uint64_t v9 = v10;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered an error while initializing impression: %@.", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v9, -1, -1);
    MEMORY[0x245672970](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = v0[11];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v1, v12);
  swift_willThrow();

  if (!v11) {
    sub_24300C38C(v0[3], &qword_268D70030);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

unint64_t sub_24300A1D8()
{
  unint64_t result = qword_268D70040;
  if (!qword_268D70040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70040);
  }
  return result;
}

void AppImpression.init(compactJWS:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = type metadata accessor for AppImpressionPayload();
  unint64_t v11 = sub_24300A1D8();
  uint64_t v12 = sub_24300C4C4(&qword_268D70048, (void (*)(uint64_t))type metadata accessor for AppImpressionPayload);
  sub_24302BF70(a1, a2, v10, v11, v12, (uint64_t)v9);
  if (v3)
  {
    sub_243008464();
    swift_allocError();
    sub_24301119C((uint64_t)v3, v13);
    swift_willThrow();
  }
  else
  {
    sub_24300C324((uint64_t)v9, a3);
  }
}

uint64_t AppImpression.hashValue.getter()
{
  return sub_243039A60();
}

uint64_t sub_24300A3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 60);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = (void *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1]) {
    return 1;
  }

  return sub_2430399C0();
}

uint64_t sub_24300A46C()
{
  return sub_243039A60();
}

uint64_t sub_24300A4DC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  swift_bridgeObjectRetain();
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24300A548()
{
  return sub_243039A60();
}

uint64_t sub_24300A5B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  uint64_t v4 = sub_2430394E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t AppImpression.beginView()()
{
  v1[3] = v0;
  uint64_t v2 = sub_243039520();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300A6F0, 0, 0);
}

uint64_t sub_24300A6F0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v3 = v1 + *(int *)(v2 + 52);
  uint64_t v4 = *(void *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  uint64_t v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v0[7] = v7;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24300A7DC;
  return sub_2430174D0(v4, v6, v7);
}

uint64_t sub_24300A7DC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24300A924, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24300A924()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_243023D24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  MEMORY[0x245672840](v1);
  MEMORY[0x245672840](v1);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[9];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    MEMORY[0x245672840](v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered error while starting view for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[9];
  }
  uint64_t v13 = (void *)v0[9];
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t AppImpression.endView()()
{
  v1[3] = v0;
  uint64_t v2 = sub_243039520();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300AC20, 0, 0);
}

uint64_t sub_24300AC20()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v3 = v1 + *(int *)(v2 + 52);
  uint64_t v4 = *(void *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  uint64_t v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v0[7] = v7;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24300AD0C;
  return sub_243017784(v4, v6, v7);
}

uint64_t sub_24300AD0C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24300AE54, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24300AE54()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_243023D24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  MEMORY[0x245672840](v1);
  MEMORY[0x245672840](v1);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[9];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    MEMORY[0x245672840](v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered error while ending view for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[9];
  }
  uint64_t v13 = (void *)v0[9];
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t AppImpression.handleTap()()
{
  *(void *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70070);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300B124, 0, 0);
}

uint64_t sub_24300B124()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_243039460();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24300B1FC;
  uint64_t v4 = *(void *)(v0 + 24);
  return sub_24300B3CC(v4);
}

uint64_t sub_24300B1FC()
{
  uint64_t v2 = *(void *)(*v1 + 24);
  uint64_t v3 = *v1;
  *(void *)(v3 + 40) = v0;
  swift_task_dealloc();
  sub_24300C38C(v2, &qword_268D70070);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24300B368, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24300B368()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24300B3CC(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_243039520();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_243039460();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300B4E8, 0, 0);
}

uint64_t sub_24300B4E8()
{
  sub_243039660();
  *(void *)(v0 + 88) = sub_243039650();
  uint64_t v2 = sub_243039620();
  return MEMORY[0x270FA2498](sub_24300B57C, v2, v1);
}

uint64_t sub_24300B57C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  swift_release();
  sub_243039440();
  id v4 = objc_allocWithZone(MEMORY[0x263F82728]);
  uint64_t v5 = (void *)sub_243039450();
  uint64_t v6 = (void *)sub_243039530();
  os_log_type_t v7 = (void *)sub_243039530();
  id v8 = objc_msgSend(v4, sel_initWithSourceIdentifier_destinationURL_sourceDescription_purchaser_, 0, v5, v6, v7);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  id v9 = objc_msgSend(v8, sel_toUISClickAttribution);
  id v10 = objc_msgSend(v9, sel_eventMessage);
  v0[12] = v10;
  if (v10)
  {

    uint64_t v11 = sub_24300B724;
  }
  else
  {
    sub_243008464();
    v0[16] = swift_allocError();
    *uint64_t v12 = 1;
    swift_willThrow();

    uint64_t v11 = sub_24300B934;
  }
  return MEMORY[0x270FA2498](v11, 0, 0);
}

uint64_t sub_24300B724()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v3 = v1 + *(int *)(v2 + 52);
  uint64_t v4 = *(void *)(v3 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
  uint64_t v5 = (uint64_t *)(v1 + *(int *)(v2 + 60));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v0[13] = v7;
  swift_bridgeObjectRetain();
  id v8 = (void *)swift_task_alloc();
  v0[14] = v8;
  *id v8 = v0;
  v8[1] = sub_24300B818;
  uint64_t v9 = v0[12];
  uint64_t v10 = v0[3];
  return sub_243017BF4(v4, v6, v7, v9, v10);
}

uint64_t sub_24300B818()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24300BBE4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24300BB68;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24300B934()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v3 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = sub_243023D24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  MEMORY[0x245672840](v1);
  MEMORY[0x245672840](v1);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    MEMORY[0x245672840](v1);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_2430396F0();
    *uint64_t v9 = v10;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered an error while processing tap for impression: %@.", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v9, -1, -1);
    MEMORY[0x245672970](v8, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v1, v11);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_24300BB68()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24300BBE4()
{
  uint64_t v1 = (void *)v0[12];
  swift_bridgeObjectRelease();

  uint64_t v2 = (void *)v0[15];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v6 = sub_243023D24();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  MEMORY[0x245672840](v2);
  MEMORY[0x245672840](v2);
  os_log_type_t v7 = sub_243039500();
  os_log_type_t v8 = sub_2430396C0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    MEMORY[0x245672840](v2);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v7, v8, "Encountered an error while processing tap for impression: %@.", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v2, v12);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t AppImpression.handleTap(reengagementURL:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70070);
  v2[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300BEB8, 0, 0);
}

uint64_t sub_24300BEB8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = sub_243039460();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v1, 0, 1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24300BFE8;
  uint64_t v6 = v0[4];
  return sub_24300B3CC(v6);
}

uint64_t sub_24300BFE8()
{
  uint64_t v2 = *(void *)(*v1 + 32);
  uint64_t v3 = *v1;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  sub_24300C38C(v2, &qword_268D70070);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24300C154, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24300C154()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static AppImpression.isSupported.getter()
{
  return 1;
}

uint64_t sub_24300C1C0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24300C1FC(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24300C234(uint64_t (*a1)(void))
{
  return a1();
}

unsigned char **sub_24300C25C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

void sub_24300C26C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2430396F0();
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

uint64_t sub_24300C324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24300C38C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24300C3E8()
{
  return sub_24300C4C4(&qword_268D70088, (void (*)(uint64_t))type metadata accessor for AppImpression);
}

uint64_t type metadata accessor for AppImpression()
{
  uint64_t result = qword_268D70098;
  if (!qword_268D70098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24300C47C()
{
  return sub_24300C4C4(&qword_268D70090, MEMORY[0x263F07508]);
}

uint64_t sub_24300C4C4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppImpression(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(v4 + 52);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2430394E0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = (int *)type metadata accessor for AppImpressionPayload();
    *(void *)&v10[v14[5]] = *(void *)&v11[v14[5]];
    *(void *)&v10[v14[6]] = *(void *)&v11[v14[6]];
    *(void *)&v10[v14[7]] = *(void *)&v11[v14[7]];
    *(void *)&v10[v14[8]] = *(void *)&v11[v14[8]];
    uint64_t v15 = v14[10];
    uint64_t v16 = &v10[v15];
    uint64_t v17 = &v11[v15];
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)uint64_t v16 = v19;
    *((void *)v16 + 1) = v18;
    v10[v14[11]] = v11[v14[11]];
    uint64_t v20 = *(int *)(v6 + 56);
    char v21 = (uint64_t *)((char *)a1 + v20);
    char v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *char v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = *(int *)(v6 + 60);
    v25 = (uint64_t *)((char *)a1 + v24);
    v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    void *v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AppImpression(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030) + 52);
  uint64_t v3 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  type metadata accessor for AppImpressionPayload();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppImpression(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v7 = v6[13];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2430394E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = (int *)type metadata accessor for AppImpressionPayload();
  *(void *)&v8[v11[5]] = *(void *)&v9[v11[5]];
  *(void *)&v8[v11[6]] = *(void *)&v9[v11[6]];
  *(void *)&v8[v11[7]] = *(void *)&v9[v11[7]];
  *(void *)&v8[v11[8]] = *(void *)&v9[v11[8]];
  uint64_t v12 = v11[10];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  v8[v11[11]] = v9[v11[11]];
  uint64_t v17 = v6[14];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = v6[15];
  char v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = v23[1];
  *char v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppImpression(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v5 = v4[13];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2430394E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  uint64_t v9 = (int *)type metadata accessor for AppImpressionPayload();
  *(void *)&v6[v9[5]] = *(void *)&v7[v9[5]];
  *(void *)&v6[v9[6]] = *(void *)&v7[v9[6]];
  *(void *)&v6[v9[7]] = *(void *)&v7[v9[7]];
  *(void *)&v6[v9[8]] = *(void *)&v7[v9[8]];
  uint64_t v10 = v9[10];
  uint64_t v11 = &v6[v10];
  uint64_t v12 = &v7[v10];
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6[v9[11]] = v7[v9[11]];
  uint64_t v13 = v4[14];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = v4[15];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AppImpression(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v6 = v5[13];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2430394E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for AppImpressionPayload();
  *(void *)&v7[v10[5]] = *(void *)&v8[v10[5]];
  *(void *)&v7[v10[6]] = *(void *)&v8[v10[6]];
  *(void *)&v7[v10[7]] = *(void *)&v8[v10[7]];
  *(void *)&v7[v10[8]] = *(void *)&v8[v10[8]];
  *(_OWORD *)&v7[v10[10]] = *(_OWORD *)&v8[v10[10]];
  v7[v10[11]] = v8[v10[11]];
  *(_OWORD *)((char *)a1 + v5[14]) = *(_OWORD *)((char *)a2 + v5[14]);
  *(_OWORD *)((char *)a1 + v5[15]) = *(_OWORD *)((char *)a2 + v5[15]);
  return a1;
}

void *assignWithTake for AppImpression(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v7 = v6[13];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2430394E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = (int *)type metadata accessor for AppImpressionPayload();
  *(void *)&v8[v11[5]] = *(void *)&v9[v11[5]];
  *(void *)&v8[v11[6]] = *(void *)&v9[v11[6]];
  *(void *)&v8[v11[7]] = *(void *)&v9[v11[7]];
  *(void *)&v8[v11[8]] = *(void *)&v9[v11[8]];
  uint64_t v12 = v11[10];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  v8[v11[11]] = v9[v11[11]];
  uint64_t v17 = v6[14];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = v6[15];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppImpression(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24300CCCC);
}

uint64_t sub_24300CCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppImpression(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24300CD50);
}

uint64_t sub_24300CD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70030);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_24300CDC4()
{
  sub_24300CE50();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24300CE50()
{
  if (!qword_268D700A8)
  {
    type metadata accessor for AppImpressionPayload();
    sub_24300A1D8();
    sub_24300C4C4(&qword_268D70048, (void (*)(uint64_t))type metadata accessor for AppImpressionPayload);
    unint64_t v0 = type metadata accessor for JWS();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D700A8);
    }
  }
}

uint64_t static PostbackUpdateHelper.updateConversionValue(_:coarseCV:clientBundleID:)(uint64_t a1, char *a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4)
{
  char v7 = *a2;
  swift_bridgeObjectRetain();
  sub_243028DD4(a1, v7, a3, a4);
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for PostbackUpdateHelper()
{
  return &type metadata for PostbackUpdateHelper;
}

AdAttributionKit::CoarseConversionValue_optional __swiftcall CoarseConversionValue.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2430397D0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CoarseConversionValue.rawValue.getter()
{
  return *(void *)&aHigh_2[8 * *v0];
}

uint64_t sub_24300CFF8(char *a1, char *a2)
{
  return sub_24301129C(*a1, *a2);
}

uint64_t sub_24300D004()
{
  return sub_243011468();
}

uint64_t sub_24300D00C()
{
  return sub_2430115D8();
}

uint64_t sub_24300D014()
{
  return sub_2430117FC();
}

AdAttributionKit::CoarseConversionValue_optional sub_24300D01C(Swift::String *a1)
{
  return CoarseConversionValue.init(rawValue:)(*a1);
}

uint64_t sub_24300D028@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CoarseConversionValue.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24300D050()
{
  return sub_2430395F0();
}

uint64_t sub_24300D0B0()
{
  return sub_2430395E0();
}

uint64_t static Postback.reengagementOpenURLParameter.getter()
{
  uint64_t v0 = *(void *)sub_24302B33C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static Postback.updateConversionValue(_:lockPostback:)(uint64_t a1, char a2)
{
  uint64_t v5 = sub_243039520();
  v2[3] = v5;
  v2[4] = *(void *)(v5 - 8);
  v2[5] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v2[6] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24300D240;
  if (a2) {
    __int16 v7 = 259;
  }
  else {
    __int16 v7 = 3;
  }
  return sub_2430313E4(a1, v7, 0);
}

uint64_t sub_24300D240()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24300D37C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24300D37C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = sub_243023FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x245672840](v2);
  MEMORY[0x245672840](v2);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[7];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    MEMORY[0x245672840](v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[7];
  }
  uint64_t v13 = (void *)v0[7];
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t static Postback.updateConversionValue(_:coarseConversionValue:lockPostback:)(uint64_t a1, unsigned char *a2, char a3)
{
  uint64_t v7 = sub_243039520();
  v3[3] = v7;
  v3[4] = *(void *)(v7 - 8);
  v3[5] = swift_task_alloc();
  if (*a2)
  {
    if (*a2 == 1)
    {
      uint64_t v8 = (void *)swift_task_alloc();
      v3[6] = v8;
      *uint64_t v8 = v3;
      v8[1] = sub_24300D788;
      if (a3) {
        __int16 v9 = 257;
      }
      else {
        __int16 v9 = 1;
      }
    }
    else
    {
      uint64_t v11 = (void *)swift_task_alloc();
      v3[7] = v11;
      void *v11 = v3;
      v11[1] = sub_24300D8A8;
      if (a3) {
        __int16 v9 = 258;
      }
      else {
        __int16 v9 = 2;
      }
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v3[8] = v10;
    void *v10 = v3;
    v10[1] = sub_24300D9C8;
    if (a3) {
      __int16 v9 = 256;
    }
    else {
      __int16 v9 = 0;
    }
  }
  return sub_2430313E4(a1, v9, 0);
}

uint64_t sub_24300D788()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v3 = sub_24300DB58;
  }
  else
  {
    uint64_t v3 = sub_24300DAE8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24300D8A8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v3 = sub_24300DB58;
  }
  else
  {
    uint64_t v3 = sub_24300DAE8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24300D9C8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v3 = sub_24300DB58;
  }
  else
  {
    uint64_t v3 = sub_24300DAE8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24300DAE8()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24300DB58()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_243023FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x245672840](v2);
  MEMORY[0x245672840](v2);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[9];
    __int16 v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)__int16 v9 = 138412290;
    MEMORY[0x245672840](v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[9];
  }
  uint64_t v13 = (void *)v0[9];
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t static Postback.updateConversionValue(_:)(uint64_t *a1)
{
  uint64_t v3 = sub_243039520();
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = *(void *)(v3 - 8);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *a1;
  *(void *)(v1 + 40) = v4;
  *(void *)(v1 + 48) = v5;
  *(unsigned char *)(v1 + 88) = *((unsigned char *)a1 + 8);
  *(unsigned char *)(v1 + 89) = *((unsigned char *)a1 + 9);
  *(void *)(v1 + 56) = a1[2];
  return MEMORY[0x270FA2498](sub_24300DE78, 0, 0);
}

uint64_t sub_24300DE78()
{
  __int16 v1 = *(unsigned __int8 *)(v0 + 89);
  int v2 = *(unsigned __int8 *)(v0 + 88);
  uint64_t v3 = sub_24300E320();
  *(void *)(v0 + 64) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  if (v2) {
    __int16 v5 = 256;
  }
  else {
    __int16 v5 = 0;
  }
  __int16 v6 = v5 | v1;
  *uint64_t v4 = v0;
  v4[1] = sub_24300DF58;
  uint64_t v7 = *(void *)(v0 + 48);
  return sub_2430313E4(v7, v6, v3);
}

uint64_t sub_24300DF58()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_24300E0DC;
  }
  else {
    int v2 = sub_24300E06C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24300E06C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24300E0DC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_243023FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  MEMORY[0x245672840](v2);
  MEMORY[0x245672840](v2);
  __int16 v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (void *)v0[10];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    MEMORY[0x245672840](v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v11;
    sub_2430396F0();
    void *v10 = v11;

    _os_log_impl(&dword_243006000, v6, v7, "Encountered error while updating postback: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v10, -1, -1);
    MEMORY[0x245672970](v9, -1, -1);
  }
  else
  {
    uint64_t v12 = (void *)v0[10];
  }
  uint64_t v13 = (void *)v0[10];
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  sub_243008464();
  swift_allocError();
  sub_24301119C((uint64_t)v13, v14);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24300E320()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x263F8EE88];
  do
  {
    if (*(unsigned char *)(v1 + v3 + 32))
    {
      uint64_t v8 = v4;
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v8 = v4;
      sub_24300EA9C(&v7, 0);
      uint64_t v5 = 1;
    }
    sub_24300EA9C(&v7, v5);
    uint64_t v4 = v8;
    ++v3;
  }
  while (v2 != v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static Postback.isSupported.getter()
{
  return 1;
}

AdAttributionKit::PostbackUpdate::ConversionType_optional __swiftcall PostbackUpdate.ConversionType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_2430397D0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t PostbackUpdate.ConversionType.rawValue.getter()
{
  if (*v0) {
    return 0x656761676E656572;
  }
  else {
    return 0x6C6C6174736E69;
  }
}

uint64_t sub_24300E494(char *a1, char *a2)
{
  return sub_2430113BC(*a1, *a2);
}

uint64_t sub_24300E4A0()
{
  return sub_2430114D4();
}

uint64_t sub_24300E4A8()
{
  return sub_24301168C();
}

uint64_t sub_24300E4B0()
{
  return sub_243011700();
}

AdAttributionKit::PostbackUpdate::ConversionType_optional sub_24300E4B8(Swift::String *a1)
{
  return PostbackUpdate.ConversionType.init(rawValue:)(*a1);
}

uint64_t sub_24300E4C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PostbackUpdate.ConversionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PostbackUpdate.fineConversionValue.getter()
{
  return *(void *)v0;
}

uint64_t PostbackUpdate.lockPostback.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

void PostbackUpdate.coarseConversionValue.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 9);
}

uint64_t PostbackUpdate.conversionTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PostbackUpdate.init(fineConversionValue:lockPostback:coarseConversionValue:conversionTypes:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5 = *a3;
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 9) = v5;
  *(void *)(a5 + 16) = a4;
  return result;
}

unint64_t sub_24300E52C()
{
  unint64_t result = qword_268D700C8;
  if (!qword_268D700C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D700C8);
  }
  return result;
}

unint64_t sub_24300E584()
{
  unint64_t result = qword_268D700D0;
  if (!qword_268D700D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D700D0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CoarseConversionValue(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CoarseConversionValue(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24300E734);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

{
  int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;

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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2430392F4);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_24300E75C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CoarseConversionValue()
{
  return &type metadata for CoarseConversionValue;
}

{
  return &type metadata for CoarseConversionValue;
}

ValueMetadata *type metadata accessor for Postback()
{
  return &type metadata for Postback;
}

uint64_t destroy for PostbackUpdate()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16AdAttributionKit14PostbackUpdateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackUpdate(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PostbackUpdate(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackUpdate(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PostbackUpdate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdate()
{
  return &type metadata for PostbackUpdate;
}

unsigned char *storeEnumTagSinglePayload for PostbackUpdate.ConversionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24300EA10);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdate.ConversionType()
{
  return &type metadata for PostbackUpdate.ConversionType;
}

unint64_t sub_24300EA48()
{
  unint64_t result = qword_268D700D8;
  if (!qword_268D700D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D700D8);
  }
  return result;
}

uint64_t sub_24300EA9C(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_243039A40();
  swift_bridgeObjectRetain();
  sub_243039560();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_243039A60();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  uint64_t v17 = a2;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = (char)a2;
    uint64_t v9 = ~v6;
    uint64_t v10 = *(void *)&aDownloadredown[8 * v8];
    uint64_t v11 = *(void *)&aDownloadredown[8 * v8 + 24];
    while (*(void *)&aDownloadredown[8 * *(char *)(*(void *)(v4 + 48) + v7)] != v10
         || *(void *)&aDownloadredown[8 * *(char *)(*(void *)(v4 + 48) + v7) + 24] != v11)
    {
      char v13 = sub_2430399C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_11;
      }
      unint64_t v7 = (v7 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    char v15 = *(unsigned char *)(*(void *)(*v18 + 48) + v7);
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v18;
    uint64_t *v18 = 0x8000000000000000;
    char v15 = v17;
    sub_24300EF58(v17, v7, isUniquelyReferenced_nonNull_native);
    uint64_t *v18 = v20;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = v15;
  return result;
}

uint64_t sub_24300EC74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D700E0);
  uint64_t v3 = sub_243039760();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      sub_243039A40();
      sub_243039560();
      swift_bridgeObjectRelease();
      uint64_t result = sub_243039A60();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24300EF58(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_16;
  }
  if (a3)
  {
    sub_24300EC74();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24300F130();
      goto LABEL_16;
    }
    sub_24300F2C4();
  }
  uint64_t v8 = *v3;
  sub_243039A40();
  sub_243039560();
  swift_bridgeObjectRelease();
  uint64_t result = sub_243039A60();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = v5;
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)&aDownloadredown[8 * v10];
    uint64_t v13 = *(void *)&aDownloadredown[8 * v10 + 24];
    while (*(void *)&aDownloadredown[8 * *(char *)(*(void *)(v8 + 48) + a2)] != v12
         || *(void *)&aDownloadredown[8 * *(char *)(*(void *)(v8 + 48) + a2) + 24] != v13)
    {
      char v15 = sub_2430399C0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_20;
      }
      a2 = (a2 + 1) & v11;
      if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_16;
      }
    }
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v16 = *v20;
  *(void *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v21;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (!v18)
  {
    *(void *)(v16 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t result = sub_2430399E0();
  __break(1u);
  return result;
}

void *sub_24300F130()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D700E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_243039750();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24300F2C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D700E0);
  uint64_t v3 = sub_243039760();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    sub_243039A40();
    sub_243039560();
    swift_bridgeObjectRelease();
    uint64_t result = sub_243039A60();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t static PurchaseIntake.processInAppPurchase(_:appItemID:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  type metadata accessor for PurchaseIntakeRequest();
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_2430394C0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = type metadata accessor for InAppPurchaseDetails();
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24300F690, 0, 0);
}

uint64_t sub_24300F690()
{
  uint64_t v2 = (int *)v0[8];
  uint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v6 = (int *)v0[2];
  int v18 = *v6;
  uint64_t v21 = *((void *)v6 + 3);
  uint64_t v22 = v0[4];
  uint64_t v7 = *((void *)v6 + 6);
  uint64_t v19 = *((void *)v6 + 4);
  uint64_t v20 = *((void *)v6 + 5);
  unint64_t v8 = (int *)type metadata accessor for PurchaseIntake.InAppPurchase();
  long long v16 = *(_OWORD *)(v6 + 1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, (uint64_t)v6 + v8[7], v5);
  char v9 = *((unsigned char *)v6 + v8[8]);
  uint64_t v10 = (uint64_t *)((char *)v6 + v8[9]);
  uint64_t v11 = v10[1];
  uint64_t v17 = *v10;
  *(_DWORD *)uint64_t v1 = v18;
  *(_OWORD *)(v1 + 4) = v16;
  *(void *)(v1 + 24) = v21;
  *(void *)(v1 + 32) = v19;
  *(void *)(v1 + 40) = v20;
  *(void *)(v1 + 48) = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1 + v2[7], v3, v5);
  *(unsigned char *)(v1 + v2[8]) = v9;
  int64_t v12 = (void *)(v1 + v2[9]);
  *int64_t v12 = v17;
  v12[1] = v11;
  sub_24300FB24(v1, v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v13 = (void *)swift_task_alloc();
  v0[10] = v13;
  *unint64_t v13 = v0;
  v13[1] = sub_24300F844;
  uint64_t v14 = v0[3];
  return sub_2430278D4(v14);
}

uint64_t sub_24300F844()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24300FA18;
  }
  else {
    uint64_t v2 = sub_24300F958;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24300F958()
{
  uint64_t v1 = v0[9];
  sub_24300FB88(v0[4], (uint64_t (*)(void))type metadata accessor for PurchaseIntakeRequest);
  sub_24300FB88(v1, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24300FA18()
{
  uint64_t v1 = v0[9];
  sub_24300FB88(v0[4], (uint64_t (*)(void))type metadata accessor for PurchaseIntakeRequest);
  sub_24300FB88(v1, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t type metadata accessor for PurchaseIntake.InAppPurchase()
{
  uint64_t result = qword_268D700F8;
  if (!qword_268D700F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24300FB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24300FB88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t PurchaseIntake.InAppPurchase.amountCharged.getter()
{
  return *(void *)v0;
}

uint64_t PurchaseIntake.InAppPurchase.currencyCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntake.InAppPurchase.storefront.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntake.InAppPurchase.purchaseDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PurchaseIntake.InAppPurchase() + 28);
  uint64_t v4 = sub_2430394C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t PurchaseIntake.InAppPurchase.purchaseType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for PurchaseIntake.InAppPurchase();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t PurchaseIntake.InAppPurchase.subscriptionDuration.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PurchaseIntake.InAppPurchase() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseIntake.InAppPurchase.init(amountCharged:currencyCode:storefront:purchaseDate:purchaseType:subscriptionDuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char *a10, uint64_t a11, uint64_t a12)
{
  char v14 = *a10;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(_DWORD *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  unint64_t v15 = (int *)type metadata accessor for PurchaseIntake.InAppPurchase();
  uint64_t v16 = a9 + v15[7];
  uint64_t v17 = sub_2430394C0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v16, a8, v17);
  *(unsigned char *)(a9 + v15[8]) = v14;
  uint64_t v19 = (void *)(a9 + v15[9]);
  *uint64_t v19 = a11;
  v19[1] = a12;
  return result;
}

BOOL static PurchaseIntake.InAppPurchase.InAppPurchaseType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PurchaseIntake.InAppPurchase.InAppPurchaseType.hash(into:)()
{
  return sub_243039A50();
}

uint64_t PurchaseIntake.InAppPurchase.InAppPurchaseType.hashValue.getter()
{
  return sub_243039A60();
}

BOOL sub_24300FEB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24300FED0()
{
  unint64_t result = qword_268D700F0;
  if (!qword_268D700F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D700F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntake()
{
  return &type metadata for PurchaseIntake;
}

void *initializeBufferWithCopyOfBuffer for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    uint64_t v9 = a3[7];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v12 = sub_2430394C0();
    unint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    unint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *unint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v11 = sub_2430394C0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v14 = (void *)(a1 + v13);
  unint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2430104D4);
}

uint64_t sub_2430104D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2430394C0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseIntake.InAppPurchase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243010598);
}

uint64_t sub_243010598(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2430394C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_243010640()
{
  uint64_t result = sub_2430394C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PurchaseIntake.InAppPurchase.InAppPurchaseType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PurchaseIntake.InAppPurchase.InAppPurchaseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243010854);
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

ValueMetadata *type metadata accessor for PurchaseIntake.InAppPurchase.InAppPurchaseType()
{
  return &type metadata for PurchaseIntake.InAppPurchase.InAppPurchaseType;
}

uint64_t sub_243010890()
{
  uint64_t result = sub_243039670();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_243010924(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_243010930()
{
  return sub_243039A50();
}

uint64_t sub_24301095C()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_243039670();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2430109E4()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_243039670();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t type metadata accessor for AsyncStreamListener()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_243010AC0()
{
  return sub_243039A60();
}

uint64_t sub_243010B08()
{
  return sub_243010AC0();
}

uint64_t sub_243010B2C()
{
  return sub_243010930();
}

uint64_t sub_243010B50()
{
  return sub_243039A60();
}

BOOL sub_243010B90(uint64_t *a1, uint64_t *a2)
{
  return sub_243010924(*a1, *a2);
}

uint64_t sub_243010BB4()
{
  return swift_getWitnessTable();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t static DeveloperMode.isDeveloperModeEnabled.getter()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_243010C90;
  return sub_243034D78();
}

uint64_t sub_243010C90(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t static DeveloperMode.setDeveloperModeEnabled(_:)(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24300857C;
  return sub_243034E84(a1);
}

ValueMetadata *type metadata accessor for DeveloperMode()
{
  return &type metadata for DeveloperMode;
}

unint64_t AdAttributionKitError.description.getter()
{
  unint64_t result = 0xD000000000000024;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000033;
      break;
    case 4:
      unint64_t result = 0xD000000000000034;
      break;
    case 5:
    case 6:
      unint64_t result = 0xD000000000000036;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

BOOL static AdAttributionKitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AdAttributionKitError.hash(into:)()
{
  return sub_243039A50();
}

uint64_t AdAttributionKitError.hashValue.getter()
{
  return sub_243039A60();
}

unint64_t sub_243010FA0()
{
  unint64_t result = qword_268D70198;
  if (!qword_268D70198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70198);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AdAttributionKitError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AdAttributionKitError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x243011164);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdAttributionKitError()
{
  return &type metadata for AdAttributionKitError;
}

uint64_t sub_24301119C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  MEMORY[0x245672840]();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C06D0);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    LOBYTE(v5) = v6;
  }
  else
  {
    MEMORY[0x245672840](a1);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      LOBYTE(v5) = byte_24303AAA4[v6];
    }
    else
    {
      MEMORY[0x245672840](a1);
      uint64_t result = swift_dynamicCast();
      if (result) {
        unsigned int v5 = 0x5040306u >> (8 * v6);
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
  }
  *a2 = v5;
  return result;
}

uint64_t sub_24301129C(char a1, char a2)
{
  if (*(void *)&aHigh_3[8 * a1] == *(void *)&aHigh_3[8 * a2] && qword_24303AC18[a1] == qword_24303AC18[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_243011324(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6B63696C63;
  }
  else {
    uint64_t v3 = 2003134838;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6B63696C63;
  }
  else {
    uint64_t v5 = 2003134838;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2430113BC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656761676E656572;
  }
  else {
    uint64_t v3 = 0x6C6C6174736E69;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xEC000000746E656DLL;
  }
  if (a2) {
    uint64_t v5 = 0x656761676E656572;
  }
  else {
    uint64_t v5 = 0x6C6C6174736E69;
  }
  if (a2) {
    unint64_t v6 = 0xEC000000746E656DLL;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_243011468()
{
  return sub_243039A60();
}

uint64_t sub_2430114D4()
{
  return sub_243039A60();
}

uint64_t sub_243011560()
{
  return sub_243039A60();
}

uint64_t sub_2430115D8()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24301162C()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24301168C()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243011700()
{
  return sub_243039A60();
}

uint64_t sub_243011788()
{
  return sub_243039A60();
}

uint64_t sub_2430117FC()
{
  return sub_243039A60();
}

unint64_t static ImpressionIntake.compactJWSDictionaryKey.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static ImpressionIntake.reengagementURLDictionaryKey.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t static ImpressionIntake.recordImpression(advertisedItemID:compactJWS:interactionType:clientBundleID:)(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t static ImpressionIntake.processReengagement(advertisedItemID:compactJWS:clientBundleID:url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  return swift_bridgeObjectRelease();
}

AdAttributionKit::ImpressionIntake::InteractionType_optional __swiftcall ImpressionIntake.InteractionType.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_2430397D0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t ImpressionIntake.InteractionType.rawValue.getter()
{
  if (*v0) {
    return 0x6B63696C63;
  }
  else {
    return 2003134838;
  }
}

uint64_t sub_243011A40(char *a1, char *a2)
{
  return sub_243011324(*a1, *a2);
}

unint64_t sub_243011A50()
{
  unint64_t result = qword_268D701A0;
  if (!qword_268D701A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D701A0);
  }
  return result;
}

uint64_t sub_243011AA4()
{
  return sub_243011560();
}

uint64_t sub_243011AAC()
{
  return sub_24301162C();
}

uint64_t sub_243011AB4()
{
  return sub_243011788();
}

AdAttributionKit::ImpressionIntake::InteractionType_optional sub_243011ABC(Swift::String *a1)
{
  return ImpressionIntake.InteractionType.init(rawValue:)(*a1);
}

uint64_t sub_243011AC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ImpressionIntake.InteractionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_243011AF0()
{
  return sub_2430395F0();
}

uint64_t sub_243011B50()
{
  return sub_2430395E0();
}

ValueMetadata *type metadata accessor for ImpressionIntake()
{
  return &type metadata for ImpressionIntake;
}

unsigned char *storeEnumTagSinglePayload for ImpressionIntake.InteractionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243011C7CLL);
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

ValueMetadata *type metadata accessor for ImpressionIntake.InteractionType()
{
  return &type metadata for ImpressionIntake.InteractionType;
}

unint64_t sub_243011CB4()
{
  unint64_t result = qword_268D701A8;
  if (!qword_268D701A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D701A8);
  }
  return result;
}

uint64_t sub_243011D08()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v1 = (void *)sub_243039530();
  id v2 = objc_msgSend(v0, sel_initWithMachServiceName_options_, v1, 0);

  int v3 = self;
  id v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_26F8841D8);
  objc_msgSend(v2, sel_setExportedInterface_, v4);

  id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
  objc_msgSend(v2, sel_setExportedObject_, v5);

  id v6 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_26F884850);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v6);

  uint64_t v14 = sub_243011F60;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_243011F6C;
  uint64_t v13 = &block_descriptor;
  char v7 = _Block_copy(&v10);
  objc_msgSend(v2, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  uint64_t v14 = sub_243011FB0;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_243011F6C;
  uint64_t v13 = &block_descriptor_21;
  int v8 = _Block_copy(&v10);
  objc_msgSend(v2, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  objc_msgSend(v2, sel_resume);
  type metadata accessor for DeveloperModeServiceConnection();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  qword_268D78750 = result;
  return result;
}

void sub_243011F60()
{
}

uint64_t sub_243011F6C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_243011FB0()
{
}

void sub_243011FBC(const char *a1)
{
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_243039520();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B0C16E8);
  oslog = sub_243039500();
  os_log_type_t v3 = sub_2430396C0();
  if (os_log_type_enabled(oslog, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_243006000, oslog, v3, a1, v4, 2u);
    MEMORY[0x245672970](v4, -1, -1);
  }
}

uint64_t sub_2430120AC()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DeveloperModeServiceConnection()
{
  return self;
}

void sub_24301210C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_243012164@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24301217C()
{
  uint64_t result = sub_2430121C0();
  qword_268D78758 = result;
  return result;
}

uint64_t type metadata accessor for PostbackUpdateTestingServiceConnection()
{
  return self;
}

uint64_t sub_2430121C0()
{
  uint64_t v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_243012508();
  LOBYTE(v15) = 1;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
    uint64_t v2 = (void *)sub_243039530();
    id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v15);

    id v4 = self;
    id v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F8841D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    id v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F8847F0);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    unint64_t v19 = (unint64_t)sub_243011F60;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    uint64_t v18 = (ValueMetadata *)&block_descriptor_0;
    int v8 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_243011FB0;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    uint64_t v18 = (ValueMetadata *)&block_descriptor_6;
    uint64_t v9 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for PostbackUpdateTestingServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_26B0C0678 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_243039520();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B0C16E8);
    uint64_t v12 = sub_243039500();
    os_log_type_t v13 = sub_2430396C0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_243006000, v12, v13, "Testing feature flag is not enabled", v14, 2u);
      MEMORY[0x245672970](v14, -1, -1);
    }

    return 0;
  }
  return result;
}

unint64_t sub_243012508()
{
  unint64_t result = qword_26B0C0330[0];
  if (!qword_26B0C0330[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B0C0330);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2430125CC()
{
  return 0x676E6967676F4CLL;
}

uint64_t sub_2430125E4()
{
  return 1;
}

uint64_t sub_2430125EC()
{
  return sub_243039A50();
}

uint64_t sub_24301261C()
{
  return 0x676E6967676F6CLL;
}

uint64_t sub_243012634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x676E6967676F6CLL && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2430399C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2430126CC(uint64_t a1)
{
  unint64_t v2 = sub_24301298C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243012708(uint64_t a1)
{
  unint64_t v2 = sub_24301298C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243012744(uint64_t a1)
{
  unint64_t v2 = sub_2430129E0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243012780(uint64_t a1)
{
  unint64_t v2 = sub_2430129E0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430127BC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70228);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70230);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24301298C();
  sub_243039A90();
  sub_2430129E0();
  sub_2430398F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_24301298C()
{
  unint64_t result = qword_268D70238;
  if (!qword_268D70238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70238);
  }
  return result;
}

unint64_t sub_2430129E0()
{
  unint64_t result = qword_268D70240;
  if (!qword_268D70240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70240);
  }
  return result;
}

uint64_t sub_243012A34()
{
  return sub_243039A60();
}

uint64_t sub_243012A78(void *a1)
{
  return sub_243013E4C(a1);
}

uint64_t sub_243012A90()
{
  if (*v0) {
    return 6778732;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_243012AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243014230(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_243012AF0(uint64_t a1)
{
  unint64_t v2 = sub_243014134();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243012B2C(uint64_t a1)
{
  unint64_t v2 = sub_243014134();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243012B68(uint64_t a1)
{
  unint64_t v2 = sub_2430141DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243012BA4(uint64_t a1)
{
  unint64_t v2 = sub_2430141DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243012BE0()
{
  return 6778732;
}

uint64_t sub_243012BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2430399C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_243012C78(uint64_t a1)
{
  unint64_t v2 = sub_243014188();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243012CB4(uint64_t a1)
{
  unint64_t v2 = sub_243014188();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243012CF0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70248);
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70250);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70258);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243014134();
  uint64_t v14 = v20;
  sub_243039A90();
  if (v14)
  {
    char v22 = 1;
    sub_243014188();
    sub_2430398F0();
    sub_243039970();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  }
  else
  {
    char v21 = 0;
    sub_2430141DC();
    sub_2430398F0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_243012FD8(void *a1)
{
  return sub_243014310(a1);
}

uint64_t sub_243012FF0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_243014310(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_24301301C(void *a1)
{
  return sub_243012CF0(a1, *v1, v1[1]);
}

uint64_t sub_243013038(uint64_t a1)
{
  return a1;
}

uint64_t sub_24301306C()
{
  return sub_243039A60();
}

uint64_t sub_2430130AC()
{
  return 1701869940;
}

uint64_t sub_2430130BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2430399C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_243013144(uint64_t a1)
{
  unint64_t v2 = sub_2430147A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243013180(uint64_t a1)
{
  unint64_t v2 = sub_2430147A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430131BC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70268);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2430147A4();
  sub_243039A90();
  v11[0] = a2;
  v11[1] = a3;
  sub_2430147F8();
  sub_2430399A0();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void *sub_24301330C(void *a1)
{
  return sub_24301484C(a1);
}

void *sub_243013324@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_24301484C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_243013350(void *a1)
{
  return sub_2430131BC(a1, *v1, v1[1]);
}

uint64_t sub_24301336C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70278);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24303AD00;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_2430133E8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2430133E8()
{
  uint64_t v1 = v0;
  sub_243039420();
  swift_allocObject();
  sub_243039410();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0680);
  sub_2430149BC();
  uint64_t v2 = sub_243039400();
  unint64_t v4 = v3;
  swift_release();
  uint64_t v5 = (void *)sub_243039480();
  objc_msgSend(v1, sel_handleMessages_, v5);

  return sub_243014ACC(v2, v4);
}

uint64_t sub_2430136F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_24301336C(a1, a2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_243013754(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24301377C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2430137F4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2430396F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2430137F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2430138C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2430155F0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2430155F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2430138C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_243039700();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_243013A84(a5, a6);
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
  uint64_t v8 = sub_2430397A0();
  if (!v8)
  {
    sub_2430397B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2430397C0();
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

uint64_t sub_243013A84(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_243013B1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_243013CFC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_243013CFC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_243013B1C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_243013C94(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_243039770();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2430397B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2430395A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2430397C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2430397B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_243013C94(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D702D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_243013CFC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D702D8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_2430397C0();
  __break(1u);
  return result;
}

uint64_t sub_243013E4C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E8);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  size_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D702F0);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  int64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24301298C();
  sub_243039A80();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_2430398D0() + 16) == 1)
    {
      sub_2430129E0();
      sub_2430397E0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_243039790();
      swift_allocError();
      os_log_type_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E0);
      *os_log_type_t v13 = &type metadata for MessageRegistration;
      sub_2430397F0();
      sub_243039780();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_243014134()
{
  unint64_t result = qword_26B0C05D0;
  if (!qword_26B0C05D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05D0);
  }
  return result;
}

unint64_t sub_243014188()
{
  unint64_t result = qword_268D70260;
  if (!qword_268D70260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70260);
  }
  return result;
}

unint64_t sub_2430141DC()
{
  unint64_t result = qword_26B0C05F8;
  if (!qword_26B0C05F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05F8);
  }
  return result;
}

uint64_t sub_243014230(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024303F140 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_243014310(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0698);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06A0);
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0690);
  uint64_t v26 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243014134();
  uint64_t v13 = (uint64_t)v28;
  sub_243039A80();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v27;
  uint64_t v23 = v6;
  uint64_t v28 = a1;
  uint64_t v15 = sub_2430398D0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v19 = sub_243039790();
    swift_allocError();
    char v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E0);
    *char v21 = &type metadata for XPCClientMessage.MessageType;
    uint64_t v12 = (uint64_t)v11;
    sub_2430397F0();
    sub_243039780();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    a1 = v28;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v12;
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v30 = 1;
    sub_243014188();
    sub_2430397E0();
    uint64_t v16 = v24;
    uint64_t v12 = sub_243039880();
    uint64_t v17 = v5;
    uint64_t v18 = v26;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
  }
  else
  {
    char v29 = 0;
    sub_2430141DC();
    sub_2430397E0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    uint64_t v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v12;
}

unint64_t sub_2430147A4()
{
  unint64_t result = qword_26B0C0618;
  if (!qword_26B0C0618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0618);
  }
  return result;
}

unint64_t sub_2430147F8()
{
  unint64_t result = qword_268D70270;
  if (!qword_268D70270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70270);
  }
  return result;
}

void *sub_24301484C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2430147A4();
  sub_243039A80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_243015650();
    sub_2430398B0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_2430149BC()
{
  unint64_t result = qword_268D70280;
  if (!qword_268D70280)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B0C0680);
    sub_243014A78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70280);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_243014A78()
{
  unint64_t result = qword_268D70288;
  if (!qword_268D70288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70288);
  }
  return result;
}

uint64_t sub_243014ACC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_243014B28()
{
  unint64_t result = qword_268D70290;
  if (!qword_268D70290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70290);
  }
  return result;
}

uint64_t sub_243014B88()
{
  return 0;
}

ValueMetadata *type metadata accessor for MessageRegistration()
{
  return &type metadata for MessageRegistration;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage()
{
  return &type metadata for XPCClientMessage;
}

void *initializeBufferWithCopyOfBuffer for XPCClientMessage.MessageType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCClientMessage.MessageType()
{
  return swift_bridgeObjectRelease();
}

void *_s20AttributionKitCommon16XPCClientMessageV11MessageTypeOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for XPCClientMessage.MessageType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_243014DC0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_243014DD8(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType()
{
  return &type metadata for XPCClientMessage.MessageType;
}

ValueMetadata *type metadata accessor for XPCClientMessage.CodingKeys()
{
  return &type metadata for XPCClientMessage.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for XPCClientMessage.MessageType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x243014EE4);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.CodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.LogCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.LogCodingKeys;
}

uint64_t getEnumTagSinglePayload for ImpressionType(unsigned int *a1, int a2)
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

unsigned char *_s20AttributionKitCommon19MessageRegistrationOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x243015028);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageRegistration.CodingKeys()
{
  return &type metadata for MessageRegistration.CodingKeys;
}

ValueMetadata *type metadata accessor for MessageRegistration.LoggingCodingKeys()
{
  return &type metadata for MessageRegistration.LoggingCodingKeys;
}

unint64_t sub_243015074()
{
  unint64_t result = qword_268D70298;
  if (!qword_268D70298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70298);
  }
  return result;
}

unint64_t sub_2430150CC()
{
  unint64_t result = qword_268D702A0;
  if (!qword_268D702A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702A0);
  }
  return result;
}

unint64_t sub_243015124()
{
  unint64_t result = qword_268D702A8;
  if (!qword_268D702A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702A8);
  }
  return result;
}

unint64_t sub_24301517C()
{
  unint64_t result = qword_268D702B0;
  if (!qword_268D702B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702B0);
  }
  return result;
}

unint64_t sub_2430151D4()
{
  unint64_t result = qword_26B0C0628;
  if (!qword_26B0C0628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0628);
  }
  return result;
}

unint64_t sub_24301522C()
{
  unint64_t result = qword_26B0C0620;
  if (!qword_26B0C0620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0620);
  }
  return result;
}

unint64_t sub_243015284()
{
  unint64_t result = qword_26B0C0608;
  if (!qword_26B0C0608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0608);
  }
  return result;
}

unint64_t sub_2430152DC()
{
  unint64_t result = qword_26B0C0600;
  if (!qword_26B0C0600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0600);
  }
  return result;
}

unint64_t sub_243015334()
{
  unint64_t result = qword_26B0C05F0;
  if (!qword_26B0C05F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05F0);
  }
  return result;
}

unint64_t sub_24301538C()
{
  unint64_t result = qword_26B0C05E8;
  if (!qword_26B0C05E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05E8);
  }
  return result;
}

unint64_t sub_2430153E4()
{
  unint64_t result = qword_26B0C05E0;
  if (!qword_26B0C05E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05E0);
  }
  return result;
}

unint64_t sub_24301543C()
{
  unint64_t result = qword_26B0C05D8;
  if (!qword_26B0C05D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C05D8);
  }
  return result;
}

unint64_t sub_243015494()
{
  unint64_t result = qword_268D702B8;
  if (!qword_268D702B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702B8);
  }
  return result;
}

unint64_t sub_2430154EC()
{
  unint64_t result = qword_268D702C0;
  if (!qword_268D702C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702C0);
  }
  return result;
}

unint64_t sub_243015544()
{
  unint64_t result = qword_268D702C8;
  if (!qword_268D702C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702C8);
  }
  return result;
}

unint64_t sub_24301559C()
{
  unint64_t result = qword_268D702D0;
  if (!qword_268D702D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D702D0);
  }
  return result;
}

uint64_t sub_2430155F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_243015650()
{
  unint64_t result = qword_26B0C0610;
  if (!qword_26B0C0610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0610);
  }
  return result;
}

uint64_t sub_2430156B4(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return MEMORY[0x270FA2498](sub_243015700, 0, 0);
}

uint64_t sub_243015700()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A548();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    void *v14 = v0;
    v14[1] = sub_243015934;
    return MEMORY[0x270FA2360](v0 + 128, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A59C, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243015934()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_24301A7CC;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_24301A7C4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243015A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  return MEMORY[0x270FA2498](sub_243015A9C, 0, 0);
}

uint64_t sub_243015A9C()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    type metadata accessor for PurchaseIntakeRequest();
    sub_24301A458();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 96) = v3;
    *(void *)(v0 + 104) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 88);
    long long v16 = *(_OWORD *)(v0 + 64);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 112) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    void *v14 = v0;
    v14[1] = sub_243015CE0;
    return MEMORY[0x270FA2360](v0 + 136, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A4B0, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243015CE0()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_243015E64;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_243015DFC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243015DFC()
{
  sub_243014ACC(*(void *)(v0 + 96), *(void *)(v0 + 104));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_243015E64()
{
  sub_243014ACC(v0[12], v0[13]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_243015ED4(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = a3;
  *(void *)(v4 + 72) = v3;
  *(void *)(v4 + 56) = a2;
  *(unsigned char *)(v4 + 130) = a1;
  *(void *)(v4 + 80) = *v3;
  return MEMORY[0x270FA2498](sub_243015F24, 0, 0);
}

uint64_t sub_243015F24()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    *(unsigned char *)(v0 + 129) = *(unsigned char *)(v0 + 130);
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A3D4();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    void *v14 = v0;
    v14[1] = sub_243016168;
    return MEMORY[0x270FA2360](v0 + 128, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A428, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243016168()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_2430162EC;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_243016284;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243016284()
{
  sub_243014ACC(*(void *)(v0 + 88), *(void *)(v0 + 96));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 128);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2430162EC()
{
  sub_243014ACC(v0[11], v0[12]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24301635C(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 104) = a5;
  *(void *)(v6 + 112) = v5;
  *(void *)(v6 + 88) = a3;
  *(void *)(v6 + 96) = a4;
  *(_WORD *)(v6 + 168) = a2;
  *(void *)(v6 + 80) = a1;
  *(void *)(v6 + 120) = *v5;
  return MEMORY[0x270FA2498](sub_2430163B0, 0, 0);
}

uint64_t sub_2430163B0()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    __int16 v3 = *(_WORD *)(v0 + 168);
    uint64_t v4 = *(void *)(v0 + 88);
    *(void *)(v0 + 56) = *(void *)(v0 + 80);
    *(unsigned char *)(v0 + 64) = v3;
    *(unsigned char *)(v0 + 65) = HIBYTE(v3) & 1;
    *(void *)(v0 + 72) = v4;
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A350();
    uint64_t v5 = sub_243039400();
    *(void *)(v0 + 128) = v5;
    *(void *)(v0 + 136) = v6;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 120);
    long long v18 = *(_OWORD *)(v0 + 96);
    swift_release();
    uint64_t v14 = *(void *)(v12 + 16);
    uint64_t v15 = swift_task_alloc();
    *(void *)(v0 + 144) = v15;
    *(void *)(v15 + 16) = v14;
    *(_OWORD *)(v15 + 24) = v18;
    *(void *)(v15 + 40) = v10;
    *(void *)(v15 + 48) = v11;
    *(void *)(v15 + 56) = v13;
    long long v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v16;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    *long long v16 = v0;
    v16[1] = sub_243016608;
    return MEMORY[0x270FA2360](v0 + 170, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A3A4, v15, v17);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    unsigned char *v7 = 3;
    swift_willThrow();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_243016608()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_24301678C;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_243016724;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243016724()
{
  sub_243014ACC(*(void *)(v0 + 128), *(void *)(v0 + 136));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 170);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24301678C()
{
  sub_243014ACC(v0[16], v0[17]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2430167FC(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return MEMORY[0x270FA2498](sub_243016848, 0, 0);
}

uint64_t sub_243016848()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A228();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    void *v14 = v0;
    v14[1] = sub_243016168;
    return MEMORY[0x270FA2360](v0 + 128, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A27C, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243016A7C(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return MEMORY[0x270FA2498](sub_243016AC8, 0, 0);
}

uint64_t sub_243016AC8()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A004();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v10;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    void *v14 = v0;
    v14[1] = sub_243016CF8;
    uint64_t v15 = MEMORY[0x263F8D4F8];
    return MEMORY[0x270FA2360](v0 + 128, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A0B0, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

uint64_t sub_243016CF8()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_243016E14;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_243016284;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243016E14()
{
  sub_243014ACC(v0[11], v0[12]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_243016E88(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return MEMORY[0x270FA2498](sub_243016ED4, 0, 0);
}

uint64_t sub_243016ED4()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_243012508();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v2)
  {
    sub_243039420();
    swift_allocObject();
    sub_243039410();
    sub_24301A004();
    uint64_t v3 = sub_243039400();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C8);
    void *v14 = v0;
    v14[1] = sub_243015934;
    return MEMORY[0x270FA2360](v0 + 128, 0, 0, 0xD000000000000023, 0x800000024303F3E0, sub_24301A058, v13, v15);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243017108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_243017130, 0, 0);
}

uint64_t sub_243017130()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    uint64_t v1 = *(void *)(v0 + 48);
    long long v7 = *(_OWORD *)(v0 + 16);
    long long v8 = *(_OWORD *)(v0 + 32);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 56) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(_OWORD *)(v2 + 32) = v8;
    *(void *)(v2 + 48) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 64) = v3;
    *(void *)(v3 + 16) = sub_243019D88;
    *(void *)(v3 + 24) = v2;
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70300 + dword_268D70300);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_2430172B4;
    return v9((uint64_t)sub_243019DB8, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_2430172B4()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24301A7C8;
  }
  else {
    uint64_t v2 = sub_24301A7BC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_2430173C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)sub_243039530();
  uint64_t v11 = (void *)sub_243039530();
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_243038A9C;
  v13[3] = &block_descriptor_95;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_preflightImpressionWithAdvertisedItemID_compactJWS_adNetworkID_reply_, a6, v10, v11, v12);
  _Block_release(v12);
}

uint64_t sub_2430174D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2430174F4, 0, 0);
}

uint64_t sub_2430174F4()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v7 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_243019DE4;
    *(void *)(v3 + 24) = v2;
    long long v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70300 + dword_268D70300);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_243017670;
    return v8((uint64_t)sub_24301A7C0, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243017670()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24301A764;
  }
  else {
    uint64_t v2 = sub_24301A768;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243017784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2430177A8, 0, 0);
}

uint64_t sub_2430177A8()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v7 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_243019E20;
    *(void *)(v3 + 24) = v2;
    long long v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70300 + dword_268D70300);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_243017924;
    return v8((uint64_t)sub_24301A7C0, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243017924()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243017AA4;
  }
  else {
    uint64_t v2 = sub_243017A38;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243017A38()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243017AA4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_243017B10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  uint64_t v14 = (void *)sub_243039530();
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_243038A9C;
  v16[3] = a9;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, v14, v15);
  _Block_release(v15);
}

uint64_t sub_243017BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_243017C1C, 0, 0);
}

uint64_t sub_243017C1C()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    uint64_t v1 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v4 = swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    long long v5 = *(_OWORD *)(v0 + 32);
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v2;
    *(_OWORD *)(v4 + 32) = v5;
    *(void *)(v4 + 48) = v1;
    uint64_t v6 = swift_task_alloc();
    *(void *)(v0 + 64) = v6;
    *(void *)(v6 + 16) = sub_243019E5C;
    *(void *)(v6 + 24) = v4;
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70300 + dword_268D70300);
    long long v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v7;
    void *v7 = v0;
    v7[1] = sub_243017DA4;
    return v10((uint64_t)sub_24301A7C0, v6);
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_243017DA4()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243017F24;
  }
  else {
    uint64_t v2 = sub_243017EB8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243017EB8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243017F24()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_243017F90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70070);
  MEMORY[0x270FA5388](v14 - 8);
  long long v16 = (char *)aBlock - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void *)sub_243039530();
  sub_24301A4E0(a10, (uint64_t)v16);
  uint64_t v18 = sub_243039460();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    uint64_t v20 = (void *)sub_243039450();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243038A9C;
  aBlock[3] = &block_descriptor_75;
  char v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_processTapWithAdvertisedItemID_compactJWS_eventMessage_reengagementURL_reply_, a6, v17, a9, v20, v21);
  _Block_release(v21);
}

uint64_t sub_243018178(uint64_t a1)
{
  unint64_t v2 = sub_243019E8C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430181B4(uint64_t a1)
{
  unint64_t v2 = sub_243019E8C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430181F0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70320);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243019E8C();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_243018300(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_243018328(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A64C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_89;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70380);
  if (swift_dynamicCast() && v31)
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243018638(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A07C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_69;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0658);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243018940(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A07C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_58;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0658);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243018C48(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A07C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_47;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70380);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243018F50(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A07C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_36;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70380);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243019258(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70368);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A0EC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_25;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70358);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A178, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243019560(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_24301A07C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  aBlock[3] = &block_descriptor_1;
  uint64_t v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)aBlock, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70358);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_24301A0AC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_243019FB0();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    sub_243039630();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
}

uint64_t sub_243019868(void *a1)
{
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_243039520();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B0C16E8);
  MEMORY[0x245672840](a1);
  MEMORY[0x245672840](a1);
  uint64_t v3 = sub_243039500();
  os_log_type_t v4 = sub_2430396C0();
  if (os_log_type_enabled(v3, v4))
  {
    long long v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v5 = 138543362;
    MEMORY[0x245672840](a1);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    sub_2430396F0();
    *uint64_t v6 = v9;

    _os_log_impl(&dword_243006000, v3, v4, "Error fetching remote object proxy: %{public}@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v6, -1, -1);
    MEMORY[0x245672970](v5, -1, -1);
  }
  else
  {
  }
  sub_243019FB0();
  swift_allocError();
  unsigned char *v7 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
  return sub_243039630();
}

uint64_t sub_243019A64(void *a1, uint64_t a2, uint64_t *a3)
{
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_243039520();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B0C16E8);
  MEMORY[0x245672840](a1);
  MEMORY[0x245672840](a1);
  uint64_t v6 = sub_243039500();
  os_log_type_t v7 = sub_2430396C0();
  if (os_log_type_enabled(v6, v7))
  {
    long long v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v8 = 138543362;
    MEMORY[0x245672840](a1);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_2430396F0();
    *uint64_t v9 = v12;

    _os_log_impl(&dword_243006000, v6, v7, "Error fetching remote object proxy: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v9, -1, -1);
    MEMORY[0x245672970](v8, -1, -1);
  }
  else
  {
  }
  sub_243019FB0();
  swift_allocError();
  unsigned char *v10 = 3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_243039630();
}

uint64_t sub_243019C60()
{
  __int16 v0 = sub_24301E794();
  char v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70368);
    return sub_243039630();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70368);
    return sub_243039640();
  }
}

uint64_t sub_243019CF4()
{
  __int16 v0 = sub_24301DE18();
  char v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v3 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
    return sub_243039630();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);
    return sub_243039640();
  }
}

void sub_243019D88(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2430173C8(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_243019DB8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

void sub_243019DE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_243017B10(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_81, (SEL *)&selRef_startViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_243019E20(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_243017B10(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_78, (SEL *)&selRef_endViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_243019E5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_243017F90(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], v5[5], v5[6]);
}

unint64_t sub_243019E8C()
{
  unint64_t result = qword_268D70328;
  if (!qword_268D70328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70328);
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionRequest()
{
  return &type metadata for ImpressionRequest;
}

ValueMetadata *type metadata accessor for ImpressionRequest.CodingKeys()
{
  return &type metadata for ImpressionRequest.CodingKeys;
}

unint64_t sub_243019F04()
{
  unint64_t result = qword_268D70330;
  if (!qword_268D70330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70330);
  }
  return result;
}

unint64_t sub_243019F5C()
{
  unint64_t result = qword_268D70338;
  if (!qword_268D70338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70338);
  }
  return result;
}

unint64_t sub_243019FB0()
{
  unint64_t result = qword_268D70348;
  if (!qword_268D70348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70348);
  }
  return result;
}

unint64_t sub_24301A004()
{
  unint64_t result = qword_268D70350;
  if (!qword_268D70350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70350);
  }
  return result;
}

uint64_t sub_24301A058(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243019560);
}

uint64_t sub_24301A070()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t sub_24301A07C(void *a1)
{
  return sub_24301A0F8(a1, &qword_26B0C06C0);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_24301A0A0()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

uint64_t sub_24301A0B0(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243019258);
}

uint64_t sub_24301A0C8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_24301A0E0()
{
  return objectdestroyTm(&qword_268D70368);
}

uint64_t sub_24301A0EC(void *a1)
{
  return sub_24301A0F8(a1, &qword_268D70368);
}

uint64_t sub_24301A0F8(void *a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_243019A64(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_24301A16C()
{
  return objectdestroy_16Tm(&qword_268D70368);
}

uint64_t sub_24301A178()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70368);

  return sub_243019C60();
}

unint64_t sub_24301A228()
{
  unint64_t result = qword_268D70378;
  if (!qword_268D70378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70378);
  }
  return result;
}

uint64_t sub_24301A27C(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243018F50);
}

uint64_t sub_24301A294()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t sub_24301A2A0()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

uint64_t sub_24301A2AC()
{
  return sub_243019CF4();
}

unint64_t sub_24301A350()
{
  unint64_t result = qword_268D70390;
  if (!qword_268D70390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70390);
  }
  return result;
}

uint64_t sub_24301A3A4(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243018C48);
}

uint64_t sub_24301A3BC()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t sub_24301A3C8()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

unint64_t sub_24301A3D4()
{
  unint64_t result = qword_26B0C0650;
  if (!qword_26B0C0650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0650);
  }
  return result;
}

uint64_t sub_24301A428(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243018940);
}

uint64_t sub_24301A440()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t sub_24301A44C()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

unint64_t sub_24301A458()
{
  unint64_t result = qword_268D703A8;
  if (!qword_268D703A8)
  {
    type metadata accessor for PurchaseIntakeRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703A8);
  }
  return result;
}

uint64_t sub_24301A4B0(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243018638);
}

uint64_t sub_24301A4C8()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t sub_24301A4D4()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

uint64_t sub_24301A4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24301A548()
{
  unint64_t result = qword_268D703B0;
  if (!qword_268D703B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703B0);
  }
  return result;
}

uint64_t sub_24301A59C(uint64_t a1)
{
  return sub_24301A0C8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_243018328);
}

uint64_t sub_24301A5B4()
{
  return objectdestroyTm(&qword_26B0C06C0);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_24301A64C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06C0);

  return sub_243019868(a1);
}

uint64_t sub_24301A6C0()
{
  return objectdestroy_16Tm(&qword_26B0C06C0);
}

uint64_t objectdestroy_16Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v7, v6);
}

BOOL sub_24301A7D0()
{
  uint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_24301A818()
{
  return 0x72706D692D707061;
}

unint64_t sub_24301A840()
{
  unint64_t result = qword_268D703B8;
  if (!qword_268D703B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703B8);
  }
  return result;
}

uint64_t sub_24301A894()
{
  return sub_243039A60();
}

uint64_t sub_24301A8F4()
{
  return sub_243039560();
}

uint64_t sub_24301A918()
{
  return sub_243039A60();
}

uint64_t sub_24301A974@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2430397D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_24301A9C8(char *a1@<X8>)
{
  a1[15] = -18;
}

uint64_t sub_24301A9F0()
{
  return sub_2430395F0();
}

uint64_t sub_24301AA50()
{
  return sub_2430395E0();
}

unsigned char *storeEnumTagSinglePayload for ImpressionType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24301AB3CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionType()
{
  return &type metadata for ImpressionType;
}

unint64_t sub_24301AB74()
{
  unint64_t result = qword_268D703C0;
  if (!qword_268D703C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703C0);
  }
  return result;
}

uint64_t sub_24301ABC8(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v27 + 1) = &type metadata for FeatureFlag;
  unint64_t v28 = sub_243012508();
  LOBYTE(aBlock) = 0;
  char v7 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    unint64_t v28 = (unint64_t)sub_24301FFC0;
    uint64_t v29 = v8;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v27 = sub_24301DDB0;
    *((void *)&v27 + 1) = &block_descriptor_59;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v30, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70490);
    if (swift_dynamicCast())
    {
      uint64_t v24 = a2;
      uint64_t v31 = v25;
      long long v12 = a1[1];
      long long aBlock = *a1;
      long long v27 = v12;
      unint64_t v28 = *((void *)a1 + 4);
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_243020350();
      uint64_t v13 = sub_243039400();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v17 = v13;
        unint64_t v18 = v14;
        swift_release();
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 16) = v8;
        *(void *)(v19 + 24) = v6;
        swift_retain();
        v24(&v31, v17, v18, sub_24302059C, v19);
        swift_release();
        swift_beginAccess();
        unsigned int v20 = *(unsigned __int16 *)(v8 + 16);
        if (v20 >> 8 <= 0xFE)
        {
          if ((v20 & 0x100) == 0)
          {
            sub_243014ACC(v17, v18);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
            return v20 & 1;
          }
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          *uint64_t v23 = v20;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          *uint64_t v21 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v17, v18);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *long long v16 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v15 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301AFDC@<X0>(long long *a1@<X0>, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a3;
  v46 = a2;
  uint64_t v7 = *v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70478);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70480);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)&v51 + 1) = &type metadata for FeatureFlag;
  unint64_t v52 = sub_243012508();
  LOBYTE(aBlock) = 0;
  char v15 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if (v15)
  {
    v44 = v10;
    v45 = a1;
    v42 = v14;
    uint64_t v43 = v7;
    uint64_t v41 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70488);
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = v16 + *(void *)(*(void *)v16 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v17, 1, 1, v11);
    unint64_t v18 = (void *)v4[2];
    unint64_t v52 = (unint64_t)sub_243020348;
    uint64_t v53 = v16;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v51 = sub_24301DDB0;
    *((void *)&v51 + 1) = &block_descriptor_50;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v20 = objc_msgSend(v18, sel_synchronousRemoteObjectProxyWithErrorHandler_, v19);
    _Block_release(v19);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v54, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70490);
    if (swift_dynamicCast())
    {
      uint64_t v21 = v11;
      uint64_t v55 = v49;
      long long v22 = v45[1];
      long long aBlock = *v45;
      long long v51 = v22;
      unint64_t v52 = *((void *)v45 + 4);
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_243020350();
      uint64_t v23 = v48;
      uint64_t v24 = sub_243039400();
      if (v23)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v29 = v24;
        unint64_t v30 = v25;
        swift_release();
        uint64_t v31 = v21;
        uint64_t v32 = swift_allocObject();
        uint64_t v33 = v43;
        *(void *)(v32 + 16) = v16;
        *(void *)(v32 + 24) = v33;
        swift_retain();
        v46(&v55, v29, v30, sub_2430203A4, v32);
        swift_release();
        swift_beginAccess();
        uint64_t v34 = (uint64_t)v44;
        sub_2430204C8(v17, (uint64_t)v44, &qword_268D70478);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v34, 1, v31) == 1)
        {
          sub_24300C38C(v34, &qword_268D70478);
          sub_243019FB0();
          swift_allocError();
          unsigned char *v35 = 0;
          swift_willThrow();
        }
        else
        {
          uint64_t v36 = v34;
          v37 = v42;
          sub_243020464(v36, (uint64_t)v42, &qword_268D70480);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            LOBYTE(v49) = *v37;
            char v38 = v49;
            sub_243019FB0();
            swift_willThrowTypedImpl();
            swift_allocError();
            unsigned char *v39 = v38;
          }
          else
          {
            sub_243020464((uint64_t)v37, v41, &qword_268D70070);
          }
        }
        sub_243014ACC(v29, v30);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *unint64_t v28 = 3;
      swift_willThrow();
      swift_release();
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    unsigned char *v26 = 3;
    return swift_willThrow();
  }
}

uint64_t sub_24301B550(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v29 + 1) = &type metadata for FeatureFlag;
  *(void *)&long long v30 = sub_243012508();
  LOBYTE(aBlock) = 0;
  char v7 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    *(void *)&long long v30 = sub_24301FFC0;
    *((void *)&v30 + 1) = v8;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v29 = sub_24301DDB0;
    *((void *)&v29 + 1) = &block_descriptor_44;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v39, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
    if (swift_dynamicCast())
    {
      long long v27 = a2;
      uint64_t v40 = v38;
      long long v12 = a1[7];
      long long v34 = a1[6];
      long long v35 = v12;
      long long v36 = a1[8];
      char v37 = *((unsigned char *)a1 + 144);
      long long v13 = a1[3];
      long long v30 = a1[2];
      long long v31 = v13;
      long long v14 = a1[5];
      long long v32 = a1[4];
      long long v33 = v14;
      long long v15 = a1[1];
      long long aBlock = *a1;
      long long v29 = v15;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_2430202A0();
      uint64_t v16 = sub_243039400();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v20 = v16;
        unint64_t v21 = v17;
        swift_release();
        uint64_t v22 = swift_allocObject();
        *(void *)(v22 + 16) = v8;
        *(void *)(v22 + 24) = v6;
        swift_retain();
        v27(&v40, v20, v21, sub_24302059C, v22);
        swift_release();
        swift_beginAccess();
        unsigned int v23 = *(unsigned __int16 *)(v8 + 16);
        if (v23 >> 8 <= 0xFE)
        {
          if ((v23 & 0x100) == 0)
          {
            sub_243014ACC(v20, v21);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
            return v23 & 1;
          }
          LOBYTE(v38) = *(_WORD *)(v8 + 16);
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          unsigned char *v26 = v23;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          *uint64_t v24 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v20, v21);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *uint64_t v19 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    unsigned char *v18 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301B984(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v28 + 1) = &type metadata for FeatureFlag;
  *(void *)&long long v29 = sub_243012508();
  LOBYTE(aBlock) = 0;
  char v7 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    *(void *)&long long v29 = sub_24301FFC0;
    *((void *)&v29 + 1) = v8;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v28 = sub_24301DDB0;
    *((void *)&v28 + 1) = &block_descriptor_38;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v34, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
    if (swift_dynamicCast())
    {
      uint64_t v26 = a2;
      uint64_t v35 = v33;
      long long v12 = a1[5];
      long long v31 = a1[4];
      v32[0] = v12;
      *(_OWORD *)((char *)v32 + 9) = *(long long *)((char *)a1 + 89);
      long long v13 = a1[1];
      long long aBlock = *a1;
      long long v28 = v13;
      long long v14 = a1[3];
      long long v29 = a1[2];
      long long v30 = v14;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_24302024C();
      uint64_t v15 = sub_243039400();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v19 = v15;
        unint64_t v20 = v16;
        swift_release();
        uint64_t v21 = swift_allocObject();
        *(void *)(v21 + 16) = v8;
        *(void *)(v21 + 24) = v6;
        swift_retain();
        v26(&v35, v19, v20, sub_24302059C, v21);
        swift_release();
        swift_beginAccess();
        unsigned int v22 = *(unsigned __int16 *)(v8 + 16);
        if (v22 >> 8 <= 0xFE)
        {
          if ((v22 & 0x100) == 0)
          {
            sub_243014ACC(v19, v20);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
            return v22 & 1;
          }
          LOBYTE(v33) = *(_WORD *)(v8 + 16);
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          unsigned char *v25 = v22;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          *unsigned int v23 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v19, v20);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      unsigned char *v18 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *unint64_t v17 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301BDA8(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v4 = *v1;
  uint64_t v24 = &type metadata for FeatureFlag;
  unint64_t v25 = sub_243012508();
  LOBYTE(aBlock[0]) = 0;
  char v5 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v6 = swift_allocObject();
    *(_WORD *)(v6 + 16) = -256;
    char v7 = (void *)v1[2];
    unint64_t v25 = (unint64_t)sub_24301FFC0;
    uint64_t v26 = v6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24301DDB0;
    uint64_t v24 = (ValueMetadata *)&block_descriptor_32;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v9 = objc_msgSend(v7, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v27, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
    if (swift_dynamicCast())
    {
      uint64_t v21 = a1;
      uint64_t v28 = v22;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_2430201F8();
      uint64_t v10 = sub_243039400();
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v14 = v10;
        unint64_t v15 = v11;
        swift_release();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v6;
        *(void *)(v16 + 24) = v4;
        swift_retain();
        v21(&v28, v14, v15, sub_24302059C, v16);
        swift_release();
        swift_beginAccess();
        unsigned int v17 = *(unsigned __int16 *)(v6 + 16);
        if (v17 >> 8 <= 0xFE)
        {
          if ((v17 & 0x100) == 0)
          {
            sub_243014ACC(v14, v15);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
            return v17 & 1;
          }
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          *unint64_t v20 = v17;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          unsigned char *v18 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v14, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *long long v13 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *long long v12 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301C1A8(uint64_t a1, char a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4, void (*a5)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v11 = *v5;
  uint64_t v35 = &type metadata for FeatureFlag;
  unint64_t v36 = sub_243012508();
  LOBYTE(aBlock) = 0;
  char v12 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  if (v12)
  {
    char v29 = a2;
    uint64_t v28 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v13 = swift_allocObject();
    *(_WORD *)(v13 + 16) = -256;
    uint64_t v14 = (void *)v5[2];
    unint64_t v36 = (unint64_t)sub_24301FFC0;
    uint64_t v37 = v13;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v33 = 1107296256;
    long long v34 = sub_24301DDB0;
    uint64_t v35 = (ValueMetadata *)&block_descriptor_26;
    unint64_t v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v16 = objc_msgSend(v14, sel_synchronousRemoteObjectProxyWithErrorHandler_, v15);
    _Block_release(v15);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v38, (uint64_t)&aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
    if (swift_dynamicCast())
    {
      uint64_t v39 = v31;
      uint64_t aBlock = a1;
      LOBYTE(v33) = v29;
      long long v34 = a3;
      uint64_t v35 = a4;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_2430201A4();
      uint64_t v17 = sub_243039400();
      if (v30)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v21 = v17;
        unint64_t v22 = v18;
        swift_release();
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = v13;
        *(void *)(v23 + 24) = v28;
        swift_retain();
        a5(&v39, v21, v22, sub_24302059C, v23);
        swift_release();
        swift_beginAccess();
        unsigned int v24 = *(unsigned __int16 *)(v13 + 16);
        if (v24 >> 8 <= 0xFE)
        {
          if ((v24 & 0x100) == 0)
          {
            sub_243014ACC(v21, v22);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
            return v24 & 1;
          }
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          *long long v27 = v24;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          unsigned char *v25 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v21, v22);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *unint64_t v20 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v19 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301C5D0(char a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t v6 = *v2;
  uint64_t v26 = &type metadata for FeatureFlag;
  unint64_t v27 = sub_243012508();
  LOBYTE(aBlock[0]) = 0;
  char v7 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    id v9 = (void *)v2[2];
    unint64_t v27 = (unint64_t)sub_24301FFC0;
    uint64_t v28 = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24301DDB0;
    uint64_t v26 = (ValueMetadata *)&block_descriptor_20;
    uint64_t v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
    _Block_release(v10);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v29, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0658);
    if (swift_dynamicCast())
    {
      uint64_t v23 = a2;
      uint64_t v30 = v24;
      LOBYTE(aBlock[0]) = a1;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_24301A3D4();
      uint64_t v12 = sub_243039400();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v16 = v12;
        unint64_t v17 = v13;
        swift_release();
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v8;
        *(void *)(v18 + 24) = v6;
        swift_retain();
        v23(&v30, v16, v17, sub_243020188, v18);
        swift_release();
        swift_beginAccess();
        unsigned int v19 = *(unsigned __int16 *)(v8 + 16);
        if (v19 >> 8 <= 0xFE)
        {
          if ((v19 & 0x100) == 0)
          {
            sub_243014ACC(v16, v17);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
            return v19 & 1;
          }
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          *unint64_t v22 = v19;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          *unint64_t v20 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v16, v17);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *unint64_t v15 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    unsigned char *v14 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301C9D8@<X0>(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v28 = &type metadata for FeatureFlag;
  unint64_t v29 = sub_243012508();
  LOBYTE(aBlock[0]) = 0;
  char v7 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if ((v7 & 1) == 0)
  {
    sub_243019FB0();
    swift_allocError();
    unsigned char *v14 = 3;
    return swift_willThrow();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70428);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = -1;
  id v9 = (void *)v2[2];
  unint64_t v29 = (unint64_t)sub_243020080;
  uint64_t v30 = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24301DDB0;
  uint64_t v28 = (ValueMetadata *)&block_descriptor_14;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v11 = objc_msgSend(v9, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_243039720();
  swift_unknownObjectRelease();
  sub_2430155F0((uint64_t)v31, (uint64_t)aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v16 = 3;
    swift_willThrow();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  unint64_t v25 = a2;
  uint64_t v32 = v26;
  sub_243039420();
  swift_allocObject();
  sub_243039410();
  sub_243020088();
  uint64_t v12 = sub_243039400();
  if (!v3)
  {
    uint64_t v17 = v12;
    unint64_t v18 = v13;
    swift_release();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v8;
    *(void *)(v19 + 24) = v6;
    swift_retain();
    a1(&v32, v17, v18, sub_2430200DC, v19);
    swift_release();
    swift_beginAccess();
    int v20 = *(unsigned __int8 *)(v8 + 32);
    if (v20 == 255)
    {
      sub_243019FB0();
      swift_allocError();
      *uint64_t v21 = 0;
      swift_willThrow();
    }
    else
    {
      uint64_t v22 = *(void *)(v8 + 16);
      if ((v20 & 1) == 0)
      {
        unint64_t v23 = *(void *)(v8 + 24);
        sub_2430200E4(*(void *)(v8 + 16), v23);
        sub_243014ACC(v17, v18);
        swift_release();
        void *v25 = v22;
        v25[1] = v23;
LABEL_13:
        swift_unknownObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      }
      sub_243019FB0();
      swift_willThrowTypedImpl();
      swift_allocError();
      *uint64_t v24 = v22;
    }
    sub_243014ACC(v17, v18);
    swift_release();
    goto LABEL_13;
  }
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
}

uint64_t sub_24301CDDC(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))
{
  uint64_t v4 = *v1;
  uint64_t v24 = &type metadata for FeatureFlag;
  unint64_t v25 = sub_243012508();
  LOBYTE(aBlock[0]) = 0;
  char v5 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C05C8);
    uint64_t v6 = swift_allocObject();
    *(_WORD *)(v6 + 16) = -256;
    char v7 = (void *)v1[2];
    unint64_t v25 = (unint64_t)sub_24301FFC0;
    uint64_t v26 = v6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24301DDB0;
    uint64_t v24 = (ValueMetadata *)&block_descriptor_2;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v9 = objc_msgSend(v7, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);
    sub_243039720();
    swift_unknownObjectRelease();
    sub_2430155F0((uint64_t)v27, (uint64_t)aBlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70408);
    if (swift_dynamicCast())
    {
      uint64_t v21 = a1;
      uint64_t v28 = v22;
      sub_243039420();
      swift_allocObject();
      sub_243039410();
      sub_24301FFF4();
      uint64_t v10 = sub_243039400();
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v14 = v10;
        unint64_t v15 = v11;
        swift_release();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v6;
        *(void *)(v16 + 24) = v4;
        swift_retain();
        v21(&v28, v14, v15, sub_24302059C, v16);
        swift_release();
        swift_beginAccess();
        unsigned int v17 = *(unsigned __int16 *)(v6 + 16);
        if (v17 >> 8 <= 0xFE)
        {
          if ((v17 & 0x100) == 0)
          {
            sub_243014ACC(v14, v15);
            swift_release();
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
            return v17 & 1;
          }
          sub_243019FB0();
          swift_willThrowTypedImpl();
          swift_allocError();
          *int v20 = v17;
        }
        else
        {
          sub_243019FB0();
          swift_allocError();
          unsigned char *v18 = 0;
          swift_willThrow();
        }
        sub_243014ACC(v14, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_243019FB0();
      swift_allocError();
      *unint64_t v13 = 3;
      swift_willThrow();
      swift_release();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  else
  {
    sub_243019FB0();
    swift_allocError();
    *uint64_t v12 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_24301D1DC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24301D20C()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24301D214()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24301D244@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3 & 1;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_24301D258(uint64_t result)
{
  if (qword_268D70220 != -1) {
    unint64_t result = swift_once();
  }
  if (qword_268D78870)
  {
    uint64_t v2 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v2);
    return sub_24301ABC8(v1, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_243019DB8);
  }
  return result;
}

void sub_24301D350(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)sub_243039480();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_243038A9C;
  uint64_t v12[3] = &block_descriptor_65;
  unint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_recordImpressionWithAdvertisedItemID_intakeRequestData_reply_, a6, v10, v11);
  _Block_release(v11);
}

uint64_t sub_24301D434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1;
  if (qword_268D70220 != -1) {
    a1 = swift_once();
  }
  if (qword_268D78870)
  {
    uint64_t v7 = MEMORY[0x270FA5388](a1);
    v11[6] = v5;
    v11[7] = a2;
    MEMORY[0x270FA5388](v7);
    void v11[2] = sub_24301F518;
    v11[3] = v8;
    return sub_24301AFDC(v3, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_24301A7C0, (uint64_t)v11, a3);
  }
  else
  {
    uint64_t v10 = sub_243039460();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a3, 1, 1, v10);
  }
}

void sub_24301D580(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70070);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = (void *)sub_243039480();
  sub_2430204C8(a7, (uint64_t)v14, &qword_268D70070);
  uint64_t v16 = sub_243039460();
  uint64_t v17 = *(void *)(v16 - 8);
  unint64_t v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16) != 1)
  {
    unint64_t v18 = (void *)sub_243039450();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243038A9C;
  void aBlock[3] = &block_descriptor_56;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_processReengagementWithAdvertisedItemID_intakeRequestData_reengagementURL_reply_, a6, v15, v18, v19);
  _Block_release(v19);
}

uint64_t sub_24301D76C()
{
  uint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_24301D7C0(char a1)
{
  if (a1) {
    return 0x6B63696C63;
  }
  else {
    return 2003134838;
  }
}

uint64_t sub_24301D7EC(char *a1, char *a2)
{
  return sub_243024438(*a1, *a2);
}

uint64_t sub_24301D7F8()
{
  return sub_243039A60();
}

uint64_t sub_24301D870()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24301D8D4()
{
  return sub_243039A60();
}

uint64_t sub_24301D948@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2430397D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24301D9A8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 2003134838;
  if (*v1) {
    uint64_t v2 = 0x6B63696C63;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_24301D9DC()
{
  return sub_2430395F0();
}

uint64_t sub_24301DA3C()
{
  return sub_2430395E0();
}

uint64_t sub_24301DA8C()
{
  uint64_t v1 = 0x7463617265746E69;
  if (*v0 != 1) {
    uint64_t v1 = 0x7542746E65696C63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4A746361706D6F63;
  }
}

uint64_t sub_24301DB04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24301F5C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24301DB2C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24301DB38(uint64_t a1)
{
  unint64_t v2 = sub_24301F520();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24301DB74(uint64_t a1)
{
  unint64_t v2 = sub_24301F520();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24301DBB0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D703C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24301F520();
  sub_243039A90();
  v10[15] = 0;
  sub_243039970();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + 16);
    v10[13] = 1;
    sub_24301F574();
    sub_2430399A0();
    v10[12] = 2;
    sub_243039970();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_24301DD50@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24301F774(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_24301DD98(void *a1)
{
  return sub_24301DBB0(a1);
}

void sub_24301DDB0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24301DE18()
{
  sub_2430393F0();
  swift_allocObject();
  sub_2430393E0();
  __swift_instantiateConcreteTypeFromMangledName(qword_26B0C0540);
  sub_243020414(&qword_26B0C0538, qword_26B0C0540);
  sub_2430393D0();
  swift_release();
  if (v3) {
    int v0 = v2;
  }
  else {
    int v0 = v2 & 1;
  }
  return v0 | (v3 << 8);
}

uint64_t sub_24301E0D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70480);
  MEMORY[0x270FA5388](v2);
  id v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D704A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v12[-v9];
  sub_2430393F0();
  swift_allocObject();
  sub_2430393E0();
  sub_243020414(&qword_268D704A8, &qword_268D704A0);
  sub_2430393D0();
  swift_release();
  sub_243020464((uint64_t)v10, (uint64_t)v8, &qword_268D704A0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    *id v4 = *v8;
  }
  else {
    sub_243020464((uint64_t)v8, (uint64_t)v4, &qword_268D70070);
  }
  swift_storeEnumTagMultiPayload();
  return sub_243020464((uint64_t)v4, a1, &qword_268D70480);
}

uint64_t sub_24301E4BC@<X0>(uint64_t a1@<X8>)
{
  sub_2430393F0();
  swift_allocObject();
  sub_2430393E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70438);
  sub_243020414(&qword_268D70440, &qword_268D70438);
  sub_2430393D0();
  uint64_t result = swift_release();
  unint64_t v3 = (unint64_t)v5;
  uint64_t v4 = v6;
  if (v7)
  {
    unint64_t v3 = v5;
    uint64_t v4 = 0;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v7;
  return result;
}

uint64_t sub_24301E794()
{
  sub_2430393F0();
  swift_allocObject();
  sub_2430393E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D70418);
  sub_243020414(&qword_268D70420, &qword_268D70418);
  sub_2430393D0();
  swift_release();
  if (v3) {
    int v0 = v2;
  }
  else {
    int v0 = v2 & 1;
  }
  return v0 | (v3 << 8);
}

uint64_t sub_24301EA50(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70478);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  char v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70480);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_243039520();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B0C16E8);
  MEMORY[0x245672840](a1);
  MEMORY[0x245672840](a1);
  unint64_t v15 = sub_243039500();
  os_log_type_t v16 = sub_2430396C0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v27 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v7;
    unint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v28 = v9;
    int v20 = (void *)v19;
    unint64_t v29 = v13;
    *(_DWORD *)unint64_t v18 = 138543362;
    MEMORY[0x245672840](a1);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v31 = v21;
    a2 = v27;
    uint64_t v13 = v29;
    sub_2430396F0();
    *int v20 = v21;

    _os_log_impl(&dword_243006000, v15, v16, "Error fetching synchronous remote object proxy: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    uint64_t v22 = v20;
    uint64_t v9 = v28;
    MEMORY[0x245672970](v22, -1, -1);
    unint64_t v23 = v18;
    char v7 = v30;
    MEMORY[0x245672970](v23, -1, -1);
  }
  else
  {
  }
  *uint64_t v13 = 3;
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = a2 + *(void *)(*(void *)a2 + 104);
  swift_beginAccess();
  sub_2430204C8(v24, (uint64_t)v9, &qword_268D70478);
  int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  uint64_t result = sub_24300C38C((uint64_t)v9, &qword_268D70478);
  if (v25 == 1)
  {
    sub_2430204C8((uint64_t)v13, (uint64_t)v7, &qword_268D70480);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    swift_beginAccess();
    sub_2430203AC((uint64_t)v7, v24);
    swift_endAccess();
    return sub_24300C38C((uint64_t)v13, &qword_268D70480);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24301EE20(void *a1, uint64_t a2)
{
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_243039520();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B0C16E8);
  MEMORY[0x245672840](a1);
  MEMORY[0x245672840](a1);
  uint64_t v5 = sub_243039500();
  os_log_type_t v6 = sub_2430396C0();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138543362;
    MEMORY[0x245672840](a1);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_2430396F0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_243006000, v5, v6, "Error fetching synchronous remote object proxy: %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v8, -1, -1);
    MEMORY[0x245672970](v7, -1, -1);
  }
  else
  {
  }
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 17) == 255) {
    *(_WORD *)(a2 + 16) = 259;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_24301F008(void *a1, uint64_t a2)
{
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_243039520();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B0C16E8);
  MEMORY[0x245672840](a1);
  MEMORY[0x245672840](a1);
  uint64_t v5 = sub_243039500();
  os_log_type_t v6 = sub_2430396C0();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)char v7 = 138543362;
    MEMORY[0x245672840](a1);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_2430396F0();
    *uint64_t v8 = v12;

    _os_log_impl(&dword_243006000, v5, v6, "Error fetching synchronous remote object proxy: %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D70050);
    swift_arrayDestroy();
    MEMORY[0x245672970](v8, -1, -1);
    MEMORY[0x245672970](v7, -1, -1);
  }
  else
  {
  }
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 32) == 255)
  {
    uint64_t v10 = *(void *)(a2 + 16);
    unint64_t v11 = *(void *)(a2 + 24);
    *(_OWORD *)(a2 + 16) = xmmword_24303B750;
    *(unsigned char *)(a2 + 32) = 1;
    return sub_243020150(v10, v11, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24301F204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70478);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  char v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70480);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24301E0D4((uint64_t)v13);
  uint64_t v14 = a3 + *(void *)(*(void *)a3 + 104);
  swift_beginAccess();
  sub_2430204C8(v14, (uint64_t)v9, &qword_268D70478);
  int v15 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  uint64_t result = sub_24300C38C((uint64_t)v9, &qword_268D70478);
  if (v15 == 1)
  {
    sub_2430204C8((uint64_t)v13, (uint64_t)v7, &qword_268D70480);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    swift_beginAccess();
    sub_2430203AC((uint64_t)v7, v14);
    swift_endAccess();
    return sub_24300C38C((uint64_t)v13, &qword_268D70480);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24301F430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24301E4BC((uint64_t)v10);
  uint64_t v4 = v10[0];
  uint64_t v5 = v10[1];
  char v6 = v11;
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 32) == 255)
  {
    uint64_t v8 = *(void *)(a3 + 16);
    unint64_t v9 = *(void *)(a3 + 24);
    *(void *)(a3 + 16) = v4;
    *(void *)(a3 + 24) = v5;
    *(unsigned char *)(a3 + 32) = v6;
    return sub_243020150(v8, v9, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24301F4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v4 = sub_24301DE18();
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 17) == 255) {
    *(_WORD *)(a3 + 16) = v4 & 0x1FF;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_24301F510(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24301D350(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

void sub_24301F518(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24301D580(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

unint64_t sub_24301F520()
{
  unint64_t result = qword_268D703D0;
  if (!qword_268D703D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703D0);
  }
  return result;
}

unint64_t sub_24301F574()
{
  unint64_t result = qword_268D703D8;
  if (!qword_268D703D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703D8);
  }
  return result;
}

uint64_t sub_24301F5C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4A746361706D6F63 && a2 == 0xEA00000000005357;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617265746E69 && a2 == 0xEF657079546E6F69 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24301F774@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70468);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24301F520();
  sub_243039A80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v23 = 0;
  uint64_t v9 = sub_243039880();
  uint64_t v11 = v10;
  char v21 = 1;
  sub_2430202F4();
  swift_bridgeObjectRetain();
  sub_2430398B0();
  int v19 = v22;
  char v20 = 2;
  uint64_t v12 = sub_243039880();
  uint64_t v14 = v13;
  int v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v14;
  return result;
}

unint64_t sub_24301F9D4()
{
  unint64_t result = qword_268D703E0;
  if (!qword_268D703E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703E0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppImpressionHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ImpressionIntakeRequest()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImpressionIntakeRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImpressionIntakeRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest()
{
  return &type metadata for ImpressionIntakeRequest;
}

unsigned char *storeEnumTagSinglePayload for ImpressionIntakeRequest.InteractionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24301FD28);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.InteractionType()
{
  return &type metadata for ImpressionIntakeRequest.InteractionType;
}

unsigned char *storeEnumTagSinglePayload for ImpressionIntakeRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24301FE2CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.CodingKeys()
{
  return &type metadata for ImpressionIntakeRequest.CodingKeys;
}

unint64_t sub_24301FE68()
{
  unint64_t result = qword_268D703E8;
  if (!qword_268D703E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703E8);
  }
  return result;
}

unint64_t sub_24301FEC0()
{
  unint64_t result = qword_268D703F0;
  if (!qword_268D703F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703F0);
  }
  return result;
}

unint64_t sub_24301FF18()
{
  unint64_t result = qword_268D703F8;
  if (!qword_268D703F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D703F8);
  }
  return result;
}

unint64_t sub_24301FF6C()
{
  unint64_t result = qword_268D70400;
  if (!qword_268D70400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70400);
  }
  return result;
}

uint64_t sub_24301FFC0(void *a1)
{
  return sub_24301EE20(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_24301FFF4()
{
  unint64_t result = qword_268D70410;
  if (!qword_268D70410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70410);
  }
  return result;
}

uint64_t sub_243020048()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_243020080(void *a1)
{
  return sub_24301F008(a1, v1);
}

unint64_t sub_243020088()
{
  unint64_t result = qword_268D70430;
  if (!qword_268D70430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70430);
  }
  return result;
}

uint64_t sub_2430200DC(uint64_t a1, uint64_t a2)
{
  return sub_24301F430(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2430200E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2430200F8(a1, a2);
  }
  return a1;
}

uint64_t sub_2430200F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_243020150(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_243020168(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_243020168(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_243020174(a1, a2);
  }
  return a1;
}

uint64_t sub_243020174(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_243014ACC(a1, a2);
  }
  return a1;
}

uint64_t sub_243020188(uint64_t a1, uint64_t a2)
{
  return sub_24301F4A8(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_2430201A4()
{
  unint64_t result = qword_268D70448;
  if (!qword_268D70448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70448);
  }
  return result;
}

unint64_t sub_2430201F8()
{
  unint64_t result = qword_268D70450;
  if (!qword_268D70450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70450);
  }
  return result;
}

unint64_t sub_24302024C()
{
  unint64_t result = qword_268D70458;
  if (!qword_268D70458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70458);
  }
  return result;
}

unint64_t sub_2430202A0()
{
  unint64_t result = qword_268D70460;
  if (!qword_268D70460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70460);
  }
  return result;
}

unint64_t sub_2430202F4()
{
  unint64_t result = qword_268D70470;
  if (!qword_268D70470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70470);
  }
  return result;
}

uint64_t sub_243020348(void *a1)
{
  return sub_24301EA50(a1, v1);
}

unint64_t sub_243020350()
{
  unint64_t result = qword_268D70498;
  if (!qword_268D70498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70498);
  }
  return result;
}

uint64_t sub_2430203A4(uint64_t a1, uint64_t a2)
{
  return sub_24301F204(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2430203AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_243020414(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_243020464(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2430204C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2430205A0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_2430205B4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_2430205C8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  uint64_t v11 = *a1;
  uint64_t v12 = (void *)sub_243039480();
  v14[4] = a4;
  v14[5] = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_243038A9C;
  v14[3] = a6;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, *a7, v12, v13);
  _Block_release(v13);
}

uint64_t sub_2430206A0(uint64_t result)
{
  uint64_t v1 = (long long *)result;
  if (qword_268D701B8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_268D78758) {
    return sub_24301B550(v1, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_2430205A0);
  }
  return result;
}

uint64_t sub_243020734(uint64_t result)
{
  uint64_t v1 = (long long *)result;
  if (qword_268D701B8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_268D78758) {
    return sub_24301B984(v1, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_2430205B4);
  }
  return result;
}

uint64_t sub_2430207C8(uint64_t result)
{
  if (qword_268D701B8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_268D78758)
  {
    uint64_t v1 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v1);
    return sub_24301BDA8((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_243019DB8);
  }
  return result;
}

void sub_2430208C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)sub_243039530();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  void v10[2] = sub_243038A9C;
  v10[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_clearBiomeWithClearEvent_reply_, v8, v9);
  _Block_release(v9);
}

void sub_2430209A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_2430209A8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_2430209B4()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_2430209C0()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_2430209F0()
{
  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t sub_243020A10()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_243020A1C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_243020A4C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_243020A7C()
{
  return *(void *)(v0 + 120);
}

uint64_t sub_243020A88()
{
  return *(void *)(v0 + 136);
}

__n128 sub_243020A94@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11, uint64_t a12, char a13, long long a14, __n128 a15, uint64_t a16, char a17, uint64_t a18, char a19)
{
  __n128 result = a15;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(unsigned char *)(a9 + 24) = a4 & 1;
  *(void *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 40) = a6 & 1;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_DWORD *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 68) = a11 & 1;
  *(void *)(a9 + 72) = a12;
  *(unsigned char *)(a9 + 80) = a13 & 1;
  *(_OWORD *)(a9 + 88) = a14;
  *(__n128 *)(a9 + 104) = a15;
  *(void *)(a9 + 120) = a16;
  *(unsigned char *)(a9 + 128) = a17 & 1;
  *(void *)(a9 + 136) = a18;
  *(unsigned char *)(a9 + 144) = a19 & 1;
  return result;
}

unint64_t sub_243020B3C(char a1)
{
  unint64_t result = 0x69737265766E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x726F7774654E6461;
      break;
    case 4:
      unint64_t result = 0x4449656372756F73;
      break;
    case 5:
      unint64_t result = 0x656873696C627570;
      break;
    case 6:
      unint64_t result = 0x6C7074656B72616DLL;
      break;
    case 7:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 8:
      unint64_t result = 0x6973736572706D69;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_243020C94()
{
  return sub_243020B3C(*v0);
}

uint64_t sub_243020C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2430217D8(a1, a2);
  *a3 = result;
  return result;
}

void sub_243020CC4(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_243020CD0(uint64_t a1)
{
  unint64_t v2 = sub_24302100C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243020D0C(uint64_t a1)
{
  unint64_t v2 = sub_24302100C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243020D48(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D704B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302100C();
  sub_243039A90();
  v11[15] = 0;
  sub_243039900();
  if (!v2)
  {
    v11[14] = 1;
    sub_243039960();
    v11[13] = 2;
    sub_243039920();
    v11[12] = 3;
    sub_243039900();
    char v9 = *(unsigned char *)(v3 + 68);
    v11[11] = 4;
    void v11[8] = v9;
    sub_243039950();
    v11[7] = 5;
    sub_243039960();
    v11[6] = 6;
    sub_243039900();
    v11[5] = 7;
    sub_243039900();
    v11[4] = 8;
    sub_243039910();
    v11[3] = 9;
    sub_243039910();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24302100C()
{
  unint64_t result = qword_268D704B8;
  if (!qword_268D704B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704B8);
  }
  return result;
}

double sub_243021060@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_243021C9C(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(unsigned char *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_2430210D4(void *a1)
{
  return sub_243020D48(a1);
}

uint64_t sub_2430210EC()
{
  return *(void *)v0;
}

uint64_t sub_2430210F8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_243021128()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_243021158()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_243021164()
{
  return *(void *)(v0 + 64);
}

uint64_t sub_243021170()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_24302117C()
{
  return *(void *)(v0 + 96);
}

uint64_t sub_243021188@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  *(void *)a9 = result;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 56) = a8 & 1;
  *(void *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 72) = a11 & 1;
  *(void *)(a9 + 80) = a12;
  *(unsigned char *)(a9 + 88) = a13 & 1;
  *(void *)(a9 + 96) = a14;
  *(unsigned char *)(a9 + 104) = a15 & 1;
  return result;
}

unint64_t sub_2430211E8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x69737265766E6F63;
      break;
    case 2:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 3:
      unint64_t result = 0x6843746E756F6D61;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0xD000000000000021;
      break;
    case 6:
      unint64_t result = 0x6573616863727570;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2430212F4()
{
  return sub_2430211E8(*v0);
}

uint64_t sub_2430212FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24302238C(a1, a2);
  *a3 = result;
  return result;
}

void sub_243021324(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_243021330(uint64_t a1)
{
  unint64_t v2 = sub_243022338();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302136C(uint64_t a1)
{
  unint64_t v2 = sub_243022338();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430213A8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D704C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243022338();
  sub_243039A90();
  v8[15] = 0;
  sub_243039960();
  if (!v1)
  {
    v8[14] = 1;
    sub_243039900();
    v8[13] = 2;
    sub_243039900();
    v8[12] = 3;
    sub_243039940();
    v8[11] = 4;
    sub_243039920();
    v8[10] = 5;
    sub_243039920();
    v8[9] = 6;
    sub_243039910();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

__n128 sub_2430215E4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2430226B0(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v8[0];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 89) = *(_OWORD *)((char *)v8 + 9);
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_243021638(void *a1)
{
  return sub_2430213A8(a1);
}

uint64_t sub_243021650(uint64_t a1)
{
  unint64_t v2 = sub_243022ABC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302168C(uint64_t a1)
{
  unint64_t v2 = sub_243022ABC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430216C8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D704D0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243022ABC();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2430217D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69737265766E6F63 && a2 == 0xEC00000044496E6FLL;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024303F460 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEE00657079546E6FLL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726F7774654E6461 && a2 == 0xEB0000000044496BLL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4449656372756F73 && a2 == 0xE800000000000000 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656873696C627570 && a2 == 0xEF44496D65744972 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C7074656B72616DLL && a2 == 0xED00004449656361 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEC0000004449746ELL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6973736572706D69 && a2 == 0xEE00657461446E6FLL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEE00657461446E6FLL)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_243021C9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70528);
  uint64_t v5 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302100C();
  sub_243039A80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v8 = v5;
  uint64_t v60 = a2;
  LOBYTE(v72[0]) = 0;
  uint64_t v9 = sub_243039800();
  uint64_t v11 = v10;
  LOBYTE(v72[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_243039870();
  uint64_t v57 = v9;
  uint64_t v58 = v12;
  char v94 = v13 & 1;
  LOBYTE(v72[0]) = 2;
  LODWORD(v9) = v13;
  uint64_t v14 = sub_243039830();
  int v55 = v9;
  uint64_t v56 = v14;
  char v93 = v15 & 1;
  LOBYTE(v72[0]) = 3;
  LODWORD(v9) = v15;
  uint64_t v16 = sub_243039800();
  int v53 = v9;
  uint64_t v54 = v16;
  LOBYTE(v72[0]) = 4;
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_243039860();
  uint64_t v59 = v18;
  unint64_t v52 = v19;
  uint64_t v20 = HIDWORD(v19) & 1;
  char v95 = BYTE4(v19) & 1;
  LOBYTE(v72[0]) = 5;
  uint64_t v21 = sub_243039870();
  uint64_t v49 = v20;
  uint64_t v50 = v21;
  char v92 = v22 & 1;
  LOBYTE(v72[0]) = 6;
  LODWORD(v20) = v22;
  uint64_t v23 = sub_243039800();
  uint64_t v51 = v24;
  int v45 = v20;
  uint64_t v46 = v23;
  LOBYTE(v72[0]) = 7;
  swift_bridgeObjectRetain();
  uint64_t v47 = 0;
  uint64_t v44 = sub_243039800();
  LOBYTE(v72[0]) = 8;
  uint64_t v48 = v25;
  swift_bridgeObjectRetain();
  uint64_t v43 = sub_243039820();
  int v42 = v26 & 1;
  char v91 = v26 & 1;
  char v96 = 9;
  uint64_t v27 = sub_243039820();
  char v29 = v28;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v61);
  char v30 = v29 & 1;
  char v90 = v29 & 1;
  *(void *)&long long v62 = v57;
  *((void *)&v62 + 1) = v11;
  uint64_t v31 = v59;
  *(void *)&long long v63 = v58;
  BYTE8(v63) = v55 & 1;
  *(void *)&long long v64 = v56;
  BYTE8(v64) = v53 & 1;
  *(void *)&long long v65 = v54;
  *((void *)&v65 + 1) = v59;
  uint64_t v32 = v51;
  LODWORD(v66) = v52;
  uint64_t v33 = v50;
  BYTE4(v66) = v49;
  *((void *)&v66 + 1) = v50;
  LOBYTE(v67) = v45 & 1;
  *((void *)&v67 + 1) = v46;
  *(void *)&long long v68 = v51;
  uint64_t v34 = v48;
  *((void *)&v68 + 1) = v44;
  *(void *)&long long v69 = v48;
  *((void *)&v69 + 1) = v43;
  LOBYTE(v70) = v42;
  *((void *)&v70 + 1) = v27;
  char v71 = v30;
  sub_2430237BC((uint64_t)&v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v72[0] = v57;
  v72[1] = v11;
  v72[2] = v58;
  char v73 = v94;
  uint64_t v74 = v56;
  char v75 = v93;
  uint64_t v76 = v54;
  uint64_t v77 = v31;
  int v78 = v52;
  char v79 = v95;
  uint64_t v80 = v33;
  char v81 = v92;
  uint64_t v82 = v46;
  uint64_t v83 = v32;
  uint64_t v84 = v44;
  uint64_t v85 = v34;
  uint64_t v86 = v43;
  char v87 = v91;
  uint64_t v88 = v27;
  char v89 = v90;
  uint64_t result = sub_243023814((uint64_t)v72);
  long long v36 = v69;
  uint64_t v37 = v60;
  *(_OWORD *)(v60 + 96) = v68;
  *(_OWORD *)(v37 + 112) = v36;
  *(_OWORD *)(v37 + 128) = v70;
  *(unsigned char *)(v37 + 144) = v71;
  long long v38 = v65;
  *(_OWORD *)(v37 + 32) = v64;
  *(_OWORD *)(v37 + 48) = v38;
  long long v39 = v67;
  *(_OWORD *)(v37 + 64) = v66;
  *(_OWORD *)(v37 + 80) = v39;
  long long v40 = v63;
  *(_OWORD *)uint64_t v37 = v62;
  *(_OWORD *)(v37 + 16) = v40;
  return result;
}

unint64_t sub_243022338()
{
  unint64_t result = qword_268D704C8;
  if (!qword_268D704C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704C8);
  }
  return result;
}

uint64_t sub_24302238C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024303F460 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEC00000044496E6FLL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEC0000004449746ELL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6843746E756F6D61 && a2 == 0xED00006465677261 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024303F480 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x800000024303F4A0 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_2430226B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70520);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243022338();
  sub_243039A80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v46 = 0;
  uint64_t v9 = sub_243039870();
  char v11 = v10;
  uint64_t v39 = v9;
  char v45 = 1;
  uint64_t v12 = sub_243039800();
  uint64_t v14 = v13;
  uint64_t v37 = v12;
  char v44 = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_243039800();
  uint64_t v38 = v16;
  uint64_t v34 = v15;
  uint64_t v36 = v14;
  char v43 = 3;
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  uint64_t v17 = sub_243039850();
  int v32 = v18;
  uint64_t v33 = v17;
  char v42 = 4;
  uint64_t v19 = sub_243039830();
  int v31 = v20;
  char v41 = 5;
  uint64_t v21 = sub_243039830();
  HIDWORD(v29) = v22;
  uint64_t v30 = v21;
  char v40 = 6;
  uint64_t v23 = sub_243039820();
  LODWORD(v35) = v24;
  uint64_t v25 = v23;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  uint64_t v26 = v38;
  swift_bridgeObjectRelease();
  uint64_t v27 = v36;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v39;
  *(unsigned char *)(a2 + 8) = v11 & 1;
  *(void *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v34;
  *(void *)(a2 + 40) = v26;
  *(void *)(a2 + 48) = v33;
  *(unsigned char *)(a2 + 56) = v32 & 1;
  *(void *)(a2 + 64) = v19;
  *(unsigned char *)(a2 + 72) = v31 & 1;
  *(void *)(a2 + 80) = v30;
  *(unsigned char *)(a2 + 88) = BYTE4(v29) & 1;
  *(void *)(a2 + 96) = v25;
  *(unsigned char *)(a2 + 104) = v35 & 1;
  return result;
}

unint64_t sub_243022ABC()
{
  unint64_t result = qword_268D704D8;
  if (!qword_268D704D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest()
{
  return &type metadata for BiomeEventRequest;
}

uint64_t destroy for BiomeEventRequest.ConversionEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  int v5 = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = v5;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v8 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v6 = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v8;
  uint64_t v9 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v9;
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeEventRequest.ConversionEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 145)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeEventRequest.ConversionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.ConversionEvent()
{
  return &type metadata for BiomeEventRequest.ConversionEvent;
}

uint64_t destroy for BiomeEventRequest.PurchaseEvent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v5;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[6];
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = a2[8];
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = a2[12];
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 96) = v8;
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 105)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 105) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 105) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.PurchaseEvent()
{
  return &type metadata for BiomeEventRequest.PurchaseEvent;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.CodingKeys()
{
  return &type metadata for BiomeEventRequest.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x243023330);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.PurchaseEvent.CodingKeys()
{
  return &type metadata for BiomeEventRequest.PurchaseEvent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BiomeEventRequest.ConversionEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BiomeEventRequest.ConversionEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *__n128 result = a2 + 9;
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
        JUMPOUT(0x2430234C4);
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
          *__n128 result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.ConversionEvent.CodingKeys()
{
  return &type metadata for BiomeEventRequest.ConversionEvent.CodingKeys;
}

unint64_t sub_243023500()
{
  unint64_t result = qword_268D704E0;
  if (!qword_268D704E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704E0);
  }
  return result;
}

unint64_t sub_243023558()
{
  unint64_t result = qword_268D704E8;
  if (!qword_268D704E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704E8);
  }
  return result;
}

unint64_t sub_2430235B0()
{
  unint64_t result = qword_268D704F0;
  if (!qword_268D704F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704F0);
  }
  return result;
}

unint64_t sub_243023608()
{
  unint64_t result = qword_268D704F8;
  if (!qword_268D704F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D704F8);
  }
  return result;
}

unint64_t sub_243023660()
{
  unint64_t result = qword_268D70500;
  if (!qword_268D70500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70500);
  }
  return result;
}

unint64_t sub_2430236B8()
{
  unint64_t result = qword_268D70508;
  if (!qword_268D70508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70508);
  }
  return result;
}

unint64_t sub_243023710()
{
  unint64_t result = qword_268D70510;
  if (!qword_268D70510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70510);
  }
  return result;
}

unint64_t sub_243023768()
{
  unint64_t result = qword_268D70518;
  if (!qword_268D70518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70518);
  }
  return result;
}

uint64_t sub_2430237BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_243023814(uint64_t a1)
{
  return a1;
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2430238A4()
{
  uint64_t result = sub_2430238E8();
  qword_26B0C16E0 = result;
  return result;
}

uint64_t type metadata accessor for TokenHandoffServiceConnection()
{
  return self;
}

uint64_t sub_2430238E8()
{
  int v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_243012508();
  LOBYTE(v15) = 0;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
    uint64_t v2 = (void *)sub_243039530();
    id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v15);

    unsigned int v4 = self;
    id v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F8841D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    id v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F884910);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    unint64_t v19 = (unint64_t)sub_243011F60;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    int v18 = (ValueMetadata *)&block_descriptor_4;
    int v8 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_243011FB0;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    int v18 = (ValueMetadata *)&block_descriptor_6_0;
    uint64_t v9 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for TokenHandoffServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_26B0C0678 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_243039520();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B0C16E8);
    uint64_t v12 = sub_243039500();
    os_log_type_t v13 = sub_2430396C0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_243006000, v12, v13, "Service feature flag is not enabled", v14, 2u);
      MEMORY[0x245672970](v14, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_243023C4C()
{
  return sub_2430241B4(&qword_26B0C0678, (uint64_t)qword_26B0C16E8);
}

void *sub_243023C70()
{
  return &unk_265177580;
}

unint64_t sub_243023C7C()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_243023C98(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78760);
}

uint64_t sub_243023CB8()
{
  return sub_2430241B4(&qword_268D701C0, (uint64_t)qword_268D78760);
}

uint64_t sub_243023CDC@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701C0, (uint64_t)qword_268D78760, a1);
}

uint64_t sub_243023D00(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78778);
}

uint64_t sub_243023D24()
{
  return sub_2430241B4(&qword_268D701C8, (uint64_t)qword_268D78778);
}

uint64_t sub_243023D48@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701C8, (uint64_t)qword_268D78778, a1);
}

uint64_t sub_243023D6C(uint64_t a1)
{
  return sub_243024118(a1, qword_26B0C16E8);
}

uint64_t sub_243023D84@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_26B0C0678, (uint64_t)qword_26B0C16E8, a1);
}

uint64_t sub_243023DA8(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78790);
}

uint64_t sub_243023DC8()
{
  return sub_2430241B4(&qword_268D701D0, (uint64_t)qword_268D78790);
}

uint64_t sub_243023DEC@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701D0, (uint64_t)qword_268D78790, a1);
}

uint64_t sub_243023E10(uint64_t a1)
{
  return sub_243024118(a1, qword_268D787A8);
}

uint64_t sub_243023E2C()
{
  return sub_2430241B4(&qword_268D701D8, (uint64_t)qword_268D787A8);
}

uint64_t sub_243023E50@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701D8, (uint64_t)qword_268D787A8, a1);
}

uint64_t sub_243023E74(uint64_t a1)
{
  return sub_243024118(a1, qword_268D787C0);
}

uint64_t sub_243023E8C()
{
  return sub_2430241B4(&qword_268D701E0, (uint64_t)qword_268D787C0);
}

uint64_t sub_243023EB0@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701E0, (uint64_t)qword_268D787C0, a1);
}

uint64_t sub_243023ED4(uint64_t a1)
{
  return sub_243024118(a1, qword_268D787D8);
}

uint64_t sub_243023EF8()
{
  return sub_2430241B4(&qword_268D701E8, (uint64_t)qword_268D787D8);
}

uint64_t sub_243023F1C@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701E8, (uint64_t)qword_268D787D8, a1);
}

uint64_t sub_243023F40(uint64_t a1)
{
  return sub_243024118(a1, qword_268D787F0);
}

uint64_t sub_243023F5C()
{
  return sub_2430241B4(&qword_268D701F0, (uint64_t)qword_268D787F0);
}

uint64_t sub_243023F80@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701F0, (uint64_t)qword_268D787F0, a1);
}

uint64_t sub_243023FA4(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78808);
}

uint64_t sub_243023FC4()
{
  return sub_2430241B4(&qword_268D701F8, (uint64_t)qword_268D78808);
}

uint64_t sub_243023FE8@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D701F8, (uint64_t)qword_268D78808, a1);
}

uint64_t sub_24302400C(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78820);
}

uint64_t sub_243024030()
{
  return sub_2430241B4(&qword_268D70200, (uint64_t)qword_268D78820);
}

uint64_t sub_243024054@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D70200, (uint64_t)qword_268D78820, a1);
}

uint64_t sub_243024078(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78838);
}

uint64_t sub_2430240A4()
{
  return sub_2430241B4(&qword_268D70208, (uint64_t)qword_268D78838);
}

uint64_t sub_2430240C8@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D70208, (uint64_t)qword_268D78838, a1);
}

uint64_t sub_2430240EC(uint64_t a1)
{
  return sub_243024118(a1, qword_268D78850);
}

uint64_t sub_243024118(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_243039520();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_243039510();
}

uint64_t sub_243024190()
{
  return sub_2430241B4(&qword_268D70210, (uint64_t)qword_268D78850);
}

uint64_t sub_2430241B4(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_243039520();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_243024208@<X0>(uint64_t a1@<X8>)
{
  return sub_24302422C(&qword_268D70210, (uint64_t)qword_268D78850, a1);
}

uint64_t sub_24302422C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_243039520();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for XPCServiceConnection()
{
  return self;
}

uint64_t sub_24302434C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 4931905;
    }
    else {
      uint64_t v3 = 1162891086;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE400000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 4931905;
      }
      else {
        uint64_t v6 = 1162891086;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE400000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 5129543;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 5129543)
  {
LABEL_21:
    char v8 = sub_2430399C0();
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

uint64_t sub_243024438(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6B63696C63;
  }
  else {
    uint64_t v3 = 2003134838;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6B63696C63;
  }
  else {
    uint64_t v5 = 2003134838;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2430244D4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 7827308;
    }
    else {
      uint64_t v3 = 0x6D756964656DLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 7827308;
      }
      else {
        uint64_t v6 = 0x6D756964656DLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
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
    uint64_t v3 = 1751607656;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1751607656)
  {
LABEL_21:
    char v8 = sub_2430399C0();
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

uint64_t sub_2430245C8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x800000024303EAD0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000019;
      uint64_t v6 = "publisher-item-identifier";
      goto LABEL_9;
    case 2:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "advertised-item-identifier";
      goto LABEL_9;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "source-identifier";
      goto LABEL_9;
    case 4:
      unint64_t v5 = 0x6D617473656D6974;
      unint64_t v3 = 0xE900000000000070;
      break;
    case 5:
      unint64_t v5 = 0x6973736572706D69;
      unint64_t v3 = 0xEF657079742D6E6FLL;
      break;
    case 6:
      uint64_t v6 = "ad-network-identifier";
      goto LABEL_9;
    case 7:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "eligible-for-re-engagement";
LABEL_9:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000024303EAD0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000019;
      char v8 = "publisher-item-identifier";
      goto LABEL_18;
    case 2:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "advertised-item-identifier";
      goto LABEL_18;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "source-identifier";
      goto LABEL_18;
    case 4:
      unint64_t v2 = 0x6D617473656D6974;
      unint64_t v7 = 0xE900000000000070;
      break;
    case 5:
      unint64_t v2 = 0x6973736572706D69;
      unint64_t v7 = 0xEF657079742D6E6FLL;
      break;
    case 6:
      char v8 = "ad-network-identifier";
      goto LABEL_18;
    case 7:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "eligible-for-re-engagement";
LABEL_18:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_2430247FC(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 6580587;
  }
  else {
    uint64_t v2 = 6777953;
  }
  if (a2) {
    uint64_t v3 = 6580587;
  }
  else {
    uint64_t v3 = 6777953;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_2430399C0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_24302486C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x69746375646F7270;
  }
  else {
    uint64_t v3 = 0x6D706F6C65766564;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000746E65;
  }
  else {
    unint64_t v4 = 0xEA00000000006E6FLL;
  }
  if (a2) {
    uint64_t v5 = 0x69746375646F7270;
  }
  else {
    uint64_t v5 = 0x6D706F6C65766564;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000006E6FLL;
  }
  else {
    unint64_t v6 = 0xEB00000000746E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2430399C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_243024920(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6F6C6E776F646572;
    }
    else {
      uint64_t v3 = 0x6761676E652D6572;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEA00000000006461;
    }
    else {
      unint64_t v4 = 0xED0000746E656D65;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6F6C6E776F646572;
      }
      else {
        uint64_t v6 = 0x6761676E652D6572;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEA00000000006461;
      }
      else {
        unint64_t v7 = 0xED0000746E656D65;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE800000000000000;
    uint64_t v3 = 0x64616F6C6E776F64;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE800000000000000;
  if (v3 != 0x64616F6C6E776F64)
  {
LABEL_21:
    char v8 = sub_2430399C0();
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

uint64_t sub_243024A5C()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243024B84()
{
  return sub_243039A60();
}

uint64_t sub_243024CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_243024CFC(char *a1, char *a2)
{
  return sub_2430247FC(*a1, *a2);
}

uint64_t sub_243024D08()
{
  return sub_243039A60();
}

uint64_t sub_243024D70()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243024DBC()
{
  return sub_243039A60();
}

uint64_t sub_243024E20@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2430397D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_243024E80(uint64_t *a1@<X8>)
{
  uint64_t v2 = 6777953;
  if (*v1) {
    uint64_t v2 = 6580587;
  }
  *a1 = v2;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_243024EA8()
{
  if (*v0) {
    return 6580587;
  }
  else {
    return 6777953;
  }
}

uint64_t sub_243024ECC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2430397D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_243024F30(uint64_t a1)
{
  unint64_t v2 = sub_2430268C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243024F6C(uint64_t a1)
{
  unint64_t v2 = sub_2430268C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243024FA8(void *a1)
{
  uint64_t result = sub_243025908(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_243024FD4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_243025908(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_243025004@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2430394E0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_24302506C()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 20));
}

uint64_t sub_243025090()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
}

uint64_t sub_2430250B4()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 28));
}

uint64_t sub_2430250D8()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 32));
}

uint64_t sub_2430250FC()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24302513C()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 44));
}

unint64_t sub_243025160(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 5:
      unint64_t result = 0x6973736572706D69;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_243025254(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 5:
      unint64_t result = 0x6973736572706D69;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_243025348(unsigned __int8 *a1, char *a2)
{
  return sub_2430245C8(*a1, *a2);
}

uint64_t sub_243025354()
{
  return sub_243024B84();
}

uint64_t sub_243025360()
{
  return sub_243024A5C();
}

uint64_t sub_243025368()
{
  return sub_243024B84();
}

uint64_t sub_243025370@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_243026878();
  *a1 = result;
  return result;
}

unint64_t sub_2430253A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_243025160(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2430253CC()
{
  return sub_243025254(*v0);
}

uint64_t sub_2430253D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_243026878();
  *a1 = result;
  return result;
}

void sub_2430253FC(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_243025408(uint64_t a1)
{
  unint64_t v2 = sub_243025B5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243025444(uint64_t a1)
{
  unint64_t v2 = sub_243025B5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243025480@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = sub_2430394E0();
  uint64_t v22 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70530);
  uint64_t v21 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = (int *)type metadata accessor for AppImpressionPayload();
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243025B5C();
  int v24 = v7;
  uint64_t v11 = v25;
  sub_243039A80();
  if (v11) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v12 = v22;
  char v33 = 0;
  sub_243025BB0();
  sub_2430398B0();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v5, v3);
  char v32 = 1;
  *(void *)&v10[v8[5]] = sub_2430398C0();
  char v31 = 2;
  *(void *)&v10[v8[6]] = sub_2430398C0();
  char v30 = 3;
  uint64_t v13 = sub_2430398A0();
  uint64_t v14 = v21;
  *(void *)&v10[v8[7]] = v13;
  char v29 = 4;
  *(void *)&v10[v8[8]] = sub_2430398C0();
  char v28 = 5;
  sub_243025C08();
  sub_2430398B0();
  char v27 = 6;
  uint64_t v15 = sub_243039880();
  uint64_t v16 = (uint64_t *)&v10[v8[10]];
  *uint64_t v16 = v15;
  v16[1] = v17;
  char v26 = 7;
  char v18 = sub_243039810();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v23);
  v10[v8[11]] = v18;
  sub_243025C5C((uint64_t)v10, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_243025CC0((uint64_t)v10);
}

uint64_t sub_2430258F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_243025480(a1, a2);
}

uint64_t sub_243025908(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70578);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2430268C4();
  sub_243039A80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_243039880();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_243039880();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t type metadata accessor for AppImpressionPayload()
{
  uint64_t result = qword_268D70550;
  if (!qword_268D70550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_243025B5C()
{
  unint64_t result = qword_268D70538;
  if (!qword_268D70538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70538);
  }
  return result;
}

unint64_t sub_243025BB0()
{
  unint64_t result = qword_268D70540;
  if (!qword_268D70540)
  {
    sub_2430394E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70540);
  }
  return result;
}

unint64_t sub_243025C08()
{
  unint64_t result = qword_268D70548;
  if (!qword_268D70548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70548);
  }
  return result;
}

uint64_t sub_243025C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243025CC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for AppImpressionHeader()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppImpressionHeader(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppImpressionHeader(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for AppImpressionHeader(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppImpressionHeader(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppImpressionHeader(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppImpressionHeader()
{
  return &type metadata for AppImpressionHeader;
}

void *sub_243025EF4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2430394E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    uint64_t v11 = a3[11];
    uint64_t v12 = (void *)((char *)a1 + v10);
    uint64_t v13 = (void *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_243025FFC(uint64_t a1)
{
  uint64_t v2 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_243026074(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  uint64_t v10 = a3[11];
  uint64_t v11 = (void *)(a1 + v9);
  uint64_t v12 = (void *)(a2 + v9);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24302612C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v7 = a3[10];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_243026204(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t sub_2430262B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2430394E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  void *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_243026370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243026384);
}

uint64_t sub_243026384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2430394E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 40) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_243026448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24302645C);
}

uint64_t sub_24302645C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2430394E0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24302651C()
{
  uint64_t result = sub_2430394E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppImpressionPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppImpressionPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x243026738);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppImpressionPayload.CodingKeys()
{
  return &type metadata for AppImpressionPayload.CodingKeys;
}

unint64_t sub_243026774()
{
  unint64_t result = qword_268D70560;
  if (!qword_268D70560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70560);
  }
  return result;
}

unint64_t sub_2430267CC()
{
  unint64_t result = qword_268D70568;
  if (!qword_268D70568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70568);
  }
  return result;
}

unint64_t sub_243026824()
{
  unint64_t result = qword_268D70570;
  if (!qword_268D70570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70570);
  }
  return result;
}

uint64_t sub_243026878()
{
  unint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

unint64_t sub_2430268C4()
{
  unint64_t result = qword_268D70580;
  if (!qword_268D70580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70580);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppImpressionHeader.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2430269E4);
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

ValueMetadata *type metadata accessor for AppImpressionHeader.CodingKeys()
{
  return &type metadata for AppImpressionHeader.CodingKeys;
}

unint64_t sub_243026A20()
{
  unint64_t result = qword_268D70588;
  if (!qword_268D70588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70588);
  }
  return result;
}

unint64_t sub_243026A78()
{
  unint64_t result = qword_268D70590;
  if (!qword_268D70590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70590);
  }
  return result;
}

unint64_t sub_243026AD0()
{
  unint64_t result = qword_268D70598;
  if (!qword_268D70598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70598);
  }
  return result;
}

uint64_t sub_243026B24()
{
  return sub_243027044((uint64_t)&unk_26F87FB40);
}

void *sub_243026B30()
{
  return &unk_26F87FB68;
}

uint64_t sub_243026B3C(char a1)
{
  if (!a1)
  {
    char v3 = 1;
LABEL_8:
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
  char v2 = sub_2430399C0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    if (a1 == 2) {
      char v3 = sub_2430399C0();
    }
    else {
      char v3 = 1;
    }
    goto LABEL_8;
  }
  char v3 = 1;
  return v3 & 1;
}

uint64_t sub_243026C6C(char a1)
{
  if (!a1) {
    return 0x64616F6C6E776F64;
  }
  if (a1 == 1) {
    return 0x6F6C6E776F646572;
  }
  return 0x6761676E652D6572;
}

uint64_t sub_243026CD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_243024920(*a1, *a2);
}

uint64_t sub_243026CE0()
{
  return sub_243039A60();
}

uint64_t sub_243026D94()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243026E34()
{
  return sub_243039A60();
}

uint64_t sub_243026EE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2430270B8();
  *a1 = result;
  return result;
}

void sub_243026F14(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xEA00000000006461;
  uint64_t v5 = 0x6F6C6E776F646572;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6761676E652D6572;
    unint64_t v4 = 0xED0000746E656D65;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x64616F6C6E776F64;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_243026F84()
{
  return sub_2430395F0();
}

uint64_t sub_243026FE4()
{
  return sub_2430395E0();
}

void sub_243027034(void *a1@<X8>)
{
  *a1 = &unk_26F87FBF8;
}

uint64_t sub_243027044(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_243027314();
  uint64_t result = sub_243039680();
  uint64_t v7 = result;
  if (v2)
  {
    unint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_24300EA9C(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_2430270B8()
{
  unint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_243027108()
{
  unint64_t result = qword_268D705A0;
  if (!qword_268D705A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705A0);
  }
  return result;
}

unint64_t sub_243027160()
{
  unint64_t result = qword_268D705A8;
  if (!qword_268D705A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D705B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705A8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ConversionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x243027288);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversionType()
{
  return &type metadata for ConversionType;
}

unint64_t sub_2430272C0()
{
  unint64_t result = qword_268D705B8;
  if (!qword_268D705B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705B8);
  }
  return result;
}

unint64_t sub_243027314()
{
  unint64_t result = qword_268D705C0;
  if (!qword_268D705C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705C0);
  }
  return result;
}

uint64_t sub_243027368()
{
  uint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_2430273BC(char *a1, char *a2)
{
  return sub_24302486C(*a1, *a2);
}

unint64_t sub_2430273CC()
{
  unint64_t result = qword_268D705C8;
  if (!qword_268D705C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705C8);
  }
  return result;
}

uint64_t sub_243027420()
{
  return sub_243039A60();
}

uint64_t sub_2430274B0()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24302752C()
{
  return sub_243039A60();
}

uint64_t sub_2430275B8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2430397D0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_243027618(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6D706F6C65766564;
  if (*v1) {
    uint64_t v2 = 0x69746375646F7270;
  }
  unint64_t v3 = 0xEB00000000746E65;
  if (*v1) {
    unint64_t v3 = 0xEA00000000006E6FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_243027664()
{
  return sub_2430395F0();
}

uint64_t sub_2430276C4()
{
  return sub_2430395E0();
}

unsigned char *storeEnumTagSinglePayload for SystemEnvironment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2430277E0);
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

ValueMetadata *type metadata accessor for SystemEnvironment()
{
  return &type metadata for SystemEnvironment;
}

unint64_t sub_243027818()
{
  unint64_t result = qword_268D705D0;
  if (!qword_268D705D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705D0);
  }
  return result;
}

uint64_t sub_24302786C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6(*a1);
}

uint64_t sub_243027898@<X0>(uint64_t a1@<X8>)
{
  return sub_24300FB24(v1, a1);
}

uint64_t sub_2430278A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_243028298(a1, a2, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
}

uint64_t sub_2430278D4(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2430278F4, 0, 0);
}

uint64_t sub_2430278F4()
{
  if (qword_26B0C0180 != -1) {
    swift_once();
  }
  if (qword_26B0C16E0)
  {
    uint64_t v1 = v0[2];
    uint64_t v2 = swift_task_alloc();
    v0[4] = v2;
    *(void *)(v2 + 16) = v1;
    uint64_t v3 = swift_task_alloc();
    v0[5] = v3;
    *(void *)(v3 + 16) = sub_243027D38;
    *(void *)(v3 + 24) = v2;
    int v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268D703A0 + dword_268D703A0);
    unsigned int v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    *unsigned int v4 = v0;
    v4[1] = sub_243027A68;
    uint64_t v5 = v0[3];
    return v8(v5, (uint64_t)sub_243019DB8, v3);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_243027A68()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243027BE8;
  }
  else {
    uint64_t v2 = sub_243027B7C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243027B7C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243027BE8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_243027C54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10 = (void *)sub_243039480();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_243038A9C;
  uint64_t v12[3] = &block_descriptor_5;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_processInAppPurchaseWithAppItemID_requestData_reply_, a6, v10, v11);
  _Block_release(v11);
}

void sub_243027D38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_243027C54(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

unint64_t sub_243027D40()
{
  return 0xD000000000000014;
}

uint64_t sub_243027D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243028C50(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243027D88(uint64_t a1)
{
  unint64_t v2 = sub_243027F60();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243027DC4(uint64_t a1)
{
  unint64_t v2 = sub_243027F60();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243027E00(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D705E0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243027F60();
  sub_243039A90();
  type metadata accessor for InAppPurchaseDetails();
  sub_243028254(&qword_268D705F0);
  sub_2430399A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_243027F60()
{
  unint64_t result = qword_268D705E8;
  if (!qword_268D705E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D705E8);
  }
  return result;
}

uint64_t sub_243027FB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  MEMORY[0x270FA5388](v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D705F8);
  uint64_t v14 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PurchaseIntakeRequest();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243027F60();
  sub_243039A80();
  if (!v2)
  {
    sub_243028254(&qword_268D70600);
    sub_2430398B0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_243028298(v15, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
    sub_243028298((uint64_t)v11, v13, (uint64_t (*)(void))type metadata accessor for PurchaseIntakeRequest);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for PurchaseIntakeRequest()
{
  uint64_t result = qword_268D70608;
  if (!qword_268D70608) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_243028254(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for InAppPurchaseDetails();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_243028298(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243028300@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_243027FB4(a1, a2);
}

uint64_t sub_243028318(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v9 = *(int *)(v4 + 28);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_2430394C0();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(unsigned char *)(a1 + *(int *)(v6 + 32)) = *((unsigned char *)a2 + *(int *)(v6 + 32));
    uint64_t v14 = *(int *)(v6 + 36);
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24302845C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 28);
  uint64_t v3 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2430284FC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v7 = v6[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2430394C0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v12 = v6[9];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2430285F0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = v4[7];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  *(unsigned char *)(a1 + v4[8]) = *(unsigned char *)(a2 + v4[8]);
  uint64_t v9 = v4[9];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  void *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24302873C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = v4[7];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(unsigned char *)(a1 + v4[8]) = *(unsigned char *)(a2 + v4[8]);
  *(_OWORD *)(a1 + v4[9]) = *(_OWORD *)(a2 + v4[9]);
  return a1;
}

uint64_t sub_243028800(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v7 = v6[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2430394C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v11 = v6[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2430288E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2430288F8);
}

uint64_t sub_2430288F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_243028964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243028978);
}

uint64_t sub_243028978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_2430289E8()
{
  uint64_t result = type metadata accessor for InAppPurchaseDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PurchaseIntakeRequest.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x243028B10);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntakeRequest.CodingKeys()
{
  return &type metadata for PurchaseIntakeRequest.CodingKeys;
}

unint64_t sub_243028B4C()
{
  unint64_t result = qword_268D70618;
  if (!qword_268D70618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70618);
  }
  return result;
}

unint64_t sub_243028BA4()
{
  unint64_t result = qword_268D70620;
  if (!qword_268D70620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70620);
  }
  return result;
}

unint64_t sub_243028BFC()
{
  unint64_t result = qword_268D70628;
  if (!qword_268D70628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70628);
  }
  return result;
}

uint64_t sub_243028C50(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000024303F5C0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_2430399C0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_243028CF0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a1;
  uint64_t v8 = (void *)sub_243039480();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  void v10[2] = sub_243038A9C;
  v10[3] = &block_descriptor_6;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_updateConversionValue_reply_, v8, v9);
  _Block_release(v9);
}

uint64_t sub_243028DCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_243028DD4(uint64_t result, char a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4)
{
  uint64_t v7 = result;
  if (qword_268D701B8 != -1) {
    unint64_t result = swift_once();
  }
  if (qword_268D78758) {
    return sub_24301C1A8(v7, a2, a3, a4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_243028CF0);
  }
  return result;
}

uint64_t sub_243028E88()
{
  uint64_t v1 = 0x5643657372616F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x7542746E65696C63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x5643656E6966;
  }
}

uint64_t sub_243028EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243029274(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_243028F14(uint64_t a1)
{
  unint64_t v2 = sub_24302914C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243028F50(uint64_t a1)
{
  unint64_t v2 = sub_24302914C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243028F8C(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  v12[1] = a5;
  int v13 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70630);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302914C();
  sub_243039A90();
  char v17 = 0;
  sub_243039990();
  if (!v5)
  {
    char v16 = v13;
    char v15 = 1;
    sub_2430291A0();
    sub_243039930();
    char v14 = 2;
    sub_243039970();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_24302914C()
{
  unint64_t result = qword_268D70638;
  if (!qword_268D70638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70638);
  }
  return result;
}

unint64_t sub_2430291A0()
{
  unint64_t result = qword_268D70640;
  if (!qword_268D70640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70640);
  }
  return result;
}

uint64_t sub_2430291F4(void *a1)
{
  uint64_t result = sub_2430293E8(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_24302921C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2430293E8(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_243029250(void *a1)
{
  return sub_243028F8C(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_243029274(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x5643656E6966 && a2 == 0xE600000000000000;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5643657372616F63 && a2 == 0xE800000000000000 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2430293E8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70660);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24302914C();
  sub_243039A80();
  if (!v1)
  {
    char v12 = 0;
    uint64_t v7 = sub_2430398A0();
    char v11 = 1;
    sub_24302995C();
    sub_243039840();
    char v10 = 2;
    sub_243039880();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t destroy for PostbackUpdateTestingRequest()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest()
{
  return &type metadata for PostbackUpdateTestingRequest;
}

unsigned char *storeEnumTagSinglePayload for PostbackUpdateTestingRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24302981CLL);
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

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest.CodingKeys()
{
  return &type metadata for PostbackUpdateTestingRequest.CodingKeys;
}

unint64_t sub_243029858()
{
  unint64_t result = qword_268D70648;
  if (!qword_268D70648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70648);
  }
  return result;
}

unint64_t sub_2430298B0()
{
  unint64_t result = qword_268D70650;
  if (!qword_268D70650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70650);
  }
  return result;
}

unint64_t sub_243029908()
{
  unint64_t result = qword_268D70658;
  if (!qword_268D70658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70658);
  }
  return result;
}

unint64_t sub_24302995C()
{
  unint64_t result = qword_268D70668;
  if (!qword_268D70668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70668);
  }
  return result;
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_2430299C8()
{
  uint64_t result = sub_243029B1C();
  qword_268D78868 = result;
  return result;
}

uint64_t sub_2430299E8()
{
  uint64_t v1 = v0;
  if (qword_26B0C0678 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_243039520();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B0C16E8);
  int v3 = sub_243039500();
  os_log_type_t v4 = sub_2430396B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_243006000, v3, v4, "deinitializing ServiceConnection", v5, 2u);
    MEMORY[0x245672970](v5, -1, -1);
  }

  unsigned int v6 = *(void **)(v1 + 16);
  objc_msgSend(v6, sel_invalidate);

  return MEMORY[0x270FA0228](v1, 24, 7);
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
}

uint64_t sub_243029B1C()
{
  uint64_t v22 = &type metadata for FeatureFlag;
  unint64_t v23 = sub_243012508();
  LOBYTE(v19) = 0;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  if (v0)
  {
    if (qword_26B0C0678 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_243039520();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B0C16E8);
    uint64_t v2 = sub_243039500();
    os_log_type_t v3 = sub_2430396B0();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl(&dword_243006000, v2, v3, "initializing ServiceConnection", v4, 2u);
      MEMORY[0x245672970](v4, -1, -1);
    }

    id v5 = objc_allocWithZone(MEMORY[0x263F08D68]);
    unsigned int v6 = (void *)sub_243039530();
    id v7 = objc_msgSend(v5, sel_initWithMachServiceName_options_, v6, 0, v19);

    uint64_t v8 = self;
    id v9 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_26F8841D8);
    objc_msgSend(v7, sel_setExportedInterface_, v9);

    id v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v7, sel_setExportedObject_, v10);

    id v11 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_26F8848B0);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v11);

    unint64_t v23 = (unint64_t)sub_243011F60;
    uint64_t v24 = 0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_243011F6C;
    uint64_t v22 = (ValueMetadata *)&block_descriptor_7;
    char v12 = _Block_copy(&v19);
    objc_msgSend(v7, sel_setInterruptionHandler_, v12);
    _Block_release(v12);
    unint64_t v23 = (unint64_t)sub_243011FB0;
    uint64_t v24 = 0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_243011F6C;
    uint64_t v22 = (ValueMetadata *)&block_descriptor_6_1;
    int v13 = _Block_copy(&v19);
    objc_msgSend(v7, sel_setInvalidationHandler_, v13);
    _Block_release(v13);
    objc_msgSend(v7, sel_resume);
    type metadata accessor for ServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v7;
  }
  else
  {
    if (qword_26B0C0678 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_243039520();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B0C16E8);
    char v16 = sub_243039500();
    os_log_type_t v17 = sub_2430396C0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_243006000, v16, v17, "Service feature flag is not enabled", v18, 2u);
      MEMORY[0x245672970](v18, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_243029F20(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 72) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243029F48, 0, 0);
}

uint64_t sub_243029F48()
{
  if (qword_26B0C0180 != -1) {
    swift_once();
  }
  if (qword_26B0C16E0)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v8 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v8;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_24302A1D8;
    *(void *)(v3 + 24) = v2;
    id v9 = (uint64_t (*)(char, uint64_t, uint64_t))&aD[*(int *)aD];
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_243017924;
    char v5 = *(unsigned char *)(v0 + 72);
    return v9(v5, (uint64_t)sub_24302A1E4, v3);
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

void sub_24302A0CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)sub_243039480();
  id v11 = (void *)sub_243039480();
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_243038A9C;
  v13[3] = &block_descriptor_21_0;
  char v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_handoffTokenWithAdvertisedItemID_tokenData_requestData_reply_, a6, v10, v11, v12);
  _Block_release(v12);
}

void sub_24302A1D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24302A0CC(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_24302A1E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24302786C(a1, a2, a3, a4, a5, *(uint64_t (**)(void))(v5 + 16));
}

uint64_t sub_24302A1EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 72) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24302A214, 0, 0);
}

uint64_t sub_24302A214()
{
  if (qword_26B0C0180 != -1) {
    swift_once();
  }
  if (qword_26B0C16E0)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v8 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v8;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_24302A398;
    *(void *)(v3 + 24) = v2;
    id v9 = (uint64_t (*)(char, uint64_t, uint64_t))&aD[*(int *)aD];
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_243017670;
    char v5 = *(unsigned char *)(v0 + 72);
    return v9(v5, (uint64_t)sub_24302AF0C, v3);
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

void sub_24302A398(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24302A4E8(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_18, (SEL *)&selRef_handoffUTMetricsWithAdvertisedItemID_eventsData_reply_);
}

uint64_t sub_24302A3D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (qword_26B0C0180 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26B0C16E0)
  {
    uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
    MEMORY[0x270FA5388](v5);
    return sub_24301C5D0(a4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_24302AF0C);
  }
  return result;
}

void sub_24302A4E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  char v14 = (void *)sub_243039480();
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_243038A9C;
  v16[3] = a9;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, v14, v15);
  _Block_release(v15);
}

void sub_24302A5CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24302A4E8(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&block_descriptor_8, (SEL *)&selRef_handoffPODTokenWithAdvertisedItemID_tokenData_reply_);
}

uint64_t sub_24302A608()
{
  return 0x69766E456E616B73;
}

uint64_t sub_24302A62C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x69766E456E616B73 && a2 == 0xEF746E656D6E6F72)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2430399C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24302A6E8(uint64_t a1)
{
  unint64_t v2 = sub_24302A8A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302A724(uint64_t a1)
{
  unint64_t v2 = sub_24302A8A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302A760(void *a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C06B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302A8A4();
  sub_243039A90();
  v9[15] = a2;
  sub_24302A8F8();
  sub_243039930();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24302A8A4()
{
  unint64_t result = qword_26B0C0638;
  if (!qword_26B0C0638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0638);
  }
  return result;
}

unint64_t sub_24302A8F8()
{
  unint64_t result = qword_26B0C06B8;
  if (!qword_26B0C06B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C06B8);
  }
  return result;
}

void *sub_24302A94C(void *a1)
{
  return sub_24302A9AC(a1);
}

void *sub_24302A964@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24302A9AC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24302A990(void *a1)
{
  return sub_24302A760(a1, *v1);
}

void *sub_24302A9AC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70688);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302A8A4();
  sub_243039A80();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_24302AE98();
    sub_243039840();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    char v7 = (void *)v9[15];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t getEnumTagSinglePayload for TokenHandoffRequest(unsigned __int8 *a1, unsigned int a2)
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
  if (*a1 <= 2u) {
    int v6 = 2;
  }
  else {
    int v6 = *a1;
  }
  int v7 = v6 - 3;
  if (*a1 < 2u) {
    int v8 = -1;
  }
  else {
    int v8 = v7;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TokenHandoffRequest(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24302AC84);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoffRequest()
{
  return &type metadata for TokenHandoffRequest;
}

unsigned char *storeEnumTagSinglePayload for TokenHandoffRequest.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24302AD58);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoffRequest.CodingKeys()
{
  return &type metadata for TokenHandoffRequest.CodingKeys;
}

unint64_t sub_24302AD94()
{
  unint64_t result = qword_268D70680;
  if (!qword_268D70680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70680);
  }
  return result;
}

unint64_t sub_24302ADEC()
{
  unint64_t result = qword_26B0C0648;
  if (!qword_26B0C0648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0648);
  }
  return result;
}

unint64_t sub_24302AE44()
{
  unint64_t result = qword_26B0C0640;
  if (!qword_26B0C0640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0640);
  }
  return result;
}

unint64_t sub_24302AE98()
{
  unint64_t result = qword_268D70690;
  if (!qword_268D70690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70690);
  }
  return result;
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

void sub_24302AF18(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_243038A9C;
  v7[3] = &block_descriptor_9;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_getSnoutStoriesWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_24302AFD0()
{
  if (qword_268D701B8 != -1) {
    swift_once();
  }
  if (!qword_268D78758) {
    return 0;
  }
  uint64_t result = sub_24301C9D8((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_24302AF18, &v2);
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24302B078(uint64_t a1)
{
  unint64_t v2 = sub_24302B200();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302B0B4(uint64_t a1)
{
  unint64_t v2 = sub_24302B200();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302B0F0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70698);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302B200();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24302B200()
{
  unint64_t result = qword_268D706A0;
  if (!qword_268D706A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D706A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SnoutRequest()
{
  return &type metadata for SnoutRequest;
}

ValueMetadata *type metadata accessor for SnoutRequest.CodingKeys()
{
  return &type metadata for SnoutRequest.CodingKeys;
}

unint64_t sub_24302B278()
{
  unint64_t result = qword_268D706A8;
  if (!qword_268D706A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D706A8);
  }
  return result;
}

unint64_t sub_24302B2D0()
{
  unint64_t result = qword_268D706B0;
  if (!qword_268D706B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D706B0);
  }
  return result;
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

void *sub_24302B33C()
{
  return &unk_265177590;
}

unint64_t sub_24302B348()
{
  return 0xD000000000000020;
}

ValueMetadata *type metadata accessor for PostbackConstants()
{
  return &type metadata for PostbackConstants;
}

uint64_t sub_24302B374()
{
  sub_243039A70();
  uint64_t result = sub_2430396E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24302B418()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  sub_243039A70();
  uint64_t v2 = sub_2430396E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_24302B4D4()
{
  sub_24302B418();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for SyncXPCResult()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24302B544(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24302B554()
{
  return sub_243039A50();
}

uint64_t sub_24302B57C()
{
  return sub_243039A60();
}

uint64_t sub_24302B5C4(uint64_t a1, unint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v38 = 46;
  unint64_t v39 = 0xE100000000000000;
  uint64_t v37 = &v38;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_24302CB9C(0x7FFFFFFFFFFFFFFFLL, 0, sub_24302D2AC, (uint64_t)v36, a1, a2);
  if (v4[2] != 3)
  {
    swift_bridgeObjectRelease();
    sub_24302D2C8();
    swift_allocError();
    *uint64_t v24 = 0;
    return swift_willThrow();
  }
  uint64_t v5 = v4[4];
  uint64_t v6 = v4[5];
  uint64_t v7 = v4[6];
  uint64_t v8 = v4[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x245672000](v5, v6, v7, v8);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v38 = v9;
  unint64_t v39 = v11;
  unint64_t v12 = sub_24302D31C();
  uint64_t v13 = MEMORY[0x263F8D310];
  uint64_t v38 = sub_243039710();
  unint64_t v39 = v14;
  unint64_t v34 = v12;
  unint64_t v35 = v12;
  uint64_t v32 = v13;
  unint64_t v33 = v12;
  uint64_t v15 = sub_243039710();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v38 = v15;
  unint64_t v39 = v17;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_243039570();
  swift_bridgeObjectRelease();
  uint64_t v19 = v18 & 3;
  if (v18 <= 0) {
    uint64_t v19 = -(-v18 & 3);
  }
  if (v19)
  {
    MEMORY[0x245672060](61, 0xE100000000000000, 4 - v19);
    sub_243039590();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_243039470();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (v22 >> 60 == 15)
  {
    sub_24302D2C8();
    swift_allocError();
    *unint64_t v23 = 1;
    return swift_willThrow();
  }
  char v26 = self;
  char v27 = (void *)sub_243039480();
  uint64_t v38 = 0;
  id v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, &v38, v32, v33, v34, v35, 47, 0xE100000000000000);

  if (v28)
  {
    id v29 = (id)v38;
    sub_243039720();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D706C8);
    if (swift_dynamicCast())
    {
      sub_243020174(v20, v22);
      return 95;
    }
    sub_24302D2C8();
    swift_allocError();
    *char v31 = 1;
  }
  else
  {
    id v30 = (id)v38;
    sub_243039430();
  }
  swift_willThrow();
  return sub_243020174(v20, v22);
}

uint64_t sub_24302B988()
{
  sub_24302D31C();
  sub_243039710();
  uint64_t v0 = sub_243039710();
  swift_bridgeObjectRelease();
  uint64_t v4 = v0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_243039570();
  swift_bridgeObjectRelease();
  uint64_t v2 = v1 & 3;
  if (v1 <= 0) {
    uint64_t v2 = -(-v1 & 3);
  }
  if (v2)
  {
    MEMORY[0x245672060](61, 0xE100000000000000, 4 - v2);
    sub_243039590();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_24302BAD0(uint64_t a1, unint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v38 = 46;
  unint64_t v39 = 0xE100000000000000;
  uint64_t v37 = &v38;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_24302CB9C(0x7FFFFFFFFFFFFFFFLL, 0, sub_24302D2AC, (uint64_t)v36, a1, a2);
  if (v4[2] != 3)
  {
    swift_bridgeObjectRelease();
    sub_24302D2C8();
    swift_allocError();
    *uint64_t v24 = 0;
    return swift_willThrow();
  }
  uint64_t v5 = v4[8];
  uint64_t v6 = v4[9];
  uint64_t v7 = v4[10];
  uint64_t v8 = v4[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x245672000](v5, v6, v7, v8);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v38 = v9;
  unint64_t v39 = v11;
  unint64_t v12 = sub_24302D31C();
  uint64_t v13 = MEMORY[0x263F8D310];
  uint64_t v38 = sub_243039710();
  unint64_t v39 = v14;
  unint64_t v34 = v12;
  unint64_t v35 = v12;
  uint64_t v32 = v13;
  unint64_t v33 = v12;
  uint64_t v15 = sub_243039710();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v38 = v15;
  unint64_t v39 = v17;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_243039570();
  swift_bridgeObjectRelease();
  uint64_t v19 = v18 & 3;
  if (v18 <= 0) {
    uint64_t v19 = -(-v18 & 3);
  }
  if (v19)
  {
    MEMORY[0x245672060](61, 0xE100000000000000, 4 - v19);
    sub_243039590();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_243039470();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (v22 >> 60 == 15)
  {
    sub_24302D2C8();
    swift_allocError();
    *unint64_t v23 = 2;
    return swift_willThrow();
  }
  char v26 = self;
  char v27 = (void *)sub_243039480();
  uint64_t v38 = 0;
  id v28 = objc_msgSend(v26, sel_JSONObjectWithData_options_error_, v27, 0, &v38, v32, v33, v34, v35, 47, 0xE100000000000000);

  if (v28)
  {
    id v29 = (id)v38;
    sub_243039720();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D706C8);
    if (swift_dynamicCast())
    {
      sub_243020174(v20, v22);
      return 95;
    }
    sub_24302D2C8();
    swift_allocError();
    *char v31 = 2;
  }
  else
  {
    id v30 = (id)v38;
    sub_243039430();
  }
  swift_willThrow();
  return sub_243020174(v20, v22);
}

uint64_t sub_24302BE94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_24302BEC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t sub_24302BF00(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24302BF38(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24302BF70@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v99 = a5;
  unint64_t v100 = a3;
  uint64_t v103 = a4;
  uint64_t v97 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v98 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = v12;
  uint64_t v102 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_243039380();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = 46;
  unint64_t v107 = 0xE100000000000000;
  v105 = &v106;
  swift_bridgeObjectRetain_n();
  uint64_t v96 = a1;
  uint64_t v19 = (void *)sub_24302CB9C(0x7FFFFFFFFFFFFFFFLL, 0, sub_24302D2AC, (uint64_t)v104, a1, a2);
  swift_bridgeObjectRelease();
  if (v19[2] != 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24302D2C8();
    swift_allocError();
    unsigned char *v39 = 0;
    return swift_willThrow();
  }
  unint64_t v95 = v6;
  sub_2430393C0();
  swift_allocObject();
  uint64_t v20 = sub_2430393B0();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F060D0], v15);
  uint64_t result = sub_243039390();
  if (!v19[2])
  {
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v101 = v20;
  uint64_t v94 = a6;
  uint64_t v23 = v19[4];
  uint64_t v22 = v19[5];
  uint64_t v24 = v19[6];
  uint64_t v25 = v19[7];
  swift_bridgeObjectRetain();
  uint64_t v26 = MEMORY[0x245672000](v23, v22, v24, v25);
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  uint64_t v106 = v26;
  unint64_t v107 = v28;
  uint64_t v112 = 45;
  unint64_t v113 = 0xE100000000000000;
  uint64_t v110 = 43;
  unint64_t v111 = 0xE100000000000000;
  sub_24302D31C();
  uint64_t v106 = sub_243039710();
  unint64_t v107 = v29;
  uint64_t v112 = 95;
  unint64_t v113 = 0xE100000000000000;
  uint64_t v110 = 47;
  unint64_t v111 = 0xE100000000000000;
  uint64_t v30 = sub_243039710();
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  uint64_t v106 = v30;
  unint64_t v107 = v32;
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_243039570();
  swift_bridgeObjectRelease();
  uint64_t v34 = v33 & 3;
  if (v33 <= 0) {
    uint64_t v34 = -(-v33 & 3);
  }
  if (v34)
  {
    MEMORY[0x245672060](61, 0xE100000000000000, 4 - v34);
    sub_243039590();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_243039470();
  unint64_t v37 = v36;
  swift_bridgeObjectRelease();
  if (v37 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24302D2C8();
    swift_allocError();
    *uint64_t v38 = 1;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v40 = v114;
  unint64_t v41 = v95;
  sub_2430393A0();
  if (v41)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_243020174(v35, v37);
    return swift_bridgeObjectRelease();
  }
  uint64_t v93 = v35;
  unint64_t v95 = v37;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v102 + 32))(v94, v14, v40);
  if (v19[2] < 2uLL) {
    goto LABEL_36;
  }
  uint64_t v43 = v19[8];
  uint64_t v42 = v19[9];
  uint64_t v44 = v19[10];
  uint64_t v45 = v19[11];
  swift_bridgeObjectRetain();
  uint64_t v46 = MEMORY[0x245672000](v43, v42, v44, v45);
  unint64_t v48 = v47;
  swift_bridgeObjectRelease();
  uint64_t v106 = v46;
  unint64_t v107 = v48;
  uint64_t v112 = 45;
  unint64_t v113 = 0xE100000000000000;
  uint64_t v110 = 43;
  unint64_t v111 = 0xE100000000000000;
  uint64_t v106 = sub_243039710();
  unint64_t v107 = v49;
  uint64_t v112 = 95;
  unint64_t v113 = 0xE100000000000000;
  uint64_t v110 = 47;
  unint64_t v111 = 0xE100000000000000;
  uint64_t v50 = sub_243039710();
  unint64_t v52 = v51;
  swift_bridgeObjectRelease();
  uint64_t v106 = v50;
  unint64_t v107 = v52;
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_243039570();
  swift_bridgeObjectRelease();
  uint64_t v54 = v53 & 3;
  if (v53 <= 0) {
    uint64_t v54 = -(-v53 & 3);
  }
  if (v54)
  {
    MEMORY[0x245672060](61, 0xE100000000000000, 4 - v54);
    sub_243039590();
    swift_bridgeObjectRelease();
  }
  uint64_t v55 = v99;
  unint64_t v56 = v100;
  swift_bridgeObjectRelease();
  uint64_t v57 = sub_243039470();
  unint64_t v59 = v58;
  swift_bridgeObjectRelease();
  if (v59 >> 60 != 15)
  {
    sub_2430393A0();
    unint64_t v92 = v59;
    uint64_t v91 = v57;
    uint64_t v106 = v114;
    unint64_t v107 = v56;
    uint64_t v108 = v103;
    uint64_t v109 = v55;
    uint64_t v90 = type metadata accessor for JWS();
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, unint64_t))(v97 + 32))(v94 + *(int *)(v90 + 52), v98, v56);
    if (v19[2] >= 3uLL)
    {
      uint64_t v67 = v19[12];
      uint64_t v68 = v19[13];
      uint64_t v69 = v19[14];
      uint64_t v70 = v19[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v71 = MEMORY[0x245672000](v67, v68, v69, v70);
      unint64_t v73 = v72;
      swift_bridgeObjectRelease();
      uint64_t v74 = v71;
      uint64_t v106 = v71;
      unint64_t v107 = v73;
      uint64_t v112 = 45;
      unint64_t v113 = 0xE100000000000000;
      uint64_t v110 = 43;
      unint64_t v111 = 0xE100000000000000;
      uint64_t v106 = sub_243039710();
      unint64_t v107 = v75;
      uint64_t v112 = 95;
      unint64_t v113 = 0xE100000000000000;
      uint64_t v110 = 47;
      unint64_t v111 = 0xE100000000000000;
      uint64_t v76 = sub_243039710();
      unint64_t v78 = v77;
      swift_bridgeObjectRelease();
      uint64_t v106 = v76;
      unint64_t v107 = v78;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_243039570();
      swift_bridgeObjectRelease();
      uint64_t v80 = v79 & 3;
      if (v79 <= 0) {
        uint64_t v80 = -(-v79 & 3);
      }
      if (v80)
      {
        MEMORY[0x245672060](61, 0xE100000000000000, 4 - v80);
        sub_243039590();
        swift_bridgeObjectRelease();
      }
      uint64_t v81 = HIBYTE(v73) & 0xF;
      if ((v73 & 0x2000000000000000) == 0) {
        uint64_t v81 = v74 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v82 = v91;
      if (v81)
      {
        uint64_t v83 = sub_243039470();
        unint64_t v85 = v84;
        swift_bridgeObjectRelease();
        uint64_t v62 = v94;
        if (v85 >> 60 != 15)
        {
          sub_243020174(v83, v85);
          swift_release();
          sub_243020174(v93, v95);
          uint64_t result = sub_243020174(v82, v92);
          uint64_t v86 = v90;
          char v87 = (uint64_t *)(v62 + *(int *)(v90 + 56));
          *char v87 = v74;
          v87[1] = v73;
          uint64_t v88 = (uint64_t *)(v62 + *(int *)(v86 + 60));
          *uint64_t v88 = v96;
          v88[1] = a2;
          return result;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v62 = v94;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24302D2C8();
      swift_allocError();
      *char v89 = 3;
      swift_willThrow();
      sub_243020174(v82, v92);
      sub_243020174(v93, v95);
      swift_release();
      int v61 = 1;
      uint64_t v55 = v99;
      unint64_t v56 = v100;
      goto LABEL_20;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24302D2C8();
  swift_allocError();
  *uint64_t v60 = 2;
  swift_willThrow();
  sub_243020174(v93, v95);
  swift_release();
  int v61 = 0;
  uint64_t v62 = v94;
LABEL_20:
  uint64_t v63 = v62;
  uint64_t v64 = v62;
  uint64_t v65 = v114;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v102 + 8))(v63, v114);
  if (v61)
  {
    uint64_t v106 = v65;
    unint64_t v107 = v56;
    uint64_t v108 = v103;
    uint64_t v109 = v55;
    uint64_t v66 = type metadata accessor for JWS();
    return (*(uint64_t (**)(uint64_t, unint64_t))(v97 + 8))(v64 + *(int *)(v66 + 52), v56);
  }
  return result;
}

uint64_t sub_24302CA3C()
{
  sub_243039490();
  sub_24302D31C();
  sub_243039710();
  swift_bridgeObjectRelease();
  sub_243039710();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_243039710();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24302CB9C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_24302D040(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_2430395C0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_243039580();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_243039580();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_2430395D0();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_24302D19C(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_24302D19C((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  unint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_243039580();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_2430395D0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_24302D19C(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_24302D19C((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    uint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_2430397B0();
  __break(1u);
LABEL_42:
  uint64_t result = sub_2430397B0();
  __break(1u);
  return result;
}

uint64_t sub_24302D040(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_2430395D0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_24302D19C(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_24302D19C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_2430397B0();
  __break(1u);
  return result;
}

void *sub_24302D19C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D70758);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24302E1CC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24302D2AC(void *a1)
{
  return sub_24302D370(a1) & 1;
}

unint64_t sub_24302D2C8()
{
  unint64_t result = qword_268D706B8;
  if (!qword_268D706B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D706B8);
  }
  return result;
}

unint64_t sub_24302D31C()
{
  unint64_t result = qword_268D706C0;
  if (!qword_268D706C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D706C0);
  }
  return result;
}

uint64_t sub_24302D370(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_2430399C0() & 1;
  }
}

uint64_t type metadata accessor for JWS()
{
  return swift_getGenericMetadata();
}

unint64_t sub_24302D3E4()
{
  unint64_t result = qword_268D706D0[0];
  if (!qword_268D706D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268D706D0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for JWSError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24302D504);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JWSError()
{
  return &type metadata for JWSError;
}

uint64_t sub_24302D53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_24302D544()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24302D620(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = *(void *)(v8 + 64) + 7;
  unint64_t v12 = ((((v11 + ((v6 + v9) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  unsigned int v13 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v13 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v18 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)v4 + v10) & v17, v18, v7);
    char v19 = (void *)((v11 + (((unint64_t)v4 + v10) & v17)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (void *)((v11 + v18) & 0xFFFFFFFFFFFFFFF8);
    *char v19 = *v20;
    v19[1] = v20[1];
    uint64_t v21 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v21 = *v22;
    v21[1] = v22[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24302D7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v4)();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((*(void *)(v4 + 56)
                                                                                            + a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24302D8C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 48) + 7;
  unint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24302D9C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 40) + 7;
  unint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24302DAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 32) + 7;
  unint64_t v15 = (_OWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (_OWORD *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24302DBC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 24) + 7;
  unint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24302DCC8(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  if (v8 <= v6) {
    unsigned int v10 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(v4 - 8) + 64) + v9;
  uint64_t v12 = *(void *)(v7 + 64) + 7;
  if (v10 < a2)
  {
    unint64_t v13 = ((((v12 + (v11 & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v14 = a2 - v10;
    uint64_t v15 = v13 & 0xFFFFFFF8;
    if ((v13 & 0xFFFFFFF8) != 0) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = v14 + 1;
    }
    if (v16 >= 0x10000) {
      unsigned int v17 = 4;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v16 < 0x100) {
      unsigned int v17 = 1;
    }
    if (v16 >= 2) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    switch(v18)
    {
      case 1:
        int v19 = *((unsigned __int8 *)a1 + v13);
        if (!v19) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v19 = *(unsigned __int16 *)((char *)a1 + v13);
        if (v19) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24302DEA8);
      case 4:
        int v19 = *(int *)((char *)a1 + v13);
        if (!v19) {
          break;
        }
LABEL_24:
        int v21 = v19 - 1;
        if (v15)
        {
          int v21 = 0;
          int v22 = *a1;
        }
        else
        {
          int v22 = 0;
        }
        return v10 + (v22 | v21) + 1;
      default:
        break;
    }
  }
  if (v6 == v10) {
    return (*(uint64_t (**)(int *, uint64_t, uint64_t))(v5 + 48))(a1, v6, v4);
  }
  unint64_t v23 = ((unint64_t)a1 + v11) & ~v9;
  if (v8 == v10) {
    return (*(uint64_t (**)(unint64_t))(v7 + 48))(v23);
  }
  unint64_t v24 = *(void *)(((v12 + v23) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v24 >= 0xFFFFFFFF) {
    LODWORD(v24) = -1;
  }
  return (v24 + 1);
}

void sub_24302DEBC(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v7 = *(void *)(a4 + 24);
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(void *)(v7 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v8) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + v11;
  uint64_t v14 = *(void *)(*(void *)(v7 - 8) + 64) + 7;
  unint64_t v15 = ((((v14 + (v13 & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v12 >= a3)
  {
    int v19 = 0;
    int v20 = a2 - v12;
    if (a2 <= v12)
    {
LABEL_19:
      switch(v19)
      {
        case 1:
          a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_32;
        case 2:
          *(_WORD *)&a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_32;
        case 3:
          goto LABEL_48;
        case 4:
          *(_DWORD *)&a1[v15] = 0;
          goto LABEL_31;
        default:
LABEL_31:
          if (a2)
          {
LABEL_32:
            if (v8 == v12)
            {
              unint64_t v23 = *(void (**)(void))(v6 + 56);
              v23();
            }
            else
            {
              unint64_t v24 = (unint64_t)&a1[v13] & ~v11;
              if (v10 == v12)
              {
                uint64_t v25 = *(void (**)(unint64_t))(v9 + 56);
                v25(v24);
              }
              else
              {
                unint64_t v26 = (void *)((v14 + v24) & 0xFFFFFFFFFFFFFFF8);
                if ((a2 & 0x80000000) != 0)
                {
                  void *v26 = a2 ^ 0x80000000;
                  v26[1] = 0;
                }
                else
                {
                  v26[1] = a2 - 1;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = a3 - v12;
    if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v17 = v16 + 1;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    int v20 = a2 - v12;
    if (a2 <= v12) {
      goto LABEL_19;
    }
  }
  if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v21 = v20;
  }
  else {
    int v21 = 1;
  }
  if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v22 = ~v12 + a2;
    bzero(a1, ((((v14 + (v13 & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *(_DWORD *)a1 = v22;
  }
  switch(v19)
  {
    case 1:
      a1[v15] = v21;
      break;
    case 2:
      *(_WORD *)&a1[v15] = v21;
      break;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x24302E15CLL);
    case 4:
      *(_DWORD *)&a1[v15] = v21;
      break;
    default:
      return;
  }
}

uint64_t sub_24302E184()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24302E1BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24302E1CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2430397C0();
  __break(1u);
  return result;
}

uint64_t sub_24302E2C0()
{
  return *(void *)v0;
}

uint64_t sub_24302E2CC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24302E2FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 28);
  uint64_t v4 = sub_2430394C0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for InAppPurchaseDetails()
{
  uint64_t result = qword_268D70800;
  if (!qword_268D70800) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24302E3C0()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 32));
}

uint64_t sub_24302E3E4()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24302E424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(_DWORD *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  uint64_t v14 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v15 = a9 + v14[7];
  uint64_t v16 = sub_2430394C0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a8, v16);
  *(unsigned char *)(a9 + v14[8]) = a10;
  int v18 = (void *)(a9 + v14[9]);
  void *v18 = a11;
  v18[1] = a12;
  return result;
}

uint64_t sub_24302E510(uint64_t a1)
{
  unint64_t v2 = sub_24302ED38();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302E54C(uint64_t a1)
{
  unint64_t v2 = sub_24302ED38();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24302E588()
{
  unint64_t result = 0x62616D75736E6F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x75736E6F436E6F6ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24302E634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24302F838(a1, a2);
  *a3 = result;
  return result;
}

void sub_24302E65C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24302E668(uint64_t a1)
{
  unint64_t v2 = sub_24302EC90();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302E6A4(uint64_t a1)
{
  unint64_t v2 = sub_24302EC90();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302E6E0(uint64_t a1)
{
  unint64_t v2 = sub_24302EDE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302E71C(uint64_t a1)
{
  unint64_t v2 = sub_24302EDE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302E758(uint64_t a1)
{
  unint64_t v2 = sub_24302ED8C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302E794(uint64_t a1)
{
  unint64_t v2 = sub_24302ED8C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302E7D0(uint64_t a1)
{
  unint64_t v2 = sub_24302ECE4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302E80C(uint64_t a1)
{
  unint64_t v2 = sub_24302ECE4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302E848(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70760);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70768);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70770);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70778);
  uint64_t v22 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unsigned int v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70780);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24302EC90();
  sub_243039A90();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_24302ED8C();
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_24302ED38();
      unsigned int v17 = v25;
      sub_2430398F0();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_24302ECE4();
      unsigned int v17 = v28;
      sub_2430398F0();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_24302EDE0();
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

unint64_t sub_24302EC90()
{
  unint64_t result = qword_268D70788;
  if (!qword_268D70788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70788);
  }
  return result;
}

unint64_t sub_24302ECE4()
{
  unint64_t result = qword_268D70790;
  if (!qword_268D70790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70790);
  }
  return result;
}

unint64_t sub_24302ED38()
{
  unint64_t result = qword_268D70798;
  if (!qword_268D70798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70798);
  }
  return result;
}

unint64_t sub_24302ED8C()
{
  unint64_t result = qword_268D707A0;
  if (!qword_268D707A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707A0);
  }
  return result;
}

unint64_t sub_24302EDE0()
{
  unint64_t result = qword_268D707A8;
  if (!qword_268D707A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707A8);
  }
  return result;
}

char *sub_24302EE34(void *a1)
{
  return sub_24302FA1C(a1);
}

char *sub_24302EE4C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24302FA1C(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24302EE78(void *a1)
{
  return sub_24302E848(a1, *v1);
}

unint64_t sub_24302EE94()
{
  unint64_t result = 0x6843746E756F6D61;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x79636E6572727563;
      break;
    case 2:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 3:
    case 4:
      unint64_t result = 0x6573616863727570;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24302EF74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243030C44(a1, a2);
  *a3 = result;
  return result;
}

void sub_24302EF9C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24302EFA8(uint64_t a1)
{
  unint64_t v2 = sub_243030054();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24302EFE4(uint64_t a1)
{
  unint64_t v2 = sub_243030054();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24302F020(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D707B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243030054();
  sub_243039A90();
  int v13 = *v3;
  long long v14 = *(_OWORD *)(v3 + 1);
  char v12 = 0;
  type metadata accessor for Decimal();
  sub_2430300FC(&qword_268D707C0, (void (*)(uint64_t))type metadata accessor for Decimal);
  sub_2430399A0();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_243039970();
    LOBYTE(v13) = 2;
    sub_243039970();
    uint64_t v9 = type metadata accessor for InAppPurchaseDetails();
    LOBYTE(v13) = 3;
    sub_2430394C0();
    sub_2430300FC(&qword_268D707C8, MEMORY[0x263F07490]);
    sub_2430399A0();
    LOBYTE(v13) = *((unsigned char *)v3 + *(int *)(v9 + 32));
    char v12 = 4;
    sub_2430300A8();
    sub_2430399A0();
    LOBYTE(v13) = 5;
    sub_243039900();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24302F2F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = sub_2430394C0();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D707D8);
  uint64_t v7 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for InAppPurchaseDetails();
  MEMORY[0x270FA5388](v27);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243030054();
  sub_243039A80();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v24 = v6;
  uint64_t v12 = v7;
  type metadata accessor for Decimal();
  char v32 = 0;
  sub_2430300FC(&qword_268D707E0, (void (*)(uint64_t))type metadata accessor for Decimal);
  uint64_t v13 = v26;
  sub_2430398B0();
  *(_DWORD *)uint64_t v11 = v30;
  *(_OWORD *)(v11 + 4) = v31;
  LOBYTE(v30) = 1;
  *((void *)v11 + 3) = sub_243039880();
  *((void *)v11 + 4) = v14;
  LOBYTE(v30) = 2;
  *((void *)v11 + 5) = sub_243039880();
  *((void *)v11 + 6) = v15;
  LOBYTE(v30) = 3;
  sub_2430300FC(&qword_268D707E8, MEMORY[0x263F07490]);
  uint64_t v16 = v29;
  sub_2430398B0();
  uint64_t v17 = v27;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v11[*(int *)(v27 + 28)], v24, v16);
  char v32 = 4;
  sub_243030144();
  sub_2430398B0();
  v11[*(int *)(v17 + 32)] = v30;
  LOBYTE(v30) = 5;
  uint64_t v18 = sub_243039800();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v13);
  uint64_t v21 = (uint64_t *)&v11[*(int *)(v17 + 36)];
  *uint64_t v21 = v18;
  v21[1] = v20;
  sub_24300FB24((uint64_t)v11, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_243030198((uint64_t)v11);
}

uint64_t sub_24302F808@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24302F2F8(a1, a2);
}

uint64_t sub_24302F820(void *a1)
{
  return sub_24302F020(a1);
}

uint64_t sub_24302F838(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x62616D75736E6F63 && a2 == 0xEA0000000000656CLL;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75736E6F436E6F6ELL && a2 == 0xED0000656C62616DLL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024303F750 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024303F770)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

char *sub_24302FA1C(void *a1)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70880);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70888);
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70890);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70898);
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D708A0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24302EC90();
  uint64_t v15 = v47;
  sub_243039A80();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v43;
  uint64_t v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  uint64_t v21 = sub_2430398D0();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = sub_243039790();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    uint64_t v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E0);
    *uint64_t v28 = &type metadata for InAppPurchaseDetails.InAppPurchaseType;
    sub_2430397F0();
    sub_243039780();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v26);
LABEL_7:
    uint64_t v29 = (uint64_t)v46;
    goto LABEL_8;
  }
  uint64_t v13 = (char *)*(unsigned __int8 *)(v21 + 32);
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v49 = 1;
      sub_24302ED8C();
      uint64_t v31 = v47;
      sub_2430397E0();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_24302ED38();
      uint64_t v32 = v47;
      sub_2430397E0();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_24302ECE4();
      uint64_t v33 = v47;
      sub_2430397E0();
      if (v33) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
    default:
      char v48 = 0;
      sub_24302EDE0();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      sub_2430397E0();
      if (v24)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v35);
LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v29);
  return v13;
}

unint64_t sub_243030054()
{
  unint64_t result = qword_268D707B8;
  if (!qword_268D707B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707B8);
  }
  return result;
}

unint64_t sub_2430300A8()
{
  unint64_t result = qword_268D707D0;
  if (!qword_268D707D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707D0);
  }
  return result;
}

uint64_t sub_2430300FC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_243030144()
{
  unint64_t result = qword_268D707F0;
  if (!qword_268D707F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707F0);
  }
  return result;
}

uint64_t sub_243030198(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InAppPurchaseDetails();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2430301F8()
{
  unint64_t result = qword_268D707F8;
  if (!qword_268D707F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D707F8);
  }
  return result;
}

uint64_t sub_24303024C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243030260);
}

uint64_t sub_243030260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2430394C0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_243030310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243030324);
}

uint64_t sub_243030324(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2430394C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2430303CC()
{
  uint64_t result = sub_2430394C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType;
}

uint64_t getEnumTagSinglePayload for InAppPurchaseDetails.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InAppPurchaseDetails.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x2430305F8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.CodingKeys()
{
  return &type metadata for InAppPurchaseDetails.CodingKeys;
}

unsigned char *_s20AttributionKitCommon20InAppPurchaseDetailsV17InAppPurchaseTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2430306FCLL);
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

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.CodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.CodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.ConsumableCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.ConsumableCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.NonConsumableCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.NonConsumableCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.AutoRenewableSubscriptionCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.AutoRenewableSubscriptionCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.NonRenewingSubscriptionCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.NonRenewingSubscriptionCodingKeys;
}

unint64_t sub_243030778()
{
  unint64_t result = qword_268D70810;
  if (!qword_268D70810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70810);
  }
  return result;
}

unint64_t sub_2430307D0()
{
  unint64_t result = qword_268D70818;
  if (!qword_268D70818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70818);
  }
  return result;
}

unint64_t sub_243030828()
{
  unint64_t result = qword_268D70820;
  if (!qword_268D70820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70820);
  }
  return result;
}

unint64_t sub_243030880()
{
  unint64_t result = qword_268D70828;
  if (!qword_268D70828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70828);
  }
  return result;
}

unint64_t sub_2430308D8()
{
  unint64_t result = qword_268D70830;
  if (!qword_268D70830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70830);
  }
  return result;
}

unint64_t sub_243030930()
{
  unint64_t result = qword_268D70838;
  if (!qword_268D70838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70838);
  }
  return result;
}

unint64_t sub_243030988()
{
  unint64_t result = qword_268D70840;
  if (!qword_268D70840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70840);
  }
  return result;
}

unint64_t sub_2430309E0()
{
  unint64_t result = qword_268D70848;
  if (!qword_268D70848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70848);
  }
  return result;
}

unint64_t sub_243030A38()
{
  unint64_t result = qword_268D70850;
  if (!qword_268D70850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70850);
  }
  return result;
}

unint64_t sub_243030A90()
{
  unint64_t result = qword_268D70858;
  if (!qword_268D70858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70858);
  }
  return result;
}

unint64_t sub_243030AE8()
{
  unint64_t result = qword_268D70860;
  if (!qword_268D70860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70860);
  }
  return result;
}

unint64_t sub_243030B40()
{
  unint64_t result = qword_268D70868;
  if (!qword_268D70868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70868);
  }
  return result;
}

unint64_t sub_243030B98()
{
  unint64_t result = qword_268D70870;
  if (!qword_268D70870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70870);
  }
  return result;
}

unint64_t sub_243030BF0()
{
  unint64_t result = qword_268D70878;
  if (!qword_268D70878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70878);
  }
  return result;
}

uint64_t sub_243030C44(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6843746E756F6D61 && a2 == 0xED00006465677261;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79636E6572727563 && a2 == 0xEC00000065646F43 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065746144 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065707954 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024303F790)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_243030F34()
{
  uint64_t result = sub_243030F78();
  qword_268D78870 = result;
  return result;
}

uint64_t type metadata accessor for ImpressionIntakeServiceConnection()
{
  return self;
}

uint64_t sub_243030F78()
{
  uint64_t v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_243012508();
  LOBYTE(v15) = 0;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
    BOOL v2 = (void *)sub_243039530();
    id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0, v15);

    unsigned int v4 = self;
    id v5 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F8841D8);
    objc_msgSend(v3, sel_setExportedInterface_, v5);

    id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
    objc_msgSend(v3, sel_setExportedObject_, v6);

    id v7 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26F884970);
    objc_msgSend(v3, sel_setRemoteObjectInterface_, v7);

    unint64_t v19 = (unint64_t)sub_243011F60;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    uint64_t v18 = (ValueMetadata *)&block_descriptor_10;
    int v8 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_243011FB0;
    uint64_t v20 = 0;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_243011F6C;
    uint64_t v18 = (ValueMetadata *)&block_descriptor_6_2;
    uint64_t v9 = _Block_copy(&v15);
    objc_msgSend(v3, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    objc_msgSend(v3, sel_resume);
    type metadata accessor for ImpressionIntakeServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_26B0C0678 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_243039520();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B0C16E8);
    uint64_t v12 = sub_243039500();
    os_log_type_t v13 = sub_2430396C0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_243006000, v12, v13, "Service feature flag is not enabled", v14, 2u);
      MEMORY[0x245672970](v14, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

void sub_2430312DC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *a1;
  int v8 = (void *)sub_243039480();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  void v10[2] = sub_243038A9C;
  v10[3] = &block_descriptor_11;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_updateConversionValue_reply_, v8, v9);
  _Block_release(v9);
}

uint64_t sub_2430313B8(uint64_t a1, unsigned int a2)
{
  return (a2 >> 8) & 1;
}

uint64_t sub_2430313C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2430313E4(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(_WORD *)(v3 + 40) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  return MEMORY[0x270FA2498](sub_243031408, 0, 0);
}

uint64_t sub_243031408()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    __int16 v1 = *(_WORD *)(v0 + 40);
    id v7 = (char *)&dword_268D70388 + dword_268D70388;
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_243031544;
    uint64_t v4 = *(void *)(v0 + 16);
    uint64_t v3 = *(void *)(v0 + 24);
    return ((uint64_t (*)(uint64_t, void, uint64_t, void, void))v7)(v4, v1 & 0x1FF, v3, sub_2430312DC, 0);
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_243031544()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  __int16 v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_243031638()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x74736F506B636F6CLL;
      break;
    case 3:
      unint64_t result = 0x69737265766E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2430316E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243031AF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_243031708(uint64_t a1)
{
  unint64_t v2 = sub_2430319AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243031744(uint64_t a1)
{
  unint64_t v2 = sub_2430319AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243031780(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  v13[0] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D708B0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2430319AC();
  sub_243039A90();
  char v18 = 0;
  sub_243039990();
  if (!v4)
  {
    uint64_t v11 = v13[0];
    char v17 = a3;
    char v16 = 1;
    sub_2430291A0();
    sub_243039930();
    char v15 = 2;
    sub_243039980();
    v13[1] = v11;
    char v14 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D708C0);
    sub_243032170(&qword_268D708C8, (void (*)(void))sub_243031A00);
    sub_243039930();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_2430319AC()
{
  unint64_t result = qword_268D708B8;
  if (!qword_268D708B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D708B8);
  }
  return result;
}

unint64_t sub_243031A00()
{
  unint64_t result = qword_268D708D0;
  if (!qword_268D708D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D708D0);
  }
  return result;
}

uint64_t sub_243031A54(void *a1)
{
  uint64_t result = sub_243031CE0(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_243031A7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_243031CE0(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 9) = HIBYTE(v5) & 1;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_243031AB8(void *a1)
{
  return sub_243031780(a1, *(void *)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_243031AF0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024303F830 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024303F850 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74736F506B636F6CLL && a2 == 0xEC0000006B636162 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEF73657079546E6FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_243031CE0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D708F0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2430319AC();
  sub_243039A80();
  v8[31] = 0;
  uint64_t v6 = sub_2430398A0();
  v8[29] = 1;
  sub_24302995C();
  sub_243039840();
  v8[28] = 2;
  sub_243039890();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D708C0);
  v8[27] = 3;
  sub_243032170(&qword_268D708F8, (void (*)(void))sub_2430321E0);
  sub_243039840();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

ValueMetadata *type metadata accessor for PostbackRequest()
{
  return &type metadata for PostbackRequest;
}

unsigned char *storeEnumTagSinglePayload for PostbackRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243032030);
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

ValueMetadata *type metadata accessor for PostbackRequest.CodingKeys()
{
  return &type metadata for PostbackRequest.CodingKeys;
}

unint64_t sub_24303206C()
{
  unint64_t result = qword_268D708D8;
  if (!qword_268D708D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D708D8);
  }
  return result;
}

unint64_t sub_2430320C4()
{
  unint64_t result = qword_268D708E0;
  if (!qword_268D708E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D708E0);
  }
  return result;
}

unint64_t sub_24303211C()
{
  unint64_t result = qword_268D708E8;
  if (!qword_268D708E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D708E8);
  }
  return result;
}

uint64_t sub_243032170(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D708C0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2430321E0()
{
  unint64_t result = qword_268D70900;
  if (!qword_268D70900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70900);
  }
  return result;
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_24303224C@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  type metadata accessor for ServiceResult();
  if (swift_getEnumCaseMultiPayload() == 1) {
    *a3 = *a1;
  }
  else {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  }
  sub_243019FB0();
  sub_243039A70();

  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for ServiceResult()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_243032350(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_243032360()
{
  return sub_243039A50();
}

uint64_t sub_243032388(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24303247C()
{
  return sub_243039A60();
}

uint64_t sub_2430324C4(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

uint64_t sub_2430324F4(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2430399C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

BOOL sub_243032564(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_243032350(*a1, *a2);
}

uint64_t sub_24303257C()
{
  return sub_24303247C();
}

uint64_t sub_243032590()
{
  return sub_243032360();
}

uint64_t sub_2430325A4()
{
  return sub_243039A60();
}

uint64_t sub_2430325F0()
{
  return sub_2430324C4(*v0);
}

uint64_t sub_243032604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243032388(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_243032638@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2430347FC();
  *a1 = result;
  return result;
}

uint64_t sub_24303266C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2430326C0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_243032714()
{
  return 12383;
}

uint64_t sub_243032724@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_24303281C(a1, (uint64_t (*)(void, void, void))sub_2430125E4, a2);
}

uint64_t sub_24303273C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_243032790(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2430327E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2430324F4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24303281C@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243032858(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2430328AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_243032900(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v40 = v6;
  uint64_t v7 = sub_2430399B0();
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v32 - v8;
  uint64_t v9 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v35 = v9;
  uint64_t v32 = v10;
  uint64_t v11 = sub_2430399B0();
  uint64_t v37 = *(void *)(v11 - 8);
  uint64_t v38 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v34 = (char *)&v32 - v13;
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v33 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = v5;
  uint64_t v45 = v4;
  type metadata accessor for ServiceResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v19 = sub_2430399B0();
  uint64_t v47 = *(void *)(v19 - 8);
  uint64_t v48 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v32 - v20;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243039A90();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v46, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v22 = *v18;
    char v51 = 1;
    uint64_t v23 = v41;
    uint64_t v24 = v48;
    sub_2430398F0();
    char v50 = v22;
    sub_243032E4C();
    uint64_t v25 = v43;
    sub_2430399A0();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v25);
  }
  else
  {
    uint64_t v26 = v36;
    uint64_t v27 = v33;
    uint64_t v28 = v45;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v18, v45);
    char v49 = 0;
    uint64_t v29 = v34;
    uint64_t v24 = v48;
    sub_2430398F0();
    uint64_t v30 = v38;
    sub_2430399A0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v24);
}

uint64_t type metadata accessor for ServiceResult.FailureCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ServiceResult.SuccessCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ServiceResult.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_243032E4C()
{
  unint64_t result = qword_268D70908;
  if (!qword_268D70908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70908);
  }
  return result;
}

uint64_t sub_243032EA0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v62 = a4;
  uint64_t v7 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v60 = v7;
  uint64_t v52 = sub_2430398E0();
  uint64_t v55 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  int v61 = (char *)&v47 - v8;
  uint64_t v9 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v57 = v9;
  uint64_t v51 = sub_2430398E0();
  uint64_t v54 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  unint64_t v58 = (char *)&v47 - v10;
  type metadata accessor for ServiceResult.CodingKeys();
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v11 = sub_2430398E0();
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v47 - v12;
  uint64_t v66 = a2;
  uint64_t v53 = a3;
  uint64_t v63 = type metadata accessor for ServiceResult();
  uint64_t v50 = *(void *)(v63 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v63);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v47 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v47 - v20;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v22 = v72;
  sub_243039A80();
  if (v22) {
    goto LABEL_7;
  }
  uint64_t v67 = (uint64_t)v19;
  uint64_t v48 = v16;
  char v49 = v21;
  uint64_t v23 = v65;
  unint64_t v72 = a1;
  *(void *)&long long v68 = sub_2430398D0();
  sub_243039610();
  swift_getWitnessTable();
  *(void *)&long long v70 = sub_243039740();
  *((void *)&v70 + 1) = v24;
  *(void *)&long long v71 = v25;
  *((void *)&v71 + 1) = v26;
  sub_243039730();
  swift_getWitnessTable();
  sub_243039690();
  char v27 = v68;
  if (v68 == 2 || (long long v47 = v70, v68 = v70, v69 = v71, (sub_2430396A0() & 1) == 0))
  {
    uint64_t v32 = sub_243039790();
    swift_allocError();
    uint64_t v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E0);
    *uint64_t v34 = v63;
    sub_2430397F0();
    sub_243039780();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCB0], v32);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v23);
    a1 = v72;
LABEL_7:
    uint64_t v35 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v35);
  }
  if (v27)
  {
    LOBYTE(v68) = 1;
    uint64_t v37 = v61;
    sub_2430397E0();
    uint64_t v45 = v62;
    sub_24303368C();
    uint64_t v38 = v52;
    sub_2430398B0();
    uint64_t v39 = v37;
    uint64_t v40 = v64;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v38);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v23);
    uint64_t v46 = v48;
    *uint64_t v48 = v68;
    uint64_t v41 = v63;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v44 = v49;
    v42(v49, v46, v41);
  }
  else
  {
    LOBYTE(v68) = 0;
    uint64_t v28 = v58;
    sub_2430397E0();
    uint64_t v29 = v67;
    uint64_t v30 = v51;
    sub_2430398B0();
    uint64_t v31 = v64;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v28, v30);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v23);
    uint64_t v41 = v63;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v43 = v29;
    uint64_t v44 = v49;
    v42(v49, (char *)v43, v41);
    uint64_t v45 = v62;
  }
  v42(v45, v44, v41);
  uint64_t v35 = (uint64_t)v72;
  return __swift_destroy_boxed_opaque_existential_1(v35);
}

unint64_t sub_24303368C()
{
  unint64_t result = qword_268D70910;
  if (!qword_268D70910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70910);
  }
  return result;
}

uint64_t sub_2430336E0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_243032EA0(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_243033704(void *a1, uint64_t a2)
{
  return sub_243032900(a1, a2);
}

uint64_t sub_24303371C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_243033724()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_2430337B8(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 1uLL) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  uint64_t v6 = *(_DWORD *)(v4 + 80);
  if (v6 > 7 || (*(_DWORD *)(v4 + 80) & 0x100000) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v9 = *(void *)a2;
    *char v3 = *(void *)a2;
    char v3 = (void *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  else
  {
    unsigned int v10 = a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a2;
          goto LABEL_22;
        case 2:
          int v13 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v13 = *(_DWORD *)a2;
LABEL_22:
          int v14 = (v13 | (v11 << (8 * v5))) + 2;
          unsigned int v10 = v13 + 2;
          if (v5 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      a1[v5] = 1;
    }
    else
    {
      (*(void (**)(unsigned char *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

unsigned __int8 *sub_243033928(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 1) {
    unint64_t v2 = 1;
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 != 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

unsigned char *sub_243033A20(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_243033B54(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

unsigned char *sub_243033D5C(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_243033E90(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_243034098(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v3 + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_23;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 < 2)
    {
LABEL_23:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_23;
  }
LABEL_15:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_2430341C8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x24303438CLL);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_2430343B4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  if (*(void *)(v2 + 64) <= 1uLL) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_243034468(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    size_t v4 = 1;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_24303453C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *sub_243034544(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243034610);
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

unsigned char *sub_24303463C(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2430346D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_243034700()
{
  return swift_getWitnessTable();
}

uint64_t sub_24303471C()
{
  return swift_getWitnessTable();
}

uint64_t sub_243034738()
{
  return swift_getWitnessTable();
}

uint64_t sub_243034754()
{
  return swift_getWitnessTable();
}

uint64_t sub_243034770()
{
  return swift_getWitnessTable();
}

uint64_t sub_24303478C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2430347A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2430347C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2430347E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2430347FC()
{
  return 2;
}

void sub_243034804(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_243038A9C;
  v7[3] = &block_descriptor_12;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_handleHeartbeatWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_2430348BC()
{
  return MEMORY[0x270FA2498](sub_2430348D8, 0, 0);
}

uint64_t sub_2430348D8()
{
  if (qword_268D70218 != -1) {
    swift_once();
  }
  if (qword_268D78868)
  {
    unsigned int v4 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70370 + dword_268D70370);
    unint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 16) = v1;
    void *v1 = v0;
    v1[1] = sub_24300857C;
    return v4((uint64_t)sub_243034804, 0);
  }
  else
  {
    int v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_2430349FC(uint64_t a1)
{
  unint64_t v2 = sub_243034B84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243034A38(uint64_t a1)
{
  unint64_t v2 = sub_243034B84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243034A74(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70920);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243034B84();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_243034B84()
{
  unint64_t result = qword_268D70928;
  if (!qword_268D70928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70928);
  }
  return result;
}

ValueMetadata *type metadata accessor for WoofRequest()
{
  return &type metadata for WoofRequest;
}

ValueMetadata *type metadata accessor for WoofRequest.CodingKeys()
{
  return &type metadata for WoofRequest.CodingKeys;
}

unint64_t sub_243034BFC()
{
  unint64_t result = qword_268D70930;
  if (!qword_268D70930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70930);
  }
  return result;
}

unint64_t sub_243034C54()
{
  unint64_t result = qword_268D70938;
  if (!qword_268D70938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70938);
  }
  return result;
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

void sub_243034CC0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_243038A9C;
  v7[3] = &block_descriptor_8;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_getDeveloperModeEnabledWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_243034D78()
{
  return MEMORY[0x270FA2498](sub_243034D94, 0, 0);
}

uint64_t sub_243034D94()
{
  if (qword_268D701B0 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268D70360 + dword_268D70360);
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_243010C90;
  return v3((uint64_t)sub_243034CC0, 0);
}

uint64_t sub_243034E84(char a1)
{
  *(unsigned char *)(v1 + 48) = a1;
  return MEMORY[0x270FA2498](sub_243034EA4, 0, 0);
}

uint64_t sub_243034EA4()
{
  if (qword_268D701B0 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v2 + 16) = v1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *(void *)(v3 + 16) = sub_24303528C;
  *(void *)(v3 + 24) = v2;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t))&aHkD[*(int *)aHkD];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_243034FD8;
  return v6((uint64_t)sub_243019DB8, v3);
}

uint64_t sub_243034FD8()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243035158;
  }
  else {
    uint64_t v2 = sub_2430350EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2430350EC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243035158()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2430351C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  v9[4] = a4;
  v9[5] = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_243038A9C;
  v9[3] = &block_descriptor_13;
  unsigned int v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setDeveloperModeEnabled_reply_, a6 & 1, v8);
  _Block_release(v8);
}

void sub_24303528C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2430351C4(a1, a2, a3, a4, a5, *(unsigned char *)(v5 + 16));
}

uint64_t sub_243035294(uint64_t a1)
{
  unint64_t v2 = sub_24303541C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430352D0(uint64_t a1)
{
  unint64_t v2 = sub_24303541C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24303530C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70950);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24303541C();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24303541C()
{
  unint64_t result = qword_268D70958;
  if (!qword_268D70958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70958);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest()
{
  return &type metadata for DeveloperModeRequest;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest.CodingKeys()
{
  return &type metadata for DeveloperModeRequest.CodingKeys;
}

unint64_t sub_243035494()
{
  unint64_t result = qword_268D70960;
  if (!qword_268D70960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70960);
  }
  return result;
}

unint64_t sub_2430354EC()
{
  unint64_t result = qword_268D70968;
  if (!qword_268D70968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70968);
  }
  return result;
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

id sub_243035560()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F8841D8);

  return v0;
}

id sub_2430355B4()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_243035670()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_2430394D0();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_243035718()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2430357BC()
{
  sub_2430393F0();
  swift_allocObject();
  sub_2430393E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C0680);
  sub_243035C60();
  sub_2430393D0();
  swift_release();
  uint64_t v0 = *(void *)(v11 + 16);
  if (v0)
  {
    id v1 = (uint64_t *)(v11 + 40);
    uint64_t v2 = MEMORY[0x263F8D310];
    do
    {
      uint64_t v3 = *v1;
      if (*v1)
      {
        uint64_t v4 = *(v1 - 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D70970);
        uint64_t v5 = swift_allocObject();
        *(_OWORD *)(v5 + 16) = xmmword_24303AD00;
        *(void *)(v5 + 56) = v2;
        *(void *)(v5 + 32) = v4;
        *(void *)(v5 + 40) = v3;
        swift_bridgeObjectRetain_n();
        sub_243039A30();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_26B0C0678 != -1) {
          swift_once();
        }
        uint64_t v6 = sub_243039520();
        __swift_project_value_buffer(v6, (uint64_t)qword_26B0C16E8);
        uint64_t v7 = sub_243039500();
        os_log_type_t v8 = sub_2430396D0();
        if (os_log_type_enabled(v7, v8))
        {
          int v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int v9 = 0;
          _os_log_impl(&dword_243006000, v7, v8, "Connection established", v9, 2u);
          MEMORY[0x245672970](v9, -1, -1);
        }
      }
      v1 += 2;
      --v0;
    }
    while (v0);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_243035B7C()
{
  return type metadata accessor for XPCClient();
}

uint64_t type metadata accessor for XPCClient()
{
  uint64_t result = qword_26B0C0668;
  if (!qword_26B0C0668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_243035BD0()
{
  uint64_t result = sub_2430394E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_243035C60()
{
  unint64_t result = qword_26B0C0688;
  if (!qword_26B0C0688)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B0C0680);
    sub_243035CD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0688);
  }
  return result;
}

unint64_t sub_243035CD4()
{
  unint64_t result = qword_26B0C0630;
  if (!qword_26B0C0630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C0630);
  }
  return result;
}

uint64_t sub_243035D28()
{
  uint64_t v3 = &type metadata for FeatureFlag;
  unint64_t v4 = sub_243012508();
  v2[0] = 0;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

uint64_t sub_243035D7C()
{
  uint64_t v3 = &type metadata for FeatureFlag;
  unint64_t v4 = sub_243012508();
  v2[0] = 1;
  char v0 = sub_2430394F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243035EA0);
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

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_243035EDC()
{
  unint64_t result = qword_268D70978;
  if (!qword_268D70978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70978);
  }
  return result;
}

const char *sub_243035F30()
{
  return "AdAttributionKit";
}

const char *sub_243035F44()
{
  if (*v0) {
    return "Testing";
  }
  else {
    return "Service";
  }
}

unint64_t sub_243035F6C(char a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6165627472616568;
      break;
    case 2:
      unint64_t result = 0x6F68747541746F6ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2430360AC()
{
  return sub_243035F6C(*v0);
}

uint64_t sub_2430360B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2430371C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_2430360DC(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_2430360E8(uint64_t a1)
{
  unint64_t v2 = sub_243036E1C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243036124(uint64_t a1)
{
  unint64_t v2 = sub_243036E1C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036160(uint64_t a1)
{
  unint64_t v2 = sub_243036FC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24303619C(uint64_t a1)
{
  unint64_t v2 = sub_243036FC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430361D8(uint64_t a1)
{
  unint64_t v2 = sub_2430370BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243036214(uint64_t a1)
{
  unint64_t v2 = sub_2430370BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036250(uint64_t a1)
{
  unint64_t v2 = sub_243036F18();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24303628C(uint64_t a1)
{
  unint64_t v2 = sub_243036F18();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430362C8(uint64_t a1)
{
  unint64_t v2 = sub_243036EC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243036304(uint64_t a1)
{
  unint64_t v2 = sub_243036EC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036340(uint64_t a1)
{
  unint64_t v2 = sub_243036E70();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24303637C(uint64_t a1)
{
  unint64_t v2 = sub_243036E70();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430363B8(uint64_t a1)
{
  unint64_t v2 = sub_243036F6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430363F4(uint64_t a1)
{
  unint64_t v2 = sub_243036F6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036430(uint64_t a1)
{
  unint64_t v2 = sub_243037068();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24303646C(uint64_t a1)
{
  unint64_t v2 = sub_243037068();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2430364A8(uint64_t a1)
{
  unint64_t v2 = sub_243037014();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2430364E4(uint64_t a1)
{
  unint64_t v2 = sub_243037014();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036520(uint64_t a1)
{
  unint64_t v2 = sub_243037110();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24303655C(uint64_t a1)
{
  unint64_t v2 = sub_243037110();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243036598(void *a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70980);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v52 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70988);
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v5);
  char v49 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70990);
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70998);
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v43 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709A0);
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709A8);
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709B0);
  uint64_t v35 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709B8);
  uint64_t v34 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709C0);
  uint64_t v33 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D709C8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v56 = v22;
  uint64_t v57 = v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v33 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243036E1C();
  sub_243039A90();
  switch((char)v55)
  {
    case 1:
      char v59 = 1;
      sub_2430370BC();
      uint64_t v28 = v56;
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v16);
      goto LABEL_12;
    case 2:
      char v60 = 2;
      sub_243037068();
      uint64_t v28 = v56;
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
      goto LABEL_12;
    case 3:
      char v61 = 3;
      sub_243037014();
      uint64_t v29 = v37;
      uint64_t v28 = v56;
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v39);
      goto LABEL_12;
    case 4:
      char v62 = 4;
      sub_243036FC0();
      uint64_t v30 = v40;
      uint64_t v28 = v56;
      sub_2430398F0();
      uint64_t v32 = v41;
      uint64_t v31 = v42;
      goto LABEL_11;
    case 5:
      char v63 = 5;
      sub_243036F6C();
      uint64_t v30 = v43;
      uint64_t v28 = v56;
      sub_2430398F0();
      uint64_t v32 = v44;
      uint64_t v31 = v45;
      goto LABEL_11;
    case 6:
      char v64 = 6;
      sub_243036F18();
      uint64_t v30 = v46;
      uint64_t v28 = v56;
      sub_2430398F0();
      uint64_t v32 = v47;
      uint64_t v31 = v48;
      goto LABEL_11;
    case 7:
      char v65 = 7;
      sub_243036EC4();
      uint64_t v30 = v49;
      uint64_t v28 = v56;
      sub_2430398F0();
      uint64_t v32 = v50;
      uint64_t v31 = v51;
      goto LABEL_11;
    case 8:
      char v66 = 8;
      sub_243036E70();
      uint64_t v30 = v52;
      uint64_t v28 = v56;
      sub_2430398F0();
      uint64_t v32 = v53;
      uint64_t v31 = v54;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
LABEL_12:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v25, v28);
      break;
    default:
      char v58 = 0;
      sub_243037110();
      uint64_t v26 = v56;
      sub_2430398F0();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v19);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v25, v26);
      break;
  }
  return result;
}

unint64_t sub_243036E1C()
{
  unint64_t result = qword_268D709D0;
  if (!qword_268D709D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709D0);
  }
  return result;
}

unint64_t sub_243036E70()
{
  unint64_t result = qword_268D709D8;
  if (!qword_268D709D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709D8);
  }
  return result;
}

unint64_t sub_243036EC4()
{
  unint64_t result = qword_268D709E0;
  if (!qword_268D709E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709E0);
  }
  return result;
}

unint64_t sub_243036F18()
{
  unint64_t result = qword_268D709E8;
  if (!qword_268D709E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709E8);
  }
  return result;
}

unint64_t sub_243036F6C()
{
  unint64_t result = qword_268D709F0;
  if (!qword_268D709F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709F0);
  }
  return result;
}

unint64_t sub_243036FC0()
{
  unint64_t result = qword_268D709F8;
  if (!qword_268D709F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D709F8);
  }
  return result;
}

unint64_t sub_243037014()
{
  unint64_t result = qword_268D70A00;
  if (!qword_268D70A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A00);
  }
  return result;
}

unint64_t sub_243037068()
{
  unint64_t result = qword_268D70A08;
  if (!qword_268D70A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A08);
  }
  return result;
}

unint64_t sub_2430370BC()
{
  unint64_t result = qword_268D70A10;
  if (!qword_268D70A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A10);
  }
  return result;
}

unint64_t sub_243037110()
{
  unint64_t result = qword_268D70A18;
  if (!qword_268D70A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A18);
  }
  return result;
}

char *sub_243037164(void *a1)
{
  return sub_243037568(a1);
}

char *sub_24303717C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_243037568(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_2430371A8(void *a1)
{
  return sub_243036598(a1, *v1);
}

uint64_t sub_2430371C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165627472616568 && a2 == 0xE900000000000074 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F68747541746F6ELL && a2 == 0xED000064657A6972 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024303F8F0 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000024303F910 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024303F930 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024303F950 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000024303F970 || (sub_2430399C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024303F990)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_2430399C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

char *sub_243037568(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AD0);
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v65 = v2;
  MEMORY[0x270FA5388](v2);
  long long v69 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AD8);
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v72 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AE0);
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  MEMORY[0x270FA5388](v6);
  long long v68 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AE8);
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  long long v71 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AF0);
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v57 = v10;
  MEMORY[0x270FA5388](v10);
  long long v70 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70AF8);
  uint64_t v55 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v67 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70B00);
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  char v66 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70B08);
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70B10);
  uint64_t v49 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70B18);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  unint64_t v73 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_243036E1C();
  uint64_t v24 = v74;
  sub_243039A80();
  if (!v24)
  {
    uint64_t v48 = v18;
    uint64_t v47 = v16;
    uint64_t v26 = v70;
    uint64_t v25 = v71;
    char v27 = v72;
    uint64_t v74 = v20;
    uint64_t v28 = v22;
    uint64_t v29 = sub_2430398D0();
    if (*(void *)(v29 + 16) == 1)
    {
      uint64_t v22 = (char *)*(unsigned __int8 *)(v29 + 32);
      switch(*(unsigned char *)(v29 + 32))
      {
        case 1:
          uint64_t v30 = v74;
          char v76 = 1;
          sub_2430370BC();
          sub_2430397E0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v51 + 8);
          uint64_t v33 = v15;
          uint64_t v34 = &v86;
          goto LABEL_9;
        case 2:
          uint64_t v30 = v74;
          char v77 = 2;
          sub_243037068();
          uint64_t v39 = v66;
          sub_2430397E0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v53 + 8);
          uint64_t v33 = v39;
          uint64_t v34 = &v87;
          goto LABEL_9;
        case 3:
          uint64_t v30 = v74;
          char v78 = 3;
          sub_243037014();
          uint64_t v40 = v67;
          sub_2430397E0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v55 + 8);
          uint64_t v33 = v40;
          uint64_t v34 = &v85;
          goto LABEL_9;
        case 4:
          uint64_t v30 = v74;
          char v79 = 4;
          sub_243036FC0();
          uint64_t v25 = v26;
          sub_2430397E0();
          uint64_t v42 = v56;
          uint64_t v41 = v57;
          goto LABEL_16;
        case 5:
          uint64_t v30 = v74;
          char v80 = 5;
          sub_243036F6C();
          sub_2430397E0();
          uint64_t v42 = v58;
          uint64_t v41 = v59;
          goto LABEL_16;
        case 6:
          uint64_t v30 = v74;
          char v81 = 6;
          sub_243036F18();
          uint64_t v25 = v68;
          sub_2430397E0();
          uint64_t v42 = v60;
          uint64_t v41 = v61;
LABEL_16:
          uint64_t v32 = *(void (**)(char *, uint64_t))(v42 + 8);
          uint64_t v33 = v25;
          goto LABEL_17;
        case 7:
          uint64_t v44 = v74;
          char v82 = 7;
          sub_243036EC4();
          sub_2430397E0();
          (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v63);
          swift_bridgeObjectRelease();
          uint64_t v30 = v44;
          goto LABEL_18;
        case 8:
          uint64_t v45 = v74;
          char v83 = 8;
          sub_243036E70();
          uint64_t v46 = v69;
          sub_2430397E0();
          (*(void (**)(char *, uint64_t))(v64 + 8))(v46, v65);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v19);
          break;
        default:
          uint64_t v30 = v74;
          char v75 = 0;
          sub_243037110();
          uint64_t v31 = v48;
          sub_2430397E0();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v49 + 8);
          uint64_t v33 = v31;
          uint64_t v34 = &v84;
LABEL_9:
          uint64_t v41 = *(v34 - 32);
LABEL_17:
          v32(v33, v41);
          swift_bridgeObjectRelease();
LABEL_18:
          (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v19);
          break;
      }
    }
    else
    {
      uint64_t v35 = v19;
      uint64_t v36 = sub_243039790();
      swift_allocError();
      uint64_t v38 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D702E0);
      *uint64_t v38 = &type metadata for AttributionKitError;
      sub_2430397F0();
      sub_243039780();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCB0], v36);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v22, v35);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
  return v22;
}

unint64_t sub_24303801C()
{
  unint64_t result = qword_268D70A20;
  if (!qword_268D70A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A20);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError()
{
  return &type metadata for AttributionKitError;
}

uint64_t _s20AttributionKitCommon19AttributionKitErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s20AttributionKitCommon19AttributionKitErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x2430381E4);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError.CodingKeys()
{
  return &type metadata for AttributionKitError.CodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.UnknownCodingKeys()
{
  return &type metadata for AttributionKitError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.HeartbeatCodingKeys()
{
  return &type metadata for AttributionKitError.HeartbeatCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.NotAuthorizedCodingKeys()
{
  return &type metadata for AttributionKitError.NotAuthorizedCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ServiceUnavailableCodingKeys()
{
  return &type metadata for AttributionKitError.ServiceUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.GenericNetworkRequestFailureCodingKeys()
{
  return &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.MissingAttributionViewCodingKeys()
{
  return &type metadata for AttributionKitError.MissingAttributionViewCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ImpressionExpiredCodingKeys()
{
  return &type metadata for AttributionKitError.ImpressionExpiredCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys;
}

unint64_t sub_2430382B0()
{
  unint64_t result = qword_268D70A28;
  if (!qword_268D70A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A28);
  }
  return result;
}

unint64_t sub_243038308()
{
  unint64_t result = qword_268D70A30;
  if (!qword_268D70A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A30);
  }
  return result;
}

unint64_t sub_243038360()
{
  unint64_t result = qword_268D70A38;
  if (!qword_268D70A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A38);
  }
  return result;
}

unint64_t sub_2430383B8()
{
  unint64_t result = qword_268D70A40;
  if (!qword_268D70A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A40);
  }
  return result;
}

unint64_t sub_243038410()
{
  unint64_t result = qword_268D70A48;
  if (!qword_268D70A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A48);
  }
  return result;
}

unint64_t sub_243038468()
{
  unint64_t result = qword_268D70A50;
  if (!qword_268D70A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A50);
  }
  return result;
}

unint64_t sub_2430384C0()
{
  unint64_t result = qword_268D70A58;
  if (!qword_268D70A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A58);
  }
  return result;
}

unint64_t sub_243038518()
{
  unint64_t result = qword_268D70A60;
  if (!qword_268D70A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A60);
  }
  return result;
}

unint64_t sub_243038570()
{
  unint64_t result = qword_268D70A68;
  if (!qword_268D70A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A68);
  }
  return result;
}

unint64_t sub_2430385C8()
{
  unint64_t result = qword_268D70A70;
  if (!qword_268D70A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A70);
  }
  return result;
}

unint64_t sub_243038620()
{
  unint64_t result = qword_268D70A78;
  if (!qword_268D70A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A78);
  }
  return result;
}

unint64_t sub_243038678()
{
  unint64_t result = qword_268D70A80;
  if (!qword_268D70A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A80);
  }
  return result;
}

unint64_t sub_2430386D0()
{
  unint64_t result = qword_268D70A88;
  if (!qword_268D70A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A88);
  }
  return result;
}

unint64_t sub_243038728()
{
  unint64_t result = qword_268D70A90;
  if (!qword_268D70A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A90);
  }
  return result;
}

unint64_t sub_243038780()
{
  unint64_t result = qword_268D70A98;
  if (!qword_268D70A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70A98);
  }
  return result;
}

unint64_t sub_2430387D8()
{
  unint64_t result = qword_268D70AA0;
  if (!qword_268D70AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AA0);
  }
  return result;
}

unint64_t sub_243038830()
{
  unint64_t result = qword_268D70AA8;
  if (!qword_268D70AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AA8);
  }
  return result;
}

unint64_t sub_243038888()
{
  unint64_t result = qword_268D70AB0;
  if (!qword_268D70AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AB0);
  }
  return result;
}

unint64_t sub_2430388E0()
{
  unint64_t result = qword_268D70AB8;
  if (!qword_268D70AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AB8);
  }
  return result;
}

unint64_t sub_243038938()
{
  unint64_t result = qword_268D70AC0;
  if (!qword_268D70AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AC0);
  }
  return result;
}

unint64_t sub_243038990()
{
  unint64_t result = qword_268D70AC8;
  if (!qword_268D70AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70AC8);
  }
  return result;
}

void sub_2430389E4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_243038A9C;
  v7[3] = &block_descriptor_14;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_fetchReengagementTokensWithReply_, v6);
  _Block_release(v6);
}

uint64_t sub_243038A9C(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = sub_2430394A0();
  unint64_t v7 = v6;

  v3(v5, v7);
  sub_243014ACC(v5, v7);

  return swift_release();
}

uint64_t sub_243038B24()
{
  if (qword_268D701B8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_268D78758) {
    return sub_24301CDDC((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_2430389E4);
  }
  return result;
}

uint64_t sub_243038BA8(uint64_t a1)
{
  unint64_t v2 = sub_243038D30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243038BE4(uint64_t a1)
{
  unint64_t v2 = sub_243038D30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243038C20(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D70B20);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243038D30();
  sub_243039A90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_243038D30()
{
  unint64_t result = qword_268D70B28;
  if (!qword_268D70B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70B28);
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenFetchRequest()
{
  return &type metadata for TokenFetchRequest;
}

ValueMetadata *type metadata accessor for TokenFetchRequest.CodingKeys()
{
  return &type metadata for TokenFetchRequest.CodingKeys;
}

unint64_t sub_243038DA8()
{
  unint64_t result = qword_268D70B30;
  if (!qword_268D70B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70B30);
  }
  return result;
}

unint64_t sub_243038E00()
{
  unint64_t result = qword_268D70B38;
  if (!qword_268D70B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70B38);
  }
  return result;
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_243038E70(char a1)
{
  if (!a1) {
    return 1751607656;
  }
  if (a1 == 1) {
    return 7827308;
  }
  return 0x6D756964656DLL;
}

uint64_t sub_243038EB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2430244D4(*a1, *a2);
}

uint64_t sub_243038EC0()
{
  return sub_243039A60();
}

uint64_t sub_243038F50()
{
  sub_243039560();

  return swift_bridgeObjectRelease();
}

uint64_t sub_243038FCC()
{
  return sub_243039A60();
}

uint64_t sub_243039058@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_243039184();
  *a1 = result;
  return result;
}

void sub_243039088(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 7827308;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6D756964656DLL;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1751607656;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2430390D4()
{
  return sub_2430395F0();
}

uint64_t sub_243039134()
{
  return sub_2430395E0();
}

uint64_t sub_243039184()
{
  unint64_t v0 = sub_2430397D0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_2430391D4()
{
  unint64_t result = qword_268D70B40;
  if (!qword_268D70B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70B40);
  }
  return result;
}

unint64_t sub_24303932C()
{
  unint64_t result = qword_268D70B48;
  if (!qword_268D70B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D70B48);
  }
  return result;
}

uint64_t sub_243039380()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_243039390()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_2430393A0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2430393B0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2430393C0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2430393D0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2430393E0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2430393F0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_243039400()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_243039410()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_243039420()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_243039430()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_243039440()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_243039450()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_243039460()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_243039470()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_243039480()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_243039490()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2430394A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2430394C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2430394D0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2430394E0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2430394F0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_243039500()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_243039510()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_243039520()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_243039530()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_243039540()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_243039550()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_243039560()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_243039570()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_243039580()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_243039590()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2430395A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2430395B0()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_2430395C0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2430395D0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2430395E0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2430395F0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_243039600()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_243039610()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_243039620()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_243039630()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_243039640()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_243039650()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_243039660()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_243039670()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_243039680()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_243039690()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_2430396A0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2430396B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2430396C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2430396D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2430396E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2430396F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_243039700()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_243039710()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_243039720()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_243039730()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_243039740()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_243039750()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_243039760()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_243039770()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_243039780()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_243039790()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2430397A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2430397B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2430397C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2430397D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2430397E0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2430397F0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_243039800()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_243039810()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_243039820()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_243039830()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_243039840()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_243039850()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_243039860()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_243039870()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_243039880()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_243039890()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2430398A0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2430398B0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2430398C0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_2430398D0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2430398E0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2430398F0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_243039900()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_243039910()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_243039920()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_243039930()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_243039940()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_243039950()
{
  return MEMORY[0x270F9F410]();
}

uint64_t sub_243039960()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_243039970()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_243039980()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_243039990()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2430399A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2430399B0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_2430399C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2430399E0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2430399F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_243039A00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_243039A10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_243039A20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_243039A30()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_243039A40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_243039A50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_243039A60()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_243039A70()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_243039A80()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_243039A90()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}