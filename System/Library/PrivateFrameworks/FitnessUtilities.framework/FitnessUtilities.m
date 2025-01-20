uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t DynamicPredicateComparisonDescriptor.comparisonOperator.getter()
{
  return *v0;
}

uint64_t DynamicPredicateComparisonDescriptor.lhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(v1 + 24);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_24F38AC90(v2, v3, v4);
}

uint64_t sub_24F38AC90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t DynamicPredicateComparisonDescriptor.rhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_24F38AC90(v2, v3, v4);
}

__n128 DynamicPredicateComparisonDescriptor.init(comparisonOperator:lhs:rhs:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *(unsigned char *)(a2 + 16);
  unsigned __int8 v5 = a3[1].n128_u8[0];
  *(unsigned char *)a4 = a1;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)a2;
  *(unsigned char *)(a4 + 24) = v4;
  __n128 result = *a3;
  *(__n128 *)(a4 + 32) = *a3;
  *(unsigned char *)(a4 + 48) = v5;
  return result;
}

uint64_t sub_24F38ACE4(char a1)
{
  if (!a1) {
    return 0xD000000000000012;
  }
  if (a1 == 1) {
    return 7563372;
  }
  return 7563378;
}

BOOL sub_24F38AD34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F38AD48()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38AD90()
{
  return sub_24F3AF4E8();
}

uint64_t sub_24F38ADBC()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38AE00()
{
  return sub_24F38ACE4(*v0);
}

uint64_t sub_24F38AE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F38BED0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F38AE30()
{
  return 0;
}

void sub_24F38AE3C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F38AE48(uint64_t a1)
{
  unint64_t v2 = sub_24F38B114();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38AE84(uint64_t a1)
{
  unint64_t v2 = sub_24F38B114();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateComparisonDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A046C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v18 = *((void *)v1 + 2);
  uint64_t v19 = v9;
  int v23 = v1[24];
  uint64_t v10 = *((void *)v1 + 4);
  uint64_t v16 = *((void *)v1 + 5);
  uint64_t v17 = v10;
  HIDWORD(v15) = v1[48];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F38B114();
  sub_24F3AF538();
  LOBYTE(v20) = v8;
  char v24 = 0;
  sub_24F38B168();
  sub_24F3AF428();
  if (!v2)
  {
    char v11 = BYTE4(v15);
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    uint64_t v20 = v19;
    uint64_t v21 = v18;
    char v22 = v23;
    char v24 = 1;
    sub_24F38B1BC();
    sub_24F3AF428();
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    char v22 = v11;
    char v24 = 2;
    sub_24F3AF428();
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

unint64_t sub_24F38B114()
{
  unint64_t result = qword_269A046C8;
  if (!qword_269A046C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046C8);
  }
  return result;
}

unint64_t sub_24F38B168()
{
  unint64_t result = qword_269A046D0;
  if (!qword_269A046D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046D0);
  }
  return result;
}

unint64_t sub_24F38B1BC()
{
  unint64_t result = qword_269A046D8;
  if (!qword_269A046D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046D8);
  }
  return result;
}

uint64_t DynamicPredicateComparisonDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A046E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F38B114();
  sub_24F3AF528();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v24 = 0;
  sub_24F38B4E0();
  sub_24F3AF398();
  int v9 = v20;
  char v24 = 1;
  sub_24F38B534();
  sub_24F3AF398();
  int v18 = v9;
  uint64_t v10 = v21;
  char v24 = 2;
  uint64_t v19 = v20;
  int v23 = v22;
  sub_24F38AC90(v20, v21, v22);
  sub_24F3AF398();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v20;
  uint64_t v12 = v21;
  char v13 = v22;
  uint64_t v14 = v19;
  char v15 = v23;
  sub_24F38AC90(v19, v10, v23);
  sub_24F38AC90(v11, v12, v13);
  sub_24F38B588(v14, v10, v15);
  *(unsigned char *)a2 = v18;
  *(void *)(a2 + 8) = v14;
  *(void *)(a2 + 16) = v10;
  *(unsigned char *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v12;
  *(unsigned char *)(a2 + 48) = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_24F38B588(v14, v10, v15);
  return sub_24F38B588(v11, v12, v13);
}

unint64_t sub_24F38B4E0()
{
  unint64_t result = qword_269A046E8;
  if (!qword_269A046E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046E8);
  }
  return result;
}

unint64_t sub_24F38B534()
{
  unint64_t result = qword_269A046F0;
  if (!qword_269A046F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046F0);
  }
  return result;
}

uint64_t sub_24F38B588(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24F38B5A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateComparisonDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24F38B5B8(void *a1)
{
  return DynamicPredicateComparisonDescriptor.encode(to:)(a1);
}

uint64_t DynamicPredicateComparisonDescriptor.hash(into:)()
{
  return DynamicPredicateComparableValue.hash(into:)();
}

uint64_t DynamicPredicateComparisonDescriptor.hashValue.getter()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 48);
  sub_24F3AF4D8();
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  switch(v1)
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      sub_24F3AF4E8();
      break;
  }
  switch(v2)
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      sub_24F3AF4E8();
      break;
  }
  return sub_24F3AF508();
}

uint64_t sub_24F38BA20()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 48);
  sub_24F3AF4D8();
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  switch(v1)
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      sub_24F3AF4E8();
      break;
  }
  switch(v2)
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      sub_24F3AF4E8();
      break;
  }
  return sub_24F3AF508();
}

uint64_t sub_24F38BD44()
{
  sub_24F3AEED8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24F38BDC8()
{
  sub_24F3AEED8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24F38BED0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024F3B34E0 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7563372 && a2 == 0xE300000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t _s16FitnessUtilities36DynamicPredicateComparisonDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 8);
  char v2 = *(unsigned char *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  char v8 = *(unsigned char *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  char v11 = *(unsigned char *)(a2 + 48);
  if ((sub_24F393C00(*(unsigned char *)a1, *(unsigned char *)a2) & 1) != 0
    && (uint64_t v19 = v15,
        uint64_t v20 = v14,
        char v21 = v2,
        uint64_t v16 = v7,
        uint64_t v17 = v6,
        char v18 = v8,
        (_s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v19, (uint64_t)&v16) & 1) != 0))
  {
    uint64_t v19 = v3;
    uint64_t v20 = v4;
    char v21 = v5;
    uint64_t v16 = v9;
    uint64_t v17 = v10;
    char v18 = v11;
    char v12 = _s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v19, (uint64_t)&v16);
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

unint64_t sub_24F38C0EC()
{
  unint64_t result = qword_269A046F8;
  if (!qword_269A046F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A046F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DynamicPredicateComparisonDescriptor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DynamicPredicateComparisonDescriptor(uint64_t a1)
{
  sub_24F38B588(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);

  return sub_24F38B588(v2, v3, v4);
}

uint64_t initializeWithCopy for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24F38AC90(v4, v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = *(void *)(v2 + 40);
  LOBYTE(v2) = *(unsigned char *)(v2 + 48);
  sub_24F38AC90(v7, v8, v2);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = v2;
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24F38AC90(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v9 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24F38B588(v7, v8, v9);
  uint64_t v10 = *(void *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 40);
  LOBYTE(v2) = *(unsigned char *)(v2 + 48);
  sub_24F38AC90(v10, v11, v2);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  char v14 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v2;
  sub_24F38B588(v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DynamicPredicateComparisonDescriptor(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  char v7 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24F38B588(v5, v6, v7);
  char v8 = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v8;
  sub_24F38B588(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonDescriptor(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && a1[49]) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparisonDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparisonDescriptor()
{
  return &type metadata for DynamicPredicateComparisonDescriptor;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonDescriptor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateComparisonDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F38C570);
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

uint64_t sub_24F38C598(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F38C5A4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparisonDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateComparisonDescriptor.CodingKeys;
}

unint64_t sub_24F38C5C0()
{
  unint64_t result = qword_269A04700;
  if (!qword_269A04700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04700);
  }
  return result;
}

unint64_t sub_24F38C618()
{
  unint64_t result = qword_269A04708;
  if (!qword_269A04708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04708);
  }
  return result;
}

unint64_t sub_24F38C670()
{
  unint64_t result = qword_269A04710;
  if (!qword_269A04710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04710);
  }
  return result;
}

uint64_t AsyncLockable.withLock<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[6] = a6;
  v7[7] = v6;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  v7[3] = a2;
  uint64_t v10 = (void *)swift_task_alloc();
  v7[8] = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_24F38C774;
  return sub_24F38CB5C(a4, a6);
}

uint64_t sub_24F38C774()
{
  uint64_t v1 = *v0;
  int v2 = *(int **)(*v0 + 24);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  BOOL v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v4;
  *unsigned int v4 = v3;
  v4[1] = sub_24F38C920;
  uint64_t v5 = *(void *)(v1 + 16);
  return v7(v5);
}

uint64_t sub_24F38C920()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F3AF028();
  if (v0) {
    unsigned int v4 = sub_24F38CAF4;
  }
  else {
    unsigned int v4 = sub_24F38CA8C;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F38CA8C()
{
  sub_24F38D2E4(v0[5], v0[6]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24F38CAF4()
{
  sub_24F38D2E4(v0[5], v0[6]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24F38CB5C(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = *(void *)(a2 + 8);
  uint64_t v5 = sub_24F3AF028();
  v3[7] = v5;
  v3[8] = v4;
  return MEMORY[0x270FA2498](sub_24F38CBD8, v5, v4);
}

uint64_t sub_24F38CBD8()
{
  uint64_t v9 = v0;
  (*(void (**)(uint64_t *__return_ptr, void))(v0[4] + 16))(&v8, v0[3]);
  if (v8)
  {
    uint64_t v1 = v0[5];
    v0[2] = v8;
    uint64_t v2 = swift_task_alloc();
    v0[9] = v2;
    *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 3);
    *(void *)(v2 + 32) = v0 + 2;
    *(void *)(v2 + 40) = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[10] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24F38CD68;
    return MEMORY[0x270FA2318]();
  }
  else
  {
    uint64_t v4 = v0[4];
    uint64_t v5 = v0[3];
    uint64_t v8 = MEMORY[0x263F8EE78];
    (*(void (**)(uint64_t *, uint64_t))(v4 + 24))(&v8, v5);
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24F38CD68()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_24F38CEAC, v3, v2);
}

uint64_t sub_24F38CEAC()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *initializeBufferWithCopyOfBuffer for AsyncLock(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AsyncLock()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AsyncLock(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for AsyncLock(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncLock(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AsyncLock(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_24F38D064(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24F38D07C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AsyncLock()
{
  return &type metadata for AsyncLock;
}

uint64_t dispatch thunk of AsyncLockable.lock.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AsyncLockable.lock.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AsyncLockable.lock.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_24F38D0E8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04728);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3AF028();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  unint64_t v13 = *a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a2 = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v13 = sub_24F38D498(0, *(void *)(v13 + 16) + 1, 1, v13);
    *a2 = v13;
  }
  unint64_t v16 = *(void *)(v13 + 16);
  unint64_t v15 = *(void *)(v13 + 24);
  if (v16 >= v15 >> 1)
  {
    unint64_t v13 = sub_24F38D498(v15 > 1, v16 + 1, 1, v13);
    *a2 = v13;
  }
  *(void *)(v13 + 16) = v16 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v16, v12, v9);
  unint64_t v20 = *a2;
  uint64_t v17 = *(uint64_t (**)(unint64_t *, uint64_t, uint64_t))(a5 + 24);
  swift_bridgeObjectRetain();
  return v17(&v20, a4, a5);
}

uint64_t sub_24F38D2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04728);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 16))(&v9, a1, a2);
  uint64_t result = v9;
  if (v9)
  {
    uint64_t v10 = v9;
    if (*(void *)(v9 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), v4);
      sub_24F38D864(0, 1);
      uint64_t v9 = v10;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(a2 + 24))(&v9, a1, a2);
      sub_24F3AF048();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = 0;
      return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a2 + 24))(&v9, a1, a2);
    }
  }
  return result;
}

uint64_t sub_24F38D498(char a1, int64_t a2, char a3, unint64_t a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A04730);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A04728) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24F3AF2F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A04728) - 8);
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
    sub_24F38D708(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24F38D708(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A04728) - 8);
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
  uint64_t result = sub_24F3AF308();
  __break(1u);
  return result;
}

uint64_t sub_24F38D864(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_24F38D498(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A04728) - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *unsigned int v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_24F3AF308();
  __break(1u);
  return result;
}

uint64_t sub_24F38DA50(uint64_t a1)
{
  return sub_24F38D0E8(a1, *(unint64_t **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

BOOL sub_24F38DA60(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24F38DA70()
{
  return sub_24F3AF4E8();
}

uint64_t sub_24F38DA98(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F3AF468() & 1) != 0)
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
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F38DB84()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38DBCC(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

BOOL sub_24F38DBFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24F38DA60(*a1, *a2);
}

uint64_t sub_24F38DC28()
{
  return sub_24F38DB84();
}

uint64_t sub_24F38DC30()
{
  return sub_24F38DA70();
}

uint64_t sub_24F38DC54()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38DC94()
{
  return sub_24F38DBCC(*v0);
}

uint64_t sub_24F38DC9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F38DA98(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F38DCCC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F38ED10();
  *a1 = result;
  return result;
}

uint64_t sub_24F38DD08(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F38DD5C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t static Result<>.ResultCodableError.== infix(_:_:)()
{
  return 1;
}

uint64_t Result<>.ResultCodableError.hash(into:)()
{
  return sub_24F3AF4E8();
}

uint64_t Result<>.ResultCodableError.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38DE24()
{
  return 1;
}

uint64_t sub_24F38DE2C()
{
  return sub_24F3AF508();
}

uint64_t sub_24F38DE70()
{
  return sub_24F3AF4E8();
}

uint64_t sub_24F38DE98()
{
  return sub_24F3AF508();
}

uint64_t Result<>.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v36 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  v35 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *(void *)(*(void *)(v6 + 16) - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 32);
  uint64_t v34 = v15;
  v41[0] = v15;
  v41[1] = v16;
  uint64_t v37 = v16;
  v41[2] = v17;
  v41[3] = v18;
  uint64_t v31 = v18;
  uint64_t v32 = v19;
  v41[4] = v20;
  v41[5] = v19;
  v41[6] = v14;
  _s10CodingKeysOMa();
  swift_getWitnessTable();
  uint64_t v21 = sub_24F3AF438();
  uint64_t v39 = *(void *)(v21 - 8);
  uint64_t v40 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v29 - v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3AF538();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v38, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = v35;
    uint64_t v24 = v36;
    uint64_t v26 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v35, v12, v37);
    char v42 = 1;
  }
  else
  {
    uint64_t v24 = v33;
    uint64_t v26 = v34;
    v25 = v30;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v12, v34);
    char v42 = 0;
  }
  uint64_t v27 = v40;
  sub_24F3AF3D8();
  sub_24F3AEE38();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v23, v27);
}

uint64_t _s10CodingKeysOMa()
{
  return swift_getGenericMetadata();
}

uint64_t Result<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  uint64_t v39 = a5;
  uint64_t v36 = *(void *)(a3 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v40 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v9);
  v47 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = v13;
  v52[0] = v14;
  v52[1] = v15;
  v52[2] = v13;
  v52[3] = v16;
  uint64_t v41 = v16;
  uint64_t v44 = v17;
  v52[4] = v17;
  v52[5] = v18;
  uint64_t v42 = v18;
  v52[6] = v19;
  _s10CodingKeysOMa();
  swift_getWitnessTable();
  uint64_t v20 = sub_24F3AF3B8();
  uint64_t v45 = *(void *)(v20 - 8);
  uint64_t v46 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v33 - v21;
  uint64_t v49 = a3;
  uint64_t v43 = a4;
  uint64_t v23 = sub_24F3AF518();
  uint64_t v38 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  v25 = (char *)&v33 - v24;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v26 = v50;
  sub_24F3AF528();
  if (v26)
  {
    uint64_t v32 = (uint64_t)a1;
  }
  else
  {
    uint64_t v27 = v47;
    uint64_t v34 = v25;
    uint64_t v35 = v23;
    v50 = a1;
    char v53 = 0;
    uint64_t v28 = v46;
    sub_24F3AF348();
    sub_24F38E91C(&v51, (uint64_t)v52);
    sub_24F38E934((uint64_t)v52, (uint64_t)&v51);
    sub_24F3AF178();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v28);
    v30 = v34;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v34, v27, a2);
    uint64_t v31 = v35;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v39, v30, v31);
    uint64_t v32 = (uint64_t)v50;
  }
  return __swift_destroy_boxed_opaque_existential_1(v32);
}

uint64_t sub_24F38E8A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_269A04738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for Result<>.ResultCodableError()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24F38E91C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24F38E934(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24F38E998()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F38E9B4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return Result<>.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_24F38E9E0(void *a1, uint64_t a2)
{
  return Result<>.encode(to:)(a1, a2);
}

uint64_t sub_24F38EA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t getEnumTagSinglePayload for DynamicPredicateBooleanValue.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *sub_24F38EA60(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F38EAFCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F38EB24()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableKeyPath(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24F38EBBC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F38EC88);
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

unsigned char *sub_24F38ECB0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_24F38ECBC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F38ECD8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F38ECF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F38ED10()
{
  return 2;
}

BOOL static DynamicPredicateComparableValue.Stripped.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DynamicPredicateComparableValue.Stripped.hash(into:)()
{
  return sub_24F3AF4E8();
}

uint64_t DynamicPredicateComparableValue.Stripped.hashValue.getter()
{
  return sub_24F3AF508();
}

void DynamicPredicateComparableValue.strippedCase.getter(unsigned char *a1@<X8>)
{
  unsigned int v2 = v1[16];
  if (v2 >= 3)
  {
    if (v2 == 3) {
      *a1 = *v1 & 1;
    }
    else {
      *a1 = 3;
    }
  }
  else
  {
    *a1 = v2;
  }
}

uint64_t sub_24F38EDE0(char a1)
{
  return *(void *)&aDynamictgridsi[8 * a1];
}

uint64_t sub_24F38EE00()
{
  return sub_24F38EDE0(*v0);
}

uint64_t sub_24F38EE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F39185C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F38EE30(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24F38EE3C(uint64_t a1)
{
  unint64_t v2 = sub_24F390618();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38EE78(uint64_t a1)
{
  unint64_t v2 = sub_24F390618();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F38EEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F391A90(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_24F38EEEC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F38EEF8(uint64_t a1)
{
  unint64_t v2 = sub_24F390810();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38EF34(uint64_t a1)
{
  unint64_t v2 = sub_24F390810();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F38EF70(uint64_t a1)
{
  unint64_t v2 = sub_24F3907BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38EFAC(uint64_t a1)
{
  unint64_t v2 = sub_24F3907BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F38EFE8(uint64_t a1)
{
  unint64_t v2 = sub_24F390768();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38F024(uint64_t a1)
{
  unint64_t v2 = sub_24F390768();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F38F060(uint64_t a1)
{
  unint64_t v2 = sub_24F3906C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38F09C(uint64_t a1)
{
  unint64_t v2 = sub_24F3906C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F38F0D8(uint64_t a1)
{
  unint64_t v2 = sub_24F39066C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F38F114(uint64_t a1)
{
  unint64_t v2 = sub_24F39066C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateComparableValue.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047C0);
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047C8);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047D0);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v31 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047D8);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047E0);
  uint64_t v28 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A047E8);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v41 = v15;
  uint64_t v42 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = *v1;
  v27[1] = v1[1];
  uint64_t v19 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F390618();
  sub_24F3AF538();
  switch(v19)
  {
    case 1:
      char v45 = 1;
      sub_24F3907BC();
      uint64_t v21 = v41;
      sub_24F3AF3C8();
      uint64_t v22 = v30;
      sub_24F3AF408();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v22);
      return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v18, v21);
    case 2:
      char v46 = 2;
      sub_24F390768();
      uint64_t v24 = v31;
      uint64_t v20 = v41;
      sub_24F3AF3C8();
      uint64_t v25 = v33;
      sub_24F3AF408();
      uint64_t v26 = v32;
      goto LABEL_7;
    case 3:
      char v48 = 3;
      sub_24F3906C0();
      uint64_t v24 = v34;
      uint64_t v20 = v41;
      sub_24F3AF3C8();
      char v47 = v40 & 1;
      sub_24F390714();
      uint64_t v25 = v36;
      sub_24F3AF428();
      uint64_t v26 = v35;
      goto LABEL_7;
    case 4:
      char v49 = 4;
      sub_24F39066C();
      uint64_t v24 = v37;
      uint64_t v20 = v41;
      sub_24F3AF3C8();
      uint64_t v25 = v39;
      sub_24F3AF3E8();
      uint64_t v26 = v38;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
      break;
    default:
      char v44 = 0;
      sub_24F390810();
      uint64_t v20 = v41;
      sub_24F3AF3C8();
      char v43 = v40;
      sub_24F390864();
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v12);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v18, v20);
}

uint64_t DynamicPredicateComparableValue.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04830);
  uint64_t v54 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  v59 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04838);
  uint64_t v55 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  v58 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04840);
  uint64_t v52 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  v57 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04848);
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04850);
  uint64_t v48 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04858);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_24F390618();
  uint64_t v17 = v61;
  sub_24F3AF528();
  if (v17) {
    goto LABEL_10;
  }
  uint64_t v45 = v9;
  char v46 = v8;
  uint64_t v19 = v57;
  uint64_t v18 = v58;
  uint64_t v20 = v59;
  uint64_t v61 = v13;
  uint64_t v21 = sub_24F3AF3A8();
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v26 = v12;
    uint64_t v27 = sub_24F3AF2C8();
    swift_allocError();
    uint64_t v28 = v15;
    uint64_t v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A04860);
    void *v30 = &type metadata for DynamicPredicateComparableValue;
    sub_24F3AF338();
    sub_24F3AF2B8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v30, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v28, v26);
LABEL_10:
    uint64_t v34 = (uint64_t)v60;
    return __swift_destroy_boxed_opaque_existential_1(v34);
  }
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v31 = *(unsigned char *)(v21 + 32);
      char v64 = 1;
      sub_24F3907BC();
      uint64_t v32 = v46;
      sub_24F3AF328();
      uint64_t v33 = v50;
      uint64_t v25 = sub_24F3AF378();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v32, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v15, v12);
      uint64_t v34 = (uint64_t)v60;
      uint64_t v24 = 0;
      goto LABEL_13;
    case 2:
      char v22 = *(unsigned char *)(v21 + 32);
      char v65 = 2;
      sub_24F390768();
      sub_24F3AF328();
      uint64_t v35 = v47;
      uint64_t v25 = sub_24F3AF378();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v19, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v15, v12);
      uint64_t v24 = 0;
      goto LABEL_12;
    case 3:
      char v22 = *(unsigned char *)(v21 + 32);
      char v67 = 3;
      sub_24F3906C0();
      uint64_t v36 = v18;
      sub_24F3AF328();
      sub_24F3908B8();
      uint64_t v37 = v53;
      sub_24F3AF398();
      uint64_t v38 = v36;
      uint64_t v39 = v61;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v12);
      uint64_t v24 = 0;
      uint64_t v25 = v66;
      goto LABEL_12;
    case 4:
      char v31 = *(unsigned char *)(v21 + 32);
      char v68 = 4;
      sub_24F39066C();
      sub_24F3AF328();
      v57 = v15;
      v58 = (char *)v12;
      uint64_t v41 = v51;
      uint64_t v25 = sub_24F3AF358();
      uint64_t v24 = v43;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v20, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v61 + 8))(v57, v58);
      uint64_t v34 = (uint64_t)v60;
LABEL_13:
      uint64_t v42 = v56;
      char v22 = v31;
      goto LABEL_14;
    default:
      char v22 = *(unsigned char *)(v21 + 32);
      char v63 = 0;
      sub_24F390810();
      sub_24F3AF328();
      sub_24F39090C();
      uint64_t v23 = v45;
      sub_24F3AF398();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v23);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v15, v12);
      uint64_t v24 = 0;
      uint64_t v25 = v62;
LABEL_12:
      uint64_t v34 = (uint64_t)v60;
      uint64_t v42 = v56;
LABEL_14:
      *(void *)uint64_t v42 = v25;
      *(void *)(v42 + 8) = v24;
      *(unsigned char *)(v42 + 16) = v22;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t sub_24F39006C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateComparableValue.init(from:)(a1, a2);
}

uint64_t sub_24F390084(void *a1)
{
  return DynamicPredicateComparableValue.encode(to:)(a1);
}

uint64_t DynamicPredicateComparableValue.hash(into:)()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      uint64_t result = sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      uint64_t result = sub_24F3AF4E8();
      break;
  }
  return result;
}

uint64_t DynamicPredicateComparableValue.hashValue.getter()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  sub_24F3AF4D8();
  switch(v1)
  {
    case 3:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      break;
    case 4:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      break;
    default:
      sub_24F3AF4E8();
      sub_24F3AF4E8();
      break;
  }
  return sub_24F3AF508();
}

uint64_t sub_24F390344()
{
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities31DynamicPredicateComparableValueO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1:
      if (v7 != 1) {
        goto LABEL_34;
      }
      sub_24F38B588(*(void *)a1, v3, 1);
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      char v11 = 1;
      goto LABEL_14;
    case 2:
      if (v7 != 2) {
        goto LABEL_34;
      }
      sub_24F38B588(*(void *)a1, v3, 2);
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      char v11 = 2;
LABEL_14:
      sub_24F38B588(v9, v10, v11);
      char v8 = v2 == v5;
      break;
    case 3:
      if (v7 != 3) {
        goto LABEL_34;
      }
      if (v2) {
        uint64_t v13 = 0x657A695364697267;
      }
      else {
        uint64_t v13 = 0x5463696D616E7964;
      }
      if (v2) {
        unint64_t v14 = 0xED00007373616C43;
      }
      else {
        unint64_t v14 = 0xEF657A6953657079;
      }
      if (v5) {
        uint64_t v15 = 0x657A695364697267;
      }
      else {
        uint64_t v15 = 0x5463696D616E7964;
      }
      if (v5) {
        unint64_t v16 = 0xED00007373616C43;
      }
      else {
        unint64_t v16 = 0xEF657A6953657079;
      }
      if (v13 == v15 && v14 == v16) {
        char v8 = 1;
      }
      else {
        char v8 = sub_24F3AF468();
      }
      sub_24F38AC90(v5, v6, 3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24F38B588(v2, v3, 3);
      sub_24F38B588(v5, v6, 3);
      break;
    case 4:
      if (v7 == 4)
      {
        if (v2 == v5 && v3 == v6) {
          char v8 = 1;
        }
        else {
          char v8 = sub_24F3AF468();
        }
        sub_24F38AC90(v5, v6, 4);
        sub_24F38AC90(v2, v3, 4);
        sub_24F38B588(v2, v3, 4);
        sub_24F38B588(v5, v6, 4);
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_34:
        sub_24F38AC90(v5, v6, v7);
        sub_24F38B588(v2, v3, v4);
        sub_24F38B588(v5, v6, v7);
        char v8 = 0;
      }
      break;
    default:
      if (*(unsigned char *)(a2 + 16)) {
        goto LABEL_34;
      }
      sub_24F38B588(*(void *)a1, v3, 0);
      sub_24F38B588(v5, v6, 0);
      char v8 = v5 == v2;
      break;
  }
  return v8 & 1;
}

