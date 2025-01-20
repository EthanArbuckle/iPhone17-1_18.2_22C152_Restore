unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

BOOL static SiriState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F3643D4()
{
  return 0;
}

uint64_t sub_24F3643E0()
{
  return 0;
}

void sub_24F3643EC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F3643F8(uint64_t a1)
{
  unint64_t v2 = sub_24F3649C0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F364434(uint64_t a1)
{
  unint64_t v2 = sub_24F3649C0();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24F364470(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F36448C()
{
  return sub_24F36C5B0();
}

uint64_t sub_24F3644BC()
{
  if (*v0) {
    return 0x657669746361;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_24F3644EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3654E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F364514(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F364520(uint64_t a1)
{
  unint64_t v2 = sub_24F36496C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F36455C(uint64_t a1)
{
  unint64_t v2 = sub_24F36496C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F364598@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24F3645C8(uint64_t a1)
{
  unint64_t v2 = sub_24F364A14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F364604(uint64_t a1)
{
  unint64_t v2 = sub_24F364A14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001A0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001A8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001B0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F36496C();
  sub_24F36C5F0();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F3649C0();
    v14 = v18;
    sub_24F36C550();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F364A14();
    sub_24F36C550();
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

unint64_t sub_24F36496C()
{
  unint64_t result = qword_269A001B8;
  if (!qword_269A001B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A001B8);
  }
  return result;
}

unint64_t sub_24F3649C0()
{
  unint64_t result = qword_269A001C0;
  if (!qword_269A001C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A001C0);
  }
  return result;
}

unint64_t sub_24F364A14()
{
  unint64_t result = qword_269A001C8;
  if (!qword_269A001C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A001C8);
  }
  return result;
}

uint64_t SiriState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001D0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001D8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A001E0);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F36496C();
  v11 = v32;
  sub_24F36C5E0();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_24F36C540();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F36C4D0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A001E8);
    *char v22 = &type metadata for SiriState;
    sub_24F36C500();
    sub_24F36C4C0();
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
    sub_24F3649C0();
    v18 = v14;
    sub_24F36C4F0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F364A14();
    sub_24F36C4F0();
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

uint64_t sub_24F364F10@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SiriState.init(from:)(a1, a2);
}

uint64_t sub_24F364F28(void *a1)
{
  return SiriState.encode(to:)(a1);
}

uint64_t SiriState.hash(into:)()
{
  return sub_24F36C5B0();
}

uint64_t SiriState.hashValue.getter()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F364FB4()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F364FFC()
{
  return sub_24F36C5D0();
}

unint64_t sub_24F365044()
{
  unint64_t result = qword_269A001F0;
  if (!qword_269A001F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A001F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriState()
{
  return &type metadata for SiriState;
}

uint64_t getEnumTagSinglePayload for SiriSessionFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18FitnessSiriSession9SiriStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F365210);
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

uint64_t sub_24F365238(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F365240(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriState.CodingKeys()
{
  return &type metadata for SiriState.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriState.IdleCodingKeys()
{
  return &type metadata for SiriState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for SiriState.ActiveCodingKeys()
{
  return &type metadata for SiriState.ActiveCodingKeys;
}

unint64_t sub_24F365280()
{
  unint64_t result = qword_269A001F8;
  if (!qword_269A001F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A001F8);
  }
  return result;
}

unint64_t sub_24F3652D8()
{
  unint64_t result = qword_269A00200;
  if (!qword_269A00200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00200);
  }
  return result;
}

unint64_t sub_24F365330()
{
  unint64_t result = qword_269A00208;
  if (!qword_269A00208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00208);
  }
  return result;
}

unint64_t sub_24F365388()
{
  unint64_t result = qword_269A00210;
  if (!qword_269A00210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00210);
  }
  return result;
}

unint64_t sub_24F3653E0()
{
  unint64_t result = qword_269A00218;
  if (!qword_269A00218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00218);
  }
  return result;
}

unint64_t sub_24F365438()
{
  unint64_t result = qword_269A00220;
  if (!qword_269A00220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00220);
  }
  return result;
}

unint64_t sub_24F365490()
{
  unint64_t result = qword_269A00228;
  if (!qword_269A00228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00228);
  }
  return result;
}

uint64_t sub_24F3654E4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_24F36C590() & 1) != 0)
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
    char v6 = sub_24F36C590();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t static SiriConstants.startWorkoutCandidateData.getter()
{
  return 0x74616469646E6163;
}

unint64_t static SiriConstants.startWorkoutPersonalizationMethod.getter()
{
  return 0xD000000000000015;
}

unint64_t static SiriConstants.startWorkoutHealthKitActivityType.getter()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for SiriConstants()
{
  return &type metadata for SiriConstants;
}

uint64_t SiriBeginSessionCriteria.healthKitActivityType.getter()
{
  return *(void *)v0;
}

uint64_t SiriBeginSessionCriteria.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriBeginSessionCriteria.personalizationMethod.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t SiriBeginSessionCriteria.init(healthKitActivityType:candidates:personalizationMethod:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = a2 & 1;
  *(void *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 24) = a4;
  return result;
}

