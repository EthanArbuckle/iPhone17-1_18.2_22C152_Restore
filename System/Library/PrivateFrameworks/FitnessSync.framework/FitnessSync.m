uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void SyncMonitorLocalState.activationState.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *SyncMonitorLocalState.activationState.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*SyncMonitorLocalState.activationState.modify())()
{
  return nullsub_1;
}

double SyncMonitorLocalState.syncInterval.getter()
{
  return *(double *)(v0 + 8);
}

void SyncMonitorLocalState.syncInterval.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*SyncMonitorLocalState.syncInterval.modify())()
{
  return nullsub_1;
}

FitnessSync::SyncMonitorLocalState __swiftcall SyncMonitorLocalState.init(activationState:syncInterval:)(FitnessSync::SyncMonitorActivationState activationState, Swift::Double syncInterval)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)activationState;
  *(Swift::Double *)(v2 + 8) = syncInterval;
  result.syncInterval = syncInterval;
  result.activationState = activationState;
  return result;
}

uint64_t sub_24F370EEC(char a1)
{
  if (a1) {
    return 0x65746E49636E7973;
  }
  else {
    return 0x6974617669746361;
  }
}

BOOL sub_24F370F38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F370F50()
{
  return sub_24F378C30();
}

uint64_t sub_24F370F98()
{
  return sub_24F378C20();
}

uint64_t sub_24F370FC4()
{
  return sub_24F378C30();
}

uint64_t sub_24F371008()
{
  return sub_24F370EEC(*v0);
}

uint64_t sub_24F371010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F37197C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F371038()
{
  return 0;
}

void sub_24F371044(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F371050(uint64_t a1)
{
  unint64_t v2 = sub_24F371294();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F37108C(uint64_t a1)
{
  unint64_t v2 = sub_24F371294();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SyncMonitorLocalState.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01F50);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F371294();
  sub_24F378C50();
  v10[15] = v8;
  v10[14] = 0;
  sub_24F3712E8();
  sub_24F378BF0();
  if (!v2)
  {
    v10[13] = 1;
    sub_24F378BE0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24F371294()
{
  unint64_t result = qword_269A01F58;
  if (!qword_269A01F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F58);
  }
  return result;
}

unint64_t sub_24F3712E8()
{
  unint64_t result = qword_269A01F60;
  if (!qword_269A01F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F60);
  }
  return result;
}

uint64_t SyncMonitorLocalState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01F68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F371294();
  sub_24F378C40();
  if (!v2)
  {
    v13[14] = 0;
    sub_24F371550();
    sub_24F378BA0();
    char v9 = v13[15];
    v13[13] = 1;
    sub_24F378B90();
    uint64_t v11 = v10;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(void *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
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

unint64_t sub_24F371550()
{
  unint64_t result = qword_269A01F70;
  if (!qword_269A01F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F70);
  }
  return result;
}

uint64_t sub_24F3715A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMonitorLocalState.init(from:)(a1, a2);
}

uint64_t sub_24F3715BC(void *a1)
{
  return SyncMonitorLocalState.encode(to:)(a1);
}

BOOL static SyncMonitorLocalState.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

BOOL sub_24F371600(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

uint64_t getEnumTagSinglePayload for SyncMonitorLocalState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SyncMonitorLocalState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorLocalState()
{
  return &type metadata for SyncMonitorLocalState;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SyncMonitorLocalState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SyncMonitorLocalState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F371828);
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

uint64_t sub_24F371850(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F371858(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorLocalState.CodingKeys()
{
  return &type metadata for SyncMonitorLocalState.CodingKeys;
}

unint64_t sub_24F371878()
{
  unint64_t result = qword_269A01F78;
  if (!qword_269A01F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F78);
  }
  return result;
}

unint64_t sub_24F3718D0()
{
  unint64_t result = qword_269A01F80;
  if (!qword_269A01F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F80);
  }
  return result;
}

unint64_t sub_24F371928()
{
  unint64_t result = qword_269A01F88;
  if (!qword_269A01F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01F88);
  }
  return result;
}

uint64_t sub_24F37197C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6974617669746361 && a2 == 0xEF65746174536E6FLL;
  if (v3 || (sub_24F378C00() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746E49636E7973 && a2 == 0xEC0000006C617672)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F378C00();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

BOOL static SyncMonitorActivationState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncMonitorActivationState.hash(into:)()
{
  return sub_24F378C20();
}

uint64_t sub_24F371AD4(char a1)
{
  if (a1) {
    return 0x657669746361;
  }
  else {
    return 0x6576697463616E69;
  }
}

uint64_t sub_24F371B08()
{
  return 0;
}

uint64_t sub_24F371B14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24F371B44(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F371B50(uint64_t a1)
{
  unint64_t v2 = sub_24F372030();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F371B8C(uint64_t a1)
{
  unint64_t v2 = sub_24F372030();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F371BD0()
{
  return sub_24F371AD4(*v0);
}

uint64_t sub_24F371BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F37295C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F371C00(uint64_t a1)
{
  unint64_t v2 = sub_24F371FDC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F371C3C(uint64_t a1)
{
  unint64_t v2 = sub_24F371FDC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F371C78(uint64_t a1)
{
  unint64_t v2 = sub_24F372084();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F371CB4(uint64_t a1)
{
  unint64_t v2 = sub_24F372084();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SyncMonitorActivationState.hashValue.getter()
{
  return sub_24F378C30();
}

uint64_t SyncMonitorActivationState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01F90);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01F98);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FA0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F371FDC();
  sub_24F378C50();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F372030();
    v14 = v18;
    sub_24F378BC0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F372084();
    sub_24F378BC0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F371FDC()
{
  unint64_t result = qword_269A01FA8;
  if (!qword_269A01FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FA8);
  }
  return result;
}

unint64_t sub_24F372030()
{
  unint64_t result = qword_269A01FB0;
  if (!qword_269A01FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FB0);
  }
  return result;
}

unint64_t sub_24F372084()
{
  unint64_t result = qword_269A01FB8;
  if (!qword_269A01FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FB8);
  }
  return result;
}

uint64_t SyncMonitorActivationState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FC0);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FC8);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FD0);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F371FDC();
  uint64_t v11 = v32;
  sub_24F378C40();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_24F378BB0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F378B30();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FD8);
    *char v22 = &type metadata for SyncMonitorActivationState;
    sub_24F378B70();
    sub_24F378B20();
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
    sub_24F372030();
    v18 = v14;
    sub_24F378B60();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F372084();
    sub_24F378B60();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

