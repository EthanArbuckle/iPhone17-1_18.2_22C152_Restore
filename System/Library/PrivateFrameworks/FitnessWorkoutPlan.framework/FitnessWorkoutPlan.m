unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL static PlanCompletionMonitorState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F3B9AC4()
{
  return 0;
}

uint64_t sub_24F3B9AD0()
{
  return 0;
}

void sub_24F3B9ADC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F3B9AE8(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA0B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3B9B24(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA0B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24F3B9B60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F3B9B7C()
{
  return sub_24F3E38E0();
}

uint64_t sub_24F3B9BAC()
{
  if (*v0) {
    return 0x657669746361;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_24F3B9BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3BABD4(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3B9C04(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F3B9C10(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA05C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3B9C4C(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA05C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3B9C88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24F3B9CB8(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA104();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3B9CF4(uint64_t a1)
{
  unint64_t v2 = sub_24F3BA104();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlanCompletionMonitorState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBB8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBC0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBC8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BA05C();
  sub_24F3E3920();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F3BA0B0();
    v14 = v18;
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F3BA104();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
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

unint64_t sub_24F3BA05C()
{
  unint64_t result = qword_269A0BBD0;
  if (!qword_269A0BBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BBD0);
  }
  return result;
}

unint64_t sub_24F3BA0B0()
{
  unint64_t result = qword_269A0BBD8;
  if (!qword_269A0BBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BBD8);
  }
  return result;
}

unint64_t sub_24F3BA104()
{
  unint64_t result = qword_269A0BBE0;
  if (!qword_269A0BBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BBE0);
  }
  return result;
}

uint64_t PlanCompletionMonitorState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBE8);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBF0);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BBF8);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BA05C();
  v11 = v32;
  sub_24F3E3910();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_24F3E3840();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F3E37C0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    *char v22 = &type metadata for PlanCompletionMonitorState;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24F3BA0B0();
    v18 = v14;
    sub_24F3E37D0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F3BA104();
    sub_24F3E37D0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
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

uint64_t sub_24F3BA600@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return PlanCompletionMonitorState.init(from:)(a1, a2);
}

uint64_t sub_24F3BA618(void *a1)
{
  return PlanCompletionMonitorState.encode(to:)(a1);
}

uint64_t PlanCompletionMonitorState.hash(into:)()
{
  return sub_24F3E38E0();
}

uint64_t PlanCompletionMonitorState.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3BA6A4()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3BA6EC()
{
  return sub_24F3E3900();
}

unint64_t sub_24F3BA734()
{
  unint64_t result = qword_269A0BC08;
  if (!qword_269A0BC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC08);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState()
{
  return &type metadata for PlanCompletionMonitorState;
}

uint64_t getEnumTagSinglePayload for PlanCompletionState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18FitnessWorkoutPlan26PlanCompletionMonitorStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3BA900);
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

uint64_t sub_24F3BA928(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F3BA930(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.CodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.IdleCodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionMonitorState.ActiveCodingKeys()
{
  return &type metadata for PlanCompletionMonitorState.ActiveCodingKeys;
}

unint64_t sub_24F3BA970()
{
  unint64_t result = qword_269A0BC10;
  if (!qword_269A0BC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC10);
  }
  return result;
}

unint64_t sub_24F3BA9C8()
{
  unint64_t result = qword_269A0BC18;
  if (!qword_269A0BC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC18);
  }
  return result;
}

unint64_t sub_24F3BAA20()
{
  unint64_t result = qword_269A0BC20;
  if (!qword_269A0BC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC20);
  }
  return result;
}

unint64_t sub_24F3BAA78()
{
  unint64_t result = qword_269A0BC28;
  if (!qword_269A0BC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC28);
  }
  return result;
}

unint64_t sub_24F3BAAD0()
{
  unint64_t result = qword_269A0BC30;
  if (!qword_269A0BC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC30);
  }
  return result;
}

unint64_t sub_24F3BAB28()
{
  unint64_t result = qword_269A0BC38;
  if (!qword_269A0BC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC38);
  }
  return result;
}

unint64_t sub_24F3BAB80()
{
  unint64_t result = qword_269A0BC40;
  if (!qword_269A0BC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC40);
  }
  return result;
}

uint64_t sub_24F3BABD4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24F3BACBC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24F3BACDC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_269A0BC48)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269A0BC48);
    }
  }
}

uint64_t PlanCompletionEnvironment.makeSessionSummaryDismissedStream.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.makeSignificantTimeChangeStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.presentPlanCompletionIfNeeded.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t PlanCompletionEnvironment.init(makeSessionSummaryDismissedStream:makeSignificantTimeChangeStream:presentPlanCompletionIfNeeded:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PlanCompletionEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PlanCompletionEnvironment()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PlanCompletionEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PlanCompletionEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for PlanCompletionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanCompletionEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanCompletionEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionEnvironment()
{
  return &type metadata for PlanCompletionEnvironment;
}

BOOL static PlanCompletionAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PlanCompletionAction.hash(into:)()
{
  return sub_24F3E38E0();
}

uint64_t sub_24F3BB0B8()
{
  if (*v0) {
    return 0x6570704177656976;
  }
  else {
    return 0xD00000000000001DLL;
  }
}

uint64_t sub_24F3BB100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3BBEF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3BB128(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB57C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BB164(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB57C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BB1A0(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB624();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BB1DC(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB624();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BB218(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB5D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BB254(uint64_t a1)
{
  unint64_t v2 = sub_24F3BB5D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlanCompletionAction.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t PlanCompletionAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B78);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B68);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B70);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BB57C();
  sub_24F3E3920();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F3BB5D0();
    v14 = v18;
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F3BB624();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F3BB57C()
{
  unint64_t result = qword_26B1F3AA0;
  if (!qword_26B1F3AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AA0);
  }
  return result;
}

unint64_t sub_24F3BB5D0()
{
  unint64_t result = qword_26B1F3AB8;
  if (!qword_26B1F3AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AB8);
  }
  return result;
}

unint64_t sub_24F3BB624()
{
  unint64_t result = qword_26B1F3A88;
  if (!qword_26B1F3A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3A88);
  }
  return result;
}

uint64_t PlanCompletionAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC50);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC58);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC60);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BB57C();
  v11 = v32;
  sub_24F3E3910();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_24F3E3840();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F3E37C0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    *char v22 = &type metadata for PlanCompletionAction;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24F3BB5D0();
    v18 = v14;
    sub_24F3E37D0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F3BB624();
    sub_24F3E37D0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

unint64_t sub_24F3BBAD4()
{
  unint64_t result = qword_269A0BC68;
  if (!qword_269A0BC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC68);
  }
  return result;
}

uint64_t sub_24F3BBB28@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return PlanCompletionAction.init(from:)(a1, a2);
}

uint64_t sub_24F3BBB40(void *a1)
{
  return PlanCompletionAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PlanCompletionAction()
{
  return &type metadata for PlanCompletionAction;
}

unsigned char *_s18FitnessWorkoutPlan20PlanCompletionActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3BBC38);
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

ValueMetadata *type metadata accessor for PlanCompletionAction.CodingKeys()
{
  return &type metadata for PlanCompletionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys()
{
  return &type metadata for PlanCompletionAction.PresentPlanCompletionIfNeededCodingKeys;
}

ValueMetadata *type metadata accessor for PlanCompletionAction.ViewAppearedCodingKeys()
{
  return &type metadata for PlanCompletionAction.ViewAppearedCodingKeys;
}

unint64_t sub_24F3BBC94()
{
  unint64_t result = qword_269A0BC70;
  if (!qword_269A0BC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC70);
  }
  return result;
}

unint64_t sub_24F3BBCEC()
{
  unint64_t result = qword_26B1F3A98;
  if (!qword_26B1F3A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3A98);
  }
  return result;
}

unint64_t sub_24F3BBD44()
{
  unint64_t result = qword_26B1F3A90;
  if (!qword_26B1F3A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3A90);
  }
  return result;
}

unint64_t sub_24F3BBD9C()
{
  unint64_t result = qword_26B1F3AC8;
  if (!qword_26B1F3AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AC8);
  }
  return result;
}

unint64_t sub_24F3BBDF4()
{
  unint64_t result = qword_26B1F3AC0;
  if (!qword_26B1F3AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AC0);
  }
  return result;
}

unint64_t sub_24F3BBE4C()
{
  unint64_t result = qword_26B1F3AB0;
  if (!qword_26B1F3AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AB0);
  }
  return result;
}

unint64_t sub_24F3BBEA4()
{
  unint64_t result = qword_26B1F3AA8;
  if (!qword_26B1F3AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AA8);
  }
  return result;
}

uint64_t sub_24F3BBEF8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001DLL && a2 == 0x800000024F3E7CC0 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void PlanCompletionState.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *PlanCompletionState.state.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*PlanCompletionState.state.modify())()
{
  return nullsub_1;
}

FitnessWorkoutPlan::PlanCompletionState __swiftcall PlanCompletionState.init(state:)(FitnessWorkoutPlan::PlanCompletionState state)
{
  unsigned char *v1 = *(unsigned char *)state.state;
  return state;
}

uint64_t sub_24F3BC044()
{
  return 1;
}

uint64_t sub_24F3BC04C()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3BC090()
{
  return sub_24F3E38E0();
}

uint64_t sub_24F3BC0B8()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3BC0F8()
{
  return 0x6574617473;
}

uint64_t sub_24F3BC10C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F3BC19C(uint64_t a1)
{
  unint64_t v2 = sub_24F3BC35C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BC1D8(uint64_t a1)
{
  unint64_t v2 = sub_24F3BC35C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlanCompletionState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC78);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BC35C();
  sub_24F3E3920();
  char v10 = v7;
  sub_24F3BC3B0();
  sub_24F3E38A0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F3BC35C()
{
  unint64_t result = qword_269A0BC80;
  if (!qword_269A0BC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC80);
  }
  return result;
}

unint64_t sub_24F3BC3B0()
{
  unint64_t result = qword_269A0BC88;
  if (!qword_269A0BC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC88);
  }
  return result;
}

uint64_t PlanCompletionState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BC35C();
  sub_24F3E3910();
  if (!v2)
  {
    sub_24F3BC56C();
    sub_24F3E3830();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24F3BC56C()
{
  unint64_t result = qword_269A0BC98;
  if (!qword_269A0BC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BC98);
  }
  return result;
}

uint64_t sub_24F3BC5C0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return PlanCompletionState.init(from:)(a1, a2);
}

uint64_t sub_24F3BC5D8(void *a1)
{
  return PlanCompletionState.encode(to:)(a1);
}

BOOL static PlanCompletionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unsigned char *storeEnumTagSinglePayload for PlanCompletionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3BC6D4);
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

ValueMetadata *type metadata accessor for PlanCompletionState()
{
  return &type metadata for PlanCompletionState;
}

uint64_t getEnumTagSinglePayload for PlanCompletionState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PlanCompletionState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3BC7FCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F3BC824()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlanCompletionState.CodingKeys()
{
  return &type metadata for PlanCompletionState.CodingKeys;
}

unint64_t sub_24F3BC840()
{
  unint64_t result = qword_269A0BCA0;
  if (!qword_269A0BCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCA0);
  }
  return result;
}

unint64_t sub_24F3BC898()
{
  unint64_t result = qword_269A0BCA8;
  if (!qword_269A0BCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCA8);
  }
  return result;
}

unint64_t sub_24F3BC8F0()
{
  unint64_t result = qword_269A0BCB0;
  if (!qword_269A0BCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCB0);
  }
  return result;
}

BOOL static CreateWorkoutPlanButtonAction.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CreateWorkoutPlanButtonAction.hash(into:)()
{
  return sub_24F3E38E0();
}

BOOL sub_24F3BC97C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F3BC990()
{
  unint64_t v1 = 0xD000000000000017;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4164694477656976;
  }
}

uint64_t sub_24F3BCA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3BD17C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3BCA2C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F3BCA38(uint64_t a1)
{
  unint64_t v2 = sub_24F3BCFCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BCA74(uint64_t a1)
{
  unint64_t v2 = sub_24F3BCFCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BCAB0(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD074();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BCAEC(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD074();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BCB28(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD020();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BCB64(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD020();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BCBA0(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD0C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BCBDC(uint64_t a1)
{
  unint64_t v2 = sub_24F3BD0C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CreateWorkoutPlanButtonAction.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t CreateWorkoutPlanButtonAction.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BCB8);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  char v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BCC0);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BCC8);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BCD0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BCFCC();
  sub_24F3E3920();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24F3BD074();
      sub_24F3E3850();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24F3BD020();
      uint64_t v15 = v21;
      sub_24F3E3850();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24F3BD0C8();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24F3BCFCC()
{
  unint64_t result = qword_269A0BCD8;
  if (!qword_269A0BCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCD8);
  }
  return result;
}

unint64_t sub_24F3BD020()
{
  unint64_t result = qword_269A0BCE0;
  if (!qword_269A0BCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCE0);
  }
  return result;
}

unint64_t sub_24F3BD074()
{
  unint64_t result = qword_269A0BCE8;
  if (!qword_269A0BCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCE8);
  }
  return result;
}

unint64_t sub_24F3BD0C8()
{
  unint64_t result = qword_269A0BCF0;
  if (!qword_269A0BCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCF0);
  }
  return result;
}

void *CreateWorkoutPlanButtonAction.init(from:)(void *a1)
{
  return sub_24F3BD2EC(a1);
}

void *sub_24F3BD134@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24F3BD2EC(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24F3BD160(void *a1)
{
  return CreateWorkoutPlanButtonAction.encode(to:)(a1, *v1);
}

uint64_t sub_24F3BD17C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4164694477656976 && a2 == 0xED00007261657070;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024F3E7CE0 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024F3E7D00)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24F3BD2EC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD48);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD50);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD58);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD60);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BCFCC();
  uint64_t v12 = (uint64_t)v30;
  sub_24F3E3910();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  v14 = v11;
  uint64_t v15 = sub_24F3E3840();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24F3E37C0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    void *v11 = &type metadata for CreateWorkoutPlanButtonAction;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_24F3BD074();
      sub_24F3E37D0();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24F3BD020();
      sub_24F3E37D0();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24F3BD0C8();
    sub_24F3E37D0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24F3BD860()
{
  unint64_t result = qword_269A0BCF8;
  if (!qword_269A0BCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BCF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction()
{
  return &type metadata for CreateWorkoutPlanButtonAction;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupLoadState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18FitnessWorkoutPlan29CreateWorkoutPlanButtonActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3BDA28);
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

unsigned char *sub_24F3BDA50(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.CodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.ViewDidAppearCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.CreateWorkoutPlanTappedCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonAction.ShowHandoffAlertCodingKeys;
}

unint64_t sub_24F3BDA9C()
{
  unint64_t result = qword_269A0BD00;
  if (!qword_269A0BD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD00);
  }
  return result;
}

unint64_t sub_24F3BDAF4()
{
  unint64_t result = qword_269A0BD08;
  if (!qword_269A0BD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD08);
  }
  return result;
}

unint64_t sub_24F3BDB4C()
{
  unint64_t result = qword_269A0BD10;
  if (!qword_269A0BD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD10);
  }
  return result;
}

unint64_t sub_24F3BDBA4()
{
  unint64_t result = qword_269A0BD18;
  if (!qword_269A0BD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD18);
  }
  return result;
}

unint64_t sub_24F3BDBFC()
{
  unint64_t result = qword_269A0BD20;
  if (!qword_269A0BD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD20);
  }
  return result;
}

unint64_t sub_24F3BDC54()
{
  unint64_t result = qword_269A0BD28;
  if (!qword_269A0BD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD28);
  }
  return result;
}

unint64_t sub_24F3BDCAC()
{
  unint64_t result = qword_269A0BD30;
  if (!qword_269A0BD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD30);
  }
  return result;
}

unint64_t sub_24F3BDD04()
{
  unint64_t result = qword_269A0BD38;
  if (!qword_269A0BD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD38);
  }
  return result;
}

unint64_t sub_24F3BDD5C()
{
  unint64_t result = qword_269A0BD40;
  if (!qword_269A0BD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD40);
  }
  return result;
}

uint64_t PreviousPlanLockupEnvironment.init(fetchDetailForIdentifier:hasActivePlan:repeatPlan:makeWorkoutPlanUpdatedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t destroy for PreviousPlanLockupEnvironment()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PreviousPlanLockupEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PreviousPlanLockupEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

_OWORD *assignWithTake for PreviousPlanLockupEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupEnvironment(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupEnvironment()
{
  return &type metadata for PreviousPlanLockupEnvironment;
}

BOOL static CreateWorkoutPlanButtonPlacement.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CreateWorkoutPlanButtonPlacement.hash(into:)()
{
  return sub_24F3E38E0();
}

uint64_t sub_24F3BE08C()
{
  uint64_t v1 = 0x756F59726F66;
  if (*v0 != 1) {
    uint64_t v1 = 0x7972617262696CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x65726F6C707865;
  }
}

uint64_t sub_24F3BE0E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3BE850(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3BE10C(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE6A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BE148(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE6A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BE184(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE79C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BE1C0(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE79C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BE1FC(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE748();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BE238(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE748();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3BE274(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE6F4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3BE2B0(uint64_t a1)
{
  unint64_t v2 = sub_24F3BE6F4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CreateWorkoutPlanButtonPlacement.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t CreateWorkoutPlanButtonPlacement.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B60);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B50);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B58);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B48);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BE6A0();
  sub_24F3E3920();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24F3BE748();
      sub_24F3E3850();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24F3BE6F4();
      uint64_t v15 = v21;
      sub_24F3E3850();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24F3BE79C();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24F3BE6A0()
{
  unint64_t result = qword_26B1F3998;
  if (!qword_26B1F3998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3998);
  }
  return result;
}

unint64_t sub_24F3BE6F4()
{
  unint64_t result = qword_269A0BD68;
  if (!qword_269A0BD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD68);
  }
  return result;
}

unint64_t sub_24F3BE748()
{
  unint64_t result = qword_26B1F39B0;
  if (!qword_26B1F39B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39B0);
  }
  return result;
}

unint64_t sub_24F3BE79C()
{
  unint64_t result = qword_269A0BD70;
  if (!qword_269A0BD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD70);
  }
  return result;
}

void *CreateWorkoutPlanButtonPlacement.init(from:)(void *a1)
{
  return sub_24F3BE9A0(a1);
}

void *sub_24F3BE808@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24F3BE9A0(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24F3BE834(void *a1)
{
  return CreateWorkoutPlanButtonPlacement.encode(to:)(a1, *v1);
}

uint64_t sub_24F3BE850(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65726F6C707865 && a2 == 0xE700000000000000;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F59726F66 && a2 == 0xE600000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972617262696CLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24F3BE9A0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD88);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD90);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BD98);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDA0);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3BE6A0();
  uint64_t v12 = (uint64_t)v30;
  sub_24F3E3910();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  v14 = v11;
  uint64_t v15 = sub_24F3E3840();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24F3E37C0();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    void *v11 = &type metadata for CreateWorkoutPlanButtonPlacement;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_24F3BE748();
      sub_24F3E37D0();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24F3BE6F4();
      sub_24F3E37D0();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24F3BE79C();
    sub_24F3E37D0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24F3BEF14()
{
  unint64_t result = qword_269A0BD78;
  if (!qword_269A0BD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD78);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement;
}

unsigned char *_s18FitnessWorkoutPlan32CreateWorkoutPlanButtonPlacementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3BF048);
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

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.CodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.ExploreCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.ForYouCodingKeys;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonPlacement.LibraryCodingKeys;
}

unint64_t sub_24F3BF0B4()
{
  unint64_t result = qword_269A0BD80;
  if (!qword_269A0BD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BD80);
  }
  return result;
}

unint64_t sub_24F3BF10C()
{
  unint64_t result = qword_26B1F39D0;
  if (!qword_26B1F39D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39D0);
  }
  return result;
}

unint64_t sub_24F3BF164()
{
  unint64_t result = qword_26B1F39C8;
  if (!qword_26B1F39C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39C8);
  }
  return result;
}

unint64_t sub_24F3BF1BC()
{
  unint64_t result = qword_26B1F39C0;
  if (!qword_26B1F39C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39C0);
  }
  return result;
}

unint64_t sub_24F3BF214()
{
  unint64_t result = qword_26B1F39B8;
  if (!qword_26B1F39B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39B8);
  }
  return result;
}

unint64_t sub_24F3BF26C()
{
  unint64_t result = qword_26B1F39E0[0];
  if (!qword_26B1F39E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1F39E0);
  }
  return result;
}

unint64_t sub_24F3BF2C4()
{
  unint64_t result = qword_26B1F39D8;
  if (!qword_26B1F39D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39D8);
  }
  return result;
}

unint64_t sub_24F3BF31C()
{
  unint64_t result = qword_26B1F39A8;
  if (!qword_26B1F39A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39A8);
  }
  return result;
}

unint64_t sub_24F3BF374()
{
  unint64_t result = qword_26B1F39A0;
  if (!qword_26B1F39A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F39A0);
  }
  return result;
}

uint64_t RepeatReplaceAlertDetailView.init(locale:planDetail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  return sub_24F3BF4A4(a2, v7);
}

uint64_t type metadata accessor for RepeatReplaceAlertDetailView()
{
  uint64_t result = qword_269A0BDC0;
  if (!qword_269A0BDC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F3BF4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3BF510()
{
  return sub_24F3E3400();
}

uint64_t RepeatReplaceAlertDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDA8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_24F3E3280();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDB0);
  sub_24F3C0084(v2);
  unsigned __int8 v7 = sub_24F3E3320();
  unsigned __int8 v8 = sub_24F3E3300();
  char v9 = sub_24F3E3330();
  sub_24F3E3330();
  if (sub_24F3E3330() != v7) {
    char v9 = sub_24F3E3330();
  }
  sub_24F3E3330();
  if (sub_24F3E3330() != v8) {
    char v9 = sub_24F3E3330();
  }
  sub_24F3E3190();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_24F3C0CC8((uint64_t)v6, a1);
  uint64_t v18 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDB8) + 36);
  *(unsigned char *)uint64_t v18 = v9;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return sub_24F3C0D30((uint64_t)v6);
}

uint64_t sub_24F3BF6A8()
{
  return 0;
}

uint64_t sub_24F3BF90C(char *a1)
{
  uint64_t v3 = sub_24F3E3120();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3E3680();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v15 = a1;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24F3C3938(&v15);
  unsigned __int8 v8 = v15;
  MEMORY[0x270FA5388](v7);
  *(&v14 - 2) = v1;
  char v9 = (char *)sub_24F3C4588((uint64_t)v8, sub_24F3C456C);
  swift_release();
  uint64_t v15 = v9;
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1, v3);
  id v11 = v10;
  sub_24F3E36A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDF0);
  sub_24F3C4528(&qword_269A0BDF8, &qword_269A0BDF0);
  uint64_t v12 = sub_24F3E35F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_24F3BFB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_24F3E3120();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3E3680();
  MEMORY[0x270FA5388]();
  sub_24F3BF6A8();
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  unsigned __int8 v8 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a3, v4);
  id v9 = v8;
  return sub_24F3E36A0();
}

uint64_t sub_24F3BFD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24F3E3120();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24F3E3680();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_24F3E3660();
  MEMORY[0x270FA5388](v11 - 8);
  if (a1 == a2)
  {
    sub_24F3E3650();
    sub_24F3E3640();
    uint64_t v16 = a1;
    sub_24F3E3620();
    sub_24F3E3640();
    sub_24F3E3670();
    if (qword_26B1F3B38 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  sub_24F3E3650();
  sub_24F3E3640();
  uint64_t v16 = a1;
  sub_24F3E3620();
  sub_24F3E3640();
  uint64_t v16 = a2;
  sub_24F3E3620();
  sub_24F3E3640();
  sub_24F3E3670();
  if (qword_26B1F3B38 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  uint64_t v12 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, v6);
  id v13 = v12;
  return sub_24F3E36A0();
}

uint64_t sub_24F3C0084(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v55 = sub_24F3E3520();
  uint64_t v67 = *(void *)(v55 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v55);
  v63 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v70 = (char *)&v54 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v62 = (char *)&v54 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v60 = (char *)&v54 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v61 = (char *)&v54 - v13;
  MEMORY[0x270FA5388](v12);
  v64 = (char *)&v54 - v14;
  uint64_t v69 = sub_24F3E3260();
  sub_24F3C1C3C(v1, (uint64_t)v115);
  *(_OWORD *)&v117[71] = v115[4];
  *(_OWORD *)&v117[55] = v115[3];
  *(_OWORD *)&v117[119] = v115[7];
  *(_OWORD *)&v117[135] = v115[8];
  *(_OWORD *)&v117[151] = v115[9];
  *(_OWORD *)&v117[167] = v116;
  *(_OWORD *)&v117[87] = v115[5];
  *(_OWORD *)&v117[103] = v115[6];
  *(_OWORD *)&v117[7] = v115[0];
  char v118 = 0;
  *(_OWORD *)&v117[23] = v115[1];
  *(_OWORD *)&v117[39] = v115[2];
  int v68 = 0;
  long long v112 = *(_OWORD *)&v117[128];
  long long v113 = *(_OWORD *)&v117[144];
  v114[0] = *(_OWORD *)&v117[160];
  *(void *)((char *)v114 + 15) = *((void *)&v116 + 1);
  long long v108 = *(_OWORD *)&v117[64];
  long long v109 = *(_OWORD *)&v117[80];
  long long v110 = *(_OWORD *)&v117[96];
  long long v111 = *(_OWORD *)&v117[112];
  long long v104 = *(_OWORD *)v117;
  long long v105 = *(_OWORD *)&v117[16];
  long long v106 = *(_OWORD *)&v117[32];
  long long v107 = *(_OWORD *)&v117[48];
  sub_24F3E3510();
  uint64_t v65 = sub_24F3E3260();
  sub_24F3C222C(v1, (uint64_t)v119);
  *(_OWORD *)&v121[71] = v119[4];
  *(_OWORD *)&v121[55] = v119[3];
  *(_OWORD *)&v121[119] = v119[7];
  *(_OWORD *)&v121[135] = v119[8];
  *(_OWORD *)&v121[151] = v119[9];
  *(_OWORD *)&v121[167] = v120;
  *(_OWORD *)&v121[87] = v119[5];
  *(_OWORD *)&v121[103] = v119[6];
  *(_OWORD *)&v121[7] = v119[0];
  char v122 = 0;
  *(_OWORD *)&v121[23] = v119[1];
  *(_OWORD *)&v121[39] = v119[2];
  int v66 = 0;
  long long v131 = *(_OWORD *)&v121[128];
  long long v132 = *(_OWORD *)&v121[144];
  v133[0] = *(_OWORD *)&v121[160];
  *(void *)((char *)v133 + 15) = *((void *)&v120 + 1);
  long long v127 = *(_OWORD *)&v121[64];
  long long v128 = *(_OWORD *)&v121[80];
  long long v129 = *(_OWORD *)&v121[96];
  long long v130 = *(_OWORD *)&v121[112];
  long long v123 = *(_OWORD *)v121;
  long long v124 = *(_OWORD *)&v121[16];
  long long v125 = *(_OWORD *)&v121[32];
  long long v126 = *(_OWORD *)&v121[48];
  uint64_t v15 = v61;
  sub_24F3E3510();
  uint64_t v58 = sub_24F3E3260();
  sub_24F3C2858(v1, (uint64_t)v134);
  *(_OWORD *)&v136[71] = v134[4];
  *(_OWORD *)&v136[55] = v134[3];
  *(_OWORD *)&v136[119] = v134[7];
  *(_OWORD *)&v136[135] = v134[8];
  *(_OWORD *)&v136[151] = v134[9];
  *(_OWORD *)&v136[167] = v135;
  *(_OWORD *)&v136[87] = v134[5];
  *(_OWORD *)&v136[103] = v134[6];
  *(_OWORD *)&v136[7] = v134[0];
  char v137 = 0;
  *(_OWORD *)&v136[23] = v134[1];
  *(_OWORD *)&v136[39] = v134[2];
  int v56 = 0;
  long long v146 = *(_OWORD *)&v136[128];
  long long v147 = *(_OWORD *)&v136[144];
  v148[0] = *(_OWORD *)&v136[160];
  *(void *)((char *)v148 + 15) = *((void *)&v135 + 1);
  long long v142 = *(_OWORD *)&v136[64];
  long long v143 = *(_OWORD *)&v136[80];
  long long v144 = *(_OWORD *)&v136[96];
  long long v145 = *(_OWORD *)&v136[112];
  long long v138 = *(_OWORD *)v136;
  long long v139 = *(_OWORD *)&v136[16];
  long long v140 = *(_OWORD *)&v136[32];
  long long v141 = *(_OWORD *)&v136[48];
  uint64_t v16 = v60;
  sub_24F3E3510();
  uint64_t v59 = sub_24F3E3260();
  sub_24F3C2F64(v1, (uint64_t)v149);
  *(_OWORD *)&v151[71] = v149[4];
  *(_OWORD *)&v151[55] = v149[3];
  *(_OWORD *)&v151[119] = v149[7];
  *(_OWORD *)&v151[135] = v149[8];
  *(_OWORD *)&v151[151] = v149[9];
  *(_OWORD *)&v151[167] = v150;
  *(_OWORD *)&v151[87] = v149[5];
  *(_OWORD *)&v151[103] = v149[6];
  *(_OWORD *)&v151[7] = v149[0];
  char v152 = 0;
  *(_OWORD *)&v151[23] = v149[1];
  *(_OWORD *)&v151[39] = v149[2];
  int v57 = 0;
  long long v161 = *(_OWORD *)&v151[128];
  long long v162 = *(_OWORD *)&v151[144];
  v163[0] = *(_OWORD *)&v151[160];
  *(void *)((char *)v163 + 15) = *((void *)&v150 + 1);
  long long v157 = *(_OWORD *)&v151[64];
  long long v158 = *(_OWORD *)&v151[80];
  long long v159 = *(_OWORD *)&v151[96];
  long long v160 = *(_OWORD *)&v151[112];
  long long v153 = *(_OWORD *)v151;
  long long v154 = *(_OWORD *)&v151[16];
  long long v155 = *(_OWORD *)&v151[32];
  long long v156 = *(_OWORD *)&v151[48];
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  uint64_t v18 = v62;
  uint64_t v19 = v55;
  v17(v62, v64, v55);
  long long v101 = v131;
  long long v102 = v132;
  v103[0] = v133[0];
  *(void *)((char *)v103 + 15) = *(void *)((char *)v133 + 15);
  long long v97 = v127;
  long long v98 = v128;
  long long v99 = v129;
  long long v100 = v130;
  long long v93 = v123;
  long long v94 = v124;
  long long v95 = v125;
  long long v96 = v126;
  v17(v70, v15, v19);
  long long v90 = v146;
  long long v91 = v147;
  v92[0] = v148[0];
  *(void *)((char *)v92 + 15) = *(void *)((char *)v148 + 15);
  long long v86 = v142;
  long long v87 = v143;
  long long v88 = v144;
  long long v89 = v145;
  long long v82 = v138;
  long long v83 = v139;
  long long v84 = v140;
  long long v85 = v141;
  v17(v63, v16, v19);
  long long v79 = v161;
  long long v80 = v162;
  v81[0] = v163[0];
  *(void *)((char *)v81 + 15) = *(void *)((char *)v163 + 15);
  long long v75 = v157;
  long long v76 = v158;
  long long v77 = v159;
  long long v78 = v160;
  long long v71 = v153;
  long long v72 = v154;
  long long v73 = v155;
  long long v74 = v156;
  *(void *)&long long v164 = v69;
  *((void *)&v164 + 1) = 0x4038000000000000;
  v165[0] = v68;
  *(_OWORD *)&v165[129] = v112;
  *(_OWORD *)&v165[145] = v113;
  *(_OWORD *)&v165[161] = v114[0];
  *(void *)&v165[176] = *(void *)((char *)v114 + 15);
  *(_OWORD *)&v165[65] = v108;
  *(_OWORD *)&v165[81] = v109;
  *(_OWORD *)&v165[97] = v110;
  *(_OWORD *)&v165[113] = v111;
  *(_OWORD *)&v165[1] = v104;
  *(_OWORD *)&v165[17] = v105;
  *(_OWORD *)&v165[33] = v106;
  *(_OWORD *)&v165[49] = v107;
  long long v20 = *(_OWORD *)&v165[160];
  *(_OWORD *)(v3 + 160) = *(_OWORD *)&v165[144];
  *(_OWORD *)(v3 + 176) = v20;
  *(void *)(v3 + 192) = *(void *)&v165[176];
  long long v21 = *(_OWORD *)&v165[96];
  *(_OWORD *)(v3 + 96) = *(_OWORD *)&v165[80];
  *(_OWORD *)(v3 + 112) = v21;
  long long v22 = *(_OWORD *)&v165[128];
  *(_OWORD *)(v3 + 128) = *(_OWORD *)&v165[112];
  *(_OWORD *)(v3 + 144) = v22;
  long long v23 = *(_OWORD *)&v165[32];
  *(_OWORD *)(v3 + 32) = *(_OWORD *)&v165[16];
  *(_OWORD *)(v3 + 48) = v23;
  long long v24 = *(_OWORD *)&v165[64];
  *(_OWORD *)(v3 + 64) = *(_OWORD *)&v165[48];
  *(_OWORD *)(v3 + 80) = v24;
  long long v25 = *(_OWORD *)v165;
  *(_OWORD *)uint64_t v3 = v164;
  *(_OWORD *)(v3 + 16) = v25;
  uint64_t v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDE0);
  v17((char *)(v3 + v26[12]), v18, v19);
  uint64_t v27 = v3 + v26[16];
  *(void *)&long long v166 = v65;
  *((void *)&v166 + 1) = 0x4038000000000000;
  v167[0] = v66;
  *(_OWORD *)&v167[129] = v101;
  *(_OWORD *)&v167[145] = v102;
  *(_OWORD *)&v167[161] = v103[0];
  *(void *)&v167[176] = *(void *)((char *)v103 + 15);
  *(_OWORD *)&v167[65] = v97;
  *(_OWORD *)&v167[81] = v98;
  *(_OWORD *)&v167[97] = v99;
  *(_OWORD *)&v167[113] = v100;
  *(_OWORD *)&v167[33] = v95;
  *(_OWORD *)&v167[49] = v96;
  *(_OWORD *)&v167[1] = v93;
  *(_OWORD *)&v167[17] = v94;
  long long v28 = *(_OWORD *)&v167[160];
  *(_OWORD *)(v27 + 160) = *(_OWORD *)&v167[144];
  *(_OWORD *)(v27 + 176) = v28;
  *(void *)(v27 + 192) = *(void *)&v167[176];
  long long v29 = *(_OWORD *)&v167[96];
  *(_OWORD *)(v27 + 96) = *(_OWORD *)&v167[80];
  *(_OWORD *)(v27 + 112) = v29;
  long long v30 = *(_OWORD *)&v167[128];
  *(_OWORD *)(v27 + 128) = *(_OWORD *)&v167[112];
  *(_OWORD *)(v27 + 144) = v30;
  long long v31 = *(_OWORD *)&v167[32];
  *(_OWORD *)(v27 + 32) = *(_OWORD *)&v167[16];
  *(_OWORD *)(v27 + 48) = v31;
  long long v32 = *(_OWORD *)&v167[64];
  *(_OWORD *)(v27 + 64) = *(_OWORD *)&v167[48];
  *(_OWORD *)(v27 + 80) = v32;
  long long v33 = *(_OWORD *)v167;
  *(_OWORD *)uint64_t v27 = v166;
  *(_OWORD *)(v27 + 16) = v33;
  v17((char *)(v3 + v26[20]), v70, v19);
  uint64_t v34 = v3 + v26[24];
  uint64_t v35 = v58;
  *(void *)&long long v168 = v58;
  *((void *)&v168 + 1) = 0x4038000000000000;
  char v36 = v56;
  v169[0] = v56;
  *(_OWORD *)&v169[129] = v90;
  *(_OWORD *)&v169[145] = v91;
  *(_OWORD *)&v169[161] = v92[0];
  *(void *)&v169[176] = *(void *)((char *)v92 + 15);
  *(_OWORD *)&v169[65] = v86;
  *(_OWORD *)&v169[81] = v87;
  *(_OWORD *)&v169[97] = v88;
  *(_OWORD *)&v169[113] = v89;
  *(_OWORD *)&v169[1] = v82;
  *(_OWORD *)&v169[17] = v83;
  *(_OWORD *)&v169[33] = v84;
  *(_OWORD *)&v169[49] = v85;
  long long v37 = *(_OWORD *)&v169[160];
  *(_OWORD *)(v34 + 160) = *(_OWORD *)&v169[144];
  *(_OWORD *)(v34 + 176) = v37;
  *(void *)(v34 + 192) = *(void *)&v169[176];
  long long v38 = *(_OWORD *)&v169[96];
  *(_OWORD *)(v34 + 96) = *(_OWORD *)&v169[80];
  *(_OWORD *)(v34 + 112) = v38;
  long long v39 = *(_OWORD *)&v169[128];
  *(_OWORD *)(v34 + 128) = *(_OWORD *)&v169[112];
  *(_OWORD *)(v34 + 144) = v39;
  long long v40 = *(_OWORD *)&v169[32];
  *(_OWORD *)(v34 + 32) = *(_OWORD *)&v169[16];
  *(_OWORD *)(v34 + 48) = v40;
  long long v41 = *(_OWORD *)&v169[64];
  *(_OWORD *)(v34 + 64) = *(_OWORD *)&v169[48];
  *(_OWORD *)(v34 + 80) = v41;
  long long v42 = *(_OWORD *)v169;
  *(_OWORD *)uint64_t v34 = v168;
  *(_OWORD *)(v34 + 16) = v42;
  v43 = v63;
  v17((char *)(v3 + v26[28]), v63, v19);
  uint64_t v44 = v3 + v26[32];
  uint64_t v45 = v59;
  *(void *)&long long v170 = v59;
  *((void *)&v170 + 1) = 0x4038000000000000;
  LOBYTE(v17) = v57;
  v171[0] = v57;
  *(_OWORD *)&v171[129] = v79;
  *(_OWORD *)&v171[145] = v80;
  *(_OWORD *)&v171[161] = v81[0];
  *(void *)&v171[176] = *(void *)((char *)v81 + 15);
  *(_OWORD *)&v171[97] = v77;
  *(_OWORD *)&v171[113] = v78;
  *(_OWORD *)&v171[65] = v75;
  *(_OWORD *)&v171[81] = v76;
  *(_OWORD *)&v171[1] = v71;
  *(_OWORD *)&v171[17] = v72;
  *(_OWORD *)&v171[33] = v73;
  *(_OWORD *)&v171[49] = v74;
  long long v46 = *(_OWORD *)&v171[160];
  *(_OWORD *)(v44 + 160) = *(_OWORD *)&v171[144];
  *(_OWORD *)(v44 + 176) = v46;
  *(void *)(v44 + 192) = *(void *)&v171[176];
  long long v47 = *(_OWORD *)&v171[96];
  *(_OWORD *)(v44 + 96) = *(_OWORD *)&v171[80];
  *(_OWORD *)(v44 + 112) = v47;
  long long v48 = *(_OWORD *)&v171[128];
  *(_OWORD *)(v44 + 128) = *(_OWORD *)&v171[112];
  *(_OWORD *)(v44 + 144) = v48;
  long long v49 = *(_OWORD *)&v171[32];
  *(_OWORD *)(v44 + 32) = *(_OWORD *)&v171[16];
  *(_OWORD *)(v44 + 48) = v49;
  long long v50 = *(_OWORD *)&v171[64];
  *(_OWORD *)(v44 + 64) = *(_OWORD *)&v171[48];
  *(_OWORD *)(v44 + 80) = v50;
  long long v51 = *(_OWORD *)v171;
  *(_OWORD *)uint64_t v44 = v170;
  *(_OWORD *)(v44 + 16) = v51;
  sub_24F3C36B4((uint64_t)&v164);
  sub_24F3C36B4((uint64_t)&v166);
  sub_24F3C36B4((uint64_t)&v168);
  sub_24F3C36B4((uint64_t)&v170);
  sub_24F3C3748((uint64_t)v115);
  sub_24F3C3748((uint64_t)v119);
  v52 = *(void (**)(char *, uint64_t))(v67 + 8);
  v52(v60, v19);
  v52(v61, v19);
  sub_24F3C37CC((uint64_t)v119);
  v52(v64, v19);
  sub_24F3C37CC((uint64_t)v115);
  long long v182 = v79;
  long long v183 = v80;
  *(_OWORD *)v184 = v81[0];
  long long v178 = v75;
  long long v179 = v76;
  long long v180 = v77;
  long long v181 = v78;
  long long v174 = v71;
  long long v175 = v72;
  long long v176 = v73;
  v172[0] = v45;
  v172[1] = 0x4038000000000000;
  char v173 = (char)v17;
  *(void *)&v184[15] = *(void *)((char *)v81 + 15);
  long long v177 = v74;
  sub_24F3C3860((uint64_t)v172);
  v52(v43, v19);
  long long v195 = v90;
  long long v196 = v91;
  *(_OWORD *)v197 = v92[0];
  long long v191 = v86;
  long long v192 = v87;
  long long v193 = v88;
  long long v194 = v89;
  long long v187 = v82;
  long long v188 = v83;
  long long v189 = v84;
  v185[0] = v35;
  v185[1] = 0x4038000000000000;
  char v186 = v36;
  *(void *)&v197[15] = *(void *)((char *)v92 + 15);
  long long v190 = v85;
  sub_24F3C3860((uint64_t)v185);
  v52(v70, v19);
  long long v208 = v101;
  long long v209 = v102;
  *(_OWORD *)v210 = v103[0];
  long long v204 = v97;
  long long v205 = v98;
  long long v206 = v99;
  long long v207 = v100;
  long long v200 = v93;
  long long v201 = v94;
  long long v202 = v95;
  v198[0] = v65;
  v198[1] = 0x4038000000000000;
  char v199 = v66;
  *(void *)&v210[15] = *(void *)((char *)v103 + 15);
  long long v203 = v96;
  sub_24F3C3860((uint64_t)v198);
  v52(v62, v19);
  long long v221 = v112;
  long long v222 = v113;
  v223[0] = v114[0];
  long long v217 = v108;
  long long v218 = v109;
  long long v219 = v110;
  long long v220 = v111;
  long long v213 = v104;
  long long v214 = v105;
  long long v215 = v106;
  v211[0] = v69;
  v211[1] = 0x4038000000000000;
  char v212 = v68;
  *(void *)((char *)v223 + 15) = *(void *)((char *)v114 + 15);
  long long v216 = v107;
  return sub_24F3C3860((uint64_t)v211);
}

