unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

void SharePlaySessionState.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *SharePlaySessionState.state.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*SharePlaySessionState.state.modify())()
{
  return nullsub_1;
}

FitnessSharePlaySession::SharePlaySessionState __swiftcall SharePlaySessionState.init(state:)(FitnessSharePlaySession::SharePlaySessionState state)
{
  unsigned char *v1 = *(unsigned char *)state.state;
  return state;
}

uint64_t sub_24F35919C()
{
  return 1;
}

uint64_t sub_24F3591A4()
{
  return sub_24F360ED0();
}

uint64_t sub_24F3591E8()
{
  return sub_24F360EC0();
}

uint64_t sub_24F359210()
{
  return sub_24F360ED0();
}

uint64_t sub_24F359250()
{
  return 0x6574617473;
}

uint64_t sub_24F359264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F360EA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F3592F4()
{
  return 0;
}

void sub_24F359300(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F35930C(uint64_t a1)
{
  unint64_t v2 = sub_24F359554();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F359348(uint64_t a1)
{
  unint64_t v2 = sub_24F359554();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SharePlaySessionState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEE80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F359554();
  sub_24F360EF0();
  char v10 = v7;
  sub_24F3595A8();
  sub_24F360E90();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
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

unint64_t sub_24F359554()
{
  unint64_t result = qword_2699FEE88;
  if (!qword_2699FEE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEE88);
  }
  return result;
}

unint64_t sub_24F3595A8()
{
  unint64_t result = qword_2699FEE90;
  if (!qword_2699FEE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEE90);
  }
  return result;
}

uint64_t SharePlaySessionState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEE98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F359554();
  sub_24F360EE0();
  if (!v2)
  {
    sub_24F3597B4();
    sub_24F360E40();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
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

unint64_t sub_24F3597B4()
{
  unint64_t result = qword_2699FEEA0;
  if (!qword_2699FEEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEEA0);
  }
  return result;
}

uint64_t sub_24F359808@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SharePlaySessionState.init(from:)(a1, a2);
}

uint64_t sub_24F359820(void *a1)
{
  return SharePlaySessionState.encode(to:)(a1);
}

BOOL static SharePlaySessionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_24F359850(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SharePlaySessionState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3599C4);
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

ValueMetadata *type metadata accessor for SharePlaySessionState()
{
  return &type metadata for SharePlaySessionState;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionState.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SharePlaySessionState.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F359AECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F359B14()
{
  return 0;
}

ValueMetadata *type metadata accessor for SharePlaySessionState.CodingKeys()
{
  return &type metadata for SharePlaySessionState.CodingKeys;
}

unint64_t sub_24F359B30()
{
  unint64_t result = qword_2699FEEA8;
  if (!qword_2699FEEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEEA8);
  }
  return result;
}

unint64_t sub_24F359B88()
{
  unint64_t result = qword_2699FEEB0;
  if (!qword_2699FEEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEEB0);
  }
  return result;
}

unint64_t sub_24F359BE0()
{
  unint64_t result = qword_2699FEEB8;
  if (!qword_2699FEEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEEB8);
  }
  return result;
}

uint64_t SharePlayActivity.sessionIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.workoutIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SharePlayActivity.fallbackURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SharePlayActivity() + 28);
  uint64_t v4 = sub_24F360D10();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SharePlayActivity()
{
  uint64_t result = qword_26B1F0520;
  if (!qword_26B1F0520) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SharePlayActivity.activityType.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for SharePlayActivity() + 32));
}

uint64_t SharePlayActivity.init(sessionIdentifier:workoutIdentifier:title:fallbackURL:activityType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  uint64_t v12 = type metadata accessor for SharePlayActivity();
  v13 = (char *)a9 + *(int *)(v12 + 28);
  uint64_t v14 = sub_24F360D10();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a7, v14);
  *(void *)((char *)a9 + *(int *)(v12 + 32)) = a8;
  return result;
}