unint64_t sub_24F390618()
{
  unint64_t result = qword_269A047F0;
  if (!qword_269A047F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A047F0);
  }
  return result;
}

unint64_t sub_24F39066C()
{
  unint64_t result = qword_269A047F8;
  if (!qword_269A047F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A047F8);
  }
  return result;
}

unint64_t sub_24F3906C0()
{
  unint64_t result = qword_269A04800;
  if (!qword_269A04800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04800);
  }
  return result;
}

unint64_t sub_24F390714()
{
  unint64_t result = qword_269A04808;
  if (!qword_269A04808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04808);
  }
  return result;
}

unint64_t sub_24F390768()
{
  unint64_t result = qword_269A04810;
  if (!qword_269A04810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04810);
  }
  return result;
}

unint64_t sub_24F3907BC()
{
  unint64_t result = qword_269A04818;
  if (!qword_269A04818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04818);
  }
  return result;
}

unint64_t sub_24F390810()
{
  unint64_t result = qword_269A04820;
  if (!qword_269A04820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04820);
  }
  return result;
}

unint64_t sub_24F390864()
{
  unint64_t result = qword_269A04828;
  if (!qword_269A04828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04828);
  }
  return result;
}

unint64_t sub_24F3908B8()
{
  unint64_t result = qword_269A04868;
  if (!qword_269A04868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04868);
  }
  return result;
}

unint64_t sub_24F39090C()
{
  unint64_t result = qword_269A04870;
  if (!qword_269A04870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04870);
  }
  return result;
}

unint64_t sub_24F390964()
{
  unint64_t result = qword_269A04878;
  if (!qword_269A04878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04878);
  }
  return result;
}

unint64_t sub_24F3909BC()
{
  unint64_t result = qword_269A04880;
  if (!qword_269A04880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04880);
  }
  return result;
}

uint64_t destroy for DynamicPredicateComparableValue(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 16);
  if (v1 >= 5) {
    unsigned int v1 = *(_DWORD *)result + 5;
  }
  if (v1 >= 4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16FitnessUtilities31DynamicPredicateComparableValueOwCP_0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 16);
  if (v3 >= 5) {
    unsigned int v3 = *(_DWORD *)a2 + 5;
  }
  switch(v3)
  {
    case 1u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 16) = 1;
      break;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 16) = 2;
      break;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 16) = 3;
      break;
    case 4u:
      uint64_t v4 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      *(unsigned char *)(a1 + 16) = 4;
      swift_bridgeObjectRetain();
      break;
    default:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 16) = 0;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateComparableValue(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 5) {
      unsigned int v4 = *(_DWORD *)a1 + 5;
    }
    if (v4 >= 4) {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 16);
    if (v5 >= 5) {
      unsigned int v5 = *(_DWORD *)a2 + 5;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 16) = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 16) = 2;
        break;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 16) = 3;
        break;
      case 4u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(unsigned char *)(a1 + 16) = 4;
        swift_bridgeObjectRetain();
        break;
      default:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 16) = 0;
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DynamicPredicateComparableValue(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 5) {
      unsigned int v4 = *(_DWORD *)a1 + 5;
    }
    if (v4 >= 4) {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 16);
    if (v5 >= 5) {
      unsigned int v5 = *(_DWORD *)a2 + 5;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        char v6 = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v6 = 2;
        break;
      case 3u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v6 = 3;
        break;
      case 4u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 4;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    *(unsigned char *)(a1 + 16) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 5) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateComparableValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F390D9C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 5) {
    return (*(_DWORD *)a1 + 5);
  }
  return result;
}

uint64_t sub_24F390DB8(uint64_t result, unsigned int a2)
{
  if (a2 > 4)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 5;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue()
{
  return &type metadata for DynamicPredicateComparableValue;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparisonOperator(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateComparableValue.Stripped(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F390F44);
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

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.Stripped()
{
  return &type metadata for DynamicPredicateComparableValue.Stripped;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateComparableValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateComparableValue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3910D8);
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

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.CodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.DynamicTypeSizeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.GridSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.GridSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.IntegerCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.KeyPathCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.KeyPathCodingKeys;
}

unsigned char *_s16FitnessUtilities31DynamicPredicateComparableValueO25DynamicTypeSizeCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3911F4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateComparableValue.StringCodingKeys()
{
  return &type metadata for DynamicPredicateComparableValue.StringCodingKeys;
}

unint64_t sub_24F391230()
{
  unint64_t result = qword_269A04888;
  if (!qword_269A04888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04888);
  }
  return result;
}

unint64_t sub_24F391288()
{
  unint64_t result = qword_269A04890;
  if (!qword_269A04890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04890);
  }
  return result;
}

unint64_t sub_24F3912E0()
{
  unint64_t result = qword_269A04898;
  if (!qword_269A04898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04898);
  }
  return result;
}

unint64_t sub_24F391338()
{
  unint64_t result = qword_269A048A0;
  if (!qword_269A048A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048A0);
  }
  return result;
}

unint64_t sub_24F391390()
{
  unint64_t result = qword_269A048A8;
  if (!qword_269A048A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048A8);
  }
  return result;
}

unint64_t sub_24F3913E8()
{
  unint64_t result = qword_269A048B0;
  if (!qword_269A048B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048B0);
  }
  return result;
}

unint64_t sub_24F391440()
{
  unint64_t result = qword_269A048B8;
  if (!qword_269A048B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048B8);
  }
  return result;
}

unint64_t sub_24F391498()
{
  unint64_t result = qword_269A048C0;
  if (!qword_269A048C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048C0);
  }
  return result;
}

unint64_t sub_24F3914F0()
{
  unint64_t result = qword_269A048C8;
  if (!qword_269A048C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048C8);
  }
  return result;
}

unint64_t sub_24F391548()
{
  unint64_t result = qword_269A048D0;
  if (!qword_269A048D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048D0);
  }
  return result;
}

unint64_t sub_24F3915A0()
{
  unint64_t result = qword_269A048D8;
  if (!qword_269A048D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048D8);
  }
  return result;
}

unint64_t sub_24F3915F8()
{
  unint64_t result = qword_269A048E0;
  if (!qword_269A048E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048E0);
  }
  return result;
}

unint64_t sub_24F391650()
{
  unint64_t result = qword_269A048E8;
  if (!qword_269A048E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048E8);
  }
  return result;
}

unint64_t sub_24F3916A8()
{
  unint64_t result = qword_269A048F0;
  if (!qword_269A048F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048F0);
  }
  return result;
}

unint64_t sub_24F391700()
{
  unint64_t result = qword_269A048F8;
  if (!qword_269A048F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A048F8);
  }
  return result;
}

unint64_t sub_24F391758()
{
  unint64_t result = qword_269A04900;
  if (!qword_269A04900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04900);
  }
  return result;
}

unint64_t sub_24F3917B0()
{
  unint64_t result = qword_269A04908;
  if (!qword_269A04908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04908);
  }
  return result;
}

unint64_t sub_24F391808()
{
  unint64_t result = qword_269A04910;
  if (!qword_269A04910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04910);
  }
  return result;
}

uint64_t sub_24F39185C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6874615079656BLL && a2 == 0xE700000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24F391A84()
{
  return 12383;
}

uint64_t sub_24F391A90(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t DynamicPredicateBooleanValue.value.getter()
{
  return *v0;
}

FitnessUtilities::DynamicPredicateBooleanValue __swiftcall DynamicPredicateBooleanValue.init(_:)(FitnessUtilities::DynamicPredicateBooleanValue result)
{
  v1->value = result.value;
  return result;
}

uint64_t sub_24F391B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F392524(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F391B50(uint64_t a1)
{
  unint64_t v2 = sub_24F391CFC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F391B8C(uint64_t a1)
{
  unint64_t v2 = sub_24F391CFC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateBooleanValue.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04918);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F391CFC();
  sub_24F3AF538();
  sub_24F3AF3F8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24F391CFC()
{
  unint64_t result = qword_269A04920;
  if (!qword_269A04920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04920);
  }
  return result;
}

uint64_t DynamicPredicateBooleanValue.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04928);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F391CFC();
  sub_24F3AF528();
  if (!v2)
  {
    char v9 = sub_24F3AF368();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24F391EA4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DynamicPredicateBooleanValue.init(from:)(a1, a2);
}

uint64_t sub_24F391EBC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04918);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F391CFC();
  sub_24F3AF538();
  sub_24F3AF3F8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DynamicPredicateBooleanValue.hash(into:)()
{
  return sub_24F3AF4F8();
}

BOOL static DynamicPredicateBooleanValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DynamicPredicateBooleanValue.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t sub_24F39207C()
{
  return sub_24F3AF508();
}

uint64_t sub_24F3920C4()
{
  return sub_24F3AF4F8();
}

uint64_t sub_24F3920F0()
{
  return sub_24F3AF508();
}

unint64_t sub_24F392138()
{
  unint64_t result = qword_269A04930;
  if (!qword_269A04930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04930);
  }
  return result;
}

BOOL sub_24F39218C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateBooleanValue(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateBooleanValue(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F392310);
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

ValueMetadata *type metadata accessor for DynamicPredicateBooleanValue()
{
  return &type metadata for DynamicPredicateBooleanValue;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateBooleanValue.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3923E4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateBooleanValue.CodingKeys()
{
  return &type metadata for DynamicPredicateBooleanValue.CodingKeys;
}

unint64_t sub_24F392420()
{
  unint64_t result = qword_269A04938;
  if (!qword_269A04938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04938);
  }
  return result;
}

unint64_t sub_24F392478()
{
  unint64_t result = qword_269A04940;
  if (!qword_269A04940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04940);
  }
  return result;
}

unint64_t sub_24F3924D0()
{
  unint64_t result = qword_269A04948;
  if (!qword_269A04948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04948);
  }
  return result;
}

uint64_t sub_24F392524(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F3925A4()
{
  return 0x65756C6176;
}

uint64_t DynamicPredicateEqualityDescriptor.lhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_24F3925CC(v2, v3, v4);
}

uint64_t sub_24F3925CC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 7u && ((1 << a3) & 0xC4) != 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t DynamicPredicateEqualityDescriptor.rhs.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  unsigned __int8 v4 = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_24F3925CC(v2, v3, v4);
}

__n128 DynamicPredicateEqualityDescriptor.init(lhs:rhs:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *(unsigned char *)(a1 + 16);
  unsigned __int8 v4 = a2[1].n128_u8[0];
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(unsigned char *)(a3 + 16) = v3;
  __n128 result = *a2;
  *(__n128 *)(a3 + 24) = *a2;
  *(unsigned char *)(a3 + 40) = v4;
  return result;
}

uint64_t sub_24F392630(char a1)
{
  if (a1) {
    return 7563378;
  }
  else {
    return 7563372;
  }
}

uint64_t sub_24F39264C()
{
  return sub_24F392630(*v0);
}

uint64_t sub_24F392654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F393480(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F39267C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F392688(uint64_t a1)
{
  unint64_t v2 = sub_24F3928C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3926C4(uint64_t a1)
{
  unint64_t v2 = sub_24F3928C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateEqualityDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04950);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v6 = v1[1];
  char v8 = *((unsigned char *)v1 + 16);
  uint64_t v9 = v1[3];
  uint64_t v13 = v1[4];
  uint64_t v14 = v9;
  int v20 = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3928C0();
  sub_24F3AF538();
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  char v19 = v8;
  char v21 = 0;
  sub_24F392914();
  uint64_t v10 = v15;
  sub_24F3AF428();
  if (!v10)
  {
    uint64_t v17 = v14;
    uint64_t v18 = v13;
    char v19 = v20;
    char v21 = 1;
    sub_24F3AF428();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v3);
}

unint64_t sub_24F3928C0()
{
  unint64_t result = qword_269A04958;
  if (!qword_269A04958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04958);
  }
  return result;
}

unint64_t sub_24F392914()
{
  unint64_t result = qword_269A04960;
  if (!qword_269A04960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04960);
  }
  return result;
}

uint64_t DynamicPredicateEqualityDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04968);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3928C0();
  sub_24F3AF528();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  sub_24F392BEC();
  sub_24F3AF398();
  uint64_t v9 = v18;
  char v21 = 1;
  uint64_t v16 = v17;
  int v20 = v19;
  sub_24F3925CC(v17, v18, v19);
  sub_24F3AF398();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  unsigned __int8 v12 = v19;
  uint64_t v13 = v16;
  unsigned __int8 v14 = v20;
  sub_24F3925CC(v16, v9, v20);
  sub_24F3925CC(v10, v11, v12);
  sub_24F392C40(v13, v9, v14);
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v11;
  *(unsigned char *)(a2 + 40) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_24F392C40(v13, v9, v14);
  return sub_24F392C40(v10, v11, v12);
}

unint64_t sub_24F392BEC()
{
  unint64_t result = qword_269A04970;
  if (!qword_269A04970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04970);
  }
  return result;
}

uint64_t sub_24F392C40(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 7u && ((1 << a3) & 0xC4) != 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24F392C6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateEqualityDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24F392C84(void *a1)
{
  return DynamicPredicateEqualityDescriptor.encode(to:)(a1);
}

uint64_t DynamicPredicateEqualityDescriptor.hash(into:)()
{
  return DynamicPredicateEquatableValue.hash(into:)();
}

uint64_t DynamicPredicateEqualityDescriptor.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t sub_24F392D94()
{
  return sub_24F3AF508();
}

uint64_t sub_24F392E1C()
{
  return DynamicPredicateEquatableValue.hash(into:)();
}

uint64_t sub_24F392E88()
{
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities34DynamicPredicateEqualityDescriptorV2eeoiySbAC_ACtFZ_0(long long *a1, long long *a2)
{
  char v2 = *((unsigned char *)a1 + 16);
  uint64_t v3 = *((void *)a1 + 3);
  uint64_t v4 = *((void *)a1 + 4);
  char v5 = *((unsigned char *)a1 + 40);
  char v6 = *((unsigned char *)a2 + 16);
  uint64_t v7 = *((void *)a2 + 3);
  uint64_t v8 = *((void *)a2 + 4);
  char v9 = *((unsigned char *)a2 + 40);
  long long v14 = *a1;
  char v15 = v2;
  long long v12 = *a2;
  char v13 = v6;
  if (_s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v14, (uint64_t)&v12))
  {
    *(void *)&long long v14 = v3;
    *((void *)&v14 + 1) = v4;
    char v15 = v5;
    *(void *)&long long v12 = v7;
    *((void *)&v12 + 1) = v8;
    char v13 = v9;
    char v10 = _s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)&v14, (uint64_t)&v12);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

unint64_t sub_24F392FB0()
{
  unint64_t result = qword_269A04978;
  if (!qword_269A04978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04978);
  }
  return result;
}

uint64_t destroy for DynamicPredicateEqualityDescriptor(uint64_t a1)
{
  sub_24F392C40(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 40);

  return sub_24F392C40(v2, v3, v4);
}

uint64_t initializeWithCopy for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_24F3925CC(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  LOBYTE(v2) = *(unsigned char *)(v2 + 40);
  sub_24F3925CC(v7, v8, v2);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v2;
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 16);
  sub_24F3925CC(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  sub_24F392C40(v7, v8, v9);
  uint64_t v10 = *(void *)(v2 + 24);
  uint64_t v11 = *(void *)(v2 + 32);
  LOBYTE(v2) = *(unsigned char *)(v2 + 40);
  sub_24F3925CC(v10, v11, v2);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
  unsigned __int8 v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v2;
  sub_24F392C40(v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DynamicPredicateEqualityDescriptor(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  sub_24F392C40(v5, v6, v7);
  char v8 = *(unsigned char *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unsigned __int8 v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_24F392C40(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEqualityDescriptor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEqualityDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEqualityDescriptor()
{
  return &type metadata for DynamicPredicateEqualityDescriptor;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateEqualityDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F393340);
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

ValueMetadata *type metadata accessor for DynamicPredicateEqualityDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateEqualityDescriptor.CodingKeys;
}

unint64_t sub_24F39337C()
{
  unint64_t result = qword_269A04980;
  if (!qword_269A04980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04980);
  }
  return result;
}

unint64_t sub_24F3933D4()
{
  unint64_t result = qword_269A04988;
  if (!qword_269A04988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04988);
  }
  return result;
}

unint64_t sub_24F39342C()
{
  unint64_t result = qword_269A04990;
  if (!qword_269A04990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04990);
  }
  return result;
}

uint64_t sub_24F393480(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7563372 && a2 == 0xE300000000000000;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

FitnessUtilities::DynamicPredicateComparableKeyPath_optional __swiftcall DynamicPredicateComparableKeyPath.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24F3AF318();
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

uint64_t DynamicPredicateComparableKeyPath.rawValue.getter()
{
  if (*v0) {
    return 0x657A695364697267;
  }
  else {
    return 0x5463696D616E7964;
  }
}

uint64_t sub_24F393600(char *a1, char *a2)
{
  return sub_24F3938B8(*a1, *a2);
}

FitnessUtilities::DynamicPredicateComparableKeyPath_optional sub_24F39360C(Swift::String *a1)
{
  return DynamicPredicateComparableKeyPath.init(rawValue:)(*a1);
}

uint64_t sub_24F393618@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DynamicPredicateComparableKeyPath.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F393640()
{
  return sub_24F3AEFB8();
}

uint64_t sub_24F3936A0()
{
  return sub_24F3AEF68();
}

unint64_t sub_24F3936F4()
{
  unint64_t result = qword_269A04998;
  if (!qword_269A04998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04998);
  }
  return result;
}

uint64_t sub_24F393748()
{
  return sub_24F393D80();
}

uint64_t sub_24F393750()
{
  return sub_24F38BD44();
}

uint64_t sub_24F393758()
{
  return sub_24F394050();
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateComparableKeyPath(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F39382CLL);
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

ValueMetadata *type metadata accessor for DynamicPredicateComparableKeyPath()
{
  return &type metadata for DynamicPredicateComparableKeyPath;
}

unint64_t sub_24F393864()
{
  unint64_t result = qword_269A049A0;
  if (!qword_269A049A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A049A0);
  }
  return result;
}

uint64_t sub_24F3938B8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657A695364697267;
  }
  else {
    uint64_t v3 = 0x5463696D616E7964;
  }
  if (v2) {
    unint64_t v4 = 0xEF657A6953657079;
  }
  else {
    unint64_t v4 = 0xED00007373616C43;
  }
  if (a2) {
    uint64_t v5 = 0x657A695364697267;
  }
  else {
    uint64_t v5 = 0x5463696D616E7964;
  }
  if (a2) {
    unint64_t v6 = 0xED00007373616C43;
  }
  else {
    unint64_t v6 = 0xEF657A6953657079;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24F393974(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000013;
  unint64_t v4 = 0x800000024F3B3440;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x657A695364697267;
      unint64_t v4 = 0xED00007373616C43;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x6D726F6674616C70;
      break;
    case 4:
      unint64_t v4 = 0x800000024F3B3460;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      unint64_t v3 = 0x5463696D616E7964;
      unint64_t v4 = 0xEF657A6953657079;
      break;
  }
  unint64_t v5 = 0xD000000000000013;
  unint64_t v6 = 0x800000024F3B3440;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED00007373616C43;
      if (v3 == 0x657A695364697267) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x6D726F6674616C70;
LABEL_12:
      if (v3 == v5) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0x800000024F3B3460;
      if (v3 != 0xD000000000000011) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xEF657A6953657079;
      if (v3 != 0x5463696D616E7964) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24F3AF468();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24F393B78(char a1, char a2)
{
  if (*(void *)&aPhone_1[8 * a1] == *(void *)&aPhone_1[8 * a2] && qword_24F3B0F20[a1] == qword_24F3B0F20[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24F393C00(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000024F3B3490;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      goto LABEL_5;
    case 3:
      unint64_t v3 = 0xEF6C61757145724FLL;
LABEL_5:
      unint64_t v5 = 0x6E6168547373656CLL;
      break;
    default:
      unint64_t v3 = 0xEB000000006E6168;
      unint64_t v5 = 0x5472657461657267;
      break;
  }
  unint64_t v6 = 0x800000024F3B3490;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      goto LABEL_10;
    case 3:
      unint64_t v6 = 0xEF6C61757145724FLL;
LABEL_10:
      unint64_t v2 = 0x6E6168547373656CLL;
      break;
    default:
      unint64_t v6 = 0xEB000000006E6168;
      unint64_t v2 = 0x5472657461657267;
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24F393D80()
{
  return sub_24F3AF508();
}

uint64_t sub_24F393E1C()
{
  return sub_24F3AF508();
}

uint64_t sub_24F393F38()
{
  return sub_24F3AF508();
}

uint64_t sub_24F394050()
{
  return sub_24F3AF508();
}

FitnessUtilities::DynamicPredicateEquatableKeyPath_optional __swiftcall DynamicPredicateEquatableKeyPath.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_24F3AF318();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t DynamicPredicateEquatableKeyPath.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x657A695364697267;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6D726F6674616C70;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x5463696D616E7964;
      break;
  }
  return result;
}

uint64_t sub_24F394214(char *a1, char *a2)
{
  return sub_24F393974(*a1, *a2);
}

FitnessUtilities::DynamicPredicateEquatableKeyPath_optional sub_24F394220(Swift::String *a1)
{
  return DynamicPredicateEquatableKeyPath.init(rawValue:)(*a1);
}

unint64_t sub_24F39422C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DynamicPredicateEquatableKeyPath.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F394254()
{
  return sub_24F3AEFB8();
}

uint64_t sub_24F3942B4()
{
  return sub_24F3AEF68();
}

unint64_t sub_24F394308()
{
  unint64_t result = qword_269A049A8;
  if (!qword_269A049A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A049A8);
  }
  return result;
}

uint64_t sub_24F39435C()
{
  return sub_24F393E1C();
}

uint64_t sub_24F394364()
{
  return sub_24F38BDC8();
}

uint64_t sub_24F39436C()
{
  return sub_24F393F38();
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateEquatableKeyPath(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F394440);
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

ValueMetadata *type metadata accessor for DynamicPredicateEquatableKeyPath()
{
  return &type metadata for DynamicPredicateEquatableKeyPath;
}

unint64_t sub_24F394478()
{
  unint64_t result = qword_269A049B0[0];
  if (!qword_269A049B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A049B0);
  }
  return result;
}

id UnsafeCodableBox.base.getter()
{
  id v1 = *v0;
  id v2 = *v0;
  return v1;
}

void UnsafeCodableBox.init(_:)(void *a1@<X0>, void *a2@<X8>)
{
  swift_getMetatypeMetadata();
  id v4 = a1;
  uint64_t v5 = sub_24F3AF568();
  uint64_t v7 = v6;

  *a2 = a1;
  a2[1] = v5;
  a2[2] = v7;
  a2[3] = a1;
}

uint64_t sub_24F39455C()
{
  uint64_t v0 = sub_24F3AF318();
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

uint64_t sub_24F3945B0(char a1)
{
  if (a1) {
    return 1701869940;
  }
  else {
    return 0x73736572646461;
  }
}

uint64_t sub_24F3945E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F394654(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_24F3946C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F394730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F3947A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F39455C();
  *a1 = result;
  return result;
}

uint64_t sub_24F3947D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F3945B0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24F3947FC()
{
  return sub_24F3945B0(*v0);
}

uint64_t sub_24F394804@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F39455C();
  *a1 = result;
  return result;
}

uint64_t sub_24F39482C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F38ED10();
  *a1 = result;
  return result;
}

uint64_t sub_24F394858(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F3948AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t UnsafeCodableBox.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  char v15 = a2;
  type metadata accessor for UnsafeCodableBox.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_24F3AF3B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3AF528();
  if (!v2)
  {
    char v8 = v15;
    char v17 = 0;
    uint64_t v9 = sub_24F3AF388();
    char v16 = 1;
    uint64_t v11 = sub_24F3AF358();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *char v8 = 0;
    v8[1] = v11;
    v8[2] = v13;
    v8[3] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for UnsafeCodableBox.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t UnsafeCodableBox.encode(to:)(void *a1)
{
  type metadata accessor for UnsafeCodableBox.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24F3AF438();
  uint64_t v11 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v10 - v4;
  uint64_t v6 = *(void *)(v1 + 8);
  v10[0] = *(void *)(v1 + 16);
  v10[1] = v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3AF538();
  char v14 = 0;
  uint64_t v7 = v12;
  sub_24F3AF418();
  if (v7) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v5, v3);
  }
  uint64_t v9 = v11;
  char v13 = 1;
  sub_24F3AF3E8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v5, v3);
}

uint64_t sub_24F394CA8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return UnsafeCodableBox.init(from:)(a1, a2);
}

uint64_t sub_24F394CC4(void *a1)
{
  return UnsafeCodableBox.encode(to:)(a1);
}

id static UnsafeCodableBox.== infix(_:_:)(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  if (v2) {
    return objc_msgSend(v2, sel_isEqual_, *a2);
  }
  type metadata accessor for UnsafeCodableBox();
  uint64_t v4 = UnsafeCodableBox.hashValue.getter();
  return (id)(v4 == UnsafeCodableBox.hashValue.getter());
}

uint64_t UnsafeCodableBox.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t type metadata accessor for UnsafeCodableBox()
{
  return __swift_instantiateGenericMetadata();
}

void UnsafeCodableBox.hash(into:)()
{
  if (*v0)
  {
    id v1 = *v0;
    sub_24F3AF218();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24F3AEED8();
    swift_bridgeObjectRelease();
    sub_24F3AF4E8();
  }
}

uint64_t sub_24F394EB0()
{
  return sub_24F3AF508();
}

uint64_t sub_24F394EEC()
{
  return swift_getWitnessTable();
}

id sub_24F394F08(void **a1, void *a2)
{
  return static UnsafeCodableBox.== infix(_:_:)(a1, a2);
}

uint64_t sub_24F394F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24F394F18(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *sub_24F394F54(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24F394F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
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

uint64_t sub_24F39500C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t sub_24F39505C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24F3950A4(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_24F3950E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

unsigned char *sub_24F3950EC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3951B8);
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

uint64_t sub_24F3951E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F3951FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F395218()
{
  return swift_getWitnessTable();
}

unint64_t DynamicPredicateComparisonOperator.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
    case 3:
      unint64_t result = 0x6E6168547373656CLL;
      break;
    default:
      unint64_t result = 0x5472657461657267;
      break;
  }
  return result;
}