BOOL sub_24F36566C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24F365680()
{
  unint64_t v1 = 0x74616469646E6163;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000015;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_24F3656E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F366C68(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F365708(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F365714(uint64_t a1)
{
  unint64_t v2 = sub_24F3659A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F365750(uint64_t a1)
{
  unint64_t v2 = sub_24F3659A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriBeginSessionCriteria.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00230);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + 16);
  int v14 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3659A0();
  sub_24F36C5F0();
  char v18 = 0;
  uint64_t v7 = v12;
  sub_24F36C560();
  if (!v7)
  {
    char v8 = v14;
    uint64_t v13 = v11;
    char v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A00240);
    sub_24F365D60(&qword_269A00248, (void (*)(void))sub_24F365A3C);
    sub_24F36C580();
    char v16 = v8;
    char v15 = 2;
    sub_24F365A90();
    sub_24F36C580();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F3659A0()
{
  unint64_t result = qword_269A00238;
  if (!qword_269A00238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00238);
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

unint64_t sub_24F365A3C()
{
  unint64_t result = qword_269A00250;
  if (!qword_269A00250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00250);
  }
  return result;
}

unint64_t sub_24F365A90()
{
  unint64_t result = qword_269A00258;
  if (!qword_269A00258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00258);
  }
  return result;
}

uint64_t SiriBeginSessionCriteria.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00260);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3659A0();
  sub_24F36C5E0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v19 = 0;
  uint64_t v9 = sub_24F36C510();
  char v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A00240);
  char v18 = 1;
  sub_24F365D60(&qword_269A00268, (void (*)(void))sub_24F365DD0);
  sub_24F36C530();
  uint64_t v12 = v15[1];
  char v16 = 2;
  sub_24F365E24();
  v15[0] = v12;
  swift_bridgeObjectRetain();
  sub_24F36C530();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v13 = v17;
  *(void *)a2 = v9;
  *(unsigned char *)(a2 + 8) = v11 & 1;
  *(void *)(a2 + 16) = v15[0];
  *(unsigned char *)(a2 + 24) = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F365D60(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A00240);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24F365DD0()
{
  unint64_t result = qword_269A00270;
  if (!qword_269A00270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00270);
  }
  return result;
}

unint64_t sub_24F365E24()
{
  unint64_t result = qword_269A00278;
  if (!qword_269A00278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00278);
  }
  return result;
}

uint64_t sub_24F365E78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriBeginSessionCriteria.init(from:)(a1, a2);
}

uint64_t sub_24F365E90(void *a1)
{
  return SiriBeginSessionCriteria.encode(to:)(a1);
}

uint64_t SiriBeginSessionCriteria.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(unsigned char *)(v1 + 8) == 1)
  {
    sub_24F36C5C0();
  }
  else
  {
    sub_24F36C5C0();
    sub_24F36C5B0();
  }
  swift_bridgeObjectRetain();
  sub_24F3664D0(a1, v3);
  swift_bridgeObjectRelease();
  sub_24F36C420();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F365F60(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v31 = result;
  uint64_t v32 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v33 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
  while (2)
  {
    unint64_t v9 = __clz(__rbit64(v7));
    uint64_t v10 = (v7 - 1) & v7;
    unint64_t v11 = v9 | (v3 << 6);
LABEL_24:
    uint64_t v15 = *(void *)(result + 48) + 24 * v11;
    uint64_t v17 = *(void *)v15;
    uint64_t v16 = *(void *)(v15 + 8);
    int v18 = *(unsigned __int8 *)(v15 + 16);
    sub_24F36C5A0();
    swift_bridgeObjectRetain();
    sub_24F36C420();
    unint64_t v34 = v10;
    int64_t v35 = v3;
    sub_24F36C420();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_24F36C5D0();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
    {
LABEL_54:
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v22 = ~v20;
    while (1)
    {
      uint64_t v25 = *(void *)(a2 + 48) + 24 * v21;
      int v26 = *(unsigned __int8 *)(v25 + 16);
      BOOL v27 = *(void *)v25 == v17 && *(void *)(v25 + 8) == v16;
      if (!v27 && (sub_24F36C590() & 1) == 0) {
        goto LABEL_29;
      }
      if (v26) {
        break;
      }
      unint64_t v28 = 0xE500000000000000;
      uint64_t v29 = 0x6E61656C63;
      if (!v18) {
        goto LABEL_26;
      }
LABEL_42:
      if (v18 == 1) {
        uint64_t v30 = 0x746963696C707865;
      }
      else {
        uint64_t v30 = 0x6669636570736E75;
      }
      if (v18 == 1) {
        unint64_t v23 = 0xE800000000000000;
      }
      else {
        unint64_t v23 = 0xEB00000000646569;
      }
      if (v29 == v30) {
        goto LABEL_27;
      }
LABEL_28:
      char v24 = sub_24F36C590();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_51;
      }
LABEL_29:
      unint64_t v21 = (v21 + 1) & v22;
      if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
        goto LABEL_54;
      }
    }
    if (v26 == 1)
    {
      unint64_t v28 = 0xE800000000000000;
      uint64_t v29 = 0x746963696C707865;
      if (!v18) {
        goto LABEL_26;
      }
      goto LABEL_42;
    }
    uint64_t v29 = 0x6669636570736E75;
    unint64_t v28 = 0xEB00000000646569;
    if (v18) {
      goto LABEL_42;
    }
LABEL_26:
    unint64_t v23 = 0xE500000000000000;
    if (v29 != 0x6E61656C63) {
      goto LABEL_28;
    }
LABEL_27:
    if (v28 != v23) {
      goto LABEL_28;
    }
    swift_bridgeObjectRelease_n();
LABEL_51:
    swift_bridgeObjectRelease();
    unint64_t result = v31;
    unint64_t v7 = v34;
    int64_t v3 = v35;
    if (v34) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_57;
  }
  if (v12 >= v33) {
    return 1;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v12);
  ++v3;
  if (v13) {
    goto LABEL_23;
  }
  int64_t v3 = v12 + 1;
  if (v12 + 1 >= v33) {
    return 1;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v3);
  if (v13) {
    goto LABEL_23;
  }
  int64_t v3 = v12 + 2;
  if (v12 + 2 >= v33) {
    return 1;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v3);
  if (v13) {
    goto LABEL_23;
  }
  int64_t v3 = v12 + 3;
  if (v12 + 3 >= v33) {
    return 1;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v3);
  if (v13) {
    goto LABEL_23;
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v33) {
    return 1;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13)
  {
    int64_t v3 = v14;
LABEL_23:
    uint64_t v10 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v3 << 6);
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v3 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v3 >= v33) {
      return 1;
    }
    unint64_t v13 = *(void *)(v32 + 8 * v3);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_57:
  __break(1u);
  return result;
}

