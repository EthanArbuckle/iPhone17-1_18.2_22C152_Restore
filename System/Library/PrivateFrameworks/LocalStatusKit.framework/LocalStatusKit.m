uint64_t LSKObservationsSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t result;

  v12 = *(void *)(a4 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a2;
  *((void *)v14 + 3) = a3;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_25505B5F8;
  a6[1] = v14;
  return result;
}

void *sub_25505B41C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  uint64_t v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  sub_255078400();
  result = (void *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  result[6] = v15;
  *a6 = &unk_269E7F848;
  a6[1] = result;
  return result;
}

uint64_t sub_25505B570()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

void *sub_25505B5F8@<X0>(void *a1@<X8>)
{
  return sub_25505B41C((uint64_t)v1+ ((*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80)), v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_25505B63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a1;
  v6[8] = swift_getAssociatedTypeWitness();
  v6[9] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_25505B6D8, 0, 0);
}

uint64_t sub_25505B6D8()
{
  swift_beginAccess();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25505B7BC;
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  return MEMORY[0x270FA1E80](v4, v3, AssociatedConformanceWitness);
}

uint64_t sub_25505B7BC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25505B8F8, 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25505B8F8()
{
  swift_endAccess();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25505B95C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t LSKObservationsSequence.AsyncIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25505B984, 0, 0);
}

uint64_t sub_25505B984()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(**(void **)(v0 + 24) + ***(int ***)(v0 + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25505BA58;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4(v2);
}

uint64_t sub_25505BA58()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25505BB4C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_25505BBF8;
  return MEMORY[0x270FA2498](sub_25505B984, 0, 0);
}

uint64_t sub_25505BBF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25505BCEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_25505BDCC;
  return MEMORY[0x270FA1E90](a1, a2, a3, a5, a6, v6 + 16);
}

uint64_t sub_25505BDCC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v2 + 24) = *(void *)(v2 + 16);
  }
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return v4();
}

uint64_t LSKObservationsSequence.makeAsyncIterator()()
{
  return (*v0)();
}

uint64_t sub_25505BF04()
{
  return MEMORY[0x263F8E4E0];
}

uint64_t sub_25505BF10()
{
  return swift_getWitnessTable();
}

uint64_t sub_25505BF2C()
{
  LSKObservationsSequence.makeAsyncIterator()();
  return swift_release();
}

uint64_t sub_25505BF58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t type metadata accessor for LSKObservationsSequence()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_25505BF90(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_25505BFC0()
{
  return swift_release();
}

void *sub_25505BFC8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_25505C004(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_25505C038(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25505C080(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for LSKObservationsSequence.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25505C0D4()
{
  return sub_255078720();
}

uint64_t sub_25505C11C()
{
  return sub_255078710();
}

uint64_t sub_25505C148()
{
  return sub_255078720();
}

BOOL sub_25505C18C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_25505C1A0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25505C1B0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25505C1BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25505C1F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_25505BBF8;
  return sub_25505B63C(a1, v8, v4, v5, v6, v7);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for IDSDeviceType()
{
  if (!qword_26B275D70)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26B275D70);
    }
  }
}

unint64_t sub_25505C348()
{
  unint64_t result = qword_269E7F850;
  if (!qword_269E7F850)
  {
    type metadata accessor for IDSDeviceType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F850);
  }
  return result;
}

uint64_t LSKError.errorDescription.getter()
{
  if (*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0x7463657078656E75;
  }
  else {
    uint64_t v1 = 543975790;
  }
  uint64_t v3 = v1;
  sub_255078340();
  return v3;
}

unint64_t sub_25505C42C()
{
  unint64_t result = qword_269E7F858;
  if (!qword_269E7F858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F858);
  }
  return result;
}

uint64_t sub_25505C480()
{
  if (*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0x7463657078656E75;
  }
  else {
    uint64_t v1 = 543975790;
  }
  uint64_t v3 = v1;
  sub_255078340();
  return v3;
}

uint64_t sub_25505C4FC()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for LSKError()
{
  return sub_25505C514();
}

uint64_t sub_25505C514()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14LocalStatusKit8LSKErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_25505C4FC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LSKError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_25505C4FC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25505C514();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LSKError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_25505C514();
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LSKError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_25505C6A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25505C6B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LSKError()
{
  return &type metadata for LSKError;
}

uint64_t sub_25505C6D0()
{
  uint64_t v0 = sub_255078230();
  __swift_allocate_value_buffer(v0, qword_26B275F20);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B275F20);
  return sub_255078220();
}

uint64_t static Logger.localStatus.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B275F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_255078230();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B275F20);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void LSKKey.domain.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t LSKKey.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

unsigned char *LSKKey.init(domain:name:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(unsigned char *)a4 = *result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t static LSKKey.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if ((sub_25505C96C(*(unsigned char *)a1, *(unsigned char *)a2) & 1) == 0) {
    return 0;
  }
  if (v2 == v4 && v3 == v5) {
    return 1;
  }
  return sub_2550786A0();
}

uint64_t sub_25505C96C(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000021;
  unint64_t v4 = 0x800000025507BA60;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x800000025507BA90;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "com.apple.personalHotspot";
      goto LABEL_5;
    case 3:
      unint64_t v3 = 0xD000000000000014;
      uint64_t v5 = "com.apple.regulatory";
LABEL_5:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000021;
  unint64_t v7 = 0x800000025507BA60;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x800000025507BA90;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v6 = 0xD000000000000019;
      uint64_t v8 = "com.apple.personalHotspot";
      goto LABEL_10;
    case 3:
      unint64_t v6 = 0xD000000000000014;
      uint64_t v8 = "com.apple.regulatory";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2550786A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t LSKKey.hash(into:)()
{
  sub_255078320();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_255078320();
  return swift_bridgeObjectRelease();
}

BOOL sub_25505CBE0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25505CBF0()
{
  return sub_255078710();
}

uint64_t sub_25505CC18(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25505CCF4()
{
  return sub_255078720();
}

uint64_t sub_25505CD3C(char a1)
{
  if (a1) {
    return 1701667182;
  }
  else {
    return 0x6E69616D6F64;
  }
}

BOOL sub_25505CD68(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25505CBE0(*a1, *a2);
}

uint64_t sub_25505CD80()
{
  return sub_25505CCF4();
}

uint64_t sub_25505CD94()
{
  return sub_25505CBF0();
}

uint64_t sub_25505CDA8()
{
  return sub_255078720();
}

uint64_t sub_25505CDF4()
{
  return sub_25505CD3C(*v0);
}

uint64_t sub_25505CE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25505CC18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25505CE3C()
{
  return 0;
}

uint64_t sub_25505CE48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25505DB1C();
  *a1 = result;
  return result;
}

uint64_t sub_25505CE7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_25505CED0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t LSKKey.encode(to:)(void *a1)
{
  type metadata accessor for LSKKey.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_255078670();
  uint64_t v12 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v11 - v4;
  char v6 = *v1;
  uint64_t v7 = *((void *)v1 + 1);
  v11[0] = *((void *)v1 + 2);
  v11[1] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255078740();
  char v16 = v6;
  char v15 = 0;
  sub_25505D678();
  uint64_t v8 = v13;
  sub_255078660();
  if (v8) {
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v5, v3);
  }
  uint64_t v10 = v12;
  char v14 = 1;
  sub_255078650();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v5, v3);
}

uint64_t LSKKey.hashValue.getter()
{
  return sub_255078720();
}