unint64_t sub_24F372534()
{
  unint64_t result = qword_269A01FE0;
  if (!qword_269A01FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FE0);
  }
  return result;
}

uint64_t sub_24F372588@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SyncMonitorActivationState.init(from:)(a1, a2);
}

uint64_t sub_24F3725A0(void *a1)
{
  return SyncMonitorActivationState.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState()
{
  return &type metadata for SyncMonitorActivationState;
}

unsigned char *_s11FitnessSync26SyncMonitorActivationStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F37269CLL);
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

ValueMetadata *type metadata accessor for SyncMonitorActivationState.CodingKeys()
{
  return &type metadata for SyncMonitorActivationState.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState.InactiveCodingKeys()
{
  return &type metadata for SyncMonitorActivationState.InactiveCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorActivationState.ActiveCodingKeys()
{
  return &type metadata for SyncMonitorActivationState.ActiveCodingKeys;
}

unint64_t sub_24F3726F8()
{
  unint64_t result = qword_269A01FE8;
  if (!qword_269A01FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FE8);
  }
  return result;
}

unint64_t sub_24F372750()
{
  unint64_t result = qword_269A01FF0;
  if (!qword_269A01FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FF0);
  }
  return result;
}

unint64_t sub_24F3727A8()
{
  unint64_t result = qword_269A01FF8;
  if (!qword_269A01FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A01FF8);
  }
  return result;
}

unint64_t sub_24F372800()
{
  unint64_t result = qword_269A02000;
  if (!qword_269A02000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02000);
  }
  return result;
}

unint64_t sub_24F372858()
{
  unint64_t result = qword_269A02008;
  if (!qword_269A02008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02008);
  }
  return result;
}

unint64_t sub_24F3728B0()
{
  unint64_t result = qword_269A02010;
  if (!qword_269A02010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02010);
  }
  return result;
}

unint64_t sub_24F372908()
{
  unint64_t result = qword_269A02018;
  if (!qword_269A02018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A02018);
  }
  return result;
}

uint64_t sub_24F37295C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6576697463616E69 && a2 == 0xE800000000000000;
  if (v3 || (sub_24F378C00() & 1) != 0)
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
    char v6 = sub_24F378C00();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

BOOL sub_24F372A4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SyncMonitorFeature.environment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(void *)(a1 + 40) = v2;
  swift_retain();
  swift_retain();
  return swift_retain();
}