uint64_t SiriBeginSessionCriteria.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  sub_24F36C5A0();
  sub_24F36C5C0();
  if (v1 != 1) {
    sub_24F36C5B0();
  }
  swift_bridgeObjectRetain();
  sub_24F3664D0((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_24F36C420();
  swift_bridgeObjectRelease();
  return sub_24F36C5D0();
}

uint64_t sub_24F366410()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  sub_24F36C5A0();
  sub_24F36C5C0();
  if (v1 != 1) {
    sub_24F36C5B0();
  }
  swift_bridgeObjectRetain();
  sub_24F3664D0((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_24F36C420();
  swift_bridgeObjectRelease();
  return sub_24F36C5D0();
}

uint64_t sub_24F3664D0(uint64_t a1, uint64_t a2)
{
  sub_24F36C5D0();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_16;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_19;
    }
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_24F36C5B0();
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    if (!v13) {
      break;
    }
LABEL_15:
    uint64_t v6 = (v13 - 1) & v13;
LABEL_16:
    sub_24F36C5A0();
    swift_bridgeObjectRetain();
    sub_24F36C420();
    sub_24F36C420();
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_24F36C5D0();
    uint64_t result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  int64_t v14 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t _s18FitnessSiriSession0b5BeginC8CriteriaV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(char *)(a1 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(char *)(a2 + 24);
  if (v4)
  {
    if (!v7)
    {
LABEL_11:
      char v11 = 0;
      return v11 & 1;
    }
  }
  else
  {
    if (*(void *)a1 == *(void *)a2) {
      char v10 = v7;
    }
    else {
      char v10 = 1;
    }
    if (v10) {
      goto LABEL_11;
    }
  }
  if ((sub_24F365F60(v5, v8) & 1) == 0) {
    goto LABEL_11;
  }
  if (*(void *)&aLast_1[8 * v6] == *(void *)&aLast_1[8 * v9]) {
    char v11 = 1;
  }
  else {
    char v11 = sub_24F36C590();
  }
  swift_bridgeObjectRelease_n();
  return v11 & 1;
}

unint64_t sub_24F36678C()
{
  unint64_t result = qword_269A00280;
  if (!qword_269A00280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00280);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriBeginSessionCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriBeginSessionCriteria()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriBeginSessionCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriBeginSessionCriteria(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SiriBeginSessionCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriBeginSessionCriteria(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriBeginSessionCriteria(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriBeginSessionCriteria()
{
  return &type metadata for SiriBeginSessionCriteria;
}

uint64_t getEnumTagSinglePayload for ContentRating(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriBeginSessionCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F366B20);
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

unsigned char *sub_24F366B48(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriBeginSessionCriteria.CodingKeys()
{
  return &type metadata for SiriBeginSessionCriteria.CodingKeys;
}

unint64_t sub_24F366B64()
{
  unint64_t result = qword_269A00288;
  if (!qword_269A00288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00288);
  }
  return result;
}

unint64_t sub_24F366BBC()
{
  unint64_t result = qword_269A00290;
  if (!qword_269A00290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00290);
  }
  return result;
}

unint64_t sub_24F366C14()
{
  unint64_t result = qword_269A00298;
  if (!qword_269A00298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A00298);
  }
  return result;
}

uint64_t sub_24F366C68(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x800000024F36D920 || (sub_24F36C590() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365 || (sub_24F36C590() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024F36D900)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24F36C590();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

__n128 SiriSessionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SiriSessionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, unsigned char *a2, void **a3, uint64_t *a4)
{
  v59 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DD0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  int64_t v14 = (char *)&v52 - v13;
  uint64_t v15 = a4[2];
  uint64_t v17 = *v4;
  uint64_t v16 = v4[1];
  int v18 = (char *)v4[2];
  uint64_t v19 = v4[3];
  if (v15)
  {
    int v56 = *((unsigned __int8 *)a4 + 24);
    v58 = (char *)v7;
    int v55 = *((_DWORD *)a4 + 2);
    uint64_t v20 = *a4;
    uint64_t v53 = v19;
    uint64_t v54 = v20;
    uint64_t v21 = v16;
    uint64_t v22 = v18;
    uint64_t v23 = v17;
    char v24 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DD8);
    uint64_t v25 = &v11[v24[16]];
    v57 = &v11[v24[20]];
    int v26 = &v11[v24[24]];
    char v61 = 0;
    sub_24F36731C();
    swift_bridgeObjectRetain();
    sub_24F36C4B0();
    sub_24F36C490();
    uint64_t v27 = *MEMORY[0x263F39580];
    uint64_t v28 = sub_24F36C410();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v25, v27, v28);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v23;
    *(void *)(v29 + 24) = v21;
    uint64_t v31 = v53;
    uint64_t v30 = v54;
    *(void *)(v29 + 32) = v22;
    *(void *)(v29 + 40) = v31;
    *(void *)(v29 + 48) = v30;
    uint64_t v32 = v58;
    *(unsigned char *)(v29 + 56) = v55 & 1;
    *(void *)(v29 + 64) = v15;
    *(unsigned char *)(v29 + 72) = v56;
    *(void *)int v26 = &unk_269A002A8;
    *((void *)v26 + 1) = v29;
    uint64_t v33 = *MEMORY[0x263F39578];
    uint64_t v34 = sub_24F36C400();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v57, v33, v34);
    (*(void (**)(char *, void, char *))(v8 + 104))(v11, *MEMORY[0x263F39530], v32);
    int64_t v35 = *v59;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v35 = (void *)sub_24F36823C(0, v35[2] + 1, 1, v35);
    }
    unint64_t v37 = v35[2];
    unint64_t v36 = v35[3];
    if (v37 >= v36 >> 1) {
      int64_t v35 = (void *)sub_24F36823C(v36 > 1, v37 + 1, 1, v35);
    }
    v35[2] = v37 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, char *))(v8 + 32))((unint64_t)v35+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v37, v11, v32);
  }
  else
  {
    if (*a2) {
      return result;
    }
    *a2 = 1;
    uint64_t v38 = v19;
    uint64_t v39 = v16;
    v57 = v18;
    uint64_t v40 = v17;
    v41 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DD8);
    v58 = &v14[v41[16]];
    v42 = &v14[v41[20]];
    uint64_t v43 = v7;
    v44 = &v14[v41[24]];
    char v60 = 1;
    sub_24F36731C();
    sub_24F36C4B0();
    sub_24F36C490();
    uint64_t v45 = *MEMORY[0x263F39570];
    uint64_t v46 = sub_24F36C400();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v42, v45, v46);
    v47 = (void *)swift_allocObject();
    v47[2] = v40;
    v47[3] = v39;
    v47[4] = v57;
    v47[5] = v38;
    *(void *)v44 = &unk_269A002B8;
    *((void *)v44 + 1) = v47;
    uint64_t v48 = *MEMORY[0x263F39588];
    uint64_t v49 = sub_24F36C410();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v58, v48, v49);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v14, *MEMORY[0x263F39530], v43);
    int64_t v35 = *v59;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v35 = (void *)sub_24F36823C(0, v35[2] + 1, 1, v35);
    }
    unint64_t v51 = v35[2];
    unint64_t v50 = v35[3];
    if (v51 >= v50 >> 1) {
      int64_t v35 = (void *)sub_24F36823C(v50 > 1, v51 + 1, 1, v35);
    }
    v35[2] = v51 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))((unint64_t)v35+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v51, v14, v43);
  }
  *v59 = v35;
  return result;
}