unint64_t sub_24F359E48(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 2:
      unint64_t result = 0x656C746974;
      break;
    case 3:
      unint64_t result = 0x6B6361626C6C6166;
      break;
    case 4:
      unint64_t result = 0x7974697669746361;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24F359F04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F359F18()
{
  return sub_24F360ED0();
}

uint64_t sub_24F359F60()
{
  return sub_24F360EC0();
}

uint64_t sub_24F359F8C()
{
  return sub_24F360ED0();
}

unint64_t sub_24F359FD0()
{
  return sub_24F359E48(*v0);
}

uint64_t sub_24F359FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F35ABE0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F35A000(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24F35A00C(uint64_t a1)
{
  unint64_t v2 = sub_24F35AF04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35A048(uint64_t a1)
{
  unint64_t v2 = sub_24F35AF04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SharePlayActivity.hash(into:)()
{
  return sub_24F360EC0();
}

uint64_t SharePlayActivity.hashValue.getter()
{
  return sub_24F360ED0();
}

uint64_t sub_24F35A2CC()
{
  return sub_24F360EC0();
}

uint64_t sub_24F35A3DC()
{
  return sub_24F360ED0();
}

uint64_t SharePlayActivity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEEC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35AF04();
  sub_24F360EF0();
  v8[15] = 0;
  sub_24F360E70();
  if (!v1)
  {
    v8[14] = 1;
    sub_24F360E70();
    v8[13] = 2;
    sub_24F360E70();
    type metadata accessor for SharePlayActivity();
    v8[12] = 3;
    sub_24F360D10();
    sub_24F35B060(&qword_2699FEED8, MEMORY[0x263F06EA8]);
    sub_24F360E90();
    v8[11] = 4;
    sub_24F360E80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SharePlayActivity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v27 = sub_24F360D10();
  uint64_t v25 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEEE0);
  uint64_t v26 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SharePlayActivity();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35AF04();
  uint64_t v10 = (uint64_t)v29;
  sub_24F360EE0();
  if (v10) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v11 = v4;
  v29 = a1;
  uint64_t v12 = v26;
  uint64_t v13 = v27;
  uint64_t v23 = v7;
  char v34 = 0;
  uint64_t v14 = v28;
  uint64_t v15 = (uint64_t)v9;
  *uint64_t v9 = sub_24F360E20();
  v9[1] = v16;
  char v33 = 1;
  v9[2] = sub_24F360E20();
  v9[3] = v17;
  char v32 = 2;
  v9[4] = sub_24F360E20();
  v9[5] = v18;
  char v31 = 3;
  sub_24F35B060(&qword_2699FEEE8, MEMORY[0x263F06EA8]);
  sub_24F360E40();
  uint64_t v22 = 0;
  uint64_t v19 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v15 + *(int *)(v23 + 28), v11, v13);
  char v30 = 4;
  uint64_t v20 = sub_24F360E30();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v14);
  *(void *)(v15 + *(int *)(v19 + 32)) = v20;
  sub_24F35AF58(v15, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return sub_24F35AFBC(v15);
}

uint64_t sub_24F35ABB0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SharePlayActivity.init(from:)(a1, a2);
}

uint64_t sub_24F35ABC8(void *a1)
{
  return SharePlayActivity.encode(to:)(a1);
}

uint64_t sub_24F35ABE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024F362770 || (sub_24F360EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F362790 || (sub_24F360EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_24F360EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B6361626C6C6166 && a2 == 0xEB000000004C5255 || (sub_24F360EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7974697669746361 && a2 == 0xEC00000065707954)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24F360EA0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

BOOL _s23FitnessSharePlaySession0bC8ActivityV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_24F360EA0(), result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_24F360EA0(), BOOL result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_24F360EA0(), BOOL result = 0, (v9 & 1) != 0))
      {
        uint64_t v10 = type metadata accessor for SharePlayActivity();
        return (MEMORY[0x25335A850]((char *)a1 + *(int *)(v10 + 28), (char *)a2 + *(int *)(v10 + 28)) & 1) != 0
            && *(void *)((char *)a1 + *(int *)(v10 + 32)) == *(void *)((char *)a2 + *(int *)(v10 + 32));
      }
    }
  }
  return result;
}

unint64_t sub_24F35AF04()
{
  unint64_t result = qword_2699FEED0;
  if (!qword_2699FEED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEED0);
  }
  return result;
}

uint64_t sub_24F35AF58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F35AFBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F35B018()
{
  return sub_24F35B060(&qword_2699FEEF0, (void (*)(uint64_t))type metadata accessor for SharePlayActivity);
}