__n128 SyncMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void SyncMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(unint64_t a1, uint64_t a2, unint64_t *a3, unsigned __int8 *a4)
{
  v158 = a3;
  uint64_t v154 = a2;
  unint64_t v156 = a1;
  uint64_t v6 = sub_24F378A10();
  v153 = *(void **)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v143 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v143 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v18 = (char *)&v143 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v143 - v19;
  uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A0);
  os_log_t v159 = *(os_log_t *)(v157 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v157);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v143 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  v155 = (void (*)(unint64_t, char *, uint64_t))((char *)&v143 - v27);
  MEMORY[0x270FA5388](v26);
  v31 = (char *)&v143 - v30;
  int v32 = *a4;
  long long v33 = v4[1];
  long long v161 = *v4;
  long long v162 = v33;
  long long v163 = v4[2];
  if (v32)
  {
    if (v32 == 1)
    {
      char v34 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16C0);
      v35 = &v25[v34[16]];
      v36 = &v25[v34[20]];
      v37 = &v25[v34[24]];
      char v160 = 1;
      sub_24F374D90();
      sub_24F378B10();
      sub_24F378AC0();
      uint64_t v38 = *MEMORY[0x263F39590];
      uint64_t v39 = sub_24F378A70();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v35, v38, v39);
      uint64_t v40 = *MEMORY[0x263F39570];
      uint64_t v41 = sub_24F378A60();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v36, v40, v41);
      *(void *)v37 = &unk_269A02040;
      *((void *)v37 + 1) = 0;
      os_log_t v42 = v159;
      uint64_t v43 = v157;
      ((void (*)(char *, void, uint64_t))v159[13].isa)(v25, *MEMORY[0x263F39530], v157);
      v44 = v158;
      unint64_t v45 = *v158;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v45 = sub_24F374ED0(0, *(void *)(v45 + 16) + 1, 1, v45);
      }
      unint64_t v47 = *(void *)(v45 + 16);
      unint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1) {
        unint64_t v45 = sub_24F374ED0(v46 > 1, v47 + 1, 1, v45);
      }
      *(void *)(v45 + 16) = v47 + 1;
      ((void (*)(unint64_t, char *, uint64_t))v42[4].isa)(v45+ ((LOBYTE(v42[10].isa) + 32) & ~(unint64_t)LOBYTE(v42[10].isa))+ (unint64_t)v42[9].isa * v47, v25, v43);
      unint64_t *v44 = v45;
      return;
    }
    if (*(unsigned char *)v156 == 1)
    {
      v151 = v28;
      v152 = v29;
      uint64_t v80 = v154;
      sub_24F374C60(v154, (uint64_t)v20);
      v81 = v153;
      v82 = (uint64_t (*)(char *, uint64_t, uint64_t))v153[6];
      LODWORD(v155) = v82(v20, 1, v6);
      sub_24F374CC8((uint64_t)v20);
      sub_24F3789F0();
      sub_24F374C60(v80, (uint64_t)v18);
      if (v82(v18, 1, v6) == 1)
      {
        sub_24F3789D0();
        sub_24F374CC8((uint64_t)v18);
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v81[4])(v9, v18, v6);
      }
      sub_24F3789E0();
      double v88 = v87;
      v89 = (void (*)(char *, uint64_t))v81[1];
      v89(v9, v6);
      v89(v11, v6);
      if (v155 != 1 && *(double *)(v156 + 8) > v88)
      {
        if (qword_26B1F1588 != -1) {
          swift_once();
        }
        uint64_t v90 = sub_24F378A40();
        __swift_project_value_buffer(v90, (uint64_t)qword_26B1F2070);
        v91 = sub_24F378A20();
        os_log_type_t v92 = sub_24F378AF0();
        if (os_log_type_enabled(v91, v92))
        {
          v93 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v93 = 0;
          _os_log_impl(&dword_24F36F000, v91, v92, "[SyncMonitorFeature] Skipping catalog sync - interval has not expired", v93, 2u);
          MEMORY[0x25335B400](v93, -1, -1);
        }

LABEL_52:
        if (qword_26B1F1588 != -1) {
          swift_once();
        }
        uint64_t v139 = sub_24F378A40();
        __swift_project_value_buffer(v139, (uint64_t)qword_26B1F2070);
        v140 = sub_24F378A20();
        os_log_type_t v141 = sub_24F378AF0();
        if (os_log_type_enabled(v140, v141))
        {
          v142 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v142 = 0;
          _os_log_impl(&dword_24F36F000, v140, v141, "[SyncMonitorFeature] Skipping user data sync - already synced", v142, 2u);
          MEMORY[0x25335B400](v142, -1, -1);
        }

        return;
      }
      sub_24F378A00();
      ((void (*)(char *, void, uint64_t, uint64_t))v81[7])(v15, 0, 1, v6);
      sub_24F374D28((uint64_t)v15, v80);
      if (qword_26B1F1588 != -1) {
        swift_once();
      }
      uint64_t v94 = sub_24F378A40();
      __swift_project_value_buffer(v94, (uint64_t)qword_26B1F2070);
      v95 = sub_24F378A20();
      os_log_type_t v96 = sub_24F378AF0();
      BOOL v97 = os_log_type_enabled(v95, v96);
      os_log_t v98 = v159;
      if (v97)
      {
        v99 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v99 = 0;
        _os_log_impl(&dword_24F36F000, v95, v96, "[SyncMonitorFeature] Syncing catalog", v99, 2u);
        MEMORY[0x25335B400](v99, -1, -1);
      }

      v100 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16C0);
      v101 = v152;
      v102 = (char *)v152 + v100[16];
      v103 = (char *)v152 + v100[20];
      v104 = (void *)((char *)v152 + v100[24]);
      char v160 = 2;
      unint64_t v156 = sub_24F374D90();
      sub_24F378B10();
      sub_24F378AC0();
      uint64_t v105 = *MEMORY[0x263F39590];
      uint64_t v106 = sub_24F378A70();
      uint64_t v107 = *(void *)(v106 - 8);
      v108 = *(void **)(v107 + 104);
      LODWORD(v154) = v105;
      v153 = v108;
      uint64_t v150 = v107 + 104;
      ((void (*)(char *, uint64_t, uint64_t))v108)(v102, v105, v106);
      uint64_t v109 = *MEMORY[0x263F39578];
      uint64_t v110 = sub_24F378A60();
      uint64_t v111 = *(void *)(v110 - 8);
      v148 = *(void (**)(char *, uint64_t, uint64_t))(v111 + 104);
      v147 = (void (*)(char *, void, uint64_t))(v111 + 104);
      v148(v103, v109, v110);
      v112 = (_OWORD *)swift_allocObject();
      long long v113 = v162;
      v112[1] = v161;
      v112[2] = v113;
      v112[3] = v163;
      void *v104 = &unk_269A02028;
      v104[1] = v112;
      int v114 = *MEMORY[0x263F39530];
      isa = (char *)v98[13].isa;
      ((void (*)(void, void, uint64_t))isa)(v101, *MEMORY[0x263F39530], v157);
      unint64_t v116 = *v158;
      sub_24F374E84((uint64_t)&v161);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unsigned int v149 = v109;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v116 = sub_24F374ED0(0, *(void *)(v116 + 16) + 1, 1, v116);
      }
      unint64_t v119 = *(void *)(v116 + 16);
      unint64_t v118 = *(void *)(v116 + 24);
      LODWORD(v146) = v114;
      v145 = isa;
      if (v119 >= v118 >> 1) {
        unint64_t v116 = sub_24F374ED0(v118 > 1, v119 + 1, 1, v116);
      }
      *(void *)(v116 + 16) = v119 + 1;
      Class v120 = v159[4].isa;
      unint64_t v121 = (LOBYTE(v159[10].isa) + 32) & ~(unint64_t)LOBYTE(v159[10].isa);
      Class v122 = v159[9].isa;
      unint64_t v123 = v116 + v121 + (void)v122 * v119;
      v124 = v159 + 4;
      ((void (*)(unint64_t, void, uint64_t))v120)(v123, v152, v157);
      unint64_t *v158 = v116;
      if (v155 != 1) {
        goto LABEL_52;
      }
      os_log_t v159 = v124;
      v155 = (void (*)(unint64_t, char *, uint64_t))v120;
      v125 = sub_24F378A20();
      os_log_type_t v126 = sub_24F378AF0();
      if (os_log_type_enabled(v125, v126))
      {
        v127 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v127 = 0;
        _os_log_impl(&dword_24F36F000, v125, v126, "[SyncMonitorFeature] Syncing user data", v127, 2u);
        MEMORY[0x25335B400](v127, -1, -1);
      }

      v128 = v151;
      v129 = &v151[v100[16]];
      v130 = &v151[v100[20]];
      v131 = &v151[v100[24]];
      char v160 = 3;
      sub_24F378B10();
      sub_24F378AC0();
      ((void (*)(char *, void, uint64_t))v153)(v129, v154, v106);
      v148(v130, v149, v110);
      v132 = (_OWORD *)swift_allocObject();
      long long v133 = v162;
      v132[1] = v161;
      v132[2] = v133;
      v132[3] = v163;
      *(void *)v131 = &unk_269A02038;
      *((void *)v131 + 1) = v132;
      uint64_t v134 = v157;
      ((void (*)(char *, void, uint64_t))v145)(v128, v146, v157);
      v135 = v158;
      unint64_t v136 = *v158;
      sub_24F374E84((uint64_t)&v161);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v136 = sub_24F374ED0(0, *(void *)(v136 + 16) + 1, 1, v136);
      }
      unint64_t v138 = *(void *)(v136 + 16);
      unint64_t v137 = *(void *)(v136 + 24);
      if (v138 >= v137 >> 1) {
        unint64_t v136 = sub_24F374ED0(v137 > 1, v138 + 1, 1, v136);
      }
      *(void *)(v136 + 16) = v138 + 1;
      v155(v136 + v121 + v138 * (void)v122, v151, v134);
      unint64_t *v135 = v136;
    }
    else
    {
      if (qword_26B1F1588 != -1) {
        swift_once();
      }
      uint64_t v83 = sub_24F378A40();
      __swift_project_value_buffer(v83, (uint64_t)qword_26B1F2070);
      os_log_t v159 = (os_log_t)sub_24F378A20();
      os_log_type_t v84 = sub_24F378AF0();
      if (os_log_type_enabled(v159, v84))
      {
        v85 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v85 = 0;
        _os_log_impl(&dword_24F36F000, v159, v84, "[SyncMonitorFeature] Skipping sync - inactive", v85, 2u);
        MEMORY[0x25335B400](v85, -1, -1);
      }
      os_log_t v86 = v159;
    }
  }
  else if ((*(unsigned char *)v156 & 1) == 0)
  {
    *(unsigned char *)unint64_t v156 = 1;
    v48 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16C0);
    v49 = &v31[v48[16]];
    v50 = &v31[v48[20]];
    v51 = &v31[v48[24]];
    char v160 = 1;
    unint64_t v156 = sub_24F374D90();
    sub_24F378B10();
    sub_24F378AC0();
    uint64_t v52 = *MEMORY[0x263F39590];
    uint64_t v53 = sub_24F378A70();
    uint64_t v54 = *(void *)(v53 - 8);
    v55 = *(char **)(v54 + 104);
    LODWORD(v154) = v52;
    uint64_t v150 = v54 + 104;
    v151 = v55;
    ((void (*)(char *, uint64_t, uint64_t))v55)(v49, v52, v53);
    uint64_t v56 = *MEMORY[0x263F39570];
    uint64_t v57 = sub_24F378A60();
    uint64_t v58 = *(void *)(v57 - 8);
    v59 = *(void (**)(char *, void, uint64_t))(v58 + 104);
    unsigned int v149 = v56;
    v147 = v59;
    uint64_t v146 = v58 + 104;
    v59(v50, v56, v57);
    *(void *)v51 = &unk_269A02048;
    *((void *)v51 + 1) = 0;
    os_log_t v60 = v159;
    Class v61 = v159[13].isa;
    LODWORD(v153) = *MEMORY[0x263F39530];
    uint64_t v62 = v157;
    v152 = (void (*)(void, void, void))v61;
    ((void (*)(char *))v61)(v31);
    unint64_t v63 = *v158;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v63 = sub_24F374ED0(0, *(void *)(v63 + 16) + 1, 1, v63);
    }
    unint64_t v65 = *(void *)(v63 + 16);
    unint64_t v64 = *(void *)(v63 + 24);
    if (v65 >= v64 >> 1) {
      unint64_t v63 = sub_24F374ED0(v64 > 1, v65 + 1, 1, v63);
    }
    *(void *)(v63 + 16) = v65 + 1;
    v67 = (void (*)(char *, uint64_t, uint64_t))v60[4].isa;
    os_log_t v66 = v60 + 4;
    v145 = (char *)((LOBYTE(v66[6].isa) + 32) & ~(unint64_t)LOBYTE(v66[6].isa));
    Class v144 = v66[5].isa;
    os_log_t v159 = v66;
    v148 = v67;
    v67(&v145[v63 + (void)v144 * v65], (uint64_t)v31, v62);
    uint64_t v68 = v62;
    v69 = v158;
    unint64_t *v158 = v63;
    v70 = v155;
    v71 = (char *)v155 + v48[16];
    v72 = (char *)v155 + v48[20];
    v73 = (char *)v155 + v48[24];
    char v160 = 0;
    sub_24F378B10();
    sub_24F378AC0();
    ((void (*)(char *, void, uint64_t))v151)(v71, v154, v53);
    v147(v72, v149, v57);
    v74 = (_OWORD *)swift_allocObject();
    long long v75 = v162;
    v74[1] = v161;
    v74[2] = v75;
    v74[3] = v163;
    *(void *)v73 = &unk_269A02058;
    *((void *)v73 + 1) = v74;
    v152(v70, v153, v68);
    unint64_t v76 = *v69;
    sub_24F374E84((uint64_t)&v161);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v76 = sub_24F374ED0(0, *(void *)(v76 + 16) + 1, 1, v76);
    }
    unint64_t v78 = *(void *)(v76 + 16);
    unint64_t v77 = *(void *)(v76 + 24);
    uint64_t v79 = v157;
    if (v78 >= v77 >> 1) {
      unint64_t v76 = sub_24F374ED0(v77 > 1, v78 + 1, 1, v76);
    }
    *(void *)(v76 + 16) = v78 + 1;
    v148(&v145[v76 + v78 * (void)v144], (uint64_t)v155, v79);
    unint64_t *v69 = v76;
  }
}