unint64_t sub_24F36731C()
{
  unint64_t result = qword_26B1F0DB8;
  if (!qword_26B1F0DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DB8);
  }
  return result;
}

uint64_t sub_24F367370(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[20] = a1;
  v4[21] = sub_24F36C480();
  v4[22] = sub_24F36C470();
  uint64_t v8 = (uint64_t (*)(void *))((char *)a4 + *a4);
  unsigned int v6 = (void *)swift_task_alloc();
  v4[23] = v6;
  *unsigned int v6 = v4;
  v6[1] = sub_24F367478;
  return v8(v4 + 7);
}

uint64_t sub_24F367478()
{
  int v2 = (void *)*v1;
  v2[24] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F36C450();
  v2[25] = v4;
  v2[26] = v3;
  if (v0) {
    char v5 = sub_24F367C64;
  }
  else {
    char v5 = sub_24F3675D8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3675D8()
{
  uint64_t v1 = v0[10];
  int v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F36C4A0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F36C470();
  v0[27] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  unsigned int v6 = (void *)swift_task_alloc();
  v0[28] = (uint64_t)v6;
  *unsigned int v6 = v0;
  v6[1] = sub_24F3677C8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 12, v5, v7);
}

uint64_t sub_24F3677C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 208);
  uint64_t v3 = *(void *)(v1 + 200);
  return MEMORY[0x270FA2498](sub_24F36790C, v3, v2);
}

uint64_t sub_24F36790C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  *(void *)(v0 + 232) = v3;
  if (v3)
  {
    char v4 = *(unsigned char *)(v0 + 120);
    *(void *)(v0 + 128) = v1;
    *(void *)(v0 + 136) = v2 & 1;
    *(void *)(v0 + 144) = v3;
    *(unsigned char *)(v0 + 152) = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A002C0);
    *uint64_t v5 = v0;
    v5[1] = sub_24F367A34;
    return MEMORY[0x270F252C8](v0 + 128, v6);
  }
  else
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_24F367A34()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 208);
  uint64_t v3 = *(void *)(v1 + 200);
  return MEMORY[0x270FA2498](sub_24F367B78, v3, v2);
}

uint64_t sub_24F367B78()
{
  uint64_t v1 = sub_24F36C470();
  v0[27] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[28] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F3677C8;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 12, v1, v3);
}