uint64_t sub_24F3952D4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = DynamicPredicateComparisonOperator.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == DynamicPredicateComparisonOperator.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F395360@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s16FitnessUtilities34DynamicPredicateComparisonOperatorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_24F395390@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DynamicPredicateComparisonOperator.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24F3953BC()
{
  return sub_24F3AEFB8();
}

uint64_t sub_24F39541C()
{
  return sub_24F3AEF68();
}

uint64_t sub_24F39546C()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateComparisonOperator.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

uint64_t sub_24F3954D0()
{
  DynamicPredicateComparisonOperator.rawValue.getter(*v0);
  sub_24F3AEED8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24F395524()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateComparisonOperator.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities34DynamicPredicateComparisonOperatorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24F3AF318();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_24F3955D4()
{
  unint64_t result = qword_269A04A38;
  if (!qword_269A04A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04A38);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateComparisonOperator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3956F4);
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

ValueMetadata *type metadata accessor for DynamicPredicateComparisonOperator()
{
  return &type metadata for DynamicPredicateComparisonOperator;
}

unint64_t sub_24F39572C()
{
  unint64_t result = qword_269A04A40;
  if (!qword_269A04A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04A40);
  }
  return result;
}

uint64_t AnyEquatable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v7(boxed_opaque_existential_1, a1, a2);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  char v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t static AnyEquatable.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(a1, v3);
  uint64_t v6 = a2[3];
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a2, v6);
  unint64_t v8 = sub_24F395B74();
  return sub_24F3958D8((uint64_t)v5, (uint64_t)v7, (uint64_t)&type metadata for AnyEquatable, v3, v6, v8, v4) & 1;
}

uint64_t sub_24F3958D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v27[1] = a7;
  uint64_t v10 = sub_24F3AF228();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  char v14 = (char *)v27 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  char v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v15);
  int v20 = (char *)v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v17, a2, a5);
  char v22 = swift_dynamicCast();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if (v22)
  {
    uint64_t v24 = 1;
    v23(v14, 0, 1, a4);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v14, a4);
    char v25 = sub_24F3AEE88();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, a4);
    if (v25) {
      return v24;
    }
  }
  else
  {
    v23(v14, 1, 1, a4);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  return 0;
}

unint64_t sub_24F395B74()
{
  unint64_t result = qword_269A04A48;
  if (!qword_269A04A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A04A48);
  }
  return result;
}

uint64_t sub_24F395BC8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = __swift_project_boxed_opaque_existential_1(a1, v7);
  uint64_t v10 = a2[3];
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(a2, v10);

  return sub_24F3958D8((uint64_t)v9, (uint64_t)v11, a3, v7, v10, a4, v8);
}

uint64_t initializeWithCopy for AnyEquatable(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnyEquatable(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for AnyEquatable(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyEquatable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AnyEquatable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AnyEquatable()
{
  return &type metadata for AnyEquatable;
}

uint64_t CurrentValueAsyncStreamPublisher.__allocating_init(currentValue:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  CurrentValueAsyncStreamPublisher.init(currentValue:)(a1);
  return v2;
}

char *CurrentValueAsyncStreamPublisher.init(currentValue:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)v1;
  swift_defaultActor_initialize();
  (*(void (**)(char *, uint64_t, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 56))(&v2[*(void *)(*(void *)v2 + 96)], 1, 1, *(void *)(v4 + 80));
  uint64_t v5 = *(void *)(*(void *)v2 + 104);
  uint64_t v6 = sub_24F3AF228();
  type metadata accessor for AsyncStreamPublisher();
  *(void *)&v2[v5] = AsyncStreamPublisher.__allocating_init()();
  uint64_t v7 = &v2[*(void *)(*(void *)v2 + 96)];
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(v7, a1, v6);
  swift_endAccess();
  return v2;
}

uint64_t CurrentValueAsyncStreamPublisher.publish(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = sub_24F3AF228();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)v1 + *(void *)(v3 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v12, a1, v5);
  swift_endAccess();
  uint64_t v13 = sub_24F3AF078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = v1;
  *((void *)v16 + 3) = WitnessTable;
  *((void *)v16 + 4) = v4;
  *((void *)v16 + 5) = v1;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v16[v15], v8, v5);
  swift_retain_n();
  sub_24F3966F8((uint64_t)v11, (uint64_t)&unk_269A04A58, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24F39642C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24F39644C, a4, 0);
}

uint64_t sub_24F39644C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + *(void *)(**(void **)(v0 + 16) + 104));
  *(void *)(v0 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24F396484, v1, 0);
}

uint64_t sub_24F396484()
{
  AsyncStreamPublisher.publish(_:)();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3964E4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(sub_24F3AF228() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = *(void *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v4, 1, v1)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v4, v1);
  }

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_24F39660C()
{
  uint64_t v2 = *(void *)(sub_24F3AF228() - 8);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_24F397DD8;
  return MEMORY[0x270FA2498](sub_24F39644C, v3, 0);
}

uint64_t sub_24F3966F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F3AF078();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24F3AF068();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24F397C84(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24F3AF028();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t CurrentValueAsyncStreamPublisher.makeStream(bufferingPolicy:)(uint64_t a1)
{
  sub_24F3AF228();
  uint64_t v3 = sub_24F3AF0A8();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 16))(&v7[-v4], a1);
  uint64_t v8 = v1;
  uint64_t v9 = a1;
  swift_checkMetadataState();
  return sub_24F3AF138();
}

uint64_t sub_24F3969C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a3;
  uint64_t v49 = *(void *)(*(void *)a2 + 80);
  sub_24F3AF228();
  uint64_t v50 = sub_24F3AF0E8();
  uint64_t v48 = *(void *)(v50 - 8);
  uint64_t v46 = *(void *)(v48 + 64);
  MEMORY[0x270FA5388](v50);
  uint64_t v47 = (char *)&v38 - v5;
  uint64_t v44 = sub_24F3AF0A8();
  uint64_t v6 = *(void *)(v44 - 8);
  uint64_t v42 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v38 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_checkMetadataState();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v38 - v13;
  uint64_t v15 = sub_24F3AF088();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v38 - v17;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v19 = *(void *)(*(void *)a2 + 96);
  uint64_t v41 = a2;
  uint64_t v20 = a2 + v19;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v20, v11);
  uint64_t v21 = v50;
  uint64_t v22 = a1;
  uint64_t v40 = a1;
  sub_24F3AF0C8();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v23 = sub_24F3AF078();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  uint64_t v39 = v10;
  v24(v10, 1, 1, v23);
  char v25 = v43;
  uint64_t v26 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v43, v45, v44);
  uint64_t v27 = v47;
  uint64_t v28 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v22, v21);
  uint64_t v29 = v49;
  type metadata accessor for CurrentValueAsyncStreamPublisher();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v31 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v32 = (v42 + *(unsigned __int8 *)(v28 + 80) + v31) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v33 = (char *)swift_allocObject();
  uint64_t v34 = v41;
  *((void *)v33 + 2) = v41;
  *((void *)v33 + 3) = WitnessTable;
  *((void *)v33 + 4) = v29;
  *((void *)v33 + 5) = v34;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v33[v31], v25, v26);
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v33[v32], v27, v50);
  swift_retain_n();
  uint64_t v35 = sub_24F3966F8((uint64_t)v39, (uint64_t)&unk_269A04A68, (uint64_t)v33);
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = v29;
  *(void *)(v36 + 24) = v35;
  return sub_24F3AF098();
}

uint64_t sub_24F396ED4(uint64_t a1)
{
  return sub_24F3969C0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24F396EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = *(void *)(*(void *)a4 + 80);
  sub_24F3AF228();
  uint64_t v8 = sub_24F3AF088();
  v6[6] = v8;
  v6[7] = *(void *)(v8 - 8);
  v6[8] = swift_task_alloc();
  uint64_t v9 = swift_checkMetadataState();
  v6[9] = v9;
  v6[10] = *(void *)(v9 - 8);
  v6[11] = swift_task_alloc();
  v6[12] = swift_task_alloc();
  sub_24F3AF228();
  v6[13] = swift_task_alloc();
  uint64_t v10 = sub_24F3AF128();
  v6[14] = v10;
  v6[15] = *(void *)(v10 - 8);
  v6[16] = swift_task_alloc();
  uint64_t v11 = sub_24F3AF118();
  v6[17] = v11;
  v6[18] = *(void *)(v11 - 8);
  v6[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F39713C, a4, 0);
}

uint64_t sub_24F39713C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + *(void *)(**(void **)(v0 + 16) + 104));
  *(void *)(v0 + 160) = v1;
  return MEMORY[0x270FA2498](sub_24F397174, v1, 0);
}

uint64_t sub_24F397174()
{
  uint64_t v1 = *(void *)(v0 + 16);
  AsyncStreamPublisher.makeStream(bufferingPolicy:)(*(void *)(v0 + 24));
  return MEMORY[0x270FA2498](sub_24F3971E4, v1, 0);
}

uint64_t sub_24F3971E4()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  sub_24F3AF0F8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  type metadata accessor for CurrentValueAsyncStreamPublisher();
  uint64_t WitnessTable = swift_getWitnessTable();
  v0[21] = WitnessTable;
  v0[22] = 0;
  uint64_t v5 = v0[2];
  uint64_t v6 = (void *)swift_task_alloc();
  v0[23] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24F3972F8;
  uint64_t v7 = v0[17];
  uint64_t v8 = v0[13];
  return MEMORY[0x270FA1F68](v8, v5, WitnessTable, v7);
}

uint64_t sub_24F3972F8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24F397408, v1, 0);
}

uint64_t sub_24F397408()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
LABEL_4:
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  uint64_t v4 = (void *)v0[22];
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[12], v1, v2);
  sub_24F3AF158();
  if (v4)
  {
    uint64_t v5 = v0[12];
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[10];
    sub_24F3AF0E8();
    sub_24F3AF0D8();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    goto LABEL_4;
  }
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[10];
  uint64_t v14 = v0[7];
  uint64_t v13 = v0[8];
  uint64_t v15 = v0[6];
  (*(void (**)(void, uint64_t, uint64_t))(v12 + 16))(v0[11], v10, v11);
  sub_24F3AF0E8();
  sub_24F3AF0C8();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  v0[22] = 0;
  uint64_t v16 = v0[21];
  uint64_t v17 = v0[2];
  uint64_t v18 = (void *)swift_task_alloc();
  v0[23] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_24F3972F8;
  uint64_t v19 = v0[17];
  uint64_t v20 = v0[13];
  return MEMORY[0x270FA1F68](v20, v17, v16, v19);
}

uint64_t CurrentValueAsyncStreamPublisher.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = sub_24F3AF228();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CurrentValueAsyncStreamPublisher.__deallocating_deinit()
{
  CurrentValueAsyncStreamPublisher.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t CurrentValueAsyncStreamPublisher.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24F39776C()
{
  return CurrentValueAsyncStreamPublisher.unownedExecutor.getter();
}

uint64_t sub_24F39778C()
{
  uint64_t result = sub_24F3AF228();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CurrentValueAsyncStreamPublisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for CurrentValueAsyncStreamPublisher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CurrentValueAsyncStreamPublisher);
}

uint64_t dispatch thunk of CurrentValueAsyncStreamPublisher.__allocating_init(currentValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_24F39787C()
{
  sub_24F3AF228();
  uint64_t v1 = sub_24F3AF0A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_24F3AF0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24F3979F4(uint64_t a1)
{
  uint64_t v3 = v2;
  sub_24F3AF228();
  uint64_t v5 = *(void *)(sub_24F3AF0A8() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(sub_24F3AF0E8() - 8) + 80);
  unint64_t v9 = v6 + v7 + v8;
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[5];
  uint64_t v13 = (uint64_t)v1 + v6;
  uint64_t v14 = (uint64_t)v1 + (v9 & ~v8);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v15;
  *uint64_t v15 = v3;
  v15[1] = sub_24F397B6C;
  return sub_24F396EDC(a1, v10, v11, v12, v13, v14);
}

uint64_t sub_24F397B6C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24F397C60()
{
  return MEMORY[0x270FA1FB0](*(void *)(v0 + 24), MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E628], MEMORY[0x263F8E658]);
}

uint64_t sub_24F397C84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F397CE4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F397D1C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24F397B6C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A04C30 + dword_269A04C30);
  return v6(a1, v4);
}

uint64_t DynamicPredicateDynamicTypeSize.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

uint64_t sub_24F397DEC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s16FitnessUtilities016DynamicPredicateC8TypeSizeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_24F397E18(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

BOOL static DynamicPredicateDynamicTypeSize.< infix(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 < a2;
}

BOOL sub_24F397E38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_24F397E4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_24F397E60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_24F397E74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_24F397E88()
{
  return sub_24F3AEFC8();
}

uint64_t sub_24F397EE8()
{
  return sub_24F3AEF78();
}

uint64_t sub_24F397F38()
{
  return sub_24F3AF508();
}

uint64_t sub_24F397F80()
{
  return sub_24F3AF4E8();
}

uint64_t sub_24F397FB0()
{
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities016DynamicPredicateC8TypeSizeO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xD) {
    return 13;
  }
  else {
    return a1 - 1;
  }
}

unint64_t sub_24F39800C()
{
  unint64_t result = qword_269A04A78;
  if (!qword_269A04A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04A78);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateDynamicTypeSize(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateDynamicTypeSize(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3981BCLL);
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

ValueMetadata *type metadata accessor for DynamicPredicateDynamicTypeSize()
{
  return &type metadata for DynamicPredicateDynamicTypeSize;
}

unint64_t sub_24F3981F4()
{
  unint64_t result = qword_269A04A80;
  if (!qword_269A04A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04A80);
  }
  return result;
}

uint64_t PortableEnum.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v21 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  int v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_24F3AF228();
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, AssociatedTypeWitness);
  sub_24F3AEF58();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v20);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v21, a1, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v16(v15, v12, a2);
    v16(v21, v15, a2);
  }
  type metadata accessor for PortableEnum();
  return swift_storeEnumTagMultiPayload();
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;

  uint64_t v23 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_24F3AF228();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v22 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v17(a1, v6);
    v17((uint64_t)v10, v6);
    uint64_t v18 = type metadata accessor for PortableEnum();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v23, 1, 1, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v10, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, AssociatedTypeWitness);
    uint64_t v20 = v23;
    PortableEnum.init(rawValue:)((uint64_t)v14, a2, v23);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, AssociatedTypeWitness);
    uint64_t v21 = type metadata accessor for PortableEnum();
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 0, 1, v21);
  }
}

uint64_t type metadata accessor for PortableEnum()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PortableEnum.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for PortableEnum();

  return swift_storeEnumTagMultiPayload();
}

uint64_t PortableEnum.rawValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    sub_24F3AEF48();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a2, v9, AssociatedTypeWitness);
  }
}

uint64_t PortableEnum.unwrapped.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v9;
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v6, v8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a2, 1, 1, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
}

uint64_t static PortableEnum.?? infix(_:_:)@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for PortableEnum();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v13 - v10, a1, v8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a3 - 8) + 32))(a4, v11, a3);
  }
  a2();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24F398DA4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E776F6E6BLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F398E88(char a1)
{
  if (a1) {
    return 0x6E776F6E6BLL;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

BOOL sub_24F398EBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24F38DA60(*a1, *a2);
}

uint64_t sub_24F398ED0()
{
  return sub_24F38DB84();
}

uint64_t sub_24F398EE0()
{
  return sub_24F38DA70();
}

uint64_t sub_24F398EF0()
{
  return sub_24F3AF508();
}

uint64_t sub_24F398F38()
{
  return sub_24F398E88(*v0);
}

uint64_t sub_24F398F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F398DA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F398F78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F38ED10();
  *a1 = result;
  return result;
}

uint64_t sub_24F398FA4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F398FF8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24F39904C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F391A90(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F399080@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F38DE24();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24F3990B0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F399104(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24F399158(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F3991AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t static PortableEnum<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PortableEnum();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - v10, a1, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, a3);
    char v12 = sub_24F3AEE88();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t static PortableEnum<>.~= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PortableEnum();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - v10, a2, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, a3);
    char v12 = sub_24F3AEE88();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t Set.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = type metadata accessor for PortableEnum();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)v15 - v12, a1, a3);
  swift_storeEnumTagMultiPayload();
  v15[0] = a4;
  v15[1] = a6;
  swift_getWitnessTable();
  LOBYTE(a6) = sub_24F3AF188();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return a6 & 1;
}

uint64_t PortableEnum<>.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)v21 - v11;
  uint64_t v13 = *(void *)(v7 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v18, v5, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v18, v7);
    sub_24F3AEE48();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v18, AssociatedTypeWitness);
    sub_24F3AEE48();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
  }
}

uint64_t PortableEnum<>.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24F3AF4D8();
  PortableEnum<>.hash(into:)((uint64_t)v7, a1, a2, a3);
  return sub_24F3AF508();
}

uint64_t sub_24F399A10(uint64_t a1, uint64_t a2)
{
  return PortableEnum<>.hashValue.getter(a1, *(void *)(a2 - 8), *(void *)(a2 - 16));
}

uint64_t sub_24F399A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PortableEnum<>.hash(into:)(a1, a2, *(void *)(a3 - 8), *(void *)(a3 - 16));
}

uint64_t sub_24F399A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 16);
  uint64_t v4 = *(void *)(a3 - 8);
  sub_24F3AF4D8();
  PortableEnum<>.hash(into:)((uint64_t)v7, a2, v4, v5);
  return sub_24F3AF508();
}

uint64_t PortableEnum<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v54 = a4;
  uint64_t v55 = a6;
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v50 = type metadata accessor for PortableEnum.KnownCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = sub_24F3AF438();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v49 = (char *)&v38 - v11;
  uint64_t v51 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v48 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PortableEnum.UnknownCodingKeys();
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v43 = v13;
  uint64_t v40 = v14;
  uint64_t v15 = sub_24F3AF438();
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v46 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v41 = (char *)&v38 - v16;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v42 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v39 = (char *)&v38 - v18;
  uint64_t v19 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = v8;
  type metadata accessor for PortableEnum.CodingKeys();
  swift_getWitnessTable();
  uint64_t v22 = sub_24F3AF438();
  uint64_t v57 = *(void *)(v22 - 8);
  uint64_t v58 = v22;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v38 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3AF538();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v59, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = v51;
    uint64_t v26 = v48;
    uint64_t v27 = v56;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v48, v21, v56);
    char v61 = 1;
    uint64_t v28 = v49;
    uint64_t v29 = v58;
    sub_24F3AF3C8();
    uint64_t v30 = v53;
    sub_24F3AF428();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v28, v30);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  }
  else
  {
    uint64_t v31 = v42;
    unint64_t v32 = v39;
    uint64_t v33 = v21;
    uint64_t v34 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v39, v33, AssociatedTypeWitness);
    char v60 = 0;
    uint64_t v35 = v41;
    uint64_t v29 = v58;
    sub_24F3AF3C8();
    uint64_t v36 = v46;
    sub_24F3AF428();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v34);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v24, v29);
}

uint64_t type metadata accessor for PortableEnum.KnownCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PortableEnum.UnknownCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PortableEnum.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PortableEnum<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  uint64_t v61 = a5;
  uint64_t v59 = a3;
  uint64_t v56 = a6;
  uint64_t v9 = type metadata accessor for PortableEnum.KnownCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v68 = v9;
  uint64_t v58 = sub_24F3AF3B8();
  uint64_t v63 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  v69 = (char *)&v50 - v10;
  uint64_t v11 = type metadata accessor for PortableEnum.UnknownCodingKeys();
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v65 = v11;
  uint64_t v57 = sub_24F3AF3B8();
  uint64_t v62 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  unsigned __int8 v66 = (char *)&v50 - v12;
  type metadata accessor for PortableEnum.CodingKeys();
  swift_getWitnessTable();
  uint64_t v73 = sub_24F3AF3B8();
  uint64_t v70 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v14 = (char *)&v50 - v13;
  uint64_t v74 = a2;
  uint64_t v60 = a4;
  uint64_t v71 = type metadata accessor for PortableEnum();
  uint64_t v55 = *(void *)(v71 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v71);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v50 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v50 - v21;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v72 = v14;
  uint64_t v23 = v79;
  sub_24F3AF528();
  uint64_t v24 = (uint64_t)a1;
  if (!v23)
  {
    uint64_t v52 = v17;
    uint64_t v53 = v20;
    uint64_t v51 = v22;
    uint64_t v25 = v71;
    uint64_t v54 = 0;
    uint64_t v79 = v24;
    uint64_t v27 = v72;
    uint64_t v26 = v73;
    *(void *)&long long v75 = sub_24F3AF3A8();
    sub_24F3AF018();
    swift_getWitnessTable();
    *(void *)&long long v77 = sub_24F3AF298();
    *((void *)&v77 + 1) = v28;
    *(void *)&long long v78 = v29;
    *((void *)&v78 + 1) = v30;
    sub_24F3AF288();
    swift_getWitnessTable();
    sub_24F3AF1C8();
    char v31 = v75;
    if (v75 == 2 || (long long v50 = v77, v75 = v77, v76 = v78, (sub_24F3AF1D8() & 1) == 0))
    {
      uint64_t v37 = sub_24F3AF2C8();
      swift_allocError();
      uint64_t v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A04860);
      *uint64_t v39 = v25;
      sub_24F3AF338();
      sub_24F3AF2B8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
      swift_willThrow();
    }
    else if (v31)
    {
      LOBYTE(v75) = 1;
      uint64_t v41 = v69;
      uint64_t v42 = v54;
      sub_24F3AF328();
      if (!v42)
      {
        uint64_t v43 = v52;
        uint64_t v44 = v58;
        sub_24F3AF398();
        uint64_t v45 = v70;
        (*(void (**)(char *, uint64_t))(v63 + 8))(v41, v44);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v26);
        uint64_t v46 = v25;
        swift_storeEnumTagMultiPayload();
        uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
        uint64_t v49 = v43;
        uint64_t v48 = v51;
        v47(v51, v49, v25);
        goto LABEL_14;
      }
    }
    else
    {
      LOBYTE(v75) = 0;
      unint64_t v32 = v66;
      uint64_t v33 = v54;
      sub_24F3AF328();
      if (!v33)
      {
        swift_getAssociatedTypeWitness();
        uint64_t v34 = v53;
        uint64_t v35 = v57;
        sub_24F3AF398();
        uint64_t v36 = v70;
        (*(void (**)(char *, uint64_t))(v62 + 8))(v32, v35);
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v26);
        uint64_t v46 = v25;
        swift_storeEnumTagMultiPayload();
        uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
        uint64_t v48 = v51;
        v47(v51, v34, v25);
LABEL_14:
        v47(v56, v48, v46);
        goto LABEL_9;
      }
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v27, v26);
LABEL_9:
    uint64_t v24 = v79;
  }
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_24F39A888@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  return PortableEnum<>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), *(void *)(a2 + 24), *(void *)(a3 - 24), a4);
}

uint64_t sub_24F39A8B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return PortableEnum<>.encode(to:)(a1, a2, a3, *(void *)(a3 - 16), a5, *(void *)(a3 - 32));
}

uint64_t static PortableEnum<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v34 = a4;
  uint64_t v35 = a6;
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v39 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v33 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v37 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v38 = AssociatedTypeWitness;
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v32 = (char *)&v32 - v9;
  uint64_t v10 = type metadata accessor for PortableEnum();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v32 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v36 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v20 = (char *)&v32 - v19;
  uint64_t v21 = (char *)&v32 + *(int *)(v18 + 48) - v19;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v22((char *)&v32 - v19, v40, v10);
  v22(v21, v41, v10);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v22(v16, (uint64_t)v20, v10);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v28 = v37;
      uint64_t v27 = v38;
      uint64_t v29 = v32;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v32, v21, v38);
      char v25 = sub_24F3AEE88();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v28 + 8);
      v30(v29, v27);
      v30(v16, v27);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v38);
    goto LABEL_7;
  }
  v22(v14, (uint64_t)v20, v10);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v14, a3);
LABEL_7:
    char v25 = 0;
    uint64_t v11 = v36;
    uint64_t v10 = TupleTypeMetadata2;
    goto LABEL_9;
  }
  uint64_t v23 = v39;
  uint64_t v24 = v33;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v33, v21, a3);
  char v25 = sub_24F3AEE88();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v23 + 8);
  v26(v24, a3);
  v26(v14, a3);
LABEL_9:
  (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
  return v25 & 1;
}

uint64_t sub_24F39AD28()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39AD74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static PortableEnum<>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a4 - 8), *(void *)(a3 + 24), *(void *)(a4 - 16));
}

uint64_t sub_24F39AD88()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_24F39AE68(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(void *)(v5 - 8);
  if (*(void *)(v8 + 64) <= *(void *)(v7 + 64)) {
    uint64_t v9 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  }
  else {
    uint64_t v9 = *(void *)(*(void *)(v5 - 8) + 64);
  }
  uint64_t v10 = (*(unsigned char *)(v8 + 80) | *(unsigned char *)(v7 + 80));
  if (v10 <= 7
    && (unint64_t)(v9 + 1) <= 0x18
    && ((*(_DWORD *)(v8 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) == 0)
  {
    unsigned int v14 = a2[v9];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v16 = v9;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_21;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_21;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_21;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_21:
          int v18 = (v17 | (v15 << (8 * v9))) + 2;
          unsigned int v14 = v17 + 2;
          if (v9 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    if (v14 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v8 + 16))(a1, a2, v5);
      *((unsigned char *)a1 + v9) = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
      *((unsigned char *)a1 + v9) = 0;
    }
  }
  else
  {
    uint64_t v13 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  return a1;
}

uint64_t sub_24F39B068(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v5 = *(void *)(*(void *)(v3 - 8) + 64);
  if (v5 <= *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64)) {
    unint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  }
  unsigned int v6 = a1[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
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
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v6 == 1) {
    uint64_t v11 = *(void *)(v3 - 8);
  }
  else {
    uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  }
  if (v6 == 1) {
    uint64_t v12 = v3;
  }
  else {
    uint64_t v12 = AssociatedTypeWitness;
  }
  uint64_t v13 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v11 + 8);

  return v13(a1, v12);
}

uint64_t sub_24F39B1F4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  if (*(void *)(*(void *)(v5 - 8) + 64) <= *(void *)(v7 + 64)) {
    uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  }
  else {
    uint64_t v8 = *(void *)(*(void *)(v5 - 8) + 64);
  }
  unsigned int v9 = a2[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_13;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_13:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  BOOL v14 = v9 == 1;
  if (v9 == 1)
  {
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v15 = v5;
  }
  else
  {
    uint64_t v15 = AssociatedTypeWitness;
  }
  (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v15);
  *(unsigned char *)(a1 + v8) = v14;
  return a1;
}