uint64_t LSKKey.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  type metadata accessor for LSKKey.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_255078620();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255078730();
  if (!v2)
  {
    uint64_t v8 = v15;
    char v17 = 0;
    sub_25505D71C();
    sub_255078600();
    char v9 = v18;
    char v16 = 1;
    uint64_t v11 = sub_2550785F0();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(unsigned char *)uint64_t v8 = v9;
    *(void *)(v8 + 8) = v11;
    *(void *)(v8 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25505D340@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LSKKey.init(from:)(a1, a2);
}

uint64_t sub_25505D364(void *a1)
{
  return LSKKey.encode(to:)(a1);
}

uint64_t sub_25505D388()
{
  return sub_255078720();
}

uint64_t LSKKey.id.getter()
{
  return 0;
}

uint64_t sub_25505D4D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LSKKey.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t LSKKey.description.getter()
{
  return LSKKey.id.getter();
}

uint64_t sub_25505D53C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25505D550()
{
  sub_255078320();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LSKKey.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25505D678()
{
  unint64_t result = qword_26B276518;
  if (!qword_26B276518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276518);
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

unint64_t sub_25505D71C()
{
  unint64_t result = qword_26B276528;
  if (!qword_26B276528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276528);
  }
  return result;
}

uint64_t sub_25505D770()
{
  return swift_getWitnessTable();
}

uint64_t sub_25505D78C()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25505D798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_25505D7A4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25505D7AC(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25505D7E4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
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

uint64_t sub_25505D844(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25505D880(uint64_t a1, int a2)
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

uint64_t sub_25505D8C8(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for LSKKey()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LSKStatusOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_25505D9C0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x25505DA8CLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25505DAB4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25505DABC(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

uint64_t sub_25505DAC8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25505DAE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25505DB00()
{
  return swift_getWitnessTable();
}

uint64_t sub_25505DB1C()
{
  return 2;
}

uint64_t LSKPublishedStatus.key.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t LSKPublishedStatus.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_255078490();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t LSKPublishedStatus.devices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LSKPublishedStatus.pendingDevies.getter(uint64_t a1)
{
  type metadata accessor for LSKDestinationDevice.Delivery(0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LSKDestinationDevice(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v27 = (uint64_t)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v24 - v9;
  uint64_t v11 = *(void *)(v1 + *(int *)(a1 + 56));
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v26 = v13;
  if (v13)
  {
    unint64_t v15 = 0;
    v24[1] = v4 + 8;
    uint64_t v25 = v6;
    while (v15 < *(void *)(v11 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v17 = *(void *)(v6 + 72);
      sub_25505DEE4(v11 + v16 + v17 * v15, (uint64_t)v10, type metadata accessor for LSKDestinationDevice);
      sub_25505DEE4((uint64_t)&v10[*(int *)(v5 + 28)], (uint64_t)v4, type metadata accessor for LSKDestinationDevice.Delivery);
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
      int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v4, 3, v18);
      if ((v19 - 2) < 2)
      {
        uint64_t result = sub_255061C1C((uint64_t)v10, type metadata accessor for LSKDestinationDevice);
      }
      else
      {
        if (!v19)
        {
          swift_bridgeObjectRelease();
          uint64_t v20 = sub_2550781C0();
          (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v4, v20);
          uint64_t v12 = v28;
        }
        uint64_t v21 = v5;
        sub_25505DF90((uint64_t)v10, v27);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_25506054C(0, *(void *)(v12 + 16) + 1, 1);
        }
        uint64_t v12 = v28;
        unint64_t v23 = *(void *)(v28 + 16);
        unint64_t v22 = *(void *)(v28 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_25506054C(v22 > 1, v23 + 1, 1);
          uint64_t v12 = v28;
        }
        *(void *)(v12 + 16) = v23 + 1;
        uint64_t result = sub_25505DF90(v27, v12 + v16 + v23 * v17);
        uint64_t v5 = v21;
        uint64_t v6 = v25;
      }
      if (v26 == ++v15)
      {
        uint64_t v12 = v28;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_25505DEE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_25505DF90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LSKDestinationDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t LSKPublishedStatus.init(key:value:devices:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  *(unsigned char *)a4 = *(unsigned char *)a1;
  *(void *)(a4 + 8) = v7;
  *(void *)(a4 + 16) = v8;
  uint64_t v9 = type metadata accessor for LSKPublishedStatus();
  uint64_t v10 = a4 + *(int *)(v9 + 52);
  uint64_t v11 = sub_255078490();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a2, v11);
  *(void *)(a4 + *(int *)(v9 + 56)) = a3;
  return result;
}

uint64_t static LSKPublishedStatus.== infix(_:_:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v61 = *(void *)(a3 - 8);
  uint64_t v62 = a6;
  MEMORY[0x270FA5388](a1);
  v58 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_255078490();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v59 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  unint64_t v15 = (char *)&v51 - v14;
  uint64_t v60 = *(void *)(v12 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v51 - v20;
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v51 - v22;
  uint64_t v24 = *(void *)(a1 + 8);
  uint64_t v25 = *(void *)(a1 + 16);
  LOBYTE(v65) = *(unsigned char *)a1;
  uint64_t v66 = v24;
  uint64_t v67 = v25;
  uint64_t v26 = *((void *)a2 + 1);
  uint64_t v27 = *((void *)a2 + 2);
  v69[0] = *a2;
  uint64_t v70 = v26;
  uint64_t v71 = v27;
  uint64_t v64 = a3;
  if ((static LSKKey.== infix(_:_:)((uint64_t)&v65, (uint64_t)v69) & 1) == 0) {
    goto LABEL_8;
  }
  v56 = v18;
  uint64_t v65 = v64;
  uint64_t v66 = a4;
  uint64_t v67 = a5;
  uint64_t v68 = v62;
  uint64_t v28 = type metadata accessor for LSKPublishedStatus();
  uint64_t v29 = *(int *)(v28 + 52);
  uint64_t v54 = a1;
  uint64_t v30 = a1 + v29;
  v31 = v15;
  uint64_t v32 = v60;
  v33 = *(void (**)(void))(v60 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v33)(v23, v30, v12);
  uint64_t v53 = v28;
  uint64_t v34 = *(int *)(v28 + 52);
  v35 = v31;
  v55 = a2;
  ((void (*)(char *, char *, uint64_t))v33)(v21, &a2[v34], v12);
  v36 = &v31[*(int *)(TupleTypeMetadata2 + 48)];
  ((void (*)(char *, char *, uint64_t))v33)(v31, v23, v12);
  v57 = v36;
  ((void (*)(char *, char *, uint64_t))v33)(v36, v21, v12);
  uint64_t v37 = v61;
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
  if (v38(v35, 1, v64) == 1)
  {
    v39 = *(void (**)(char *, uint64_t))(v32 + 8);
    v39(v21, v12);
    v39(v23, v12);
    if (v38(v57, 1, v64) == 1)
    {
      v39(v35, v12);
LABEL_11:
      char v43 = sub_25505E5C8(*(void *)(v54 + *(int *)(v53 + 56)), *(void *)&v55[*(int *)(v53 + 56)]);
      return v43 & 1;
    }
    goto LABEL_7;
  }
  v51 = v23;
  v52 = v21;
  v40 = v56;
  v33();
  v41 = v57;
  if (v38(v57, 1, v64) == 1)
  {
    v42 = *(void (**)(char *, uint64_t))(v32 + 8);
    v42(v52, v12);
    v42(v51, v12);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v40, v64);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, TupleTypeMetadata2);
    goto LABEL_8;
  }
  v45 = v58;
  v46 = v41;
  uint64_t v47 = v64;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v58, v46, v64);
  char v48 = sub_2550782E0();
  v49 = *(void (**)(char *, uint64_t))(v37 + 8);
  v49(v45, v47);
  v50 = *(void (**)(char *, uint64_t))(v32 + 8);
  v50(v52, v12);
  v50(v51, v12);
  v49(v40, v47);
  v50(v35, v12);
  if (v48) {
    goto LABEL_11;
  }
LABEL_8:
  char v43 = 0;
  return v43 & 1;
}

uint64_t sub_25505E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2550781C0();
  v51 = *(void (***)(uint64_t, uint64_t))(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F898);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LSKDestinationDevice(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v20 = (uint64_t *)((char *)&v44 - v19);
  uint64_t v21 = *(void *)(a1 + 16);
  if (v21 != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v56 = v10;
  if (!v21 || a1 == a2) {
    return 1;
  }
  uint64_t v54 = a2;
  uint64_t v55 = v17;
  v46 = v9;
  uint64_t v47 = v4;
  unint64_t v22 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v52 = *(void *)(v18 + 72);
  uint64_t v53 = a1;
  v45 = (void (**)(char *, uint64_t, uint64_t))(v51 + 4);
  v50 = v6;
  ++v51;
  v57 = v12;
  while (2)
  {
    sub_25505DEE4(a1 + v22, (uint64_t)v20, type metadata accessor for LSKDestinationDevice);
    sub_25505DEE4(a2 + v22, (uint64_t)v16, type metadata accessor for LSKDestinationDevice);
    BOOL v24 = *v20 == *v16 && v20[1] == v16[1];
    if (!v24 && (sub_2550786A0() & 1) == 0) {
      goto LABEL_37;
    }
    BOOL v25 = v20[2] == v16[2] && v20[3] == v16[3];
    if (!v25 && (sub_2550786A0() & 1) == 0 || (v20[4] != v16[4] || v20[5] != v16[5]) && (sub_2550786A0() & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v26 = *(int *)(v55 + 28);
    uint64_t v27 = (uint64_t)v16 + v26;
    uint64_t v28 = (uint64_t)&v12[*(int *)(v56 + 48)];
    sub_25505DEE4((uint64_t)v20 + v26, (uint64_t)v12, type metadata accessor for LSKDestinationDevice.Delivery);
    sub_25505DEE4(v27, v28, type metadata accessor for LSKDestinationDevice.Delivery);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
    uint64_t v30 = v12;
    uint64_t v31 = v29;
    uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48);
    switch(v32((uint64_t)v30, 3, v29))
    {
      case 1u:
        BOOL v23 = v32(v28, 3, v31) == 1;
        goto LABEL_6;
      case 2u:
        BOOL v23 = v32(v28, 3, v31) == 2;
        goto LABEL_6;
      case 3u:
        BOOL v23 = v32(v28, 3, v31) == 3;
LABEL_6:
        uint64_t v12 = v57;
        if (!v23) {
          goto LABEL_34;
        }
        goto LABEL_8;
      default:
        uint64_t v33 = (uint64_t)v46;
        sub_25505DEE4((uint64_t)v57, (uint64_t)v46, type metadata accessor for LSKDestinationDevice.Delivery);
        uint64_t v34 = *(int *)(v31 + 48);
        uint64_t v35 = *(void *)(v33 + v34 + 8);
        uint64_t v48 = *(void *)(v33 + v34);
        uint64_t v49 = v35;
        if (v32(v28, 3, v31))
        {
          swift_bridgeObjectRelease();
          (*v51)(v33, v47);
          uint64_t v12 = v57;
LABEL_34:
          sub_255061BBC((uint64_t)v12);
          goto LABEL_37;
        }
        uint64_t v36 = *(void *)(v28 + v34);
        uint64_t v37 = *(void *)(v28 + v34 + 8);
        uint64_t v38 = v47;
        (*v45)(v50, v28, v47);
        char v39 = sub_255078190();
        v40 = *v51;
        (*v51)(v33, v38);
        if (v39)
        {
          if (v48 == v36 && v49 == v37)
          {
            swift_bridgeObjectRelease_n();
            v40((uint64_t)v50, v38);
            uint64_t v12 = v57;
          }
          else
          {
            char v41 = sub_2550786A0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v40((uint64_t)v50, v38);
            uint64_t v12 = v57;
            if ((v41 & 1) == 0)
            {
              uint64_t v42 = (uint64_t)v57;
              goto LABEL_36;
            }
          }
LABEL_8:
          sub_255061C1C((uint64_t)v12, type metadata accessor for LSKDestinationDevice.Delivery);
          sub_255061C1C((uint64_t)v16, type metadata accessor for LSKDestinationDevice);
          sub_255061C1C((uint64_t)v20, type metadata accessor for LSKDestinationDevice);
          a1 = v53;
          v22 += v52;
          --v21;
          a2 = v54;
          if (!v21) {
            return 1;
          }
          continue;
        }
        v40((uint64_t)v50, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v42 = (uint64_t)v57;
LABEL_36:
        sub_255061C1C(v42, type metadata accessor for LSKDestinationDevice.Delivery);
LABEL_37:
        sub_255061C1C((uint64_t)v16, type metadata accessor for LSKDestinationDevice);
        sub_255061C1C((uint64_t)v20, type metadata accessor for LSKDestinationDevice);
        return 0;
    }
  }
}

BOOL sub_25505EC2C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25505EC3C()
{
  return sub_255078710();
}

uint64_t sub_25505EC64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73656369766564 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25505EDA4()
{
  return sub_255078720();
}

uint64_t sub_25505EDEC(char a1)
{
  if (!a1) {
    return 7955819;
  }
  if (a1 == 1) {
    return 0x65756C6176;
  }
  return 0x73656369766564;
}

BOOL sub_25505EE38(char *a1, char *a2)
{
  return sub_25505EC2C(*a1, *a2);
}

uint64_t sub_25505EE50()
{
  return sub_25505EDA4();
}

uint64_t sub_25505EE60()
{
  return sub_25505EC3C();
}

uint64_t sub_25505EE70()
{
  return sub_255078720();
}

uint64_t sub_25505EEBC()
{
  return sub_25505EDEC(*v0);
}

uint64_t sub_25505EECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25505EC64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25505EF00@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2550608EC();
  *a1 = result;
  return result;
}

uint64_t sub_25505EF34(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_25505EF88(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t LSKPublishedStatus.encode(to:)(void *a1, uint64_t a2)
{
  v15[0] = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(a2 + 24);
  uint64_t v19 = v3;
  uint64_t v20 = v17;
  long long v16 = *(_OWORD *)(a2 + 32);
  long long v21 = v16;
  type metadata accessor for LSKPublishedStatus.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_255078670();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v8 = v4;
  uint64_t v9 = v15[1];
  sub_255078740();
  uint64_t v10 = *(void *)(v9 + 8);
  uint64_t v11 = *(void *)(v9 + 16);
  LOBYTE(v19) = *(unsigned char *)v9;
  uint64_t v20 = v10;
  *(void *)&long long v21 = v11;
  char v22 = 0;
  *(void *)&long long v16 = v3;
  type metadata accessor for LSKKey();
  swift_getWitnessTable();
  uint64_t v12 = v18;
  sub_255078660();
  if (!v12)
  {
    uint64_t v13 = v15[0];
    LOBYTE(v19) = 1;
    sub_255078640();
    uint64_t v19 = *(void *)(v9 + *(int *)(v13 + 56));
    char v22 = 2;
    __swift_instantiateConcreteTypeFromMangledName(qword_26B276550);
    sub_2550605E4(&qword_26B275F98, &qword_26B275F70);
    sub_255078660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v8);
}

uint64_t LSKPublishedStatus.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v28 = a6;
  uint64_t v11 = sub_255078490();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v32 = (char *)&v27 - v12;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  type metadata accessor for LSKPublishedStatus.CodingKeys();
  swift_getWitnessTable();
  uint64_t v37 = sub_255078620();
  uint64_t v31 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v14 = (char *)&v27 - v13;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v33 = a4;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v15 = type metadata accessor for LSKPublishedStatus();
  uint64_t v27 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v27 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v36 = v14;
  uint64_t v18 = v38;
  sub_255078730();
  if (v18) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v20 = v31;
  uint64_t v19 = v32;
  type metadata accessor for LSKKey();
  char v43 = 0;
  swift_getWitnessTable();
  sub_255078600();
  uint64_t v21 = v40;
  uint64_t v22 = v41;
  *uint64_t v17 = v39;
  *((void *)v17 + 1) = v21;
  *((void *)v17 + 2) = v22;
  LOBYTE(v39) = 1;
  sub_2550785E0();
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(&v17[*(int *)(v15 + 52)], v19, v30);
  __swift_instantiateConcreteTypeFromMangledName(qword_26B276550);
  uint64_t v38 = v17;
  char v43 = 2;
  sub_2550605E4(&qword_26B276070, &qword_26B276048);
  BOOL v23 = v36;
  sub_255078600();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v37);
  BOOL v24 = v38;
  *(void *)&v38[*(int *)(v15 + 56)] = v39;
  uint64_t v25 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v28, v24, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v24, v15);
}

uint64_t sub_25505F714@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return LSKPublishedStatus.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_25505F738(void *a1, uint64_t a2)
{
  return LSKPublishedStatus.encode(to:)(a1, a2);
}

uint64_t sub_25505F750(uint64_t a1, char *a2, uint64_t *a3)
{
  return static LSKPublishedStatus.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t LSKPublishedStatus.debugDescription.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LSKDestinationDevice(0);
  v56[0] = *(void *)(v4 - 8);
  v56[1] = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (void *)((char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F868);
  uint64_t v57 = *(void *)(v7 - 8);
  uint64_t v58 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = sub_255078490();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v56 - v14;
  uint64_t v16 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v2 + *(int *)(a1 + 52), v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v15, v10);
    uint64_t v61 = 0;
    unint64_t v62 = 0xE000000000000000;
    sub_255078690();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v10);
  }
  uint64_t v61 = 0;
  unint64_t v62 = 0xE000000000000000;
  sub_255078520();
  swift_bridgeObjectRelease();
  uint64_t v61 = 0x203A6E69616D6F64;
  unint64_t v62 = 0xE800000000000000;
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  uint64_t v19 = v61;
  unint64_t v20 = v62;
  uint64_t v21 = sub_25506043C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v23 = v21[2];
  unint64_t v22 = v21[3];
  unint64_t v24 = v23 + 1;
  if (v23 >= v22 >> 1) {
    uint64_t v21 = sub_25506043C((void *)(v22 > 1), v23 + 1, 1, v21);
  }
  v21[2] = v24;
  uint64_t v25 = &v21[2 * v23];
  v25[4] = v19;
  v25[5] = v20;
  if (*(void *)(*(void *)(v2 + *(int *)(a1 + 56)) + 16))
  {
    uint64_t v61 = *(void *)(v2 + *(int *)(a1 + 56));
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_2550780E0();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B276550);
    sub_255060A84(&qword_269E7F870, qword_26B276550);
    sub_255060A84(&qword_269E7F878, &qword_269E7F868);
    uint64_t v26 = v58;
    uint64_t v27 = sub_255078370();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v9, v26);
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void *)(v27 + 16);
    if (v28)
    {
      uint64_t v29 = v27
          + ((*(unsigned __int8 *)(v56[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56[0] + 80));
      uint64_t v30 = *(void *)(v56[0] + 72);
      uint64_t v57 = v27;
      uint64_t v58 = v30;
      do
      {
        sub_25505DEE4(v29, (uint64_t)v6, type metadata accessor for LSKDestinationDevice);
        uint64_t v61 = 8224;
        unint64_t v62 = 0xE200000000000000;
        unint64_t v59 = 0;
        unint64_t v60 = 0xE000000000000000;
        sub_255078520();
        unint64_t v31 = LSKDestinationDevice.Delivery.description.getter();
        unint64_t v33 = v32;
        swift_bridgeObjectRelease();
        unint64_t v59 = v31;
        unint64_t v60 = v33;
        sub_255078340();
        uint64_t v34 = *v6;
        unint64_t v35 = v6[1];
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_2550609E8(8, v34, v35, v36);
        uint64_t v39 = v38;
        uint64_t v41 = v40;
        uint64_t v43 = v42;
        swift_bridgeObjectRelease();
        MEMORY[0x25A285BD0](v37, v39, v41, v43);
        sub_255078340();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_255078340();
        swift_bridgeObjectRetain();
        sub_255078340();
        swift_bridgeObjectRelease();
        sub_255078340();
        swift_bridgeObjectRetain();
        sub_255078340();
        swift_bridgeObjectRelease();
        sub_255078340();
        swift_bridgeObjectRelease();
        uint64_t v44 = v61;
        unint64_t v45 = v62;
        unint64_t v47 = v21[2];
        unint64_t v46 = v21[3];
        if (v47 >= v46 >> 1) {
          uint64_t v21 = sub_25506043C((void *)(v46 > 1), v47 + 1, 1, v21);
        }
        v21[2] = v47 + 1;
        uint64_t v48 = &v21[2 * v47];
        v48[4] = v44;
        v48[5] = v45;
        sub_255061C1C((uint64_t)v6, type metadata accessor for LSKDestinationDevice);
        v29 += v58;
        --v28;
      }
      while (v28);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v49 = v21[3];
    if (v24 >= v49 >> 1) {
      uint64_t v21 = sub_25506043C((void *)(v49 > 1), v23 + 2, 1, v21);
    }
    v21[2] = v23 + 2;
    v50 = (char *)&v21[2 * v24];
    strcpy(v50 + 32, "  <No devices>");
    v50[47] = -18;
  }
  unint64_t v52 = v21[2];
  unint64_t v51 = v21[3];
  if (v52 >= v51 >> 1) {
    uint64_t v21 = sub_25506043C((void *)(v51 > 1), v52 + 1, 1, v21);
  }
  v21[2] = v52 + 1;
  uint64_t v53 = &v21[2 * v52];
  v53[4] = 125;
  v53[5] = 0xE100000000000000;
  uint64_t v61 = (uint64_t)v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F880);
  sub_255060A84(&qword_269E7F888, &qword_269E7F880);
  uint64_t v54 = sub_2550782D0();
  swift_bridgeObjectRelease();
  return v54;
}

uint64_t sub_25506000C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25505DEE4(a1, (uint64_t)v6, type metadata accessor for LSKDestinationDevice.Delivery);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 3, v7);
  uint64_t v9 = 0;
  switch((int)result)
  {
    case 1:
      uint64_t v9 = 2;
      break;
    case 2:
      uint64_t v9 = 3;
      break;
    case 3:
      break;
    default:
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_2550781C0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v6, v10);
      uint64_t v9 = 1;
      break;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_255060180@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v31 = a2;
  uint64_t v29 = a5;
  uint64_t v8 = sub_255078490();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v26 - v10;
  uint64_t v12 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = *v5;
  uint64_t v17 = *((void *)v5 + 1);
  uint64_t v16 = *((void *)v5 + 2);
  unint64_t v19 = *((void *)v5 + 4);
  uint64_t v18 = *((void *)v5 + 5);
  if (v19 >> 60 == 15)
  {
    v32[0] = *v5;
    uint64_t v33 = v17;
    uint64_t v34 = v16;
    sub_25505D53C((uint64_t)v35);
    v32[0] = v35[0];
    uint64_t v33 = v36;
    uint64_t v34 = v37;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v11, 1, 1, a1);
    uint64_t v20 = v29;
    uint64_t v21 = (uint64_t)v11;
    uint64_t v22 = v18;
  }
  else
  {
    uint64_t v26 = *((void *)v5 + 1);
    uint64_t v27 = v16;
    uint64_t v28 = a3;
    uint64_t v23 = *((void *)v5 + 3);
    sub_255078070();
    swift_allocObject();
    sub_255061AF4(v23, v19);
    sub_255078060();
    uint64_t v24 = v38;
    sub_255078050();
    sub_255061B4C(v23, v19);
    uint64_t result = swift_release();
    uint64_t v38 = v24;
    if (v24) {
      return result;
    }
    v32[0] = v15;
    uint64_t v33 = v26;
    uint64_t v34 = v27;
    sub_25505D53C((uint64_t)v35);
    v32[0] = v35[0];
    uint64_t v33 = v36;
    uint64_t v34 = v37;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v11, v14, a1);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0, 1, a1);
    uint64_t v20 = v29;
    uint64_t v21 = (uint64_t)v11;
    uint64_t v22 = v18;
  }
  LSKPublishedStatus.init(key:value:devices:)((uint64_t)v32, v21, v22, v20);
  return swift_bridgeObjectRetain();
}

void *sub_25506043C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F890);
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
    sub_2550608F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25506054C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2550606AC(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t type metadata accessor for LSKPublishedStatus()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for LSKPublishedStatus.CodingKeys()
{
  return swift_getGenericMetadata();
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

uint64_t sub_2550605E4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26B276550);
    sub_255060664(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_255060664(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LSKDestinationDevice(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2550606AC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8A0);
  uint64_t v10 = *(void *)(type metadata accessor for LSKDestinationDevice(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for LSKDestinationDevice(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  unint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2550785A0();
  __break(1u);
  return result;
}

uint64_t sub_2550608EC()
{
  return 3;
}

uint64_t sub_2550608F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2550785A0();
  __break(1u);
  return result;
}

uint64_t sub_2550609E8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_255078330();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_255060A84(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_255060AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_255060AD0()
{
  uint64_t result = sub_255078490();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_255060B78(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v9 = *(void *)(v5 + 64);
  }
  else {
    size_t v9 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v10 = ((v9 + 7 + ((v7 + 24) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8) + 8;
  int v11 = v7 & 0x100000;
  if (v8 > 7 || v11 != 0 || v10 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v15 = a2[2];
    v3[1] = a2[1];
    v3[2] = v15;
    uint64_t v16 = (void *)(((unint64_t)v3 + v8 + 24) & ~v8);
    unint64_t v17 = (const void *)(((unint64_t)a2 + v8 + 24) & ~v8);
    uint64_t v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    swift_bridgeObjectRetain();
    if (v18(v17, 1, v4))
    {
      memcpy(v16, v17, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v16, v17, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v4);
    }
    *(void *)(((unint64_t)v16 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v17 + v9 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_255060D28(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4)) {
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_255060E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)((v7 + 24 + a1) & ~v7);
  size_t v9 = (const void *)((v7 + 24 + a2) & ~v7);
  unint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  swift_bridgeObjectRetain();
  if (v10(v9, 1, v5))
  {
    int v11 = *(_DWORD *)(v6 + 84);
    size_t v12 = *(void *)(v6 + 64);
    if (v11) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v12 + 1;
    }
    memcpy(v8, v9, v13);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v8, v9, v5);
    uint64_t v15 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v14 = v6 + 56;
    v15(v8, 0, 1, v5);
    int v11 = *(_DWORD *)(v14 + 28);
    size_t v12 = *(void *)(v14 + 8);
  }
  if (v11) {
    size_t v16 = v12;
  }
  else {
    size_t v16 = v12 + 1;
  }
  *(void *)(((unint64_t)v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_255060F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  size_t v9 = (void *)((v8 + 24 + a1) & ~v8);
  unint64_t v10 = (void *)((v8 + 24 + a2) & ~v8);
  int v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(v9, 1, v6);
  int v13 = v11(v10, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v9, v10, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      goto LABEL_12;
    }
    int v14 = *(_DWORD *)(v7 + 84);
    size_t v15 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v9, v10, v6);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
    int v14 = *(_DWORD *)(v7 + 84);
    size_t v15 = *(void *)(v7 + 64);
  }
  if (v14) {
    size_t v16 = v15;
  }
  else {
    size_t v16 = v15 + 1;
  }
  memcpy(v9, v10, v16);
LABEL_12:
  if (*(_DWORD *)(v7 + 84)) {
    uint64_t v17 = *(void *)(v7 + 64);
  }
  else {
    uint64_t v17 = *(void *)(v7 + 64) + 1;
  }
  *(void *)(((unint64_t)v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_255061170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)((v6 + 24 + a1) & ~v6);
  uint64_t v8 = (const void *)((v6 + 24 + a2) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    int v13 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    uint64_t v12 = v5 + 56;
    v13(v7, 0, 1, v4);
    int v9 = *(_DWORD *)(v12 + 28);
    size_t v10 = *(void *)(v12 + 8);
  }
  if (v9) {
    size_t v14 = v10;
  }
  else {
    size_t v14 = v10 + 1;
  }
  *(void *)(((unint64_t)v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2550612C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  size_t v10 = (void *)((v9 + 24 + a1) & ~v9);
  size_t v11 = (void *)((v9 + 24 + a2) & ~v9);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  int v13 = v12(v10, 1, v7);
  int v14 = v12(v11, 1, v7);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v10, v11, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 40))(v10, v11, v7);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
    int v15 = *(_DWORD *)(v8 + 84);
    size_t v16 = *(void *)(v8 + 64);
  }
  if (v15) {
    size_t v17 = v16;
  }
  else {
    size_t v17 = v16 + 1;
  }
  memcpy(v10, v11, v17);
LABEL_12:
  if (*(_DWORD *)(v8 + 84)) {
    uint64_t v18 = *(void *)(v8 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v8 + 64) + 1;
  }
  *(void *)(((unint64_t)v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v11 + v18 + 7) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_255061498(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  int v6 = *(_DWORD *)(v4 + 84);
  if (v6) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = 7;
  if (!v6) {
    uint64_t v10 = 8;
  }
  if (!a2) {
    return 0;
  }
  if (v8 < a2)
  {
    unint64_t v11 = ((v10 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v9 + 24) & ~v9)) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    unsigned int v12 = a2 - v8;
    uint64_t v13 = v11 & 0xFFFFFFF8;
    if ((v11 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v12 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *(unsigned __int8 *)(a1 + v11);
        if (!v17) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v17 = *(unsigned __int16 *)(a1 + v11);
        if (v17) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x255061630);
      case 4:
        int v17 = *(_DWORD *)(a1 + v11);
        if (!v17) {
          break;
        }
LABEL_27:
        int v19 = v17 - 1;
        if (v13)
        {
          int v19 = 0;
          LODWORD(v13) = *(_DWORD *)a1;
        }
        return v8 + (v13 | v19) + 1;
      default:
        break;
    }
  }
  if ((v7 & 0x80000000) != 0)
  {
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(v5 + 48))((a1 + v9 + 24) & ~v9);
    if (v21 >= 2) {
      return v21 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    unint64_t v20 = *(void *)(a1 + 16);
    if (v20 >= 0xFFFFFFFF) {
      LODWORD(v20) = -1;
    }
    return (v20 + 1);
  }
}

void sub_255061644(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v12;
  }
  size_t v13 = ((v12 + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v14 = a3 - v10;
    if (((v12 + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v15 = v14 + 1;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v15 >= 0x10000) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    if (v15 < 0x100) {
      int v16 = 1;
    }
    if (v15 >= 2) {
      int v6 = v16;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v12 + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v17 = a2 - v10;
    }
    else {
      int v17 = 1;
    }
    if (((v12 + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v18 = ~v10 + a2;
      bzero(a1, v13);
      *(_DWORD *)a1 = v18;
    }
    switch(v6)
    {
      case 1:
        a1[v13] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v13] = v17;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v13] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v13] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x2550618DCLL);
    case 4:
      *(_DWORD *)&a1[v13] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if ((v9 & 0x80000000) != 0)
        {
          int v19 = (unsigned char *)((unint64_t)&a1[v11 + 24] & ~v11);
          if (v9 >= a2)
          {
            uint64_t v23 = a2 + 1;
            uint64_t v24 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
            unint64_t v25 = (unint64_t)&a1[v11 + 24] & ~v11;
            v24(v25, v23);
          }
          else
          {
            if (v12 <= 3) {
              int v20 = ~(-1 << (8 * v12));
            }
            else {
              int v20 = -1;
            }
            if (v12)
            {
              int v21 = v20 & (~v9 + a2);
              if (v12 <= 3) {
                int v22 = v12;
              }
              else {
                int v22 = 4;
              }
              bzero(v19, v12);
              switch(v22)
              {
                case 2:
                  *(_WORD *)int v19 = v21;
                  break;
                case 3:
                  *(_WORD *)int v19 = v21;
                  v19[2] = BYTE2(v21);
                  break;
                case 4:
                  *(_DWORD *)int v19 = v21;
                  break;
                default:
                  *int v19 = v21;
                  break;
              }
            }
          }
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *((void *)a1 + 1) = 0;
          *((void *)a1 + 2) = 0;
          *(void *)a1 = a2 ^ 0x80000000;
        }
        else
        {
          *((void *)a1 + 2) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Parameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_2550619A4(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x255061A70);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_255061A98(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

uint64_t sub_255061AA0()
{
  return swift_getWitnessTable();
}

uint64_t sub_255061ABC()
{
  return swift_getWitnessTable();
}

uint64_t sub_255061AD8()
{
  return swift_getWitnessTable();
}

uint64_t sub_255061AF4(uint64_t a1, unint64_t a2)
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

uint64_t sub_255061B4C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_255061B60(a1, a2);
  }
  return a1;
}

uint64_t sub_255061B60(uint64_t a1, unint64_t a2)
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

uint64_t sub_255061BBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F898);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_255061C1C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *static FormatStyle<>.oslog(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL static OSLogDateFormatter.Style.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OSLogDateFormatter.Style.hash(into:)()
{
  return sub_255078710();
}

BOOL sub_255061CCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_255061CE4()
{
  return sub_255078710();
}

unint64_t sub_255061D14()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 1702125924;
      break;
    case 2:
      unint64_t result = 1701669236;
      break;
    case 3:
      unint64_t result = 0x69546F4E656D6974;
      break;
    case 4:
      unint64_t result = 1819047270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_255061DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255064508(a1, a2);
  *a3 = result;
  return result;
}

void sub_255061DE0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_255061DEC(uint64_t a1)
{
  unint64_t v2 = sub_255062638();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255061E28(uint64_t a1)
{
  unint64_t v2 = sub_255062638();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255061E64()
{
  return 0;
}

void sub_255061E70(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_255061E7C(uint64_t a1)
{
  unint64_t v2 = sub_255062788();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255061EB8(uint64_t a1)
{
  unint64_t v2 = sub_255062788();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255061EF4(uint64_t a1)
{
  unint64_t v2 = sub_2550627DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255061F30(uint64_t a1)
{
  unint64_t v2 = sub_2550627DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255061F6C(uint64_t a1)
{
  unint64_t v2 = sub_25506268C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255061FA8(uint64_t a1)
{
  unint64_t v2 = sub_25506268C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255061FE4(uint64_t a1)
{
  unint64_t v2 = sub_255062734();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255062020(uint64_t a1)
{
  unint64_t v2 = sub_255062734();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25506205C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25506208C(uint64_t a1)
{
  unint64_t v2 = sub_2550626E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550620C8(uint64_t a1)
{
  unint64_t v2 = sub_2550626E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OSLogDateFormatter.Style.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8A8);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v35 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8B0);
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v32 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8B8);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8C0);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8C8);
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned int v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F8D0);
  uint64_t v38 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  MEMORY[0x270FA5388](v15);
  int v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255062638();
  sub_255078740();
  switch(v18)
  {
    case 1:
      char v41 = 1;
      sub_255062788();
      uint64_t v21 = v39;
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
      goto LABEL_8;
    case 2:
      char v42 = 2;
      sub_255062734();
      int v22 = v29;
      uint64_t v21 = v39;
      sub_255078630();
      uint64_t v24 = v30;
      uint64_t v23 = v31;
      goto LABEL_7;
    case 3:
      char v43 = 3;
      sub_2550626E0();
      int v22 = v32;
      uint64_t v21 = v39;
      sub_255078630();
      uint64_t v24 = v33;
      uint64_t v23 = v34;
      goto LABEL_7;
    case 4:
      char v44 = 4;
      sub_25506268C();
      int v22 = v35;
      uint64_t v21 = v39;
      sub_255078630();
      uint64_t v24 = v36;
      uint64_t v23 = v37;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v21);
      break;
    default:
      char v40 = 0;
      sub_2550627DC();
      uint64_t v19 = v39;
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v17, v19);
      break;
  }
  return result;
}

unint64_t sub_255062638()
{
  unint64_t result = qword_269E7F8D8;
  if (!qword_269E7F8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F8D8);
  }
  return result;
}

unint64_t sub_25506268C()
{
  unint64_t result = qword_269E7F8E0;
  if (!qword_269E7F8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F8E0);
  }
  return result;
}

unint64_t sub_2550626E0()
{
  unint64_t result = qword_269E7F8E8;
  if (!qword_269E7F8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F8E8);
  }
  return result;
}

unint64_t sub_255062734()
{
  unint64_t result = qword_269E7F8F0;
  if (!qword_269E7F8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F8F0);
  }
  return result;
}

unint64_t sub_255062788()
{
  unint64_t result = qword_269E7F8F8;
  if (!qword_269E7F8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F8F8);
  }
  return result;
}

unint64_t sub_2550627DC()
{
  unint64_t result = qword_269E7F900;
  if (!qword_269E7F900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F900);
  }
  return result;
}

uint64_t OSLogDateFormatter.Style.hashValue.getter()
{
  return sub_255078720();
}

uint64_t OSLogDateFormatter.Style.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F908);
  uint64_t v43 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v53 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F910);
  uint64_t v49 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  unint64_t v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F918);
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v51 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F920);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F928);
  uint64_t v42 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F930);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a1[3];
  uint64_t v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_255062638();
  uint64_t v18 = v56;
  sub_255078730();
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
  int v20 = v52;
  uint64_t v41 = 0;
  uint64_t v56 = v14;
  int v22 = v53;
  uint64_t v23 = v54;
  uint64_t v24 = v16;
  uint64_t v25 = sub_255078610();
  if (*(void *)(v25 + 16) != 1)
  {
    uint64_t v30 = sub_255078550();
    swift_allocError();
    unint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F938);
    *unint64_t v32 = &type metadata for OSLogDateFormatter.Style;
    sub_2550785D0();
    sub_255078540();
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
      sub_255062788();
      uint64_t v35 = v41;
      sub_2550785C0();
      if (v35) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
      goto LABEL_19;
    case 2:
      char v59 = 2;
      sub_255062734();
      uint64_t v36 = v41;
      sub_2550785C0();
      if (v36) {
        goto LABEL_16;
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v48);
      goto LABEL_19;
    case 3:
      char v60 = 3;
      sub_2550626E0();
      uint64_t v37 = v41;
      sub_2550785C0();
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
      sub_25506268C();
      uint64_t v38 = v41;
      sub_2550785C0();
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
      sub_2550627DC();
      uint64_t v29 = v40;
      uint64_t v28 = v41;
      sub_2550785C0();
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

uint64_t sub_255062FD0()
{
  return sub_255078720();
}

uint64_t sub_255063018()
{
  return sub_255078720();
}

uint64_t sub_25506305C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return OSLogDateFormatter.Style.init(from:)(a1, a2);
}

uint64_t sub_255063074(void *a1)
{
  return OSLogDateFormatter.Style.encode(to:)(a1);
}

void OSLogDateFormatter.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

id sub_255063098()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  unint64_t v1 = (void *)sub_2550782F0();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  return v0;
}

uint64_t OSLogDateFormatter.format(_:)()
{
  id v0 = sub_255063098();
  unint64_t v1 = (void *)sub_255078100();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  uint64_t v3 = sub_255078300();
  return v3;
}

uint64_t OSLogDateFormatter.parse(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v6 = sub_2550781C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F940);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v24) = *v3;
  id v13 = sub_255063098();
  uint64_t v23 = a1;
  uint64_t v26 = a2;
  uint64_t v14 = (void *)sub_2550782F0();
  id v15 = objc_msgSend(v13, sel_dateFromString_, v14);

  if (v15)
  {
    sub_2550781A0();

    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v16(v12, v9, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v16)(v22, v12, v6);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  sub_2550635F8((uint64_t)v12);
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_255078520();
  sub_255078340();
  sub_255078340();
  sub_255078340();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  uint64_t v18 = v24;
  unint64_t v19 = v25;
  sub_25505C42C();
  swift_allocError();
  *(void *)uint64_t v20 = v18;
  *(void *)(v20 + 8) = v19;
  *(unsigned char *)(v20 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_2550635F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F940);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OSLogDateFormatter.hash(into:)()
{
  return sub_255078710();
}

BOOL static OSLogDateFormatter.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_255063698()
{
  return 1;
}

uint64_t sub_2550636A0()
{
  return sub_255078720();
}

uint64_t sub_2550636E4()
{
  return sub_255078710();
}

uint64_t sub_25506370C()
{
  return sub_255078720();
}

uint64_t sub_25506374C()
{
  return 0x656C797473;
}

uint64_t sub_255063760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656C797473 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2550786A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2550637F0(uint64_t a1)
{
  unint64_t v2 = sub_2550639B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25506382C(uint64_t a1)
{
  unint64_t v2 = sub_2550639B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OSLogDateFormatter.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F948);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550639B0();
  sub_255078740();
  char v10 = v7;
  sub_255063A04();
  sub_255078660();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2550639B0()
{
  unint64_t result = qword_269E7F950;
  if (!qword_269E7F950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F950);
  }
  return result;
}

unint64_t sub_255063A04()
{
  unint64_t result = qword_269E7F958;
  if (!qword_269E7F958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F958);
  }
  return result;
}