uint64_t sub_24F3C0CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3C0D30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F3C0D90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for RepeatReplaceAlertDetailView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24F3E3120();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v8 + 24);
    v9[2] = *(uint64_t *)((char *)a2 + v8 + 16);
    v9[3] = v12;
    uint64_t v13 = *(uint64_t *)((char *)a2 + v8 + 40);
    v9[4] = *(uint64_t *)((char *)a2 + v8 + 32);
    v9[5] = v13;
    uint64_t v14 = *(uint64_t *)((char *)a2 + v8 + 56);
    v9[6] = *(uint64_t *)((char *)a2 + v8 + 48);
    v9[7] = v14;
    uint64_t v15 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v16 = v15[8];
    long long v24 = &v10[v16];
    uint64_t v26 = (char *)v9 + v16;
    uint64_t v17 = sub_24F3E30D0();
    long long v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23(v26, v24, v17);
    *(void *)((char *)v9 + v15[9]) = *(void *)&v10[v15[9]];
    *(void *)((char *)v9 + v15[10]) = *(void *)&v10[v15[10]];
    *(void *)((char *)v9 + v15[11]) = *(void *)&v10[v15[11]];
    *((unsigned char *)v9 + v15[12]) = v10[v15[12]];
    *(void *)((char *)v9 + v15[13]) = *(void *)&v10[v15[13]];
    uint64_t v18 = v15[14];
    long long v25 = &v10[v18];
    uint64_t v27 = (char *)v9 + v18;
    uint64_t v19 = sub_24F3E3100();
    long long v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20(v27, v25, v19);
    *(void *)((char *)v9 + v15[15]) = *(void *)&v10[v15[15]];
  }
  return a1;
}

uint64_t destroy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for PreviousPlanDetail();
  uint64_t v7 = v5 + *(int *)(v6 + 32);
  uint64_t v8 = sub_24F3E30D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v5 + *(int *)(v6 + 56);
  uint64_t v10 = sub_24F3E3100();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  return v11(v9, v10);
}

uint64_t initializeWithCopy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7);
  uint64_t v11 = v9[1];
  *uint64_t v8 = v10;
  v8[1] = v11;
  uint64_t v12 = v9[3];
  v8[2] = v9[2];
  v8[3] = v12;
  uint64_t v13 = v9[5];
  v8[4] = v9[4];
  v8[5] = v13;
  uint64_t v14 = v9[7];
  v8[6] = v9[6];
  v8[7] = v14;
  uint64_t v15 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v16 = v15[8];
  long long v24 = (char *)v9 + v16;
  long long v25 = (char *)v8 + v16;
  uint64_t v17 = sub_24F3E30D0();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(v25, v24, v17);
  *(void *)((char *)v8 + v15[9]) = *(void *)((char *)v9 + v15[9]);
  *(void *)((char *)v8 + v15[10]) = *(void *)((char *)v9 + v15[10]);
  *(void *)((char *)v8 + v15[11]) = *(void *)((char *)v9 + v15[11]);
  *((unsigned char *)v8 + v15[12]) = *((unsigned char *)v9 + v15[12]);
  *(void *)((char *)v8 + v15[13]) = *(void *)((char *)v9 + v15[13]);
  uint64_t v19 = v15[14];
  uint64_t v26 = (char *)v8 + v19;
  long long v20 = (char *)v9 + v19;
  uint64_t v21 = sub_24F3E3100();
  long long v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22(v26, v20, v21);
  *(void *)((char *)v8 + v15[15]) = *(void *)((char *)v9 + v15[15]);
  return a1;
}

uint64_t assignWithCopy for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = *(void *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v11 = v10[8];
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = (char *)v9 + v11;
  uint64_t v14 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *(void *)((char *)v8 + v10[9]) = *(void *)((char *)v9 + v10[9]);
  *(void *)((char *)v8 + v10[10]) = *(void *)((char *)v9 + v10[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v8 + v10[11]) = *(void *)((char *)v9 + v10[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)v8 + v10[12]) = *((unsigned char *)v9 + v10[12]);
  *(void *)((char *)v8 + v10[13]) = *(void *)((char *)v9 + v10[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = v10[14];
  uint64_t v16 = (char *)v8 + v15;
  uint64_t v17 = (char *)v9 + v15;
  uint64_t v18 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(void *)((char *)v8 + v10[15]) = *(void *)((char *)v9 + v10[15]);
  return a1;
}

uint64_t initializeWithTake for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(a2 + v7 + 16);
  *uint64_t v8 = *(_OWORD *)(a2 + v7);
  v8[1] = v10;
  long long v11 = *(_OWORD *)(a2 + v7 + 48);
  v8[2] = *(_OWORD *)(a2 + v7 + 32);
  v8[3] = v11;
  uint64_t v12 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v13 = v12[8];
  uint64_t v14 = (char *)v8 + v13;
  uint64_t v15 = v9 + v13;
  uint64_t v16 = sub_24F3E30D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *(void *)((char *)v8 + v12[9]) = *(void *)(v9 + v12[9]);
  *(void *)((char *)v8 + v12[10]) = *(void *)(v9 + v12[10]);
  *(void *)((char *)v8 + v12[11]) = *(void *)(v9 + v12[11]);
  *((unsigned char *)v8 + v12[12]) = *(unsigned char *)(v9 + v12[12]);
  *(void *)((char *)v8 + v12[13]) = *(void *)(v9 + v12[13]);
  uint64_t v17 = v12[14];
  uint64_t v18 = (char *)v8 + v17;
  uint64_t v19 = v9 + v17;
  uint64_t v20 = sub_24F3E3100();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  *(void *)((char *)v8 + v12[15]) = *(void *)(v9 + v12[15]);
  return a1;
}

uint64_t assignWithTake for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v15 = v14[8];
  uint64_t v16 = (char *)v8 + v15;
  uint64_t v17 = (char *)v9 + v15;
  uint64_t v18 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  *(void *)((char *)v8 + v14[9]) = *(void *)((char *)v9 + v14[9]);
  *(void *)((char *)v8 + v14[10]) = *(void *)((char *)v9 + v14[10]);
  swift_bridgeObjectRelease();
  *(void *)((char *)v8 + v14[11]) = *(void *)((char *)v9 + v14[11]);
  swift_bridgeObjectRelease();
  *((unsigned char *)v8 + v14[12]) = *((unsigned char *)v9 + v14[12]);
  *(void *)((char *)v8 + v14[13]) = *(void *)((char *)v9 + v14[13]);
  swift_bridgeObjectRelease();
  uint64_t v19 = v14[14];
  uint64_t v20 = (char *)v8 + v19;
  uint64_t v21 = (char *)v9 + v19;
  uint64_t v22 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  *(void *)((char *)v8 + v14[15]) = *(void *)((char *)v9 + v14[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3C1878);
}

uint64_t sub_24F3C1878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for PreviousPlanDetail();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for RepeatReplaceAlertDetailView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3C1984);
}