uint64_t sub_24F35B060(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for SharePlayActivity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v16 = (char *)a1 + v10;
    char v11 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v12 = sub_24F360D10();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v16, v11, v12);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
  }
  return v4;
}

uint64_t destroy for SharePlayActivity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24F360D10();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for SharePlayActivity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[5];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v9;
  uint64_t v10 = (char *)a2 + v9;
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v11 = sub_24F360D10();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v14, v10, v11);
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithCopy for SharePlayActivity(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24F360D10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_OWORD *initializeWithTake for SharePlayActivity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24F360D10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

void *assignWithTake for SharePlayActivity(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24F360D10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(void *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlayActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F35B5A4);
}

uint64_t sub_24F35B5A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24F360D10();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SharePlayActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F35B668);
}

uint64_t sub_24F35B668(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24F360D10();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24F35B710()
{
  uint64_t result = sub_24F360D10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SharePlayActivity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SharePlayActivity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F35B914);
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

uint64_t sub_24F35B93C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F35B944(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SharePlayActivity.CodingKeys()
{
  return &type metadata for SharePlayActivity.CodingKeys;
}

unint64_t sub_24F35B960()
{
  unint64_t result = qword_2699FEEF8;
  if (!qword_2699FEEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEEF8);
  }
  return result;
}

unint64_t sub_24F35B9B8()
{
  unint64_t result = qword_2699FEF00;
  if (!qword_2699FEF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF00);
  }
  return result;
}

unint64_t sub_24F35BA10()
{
  unint64_t result = qword_2699FEF08;
  if (!qword_2699FEF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF08);
  }
  return result;
}

uint64_t SharePlaySessionEnvironment.handleSharePlayBeginActivityRequested.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t SharePlaySessionEnvironment.makeSharePlayBeginActivityRequestedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t SharePlaySessionEnvironment.init(handleSharePlayBeginActivityRequested:makeSharePlayBeginActivityRequestedStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SharePlaySessionEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharePlaySessionEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SharePlaySessionEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SharePlaySessionEnvironment(void *a1, void *a2)
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

_OWORD *assignWithTake for SharePlaySessionEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionEnvironment(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharePlaySessionEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SharePlaySessionEnvironment()
{
  return &type metadata for SharePlaySessionEnvironment;
}

uint64_t sub_24F35BCD8()
{
  return 12383;
}

uint64_t sub_24F35BCE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24F360EA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24F35BD64(uint64_t a1)
{
  unint64_t v2 = sub_24F35C4BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35BDA0(uint64_t a1)
{
  unint64_t v2 = sub_24F35C4BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F35BDDC()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0x6570704177656976;
  }
}

uint64_t sub_24F35BE24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F35DD78(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F35BE4C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F35BE58(uint64_t a1)
{
  unint64_t v2 = sub_24F35C404();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35BE94(uint64_t a1)
{
  unint64_t v2 = sub_24F35C404();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F35BED0()
{
  return 0;
}

uint64_t sub_24F35BEDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24F35BF0C(uint64_t a1)
{
  unint64_t v2 = sub_24F35C510();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35BF48(uint64_t a1)
{
  unint64_t v2 = sub_24F35C510();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SharePlaySessionAction.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05C8);
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v26 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SharePlayActivity();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (uint64_t)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05C0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SharePlaySessionAction();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05B8);
  uint64_t v13 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35C404();
  sub_24F360EF0();
  sub_24F35C458(v29, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) == 1)
  {
    char v31 = 0;
    sub_24F35C510();
    uint64_t v16 = v30;
    sub_24F360E60();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v16);
  }
  else
  {
    uint64_t v18 = v25;
    sub_24F35CBA8((uint64_t)v12, v25, (uint64_t (*)(void))type metadata accessor for SharePlayActivity);
    char v32 = 1;
    sub_24F35C4BC();
    uint64_t v19 = v26;
    uint64_t v20 = v30;
    sub_24F360E60();
    sub_24F35CB64(&qword_2699FEF18);
    uint64_t v21 = v28;
    sub_24F360E90();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v21);
    sub_24F35AFBC(v18);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v20);
  }
}