uint64_t OSLogDateFormatter.hashValue.getter()
{
  return sub_255078720();
}

uint64_t OSLogDateFormatter.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F960);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550639B0();
  sub_255078730();
  if (!v2)
  {
    sub_255063CF0();
    sub_255078600();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_255063C08(uint64_t *a1@<X8>)
{
  id v2 = sub_255063098();
  uint64_t v3 = (void *)sub_255078100();
  id v4 = objc_msgSend(v2, sel_stringFromDate_, v3);

  uint64_t v5 = sub_255078300();
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
}

uint64_t sub_255063CA0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return OSLogDateFormatter.parse(_:)(*a1, a1[1], a2);
}

uint64_t sub_255063CC0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return OSLogDateFormatter.init(from:)(a1, a2);
}

uint64_t sub_255063CD8(void *a1)
{
  return OSLogDateFormatter.encode(to:)(a1);
}

unint64_t sub_255063CF0()
{
  unint64_t result = qword_269E7F968;
  if (!qword_269E7F968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F968);
  }
  return result;
}

uint64_t TinyDateRangeFormatter.format(_:)()
{
  uint64_t v0 = sub_255078200();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_2550781E0();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_255078120();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_255078180();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F970);
  sub_2550780F0();
  if (v7 >= 1.0)
  {
    sub_255078110();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F978);
    sub_255078160();
    uint64_t v13 = v4;
    uint64_t v12 = v3;
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_255079370;
    sub_255078130();
    sub_255078140();
    sub_255078150();
    sub_255064718(v9);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_2550781D0();
    sub_2550781F0();
    sub_255078170();
    sub_25506577C(&qword_269E7F980, MEMORY[0x263F07408]);
    uint64_t v10 = v12;
    sub_255078440();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v10);
    uint64_t v16 = 32;
    unint64_t v17 = 0xE100000000000000;
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_255064A30();
    uint64_t v8 = sub_2550784C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v19 = 0xE000000000000000;
    sub_2550780F0();
    sub_255078430();
    sub_255078340();
    return v18;
  }
  return v8;
}

uint64_t static TinyDateRangeFormatter.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_255064154(uint64_t a1)
{
  unint64_t v2 = sub_255064A84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255064190(uint64_t a1)
{
  unint64_t v2 = sub_255064A84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TinyDateRangeFormatter.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F990);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255064A84();
  sub_255078740();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t TinyDateRangeFormatter.hashValue.getter()
{
  return sub_255078720();
}

uint64_t TinyDateRangeFormatter.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_25506433C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TinyDateRangeFormatter.format(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_255064364(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_25506438C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F990);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255064A84();
  sub_255078740();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25506449C()
{
  return sub_255078720();
}

uint64_t sub_2550644D4()
{
  return sub_255078720();
}

uint64_t sub_255064508(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025507BC70 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69546F4E656D6974 && a2 == 0xEE00656E6F5A656DLL || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1819047270 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_255064718(uint64_t a1)
{
  uint64_t v2 = sub_255078160();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FA78);
    uint64_t v9 = sub_255078510();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_25506577C(&qword_269E7FA80, MEMORY[0x263F073D0]);
      uint64_t v16 = sub_2550782C0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_25506577C(&qword_269E7FA88, MEMORY[0x263F073D0]);
          char v23 = sub_2550782E0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        unint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

unint64_t sub_255064A30()
{
  unint64_t result = qword_269E7F988;
  if (!qword_269E7F988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F988);
  }
  return result;
}

unint64_t sub_255064A84()
{
  unint64_t result = qword_269E7F998;
  if (!qword_269E7F998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F998);
  }
  return result;
}

unint64_t sub_255064ADC()
{
  unint64_t result = qword_269E7F9A0;
  if (!qword_269E7F9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9A0);
  }
  return result;
}

unint64_t sub_255064B34()
{
  unint64_t result = qword_269E7F9A8;
  if (!qword_269E7F9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9A8);
  }
  return result;
}

unint64_t sub_255064B8C()
{
  unint64_t result = qword_269E7F9B0;
  if (!qword_269E7F9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9B0);
  }
  return result;
}

unint64_t sub_255064BE4()
{
  unint64_t result = qword_269E7F9B8;
  if (!qword_269E7F9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9B8);
  }
  return result;
}

unint64_t sub_255064C3C()
{
  unint64_t result = qword_269E7F9C0;
  if (!qword_269E7F9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9C0);
  }
  return result;
}

unint64_t sub_255064C94()
{
  unint64_t result = qword_269E7F9C8;
  if (!qword_269E7F9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9C8);
  }
  return result;
}

unint64_t sub_255064CEC()
{
  unint64_t result = qword_269E7F9D0;
  if (!qword_269E7F9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9D0);
  }
  return result;
}

unint64_t sub_255064D44()
{
  unint64_t result = qword_269E7F9D8;
  if (!qword_269E7F9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9D8);
  }
  return result;
}

unint64_t sub_255064D9C()
{
  unint64_t result = qword_269E7F9E0;
  if (!qword_269E7F9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter()
{
  return &type metadata for OSLogDateFormatter;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style()
{
  return &type metadata for OSLogDateFormatter.Style;
}

ValueMetadata *type metadata accessor for TinyDateRangeFormatter()
{
  return &type metadata for TinyDateRangeFormatter;
}

ValueMetadata *type metadata accessor for TinyDateRangeFormatter.CodingKeys()
{
  return &type metadata for TinyDateRangeFormatter.CodingKeys;
}

uint64_t getEnumTagSinglePayload for OSLogDateFormatter.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for OSLogDateFormatter.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x255064F28);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_255064F50()
{
  return 0;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.CodingKeys()
{
  return &type metadata for OSLogDateFormatter.CodingKeys;
}

uint64_t _s14LocalStatusKit18OSLogDateFormatterV5StyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14LocalStatusKit18OSLogDateFormatterV5StyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x2550650C4);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.CodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.CodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.DateWithTimeZoneCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.DateCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.DateCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.TimeCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.TimeCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.TimeNoTimeZoneCodingKeys;
}

ValueMetadata *type metadata accessor for OSLogDateFormatter.Style.FullCodingKeys()
{
  return &type metadata for OSLogDateFormatter.Style.FullCodingKeys;
}

unint64_t sub_255065150()
{
  unint64_t result = qword_269E7F9E8;
  if (!qword_269E7F9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9E8);
  }
  return result;
}

unint64_t sub_2550651A8()
{
  unint64_t result = qword_269E7F9F0;
  if (!qword_269E7F9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9F0);
  }
  return result;
}

unint64_t sub_255065200()
{
  unint64_t result = qword_269E7F9F8;
  if (!qword_269E7F9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7F9F8);
  }
  return result;
}

unint64_t sub_255065258()
{
  unint64_t result = qword_269E7FA00;
  if (!qword_269E7FA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA00);
  }
  return result;
}

unint64_t sub_2550652B0()
{
  unint64_t result = qword_269E7FA08;
  if (!qword_269E7FA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA08);
  }
  return result;
}

unint64_t sub_255065308()
{
  unint64_t result = qword_269E7FA10;
  if (!qword_269E7FA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA10);
  }
  return result;
}

unint64_t sub_255065360()
{
  unint64_t result = qword_269E7FA18;
  if (!qword_269E7FA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA18);
  }
  return result;
}

unint64_t sub_2550653B8()
{
  unint64_t result = qword_269E7FA20;
  if (!qword_269E7FA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA20);
  }
  return result;
}

unint64_t sub_255065410()
{
  unint64_t result = qword_269E7FA28;
  if (!qword_269E7FA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA28);
  }
  return result;
}

unint64_t sub_255065468()
{
  unint64_t result = qword_269E7FA30;
  if (!qword_269E7FA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA30);
  }
  return result;
}

unint64_t sub_2550654C0()
{
  unint64_t result = qword_269E7FA38;
  if (!qword_269E7FA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA38);
  }
  return result;
}

unint64_t sub_255065518()
{
  unint64_t result = qword_269E7FA40;
  if (!qword_269E7FA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA40);
  }
  return result;
}

unint64_t sub_255065570()
{
  unint64_t result = qword_269E7FA48;
  if (!qword_269E7FA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA48);
  }
  return result;
}

unint64_t sub_2550655C8()
{
  unint64_t result = qword_269E7FA50;
  if (!qword_269E7FA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA50);
  }
  return result;
}

unint64_t sub_255065620()
{
  unint64_t result = qword_269E7FA58;
  if (!qword_269E7FA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA58);
  }
  return result;
}

unint64_t sub_255065678()
{
  unint64_t result = qword_269E7FA60;
  if (!qword_269E7FA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA60);
  }
  return result;
}

unint64_t sub_2550656D0()
{
  unint64_t result = qword_269E7FA68;
  if (!qword_269E7FA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA68);
  }
  return result;
}

unint64_t sub_255065728()
{
  unint64_t result = qword_269E7FA70;
  if (!qword_269E7FA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA70);
  }
  return result;
}

uint64_t sub_25506577C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t LSKDomain.rawValue.getter()
{
  unint64_t result = 0xD000000000000021;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t LSKDomain.id.getter()
{
  unint64_t result = 0xD000000000000021;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

LocalStatusKit::LSKDomain_optional __swiftcall LSKDomain.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_2550785B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

void *static LSKDomain.allCases.getter()
{
  return &unk_27043B0F0;
}

uint64_t sub_255065964(char *a1, char *a2)
{
  return sub_25505C96C(*a1, *a2);
}

LocalStatusKit::LSKDomain_optional sub_255065970(Swift::String *a1)
{
  return LSKDomain.init(rawValue:)(*a1);
}

unint64_t sub_25506597C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = LSKDomain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2550659A4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = LSKDomain.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2550659CC()
{
  return sub_2550783B0();
}

uint64_t sub_255065A2C()
{
  return sub_255078390();
}

unint64_t sub_255065A80()
{
  unint64_t result = qword_269E7FA90;
  if (!qword_269E7FA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA90);
  }
  return result;
}

uint64_t sub_255065AD4()
{
  return sub_255065ADC();
}

uint64_t sub_255065ADC()
{
  return sub_255078720();
}

uint64_t sub_255065BC4()
{
  return sub_25505D550();
}

uint64_t sub_255065BCC()
{
  return sub_255065C34();
}

unint64_t sub_255065BD8()
{
  unint64_t result = qword_269E7FA98;
  if (!qword_269E7FA98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E7FAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FA98);
  }
  return result;
}

uint64_t sub_255065C34()
{
  return sub_255078720();
}

void sub_255065D18(void *a1@<X8>)
{
  *a1 = &unk_27043B198;
}

uint64_t getEnumTagSinglePayload for LSKDomain(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LSKDomain(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x255065E84);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKDomain()
{
  return &type metadata for LSKDomain;
}

unint64_t sub_255065EBC()
{
  unint64_t result = qword_26B276520;
  if (!qword_26B276520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276520);
  }
  return result;
}

BOOL static LSKStatusOptions.DeviceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LSKStatusOptions.DeviceType.hash(into:)()
{
  return sub_255078710();
}

uint64_t sub_255065F50()
{
  uint64_t v1 = 6513005;
  if (*v0 != 1) {
    uint64_t v1 = 30324;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 825242478;
  }
}

uint64_t sub_255065F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255068A64(a1, a2);
  *a3 = result;
  return result;
}

void sub_255065FB8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_255065FC4(uint64_t a1)
{
  unint64_t v2 = sub_255066508();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255066000(uint64_t a1)
{
  unint64_t v2 = sub_255066508();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25506603C(uint64_t a1)
{
  unint64_t v2 = sub_2550665B0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255066078(uint64_t a1)
{
  unint64_t v2 = sub_2550665B0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2550660B4(uint64_t a1)
{
  unint64_t v2 = sub_255066604();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550660F0(uint64_t a1)
{
  unint64_t v2 = sub_255066604();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25506612C(uint64_t a1)
{
  unint64_t v2 = sub_25506655C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255066168(uint64_t a1)
{
  unint64_t v2 = sub_25506655C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LSKStatusOptions.DeviceType.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276008);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  char v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276098);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2760A0);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276090);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255066508();
  sub_255078740();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_2550665B0();
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_25506655C();
      uint64_t v17 = v23;
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_255066604();
    sub_255078630();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_255066508()
{
  unint64_t result = qword_26B276408;
  if (!qword_26B276408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276408);
  }
  return result;
}

unint64_t sub_25506655C()
{
  unint64_t result = qword_26B275E80;
  if (!qword_26B275E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275E80);
  }
  return result;
}

unint64_t sub_2550665B0()
{
  unint64_t result = qword_26B2760C8[0];
  if (!qword_26B2760C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B2760C8);
  }
  return result;
}

unint64_t sub_255066604()
{
  unint64_t result = qword_26B275FE8;
  if (!qword_26B275FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275FE8);
  }
  return result;
}

uint64_t LSKStatusOptions.DeviceType.hashValue.getter()
{
  return sub_255078720();
}

uint64_t LSKStatusOptions.DeviceType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275CB8);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FB8);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FC0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FB0);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255066508();
  uint64_t v12 = (uint64_t)v39;
  sub_255078730();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  unint64_t v15 = v11;
  uint64_t v16 = sub_255078610();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_255078550();
    swift_allocError();
    char v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F938);
    *char v23 = &type metadata for LSKStatusOptions.DeviceType;
    sub_2550785D0();
    sub_255078540();
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
      sub_2550665B0();
      uint64_t v18 = v30;
      sub_2550785C0();
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
      sub_25506655C();
      uint64_t v25 = v30;
      sub_2550785C0();
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
    sub_255066604();
    uint64_t v24 = v30;
    sub_2550785C0();
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

uint64_t sub_255066C58@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return LSKStatusOptions.DeviceType.init(from:)(a1, a2);
}

uint64_t sub_255066C70(void *a1)
{
  return LSKStatusOptions.DeviceType.encode(to:)(a1);
}

uint64_t static LSKStatusOptions.Scope.== infix(_:_:)()
{
  return 1;
}

uint64_t LSKStatusOptions.Scope.hash(into:)()
{
  return sub_255078710();
}

uint64_t sub_255066CC0()
{
  return 0x6F636341656D6173;
}