uint64_t sub_24F3C1984(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24F3E3120();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for PreviousPlanDetail();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_24F3C1A88()
{
  uint64_t result = sub_24F3E3120();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PreviousPlanDetail();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_24F3C1B54()
{
  unint64_t result = qword_269A0BDD0;
  if (!qword_269A0BDD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BDB8);
    sub_24F3C4528(&qword_269A0BDD8, &qword_269A0BDA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BDD0);
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

uint64_t sub_24F3C1C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F3E3120();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3E3680();
  MEMORY[0x270FA5388](v8 - 8);
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v10 = v9;
  uint64_t v79 = sub_24F3E36A0();
  uint64_t v80 = v11;
  unint64_t v61 = sub_24F3C38E4();
  uint64_t v12 = sub_24F3E33A0();
  uint64_t v14 = v13;
  LOBYTE(v9) = v15 & 1;
  sub_24F3E3360();
  uint64_t v16 = sub_24F3E3390();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v60 = a1;
  swift_release();
  sub_24F3C3850(v12, v14, (char)v9);
  swift_bridgeObjectRelease();
  LODWORD(v79) = sub_24F3E32E0();
  uint64_t v70 = sub_24F3E3380();
  uint64_t v69 = v21;
  uint64_t v71 = v22;
  int v64 = v23 & 1;
  sub_24F3C3850(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  sub_24F3E3560();
  sub_24F3E31C0();
  uint64_t v68 = v73;
  int v63 = v74;
  uint64_t v67 = v75;
  int v62 = v76;
  uint64_t v66 = v77;
  uint64_t v65 = v78;
  uint64_t v24 = v60 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  uint64_t v25 = type metadata accessor for PreviousPlanDetail();
  uint64_t v79 = sub_24F3BF90C(*(char **)(v24 + *(int *)(v25 + 40)));
  uint64_t v80 = v26;
  uint64_t v27 = sub_24F3E33A0();
  uint64_t v29 = v28;
  LOBYTE(v18) = v30 & 1;
  sub_24F3E3360();
  uint64_t v31 = sub_24F3E3390();
  uint64_t v33 = v32;
  char v35 = v34;
  swift_release();
  sub_24F3C3850(v27, v29, v18);
  swift_bridgeObjectRelease();
  LODWORD(v79) = sub_24F3E32F0();
  uint64_t v36 = sub_24F3E3380();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  LOBYTE(v16) = v41 & 1;
  sub_24F3C3850(v31, v33, v35 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24F3E3570();
  sub_24F3E31C0();
  uint64_t v43 = v79;
  uint64_t v44 = v81;
  char v45 = v64;
  char v72 = v64;
  char v96 = v64;
  char v46 = v63;
  char v94 = v63;
  char v47 = v62;
  char v92 = v62;
  char v90 = v16;
  char v87 = v80;
  char v85 = v82;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v95;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v95[3];
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v93;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v93[3];
  int v48 = *(_DWORD *)v91;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a2 + 57) = v48;
  int v49 = *(_DWORD *)v89;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v89[3];
  *(_DWORD *)(a2 + 97) = v49;
  int v50 = *(_DWORD *)v88;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v88[3];
  *(_DWORD *)(a2 + 121) = v50;
  LOBYTE(v50) = v87;
  int v51 = *(_DWORD *)v86;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v86[3];
  *(_DWORD *)(a2 + 137) = v51;
  LOBYTE(v51) = v85;
  int v52 = *(_DWORD *)v84;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v84[3];
  *(_DWORD *)(a2 + 153) = v52;
  uint64_t v53 = v70;
  uint64_t v54 = v69;
  *(void *)a2 = v70;
  *(void *)(a2 + 8) = v54;
  *(unsigned char *)(a2 + 16) = v45;
  uint64_t v55 = v68;
  *(void *)(a2 + 24) = v71;
  *(void *)(a2 + 32) = v55;
  *(unsigned char *)(a2 + 40) = v46;
  *(void *)(a2 + 48) = v67;
  *(unsigned char *)(a2 + 56) = v47;
  uint64_t v56 = v65;
  *(void *)(a2 + 64) = v66;
  *(void *)(a2 + 72) = v56;
  *(void *)(a2 + 80) = v36;
  *(void *)(a2 + 88) = v38;
  *(unsigned char *)(a2 + 96) = v16;
  *(void *)(a2 + 104) = v40;
  *(void *)(a2 + 112) = KeyPath;
  *(unsigned char *)(a2 + 120) = 2;
  *(void *)(a2 + 128) = v43;
  *(unsigned char *)(a2 + 136) = v50;
  *(void *)(a2 + 144) = v44;
  *(unsigned char *)(a2 + 152) = v51;
  *(_OWORD *)(a2 + 160) = v83;
  uint64_t v57 = v53;
  sub_24F3C3738(v53, v54, v45);
  swift_bridgeObjectRetain();
  sub_24F3C3738(v36, v38, v16);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3850(v36, v38, v16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24F3C3850(v57, v54, v72);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3C222C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F3E3120();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3E3680();
  MEMORY[0x270FA5388](v8 - 8);
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v10 = v9;
  uint64_t v86 = sub_24F3E36A0();
  uint64_t v87 = v11;
  unint64_t v77 = sub_24F3C38E4();
  uint64_t v12 = sub_24F3E33A0();
  uint64_t v14 = v13;
  LOBYTE(v9) = v15 & 1;
  sub_24F3E3360();
  uint64_t v16 = sub_24F3E3390();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v78 = a1;
  swift_release();
  sub_24F3C3850(v12, v14, (char)v9);
  swift_bridgeObjectRelease();
  LODWORD(v86) = sub_24F3E32E0();
  uint64_t v21 = sub_24F3E3380();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v27 = v26;
  sub_24F3C3850(v16, v18, v20 & 1);
  uint64_t v28 = v78;
  swift_bridgeObjectRelease();
  sub_24F3E3560();
  sub_24F3E31C0();
  uint64_t v29 = v28 + *(int *)(type metadata accessor for RepeatReplaceAlertDetailView() + 20);
  uint64_t result = type metadata accessor for PreviousPlanDetail();
  uint64_t v31 = *(void **)(v29 + *(int *)(result + 44));
  uint64_t v32 = v31[2];
  if (v32)
  {
    if (v32 != 1)
    {
      int v72 = v25 & 1;
      uint64_t v76 = v85;
      uint64_t v75 = v84;
      int v71 = v83;
      uint64_t v74 = v82;
      int v70 = v81;
      uint64_t v73 = v80;
      uint64_t v86 = sub_24F3BFD2C(v31[4], v31[5]);
      uint64_t v87 = v33;
      uint64_t v34 = sub_24F3E33A0();
      uint64_t v36 = v35;
      char v38 = v37 & 1;
      sub_24F3E3360();
      uint64_t v39 = sub_24F3E3390();
      uint64_t v78 = v27;
      uint64_t v40 = v39;
      unint64_t v77 = v21;
      uint64_t v42 = v41;
      uint64_t v69 = v23;
      char v44 = v43;
      swift_release();
      sub_24F3C3850(v34, v36, v38);
      swift_bridgeObjectRelease();
      LODWORD(v86) = sub_24F3E32F0();
      uint64_t v45 = sub_24F3E3380();
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      char v51 = v50 & 1;
      sub_24F3C3850(v40, v42, v44 & 1);
      swift_bridgeObjectRelease();
      uint64_t KeyPath = swift_getKeyPath();
      sub_24F3E3570();
      sub_24F3E31C0();
      uint64_t v53 = v86;
      uint64_t v54 = v88;
      char v55 = v72;
      char v79 = v72;
      char v103 = v72;
      char v56 = v70;
      char v101 = v70;
      char v57 = v71;
      char v99 = v71;
      char v97 = v51;
      char v94 = v87;
      char v92 = v89;
      *(_DWORD *)(a2 + 17) = *(_DWORD *)v102;
      *(_DWORD *)(a2 + 20) = *(_DWORD *)&v102[3];
      *(_DWORD *)(a2 + 41) = *(_DWORD *)v100;
      *(_DWORD *)(a2 + 44) = *(_DWORD *)&v100[3];
      int v58 = *(_DWORD *)v98;
      *(_DWORD *)(a2 + 60) = *(_DWORD *)&v98[3];
      *(_DWORD *)(a2 + 57) = v58;
      int v59 = *(_DWORD *)v96;
      *(_DWORD *)(a2 + 100) = *(_DWORD *)&v96[3];
      *(_DWORD *)(a2 + 97) = v59;
      int v60 = *(_DWORD *)v95;
      *(_DWORD *)(a2 + 124) = *(_DWORD *)&v95[3];
      *(_DWORD *)(a2 + 121) = v60;
      LOBYTE(v60) = v94;
      int v61 = *(_DWORD *)v93;
      *(_DWORD *)(a2 + 140) = *(_DWORD *)&v93[3];
      *(_DWORD *)(a2 + 137) = v61;
      LOBYTE(v61) = v92;
      int v62 = *(_DWORD *)v91;
      *(_DWORD *)(a2 + 156) = *(_DWORD *)&v91[3];
      *(_DWORD *)(a2 + 153) = v62;
      uint64_t v63 = v77;
      uint64_t v64 = v69;
      *(void *)a2 = v77;
      *(void *)(a2 + 8) = v64;
      *(unsigned char *)(a2 + 16) = v55;
      uint64_t v65 = v73;
      *(void *)(a2 + 24) = v78;
      *(void *)(a2 + 32) = v65;
      *(unsigned char *)(a2 + 40) = v56;
      *(void *)(a2 + 48) = v74;
      *(unsigned char *)(a2 + 56) = v57;
      uint64_t v66 = v76;
      *(void *)(a2 + 64) = v75;
      *(void *)(a2 + 72) = v66;
      *(void *)(a2 + 80) = v45;
      *(void *)(a2 + 88) = v47;
      *(unsigned char *)(a2 + 96) = v51;
      *(void *)(a2 + 104) = v49;
      *(void *)(a2 + 112) = KeyPath;
      *(unsigned char *)(a2 + 120) = 2;
      *(void *)(a2 + 128) = v53;
      *(unsigned char *)(a2 + 136) = v60;
      *(void *)(a2 + 144) = v54;
      *(unsigned char *)(a2 + 152) = v61;
      *(_OWORD *)(a2 + 160) = v90;
      uint64_t v67 = v63;
      sub_24F3C3738(v63, v64, v55);
      swift_bridgeObjectRetain();
      sub_24F3C3738(v45, v47, v51);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_24F3C3850(v45, v47, v51);
      swift_release();
      swift_bridgeObjectRelease();
      sub_24F3C3850(v67, v64, v79);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24F3C2858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F3E3120();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3E3680();
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_26B1F4E10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v74 = v5 + 16;
  uint64_t v76 = v12;
  v12(v7, a1, v4);
  id v13 = v11;
  uint64_t v95 = sub_24F3E36A0();
  uint64_t v96 = v14;
  unint64_t v77 = sub_24F3C38E4();
  uint64_t v15 = sub_24F3E33A0();
  uint64_t v72 = a1;
  uint64_t v16 = v15;
  uint64_t v73 = v7;
  uint64_t v18 = v17;
  uint64_t v75 = v4;
  char v20 = v19 & 1;
  sub_24F3E3360();
  uint64_t v21 = sub_24F3E3390();
  uint64_t v23 = v22;
  int v71 = v10;
  char v25 = v24;
  swift_release();
  sub_24F3C3850(v16, v18, v20);
  swift_bridgeObjectRelease();
  LODWORD(v95) = sub_24F3E32E0();
  uint64_t v86 = sub_24F3E3380();
  uint64_t v85 = v26;
  uint64_t v87 = v27;
  int v80 = v28 & 1;
  sub_24F3C3850(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  sub_24F3E3560();
  sub_24F3E31C0();
  uint64_t v84 = v89;
  int v79 = v90;
  uint64_t v83 = v91;
  int v78 = v92;
  uint64_t v82 = v93;
  uint64_t v81 = v94;
  uint64_t v29 = type metadata accessor for RepeatReplaceAlertDetailView();
  uint64_t v30 = v72;
  uint64_t v31 = v72 + *(int *)(v29 + 20);
  uint64_t v95 = *(void *)(v31 + *(int *)(type metadata accessor for PreviousPlanDetail() + 52));
  sub_24F3E3600();
  uint64_t v32 = (void *)qword_26B1F4E10;
  v76(v73, v30, v75);
  id v33 = v32;
  sub_24F3E36A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDF0);
  sub_24F3C4528(&qword_269A0BDF8, &qword_269A0BDF0);
  uint64_t v34 = sub_24F3E35F0();
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  uint64_t v95 = v34;
  uint64_t v96 = v36;
  uint64_t v37 = sub_24F3E33A0();
  uint64_t v39 = v38;
  char v41 = v40 & 1;
  sub_24F3E3360();
  uint64_t v42 = sub_24F3E3390();
  uint64_t v44 = v43;
  char v46 = v45;
  swift_release();
  sub_24F3C3850(v37, v39, v41);
  swift_bridgeObjectRelease();
  LODWORD(v95) = sub_24F3E32F0();
  uint64_t v47 = sub_24F3E3380();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  char v53 = v52 & 1;
  sub_24F3C3850(v42, v44, v46 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24F3E3570();
  sub_24F3E31C0();
  uint64_t v55 = v95;
  uint64_t v56 = v97;
  char v57 = v80;
  char v88 = v80;
  char v112 = v80;
  char v58 = v79;
  char v110 = v79;
  char v59 = v78;
  char v108 = v78;
  char v106 = v53;
  char v103 = v96;
  char v101 = v98;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v111;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v111[3];
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v109;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v109[3];
  int v60 = *(_DWORD *)v107;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v107[3];
  *(_DWORD *)(a2 + 57) = v60;
  int v61 = *(_DWORD *)v105;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v105[3];
  *(_DWORD *)(a2 + 97) = v61;
  int v62 = *(_DWORD *)v104;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v104[3];
  *(_DWORD *)(a2 + 121) = v62;
  LOBYTE(v62) = v103;
  int v63 = *(_DWORD *)v102;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v102[3];
  *(_DWORD *)(a2 + 137) = v63;
  LOBYTE(v63) = v101;
  int v64 = *(_DWORD *)v100;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v100[3];
  *(_DWORD *)(a2 + 153) = v64;
  uint64_t v65 = v86;
  uint64_t v66 = v85;
  *(void *)a2 = v86;
  *(void *)(a2 + 8) = v66;
  *(unsigned char *)(a2 + 16) = v57;
  uint64_t v67 = v84;
  *(void *)(a2 + 24) = v87;
  *(void *)(a2 + 32) = v67;
  *(unsigned char *)(a2 + 40) = v58;
  *(void *)(a2 + 48) = v83;
  *(unsigned char *)(a2 + 56) = v59;
  uint64_t v68 = v81;
  *(void *)(a2 + 64) = v82;
  *(void *)(a2 + 72) = v68;
  *(void *)(a2 + 80) = v47;
  *(void *)(a2 + 88) = v49;
  *(unsigned char *)(a2 + 96) = v53;
  *(void *)(a2 + 104) = v51;
  *(void *)(a2 + 112) = KeyPath;
  *(unsigned char *)(a2 + 120) = 2;
  *(void *)(a2 + 128) = v55;
  *(unsigned char *)(a2 + 136) = v62;
  *(void *)(a2 + 144) = v56;
  *(unsigned char *)(a2 + 152) = v63;
  *(_OWORD *)(a2 + 160) = v99;
  uint64_t v69 = v65;
  sub_24F3C3738(v65, v66, v57);
  swift_bridgeObjectRetain();
  sub_24F3C3738(v47, v49, v53);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3850(v47, v49, v53);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24F3C3850(v69, v66, v88);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3C2F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F3E3660();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v83 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24F3E3120();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24F3E3680();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  id v13 = (void *)qword_26B1F4E10;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v71 = v7 + 16;
  uint64_t v75 = v14;
  v14(v9, a1, v6);
  id v15 = v13;
  uint64_t v94 = sub_24F3E36A0();
  uint64_t v95 = v16;
  unint64_t v74 = sub_24F3C38E4();
  uint64_t v17 = sub_24F3E33A0();
  uint64_t v72 = v9;
  uint64_t v18 = v17;
  uint64_t v73 = v6;
  uint64_t v20 = v19;
  int v70 = v12;
  char v22 = v21 & 1;
  sub_24F3E3360();
  uint64_t v69 = a1;
  uint64_t v23 = sub_24F3E3390();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_24F3C3850(v18, v20, v22);
  swift_bridgeObjectRelease();
  LODWORD(v94) = sub_24F3E32E0();
  uint64_t v85 = sub_24F3E3380();
  uint64_t v84 = v28;
  uint64_t v86 = v29;
  int v78 = v30 & 1;
  sub_24F3C3850(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  sub_24F3E3560();
  sub_24F3E31C0();
  uint64_t v82 = v88;
  int v77 = v89;
  uint64_t v81 = v90;
  int v76 = v91;
  uint64_t v80 = v92;
  uint64_t v79 = v93;
  sub_24F3E3650();
  sub_24F3E3640();
  uint64_t v31 = type metadata accessor for RepeatReplaceAlertDetailView();
  uint64_t v32 = v69;
  uint64_t v33 = v69 + *(int *)(v31 + 20);
  uint64_t v94 = *(void *)(v33 + *(int *)(type metadata accessor for PreviousPlanDetail() + 36));
  sub_24F3E3620();
  sub_24F3E3640();
  sub_24F3E3670();
  uint64_t v34 = (void *)qword_26B1F4E10;
  v75(v72, v32, v73);
  id v35 = v34;
  uint64_t v94 = sub_24F3E36A0();
  uint64_t v95 = v36;
  uint64_t v37 = sub_24F3E33A0();
  uint64_t v39 = v38;
  LOBYTE(v25) = v40 & 1;
  sub_24F3E3360();
  uint64_t v41 = sub_24F3E3390();
  uint64_t v43 = v42;
  LOBYTE(v32) = v44;
  swift_release();
  sub_24F3C3850(v37, v39, v25);
  swift_bridgeObjectRelease();
  LODWORD(v94) = sub_24F3E32F0();
  uint64_t v45 = sub_24F3E3380();
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  LOBYTE(v25) = v50 & 1;
  sub_24F3C3850(v41, v43, v32 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_24F3E3570();
  sub_24F3E31C0();
  uint64_t v52 = v94;
  uint64_t v53 = v96;
  char v54 = v78;
  char v87 = v78;
  char v111 = v78;
  char v55 = v77;
  char v109 = v77;
  char v56 = v76;
  char v107 = v76;
  char v105 = v25;
  char v102 = v95;
  char v100 = v97;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v110;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v110[3];
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v108;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v108[3];
  int v57 = *(_DWORD *)v106;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v106[3];
  *(_DWORD *)(a2 + 57) = v57;
  int v58 = *(_DWORD *)v104;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v104[3];
  *(_DWORD *)(a2 + 97) = v58;
  int v59 = *(_DWORD *)v103;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v103[3];
  *(_DWORD *)(a2 + 121) = v59;
  LOBYTE(v59) = v102;
  int v60 = *(_DWORD *)v101;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v101[3];
  *(_DWORD *)(a2 + 137) = v60;
  LOBYTE(v60) = v100;
  int v61 = *(_DWORD *)v99;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v99[3];
  *(_DWORD *)(a2 + 153) = v61;
  uint64_t v62 = v85;
  uint64_t v63 = v84;
  *(void *)a2 = v85;
  *(void *)(a2 + 8) = v63;
  *(unsigned char *)(a2 + 16) = v54;
  uint64_t v64 = v82;
  *(void *)(a2 + 24) = v86;
  *(void *)(a2 + 32) = v64;
  *(unsigned char *)(a2 + 40) = v55;
  *(void *)(a2 + 48) = v81;
  *(unsigned char *)(a2 + 56) = v56;
  uint64_t v65 = v79;
  *(void *)(a2 + 64) = v80;
  *(void *)(a2 + 72) = v65;
  *(void *)(a2 + 80) = v45;
  *(void *)(a2 + 88) = v47;
  *(unsigned char *)(a2 + 96) = v25;
  *(void *)(a2 + 104) = v49;
  *(void *)(a2 + 112) = KeyPath;
  *(unsigned char *)(a2 + 120) = 2;
  *(void *)(a2 + 128) = v52;
  *(unsigned char *)(a2 + 136) = v59;
  *(void *)(a2 + 144) = v53;
  *(unsigned char *)(a2 + 152) = v60;
  *(_OWORD *)(a2 + 160) = v98;
  uint64_t v66 = v62;
  sub_24F3C3738(v62, v63, v54);
  swift_bridgeObjectRetain();
  sub_24F3C3738(v45, v47, v25);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3850(v45, v47, v25);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24F3C3850(v66, v63, v87);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3C36B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  char v4 = *(unsigned char *)(a1 + 120);
  sub_24F3C3738(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_24F3C3738(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24F3C3738(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24F3C3748(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_24F3C3738(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_24F3C3738(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24F3C37CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_24F3C3850(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_24F3C3850(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24F3C3850(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24F3C3860(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  char v4 = *(unsigned char *)(a1 + 120);
  sub_24F3C3850(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_24F3C3850(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_24F3C38E4()
{
  unint64_t result = qword_269A0BDE8;
  if (!qword_269A0BDE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BDE8);
  }
  return result;
}

uint64_t sub_24F3C3938(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24F3C4574((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_24F3C39A4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_24F3C39A4(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_24F3E38B0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v76 = 0;
      uint64_t v77 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        unsigned int v79 = *(unsigned __int8 *)(v77 + i);
        uint64_t v80 = v76;
        do
        {
          unsigned int v81 = *(unsigned __int8 *)(v77 + v80);
          if (v79 >= v81) {
            break;
          }
          if (!v77) {
            goto LABEL_142;
          }
          *(unsigned char *)(v77 + v80 + 1) = v81;
          *(unsigned char *)(v77 + v80--) = v79;
        }
        while (v80 != -1);
        ++v76;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v92 = result;
    uint64_t v93 = v3;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_24F3E36F0();
      *(void *)(result + 16) = v6;
      uint64_t v3 = v93;
      uint64_t v91 = result;
      uint64_t v95 = (unsigned __int8 *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v90 = v2;
      uint64_t v9 = *v2;
      uint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v94 = *v2;
      while (1)
      {
        uint64_t v12 = v8++;
        if (v8 < v3)
        {
          unsigned int v13 = *(unsigned __int8 *)(v9 + v8);
          unsigned int v14 = *(unsigned __int8 *)(v9 + v12);
          uint64_t v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            unsigned int v15 = v13;
            while (1)
            {
              unsigned int v16 = *(unsigned __int8 *)(v9 + v8);
              if (v13 < v14 == v16 >= v15) {
                break;
              }
              ++v8;
              unsigned int v15 = v16;
              if (v3 == v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12) {
              goto LABEL_139;
            }
            if (v12 < v8)
            {
              uint64_t v17 = v8 - 1;
              uint64_t v18 = v12;
              do
              {
                if (v18 != v17)
                {
                  if (!v9) {
                    goto LABEL_145;
                  }
                  char v19 = *(unsigned char *)(v9 + v18);
                  *(unsigned char *)(v9 + v18) = *(unsigned char *)(v9 + v17);
                  *(unsigned char *)(v9 + v17) = v19;
                }
                BOOL v58 = ++v18 < v17--;
              }
              while (v58);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12)) {
            goto LABEL_136;
          }
          if (v8 - v12 < v92)
          {
            uint64_t v20 = v12 + v92;
            if (__OFADD__(v12, v92)) {
              goto LABEL_140;
            }
            if (v20 >= v3) {
              uint64_t v20 = v3;
            }
            if (v20 < v12)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v8 != v20)
            {
              char v21 = (unsigned char *)(v9 + v8);
              do
              {
                unsigned int v22 = *(unsigned __int8 *)(v9 + v8);
                uint64_t v23 = v12;
                uint64_t v24 = v21;
                do
                {
                  unsigned int v25 = *(v24 - 1);
                  if (v22 >= v25) {
                    break;
                  }
                  if (!v9) {
                    goto LABEL_143;
                  }
                  *uint64_t v24 = v25;
                  *--uint64_t v24 = v22;
                  ++v23;
                }
                while (v8 != v23);
                ++v8;
                ++v21;
              }
              while (v8 != v20);
              uint64_t v8 = v20;
            }
          }
        }
        if (v8 < v12) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24F3C41B4(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v27 = *(void *)(v10 + 16);
        unint64_t v26 = *(void *)(v10 + 24);
        unint64_t v11 = v27 + 1;
        uint64_t v9 = v94;
        if (v27 >= v26 >> 1)
        {
          uint64_t result = (uint64_t)sub_24F3C41B4((char *)(v26 > 1), v27 + 1, 1, (char *)v10);
          uint64_t v9 = v94;
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v11;
        uint64_t v28 = v10 + 32;
        uint64_t v29 = (uint64_t *)(v10 + 32 + 16 * v27);
        *uint64_t v29 = v12;
        v29[1] = v8;
        if (v27)
        {
          while (1)
          {
            unint64_t v30 = v11 - 1;
            if (v11 >= 4)
            {
              unint64_t v35 = v28 + 16 * v11;
              uint64_t v36 = *(void *)(v35 - 64);
              uint64_t v37 = *(void *)(v35 - 56);
              BOOL v41 = __OFSUB__(v37, v36);
              uint64_t v38 = v37 - v36;
              if (v41) {
                goto LABEL_120;
              }
              uint64_t v40 = *(void *)(v35 - 48);
              uint64_t v39 = *(void *)(v35 - 40);
              BOOL v41 = __OFSUB__(v39, v40);
              uint64_t v33 = v39 - v40;
              char v34 = v41;
              if (v41) {
                goto LABEL_121;
              }
              unint64_t v42 = v11 - 2;
              uint64_t v43 = (uint64_t *)(v28 + 16 * (v11 - 2));
              uint64_t v45 = *v43;
              uint64_t v44 = v43[1];
              BOOL v41 = __OFSUB__(v44, v45);
              uint64_t v46 = v44 - v45;
              if (v41) {
                goto LABEL_122;
              }
              BOOL v41 = __OFADD__(v33, v46);
              uint64_t v47 = v33 + v46;
              if (v41) {
                goto LABEL_124;
              }
              if (v47 >= v38)
              {
                uint64_t v65 = (uint64_t *)(v28 + 16 * v30);
                uint64_t v67 = *v65;
                uint64_t v66 = v65[1];
                BOOL v41 = __OFSUB__(v66, v67);
                uint64_t v68 = v66 - v67;
                if (v41) {
                  goto LABEL_130;
                }
                BOOL v58 = v33 < v68;
                goto LABEL_84;
              }
            }
            else
            {
              if (v11 != 3)
              {
                uint64_t v59 = *(void *)(v10 + 32);
                uint64_t v60 = *(void *)(v10 + 40);
                BOOL v41 = __OFSUB__(v60, v59);
                uint64_t v52 = v60 - v59;
                char v53 = v41;
                goto LABEL_78;
              }
              uint64_t v32 = *(void *)(v10 + 32);
              uint64_t v31 = *(void *)(v10 + 40);
              BOOL v41 = __OFSUB__(v31, v32);
              uint64_t v33 = v31 - v32;
              char v34 = v41;
            }
            if (v34) {
              goto LABEL_123;
            }
            unint64_t v42 = v11 - 2;
            uint64_t v48 = (uint64_t *)(v28 + 16 * (v11 - 2));
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            BOOL v51 = __OFSUB__(v49, v50);
            uint64_t v52 = v49 - v50;
            char v53 = v51;
            if (v51) {
              goto LABEL_125;
            }
            char v54 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v56 = *v54;
            uint64_t v55 = v54[1];
            BOOL v41 = __OFSUB__(v55, v56);
            uint64_t v57 = v55 - v56;
            if (v41) {
              goto LABEL_127;
            }
            if (__OFADD__(v52, v57)) {
              goto LABEL_129;
            }
            if (v52 + v57 >= v33)
            {
              BOOL v58 = v33 < v57;
LABEL_84:
              if (v58) {
                unint64_t v30 = v42;
              }
              goto LABEL_86;
            }
LABEL_78:
            if (v53) {
              goto LABEL_126;
            }
            int v61 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v63 = *v61;
            uint64_t v62 = v61[1];
            BOOL v41 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (v41) {
              goto LABEL_128;
            }
            if (v64 < v52) {
              goto LABEL_15;
            }
LABEL_86:
            unint64_t v69 = v30 - 1;
            if (v30 - 1 >= v11)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v9) {
              goto LABEL_144;
            }
            int v70 = (uint64_t *)(v28 + 16 * v69);
            uint64_t v71 = *v70;
            uint64_t v72 = v28;
            uint64_t v73 = (void *)(v28 + 16 * v30);
            uint64_t v74 = v73[1];
            uint64_t result = sub_24F3C3FDC((unsigned __int8 *)(v9 + *v70), (unsigned __int8 *)(v9 + *v73), v9 + v74, v95);
            if (v1) {
              goto LABEL_114;
            }
            if (v74 < v71) {
              goto LABEL_117;
            }
            if (v30 > *(void *)(v10 + 16)) {
              goto LABEL_118;
            }
            uint64_t *v70 = v71;
            *(void *)(v72 + 16 * v69 + 8) = v74;
            unint64_t v75 = *(void *)(v10 + 16);
            if (v30 >= v75) {
              goto LABEL_119;
            }
            unint64_t v11 = v75 - 1;
            uint64_t result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v30));
            uint64_t v28 = v72;
            *(void *)(v10 + 16) = v75 - 1;
            uint64_t v9 = v94;
            if (v75 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v11 = 1;
LABEL_15:
        uint64_t v3 = v93;
        if (v8 >= v93)
        {
          uint64_t v2 = v90;
          uint64_t v7 = v91;
          goto LABEL_103;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v95 = (unsigned __int8 *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v91 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_103:
    uint64_t v91 = v7;
    if (v11 >= 2)
    {
      uint64_t v82 = *v2;
      do
      {
        unint64_t v83 = v11 - 2;
        if (v11 < 2) {
          goto LABEL_132;
        }
        if (!v82) {
          goto LABEL_146;
        }
        uint64_t v84 = v10;
        uint64_t v85 = v10 + 32;
        uint64_t v86 = *(void *)(v10 + 32 + 16 * v83);
        uint64_t v87 = *(void *)(v10 + 32 + 16 * (v11 - 1) + 8);
        uint64_t result = sub_24F3C3FDC((unsigned __int8 *)(v82 + v86), (unsigned __int8 *)(v82 + *(void *)(v85 + 16 * (v11 - 1))), v82 + v87, v95);
        if (v1) {
          break;
        }
        if (v87 < v86) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24F3C42B0(v84);
          uint64_t v84 = result;
        }
        if (v83 >= *(void *)(v84 + 16)) {
          goto LABEL_134;
        }
        uint64_t v88 = (void *)(v84 + 32 + 16 * v83);
        *uint64_t v88 = v86;
        v88[1] = v87;
        unint64_t v89 = *(void *)(v84 + 16);
        if (v11 > v89) {
          goto LABEL_135;
        }
        uint64_t result = (uint64_t)memmove((void *)(v84 + 32 + 16 * (v11 - 1)), (const void *)(v84 + 32 + 16 * v11), 16 * (v89 - v11));
        uint64_t v10 = v84;
        *(void *)(v84 + 16) = v89 - 1;
        unint64_t v11 = v89 - 1;
      }
      while (v89 > 2);
    }
LABEL_114:
    swift_bridgeObjectRelease();
    *(void *)(v91 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24F3C3FDC(unsigned __int8 *__dst, unsigned __int8 *__src, unint64_t a3, unsigned __int8 *a4)
{
  char v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  uint64_t v9 = a3 - (void)__src;
  if (__src - __dst < (uint64_t)(a3 - (void)__src))
  {
    if (a4 != __dst || __src <= a4) {
      memmove(a4, __dst, v8);
    }
    uint64_t v10 = &v4[v8];
    if ((unint64_t)v6 >= a3 || v8 < 1)
    {
LABEL_15:
      uint64_t v6 = v7;
      if (v7 != v4) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    while (1)
    {
      unsigned int v11 = *v6;
      if (v11 >= *v4) {
        break;
      }
      BOOL v12 = v7 == v6++;
      if (!v12) {
        goto LABEL_12;
      }
LABEL_13:
      ++v7;
      if (v4 >= v10 || (unint64_t)v6 >= a3) {
        goto LABEL_15;
      }
    }
    LOBYTE(v11) = *v4;
    BOOL v12 = v7 == v4++;
    if (v12) {
      goto LABEL_13;
    }
LABEL_12:
    unsigned __int8 *v7 = v11;
    goto LABEL_13;
  }
  if (a4 != __src || a3 <= (unint64_t)a4) {
    memmove(a4, __src, a3 - (void)__src);
  }
  uint64_t v10 = &v4[v9];
  if (v7 >= v6 || v9 < 1)
  {
LABEL_36:
    if (v6 != v4) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  unsigned int v13 = (unsigned __int8 *)(a3 - 1);
  unsigned int v14 = v6;
  while (1)
  {
    unsigned int v15 = v13 + 1;
    unsigned int v17 = *--v14;
    unsigned __int8 v16 = v17;
    if (*(v10 - 1) >= v17)
    {
      unsigned __int8 v16 = *(v10 - 1);
      unsigned int v14 = v6;
      if (v15 != v10)
      {
        --v10;
LABEL_32:
        *unsigned int v13 = v16;
        goto LABEL_33;
      }
      if (v13 >= v10--) {
        goto LABEL_32;
      }
    }
    else if (v15 != v6 || v13 >= v6)
    {
      goto LABEL_32;
    }
LABEL_33:
    if (v14 <= v7) {
      break;
    }
    --v13;
    uint64_t v6 = v14;
    if (v10 <= v4)
    {
      uint64_t v6 = v14;
      goto LABEL_36;
    }
  }
  uint64_t v6 = v14;
  if (v14 != v4)
  {
LABEL_38:
    memmove(v6, v4, v10 - v4);
    return 1;
  }
LABEL_37:
  if (v6 >= v10) {
    goto LABEL_38;
  }
  return 1;
}

char *sub_24F3C41B4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE08);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unsigned int v13 = v10 + 32;
  unsigned int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24F3C42B0(uint64_t a1)
{
  return sub_24F3C41B4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_24F3C42C4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24F3C42E4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_24F3C42E4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE00);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unsigned int v13 = v10 + 32;
  unsigned int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_24F3C43E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE10);
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
  unsigned int v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_24F3C44D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F3E3220();
  *a1 = result;
  return result;
}

uint64_t sub_24F3C4500()
{
  return sub_24F3E3230();
}

uint64_t sub_24F3C4528(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24F3C456C(uint64_t a1, uint64_t a2)
{
  return sub_24F3BFB98(a1, a2, *(void *)(v2 + 16));
}

char *sub_24F3C4574(uint64_t a1)
{
  return sub_24F3C43E8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24F3C4588(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_24F3C42C4(0, 0, 0);
  uint64_t v3 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = a2(v4, *(unsigned __int8 *)(a1 + 32 + v4));
      uint64_t v7 = v6;
      unint64_t v9 = *(void *)(v13 + 16);
      unint64_t v8 = *(void *)(v13 + 24);
      if (v9 >= v8 >> 1) {
        sub_24F3C42C4((char *)(v8 > 1), v9 + 1, 1);
      }
      ++v4;
      *(void *)(v13 + 16) = v9 + 1;
      uint64_t v10 = v13 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t CreateWorkoutPlanButtonEnvironment.init(navigateToPlanCreation:showWorkoutPlanCreationPrompt:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t destroy for CreateWorkoutPlanButtonEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CreateWorkoutPlanButtonEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CreateWorkoutPlanButtonEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
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

_OWORD *assignWithTake for CreateWorkoutPlanButtonEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonEnvironment(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonEnvironment()
{
  return &type metadata for CreateWorkoutPlanButtonEnvironment;
}

uint64_t PreviousPlanLockupState.placeholderIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for PreviousPlanLockupState()
{
  uint64_t result = qword_269A0BE58;
  if (!qword_269A0BE58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PreviousPlanLockupState.loadState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PreviousPlanLockupState();
  return sub_24F3C5504(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
}

uint64_t PreviousPlanLockupState.loadState.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 24);
  return sub_24F3C4990(a1, v3);
}

uint64_t sub_24F3C4990(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t (*PreviousPlanLockupState.loadState.modify())()
{
  return nullsub_1;
}

uint64_t PreviousPlanLockupState.isShowingAlert.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 28));
}

uint64_t PreviousPlanLockupState.isShowingAlert.setter(char a1)
{
  uint64_t result = type metadata accessor for PreviousPlanLockupState();
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*PreviousPlanLockupState.isShowingAlert.modify())()
{
  return nullsub_1;
}

uint64_t PreviousPlanLockupState.init(locale:placeholderIdentifier:loadState:isShowingAlert:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for PreviousPlanLockupState();
  uint64_t v13 = v12[7];
  uint64_t v14 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a6, a1, v14);
  unsigned int v15 = (void *)(a6 + v12[5]);
  *unsigned int v15 = a2;
  v15[1] = a3;
  uint64_t result = sub_24F3C4B90(a4, a6 + v12[6]);
  *(unsigned char *)(a6 + v13) = a5;
  return result;
}

uint64_t sub_24F3C4B90(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 32))(a2, a1, State);
  return a2;
}

unint64_t sub_24F3C4BF4()
{
  unint64_t result = 0x656C61636F6CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x7461745364616F6CLL;
      break;
    case 3:
      unint64_t result = 0x6E69776F68537369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F3C4C94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3C76C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3C4CBC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24F3C4CC8(uint64_t a1)
{
  unint64_t v2 = sub_24F3C4FA0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3C4D04(uint64_t a1)
{
  unint64_t v2 = sub_24F3C4FA0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PreviousPlanLockupState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3C4FA0();
  sub_24F3E3920();
  v8[15] = 0;
  sub_24F3E3120();
  sub_24F3C54BC(&qword_269A0BE28, MEMORY[0x263F07690]);
  sub_24F3E38A0();
  if (!v1)
  {
    type metadata accessor for PreviousPlanLockupState();
    v8[14] = 1;
    sub_24F3E3870();
    v8[13] = 2;
    type metadata accessor for PreviousPlanLockupLoadState();
    sub_24F3C54BC(&qword_269A0BE30, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState);
    sub_24F3E38A0();
    v8[12] = 3;
    sub_24F3E3880();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F3C4FA0()
{
  unint64_t result = qword_269A0BE20;
  if (!qword_269A0BE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BE20);
  }
  return result;
}

uint64_t PreviousPlanLockupState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State);
  unint64_t v26 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24F3E3120();
  uint64_t v29 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v30 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE38);
  uint64_t v28 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PreviousPlanLockupState();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(int *)(v9 + 28);
  v11[v12] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3C4FA0();
  uint64_t v31 = v7;
  uint64_t v13 = (uint64_t)v33;
  sub_24F3E3910();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v24 = v12;
  uint64_t v15 = v28;
  uint64_t v14 = v29;
  uint64_t v33 = a1;
  char v37 = 0;
  sub_24F3C54BC(&qword_269A0BE40, MEMORY[0x263F07690]);
  sub_24F3E3830();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v30, v4);
  char v36 = 1;
  uint64_t v16 = sub_24F3E3800();
  uint64_t v17 = v8;
  uint64_t v18 = (uint64_t *)&v11[*(int *)(v8 + 20)];
  uint64_t *v18 = v16;
  v18[1] = v19;
  char v35 = 2;
  sub_24F3C54BC(&qword_269A0BE48, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState);
  uint64_t v20 = (uint64_t)v26;
  sub_24F3E3830();
  sub_24F3C4B90(v20, (uint64_t)&v11[*(int *)(v17 + 24)]);
  char v34 = 3;
  char v22 = sub_24F3E3810();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v31, v32);
  uint64_t v23 = v25;
  v11[v24] = v22 & 1;
  sub_24F3C5504((uint64_t)v11, v23, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return sub_24F3C66F0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupState);
}

uint64_t sub_24F3C54BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F3C5504(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F3C556C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupState.init(from:)(a1, a2);
}

uint64_t sub_24F3C5584(void *a1)
{
  return PreviousPlanLockupState.encode(to:)(a1);
}

uint64_t _s18FitnessWorkoutPlan08PreviousC11LockupStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x25335C790]() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v4 = (int *)type metadata accessor for PreviousPlanLockupState();
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  BOOL v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (char v10 = sub_24F3E38C0(), v11 = 0, (v10 & 1) != 0))
  {
    if (_s18FitnessWorkoutPlan08PreviousC15LockupLoadStateO2eeoiySbAC_ACtFZ_0(a1 + v4[6], a2 + v4[6]))
    {
      char v11 = *(unsigned char *)(a1 + v4[7]) ^ *(unsigned char *)(a2 + v4[7]) ^ 1;
      return v11 & 1;
    }
LABEL_9:
    char v11 = 0;
  }
  return v11 & 1;
}

void *initializeBufferWithCopyOfBuffer for PreviousPlanLockupState(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24F3E3120();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    char v10 = (void *)((char *)a1 + v8);
    char v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *char v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)((char *)a1 + v9);
    uint64_t v14 = (void *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 2, v15))
    {
      uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
      memcpy(v13, v14, *(void *)(*(void *)(State - 8) + 64));
    }
    else
    {
      uint64_t v19 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v20 = *((void *)v19 - 1);
      if ((*(unsigned int (**)(void *, uint64_t, int *))(v20 + 48))(v14, 1, v19))
      {
        memcpy(v13, v14, *(void *)(v16 + 64));
      }
      else
      {
        uint64_t v21 = v14[1];
        *uint64_t v13 = *v14;
        v13[1] = v21;
        uint64_t v22 = v14[3];
        v13[2] = v14[2];
        v13[3] = v22;
        uint64_t v23 = v14[5];
        v13[4] = v14[4];
        v13[5] = v23;
        uint64_t v24 = v14[7];
        v13[6] = v14[6];
        v13[7] = v24;
        uint64_t v25 = v19[8];
        uint64_t v32 = (char *)v14 + v25;
        char v34 = (char *)v13 + v25;
        uint64_t v36 = v20;
        uint64_t v26 = sub_24F3E30D0();
        unint64_t v30 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v30(v34, v32, v26);
        *(void *)((char *)v13 + v19[9]) = *(void *)((char *)v14 + v19[9]);
        *(void *)((char *)v13 + v19[10]) = *(void *)((char *)v14 + v19[10]);
        *(void *)((char *)v13 + v19[11]) = *(void *)((char *)v14 + v19[11]);
        *((unsigned char *)v13 + v19[12]) = *((unsigned char *)v14 + v19[12]);
        *(void *)((char *)v13 + v19[13]) = *(void *)((char *)v14 + v19[13]);
        uint64_t v27 = v19[14];
        uint64_t v33 = (char *)v14 + v27;
        char v35 = (char *)v13 + v27;
        uint64_t v28 = sub_24F3E3100();
        uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31(v35, v33, v28);
        *(void *)((char *)v13 + v19[15]) = *(void *)((char *)v14 + v19[15]);
        (*(void (**)(void *, void, uint64_t, int *))(v36 + 56))(v13, 0, 1, v19);
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 2, v15);
    }
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 2, v6);
  if (!result)
  {
    uint64_t v8 = type metadata accessor for PreviousPlanDetail();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8);
    if (!result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = v5 + *(int *)(v8 + 32);
      uint64_t v10 = sub_24F3E30D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = v5 + *(int *)(v8 + 56);
      uint64_t v12 = sub_24F3E3100();
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
      return v13(v11, v12);
    }
  }
  return result;
}

uint64_t initializeWithCopy for PreviousPlanLockupState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  swift_bridgeObjectRetain();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 2, v14))
  {
    uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
    memcpy(v12, v13, *(void *)(*(void *)(State - 8) + 64));
  }
  else
  {
    uint64_t v17 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v18 = *((void *)v17 - 1);
    if ((*(unsigned int (**)(void *, uint64_t, int *))(v18 + 48))(v13, 1, v17))
    {
      memcpy(v12, v13, *(void *)(v15 + 64));
    }
    else
    {
      uint64_t v19 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v19;
      uint64_t v20 = v13[3];
      v12[2] = v13[2];
      v12[3] = v20;
      uint64_t v21 = v13[5];
      v12[4] = v13[4];
      v12[5] = v21;
      uint64_t v22 = v13[7];
      v12[6] = v13[6];
      v12[7] = v22;
      uint64_t v23 = v17[8];
      unint64_t v30 = (char *)v13 + v23;
      uint64_t v32 = (char *)v12 + v23;
      uint64_t v34 = v18;
      uint64_t v24 = sub_24F3E30D0();
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28(v32, v30, v24);
      *(void *)((char *)v12 + v17[9]) = *(void *)((char *)v13 + v17[9]);
      *(void *)((char *)v12 + v17[10]) = *(void *)((char *)v13 + v17[10]);
      *(void *)((char *)v12 + v17[11]) = *(void *)((char *)v13 + v17[11]);
      *((unsigned char *)v12 + v17[12]) = *((unsigned char *)v13 + v17[12]);
      *(void *)((char *)v12 + v17[13]) = *(void *)((char *)v13 + v17[13]);
      uint64_t v25 = v17[14];
      uint64_t v31 = (char *)v13 + v25;
      uint64_t v33 = (char *)v12 + v25;
      uint64_t v26 = sub_24F3E3100();
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v33, v31, v26);
      *(void *)((char *)v12 + v17[15]) = *(void *)((char *)v13 + v17[15]);
      (*(void (**)(void *, void, uint64_t, int *))(v34 + 56))(v12, 0, 1, v17);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 2, v14);
  }
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithCopy for PreviousPlanLockupState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 2, v13);
  int v17 = v15(v12, 2, v13);
  if (!v16)
  {
    if (!v17)
    {
      uint64_t v21 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v54 = *((void *)v21 - 1);
      uint64_t v22 = *(uint64_t (**)(void *, uint64_t, int *))(v54 + 48);
      int v23 = v22(v11, 1, v21);
      int v24 = v22(v12, 1, v21);
      if (v23)
      {
        if (!v24)
        {
          void *v11 = *v12;
          v11[1] = v12[1];
          v11[2] = v12[2];
          v11[3] = v12[3];
          v11[4] = v12[4];
          v11[5] = v12[5];
          v11[6] = v12[6];
          v11[7] = v12[7];
          uint64_t v25 = v21[8];
          uint64_t v46 = (char *)v12 + v25;
          uint64_t v50 = (char *)v11 + v25;
          uint64_t v26 = sub_24F3E30D0();
          uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v44(v50, v46, v26);
          *(void *)((char *)v11 + v21[9]) = *(void *)((char *)v12 + v21[9]);
          *(void *)((char *)v11 + v21[10]) = *(void *)((char *)v12 + v21[10]);
          *(void *)((char *)v11 + v21[11]) = *(void *)((char *)v12 + v21[11]);
          *((unsigned char *)v11 + v21[12]) = *((unsigned char *)v12 + v21[12]);
          *(void *)((char *)v11 + v21[13]) = *(void *)((char *)v12 + v21[13]);
          uint64_t v27 = v21[14];
          uint64_t v47 = (char *)v12 + v27;
          BOOL v51 = (char *)v11 + v27;
          uint64_t v28 = sub_24F3E3100();
          uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v45(v51, v47, v28);
          *(void *)((char *)v11 + v21[15]) = *(void *)((char *)v12 + v21[15]);
          (*(void (**)(void *, void, uint64_t, int *))(v54 + 56))(v11, 0, 1, v21);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v24)
        {
          void *v11 = *v12;
          v11[1] = v12[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[2] = v12[2];
          v11[3] = v12[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[4] = v12[4];
          v11[5] = v12[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v11[6] = v12[6];
          v11[7] = v12[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v34 = v21[8];
          char v35 = (char *)v11 + v34;
          uint64_t v36 = (char *)v12 + v34;
          uint64_t v37 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
          *(void *)((char *)v11 + v21[9]) = *(void *)((char *)v12 + v21[9]);
          *(void *)((char *)v11 + v21[10]) = *(void *)((char *)v12 + v21[10]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(void *)((char *)v11 + v21[11]) = *(void *)((char *)v12 + v21[11]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *((unsigned char *)v11 + v21[12]) = *((unsigned char *)v12 + v21[12]);
          *(void *)((char *)v11 + v21[13]) = *(void *)((char *)v12 + v21[13]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v38 = v21[14];
          uint64_t v39 = (char *)v11 + v38;
          uint64_t v40 = (char *)v12 + v38;
          uint64_t v41 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 24))(v39, v40, v41);
          *(void *)((char *)v11 + v21[15]) = *(void *)((char *)v12 + v21[15]);
          goto LABEL_14;
        }
        sub_24F3C66F0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
      }
      size_t v20 = *(void *)(v14 + 64);
      goto LABEL_8;
    }
    sub_24F3C6750((uint64_t)v11);
LABEL_7:
    size_t v20 = *(void *)(*(void *)(type metadata accessor for PreviousPlanLockupLoadState() - 8) + 64);
LABEL_8:
    memcpy(v11, v12, v20);
    goto LABEL_14;
  }
  if (v17) {
    goto LABEL_7;
  }
  uint64_t v18 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v19 = *((void *)v18 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v19 + 48))(v12, 1, v18))
  {
    memcpy(v11, v12, *(void *)(v14 + 64));
  }
  else
  {
    void *v11 = *v12;
    v11[1] = v12[1];
    v11[2] = v12[2];
    v11[3] = v12[3];
    v11[4] = v12[4];
    v11[5] = v12[5];
    v11[6] = v12[6];
    v11[7] = v12[7];
    uint64_t v29 = v18[8];
    uint64_t v48 = (char *)v12 + v29;
    uint64_t v52 = (char *)v11 + v29;
    uint64_t v55 = v19;
    uint64_t v30 = sub_24F3E30D0();
    unint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42(v52, v48, v30);
    *(void *)((char *)v11 + v18[9]) = *(void *)((char *)v12 + v18[9]);
    *(void *)((char *)v11 + v18[10]) = *(void *)((char *)v12 + v18[10]);
    *(void *)((char *)v11 + v18[11]) = *(void *)((char *)v12 + v18[11]);
    *((unsigned char *)v11 + v18[12]) = *((unsigned char *)v12 + v18[12]);
    *(void *)((char *)v11 + v18[13]) = *(void *)((char *)v12 + v18[13]);
    uint64_t v31 = v18[14];
    uint64_t v49 = (char *)v12 + v31;
    char v53 = (char *)v11 + v31;
    uint64_t v32 = sub_24F3E3100();
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v43(v53, v49, v32);
    *(void *)((char *)v11 + v18[15]) = *(void *)((char *)v12 + v18[15]);
    (*(void (**)(void *, void, uint64_t, int *))(v55 + 56))(v11, 0, 1, v18);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 2, v13);
LABEL_14:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_24F3C66F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F3C6750(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for PreviousPlanLockupState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
    memcpy(v8, v9, *(void *)(*(void *)(State - 8) + 64));
  }
  else
  {
    uint64_t v13 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v14 = *((void *)v13 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v14 + 48))(v9, 1, v13))
    {
      memcpy(v8, v9, *(void *)(v11 + 64));
    }
    else
    {
      long long v15 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v15;
      long long v16 = v9[3];
      v8[2] = v9[2];
      v8[3] = v16;
      uint64_t v17 = v13[8];
      uint64_t v26 = v14;
      uint64_t v18 = (char *)v8 + v17;
      uint64_t v19 = (char *)v9 + v17;
      uint64_t v20 = sub_24F3E30D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
      *(void *)((char *)v8 + v13[9]) = *(void *)((char *)v9 + v13[9]);
      *(void *)((char *)v8 + v13[10]) = *(void *)((char *)v9 + v13[10]);
      *(void *)((char *)v8 + v13[11]) = *(void *)((char *)v9 + v13[11]);
      *((unsigned char *)v8 + v13[12]) = *((unsigned char *)v9 + v13[12]);
      *(void *)((char *)v8 + v13[13]) = *(void *)((char *)v9 + v13[13]);
      uint64_t v21 = v13[14];
      uint64_t v22 = (char *)v8 + v21;
      int v23 = (char *)v9 + v21;
      uint64_t v24 = sub_24F3E3100();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
      *(void *)((char *)v8 + v13[15]) = *(void *)((char *)v9 + v13[15]);
      (*(void (**)(_OWORD *, void, uint64_t, int *))(v26 + 56))(v8, 0, 1, v13);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
  }
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for PreviousPlanLockupState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24F3E3120();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = (_OWORD *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 2, v15);
  int v19 = v17(v14, 2, v15);
  if (!v18)
  {
    if (!v19)
    {
      int v23 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v60 = *((void *)v23 - 1);
      uint64_t v24 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v60 + 48);
      int v25 = v24(v13, 1, v23);
      int v26 = v24(v14, 1, v23);
      if (v25)
      {
        if (!v26)
        {
          long long v27 = v14[1];
          *uint64_t v13 = *v14;
          v13[1] = v27;
          long long v28 = v14[3];
          v13[2] = v14[2];
          v13[3] = v28;
          uint64_t v29 = v23[8];
          uint64_t v30 = (char *)v13 + v29;
          uint64_t v31 = (char *)v14 + v29;
          uint64_t v32 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
          *(void *)((char *)v13 + v23[9]) = *(void *)((char *)v14 + v23[9]);
          *(void *)((char *)v13 + v23[10]) = *(void *)((char *)v14 + v23[10]);
          *(void *)((char *)v13 + v23[11]) = *(void *)((char *)v14 + v23[11]);
          *((unsigned char *)v13 + v23[12]) = *((unsigned char *)v14 + v23[12]);
          *(void *)((char *)v13 + v23[13]) = *(void *)((char *)v14 + v23[13]);
          uint64_t v33 = v23[14];
          uint64_t v34 = (char *)v13 + v33;
          char v35 = (char *)v14 + v33;
          uint64_t v36 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
          *(void *)((char *)v13 + v23[15]) = *(void *)((char *)v14 + v23[15]);
          (*(void (**)(_OWORD *, void, uint64_t, int *))(v60 + 56))(v13, 0, 1, v23);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v26)
        {
          uint64_t v48 = *((void *)v14 + 1);
          *(void *)uint64_t v13 = *(void *)v14;
          *((void *)v13 + 1) = v48;
          swift_bridgeObjectRelease();
          uint64_t v49 = *((void *)v14 + 3);
          *((void *)v13 + 2) = *((void *)v14 + 2);
          *((void *)v13 + 3) = v49;
          swift_bridgeObjectRelease();
          uint64_t v50 = *((void *)v14 + 5);
          *((void *)v13 + 4) = *((void *)v14 + 4);
          *((void *)v13 + 5) = v50;
          swift_bridgeObjectRelease();
          uint64_t v51 = *((void *)v14 + 7);
          *((void *)v13 + 6) = *((void *)v14 + 6);
          *((void *)v13 + 7) = v51;
          swift_bridgeObjectRelease();
          uint64_t v52 = v23[8];
          char v53 = (char *)v13 + v52;
          uint64_t v54 = (char *)v14 + v52;
          uint64_t v55 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 40))(v53, v54, v55);
          *(void *)((char *)v13 + v23[9]) = *(void *)((char *)v14 + v23[9]);
          *(void *)((char *)v13 + v23[10]) = *(void *)((char *)v14 + v23[10]);
          swift_bridgeObjectRelease();
          *(void *)((char *)v13 + v23[11]) = *(void *)((char *)v14 + v23[11]);
          swift_bridgeObjectRelease();
          *((unsigned char *)v13 + v23[12]) = *((unsigned char *)v14 + v23[12]);
          *(void *)((char *)v13 + v23[13]) = *(void *)((char *)v14 + v23[13]);
          swift_bridgeObjectRelease();
          uint64_t v56 = v23[14];
          uint64_t v57 = (char *)v13 + v56;
          BOOL v58 = (char *)v14 + v56;
          uint64_t v59 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 40))(v57, v58, v59);
          *(void *)((char *)v13 + v23[15]) = *(void *)((char *)v14 + v23[15]);
          goto LABEL_14;
        }
        sub_24F3C66F0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
      }
      size_t v22 = *(void *)(v16 + 64);
      goto LABEL_8;
    }
    sub_24F3C6750((uint64_t)v13);
LABEL_7:
    size_t v22 = *(void *)(*(void *)(type metadata accessor for PreviousPlanLockupLoadState() - 8) + 64);
LABEL_8:
    memcpy(v13, v14, v22);
    goto LABEL_14;
  }
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v20 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v21 = *((void *)v20 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v21 + 48))(v14, 1, v20))
  {
    memcpy(v13, v14, *(void *)(v16 + 64));
  }
  else
  {
    long long v37 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v37;
    long long v38 = v14[3];
    v13[2] = v14[2];
    v13[3] = v38;
    uint64_t v39 = v20[8];
    uint64_t v61 = v21;
    uint64_t v40 = (char *)v13 + v39;
    uint64_t v41 = (char *)v14 + v39;
    uint64_t v42 = sub_24F3E30D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
    *(void *)((char *)v13 + v20[9]) = *(void *)((char *)v14 + v20[9]);
    *(void *)((char *)v13 + v20[10]) = *(void *)((char *)v14 + v20[10]);
    *(void *)((char *)v13 + v20[11]) = *(void *)((char *)v14 + v20[11]);
    *((unsigned char *)v13 + v20[12]) = *((unsigned char *)v14 + v20[12]);
    *(void *)((char *)v13 + v20[13]) = *(void *)((char *)v14 + v20[13]);
    uint64_t v43 = v20[14];
    uint64_t v44 = (char *)v13 + v43;
    uint64_t v45 = (char *)v14 + v43;
    uint64_t v46 = sub_24F3E3100();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
    *(void *)((char *)v13 + v20[15]) = *(void *)((char *)v14 + v20[15]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v61 + 56))(v13, 0, 1, v20);
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 2, v15);
LABEL_14:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3C70E0);
}

uint64_t sub_24F3C70E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3E3120();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 48);
    uint64_t v13 = State;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3C7224);
}

uint64_t sub_24F3C7224(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24F3E3120();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 56);
    uint64_t v13 = State;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_24F3C7354()
{
  uint64_t result = sub_24F3E3120();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PreviousPlanLockupLoadState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviousPlanLockupState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3C7588);
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

ValueMetadata *type metadata accessor for PreviousPlanLockupState.CodingKeys()
{
  return &type metadata for PreviousPlanLockupState.CodingKeys;
}

unint64_t sub_24F3C75C4()
{
  unint64_t result = qword_269A0BE68;
  if (!qword_269A0BE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BE68);
  }
  return result;
}

unint64_t sub_24F3C761C()
{
  unint64_t result = qword_269A0BE70;
  if (!qword_269A0BE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BE70);
  }
  return result;
}

unint64_t sub_24F3C7674()
{
  unint64_t result = qword_269A0BE78;
  if (!qword_269A0BE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BE78);
  }
  return result;
}

uint64_t sub_24F3C76C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024F3E7E30 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E69776F68537369 && a2 == 0xEE007472656C4167)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

__n128 CreateWorkoutPlanButtonFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t CreateWorkoutPlanButtonFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, void **a3, char a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE80);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v46 - v14;
  if (a4)
  {
    if (a4 == 1)
    {
      uint64_t v16 = v4[1];
      uint64_t v17 = v4[2];
      uint64_t v18 = v4[3];
      uint64_t v47 = *v4;
      uint64_t v48 = v17;
      int v19 = *(unsigned __int8 *)(a2 + 24);
      uint64_t v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B40);
      uint64_t v21 = v20[16];
      uint64_t v22 = v20[20];
      uint64_t v23 = v20[24];
      if (v19 == 1)
      {
        uint64_t v24 = &v15[v21];
        int v25 = &v15[v22];
        int v26 = &v15[v23];
        char v49 = 1;
        sub_24F3C7DD4();
        sub_24F3E3790();
        sub_24F3E3740();
        uint64_t v27 = *MEMORY[0x263F39590];
        uint64_t v28 = sub_24F3E35A0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v24, v27, v28);
        uint64_t v29 = *MEMORY[0x263F39570];
        uint64_t v30 = sub_24F3E3590();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v25, v29, v30);
        uint64_t v31 = (void *)swift_allocObject();
        v31[2] = v47;
        v31[3] = v16;
        v31[4] = v48;
        v31[5] = v18;
        *(void *)int v26 = &unk_269A0BEA8;
        *((void *)v26 + 1) = v31;
        (*(void (**)(char *, void, uint64_t))(v9 + 104))(v15, *MEMORY[0x263F39530], v8);
        uint64_t v32 = *a3;
        swift_retain();
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v32 = (void *)sub_24F3C8B8C(0, v32[2] + 1, 1, v32, &qword_269A0BED0, &qword_269A0BE80);
        }
        unint64_t v34 = v32[2];
        unint64_t v33 = v32[3];
        if (v34 >= v33 >> 1) {
          uint64_t v32 = (void *)sub_24F3C8B8C(v33 > 1, v34 + 1, 1, v32, &qword_269A0BED0, &qword_269A0BE80);
        }
        v32[2] = v34 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))((unint64_t)v32+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v34, v15, v8);
        *a3 = v32;
      }
      else
      {
        char v35 = &v12[v21];
        uint64_t v36 = &v12[v22];
        long long v37 = &v12[v23];
        char v50 = 0;
        sub_24F3C7DD4();
        sub_24F3E3790();
        sub_24F3E3740();
        uint64_t v38 = *MEMORY[0x263F39580];
        uint64_t v39 = sub_24F3E35A0();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v35, v38, v39);
        uint64_t v40 = *MEMORY[0x263F39570];
        uint64_t v41 = sub_24F3E3590();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v36, v40, v41);
        uint64_t v42 = (void *)swift_allocObject();
        v42[2] = v47;
        v42[3] = v16;
        v42[4] = v48;
        v42[5] = v18;
        *(void *)long long v37 = &unk_269A0BE98;
        *((void *)v37 + 1) = v42;
        (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F39530], v8);
        uint64_t v43 = *a3;
        swift_retain();
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v43 = (void *)sub_24F3C8B8C(0, v43[2] + 1, 1, v43, &qword_269A0BED0, &qword_269A0BE80);
        }
        unint64_t v45 = v43[2];
        unint64_t v44 = v43[3];
        if (v45 >= v44 >> 1) {
          uint64_t v43 = (void *)sub_24F3C8B8C(v44 > 1, v45 + 1, 1, v43, &qword_269A0BED0, &qword_269A0BE80);
        }
        v43[2] = v45 + 1;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))((unint64_t)v43+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v45, v12, v8);
        *a3 = v43;
      }
    }
    else
    {
      *(unsigned char *)(a2 + 1) = 1;
    }
  }
  return result;
}