uint64_t sub_24F367C64()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F367CC8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 48) = sub_24F36C480();
  *(void *)(v8 + 56) = sub_24F36C470();
  *(void *)(v8 + 16) = a6;
  *(unsigned char *)(v8 + 24) = a7 & 1;
  *(void *)(v8 + 32) = a8;
  *(unsigned char *)(v8 + 40) = v17;
  uint64_t v15 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 64) = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_24F367DFC;
  return v15(v8 + 16);
}

uint64_t sub_24F367DFC()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F36C450();
  if (v0) {
    char v4 = sub_24F367FA4;
  }
  else {
    char v4 = sub_24F367F40;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F367F40()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F367FA4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F368008()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 73, 7);
}

uint64_t sub_24F368050(uint64_t a1)
{
  char v4 = *(int **)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 64);
  char v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_24F368140;
  return sub_24F367CC8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24F368140()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

size_t sub_24F36823C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DF8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DD0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DD0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
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
  return (size_t)v13;
}

uint64_t sub_24F368418()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24F368458(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F368A5C;
  return sub_24F367370(a1, v4, v5, v6);
}

unint64_t sub_24F368518()
{
  unint64_t result = qword_26B1F0DB0;
  if (!qword_26B1F0DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DB0);
  }
  return result;
}

unint64_t sub_24F368570()
{
  unint64_t result = qword_26B1F0DA8;
  if (!qword_26B1F0DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DA8);
  }
  return result;
}

unint64_t sub_24F3685C8()
{
  unint64_t result = qword_26B1F0DC8;
  if (!qword_26B1F0DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DC8);
  }
  return result;
}

unint64_t sub_24F368620()
{
  unint64_t result = qword_26B1F0D60;
  if (!qword_26B1F0D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D60);
  }
  return result;
}

uint64_t destroy for SiriSessionEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SiriSessionEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SiriSessionEnvironment(void *a1, void *a2)
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

_OWORD *assignWithTake for SiriSessionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSessionEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSessionEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriSessionFeature()
{
  return &type metadata for SiriSessionFeature;
}

unsigned char *storeEnumTagSinglePayload for SiriSessionFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F368914);
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

ValueMetadata *type metadata accessor for SiriSessionFeature.TaskIdentifier()
{
  return &type metadata for SiriSessionFeature.TaskIdentifier;
}

unint64_t sub_24F368950()
{
  unint64_t result = qword_26B1F0DC0;
  if (!qword_26B1F0DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DC0);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
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

uint64_t SiriPersonalizationMethod.rawValue.getter(char a1)
{
  return *(void *)&aLast_2[8 * a1];
}

uint64_t sub_24F368A7C(char *a1, char *a2)
{
  if (*(void *)&aLast_2[8 * *a1] == *(void *)&aLast_2[8 * *a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_24F36C590();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_24F368AE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18FitnessSiriSession0B21PersonalizationMethodO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_24F368B14(void *a1@<X8>)
{
  *a1 = *(void *)&aLast_2[8 * *v1];
  a1[1] = 0xE400000000000000;
}

uint64_t sub_24F368B30()
{
  return sub_24F36C440();
}

uint64_t sub_24F368B90()
{
  return sub_24F36C430();
}

uint64_t sub_24F368BE0()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F368C3C()
{
  sub_24F36C420();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F368C7C()
{
  return sub_24F36C5D0();
}

uint64_t _s18FitnessSiriSession0B21PersonalizationMethodO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24F36C4E0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_24F368D24()
{
  unint64_t result = qword_269A002C8;
  if (!qword_269A002C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A002C8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SiriPersonalizationMethod(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F368E44);
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

ValueMetadata *type metadata accessor for SiriPersonalizationMethod()
{
  return &type metadata for SiriPersonalizationMethod;
}

unint64_t sub_24F368E7C()
{
  unint64_t result = qword_269A002D0;
  if (!qword_269A002D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A002D0);
  }
  return result;
}

void SiriSessionState.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *SiriSessionState.state.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*SiriSessionState.state.modify())()
{
  return nullsub_1;
}

FitnessSiriSession::SiriSessionState __swiftcall SiriSessionState.init(state:)(FitnessSiriSession::SiriSessionState state)
{
  unsigned char *v1 = *(unsigned char *)state.state;
  return state;
}

BOOL static SiriSessionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F368F2C()
{
  return 1;
}

uint64_t sub_24F368F34()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F368F78()
{
  return sub_24F36C5B0();
}

uint64_t sub_24F368FA0()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F368FE0()
{
  return 0x6574617473;
}

uint64_t sub_24F368FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F36C590();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F369084(uint64_t a1)
{
  unint64_t v2 = sub_24F369244();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3690C0(uint64_t a1)
{
  unint64_t v2 = sub_24F369244();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSessionState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A002D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F369244();
  sub_24F36C5F0();
  char v10 = v7;
  sub_24F369298();
  sub_24F36C580();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F369244()
{
  unint64_t result = qword_269A002E0;
  if (!qword_269A002E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A002E0);
  }
  return result;
}

unint64_t sub_24F369298()
{
  unint64_t result = qword_269A002E8;
  if (!qword_269A002E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A002E8);
  }
  return result;
}

uint64_t SiriSessionState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A002F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F369244();
  sub_24F36C5E0();
  if (!v2)
  {
    sub_24F369454();
    sub_24F36C530();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24F369454()
{
  unint64_t result = qword_269A002F8;
  if (!qword_269A002F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A002F8);
  }
  return result;
}

uint64_t sub_24F3694A8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SiriSessionState.init(from:)(a1, a2);
}

uint64_t sub_24F3694C0(void *a1)
{
  return SiriSessionState.encode(to:)(a1);
}

unsigned char *storeEnumTagSinglePayload for SiriSessionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3695A4);
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

ValueMetadata *type metadata accessor for SiriSessionState()
{
  return &type metadata for SiriSessionState;
}

uint64_t getEnumTagSinglePayload for SiriSessionState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriSessionState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3696CCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F3696F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriSessionState.CodingKeys()
{
  return &type metadata for SiriSessionState.CodingKeys;
}

unint64_t sub_24F369710()
{
  unint64_t result = qword_269A00300;
  if (!qword_269A00300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00300);
  }
  return result;
}

unint64_t sub_24F369768()
{
  unint64_t result = qword_269A00308;
  if (!qword_269A00308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00308);
  }
  return result;
}

unint64_t sub_24F3697C0()
{
  unint64_t result = qword_269A00310;
  if (!qword_269A00310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00310);
  }
  return result;
}