uint64_t sub_24F373BC4()
{
  *(void *)(v0 + 16) = sub_24F378AB0();
  *(void *)(v0 + 24) = sub_24F378AA0();
  *(unsigned char *)(v0 + 40) = 2;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A8);
  void *v1 = v0;
  v1[1] = sub_24F373CA0;
  return MEMORY[0x270F252C8](v0 + 40, v2);
}

uint64_t sub_24F373CA0()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24F378A90();
  return MEMORY[0x270FA2498](sub_24F375AE8, v1, v0);
}

uint64_t sub_24F373DDC(uint64_t a1, void *a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16B8);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v2[5] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16B0);
  v2[6] = v6;
  v2[7] = *(void *)(v6 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = sub_24F378AB0();
  v2[10] = sub_24F378AA0();
  uint64_t v9 = (uint64_t (*)(uint64_t))(*a2 + *(int *)*a2);
  uint64_t v7 = (void *)swift_task_alloc();
  v2[11] = v7;
  void *v7 = v2;
  v7[1] = sub_24F373F98;
  return v9(v5);
}

uint64_t sub_24F373F98()
{
  uint64_t v2 = (void *)*v1;
  v2[12] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F378A90();
  v2[13] = v4;
  v2[14] = v3;
  if (v0) {
    uint64_t v5 = sub_24F374654;
  }
  else {
    uint64_t v5 = sub_24F3740F8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F3740F8()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_24F378AD0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_24F378AA0();
  v0[15] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[16] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24F3741EC;
  uint64_t v6 = v0[6];
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 18, v4, v7, v6);
}