uint64_t type metadata accessor for SharePlaySessionAction()
{
  uint64_t result = qword_26B1F0410;
  if (!qword_26B1F0410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F35C404()
{
  unint64_t result = qword_26B1F0540;
  if (!qword_26B1F0540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0540);
  }
  return result;
}

uint64_t sub_24F35C458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharePlaySessionAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F35C4BC()
{
  unint64_t result = qword_2699FEF10;
  if (!qword_2699FEF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF10);
  }
  return result;
}

unint64_t sub_24F35C510()
{
  unint64_t result = qword_26B1F0558;
  if (!qword_26B1F0558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0558);
  }
  return result;
}

uint64_t SharePlaySessionAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF20);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  uint64_t v37 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v41 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF28);
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v40 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF30);
  uint64_t v39 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SharePlaySessionAction();
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v31 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35C404();
  uint64_t v17 = v42;
  sub_24F360EE0();
  if (!v17)
  {
    char v32 = v14;
    char v33 = v16;
    uint64_t v18 = v40;
    uint64_t v19 = v41;
    v42 = a1;
    uint64_t v20 = sub_24F360E50();
    if (*(void *)(v20 + 16) == 1)
    {
      a1 = v42;
      if (*(unsigned char *)(v20 + 32))
      {
        v40 = (char *)v20;
        char v44 = 1;
        sub_24F35C4BC();
        uint64_t v21 = v19;
        sub_24F360E00();
        uint64_t v26 = type metadata accessor for SharePlayActivity();
        sub_24F35CB64(&qword_2699FEF40);
        uint64_t v27 = (uint64_t)v32;
        uint64_t v28 = v36;
        sub_24F360E40();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v28);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
        a1 = v42;
        uint64_t v29 = (uint64_t)v33;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v27, 0, 1, v26);
        sub_24F35CBA8(v27, v29, (uint64_t (*)(void))type metadata accessor for SharePlaySessionAction);
      }
      else
      {
        char v43 = 0;
        sub_24F35C510();
        sub_24F360E00();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
        uint64_t v30 = type metadata accessor for SharePlayActivity();
        uint64_t v29 = (uint64_t)v33;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v33, 1, 1, v30);
      }
      sub_24F35CBA8(v29, v38, (uint64_t (*)(void))type metadata accessor for SharePlaySessionAction);
    }
    else
    {
      uint64_t v22 = sub_24F360DF0();
      swift_allocError();
      uint64_t v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF38);
      *uint64_t v24 = v11;
      sub_24F360E10();
      sub_24F360DE0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
      a1 = v42;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24F35CB64(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SharePlayActivity();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F35CBA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F35CC10@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SharePlaySessionAction.init(from:)(a1, a2);
}

uint64_t sub_24F35CC28(void *a1)
{
  return SharePlaySessionAction.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SharePlaySessionAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for SharePlayActivity();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      uint64_t v12 = a2[5];
      a1[4] = a2[4];
      a1[5] = v12;
      uint64_t v13 = *(int *)(v7 + 28);
      uint64_t v17 = (char *)a2 + v13;
      uint64_t v18 = (char *)a1 + v13;
      uint64_t v14 = sub_24F360D10();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15(v18, v17, v14);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 32));
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SharePlaySessionAction(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharePlayActivity();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(v2 + 28);
    uint64_t v5 = sub_24F360D10();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *initializeWithCopy for SharePlaySessionAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    uint64_t v11 = *(int *)(v6 + 28);
    uint64_t v15 = (char *)a2 + v11;
    uint64_t v16 = (char *)a1 + v11;
    uint64_t v12 = sub_24F360D10();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v16, v15, v12);
    *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for SharePlaySessionAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
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
      uint64_t v15 = *(int *)(v6 + 28);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_24F360D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
      *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
      return a1;
    }
    sub_24F35AFBC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  uint64_t v11 = *(int *)(v6 + 28);
  uint64_t v19 = (char *)a2 + v11;
  uint64_t v20 = (char *)a1 + v11;
  uint64_t v12 = sub_24F360D10();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v20, v19, v12);
  *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