unsigned __int8 *sub_24F39B394(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v7 = AssociatedTypeWitness;
    uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v9 = *(void *)(v5 - 8);
    if (*(void *)(v9 + 64) <= *(void *)(v8 + 64)) {
      uint64_t v10 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
    }
    else {
      uint64_t v10 = *(void *)(*(void *)(v5 - 8) + 64);
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_14;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_14:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 1) {
      uint64_t v16 = *(void *)(v5 - 8);
    }
    else {
      uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
    }
    if (v11 == 1) {
      uint64_t v17 = v5;
    }
    else {
      uint64_t v17 = AssociatedTypeWitness;
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v16 + 8))(a1, v17);
    unsigned int v18 = a2[v10];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v20 = v10;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *a2;
          goto LABEL_31;
        case 2:
          int v21 = *(unsigned __int16 *)a2;
          goto LABEL_31;
        case 3:
          int v21 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_31;
        case 4:
          int v21 = *(_DWORD *)a2;
LABEL_31:
          int v22 = (v21 | (v19 << (8 * v10))) + 2;
          unsigned int v18 = v21 + 2;
          if (v10 < 4) {
            unsigned int v18 = v22;
          }
          break;
        default:
          break;
      }
    }
    BOOL v23 = v18 == 1;
    if (v18 == 1) {
      uint64_t v24 = v9;
    }
    else {
      uint64_t v24 = v8;
    }
    if (v18 == 1) {
      uint64_t v25 = v5;
    }
    else {
      uint64_t v25 = v7;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v24 + 16))(a1, a2, v25);
    a1[v10] = v23;
  }
  return a1;
}

uint64_t sub_24F39B5F4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  if (*(void *)(*(void *)(v5 - 8) + 64) <= *(void *)(v7 + 64)) {
    uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  }
  else {
    uint64_t v8 = *(void *)(*(void *)(v5 - 8) + 64);
  }
  unsigned int v9 = a2[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_13;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_13:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  BOOL v14 = v9 == 1;
  if (v9 == 1)
  {
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v15 = v5;
  }
  else
  {
    uint64_t v15 = AssociatedTypeWitness;
  }
  (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v15);
  *(unsigned char *)(a1 + v8) = v14;
  return a1;
}

unsigned __int8 *sub_24F39B794(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v7 = AssociatedTypeWitness;
    uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v9 = *(void *)(v5 - 8);
    if (*(void *)(v9 + 64) <= *(void *)(v8 + 64)) {
      uint64_t v10 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
    }
    else {
      uint64_t v10 = *(void *)(*(void *)(v5 - 8) + 64);
    }
    unsigned int v11 = a1[v10];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v13 = v10;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a1;
          goto LABEL_14;
        case 2:
          int v14 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v14 = *(_DWORD *)a1;
LABEL_14:
          int v15 = (v14 | (v12 << (8 * v10))) + 2;
          unsigned int v11 = v14 + 2;
          if (v10 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 1) {
      uint64_t v16 = *(void *)(v5 - 8);
    }
    else {
      uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
    }
    if (v11 == 1) {
      uint64_t v17 = v5;
    }
    else {
      uint64_t v17 = AssociatedTypeWitness;
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v16 + 8))(a1, v17);
    unsigned int v18 = a2[v10];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v20 = v10;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *a2;
          goto LABEL_31;
        case 2:
          int v21 = *(unsigned __int16 *)a2;
          goto LABEL_31;
        case 3:
          int v21 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_31;
        case 4:
          int v21 = *(_DWORD *)a2;
LABEL_31:
          int v22 = (v21 | (v19 << (8 * v10))) + 2;
          unsigned int v18 = v21 + 2;
          if (v10 < 4) {
            unsigned int v18 = v22;
          }
          break;
        default:
          break;
      }
    }
    BOOL v23 = v18 == 1;
    if (v18 == 1) {
      uint64_t v24 = v9;
    }
    else {
      uint64_t v24 = v8;
    }
    if (v18 == 1) {
      uint64_t v25 = v5;
    }
    else {
      uint64_t v25 = v7;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v24 + 32))(a1, a2, v25);
    a1[v10] = v23;
  }
  return a1;
}

uint64_t sub_24F39B9F4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  unint64_t v7 = *(void *)(*(void *)(v5 - 8) + 64);
  if (v7 <= v6) {
    unint64_t v7 = v6;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  unint64_t v8 = v7 + 1;
  char v9 = 8 * (v7 + 1);
  if ((v7 + 1) <= 3)
  {
    unsigned int v12 = ((a2 + ~(-1 << v9) - 254) >> v9) + 1;
    if (HIWORD(v12))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v12 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v12 < 2)
    {
LABEL_22:
      unsigned int v14 = *((unsigned __int8 *)a1 + v7);
      if (v14 >= 2) {
        return (v14 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_22;
  }
LABEL_14:
  int v13 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v13 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v8 | v13) + 255;
}

void sub_24F39BB7C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  unint64_t v8 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (*(void *)(*(void *)(v7 - 8) + 64) > v8) {
    unint64_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  }
  size_t v9 = v8 + 1;
  if (a3 < 0xFF)
  {
    int v10 = 0;
  }
  else if (v9 <= 3)
  {
    unsigned int v13 = ((a3 + ~(-1 << (8 * v9)) - 254) >> (8 * v9)) + 1;
    if (HIWORD(v13))
    {
      int v10 = 4;
    }
    else if (v13 >= 0x100)
    {
      int v10 = 2;
    }
    else
    {
      int v10 = v13 > 1;
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
      if (v8 != -1)
      {
        int v14 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v14;
          a1[2] = BYTE2(v14);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v14;
        }
        else
        {
          *a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v8 + 1);
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
LABEL_34:
        __break(1u);
        JUMPOUT(0x24F39BD78);
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
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v9] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v9] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v8] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_24F39BDA0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (*(void *)(*(void *)(v3 - 8) + 64) > v4) {
    unint64_t v4 = *(void *)(*(void *)(v3 - 8) + 64);
  }
  uint64_t result = a1[v4];
  if (result >= 2)
  {
    if (v4 <= 3) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | ((result - 2) << (8 * v4))) + 2;
        unsigned int v9 = v7 + 2;
        if (v4 >= 4) {
          uint64_t result = v9;
        }
        else {
          uint64_t result = v8;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_24F39BEA0(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (a2 > 1)
  {
    if (*(void *)(*(void *)(v5 - 8) + 64) <= *(void *)(v6 + 64)) {
      size_t v8 = *(void *)(v6 + 64);
    }
    else {
      size_t v8 = *(void *)(*(void *)(v5 - 8) + 64);
    }
    unsigned int v9 = a2 - 2;
    if (v8 < 4)
    {
      unsigned int v10 = v9 >> (8 * v8);
      int v11 = v9 & ~(-1 << (8 * v8));
      a1[v8] = v10 + 2;
      bzero(a1, v8);
      if (v8 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if (v8 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v8] = 2;
      bzero(a1, v8);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    unint64_t v7 = *(void *)(v6 + 64);
    if (*(void *)(*(void *)(v5 - 8) + 64) > v7) {
      unint64_t v7 = *(void *)(*(void *)(v5 - 8) + 64);
    }
    a1[v7] = a2;
  }
}

uint64_t sub_24F39BFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_24F39BFE8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F39C0B4);
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

unsigned char *sub_24F39C0E0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F39C17CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F39C1A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C1C0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C1DC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C1F8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C214()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C230()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C24C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C268()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39C284()
{
  return swift_getWitnessTable();
}

double sub_24F39C2A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  uint64_t v8 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unsigned int v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a4 = v11;
  *(void *)(a4 + 8) = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v13);
  AnyEquatable.init<A>(_:)((uint64_t)v10, a2, a3, (uint64_t *)v17);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, a2);
  double result = *(double *)v17;
  long long v15 = v17[1];
  *(_OWORD *)(a4 + 16) = v17[0];
  *(_OWORD *)(a4 + 32) = v15;
  *(void *)(a4 + 48) = v18;
  return result;
}

uint64_t EquatableAction.execute(_:)()
{
  return (*v0)();
}

uint64_t EquatableAction.execute<>()()
{
  return (*v0)();
}

double static EquatableAction.identified<A>(_:action:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v12);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  swift_retain();
  return sub_24F39C2A8((uint64_t)v12, a4, a5, a6);
}

uint64_t sub_24F39C540()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F39C578()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

double static EquatableAction.identified<A>(_:action:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v8);
  swift_retain();
  return sub_24F39C2A8((uint64_t)v8, a2, a3, a4);
}

uint64_t static EquatableAction.== infix(_:_:)(void *a1, uint64_t a2)
{
  int v3 = (void *)(a2 + 16);
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  unsigned int v6 = __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = __swift_project_boxed_opaque_existential_1(v3, v7);
  unint64_t v9 = sub_24F395B74();
  return sub_24F3958D8((uint64_t)v6, (uint64_t)v8, (uint64_t)&type metadata for AnyEquatable, v4, v7, v9, v5) & 1;
}

uint64_t sub_24F39C740(uint64_t a1)
{
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t sub_24F39C77C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *sub_24F39C804(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
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

uint64_t sub_24F39C874(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_24F39C8C4(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24F39C90C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for EquatableAction()
{
  return __swift_instantiateGenericMetadata();
}

BOOL static GatedResource.FetchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GatedResource.FetchError.hash(into:)()
{
  return sub_24F3AF4E8();
}

uint64_t GatedResource.FetchError.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t sub_24F39CA04()
{
  return sub_24F3AF508();
}

uint64_t sub_24F39CA40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for GatedResource.State();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24F39CAF0(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for GatedResource.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t GatedResource.__allocating_init(ttl:fetchHandler:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = swift_allocObject();
  GatedResource.init(ttl:fetchHandler:)(a1, a2, a3);
  return v6;
}

uint64_t GatedResource.init(ttl:fetchHandler:)(uint64_t a1, uint64_t a2, double a3)
{
  swift_defaultActor_initialize();
  type metadata accessor for GatedResource.State();
  swift_storeEnumTagMultiPayload();
  *(double *)(v3 + *(void *)(*(void *)v3 + 104)) = a3;
  uint64_t v7 = (void *)(v3 + *(void *)(*(void *)v3 + 112));
  void *v7 = a1;
  v7[1] = a2;
  return v3;
}

uint64_t type metadata accessor for GatedResource.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F39CCE0()
{
  uint64_t v0 = type metadata accessor for GatedResource.State();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v11 - v1;
  sub_24F39CA40((uint64_t)&v11 - v1);
  uint64_t v3 = 0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v5 = sub_24F3AF518();
      uint64_t v6 = sub_24F3AEDB8();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(&v2[*(int *)(TupleTypeMetadata2 + 48)], v6);
      (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v2, v5);
      uint64_t v3 = 0;
      break;
    case 2u:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v8 = sub_24F3AF518();
      sub_24F3AF058();
      sub_24F3AF018();
      uint64_t v4 = *(void *)&v2[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v2, v8);
      goto LABEL_5;
    case 3u:
      return v3;
    default:
      uint64_t v4 = *(void *)v2;
LABEL_5:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v9 = sub_24F3AF058();
      uint64_t v3 = MEMORY[0x25335BC40](v4, v9);
      swift_bridgeObjectRelease();
      break;
  }
  return v3;
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

uint64_t sub_24F39CFB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = type metadata accessor for GatedResource.State();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (void *)((char *)v15 - v6);
  sub_24F39CA40((uint64_t)v15 - v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v10 = sub_24F3AF518();
      uint64_t v11 = sub_24F3AEDB8();
      uint64_t v12 = (char *)v7 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      swift_storeEnumTagMultiPayload();
      sub_24F39CAF0((uint64_t)v5);
      (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v12, v11);
      uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
      break;
    case 2:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v13 = sub_24F3AF518();
      sub_24F3AF058();
      sub_24F3AF018();
      uint64_t v9 = *(uint64_t *)((char *)v7 + *(int *)(swift_getTupleTypeMetadata2() + 48));
      (*(void (**)(uint64_t *, uint64_t))(*(void *)(v13 - 8) + 8))(v7, v13);
      goto LABEL_5;
    case 3:
      return result;
    default:
      uint64_t v9 = *v7;
LABEL_5:
      swift_storeEnumTagMultiPayload();
      uint64_t v14 = sub_24F39CAF0((uint64_t)v5);
      v15[1] = v9;
      MEMORY[0x270FA5388](v14);
      v15[-2] = v1;
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      sub_24F3AF058();
      sub_24F3AF018();
      swift_getWitnessTable();
      sub_24F3AEF38();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_24F39D308()
{
  type metadata accessor for GatedResource.FetchError();
  swift_getWitnessTable();
  swift_allocError();
  unsigned char *v0 = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  sub_24F3AF058();
  return sub_24F3AF038();
}

uint64_t sub_24F39D3BC()
{
  return sub_24F39D308();
}

uint64_t sub_24F39D3D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = type metadata accessor for GatedResource.State();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  uint64_t v23 = v3;
  uint64_t v7 = sub_24F3AF518();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - v12;
  sub_24F39CA40((uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v21 = v2;
      uint64_t v18 = sub_24F3AEDB8();
      unsigned int v19 = &v6[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v16(v13, v6, v7);
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v19, v18);
      uint64_t v15 = v23;
      goto LABEL_6;
    case 2u:
      uint64_t v21 = v2;
      uint64_t v15 = v23;
      sub_24F3AF058();
      sub_24F3AF018();
      swift_getTupleTypeMetadata2();
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v16(v13, v6, v7);
LABEL_6:
      v16(v11, v13, v7);
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_7;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v22, v11, v15);
      break;
    case 3u:
      type metadata accessor for GatedResource.FetchError();
      swift_getWitnessTable();
      swift_allocError();
      *uint64_t v17 = 1;
      goto LABEL_7;
    default:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
      type metadata accessor for GatedResource.FetchError();
      swift_getWitnessTable();
      swift_allocError();
      *uint64_t v14 = 2;
LABEL_7:
      uint64_t result = swift_willThrow();
      break;
  }
  return result;
}

uint64_t type metadata accessor for GatedResource.FetchError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F39D800(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x270FA2498](sub_24F39D848, v1, 0);
}

uint64_t sub_24F39D848()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v0[4] + 80);
  type metadata accessor for GatedResource();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24F39D950;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return MEMORY[0x270FA2360](v5, v1, WitnessTable, 0x29286863746566, 0xE700000000000000, sub_24F39E53C, v6, v2);
}

uint64_t sub_24F39D950()
{
  uint64_t v2 = (void *)*v1;
  v2[6] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[3];
    return MEMORY[0x270FA2498](sub_24F39DA84, v3, 0);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24F39DA84()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for GatedResource()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F39DAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v80 = a1;
  uint64_t v2 = *(void *)(*(void *)a2 + 80);
  uint64_t v73 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](a1);
  uint64_t v71 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v72 = (char *)&v69 - v5;
  uint64_t v6 = sub_24F3AEDB8();
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v69 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v74 = (char *)&v69 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  uint64_t v14 = sub_24F3AF518();
  uint64_t v77 = *(void *)(v14 - 8);
  uint64_t v78 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t *)((char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  long long v76 = (char *)&v69 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v69 - v20;
  uint64_t v81 = type metadata accessor for GatedResource.State();
  uint64_t v22 = MEMORY[0x270FA5388](v81);
  uint64_t v79 = (uint64_t *)((char *)&v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v69 - v24;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24F39CA40((uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v46 = v78;
      uint64_t v47 = &v25[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v25, v46);
      uint64_t v48 = v75;
      (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v74, v47, v6);
      sub_24F3AED88();
      sub_24F3AEDA8();
      LOBYTE(v46) = sub_24F3AED98();
      long long v50 = *(void (**)(char *, uint64_t))(v48 + 8);
      uint64_t v49 = v48 + 8;
      uint64_t v51 = v9;
      uint64_t v52 = v50;
      v50(v51, v6);
      v50(v12, v6);
      if (v46)
      {
        uint64_t v54 = v76;
        uint64_t v53 = v77;
        uint64_t v55 = v78;
        (*(void (**)(uint64_t *, char *, uint64_t))(v77 + 16))(v17, v76, v78);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v82 = *v17;
          sub_24F3AF058();
          sub_24F3AF038();
          v52(v74, v6);
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v54, v55);
        }
        else
        {
          uint64_t v66 = v73;
          char v67 = *(void (**)(char *, uint64_t *, uint64_t))(v73 + 32);
          uint64_t v70 = v52;
          uint64_t v68 = v72;
          v67(v72, v17, v2);
          (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v71, v68, v2);
          sub_24F3AF058();
          sub_24F3AF048();
          (*(void (**)(char *, uint64_t))(v66 + 8))(v68, v2);
          v70(v74, v6);
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v76, v55);
        }
      }
      else
      {
        uint64_t v56 = sub_24F3AF058();
        sub_24F3AF018();
        uint64_t v57 = v78;
        uint64_t v58 = *(int *)(swift_getTupleTypeMetadata2() + 48);
        uint64_t v59 = v77;
        uint64_t v60 = *(void (**)(uint64_t *, char *, uint64_t))(v77 + 16);
        uint64_t v75 = v49;
        uint64_t v70 = v52;
        uint64_t v61 = (uint64_t)v79;
        uint64_t v62 = v76;
        v60(v79, v76, v57);
        sub_24F3AF448();
        uint64_t v63 = *(void *)(v56 - 8);
        swift_allocObject();
        uint64_t v64 = sub_24F3AEFD8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v65, v80, v56);
        sub_24F3AF018();
        *(void *)(v61 + v58) = v64;
        swift_storeEnumTagMultiPayload();
        sub_24F39CAF0(v61);
        sub_24F39EBD4();
        v70(v74, v6);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v62, v57);
      }
      break;
    case 2u:
      uint64_t v32 = sub_24F3AF058();
      sub_24F3AF018();
      uint64_t v33 = v78;
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      uint64_t v35 = v77;
      (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v21, v25, v33);
      uint64_t v36 = *(int *)(TupleTypeMetadata2 + 48);
      uint64_t v37 = (uint64_t)v79;
      (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 16))(v79, v21, v33);
      sub_24F3AF448();
      uint64_t v38 = *(void *)(v32 - 8);
      swift_allocObject();
      sub_24F3AEFD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v80, v32);
      sub_24F3AF018();
      uint64_t v40 = sub_24F3AEFE8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v37 + v36) = v40;
      swift_storeEnumTagMultiPayload();
      sub_24F39CAF0(v37);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v21, v33);
      break;
    case 3u:
      uint64_t v41 = sub_24F3AF058();
      sub_24F3AF448();
      uint64_t v42 = *(void *)(v41 - 8);
      swift_allocObject();
      uint64_t v43 = sub_24F3AEFD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v44, v80, v41);
      sub_24F3AF018();
      uint64_t v45 = (uint64_t)v79;
      *uint64_t v79 = v43;
      swift_storeEnumTagMultiPayload();
      sub_24F39CAF0(v45);
      uint64_t result = sub_24F39EBD4();
      break;
    default:
      uint64_t v26 = sub_24F3AF058();
      sub_24F3AF448();
      uint64_t v27 = *(void *)(v26 - 8);
      swift_allocObject();
      sub_24F3AEFD8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v28, v80, v26);
      sub_24F3AF018();
      uint64_t v29 = sub_24F3AEFE8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v30 = (uint64_t)v79;
      *uint64_t v79 = v29;
      swift_storeEnumTagMultiPayload();
      uint64_t result = sub_24F39CAF0(v30);
      break;
  }
  return result;
}

uint64_t sub_24F39E53C(uint64_t a1)
{
  return sub_24F39DAB4(a1, v1);
}

uint64_t sub_24F39E544(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = type metadata accessor for GatedResource.State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v18 - v8;
  sub_24F39CA40((uint64_t)v18 - v8);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v12 = sub_24F3AF518();
      uint64_t v13 = sub_24F3AEDB8();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(&v9[*(int *)(TupleTypeMetadata2 + 48)], v13);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v9, v12);
      break;
    case 2:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v15 = sub_24F3AF518();
      sub_24F3AF058();
      sub_24F3AF018();
      uint64_t v11 = *(void *)&v9[*(int *)(swift_getTupleTypeMetadata2() + 48)];
      (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v9, v15);
      goto LABEL_5;
    case 3:
      return result;
    default:
      uint64_t v11 = *(void *)v9;
LABEL_5:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
      uint64_t v16 = sub_24F3AF518();
      sub_24F3AEDB8();
      swift_getTupleTypeMetadata2();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v7, a1, v16);
      sub_24F3AEDA8();
      swift_storeEnumTagMultiPayload();
      uint64_t v17 = sub_24F39CAF0((uint64_t)v7);
      v18[1] = v11;
      MEMORY[0x270FA5388](v17);
      v18[-2] = v3;
      v18[-1] = a1;
      sub_24F3AF058();
      sub_24F3AF018();
      swift_getWitnessTable();
      sub_24F3AEF38();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_24F39E910(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  uint64_t v3 = sub_24F3AF058();
  return sub_24F39E998(a2, v3);
}

uint64_t sub_24F39E97C(uint64_t a1)
{
  return sub_24F39E910(a1, *(void *)(v1 + 24));
}

uint64_t sub_24F39E998(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24F3AF518();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_24F3AF038();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_24F3AF048();
  }
}

uint64_t sub_24F39EBD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24F3AF078();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_24F397C84((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_24F3AF068();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_24F3AF028();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_269A04C28;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24F39EE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = *(void *)(*(void *)a4 + 80);
  v4[3] = v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  uint64_t v6 = sub_24F3AF518();
  v4[4] = v6;
  v4[5] = *(void *)(v6 - 8);
  v4[6] = swift_task_alloc();
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F39EF54, 0, 0);
}

uint64_t sub_24F39EF54()
{
  uint64_t v1 = (void *)(v0[2] + *(void *)(*(void *)v0[2] + 112));
  uint64_t v5 = (uint64_t (*)(uint64_t))(*v1 + *(int *)*v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[9] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F39F040;
  uint64_t v3 = v0[8];
  return v5(v3);
}

uint64_t sub_24F39F040()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24F39F308;
  }
  else {
    uint64_t v2 = sub_24F39F154;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24F39F154()
{
  uint64_t v1 = v0[2];
  (*(void (**)(void, void, void))(v0[7] + 16))(v0[6], v0[8], v0[3]);
  swift_storeEnumTagMultiPayload();
  return MEMORY[0x270FA2498](sub_24F39F1F0, v1, 0);
}

uint64_t sub_24F39F1F0()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_24F39E544(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24F39F284, 0, 0);
}

uint64_t sub_24F39F284()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[3]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24F39F308()
{
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 16);
  **(void **)(v0 + 48) = v1;
  swift_storeEnumTagMultiPayload();
  id v3 = v1;
  return MEMORY[0x270FA2498](sub_24F39F38C, v2, 0);
}

uint64_t sub_24F39F38C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_24F39E544(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24F39F420, 0, 0);
}

uint64_t sub_24F39F420()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t GatedResource.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = type metadata accessor for GatedResource.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t GatedResource.__deallocating_deinit()
{
  GatedResource.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t GatedResource.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24F39F57C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F39F598()
{
  return GatedResource.unownedExecutor.getter();
}

uint64_t sub_24F39F5B4()
{
  uint64_t result = type metadata accessor for GatedResource.State();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GatedResource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GatedResource);
}

uint64_t dispatch thunk of GatedResource.__allocating_init(ttl:fetchHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of GatedResource.pendingCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of GatedResource.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of GatedResource.query()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of GatedResource.fetch()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 176) + **(int **)(*(void *)v1 + 176));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F397B6C;
  return v6(a1);
}

uint64_t dispatch thunk of GatedResource.release(result:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

unsigned char *sub_24F39F868(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F39F934);
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

uint64_t sub_24F39F95C()
{
  uint64_t v5 = MEMORY[0x263F8CF50] + 64;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269A04A88);
  uint64_t result = sub_24F3AF518();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24F3AEDB8();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      unsigned int v6 = &v4;
      swift_getTupleTypeLayout2();
      uint64_t v7 = &v3;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

char *sub_24F39FA80(char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = 8;
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = *(void *)(v6 + 64);
  }
  uint64_t v9 = sub_24F3AEDB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v8 + 1 + v11;
  unint64_t v13 = (v12 & ~v11) + *(void *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v13 > 8) {
    uint64_t v7 = v13;
  }
  size_t v14 = v7 + 1;
  unsigned int v15 = v11 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v15 > 7 || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0 || v14 > 0x18)
  {
    uint64_t v18 = *(char **)a2;
    *(void *)a1 = *(void *)a2;
    a1 = &v18[((v15 | 7) + 16) & ~(unint64_t)(v15 | 7)];
    swift_retain();
    return a1;
  }
  uint64_t v20 = v9;
  unsigned int v21 = a2[v7];
  unsigned int v22 = v21 - 3;
  if (v21 >= 3)
  {
    if (v7 <= 3) {
      uint64_t v23 = v7;
    }
    else {
      uint64_t v23 = 4;
    }
    switch(v23)
    {
      case 1:
        int v24 = *a2;
        if (v7 >= 4) {
          goto LABEL_41;
        }
        goto LABEL_28;
      case 2:
        int v24 = *(unsigned __int16 *)a2;
        if (v7 >= 4) {
          goto LABEL_41;
        }
        goto LABEL_28;
      case 3:
        int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v7 < 4) {
          goto LABEL_28;
        }
        goto LABEL_41;
      case 4:
        int v24 = *(_DWORD *)a2;
        if (v7 < 4)
        {
LABEL_28:
          unsigned int v21 = (v24 | (v22 << (8 * v7))) + 3;
          break;
        }
LABEL_41:
        unsigned int v21 = v24 + 3;
        if (v21 == 2) {
          goto LABEL_42;
        }
        goto LABEL_30;
      default:
        break;
    }
  }
  if (v21 == 2)
  {
LABEL_42:
    unsigned int v29 = a2[v8];
    unsigned int v30 = v29 - 2;
    if (v29 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v31 = v8;
      }
      else {
        uint64_t v31 = 4;
      }
      switch(v31)
      {
        case 1:
          int v32 = *a2;
          break;
        case 2:
          int v32 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v32 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v32 = *(_DWORD *)a2;
          break;
        default:
          goto LABEL_63;
      }
      if (v8 < 4)
      {
        if ((v32 | (v30 << (8 * v8))) == 0xFFFFFFFF) {
          goto LABEL_64;
        }
        goto LABEL_66;
      }
      unsigned int v29 = v32 + 2;
    }
LABEL_63:
    if (v29 == 1)
    {
LABEL_64:
      uint64_t v37 = *(void *)a2;
      id v38 = *(id *)a2;
      *(void *)a1 = v37;
      char v39 = 1;
LABEL_67:
      a1[v8] = v39;
      *(void *)((unint64_t)&a1[v8 + 8] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v8 + 8] & 0xFFFFFFFFFFFFFFF8);
      a1[v7] = 2;
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_66:
    (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
    char v39 = 0;
    goto LABEL_67;
  }