uint64_t sub_24F3741EC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 104);
  return MEMORY[0x270FA2498](sub_24F374330, v3, v2);
}

uint64_t sub_24F374330()
{
  if (*(unsigned char *)(v0 + 144) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(unsigned char *)(v0 + 145) = 1;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A8);
    *uint64_t v3 = v0;
    v3[1] = sub_24F37446C;
    return MEMORY[0x270F252C8](v0 + 145, v4);
  }
}

uint64_t sub_24F37446C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 104);
  return MEMORY[0x270FA2498](sub_24F37458C, v3, v2);
}

uint64_t sub_24F37458C()
{
  uint64_t v1 = sub_24F378AA0();
  v0[15] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[16] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F3741EC;
  uint64_t v3 = v0[6];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 18, v1, v4, v3);
}

uint64_t sub_24F374654()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3746D0(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_24F378AB0();
  v2[3] = sub_24F378AA0();
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3747B8;
  return v6();
}

uint64_t sub_24F3747B8()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F378A90();
  if (v0) {
    uint64_t v4 = sub_24F374978;
  }
  else {
    uint64_t v4 = sub_24F374914;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F374914()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F374978()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3749DC(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_24F378AB0();
  v2[3] = sub_24F378AA0();
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F374AC4;
  return v6();
}

uint64_t sub_24F374AC4()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F378A90();
  if (v0) {
    uint64_t v4 = sub_24F375AE4;
  }
  else {
    uint64_t v4 = sub_24F375AE8;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24F374C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F374CC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F374D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F374D90()
{
  unint64_t result = qword_26B1F1670;
  if (!qword_26B1F1670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1670);
  }
  return result;
}

uint64_t sub_24F374DE8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F375AE0;
  return sub_24F3746D0(a1, v1 + 16);
}