_OWORD *initializeWithTake for SharePlaySessionAction(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    long long v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    uint64_t v9 = *(int *)(v6 + 28);
    int v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_24F360D10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for SharePlaySessionAction(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(void *)(v6 - 8);
  long long v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      swift_bridgeObjectRelease();
      uint64_t v18 = a2[3];
      a1[2] = a2[2];
      a1[3] = v18;
      swift_bridgeObjectRelease();
      uint64_t v19 = a2[5];
      a1[4] = a2[4];
      a1[5] = v19;
      swift_bridgeObjectRelease();
      uint64_t v20 = *(int *)(v6 + 28);
      uint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_24F360D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
      *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
      return a1;
    }
    sub_24F35AFBC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  long long v11 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v11;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v12 = *(int *)(v6 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_24F360D10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(void *)((char *)a1 + *(int *)(v6 + 32)) = *(void *)((char *)a2 + *(int *)(v6 + 32));
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharePlaySessionAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F35D674);
}

uint64_t sub_24F35D674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharePlayActivity();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SharePlaySessionAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F35D6F4);
}

uint64_t sub_24F35D6F4(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_24F35D774(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SharePlayActivity();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_24F35D7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharePlayActivity();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_24F35D84C()
{
  uint64_t result = type metadata accessor for SharePlayActivity();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SharePlaySessionAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F35D990);
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

unsigned char *sub_24F35D9B8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.CodingKeys()
{
  return &type metadata for SharePlaySessionAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.ViewAppearedCodingKeys()
{
  return &type metadata for SharePlaySessionAction.ViewAppearedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for SharePlaySessionAction.BeginActivityRequestedCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F35DA80);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionAction.BeginActivityRequestedCodingKeys()
{
  return &type metadata for SharePlaySessionAction.BeginActivityRequestedCodingKeys;
}

unint64_t sub_24F35DABC()
{
  unint64_t result = qword_2699FEF48;
  if (!qword_2699FEF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF48);
  }
  return result;
}

unint64_t sub_24F35DB14()
{
  unint64_t result = qword_2699FEF50;
  if (!qword_2699FEF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF50);
  }
  return result;
}

unint64_t sub_24F35DB6C()
{
  unint64_t result = qword_26B1F0568;
  if (!qword_26B1F0568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0568);
  }
  return result;
}

unint64_t sub_24F35DBC4()
{
  unint64_t result = qword_26B1F0560;
  if (!qword_26B1F0560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0560);
  }
  return result;
}

unint64_t sub_24F35DC1C()
{
  unint64_t result = qword_26B1F0578;
  if (!qword_26B1F0578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0578);
  }
  return result;
}

unint64_t sub_24F35DC74()
{
  unint64_t result = qword_26B1F0570;
  if (!qword_26B1F0570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0570);
  }
  return result;
}

unint64_t sub_24F35DCCC()
{
  unint64_t result = qword_26B1F0550;
  if (!qword_26B1F0550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0550);
  }
  return result;
}

unint64_t sub_24F35DD24()
{
  unint64_t result = qword_26B1F0548;
  if (!qword_26B1F0548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0548);
  }
  return result;
}

uint64_t sub_24F35DD78(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v2 || (sub_24F360EA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024F3627E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F360EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

BOOL static SharePlayState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F35DE98(uint64_t a1)
{
  unint64_t v2 = sub_24F35E358();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35DED4(uint64_t a1)
{
  unint64_t v2 = sub_24F35E358();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F35DF18()
{
  if (*v0) {
    return 0x657669746361;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_24F35DF48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F35ECF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F35DF70(uint64_t a1)
{
  unint64_t v2 = sub_24F35E304();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35DFAC(uint64_t a1)
{
  unint64_t v2 = sub_24F35E304();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F35DFE8(uint64_t a1)
{
  unint64_t v2 = sub_24F35E3AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F35E024(uint64_t a1)
{
  unint64_t v2 = sub_24F35E3AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SharePlayState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF58);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF60);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF68);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35E304();
  sub_24F360EF0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F35E358();
    uint64_t v14 = v18;
    sub_24F360E60();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F35E3AC();
    sub_24F360E60();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F35E304()
{
  unint64_t result = qword_2699FEF70;
  if (!qword_2699FEF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF70);
  }
  return result;
}

unint64_t sub_24F35E358()
{
  unint64_t result = qword_2699FEF78;
  if (!qword_2699FEF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF78);
  }
  return result;
}

unint64_t sub_24F35E3AC()
{
  unint64_t result = qword_2699FEF80;
  if (!qword_2699FEF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEF80);
  }
  return result;
}

uint64_t SharePlayState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF88);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF90);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF98);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F35E304();
  long long v11 = v32;
  sub_24F360EE0();
  if (v11) {
    goto LABEL_6;
  }
  char v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_24F360E50();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F360DF0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699FEF38);
    *char v22 = &type metadata for SharePlayState;
    sub_24F360E10();
    sub_24F360DE0();
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
    sub_24F35E358();
    uint64_t v18 = v14;
    sub_24F360E00();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F35E3AC();
    sub_24F360E00();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24F35E858@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SharePlayState.init(from:)(a1, a2);
}