unint64_t sub_24F3C7DD4()
{
  unint64_t result = qword_269A0BE88;
  if (!qword_269A0BE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A0BE88);
  }
  return result;
}

uint64_t sub_24F3C7E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  *(void *)(v5 + 32) = sub_24F3E3730();
  *(void *)(v5 + 40) = sub_24F3E3720();
  *(unsigned char *)(v5 + 72) = 2;
  char v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BEC8);
  *char v6 = v5;
  v6[1] = sub_24F3C7F08;
  return MEMORY[0x270F252C8](v5 + 72, v7);
}

uint64_t sub_24F3C7F08()
{
  uint64_t v1 = *v0;
  BOOL v2 = *(int **)(*v0 + 16);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  char v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v4;
  *unsigned int v4 = v3;
  v4[1] = sub_24F3C809C;
  return v6();
}

uint64_t sub_24F3C809C()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F3E3700();
  if (v0) {
    unsigned int v4 = sub_24F3C825C;
  }
  else {
    unsigned int v4 = sub_24F3C81F8;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F3C81F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3C825C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3C82C0(uint64_t a1, int *a2)
{
  v2[2] = sub_24F3E3730();
  v2[3] = sub_24F3E3720();
  uint64_t v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_24F3C83B4;
  return v6();
}

uint64_t sub_24F3C83B4()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F3E3700();
  if (v0) {
    unsigned int v4 = sub_24F3C8574;
  }
  else {
    unsigned int v4 = sub_24F3C8510;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F3C8510()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3C8574()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3C85DC(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24F3C8698;
  return sub_24F3C82C0(a1, v4);
}

uint64_t sub_24F3C8698()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24F3C8790(uint64_t a1, uint64_t a2, void **a3, char *a4)
{
  return CreateWorkoutPlanButtonFeature.reduce(localState:sharedState:sideEffects:action:)(a1, a2, a3, *a4);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24F3C87DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24F3C8D60;
  return sub_24F3C7E28(a1, v4, v5, v7, v6);
}

unint64_t sub_24F3C889C()
{
  unint64_t result = qword_26B1F3990;
  if (!qword_26B1F3990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3990);
  }
  return result;
}

unint64_t sub_24F3C88F4()
{
  unint64_t result = qword_26B1F3988;
  if (!qword_26B1F3988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3988);
  }
  return result;
}

unint64_t sub_24F3C894C()
{
  unint64_t result = qword_26B1F3B10;
  if (!qword_26B1F3B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3B10);
  }
  return result;
}

unint64_t sub_24F3C89A4()
{
  unint64_t result = qword_26B1F3980;
  if (!qword_26B1F3980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3980);
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonFeature()
{
  return &type metadata for CreateWorkoutPlanButtonFeature;
}

unsigned char *storeEnumTagSinglePayload for CreateWorkoutPlanButtonFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3C8AD4);
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

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonFeature.TaskIdentifier()
{
  return &type metadata for CreateWorkoutPlanButtonFeature.TaskIdentifier;
}

unint64_t sub_24F3C8B10()
{
  unint64_t result = qword_269A0BEB0;
  if (!qword_269A0BEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BEB0);
  }
  return result;
}

size_t sub_24F3C8B64(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_24F3C8B8C(a1, a2, a3, a4, &qword_269A0BEB8, &qword_269A0BEC0);
}

size_t sub_24F3C8B78(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_24F3C8B8C(a1, a2, a3, a4, (uint64_t *)&unk_26B1F3B80, &qword_26B1F3B18);
}

size_t sub_24F3C8B8C(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

uint64_t sub_24F3C8D68()
{
  uint64_t v1 = 0x676E696863746566;
  if (*v0 != 1) {
    uint64_t v1 = 0x64656863746566;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_24F3C8DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3CC838(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3C8DE4(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA568();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3C8E20(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA568();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3C8E5C()
{
  return 12383;
}

uint64_t sub_24F3C8E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F3C8EE8(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA688();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3C8F24(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA688();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3C8F60(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA6DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3C8F9C(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA6DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3C8FD8(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA730();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3C9014(uint64_t a1)
{
  unint64_t v2 = sub_24F3CA730();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PreviousPlanLockupLoadState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BED8);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v33 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v32 = (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BEE0);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BEE8);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BEF0);
  uint64_t v15 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3CA568();
  sub_24F3E3920();
  sub_24F3CA5BC(v36, (uint64_t)v14);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 2, v4);
  if (v18)
  {
    if (v18 == 1)
    {
      char v38 = 0;
      sub_24F3CA730();
      uint64_t v19 = v37;
      sub_24F3E3850();
      uint64_t v21 = v27;
      uint64_t v20 = v28;
    }
    else
    {
      char v39 = 1;
      sub_24F3CA6DC();
      uint64_t v11 = v29;
      uint64_t v19 = v37;
      sub_24F3E3850();
      uint64_t v21 = v30;
      uint64_t v20 = v31;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v19);
  }
  else
  {
    uint64_t v22 = v32;
    sub_24F3CA620((uint64_t)v14, v32);
    char v40 = 2;
    sub_24F3CA688();
    uint64_t v23 = v33;
    uint64_t v24 = v37;
    sub_24F3E3850();
    type metadata accessor for PreviousPlanDetail();
    sub_24F3CA89C(&qword_269A0BF08, (void (*)(uint64_t))type metadata accessor for PreviousPlanDetail);
    uint64_t v25 = v35;
    sub_24F3E3860();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v23, v25);
    sub_24F3CC980(v22, &qword_269A0BE50);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v24);
  }
}

uint64_t PreviousPlanLockupLoadState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BF20);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v51 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BF28);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388](v6);
  char v50 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BF30);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BF38);
  uint64_t v49 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  uint64_t v16 = MEMORY[0x270FA5388](State);
  int v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v41 - v19;
  uint64_t v21 = a1[3];
  char v53 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_24F3CA568();
  uint64_t v22 = (uint64_t)v54;
  sub_24F3E3910();
  if (!v22)
  {
    uint64_t v42 = v18;
    uint64_t v23 = v50;
    uint64_t v24 = v51;
    uint64_t v54 = v20;
    uint64_t v25 = v52;
    uint64_t v26 = sub_24F3E3840();
    if (*(void *)(v26 + 16) == 1)
    {
      if (*(unsigned char *)(v26 + 32))
      {
        if (*(unsigned char *)(v26 + 32) != 1)
        {
          char v57 = 2;
          sub_24F3CA688();
          unint64_t v33 = v24;
          sub_24F3E37D0();
          type metadata accessor for PreviousPlanDetail();
          sub_24F3CA89C(&qword_269A0BF40, (void (*)(uint64_t))type metadata accessor for PreviousPlanDetail);
          uint64_t v36 = (uint64_t)v42;
          uint64_t v37 = v47;
          sub_24F3E37F0();
          (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v37);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
          uint64_t v38 = (uint64_t)v53;
          uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v36, 0, 2, v39);
          uint64_t v28 = (uint64_t)v54;
          sub_24F3CA7EC(v36, (uint64_t)v54, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
          uint64_t v40 = v52;
LABEL_12:
          sub_24F3CA7EC(v28, v40, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
          return __swift_destroy_boxed_opaque_existential_1(v38);
        }
        char v56 = 1;
        sub_24F3CA6DC();
        sub_24F3E37D0();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v46);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
        uint64_t v28 = (uint64_t)v54;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v54, 2, 2, v27);
      }
      else
      {
        char v55 = 0;
        sub_24F3CA730();
        sub_24F3E37D0();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v43);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v49 + 8))(v14, v12);
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
        uint64_t v28 = (uint64_t)v54;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v54, 1, 2, v35);
      }
      uint64_t v38 = (uint64_t)v53;
      uint64_t v40 = v25;
      goto LABEL_12;
    }
    uint64_t v29 = sub_24F3E37C0();
    swift_allocError();
    uint64_t v30 = v14;
    uint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    uint64_t *v32 = State;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v30, v12);
  }
  uint64_t v38 = (uint64_t)v53;
  return __swift_destroy_boxed_opaque_existential_1(v38);
}

uint64_t sub_24F3C9C98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupLoadState.init(from:)(a1, a2);
}

uint64_t sub_24F3C9CB0(void *a1)
{
  return PreviousPlanLockupLoadState.encode(to:)(a1);
}

uint64_t PreviousPlanLockupLoadState.hash(into:)()
{
  uint64_t v1 = type metadata accessor for PreviousPlanDetail();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3CA5BC(v0, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 2, v5)) {
    return sub_24F3E38E0();
  }
  sub_24F3CA620((uint64_t)v14, (uint64_t)v11);
  sub_24F3E38E0();
  sub_24F3CA784((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
    sub_24F3E38F0();
  }
  else
  {
    sub_24F3CA7EC((uint64_t)v9, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
    sub_24F3E38F0();
    PreviousPlanDetail.hash(into:)();
    sub_24F3CC9DC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  }
  return sub_24F3CC980((uint64_t)v11, &qword_269A0BE50);
}

uint64_t PreviousPlanLockupLoadState.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3C9FA4()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3C9FE8()
{
  return sub_24F3E3900();
}

uint64_t _s18FitnessWorkoutPlan08PreviousC15LockupLoadStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = (void *)a2;
  uint64_t v3 = type metadata accessor for PreviousPlanDetail();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  uint64_t v37 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (void **)((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BFA0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State - 8);
  int v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BFA8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t)&v22[*(int *)(v20 + 56)];
  sub_24F3CA5BC(a1, (uint64_t)v22);
  sub_24F3CA5BC((uint64_t)v38, v23);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v25 = v24(v22, 2, v9);
  if (!v25)
  {
    uint64_t v38 = v13;
    uint64_t v26 = v37;
    sub_24F3CA5BC((uint64_t)v22, (uint64_t)v18);
    if (v24((char *)v23, 2, v9))
    {
      sub_24F3CC980((uint64_t)v18, &qword_269A0BE50);
      goto LABEL_9;
    }
    uint64_t v28 = (uint64_t)v15;
    sub_24F3CA620(v23, (uint64_t)v15);
    uint64_t v29 = (uint64_t)&v8[*(int *)(v6 + 48)];
    sub_24F3CA620((uint64_t)v18, (uint64_t)v8);
    sub_24F3CA784((uint64_t)v15, v29);
    uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
    uint64_t v31 = v36;
    if (v30((uint64_t)v8, 1, v36) == 1)
    {
      sub_24F3CC980((uint64_t)v15, &qword_269A0BE50);
      if (v30(v29, 1, v31) == 1)
      {
        sub_24F3CC980((uint64_t)v8, &qword_269A0BE50);
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v32 = v38;
      sub_24F3CA784((uint64_t)v8, (uint64_t)v38);
      if (v30(v29, 1, v31) != 1)
      {
        unint64_t v33 = v35;
        sub_24F3CA7EC(v29, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
        BOOL v34 = _s18FitnessWorkoutPlan08PreviousC6DetailV2eeoiySbAC_ACtFZ_0(v32, v33);
        sub_24F3CC9DC((uint64_t)v33, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
        sub_24F3CC980(v28, &qword_269A0BE50);
        sub_24F3CC9DC((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
        sub_24F3CC980((uint64_t)v8, &qword_269A0BE50);
        if (v34) {
          goto LABEL_8;
        }
LABEL_18:
        sub_24F3CC9DC((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
        return 0;
      }
      sub_24F3CC980(v28, &qword_269A0BE50);
      sub_24F3CC9DC((uint64_t)v32, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
    }
    sub_24F3CC980((uint64_t)v8, &qword_269A0BFA0);
    goto LABEL_18;
  }
  if (v25 == 1)
  {
    if (v24((char *)v23, 2, v9) != 1) {
      goto LABEL_9;
    }
LABEL_8:
    sub_24F3CC9DC((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
    return 1;
  }
  if (v24((char *)v23, 2, v9) == 2) {
    goto LABEL_8;
  }
LABEL_9:
  sub_24F3CC980((uint64_t)v22, &qword_269A0BFA8);
  return 0;
}

uint64_t type metadata accessor for PreviousPlanLockupLoadState()
{
  uint64_t result = qword_26B1F37C0;
  if (!qword_26B1F37C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F3CA568()
{
  unint64_t result = qword_269A0BEF8;
  if (!qword_269A0BEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BEF8);
  }
  return result;
}

uint64_t sub_24F3CA5BC(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 16))(a2, a1, State);
  return a2;
}

uint64_t sub_24F3CA620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F3CA688()
{
  unint64_t result = qword_269A0BF00;
  if (!qword_269A0BF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF00);
  }
  return result;
}

unint64_t sub_24F3CA6DC()
{
  unint64_t result = qword_269A0BF10;
  if (!qword_269A0BF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF10);
  }
  return result;
}

unint64_t sub_24F3CA730()
{
  unint64_t result = qword_269A0BF18;
  if (!qword_269A0BF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF18);
  }
  return result;
}

uint64_t sub_24F3CA784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3CA7EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F3CA854()
{
  return sub_24F3CA89C(&qword_269A0BF48, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupLoadState);
}

uint64_t sub_24F3CA89C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for PreviousPlanLockupLoadState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v11 = *((void *)v10 - 1);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v11 + 48))(a2, 1, v10))
      {
        memcpy(a1, a2, *(void *)(v8 + 64));
      }
      else
      {
        uint64_t v27 = v11;
        uint64_t v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        uint64_t v13 = a2[3];
        a1[2] = a2[2];
        a1[3] = v13;
        uint64_t v14 = a2[5];
        a1[4] = a2[4];
        a1[5] = v14;
        uint64_t v15 = a2[7];
        a1[6] = a2[6];
        a1[7] = v15;
        uint64_t v16 = v10[8];
        uint64_t v23 = (char *)a2 + v16;
        int v25 = (char *)a1 + v16;
        uint64_t v17 = sub_24F3E30D0();
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v21(v25, v23, v17);
        *(uint64_t *)((char *)a1 + v10[9]) = *(uint64_t *)((char *)a2 + v10[9]);
        *(uint64_t *)((char *)a1 + v10[10]) = *(uint64_t *)((char *)a2 + v10[10]);
        *(uint64_t *)((char *)a1 + v10[11]) = *(uint64_t *)((char *)a2 + v10[11]);
        *((unsigned char *)a1 + v10[12]) = *((unsigned char *)a2 + v10[12]);
        *(uint64_t *)((char *)a1 + v10[13]) = *(uint64_t *)((char *)a2 + v10[13]);
        uint64_t v18 = v10[14];
        uint64_t v24 = (char *)a2 + v18;
        uint64_t v26 = (char *)a1 + v18;
        uint64_t v19 = sub_24F3E3100();
        uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v22(v26, v24, v19);
        *(uint64_t *)((char *)a1 + v10[15]) = *(uint64_t *)((char *)a2 + v10[15]);
        (*(void (**)(uint64_t *, void, uint64_t, int *))(v27 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupLoadState(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = type metadata accessor for PreviousPlanDetail();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4);
    if (!result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = a1 + *(int *)(v4 + 32);
      uint64_t v6 = sub_24F3E30D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = a1 + *(int *)(v4 + 56);
      uint64_t v8 = sub_24F3E3100();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      return v9(v7, v8);
    }
  }
  return result;
}

void *initializeWithCopy for PreviousPlanLockupLoadState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v9 = *((void *)v8 - 1);
    if ((*(unsigned int (**)(void *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      uint64_t v25 = v9;
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      uint64_t v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      uint64_t v13 = a2[7];
      a1[6] = a2[6];
      a1[7] = v13;
      uint64_t v14 = v8[8];
      uint64_t v21 = (char *)a2 + v14;
      uint64_t v23 = (char *)a1 + v14;
      uint64_t v15 = sub_24F3E30D0();
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19(v23, v21, v15);
      *(void *)((char *)a1 + v8[9]) = *(void *)((char *)a2 + v8[9]);
      *(void *)((char *)a1 + v8[10]) = *(void *)((char *)a2 + v8[10]);
      *(void *)((char *)a1 + v8[11]) = *(void *)((char *)a2 + v8[11]);
      *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
      *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
      uint64_t v16 = v8[14];
      uint64_t v22 = (char *)a2 + v16;
      uint64_t v24 = (char *)a1 + v16;
      uint64_t v17 = sub_24F3E3100();
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(v24, v22, v17);
      *(void *)((char *)a1 + v8[15]) = *(void *)((char *)a2 + v8[15]);
      (*(void (**)(void *, void, uint64_t, int *))(v25 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *assignWithCopy for PreviousPlanLockupLoadState(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v15 = *((void *)v14 - 1);
      uint64_t v16 = *(uint64_t (**)(void *, uint64_t, int *))(v15 + 48);
      int v17 = v16(a1, 1, v14);
      int v18 = v16(a2, 1, v14);
      if (v17)
      {
        if (!v18)
        {
          *a1 = *a2;
          a1[1] = a2[1];
          a1[2] = a2[2];
          a1[3] = a2[3];
          a1[4] = a2[4];
          a1[5] = a2[5];
          a1[6] = a2[6];
          a1[7] = a2[7];
          uint64_t v19 = v14[8];
          uint64_t v41 = (char *)a2 + v19;
          uint64_t v44 = (char *)a1 + v19;
          uint64_t v20 = sub_24F3E30D0();
          uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v21(v44, v41, v20);
          *(void *)((char *)a1 + v14[9]) = *(void *)((char *)a2 + v14[9]);
          *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
          *(void *)((char *)a1 + v14[11]) = *(void *)((char *)a2 + v14[11]);
          *((unsigned char *)a1 + v14[12]) = *((unsigned char *)a2 + v14[12]);
          *(void *)((char *)a1 + v14[13]) = *(void *)((char *)a2 + v14[13]);
          uint64_t v22 = v14[14];
          uint64_t v45 = (char *)a1 + v22;
          uint64_t v23 = (char *)a2 + v22;
          uint64_t v24 = sub_24F3E3100();
          uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v25(v45, v23, v24);
          *(void *)((char *)a1 + v14[15]) = *(void *)((char *)a2 + v14[15]);
          (*(void (**)(void *, void, uint64_t, int *))(v15 + 56))(a1, 0, 1, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
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
          uint64_t v31 = v14[8];
          uint64_t v32 = (char *)a1 + v31;
          unint64_t v33 = (char *)a2 + v31;
          uint64_t v34 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
          *(void *)((char *)a1 + v14[9]) = *(void *)((char *)a2 + v14[9]);
          *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(void *)((char *)a1 + v14[11]) = *(void *)((char *)a2 + v14[11]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *((unsigned char *)a1 + v14[12]) = *((unsigned char *)a2 + v14[12]);
          *(void *)((char *)a1 + v14[13]) = *(void *)((char *)a2 + v14[13]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v35 = v14[14];
          uint64_t v36 = (char *)a1 + v35;
          uint64_t v37 = (char *)a2 + v35;
          uint64_t v38 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 24))(v36, v37, v38);
          *(void *)((char *)a1 + v14[15]) = *(void *)((char *)a2 + v14[15]);
          return a1;
        }
        sub_24F3CC9DC((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
      }
      size_t v13 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_24F3CC980((uint64_t)a1, &qword_269A0BE50);
LABEL_7:
    size_t v13 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v12 + 48))(a2, 1, v11))
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    a1[5] = a2[5];
    a1[6] = a2[6];
    a1[7] = a2[7];
    uint64_t v26 = v11[8];
    uint64_t v42 = (char *)a2 + v26;
    uint64_t v46 = (char *)a1 + v26;
    uint64_t v27 = sub_24F3E30D0();
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39(v46, v42, v27);
    *(void *)((char *)a1 + v11[9]) = *(void *)((char *)a2 + v11[9]);
    *(void *)((char *)a1 + v11[10]) = *(void *)((char *)a2 + v11[10]);
    *(void *)((char *)a1 + v11[11]) = *(void *)((char *)a2 + v11[11]);
    *((unsigned char *)a1 + v11[12]) = *((unsigned char *)a2 + v11[12]);
    *(void *)((char *)a1 + v11[13]) = *(void *)((char *)a2 + v11[13]);
    uint64_t v28 = v11[14];
    uint64_t v43 = (char *)a2 + v28;
    uint64_t v47 = (char *)a1 + v28;
    uint64_t v29 = sub_24F3E3100();
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40(v47, v43, v29);
    *(void *)((char *)a1 + v11[15]) = *(void *)((char *)a2 + v11[15]);
    (*(void (**)(void *, void, uint64_t, int *))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanLockupLoadState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v9 = *((void *)v8 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
    {
      memcpy(a1, a2, *(void *)(v7 + 64));
    }
    else
    {
      long long v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      long long v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      uint64_t v12 = v8[8];
      size_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_24F3E30D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      *(void *)((char *)a1 + v8[9]) = *(void *)((char *)a2 + v8[9]);
      *(void *)((char *)a1 + v8[10]) = *(void *)((char *)a2 + v8[10]);
      *(void *)((char *)a1 + v8[11]) = *(void *)((char *)a2 + v8[11]);
      *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
      *(void *)((char *)a1 + v8[13]) = *(void *)((char *)a2 + v8[13]);
      uint64_t v16 = v8[14];
      int v17 = (char *)a1 + v16;
      int v18 = (char *)a2 + v16;
      uint64_t v19 = sub_24F3E3100();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      *(void *)((char *)a1 + v8[15]) = *(void *)((char *)a2 + v8[15]);
      (*(void (**)(_OWORD *, void, uint64_t, int *))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

_OWORD *assignWithTake for PreviousPlanLockupLoadState(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v14 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v15 = *((void *)v14 - 1);
      uint64_t v16 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v15 + 48);
      int v17 = v16(a1, 1, v14);
      int v18 = v16(a2, 1, v14);
      if (v17)
      {
        if (!v18)
        {
          long long v19 = a2[1];
          *a1 = *a2;
          a1[1] = v19;
          long long v20 = a2[3];
          a1[2] = a2[2];
          a1[3] = v20;
          uint64_t v21 = v14[8];
          uint64_t v22 = (char *)a1 + v21;
          uint64_t v23 = (char *)a2 + v21;
          uint64_t v24 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
          *(void *)((char *)a1 + v14[9]) = *(void *)((char *)a2 + v14[9]);
          *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
          *(void *)((char *)a1 + v14[11]) = *(void *)((char *)a2 + v14[11]);
          *((unsigned char *)a1 + v14[12]) = *((unsigned char *)a2 + v14[12]);
          *(void *)((char *)a1 + v14[13]) = *(void *)((char *)a2 + v14[13]);
          uint64_t v25 = v14[14];
          uint64_t v26 = (char *)a1 + v25;
          uint64_t v27 = (char *)a2 + v25;
          uint64_t v28 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
          *(void *)((char *)a1 + v14[15]) = *(void *)((char *)a2 + v14[15]);
          (*(void (**)(_OWORD *, void, uint64_t, int *))(v15 + 56))(a1, 0, 1, v14);
          return a1;
        }
      }
      else
      {
        if (!v18)
        {
          uint64_t v40 = *((void *)a2 + 1);
          *(void *)a1 = *(void *)a2;
          *((void *)a1 + 1) = v40;
          swift_bridgeObjectRelease();
          uint64_t v41 = *((void *)a2 + 3);
          *((void *)a1 + 2) = *((void *)a2 + 2);
          *((void *)a1 + 3) = v41;
          swift_bridgeObjectRelease();
          uint64_t v42 = *((void *)a2 + 5);
          *((void *)a1 + 4) = *((void *)a2 + 4);
          *((void *)a1 + 5) = v42;
          swift_bridgeObjectRelease();
          uint64_t v43 = *((void *)a2 + 7);
          *((void *)a1 + 6) = *((void *)a2 + 6);
          *((void *)a1 + 7) = v43;
          swift_bridgeObjectRelease();
          uint64_t v44 = v14[8];
          uint64_t v45 = (char *)a1 + v44;
          uint64_t v46 = (char *)a2 + v44;
          uint64_t v47 = sub_24F3E30D0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 40))(v45, v46, v47);
          *(void *)((char *)a1 + v14[9]) = *(void *)((char *)a2 + v14[9]);
          *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
          swift_bridgeObjectRelease();
          *(void *)((char *)a1 + v14[11]) = *(void *)((char *)a2 + v14[11]);
          swift_bridgeObjectRelease();
          *((unsigned char *)a1 + v14[12]) = *((unsigned char *)a2 + v14[12]);
          *(void *)((char *)a1 + v14[13]) = *(void *)((char *)a2 + v14[13]);
          swift_bridgeObjectRelease();
          uint64_t v48 = v14[14];
          uint64_t v49 = (char *)a1 + v48;
          char v50 = (char *)a2 + v48;
          uint64_t v51 = sub_24F3E3100();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 40))(v49, v50, v51);
          *(void *)((char *)a1 + v14[15]) = *(void *)((char *)a2 + v14[15]);
          return a1;
        }
        sub_24F3CC9DC((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
      }
      size_t v13 = *(void *)(v7 + 64);
      goto LABEL_8;
    }
    sub_24F3CC980((uint64_t)a1, &qword_269A0BE50);
LABEL_7:
    size_t v13 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v13);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  long long v11 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v12 + 48))(a2, 1, v11))
  {
    memcpy(a1, a2, *(void *)(v7 + 64));
  }
  else
  {
    long long v29 = a2[1];
    *a1 = *a2;
    a1[1] = v29;
    long long v30 = a2[3];
    a1[2] = a2[2];
    a1[3] = v30;
    uint64_t v31 = v11[8];
    uint64_t v32 = (char *)a1 + v31;
    unint64_t v33 = (char *)a2 + v31;
    uint64_t v34 = sub_24F3E30D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
    *(void *)((char *)a1 + v11[9]) = *(void *)((char *)a2 + v11[9]);
    *(void *)((char *)a1 + v11[10]) = *(void *)((char *)a2 + v11[10]);
    *(void *)((char *)a1 + v11[11]) = *(void *)((char *)a2 + v11[11]);
    *((unsigned char *)a1 + v11[12]) = *((unsigned char *)a2 + v11[12]);
    *(void *)((char *)a1 + v11[13]) = *(void *)((char *)a2 + v11[13]);
    uint64_t v35 = v11[14];
    uint64_t v36 = (char *)a1 + v35;
    uint64_t v37 = (char *)a2 + v35;
    uint64_t v38 = sub_24F3E3100();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    *(void *)((char *)a1 + v11[15]) = *(void *)((char *)a2 + v11[15]);
    (*(void (**)(_OWORD *, void, uint64_t, int *))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupLoadState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3CC014);
}

uint64_t sub_24F3CC014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupLoadState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3CC098);
}

uint64_t sub_24F3CC098(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24F3CC120(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 2, v2);
}

uint64_t sub_24F3CC18C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 2, v4);
}

void sub_24F3CC200()
{
  sub_24F3CC278();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataSinglePayload();
  }
}

void sub_24F3CC278()
{
  if (!qword_26B1F3A78)
  {
    type metadata accessor for PreviousPlanDetail();
    unint64_t v0 = sub_24F3E3780();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1F3A78);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PreviousPlanLockupLoadState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3CC39CLL);
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

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.CodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.IdleCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.FetchingCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.FetchingCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PreviousPlanLockupLoadState.FetchedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3CC490);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupLoadState.FetchedCodingKeys()
{
  return &type metadata for PreviousPlanLockupLoadState.FetchedCodingKeys;
}

unint64_t sub_24F3CC4CC()
{
  unint64_t result = qword_269A0BF50;
  if (!qword_269A0BF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF50);
  }
  return result;
}

unint64_t sub_24F3CC524()
{
  unint64_t result = qword_269A0BF58;
  if (!qword_269A0BF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF58);
  }
  return result;
}

unint64_t sub_24F3CC57C()
{
  unint64_t result = qword_269A0BF60;
  if (!qword_269A0BF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF60);
  }
  return result;
}

unint64_t sub_24F3CC5D4()
{
  unint64_t result = qword_269A0BF68;
  if (!qword_269A0BF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF68);
  }
  return result;
}

unint64_t sub_24F3CC62C()
{
  unint64_t result = qword_269A0BF70;
  if (!qword_269A0BF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF70);
  }
  return result;
}

unint64_t sub_24F3CC684()
{
  unint64_t result = qword_269A0BF78;
  if (!qword_269A0BF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF78);
  }
  return result;
}

unint64_t sub_24F3CC6DC()
{
  unint64_t result = qword_269A0BF80;
  if (!qword_269A0BF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF80);
  }
  return result;
}

unint64_t sub_24F3CC734()
{
  unint64_t result = qword_269A0BF88;
  if (!qword_269A0BF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF88);
  }
  return result;
}