uint64_t sub_24F374E84(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F374ED0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16E8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24F378B40();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24F375980(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24F375144(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F375AE0;
  return sub_24F3749DC(a1, v1 + 16);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24F37522C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3752C8;
  return sub_24F373DDC(a1, (void *)(v1 + 16));
}

uint64_t sub_24F3752C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24F3753C0()
{
  unint64_t result = qword_26B1F1668;
  if (!qword_26B1F1668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1668);
  }
  return result;
}

unint64_t sub_24F375418()
{
  unint64_t result = qword_26B1F1660;
  if (!qword_26B1F1660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1660);
  }
  return result;
}

unint64_t sub_24F375470()
{
  unint64_t result = qword_26B1F1680;
  if (!qword_26B1F1680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1680);
  }
  return result;
}

unint64_t sub_24F3754C8()
{
  unint64_t result = qword_26B1F1688;
  if (!qword_26B1F1688)
  {
    type metadata accessor for SyncMonitorSharedState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1688);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SyncMonitorEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SyncMonitorEnvironment()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SyncMonitorEnvironment(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for SyncMonitorEnvironment(void *a1, void *a2)
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

_OWORD *assignWithTake for SyncMonitorEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncMonitorEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMonitorEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SyncMonitorFeature()
{
  return &type metadata for SyncMonitorFeature;
}

uint64_t getEnumTagSinglePayload for SyncMonitorFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SyncMonitorFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24F3758E8);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_24F375910(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorFeature.TaskIdentifier()
{
  return &type metadata for SyncMonitorFeature.TaskIdentifier;
}

unint64_t sub_24F37592C()
{
  unint64_t result = qword_26B1F1678;
  if (!qword_26B1F1678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1678);
  }
  return result;
}

uint64_t sub_24F375980(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16A0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24F378B50();
  __break(1u);
  return result;
}

uint64_t SyncMonitorSharedState.lastSyncDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F374C60(v1, a1);
}

uint64_t SyncMonitorSharedState.lastSyncDate.setter(uint64_t a1)
{
  return sub_24F374D28(a1, v1);
}

uint64_t (*SyncMonitorSharedState.lastSyncDate.modify())()
{
  return nullsub_1;
}

uint64_t SyncMonitorSharedState.init(lastSyncDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F378A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a2, 1, 1, v4);
  return sub_24F374D28(a1, a2);
}

uint64_t sub_24F375B9C()
{
  return 1;
}

uint64_t sub_24F375BA4()
{
  return sub_24F378C30();
}

uint64_t sub_24F375BE8()
{
  return sub_24F378C20();
}

uint64_t sub_24F375C10()
{
  return sub_24F378C30();
}

uint64_t sub_24F375C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F377294(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F375C80(uint64_t a1)
{
  unint64_t v2 = sub_24F375E58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F375CBC(uint64_t a1)
{
  unint64_t v2 = sub_24F375E58();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SyncMonitorSharedState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A02060);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F375E58();
  sub_24F378C50();
  sub_24F378A10();
  sub_24F3773A8(&qword_269A02070);
  sub_24F378BD0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24F375E58()
{
  unint64_t result = qword_269A02068;
  if (!qword_269A02068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02068);
  }
  return result;
}

uint64_t SyncMonitorSharedState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v16 = (uint64_t)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A02078);
  uint64_t v15 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SyncMonitorSharedState();
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24F378A10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F375E58();
  sub_24F378C40();
  if (!v2)
  {
    sub_24F3773A8(&qword_269A02080);
    sub_24F378B80();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v6);
    sub_24F374D28(v16, (uint64_t)v11);
    sub_24F3761C8((uint64_t)v11, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F37616C((uint64_t)v11);
}

uint64_t type metadata accessor for SyncMonitorSharedState()
{
  uint64_t result = qword_26B1F1690;
  if (!qword_26B1F1690) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F37616C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SyncMonitorSharedState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F3761C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SyncMonitorSharedState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F37622C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMonitorSharedState.init(from:)(a1, a2);
}