uint64_t sub_24F35E870(void *a1)
{
  return SharePlayState.encode(to:)(a1);
}

uint64_t SharePlayState.hash(into:)()
{
  return sub_24F360EC0();
}

uint64_t SharePlayState.hashValue.getter()
{
  return sub_24F360ED0();
}

unint64_t sub_24F35E900()
{
  unint64_t result = qword_2699FEFA0;
  if (!qword_2699FEFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharePlayState()
{
  return &type metadata for SharePlayState;
}

unsigned char *_s23FitnessSharePlaySession14SharePlayStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F35EA38);
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

ValueMetadata *type metadata accessor for SharePlayState.CodingKeys()
{
  return &type metadata for SharePlayState.CodingKeys;
}

ValueMetadata *type metadata accessor for SharePlayState.IdleCodingKeys()
{
  return &type metadata for SharePlayState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for SharePlayState.ActiveCodingKeys()
{
  return &type metadata for SharePlayState.ActiveCodingKeys;
}

unint64_t sub_24F35EA94()
{
  unint64_t result = qword_2699FEFA8;
  if (!qword_2699FEFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFA8);
  }
  return result;
}

unint64_t sub_24F35EAEC()
{
  unint64_t result = qword_2699FEFB0;
  if (!qword_2699FEFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFB0);
  }
  return result;
}

unint64_t sub_24F35EB44()
{
  unint64_t result = qword_2699FEFB8;
  if (!qword_2699FEFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFB8);
  }
  return result;
}

unint64_t sub_24F35EB9C()
{
  unint64_t result = qword_2699FEFC0;
  if (!qword_2699FEFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFC0);
  }
  return result;
}

unint64_t sub_24F35EBF4()
{
  unint64_t result = qword_2699FEFC8;
  if (!qword_2699FEFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFC8);
  }
  return result;
}

unint64_t sub_24F35EC4C()
{
  unint64_t result = qword_2699FEFD0;
  if (!qword_2699FEFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699FEFD0);
  }
  return result;
}

unint64_t sub_24F35ECA4()
{
  unint64_t result = qword_2699FEFD8;
  if (!qword_2699FEFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2699FEFD8);
  }
  return result;
}

uint64_t sub_24F35ECF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_24F360EA0() & 1) != 0)
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
    char v6 = sub_24F360EA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