unint64_t sub_24F3CC78C()
{
  unint64_t result = qword_269A0BF90;
  if (!qword_269A0BF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF90);
  }
  return result;
}

unint64_t sub_24F3CC7E4()
{
  unint64_t result = qword_269A0BF98;
  if (!qword_269A0BF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BF98);
  }
  return result;
}

uint64_t sub_24F3CC838(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24F3CC980(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F3CC9DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F3CCA3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BFF0);
  sub_24F3C4528(&qword_269A0BFF8, &qword_269A0BFF0);
  return sub_24F3E31A0();
}

uint64_t PreviousPlanLockupView.init(store:artworkViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a5 = sub_24F3CCB78;
  *(void *)(a5 + 8) = result;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = a3;
  *(void *)(a5 + 32) = a4;
  return result;
}

uint64_t sub_24F3CCB40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F3CCB78()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t PreviousPlanLockupView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v40 = sub_24F3E31E0();
  uint64_t v45 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v42 = *(void *)(a1 + 16);
  uint64_t v41 = v4;
  type metadata accessor for LockupView();
  uint64_t v5 = sub_24F3E31D0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v68 = MEMORY[0x263F19100];
  uint64_t v6 = swift_getWitnessTable();
  *(void *)&long long v59 = v5;
  *((void *)&v59 + 1) = v6;
  swift_getOpaqueTypeMetadata2();
  *(void *)&long long v59 = v5;
  *((void *)&v59 + 1) = v6;
  swift_getOpaqueTypeConformance2();
  sub_24F3E3500();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFB0);
  sub_24F3E31D0();
  uint64_t v7 = sub_24F3C4528(&qword_269A0BFB8, &qword_269A0BFB0);
  uint64_t v65 = v6;
  uint64_t v66 = v7;
  swift_getWitnessTable();
  uint64_t v8 = sub_24F3E3500();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFC0);
  OpaqueTypeMetadata2 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFC8);
  uint64_t v36 = v10;
  uint64_t v11 = type metadata accessor for RepeatReplaceAlertDetailView();
  uint64_t v35 = v11;
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v13 = sub_24F3C4528(&qword_269A0BFD0, &qword_269A0BFC0);
  unint64_t v14 = sub_24F3CD2D0();
  uint64_t v15 = sub_24F3D19F8(&qword_269A0BFE0, (void (*)(uint64_t))type metadata accessor for RepeatReplaceAlertDetailView);
  *(void *)&long long v59 = v8;
  *((void *)&v59 + 1) = v9;
  *(void *)&long long v60 = v10;
  *((void *)&v60 + 1) = v11;
  uint64_t v61 = v12;
  uint64_t v62 = v13;
  unint64_t v63 = v14;
  uint64_t v64 = v15;
  swift_getOpaqueTypeMetadata2();
  sub_24F3E32C0();
  v34[1] = sub_24F3E32C0();
  uint64_t v16 = sub_24F3E34C0();
  uint64_t v39 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v38 = (char *)v34 - v17;
  uint64_t v18 = swift_getWitnessTable();
  *(void *)&long long v59 = v8;
  *((void *)&v59 + 1) = OpaqueTypeMetadata2;
  *(void *)&long long v60 = v36;
  *((void *)&v60 + 1) = v35;
  uint64_t v61 = v12;
  uint64_t v62 = v13;
  unint64_t v63 = v14;
  uint64_t v64 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v58 = v18;
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v55 = v18;
  uint64_t v56 = v19;
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v21 = sub_24F3D19F8(&qword_269A0BFE8, MEMORY[0x263F18FD0]);
  uint64_t v22 = v40;
  *(void *)&long long v59 = v16;
  *((void *)&v59 + 1) = v40;
  *(void *)&long long v60 = v20;
  *((void *)&v60 + 1) = v21;
  uint64_t v35 = MEMORY[0x263F1A938];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v36 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v24 = (char *)v34 - v23;
  long long v25 = v44[1];
  long long v59 = *v44;
  long long v60 = v25;
  uint64_t v61 = *((void *)v44 + 4);
  uint64_t v26 = v42;
  uint64_t v47 = v42;
  uint64_t v27 = v41;
  uint64_t v48 = v41;
  uint64_t v49 = &v59;
  uint64_t v28 = v38;
  sub_24F3E34B0();
  long long v29 = v43;
  sub_24F3E32D0();
  sub_24F3E33E0();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v22);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v16);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v26;
  *(void *)(v30 + 24) = v27;
  long long v31 = v60;
  *(_OWORD *)(v30 + 32) = v59;
  *(_OWORD *)(v30 + 48) = v31;
  *(void *)(v30 + 64) = v61;
  sub_24F3D11C8((uint64_t)&v59);
  uint64_t v50 = v16;
  uint64_t v51 = v22;
  uint64_t v52 = v20;
  uint64_t v53 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = OpaqueTypeMetadata2;
  sub_24F3E3450();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v24, v32);
}

unint64_t sub_24F3CD2D0()
{
  unint64_t result = qword_269A0BFD8;
  if (!qword_269A0BFD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0BFD8);
  }
  return result;
}

uint64_t sub_24F3CD33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v49 = a3;
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  uint64_t v5 = sub_24F3E3120();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v54 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24F3E3680();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v48 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24F3E3660();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v47 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_24F3E3040();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v40 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_24F3E3060();
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24F3E3080();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24F3E30A0();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v37 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v37 - v26;
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v37 - v29;
  uint64_t v31 = *(void *)v45;
  uint64_t v42 = *(void *)(v45 + 8);
  uint64_t v43 = v31;
  int v41 = *(unsigned __int8 *)(v45 + 16);
  long long v45 = *(_OWORD *)(v45 + 24);
  MEMORY[0x25335C680]();
  sub_24F3E3070();
  sub_24F3E3090();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v19 + 8);
  v32(v21, v18);
  sub_24F3E3050();
  sub_24F3E3020();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
  v32(v24, v18);
  unint64_t v33 = v40;
  sub_24F3E3030();
  sub_24F3E3010();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v46);
  v32(v27, v18);
  sub_24F3E3650();
  sub_24F3E3640();
  sub_24F3E30D0();
  sub_24F3D19F8(&qword_269A0C000, MEMORY[0x263F07258]);
  sub_24F3C38E4();
  sub_24F3E3610();
  sub_24F3E3640();
  sub_24F3E3670();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v55 = v43;
  uint64_t v56 = v42;
  char v57 = v41;
  long long v58 = v45;
  id v34 = (id)qword_26B1F4E10;
  sub_24F3CCA3C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  swift_release();
  uint64_t v35 = sub_24F3E36A0();
  v32(v30, v18);
  return v35;
}

uint64_t sub_24F3CD94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v156 = a3;
  uint64_t v157 = a1;
  uint64_t v162 = a4;
  uint64_t v5 = sub_24F3E3120();
  MEMORY[0x270FA5388](v5 - 8);
  v136 = (char *)&v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24F3E3680();
  MEMORY[0x270FA5388](v7 - 8);
  long long v135 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24F3E3660();
  MEMORY[0x270FA5388](v9 - 8);
  v134 = (char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LockupView();
  uint64_t v11 = sub_24F3E31D0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFB0);
  uint64_t v12 = sub_24F3E31D0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v189 = MEMORY[0x263F19100];
  uint64_t v13 = swift_getWitnessTable();
  uint64_t v14 = sub_24F3C4528(&qword_269A0BFB8, &qword_269A0BFB0);
  uint64_t v186 = v13;
  uint64_t v187 = v14;
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v133 = v12;
  uint64_t v132 = v15;
  uint64_t v16 = sub_24F3E3500();
  uint64_t v140 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  long long v144 = (char *)&v130 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFC0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFC8);
  uint64_t v20 = type metadata accessor for RepeatReplaceAlertDetailView();
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = sub_24F3C4528(&qword_269A0BFD0, &qword_269A0BFC0);
  unint64_t v23 = sub_24F3CD2D0();
  uint64_t v24 = sub_24F3D19F8(&qword_269A0BFE0, (void (*)(uint64_t))type metadata accessor for RepeatReplaceAlertDetailView);
  uint64_t v169 = v16;
  *(void *)&long long v180 = v16;
  *((void *)&v180 + 1) = v18;
  uint64_t v171 = v18;
  uint64_t v165 = v19;
  *(void *)&long long v181 = v19;
  *((void *)&v181 + 1) = v20;
  uint64_t v168 = v20;
  uint64_t v170 = v21;
  uint64_t v182 = v21;
  uint64_t v183 = v22;
  uint64_t v163 = v22;
  unint64_t v166 = v23;
  unint64_t v184 = v23;
  uint64_t v185 = v24;
  uint64_t v164 = v24;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v139 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  long long v138 = (char *)&v130 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  long long v143 = (char *)&v130 - v28;
  MEMORY[0x270FA5388](v29);
  char v137 = (char *)&v130 - v30;
  uint64_t v149 = type metadata accessor for PreviousPlanDetail();
  uint64_t v142 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  uint64_t v150 = (uint64_t)&v130 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v180 = v11;
  *((void *)&v180 + 1) = v13;
  uint64_t v32 = swift_getOpaqueTypeMetadata2();
  *(void *)&long long v180 = v11;
  *((void *)&v180 + 1) = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v153 = v32;
  char v152 = (void *)OpaqueTypeConformance2;
  uint64_t v34 = sub_24F3E3500();
  uint64_t v148 = OpaqueTypeMetadata2;
  uint64_t v35 = sub_24F3E32C0();
  uint64_t v147 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v146 = (char *)&v130 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  long long v145 = (char *)&v130 - v38;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  uint64_t v40 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v141 = (uint64_t)&v130 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  uint64_t v151 = (uint64_t)&v130 - v43;
  uint64_t v167 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v44);
  long long v154 = (char *)&v130 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v46);
  long long v155 = (char *)&v130 - v47;
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v50 = (char *)&v130 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = v35;
  uint64_t v160 = sub_24F3E32C0();
  uint64_t v159 = *(void *)(v160 - 8);
  MEMORY[0x270FA5388](v160);
  long long v158 = (char *)&v130 - v51;
  long long v52 = *(_OWORD *)(v157 + 16);
  long long v180 = *(_OWORD *)v157;
  long long v181 = v52;
  uint64_t v53 = v157;
  uint64_t v182 = *(void *)(v157 + 32);
  uint64_t v54 = v156;
  uint64_t v55 = type metadata accessor for PreviousPlanLockupView();
  sub_24F3CCA3C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  swift_release();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v50, 2, v39))
  {
    uint64_t v130 = v55;
    uint64_t v69 = v53;
    uint64_t v131 = v34;
    uint64_t v70 = v169;
    uint64_t v71 = v151;
    sub_24F3CA620((uint64_t)v50, v151);
    uint64_t v72 = v71;
    uint64_t v73 = v141;
    sub_24F3CA784(v72, v141);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v142 + 48))(v73, 1, v149) == 1)
    {
      sub_24F3CC980(v73, &qword_269A0BE50);
      uint64_t v74 = swift_allocObject();
      *(void *)(v74 + 16) = a2;
      *(void *)(v74 + 24) = v54;
      long long v75 = *(_OWORD *)(v69 + 16);
      *(_OWORD *)(v74 + 32) = *(_OWORD *)v69;
      *(_OWORD *)(v74 + 48) = v75;
      *(void *)(v74 + 64) = *(void *)(v69 + 32);
      MEMORY[0x270FA5388](v74);
      sub_24F3D11C8(v69);
      uint64_t v76 = (uint64_t)v154;
      sub_24F3E34F0();
      uint64_t v77 = v131;
      uint64_t v78 = swift_getWitnessTable();
      unsigned int v79 = v155;
      sub_24F3DF7B4(v76, v77, v78);
      uint64_t v167 = *(void *)(v167 + 8);
      ((void (*)(uint64_t, uint64_t))v167)(v76, v77);
      sub_24F3DF7B4(v79, v77, v78);
      *(void *)&long long v180 = v70;
      *((void *)&v180 + 1) = v171;
      uint64_t v80 = v165;
      uint64_t v81 = v168;
      *(void *)&long long v181 = v165;
      *((void *)&v181 + 1) = v168;
      uint64_t v82 = v163;
      uint64_t v182 = v170;
      uint64_t v183 = v163;
      unint64_t v184 = v166;
      uint64_t v185 = v164;
      swift_getOpaqueTypeConformance2();
      unint64_t v83 = v145;
      sub_24F3D0740(v76, v148, v77);
      uint64_t v84 = v76;
      uint64_t v85 = v82;
      uint64_t v86 = (void (*)(char *, uint64_t))v167;
      ((void (*)(uint64_t, uint64_t))v167)(v84, v77);
      v86(v79, v77);
LABEL_10:
      *(void *)&long long v180 = v169;
      *((void *)&v180 + 1) = v171;
      *(void *)&long long v181 = v80;
      *((void *)&v181 + 1) = v81;
      uint64_t v182 = v170;
      uint64_t v183 = v85;
      uint64_t v114 = v164;
      unint64_t v184 = v166;
      uint64_t v185 = v164;
      uint64_t v115 = swift_getOpaqueTypeConformance2();
      uint64_t v116 = swift_getWitnessTable();
      uint64_t v178 = v115;
      uint64_t v179 = v116;
      uint64_t v117 = v161;
      uint64_t v118 = swift_getWitnessTable();
      uint64_t v119 = (uint64_t)v146;
      sub_24F3DF7B4(v83, v117, v118);
      uint64_t v120 = v80;
      uint64_t v121 = v85;
      char v122 = v83;
      uint64_t v65 = v158;
      sub_24F3D0740(v119, v77, v117);
      long long v123 = *(void (**)(uint64_t, uint64_t))(v147 + 8);
      v123(v119, v117);
      long long v124 = v122;
      uint64_t v62 = v121;
      uint64_t v67 = v120;
      unint64_t v63 = v166;
      uint64_t v64 = v114;
      v123((uint64_t)v124, v117);
      uint64_t v66 = v169;
      uint64_t v68 = v170;
      sub_24F3CC980(v151, &qword_269A0BE50);
      goto LABEL_11;
    }
    uint64_t v87 = v150;
    sub_24F3BF4A4(v73, v150);
    uint64_t v88 = swift_allocObject();
    *(void *)(v88 + 16) = a2;
    *(void *)(v88 + 24) = v54;
    long long v89 = *(_OWORD *)(v69 + 16);
    *(_OWORD *)(v88 + 32) = *(_OWORD *)v69;
    *(_OWORD *)(v88 + 48) = v89;
    *(void *)(v88 + 64) = *(void *)(v69 + 32);
    MEMORY[0x270FA5388](v88);
    sub_24F3D11C8(v69);
    sub_24F3E34F0();
    if (*(unsigned char *)(v87 + *(int *)(v149 + 48)) == 1)
    {
      sub_24F3E3650();
      sub_24F3E3640();
      swift_bridgeObjectRetain();
      sub_24F3E3630();
      swift_bridgeObjectRelease();
      sub_24F3E3640();
      sub_24F3E3670();
      if (qword_26B1F3B38 == -1) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_24F3E3650();
      sub_24F3E3640();
      swift_bridgeObjectRetain();
      sub_24F3E3630();
      swift_bridgeObjectRelease();
      sub_24F3E3640();
      sub_24F3E3670();
      if (qword_26B1F3B38 == -1)
      {
LABEL_9:
        long long v90 = *(_OWORD *)(v69 + 16);
        long long v180 = *(_OWORD *)v69;
        long long v181 = v90;
        uint64_t v182 = *(void *)(v69 + 32);
        (id)qword_26B1F4E10;
        sub_24F3CCA3C();
        swift_getKeyPath();
        sub_24F3E35B0();
        swift_release();
        swift_release();
        *(void *)&long long v180 = sub_24F3E36A0();
        *((void *)&v180 + 1) = v91;
        sub_24F3C38E4();
        uint64_t v167 = sub_24F3E33A0();
        long long v154 = v92;
        long long v155 = v93;
        LODWORD(v153) = v94 & 1;
        long long v95 = *(_OWORD *)(v69 + 16);
        long long v180 = *(_OWORD *)v69;
        long long v181 = v95;
        uint64_t v182 = *(void *)(v69 + 32);
        sub_24F3CCA3C();
        swift_getKeyPath();
        sub_24F3E35D0();
        swift_release();
        uint64_t v96 = swift_release();
        char v152 = &v130;
        uint64_t v142 = *((void *)&v180 + 1);
        LODWORD(v149) = v181;
        MEMORY[0x270FA5388](v96);
        MEMORY[0x270FA5388](v97);
        MEMORY[0x270FA5388](v98);
        uint64_t v157 = swift_checkMetadataState();
        uint64_t v99 = v170;
        uint64_t v100 = v165;
        uint64_t v101 = v167;
        uint64_t v102 = (uint64_t)v154;
        char v103 = v153;
        long long v104 = v144;
        sub_24F3E3410();
        swift_release();
        swift_release();
        sub_24F3C3850(v101, v102, v103);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v140 + 8))(v104, v70);
        *(void *)&long long v180 = v70;
        *((void *)&v180 + 1) = v171;
        *(void *)&long long v181 = v100;
        *((void *)&v181 + 1) = v157;
        uint64_t v80 = v100;
        uint64_t v81 = v168;
        uint64_t v182 = v99;
        uint64_t v183 = v163;
        unint64_t v184 = v166;
        uint64_t v185 = v164;
        uint64_t v105 = swift_getOpaqueTypeConformance2();
        char v106 = v137;
        char v107 = v143;
        uint64_t v108 = v148;
        sub_24F3DF7B4(v143, v148, v105);
        char v109 = *(void (**)(char *, uint64_t))(v139 + 8);
        v109(v107, v108);
        uint64_t v110 = (uint64_t)v138;
        sub_24F3DF7B4(v106, v108, v105);
        uint64_t v77 = v131;
        swift_getWitnessTable();
        char v111 = v145;
        sub_24F3D0648(v110, v108);
        uint64_t v112 = v110;
        uint64_t v85 = v163;
        v109((char *)v112, v108);
        uint64_t v113 = v108;
        unint64_t v83 = v111;
        v109(v106, v113);
        sub_24F3D1D7C(v150, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
        goto LABEL_10;
      }
    }
    swift_once();
    goto LABEL_9;
  }
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = a2;
  *(void *)(v56 + 24) = v54;
  long long v57 = *(_OWORD *)(v53 + 16);
  *(_OWORD *)(v56 + 32) = *(_OWORD *)v53;
  *(_OWORD *)(v56 + 48) = v57;
  *(void *)(v56 + 64) = *(void *)(v53 + 32);
  MEMORY[0x270FA5388](v56);
  sub_24F3D11C8(v53);
  uint64_t v58 = (uint64_t)v154;
  sub_24F3E34F0();
  uint64_t v59 = swift_getWitnessTable();
  long long v60 = v155;
  sub_24F3DF7B4(v58, v34, v59);
  uint64_t v61 = *(void (**)(uint64_t, uint64_t))(v167 + 8);
  v167 += 8;
  v61(v58, v34);
  sub_24F3DF7B4(v60, v34, v59);
  *(void *)&long long v180 = v169;
  *((void *)&v180 + 1) = v171;
  *(void *)&long long v181 = v165;
  *((void *)&v181 + 1) = v168;
  uint64_t v62 = v163;
  uint64_t v182 = v170;
  uint64_t v183 = v163;
  unint64_t v63 = v166;
  uint64_t v64 = v164;
  unint64_t v184 = v166;
  uint64_t v185 = v164;
  uint64_t v172 = swift_getOpaqueTypeConformance2();
  uint64_t v173 = v59;
  swift_getWitnessTable();
  uint64_t v65 = v158;
  sub_24F3D0648(v58, v34);
  v61(v58, v34);
  v61((uint64_t)v60, v34);
  uint64_t v66 = v169;
  uint64_t v67 = v165;
  uint64_t v68 = v170;
LABEL_11:
  uint64_t v125 = swift_getWitnessTable();
  *(void *)&long long v180 = v66;
  *((void *)&v180 + 1) = v171;
  *(void *)&long long v181 = v67;
  *((void *)&v181 + 1) = v168;
  uint64_t v182 = v68;
  uint64_t v183 = v62;
  unint64_t v184 = v63;
  uint64_t v185 = v64;
  uint64_t v176 = swift_getOpaqueTypeConformance2();
  uint64_t v177 = v125;
  uint64_t v126 = swift_getWitnessTable();
  uint64_t v174 = v125;
  uint64_t v175 = v126;
  uint64_t v127 = v160;
  uint64_t v128 = swift_getWitnessTable();
  sub_24F3DF7B4(v65, v127, v128);
  return (*(uint64_t (**)(char *, uint64_t))(v159 + 8))(v65, v127);
}

uint64_t sub_24F3CF098@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3CD94C(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_24F3CF0A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v57 = a4;
  uint64_t v60 = a1;
  uint64_t v71 = a5;
  uint64_t v64 = sub_24F3E3210() - 8;
  MEMORY[0x270FA5388](v64);
  unint64_t v63 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C028);
  MEMORY[0x270FA5388](v70);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreviousPlanDetail();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v58 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v56 - v14;
  uint64_t v16 = type metadata accessor for LockupView();
  uint64_t v61 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v56 - v17;
  uint64_t v66 = sub_24F3E31D0();
  uint64_t v68 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v59 = (char *)&v56 - v19;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0BFB0);
  uint64_t v62 = sub_24F3E31D0();
  uint64_t v69 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v65 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v67 = (char *)&v56 - v22;
  uint64_t v23 = v60;
  sub_24F3D1D14(v60, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  sub_24F3D1D14(v23, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  unint64_t v24 = (*(unsigned __int8 *)(v58 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v57;
  *(void *)(v25 + 16) = a3;
  *(void *)(v25 + 24) = v26;
  long long v27 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v25 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v25 + 48) = v27;
  *(void *)(v25 + 64) = *(void *)(a2 + 32);
  sub_24F3BF4A4((uint64_t)v12, v25 + v24);
  sub_24F3D11C8(a2);
  LockupView.init(planDetail:artworkViewBuilder:)((uint64_t)v15, (uint64_t)sub_24F3D1C8C, v25, (uint64_t)v18);
  sub_24F3E3540();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = v59;
  sub_24F3E3420();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v18, v16);
  uint64_t v29 = v63;
  uint64_t v30 = &v63[*(int *)(v64 + 28)];
  uint64_t v31 = *MEMORY[0x263F19860];
  uint64_t v32 = sub_24F3E3270();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #12.0 }
  *uint64_t v29 = _Q0;
  sub_24F3E3470();
  uint64_t v38 = sub_24F3E3480();
  swift_release();
  sub_24F3E31B0();
  sub_24F3D1D14((uint64_t)v29, (uint64_t)v9, MEMORY[0x263F19048]);
  uint64_t v39 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A0C030) + 36)];
  long long v40 = v77;
  *(_OWORD *)uint64_t v39 = v76;
  *((_OWORD *)v39 + 1) = v40;
  *((void *)v39 + 4) = v78;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C038);
  *(void *)&v9[*(int *)(v41 + 52)] = v38;
  *(_WORD *)&v9[*(int *)(v41 + 56)] = 256;
  uint64_t v42 = sub_24F3E3550();
  uint64_t v44 = v43;
  uint64_t v45 = (uint64_t *)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A0C040) + 36)];
  *uint64_t v45 = v42;
  v45[1] = v44;
  sub_24F3D1D7C((uint64_t)v29, MEMORY[0x263F19048]);
  sub_24F3E3550();
  uint64_t v74 = WitnessTable;
  uint64_t v75 = MEMORY[0x263F19100];
  uint64_t v46 = v66;
  uint64_t v47 = swift_getWitnessTable();
  sub_24F3C4528(&qword_269A0C048, &qword_269A0C028);
  uint64_t v48 = v65;
  sub_24F3E3440();
  sub_24F3CC980((uint64_t)v9, &qword_269A0C028);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v28, v46);
  uint64_t v49 = sub_24F3C4528(&qword_269A0BFB8, &qword_269A0BFB0);
  uint64_t v72 = v47;
  uint64_t v73 = v49;
  uint64_t v50 = v62;
  uint64_t v51 = swift_getWitnessTable();
  long long v52 = v67;
  sub_24F3DF7B4(v48, v50, v51);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v69 + 8);
  v53(v48, v50);
  sub_24F3DF7B4(v52, v50, v51);
  return ((uint64_t (*)(char *, uint64_t))v53)(v52, v50);
}

uint64_t sub_24F3CF7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v14 = *(void (**)(uint64_t, void))(v13 + 24);
  uint64_t v15 = type metadata accessor for PreviousPlanDetail();
  v14(a2 + *(int *)(v15 + 56), *(void *)(a2 + *(int *)(v15 + 60)));
  sub_24F3DF7B4(v9, a3, a4);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v9, a3);
  sub_24F3DF7B4(v12, a3, a4);
  return ((uint64_t (*)(char *, uint64_t))v16)(v12, a3);
}

uint64_t sub_24F3CF948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v67 = a5;
  uint64_t v68 = a4;
  uint64_t v70 = a3;
  uint64_t v57 = a2;
  uint64_t v6 = type metadata accessor for PreviousPlanDetail();
  uint64_t v7 = v6 - 8;
  uint64_t v58 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v59 = v8;
  uint64_t v60 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C008);
  uint64_t v65 = *(void *)(v9 - 8);
  uint64_t v66 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v72 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v63 = (char *)&v57 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v71 = (char *)&v57 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C010);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v57 - v19;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C018);
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (char *)&v57 - v23;
  sub_24F3E3170();
  uint64_t v25 = sub_24F3E3180();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  uint64_t v27 = 1;
  v26(v20, 0, 1, v25);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v70;
  uint64_t v30 = v68;
  *(void *)(v28 + 16) = v70;
  *(void *)(v28 + 24) = v30;
  long long v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v28 + 48) = v31;
  *(void *)(v28 + 64) = *(void *)(a1 + 32);
  uint64_t v73 = v29;
  uint64_t v74 = v30;
  uint64_t v75 = a1;
  sub_24F3D11C8(a1);
  uint64_t v69 = v24;
  sub_24F3E34E0();
  uint64_t v32 = *(int *)(v7 + 56);
  uint64_t v33 = v57;
  if (*(unsigned char *)(v57 + v32) == 1)
  {
    sub_24F3E3160();
    uint64_t v27 = 0;
  }
  v26(v17, v27, 1, v25);
  uint64_t v34 = v60;
  sub_24F3D1D14(v33, v60, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  unint64_t v35 = (*(unsigned __int8 *)(v58 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v70;
  uint64_t v38 = v68;
  *(void *)(v36 + 16) = v70;
  *(void *)(v36 + 24) = v38;
  long long v39 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v36 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v36 + 48) = v39;
  *(void *)(v36 + 64) = *(void *)(a1 + 32);
  uint64_t v40 = sub_24F3BF4A4(v34, v36 + v35);
  MEMORY[0x270FA5388](v40);
  *(&v57 - 4) = v37;
  *(&v57 - 3) = v38;
  *(&v57 - 2) = v33;
  *(&v57 - 1) = a1;
  sub_24F3D11C8(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BFC8);
  sub_24F3CD2D0();
  uint64_t v41 = v63;
  sub_24F3E34E0();
  uint64_t v43 = v65;
  uint64_t v42 = v66;
  uint64_t v44 = v71;
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v71, v41, v66);
  uint64_t v45 = v61;
  uint64_t v46 = v62;
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  uint64_t v48 = v64;
  v47(v61, v69, v64);
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v49(v72, v44, v42);
  uint64_t v50 = (void (*)(uint64_t, char *, uint64_t))v49;
  uint64_t v51 = v67;
  v47(v67, v45, v48);
  long long v52 = &v51[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A0C020) + 48)];
  uint64_t v53 = v72;
  v50((uint64_t)v52, v72, v42);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v43 + 8);
  v54(v71, v42);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v46 + 8);
  v55(v69, v48);
  v54(v53, v42);
  return ((uint64_t (*)(char *, uint64_t))v55)(v45, v48);
}

uint64_t sub_24F3CFF24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  uint64_t v8 = *(void *)(a1 + 32);
  type metadata accessor for PreviousPlanLockupView();
  sub_24F3CCA3C();
  swift_storeEnumTagMultiPayload();
  sub_24F3E35C0();
  swift_release();
  return sub_24F3D1D7C((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupAction);
}

uint64_t sub_24F3D001C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24F3E3120();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24F3E3680();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26B1F4E10;
  type metadata accessor for PreviousPlanLockupView();
  id v5 = v4;
  sub_24F3CCA3C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  swift_release();
  sub_24F3E36A0();
  sub_24F3C38E4();
  uint64_t result = sub_24F3E33A0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_24F3D01F4(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (void *)((char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v7 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v7;
  uint64_t v11 = *(void *)(a1 + 32);
  type metadata accessor for PreviousPlanLockupView();
  sub_24F3CCA3C();
  uint64_t v8 = a2[1];
  *uint64_t v6 = *a2;
  v6[1] = v8;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24F3E35C0();
  swift_release();
  return sub_24F3D1D7C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupAction);
}

double sub_24F3D02FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24F3E3120();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_24F3E3680();
  MEMORY[0x270FA5388](v7 - 8);
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 48)) == 1)
  {
    sub_24F3E3600();
    if (qword_26B1F3B38 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  uint64_t v8 = (void *)qword_26B1F4E10;
  long long v13 = *(_OWORD *)(a2 + 16);
  uint64_t v14 = *(void *)(a2 + 32);
  type metadata accessor for PreviousPlanLockupView();
  id v9 = v8;
  sub_24F3CCA3C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  swift_release();
  *(void *)&long long v12 = sub_24F3E36A0();
  *((void *)&v12 + 1) = v10;
  sub_24F3C38E4();
  sub_24F3E33A0();
  sub_24F3E32B0();
  double result = *(double *)&v12;
  *(_OWORD *)a3 = v12;
  *(_OWORD *)(a3 + 16) = v13;
  *(unsigned char *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_24F3D0648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3E32A0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24F3E32B0();
}

uint64_t sub_24F3D0740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24F3E32A0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24F3E32B0();
}

double sub_24F3D0838@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for PreviousPlanDetail();
  int v7 = *(unsigned __int8 *)(a1 + *(int *)(v6 + 48));
  uint64_t v8 = type metadata accessor for PreviousPlanLockupView();
  uint64_t v14 = *(void *)(a2 + 32);
  long long v13 = *(_OWORD *)(a2 + 16);
  if (v7 == 1)
  {
    *(void *)&long long v12 = sub_24F3CD33C(a1 + *(int *)(v6 + 32), v8, 63, 0xD00000000000003ELL, 0x800000024F3E7EE0);
    *((void *)&v12 + 1) = v9;
    sub_24F3C38E4();
    sub_24F3E33A0();
  }
  else
  {
    *(void *)&long long v12 = sub_24F3CD33C(a1 + *(int *)(v6 + 32), v8, 59, 0xD00000000000003ALL, 0x800000024F3E7F70);
    *((void *)&v12 + 1) = v10;
    sub_24F3C38E4();
    sub_24F3E33A0();
  }
  sub_24F3E32B0();
  double result = *(double *)&v12;
  *(_OWORD *)a3 = v12;
  *(_OWORD *)(a3 + 16) = v13;
  *(unsigned char *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_24F3D09C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for PreviousPlanLockupView();
  sub_24F3CCA3C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  swift_release();
  uint64_t v4 = type metadata accessor for RepeatReplaceAlertDetailView();
  return sub_24F3D1D14(a1, a2 + *(int *)(v4 + 20), (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
}

uint64_t sub_24F3D0A7C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v43 = a5;
  v35[1] = a4;
  uint64_t v41 = a1;
  uint64_t v47 = a6;
  uint64_t v8 = sub_24F3E3200();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v44 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PreviousPlanDetail();
  MEMORY[0x270FA5388](v10);
  long long v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a2;
  uint64_t v13 = type metadata accessor for LockupView();
  uint64_t v40 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v35 - v14;
  uint64_t v16 = sub_24F3E31D0();
  uint64_t v39 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v38 = (char *)v35 - v17;
  v35[0] = swift_getWitnessTable();
  uint64_t v50 = v35[0];
  uint64_t v51 = MEMORY[0x263F19100];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v48 = v16;
  uint64_t v49 = WitnessTable;
  uint64_t v36 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v37 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (char *)v35 - v23;
  if (qword_269A0BBB0 != -1) {
    swift_once();
  }
  uint64_t v25 = __swift_project_value_buffer(v10, (uint64_t)qword_269A0C280);
  sub_24F3D1D14(v25, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v42;
  *(void *)(v26 + 24) = a3;
  uint64_t v27 = (uint64_t)v41;
  long long v28 = v41[1];
  *(_OWORD *)(v26 + 32) = *v41;
  *(_OWORD *)(v26 + 48) = v28;
  *(void *)(v26 + 64) = *(void *)(v27 + 32);
  sub_24F3D11C8(v27);
  LockupView.init(planDetail:artworkViewBuilder:)((uint64_t)v12, v43, v26, (uint64_t)v15);
  sub_24F3E3540();
  uint64_t v29 = v38;
  sub_24F3E3420();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v13);
  uint64_t v30 = v44;
  sub_24F3E31F0();
  uint64_t v31 = v36;
  sub_24F3E3460();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v46);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v16);
  uint64_t v48 = v16;
  uint64_t v49 = v31;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_24F3DF7B4(v21, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v37 + 8);
  v33(v21, OpaqueTypeMetadata2);
  sub_24F3DF7B4(v24, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v24, OpaqueTypeMetadata2);
}

uint64_t sub_24F3D0FB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v21[1] = a4;
  uint64_t v7 = sub_24F3E3100();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v21 - v16;
  uint64_t v18 = *(void (**)(char *, void))(a1 + 24);
  sub_24F3E30F0();
  v18(v10, 0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24F3DF7B4(v14, a2, a3);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  v19(v14, a2);
  sub_24F3DF7B4(v17, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, a2);
}

uint64_t sub_24F3D119C()
{
  return swift_release();
}

uint64_t sub_24F3D11A4()
{
  return sub_24F3CFF24(v0 + 32);
}

uint64_t sub_24F3D11C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F3D1208()
{
  return swift_retain();
}

uint64_t sub_24F3D1210()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24F3D1254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24F3D125C()
{
  sub_24F3D119C();
  return swift_release();
}

uint64_t sub_24F3D12A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24F3D1208();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  return a1;
}