uint64_t sub_24F376244(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A02060);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F375E58();
  sub_24F378C50();
  sub_24F378A10();
  sub_24F3773A8(&qword_269A02070);
  sub_24F378BD0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL _s11FitnessSync0B18MonitorSharedStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F378A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F1600);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v26 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v26 - v19;
  sub_24F374C60(a1, (uint64_t)&v26 - v19);
  sub_24F374C60(a2, (uint64_t)v18);
  uint64_t v21 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_24F374C60((uint64_t)v20, (uint64_t)v11);
  sub_24F374C60((uint64_t)v18, v21);
  uint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v11, 1, v4) == 1)
  {
    sub_24F37734C((uint64_t)v18, &qword_26B1F15F0);
    sub_24F37734C((uint64_t)v20, &qword_26B1F15F0);
    if (v22(v21, 1, v4) == 1)
    {
      sub_24F37734C((uint64_t)v11, &qword_26B1F15F0);
      return 1;
    }
    goto LABEL_6;
  }
  sub_24F374C60((uint64_t)v11, (uint64_t)v15);
  if (v22(v21, 1, v4) == 1)
  {
    sub_24F37734C((uint64_t)v18, &qword_26B1F15F0);
    sub_24F37734C((uint64_t)v20, &qword_26B1F15F0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
LABEL_6:
    sub_24F37734C((uint64_t)v11, &qword_26B1F1600);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v21, v4);
  sub_24F3773A8(&qword_26B1F15E8);
  char v23 = sub_24F378A80();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v7, v4);
  sub_24F37734C((uint64_t)v18, &qword_26B1F15F0);
  sub_24F37734C((uint64_t)v20, &qword_26B1F15F0);
  v24(v15, v4);
  sub_24F37734C((uint64_t)v11, &qword_26B1F15F0);
  return (v23 & 1) != 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for SyncMonitorSharedState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_24F378A10();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SyncMonitorSharedState(uint64_t a1)
{
  uint64_t v2 = sub_24F378A10();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for SyncMonitorSharedState(void *a1, const void *a2)
{
  uint64_t v4 = sub_24F378A10();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for SyncMonitorSharedState(void *a1, void *a2)
{
  uint64_t v4 = sub_24F378A10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for SyncMonitorSharedState(void *a1, const void *a2)
{
  uint64_t v4 = sub_24F378A10();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for SyncMonitorSharedState(void *a1, void *a2)
{
  uint64_t v4 = sub_24F378A10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncMonitorSharedState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F376E80);
}

uint64_t sub_24F376E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SyncMonitorSharedState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F376F04);
}

uint64_t sub_24F376F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F15F0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_24F376F78()
{
  sub_24F377004();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24F377004()
{
  if (!qword_26B1F15F8)
  {
    sub_24F378A10();
    unint64_t v0 = sub_24F378B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1F15F8);
    }
  }
}

uint64_t getEnumTagSinglePayload for SyncMonitorSharedState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SyncMonitorSharedState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F37714CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F377174()
{
  return 0;
}

ValueMetadata *type metadata accessor for SyncMonitorSharedState.CodingKeys()
{
  return &type metadata for SyncMonitorSharedState.CodingKeys;
}

unint64_t sub_24F377190()
{
  unint64_t result = qword_269A02088;
  if (!qword_269A02088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02088);
  }
  return result;
}

unint64_t sub_24F3771E8()
{
  unint64_t result = qword_269A02090;
  if (!qword_269A02090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02090);
  }
  return result;
}

unint64_t sub_24F377240()
{
  unint64_t result = qword_269A02098;
  if (!qword_269A02098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A02098);
  }
  return result;
}

uint64_t sub_24F377294(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x636E79537473616CLL && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F378C00();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F37732C()
{
  return 0x636E79537473616CLL;
}

uint64_t sub_24F37734C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F3773A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24F378A10();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F3773EC()
{
  uint64_t v0 = sub_24F378A40();
  __swift_allocate_value_buffer(v0, qword_26B1F2070);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1F2070);
  return sub_24F378A30();
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

BOOL static SyncMonitorAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SyncMonitorAction.hash(into:)()
{
  return sub_24F378C20();
}

uint64_t sub_24F377500(char a1)
{
  if (!a1) {
    return 0x6570704177656976;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0x654E6649636E7973;
}

uint64_t sub_24F377570(uint64_t a1)
{
  unint64_t v2 = sub_24F377BE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3775AC(uint64_t a1)
{
  unint64_t v2 = sub_24F377BE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3775E8()
{
  return sub_24F377500(*v0);
}

uint64_t sub_24F3775F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3787BC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F377618(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F377624(uint64_t a1)
{
  unint64_t v2 = sub_24F377B38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F377660(uint64_t a1)
{
  unint64_t v2 = sub_24F377B38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F37769C(uint64_t a1)
{
  unint64_t v2 = sub_24F377B8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3776D8(uint64_t a1)
{
  unint64_t v2 = sub_24F377B8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F377714(uint64_t a1)
{
  unint64_t v2 = sub_24F377C34();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F377750(uint64_t a1)
{
  unint64_t v2 = sub_24F377C34();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SyncMonitorAction.hashValue.getter()
{
  return sub_24F378C30();
}

uint64_t SyncMonitorAction.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16C8);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  char v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16E0);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16D8);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F16D0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F377B38();
  sub_24F378C50();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_24F377BE0();
      sub_24F378BC0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_24F377B8C();
      uint64_t v17 = v23;
      sub_24F378BC0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_24F377C34();
    sub_24F378BC0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_24F377B38()
{
  unint64_t result = qword_26B1F1620;
  if (!qword_26B1F1620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1620);
  }
  return result;
}

unint64_t sub_24F377B8C()
{
  unint64_t result = qword_26B1F1608;
  if (!qword_26B1F1608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1608);
  }
  return result;
}

unint64_t sub_24F377BE0()
{
  unint64_t result = qword_26B1F1580;
  if (!qword_26B1F1580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1580);
  }
  return result;
}

unint64_t sub_24F377C34()
{
  unint64_t result = qword_26B1F1638;
  if (!qword_26B1F1638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1638);
  }
  return result;
}

uint64_t SyncMonitorAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A020A0);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A020A8);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A020B0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A020B8);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F377B38();
  uint64_t v12 = (uint64_t)v39;
  sub_24F378C40();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_24F378BB0();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_24F378B30();
    swift_allocError();
    char v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A01FD8);
    *char v23 = &type metadata for SyncMonitorAction;
    sub_24F378B70();
    sub_24F378B20();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_24F377BE0();
      uint64_t v18 = v30;
      sub_24F378B60();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_24F377B8C();
      uint64_t v25 = v30;
      sub_24F378B60();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_24F377C34();
    uint64_t v24 = v30;
    sub_24F378B60();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