__n128 SharePlaySessionFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SharePlaySessionFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, unsigned char *a2, void **a3, uint64_t a4)
{
  v67 = a3;
  v63 = a2;
  uint64_t v6 = type metadata accessor for SharePlayActivity();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v65 = (char *)&v62 - v11;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05A8);
  uint64_t v70 = *(void *)(v66 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v66);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v62 - v15;
  uint64_t v17 = type metadata accessor for SharePlaySessionAction();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *v4;
  uint64_t v20 = v4[1];
  uint64_t v22 = v4[2];
  uint64_t v23 = v4[3];
  uint64_t v68 = v22;
  uint64_t v69 = v20;
  sub_24F3602C4(a4, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for SharePlaySessionAction);
  uint64_t v64 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v19, 1, v6);
  if (result == 1)
  {
    uint64_t v25 = v68;
    uint64_t v26 = v69;
    uint64_t v27 = v70;
    if ((*v63 & 1) == 0)
    {
      unsigned char *v63 = 1;
      uint64_t v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05B0);
      uint64_t v29 = v23;
      v65 = &v16[v28[16]];
      uint64_t v30 = &v16[v28[20]];
      uint64_t v31 = &v16[v28[24]];
      char v71 = 1;
      sub_24F35F4F0();
      sub_24F360DD0();
      sub_24F360DB0();
      uint64_t v32 = *MEMORY[0x263F39570];
      uint64_t v33 = sub_24F360D30();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v30, v32, v33);
      char v34 = (void *)swift_allocObject();
      v34[2] = v21;
      v34[3] = v26;
      v34[4] = v25;
      v34[5] = v29;
      *(void *)uint64_t v31 = &unk_2699FEFF8;
      *((void *)v31 + 1) = v34;
      uint64_t v35 = *MEMORY[0x263F39588];
      uint64_t v36 = sub_24F360D40();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v65, v35, v36);
      uint64_t v37 = v66;
      (*(void (**)(char *, void, uint64_t))(v27 + 104))(v16, *MEMORY[0x263F39530], v66);
      uint64_t v38 = v67;
      uint64_t v39 = *v67;
      swift_retain();
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v39 = (void *)sub_24F360644(0, v39[2] + 1, 1, v39);
      }
      unint64_t v41 = v39[2];
      unint64_t v40 = v39[3];
      if (v41 >= v40 >> 1) {
        uint64_t v39 = (void *)sub_24F360644(v40 > 1, v41 + 1, 1, v39);
      }
      v39[2] = v41 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v27 + 32))((unint64_t)v39+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v41, v16, v37);
      *uint64_t v38 = v39;
    }
  }
  else
  {
    uint64_t v42 = (uint64_t)v65;
    sub_24F35F48C((uint64_t)v19, (uint64_t)v65);
    char v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05B0);
    uint64_t v44 = v23;
    v45 = &v14[v43[16]];
    v46 = &v14[v43[20]];
    v47 = &v14[v43[24]];
    char v72 = 0;
    sub_24F35F4F0();
    sub_24F360DD0();
    sub_24F360DB0();
    uint64_t v48 = *MEMORY[0x263F39580];
    uint64_t v49 = sub_24F360D40();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v45, v48, v49);
    sub_24F3602C4(v42, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SharePlayActivity);
    unint64_t v50 = (*(unsigned __int8 *)(v64 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    v51 = (void *)swift_allocObject();
    uint64_t v52 = v68;
    uint64_t v53 = v69;
    v51[2] = v21;
    v51[3] = v53;
    v51[4] = v52;
    v51[5] = v44;
    sub_24F35F48C((uint64_t)v10, (uint64_t)v51 + v50);
    *(void *)v47 = &unk_2699FEFE8;
    *((void *)v47 + 1) = v51;
    uint64_t v54 = *MEMORY[0x263F39578];
    uint64_t v55 = sub_24F360D30();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 104))(v46, v54, v55);
    uint64_t v56 = v70;
    uint64_t v57 = v66;
    (*(void (**)(char *, void, uint64_t))(v70 + 104))(v14, *MEMORY[0x263F39530], v66);
    v58 = v67;
    v59 = *v67;
    swift_retain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v59 = (void *)sub_24F360644(0, v59[2] + 1, 1, v59);
    }
    unint64_t v61 = v59[2];
    unint64_t v60 = v59[3];
    if (v61 >= v60 >> 1) {
      v59 = (void *)sub_24F360644(v60 > 1, v61 + 1, 1, v59);
    }
    v59[2] = v61 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v56 + 32))((unint64_t)v59+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v61, v14, v57);
    void *v58 = v59;
    return sub_24F360C98(v42, (uint64_t (*)(void))type metadata accessor for SharePlayActivity);
  }
  return result;
}

uint64_t sub_24F35F48C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SharePlayActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F35F4F0()
{
  unint64_t result = qword_26B1F0590;
  if (!qword_26B1F0590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0590);
  }
  return result;
}

uint64_t sub_24F35F544(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[12] = a1;
  type metadata accessor for SharePlaySessionAction();
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F0530);
  v4[14] = swift_task_alloc();
  v4[15] = sub_24F360DA0();
  v4[16] = sub_24F360D90();
  uint64_t v8 = (uint64_t (*)(void *))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[17] = v6;
  void *v6 = v4;
  v6[1] = sub_24F35F6AC;
  return v8(v4 + 7);
}