LABEL_30:
  if (v21 == 1)
  {
    unsigned int v25 = a2[v8];
    unsigned int v26 = v25 - 2;
    if (v25 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v27 = v8;
      }
      else {
        uint64_t v27 = 4;
      }
      switch(v27)
      {
        case 1:
          int v28 = *a2;
          goto LABEL_51;
        case 2:
          int v28 = *(unsigned __int16 *)a2;
          goto LABEL_51;
        case 3:
          int v28 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_51;
        case 4:
          int v28 = *(_DWORD *)a2;
LABEL_51:
          if (v8 < 4) {
            unsigned int v25 = (v28 | (v26 << (8 * v8))) + 2;
          }
          else {
            unsigned int v25 = v28 + 2;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v33 = ~v11;
    if (v25 == 1)
    {
      id v34 = *(id *)a2;
      id v35 = *(id *)a2;
      *(void *)a1 = v34;
      char v36 = 1;
    }
    else
    {
      (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v36 = 0;
    }
    a1[v8] = v36;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((unint64_t)&a1[v12] & v33, (unint64_t)&a2[v12] & v33, v20);
    a1[v7] = 1;
  }
  else if (v21)
  {
    memcpy(a1, a2, v14);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    a1[v7] = 0;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24F39FED0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 64);
  }
  uint64_t v6 = sub_24F3AEDB8();
  uint64_t result = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(result + 80);
  uint64_t v9 = v5 + 1 + v8;
  unint64_t v10 = (v9 & ~v8) + *(void *)(result + 64);
  if (v10 <= (v5 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v10 <= 8) {
    unint64_t v10 = 8;
  }
  unsigned int v11 = a1[v10];
  unsigned int v12 = v11 - 3;
  if (v11 >= 3)
  {
    if (v10 <= 3) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 4;
    }
    switch(v13)
    {
      case 1:
        int v14 = *a1;
        goto LABEL_17;
      case 2:
        int v14 = *(unsigned __int16 *)a1;
        goto LABEL_17;
      case 3:
        int v14 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_17;
      case 4:
        int v14 = *(_DWORD *)a1;
LABEL_17:
        int v15 = (v14 | (v12 << (8 * v10))) + 3;
        unsigned int v11 = v14 + 3;
        if (v10 < 4) {
          unsigned int v11 = v15;
        }
        break;
      default:
        break;
    }
  }
  if (v11 == 2)
  {
    unsigned int v16 = a1[v5];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v18 = v5;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *a1;
          goto LABEL_40;
        case 2:
          int v19 = *(unsigned __int16 *)a1;
          goto LABEL_40;
        case 3:
          int v19 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_40;
        case 4:
          int v19 = *(_DWORD *)a1;
LABEL_40:
          int v24 = (v19 | (v17 << (8 * v5))) + 2;
          unsigned int v16 = v19 + 2;
          if (v5 < 4) {
            unsigned int v16 = v24;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1) {

    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
    }
LABEL_45:
    return swift_bridgeObjectRelease();
  }
  if (v11 != 1)
  {
    if (v11) {
      return result;
    }
    goto LABEL_45;
  }
  unsigned int v20 = a1[v5];
  unsigned int v21 = v20 - 2;
  if (v20 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v22 = v5;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *a1;
        if (v5 < 4) {
          goto LABEL_51;
        }
        goto LABEL_53;
      case 2:
        int v23 = *(unsigned __int16 *)a1;
        if (v5 >= 4) {
          goto LABEL_53;
        }
        goto LABEL_51;
      case 3:
        int v23 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v5 < 4) {
          goto LABEL_51;
        }
        goto LABEL_53;
      case 4:
        int v23 = *(_DWORD *)a1;
        if (v5 < 4) {
LABEL_51:
        }
          unsigned int v20 = (v23 | (v21 << (8 * v5))) + 2;
        else {
LABEL_53:
        }
          unsigned int v20 = v23 + 2;
        break;
      default:
        break;
    }
  }
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v25 = ~v8;
  if (v20 == 1) {

  }
  else {
    (*(void (**)(unsigned __int8 *, uint64_t))(v4 + 8))(a1, v3);
  }
  unsigned int v26 = *(uint64_t (**)(unint64_t, uint64_t))(v27 + 8);

  return v26((unint64_t)&a1[v9] & v25, v6);
}

void *sub_24F3A029C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = 8;
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = *(void *)(v6 + 64);
  }
  uint64_t v9 = sub_24F3AEDB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v8 + 1 + v11;
  unint64_t v13 = (v12 & ~v11) + *(void *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v13 > 8) {
    uint64_t v7 = v13;
  }
  unsigned int v14 = a2[v7];
  unsigned int v15 = v14 - 3;
  if (v14 >= 3)
  {
    if (v7 <= 3) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_17;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_17;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_17;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_17:
        int v18 = (v17 | (v15 << (8 * v7))) + 3;
        unsigned int v14 = v17 + 3;
        if (v7 < 4) {
          unsigned int v14 = v18;
        }
        break;
      default:
        break;
    }
  }
  if (v14 == 2)
  {
    unsigned int v19 = a2[v8];
    unsigned int v20 = v19 - 2;
    if (v19 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v21 = v8;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          if (v8 >= 4) {
            goto LABEL_45;
          }
          goto LABEL_41;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          if (v8 >= 4) {
            goto LABEL_45;
          }
          goto LABEL_41;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_41;
          }
          goto LABEL_45;
        case 4:
          int v22 = *(_DWORD *)a2;
          if (v8 < 4)
          {
LABEL_41:
            unsigned int v19 = (v22 | (v20 << (8 * v8))) + 2;
            break;
          }
LABEL_45:
          if (v22 != -1) {
            goto LABEL_46;
          }
          goto LABEL_43;
        default:
          break;
      }
    }
    if (v19 == 1)
    {
LABEL_43:
      uint64_t v27 = *(void *)a2;
      id v28 = *(id *)a2;
      *a1 = v27;
      char v29 = 1;
    }
    else
    {
LABEL_46:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v29 = 0;
    }
    *((unsigned char *)a1 + v8) = v29;
    *(void *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v8 + 8] & 0xFFFFFFFFFFFFFFF8);
    *((unsigned char *)a1 + v7) = 2;
    swift_bridgeObjectRetain();
  }
  else if (v14 == 1)
  {
    unsigned int v23 = a2[v8];
    unsigned int v24 = v23 - 2;
    if (v23 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v25 = v8;
      }
      else {
        uint64_t v25 = 4;
      }
      switch(v25)
      {
        case 1:
          int v26 = *a2;
          if (v8 < 4) {
            goto LABEL_51;
          }
          goto LABEL_53;
        case 2:
          int v26 = *(unsigned __int16 *)a2;
          if (v8 >= 4) {
            goto LABEL_53;
          }
          goto LABEL_51;
        case 3:
          int v26 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_51;
          }
          goto LABEL_53;
        case 4:
          int v26 = *(_DWORD *)a2;
          if (v8 < 4) {
LABEL_51:
          }
            unsigned int v23 = (v26 | (v24 << (8 * v8))) + 2;
          else {
LABEL_53:
          }
            unsigned int v23 = v26 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v30 = ~v11;
    if (v23 == 1)
    {
      id v31 = *(id *)a2;
      id v32 = *(id *)a2;
      *a1 = v31;
      char v33 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v33 = 0;
    }
    *((unsigned char *)a1 + v8) = v33;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))(((unint64_t)a1 + v12) & v30, (unint64_t)&a2[v12] & v30, v9);
    *((unsigned char *)a1 + v7) = 1;
  }
  else if (v14)
  {
    memcpy(a1, a2, v7 + 1);
  }
  else
  {
    *a1 = *(void *)a2;
    *((unsigned char *)a1 + v7) = 0;
    swift_bridgeObjectRetain();
  }
  return a1;
}

unsigned __int8 *sub_24F3A06B0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v6 = 8;
  if (*(void *)(v45 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v45 + 64);
  }
  uint64_t v8 = sub_24F3AEDB8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v7 + 1 + v10;
  unint64_t v12 = (v11 & ~v10) + *(void *)(v9 + 64);
  if (v12 <= (v7 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v12 = (v7 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v12 > 8) {
    uint64_t v6 = v12;
  }
  unsigned int v13 = a1[v6];
  unsigned int v14 = v13 - 3;
  if (v13 >= 3)
  {
    if (v6 <= 3) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = 4;
    }
    switch(v15)
    {
      case 1:
        int v16 = *a1;
        if (v6 < 4) {
          goto LABEL_17;
        }
        goto LABEL_21;
      case 2:
        int v16 = *(unsigned __int16 *)a1;
        if (v6 < 4) {
          goto LABEL_17;
        }
        goto LABEL_21;
      case 3:
        int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v6 < 4) {
          goto LABEL_17;
        }
        goto LABEL_21;
      case 4:
        int v16 = *(_DWORD *)a1;
        if (v6 < 4) {
LABEL_17:
        }
          unsigned int v13 = (v16 | (v14 << (8 * v6))) + 3;
        else {
LABEL_21:
        }
          unsigned int v13 = v16 + 3;
        break;
      default:
        break;
    }
  }
  uint64_t v17 = ~v10;
  if (v13 == 2)
  {
    unsigned int v18 = a1[v7];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v20 = v7;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *a1;
          break;
        case 2:
          int v21 = *(unsigned __int16 *)a1;
          break;
        case 3:
          int v21 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          break;
        case 4:
          int v21 = *(_DWORD *)a1;
          break;
        default:
          goto LABEL_43;
      }
      if (v7 < 4)
      {
        if ((v21 | (v19 << (8 * v7))) == 0xFFFFFFFF) {
          goto LABEL_44;
        }
        goto LABEL_46;
      }
      unsigned int v18 = v21 + 2;
    }
LABEL_43:
    if (v18 == 1)
    {
LABEL_44:

LABEL_47:
      swift_bridgeObjectRelease();
      goto LABEL_58;
    }
LABEL_46:
    (*(void (**)(unsigned __int8 *, uint64_t))(v45 + 8))(a1, v5);
    goto LABEL_47;
  }
  if (v13 != 1)
  {
    if (v13) {
      goto LABEL_58;
    }
    goto LABEL_47;
  }
  unsigned int v22 = a1[v7];
  unsigned int v23 = v22 - 2;
  if (v22 >= 2)
  {
    if (v7 <= 3) {
      uint64_t v24 = v7;
    }
    else {
      uint64_t v24 = 4;
    }
    switch(v24)
    {
      case 1:
        int v25 = *a1;
        break;
      case 2:
        int v25 = *(unsigned __int16 *)a1;
        break;
      case 3:
        int v25 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        break;
      case 4:
        int v25 = *(_DWORD *)a1;
        break;
      default:
        goto LABEL_53;
    }
    if (v7 < 4)
    {
      if ((v25 | (v23 << (8 * v7))) == 0xFFFFFFFF) {
        goto LABEL_54;
      }
LABEL_56:
      (*(void (**)(unsigned __int8 *, uint64_t))(v45 + 8))(a1, v5);
      goto LABEL_57;
    }
    unsigned int v22 = v25 + 2;
  }
LABEL_53:
  if (v22 != 1) {
    goto LABEL_56;
  }
LABEL_54:

LABEL_57:
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v17, v8);
LABEL_58:
  unsigned int v26 = a2[v6];
  unsigned int v27 = v26 - 3;
  if (v26 >= 3)
  {
    if (v6 <= 3) {
      uint64_t v28 = v6;
    }
    else {
      uint64_t v28 = 4;
    }
    switch(v28)
    {
      case 1:
        int v29 = *a2;
        if (v6 >= 4) {
          goto LABEL_81;
        }
        goto LABEL_66;
      case 2:
        int v29 = *(unsigned __int16 *)a2;
        if (v6 < 4) {
          goto LABEL_66;
        }
        goto LABEL_81;
      case 3:
        int v29 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v6 < 4) {
          goto LABEL_66;
        }
        goto LABEL_81;
      case 4:
        int v29 = *(_DWORD *)a2;
        if (v6 < 4)
        {
LABEL_66:
          unsigned int v26 = (v29 | (v27 << (8 * v6))) + 3;
          break;
        }
LABEL_81:
        unsigned int v26 = v29 + 3;
        if (v26 == 2) {
          goto LABEL_82;
        }
        goto LABEL_68;
      default:
        break;
    }
  }
  if (v26 == 2)
  {
LABEL_82:
    unsigned int v34 = a2[v7];
    unsigned int v35 = v34 - 2;
    if (v34 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v36 = v7;
      }
      else {
        uint64_t v36 = 4;
      }
      switch(v36)
      {
        case 1:
          int v37 = *a2;
          break;
        case 2:
          int v37 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v37 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v37 = *(_DWORD *)a2;
          break;
        default:
          goto LABEL_103;
      }
      if (v7 < 4)
      {
        if ((v37 | (v35 << (8 * v7))) == 0xFFFFFFFF) {
          goto LABEL_104;
        }
        goto LABEL_106;
      }
      unsigned int v34 = v37 + 2;
    }
LABEL_103:
    if (v34 == 1)
    {
LABEL_104:
      uint64_t v41 = *(void *)a2;
      id v42 = *(id *)a2;
      *(void *)a1 = v41;
      char v43 = 1;
LABEL_107:
      a1[v7] = v43;
      *(void *)((unint64_t)&a1[v7 + 8] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v7 + 8] & 0xFFFFFFFFFFFFFFF8);
      a1[v6] = 2;
      goto LABEL_108;
    }
LABEL_106:
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v45 + 16))(a1, a2, v5);
    char v43 = 0;
    goto LABEL_107;
  }
LABEL_68:
  if (v26 == 1)
  {
    unsigned int v30 = a2[v7];
    unsigned int v31 = v30 - 2;
    if (v30 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v32 = v7;
      }
      else {
        uint64_t v32 = 4;
      }
      switch(v32)
      {
        case 1:
          int v33 = *a2;
          break;
        case 2:
          int v33 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v33 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v33 = *(_DWORD *)a2;
          break;
        default:
          goto LABEL_93;
      }
      if (v7 < 4)
      {
        if ((v33 | (v31 << (8 * v7))) == 0xFFFFFFFF) {
          goto LABEL_94;
        }
        goto LABEL_96;
      }
      unsigned int v30 = v33 + 2;
    }
LABEL_93:
    if (v30 == 1)
    {
LABEL_94:
      id v38 = *(id *)a2;
      id v39 = *(id *)a2;
      *(void *)a1 = v38;
      char v40 = 1;
LABEL_97:
      a1[v7] = v40;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((unint64_t)&a1[v11] & v17, (unint64_t)&a2[v11] & v17, v8);
      a1[v6] = 1;
      return a1;
    }
LABEL_96:
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v45 + 16))(a1, a2, v5);
    char v40 = 0;
    goto LABEL_97;
  }
  if (!v26)
  {
    *(void *)a1 = *(void *)a2;
    a1[v6] = 0;
LABEL_108:
    swift_bridgeObjectRetain();
    return a1;
  }
  memcpy(a1, a2, v6 + 1);
  return a1;
}

void *sub_24F3A0D50(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = 8;
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = *(void *)(v6 + 64);
  }
  uint64_t v9 = sub_24F3AEDB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v8 + 1 + v11;
  unint64_t v13 = (v12 & ~v11) + *(void *)(v10 + 64);
  if (v13 <= (v8 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v13 > 8) {
    uint64_t v7 = v13;
  }
  unsigned int v14 = a2[v7];
  unsigned int v15 = v14 - 3;
  if (v14 >= 3)
  {
    if (v7 <= 3) {
      uint64_t v16 = v7;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_17;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_17;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_17;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_17:
        int v18 = (v17 | (v15 << (8 * v7))) + 3;
        unsigned int v14 = v17 + 3;
        if (v7 < 4) {
          unsigned int v14 = v18;
        }
        break;
      default:
        break;
    }
  }
  if (v14 == 2)
  {
    unsigned int v19 = a2[v8];
    unsigned int v20 = v19 - 2;
    if (v19 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v21 = v8;
      }
      else {
        uint64_t v21 = 4;
      }
      switch(v21)
      {
        case 1:
          int v22 = *a2;
          if (v8 >= 4) {
            goto LABEL_45;
          }
          goto LABEL_39;
        case 2:
          int v22 = *(unsigned __int16 *)a2;
          if (v8 < 4) {
            goto LABEL_39;
          }
          goto LABEL_45;
        case 3:
          int v22 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_39;
          }
          goto LABEL_45;
        case 4:
          int v22 = *(_DWORD *)a2;
          if (v8 < 4)
          {
LABEL_39:
            unsigned int v19 = (v22 | (v20 << (8 * v8))) + 2;
            break;
          }
LABEL_45:
          if (v22 != -1) {
            goto LABEL_46;
          }
          goto LABEL_41;
        default:
          break;
      }
    }
    if (v19 == 1)
    {
LABEL_41:
      *a1 = *(void *)a2;
      char v27 = 1;
    }
    else
    {
LABEL_46:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v27 = 0;
    }
    *((unsigned char *)a1 + v8) = v27;
    *(void *)(((unint64_t)a1 + v8 + 8) & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v8 + 8] & 0xFFFFFFFFFFFFFFF8);
    char v28 = 2;
    goto LABEL_58;
  }
  if (v14 == 1)
  {
    unsigned int v23 = a2[v8];
    unsigned int v24 = v23 - 2;
    if (v23 >= 2)
    {
      if (v8 <= 3) {
        uint64_t v25 = v8;
      }
      else {
        uint64_t v25 = 4;
      }
      switch(v25)
      {
        case 1:
          int v26 = *a2;
          if (v8 < 4) {
            goto LABEL_49;
          }
          goto LABEL_53;
        case 2:
          int v26 = *(unsigned __int16 *)a2;
          if (v8 < 4) {
            goto LABEL_49;
          }
          goto LABEL_53;
        case 3:
          int v26 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v8 < 4) {
            goto LABEL_49;
          }
          goto LABEL_53;
        case 4:
          int v26 = *(_DWORD *)a2;
          if (v8 < 4) {
LABEL_49:
          }
            unsigned int v23 = (v26 | (v24 << (8 * v8))) + 2;
          else {
LABEL_53:
          }
            unsigned int v23 = v26 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v29 = ~v11;
    if (v23 == 1)
    {
      *a1 = *(void *)a2;
      char v30 = 1;
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v30 = 0;
    }
    *((unsigned char *)a1 + v8) = v30;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(((unint64_t)a1 + v12) & v29, (unint64_t)&a2[v12] & v29, v9);
    char v28 = 1;
LABEL_58:
    *((unsigned char *)a1 + v7) = v28;
    return a1;
  }
  if (v14)
  {
    memcpy(a1, a2, v7 + 1);
  }
  else
  {
    *a1 = *(void *)a2;
    *((unsigned char *)a1 + v7) = 0;
  }
  return a1;
}

unsigned __int8 *sub_24F3A1148(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v42 = *(void *)(v5 - 8);
    uint64_t v6 = 8;
    if (*(void *)(v42 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v42 + 64);
    }
    uint64_t v8 = sub_24F3AEDB8();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v11 = v7 + 1 + v10;
    unint64_t v12 = (v11 & ~v10) + *(void *)(v9 + 64);
    if (v12 <= (v7 & 0xFFFFFFFFFFFFFFF8) + 16) {
      unint64_t v12 = (v7 & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    if (v12 > 8) {
      uint64_t v6 = v12;
    }
    unsigned int v13 = a1[v6];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
    {
      if (v6 <= 3) {
        uint64_t v15 = v6;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a1;
          if (v6 < 4) {
            goto LABEL_17;
          }
          goto LABEL_21;
        case 2:
          int v16 = *(unsigned __int16 *)a1;
          if (v6 < 4) {
            goto LABEL_17;
          }
          goto LABEL_21;
        case 3:
          int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v6 < 4) {
            goto LABEL_17;
          }
          goto LABEL_21;
        case 4:
          int v16 = *(_DWORD *)a1;
          if (v6 < 4) {
LABEL_17:
          }
            unsigned int v13 = (v16 | (v14 << (8 * v6))) + 3;
          else {
LABEL_21:
          }
            unsigned int v13 = v16 + 3;
          break;
        default:
          break;
      }
    }
    uint64_t v17 = ~v10;
    if (v13 != 2)
    {
      if (v13 != 1)
      {
        if (v13) {
          goto LABEL_58;
        }
        goto LABEL_47;
      }
      unsigned int v22 = a1[v7];
      unsigned int v23 = v22 - 2;
      if (v22 >= 2)
      {
        if (v7 <= 3) {
          uint64_t v24 = v7;
        }
        else {
          uint64_t v24 = 4;
        }
        switch(v24)
        {
          case 1:
            int v25 = *a1;
            break;
          case 2:
            int v25 = *(unsigned __int16 *)a1;
            break;
          case 3:
            int v25 = *(unsigned __int16 *)a1 | (a1[2] << 16);
            break;
          case 4:
            int v25 = *(_DWORD *)a1;
            break;
          default:
            goto LABEL_53;
        }
        if (v7 < 4)
        {
          if ((v25 | (v23 << (8 * v7))) == 0xFFFFFFFF) {
            goto LABEL_54;
          }
          goto LABEL_56;
        }
        unsigned int v22 = v25 + 2;
      }
LABEL_53:
      if (v22 == 1)
      {
LABEL_54:

LABEL_57:
        (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&a1[v11] & v17, v8);
LABEL_58:
        unsigned int v26 = a2[v6];
        unsigned int v27 = v26 - 3;
        if (v26 >= 3)
        {
          if (v6 <= 3) {
            uint64_t v28 = v6;
          }
          else {
            uint64_t v28 = 4;
          }
          switch(v28)
          {
            case 1:
              int v29 = *a2;
              if (v6 >= 4) {
                goto LABEL_81;
              }
              goto LABEL_66;
            case 2:
              int v29 = *(unsigned __int16 *)a2;
              if (v6 < 4) {
                goto LABEL_66;
              }
              goto LABEL_81;
            case 3:
              int v29 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              if (v6 < 4) {
                goto LABEL_66;
              }
              goto LABEL_81;
            case 4:
              int v29 = *(_DWORD *)a2;
              if (v6 < 4)
              {
LABEL_66:
                unsigned int v26 = (v29 | (v27 << (8 * v6))) + 3;
                break;
              }
LABEL_81:
              unsigned int v26 = v29 + 3;
              if (v26 == 2) {
                goto LABEL_82;
              }
              goto LABEL_68;
            default:
              break;
          }
        }
        if (v26 != 2)
        {
LABEL_68:
          if (v26 != 1)
          {
            if (v26)
            {
              memcpy(a1, a2, v6 + 1);
            }
            else
            {
              *(void *)a1 = *(void *)a2;
              a1[v6] = 0;
            }
            return a1;
          }
          unsigned int v30 = a2[v7];
          unsigned int v31 = v30 - 2;
          if (v30 >= 2)
          {
            if (v7 <= 3) {
              uint64_t v32 = v7;
            }
            else {
              uint64_t v32 = 4;
            }
            switch(v32)
            {
              case 1:
                int v33 = *a2;
                break;
              case 2:
                int v33 = *(unsigned __int16 *)a2;
                break;
              case 3:
                int v33 = *(unsigned __int16 *)a2 | (a2[2] << 16);
                break;
              case 4:
                int v33 = *(_DWORD *)a2;
                break;
              default:
                goto LABEL_93;
            }
            if (v7 < 4)
            {
              if ((v33 | (v31 << (8 * v7))) == 0xFFFFFFFF) {
                goto LABEL_94;
              }
              goto LABEL_96;
            }
            unsigned int v30 = v33 + 2;
          }
LABEL_93:
          if (v30 == 1)
          {
LABEL_94:
            *(void *)a1 = *(void *)a2;
            char v38 = 1;
LABEL_97:
            a1[v7] = v38;
            (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))((unint64_t)&a1[v11] & v17, (unint64_t)&a2[v11] & v17, v8);
            char v39 = 1;
LABEL_108:
            a1[v6] = v39;
            return a1;
          }
LABEL_96:
          (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v42 + 32))(a1, a2, v5);
          char v38 = 0;
          goto LABEL_97;
        }
LABEL_82:
        unsigned int v34 = a2[v7];
        unsigned int v35 = v34 - 2;
        if (v34 >= 2)
        {
          if (v7 <= 3) {
            uint64_t v36 = v7;
          }
          else {
            uint64_t v36 = 4;
          }
          switch(v36)
          {
            case 1:
              int v37 = *a2;
              break;
            case 2:
              int v37 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v37 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v37 = *(_DWORD *)a2;
              break;
            default:
              goto LABEL_103;
          }
          if (v7 < 4)
          {
            if ((v37 | (v35 << (8 * v7))) == 0xFFFFFFFF) {
              goto LABEL_104;
            }
            goto LABEL_106;
          }
          unsigned int v34 = v37 + 2;
        }
LABEL_103:
        if (v34 == 1)
        {
LABEL_104:
          *(void *)a1 = *(void *)a2;
          char v40 = 1;
LABEL_107:
          a1[v7] = v40;
          *(void *)((unint64_t)&a1[v7 + 8] & 0xFFFFFFFFFFFFFFF8) = *(void *)((unint64_t)&a2[v7 + 8] & 0xFFFFFFFFFFFFFFF8);
          char v39 = 2;
          goto LABEL_108;
        }
LABEL_106:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v42 + 32))(a1, a2, v5);
        char v40 = 0;
        goto LABEL_107;
      }
LABEL_56:
      (*(void (**)(unsigned __int8 *, uint64_t))(v42 + 8))(a1, v5);
      goto LABEL_57;
    }
    unsigned int v18 = a1[v7];
    unsigned int v19 = v18 - 2;
    if (v18 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v20 = v7;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *a1;
          break;
        case 2:
          int v21 = *(unsigned __int16 *)a1;
          break;
        case 3:
          int v21 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          break;
        case 4:
          int v21 = *(_DWORD *)a1;
          break;
        default:
          goto LABEL_43;
      }
      if (v7 < 4)
      {
        if ((v21 | (v19 << (8 * v7))) == 0xFFFFFFFF) {
          goto LABEL_44;
        }
        goto LABEL_46;
      }
      unsigned int v18 = v21 + 2;
    }
LABEL_43:
    if (v18 == 1)
    {
LABEL_44:

LABEL_47:
      swift_bridgeObjectRelease();
      goto LABEL_58;
    }
LABEL_46:
    (*(void (**)(unsigned __int8 *, uint64_t))(v42 + 8))(a1, v5);
    goto LABEL_47;
  }
  return a1;
}