uint64_t sub_255066CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6F636341656D6173 && a2 == 0xEB00000000746E75)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2550786A0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_255066D90(uint64_t a1)
{
  unint64_t v2 = sub_255067050();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255066DCC(uint64_t a1)
{
  unint64_t v2 = sub_255067050();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255066E08(uint64_t a1)
{
  unint64_t v2 = sub_2550670A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255066E44(uint64_t a1)
{
  unint64_t v2 = sub_2550670A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LSKStatusOptions.Scope.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2760B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2760A8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255067050();
  sub_255078740();
  sub_2550670A4();
  sub_255078630();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_255067050()
{
  unint64_t result = qword_26B276440;
  if (!qword_26B276440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276440);
  }
  return result;
}

unint64_t sub_2550670A4()
{
  unint64_t result = qword_26B276458;
  if (!qword_26B276458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276458);
  }
  return result;
}

uint64_t LSKStatusOptions.Scope.hashValue.getter()
{
  return sub_255078720();
}

uint64_t LSKStatusOptions.Scope.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FD0);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FC8);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255067050();
  sub_255078730();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_255078610() + 16) == 1)
    {
      sub_2550670A4();
      sub_2550785C0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_255078550();
      swift_allocError();
      uint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F938);
      *uint64_t v13 = &type metadata for LSKStatusOptions.Scope;
      sub_2550785D0();
      sub_255078540();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_255067424(void *a1)
{
  return LSKStatusOptions.Scope.init(from:)(a1);
}

uint64_t sub_25506743C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2760B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2760A8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255067050();
  sub_255078740();
  sub_2550670A4();
  sub_255078630();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LSKStatusOptions.publishToDeviceTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void LSKStatusOptions.init(scope:publishToDeviceTypes:)(uint64_t a1@<X1>, void *a2@<X8>)
{
  *a2 = a1;
}

uint64_t LSKStatusOptions.hash(into:)()
{
  uint64_t v1 = *v0;
  sub_255078710();
  uint64_t result = sub_255078710();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1 + 32;
    do
    {
      ++v4;
      uint64_t result = sub_255078710();
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL sub_255067680(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_255067698()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0x65706F6373;
  }
}

uint64_t sub_2550676D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255068B84(a1, a2);
  *a3 = result;
  return result;
}

void sub_2550676FC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_255067708(uint64_t a1)
{
  unint64_t v2 = sub_255067CDC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255067744(uint64_t a1)
{
  unint64_t v2 = sub_255067CDC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LSKStatusOptions.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276088);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255067CDC();
  sub_255078740();
  char v12 = 0;
  sub_255067D30();
  sub_255078660();
  if (!v2)
  {
    v10[1] = v8;
    char v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B276548);
    sub_255067E2C(&qword_26B276068, (void (*)(void))sub_255067D84);
    sub_255078660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t LSKStatusOptions.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_255078700();
  sub_255078710();
  sub_255078710();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      sub_255078710();
      --v2;
    }
    while (v2);
  }
  return sub_255078720();
}

uint64_t LSKStatusOptions.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255067CDC();
  sub_255078730();
  if (!v2)
  {
    char v12 = 0;
    sub_255067DD8();
    sub_255078600();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B276548);
    char v11 = 1;
    sub_255067E2C(&qword_26B275F90, (void (*)(void))sub_255067E9C);
    sub_255078600();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_255067BC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return LSKStatusOptions.init(from:)(a1, a2);
}

uint64_t sub_255067BDC(void *a1)
{
  return LSKStatusOptions.encode(to:)(a1);
}

uint64_t sub_255067C00()
{
  uint64_t v1 = *v0;
  sub_255078700();
  sub_255078710();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_255078710();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      sub_255078710();
      --v2;
    }
    while (v2);
  }
  return sub_255078720();
}

BOOL _s14LocalStatusKit16LSKStatusOptionsV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(*a1 + 16);
  if (v4 != *(void *)(*a2 + 16)) {
    return 0;
  }
  if (!v4 || v2 == v3) {
    return 1;
  }
  uint64_t v5 = (unsigned __int8 *)(v2 + 32);
  uint64_t v6 = (unsigned __int8 *)(v3 + 32);
  uint64_t v7 = v4 - 1;
  do
  {
    int v9 = *v5++;
    int v8 = v9;
    int v11 = *v6++;
    int v10 = v11;
    BOOL v13 = v7-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v13);
  return result;
}

unint64_t sub_255067CDC()
{
  unint64_t result = qword_26B2763F0;
  if (!qword_26B2763F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763F0);
  }
  return result;
}

unint64_t sub_255067D30()
{
  unint64_t result = qword_26B276038;
  if (!qword_26B276038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276038);
  }
  return result;
}

unint64_t sub_255067D84()
{
  unint64_t result = qword_26B276030;
  if (!qword_26B276030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276030);
  }
  return result;
}

unint64_t sub_255067DD8()
{
  unint64_t result = qword_26B275F60;
  if (!qword_26B275F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275F60);
  }
  return result;
}

uint64_t sub_255067E2C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B276548);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_255067E9C()
{
  unint64_t result = qword_26B275F58;
  if (!qword_26B275F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275F58);
  }
  return result;
}

unint64_t sub_255067EF4()
{
  unint64_t result = qword_269E7FAA8;
  if (!qword_269E7FAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAA8);
  }
  return result;
}

unint64_t sub_255067F4C()
{
  unint64_t result = qword_269E7FAB0;
  if (!qword_269E7FAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAB0);
  }
  return result;
}

unint64_t sub_255067FA4()
{
  unint64_t result = qword_269E7FAB8;
  if (!qword_269E7FAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAB8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for LSKStatusOptions(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LSKStatusOptions()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LSKStatusOptions(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *assignWithTake for LSKStatusOptions(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKStatusOptions(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LSKStatusOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions()
{
  return &type metadata for LSKStatusOptions;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType()
{
  return &type metadata for LSKStatusOptions.DeviceType;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope()
{
  return &type metadata for LSKStatusOptions.Scope;
}

unsigned char *storeEnumTagSinglePayload for LSKStatusOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x25506823CLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.CodingKeys()
{
  return &type metadata for LSKStatusOptions.CodingKeys;
}

unsigned char *_s14LocalStatusKit16LSKStatusOptionsV5ScopeOwst_0(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x255068310);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope.CodingKeys()
{
  return &type metadata for LSKStatusOptions.Scope.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.Scope.SameAccountCodingKeys()
{
  return &type metadata for LSKStatusOptions.Scope.SameAccountCodingKeys;
}

unsigned char *_s14LocalStatusKit16LSKStatusOptionsV10DeviceTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x255068424);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.CodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.N301CodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.N301CodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.MacCodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.MacCodingKeys;
}

ValueMetadata *type metadata accessor for LSKStatusOptions.DeviceType.TvCodingKeys()
{
  return &type metadata for LSKStatusOptions.DeviceType.TvCodingKeys;
}

unint64_t sub_255068490()
{
  unint64_t result = qword_269E7FAC0;
  if (!qword_269E7FAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAC0);
  }
  return result;
}

unint64_t sub_2550684E8()
{
  unint64_t result = qword_269E7FAC8;
  if (!qword_269E7FAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAC8);
  }
  return result;
}

unint64_t sub_255068540()
{
  unint64_t result = qword_269E7FAD0;
  if (!qword_269E7FAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FAD0);
  }
  return result;
}

unint64_t sub_255068598()
{
  unint64_t result = qword_26B276400;
  if (!qword_26B276400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276400);
  }
  return result;
}

unint64_t sub_2550685F0()
{
  unint64_t result = qword_26B2763F8;
  if (!qword_26B2763F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763F8);
  }
  return result;
}

unint64_t sub_255068648()
{
  unint64_t result = qword_26B276468;
  if (!qword_26B276468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276468);
  }
  return result;
}

unint64_t sub_2550686A0()
{
  unint64_t result = qword_26B276460;
  if (!qword_26B276460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276460);
  }
  return result;
}

unint64_t sub_2550686F8()
{
  unint64_t result = qword_26B276450;
  if (!qword_26B276450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276450);
  }
  return result;
}

unint64_t sub_255068750()
{
  unint64_t result = qword_26B276448;
  if (!qword_26B276448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276448);
  }
  return result;
}

unint64_t sub_2550687A8()
{
  unint64_t result = qword_26B276438;
  if (!qword_26B276438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276438);
  }
  return result;
}

unint64_t sub_255068800()
{
  unint64_t result = qword_26B276430;
  if (!qword_26B276430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276430);
  }
  return result;
}

unint64_t sub_255068858()
{
  unint64_t result = qword_26B276428;
  if (!qword_26B276428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276428);
  }
  return result;
}

unint64_t sub_2550688B0()
{
  unint64_t result = qword_26B276420;
  if (!qword_26B276420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276420);
  }
  return result;
}

unint64_t sub_255068908()
{
  unint64_t result = qword_26B2760B8;
  if (!qword_26B2760B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2760B8);
  }
  return result;
}

unint64_t sub_255068960()
{
  unint64_t result = qword_26B2760C0;
  if (!qword_26B2760C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2760C0);
  }
  return result;
}

unint64_t sub_2550689B8()
{
  unint64_t result = qword_26B276418;
  if (!qword_26B276418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276418);
  }
  return result;
}

unint64_t sub_255068A10()
{
  unint64_t result = qword_26B276410;
  if (!qword_26B276410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276410);
  }
  return result;
}

uint64_t sub_255068A64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 825242478 && a2 == 0xE400000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6513005 && a2 == 0xE300000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 30324 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_255068B84(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65706F6373 && a2 == 0xE500000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025507BCB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_255068C74()
{
  uint64_t v0 = sub_255078230();
  __swift_allocate_value_buffer(v0, qword_269E7FAD8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_269E7FAD8);
  if (qword_26B275F80 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B275F20);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

unint64_t static LSKLocalStatusClient.xpcMachServiceName.getter()
{
  return 0xD000000000000019;
}

uint64_t LSKLocalStatusClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  LSKLocalStatusClient.init()();
  return v0;
}

uint64_t LSKLocalStatusClient.init()()
{
  uint64_t v0 = sub_255078470();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_255078460();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_2550782B0();
  MEMORY[0x270FA5388](v5 - 8);
  sub_255069040();
  sub_2550782A0();
  v10[1] = MEMORY[0x263F8EE78];
  sub_255069CD8(&qword_26B276170, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276160);
  sub_255060A84(&qword_26B276168, &qword_26B276160);
  sub_2550784E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  char v6 = (void *)sub_255078480();
  uint64_t v7 = v10[0];
  *(void *)(v10[0] + 16) = v6;
  sub_255078270();
  id v8 = v6;
  *(void *)(v7 + 24) = sub_255078250();
  swift_retain();
  sub_255078260();
  swift_release();
  return v7;
}

unint64_t sub_255069040()
{
  unint64_t result = qword_26B276178[0];
  if (!qword_26B276178[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26B276178);
  }
  return result;
}

uint64_t LSKLocalStatusClient.publish<A>(_:for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 144) = v24;
  *(void *)(v9 + 152) = v8;
  *(void *)(v9 + 128) = a7;
  *(void *)(v9 + 136) = a8;
  *(void *)(v9 + 112) = a3;
  *(void *)(v9 + 120) = a6;
  *(void *)(v9 + 96) = a1;
  *(void *)(v9 + 104) = a2;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B276530);
  *(void *)(v9 + 160) = v15;
  *(void *)(v9 + 64) = a6;
  *(void *)(v9 + 72) = a7;
  *(void *)(v9 + 80) = a8;
  *(void *)(v9 + 88) = v24;
  uint64_t v16 = type metadata accessor for LSKPublishedStatus();
  *(void *)(v9 + 168) = v16;
  *(void *)(v9 + 176) = sub_255060A84(&qword_26B276058, &qword_26B276530);
  uint64_t v17 = sub_255078680();
  *(void *)(v9 + 184) = v17;
  *(void *)(v9 + 192) = *(void *)(v17 - 8);
  *(void *)(v9 + 200) = swift_task_alloc();
  *(void *)(v9 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
  *(void *)(v9 + 216) = swift_task_alloc();
  *(void *)(v9 + 224) = *(void *)(v15 - 8);
  *(void *)(v9 + 232) = swift_task_alloc();
  *(void *)(v9 + 240) = swift_task_alloc();
  *(void *)(v9 + 248) = *(void *)(v16 - 8);
  *(void *)(v9 + 256) = swift_task_alloc();
  *(void *)(v9 + 264) = type metadata accessor for PublishStatusInvocation.Response(0);
  uint64_t v18 = swift_task_alloc();
  *(unsigned char *)(v9 + 344) = *(unsigned char *)a4;
  uint64_t v19 = *(void *)(a4 + 8);
  uint64_t v20 = *(void *)(a4 + 16);
  *(void *)(v9 + 272) = v18;
  *(void *)(v9 + 280) = v19;
  uint64_t v21 = *a5;
  *(void *)(v9 + 288) = v20;
  *(void *)(v9 + 296) = v21;
  return MEMORY[0x270FA2498](sub_255069320, 0, 0);
}

uint64_t sub_255069320()
{
  uint64_t v23 = v0;
  sub_2550780A0();
  swift_allocObject();
  sub_255078090();
  uint64_t v1 = sub_255078080();
  *(void *)(v0 + 304) = v1;
  *(void *)(v0 + 312) = v2;
  uint64_t v3 = v1;
  unint64_t v4 = v2;
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v6 = *(void *)(v0 + 280);
  char v7 = *(unsigned char *)(v0 + 344);
  uint64_t v16 = *(void *)(v0 + 296);
  swift_release();
  char v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v5;
  type metadata accessor for LSKKey();
  sub_25505D53C((uint64_t)v17);
  char v8 = v17[0];
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  *(void *)(v0 + 320) = v19;
  uint64_t v11 = type metadata accessor for PublishStatusInvocation(0);
  *(unsigned char *)(v0 + 16) = v8;
  *(void *)(v0 + 24) = v9;
  *(void *)(v0 + 32) = v10;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = v4;
  *(void *)(v0 + 56) = v16;
  sub_255061AF4(v3, v4);
  swift_bridgeObjectRetain();
  char v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v12;
  uint64_t v13 = sub_255069CD8(&qword_26B276028, (void (*)(uint64_t))type metadata accessor for PublishStatusInvocation);
  *char v12 = v0;
  v12[1] = sub_255069598;
  uint64_t v14 = *(void *)(v0 + 272);
  return MEMORY[0x270F63398](v14, v11, v0 + 16, v11, v13);
}

uint64_t sub_255069598()
{
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_255069BAC;
  }
  else {
    unint64_t v2 = sub_2550696AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2550696AC()
{
  uint64_t v55 = v0;
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[17];
  uint64_t v46 = v0[18];
  uint64_t v48 = v0[42];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[16];
  uint64_t v6 = *(void *)(v1 + 8);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  unint64_t v9 = *(void *)(v1 + 32);
  uint64_t v10 = *(void *)(v1 + 40);
  LOBYTE(v50) = *(unsigned char *)v1;
  *((void *)&v50 + 1) = v6;
  uint64_t v51 = v7;
  uint64_t v52 = v8;
  unint64_t v53 = v9;
  uint64_t v54 = v10;
  swift_bridgeObjectRetain();
  sub_255069D20(v8, v9);
  swift_bridgeObjectRetain();
  sub_255060180(v4, v5, v3, v46, v2);
  if (v48)
  {
    unint64_t v11 = v0[39];
    uint64_t v12 = v0[38];
    uint64_t v13 = v0[34];
    swift_bridgeObjectRelease();
    sub_255061B4C(v12, v11);
    swift_bridgeObjectRelease();
    sub_255061B60(v12, v11);
    swift_bridgeObjectRelease();
    sub_255061B4C(v8, v9);
    swift_bridgeObjectRelease();
    sub_25506A868(v13, type metadata accessor for PublishStatusInvocation.Response);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v16 = v0[33];
    uint64_t v15 = v0[34];
    uint64_t v17 = v0[27];
    uint64_t v18 = v0[28];
    uint64_t v19 = v0[20];
    swift_bridgeObjectRelease();
    sub_255061B4C(v8, v9);
    swift_bridgeObjectRelease();
    sub_25506F3B8(v15 + *(int *)(v16 + 20), v17, &qword_26B276538);
    int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v17, 1, v19);
    unint64_t v21 = v0[39];
    uint64_t v22 = v0[38];
    uint64_t v23 = v0[31];
    uint64_t v49 = v0[32];
    if (v20 == 1)
    {
      uint64_t v24 = v0[27];
      uint64_t v25 = v0[21];
      uint64_t v26 = v0[12];
      sub_25506A868(v0[34], type metadata accessor for PublishStatusInvocation.Response);
      sub_255061B60(v22, v21);
      swift_bridgeObjectRelease();
      sub_255061B4C(v22, v21);
      swift_bridgeObjectRelease();
      sub_25506F41C(v24, &qword_26B276538);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v26, v49, v25);
      long long v27 = 0uLL;
    }
    else
    {
      uint64_t v28 = v0[29];
      uint64_t v29 = v0[30];
      uint64_t v47 = v0[34];
      uint64_t v30 = v0[28];
      unint64_t v44 = v0[39];
      uint64_t v45 = v0[38];
      uint64_t v31 = v0[26];
      uint64_t v32 = v0[23];
      uint64_t v42 = v0[24];
      uint64_t v43 = v0[25];
      uint64_t v33 = v0[21];
      uint64_t v34 = v0[20];
      uint64_t v41 = v0[12];
      long long v39 = *(_OWORD *)(v0 + 17);
      long long v40 = *(_OWORD *)(v0 + 15);
      (*(void (**)(uint64_t, void, uint64_t))(v30 + 32))(v29, v0[27], v34);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v28, v29, v34);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = v40;
      *(_OWORD *)(v35 + 32) = v39;
      sub_255078420();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v41, v49, v33);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v43, v31, v32);
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FE0);
      uint64_t WitnessTable = swift_getWitnessTable();
      LSKPublishedStatusSequence.init<A>(_:)(v43, v33, v36, v32, WitnessTable, &v50);
      swift_bridgeObjectRelease();
      sub_255061B4C(v45, v44);
      swift_bridgeObjectRelease();
      sub_255061B60(v45, v44);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v31, v32);
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v34);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v49, v33);
      sub_25506A868(v47, type metadata accessor for PublishStatusInvocation.Response);
      long long v27 = v50;
    }
    *(_OWORD *)v0[13] = v27;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
  }
  return v14();
}

uint64_t sub_255069BAC()
{
  unint64_t v1 = v0[39];
  uint64_t v2 = v0[38];
  sub_255061B60(v2, v1);
  swift_bridgeObjectRelease();
  sub_255061B4C(v2, v1);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t type metadata accessor for PublishStatusInvocation.Response(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_26B2763E0);
}

uint64_t type metadata accessor for PublishStatusInvocation(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_26B276150);
}

uint64_t sub_255069CD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_255069D20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_255061AF4(a1, a2);
  }
  return a1;
}

uint64_t sub_255069D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a3;
  *(unsigned char *)(v6 + 96) = *(unsigned char *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = v8;
  *(_OWORD *)(v6 + 72) = *(_OWORD *)(a2 + 24);
  *(void *)(v6 + 88) = *(void *)(a2 + 40);
  return MEMORY[0x270FA2498](sub_25506F564, 0, 0);
}

uint64_t sub_255069D7C()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_255069D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_25506F538;
  return sub_255069D34(a1, a2, v6, v7, v9, v8);
}

uint64_t LSKLocalStatusClient.status<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 136) = a7;
  *(void *)(v8 + 144) = v7;
  *(void *)(v8 + 120) = a5;
  *(void *)(v8 + 128) = a6;
  *(void *)(v8 + 104) = a2;
  *(void *)(v8 + 112) = a4;
  *(void *)(v8 + 96) = a1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B276530);
  *(void *)(v8 + 152) = v14;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 40) = a7;
  uint64_t v15 = type metadata accessor for LSKPublishedStatus();
  *(void *)(v8 + 160) = v15;
  *(void *)(v8 + 168) = sub_255060A84(&qword_26B276058, &qword_26B276530);
  uint64_t v16 = sub_255078680();
  *(void *)(v8 + 176) = v16;
  *(void *)(v8 + 184) = *(void *)(v16 - 8);
  *(void *)(v8 + 192) = swift_task_alloc();
  *(void *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
  *(void *)(v8 + 208) = swift_task_alloc();
  *(void *)(v8 + 216) = *(void *)(v14 - 8);
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  *(void *)(v8 + 240) = *(void *)(v15 - 8);
  *(void *)(v8 + 248) = swift_task_alloc();
  *(void *)(v8 + 256) = type metadata accessor for LocalStatusInvocation.Response(0);
  uint64_t v17 = swift_task_alloc();
  *(unsigned char *)(v8 + 312) = *(unsigned char *)a3;
  uint64_t v18 = *(void *)(a3 + 8);
  uint64_t v19 = *(void *)(a3 + 16);
  *(void *)(v8 + 264) = v17;
  *(void *)(v8 + 272) = v18;
  *(void *)(v8 + 280) = v19;
  return MEMORY[0x270FA2498](sub_25506A0E8, 0, 0);
}