uint64_t sub_24F369814(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x746963696C707865;
    }
    else {
      uint64_t v3 = 0x6669636570736E75;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xEB00000000646569;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x746963696C707865;
      }
      else {
        uint64_t v6 = 0x6669636570736E75;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xEB00000000646569;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    uint64_t v3 = 0x6E61656C63;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x6E61656C63)
  {
LABEL_21:
    char v8 = sub_24F36C590();
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

uint64_t SiriStartWorkoutCandidate.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriStartWorkoutCandidate.contentRating.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

FitnessSiriSession::SiriStartWorkoutCandidate __swiftcall SiriStartWorkoutCandidate.init(identifier:contentRating:)(Swift::String identifier, FitnessSiriSession::ContentRating contentRating)
{
  *(Swift::String *)uint64_t v2 = identifier;
  *(unsigned char *)(v2 + 16) = contentRating;
  result.identifier = identifier;
  result.contentRating = contentRating;
  return result;
}

uint64_t sub_24F36997C()
{
  if (*v0) {
    return 0x52746E65746E6F63;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24F3699C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F36A85C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3699F0(uint64_t a1)
{
  unint64_t v2 = sub_24F369BF8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F369A2C(uint64_t a1)
{
  unint64_t v2 = sub_24F369BF8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriStartWorkoutCandidate.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00318);
  uint64_t v9 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F369BF8();
  sub_24F36C5F0();
  char v13 = 0;
  sub_24F36C570();
  if (!v2)
  {
    char v12 = v10;
    char v11 = 1;
    sub_24F369C4C();
    sub_24F36C580();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

unint64_t sub_24F369BF8()
{
  unint64_t result = qword_269A00320;
  if (!qword_269A00320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00320);
  }
  return result;
}

unint64_t sub_24F369C4C()
{
  unint64_t result = qword_269A00328;
  if (!qword_269A00328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00328);
  }
  return result;
}

uint64_t SiriStartWorkoutCandidate.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00330);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F369BF8();
  sub_24F36C5E0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v9 = sub_24F36C520();
  uint64_t v11 = v10;
  char v15 = 1;
  sub_24F369E9C();
  swift_bridgeObjectRetain();
  sub_24F36C530();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v12 = v16;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24F369E9C()
{
  unint64_t result = qword_269A00338;
  if (!qword_269A00338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00338);
  }
  return result;
}

uint64_t sub_24F369EF0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriStartWorkoutCandidate.init(from:)(a1, a2);
}

uint64_t sub_24F369F08(void *a1)
{
  return SiriStartWorkoutCandidate.encode(to:)(a1);
}

uint64_t SiriStartWorkoutCandidate.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24F36C420();
  swift_bridgeObjectRelease();
  sub_24F36C420();
  return swift_bridgeObjectRelease();
}

uint64_t static SiriStartWorkoutCandidate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = 0, (sub_24F36C590() & 1) != 0))
  {
    unint64_t v6 = 0xE800000000000000;
    uint64_t v7 = 0x746963696C707865;
    if (v2 != 1)
    {
      uint64_t v7 = 0x6669636570736E75;
      unint64_t v6 = 0xEB00000000646569;
    }
    if (v2) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0x6E61656C63;
    }
    if (v2) {
      unint64_t v9 = v6;
    }
    else {
      unint64_t v9 = 0xE500000000000000;
    }
    unint64_t v10 = 0xE800000000000000;
    uint64_t v11 = 0x746963696C707865;
    if (v3 != 1)
    {
      uint64_t v11 = 0x6669636570736E75;
      unint64_t v10 = 0xEB00000000646569;
    }
    if (v3) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0x6E61656C63;
    }
    if (v3) {
      unint64_t v13 = v10;
    }
    else {
      unint64_t v13 = 0xE500000000000000;
    }
    if (v8 == v12 && v9 == v13) {
      char v5 = 1;
    }
    else {
      char v5 = sub_24F36C590();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

uint64_t SiriStartWorkoutCandidate.hashValue.getter()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F36A1D0()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F36A294()
{
  sub_24F36C420();
  sub_24F36C420();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F36A338()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F36A3F8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(unsigned char *)(a1 + 16);
  unsigned __int8 v3 = *(unsigned char *)(a2 + 16);
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v4 && (sub_24F36C590() & 1) == 0) {
    return 0;
  }
  return sub_24F369814(v2, v3);
}

unint64_t sub_24F36A474()
{
  unint64_t result = qword_269A00340;
  if (!qword_269A00340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00340);
  }
  return result;
}