uint64_t sub_24F3D1304(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_24F3D1208();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24F3D119C();
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  swift_release();
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

uint64_t sub_24F3D1394(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_24F3D119C();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_24F3D13EC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24F3D1434(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PreviousPlanLockupView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F3D1494()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F3D18C8@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D0A7C(*(_OWORD **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_2700CA2B8, (uint64_t)sub_24F3D1E24, a1);
}

uint64_t sub_24F3D1908()
{
  return sub_24F3CFF24(v0 + 32);
}

uint64_t sub_24F3D192C@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3CF0A4(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_24F3D1938@<X0>(char *a1@<X8>)
{
  return sub_24F3CF948(v1[4], v1[5], v1[2], v1[3], a1);
}

double sub_24F3D1944@<D0>(uint64_t a1@<X8>)
{
  return sub_24F3D0838(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_24F3D1950@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D09C8(*(void *)(v1 + 40), a1);
}

uint64_t sub_24F3D1960@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D0A7C(*(_OWORD **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_2700CA218, (uint64_t)sub_24F3D19D8, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24F3D19D8@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D0FB4(v1 + 32, *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_24F3D19F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F3D1A44()
{
  return sub_24F3CFF24(v0 + 32);
}

uint64_t sub_24F3D1A68@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D001C(a1);
}

uint64_t sub_24F3D1A78()
{
  uint64_t v1 = *(void *)(type metadata accessor for PreviousPlanDetail() - 8);
  unint64_t v2 = (void *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return sub_24F3D01F4(v0 + 32, v2);
}

double sub_24F3D1AF8@<D0>(uint64_t a1@<X8>)
{
  return sub_24F3D02FC(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t objectdestroy_28Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for PreviousPlanDetail() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  sub_24F3D119C();
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + v1[10];
  uint64_t v8 = sub_24F3E30D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v6 + v1[16];
  uint64_t v10 = sub_24F3E3100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24F3D1C8C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(type metadata accessor for PreviousPlanDetail() - 8);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_24F3CF7F4(v0 + 32, v4, v1, v2);
}

uint64_t sub_24F3D1D14(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F3D1D7C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_2Tm()
{
  sub_24F3D119C();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t CreateWorkoutPlanButtonView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = sub_24F3CCB78;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_24F3D1E8C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t CreateWorkoutPlanButtonView.body.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  char v3 = *((unsigned char *)v0 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v3;
  sub_24F3D1208();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3AF8);
  sub_24F3C4528(&qword_26B1F3AF0, &qword_26B1F3AF8);
  return sub_24F3E34F0();
}

uint64_t sub_24F3D1FB4()
{
  return swift_release();
}

uint64_t sub_24F3D2080()
{
  return sub_24F3D1FB4();
}

uint64_t sub_24F3D2090()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24F3D20AC@<X0>(uint64_t a1@<X8>)
{
  sub_24F3D1208();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B30);
  sub_24F3C4528(&qword_26B1F3B28, &qword_26B1F3B30);
  sub_24F3E31A0();
  sub_24F3D119C();
  swift_getKeyPath();
  sub_24F3E35B0();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_24F3D21A0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  char v3 = *((unsigned char *)v0 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v2;
  *(unsigned char *)(v4 + 32) = v3;
  sub_24F3D1208();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3AF8);
  sub_24F3C4528(&qword_26B1F3AF0, &qword_26B1F3AF8);
  return sub_24F3E34F0();
}

uint64_t destroy for CreateWorkoutPlanButtonView()
{
  return sub_24F3D119C();
}

uint64_t _s18FitnessWorkoutPlan27CreateWorkoutPlanButtonViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24F3D1208();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CreateWorkoutPlanButtonView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24F3D1208();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24F3D119C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CreateWorkoutPlanButtonView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24F3D119C();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonView()
{
  return &type metadata for CreateWorkoutPlanButtonView;
}

uint64_t sub_24F3D2440()
{
  return sub_24F3C4528(&qword_26B1F3B00, &qword_26B1F3B08);
}

uint64_t objectdestroy_2Tm_0()
{
  sub_24F3D119C();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_24F3D24BC()
{
  return sub_24F3E34D0();
}

uint64_t sub_24F3D253C@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3D20AC(a1);
}

uint64_t CreateWorkoutPlanHandoffAlertState.iconState.getter()
{
  return *v0;
}

uint64_t CreateWorkoutPlanHandoffAlertState.iconState.setter(uint64_t result)
{
  unsigned char *v1 = result & 1;
  return result;
}

uint64_t (*CreateWorkoutPlanHandoffAlertState.iconState.modify())()
{
  return nullsub_1;
}

uint64_t CreateWorkoutPlanHandoffAlertState.isPresentingAlert.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t CreateWorkoutPlanHandoffAlertState.isPresentingAlert.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*CreateWorkoutPlanHandoffAlertState.isPresentingAlert.modify())()
{
  return nullsub_1;
}

FitnessWorkoutPlan::CreateWorkoutPlanHandoffAlertState __swiftcall CreateWorkoutPlanHandoffAlertState.init(iconState:isPresentingAlert:)(FitnessWorkoutPlan::HandoffAlertIconState iconState, Swift::Bool isPresentingAlert)
{
  *uint64_t v2 = iconState & 1;
  v2[1] = isPresentingAlert;
  result.iconuint64_t State = iconState;
  return result;
}

uint64_t sub_24F3D25C0()
{
  if (*v0) {
    return 0xD000000000000011;
  }
  else {
    return 0x746174536E6F6369;
  }
}

uint64_t sub_24F3D2604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3D2F00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3D262C(uint64_t a1)
{
  unint64_t v2 = sub_24F3D2824();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D2668(uint64_t a1)
{
  unint64_t v2 = sub_24F3D2824();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CreateWorkoutPlanHandoffAlertState.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C050);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  int v11 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3D2824();
  sub_24F3E3920();
  char v14 = v8;
  char v13 = 0;
  sub_24F3D2878();
  sub_24F3E38A0();
  if (!v2)
  {
    char v12 = 1;
    sub_24F3E3880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24F3D2824()
{
  unint64_t result = qword_269A0C058;
  if (!qword_269A0C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C058);
  }
  return result;
}

unint64_t sub_24F3D2878()
{
  unint64_t result = qword_269A0C060;
  if (!qword_269A0C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C060);
  }
  return result;
}

uint64_t CreateWorkoutPlanHandoffAlertState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C068);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3D2824();
  sub_24F3E3910();
  if (!v2)
  {
    char v14 = 0;
    sub_24F3D2A88();
    sub_24F3E3830();
    char v9 = v15;
    char v13 = 1;
    char v10 = sub_24F3E3810();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24F3D2A88()
{
  unint64_t result = qword_269A0C070;
  if (!qword_269A0C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C070);
  }
  return result;
}

uint64_t sub_24F3D2ADC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CreateWorkoutPlanHandoffAlertState.init(from:)(a1, a2);
}

uint64_t sub_24F3D2AF4(void *a1)
{
  return CreateWorkoutPlanHandoffAlertState.encode(to:)(a1);
}

BOOL static CreateWorkoutPlanHandoffAlertState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

BOOL sub_24F3D2B34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F3D2CBCLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanHandoffAlertState()
{
  return &type metadata for CreateWorkoutPlanHandoffAlertState;
}

unsigned char *storeEnumTagSinglePayload for CreateWorkoutPlanHandoffAlertState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3D2DC0);
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

ValueMetadata *type metadata accessor for CreateWorkoutPlanHandoffAlertState.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanHandoffAlertState.CodingKeys;
}

unint64_t sub_24F3D2DFC()
{
  unint64_t result = qword_269A0C078;
  if (!qword_269A0C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C078);
  }
  return result;
}

unint64_t sub_24F3D2E54()
{
  unint64_t result = qword_269A0C080;
  if (!qword_269A0C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C080);
  }
  return result;
}

unint64_t sub_24F3D2EAC()
{
  unint64_t result = qword_269A0C088;
  if (!qword_269A0C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C088);
  }
  return result;
}

uint64_t sub_24F3D2F00(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746174536E6F6369 && a2 == 0xE900000000000065;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F3E7FB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F3D2FFC()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24F3E38D0();
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_24F3E38E0();
      break;
    default:
      sub_24F3E38E0();
      sub_24F3E36B0();
      break;
  }
  return sub_24F3E3900();
}

uint64_t sub_24F3D30CC()
{
  switch(*(void *)(v0 + 8))
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t result = sub_24F3E38E0();
      break;
    default:
      sub_24F3E38E0();
      uint64_t result = sub_24F3E36B0();
      break;
  }
  return result;
}

uint64_t sub_24F3D3194()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24F3E38D0();
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_24F3E38E0();
      break;
    default:
      sub_24F3E38E0();
      sub_24F3E36B0();
      break;
  }
  return sub_24F3E3900();
}

uint64_t sub_24F3D3260(uint64_t *a1, uint64_t a2)
{
  return sub_24F3D57F8(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

__n128 PreviousPlanLockupFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v4;
  return result;
}

uint64_t PreviousPlanLockupFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, char **a3, uint64_t a4)
{
  uint64_t v98 = a3;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BEC0);
  uint64_t v7 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  char v9 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v83 - v11;
  MEMORY[0x270FA5388](v13);
  char v15 = (char *)&v83 - v14;
  uint64_t State = type metadata accessor for PreviousPlanLockupLoadState();
  MEMORY[0x270FA5388](State - 8);
  uint64_t v18 = (char *)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t *)((char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v22 = v4[1];
  long long v100 = *v4;
  long long v101 = v22;
  long long v23 = v4[3];
  long long v102 = v4[2];
  long long v103 = v23;
  sub_24F3D5954(a4, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupAction);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v27 = *v21;
      uint64_t v28 = v21[1];
      uint64_t v29 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B40);
      uint64_t v30 = &v9[v29[16]];
      uint64_t v31 = &v9[v29[20]];
      uint64_t v32 = &v9[v29[24]];
      sub_24F3D3C48();
      long long v99 = 0uLL;
      sub_24F3E3790();
      uint64_t v33 = swift_allocObject();
      long long v34 = v101;
      *(_OWORD *)(v33 + 16) = v100;
      *(_OWORD *)(v33 + 32) = v34;
      long long v35 = v103;
      *(_OWORD *)(v33 + 48) = v102;
      *(_OWORD *)(v33 + 64) = v35;
      *(void *)(v33 + 80) = v27;
      *(void *)(v33 + 88) = v28;
      *(void *)uint64_t v32 = &unk_269A0C0A0;
      *((void *)v32 + 1) = v33;
      sub_24F3D51E8((uint64_t)&v100);
      sub_24F3E3740();
      uint64_t v36 = *MEMORY[0x263F39588];
      uint64_t v37 = sub_24F3E35A0();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v30, v36, v37);
      uint64_t v38 = *MEMORY[0x263F39578];
      uint64_t v39 = sub_24F3E3590();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v31, v38, v39);
      uint64_t v40 = v97;
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F39530], v97);
      uint64_t v41 = v98;
      uint64_t v42 = *v98;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v42 = (char *)sub_24F3C8B64(0, *((void *)v42 + 2) + 1, 1, v42);
      }
      unint64_t v44 = *((void *)v42 + 2);
      unint64_t v43 = *((void *)v42 + 3);
      if (v44 >= v43 >> 1) {
        uint64_t v42 = (char *)sub_24F3C8B64(v43 > 1, v44 + 1, 1, v42);
      }
      *((void *)v42 + 2) = v44 + 1;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v42[((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v44], v9, v40);
      *uint64_t v41 = v42;
      goto LABEL_8;
    case 2u:
      uint64_t v45 = type metadata accessor for PreviousPlanLockupState();
      uint64_t v46 = (uint64_t *)(a2 + *(int *)(v45 + 20));
      uint64_t v48 = *v46;
      uint64_t v47 = v46[1];
      uint64_t v49 = a2 + *(int *)(v45 + 24);
      sub_24F3D5954(v49, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
      uint64_t v51 = *(void *)(v50 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v18, 2, v50) == 1)
      {
        swift_bridgeObjectRetain();
        sub_24F3D59BC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
        sub_24F3D59BC(v49, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56))(v49, 2, 2, v50);
        long long v52 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B40);
        uint64_t v53 = &v15[v52[16]];
        uint64_t v93 = &v15[v52[20]];
        uint64_t v54 = &v15[v52[24]];
        *(void *)&long long v99 = v48;
        *((void *)&v99 + 1) = v47;
        unint64_t v55 = sub_24F3D3C48();
        swift_bridgeObjectRetain();
        unint64_t v94 = v55;
        sub_24F3E3790();
        sub_24F3E3740();
        uint64_t v56 = swift_allocObject();
        long long v57 = v101;
        *(_OWORD *)(v56 + 16) = v100;
        *(_OWORD *)(v56 + 32) = v57;
        long long v58 = v103;
        *(_OWORD *)(v56 + 48) = v102;
        *(_OWORD *)(v56 + 64) = v58;
        uint64_t v95 = v48;
        *(void *)(v56 + 80) = v48;
        *(void *)(v56 + 88) = v47;
        *(void *)uint64_t v54 = &unk_269A0C0B0;
        *((void *)v54 + 1) = v56;
        uint64_t v59 = *MEMORY[0x263F39588];
        uint64_t v60 = sub_24F3E35A0();
        uint64_t v61 = *(void *)(v60 - 8);
        long long v90 = *(void (**)(char *, void))(v61 + 104);
        uint64_t v91 = v60;
        uint64_t v89 = v61 + 104;
        v90(v53, v59);
        uint64_t v62 = *MEMORY[0x263F39578];
        uint64_t v63 = sub_24F3E3590();
        uint64_t v64 = *(void *)(v63 - 8);
        uint64_t v87 = *(void (**)(char *, void, uint64_t))(v64 + 104);
        uint64_t v86 = v64 + 104;
        v87(v93, v62, v63);
        uint64_t v65 = *(void (**)(void))(v7 + 104);
        LODWORD(v93) = *MEMORY[0x263F39530];
        uint64_t v92 = (void (*)(char *, void, uint64_t))v65;
        v65(v15);
        uint64_t v66 = *v98;
        swift_bridgeObjectRetain();
        sub_24F3D51E8((uint64_t)&v100);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v66 = (char *)sub_24F3C8B64(0, *((void *)v66 + 2) + 1, 1, v66);
        }
        unint64_t v68 = *((void *)v66 + 2);
        unint64_t v67 = *((void *)v66 + 3);
        uint64_t v96 = v47;
        if (v68 >= v67 >> 1) {
          uint64_t v66 = (char *)sub_24F3C8B64(v67 > 1, v68 + 1, 1, v66);
        }
        *((void *)v66 + 2) = v68 + 1;
        uint64_t v70 = *(uint64_t (**)(char *, char *, uint64_t))(v7 + 32);
        uint64_t v69 = v7 + 32;
        unint64_t v85 = (*(unsigned __int8 *)(v69 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 48);
        uint64_t v84 = *(void *)(v69 + 40);
        uint64_t v71 = v97;
        uint64_t v88 = v70;
        v70(&v66[v85 + v84 * v68], v15, v97);
        uint64_t v72 = v98;
        *uint64_t v98 = v66;
        uint64_t v73 = &v12[v52[16]];
        uint64_t v74 = &v12[v52[20]];
        uint64_t v75 = &v12[v52[24]];
        long long v99 = xmmword_24F3E5AA0;
        sub_24F3E3790();
        sub_24F3E3740();
        ((void (*)(char *, void, uint64_t))v90)(v73, *MEMORY[0x263F39590], v91);
        v87(v74, *MEMORY[0x263F39570], v63);
        uint64_t v76 = swift_allocObject();
        long long v77 = v101;
        *(_OWORD *)(v76 + 16) = v100;
        *(_OWORD *)(v76 + 32) = v77;
        long long v78 = v103;
        *(_OWORD *)(v76 + 48) = v102;
        *(_OWORD *)(v76 + 64) = v78;
        uint64_t v79 = v96;
        *(void *)(v76 + 80) = v95;
        *(void *)(v76 + 88) = v79;
        *(void *)uint64_t v75 = &unk_269A0C0C0;
        *((void *)v75 + 1) = v76;
        v92(v12, v93, v71);
        uint64_t v80 = *v72;
        sub_24F3D51E8((uint64_t)&v100);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v80 = (char *)sub_24F3C8B64(0, *((void *)v80 + 2) + 1, 1, v80);
        }
        unint64_t v82 = *((void *)v80 + 2);
        unint64_t v81 = *((void *)v80 + 3);
        if (v82 >= v81 >> 1) {
          uint64_t v80 = (char *)sub_24F3C8B64(v81 > 1, v82 + 1, 1, v80);
        }
        *((void *)v80 + 2) = v82 + 1;
        uint64_t result = v88(&v80[v85 + v82 * v84], v12, v71);
        *uint64_t v72 = v80;
      }
      else
      {
        uint64_t result = sub_24F3D59BC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
      }
      break;
    case 3u:
      uint64_t result = type metadata accessor for PreviousPlanLockupState();
      *(unsigned char *)(a2 + *(int *)(result + 28)) = 1;
      break;
    case 4u:
LABEL_8:
      uint64_t result = type metadata accessor for PreviousPlanLockupState();
      *(unsigned char *)(a2 + *(int *)(result + 28)) = 0;
      break;
    default:
      uint64_t v24 = a2 + *(int *)(type metadata accessor for PreviousPlanLockupState() + 24);
      sub_24F3D59BC(v24, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupLoadState);
      sub_24F3CA620((uint64_t)v21, v24);
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 2, v25);
      break;
  }
  return result;
}

unint64_t sub_24F3D3C48()
{
  unint64_t result = qword_269A0C090;
  if (!qword_269A0C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A0C090);
  }
  return result;
}

uint64_t sub_24F3D3C9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = type metadata accessor for PreviousPlanLockupAction();
  v4[4] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for PreviousPlanDetail();
  v4[5] = v8;
  v4[6] = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  v4[7] = v9;
  v4[8] = sub_24F3E3730();
  v4[9] = sub_24F3E3720();
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*a2 + *(int *)*a2);
  uint64_t v10 = (void *)swift_task_alloc();
  v4[10] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_24F3D3E3C;
  return v12(v9, a3, a4);
}

uint64_t sub_24F3D3E3C()
{
  long long v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F3E3700();
  v2[12] = v4;
  v2[13] = v3;
  if (v0) {
    uint64_t v5 = sub_24F3D4298;
  }
  else {
    uint64_t v5 = sub_24F3D3F9C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3D3F9C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  sub_24F3D5954(v0[7], v2, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v2, 0, 1, v3);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[14] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C0E8);
  *uint64_t v4 = v0;
  v4[1] = sub_24F3D40A8;
  uint64_t v6 = v0[4];
  return MEMORY[0x270F252C8](v6, v5);
}

uint64_t sub_24F3D40A8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24F3D59BC(v2, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupAction);
  uint64_t v3 = *(void *)(v1 + 104);
  uint64_t v4 = *(void *)(v1 + 96);
  return MEMORY[0x270FA2498](sub_24F3D4200, v4, v3);
}

uint64_t sub_24F3D4200()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  sub_24F3D59BC(v1, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24F3D4298()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3D4314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 112) = a4;
  *(void *)(v4 + 96) = a1;
  *(void *)(v4 + 104) = a3;
  *(void *)(v4 + 120) = type metadata accessor for PreviousPlanLockupAction();
  *(void *)(v4 + 128) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for PreviousPlanDetail();
  *(void *)(v4 + 136) = v6;
  *(void *)(v4 + 144) = *(void *)(v6 - 8);
  *(void *)(v4 + 152) = swift_task_alloc();
  *(void *)(v4 + 160) = sub_24F3E3730();
  *(void *)(v4 + 168) = sub_24F3E3720();
  *(_OWORD *)(v4 + 176) = *(_OWORD *)a2;
  uint64_t v9 = (uint64_t (*)(uint64_t))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 192) = v7;
  void *v7 = v4;
  v7[1] = sub_24F3D44AC;
  return v9(v4 + 56);
}

uint64_t sub_24F3D44AC()
{
  uint64_t v2 = (void *)*v1;
  v2[25] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F3E3700();
  v2[26] = v4;
  v2[27] = v3;
  if (v0) {
    uint64_t v5 = sub_24F3D4F38;
  }
  else {
    uint64_t v5 = sub_24F3D460C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3D460C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F3E3770();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F3E3720();
  v0[28] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[29] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24F3D47FC;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 33, v5, v7);
}

uint64_t sub_24F3D47FC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 216);
  uint64_t v3 = *(void *)(v1 + 208);
  return MEMORY[0x270FA2498](sub_24F3D4940, v3, v2);
}

uint64_t sub_24F3D4940()
{
  if (*(unsigned char *)(v0 + 264) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 176) + **(int **)(v0 + 176));
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24F3D4A90;
    uint64_t v4 = *(void *)(v0 + 152);
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    return v7(v4, v5, v6);
  }
}

uint64_t sub_24F3D4A90()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 248) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 216);
  uint64_t v4 = *(void *)(v2 + 208);
  if (v0) {
    uint64_t v5 = sub_24F3D4FB0;
  }
  else {
    uint64_t v5 = sub_24F3D4BCC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3D4BCC()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  sub_24F3D5954(v0[19], v2, (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v2, 0, 1, v3);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[32] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C0E8);
  *uint64_t v4 = v0;
  v4[1] = sub_24F3D4CD8;
  uint64_t v6 = v0[16];
  return MEMORY[0x270F252C8](v6, v5);
}

uint64_t sub_24F3D4CD8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 128);
  swift_task_dealloc();
  sub_24F3D59BC(v2, (uint64_t (*)(void))type metadata accessor for PreviousPlanLockupAction);
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 208);
  return MEMORY[0x270FA2498](sub_24F3D4E30, v4, v3);
}

uint64_t sub_24F3D4E30()
{
  sub_24F3D59BC(v0[19], (uint64_t (*)(void))type metadata accessor for PreviousPlanDetail);
  uint64_t v1 = sub_24F3E3720();
  v0[28] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[29] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F3D47FC;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 33, v1, v3);
}

uint64_t sub_24F3D4F38()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3D4FB0()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3D5034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_24F3E3730();
  v4[3] = sub_24F3E3720();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v8 = (void *)swift_task_alloc();
  v4[4] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24F3C83B4;
  return v10(a3, a4);
}

uint64_t sub_24F3D5138(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 80);
  uint64_t v5 = *(void *)(v1 + 88);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F3C8D60;
  return sub_24F3D5034(a1, v4, v6, v5);
}

uint64_t sub_24F3D51E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F3D524C(uint64_t a1)
{
  uint64_t v4 = v1 + 2;
  uint64_t v6 = v1[10];
  uint64_t v5 = v1[11];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F3C8D60;
  return sub_24F3D3C9C(a1, v4, v6, v5);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_24F3D5358(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 80);
  uint64_t v5 = *(void *)(v1 + 88);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F3C8698;
  return sub_24F3D4314(a1, v4, v6, v5);
}

uint64_t sub_24F3D5408()
{
  return sub_24F3D54E0(&qword_269A0C0C8, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupAction);
}

uint64_t sub_24F3D5450()
{
  return sub_24F3D54E0(&qword_269A0C0D0, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupAction);
}

uint64_t sub_24F3D5498()
{
  return sub_24F3D54E0(&qword_269A0C0D8, (void (*)(uint64_t))type metadata accessor for PreviousPlanLockupState);
}

uint64_t sub_24F3D54E0(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for PreviousPlanLockupFeature()
{
  return &type metadata for PreviousPlanLockupFeature;
}

unint64_t destroy for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18FitnessWorkoutPlan25PreviousPlanLockupFeatureV14TaskIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for PreviousPlanLockupFeature.TaskIdentifier(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupFeature.TaskIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupFeature.TaskIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_24F3D5758(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24F3D5770(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupFeature.TaskIdentifier()
{
  return &type metadata for PreviousPlanLockupFeature.TaskIdentifier;
}

unint64_t sub_24F3D57A4()
{
  unint64_t result = qword_269A0C0E0;
  if (!qword_269A0C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C0E0);
  }
  return result;
}

uint64_t sub_24F3D57F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      if (a4) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a4 != 1) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_14;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4 < 4)
      {
LABEL_14:
        uint64_t result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = sub_24F3E38C0();
      }
      break;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24F3D5954(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F3D59BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24F3D5A1C(char a1)
{
  unint64_t result = 0x6570704177656976;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0x72656C4165646968;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F3D5AC4()
{
  return sub_24F3D5A1C(*v0);
}

uint64_t sub_24F3D5ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3D8A1C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3D5AF4(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24F3D5B00(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6580();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5B3C(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6580();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3D5B78(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6638();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5BB4(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6638();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3D5BF8(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6734();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5C34(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6734();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3D5C70(uint64_t a1)
{
  unint64_t v2 = sub_24F3D668C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5CAC(uint64_t a1)
{
  unint64_t v2 = sub_24F3D668C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3D5CE8()
{
  return 0x696669746E656469;
}

uint64_t sub_24F3D5D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F3D5DA8(uint64_t a1)
{
  unint64_t v2 = sub_24F3D66E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5DE4(uint64_t a1)
{
  unint64_t v2 = sub_24F3D66E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3D5E20(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6788();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3D5E5C(uint64_t a1)
{
  unint64_t v2 = sub_24F3D6788();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PreviousPlanLockupAction.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C0F0);
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C0F8);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C100);
  uint64_t v38 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  MEMORY[0x270FA5388](v6);
  long long v34 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C108);
  uint64_t v35 = *(void *)(v8 - 8);
  uint64_t v36 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v33 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v32 = (uint64_t)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C110);
  uint64_t v31 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C118);
  uint64_t v46 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3D6580();
  sub_24F3E3920();
  sub_24F3D65D4(v45, (uint64_t)v17);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v49 = 2;
      sub_24F3D66E0();
      uint64_t v24 = v34;
      sub_24F3E3850();
      uint64_t v25 = v39;
      sub_24F3E3870();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v25);
      break;
    case 2u:
      char v47 = 0;
      sub_24F3D6788();
      sub_24F3E3850();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v12);
      break;
    case 3u:
      char v50 = 3;
      sub_24F3D668C();
      uint64_t v26 = v37;
      sub_24F3E3850();
      uint64_t v28 = v40;
      uint64_t v27 = v41;
      goto LABEL_8;
    case 4u:
      char v51 = 4;
      sub_24F3D6638();
      uint64_t v26 = v42;
      sub_24F3E3850();
      uint64_t v28 = v43;
      uint64_t v27 = v44;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
      break;
    default:
      uint64_t v21 = v32;
      sub_24F3CA620((uint64_t)v17, v32);
      char v48 = 1;
      sub_24F3D6734();
      long long v22 = v33;
      sub_24F3E3850();
      type metadata accessor for PreviousPlanDetail();
      sub_24F3D71C8(&qword_269A0BF08);
      uint64_t v23 = v36;
      sub_24F3E3860();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v23);
      sub_24F3C6750(v21);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v20, v18);
}

uint64_t type metadata accessor for PreviousPlanLockupAction()
{
  uint64_t result = qword_269A0C180;
  if (!qword_269A0C180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F3D6580()
{
  unint64_t result = qword_269A0C120;
  if (!qword_269A0C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C120);
  }
  return result;
}

uint64_t sub_24F3D65D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F3D6638()
{
  unint64_t result = qword_269A0C128;
  if (!qword_269A0C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C128);
  }
  return result;
}

unint64_t sub_24F3D668C()
{
  unint64_t result = qword_269A0C130;
  if (!qword_269A0C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C130);
  }
  return result;
}

unint64_t sub_24F3D66E0()
{
  unint64_t result = qword_269A0C138;
  if (!qword_269A0C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C138);
  }
  return result;
}

unint64_t sub_24F3D6734()
{
  unint64_t result = qword_269A0C140;
  if (!qword_269A0C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C140);
  }
  return result;
}

unint64_t sub_24F3D6788()
{
  unint64_t result = qword_269A0C148;
  if (!qword_269A0C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C148);
  }
  return result;
}

uint64_t PreviousPlanLockupAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C150);
  uint64_t v58 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v69 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C158);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  unint64_t v68 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C160);
  uint64_t v62 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v64 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C168);
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v65 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C170);
  uint64_t v54 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v63 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C178);
  uint64_t v66 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PreviousPlanLockupAction();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v50 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v50 - v19;
  uint64_t v21 = a1[3];
  uint64_t v71 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_24F3D6580();
  uint64_t v22 = v72;
  sub_24F3E3910();
  if (v22) {
    goto LABEL_10;
  }
  char v51 = v14;
  long long v52 = v17;
  uint64_t v53 = v20;
  uint64_t v24 = v67;
  uint64_t v23 = v68;
  uint64_t v72 = v12;
  uint64_t v25 = v69;
  uint64_t v26 = v70;
  uint64_t v27 = sub_24F3E3840();
  uint64_t v28 = (char *)v27;
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v31 = sub_24F3E37C0();
    swift_allocError();
    uint64_t v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    *uint64_t v33 = v72;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, *MEMORY[0x263F8DCB0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v11, v9);
LABEL_10:
    uint64_t v45 = (uint64_t)v71;
    return __swift_destroy_boxed_opaque_existential_1(v45);
  }
  switch(*(unsigned char *)(v27 + 32))
  {
    case 1:
      char v74 = 1;
      sub_24F3D6734();
      long long v34 = v65;
      uint64_t v35 = v11;
      sub_24F3E37D0();
      type metadata accessor for PreviousPlanDetail();
      uint64_t v69 = v28;
      sub_24F3D71C8(&qword_269A0BF40);
      uint64_t v43 = (uint64_t)v52;
      uint64_t v44 = v56;
      sub_24F3E37F0();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v44);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v35, v9);
      uint64_t v45 = (uint64_t)v71;
      swift_storeEnumTagMultiPayload();
      uint64_t v30 = (uint64_t)v53;
      sub_24F3D7164(v43, (uint64_t)v53);
      goto LABEL_14;
    case 2:
      char v75 = 2;
      sub_24F3D66E0();
      uint64_t v36 = v64;
      sub_24F3E37D0();
      uint64_t v37 = v9;
      uint64_t v38 = v36;
      uint64_t v39 = v60;
      uint64_t v40 = sub_24F3E3800();
      uint64_t v41 = v66;
      uint64_t v47 = v46;
      char v48 = *(void (**)(char *, uint64_t))(v62 + 8);
      uint64_t v69 = (char *)v40;
      v48(v38, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v37);
      uint64_t v49 = (uint64_t)v51;
      *char v51 = v69;
      *(void *)(v49 + 8) = v47;
      swift_storeEnumTagMultiPayload();
      uint64_t v30 = (uint64_t)v53;
      sub_24F3D7164(v49, (uint64_t)v53);
      goto LABEL_13;
    case 3:
      char v76 = 3;
      sub_24F3D668C();
      sub_24F3E37D0();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v23, v59);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v11, v9);
      uint64_t v30 = (uint64_t)v53;
      goto LABEL_12;
    case 4:
      char v77 = 4;
      sub_24F3D6638();
      sub_24F3E37D0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v25, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v11, v9);
      uint64_t v30 = (uint64_t)v53;
      goto LABEL_12;
    default:
      char v73 = 0;
      sub_24F3D6788();
      uint64_t v29 = v63;
      sub_24F3E37D0();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v29, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v11, v9);
      uint64_t v30 = (uint64_t)v53;
LABEL_12:
      swift_storeEnumTagMultiPayload();
LABEL_13:
      uint64_t v45 = (uint64_t)v71;
LABEL_14:
      sub_24F3D7164(v30, v26);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v45);
}

uint64_t sub_24F3D7164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3D71C8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PreviousPlanDetail();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F3D720C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanLockupAction.init(from:)(a1, a2);
}

uint64_t sub_24F3D7224(void *a1)
{
  return PreviousPlanLockupAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviousPlanLockupAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v9 = *((void *)v8 - 1);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        uint64_t v28 = v9;
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        uint64_t v14 = a2[3];
        a1[2] = a2[2];
        a1[3] = v14;
        uint64_t v15 = a2[5];
        a1[4] = a2[4];
        a1[5] = v15;
        uint64_t v16 = a2[7];
        a1[6] = a2[6];
        a1[7] = v16;
        uint64_t v17 = v8[8];
        uint64_t v24 = (char *)a2 + v17;
        uint64_t v26 = (char *)a1 + v17;
        uint64_t v18 = sub_24F3E30D0();
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23(v26, v24, v18);
        *(uint64_t *)((char *)a1 + v8[9]) = *(uint64_t *)((char *)a2 + v8[9]);
        *(uint64_t *)((char *)a1 + v8[10]) = *(uint64_t *)((char *)a2 + v8[10]);
        *(uint64_t *)((char *)a1 + v8[11]) = *(uint64_t *)((char *)a2 + v8[11]);
        *((unsigned char *)a1 + v8[12]) = *((unsigned char *)a2 + v8[12]);
        *(uint64_t *)((char *)a1 + v8[13]) = *(uint64_t *)((char *)a2 + v8[13]);
        uint64_t v19 = v8[14];
        uint64_t v25 = (char *)a2 + v19;
        uint64_t v27 = (char *)a1 + v19;
        uint64_t v20 = sub_24F3E3100();
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v21(v27, v25, v20);
        *(uint64_t *)((char *)a1 + v8[15]) = *(uint64_t *)((char *)a2 + v8[15]);
        (*(void (**)(uint64_t *, void, uint64_t, int *))(v28 + 56))(a1, 0, 1, v8);
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t destroy for PreviousPlanLockupAction(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = type metadata accessor for PreviousPlanDetail();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(a1, 1, v3);
    if (!result)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = a1 + *(int *)(v3 + 32);
      uint64_t v5 = sub_24F3E30D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = a1 + *(int *)(v3 + 56);
      uint64_t v7 = sub_24F3E3100();
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      return v8(v6, v7);
    }
  }
  return result;
}