uint64_t sub_24F3A17D0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  uint64_t v6 = *(void *)(sub_24F3AEDB8() - 8);
  unint64_t v7 = ((v5 + *(unsigned __int8 *)(v6 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
  if (v7 <= (v5 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v7 <= 8) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_28;
  }
  uint64_t v9 = v8 + 1;
  char v10 = 8 * (v8 + 1);
  if ((v8 + 1) <= 3)
  {
    unsigned int v13 = ((a2 + ~(-1 << v10) - 252) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v13 < 2)
    {
LABEL_28:
      unsigned int v15 = *((unsigned __int8 *)a1 + v8);
      if (v15 >= 4) {
        return (v15 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_28;
  }
LABEL_20:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v9 | v14) + 253;
}

void sub_24F3A19A0(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  }
  uint64_t v8 = *(void *)(sub_24F3AEDB8() - 8);
  unint64_t v9 = ((v7 + *(unsigned __int8 *)(v8 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
     + *(void *)(v8 + 64);
  if (v9 <= (v7 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v9 <= 8) {
    unint64_t v9 = 8;
  }
  size_t v10 = v9 + 1;
  if (a3 < 0xFD)
  {
    int v11 = 0;
  }
  else if (v10 <= 3)
  {
    unsigned int v14 = ((a3 + ~(-1 << (8 * v10)) - 252) >> (8 * v10)) + 1;
    if (HIWORD(v14))
    {
      int v11 = 4;
    }
    else if (v14 >= 0x100)
    {
      int v11 = 2;
    }
    else
    {
      int v11 = v14 > 1;
    }
  }
  else
  {
    int v11 = 1;
  }
  if (a2 > 0xFC)
  {
    unsigned int v12 = a2 - 253;
    if (v10 < 4)
    {
      int v13 = (v12 >> (8 * v10)) + 1;
      if (v9 != -1)
      {
        int v15 = v12 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v9 + 1);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v10] = v13;
        break;
      case 2:
        *(_WORD *)&a1[v10] = v13;
        break;
      case 3:
LABEL_39:
        __break(1u);
        JUMPOUT(0x24F3A1BE4);
      case 4:
        *(_DWORD *)&a1[v10] = v13;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v11)
    {
      case 1:
        a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_28;
      case 2:
        *(_WORD *)&a1[v10] = 0;
        goto LABEL_27;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_28;
      default:
LABEL_27:
        if (a2) {
LABEL_28:
        }
          a1[v9] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_24F3A1C0C(unsigned __int8 *a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  }
  uint64_t v4 = *(void *)(sub_24F3AEDB8() - 8);
  unint64_t v5 = ((v3 + *(unsigned __int8 *)(v4 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + *(void *)(v4 + 64);
  if (v5 <= (v3 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v5 = (v3 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  uint64_t result = a1[v5];
  if (result >= 3)
  {
    if (v5 <= 3) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_17;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_17;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_17;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_17:
        unsigned int v9 = (v8 | ((result - 3) << (8 * v5))) + 3;
        unsigned int v10 = v8 + 3;
        if (v5 >= 4) {
          uint64_t result = v10;
        }
        else {
          uint64_t result = v9;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_24F3A1D58(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  size_t v5 = 8;
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  uint64_t v7 = *(void *)(sub_24F3AEDB8() - 8);
  unint64_t v8 = ((v6 + *(unsigned __int8 *)(v7 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
     + *(void *)(v7 + 64);
  if (v8 <= (v6 & 0xFFFFFFFFFFFFFFF8) + 16) {
    unint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  if (v8 > 8) {
    size_t v5 = v8;
  }
  if (a2 > 2)
  {
    unsigned int v9 = a2 - 3;
    if (v5 < 4)
    {
      unsigned int v10 = v9 >> (8 * v5);
      int v11 = v9 & ~(-1 << (8 * v5));
      a1[v5] = v10 + 3;
      bzero(a1, v5);
      if (v5 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if (v5 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v5] = 3;
      bzero(a1, v5);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    a1[v5] = a2;
  }
}

uint64_t sub_24F3A1EA8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24F3A1EE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F397B6C;
  return sub_24F39EE10(a1, v4, v5, v6);
}

uint64_t sub_24F3A1F9C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F3A2078;
  return v6(a1);
}

uint64_t sub_24F3A2078()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24F3A2170()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL static DynamicPredicateEquatableValue.Stripped.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DynamicPredicateEquatableValue.Stripped.hash(into:)()
{
  return sub_24F3AF4E8();
}

uint64_t DynamicPredicateEquatableValue.Stripped.hashValue.getter()
{
  return sub_24F3AF508();
}

void DynamicPredicateEquatableValue.strippedCase.getter(unsigned char *a1@<X8>)
{
  switch(*(unsigned char *)(v1 + 16))
  {
    case 4:
      *a1 = 0x604020100uLL >> (8 * *(_DWORD *)v1);
      break;
    case 5:
      *a1 = 4;
      break;
    case 6:
      *a1 = 5;
      break;
    case 7:
      *a1 = 6;
      break;
    default:
      *a1 = *(unsigned char *)(v1 + 16);
      break;
  }
}

unint64_t sub_24F3A22C8(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657A695364697267;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x72656765746E69;
      break;
    case 4:
      unint64_t result = 0x6874615079656BLL;
      break;
    case 5:
      unint64_t result = 0x6D726F6674616C70;
      break;
    case 6:
      unint64_t result = 0x676E69727473;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x5463696D616E7964;
      break;
  }
  return result;
}

unint64_t sub_24F3A23EC()
{
  return sub_24F3A22C8(*v0);
}

uint64_t sub_24F3A23F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3A5CEC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3A241C(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24F3A2428(uint64_t a1)
{
  unint64_t v2 = sub_24F3A458C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A2464(uint64_t a1)
{
  unint64_t v2 = sub_24F3A458C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A24A0(uint64_t a1)
{
  unint64_t v2 = sub_24F3A48D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A24DC(uint64_t a1)
{
  unint64_t v2 = sub_24F3A48D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A2518(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4880();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A2554(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4880();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A2590(uint64_t a1)
{
  unint64_t v2 = sub_24F3A482C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A25CC(uint64_t a1)
{
  unint64_t v2 = sub_24F3A482C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A2608(uint64_t a1)
{
  unint64_t v2 = sub_24F3A47D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A2644(uint64_t a1)
{
  unint64_t v2 = sub_24F3A47D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A2680(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4730();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A26BC(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4730();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A26F8(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4688();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A2734(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4688();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A2770(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4634();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A27AC(uint64_t a1)
{
  unint64_t v2 = sub_24F3A4634();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3A27E8(uint64_t a1)
{
  unint64_t v2 = sub_24F3A45E0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A2824(uint64_t a1)
{
  unint64_t v2 = sub_24F3A45E0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateEquatableValue.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C38);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  long long v50 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C40);
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C48);
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C50);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C58);
  uint64_t v39 = *(void *)(v10 - 8);
  uint64_t v40 = v10;
  MEMORY[0x270FA5388](v10);
  char v38 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C60);
  uint64_t v36 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  unsigned int v35 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C68);
  uint64_t v33 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  unsigned int v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C70);
  uint64_t v32 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04C78);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v55 = v18;
  uint64_t v56 = v19;
  MEMORY[0x270FA5388](v18);
  int v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *v1;
  uint64_t v53 = v1[1];
  uint64_t v54 = v22;
  uint64_t v23 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3A458C();
  sub_24F3AF538();
  switch(v23)
  {
    case 1:
      char v59 = 1;
      sub_24F3A4880();
      uint64_t v26 = v55;
      sub_24F3AF3C8();
      uint64_t v27 = v34;
      sub_24F3AF408();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v21, v26);
    case 2:
      char v60 = 2;
      sub_24F3A482C();
      int v29 = v35;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      uint64_t v30 = v37;
      sub_24F3AF3E8();
      uint64_t v31 = v36;
      goto LABEL_10;
    case 3:
      char v61 = 3;
      sub_24F3A47D8();
      int v29 = v38;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      uint64_t v30 = v40;
      sub_24F3AF408();
      uint64_t v31 = v39;
      goto LABEL_10;
    case 4:
      char v63 = 4;
      sub_24F3A4730();
      int v29 = v41;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      char v62 = v54;
      sub_24F3A4784();
      uint64_t v30 = v43;
      sub_24F3AF428();
      uint64_t v31 = v42;
      goto LABEL_10;
    case 5:
      char v65 = 5;
      sub_24F3A4688();
      int v29 = v44;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      char v64 = v54;
      sub_24F3A46DC();
      uint64_t v30 = v47;
      sub_24F3AF428();
      uint64_t v31 = v45;
      goto LABEL_10;
    case 6:
      char v66 = 6;
      sub_24F3A4634();
      int v29 = v46;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      uint64_t v30 = v49;
      sub_24F3AF3E8();
      uint64_t v31 = v48;
      goto LABEL_10;
    case 7:
      char v67 = 7;
      sub_24F3A45E0();
      int v29 = v50;
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      uint64_t v30 = v52;
      sub_24F3AF3E8();
      uint64_t v31 = v51;
LABEL_10:
      (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
      break;
    default:
      char v58 = 0;
      sub_24F3A48D4();
      uint64_t v24 = v55;
      int v25 = v21;
      sub_24F3AF3C8();
      char v57 = v54;
      sub_24F390864();
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v15);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v25, v24);
}

uint64_t DynamicPredicateEquatableValue.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v95 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04CD8);
  uint64_t v91 = *(void *)(v3 - 8);
  uint64_t v92 = v3;
  MEMORY[0x270FA5388](v3);
  v99 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04CE0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v89 = v5;
  uint64_t v90 = v6;
  MEMORY[0x270FA5388](v5);
  v98 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04CE8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v87 = v8;
  uint64_t v88 = v9;
  MEMORY[0x270FA5388](v8);
  v97 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04CF0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v85 = v11;
  uint64_t v86 = v12;
  MEMORY[0x270FA5388](v11);
  v94 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04CF8);
  uint64_t v84 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  v93 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04D00);
  uint64_t v82 = *(void *)(v15 - 8);
  uint64_t v83 = v15;
  MEMORY[0x270FA5388](v15);
  v96 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04D08);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v18 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04D10);
  uint64_t v78 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  int v21 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04D18);
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  int v25 = (char *)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = a1[3];
  v100 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_24F3A458C();
  uint64_t v27 = v101;
  sub_24F3AF528();
  if (v27) {
    goto LABEL_24;
  }
  uint64_t v28 = v21;
  uint64_t v74 = v19;
  uint64_t v75 = v18;
  int v29 = v96;
  uint64_t v30 = v97;
  uint64_t v31 = v98;
  uint64_t v76 = 0;
  uint64_t v32 = v99;
  uint64_t v77 = v23;
  v101 = v25;
  uint64_t v33 = sub_24F3AF3A8();
  if (*(void *)(v33 + 16) != 1)
  {
    uint64_t v40 = sub_24F3AF2C8();
    swift_allocError();
    uint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A04860);
    *uint64_t v42 = &type metadata for DynamicPredicateEquatableValue;
    uint64_t v43 = v101;
    sub_24F3AF338();
    sub_24F3AF2B8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v42, *MEMORY[0x263F8DCB0], v40);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v43, v22);
LABEL_24:
    uint64_t v63 = (uint64_t)v100;
    return __swift_destroy_boxed_opaque_existential_1(v63);
  }
  uint64_t v34 = *(unsigned __int8 *)(v33 + 32);
  switch(*(unsigned char *)(v33 + 32))
  {
    case 1:
      char v104 = 1;
      sub_24F3A4880();
      uint64_t v44 = v75;
      uint64_t v45 = v101;
      uint64_t v46 = v76;
      sub_24F3AF328();
      if (v46)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v77 + 8))(v45, v22);
        goto LABEL_24;
      }
      uint64_t v65 = v80;
      uint64_t v39 = sub_24F3AF378();
      uint64_t v73 = v34;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v44, v65);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v101, v22);
      goto LABEL_29;
    case 2:
      char v105 = 2;
      sub_24F3A482C();
      unsigned int v35 = v101;
      uint64_t v47 = v76;
      sub_24F3AF328();
      if (v47) {
        goto LABEL_22;
      }
      uint64_t v73 = v34;
      uint64_t v48 = v83;
      uint64_t v39 = sub_24F3AF358();
      uint64_t v38 = v68;
      (*(void (**)(char *, uint64_t))(v82 + 8))(v29, v48);
      goto LABEL_28;
    case 3:
      uint64_t v73 = *(unsigned __int8 *)(v33 + 32);
      char v106 = 3;
      sub_24F3A47D8();
      uint64_t v49 = v93;
      unsigned int v35 = v101;
      uint64_t v50 = v76;
      sub_24F3AF328();
      if (v50) {
        goto LABEL_22;
      }
      uint64_t v51 = v81;
      uint64_t v52 = sub_24F3AF378();
      uint64_t v53 = v77;
      uint64_t v39 = v52;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v49, v51);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v22);
LABEL_29:
      uint64_t v38 = 0;
      goto LABEL_30;
    case 4:
      uint64_t v73 = *(unsigned __int8 *)(v33 + 32);
      char v108 = 4;
      sub_24F3A4730();
      uint64_t v54 = v94;
      unsigned int v35 = v101;
      uint64_t v55 = v76;
      sub_24F3AF328();
      if (v55) {
        goto LABEL_22;
      }
      sub_24F3A497C();
      uint64_t v56 = v85;
      sub_24F3AF398();
      uint64_t v57 = v77;
      (*(void (**)(char *, uint64_t))(v86 + 8))(v54, v56);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v35, v22);
      uint64_t v38 = 0;
      uint64_t v39 = v107;
      goto LABEL_30;
    case 5:
      uint64_t v73 = *(unsigned __int8 *)(v33 + 32);
      char v110 = 5;
      sub_24F3A4688();
      unsigned int v35 = v101;
      uint64_t v58 = v76;
      sub_24F3AF328();
      if (v58) {
        goto LABEL_22;
      }
      sub_24F3A4928();
      uint64_t v66 = v87;
      sub_24F3AF398();
      uint64_t v67 = v77;
      (*(void (**)(char *, uint64_t))(v88 + 8))(v30, v66);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v35, v22);
      uint64_t v38 = 0;
      uint64_t v39 = v109;
      goto LABEL_30;
    case 6:
      char v111 = 6;
      sub_24F3A4634();
      unsigned int v35 = v101;
      uint64_t v59 = v76;
      sub_24F3AF328();
      if (v59) {
        goto LABEL_22;
      }
      uint64_t v73 = v34;
      uint64_t v60 = v89;
      uint64_t v39 = sub_24F3AF358();
      uint64_t v38 = v69;
      (*(void (**)(char *, uint64_t))(v90 + 8))(v31, v60);
      goto LABEL_28;
    case 7:
      char v112 = 7;
      sub_24F3A45E0();
      unsigned int v35 = v101;
      uint64_t v61 = v76;
      sub_24F3AF328();
      if (v61) {
        goto LABEL_22;
      }
      uint64_t v73 = v34;
      uint64_t v62 = v92;
      uint64_t v39 = sub_24F3AF358();
      uint64_t v38 = v70;
      (*(void (**)(char *, uint64_t))(v91 + 8))(v32, v62);
LABEL_28:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v35, v22);
      goto LABEL_30;
    default:
      uint64_t v73 = *(unsigned __int8 *)(v33 + 32);
      char v103 = 0;
      sub_24F3A48D4();
      unsigned int v35 = v101;
      uint64_t v36 = v76;
      sub_24F3AF328();
      if (v36)
      {
LABEL_22:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v77 + 8))(v35, v22);
        goto LABEL_24;
      }
      sub_24F39090C();
      uint64_t v37 = v74;
      sub_24F3AF398();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v35, v22);
      uint64_t v38 = 0;
      uint64_t v39 = v102;
LABEL_30:
      uint64_t v63 = (uint64_t)v100;
      uint64_t v71 = v95;
      uint64_t *v95 = v39;
      v71[1] = v38;
      *((unsigned char *)v71 + 16) = v73;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v63);
}

uint64_t sub_24F3A3F04@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DynamicPredicateEquatableValue.init(from:)(a1, a2);
}

uint64_t sub_24F3A3F1C(void *a1)
{
  return DynamicPredicateEquatableValue.encode(to:)(a1);
}

uint64_t DynamicPredicateEquatableValue.hash(into:)()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 2:
    case 6:
    case 7:
      sub_24F3AF4E8();
      uint64_t result = sub_24F3AEED8();
      break;
    case 4:
    case 5:
      sub_24F3AF4E8();
      sub_24F3AEED8();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      sub_24F3AF4E8();
      uint64_t result = sub_24F3AF4E8();
      break;
  }
  return result;
}

uint64_t DynamicPredicateEquatableValue.hashValue.getter()
{
  return sub_24F3AF508();
}

uint64_t sub_24F3A41B8()
{
  return sub_24F3AF508();
}

uint64_t sub_24F3A4210()
{
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1u:
      if (v7 != 1) {
        goto LABEL_32;
      }
      sub_24F392C40(*(void *)a1, v3, 1u);
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      unsigned __int8 v11 = 1;
      goto LABEL_14;
    case 2u:
      if (v7 != 2) {
        goto LABEL_31;
      }
      if (v2 == v5 && v3 == v6) {
        char v8 = 1;
      }
      else {
        char v8 = sub_24F3AF468();
      }
      sub_24F3925CC(v5, v6, 2u);
      sub_24F3925CC(v2, v3, 2u);
      sub_24F392C40(v2, v3, 2u);
      sub_24F392C40(v5, v6, 2u);
      return v8 & 1;
    case 3u:
      if (v7 != 3) {
        goto LABEL_32;
      }
      sub_24F392C40(*(void *)a1, v3, 3u);
      uint64_t v9 = v5;
      uint64_t v10 = v6;
      unsigned __int8 v11 = 3;
LABEL_14:
      sub_24F392C40(v9, v10, v11);
      char v8 = v2 == v5;
      return v8 & 1;
    case 4u:
      if (v7 != 4) {
        goto LABEL_32;
      }
      char v8 = sub_24F393974(*(void *)a1, *(void *)a2);
      sub_24F392C40(v2, v3, 4u);
      sub_24F392C40(v5, v6, 4u);
      return v8 & 1;
    case 5u:
      if (v7 != 5) {
        goto LABEL_32;
      }
      char v8 = sub_24F393B78(*(void *)a1, *(void *)a2);
      sub_24F392C40(v2, v3, 5u);
      sub_24F392C40(v5, v6, 5u);
      return v8 & 1;
    case 6u:
      if (v7 != 6) {
        goto LABEL_31;
      }
      if (v2 == v5 && v3 == v6) {
        char v8 = 1;
      }
      else {
        char v8 = sub_24F3AF468();
      }
      sub_24F3925CC(v5, v6, 6u);
      sub_24F3925CC(v2, v3, 6u);
      sub_24F392C40(v2, v3, 6u);
      sub_24F392C40(v5, v6, 6u);
      return v8 & 1;
    case 7u:
      if (v7 == 7)
      {
        if (v2 == v5 && v3 == v6) {
          char v8 = 1;
        }
        else {
          char v8 = sub_24F3AF468();
        }
        sub_24F3925CC(v5, v6, 7u);
        sub_24F3925CC(v2, v3, 7u);
        sub_24F392C40(v2, v3, 7u);
        sub_24F392C40(v5, v6, 7u);
      }
      else
      {
LABEL_31:
        swift_bridgeObjectRetain();
LABEL_32:
        sub_24F3925CC(v5, v6, v7);
        sub_24F392C40(v2, v3, v4);
        sub_24F392C40(v5, v6, v7);
        char v8 = 0;
      }
      break;
    default:
      if (*(unsigned char *)(a2 + 16)) {
        goto LABEL_32;
      }
      sub_24F392C40(*(void *)a1, v3, 0);
      sub_24F392C40(v5, v6, 0);
      char v8 = v5 == v2;
      break;
  }
  return v8 & 1;
}

unint64_t sub_24F3A458C()
{
  unint64_t result = qword_269A04C80;
  if (!qword_269A04C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04C80);
  }
  return result;
}

unint64_t sub_24F3A45E0()
{
  unint64_t result = qword_269A04C88;
  if (!qword_269A04C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04C88);
  }
  return result;
}

unint64_t sub_24F3A4634()
{
  unint64_t result = qword_269A04C90;
  if (!qword_269A04C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04C90);
  }
  return result;
}

unint64_t sub_24F3A4688()
{
  unint64_t result = qword_269A04C98;
  if (!qword_269A04C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04C98);
  }
  return result;
}

unint64_t sub_24F3A46DC()
{
  unint64_t result = qword_269A04CA0;
  if (!qword_269A04CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CA0);
  }
  return result;
}

unint64_t sub_24F3A4730()
{
  unint64_t result = qword_269A04CA8;
  if (!qword_269A04CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CA8);
  }
  return result;
}

unint64_t sub_24F3A4784()
{
  unint64_t result = qword_269A04CB0;
  if (!qword_269A04CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CB0);
  }
  return result;
}

unint64_t sub_24F3A47D8()
{
  unint64_t result = qword_269A04CB8;
  if (!qword_269A04CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CB8);
  }
  return result;
}

unint64_t sub_24F3A482C()
{
  unint64_t result = qword_269A04CC0;
  if (!qword_269A04CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CC0);
  }
  return result;
}

unint64_t sub_24F3A4880()
{
  unint64_t result = qword_269A04CC8;
  if (!qword_269A04CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CC8);
  }
  return result;
}

unint64_t sub_24F3A48D4()
{
  unint64_t result = qword_269A04CD0;
  if (!qword_269A04CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04CD0);
  }
  return result;
}

unint64_t sub_24F3A4928()
{
  unint64_t result = qword_269A04D20;
  if (!qword_269A04D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D20);
  }
  return result;
}

unint64_t sub_24F3A497C()
{
  unint64_t result = qword_269A04D28;
  if (!qword_269A04D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D28);
  }
  return result;
}

unint64_t sub_24F3A49D4()
{
  unint64_t result = qword_269A04D30;
  if (!qword_269A04D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D30);
  }
  return result;
}

unint64_t sub_24F3A4A2C()
{
  unint64_t result = qword_269A04D38;
  if (!qword_269A04D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D38);
  }
  return result;
}

uint64_t destroy for DynamicPredicateEquatableValue(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 16);
  if (v1 >= 8) {
    unsigned int v1 = *(_DWORD *)result + 8;
  }
  if (((1 << v1) & 0x3B) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16FitnessUtilities30DynamicPredicateEquatableValueOwCP_0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 16);
  if (v3 >= 8) {
    unsigned int v3 = *(_DWORD *)a2 + 8;
  }
  switch(v3)
  {
    case 1u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 16) = 1;
      return a1;
    case 2u:
      uint64_t v4 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      char v5 = 2;
      goto LABEL_12;
    case 3u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 16) = 3;
      return a1;
    case 4u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 16) = 4;
      return a1;
    case 5u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 16) = 5;
      return a1;
    case 6u:
      uint64_t v6 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v6;
      char v5 = 6;
      goto LABEL_12;
    case 7u:
      uint64_t v7 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v7;
      char v5 = 7;
LABEL_12:
      *(unsigned char *)(a1 + 16) = v5;
      swift_bridgeObjectRetain();
      break;
    default:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 16) = 0;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateEquatableValue(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 8) {
      unsigned int v4 = *(_DWORD *)a1 + 8;
    }
    if (((1 << v4) & 0x3B) == 0) {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 16);
    if (v5 >= 8) {
      unsigned int v5 = *(_DWORD *)a2 + 8;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 16) = 1;
        return a1;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v6 = 2;
        goto LABEL_17;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 16) = 3;
        return a1;
      case 4u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 16) = 4;
        return a1;
      case 5u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 16) = 5;
        return a1;
      case 6u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v6 = 6;
        goto LABEL_17;
      case 7u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v6 = 7;
LABEL_17:
        *(unsigned char *)(a1 + 16) = v6;
        swift_bridgeObjectRetain();
        break;
      default:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        *(unsigned char *)(a1 + 16) = 0;
        break;
    }
  }
  return a1;
}

uint64_t assignWithTake for DynamicPredicateEquatableValue(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 8) {
      unsigned int v4 = *(_DWORD *)a1 + 8;
    }
    if (((1 << v4) & 0x3B) == 0) {
      swift_bridgeObjectRelease();
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 16);
    if (v5 >= 8) {
      unsigned int v5 = *(_DWORD *)a2 + 8;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        char v6 = 1;
        break;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 2;
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        char v6 = 3;
        break;
      case 4u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v6 = 4;
        break;
      case 5u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        char v6 = 5;
        break;
      case 6u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 6;
        break;
      case 7u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 7;
        break;
      default:
        char v6 = 0;
        *(unsigned char *)a1 = *(unsigned char *)a2;
        break;
    }
    *(unsigned char *)(a1 + 16) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 8) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateEquatableValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)unint64_t result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F3A4EE8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 8) {
    return (*(_DWORD *)a1 + 8);
  }
  return result;
}

uint64_t sub_24F3A4F04(uint64_t result, unsigned int a2)
{
  if (a2 > 7)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 8;
    LOBYTE(a2) = 8;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue()
{
  return &type metadata for DynamicPredicateEquatableValue;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue.Stripped(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateEquatableValue.Stripped(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24F3A5090);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.Stripped()
{
  return &type metadata for DynamicPredicateEquatableValue.Stripped;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateEquatableValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DynamicPredicateEquatableValue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3A5224);
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

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.CodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.DynamicTypeSizeCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.GridSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.GridSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.HorizontalSizeClassCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.IntegerCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.IntegerCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.KeyPathCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.KeyPathCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.PlatformCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.PlatformCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.StringCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.StringCodingKeys;
}

unsigned char *_s16FitnessUtilities30DynamicPredicateEquatableValueO25DynamicTypeSizeCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3A536CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys()
{
  return &type metadata for DynamicPredicateEquatableValue.VerticalSizeClassCodingKeys;
}

unint64_t sub_24F3A53A8()
{
  unint64_t result = qword_269A04D40;
  if (!qword_269A04D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D40);
  }
  return result;
}

unint64_t sub_24F3A5400()
{
  unint64_t result = qword_269A04D48;
  if (!qword_269A04D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D48);
  }
  return result;
}

unint64_t sub_24F3A5458()
{
  unint64_t result = qword_269A04D50;
  if (!qword_269A04D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D50);
  }
  return result;
}

unint64_t sub_24F3A54B0()
{
  unint64_t result = qword_269A04D58;
  if (!qword_269A04D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D58);
  }
  return result;
}

unint64_t sub_24F3A5508()
{
  unint64_t result = qword_269A04D60;
  if (!qword_269A04D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D60);
  }
  return result;
}

unint64_t sub_24F3A5560()
{
  unint64_t result = qword_269A04D68;
  if (!qword_269A04D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D68);
  }
  return result;
}

unint64_t sub_24F3A55B8()
{
  unint64_t result = qword_269A04D70;
  if (!qword_269A04D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D70);
  }
  return result;
}

unint64_t sub_24F3A5610()
{
  unint64_t result = qword_269A04D78;
  if (!qword_269A04D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D78);
  }
  return result;
}

unint64_t sub_24F3A5668()
{
  unint64_t result = qword_269A04D80;
  if (!qword_269A04D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D80);
  }
  return result;
}

unint64_t sub_24F3A56C0()
{
  unint64_t result = qword_269A04D88;
  if (!qword_269A04D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D88);
  }
  return result;
}