uint64_t sub_25506A0E8()
{
  uint64_t v1 = type metadata accessor for LocalStatusInvocation(0);
  type metadata accessor for LSKKey();
  sub_25505D53C(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  *(unsigned char *)(v0 + 72) = *(unsigned char *)(v0 + 48);
  *(void *)(v0 + 288) = v3;
  *(void *)(v0 + 80) = v2;
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  uint64_t v5 = sub_255069CD8(&qword_269E7FB10, (void (*)(uint64_t))type metadata accessor for LocalStatusInvocation);
  *uint64_t v4 = v0;
  v4[1] = sub_25506A250;
  uint64_t v6 = *(void *)(v0 + 264);
  return MEMORY[0x270F63398](v6, v1, v0 + 72, v1, v5);
}

uint64_t sub_25506A250()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_25506A76C;
  }
  else {
    uint64_t v2 = sub_25506A374;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25506A374()
{
  unint64_t v44 = v0;
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[15];
  uint64_t v8 = *(void *)(v2 + 8);
  uint64_t v9 = *(void *)(v2 + 16);
  uint64_t v10 = *(void *)(v2 + 40);
  LOBYTE(v40) = *(unsigned char *)v2;
  *((void *)&v40 + 1) = v8;
  uint64_t v41 = v9;
  long long v42 = *(_OWORD *)(v2 + 24);
  uint64_t v43 = v10;
  sub_255060180(v6, v7, v4, v5, v3);
  uint64_t v11 = v0[33];
  if (v1)
  {
    sub_25506A868(v11, type metadata accessor for LocalStatusInvocation.Response);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v13 = v0[26];
    uint64_t v14 = v0[27];
    uint64_t v15 = v0[19];
    sub_25506F3B8(v11 + *(int *)(v0[32] + 20), v13, &qword_26B276538);
    int v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v13, 1, v15);
    uint64_t v17 = v0[30];
    uint64_t v18 = v0[31];
    if (v16 == 1)
    {
      uint64_t v19 = v0[26];
      uint64_t v20 = v0[20];
      uint64_t v21 = v0[12];
      sub_25506A868(v0[33], type metadata accessor for LocalStatusInvocation.Response);
      sub_25506F41C(v19, &qword_26B276538);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v21, v18, v20);
      long long v22 = 0uLL;
    }
    else
    {
      uint64_t v23 = v0[28];
      uint64_t v24 = v0[29];
      uint64_t v25 = v0[27];
      uint64_t v26 = v0[23];
      uint64_t v38 = v0[24];
      uint64_t v27 = v0[22];
      uint64_t v36 = v0[25];
      uint64_t v28 = v0[19];
      uint64_t v29 = v0[20];
      uint64_t v37 = v0[12];
      uint64_t v39 = v0[33];
      long long v34 = *((_OWORD *)v0 + 8);
      long long v35 = *((_OWORD *)v0 + 7);
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 32))(v24, v0[26], v28);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v24, v28);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = v35;
      *(_OWORD *)(v30 + 32) = v34;
      sub_255078420();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v37, v18, v29);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v38, v36, v27);
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FE0);
      uint64_t WitnessTable = swift_getWitnessTable();
      LSKPublishedStatusSequence.init<A>(_:)(v38, v29, v31, v27, WitnessTable, &v40);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v36, v27);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v28);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v29);
      sub_25506A868(v39, type metadata accessor for LocalStatusInvocation.Response);
      long long v22 = v40;
    }
    *(_OWORD *)v0[13] = v22;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  return v12();
}

uint64_t sub_25506A76C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for LocalStatusInvocation.Response(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_269E7FB68);
}

uint64_t type metadata accessor for LocalStatusInvocation(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_26B275F48);
}

uint64_t sub_25506A868(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25506A8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a3;
  *(unsigned char *)(v6 + 96) = *(unsigned char *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = v8;
  *(_OWORD *)(v6 + 72) = *(_OWORD *)(a2 + 24);
  *(void *)(v6 + 88) = *(void *)(a2 + 40);
  return MEMORY[0x270FA2498](sub_25506A910, 0, 0);
}

uint64_t sub_25506A910()
{
  sub_255060180(v0[3], v0[4], v0[5], v0[6], v0[2]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25506A9BC()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25506A9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_25505BBF8;
  return sub_25506A8C8(a1, a2, v6, v7, v9, v8);
}

uint64_t LSKLocalStatusClient.subscribe<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 64) = a5;
  *(void *)(v6 + 72) = v5;
  *(void *)(v6 + 48) = a3;
  *(void *)(v6 + 56) = a4;
  *(void *)(v6 + 40) = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B275E88);
  *(void *)(v6 + 80) = v8;
  type metadata accessor for LSKLocalStatusObservation();
  *(void *)(v6 + 88) = sub_2550783D0();
  *(void *)(v6 + 96) = sub_255060A84(&qword_26B275D48, &qword_26B275E88);
  uint64_t v9 = sub_255078580();
  *(void *)(v6 + 104) = v9;
  *(void *)(v6 + 112) = *(void *)(v9 - 8);
  *(void *)(v6 + 120) = swift_task_alloc();
  *(void *)(v6 + 128) = swift_task_alloc();
  *(void *)(v6 + 136) = *(void *)(v8 - 8);
  *(void *)(v6 + 144) = swift_task_alloc();
  uint64_t v10 = swift_task_alloc();
  *(unsigned char *)(v6 + 200) = *(unsigned char *)a2;
  uint64_t v11 = *(void *)(a2 + 8);
  uint64_t v12 = *(void *)(a2 + 16);
  *(void *)(v6 + 152) = v10;
  *(void *)(v6 + 160) = v11;
  *(void *)(v6 + 168) = v12;
  return MEMORY[0x270FA2498](sub_25506AC70, 0, 0);
}

uint64_t sub_25506AC70()
{
  uint64_t v17 = v0;
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  char v14 = *(unsigned char *)(v0 + 200);
  uint64_t v15 = v2;
  uint64_t v16 = v1;
  type metadata accessor for LSKKey();
  sub_25505D53C((uint64_t)v11);
  char v3 = v11[0];
  uint64_t v4 = v12;
  uint64_t v5 = v13;
  *(void *)(v0 + 176) = v13;
  uint64_t v6 = type metadata accessor for SubscribeStatusInvocation(0);
  *(unsigned char *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v4;
  *(void *)(v0 + 32) = v5;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v7;
  uint64_t v8 = sub_255069CD8(qword_26B275CC0, (void (*)(uint64_t))type metadata accessor for SubscribeStatusInvocation);
  *uint64_t v7 = v0;
  v7[1] = sub_25506ADB8;
  uint64_t v9 = *(void *)(v0 + 152);
  return MEMORY[0x270F63398](v9, v6, v0 + 16, v6, v8);
}

uint64_t sub_25506ADB8()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25506B0B8;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25506AED4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25506AED4()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v14 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v15 = *(void **)(v0 + 40);
  uint64_t v16 = *(void *)(v0 + 152);
  long long v13 = *(_OWORD *)(v0 + 48);
  (*(void (**)(void))(v1 + 16))();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v13;
  *(void *)(v8 + 32) = v7;
  sub_255078410();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v14, v2, v4);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FE0);
  uint64_t WitnessTable = swift_getWitnessTable();
  LSKObservationsSequence.init<A>(_:)(v14, v6, v9, v4, WitnessTable, v15);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v16, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_25506B0B8()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for SubscribeStatusInvocation(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_26B275FF8);
}

uint64_t sub_25506B16C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25506B1A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a1;
  v5[4] = a3;
  v5[7] = *a2;
  return MEMORY[0x270FA2498](sub_25506B1D0, 0, 0);
}

uint64_t sub_25506B1D0()
{
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = (uint64_t *)v0[3];
  v0[2] = v0[7];
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v3;
  v5[3] = v2;
  v5[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B275D50);
  type metadata accessor for LSKLocalStatusObservation();
  sub_255060A84(&qword_26B275D58, &qword_26B275D50);
  uint64_t v6 = sub_255078380();
  swift_task_dealloc();
  *uint64_t v4 = v6;
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25506B2FC()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25506B30C(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_25505BBF8;
  *(_OWORD *)(v7 + 32) = v8;
  *(void *)(v7 + 24) = a1;
  uint64_t v9 = *a2;
  *(void *)(v7 + 48) = v6;
  *(void *)(v7 + 56) = v9;
  return MEMORY[0x270FA2498](sub_25506B1D0, 0, 0);
}

uint64_t sub_25506B3D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBA0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LSKLocalStatusObservation();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - v13;
  sub_25507570C(a2, a3, (uint64_t *)((char *)&v27 - v13));
  if (v4)
  {
    uint64_t v30 = v11;
    if (qword_269E7F820 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_255078230();
    __swift_project_value_buffer(v15, (uint64_t)qword_269E7FAD8);
    sub_25506F3B8(a1, (uint64_t)v10, &qword_269E7FBA0);
    uint64_t v16 = sub_255078210();
    os_log_type_t v17 = sub_255078450();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v33 = v29;
      *(_DWORD *)uint64_t v18 = 136315394;
      os_log_t v28 = v16;
      uint64_t v19 = sub_25506E8EC();
      uint64_t v32 = sub_25506EAE0(v19, v20, &v33);
      sub_2550784A0();
      swift_bridgeObjectRelease();
      sub_25506F41C((uint64_t)v10, &qword_269E7FBA0);
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v21 = sub_255078770();
      uint64_t v32 = sub_25506EAE0(v21, v22, &v33);
      sub_2550784A0();
      swift_bridgeObjectRelease();
      uint64_t v16 = v28;
      uint64_t v23 = v29;
      swift_arrayDestroy();
      MEMORY[0x25A286410](v23, -1, -1);
      MEMORY[0x25A286410](v18, -1, -1);
      MEMORY[0x25A286270](v4);
    }
    else
    {
      MEMORY[0x25A286270](v4);
      sub_25506F41C((uint64_t)v10, &qword_269E7FBA0);
    }

    uint64_t v24 = 1;
    uint64_t v25 = v30;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v31, v14, v11);
    uint64_t v24 = 0;
    uint64_t v25 = v11;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v31, v24, 1, v25);
}

uint64_t LSKLocalStatusClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t LSKLocalStatusClient.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_25506B7B4()
{
  return 1;
}

uint64_t static PublishStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t PublishStatusInvocation.Parameters.key.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PublishStatusInvocation.Parameters.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_255069D20(v1, *(void *)(v0 + 32));
  return v1;
}

uint64_t PublishStatusInvocation.Parameters.options.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25506B818()
{
  uint64_t v1 = 0x64616F6C796170;
  if (*v0 != 1) {
    uint64_t v1 = 0x736E6F6974706FLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7955819;
  }
}

uint64_t sub_25506B86C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25506F138(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25506B894(uint64_t a1)
{
  unint64_t v2 = sub_25506BB54();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25506B8D0(uint64_t a1)
{
  unint64_t v2 = sub_25506BB54();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PublishStatusInvocation.Parameters.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276080);
  uint64_t v19 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = *v1;
  uint64_t v7 = *((void *)v1 + 1);
  uint64_t v8 = *((void *)v1 + 2);
  uint64_t v9 = *((void *)v1 + 3);
  uint64_t v16 = *((void *)v1 + 4);
  uint64_t v17 = v9;
  uint64_t v15 = *((void *)v1 + 5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25506BB54();
  uint64_t v10 = v3;
  sub_255078740();
  LOBYTE(v20) = v6;
  uint64_t v21 = v7;
  uint64_t v22 = v8;
  char v23 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276510);
  sub_255060A84(&qword_26B276050, &qword_26B276510);
  uint64_t v11 = v18;
  sub_255078660();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v5, v3);
  }
  uint64_t v13 = v19;
  uint64_t v14 = v15;
  uint64_t v20 = v17;
  uint64_t v21 = v16;
  char v23 = 1;
  sub_25506BBA8();
  sub_255078640();
  uint64_t v20 = v14;
  char v23 = 2;
  sub_25506BBFC();
  sub_255078660();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v5, v10);
}

unint64_t sub_25506BB54()
{
  unint64_t result = qword_26B2763A8;
  if (!qword_26B2763A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763A8);
  }
  return result;
}

unint64_t sub_25506BBA8()
{
  unint64_t result = qword_26B276010;
  if (!qword_26B276010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276010);
  }
  return result;
}

unint64_t sub_25506BBFC()
{
  unint64_t result = qword_26B276040;
  if (!qword_26B276040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276040);
  }
  return result;
}

uint64_t PublishStatusInvocation.Parameters.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B275FA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25506BB54();
  sub_255078730();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276510);
  char v21 = 0;
  sub_255060A84(&qword_26B275F78, &qword_26B276510);
  sub_255078600();
  int v20 = v17;
  uint64_t v9 = v19;
  unint64_t v16 = v18;
  char v21 = 1;
  sub_25506BF80();
  swift_bridgeObjectRetain();
  sub_2550785E0();
  char v21 = 2;
  unint64_t v14 = v18;
  uint64_t v15 = v17;
  sub_255069D20(v17, v18);
  sub_25506BFD4();
  sub_255078600();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v17;
  swift_bridgeObjectRetain();
  unint64_t v12 = v14;
  uint64_t v11 = v15;
  sub_255069D20(v15, v14);
  swift_bridgeObjectRetain();
  sub_255061B4C(v11, v12);
  swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v20;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_255061B4C(v11, v12);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25506BF80()
{
  unint64_t result = qword_26B275F38;
  if (!qword_26B275F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275F38);
  }
  return result;
}

unint64_t sub_25506BFD4()
{
  unint64_t result = qword_26B275F68;
  if (!qword_26B275F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275F68);
  }
  return result;
}

uint64_t sub_25506C028@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PublishStatusInvocation.Parameters.init(from:)(a1, a2);
}

uint64_t sub_25506C040(void *a1)
{
  return PublishStatusInvocation.Parameters.encode(to:)(a1);
}

uint64_t PublishStatusInvocation.Response.initialStatus.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *v1;
  uint64_t v4 = *((void *)v1 + 1);
  uint64_t v3 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  unint64_t v6 = *((void *)v1 + 4);
  uint64_t v7 = *((void *)v1 + 5);
  *(unsigned char *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_255069D20(v5, v6);
  return swift_bridgeObjectRetain();
}

uint64_t PublishStatusInvocation.Response.updates.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PublishStatusInvocation.Response(0);
  return sub_25506F3B8(v1 + *(int *)(v3 + 20), a1, &qword_26B276538);
}

uint64_t PublishStatusInvocation.Response.init(initialStatus:updates:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25506C76C(a1, a2, type metadata accessor for PublishStatusInvocation.Response, a3);
}

uint64_t sub_25506C118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25506C180()
{
  if (*v0) {
    return 0x73657461647075;
  }
  else {
    return 0x536C616974696E69;
  }
}

uint64_t sub_25506C1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25506F280(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25506C1F0(uint64_t a1)
{
  unint64_t v2 = sub_25506C2B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25506C22C(uint64_t a1)
{
  unint64_t v2 = sub_25506C2B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PublishStatusInvocation.Response.encode(to:)(void *a1)
{
  return sub_25506C8A0(a1, &qword_26B275FD8, (void (*)(void))sub_25506C2B8, (uint64_t)&type metadata for PublishStatusInvocation.Response.CodingKeys, (void (*)(void))type metadata accessor for PublishStatusInvocation.Response);
}

unint64_t sub_25506C2B8()
{
  unint64_t result = qword_26B2763C0;
  if (!qword_26B2763C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763C0);
  }
  return result;
}

uint64_t PublishStatusInvocation.Response.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276078);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  uint64_t v26 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PublishStatusInvocation.Response(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25506C2B8();
  sub_255078730();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v23 = v11;
  uint64_t v14 = (uint64_t)v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2763A0);
  char v33 = 0;
  sub_255060A84(&qword_26B276018, &qword_26B2763A0);
  uint64_t v15 = v25;
  sub_255078600();
  uint64_t v16 = v28;
  uint64_t v17 = v29;
  uint64_t v18 = v30;
  uint64_t v19 = v31;
  uint64_t v20 = v32;
  *uint64_t v13 = v27;
  *((void *)v13 + 1) = v16;
  *((void *)v13 + 2) = v17;
  v22[1] = v17;
  v22[2] = v19;
  v22[3] = v18;
  *((void *)v13 + 3) = v18;
  *((void *)v13 + 4) = v19;
  *((void *)v13 + 5) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  char v27 = 1;
  sub_255060A84(&qword_26B276060, &qword_26B276530);
  sub_2550785E0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v15);
  sub_25506C118(v14, (uint64_t)&v13[*(int *)(v23 + 20)]);
  sub_25506CE80((uint64_t)v13, v24, type metadata accessor for PublishStatusInvocation.Response);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25506A868((uint64_t)v13, type metadata accessor for PublishStatusInvocation.Response);
}

uint64_t sub_25506C66C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PublishStatusInvocation.Response.init(from:)(a1, a2);
}

uint64_t sub_25506C684(void *a1)
{
  return PublishStatusInvocation.Response.encode(to:)(a1);
}

id PublishStatusInvocation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t PublishStatusInvocation.__allocating_init(coder:)()
{
  id v1 = objc_allocWithZone(v0);
  return _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0();
}

uint64_t sub_25506C718(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  return _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0();
}

uint64_t sub_25506C744()
{
  return 1;
}

uint64_t static LocalStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t LocalStatusInvocation.Response.init(initialStatus:updates:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25506C76C(a1, a2, type metadata accessor for LocalStatusInvocation.Response, a3);
}

uint64_t sub_25506C76C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 40);
  *(unsigned char *)a4 = *(unsigned char *)a1;
  *(void *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = v6;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)(a1 + 24);
  *(void *)(a4 + 40) = v7;
  uint64_t v8 = a4 + *(int *)(a3(0) + 20);
  return sub_25506C118(a2, v8);
}

uint64_t sub_25506C7D8(uint64_t a1)
{
  unint64_t v2 = sub_25506CACC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25506C814(uint64_t a1)
{
  unint64_t v2 = sub_25506CACC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LocalStatusInvocation.Response.encode(to:)(void *a1)
{
  return sub_25506C8A0(a1, &qword_269E7FB40, (void (*)(void))sub_25506CACC, (uint64_t)&type metadata for LocalStatusInvocation.Response.CodingKeys, (void (*)(void))type metadata accessor for LocalStatusInvocation.Response);
}

uint64_t sub_25506C8A0(void *a1, uint64_t *a2, void (*a3)(void), uint64_t a4, void (*a5)(void))
{
  uint64_t v17 = a5;
  uint64_t v8 = v5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v18 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_255078740();
  uint64_t v13 = *(void *)(v8 + 8);
  uint64_t v14 = *(void *)(v8 + 16);
  uint64_t v15 = *(void *)(v8 + 40);
  char v19 = *(unsigned char *)v8;
  uint64_t v20 = v13;
  uint64_t v21 = v14;
  long long v22 = *(_OWORD *)(v8 + 24);
  uint64_t v23 = v15;
  char v24 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2763A0);
  sub_255060A84(&qword_26B275F40, &qword_26B2763A0);
  sub_255078660();
  if (!v6)
  {
    v17(0);
    char v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
    sub_255060A84(&qword_26B275F88, &qword_26B276530);
    sub_255078640();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v10);
}

unint64_t sub_25506CACC()
{
  unint64_t result = qword_269E7FB48;
  if (!qword_269E7FB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB48);
  }
  return result;
}

uint64_t LocalStatusInvocation.Response.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FB50);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  uint64_t v26 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for LocalStatusInvocation.Response(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25506CACC();
  sub_255078730();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v23 = v11;
  uint64_t v14 = (uint64_t)v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2763A0);
  char v33 = 0;
  sub_255060A84(&qword_26B276018, &qword_26B2763A0);
  uint64_t v15 = v25;
  sub_255078600();
  uint64_t v16 = v28;
  uint64_t v17 = v29;
  uint64_t v18 = v30;
  uint64_t v19 = v31;
  uint64_t v20 = v32;
  *uint64_t v13 = v27;
  *((void *)v13 + 1) = v16;
  *((void *)v13 + 2) = v17;
  v22[1] = v17;
  v22[2] = v19;
  v22[3] = v18;
  *((void *)v13 + 3) = v18;
  *((void *)v13 + 4) = v19;
  *((void *)v13 + 5) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  char v27 = 1;
  sub_255060A84(&qword_26B276060, &qword_26B276530);
  sub_2550785E0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v15);
  sub_25506C118(v14, (uint64_t)&v13[*(int *)(v23 + 20)]);
  sub_25506CE80((uint64_t)v13, v24, type metadata accessor for LocalStatusInvocation.Response);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_25506A868((uint64_t)v13, type metadata accessor for LocalStatusInvocation.Response);
}

uint64_t sub_25506CE80(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25506CEE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LocalStatusInvocation.Response.init(from:)(a1, a2);
}

uint64_t sub_25506CF00(void *a1)
{
  return LocalStatusInvocation.Response.encode(to:)(a1);
}

uint64_t sub_25506CF28()
{
  return 1;
}