void *initializeWithCopy for PreviousPlanLockupAction(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v26 = v8;
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      uint64_t v12 = a2[3];
      a1[2] = a2[2];
      a1[3] = v12;
      uint64_t v13 = a2[5];
      a1[4] = a2[4];
      a1[5] = v13;
      uint64_t v14 = a2[7];
      a1[6] = a2[6];
      a1[7] = v14;
      uint64_t v15 = v7[8];
      uint64_t v22 = (char *)a2 + v15;
      uint64_t v24 = (char *)a1 + v15;
      uint64_t v16 = sub_24F3E30D0();
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v21(v24, v22, v16);
      *(void *)((char *)a1 + v7[9]) = *(void *)((char *)a2 + v7[9]);
      *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
      *(void *)((char *)a1 + v7[11]) = *(void *)((char *)a2 + v7[11]);
      *((unsigned char *)a1 + v7[12]) = *((unsigned char *)a2 + v7[12]);
      *(void *)((char *)a1 + v7[13]) = *(void *)((char *)a2 + v7[13]);
      uint64_t v17 = v7[14];
      uint64_t v23 = (char *)a2 + v17;
      uint64_t v25 = (char *)a1 + v17;
      uint64_t v18 = sub_24F3E3100();
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19(v25, v23, v18);
      *(void *)((char *)a1 + v7[15]) = *(void *)((char *)a2 + v7[15]);
      (*(void (**)(void *, void, uint64_t, int *))(v26 + 56))(a1, 0, 1, v7);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for PreviousPlanLockupAction(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F3D7C84((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v8 = *((void *)v7 - 1);
      if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        a1[7] = a2[7];
        uint64_t v10 = v7[8];
        uint64_t v17 = (char *)a2 + v10;
        uint64_t v19 = (char *)a1 + v10;
        uint64_t v11 = sub_24F3E30D0();
        uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v16(v19, v17, v11);
        *(void *)((char *)a1 + v7[9]) = *(void *)((char *)a2 + v7[9]);
        *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
        *(void *)((char *)a1 + v7[11]) = *(void *)((char *)a2 + v7[11]);
        *((unsigned char *)a1 + v7[12]) = *((unsigned char *)a2 + v7[12]);
        *(void *)((char *)a1 + v7[13]) = *(void *)((char *)a2 + v7[13]);
        uint64_t v12 = v7[14];
        uint64_t v18 = (char *)a2 + v12;
        uint64_t v20 = (char *)a1 + v12;
        uint64_t v13 = sub_24F3E3100();
        uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v14(v20, v18, v13);
        *(void *)((char *)a1 + v7[15]) = *(void *)((char *)a2 + v7[15]);
        (*(void (**)(void *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24F3D7C84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviousPlanLockupAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanLockupAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v7 = *((void *)v6 - 1);
    if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      long long v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      long long v10 = a2[3];
      a1[2] = a2[2];
      a1[3] = v10;
      uint64_t v11 = v6[8];
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_24F3E30D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      *(void *)((char *)a1 + v6[9]) = *(void *)((char *)a2 + v6[9]);
      *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
      *(void *)((char *)a1 + v6[11]) = *(void *)((char *)a2 + v6[11]);
      *((unsigned char *)a1 + v6[12]) = *((unsigned char *)a2 + v6[12]);
      *(void *)((char *)a1 + v6[13]) = *(void *)((char *)a2 + v6[13]);
      uint64_t v15 = v6[14];
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_24F3E3100();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      *(void *)((char *)a1 + v6[15]) = *(void *)((char *)a2 + v6[15]);
      (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for PreviousPlanLockupAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F3D7C84((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = (int *)type metadata accessor for PreviousPlanDetail();
      uint64_t v7 = *((void *)v6 - 1);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BE50);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        long long v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        long long v10 = a2[3];
        a1[2] = a2[2];
        a1[3] = v10;
        uint64_t v11 = v6[8];
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_24F3E30D0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
        *(void *)((char *)a1 + v6[9]) = *(void *)((char *)a2 + v6[9]);
        *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
        *(void *)((char *)a1 + v6[11]) = *(void *)((char *)a2 + v6[11]);
        *((unsigned char *)a1 + v6[12]) = *((unsigned char *)a2 + v6[12]);
        *(void *)((char *)a1 + v6[13]) = *(void *)((char *)a2 + v6[13]);
        uint64_t v15 = v6[14];
        uint64_t v16 = (char *)a1 + v15;
        uint64_t v17 = (char *)a2 + v15;
        uint64_t v18 = sub_24F3E3100();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        *(void *)((char *)a1 + v6[15]) = *(void *)((char *)a2 + v6[15]);
        (*(void (**)(_OWORD *, void, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PreviousPlanLockupAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24F3D81A4()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_24F3D81B4()
{
  sub_24F3CC278();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataMultiPayload();
  }
}

uint64_t getEnumTagSinglePayload for PreviousPlanLockupAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreviousPlanLockupAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24F3D83A0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.CodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.ViewAppearedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.PlanDetailsFetchedCodingKeys;
}

unsigned char *_s18FitnessWorkoutPlan24PreviousPlanLockupActionO28PlanDetailsFetchedCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3D849CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.RepeatPlanSelectedCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.PreviousPlanTappedCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.PreviousPlanTappedCodingKeys;
}

ValueMetadata *type metadata accessor for PreviousPlanLockupAction.HideAlertCodingKeys()
{
  return &type metadata for PreviousPlanLockupAction.HideAlertCodingKeys;
}

unint64_t sub_24F3D84F8()
{
  unint64_t result = qword_269A0C190;
  if (!qword_269A0C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C190);
  }
  return result;
}

unint64_t sub_24F3D8550()
{
  unint64_t result = qword_269A0C198;
  if (!qword_269A0C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C198);
  }
  return result;
}

unint64_t sub_24F3D85A8()
{
  unint64_t result = qword_269A0C1A0;
  if (!qword_269A0C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1A0);
  }
  return result;
}

unint64_t sub_24F3D8600()
{
  unint64_t result = qword_269A0C1A8;
  if (!qword_269A0C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1A8);
  }
  return result;
}

unint64_t sub_24F3D8658()
{
  unint64_t result = qword_269A0C1B0;
  if (!qword_269A0C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1B0);
  }
  return result;
}

unint64_t sub_24F3D86B0()
{
  unint64_t result = qword_269A0C1B8;
  if (!qword_269A0C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1B8);
  }
  return result;
}

unint64_t sub_24F3D8708()
{
  unint64_t result = qword_269A0C1C0;
  if (!qword_269A0C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1C0);
  }
  return result;
}

unint64_t sub_24F3D8760()
{
  unint64_t result = qword_269A0C1C8;
  if (!qword_269A0C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1C8);
  }
  return result;
}

unint64_t sub_24F3D87B8()
{
  unint64_t result = qword_269A0C1D0;
  if (!qword_269A0C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1D0);
  }
  return result;
}

unint64_t sub_24F3D8810()
{
  unint64_t result = qword_269A0C1D8;
  if (!qword_269A0C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1D8);
  }
  return result;
}

unint64_t sub_24F3D8868()
{
  unint64_t result = qword_269A0C1E0;
  if (!qword_269A0C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1E0);
  }
  return result;
}

unint64_t sub_24F3D88C0()
{
  unint64_t result = qword_269A0C1E8;
  if (!qword_269A0C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1E8);
  }
  return result;
}

unint64_t sub_24F3D8918()
{
  unint64_t result = qword_269A0C1F0;
  if (!qword_269A0C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1F0);
  }
  return result;
}

unint64_t sub_24F3D8970()
{
  unint64_t result = qword_269A0C1F8;
  if (!qword_269A0C1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C1F8);
  }
  return result;
}

unint64_t sub_24F3D89C8()
{
  unint64_t result = qword_269A0C200;
  if (!qword_269A0C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A0C200);
  }
  return result;
}

uint64_t sub_24F3D8A1C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F3E7FD0 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F3E7FF0 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F3E8010 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x72656C4165646968 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

__n128 PlanCompletionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void PlanCompletionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, unsigned char *a2, char **a3, unsigned __int8 *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B18);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v72 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v72 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v72 - v19;
  int v21 = *a4;
  long long v22 = v4[1];
  long long v90 = *v4;
  long long v91 = v22;
  long long v92 = v4[2];
  if (v21 == 1)
  {
    if (*a2) {
      return;
    }
    *a2 = 1;
    uint64_t v23 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B40);
    uint64_t v24 = &v20[v23[16]];
    uint64_t v25 = &v20[v23[20]];
    uint64_t v26 = v23[24];
    uint64_t v88 = a3;
    uint64_t v27 = &v20[v26];
    char v89 = 3;
    unint64_t v87 = sub_24F3D948C();
    sub_24F3E3790();
    sub_24F3E3740();
    uint64_t v28 = *MEMORY[0x263F39590];
    uint64_t v29 = sub_24F3E35A0();
    uint64_t v30 = *(void *)(v29 - 8);
    uint64_t v31 = *(void (**)(char *, void, uint64_t))(v30 + 104);
    unsigned int v86 = v28;
    uint64_t v85 = v29;
    uint64_t v81 = v30 + 104;
    unint64_t v82 = v31;
    ((void (*)(char *, uint64_t))v31)(v24, v28);
    uint64_t v32 = *MEMORY[0x263F39570];
    uint64_t v33 = sub_24F3E3590();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = *(void (**)(char *, void, uint64_t))(v34 + 104);
    unsigned int v80 = v32;
    long long v78 = v35;
    uint64_t v79 = v33;
    uint64_t v77 = v34 + 104;
    ((void (*)(char *, uint64_t))v35)(v25, v32);
    *(void *)uint64_t v27 = &unk_269A0C218;
    *((void *)v27 + 1) = 0;
    uint64_t v36 = *(void (**)(void))(v9 + 104);
    unsigned int v84 = *MEMORY[0x263F39530];
    uint64_t v83 = (void (*)(char *, void, uint64_t))v36;
    v36(v20);
    uint64_t v37 = *v88;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v37 = (char *)sub_24F3C8B78(0, *((void *)v37 + 2) + 1, 1, v37);
    }
    unint64_t v39 = *((void *)v37 + 2);
    unint64_t v38 = *((void *)v37 + 3);
    uint64_t v74 = v9 + 104;
    if (v39 >= v38 >> 1) {
      uint64_t v37 = (char *)sub_24F3C8B78(v38 > 1, v39 + 1, 1, v37);
    }
    *((void *)v37 + 2) = v39 + 1;
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    uint64_t v40 = v9 + 32;
    unint64_t v76 = (*(unsigned __int8 *)(v40 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 48);
    uint64_t v75 = *(void *)(v40 + 40);
    char v73 = v41;
    v41(&v37[v76 + v75 * v39], v20, v8);
    a3 = v88;
    *uint64_t v88 = v37;
    uint64_t v42 = &v17[v23[16]];
    uint64_t v43 = &v17[v23[20]];
    uint64_t v44 = &v17[v23[24]];
    char v89 = 0;
    sub_24F3E3790();
    sub_24F3E3760();
    v82(v42, v86, v85);
    v78(v43, v80, v79);
    uint64_t v45 = (_OWORD *)swift_allocObject();
    long long v46 = v91;
    v45[1] = v90;
    v45[2] = v46;
    v45[3] = v92;
    *(void *)uint64_t v44 = &unk_269A0C228;
    *((void *)v44 + 1) = v45;
    v83(v17, v84, v8);
    uint64_t v47 = *a3;
    sub_24F3DAA40((uint64_t)&v90);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v47 = (char *)sub_24F3C8B78(0, *((void *)v47 + 2) + 1, 1, v47);
    }
    unint64_t v49 = *((void *)v47 + 2);
    unint64_t v48 = *((void *)v47 + 3);
    if (v49 >= v48 >> 1) {
      uint64_t v47 = (char *)sub_24F3C8B78(v48 > 1, v49 + 1, 1, v47);
    }
    *((void *)v47 + 2) = v49 + 1;
    uint64_t v50 = &v47[v76 + v49 * v75];
    char v51 = v73;
    v73(v50, v17, v8);
    *a3 = v47;
    long long v52 = &v14[v23[16]];
    uint64_t v53 = &v14[v23[20]];
    uint64_t v54 = &v14[v23[24]];
    char v89 = 1;
    sub_24F3E3790();
    sub_24F3E3760();
    v82(v52, v86, v85);
    v78(v53, v80, v79);
    uint64_t v55 = (_OWORD *)swift_allocObject();
    long long v56 = v91;
    v55[1] = v90;
    v55[2] = v56;
    v55[3] = v92;
    *(void *)uint64_t v54 = &unk_269A0C238;
    *((void *)v54 + 1) = v55;
    v83(v14, v84, v8);
    uint64_t v57 = *a3;
    sub_24F3DAA40((uint64_t)&v90);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v57 = (char *)sub_24F3C8B78(0, *((void *)v57 + 2) + 1, 1, v57);
    }
    unint64_t v59 = *((void *)v57 + 2);
    unint64_t v58 = *((void *)v57 + 3);
    if (v59 >= v58 >> 1) {
      uint64_t v57 = (char *)sub_24F3C8B78(v58 > 1, v59 + 1, 1, v57);
    }
    *((void *)v57 + 2) = v59 + 1;
    v51(&v57[v76 + v59 * v75], v14, v8);
  }
  else
  {
    uint64_t v60 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B40);
    uint64_t v61 = &v11[v60[16]];
    uint64_t v62 = &v11[v60[20]];
    uint64_t v63 = &v11[v60[24]];
    char v89 = 2;
    sub_24F3D948C();
    sub_24F3E3790();
    sub_24F3E3740();
    uint64_t v64 = *MEMORY[0x263F39580];
    uint64_t v65 = sub_24F3E35A0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 104))(v61, v64, v65);
    uint64_t v66 = *MEMORY[0x263F39570];
    uint64_t v67 = sub_24F3E3590();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 104))(v62, v66, v67);
    unint64_t v68 = (_OWORD *)swift_allocObject();
    long long v69 = v91;
    v68[1] = v90;
    v68[2] = v69;
    v68[3] = v92;
    *(void *)uint64_t v63 = &unk_269A0C210;
    *((void *)v63 + 1) = v68;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F39530], v8);
    uint64_t v57 = *a3;
    sub_24F3DAA40((uint64_t)&v90);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v57 = (char *)sub_24F3C8B78(0, *((void *)v57 + 2) + 1, 1, v57);
    }
    unint64_t v71 = *((void *)v57 + 2);
    unint64_t v70 = *((void *)v57 + 3);
    if (v71 >= v70 >> 1) {
      uint64_t v57 = (char *)sub_24F3C8B78(v70 > 1, v71 + 1, 1, v57);
    }
    *((void *)v57 + 2) = v71 + 1;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v57[((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v71], v11, v8);
  }
  *a3 = v57;
}

unint64_t sub_24F3D948C()
{
  unint64_t result = qword_26B1F3AE0;
  if (!qword_26B1F3AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AE0);
  }
  return result;
}

uint64_t sub_24F3D94E0()
{
  *(void *)(v0 + 16) = sub_24F3E3730();
  *(void *)(v0 + 24) = sub_24F3E3720();
  *(unsigned char *)(v0 + 40) = 0;
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B20);
  void *v1 = v0;
  v1[1] = sub_24F3D95B8;
  return MEMORY[0x270F252C8](v0 + 40, v2);
}

uint64_t sub_24F3D95B8()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24F3E3700();
  return MEMORY[0x270FA2498](sub_24F3DAE94, v1, v0);
}

uint64_t sub_24F3D96F4(uint64_t a1, void *a2)
{
  v2[12] = a1;
  v2[13] = sub_24F3E3730();
  v2[14] = sub_24F3E3720();
  char v6 = (uint64_t (*)(void *))(*a2 + *(int *)*a2);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[15] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3D97F0;
  return v6(v2 + 7);
}

uint64_t sub_24F3D97F0()
{
  uint64_t v2 = (void *)*v1;
  v2[16] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F3E3700();
  v2[17] = v4;
  v2[18] = v3;
  if (v0) {
    uint64_t v5 = sub_24F3D9FA4;
  }
  else {
    uint64_t v5 = sub_24F3D9950;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3D9950()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F3E3770();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F3E3720();
  v0[19] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  char v6 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v6;
  *char v6 = v0;
  v6[1] = sub_24F3D9B40;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v5, v7);
}

uint64_t sub_24F3D9B40()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F3D9C84, v3, v2);
}

uint64_t sub_24F3D9C84()
{
  if (*(unsigned char *)(v0 + 176) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(unsigned char *)(v0 + 177) = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B20);
    *uint64_t v3 = v0;
    v3[1] = sub_24F3D9D98;
    return MEMORY[0x270F252C8](v0 + 177, v4);
  }
}

uint64_t sub_24F3D9D98()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F3D9EB8, v3, v2);
}

uint64_t sub_24F3D9EB8()
{
  uint64_t v1 = sub_24F3E3720();
  v0[19] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F3D9B40;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v1, v3);
}

uint64_t sub_24F3D9FA4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3DA008(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = sub_24F3E3730();
  v2[14] = sub_24F3E3720();
  char v6 = (uint64_t (*)(void *))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[15] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3DA104;
  return v6(v2 + 7);
}

uint64_t sub_24F3DA104()
{
  uint64_t v2 = (void *)*v1;
  v2[16] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F3E3700();
  v2[17] = v4;
  v2[18] = v3;
  if (v0) {
    uint64_t v5 = sub_24F3DAE90;
  }
  else {
    uint64_t v5 = sub_24F3DA264;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3DA264()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F3E3770();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F3E3720();
  v0[19] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  char v6 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v6;
  *char v6 = v0;
  v6[1] = sub_24F3DA454;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v5, v7);
}

uint64_t sub_24F3DA454()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F3DA598, v3, v2);
}

uint64_t sub_24F3DA598()
{
  if (*(unsigned char *)(v0 + 176) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(unsigned char *)(v0 + 177) = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F3B20);
    *uint64_t v3 = v0;
    v3[1] = sub_24F3DA6AC;
    return MEMORY[0x270F252C8](v0 + 177, v4);
  }
}

uint64_t sub_24F3DA6AC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F3DA7CC, v3, v2);
}

uint64_t sub_24F3DA7CC()
{
  uint64_t v1 = sub_24F3E3720();
  v0[19] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F3DA454;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v1, v3);
}

uint64_t sub_24F3DA8B8(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_24F3E3730();
  v2[3] = sub_24F3E3720();
  char v6 = (uint64_t (*)(void))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3C83B4;
  return v6();
}

uint64_t sub_24F3DA9A4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3C8D60;
  return sub_24F3DA8B8(a1, v1 + 16);
}

uint64_t sub_24F3DAA40(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F3DAA98(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3C8698;
  return sub_24F3D96F4(a1, (void *)(v1 + 16));
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24F3DAB80(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3C8D60;
  return sub_24F3DA008(a1, v1 + 16);
}

unint64_t sub_24F3DAC20()
{
  unint64_t result = qword_26B1F3AD8;
  if (!qword_26B1F3AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AD8);
  }
  return result;
}

unint64_t sub_24F3DAC78()
{
  unint64_t result = qword_26B1F3AD0;
  if (!qword_26B1F3AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AD0);
  }
  return result;
}

unint64_t sub_24F3DACD0()
{
  unint64_t result = qword_26B1F3A80;
  if (!qword_26B1F3A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3A80);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanCompletionFeature()
{
  return &type metadata for PlanCompletionFeature;
}

unsigned char *storeEnumTagSinglePayload for PlanCompletionFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3DAE00);
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

ValueMetadata *type metadata accessor for PlanCompletionFeature.TaskIdentifier()
{
  return &type metadata for PlanCompletionFeature.TaskIdentifier;
}

unint64_t sub_24F3DAE3C()
{
  unint64_t result = qword_26B1F3AE8;
  if (!qword_26B1F3AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F3AE8);
  }
  return result;
}

void CreateWorkoutPlanButtonState.handoffAlertState.getter(unsigned char *a1@<X8>)
{
  char v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

unsigned char *CreateWorkoutPlanButtonState.handoffAlertState.setter(unsigned char *result)
{
  char v2 = result[1];
  unsigned char *v1 = *result;
  v1[1] = v2;
  return result;
}

uint64_t (*CreateWorkoutPlanButtonState.handoffAlertState.modify())()
{
  return nullsub_1;
}

uint64_t CreateWorkoutPlanButtonState.localizedTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CreateWorkoutPlanButtonState.supportsHandoffToCompanionDevice.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t CreateWorkoutPlanButtonState.init(handoffAlertState:storefrontLocale:supportsHandoffToCompanionDevice:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24F3E3120();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24F3E3680();
  MEMORY[0x270FA5388](v12 - 8);
  char v13 = *a1;
  char v14 = a1[1];
  sub_24F3E3600();
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)qword_26B1F4E10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  id v16 = v15;
  uint64_t v17 = sub_24F3E36A0();
  uint64_t v19 = v18;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  *(unsigned char *)a4 = v13;
  *(unsigned char *)(a4 + 1) = v14;
  *(void *)(a4 + 8) = v17;
  *(void *)(a4 + 16) = v19;
  *(unsigned char *)(a4 + 24) = a3 & 1;
  return result;
}

FitnessWorkoutPlan::CreateWorkoutPlanButtonState __swiftcall CreateWorkoutPlanButtonState.init(handoffAlertState:localizedTitle:supportsHandoffToCompanionDevice:)(FitnessWorkoutPlan::CreateWorkoutPlanHandoffAlertState handoffAlertState, Swift::String localizedTitle, Swift::Bool supportsHandoffToCompanionDevice)
{
  char v4 = *(unsigned char *)(*(void *)&handoffAlertState.iconState + 1);
  *(unsigned char *)uint64_t v3 = **(unsigned char **)&handoffAlertState.iconState;
  *(unsigned char *)(v3 + 1) = v4;
  *(Swift::String *)(v3 + 8) = localizedTitle;
  *(unsigned char *)(v3 + 24) = supportsHandoffToCompanionDevice;
  result.localizedTitle = localizedTitle;
  result.handoffAlertuint64_t State = handoffAlertState;
  result.supportsHandoffToCompanionDevice = supportsHandoffToCompanionDevice;
  return result;
}

unint64_t sub_24F3DB120()
{
  unint64_t v1 = 0x657A696C61636F6CLL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000020;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_24F3DB18C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3DBBAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3DB1B4(uint64_t a1)
{
  unint64_t v2 = sub_24F3DB674();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3DB1F0(uint64_t a1)
{
  unint64_t v2 = sub_24F3DB674();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CreateWorkoutPlanButtonState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C240);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  char v8 = v1[1];
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v13 = *((void *)v1 + 2);
  uint64_t v14 = v9;
  v12[1] = v1[24];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3DB674();
  sub_24F3E3920();
  char v19 = v7;
  char v20 = v8;
  char v18 = 0;
  sub_24F3DB6C8();
  uint64_t v10 = v15;
  sub_24F3E38A0();
  if (!v10)
  {
    char v17 = 1;
    sub_24F3E3870();
    char v16 = 2;
    sub_24F3E3880();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t CreateWorkoutPlanButtonState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C258);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3DB674();
  sub_24F3E3910();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v20 = 0;
  sub_24F3DB71C();
  sub_24F3E3830();
  int v9 = v21;
  int v10 = v22;
  char v19 = 1;
  uint64_t v15 = sub_24F3E3800();
  int v16 = v10;
  int v17 = v9;
  char v18 = 2;
  uint64_t v12 = v11;
  swift_bridgeObjectRetain();
  char v13 = sub_24F3E3810();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(unsigned char *)a2 = v17;
  *(unsigned char *)(a2 + 1) = v16;
  *(void *)(a2 + 8) = v15;
  *(void *)(a2 + 16) = v12;
  *(unsigned char *)(a2 + 24) = v13 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3DB63C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CreateWorkoutPlanButtonState.init(from:)(a1, a2);
}

uint64_t sub_24F3DB654(void *a1)
{
  return CreateWorkoutPlanButtonState.encode(to:)(a1);
}

unint64_t sub_24F3DB674()
{
  unint64_t result = qword_269A0C248;
  if (!qword_269A0C248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C248);
  }
  return result;
}

unint64_t sub_24F3DB6C8()
{
  unint64_t result = qword_269A0C250;
  if (!qword_269A0C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C250);
  }
  return result;
}

unint64_t sub_24F3DB71C()
{
  unint64_t result = qword_269A0C260;
  if (!qword_269A0C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C260);
  }
  return result;
}

uint64_t _s18FitnessWorkoutPlan06CreatebC11ButtonStateV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result = 0;
  if (*a1 == *a2 && ((a1[1] ^ a2[1]) & 1) == 0)
  {
    int v4 = a1[24];
    int v5 = a2[24];
    if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)) {
      return v4 ^ v5 ^ 1u;
    }
    char v7 = sub_24F3E38C0();
    uint64_t result = 0;
    if (v7) {
      return v4 ^ v5 ^ 1u;
    }
  }
  return result;
}

uint64_t destroy for CreateWorkoutPlanButtonState()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CreateWorkoutPlanButtonState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CreateWorkoutPlanButtonState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CreateWorkoutPlanButtonState(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateWorkoutPlanButtonState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateWorkoutPlanButtonState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonState()
{
  return &type metadata for CreateWorkoutPlanButtonState;
}

unsigned char *storeEnumTagSinglePayload for CreateWorkoutPlanButtonState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3DBA6CLL);
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

ValueMetadata *type metadata accessor for CreateWorkoutPlanButtonState.CodingKeys()
{
  return &type metadata for CreateWorkoutPlanButtonState.CodingKeys;
}

unint64_t sub_24F3DBAA8()
{
  unint64_t result = qword_269A0C268;
  if (!qword_269A0C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C268);
  }
  return result;
}

unint64_t sub_24F3DBB00()
{
  unint64_t result = qword_269A0C270;
  if (!qword_269A0C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C270);
  }
  return result;
}

unint64_t sub_24F3DBB58()
{
  unint64_t result = qword_269A0C278;
  if (!qword_269A0C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C278);
  }
  return result;
}

uint64_t sub_24F3DBBAC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024F3E8050 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A696C61636F6CLL && a2 == 0xEE00656C74695464 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x800000024F3E8070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24F3DBD20()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t localizedWorkoutPlanString(_:locale:comment:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3E3120();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_24F3E3680();
  __n128 v9 = MEMORY[0x270FA5388](v8);
  (*(void (**)(unsigned char *, uint64_t, __n128))(v11 + 16))(&v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v9);
  if (qword_26B1F3B38 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_26B1F4E10;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  id v13 = v12;
  return sub_24F3E36A0();
}

id sub_24F3DBF0C()
{
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B1F4E10 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return self;
}

uint64_t PreviousPlanDetail.placeholderIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.caption.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviousPlanDetail.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 32);
  uint64_t v4 = sub_24F3E30D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for PreviousPlanDetail()
{
  uint64_t result = qword_26B1F3A68;
  if (!qword_26B1F3A68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PreviousPlanDetail.workoutPlanLength.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 36));
}

uint64_t PreviousPlanDetail.weekdays.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.timePerDay.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.hasActivePlan.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 48));
}

uint64_t PreviousPlanDetail.modalities.getter()
{
  type metadata accessor for PreviousPlanDetail();
  return swift_bridgeObjectRetain();
}

uint64_t PreviousPlanDetail.templateIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreviousPlanDetail() + 56);
  uint64_t v4 = sub_24F3E3100();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PreviousPlanDetail.modalityIdentifiersCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for PreviousPlanDetail() + 60));
}

uint64_t sub_24F3DC28C()
{
  uint64_t v0 = sub_24F3E3100();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24F3E30D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for PreviousPlanDetail();
  __swift_allocate_value_buffer((uint64_t)v8, qword_269A0C280);
  __n128 v9 = (char *)__swift_project_value_buffer((uint64_t)v8, (uint64_t)qword_269A0C280);
  sub_24F3E30C0();
  sub_24F3E30F0();
  *(void *)__n128 v9 = 0xD000000000000016;
  *((void *)v9 + 1) = 0x800000024F3E8160;
  *((void *)v9 + 2) = 0xD000000000000011;
  *((void *)v9 + 3) = 0x800000024F3E8180;
  *((void *)v9 + 4) = 0xD000000000000014;
  *((void *)v9 + 5) = 0x800000024F3E81A0;
  *((void *)v9 + 6) = 0xD000000000000013;
  *((void *)v9 + 7) = 0x800000024F3E81C0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v9[v8[8]], v7, v4);
  *(void *)&v9[v8[9]] = 0;
  uint64_t v10 = MEMORY[0x263F8EE78];
  *(void *)&v9[v8[11]] = MEMORY[0x263F8EE78];
  *(void *)&v9[v8[10]] = v10;
  v9[v8[12]] = 0;
  *(void *)&v9[v8[13]] = v10;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v1 + 32))(&v9[v8[14]], v3, v0);
  *(void *)&v9[v8[15]] = 0;
  return result;
}

uint64_t PreviousPlanDetail.init(placeholderIdentifier:title:subtitle:caption:startDate:workoutPlanLength:weekdays:timePerDay:hasActivePlan:modalities:templateIdentifier:modalityIdentifiersCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  char v18 = (int *)type metadata accessor for PreviousPlanDetail();
  char v19 = (char *)a9 + v18[8];
  uint64_t v20 = sub_24F3E30D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v19, a10, v20);
  *(void *)((char *)a9 + v18[9]) = a11;
  *(void *)((char *)a9 + v18[11]) = a13;
  *(void *)((char *)a9 + v18[10]) = a12;
  *((unsigned char *)a9 + v18[12]) = a14;
  *(void *)((char *)a9 + v18[13]) = a15;
  unsigned __int8 v21 = (char *)a9 + v18[14];
  uint64_t v22 = sub_24F3E3100();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v21, a16, v22);
  *(void *)((char *)a9 + v18[15]) = a17;
  return result;
}

uint64_t static PreviousPlanDetail.placeholder.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269A0BBB0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PreviousPlanDetail();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269A0C280);
  return sub_24F3DC67C(v3, a1);
}

uint64_t sub_24F3DC67C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F3DC6E0(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x656C746974627573;
      break;
    case 3:
      unint64_t result = 0x6E6F6974706163;
      break;
    case 4:
      unint64_t result = 0x7461447472617473;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0x737961646B656577;
      break;
    case 7:
      unint64_t result = 0x44726550656D6974;
      break;
    case 8:
      unint64_t result = 0x7669746341736168;
      break;
    case 9:
      unint64_t result = 0x6974696C61646F6DLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 11:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F3DC870()
{
  return sub_24F3DC6E0(*v0);
}

uint64_t sub_24F3DC878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3DEF24(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3DC8A0(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_24F3DC8AC(uint64_t a1)
{
  unint64_t v2 = sub_24F3DCDCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3DC8E8(uint64_t a1)
{
  unint64_t v2 = sub_24F3DCDCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PreviousPlanDetail.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C298);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3DCDCC();
  sub_24F3E3920();
  LOBYTE(v12) = 0;
  sub_24F3E3870();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_24F3E3870();
    LOBYTE(v12) = 2;
    sub_24F3E3870();
    LOBYTE(v12) = 3;
    sub_24F3E3870();
    __n128 v9 = (int *)type metadata accessor for PreviousPlanDetail();
    LOBYTE(v12) = 4;
    sub_24F3E30D0();
    sub_24F3DE02C(&qword_269A0C2A8, MEMORY[0x263F07490]);
    sub_24F3E38A0();
    LOBYTE(v12) = 5;
    sub_24F3E3890();
    uint64_t v12 = *(void *)(v3 + v9[10]);
    HIBYTE(v11) = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C2B0);
    sub_24F3DD7B4(&qword_269A0C2B8, (void (*)(void))sub_24F3DCE20);
    sub_24F3E38A0();
    uint64_t v12 = *(void *)(v3 + v9[11]);
    HIBYTE(v11) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C2C8);
    sub_24F3DD878(&qword_269A0C2D0, &qword_269A0C2C8);
    sub_24F3E38A0();
    LOBYTE(v12) = 8;
    sub_24F3E3880();
    uint64_t v12 = *(void *)(v3 + v9[13]);
    HIBYTE(v11) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDF0);
    sub_24F3DD878(&qword_269A0C2D8, &qword_269A0BDF0);
    sub_24F3E38A0();
    LOBYTE(v12) = 10;
    sub_24F3E3100();
    sub_24F3DE02C(&qword_269A0C2E0, MEMORY[0x263F07508]);
    sub_24F3E38A0();
    LOBYTE(v12) = 11;
    sub_24F3E3890();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24F3DCDCC()
{
  unint64_t result = qword_269A0C2A0;
  if (!qword_269A0C2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C2A0);
  }
  return result;
}

unint64_t sub_24F3DCE20()
{
  unint64_t result = qword_269A0C2C0;
  if (!qword_269A0C2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C2C0);
  }
  return result;
}

uint64_t PreviousPlanDetail.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_24F3E3100();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3E30D0();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C2E8);
  uint64_t v11 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = (int *)type metadata accessor for PreviousPlanDetail();
  MEMORY[0x270FA5388](v33);
  uint64_t v31 = a1;
  uint64_t v32 = (uint64_t *)((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3DCDCC();
  sub_24F3E3910();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  uint64_t v15 = v7;
  LOBYTE(v35) = 0;
  uint64_t v16 = sub_24F3E3800();
  int v17 = (char *)v32;
  uint64_t *v32 = v16;
  *((void *)v17 + 1) = v18;
  LOBYTE(v35) = 1;
  *((void *)v17 + 2) = sub_24F3E3800();
  *((void *)v17 + 3) = v19;
  LOBYTE(v35) = 2;
  *((void *)v17 + 4) = sub_24F3E3800();
  *((void *)v17 + 5) = v20;
  LOBYTE(v35) = 3;
  *((void *)v17 + 6) = sub_24F3E3800();
  *((void *)v17 + 7) = v21;
  LOBYTE(v35) = 4;
  sub_24F3DE02C(&qword_269A0C2F0, MEMORY[0x263F07490]);
  sub_24F3E3830();
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(&v17[v33[8]], v10, v30);
  LOBYTE(v35) = 5;
  *(void *)&v17[v33[9]] = sub_24F3E3820();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C2B0);
  char v34 = 6;
  sub_24F3DD7B4(&qword_269A0C2F8, (void (*)(void))sub_24F3DD824);
  sub_24F3E3830();
  *(void *)&v17[v33[10]] = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C2C8);
  char v34 = 7;
  sub_24F3DD878(&qword_269A0C308, &qword_269A0C2C8);
  sub_24F3E3830();
  *(void *)&v17[v33[11]] = v35;
  LOBYTE(v35) = 8;
  v17[v33[12]] = sub_24F3E3810() & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BDF0);
  char v34 = 9;
  sub_24F3DD878(&qword_269A0C310, &qword_269A0BDF0);
  sub_24F3E3830();
  *(uint64_t *)((char *)v32 + v33[13]) = v35;
  LOBYTE(v35) = 10;
  sub_24F3DE02C(&qword_269A0C318, MEMORY[0x263F07508]);
  sub_24F3E3830();
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))((char *)v32 + v33[14], v15, v27);
  LOBYTE(v35) = 11;
  uint64_t v22 = sub_24F3E3820();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
  uint64_t v23 = (uint64_t)v32;
  *(uint64_t *)((char *)v32 + v33[15]) = v22;
  sub_24F3DC67C(v23, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return sub_24F3DD8D8(v23);
}

uint64_t sub_24F3DD7B4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0C2B0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24F3DD824()
{
  unint64_t result = qword_269A0C300;
  if (!qword_269A0C300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C300);
  }
  return result;
}

uint64_t sub_24F3DD878(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24F3DD8D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviousPlanDetail();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F3DD934@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviousPlanDetail.init(from:)(a1, a2);
}

uint64_t sub_24F3DD94C(void *a1)
{
  return PreviousPlanDetail.encode(to:)(a1);
}

uint64_t PreviousPlanDetail.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24F3E36B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24F3E36B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24F3E36B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24F3E36B0();
  swift_bridgeObjectRelease();
  uint64_t v1 = (int *)type metadata accessor for PreviousPlanDetail();
  sub_24F3E30D0();
  sub_24F3DE02C(&qword_269A0C320, MEMORY[0x263F07490]);
  sub_24F3E35E0();
  sub_24F3E38E0();
  uint64_t v2 = *(void *)(v0 + v1[10]);
  sub_24F3E38E0();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 32;
    do
    {
      ++v4;
      sub_24F3E38E0();
      --v3;
    }
    while (v3);
  }
  uint64_t v5 = *(void *)(v0 + v1[11]);
  sub_24F3E38E0();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = v5 + 32;
    do
    {
      v7 += 8;
      sub_24F3E38E0();
      --v6;
    }
    while (v6);
  }
  sub_24F3E38F0();
  uint64_t v8 = *(void *)(v0 + v1[13]);
  sub_24F3E38E0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = v8 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_24F3E36B0();
      swift_bridgeObjectRelease();
      v10 += 16;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
  sub_24F3E3100();
  sub_24F3DE02C(&qword_269A0C328, MEMORY[0x263F07508]);
  sub_24F3E35E0();
  return sub_24F3E38E0();
}