unint64_t sub_24F378244()
{
  unint64_t result = qword_269A020C0;
  if (!qword_269A020C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A020C0);
  }
  return result;
}

uint64_t sub_24F378298@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SyncMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_24F3782B0(void *a1)
{
  return SyncMonitorAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SyncMonitorAction()
{
  return &type metadata for SyncMonitorAction;
}

uint64_t _s11FitnessSync17SyncMonitorActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s11FitnessSync17SyncMonitorActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F37843CLL);
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

ValueMetadata *type metadata accessor for SyncMonitorAction.CodingKeys()
{
  return &type metadata for SyncMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for SyncMonitorAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.AppDidBecomeActiveCodingKeys()
{
  return &type metadata for SyncMonitorAction.AppDidBecomeActiveCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMonitorAction.SyncIfNeededCodingKeys()
{
  return &type metadata for SyncMonitorAction.SyncIfNeededCodingKeys;
}

unint64_t sub_24F3784A8()
{
  unint64_t result = qword_269A020C8;
  if (!qword_269A020C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A020C8);
  }
  return result;
}

unint64_t sub_24F378500()
{
  unint64_t result = qword_26B1F1648;
  if (!qword_26B1F1648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1648);
  }
  return result;
}

unint64_t sub_24F378558()
{
  unint64_t result = qword_26B1F1640;
  if (!qword_26B1F1640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1640);
  }
  return result;
}

unint64_t sub_24F3785B0()
{
  unint64_t result = qword_26B1F1658;
  if (!qword_26B1F1658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1658);
  }
  return result;
}

unint64_t sub_24F378608()
{
  unint64_t result = qword_26B1F1650;
  if (!qword_26B1F1650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1650);
  }
  return result;
}

unint64_t sub_24F378660()
{
  unint64_t result = qword_26B1F1618;
  if (!qword_26B1F1618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1618);
  }
  return result;
}

unint64_t sub_24F3786B8()
{
  unint64_t result = qword_26B1F1610;
  if (!qword_26B1F1610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1610);
  }
  return result;
}

unint64_t sub_24F378710()
{
  unint64_t result = qword_26B1F1630;
  if (!qword_26B1F1630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1630);
  }
  return result;
}

unint64_t sub_24F378768()
{
  unint64_t result = qword_26B1F1628;
  if (!qword_26B1F1628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F1628);
  }
  return result;
}

uint64_t sub_24F3787BC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261 || (sub_24F378C00() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F37A5C0 || (sub_24F378C00() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x654E6649636E7973 && a2 == 0xEC00000064656465)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24F378C00();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t SyncMonitorEnvironment.makeAppDidBecomeActiveStream.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.syncCatalog.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.syncUserData.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t SyncMonitorEnvironment.init(makeAppDidBecomeActiveStream:syncCatalog:syncUserData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

ValueMetadata *type metadata accessor for SyncMonitorEnvironment()
{
  return &type metadata for SyncMonitorEnvironment;
}

uint64_t sub_24F3789D0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_24F3789E0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24F3789F0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24F378A00()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24F378A10()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F378A20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F378A30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F378A40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F378A60()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F378A70()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F378A80()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24F378A90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F378AA0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F378AB0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F378AC0()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_24F378AD0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24F378AF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24F378B00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F378B10()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F378B20()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F378B30()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F378B40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F378B50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F378B60()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F378B70()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F378B80()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24F378B90()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24F378BA0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F378BB0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F378BC0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F378BD0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24F378BE0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24F378BF0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F378C00()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F378C10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F378C20()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F378C30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F378C40()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F378C50()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_release(id a1)
{
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}