unint64_t sub_24F3A5718()
{
  unint64_t result = qword_269A04D90;
  if (!qword_269A04D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D90);
  }
  return result;
}

unint64_t sub_24F3A5770()
{
  unint64_t result = qword_269A04D98;
  if (!qword_269A04D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04D98);
  }
  return result;
}

unint64_t sub_24F3A57C8()
{
  unint64_t result = qword_269A04DA0;
  if (!qword_269A04DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DA0);
  }
  return result;
}

unint64_t sub_24F3A5820()
{
  unint64_t result = qword_269A04DA8;
  if (!qword_269A04DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DA8);
  }
  return result;
}

unint64_t sub_24F3A5878()
{
  unint64_t result = qword_269A04DB0;
  if (!qword_269A04DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DB0);
  }
  return result;
}

unint64_t sub_24F3A58D0()
{
  unint64_t result = qword_269A04DB8;
  if (!qword_269A04DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DB8);
  }
  return result;
}

unint64_t sub_24F3A5928()
{
  unint64_t result = qword_269A04DC0;
  if (!qword_269A04DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DC0);
  }
  return result;
}

unint64_t sub_24F3A5980()
{
  unint64_t result = qword_269A04DC8;
  if (!qword_269A04DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DC8);
  }
  return result;
}

unint64_t sub_24F3A59D8()
{
  unint64_t result = qword_269A04DD0;
  if (!qword_269A04DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DD0);
  }
  return result;
}

unint64_t sub_24F3A5A30()
{
  unint64_t result = qword_269A04DD8;
  if (!qword_269A04DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DD8);
  }
  return result;
}

unint64_t sub_24F3A5A88()
{
  unint64_t result = qword_269A04DE0;
  if (!qword_269A04DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DE0);
  }
  return result;
}

unint64_t sub_24F3A5AE0()
{
  unint64_t result = qword_269A04DE8;
  if (!qword_269A04DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DE8);
  }
  return result;
}

unint64_t sub_24F3A5B38()
{
  unint64_t result = qword_269A04DF0;
  if (!qword_269A04DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DF0);
  }
  return result;
}

unint64_t sub_24F3A5B90()
{
  unint64_t result = qword_269A04DF8;
  if (!qword_269A04DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04DF8);
  }
  return result;
}

unint64_t sub_24F3A5BE8()
{
  unint64_t result = qword_269A04E00;
  if (!qword_269A04E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E00);
  }
  return result;
}

unint64_t sub_24F3A5C40()
{
  unint64_t result = qword_269A04E08;
  if (!qword_269A04E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E08);
  }
  return result;
}

unint64_t sub_24F3A5C98()
{
  unint64_t result = qword_269A04E10;
  if (!qword_269A04E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A04E10);
  }
  return result;
}

uint64_t sub_24F3A5CEC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5463696D616E7964 && a2 == 0xEF657A6953657079;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657A695364697267 && a2 == 0xED00007373616C43 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024F3B3440 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x72656765746E69 && a2 == 0xE700000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6874615079656BLL && a2 == 0xE700000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024F3B3460)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t String.init(localizing:tableName:bundle:locale:comment:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v42 = a8;
  uint64_t v44 = a6;
  uint64_t v45 = a7;
  uint64_t v37 = a5;
  id v38 = a4;
  uint64_t v43 = a3;
  uint64_t v41 = a2;
  uint64_t v46 = a1;
  uint64_t v8 = sub_24F3AED38();
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24F3AEDE8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24F3AEE98();
  uint64_t v35 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_24F3AED48();
  uint64_t v19 = *(void *)(v36 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v36);
  uint64_t v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v32 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v46, v15);
  int v25 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v26 = v37;
  v25(v14, v37, v11);
  id v27 = v38;
  id v28 = objc_msgSend(v38, sel_bundleURL);
  sub_24F3AED78();

  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v10, *MEMORY[0x263F06D20], v40);
  sub_24F3AED58();
  uint64_t v29 = v36;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v36);
  uint64_t v30 = sub_24F3AEEA8();

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v26, v33);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v46, v35);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v29);
  return v30;
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
  object = function._object;
  uint64_t countAndFlagsBits = function._countAndFlagsBits;
  unsigned int v4 = file._object;
  uint64_t v5 = file._countAndFlagsBits;
  Swift::String v34 = file;
  sub_24F3A6760();
  uint64_t v6 = sub_24F3AF258();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 16 * v7;
    uint64_t v5 = *(void *)(v8 + 16);
    unsigned int v4 = *(void **)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_24F3A67B4(46, 0xE100000000000000, v5, (unint64_t)v4);
  uint64_t v9 = sub_24F3AEF18();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = MEMORY[0x25335BB00](v9, v11, v13, v15);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  sub_24F3A67B4(40, 0xE100000000000000, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_24F3AEF18();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = MEMORY[0x25335BB00](v19, v21, v23, v25);
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_24F3AEDF8();
  os_log_type_t v30 = sub_24F3AF208();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v34._uint64_t countAndFlagsBits = v32;
    *(_DWORD *)uint64_t v31 = 67109634;
    uint64_t v33 = pthread_self();
    pthread_mach_thread_np(v33);
    sub_24F3AF238();
    *(_WORD *)(v31 + 8) = 2082;
    swift_bridgeObjectRetain();
    sub_24F3A68A4(v16, v18, &v34._countAndFlagsBits);
    sub_24F3AF238();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 18) = 2082;
    swift_bridgeObjectRetain();
    sub_24F3A68A4(v26, v28, &v34._countAndFlagsBits);
    sub_24F3AF238();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24F389000, v29, v30, "[%u] %{public}s::%{public}s", (uint8_t *)v31, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x25335C5D0](v32, -1, -1);
    MEMORY[0x25335C5D0](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

unint64_t sub_24F3A6760()
{
  unint64_t result = qword_26B1F2F00;
  if (!qword_26B1F2F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1F2F00);
  }
  return result;
}

unint64_t sub_24F3A67B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_24F3AEF08() != a1 || v9 != a2)
  {
    char v10 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_24F3AEEE8();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24F3A68A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24F3A6978(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24F3A6B34((uint64_t)v12, *a3);
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
      sub_24F3A6B34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24F3A6978(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24F3AF248();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24F3A6B90(a5, a6);
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
  uint64_t v8 = sub_24F3AF2D8();
  if (!v8)
  {
    sub_24F3AF2F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24F3AF308();
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

uint64_t sub_24F3A6B34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24F3A6B90(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24F3A6C28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24F3A6E08(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24F3A6E08(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24F3A6C28(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24F3A6DA0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24F3AF2A8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24F3AF2F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24F3AEEF8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24F3AF308();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24F3AF2F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24F3A6DA0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24F3A6E08(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F28);
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
  uint64_t result = sub_24F3AF308();
  __break(1u);
  return result;
}

uint64_t AsyncSequence.erased()(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  sub_24F3AF168();
  return swift_release();
}

uint64_t sub_24F3A7078()
{
  return sub_24F3A719C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24F3A70AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F3A70BC()
{
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned int v1 = v0;
  v1[1] = sub_24F397B6C;
  return sub_24F397B6C();
}

uint64_t sub_24F3A7148()
{
  sub_24F3AF2E8();

  return swift_getWitnessTable();
}

uint64_t sub_24F3A719C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t AsyncStreamPublisher.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AsyncStreamPublisher.init()();
  return v0;
}

uint64_t AsyncStreamPublisher.publish(_:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t AsyncStreamPublisher.makeStream(bufferingPolicy:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_24F3AF0A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v13[-v6];
  uint64_t v8 = sub_24F3AEDD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  size_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24F3AEDC8();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v14 = v1;
  uint64_t v15 = v11;
  nullsub_1(v3);
  sub_24F3AF138();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t AsyncStreamPublisher.init()()
{
  swift_defaultActor_initialize();
  sub_24F3AEDD8();
  sub_24F3AF0E8();
  swift_getTupleTypeMetadata2();
  sub_24F3AEFF8();
  sub_24F3A7714();
  *(void *)(v0 + 112) = sub_24F3AEE08();
  return v0;
}

uint64_t sub_24F3A7538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a2;
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24F3AF088();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - v9;
  sub_24F3AEDD8();
  sub_24F3AF0E8();
  swift_getTupleTypeMetadata2();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, a3);
  sub_24F3AF0C8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24F3A76F8(uint64_t a1)
{
  return sub_24F3A7538(a1, *(void *)(v1 + 24), *(void *)(v1 + 16));
}

unint64_t sub_24F3A7714()
{
  unint64_t result = qword_26B1F2B78[0];
  if (!qword_26B1F2B78[0])
  {
    sub_24F3AEDD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1F2B78);
  }
  return result;
}

uint64_t AsyncStreamPublisher.publish<>()()
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E28);
  uint64_t v1 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E30);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v0 + 112);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v27 = v10 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v28 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = (void (**)(char *, uint64_t))(v1 + 8);
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v19 = v18 | (v17 << 6);
      goto LABEL_5;
    }
    int64_t v24 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v28) {
      goto LABEL_25;
    }
    unint64_t v25 = *(void *)(v27 + 8 * v24);
    ++v17;
    if (!v25)
    {
      int64_t v17 = v24 + 1;
      if (v24 + 1 >= v28) {
        goto LABEL_25;
      }
      unint64_t v25 = *(void *)(v27 + 8 * v17);
      if (!v25)
      {
        int64_t v17 = v24 + 2;
        if (v24 + 2 >= v28) {
          goto LABEL_25;
        }
        unint64_t v25 = *(void *)(v27 + 8 * v17);
        if (!v25)
        {
          int64_t v17 = v24 + 3;
          if (v24 + 3 >= v28) {
            goto LABEL_25;
          }
          unint64_t v25 = *(void *)(v27 + 8 * v17);
          if (!v25)
          {
            int64_t v17 = v24 + 4;
            if (v24 + 4 >= v28) {
              goto LABEL_25;
            }
            unint64_t v25 = *(void *)(v27 + 8 * v17);
            if (!v25) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v19 = __clz(__rbit64(v25)) + (v17 << 6);
LABEL_5:
    uint64_t v20 = *(void *)(v10 + 48);
    uint64_t v21 = sub_24F3AEDD8();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v19, v21);
    uint64_t v22 = *(void *)(v10 + 56);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E38);
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(&v9[*(int *)(v4 + 48)], v22 + *(void *)(*(void *)(v23 - 8) + 72) * v19, v23);
    sub_24F3A8764((uint64_t)v9, (uint64_t)v7);
    sub_24F3AF0B8();
    (*v15)(v3, v29);
    uint64_t result = sub_24F3A87CC((uint64_t)v7);
  }
  int64_t v26 = v24 + 5;
  if (v26 >= v28)
  {
LABEL_25:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v25 = *(void *)(v27 + 8 * v26);
  if (v25)
  {
    int64_t v17 = v26;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v17 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v17 >= v28) {
      goto LABEL_25;
    }
    unint64_t v25 = *(void *)(v27 + 8 * v17);
    ++v26;
    if (v25) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24F3A7AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3AF0E8();
  uint64_t v5 = sub_24F3AF228();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - v6;
  uint64_t v8 = sub_24F3AEDD8();
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  uint64_t v11 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v7, a1, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v4);
  swift_beginAccess();
  sub_24F3A7714();
  sub_24F3AEE18();
  sub_24F3AEE28();
  return swift_endAccess();
}

uint64_t sub_24F3A7CE8(uint64_t a1)
{
  uint64_t v2 = sub_24F3AF0E8();
  uint64_t v3 = sub_24F3AF228();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - v4;
  uint64_t v6 = sub_24F3AEDD8();
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v5, 1, 1, v2);
  swift_beginAccess();
  sub_24F3A7714();
  sub_24F3AEE18();
  sub_24F3AEE28();
  return swift_endAccess();
}

uint64_t AsyncStreamPublisher.deinit()
{
  swift_beginAccess();
  sub_24F3AEDD8();
  sub_24F3AF0E8();
  sub_24F3A7714();
  sub_24F3AEE18();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24F3AEF38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_24F3A7FA8()
{
  return sub_24F3AF0D8();
}

uint64_t AsyncStreamPublisher.__deallocating_deinit()
{
  AsyncStreamPublisher.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24F3A8058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a1;
  uint64_t v39 = *(void *)(*(void *)a2 + 80);
  uint64_t v40 = sub_24F3AF0E8();
  uint64_t v36 = *(void *)(v40 - 8);
  uint64_t v35 = *(void *)(v36 + 64);
  MEMORY[0x270FA5388](v40);
  uint64_t v37 = (char *)&v27 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v38 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24F3AEDD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = v10;
  uint64_t v12 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  os_log_type_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v30(v12, a3, v8);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v31 = v13 | 7;
  uint64_t v32 = v11;
  uint64_t v14 = swift_allocObject();
  uint64_t v28 = v8;
  uint64_t v29 = a3;
  *(void *)(v14 + 16) = v39;
  *(void *)(v14 + 24) = a2;
  uint64_t v33 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  uint64_t v15 = v8;
  v33(v14 + ((v13 + 32) & ~v13), v12, v8);
  swift_retain();
  uint64_t v16 = v40;
  uint64_t v17 = v34;
  sub_24F3AF098();
  uint64_t v18 = sub_24F3AF078();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v38, 1, 1, v18);
  uint64_t v20 = v36;
  unint64_t v19 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v17, v16);
  v30(v12, v29, v15);
  uint64_t v21 = v39;
  type metadata accessor for AsyncStreamPublisher();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v23 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v24 = (v35 + v13 + v23) & ~v13;
  unint64_t v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = a2;
  *((void *)v25 + 3) = WitnessTable;
  *((void *)v25 + 4) = v21;
  *((void *)v25 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v25[v23], v19, v40);
  v33((uint64_t)&v25[v24], v12, v28);
  swift_retain_n();
  sub_24F3966F8(v38, (uint64_t)&unk_269A04E48, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_24F3A8438(uint64_t a1)
{
  return sub_24F3A8058(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24F3A8440(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = sub_24F3AEDD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F08);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24F3AF078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = *(void *)(v5 + 80);
  *((void *)v14 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  sub_24F3966F8((uint64_t)v11, (uint64_t)&unk_269A04E58, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_24F3A8634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24F3A8654, a4, 0);
}

uint64_t sub_24F3A8654()
{
  sub_24F3A7CE8(*(void *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F3A86B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24F3A86D8, a4, 0);
}

uint64_t sub_24F3A86D8()
{
  sub_24F3A7AF4(v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t AsyncStreamPublisher.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24F3A8748()
{
  return AsyncStreamPublisher.unownedExecutor.getter();
}

uint64_t sub_24F3A8764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3A87CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F3A882C()
{
  return sub_24F3A7FA8();
}

uint64_t sub_24F3A8848()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AsyncStreamPublisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AsyncStreamPublisher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncStreamPublisher);
}

uint64_t dispatch thunk of AsyncStreamPublisher.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_24F3A88DC()
{
  uint64_t v1 = sub_24F3AEDD8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24F3A89A8(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_24F3AEDD8() - 8);
  uint64_t v4 = *(uint64_t **)(v1 + 24);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24F3A8440(a1, v4, v5);
}

uint64_t sub_24F3A8A1C()
{
  uint64_t v1 = sub_24F3AF0E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_24F3AEDD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24F3A8B80()
{
  uint64_t v2 = *(void *)(sub_24F3AF0E8() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_24F3AEDD8() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[3] = v8;
  v10[4] = v9;
  v10[1] = sub_24F397DD8;
  void v10[2] = v7;
  return MEMORY[0x270FA2498](sub_24F3A86D8, v7, 0);
}

uint64_t sub_24F3A8CD0()
{
  uint64_t v1 = sub_24F3AEDD8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24F3A8DA4()
{
  uint64_t v2 = *(void *)(sub_24F3AEDD8() - 8);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_24F397B6C;
  return MEMORY[0x270FA2498](sub_24F3A8654, v3, 0);
}

uint64_t DynamicPredicateLogicalDescriptor.lhs.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t DynamicPredicateLogicalDescriptor.logicalOperator.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t DynamicPredicateLogicalDescriptor.rhs.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t DynamicPredicateLogicalDescriptor.init(lhs:logicalOperator:rhs:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = a2 & 1;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_24F3A8F00(char a1)
{
  return qword_24F3B2A40[a1];
}

uint64_t sub_24F3A8F20()
{
  return sub_24F3A8F00(*v0);
}

uint64_t sub_24F3A8F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3A9DDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F3A8F50(uint64_t a1)
{
  unint64_t v2 = sub_24F3A91AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3A8F8C(uint64_t a1)
{
  unint64_t v2 = sub_24F3A91AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateLogicalDescriptor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E60);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  int v12 = *((unsigned __int8 *)v1 + 8);
  uint64_t v11 = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3A91AC();
  sub_24F3AF538();
  uint64_t v14 = v8;
  char v13 = 0;
  sub_24F3A9200();
  sub_24F3AF428();
  if (!v2)
  {
    uint64_t v9 = v11;
    LOBYTE(v14) = v12;
    char v13 = 1;
    sub_24F3A9254();
    sub_24F3AF428();
    uint64_t v14 = v9;
    char v13 = 2;
    sub_24F3AF428();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24F3A91AC()
{
  unint64_t result = qword_269A04E68;
  if (!qword_269A04E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E68);
  }
  return result;
}

unint64_t sub_24F3A9200()
{
  unint64_t result = qword_269A04E70;
  if (!qword_269A04E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E70);
  }
  return result;
}

unint64_t sub_24F3A9254()
{
  unint64_t result = qword_269A04E78;
  if (!qword_269A04E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E78);
  }
  return result;
}

uint64_t DynamicPredicateLogicalDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04E80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3A91AC();
  sub_24F3AF528();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v14 = 0;
  sub_24F3A9550();
  sub_24F3AF398();
  char v14 = 1;
  uint64_t v13 = v15;
  uint64_t v9 = v15 & 0x3FFFFFFFFFFFFFFFLL;
  sub_24F3A95A4();
  swift_retain();
  sub_24F3AF398();
  v12[1] = v9;
  LOBYTE(v9) = v15;
  char v14 = 2;
  sub_24F3AF398();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v11 = v15;
  *(void *)a2 = v13;
  *(unsigned char *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v11;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_release();
  return swift_release();
}

unint64_t sub_24F3A9550()
{
  unint64_t result = qword_269A04E88;
  if (!qword_269A04E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E88);
  }
  return result;
}

unint64_t sub_24F3A95A4()
{
  unint64_t result = qword_269A04E90;
  if (!qword_269A04E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E90);
  }
  return result;
}

uint64_t sub_24F3A95F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicPredicateLogicalDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24F3A9610(void *a1)
{
  return DynamicPredicateLogicalDescriptor.encode(to:)(a1);
}

uint64_t DynamicPredicateLogicalDescriptor.hash(into:)(uint64_t a1)
{
  unint64_t v3 = *v1;
  unint64_t v4 = v1[2];
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)(a1, v3);
  swift_release();
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)(a1, v4);

  return swift_release();
}

uint64_t DynamicPredicateLogicalDescriptor.hashValue.getter()
{
  unint64_t v1 = *v0;
  unint64_t v2 = v0[2];
  sub_24F3AF4D8();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v1);
  swift_release();
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v2);
  swift_release();
  return sub_24F3AF508();
}

uint64_t sub_24F3A97B0()
{
  unint64_t v1 = *v0;
  unint64_t v2 = v0[2];
  sub_24F3AF4D8();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v1);
  swift_release();
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  swift_retain();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v4, v2);
  swift_release();
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities33DynamicPredicateLogicalDescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if ((static DynamicPredicateDescriptor.== infix(_:_:)(*(void *)a1, *(void *)a2) & 1) == 0) {
    return 0;
  }
  if (v2) {
    uint64_t v6 = 29295;
  }
  else {
    uint64_t v6 = 6581857;
  }
  if (v2) {
    unint64_t v7 = 0xE200000000000000;
  }
  else {
    unint64_t v7 = 0xE300000000000000;
  }
  if (v4) {
    uint64_t v8 = 29295;
  }
  else {
    uint64_t v8 = 6581857;
  }
  if (v4) {
    unint64_t v9 = 0xE200000000000000;
  }
  else {
    unint64_t v9 = 0xE300000000000000;
  }
  if (v6 == v8 && v7 == v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      return 0;
    }
  }

  return static DynamicPredicateDescriptor.== infix(_:_:)(v3, v5);
}

unint64_t sub_24F3A9968()
{
  unint64_t result = qword_269A04E98;
  if (!qword_269A04E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04E98);
  }
  return result;
}

uint64_t destroy for DynamicPredicateLogicalDescriptor()
{
  swift_release();

  return swift_release();
}

uint64_t _s16FitnessUtilities33DynamicPredicateLogicalDescriptorVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DynamicPredicateLogicalDescriptor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DynamicPredicateLogicalDescriptor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateLogicalDescriptor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateLogicalDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateLogicalDescriptor()
{
  return &type metadata for DynamicPredicateLogicalDescriptor;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateLogicalDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3A9C9CLL);
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

ValueMetadata *type metadata accessor for DynamicPredicateLogicalDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateLogicalDescriptor.CodingKeys;
}

unint64_t sub_24F3A9CD8()
{
  unint64_t result = qword_269A04EA0;
  if (!qword_269A04EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04EA0);
  }
  return result;
}

unint64_t sub_24F3A9D30()
{
  unint64_t result = qword_269A04EA8;
  if (!qword_269A04EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04EA8);
  }
  return result;
}

unint64_t sub_24F3A9D88()
{
  unint64_t result = qword_269A04EB0;
  if (!qword_269A04EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04EB0);
  }
  return result;
}

uint64_t sub_24F3A9DDC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7563372 && a2 == 0xE300000000000000;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F6C616369676F6CLL && a2 == 0xEF726F7461726570 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7563378 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t AttributedString.isEmptyOrWhiteSpace.getter()
{
  uint64_t v0 = sub_24F3AED08();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v34 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = (char *)&v28 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F18);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24F3AECE8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v28 - v14;
  sub_24F3AECD8();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v28 = v15;
  uint64_t v29 = v16;
  v16(v13, (uint64_t)v15, v9);
  sub_24F3AA708(&qword_26B1F2B58, MEMORY[0x263F066D8]);
  os_log_type_t v30 = v13;
  sub_24F3AEF28();
  uint64_t v17 = &v8[*(int *)(v6 + 44)];
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v31 = v10 + 16;
  uint64_t v32 = v18;
  uint64_t v35 = v1 + 16;
  unint64_t v19 = (void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v36 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v37 = v8;
  do
  {
    uint64_t v20 = v33;
    v32(v33, v17, v0);
    sub_24F3AA708(&qword_26B1F2B60, MEMORY[0x263F066D8]);
    uint64_t v21 = v34;
    sub_24F3AF1A8();
    sub_24F3AA708(&qword_26B1F2B70, MEMORY[0x263F067E8]);
    char v22 = sub_24F3AEE88();
    unint64_t v23 = *v19;
    (*v19)(v21, v0);
    v23(v20, v0);
    if (v22) {
      break;
    }
    uint64_t v24 = (uint64_t)v37;
    unint64_t v25 = (void (*)(char *, void))sub_24F3AF1F8();
    swift_bridgeObjectRetain();
    v25(v38, 0);
    int64_t v26 = v30;
    v29(v30, v24, v9);
    sub_24F3AF1B8();
    (*v36)(v26, v9);
    LOBYTE(v24) = sub_24F3AEE68();
    swift_bridgeObjectRelease();
  }
  while ((v24 & 1) != 0);
  sub_24F3AA6AC((uint64_t)v37, &qword_26B1F2F18);
  (*v36)(v28, v9);
  return v22 & 1;
}

uint64_t AttributedString.mergingAttributesWith(_:mergePolicy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F3AECF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EB8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24F3AED28();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3AA644(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24F3AA6AC((uint64_t)v10, &qword_269A04EB8);
    uint64_t v15 = sub_24F3AED18();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06728], v4);
    uint64_t v17 = sub_24F3AED18();
    sub_24F3AA708(&qword_269A04EC0, MEMORY[0x263F06828]);
    sub_24F3AED68();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a2, 0, 1, v17);
  }
}

uint64_t sub_24F3AA644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3AA6AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24F3AA708(unint64_t *a1, void (*a2)(uint64_t))
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

FitnessUtilities::DynamicPredicateLogicalOperator_optional __swiftcall DynamicPredicateLogicalOperator.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_24F3AF318();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = FitnessUtilities_DynamicPredicateLogicalOperator_or;
  }
  else {
    v2.value = FitnessUtilities_DynamicPredicateLogicalOperator_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t DynamicPredicateLogicalOperator.rawValue.getter(char a1)
{
  if (a1) {
    return 29295;
  }
  else {
    return 6581857;
  }
}

uint64_t sub_24F3AA7C8(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = DynamicPredicateLogicalOperator.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == DynamicPredicateLogicalOperator.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F3AA854@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24F3AF318();
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

uint64_t sub_24F3AA8B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DynamicPredicateLogicalOperator.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24F3AA8E0()
{
  return sub_24F3AEFB8();
}

uint64_t sub_24F3AA940()
{
  return sub_24F3AEF68();
}

unint64_t sub_24F3AA994()
{
  unint64_t result = qword_269A04EC8;
  if (!qword_269A04EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04EC8);
  }
  return result;
}

uint64_t sub_24F3AA9E8()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateLogicalOperator.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

uint64_t sub_24F3AAA4C()
{
  DynamicPredicateLogicalOperator.rawValue.getter(*v0);
  sub_24F3AEED8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3AAAA0()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateLogicalOperator.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateLogicalOperator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3AABCCLL);
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

ValueMetadata *type metadata accessor for DynamicPredicateLogicalOperator()
{
  return &type metadata for DynamicPredicateLogicalOperator;
}

unint64_t sub_24F3AAC04()
{
  unint64_t result = qword_269A04ED0;
  if (!qword_269A04ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04ED0);
  }
  return result;
}

uint64_t NSWrappedKey.wrapped.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                            + 0x50)
                                                                - 8)
                                                    + 16))(a1, &v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)]);
}

id NSWrappedKey.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  id v5 = sub_24F3AB160(a1);
  (*(void (**)(uint64_t))(*(void *)(*((void *)v2 + 10) - 8) + 8))(a1);
  return v5;
}