BOOL sub_24F3DDBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (unsigned __int8 *)(a1 + 33);
  uint64_t v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_24F3DDC58(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  uint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_24F3DDCCC(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_24F3E38C0(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_24F3E38C0() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t PreviousPlanDetail.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3DDDD4()
{
  return sub_24F3E3900();
}

uint64_t sub_24F3DDE18()
{
  return sub_24F3E3900();
}

BOOL _s18FitnessWorkoutPlan08PreviousC6DetailV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_24F3E38C0(), BOOL result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_24F3E38C0(), BOOL result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_24F3E38C0(), BOOL result = 0, (v9 & 1) != 0))
      {
        if (a1[6] == a2[6] && a1[7] == a2[7] || (v10 = sub_24F3E38C0(), BOOL result = 0, (v10 & 1) != 0))
        {
          BOOL v11 = (int *)type metadata accessor for PreviousPlanDetail();
          return (sub_24F3E30B0() & 1) != 0
              && *(void *)((char *)a1 + v11[9]) == *(void *)((char *)a2 + v11[9])
              && sub_24F3DDBE4(*(void *)((char *)a1 + v11[10]), *(void *)((char *)a2 + v11[10]))
              && sub_24F3DDC58(*(void **)((char *)a1 + v11[11]), *(void **)((char *)a2 + v11[11]))
              && *((unsigned __int8 *)a1 + v11[12]) == *((unsigned __int8 *)a2 + v11[12])
              && (sub_24F3DDCCC(*(void **)((char *)a1 + v11[13]), *(void **)((char *)a2 + v11[13])) & 1) != 0
              && (sub_24F3E30E0() & 1) != 0
              && *(void *)((char *)a1 + v11[15]) == *(void *)((char *)a2 + v11[15]);
        }
      }
    }
  }
  return result;
}

uint64_t sub_24F3DDFE4()
{
  return sub_24F3DE02C(&qword_269A0C330, (void (*)(uint64_t))type metadata accessor for PreviousPlanDetail);
}

uint64_t sub_24F3DE02C(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for PreviousPlanDetail(void *a1, void *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *BOOL v4 = *a2;
    BOOL v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    uint64_t v11 = a3[8];
    uint64_t v22 = (char *)a2 + v11;
    uint64_t v23 = (char *)a1 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v12 = sub_24F3E30D0();
    id v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v23, v22, v12);
    uint64_t v14 = a3[10];
    *(void *)((char *)v4 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *(void *)((char *)v4 + v14) = *(void *)((char *)a2 + v14);
    uint64_t v15 = a3[12];
    *(void *)((char *)v4 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v16 = a3[14];
    *(void *)((char *)v4 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    uint64_t v24 = (char *)v4 + v16;
    int v17 = (char *)a2 + v16;
    uint64_t v18 = sub_24F3E3100();
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v24, v17, v18);
    *(void *)((char *)v4 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  }
  return v4;
}

uint64_t destroy for PreviousPlanDetail(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_24F3E30D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 56);
  uint64_t v7 = sub_24F3E3100();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *initializeWithCopy for PreviousPlanDetail(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  uint64_t v10 = a3[8];
  uint64_t v20 = (char *)a2 + v10;
  uint64_t v21 = (char *)a1 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v11 = sub_24F3E30D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v21, v20, v11);
  uint64_t v13 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
  uint64_t v15 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  uint64_t v22 = (char *)a1 + v15;
  uint64_t v16 = (char *)a2 + v15;
  uint64_t v17 = sub_24F3E3100();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(v22, v16, v17);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  return a1;
}

void *assignWithCopy for PreviousPlanDetail(void *a1, void *a2, int *a3)
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
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[14];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  return a1;
}

_OWORD *initializeWithTake for PreviousPlanDetail(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[8];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v14 = a3[14];
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  return a1;
}

void *assignWithTake for PreviousPlanDetail(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[14];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviousPlanDetail(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3DE91C);
}

uint64_t sub_24F3DE91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24F3E30D0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 32);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24F3E3100();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 56);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for PreviousPlanDetail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3DEA5C);
}

uint64_t sub_24F3DEA5C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_24F3E30D0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 32);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24F3E3100();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 56);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_24F3DEB88()
{
  uint64_t result = sub_24F3E30D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24F3E3100();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviousPlanDetail.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreviousPlanDetail.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x24F3DEDE4);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviousPlanDetail.CodingKeys()
{
  return &type metadata for PreviousPlanDetail.CodingKeys;
}

unint64_t sub_24F3DEE20()
{
  unint64_t result = qword_269A0C338;
  if (!qword_269A0C338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C338);
  }
  return result;
}

unint64_t sub_24F3DEE78()
{
  unint64_t result = qword_269A0C340;
  if (!qword_269A0C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C340);
  }
  return result;
}

unint64_t sub_24F3DEED0()
{
  unint64_t result = qword_269A0C348;
  if (!qword_269A0C348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C348);
  }
  return result;
}

uint64_t sub_24F3DEF24(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024F3E7E30 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974706163 && a2 == 0xE700000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F3E8100 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737961646B656577 && a2 == 0xE800000000000000 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x44726550656D6974 && a2 == 0xEA00000000007961 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x7669746341736168 && a2 == 0xED00006E616C5065 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6974696C61646F6DLL && a2 == 0xEA00000000007365 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F3E8120 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024F3E8140)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v5 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 11;
    }
    else {
      return 12;
    }
  }
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

uint64_t PreviousPlanWeekday.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_24F3DF47C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s18FitnessWorkoutPlan08PreviousC7WeekdayO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_24F3DF4A8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24F3DF4B4()
{
  return sub_24F3E36E0();
}

uint64_t sub_24F3DF514()
{
  return sub_24F3E36D0();
}

unint64_t _s18FitnessWorkoutPlan08PreviousC7WeekdayO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

unint64_t sub_24F3DF578()
{
  unint64_t result = qword_269A0C350;
  if (!qword_269A0C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C350);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviousPlanWeekday(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviousPlanWeekday(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3DF728);
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

ValueMetadata *type metadata accessor for PreviousPlanWeekday()
{
  return &type metadata for PreviousPlanWeekday;
}

unint64_t sub_24F3DF760()
{
  unint64_t result = qword_269A0C358;
  if (!qword_269A0C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C358);
  }
  return result;
}

uint64_t sub_24F3DF7B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t LockupView.init(planDetail:artworkViewBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24F3E3150();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3E3140();
  sub_24F3DF908(2, 2, 2, (uint64_t)v10, a4, 16.0, 9.0, 12.0, 0.0, 8.0, 28.0);
  uint64_t v11 = type metadata accessor for LockupView();
  uint64_t result = sub_24F3BF4A4(a1, a4 + *(int *)(v11 + 36));
  uint64_t v13 = (void *)(a4 + *(int *)(v11 + 40));
  *uint64_t v13 = a2;
  v13[1] = a3;
  return result;
}

uint64_t sub_24F3DF908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>, double a10@<D4>, double a11@<D5>)
{
  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(double *)(a5 + 16) = a8;
  *(double *)(a5 + 24) = a9;
  *(void *)(a5 + 32) = a1;
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  uint64_t v15 = (int *)type metadata accessor for LockupView.Layout();
  uint64_t v16 = a5 + v15[14];
  uint64_t v17 = sub_24F3E3150();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v16, a4, v17);
  *(double *)(a5 + v15[15]) = a10;
  *(double *)(a5 + v15[16]) = a11;
  return result;
}

uint64_t type metadata accessor for LockupView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LockupView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  BOOL v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3E31D0();
  uint64_t v33 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v30 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0C360);
  uint64_t v32 = sub_24F3E31D0();
  uint64_t v36 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v30 = (char *)&v30 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0C368);
  uint64_t v12 = sub_24F3E31D0();
  uint64_t v35 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v31 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v15 = MEMORY[0x270FA5388](v14);
  char v34 = (char *)&v30 - v16;
  (*(void (**)(__n128))(v2 + *(int *)(a1 + 40)))(v15);
  uint64_t v17 = *(void *)(a1 + 24);
  sub_24F3E33D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v45 = v17;
  uint64_t v46 = MEMORY[0x263F198F8];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = v30;
  sub_24F3E33F0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v8);
  sub_24F3E3530();
  uint64_t v38 = v4;
  uint64_t v39 = v17;
  uint64_t v40 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C370);
  uint64_t v20 = sub_24F3C4528(&qword_269A0C378, &qword_269A0C360);
  uint64_t v43 = WitnessTable;
  uint64_t v44 = v20;
  uint64_t v21 = v32;
  uint64_t v22 = swift_getWitnessTable();
  sub_24F3E070C();
  uint64_t v23 = v31;
  sub_24F3E3430();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v21);
  uint64_t v24 = sub_24F3C4528(qword_269A0C398, &qword_269A0C368);
  uint64_t v41 = v22;
  uint64_t v42 = v24;
  swift_getWitnessTable();
  uint64_t v26 = v34;
  uint64_t v25 = v35;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v27(v34, v23, v12);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v23, v12);
  v27(v37, v26, v12);
  return ((uint64_t (*)(char *, uint64_t))v28)(v26, v12);
}

void *sub_24F3DFE90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LockupView.Layout();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = &v22[-v6 - 8];
  uint64_t v8 = sub_24F3E3290();
  uint64_t v9 = *(void *)((char *)a1 + *(int *)(v4 + 60));
  sub_24F3E009C(a1, (uint64_t)v22);
  v23[328] = 0;
  memcpy(&v23[7], v22, 0x141uLL);
  memcpy(v24, v23, sizeof(v24));
  (*(void (**)(unsigned char *, void *, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v10 = &v7[*(int *)(v4 + 56)];
  sub_24F3E3130();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = sub_24F3E3150();
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(v19 - 8) + 8))(v10, v19);
  LOBYTE(v10) = sub_24F3E3310();
  char v25 = 0;
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t result = memcpy((void *)(a2 + 17), v24, 0x148uLL);
  *(_DWORD *)(a2 + 345) = v27[0];
  *(_DWORD *)(a2 + 348) = *(_DWORD *)((char *)v27 + 3);
  *(unsigned char *)(a2 + 352) = (_BYTE)v10;
  *(_DWORD *)(a2 + 353) = *(_DWORD *)v26;
  *(_DWORD *)(a2 + 356) = *(_DWORD *)&v26[3];
  *(void *)(a2 + 360) = v12;
  *(void *)(a2 + 368) = v14;
  *(void *)(a2 + 376) = v16;
  *(void *)(a2 + 384) = v18;
  *(unsigned char *)(a2 + 392) = v25;
  return result;
}

void *sub_24F3E0090@<X0>(uint64_t a1@<X8>)
{
  return sub_24F3DFE90(*(void **)(v1 + 32), a1);
}

uint64_t sub_24F3E009C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = (char *)a1 + *(int *)(type metadata accessor for LockupView() + 36);
  sub_24F3C38E4();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_24F3E33A0();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_24F3E3340();
  sub_24F3E3350();
  swift_release();
  uint64_t v8 = sub_24F3E3390();
  uint64_t v10 = v9;
  char v12 = v11;
  swift_release();
  sub_24F3C3850(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_24F3E3490();
  uint64_t v13 = sub_24F3E3370();
  uint64_t v82 = v14;
  uint64_t v83 = v13;
  LOBYTE(v5) = v15;
  uint64_t v81 = v16;
  swift_release();
  char v76 = v5 & 1;
  sub_24F3C3850(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  uint64_t v75 = a1[4];
  uint64_t KeyPath = swift_getKeyPath();
  char v74 = sub_24F3E3310();
  sub_24F3E3190();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_24F3E33A0();
  uint64_t v27 = v26;
  LOBYTE(v10) = v28 & 1;
  sub_24F3E3360();
  uint64_t v29 = sub_24F3E3390();
  uint64_t v31 = v30;
  LOBYTE(v8) = v32;
  swift_release();
  sub_24F3C3850(v25, v27, v10);
  swift_bridgeObjectRelease();
  sub_24F3E3490();
  uint64_t v33 = sub_24F3E3370();
  uint64_t v72 = v34;
  uint64_t v73 = v33;
  LOBYTE(v27) = v35;
  uint64_t v71 = v36;
  swift_release();
  char v68 = v27 & 1;
  sub_24F3C3850(v29, v31, v8 & 1);
  swift_bridgeObjectRelease();
  uint64_t v67 = a1[5];
  uint64_t v70 = swift_getKeyPath();
  char v69 = sub_24F3E3310();
  sub_24F3E3190();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v66 = *(void *)((char *)a1 + *(int *)(type metadata accessor for LockupView.Layout() + 64));
  uint64_t v85 = *((void *)v77 + 6);
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_24F3E33A0();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  sub_24F3E3360();
  uint64_t v50 = sub_24F3E3390();
  uint64_t v52 = v51;
  LOBYTE(v29) = v53;
  swift_release();
  sub_24F3C3850(v45, v47, v49);
  swift_bridgeObjectRelease();
  sub_24F3E34A0();
  uint64_t v78 = sub_24F3E3370();
  uint64_t v64 = v55;
  uint64_t v65 = v54;
  char v57 = v56;
  swift_release();
  sub_24F3C3850(v50, v52, v29 & 1);
  swift_bridgeObjectRelease();
  uint64_t v58 = a1[6];
  uint64_t v79 = swift_getKeyPath();
  LOBYTE(v45) = sub_24F3E3310();
  sub_24F3E3190();
  *(_DWORD *)(a2 + 275) = v87;
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v86[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v86;
  *(_DWORD *)(a2 + 17) = v85;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v85 + 3);
  *(unsigned char *)(a2 + 55) = v99;
  *(_DWORD *)(a2 + 51) = v98;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v97[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v97;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v96[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v96;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v95[3];
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v95;
  *(unsigned char *)(a2 + 159) = v94;
  *(_DWORD *)(a2 + 155) = v93;
  *(_DWORD *)(a2 + 164) = *(_DWORD *)&v92[3];
  *(_DWORD *)(a2 + 161) = *(_DWORD *)v92;
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v91;
  *(_DWORD *)(a2 + 220) = *(_DWORD *)&v90[3];
  *(_DWORD *)(a2 + 217) = *(_DWORD *)v90;
  *(_DWORD *)(a2 + 244) = *(_DWORD *)&v89[3];
  *(_DWORD *)(a2 + 241) = *(_DWORD *)v89;
  *(unsigned char *)(a2 + 279) = v88;
  *(void *)(a2 + 40) = v75;
  *(unsigned char *)(a2 + 56) = v74;
  *(unsigned char *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 120) = v68;
  *(void *)(a2 + 144) = v67;
  *(unsigned char *)(a2 + 152) = 0;
  *(_WORD *)(a2 + 273) = 256;
  *(_WORD *)(a2 + 49) = 256;
  *(_WORD *)(a2 + 153) = 256;
  *(unsigned char *)(a2 + 160) = v69;
  *(unsigned char *)(a2 + 200) = 0;
  *(void *)(a2 + 208) = v66;
  *(unsigned char *)(a2 + 216) = 0;
  *(unsigned char *)(a2 + 240) = v57 & 1;
  *(void *)(a2 + 264) = v58;
  *(unsigned char *)(a2 + 272) = 0;
  *(unsigned char *)(a2 + 280) = v45;
  *(unsigned char *)(a2 + 320) = 0;
  *(void *)a2 = v83;
  *(void *)(a2 + 8) = v82;
  *(unsigned char *)(a2 + 16) = v76;
  *(void *)(a2 + 24) = v81;
  *(void *)(a2 + 32) = KeyPath;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = v20;
  *(void *)(a2 + 80) = v22;
  *(void *)(a2 + 88) = v24;
  *(void *)(a2 + 104) = v73;
  *(void *)(a2 + 112) = v72;
  *(void *)(a2 + 128) = v71;
  *(void *)(a2 + 136) = v70;
  *(void *)(a2 + 168) = v38;
  *(void *)(a2 + 176) = v40;
  *(void *)(a2 + 184) = v42;
  *(void *)(a2 + 192) = v44;
  *(void *)(a2 + 224) = v78;
  *(void *)(a2 + 232) = v65;
  *(void *)(a2 + 248) = v64;
  *(void *)(a2 + 256) = v79;
  *(void *)(a2 + 288) = v59;
  *(void *)(a2 + 296) = v60;
  *(void *)(a2 + 304) = v61;
  *(void *)(a2 + 312) = v62;
  sub_24F3C3738(v83, v82, v76);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3738(v73, v72, v68);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3738(v78, v65, v57 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F3C3850(v78, v65, v57 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24F3C3850(v73, v72, v68);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24F3C3850(v83, v82, v76);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24F3E070C()
{
  unint64_t result = qword_269A0C380;
  if (!qword_269A0C380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A0C370);
    sub_24F3C4528(&qword_269A0C388, &qword_269A0C390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C380);
  }
  return result;
}

uint64_t sub_24F3E07AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24F3E07F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24F3E07FC()
{
  uint64_t result = type metadata accessor for LockupView.Layout();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PreviousPlanDetail();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_24F3E08D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(void *)(a1 + 48) = a2[6];
    uint64_t v8 = (int *)type metadata accessor for LockupView.Layout();
    uint64_t v9 = v8[14];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_24F3E3150();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    *(void *)((char *)v4 + v8[15]) = *(uint64_t *)((char *)a2 + v8[15]);
    *(void *)((char *)v4 + v8[16]) = *(uint64_t *)((char *)a2 + v8[16]);
    uint64_t v13 = *(int *)(a3 + 36);
    uint64_t v14 = (void *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 8);
    void *v14 = *(uint64_t *)((char *)a2 + v13);
    v14[1] = v16;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v13 + 24);
    v14[2] = *(uint64_t *)((char *)a2 + v13 + 16);
    v14[3] = v17;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v13 + 40);
    v14[4] = *(uint64_t *)((char *)a2 + v13 + 32);
    v14[5] = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v13 + 56);
    v14[6] = *(uint64_t *)((char *)a2 + v13 + 48);
    v14[7] = v19;
    uint64_t v20 = (int *)type metadata accessor for PreviousPlanDetail();
    uint64_t v21 = v20[8];
    uint64_t v33 = v15 + v21;
    char v35 = (char *)v14 + v21;
    uint64_t v22 = sub_24F3E30D0();
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31(v35, v33, v22);
    *(void *)((char *)v14 + v20[9]) = *(void *)(v15 + v20[9]);
    *(void *)((char *)v14 + v20[10]) = *(void *)(v15 + v20[10]);
    *(void *)((char *)v14 + v20[11]) = *(void *)(v15 + v20[11]);
    *((unsigned char *)v14 + v20[12]) = *(unsigned char *)(v15 + v20[12]);
    *(void *)((char *)v14 + v20[13]) = *(void *)(v15 + v20[13]);
    uint64_t v23 = v20[14];
    uint64_t v34 = v15 + v23;
    uint64_t v36 = (char *)v14 + v23;
    uint64_t v24 = sub_24F3E3100();
    char v32 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32(v36, v34, v24);
    *(void *)((char *)v14 + v20[15]) = *(void *)(v15 + v20[15]);
    uint64_t v25 = *(int *)(a3 + 40);
    uint64_t v26 = (void *)((char *)v4 + v25);
    uint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for LockupView.Layout()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F3E0B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(type metadata accessor for LockupView.Layout() + 56);
  uint64_t v5 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for PreviousPlanDetail();
  uint64_t v8 = v6 + *(int *)(v7 + 32);
  uint64_t v9 = sub_24F3E30D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v6 + *(int *)(v7 + 56);
  uint64_t v11 = sub_24F3E3100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  return swift_release();
}

uint64_t sub_24F3E0D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = (int *)type metadata accessor for LockupView.Layout();
  uint64_t v8 = v7[14];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  *(void *)(a1 + v7[15]) = *(void *)(a2 + v7[15]);
  *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 8);
  *uint64_t v13 = *(void *)(a2 + v12);
  v13[1] = v15;
  uint64_t v16 = *(void *)(a2 + v12 + 24);
  v13[2] = *(void *)(a2 + v12 + 16);
  v13[3] = v16;
  uint64_t v17 = *(void *)(a2 + v12 + 40);
  v13[4] = *(void *)(a2 + v12 + 32);
  v13[5] = v17;
  uint64_t v18 = *(void *)(a2 + v12 + 56);
  v13[6] = *(void *)(a2 + v12 + 48);
  v13[7] = v18;
  uint64_t v19 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v20 = v19[8];
  uint64_t v31 = v14 + v20;
  uint64_t v33 = (char *)v13 + v20;
  uint64_t v21 = sub_24F3E30D0();
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29(v33, v31, v21);
  *(void *)((char *)v13 + v19[9]) = *(void *)(v14 + v19[9]);
  *(void *)((char *)v13 + v19[10]) = *(void *)(v14 + v19[10]);
  *(void *)((char *)v13 + v19[11]) = *(void *)(v14 + v19[11]);
  *((unsigned char *)v13 + v19[12]) = *(unsigned char *)(v14 + v19[12]);
  *(void *)((char *)v13 + v19[13]) = *(void *)(v14 + v19[13]);
  uint64_t v22 = v19[14];
  uint64_t v32 = v14 + v22;
  uint64_t v34 = (char *)v13 + v22;
  uint64_t v23 = sub_24F3E3100();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30(v34, v32, v23);
  *(void *)((char *)v13 + v19[15]) = *(void *)(v14 + v19[15]);
  uint64_t v24 = *(int *)(a3 + 40);
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  return a1;
}

void *sub_24F3E0F68(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  uint64_t v6 = (int *)type metadata accessor for LockupView.Layout();
  uint64_t v7 = v6[14];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24F3E3150();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)((char *)a1 + v6[15]) = *(void *)((char *)a2 + v6[15]);
  *(void *)((char *)a1 + v6[16]) = *(void *)((char *)a2 + v6[16]);
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *(void *)((char *)a2 + v11);
  v12[1] = *(void *)((char *)a2 + v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _DWORD v12[2] = v13[2];
  v12[3] = v13[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12[4] = v13[4];
  v12[5] = v13[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12[6] = v13[6];
  v12[7] = v13[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v15 = v14[8];
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = (char *)v13 + v15;
  uint64_t v18 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(void *)((char *)v12 + v14[9]) = *(void *)((char *)v13 + v14[9]);
  *(void *)((char *)v12 + v14[10]) = *(void *)((char *)v13 + v14[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v12 + v14[11]) = *(void *)((char *)v13 + v14[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)v12 + v14[12]) = *((unsigned char *)v13 + v14[12]);
  *(void *)((char *)v12 + v14[13]) = *(void *)((char *)v13 + v14[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = v14[14];
  uint64_t v20 = (char *)v12 + v19;
  uint64_t v21 = (char *)v13 + v19;
  uint64_t v22 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  *(void *)((char *)v12 + v14[15]) = *(void *)((char *)v13 + v14[15]);
  uint64_t v23 = *(int *)(a3 + 40);
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24F3E1218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = (int *)type metadata accessor for LockupView.Layout();
  uint64_t v8 = v7[14];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(void *)(a1 + v7[15]) = *(void *)(a2 + v7[15]);
  *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = (_OWORD *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  long long v15 = *(_OWORD *)(a2 + v12 + 16);
  *uint64_t v13 = *(_OWORD *)(a2 + v12);
  v13[1] = v15;
  long long v16 = *(_OWORD *)(a2 + v12 + 48);
  v13[2] = *(_OWORD *)(a2 + v12 + 32);
  v13[3] = v16;
  uint64_t v17 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v18 = v17[8];
  uint64_t v19 = (char *)v13 + v18;
  uint64_t v20 = v14 + v18;
  uint64_t v21 = sub_24F3E30D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  *(void *)((char *)v13 + v17[9]) = *(void *)(v14 + v17[9]);
  *(void *)((char *)v13 + v17[10]) = *(void *)(v14 + v17[10]);
  *(void *)((char *)v13 + v17[11]) = *(void *)(v14 + v17[11]);
  *((unsigned char *)v13 + v17[12]) = *(unsigned char *)(v14 + v17[12]);
  *(void *)((char *)v13 + v17[13]) = *(void *)(v14 + v17[13]);
  uint64_t v22 = v17[14];
  uint64_t v23 = (char *)v13 + v22;
  uint64_t v24 = v14 + v22;
  uint64_t v25 = sub_24F3E3100();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  *(void *)((char *)v13 + v17[15]) = *(void *)(v14 + v17[15]);
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_24F3E13F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = (int *)type metadata accessor for LockupView.Layout();
  uint64_t v8 = v7[14];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)(a1 + v7[15]) = *(void *)(a2 + v7[15]);
  *(void *)(a1 + v7[16]) = *(void *)(a2 + v7[16]);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = *(void *)(a2 + v12 + 8);
  *uint64_t v13 = *(void *)(a2 + v12);
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = v14[3];
  v13[2] = v14[2];
  v13[3] = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = v14[5];
  v13[4] = v14[4];
  v13[5] = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = v14[7];
  v13[6] = v14[6];
  v13[7] = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = (int *)type metadata accessor for PreviousPlanDetail();
  uint64_t v20 = v19[8];
  uint64_t v21 = (char *)v13 + v20;
  uint64_t v22 = (char *)v14 + v20;
  uint64_t v23 = sub_24F3E30D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  *(void *)((char *)v13 + v19[9]) = *(void *)((char *)v14 + v19[9]);
  *(void *)((char *)v13 + v19[10]) = *(void *)((char *)v14 + v19[10]);
  swift_bridgeObjectRelease();
  *(void *)((char *)v13 + v19[11]) = *(void *)((char *)v14 + v19[11]);
  swift_bridgeObjectRelease();
  *((unsigned char *)v13 + v19[12]) = *((unsigned char *)v14 + v19[12]);
  *(void *)((char *)v13 + v19[13]) = *(void *)((char *)v14 + v19[13]);
  swift_bridgeObjectRelease();
  uint64_t v24 = v19[14];
  uint64_t v25 = (char *)v13 + v24;
  uint64_t v26 = (char *)v14 + v24;
  uint64_t v27 = sub_24F3E3100();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  *(void *)((char *)v13 + v19[15]) = *(void *)((char *)v14 + v19[15]);
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  swift_release();
  return a1;
}

uint64_t sub_24F3E161C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3E1630);
}

uint64_t sub_24F3E1630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LockupView.Layout();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for PreviousPlanDetail();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 40));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_24F3E1748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3E175C);
}

uint64_t sub_24F3E175C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LockupView.Layout();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = type metadata accessor for PreviousPlanDetail();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 36);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24F3E1870()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F3E19AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t sub_24F3E19B4()
{
  uint64_t result = sub_24F3E3150();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24F3E1A64(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(void *)(a1 + 48) = a2[6];
    uint64_t v8 = a3[14];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_24F3E3150();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[16];
    *(void *)((char *)v4 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    *(void *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
  }
  return v4;
}

uint64_t sub_24F3E1B64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 56);
  uint64_t v3 = sub_24F3E3150();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

uint64_t sub_24F3E1BCC(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[14];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

void *sub_24F3E1C7C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  uint64_t v6 = a3[14];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24F3E3150();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  return a1;
}

uint64_t sub_24F3E1D50(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[14];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t sub_24F3E1E00(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[14];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24F3E3150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t sub_24F3E1EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F3E1EC4);
}

uint64_t sub_24F3E1EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 56);
  uint64_t v5 = sub_24F3E3150();
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_24F3E1F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F3E1F48);
}

uint64_t sub_24F3E1F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 56);
  uint64_t v6 = sub_24F3E3150();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_24F3E1FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24F3E3240();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24F3E1FF0()
{
  return sub_24F3E3250();
}

BOOL static HandoffAlertIconState.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t HandoffAlertIconState.hash(into:)()
{
  return sub_24F3E38E0();
}

uint64_t sub_24F3E2058()
{
  if (*v0) {
    return 0x656D7269666E6F63;
  }
  else {
    return 0x4F6D7269666E6F63;
  }
}

uint64_t sub_24F3E20A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3E2690(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3E20CC(uint64_t a1)
{
  unint64_t v2 = sub_24F3E252C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3E2108(uint64_t a1)
{
  unint64_t v2 = sub_24F3E252C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3E2144(uint64_t a1)
{
  unint64_t v2 = sub_24F3E25D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3E2180(uint64_t a1)
{
  unint64_t v2 = sub_24F3E25D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3E21BC(uint64_t a1)
{
  unint64_t v2 = sub_24F3E2580();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3E21F8(uint64_t a1)
{
  unint64_t v2 = sub_24F3E2580();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HandoffAlertIconState.hashValue.getter()
{
  return sub_24F3E3900();
}

uint64_t HandoffAlertIconState.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C4A0);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C4A8);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C4B0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3E252C();
  sub_24F3E3920();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24F3E2580();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24F3E25D4();
    sub_24F3E3850();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24F3E252C()
{
  unint64_t result = qword_269A0C4B8;
  if (!qword_269A0C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4B8);
  }
  return result;
}

unint64_t sub_24F3E2580()
{
  unint64_t result = qword_269A0C4C0;
  if (!qword_269A0C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4C0);
  }
  return result;
}

unint64_t sub_24F3E25D4()
{
  unint64_t result = qword_269A0C4C8;
  if (!qword_269A0C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4C8);
  }
  return result;
}

uint64_t HandoffAlertIconState.init(from:)(uint64_t a1)
{
  return sub_24F3E27B4(a1) & 1;
}

uint64_t sub_24F3E2644@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24F3E27B4(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24F3E2674(void *a1)
{
  return HandoffAlertIconState.encode(to:)(a1, *v1);
}

uint64_t sub_24F3E2690(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4F6D7269666E6F63 && a2 == 0xEF6563697665446ELL;
  if (v2 || (sub_24F3E38C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D7269666E6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F3E38C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F3E27B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C510);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A0C518);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A0C520);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24F3E252C();
  uint64_t v12 = v26;
  sub_24F3E3910();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24F3E3840();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24F3E37C0();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A0BC00);
    void *v18 = &type metadata for HandoffAlertIconState;
    sub_24F3E37E0();
    sub_24F3E37B0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_24F3E2580();
    sub_24F3E37D0();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24F3E25D4();
    sub_24F3E37D0();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24F3E2C08()
{
  unint64_t result = qword_269A0C4D0;
  if (!qword_269A0C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState()
{
  return &type metadata for HandoffAlertIconState;
}

unsigned char *_s18FitnessWorkoutPlan21HandoffAlertIconStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3E2D3CLL);
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

ValueMetadata *type metadata accessor for HandoffAlertIconState.CodingKeys()
{
  return &type metadata for HandoffAlertIconState.CodingKeys;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState.ConfirmOnDeviceCodingKeys()
{
  return &type metadata for HandoffAlertIconState.ConfirmOnDeviceCodingKeys;
}

ValueMetadata *type metadata accessor for HandoffAlertIconState.ConfirmedCodingKeys()
{
  return &type metadata for HandoffAlertIconState.ConfirmedCodingKeys;
}

unint64_t sub_24F3E2D98()
{
  unint64_t result = qword_269A0C4D8;
  if (!qword_269A0C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4D8);
  }
  return result;
}

unint64_t sub_24F3E2DF0()
{
  unint64_t result = qword_269A0C4E0;
  if (!qword_269A0C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4E0);
  }
  return result;
}

unint64_t sub_24F3E2E48()
{
  unint64_t result = qword_269A0C4E8;
  if (!qword_269A0C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4E8);
  }
  return result;
}

unint64_t sub_24F3E2EA0()
{
  unint64_t result = qword_269A0C4F0;
  if (!qword_269A0C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4F0);
  }
  return result;
}

unint64_t sub_24F3E2EF8()
{
  unint64_t result = qword_269A0C4F8;
  if (!qword_269A0C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C4F8);
  }
  return result;
}

unint64_t sub_24F3E2F50()
{
  unint64_t result = qword_269A0C500;
  if (!qword_269A0C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C500);
  }
  return result;
}

unint64_t sub_24F3E2FA8()
{
  unint64_t result = qword_269A0C508;
  if (!qword_269A0C508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A0C508);
  }
  return result;
}

uint64_t sub_24F3E3010()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24F3E3020()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_24F3E3030()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24F3E3040()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24F3E3050()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_24F3E3060()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_24F3E3070()
{
  return MEMORY[0x270EF0600]();
}

uint64_t sub_24F3E3080()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_24F3E3090()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_24F3E30A0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24F3E30B0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24F3E30C0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24F3E30D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F3E30E0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24F3E30F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24F3E3100()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24F3E3110()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24F3E3120()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24F3E3130()
{
  return MEMORY[0x270F2B010]();
}

uint64_t sub_24F3E3140()
{
  return MEMORY[0x270F2B028]();
}

uint64_t sub_24F3E3150()
{
  return MEMORY[0x270F2B050]();
}

uint64_t sub_24F3E3160()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24F3E3170()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24F3E3180()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24F3E3190()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24F3E31A0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24F3E31B0()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24F3E31C0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24F3E31D0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24F3E31E0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_24F3E31F0()
{
  return MEMORY[0x270F00560]();
}

uint64_t sub_24F3E3200()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_24F3E3210()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24F3E3220()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24F3E3230()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24F3E3240()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24F3E3250()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24F3E3260()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24F3E3270()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24F3E3280()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24F3E3290()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24F3E32A0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24F3E32B0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24F3E32C0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24F3E32D0()
{
  return MEMORY[0x270F2B228]();
}

uint64_t sub_24F3E32E0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24F3E32F0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24F3E3300()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24F3E3310()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24F3E3320()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24F3E3330()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24F3E3340()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24F3E3350()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24F3E3360()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24F3E3370()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24F3E3380()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24F3E3390()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24F3E33A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24F3E33B0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24F3E33C0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24F3E33D0()
{
  return MEMORY[0x270F03430]();
}

uint64_t sub_24F3E33E0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24F3E33F0()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_24F3E3400()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24F3E3410()
{
  return MEMORY[0x270F03F98]();
}

uint64_t sub_24F3E3420()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24F3E3430()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_24F3E3440()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_24F3E3450()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24F3E3460()
{
  return MEMORY[0x270F041C8]();
}

uint64_t sub_24F3E3470()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24F3E3480()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24F3E3490()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24F3E34A0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24F3E34B0()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24F3E34C0()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24F3E34D0()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24F3E34E0()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24F3E34F0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24F3E3500()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_24F3E3510()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_24F3E3520()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_24F3E3530()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_24F3E3540()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_24F3E3550()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24F3E3560()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24F3E3570()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24F3E3590()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F3E35A0()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F3E35B0()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24F3E35C0()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24F3E35D0()
{
  return MEMORY[0x270F253D0]();
}

uint64_t sub_24F3E35E0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24F3E35F0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24F3E3600()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24F3E3610()
{
  return MEMORY[0x270EF18E0]();
}

uint64_t sub_24F3E3620()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_24F3E3630()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24F3E3640()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24F3E3650()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24F3E3660()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24F3E3670()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24F3E3680()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24F3E3690()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_24F3E36A0()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24F3E36B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F3E36C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24F3E36D0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24F3E36E0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24F3E36F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24F3E3700()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F3E3720()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F3E3730()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F3E3740()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F3E3750()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_24F3E3760()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_24F3E3770()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24F3E3780()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F3E3790()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F3E37A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24F3E37B0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F3E37C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F3E37D0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F3E37E0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F3E37F0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24F3E3800()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F3E3810()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F3E3820()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24F3E3830()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F3E3840()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F3E3850()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F3E3860()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24F3E3870()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F3E3880()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F3E3890()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24F3E38A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F3E38B0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24F3E38C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F3E38D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F3E38E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F3E38F0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24F3E3900()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F3E3910()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F3E3920()
{
  return MEMORY[0x270F9FD98]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
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