uint64_t static SubscribeStatusInvocation.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfC_0()
{
  id v1 = objc_allocWithZone(v0);
  return _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfc_0();
}

id _s14LocalStatusKit07PublishB10InvocationCACycfc_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25506CFC0(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _s14LocalStatusKit07PublishB10InvocationCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_25506D040()
{
  unint64_t result = qword_26B275E90[0];
  if (!qword_26B275E90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B275E90);
  }
  return result;
}

unint64_t sub_25506D098()
{
  unint64_t result = qword_26B276020;
  if (!qword_26B276020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B276020);
  }
  return result;
}

uint64_t sub_25506D0EC()
{
  return sub_255069CD8(&qword_26B275FF0, (void (*)(uint64_t))type metadata accessor for PublishStatusInvocation.Response);
}

uint64_t sub_25506D134()
{
  return sub_255069CD8(&qword_26B2763D8, (void (*)(uint64_t))type metadata accessor for PublishStatusInvocation.Response);
}

uint64_t sub_25506D17C()
{
  return sub_255060A84(&qword_26B275F78, &qword_26B276510);
}

uint64_t sub_25506D1B8()
{
  return sub_255060A84(&qword_26B276050, &qword_26B276510);
}

uint64_t sub_25506D1F4()
{
  return sub_255069CD8(&qword_269E7FB58, (void (*)(uint64_t))type metadata accessor for LocalStatusInvocation.Response);
}

uint64_t sub_25506D23C()
{
  return sub_255069CD8(&qword_269E7FB60, (void (*)(uint64_t))type metadata accessor for LocalStatusInvocation.Response);
}

uint64_t sub_25506D284()
{
  return sub_255060A84(&qword_26B275CB0, &qword_26B275E88);
}

uint64_t sub_25506D2C0()
{
  return sub_255060A84(&qword_26B275F18, &qword_26B275E88);
}

uint64_t type metadata accessor for LSKLocalStatusClient()
{
  return self;
}

uint64_t method lookup function for LSKLocalStatusClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LSKLocalStatusClient);
}

uint64_t dispatch thunk of LSKLocalStatusClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_25506D34C()
{
  return sub_25506E370();
}

uint64_t sub_25506D358()
{
  return type metadata accessor for PublishStatusInvocation(0);
}

uint64_t initializeBufferWithCopyOfBuffer for PublishStatusInvocation.Parameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PublishStatusInvocation.Parameters(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >> 60 != 15) {
    sub_255061B60(*(void *)(a1 + 24), v2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = (_OWORD *)(a2 + 24);
  unint64_t v6 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v5;
  }
  else
  {
    uint64_t v7 = *(void *)v5;
    sub_255061AF4(v7, v6);
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v6;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_255061AF4(*v4, *(void *)(a2 + 32));
      uint64_t v8 = *(void *)(a1 + 24);
      unint64_t v9 = *(void *)(a1 + 32);
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v5;
      sub_255061B60(v8, v9);
      goto LABEL_8;
    }
    sub_25506D564(a1 + 24);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_255061AF4(*v4, *(void *)(a2 + 32));
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
LABEL_8:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25506D564(uint64_t a1)
{
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

uint64_t assignWithTake for PublishStatusInvocation.Parameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = (void *)(a2 + 24);
  unint64_t v6 = *(void *)(a1 + 32);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 32);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 24);
      *(void *)(a1 + 24) = *v5;
      *(void *)(a1 + 32) = v7;
      sub_255061B60(v8, v6);
      goto LABEL_6;
    }
    sub_25506D564(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v5;
LABEL_6:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Parameters(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PublishStatusInvocation.Parameters(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Parameters()
{
  return &type metadata for PublishStatusInvocation.Parameters;
}

uint64_t getEnumTagSinglePayload for PublishStatusInvocation.Response(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for PublishStatusInvocation.Response(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void sub_25506D760()
{
  if (!qword_26B276540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B276530);
    unint64_t v0 = sub_255078490();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B276540);
    }
  }
}

uint64_t sub_25506D7BC()
{
  return sub_25506E370();
}

uint64_t sub_25506D7C8()
{
  return type metadata accessor for LocalStatusInvocation(0);
}

unsigned char *_s14LocalStatusKit23PublishStatusInvocationC8ResponseVwCP_0(unsigned char *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (unsigned char *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *((void *)v4 + 1) = a2[1];
    *((void *)v4 + 2) = v7;
    uint64_t v8 = a2 + 3;
    unint64_t v9 = a2[4];
    swift_bridgeObjectRetain();
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)(v4 + 24) = *v8;
    }
    else
    {
      uint64_t v11 = *(void *)v8;
      sub_255061AF4(v11, v9);
      *((void *)v4 + 3) = v11;
      *((void *)v4 + 4) = v9;
    }
    *((void *)v4 + 5) = a2[5];
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = &v4[v12];
    uint64_t v14 = (char *)a2 + v12;
    swift_bridgeObjectRetain();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return v4;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 >> 60 != 15) {
    sub_255061B60(*(void *)(a1 + 24), v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = (_OWORD *)(a2 + 24);
  unint64_t v8 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *v7;
  }
  else
  {
    uint64_t v9 = *(void *)v7;
    sub_255061AF4(v9, v8);
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v8;
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  swift_bridgeObjectRetain();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a2 + 24);
  unint64_t v7 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) >> 60 == 15)
  {
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *v6;
      sub_255061AF4(*v6, *(void *)(a2 + 32));
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = v7;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v7 >> 60 == 15)
  {
    sub_25506D564(a1 + 24);
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v6;
    goto LABEL_8;
  }
  uint64_t v9 = *v6;
  sub_255061AF4(*v6, *(void *)(a2 + 32));
  uint64_t v10 = *(void *)(a1 + 24);
  unint64_t v11 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v7;
  sub_255061B60(v10, v11);
LABEL_8:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_13;
  }
  if (v19)
  {
LABEL_13:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *_s14LocalStatusKit23PublishStatusInvocationC8ResponseVwtk_0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t _s14LocalStatusKit23PublishStatusInvocationC8ResponseVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  unint64_t v7 = (_OWORD *)(a2 + 24);
  unint64_t v8 = *(void *)(a1 + 32);
  if (v8 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v9 = *(void *)(a2 + 32);
  if (v9 >> 60 == 15)
  {
    sub_25506D564(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *v7;
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)v7;
  *(void *)(a1 + 32) = v9;
  sub_255061B60(v10, v8);
LABEL_6:
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276530);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_11;
  }
  if (v18)
  {
LABEL_11:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalStatusInvocation.Response(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25506E150);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LocalStatusInvocation.Response(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25506E21C);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B276538);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25506E2CC()
{
  sub_25506D760();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_25506E364()
{
  return sub_25506E370();
}

uint64_t sub_25506E370()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25506E3AC()
{
  return type metadata accessor for SubscribeStatusInvocation(0);
}

ValueMetadata *type metadata accessor for LocalStatusInvocation.Response.CodingKeys()
{
  return &type metadata for LocalStatusInvocation.Response.CodingKeys;
}

unsigned char *_s14LocalStatusKit21LocalStatusInvocationC8ResponseV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x25506E498);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Response.CodingKeys()
{
  return &type metadata for PublishStatusInvocation.Response.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PublishStatusInvocation.Parameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x25506E59CLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PublishStatusInvocation.Parameters.CodingKeys()
{
  return &type metadata for PublishStatusInvocation.Parameters.CodingKeys;
}

unint64_t sub_25506E5D8()
{
  unint64_t result = qword_269E7FB78;
  if (!qword_269E7FB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB78);
  }
  return result;
}

unint64_t sub_25506E630()
{
  unint64_t result = qword_269E7FB80;
  if (!qword_269E7FB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB80);
  }
  return result;
}

unint64_t sub_25506E688()
{
  unint64_t result = qword_269E7FB88;
  if (!qword_269E7FB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB88);
  }
  return result;
}

unint64_t sub_25506E6E0()
{
  unint64_t result = qword_269E7FB90;
  if (!qword_269E7FB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB90);
  }
  return result;
}

unint64_t sub_25506E738()
{
  unint64_t result = qword_269E7FB98;
  if (!qword_269E7FB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FB98);
  }
  return result;
}

unint64_t sub_25506E790()
{
  unint64_t result = qword_26B2763D0;
  if (!qword_26B2763D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763D0);
  }
  return result;
}

unint64_t sub_25506E7E8()
{
  unint64_t result = qword_26B2763C8;
  if (!qword_26B2763C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763C8);
  }
  return result;
}

unint64_t sub_25506E840()
{
  unint64_t result = qword_26B2763B8;
  if (!qword_26B2763B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763B8);
  }
  return result;
}

unint64_t sub_25506E898()
{
  unint64_t result = qword_26B2763B0;
  if (!qword_26B2763B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2763B0);
  }
  return result;
}

uint64_t sub_25506E8EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBA0);
  sub_25506F4D4();
  sub_2550781B0();
  sub_255078520();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  uint64_t v2 = *v0;
  unint64_t v3 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2550609E8(8, v2, v3, v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x25A285BD0](v5, v7, v9, v11);
  sub_255078340();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  sub_255078570();
  sub_255078340();
  return 0;
}

uint64_t sub_25506EAE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25506EBB4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25506F478((uint64_t)v12, *a3);
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
      sub_25506F478((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25506EBB4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2550784B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25506ED70(a5, a6);
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
  uint64_t v8 = sub_255078560();
  if (!v8)
  {
    sub_255078590();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2550785A0();
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

uint64_t sub_25506ED70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25506EE08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25506EFE8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25506EFE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25506EE08(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25506EF80(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_255078530();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_255078590();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_255078350();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2550785A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_255078590();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25506EF80(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25506EFE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBA8);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_2550785A0();
  __break(1u);
  return result;
}

uint64_t sub_25506F138(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_25506F280(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x536C616974696E69 && a2 == 0xED00007375746174;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73657461647075 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25506F398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25506B3D8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_25506F3B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25506F41C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25506F478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25506F4D4()
{
  unint64_t result = qword_269E7FBB0;
  if (!qword_269E7FBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FBB0);
  }
  return result;
}

uint64_t LSKPublishedStatusSequence.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a2;
  *((void *)v14 + 3) = a3;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v14[v13], a1, a4);
  *a6 = sub_25506F83C;
  a6[1] = v14;
  return result;
}

void *sub_25506F660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  uint64_t v15 = swift_allocBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a4);
  sub_255078400();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  result[6] = v15;
  *a6 = &unk_269E7FBD8;
  a6[1] = result;
  return result;
}

uint64_t sub_25506F7B4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

void *sub_25506F83C@<X0>(void *a1@<X8>)
{
  return sub_25506F660((uint64_t)v1+ ((*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[4] - 8) + 80)), v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t LSKPublishedStatusSequence.AsyncIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25505B984, 0, 0);
}

uint64_t sub_25506F8A0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_25505BBF8;
  return MEMORY[0x270FA2498](sub_25505B984, 0, 0);
}

uint64_t LSKPublishedStatusSequence.makeAsyncIterator()()
{
  return (*v0)();
}

uint64_t sub_25506F974()
{
  return swift_getWitnessTable();
}

uint64_t sub_25506F990()
{
  LSKPublishedStatusSequence.makeAsyncIterator()();
  return swift_release();
}

uint64_t type metadata accessor for LSKPublishedStatusSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for LSKPublishedStatusSequence.AsyncIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25506F9EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25506FA24(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_25505BBF8;
  return sub_25505B63C(a1, v8, v4, v5, v6, v7);
}

uint64_t LSKTargetDeviceFlags.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t LSKTargetDeviceFlags.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*LSKTargetDeviceFlags.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t LSKTargetDeviceFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static LSKTargetDeviceFlags.audioAccessory.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static LSKTargetDeviceFlags.iphone.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static LSKTargetDeviceFlags.ipad.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static LSKTargetDeviceFlags.mac.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static LSKTargetDeviceFlags.tv.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static LSKTargetDeviceFlags.visionDevice.getter(void *a1@<X8>)
{
  *a1 = 64;
}

void static LSKTargetDeviceFlags.watch.getter(void *a1@<X8>)
{
  *a1 = 128;
}

uint64_t sub_25506FB78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
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

void static LSKTargetDeviceFlags.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static LSKTargetDeviceFlags.all.getter(uint64_t *a1@<X8>)
{
  uint64_t v1 = unk_27043B098;
  if ((unk_27043B098 & ~qword_27043B090) == 0) {
    uint64_t v1 = 0;
  }
  uint64_t v2 = v1 | qword_27043B090;
  uint64_t v3 = qword_27043B0A0;
  if ((qword_27043B0A0 & ~v2) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | v2;
  if ((unk_27043B0A8 & ~v4) != 0) {
    uint64_t v5 = unk_27043B0A8;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v4;
  uint64_t v7 = qword_27043B0B0;
  if ((qword_27043B0B0 & ~v6) == 0) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | v6;
  if ((unk_27043B0B8 & ~v8) != 0) {
    uint64_t v9 = unk_27043B0B8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 | v8;
  uint64_t v11 = qword_27043B0C0;
  if ((qword_27043B0C0 & ~v10) == 0) {
    uint64_t v11 = 0;
  }
  *a1 = v11 | v10;
}

uint64_t LSKTargetDeviceFlags.idsDeviceTypes.getter()
{
  uint64_t v1 = *v0;
  uint64_t v4 = MEMORY[0x263F8EE88];
  if ((v1 & 0x10) == 0)
  {
    if ((v1 & 0x40) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    sub_25506FF0C(&v3, 9);
    if ((v1 & 0x20) == 0) {
      return v4;
    }
    goto LABEL_4;
  }
  sub_25506FF0C(&v3, 1);
  if ((v1 & 0x40) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v1 & 0x20) != 0) {
LABEL_4:
  }
    sub_25506FF0C(&v3, 5);
  return v4;
}

void *sub_25506FCC0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25506FCCC()
{
  return sub_2550783C0();
}

uint64_t sub_25506FD2C()
{
  return sub_2550783A0();
}

void sub_25506FD7C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25506FD84@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_25506FD98@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_25506FDAC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_25506FDC0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25506FDF0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_25506FE1C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_25506FE40(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25506FE54(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25506FE68(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_25506FE7C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_25506FE90(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_25506FEA4(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_25506FEB8(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25506FECC()
{
  return *v0 == 0;
}

uint64_t sub_25506FEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_25506FEF4(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_25506FF0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_255078700();
  sub_255078710();
  uint64_t v6 = sub_255078720();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_255070448(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

unint64_t sub_255070030()
{
  unint64_t result = qword_269E7FBE0;
  if (!qword_269E7FBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FBE0);
  }
  return result;
}

unint64_t sub_255070088()
{
  unint64_t result = qword_269E7FBE8;
  if (!qword_269E7FBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FBE8);
  }
  return result;
}

unint64_t sub_2550700E0()
{
  unint64_t result = qword_26B275D60;
  if (!qword_26B275D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275D60);
  }
  return result;
}

unint64_t sub_255070138()
{
  unint64_t result = qword_26B275D68;
  if (!qword_26B275D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B275D68);
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKTargetDeviceFlags()
{
  return &type metadata for LSKTargetDeviceFlags;
}

uint64_t sub_25507019C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B275D78);
  uint64_t result = sub_255078500();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_255078700();
      sub_255078710();
      uint64_t result = sub_255078720();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_255070448(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25507019C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_255070598();
      goto LABEL_14;
    }
    sub_255070730();
  }
  uint64_t v8 = *v3;
  sub_255078700();
  sub_255078710();
  uint64_t result = sub_255078720();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for IDSDeviceType();
      uint64_t result = sub_2550786B0();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_255070598()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B275D78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550784F0();
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
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
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

uint64_t sub_255070730()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B275D78);
  uint64_t result = sub_255078500();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_255078700();
    sub_255078710();
    uint64_t result = sub_255078720();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2550709B0()
{
  uint64_t v1 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255073394(v0, (uint64_t)v3, type metadata accessor for LSKDestinationDevice.Delivery);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v5 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 3, v4);
  uint64_t result = 0;
  switch(v5)
  {
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      return result;
    default:
      swift_bridgeObjectRelease();
      uint64_t v7 = sub_2550781C0();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
      uint64_t result = 1;
      break;
  }
  return result;
}

unint64_t LSKDestinationDevice.description.getter()
{
  uint64_t v1 = v0;
  sub_255078520();
  type metadata accessor for LSKDestinationDevice(0);
  unint64_t v2 = LSKDestinationDevice.Delivery.description.getter();
  swift_bridgeObjectRelease();
  unint64_t v14 = v2;
  sub_255078340();
  uint64_t v3 = *v1;
  unint64_t v4 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2550609E8(8, v3, v4, v5);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  MEMORY[0x25A285BD0](v6, v8, v10, v12);
  sub_255078340();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t type metadata accessor for LSKDestinationDevice(uint64_t a1)
{
  return sub_25506B16C(a1, qword_26B276480);
}

uint64_t sub_255070C9C()
{
  uint64_t result = 0x676E69646E6570;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x65726576696C6564;
      break;
    case 2:
      uint64_t result = 0x64656C696166;
      break;
    case 3:
      uint64_t result = 0x46676E697373696DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_255070D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255075274(a1, a2);
  *a3 = result;
  return result;
}

void sub_255070D60(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_255070D6C(uint64_t a1)
{
  unint64_t v2 = sub_2550730F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255070DA8(uint64_t a1)
{
  unint64_t v2 = sub_2550730F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255070DE4(uint64_t a1)
{
  unint64_t v2 = sub_2550731EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255070E20(uint64_t a1)
{
  unint64_t v2 = sub_2550731EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_255070E5C()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_255070E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255075458(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_255070EC4(uint64_t a1)
{
  unint64_t v2 = sub_255073198();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255070F00(uint64_t a1)
{
  unint64_t v2 = sub_255073198();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255070F3C(uint64_t a1)
{
  unint64_t v2 = sub_255073144();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255070F78(uint64_t a1)
{
  unint64_t v2 = sub_255073144();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255070FB4(uint64_t a1)
{
  unint64_t v2 = sub_255073240();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255070FF0(uint64_t a1)
{
  unint64_t v2 = sub_255073240();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LSKDestinationDevice.Delivery.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBF0);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  MEMORY[0x270FA5388](v2);
  long long v35 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBF8);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_2550781C0();
  uint64_t v43 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  long long v42 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC00);
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC08);
  uint64_t v32 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v13 - 8);
  int64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC10);
  uint64_t v45 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550730F0();
  sub_255078740();
  sub_255073394(v46, (uint64_t)v15, type metadata accessor for LSKDestinationDevice.Delivery);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v15, 3, v19))
  {
    case 1u:
      char v47 = 0;
      sub_255073240();
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v10);
      break;
    case 2u:
      char v48 = 1;
      sub_2550731EC();
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v34);
      break;
    case 3u:
      char v52 = 3;
      sub_255073144();
      uint64_t v29 = v35;
      sub_255078630();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v37);
      break;
    default:
      unint64_t v20 = &v15[*(int *)(v19 + 48)];
      uint64_t v22 = *(void *)v20;
      uint64_t v21 = *((void *)v20 + 1);
      uint64_t v37 = v22;
      uint64_t v46 = v21;
      BOOL v24 = v42;
      uint64_t v23 = v43;
      uint64_t v25 = v39;
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v15, v39);
      char v51 = 2;
      sub_255073198();
      uint64_t v26 = v38;
      sub_255078630();
      char v50 = 0;
      sub_2550732F8(&qword_269E7FC30, MEMORY[0x263F07490]);
      uint64_t v27 = v41;
      uint64_t v28 = v44;
      sub_255078660();
      if (v28)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v27);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v25);
      }
      else
      {
        char v49 = 1;
        sub_255078650();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v27);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v25);
      }
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v18, v16);
}

uint64_t LSKDestinationDevice.Delivery.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC48);
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  MEMORY[0x270FA5388](v3);
  char v60 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC50);
  uint64_t v62 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v64 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC58);
  uint64_t v55 = *(void *)(v6 - 8);
  uint64_t v56 = v6;
  MEMORY[0x270FA5388](v6);
  char v59 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC60);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v53 = v8;
  uint64_t v54 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC68);
  uint64_t v63 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v50 - v19;
  uint64_t v21 = a1[3];
  uint64_t v66 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_2550730F0();
  uint64_t v22 = (uint64_t)v67;
  sub_255078730();
  if (v22) {
    goto LABEL_9;
  }
  char v51 = v18;
  char v52 = v11;
  BOOL v24 = v64;
  uint64_t v23 = v65;
  uint64_t v67 = v20;
  uint64_t v25 = sub_255078610();
  if (*(void *)(v25 + 16) != 1)
  {
    uint64_t v29 = v12;
    uint64_t v30 = sub_255078550();
    swift_allocError();
    uint64_t v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F938);
    *uint64_t v32 = v15;
    sub_2550785D0();
    sub_255078540();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v29);