uint64_t destroy for SiriStartWorkoutCandidate()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18FitnessSiriSession25SiriStartWorkoutCandidateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriStartWorkoutCandidate(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriStartWorkoutCandidate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriStartWorkoutCandidate(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriStartWorkoutCandidate(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriStartWorkoutCandidate()
{
  return &type metadata for SiriStartWorkoutCandidate;
}

unsigned char *storeEnumTagSinglePayload for SiriStartWorkoutCandidate.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F36A71CLL);
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

ValueMetadata *type metadata accessor for SiriStartWorkoutCandidate.CodingKeys()
{
  return &type metadata for SiriStartWorkoutCandidate.CodingKeys;
}

unint64_t sub_24F36A758()
{
  unint64_t result = qword_269A00348;
  if (!qword_269A00348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00348);
  }
  return result;
}

unint64_t sub_24F36A7B0()
{
  unint64_t result = qword_269A00350;
  if (!qword_269A00350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00350);
  }
  return result;
}

unint64_t sub_24F36A808()
{
  unint64_t result = qword_269A00358;
  if (!qword_269A00358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00358);
  }
  return result;
}

uint64_t sub_24F36A85C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_24F36C590() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x52746E65746E6F63 && a2 == 0xED0000676E697461)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F36C590();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F36A980()
{
  return 0x6169726574697263;
}

uint64_t sub_24F36A998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6169726574697263 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F36C590();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F36AA30(uint64_t a1)
{
  unint64_t v2 = sub_24F36AF84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F36AA6C(uint64_t a1)
{
  unint64_t v2 = sub_24F36AF84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F36AAA8()
{
  if (*v0) {
    return 0xD000000000000015;
  }
  else {
    return 0x6570704177656976;
  }
}

uint64_t sub_24F36AAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F36BB5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F36AB18(uint64_t a1)
{
  unint64_t v2 = sub_24F36AF30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F36AB54(uint64_t a1)
{
  unint64_t v2 = sub_24F36AF30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F36AB90(uint64_t a1)
{
  unint64_t v2 = sub_24F36B02C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F36ABCC(uint64_t a1)
{
  unint64_t v2 = sub_24F36B02C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SiriSessionAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DE0);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DF0);
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0DE8);
  uint64_t v9 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v20 = *v1;
  uint64_t v21 = v12;
  int v22 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F36AF30();
  sub_24F36C5F0();
  if (v13)
  {
    LOBYTE(v26) = 1;
    sub_24F36AF84();
    uint64_t v14 = v25;
    sub_24F36C550();
    uint64_t v26 = v20;
    char v27 = v21 & 1;
    uint64_t v28 = v13;
    char v29 = v22;
    sub_24F36AFD8();
    uint64_t v15 = v24;
    sub_24F36C580();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v14);
  }
  else
  {
    LOBYTE(v26) = 0;
    sub_24F36B02C();
    uint64_t v17 = v25;
    sub_24F36C550();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
  }
}

unint64_t sub_24F36AF30()
{
  unint64_t result = qword_26B1F0D78;
  if (!qword_26B1F0D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D78);
  }
  return result;
}

unint64_t sub_24F36AF84()
{
  unint64_t result = qword_269A00360;
  if (!qword_269A00360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00360);
  }
  return result;
}

unint64_t sub_24F36AFD8()
{
  unint64_t result = qword_269A00368;
  if (!qword_269A00368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00368);
  }
  return result;
}

unint64_t sub_24F36B02C()
{
  unint64_t result = qword_26B1F0D90;
  if (!qword_26B1F0D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D90);
  }
  return result;
}

uint64_t SiriSessionAction.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00370);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00378);
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A00380);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24F36AF30();
  uint64_t v15 = v39;
  sub_24F36C5E0();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v16 = v33;
  uint64_t v39 = v11;
  uint64_t v17 = sub_24F36C540();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v18 = sub_24F36C4D0();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A001E8);
    *uint64_t v20 = &type metadata for SiriSessionAction;
    sub_24F36C500();
    sub_24F36C4C0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
LABEL_7:
    uint64_t v21 = (uint64_t)v34;
    return __swift_destroy_boxed_opaque_existential_1(v21);
  }
  if (*(unsigned char *)(v17 + 32))
  {
    LOBYTE(v35) = 1;
    sub_24F36AF84();
    sub_24F36C4F0();
    sub_24F36B534();
    uint64_t v23 = v30;
    sub_24F36C530();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
    uint64_t v24 = v35;
    uint64_t v25 = v36;
    uint64_t v26 = v37;
    char v27 = v38;
  }
  else
  {
    LOBYTE(v35) = 0;
    sub_24F36B02C();
    sub_24F36C4F0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    char v27 = 0;
  }
  uint64_t v21 = (uint64_t)v34;
  uint64_t v28 = v32;
  void *v32 = v24;
  v28[1] = v25;
  v28[2] = v26;
  *((unsigned char *)v28 + 24) = v27;
  return __swift_destroy_boxed_opaque_existential_1(v21);
}

unint64_t sub_24F36B534()
{
  unint64_t result = qword_269A00388;
  if (!qword_269A00388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00388);
  }
  return result;
}

uint64_t sub_24F36B588@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return SiriSessionAction.init(from:)(a1, a2);
}

