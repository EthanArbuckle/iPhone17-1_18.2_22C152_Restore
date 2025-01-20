uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

uint64_t GridDescriptor.count.getter()
{
  return *(void *)v0;
}

__n128 GridDescriptor.margins.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 8);
  long long v3 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

double GridDescriptor.spacing.getter()
{
  return *(double *)(v0 + 40);
}

uint64_t GridDescriptor.span.getter()
{
  return *(void *)(v0 + 48);
}

BOOL sub_24EE8965C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24EE89670()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE896B8()
{
  return sub_24EEDDF60();
}

uint64_t sub_24EE896E4()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE89728()
{
  uint64_t result = 0x746E756F63;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x736E696772616DLL;
      break;
    case 2:
      uint64_t result = 0x676E6963617073;
      break;
    case 3:
      uint64_t result = 1851879539;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EE897AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE8ABB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EE897D4()
{
  return 0;
}

void sub_24EE897E0(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24EE897EC(uint64_t a1)
{
  unint64_t v2 = sub_24EE89ABC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE89828(uint64_t a1)
{
  unint64_t v2 = sub_24EE89ABC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GridDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269977FC0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[4];
  uint64_t v12 = v1[5];
  uint64_t v14 = v1[6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE89ABC();
  sub_24EEDDFC0();
  LOBYTE(v16) = 0;
  sub_24EEDDE50();
  if (!v2)
  {
    uint64_t v16 = v8;
    uint64_t v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    char v15 = 1;
    sub_24EE89B10();
    sub_24EEDDE60();
    uint64_t v16 = v12;
    char v15 = 2;
    sub_24EE89B64();
    sub_24EEDDE60();
    LOBYTE(v16) = 3;
    sub_24EEDDE50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24EE89ABC()
{
  unint64_t result = qword_269977FC8;
  if (!qword_269977FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269977FC8);
  }
  return result;
}

unint64_t sub_24EE89B10()
{
  unint64_t result = qword_269977FD0;
  if (!qword_269977FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269977FD0);
  }
  return result;
}

unint64_t sub_24EE89B64()
{
  unint64_t result = qword_26B1E7370;
  if (!qword_26B1E7370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7370);
  }
  return result;
}

uint64_t GridDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269977FD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE89ABC();
  sub_24EEDDFB0();
  if (!v2)
  {
    LOBYTE(v19) = 0;
    uint64_t v9 = sub_24EEDDDD0();
    char v18 = 1;
    sub_24EE89E48();
    sub_24EEDDDE0();
    uint64_t v10 = v19;
    uint64_t v11 = v20;
    uint64_t v12 = v21;
    uint64_t v13 = v22;
    char v18 = 2;
    sub_24EE89E9C();
    sub_24EEDDDE0();
    uint64_t v15 = v19;
    LOBYTE(v19) = 3;
    uint64_t v16 = sub_24EEDDDD0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
    a2[3] = v12;
    a2[4] = v13;
    a2[5] = v15;
    a2[6] = v16;
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

unint64_t sub_24EE89E48()
{
  unint64_t result = qword_269977FE0;
  if (!qword_269977FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269977FE0);
  }
  return result;
}

unint64_t sub_24EE89E9C()
{
  unint64_t result = qword_269977FE8;
  if (!qword_269977FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269977FE8);
  }
  return result;
}

uint64_t sub_24EE89EE4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return GridDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EE89EFC(void *a1)
{
  return GridDescriptor.encode(to:)(a1);
}

uint64_t GridDescriptor.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t GridDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE8A040()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE8A0DC()
{
  return sub_24EEDD9F0();
}

uint64_t sub_24EE8A0F8(uint64_t a1, uint64_t a2)
{
  int v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x25334EDF0](a1, &v6);
  char v4 = v7;
  int v5 = v6;
  if (v7) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_24EE8A14C(uint64_t a1, uint64_t a2)
{
  int v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x25334EE00](a1, &v7);
  char v4 = v8;
  int v5 = v7;
  if (v8) {
    int v5 = 0;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_24EE8A1A4(float *a1@<X8>)
{
  *a1 = MEMORY[0x25334EE10]();
}

uint64_t sub_24EE8A1CC()
{
  return sub_24EEDD2F0();
}

uint64_t sub_24EE8A1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  char v7 = 1;
  uint64_t result = MEMORY[0x25334E6F0](a1, &v6);
  char v4 = v7;
  uint64_t v5 = v6;
  if (v7) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_24EE8A23C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  char v8 = 1;
  char v3 = MEMORY[0x25334E700](a1, &v7);
  char v4 = v8;
  uint64_t v5 = v7;
  if (v8) {
    uint64_t v5 = 0;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_24EE8A294(double *a1@<X8>)
{
  *a1 = MEMORY[0x25334E710]();
}

uint64_t sub_24EE8A2BC(uint64_t a1, uint64_t a2)
{
  return sub_24EE8A430(a1, a2, MEMORY[0x270FA9BC0]);
}

uint64_t sub_24EE8A2D4(uint64_t a1, uint64_t a2)
{
  return sub_24EE8A430(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24EE8A2F4(uint64_t a1, id *a2)
{
  uint64_t result = sub_24EEDD7C0();
  *a2 = 0;
  return result;
}

uint64_t sub_24EE8A36C(uint64_t a1, id *a2)
{
  char v3 = sub_24EEDD7D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24EE8A3EC@<X0>(uint64_t *a1@<X8>)
{
  sub_24EEDD7E0();
  uint64_t v2 = sub_24EEDD7B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24EE8A430(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24EEDD7E0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24EE8A474()
{
  sub_24EEDD7E0();
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EE8A4C8()
{
  sub_24EEDD7E0();
  sub_24EEDDF50();
  sub_24EEDD830();
  uint64_t v0 = sub_24EEDDFA0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24EE8A540()
{
  uint64_t v0 = sub_24EEDD7E0();
  uint64_t v2 = v1;
  if (v0 == sub_24EEDD7E0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24EEDDE90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_DWORD *sub_24EE8A5CC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

float sub_24EE8A5DC@<S0>(_DWORD *a1@<X8>)
{
  float result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_24EE8A5E8()
{
  return sub_24EEDDD60();
}

void *sub_24EE8A6A4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

double sub_24EE8A6B4@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_24EE8A6C0()
{
  return sub_24EEDDD60();
}

uint64_t sub_24EE8A78C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24EEDD7E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24EE8A7B8()
{
  sub_24EE8B2BC((unint64_t *)&qword_26B1E7658, type metadata accessor for Key);
  sub_24EE8B2BC(&qword_269978100, type metadata accessor for Key);
  return sub_24EEDDD60();
}

uint64_t sub_24EE8A874()
{
  sub_24EE8B2BC((unint64_t *)&qword_269978080, type metadata accessor for AttributeName);
  sub_24EE8B2BC(&qword_269978088, type metadata accessor for AttributeName);
  return sub_24EEDDD60();
}

uint64_t sub_24EE8A930()
{
  sub_24EE8B2BC(&qword_269978120, type metadata accessor for TraitKey);
  sub_24EE8B2BC(&qword_269978128, type metadata accessor for TraitKey);
  return sub_24EEDDD60();
}

uint64_t sub_24EE8A9EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24EEDD7B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24EE8AA34()
{
  sub_24EE8B2BC(&qword_269978090, type metadata accessor for FeatureKey);
  sub_24EE8B2BC(&qword_269978098, type metadata accessor for FeatureKey);
  return sub_24EEDDD60();
}

uint64_t sub_24EE8AAF0()
{
  return MEMORY[0x270F9DE70](*v0);
}

uint64_t sub_24EE8AAF8()
{
  return sub_24EEDDF80();
}

void sub_24EE8AB2C()
{
}

uint64_t sub_24EE8AB40()
{
  return MEMORY[0x270F9DDC0](*v0);
}

uint64_t sub_24EE8AB48()
{
  return sub_24EEDDF90();
}

uint64_t sub_24EE8AB7C(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return MEMORY[0x270F9FC40](a1, v2);
}

BOOL sub_24EE8AB8C(float *a1, float *a2)
{
  return *a1 == *a2;
}

BOOL sub_24EE8ABA0(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24EE8ABB4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E756F63 && a2 == 0xE500000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E696772616DLL && a2 == 0xE700000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E6963617073 && a2 == 0xE700000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1851879539 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

BOOL _s13FitnessCoreUI14GridDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (*(void *)a1 == *(void *)a2
    && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0&& *(double *)(a1 + 40) == *(double *)(a2 + 40))
  {
    return *(void *)(a1 + 48) == *(void *)(a2 + 48);
  }
  return result;
}

unint64_t sub_24EE8ADEC()
{
  unint64_t result = qword_269977FF0;
  if (!qword_269977FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269977FF0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LayoutEdgeInsets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GridDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GridDescriptor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GridDescriptor()
{
  return &type metadata for GridDescriptor;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for LayoutEdgeInsets(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LayoutEdgeInsets(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

void type metadata accessor for FeatureKey(uint64_t a1)
{
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24EE8AFB0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24EE8AFD0(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GridDescriptor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GridDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE8B188);
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

uint64_t sub_24EE8B1B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24EE8B1BC(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GridDescriptor.CodingKeys()
{
  return &type metadata for GridDescriptor.CodingKeys;
}

unint64_t sub_24EE8B1D8()
{
  unint64_t result = qword_269978020;
  if (!qword_269978020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978020);
  }
  return result;
}

uint64_t sub_24EE8B22C()
{
  return sub_24EE8B2BC(&qword_269978028, type metadata accessor for UILayoutPriority);
}

uint64_t sub_24EE8B274()
{
  return sub_24EE8B2BC(&qword_269978030, type metadata accessor for UILayoutPriority);
}

uint64_t sub_24EE8B2BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EE8B304()
{
  return sub_24EE8B2BC(&qword_269978038, type metadata accessor for UILayoutPriority);
}

uint64_t sub_24EE8B34C()
{
  return sub_24EE8B2BC(&qword_269978040, type metadata accessor for FeatureKey);
}

uint64_t sub_24EE8B394()
{
  return sub_24EE8B2BC(&qword_269978048, type metadata accessor for FeatureKey);
}

uint64_t sub_24EE8B3DC()
{
  return sub_24EE8B2BC(&qword_269978050, type metadata accessor for FeatureKey);
}

uint64_t sub_24EE8B424()
{
  return sub_24EE8B2BC(&qword_269978058, type metadata accessor for AttributeName);
}

uint64_t sub_24EE8B46C()
{
  return sub_24EE8B2BC(&qword_269978060, type metadata accessor for AttributeName);
}

uint64_t sub_24EE8B4B4()
{
  return sub_24EE8B2BC(&qword_269978068, type metadata accessor for AttributeName);
}

unint64_t sub_24EE8B500()
{
  unint64_t result = qword_269978070;
  if (!qword_269978070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978070);
  }
  return result;
}

unint64_t sub_24EE8B558()
{
  unint64_t result = qword_269978078;
  if (!qword_269978078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978078);
  }
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

void sub_24EE8B5E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24EE8B630()
{
  return sub_24EE8B2BC(&qword_2699780C0, type metadata accessor for TraitKey);
}

uint64_t sub_24EE8B678()
{
  return sub_24EE8B2BC(&qword_2699780C8, type metadata accessor for TraitKey);
}

uint64_t sub_24EE8B6C0()
{
  return sub_24EE8B2BC(&qword_2699780D0, type metadata accessor for TraitKey);
}

uint64_t sub_24EE8B708()
{
  return sub_24EE8B2BC(&qword_2699780D8, type metadata accessor for Weight);
}

uint64_t sub_24EE8B750()
{
  return sub_24EE8B2BC(&qword_2699780E0, type metadata accessor for Weight);
}

uint64_t sub_24EE8B798()
{
  return sub_24EE8B2BC(&qword_2699780E8, type metadata accessor for Weight);
}

uint64_t sub_24EE8B7E0()
{
  return sub_24EE8B2BC(&qword_2699780F0, type metadata accessor for Key);
}

uint64_t sub_24EE8B828()
{
  return sub_24EE8B2BC(&qword_2699780F8, type metadata accessor for Key);
}

uint64_t sub_24EE8B870()
{
  return sub_24EE8B2BC(&qword_26B1E7660, type metadata accessor for Key);
}

unint64_t sub_24EE8B8B8()
{
  unint64_t result = qword_269978118;
  if (!qword_269978118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978118);
  }
  return result;
}

uint64_t ColorDescriptor.init(hex:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2) {
    goto LABEL_41;
  }
  uint64_t v5 = result;
  if (sub_24EEDD840() != 6 && sub_24EEDD840() != 8)
  {
LABEL_40:
    unint64_t result = swift_bridgeObjectRelease();
LABEL_41:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(unsigned char *)(a3 + 32) = 1;
    return result;
  }
  unint64_t v6 = sub_24EEDD850();
  unint64_t v7 = sub_24EEDD850();
  unint64_t v8 = sub_24EEDD850();
  uint64_t v9 = sub_24EEDD8E0();
  unint64_t v50 = v12;
  if (v7 >> 14 < v6 >> 14)
  {
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v13 = v9;
  unint64_t v14 = v10;
  unint64_t v15 = v11;
  uint64_t v16 = sub_24EEDD8E0();
  if (v8 >> 14 < v7 >> 14)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  unint64_t v46 = v18;
  unint64_t v47 = v17;
  unint64_t v48 = v16;
  unint64_t v20 = v19;
  uint64_t v49 = sub_24EEDD8E0();
  unint64_t v44 = v22;
  unint64_t v45 = v21;
  unint64_t v24 = v23;
  if (sub_24EEDD840() == 8)
  {
    uint64_t v25 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v25 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v8 >> 14 > 4 * v25)
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v26 = sub_24EEDD8E0();
    unint64_t v42 = v27;
    unint64_t v43 = v26;
    unint64_t v41 = v28;
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    unint64_t v41 = 0;
    unint64_t v30 = 0;
  }
  if (!((v13 ^ v14) >> 14)) {
    goto LABEL_36;
  }
  uint64_t v31 = sub_24EE8C8AC(v13, v14, v50, v15, 16);
  if ((v31 & 0x10000000000) != 0) {
    uint64_t v31 = sub_24EE8C04C(v13, v14, v50, v15, 16);
  }
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  if ((v32 & 0x100000000) != 0) {
    goto LABEL_31;
  }
  if (!((v48 ^ v47) >> 14))
  {
LABEL_38:
    swift_bridgeObjectRelease();
LABEL_39:
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v33 = sub_24EE8C8AC(v48, v47, v46, v20, 16);
  if ((v33 & 0x10000000000) != 0) {
    uint64_t v33 = sub_24EE8C04C(v48, v47, v46, v20, 16);
  }
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  if ((v34 & 0x100000000) != 0 || !((v49 ^ v45) >> 14)) {
    goto LABEL_39;
  }
  uint64_t v35 = sub_24EE8C8AC(v49, v45, v44, v24, 16);
  if ((v35 & 0x10000000000) != 0) {
    uint64_t v35 = sub_24EE8C04C(v49, v45, v44, v24, 16);
  }
  uint64_t v36 = v35;
  unint64_t result = swift_bridgeObjectRelease();
  if ((v36 & 0x100000000) != 0) {
    goto LABEL_40;
  }
  double v37 = 1.0;
  if (v30)
  {
    if ((v42 ^ v43) >> 14)
    {
      uint64_t v38 = sub_24EE8C8AC(v43, v42, v41, v30, 16);
      if ((v38 & 0x10000000000) != 0) {
        uint64_t v38 = sub_24EE8C04C(v43, v42, v41, v30, 16);
      }
      uint64_t v39 = v38;
      unint64_t result = swift_bridgeObjectRelease();
      if ((v39 & 0x100000000) == 0) {
        double v37 = (double)(int)v39 / 255.0;
      }
    }
    else
    {
      unint64_t result = swift_bridgeObjectRelease();
    }
  }
  v40.i64[0] = v36;
  v40.i64[1] = v34;
  *(double *)a3 = v37;
  *(float64x2_t *)(a3 + 8) = vdivq_f64(vcvtq_f64_s64(vshrq_n_s64(vshlq_n_s64(v40, 0x20uLL), 0x20uLL)), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL));
  *(double *)(a3 + 24) = (double)(int)v32 / 255.0;
  *(unsigned char *)(a3 + 32) = 0;
  return result;
}

Swift::String __swiftcall ColorDescriptor.hex()()
{
  double v2 = *v0;
  double v1 = v0[1];
  double v3 = v0[2];
  double v4 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269978130);
  double v5 = v4 * 255.999999;
  uint64_t v6 = *(void *)&v5 & 0x7FF0000000000000;
  if (v2 != 1.0)
  {
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_24EEDF650;
    if (v6 != 0x7FF0000000000000)
    {
      if (v5 > -9.22337204e18)
      {
        if (v5 < 9.22337204e18)
        {
          uint64_t v13 = MEMORY[0x263F8D6C8];
          uint64_t v14 = MEMORY[0x263F8D750];
          *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
          *(void *)(v7 + 64) = v14;
          *(void *)(v7 + 32) = (uint64_t)v5;
          double v15 = v3 * 255.999999;
          if ((~COERCE__INT64(v3 * 255.999999) & 0x7FF0000000000000) != 0)
          {
            if (v15 > -9.22337204e18)
            {
              if (v15 < 9.22337204e18)
              {
                *(void *)(v7 + 96) = v13;
                *(void *)(v7 + 104) = v14;
                *(void *)(v7 + 72) = (uint64_t)v15;
                double v16 = v1 * 255.999999;
                if ((~COERCE__INT64(v1 * 255.999999) & 0x7FF0000000000000) != 0)
                {
                  if (v16 > -9.22337204e18)
                  {
                    if (v16 < 9.22337204e18)
                    {
                      *(void *)(v7 + 136) = v13;
                      *(void *)(v7 + 144) = v14;
                      *(void *)(v7 + 112) = (uint64_t)v16;
                      double v17 = v2 * 255.999999;
                      if ((~COERCE__INT64(v2 * 255.999999) & 0x7FF0000000000000) != 0)
                      {
                        if (v17 > -9.22337204e18)
                        {
                          if (v17 < 9.22337204e18)
                          {
                            *(void *)(v7 + 176) = v13;
                            *(void *)(v7 + 184) = v14;
                            *(void *)(v7 + 152) = (uint64_t)v17;
                            goto LABEL_25;
                          }
LABEL_46:
                          __break(1u);
                          goto LABEL_47;
                        }
LABEL_45:
                        __break(1u);
                        goto LABEL_46;
                      }
LABEL_44:
                      __break(1u);
                      goto LABEL_45;
                    }
LABEL_43:
                    __break(1u);
                    goto LABEL_44;
                  }
LABEL_42:
                  __break(1u);
                  goto LABEL_43;
                }
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24EEDF660;
  if (v6 == 0x7FF0000000000000)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v9 = MEMORY[0x263F8D6C8];
  uint64_t v10 = MEMORY[0x263F8D750];
  *(void *)(v7 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 64) = v10;
  *(void *)(v7 + 32) = (uint64_t)v5;
  double v11 = v3 * 255.999999;
  if ((~COERCE__INT64(v3 * 255.999999) & 0x7FF0000000000000) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  *(void *)(v7 + 96) = v9;
  *(void *)(v7 + 104) = v10;
  *(void *)(v7 + 72) = (uint64_t)v11;
  double v12 = v1 * 255.999999;
  if ((~COERCE__INT64(v1 * 255.999999) & 0x7FF0000000000000) == 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v10;
  *(void *)(v7 + 112) = (uint64_t)v12;
LABEL_25:
  uint64_t v7 = sub_24EEDD7F0();
LABEL_47:
  result._object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

uint64_t sub_24EE8C04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_24EE8C980();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24EEDD8D0();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_24EE8C3C0();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_24EEDDC40();
  }
LABEL_7:
  uint64_t v13 = sub_24EE8C140(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_24EE8C140(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            uint64_t v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__OFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            uint64_t v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__OFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            uint64_t v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (__OFSUB__(v14, v15)) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24EE8C3C0()
{
  unint64_t v0 = sub_24EEDD8E0();
  uint64_t v4 = sub_24EE8C440(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24EE8C440(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_24EE8C598(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_24EE9523C(v9, 0);
      unint64_t v12 = sub_24EE8C698((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24EEDDC40();
LABEL_4:
        JUMPOUT(0x25334EC10);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25334EC10](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x25334EC10]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_24EE8C598(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    Swift::String result = sub_24EE952A4(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    Swift::String result = sub_24EE952A4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_24EEDD8A0();
}

unint64_t sub_24EE8C698(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    Swift::String result = v12;
    if (v17 == v15) {
      Swift::String result = sub_24EE952A4(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      Swift::String result = sub_24EEDD8B0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        Swift::String result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          Swift::String result = sub_24EEDDC40();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    Swift::String result = sub_24EE952A4(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24EEDD880();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24EE8C8AC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    unsigned __int8 v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v11 = (void *)sub_24EEDDC40();
  }
  uint64_t result = sub_24EE8C9D4((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    unsigned __int8 v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

unint64_t sub_24EE8C980()
{
  unint64_t result = qword_269978138;
  if (!qword_269978138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978138);
  }
  return result;
}

uint64_t sub_24EE8C9D4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    unint64_t result = sub_24EE952A4(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_104;
  }
  unint64_t result = sub_24EEDD8A0();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t result = sub_24EE952A4(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    unint64_t result = sub_24EE952A4(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    unint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_100;
  }
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  unint64_t result = sub_24EEDD8A0();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v34 = a6 + 55;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v34 = 65;
        }
        if (a6 <= 10) {
          unsigned __int8 v35 = a6 + 48;
        }
        else {
          unsigned __int8 v35 = 58;
        }
        if (v19)
        {
          unsigned int v24 = 0;
          uint64_t v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                unsigned int v29 = 0;
                unsigned __int8 v30 = 1;
                if (v38 < 0x61 || v38 >= v33) {
                  return v29 | ((unint64_t)v30 << 32);
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            uint64_t v40 = (int)v24 * (uint64_t)(int)a6;
            if (v40 != (int)v40) {
              goto LABEL_96;
            }
            unsigned __int8 v41 = v38 + v39;
            unsigned int v24 = v40 + v41;
            if (__OFADD__(v40, v41)) {
              goto LABEL_96;
            }
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          unsigned __int8 v30 = 0;
          unsigned int v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v43 = a6 + 55;
      }
      else
      {
        unsigned __int8 v42 = 97;
        unsigned __int8 v43 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v44 = a6 + 48;
      }
      else {
        unsigned __int8 v44 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v45 < 0x61 || v45 >= v42) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          uint64_t v47 = (int)v24 * (uint64_t)(int)a6;
          if (v47 != (int)v47) {
            goto LABEL_96;
          }
          unsigned __int8 v48 = v45 + v46;
          unsigned int v24 = v47 + v48;
          if (__OFADD__(v47, v48)) {
            goto LABEL_96;
          }
          ++v19;
          if (!--result) {
            goto LABEL_94;
          }
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    unsigned int v29 = 0;
    unsigned __int8 v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v22 = a6 + 55;
      }
      else
      {
        unsigned __int8 v21 = 97;
        unsigned __int8 v22 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v23 = a6 + 48;
      }
      else {
        unsigned __int8 v23 = 58;
      }
      if (v19)
      {
        unsigned int v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              unsigned int v29 = 0;
              unsigned __int8 v30 = 1;
              if (v27 < 0x61 || v27 >= v21) {
                return v29 | ((unint64_t)v30 << 32);
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v31 = (int)v24 * (uint64_t)(int)a6;
          if (v31 != (int)v31) {
            goto LABEL_96;
          }
          unsigned __int8 v32 = v27 + v28;
          unsigned int v24 = v31 - v32;
          if (__OFSUB__(v31, v32)) {
            goto LABEL_96;
          }
          ++v25;
          if (!--v26) {
            goto LABEL_94;
          }
        }
      }
LABEL_95:
      unsigned int v29 = 0;
      unsigned __int8 v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

BOOL TabItemStyle.shouldDisplaySystemImage.getter(unsigned __int8 a1)
{
  return a1 < 2u;
}

BOOL TabItemStyle.shouldDisplayTitle.getter(char a1)
{
  return (a1 & 1) == 0;
}

BOOL static TabItemStyle.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EE8CE28()
{
  return 0;
}

uint64_t sub_24EE8CE34@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24EE8CE64(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24EE8CE70(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D54C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE8CEAC(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D54C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EE8CEF0()
{
  uint64_t v1 = 0x6C6E4F6567616D69;
  if (*v0 != 1) {
    uint64_t v1 = 0x6C6E4F656C746974;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6974616D6F747561;
  }
}

uint64_t sub_24EE8CF48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE8D670(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EE8CF70(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24EE8CF7C(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D450();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE8CFB8(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D450();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EE8CFF4(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D4F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE8D030(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D4F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EE8D06C(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D4A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE8D0A8(uint64_t a1)
{
  unint64_t v2 = sub_24EE8D4A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemStyle.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978140);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x270FA5388]();
  unsigned __int8 v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978148);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978150);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978158);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE8D450();
  sub_24EEDDFC0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_24EE8D4F8();
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_24EE8D4A4();
      int64_t v15 = v21;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_24EE8D54C();
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_24EE8D450()
{
  unint64_t result = qword_269978160;
  if (!qword_269978160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978160);
  }
  return result;
}

unint64_t sub_24EE8D4A4()
{
  unint64_t result = qword_269978168;
  if (!qword_269978168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978168);
  }
  return result;
}

unint64_t sub_24EE8D4F8()
{
  unint64_t result = qword_269978170;
  if (!qword_269978170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978170);
  }
  return result;
}

unint64_t sub_24EE8D54C()
{
  unint64_t result = qword_269978178;
  if (!qword_269978178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978178);
  }
  return result;
}

void *TabItemStyle.init(from:)(void *a1)
{
  return sub_24EE8D7E0(a1);
}

void *sub_24EE8D5B8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EE8D7E0(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EE8D5E4(void *a1)
{
  return TabItemStyle.encode(to:)(a1, *v1);
}

uint64_t TabItemStyle.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t TabItemStyle.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE8D670(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6E4F6567616D69 && a2 == 0xE900000000000079 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6E4F656C746974 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_24EE8D7E0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699781D0);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388]();
  unsigned int v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699781D8);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699781E0);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699781E8);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE8D450();
  uint64_t v12 = (uint64_t)v30;
  sub_24EEDDFB0();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  unsigned __int8 v30 = a1;
  unint64_t v14 = v11;
  uint64_t v15 = sub_24EEDDDF0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_24EEDDC30();
    swift_allocError();
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *uint64_t v11 = &type metadata for TabItemStyle;
    sub_24EEDDD90();
    sub_24EEDDC20();
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
      sub_24EE8D4F8();
      sub_24EEDDD80();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_24EE8D4A4();
      sub_24EEDDD80();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_24EE8D54C();
    sub_24EEDDD80();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v11;
}

unint64_t sub_24EE8DD54()
{
  unint64_t result = qword_269978180;
  if (!qword_269978180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978180);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItemStyle()
{
  return &type metadata for TabItemStyle;
}

uint64_t getEnumTagSinglePayload for FloatingTabBar.DisplayMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13FitnessCoreUI12TabItemStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE8DF1CLL);
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

ValueMetadata *type metadata accessor for TabItemStyle.CodingKeys()
{
  return &type metadata for TabItemStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.AutomaticCodingKeys()
{
  return &type metadata for TabItemStyle.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.ImageOnlyCodingKeys()
{
  return &type metadata for TabItemStyle.ImageOnlyCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemStyle.TitleOnlyCodingKeys()
{
  return &type metadata for TabItemStyle.TitleOnlyCodingKeys;
}

unint64_t sub_24EE8DF88()
{
  unint64_t result = qword_269978188;
  if (!qword_269978188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978188);
  }
  return result;
}

unint64_t sub_24EE8DFE0()
{
  unint64_t result = qword_269978190;
  if (!qword_269978190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978190);
  }
  return result;
}

unint64_t sub_24EE8E038()
{
  unint64_t result = qword_269978198;
  if (!qword_269978198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978198);
  }
  return result;
}

unint64_t sub_24EE8E090()
{
  unint64_t result = qword_2699781A0;
  if (!qword_2699781A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781A0);
  }
  return result;
}

unint64_t sub_24EE8E0E8()
{
  unint64_t result = qword_2699781A8;
  if (!qword_2699781A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781A8);
  }
  return result;
}

unint64_t sub_24EE8E140()
{
  unint64_t result = qword_2699781B0;
  if (!qword_2699781B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781B0);
  }
  return result;
}

unint64_t sub_24EE8E198()
{
  unint64_t result = qword_2699781B8;
  if (!qword_2699781B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781B8);
  }
  return result;
}

unint64_t sub_24EE8E1F0()
{
  unint64_t result = qword_2699781C0;
  if (!qword_2699781C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781C0);
  }
  return result;
}

unint64_t sub_24EE8E248()
{
  unint64_t result = qword_2699781C8;
  if (!qword_2699781C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699781C8);
  }
  return result;
}

uint64_t dispatch thunk of FloatingTabBarContentDelegate.animationAnchorView()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FloatingTabBarContentDelegate.floatingTabBarContent(_:didRequestActionAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of FloatingTabBarContentDelegate.floatingTabBarContent(_:didSelectItemAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t sub_24EE8E2EC()
{
  uint64_t v0 = sub_24EEDD3A0();
  __swift_allocate_value_buffer(v0, qword_26B1E80B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1E80B0);
  return sub_24EEDD390();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

double CGFloat.pixelIntegral(using:)(void *a1, double a2)
{
  if (a1)
  {
    objc_msgSend(a1, sel_displayScale);
    if (v3 > 0.0) {
      return ceil(v3 * a2) / v3;
    }
  }
  return a2;
}

CGSize __swiftcall CGSize.pixelIntegral(using:)(UITraitCollection using)
{
  double v3 = v2;
  double v4 = v1;
  [(objc_class *)using.super.isa displayScale];
  if (v6 > 0.0) {
    double v4 = ceil(v6 * v4) / v6;
  }
  [(objc_class *)using.super.isa displayScale];
  if (v7 > 0.0) {
    double v3 = ceil(v7 * v3) / v7;
  }
  double v8 = v4;
  double v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.highlightedIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.itemDescriptors.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.selectedIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.contentGestureRecognizer()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.selectItem(at:animated:shouldNotifyDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of FloatingTabBarContentProtocol.updateItemDescriptors(_:expectedSize:selectedIndex:visibleItemDescriptors:visibleItemSizes:reason:shouldNotifyDelegate:animated:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a10 + 72))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArtworkProtocol.backgroundColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ArtworkProtocol.templateURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_24EE8E60C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25334FB00](v4);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t result = swift_release();
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_24EE8E6DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  swift_unknownObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = v2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24EE8E7B8()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25334FB00](v1);
  swift_release();
  return v2;
}

uint64_t sub_24EE8E880(uint64_t a1, uint64_t a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

void (*sub_24EE8E958(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_24EEDD9B0();
  v3[6] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  v3[7] = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25334FB00](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_24EE8EA4C;
}

void sub_24EE8EA4C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 56) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  swift_release();
  free(v3);
}

uint64_t sub_24EE8EAE0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = v5;
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

void sub_24EE8EBA8(void **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  id v4 = v2;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = (void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor);
  swift_beginAccess();
  id v6 = *v5;
  *uint64_t v5 = v2;
  swift_release();
}

void *sub_24EE8EC74()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  swift_release();
  return v2;
}

void sub_24EE8ED30(void *a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = (void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
  swift_release();
}

uint64_t (*sub_24EE8EDF8(uint64_t a1))()
{
  *(void *)(a1 + 24) = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_24EE8EEBC;
}

uint64_t sub_24EE8EEBC()
{
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24EE8EEF4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex);
  swift_beginAccess();
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = (_BYTE)v4;
  return result;
}

uint64_t sub_24EE8EFC0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v4 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex;
  swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return swift_release();
}

uint64_t sub_24EE8F088()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_release();
  return v2;
}

uint64_t sub_24EE8F148@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_24EE8F214()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24EE8F2D4(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)(v1 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors);
  swift_beginAccess();
  *uint64_t v4 = a1;
  swift_bridgeObjectRelease();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize;
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(unsigned char *)(v5 + 16) = 1;
  swift_release();
  swift_release();
  return swift_release();
}

void (*sub_24EE8F464(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  v3[4] = sub_24EEDD9B0();
  v3[5] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_24EE8F548;
}

void sub_24EE8F548(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v4 = v3[3] + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize;
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    *(unsigned char *)(v4 + 16) = 1;
    swift_release();
    swift_release();
  }
  swift_release();
  free(v3);
}

double sub_24EE8F738()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  double v0 = *MEMORY[0x263F83C28];
  swift_release();
  return v0;
}

uint64_t sub_24EE8F890()
{
  uint64_t v1 = 1701736270;
  if (*v0 != 1) {
    uint64_t v1 = 0x647261646E617453;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6269737365636341;
  }
}

double sub_24EE8F8E8()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(v0, sel_bounds);
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = *(double **)&v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider];
  double v10 = v9[2];
  double v11 = v9[3];
  double v12 = v9[5];
  id v13 = objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  swift_release();
  if (v13 == (id)1) {
    double v14 = v12;
  }
  else {
    double v14 = v11;
  }
  return UIEdgeInsetsInsetRect(v2, v4, v6, v8, v10, v14);
}

id FloatingTabBar.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void FloatingTabBar.init(frame:)(double a1, double a2, double a3, double a4)
{
  double v5 = v4;
  swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor] = 0;
  double v10 = &v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
  *(void *)double v10 = 0;
  v10[8] = 1;
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v11 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_backgroundVisuallEffectView;
  id v12 = objc_allocWithZone(MEMORY[0x263F82E58]);
  id v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_init);
  uint64_t v14 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider;
  type metadata accessor for FloatingTabBarLayoutProvider();
  uint64_t v15 = swift_allocObject();
  __asm { FMOV            V0.2D, #4.0 }
  *(_OWORD *)(v15 + 16) = _Q0;
  *(_OWORD *)(v15 + 32) = _Q0;
  *(void *)&v13[v14] = v15;
  uint64_t v21 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode] = 1;
  *(void *)&v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer] = 0;
  uint64_t v22 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_minimumHeight];
  *(void *)uint64_t v23 = 0;
  v23[8] = 1;
  uint64_t v24 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize];
  *(void *)uint64_t v24 = 0;
  *((void *)v24 + 1) = 0;
  v24[16] = 1;
  uint64_t v25 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex];
  *(void *)uint64_t v25 = 0;
  v25[8] = 1;
  v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectionShouldFollowGesture] = 0;
  uint64_t v26 = &v13[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView];
  *(void *)uint64_t v26 = 0;
  *((void *)v26 + 1) = 0;

  v62.receiver = v13;
  v62.super_class = (Class)type metadata accessor for FloatingTabBar();
  id v27 = objc_msgSendSuper2(&v62, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v28 = self;
  unsigned int v29 = (char *)v27;
  id v30 = objc_msgSend(v28, sel_clearColor);
  objc_msgSend(v29, sel_setBackgroundColor_, v30);

  id v31 = objc_msgSend(v29, sel_layer);
  double v32 = *MEMORY[0x263F15E58];
  objc_msgSend(v31, sel_setCornerRadius_, *MEMORY[0x263F15E58]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_24EEDFAF0;
  *(void *)(v33 + 32) = objc_msgSend(self, sel_effectWithStyle_, 8);
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825D0]), sel_initWithRed_green_blue_alpha_, 0.75, 0.75, 1.0, 0.06);
  unsigned __int8 v35 = self;
  id v36 = objc_msgSend(v35, sel_effectCompositingColor_, v34);

  if (v36)
  {
    *(void *)(v33 + 40) = v36;
    sub_24EEDD950();
    sub_24EE90130(0, (unint64_t *)&qword_26B1E7630);
    uint64_t v37 = (void *)sub_24EEDD930();
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v35, sel_effectCombiningEffects_, v37);

    uint64_t v39 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_backgroundVisuallEffectView;
    uint64_t v40 = *(void **)&v29[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_backgroundVisuallEffectView];
    objc_msgSend(v40, sel_setEffect_, v38);
    objc_msgSend(v40, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v41 = objc_msgSend(v40, sel_layer);
    objc_msgSend(v41, sel_setCornerRadius_, v32);

    unsigned __int8 v42 = *(void **)&v29[v39];
    objc_msgSend(v42, sel_setClipsToBounds_, 1);
    objc_msgSend(v29, sel_addSubview_, v42);
    unsigned __int8 v43 = self;
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_24EEDFB00;
    id v45 = objc_msgSend(v42, sel_leadingAnchor);
    id v46 = objc_msgSend(v29, sel_leadingAnchor);
    id v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v46);

    *(void *)(v44 + 32) = v47;
    id v48 = objc_msgSend(*(id *)&v29[v39], sel_trailingAnchor);
    id v49 = objc_msgSend(v29, sel_trailingAnchor);
    id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

    *(void *)(v44 + 40) = v50;
    id v51 = objc_msgSend(*(id *)&v29[v39], sel_topAnchor);
    id v52 = objc_msgSend(v29, sel_topAnchor);
    id v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v52);

    *(void *)(v44 + 48) = v53;
    id v54 = objc_msgSend(*(id *)&v29[v39], sel_bottomAnchor);
    id v55 = objc_msgSend(v29, sel_bottomAnchor);
    id v56 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v55);

    *(void *)(v44 + 56) = v56;
    sub_24EEDD950();
    sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
    v57 = (void *)sub_24EEDD930();
    swift_bridgeObjectRelease();
    objc_msgSend(v43, sel_activateConstraints_, v57);

    __swift_instantiateConcreteTypeFromMangledName(&qword_269978268);
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_24EEDFB10;
    uint64_t v59 = sub_24EEDD480();
    uint64_t v60 = MEMORY[0x263F82020];
    *(void *)(v58 + 32) = v59;
    *(void *)(v58 + 40) = v60;
    v61 = v29;
    sub_24EEDDAF0();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for FloatingTabBar()
{
  return self;
}

uint64_t sub_24EE90130(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id FloatingTabBar.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_24EE90454(uint64_t a1, char a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v5 = *(void **)(v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView + 8);
  id v7 = v5;
  swift_release();
  if (v5)
  {
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, void, void, uint64_t, uint64_t))(v6 + 64))(a1, a2 & 1, 0, ObjectType, v6);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(ObjectType, v6);
    char v13 = v12;
    sub_24EEDD9A0();
    sub_24EEDD990();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v15 = v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex;
    swift_beginAccess();
    *(void *)uint64_t v15 = v11;
    *(unsigned char *)(v15 + 8) = v13 & 1;
    swift_release();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex;
    *(void *)uint64_t v16 = 0;
    *(unsigned char *)(v16 + 8) = 1;
    swift_release();

    return swift_release();
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v9 = v2 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex;
    *(void *)uint64_t v9 = a1;
    *(unsigned char *)(v9 + 8) = 0;
    swift_release();
    return swift_release();
  }
}

uint64_t sub_24EE90FA8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v5 = v4;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors);
  swift_beginAccess();
  uint64_t v10 = *v9;
  swift_bridgeObjectRetain();
  swift_release();
  char v11 = sub_24EE94BC4(v10, a1);
  swift_bridgeObjectRelease();
  if (v11)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v27 = a3;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v12 = a4;
    char v13 = (uint64_t *)(v5 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex);
    swift_beginAccess();
    uint64_t v26 = *v13;
    char v14 = *((unsigned char *)v13 + 8);
    swift_release();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = *(void **)(v5 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView);
    uint64_t v15 = *(void *)(v5 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView + 8);
    id v17 = v16;
    swift_release();
    if (v16)
    {
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 48))(ObjectType, v15);
      char v21 = v20;
      swift_release();

      a4 = v12;
      if (v14)
      {
        a3 = v27;
        if (v21) {
          goto LABEL_25;
        }
      }
      else
      {
        a3 = v27;
        if ((v21 & 1) == 0 && v26 == v19) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      swift_release();
      a4 = v12;
      a3 = v27;
      if (v14) {
        goto LABEL_25;
      }
    }
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = v5 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize;
  *(void *)uint64_t v22 = 0;
  *(void *)(v22 + 8) = 0;
  *(unsigned char *)(v22 + 16) = 1;
  swift_release();
  swift_release();
LABEL_25:
  uint64_t v23 = swift_bridgeObjectRetain();
  sub_24EE8F2D4(v23);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v24 = v5 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex;
  *(void *)uint64_t v24 = a2;
  *(unsigned char *)(v24 + 8) = a3 & 1;
  swift_release();
  sub_24EE91410(a4 & 1);
  return swift_release();
}

void sub_24EE91410(int a1)
{
  int v257 = a1;
  uint64_t v2 = sub_24EEDD3A0();
  uint64_t v265 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v252 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  double v8 = (char *)&v252 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  char v11 = (char *)&v252 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v262 = (char *)&v252 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v252 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v252 - v17;
  uint64_t v19 = sub_24EEDD9B0();
  uint64_t v264 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v256 = v11;
  double v20 = sub_24EE8F8E8();
  CGFloat v22 = v21;
  double v24 = v23;
  uint64_t v26 = v25;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v269 = v1;
  char v27 = (double *)&v1[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize];
  double v28 = *(double *)&v1[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize];
  double v29 = *(double *)&v1[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize + 8];
  char v30 = v1[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize + 16];
  swift_release();
  if ((v30 & 1) == 0 && v28 == v24 && v29 == *(double *)&v26)
  {
    goto LABEL_36;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v258 = v18;
  v254 = v16;
  *char v27 = v24;
  v27[1] = *(double *)&v26;
  *((unsigned char *)v27 + 16) = 0;
  swift_release();
  double v32 = v269;
  uint64_t v261 = *(void *)&v269[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider];
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v33 = (uint64_t *)&v32[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors];
  swift_beginAccess();
  v268 = v33;
  uint64_t v34 = *v33;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v35 = sub_24EEC1FE0(v34);
  swift_bridgeObjectRelease();
  id v36 = objc_msgSend(v32, sel_traitCollection);
  *(double *)&uint64_t v37 = MEMORY[0x263F8EE78];
  id v38 = (void *)sub_24EEBBBB8(MEMORY[0x263F8EE78]);
  swift_retain();
  id v39 = v36;
  uint64_t v266 = sub_24EEBD15C(v38, v35, v39, v20, v22, v24, *(CGFloat *)&v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v40 = *v268;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v41 = v266;
  swift_bridgeObjectRetain();
  unsigned __int8 v42 = (char *)sub_24EEBD56C(v40, v41);
  v260 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v43 = objc_msgSend(v269, sel_traitCollection);
  v263 = v42;
  _s13FitnessCoreUI28FloatingTabBarLayoutProviderC11minimumSize5using14compatibleWithSo6CGSizeVSayAA0e4ItemJ0VG_So17UITraitCollectionCSgtF_0(v42, v43);
  double v45 = v44;

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v253 = v8;
  v255 = v5;
  uint64_t v267 = v2;
  uint64_t v46 = *v268;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v285 = v37;
  uint64_t v47 = *(void *)(v46 + 16);
  uint64_t v270 = v19;
  uint64_t v259 = v46;
  if (v47)
  {
    uint64_t v48 = v46 + 48;
    do
    {
      double v277 = *(double *)&v37;
      uint64_t v49 = *(void *)(v48 - 8);
      v272 = *(void (**)(char *, uint64_t))(v48 - 16);
      uint64_t v50 = *(void *)(v48 + 8);
      v271 = *(void **)v48;
      char v51 = *(unsigned char *)(v48 + 16);
      LODWORD(v276) = *(unsigned __int8 *)(v48 + 17);
      LODWORD(v275) = *(unsigned __int8 *)(v48 + 18);
      uint64_t v52 = *(void *)(v48 + 32);
      double v274 = *(double *)(v48 + 24);
      uint64_t v53 = *(void *)(v48 + 48);
      double v273 = *(double *)(v48 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      if (v51)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(double *)&uint64_t v37 = v277;
      }
      else
      {
        *(double *)&uint64_t v37 = v277;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v285 = v37;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24EEB2CF0(0, *(void *)(v37 + 16) + 1, 1);
          uint64_t v37 = v285;
        }
        unint64_t v56 = *(void *)(v37 + 16);
        unint64_t v55 = *(void *)(v37 + 24);
        if (v56 >= v55 >> 1)
        {
          sub_24EEB2CF0(v55 > 1, v56 + 1, 1);
          uint64_t v37 = v285;
        }
        *(void *)(v37 + 16) = v56 + 1;
        uint64_t v57 = v37 + 72 * v56;
        *(void *)(v57 + 32) = v272;
        *(void *)(v57 + 40) = v49;
        *(void *)(v57 + 48) = v271;
        *(void *)(v57 + 56) = v50;
        *(unsigned char *)(v57 + 64) = 0;
        *(unsigned char *)(v57 + 65) = (_BYTE)v276;
        *(unsigned char *)(v57 + 66) = LOBYTE(v275);
        *(double *)(v57 + 72) = v274;
        *(void *)(v57 + 80) = v52;
        *(double *)(v57 + 88) = v273;
        *(void *)(v57 + 96) = v53;
      }
      v48 += 72;
      --v47;
    }
    while (v47);
  }
  swift_bridgeObjectRelease();
  uint64_t v58 = v266;
  swift_bridgeObjectRetain();
  uint64_t v59 = v260;
  uint64_t v60 = (char *)sub_24EEBD56C(v37, v58);
  v271 = v59;
  swift_bridgeObjectRelease_n();
  v61 = v263;
  uint64_t v62 = *((void *)v263 + 2);
  if (v62)
  {
    double v277 = v45;
    double v63 = *((double *)v263 + 5);
    double v64 = *((double *)v263 + 6);
    double v65 = *((double *)v263 + 8);
    uint64_t v66 = v62 - 1;
    if (v62 == 1)
    {
      uint64_t v67 = v267;
    }
    else
    {
      double v274 = v20;
      double v275 = v22;
      v276 = v26;
      double v273 = v24;
      swift_bridgeObjectRetain();
      v69 = (double *)(v61 + 88);
      double v70 = v63;
      do
      {
        double v71 = *v69;
        double v72 = v69[1];
        double v73 = v69[3];
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        if (v70 < v71)
        {
          double v63 = v71;
          double v64 = v72;
          double v65 = v73;
          double v70 = v71;
        }
        v69 += 6;
        --v66;
      }
      while (v66);
      swift_bridgeObjectRelease();
      uint64_t v67 = v267;
      double v24 = v273;
      uint64_t v26 = v276;
      CGFloat v22 = v275;
      double v20 = v274;
    }
    swift_bridgeObjectRelease();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v68 = v269;
    v74 = (double *)&v269[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_minimumHeight];
    double *v74 = v63 + v64 + v65;
    *((unsigned char *)v74 + 8) = 0;
    swift_release();
    double v45 = v277;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v67 = v267;
    v68 = v269;
  }
  if (v24 > 0.0 && *(double *)&v26 > 0.0)
  {
    double v277 = *(double *)&v37;
    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    *(double *)&uint64_t v75 = COERCE_DOUBLE(__swift_project_value_buffer(v67, (uint64_t)qword_26B1E80B0));
    uint64_t v76 = v265;
    v77 = *(void (**)(char *))(v265 + 16);
    v78 = v258;
    double v273 = *(double *)&v75;
    *(void *)&double v275 = v265 + 16;
    double v274 = *(double *)&v77;
    v77(v258);
    double v79 = COERCE_DOUBLE(v68);
    v80 = sub_24EEDD380();
    os_log_type_t v81 = sub_24EEDDA90();
    BOOL v82 = os_log_type_enabled(v80, v81);
    v269 = v60;
    *(double *)&v276 = v79;
    if (v82)
    {
      v83 = (uint8_t *)swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      uint64_t v285 = v84;
      *(_DWORD *)v83 = 136315138;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      double v79 = *(double *)&v276;
      int v85 = v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode];
      swift_release();
      swift_release();
      if (v85)
      {
        if (v85 == 1)
        {
          unint64_t v86 = 0xE400000000000000;
          uint64_t v87 = 1701736270;
        }
        else
        {
          unint64_t v86 = 0xE800000000000000;
          uint64_t v87 = 0x647261646E617453;
        }
      }
      else
      {
        uint64_t v87 = 0x6269737365636341;
        unint64_t v86 = 0xEA0000000000656CLL;
      }
      uint64_t v281 = sub_24EE94D9C(v87, v86, &v285);
      sub_24EEDDB50();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24EE87000, v80, v81, "[FloatingTabBar] Determining preferred mode. Active mode: %s", v83, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25334FA20](v84, -1, -1);
      MEMORY[0x25334FA20](v83, -1, -1);

      v91 = *(void (**)(char *, uint64_t))(v265 + 8);
      v92 = v258;
      uint64_t v67 = v267;
    }
    else
    {

      v91 = *(void (**)(char *, uint64_t))(v76 + 8);
      v92 = v78;
    }
    v272 = v91;
    v91(v92, v67);
    v289.origin.x = v20;
    v289.origin.y = v22;
    v289.size.width = v24;
    *(void *)&v289.size.height = v26;
    v93 = &qword_269978000;
    if (v45 <= CGRectGetWidth(v289))
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v94 = objc_msgSend(*(id *)&v79, sel_traitCollection);
      id v95 = objc_msgSend(v94, sel_preferredContentSizeCategory);

      LOBYTE(v94) = sub_24EEDDAD0();
      swift_release();

      if (v94)
      {
        (*(void (**)(char *, void, uint64_t))&v274)(v254, *(void *)&v273, v67);
        v96 = *(id *)&v79;
        v97 = sub_24EEDD380();
        os_log_type_t v98 = sub_24EEDDA90();
        if (os_log_type_enabled(v97, v98))
        {
          uint64_t v99 = swift_slowAlloc();
          *(_DWORD *)uint64_t v99 = 67109376;
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          v290.origin.x = v20;
          v290.origin.y = v22;
          v290.size.width = v24;
          *(void *)&v290.size.height = v26;
          double Width = CGRectGetWidth(v290);
          swift_release();
          LODWORD(v285) = v45 <= Width;
          sub_24EEDDB50();
          *(_WORD *)(v99 + 8) = 1024;
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v101 = [v96 traitCollection];
          id v102 = objc_msgSend(v101, sel_preferredContentSizeCategory);

          LOBYTE(v101) = sub_24EEDDAD0();
          swift_release();

          LODWORD(v285) = v101 & 1;
          sub_24EEDDB50();

          _os_log_impl(&dword_24EE87000, v97, v98, "[FloatingTabBar] Standard mode preferred. Size %{BOOL}d. DinamicType %{BOOL}d", (uint8_t *)v99, 0xEu);
          MEMORY[0x25334FA20](v99, -1, -1);
          uint64_t v67 = v267;
          v93 = &qword_269978000;
        }
        else
        {

          v97 = v96;
        }

        v272(v254, v67);
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v142 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode;
        int v143 = *((unsigned __int8 *)&v96->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode);
        swift_release();
        v144 = &qword_269978000;
        if (v143)
        {
          if (v143 != 1) {
            goto LABEL_186;
          }
        }
        else
        {
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          v145 = (char *)v96 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView;
          v146 = *(Class *)((char *)&v96->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView);
          id v147 = v146;
          swift_release();
          if (v146)
          {
            objc_msgSend(v147, sel_setUserInteractionEnabled_, 0);
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v148 = *(id *)v145;
          id v149 = *(id *)v145;
          swift_release();
          if (v148)
          {
            objc_msgSend(v149, sel_setHidden_, 1);
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v150 = *(id *)v145;
          uint64_t v151 = *((void *)v145 + 1);
          id v152 = *(id *)v145;
          swift_release();
          if (v150)
          {
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void, void, uint64_t, uint64_t))(v151 + 16))(0, 0, ObjectType, v151);
          }
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v154 = (char *)v96 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView;
        uint64_t v155 = *(uint64_t *)((char *)&v96->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView);
        swift_release();
        if (v155)
        {
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v156 = *(id *)v154;
          uint64_t v157 = *((void *)v154 + 1);
          id v158 = *(id *)v154;
          swift_release();
          if (v156)
          {
            uint64_t v159 = swift_getObjectType();
            v160 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v157 + 16);
            uint64_t v161 = swift_unknownObjectRetain();
            v160(v161, &protocol witness table for FloatingTabBar, v159, v157);
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v162 = *(id *)v154;
          id v163 = *(id *)v154;
          swift_release();
          if (v162)
          {
            objc_msgSend(v163, sel_setUserInteractionEnabled_, 1);
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v164 = *(id *)v154;
          id v165 = *(id *)v154;
          swift_release();
          if (!v164) {
            goto LABEL_171;
          }
          objc_msgSend(v165, sel_setHidden_, 0);
        }
        else
        {
          v166 = (char *)objc_allocWithZone((Class)type metadata accessor for FloatingTabBarContentView());
          uint64_t v167 = swift_retain();
          v168 = sub_24EE95C88(v167, v166);
          sub_24EE95470(v168, v96);
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          id v165 = *(id *)v154;
          *(void *)v154 = v168;
          *((void *)v154 + 1) = &protocol witness table for FloatingTabBarContentView;

          swift_release();
        }

LABEL_171:
        v169 = v93;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v170 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer;
        v171 = *(Class *)((char *)&v96->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer);
        id v172 = v171;
        swift_release();
        if (v171)
        {
          objc_msgSend(v172, sel_setEnabled_, 1);
          v93 = v169;
          v144 = &qword_269978000;
        }
        else
        {
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          v174 = *(objc_class **)v154;
          uint64_t v173 = *((void *)v154 + 1);
          id v175 = *(id *)v154;
          swift_release();
          if (v174)
          {
            uint64_t v176 = swift_getObjectType();
            v174 = (objc_class *)(*(uint64_t (**)(uint64_t, uint64_t))(v173 + 56))(v176, v173);
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          v177 = *(Class *)((char *)&v96->isa + v170);
          *(Class *)((char *)&v96->isa + v170) = v174;
          swift_release();

          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          v178 = *(Class *)((char *)&v96->isa + v170);
          id v172 = v178;
          swift_release();
          v93 = v169;
          v144 = &qword_269978000;
          if (!v178) {
            goto LABEL_186;
          }
          [v96 addGestureRecognizer:v172];
        }

LABEL_186:
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        *((unsigned char *)&v96->isa + v142) = 2;
        swift_release();
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v179 = (char *)v96 + v144[76];
        id v138 = *(id *)v179;
        uint64_t v139 = *((void *)v179 + 1);
        id v180 = *(id *)v179;
        swift_release();
        sub_24EEDD9A0();
        sub_24EEDD990();
        char isCurrentExecutor = swift_task_isCurrentExecutor();
        uint64_t v67 = v267;
        if ((isCurrentExecutor & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v141 = (char *)v96 + v93[73];
        goto LABEL_193;
      }
    }
    (*(void (**)(char *, void, uint64_t))&v274)(v262, *(void *)&v273, v67);
    v103 = *(id *)&v79;
    v104 = sub_24EEDD380();
    os_log_type_t v105 = sub_24EEDDA90();
    if (os_log_type_enabled(v104, v105))
    {
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v106 = 67109376;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v291.origin.x = v20;
      v291.origin.y = v22;
      v291.size.width = v24;
      *(void *)&v291.size.height = v26;
      double v107 = CGRectGetWidth(v291);
      swift_release();
      LODWORD(v285) = v45 <= v107;
      sub_24EEDDB50();
      *(_WORD *)(v106 + 8) = 1024;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v108 = [v103 traitCollection];
      id v109 = objc_msgSend(v108, sel_preferredContentSizeCategory);

      LOBYTE(v108) = sub_24EEDDAD0();
      swift_release();

      LODWORD(v285) = v108 & 1;
      sub_24EEDDB50();

      _os_log_impl(&dword_24EE87000, v104, v105, "[FloatingTabBar] Accessible mode preferred. Size %{BOOL}d. DinamicType %{BOOL}d", (uint8_t *)v106, 0xEu);
      MEMORY[0x25334FA20](v106, -1, -1);
      v93 = &qword_269978000;
    }
    else
    {

      v104 = v103;
    }

    v272(v262, v67);
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v110 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode;
    int v111 = *((unsigned __int8 *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode);
    swift_release();
    if (v111)
    {
      if (v111 != 1)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v112 = (char *)v103 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView;
        v113 = *(Class *)((char *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView);
        id v114 = v113;
        swift_release();
        if (v113)
        {
          objc_msgSend(v114, sel_setUserInteractionEnabled_, 0);
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v115 = *(id *)v112;
        id v116 = *(id *)v112;
        swift_release();
        if (v115)
        {
          objc_msgSend(v116, sel_setHidden_, 1);
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v118 = *(id *)v112;
        uint64_t v117 = *((void *)v112 + 1);
        id v119 = *(id *)v112;
        swift_release();
        if (v118)
        {
          uint64_t v120 = swift_getObjectType();
          (*(void (**)(void, void, uint64_t, uint64_t))(v117 + 16))(0, 0, v120, v117);
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v121 = *(Class *)((char *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer);
        id v122 = v121;
        swift_release();
        if (v121)
        {
          objc_msgSend(v122, sel_setEnabled_, 0);
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        *((unsigned char *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectionShouldFollowGesture) = 0;
        swift_release();
      }
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v123 = (char *)v103 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView;
      uint64_t v124 = *(uint64_t *)((char *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView);
      swift_release();
      if (v124)
      {
        uint64_t v266 = (uint64_t)v103;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v126 = *(id *)v123;
        uint64_t v125 = *((void *)v123 + 1);
        id v127 = *(id *)v123;
        swift_release();
        if (v126)
        {
          uint64_t v128 = swift_getObjectType();
          uint64_t v129 = v110;
          v130 = v93;
          v131 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v125 + 16);
          uint64_t v132 = swift_unknownObjectRetain();
          v131(v132, &protocol witness table for FloatingTabBar, v128, v125);
          v93 = v130;
          uint64_t v110 = v129;
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v133 = *(id *)v123;
        id v134 = *(id *)v123;
        swift_release();
        v103 = v266;
        if (v133)
        {
          objc_msgSend(v134, sel_setUserInteractionEnabled_, 1);
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v135 = *(id *)v123;
        id v136 = *(id *)v123;
        swift_release();
        uint64_t v67 = v267;
        if (!v135) {
          goto LABEL_127;
        }
        objc_msgSend(v136, sel_setHidden_, 0);
      }
      else
      {
        type metadata accessor for AccessibleFloatingTabBarControl();
        v137 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
        sub_24EE9587C(v137, v103);
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v136 = *(id *)v123;
        *(void *)v123 = v137;
        *((void *)v123 + 1) = &protocol witness table for AccessibleFloatingTabBarControl;

        swift_release();
        uint64_t v67 = v267;
      }
    }
LABEL_127:
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *((unsigned char *)&v103->isa + v110) = 0;
    swift_release();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v138 = *(Class *)((char *)&v103->isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView);
    uint64_t v139 = *(uint64_t *)((char *)&v103[1].isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView);
    id v140 = v138;
    swift_release();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v141 = (char *)v103 + v93[73];
LABEL_193:
    v182 = *(void **)v141;
    *(void *)v141 = v138;
    *((void *)v141 + 1) = v139;
    swift_release();

    sub_24EEDD9A0();
    sub_24EEDD990();
    char v183 = swift_task_isCurrentExecutor();
    v184 = v276;
    if ((v183 & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v185 = (char *)&v184[v93[73]];
    id v186 = *(id *)v185;
    uint64_t v187 = *((void *)v185 + 1);
    id v188 = *(id *)v185;
    swift_release();
    if (v186)
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v189 = *v268;
      swift_bridgeObjectRetain();
      swift_release();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v190 = &v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex];
      uint64_t v191 = *(void *)&v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex];
      int v192 = v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex + 8];
      swift_release();
      if (v192 == 1)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v193 = &v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
        swift_beginAccess();
        uint64_t v191 = *(void *)v193;
        uint64_t v194 = v193[8];
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v194 = 0;
      }
      uint64_t v204 = swift_getObjectType();
      LOBYTE(v281) = 0;
      v205 = v271;
      (*(void (**)(uint64_t, uint64_t, uint64_t, double, char *, uint64_t *, void, void, double, double, uint64_t, uint64_t))(v187 + 72))(v189, v191, v194, COERCE_DOUBLE(*(void *)&v277), v269, &v281, 0, v257 & 1, v24, *(double *)&v26, v204, v187);
      if (!v205)
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v225 = (*(uint64_t (**)(uint64_t, uint64_t))(v187 + 48))(v204, v187);
        char v227 = v226;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v228 = &v276[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
        swift_beginAccess();
        *(void *)v228 = v225;
        v228[8] = v227 & 1;
        swift_release();
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        *(void *)v190 = 0;
        v190[8] = 1;
        swift_release();

        goto LABEL_36;
      }

      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      double v284 = *(double *)&v205;
      id v206 = v205;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269978760);
      if (swift_dynamicCast())
      {
        uint64_t v207 = v267;
        v208 = v255;
        if (v283 == 3)
        {

          v209 = v253;
          (*(void (**)(char *, void, uint64_t))&v274)(v253, *(void *)&v273, v207);
          v210 = v276;
          v211 = sub_24EEDD380();
          os_log_type_t v212 = sub_24EEDDA90();
          if (os_log_type_enabled(v211, v212))
          {
            uint64_t v213 = swift_slowAlloc();
            double v277 = COERCE_DOUBLE(swift_slowAlloc());
            double v278 = v277;
            *(_DWORD *)uint64_t v213 = 136315394;
            sub_24EEDD9A0();
            sub_24EEDD990();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            sub_24EEDD9A0();
            sub_24EEDD990();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            uint64_t v214 = *(void *)v190;
            char v215 = v190[8];
            swift_release();
            swift_release();
            uint64_t v281 = v214;
            char v282 = v215;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978690);
            uint64_t v216 = sub_24EEDDB40();
            uint64_t v281 = sub_24EE94D9C(v216, v217, (uint64_t *)&v278);
            sub_24EEDDB50();

            swift_bridgeObjectRelease();
            *(_WORD *)(v213 + 12) = 2080;
            sub_24EEDD9A0();
            sub_24EEDD990();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            sub_24EEDD9A0();
            sub_24EEDD990();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            v218 = &v210[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
            swift_beginAccess();
            uint64_t v219 = *(void *)v218;
            LOBYTE(v218) = v218[8];
            swift_release();
            swift_release();
            uint64_t v279 = v219;
            char v280 = (char)v218;
            uint64_t v220 = sub_24EEDDB40();
            uint64_t v279 = sub_24EE94D9C(v220, v221, (uint64_t *)&v278);
            sub_24EEDDB50();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_24EE87000, v211, v212, "[FloatingTabBar] Content view is pending layout. Deferring item descriptors update. Pending selection: %s. Current selection: %s", (uint8_t *)v213, 0x16u);
            double v222 = v277;
            swift_arrayDestroy();
            MEMORY[0x25334FA20](*(void *)&v222, -1, -1);
            MEMORY[0x25334FA20](v213, -1, -1);

            v223 = v253;
            uint64_t v224 = v267;
          }
          else
          {

            v223 = v209;
            uint64_t v224 = v207;
          }
          v272(v223, v224);

          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v207 = v267;
        v208 = v255;
      }

      (*(void (**)(char *, void, uint64_t))&v274)(v208, *(void *)&v273, v207);
      v229 = v276;
      id v230 = v205;
      v231 = v229;
      id v232 = v205;
      v233 = sub_24EEDD380();
      int v234 = sub_24EEDDA70();
      if (os_log_type_enabled(v233, (os_log_type_t)v234))
      {
        LODWORD(v275) = v234;
        uint64_t v235 = swift_slowAlloc();
        *(double *)&v236 = COERCE_DOUBLE(swift_slowAlloc());
        double v277 = COERCE_DOUBLE(swift_slowAlloc());
        double v284 = v277;
        *(_DWORD *)uint64_t v235 = 138412802;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v237 = v205;
        swift_release();
        uint64_t v238 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v281 = v238;
        sub_24EEDDB50();
        v276 = v236;
        *(void *)v236 = v238;

        *(_WORD *)(v235 + 12) = 2080;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v239 = *(void *)v190;
        char v240 = v190[8];
        swift_release();
        swift_release();
        uint64_t v281 = v239;
        char v282 = v240;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978690);
        uint64_t v241 = sub_24EEDDB40();
        uint64_t v281 = sub_24EE94D9C(v241, v242, (uint64_t *)&v284);
        sub_24EEDDB50();

        swift_bridgeObjectRelease();
        *(_WORD *)(v235 + 22) = 2080;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        v243 = (char *)&v231[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
        swift_beginAccess();
        uint64_t v244 = *(void *)v243;
        LOBYTE(v243) = v243[8];
        swift_release();
        swift_release();
        uint64_t v279 = v244;
        char v280 = (char)v243;
        uint64_t v245 = sub_24EEDDB40();
        uint64_t v279 = sub_24EE94D9C(v245, v246, (uint64_t *)&v284);
        sub_24EEDDB50();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24EE87000, v233, LOBYTE(v275), "[FloatingTabBar] Failed to update item descriptors with error %@. Pending selection: %s. Current selection: %s", (uint8_t *)v235, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269978270);
        v247 = v276;
        swift_arrayDestroy();
        MEMORY[0x25334FA20](v247, -1, -1);
        double v248 = v277;
        swift_arrayDestroy();
        MEMORY[0x25334FA20](*(void *)&v248, -1, -1);
        MEMORY[0x25334FA20](v235, -1, -1);

        v249 = &v286;
LABEL_251:
        v250 = (char *)*((void *)v249 - 32);
        uint64_t v251 = v267;
        goto LABEL_252;
      }

      v250 = v208;
      uint64_t v251 = v207;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_release();
      v195 = v256;
      (*(void (**)(char *, void, uint64_t))&v274)(v256, *(void *)&v273, v67);
      v196 = v184;
      v197 = sub_24EEDD380();
      os_log_type_t v198 = sub_24EEDDA70();
      if (os_log_type_enabled(v197, v198))
      {
        v199 = (uint8_t *)swift_slowAlloc();
        uint64_t v200 = swift_slowAlloc();
        uint64_t v285 = v200;
        *(_DWORD *)v199 = 136315138;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        int v201 = v196[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode];
        swift_release();
        swift_release();
        if (v201)
        {
          if (v201 == 1)
          {
            unint64_t v202 = 0xE400000000000000;
            uint64_t v203 = 1701736270;
          }
          else
          {
            unint64_t v202 = 0xE800000000000000;
            uint64_t v203 = 0x647261646E617453;
          }
        }
        else
        {
          uint64_t v203 = 0x6269737365636341;
          unint64_t v202 = 0xEA0000000000656CLL;
        }
        uint64_t v281 = sub_24EE94D9C(v203, v202, &v285);
        sub_24EEDDB50();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24EE87000, v197, v198, "[FloatingTabBar] Found unexpectedly nil content view for display mode %s", v199, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25334FA20](v200, -1, -1);
        MEMORY[0x25334FA20](v199, -1, -1);

        v249 = &v287;
        goto LABEL_251;
      }

      v250 = v195;
      uint64_t v251 = v67;
    }
LABEL_252:
    v272(v250, v251);
LABEL_36:
    swift_release();
    return;
  }
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v67, (uint64_t)qword_26B1E80B0);
  v88 = sub_24EEDD380();
  os_log_type_t v89 = sub_24EEDDA90();
  if (os_log_type_enabled(v88, v89))
  {
    v90 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v90 = 0;
    _os_log_impl(&dword_24EE87000, v88, v89, "[FloatingTabBar] Rect has a negative size. Deferring content view configuration", v90, 2u);
    MEMORY[0x25334FA20](v90, -1, -1);
  }
  swift_release();
}

id FloatingTabBar.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingTabBar();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __swiftcall FloatingTabBar.animationAnchorView()(UIView_optional *__return_ptr retstr)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_super v2 = (void **)&v1[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor];
  swift_beginAccess();
  uint64_t v3 = *v2;
  id v4 = v3;
  swift_release();
  if (!v3)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(v1, sel_superview);
    swift_release();
  }
  swift_release();
}

uint64_t FloatingTabBar.floatingTabBarContent(_:didRequestActionAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EE965F0(a3);
}

uint64_t FloatingTabBar.floatingTabBarContent(_:didSelectItemAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(ObjectType, a2);
  char v9 = v8;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex;
  swift_beginAccess();
  *(void *)uint64_t v10 = v7;
  *(unsigned char *)(v10 + 8) = v9 & 1;
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = v3 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x25334FB00](v12);
  uint64_t v14 = *(void *)(v12 + 8);
  swift_release();
  if (!v13) {
    return swift_release();
  }
  uint64_t v15 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v3, a3, v15, v14);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24EE94BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EE965F0(a3);
}

uint64_t sub_24EE94BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v15 = a1;
      while (1)
      {
        uint64_t v5 = *(void *)(a1 + v4 + 48);
        uint64_t v6 = *(void *)(a1 + v4 + 56);
        int v7 = *(unsigned __int8 *)(a1 + v4 + 64);
        int v26 = *(unsigned __int8 *)(a1 + v4 + 65);
        uint64_t v18 = *(void *)(a1 + v4 + 72);
        uint64_t v23 = *(void *)(a1 + v4 + 80);
        uint64_t v21 = *(void *)(a1 + v4 + 96);
        uint64_t v22 = *(void *)(a1 + v4 + 88);
        uint64_t v8 = *(void *)(v3 + v4 + 48);
        uint64_t v9 = *(void *)(v3 + v4 + 56);
        int v10 = *(unsigned __int8 *)(v3 + v4 + 64);
        int v11 = *(unsigned __int8 *)(v3 + v4 + 65);
        int v24 = *(unsigned __int8 *)(v3 + v4 + 66);
        int v25 = *(unsigned __int8 *)(a1 + v4 + 66);
        uint64_t v12 = *(void *)(v3 + v4 + 80);
        uint64_t v17 = *(void *)(v3 + v4 + 72);
        uint64_t v19 = *(void *)(v3 + v4 + 96);
        uint64_t v20 = *(void *)(v3 + v4 + 88);
        if ((*(void *)(a1 + v4 + 32) != *(void *)(v3 + v4 + 32)
           || *(void *)(a1 + v4 + 40) != *(void *)(v3 + v4 + 40))
          && (sub_24EEDDE90() & 1) == 0)
        {
          break;
        }
        if (v5 == v8 && v6 == v9)
        {
          uint64_t result = 0;
          if (v7 != v10 || ((v26 ^ v11) & 1) != 0) {
            return result;
          }
        }
        else
        {
          char v14 = sub_24EEDDE90();
          uint64_t result = 0;
          if ((v14 & 1) == 0 || v7 != v10 || v26 != v11) {
            return result;
          }
        }
        if (v25 != v24) {
          return result;
        }
        if (v23)
        {
          if (!v12 || (v18 != v17 || v23 != v12) && (sub_24EEDDE90() & 1) == 0) {
            return 0;
          }
        }
        else if (v12)
        {
          return 0;
        }
        if ((v22 != v20 || v21 != v19) && (sub_24EEDDE90() & 1) == 0) {
          return 0;
        }
        v4 += 72;
        --v2;
        a1 = v15;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_24EE94D9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24EE94E70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24EE96F7C((uint64_t)v12, *a3);
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
      sub_24EE96F7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24EE94E70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24EEDDB60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24EE9502C(a5, a6);
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
  uint64_t v8 = sub_24EEDDC40();
  if (!v8)
  {
    sub_24EEDDCE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24EEDDD50();
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

uint64_t sub_24EE9502C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24EE950C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24EE95320(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24EE95320(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24EE950C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24EE9523C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24EEDDBF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24EEDDCE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24EEDD870();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24EEDDD50();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24EEDDCE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24EE9523C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269978280);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24EE952A4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24EEDD8C0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25334EC80](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_24EE95320(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978280);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

void sub_24EE95470(char *a1, void *a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = a2;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = &a1[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate];
  swift_beginAccess();
  *((void *)v5 + 1) = &protocol witness table for FloatingTabBar;
  swift_unknownObjectWeakAssign();
  swift_release();

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_addSubview_, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24EEDFB00;
  id v7 = objc_msgSend(a1, sel_leadingAnchor);
  id v8 = objc_msgSend(v4, sel_leadingAnchor);
  int64_t v9 = *(double **)&v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider];
  id v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_constant_, v8, v9[3]);

  *(void *)(v6 + 32) = v10;
  id v11 = objc_msgSend(a1, sel_trailingAnchor);
  id v12 = objc_msgSend(v4, sel_trailingAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_constant_, v12, -v9[5]);

  *(void *)(v6 + 40) = v13;
  id v14 = objc_msgSend(a1, sel_topAnchor);
  id v15 = objc_msgSend(v4, sel_topAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, v9[2]);

  *(void *)(v6 + 48) = v16;
  id v17 = objc_msgSend(a1, sel_bottomAnchor);
  id v18 = objc_msgSend(v4, sel_bottomAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -v9[4]);

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v20 = self;
  LODWORD(v21) = 1148829696;
  objc_msgSend(v19, sel_setPriority_, v21);
  swift_release();
  *(void *)(v6 + 56) = v19;
  sub_24EEDD950();
  sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
  uint64_t v22 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_activateConstraints_, v22, v6);
  swift_release();
}

void sub_24EE9587C(char *a1, void *a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = a2;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = &a1[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate];
  swift_beginAccess();
  *((void *)v5 + 1) = &protocol witness table for FloatingTabBar;
  swift_unknownObjectWeakAssign();
  swift_release();

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_addSubview_, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24EEDFB00;
  id v7 = objc_msgSend(a1, sel_leadingAnchor);
  id v8 = objc_msgSend(v4, sel_leadingAnchor);
  int64_t v9 = *(double **)&v4[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider];
  id v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_constant_, v8, v9[3]);

  *(void *)(v6 + 32) = v10;
  id v11 = objc_msgSend(a1, sel_trailingAnchor);
  id v12 = objc_msgSend(v4, sel_trailingAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_constant_, v12, -v9[5]);

  *(void *)(v6 + 40) = v13;
  id v14 = objc_msgSend(a1, sel_topAnchor);
  id v15 = objc_msgSend(v4, sel_topAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, v9[2]);

  *(void *)(v6 + 48) = v16;
  id v17 = objc_msgSend(a1, sel_bottomAnchor);
  id v18 = objc_msgSend(v4, sel_bottomAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -v9[4]);

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v20 = self;
  LODWORD(v21) = 1148829696;
  objc_msgSend(v19, sel_setPriority_, v21);
  swift_release();
  *(void *)(v6 + 56) = v19;
  sub_24EEDD950();
  sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
  uint64_t v22 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_activateConstraints_, v22, v6);
  swift_release();
}

char *sub_24EE95C88(uint64_t a1, char *a2)
{
  v73[3] = type metadata accessor for FloatingTabBarLayoutProvider();
  v73[4] = &protocol witness table for FloatingTabBarLayoutProvider;
  v73[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = &a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
  *(void *)uint64_t v4 = 0;
  v4[8] = 1;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)&a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v6 = &a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  uint64_t v7 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView;
  id v8 = objc_allocWithZone(MEMORY[0x263F82588]);
  int64_t v9 = a2;
  id v10 = objc_msgSend(v8, sel_init);
  id v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FloatingCollectionView()), sel_initWithFrame_collectionViewLayout_, v10, 0.0, 0.0, 0.0, 0.0);

  *(void *)&a2[v7] = v11;
  uint64_t v12 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer;
  type metadata accessor for ContinuousSelectionGestureRecognizer();
  *(void *)&v9[v12] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView;
  *(void *)&v9[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E08]), sel_init);
  *(void *)&v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_currentWidth] = 0;
  *(void *)&v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource] = 0;
  v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating] = 0;
  v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout] = 1;
  *(void *)&v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items] = v5;
  id v14 = &v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)id v14 = 0;
  v14[8] = 1;
  v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture] = 0;
  sub_24EE96FDC((uint64_t)v73, (uint64_t)&v9[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider]);

  v72.receiver = v9;
  v72.super_class = (Class)type metadata accessor for FloatingTabBarContentView();
  id v15 = objc_msgSendSuper2(&v72, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v17 = objc_allocWithZone((Class)type metadata accessor for FloatingLayout());
  aBlock[4] = sub_24EE97078;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24EEBF904;
  aBlock[3] = &block_descriptor;
  id v18 = _Block_copy(aBlock);
  id v19 = (char *)v15;
  swift_retain();
  id v69 = objc_msgSend(v17, sel_initWithSectionProvider_, v18);
  _Block_release(v18);
  swift_release();
  swift_release();
  uint64_t v20 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView;
  double v21 = *(void **)&v19[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75A0));
  id v23 = v21;
  uint64_t v24 = sub_24EEDD440();
  int v25 = *(void **)&v19[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource];
  *(void *)&v19[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource] = v24;

  uint64_t v26 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView;
  char v27 = *(void **)&v19[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView];
  double v28 = self;
  id v29 = v27;
  id v30 = objc_msgSend(v28, sel_systemFillColor);
  objc_msgSend(v29, sel_setBackgroundColor_, v30);

  id v31 = objc_msgSend(*(id *)&v19[v26], sel_layer);
  objc_msgSend(v31, sel_setCornerRadius_, *MEMORY[0x263F15E58]);

  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[v26]);
  uint64_t v32 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer;
  uint64_t v33 = *(void **)&v19[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer];
  objc_msgSend(v33, sel_addTarget_action_, v19, sel_handleSelectionGesture_);
  objc_msgSend(v33, sel_setCancelsTouchesInView_, 0);
  sub_24EEDD9B0();
  uint64_t v34 = v19;
  uint64_t v35 = v33;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)&v35[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator + 8] = &off_2700974C0;
  swift_unknownObjectWeakAssign();

  swift_release();
  objc_msgSend(*(id *)&v19[v32], sel_setDelegate_, v34);
  id v36 = *(id *)&v19[v20];
  id v37 = objc_msgSend(v28, sel_clearColor);
  objc_msgSend(v36, sel_setBackgroundColor_, v37);

  id v38 = *(void **)&v19[v20];
  objc_msgSend(v38, sel_setCollectionViewLayout_, v69);
  objc_msgSend(v38, sel_setAccessibilityContainerType_, 4);
  uint64_t v39 = *MEMORY[0x263F832D0];
  id v40 = v38;
  unint64_t v41 = (unint64_t)objc_msgSend(v40, sel_accessibilityTraits);
  if ((v39 & ~v41) != 0) {
    uint64_t v42 = v39;
  }
  else {
    uint64_t v42 = 0;
  }
  objc_msgSend(v40, sel_setAccessibilityTraits_, v42 | v41, v69);

  id v43 = *(void **)&v19[v20];
  objc_msgSend(v43, sel_setIsAccessibilityElement_, 0);
  objc_msgSend(v43, sel_setAllowsMultipleSelection_, 0);
  objc_msgSend(v43, sel_setAllowsSelection_, 0);
  objc_msgSend(v43, sel_setScrollEnabled_, 0);
  objc_msgSend(v43, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  type metadata accessor for TabItemCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v45 = v43;
  uint64_t v46 = (void *)sub_24EEDD7B0();
  objc_msgSend(v45, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v46);

  uint64_t v47 = *(void **)&v19[v20];
  uint64_t v48 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v49 = v47;
  swift_retain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v50 = (void (**)(uint64_t))&v49[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  uint64_t v51 = *(void *)&v49[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  *uint64_t v50 = sub_24EE97090;
  v50[1] = (void (*)(uint64_t))v48;
  sub_24EE97098(v51);

  swift_release();
  swift_release();
  uint64_t v52 = *(void **)&v19[v20];
  objc_msgSend(v34, sel_addSubview_, v52);
  uint64_t v53 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_24EEDFB00;
  id v55 = objc_msgSend(v52, sel_leadingAnchor);
  id v56 = objc_msgSend(v34, sel_leadingAnchor);
  id v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v56);

  *(void *)(v54 + 32) = v57;
  id v58 = objc_msgSend(*(id *)&v19[v20], sel_trailingAnchor);
  id v59 = objc_msgSend(v34, sel_trailingAnchor);
  id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v59);

  *(void *)(v54 + 40) = v60;
  id v61 = objc_msgSend(*(id *)&v19[v20], sel_topAnchor);
  id v62 = objc_msgSend(v34, sel_topAnchor);
  id v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v62);

  *(void *)(v54 + 48) = v63;
  id v64 = objc_msgSend(*(id *)&v19[v20], sel_bottomAnchor);
  id v65 = objc_msgSend(v34, sel_bottomAnchor);
  id v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_, v65);

  *(void *)(v54 + 56) = v66;
  aBlock[0] = v54;
  sub_24EEDD950();
  sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
  uint64_t v67 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v53, sel_activateConstraints_, v67);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
  return v34;
}

uint64_t sub_24EE965F0(uint64_t a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = v1 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x25334FB00](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  swift_release();
  if (!v4) {
    return swift_release();
  }
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8))(v1, a1, ObjectType, v5);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24EE9675C(uint64_t a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = a1 + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize;
  *(void *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  swift_release();
  swift_release();
  sub_24EE91410(0);
  return swift_release();
}

uint64_t _s13FitnessCoreUI14FloatingTabBarC5coderACSgSo7NSCoderC_tcfc_0()
{
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectedIndex];
  *(void *)uint64_t v1 = 0;
  v1[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v2 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_backgroundVisuallEffectView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E58]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_layoutProvider;
  type metadata accessor for FloatingTabBarLayoutProvider();
  uint64_t v4 = swift_allocObject();
  __asm { FMOV            V0.2D, #4.0 }
  *(void *)&v0[v3] = v4;
  id v10 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView];
  *id v10 = 0;
  v10[1] = 0;
  v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_activeDisplayMode] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer] = 0;
  id v11 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentView];
  *id v11 = 0;
  v11[1] = 0;
  uint64_t v12 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_minimumHeight];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_oldRectSize];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  id v14 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_pendingSelectedIndex];
  *(void *)id v14 = 0;
  v14[8] = 1;
  v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_selectionShouldFollowGesture] = 0;
  *(_OWORD *)(v4 + 16) = _Q0;
  *(_OWORD *)(v4 + 32) = _Q0;
  id v15 = &v0[OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView];
  *id v15 = 0;
  v15[1] = 0;

  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

uint64_t sub_24EE96ADC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24EE8F2D4(v0);
}

uint64_t method lookup function for FloatingTabBar(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FloatingTabBar);
}

uint64_t dispatch thunk of FloatingTabBar.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FloatingTabBar.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of FloatingTabBar.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of FloatingTabBar.animationAnchor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of FloatingTabBar.animationAnchor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of FloatingTabBar.animationAnchor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of FloatingTabBar.selectedIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of FloatingTabBar.itemDescriptors.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of FloatingTabBar.itemDescriptors.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of FloatingTabBar.itemDescriptors.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of FloatingTabBar.selectItem(at:animated:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of FloatingTabBar.updateItemDescriptors(_:selectedIndex:animated:)(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v3) + 0x210))(a1, a2, a3 & 1);
}

unsigned char *storeEnumTagSinglePayload for FloatingTabBar.DisplayMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE96EA8);
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

ValueMetadata *type metadata accessor for FloatingTabBar.DisplayMode()
{
  return &type metadata for FloatingTabBar.DisplayMode;
}

unint64_t sub_24EE96EE4()
{
  unint64_t result = qword_269978278;
  if (!qword_269978278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978278);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_24EE96F54(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EE96F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24EE96FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24EE97040()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24EE97078(uint64_t a1, uint64_t a2)
{
  return sub_24EEA91C4(a1, a2, v2);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_24EE97088(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24EEA97AC(a1, a2, a3, v3);
}

void sub_24EE97090(uint64_t a1)
{
  sub_24EEA9ACC(a1, v1);
}

uint64_t sub_24EE97098(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t TabItem.accessibilityIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItem.accessibilityLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void TabItem.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

__n128 TabItem.sizeDescriptor.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 72);
  long long v4 = *(_OWORD *)(v1 + 88);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t TabItem.systemImageName.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItem.isSelectable.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

unint64_t sub_24EE97198(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 1684957547;
      break;
    case 3:
      unint64_t result = 0x63736544657A6973;
      break;
    case 4:
      unint64_t result = 0x6D496D6574737973;
      break;
    case 5:
      unint64_t result = 0x656C746974;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24EE97280()
{
  return sub_24EE97198(*v0);
}

uint64_t sub_24EE97288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE98828(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EE972B0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24EE972BC(uint64_t a1)
{
  unint64_t v2 = sub_24EE975F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE972F8(uint64_t a1)
{
  unint64_t v2 = sub_24EE975F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItem.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978288);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 16);
  v24[5] = *(void *)(v1 + 24);
  v24[6] = v8;
  int v33 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 56);
  uint64_t v12 = *(void *)(v1 + 64);
  uint64_t v13 = *(void *)(v1 + 72);
  uint64_t v14 = *(void *)(v1 + 80);
  uint64_t v15 = *(void *)(v1 + 88);
  uint64_t v16 = *(void *)(v1 + 96);
  uint64_t v17 = *(void *)(v1 + 104);
  v24[3] = *(void *)(v1 + 112);
  v24[4] = v17;
  v24[2] = *(void *)(v1 + 120);
  v24[1] = *(void *)(v1 + 128);
  uint64_t v18 = a1[3];
  id v19 = a1;
  uint64_t v21 = v20;
  __swift_project_boxed_opaque_existential_1(v19, v18);
  sub_24EE975F0();
  sub_24EEDDFC0();
  LOBYTE(v25) = 0;
  sub_24EEDDE30();
  if (!v2)
  {
    char v22 = v33;
    LOBYTE(v25) = 1;
    sub_24EEDDE30();
    LOBYTE(v25) = v22;
    char v34 = 2;
    sub_24EE97644();
    sub_24EEDDE60();
    uint64_t v25 = v9;
    uint64_t v26 = v10;
    uint64_t v27 = v11;
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    uint64_t v30 = v14;
    uint64_t v31 = v15;
    uint64_t v32 = v16;
    char v34 = 3;
    sub_24EE97698();
    sub_24EEDDE60();
    LOBYTE(v25) = 4;
    sub_24EEDDE20();
    LOBYTE(v25) = 5;
    sub_24EEDDE20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v21);
}

unint64_t sub_24EE975F0()
{
  unint64_t result = qword_269978290;
  if (!qword_269978290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978290);
  }
  return result;
}

unint64_t sub_24EE97644()
{
  unint64_t result = qword_269978298;
  if (!qword_269978298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978298);
  }
  return result;
}

unint64_t sub_24EE97698()
{
  unint64_t result = qword_2699782A0;
  if (!qword_2699782A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782A0);
  }
  return result;
}

uint64_t TabItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699782A8);
  uint64_t v4 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE975F0();
  sub_24EEDDFB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v50 = a1;
  uint64_t v7 = v4;
  LOBYTE(v61) = 0;
  uint64_t v8 = v80;
  uint64_t v9 = v6;
  uint64_t v10 = sub_24EEDDDB0();
  uint64_t v12 = v11;
  LOBYTE(v61) = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24EEDDDB0();
  uint64_t v15 = v14;
  LOBYTE(v52) = 2;
  sub_24EE97B84();
  swift_bridgeObjectRetain();
  sub_24EEDDDE0();
  uint64_t v49 = v15;
  LODWORD(v15) = v61;
  LOBYTE(v52) = 3;
  sub_24EE97BD8();
  sub_24EEDDDE0();
  int v48 = v15;
  uint64_t v16 = v61;
  uint64_t v17 = v62;
  uint64_t v18 = v63;
  uint64_t v19 = v64;
  uint64_t v20 = v65;
  uint64_t v21 = v66;
  uint64_t v22 = v67;
  uint64_t v23 = v68;
  LOBYTE(v61) = 4;
  uint64_t v24 = sub_24EEDDDA0();
  uint64_t v47 = v13;
  char v78 = 5;
  uint64_t v26 = v25;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_24EEDDDA0();
  uint64_t v28 = *(void (**)(void, void))(v7 + 8);
  uint64_t v45 = v26;
  uint64_t v29 = v27;
  uint64_t v30 = v9;
  uint64_t v32 = v31;
  v28(v30, v8);
  *(void *)&long long v52 = v10;
  *((void *)&v52 + 1) = v12;
  uint64_t v33 = v47;
  uint64_t v34 = v24;
  uint64_t v46 = v24;
  uint64_t v35 = v49;
  *(void *)&long long v53 = v47;
  *((void *)&v53 + 1) = v49;
  LOBYTE(v54) = v48;
  *((void *)&v54 + 1) = v16;
  *(void *)&long long v55 = v17;
  *((void *)&v55 + 1) = v18;
  *(void *)&long long v56 = v19;
  *((void *)&v56 + 1) = v20;
  *(void *)&long long v57 = v21;
  *((void *)&v57 + 1) = v22;
  *(void *)&long long v58 = v23;
  uint64_t v36 = v45;
  *((void *)&v58 + 1) = v34;
  *(void *)&long long v59 = v45;
  *((void *)&v59 + 1) = v29;
  uint64_t v60 = v32;
  sub_24EE97C2C((uint64_t)&v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v37 = v59;
  uint64_t v38 = (uint64_t)v50;
  uint64_t v39 = v51;
  *(_OWORD *)(v51 + 96) = v58;
  *(_OWORD *)(v39 + 112) = v37;
  *(void *)(v39 + 128) = v60;
  long long v40 = v55;
  *(_OWORD *)(v39 + 32) = v54;
  *(_OWORD *)(v39 + 48) = v40;
  long long v41 = v57;
  *(_OWORD *)(v39 + 64) = v56;
  *(_OWORD *)(v39 + 80) = v41;
  long long v42 = v53;
  *(_OWORD *)uint64_t v39 = v52;
  *(_OWORD *)(v39 + 16) = v42;
  __swift_destroy_boxed_opaque_existential_1(v38);
  uint64_t v61 = v10;
  uint64_t v62 = v12;
  uint64_t v63 = v33;
  uint64_t v64 = v35;
  LOBYTE(v65) = v48;
  *(_DWORD *)((char *)&v65 + 1) = v79[0];
  HIDWORD(v65) = *(_DWORD *)((char *)v79 + 3);
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  uint64_t v68 = v18;
  uint64_t v69 = v19;
  uint64_t v70 = v20;
  uint64_t v71 = v21;
  uint64_t v72 = v22;
  uint64_t v73 = v23;
  uint64_t v74 = v46;
  uint64_t v75 = v36;
  uint64_t v76 = v29;
  uint64_t v77 = v32;
  return sub_24EE97C84((uint64_t)&v61);
}

unint64_t sub_24EE97B84()
{
  unint64_t result = qword_2699782B0;
  if (!qword_2699782B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782B0);
  }
  return result;
}

unint64_t sub_24EE97BD8()
{
  unint64_t result = qword_2699782B8;
  if (!qword_2699782B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782B8);
  }
  return result;
}

uint64_t sub_24EE97C2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EE97C84(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EE97CDC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TabItem.init(from:)(a1, a2);
}

uint64_t sub_24EE97CF4(void *a1)
{
  return TabItem.encode(to:)(a1);
}

uint64_t TabItem.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  swift_bridgeObjectRelease();
  sub_24EEDDF60();
  sub_24EEDDF90();
  sub_24EEDDF90();
  sub_24EEDDF90();
  sub_24EEDDF90();
  NSDirectionalEdgeInsets.hash(into:)();
  if (!v1)
  {
    sub_24EEDDF70();
    if (v3) {
      goto LABEL_3;
    }
    return sub_24EEDDF70();
  }
  sub_24EEDDF70();
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  swift_bridgeObjectRelease();
  if (!v3) {
    return sub_24EEDDF70();
  }
LABEL_3:
  sub_24EEDDF70();
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t TabItem.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE97F14()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE97F58()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE97F98()
{
  return sub_24EEDDF90();
}

uint64_t _s13FitnessCoreUI7TabItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  double v6 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  float64x2_t v28 = *(float64x2_t *)(a1 + 72);
  float64x2_t v29 = *(float64x2_t *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  int v11 = *(unsigned __int8 *)(a2 + 32);
  double v13 = *(double *)(a2 + 40);
  double v12 = *(double *)(a2 + 48);
  float64x2_t v26 = *(float64x2_t *)(a2 + 56);
  float64x2_t v27 = *(float64x2_t *)(a1 + 88);
  float64x2_t v24 = *(float64x2_t *)(a2 + 88);
  float64x2_t v25 = *(float64x2_t *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 104);
  uint64_t v14 = *(void *)(a2 + 112);
  uint64_t v20 = *(void *)(a2 + 120);
  uint64_t v21 = *(void *)(a1 + 120);
  uint64_t v22 = *(void *)(a2 + 128);
  uint64_t v23 = *(void *)(a1 + 128);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v16 = sub_24EEDDE90(), uint64_t result = 0, (v16 & 1) != 0))
  {
    if (v2 == v9 && v3 == v10)
    {
      uint64_t result = 0;
      if ((v4 ^ v11) == 1) {
        return result;
      }
    }
    else
    {
      char v18 = sub_24EEDDE90();
      uint64_t result = 0;
      if ((v18 & 1) == 0 || v4 != v11) {
        return result;
      }
    }
    if (v6 != v13 || v5 != v12) {
      return result;
    }
    v31[0] = v29;
    v31[1] = v28;
    v31[2] = v27;
    v30[0] = v26;
    v30[1] = v25;
    v30[2] = v24;
    if (_s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(v31, v30))
    {
      if (v8)
      {
        if (!v14) {
          return 0;
        }
        if (v7 != v15 || v8 != v14)
        {
          char v19 = sub_24EEDDE90();
          uint64_t result = 0;
          if ((v19 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v14)
      {
        return 0;
      }
      if (v23)
      {
        if (v22 && (v21 == v20 && v23 == v22 || (sub_24EEDDE90() & 1) != 0)) {
          return 1;
        }
      }
      else if (!v22)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t sub_24EE981E8()
{
  unint64_t result = qword_2699782C0;
  if (!qword_2699782C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782C0);
  }
  return result;
}

uint64_t destroy for TabItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TabItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v5 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v5;
  uint64_t v6 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TabItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for TabItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v6 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TabItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TabItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItem()
{
  return &type metadata for TabItem;
}

uint64_t getEnumTagSinglePayload for TabItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TabItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x24EE986E8);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItem.CodingKeys()
{
  return &type metadata for TabItem.CodingKeys;
}

unint64_t sub_24EE98724()
{
  unint64_t result = qword_2699782C8;
  if (!qword_2699782C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782C8);
  }
  return result;
}

unint64_t sub_24EE9877C()
{
  unint64_t result = qword_2699782D0;
  if (!qword_2699782D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699782D0);
  }
  return result;
}

unint64_t sub_24EE987D4()
{
  unint64_t result = qword_2699782D8[0];
  if (!qword_2699782D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2699782D8);
  }
  return result;
}

uint64_t sub_24EE98828(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x800000024EEE5CE0 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EEE5D00 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x63736544657A6973 && a2 == 0xEE00726F74706972 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D496D6574737973 && a2 == 0xEF656D614E656761 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t StandardArtworkDescriptor.artwork.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t StandardArtworkDescriptor.cropCode.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t StandardArtworkDescriptor.init(artwork:cropCode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t result = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v9 = (void *)(a5 + *(int *)(result + 36));
  *uint64_t v9 = a2;
  v9[1] = a3;
  return result;
}

uint64_t type metadata accessor for StandardArtworkDescriptor()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24EE98BE8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24EE98BF8()
{
  return sub_24EEDDF60();
}

uint64_t sub_24EE98C20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F43706F7263 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EE98D14()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE98D5C(char a1)
{
  if (a1) {
    return 0x65646F43706F7263;
  }
  else {
    return 0x6B726F77747261;
  }
}

BOOL sub_24EE98D94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24EE98BE8(*a1, *a2);
}

uint64_t sub_24EE98DA8()
{
  return sub_24EE98D14();
}

uint64_t sub_24EE98DB8()
{
  return sub_24EE98BF8();
}

uint64_t sub_24EE98DC8()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE98E10()
{
  return sub_24EE98D5C(*v0);
}

uint64_t sub_24EE98E20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE98C20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EE98E50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EE9A018();
  *a1 = result;
  return result;
}

uint64_t sub_24EE98E7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EE98ED0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t StandardArtworkDescriptor.encode(to:)(void *a1, uint64_t a2)
{
  v9[0] = a2;
  v9[2] = *(void *)(a2 + 16);
  type metadata accessor for StandardArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EEDDE70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v9 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEDDFC0();
  char v11 = 0;
  uint64_t v7 = v9[3];
  sub_24EEDDE60();
  if (!v7)
  {
    char v10 = 1;
    sub_24EEDDE30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t type metadata accessor for StandardArtworkDescriptor.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t StandardArtworkDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v28 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v32 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for StandardArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v8 = sub_24EEDDE00();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  uint64_t v31 = v9;
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v26 - v10;
  uint64_t v29 = a3;
  uint64_t v12 = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v26 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v15 = (uint64_t)v33;
  sub_24EEDDFB0();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v33 = a1;
  char v16 = v14;
  uint64_t v17 = v28;
  char v35 = 0;
  uint64_t v18 = v30;
  sub_24EEDDDE0();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v16, v32, a2);
  char v34 = 1;
  uint64_t v19 = sub_24EEDDDB0();
  uint64_t v20 = v11;
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v20, v18);
  uint64_t v23 = (uint64_t *)&v16[*(int *)(v12 + 36)];
  *uint64_t v23 = v19;
  v23[1] = v22;
  uint64_t v24 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v27, v16, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v16, v12);
}

uint64_t sub_24EE99480@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return StandardArtworkDescriptor.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24EE994A0(void *a1, uint64_t a2)
{
  return StandardArtworkDescriptor.encode(to:)(a1, a2);
}

uint64_t StandardArtworkDescriptor.hash(into:)()
{
  sub_24EEDD770();
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t static StandardArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24EEDD790() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for StandardArtworkDescriptor() + 36);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = (void *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1]) {
    return 1;
  }
  return sub_24EEDDE90();
}

uint64_t StandardArtworkDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE99620()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE99664()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE99680(uint64_t a1, uint64_t a2)
{
  return static StandardArtworkDescriptor.== infix(_:_:)(a1, a2);
}

uint64_t sub_24EE9968C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24EE99694()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24EE9972C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    char v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24EE99830(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EE998A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24EE99928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24EE999BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24EE99A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24EE99AC4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24EE99C10);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_24EE99C24(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x24EE99E04);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            *uint64_t v18 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            v18[1] = a2 - 1;
          }
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_24EE99E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t getEnumTagSinglePayload for TabItemSize.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24EE99EC4(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE99F90);
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

unsigned char *sub_24EE99FB8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_24EE99FC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE99FE0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE99FFC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9A018()
{
  return 2;
}

uint64_t ArtworkDescriptor.standardArtworkDescriptor.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DynamicArtworkDescriptor();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v18 - v9;
  MEMORY[0x270FA5388](v8);
  int v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, v3, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = type metadata accessor for StandardArtworkDescriptor();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a2, v12, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    int v16 = &v10[*(int *)(v6 + 36)];
    uint64_t v17 = type metadata accessor for StandardArtworkDescriptor();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 16))(a2, v16, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_24EE9A254(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x63696D616E7964 && a2 == 0xE700000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647261646E617473 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EE9A348(char a1)
{
  if (a1) {
    return 0x647261646E617473;
  }
  else {
    return 0x63696D616E7964;
  }
}

uint64_t sub_24EE9A380(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7470697263736564 && a2 == 0xEA0000000000726FLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EE9A414()
{
  return sub_24EE9A348(*v0);
}

uint64_t sub_24EE9A424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE9A254(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EE9A454(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EE9A4A8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EE9A4FC()
{
  return 1;
}

uint64_t sub_24EE9A508()
{
  return sub_24EEDDF60();
}

uint64_t sub_24EE9A534()
{
  return 0x7470697263736564;
}

uint64_t sub_24EE9A550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE9A380(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EE9A584@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EE9A4FC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24EE9A5B4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EE9A608(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EE9A65C()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE9A6A0()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EE9A6E0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EE9A734(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t ArtworkDescriptor.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v39 = type metadata accessor for ArtworkDescriptor.StandardCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = sub_24EEDDE70();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  MEMORY[0x270FA5388](v4);
  long long v40 = (char *)v29 - v5;
  uint64_t v6 = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v38 = (char *)v29 - v7;
  uint64_t v8 = type metadata accessor for ArtworkDescriptor.DynamicCodingKeys();
  uint64_t v9 = swift_getWitnessTable();
  uint64_t v31 = v8;
  v29[1] = v9;
  uint64_t v10 = sub_24EEDDE70();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v32 = (char *)v29 - v11;
  uint64_t v12 = type metadata accessor for DynamicArtworkDescriptor();
  uint64_t v33 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v30 = (char *)v29 - v14;
  uint64_t v15 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v18 = sub_24EEDDE70();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v29 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEDDFC0();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v47, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = v41;
    uint64_t v21 = v42;
    uint64_t v23 = v38;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v38, v17, v42);
    char v49 = 1;
    uint64_t v24 = v40;
    uint64_t v25 = v46;
    sub_24EEDDE10();
    swift_getWitnessTable();
    uint64_t v26 = v44;
    sub_24EEDDE60();
    uint64_t v27 = v43;
  }
  else
  {
    uint64_t v22 = v33;
    uint64_t v21 = v34;
    uint64_t v23 = v30;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v17, v34);
    char v48 = 0;
    uint64_t v24 = v32;
    uint64_t v25 = v46;
    sub_24EEDDE10();
    swift_getWitnessTable();
    uint64_t v26 = v36;
    sub_24EEDDE60();
    uint64_t v27 = v35;
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v20, v25);
}

uint64_t type metadata accessor for ArtworkDescriptor.StandardCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ArtworkDescriptor.DynamicCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ArtworkDescriptor.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t ArtworkDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v61 = a4;
  uint64_t v68 = type metadata accessor for ArtworkDescriptor.StandardCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v53 = sub_24EEDDE00();
  uint64_t v55 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v63 = (char *)&v47 - v7;
  uint64_t v8 = type metadata accessor for ArtworkDescriptor.DynamicCodingKeys();
  uint64_t v58 = swift_getWitnessTable();
  uint64_t v59 = v8;
  uint64_t v52 = sub_24EEDDE00();
  uint64_t v54 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v62 = (char *)&v47 - v9;
  type metadata accessor for ArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v67 = sub_24EEDDE00();
  uint64_t v64 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v11 = (char *)&v47 - v10;
  uint64_t v57 = a2;
  uint64_t v56 = a3;
  uint64_t v65 = type metadata accessor for ArtworkDescriptor();
  uint64_t v51 = *(void *)(v65 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v65);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v47 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v47 - v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v66 = v11;
  uint64_t v20 = v73;
  sub_24EEDDFB0();
  uint64_t v21 = (uint64_t)a1;
  if (!v20)
  {
    char v49 = v17;
    uint64_t v50 = v14;
    char v48 = v19;
    uint64_t v23 = v65;
    uint64_t v22 = v66;
    uint64_t v73 = v21;
    uint64_t v24 = v67;
    *(void *)&long long v69 = sub_24EEDDDF0();
    sub_24EEDD960();
    swift_getWitnessTable();
    *(void *)&long long v71 = sub_24EEDDB90();
    *((void *)&v71 + 1) = v25;
    *(void *)&long long v72 = v26;
    *((void *)&v72 + 1) = v27;
    sub_24EEDDB80();
    swift_getWitnessTable();
    sub_24EEDDA50();
    char v28 = v69;
    if (v69 == 2 || (long long v47 = v71, v69 = v71, v70 = v72, (sub_24EEDDA60() & 1) == 0))
    {
      uint64_t v31 = sub_24EEDDC30();
      swift_allocError();
      uint64_t v32 = v22;
      uint64_t v33 = v24;
      uint64_t v35 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
      *uint64_t v35 = v23;
      sub_24EEDDD90();
      sub_24EEDDC20();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v35, *MEMORY[0x263F8DCB0], v31);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v32, v33);
    }
    else
    {
      if (v28)
      {
        LOBYTE(v69) = 1;
        sub_24EEDDD80();
        type metadata accessor for StandardArtworkDescriptor();
        swift_getWitnessTable();
        long long v40 = v50;
        uint64_t v41 = v53;
        uint64_t v42 = v63;
        sub_24EEDDDE0();
        uint64_t v43 = v64;
        (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v41);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v43 + 8))(v22, v24);
        uint64_t v44 = v23;
        swift_storeEnumTagMultiPayload();
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
        uint64_t v46 = v48;
        v45(v48, v40, v23);
        uint64_t v30 = v61;
      }
      else
      {
        LOBYTE(v69) = 0;
        sub_24EEDDD80();
        uint64_t v29 = v24;
        uint64_t v30 = v61;
        type metadata accessor for DynamicArtworkDescriptor();
        swift_getWitnessTable();
        long long v37 = v49;
        uint64_t v38 = v52;
        uint64_t v39 = v62;
        sub_24EEDDDE0();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v38);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v64 + 8))(v22, v29);
        uint64_t v44 = v23;
        swift_storeEnumTagMultiPayload();
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
        uint64_t v46 = v48;
        v45(v48, v37, v23);
      }
      v45(v30, v46, v44);
    }
    uint64_t v21 = v73;
  }
  return __swift_destroy_boxed_opaque_existential_1(v21);
}

uint64_t type metadata accessor for ArtworkDescriptor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24EE9B614@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return ArtworkDescriptor.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24EE9B634(void *a1, uint64_t a2)
{
  return ArtworkDescriptor.encode(to:)(a1, a2);
}

uint64_t ArtworkDescriptor.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = type metadata accessor for DynamicArtworkDescriptor();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, v2, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v14, v4);
    sub_24EEDDF60();
    StandardArtworkDescriptor.hash(into:)();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v14, v8);
    sub_24EEDDF60();
    DynamicArtworkDescriptor.hash(into:)();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

uint64_t static ArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v5 = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)&v32 - v6;
  uint64_t v7 = type metadata accessor for DynamicArtworkDescriptor();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v36 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)&v32 - v8;
  uint64_t v39 = a4;
  uint64_t v9 = type metadata accessor for ArtworkDescriptor();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v32 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v34 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t v20 = (char *)&v32 + *(int *)(v17 + 48) - v18;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21((char *)&v32 - v18, v40, v9);
  v21(v20, v41, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21(v13, (uint64_t)v19, v9);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = v37;
      uint64_t v22 = v38;
      uint64_t v24 = (uint64_t)v33;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v33, v20, v38);
      char v25 = static StandardArtworkDescriptor.== infix(_:_:)((uint64_t)v13, v24);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v26(v24, v22);
      v26((uint64_t)v13, v22);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v38);
LABEL_7:
    char v25 = 0;
    uint64_t v10 = v34;
    uint64_t v9 = TupleTypeMetadata2;
    goto LABEL_10;
  }
  v21(v15, (uint64_t)v19, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
    goto LABEL_7;
  }
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  uint64_t v29 = (uint64_t)v32;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v20, v36);
  char v25 = static DynamicArtworkDescriptor.== infix(_:_:)((uint64_t)v15, v29);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  v30(v29, v27);
  v30((uint64_t)v15, v27);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
  return v25 & 1;
}

uint64_t ArtworkDescriptor.hashValue.getter(uint64_t a1)
{
  sub_24EEDDF50();
  ArtworkDescriptor.hash(into:)((uint64_t)v3, a1);
  return sub_24EEDDFA0();
}

uint64_t sub_24EE9BD60(uint64_t a1, uint64_t a2)
{
  sub_24EEDDF50();
  ArtworkDescriptor.hash(into:)((uint64_t)v4, a2);
  return sub_24EEDDFA0();
}

uint64_t sub_24EE9BDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArtworkDescriptor.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t sub_24EE9BDB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9BDCC()
{
  uint64_t result = type metadata accessor for DynamicArtworkDescriptor();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for StandardArtworkDescriptor();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_24EE9BEAC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7 & 0xF8 | 7;
  uint64_t v9 = ~v8;
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = v10 + 7;
  unint64_t v12 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v12 <= (((v7 & 0xF8) + 15) & ~v8) + v12) {
    unint64_t v13 = (((v7 & 0xF8) + 15) & ~v8) + v12;
  }
  else {
    unint64_t v13 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if ((v7 & 0x1000F8) != 0 || (v13 | 1) > 0x18)
  {
    uint64_t v15 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v15 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    unsigned int v16 = a2[v13];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v18 = v13;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *a2;
          goto LABEL_19;
        case 2:
          int v19 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v19 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v19 = *(_DWORD *)a2;
LABEL_19:
          int v20 = (v19 | (v17 << (8 * v13))) + 2;
          unsigned int v16 = v19 + 2;
          if (v13 < 4) {
            unsigned int v16 = v20;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      uint64_t v21 = (void *)(((unint64_t)v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v22 = (void *)((unint64_t)&a2[v10 + 7] & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v21 = *v22;
      v21[1] = v22[1];
      *((unsigned char *)v4 + v13) = 1;
    }
    else
    {
      *a1 = *(void *)a2;
      uint64_t v23 = ((unint64_t)a1 + 15) & v9;
      uint64_t v24 = (unint64_t)(a2 + 15) & v9;
      char v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v25(v23, v24, v5);
      uint64_t v26 = (void *)((v11 + v23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v27 = (void *)((v11 + v24) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v26 = *v27;
      v26[1] = v27[1];
      *((unsigned char *)v4 + v13) = 0;
    }
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24EE9C0D8(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80) & 0xF8;
  uint64_t v6 = v5 | 7;
  uint64_t v7 = *(void *)(v4 + 64);
  unint64_t v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v9 = ((v5 + 15) & ~(v5 | 7)) + v8;
  if (v8 > v9) {
    unint64_t v9 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v10 = a1[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a1;
        goto LABEL_12;
      case 2:
        int v13 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v13 = *(_DWORD *)a1;
LABEL_12:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1)
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))((unint64_t)&a1[v6 + 8] & ~v6, v3);
  }
  return swift_bridgeObjectRelease();
}

void *sub_24EE9C280(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v8 = v7 | 7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = v9 + 7;
  unint64_t v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
  if (v11 <= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v14 = a2[v13];
  unsigned int v15 = v14 - 2;
  if (v14 >= 2)
  {
    if (v13 <= 3) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_13;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_13:
        int v18 = (v17 | (v15 << (8 * v13))) + 2;
        unsigned int v14 = v17 + 2;
        if (v13 < 4) {
          unsigned int v14 = v18;
        }
        break;
      default:
        break;
    }
  }
  if (v14 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    int v19 = (void *)(((unint64_t)a1 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    int v20 = (void *)((unint64_t)&a2[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
    *int v19 = *v20;
    v19[1] = v20[1];
    char v21 = 1;
  }
  else
  {
    *a1 = *(void *)a2;
    uint64_t v22 = ((unint64_t)a1 + v8 + 8) & ~v8;
    uint64_t v23 = (unint64_t)&a2[v8 + 8] & ~v8;
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v24(v22, v23, v5);
    char v21 = 0;
    char v25 = (void *)((v10 + v22) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v26 = (void *)((v10 + v23) & 0xFFFFFFFFFFFFFFF8);
    *char v25 = *v26;
    v25[1] = v26[1];
  }
  swift_bridgeObjectRetain();
  *((unsigned char *)a1 + v13) = v21;
  return a1;
}

unsigned __int8 *sub_24EE9C484(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8;
    uint64_t v8 = v7 | 7;
    uint64_t v9 = *(void *)(v6 + 64);
    uint64_t v10 = v9 + 7;
    unint64_t v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unint64_t v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
    if (v11 <= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          if (v13 >= 4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 4:
          int v17 = *(_DWORD *)a1;
          if (v13 < 4) {
LABEL_15:
          }
            unsigned int v14 = (v17 | (v15 << (8 * v13))) + 2;
          else {
LABEL_17:
          }
            unsigned int v14 = v17 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v8;
    if (v14 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))((unint64_t)&a1[v8 + 8] & v18, v5);
    }
    swift_bridgeObjectRelease();
    unsigned int v19 = a2[v13];
    unsigned int v20 = v19 - 2;
    if (v19 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          if (v13 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          if (v13 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v13 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v22 = *(_DWORD *)a2;
          if (v13 < 4)
          {
LABEL_31:
            unsigned int v19 = (v22 | (v20 << (8 * v13))) + 2;
            break;
          }
LABEL_35:
          if (v22 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v19 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      uint64_t v23 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
      uint64_t v24 = (void *)((unint64_t)&a2[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v23 = *v24;
      v23[1] = v24[1];
      char v25 = 1;
    }
    else
    {
LABEL_36:
      *(void *)a1 = *(void *)a2;
      uint64_t v26 = (unint64_t)&a2[v8 + 8] & v18;
      uint64_t v27 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      v27((unint64_t)&a1[v8 + 8] & v18, v26, v5);
      char v25 = 0;
      uint64_t v28 = (void *)((v10 + ((unint64_t)&a1[v8 + 8] & v18)) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v29 = (void *)((v10 + v26) & 0xFFFFFFFFFFFFFFF8);
      *uint64_t v28 = *v29;
      v28[1] = v29[1];
    }
    a1[v13] = v25;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *sub_24EE9C7C8(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v7 = v6 | 7;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = v8 + 7;
  unint64_t v10 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v11 = ((v6 + 15) & ~(v6 | 7)) + v10;
  if (v10 <= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v13 = a2[v12];
  unsigned int v14 = v13 - 2;
  if (v13 >= 2)
  {
    if (v12 <= 3) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = 4;
    }
    switch(v15)
    {
      case 1:
        int v16 = *a2;
        goto LABEL_13;
      case 2:
        int v16 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v16 = *(_DWORD *)a2;
LABEL_13:
        int v17 = (v16 | (v14 << (8 * v12))) + 2;
        unsigned int v13 = v16 + 2;
        if (v12 < 4) {
          unsigned int v13 = v17;
        }
        break;
      default:
        break;
    }
  }
  if (v13 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *))(v5 + 32))(a1, a2);
    uint64_t v18 = (uint64_t)a1 + v8 + 7;
    uint64_t v19 = (uint64_t)&a2[v8 + 7];
    char v20 = 1;
  }
  else
  {
    *a1 = *(void *)a2;
    uint64_t v21 = ((unint64_t)a1 + v7 + 8) & ~v7;
    uint64_t v22 = (unint64_t)&a2[v7 + 8] & ~v7;
    (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v21, v22);
    char v20 = 0;
    uint64_t v18 = v9 + v21;
    uint64_t v19 = v9 + v22;
  }
  *(_OWORD *)(v18 & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v19 & 0xFFFFFFFFFFFFFFF8);
  *((unsigned char *)a1 + v12) = v20;
  return a1;
}

unsigned __int8 *sub_24EE9C994(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8;
    uint64_t v8 = v7 | 7;
    uint64_t v9 = *(void *)(v6 + 64);
    uint64_t v10 = v9 + 7;
    unint64_t v11 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unint64_t v12 = ((v7 + 15) & ~(v7 | 7)) + v11;
    if (v11 <= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          if (v13 >= 4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 4:
          int v17 = *(_DWORD *)a1;
          if (v13 < 4) {
LABEL_15:
          }
            unsigned int v14 = (v17 | (v15 << (8 * v13))) + 2;
          else {
LABEL_17:
          }
            unsigned int v14 = v17 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v8;
    if (v14 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))((unint64_t)&a1[v8 + 8] & v18, v5);
    }
    swift_bridgeObjectRelease();
    unsigned int v19 = a2[v13];
    unsigned int v20 = v19 - 2;
    if (v19 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v21 = v13;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          if (v13 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          if (v13 >= 4) {
            goto LABEL_35;
          }
          goto LABEL_31;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v13 < 4) {
            goto LABEL_31;
          }
          goto LABEL_35;
        case 4:
          int v22 = *(_DWORD *)a2;
          if (v13 < 4)
          {
LABEL_31:
            unsigned int v19 = (v22 | (v20 << (8 * v13))) + 2;
            break;
          }
LABEL_35:
          if (v22 != -1) {
            goto LABEL_36;
          }
          goto LABEL_33;
        default:
          break;
      }
    }
    if (v19 == 1)
    {
LABEL_33:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      uint64_t v23 = (uint64_t)&a1[v9 + 7];
      uint64_t v24 = (uint64_t)&a2[v9 + 7];
      char v25 = 1;
    }
    else
    {
LABEL_36:
      *(void *)a1 = *(void *)a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32))((unint64_t)&a1[v8 + 8] & v18, (unint64_t)&a2[v8 + 8] & v18, v5);
      char v25 = 0;
      uint64_t v23 = v10 + ((unint64_t)&a1[v8 + 8] & v18);
      uint64_t v24 = v10 + ((unint64_t)&a2[v8 + 8] & v18);
    }
    *(_OWORD *)(v23 & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v24 & 0xFFFFFFFFFFFFFFF8);
    a1[v13] = v25;
  }
  return a1;
}

uint64_t sub_24EE9CCB0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  __int16 v4 = *(_DWORD *)(v3 + 80) & 0xF8;
  unint64_t v5 = ((*(void *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v6 = ((unsigned __int16)(v4 + 15) & (unsigned __int16)~v4 & 0x1F8) + v5;
  if (v5 > v6) {
    unint64_t v6 = ((*(void *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_23;
  }
  uint64_t v7 = v6 | 1;
  char v8 = 8 * (v6 | 1);
  if ((v6 | 1) <= 3)
  {
    unsigned int v11 = (a2 + ~(-1 << v8) - 254) >> v8;
    if (v11 > 0xFFFE)
    {
      int v9 = *(_DWORD *)((char *)a1 + v7);
      if (!v9) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }
    if (v11 > 0xFE)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v7);
      if (!*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }
    if (!v11)
    {
LABEL_23:
      unsigned int v14 = *((unsigned __int8 *)a1 + v6);
      if (v14 >= 2) {
        return (v14 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v7);
  if (!*((unsigned char *)a1 + v7)) {
    goto LABEL_23;
  }
LABEL_14:
  int v12 = (v9 - 1) << v8;
  if (v7 > 3)
  {
    int v12 = 0;
    LODWORD(v7) = 4;
  }
  switch((int)v7)
  {
    case 2:
      int v13 = *a1;
      break;
    case 3:
      int v13 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
      break;
    case 4:
      int v13 = *(_DWORD *)a1;
      break;
    default:
      int v13 = *(unsigned __int8 *)a1;
      break;
  }
  return (v13 | v12) + 255;
}

void sub_24EE9CE24(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8);
  __int16 v6 = *(_DWORD *)(v5 + 80) & 0xF8;
  unint64_t v7 = ((*(void *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v8 = ((unsigned __int16)(v6 + 15) & (unsigned __int16)~v6 & 0x1F8) + v7;
  if (v7 > v8) {
    unint64_t v8 = ((*(void *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  size_t v9 = v8 | 1;
  if (a3 < 0xFF)
  {
    int v10 = 0;
  }
  else if (v9 <= 3)
  {
    unsigned int v13 = (a3 + ~(-1 << (8 * v9)) - 254) >> (8 * v9);
    if (v13 > 0xFFFE)
    {
      int v10 = 4;
    }
    else if (v13 >= 0xFF)
    {
      int v10 = 2;
    }
    else
    {
      int v10 = v13 != 0;
    }
  }
  else
  {
    int v10 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v11 = a2 - 255;
    if (v9 < 4)
    {
      int v12 = (v11 >> (8 * v9)) + 1;
      int v14 = v11 & ~(-1 << (8 * v9));
      bzero(a1, v9);
      if (v9 == 1)
      {
        *a1 = v14;
      }
      else
      {
        *(_WORD *)a1 = v14;
        a1[2] = BYTE2(v14);
      }
    }
    else
    {
      bzero(a1, v8 | 1);
      *(_DWORD *)a1 = v11;
      int v12 = 1;
    }
    switch(v10)
    {
      case 1:
        a1[v9] = v12;
        break;
      case 2:
        *(_WORD *)&a1[v9] = v12;
        break;
      case 3:
LABEL_31:
        __break(1u);
        JUMPOUT(0x24EE9D024);
      case 4:
        *(_DWORD *)&a1[v9] = v12;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v10)
    {
      case 1:
        a1[v9] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      case 2:
        *(_WORD *)&a1[v9] = 0;
        goto LABEL_20;
      case 3:
        goto LABEL_31;
      case 4:
        *(_DWORD *)&a1[v9] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      default:
LABEL_20:
        if (a2) {
LABEL_21:
        }
          a1[v8] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_24EE9D04C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  __int16 v3 = *(_DWORD *)(v2 + 80) & 0xF8;
  unint64_t v4 = ((*(void *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unint64_t v5 = ((unsigned __int16)(v3 + 15) & (unsigned __int16)~v3 & 0x1F8) + v4;
  if (v4 <= v5) {
    unint64_t v4 = v5;
  }
  uint64_t v6 = a1[v4];
  int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a1;
        goto LABEL_12;
      case 2:
        int v9 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v9 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v9 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v10 = (v9 | (v7 << (8 * v4))) + 2;
        LODWORD(v6) = v9 + 2;
        if (v4 >= 4) {
          uint64_t v6 = v6;
        }
        else {
          uint64_t v6 = v10;
        }
        break;
      default:
        return v6;
    }
  }
  return v6;
}

void sub_24EE9D150(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (a2 > 1)
  {
    __int16 v6 = *(_DWORD *)(v4 + 80) & 0xF8;
    unint64_t v7 = ((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    size_t v8 = ((unsigned __int16)(v6 + 15) & (unsigned __int16)~v6 & 0x1F8) + v7;
    if (v7 <= v8) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = ((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v10 = a2 - 2;
    if (v9 < 4)
    {
      unsigned int v11 = v10 >> (8 * v9);
      int v12 = v10 & ~(-1 << (8 * v9));
      a1[v9] = v11 + 2;
      bzero(a1, v9);
      if (v9 == 3)
      {
        *(_WORD *)a1 = v12;
        a1[2] = BYTE2(v12);
      }
      else if (v9 == 2)
      {
        *(_WORD *)a1 = v12;
      }
      else
      {
        *a1 = v12;
      }
    }
    else
    {
      a1[v9] = 2;
      bzero(a1, v9);
      *(_DWORD *)a1 = v10;
    }
  }
  else
  {
    unint64_t v5 = ((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    if (v5 <= ((unsigned __int16)((*(_WORD *)(v4 + 80) & 0xF8) + 15) & (unsigned __int16)~(*(_WORD *)(v4 + 80) & 0xF8) & 0x1F8)
             + v5)
      v5 += (unsigned __int16)((*(_WORD *)(v4 + 80) & 0xF8) + 15) & (unsigned __int16)~(*(_WORD *)(v4 + 80) & 0xF8) & 0x1F8;
    a1[v5] = a2;
  }
}

unsigned char *sub_24EE9D28C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE9D358);
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

uint64_t sub_24EE9D38C()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for FloatingTabItemIdentifier.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *sub_24EE9D3E4(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EE9D480);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EE9D4A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D4C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D4E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D4FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D518()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D534()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D550()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D56C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EE9D588()
{
  return swift_getWitnessTable();
}

uint64_t SizeClass.init(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_24EEDD650();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4) == 1)
  {
    uint64_t result = sub_24EE9D784(a1);
    char v9 = 2;
  }
  else
  {
    unsigned int v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 32);
    uint64_t v11 = v10((char *)&v12 - v7, a1, v4);
    MEMORY[0x270FA5388](v11);
    v10((char *)&v12 - v7, (uint64_t)&v12 - v7, v4);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))((char *)&v12 - v7, v4);
    if (MEMORY[0x263F19EF8] && result == *MEMORY[0x263F19EF8])
    {
      char v9 = 0;
    }
    else if (MEMORY[0x263F19F10] && result == *MEMORY[0x263F19F10])
    {
      char v9 = 1;
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))((char *)&v12 - v7, v4);
      char v9 = 2;
    }
  }
  *a2 = v9;
  return result;
}

uint64_t sub_24EE9D784(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699784E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static TabItemKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EE9D7FC(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DD8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE9D838(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DD8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24EE9D874(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EE9D88C()
{
  if (*v0) {
    return 1701273968;
  }
  else {
    return 0x6E6F69746361;
  }
}

uint64_t sub_24EE9D8BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EE9E6D8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EE9D8E4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24EE9D8F0(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DCE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE9D92C(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DCE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EE9D968(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DD38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EE9D9A4(uint64_t a1)
{
  unint64_t v2 = sub_24EE9DD38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemKind.description.getter()
{
  if (*v0) {
    return 1701273936;
  }
  else {
    return 0x6E6F69746341;
  }
}

uint64_t sub_24EE9DA10()
{
  if (*v0) {
    return 1701273936;
  }
  else {
    return 0x6E6F69746341;
  }
}

uint64_t TabItemKind.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699784E8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699784F0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699784F8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE9DCE4();
  sub_24EEDDFC0();
  unsigned int v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24EE9DD38();
    int v14 = v18;
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24EE9DD8C();
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24EE9DCE4()
{
  unint64_t result = qword_269978500;
  if (!qword_269978500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978500);
  }
  return result;
}

unint64_t sub_24EE9DD38()
{
  unint64_t result = qword_269978508;
  if (!qword_269978508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978508);
  }
  return result;
}

unint64_t sub_24EE9DD8C()
{
  unint64_t result = qword_269978510;
  if (!qword_269978510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978510);
  }
  return result;
}

uint64_t TabItemKind.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978518);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978520);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978528);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EE9DCE4();
  uint64_t v11 = v32;
  sub_24EEDDFB0();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  int v14 = v10;
  uint64_t v15 = sub_24EEDDDF0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24EEDDC30();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *char v22 = &type metadata for TabItemKind;
    sub_24EEDDD90();
    sub_24EEDDC20();
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
    sub_24EE9DD38();
    uint64_t v18 = v14;
    sub_24EEDDD80();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24EE9DD8C();
    sub_24EEDDD80();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24EE9E238@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TabItemKind.init(from:)(a1, a2);
}

uint64_t sub_24EE9E250(void *a1)
{
  return TabItemKind.encode(to:)(a1);
}

uint64_t TabItemKind.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t TabItemKind.hashValue.getter()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EE9E2E0()
{
  unint64_t result = qword_269978530;
  if (!qword_269978530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978530);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItemKind()
{
  return &type metadata for TabItemKind;
}

unsigned char *_s13FitnessCoreUI11TabItemKindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EE9E418);
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

ValueMetadata *type metadata accessor for TabItemKind.CodingKeys()
{
  return &type metadata for TabItemKind.CodingKeys;
}

ValueMetadata *type metadata accessor for TabItemKind.ActionCodingKeys()
{
  return &type metadata for TabItemKind.ActionCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemKind.PageCodingKeys()
{
  return &type metadata for TabItemKind.PageCodingKeys;
}

unint64_t sub_24EE9E474()
{
  unint64_t result = qword_269978538;
  if (!qword_269978538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978538);
  }
  return result;
}

unint64_t sub_24EE9E4CC()
{
  unint64_t result = qword_269978540;
  if (!qword_269978540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978540);
  }
  return result;
}

unint64_t sub_24EE9E524()
{
  unint64_t result = qword_269978548;
  if (!qword_269978548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978548);
  }
  return result;
}

unint64_t sub_24EE9E57C()
{
  unint64_t result = qword_269978550;
  if (!qword_269978550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978550);
  }
  return result;
}

unint64_t sub_24EE9E5D4()
{
  unint64_t result = qword_269978558;
  if (!qword_269978558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978558);
  }
  return result;
}

unint64_t sub_24EE9E62C()
{
  unint64_t result = qword_269978560;
  if (!qword_269978560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978560);
  }
  return result;
}

unint64_t sub_24EE9E684()
{
  unint64_t result = qword_269978568;
  if (!qword_269978568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978568);
  }
  return result;
}

uint64_t sub_24EE9E6D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701273968 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EE9E7B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25334FB00](v4);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t result = swift_release();
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_24EE9E888(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  swift_unknownObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = v2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24EE9E964()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25334FB00](v1);
  swift_release();
  return v2;
}

uint64_t sub_24EE9EA2C(uint64_t a1, uint64_t a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v2 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

void (*sub_24EE9EB04(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_24EEDD9B0();
  v3[6] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  v3[7] = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25334FB00](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_24EE8EA4C;
}

uint64_t sub_24EE9EBF8()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0;
}

uint64_t sub_24EE9EC84@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_24EE9ED50(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
  swift_beginAccess();
  *uint64_t v4 = v2;
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EE9EE24()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24EE9EEE4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex);
  swift_beginAccess();
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  uint64_t result = swift_release();
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = (_BYTE)v4;
  return result;
}

uint64_t sub_24EE9EFB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v4 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex;
  swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return swift_release();
}

uint64_t sub_24EE9F078()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_release();
  return v2;
}

char *sub_24EE9F138(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v10 = &v4[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView;
  id v12 = objc_allocWithZone(MEMORY[0x263F82820]);
  uint64_t v13 = v4;
  *(void *)&v4[v11] = objc_msgSend(v12, sel_init);
  int v14 = &v13[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_layout];
  *(_OWORD *)int v14 = xmmword_24EEE0890;
  *((_OWORD *)v14 + 1) = xmmword_24EEE08A0;
  *((void *)v14 + 4) = 0x402C000000000000;
  uint64_t v15 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  *(void *)&v13[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_visibleItemDescriptors] = v9;

  v66.receiver = v13;
  v66.super_class = (Class)type metadata accessor for AccessibleFloatingTabBarControl();
  id v16 = objc_msgSendSuper2(&v66, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v16, sel_setContextMenuInteractionEnabled_, 1);
  objc_msgSend(v16, sel_setShowsMenuAsPrimaryAction_, 1);
  id v17 = objc_msgSend(v16, sel_layer);
  objc_msgSend(v17, sel_setCornerRadius_, *MEMORY[0x263F15E58]);

  uint64_t v18 = self;
  uint64_t v19 = (char *)v16;
  id v20 = objc_msgSend(v18, sel_systemFillColor);
  objc_msgSend(v19, sel_setBackgroundColor_, v20);

  uint64_t v21 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel;
  char v22 = *(void **)&v19[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel];
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v23 = v22;
  id v24 = objc_msgSend(v18, sel_labelColor);
  objc_msgSend(v23, sel_setTintColor_, v24);

  uint64_t v25 = *(void **)&v19[v21];
  uint64_t v26 = self;
  uint64_t v27 = *MEMORY[0x263F835C8];
  uint64_t v28 = *MEMORY[0x263F83460];
  id v29 = v25;
  id v30 = objc_msgSend(v19, sel_traitCollection);
  id v31 = objc_msgSend(v26, sel__preferredFontForTextStyle_maximumContentSizeCategory_compatibleWithTraitCollection_, v27, v28, v30);

  objc_msgSend(v29, sel_setFont_, v31);
  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[v21]);
  uint64_t v32 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView;
  objc_msgSend(*(id *)&v19[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v33 = sub_24EED1DF4(*MEMORY[0x263F835B0], 0, 0x100000000, *MEMORY[0x263F81808], 0, 0);
  id v34 = objc_msgSend(self, sel_configurationWithFont_scale_, v33, 1);

  id v35 = *(id *)&v19[v32];
  id v65 = v34;
  uint64_t v36 = (void *)sub_24EEDD7B0();
  id v37 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v36, v65);

  objc_msgSend(v35, sel_setImage_, v37);
  id v38 = *(id *)&v19[v32];
  id v39 = objc_msgSend(v18, sel_labelColor);
  objc_msgSend(v38, sel_setTintColor_, v39);

  objc_msgSend(v19, sel_addSubview_, *(void *)&v19[v32]);
  id v64 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_24EEE08B0;
  id v41 = objc_msgSend(*(id *)&v19[v21], sel_leadingAnchor);
  id v42 = objc_msgSend(v19, sel_leadingAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, 16.0);

  *(void *)(v40 + 32) = v43;
  id v44 = objc_msgSend(*(id *)&v19[v21], sel_topAnchor);
  id v45 = objc_msgSend(v19, (SEL)&selRef_constraintEqualToAnchor_constant_ + 3);
  id v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v45, 6.0);

  *(void *)(v40 + 40) = v46;
  id v47 = objc_msgSend(*(id *)&v19[v21], sel_bottomAnchor);
  id v48 = objc_msgSend(v19, sel_bottomAnchor);
  id v49 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v48, -6.0);

  *(void *)(v40 + 48) = v49;
  id v50 = objc_msgSend(*(id *)&v19[v32], sel_leadingAnchor);
  id v51 = objc_msgSend(*(id *)&v19[v21], sel_trailingAnchor);
  id v52 = objc_msgSend(v50, sel_constraintGreaterThanOrEqualToAnchor_constant_, v51, -8.0);

  *(void *)(v40 + 56) = v52;
  id v53 = objc_msgSend(*(id *)&v19[v32], sel_trailingAnchor);
  id v54 = objc_msgSend(v19, sel_trailingAnchor);
  id v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_constant_, v54, -14.0);

  *(void *)(v40 + 64) = v55;
  id v56 = objc_msgSend(*(id *)&v19[v32], sel_topAnchor);
  id v57 = objc_msgSend(v19, sel_topAnchor);
  id v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v57, 6.0);

  *(void *)(v40 + 72) = v58;
  id v59 = objc_msgSend(*(id *)&v19[v32], sel_bottomAnchor);
  id v60 = objc_msgSend(v19, sel_bottomAnchor);
  id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_constant_, v60, -6.0);

  *(void *)(v40 + 80) = v61;
  sub_24EEDD950();
  sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
  uint64_t v62 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v64, sel_activateConstraints_, v62);

  return v19;
}

uint64_t sub_24EE9FB38(uint64_t a1, char *a2)
{
  id v41 = a2;
  uint64_t v2 = sub_24EEDD9B0();
  v40[7] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  v40[8] = v2;
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v3 = &v41[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors];
  swift_beginAccess();
  uint64_t v4 = *(void *)v3;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)&long long v50 = MEMORY[0x263F8EE78];
  uint64_t v6 = *(void *)(v4 + 16);
  v40[6] = v4;
  if (v6)
  {
    uint64_t v7 = (uint64_t *)(v4 + 48);
    do
    {
      uint64_t v48 = v5;
      uint64_t v8 = *(v7 - 2);
      uint64_t v9 = *(v7 - 1);
      uint64_t v10 = v7[1];
      uint64_t v42 = *v7;
      uint64_t v43 = v8;
      char v11 = *((unsigned char *)v7 + 16);
      LODWORD(v47) = *((unsigned __int8 *)v7 + 17);
      LODWORD(v46) = *((unsigned __int8 *)v7 + 18);
      id v12 = (char *)v7[3];
      uint64_t v13 = v7[4];
      uint64_t v14 = v7[6];
      id v44 = (void *)v7[5];
      id v45 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      if (v11)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v5 = v48;
      }
      else
      {
        uint64_t v5 = v48;
        *(void *)&long long v50 = v48;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24EEB2CF0(0, *(void *)(v48 + 16) + 1, 1);
          uint64_t v5 = v50;
        }
        unint64_t v16 = *(void *)(v5 + 16);
        unint64_t v15 = *(void *)(v5 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_24EEB2CF0(v15 > 1, v16 + 1, 1);
          uint64_t v5 = v50;
        }
        *(void *)(v5 + 16) = v16 + 1;
        uint64_t v17 = v5 + 72 * v16;
        *(void *)(v17 + 32) = v43;
        *(void *)(v17 + 40) = v9;
        *(void *)(v17 + 48) = v42;
        *(void *)(v17 + 56) = v10;
        *(unsigned char *)(v17 + 64) = 0;
        *(unsigned char *)(v17 + 65) = v47;
        *(unsigned char *)(v17 + 66) = v46;
        *(void *)(v17 + 72) = v45;
        *(void *)(v17 + 80) = v13;
        *(void *)(v17 + 88) = v44;
        *(void *)(v17 + 96) = v14;
      }
      v7 += 9;
      --v6;
    }
    while (v6);
  }
  swift_bridgeObjectRelease();
  id v44 = v40;
  uint64_t v49 = MEMORY[0x263F8EE78];
  swift_retain();
  sub_24EEDDC70();
  uint64_t v18 = *(void *)(v5 + 16);
  uint64_t v19 = &v41[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex];
  swift_bridgeObjectRetain();
  id v45 = v19;
  swift_beginAccess();
  uint64_t v20 = v5;
  uint64_t v46 = v18;
  if (v18)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 32;
    uint64_t v48 = v5;
    do
    {
      long long v50 = *(_OWORD *)(v20 + v22);
      long long v33 = *(_OWORD *)(v20 + v22 + 16);
      long long v34 = *(_OWORD *)(v20 + v22 + 32);
      long long v35 = *(_OWORD *)(v20 + v22 + 48);
      uint64_t v54 = *(void *)(v20 + v22 + 64);
      long long v52 = v34;
      long long v53 = v35;
      long long v51 = v33;
      sub_24EEA2830((uint64_t)&v50);
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v47 = *((void *)&v53 + 1);
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v23 = v21 + 1;
      uint64_t v24 = *(void *)v45;
      int v25 = v45[8];
      swift_release();
      uint64_t v26 = (v21 == v24) & ~v25;
      sub_24EE90130(0, &qword_2699785B0);
      uint64_t v27 = swift_allocObject();
      long long v28 = v53;
      *(_OWORD *)(v27 + 48) = v52;
      *(_OWORD *)(v27 + 64) = v28;
      uint64_t v29 = v54;
      long long v30 = v51;
      *(_OWORD *)(v27 + 16) = v50;
      *(_OWORD *)(v27 + 32) = v30;
      *(void *)(v27 + 80) = v29;
      *(void *)(v27 + 88) = v21;
      uint64_t v20 = v48;
      id v31 = v41;
      *(void *)(v27 + 96) = v48;
      *(void *)(v27 + 104) = v31;
      swift_retain();
      sub_24EEA2830((uint64_t)&v50);
      id v32 = v31;
      v40[0] = 0;
      v40[1] = 0;
      v40[3] = sub_24EEA2988;
      v40[4] = v27;
      v40[2] = v26;
      sub_24EEDDB30();
      swift_release();
      sub_24EEA2888((uint64_t)&v50);
      sub_24EEDDC50();
      sub_24EEDDC80();
      sub_24EEDDC90();
      sub_24EEDDC60();
      v22 += 72;
      uint64_t v21 = v23;
    }
    while (v46 != v23);
  }
  swift_release();
  uint64_t v36 = v49;
  swift_release_n();
  if (v36 < 0 || (v36 & 0x4000000000000000) != 0)
  {
    sub_24EE90130(0, &qword_2699785A8);
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24EEDDD00();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24EEDDEA0();
    sub_24EE90130(0, &qword_2699785A8);
    uint64_t v37 = v36;
  }
  swift_release();
  sub_24EE90130(0, &qword_2699785B8);
  v40[0] = v37;
  uint64_t v38 = sub_24EEDDAE0();
  swift_release();
  return v38;
}

uint64_t sub_24EEA0180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24EEDD3A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1E80B0);
  sub_24EEA2830(a2);
  swift_bridgeObjectRetain();
  sub_24EEA2830(a2);
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24EEDD380();
  os_log_type_t v10 = sub_24EEDDA90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v34 = a5;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v36[0] = v33;
    *(_DWORD *)uint64_t v11 = 136315650;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    if (*(unsigned char *)(a2 + 33)) {
      uint64_t v12 = 1701273936;
    }
    else {
      uint64_t v12 = 0x6E6F69746341;
    }
    if (*(unsigned char *)(a2 + 33)) {
      unint64_t v13 = 0xE400000000000000;
    }
    else {
      unint64_t v13 = 0xE600000000000000;
    }
    sub_24EE94D9C(v12, v13, v36);
    sub_24EEDDB50();
    swift_bridgeObjectRelease();
    sub_24EEA2888(a2);
    sub_24EEA2888(a2);
    *(_WORD *)(v11 + 12) = 2048;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    *(_WORD *)(v11 + 22) = 2048;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_24EEDDB50();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EE87000, v9, v10, "[AccessibleFloatingTabBarControl] Selected item of kind %s at index %ld of %ld", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25334FA20](v33, -1, -1);
    MEMORY[0x25334FA20](v11, -1, -1);

    a5 = v34;
    if ((*(unsigned char *)(a2 + 33) & 1) == 0)
    {
LABEL_19:
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v14 = (uint64_t *)(a5 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
      swift_beginAccess();
      uint64_t v15 = *v14;
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v16 = sub_24EEA7FB4((uint64_t *)a2, v15);
      char v18 = v17;
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v19 = a5 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
        swift_beginAccess();
        uint64_t v20 = MEMORY[0x25334FB00](v19);
        uint64_t v21 = *(void *)(v19 + 8);
        swift_release();
        if (v20)
        {
          uint64_t ObjectType = swift_getObjectType();
          (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v21 + 16))(a5, &protocol witness table for AccessibleFloatingTabBarControl, v16, ObjectType, v21);
LABEL_34:
          swift_release();
          return swift_unknownObjectRelease();
        }
      }
      return swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24EEA2888(a2);
    sub_24EEA2888(a2);

    swift_bridgeObjectRelease();
    if ((*(unsigned char *)(a2 + 33) & 1) == 0) {
      goto LABEL_19;
    }
  }
  sub_24EEA0BD8(a3, 0, a4);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v23 = (uint64_t *)(a5 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
  swift_beginAccess();
  uint64_t v24 = *v23;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v25 = sub_24EEA7FB4((uint64_t *)a2, v24);
  char v27 = v26;
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v28 = a5 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
    swift_beginAccess();
    uint64_t v29 = MEMORY[0x25334FB00](v28);
    uint64_t v30 = *(void *)(v28 + 8);
    swift_release();
    if (v29)
    {
      uint64_t v31 = swift_getObjectType();
      (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v30 + 24))(a5, &protocol witness table for AccessibleFloatingTabBarControl, v25, v31, v30);
      goto LABEL_34;
    }
  }
  return swift_release();
}

void sub_24EEA0930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5, SEL *a6)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for AccessibleFloatingTabBarControl();
  objc_msgSendSuper2(&v17, *a5, a1, a2, a3);
  uint64_t v12 = *(void **)&v6[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel];
  unint64_t v13 = self;
  id v14 = [v13 *a6];
  objc_msgSend(v12, sel_setTextColor_, v14);

  uint64_t v15 = *(void **)&v6[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView];
  id v16 = [v13 *a6];
  objc_msgSend(v15, sel_setTintColor_, v16);
  swift_release();
}

void sub_24EEA0AAC(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, SEL *a7, SEL *a8)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v15 = a3;
  id v16 = a4;
  swift_unknownObjectRetain();
  id v17 = a1;
  sub_24EEA0930((uint64_t)v15, (uint64_t)v16, a5, a6, a7, a8);
  swift_release();

  swift_unknownObjectRelease();
}

void sub_24EEA0BD8(uint64_t a1, char a2, uint64_t a3)
{
  char v6 = a2 & 1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex;
  swift_beginAccess();
  uint64_t v8 = *(void *)v7;
  char v9 = *(unsigned char *)(v7 + 8);
  swift_release();
  unint64_t v10 = sub_24EEA1498(a3, v8, v9, a1, v6);
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24EEDD3A0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1E80B0);
  uint64_t v12 = sub_24EEDD380();
  os_log_type_t v13 = sub_24EEDDA90();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = v15;
    *(_DWORD *)uint64_t v14 = 134218242;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    *(_WORD *)(v14 + 12) = 2080;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978690);
    uint64_t v16 = sub_24EEDDB40();
    sub_24EE94D9C(v16, v17, &v22);
    sub_24EEDDB50();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EE87000, v12, v13, "[AccessibleFloatingTabBarControl] Selecting index: %ld. Proposed index: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25334FA20](v15, -1, -1);
    MEMORY[0x25334FA20](v14, -1, -1);
  }
  else
  {
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)uint64_t v7 = v10;
  *(unsigned char *)(v7 + 8) = 0;
  swift_release();
  if ((v10 & 0x8000000000000000) != 0)
  {
    objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel), sel_setText_, 0);
    uint64_t v19 = sub_24EEDD380();
    os_log_type_t v20 = sub_24EEDDA70();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134217984;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v19, v20, "[AccessibleFloatingTabBarControl] Invalid index found: %ld", v21, 0xCu);
      MEMORY[0x25334FA20](v21, -1, -1);
    }
    goto LABEL_23;
  }
  if (v10 < *(void *)(a3 + 16))
  {
    char v18 = *(void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_24EEDD7B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setText_, v19);
LABEL_23:
    swift_release();

    return;
  }
  __break(1u);
}

id AccessibleFloatingTabBarControl.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessibleFloatingTabBarControl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __swiftcall AccessibleFloatingTabBarControl.contentGestureRecognizer()(UIGestureRecognizer_optional *__return_ptr retstr)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AccessibleFloatingTabBarControl.selectItem(at:animated:shouldNotifyDelegate:)(Swift::Int at, Swift::Bool animated, Swift::Bool shouldNotifyDelegate)
{
}

Swift::Void __swiftcall AccessibleFloatingTabBarControl.updateItemDescriptors(_:expectedSize:selectedIndex:visibleItemDescriptors:visibleItemSizes:reason:shouldNotifyDelegate:animated:)(Swift::OpaquePointer _, CGSize expectedSize, Swift::Int_optional selectedIndex, Swift::OpaquePointer visibleItemDescriptors, Swift::OpaquePointer visibleItemSizes, FitnessCoreUI::FloatingTabBarUpdateReason reason, Swift::Bool shouldNotifyDelegate, Swift::Bool animated)
{
}

void (*sub_24EEA1294(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24EE9EB04(v2);
  return sub_24EEA12EC;
}

void sub_24EEA12EC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_24EEA1334()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0;
}

uint64_t sub_24EEA13BC(uint64_t a1, uint64_t a2, int a3)
{
  return sub_24EEA17CC(a1, a3);
}

uint64_t sub_24EEA13D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_24EEA15F8(a1, a2, a3 & 1, a4);
}

id sub_24EEA1408(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_24EE90130(0, &qword_2699785A8);
  uint64_t v2 = sub_24EEDD940();
  swift_retain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24EEA1498(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    if (a5)
    {
      swift_release();
      return 0;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 16);
      swift_release();
      if (v13 - 1 >= a4) {
        return a4;
      }
      else {
        return v13 - 1;
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 16);
    swift_release();
    uint64_t v11 = v10 - 1;
    if (a5)
    {
      if (v10 - 1 >= a2) {
        return a2;
      }
      else {
        return v10 - 1;
      }
    }
    else
    {
      if (v10 - 1 >= a2) {
        uint64_t v11 = a2;
      }
      if (v10 <= a4) {
        return v11;
      }
      else {
        return a4;
      }
    }
  }
}

uint64_t sub_24EEA15F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v9 = (void *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors);
  swift_beginAccess();
  *char v9 = a1;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_visibleItemDescriptors) = a4;
  swift_release();
  swift_bridgeObjectRelease();
  sub_24EEA0BD8(a2, a3 & 1, a4);
  return swift_release();
}

uint64_t sub_24EEA17CC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  LODWORD(v47) = a2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24EEDD3A0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1E80B0);
  char v6 = sub_24EEDD380();
  os_log_type_t v7 = sub_24EEDDA90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134217984;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    _os_log_impl(&dword_24EE87000, v6, v7, "[AccessibleFloatingTabBarControl] Selecting item at index %ld", v8, 0xCu);
    MEMORY[0x25334FA20](v8, -1, -1);

    uint64_t v3 = v2;
  }
  else
  {
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = *(void *)&v3[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_visibleItemDescriptors];
  swift_bridgeObjectRetain();
  swift_release();
  if (a1 < 0 || *(void *)(v9 + 16) <= a1)
  {
    swift_bridgeObjectRelease();
    char v27 = 0;
LABEL_28:
    sub_24EEA27DC();
    swift_allocError();
    *uint64_t v28 = v27;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v10 = v9 + 72 * a1;
  long long v11 = *(_OWORD *)(v10 + 80);
  uint64_t v12 = *(void *)(v10 + 96);
  long long v13 = *(_OWORD *)(v10 + 48);
  long long v44 = *(_OWORD *)(v10 + 64);
  long long v14 = *(_OWORD *)(v10 + 32);
  uint64_t v46 = v12;
  long long v45 = v11;
  v43[0] = v14;
  v43[1] = v13;
  int v15 = BYTE1(v44);
  sub_24EEA2830((uint64_t)v43);
  if (v15 != 1)
  {
    swift_bridgeObjectRelease();
    if (v47)
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v29 = (uint64_t *)&v3[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors];
      swift_beginAccess();
      uint64_t v30 = *v29;
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v31 = sub_24EEA7FB4((uint64_t *)v43, v30);
      char v33 = v32;
      swift_bridgeObjectRelease();
      sub_24EEA2888((uint64_t)v43);
      if ((v33 & 1) == 0)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v34 = &v3[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate];
        swift_beginAccess();
        uint64_t v35 = MEMORY[0x25334FB00](v34);
        uint64_t v36 = *((void *)v34 + 1);
        swift_release();
        if (v35)
        {
          uint64_t ObjectType = swift_getObjectType();
          (*(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v36 + 16))(v3, &protocol witness table for AccessibleFloatingTabBarControl, v31, ObjectType, v36);
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      sub_24EEA2888((uint64_t)v43);
    }
    char v27 = 4;
    goto LABEL_28;
  }
  sub_24EEA0BD8(a1, 0, v9);
  swift_bridgeObjectRelease();
  if (v47)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = (uint64_t *)&v3[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors];
    swift_beginAccess();
    uint64_t v17 = *v16;
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v18 = sub_24EEA7FB4((uint64_t *)v43, v17);
    char v20 = v19;
    swift_bridgeObjectRelease();
    sub_24EEA2888((uint64_t)v43);
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = v3;
      uint64_t v22 = sub_24EEDD380();
      os_log_type_t v23 = sub_24EEDDA90();
      BOOL v24 = os_log_type_enabled(v22, v23);
      uint64_t v47 = v18;
      if (v24)
      {
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 67109376;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        char v26 = (char *)v21 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
        swift_beginAccess();
        MEMORY[0x25334FB00](v26);

        swift_release();
        swift_unknownObjectRelease();
        swift_release();
        sub_24EEDDB50();

        *(_WORD *)(v25 + 8) = 2048;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        sub_24EEDDB50();
        _os_log_impl(&dword_24EE87000, v22, v23, "[AccessibleFloatingTabBarControl] Notifying delegate (%{BOOL}d) of selection at %ld", (uint8_t *)v25, 0x12u);
        MEMORY[0x25334FA20](v25, -1, -1);
      }
      else
      {

        uint64_t v22 = v21;
      }

      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v38 = (char *)v21 + OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate;
      swift_beginAccess();
      uint64_t v39 = MEMORY[0x25334FB00](v38);
      uint64_t v40 = *((void *)v38 + 1);
      swift_release();
      if (v39)
      {
        uint64_t v41 = swift_getObjectType();
        (*(void (**)(NSObject *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v40 + 24))(v21, &protocol witness table for AccessibleFloatingTabBarControl, v47, v41, v40);
        swift_release();
        return swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    sub_24EEA2888((uint64_t)v43);
  }
  return swift_release();
}

uint64_t sub_24EEA2044()
{
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v2 = &v0[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_selectedIndex];
  *(void *)uint64_t v2 = 0;
  v2[8] = 1;
  uint64_t v3 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_imageView;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82820]), sel_init);
  uint64_t v4 = &v0[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_layout];
  *(_OWORD *)uint64_t v4 = xmmword_24EEE0890;
  *((_OWORD *)v4 + 1) = xmmword_24EEE08A0;
  *((void *)v4 + 4) = 0x402C000000000000;
  uint64_t v5 = OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_titleLabel;
  *(void *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI31AccessibleFloatingTabBarControl_visibleItemDescriptors] = v1;

  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

double sub_24EEA21C8()
{
  uint64_t v1 = v0;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_msgSend(v0, sel_superview);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_frame);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    double MinX = CGRectGetMinX(v24);
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(v0, sel_frame);
    double MinX = CGRectGetMinX(v25);
    swift_release();
  }
  id v13 = objc_msgSend(v1, sel_superview);
  if (v13)
  {
    long long v14 = v13;
    objc_msgSend(v13, sel_bounds);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v26.origin.x = v16;
    v26.origin.y = v18;
    v26.size.width = v20;
    v26.size.height = v22;
    CGRectGetMaxY(v26);
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(v1, sel_frame);
    CGRectGetMaxY(v27);
    swift_release();
  }
  swift_release();
  return MinX + -8.0;
}

id sub_24EEA241C()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  id v2 = self;
  v7[4] = sub_24EEA2918;
  v7[5] = v1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_24EEA1408;
  v7[3] = &block_descriptor_0;
  uint64_t v3 = _Block_copy(v7);
  id v4 = v0;
  swift_retain();
  swift_release();
  id v5 = objc_msgSend(v2, sel_configurationWithIdentifier_previewProvider_actionProvider_, 0, 0, v3);
  swift_release();
  _Block_release(v3);
  swift_release();
  return v5;
}

uint64_t type metadata accessor for AccessibleFloatingTabBarControl()
{
  return self;
}

uint64_t method lookup function for AccessibleFloatingTabBarControl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccessibleFloatingTabBarControl);
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.highlightedIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.itemDescriptors.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AccessibleFloatingTabBarControl.selectedIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
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

uint64_t getEnumTagSinglePayload for AccessibleFloatingTabBarControl.Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AccessibleFloatingTabBarControl.Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AccessibleFloatingTabBarControl.Layout()
{
  return &type metadata for AccessibleFloatingTabBarControl.Layout;
}

unint64_t sub_24EEA27DC()
{
  unint64_t result = qword_2699786B0;
  if (!qword_2699786B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699786B0);
  }
  return result;
}

uint64_t sub_24EEA2830(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EEA2888(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EEA28E0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24EEA2918(uint64_t a1)
{
  return sub_24EE9FB38(a1, *(char **)(v1 + 16));
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_24EEA2928()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_24EEA2988(uint64_t a1)
{
  return sub_24EEA0180(a1, (uint64_t)(v1 + 2), v1[11], v1[12], v1[13]);
}

void sub_24EEA2AC4(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void))
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a4;
  id v10 = a1;
  a6();
  swift_release();
}

uint64_t sub_24EEA2BA8(uint64_t a1, CGFloat a2, CGFloat a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = objc_msgSend(v3, sel_view);
  if (v7)
  {
    double v8 = v7;
    objc_msgSend(v7, sel_bounds);
    v16.origin.x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, *(double *)&v3[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets], *(double *)&v3[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets+ 8]);
    v15.x = a2;
    v15.y = a3;
    if (CGRectContainsPoint(v16, v15))
    {
      swift_release();

      return 1;
    }
    else
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v13 = objc_msgSend(v8, sel_pointInside_withEvent_, a1, a2, a3);
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    return 0;
  }
  return (uint64_t)v13;
}

id sub_24EEA2D44(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator + 8] = 0;
  swift_unknownObjectWeakInit();
  id v5 = self;
  double v6 = v2;
  id v7 = objc_msgSend(v5, sel_currentDevice);
  id v8 = objc_msgSend(v7, sel_userInterfaceIdiom);

  double v9 = -70.0;
  if (v8 == (id)1) {
    double v9 = -25.0;
  }
  double v10 = (double *)&v6[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_additionalTouchInsets];
  *double v10 = v9;
  v10[1] = v9;
  v10[2] = v9;
  v10[3] = v9;

  sub_24EEA3088(a1, (uint64_t)v21);
  uint64_t v11 = v22;
  if (v22)
  {
    double v12 = __swift_project_boxed_opaque_existential_1(v21, v22);
    uint64_t v13 = *(void *)(v11 - 8);
    MEMORY[0x270FA5388](v12);
    CGPoint v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_24EEDDE80();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    uint64_t v16 = 0;
  }
  double v17 = (objc_class *)type metadata accessor for ContinuousSelectionGestureRecognizer();
  v20.receiver = v6;
  v20.super_class = v17;
  id v18 = objc_msgSendSuper2(&v20, sel_initWithTarget_action_, v16, a2);
  swift_unknownObjectRelease();
  sub_24EEA30F0(a1);
  return v18;
}

id sub_24EEA3020()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContinuousSelectionGestureRecognizer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContinuousSelectionGestureRecognizer()
{
  return self;
}

uint64_t sub_24EEA3088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EEA30F0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7728);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EEA3150()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (!objc_msgSend(v0, sel_state)) {
    objc_msgSend(v0, sel_setState_, 1);
  }
  return swift_release();
}

uint64_t sub_24EEA320C(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_msgSend(v1, sel_view);
  objc_msgSend(v2, sel_locationInView_, v4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = MEMORY[0x25334FB00](&v2[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator]);
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v9)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v11 = *(unsigned char *)(v9 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture);
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    if ((v11 & 1) == 0 && (sub_24EEA2BA8(a1, v6, v8) & 1) == 0)
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      if (objc_msgSend(v2, sel_state)) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 5;
      }
      objc_msgSend(v2, sel_setState_, v12);
      swift_release();
      goto LABEL_26;
    }
  }
  else
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
  }
  if (objc_msgSend(v2, sel_state) == (id)1) {
    goto LABEL_25;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v13 = objc_msgSend(v2, sel_state);
  swift_release();
  if (v13 == (id)2) {
LABEL_25:
  }
    objc_msgSend(v2, sel_setState_, 2);
LABEL_26:
  return swift_release();
}

uint64_t sub_24EEA3598()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v0, sel_state) == (id)1)
  {
    uint64_t v1 = 3;
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v2 = objc_msgSend(v0, sel_state);
    swift_release();
    if (v2 == (id)2) {
      uint64_t v1 = 3;
    }
    else {
      uint64_t v1 = 5;
    }
  }
  objc_msgSend(v0, sel_setState_, v1);
  return swift_release();
}

uint64_t sub_24EEA36DC()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v0, sel_state)) {
    uint64_t v1 = 4;
  }
  else {
    uint64_t v1 = 5;
  }
  objc_msgSend(v0, sel_setState_, v1);
  swift_release();
  return swift_release();
}

double DelayedLoadingView.init(message:internalMessage:isInternalInstall:delayDuration:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  sub_24EEDD710();
  double result = v17;
  *(double *)a8 = v17;
  *(void *)(a8 + 8) = v18;
  *(void *)(a8 + 16) = a1;
  *(void *)(a8 + 24) = a2;
  *(void *)(a8 + 32) = a3;
  *(void *)(a8 + 40) = a4;
  *(unsigned char *)(a8 + 48) = a5;
  *(void *)(a8 + 56) = a6;
  *(void *)(a8 + 64) = a7;
  return result;
}

uint64_t DelayedLoadingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  long long v2 = v1[3];
  long long v44 = v1[2];
  long long v45 = v2;
  uint64_t v46 = *((void *)v1 + 8);
  long long v3 = v1[1];
  long long v42 = *v1;
  long long v43 = v3;
  sub_24EEDD9B0();
  uint64_t v38 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v37 = v30;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75E0);
  uint64_t v4 = MEMORY[0x270FA5388](v34);
  uint64_t v36 = (uint64_t)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v30;
  MEMORY[0x270FA5388](v4);
  uint64_t v33 = (uint64_t)v30 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75D0);
  char v32 = v30;
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75C0);
  v30[2] = v30;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75B0);
  v30[1] = v30;
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  double v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v30[-2] = &v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7610);
  sub_24EEA3F90();
  sub_24EEDD490();
  sub_24EEA4058((uint64_t)&v42);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v40 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75F8);
  sub_24EEDD720();
  swift_release();
  sub_24EEA40A4((uint64_t)&v42);
  uint64_t v18 = v41;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v12, v17, v13);
  *(void *)&v12[*(int *)(v10 + 36)] = v18;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  uint64_t v19 = swift_allocObject();
  long long v20 = v45;
  *(_OWORD *)(v19 + 48) = v44;
  *(_OWORD *)(v19 + 64) = v20;
  *(void *)(v19 + 80) = v46;
  long long v21 = v43;
  *(_OWORD *)(v19 + 16) = v42;
  *(_OWORD *)(v19 + 32) = v21;
  sub_24EEA4D94((uint64_t)v12, (uint64_t)v9, &qword_26B1E75C0);
  uint64_t v22 = (uint64_t (**)())&v9[*(int *)(v31 + 36)];
  *uint64_t v22 = sub_24EEA4414;
  v22[1] = (uint64_t (*)())v19;
  v22[2] = 0;
  v22[3] = 0;
  sub_24EEA4058((uint64_t)&v42);
  sub_24EEA54B8((uint64_t)v12, &qword_26B1E75C0);
  uint64_t v23 = swift_allocObject();
  long long v24 = v45;
  *(_OWORD *)(v23 + 48) = v44;
  *(_OWORD *)(v23 + 64) = v24;
  *(void *)(v23 + 80) = v46;
  long long v25 = v43;
  *(_OWORD *)(v23 + 16) = v42;
  *(_OWORD *)(v23 + 32) = v25;
  uint64_t v26 = v33;
  sub_24EEA4D94((uint64_t)v9, v33, &qword_26B1E75D0);
  CGRect v27 = (void *)(v26 + *(int *)(v34 + 36));
  *CGRect v27 = 0;
  v27[1] = 0;
  v27[2] = sub_24EEA4D8C;
  v27[3] = v23;
  sub_24EEA4058((uint64_t)&v42);
  sub_24EEA54B8((uint64_t)v9, &qword_26B1E75D0);
  uint64_t v28 = v36;
  sub_24EEA5D08(v26, v36, &qword_26B1E75E0);
  sub_24EEA5D08(v28, v39, &qword_26B1E75E0);
  return swift_release();
}

uint64_t sub_24EEA3DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEA5D08(a1 + 16, (uint64_t)v13, &qword_26B1E7620);
  sub_24EEA5D08((uint64_t)v13, (uint64_t)v14, &qword_26B1E7620);
  if (v15) {
    goto LABEL_7;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  sub_24EEA5D08(a1 + 32, (uint64_t)v12, &qword_26B1E7620);
  sub_24EEA5D08((uint64_t)v12, (uint64_t)v16, &qword_26B1E7620);
  if (v17)
  {
LABEL_7:
    uint64_t v4 = sub_24EEDD590();
    sub_24EEA40F0(a1, (uint64_t *)v11);
    uint64_t result = swift_release();
    long long v7 = v11[0];
    long long v6 = v11[1];
    uint64_t v8 = 1;
    long long v9 = v11[2];
    long long v10 = v11[3];
  }
  else
  {
    uint64_t result = swift_release();
    uint64_t v4 = 0;
    uint64_t v8 = 0;
    long long v6 = xmmword_24EEE0990;
    long long v7 = 0uLL;
    long long v9 = 0uLL;
    long long v10 = 0uLL;
  }
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v8;
  *(_OWORD *)(a2 + 24) = v7;
  *(_OWORD *)(a2 + 40) = v6;
  *(_OWORD *)(a2 + 56) = v9;
  *(_OWORD *)(a2 + 72) = v10;
  return result;
}

uint64_t sub_24EEA3F88@<X0>(uint64_t a1@<X8>)
{
  return sub_24EEA3DD4(*(void *)(v1 + 16), a1);
}

unint64_t sub_24EEA3F90()
{
  unint64_t result = qword_26B1E7618;
  if (!qword_26B1E7618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E7610);
    sub_24EEA527C(&qword_26B1E7600, &qword_26B1E7608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7618);
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

uint64_t sub_24EEA4058(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EEA40A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EEA40F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEA5D08(a1 + 16, (uint64_t)v12, &qword_26B1E7620);
  sub_24EEA5D08((uint64_t)v12, (uint64_t)&v13, &qword_26B1E7620);
  uint64_t v4 = v14;
  if (v14) {
    uint64_t v5 = v13;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v14) {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  else {
    uint64_t v7 = 0;
  }
  sub_24EEA5D08(a1 + 32, (uint64_t)v11, &qword_26B1E7620);
  sub_24EEA5D08((uint64_t)v11, (uint64_t)&v15, &qword_26B1E7620);
  uint64_t v8 = v16;
  if (v16) {
    uint64_t v9 = v15;
  }
  else {
    uint64_t v9 = 0;
  }
  if (!v16) {
    uint64_t v6 = 0;
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = 0;
  a2[3] = v7;
  a2[4] = v9;
  a2[5] = v8;
  a2[6] = 0;
  a2[7] = v6;
  sub_24EEA5D6C(v5, v4, 0, v7);
  sub_24EEA5D6C(v9, v8, 0, v6);
  sub_24EEA5DC0((uint64_t)v12);
  sub_24EEA5DC0((uint64_t)v11);
  sub_24EEA5DEC(v9, v8, 0, v6);
  sub_24EEA5DEC(v5, v4, 0, v7);
  return swift_release();
}

uint64_t sub_24EEA4274(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7628);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  uint64_t v5 = MEMORY[0x263F8F500];
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = sub_24EEDD9D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  sub_24EEA4058(a1);
  uint64_t v7 = sub_24EEDD9A0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v5;
  long long v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v8 + 80) = v9;
  *(void *)(v8 + 96) = *(void *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 48) = v10;
  sub_24EEA4A64((uint64_t)v4, (uint64_t)&unk_2699785D8, v8);
  swift_release();
  return swift_release();
}

uint64_t sub_24EEA4414()
{
  return sub_24EEA4274(v0 + 16);
}

uint64_t sub_24EEA441C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_24EEDDCC0();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_24EEDD9B0();
  v4[6] = sub_24EEDD9A0();
  uint64_t v7 = sub_24EEDD990();
  v4[7] = v7;
  v4[8] = v6;
  return MEMORY[0x270FA2498](sub_24EEA4510, v7, v6);
}

uint64_t sub_24EEA4510()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v2 = *(void *)(v1 + 64);
  sub_24EEDDCB0();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2699785F0 + dword_2699785F0);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EEA45E0;
  return v6(v3, v2, 0, 0, 1);
}

uint64_t sub_24EEA45E0()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = v2[7];
    uint64_t v7 = v2[8];
    uint64_t v8 = sub_24EEA4850;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = v2[7];
    uint64_t v7 = v2[8];
    uint64_t v8 = sub_24EEA4778;
  }
  return MEMORY[0x270FA2498](v8, v6, v7);
}

uint64_t sub_24EEA4778()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  sub_24EEDD740();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_24EEDD4D0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24EEA4850()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  sub_24EEDD740();
  *(void *)(swift_task_alloc() + 16) = v1;
  sub_24EEDD4D0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24EEA4928(uint64_t a1)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEA4058(a1);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75F8);
  sub_24EEDD730();
  swift_release();
  sub_24EEA40A4(a1);
  return swift_release();
}

uint64_t sub_24EEA4A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EEDD9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24EEDD9C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24EEA54B8(a1, &qword_26B1E7628);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24EEDD990();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24EEA4C10(uint64_t a1)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEA4058(a1);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75F8);
  sub_24EEDD730();
  swift_release();
  sub_24EEA40A4(a1);
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_24EEA4D8C()
{
  return sub_24EEA4C10(v0 + 16);
}

uint64_t sub_24EEA4D94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EEA4DF8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of DelayedLoadingView.body>>, 1);
}

uint64_t sub_24EEA4E14()
{
  return sub_24EEDD6C0();
}

uint64_t sub_24EEA4E2C()
{
  return sub_24EEDD6D0();
}

uint64_t sub_24EEA4E44()
{
  return sub_24EEDD6E0();
}

uint64_t destroy for DelayedLoadingView()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DelayedLoadingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DelayedLoadingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for DelayedLoadingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for DelayedLoadingView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 72)) {
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

uint64_t storeEnumTagSinglePayload for DelayedLoadingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DelayedLoadingView()
{
  return &type metadata for DelayedLoadingView;
}

uint64_t sub_24EEA511C()
{
  return sub_24EEA5180(&qword_26B1E75D8, &qword_26B1E75E0, (void (*)(void))sub_24EEA5158);
}

uint64_t sub_24EEA5158()
{
  return sub_24EEA5180(&qword_26B1E75C8, &qword_26B1E75D0, (void (*)(void))sub_24EEA51F4);
}

uint64_t sub_24EEA5180(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EEA51F4()
{
  unint64_t result = qword_26B1E75B8;
  if (!qword_26B1E75B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E75C0);
    sub_24EEA527C(&qword_26B1E75A8, &qword_26B1E75B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E75B8);
  }
  return result;
}

uint64_t sub_24EEA527C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24EEA52C0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_24EEA5310(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24EEA53C4;
  return sub_24EEA441C(a1, v4, v5, v1 + 32);
}

uint64_t sub_24EEA53C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EEA54B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24EEA5514(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EEA55F0;
  return v6(a1);
}

uint64_t sub_24EEA55F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EEA56E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24EEA5720(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EEA53C4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2699785E0 + dword_2699785E0);
  return v6(a1, v4);
}

uint64_t sub_24EEA57D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24EEDDCA0();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24EEA58DC, 0, 0);
}

uint64_t sub_24EEA58DC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24EEDDCC0();
  uint64_t v5 = sub_24EEA5CC0(&qword_26B1E7698, MEMORY[0x263F8F710]);
  sub_24EEDDED0();
  sub_24EEA5CC0(&qword_26B1E7690, MEMORY[0x263F8F6D8]);
  sub_24EEDDCD0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_24EEA5A7C;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24EEA5A7C()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24EEA5C38, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24EEA5C38()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EEA5CA4()
{
  return sub_24EEA4928(*(void *)(v0 + 16));
}

uint64_t sub_24EEA5CC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EEA5D08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EEA5D6C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24EEA5DB0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24EEA5DB0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24EEA5DC0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EEA5DEC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24EEA5E30(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24EEA5E30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24EEA5E40@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect);
  swift_beginAccess();
  uint64_t v5 = *v4;
  id v6 = v5;
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

void *sub_24EEA5F08()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  swift_release();
  return v2;
}

void sub_24EEA5FC4(void *a1)
{
  uint64_t v2 = v1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (id *)&v1[OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect];
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a1;
  id v6 = a1;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = *v4;
  if (!*v4)
  {
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    id v11 = sub_24EEA65F0();
    id v12 = *v4;
    objc_msgSend(v11, sel_setEffect_, v12);

    objc_msgSend(v2, sel_setNeedsLayout);
    goto LABEL_11;
  }
  if (!v5) {
    goto LABEL_10;
  }
  sub_24EEA66C8();
  id v8 = v5;
  id v9 = v7;
  char v10 = sub_24EEDDB20();

  if ((v10 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:

  swift_release();
  swift_release();
}

void (*sub_24EEA6194(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_24EEDD9B0();
  v3[6] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect;
  v3[7] = OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect;
  id v5 = (void **)(v1 + v4);
  swift_beginAccess();
  id v6 = *v5;
  v3[3] = *v5;
  id v7 = v6;
  return sub_24EEA628C;
}

void sub_24EEA628C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(*(void *)a1 + 24);
  if (a2)
  {
    id v4 = v3;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = v2[7];
    uint64_t v6 = v2[4];
    id v7 = *(void **)(v6 + v5);
    *(void *)(v6 + v5) = v3;
    id v8 = v4;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v9 = v2[7];
    char v10 = (char *)v2[4];
    id v11 = *(void **)&v10[v9];
    if (v11)
    {
      if (!v7)
      {
LABEL_19:
        id v25 = sub_24EEA65F0();
        id v26 = *(id *)&v10[v9];
        objc_msgSend(v25, sel_setEffect_, v26);

        objc_msgSend(v10, sel_setNeedsLayout);
        goto LABEL_20;
      }
      sub_24EEA66C8();
      id v12 = v7;
      id v13 = v11;
      char v14 = sub_24EEDDB20();

      if ((v14 & 1) == 0)
      {
        uint64_t v9 = v2[7];
        char v10 = (char *)v2[4];
        goto LABEL_19;
      }
    }
    else if (v7)
    {
      goto LABEL_19;
    }
LABEL_20:

    swift_release();
    swift_release();

    id v18 = (id)v2[3];
    goto LABEL_24;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = v2[7];
  uint64_t v16 = v2[4];
  uint64_t v17 = *(void **)(v16 + v15);
  *(void *)(v16 + v15) = v3;
  id v18 = v3;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v19 = v2[7];
  long long v20 = (char *)v2[4];
  long long v21 = *(void **)&v20[v19];
  if (v21)
  {
    if (!v17)
    {
LABEL_22:
      id v27 = sub_24EEA65F0();
      id v28 = *(id *)&v20[v19];
      objc_msgSend(v27, sel_setEffect_, v28);

      objc_msgSend(v20, sel_setNeedsLayout);
      goto LABEL_23;
    }
    sub_24EEA66C8();
    id v22 = v17;
    id v23 = v21;
    char v24 = sub_24EEDDB20();

    if ((v24 & 1) == 0)
    {
      uint64_t v19 = v2[7];
      long long v20 = (char *)v2[4];
      goto LABEL_22;
    }
  }
  else if (v17)
  {
    goto LABEL_22;
  }
LABEL_23:

  swift_release();
  swift_release();
LABEL_24:
  swift_release();

  free(v2);
}

id sub_24EEA65F0()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E58]), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  swift_release();
  return v3;
}

unint64_t sub_24EEA66C8()
{
  unint64_t result = qword_26B1E7630;
  if (!qword_26B1E7630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1E7630);
  }
  return result;
}

void sub_24EEA6708()
{
  uint64_t v1 = v0;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for VFXSearchTextField();
  objc_msgSendSuper2(&v19, sel_layoutSubviews);
  objc_msgSend(v0, sel_setBackgroundColor_, 0);
  id v2 = objc_msgSend(v0, sel__backgroundView);
  if (!v2)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  id v3 = v2;
  objc_msgSend(v2, sel_setHidden_, 1);

  id v4 = sub_24EEA65F0();
  objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);

  id v5 = sub_24EEA65F0();
  id v6 = objc_msgSend(v5, sel_superview);

  id v7 = sub_24EEA65F0();
  id v8 = v7;
  if (v6) {
    objc_msgSend(v7, sel_setAlpha_, 1.0);
  }
  else {
    objc_msgSend(v1, sel_insertSubview_atIndex_, v7, 0);
  }

  id v9 = sub_24EEA65F0();
  objc_msgSend(v9, sel_setClipsToBounds_, 1);

  id v10 = sub_24EEA65F0();
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v10, sel_setFrame_);

  id v11 = sub_24EEA65F0();
  id v12 = objc_msgSend(v11, sel_layer);

  id v13 = objc_msgSend(v1, sel__backgroundView);
  if (!v13) {
    goto LABEL_12;
  }
  char v14 = v13;
  id v15 = objc_msgSend(v13, sel_layer);

  objc_msgSend(v15, sel_cornerRadius);
  double v17 = v16;

  objc_msgSend(v1, sel_frame);
  double v18 = CGRectGetHeight(v20) * 0.5;
  if (v18 >= v17) {
    double v18 = v17;
  }
  objc_msgSend(v12, sel_setCornerRadius_, v18);
  swift_release();
}

uint64_t type metadata accessor for VFXSearchTextField()
{
  return self;
}

id VFXSearchTextField.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id VFXSearchTextField.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for VFXSearchTextField();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id VFXSearchTextField.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id VFXSearchTextField.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect] = 0;
  *(void *)&v1[OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for VFXSearchTextField();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id VFXSearchTextField.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VFXSearchTextField();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24EEA6E10(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_24EEA5FC4(v1);
}

uint64_t method lookup function for VFXSearchTextField(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VFXSearchTextField);
}

uint64_t dispatch thunk of VFXSearchTextField.backgroundVisualEffect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of VFXSearchTextField.backgroundVisualEffect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of VFXSearchTextField.backgroundVisualEffect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

FitnessCoreUI::SizeClass_optional __swiftcall SizeClass.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_24EEDDD70();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *id v2 = v5;
  return result;
}

uint64_t SizeClass.rawValue.getter()
{
  uint64_t v1 = 0x72616C75676572;
  if (*v0 != 1) {
    uint64_t v1 = 0x6669636570736E75;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746361706D6F63;
  }
}

uint64_t sub_24EEA7000(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24EED7CBC(*a1, *a2);
}

FitnessCoreUI::SizeClass_optional sub_24EEA700C(Swift::String *a1)
{
  return SizeClass.init(rawValue:)(*a1);
}

void sub_24EEA7018(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE700000000000000;
  uint64_t v5 = 0x72616C75676572;
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
    uint64_t v7 = 0x746361706D6F63;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_24EEA7080()
{
  return sub_24EEDD910();
}

uint64_t sub_24EEA70E0()
{
  return sub_24EEDD8F0();
}

unint64_t sub_24EEA7134()
{
  unint64_t result = qword_269978608;
  if (!qword_269978608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978608);
  }
  return result;
}

uint64_t sub_24EEA7188()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEA7234()
{
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EEA72CC()
{
  return sub_24EEDDFA0();
}

unsigned char *storeEnumTagSinglePayload for SizeClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEA7440);
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

ValueMetadata *type metadata accessor for SizeClass()
{
  return &type metadata for SizeClass;
}

unint64_t sub_24EEA7478()
{
  unint64_t result = qword_269978610;
  if (!qword_269978610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978610);
  }
  return result;
}

id ColorDescriptor.uiColor.getter()
{
  double v1 = *v0;
  double v2 = v0[1];
  double v3 = v0[2];
  double v4 = v0[3];
  id v5 = objc_allocWithZone(MEMORY[0x263F825D0]);
  return objc_msgSend(v5, sel_initWithRed_green_blue_alpha_, v4, v3, v2, v1);
}

uint64_t NSDirectionalEdgeInsets.hash(into:)()
{
  return sub_24EEDDF90();
}

uint64_t NSDirectionalEdgeInsets.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEA7618()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEA7680()
{
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_24EEA768C()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EEA76F4()
{
  unint64_t result = qword_269978618;
  if (!qword_269978618)
  {
    type metadata accessor for NSDirectionalEdgeInsets(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978618);
  }
  return result;
}

uint64_t sub_24EEA7740@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t TabItemEdge.Set.rawValue.getter()
{
  return *(void *)v0;
}

FitnessCoreUI::TabItemEdge::Set __swiftcall TabItemEdge.Set.init(_:)(FitnessCoreUI::TabItemEdge a1)
{
  unsigned int v2 = *(unsigned __int8 *)a1;
  if (v2 >= 0x40) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1 << v2;
  }
  *double v1 = v3;
  LOBYTE(result.rawValue) = a1;
  return result;
}

void static TabItemEdge.Set.bottom.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static TabItemEdge.Set.leading.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static TabItemEdge.Set.top.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static TabItemEdge.Set.trailing.getter(void *a1@<X8>)
{
  *a1 = 8;
}

FitnessCoreUI::TabItemEdge::Set __swiftcall TabItemEdge.Set.init(rawValue:)(FitnessCoreUI::TabItemEdge::Set rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t TabItemEdge.rawValue.getter()
{
  return *v0;
}

Swift::Bool __swiftcall TabItemEdge.Set.contains(_:)(FitnessCoreUI::TabItemEdge a1)
{
  unsigned int v2 = *(unsigned __int8 *)a1;
  if (v2 >= 0x40) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1 << v2;
  }
  return (v3 & ~*v1) == 0;
}

void *sub_24EEA7820@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_24EEA782C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24EEA7834@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24EEA7848@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24EEA785C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24EEA7870(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24EEA78A0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24EEA78CC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_24EEA78F0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24EEA7904(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24EEA7918(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_24EEA792C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24EEA7940(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24EEA7954(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24EEA7968(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24EEA797C()
{
  return *v0 == 0;
}

uint64_t sub_24EEA798C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_24EEA79A4(void *result)
{
  *v1 &= ~*result;
  return result;
}

void sub_24EEA79B8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_24EEA79C4(void *a1, void *a2)
{
  return *a1 == *a2;
}

FitnessCoreUI::TabItemEdge_optional __swiftcall TabItemEdge.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *double v1 = v2;
  return (FitnessCoreUI::TabItemEdge_optional)rawValue;
}

FitnessCoreUI::TabItemEdge_optional sub_24EEA79F0(Swift::Int *a1)
{
  return TabItemEdge.init(rawValue:)(*a1);
}

void sub_24EEA79F8(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_24EEA7A04()
{
  uint64_t v0 = unk_270096188;
  if ((unk_270096188 & ~qword_270096180) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_270096180;
  uint64_t v3 = qword_270096190;
  uint64_t v2 = unk_270096198;
  if ((qword_270096190 & ~v1) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | v1;
  if ((unk_270096198 & ~v4) == 0) {
    uint64_t v2 = 0;
  }
  qword_26B1E7378 = v2 | v4;
}

void *static TabItemEdge.Set.all.getter@<X0>(void *a1@<X8>)
{
  return sub_24EEA7AF8(&qword_26B1E7380, &qword_26B1E7378, a1);
}

void sub_24EEA7A68()
{
  uint64_t v0 = unk_2700962B0;
  if ((unk_2700962B0 & ~qword_2700962A8) == 0) {
    uint64_t v0 = 0;
  }
  qword_269978620 = v0 | qword_2700962A8;
}

void *static TabItemEdge.Set.horizontal.getter@<X0>(void *a1@<X8>)
{
  return sub_24EEA7AF8(&qword_269977FB0, &qword_269978620, a1);
}

void sub_24EEA7AB0()
{
  uint64_t v0 = unk_2700961C8;
  if ((unk_2700961C8 & ~qword_2700961C0) == 0) {
    uint64_t v0 = 0;
  }
  qword_26B1E7388 = v0 | qword_2700961C0;
}

void *static TabItemEdge.Set.vertical.getter@<X0>(void *a1@<X8>)
{
  return sub_24EEA7AF8(&qword_26B1E7390, &qword_26B1E7388, a1);
}

void *sub_24EEA7AF8@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    FitnessCoreUI::TabItemEdge::Set result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

unint64_t sub_24EEA7B40()
{
  unint64_t result = qword_269978628;
  if (!qword_269978628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978628);
  }
  return result;
}

unint64_t sub_24EEA7B98()
{
  unint64_t result = qword_269978630;
  if (!qword_269978630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978630);
  }
  return result;
}

unint64_t sub_24EEA7BF0()
{
  unint64_t result = qword_269978638;
  if (!qword_269978638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978638);
  }
  return result;
}

unint64_t sub_24EEA7C48()
{
  unint64_t result = qword_269978640;
  if (!qword_269978640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978640);
  }
  return result;
}

uint64_t sub_24EEA7C9C()
{
  return sub_24EEDD920();
}

uint64_t sub_24EEA7CFC()
{
  return sub_24EEDD900();
}

unint64_t sub_24EEA7D50()
{
  unint64_t result = qword_269978648;
  if (!qword_269978648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978648);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TabItemEdge(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEA7E70);
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

ValueMetadata *type metadata accessor for TabItemEdge()
{
  return &type metadata for TabItemEdge;
}

ValueMetadata *type metadata accessor for TabItemEdge.Set()
{
  return &type metadata for TabItemEdge.Set;
}

unint64_t sub_24EEA7EB8()
{
  unint64_t result = qword_269978650;
  if (!qword_269978650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978650);
  }
  return result;
}

char *FloatingTabBarContentView.__allocating_init(layoutProvider:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  unsigned int v6 = sub_24EEB48EC(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
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

uint64_t sub_24EEA7FB4(uint64_t *a1, uint64_t a2)
{
  uint64_t v21 = *(void *)(a2 + 16);
  if (v21)
  {
    uint64_t v2 = 0;
    uint64_t v24 = a1[1];
    uint64_t v25 = *a1;
    uint64_t v23 = a1[2];
    uint64_t v20 = a1[3];
    int v18 = *((unsigned __int8 *)a1 + 33);
    int v19 = *((unsigned __int8 *)a1 + 32);
    int v17 = *((unsigned __int8 *)a1 + 34);
    uint64_t v3 = (uint64_t *)(a2 + 48);
    uint64_t v15 = a1[7];
    uint64_t v16 = a1[6];
    uint64_t v13 = a1[5];
    uint64_t v14 = a1[8];
    do
    {
      uint64_t v5 = *v3;
      uint64_t v4 = v3[1];
      int v6 = *((unsigned __int8 *)v3 + 16);
      int v7 = *((unsigned __int8 *)v3 + 17);
      int v8 = *((unsigned __int8 *)v3 + 18);
      uint64_t v9 = v3[3];
      uint64_t v10 = v3[4];
      uint64_t v11 = v3[5];
      uint64_t v22 = v3[6];
      if ((*(v3 - 2) != v25 || *(v3 - 1) != v24) && (sub_24EEDDE90() & 1) == 0) {
        goto LABEL_4;
      }
      if (v5 == v23 && v4 == v20)
      {
        if ((v19 ^ v6) & 1) != 0 || ((v18 ^ v7)) {
          goto LABEL_4;
        }
      }
      else if ((sub_24EEDDE90() & 1) == 0 || ((v19 ^ v6) & 1) != 0 || v18 != v7)
      {
        goto LABEL_4;
      }
      if (v8 == v17)
      {
        if (v10)
        {
          if (!v16 || (v9 != v13 || v10 != v16) && (sub_24EEDDE90() & 1) == 0) {
            goto LABEL_4;
          }
        }
        else if (v16)
        {
          goto LABEL_4;
        }
        if (v11 == v15 && v22 == v14 || (sub_24EEDDE90() & 1) != 0) {
          return v2;
        }
      }
LABEL_4:
      v3 += 9;
      ++v2;
    }
    while (v21 != v2);
  }
  return 0;
}

uint64_t sub_24EEA81B8(uint64_t a1)
{
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_24EEB2CD0(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    sub_24EEDD9B0();
    uint64_t v3 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v4 = *(v3 - 1);
      uint64_t v5 = v3[1];
      uint64_t v16 = *v3;
      uint64_t v17 = *(v3 - 2);
      char v14 = *((unsigned char *)v3 + 17);
      char v15 = *((unsigned char *)v3 + 16);
      char v13 = *((unsigned char *)v3 + 18);
      uint64_t v6 = v3[6];
      uint64_t v11 = v3[5];
      uint64_t v12 = v3[3];
      uint64_t v18 = v3[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      unint64_t v8 = *(void *)(v19 + 16);
      unint64_t v7 = *(void *)(v19 + 24);
      if (v8 >= v7 >> 1) {
        sub_24EEB2CD0(v7 > 1, v8 + 1, 1);
      }
      *(void *)(v19 + 16) = v8 + 1;
      uint64_t v9 = v19 + 72 * v8;
      *(void *)(v9 + 32) = v17;
      *(void *)(v9 + 40) = v4;
      *(void *)(v9 + 48) = v16;
      *(void *)(v9 + 56) = v5;
      *(unsigned char *)(v9 + 64) = v15;
      *(unsigned char *)(v9 + 65) = v14;
      *(unsigned char *)(v9 + 66) = v13;
      *(void *)(v9 + 72) = v12;
      *(void *)(v9 + 80) = v18;
      *(void *)(v9 + 88) = v11;
      *(void *)(v9 + 96) = v6;
      v3 += 9;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_24EEA838C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25334FB00](v4);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t result = swift_release();
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_24EEA845C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  swift_unknownObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v3 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = v2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24EEA8538()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25334FB00](v1);
  swift_release();
  return v2;
}

uint64_t sub_24EEA8600(uint64_t a1, uint64_t a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = v2 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  swift_release();
  return swift_unknownObjectRelease();
}

void (*sub_24EEA86D8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[5] = v1;
  sub_24EEDD9B0();
  v3[6] = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  v3[7] = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25334FB00](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_24EE8EA4C;
}

uint64_t sub_24EEA87CC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v4 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex;
  swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return swift_release();
}

uint64_t sub_24EEA8894()
{
  return sub_24EEA8BEC(24, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex);
}

uint64_t sub_24EEA88A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_24EEA8970(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  sub_24EEDD9B0();
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors);
  swift_beginAccess();
  *uint64_t v4 = v2;
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EEA8A44()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t sub_24EEA8B04@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (uint64_t *)(v5 + *a2);
  swift_beginAccess();
  uint64_t v7 = *v6;
  LOBYTE(v6) = *((unsigned char *)v6 + 8);
  uint64_t result = swift_release();
  *(void *)a3 = v7;
  *(unsigned char *)(a3 + 8) = (_BYTE)v6;
  return result;
}

uint64_t sub_24EEA8BDC()
{
  return sub_24EEA8BEC(26, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex);
}

uint64_t sub_24EEA8BEC(uint64_t a1, void *a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_release();
  return v5;
}

uint64_t sub_24EEA8CB8(uint64_t a1, char a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v2 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex;
  swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView), sel_setHidden_, *(unsigned __int8 *)(v5 + 8));
  swift_release();
  return swift_release();
}

uint64_t sub_24EEA8E00()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)(v2 + 48);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = v5[1];
      uint64_t v15 = *v5;
      uint64_t v16 = *(v5 - 2);
      char v8 = *((unsigned char *)v5 + 16);
      char v19 = *((unsigned char *)v5 + 18);
      char v20 = *((unsigned char *)v5 + 17);
      uint64_t v9 = v5[4];
      uint64_t v10 = v5[6];
      uint64_t v17 = v5[5];
      uint64_t v18 = v5[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      if (v8)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_24EEB2CF0(0, *(void *)(v3 + 16) + 1, 1);
        }
        unint64_t v12 = *(void *)(v3 + 16);
        unint64_t v11 = *(void *)(v3 + 24);
        if (v12 >= v11 >> 1) {
          sub_24EEB2CF0(v11 > 1, v12 + 1, 1);
        }
        *(void *)(v3 + 16) = v12 + 1;
        uint64_t v13 = v3 + 72 * v12;
        *(void *)(v13 + 32) = v16;
        *(void *)(v13 + 40) = v6;
        *(void *)(v13 + 48) = v15;
        *(void *)(v13 + 56) = v7;
        *(unsigned char *)(v13 + 64) = 0;
        *(unsigned char *)(v13 + 65) = v20;
        *(unsigned char *)(v13 + 66) = v19;
        *(void *)(v13 + 72) = v18;
        *(void *)(v13 + 80) = v9;
        *(void *)(v13 + 88) = v17;
        *(void *)(v13 + 96) = v10;
      }
      v5 += 9;
      --v4;
    }
    while (v4);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

char *FloatingTabBarContentView.init(layoutProvider:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = sub_24EEB35E8((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

id sub_24EEA91C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  sub_24EEDD9B0();
  uint64_t v4 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x25334FB00](v3);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v7 = *(void *)&v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items];
    swift_bridgeObjectRetain();

    swift_release();
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      uint64_t v44 = v4;
      uint64_t v54 = MEMORY[0x263F8EE78];
      sub_24EEDDC70();
      uint64_t v9 = self;
      id v45 = self;
      uint64_t v10 = self;
      uint64_t v11 = v8 - 1;
      double v12 = 0.0;
      for (uint64_t i = 32; ; i += 136)
      {
        v46[0] = *(_OWORD *)(v7 + i);
        long long v14 = *(_OWORD *)(v7 + i + 16);
        long long v15 = *(_OWORD *)(v7 + i + 32);
        long long v16 = *(_OWORD *)(v7 + i + 64);
        long long v48 = *(_OWORD *)(v7 + i + 48);
        long long v49 = v16;
        v46[1] = v14;
        long long v47 = v15;
        long long v17 = *(_OWORD *)(v7 + i + 80);
        long long v18 = *(_OWORD *)(v7 + i + 96);
        long long v19 = *(_OWORD *)(v7 + i + 112);
        uint64_t v53 = *(void *)(v7 + i + 128);
        long long v51 = v18;
        long long v52 = v19;
        long long v50 = v17;
        sub_24EE97C2C((uint64_t)v46);
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        double v20 = *(double *)&v48;
        if (v12 < *(double *)&v48) {
          double v12 = *(double *)&v48;
        }
        id v21 = objc_msgSend(v9, sel_absoluteDimension_, *((double *)&v47 + 1), v44);
        id v22 = objc_msgSend(v9, sel_absoluteDimension_, v20);
        id v23 = objc_msgSend(v45, sel_sizeWithWidthDimension_heightDimension_, v21, v22);

        id v24 = objc_msgSend(v10, sel_itemWithLayoutSize_, v23);
        swift_release();

        sub_24EE97C84((uint64_t)v46);
        sub_24EEDDC50();
        sub_24EEDDC80();
        sub_24EEDDC90();
        sub_24EEDDC60();
        if (!v11) {
          break;
        }
        --v11;
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = self;
      id v26 = objc_msgSend(v9, sel_fractionalWidthDimension_, 1.0);
      id v27 = objc_msgSend(v9, sel_absoluteDimension_, v12);
      id v28 = objc_msgSend(v45, sel_sizeWithWidthDimension_heightDimension_, v26, v27);

      sub_24EE90130(0, &qword_26B1E7678);
      uint64_t v29 = (void *)sub_24EEDD930();
      swift_release();
      id v30 = objc_msgSend(v25, sel_horizontalGroupWithLayoutSize_subitems_, v28, v29);

      id v31 = objc_msgSend(self, sel_sectionWithGroup_, v30);
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      char v32 = self;
      id v33 = objc_msgSend(v32, sel_fractionalWidthDimension_, 1.0);
      id v34 = objc_msgSend(v32, sel_fractionalHeightDimension_, 1.0);
      id v35 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v33, v34);

      id v36 = objc_msgSend(self, sel_itemWithLayoutSize_, v35);
      uint64_t v37 = self;
      id v38 = objc_msgSend(v36, sel_layoutSize);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_24EEE0E50;
      *(void *)(v39 + 32) = v36;
      *(void *)&v46[0] = v39;
      sub_24EEDD950();
      sub_24EE90130(0, &qword_26B1E7678);
      id v40 = v36;
      uint64_t v41 = (void *)sub_24EEDD930();
      swift_bridgeObjectRelease();
      id v42 = objc_msgSend(v37, sel_horizontalGroupWithLayoutSize_subitems_, v38, v41);

      id v31 = objc_msgSend(self, sel_sectionWithGroup_, v42);
      swift_release();
    }
  }
  else
  {
    swift_release();
    return 0;
  }
  return v31;
}

unint64_t sub_24EEA97AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 16;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (void *)sub_24EEDD7B0();
  uint64_t v7 = (void *)sub_24EEDD290();
  id v8 = objc_msgSend(a1, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v6, v7);

  swift_beginAccess();
  uint64_t v9 = MEMORY[0x25334FB00](v5);
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = (char *)v9;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = *(void *)&v10[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items];
  swift_bridgeObjectRetain();
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = sub_24EEDD2C0();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(v11 + 16);
    swift_release();
    unsigned __int8 v15 = 2 * (v14 - 1 == v13);
  }
  else
  {
    swift_release();
    unsigned __int8 v15 = 1;
  }
  type metadata accessor for TabItemCell();
  if (!swift_dynamicCastClass())
  {
    swift_release();

    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  id v16 = v8;
  unint64_t result = sub_24EEDD2C0();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v18 = *(void *)(v11 + 16);
    if (result < v18)
    {
      uint64_t v19 = v11 + 136 * result;
      long long v29 = *(_OWORD *)(v19 + 32);
      long long v20 = *(_OWORD *)(v19 + 48);
      long long v21 = *(_OWORD *)(v19 + 64);
      long long v22 = *(_OWORD *)(v19 + 96);
      long long v32 = *(_OWORD *)(v19 + 80);
      long long v33 = v22;
      long long v30 = v20;
      long long v31 = v21;
      long long v23 = *(_OWORD *)(v19 + 112);
      long long v24 = *(_OWORD *)(v19 + 128);
      long long v25 = *(_OWORD *)(v19 + 144);
      uint64_t v37 = *(void *)(v19 + 160);
      long long v35 = v24;
      long long v36 = v25;
      long long v34 = v23;
      sub_24EE97C2C((uint64_t)&v29);
      swift_bridgeObjectRelease();
      v27[6] = v35;
      v27[7] = v36;
      uint64_t v28 = v37;
      v27[2] = v31;
      v27[3] = v32;
      v27[4] = v33;
      v27[5] = v34;
      v27[0] = v29;
      v27[1] = v30;
      unsigned __int8 v26 = v15;
      sub_24EEB76E0(v27, &v26, v18);

      sub_24EE97C84((uint64_t)&v29);
LABEL_15:
      swift_release();
      return (unint64_t)v8;
    }
  }
  __break(1u);
  return result;
}

void sub_24EEA9ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x25334FB00](v2);
  if (v3)
  {
    uint64_t v4 = (unsigned char *)v3;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v5 = v4[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating];
    swift_release();
    if ((v5 & 1) == 0)
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v6 = &v4[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
      swift_beginAccess();
      uint64_t v7 = *(void *)v6;
      LODWORD(v6) = v6[8];
      swift_release();
      if (v6 != 1) {
        sub_24EEAEB68(v7);
      }
    }
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24EEA9D3C()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for FloatingTabBarContentView();
  objc_msgSendSuper2(&v13, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  double Width = CGRectGetWidth(v14);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_currentWidth;
  double v3 = *(double *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_currentWidth];
  swift_release();
  if (Width == v3) {
    return swift_release();
  }
  objc_msgSend(v0, sel_bounds);
  CGFloat v5 = CGRectGetWidth(v15);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(CGFloat *)&v0[v2] = v5;
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (uint64_t *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors];
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  int v9 = v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex + 8];
  swift_release();
  if (v9 == 1)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v10 = &v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
    swift_beginAccess();
    uint64_t v8 = *(void *)v10;
    char v11 = v10[8];
    swift_release();
    swift_release();
  }
  else
  {
    char v11 = 0;
  }
  LOBYTE(v12) = 1;
  sub_24EEAD248(v7, v8, v11, (char *)&v12, 0, 0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EEAA660(uint64_t a1, uint64_t a2, char a3, void *a4, char *a5, char a6, char a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  uint64_t v12 = v11;
  char v20 = *a5;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v49 = v20;
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  int v21 = a3 & 1;
  uint64_t v22 = sub_24EEDD3A0();
  __swift_project_value_buffer(v22, (uint64_t)qword_26B1E80B0);
  long long v23 = sub_24EEDD380();
  os_log_type_t v24 = sub_24EEDDA90();
  uint64_t v47 = a1;
  int v50 = v21;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v52[0] = v26;
    *(_DWORD *)uint64_t v25 = 134218242;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v55.origin.x = a8;
    v55.origin.y = a9;
    v55.size.width = a10;
    v55.size.height = a11;
    CGFloat Width = CGRectGetWidth(v55);
    swift_release();
    uint64_t v53 = *(void *)&Width;
    sub_24EEDDB50();
    *(_WORD *)(v25 + 12) = 2080;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t v53 = a2;
    BOOL v54 = v21 != 0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978690);
    uint64_t v28 = sub_24EEDDB40();
    uint64_t v53 = sub_24EE94D9C(v28, v29, v52);
    sub_24EEDDB50();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EE87000, v23, v24, "[FloatingTabBarContentView] Applying items. Rect width %f. Selected index %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25334FA20](v26, -1, -1);
    MEMORY[0x25334FA20](v25, -1, -1);
  }

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v11[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout] = 0;
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v30 = &v11[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)long long v30 = 0;
  v30[8] = 1;
  swift_release();
  long long v31 = (objc_class *)objc_msgSend(v11, sel_traitCollection);
  sub_24EEB0300(a4, v31, a8, a9, a10, a11);

  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = sub_24EEB41DC(v33, (void (*)(_OWORD *__return_ptr, uint64_t, void *))sub_24EEB52D8);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)&v11[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items] = v34;
  swift_release();
  swift_bridgeObjectRelease();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v35 = *(void *)&v11[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items];
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v36 = *(void *)(v35 + 16);
  swift_bridgeObjectRelease();
  if (v36)
  {
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v12;
    *(void *)(v37 + 24) = v47;
    *(unsigned char *)(v37 + 32) = v49;
    *(unsigned char *)(v37 + 33) = a7 & 1;
    *(void *)(v37 + 40) = a2;
    *(unsigned char *)(v37 + 48) = v50 != 0;
    *(unsigned char *)(v37 + 49) = a6 & 1;
    *(void *)(swift_allocObject() + 16) = v12;
    if (a7)
    {
      sub_24EE90130(0, &qword_269978768);
      id v38 = v12;
      swift_bridgeObjectRetain();
      uint64_t v39 = v38;
      sub_24EEDDB00();
      swift_release();
      swift_release();
    }
    else
    {
      id v42 = v12;
      swift_bridgeObjectRetain();
      long long v43 = v42;
      sub_24EEAB108((uint64_t)v43, v47, v49, 0, a2, v50, a6 & 1);
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v43[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating] = 0;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v40 = &v12[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
    swift_beginAccess();
    *(void *)id v40 = 0;
    v40[8] = 1;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    objc_msgSend(*(id *)&v12[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView], sel_setHidden_, v40[8]);
    swift_release();
    swift_release();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v41 = &v12[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
    swift_beginAccess();
    *(void *)uint64_t v41 = 0;
    v41[8] = 1;
    swift_release();
    char v51 = v49;
    sub_24EEAF96C(MEMORY[0x263F8EE78], &v51, a7 & 1);
  }
  return swift_release();
}

void sub_24EEAB108(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, char a6, char a7)
{
  char v12 = a3 & 1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v13 = a6 & 1;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating) = 1;
  swift_release();
  v43[0] = v12;
  sub_24EEAF96C(a2, v43, a4 & 1);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v14 = a1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex;
  swift_beginAccess();
  uint64_t v15 = *(void *)v14;
  char v16 = *(unsigned char *)(v14 + 8);
  swift_release();
  Swift::Int v17 = sub_24EEB478C(a2, v15, v16, a5, v13);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = *(void *)v14;
  char v19 = *(unsigned char *)(v14 + 8);
  swift_release();
  if ((v19 & 1) != 0 || v17 != v18)
  {
    FloatingTabBarContentView.selectItem(at:animated:shouldNotifyDelegate:)(v17, 0, a7 & 1);
    if (!v20) {
      goto LABEL_40;
    }
    id v41 = v20;
    id v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978760);
    if (swift_dynamicCast())
    {
      if (v40 == 4)
      {

        if (qword_26B1E7568 != -1) {
          swift_once();
        }
        uint64_t v37 = sub_24EEDD3A0();
        __swift_project_value_buffer(v37, (uint64_t)qword_26B1E80B0);
        long long v23 = sub_24EEDD380();
        os_log_type_t v38 = sub_24EEDDA90();
        if (!os_log_type_enabled(v23, v38)) {
          goto LABEL_38;
        }
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 134217984;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        sub_24EEDDB50();
        os_log_type_t v26 = v38;
        id v27 = "[FloatingTabBarContentView] Index is not selectable: %ld";
        goto LABEL_37;
      }
      if (!v40)
      {

        if (qword_26B1E7568 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_24EEDD3A0();
        __swift_project_value_buffer(v22, (uint64_t)qword_26B1E80B0);
        long long v23 = sub_24EEDD380();
        os_log_type_t v24 = sub_24EEDDA70();
        if (!os_log_type_enabled(v23, v24)) {
          goto LABEL_38;
        }
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 134217984;
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_release();
        sub_24EEDDB50();
        os_log_type_t v26 = v24;
        id v27 = "[FloatingTabBarContentView] Failed to select invalid index: %ld";
LABEL_37:
        _os_log_impl(&dword_24EE87000, v23, v26, v27, v25, 0xCu);
        MEMORY[0x25334FA20](v25, -1, -1);
LABEL_38:

        uint64_t v36 = v41;
LABEL_39:

        goto LABEL_40;
      }
    }

    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_24EEDD3A0();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B1E80B0);
    id v29 = v20;
    id v30 = v20;
    long long v31 = sub_24EEDD380();
    os_log_type_t v32 = sub_24EEDDA70();
    if (!os_log_type_enabled(v31, v32))
    {

      swift_release();
      return;
    }
    uint64_t v33 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134218242;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    *(_WORD *)(v33 + 12) = 2112;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v35 = v20;
    swift_release();
    id v42 = (id)_swift_stdlib_bridgeErrorToNSError();
    sub_24EEDDB50();
    *uint64_t v34 = v42;

    _os_log_impl(&dword_24EE87000, v31, v32, "[FloatingTabBarContentView] Failed to select index %ld with error: %@", (uint8_t *)v33, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978270);
    swift_arrayDestroy();
    MEMORY[0x25334FA20](v34, -1, -1);
    MEMORY[0x25334FA20](v33, -1, -1);

    uint64_t v36 = v20;
    goto LABEL_39;
  }
  sub_24EEAEB68(v17);
LABEL_40:
  swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FloatingTabBarContentView.selectItem(at:animated:shouldNotifyDelegate:)(Swift::Int at, Swift::Bool animated, Swift::Bool shouldNotifyDelegate)
{
  uint64_t v4 = v3;
  BOOL v139 = shouldNotifyDelegate;
  BOOL v140 = animated;
  uint64_t v6 = sub_24EEDD9B0();
  uint64_t v7 = sub_24EEDD9A0();
  uint64_t v144 = v6;
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  Swift::Int v143 = at;
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24EEDD3A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1E80B0);
  int v9 = sub_24EEDD380();
  os_log_type_t v10 = sub_24EEDDA90();
  uint64_t v142 = v3;
  if (!os_log_type_enabled(v9, v10))
  {

    unint64_t v12 = v143;
    if ((v143 & 0x8000000000000000) == 0) {
      goto LABEL_11;
    }
LABEL_18:
    char v16 = 0;
LABEL_73:
    sub_24EEA27DC();
    swift_allocError();
    *os_log_type_t v98 = v16;
    swift_willThrow();
    swift_release();
    return;
  }
  uint64_t v141 = v7;
  uint64_t v11 = swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 134218240;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t v145 = v143;
  sub_24EEDDB50();
  *(_WORD *)(v11 + 12) = 1024;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  LODWORD(v145) = v140;
  sub_24EEDDB50();
  _os_log_impl(&dword_24EE87000, v9, v10, "[FloatingTabBarContentView] Selecting index %ld. Animated: %{BOOL}d", (uint8_t *)v11, 0x12u);
  MEMORY[0x25334FA20](v11, -1, -1);

  uint64_t v7 = v141;
  uint64_t v4 = v142;
  unint64_t v12 = v143;
  if (v143 < 0) {
    goto LABEL_18;
  }
LABEL_11:
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v13 = v4[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout];
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v13)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v15 = &v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
    *(void *)uint64_t v15 = v12;
    v15[8] = 0;
    swift_release();
    char v16 = 3;
    goto LABEL_73;
  }
  uint64_t v141 = v7;
  if ((isCurrentExecutor & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v17 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items;
  uint64_t v18 = v142;
  uint64_t v19 = *(void *)&v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items];
  swift_bridgeObjectRetain();
  swift_release();
  unint64_t v20 = *(void *)(v19 + 16);
  swift_bridgeObjectRelease();
  if (v20 <= v12)
  {
    id v95 = sub_24EEDD380();
    os_log_type_t v96 = sub_24EEDDA70();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v97 = 134217984;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v145 = v12;
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v95, v96, "[FloatingTabBarContentView] Index %ld to select is beyond valid bounds. Returning.", v97, 0xCu);
      MEMORY[0x25334FA20](v97, -1, -1);
    }

    char v16 = 0;
    goto LABEL_73;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v21 = *(void *)&v142[v17];
  swift_bridgeObjectRetain();
  swift_release();
  if (*(void *)(v21 + 16) <= v12)
  {
    __break(1u);
    goto LABEL_108;
  }
  uint64_t v22 = v21 + 136 * v12;
  long long v153 = *(_OWORD *)(v22 + 32);
  long long v23 = *(_OWORD *)(v22 + 48);
  long long v24 = *(_OWORD *)(v22 + 64);
  long long v25 = *(_OWORD *)(v22 + 96);
  long long v156 = *(_OWORD *)(v22 + 80);
  long long v157 = v25;
  long long v154 = v23;
  long long v155 = v24;
  long long v26 = *(_OWORD *)(v22 + 112);
  long long v27 = *(_OWORD *)(v22 + 128);
  long long v28 = *(_OWORD *)(v22 + 144);
  uint64_t v161 = *(void *)(v22 + 160);
  long long v159 = v27;
  long long v160 = v28;
  long long v158 = v26;
  int v29 = v155;
  sub_24EE97C2C((uint64_t)&v153);
  swift_bridgeObjectRelease();
  if (v29 != 1)
  {
    if (!v139)
    {
      sub_24EE97C84((uint64_t)&v153);
LABEL_100:
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v128 = &v18[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
      uint64_t v129 = *(void *)&v18[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
      char v130 = v18[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex + 8];
      swift_release();
      char v16 = 4;
      if ((v130 & 1) == 0 && v129 == v12)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        *(void *)uint64_t v128 = 0;
        v128[8] = 1;
        swift_release();
        char v16 = 4;
      }
      goto LABEL_73;
    }
    uint64_t v99 = sub_24EEA8E00();
    if (*(void *)(v99 + 16) > v12)
    {
      unint64_t v100 = v99 + 72 * v12;
      v151[0] = *(_OWORD *)(v100 + 32);
      long long v101 = *(_OWORD *)(v100 + 48);
      long long v102 = *(_OWORD *)(v100 + 64);
      long long v103 = *(_OWORD *)(v100 + 80);
      uint64_t v152 = *(void *)(v100 + 96);
      v151[2] = v102;
      v151[3] = v103;
      v151[1] = v101;
      sub_24EEA2830((uint64_t)v151);
      swift_bridgeObjectRelease();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v104 = (uint64_t *)&v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors];
      swift_beginAccess();
      uint64_t v105 = *v104;
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t v106 = sub_24EEA7FB4((uint64_t *)v151, v105);
      char v108 = v107;
      swift_bridgeObjectRelease();
      sub_24EEA2888((uint64_t)v151);
      if ((v108 & 1) == 0)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v109 = &v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate];
        swift_beginAccess();
        uint64_t v110 = MEMORY[0x25334FB00](v109);
        uint64_t v111 = *((void *)v109 + 1);
        swift_release();
        if (v110)
        {
          uint64_t ObjectType = swift_getObjectType();
          (*(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v111 + 16))(v142, &protocol witness table for FloatingTabBarContentView, v106, ObjectType, v111);
          swift_unknownObjectRelease();
        }
      }
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v18 = v142;
      v113 = &v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
      swift_beginAccess();
      uint64_t v114 = *(void *)v113;
      int v115 = v113[8];
      swift_release();
      if (v115 == 1)
      {
        sub_24EE97C84((uint64_t)&v153);
      }
      else
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        *(void *)v113 = 0;
        v113[8] = 1;
        swift_release();
        id v116 = *(void **)&v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
        uint64_t v117 = sub_24EEDD2E0();
        uint64_t v118 = *(void *)(v117 - 8);
        MEMORY[0x270FA5388](v117);
        uint64_t v120 = (char *)&v131 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0);
        MEMORY[0x25334E6A0](v114, 0);
        v121 = (void *)sub_24EEDD290();
        (*(void (**)(char *, uint64_t))(v118 + 8))(v120, v117);
        id v122 = objc_msgSend(v116, sel_cellForItemAtIndexPath_, v121);

        if (v122)
        {
          objc_msgSend(v122, sel_setHighlighted_, 0);
          sub_24EE97C84((uint64_t)&v153);
        }
        else
        {
          sub_24EE97C84((uint64_t)&v153);
        }
        uint64_t v18 = v142;
      }
      goto LABEL_100;
    }
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v30 = &v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
  swift_beginAccess();
  id v134 = *(id **)v30;
  LODWORD(v132) = v30[8];
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  long long v31 = &v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
  swift_beginAccess();
  id v135 = *(id **)v31;
  LODWORD(v133) = v31[8];
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)id v30 = v143;
  v30[8] = 0;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView], sel_setHidden_, v30[8]);
  swift_release();
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)long long v31 = 0;
  v31[8] = 1;
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  unint64_t v32 = v143;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v33 = &v18[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)uint64_t v33 = 0;
  v33[8] = 1;
  swift_release();
  id v136 = &v131;
  uint64_t v138 = sub_24EEDD2E0();
  uint64_t v34 = *(void *)(v138 - 8);
  uint64_t v35 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v138);
  v137 = (char *)&v131 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x25334E6A0](v32, 0);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v36 = *(void **)&v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource];
  id v37 = v36;
  swift_release();
  if (!v36)
  {
    sub_24EE97C84((uint64_t)&v153);
    os_log_type_t v38 = v137;
LABEL_94:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v38, v138);
LABEL_97:
    swift_release();
    return;
  }
  os_log_type_t v38 = v137;
  sub_24EEDD450();

  if (!v146)
  {
    sub_24EE97C84((uint64_t)&v153);
    goto LABEL_94;
  }
  sub_24EEB49F4(v145, v146);
  uint64_t v39 = *(void **)&v142[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
  char v40 = (void *)sub_24EEDD290();
  id v41 = objc_msgSend(v39, sel_cellForItemAtIndexPath_, v40);

  if (!v41)
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v38, v138);
    sub_24EE97C84((uint64_t)&v153);
    goto LABEL_97;
  }
  id v131 = v41;
  char v42 = (char)v132;
  if (v134 == (id *)v32) {
    char v42 = 1;
  }
  if ((v42 & 1) == 0)
  {
    uint64_t v43 = MEMORY[0x270FA5388](v134);
    MEMORY[0x25334E6A0](v43, 0);
    uint64_t v44 = (void *)sub_24EEDD290();
    (*(void (**)(char *, uint64_t))(v34 + 8))((char *)&v131 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v138);
    id v45 = objc_msgSend(v39, sel_cellForItemAtIndexPath_, v44);

    if (v45)
    {
      objc_msgSend(v45, sel_setSelected_, 0);
    }
  }
  uint64_t v46 = v135;
  char v47 = v133;
  if (v135 == (id *)v32) {
    char v47 = 1;
  }
  if ((v47 & 1) == 0)
  {
    uint64_t v48 = MEMORY[0x270FA5388](v135);
    MEMORY[0x25334E6A0](v48, 0);
    char v49 = (void *)sub_24EEDD290();
    (*(void (**)(char *, uint64_t))(v34 + 8))((char *)&v131 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v138);
    id v50 = objc_msgSend(v39, sel_cellForItemAtIndexPath_, v49);

    if (v50)
    {
      objc_msgSend(v50, sel_setSelected_, 0);
      objc_msgSend(v50, sel_setHighlighted_, 0);
    }
  }
  id v135 = &v131;
  MEMORY[0x270FA5388](v46);
  char v51 = (char *)&v131 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v52 = *(void (**)(void))(v34 + 16);
  uint64_t v53 = v138;
  uint64_t v54 = ((uint64_t (*)(char *, char *, uint64_t))v52)(v51, v137, v138);
  id v134 = &v131;
  MEMORY[0x270FA5388](v54);
  uint64_t v132 = v51;
  v52();
  unint64_t v55 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  unint64_t v56 = (v35 + v55 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v57 = swift_allocObject();
  id v58 = v142;
  id v59 = v131;
  *(void *)(v57 + 16) = v142;
  *(void *)(v57 + 24) = v59;
  uint64_t v60 = v53;
  uint64_t v61 = v57;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v57 + v55, v51, v60);
  unint64_t v62 = v61 + v56;
  long long v63 = v160;
  *(_OWORD *)(v62 + 96) = v159;
  *(_OWORD *)(v62 + 112) = v63;
  *(void *)(v62 + 128) = v161;
  long long v64 = v156;
  *(_OWORD *)(v62 + 32) = v155;
  *(_OWORD *)(v62 + 48) = v64;
  long long v65 = v158;
  *(_OWORD *)(v62 + 64) = v157;
  *(_OWORD *)(v62 + 80) = v65;
  long long v66 = v154;
  *(_OWORD *)unint64_t v62 = v153;
  *(_OWORD *)(v62 + 16) = v66;
  uint64_t v133 = swift_allocObject();
  *(void *)(v133 + 16) = v32;
  sub_24EE97C2C((uint64_t)&v153);
  uint64_t v67 = v58;
  uint64_t v68 = v59;
  uint64_t v69 = (uint64_t)v67;
  uint64_t v142 = v68;
  if (!v139) {
    goto LABEL_62;
  }
  uint64_t v70 = sub_24EEA8E00();
  if (*(void *)(v70 + 16) > v32)
  {
    uint64_t v71 = v70 + 72 * v32;
    v162[0] = *(_OWORD *)(v71 + 32);
    long long v72 = *(_OWORD *)(v71 + 48);
    long long v73 = *(_OWORD *)(v71 + 64);
    long long v74 = *(_OWORD *)(v71 + 80);
    uint64_t v163 = *(void *)(v71 + 96);
    v162[2] = v73;
    v162[3] = v74;
    v162[1] = v72;
    sub_24EEA2830((uint64_t)v162);
    swift_bridgeObjectRelease();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v75 = (uint64_t *)&v67[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors];
    swift_beginAccess();
    uint64_t v76 = *v75;
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v77 = sub_24EEA7FB4((uint64_t *)v162, v76);
    char v79 = v78;
    swift_bridgeObjectRelease();
    sub_24EEA2888((uint64_t)v162);
    if ((v79 & 1) == 0)
    {
      Swift::Int v143 = v77;
      uint64_t v80 = v61;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v81 = v69 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
      swift_beginAccess();
      uint64_t v82 = MEMORY[0x25334FB00](v81);
      uint64_t v83 = *(void *)(v81 + 8);
      swift_release();
      uint64_t v61 = v80;
      Swift::Int v84 = v143;
      if (v82)
      {
        uint64_t v85 = swift_getObjectType();
        (*(void (**)(uint64_t, _UNKNOWN **, Swift::Int, uint64_t, uint64_t))(v83 + 24))(v69, &protocol witness table for FloatingTabBarContentView, v84, v85, v83);
        swift_unknownObjectRelease();
      }
    }
LABEL_62:
    if (v140)
    {
      unint64_t v86 = *(void (**)(char *, uint64_t))(v34 + 8);
      v86(v132, v138);
      sub_24EE97C84((uint64_t)&v153);
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v87 = v69 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
      swift_beginAccess();
      uint64_t v88 = MEMORY[0x25334FB00](v87);
      uint64_t v89 = *(void *)(v87 + 8);
      swift_release();
      if (v88)
      {
        uint64_t v90 = swift_getObjectType();
        v91 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v89 + 8))(v90, v89);
        swift_unknownObjectRelease();
        objc_msgSend(v91, sel_layoutIfNeeded);
      }
      v92 = self;
      id v149 = sub_24EEB4B64;
      uint64_t v150 = v61;
      uint64_t v145 = MEMORY[0x263EF8330];
      uint64_t v146 = 1107296256;
      id v147 = sub_24EEB1640;
      id v148 = &block_descriptor_1;
      v93 = _Block_copy(&v145);
      swift_retain();
      swift_release();
      id v149 = sub_24EEB4C04;
      uint64_t v150 = v133;
      uint64_t v145 = MEMORY[0x263EF8330];
      uint64_t v146 = 1107296256;
      id v147 = sub_24EEB26A0;
      id v148 = &block_descriptor_6;
      id v94 = _Block_copy(&v145);
      swift_retain();
      swift_release();
      objc_msgSend(v92, sel__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_, 0, v93, v94, 0.9, 0.3, 0.08, 0.08, 0.08, 0.0);
      _Block_release(v94);
      _Block_release(v93);

      swift_release();
      swift_release();
      v86(v137, v138);
    }
    else
    {
      v123 = v142;
      uint64_t v124 = (uint64_t)v132;
      sub_24EEB2198(v69, v142, (uint64_t)v132, &v153);

      swift_release();
      swift_release();
      sub_24EE97C84((uint64_t)&v153);
      uint64_t v125 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      uint64_t v126 = v124;
      uint64_t v127 = v138;
      v125(v126, v138);
      v125((uint64_t)v137, v127);
    }
    goto LABEL_97;
  }
LABEL_109:
  __break(1u);
}

uint64_t sub_24EEACF8C(uint64_t a1, uint64_t a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(unsigned char *)(a2 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating) = 0;
  swift_release();
  return swift_release();
}

uint64_t sub_24EEAD08C@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v25 = a2[1];
  uint64_t v26 = *a2;
  uint64_t v23 = a2[3];
  uint64_t v24 = a2[2];
  char v22 = *((unsigned char *)a2 + 33);
  int v7 = *((unsigned __int8 *)a2 + 34);
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[8];
  uint64_t v20 = a2[7];
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v7 == 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = v8;
  }
  else
  {
    if (v7 == 2)
    {
      uint64_t v11 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v11 = v8;
      swift_bridgeObjectRetain();
    }
    uint64_t v12 = v20;
    uint64_t v13 = v10;
  }
  uint64_t result = swift_bridgeObjectRetain();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a3 + 16) > a1)
  {
    uint64_t v15 = a3 + (a1 << 6);
    long long v19 = *(_OWORD *)(v15 + 48);
    long long v21 = *(_OWORD *)(v15 + 32);
    long long v18 = *(_OWORD *)(v15 + 64);
    uint64_t v16 = *(void *)(v15 + 80);
    uint64_t v17 = *(void *)(v15 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_release();
    *(void *)a4 = v26;
    *(void *)(a4 + 8) = v25;
    *(void *)(a4 + 16) = v24;
    *(void *)(a4 + 24) = v23;
    *(unsigned char *)(a4 + 32) = v22;
    *(_OWORD *)(a4 + 40) = v21;
    *(_OWORD *)(a4 + 56) = v19;
    *(_OWORD *)(a4 + 72) = v18;
    *(void *)(a4 + 88) = v16;
    *(void *)(a4 + 96) = v17;
    *(void *)(a4 + 104) = v11;
    *(void *)(a4 + 112) = v9;
    *(void *)(a4 + 120) = v12;
    *(void *)(a4 + 128) = v13;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24EEAD248(uint64_t a1, uint64_t a2, char a3, char *a4, char a5, char a6)
{
  int v7 = v6;
  char v58 = *a4;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = &v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors];
  swift_beginAccess();
  *(void *)uint64_t v9 = a1;
  swift_release();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_bounds);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long long v18 = &v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider];
  uint64_t v19 = *(void *)&v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider + 24];
  uint64_t v20 = *(void *)&v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider + 32];
  __swift_project_boxed_opaque_existential_1(&v6[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider], v19);
  uint64_t v21 = swift_bridgeObjectRetain();
  uint64_t v22 = sub_24EEC1FE0(v21);
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v6, sel_traitCollection);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, double, double, double, double))(v20 + 16))(v22, v23, v19, v20, v11, v13, v15, v17);
  swift_bridgeObjectRelease();

  uint64_t v25 = *((void *)v18 + 3);
  uint64_t v26 = *((void *)v18 + 4);
  __swift_project_boxed_opaque_existential_1(v18, v25);
  uint64_t v62 = v24;
  uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 24))(a1, v24, v25, v26);
  uint64_t v28 = *((void *)v18 + 3);
  uint64_t v29 = *((void *)v18 + 4);
  __swift_project_boxed_opaque_existential_1(v18, v28);
  id v30 = objc_msgSend(v6, sel_traitCollection);
  double v31 = (*(double (**)(uint64_t, id, uint64_t, uint64_t))(v29 + 32))(v27, v30, v28, v29);

  swift_bridgeObjectRelease();
  uint64_t v32 = MEMORY[0x263F8EE78];
  uint64_t v71 = MEMORY[0x263F8EE78];
  uint64_t v33 = *(void *)(a1 + 16);
  if (v33)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v69 = v32;
      uint64_t v35 = *(v34 - 1);
      uint64_t v36 = v34[1];
      uint64_t v63 = *v34;
      uint64_t v64 = *(v34 - 2);
      char v37 = *((unsigned char *)v34 + 16);
      char v67 = *((unsigned char *)v34 + 18);
      char v68 = *((unsigned char *)v34 + 17);
      uint64_t v38 = v34[4];
      uint64_t v39 = v34[6];
      uint64_t v65 = v34[5];
      uint64_t v66 = v34[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      if (v37)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v32 = v69;
      }
      else
      {
        uint64_t v32 = v69;
        uint64_t v71 = v69;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24EEB2CF0(0, *(void *)(v69 + 16) + 1, 1);
          uint64_t v32 = v71;
        }
        unint64_t v41 = *(void *)(v32 + 16);
        unint64_t v40 = *(void *)(v32 + 24);
        if (v41 >= v40 >> 1)
        {
          sub_24EEB2CF0(v40 > 1, v41 + 1, 1);
          uint64_t v32 = v71;
        }
        *(void *)(v32 + 16) = v41 + 1;
        uint64_t v42 = v32 + 72 * v41;
        *(void *)(v42 + 32) = v64;
        *(void *)(v42 + 40) = v35;
        *(void *)(v42 + 48) = v63;
        *(void *)(v42 + 56) = v36;
        *(unsigned char *)(v42 + 64) = 0;
        *(unsigned char *)(v42 + 65) = v68;
        *(unsigned char *)(v42 + 66) = v67;
        *(void *)(v42 + 72) = v66;
        *(void *)(v42 + 80) = v38;
        *(void *)(v42 + 88) = v65;
        *(void *)(v42 + 96) = v39;
      }
      v34 += 9;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    int v7 = v6;
  }
  uint64_t v43 = *((void *)v18 + 3);
  uint64_t v44 = *((void *)v18 + 4);
  __swift_project_boxed_opaque_existential_1(v18, v43);
  id v45 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 24))(v32, v62, v43, v44);
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_bounds);
  double Width = CGRectGetWidth(v72);
  if (v31 <= Width)
  {
    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_24EEDD3A0();
    __swift_project_value_buffer(v53, (uint64_t)qword_26B1E80B0);
    uint64_t v54 = sub_24EEDD380();
    os_log_type_t v55 = sub_24EEDDA90();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v70 = v32;
      uint64_t v56 = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 134218240;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v71 = *(void *)&Width;
      sub_24EEDDB50();
      *(_WORD *)(v56 + 12) = 2048;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v71 = *(void *)&v31;
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v54, v55, "[FloatingTabBarContentView] Bounds width (%f) fits minimum width (%f). Applying items", (uint8_t *)v56, 0x16u);
      MEMORY[0x25334FA20](v56, -1, -1);
      uint64_t v32 = v70;
    }

    LOBYTE(v71) = v58;
    sub_24EEAA660(v32, a2, a3 & 1, v45, (char *)&v71, a5 & 1, a6 & 1, v11, v13, v15, v17);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_24EEDD3A0();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B1E80B0);
    uint64_t v48 = sub_24EEDD380();
    os_log_type_t v49 = sub_24EEDDA70();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v50 = 134218240;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v71 = *(void *)&Width;
      sub_24EEDDB50();
      *(_WORD *)(v50 + 12) = 2048;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v71 = *(void *)&v31;
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v48, v49, "[FloatingTabBarContentView] Bounds width (%f) does not fit minimum width (%f)", (uint8_t *)v50, 0x16u);
      MEMORY[0x25334FA20](v50, -1, -1);
    }

    sub_24EEA27DC();
    swift_allocError();
    *char v51 = 2;
    swift_willThrow();
    return swift_release();
  }
}

uint64_t sub_24EEADB70@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v12 = *(void **)(v5 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
  objc_msgSend(a1, sel_locationInView_, *(void *)(v6 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView));
  double v14 = v13;
  objc_msgSend(v12, sel_bounds);
  double MidY = CGRectGetMidY(v52);
  objc_msgSend(v12, sel_bounds);
  v51.x = v14;
  v51.y = MidY;
  if (!CGRectContainsPoint(v53, v51)) {
    goto LABEL_13;
  }
  if (a2)
  {
    int v47 = a4;
    uint64_t v45 = a3;
    uint64_t v16 = sub_24EEDD2E0();
    uint64_t v50 = &v43;
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(void *)(v17 + 64);
    MEMORY[0x270FA5388](v16);
    unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v48 = (uint64_t)&v43 - v19;
    id v20 = objc_msgSend(v12, sel_indexPathForItemAtPoint_, v14, MidY);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
    uint64_t v22 = *(void *)(*(void *)(v21 - 8) + 64);
    double v24 = MEMORY[0x270FA5388](v21 - 8);
    uint64_t v49 = v25;
    if (v20)
    {
      uint64_t v46 = a5;
      MEMORY[0x270FA5388](v23);
      uint64_t v26 = (char *)&v43 - v19;
      sub_24EEDD2A0();

      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
      v27((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v16);
      uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      v44((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v16);
      a5 = v46;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v16) != 1)
      {
        uint64_t v28 = ((uint64_t (*)(uint64_t, char *, uint64_t))v27)(v48, (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
        double v29 = MEMORY[0x270FA5388](v28);
        id v30 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
        double v31 = v44;
        if (v47)
        {
          uint64_t v32 = 1;
        }
        else
        {
          MEMORY[0x25334E6A0](v45, 0, v29);
          uint64_t v32 = 0;
        }
        v31(v30, v32, 1, v16);
        uint64_t v41 = a5;
        uint64_t v42 = v48;
        sub_24EEAE0C4(v48, (uint64_t)v30, v41, v14);
        sub_24EEA54B8((uint64_t)v30, &qword_26B1E7368);
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v42, v16);
        return swift_release();
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v17 + 56))((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v16, v24);
    }
    sub_24EEA54B8((uint64_t)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26B1E7368);
LABEL_13:
    uint64_t v38 = sub_24EEDD2E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(a5, 1, 1, v38);
    return swift_release();
  }
  id v33 = objc_msgSend(v12, sel_indexPathForItemAtPoint_, v14, MidY);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  MEMORY[0x270FA5388](v34 - 8);
  uint64_t v36 = (char *)&v43 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v33)
  {
    sub_24EEDD2A0();

    uint64_t v37 = sub_24EEDD2E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v36, 0, 1, v37);
  }
  else
  {
    uint64_t v40 = sub_24EEDD2E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v36, 1, 1, v40);
  }
  sub_24EEB4FB0((uint64_t)v36, a5);
  return swift_release();
}

unint64_t sub_24EEAE0C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  long long v73 = (uint64_t *)a2;
  uint64_t v75 = a3;
  sub_24EEDD9B0();
  uint64_t v77 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7588);
  uint64_t v76 = &v64;
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v74 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E7590);
  MEMORY[0x270FA5388](v10 - 8);
  double v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v13 = *(void **)((char *)v4 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource);
  id v14 = v13;
  swift_release();
  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v12, 1, 1, v7);
    goto LABEL_12;
  }
  sub_24EEDD470();

  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7) == 1)
  {
LABEL_12:
    sub_24EEA54B8((uint64_t)v12, (uint64_t *)&unk_26B1E7590);
    uint64_t v21 = sub_24EEDD2E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v75, 1, 1, v21);
    return swift_release();
  }
  double v15 = v74;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v74, v12, v7);
  uint64_t v78 = sub_24EEDD2D0();
  uint64_t v16 = sub_24EEDD400();
  unint64_t result = sub_24EEDD2C0();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (result >= *(void *)(v16 + 16))
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (*(unsigned char *)(v16 + 72 * result + 65))
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_24EEDD2E0();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = v75;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v75, a1, v18);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
    return swift_release();
  }
  uint64_t v69 = v4;
  uint64_t v22 = sub_24EEDD2E0();
  char v68 = &v64;
  uint64_t v72 = v22;
  uint64_t v70 = *(void *)(v22 - 8);
  uint64_t v23 = *(void *)(v70 + 64);
  MEMORY[0x270FA5388](v22);
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t result = sub_24EEDD2C0();
  unint64_t v25 = result - 1;
  if (__OFSUB__(result, 1)) {
    goto LABEL_45;
  }
  uint64_t v26 = sub_24EEDD2D0();
  uint64_t v71 = (char *)&v64 - v24;
  uint64_t v27 = MEMORY[0x25334E6A0](v25, v26);
  uint64_t v66 = &v64;
  uint64_t v67 = v23;
  MEMORY[0x270FA5388](v27);
  uint64_t v28 = (char *)&v64 - v24;
  unint64_t result = sub_24EEDD2C0();
  unint64_t v29 = result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_46:
    __break(1u);
    return result;
  }
  uint64_t v30 = sub_24EEDD2D0();
  MEMORY[0x25334E6A0](v29, v30);
  uint64_t v64 = sub_24EEDD2C0();
  uint64_t v31 = v72;
  uint64_t v32 = v69;
  if (v64 < 1)
  {
    double v37 = 0.0;
  }
  else
  {
    uint64_t v65 = v28;
    id v33 = *(void **)((char *)v69 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
    uint64_t v34 = (void *)sub_24EEDD290();
    id v35 = objc_msgSend(v33, (SEL)0x1F74D9494, v34);

    if (v35)
    {
      objc_msgSend(v35, sel_frame);
      double MaxX = CGRectGetMaxX(v79);
    }
    else
    {
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      double MaxX = 0.0;
    }
    uint64_t v28 = v65;
    double v37 = MaxX - a4;
    uint64_t v31 = v72;
  }
  uint64_t v38 = sub_24EEDD2C0();
  uint64_t v39 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  uint64_t v40 = v71;
  uint64_t v41 = v67;
  if (v38 >= v39 - 1) {
    goto LABEL_35;
  }
  uint64_t v42 = *(void **)((char *)v32 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
  uint64_t v43 = (void *)sub_24EEDD290();
  id v44 = objc_msgSend(v42, sel_cellForItemAtIndexPath_, v43);

  if (v44)
  {
    objc_msgSend(v44, sel_frame);
    double MinX = CGRectGetMinX(v80);
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    double MinX = 0.0;
  }
  if (v64 < 1)
  {
LABEL_35:
    uint64_t v57 = v70;
    char v58 = *(void (**)(char *, uint64_t))(v70 + 8);
    v58(v28, v31);
    v58(v40, v31);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v74, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v75, 1, 1, v31);
  }
  else
  {
    double v46 = MinX - a4;
    if (v37 == v46)
    {
      uint64_t v65 = v28;
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
      uint64_t v69 = &v64;
      MEMORY[0x270FA5388](v47 - 8);
      uint64_t v49 = (char *)&v64 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v50 = sub_24EEB4F48((uint64_t)v73, (uint64_t)v49);
      long long v73 = &v64;
      double v51 = MEMORY[0x270FA5388](v50);
      CGRect v52 = (char *)&v64 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v53 = v70;
      (*(void (**)(char *, char *, uint64_t, double))(v70 + 16))(v52, v40, v31, v51);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v49, 1, v31) == 1)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v53 = v70;
        uint64_t v54 = *(void (**)(char *, uint64_t))(v70 + 8);
        uint64_t v55 = v72;
        v54(v65, v72);
        v54(v71, v55);
        uint64_t v31 = v55;
        (*(void (**)(char *, uint64_t))(v8 + 8))(v74, v7);
        uint64_t v56 = v75;
        (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v75, v52, v55);
        swift_release();
        sub_24EEA54B8((uint64_t)v49, &qword_26B1E7368);
      }
      else
      {
        uint64_t v63 = *(void (**)(char *, uint64_t))(v53 + 8);
        v63(v52, v31);
        v63(v65, v31);
        v63(v40, v31);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v74, v7);
        uint64_t v56 = v75;
        (*(void (**)(uint64_t, char *, uint64_t))(v53 + 32))(v75, v49, v31);
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v56, 0, 1, v31);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v74, v7);
      id v59 = *(void (**)(char *, uint64_t))(v70 + 8);
      uint64_t v60 = (void (**)(uint64_t, char *, uint64_t))(v70 + 32);
      uint64_t v61 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v70 + 56);
      if (v46 >= v37)
      {
        v59(v28, v31);
        uint64_t v62 = v75;
        (*v60)(v75, v40, v31);
      }
      else
      {
        v59(v40, v31);
        uint64_t v62 = v75;
        (*v60)(v75, v28, v31);
      }
      (*v61)(v62, 0, 1, v31);
    }
  }
  return swift_release();
}

uint64_t sub_24EEAEB68(uint64_t a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = sub_24EEDD2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x25334E6A0](a1, 0);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource);
  id v8 = v7;
  swift_release();
  if (!v7) {
    goto LABEL_13;
  }
  sub_24EEDD450();

  if (!*((void *)&v24 + 1)) {
    goto LABEL_13;
  }
  sub_24EEB49F4(v24, *((uint64_t *)&v24 + 1));
  unint64_t v9 = sub_24EEDD2C0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v9 < *(void *)(v10 + 16))
  {
    uint64_t v12 = v10 + 136 * v9;
    long long v24 = *(_OWORD *)(v12 + 32);
    long long v13 = *(_OWORD *)(v12 + 48);
    long long v14 = *(_OWORD *)(v12 + 64);
    long long v15 = *(_OWORD *)(v12 + 96);
    long long v27 = *(_OWORD *)(v12 + 80);
    long long v28 = v15;
    long long v25 = v13;
    long long v26 = v14;
    long long v16 = *(_OWORD *)(v12 + 112);
    long long v17 = *(_OWORD *)(v12 + 128);
    long long v18 = *(_OWORD *)(v12 + 144);
    uint64_t v32 = *(void *)(v12 + 160);
    long long v30 = v17;
    long long v31 = v18;
    long long v29 = v16;
    sub_24EE97C2C((uint64_t)&v24);
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
    uint64_t v20 = (void *)sub_24EEDD290();
    id v21 = objc_msgSend(v19, sel_cellForItemAtIndexPath_, v20);

    if (!v21)
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      sub_24EE97C84((uint64_t)&v24);
      return swift_release();
    }
    v22[6] = v30;
    v22[7] = v31;
    uint64_t v23 = v32;
    v22[2] = v26;
    v22[3] = v27;
    v22[4] = v28;
    v22[5] = v29;
    v22[0] = v24;
    v22[1] = v25;
    sub_24EEAF370(v21, (uint64_t)v6, v22);
    sub_24EE97C84((uint64_t)&v24);
    objc_msgSend(v21, sel_setSelected_, 1);

LABEL_13:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return swift_release();
  }
  __break(1u);
  return result;
}

void sub_24EEAEEF8(uint64_t a1, char a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  int v33 = a4;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex);
  swift_beginAccess();
  uint64_t v10 = *v9;
  char v11 = *((unsigned char *)v9 + 8);
  swift_release();
  if (v11)
  {
    if (a2) {
      goto LABEL_23;
    }
  }
  else
  {
    if ((a2 & 1) == 0 && v10 == a1) {
      goto LABEL_23;
    }
    if ((v33 & 1) != 0 || v10 != a3)
    {
      id v31 = *(id *)(v4 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
      uint64_t v13 = sub_24EEDD2E0();
      uint64_t v30 = (uint64_t)&v30;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v32 = a3;
      uint64_t v15 = v14;
      double v16 = MEMORY[0x270FA5388](v13);
      long long v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x25334E6A0](v10, 0, v16);
      uint64_t v19 = (void *)sub_24EEDD290();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
      a3 = v32;
      id v20 = objc_msgSend(v31, sel_cellForItemAtIndexPath_, v19, v30);

      if (v20)
      {
        objc_msgSend(v20, sel_setSelected_, 0);
        objc_msgSend(v20, sel_setHighlighted_, 0);
      }
    }
    else
    {
      uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView);
      v34.a = 1.0;
      v34.b = 0.0;
      v34.c = 0.0;
      v34.d = 1.0;
      v34.tx = 0.0;
      v34.ty = 0.0;
      objc_msgSend(v12, sel_setTransform_, &v34);
    }
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *unint64_t v9 = a1;
  *((unsigned char *)v9 + 8) = a2 & 1;
  swift_release();
  if ((a2 & 1) == 0)
  {
    if ((v33 & 1) != 0 || a1 != a3)
    {
      uint64_t v22 = *(void **)(v5 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView);
      uint64_t v23 = sub_24EEDD2E0();
      uint64_t v24 = *(void *)(v23 - 8);
      double v25 = MEMORY[0x270FA5388](v23);
      long long v27 = (char *)&v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x25334E6A0](a1, 0, v25);
      long long v28 = (void *)sub_24EEDD290();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
      id v29 = objc_msgSend(v22, sel_cellForItemAtIndexPath_, v28);

      if (v29)
      {
        objc_msgSend(v29, sel_setHighlighted_, 1);
        swift_release();

        return;
      }
    }
    else
    {
      id v21 = *(void **)(v5 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView);
      CGAffineTransformMakeScale(&v34, 0.95, 0.95);
      objc_msgSend(v21, sel_setTransform_, &v34);
    }
  }
LABEL_23:
  swift_release();
}

void sub_24EEAF370(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3[7];
  uint64_t v6 = a3[8];
  uint64_t v7 = a3[9];
  uint64_t v8 = a3[10];
  uint64_t v9 = a3[11];
  uint64_t v10 = a3[12];
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = (objc_class *)objc_msgSend(v3, sel_traitCollection);
  v51[1] = v5;
  v51[2] = v6;
  v51[3] = v7;
  v51[4] = v8;
  v51[5] = v9;
  v51[6] = v10;
  if (qword_26B1E7380 != -1) {
    swift_once();
  }
  v51[0] = qword_26B1E7378;
  v11.value.super.isa = v12;
  *(void *)&double v13 = *(_OWORD *)&TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)v51, v11);

  objc_msgSend(a1, sel_frame);
  CGFloat Height = CGRectGetHeight(v52);
  uint64_t v15 = *(void **)&v3[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView];
  objc_msgSend(v15, sel_setFrame_, 0.0, 0.0, v13, Height);
  if (sub_24EEDD2C0())
  {
    uint64_t v16 = sub_24EEDD2C0();
    uint64_t v17 = *(void **)&v3[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
    long long v18 = (char *)objc_msgSend(v17, sel_numberOfItemsInSection_, sub_24EEDD2D0());
    uint64_t v19 = v18 - 1;
    if (__OFSUB__(v18, 1))
    {
      __break(1u);
      return;
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((char *)v16 != v19)
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v38 = objc_msgSend(v17, sel_effectiveUserInterfaceLayoutDirection);
      id v39 = objc_msgSend(v17, sel_collectionViewLayout);
      id v40 = objc_msgSend(v39, sel_developmentLayoutDirection);
      swift_release();

      if (v38 == v40)
      {
        objc_msgSend(a1, sel_center);
        double v37 = v42;
      }
      else
      {
        objc_msgSend(v17, (SEL)&selRef_setEnabled_);
        double MaxX = CGRectGetMaxX(v57);
        objc_msgSend(a1, (SEL)&selRef_setEnabled_);
        double v45 = MaxX - v44;
        objc_msgSend(a1, (SEL)&selRef_setEnabled_);
        double v37 = v45 + CGRectGetWidth(v58) * -0.5;
        objc_msgSend(a1, sel_center);
      }
      double v35 = v41;
      goto LABEL_25;
    }
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v21 = objc_msgSend(v17, sel_effectiveUserInterfaceLayoutDirection);
    id v22 = objc_msgSend(v17, sel_collectionViewLayout);
    id v23 = objc_msgSend(v22, sel_developmentLayoutDirection);
    swift_release();

    double v24 = 0.0;
    if (v21 == v23)
    {
      objc_msgSend(a1, (SEL)&selRef_setEnabled_);
      double v25 = CGRectGetMaxX(v53);
      objc_msgSend(v15, (SEL)&selRef_setEnabled_);
      double v24 = v25 - CGRectGetWidth(v54);
    }
    objc_msgSend(v15, (SEL)&selRef_setEnabled_);
    objc_msgSend(v15, sel_setFrame_, v24);
    objc_msgSend(a1, sel_center);
  }
  else
  {
    long long v27 = *(void **)&v3[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v28 = objc_msgSend(v27, sel_effectiveUserInterfaceLayoutDirection);
    id v29 = objc_msgSend(v27, sel_collectionViewLayout);
    id v30 = objc_msgSend(v29, sel_developmentLayoutDirection);
    swift_release();

    double v31 = 0.0;
    if (v28 != v30)
    {
      objc_msgSend(v27, sel_frame);
      double v32 = CGRectGetMaxX(v55);
      objc_msgSend(a1, sel_frame);
      double v34 = v32 - v33;
      objc_msgSend(v15, sel_frame);
      double v31 = v34 - CGRectGetWidth(v56);
    }
    objc_msgSend(v15, sel_frame);
    objc_msgSend(v15, sel_setFrame_, v31);
    objc_msgSend(a1, sel_center);
  }
  double v35 = v26;
  objc_msgSend(v15, sel_center);
  double v37 = v36;
LABEL_25:
  objc_msgSend(v15, sel_setCenter_, v37, v35);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v46 = &v3[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate];
  swift_beginAccess();
  uint64_t v47 = MEMORY[0x25334FB00](v46);
  uint64_t v48 = *((void *)v46 + 1);
  swift_release();
  if (v47)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v50 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(ObjectType, v48);
    swift_unknownObjectRelease();
    objc_msgSend(v50, sel_setNeedsLayout);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24EEAF96C(uint64_t a1, char *a2, int a3)
{
  int v40 = a3;
  char v4 = *a2;
  sub_24EEDD9B0();
  uint64_t v41 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v44 = sub_24EEA81B8(v5);
  swift_bridgeObjectRelease();
  double v42 = &v39;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7588);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v45 + 64);
  MEMORY[0x270FA5388](v6);
  id v39 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E7590);
  uint64_t v43 = &v39;
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD9A0();
  sub_24EEDD990();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v4)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v12 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource;
    double v13 = *(void **)(v46 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource);
    id v14 = v13;
    swift_release();
    uint64_t v15 = v45;
    if (v13)
    {
      sub_24EEDD470();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v6) != 1)
      {
        uint64_t v16 = v39;
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v39, v10, v6);
        uint64_t v47 = 0;
        sub_24EEDD3F0();
        if ((v17 & 1) == 0)
        {
          sub_24EEDD420();
          swift_bridgeObjectRelease();
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          long long v18 = *(void **)(v46 + v12);
          id v19 = v18;
          swift_release();
          if (v18)
          {
            sub_24EEDD460();
            swift_release();
          }
          else
          {
            swift_release();
          }
          (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v6);
          return swift_release();
        }
        (*(void (**)(char *, uint64_t))(v15 + 8))(v16, v6);
        swift_bridgeObjectRelease();
LABEL_28:
        LOBYTE(v47) = 0;
        sub_24EEAF96C(a1, &v47, v40 & 1);
        return swift_release();
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v10, 1, 1, v6);
    }
    swift_bridgeObjectRelease();
    sub_24EEA54B8((uint64_t)v10, (uint64_t *)&unk_26B1E7590);
    goto LABEL_28;
  }
  if ((isCurrentExecutor & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v20 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource;
  id v21 = *(void **)(v46 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource);
  id v22 = v21;
  swift_release();
  if (!v21)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v10, 1, 1, v6);
    goto LABEL_30;
  }
  sub_24EEDD470();

  uint64_t v23 = v45;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v10, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v10, 1, v6) == 1)
  {
LABEL_30:
    uint64_t v33 = sub_24EEA54B8((uint64_t)v10, (uint64_t *)&unk_26B1E7590);
    goto LABEL_31;
  }
  double v24 = v39;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v39, v10, v6);
  uint64_t v47 = 0;
  uint64_t v25 = sub_24EEDD3F0();
  if ((v26 & 1) == 0)
  {
    MEMORY[0x270FA5388](v25);
    long long v27 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24EEB4EF4();
    sub_24EEDD430();
    sub_24EEDD3E0();
    uint64_t v47 = 0;
    char v48 = 1;
    uint64_t v28 = v44;
    sub_24EEDD3D0();
    uint64_t v29 = sub_24EEDD410();
    sub_24EEB43AC(v28, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24EEDD420();
    swift_bridgeObjectRelease();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v30 = *(void **)(v46 + v20);
    id v31 = v30;
    swift_release();
    if (v30)
    {
      sub_24EEDD460();
      swift_release();
    }
    else
    {
      swift_release();
    }
    double v37 = v39;
    id v38 = *(void (**)(char *, uint64_t))(v45 + 8);
    v38(v27, v6);
    v38(v37, v6);
    return swift_release();
  }
  uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v24, v6);
LABEL_31:
  MEMORY[0x270FA5388](v33);
  double v34 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEB4EF4();
  sub_24EEDD430();
  sub_24EEDD3E0();
  uint64_t v47 = 0;
  char v48 = 1;
  sub_24EEDD3D0();
  swift_bridgeObjectRelease();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v35 = *(void **)(v46 + v20);
  id v36 = v35;
  swift_release();
  if (v35)
  {
    sub_24EEDD460();
    swift_release();
  }
  else
  {
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v6);
  return swift_release();
}

uint64_t sub_24EEB0300(void *a1, objc_class *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v7 = v6;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  uint64_t v14 = sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v16 = a1[2];
  if (v16 < 2)
  {
    if (v16)
    {
      uint64_t v24 = a1[4];
      uint64_t v25 = a1[5];
      uint64_t v26 = a1[6];
      uint64_t v27 = a1[7];
      uint64_t v28 = a1[8];
      uint64_t v29 = a1[9];
      v33[1] = v24;
      v33[2] = v25;
      v33[3] = v26;
      v33[4] = v27;
      v33[5] = v28;
      v33[6] = v29;
      if (qword_26B1E7380 != -1) {
        swift_once();
      }
      v33[0] = qword_26B1E7378;
      v15.value.super.isa = a2;
      CGSize v30 = TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)v33, v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E76F8);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_24EEDFB10;
      *(CGSize *)(v14 + 32) = v30;
      *(void *)(v14 + 48) = v24;
      *(void *)(v14 + 56) = v25;
      *(void *)(v14 + 64) = v26;
      *(void *)(v14 + 72) = v27;
      *(void *)(v14 + 80) = v28;
      *(void *)(v14 + 88) = v29;
      swift_release();
    }
    else
    {
      sub_24EEA27DC();
      swift_allocError();
      *id v31 = 1;
      swift_willThrow();
      swift_release();
    }
  }
  else
  {
    char v17 = (void *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider);
    uint64_t v18 = *(void *)(v7 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider + 24);
    uint64_t v19 = v17[4];
    __swift_project_boxed_opaque_existential_1(v17, v18);
    (*(void (**)(void *, objc_class *, uint64_t, uint64_t))(v19 + 32))(a1, a2, v18, v19);
    v34.origin.x = a3;
    v34.origin.y = a4;
    v34.size.width = a5;
    v34.size.height = a6;
    CGRectGetWidth(v34);
    MEMORY[0x270FA5388](v20);
    uint64_t v21 = swift_bridgeObjectRetain();
    sub_24EEB3F60(v21, (double (*)(uint64_t, _OWORD *))sub_24EEB4EDC);
    uint64_t v22 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v22);
    uint64_t v23 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_24EEB4094(v23, (void (*)(long long *__return_ptr, uint64_t, _OWORD *))sub_24EEB4EE8);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v14;
}

uint64_t sub_24EEB0630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  unint64_t v6 = *(void *)(a3 + 16);
  if (!a1) {
    return swift_release();
  }
  unint64_t v7 = a1 - 1;
  BOOL v8 = __OFSUB__(a1, 1);
  if (v6 - 1 == a1)
  {
    if (v8)
    {
      __break(1u);
    }
    else if (v7 < v6)
    {
      return swift_release();
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v8)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v7 >= v6)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (__OFADD__(a1, 1))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (a1 + 1 < v6) {
    return swift_release();
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_24EEB07E0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  double v9 = *(double *)a2;
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v12 = *(void *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v14 = *(void *)(a2 + 40);
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a3 + 16) > a1)
  {
    double v16 = *(double *)(a3 + 8 * a1 + 32);
    uint64_t result = swift_release();
    *(double *)a4 = v9 + v16;
    *(double *)(a4 + 8) = a5;
    *(double *)(a4 + 16) = v9;
    *(void *)(a4 + 24) = v10;
    *(void *)(a4 + 32) = v11;
    *(void *)(a4 + 40) = v12;
    *(void *)(a4 + 48) = v13;
    *(void *)(a4 + 56) = v14;
    return result;
  }
  __break(1u);
  return result;
}

void sub_24EEB08DC(void *a1)
{
  uint64_t v2 = v1;
  sub_24EEDD9B0();
  uint64_t v48 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v49 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture;
  char v7 = v1[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture];
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v8 = &v1[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
  swift_beginAccess();
  uint64_t v9 = *(void *)v8;
  int v10 = v8[8];
  swift_release();
  sub_24EEADB70(a1, v7, v9, v10, (uint64_t)v6);
  uint64_t v11 = sub_24EEDD2E0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_24EEA54B8((uint64_t)v6, &qword_26B1E7368);
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v13 = *(void **)v8;
    char v14 = v8[8];
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v13 = (void *)sub_24EEDD2C0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
    char v14 = 0;
  }
  id v15 = objc_msgSend(a1, sel_state, v48);
  if (v15 != (id)3)
  {
    char v16 = v14;
    char v17 = v13;
    if (v15 != (id)2)
    {
      if (v15 == (id)1)
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        char isCurrentExecutor = swift_task_isCurrentExecutor();
        if (v14)
        {
          if (isCurrentExecutor)
          {
            char v19 = 0;
            char v16 = 1;
          }
          else
          {
            char v16 = 1;
            swift_task_reportUnexpectedExecutor();
            char v19 = 0;
          }
        }
        else
        {
          if ((isCurrentExecutor & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          uint64_t v20 = &v1[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
          swift_beginAccess();
          uint64_t v21 = *(void **)v20;
          LOBYTE(v20) = v20[8];
          swift_release();
          char v19 = (v13 == v21) & ~(_BYTE)v20;
          sub_24EEDD9A0();
          sub_24EEDD990();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          char v16 = 0;
        }
        char v17 = v13;
      }
      else
      {
        sub_24EEDD9A0();
        sub_24EEDD990();
        if (swift_task_isCurrentExecutor())
        {
          char v17 = 0;
          char v19 = 1;
        }
        else
        {
          char v19 = 1;
          swift_task_reportUnexpectedExecutor();
          char v17 = 0;
        }
        char v16 = 1;
      }
      v1[v49] = v19;
      swift_release();
    }
    goto LABEL_46;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v1[v49] = 0;
  swift_release();
  if (v14)
  {
    char v17 = 0;
    char v16 = 1;
LABEL_46:
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    char v30 = v1[v49];
    swift_release();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v2;
    *(void *)(v31 + 24) = v17;
    if (v16 & 1 | ((v30 & 1) == 0))
    {
      *(unsigned char *)(v31 + 32) = v16;
      double v32 = self;
      CGRect v56 = sub_24EEB4E88;
      uint64_t v57 = v31;
      id aBlock = (id)MEMORY[0x263EF8330];
      uint64_t v53 = 1107296256;
      uint64_t v33 = &block_descriptor_49;
    }
    else
    {
      *(void *)(v31 + 32) = v13;
      *(unsigned char *)(v31 + 40) = v14;
      double v32 = self;
      CGRect v56 = sub_24EEB4ECC;
      uint64_t v57 = v31;
      id aBlock = (id)MEMORY[0x263EF8330];
      uint64_t v53 = 1107296256;
      uint64_t v33 = &block_descriptor_55;
    }
    CGRect v54 = sub_24EEB1640;
    CGRect v55 = v33;
    CGRect v34 = _Block_copy(&aBlock);
    id v35 = v2;
    swift_retain();
    swift_release();
    objc_msgSend(v32, sel__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_, 0, v34, 0, 0.9, 0.3, 0.08, 0.08, 0.08, 0.0);
    _Block_release(v34);
    swift_release();
    goto LABEL_52;
  }
  FloatingTabBarContentView.selectItem(at:animated:shouldNotifyDelegate:)((Swift::Int)v13, 1, 1);
  if (!v22)
  {
LABEL_52:
    swift_release();
    return;
  }
  id aBlock = v22;
  id v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269978760);
  if (swift_dynamicCast())
  {
    if (v51 == 4)
    {

      if (qword_26B1E7568 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_24EEDD3A0();
      __swift_project_value_buffer(v46, (uint64_t)qword_26B1E80B0);
      uint64_t v25 = sub_24EEDD380();
      os_log_type_t v47 = sub_24EEDDA90();
      if (!os_log_type_enabled(v25, v47)) {
        goto LABEL_70;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134217984;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v50 = v13;
      sub_24EEDDB50();
      os_log_type_t v28 = v47;
      uint64_t v29 = "[FloatingTabBarContentView] Index is not selectable: %ld";
      goto LABEL_69;
    }
    if (!v51)
    {

      if (qword_26B1E7568 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_24EEDD3A0();
      __swift_project_value_buffer(v24, (uint64_t)qword_26B1E80B0);
      uint64_t v25 = sub_24EEDD380();
      os_log_type_t v26 = sub_24EEDDA70();
      if (!os_log_type_enabled(v25, v26)) {
        goto LABEL_70;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134217984;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      uint64_t v50 = v13;
      sub_24EEDDB50();
      os_log_type_t v28 = v26;
      uint64_t v29 = "[FloatingTabBarContentView] Failed to select invalid index: %ld";
LABEL_69:
      _os_log_impl(&dword_24EE87000, v25, v28, v29, v27, 0xCu);
      MEMORY[0x25334FA20](v27, -1, -1);
LABEL_70:

      id v45 = aBlock;
LABEL_71:

      goto LABEL_52;
    }
  }

  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_24EEDD3A0();
  __swift_project_value_buffer(v36, (uint64_t)qword_26B1E80B0);
  id v37 = v22;
  id v38 = v22;
  id v39 = sub_24EEDD380();
  os_log_type_t v40 = sub_24EEDDA70();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    double v42 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 134218242;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id aBlock = v13;
    sub_24EEDDB50();
    *(_WORD *)(v41 + 12) = 2112;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v43 = v22;
    swift_release();
    uint64_t v44 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id aBlock = v44;
    sub_24EEDDB50();
    *double v42 = v44;

    _os_log_impl(&dword_24EE87000, v39, v40, "[FloatingTabBarContentView] Failed to select index %ld with error: %@", (uint8_t *)v41, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978270);
    swift_arrayDestroy();
    MEMORY[0x25334FA20](v42, -1, -1);
    MEMORY[0x25334FA20](v41, -1, -1);

    id v45 = v22;
    goto LABEL_71;
  }

  swift_release();
}

uint64_t sub_24EEB1568(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEAEB68(a2);
  sub_24EEAEEF8(a2, 0, a3, a4 & 1);
  return swift_release();
}

uint64_t sub_24EEB1640(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24EEB1684(uint64_t a1, uint64_t a2, char a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = a1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex;
  swift_beginAccess();
  uint64_t v7 = *(void *)v6;
  LODWORD(v6) = *(unsigned __int8 *)(v6 + 8);
  swift_release();
  sub_24EEAEEF8(a2, a3 & 1, v7, v6);
  return swift_release();
}

id FloatingTabBarContentView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void FloatingTabBarContentView.init(frame:)()
{
}

id FloatingTabBarContentView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingTabBarContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __swiftcall FloatingTabBarContentView.contentGestureRecognizer()(UIGestureRecognizer_optional *__return_ptr retstr)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = *(id *)(v1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer);
  swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FloatingTabBarContentView.updateItemDescriptors(_:expectedSize:selectedIndex:visibleItemDescriptors:visibleItemSizes:reason:shouldNotifyDelegate:animated:)(Swift::OpaquePointer _, CGSize expectedSize, Swift::Int_optional selectedIndex, Swift::OpaquePointer visibleItemDescriptors, Swift::OpaquePointer visibleItemSizes, FitnessCoreUI::FloatingTabBarUpdateReason reason, Swift::Bool shouldNotifyDelegate, Swift::Bool animated)
{
  Swift::Bool is_nil = selectedIndex.is_nil;
  Swift::Int value = selectedIndex.value;
  double width = expectedSize.width;
  char v29 = *(unsigned char *)reason;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_bridgeObjectRetain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v12 = is_nil;
  uint64_t v13 = (Swift::OpaquePointer *)&v8[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors];
  swift_beginAccess();
  v13->_rawValue = _._rawValue;
  swift_release();
  swift_bridgeObjectRelease();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v14 = &v8[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)char v14 = value;
  unsigned char v14[8] = v12 != 0;
  swift_release();
  objc_msgSend(v8, sel_bounds);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat v17 = v36.size.width;
  CGFloat height = v36.size.height;
  double v19 = CGRectGetWidth(v36);
  if (v19 == width)
  {
    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24EEDD3A0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B1E80B0);
    uint64_t v21 = sub_24EEDD380();
    os_log_type_t v22 = sub_24EEDDA90();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 134218240;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      double v35 = v19;
      sub_24EEDDB50();
      *(_WORD *)(v23 + 12) = 2048;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      double v35 = width;
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v21, v22, "[FloatingTabBarContentView] Bounds width (%f) matches expected width (%f). Applying items", (uint8_t *)v23, 0x16u);
      MEMORY[0x25334FA20](v23, -1, -1);
    }

    LOBYTE(v35) = v29;
    sub_24EEAA660((uint64_t)visibleItemDescriptors._rawValue, value, v12, visibleItemSizes._rawValue, (char *)&v35, shouldNotifyDelegate, animated, x, y, v17, height);
    swift_release();
  }
  else
  {
    if (qword_26B1E7568 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_24EEDD3A0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B1E80B0);
    uint64_t v25 = sub_24EEDD380();
    os_log_type_t v26 = sub_24EEDDA90();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 134218240;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      double v35 = v19;
      sub_24EEDDB50();
      *(_WORD *)(v27 + 12) = 2048;
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      double v35 = width;
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v25, v26, "[FloatingTabBarContentView] Bounds width (%f) does not match expected width (%f). Deferring item creation until next layout pass", (uint8_t *)v27, 0x16u);
      MEMORY[0x25334FA20](v27, -1, -1);
    }

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v8[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout] = 1;
    swift_release();
    sub_24EEA27DC();
    swift_allocError();
    *os_log_type_t v28 = 3;
    swift_willThrow();
    swift_release();
  }
}

void sub_24EEB2198(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEAF370(a2, a3, a4);
  objc_msgSend(a2, sel_setSelected_, 1);
  objc_msgSend(a2, sel_setHighlighted_, 0);
  BOOL v8 = *(void **)(a1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView);
  v14[0] = 0x3FF0000000000000;
  v14[1] = 0;
  v14[2] = 0;
  void v14[3] = 0x3FF0000000000000;
  v14[4] = 0;
  v14[5] = 0;
  objc_msgSend(v8, sel_setTransform_, v14);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = a1 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x25334FB00](v9);
  uint64_t v11 = *(void *)(v9 + 8);
  swift_release();
  if (v10)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(ObjectType, v11);
    swift_unknownObjectRelease();
    objc_msgSend(v13, sel_layoutIfNeeded);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

void sub_24EEB2388()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_26B1E7568 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24EEDD3A0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1E80B0);
  oslog = sub_24EEDD380();
  os_log_type_t v1 = sub_24EEDDA90();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 134218496;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    *(_WORD *)(v2 + 12) = 1024;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    *(_WORD *)(v2 + 18) = 1024;
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24EEDDB50();
    _os_log_impl(&dword_24EE87000, oslog, v1, "[FloatingTabBarContentView] Finished selecting item %ld: %{BOOL}d. Retargeted: %{BOOL}d", (uint8_t *)v2, 0x18u);
    MEMORY[0x25334FA20](v2, -1, -1);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24EEB26A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

void (*sub_24EEB2700(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24EEA86D8(v2);
  return sub_24EEA12EC;
}

uint64_t sub_24EEB2758(uint64_t a1, uint64_t a2)
{
  return sub_24EEB2778(a1, a2, 24, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex);
}

uint64_t sub_24EEB2768(uint64_t a1, uint64_t a2)
{
  return sub_24EEB2778(a1, a2, 26, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex);
}

uint64_t sub_24EEB2778(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (uint64_t *)(v4 + *a4);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_release();
  return v7;
}

id sub_24EEB2844()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer);
  swift_release();
  return v1;
}

void sub_24EEB28E4(Swift::Int a1, Swift::Bool a2, Swift::Bool a3)
{
}

void sub_24EEB28FC(Swift::OpaquePointer a1, Swift::Int_optional a2, Swift::OpaquePointer a3, Swift::OpaquePointer a4, FitnessCoreUI::FloatingTabBarUpdateReason a5, Swift::Bool a6, Swift::Bool a7, double a8, double a9)
{
  a2.is_nil &= 1u;
  FloatingTabBarContentView.updateItemDescriptors(_:expectedSize:selectedIndex:visibleItemDescriptors:visibleItemSizes:reason:shouldNotifyDelegate:animated:)(a1, (CGSize)__PAIR128__(*(unint64_t *)&a9, *(unint64_t *)&a8), a2, a3, a4, a5, a6, a7);
}

Swift::Bool __swiftcall FloatingTabBarContentView.gestureRecognizerShouldBegin(_:)(UIGestureRecognizer *a1)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 1;
}

Swift::Bool __swiftcall FloatingTabBarContentView.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(UIGestureRecognizer *_, UIGestureRecognizer *shouldRecognizeSimultaneouslyWith)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 0;
}

uint64_t sub_24EEB2C50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB2D10(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2C70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB2E8C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2C90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB2FEC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2CB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB314C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2CD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB32D0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2CF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EEB345C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24EEB2D10(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26B1E76D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    memcpy(v12, v13, 48 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EEB2E8C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E76F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    memcpy(v13, v14, v8 << 6);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EEB2FEC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E76C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EEB314C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7710);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 136);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[136 * v8]) {
      memmove(v12, v13, 136 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[136 * v8] || v12 >= &v13[136 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EEB32D0(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E7700);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[72 * v8]) {
      memmove(v12, v13, 72 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[72 * v8] || v12 >= &v13[72 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EEB345C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E76E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[72 * v8]) {
      memmove(v12, v13, 72 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[72 * v8] || v12 >= &v13[72 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

char *sub_24EEB35E8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  v77[3] = a3;
  v77[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v77);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(void *)&a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = &a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = MEMORY[0x263F8EE78];
  *(void *)&a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v10 = &a2[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView;
  id v12 = objc_allocWithZone(MEMORY[0x263F82588]);
  uint64_t v13 = a2;
  id v14 = objc_msgSend(v12, sel_init);
  id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FloatingCollectionView()), sel_initWithFrame_collectionViewLayout_, v14, 0.0, 0.0, 0.0, 0.0);

  *(void *)&a2[v11] = v15;
  uint64_t v16 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer;
  type metadata accessor for ContinuousSelectionGestureRecognizer();
  *(void *)&v13[v16] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView;
  *(void *)&v13[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E08]), sel_init);
  *(void *)&v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_currentWidth] = 0;
  *(void *)&v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource] = 0;
  v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating] = 0;
  v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout] = 1;
  *(void *)&v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items] = v9;
  uint64_t v18 = &v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)uint64_t v18 = 0;
  v18[8] = 1;
  v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture] = 0;
  sub_24EE96FDC((uint64_t)v77, (uint64_t)&v13[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider]);

  v76.receiver = v13;
  v76.super_class = (Class)type metadata accessor for FloatingTabBarContentView();
  id v19 = objc_msgSendSuper2(&v76, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v21 = objc_allocWithZone((Class)type metadata accessor for FloatingLayout());
  aBlock[4] = sub_24EE97078;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24EEBF904;
  aBlock[3] = &block_descriptor_68;
  os_log_type_t v22 = _Block_copy(aBlock);
  uint64_t v23 = (char *)v19;
  swift_retain();
  id v73 = objc_msgSend(v21, sel_initWithSectionProvider_, v22);
  _Block_release(v22);
  swift_release();
  swift_release();
  uint64_t v24 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView;
  uint64_t v25 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v26 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75A0));
  id v27 = v25;
  uint64_t v28 = sub_24EEDD440();
  char v29 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource];
  *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource] = v28;

  uint64_t v30 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView;
  uint64_t v31 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView];
  double v32 = self;
  id v33 = v31;
  id v34 = objc_msgSend(v32, sel_systemFillColor);
  objc_msgSend(v33, sel_setBackgroundColor_, v34);

  id v35 = objc_msgSend(*(id *)&v23[v30], sel_layer);
  objc_msgSend(v35, sel_setCornerRadius_, *MEMORY[0x263F15E58]);

  objc_msgSend(v23, sel_addSubview_, *(void *)&v23[v30]);
  uint64_t v36 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer;
  id v37 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer];
  objc_msgSend(v37, sel_addTarget_action_, v23, sel_handleSelectionGesture_);
  objc_msgSend(v37, sel_setCancelsTouchesInView_, 0);
  sub_24EEDD9B0();
  id v38 = v23;
  id v39 = v37;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)&v39[OBJC_IVAR____TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer_dragCoordinator + 8] = &off_2700974C0;
  swift_unknownObjectWeakAssign();

  swift_release();
  objc_msgSend(*(id *)&v23[v36], sel_setDelegate_, v38);
  id v40 = *(id *)&v23[v24];
  id v41 = objc_msgSend(v32, sel_clearColor);
  objc_msgSend(v40, sel_setBackgroundColor_, v41);

  double v42 = *(void **)&v23[v24];
  objc_msgSend(v42, sel_setCollectionViewLayout_, v73);
  objc_msgSend(v42, sel_setAccessibilityContainerType_, 4);
  uint64_t v43 = *MEMORY[0x263F832D0];
  id v44 = v42;
  unint64_t v45 = (unint64_t)objc_msgSend(v44, sel_accessibilityTraits);
  if ((v43 & ~v45) != 0) {
    uint64_t v46 = v43;
  }
  else {
    uint64_t v46 = 0;
  }
  objc_msgSend(v44, sel_setAccessibilityTraits_, v46 | v45, v73);

  os_log_type_t v47 = *(void **)&v23[v24];
  objc_msgSend(v47, sel_setIsAccessibilityElement_, 0);
  objc_msgSend(v47, sel_setAllowsMultipleSelection_, 0);
  objc_msgSend(v47, sel_setAllowsSelection_, 0);
  objc_msgSend(v47, sel_setScrollEnabled_, 0);
  objc_msgSend(v47, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  type metadata accessor for TabItemCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v49 = v47;
  uint64_t v50 = (void *)sub_24EEDD7B0();
  objc_msgSend(v49, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v50);

  char v51 = *(void **)&v23[v24];
  uint64_t v52 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v53 = v51;
  swift_retain();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  CGRect v54 = (void (**)(uint64_t))&v53[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  uint64_t v55 = *(void *)&v53[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  *CGRect v54 = sub_24EE97090;
  v54[1] = (void (*)(uint64_t))v52;
  sub_24EE97098(v55);

  swift_release();
  swift_release();
  CGRect v56 = *(void **)&v23[v24];
  objc_msgSend(v38, sel_addSubview_, v56);
  uint64_t v57 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_24EEDFB00;
  id v59 = objc_msgSend(v56, sel_leadingAnchor);
  id v60 = objc_msgSend(v38, sel_leadingAnchor);
  id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

  *(void *)(v58 + 32) = v61;
  id v62 = objc_msgSend(*(id *)&v23[v24], sel_trailingAnchor);
  id v63 = objc_msgSend(v38, sel_trailingAnchor);
  id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v63);

  *(void *)(v58 + 40) = v64;
  id v65 = objc_msgSend(*(id *)&v23[v24], sel_topAnchor);
  id v66 = objc_msgSend(v38, sel_topAnchor);
  id v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

  *(void *)(v58 + 48) = v67;
  id v68 = objc_msgSend(*(id *)&v23[v24], sel_bottomAnchor);
  id v69 = objc_msgSend(v38, sel_bottomAnchor);
  id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_, v69);

  *(void *)(v58 + 56) = v70;
  aBlock[0] = v58;
  sub_24EEDD950();
  sub_24EE90130(0, (unint64_t *)&qword_26B1E7650);
  uint64_t v71 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v57, sel_activateConstraints_, v71);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  return v38;
}

uint64_t sub_24EEB3F60(uint64_t a1, double (*a2)(uint64_t, _OWORD *))
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_24EEB2C90(0, 0, 0);
  uint64_t v4 = v14;
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = 0;
    int64_t v7 = (_OWORD *)(a1 + 64);
    do
    {
      long long v8 = *(v7 - 1);
      v13[0] = *(v7 - 2);
      v13[1] = v8;
      void v13[2] = *v7;
      double v9 = a2(v6, v13);
      uint64_t v14 = v4;
      unint64_t v11 = *(void *)(v4 + 16);
      unint64_t v10 = *(void *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_24EEB2C90(v10 > 1, v11 + 1, 1);
        uint64_t v4 = v14;
      }
      ++v6;
      *(void *)(v4 + 16) = v11 + 1;
      *(double *)(v4 + 8 * v11 + 32) = v9;
      v7 += 3;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24EEB4094(uint64_t a1, void (*a2)(long long *__return_ptr, uint64_t, _OWORD *))
{
  uint64_t v27 = MEMORY[0x263F8EE78];
  sub_24EEB2C70(0, 0, 0);
  uint64_t v4 = v27;
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = 0;
    int64_t v7 = (_OWORD *)(a1 + 64);
    do
    {
      uint64_t v25 = v6;
      long long v8 = *(v7 - 1);
      v26[0] = *(v7 - 2);
      v26[1] = v8;
      void v26[2] = *v7;
      a2(&v21, v6, v26);
      long long v9 = v21;
      long long v10 = v22;
      long long v11 = v23;
      long long v12 = v24;
      uint64_t v27 = v4;
      unint64_t v14 = *(void *)(v4 + 16);
      unint64_t v13 = *(void *)(v4 + 24);
      if (v14 >= v13 >> 1)
      {
        long long v19 = v22;
        long long v20 = v21;
        long long v17 = v24;
        long long v18 = v23;
        sub_24EEB2C70(v13 > 1, v14 + 1, 1);
        long long v12 = v17;
        long long v11 = v18;
        long long v10 = v19;
        long long v9 = v20;
        uint64_t v4 = v27;
      }
      ++v6;
      *(void *)(v4 + 16) = v14 + 1;
      id v15 = (_OWORD *)(v4 + (v14 << 6));
      v15[2] = v9;
      v15[3] = v10;
      v15[4] = v11;
      v15[5] = v12;
      v7 += 3;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24EEB41DC(uint64_t a1, void (*a2)(_OWORD *__return_ptr, uint64_t, void *))
{
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_24EEB2CB0(0, 0, 0);
  uint64_t v3 = v37;
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v7 = v6[6];
      uint64_t v8 = v6[3];
      char v9 = *((unsigned char *)v6 + 18);
      char v10 = *((unsigned char *)v6 + 17);
      char v11 = *((unsigned char *)v6 + 16);
      uint64_t v12 = *v6;
      uint64_t v13 = v6[1];
      uint64_t v14 = *(v6 - 2);
      uint64_t v15 = *(v6 - 1);
      uint64_t v29 = v5;
      v30[0] = v14;
      v30[1] = v15;
      v30[2] = v12;
      void v30[3] = v13;
      char v31 = v11;
      char v32 = v10;
      char v33 = v9;
      uint64_t v34 = v8;
      long long v35 = *((_OWORD *)v6 + 2);
      uint64_t v36 = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a2(v27, v5, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v37 = v3;
      unint64_t v17 = *(void *)(v3 + 16);
      unint64_t v16 = *(void *)(v3 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_24EEB2CB0(v16 > 1, v17 + 1, 1);
        uint64_t v3 = v37;
      }
      ++v5;
      *(void *)(v3 + 16) = v17 + 1;
      uint64_t v18 = v3 + 136 * v17;
      *(_OWORD *)(v18 + 32) = v27[0];
      long long v19 = v27[1];
      long long v20 = v27[2];
      long long v21 = v27[4];
      *(_OWORD *)(v18 + 80) = v27[3];
      *(_OWORD *)(v18 + 96) = v21;
      *(_OWORD *)(v18 + 48) = v19;
      *(_OWORD *)(v18 + 64) = v20;
      long long v22 = v27[5];
      long long v23 = v27[6];
      long long v24 = v27[7];
      *(void *)(v18 + 160) = v28;
      *(_OWORD *)(v18 + 128) = v23;
      *(_OWORD *)(v18 + 144) = v24;
      *(_OWORD *)(v18 + 112) = v22;
      v6 += 9;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24EEB43AC(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v3 = a2;
  unint64_t v4 = 0;
  uint64_t v27 = result + 32;
  uint64_t v25 = MEMORY[0x263F8EE78];
  id v26 = (uint64_t *)(a2 + 48);
  unint64_t v28 = *(void *)(result + 16);
LABEL_3:
  if (v4 <= v2) {
    unint64_t v5 = v2;
  }
  else {
    unint64_t v5 = v4;
  }
  unint64_t v30 = v5;
  while (v4 != v30)
  {
    uint64_t v6 = v27 + 72 * v4;
    uint64_t v7 = *(void *)(v6 + 8);
    uint64_t v44 = *(void *)v6;
    uint64_t v8 = *(void *)(v6 + 24);
    uint64_t v40 = *(void *)(v6 + 16);
    int v37 = *(unsigned __int8 *)(v6 + 33);
    int v38 = *(unsigned __int8 *)(v6 + 32);
    int v35 = *(unsigned __int8 *)(v6 + 34);
    uint64_t v9 = *(void *)(v6 + 48);
    uint64_t v32 = *(void *)(v6 + 40);
    uint64_t v10 = *(void *)(v6 + 64);
    uint64_t v34 = *(void *)(v6 + 56);
    sub_24EEDD9B0();
    uint64_t v36 = v9;
    swift_bridgeObjectRetain();
    uint64_t v33 = v10;
    swift_bridgeObjectRetain();
    uint64_t v43 = v7;
    swift_bridgeObjectRetain();
    uint64_t v39 = v8;
    swift_bridgeObjectRetain();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    unint64_t v31 = v4 + 1;
    uint64_t v11 = *(void *)(v3 + 16);
    if (v11)
    {
      uint64_t v12 = v26;
      do
      {
        uint64_t v14 = *v12;
        uint64_t v13 = v12[1];
        int v15 = *((unsigned __int8 *)v12 + 16);
        int v16 = *((unsigned __int8 *)v12 + 17);
        int v17 = *((unsigned __int8 *)v12 + 18);
        uint64_t v18 = v12[3];
        uint64_t v19 = v12[4];
        uint64_t v41 = v12[6];
        uint64_t v42 = v12[5];
        if ((*(v12 - 2) != v44 || *(v12 - 1) != v43) && (sub_24EEDDE90() & 1) == 0) {
          goto LABEL_14;
        }
        if (v14 == v40 && v13 == v39)
        {
          if (v38 != v15 || ((v37 ^ v16) & 1) != 0) {
            goto LABEL_14;
          }
        }
        else if ((sub_24EEDDE90() & 1) == 0 || v38 != v15 || v37 != v16)
        {
          goto LABEL_14;
        }
        if (v17 == v35)
        {
          if (v19)
          {
            if (!v36 || (v18 != v32 || v19 != v36) && (sub_24EEDDE90() & 1) == 0) {
              goto LABEL_14;
            }
          }
          else if (v36)
          {
            goto LABEL_14;
          }
          if (v42 == v34 && v41 == v33 || (sub_24EEDDE90() & 1) != 0)
          {
            swift_release();
            uint64_t v20 = v25;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = sub_24EEB2CD0(0, *(void *)(v25 + 16) + 1, 1);
              uint64_t v20 = v25;
            }
            uint64_t v3 = a2;
            uint64_t v21 = v20;
            unint64_t v23 = *(void *)(v20 + 16);
            unint64_t v22 = *(void *)(v20 + 24);
            if (v23 >= v22 >> 1)
            {
              uint64_t result = sub_24EEB2CD0(v22 > 1, v23 + 1, 1);
              uint64_t v21 = v25;
            }
            *(void *)(v21 + 16) = v23 + 1;
            uint64_t v25 = v21;
            uint64_t v24 = v21 + 72 * v23;
            *(void *)(v24 + 32) = v44;
            *(void *)(v24 + 40) = v43;
            *(void *)(v24 + 48) = v40;
            *(void *)(v24 + 56) = v39;
            *(unsigned char *)(v24 + 64) = v38;
            *(unsigned char *)(v24 + 65) = v37;
            *(unsigned char *)(v24 + 66) = v35;
            unint64_t v4 = v31;
            *(void *)(v24 + 72) = v32;
            *(void *)(v24 + 80) = v36;
            *(void *)(v24 + 88) = v34;
            *(void *)(v24 + 96) = v33;
            unint64_t v2 = v28;
            if (v31 == v28) {
              return v25;
            }
            goto LABEL_3;
          }
        }
LABEL_14:
        v12 += 9;
        --v11;
      }
      while (v11);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    uint64_t v3 = a2;
    unint64_t v4 = v31;
    if (v31 == v28) {
      return v25;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24EEB478C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    if (a5)
    {
      swift_release();
      return 0;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 16);
      swift_release();
      if (v13 - 1 >= a4) {
        return a4;
      }
      else {
        return v13 - 1;
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 16);
    swift_release();
    uint64_t v11 = v10 - 1;
    if (a5)
    {
      if (v10 - 1 >= a2) {
        return a2;
      }
      else {
        return v10 - 1;
      }
    }
    else
    {
      if (v10 - 1 >= a2) {
        uint64_t v11 = a2;
      }
      if (v10 <= a4) {
        return v11;
      }
      else {
        return a4;
      }
    }
  }
}

char *sub_24EEB48EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)objc_allocWithZone((Class)type metadata accessor for FloatingTabBarContentView());
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return sub_24EEB35E8((uint64_t)v9, v10, a3, a4);
}

uint64_t type metadata accessor for FloatingTabBarContentView()
{
  return self;
}

uint64_t sub_24EEB49F4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24EEB4A58()
{
  uint64_t v1 = sub_24EEDD2E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v6 + 136, v5);
}

void sub_24EEB4B64()
{
  uint64_t v1 = *(void *)(sub_24EEDD2E0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v5 = (void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_24EEB2198(v3, v4, v0 + v2, v5);
}

uint64_t sub_24EEB4BF4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24EEB4C04()
{
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_24EEB4C1C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EEA8B04(a1, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex, a2);
}

uint64_t sub_24EEB4C4C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EEA8B04(a1, &OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex, a2);
}

uint64_t sub_24EEB4C70(uint64_t a1)
{
  return sub_24EEA8CB8(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t method lookup function for FloatingTabBarContentView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FloatingTabBarContentView);
}

uint64_t dispatch thunk of FloatingTabBarContentView.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.highlightedIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.itemDescriptors.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.selectedIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of FloatingTabBarContentView.__allocating_init(layoutProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 472))();
}

uint64_t sub_24EEB4E50()
{
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_24EEB4E88()
{
  return sub_24EEB1684(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_24EEB4E94()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_24EEB4ECC()
{
  return sub_24EEB1568(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_24EEB4EDC(uint64_t a1, uint64_t a2)
{
  return sub_24EEB0630(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_24EEB4EE8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24EEB07E0(a1, a2, *(void *)(v3 + 16), a3, *(double *)(v3 + 24));
}

unint64_t sub_24EEB4EF4()
{
  unint64_t result = qword_26B1E74D8;
  if (!qword_26B1E74D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E74D8);
  }
  return result;
}

uint64_t sub_24EEB4F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EEB4FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EEB5018()
{
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v1 = &v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_highlightedIndex];
  *(void *)uint64_t v1 = 0;
  v1[8] = 1;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_itemDescriptors] = MEMORY[0x263F8EE78];
  uint64_t v3 = &v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectedIndex];
  *(void *)uint64_t v3 = 0;
  v3[8] = 1;
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView;
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82588]), sel_init);
  id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FloatingCollectionView()), sel_initWithFrame_collectionViewLayout_, v5, 0.0, 0.0, 0.0, 0.0);

  *(void *)&v0[v4] = v6;
  uint64_t v7 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer;
  type metadata accessor for ContinuousSelectionGestureRecognizer();
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView;
  *(void *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E08]), sel_init);
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_currentWidth] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource] = 0;
  v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isAnimating] = 0;
  v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_isPendingLayout] = 1;
  *(void *)&v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_items] = v2;
  uint64_t v9 = &v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_pendingSelectedIndex];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  v0[OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionShouldFollowGesture] = 0;

  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

uint64_t sub_24EEB523C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 50, 7);
}

void sub_24EEB527C()
{
  sub_24EEAB108(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(unsigned char *)(v0 + 33), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48), *(unsigned char *)(v0 + 49));
}

uint64_t sub_24EEB5298()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24EEB52D0(uint64_t a1)
{
  return sub_24EEACF8C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24EEB52D8@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24EEAD08C(a1, a2, *(void *)(v3 + 16), a3);
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

uint64_t sub_24EEB5344()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t dispatch thunk of LayoutProtocol.containerSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LayoutProtocol.gridSizeClass.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static TabItemCell.Position.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TabItemCell.Position.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t sub_24EEB5404(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5AC4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEB5440(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5AC4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEB547C()
{
  uint64_t v1 = 0x676E696461656CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x676E696C69617274;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7265746E6563;
  }
}

uint64_t sub_24EEB54D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEB9200(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEB54FC(uint64_t a1)
{
  unint64_t v2 = sub_24EEB59C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEB5538(uint64_t a1)
{
  unint64_t v2 = sub_24EEB59C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEB5574(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5A70();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEB55B0(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5A70();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEB55EC(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5A1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEB5628(uint64_t a1)
{
  unint64_t v2 = sub_24EEB5A1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemCell.Position.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699787D0);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699787D8);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699787E0);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699787E8);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEB59C8();
  sub_24EEDDFC0();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_24EEB5A70();
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_24EEB5A1C();
      int v17 = v23;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_24EEB5AC4();
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_24EEB59C8()
{
  unint64_t result = qword_2699787F0;
  if (!qword_2699787F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699787F0);
  }
  return result;
}

unint64_t sub_24EEB5A1C()
{
  unint64_t result = qword_2699787F8;
  if (!qword_2699787F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699787F8);
  }
  return result;
}

unint64_t sub_24EEB5A70()
{
  unint64_t result = qword_269978800;
  if (!qword_269978800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978800);
  }
  return result;
}

unint64_t sub_24EEB5AC4()
{
  unint64_t result = qword_269978808;
  if (!qword_269978808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978808);
  }
  return result;
}

uint64_t TabItemCell.Position.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t TabItemCell.Position.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  int v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978810);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  int v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978818);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978820);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978828);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEB59C8();
  uint64_t v12 = (uint64_t)v39;
  sub_24EEDDFB0();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  int v15 = v11;
  uint64_t v16 = sub_24EEDDDF0();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_24EEDDC30();
    swift_allocError();
    unint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *unint64_t v23 = &type metadata for TabItemCell.Position;
    sub_24EEDDD90();
    sub_24EEDDC20();
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
      sub_24EEB5A70();
      uint64_t v18 = v30;
      sub_24EEDDD80();
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
      sub_24EEB5A1C();
      uint64_t v25 = v30;
      sub_24EEDDD80();
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
    sub_24EEB5AC4();
    uint64_t v24 = v30;
    sub_24EEDDD80();
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

uint64_t sub_24EEB6118@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return TabItemCell.Position.init(from:)(a1, a2);
}

uint64_t sub_24EEB6130(void *a1)
{
  return TabItemCell.Position.encode(to:)(a1);
}

uint64_t type metadata accessor for TabItemCell()
{
  return self;
}

uint64_t sub_24EEB62A8()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (!objc_msgSend(v0, sel_isHighlighted)) {
    goto LABEL_7;
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v1 = objc_msgSend(v0, sel_isSelected);
  swift_release();
  double v2 = 0.75;
  if (v1) {
LABEL_7:
  }
    double v2 = 1.0;
  objc_msgSend(v0, sel_setAlpha_, v2);
  return swift_release();
}

id sub_24EEB63F0(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for TabItemCell();
  id v7 = objc_msgSendSuper2(&v9, *a4);
  swift_release();

  swift_release();
  return v7;
}

uint64_t sub_24EEB65E4(char a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for TabItemCell();
  objc_msgSendSuper2(&v4, sel_setSelected_, a1 & 1);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEB82A0((char)objc_msgSend(v1, sel_isSelected));
  swift_release();
  return swift_release();
}

id TabItemCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

char *TabItemCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLayoutGuide;
  id v10 = objc_allocWithZone(MEMORY[0x263F82900]);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_init);
  uint64_t v12 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82820]), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  *(void *)&v11[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C00]), sel_init);
  uint64_t v14 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel;
  *(void *)&v11[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  uint64_t v15 = (uint64_t)&v11[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  sub_24EEB86E8((uint64_t)v78);
  sub_24EEB8704((uint64_t)v78, v15);
  uint64_t v16 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint;
  *(void *)&v11[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint;
  *(void *)&v11[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v18 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint;
  *(void *)&v11[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v19 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint;
  *(void *)&v11[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v20 = &v11[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;

  v77.receiver = v11;
  v77.super_class = (Class)type metadata accessor for TabItemCell();
  id v21 = objc_msgSendSuper2(&v77, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v22 = *MEMORY[0x263F83258];
  unint64_t v23 = (char *)v21;
  unint64_t v24 = (unint64_t)objc_msgSend(v23, sel_accessibilityTraits);
  if ((v22 & ~v24) != 0) {
    uint64_t v25 = v22;
  }
  else {
    uint64_t v25 = 0;
  }
  objc_msgSend(v23, sel_setAccessibilityTraits_, v25 | v24);
  objc_msgSend(v23, sel_setIsAccessibilityElement_, 1);
  uint64_t v26 = *MEMORY[0x263F83460];
  objc_msgSend(v23, sel_setMaximumContentSizeCategory_, *MEMORY[0x263F83460]);
  uint64_t v27 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  uint64_t v28 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView];
  objc_msgSend(v28, sel_setAxis_, 0);
  objc_msgSend(v28, sel_setDistribution_, 3);
  objc_msgSend(v28, sel_setSpacing_, 4.0);
  objc_msgSend(v28, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v29 = objc_msgSend(v23, sel_contentView);
  objc_msgSend(v29, sel_addSubview_, v28);

  uint64_t v30 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView];
  objc_msgSend(v30, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v30, sel_setContentMode_, 1);
  objc_msgSend(v30, sel_setMaximumContentSizeCategory_, v26);
  uint64_t v75 = v27;
  uint64_t v31 = *(void **)&v23[v27];
  objc_msgSend(v31, sel_addArrangedSubview_, v30);
  uint64_t v32 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel];
  objc_msgSend(v32, sel_setNumberOfLines_, 1);
  objc_msgSend(v32, sel_setMaximumContentSizeCategory_, v26);
  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v31, sel_addArrangedSubview_, v32);
  id v33 = objc_msgSend(v23, sel_contentView);
  uint64_t v34 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLayoutGuide;
  objc_msgSend(v33, sel_addLayoutGuide_, *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLayoutGuide]);

  id v35 = objc_msgSend(*(id *)&v23[v34], sel_centerXAnchor);
  id v36 = objc_msgSend(v23, sel_contentView);
  id v37 = objc_msgSend(v36, sel_centerXAnchor);

  id v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  type metadata accessor for UILayoutPriority(0);
  sub_24EEB9174();
  sub_24EEDD3B0();
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  LODWORD(v39) = v76;
  objc_msgSend(v38, sel_setPriority_, v39);
  swift_release();
  char v40 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint];
  *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint] = v38;

  id v41 = objc_msgSend(*(id *)&v23[v34], sel_leadingAnchor);
  id v42 = objc_msgSend(v23, sel_contentView);
  id v43 = objc_msgSend(v42, sel_leadingAnchor);

  id v44 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v43);
  sub_24EEDD3B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  LODWORD(v45) = v76;
  objc_msgSend(v44, sel_setPriority_, v45);
  swift_release();
  uint64_t v46 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint];
  *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint] = v44;

  id v47 = objc_msgSend(*(id *)&v23[v34], sel_trailingAnchor);
  id v48 = objc_msgSend(v23, sel_contentView);
  id v49 = objc_msgSend(v48, sel_trailingAnchor);

  id v50 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v49);
  sub_24EEDD3B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  LODWORD(v51) = v76;
  objc_msgSend(v50, sel_setPriority_, v51);
  swift_release();
  uint64_t v52 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint];
  *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint] = v50;

  id v53 = objc_msgSend(*(id *)&v23[v34], sel_widthAnchor);
  id v54 = objc_msgSend(v53, sel_constraintEqualToConstant_, 0.0);

  uint64_t v55 = *(void **)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint];
  *(void *)&v23[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint] = v54;

  CGRect v56 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_24EEDFB00;
  id v58 = objc_msgSend(*(id *)&v23[v75], sel_centerXAnchor);
  id v59 = objc_msgSend(*(id *)&v23[v34], sel_centerXAnchor);
  id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v59);

  *(void *)(v57 + 32) = v60;
  id v61 = objc_msgSend(*(id *)&v23[v75], sel_leadingAnchor);
  id v62 = objc_msgSend(v23, sel_contentView);
  id v63 = objc_msgSend(v62, sel_leadingAnchor);

  id v64 = objc_msgSend(v61, sel_constraintGreaterThanOrEqualToAnchor_, v63);
  *(void *)(v57 + 40) = v64;
  id v65 = objc_msgSend(*(id *)&v23[v75], sel_trailingAnchor);
  id v66 = objc_msgSend(v23, sel_contentView);
  id v67 = objc_msgSend(v66, sel_trailingAnchor);

  id v68 = objc_msgSend(v65, sel_constraintLessThanOrEqualToAnchor_, v67);
  *(void *)(v57 + 48) = v68;
  id v69 = objc_msgSend(*(id *)&v23[v75], sel_centerYAnchor);
  id v70 = objc_msgSend(v23, sel_contentView);
  id v71 = objc_msgSend(v70, sel_centerYAnchor);

  id v72 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v71);
  *(void *)(v57 + 56) = v72;
  sub_24EEDD950();
  sub_24EEB91C0();
  id v73 = (void *)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(v56, sel_activateConstraints_, v73);

  return v23;
}

id TabItemCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_24EEB742C()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TabItemCell();
  objc_msgSendSuper2(&v5, sel_prepareForReuse);
  sub_24EEB86E8((uint64_t)v6);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (uint64_t)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  sub_24EEB8704((uint64_t)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem], (uint64_t)v4);
  sub_24EEB8704((uint64_t)v6, v1);
  sub_24EEB95AC(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
  swift_release();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v2 = &v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount];
  *(void *)double v2 = 0;
  v2[8] = 1;
  swift_release();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView], sel_setImage_, 0);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel], sel_setText_, 0);
  return swift_release();
}

uint64_t sub_24EEB76E0(long long *a1, unsigned __int8 *a2, uint64_t a3)
{
  objc_super v4 = v3;
  long long v6 = a1[7];
  long long v55 = a1[6];
  long long v56 = v6;
  uint64_t v57 = *((void *)a1 + 16);
  long long v7 = a1[3];
  long long v51 = a1[2];
  long long v52 = v7;
  long long v8 = a1[5];
  long long v53 = a1[4];
  long long v54 = v8;
  long long v9 = a1[1];
  long long v49 = *a1;
  long long v50 = v9;
  int v10 = *a2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = (uint64_t)&v3[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  sub_24EEB8704((uint64_t)&v3[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem], (uint64_t)v45);
  sub_24EEB95AC(v45, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9610);
  swift_release();
  v46[6] = v55;
  v46[7] = v56;
  uint64_t v47 = v57;
  _OWORD v46[2] = v51;
  v46[3] = v52;
  v46[4] = v53;
  v46[5] = v54;
  v46[0] = v49;
  v46[1] = v50;
  CGSizeMake(v46);
  sub_24EEB8704((uint64_t)v45, (uint64_t)v48);
  if (sub_24EEB9674((uint64_t)v48) == 1)
  {
    sub_24EEB8704((uint64_t)v45, (uint64_t)v42);
    sub_24EEB8704((uint64_t)v46, (uint64_t)&v44);
    sub_24EE97C2C((uint64_t)&v49);
    sub_24EEB968C((uint64_t *)v42);
  }
  else
  {
    sub_24EEB8704((uint64_t)v45, (uint64_t)v40);
    v38[6] = v55;
    v38[7] = v56;
    uint64_t v39 = v57;
    v38[2] = v51;
    v38[3] = v52;
    v38[4] = v53;
    v38[5] = v54;
    v38[0] = v49;
    v38[1] = v50;
    char v12 = _s13FitnessCoreUI7TabItemV2eeoiySbAC_ACtFZ_0((uint64_t)v40, (uint64_t)v38);
    v42[6] = v40[6];
    v42[7] = v40[7];
    uint64_t v43 = v41;
    v42[2] = v40[2];
    v42[3] = v40[3];
    v42[4] = v40[4];
    v42[5] = v40[5];
    v42[0] = v40[0];
    v42[1] = v40[1];
    sub_24EE97C84((uint64_t)v42);
    if (v12) {
      return swift_release();
    }
  }
  sub_24EE97C2C((uint64_t)&v49);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEB8704(v11, (uint64_t)v42);
  sub_24EEB8704((uint64_t)v46, v11);
  sub_24EE97C2C((uint64_t)&v49);
  sub_24EEB95AC(v42, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
  swift_release();
  sub_24EE97C84((uint64_t)&v49);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = &v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount];
  *(void *)uint64_t v13 = a3;
  v13[8] = 0;
  swift_release();
  if (!v10)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v19 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint];
    swift_release();
    objc_msgSend(v19, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v20 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint];
    swift_release();
    objc_msgSend(v20, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v21 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint];
    swift_release();
    objc_msgSend(v21, sel_setActive_, 1);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v22 = (id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint];
    id v23 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint];
    swift_release();
    objc_msgSend(v23, sel_setConstant_, *((double *)&v52 + 1));
    goto LABEL_42;
  }
  if (v10 == 1)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v14 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint];
    swift_release();
    objc_msgSend(v14, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v15 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint];
    swift_release();
    objc_msgSend(v15, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint;
    id v17 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint];
    swift_release();
    double v18 = *((double *)&v52 + 1);
    objc_msgSend(v17, sel_setConstant_, *(double *)&v54);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if (swift_task_isCurrentExecutor()) {
      goto LABEL_39;
    }
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v24 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint];
    swift_release();
    objc_msgSend(v24, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v25 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint];
    swift_release();
    objc_msgSend(v25, sel_setActive_, 0);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint;
    id v26 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint];
    swift_release();
    double v18 = *((double *)&v52 + 1);
    objc_msgSend(v26, sel_setConstant_, -*(double *)&v55);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if (swift_task_isCurrentExecutor()) {
      goto LABEL_39;
    }
  }
  swift_task_reportUnexpectedExecutor();
LABEL_39:
  id v27 = *(id *)&v4[v16];
  swift_release();
  objc_msgSend(v27, sel_setActive_, 1);

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v22 = (id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint];
  id v23 = *(id *)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint];
  swift_release();
  objc_msgSend(v23, sel_setConstant_, v18);
LABEL_42:

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v28 = *v22;
  swift_release();
  objc_msgSend(v28, sel_setActive_, 1);

  if ((void)v56) {
    sub_24EEB899C(*((uint64_t *)&v55 + 1), v56, *(void **)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView]);
  }
  id v29 = *(void **)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView];
  id v30 = objc_msgSend(v29, sel_image);
  id v31 = v30;
  if (v30) {

  }
  objc_msgSend(v29, sel_setHidden_, v31 == 0);
  uint64_t v32 = *(void **)&v4[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel];
  objc_msgSend(v32, sel_setIsAccessibilityElement_, 0);
  uint64_t v33 = v57;
  objc_msgSend(v32, sel_setHidden_, v57 == 0);
  if (v33) {
    uint64_t v34 = (void *)sub_24EEDD7B0();
  }
  else {
    uint64_t v34 = 0;
  }
  objc_msgSend(v32, sel_setText_, v34);

  id v35 = (void *)sub_24EEDD7B0();
  objc_msgSend(v4, sel_setAccessibilityLabel_, v35);

  *(void *)&v40[0] = 0;
  *((void *)&v40[0] + 1) = 0xE000000000000000;
  sub_24EEDDBE0();
  swift_bridgeObjectRelease();
  *(void *)&v40[0] = 0x2E7373656E746946;
  *((void *)&v40[0] + 1) = 0xEF2E726142626174;
  swift_bridgeObjectRetain();
  sub_24EEDD860();
  swift_bridgeObjectRelease();
  id v36 = (void *)sub_24EEDD7B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityIdentifier_, v36);

  sub_24EEB82A0((char)objc_msgSend(v4, sel_isSelected));
  objc_msgSend(v4, sel_setNeedsUpdateConstraints);
  return swift_release();
}

void sub_24EEB82A0(char a1)
{
  double v2 = v1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEB8704((uint64_t)&v1[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem], (uint64_t)v23);
  sub_24EEB95AC(v23, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9610);
  swift_release();
  sub_24EEB8704((uint64_t)v23, (uint64_t)v24);
  if (sub_24EEB9674((uint64_t)v24) == 1)
  {
    swift_release();
  }
  else
  {
    id v4 = objc_msgSend(v1, sel_traitCollection);
    objc_super v5 = (void *)sub_24EEDDAA0();

    uint64_t v6 = *MEMORY[0x263F832A0];
    unint64_t v7 = (unint64_t)objc_msgSend(v2, sel_accessibilityTraits);
    unint64_t v8 = v7 & v6;
    if (a1)
    {
      if (v8 == v6) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v6;
      }
      objc_msgSend(v2, sel_setAccessibilityTraits_, v9 | v7);
      uint64_t v10 = v26;
      if (v26)
      {
        uint64_t v11 = v25;
        swift_bridgeObjectRetain();
        sub_24EEB95AC(v23, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
        sub_24EEB8774(v11, v10, *(void **)&v2[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView]);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24EEB95AC(v23, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
      }
      uint64_t v16 = *(void **)&v2[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel];
      id v17 = objc_msgSend(self, sel_labelColor);
      objc_msgSend(v16, sel_setTextColor_, v17);

      id v18 = objc_msgSend(self, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x263F835C8], v5);
    }
    else
    {
      BOOL v12 = v8 == 0;
      uint64_t v13 = -1;
      if (!v12) {
        uint64_t v13 = ~v6;
      }
      objc_msgSend(v2, sel_setAccessibilityTraits_, v13 & v7);
      uint64_t v14 = v26;
      if (v26)
      {
        uint64_t v15 = v25;
        swift_bridgeObjectRetain();
        sub_24EEB95AC(v23, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
        sub_24EEB899C(v15, v14, *(void **)&v2[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView]);
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_24EEB95AC(v23, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EEB9548);
      }
      uint64_t v16 = *(void **)&v2[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel];
      id v19 = objc_msgSend(self, sel_secondaryLabelColor);
      objc_msgSend(v16, sel_setTextColor_, v19);

      id v20 = self;
      uint64_t v21 = *MEMORY[0x263F83578];
      sub_24EEDD7E0();
      uint64_t v22 = (void *)sub_24EEDD7B0();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(v20, sel__preferredFontForTextStyle_design_variant_weight_maximumContentSizeCategory_compatibleWithTraitCollection_, v21, v22, 0, *MEMORY[0x263F83460], v5, *MEMORY[0x263F81820]);
    }
    objc_msgSend(v16, sel_setFont_, v18);
    swift_release();
  }
}

double sub_24EEB86E8(uint64_t a1)
{
  *(void *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_24EEB8704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EEB876C(uint64_t a1)
{
  return sub_24EEB8C28(a1);
}

void sub_24EEB8774(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = objc_msgSend(v3, sel_traitCollection);
  uint64_t v6 = (void *)sub_24EEDDAA0();

  id v7 = objc_msgSend(self, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x263F835C8], v6);
  id v8 = objc_msgSend(self, sel_configurationWithFont_scale_, v7, 2);

  id v9 = v8;
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_24EEDD7B0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v10, v9);

  objc_msgSend(a3, sel_setImage_, v11);
  id v12 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(a3, sel_setTintColor_, v12);
  swift_release();
}

uint64_t sub_24EEB8994(uint64_t a1)
{
  return sub_24EEB8C28(a1);
}

void sub_24EEB899C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = objc_msgSend(v3, sel_traitCollection);
  uint64_t v6 = (void *)sub_24EEDDAA0();

  id v7 = self;
  uint64_t v8 = *MEMORY[0x263F83578];
  sub_24EEDD7E0();
  id v9 = (void *)sub_24EEDD7B0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v7, sel__preferredFontForTextStyle_design_variant_weight_maximumContentSizeCategory_compatibleWithTraitCollection_, v8, v9, 0, *MEMORY[0x263F83460], v6, *MEMORY[0x263F81820]);

  if (v10)
  {
    id v11 = objc_msgSend(self, sel_configurationWithFont_scale_, v10, 2);

    id v12 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_24EEDD7B0();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v13, v12);

    objc_msgSend(a3, sel_setImage_, v14);
    id v15 = objc_msgSend(self, sel_secondaryLabelColor);
    objc_msgSend(a3, sel_setTintColor_, v15);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24EEB8C20(uint64_t a1)
{
  return sub_24EEB8C28(a1);
}

uint64_t sub_24EEB8C28(uint64_t a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v2 = (void *)*MEMORY[0x263F83460];
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
  id v3 = v2;
  sub_24EEDD3C0();
  return swift_release();
}

id TabItemCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TabItemCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_NSRange __swiftcall TabItemCell.accessibilityColumnRange()()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v0 = sub_24EEDD260();
  swift_release();
  NSUInteger v1 = v0;
  NSUInteger v2 = 0;
  result.length = v2;
  result.location = v1;
  return result;
}

_NSRange __swiftcall TabItemCell.accessibilityRowRange()()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount);
  char v2 = *(unsigned char *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount + 8);
  swift_release();
  if ((v2 & 1) != 0 || v1 <= 0)
  {
    uint64_t v1 = 10;
    uint64_t v3 = sub_24EEDD260();
  }
  else
  {
    uint64_t v3 = 0;
  }
  swift_release();
  NSUInteger v4 = v3;
  NSUInteger v5 = v1;
  result.length = v5;
  result.location = v4;
  return result;
}

unint64_t sub_24EEB9174()
{
  unint64_t result = qword_26B1E7640;
  if (!qword_26B1E7640)
  {
    type metadata accessor for UILayoutPriority(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7640);
  }
  return result;
}

unint64_t sub_24EEB91C0()
{
  unint64_t result = qword_26B1E7650;
  if (!qword_26B1E7650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1E7650);
  }
  return result;
}

uint64_t sub_24EEB9200(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7265746E6563 && a2 == 0xE600000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696C69617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t _s13FitnessCoreUI11TabItemCellC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLayoutGuide;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82900]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_imageView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82820]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_stackView;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C00]), sel_init);
  uint64_t v4 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_titleLabel;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  uint64_t v5 = (uint64_t)&v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItem];
  sub_24EEB86E8((uint64_t)v12);
  sub_24EEB8704((uint64_t)v12, v5);
  uint64_t v6 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentCenterXConstraint;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v7 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentLeadingConstraint;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentTrailingConstraint;
  *(void *)&v0[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_contentWidthConstraint;
  *(void *)&v0[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08930]), sel_init);
  id v10 = &v0[OBJC_IVAR____TtC13FitnessCoreUI11TabItemCell_currentItemCount];
  *(void *)id v10 = 0;
  v10[8] = 1;

  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

uint64_t sub_24EEB9548(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_24EEB95AC(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24EEB9610(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24EEB9674(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t *sub_24EEB968C(uint64_t *a1)
{
  uint64_t v2 = a1[17];
  uint64_t v3 = a1[18];
  sub_24EEB9548(*a1, a1[1]);
  sub_24EEB9548(v2, v3);
  return a1;
}

unint64_t sub_24EEB9780()
{
  unint64_t result = qword_269978898;
  if (!qword_269978898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978898);
  }
  return result;
}

uint64_t method lookup function for TabItemCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TabItemCell);
}

uint64_t dispatch thunk of TabItemCell.applyItem(_:at:itemCount:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

ValueMetadata *type metadata accessor for TabItemCell.Position()
{
  return &type metadata for TabItemCell.Position;
}

unsigned char *_s13FitnessCoreUI11TabItemCellC8PositionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEB9908);
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

ValueMetadata *type metadata accessor for TabItemCell.Position.CodingKeys()
{
  return &type metadata for TabItemCell.Position.CodingKeys;
}

ValueMetadata *type metadata accessor for TabItemCell.Position.CenterCodingKeys()
{
  return &type metadata for TabItemCell.Position.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemCell.Position.LeadingCodingKeys()
{
  return &type metadata for TabItemCell.Position.LeadingCodingKeys;
}

ValueMetadata *type metadata accessor for TabItemCell.Position.TrailingCodingKeys()
{
  return &type metadata for TabItemCell.Position.TrailingCodingKeys;
}

unint64_t sub_24EEB9974()
{
  unint64_t result = qword_269978908;
  if (!qword_269978908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978908);
  }
  return result;
}

unint64_t sub_24EEB99CC()
{
  unint64_t result = qword_269978910;
  if (!qword_269978910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978910);
  }
  return result;
}

unint64_t sub_24EEB9A24()
{
  unint64_t result = qword_269978918;
  if (!qword_269978918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978918);
  }
  return result;
}

unint64_t sub_24EEB9A7C()
{
  unint64_t result = qword_269978920;
  if (!qword_269978920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978920);
  }
  return result;
}

unint64_t sub_24EEB9AD4()
{
  unint64_t result = qword_269978928;
  if (!qword_269978928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978928);
  }
  return result;
}

unint64_t sub_24EEB9B2C()
{
  unint64_t result = qword_269978930;
  if (!qword_269978930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978930);
  }
  return result;
}

unint64_t sub_24EEB9B84()
{
  unint64_t result = qword_269978938;
  if (!qword_269978938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978938);
  }
  return result;
}

unint64_t sub_24EEB9BDC()
{
  unint64_t result = qword_269978940;
  if (!qword_269978940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978940);
  }
  return result;
}

unint64_t sub_24EEB9C34()
{
  unint64_t result = qword_269978948;
  if (!qword_269978948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978948);
  }
  return result;
}

uint64_t TabItemDescriptor.isSelectable.getter()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t TabItemDescriptor.accessibilityIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItemDescriptor.accessibilityLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItemDescriptor.isHidden.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

void TabItemDescriptor.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 33);
}

uint64_t TabItemDescriptor.preferredStyle.getter()
{
  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t TabItemDescriptor.systemImageName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TabItemDescriptor.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall TabItemDescriptor.init(accessibilityIdentifier:accessibilityLabel:isHidden:kind:preferredStyle:systemImageName:title:)(FitnessCoreUI::TabItemDescriptor *__return_ptr retstr, Swift::String accessibilityIdentifier, Swift::String accessibilityLabel, Swift::Bool isHidden, FitnessCoreUI::TabItemKind kind, FitnessCoreUI::TabItemStyle preferredStyle, Swift::String_optional systemImageName, Swift::String title)
{
  FitnessCoreUI::TabItemKind v8 = *(unsigned char *)kind;
  retstr->accessibilityIdentifier = accessibilityIdentifier;
  retstr->accessibilityLabel = accessibilityLabel;
  retstr->isHidden = isHidden;
  retstr->kind = v8;
  retstr->preferredStyle = preferredStyle;
  retstr->systemImageName.value._countAndFlagsBits = systemImageName.value._countAndFlagsBits;
  *(Swift::String_optional *)&retstr->systemImageName.value._object = *(Swift::String_optional *)&systemImageName.value._object;
  retstr->title._object = title._object;
}

unint64_t sub_24EEB9D9C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x6E65646469487369;
      break;
    case 3:
      unint64_t result = 1684957547;
      break;
    case 4:
      unint64_t result = 0x6572726566657270;
      break;
    case 5:
      unint64_t result = 0x6D496D6574737973;
      break;
    case 6:
      unint64_t result = 0x656C746974;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24EEB9EA0()
{
  return sub_24EEB9D9C(*v0);
}

uint64_t sub_24EEB9EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEBB1DC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EEB9ED0(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24EEB9EDC(uint64_t a1)
{
  unint64_t v2 = sub_24EEBA1FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEB9F18(uint64_t a1)
{
  unint64_t v2 = sub_24EEBA1FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978950);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v19 = v7;
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 32);
  int v16 = *(unsigned __int8 *)(v1 + 33);
  int v17 = v7;
  int v15 = *(unsigned __int8 *)(v1 + 34);
  uint64_t v8 = *(void *)(v1 + 40);
  v14[2] = *(void *)(v1 + 48);
  void v14[3] = v8;
  uint64_t v9 = *(void *)(v1 + 56);
  v14[0] = *(void *)(v1 + 64);
  v14[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEBA1FC();
  sub_24EEDDFC0();
  char v29 = 0;
  uint64_t v10 = v20;
  sub_24EEDDE30();
  if (!v10)
  {
    char v11 = v16;
    char v12 = v15;
    char v28 = 1;
    sub_24EEDDE30();
    char v27 = 2;
    sub_24EEDDE40();
    char v26 = v11;
    char v25 = 3;
    sub_24EE97644();
    sub_24EEDDE60();
    char v24 = v12;
    char v23 = 4;
    sub_24EEBA250();
    sub_24EEDDE60();
    char v22 = 5;
    sub_24EEDDE20();
    char v21 = 6;
    sub_24EEDDE30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EEBA1FC()
{
  unint64_t result = qword_269978958;
  if (!qword_269978958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978958);
  }
  return result;
}

unint64_t sub_24EEBA250()
{
  unint64_t result = qword_269978960;
  if (!qword_269978960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978960);
  }
  return result;
}

uint64_t TabItemDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978968);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEBA1FC();
  sub_24EEDDFB0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v42 = 0;
  uint64_t v9 = sub_24EEDDDB0();
  uint64_t v11 = v10;
  uint64_t v33 = v9;
  char v41 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24EEDDDB0();
  uint64_t v14 = v13;
  uint64_t v31 = v12;
  uint64_t v32 = v11;
  char v40 = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = v14;
  int v30 = sub_24EEDDDC0();
  char v38 = 3;
  sub_24EE97B84();
  sub_24EEDDDE0();
  int v17 = v39;
  char v36 = 4;
  sub_24EEBA720();
  sub_24EEDDDE0();
  int v29 = v17;
  int v18 = v37;
  char v35 = 5;
  uint64_t v27 = sub_24EEDDDA0();
  int v28 = v18;
  char v34 = 6;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24EEDDDB0();
  uint64_t v23 = v22;
  v30 &= 1u;
  char v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v26 = v21;
  v24(v8, v5);
  uint64_t v25 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)a2 = v33;
  *(void *)(a2 + 8) = v25;
  *(void *)(a2 + 16) = v31;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = v30;
  *(unsigned char *)(a2 + 33) = v29;
  *(unsigned char *)(a2 + 34) = v28;
  *(void *)(a2 + 40) = v27;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v26;
  *(void *)(a2 + 64) = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24EEBA720()
{
  unint64_t result = qword_269978970;
  if (!qword_269978970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978970);
  }
  return result;
}

uint64_t sub_24EEBA774@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TabItemDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EEBA78C(void *a1)
{
  return TabItemDescriptor.encode(to:)(a1);
}

uint64_t TabItemDescriptor.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  swift_bridgeObjectRelease();
  sub_24EEDDF70();
  sub_24EEDDF60();
  sub_24EEDDF60();
  sub_24EEDDF70();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_24EEDD830();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t TabItemDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEBA95C()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEBA9DC()
{
  return sub_24EEDDFA0();
}

uint64_t _s13FitnessCoreUI17TabItemDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 33);
  int v6 = *(unsigned __int8 *)(a1 + 34);
  uint64_t v23 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  int v9 = *(unsigned __int8 *)(a2 + 32);
  int v10 = *(unsigned __int8 *)(a2 + 33);
  int v11 = *(unsigned __int8 *)(a2 + 34);
  uint64_t v20 = *(void *)(a2 + 40);
  uint64_t v21 = *(void *)(a1 + 40);
  uint64_t v22 = *(void *)(a2 + 48);
  uint64_t v16 = *(void *)(a2 + 64);
  uint64_t v17 = *(void *)(a2 + 56);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v12 = sub_24EEDDE90(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (v2 == v8 && v3 == v7)
    {
      uint64_t result = 0;
      if (v4 != v9 || ((v5 ^ v10) & 1) != 0) {
        return result;
      }
    }
    else
    {
      char v14 = sub_24EEDDE90();
      uint64_t result = 0;
      if ((v14 & 1) == 0 || v4 != v9 || v5 != v10) {
        return result;
      }
    }
    if (v6 != v11) {
      return result;
    }
    if (v23)
    {
      if (v22)
      {
        if (v21 != v20 || v23 != v22)
        {
          char v15 = sub_24EEDDE90();
          uint64_t result = 0;
          if ((v15 & 1) == 0) {
            return result;
          }
        }
LABEL_21:
        if (v19 == v17 && v18 == v16) {
          return 1;
        }
        return sub_24EEDDE90();
      }
    }
    else if (!v22)
    {
      goto LABEL_21;
    }
    return 0;
  }
  return result;
}

unint64_t sub_24EEBAC30()
{
  unint64_t result = qword_26B1E74D0;
  if (!qword_26B1E74D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E74D0);
  }
  return result;
}

uint64_t destroy for TabItemDescriptor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TabItemDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TabItemDescriptor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TabItemDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TabItemDescriptor()
{
  return &type metadata for TabItemDescriptor;
}

uint64_t getEnumTagSinglePayload for TabItemDescriptor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TabItemDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEBB09CLL);
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

ValueMetadata *type metadata accessor for TabItemDescriptor.CodingKeys()
{
  return &type metadata for TabItemDescriptor.CodingKeys;
}

unint64_t sub_24EEBB0D8()
{
  unint64_t result = qword_269978978;
  if (!qword_269978978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978978);
  }
  return result;
}

unint64_t sub_24EEBB130()
{
  unint64_t result = qword_269978980;
  if (!qword_269978980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978980);
  }
  return result;
}

unint64_t sub_24EEBB188()
{
  unint64_t result = qword_269978988;
  if (!qword_269978988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978988);
  }
  return result;
}

uint64_t sub_24EEBB1DC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x800000024EEE5CE0 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024EEE5D00 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E65646469487369 && a2 == 0xE800000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6572726566657270 && a2 == 0xEE00656C79745364 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D496D6574737973 && a2 == 0xEF656D614E656761 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t DynamicTypeSize.init(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24EEDD4F0();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(a1, v2);
  if (MEMORY[0x263F18D50] && v4 == *MEMORY[0x263F18D50]) {
    return 1;
  }
  if (MEMORY[0x263F18D18] && v4 == *MEMORY[0x263F18D18]) {
    return 2;
  }
  if (MEMORY[0x263F18D30] && v4 == *MEMORY[0x263F18D30]) {
    return 3;
  }
  if (MEMORY[0x263F18D08] && v4 == *MEMORY[0x263F18D08]) {
    return 4;
  }
  if (MEMORY[0x263F18D40] && v4 == *MEMORY[0x263F18D40]) {
    return 5;
  }
  if (MEMORY[0x263F18D58] && v4 == *MEMORY[0x263F18D58]) {
    return 6;
  }
  if (MEMORY[0x263F18D68] && v4 == *MEMORY[0x263F18D68]) {
    return 7;
  }
  if (MEMORY[0x263F18CC0] && v4 == *MEMORY[0x263F18CC0]) {
    return 8;
  }
  if (MEMORY[0x263F18CD0] && v4 == *MEMORY[0x263F18CD0]) {
    return 9;
  }
  if (MEMORY[0x263F18CE0] && v4 == *MEMORY[0x263F18CE0]) {
    return 10;
  }
  if (MEMORY[0x263F18CE8] && v4 == *MEMORY[0x263F18CE8]) {
    return 11;
  }
  if (MEMORY[0x263F18D00] && v4 == *MEMORY[0x263F18D00]) {
    return 12;
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return 0;
}

uint64_t dispatch thunk of GridLayoutProviding.gridDescriptor(ofKind:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of GridLayoutProviding.itemWidthForGrid(ofKind:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of GridLayoutProviding.itemWidthForGrid(ofKind:inContainerOfWidth:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_24EEBB754()
{
  return sub_24EEDD4A0();
}

uint64_t sub_24EEBB76C()
{
  return sub_24EEDD4B0();
}

uint64_t sub_24EEBB784()
{
  return sub_24EEDD4C0();
}

uint64_t sub_24EEBB7A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E75F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return swift_release();
}

uint64_t View.focusedSection()(uint64_t a1, uint64_t a2)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x25334EAF0](isCurrentExecutor, a1, &type metadata for FocusSection, a2);
  return swift_release();
}

uint64_t sub_24EEBB950()
{
  return swift_getWitnessTable();
}

unint64_t sub_24EEBB9A8()
{
  unint64_t result = qword_26B1E7398;
  if (!qword_26B1E7398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7398);
  }
  return result;
}

ValueMetadata *type metadata accessor for FocusSection()
{
  return &type metadata for FocusSection;
}

uint64_t sub_24EEBBA0C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_24EEE924C, 1);
}

unint64_t sub_24EEBBA2C()
{
  unint64_t result = qword_26B1E75E8;
  if (!qword_26B1E75E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1E75F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E75E8);
  }
  return result;
}

uint64_t FloatingTabBarLayoutProvider.itemSizesByDescriptor(for:in:compatibleWith:)(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  char v12 = (void *)sub_24EEBBBB8(MEMORY[0x263F8EE78]);
  swift_retain();
  id v13 = a2;
  uint64_t v14 = sub_24EEBD15C(v12, a1, v13, a3, a4, a5, a6);
  swift_bridgeObjectRelease();
  swift_release();

  return v14;
}

uint64_t FloatingTabBarLayoutProvider.itemSizes(for:in:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24EEBD56C(a1, a2);
  swift_bridgeObjectRelease();
  return v4;
}

double FloatingTabBarLayoutProvider.contentInsets.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t FloatingTabBarLayoutProvider.deinit()
{
  return v0;
}

uint64_t FloatingTabBarLayoutProvider.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 48, 7);
}

unint64_t sub_24EEBBBB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E76A0);
  uint64_t v2 = (void *)sub_24EEDDD40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 144);
  while (1)
  {
    uint64_t v5 = *(v4 - 13);
    uint64_t v6 = *(v4 - 12);
    uint64_t v7 = *(v4 - 11);
    char v8 = *((unsigned char *)v4 - 80);
    char v9 = *((unsigned char *)v4 - 79);
    char v10 = *((unsigned char *)v4 - 78);
    uint64_t v11 = *(v4 - 9);
    uint64_t v12 = *(v4 - 6);
    uint64_t v13 = *(v4 - 5);
    uint64_t v14 = *(v4 - 4);
    uint64_t v15 = *(v4 - 3);
    uint64_t v16 = *(v4 - 2);
    uint64_t v17 = *(v4 - 1);
    uint64_t v18 = *v4;
    *(void *)&long long v28 = *(v4 - 14);
    *((void *)&v28 + 1) = v5;
    *(void *)&long long v29 = v6;
    *((void *)&v29 + 1) = v7;
    LOBYTE(v30) = v8;
    BYTE1(v30) = v9;
    BYTE2(v30) = v10;
    *((void *)&v30 + 1) = v11;
    long long v31 = *((_OWORD *)v4 - 4);
    uint64_t v32 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24EEBC20C((uint64_t *)&v28);
    if (v20) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v21 = v2[6] + 72 * result;
    long long v22 = v31;
    *(_OWORD *)(v21 + 32) = v30;
    *(_OWORD *)(v21 + 48) = v22;
    *(void *)(v21 + 64) = v32;
    long long v23 = v29;
    *(_OWORD *)uint64_t v21 = v28;
    *(_OWORD *)(v21 + 16) = v23;
    char v24 = (void *)(v2[7] + 48 * result);
    *char v24 = v13;
    v24[1] = v14;
    v24[2] = v15;
    v24[3] = v16;
    v24[4] = v17;
    v24[5] = v18;
    uint64_t v25 = v2[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    v2[2] = v27;
    v4 += 15;
    if (!--v3)
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

unint64_t sub_24EEBBD7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699789A8);
  uint64_t v2 = (void *)sub_24EEDDD40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_24EEBC290((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_24EEBBE88(uint64_t a1)
{
  return sub_24EEBBEB0(a1, &qword_269978990, &qword_269978998, (uint64_t (*)(uint64_t))sub_24EEBC290);
}

unint64_t sub_24EEBBEB0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    char v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_24EEDDD40();
  char v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24EEA4D94(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_24EEBDA94(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

unint64_t sub_24EEBBFE0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699789A0);
  uint64_t v2 = (void *)sub_24EEDDD40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_24EEBC290((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
    if (!--v3)
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

double sub_24EEBC0E0()
{
  return *(double *)(*(void *)v0 + 16);
}

uint64_t sub_24EEBC0F0(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12 = (void *)sub_24EEBBBB8(MEMORY[0x263F8EE78]);
  swift_retain();
  id v13 = a2;
  uint64_t v14 = sub_24EEBD15C(v12, a1, v13, a3, a4, a5, a6);
  swift_bridgeObjectRelease();
  swift_release();

  return v14;
}

uint64_t sub_24EEBC1A8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24EEBD56C(a1, a2);
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_24EEBC20C(uint64_t *a1)
{
  sub_24EEDDF50();
  TabItemDescriptor.hash(into:)();
  uint64_t v2 = sub_24EEDDFA0();
  return sub_24EEBC3B4(a1, v2);
}

unint64_t sub_24EEBC290(uint64_t a1)
{
  sub_24EEDD7E0();
  sub_24EEDDF50();
  sub_24EEDD830();
  uint64_t v2 = sub_24EEDDFA0();
  swift_bridgeObjectRelease();
  return sub_24EEBC5D8(a1, v2);
}

unint64_t sub_24EEBC320(uint64_t a1)
{
  sub_24EEDD7E0();
  sub_24EEDDF50();
  sub_24EEDD830();
  uint64_t v2 = sub_24EEDDFA0();
  swift_bridgeObjectRelease();
  return sub_24EEBC5D8(a1, v2);
}

unint64_t sub_24EEBC3B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  uint64_t v32 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v30 = ~v3;
    uint64_t v31 = *(void *)(v2 + 48);
    uint64_t v34 = *a1;
    uint64_t v33 = a1[1];
    uint64_t v28 = a1[3];
    uint64_t v29 = a1[2];
    int v26 = *((unsigned __int8 *)a1 + 33);
    int v27 = *((unsigned __int8 *)a1 + 32);
    int v25 = *((unsigned __int8 *)a1 + 34);
    uint64_t v23 = a1[5];
    uint64_t v24 = a1[6];
    uint64_t v21 = a1[8];
    uint64_t v22 = a1[7];
    do
    {
      uint64_t v5 = v31 + 72 * v4;
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v6 = *(void *)(v5 + 24);
      int v8 = *(unsigned __int8 *)(v5 + 32);
      int v9 = *(unsigned __int8 *)(v5 + 33);
      int v10 = *(unsigned __int8 *)(v5 + 34);
      uint64_t v12 = *(void *)(v5 + 40);
      uint64_t v11 = *(void *)(v5 + 48);
      uint64_t v14 = *(void *)(v5 + 56);
      uint64_t v13 = *(void *)(v5 + 64);
      BOOL v15 = *(void *)v5 == v34 && *(void *)(v5 + 8) == v33;
      if (!v15 && (sub_24EEDDE90() & 1) == 0) {
        goto LABEL_4;
      }
      if (v7 == v29 && v6 == v28)
      {
        if (((v27 ^ v8) & 1) != 0 || ((v26 ^ v9) & 1) != 0 || v10 != v25) {
          goto LABEL_4;
        }
      }
      else
      {
        if (sub_24EEDDE90() & 1) == 0 || ((v27 ^ v8)) {
          goto LABEL_4;
        }
        if (v26 != v9 || v10 != v25) {
          goto LABEL_4;
        }
      }
      if (v11)
      {
        if (!v24) {
          goto LABEL_4;
        }
        BOOL v18 = v12 == v23 && v11 == v24;
        if (!v18 && (sub_24EEDDE90() & 1) == 0) {
          goto LABEL_4;
        }
      }
      else if (v24)
      {
        goto LABEL_4;
      }
      BOOL v19 = v14 == v22 && v13 == v21;
      if (v19 || (sub_24EEDDE90() & 1) != 0) {
        return v4;
      }
LABEL_4:
      unint64_t v4 = (v4 + 1) & v30;
    }
    while (((*(void *)(v32 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24EEBC5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24EEDD7E0();
    uint64_t v8 = v7;
    if (v6 == sub_24EEDD7E0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24EEDD7E0();
          uint64_t v15 = v14;
          if (v13 == sub_24EEDD7E0() && v15 == v16) {
            break;
          }
          char v18 = sub_24EEDDE90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_24EEBC750(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E76A0);
  char v45 = a2;
  uint64_t v5 = sub_24EEDDD30();
  uint64_t v6 = (void *)v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    char v41 = (void *)(v4 + 64);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v4 + 64);
    int64_t v40 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v42 = v5 + 64;
    unint64_t result = swift_retain();
    int64_t v11 = 0;
    uint64_t v43 = v6;
    uint64_t v44 = v4;
    while (1)
    {
      if (v9)
      {
        uint64_t v47 = (v9 - 1) & v9;
        int64_t v48 = v11;
        unint64_t v15 = __clz(__rbit64(v9)) | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_33:
          __break(1u);
          return result;
        }
        if (v16 >= v40) {
          goto LABEL_26;
        }
        unint64_t v17 = v41[v16];
        int64_t v18 = v11 + 1;
        if (!v17)
        {
          int64_t v18 = v11 + 2;
          if (v11 + 2 >= v40) {
            goto LABEL_26;
          }
          unint64_t v17 = v41[v18];
          if (!v17)
          {
            uint64_t v19 = v11 + 3;
            if (v11 + 3 >= v40)
            {
LABEL_26:
              swift_release();
              if (v45)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v4 + 32);
                if (v38 > 63) {
                  bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v41 = -1 << v38;
                }
                *(void *)(v4 + 16) = 0;
              }
              break;
            }
            unint64_t v17 = v41[v19];
            if (!v17)
            {
              while (1)
              {
                int64_t v18 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_33;
                }
                if (v18 >= v40) {
                  goto LABEL_26;
                }
                unint64_t v17 = v41[v18];
                ++v19;
                if (v17) {
                  goto LABEL_23;
                }
              }
            }
            int64_t v18 = v11 + 3;
          }
        }
LABEL_23:
        uint64_t v47 = (v17 - 1) & v17;
        int64_t v48 = v18;
        unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
      }
      uint64_t v20 = *(void *)(v4 + 56);
      uint64_t v21 = *(void *)(v4 + 48) + 72 * v15;
      uint64_t v23 = *(void *)v21;
      uint64_t v22 = *(void *)(v21 + 8);
      uint64_t v24 = *(void *)(v21 + 16);
      uint64_t v25 = *(void *)(v21 + 24);
      char v26 = *(unsigned char *)(v21 + 32);
      char v27 = *(unsigned char *)(v21 + 33);
      char v28 = *(unsigned char *)(v21 + 34);
      uint64_t v29 = *(void *)(v21 + 48);
      uint64_t v46 = *(void *)(v21 + 40);
      uint64_t v30 = *(void *)(v21 + 64);
      uint64_t v49 = *(void *)(v21 + 56);
      uint64_t v31 = (uint64_t *)(v20 + 48 * v15);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      uint64_t v35 = v31[2];
      uint64_t v34 = v31[3];
      uint64_t v37 = v31[4];
      uint64_t v36 = v31[5];
      if ((v45 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_24EEDDF50();
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      sub_24EEDDF70();
      sub_24EEDDF60();
      sub_24EEDDF60();
      char v50 = v28;
      sub_24EEDDF70();
      if (v29)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = v46;
        sub_24EEDD830();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v12 = v46;
      }
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      sub_24EEDDFA0();
      uint64_t v6 = v43;
      unint64_t result = sub_24EEDDBB0();
      *(void *)(v42 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      uint64_t v13 = v43[6] + 72 * result;
      *(void *)uint64_t v13 = v23;
      *(void *)(v13 + 8) = v22;
      *(void *)(v13 + 16) = v24;
      *(void *)(v13 + 24) = v25;
      *(unsigned char *)(v13 + 32) = v26;
      *(unsigned char *)(v13 + 33) = v27;
      *(unsigned char *)(v13 + 34) = v50;
      *(void *)(v13 + 40) = v12;
      *(void *)(v13 + 48) = v29;
      *(void *)(v13 + 56) = v49;
      *(void *)(v13 + 64) = v30;
      uint64_t v14 = (void *)(v43[7] + 48 * result);
      *uint64_t v14 = v33;
      v14[1] = v32;
      v14[2] = v35;
      void v14[3] = v34;
      void v14[4] = v37;
      v14[5] = v36;
      ++v43[2];
      uint64_t v4 = v44;
      unint64_t v9 = v47;
      int64_t v11 = v48;
    }
  }
  unint64_t result = swift_release();
  *unsigned __int8 v39 = v6;
  return result;
}

void *sub_24EEBCB4C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E76A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EEDDD20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v34 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v34 >= v13) {
      goto LABEL_26;
    }
    unint64_t v35 = *(void *)(v6 + 8 * v34);
    ++v9;
    if (!v35)
    {
      int64_t v9 = v34 + 1;
      if (v34 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v35 = *(void *)(v6 + 8 * v9);
      if (!v35) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v35 - 1) & v35;
    unint64_t v15 = __clz(__rbit64(v35)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 72 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 72 * v15;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v19 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v17 + 24);
    char v21 = *(unsigned char *)(v17 + 32);
    char v22 = *(unsigned char *)(v17 + 33);
    char v23 = *(unsigned char *)(v17 + 34);
    uint64_t v24 = *(void *)(v17 + 40);
    uint64_t v25 = *(void *)(v17 + 64);
    uint64_t v26 = 48 * v15;
    char v27 = (long long *)(*(void *)(v2 + 56) + v26);
    uint64_t v28 = *(void *)(v4 + 48) + v16;
    long long v29 = *(_OWORD *)(v17 + 48);
    long long v30 = *v27;
    long long v31 = v27[1];
    long long v32 = v27[2];
    *(void *)uint64_t v28 = *(void *)v17;
    *(void *)(v28 + 8) = v18;
    *(void *)(v28 + 16) = v19;
    *(void *)(v28 + 24) = v20;
    *(unsigned char *)(v28 + 32) = v21;
    *(unsigned char *)(v28 + 33) = v22;
    *(unsigned char *)(v28 + 34) = v23;
    *(void *)(v28 + 40) = v24;
    *(_OWORD *)(v28 + 48) = v29;
    *(void *)(v28 + 64) = v25;
    uint64_t v33 = (_OWORD *)(*(void *)(v4 + 56) + v26);
    *uint64_t v33 = v30;
    v33[1] = v31;
    v33[2] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v36 = v34 + 2;
  if (v36 >= v13) {
    goto LABEL_26;
  }
  unint64_t v35 = *(void *)(v6 + 8 * v36);
  if (v35)
  {
    int64_t v9 = v36;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v35 = *(void *)(v6 + 8 * v9);
    ++v36;
    if (v35) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_24EEBCD70(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 34);
  if (v3 != 2 && *(void *)(a1 + 48) != 0)
  {
    uint64_t v5 = self;
    uint64_t v6 = *MEMORY[0x263F835C8];
    uint64_t v7 = *MEMORY[0x263F83460];
    swift_bridgeObjectRetain();
    id v8 = objc_msgSend(v5, sel__preferredFontForTextStyle_maximumContentSizeCategory_compatibleWithTraitCollection_, v6, v7, a2);
    if (!v8)
    {
      __break(1u);
      return;
    }
    int64_t v9 = v8;
    objc_msgSend(v8, sel_pointSize);
    double v11 = v10;

    id v12 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 5, 2, v11);
    int64_t v13 = (void *)sub_24EEDD7B0();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v13, v12);

    if (v14)
    {
      objc_msgSend(v14, sel_size);
      objc_msgSend(a2, sel_displayScale);
      objc_msgSend(a2, sel_displayScale);
    }
  }
  if (v3 != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7718);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24EEDFB10;
    uint64_t v16 = (void *)*MEMORY[0x263F814E8];
    *(void *)(inited + 32) = *MEMORY[0x263F814E8];
    uint64_t v17 = self;
    uint64_t v18 = *MEMORY[0x263F835C8];
    uint64_t v19 = *MEMORY[0x263F83460];
    swift_bridgeObjectRetain();
    id v20 = v16;
    id v21 = objc_msgSend(v17, sel__preferredFontForTextStyle_maximumContentSizeCategory_compatibleWithTraitCollection_, v18, v19, a2);
    *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7688);
    *(void *)(inited + 40) = v21;
    sub_24EEBBEB0(inited, &qword_26B1E76A8, &qword_26B1E7670, (uint64_t (*)(uint64_t))sub_24EEBC320);
    id v22 = objc_allocWithZone(MEMORY[0x263F086A8]);
    char v23 = (void *)sub_24EEDD7B0();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_24EEBDAA4();
    uint64_t v24 = (void *)sub_24EEDD750();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v22, sel_initWithString_attributes_, v23, v24);

    objc_msgSend(v25, sel_boundingRectWithSize_options_context_, 0, 0, INFINITY, INFINITY);
    objc_msgSend(a2, sel_displayScale);
    objc_msgSend(a2, sel_displayScale);
  }
}

uint64_t sub_24EEBD15C(void *a1, uint64_t a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v69 = a3;
  uint64_t v58 = a2 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(a2 + 56);
  int64_t v59 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v14 << 6);
    }
    else
    {
      int64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_51;
      }
      if (v18 >= v59)
      {
LABEL_48:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v19 = *(void *)(v58 + 8 * v18);
      ++v14;
      if (!v19)
      {
        int64_t v14 = v18 + 1;
        if (v18 + 1 >= v59) {
          goto LABEL_48;
        }
        unint64_t v19 = *(void *)(v58 + 8 * v14);
        if (!v19)
        {
          int64_t v14 = v18 + 2;
          if (v18 + 2 >= v59) {
            goto LABEL_48;
          }
          unint64_t v19 = *(void *)(v58 + 8 * v14);
          if (!v19)
          {
            int64_t v14 = v18 + 3;
            if (v18 + 3 >= v59) {
              goto LABEL_48;
            }
            unint64_t v19 = *(void *)(v58 + 8 * v14);
            if (!v19)
            {
              int64_t v20 = v18 + 4;
              if (v20 >= v59) {
                goto LABEL_48;
              }
              unint64_t v19 = *(void *)(v58 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_52;
                  }
                  if (v14 >= v59) {
                    goto LABEL_48;
                  }
                  unint64_t v19 = *(void *)(v58 + 8 * v14);
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
      }
LABEL_23:
      unint64_t v13 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    uint64_t v21 = *(void *)(a2 + 48) + 72 * v17;
    long long v64 = *(_OWORD *)v21;
    long long v23 = *(_OWORD *)(v21 + 32);
    long long v22 = *(_OWORD *)(v21 + 48);
    long long v24 = *(_OWORD *)(v21 + 16);
    uint64_t v68 = *(void *)(v21 + 64);
    long long v66 = v23;
    long long v67 = v22;
    long long v65 = v24;
    long long v25 = *(_OWORD *)(v21 + 48);
    v62[2] = *(_OWORD *)(v21 + 32);
    v62[3] = v25;
    uint64_t v63 = *(void *)(v21 + 64);
    long long v26 = *(_OWORD *)(v21 + 16);
    v62[0] = *(_OWORD *)v21;
    v62[1] = v26;
    swift_bridgeObjectRetain();
    sub_24EEA2830((uint64_t)&v64);
    sub_24EEBCD70((uint64_t)v62, v69);
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    int v31 = BYTE2(v66);
    v70.origin.CGFloat x = a4;
    v70.origin.CGFloat y = a5;
    v70.size.double width = a6;
    v70.size.CGFloat height = a7;
    CGFloat Width = CGRectGetWidth(v70);
    BOOL v33 = Width < 335.0;
    if (Width >= 335.0) {
      double v34 = 16.0;
    }
    else {
      double v34 = 8.0;
    }
    double v35 = 14.0;
    if (v33) {
      double v35 = 8.0;
    }
    double v36 = 10.0;
    if (!v33) {
      double v36 = 16.0;
    }
    double v37 = v31 == 1 ? v35 : v36;
    double v38 = v31 == 1 ? v34 : v36;
    sub_24EEA2830((uint64_t)&v64);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v62[0] = a1;
    unint64_t v41 = sub_24EEBC20C((uint64_t *)&v64);
    uint64_t v42 = a1[2];
    BOOL v43 = (v40 & 1) == 0;
    uint64_t v44 = v42 + v43;
    if (__OFADD__(v42, v43)) {
      break;
    }
    char v45 = v40;
    if (a1[3] >= v44)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        int64_t v48 = *(void **)&v62[0];
        if (v40) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24EEBCB4C();
        int64_t v48 = *(void **)&v62[0];
        if (v45) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24EEBC750(v44, isUniquelyReferenced_nonNull_native);
      unint64_t v46 = sub_24EEBC20C((uint64_t *)&v64);
      if ((v45 & 1) != (v47 & 1)) {
        goto LABEL_53;
      }
      unint64_t v41 = v46;
      int64_t v48 = *(void **)&v62[0];
      if (v45)
      {
LABEL_4:
        uint64_t v15 = v48[7] + 48 * v41;
        *(void *)uint64_t v15 = v28;
        *(void *)(v15 + 8) = v30;
        *(void *)(v15 + 16) = 0x4018000000000000;
        *(double *)(v15 + 24) = v37;
        *(void *)(v15 + 32) = 0x4018000000000000;
        *(double *)(v15 + 40) = v38;
        goto LABEL_5;
      }
    }
    v48[(v41 >> 6) + 8] |= 1 << v41;
    uint64_t v49 = v48[6] + 72 * v41;
    *(_OWORD *)uint64_t v49 = v64;
    long long v50 = v65;
    long long v51 = v66;
    long long v52 = v67;
    *(void *)(v49 + 64) = v68;
    *(_OWORD *)(v49 + 32) = v51;
    *(_OWORD *)(v49 + 48) = v52;
    *(_OWORD *)(v49 + 16) = v50;
    uint64_t v53 = v48[7] + 48 * v41;
    *(void *)uint64_t v53 = v28;
    *(void *)(v53 + 8) = v30;
    *(void *)(v53 + 16) = 0x4018000000000000;
    *(double *)(v53 + 24) = v37;
    *(void *)(v53 + 32) = 0x4018000000000000;
    *(double *)(v53 + 40) = v38;
    uint64_t v54 = v48[2];
    BOOL v55 = __OFADD__(v54, 1);
    uint64_t v56 = v54 + 1;
    if (v55) {
      goto LABEL_50;
    }
    v48[2] = v56;
    sub_24EEA2830((uint64_t)&v64);
LABEL_5:
    swift_bridgeObjectRelease();
    sub_24EEA2888((uint64_t)&v64);
    sub_24EEA2888((uint64_t)&v64);
    swift_bridgeObjectRelease();
    a1 = v48;
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = sub_24EEDDEC0();
  __break(1u);
  return result;
}

uint64_t sub_24EEBD56C(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_24EEB2C50(0, v2, 0);
  uint64_t v3 = v25;
  for (uint64_t i = a1 + 32; ; i += 72)
  {
    long long v7 = *(_OWORD *)(i + 48);
    v23[2] = *(_OWORD *)(i + 32);
    v23[3] = v7;
    uint64_t v24 = *(void *)(i + 64);
    long long v8 = *(_OWORD *)(i + 16);
    v23[0] = *(_OWORD *)i;
    v23[1] = v8;
    uint64_t v9 = *(void *)(a2 + 16);
    sub_24EEA2830((uint64_t)v23);
    if (!v9) {
      break;
    }
    sub_24EEA2830((uint64_t)v23);
    unint64_t v10 = sub_24EEBC20C((uint64_t *)v23);
    if ((v11 & 1) == 0)
    {
      sub_24EEA2888((uint64_t)v23);
      break;
    }
    uint64_t v12 = (uint64_t *)(*(void *)(a2 + 56) + 48 * v10);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = v12[2];
    uint64_t v16 = v12[3];
    uint64_t v17 = v12[4];
    uint64_t v18 = v12[5];
    sub_24EEA2888((uint64_t)v23);
    sub_24EEA2888((uint64_t)v23);
    uint64_t v25 = v3;
    unint64_t v20 = *(void *)(v3 + 16);
    unint64_t v19 = *(void *)(v3 + 24);
    if (v20 >= v19 >> 1)
    {
      sub_24EEB2C50(v19 > 1, v20 + 1, 1);
      uint64_t v3 = v25;
    }
    *(void *)(v3 + 16) = v20 + 1;
    uint64_t v21 = (void *)(v3 + 48 * v20);
    v21[4] = v13;
    v21[5] = v14;
    v21[6] = v15;
    v21[7] = v16;
    v21[8] = v17;
    v21[9] = v18;
    if (!--v2) {
      return v3;
    }
  }
  sub_24EEA2830((uint64_t)v23);
  sub_24EEDDBE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24EEDD860();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

char *_s13FitnessCoreUI28FloatingTabBarLayoutProviderC11minimumSize5using14compatibleWithSo6CGSizeVSayAA0e4ItemJ0VG_So17UITraitCollectionCSgtF_0(char *result, void *a2)
{
  unint64_t v2 = *((void *)result + 2);
  if (v2)
  {
    uint64_t v4 = (double *)&result[48 * v2 - 24];
    uint64_t result = (char *)swift_bridgeObjectRetain();
    unint64_t v5 = 0;
    uint64_t v6 = (double *)(result + 56);
    double v7 = 0.0;
    double v8 = 0.0;
    while (1)
    {
      double v10 = *(v6 - 3);
      double v9 = *(v6 - 2);
      double v12 = *(v6 - 1);
      double v11 = *v6;
      double v13 = v6[1];
      double v14 = v6[2];
      unint64_t v15 = v5 + 1;
      if (v5)
      {
        if (v2 - 1 == v5)
        {
          double v16 = *v4;
          if (qword_26B1E7390 != -1)
          {
            double v37 = v6[1];
            double v40 = *(v6 - 2);
            uint64_t result = (char *)swift_once();
            double v13 = v37;
            double v9 = v40;
          }
          char v17 = qword_26B1E7388 | 8;
          if (v16 > v11) {
            double v18 = v16;
          }
          else {
            double v18 = v11;
          }
          if ((qword_26B1E7388 & 2) == 0) {
            double v18 = -0.0;
          }
          double v19 = v10 + v18;
          if (v14 < 0.0) {
            double v20 = 0.0;
          }
          else {
            double v20 = v14;
          }
          double v21 = v20 + v19;
        }
        else
        {
          if (v15 >= v2)
          {
            __break(1u);
            return result;
          }
          double v25 = *(v6 - 4);
          double v26 = v6[6];
          if (qword_26B1E7390 != -1)
          {
            double v38 = v6[1];
            double v41 = *(v6 - 2);
            uint64_t result = (char *)swift_once();
            double v13 = v38;
            double v9 = v41;
          }
          char v17 = 8;
          if ((qword_26B1E7388 & 0xFFFFFFFFFFFFFFF7) != 0) {
            char v17 = qword_26B1E7388 | 8;
          }
          if (v25 > v11) {
            double v27 = v25;
          }
          else {
            double v27 = v11;
          }
          if ((v17 & 2) == 0) {
            double v27 = -0.0;
          }
          double v28 = v10 + v27;
          if (v26 > v14) {
            double v29 = v26;
          }
          else {
            double v29 = v14;
          }
          double v21 = v29 + v28;
        }
      }
      else
      {
        double v22 = 0.0;
        if (v2 != 1) {
          double v22 = v6[6];
        }
        if (qword_26B1E7380 != -1)
        {
          double v36 = v6[1];
          double v39 = *(v6 - 2);
          uint64_t result = (char *)swift_once();
          double v13 = v36;
          double v9 = v39;
        }
        char v17 = qword_26B1E7378;
        if (v11 < 0.0) {
          double v23 = 0.0;
        }
        else {
          double v23 = v11;
        }
        if ((qword_26B1E7378 & 2) == 0) {
          double v23 = -0.0;
        }
        double v21 = v10 + v23;
        if (v2 == 1)
        {
          if (v14 < 0.0) {
            double v24 = 0.0;
          }
          else {
            double v24 = v14;
          }
          if ((qword_26B1E7378 & 8) == 0) {
            goto LABEL_53;
          }
        }
        else
        {
          if (v22 > v14) {
            double v24 = v22;
          }
          else {
            double v24 = v14;
          }
          if ((qword_26B1E7378 & 8) == 0) {
            goto LABEL_53;
          }
        }
        double v21 = v24 + v21;
      }
LABEL_53:
      double v30 = -0.0;
      if ((v17 & 4) != 0) {
        double v31 = v12;
      }
      else {
        double v31 = -0.0;
      }
      double v32 = v9 + v31;
      if (v17) {
        double v30 = v13;
      }
      double v33 = v30 + v32;
      if (a2)
      {
        objc_msgSend(a2, sel_displayScale);
        if (v34 > 0.0) {
          double v21 = ceil(v21 * v34) / v34;
        }
        uint64_t result = (char *)objc_msgSend(a2, sel_displayScale);
        if (v35 > 0.0) {
          double v33 = ceil(v33 * v35) / v35;
        }
      }
      if (v33 > v8) {
        double v8 = v33;
      }
      double v7 = v7 + v21;
      v6 += 6;
      unint64_t v5 = v15;
      if (v2 == v15) {
        return (char *)swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for FloatingTabBarLayoutProvider()
{
  return self;
}

uint64_t method lookup function for FloatingTabBarLayoutProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FloatingTabBarLayoutProvider);
}

_OWORD *sub_24EEBDA94(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24EEBDAA4()
{
  unint64_t result = qword_26B1E7658;
  if (!qword_26B1E7658)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7658);
  }
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24EE90130(0, &qword_2699789B0);
  uint64_t v4 = sub_24EEDD270();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4, v6);
  uint64_t v8 = sub_24EEDDAB0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t MarqueeLabel.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

id MarqueeLabel.makeUIView(context:)()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  swift_release();
  return v0;
}

double MarqueeLabel.sizeThatFits(_:uiView:context:)(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v10 = 10.0;
  if (a2) {
    double v11 = 10.0;
  }
  else {
    double v11 = *(double *)&a1;
  }
  if ((a4 & 1) == 0) {
    double v10 = *(double *)&a3;
  }
  objc_msgSend(a5, sel_sizeThatFits_, v11, v10);
  double v13 = v12;
  swift_release();
  if (v11 >= v13) {
    return v13;
  }
  else {
    return v11;
  }
}

uint64_t MarqueeLabel.updateUIView(_:context:)(void *a1)
{
  id v49 = a1;
  long long v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  int v4 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v5 = sub_24EEDD9B0();
  uint64_t v6 = sub_24EEDD9A0();
  uint64_t v41 = v5;
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = sub_24EEDD560();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = v9;
  double v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699789B8);
  sub_24EEDD660();
  uint64_t v11 = sub_24EEDD530();
  double v12 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v52 = v8 + 8;
  uint64_t v53 = v7;
  long long v50 = v12;
  uint64_t v13 = ((uint64_t (*)(char *, uint64_t))v12)(v10, v7);
  BOOL v43 = v2;
  uint64_t v44 = v6;
  uint64_t v40 = v3;
  int v42 = v4;
  if (v11)
  {
    uint64_t v14 = v11;
  }
  else
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v14 = sub_24EEDD6A0();
    uint64_t v13 = swift_release();
  }
  unint64_t v46 = &v39;
  uint64_t v15 = v51;
  MEMORY[0x270FA5388](v13);
  unint64_t v47 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v16 = (char *)&v39 - v47;
  sub_24EEDD660();
  uint64_t v17 = sub_24EEDD6B0();
  char v45 = &v39;
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  double v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD510();
  double v21 = v16;
  uint64_t v22 = v53;
  double v23 = v50;
  v50(v21, v53);
  uint64_t v48 = v14;
  double v24 = (void *)sub_24EEDD690();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  id v25 = v49;
  objc_msgSend(v49, sel_setFont_, v24);

  MEMORY[0x270FA5388](v26);
  double v27 = (char *)&v39 - v47;
  sub_24EEDD660();
  uint64_t v28 = sub_24EEDD520();
  v23(v27, v22);
  if (v28)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EE90130(0, &qword_2699789C0);
    swift_retain();
    double v29 = (void *)sub_24EEDDB10();
    swift_release();
    swift_release();
    double v30 = v43;
    char v31 = v42;
  }
  else
  {
    double v29 = 0;
    double v30 = v43;
    char v31 = v42;
  }
  objc_msgSend(v25, sel_setTextColor_, v29);

  if (v31)
  {
    id v32 = objc_msgSend(v25, sel_setAttributedText_, v30);
  }
  else
  {
    uint64_t v33 = v40;
    swift_bridgeObjectRetain();
    double v34 = (void *)sub_24EEDD7B0();
    sub_24EEBE350(v30, v33, 0);
    objc_msgSend(v25, sel_setText_, v34);
  }
  MEMORY[0x270FA5388](v32);
  double v36 = (char *)&v39 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD660();
  char v37 = sub_24EEDD540();
  v50(v36, v53);
  objc_msgSend(v25, sel_setMarqueeRunning_, v37 & 1);
  swift_release();
  return swift_release();
}

void sub_24EEBE350(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_24EEBE364()
{
  unint64_t result = qword_2699789C8;
  if (!qword_2699789C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699789C8);
  }
  return result;
}

id sub_24EEBE3B8()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  objc_msgSend(v0, sel_setMarqueeEnabled_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  swift_release();
  return v0;
}

uint64_t sub_24EEBE484()
{
  return sub_24EEDD5A0();
}

uint64_t sub_24EEBE49C()
{
  return sub_24EEDD5B0();
}

uint64_t sub_24EEBE4B4()
{
  return sub_24EEDD640();
}

uint64_t sub_24EEBE4CC()
{
  return sub_24EEDD5E0();
}

double sub_24EEBE4E4(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  return MarqueeLabel.sizeThatFits(_:uiView:context:)(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_24EEBE518()
{
  return sub_24EEDD600();
}

uint64_t sub_24EEBE530()
{
  return sub_24EEDD5F0();
}

uint64_t sub_24EEBE548()
{
  return sub_24EEDD610();
}

uint64_t sub_24EEBE560()
{
  return sub_24EEDD5D0();
}

uint64_t sub_24EEBE578()
{
  return MEMORY[0x263F1BB60];
}

uint64_t sub_24EEBE584()
{
  return sub_24EEDD630();
}

uint64_t sub_24EEBE5DC()
{
  return sub_24EEDD5C0();
}

void sub_24EEBE634()
{
}

id sub_24EEBE660(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel()
{
  return &type metadata for MarqueeLabel;
}

void destroy for MarqueeLabel.Content(uint64_t a1)
{
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24EEBE660(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24EEBE660(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24EEBE350(v6, v7, v8);
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24EEBE350(v4, v5, v6);
  return a1;
}

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s13FitnessCoreUI12MarqueeLabelV7ContentOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24EEBE82C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24EEBE834(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel.Content()
{
  return &type metadata for MarqueeLabel.Content;
}

unint64_t sub_24EEBE850()
{
  unint64_t result = qword_2699789D0;
  if (!qword_2699789D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699789D0);
  }
  return result;
}

uint64_t Text.init(localizing:bundle:locale:comment:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a1;
  uint64_t v21 = a5;
  uint64_t v8 = sub_24EEDD7A0();
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8, v10);
  uint64_t v12 = sub_24EEDD280();
  uint64_t v13 = *(void *)(v12 - 8);
  double v14 = MEMORY[0x270FA5388](v12);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))((char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v12, v14);
  id v16 = a2;
  uint64_t v17 = sub_24EEDD810();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v20, v8);
  return v17;
}

uint64_t dispatch thunk of AppLayoutProviding.gridProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24EEBEAC4(unint64_t a1)
{
  uint64_t v3 = sub_24EEDD9B0();
  uint64_t v4 = sub_24EEDD9A0();
  uint64_t v36 = v3;
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEBFE9C();
  uint64_t v5 = (void *)sub_24EEDD930();
  v41.receiver = v1;
  v41.super_class = (Class)type metadata accessor for FloatingLayout();
  objc_msgSendSuper2(&v41, sel_prepareForCollectionViewUpdates_, v5);

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24EEDDD10();
    uint64_t v6 = result;
    uint64_t v31 = v4;
    id v32 = v1;
    if (result) {
      goto LABEL_5;
    }
LABEL_32:
    uint64_t v38 = MEMORY[0x263F8EE78];
LABEL_33:
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_24EEC20AC(v38);
    swift_bridgeObjectRelease();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)&v32[OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths] = v30;
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v31 = v4;
  id v32 = v1;
  if (!v6) {
    goto LABEL_32;
  }
LABEL_5:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v38 = MEMORY[0x263F8EE78];
    unint64_t v33 = a1 & 0xC000000000000001;
    uint64_t v34 = v6;
    unint64_t v35 = a1;
    while (1)
    {
      if (v33) {
        id v9 = (id)MEMORY[0x25334EFF0](v8, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      double v10 = v9;
      uint64_t v11 = sub_24EEDD2E0();
      uint64_t v39 = &v31;
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = *(void *)(v12 + 64);
      MEMORY[0x270FA5388](v11);
      char v37 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
      uint64_t v40 = &v31;
      uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
      MEMORY[0x270FA5388](v14 - 8);
      id v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v17 = (char *)objc_msgSend(v10, sel_updateAction, v31);
      if ((unint64_t)(v17 - 2) >= 3)
      {
        if (!v17)
        {
          id v18 = objc_msgSend(v10, sel_indexPathAfterUpdate);
          goto LABEL_20;
        }
        if (v17 == (char *)1)
        {
          id v18 = objc_msgSend(v10, sel_indexPathBeforeUpdate);
LABEL_20:
          id v19 = v18;
          MEMORY[0x270FA5388](v19);
          uint64_t v20 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (v21)
          {
            sub_24EEDD2A0();

            uint64_t v22 = 0;
          }
          else
          {
            uint64_t v22 = 1;
          }
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v20, v22, 1, v11);
          sub_24EEB4FB0((uint64_t)v20, (uint64_t)v16);

          swift_release();
          goto LABEL_25;
        }
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v11);

      swift_release();
LABEL_25:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v16, 1, v11) == 1)
      {
        sub_24EEBFEDC((uint64_t)v16);
      }
      else
      {
        double v23 = *(uint64_t (**)(char *, char *, uint64_t))(v12 + 32);
        double v24 = v37;
        uint64_t v25 = v23(v37, v16, v11);
        double v26 = MEMORY[0x270FA5388](v25);
        ((void (*)(char *, char *, uint64_t, double))v23)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v11, v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v38 = sub_24EED5CDC(0, *(void *)(v38 + 16) + 1, 1, v38);
        }
        unint64_t v28 = *(void *)(v38 + 16);
        unint64_t v27 = *(void *)(v38 + 24);
        if (v28 >= v27 >> 1) {
          uint64_t v38 = sub_24EED5CDC(v27 > 1, v28 + 1, 1, v38);
        }
        uint64_t v29 = v38;
        *(void *)(v38 + 16) = v28 + 1;
        v23((char *)(v29+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v28), (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
      }
      ++v8;
      a1 = v35;
      if (v34 == v8) {
        goto LABEL_33;
      }
    }
  }
  __break(1u);
  return result;
}

id sub_24EEBF188(uint64_t a1)
{
  long long v2 = v1;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = (void *)sub_24EEDD290();
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for FloatingLayout();
  id v5 = objc_msgSendSuper2(&v10, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);

  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths];
  swift_bridgeObjectRetain();
  swift_release();
  char v7 = sub_24EEBF354(a1, v6);
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0 && v5)
  {
    objc_msgSend(v5, sel_setAlpha_, 0.0);
    CGAffineTransformMakeScale(&v9, 0.2, 0.2);
    objc_msgSend(v5, sel_setTransform_, &v9);
    objc_msgSend(v5, sel_setZIndex_, 1);
  }
  swift_release();
  return v5;
}

uint64_t sub_24EEBF354(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v4 = sub_24EEDD2E0(),
        sub_24EEBFE58(&qword_26B1E7360),
        uint64_t v5 = sub_24EEDD760(),
        uint64_t v6 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v7 = v5 & ~v6,
        uint64_t v18 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0))
  {
    uint64_t v17 = a1;
    uint64_t v15 = ~v6;
    uint64_t v8 = *(void **)(v4 - 8);
    id v16 = (void (*)(char *, unint64_t, uint64_t, double))v8[2];
    uint64_t v9 = v8[8];
    uint64_t v10 = v8[9];
    uint64_t v11 = (uint64_t (**)(char *, uint64_t))(v8 + 1);
    do
    {
      double v12 = MEMORY[0x270FA5388](v5);
      v16((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(a2 + 48) + v10 * v7, v4, v12);
      sub_24EEBFE58(&qword_269978A58);
      char v13 = sub_24EEDD790();
      uint64_t v5 = (*v11)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      if (v13) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v15;
    }
    while (((*(void *)(v18 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

BOOL sub_24EEBF50C(uint64_t a1, double a2, double a3)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  sub_24EEDDF50();
  sub_24EE97F98();
  uint64_t v6 = sub_24EEDDFA0();
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(a1 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
    return 0;
  }
  uint64_t v9 = ~v7;
  do
  {
    uint64_t v10 = (double *)(*(void *)(a1 + 48) + 16 * v8);
    double v11 = v10[1];
    BOOL v12 = *v10 == a2;
    BOOL result = v11 == a3 && v12;
    if (result) {
      break;
    }
    unint64_t v8 = (v8 + 1) & v9;
  }
  while (((*(void *)(a1 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  return result;
}

id sub_24EEBF904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v6 = (void *)v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  return v6;
}

id sub_24EEBFD70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingLayout();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FloatingLayout()
{
  return self;
}

uint64_t sub_24EEBFDD8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24EEBFE10()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
  return v1;
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24EEBFE58(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EEDD2E0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EEBFE9C()
{
  unint64_t result = qword_26B1E7680;
  if (!qword_26B1E7680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1E7680);
  }
  return result;
}

uint64_t sub_24EEBFEDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EEBFF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_24EEDDF50();
  swift_bridgeObjectRetain();
  TabItemDescriptor.hash(into:)();
  uint64_t v6 = sub_24EEDDFA0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  uint64_t v51 = v5 + 56;
  uint64_t v38 = a2;
  uint64_t v39 = a1;
  char v37 = v2;
  if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v49 = ~v7;
    uint64_t v50 = *(void *)(v5 + 48);
    uint64_t v52 = *(void *)(a2 + 8);
    uint64_t v53 = *(void *)a2;
    uint64_t v47 = *(void *)(a2 + 24);
    uint64_t v48 = *(void *)(a2 + 16);
    int v45 = *(unsigned __int8 *)(a2 + 33);
    int v46 = *(unsigned __int8 *)(a2 + 32);
    int v44 = *(unsigned __int8 *)(a2 + 34);
    uint64_t v42 = *(void *)(a2 + 56);
    uint64_t v43 = *(void *)(a2 + 48);
    uint64_t v40 = *(void *)(a2 + 40);
    uint64_t v41 = *(void *)(a2 + 64);
    do
    {
      uint64_t v9 = v50 + 72 * v8;
      uint64_t v10 = *(void *)(v9 + 16);
      uint64_t v11 = *(void *)(v9 + 24);
      int v12 = *(unsigned __int8 *)(v9 + 32);
      int v13 = *(unsigned __int8 *)(v9 + 33);
      int v14 = *(unsigned __int8 *)(v9 + 34);
      uint64_t v15 = *(void *)(v9 + 40);
      uint64_t v16 = *(void *)(v9 + 48);
      uint64_t v18 = *(void *)(v9 + 56);
      uint64_t v17 = *(void *)(v9 + 64);
      BOOL v19 = *(void *)v9 == v53 && *(void *)(v9 + 8) == v52;
      if (!v19 && (sub_24EEDDE90() & 1) == 0) {
        goto LABEL_4;
      }
      if (v10 == v48 && v11 == v47)
      {
        if (((v46 ^ v12) & 1) != 0 || ((v45 ^ v13) & 1) != 0 || v14 != v44) {
          goto LABEL_4;
        }
      }
      else
      {
        if (sub_24EEDDE90() & 1) == 0 || ((v46 ^ v12)) {
          goto LABEL_4;
        }
        if (v45 != v13 || v14 != v44) {
          goto LABEL_4;
        }
      }
      if (v16)
      {
        if (!v43) {
          goto LABEL_4;
        }
        BOOL v22 = v15 == v40 && v16 == v43;
        if (!v22 && (sub_24EEDDE90() & 1) == 0) {
          goto LABEL_4;
        }
      }
      else if (v43)
      {
        goto LABEL_4;
      }
      BOOL v23 = v18 == v42 && v17 == v41;
      if (v23 || (sub_24EEDDE90() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_24EEA2888(v38);
        uint64_t v24 = *(void *)(*v37 + 48) + 72 * v8;
        uint64_t v25 = *(void *)(v24 + 8);
        uint64_t v26 = *(void *)(v24 + 16);
        uint64_t v27 = *(void *)(v24 + 24);
        char v28 = *(unsigned char *)(v24 + 32);
        char v29 = *(unsigned char *)(v24 + 33);
        char v30 = *(unsigned char *)(v24 + 34);
        uint64_t v31 = *(void *)(v24 + 40);
        uint64_t v32 = *(void *)(v24 + 64);
        *(void *)uint64_t v39 = *(void *)v24;
        *(void *)(v39 + 8) = v25;
        *(void *)(v39 + 16) = v26;
        *(void *)(v39 + 24) = v27;
        *(unsigned char *)(v39 + 32) = v28;
        *(unsigned char *)(v39 + 33) = v29;
        *(unsigned char *)(v39 + 34) = v30;
        *(void *)(v39 + 40) = v31;
        *(_OWORD *)(v39 + 48) = *(_OWORD *)(v24 + 48);
        *(void *)(v39 + 64) = v32;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return 0;
      }
LABEL_4:
      unint64_t v8 = (v8 + 1) & v49;
    }
    while (((*(void *)(v51 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v54 = *v37;
  *char v37 = 0x8000000000000000;
  sub_24EEA2830(v38);
  sub_24EEC0DEC(v38, v8, isUniquelyReferenced_nonNull_native);
  *char v37 = v54;
  swift_bridgeObjectRelease();
  long long v35 = *(_OWORD *)(v38 + 48);
  *(_OWORD *)(v39 + 32) = *(_OWORD *)(v38 + 32);
  *(_OWORD *)(v39 + 48) = v35;
  *(void *)(v39 + 64) = *(void *)(v38 + 64);
  long long v36 = *(_OWORD *)(v38 + 16);
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v38;
  *(_OWORD *)(v39 + 16) = v36;
  return 1;
}

uint64_t sub_24EEC02B4(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_24EEDD2E0();
  sub_24EEBFE58(&qword_26B1E7360);
  swift_bridgeObjectRetain();
  uint64_t v39 = a2;
  uint64_t v8 = sub_24EEDD760();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  uint64_t v36 = v6 + 56;
  uint64_t v11 = v7 - 8;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v32 = v2;
    uint64_t v33 = a1;
    uint64_t v34 = ~v9;
    int v12 = *(void **)v11;
    v30[1] = v11 & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    uint64_t v31 = v12;
    int v13 = (void (*)(char *, unint64_t, uint64_t, double))v12[2];
    char v37 = v12 + 2;
    uint64_t v38 = v13;
    uint64_t v14 = v12[8];
    uint64_t v35 = v12[9];
    uint64_t v15 = (uint64_t (**)(char *, uint64_t))(v12 + 1);
    while (1)
    {
      double v16 = MEMORY[0x270FA5388](v8);
      uint64_t v17 = v6;
      uint64_t v18 = *(void *)(v6 + 48);
      unint64_t v19 = v35 * v10;
      v38((char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v35 * v10, v7, v16);
      sub_24EEBFE58(&qword_269978A58);
      char v20 = sub_24EEDD790();
      uint64_t v21 = *v15;
      uint64_t v8 = (*v15)((char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if (v20) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v34;
      uint64_t v6 = v17;
      if (((*(void *)(v36 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v32;
        a1 = v33;
        BOOL v22 = v31;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v21(v39, v7);
    ((void (*)(uint64_t, unint64_t, uint64_t))v38)(v33, *(void *)(*v32 + 48) + v19, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    BOOL v22 = *(void **)v11;
LABEL_7:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v24 = isUniquelyReferenced_nonNull_native;
    double v25 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
    uint64_t v27 = (char *)v30 - v26;
    char v28 = v39;
    ((void (*)(char *, char *, uint64_t, double))v22[2])((char *)v30 - v26, v39, v7, v25);
    uint64_t v40 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24EEC10F8((uint64_t)v27, v10, v24);
    *uint64_t v3 = v40;
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, char *, uint64_t))v22[4])(a1, v28, v7);
    return 1;
  }
}

uint64_t sub_24EEC05DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A70);
  uint64_t v3 = sub_24EEDDBD0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v43 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    uint64_t v41 = v0;
    int64_t v42 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t v9 = v3;
    uint64_t result = swift_retain();
    uint64_t v11 = v9;
    int64_t v12 = 0;
    uint64_t v44 = v2;
    uint64_t v45 = v9;
    while (1)
    {
      if (v7)
      {
        uint64_t v47 = (v7 - 1) & v7;
        int64_t v48 = v12;
        unint64_t v15 = __clz(__rbit64(v7)) | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v16 >= v42) {
          goto LABEL_36;
        }
        unint64_t v17 = v43[v16];
        int64_t v18 = v12 + 1;
        if (!v17)
        {
          int64_t v18 = v12 + 2;
          if (v12 + 2 >= v42) {
            goto LABEL_36;
          }
          unint64_t v17 = v43[v18];
          if (!v17)
          {
            int64_t v18 = v12 + 3;
            if (v12 + 3 >= v42) {
              goto LABEL_36;
            }
            unint64_t v17 = v43[v18];
            if (!v17)
            {
              uint64_t v19 = v12 + 4;
              if (v12 + 4 >= v42)
              {
LABEL_36:
                uint64_t v38 = v11;
                swift_release();
                uint64_t v1 = v41;
                uint64_t v39 = 1 << *(unsigned char *)(v2 + 32);
                if (v39 > 63) {
                  bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v43 = -1 << v39;
                }
                uint64_t v4 = v38;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v43[v19];
              if (!v17)
              {
                while (1)
                {
                  int64_t v18 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_42;
                  }
                  if (v18 >= v42) {
                    goto LABEL_36;
                  }
                  unint64_t v17 = v43[v18];
                  ++v19;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v18 = v12 + 4;
            }
          }
        }
LABEL_23:
        uint64_t v47 = (v17 - 1) & v17;
        int64_t v48 = v18;
        unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 72 * v15;
      uint64_t v21 = *(void *)v20;
      uint64_t v22 = *(void *)(v20 + 8);
      uint64_t v24 = *(void *)(v20 + 16);
      uint64_t v23 = *(void *)(v20 + 24);
      char v25 = *(unsigned char *)(v20 + 32);
      char v26 = *(unsigned char *)(v20 + 33);
      char v27 = *(unsigned char *)(v20 + 34);
      uint64_t v28 = *(void *)(v20 + 40);
      uint64_t v29 = *(void *)(v20 + 48);
      uint64_t v49 = *(void *)(v20 + 64);
      uint64_t v50 = *(void *)(v20 + 56);
      sub_24EEDDF50();
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      sub_24EEDDF70();
      sub_24EEDDF60();
      char v46 = v27;
      sub_24EEDDF60();
      if (v29)
      {
        sub_24EEDDF70();
        swift_bridgeObjectRetain();
        uint64_t v30 = v28;
        sub_24EEDD830();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v30 = v28;
        sub_24EEDDF70();
      }
      swift_bridgeObjectRetain();
      sub_24EEDD830();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24EEDDFA0();
      uint64_t v11 = v45;
      uint64_t v31 = -1 << *(unsigned char *)(v45 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v8 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v32) & ~*(void *)(v8 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v8 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v13 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v8 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v45 + 48) + 72 * v13;
      int64_t v12 = v48;
      *(void *)uint64_t v14 = v21;
      *(void *)(v14 + 8) = v22;
      *(void *)(v14 + 16) = v24;
      *(void *)(v14 + 24) = v23;
      *(unsigned char *)(v14 + 32) = v25;
      *(unsigned char *)(v14 + 33) = v26;
      *(unsigned char *)(v14 + 34) = v46;
      *(void *)(v14 + 40) = v30;
      *(void *)(v14 + 48) = v29;
      *(void *)(v14 + 56) = v50;
      *(void *)(v14 + 64) = v49;
      ++*(void *)(v45 + 16);
      uint64_t v2 = v44;
      unint64_t v7 = v47;
    }
  }
  uint64_t v40 = v4;
  uint64_t result = swift_release();
  *uint64_t v1 = v40;
  return result;
}

uint64_t sub_24EEC0A2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A60);
  uint64_t v3 = sub_24EEDDBD0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v39 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & v6;
    uint64_t v37 = v0;
    int64_t v38 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        int64_t v41 = v11;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v38) {
          goto LABEL_33;
        }
        unint64_t v16 = v39[v15];
        int64_t v17 = v11 + 1;
        if (!v16)
        {
          int64_t v17 = v11 + 2;
          if (v11 + 2 >= v38) {
            goto LABEL_33;
          }
          unint64_t v16 = v39[v17];
          if (!v16)
          {
            int64_t v17 = v11 + 3;
            if (v11 + 3 >= v38) {
              goto LABEL_33;
            }
            unint64_t v16 = v39[v17];
            if (!v16)
            {
              uint64_t v18 = v11 + 4;
              if (v11 + 4 >= v38)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v37;
                uint64_t v35 = 1 << *(unsigned char *)(v2 + 32);
                if (v35 > 63) {
                  bzero(v39, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v39 = -1 << v35;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v39[v18];
              if (!v16)
              {
                while (1)
                {
                  int64_t v17 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v17 >= v38) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v39[v17];
                  ++v18;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v17 = v11 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        int64_t v41 = v17;
        unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      uint64_t v19 = sub_24EEDD2E0();
      uint64_t v40 = &v36;
      uint64_t v20 = *(void *)(v19 - 8);
      double v21 = MEMORY[0x270FA5388](v19);
      uint64_t v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v24 = v2;
      uint64_t v25 = *(void *)(v2 + 48);
      char v26 = *(void (**)(char *, unint64_t, uint64_t, double))(v20 + 32);
      uint64_t v27 = *(void *)(v20 + 72);
      v26(v23, v25 + v27 * v14, v19, v21);
      sub_24EEBFE58(&qword_26B1E7360);
      uint64_t result = sub_24EEDD760();
      uint64_t v28 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v9 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v29) & ~*(void *)(v9 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v9 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v12 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v4 + 48) + v12 * v27, v23, v19);
      ++*(void *)(v4 + 16);
      int64_t v11 = v41;
      uint64_t v2 = v24;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24EEC0DEC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v34 = result;
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_44;
  }
  if (a3)
  {
    sub_24EEC05DC();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24EEC135C();
      goto LABEL_44;
    }
    sub_24EEC1818();
  }
  uint64_t v8 = *v3;
  sub_24EEDDF50();
  TabItemDescriptor.hash(into:)();
  uint64_t result = sub_24EEDDFA0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  uint64_t v45 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v44 = ~v9;
    uint64_t v46 = *(void *)(v5 + 8);
    uint64_t v47 = *(void *)v5;
    uint64_t v42 = *(void *)(v5 + 16);
    uint64_t v43 = *(void *)(v8 + 48);
    uint64_t v41 = *(void *)(v5 + 24);
    int v39 = *(unsigned __int8 *)(v5 + 33);
    int v40 = *(unsigned __int8 *)(v5 + 32);
    int v38 = *(unsigned __int8 *)(v5 + 34);
    uint64_t v32 = *(void *)(v5 + 40);
    uint64_t v36 = *(void *)(v5 + 56);
    uint64_t v37 = *(void *)(v5 + 48);
    uint64_t v35 = *(void *)(v5 + 64);
    do
    {
      uint64_t v10 = v43 + 72 * a2;
      uint64_t result = *(void *)v10;
      uint64_t v11 = *(void *)(v10 + 16);
      uint64_t v12 = *(void *)(v10 + 24);
      int v13 = *(unsigned __int8 *)(v10 + 32);
      int v14 = *(unsigned __int8 *)(v10 + 33);
      int v15 = *(unsigned __int8 *)(v10 + 34);
      uint64_t v17 = *(void *)(v10 + 40);
      uint64_t v16 = *(void *)(v10 + 48);
      uint64_t v18 = *(void *)(v10 + 56);
      uint64_t v19 = *(void *)(v10 + 64);
      if (*(void *)v10 != v47 || *(void *)(v10 + 8) != v46)
      {
        uint64_t result = sub_24EEDDE90();
        if ((result & 1) == 0) {
          goto LABEL_11;
        }
      }
      if (v11 == v42 && v12 == v41)
      {
        if (((v40 ^ v13) & 1) != 0 || ((v39 ^ v14) & 1) != 0 || v15 != v38) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t result = sub_24EEDDE90();
        if (result & 1) == 0 || ((v40 ^ v13)) {
          goto LABEL_11;
        }
        if (v39 != v14 || v15 != v38) {
          goto LABEL_11;
        }
      }
      if (v16)
      {
        if (!v37) {
          goto LABEL_11;
        }
        if (v17 != v32 || v16 != v37)
        {
          uint64_t result = sub_24EEDDE90();
          if ((result & 1) == 0) {
            goto LABEL_11;
          }
        }
      }
      else if (v37)
      {
        goto LABEL_11;
      }
      BOOL v24 = v18 == v36 && v19 == v35;
      if (v24 || (uint64_t result = sub_24EEDDE90(), (result & 1) != 0))
      {
        uint64_t result = sub_24EEDDEB0();
        __break(1u);
        break;
      }
LABEL_11:
      a2 = (a2 + 1) & v44;
    }
    while (((*(void *)(v45 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_44:
  uint64_t v25 = *v33;
  *(void *)(*v33 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v26 = *(void *)(v25 + 48) + 72 * a2;
  *(void *)(v26 + 64) = *(void *)(v34 + 64);
  long long v27 = *(_OWORD *)(v34 + 48);
  *(_OWORD *)(v26 + 32) = *(_OWORD *)(v34 + 32);
  *(_OWORD *)(v26 + 48) = v27;
  long long v28 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v34;
  *(_OWORD *)(v26 + 16) = v28;
  uint64_t v29 = *(void *)(v25 + 16);
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30) {
    __break(1u);
  }
  else {
    *(void *)(v25 + 16) = v31;
  }
  return result;
}

uint64_t sub_24EEC10F8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  unint64_t v5 = *(void *)(*v3 + 16);
  unint64_t v6 = *(void *)(*v3 + 24);
  if (v6 > v5 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24EEC0A2C();
  }
  else
  {
    if (v6 > v5)
    {
      sub_24EEC1570();
      goto LABEL_12;
    }
    sub_24EEC1C44();
  }
  uint64_t v7 = *v3;
  uint64_t v8 = sub_24EEDD2E0();
  sub_24EEBFE58(&qword_26B1E7360);
  uint64_t v9 = sub_24EEDD760();
  uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
  a2 = v9 & ~v10;
  uint64_t v28 = v7 + 56;
  uint64_t v29 = v7;
  if ((*(void *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v27 = ~v10;
    uint64_t v11 = *(void **)(v8 - 8);
    uint64_t v12 = (void (*)(char *, unint64_t, uint64_t, double))v11[2];
    uint64_t v13 = v11[8];
    uint64_t v14 = v11[9];
    int v15 = (uint64_t (**)(char *, uint64_t))(v11 + 1);
    do
    {
      double v16 = MEMORY[0x270FA5388](v9);
      v12((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(v29 + 48) + v14 * a2, v8, v16);
      sub_24EEBFE58(&qword_269978A58);
      char v17 = sub_24EEDD790();
      uint64_t v9 = (*v15)((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      if (v17) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v27;
    }
    while (((*(void *)(v28 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v18 = *v26;
  *(void *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v19 = *(void *)(v18 + 48);
  uint64_t v20 = sub_24EEDD2E0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * a2, v30, v20);
  uint64_t v22 = *(void *)(v18 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (!v23)
  {
    *(void *)(v18 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24EEDDEB0();
  __break(1u);
  return result;
}

void *sub_24EEC135C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EEDDBC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v13) {
      goto LABEL_28;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29)
      {
        int64_t v9 = v28 + 2;
        if (v28 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v29 = *(void *)(v6 + 8 * v9);
        if (!v29) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 72 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v19 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v17 + 24);
    char v21 = *(unsigned char *)(v17 + 32);
    char v22 = *(unsigned char *)(v17 + 33);
    char v23 = *(unsigned char *)(v17 + 34);
    uint64_t v24 = *(void *)(v17 + 40);
    uint64_t v25 = *(void *)(v17 + 64);
    uint64_t v26 = *(void *)(v4 + 48) + v16;
    long long v27 = *(_OWORD *)(v17 + 48);
    *(void *)uint64_t v26 = *(void *)v17;
    *(void *)(v26 + 8) = v18;
    *(void *)(v26 + 16) = v19;
    *(void *)(v26 + 24) = v20;
    *(unsigned char *)(v26 + 32) = v21;
    *(unsigned char *)(v26 + 33) = v22;
    *(unsigned char *)(v26 + 34) = v23;
    *(void *)(v26 + 40) = v24;
    *(_OWORD *)(v26 + 48) = v27;
    *(void *)(v26 + 64) = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 3;
  if (v30 >= v13) {
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24EEC1570()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EEDDBC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  uint64_t v25 = v1;
  uint64_t v26 = (const void *)(v2 + 56);
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v6) {
    uint64_t result = memmove(result, v26, 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v2 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v12) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v26 + v22);
    ++v8;
    if (!v23)
    {
      int64_t v8 = v22 + 1;
      if (v22 + 1 >= v12) {
        goto LABEL_28;
      }
      unint64_t v23 = *((void *)v26 + v8);
      if (!v23)
      {
        int64_t v8 = v22 + 2;
        if (v22 + 2 >= v12) {
          goto LABEL_28;
        }
        unint64_t v23 = *((void *)v26 + v8);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v14 = __clz(__rbit64(v23)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = sub_24EEDD2E0();
    uint64_t v16 = *(void *)(v15 - 8);
    double v17 = MEMORY[0x270FA5388](v15);
    uint64_t v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v21 = *(void *)(v20 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t, double))(v16 + 16))(v19, *(void *)(v2 + 48) + v21, v15, v17);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(void *)(v4 + 48) + v21, v19, v15);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v12)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_30;
  }
  unint64_t v23 = *((void *)v26 + v24);
  if (v23)
  {
    int64_t v8 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v8 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v26 + v8);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24EEC1818()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A70);
  uint64_t v3 = sub_24EEDDBD0();
  if (!*(void *)(v2 + 16))
  {
    uint64_t v39 = v3;
    uint64_t result = swift_release();
    uint64_t v38 = v39;
LABEL_38:
    *uint64_t v1 = v38;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  int v40 = v0;
  uint64_t v41 = v2 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v2 + 56);
  int64_t v42 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v3 + 56;
  uint64_t v8 = v3;
  uint64_t result = swift_retain();
  uint64_t v10 = v8;
  int64_t v11 = 0;
  uint64_t v43 = v2;
  uint64_t v44 = v8;
  while (1)
  {
    if (v6)
    {
      uint64_t v46 = (v6 - 1) & v6;
      int64_t v47 = v11;
      unint64_t v14 = __clz(__rbit64(v6)) | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v15 >= v42) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v41 + 8 * v15);
    int64_t v17 = v11 + 1;
    if (!v16)
    {
      int64_t v17 = v11 + 2;
      if (v11 + 2 >= v42) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v41 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v11 + 3;
        if (v11 + 3 >= v42) {
          goto LABEL_36;
        }
        unint64_t v16 = *(void *)(v41 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v46 = (v16 - 1) & v16;
    int64_t v47 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    uint64_t v19 = *(void *)(v2 + 48) + 72 * v14;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    uint64_t v22 = *(void *)(v19 + 16);
    uint64_t v23 = *(void *)(v19 + 24);
    char v24 = *(unsigned char *)(v19 + 32);
    char v25 = *(unsigned char *)(v19 + 33);
    char v26 = *(unsigned char *)(v19 + 34);
    uint64_t v27 = *(void *)(v19 + 48);
    uint64_t v28 = *(void *)(v19 + 64);
    uint64_t v48 = *(void *)(v19 + 40);
    uint64_t v49 = *(void *)(v19 + 56);
    sub_24EEDDF50();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_24EEDD830();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24EEDD830();
    swift_bridgeObjectRelease();
    sub_24EEDDF70();
    sub_24EEDDF60();
    char v45 = v26;
    sub_24EEDDF60();
    if (v27)
    {
      sub_24EEDDF70();
      swift_bridgeObjectRetain();
      uint64_t v29 = v48;
      sub_24EEDD830();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v29 = v48;
      sub_24EEDDF70();
    }
    swift_bridgeObjectRetain();
    sub_24EEDD830();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24EEDDFA0();
    uint64_t v10 = v44;
    uint64_t v30 = -1 << *(unsigned char *)(v44 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v7 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v31) & ~*(void *)(v7 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v7 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v12 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v7 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = *(void *)(v44 + 48) + 72 * v12;
    int64_t v11 = v47;
    *(void *)uint64_t v13 = v20;
    *(void *)(v13 + 8) = v21;
    *(void *)(v13 + 16) = v22;
    *(void *)(v13 + 24) = v23;
    *(unsigned char *)(v13 + 32) = v24;
    *(unsigned char *)(v13 + 33) = v25;
    unint64_t v6 = v46;
    *(unsigned char *)(v13 + 34) = v45;
    *(void *)(v13 + 40) = v29;
    *(void *)(v13 + 48) = v27;
    *(void *)(v13 + 56) = v49;
    *(void *)(v13 + 64) = v28;
    ++*(void *)(v44 + 16);
    uint64_t v2 = v43;
  }
  uint64_t v18 = v11 + 4;
  if (v11 + 4 >= v42)
  {
LABEL_36:
    uint64_t v37 = v10;
    uint64_t result = swift_release_n();
    uint64_t v38 = v37;
    uint64_t v1 = v40;
    goto LABEL_38;
  }
  unint64_t v16 = *(void *)(v41 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v11 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v42) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v41 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24EEC1C44()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269978A60);
  uint64_t v3 = sub_24EEDDBD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = *(void *)(v2 + 56);
  uint64_t v36 = v0;
  uint64_t v37 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v6;
  int64_t v38 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  for (int64_t i = 0; ; int64_t i = v39)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      int64_t v39 = i;
      unint64_t v14 = v13 | (i << 6);
      goto LABEL_24;
    }
    int64_t v15 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v38) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v37 + 8 * v15);
    int64_t v17 = i + 1;
    if (!v16)
    {
      int64_t v17 = i + 2;
      if (i + 2 >= v38) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v37 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = i + 3;
        if (i + 3 >= v38) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v37 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    int64_t v39 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    uint64_t v19 = sub_24EEDD2E0();
    uint64_t v20 = *(void *)(v19 - 8);
    double v21 = MEMORY[0x270FA5388](v19);
    uint64_t v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v25 = v24;
    uint64_t v26 = v2;
    uint64_t v27 = *(void *)(v2 + 48);
    uint64_t v28 = *(void *)(v25 + 72);
    (*(void (**)(char *, unint64_t, uint64_t, double))(v20 + 16))(v23, v27 + v28 * v14, v19, v21);
    sub_24EEBFE58(&qword_26B1E7360);
    uint64_t result = sub_24EEDD760();
    uint64_t v29 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v9 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v30) & ~*(void *)(v9 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v9 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v12 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v20 + 32))(*(void *)(v4 + 48) + v12 * v28, v23, v19);
    ++*(void *)(v4 + 16);
    uint64_t v2 = v26;
  }
  uint64_t v18 = i + 4;
  if (i + 4 >= v38)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v36;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v37 + 8 * v18);
  if (v16)
  {
    int64_t v17 = i + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v38) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v37 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24EEC1FE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24EEC2364();
  uint64_t result = sub_24EEDDA40();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      long long v5 = *(_OWORD *)(v4 + 48);
      v9[2] = *(_OWORD *)(v4 + 32);
      v9[3] = v5;
      uint64_t v10 = *(void *)(v4 + 64);
      long long v6 = *(_OWORD *)(v4 + 16);
      v9[0] = *(_OWORD *)v4;
      v9[1] = v6;
      sub_24EEA2830((uint64_t)v9);
      sub_24EEBFF3C((uint64_t)&v7, (uint64_t)v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 += 72;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24EEC20AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = sub_24EEDD2E0();
  sub_24EEBFE58(&qword_26B1E7360);
  uint64_t v25 = sub_24EEDDA40();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7368);
  v5.n128_f64[0] = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = *(void *)(v3 - 8);
  v19[1] = v3 - 8;
  if (v2)
  {
    uint64_t v8 = v19[0];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v20 = *(void *)(v19[0] + 72);
    uint64_t v24 = (void (**)(char *, void, uint64_t, uint64_t))(v19[0] + 56);
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v19[0] + 16);
    uint64_t v22 = v19[0] + 16;
    uint64_t v23 = v10;
    double v21 = (uint64_t (**)(char *, uint64_t, uint64_t))(v19[0] + 48);
    v19[2] = v19[0] + 8;
    v19[3] = v19[0] + 32;
    while (1)
    {
      v23(v7, v9, v3, v5);
      (*v24)(v7, 0, 1, v3);
      uint64_t v11 = (*v21)(v7, 1, v3);
      if (v11 == 1) {
        break;
      }
      MEMORY[0x270FA5388](v11);
      unint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      double v15 = MEMORY[0x270FA5388](v14);
      int64_t v17 = (char *)v19 - v16;
      (*(void (**)(char *, char *, uint64_t, double))(v8 + 32))((char *)v19 - v16, v7, v3, v15);
      sub_24EEC02B4((uint64_t)v13, v17);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v3);
      v9 += v20;
      if (!--v2) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v19[0] + 56))(v7, 1, 1, v3, v5);
  }
  return v25;
}

unint64_t sub_24EEC2364()
{
  unint64_t result = qword_26B1E74C8;
  if (!qword_26B1E74C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E74C8);
  }
  return result;
}

uint64_t ArtworkCandidate.artwork.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t ArtworkCandidate.cropCode.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ArtworkCandidate.predicateDescriptor.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  swift_retain();
  return v2;
}

uint64_t ArtworkCandidate.init(artwork:cropCode:predicateDescriptor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a1, a5);
  uint64_t result = type metadata accessor for ArtworkCandidate();
  uint64_t v11 = (void *)(a6 + *(int *)(result + 36));
  *uint64_t v11 = a2;
  v11[1] = a3;
  *(void *)(a6 + *(int *)(result + 40)) = a4;
  return result;
}

uint64_t type metadata accessor for ArtworkCandidate()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_24EEC2514(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EEC2524()
{
  return sub_24EEDDF60();
}

uint64_t sub_24EEC254C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F43706F7263 && a2 == 0xE800000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024EEE6450)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24EEC26A0()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC26E8(char a1)
{
  if (!a1) {
    return 0x6B726F77747261;
  }
  if (a1 == 1) {
    return 0x65646F43706F7263;
  }
  return 0xD000000000000013;
}

BOOL sub_24EEC2744(char *a1, char *a2)
{
  return sub_24EEC2514(*a1, *a2);
}

uint64_t sub_24EEC2758()
{
  return sub_24EEC26A0();
}

uint64_t sub_24EEC2764()
{
  return sub_24EEC2524();
}

uint64_t sub_24EEC2770()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC27B8()
{
  return sub_24EEC26E8(*v0);
}

uint64_t sub_24EEC27C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEC254C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEC27F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EEC3BF0();
  *a1 = result;
  return result;
}

uint64_t sub_24EEC2820(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EEC2874(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t ArtworkCandidate.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v12 = a2;
  uint64_t v14 = *(void *)(a2 + 16);
  type metadata accessor for ArtworkCandidate.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EEDDE70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v11 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = v13;
  sub_24EEDDFC0();
  char v19 = 0;
  uint64_t v8 = v15;
  sub_24EEDDE60();
  if (!v8)
  {
    uint64_t v9 = v12;
    char v18 = 1;
    sub_24EEDDE20();
    uint64_t v16 = *(void *)(v7 + *(int *)(v9 + 40));
    char v17 = 2;
    sub_24EEC2AD0();
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t type metadata accessor for ArtworkCandidate.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24EEC2AD0()
{
  unint64_t result = qword_269978A80;
  if (!qword_269978A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978A80);
  }
  return result;
}

uint64_t ArtworkCandidate.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v26 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v29 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ArtworkCandidate.CodingKeys();
  swift_getWitnessTable();
  uint64_t v28 = sub_24EEDDE00();
  uint64_t v25 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t v27 = a3;
  uint64_t v10 = type metadata accessor for ArtworkCandidate();
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v23 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v30 = v9;
  uint64_t v13 = v31;
  sub_24EEDDFB0();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v15 = v25;
  uint64_t v14 = v26;
  unint64_t v31 = v12;
  char v35 = 0;
  sub_24EEDDDE0();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v31, v29, a2);
  char v34 = 1;
  uint64_t v16 = sub_24EEDDDA0();
  char v17 = (uint64_t *)&v31[*(int *)(v10 + 36)];
  *char v17 = v16;
  v17[1] = v18;
  char v33 = 2;
  sub_24EEC2F2C();
  sub_24EEDDDE0();
  uint64_t v19 = (uint64_t)a1;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v30, v28);
  uint64_t v20 = v31;
  *(void *)&v31[*(int *)(v10 + 40)] = v32;
  uint64_t v21 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(v24, v20, v10);
  __swift_destroy_boxed_opaque_existential_1(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v10);
}

unint64_t sub_24EEC2F2C()
{
  unint64_t result = qword_269978A88[0];
  if (!qword_269978A88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269978A88);
  }
  return result;
}

uint64_t sub_24EEC2F80@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return ArtworkCandidate.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24EEC2FA0(void *a1, uint64_t a2)
{
  return ArtworkCandidate.encode(to:)(a1, a2);
}

uint64_t ArtworkCandidate.hash(into:)(uint64_t a1, uint64_t a2)
{
  sub_24EEDD770();
  if (*(void *)(v2 + *(int *)(a2 + 36) + 8))
  {
    sub_24EEDDF70();
    swift_bridgeObjectRetain();
    sub_24EEDD830();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EEDDF70();
  }
  swift_retain();
  sub_24EEDD370();
  return swift_release();
}

uint64_t static ArtworkCandidate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (sub_24EEDD790())
  {
    uint64_t v4 = *(int *)(type metadata accessor for ArtworkCandidate() + 36);
    uint64_t v5 = (void *)(a1 + v4);
    uint64_t v6 = *(void *)(a1 + v4 + 8);
    uint64_t v7 = (void *)(a2 + v4);
    uint64_t v8 = v7[1];
    if (v6)
    {
      if (v8)
      {
        BOOL v9 = *v5 == *v7 && v6 == v8;
        if (v9 || (sub_24EEDDE90() & 1) != 0)
        {
LABEL_9:
          JUMPOUT(0x25334E750);
        }
      }
    }
    else if (!v8)
    {
      goto LABEL_9;
    }
  }
  return 0;
}

uint64_t ArtworkCandidate.hashValue.getter(uint64_t a1)
{
  sub_24EEDDF50();
  ArtworkCandidate.hash(into:)((uint64_t)v3, a1);
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC319C(uint64_t a1, uint64_t a2)
{
  sub_24EEDDF50();
  ArtworkCandidate.hash(into:)((uint64_t)v4, a2);
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC31E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EEC31FC(uint64_t a1, uint64_t a2)
{
  return static ArtworkCandidate.== infix(_:_:)(a1, a2);
}

uint64_t sub_24EEC3208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24EEC3210()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24EEC32B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v10 = *v11;
    v10[1] = v11[1];
    *(void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_24EEC33E0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24EEC3464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24EEC3510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24EEC35D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v7 = *v8;
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24EEC3660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  *(void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_24EEC3710(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24EEC386CLL);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFE) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  if ((v17 + 1) >= 2) {
    return v17;
  }
  else {
    return 0;
  }
}

void sub_24EEC3880(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v8 = 2147483646;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFE)
            {
              uint64_t v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if (a2 > 0x7FFFFFFE)
              {
                *uint64_t v19 = 0;
                v19[1] = 0;
                *(_DWORD *)uint64_t v19 = a2 - 0x7FFFFFFF;
              }
              else
              {
                v19[1] = a2;
              }
            }
            else
            {
              uint64_t v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24EEC3A80);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

unsigned char *sub_24EEC3AA8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEC3B74);
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

uint64_t sub_24EEC3B9C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EEC3BB8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EEC3BD4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EEC3BF0()
{
  return 3;
}

BOOL static GridAxis.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EEC3C10()
{
  if (*v0) {
    return 0x6C61636974726576;
  }
  else {
    return 0x746E6F7A69726F68;
  }
}

uint64_t sub_24EEC3C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEC4A74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEC3C78(uint64_t a1)
{
  unint64_t v2 = sub_24EEC4084();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC3CB4(uint64_t a1)
{
  unint64_t v2 = sub_24EEC4084();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC3CF0(uint64_t a1)
{
  unint64_t v2 = sub_24EEC412C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC3D2C(uint64_t a1)
{
  unint64_t v2 = sub_24EEC412C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC3D68(uint64_t a1)
{
  unint64_t v2 = sub_24EEC40D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC3DA4(uint64_t a1)
{
  unint64_t v2 = sub_24EEC40D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GridAxis.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B10);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B18);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B20);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unsigned int v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC4084();
  sub_24EEDDFC0();
  int v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24EEC40D8();
    int v14 = v18;
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24EEC412C();
    sub_24EEDDE10();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24EEC4084()
{
  unint64_t result = qword_269978B28;
  if (!qword_269978B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B28);
  }
  return result;
}

unint64_t sub_24EEC40D8()
{
  unint64_t result = qword_269978B30;
  if (!qword_269978B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B30);
  }
  return result;
}

unint64_t sub_24EEC412C()
{
  unint64_t result = qword_269978B38;
  if (!qword_269978B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B38);
  }
  return result;
}

uint64_t GridAxis.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B40);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B48);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unsigned int v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978B50);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC4084();
  unsigned int v11 = v32;
  sub_24EEDDFB0();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  int v14 = v10;
  uint64_t v15 = sub_24EEDDDF0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24EEDDC30();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *char v22 = &type metadata for GridAxis;
    sub_24EEDDD90();
    sub_24EEDDC20();
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
    sub_24EEC40D8();
    uint64_t v18 = v14;
    sub_24EEDDD80();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24EEC412C();
    sub_24EEDDD80();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24EEC45D8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return GridAxis.init(from:)(a1, a2);
}

uint64_t sub_24EEC45F0(void *a1)
{
  return GridAxis.encode(to:)(a1);
}

uint64_t GridAxis.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t GridAxis.hashValue.getter()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EEC4680()
{
  unint64_t result = qword_269978B58;
  if (!qword_269978B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B58);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridAxis()
{
  return &type metadata for GridAxis;
}

unsigned char *_s13FitnessCoreUI8GridAxisOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEC47B4);
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

ValueMetadata *type metadata accessor for GridAxis.CodingKeys()
{
  return &type metadata for GridAxis.CodingKeys;
}

ValueMetadata *type metadata accessor for GridAxis.HorizontalCodingKeys()
{
  return &type metadata for GridAxis.HorizontalCodingKeys;
}

ValueMetadata *type metadata accessor for GridAxis.VerticalCodingKeys()
{
  return &type metadata for GridAxis.VerticalCodingKeys;
}

unint64_t sub_24EEC4810()
{
  unint64_t result = qword_269978B60;
  if (!qword_269978B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B60);
  }
  return result;
}

unint64_t sub_24EEC4868()
{
  unint64_t result = qword_269978B68;
  if (!qword_269978B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B68);
  }
  return result;
}

unint64_t sub_24EEC48C0()
{
  unint64_t result = qword_269978B70;
  if (!qword_269978B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B70);
  }
  return result;
}

unint64_t sub_24EEC4918()
{
  unint64_t result = qword_269978B78;
  if (!qword_269978B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B78);
  }
  return result;
}

unint64_t sub_24EEC4970()
{
  unint64_t result = qword_269978B80;
  if (!qword_269978B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B80);
  }
  return result;
}

unint64_t sub_24EEC49C8()
{
  unint64_t result = qword_269978B88;
  if (!qword_269978B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B88);
  }
  return result;
}

unint64_t sub_24EEC4A20()
{
  unint64_t result = qword_269978B90;
  if (!qword_269978B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978B90);
  }
  return result;
}

uint64_t sub_24EEC4A74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E6F7A69726F68 && a2 == 0xEA00000000006C61;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61636974726576 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id PlatterlessNonScalingButton.titleLabel.getter()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel);
  swift_release();
  return v1;
}

char *sub_24EEC4C14(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(MEMORY[0x263F82F70]);
  uint64_t v10 = v4;
  id v11 = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_floatingContentView] = v11;
  objc_msgSend(v11, sel_setContentOpaque_, 0);
  objc_msgSend(v11, sel_setContentScaleFactor_, 1.0);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel;
  *(void *)&v10[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel] = v12;
  int v14 = self;
  uint64_t v15 = *MEMORY[0x263F835C8];
  id v16 = v12;
  id v17 = objc_msgSend(v14, sel_preferredFontForTextStyle_, v15);
  objc_msgSend(v16, sel_setFont_, v17);

  uint64_t v18 = *(void **)&v10[v13];
  objc_msgSend(v18, sel_setTextAlignment_, 1);
  id v19 = v18;
  objc_msgSend(v19, sel_setNumberOfLines_, 0);

  v26.receiver = v10;
  v26.super_class = (Class)type metadata accessor for PlatterlessNonScalingButton();
  uint64_t v20 = (char *)objc_msgSendSuper2(&v26, sel_initWithFrame_, a1, a2, a3, a4);
  char v21 = *(void **)&v20[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_floatingContentView];
  char v22 = v20;
  objc_msgSend(v22, sel_addSubview_, v21);
  unint64_t result = (char *)objc_msgSend(v21, sel_contentView);
  if (result)
  {
    uint64_t v24 = result;
    id v25 = *(id *)&v22[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel];
    objc_msgSend(v24, sel_addSubview_, v25);

    return v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24EEC5280()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for PlatterlessNonScalingButton();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_floatingContentView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
  BOOL v2 = *(void **)&v0[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);
  return swift_release();
}

uint64_t type metadata accessor for PlatterlessNonScalingButton()
{
  return self;
}

uint64_t sub_24EEC5568(uint64_t a1, void *a2)
{
  int v3 = v2;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for PlatterlessNonScalingButton();
  objc_msgSendSuper2(&v14, sel_didUpdateFocusInContext_withAnimationCoordinator_, a1, a2);
  char v6 = *(void **)&v2[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_floatingContentView];
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (objc_msgSend(v2, sel_isFocused)) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  unsigned int v8 = objc_msgSend(v2, sel_isHighlighted);
  swift_release();
  objc_msgSend(v6, sel_setControlState_withAnimationCoordinator_, v7 | v8, a2);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v2;
  v13[4] = sub_24EEC5C20;
  v13[5] = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  void v13[2] = sub_24EEB1640;
  _OWORD v13[3] = &block_descriptor_3;
  uint64_t v10 = _Block_copy(v13);
  id v11 = v3;
  swift_release();
  objc_msgSend(a2, sel_addCoordinatedAnimations_completion_, v10, 0);
  _Block_release(v10);
  return swift_release();
}

uint64_t sub_24EEC578C()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEC5A58();
  return swift_release();
}

void sub_24EEC5930(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a4;
  id v6 = a1;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();
}

void sub_24EEC5A58()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(void **)&v0[OBJC_IVAR____TtC13FitnessCoreUI27PlatterlessNonScalingButton_titleLabel];
  unsigned int v2 = objc_msgSend(v0, sel_isFocused);
  int v3 = self;
  objc_super v4 = &selRef_blackColor;
  if (!v2) {
    objc_super v4 = &selRef_whiteColor;
  }
  id v5 = [v3 *v4];
  objc_msgSend(v1, sel_setTextColor_, v5);
  swift_release();
}

id PlatterlessNonScalingButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatterlessNonScalingButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24EEC5BE8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24EEC5C20()
{
  return sub_24EEC578C();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t method lookup function for PlatterlessNonScalingButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlatterlessNonScalingButton);
}

uint64_t sub_24EEC5C48()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FloatingCollectionView();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = *(void (**)(char *))&v0[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  sub_24EEC6080((uint64_t)v1);
  swift_release();
  if (v1)
  {
    v1(v0);
    sub_24EE97098((uint64_t)v1);
  }
  return swift_release();
}

id sub_24EEC6014()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FloatingCollectionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FloatingCollectionView()
{
  return self;
}

uint64_t sub_24EEC6080(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

double LayoutEdgeInsets.bottom.getter()
{
  return *(double *)v0;
}

double LayoutEdgeInsets.leading.getter()
{
  return *(double *)(v0 + 8);
}

double LayoutEdgeInsets.top.getter()
{
  return *(double *)(v0 + 16);
}

double LayoutEdgeInsets.trailing.getter()
{
  return *(double *)(v0 + 24);
}

double static LayoutEdgeInsets.zero.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void LayoutEdgeInsets.init(top:leading:bottom:trailing:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a4;
  a1[1] = a3;
  a1[2] = a2;
  a1[3] = a5;
}

void LayoutEdgeInsets.init(uniform:)(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  a1[1] = a2;
  a1[2] = a2;
  a1[3] = a2;
}

uint64_t sub_24EEC60D8()
{
  uint64_t result = 0x6D6F74746F62;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x676E696461656CLL;
      break;
    case 2:
      uint64_t result = 7368564;
      break;
    case 3:
      uint64_t result = 0x676E696C69617274;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EEC615C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEC6AEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEC6184(uint64_t a1)
{
  unint64_t v2 = sub_24EEC6824();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC61C0(uint64_t a1)
{
  unint64_t v2 = sub_24EEC6824();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LayoutEdgeInsets.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978BB0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC6824();
  sub_24EEDDFC0();
  uint64_t v14 = v9;
  HIBYTE(v13) = 0;
  sub_24EE89B64();
  sub_24EEDDE60();
  if (!v2)
  {
    uint64_t v14 = v8;
    HIBYTE(v13) = 1;
    sub_24EEDDE60();
    uint64_t v14 = v11;
    HIBYTE(v13) = 2;
    sub_24EEDDE60();
    uint64_t v14 = v10;
    HIBYTE(v13) = 3;
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t LayoutEdgeInsets.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978BC0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC6824();
  sub_24EEDDFB0();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_24EE89E9C();
    sub_24EEDDDE0();
    uint64_t v9 = v15;
    HIBYTE(v14) = 1;
    sub_24EEDDDE0();
    uint64_t v10 = v15;
    HIBYTE(v14) = 2;
    sub_24EEDDDE0();
    uint64_t v12 = v15;
    HIBYTE(v14) = 3;
    sub_24EEDDDE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EEC6664@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return LayoutEdgeInsets.init(from:)(a1, a2);
}

uint64_t sub_24EEC667C(void *a1)
{
  return LayoutEdgeInsets.encode(to:)(a1);
}

uint64_t LayoutEdgeInsets.hash(into:)()
{
  return sub_24EEDDF90();
}

uint64_t LayoutEdgeInsets.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC674C()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC679C()
{
  return sub_24EEDDFA0();
}

BOOL _s13FitnessCoreUI16LayoutEdgeInsetsV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_24EEC6824()
{
  unint64_t result = qword_269978BB8;
  if (!qword_269978BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BB8);
  }
  return result;
}

unint64_t sub_24EEC687C()
{
  unint64_t result = qword_269978BC8;
  if (!qword_269978BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LayoutEdgeInsets()
{
  return &type metadata for LayoutEdgeInsets;
}

unsigned char *storeEnumTagSinglePayload for LayoutEdgeInsets.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEC69ACLL);
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

ValueMetadata *type metadata accessor for LayoutEdgeInsets.CodingKeys()
{
  return &type metadata for LayoutEdgeInsets.CodingKeys;
}

unint64_t sub_24EEC69E8()
{
  unint64_t result = qword_269978BD0;
  if (!qword_269978BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BD0);
  }
  return result;
}

unint64_t sub_24EEC6A40()
{
  unint64_t result = qword_269978BD8;
  if (!qword_269978BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BD8);
  }
  return result;
}

unint64_t sub_24EEC6A98()
{
  unint64_t result = qword_269978BE0;
  if (!qword_269978BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BE0);
  }
  return result;
}

uint64_t sub_24EEC6AEC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7368564 && a2 == 0xE300000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696C69617274 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

CGSize __swiftcall TabItemSize.selectionSize(compatibleWith:)(UITraitCollection_optional compatibleWith)
{
  Class isa = compatibleWith.value.super.isa;
  long long v4 = v2[1];
  long long v11 = *v2;
  long long v12 = v4;
  long long v13 = v2[2];
  if (qword_26B1E7380 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26B1E7378;
  Class v5 = isa;
  CGSize v8 = TabItemSize.minimumSize(respecting:compatibleWith:)((FitnessCoreUI::TabItemEdge::Set)&v10, *(UITraitCollection_optional *)(&v1 - 8));
  double height = v8.height;
  double width = v8.width;
  result.double height = height;
  result.double width = width;
  return result;
}

double TabItemSize.paddingToItem(ofSize:at:)(uint64_t a1, unsigned char *a2)
{
  switch(*a2)
  {
    case 1:
      double result = v2[3];
      double v4 = *(double *)(a1 + 40);
      break;
    case 2:
      double result = v2[2];
      double v4 = *(double *)(a1 + 32);
      break;
    case 3:
      double result = v2[5];
      double v4 = *(double *)(a1 + 24);
      break;
    default:
      double result = v2[4];
      double v4 = *(double *)(a1 + 16);
      break;
  }
  if (*(unsigned char *)(a1 + 48)) {
    double v4 = 0.0;
  }
  if (v4 > result) {
    return v4;
  }
  return result;
}

CGSize __swiftcall TabItemSize.minimumSizeBetween(leadingItemSize:trailingItemSize:respecting:compatibleWith:)(FitnessCoreUI::TabItemSize_optional *leadingItemSize, FitnessCoreUI::TabItemSize_optional *trailingItemSize, FitnessCoreUI::TabItemEdge::Set respecting, UITraitCollection_optional compatibleWith)
{
  Class isa = compatibleWith.value.super.isa;
  double leading = trailingItemSize->value.padding.leading;
  uint64_t v7 = *(void *)respecting.rawValue;
  double v8 = *v4;
  double v9 = v4[2];
  double v10 = v4[4];
  if ((*(void *)respecting.rawValue & 2) != 0)
  {
    double v11 = v4[3];
    double trailing = leadingItemSize->value.padding.trailing;
    if (leadingItemSize->is_nil) {
      double trailing = 0.0;
    }
    if (trailing > v11) {
      double v11 = trailing;
    }
    double v8 = v8 + v11;
  }
  if (trailingItemSize->is_nil) {
    double leading = 0.0;
  }
  if (leading <= v4[5]) {
    double leading = v4[5];
  }
  if ((v7 & 8) == 0) {
    double leading = -0.0;
  }
  double v13 = leading + v8;
  if ((v7 & 4) == 0) {
    double v9 = -0.0;
  }
  if ((v7 & 1) == 0) {
    double v10 = -0.0;
  }
  double v14 = v4[1] + v9 + v10;
  if (compatibleWith.value.super.isa)
  {
    [(objc_class *)compatibleWith.value.super.isa displayScale];
    if (v15 > 0.0) {
      double v13 = ceil(v13 * v15) / v15;
    }
    [(objc_class *)isa displayScale];
    if (v16 > 0.0) {
      double v14 = ceil(v14 * v16) / v16;
    }
  }
  double v17 = v13;
  double v18 = v14;
  result.double height = v18;
  result.double width = v17;
  return result;
}

double TabItemSize.contentSize.getter()
{
  return *(double *)v0;
}

double TabItemSize.padding.getter()
{
  return *(double *)(v0 + 16);
}

CGSize __swiftcall TabItemSize.minimumSize(respecting:compatibleWith:)(FitnessCoreUI::TabItemEdge::Set respecting, UITraitCollection_optional compatibleWith)
{
  uint64_t v3 = *(void *)respecting.rawValue;
  double v4 = v2[3];
  if ((*(void *)respecting.rawValue & 2) == 0) {
    double v4 = -0.0;
  }
  double v5 = *v2 + v4;
  if ((v3 & 8) != 0) {
    double v6 = v2[5];
  }
  else {
    double v6 = -0.0;
  }
  double v7 = v5 + v6;
  if ((v3 & 4) != 0) {
    double v8 = v2[2];
  }
  else {
    double v8 = -0.0;
  }
  double v9 = v2[1] + v8;
  if (v3) {
    double v10 = v2[4];
  }
  else {
    double v10 = -0.0;
  }
  double v11 = v9 + v10;
  if (compatibleWith.value.super.isa)
  {
    Class isa = compatibleWith.value.super.isa;
    [(objc_class *)compatibleWith.value.super.isa displayScale];
    if (v13 > 0.0) {
      double v7 = ceil(v7 * v13) / v13;
    }
    [(objc_class *)isa displayScale];
    if (v14 > 0.0) {
      double v11 = ceil(v11 * v14) / v14;
    }
  }
  double v15 = v7;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

uint64_t sub_24EEC6F5C()
{
  if (*v0) {
    return 0x676E6964646170;
  }
  else {
    return 0x53746E65746E6F63;
  }
}

uint64_t sub_24EEC6FA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEC7AC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEC6FC8(uint64_t a1)
{
  unint64_t v2 = sub_24EEC7244();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC7004(uint64_t a1)
{
  unint64_t v2 = sub_24EEC7244();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemSize.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978BE8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  uint64_t v13 = v1[5];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC7244();
  sub_24EEDDFC0();
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  char v20 = 0;
  type metadata accessor for CGSize(0);
  sub_24EEC74CC(&qword_269978BF8, type metadata accessor for CGSize);
  sub_24EEDDE60();
  if (!v2)
  {
    uint64_t v16 = v10;
    uint64_t v17 = v11;
    uint64_t v18 = v12;
    uint64_t v19 = v13;
    char v20 = 1;
    type metadata accessor for NSDirectionalEdgeInsets(0);
    sub_24EEC74CC(&qword_269978C00, type metadata accessor for NSDirectionalEdgeInsets);
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24EEC7244()
{
  unint64_t result = qword_269978BF0;
  if (!qword_269978BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978BF0);
  }
  return result;
}

uint64_t TabItemSize.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978C08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC7244();
  sub_24EEDDFB0();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    char v14 = 0;
    sub_24EEC74CC(&qword_269978C10, type metadata accessor for CGSize);
    sub_24EEDDDE0();
    long long v9 = v13[0];
    type metadata accessor for NSDirectionalEdgeInsets(0);
    char v14 = 1;
    sub_24EEC74CC(&qword_269978C18, type metadata accessor for NSDirectionalEdgeInsets);
    sub_24EEDDDE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v10 = v13[0];
    long long v11 = v13[1];
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EEC74CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EEC7514@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TabItemSize.init(from:)(a1, a2);
}

uint64_t sub_24EEC752C(void *a1)
{
  return TabItemSize.encode(to:)(a1);
}

uint64_t TabItemSize.hash(into:)()
{
  sub_24EE97F98();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t TabItemSize.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC7630()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC76B4()
{
  sub_24EE97F98();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_24EEC7718()
{
  return sub_24EEDDFA0();
}

uint64_t _s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if (a1->f64[0] == a2->f64[0] && a1->f64[1] == a2->f64[1]) {
    return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(a1[1], a2[1]), (int32x4_t)vceqq_f64(a1[2], a2[2]))), 0xFuLL))) & 1;
  }
  else {
    return 0;
  }
}

unint64_t sub_24EEC77EC()
{
  unint64_t result = qword_269978C20;
  if (!qword_269978C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978C20);
  }
  return result;
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

uint64_t getEnumTagSinglePayload for TabItemSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TabItemSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TabItemSize()
{
  return &type metadata for TabItemSize;
}

unsigned char *storeEnumTagSinglePayload for TabItemSize.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEC7988);
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

ValueMetadata *type metadata accessor for TabItemSize.CodingKeys()
{
  return &type metadata for TabItemSize.CodingKeys;
}

unint64_t sub_24EEC79C4()
{
  unint64_t result = qword_269978C28;
  if (!qword_269978C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978C28);
  }
  return result;
}

unint64_t sub_24EEC7A1C()
{
  unint64_t result = qword_269978C30;
  if (!qword_269978C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978C30);
  }
  return result;
}

unint64_t sub_24EEC7A74()
{
  unint64_t result = qword_269978C38[0];
  if (!qword_269978C38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269978C38);
  }
  return result;
}

uint64_t sub_24EEC7AC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x53746E65746E6F63 && a2 == 0xEB00000000657A69;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t EquatableViewBuilder.action.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_24EEC7C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  v24[0] = a8;
  v24[1] = a4;
  v24[2] = a5;
  v24[3] = a7;
  uint64_t v14 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24EEDD340();
  uint64_t v18 = *(void *)(v17 - 8);
  double v19 = MEMORY[0x270FA5388](v17);
  char v21 = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a9 = a2;
  *((void *)a9 + 1) = a3;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v14 + 16))(v16, a1, a6, v19);
  sub_24EEDD350();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, a6);
  uint64_t v22 = type metadata accessor for EquatableViewBuilder();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(&a9[*(int *)(v22 + 44)], v21, v17);
}

uint64_t static EquatableViewBuilder.identified<A>(_:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  double v17 = MEMORY[0x270FA5388](a1);
  double v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v20 + 16))(v19, v17);
  swift_retain();
  return sub_24EEC7C04((uint64_t)v19, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t static EquatableViewBuilder.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(type metadata accessor for EquatableViewBuilder() + 44);
  return MEMORY[0x270F2CCD0](a1 + v4, a2 + v4);
}

uint64_t type metadata accessor for EquatableViewBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24EEC7F4C(uint64_t a1, uint64_t a2)
{
  return static EquatableViewBuilder.== infix(_:_:)(a1, a2);
}

uint64_t sub_24EEC7F5C()
{
  uint64_t result = sub_24EEDD340();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24EEC7FF8(void *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = v5;
    a1[1] = v6;
    uint64_t v7 = *(int *)(a3 + 44);
    uint64_t v8 = (char *)a1 + v7;
    long long v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24EEDD340();
    long long v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_24EEC80E0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_24EEDD340();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24EEC8158(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 44);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24EEDD340();
  long long v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_retain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_24EEC81F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = (char *)a1 + v7;
  long long v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24EEDD340();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

_OWORD *sub_24EEC8284(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 44);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24EEDD340();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_OWORD *sub_24EEC8300(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24EEDD340();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_24EEC838C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EEC83A0);
}

uint64_t sub_24EEC83A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24EEDD340();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    long long v11 = (char *)a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24EEC8450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EEC8464);
}

void *sub_24EEC8464(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24EEDD340();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 44);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

BOOL DynamicTypeSize.isAccessibilitySize.getter(unsigned __int8 a1)
{
  return a1 - 8 < 5;
}

BOOL static DynamicTypeSize.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EEC8530(char a1)
{
  uint64_t result = 0x6669636570736E75;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C6C616D5378;
      break;
    case 2:
      uint64_t result = 0x6C6C616D73;
      break;
    case 3:
      uint64_t result = 0x6D756964656DLL;
      break;
    case 4:
      uint64_t result = 0x656772616CLL;
      break;
    case 5:
      uint64_t result = 0x656772614C78;
      break;
    case 6:
      uint64_t result = 0x656772614C7878;
      break;
    case 7:
      uint64_t result = 0x656772614C787878;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      uint64_t result = 0x6269737365636361;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EEC86A0(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9B28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC86DC(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9B28();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8718(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9AD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8754(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9AD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8790(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9A80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC87CC(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9A80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8808(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9A2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8844(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9A2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8880(uint64_t a1)
{
  unint64_t v2 = sub_24EEC99D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC88BC(uint64_t a1)
{
  unint64_t v2 = sub_24EEC99D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC88F8()
{
  return sub_24EEC8530(*v0);
}

uint64_t sub_24EEC8900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEC9F4C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EEC8928(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_24EEC8934(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9984();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8970(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9984();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC89AC(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9C78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC89E8(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9C78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8A24(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9CCC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8A60(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9CCC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8A9C(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9D20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8AD8(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9D20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8B14(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9DC8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8B50(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9DC8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8B8C(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9C24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8BC8(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9C24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8C04(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9D74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8C40(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9D74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8C7C(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9BD0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8CB8(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9BD0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEC8CF4(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9B7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEC8D30(uint64_t a1)
{
  unint64_t v2 = sub_24EEC9B7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *static DynamicTypeSize.allCases.getter()
{
  return &unk_2700962B8;
}

void sub_24EEC8D78(void *a1@<X8>)
{
  *a1 = &unk_2700962B8;
}

uint64_t DynamicTypeSize.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v78 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CC0);
  uint64_t v76 = *(void *)(v3 - 8);
  uint64_t v77 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v75 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CC8);
  uint64_t v73 = *(void *)(v5 - 8);
  uint64_t v74 = v5;
  MEMORY[0x270FA5388](v5);
  id v72 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CD0);
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  MEMORY[0x270FA5388](v7);
  id v69 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CD8);
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  MEMORY[0x270FA5388](v9);
  long long v66 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CE0);
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v63 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CE8);
  uint64_t v61 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  id v60 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CF0);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v57 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978CF8);
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v54 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D00);
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v51 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D08);
  uint64_t v49 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v48 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D10);
  uint64_t v46 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  double v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D18);
  uint64_t v45 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D20);
  uint64_t v44 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  id v25 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978D28);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v80 = v26;
  uint64_t v81 = v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v43 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEC9984();
  CGRect v79 = v29;
  sub_24EEDDFC0();
  switch((char)v78)
  {
    case 1:
      char v83 = 1;
      sub_24EEC9D74();
      uint64_t v32 = v79;
      uint64_t v33 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v32, v33);
    case 2:
      char v84 = 2;
      sub_24EEC9D20();
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v47);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 3:
      char v85 = 3;
      sub_24EEC9CCC();
      char v35 = v48;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 4:
      char v86 = 4;
      sub_24EEC9C78();
      uint64_t v36 = v51;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v53);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 5:
      char v87 = 5;
      sub_24EEC9C24();
      uint64_t v37 = v54;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v56);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 6:
      char v88 = 6;
      sub_24EEC9BD0();
      int64_t v38 = v57;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v38, v59);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 7:
      char v89 = 7;
      sub_24EEC9B7C();
      int64_t v39 = v60;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v39, v62);
      return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
    case 8:
      char v90 = 8;
      sub_24EEC9B28();
      int v40 = v63;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      uint64_t v42 = v64;
      uint64_t v41 = v65;
      goto LABEL_15;
    case 9:
      char v91 = 9;
      sub_24EEC9AD4();
      int v40 = v66;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      uint64_t v42 = v67;
      uint64_t v41 = v68;
      goto LABEL_15;
    case 10:
      char v92 = 10;
      sub_24EEC9A80();
      int v40 = v69;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      uint64_t v42 = v70;
      uint64_t v41 = v71;
      goto LABEL_15;
    case 11:
      char v93 = 11;
      sub_24EEC9A2C();
      int v40 = v72;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      uint64_t v42 = v73;
      uint64_t v41 = v74;
      goto LABEL_15;
    case 12:
      char v94 = 12;
      sub_24EEC99D8();
      int v40 = v75;
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      uint64_t v42 = v76;
      uint64_t v41 = v77;
LABEL_15:
      (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
      break;
    default:
      char v82 = 0;
      sub_24EEC9DC8();
      unint64_t v31 = v79;
      uint64_t v30 = v80;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v23);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v31, v30);
}

unint64_t sub_24EEC9984()
{
  unint64_t result = qword_269978D30;
  if (!qword_269978D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D30);
  }
  return result;
}

unint64_t sub_24EEC99D8()
{
  unint64_t result = qword_269978D38;
  if (!qword_269978D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D38);
  }
  return result;
}

unint64_t sub_24EEC9A2C()
{
  unint64_t result = qword_269978D40;
  if (!qword_269978D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D40);
  }
  return result;
}

unint64_t sub_24EEC9A80()
{
  unint64_t result = qword_269978D48;
  if (!qword_269978D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D48);
  }
  return result;
}

unint64_t sub_24EEC9AD4()
{
  unint64_t result = qword_269978D50;
  if (!qword_269978D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D50);
  }
  return result;
}

unint64_t sub_24EEC9B28()
{
  unint64_t result = qword_269978D58;
  if (!qword_269978D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D58);
  }
  return result;
}

unint64_t sub_24EEC9B7C()
{
  unint64_t result = qword_269978D60;
  if (!qword_269978D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D60);
  }
  return result;
}

unint64_t sub_24EEC9BD0()
{
  unint64_t result = qword_269978D68;
  if (!qword_269978D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D68);
  }
  return result;
}

unint64_t sub_24EEC9C24()
{
  unint64_t result = qword_269978D70;
  if (!qword_269978D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D70);
  }
  return result;
}

unint64_t sub_24EEC9C78()
{
  unint64_t result = qword_269978D78;
  if (!qword_269978D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D78);
  }
  return result;
}

unint64_t sub_24EEC9CCC()
{
  unint64_t result = qword_269978D80;
  if (!qword_269978D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D80);
  }
  return result;
}

unint64_t sub_24EEC9D20()
{
  unint64_t result = qword_269978D88;
  if (!qword_269978D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D88);
  }
  return result;
}

unint64_t sub_24EEC9D74()
{
  unint64_t result = qword_269978D90;
  if (!qword_269978D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D90);
  }
  return result;
}

unint64_t sub_24EEC9DC8()
{
  unint64_t result = qword_269978D98;
  if (!qword_269978D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978D98);
  }
  return result;
}

char *DynamicTypeSize.init(from:)(void *a1)
{
  return sub_24EECA4F8(a1);
}

char *sub_24EEC9E34@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_24EECA4F8(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EEC9E60(void *a1)
{
  return DynamicTypeSize.encode(to:)(a1, *v1);
}

BOOL static DynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_24EEC9E8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_24EEC9EA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_24EEC9EB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_24EEC9EC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t DynamicTypeSize.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t DynamicTypeSize.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEC9F4C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6669636570736E75 && a2 == 0xEB00000000646569;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6C616D5378 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6C616D73 && a2 == 0xE500000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D756964656DLL && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656772616CLL && a2 == 0xE500000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656772614C78 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656772614C7878 && a2 == 0xE700000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x656772614C787878 && a2 == 0xE800000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00317974696C69 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00327974696C69 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00337974696C69 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00347974696C69 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6269737365636361 && a2 == 0xEE00357974696C69)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

char *sub_24EECA4F8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EA0);
  uint64_t v80 = *(void *)(v2 - 8);
  uint64_t v81 = v2;
  MEMORY[0x270FA5388](v2);
  char v89 = (char *)v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EA8);
  uint64_t v78 = *(void *)(v4 - 8);
  uint64_t v79 = v4;
  MEMORY[0x270FA5388](v4);
  char v88 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EB0);
  uint64_t v76 = *(void *)(v6 - 8);
  uint64_t v77 = v6;
  MEMORY[0x270FA5388](v6);
  char v87 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EB8);
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  char v86 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EC0);
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  char v85 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EC8);
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  char v84 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978ED0);
  uint64_t v69 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  char v92 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978ED8);
  uint64_t v67 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  char v91 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EE0);
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  char v90 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EE8);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  char v83 = (char *)v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EF0);
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  char v82 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978EF8);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F00);
  uint64_t v57 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F08);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[3];
  char v93 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_24EEC9984();
  uint64_t v26 = v94;
  sub_24EEDDFB0();
  if (v26) {
    goto LABEL_6;
  }
  uint64_t v54 = v20;
  v53[2] = v18;
  uint64_t v55 = v17;
  uint64_t v28 = v90;
  uint64_t v27 = v91;
  uint64_t v29 = v92;
  uint64_t v30 = v22;
  uint64_t v94 = v21;
  uint64_t v56 = v24;
  uint64_t v31 = sub_24EEDDDF0();
  uint64_t v24 = (char *)v31;
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v38 = sub_24EEDDC30();
    swift_allocError();
    int v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *int v40 = &type metadata for DynamicTypeSize;
    uint64_t v41 = v94;
    uint64_t v42 = v56;
    sub_24EEDDD90();
    sub_24EEDDC20();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x263F8DCB0], v38);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v42, v41);
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
    return v24;
  }
  v53[1] = v31;
  uint64_t v24 = (char *)*(unsigned __int8 *)(v31 + 32);
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      v95[4] = 1;
      sub_24EEC9D74();
      uint64_t v44 = v55;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v58 + 8);
      uint64_t v36 = v44;
      uint64_t v37 = (uint64_t *)&v91;
      goto LABEL_16;
    case 2:
      v95[5] = 2;
      sub_24EEC9D20();
      uint64_t v45 = v82;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v60 + 8);
      uint64_t v36 = v45;
      uint64_t v37 = (uint64_t *)&v93;
      goto LABEL_16;
    case 3:
      v95[6] = 3;
      sub_24EEC9CCC();
      uint64_t v46 = v83;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v62 + 8);
      uint64_t v36 = v46;
      uint64_t v37 = (uint64_t *)v95;
      goto LABEL_16;
    case 4:
      v95[7] = 4;
      sub_24EEC9C78();
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v64 + 8);
      uint64_t v36 = v28;
      uint64_t v37 = &v96;
      goto LABEL_16;
    case 5:
      v97[0] = 5;
      sub_24EEC9C24();
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v67 + 8);
      uint64_t v36 = v27;
      uint64_t v37 = (uint64_t *)v97;
      goto LABEL_16;
    case 6:
      v97[1] = 6;
      sub_24EEC9BD0();
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v69 + 8);
      uint64_t v36 = v29;
      uint64_t v37 = &v98;
      goto LABEL_16;
    case 7:
      v97[2] = 7;
      sub_24EEC9B7C();
      uint64_t v47 = v84;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v70 + 8);
      uint64_t v36 = v47;
      uint64_t v37 = &v99;
      goto LABEL_16;
    case 8:
      v97[3] = 8;
      sub_24EEC9B28();
      uint64_t v48 = v85;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v72 + 8);
      uint64_t v36 = v48;
      uint64_t v37 = &v100;
      goto LABEL_16;
    case 9:
      v97[4] = 9;
      sub_24EEC9AD4();
      uint64_t v50 = v86;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v50, v75);
      goto LABEL_23;
    case 0xA:
      v97[5] = 10;
      sub_24EEC9A80();
      uint64_t v51 = v87;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      uint64_t v52 = v76;
      uint64_t v49 = v77;
      goto LABEL_21;
    case 0xB:
      v97[6] = 11;
      sub_24EEC9A2C();
      uint64_t v51 = v88;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      uint64_t v52 = v78;
      uint64_t v49 = v79;
      goto LABEL_21;
    case 0xC:
      v97[7] = 12;
      sub_24EEC99D8();
      uint64_t v51 = v89;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      uint64_t v52 = v80;
      uint64_t v49 = v81;
LABEL_21:
      char v35 = *(void (**)(char *, uint64_t))(v52 + 8);
      uint64_t v36 = v51;
      break;
    default:
      v95[3] = 0;
      sub_24EEC9DC8();
      uint64_t v32 = v54;
      uint64_t v33 = v94;
      char v34 = v56;
      sub_24EEDDD80();
      char v35 = *(void (**)(char *, uint64_t))(v57 + 8);
      uint64_t v36 = v32;
      uint64_t v37 = (uint64_t *)&v85;
LABEL_16:
      uint64_t v49 = *(v37 - 32);
      break;
  }
  v35(v36, v49);
LABEL_23:
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v34, v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  return v24;
}

unint64_t sub_24EECB398()
{
  unint64_t result = qword_269978DA0;
  if (!qword_269978DA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269978DA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DA0);
  }
  return result;
}

unint64_t sub_24EECB3F8()
{
  unint64_t result = qword_269978DB0;
  if (!qword_269978DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicTypeSize()
{
  return &type metadata for DynamicTypeSize;
}

uint64_t getEnumTagSinglePayload for CropCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13FitnessCoreUI15DynamicTypeSizeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x24EECB5C0);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.CodingKeys()
{
  return &type metadata for DynamicTypeSize.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.UnspecifiedCodingKeys()
{
  return &type metadata for DynamicTypeSize.UnspecifiedCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XSmallCodingKeys()
{
  return &type metadata for DynamicTypeSize.XSmallCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.SmallCodingKeys()
{
  return &type metadata for DynamicTypeSize.SmallCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.MediumCodingKeys()
{
  return &type metadata for DynamicTypeSize.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.LargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.LargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XxLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XxLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.XxxLargeCodingKeys()
{
  return &type metadata for DynamicTypeSize.XxxLargeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility1CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility1CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility2CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility2CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility3CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility3CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility4CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility4CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicTypeSize.Accessibility5CodingKeys()
{
  return &type metadata for DynamicTypeSize.Accessibility5CodingKeys;
}

unint64_t sub_24EECB6CC()
{
  unint64_t result = qword_269978DB8;
  if (!qword_269978DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DB8);
  }
  return result;
}

unint64_t sub_24EECB724()
{
  unint64_t result = qword_269978DC0;
  if (!qword_269978DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DC0);
  }
  return result;
}

unint64_t sub_24EECB77C()
{
  unint64_t result = qword_269978DC8;
  if (!qword_269978DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DC8);
  }
  return result;
}

unint64_t sub_24EECB7D4()
{
  unint64_t result = qword_269978DD0;
  if (!qword_269978DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DD0);
  }
  return result;
}

unint64_t sub_24EECB82C()
{
  unint64_t result = qword_269978DD8;
  if (!qword_269978DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DD8);
  }
  return result;
}

unint64_t sub_24EECB884()
{
  unint64_t result = qword_269978DE0;
  if (!qword_269978DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DE0);
  }
  return result;
}

unint64_t sub_24EECB8DC()
{
  unint64_t result = qword_269978DE8;
  if (!qword_269978DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DE8);
  }
  return result;
}

unint64_t sub_24EECB934()
{
  unint64_t result = qword_269978DF0;
  if (!qword_269978DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DF0);
  }
  return result;
}

unint64_t sub_24EECB98C()
{
  unint64_t result = qword_269978DF8;
  if (!qword_269978DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978DF8);
  }
  return result;
}

unint64_t sub_24EECB9E4()
{
  unint64_t result = qword_269978E00;
  if (!qword_269978E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E00);
  }
  return result;
}

unint64_t sub_24EECBA3C()
{
  unint64_t result = qword_269978E08;
  if (!qword_269978E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E08);
  }
  return result;
}

unint64_t sub_24EECBA94()
{
  unint64_t result = qword_269978E10;
  if (!qword_269978E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E10);
  }
  return result;
}

unint64_t sub_24EECBAEC()
{
  unint64_t result = qword_269978E18;
  if (!qword_269978E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E18);
  }
  return result;
}

unint64_t sub_24EECBB44()
{
  unint64_t result = qword_269978E20;
  if (!qword_269978E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E20);
  }
  return result;
}

unint64_t sub_24EECBB9C()
{
  unint64_t result = qword_269978E28;
  if (!qword_269978E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E28);
  }
  return result;
}

unint64_t sub_24EECBBF4()
{
  unint64_t result = qword_269978E30;
  if (!qword_269978E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E30);
  }
  return result;
}

unint64_t sub_24EECBC4C()
{
  unint64_t result = qword_269978E38;
  if (!qword_269978E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E38);
  }
  return result;
}

unint64_t sub_24EECBCA4()
{
  unint64_t result = qword_269978E40;
  if (!qword_269978E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E40);
  }
  return result;
}

unint64_t sub_24EECBCFC()
{
  unint64_t result = qword_269978E48;
  if (!qword_269978E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E48);
  }
  return result;
}

unint64_t sub_24EECBD54()
{
  unint64_t result = qword_269978E50;
  if (!qword_269978E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E50);
  }
  return result;
}

unint64_t sub_24EECBDAC()
{
  unint64_t result = qword_269978E58;
  if (!qword_269978E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E58);
  }
  return result;
}

unint64_t sub_24EECBE04()
{
  unint64_t result = qword_269978E60;
  if (!qword_269978E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E60);
  }
  return result;
}

unint64_t sub_24EECBE5C()
{
  unint64_t result = qword_269978E68;
  if (!qword_269978E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E68);
  }
  return result;
}

unint64_t sub_24EECBEB4()
{
  unint64_t result = qword_269978E70;
  if (!qword_269978E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E70);
  }
  return result;
}

unint64_t sub_24EECBF0C()
{
  unint64_t result = qword_269978E78;
  if (!qword_269978E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E78);
  }
  return result;
}

unint64_t sub_24EECBF64()
{
  unint64_t result = qword_269978E80;
  if (!qword_269978E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E80);
  }
  return result;
}

unint64_t sub_24EECBFBC()
{
  unint64_t result = qword_269978E88;
  if (!qword_269978E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E88);
  }
  return result;
}

unint64_t sub_24EECC014()
{
  unint64_t result = qword_269978E90;
  if (!qword_269978E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E90);
  }
  return result;
}

unint64_t sub_24EECC06C()
{
  unint64_t result = qword_269978E98;
  if (!qword_269978E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978E98);
  }
  return result;
}

uint64_t sub_24EECC0C0(char *a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t)*(&off_2653232D8 + *a1);
  return *(void *)(v2 + 8 * (char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(*(double *)(a2 + 8)));
}

uint64_t sub_24EECC100(unsigned char *a1, double *a2)
{
  char v3 = *(unsigned char *)a2;
  double v4 = a2[1];
  double v5 = a2[2];
  uint64_t v6 = *v2;
  switch(*a1)
  {
    case 1:
      uint64_t v8 = (char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1]);
      uint64_t v9 = &unk_24EEE2F38;
      goto LABEL_5;
    case 2:
      uint64_t v8 = (char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1]);
      uint64_t v9 = &unk_24EEE2F68;
LABEL_5:
      uint64_t result = v9[v8];
      break;
    case 3:
      char v10 = _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1]);
      uint64_t result = 3;
      switch(v10)
      {
        case 1:
          if ((v3 & 1) != 0 || !sub_24EEBF50C(v6, v4, v5)) {
            uint64_t result = 5;
          }
          else {
            uint64_t result = 3;
          }
          break;
        case 2:
          uint64_t result = 2;
          break;
        case 3:
          uint64_t result = 11;
          break;
        case 4:
          uint64_t result = 13;
          break;
        case 5:
          uint64_t result = 4;
          break;
        default:
          return result;
      }
      break;
    case 4:
      uint64_t result = qword_24EEE2F98[(char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1])];
      break;
    case 5:
      uint64_t result = qword_24EEE2FF8[(char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1])];
      break;
    default:
      uint64_t result = qword_24EEE2ED8[(char)_s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(a2[1])];
      break;
  }
  return result;
}

uint64_t GridLayoutProvider.gridDescriptor(ofKind:compatibleWith:)@<X0>(char *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  char v5 = *a1;
  char v6 = *(unsigned char *)a2;
  double v8 = a2[1];
  uint64_t v7 = *((void *)a2 + 2);
  if (*((unsigned char *)a2 + 24) == 1)
  {
    uint64_t v22 = *v3;
    char v21 = v5;
    LOBYTE(v17) = v6;
    double v18 = v8;
    uint64_t v19 = v7;
    char v20 = 1;
    uint64_t v9 = sub_24EECC100(&v21, &v17);
  }
  else
  {
    char v21 = *a1;
    LOBYTE(v17) = v6;
    double v18 = v8;
    uint64_t v19 = v7;
    char v20 = 0;
    uint64_t v9 = sub_24EECC0C0(&v21, (uint64_t)&v17);
  }
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  uint64_t result = _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(v8);
  double v14 = 16.0;
  double v15 = 8.0;
  *(double *)&uint64_t v16 = 34.0;
  switch((char)result)
  {
    case 1:
      double v14 = 20.0;
      double v15 = 10.0;
      break;
    case 2:
    case 3:
      goto LABEL_6;
    case 4:
    case 5:
      *(double *)&uint64_t v16 = 52.0;
LABEL_6:
      double v15 = 20.0;
      if ((result & 0xFE) == 4) {
        double v15 = 24.0;
      }
      double v14 = *(double *)&v16;
      break;
    default:
      break;
  }
  *(void *)a3 = v11;
  *(double *)(a3 + 8) = v14;
  *(double *)(a3 + 16) = v14;
  *(double *)(a3 + 24) = v14;
  *(double *)(a3 + 32) = v14;
  *(double *)(a3 + 40) = v15;
  *(void *)(a3 + 48) = v12;
  return result;
}

uint64_t GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(char *a1, char *a2)
{
  char v3 = *a1;
  char v4 = *a2;
  char v5 = a2[24];
  uint64_t v11 = *v2;
  char v10 = v3;
  LOBYTE(v7) = v4;
  long long v8 = *(_OWORD *)(a2 + 8);
  char v9 = v5;
  uint64_t result = GridLayoutProvider.gridDescriptor(ofKind:compatibleWith:)(&v10, &v7, (uint64_t)v12);
  if (__OFSUB__(v12[0], 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  if (__OFSUB__(v12[6], 1)) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t GridLayoutProvider.itemWidthForGrid(ofKind:inContainerOfWidth:)(char *a1, double a2)
{
  char v3 = *a1;
  uint64_t v10 = *v2;
  char v9 = v3;
  v5[0] = 0;
  double v6 = a2;
  uint64_t v7 = 0;
  char v8 = 0;
  return GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(&v9, v5);
}

uint64_t sub_24EECC520(char *a1, double a2)
{
  char v3 = *a1;
  uint64_t v10 = *v2;
  char v9 = v3;
  v5[0] = 0;
  double v6 = a2;
  uint64_t v7 = 0;
  char v8 = 0;
  return GridLayoutProvider.itemWidthForGrid(ofKind:compatibleWith:)(&v9, v5);
}

ValueMetadata *type metadata accessor for GridLayoutProvider()
{
  return &type metadata for GridLayoutProvider;
}

double TabItemSizeDescriptor.containerSize.getter()
{
  return *(double *)v0;
}

__n128 TabItemSizeDescriptor.itemSize.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_24EECC5A4()
{
  if (*v0) {
    return 0x657A69536D657469;
  }
  else {
    return 0x656E6961746E6F63;
  }
}

uint64_t sub_24EECC5EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EECD1F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EECC614(uint64_t a1)
{
  unint64_t v2 = sub_24EECCDD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECC650(uint64_t a1)
{
  unint64_t v2 = sub_24EECCDD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TabItemSizeDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F10);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  uint64_t v13 = v1[5];
  uint64_t v14 = v1[6];
  uint64_t v15 = v1[7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EECCDD4();
  sub_24EEDDFC0();
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  char v24 = 0;
  type metadata accessor for CGSize(0);
  sub_24EECCE7C(&qword_269978BF8);
  sub_24EEDDE60();
  if (!v2)
  {
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    uint64_t v22 = v14;
    uint64_t v23 = v15;
    char v24 = 1;
    sub_24EECCE28();
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t TabItemSizeDescriptor.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EECCDD4();
  sub_24EEDDFB0();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    char v15 = 0;
    sub_24EECCE7C(&qword_269978C10);
    sub_24EEDDDE0();
    long long v9 = v14[0];
    char v15 = 1;
    sub_24EECCEC0();
    sub_24EEDDDE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v10 = v14[0];
    long long v11 = v14[1];
    long long v12 = v14[2];
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v11;
    a2[3] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EECCA5C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TabItemSizeDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EECCA74(void *a1)
{
  return TabItemSizeDescriptor.encode(to:)(a1);
}

uint64_t TabItemSizeDescriptor.hash(into:)()
{
  sub_24EE97F98();
  sub_24EE97F98();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t TabItemSizeDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECCBAC()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECCC4C()
{
  sub_24EE97F98();
  sub_24EE97F98();
  return NSDirectionalEdgeInsets.hash(into:)();
}

uint64_t sub_24EECCCCC()
{
  return sub_24EEDDFA0();
}

uint64_t _s13FitnessCoreUI21TabItemSizeDescriptorV2eeoiySbAC_ACtFZ_0(float64x2_t *a1, float64x2_t *a2)
{
  if (a1->f64[0] == a2->f64[0] && a1->f64[1] == a2->f64[1])
  {
    float64x2_t v4 = a1[2];
    v8[0] = a1[1];
    v8[1] = v4;
    v8[2] = a1[3];
    float64x2_t v5 = a2[2];
    v7[0] = a2[1];
    v7[1] = v5;
    v7[2] = a2[3];
    char v3 = _s13FitnessCoreUI11TabItemSizeV2eeoiySbAC_ACtFZ_0(v8, v7);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

unint64_t sub_24EECCDD4()
{
  unint64_t result = qword_269978F18;
  if (!qword_269978F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F18);
  }
  return result;
}

unint64_t sub_24EECCE28()
{
  unint64_t result = qword_269978F20;
  if (!qword_269978F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F20);
  }
  return result;
}

uint64_t sub_24EECCE7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EECCEC0()
{
  unint64_t result = qword_269978F30;
  if (!qword_269978F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F30);
  }
  return result;
}

unint64_t sub_24EECCF18()
{
  unint64_t result = qword_269978F38;
  if (!qword_269978F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F38);
  }
  return result;
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

uint64_t getEnumTagSinglePayload for TabItemSizeDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TabItemSizeDescriptor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TabItemSizeDescriptor()
{
  return &type metadata for TabItemSizeDescriptor;
}

unsigned char *storeEnumTagSinglePayload for TabItemSizeDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EECD0B8);
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

ValueMetadata *type metadata accessor for TabItemSizeDescriptor.CodingKeys()
{
  return &type metadata for TabItemSizeDescriptor.CodingKeys;
}

unint64_t sub_24EECD0F4()
{
  unint64_t result = qword_269978F40;
  if (!qword_269978F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F40);
  }
  return result;
}

unint64_t sub_24EECD14C()
{
  unint64_t result = qword_269978F48;
  if (!qword_269978F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F48);
  }
  return result;
}

unint64_t sub_24EECD1A4()
{
  unint64_t result = qword_269978F50;
  if (!qword_269978F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F50);
  }
  return result;
}

uint64_t sub_24EECD1F8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A69536D657469 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void __swiftcall FloatingTabItemIdentifier.init(itemDescriptor:)(FitnessCoreUI::FloatingTabItemIdentifier *__return_ptr retstr, FitnessCoreUI::TabItemDescriptor *itemDescriptor)
{
  uint64_t countAndFlagsBits = itemDescriptor->accessibilityLabel._countAndFlagsBits;
  object = itemDescriptor->accessibilityLabel._object;
  Swift::Bool isHidden = itemDescriptor->isHidden;
  FitnessCoreUI::TabItemKind kind = itemDescriptor->kind;
  FitnessCoreUI::TabItemStyle preferredStyle = itemDescriptor->preferredStyle;
  uint64_t v7 = itemDescriptor->title._countAndFlagsBits;
  uint64_t v8 = itemDescriptor->title._object;
  retstr->itemDescriptor.accessibilityIdentifier = itemDescriptor->accessibilityIdentifier;
  retstr->itemDescriptor.accessibilityLabel._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->itemDescriptor.accessibilityLabel._object = object;
  retstr->itemDescriptor.Swift::Bool isHidden = isHidden;
  retstr->itemDescriptor.FitnessCoreUI::TabItemKind kind = kind;
  retstr->itemDescriptor.FitnessCoreUI::TabItemStyle preferredStyle = preferredStyle;
  retstr->itemDescriptor.systemImageName = itemDescriptor->systemImageName;
  retstr->itemDescriptor.title._uint64_t countAndFlagsBits = v7;
  retstr->itemDescriptor.title._object = v8;
}

uint64_t FloatingTabItemIdentifier.itemDescriptor.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  char v5 = *(unsigned char *)(v1 + 32);
  char v6 = *(unsigned char *)(v1 + 33);
  char v7 = *(unsigned char *)(v1 + 34);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v9 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 33) = v6;
  *(unsigned char *)(a1 + 34) = v7;
  *(void *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24EECD3DC()
{
  return 0x637365446D657469;
}

uint64_t sub_24EECD400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x637365446D657469 && a2 == 0xEE00726F74706972)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24EEDDE90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24EECD4BC(uint64_t a1)
{
  unint64_t v2 = sub_24EECD6E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECD4F8(uint64_t a1)
{
  unint64_t v2 = sub_24EECD6E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FloatingTabItemIdentifier.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F58);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v18 = *v1;
  uint64_t v8 = *((void *)v1 + 2);
  uint64_t v7 = *((void *)v1 + 3);
  int v9 = *((unsigned __int8 *)v1 + 32);
  int v16 = *((unsigned __int8 *)v1 + 33);
  int v17 = v9;
  int v15 = *((unsigned __int8 *)v1 + 34);
  long long v14 = *(long long *)((char *)v1 + 40);
  uint64_t v10 = *((void *)v1 + 7);
  uint64_t v12 = *((void *)v1 + 8);
  uint64_t v13 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EECD6E4();
  sub_24EEDDFC0();
  long long v19 = v18;
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  char v22 = v17;
  char v23 = v16;
  char v24 = v15;
  long long v25 = v14;
  uint64_t v26 = v13;
  uint64_t v27 = v12;
  sub_24EECD738();
  sub_24EEDDE60();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24EECD6E4()
{
  unint64_t result = qword_269978F60;
  if (!qword_269978F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F60);
  }
  return result;
}

unint64_t sub_24EECD738()
{
  unint64_t result = qword_269978F68;
  if (!qword_269978F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F68);
  }
  return result;
}

uint64_t FloatingTabItemIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978F70);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EECD6E4();
  sub_24EEDDFB0();
  if (!v2)
  {
    sub_24EECD928();
    sub_24EEDDDE0();
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = v19;
    uint64_t v10 = v20;
    char v11 = v21;
    char v12 = v22;
    char v13 = v23;
    uint64_t v14 = v25;
    uint64_t v15 = v26;
    long long v16 = v24;
    *(_OWORD *)a2 = *(_OWORD *)&v18[8];
    *(void *)(a2 + 16) = v9;
    *(void *)(a2 + 24) = v10;
    *(unsigned char *)(a2 + 32) = v11;
    *(unsigned char *)(a2 + 33) = v12;
    *(unsigned char *)(a2 + 34) = v13;
    *(_OWORD *)(a2 + 40) = v16;
    *(void *)(a2 + 56) = v14;
    *(void *)(a2 + 64) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24EECD928()
{
  unint64_t result = qword_269978F78;
  if (!qword_269978F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F78);
  }
  return result;
}

uint64_t sub_24EECD97C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FloatingTabItemIdentifier.init(from:)(a1, a2);
}

uint64_t sub_24EECD994(void *a1)
{
  return FloatingTabItemIdentifier.encode(to:)(a1);
}

uint64_t FloatingTabItemIdentifier.hash(into:)()
{
  return TabItemDescriptor.hash(into:)();
}

uint64_t static FloatingTabItemIdentifier.== infix(_:_:)(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  char v4 = *((unsigned char *)a1 + 32);
  char v5 = *((unsigned char *)a1 + 33);
  char v6 = *((unsigned char *)a1 + 34);
  uint64_t v7 = *((void *)a1 + 7);
  uint64_t v8 = *((void *)a1 + 8);
  long long v9 = *a2;
  uint64_t v10 = *((void *)a2 + 2);
  uint64_t v11 = *((void *)a2 + 3);
  char v12 = *((unsigned char *)a2 + 32);
  char v13 = *((unsigned char *)a2 + 33);
  char v14 = *((unsigned char *)a2 + 34);
  uint64_t v15 = *((void *)a2 + 7);
  uint64_t v16 = *((void *)a2 + 8);
  long long v27 = *a1;
  uint64_t v28 = v2;
  uint64_t v29 = v3;
  char v30 = v4;
  char v31 = v5;
  char v32 = v6;
  long long v33 = *(long long *)((char *)a1 + 40);
  uint64_t v34 = v7;
  uint64_t v35 = v8;
  long long v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v11;
  char v21 = v12;
  char v22 = v13;
  char v23 = v14;
  long long v24 = *(long long *)((char *)a2 + 40);
  uint64_t v25 = v15;
  uint64_t v26 = v16;
  return _s13FitnessCoreUI17TabItemDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)&v27, (uint64_t)&v18) & 1;
}

uint64_t FloatingTabItemIdentifier.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECDB4C()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECDBEC()
{
  return TabItemDescriptor.hash(into:)();
}

uint64_t sub_24EECDC50()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECDCEC(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  char v4 = *((unsigned char *)a1 + 32);
  char v5 = *((unsigned char *)a1 + 33);
  char v6 = *((unsigned char *)a1 + 34);
  uint64_t v7 = *((void *)a1 + 7);
  uint64_t v8 = *((void *)a1 + 8);
  long long v9 = *a2;
  uint64_t v10 = *((void *)a2 + 2);
  uint64_t v11 = *((void *)a2 + 3);
  char v12 = *((unsigned char *)a2 + 32);
  char v13 = *((unsigned char *)a2 + 33);
  char v14 = *((unsigned char *)a2 + 34);
  uint64_t v15 = *((void *)a2 + 7);
  uint64_t v16 = *((void *)a2 + 8);
  long long v27 = *a1;
  uint64_t v28 = v2;
  uint64_t v29 = v3;
  char v30 = v4;
  char v31 = v5;
  char v32 = v6;
  long long v33 = *(long long *)((char *)a1 + 40);
  uint64_t v34 = v7;
  uint64_t v35 = v8;
  long long v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v11;
  char v21 = v12;
  char v22 = v13;
  char v23 = v14;
  long long v24 = *(long long *)((char *)a2 + 40);
  uint64_t v25 = v15;
  uint64_t v26 = v16;
  return _s13FitnessCoreUI17TabItemDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)&v27, (uint64_t)&v18) & 1;
}

unint64_t sub_24EECDD8C()
{
  unint64_t result = qword_26B1E74E0[0];
  if (!qword_26B1E74E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1E74E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FloatingTabItemIdentifier()
{
  return &type metadata for FloatingTabItemIdentifier;
}

unsigned char *storeEnumTagSinglePayload for FloatingTabItemIdentifier.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EECDE8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FloatingTabItemIdentifier.CodingKeys()
{
  return &type metadata for FloatingTabItemIdentifier.CodingKeys;
}

unint64_t sub_24EECDEC8()
{
  unint64_t result = qword_269978F80;
  if (!qword_269978F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F80);
  }
  return result;
}

unint64_t sub_24EECDF20()
{
  unint64_t result = qword_269978F88;
  if (!qword_269978F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F88);
  }
  return result;
}

unint64_t sub_24EECDF78()
{
  unint64_t result = qword_269978F90;
  if (!qword_269978F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F90);
  }
  return result;
}

FitnessCoreUI::CropCode_optional __swiftcall CropCode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24EEDDD70();
  result.Swift::Int value = swift_bridgeObjectRelease();
  char v5 = 13;
  if (v3 < 0xD) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CropCode.rawValue.getter()
{
  uint64_t result = 0x756F732E76617267;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x304D43462E434843;
      break;
    case 2:
      uint64_t result = 0x305743462E434843;
      break;
    case 3:
      uint64_t result = 0x545354462E544843;
      break;
    case 4:
      uint64_t result = 0x305743462E574843;
      break;
    case 5:
      uint64_t result = 0x4D4F462E57444D43;
      break;
    case 6:
      uint64_t result = 0x5450462E574D5043;
      break;
    case 7:
      uint64_t result = 0x5450462E574D5043;
      break;
    case 8:
      uint64_t result = 0x5354462E54485543;
      break;
    case 9:
      uint64_t result = 26210;
      break;
    case 0xA:
      uint64_t result = 29299;
      break;
    case 0xB:
      uint64_t result = 29294;
      break;
    case 0xC:
      uint64_t result = 0x7361652E76617267;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EECE1CC()
{
  return sub_24EED7DE8();
}

FitnessCoreUI::CropCode_optional sub_24EECE1D8(Swift::String *a1)
{
  return CropCode.init(rawValue:)(*a1);
}

uint64_t sub_24EECE1E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CropCode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24EECE20C()
{
  return sub_24EEDD910();
}

uint64_t sub_24EECE26C()
{
  return sub_24EEDD8F0();
}

unint64_t sub_24EECE2C0()
{
  unint64_t result = qword_26B1E7570;
  if (!qword_26B1E7570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7570);
  }
  return result;
}

uint64_t sub_24EECE314()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECE37C()
{
  CropCode.rawValue.getter();
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EECE3E0()
{
  return sub_24EEDDFA0();
}

unsigned char *storeEnumTagSinglePayload for CropCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x24EECE510);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CropCode()
{
  return &type metadata for CropCode;
}

unint64_t sub_24EECE548()
{
  unint64_t result = qword_26B1E7578;
  if (!qword_26B1E7578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E7578);
  }
  return result;
}

FitnessCoreUI::FloatingTabBarUpdateReason_optional __swiftcall FloatingTabBarUpdateReason.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24EEDDD70();
  result.Swift::Int value = swift_bridgeObjectRelease();
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

uint64_t FloatingTabBarUpdateReason.rawValue.getter()
{
  if (*v0) {
    return 0x684374756F79616CLL;
  }
  else {
    return 0x6E61684361746164;
  }
}

uint64_t sub_24EECE650(char *a1, char *a2)
{
  return sub_24EED7E80(*a1, *a2);
}

FitnessCoreUI::FloatingTabBarUpdateReason_optional sub_24EECE65C(Swift::String *a1)
{
  return FloatingTabBarUpdateReason.init(rawValue:)(*a1);
}

void sub_24EECE668(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6E61684361746164;
  if (*v1) {
    uint64_t v2 = 0x684374756F79616CLL;
  }
  unint64_t v3 = 0xEB00000000646567;
  if (*v1) {
    unint64_t v3 = 0xED00006465676E61;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_24EECE6BC()
{
  return sub_24EEDD910();
}

uint64_t sub_24EECE71C()
{
  return sub_24EEDD8F0();
}

unint64_t sub_24EECE770()
{
  unint64_t result = qword_269978F98;
  if (!qword_269978F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978F98);
  }
  return result;
}

uint64_t sub_24EECE7C4()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EECE85C()
{
  sub_24EEDD830();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EECE8E0()
{
  return sub_24EEDDFA0();
}

unsigned char *storeEnumTagSinglePayload for FloatingTabBarUpdateReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EECEA40);
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

ValueMetadata *type metadata accessor for FloatingTabBarUpdateReason()
{
  return &type metadata for FloatingTabBarUpdateReason;
}

unint64_t sub_24EECEA78()
{
  unint64_t result = qword_269978FA0;
  if (!qword_269978FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FA0);
  }
  return result;
}

BOOL static FloatingTabBarError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24EECEAE0()
{
  unint64_t result = 0x4964696C61766E69;
  switch(*v0)
  {
    case 2:
      unint64_t result = 0x5364696C61766E69;
      break;
    case 3:
      unint64_t result = 0x4C676E69646E6570;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EECEBA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EED04B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EECEBD0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24EECEBDC(uint64_t a1)
{
  unint64_t v2 = sub_24EECF3F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECEC18(uint64_t a1)
{
  unint64_t v2 = sub_24EECF3F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EECEC54(uint64_t a1)
{
  unint64_t v2 = sub_24EECF594();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECEC90(uint64_t a1)
{
  unint64_t v2 = sub_24EECF594();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EECECCC(uint64_t a1)
{
  unint64_t v2 = sub_24EECF540();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECED08(uint64_t a1)
{
  unint64_t v2 = sub_24EECF540();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EECED44(uint64_t a1)
{
  unint64_t v2 = sub_24EECF4EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECED80(uint64_t a1)
{
  unint64_t v2 = sub_24EECF4EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EECEDBC(uint64_t a1)
{
  unint64_t v2 = sub_24EECF498();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECEDF8(uint64_t a1)
{
  unint64_t v2 = sub_24EECF498();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EECEE34(uint64_t a1)
{
  unint64_t v2 = sub_24EECF444();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EECEE70(uint64_t a1)
{
  unint64_t v2 = sub_24EECF444();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FloatingTabBarError.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FA8);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FB0);
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  MEMORY[0x270FA5388](v5);
  char v32 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FB8);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FC0);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FC8);
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269978FD0);
  uint64_t v38 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  MEMORY[0x270FA5388](v15);
  int v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EECF3F0();
  sub_24EEDDFC0();
  switch(v18)
  {
    case 1:
      char v41 = 1;
      sub_24EECF540();
      uint64_t v21 = v39;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
      goto LABEL_8;
    case 2:
      char v42 = 2;
      sub_24EECF4EC();
      char v22 = v29;
      uint64_t v21 = v39;
      sub_24EEDDE10();
      uint64_t v24 = v30;
      uint64_t v23 = v31;
      goto LABEL_7;
    case 3:
      char v43 = 3;
      sub_24EECF498();
      char v22 = v32;
      uint64_t v21 = v39;
      sub_24EEDDE10();
      uint64_t v24 = v33;
      uint64_t v23 = v34;
      goto LABEL_7;
    case 4:
      char v44 = 4;
      sub_24EECF444();
      char v22 = v35;
      uint64_t v21 = v39;
      sub_24EEDDE10();
      uint64_t v24 = v36;
      uint64_t v23 = v37;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v21);
      break;
    default:
      char v40 = 0;
      sub_24EECF594();
      uint64_t v19 = v39;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v19);
      break;
  }
  return result;
}

unint64_t sub_24EECF3F0()
{
  unint64_t result = qword_269978FD8;
  if (!qword_269978FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FD8);
  }
  return result;
}

unint64_t sub_24EECF444()
{
  unint64_t result = qword_269978FE0;
  if (!qword_269978FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FE0);
  }
  return result;
}

unint64_t sub_24EECF498()
{
  unint64_t result = qword_269978FE8;
  if (!qword_269978FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FE8);
  }
  return result;
}

unint64_t sub_24EECF4EC()
{
  unint64_t result = qword_269978FF0;
  if (!qword_269978FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FF0);
  }
  return result;
}

unint64_t sub_24EECF540()
{
  unint64_t result = qword_269978FF8;
  if (!qword_269978FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978FF8);
  }
  return result;
}

unint64_t sub_24EECF594()
{
  unint64_t result = qword_269979000;
  if (!qword_269979000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979000);
  }
  return result;
}

uint64_t FloatingTabBarError.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979008);
  uint64_t v43 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v53 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979010);
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979018);
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v51 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979020);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979028);
  uint64_t v42 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979030);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  uint64_t v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_24EECF3F0();
  uint64_t v18 = v56;
  sub_24EEDDFB0();
  if (v18)
  {
LABEL_7:
    uint64_t v33 = (uint64_t)v55;
    return __swift_destroy_boxed_opaque_existential_1(v33);
  }
  uint64_t v39 = v10;
  char v40 = v12;
  uint64_t v19 = v9;
  uint64_t v21 = v51;
  uint64_t v20 = v52;
  uint64_t v41 = 0;
  uint64_t v56 = v14;
  char v22 = v53;
  uint64_t v23 = v54;
  uint64_t v24 = v16;
  uint64_t v25 = sub_24EEDDDF0();
  if (*(void *)(v25 + 16) != 1)
  {
    uint64_t v30 = sub_24EEDDC30();
    swift_allocError();
    char v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *char v32 = &type metadata for FloatingTabBarError;
    sub_24EEDDD90();
    sub_24EEDDC20();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v16, v13);
    goto LABEL_7;
  }
  char v26 = *(unsigned char *)(v25 + 32);
  switch(v26)
  {
    case 1:
      char v58 = 1;
      sub_24EECF540();
      uint64_t v35 = v41;
      sub_24EEDDD80();
      if (v35) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
      goto LABEL_19;
    case 2:
      char v59 = 2;
      sub_24EECF4EC();
      uint64_t v36 = v41;
      sub_24EEDDD80();
      if (v36) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v48);
      goto LABEL_19;
    case 3:
      char v60 = 3;
      sub_24EECF498();
      uint64_t v37 = v41;
      sub_24EEDDD80();
      if (v37) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v46);
LABEL_19:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      goto LABEL_21;
    case 4:
      char v61 = 4;
      sub_24EECF444();
      uint64_t v38 = v41;
      sub_24EEDDD80();
      if (v38) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v22, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      uint64_t v23 = v54;
      goto LABEL_21;
    default:
      char v27 = *(unsigned char *)(v25 + 32);
      char v57 = 0;
      sub_24EECF594();
      uint64_t v29 = v40;
      uint64_t v28 = v41;
      sub_24EEDDD80();
      if (v28)
      {
LABEL_16:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
        uint64_t v33 = (uint64_t)v55;
        return __swift_destroy_boxed_opaque_existential_1(v33);
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v24, v13);
      char v26 = v27;
LABEL_21:
      *uint64_t v23 = v26;
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      break;
  }
  return result;
}

uint64_t sub_24EECFD40@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return FloatingTabBarError.init(from:)(a1, a2);
}

uint64_t sub_24EECFD58(void *a1)
{
  return FloatingTabBarError.encode(to:)(a1);
}

uint64_t FloatingTabBarError.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t FloatingTabBarError.hashValue.getter()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EECFDE8()
{
  unint64_t result = qword_269979038;
  if (!qword_269979038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979038);
  }
  return result;
}

ValueMetadata *type metadata accessor for FloatingTabBarError()
{
  return &type metadata for FloatingTabBarError;
}

uint64_t _s13FitnessCoreUI19FloatingTabBarErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13FitnessCoreUI19FloatingTabBarErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x24EECFFB0);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.CodingKeys()
{
  return &type metadata for FloatingTabBarError.CodingKeys;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.InvalidIndexCodingKeys()
{
  return &type metadata for FloatingTabBarError.InvalidIndexCodingKeys;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.InvalidItemSizeCodingKeys()
{
  return &type metadata for FloatingTabBarError.InvalidItemSizeCodingKeys;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.InvalidSizeCodingKeys()
{
  return &type metadata for FloatingTabBarError.InvalidSizeCodingKeys;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.PendingLayoutCodingKeys()
{
  return &type metadata for FloatingTabBarError.PendingLayoutCodingKeys;
}

ValueMetadata *type metadata accessor for FloatingTabBarError.UnselectableIndexCodingKeys()
{
  return &type metadata for FloatingTabBarError.UnselectableIndexCodingKeys;
}

unint64_t sub_24EED003C()
{
  unint64_t result = qword_269979040;
  if (!qword_269979040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979040);
  }
  return result;
}

unint64_t sub_24EED0094()
{
  unint64_t result = qword_269979048;
  if (!qword_269979048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979048);
  }
  return result;
}

unint64_t sub_24EED00EC()
{
  unint64_t result = qword_269979050;
  if (!qword_269979050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979050);
  }
  return result;
}

unint64_t sub_24EED0144()
{
  unint64_t result = qword_269979058;
  if (!qword_269979058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979058);
  }
  return result;
}

unint64_t sub_24EED019C()
{
  unint64_t result = qword_269979060;
  if (!qword_269979060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979060);
  }
  return result;
}

unint64_t sub_24EED01F4()
{
  unint64_t result = qword_269979068;
  if (!qword_269979068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979068);
  }
  return result;
}

unint64_t sub_24EED024C()
{
  unint64_t result = qword_269979070;
  if (!qword_269979070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979070);
  }
  return result;
}

unint64_t sub_24EED02A4()
{
  unint64_t result = qword_269979078;
  if (!qword_269979078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979078);
  }
  return result;
}

unint64_t sub_24EED02FC()
{
  unint64_t result = qword_269979080;
  if (!qword_269979080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979080);
  }
  return result;
}

unint64_t sub_24EED0354()
{
  unint64_t result = qword_269979088;
  if (!qword_269979088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979088);
  }
  return result;
}

unint64_t sub_24EED03AC()
{
  unint64_t result = qword_269979090;
  if (!qword_269979090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979090);
  }
  return result;
}

unint64_t sub_24EED0404()
{
  unint64_t result = qword_269979098;
  if (!qword_269979098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979098);
  }
  return result;
}

unint64_t sub_24EED045C()
{
  unint64_t result = qword_2699790A0;
  if (!qword_2699790A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699790A0);
  }
  return result;
}

uint64_t sub_24EED04B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4964696C61766E69 && a2 == 0xEC0000007865646ELL;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4964696C61766E69 && a2 == 0xEF657A69536D6574 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x5364696C61766E69 && a2 == 0xEB00000000657A69 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4C676E69646E6570 && a2 == 0xED000074756F7961 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EEE65E0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

char *ActivityIndicatorView.__allocating_init(style:internalMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return ActivityIndicatorView.init(style:internalMessage:)(a1, a2, a3);
}

char *ActivityIndicatorView.init(style:internalMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v7 = objc_allocWithZone(MEMORY[0x263F823F0]);
  int v8 = v3;
  id v9 = objc_msgSend(v7, sel_initWithActivityIndicatorStyle_, a1);
  *(void *)&v8[OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_activityIndicatorView] = v9;
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v10 = objc_msgSend(self, sel_mainBundle);
  id v11 = objc_msgSend(v10, sel_bundleIdentifier);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_24EEDD7E0();
  }
  sub_24EEDD800();
  swift_bridgeObjectRelease();
  int has_internal_content = os_variant_has_internal_content();

  swift_release();
  if (has_internal_content)
  {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    if (a3)
    {
      uint64_t v15 = (void *)sub_24EEDD7B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
    }
    objc_msgSend(v14, sel_setText_, v15);

    objc_msgSend(v14, sel_setNumberOfLines_, 0);
    objc_msgSend(v14, sel_setTextAlignment_, 1);
  }
  else
  {
    swift_bridgeObjectRelease();
    id v14 = 0;
  }
  *(void *)&v8[OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_internalMessageLabel] = v14;

  v71.receiver = v8;
  v71.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v71, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v17 = self;
  uint64_t v18 = (char *)v16;
  id v19 = objc_msgSend(v17, sel_clearColor);
  objc_msgSend(v18, sel_setBackgroundColor_, v19);

  uint64_t v20 = OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_activityIndicatorView;
  uint64_t v21 = *(void **)&v18[OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_activityIndicatorView];
  objc_msgSend(v18, sel_addSubview_, v21);
  if (has_internal_content
    && (char v22 = *(void **)&v18[OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_internalMessageLabel]) != 0)
  {
    id v23 = v22;
    objc_msgSend(v18, sel_addSubview_, v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_24EEE3CD0;
    id v25 = objc_msgSend(v21, sel_topAnchor);
    id v26 = objc_msgSend(v18, sel_topAnchor);
    id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

    *(void *)(v24 + 32) = v27;
    id v28 = objc_msgSend(*(id *)&v18[v20], sel_centerXAnchor);
    id v29 = objc_msgSend(v18, sel_centerXAnchor);
    id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

    *(void *)(v24 + 40) = v30;
    id v31 = objc_msgSend(*(id *)&v18[v20], sel_leadingAnchor);
    id v32 = objc_msgSend(v18, sel_leadingAnchor);
    id v33 = objc_msgSend(v31, sel_constraintGreaterThanOrEqualToAnchor_, v32);

    *(void *)(v24 + 48) = v33;
    id v34 = objc_msgSend(*(id *)&v18[v20], sel_leadingAnchor);
    id v35 = objc_msgSend(v18, sel_leadingAnchor);
    id v36 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v35);

    sub_24EEDD9B0();
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    LODWORD(v37) = 1144750080;
    objc_msgSend(v36, sel_setPriority_, v37);
    swift_release();
    *(void *)(v24 + 56) = v36;
    id v38 = objc_msgSend(v23, sel_topAnchor);
    id v39 = objc_msgSend(*(id *)&v18[v20], sel_bottomAnchor);
    id v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v39, 10.0);

    *(void *)(v24 + 64) = v40;
    id v41 = objc_msgSend(v23, sel_centerXAnchor);
    id v42 = objc_msgSend(v18, sel_centerXAnchor);
    id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v42);

    *(void *)(v24 + 72) = v43;
    id v44 = objc_msgSend(v23, sel_leadingAnchor);
    id v45 = objc_msgSend(v18, sel_leadingAnchor);
    id v46 = objc_msgSend(v44, sel_constraintGreaterThanOrEqualToAnchor_, v45);

    *(void *)(v24 + 80) = v46;
    id v47 = objc_msgSend(v23, sel_leadingAnchor);
    id v48 = objc_msgSend(v18, sel_leadingAnchor);
    id v49 = objc_msgSend(v47, sel_constraintEqualToAnchor_, v48);

    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v50 = self;
    LODWORD(v51) = 1144750080;
    objc_msgSend(v49, sel_setPriority_, v51);
    swift_release();
    *(void *)(v24 + 88) = v49;
    id v52 = objc_msgSend(v23, sel_bottomAnchor);
    id v53 = objc_msgSend(v18, sel_bottomAnchor);
    id v54 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v53);

    *(void *)(v24 + 96) = v54;
    sub_24EEDD950();
    sub_24EEB91C0();
    uint64_t v55 = (void *)sub_24EEDD930();
    swift_bridgeObjectRelease();
    objc_msgSend(v50, sel_activateConstraints_, v55);
  }
  else
  {
    uint64_t v56 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1E7720);
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_24EEDFB00;
    id v58 = objc_msgSend(v21, sel_topAnchor);
    id v59 = objc_msgSend(v18, sel_topAnchor);
    id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v59);

    *(void *)(v57 + 32) = v60;
    id v61 = objc_msgSend(*(id *)&v18[v20], sel_leadingAnchor);
    id v62 = objc_msgSend(v18, sel_leadingAnchor);
    id v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v62);

    *(void *)(v57 + 40) = v63;
    id v64 = objc_msgSend(*(id *)&v18[v20], sel_trailingAnchor);
    id v65 = objc_msgSend(v18, sel_trailingAnchor);
    id v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_, v65);

    *(void *)(v57 + 48) = v66;
    id v67 = objc_msgSend(*(id *)&v18[v20], sel_bottomAnchor);
    id v68 = objc_msgSend(v18, sel_bottomAnchor);
    id v69 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v68);

    *(void *)(v57 + 56) = v69;
    sub_24EEDD950();
    sub_24EEB91C0();
    uint64_t v55 = (void *)sub_24EEDD930();
    swift_bridgeObjectRelease();
    objc_msgSend(v56, sel_activateConstraints_, v55);
  }

  ActivityIndicatorView.deactivate()();
  return v18;
}

Swift::Void __swiftcall ActivityIndicatorView.deactivate()()
{
}

id ActivityIndicatorView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t ActivityIndicatorView.init(coder:)()
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = sub_24EEDDCF0();
  __break(1u);
  return result;
}

Swift::Void __swiftcall ActivityIndicatorView.updateInternalMessage(_:)(Swift::String_optional a1)
{
  object = a1.value._object;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_internalMessageLabel);
  if (v3)
  {
    if (object) {
      uint64_t v4 = sub_24EEDD7B0();
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = (id)v4;
    objc_msgSend(v3, sel_setText_);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

Swift::Void __swiftcall ActivityIndicatorView.activate()()
{
}

uint64_t sub_24EED146C(double a1, uint64_t a2, SEL *a3)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  [*(id *)(v3 + OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_activityIndicatorView) *a3];
  char v6 = *(void **)(v3 + OBJC_IVAR____TtC13FitnessCoreUI21ActivityIndicatorView_internalMessageLabel);
  if (v6) {
    objc_msgSend(v6, sel_setAlpha_, a1);
  }
  return swift_release();
}

id ActivityIndicatorView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ActivityIndicatorView.init(frame:)()
{
}

id ActivityIndicatorView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityIndicatorView()
{
  return self;
}

uint64_t method lookup function for ActivityIndicatorView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityIndicatorView);
}

uint64_t dispatch thunk of ActivityIndicatorView.__allocating_init(style:internalMessage:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id static UIFont.preferredFont(forTextStyle:design:symbolicTraits:weight:compatibleWith:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  return sub_24EED1DF4(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5 & 1, a6);
}

id static UIFont._preferredFont(forTextStyle:design:symbolicTraits:weight:maximumContentSizeCategory:compatibleWith:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
  id v10 = sub_24EED1DF4(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5 & 1, (uint64_t)a7);
  id v11 = objc_msgSend(v10, sel_fontDescriptor);

  id v12 = objc_msgSend(a7, sel_preferredContentSizeCategory);
  LOBYTE(v10) = sub_24EEDDAC0();

  double v13 = 0.0;
  if (v10)
  {
    id v14 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, a6);
    id v15 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v14);
    objc_msgSend(v15, sel_pointSize);
    double v13 = v16;
  }
  id v17 = objc_msgSend(self, sel_fontWithDescriptor_size_, v11, v13);

  return v17;
}

id static UIFont.systemFont(ofSize:weight:design:symbolicTraits:)(uint64_t a1, char a2, uint64_t a3, unsigned int a4, double a5)
{
  return sub_24EED200C(a1, a2 & 1, a3, a4, a5);
}

id static UIFont.systemFont(ofSize:weight:design:)(uint64_t a1, char a2, uint64_t a3, double a4)
{
  if (a2) {
    id v5 = objc_msgSend(self, sel_systemFontOfSize_, a4);
  }
  else {
    id v5 = objc_msgSend(self, sel_systemFontOfSize_weight_, a4, *(double *)&a1);
  }
  id v6 = v5;
  id v7 = objc_msgSend(v6, sel_fontDescriptor);
  id v8 = objc_msgSend(v7, sel_fontDescriptorWithDesign_, a3);
  if (v8)
  {
    id v9 = v8;

    id v7 = v9;
  }
  id v10 = objc_msgSend(self, sel_fontWithDescriptor_size_, v7, 0.0);

  return v10;
}

id static UIFont.systemFont(ofSize:weight:symbolicTraits:)(uint64_t a1, char a2, unsigned int a3, double a4)
{
  return sub_24EED200C(a1, a2 & 1, 0, a3, a4);
}

UIFont __swiftcall UIFont.centeredColonsVersion()()
{
  return (UIFont)sub_24EED1C2C(35, 6);
}

UIFont __swiftcall UIFont.monospaced()()
{
  id v1 = objc_msgSend(v0, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EEDFB10;
  uint64_t v3 = (void *)*MEMORY[0x263F81740];
  *(void *)(inited + 32) = *MEMORY[0x263F81740];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24EEE3D10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790B8);
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_24EEE3D10;
  id v6 = (void *)*MEMORY[0x263F83558];
  *(void *)(v5 + 32) = *MEMORY[0x263F83558];
  *(void *)(v5 + 40) = 6;
  id v7 = (void *)*MEMORY[0x263F83540];
  *(void *)(v5 + 48) = *MEMORY[0x263F83540];
  *(void *)(v5 + 56) = 0;
  id v8 = v3;
  id v9 = v6;
  id v10 = v7;
  *(void *)(v4 + 32) = sub_24EEBBFE0(v5);
  uint64_t v11 = swift_initStackObject();
  *(_OWORD *)(v11 + 16) = xmmword_24EEE3D10;
  *(void *)(v11 + 32) = v9;
  *(void *)(v11 + 40) = 22;
  *(void *)(v11 + 48) = v10;
  *(void *)(v11 + 56) = 1;
  id v12 = v9;
  id v13 = v10;
  *(void *)(v4 + 40) = sub_24EEBBFE0(v11);
  *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2699790D0);
  *(void *)(inited + 40) = v4;
  sub_24EEBBE88(inited);
  type metadata accessor for AttributeName(0);
  sub_24EED226C();
  id v14 = (void *)sub_24EEDD750();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v1, sel_fontDescriptorByAddingAttributes_, v14);

  id v16 = objc_msgSend(self, sel_fontWithDescriptor_size_, v15, 0.0);
  return (UIFont)v16;
}

UIFont __swiftcall UIFont.smallCapsVersion()()
{
  return (UIFont)sub_24EED1C2C(38, 1);
}

UIFont __swiftcall UIFont.shortSlashVersion()()
{
  return (UIFont)sub_24EED1C2C(33, 0);
}

id sub_24EED1C2C(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EEE3D10;
  id v7 = (void *)*MEMORY[0x263F83558];
  *(void *)(inited + 32) = *MEMORY[0x263F83558];
  *(void *)(inited + 40) = a1;
  id v8 = (void *)*MEMORY[0x263F83540];
  *(void *)(inited + 48) = *MEMORY[0x263F83540];
  *(void *)(inited + 56) = a2;
  id v9 = v7;
  id v10 = v8;
  unint64_t v11 = sub_24EEBBFE0(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C0);
  uint64_t v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_24EEDFB10;
  id v13 = (void *)*MEMORY[0x263F81740];
  *(void *)(v12 + 32) = *MEMORY[0x263F81740];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_24EEDFB10;
  *(void *)(v14 + 32) = v11;
  *(void *)(v12 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2699790D0);
  *(void *)(v12 + 40) = v14;
  id v15 = v13;
  sub_24EEBBE88(v12);
  type metadata accessor for AttributeName(0);
  sub_24EED226C();
  id v16 = (void *)sub_24EEDD750();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v5, sel_fontDescriptorByAddingAttributes_, v16);

  id v18 = objc_msgSend(self, sel_fontWithDescriptor_size_, v17, 0.0);
  return v18;
}

id sub_24EED1DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  id v10 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, a6);
  unint64_t v11 = v10;
  if ((a3 & 0x100000000) == 0)
  {
    id v12 = objc_msgSend(v10, sel_fontDescriptorWithSymbolicTraits_, a3);
    if (v12)
    {
      id v13 = v12;

      unint64_t v11 = v13;
    }
  }
  if ((a5 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24EEDFB10;
    id v15 = (void *)*MEMORY[0x263F817A8];
    *(void *)(inited + 32) = *MEMORY[0x263F817A8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699790D8);
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = xmmword_24EEDFB10;
    id v17 = (void *)*MEMORY[0x263F81858];
    *(void *)(v16 + 32) = *MEMORY[0x263F81858];
    *(void *)(v16 + 40) = a4;
    id v18 = v15;
    id v19 = v17;
    unint64_t v20 = sub_24EEBBD7C(v16);
    *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2699790E0);
    *(void *)(inited + 40) = v20;
    sub_24EEBBE88(inited);
    type metadata accessor for AttributeName(0);
    sub_24EED226C();
    uint64_t v21 = (void *)sub_24EEDD750();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v11, sel_fontDescriptorByAddingAttributes_, v21);

    unint64_t v11 = v22;
  }
  if (a2)
  {
    id v23 = objc_msgSend(v11, sel_fontDescriptorWithDesign_, a2);
    if (v23)
    {
      id v24 = v23;

      unint64_t v11 = v24;
    }
  }
  id v25 = objc_msgSend(self, sel_fontWithDescriptor_size_, v11, 0.0);

  return v25;
}

id sub_24EED200C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  if (a2) {
    id v9 = objc_msgSend(self, sel_systemFontOfSize_, a5);
  }
  else {
    id v9 = objc_msgSend(self, sel_systemFontOfSize_weight_, a5, *(double *)&a1);
  }
  id v10 = v9;
  id v11 = objc_msgSend(v10, sel_fontDescriptor);
  id v12 = v11;
  if ((a4 & 0x100000000) == 0)
  {
    id v13 = objc_msgSend(v11, sel_fontDescriptorWithSymbolicTraits_, a4);
    if (v13)
    {
      id v14 = v13;

      id v12 = v14;
    }
    if ((a2 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699790C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24EEDFB10;
      uint64_t v16 = (void *)*MEMORY[0x263F817A8];
      *(void *)(inited + 32) = *MEMORY[0x263F817A8];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699790D8);
      uint64_t v17 = swift_initStackObject();
      *(_OWORD *)(v17 + 16) = xmmword_24EEDFB10;
      id v18 = (void *)*MEMORY[0x263F81858];
      *(void *)(v17 + 32) = *MEMORY[0x263F81858];
      *(void *)(v17 + 40) = a1;
      id v19 = v16;
      id v20 = v18;
      unint64_t v21 = sub_24EEBBD7C(v17);
      *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2699790E0);
      *(void *)(inited + 40) = v21;
      sub_24EEBBE88(inited);
      type metadata accessor for AttributeName(0);
      sub_24EED226C();
      id v22 = (void *)sub_24EEDD750();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v12, sel_fontDescriptorByAddingAttributes_, v22);

      id v12 = v23;
    }
  }
  if (a3)
  {
    id v24 = objc_msgSend(v12, sel_fontDescriptorWithDesign_, a3);
    if (v24)
    {
      id v25 = v24;

      id v12 = v25;
    }
  }
  id v26 = objc_msgSend(self, sel_fontWithDescriptor_size_, v12, 0.0);

  return v26;
}

unint64_t sub_24EED226C()
{
  unint64_t result = qword_269978080;
  if (!qword_269978080)
  {
    type metadata accessor for AttributeName(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269978080);
  }
  return result;
}

uint64_t dispatch thunk of FloatingTabBarLayoutProviding.contentInsets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FloatingTabBarLayoutProviding.itemSizesByDescriptor(for:in:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FloatingTabBarLayoutProviding.itemSizes(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of FloatingTabBarLayoutProviding.minimumSize(using:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

id NSLayoutConstraint.withPriority(_:)(float a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(float *)&double v3 = a1;
  objc_msgSend(v1, sel_setPriority_, v3);
  id v4 = v1;
  swift_release();
  return v4;
}

void static NSLayoutConstraint.activate(_:)(uint64_t a1)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v2; ++i)
    {
      unint64_t v4 = *(void *)(a1 + 8 * i + 32);
      swift_bridgeObjectRetain();
      sub_24EEDD9A0();
      sub_24EEDD990();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      sub_24EED258C(v4);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_24EEB91C0();
  id v6 = (id)sub_24EEDD930();
  swift_bridgeObjectRelease();
  objc_msgSend(ObjCClassFromMetadata, sel_activateConstraints_, v6);
  swift_release();
}

uint64_t sub_24EED258C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24EEDDD10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24EEDDD10();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x25334F000](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24EED2758(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24EEDDD10();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24EEDD950();
}

uint64_t sub_24EED2758(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24EEDDD10();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24EEDDD10();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24EED2A0C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2699790E8);
          uint64_t v12 = sub_24EED295C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24EEB91C0();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

void (*sub_24EED295C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24EED2A68(v6, a2, a3);
  return sub_24EED29C4;
}

void sub_24EED29C4(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_24EED2A0C()
{
  unint64_t result = qword_2699790F0;
  if (!qword_2699790F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699790E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699790F0);
  }
  return result;
}

void (*sub_24EED2A68(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25334EFF0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_24EED2AE8;
  }
  __break(1u);
  return result;
}

void sub_24EED2AE8(id *a1)
{
}

CGSize __swiftcall CGSize.rounded()()
{
  double v2 = ceil(v0);
  double v3 = ceil(v1);
  result.double height = v3;
  result.double width = v2;
  return result;
}

uint64_t sub_24EED2AFC()
{
  return sub_24EEDDF90();
}

double ViewLayout.containerSize.getter()
{
  return *(double *)v0;
}

uint64_t ViewLayout.gridSizeClass.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24EED2B40()
{
  if (*v0) {
    return 0x657A695364697267;
  }
  else {
    return 0x656E6961746E6F63;
  }
}

uint64_t sub_24EED2B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EED3598(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EED2BBC(uint64_t a1)
{
  unint64_t v2 = sub_24EED2DF8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED2BF8(uint64_t a1)
{
  unint64_t v2 = sub_24EED2DF8();
  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_24EED2C34()
{
  return *(double *)v0;
}

uint64_t sub_24EED2C3C()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ViewLayout.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699790F8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  char v10 = *((unsigned char *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EED2DF8();
  sub_24EEDDFC0();
  v12[0] = v8;
  v12[1] = v9;
  char v13 = 0;
  type metadata accessor for CGSize(0);
  sub_24EECCE7C(&qword_269978BF8);
  sub_24EEDDE60();
  if (!v2)
  {
    LOBYTE(v12[0]) = v10;
    char v13 = 1;
    sub_24EED2E4C();
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24EED2DF8()
{
  unint64_t result = qword_269979100;
  if (!qword_269979100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979100);
  }
  return result;
}

unint64_t sub_24EED2E4C()
{
  unint64_t result = qword_269979108;
  if (!qword_269979108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979108);
  }
  return result;
}

uint64_t ViewLayout.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979110);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EED2DF8();
  sub_24EEDDFB0();
  if (!v2)
  {
    type metadata accessor for CGSize(0);
    char v14 = 0;
    sub_24EECCE7C(&qword_269978C10);
    sub_24EEDDDE0();
    uint64_t v9 = v13[0];
    uint64_t v10 = v13[1];
    char v14 = 1;
    sub_24EED3094();
    sub_24EEDDDE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v11 = v13[0];
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 16) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24EED3094()
{
  unint64_t result = qword_269979118;
  if (!qword_269979118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979118);
  }
  return result;
}

uint64_t sub_24EED30E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ViewLayout.init(from:)(a1, a2);
}

uint64_t sub_24EED3100(void *a1)
{
  return ViewLayout.encode(to:)(a1);
}

uint64_t ViewLayout.hash(into:)()
{
  return sub_24EEDDF90();
}

uint64_t ViewLayout.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED31B0()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED3208()
{
  return sub_24EEDDFA0();
}

BOOL _s13FitnessCoreUI10ViewLayoutV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && dbl_24EEE3F68[*(char *)(a1 + 16)] == dbl_24EEE3F68[*(char *)(a2 + 16)];
}

unint64_t sub_24EED32A0()
{
  unint64_t result = qword_269979120;
  if (!qword_269979120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979120);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ViewLayout(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 6;
  int v5 = v3 - 6;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewLayout()
{
  return &type metadata for ViewLayout;
}

unsigned char *storeEnumTagSinglePayload for ViewLayout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EED3458);
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

ValueMetadata *type metadata accessor for ViewLayout.CodingKeys()
{
  return &type metadata for ViewLayout.CodingKeys;
}

unint64_t sub_24EED3494()
{
  unint64_t result = qword_269979128;
  if (!qword_269979128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979128);
  }
  return result;
}

unint64_t sub_24EED34EC()
{
  unint64_t result = qword_269979130;
  if (!qword_269979130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979130);
  }
  return result;
}

unint64_t sub_24EED3544()
{
  unint64_t result = qword_269979138;
  if (!qword_269979138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979138);
  }
  return result;
}

uint64_t sub_24EED3598(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t dispatch thunk of FloatingTabBarDelegate.floatingTabBar(_:didRequestActionAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of FloatingTabBarDelegate.floatingTabBar(_:didSelectItemAtIndex:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void ColorDescriptor.init(red:green:blue:alpha:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a5;
  a1[1] = a4;
  a1[2] = a3;
  a1[3] = a2;
}

double ColorDescriptor.alpha.getter()
{
  return *(double *)v0;
}

double ColorDescriptor.blue.getter()
{
  return *(double *)(v0 + 8);
}

double ColorDescriptor.green.getter()
{
  return *(double *)(v0 + 16);
}

double ColorDescriptor.red.getter()
{
  return *(double *)(v0 + 24);
}

double static ColorDescriptor.clear.getter@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_24EED3734()
{
  uint64_t result = 0x6168706C61;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1702194274;
      break;
    case 2:
      uint64_t result = 0x6E65657267;
      break;
    case 3:
      uint64_t result = 6579570;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EED37A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EED40FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EED37D0(uint64_t a1)
{
  unint64_t v2 = sub_24EED3A54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED380C(uint64_t a1)
{
  unint64_t v2 = sub_24EED3A54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ColorDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1E76B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EED3A54();
  sub_24EEDDFC0();
  uint64_t v14 = v9;
  HIBYTE(v13) = 0;
  sub_24EE89B64();
  sub_24EEDDE60();
  if (!v2)
  {
    uint64_t v14 = v8;
    HIBYTE(v13) = 1;
    sub_24EEDDE60();
    uint64_t v14 = v11;
    HIBYTE(v13) = 2;
    sub_24EEDDE60();
    uint64_t v14 = v10;
    HIBYTE(v13) = 3;
    sub_24EEDDE60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24EED3A54()
{
  unint64_t result = qword_26B1E73A0;
  if (!qword_26B1E73A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E73A0);
  }
  return result;
}

uint64_t ColorDescriptor.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979140);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EED3A54();
  sub_24EEDDFB0();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_24EE89E9C();
    sub_24EEDDDE0();
    uint64_t v9 = v15;
    HIBYTE(v14) = 1;
    sub_24EEDDDE0();
    uint64_t v10 = v15;
    HIBYTE(v14) = 2;
    sub_24EEDDDE0();
    uint64_t v12 = v15;
    HIBYTE(v14) = 3;
    sub_24EEDDDE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EED3D04@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ColorDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EED3D1C(void *a1)
{
  return ColorDescriptor.encode(to:)(a1);
}

uint64_t ColorDescriptor.hash(into:)()
{
  return sub_24EEDDF90();
}

uint64_t ColorDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED3DF0()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED3E40()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EED3E8C()
{
  unint64_t result = qword_26B1E73B8[0];
  if (!qword_26B1E73B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1E73B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorDescriptor()
{
  return &type metadata for ColorDescriptor;
}

unsigned char *storeEnumTagSinglePayload for ColorDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EED3FBCLL);
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

ValueMetadata *type metadata accessor for ColorDescriptor.CodingKeys()
{
  return &type metadata for ColorDescriptor.CodingKeys;
}

unint64_t sub_24EED3FF8()
{
  unint64_t result = qword_269979148;
  if (!qword_269979148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979148);
  }
  return result;
}

unint64_t sub_24EED4050()
{
  unint64_t result = qword_26B1E73B0;
  if (!qword_26B1E73B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E73B0);
  }
  return result;
}

unint64_t sub_24EED40A8()
{
  unint64_t result = qword_26B1E73A8;
  if (!qword_26B1E73A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1E73A8);
  }
  return result;
}

uint64_t sub_24EED40FC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6168706C61 && a2 == 0xE500000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 6579570 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t View.fitnessAccessibilityIdentifier(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EED42D0(a1, a2, a3, 13, (void (*)(uint64_t, uint64_t, uint64_t))View.fitnessAccessibilityIdentifier(_:));
}

{
  return sub_24EED43C4(a1, a2, a3, 17, (uint64_t)&type metadata for FitnessAccessibilityIdentifierModifier);
}

uint64_t View.fitnessAccessibilityScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EED42D0(a1, a2, a3, 21, (void (*)(uint64_t, uint64_t, uint64_t))View.fitnessAccessibilityScope(_:));
}

{
  return sub_24EED43C4(a1, a2, a3, 25, (uint64_t)&type metadata for FitnessAccessibilityScopeModifier);
}

uint64_t sub_24EED42D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  a5(a1, a2, a3);
  return swift_release();
}

uint64_t sub_24EED43C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  char v11 = 0;
  uint64_t v12 = a1;
  swift_bridgeObjectRetain();
  MEMORY[0x25334EAF0](&KeyPath, a2, a5, a3);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t View.rootFitnessAccessibilityScope(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EED42D0(a1, a2, a3, 29, (void (*)(uint64_t, uint64_t, uint64_t))View.rootFitnessAccessibilityScope(_:));
}

{
  uint64_t v7;

  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = a1;
  MEMORY[0x25334EAF0](&v7, a2, &type metadata for RootFitnessAccessibilityScopeModifier, a3);
  return swift_release();
}

uint64_t withFitnessAccessibilityScope<A>(_:content:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  withFitnessAccessibilityScope<A>(_:content:)(a1, a2, a3, a4, a5);
  return swift_release();
}

{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t isCurrentExecutor;
  uint64_t v13;
  uint64_t v14;

  uint64_t v14 = a5;
  uint64_t v8 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  a2(isCurrentExecutor);
  View.fitnessAccessibilityScope(_:)(a1, a4, v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a4);
  return swift_release();
}

uint64_t sub_24EED4814@<X0>(char *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = a3 & 1;
  sub_24EEDD9B0();
  uint64_t v10 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979170);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v40 = &v38;
  MEMORY[0x270FA5388](v14);
  id v39 = (char *)&v38 - v15;
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t v17 = v16;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EED4FB4(a2, v9);
  uint64_t v18 = sub_24EED5AD0(a2, v9);
  sub_24EED4FC4(a2, v9);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269979178);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EEE3D10;
  *(void *)(inited + 32) = v18;
  *(void *)(inited + 40) = a4;
  int64_t v20 = *(void *)(v18 + 16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_24EED5F44(0, v20, 1, MEMORY[0x263F8EE78]);
  id v22 = v21;
  uint64_t v23 = *(void *)(v18 + 16);
  id v41 = v13;
  id v42 = a1;
  if (v23)
  {
    uint64_t v24 = v21[2];
    if ((v21[3] >> 1) - v24 < v20)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    unint64_t v25 = (unint64_t)&v21[2 * v24 + 4];
    if (v18 + 32 < v25 + 16 * v20 && v25 < v18 + 32 + 16 * v20) {
      goto LABEL_35;
    }
    swift_arrayInitWithCopy();
    if (v20)
    {
      uint64_t v26 = v22[2];
      BOOL v27 = __OFADD__(v26, v20);
      uint64_t v28 = v26 + v20;
      if (v27)
      {
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      v22[2] = v28;
    }
  }
  else if (v20)
  {
    __break(1u);
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(inited + 40);
  int64_t v20 = *(void *)(v17 + 16);
  uint64_t v13 = (char *)v22[2];
  a1 = &v13[v20];
  if (__OFADD__(v13, v20))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v38 = inited + 32;
  uint64_t v10 = a5;
  unint64_t v29 = v22[3];
  swift_bridgeObjectRetain();
  if ((uint64_t)a1 <= (uint64_t)(v29 >> 1))
  {
    if (v20) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_24:
  if ((uint64_t)v13 <= (uint64_t)a1) {
    int64_t v34 = (int64_t)a1;
  }
  else {
    int64_t v34 = (int64_t)v13;
  }
  id v22 = sub_24EED5F44((void *)1, v34, 1, v22);
  if (!*(void *)(v17 + 16))
  {
LABEL_28:
    if (!v20) {
      goto LABEL_29;
    }
    __break(1u);
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v30 = v22[2];
  if ((v22[3] >> 1) - v30 < v20)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v31 = (unint64_t)&v22[2 * v30 + 4];
  if (v17 + 32 < v31 + 16 * v20 && v31 < v17 + 32 + 16 * v20) {
    goto LABEL_35;
  }
  swift_arrayInitWithCopy();
  if (!v20)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269979180);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    id v43 = v22;
    sub_24EED6054();
    swift_bridgeObjectRetain();
    sub_24EEDD780();
    swift_bridgeObjectRelease_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269979190);
    sub_24EEA527C(&qword_269979198, &qword_269979190);
    uint64_t v35 = (uint64_t)v39;
    sub_24EEDD6F0();
    swift_bridgeObjectRelease();
    uint64_t v36 = (uint64_t)v41;
    sub_24EED60B0(v35, (uint64_t)v41);
    sub_24EED60B0(v36, v10);
    return swift_release();
  }
  uint64_t v32 = v22[2];
  BOOL v27 = __OFADD__(v32, v20);
  uint64_t v33 = v32 + v20;
  if (!v27)
  {
    v22[2] = v33;
    goto LABEL_29;
  }
LABEL_34:
  __break(1u);
LABEL_35:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EED4CF0()
{
  sub_24EED6364();
  sub_24EEDD570();
  return v1;
}

uint64_t sub_24EED4D2C@<X0>(void *a1@<X8>)
{
  sub_24EED6364();
  uint64_t result = sub_24EEDD570();
  *a1 = v3;
  return result;
}

uint64_t sub_24EED4D7C()
{
  return sub_24EEDD580();
}

uint64_t sub_24EED4DE0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx011FitnessCoreB00F31AccessibilityIdentifierModifier33_6F0E507CDD7514AB27D67C0FBBF56CE7LLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for FitnessAccessibilityIdentifierModifier, (void (*)(void))sub_24EED4E00);
}

unint64_t sub_24EED4E00()
{
  unint64_t result = qword_269979158;
  if (!qword_269979158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979158);
  }
  return result;
}

uint64_t sub_24EED4E54(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx011FitnessCoreB00F31AccessibilityIdentifierModifier33_6F0E507CDD7514AB27D67C0FBBF56CE7LLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for FitnessAccessibilityScopeModifier, (void (*)(void))sub_24EED4E74);
}

unint64_t sub_24EED4E74()
{
  unint64_t result = qword_269979160;
  if (!qword_269979160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979160);
  }
  return result;
}

uint64_t sub_24EED4EC8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx011FitnessCoreB00F31AccessibilityIdentifierModifier33_6F0E507CDD7514AB27D67C0FBBF56CE7LLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for RootFitnessAccessibilityScopeModifier, (void (*)(void))sub_24EED4F4C);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx011FitnessCoreB00F31AccessibilityIdentifierModifier33_6F0E507CDD7514AB27D67C0FBBF56CE7LLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_24EED4F4C()
{
  unint64_t result = qword_269979168;
  if (!qword_269979168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979168);
  }
  return result;
}

ValueMetadata *type metadata accessor for RootFitnessAccessibilityScopeModifier()
{
  return &type metadata for RootFitnessAccessibilityScopeModifier;
}

uint64_t sub_24EED4FB4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_24EED4FC4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScopeModifier()
{
  return &type metadata for FitnessAccessibilityScopeModifier;
}

uint64_t _s13FitnessCoreUI33FitnessAccessibilityScopeModifierVwxx_0(uint64_t a1)
{
  sub_24EED4FC4(*(void *)a1, *(unsigned char *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t _s13FitnessCoreUI33FitnessAccessibilityScopeModifierVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24EED4FB4(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13FitnessCoreUI33FitnessAccessibilityScopeModifierVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_24EED4FB4(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24EED4FC4(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13FitnessCoreUI33FitnessAccessibilityScopeModifierVwta_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_24EED4FC4(v6, v7);
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13FitnessCoreUI33FitnessAccessibilityScopeModifierVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24EED51A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityIdentifierModifier()
{
  return &type metadata for FitnessAccessibilityIdentifierModifier;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScope()
{
  return &type metadata for FitnessAccessibilityScope;
}

uint64_t sub_24EED5208(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_24EEE9E78, 1);
}

uint64_t sub_24EED5224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EED565C(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void))sub_24EED4814);
}

uint64_t sub_24EED523C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v10 = a3 & 1;
  sub_24EEDD9B0();
  uint64_t v11 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  uint64_t v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EED4FB4(a2, v10);
  uint64_t v14 = sub_24EED5AD0(a2, v10);
  sub_24EED4FC4(a2, v10);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269979178);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24EEE3D10;
  *(void *)(inited + 32) = v14;
  uint64_t v16 = inited + 32;
  *(void *)(inited + 40) = a4;
  int64_t v17 = *(void *)(v14 + 16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_24EED5F44(0, v17, 1, MEMORY[0x263F8EE78]);
  id v19 = v18;
  if (*(void *)(v14 + 16))
  {
    uint64_t v20 = v18[2];
    if ((v18[3] >> 1) - v20 < v17)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    unint64_t v21 = (unint64_t)&v18[2 * v20 + 4];
    if (v14 + 32 < v21 + 16 * v17 && v21 < v14 + 32 + 16 * v17) {
      goto LABEL_38;
    }
    swift_arrayInitWithCopy();
    if (v17)
    {
      uint64_t v23 = v19[2];
      BOOL v24 = __OFADD__(v23, v17);
      uint64_t v25 = v23 + v17;
      if (v24)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      v19[2] = v25;
    }
  }
  else if (v17)
  {
    __break(1u);
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  int64_t v17 = *(void *)(inited + 40);
  uint64_t v13 = *(void *)(v17 + 16);
  int64_t v5 = v19[2];
  uint64_t v11 = v5 + v13;
  if (__OFADD__(v5, v13))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v16 = a1;
  a1 = a5;
  unint64_t v26 = v19[3];
  swift_bridgeObjectRetain();
  if (v11 <= (uint64_t)(v26 >> 1))
  {
    uint64_t v27 = a1;
    if (v13) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_27:
  if (v5 <= v11) {
    int64_t v32 = v11;
  }
  else {
    int64_t v32 = v5;
  }
  id v19 = sub_24EED5F44((void *)1, v32, 1, v19);
  uint64_t v27 = a1;
  if (!*(void *)(v17 + 16))
  {
LABEL_31:
    if (!v13) {
      goto LABEL_32;
    }
    __break(1u);
    goto LABEL_34;
  }
LABEL_19:
  uint64_t v28 = v19[2];
  if ((v19[3] >> 1) - v28 < v13)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unint64_t v29 = (unint64_t)&v19[2 * v28 + 4];
  if (v17 + 32 < v29 + 16 * v13 && v29 < v17 + 32 + 16 * v13) {
    goto LABEL_38;
  }
  swift_arrayInitWithCopy();
  if (!v13)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269979180);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699791A8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v27, v16, v34);
    swift_release();
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2699791B0);
    uint64_t v36 = (uint64_t *)(v27 + *(int *)(result + 36));
    *uint64_t v36 = KeyPath;
    v36[1] = (uint64_t)v19;
    return result;
  }
  uint64_t v30 = v19[2];
  BOOL v24 = __OFADD__(v30, v13);
  uint64_t v31 = v30 + v13;
  if (!v24)
  {
    v19[2] = v31;
    goto LABEL_32;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EED5644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EED565C(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void))sub_24EED523C);
}

uint64_t sub_24EED565C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void))
{
  return a4(a1, *(void *)v4, *(unsigned __int8 *)(v4 + 8), *(void *)(v4 + 16));
}

uint64_t sub_24EED567C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24EEDD9B0();
  uint64_t v8 = sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269979178);
  uint64_t inited = swift_initStackObject();
  uint64_t v10 = (uint64_t)&unk_270096490;
  *(_OWORD *)(inited + 16) = xmmword_24EEE3D10;
  *(void *)(inited + 32) = &unk_270096490;
  *(void *)(inited + 40) = a2;
  int64_t v11 = qword_2700964A0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24EED5F44(0, v11, 1, MEMORY[0x263F8EE78]);
  uint64_t v13 = v12;
  if (qword_2700964A0)
  {
    uint64_t v14 = v12[2];
    if ((v12[3] >> 1) - v14 < v11)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    uint64_t v15 = (char *)&v12[2 * v14 + 4];
    if (&v15[16 * v11] > aFitnessplus && v15 < &aFitnessplus[16 * v11]) {
      goto LABEL_40;
    }
    swift_arrayInitWithCopy();
    if (v11)
    {
      uint64_t v17 = v13[2];
      BOOL v18 = __OFADD__(v17, v11);
      uint64_t v19 = v17 + v11;
      if (v18)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      void v13[2] = v19;
    }
  }
  else if (v11)
  {
    __break(1u);
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  int64_t v11 = *(void *)(inited + 40);
  uint64_t v10 = *(void *)(v11 + 16);
  int64_t v3 = v13[2];
  uint64_t v4 = (char *)(v3 + v10);
  if (__OFADD__(v3, v10))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v8 = a3;
  a3 = a1;
  unint64_t v20 = v13[3];
  swift_bridgeObjectRetain();
  if ((uint64_t)v4 <= (uint64_t)(v20 >> 1))
  {
    uint64_t v21 = v10;
    goto LABEL_17;
  }
LABEL_31:
  if (v3 <= (uint64_t)v4) {
    int64_t v31 = (int64_t)v4;
  }
  else {
    int64_t v31 = v3;
  }
  uint64_t v13 = sub_24EED5F44((void *)1, v31, 1, v13);
  uint64_t v21 = *(void *)(v11 + 16);
LABEL_17:
  if (!v21)
  {
    if (!v10) {
      goto LABEL_28;
    }
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v22 = v13[2];
  if ((v13[3] >> 1) - v22 < v10)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  unint64_t v23 = (unint64_t)&v13[2 * v22 + 4];
  if (v11 + 32 < v23 + 16 * v10 && v23 < v11 + 32 + 16 * v10) {
    goto LABEL_40;
  }
  swift_arrayInitWithCopy();
  if (!v10)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269979180);
    swift_arrayDestroy();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699791B8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v8, a3, v28);
    swift_release();
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2699791C0);
    uint64_t v30 = (uint64_t *)(v8 + *(int *)(result + 36));
    *uint64_t v30 = KeyPath;
    v30[1] = (uint64_t)v13;
    return result;
  }
  uint64_t v25 = v13[2];
  BOOL v18 = __OFADD__(v25, v10);
  unint64_t v26 = (char *)(v25 + v10);
  if (!v18)
  {
    void v13[2] = v26;
    goto LABEL_28;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EED59F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EED567C(a1, *v2, a2);
}

uint64_t sub_24EED59FC(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_24EEE9E50, 1);
}

uint64_t sub_24EED5A18(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_24EEE9E28, 1);
}

void sub_24EED5A34()
{
  qword_269979150 = (uint64_t)&unk_2700964C0;
}

uint64_t sub_24EED5A48@<X0>(void *a1@<X8>)
{
  if (qword_269977FB8 != -1) {
    swift_once();
  }
  *a1 = qword_269979150;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24EED5AB4()
{
  return sub_24EEDD4E0() & 1;
}

uint64_t sub_24EED5AD0(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v3 = sub_24EEDDA80();
    uint64_t v4 = sub_24EEDD680();
    os_log_type_t v5 = v3;
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v14 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      uint64_t v13 = sub_24EE94D9C(0xD000000000000040, 0x800000024EEE6760, &v14);
      sub_24EEDDB50();
      _os_log_impl(&dword_24EE87000, v4, v5, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25334FA20](v7, -1, -1);
      MEMORY[0x25334FA20](v6, -1, -1);
    }

    uint64_t v8 = sub_24EEDD560();
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v8);
    int64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24EEDD550();
    swift_getAtKeyPath();
    sub_24EED4FC4(a1, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v14;
  }
  return a1;
}

uint64_t sub_24EED5CDC(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699791C8);
  uint64_t v10 = *(void *)(sub_24EEDD2E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24EEDDCE0();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  _OWORD v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24EEDD2E0() - 8);
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
    sub_24EED6118(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_24EED5F44(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699791A0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24EED6270(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_24EED6054()
{
  unint64_t result = qword_269979188;
  if (!qword_269979188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269979180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979188);
  }
  return result;
}

uint64_t sub_24EED60B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EED6118(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24EEDD2E0() - 8);
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
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

uint64_t sub_24EED6270(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24EEDDD50();
  __break(1u);
  return result;
}

unint64_t sub_24EED6364()
{
  unint64_t result = qword_2699791D0;
  if (!qword_2699791D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699791D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessAccessibilityScopeEnvironmentKey()
{
  return &type metadata for FitnessAccessibilityScopeEnvironmentKey;
}

unint64_t sub_24EED63CC()
{
  unint64_t result = qword_2699791D8;
  if (!qword_2699791D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269979170);
    sub_24EEA527C(&qword_269979198, &qword_269979190);
    sub_24EED6454();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699791D8);
  }
  return result;
}

unint64_t sub_24EED6454()
{
  unint64_t result = qword_2699791E0;
  if (!qword_2699791E0)
  {
    sub_24EEDD670();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699791E0);
  }
  return result;
}

uint64_t sub_24EED64A0()
{
  return sub_24EED64D8(&qword_2699791E8, &qword_2699791B0, &qword_2699791F0, &qword_2699791A8);
}

uint64_t sub_24EED64D8(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_24EEA527C(a3, a4);
    sub_24EEA527C(&qword_2699791F8, &qword_269979200);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EED6574()
{
  return sub_24EED64D8(&qword_269979208, &qword_2699791C0, qword_269979210, &qword_2699791B8);
}

BOOL CGSize.isNonZero.getter(double a1, double a2)
{
  return a2 > 0.0 && a1 > 0.0;
}

uint64_t static DynamicArtworkDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ArtworkCandidate();
  swift_getWitnessTable();
  if ((sub_24EEDD980() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for DynamicArtworkDescriptor() + 36);
  return static StandardArtworkDescriptor.== infix(_:_:)(a1 + v4, a2 + v4);
}

uint64_t DynamicArtworkDescriptor.candidates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicArtworkDescriptor.fallbackArtworkDescriptor.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = type metadata accessor for StandardArtworkDescriptor();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t DynamicArtworkDescriptor.init(candidates:fallbackArtworkDescriptor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  uint64_t v4 = (char *)a3 + *(int *)(type metadata accessor for DynamicArtworkDescriptor() + 36);
  uint64_t v5 = type metadata accessor for StandardArtworkDescriptor();
  unint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
  return v6(v4, a2, v5);
}

uint64_t sub_24EED67C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024EEE6810)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EED68C0(char a1)
{
  if (a1) {
    return 0xD000000000000019;
  }
  else {
    return 0x74616469646E6163;
  }
}

uint64_t sub_24EED6900()
{
  return sub_24EED68C0(*v0);
}

uint64_t sub_24EED6910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EED67C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EED6940(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EED6994(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t DynamicArtworkDescriptor.encode(to:)(void *a1, uint64_t a2)
{
  v10[0] = a2;
  type metadata accessor for DynamicArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24EEDDE70();
  uint64_t v11 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v10 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  char v6 = (uint64_t *)v10[1];
  sub_24EEDDFC0();
  uint64_t v15 = *v6;
  char v14 = 0;
  type metadata accessor for ArtworkCandidate();
  sub_24EEDD960();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v7 = v12;
  sub_24EEDDE60();
  if (v7) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v5, v3);
  }
  uint64_t v9 = v11;
  LOBYTE(v15) = 1;
  type metadata accessor for StandardArtworkDescriptor();
  swift_getWitnessTable();
  sub_24EEDDE60();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v5, v3);
}

uint64_t DynamicArtworkDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v27 = type metadata accessor for StandardArtworkDescriptor();
  uint64_t v23 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v25 = (char *)&v20 - v5;
  type metadata accessor for DynamicArtworkDescriptor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v30 = sub_24EEDDE00();
  uint64_t v26 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v28 = a2;
  uint64_t v8 = type metadata accessor for DynamicArtworkDescriptor();
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v29 = v7;
  uint64_t v11 = (uint64_t)v31;
  sub_24EEDDFB0();
  if (v11) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v21 = v8;
  uint64_t v13 = v26;
  uint64_t v12 = v27;
  int64_t v31 = a1;
  type metadata accessor for ArtworkCandidate();
  sub_24EEDD960();
  char v33 = 0;
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  char v14 = v29;
  uint64_t v15 = v30;
  sub_24EEDDDE0();
  *(void *)uint64_t v10 = v34;
  LOBYTE(v34) = 1;
  swift_getWitnessTable();
  uint64_t v16 = v25;
  sub_24EEDDDE0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v15);
  uint64_t v17 = v21;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(&v10[*(int *)(v21 + 36)], v16, v12);
  uint64_t v18 = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v24, v10, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v10, v17);
}

uint64_t sub_24EED707C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return DynamicArtworkDescriptor.init(from:)(a1, *(void *)(a2 + 24), a3);
}

uint64_t sub_24EED709C(void *a1, uint64_t a2)
{
  return DynamicArtworkDescriptor.encode(to:)(a1, a2);
}

uint64_t DynamicArtworkDescriptor.hash(into:)()
{
  return StandardArtworkDescriptor.hash(into:)();
}

uint64_t type metadata accessor for DynamicArtworkDescriptor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for DynamicArtworkDescriptor.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t DynamicArtworkDescriptor.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED71F0()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED7234(uint64_t a1, uint64_t a2)
{
  return static DynamicArtworkDescriptor.== infix(_:_:)(a1, a2);
}

uint64_t sub_24EED7240()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EED725C()
{
  uint64_t result = type metadata accessor for StandardArtworkDescriptor();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24EED72FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6 & 0xF8 | 7;
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(v5 + 64) + 7;
  uint64_t v10 = *a2;
  *a1 = *a2;
  if ((v6 & 0x1000F8) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + (((v6 & 0xF8) + 15) & ~v7) + 16 > 0x18)
  {
    a1 = (uint64_t *)(v10 + ((v7 + 16) & v8));
    swift_retain();
  }
  else
  {
    uint64_t v12 = ((unint64_t)a1 + 15) & v8;
    uint64_t v13 = ((unint64_t)a2 + 15) & v8;
    char v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    uint64_t v15 = (void *)((v9 + v12) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v16 = (void *)((v9 + v13) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v15 = *v16;
    v15[1] = v16[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24EED742C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80) & 0xF8 | 7;
  (*(void (**)(uint64_t))(v4 + 8))((a1 + v5 + 8) & ~v5);
  return swift_bridgeObjectRelease();
}

void *sub_24EED74CC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  uint64_t v6 = *(void *)(v4 - 8) + 16;
  uint64_t v7 = *(_DWORD *)(*(void *)(v4 - 8) + 80) & 0xF8;
  uint64_t v8 = v7 + 15;
  unint64_t v9 = (unint64_t)a1 + v7 + 15;
  unint64_t v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = v9 & v10;
  unint64_t v12 = ((unint64_t)a2 + v8) & v10;
  swift_bridgeObjectRetain();
  v5(v11, v12, v4);
  uint64_t v13 = *(void *)(v6 + 48) + 7;
  char v14 = (void *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *char v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24EED7594(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v9 = v8 + 15;
  unint64_t v10 = (unint64_t)a1 + v8 + 15;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = v10 & v11;
  unint64_t v13 = ((unint64_t)a2 + v9) & v11;
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(v10 & v11, v13);
  uint64_t v14 = *(void *)(v7 + 40) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_24EED7670(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(_DWORD *)(v4 + 80) & 0xF8;
  uint64_t v7 = v6 + 15;
  unint64_t v8 = (unint64_t)a1 + v6 + 15;
  unint64_t v9 = ~v6 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = v8 & v9;
  unint64_t v11 = ((unint64_t)a2 + v7) & v9;
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(v8 & v9, v11);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_24EED771C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v9 = v8 + 15;
  unint64_t v10 = (unint64_t)a1 + v8 + 15;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = v10 & v11;
  unint64_t v13 = ((unint64_t)a2 + v9) & v11;
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(v10 & v11, v13);
  uint64_t v14 = *(void *)(v7 + 24) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24EED77E8(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v7 = *(_DWORD *)(v4 + 80) & 0xF8;
  uint64_t v8 = v7 | 7;
  if (v6 < a2)
  {
    unint64_t v9 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((v7 + 15) & ~v8)
       + 16;
    unsigned int v10 = a2 - v6;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24EED7944);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v6 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v8 + 8) & ~v8);
  }
  uint64_t v18 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v18) = -1;
  }
  return (v18 + 1);
}

void sub_24EED7958(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(_DWORD *)(v6 + 80) & 0xF8;
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8)
      + ((v9 + 15) & ~(v9 | 7))
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (unint64_t)&a1[(v9 | 7) + 8] & ~(v9 | 7);
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v18 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v18 = a2 - 1;
              }
              *(void *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7) & 0xFFFFFFF8)
       + ((v9 + 15) & ~(v9 | 7)) == -16)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7) & 0xFFFFFFF8)
     + ((v9 + 15) & ~(v9 | 7)) == -16)
    int v16 = v15;
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7) & 0xFFFFFFF8)
     + ((v9 + 15) & ~(v9 | 7)) != -16)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x24EED7B4CLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

unsigned char *sub_24EED7B74(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EED7C40);
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

uint64_t sub_24EED7C68()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EED7C84()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EED7CA0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EED7CBC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x72616C75676572;
    }
    else {
      uint64_t v3 = 0x6669636570736E75;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE700000000000000;
    }
    else {
      unint64_t v4 = 0xEB00000000646569;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x72616C75676572;
      }
      else {
        uint64_t v6 = 0x6669636570736E75;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE700000000000000;
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
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x746361706D6F63;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x746361706D6F63)
  {
LABEL_21:
    char v8 = sub_24EEDDE90();
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

uint64_t sub_24EED7DE8()
{
  uint64_t v0 = CropCode.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == CropCode.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24EEDDE90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24EED7E80(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x684374756F79616CLL;
  }
  else {
    uint64_t v3 = 0x6E61684361746164;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000646567;
  }
  else {
    unint64_t v4 = 0xED00006465676E61;
  }
  if (a2) {
    uint64_t v5 = 0x684374756F79616CLL;
  }
  else {
    uint64_t v5 = 0x6E61684361746164;
  }
  if (a2) {
    unint64_t v6 = 0xED00006465676E61;
  }
  else {
    unint64_t v6 = 0xEB00000000646567;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24EEDDE90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

BOOL sub_24EED7F3C(char a1, char a2)
{
  return dbl_24EEE4D40[a1] == dbl_24EEE4D40[a2];
}

uint64_t sub_24EED7F60()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EED7FB4()
{
  return sub_24EEDDFA0();
}

BOOL sub_24EED8004(char a1, char a2)
{
  return dbl_24EEE4D40[a2] >= dbl_24EEE4D40[a1];
}

BOOL sub_24EED8028(char a1, char a2)
{
  return dbl_24EEE4D40[a1] >= dbl_24EEE4D40[a2];
}

BOOL sub_24EED804C(char a1, char a2)
{
  return dbl_24EEE4D40[a2] < dbl_24EEE4D40[a1];
}

double GridSizeClass.maximumWidth.getter(char a1)
{
  return dbl_24EEE4D40[a1];
}

double GridSizeClass.rawValue.getter(char a1)
{
  return dbl_24EEE4D40[a1];
}

uint64_t sub_24EED80A0(uint64_t a1)
{
  unint64_t v2 = sub_24EED8E28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED80DC(uint64_t a1)
{
  unint64_t v2 = sub_24EED8E28();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EED8118(uint64_t a1)
{
  unint64_t v2 = sub_24EED8DD4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED8154(uint64_t a1)
{
  unint64_t v2 = sub_24EED8DD4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EED8190(uint64_t a1)
{
  unint64_t v2 = sub_24EED8D80();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED81CC(uint64_t a1)
{
  unint64_t v2 = sub_24EED8D80();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EED8208(uint64_t a1)
{
  unint64_t v2 = sub_24EED8D2C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED8244(uint64_t a1)
{
  unint64_t v2 = sub_24EED8D2C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EED8280(uint64_t a1)
{
  unint64_t v2 = sub_24EED8CD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED82BC(uint64_t a1)
{
  unint64_t v2 = sub_24EED8CD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EED82F8(uint64_t a1)
{
  unint64_t v2 = sub_24EED8C84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED8334(uint64_t a1)
{
  unint64_t v2 = sub_24EED8C84();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24EED8370()
{
  return ((unint64_t)*v0 << 40) + 0x317373616C63;
}

uint64_t sub_24EED838C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EED8E7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EED83B4(uint64_t a1)
{
  unint64_t v2 = sub_24EED8C30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED83F0(uint64_t a1)
{
  unint64_t v2 = sub_24EED8C30();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24EED842C(char *a1, char *a2)
{
  return sub_24EED7F3C(*a1, *a2);
}

uint64_t sub_24EED8438@<X0>(double *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s13FitnessCoreUI13GridSizeClassO8rawValueACSg0B8Graphics7CGFloatV_tcfC_0(*a1);
  *a2 = result;
  return result;
}

double sub_24EED8464@<D0>(double *a1@<X8>)
{
  double result = dbl_24EEE4D40[*v1];
  *a1 = result;
  return result;
}

BOOL sub_24EED8480(char *a1, char *a2)
{
  return _s13FitnessCoreUI13GridSizeClassO1loiySbAC_ACtFZ_0(*a1, *a2);
}

BOOL sub_24EED848C(char *a1, char *a2)
{
  return sub_24EED8004(*a1, *a2);
}

BOOL sub_24EED8498(char *a1, char *a2)
{
  return sub_24EED8028(*a1, *a2);
}

BOOL sub_24EED84A4(char *a1, char *a2)
{
  return sub_24EED804C(*a1, *a2);
}

uint64_t GridSizeClass.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979298);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  double v37 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792A0);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792A8);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  int64_t v31 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792B0);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v28 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792B8);
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792C0);
  uint64_t v25 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  int v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699792C8);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EED8C30();
  sub_24EEDDFC0();
  switch((char)v40)
  {
    case 1:
      char v42 = 1;
      sub_24EED8DD4();
      sub_24EEDDE10();
      uint64_t v22 = v26;
      uint64_t v21 = v27;
      goto LABEL_8;
    case 2:
      char v43 = 2;
      sub_24EED8D80();
      int v13 = v28;
      sub_24EEDDE10();
      uint64_t v22 = v29;
      uint64_t v21 = v30;
      goto LABEL_8;
    case 3:
      char v44 = 3;
      sub_24EED8D2C();
      int v13 = v31;
      sub_24EEDDE10();
      uint64_t v22 = v32;
      uint64_t v21 = v33;
      goto LABEL_8;
    case 4:
      char v45 = 4;
      sub_24EED8CD8();
      int v13 = v34;
      sub_24EEDDE10();
      uint64_t v22 = v35;
      uint64_t v21 = v36;
      goto LABEL_8;
    case 5:
      char v46 = 5;
      sub_24EED8C84();
      int v13 = v37;
      sub_24EEDDE10();
      uint64_t v22 = v38;
      uint64_t v21 = v39;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
      break;
    default:
      char v41 = 0;
      sub_24EED8E28();
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
}

char *GridSizeClass.init(from:)(void *a1)
{
  return sub_24EED90D0(a1);
}

char *sub_24EED8A80@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  double result = sub_24EED90D0(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_24EED8AAC(void *a1)
{
  return GridSizeClass.encode(to:)(a1, *v1);
}

uint64_t sub_24EED8AC8()
{
  return sub_24EED7F60();
}

uint64_t sub_24EED8AD0()
{
  return sub_24EED2AFC();
}

uint64_t sub_24EED8AD8()
{
  return sub_24EED7FB4();
}

BOOL _s13FitnessCoreUI13GridSizeClassO1loiySbAC_ACtFZ_0(char a1, char a2)
{
  return dbl_24EEE4D40[a1] < dbl_24EEE4D40[a2];
}

uint64_t _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(double a1)
{
  if (a1 <= 374.0) {
    return 0;
  }
  if (a1 <= 460.0) {
    return 1;
  }
  if (a1 > 1194.0) {
    int v1 = 5;
  }
  else {
    int v1 = 4;
  }
  if (a1 > 981.0) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = 3;
  }
  if (a1 > 726.0) {
    return v2;
  }
  else {
    return 2;
  }
}

uint64_t _s13FitnessCoreUI13GridSizeClassO8rawValueACSg0B8Graphics7CGFloatV_tcfC_0(double a1)
{
  if (a1 == 374.0) {
    return 0;
  }
  if (a1 == 460.0) {
    return 1;
  }
  if (a1 == 726.0) {
    return 2;
  }
  if (a1 == 1366.0) {
    int v2 = 5;
  }
  else {
    int v2 = 6;
  }
  if (a1 == 1194.0) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = v2;
  }
  if (a1 == 981.0) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_24EED8C30()
{
  unint64_t result = qword_2699792D0;
  if (!qword_2699792D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792D0);
  }
  return result;
}

unint64_t sub_24EED8C84()
{
  unint64_t result = qword_2699792D8;
  if (!qword_2699792D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792D8);
  }
  return result;
}

unint64_t sub_24EED8CD8()
{
  unint64_t result = qword_2699792E0;
  if (!qword_2699792E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792E0);
  }
  return result;
}

unint64_t sub_24EED8D2C()
{
  unint64_t result = qword_2699792E8;
  if (!qword_2699792E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792E8);
  }
  return result;
}

unint64_t sub_24EED8D80()
{
  unint64_t result = qword_2699792F0;
  if (!qword_2699792F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792F0);
  }
  return result;
}

unint64_t sub_24EED8DD4()
{
  unint64_t result = qword_2699792F8;
  if (!qword_2699792F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699792F8);
  }
  return result;
}

unint64_t sub_24EED8E28()
{
  unint64_t result = qword_269979300;
  if (!qword_269979300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979300);
  }
  return result;
}

uint64_t sub_24EED8E7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x317373616C63 && a2 == 0xE600000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x327373616C63 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x337373616C63 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x347373616C63 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x357373616C63 && a2 == 0xE600000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x367373616C63 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

char *sub_24EED90D0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979388);
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v55 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979390);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  id v54 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979398);
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  id v53 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793A0);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  id v52 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793A8);
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793B0);
  uint64_t v43 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793B8);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  uint64_t v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24EED8C30();
  uint64_t v21 = v57;
  sub_24EEDDFB0();
  if (!v21)
  {
    uint64_t v38 = v13;
    uint64_t v39 = v15;
    uint64_t v40 = v12;
    uint64_t v22 = v52;
    uint64_t v23 = v53;
    uint64_t v24 = v54;
    uint64_t v25 = v55;
    uint64_t v57 = (char *)v16;
    uint64_t v26 = v19;
    uint64_t v27 = sub_24EEDDDF0();
    if (*(void *)(v27 + 16) == 1)
    {
      uint64_t v19 = (char *)*(unsigned __int8 *)(v27 + 32);
      switch(*(unsigned char *)(v27 + 32))
      {
        case 1:
          char v59 = 1;
          sub_24EED8DD4();
          uint64_t v24 = v40;
          uint64_t v29 = v57;
          sub_24EEDDD80();
          uint64_t v35 = v44;
          uint64_t v34 = v45;
          goto LABEL_12;
        case 2:
          char v60 = 2;
          sub_24EED8D80();
          uint64_t v24 = v22;
          uint64_t v29 = v57;
          sub_24EEDDD80();
          uint64_t v35 = v47;
          uint64_t v34 = v48;
          goto LABEL_12;
        case 3:
          char v61 = 3;
          sub_24EED8D2C();
          uint64_t v36 = v57;
          sub_24EEDDD80();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v23, v49);
          goto LABEL_14;
        case 4:
          char v62 = 4;
          sub_24EED8CD8();
          uint64_t v29 = v57;
          sub_24EEDDD80();
          uint64_t v34 = v50;
          uint64_t v35 = v51;
LABEL_12:
          (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v34);
          goto LABEL_13;
        case 5:
          char v63 = 5;
          sub_24EED8C84();
          uint64_t v36 = v57;
          sub_24EEDDD80();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v42);
LABEL_14:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v36);
          break;
        default:
          char v58 = 0;
          sub_24EED8E28();
          uint64_t v28 = v39;
          uint64_t v29 = v57;
          sub_24EEDDD80();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v38);
LABEL_13:
          swift_bridgeObjectRelease();
          (*(void (**)(char *, char *))(v17 + 8))(v26, v29);
          break;
      }
    }
    else
    {
      uint64_t v30 = sub_24EEDDC30();
      swift_allocError();
      uint64_t v32 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
      *uint64_t v32 = &type metadata for GridSizeClass;
      uint64_t v19 = v57;
      sub_24EEDDD90();
      sub_24EEDDC20();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v17 + 8))(v26, v19);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  return v19;
}

unint64_t sub_24EED987C()
{
  unint64_t result = qword_269979308;
  if (!qword_269979308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979308);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridSizeClass()
{
  return &type metadata for GridSizeClass;
}

unsigned char *_s13FitnessCoreUI13GridSizeClassOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24EED99B4);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridSizeClass.CodingKeys()
{
  return &type metadata for GridSizeClass.CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class1CodingKeys()
{
  return &type metadata for GridSizeClass.Class1CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class2CodingKeys()
{
  return &type metadata for GridSizeClass.Class2CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class3CodingKeys()
{
  return &type metadata for GridSizeClass.Class3CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class4CodingKeys()
{
  return &type metadata for GridSizeClass.Class4CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class5CodingKeys()
{
  return &type metadata for GridSizeClass.Class5CodingKeys;
}

ValueMetadata *type metadata accessor for GridSizeClass.Class6CodingKeys()
{
  return &type metadata for GridSizeClass.Class6CodingKeys;
}

unint64_t sub_24EED9A50()
{
  unint64_t result = qword_269979310;
  if (!qword_269979310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979310);
  }
  return result;
}

unint64_t sub_24EED9AA8()
{
  unint64_t result = qword_269979318;
  if (!qword_269979318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979318);
  }
  return result;
}

unint64_t sub_24EED9B00()
{
  unint64_t result = qword_269979320;
  if (!qword_269979320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979320);
  }
  return result;
}

unint64_t sub_24EED9B58()
{
  unint64_t result = qword_269979328;
  if (!qword_269979328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979328);
  }
  return result;
}

unint64_t sub_24EED9BB0()
{
  unint64_t result = qword_269979330;
  if (!qword_269979330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979330);
  }
  return result;
}

unint64_t sub_24EED9C08()
{
  unint64_t result = qword_269979338;
  if (!qword_269979338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979338);
  }
  return result;
}

unint64_t sub_24EED9C60()
{
  unint64_t result = qword_269979340;
  if (!qword_269979340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979340);
  }
  return result;
}

unint64_t sub_24EED9CB8()
{
  unint64_t result = qword_269979348;
  if (!qword_269979348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979348);
  }
  return result;
}

unint64_t sub_24EED9D10()
{
  unint64_t result = qword_269979350;
  if (!qword_269979350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979350);
  }
  return result;
}

unint64_t sub_24EED9D68()
{
  unint64_t result = qword_269979358;
  if (!qword_269979358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979358);
  }
  return result;
}

unint64_t sub_24EED9DC0()
{
  unint64_t result = qword_269979360;
  if (!qword_269979360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979360);
  }
  return result;
}

unint64_t sub_24EED9E18()
{
  unint64_t result = qword_269979368;
  if (!qword_269979368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979368);
  }
  return result;
}

unint64_t sub_24EED9E70()
{
  unint64_t result = qword_269979370;
  if (!qword_269979370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979370);
  }
  return result;
}

unint64_t sub_24EED9EC8()
{
  unint64_t result = qword_269979378;
  if (!qword_269979378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979378);
  }
  return result;
}

unint64_t sub_24EED9F20()
{
  unint64_t result = qword_269979380;
  if (!qword_269979380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979380);
  }
  return result;
}

BOOL static GridKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24EED9F88(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAAD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EED9FC4(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAAD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA000(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAA84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA03C(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAA84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA078(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAA30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA0B4(uint64_t a1)
{
  unint64_t v2 = sub_24EEDAA30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA0F0()
{
  return *v0 + 97;
}

uint64_t sub_24EEDA100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEDBB50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEDA128(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA8E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA164(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA8E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA1A0(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA9DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA1DC(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA9DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA218(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA988();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA254(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA988();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EEDA290(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA934();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDA2CC(uint64_t a1)
{
  unint64_t v2 = sub_24EEDA934();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GridKind.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793C0);
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v39 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793C8);
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793D0);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v33 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793D8);
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v30 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793E0);
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v29 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793E8);
  uint64_t v27 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699793F0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v42 = v17;
  uint64_t v43 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEDA8E0();
  sub_24EEDDFC0();
  switch(v21)
  {
    case 1:
      char v45 = 1;
      sub_24EEDAA84();
      uint64_t v22 = v42;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v20, v22);
    case 2:
      char v46 = 2;
      sub_24EEDAA30();
      uint64_t v23 = v30;
      uint64_t v22 = v42;
      sub_24EEDDE10();
      uint64_t v25 = v31;
      uint64_t v24 = v32;
      goto LABEL_8;
    case 3:
      char v47 = 3;
      sub_24EEDA9DC();
      uint64_t v23 = v33;
      uint64_t v22 = v42;
      sub_24EEDDE10();
      uint64_t v25 = v34;
      uint64_t v24 = v35;
      goto LABEL_8;
    case 4:
      char v48 = 4;
      sub_24EEDA988();
      uint64_t v23 = v36;
      uint64_t v22 = v42;
      sub_24EEDDE10();
      uint64_t v25 = v37;
      uint64_t v24 = v38;
      goto LABEL_8;
    case 5:
      char v49 = 5;
      sub_24EEDA934();
      uint64_t v23 = v39;
      uint64_t v22 = v42;
      sub_24EEDDE10();
      uint64_t v25 = v40;
      uint64_t v24 = v41;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
      break;
    default:
      char v44 = 0;
      sub_24EEDAAD8();
      uint64_t v22 = v42;
      sub_24EEDDE10();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v14);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v20, v22);
}

unint64_t sub_24EEDA8E0()
{
  unint64_t result = qword_2699793F8;
  if (!qword_2699793F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699793F8);
  }
  return result;
}

unint64_t sub_24EEDA934()
{
  unint64_t result = qword_269979400;
  if (!qword_269979400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979400);
  }
  return result;
}

unint64_t sub_24EEDA988()
{
  unint64_t result = qword_269979408;
  if (!qword_269979408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979408);
  }
  return result;
}

unint64_t sub_24EEDA9DC()
{
  unint64_t result = qword_269979410;
  if (!qword_269979410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979410);
  }
  return result;
}

unint64_t sub_24EEDAA30()
{
  unint64_t result = qword_269979418;
  if (!qword_269979418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979418);
  }
  return result;
}

unint64_t sub_24EEDAA84()
{
  unint64_t result = qword_269979420;
  if (!qword_269979420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979420);
  }
  return result;
}

unint64_t sub_24EEDAAD8()
{
  unint64_t result = qword_269979428;
  if (!qword_269979428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979428);
  }
  return result;
}

uint64_t GridKind.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  char v63 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979430);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  id v66 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979438);
  uint64_t v56 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  id v65 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979440);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  MEMORY[0x270FA5388](v6);
  id v64 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979448);
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  MEMORY[0x270FA5388](v8);
  char v62 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979450);
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979458);
  uint64_t v53 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979460);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[3];
  id v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24EEDA8E0();
  uint64_t v21 = v68;
  sub_24EEDDFB0();
  if (v21) {
    goto LABEL_6;
  }
  uint64_t v49 = v13;
  uint64_t v50 = v15;
  uint64_t v22 = v12;
  uint64_t v24 = v64;
  uint64_t v23 = v65;
  uint64_t v25 = v66;
  uint64_t v68 = v16;
  uint64_t v26 = v19;
  uint64_t v27 = sub_24EEDDDF0();
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v34 = sub_24EEDDC30();
    swift_allocError();
    uint64_t v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269978830);
    *uint64_t v36 = &type metadata for GridKind;
    uint64_t v37 = v68;
    sub_24EEDDD90();
    sub_24EEDDC20();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x263F8DCB0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v37);
LABEL_6:
    uint64_t v32 = (uint64_t)v67;
    return __swift_destroy_boxed_opaque_existential_1(v32);
  }
  char v28 = *(unsigned char *)(v27 + 32);
  switch(v28)
  {
    case 1:
      char v70 = 1;
      sub_24EEDAA84();
      uint64_t v39 = v68;
      sub_24EEDDD80();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v22, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v39);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      break;
    case 2:
      char v40 = *(unsigned char *)(v27 + 32);
      char v71 = 2;
      sub_24EEDAA30();
      uint64_t v41 = v62;
      uint64_t v42 = v68;
      sub_24EEDDD80();
      uint64_t v44 = v57;
      uint64_t v43 = v58;
      goto LABEL_11;
    case 3:
      char v40 = *(unsigned char *)(v27 + 32);
      char v72 = 3;
      sub_24EEDA9DC();
      uint64_t v41 = v24;
      uint64_t v42 = v68;
      sub_24EEDDD80();
      uint64_t v44 = v59;
      uint64_t v43 = v60;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v42);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v40;
      break;
    case 4:
      char v45 = *(unsigned char *)(v27 + 32);
      char v73 = 4;
      sub_24EEDA988();
      uint64_t v46 = v68;
      sub_24EEDDD80();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v23, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v46);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v45;
      break;
    case 5:
      id v65 = (char *)*(unsigned __int8 *)(v27 + 32);
      char v74 = 5;
      sub_24EEDA934();
      uint64_t v47 = v68;
      sub_24EEDDD80();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v25, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v47);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = (char)v65;
      break;
    default:
      char v29 = *(unsigned char *)(v27 + 32);
      char v69 = 0;
      sub_24EEDAAD8();
      uint64_t v30 = v50;
      uint64_t v31 = v68;
      sub_24EEDDD80();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v30, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v26, v31);
      uint64_t v32 = (uint64_t)v67;
      uint64_t v33 = v63;
      char v28 = v29;
      break;
  }
  *uint64_t v33 = v28;
  return __swift_destroy_boxed_opaque_existential_1(v32);
}

uint64_t sub_24EEDB3B4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return GridKind.init(from:)(a1, a2);
}

uint64_t sub_24EEDB3CC(void *a1)
{
  return GridKind.encode(to:)(a1);
}

uint64_t GridKind.hash(into:)()
{
  return sub_24EEDDF60();
}

uint64_t GridKind.hashValue.getter()
{
  return sub_24EEDDFA0();
}

unint64_t sub_24EEDB45C()
{
  unint64_t result = qword_269979468;
  if (!qword_269979468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979468);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridKind()
{
  return &type metadata for GridKind;
}

unsigned char *_s13FitnessCoreUI8GridKindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24EEDB590);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridKind.CodingKeys()
{
  return &type metadata for GridKind.CodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.ACodingKeys()
{
  return &type metadata for GridKind.ACodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.BCodingKeys()
{
  return &type metadata for GridKind.BCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.CCodingKeys()
{
  return &type metadata for GridKind.CCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.DCodingKeys()
{
  return &type metadata for GridKind.DCodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.ECodingKeys()
{
  return &type metadata for GridKind.ECodingKeys;
}

ValueMetadata *type metadata accessor for GridKind.FCodingKeys()
{
  return &type metadata for GridKind.FCodingKeys;
}

unint64_t sub_24EEDB62C()
{
  unint64_t result = qword_269979470;
  if (!qword_269979470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979470);
  }
  return result;
}

unint64_t sub_24EEDB684()
{
  unint64_t result = qword_269979478;
  if (!qword_269979478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979478);
  }
  return result;
}

unint64_t sub_24EEDB6DC()
{
  unint64_t result = qword_269979480;
  if (!qword_269979480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979480);
  }
  return result;
}

unint64_t sub_24EEDB734()
{
  unint64_t result = qword_269979488;
  if (!qword_269979488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979488);
  }
  return result;
}

unint64_t sub_24EEDB78C()
{
  unint64_t result = qword_269979490;
  if (!qword_269979490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979490);
  }
  return result;
}

unint64_t sub_24EEDB7E4()
{
  unint64_t result = qword_269979498;
  if (!qword_269979498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979498);
  }
  return result;
}

unint64_t sub_24EEDB83C()
{
  unint64_t result = qword_2699794A0;
  if (!qword_2699794A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794A0);
  }
  return result;
}

unint64_t sub_24EEDB894()
{
  unint64_t result = qword_2699794A8;
  if (!qword_2699794A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794A8);
  }
  return result;
}

unint64_t sub_24EEDB8EC()
{
  unint64_t result = qword_2699794B0;
  if (!qword_2699794B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794B0);
  }
  return result;
}

unint64_t sub_24EEDB944()
{
  unint64_t result = qword_2699794B8;
  if (!qword_2699794B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794B8);
  }
  return result;
}

unint64_t sub_24EEDB99C()
{
  unint64_t result = qword_2699794C0;
  if (!qword_2699794C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794C0);
  }
  return result;
}

unint64_t sub_24EEDB9F4()
{
  unint64_t result = qword_2699794C8;
  if (!qword_2699794C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794C8);
  }
  return result;
}

unint64_t sub_24EEDBA4C()
{
  unint64_t result = qword_2699794D0;
  if (!qword_2699794D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794D0);
  }
  return result;
}

unint64_t sub_24EEDBAA4()
{
  unint64_t result = qword_2699794D8;
  if (!qword_2699794D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794D8);
  }
  return result;
}

unint64_t sub_24EEDBAFC()
{
  unint64_t result = qword_2699794E0;
  if (!qword_2699794E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794E0);
  }
  return result;
}

uint64_t sub_24EEDBB50(uint64_t a1, uint64_t a2)
{
  if (a1 == 97 && a2 == 0xE100000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 98 && a2 == 0xE100000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 99 && a2 == 0xE100000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 100 && a2 == 0xE100000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 101 && a2 == 0xE100000000000000 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 102 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

FitnessCoreUI::GridContext __swiftcall GridContext.init(axis:containerSize:supportsOrthogonalScrolling:)(FitnessCoreUI::GridAxis axis, CGSize containerSize, Swift::Bool supportsOrthogonalScrolling)
{
  *(unsigned char *)uint64_t v3 = *(unsigned char *)axis;
  *(CGFloat *)(v3 + 8) = containerSize.width;
  *(CGFloat *)(v3 + 16) = containerSize.height;
  *(unsigned char *)(v3 + 24) = supportsOrthogonalScrolling;
  result.containerSize.double height = containerSize.height;
  result.containerSize.double width = containerSize.width;
  result.supportsOrthogonalScrolling = supportsOrthogonalScrolling;
  result.axis = axis;
  return result;
}

uint64_t GridContext.sizeClass.getter()
{
  return _s13FitnessCoreUI13GridSizeClassOyAC0B8Graphics7CGFloatVcfC_0(*(double *)(v0 + 8));
}

uint64_t sub_24EEDBD4C()
{
  unint64_t v1 = 0x656E6961746E6F63;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001BLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1936291937;
  }
}

uint64_t sub_24EEDBDB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EEDC90C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EEDBDD8(uint64_t a1)
{
  unint64_t v2 = sub_24EEDC4FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EEDBE14(uint64_t a1)
{
  unint64_t v2 = sub_24EEDC4FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GridContext.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699794E8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v10 = *((void *)v1 + 2);
  int v13 = v1[24];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEDC4FC();
  sub_24EEDDFC0();
  LOBYTE(v12[0]) = v8;
  char v14 = 0;
  sub_24EEDC550();
  sub_24EEDDE60();
  if (!v2)
  {
    v12[0] = v9;
    v12[1] = v10;
    char v14 = 1;
    type metadata accessor for CGSize(0);
    sub_24EECCE7C(&qword_269978BF8);
    sub_24EEDDE60();
    LOBYTE(v12[0]) = 2;
    sub_24EEDDE40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t GridContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979500);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EEDC4FC();
  sub_24EEDDFB0();
  if (!v2)
  {
    char v15 = 0;
    sub_24EEDC5A4();
    sub_24EEDDDE0();
    char v9 = v14[0];
    type metadata accessor for CGSize(0);
    char v15 = 1;
    sub_24EECCE7C(&qword_269978C10);
    sub_24EEDDDE0();
    uint64_t v11 = v14[0];
    uint64_t v12 = v14[1];
    LOBYTE(v14[0]) = 2;
    char v13 = sub_24EEDDDC0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v13 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24EEDC25C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return GridContext.init(from:)(a1, a2);
}

uint64_t sub_24EEDC274(void *a1)
{
  return GridContext.encode(to:)(a1);
}

uint64_t GridContext.hash(into:)()
{
  return sub_24EEDDF70();
}

uint64_t GridContext.hashValue.getter()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEDC368()
{
  return sub_24EEDDFA0();
}

uint64_t sub_24EEDC3E4()
{
  return sub_24EEDDF70();
}

uint64_t sub_24EEDC440()
{
  return sub_24EEDDFA0();
}

uint64_t _s13FitnessCoreUI11GridContextV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  char v2 = 0;
  if (((*(unsigned __int8 *)a1 ^ *(unsigned __int8 *)a2) & 1) == 0 && a1[1] == a2[1] && a1[2] == a2[2]) {
    char v2 = *((unsigned char *)a2 + 24) ^ *((unsigned char *)a1 + 24) ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_24EEDC4FC()
{
  unint64_t result = qword_2699794F0;
  if (!qword_2699794F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794F0);
  }
  return result;
}

unint64_t sub_24EEDC550()
{
  unint64_t result = qword_2699794F8;
  if (!qword_2699794F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699794F8);
  }
  return result;
}

unint64_t sub_24EEDC5A4()
{
  unint64_t result = qword_269979508;
  if (!qword_269979508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979508);
  }
  return result;
}

unint64_t sub_24EEDC5FC()
{
  unint64_t result = qword_269979510;
  if (!qword_269979510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979510);
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GridContext(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[25]) {
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

uint64_t storeEnumTagSinglePayload for GridContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridContext()
{
  return &type metadata for GridContext;
}

unsigned char *storeEnumTagSinglePayload for GridContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EEDC7CCLL);
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

ValueMetadata *type metadata accessor for GridContext.CodingKeys()
{
  return &type metadata for GridContext.CodingKeys;
}

unint64_t sub_24EEDC808()
{
  unint64_t result = qword_269979518;
  if (!qword_269979518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979518);
  }
  return result;
}

unint64_t sub_24EEDC860()
{
  unint64_t result = qword_269979520;
  if (!qword_269979520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979520);
  }
  return result;
}

unint64_t sub_24EEDC8B8()
{
  unint64_t result = qword_269979528;
  if (!qword_269979528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979528);
  }
  return result;
}

uint64_t sub_24EEDC90C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1936291937 && a2 == 0xE400000000000000;
  if (v2 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656E6961746E6F63 && a2 == 0xED0000657A695372 || (sub_24EEDDE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024EEE6830)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EEDDE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t View.onLoad(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v15 = 0;
  swift_retain();
  sub_24EEDD710();
  char v8 = v11;
  uint64_t v9 = v12;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  char v13 = v8;
  uint64_t v14 = v9;
  MEMORY[0x25334EAF0](&v11, a3, &type metadata for ViewOnLoadModifier, a4);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24EEDCB98()
{
  return swift_getWitnessTable();
}

unint64_t sub_24EEDCBF0()
{
  unint64_t result = qword_269979530;
  if (!qword_269979530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979530);
  }
  return result;
}

uint64_t destroy for ViewOnLoadModifier()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ViewOnLoadModifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewOnLoadModifier(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ViewOnLoadModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewOnLoadModifier()
{
  return &type metadata for ViewOnLoadModifier;
}

uint64_t sub_24EEDCE18(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_24EEEA220, 1);
}

uint64_t sub_24EEDCE34(void (*a1)(uint64_t))
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269979548);
  sub_24EEDD720();
  swift_release();
  if ((v4 & 1) == 0)
  {
    sub_24EEDD9A0();
    sub_24EEDD990();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24EEDD730();
    uint64_t v2 = swift_release();
    a1(v2);
  }
  return swift_release();
}

uint64_t sub_24EEDCFFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  char v7 = *((unsigned char *)v2 + 16);
  uint64_t v8 = v2[3];
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v5;
  *(unsigned char *)(v9 + 32) = v7;
  *(void *)(v9 + 40) = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269979538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269979540);
  uint64_t v12 = (uint64_t (**)())(a2 + *(int *)(result + 36));
  *uint64_t v12 = sub_24EEDD18C;
  v12[1] = (uint64_t (*)())v9;
  void v12[2] = 0;
  uint64_t v12[3] = 0;
  return result;
}

uint64_t sub_24EEDD14C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24EEDD18C()
{
  return sub_24EEDCE34(*(void (**)(uint64_t))(v0 + 16));
}

unint64_t sub_24EEDD1A0()
{
  unint64_t result = qword_269979550;
  if (!qword_269979550)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269979540);
    sub_24EEDD210();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979550);
  }
  return result;
}

unint64_t sub_24EEDD210()
{
  unint64_t result = qword_269979558;
  if (!qword_269979558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269979538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269979558);
  }
  return result;
}

uint64_t sub_24EEDD260()
{
  return MEMORY[0x270EEDAD0]();
}

uint64_t sub_24EEDD270()
{
  return MEMORY[0x270EEEDE0]();
}

uint64_t sub_24EEDD280()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_24EEDD290()
{
  return MEMORY[0x270EF16E8]();
}

uint64_t sub_24EEDD2A0()
{
  return MEMORY[0x270EF1708]();
}

uint64_t sub_24EEDD2B0()
{
  return MEMORY[0x270F81708]();
}

uint64_t sub_24EEDD2C0()
{
  return MEMORY[0x270F81720]();
}

uint64_t sub_24EEDD2D0()
{
  return MEMORY[0x270F81738]();
}

uint64_t sub_24EEDD2E0()
{
  return MEMORY[0x270EF1740]();
}

uint64_t sub_24EEDD2F0()
{
  return MEMORY[0x270EF17A8]();
}

uint64_t sub_24EEDD300()
{
  return MEMORY[0x270EF17C0]();
}

uint64_t sub_24EEDD310()
{
  return MEMORY[0x270EF17C8]();
}

uint64_t sub_24EEDD320()
{
  return MEMORY[0x270EF17D8]();
}

uint64_t sub_24EEDD340()
{
  return MEMORY[0x270F2CCD8]();
}

uint64_t sub_24EEDD350()
{
  return MEMORY[0x270F2CCE0]();
}

uint64_t sub_24EEDD360()
{
  return MEMORY[0x270F2CD90]();
}

uint64_t sub_24EEDD370()
{
  return MEMORY[0x270F2CD98]();
}

uint64_t sub_24EEDD380()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24EEDD390()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24EEDD3A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24EEDD3B0()
{
  return MEMORY[0x270F81758]();
}

uint64_t sub_24EEDD3C0()
{
  return MEMORY[0x270F81A28]();
}

uint64_t sub_24EEDD3D0()
{
  return MEMORY[0x270F81F58]();
}

uint64_t sub_24EEDD3E0()
{
  return MEMORY[0x270F81FB8]();
}

uint64_t sub_24EEDD3F0()
{
  return MEMORY[0x270F81FD0]();
}

uint64_t sub_24EEDD400()
{
  return MEMORY[0x270F81FE8]();
}

uint64_t sub_24EEDD410()
{
  return MEMORY[0x270F81FF8]();
}

uint64_t sub_24EEDD420()
{
  return MEMORY[0x270F82010]();
}

uint64_t sub_24EEDD430()
{
  return MEMORY[0x270F82060]();
}

uint64_t sub_24EEDD440()
{
  return MEMORY[0x270F82278]();
}

uint64_t sub_24EEDD450()
{
  return MEMORY[0x270F82290]();
}

uint64_t sub_24EEDD460()
{
  return MEMORY[0x270F822C8]();
}

uint64_t sub_24EEDD470()
{
  return MEMORY[0x270F822E8]();
}

uint64_t sub_24EEDD480()
{
  return MEMORY[0x270F823A8]();
}

uint64_t sub_24EEDD490()
{
  return MEMORY[0x270EFF3A0]();
}

uint64_t sub_24EEDD4A0()
{
  return MEMORY[0x270EFF518]();
}

uint64_t sub_24EEDD4B0()
{
  return MEMORY[0x270EFF528]();
}

uint64_t sub_24EEDD4C0()
{
  return MEMORY[0x270EFF530]();
}

uint64_t sub_24EEDD4D0()
{
  return MEMORY[0x270EFF938]();
}

uint64_t sub_24EEDD4E0()
{
  return MEMORY[0x270EFF9A8]();
}

uint64_t sub_24EEDD4F0()
{
  return MEMORY[0x270EFFED8]();
}

uint64_t sub_24EEDD500()
{
  return MEMORY[0x270F001B0]();
}

uint64_t sub_24EEDD510()
{
  return MEMORY[0x270F00C40]();
}

uint64_t sub_24EEDD520()
{
  return MEMORY[0x270F00CB8]();
}

uint64_t sub_24EEDD530()
{
  return MEMORY[0x270F00D88]();
}

uint64_t sub_24EEDD540()
{
  return MEMORY[0x270F00E78]();
}

uint64_t sub_24EEDD550()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t sub_24EEDD560()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t sub_24EEDD570()
{
  return MEMORY[0x270F00F08]();
}

uint64_t sub_24EEDD580()
{
  return MEMORY[0x270F00F18]();
}

uint64_t sub_24EEDD590()
{
  return MEMORY[0x270F01508]();
}

uint64_t sub_24EEDD5A0()
{
  return MEMORY[0x270F016E8]();
}

uint64_t sub_24EEDD5B0()
{
  return MEMORY[0x270F016F0]();
}

uint64_t sub_24EEDD5C0()
{
  return MEMORY[0x270F01710]();
}

uint64_t sub_24EEDD5D0()
{
  return MEMORY[0x270F01720]();
}

uint64_t sub_24EEDD5E0()
{
  return MEMORY[0x270F01730]();
}

uint64_t sub_24EEDD5F0()
{
  return MEMORY[0x270F01740]();
}

uint64_t sub_24EEDD600()
{
  return MEMORY[0x270F01750]();
}

uint64_t sub_24EEDD610()
{
  return MEMORY[0x270F01760]();
}

uint64_t sub_24EEDD620()
{
  return MEMORY[0x270F01770]();
}

uint64_t sub_24EEDD630()
{
  return MEMORY[0x270F01788]();
}

uint64_t sub_24EEDD640()
{
  return MEMORY[0x270F01798]();
}

uint64_t sub_24EEDD650()
{
  return MEMORY[0x270F01E60]();
}

uint64_t sub_24EEDD660()
{
  return MEMORY[0x270F02428]();
}

uint64_t sub_24EEDD670()
{
  return MEMORY[0x270F027A0]();
}

uint64_t sub_24EEDD680()
{
  return MEMORY[0x270F029E8]();
}

uint64_t sub_24EEDD690()
{
  return MEMORY[0x270F02AC0]();
}

uint64_t sub_24EEDD6A0()
{
  return MEMORY[0x270F02B40]();
}

uint64_t sub_24EEDD6B0()
{
  return MEMORY[0x270F02CA8]();
}

uint64_t sub_24EEDD6C0()
{
  return MEMORY[0x270F032C8]();
}

uint64_t sub_24EEDD6D0()
{
  return MEMORY[0x270F032D8]();
}

uint64_t sub_24EEDD6E0()
{
  return MEMORY[0x270F036B8]();
}

uint64_t sub_24EEDD6F0()
{
  return MEMORY[0x270F03D28]();
}

uint64_t sub_24EEDD700()
{
  return MEMORY[0x270F04168]();
}

uint64_t sub_24EEDD710()
{
  return MEMORY[0x270F04810]();
}

uint64_t sub_24EEDD720()
{
  return MEMORY[0x270F04828]();
}

uint64_t sub_24EEDD730()
{
  return MEMORY[0x270F04838]();
}

uint64_t sub_24EEDD740()
{
  return MEMORY[0x270F05100]();
}

uint64_t sub_24EEDD750()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_24EEDD760()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24EEDD770()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EEDD780()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24EEDD790()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24EEDD7A0()
{
  return MEMORY[0x270EF1960]();
}

uint64_t sub_24EEDD7B0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_24EEDD7C0()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_24EEDD7D0()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_24EEDD7E0()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_24EEDD7F0()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_24EEDD800()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24EEDD810()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24EEDD820()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24EEDD830()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EEDD840()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24EEDD850()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24EEDD860()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24EEDD870()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24EEDD880()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24EEDD890()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24EEDD8A0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_24EEDD8B0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24EEDD8C0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24EEDD8D0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24EEDD8E0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24EEDD8F0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24EEDD900()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24EEDD910()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24EEDD920()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24EEDD930()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_24EEDD940()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_24EEDD950()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24EEDD960()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24EEDD970()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_24EEDD980()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_24EEDD990()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EEDD9A0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EEDD9B0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EEDD9C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24EEDD9D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24EEDD9F0()
{
  return MEMORY[0x270EF1C50]();
}

uint64_t sub_24EEDDA00()
{
  return MEMORY[0x270EF1C58]();
}

uint64_t sub_24EEDDA10()
{
  return MEMORY[0x270EF1C68]();
}

uint64_t sub_24EEDDA20()
{
  return MEMORY[0x270EF1C80]();
}

uint64_t sub_24EEDDA40()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24EEDDA50()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24EEDDA60()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24EEDDA70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24EEDDA80()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24EEDDA90()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24EEDDAA0()
{
  return MEMORY[0x270F825A8]();
}

uint64_t sub_24EEDDAB0()
{
  return MEMORY[0x270EF1FC8]();
}

uint64_t sub_24EEDDAC0()
{
  return MEMORY[0x270F82690]();
}

uint64_t sub_24EEDDAD0()
{
  return MEMORY[0x270F826A0]();
}

uint64_t sub_24EEDDAE0()
{
  return MEMORY[0x270F828B0]();
}

uint64_t sub_24EEDDAF0()
{
  return MEMORY[0x270F828D8]();
}

uint64_t sub_24EEDDB00()
{
  return MEMORY[0x270F828F8]();
}

uint64_t sub_24EEDDB10()
{
  return MEMORY[0x270F05430]();
}

uint64_t sub_24EEDDB20()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_24EEDDB30()
{
  return MEMORY[0x270F82958]();
}

uint64_t sub_24EEDDB40()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_24EEDDB50()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24EEDDB60()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24EEDDB70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24EEDDB80()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24EEDDB90()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24EEDDBB0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24EEDDBC0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24EEDDBD0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24EEDDBE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24EEDDBF0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24EEDDC00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24EEDDC10()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24EEDDC20()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EEDDC30()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EEDDC40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24EEDDC50()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24EEDDC60()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24EEDDC70()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24EEDDC80()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24EEDDC90()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24EEDDCA0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24EEDDCB0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24EEDDCC0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24EEDDCD0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24EEDDCE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24EEDDCF0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24EEDDD00()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_24EEDDD10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24EEDDD20()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24EEDDD30()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24EEDDD40()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24EEDDD50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24EEDDD60()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_24EEDDD70()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24EEDDD80()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EEDDD90()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EEDDDA0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24EEDDDB0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EEDDDC0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EEDDDD0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24EEDDDE0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EEDDDF0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EEDDE00()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24EEDDE10()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EEDDE20()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24EEDDE30()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EEDDE40()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EEDDE50()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24EEDDE60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EEDDE70()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24EEDDE80()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24EEDDE90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EEDDEA0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_24EEDDEB0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24EEDDEC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24EEDDED0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24EEDDEF0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24EEDDF00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24EEDDF10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24EEDDF20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24EEDDF30()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_24EEDDF50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EEDDF60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EEDDF70()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24EEDDF80()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24EEDDF90()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24EEDDFA0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EEDDFB0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EEDDFC0()
{
  return MEMORY[0x270F9FD98]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A0](retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7178]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE7200]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7220]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}