LABEL_9:
    uint64_t v38 = (uint64_t)v66;
    return __swift_destroy_boxed_opaque_existential_1(v38);
  }
  switch(*(unsigned char *)(v25 + 32))
  {
    case 1:
      char v69 = 1;
      sub_2550731EC();
      uint64_t v33 = v59;
      sub_2550785C0();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v56);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v12);
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
      uint64_t v28 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v67, 2, 3, v34);
      break;
    case 2:
      char v72 = 2;
      sub_255073198();
      long long v35 = v24;
      sub_2550785C0();
      char v60 = (char *)v12;
      sub_2550781C0();
      char v71 = 0;
      sub_2550732F8(&qword_269E7FC70, MEMORY[0x263F07490]);
      uint64_t v36 = (uint64_t)v51;
      sub_255078600();
      char v70 = 1;
      uint64_t v42 = sub_2550785F0();
      uint64_t v43 = v63;
      uint64_t v44 = v42;
      char v59 = v45;
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
      char v47 = v35;
      char v48 = (uint64_t *)(v36 + *(int *)(v46 + 48));
      (*(void (**)(char *, uint64_t))(v62 + 8))(v47, v23);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v43 + 8))(v14, v60);
      char v49 = v59;
      *char v48 = v44;
      v48[1] = (uint64_t)v49;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v36, 0, 3, v46);
      uint64_t v28 = (uint64_t)v67;
      sub_255073294(v36, (uint64_t)v67);
      break;
    case 3:
      char v73 = 3;
      sub_255073144();
      uint64_t v37 = v60;
      sub_2550785C0();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v58);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v12);
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
      uint64_t v28 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v67, 3, 3, v40);
      break;
    default:
      char v68 = 0;
      sub_255073240();
      uint64_t v26 = v52;
      sub_2550785C0();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v26, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v12);
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
      uint64_t v28 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v67, 1, 3, v27);
      break;
  }
  uint64_t v41 = (uint64_t)v66;
  sub_255073294(v28, v61);
  uint64_t v38 = v41;
  return __swift_destroy_boxed_opaque_existential_1(v38);
}

uint64_t sub_25507205C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LSKDestinationDevice.Delivery.init(from:)(a1, a2);
}

uint64_t sub_255072074(void *a1)
{
  return LSKDestinationDevice.Delivery.encode(to:)(a1);
}

uint64_t LSKDestinationDevice.idsIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.model.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKDestinationDevice.delivery.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for LSKDestinationDevice(0);
  return sub_255073394(v1 + *(int *)(v3 + 28), a1, type metadata accessor for LSKDestinationDevice.Delivery);
}

uint64_t LSKDestinationDevice.init(idsIdentifier:name:model:delivery:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  uint64_t v9 = (uint64_t)a8 + *(int *)(type metadata accessor for LSKDestinationDevice(0) + 28);
  return sub_255073294(a7, v9);
}

uint64_t sub_2550721C4()
{
  uint64_t result = 0x746E656449736469;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 0x6C65646F6DLL;
      break;
    case 3:
      uint64_t result = 0x79726576696C6564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_255072254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255075544(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25507227C(uint64_t a1)
{
  unint64_t v2 = sub_255073340();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550722B8(uint64_t a1)
{
  unint64_t v2 = sub_255073340();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LSKDestinationDevice.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC78);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255073340();
  sub_255078740();
  v8[15] = 0;
  sub_255078650();
  if (!v1)
  {
    v8[14] = 1;
    sub_255078650();
    v8[13] = 2;
    sub_255078650();
    type metadata accessor for LSKDestinationDevice(0);
    v8[12] = 3;
    type metadata accessor for LSKDestinationDevice.Delivery(0);
    sub_2550732F8(&qword_269E7FC88, (void (*)(uint64_t))type metadata accessor for LSKDestinationDevice.Delivery);
    sub_255078660();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t LSKDestinationDevice.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FC90);
  uint64_t v24 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for LSKDestinationDevice(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255073340();
  uint64_t v26 = v8;
  uint64_t v12 = v27;
  sub_255078730();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v13 = (uint64_t)a1;
  uint64_t v27 = v3;
  uint64_t v14 = (uint64_t)v5;
  uint64_t v16 = v24;
  uint64_t v15 = v25;
  char v31 = 0;
  *uint64_t v11 = sub_2550785F0();
  v11[1] = v17;
  char v30 = 1;
  void v11[2] = sub_2550785F0();
  v11[3] = v18;
  char v29 = 2;
  uint64_t v19 = sub_2550785F0();
  uint64_t v22 = 0;
  v11[4] = v19;
  v11[5] = v20;
  char v28 = 3;
  sub_2550732F8(&qword_269E7FC98, (void (*)(uint64_t))type metadata accessor for LSKDestinationDevice.Delivery);
  sub_255078600();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v26, v15);
  sub_255073294(v14, (uint64_t)v11 + *(int *)(v9 + 28));
  sub_255073394((uint64_t)v11, v23, type metadata accessor for LSKDestinationDevice);
  __swift_destroy_boxed_opaque_existential_1(v13);
  return sub_255061C1C((uint64_t)v11, type metadata accessor for LSKDestinationDevice);
}

uint64_t sub_2550728C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LSKDestinationDevice.init(from:)(a1, a2);
}

uint64_t sub_2550728D8(void *a1)
{
  return LSKDestinationDevice.encode(to:)(a1);
}

unint64_t LSKDestinationDevice.Delivery.description.getter()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000010;
  uint64_t v3 = sub_2550781C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_255073394(v1, (uint64_t)v9, type metadata accessor for LSKDestinationDevice.Delivery);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  switch((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 3, v10))
  {
    case 1u:
      unint64_t v2 = 0x676E69646E6550;
      break;
    case 2u:
      unint64_t v2 = 0x65726576696C6544;
      break;
    case 3u:
      return v2;
    default:
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32))(v6, v9, v3);
      uint64_t v13 = 0;
      unint64_t v14 = 0xE000000000000000;
      sub_255078520();
      swift_bridgeObjectRelease();
      uint64_t v13 = 0x5B64656C696146;
      unint64_t v14 = 0xE700000000000000;
      sub_255078340();
      swift_bridgeObjectRelease();
      sub_255078340();
      v12[15] = 4;
      sub_25506F4D4();
      sub_2550781B0();
      sub_255078340();
      swift_bridgeObjectRelease();
      sub_255078340();
      unint64_t v2 = v13;
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
      break;
  }
  return v2;
}

uint64_t _s14LocalStatusKit20LSKDestinationDeviceV8DeliveryO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2550781C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F898);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_255073394(a1, (uint64_t)v14, type metadata accessor for LSKDestinationDevice.Delivery);
  sub_255073394(a2, v15, type metadata accessor for LSKDestinationDevice.Delivery);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  switch(v17((uint64_t)v14, 3, v16))
  {
    case 1u:
      if (v17(v15, 3, v16) == 1) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 2u:
      if (v17(v15, 3, v16) != 2) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 3u:
      if (v17(v15, 3, v16) == 3) {
        goto LABEL_9;
      }
      goto LABEL_10;
    default:
      uint64_t v31 = v5;
      sub_255073394((uint64_t)v14, (uint64_t)v10, type metadata accessor for LSKDestinationDevice.Delivery);
      uint64_t v18 = *(int *)(v16 + 48);
      uint64_t v19 = *(void *)&v10[v18 + 8];
      uint64_t v30 = *(void *)&v10[v18];
      if (v17(v15, 3, v16))
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v4);
LABEL_10:
        sub_25506F41C((uint64_t)v14, &qword_269E7F898);
        return 0;
      }
      uint64_t v21 = v19;
      uint64_t v22 = v15 + v18;
      uint64_t v23 = *(void *)(v15 + v18);
      uint64_t v24 = *(void *)(v22 + 8);
      uint64_t v25 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v7, v15, v4);
      char v26 = sub_255078190();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v25 + 8);
      v27(v10, v4);
      if (v26)
      {
        if (v30 == v23 && v21 == v24)
        {
          swift_bridgeObjectRelease_n();
          v27(v7, v4);
        }
        else
        {
          char v29 = sub_2550786A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v27(v7, v4);
          if ((v29 & 1) == 0) {
            goto LABEL_20;
          }
        }
LABEL_9:
        sub_255061C1C((uint64_t)v14, type metadata accessor for LSKDestinationDevice.Delivery);
        return 1;
      }
      v27(v7, v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_20:
      sub_255061C1C((uint64_t)v14, type metadata accessor for LSKDestinationDevice.Delivery);
      return 0;
  }
}

uint64_t _s14LocalStatusKit20LSKDestinationDeviceV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_2550786A0() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_2550786A0() & 1) == 0 || (a1[4] != a2[4] || a1[5] != a2[5]) && (sub_2550786A0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(type metadata accessor for LSKDestinationDevice(0) + 28);
  return _s14LocalStatusKit20LSKDestinationDeviceV8DeliveryO2eeoiySbAE_AEtFZ_0((uint64_t)a1 + v6, (uint64_t)a2 + v6);
}

uint64_t type metadata accessor for LSKDestinationDevice.Delivery(uint64_t a1)
{
  return sub_25506B16C(a1, (uint64_t *)&unk_26B276470);
}

unint64_t sub_2550730F0()
{
  unint64_t result = qword_269E7FC18;
  if (!qword_269E7FC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC18);
  }
  return result;
}

unint64_t sub_255073144()
{
  unint64_t result = qword_269E7FC20;
  if (!qword_269E7FC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC20);
  }
  return result;
}

unint64_t sub_255073198()
{
  unint64_t result = qword_269E7FC28;
  if (!qword_269E7FC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC28);
  }
  return result;
}

unint64_t sub_2550731EC()
{
  unint64_t result = qword_269E7FC38;
  if (!qword_269E7FC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC38);
  }
  return result;
}

unint64_t sub_255073240()
{
  unint64_t result = qword_269E7FC40;
  if (!qword_269E7FC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC40);
  }
  return result;
}

uint64_t sub_255073294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LSKDestinationDevice.Delivery(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2550732F8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_255073340()
{
  unint64_t result = qword_269E7FC80;
  if (!qword_269E7FC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FC80);
  }
  return result;
}

uint64_t sub_255073394(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for LSKDestinationDevice(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 3, v11))
    {
      uint64_t v13 = type metadata accessor for LSKDestinationDevice.Delivery(0);
      memcpy(v10, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_2550781C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v9, v15);
      uint64_t v16 = *(int *)(v11 + 48);
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v9[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
      swift_bridgeObjectRetain();
      v20(v10, 0, 3, v11);
    }
  }
  return a1;
}

uint64_t destroy for LSKDestinationDevice(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 3, v5);
  if (!result)
  {
    uint64_t v7 = sub_2550781C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v4, v7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for LSKDestinationDevice(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 3, v10))
  {
    uint64_t v12 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v9, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2550781C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v8, v13);
    uint64_t v14 = *(int *)(v10 + 48);
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
    swift_bridgeObjectRetain();
    v18(v9, 0, 3, v10);
  }
  return a1;
}

void *assignWithCopy for LSKDestinationDevice(void *a1, void *a2, uint64_t a3)
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
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 3, v9);
  int v13 = v11(v8, 3, v9);
  if (!v12)
  {
    if (!v13)
    {
      uint64_t v21 = sub_2550781C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v7, v8, v21);
      uint64_t v22 = *(int *)(v9 + 48);
      uint64_t v23 = &v7[v22];
      uint64_t v24 = &v8[v22];
      *(void *)uint64_t v23 = *(void *)v24;
      *((void *)v23 + 1) = *((void *)v24 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25506F41C((uint64_t)v7, &qword_269E7F860);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v19 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  uint64_t v14 = sub_2550781C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
  uint64_t v15 = *(int *)(v9 + 48);
  uint64_t v16 = &v7[v15];
  uint64_t v17 = &v8[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
  swift_bridgeObjectRetain();
  v18(v7, 0, 3, v9);
  return a1;
}

_OWORD *initializeWithTake for LSKDestinationDevice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 3, v8))
  {
    uint64_t v10 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_2550781C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v6, v7, v11);
    *(_OWORD *)&v6[*(int *)(v8 + 48)] = *(_OWORD *)&v7[*(int *)(v8 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 3, v8);
  }
  return a1;
}

void *assignWithTake for LSKDestinationDevice(void *a1, void *a2, uint64_t a3)
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
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 3, v12);
  int v16 = v14(v11, 3, v12);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v20 = sub_2550781C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v10, v11, v20);
      uint64_t v21 = *(int *)(v12 + 48);
      uint64_t v22 = &v10[v21];
      uint64_t v23 = &v11[v21];
      uint64_t v25 = *(void *)v23;
      uint64_t v24 = *((void *)v23 + 1);
      *(void *)uint64_t v22 = v25;
      *((void *)v22 + 1) = v24;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25506F41C((uint64_t)v10, &qword_269E7F860);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v18 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    memcpy(v10, v11, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  uint64_t v17 = sub_2550781C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v10, v11, v17);
  *(_OWORD *)&v10[*(int *)(v12 + 48)] = *(_OWORD *)&v11[*(int *)(v12 + 48)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 3, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKDestinationDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255073DC4);
}

uint64_t sub_255073DC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LSKDestinationDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255073E88);
}

uint64_t sub_255073E88(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for LSKDestinationDevice.Delivery(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_255073F30()
{
  uint64_t result = type metadata accessor for LSKDestinationDevice.Delivery(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LSKDestinationDevice.Delivery(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_2550781C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = *(int *)(v7 + 48);
      uint64_t v12 = (uint64_t *)((char *)a1 + v11);
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v14;
      int v15 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain();
      v15(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for LSKDestinationDevice.Delivery(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = sub_2550781C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *initializeWithCopy for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_2550781C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(v6 + 48);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v13(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithCopy for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = sub_2550781C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(a1, a2, v17);
      uint64_t v18 = *(int *)(v6 + 48);
      uint64_t v19 = &a1[v18];
      uint64_t v20 = &a2[v18];
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = *((void *)v20 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25506F41C((uint64_t)a1, &qword_269E7F860);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_2550781C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 48);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  int v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v15(a1, 0, 3, v6);
  return a1;
}

char *initializeWithTake for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_2550781C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

char *assignWithTake for LSKDestinationDevice.Delivery(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_2550781C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      uint64_t v14 = *(int *)(v6 + 48);
      int v15 = &a1[v14];
      int v16 = &a2[v14];
      uint64_t v18 = *(void *)v16;
      uint64_t v17 = *((void *)v16 + 1);
      *(void *)int v15 = v18;
      *((void *)v15 + 1) = v17;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_25506F41C((uint64_t)a1, &qword_269E7F860);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_2550781C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LSKDestinationDevice.Delivery(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25507487C);
}

uint64_t sub_25507487C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LSKDestinationDevice.Delivery(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255074900);
}

uint64_t sub_255074900(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_255074988(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t sub_2550749F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7F860);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

uint64_t sub_255074A68()
{
  uint64_t result = sub_2550781C0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.CodingKeys()
{
  return &type metadata for LSKDestinationDevice.CodingKeys;
}

unsigned char *_s14LocalStatusKit20LSKDestinationDeviceV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x255074BE0);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.CodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.CodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.PendingCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.PendingCodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.DeliveredCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.DeliveredCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for LSKDestinationDevice.Delivery.FailedCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x255074D04);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.FailedCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.FailedCodingKeys;
}

ValueMetadata *type metadata accessor for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys()
{
  return &type metadata for LSKDestinationDevice.Delivery.MissingFromIDSCodingKeys;
}

unint64_t sub_255074D50()
{
  unint64_t result = qword_269E7FCA0;
  if (!qword_269E7FCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCA0);
  }
  return result;
}

unint64_t sub_255074DA8()
{
  unint64_t result = qword_269E7FCA8;
  if (!qword_269E7FCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCA8);
  }
  return result;
}

unint64_t sub_255074E00()
{
  unint64_t result = qword_269E7FCB0;
  if (!qword_269E7FCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCB0);
  }
  return result;
}

unint64_t sub_255074E58()
{
  unint64_t result = qword_269E7FCB8;
  if (!qword_269E7FCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCB8);
  }
  return result;
}

unint64_t sub_255074EB0()
{
  unint64_t result = qword_269E7FCC0;
  if (!qword_269E7FCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCC0);
  }
  return result;
}

unint64_t sub_255074F08()
{
  unint64_t result = qword_269E7FCC8;
  if (!qword_269E7FCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCC8);
  }
  return result;
}

unint64_t sub_255074F60()
{
  unint64_t result = qword_269E7FCD0;
  if (!qword_269E7FCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCD0);
  }
  return result;
}

unint64_t sub_255074FB8()
{
  unint64_t result = qword_269E7FCD8;
  if (!qword_269E7FCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCD8);
  }
  return result;
}

unint64_t sub_255075010()
{
  unint64_t result = qword_269E7FCE0;
  if (!qword_269E7FCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCE0);
  }
  return result;
}

unint64_t sub_255075068()
{
  unint64_t result = qword_269E7FCE8;
  if (!qword_269E7FCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCE8);
  }
  return result;
}

unint64_t sub_2550750C0()
{
  unint64_t result = qword_269E7FCF0;
  if (!qword_269E7FCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCF0);
  }
  return result;
}

unint64_t sub_255075118()
{
  unint64_t result = qword_269E7FCF8;
  if (!qword_269E7FCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FCF8);
  }
  return result;
}

unint64_t sub_255075170()
{
  unint64_t result = qword_269E7FD00;
  if (!qword_269E7FD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FD00);
  }
  return result;
}

unint64_t sub_2550751C8()
{
  unint64_t result = qword_269E7FD08;
  if (!qword_269E7FD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E7FD08);
  }
  return result;
}

unint64_t sub_255075220()
{
  unint64_t result = qword_269E7FD10[0];
  if (!qword_269E7FD10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269E7FD10);
  }
  return result;
}

uint64_t sub_255075274(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x676E69646E6570 && a2 == 0xE700000000000000;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726576696C6564 && a2 == 0xE900000000000064 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x46676E697373696DLL && a2 == 0xEE005344496D6F72)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_255075458(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025507BFB0 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025507BFD0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_255075544(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656449736469 && a2 == 0xED00007265696669;
  if (v2 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79726576696C6564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25507570C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  char v5 = v3;
  uint64_t v43 = a3;
  uint64_t v8 = sub_2550781C0();
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v36 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *(void *)(a1 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int v15 = (char *)v28 - v14;
  sub_255078070();
  swift_allocObject();
  sub_255078060();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E7FBA0);
  sub_255078050();
  uint64_t result = swift_release();
  if (!v4)
  {
    uint64_t v18 = (char *)v3 + *(int *)(v16 + 60);
    char v19 = *v18;
    uint64_t v21 = *((void *)v18 + 1);
    uint64_t v20 = *((void *)v18 + 2);
    v37[0] = v19;
    uint64_t v38 = v21;
    uint64_t v39 = v20;
    sub_25505D53C((uint64_t)v40);
    v37[0] = v40[0];
    uint64_t v38 = v41;
    uint64_t v39 = v42;
    uint64_t v22 = *v3;
    uint64_t v23 = v3[1];
    uint64_t v31 = v5[2];
    uint64_t v32 = v22;
    uint64_t v24 = v5[4];
    uint64_t v29 = v5[3];
    uint64_t v30 = v24;
    v28[1] = a2;
    uint64_t v25 = v5[5];
    char v26 = (char *)v5 + *(int *)(v16 + 52);
    uint64_t v27 = (uint64_t)v36;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v36, v26, v35);
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v13, v15, a1);
    LSKLocalStatusObservation.init(key:deviceIDSIdentifier:deviceName:deviceModel:timestamp:value:)(v37, v32, v23, v31, v29, v30, v25, v27, v43, (uint64_t)v13, a1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t LSKLocalStatusObservation.deviceIDSIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.deviceModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LSKLocalStatusObservation.timestamp.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_2550781C0();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t LSKLocalStatusObservation.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

uint64_t LSKLocalStatusObservation.key.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2 + *(int *)(a1 + 60);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)(v3 + 16);
  *(unsigned char *)a2 = *(unsigned char *)v3;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t LSKLocalStatusObservation.init(key:deviceIDSIdentifier:deviceName:deviceModel:timestamp:value:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  char v16 = *a1;
  uint64_t v17 = *((void *)a1 + 1);
  uint64_t v18 = *((void *)a1 + 2);
  char v19 = (int *)type metadata accessor for LSKLocalStatusObservation();
  uint64_t v20 = (char *)a9 + v19[15];
  *uint64_t v20 = v16;
  *((void *)v20 + 1) = v17;
  *((void *)v20 + 2) = v18;
  *a9 = a2;
  a9[1] = a3;
  a9[2] = a4;
  a9[3] = a5;
  a9[4] = a6;
  a9[5] = a7;
  uint64_t v21 = (char *)a9 + v19[13];
  uint64_t v22 = sub_2550781C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v21, a8, v22);
  uint64_t v23 = (char *)a9 + v19[14];
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32);
  return v24(v23, a10, a11);
}