id NSWrappedKey.init(_:)(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  id v4 = sub_24F3AB160(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t sub_24F3AADC4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NSWrappedKey.hash.getter();

  return v2;
}

uint64_t NSWrappedKey.hash.getter()
{
  return sub_24F3AEE58();
}

uint64_t NSWrappedKey.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_24F3AB21C(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_24F3AB284((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = sub_24F3AEE88();

  return v2 & 1;
}

uint64_t sub_24F3AAF90(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_24F3AF278();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = NSWrappedKey.isEqual(_:)((uint64_t)v8);

  sub_24F3AB284((uint64_t)v8);
  return v6 & 1;
}

id NSWrappedKey.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void NSWrappedKey.init()()
{
}

void sub_24F3AB07C()
{
}

id NSWrappedKey.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24F3AB0F8(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

id sub_24F3AB160(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50)
                                                      - 8)
                                          + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1);
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_24F3AB21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3AB284(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2FB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24F3AB2E4()
{
}

uint64_t sub_24F3AB314()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for NSWrappedKey()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for NSWrappedKey(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NSWrappedKey);
}

uint64_t dispatch thunk of NSWrappedKey.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_24F3AB3F0(char a1)
{
  return *(void *)&aBoolean_0[8 * a1];
}

uint64_t sub_24F3AB410(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC6B0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3AB44C(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC6B0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3AB488()
{
  return sub_24F3AB3F0(*v0);
}

uint64_t sub_24F3AB490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F3AD90C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F3AB4B8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24F3AB4C4(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC464();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3AB500(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC464();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3AB53C(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC608();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3AB578(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC608();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3AB5B4(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC560();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3AB5F0(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC560();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F3AB62C(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC4B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F3AB668(uint64_t a1)
{
  unint64_t v2 = sub_24F3AC4B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicPredicateDescriptor.encode(to:)(void *a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04ED8);
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v47 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EE0);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EE8);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EF0);
  uint64_t v42 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04EF8);
  uint64_t v50 = *(void *)(v15 - 8);
  uint64_t v51 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F3AC464();
  sub_24F3AF538();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v34 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      LODWORD(v49) = *(unsigned __int8 *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v35 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v36 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      char v37 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v38 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x30);
      uint64_t v39 = *(void *)(v34 + 56);
      LODWORD(v48) = *(unsigned __int8 *)(v34 + 64);
      LOBYTE(v52) = 1;
      sub_24F3AC608();
      uint64_t v26 = v51;
      sub_24F3AF3C8();
      LOBYTE(v52) = v49;
      uint64_t v53 = v35;
      uint64_t v54 = v36;
      LOBYTE(v55) = v37;
      uint64_t v56 = v38;
      uint64_t v57 = v39;
      char v58 = v48;
      sub_24F3AC65C();
      uint64_t v40 = v44;
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v40);
      goto LABEL_6;
    case 2uLL:
      uint64_t v21 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v49 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      char v22 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      uint64_t v23 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v24 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x30);
      char v25 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x38);
      LOBYTE(v52) = 2;
      sub_24F3AC560();
      uint64_t v26 = v51;
      sub_24F3AF3C8();
      uint64_t v52 = v49;
      uint64_t v53 = v21;
      LOBYTE(v54) = v22;
      uint64_t v55 = v23;
      uint64_t v56 = v24;
      LOBYTE(v57) = v25;
      sub_24F3AC5B4();
      uint64_t v27 = v46;
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v27);
LABEL_6:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v17, v26);
      break;
    case 3uLL:
      uint64_t v28 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      char v29 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v30 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      LOBYTE(v52) = 3;
      sub_24F3AC4B8();
      swift_retain();
      swift_retain();
      uint64_t v31 = v47;
      uint64_t v32 = v51;
      sub_24F3AF3C8();
      uint64_t v52 = v28;
      LOBYTE(v53) = v29;
      uint64_t v54 = v30;
      sub_24F3AC50C();
      uint64_t v33 = v49;
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v33);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v17, v32);
      swift_release();
      uint64_t result = swift_release();
      break;
    default:
      char v18 = *(unsigned char *)(a2 + 16);
      LOBYTE(v52) = 0;
      sub_24F3AC6B0();
      uint64_t v19 = v51;
      sub_24F3AF3C8();
      LOBYTE(v52) = v18;
      sub_24F3AC704();
      sub_24F3AF428();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v12);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v17, v19);
      break;
  }
  return result;
}

unint64_t DynamicPredicateDescriptor.init(from:)(void *a1)
{
  return sub_24F3AC758(a1);
}

unint64_t sub_24F3ABCC4@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_24F3AC758(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24F3ABCF0(void *a1)
{
  return DynamicPredicateDescriptor.encode(to:)(a1, *v1);
}

uint64_t DynamicPredicateDescriptor.hash(into:)(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = *(unsigned __int8 *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v5 = *(unsigned __int8 *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x40);
      sub_24F3AF4E8();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      switch(v4)
      {
        case 3:
          sub_24F3AF4E8();
          sub_24F3AEED8();
          swift_bridgeObjectRelease();
          break;
        case 4:
          sub_24F3AF4E8();
          sub_24F3AEED8();
          break;
        default:
          sub_24F3AF4E8();
          sub_24F3AF4E8();
          break;
      }
      switch(v5)
      {
        case 3:
          sub_24F3AF4E8();
          sub_24F3AEED8();
          uint64_t result = swift_bridgeObjectRelease();
          break;
        case 4:
          sub_24F3AF4E8();
          uint64_t result = sub_24F3AEED8();
          break;
        default:
          sub_24F3AF4E8();
          uint64_t result = sub_24F3AF4E8();
          break;
      }
      break;
    case 2uLL:
      sub_24F3AF4E8();
      DynamicPredicateEquatableValue.hash(into:)();
      uint64_t result = DynamicPredicateEquatableValue.hash(into:)();
      break;
    case 3uLL:
      uint64_t v6 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v7 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      sub_24F3AF4E8();
      swift_retain();
      swift_retain_n();
      DynamicPredicateDescriptor.hash(into:)(a1, v6);
      swift_release();
      sub_24F3AEED8();
      swift_bridgeObjectRelease();
      swift_retain();
      DynamicPredicateDescriptor.hash(into:)(a1, v7);
      swift_release();
      uint64_t result = swift_release_n();
      break;
    default:
      sub_24F3AF4E8();
      uint64_t result = sub_24F3AF4F8();
      break;
  }
  return result;
}

uint64_t DynamicPredicateDescriptor.hashValue.getter(unint64_t a1)
{
  sub_24F3AF4D8();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, a1);
  return sub_24F3AF508();
}

uint64_t sub_24F3AC1F8()
{
  unint64_t v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, v1);
  return sub_24F3AF508();
}

uint64_t sub_24F3AC240(uint64_t a1)
{
  return DynamicPredicateDescriptor.hash(into:)(a1, *v1);
}

uint64_t sub_24F3AC248()
{
  unint64_t v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicateDescriptor.hash(into:)((uint64_t)v3, v1);
  return sub_24F3AF508();
}

uint64_t sub_24F3AC28C(unint64_t *a1, unint64_t *a2)
{
  return _s16FitnessUtilities26DynamicPredicateDescriptorO2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t _s16FitnessUtilities26DynamicPredicateDescriptorO2eeoiySbAC_ACtFZ_0(unint64_t a1, unint64_t a2)
{
  switch(a1 >> 62)
  {
    case 1uLL:
      if (a2 >> 62 != 1) {
        goto LABEL_12;
      }
      char v3 = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x40);
      char v4 = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      char v5 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      char v6 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      char v7 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x40);
      v26[0] = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      *(_OWORD *)&v26[8] = *(_OWORD *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      char v27 = v4;
      long long v28 = *(_OWORD *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x30);
      char v29 = v3;
      v22[0] = v5;
      *(_OWORD *)&v22[8] = *(_OWORD *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      char v23 = v6;
      long long v24 = *(_OWORD *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x30);
      char v25 = v7;
      char v2 = _s16FitnessUtilities36DynamicPredicateComparisonDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)v26, (uint64_t)v22);
      break;
    case 2uLL:
      if (a2 >> 62 != 2) {
        goto LABEL_12;
      }
      long long v8 = *(_OWORD *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      char v9 = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x38);
      char v10 = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      char v11 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      uint64_t v12 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v13 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x30);
      char v14 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x38);
      *(_OWORD *)uint64_t v26 = *(_OWORD *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      v26[16] = v10;
      long long v21 = v8;
      *(_OWORD *)char v22 = *(_OWORD *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      v22[16] = v11;
      if ((_s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)v26, (uint64_t)v22) & 1) == 0) {
        goto LABEL_12;
      }
      *(_OWORD *)uint64_t v26 = v21;
      v26[16] = v9;
      *(void *)char v22 = v12;
      *(void *)&v22[8] = v13;
      v22[16] = v14;
      if ((_s16FitnessUtilities30DynamicPredicateEquatableValueO2eeoiySbAC_ACtFZ_0((uint64_t)v26, (uint64_t)v22) & 1) == 0) {
        goto LABEL_12;
      }
      char v2 = 1;
      break;
    case 3uLL:
      if (a2 >> 62 != 3) {
        goto LABEL_12;
      }
      uint64_t v15 = *(void *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      char v16 = *(unsigned char *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v17 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      char v18 = *(unsigned char *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v19 = *(void *)((a2 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
      *(void *)uint64_t v26 = *(void *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      v26[8] = v16;
      *(void *)&v26[16] = v15;
      *(void *)char v22 = v17;
      v22[8] = v18;
      *(void *)&v22[16] = v19;
      char v2 = _s16FitnessUtilities33DynamicPredicateLogicalDescriptorV2eeoiySbAC_ACtFZ_0((uint64_t)v26, (uint64_t)v22);
      break;
    default:
      if (a2 >> 62) {
LABEL_12:
      }
        char v2 = 0;
      else {
        char v2 = *(unsigned char *)(a1 + 16) ^ *(unsigned char *)(a2 + 16) ^ 1;
      }
      break;
  }
  return v2 & 1;
}

unint64_t sub_24F3AC464()
{
  unint64_t result = qword_269A04F00;
  if (!qword_269A04F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F00);
  }
  return result;
}

unint64_t sub_24F3AC4B8()
{
  unint64_t result = qword_269A04F08;
  if (!qword_269A04F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F08);
  }
  return result;
}

unint64_t sub_24F3AC50C()
{
  unint64_t result = qword_269A04F10;
  if (!qword_269A04F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F10);
  }
  return result;
}

unint64_t sub_24F3AC560()
{
  unint64_t result = qword_269A04F18;
  if (!qword_269A04F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F18);
  }
  return result;
}

unint64_t sub_24F3AC5B4()
{
  unint64_t result = qword_269A04F20;
  if (!qword_269A04F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F20);
  }
  return result;
}

unint64_t sub_24F3AC608()
{
  unint64_t result = qword_269A04F28;
  if (!qword_269A04F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F28);
  }
  return result;
}

unint64_t sub_24F3AC65C()
{
  unint64_t result = qword_269A04F30;
  if (!qword_269A04F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F30);
  }
  return result;
}

unint64_t sub_24F3AC6B0()
{
  unint64_t result = qword_269A04F38;
  if (!qword_269A04F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F38);
  }
  return result;
}

unint64_t sub_24F3AC704()
{
  unint64_t result = qword_269A04F40;
  if (!qword_269A04F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F40);
  }
  return result;
}

unint64_t sub_24F3AC758(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04FC8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v45 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04FD0);
  uint64_t v43 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v44 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04FD8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04FE0);
  uint64_t v38 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A04FE8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1[3];
  unint64_t v17 = a1[4];
  uint64_t v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_24F3AC464();
  uint64_t v19 = v47;
  sub_24F3AF528();
  if (!v19)
  {
    uint64_t v20 = v12;
    uint64_t v36 = v10;
    uint64_t v22 = v44;
    long long v21 = v45;
    uint64_t v47 = v14;
    uint64_t v23 = sub_24F3AF3A8();
    if (*(void *)(v23 + 16) == 1)
    {
      switch(*(unsigned char *)(v23 + 32))
      {
        case 1:
          char v49 = 1;
          sub_24F3AC608();
          sub_24F3AF328();
          uint64_t v27 = swift_allocObject();
          sub_24F3ADC38();
          uint64_t v28 = v39;
          sub_24F3AF398();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v13);
          unint64_t v17 = v27 | 0x4000000000000000;
          break;
        case 2:
          char v50 = 2;
          sub_24F3AC560();
          uint64_t v29 = v22;
          sub_24F3AF328();
          uint64_t v30 = swift_allocObject();
          sub_24F3ADB9C();
          uint64_t v31 = v37;
          sub_24F3AF398();
          uint64_t v32 = v47;
          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v29, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v13);
          unint64_t v17 = v30 | 0x8000000000000000;
          break;
        case 3:
          char v51 = 3;
          sub_24F3AC4B8();
          sub_24F3AF328();
          uint64_t v44 = swift_allocObject();
          sub_24F3ADB00();
          uint64_t v34 = v41;
          sub_24F3AF398();
          uint64_t v35 = v47;
          (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v34);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v13);
          unint64_t v17 = v44 | 0xC000000000000000;
          break;
        default:
          char v48 = 0;
          sub_24F3AC6B0();
          sub_24F3AF328();
          unint64_t v17 = swift_allocObject();
          sub_24F3ADC9C();
          uint64_t v24 = v36;
          sub_24F3AF398();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v24);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v13);
          break;
      }
    }
    else
    {
      unint64_t v17 = sub_24F3AF2C8();
      swift_allocError();
      uint64_t v26 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A04860);
      *uint64_t v26 = &type metadata for DynamicPredicateDescriptor;
      sub_24F3AF338();
      sub_24F3AF2B8();
      (*(void (**)(void *, void, unint64_t))(*(void *)(v17 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v13);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  return v17;
}

unint64_t sub_24F3ACFDC()
{
  unint64_t result = qword_269A04F48;
  if (!qword_269A04F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F48);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DynamicPredicateDescriptor(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for DynamicPredicateDescriptor()
{
  return swift_release();
}

void *assignWithCopy for DynamicPredicateDescriptor(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for DynamicPredicateDescriptor(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicPredicateDescriptor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DynamicPredicateDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)unint64_t result = a2 - 125;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_24F3AD198(void *a1)
{
  return *a1 >> 62;
}

void *sub_24F3AD1A4(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_24F3AD1B4(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor()
{
  return &type metadata for DynamicPredicateDescriptor;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicateDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3AD2A4);
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

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.CodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.CodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.BooleanCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.BooleanCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.ComparisonCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.ComparisonCodingKeys;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.EqualityCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.EqualityCodingKeys;
}

unsigned char *_s16FitnessUtilities26DynamicPredicateDescriptorO17BooleanCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F3AD3ACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicPredicateDescriptor.LogicalCodingKeys()
{
  return &type metadata for DynamicPredicateDescriptor.LogicalCodingKeys;
}

unint64_t sub_24F3AD3E8()
{
  unint64_t result = qword_269A04F50;
  if (!qword_269A04F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F50);
  }
  return result;
}

unint64_t sub_24F3AD440()
{
  unint64_t result = qword_269A04F58;
  if (!qword_269A04F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F58);
  }
  return result;
}

unint64_t sub_24F3AD498()
{
  unint64_t result = qword_269A04F60;
  if (!qword_269A04F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F60);
  }
  return result;
}

unint64_t sub_24F3AD4F0()
{
  unint64_t result = qword_269A04F68;
  if (!qword_269A04F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F68);
  }
  return result;
}

unint64_t sub_24F3AD548()
{
  unint64_t result = qword_269A04F70;
  if (!qword_269A04F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F70);
  }
  return result;
}

unint64_t sub_24F3AD5A0()
{
  unint64_t result = qword_269A04F78;
  if (!qword_269A04F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F78);
  }
  return result;
}

unint64_t sub_24F3AD5F8()
{
  unint64_t result = qword_269A04F80;
  if (!qword_269A04F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F80);
  }
  return result;
}

unint64_t sub_24F3AD650()
{
  unint64_t result = qword_269A04F88;
  if (!qword_269A04F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F88);
  }
  return result;
}

unint64_t sub_24F3AD6A8()
{
  unint64_t result = qword_269A04F90;
  if (!qword_269A04F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F90);
  }
  return result;
}

unint64_t sub_24F3AD700()
{
  unint64_t result = qword_269A04F98;
  if (!qword_269A04F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04F98);
  }
  return result;
}

unint64_t sub_24F3AD758()
{
  unint64_t result = qword_269A04FA0;
  if (!qword_269A04FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FA0);
  }
  return result;
}

unint64_t sub_24F3AD7B0()
{
  unint64_t result = qword_269A04FA8;
  if (!qword_269A04FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FA8);
  }
  return result;
}

unint64_t sub_24F3AD808()
{
  unint64_t result = qword_269A04FB0;
  if (!qword_269A04FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FB0);
  }
  return result;
}

unint64_t sub_24F3AD860()
{
  unint64_t result = qword_269A04FB8;
  if (!qword_269A04FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FB8);
  }
  return result;
}

unint64_t sub_24F3AD8B8()
{
  unint64_t result = qword_269A04FC0;
  if (!qword_269A04FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FC0);
  }
  return result;
}

uint64_t sub_24F3AD90C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E61656C6F6F62 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73697261706D6F63 && a2 == 0xEA00000000006E6FLL || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7974696C61757165 && a2 == 0xE800000000000000 || (sub_24F3AF468() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C616369676F6CLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24F3AF468();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24F3ADAB8()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

unint64_t sub_24F3ADB00()
{
  unint64_t result = qword_269A04FF0;
  if (!qword_269A04FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FF0);
  }
  return result;
}

uint64_t sub_24F3ADB54()
{
  sub_24F392C40(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  sub_24F392C40(*(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return MEMORY[0x270FA0238](v0, 57, 7);
}

unint64_t sub_24F3ADB9C()
{
  unint64_t result = qword_269A04FF8;
  if (!qword_269A04FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A04FF8);
  }
  return result;
}

uint64_t sub_24F3ADBF0()
{
  sub_24F38B588(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  sub_24F38B588(*(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));

  return MEMORY[0x270FA0238](v0, 65, 7);
}

unint64_t sub_24F3ADC38()
{
  unint64_t result = qword_269A05000;
  if (!qword_269A05000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A05000);
  }
  return result;
}

uint64_t sub_24F3ADC8C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24F3ADC9C()
{
  unint64_t result = qword_269A05008;
  if (!qword_269A05008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A05008);
  }
  return result;
}

uint64_t DynamicPredicatePlatform.rawValue.getter(char a1)
{
  return *(void *)&aPhone_3[8 * a1];
}

uint64_t sub_24F3ADD18(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = DynamicPredicatePlatform.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == DynamicPredicatePlatform.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F3AF468();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F3ADDA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s16FitnessUtilities24DynamicPredicatePlatformO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_24F3ADDD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DynamicPredicatePlatform.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void *static DynamicPredicatePlatform.allCases.getter()
{
  return &unk_2700C67A8;
}

void sub_24F3ADE0C(void *a1@<X8>)
{
  *a1 = &unk_2700C67D0;
}

uint64_t sub_24F3ADE1C()
{
  return sub_24F3AEFB8();
}

uint64_t sub_24F3ADE7C()
{
  return sub_24F3AEF68();
}

uint64_t sub_24F3ADECC()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicatePlatform.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

uint64_t sub_24F3ADF30()
{
  DynamicPredicatePlatform.rawValue.getter(*v0);
  sub_24F3AEED8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24F3ADF84()
{
  char v1 = *v0;
  sub_24F3AF4D8();
  DynamicPredicatePlatform.rawValue.getter(v1);
  sub_24F3AEED8();
  swift_bridgeObjectRelease();
  return sub_24F3AF508();
}

uint64_t _s16FitnessUtilities24DynamicPredicatePlatformO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24F3AF318();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_24F3AE034()
{
  unint64_t result = qword_269A05010;
  if (!qword_269A05010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A05018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A05010);
  }
  return result;
}

unint64_t sub_24F3AE094()
{
  unint64_t result = qword_269A05020;
  if (!qword_269A05020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A05020);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DynamicPredicatePlatform(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F3AE1B4);
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

ValueMetadata *type metadata accessor for DynamicPredicatePlatform()
{
  return &type metadata for DynamicPredicatePlatform;
}

unint64_t sub_24F3AE1EC()
{
  unint64_t result = qword_269A05028;
  if (!qword_269A05028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A05028);
  }
  return result;
}

Swift::Double __swiftcall Double.milliseconds()()
{
  return v0 * 1000.0;
}

double static Double.minutes(_:)(double a1)
{
  return a1 * 60.0;
}

double static Double.hours(_:)(double a1)
{
  return a1 * 3600.0;
}

double static Double.days(_:)(unint64_t a1)
{
  return (double)a1 * 86400.0;
}

double static Double.years(_:)(unint64_t a1)
{
  return (double)a1 * 31536000.0;
}

BOOL Optional<A>.isEmptyOrWhiteSpace.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F3AECC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    return 1;
  }
  v13[0] = a1;
  v13[1] = a2;
  swift_bridgeObjectRetain();
  sub_24F3AECB8();
  sub_24F3A6760();
  uint64_t v8 = sub_24F3AF268();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  return v11 == 0;
}

BOOL StringProtocol.isEmptyOrWhiteSpace.getter()
{
  uint64_t v0 = sub_24F3AECC8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3AECB8();
  uint64_t v4 = sub_24F3AF268();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
  }
  return v7 == 0;
}

uint64_t String.init(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1F2F30);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24F3AECE8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24F3AECD8();
  sub_24F3AE67C((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = sub_24F3AEEB8();
  uint64_t v10 = sub_24F3AED18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_24F3AE67C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2B68);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  char v48 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v52 = (char *)&v43 - v6;
  uint64_t v7 = sub_24F3AED08();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v57 = (char *)&v43 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v55 = (char *)&v43 - v16;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F10);
  uint64_t v17 = MEMORY[0x270FA5388](v49);
  char v50 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v51 = (uint64_t)&v43 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F20);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24F3AECE8();
  uint64_t v24 = sub_24F3AEC08(&qword_26B1F2B60, MEMORY[0x263F066D8]);
  uint64_t v58 = v23;
  uint64_t v56 = v24;
  sub_24F3AF198();
  sub_24F3AEC08(&qword_26B1F2B70, MEMORY[0x263F067E8]);
  uint64_t result = sub_24F3AEE88();
  if (result)
  {
    uint64_t v53 = v3;
    uint64_t v46 = a1;
    uint64_t v26 = v54;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
    uint64_t v28 = v55;
    v27(v55, v22, v7);
    uint64_t v29 = v57;
    uint64_t v47 = v1;
    sub_24F3AF1A8();
    v27(v13, v28, v7);
    uint64_t v45 = v27;
    v27(v10, v29, v7);
    sub_24F3AA6AC((uint64_t)v22, &qword_26B1F2F20);
    sub_24F3AEC08(qword_26B1F2A50, MEMORY[0x263F067E8]);
    char v30 = sub_24F3AEE78();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v26 + 8);
    v31(v10, v7);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v13, v7);
    if (v30)
    {
      uint64_t v32 = v48;
      uint64_t v44 = v31;
      uint64_t v33 = v53;
      uint64_t v34 = v52;
      uint64_t v35 = &v52[*(int *)(v53 + 48)];
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
      v36(v52, v55, v7);
      uint64_t v43 = v35;
      v36(v35, v57, v7);
      uint64_t v37 = &v32[*(int *)(v33 + 48)];
      uint64_t v38 = v45;
      v45(v32, v34, v7);
      v38(v37, v35, v7);
      uint64_t v39 = (uint64_t)v50;
      v36(v50, v32, v7);
      uint64_t v40 = v44;
      v44(v37, v7);
      uint64_t v41 = &v32[*(int *)(v53 + 48)];
      v36(v32, v34, v7);
      v36(v41, v43, v7);
      v36((char *)(v39 + *(int *)(v49 + 36)), v41, v7);
      v40(v32, v7);
      uint64_t v42 = v51;
      sub_24F3AEC50(v39, v51);
      sub_24F3AF1E8();
      return sub_24F3AA6AC(v42, &qword_26B1F2F10);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24F3AEC08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F3AEC50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1F2F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F3AECB8()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_24F3AECC8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24F3AECD8()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_24F3AECE8()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_24F3AECF8()
{
  return MEMORY[0x270EEEBF8]();
}

uint64_t sub_24F3AED08()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_24F3AED18()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24F3AED28()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24F3AED38()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_24F3AED48()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24F3AED58()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_24F3AED68()
{
  return MEMORY[0x270EEF908]();
}

uint64_t sub_24F3AED78()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24F3AED88()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24F3AED98()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24F3AEDA8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24F3AEDB8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F3AEDC8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24F3AEDD8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24F3AEDE8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24F3AEDF8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F3AEE08()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24F3AEE18()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24F3AEE28()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24F3AEE38()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_24F3AEE48()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24F3AEE58()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24F3AEE68()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_24F3AEE78()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_24F3AEE88()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24F3AEE98()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24F3AEEA8()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_24F3AEEB8()
{
  return MEMORY[0x270EF1B30]();
}

uint64_t sub_24F3AEEC8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24F3AEED8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F3AEEE8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24F3AEEF8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24F3AEF08()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24F3AEF18()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24F3AEF28()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24F3AEF38()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_24F3AEF48()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24F3AEF58()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_24F3AEF68()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24F3AEF78()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24F3AEFB8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24F3AEFC8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24F3AEFD8()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24F3AEFE8()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_24F3AEFF8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24F3AF008()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24F3AF018()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24F3AF028()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F3AF038()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24F3AF048()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24F3AF058()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24F3AF068()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24F3AF078()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24F3AF088()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_24F3AF098()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24F3AF0A8()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_24F3AF0B8()
{
  return MEMORY[0x270FA1F40]();
}

uint64_t sub_24F3AF0C8()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24F3AF0D8()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_24F3AF0E8()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_24F3AF0F8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24F3AF118()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_24F3AF128()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_24F3AF138()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24F3AF158()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24F3AF168()
{
  return MEMORY[0x270FA2090]();
}

uint64_t sub_24F3AF178()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_24F3AF188()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_24F3AF198()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24F3AF1A8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24F3AF1B8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24F3AF1C8()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24F3AF1D8()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24F3AF1E8()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_24F3AF1F8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24F3AF208()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24F3AF218()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24F3AF228()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F3AF238()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24F3AF248()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24F3AF258()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24F3AF268()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_24F3AF278()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24F3AF288()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24F3AF298()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24F3AF2A8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24F3AF2B8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F3AF2C8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F3AF2D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24F3AF2E8()
{
  return MEMORY[0x270FA2238]();
}

uint64_t sub_24F3AF2F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F3AF308()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F3AF318()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F3AF328()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F3AF338()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F3AF348()
{
  return MEMORY[0x270F9F260]();
}

uint64_t sub_24F3AF358()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F3AF368()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F3AF378()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24F3AF388()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24F3AF398()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F3AF3A8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F3AF3B8()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24F3AF3C8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F3AF3D8()
{
  return MEMORY[0x270F9F3A0]();
}

uint64_t sub_24F3AF3E8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F3AF3F8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F3AF408()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24F3AF418()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24F3AF428()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F3AF438()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24F3AF448()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24F3AF468()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F3AF498()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24F3AF4A8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24F3AF4B8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24F3AF4C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24F3AF4D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F3AF4E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F3AF4F8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24F3AF508()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F3AF518()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24F3AF528()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F3AF538()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24F3AF568()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
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

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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