uint64_t sub_24F36B5A0(void *a1)
{
  return SiriSessionAction.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for SiriSessionAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for SiriSessionAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

uint64_t sub_24F36B664(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_24F36B67C(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionAction()
{
  return &type metadata for SiriSessionAction;
}

unsigned char *storeEnumTagSinglePayload for SiriSessionAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F36B780);
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

ValueMetadata *type metadata accessor for SiriSessionAction.CodingKeys()
{
  return &type metadata for SiriSessionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriSessionAction.ViewAppearedCodingKeys()
{
  return &type metadata for SiriSessionAction.ViewAppearedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SiriSessionAction.BeginSessionRequestedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F36B864);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionAction.BeginSessionRequestedCodingKeys()
{
  return &type metadata for SiriSessionAction.BeginSessionRequestedCodingKeys;
}

unint64_t sub_24F36B8A0()
{
  unint64_t result = qword_269A00390;
  if (!qword_269A00390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00390);
  }
  return result;
}

unint64_t sub_24F36B8F8()
{
  unint64_t result = qword_269A00398;
  if (!qword_269A00398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A00398);
  }
  return result;
}

unint64_t sub_24F36B950()
{
  unint64_t result = qword_26B1F0DA0;
  if (!qword_26B1F0DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0DA0);
  }
  return result;
}

unint64_t sub_24F36B9A8()
{
  unint64_t result = qword_26B1F0D98;
  if (!qword_26B1F0D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D98);
  }
  return result;
}

unint64_t sub_24F36BA00()
{
  unint64_t result = qword_26B1F0D70;
  if (!qword_26B1F0D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D70);
  }
  return result;
}

unint64_t sub_24F36BA58()
{
  unint64_t result = qword_26B1F0D68;
  if (!qword_26B1F0D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D68);
  }
  return result;
}

unint64_t sub_24F36BAB0()
{
  unint64_t result = qword_26B1F0D88;
  if (!qword_26B1F0D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D88);
  }
  return result;
}

unint64_t sub_24F36BB08()
{
  unint64_t result = qword_26B1F0D80;
  if (!qword_26B1F0D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0D80);
  }
  return result;
}

uint64_t sub_24F36BB5C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_24F36C590() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024F36D940)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F36C590();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *static ContentRating.allCases.getter()
{
  return &unk_2700C3A20;
}

uint64_t ContentRating.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6E61656C63;
  }
  if (a1 == 1) {
    return 0x746963696C707865;
  }
  return 0x6669636570736E75;
}

uint64_t sub_24F36BCD0(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = 0x746963696C707865;
  if (v2 != 1)
  {
    uint64_t v4 = 0x6669636570736E75;
    unint64_t v3 = 0xEB00000000646569;
  }
  if (*a1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0x6E61656C63;
  }
  if (v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  unint64_t v7 = 0xE800000000000000;
  uint64_t v8 = 0x746963696C707865;
  if (*a2 != 1)
  {
    uint64_t v8 = 0x6669636570736E75;
    unint64_t v7 = 0xEB00000000646569;
  }
  if (*a2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0x6E61656C63;
  }
  if (*a2) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = 0xE500000000000000;
  }
  if (v5 == v9 && v6 == v10) {
    char v11 = 1;
  }
  else {
    char v11 = sub_24F36C590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_24F36BDE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18FitnessSiriSession13ContentRatingO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_24F36BE14(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE500000000000000;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x746963696C707865;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6669636570736E75;
    unint64_t v4 = 0xEB00000000646569;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E61656C63;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_24F36BE78(void *a1@<X8>)
{
  *a1 = &unk_2700C3A48;
}

uint64_t sub_24F36BE88()
{
  return sub_24F36C440();
}

uint64_t sub_24F36BEE8()
{
  return sub_24F36C430();
}

uint64_t sub_24F36BF38()
{
  return sub_24F36C5D0();
}

uint64_t sub_24F36BFE0()
{
  sub_24F36C420();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F36C074()
{
  return sub_24F36C5D0();
}

uint64_t _s18FitnessSiriSession13ContentRatingO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24F36C4E0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_24F36C168()
{
  unint64_t result = qword_269A003A0;
  if (!qword_269A003A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A003A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A003A0);
  }
  return result;
}

unint64_t sub_24F36C1C8()
{
  unint64_t result = qword_269A003B0;
  if (!qword_269A003B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A003B0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ContentRating(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F36C2E8);
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

ValueMetadata *type metadata accessor for ContentRating()
{
  return &type metadata for ContentRating;
}

unint64_t sub_24F36C320()
{
  unint64_t result = qword_269A003B8;
  if (!qword_269A003B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A003B8);
  }
  return result;
}

uint64_t SiriSessionEnvironment.handleSiriStartWorkoutRequest.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SiriSessionEnvironment.makeSiriBeginSessionRequestedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SiriSessionEnvironment.init(handleSiriStartWorkoutRequest:makeSiriBeginSessionRequestedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for SiriSessionEnvironment()
{
  return &type metadata for SiriSessionEnvironment;
}

uint64_t sub_24F36C400()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F36C410()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F36C420()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F36C430()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24F36C440()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24F36C450()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F36C470()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F36C480()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F36C490()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F36C4A0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24F36C4B0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F36C4C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F36C4D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F36C4E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F36C4F0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F36C500()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F36C510()
{
  return MEMORY[0x270F9F298]();
}

uint64_t sub_24F36C520()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F36C530()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F36C540()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F36C550()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F36C560()
{
  return MEMORY[0x270F9F3D8]();
}

uint64_t sub_24F36C570()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F36C580()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F36C590()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F36C5A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F36C5B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F36C5C0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24F36C5D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F36C5E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F36C5F0()
{
  return MEMORY[0x270F9FD98]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}