uint64_t type metadata accessor for LSKLocalStatusObservation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_255075C70(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025507BFF0 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614E656369766564 && a2 == 0xEA0000000000656DLL || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F4D656369766564 && a2 == 0xEB000000006C6564 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_2550786A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_2550786A0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_255075F08(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x614E656369766564;
      break;
    case 2:
      unint64_t result = 0x6F4D656369766564;
      break;
    case 3:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 4:
      unint64_t result = 0x65756C6176;
      break;
    case 5:
      unint64_t result = 7955819;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_255075FDC(char *a1, char *a2)
{
  return sub_25505EC2C(*a1, *a2);
}

uint64_t sub_255075FF4()
{
  return sub_25505EDA4();
}

uint64_t sub_255076004()
{
  return sub_25505EC3C();
}

uint64_t sub_255076014()
{
  return sub_255078720();
}

unint64_t sub_255076060()
{
  return sub_255075F08(*v0);
}

uint64_t sub_255076070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255075C70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2550760A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_255078038();
  *a1 = result;
  return result;
}

uint64_t sub_2550760D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_25507612C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t LSKLocalStatusObservation.encode(to:)(void *a1, void *a2)
{
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  v16[1] = a2[4];
  v16[2] = v4;
  v16[0] = v5;
  type metadata accessor for LSKLocalStatusObservation.CodingKeys();
  swift_getWitnessTable();
  uint64_t v6 = sub_255078670();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255078740();
  char v19 = 0;
  uint64_t v10 = v17;
  sub_255078650();
  if (!v10)
  {
    char v19 = 1;
    sub_255078650();
    char v19 = 2;
    sub_255078650();
    char v19 = 3;
    sub_2550781C0();
    sub_255076AF4(&qword_269E7FC30);
    sub_255078660();
    uint64_t v17 = a2;
    char v19 = 4;
    sub_255078660();
    uint64_t v11 = v18 + *((int *)v17 + 15);
    char v12 = *(unsigned char *)v11;
    uint64_t v14 = *(void *)(v11 + 8);
    uint64_t v13 = *(void *)(v11 + 16);
    char v19 = v12;
    uint64_t v20 = v14;
    uint64_t v21 = v13;
    char v22 = 5;
    type metadata accessor for LSKKey();
    swift_getWitnessTable();
    sub_255078660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t type metadata accessor for LSKLocalStatusObservation.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LSKLocalStatusObservation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v36 = a5;
  uint64_t v44 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v38 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_2550781C0();
  uint64_t v40 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v42 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LSKLocalStatusObservation.CodingKeys();
  swift_getWitnessTable();
  uint64_t v46 = sub_255078620();
  uint64_t v41 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  char v12 = (char *)&v34 - v11;
  uint64_t v39 = a3;
  uint64_t v37 = a4;
  uint64_t v13 = (int *)type metadata accessor for LSKLocalStatusObservation();
  uint64_t v35 = *((void *)v13 - 1);
  MEMORY[0x270FA5388](v13);
  int v15 = (uint64_t *)((char *)&v34 - v14);
  uint64_t v16 = a1[3];
  char v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  uint64_t v45 = v12;
  uint64_t v17 = v48;
  sub_255078730();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  }
  uint64_t v18 = v41;
  char v19 = v42;
  uint64_t v34 = v15;
  uint64_t v20 = v43;
  uint64_t v21 = v44;
  char v49 = 0;
  uint64_t v22 = sub_2550785F0();
  uint64_t v23 = v34;
  *uint64_t v34 = v22;
  v23[1] = v24;
  char v49 = 1;
  v23[2] = sub_2550785F0();
  v23[3] = v25;
  char v49 = 2;
  v23[4] = sub_2550785F0();
  v23[5] = v26;
  char v49 = 3;
  sub_255076AF4(&qword_269E7FC70);
  uint64_t v48 = 0;
  sub_255078600();
  (*(void (**)(char *, char *, uint64_t))(v40 + 32))((char *)v23 + v13[13], v19, v20);
  char v49 = 4;
  uint64_t v27 = v38;
  sub_255078600();
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v34 + v13[14], v27, a2);
  type metadata accessor for LSKKey();
  char v52 = 5;
  swift_getWitnessTable();
  sub_255078600();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v45, v46);
  uint64_t v28 = v50;
  uint64_t v29 = v51;
  uint64_t v31 = v34;
  uint64_t v30 = v35;
  uint64_t v32 = (char *)v34 + v13[15];
  *uint64_t v32 = v49;
  *((void *)v32 + 1) = v28;
  *((void *)v32 + 2) = v29;
  (*(void (**)(uint64_t, uint64_t *, int *))(v30 + 16))(v36, v31, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  return (*(uint64_t (**)(uint64_t *, int *))(v30 + 8))(v31, v13);
}

uint64_t sub_255076AF4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2550781C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_255076B38@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return LSKLocalStatusObservation.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_255076B5C(void *a1, void *a2)
{
  return LSKLocalStatusObservation.encode(to:)(a1, a2);
}

uint64_t static LSKLocalStatusObservation<>.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_2550786A0(), v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (char v8 = sub_2550786A0(), v6 = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_2550786A0(), char v6 = 0, (v9 & 1) != 0))
      {
        uint64_t v10 = type metadata accessor for LSKLocalStatusObservation();
        if (sub_255078190() & 1) != 0 && (sub_2550782E0())
        {
          uint64_t v11 = *(int *)(v10 + 60);
          uint64_t v13 = *(void *)((char *)a1 + v11 + 8);
          uint64_t v12 = *(void *)((char *)a1 + v11 + 16);
          v21[0] = *((unsigned char *)a1 + v11);
          uint64_t v22 = v13;
          uint64_t v23 = v12;
          uint64_t v14 = (char *)a2 + v11;
          LOBYTE(v12) = *v14;
          uint64_t v16 = *((void *)v14 + 1);
          uint64_t v15 = *((void *)v14 + 2);
          v18[0] = v12;
          uint64_t v19 = v16;
          uint64_t v20 = v15;
          char v6 = static LSKKey.== infix(_:_:)((uint64_t)v21, (uint64_t)v18);
        }
        else
        {
          char v6 = 0;
        }
      }
    }
  }
  return v6 & 1;
}

uint64_t sub_255076CE0(void *a1, void *a2)
{
  return static LSKLocalStatusObservation<>.== infix(_:_:)(a1, a2);
}

uint64_t LSKLocalStatusObservation.description.getter()
{
  uint64_t v1 = v0;
  sub_25506F4D4();
  sub_2550781B0();
  sub_255078520();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  uint64_t v2 = *v0;
  unint64_t v3 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2550609E8(8, v2, v3, v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x25A285BD0](v5, v7, v9, v11);
  sub_255078340();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  swift_bridgeObjectRetain();
  sub_255078340();
  swift_bridgeObjectRelease();
  sub_255078340();
  sub_255078690();
  sub_255078340();
  return 0;
}

uint64_t sub_255076EC4()
{
  uint64_t result = sub_2550781C0();
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

uint64_t *sub_255076FA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_2550781C0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v14 = *(void *)(v11 + 64) + 7;
  if ((v12 | v8) <= 7 && ((*(_DWORD *)(v11 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) == 0)
  {
    uint64_t v13 = (v9 + ((v8 + 48) & ~v8) + v12) & ~v12;
    BOOL v16 = ((v14 + v13) & 0xFFFFFFFFFFFFFFF8) != 0 && ((v14 + v13) & 0xFFFFFFFFFFFFFFF8) < 0xFFFFFFFFFFFFFFE8;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (v16)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    uint64_t v28 = (uint64_t *)(v17 + (((v12 | v8) & 0xF8 ^ 0x1F8) & ((v12 | v8) + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v33 = v6;
    uint64_t v18 = a2[1];
    *a1 = *a2;
    a1[1] = v18;
    uint64_t v19 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v19 = *v20;
    v19[1] = v20[1];
    uint64_t v21 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v21 = *v22;
    v21[1] = v22[1];
    uint64_t v23 = ((unint64_t)v21 + v8 + 16) & ~v8;
    uint64_t v24 = ((unint64_t)v22 + v8 + 16) & ~v8;
    uint64_t v34 = a1;
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    uint64_t v32 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(v23, v24, v33);
    uint64_t v26 = (v23 + v9 + v12) & ~v12;
    uint64_t v27 = (v24 + v9 + v12) & ~v12;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v26, v27, v32);
    uint64_t v28 = v34;
    unint64_t v29 = (v14 + v26) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v30 = (v14 + v27) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v29 = *(unsigned char *)v30;
    *(void *)(v29 + 8) = *(void *)(v30 + 8);
    *(void *)(v29 + 16) = *(void *)(v30 + 16);
    swift_bridgeObjectRetain();
  }
  return v28;
}

uint64_t sub_255077210(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_2550781C0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((v7
                                                                                            + *(void *)(v6 + 56)
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void *sub_255077314(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  v6[1] = v7[1];
  unint64_t v8 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v8 = *v9;
  v8[1] = v9[1];
  uint64_t v10 = sub_2550781C0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  uint64_t v13 = v11 + 16;
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = ((unint64_t)v8 + v14 + 16) & ~v14;
  uint64_t v16 = ((unint64_t)v9 + v14 + 16) & ~v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v15, v16, v10);
  uint64_t v17 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v18 = v17 + 16;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = *(void *)(v13 + 48) + v19;
  uint64_t v21 = (v20 + v15) & ~v19;
  uint64_t v22 = (v20 + v16) & ~v19;
  (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v21, v22);
  uint64_t v23 = *(void *)(v18 + 48) + 7;
  unint64_t v24 = (v23 + v21) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v23 + v22) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_255077498(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v8 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_2550781C0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = v11 + 24;
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = ((unint64_t)v8 + v13 + 16) & ~v13;
  uint64_t v15 = ((unint64_t)v9 + v13 + 16) & ~v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v14, v15, v10);
  uint64_t v16 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v17 = v16 + 24;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = *(void *)(v12 + 40) + v18;
  uint64_t v20 = (v19 + v14) & ~v18;
  uint64_t v21 = (v19 + v15) & ~v18;
  (*(void (**)(uint64_t, uint64_t))(v16 + 24))(v20, v21);
  uint64_t v22 = *(void *)(v17 + 40) + 7;
  unint64_t v23 = (v22 + v20) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v22 + v21) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v23 = *(unsigned char *)v24;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  *(void *)(v23 + 16) = *(void *)(v24 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_255077638(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  unint64_t v7 = (_OWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (_OWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  uint64_t v9 = sub_2550781C0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10 + 32;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = ((unint64_t)v7 + v12 + 16) & ~v12;
  uint64_t v14 = ((unint64_t)v8 + v12 + 16) & ~v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v13, v14, v9);
  uint64_t v15 = *(void *)(v11 + 32);
  uint64_t v16 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v17 = v16 + 32;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = v15 + v18;
  uint64_t v20 = (v19 + v13) & ~v18;
  uint64_t v21 = (v19 + v14) & ~v18;
  (*(void (**)(uint64_t, uint64_t))(v16 + 32))(v20, v21);
  uint64_t v22 = *(void *)(v17 + 32) + 7;
  unint64_t v23 = (v22 + v20) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (v22 + v21) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = *(void *)(v24 + 16);
  *(_OWORD *)unint64_t v23 = *(_OWORD *)v24;
  *(void *)(v23 + 16) = v25;
  return a1;
}

void *sub_255077770(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  unint64_t v7 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2550781C0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v12 + 40;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((unint64_t)v9 + v14 + 16) & ~v14;
  uint64_t v16 = ((unint64_t)v10 + v14 + 16) & ~v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v15, v16, v11);
  uint64_t v17 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v18 = v17 + 40;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = *(void *)(v13 + 24) + v19;
  uint64_t v21 = (v20 + v15) & ~v19;
  uint64_t v22 = (v20 + v16) & ~v19;
  (*(void (**)(uint64_t, uint64_t))(v17 + 40))(v21, v22);
  uint64_t v23 = *(void *)(v18 + 24) + 7;
  unint64_t v24 = (v23 + v21) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v23 + v22) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v24 = *(unsigned char *)v25;
  *(void *)(v24 + 8) = *(void *)(v25 + 8);
  *(void *)(v24 + 16) = *(void *)(v25 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2550778E8(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_2550781C0() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  if (v7 <= v9) {
    unsigned int v13 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v6 + 84);
  }
  if (v13 <= 0x7FFFFFFF) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  else {
    unsigned int v14 = v13;
  }
  if (!a2) {
    return 0;
  }
  if (v14 < a2)
  {
    unint64_t v15 = ((*(void *)(v8 + 64) + ((v11 + ((v10 + 48) & ~v10) + v12) & ~v12) + 7) & 0xFFFFFFFFFFFFFFF8) + 24;
    if ((v15 & 0xFFFFFFF8) != 0) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = a2 - v14 + 1;
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
        int v19 = *((unsigned __int8 *)a1 + v15);
        if (!*((unsigned char *)a1 + v15)) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v19 = *(unsigned __int16 *)((char *)a1 + v15);
        if (*(_WORD *)((char *)a1 + v15)) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x255077B54);
      case 4:
        int v19 = *(int *)((char *)a1 + v15);
        if (!v19) {
          break;
        }
LABEL_25:
        int v21 = v19 - 1;
        if ((v15 & 0xFFFFFFF8) != 0)
        {
          int v21 = 0;
          int v22 = *a1;
        }
        else
        {
          int v22 = 0;
        }
        return v14 + (v22 | v21) + 1;
      default:
        break;
    }
  }
  if ((v13 & 0x80000000) != 0)
  {
    unint64_t v24 = ((((((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v10 + 16) & ~v10;
    if (v7 == v14)
    {
      unint64_t v25 = *(uint64_t (**)(unint64_t))(v6 + 48);
      return v25(v24);
    }
    else
    {
      unint64_t v26 = (v24 + v11 + v12) & ~v12;
      uint64_t v27 = *(uint64_t (**)(unint64_t, uint64_t))(v8 + 48);
      return v27(v26, v9);
    }
  }
  else
  {
    unint64_t v23 = *((void *)a1 + 1);
    if (v23 >= 0xFFFFFFFF) {
      LODWORD(v23) = -1;
    }
    return (v23 + 1);
  }
}

void sub_255077B68(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(sub_2550781C0() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  if (v9 <= v11) {
    unsigned int v15 = *(_DWORD *)(v10 + 84);
  }
  else {
    unsigned int v15 = *(_DWORD *)(v8 + 84);
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  size_t v17 = ((*(void *)(v10 + 64) + ((v13 + ((v12 + 48) & ~v12) + v14) & ~v14) + 7) & 0xFFFFFFFFFFFFFFF8) + 24;
  if (v16 >= a3)
  {
    int v20 = 0;
    int v21 = a2 - v16;
    if (a2 <= v16)
    {
LABEL_20:
      switch(v20)
      {
        case 1:
          *((unsigned char *)a1 + v17) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 2:
          *(_WORD *)((char *)a1 + v17) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 3:
          goto LABEL_49;
        case 4:
          *(_DWORD *)((char *)a1 + v17) = 0;
          goto LABEL_32;
        default:
LABEL_32:
          if (a2)
          {
LABEL_33:
            if ((v15 & 0x80000000) != 0)
            {
              unint64_t v24 = ((((((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v12 + 16) & ~v12;
              if (v9 == v16)
              {
                unint64_t v25 = *(void (**)(unint64_t, uint64_t))(v8 + 56);
                v25(v24, a2);
              }
              else
              {
                unint64_t v26 = (v24 + v13 + v14) & ~v14;
                uint64_t v27 = *(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 56);
                v27(v26, a2, v11);
              }
            }
            else if ((a2 & 0x80000000) != 0)
            {
              *a1 = a2 ^ 0x80000000;
              a1[1] = 0;
            }
            else
            {
              a1[1] = (a2 - 1);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((*(_DWORD *)(v10 + 64) + ((v13 + ((v12 + 48) & ~v12) + v14) & ~v14) + 7) & 0xFFFFFFF8) == 0xFFFFFFE8) {
      unsigned int v18 = a3 - v16 + 1;
    }
    else {
      unsigned int v18 = 2;
    }
    if (v18 >= 0x10000) {
      int v19 = 4;
    }
    else {
      int v19 = 2;
    }
    if (v18 < 0x100) {
      int v19 = 1;
    }
    if (v18 >= 2) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    int v21 = a2 - v16;
    if (a2 <= v16) {
      goto LABEL_20;
    }
  }
  if (((*(_DWORD *)(v10 + 64) + ((v13 + ((v12 + 48) & ~v12) + v14) & ~v14) + 7) & 0xFFFFFFF8) == 0xFFFFFFE8) {
    int v22 = v21;
  }
  else {
    int v22 = 1;
  }
  if (((*(_DWORD *)(v10 + 64) + ((v13 + ((v12 + 48) & ~v12) + v14) & ~v14) + 7) & 0xFFFFFFF8) != 0xFFFFFFE8)
  {
    int v23 = ~v16 + a2;
    bzero(a1, v17);
    *(_DWORD *)a1 = v23;
  }
  switch(v20)
  {
    case 1:
      *((unsigned char *)a1 + v17) = v22;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v17) = v22;
      break;
    case 3:
LABEL_49:
      __break(1u);
      JUMPOUT(0x255077E38);
    case 4:
      *(_DWORD *)((char *)a1 + v17) = v22;
      break;
    default:
      return;
  }
}

uint64_t sub_255077E60(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_255077EF0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x255077FBCLL);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_255077FE4()
{
  return swift_getWitnessTable();
}

uint64_t sub_255078000()
{
  return swift_getWitnessTable();
}

uint64_t sub_25507801C()
{
  return swift_getWitnessTable();
}

uint64_t sub_255078038()
{
  return 6;
}

uint64_t sub_255078040()
{
  return MEMORY[0x270EEDD40]();
}

uint64_t sub_255078050()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_255078060()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_255078070()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_255078080()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_255078090()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2550780A0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2550780B0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2550780C0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2550780D0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2550780E0()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_2550780F0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_255078100()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_255078110()
{
  return MEMORY[0x270EF09F8]();
}

uint64_t sub_255078120()
{
  return MEMORY[0x270EF0A18]();
}

uint64_t sub_255078130()
{
  return MEMORY[0x270EF0A50]();
}

uint64_t sub_255078140()
{
  return MEMORY[0x270EF0A70]();
}

uint64_t sub_255078150()
{
  return MEMORY[0x270EF0A78]();
}

uint64_t sub_255078160()
{
  return MEMORY[0x270EF0A80]();
}

uint64_t sub_255078170()
{
  return MEMORY[0x270EF0A98]();
}

uint64_t sub_255078180()
{
  return MEMORY[0x270EF0AE0]();
}

uint64_t sub_255078190()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2550781A0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2550781B0()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2550781C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2550781D0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2550781E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2550781F0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_255078200()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_255078210()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_255078220()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_255078230()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_255078250()
{
  return MEMORY[0x270F633A0]();
}

uint64_t sub_255078260()
{
  return MEMORY[0x270F633A8]();
}

uint64_t sub_255078270()
{
  return MEMORY[0x270F633B0]();
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC4nameACSS_tcfc_0()
{
  return MEMORY[0x270F633B8]();
}

uint64_t _s14LocalStatusKit07PublishB10InvocationC5coderACSgSo7NSCoderC_tcfc_0()
{
  return MEMORY[0x270F633C0]();
}

uint64_t sub_2550782A0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2550782B0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2550782C0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2550782D0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2550782E0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2550782F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_255078300()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_255078310()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_255078320()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_255078330()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_255078340()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_255078350()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_255078370()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_255078380()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_255078390()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2550783A0()
{
  return MEMORY[0x270F9DAC0]();
}

uint64_t sub_2550783B0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2550783C0()
{
  return MEMORY[0x270F9DB40]();
}

uint64_t sub_2550783D0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_255078400()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_255078410()
{
  return MEMORY[0x270FA2090]();
}

uint64_t sub_255078420()
{
  return MEMORY[0x270FA2098]();
}

uint64_t sub_255078430()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_255078440()
{
  return MEMORY[0x270EF1D48]();
}

uint64_t sub_255078450()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_255078460()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_255078470()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_255078480()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_255078490()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2550784A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2550784B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2550784C0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2550784E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2550784F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_255078500()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_255078510()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_255078520()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_255078530()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_255078540()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_255078550()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_255078560()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_255078570()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_255078580()
{
  return MEMORY[0x270FA2238]();
}

uint64_t sub_255078590()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2550785A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2550785B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2550785C0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2550785D0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2550785E0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2550785F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_255078600()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_255078610()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_255078620()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_255078630()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_255078640()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_255078650()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_255078660()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_255078670()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_255078680()
{
  return MEMORY[0x270FA2328]();
}

uint64_t sub_255078690()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2550786A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2550786B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2550786C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2550786D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2550786E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2550786F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_255078700()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_255078710()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_255078720()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_255078730()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_255078740()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_255078770()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}