uint64_t sub_24F35F6AC()
{
  BOOL v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F360D70();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24F35FF28;
  }
  else {
    uint64_t v5 = sub_24F35F80C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F35F80C()
{
  uint64_t v1 = v0[10];
  BOOL v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F360DC0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F360D90();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  void *v6 = v0;
  v6[1] = sub_24F35F9F4;
  uint64_t v7 = v0[14];
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v7, v5, v8);
}

uint64_t sub_24F35F9F4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24F35FB38, v3, v2);
}

uint64_t sub_24F35FB38()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = type metadata accessor for SharePlayActivity();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v0[13];
    sub_24F35F48C(v1, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v6, 0, 1, v2);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[23] = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2699FF000);
    *uint64_t v7 = v0;
    v7[1] = sub_24F35FCF0;
    uint64_t v9 = v0[13];
    return MEMORY[0x270F252C8](v9, v8);
  }
}

uint64_t sub_24F35FCF0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  swift_task_dealloc();
  sub_24F360C98(v2, (uint64_t (*)(void))type metadata accessor for SharePlaySessionAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24F35FE48, v4, v3);
}

uint64_t sub_24F35FE48()
{
  uint64_t v1 = sub_24F360D90();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F35F9F4;
  uint64_t v3 = v0[14];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_24F35FF28()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F35FFA0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = sub_24F360DA0();
  v6[3] = sub_24F360D90();
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v9 = (void *)swift_task_alloc();
  v6[4] = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_24F3600A0;
  return v11(a6);
}

uint64_t sub_24F3600A0()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F360D70();
  if (v0) {
    uint64_t v4 = sub_24F360260;
  }
  else {
    uint64_t v4 = sub_24F3601FC;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F3601FC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F360260()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3602C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24F36032C()
{
  uint64_t v1 = (int *)(type metadata accessor for SharePlayActivity() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[9];
  uint64_t v7 = sub_24F360D10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24F360440(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for SharePlayActivity() - 8);
  uint64_t v5 = (int *)v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24F36053C;
  return sub_24F35FFA0(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24F36053C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char *SharePlaySessionFeature.dispose(localState:sharedState:)(unsigned char *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_24F360638(uint64_t a1, unsigned char *a2)
{
  *a2 = 0;
}

size_t sub_24F360644(size_t result, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1F05D0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05A8) - 8);
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
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1F05A8) - 8);
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

uint64_t sub_24F360820()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24F360860(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int64_t v7 = v2;
  v7[1] = sub_24F360CFC;
  return sub_24F35F544(a1, v4, v5, v6);
}

uint64_t sub_24F36091C()
{
  return sub_24F360984(&qword_26B1F0588);
}

uint64_t sub_24F360950()
{
  return sub_24F360984(&qword_26B1F0580);
}

uint64_t sub_24F360984(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SharePlaySessionAction();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24F3609CC()
{
  unint64_t result = qword_26B1F05A0;
  if (!qword_26B1F05A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F05A0);
  }
  return result;
}

unint64_t sub_24F360A24()
{
  unint64_t result = qword_26B1F0538;
  if (!qword_26B1F0538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0538);
  }
  return result;
}

ValueMetadata *type metadata accessor for SharePlaySessionFeature()
{
  return &type metadata for SharePlaySessionFeature;
}

unsigned char *storeEnumTagSinglePayload for SharePlaySessionFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F360B54);
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

ValueMetadata *type metadata accessor for SharePlaySessionFeature.TaskIdentifier()
{
  return &type metadata for SharePlaySessionFeature.TaskIdentifier;
}

unint64_t sub_24F360B90()
{
  unint64_t result = qword_26B1F0598;
  if (!qword_26B1F0598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F0598);
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

uint64_t sub_24F360C98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F360D10()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24F360D30()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F360D40()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F360D50()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24F360D60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F360D70()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F360D90()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F360DA0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F360DB0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F360DC0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24F360DD0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F360DE0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F360DF0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F360E00()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F360E10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F360E20()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F360E30()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24F360E40()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F360E50()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F360E60()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F360E70()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F360E80()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24F360E90()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F360EA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F360EB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F360EC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F360ED0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F360EE0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F360EF0()
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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