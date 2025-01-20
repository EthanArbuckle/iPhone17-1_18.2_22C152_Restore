uint64_t CAUPhysicalControlBarsLayout.seat_front_left.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CAUPhysicalControlBarsLayout.seat_front_right.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CAUPhysicalControlBarsLayout.seat_front.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_2498108D0(char a1)
{
  if (!a1) {
    return 0x6F72665F74616573;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0x6F72665F74616573;
}

BOOL sub_24981093C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s13CarAssetUtils19CAUVehicleLayoutKeyO4SideO9hashValueSivg_0()
{
  return sub_24982E848();
}

uint64_t sub_249810998()
{
  return sub_24982E838();
}

uint64_t sub_2498109C4()
{
  return sub_24982E848();
}

unint64_t sub_249810A08()
{
  return sub_2498108D0(*v0);
}

uint64_t sub_249810A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2498125F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_249810A38()
{
  return 0;
}

void sub_249810A44(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_249810A50(uint64_t a1)
{
  unint64_t v2 = sub_249810D6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249810A8C(uint64_t a1)
{
  unint64_t v2 = sub_249810D6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUPhysicalControlBarsLayout.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0948);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v14 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249810D6C();
  sub_24982E868();
  uint64_t v16 = v9;
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0958);
  sub_2498111F8(&qword_2696D0960, (void (*)(void))sub_249810E08, (void (*)(void))sub_249810E5C);
  sub_24982E748();
  if (!v2)
  {
    uint64_t v10 = v13;
    uint64_t v16 = v14;
    char v15 = 1;
    sub_24982E748();
    uint64_t v16 = v10;
    char v15 = 2;
    sub_24982E748();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
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

unint64_t sub_249810D6C()
{
  unint64_t result = qword_2696D0950;
  if (!qword_2696D0950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0950);
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

unint64_t sub_249810E08()
{
  unint64_t result = qword_2696D0968;
  if (!qword_2696D0968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0968);
  }
  return result;
}

unint64_t sub_249810E5C()
{
  unint64_t result = qword_2696D0970;
  if (!qword_2696D0970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0970);
  }
  return result;
}

uint64_t CAUPhysicalControlBarsLayout.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0978);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249810D6C();
  sub_24982E858();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0958);
  char v17 = 0;
  sub_2498111F8(&qword_2696D0980, (void (*)(void))sub_249811280, (void (*)(void))sub_2498112D4);
  sub_24982E6E8();
  uint64_t v16 = a2;
  uint64_t v9 = v18;
  char v17 = 1;
  swift_bridgeObjectRetain();
  sub_24982E6E8();
  char v17 = 2;
  uint64_t v15 = v18;
  swift_bridgeObjectRetain();
  sub_24982E6E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v18;
  swift_bridgeObjectRetain();
  uint64_t v12 = v15;
  v11 = v16;
  *uint64_t v16 = v9;
  v11[1] = v12;
  v11[2] = v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
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

uint64_t sub_2498111F8(unint64_t *a1, void (*a2)(void), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D0958);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_249811280()
{
  unint64_t result = qword_2696D0988;
  if (!qword_2696D0988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0988);
  }
  return result;
}

unint64_t sub_2498112D4()
{
  unint64_t result = qword_2696D0990;
  if (!qword_2696D0990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0990);
  }
  return result;
}

uint64_t sub_249811328@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return CAUPhysicalControlBarsLayout.init(from:)(a1, a2);
}

uint64_t sub_249811340(void *a1)
{
  return CAUPhysicalControlBarsLayout.encode(to:)(a1);
}

unint64_t CAUPhysicalControlBarsLayout.allLayouts.getter()
{
  return sub_2498114F0((uint64_t)&unk_26FD95570);
}

void *static CAUPhysicalControlBarsButton.allCases.getter()
{
  return &unk_26FD95598;
}

unint64_t sub_249811370(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  unint64_t v6 = sub_24981152C(MEMORY[0x263F8EE78]);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = sub_2498127A8(v7, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_249816614(v8, 23, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_2498127A8(v10, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_249816614(v11, 25, v12);
    swift_bridgeObjectRelease();
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_2498127A8(v13, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    sub_249816614(v14, 22, v15);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t CAUPhysicalControlBarsLayout.climateLayouts.getter()
{
  return sub_2498114F0((uint64_t)&unk_26FD955C0);
}

unint64_t sub_2498114F0(uint64_t a1)
{
  return sub_249811370(a1);
}

unint64_t sub_24981152C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D09D8);
  uint64_t v2 = (void *)sub_24982E6A8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2498159DC(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
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

uint64_t sub_249811630(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (2)
  {
    uint64_t v6 = a2 + v5++;
    unint64_t v7 = 0x80000002498320E0;
    unint64_t v8 = 0xD000000000000012;
    switch(*(unsigned char *)(v6 + 32))
    {
      case 1:
        unint64_t v7 = 0xE300000000000000;
        unint64_t v8 = 7233894;
        break;
      case 2:
        unint64_t v7 = 0xE700000000000000;
        unint64_t v8 = 0x6E614674616573;
        break;
      case 3:
        break;
      case 4:
        unint64_t v7 = 0xE800000000000000;
        unint64_t v8 = 0x6B6E694C70656564;
        break;
      default:
        unint64_t v8 = 0x74617265706D6574;
        unint64_t v7 = 0xEB00000000657275;
        break;
    }
    unint64_t v9 = 0x80000002498320E0;
    unint64_t v10 = 0xD000000000000012;
    switch(a1)
    {
      case 1:
        unint64_t v9 = 0xE300000000000000;
        if (v8 == 7233894) {
          goto LABEL_15;
        }
        goto LABEL_16;
      case 2:
        unint64_t v9 = 0xE700000000000000;
        unint64_t v10 = 0x6E614674616573;
        goto LABEL_14;
      case 3:
LABEL_14:
        if (v8 == v10) {
          goto LABEL_15;
        }
        goto LABEL_16;
      case 4:
        unint64_t v9 = 0xE800000000000000;
        if (v8 != 0x6B6E694C70656564) {
          goto LABEL_16;
        }
        goto LABEL_15;
      default:
        unint64_t v9 = 0xEB00000000657275;
        if (v8 != 0x74617265706D6574) {
          goto LABEL_16;
        }
LABEL_15:
        if (v7 != v9)
        {
LABEL_16:
          char v11 = sub_24982E7B8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            goto LABEL_22;
          }
          if (v2 == v5)
          {
            swift_bridgeObjectRelease();
            return 0;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_22:
        swift_bridgeObjectRelease();
        return 1;
    }
  }
}

CarAssetUtils::CAUPhysicalControlBarsButton_optional __swiftcall CAUPhysicalControlBarsButton.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24982E6C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t CAUPhysicalControlBarsButton.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 7233894;
      break;
    case 2:
      unint64_t result = 0x6E614674616573;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6B6E694C70656564;
      break;
    default:
      unint64_t result = 0x74617265706D6574;
      break;
  }
  return result;
}

uint64_t sub_249811974(unsigned __int8 *a1, char *a2)
{
  return sub_249825494(*a1, *a2);
}

unint64_t sub_249811984()
{
  unint64_t result = qword_2696D0998;
  if (!qword_2696D0998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0998);
  }
  return result;
}

uint64_t sub_2498119D8()
{
  return sub_249822F44();
}

uint64_t sub_2498119E0()
{
  return sub_2498243D8();
}

uint64_t sub_2498119E8()
{
  return sub_249823190();
}

CarAssetUtils::CAUPhysicalControlBarsButton_optional sub_2498119F0(Swift::String *a1)
{
  return CAUPhysicalControlBarsButton.init(rawValue:)(*a1);
}

unint64_t sub_2498119FC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CAUPhysicalControlBarsButton.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_249811A24()
{
  return sub_24982E548();
}

uint64_t sub_249811A84()
{
  return sub_24982E538();
}

uint64_t sub_249811AD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_249812754();

  return MEMORY[0x270F9DB68](a1, a2, v4);
}

uint64_t sub_249811B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_249812754();

  return MEMORY[0x270F9DB70](a1, a4, a2, a5, v10, a3);
}

unint64_t sub_249811BA8()
{
  unint64_t result = qword_2696D09A0;
  if (!qword_2696D09A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D09A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09A0);
  }
  return result;
}

void sub_249811C04(void *a1@<X8>)
{
  *a1 = &unk_26FD95680;
}

uint64_t destroy for CAUPhysicalControlBarsLayout()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s13CarAssetUtils28CAUPhysicalControlBarsLayoutVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CAUPhysicalControlBarsLayout(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for CAUPhysicalControlBarsLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsLayout(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsLayout(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsLayout()
{
  return &type metadata for CAUPhysicalControlBarsLayout;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsButton(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUPhysicalControlBarsButton(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x249811FB4);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_249811FDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_249811FE8(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButton()
{
  return &type metadata for CAUPhysicalControlBarsButton;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsLayout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUPhysicalControlBarsLayout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24981215CLL);
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

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsLayout.CodingKeys()
{
  return &type metadata for CAUPhysicalControlBarsLayout.CodingKeys;
}

unint64_t sub_249812198()
{
  unint64_t result = qword_2696D09B0;
  if (!qword_2696D09B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09B0);
  }
  return result;
}

unint64_t sub_2498121F0()
{
  unint64_t result = qword_2696D09B8;
  if (!qword_2696D09B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09B8);
  }
  return result;
}

unint64_t sub_249812248()
{
  unint64_t result = qword_2696D09C0;
  if (!qword_2696D09C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09C0);
  }
  return result;
}

uint64_t sub_24981229C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) != a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D09D0);
    uint64_t v8 = sub_24982E6A8();
    uint64_t v9 = v8;
    v34 = a1;
    uint64_t v35 = a2;
    if (a2 < 1) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = *a1;
    }
    uint64_t v11 = 0;
    uint64_t v12 = v8 + 64;
    while (1)
    {
      if (v10)
      {
        unint64_t v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        uint64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_40;
        }
        if (v15 >= v35) {
          return v9;
        }
        unint64_t v16 = v34[v15];
        ++v11;
        if (!v16)
        {
          uint64_t v11 = v15 + 1;
          if (v15 + 1 >= v35) {
            return v9;
          }
          unint64_t v16 = v34[v11];
          if (!v16)
          {
            uint64_t v11 = v15 + 2;
            if (v15 + 2 >= v35) {
              return v9;
            }
            unint64_t v16 = v34[v11];
            if (!v16)
            {
              uint64_t v17 = v15 + 3;
              if (v17 >= v35) {
                return v9;
              }
              unint64_t v16 = v34[v17];
              if (!v16)
              {
                while (1)
                {
                  uint64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_41;
                  }
                  if (v11 >= v35) {
                    return v9;
                  }
                  unint64_t v16 = v34[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_24;
                  }
                }
              }
              uint64_t v11 = v17;
            }
          }
        }
LABEL_24:
        unint64_t v10 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v14);
      uint64_t v19 = *(void *)(v4 + 56) + 12 * v14;
      char v20 = *(unsigned char *)v19;
      uint64_t v21 = *(void *)(v19 + 4);
      sub_24982E828();
      sub_24982E4D8();
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_24982E848();
      uint64_t v23 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v24 = v22 & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_35;
      }
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          JUMPOUT(0x2498125E0);
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
LABEL_35:
      *(void *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      *(unsigned char *)(*(void *)(v9 + 48) + v26) = v18;
      uint64_t v31 = *(void *)(v9 + 56) + 12 * v26;
      *(unsigned char *)uint64_t v31 = v20;
      *(void *)(v31 + 4) = v21;
      ++*(void *)(v9 + 16);
      if (__OFSUB__(v5--, 1)) {
        goto LABEL_39;
      }
      if (!v5) {
        return v9;
      }
    }
  }
  swift_retain();
  return v4;
}

uint64_t sub_2498125F4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F72665F74616573 && a2 == 0xEF7466656C5F746ELL;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002498323C0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F72665F74616573 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_249812754()
{
  unint64_t result = qword_2696D09C8;
  if (!qword_2696D09C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09C8);
  }
  return result;
}

uint64_t sub_2498127A8(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    MEMORY[0x270FA5388]();
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_249812964((uint64_t)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_249812964((uint64_t)v10, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x24C5AB450](v10, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v9;
}

uint64_t sub_249812964(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6 = (unint64_t *)result;
  uint64_t v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = a3 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v13) {
      return sub_24981229C(v6, a2, v7, a3);
    }
    unint64_t v17 = *(void *)(v9 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v13) {
        return sub_24981229C(v6, a2, v7, a3);
      }
      unint64_t v17 = *(void *)(v9 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v13) {
          return sub_24981229C(v6, a2, v7, a3);
        }
        unint64_t v17 = *(void *)(v9 + 8 * v8);
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    unint64_t result = sub_249811630(*(unsigned char *)(*(void *)(a3 + 48) + v15), a4);
    if (result)
    {
      *(unint64_t *)((char *)v6 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v7++, 1))
      {
        __break(1u);
        return sub_24981229C(v6, a2, v7, a3);
      }
    }
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    return sub_24981229C(v6, a2, v7, a3);
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v13) {
      return sub_24981229C(v6, a2, v7, a3);
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_249812B40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUServices();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CAUServices()
{
  return self;
}

uint64_t CAUVehicleLayout.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 CAUVehicleLayout.widgetContentMargins.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

__n128 CAUVehicleLayout.topDownExteriorImage.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[3].n128_u64[0];
  unsigned __int8 v3 = v1[3].n128_u8[8];
  __n128 result = v1[2];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.body.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 76);
  unsigned __int8 v3 = *(unsigned char *)(v1 + 84);
  __n128 result = *(__n128 *)(v1 + 60);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.cabinSeatsImage.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 104);
  unsigned __int8 v3 = *(unsigned char *)(v1 + 112);
  __n128 result = *(__n128 *)(v1 + 88);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.topDownInteriorImage.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 132);
  unsigned __int8 v3 = *(unsigned char *)(v1 + 140);
  __n128 result = *(__n128 *)(v1 + 116);
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 CAUVehicleLayout.cabin.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[10].n128_u64[0];
  unsigned __int8 v3 = v1[10].n128_u8[8];
  __n128 result = v1[9];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

uint64_t CAUVehicleLayout.infos.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 CAUVehicleLayout.init(identifier:widgetContentMargins:topDownExteriorImage:cabinSeatsImage:topDownInteriorImage:body:cabin:infos:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v10 = *((void *)a4 + 2);
  uint64_t v12 = *(void *)(a5 + 16);
  uint64_t v13 = *(void *)(a6 + 16);
  uint64_t v14 = *(void *)(a7 + 16);
  unint64_t v15 = a8[1].n128_u64[0];
  char v11 = *((unsigned char *)a4 + 24);
  char v21 = *(unsigned char *)(a7 + 24);
  char v20 = *(unsigned char *)(a5 + 24);
  char v19 = *(unsigned char *)(a6 + 24);
  unsigned __int8 v18 = a8[1].n128_u8[8];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  long long v16 = *a4;
  *(_OWORD *)(a9 + 16) = *a3;
  *(_OWORD *)(a9 + 32) = v16;
  *(void *)(a9 + 48) = v10;
  *(unsigned char *)(a9 + 56) = v11;
  *(_OWORD *)(a9 + 60) = *(_OWORD *)a7;
  *(void *)(a9 + 76) = v14;
  *(unsigned char *)(a9 + 84) = v21;
  *(_OWORD *)(a9 + 88) = *(_OWORD *)a5;
  *(void *)(a9 + 104) = v12;
  *(unsigned char *)(a9 + 112) = v20;
  *(_OWORD *)(a9 + 116) = *(_OWORD *)a6;
  *(void *)(a9 + 132) = v13;
  *(unsigned char *)(a9 + 140) = v19;
  __n128 result = *a8;
  *(__n128 *)(a9 + 144) = *a8;
  *(void *)(a9 + 160) = v15;
  *(unsigned char *)(a9 + 168) = v18;
  *(void *)(a9 + 176) = a10;
  return result;
}

unint64_t sub_249812D28(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
    case 2:
    case 5:
      return result;
    case 3:
      unint64_t result = 2036625250;
      break;
    case 4:
      unint64_t result = 0x6165536E69626163;
      break;
    case 6:
      unint64_t result = 0x6E69626163;
      break;
    case 7:
      unint64_t result = 0x736F666E69;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

unint64_t sub_249812E28()
{
  return sub_249812D28(*v0);
}

uint64_t sub_249812E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249814DD8(a1, a2);
  *a3 = result;
  return result;
}

void sub_249812E58(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_249812E64(uint64_t a1)
{
  unint64_t v2 = sub_249813398();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249812EA0(uint64_t a1)
{
  unint64_t v2 = sub_249813398();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUVehicleLayout.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D09E0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v44 = *(void *)(v1 + 24);
  uint64_t v45 = v7;
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v38 = *(void *)(v1 + 40);
  uint64_t v39 = v8;
  uint64_t v9 = *(void *)(v1 + 48);
  int v51 = *(unsigned __int8 *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 60);
  uint64_t v11 = *(void *)(v1 + 68);
  uint64_t v42 = *(void *)(v1 + 76);
  uint64_t v43 = v9;
  int v41 = *(unsigned __int8 *)(v1 + 84);
  uint64_t v12 = *(void *)(v1 + 88);
  uint64_t v13 = *(void *)(v1 + 96);
  uint64_t v40 = *(void *)(v1 + 104);
  int v37 = *(unsigned __int8 *)(v1 + 112);
  uint64_t v14 = *(void *)(v1 + 116);
  uint64_t v15 = *(void *)(v1 + 124);
  uint64_t v35 = *(void *)(v1 + 132);
  int v36 = *(unsigned __int8 *)(v1 + 140);
  uint64_t v16 = *(void *)(v1 + 144);
  uint64_t v17 = *(void *)(v1 + 152);
  uint64_t v33 = *(void *)(v1 + 160);
  int v34 = *(unsigned __int8 *)(v1 + 168);
  uint64_t v32 = *(void *)(v1 + 176);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249813398();
  sub_24982E868();
  LOBYTE(v47) = 0;
  uint64_t v18 = v46;
  sub_24982E758();
  if (!v18)
  {
    char v19 = v51;
    uint64_t v20 = v42;
    uint64_t v21 = v43;
    char v22 = v41;
    uint64_t v31 = v11;
    uint64_t v46 = v10;
    uint64_t v23 = v40;
    uint64_t v29 = v13;
    uint64_t v30 = v12;
    uint64_t v27 = v15;
    uint64_t v28 = v14;
    uint64_t v25 = v17;
    uint64_t v26 = v16;
    uint64_t v47 = v45;
    uint64_t v48 = v44;
    char v52 = 1;
    sub_2498133EC();
    sub_24982E788();
    uint64_t v47 = v39;
    uint64_t v48 = v38;
    uint64_t v49 = v21;
    char v50 = v19;
    char v52 = 2;
    sub_249813440();
    sub_24982E788();
    uint64_t v47 = v46;
    uint64_t v48 = v31;
    uint64_t v49 = v20;
    char v50 = v22;
    char v52 = 3;
    sub_24982E788();
    uint64_t v47 = v30;
    uint64_t v48 = v29;
    uint64_t v49 = v23;
    char v50 = v37;
    char v52 = 4;
    sub_24982E788();
    uint64_t v47 = v28;
    uint64_t v48 = v27;
    uint64_t v49 = v35;
    char v50 = v36;
    char v52 = 5;
    sub_24982E788();
    uint64_t v47 = v26;
    uint64_t v48 = v25;
    uint64_t v49 = v33;
    char v50 = v34;
    char v52 = 6;
    sub_24982E788();
    uint64_t v47 = v32;
    char v52 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A00);
    sub_249813D40(&qword_2696D0A08, (void (*)(void))sub_249813494, (void (*)(void))sub_249813440);
    sub_24982E788();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_249813398()
{
  unint64_t result = qword_2696D09E8;
  if (!qword_2696D09E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09E8);
  }
  return result;
}

unint64_t sub_2498133EC()
{
  unint64_t result = qword_2696D09F0;
  if (!qword_2696D09F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09F0);
  }
  return result;
}

unint64_t sub_249813440()
{
  unint64_t result = qword_2696D09F8;
  if (!qword_2696D09F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D09F8);
  }
  return result;
}

unint64_t sub_249813494()
{
  unint64_t result = qword_2696D0A10;
  if (!qword_2696D0A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A10);
  }
  return result;
}

uint64_t CAUVehicleLayout.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A18);
  uint64_t v5 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249813398();
  v121 = v7;
  sub_24982E858();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v8 = v5;
  LOBYTE(v66) = 0;
  uint64_t v9 = v55;
  uint64_t v10 = sub_24982E6F8();
  uint64_t v12 = v11;
  LOBYTE(v56) = 1;
  sub_249813C98();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v53 = v10;
  long long v13 = v66;
  LOBYTE(v56) = 2;
  unint64_t v54 = sub_249813CEC();
  sub_24982E728();
  uint64_t v14 = (uint64_t)a1;
  unsigned int v52 = v66;
  unsigned int v49 = DWORD2(v66);
  unsigned int v50 = DWORD1(v66);
  unsigned int v48 = HIDWORD(v66);
  uint64_t v51 = v67;
  int v15 = BYTE8(v67);
  char v120 = BYTE8(v67);
  LOBYTE(v56) = 3;
  sub_24982E728();
  int v43 = v15;
  uint64_t v47 = v66;
  unsigned int v45 = HIDWORD(v66);
  unsigned int v46 = DWORD2(v66);
  uint64_t v44 = v67;
  int v16 = BYTE8(v67);
  char v117 = BYTE8(v67);
  LOBYTE(v56) = 4;
  sub_24982E728();
  int v38 = v16;
  uint64_t v42 = v66;
  unsigned int v40 = HIDWORD(v66);
  unsigned int v41 = DWORD2(v66);
  uint64_t v39 = v67;
  int v17 = BYTE8(v67);
  char v114 = BYTE8(v67);
  LOBYTE(v56) = 5;
  sub_24982E728();
  int v33 = v17;
  uint64_t v37 = v66;
  int v35 = HIDWORD(v66);
  int v36 = DWORD2(v66);
  uint64_t v34 = v67;
  int v18 = BYTE8(v67);
  char v111 = BYTE8(v67);
  LOBYTE(v56) = 6;
  sub_24982E728();
  int v28 = v18;
  LODWORD(v54) = DWORD1(v66);
  unsigned int v29 = v66;
  unsigned int v31 = HIDWORD(v66);
  unsigned int v32 = DWORD2(v66);
  uint64_t v30 = v67;
  LOBYTE(v18) = BYTE8(v67);
  char v108 = BYTE8(v67);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A00);
  char v105 = 7;
  sub_249813D40(&qword_2696D0A30, (void (*)(void))sub_249813DC8, (void (*)(void))sub_249813CEC);
  sub_24982E728();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v121, v9);
  v59[8] = v43;
  v59[36] = v38;
  LOBYTE(v61) = v33;
  BYTE12(v62) = v28;
  BYTE8(v64) = v18;
  v121 = v106;
  uint64_t v19 = v53;
  *(void *)&long long v56 = v53;
  *((void *)&v56 + 1) = v12;
  long long v57 = v13;
  unsigned int v20 = v49;
  LODWORD(v9) = v50;
  *(void *)&long long v58 = __PAIR64__(v50, v52);
  LODWORD(v8) = v48;
  *((void *)&v58 + 1) = __PAIR64__(v48, v49);
  *(void *)v59 = v51;
  *(void *)&v59[12] = v47;
  *(void *)&v59[20] = __PAIR64__(v45, v46);
  *(void *)&v59[28] = v44;
  *(void *)&v59[40] = v42;
  *(void *)&long long v60 = __PAIR64__(v40, v41);
  *((void *)&v60 + 1) = v39;
  *(void *)((char *)&v61 + 4) = v37;
  HIDWORD(v61) = v36;
  LODWORD(v62) = v35;
  *(void *)((char *)&v62 + 4) = v34;
  *(void *)&long long v63 = __PAIR64__(v54, v29);
  *((void *)&v63 + 1) = __PAIR64__(v31, v32);
  *(void *)&long long v64 = v30;
  v65 = v106;
  sub_249813E1C((uint64_t)&v56);
  swift_bridgeObjectRelease();
  long long v21 = v63;
  *(_OWORD *)(a2 + 128) = v62;
  *(_OWORD *)(a2 + 144) = v21;
  *(_OWORD *)(a2 + 160) = v64;
  *(void *)(a2 + 176) = v65;
  long long v22 = *(_OWORD *)&v59[32];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v59[16];
  *(_OWORD *)(a2 + 80) = v22;
  long long v23 = v61;
  *(_OWORD *)(a2 + 96) = v60;
  *(_OWORD *)(a2 + 112) = v23;
  long long v24 = v57;
  *(_OWORD *)a2 = v56;
  *(_OWORD *)(a2 + 16) = v24;
  long long v25 = *(_OWORD *)v59;
  *(_OWORD *)(a2 + 32) = v58;
  *(_OWORD *)(a2 + 48) = v25;
  __swift_destroy_boxed_opaque_existential_1(v14);
  *(void *)&long long v66 = v19;
  *((void *)&v66 + 1) = v12;
  long long v67 = v13;
  unsigned int v68 = v52;
  int v69 = v9;
  unsigned int v70 = v20;
  int v71 = v8;
  uint64_t v72 = v51;
  char v73 = v120;
  __int16 v74 = v118;
  char v75 = v119;
  uint64_t v76 = v47;
  unsigned int v77 = v46;
  unsigned int v78 = v45;
  uint64_t v79 = v44;
  char v80 = v117;
  __int16 v81 = v115;
  char v82 = v116;
  uint64_t v83 = v42;
  unsigned int v84 = v41;
  unsigned int v85 = v40;
  uint64_t v86 = v39;
  char v87 = v114;
  __int16 v88 = v112;
  char v89 = v113;
  uint64_t v90 = v37;
  int v91 = v36;
  int v92 = v35;
  uint64_t v93 = v34;
  char v94 = v111;
  char v96 = v110;
  __int16 v95 = v109;
  unsigned int v97 = v29;
  int v98 = v54;
  unsigned int v99 = v32;
  unsigned int v100 = v31;
  uint64_t v101 = v30;
  char v102 = v108;
  *(_DWORD *)&v103[3] = *(_DWORD *)&v107[3];
  *(_DWORD *)v103 = *(_DWORD *)v107;
  v104 = v121;
  return sub_249813E54((uint64_t)&v66);
}

unint64_t sub_249813C98()
{
  unint64_t result = qword_2696D0A20;
  if (!qword_2696D0A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A20);
  }
  return result;
}

unint64_t sub_249813CEC()
{
  unint64_t result = qword_2696D0A28;
  if (!qword_2696D0A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A28);
  }
  return result;
}

uint64_t sub_249813D40(unint64_t *a1, void (*a2)(void), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D0A00);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_249813DC8()
{
  unint64_t result = qword_2696D0A38;
  if (!qword_2696D0A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A38);
  }
  return result;
}

uint64_t sub_249813E1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_249813E54(uint64_t a1)
{
  return a1;
}

uint64_t sub_249813E8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUVehicleLayout.init(from:)(a1, a2);
}

uint64_t sub_249813EA4(void *a1)
{
  return CAUVehicleLayout.encode(to:)(a1);
}

CarAssetUtils::CAUWidgetContentMargins __swiftcall CAUWidgetContentMargins.init(top:leading:bottom:trailing:)(Swift::Float top, Swift::Float leading, Swift::Float bottom, Swift::Float trailing)
{
  *uint64_t v4 = top;
  v4[1] = leading;
  v4[2] = bottom;
  v4[3] = trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

float CAUWidgetContentMargins.top.getter()
{
  return *(float *)v0;
}

float CAUWidgetContentMargins.leading.getter()
{
  return *(float *)(v0 + 4);
}

float CAUWidgetContentMargins.bottom.getter()
{
  return *(float *)(v0 + 8);
}

float CAUWidgetContentMargins.trailing.getter()
{
  return *(float *)(v0 + 12);
}

uint64_t sub_249813EE8(char a1)
{
  return qword_24982F598[a1];
}

uint64_t sub_249813F08()
{
  return sub_249813EE8(*v0);
}

uint64_t sub_249813F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2498150E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_249813F38(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_249813F44(uint64_t a1)
{
  unint64_t v2 = sub_249814180();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249813F80(uint64_t a1)
{
  unint64_t v2 = sub_249814180();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUWidgetContentMargins.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A40);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249814180();
  sub_24982E868();
  v8[15] = 0;
  sub_24982E778();
  if (!v1)
  {
    v8[14] = 1;
    sub_24982E778();
    v8[13] = 2;
    sub_24982E778();
    v8[12] = 3;
    sub_24982E778();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_249814180()
{
  unint64_t result = qword_2696D0A48;
  if (!qword_2696D0A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A48);
  }
  return result;
}

uint64_t CAUWidgetContentMargins.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249814180();
  sub_24982E858();
  if (!v2)
  {
    char v22 = 0;
    sub_24982E718();
    int v10 = v9;
    char v21 = 1;
    sub_24982E718();
    int v12 = v11;
    char v20 = 2;
    sub_24982E718();
    int v15 = v14;
    char v19 = 3;
    sub_24982E718();
    int v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v15;
    a2[3] = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2498143D4@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return CAUWidgetContentMargins.init(from:)(a1, a2);
}

uint64_t sub_2498143EC(void *a1)
{
  return CAUWidgetContentMargins.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for CAUVehicleLayoutInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CAUVehicleLayout()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(_OWORD *)(a1 + 69) = *(_OWORD *)(a2 + 69);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 125) = *(_OWORD *)(a2 + 125);
  *(_OWORD *)(a1 + 116) = *(_OWORD *)(a2 + 116);
  *(_OWORD *)(a1 + 153) = *(_OWORD *)(a2 + 153);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  uint64_t v4 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v4;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  uint64_t v5 = *(void *)(a2 + 76);
  *(unsigned char *)(a1 + 84) = *(unsigned char *)(a2 + 84);
  *(void *)(a1 + 76) = v5;
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  uint64_t v6 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v6;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 120);
  *(_DWORD *)(a1 + 124) = *(_DWORD *)(a2 + 124);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  uint64_t v7 = *(void *)(a2 + 132);
  *(unsigned char *)(a1 + 140) = *(unsigned char *)(a2 + 140);
  *(void *)(a1 + 132) = v7;
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(_DWORD *)(a1 + 148) = *(_DWORD *)(a2 + 148);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(a2 + 152);
  *(_DWORD *)(a1 + 156) = *(_DWORD *)(a2 + 156);
  uint64_t v8 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v8;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for CAUVehicleLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(void *)(a1 + 76) = *(void *)(a2 + 76);
  *(unsigned char *)(a1 + 84) = *(unsigned char *)(a2 + 84);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 116) = *(_OWORD *)(a2 + 116);
  *(unsigned char *)(a1 + 140) = *(unsigned char *)(a2 + 140);
  *(void *)(a1 + 132) = *(void *)(a2 + 132);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 184) = 1;
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
    *(unsigned char *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayout()
{
  return &type metadata for CAUVehicleLayout;
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUWidgetContentMargins(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CAUWidgetContentMargins(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CAUWidgetContentMargins()
{
  return &type metadata for CAUWidgetContentMargins;
}

uint64_t getEnumTagSinglePayload for CAUEdge(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUWidgetContentMargins.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2498149FCLL);
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

ValueMetadata *type metadata accessor for CAUWidgetContentMargins.CodingKeys()
{
  return &type metadata for CAUWidgetContentMargins.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayout.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUVehicleLayout.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x249814B90);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayout.CodingKeys()
{
  return &type metadata for CAUVehicleLayout.CodingKeys;
}

unint64_t sub_249814BCC()
{
  unint64_t result = qword_2696D0A58;
  if (!qword_2696D0A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A58);
  }
  return result;
}

unint64_t sub_249814C24()
{
  unint64_t result = qword_2696D0A60;
  if (!qword_2696D0A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A60);
  }
  return result;
}

unint64_t sub_249814C7C()
{
  unint64_t result = qword_2696D0A68;
  if (!qword_2696D0A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A68);
  }
  return result;
}

unint64_t sub_249814CD4()
{
  unint64_t result = qword_2696D0A70;
  if (!qword_2696D0A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A70);
  }
  return result;
}

unint64_t sub_249814D2C()
{
  unint64_t result = qword_2696D0A78;
  if (!qword_2696D0A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A78);
  }
  return result;
}

unint64_t sub_249814D84()
{
  unint64_t result = qword_2696D0A80;
  if (!qword_2696D0A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0A80);
  }
  return result;
}

uint64_t sub_249814DD8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000249832580 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002498325A0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6165536E69626163 && a2 == 0xEF6567616D497374 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002498325C0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E69626163 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x736F666E69 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_2498150E4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7368564 && a2 == 0xE300000000000000;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696461656CLL && a2 == 0xE700000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D6F74746F62 && a2 == 0xE600000000000000 || (sub_24982E7B8() & 1) != 0)
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
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t Dictionary<>.init(_:)(uint64_t a1)
{
  uint64_t v1 = sub_249817A40(a1);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_2498152AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  BOOL v3 = (void *)a2[1];
  uint64_t v6 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v4;
  v7._object = v3;
  CAUVehicleTrait.init(rawValue:)(v7);
  unsigned __int8 v8 = v15;
  if (v15 == 10)
  {
    if (qword_2696D0928 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24982E3E8();
    __swift_project_value_buffer(v9, (uint64_t)qword_2696D0D30);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    long long v10 = sub_24982E3C8();
    os_log_type_t v11 = sub_24982E598();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)uint64_t v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_24981B778(v4, (unint64_t)v3, &v15);
      sub_24982E5E8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_24981B778(v6, v5, &v15);
      sub_24982E5E8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24980F000, v10, v11, "unexpected type %s or value %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5AB450](v13, -1, -1);
      MEMORY[0x24C5AB450](v12, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *a1;
    *a1 = 0x8000000000000000;
    sub_24981674C(v6, v5, v8, isUniquelyReferenced_nonNull_native);
    *a1 = v15;
    swift_bridgeObjectRelease();
  }
}

void *Dictionary<>.init(_:)(uint64_t a1)
{
  uint64_t v33 = a1 + 64;
  uint64_t v1 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v2 = -1;
  if (v1 < 64) {
    uint64_t v2 = ~(-1 << v1);
  }
  unint64_t v3 = v2 & *(void *)(a1 + 64);
  int64_t v34 = (unint64_t)(v1 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v4 = 0;
  unint64_t v5 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v3)
    {
      unint64_t v7 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      unint64_t v8 = v7 | (v4 << 6);
      goto LABEL_26;
    }
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_53;
    }
    if (v9 >= v34) {
      break;
    }
    unint64_t v10 = *(void *)(v33 + 8 * v9);
    ++v4;
    if (!v10)
    {
      int64_t v4 = v9 + 1;
      if (v9 + 1 >= v34) {
        break;
      }
      unint64_t v10 = *(void *)(v33 + 8 * v4);
      if (!v10)
      {
        int64_t v4 = v9 + 2;
        if (v9 + 2 >= v34) {
          break;
        }
        unint64_t v10 = *(void *)(v33 + 8 * v4);
        if (!v10)
        {
          int64_t v4 = v9 + 3;
          if (v9 + 3 >= v34) {
            break;
          }
          unint64_t v10 = *(void *)(v33 + 8 * v4);
          if (!v10)
          {
            int64_t v4 = v9 + 4;
            if (v9 + 4 >= v34) {
              break;
            }
            unint64_t v10 = *(void *)(v33 + 8 * v4);
            if (!v10)
            {
              int64_t v11 = v9 + 5;
              if (v11 >= v34) {
                break;
              }
              unint64_t v10 = *(void *)(v33 + 8 * v11);
              if (!v10)
              {
                while (1)
                {
                  int64_t v4 = v11 + 1;
                  if (__OFADD__(v11, 1)) {
                    goto LABEL_54;
                  }
                  if (v4 >= v34) {
                    goto LABEL_50;
                  }
                  unint64_t v10 = *(void *)(v33 + 8 * v4);
                  ++v11;
                  if (v10) {
                    goto LABEL_25;
                  }
                }
              }
              int64_t v4 = v11;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v3 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v4 << 6);
LABEL_26:
    uint64_t v12 = *(unsigned __int8 *)(*(void *)(a1 + 48) + v8);
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v8);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = 0x8000000249832160;
    uint64_t v17 = 0xD000000000000010;
    switch(v12)
    {
      case 1:
        uint64_t v17 = 0x726F697265746E69;
        goto LABEL_31;
      case 2:
        uint64_t v17 = 0x726F697265747865;
        goto LABEL_33;
      case 3:
        uint64_t v17 = 0x726F697265746E69;
LABEL_33:
        uint64_t v16 = 0xED0000726F6C6F43;
        break;
      case 4:
        uint64_t v16 = 0xEE006F676F4C646ELL;
        uint64_t v17 = 0x6172426F69647561;
        break;
      case 5:
        uint64_t v16 = 0xEB000000006F676FLL;
        goto LABEL_37;
      case 6:
        uint64_t v16 = 0xED000074756F7961;
LABEL_37:
        uint64_t v17 = 0x4C656C6369686576;
        break;
      case 7:
        break;
      case 8:
        uint64_t v17 = 0xD000000000000019;
        uint64_t v16 = 0x8000000249832180;
        break;
      case 9:
        uint64_t v16 = 0xEB0000000067616CLL;
        uint64_t v17 = 0x4665727574616566;
        break;
      default:
        uint64_t v17 = 0x726F697265747865;
LABEL_31:
        uint64_t v16 = 0xED0000656C797453;
        break;
    }
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v20 = sub_249815AD4(v17, v16);
    uint64_t v21 = v5[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22))
    {
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      sub_24982E7D8();
      __break(1u);
      JUMPOUT(0x2498159B4);
    }
    char v24 = v19;
    if (v5[3] >= v23)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v19) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_249817884();
        if (v24) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_2498162EC(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_249815AD4(v17, v16);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_55;
      }
      unint64_t v20 = v25;
      if (v24)
      {
LABEL_4:
        uint64_t v6 = (void *)(v5[7] + 16 * v20);
        swift_bridgeObjectRelease();
        *uint64_t v6 = v14;
        v6[1] = v15;
        goto LABEL_5;
      }
    }
    v5[(v20 >> 6) + 8] |= 1 << v20;
    uint64_t v27 = (uint64_t *)(v5[6] + 16 * v20);
    *uint64_t v27 = v17;
    v27[1] = v16;
    int v28 = (void *)(v5[7] + 16 * v20);
    *int v28 = v14;
    v28[1] = v15;
    uint64_t v29 = v5[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_52;
    }
    v5[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_50:
  swift_release();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_2498159DC(char a1)
{
  sub_24982E828();
  CAUVehicleLayoutKey.rawValue.getter();
  sub_24982E4D8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_24982E848();

  return sub_24981688C(a1, v2);
}

unint64_t sub_249815A68(unsigned __int8 a1)
{
  sub_24982E828();
  sub_2498244C0();
  uint64_t v2 = sub_24982E848();

  return sub_249817068(a1, v2);
}

unint64_t sub_249815AD4(uint64_t a1, uint64_t a2)
{
  sub_24982E828();
  sub_24982E4D8();
  uint64_t v4 = sub_24982E848();

  return sub_249817450(a1, a2, v4);
}

uint64_t sub_249815B4C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D09D8);
  char v6 = a2;
  uint64_t v7 = sub_24982E698();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  unsigned int v32 = v2;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33) {
      break;
    }
    BOOL v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v32;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v33) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_24982E828();
    CAUVehicleLayoutKey.rawValue.getter();
    sub_24982E4D8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24982E848();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v3 = v32;
  BOOL v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *BOOL v22 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v8;
  return result;
}

uint64_t sub_249815E60(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A90);
  char v38 = a2;
  uint64_t v6 = sub_24982E698();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  int v35 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v19 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v20 = v19 | (v12 << 6);
    goto LABEL_31;
  }
  int64_t v21 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_42;
  }
  if (v21 >= v36)
  {
    swift_release();
    unint64_t v3 = v35;
    BOOL v22 = (void *)(v5 + 64);
    if (v38)
    {
LABEL_37:
      uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
      if (v33 >= 64) {
        bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *BOOL v22 = -1 << v33;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    BOOL v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v12;
    if (v23) {
      goto LABEL_30;
    }
    int64_t v12 = v21 + 1;
    if (v21 + 1 >= v36) {
      goto LABEL_34;
    }
    unint64_t v23 = *(void *)(v37 + 8 * v12);
    if (v23)
    {
LABEL_30:
      unint64_t v10 = (v23 - 1) & v23;
      unint64_t v20 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_31:
      char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
      uint64_t v30 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v20);
      uint64_t v31 = *v30;
      uint64_t v32 = v30[1];
      if ((v38 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_24982E828();
      sub_24982E4D8();
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_24982E848();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = v13 & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_8;
      }
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      while (++v16 != v26 || (v25 & 1) == 0)
      {
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
        if (v28 != -1)
        {
          unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
LABEL_8:
          *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
          *(unsigned char *)(*(void *)(v7 + 48) + v17) = v29;
          unint64_t v18 = (void *)(*(void *)(v7 + 56) + 16 * v17);
          *unint64_t v18 = v31;
          v18[1] = v32;
          ++*(void *)(v7 + 16);
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      JUMPOUT(0x2498162C4);
    }
    int64_t v24 = v21 + 2;
    if (v24 < v36)
    {
      unint64_t v23 = *(void *)(v37 + 8 * v24);
      if (!v23)
      {
        while (1)
        {
          int64_t v12 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_43;
          }
          if (v12 >= v36) {
            goto LABEL_34;
          }
          unint64_t v23 = *(void *)(v37 + 8 * v12);
          ++v24;
          if (v23) {
            goto LABEL_30;
          }
        }
      }
      int64_t v12 = v24;
      goto LABEL_30;
    }
LABEL_34:
    swift_release();
    unint64_t v3 = v35;
    if (v38) {
      goto LABEL_37;
    }
  }
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_2498162EC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A88);
  char v42 = a2;
  uint64_t v6 = sub_24982E698();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24982E828();
    sub_24982E4D8();
    uint64_t result = sub_24982E848();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_249816614(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2498159DC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_249817534();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_249815B4C(result, a3 & 1);
  uint64_t result = sub_2498159DC(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_24982E7D8();
  __break(1u);
  return result;
}

uint64_t sub_24981674C(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_249815A68(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2498176D8();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(unsigned char *)(v18[6] + v12) = a3;
    uint64_t v21 = (void *)(v18[7] + 16 * v12);
    *uint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_249815E60(result, a4 & 1);
  uint64_t result = sub_249815A68(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    char v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_24982E7D8();
  __break(1u);
  return result;
}

unint64_t sub_24981688C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      unint64_t v7 = 0x80000002498321C0;
      uint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unsigned int v10 = 1919905636;
          goto LABEL_34;
        case 3:
          unsigned int v11 = 1919905636;
          goto LABEL_36;
        case 4:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x6B6E757266;
          break;
        case 5:
          unint64_t v7 = 0xEE0074726F506567;
          uint64_t v8 = 0x726168436C657566;
          break;
        case 6:
          uint64_t v8 = 0xD000000000000019;
          unint64_t v12 = "fuelChargePort_front_left";
          goto LABEL_39;
        case 7:
          uint64_t v8 = 0xD00000000000001ALL;
          unint64_t v12 = "fuelChargePort_front_right";
          goto LABEL_39;
        case 8:
          uint64_t v8 = 0xD000000000000018;
          unint64_t v12 = "fuelChargePort_rear_left";
          goto LABEL_39;
        case 9:
          uint64_t v8 = 0xD000000000000019;
          unint64_t v12 = "fuelChargePort_rear_right";
          goto LABEL_39;
        case 0xA:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1685024616;
          break;
        case 0xB:
          unint64_t v7 = 0xEF65646953746665;
          uint64_t v8 = 0x6C5F726F7272696DLL;
          break;
        case 0xC:
          unint64_t v12 = "mirror_rightSide";
          goto LABEL_39;
        case 0xD:
          unint64_t v7 = 0xEC00000073656469;
          uint64_t v8 = 0x735F726F7272696DLL;
          break;
        case 0xE:
          uint64_t v8 = 0x646E325F74616573;
          goto LABEL_22;
        case 0xF:
          unint64_t v12 = "seat_2ndRow_left";
          goto LABEL_39;
        case 0x10:
          uint64_t v8 = 0xD000000000000012;
          unint64_t v12 = "seat_2ndRow_middle";
          goto LABEL_39;
        case 0x11:
          uint64_t v8 = 0xD000000000000011;
          unint64_t v12 = "seat_2ndRow_right";
          goto LABEL_39;
        case 0x12:
          uint64_t v8 = 0x6472335F74616573;
LABEL_22:
          unint64_t v7 = 0xEB00000000776F52;
          break;
        case 0x13:
          unint64_t v12 = "seat_3rdRow_left";
          goto LABEL_39;
        case 0x14:
          uint64_t v8 = 0xD000000000000012;
          unint64_t v12 = "seat_3rdRow_middle";
          goto LABEL_39;
        case 0x15:
          uint64_t v8 = 0xD000000000000011;
          unint64_t v12 = "seat_3rdRow_right";
          goto LABEL_39;
        case 0x16:
          unint64_t v7 = 0xEA0000000000746ELL;
          uint64_t v8 = 0x6F72665F74616573;
          break;
        case 0x17:
          unsigned int v9 = 1952540019;
          goto LABEL_31;
        case 0x18:
          uint64_t v8 = 0xD000000000000011;
          unint64_t v12 = "seat_front_middle";
          goto LABEL_39;
        case 0x19:
          unint64_t v12 = "seat_front_right";
          goto LABEL_39;
        case 0x1A:
          unsigned int v9 = 1701996916;
          goto LABEL_31;
        case 0x1B:
          unint64_t v12 = "tire_front_right";
          goto LABEL_39;
        case 0x1C:
          unsigned int v10 = 1701996916;
LABEL_34:
          uint64_t v8 = v10 | 0x6165725F00000000;
          unint64_t v7 = 0xEE007466656C5F72;
          break;
        case 0x1D:
          unsigned int v11 = 1701996916;
LABEL_36:
          uint64_t v8 = v11 | 0x6165725F00000000;
          unint64_t v7 = 0xEF74686769725F72;
          break;
        case 0x1E:
          uint64_t v8 = 0x6B6E757274;
          unint64_t v7 = 0xE500000000000000;
          break;
        case 0x1F:
          unint64_t v12 = "windshield_front";
LABEL_39:
          unint64_t v7 = (unint64_t)(v12 - 32) | 0x8000000000000000;
          break;
        case 0x20:
          unint64_t v7 = 0xEF726165725F646CLL;
          uint64_t v8 = 0x65696873646E6977;
          break;
        default:
          unsigned int v9 = 1919905636;
LABEL_31:
          uint64_t v8 = v9 | 0x6F72665F00000000;
          unint64_t v7 = 0xEF7466656C5F746ELL;
          break;
      }
      unint64_t v13 = 0x80000002498321C0;
      unint64_t v14 = 0xD000000000000010;
      switch(a1)
      {
        case 1:
          goto LABEL_89;
        case 2:
          unsigned int v16 = 1919905636;
          goto LABEL_79;
        case 3:
          unsigned int v17 = 1919905636;
          goto LABEL_82;
        case 4:
          unint64_t v13 = 0xE500000000000000;
          if (v8 != 0x6B6E757266) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 5:
          unint64_t v13 = 0xEE0074726F506567;
          if (v8 != 0x726168436C657566) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 6:
          unint64_t v14 = 0xD000000000000019;
          char v18 = "fuelChargePort_front_left";
          goto LABEL_88;
        case 7:
          unint64_t v14 = 0xD00000000000001ALL;
          char v18 = "fuelChargePort_front_right";
          goto LABEL_88;
        case 8:
          unint64_t v14 = 0xD000000000000018;
          char v18 = "fuelChargePort_rear_left";
          goto LABEL_88;
        case 9:
          unint64_t v14 = 0xD000000000000019;
          char v18 = "fuelChargePort_rear_right";
          goto LABEL_88;
        case 10:
          unint64_t v13 = 0xE400000000000000;
          if (v8 != 1685024616) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 11:
          unint64_t v13 = 0xEF65646953746665;
          if (v8 != 0x6C5F726F7272696DLL) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 12:
          char v18 = "mirror_rightSide";
          goto LABEL_88;
        case 13:
          unint64_t v13 = 0xEC00000073656469;
          if (v8 != 0x735F726F7272696DLL) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 14:
          uint64_t v19 = 0x646E325F74616573;
          goto LABEL_65;
        case 15:
          char v18 = "seat_2ndRow_left";
          goto LABEL_88;
        case 16:
          unint64_t v14 = 0xD000000000000012;
          char v18 = "seat_2ndRow_middle";
          goto LABEL_88;
        case 17:
          unint64_t v14 = 0xD000000000000011;
          char v18 = "seat_2ndRow_right";
          goto LABEL_88;
        case 18:
          uint64_t v19 = 0x6472335F74616573;
LABEL_65:
          unint64_t v13 = 0xEB00000000776F52;
          if (v8 != v19) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 19:
          char v18 = "seat_3rdRow_left";
          goto LABEL_88;
        case 20:
          unint64_t v14 = 0xD000000000000012;
          char v18 = "seat_3rdRow_middle";
          goto LABEL_88;
        case 21:
          unint64_t v14 = 0xD000000000000011;
          char v18 = "seat_3rdRow_right";
          goto LABEL_88;
        case 22:
          unint64_t v13 = 0xEA0000000000746ELL;
          if (v8 != 0x6F72665F74616573) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 23:
          unsigned int v15 = 1952540019;
          goto LABEL_76;
        case 24:
          unint64_t v14 = 0xD000000000000011;
          char v18 = "seat_front_middle";
          goto LABEL_88;
        case 25:
          char v18 = "seat_front_right";
          goto LABEL_88;
        case 26:
          unsigned int v15 = 1701996916;
          goto LABEL_76;
        case 27:
          char v18 = "tire_front_right";
          goto LABEL_88;
        case 28:
          unsigned int v16 = 1701996916;
LABEL_79:
          unint64_t v13 = 0xEE007466656C5F72;
          if (v8 != (v16 | 0x6165725F00000000)) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 29:
          unsigned int v17 = 1701996916;
LABEL_82:
          uint64_t v20 = v17 | 0x6165725F00000000;
          uint64_t v21 = 0x686769725F72;
          goto LABEL_83;
        case 30:
          unint64_t v13 = 0xE500000000000000;
          if (v8 != 0x6B6E757274) {
            goto LABEL_91;
          }
          goto LABEL_90;
        case 31:
          char v18 = "windshield_front";
LABEL_88:
          unint64_t v13 = (unint64_t)(v18 - 32) | 0x8000000000000000;
LABEL_89:
          if (v8 == v14) {
            goto LABEL_90;
          }
          goto LABEL_91;
        case 32:
          unint64_t v13 = 0xEF726165725F646CLL;
          if (v8 != 0x65696873646E6977) {
            goto LABEL_91;
          }
          goto LABEL_90;
        default:
          unsigned int v15 = 1919905636;
LABEL_76:
          uint64_t v20 = v15 | 0x6F72665F00000000;
          uint64_t v21 = 0x66656C5F746ELL;
LABEL_83:
          unint64_t v13 = v21 & 0xFFFFFFFFFFFFLL | 0xEF74000000000000;
          if (v8 != v20) {
            goto LABEL_91;
          }
LABEL_90:
          if (v7 == v13)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_91:
          char v22 = sub_24982E7B8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v22) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v6;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_249817068(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000249832160;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x726F697265746E69;
          goto LABEL_6;
        case 2:
          unint64_t v8 = 0x726F697265747865;
          goto LABEL_9;
        case 3:
          unint64_t v8 = 0x726F697265746E69;
LABEL_9:
          unint64_t v7 = 0xED0000726F6C6F43;
          break;
        case 4:
          unint64_t v8 = 0x6172426F69647561;
          unint64_t v7 = 0xEE006F676F4C646ELL;
          break;
        case 5:
          unint64_t v8 = 0x4C656C6369686576;
          uint64_t v9 = 7300975;
          goto LABEL_15;
        case 6:
          unint64_t v8 = 0x4C656C6369686576;
          unint64_t v7 = 0xED000074756F7961;
          break;
        case 7:
          break;
        case 8:
          unint64_t v8 = 0xD000000000000019;
          unint64_t v7 = 0x8000000249832180;
          break;
        case 9:
          unint64_t v8 = 0x4665727574616566;
          uint64_t v9 = 6775148;
LABEL_15:
          unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        default:
          unint64_t v8 = 0x726F697265747865;
LABEL_6:
          unint64_t v7 = 0xED0000656C797453;
          break;
      }
      unint64_t v10 = 0x8000000249832160;
      switch(v6)
      {
        case 1:
          uint64_t v11 = 0x726F697265746E69;
          goto LABEL_21;
        case 2:
          uint64_t v11 = 0x726F697265747865;
          goto LABEL_24;
        case 3:
          uint64_t v11 = 0x726F697265746E69;
LABEL_24:
          uint64_t v12 = 0x726F6C6F43;
          goto LABEL_29;
        case 4:
          unint64_t v10 = 0xEE006F676F4C646ELL;
          if (v8 != 0x6172426F69647561) {
            goto LABEL_36;
          }
          goto LABEL_35;
        case 5:
          uint64_t v13 = 0x4C656C6369686576;
          uint64_t v14 = 7300975;
          goto LABEL_34;
        case 6:
          uint64_t v11 = 0x4C656C6369686576;
          uint64_t v12 = 0x74756F7961;
          goto LABEL_29;
        case 7:
          if (v8 != 0xD000000000000010) {
            goto LABEL_36;
          }
          goto LABEL_35;
        case 8:
          unint64_t v10 = 0x8000000249832180;
          if (v8 != 0xD000000000000019) {
            goto LABEL_36;
          }
          goto LABEL_35;
        case 9:
          uint64_t v13 = 0x4665727574616566;
          uint64_t v14 = 6775148;
LABEL_34:
          unint64_t v10 = v14 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 == v13) {
            goto LABEL_35;
          }
          goto LABEL_36;
        default:
          uint64_t v11 = 0x726F697265747865;
LABEL_21:
          uint64_t v12 = 0x656C797453;
LABEL_29:
          unint64_t v10 = v12 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
          if (v8 != v11) {
            goto LABEL_36;
          }
LABEL_35:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_36:
          char v15 = sub_24982E7B8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v15) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_249817450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24982E7B8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24982E7B8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_249817534()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D09D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24982E688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2498176D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24982E688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    int64_t v19 = (void *)(*(void *)(v4 + 56) + 16 * v15);
    *int64_t v19 = v18;
    v19[1] = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_249817884()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24982E688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    int64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    BOOL v23 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_249817A40(uint64_t a1)
{
  uint64_t v22 = MEMORY[0x263F8EE80];
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v8 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v7 << 6))
  {
    uint64_t v13 = 16 * i;
    unint64_t v14 = (uint64_t *)(*(void *)(a1 + 48) + v13);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 56) + v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    v21[0] = v15;
    v21[1] = v16;
    v21[2] = v18;
    v21[3] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2498152AC(&v22, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v7 >= v6) {
      goto LABEL_26;
    }
    unint64_t v11 = *(void *)(v2 + 8 * v7);
    if (!v11) {
      break;
    }
LABEL_19:
    unint64_t v5 = (v11 - 1) & v11;
  }
  int64_t v12 = v7 + 1;
  if (v7 + 1 >= v6) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11) {
    goto LABEL_18;
  }
  int64_t v12 = v7 + 2;
  if (v7 + 2 >= v6) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11) {
    goto LABEL_18;
  }
  int64_t v12 = v7 + 3;
  if (v7 + 3 >= v6) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11) {
    goto LABEL_18;
  }
  int64_t v12 = v7 + 4;
  if (v7 + 4 >= v6) {
    goto LABEL_26;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11) {
    goto LABEL_18;
  }
  int64_t v12 = v7 + 5;
  if (v7 + 5 >= v6)
  {
LABEL_26:
    swift_release();
    return v22;
  }
  unint64_t v11 = *(void *)(v2 + 8 * v12);
  if (v11)
  {
LABEL_18:
    int64_t v7 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v7 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v7 >= v6) {
      goto LABEL_26;
    }
    unint64_t v11 = *(void *)(v2 + 8 * v7);
    ++v12;
    if (v11) {
      goto LABEL_19;
    }
  }
LABEL_28:
  __break(1u);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t CAUBaselineAnchor.x.getter()
{
  return *v0;
}

uint64_t CAUBaselineAnchor.y.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUBaselineAnchor.init(x:y:)@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_249817C7C(char a1)
{
  if (a1) {
    return 121;
  }
  else {
    return 120;
  }
}

BOOL sub_249817C90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_249817CA8()
{
  return sub_249817C7C(*v0);
}

uint64_t sub_249817CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249818DA4(a1, a2);
  *a3 = result;
  return result;
}

void sub_249817CD8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_249817CE4(uint64_t a1)
{
  unint64_t v2 = sub_249817EC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249817D20(uint64_t a1)
{
  unint64_t v2 = sub_249817EC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUBaselineAnchor.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0A98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(_DWORD *)(v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249817EC4();
  sub_24982E868();
  char v12 = 0;
  sub_24982E798();
  if (!v2)
  {
    char v11 = 1;
    sub_24982E798();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_249817EC4()
{
  unint64_t result = qword_2696D0AA0;
  if (!qword_2696D0AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AA0);
  }
  return result;
}

uint64_t CAUBaselineAnchor.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0AA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249817EC4();
  sub_24982E858();
  if (!v2)
  {
    char v14 = 0;
    int v9 = sub_24982E738();
    char v13 = 1;
    int v10 = sub_24982E738();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2498180B4@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return CAUBaselineAnchor.init(from:)(a1, a2);
}

uint64_t sub_2498180CC(void *a1)
{
  return CAUBaselineAnchor.encode(to:)(a1);
}

uint64_t CAUVehicleLayoutInfo.x.getter()
{
  return *v0;
}

uint64_t CAUVehicleLayoutInfo.y.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUVehicleLayoutInfo.width.getter()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t CAUVehicleLayoutInfo.height.getter()
{
  return *(unsigned int *)(v0 + 12);
}

void CAUVehicleLayoutInfo.baselineAnchor.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 24);
  *(void *)a1 = *(void *)(v1 + 16);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t CAUVehicleLayoutInfo.init(x:y:height:width:baselineAnchor:)@<X0>(uint64_t result@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6 = *a5;
  char v7 = *((unsigned char *)a5 + 8);
  *(_DWORD *)a6 = result;
  *(_DWORD *)(a6 + 4) = a2;
  *(_DWORD *)(a6 + 8) = a4;
  *(_DWORD *)(a6 + 12) = a3;
  *(void *)(a6 + 16) = v6;
  *(unsigned char *)(a6 + 24) = v7;
  return result;
}

uint64_t sub_249818134(char a1)
{
  uint64_t result = 120;
  switch(a1)
  {
    case 1:
      uint64_t result = 121;
      break;
    case 2:
      uint64_t result = 0x6874646977;
      break;
    case 3:
      uint64_t result = 0x746867696568;
      break;
    case 4:
      uint64_t result = 0x656E696C65736162;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2498181CC()
{
  return sub_249818134(*v0);
}

uint64_t sub_2498181D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249818E64(a1, a2);
  *a3 = result;
  return result;
}

void sub_2498181FC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_249818208(uint64_t a1)
{
  unint64_t v2 = sub_2498184A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249818244(uint64_t a1)
{
  unint64_t v2 = sub_2498184A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUVehicleLayoutInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0AB0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *(_DWORD *)(v1 + 4);
  int v15 = *(_DWORD *)(v1 + 8);
  int v16 = v8;
  int v14 = *(_DWORD *)(v1 + 12);
  uint64_t v13 = *(void *)(v1 + 16);
  HIDWORD(v12) = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2498184A4();
  sub_24982E868();
  char v23 = 0;
  sub_24982E798();
  if (!v2)
  {
    char v9 = BYTE4(v12);
    uint64_t v10 = v13;
    char v22 = 1;
    sub_24982E798();
    char v21 = 2;
    sub_24982E798();
    char v20 = 3;
    sub_24982E798();
    uint64_t v17 = v10;
    char v18 = v9;
    char v19 = 4;
    sub_2498184F8();
    sub_24982E748();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2498184A4()
{
  unint64_t result = qword_2696D0AB8;
  if (!qword_2696D0AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AB8);
  }
  return result;
}

unint64_t sub_2498184F8()
{
  unint64_t result = qword_2696D0AC0;
  if (!qword_2696D0AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AC0);
  }
  return result;
}

uint64_t CAUVehicleLayoutInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0AC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2498184A4();
  sub_24982E858();
  if (!v2)
  {
    char v24 = 0;
    int v9 = sub_24982E738();
    char v23 = 1;
    int v10 = sub_24982E738();
    char v22 = 2;
    int v17 = sub_24982E738();
    char v21 = 3;
    int v16 = sub_24982E738();
    char v20 = 4;
    sub_249818794();
    sub_24982E6E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = v18;
    char v13 = v19;
    *(_DWORD *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v10;
    int v14 = v16;
    *(_DWORD *)(a2 + 8) = v17;
    *(_DWORD *)(a2 + 12) = v14;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_249818794()
{
  unint64_t result = qword_2696D0AD0;
  if (!qword_2696D0AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AD0);
  }
  return result;
}

uint64_t sub_2498187E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUVehicleLayoutInfo.init(from:)(a1, a2);
}

uint64_t sub_249818800(void *a1)
{
  return CAUVehicleLayoutInfo.encode(to:)(a1);
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUBaselineAnchor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CAUBaselineAnchor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CAUBaselineAnchor()
{
  return &type metadata for CAUBaselineAnchor;
}

__n128 __swift_memcpy25_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayoutInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CAUVehicleLayoutInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
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
  *(unsigned char *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutInfo()
{
  return &type metadata for CAUVehicleLayoutInfo;
}

unsigned char *storeEnumTagSinglePayload for CAUVehicleLayoutInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x2498189BCLL);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutInfo.CodingKeys()
{
  return &type metadata for CAUVehicleLayoutInfo.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CAUBaselineAnchor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUBaselineAnchor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249818B50);
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

unsigned char *sub_249818B78(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CAUBaselineAnchor.CodingKeys()
{
  return &type metadata for CAUBaselineAnchor.CodingKeys;
}

unint64_t sub_249818B98()
{
  unint64_t result = qword_2696D0AD8;
  if (!qword_2696D0AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AD8);
  }
  return result;
}

unint64_t sub_249818BF0()
{
  unint64_t result = qword_2696D0AE0;
  if (!qword_2696D0AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AE0);
  }
  return result;
}

unint64_t sub_249818C48()
{
  unint64_t result = qword_2696D0AE8;
  if (!qword_2696D0AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AE8);
  }
  return result;
}

unint64_t sub_249818CA0()
{
  unint64_t result = qword_2696D0AF0;
  if (!qword_2696D0AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AF0);
  }
  return result;
}

unint64_t sub_249818CF8()
{
  unint64_t result = qword_2696D0AF8;
  if (!qword_2696D0AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0AF8);
  }
  return result;
}

unint64_t sub_249818D50()
{
  unint64_t result = qword_2696D0B00;
  if (!qword_2696D0B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0B00);
  }
  return result;
}

uint64_t sub_249818DA4(uint64_t a1, uint64_t a2)
{
  if (a1 == 120 && a2 == 0xE100000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249818E64(uint64_t a1, uint64_t a2)
{
  if (a1 == 120 && a2 == 0xE100000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874646977 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746867696568 && a2 == 0xE600000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E696C65736162 && a2 == 0xEE00726F68636E41)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_249819048@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24982E438();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2498190C8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_24982E448();
}

uint64_t sub_249819140()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24982E438();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2498191BC()
{
  return swift_endAccess();
}

uint64_t sub_249819224(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C18);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unsigned int v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v11 - v7;
  int v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0B18);
  sub_24982E428();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_249819398()
{
  return swift_endAccess();
}

uint64_t CAUAssetLibraryManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  CAUAssetLibraryManager.init()();
  return v0;
}

uint64_t CAUAssetLibraryManager.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0B18);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 16) = 0;
  uint64_t v6 = v1 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  v12[1] = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2696D0B20);
  sub_24982E408();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v6, v5, v2);
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24982E3E8();
  __swift_project_value_buffer(v7, (uint64_t)qword_2696D0D30);
  int v8 = sub_24982E3C8();
  os_log_type_t v9 = sub_24982E598();
  if (os_log_type_enabled(v8, v9))
  {
    int v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_24980F000, v8, v9, "Starting Asset Manager", v10, 2u);
    MEMORY[0x24C5AB450](v10, -1, -1);
  }

  sub_2498195F4();
  return v1;
}

void sub_2498195F4()
{
  uint64_t v1 = v0;
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24982E3E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2696D0D30);
  uint64_t v3 = sub_24982E3C8();
  os_log_type_t v4 = sub_24982E598();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24980F000, v3, v4, "setup new connection", v5, 2u);
    MEMORY[0x24C5AB450](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
  uint64_t v6 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = 0;

  sub_24981BEF8();
  uint64_t v7 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = v8;

  os_log_type_t v9 = sub_24982E3C8();
  os_log_type_t v10 = sub_24982E598();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24980F000, v9, v10, "Initialized client proxy", v11, 2u);
    MEMORY[0x24C5AB450](v11, -1, -1);
  }

  if (*(void *)(v1 + 16)) {
    swift_weakAssign();
  }
}

uint64_t sub_2498198F0()
{
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection), sel_remoteTarget))
  {
    sub_24982E608();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_24981BE30((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C10);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_24981BE98((uint64_t)v4);
    return 0;
  }
}

id sub_249819A30(void *a1)
{
  swift_weakInit();
  uint64_t v3 = v1;
  os_log_type_t v4 = (void *)sub_24982E4A8();
  id v5 = objc_msgSend(self, sel_serial);
  uint64_t v6 = BSDispatchQueueCreate();

  *(void *)&v3[OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connectionQueue] = v6;
  *(void *)&v3[OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection] = a1;
  id v7 = a1;

  v19.receiver = v3;
  v19.super_class = (Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy();
  id v8 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_24981C210;
  *(void *)(v10 + 24) = v9;
  v18[4] = sub_24981C228;
  v18[5] = v10;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_24981A33C;
  v18[3] = &block_descriptor_39;
  uint64_t v11 = _Block_copy(v18);
  id v12 = v8;
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_configureConnection_, v11);
  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v11)
  {
    __break(1u);
  }
  else if (qword_2696D0928 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v13 = sub_24982E3E8();
  __swift_project_value_buffer(v13, (uint64_t)qword_2696D0D30);
  int v14 = sub_24982E3C8();
  os_log_type_t v15 = sub_24982E598();
  if (os_log_type_enabled(v14, v15))
  {
    int v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v16 = 0;
    _os_log_impl(&dword_24980F000, v14, v15, "connection activating", v16, 2u);
    MEMORY[0x24C5AB450](v16, -1, -1);
  }

  objc_msgSend(v7, sel_activate);
  swift_release();

  return v12;
}

void sub_249819D14(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v4);

  if (qword_2696D0918 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_setInterface_, qword_2696D0D28);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int v14 = sub_24981C250;
  uint64_t v15 = v5;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  id v12 = sub_24981A0BC;
  uint64_t v13 = &block_descriptor_43;
  uint64_t v6 = _Block_copy(&v10);
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v6);
  _Block_release(v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int v14 = sub_24981C258;
  uint64_t v15 = v7;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  id v12 = sub_24981A0BC;
  uint64_t v13 = &block_descriptor_47;
  id v8 = _Block_copy(&v10);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
  int v14 = sub_24981A254;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 1107296256;
  id v12 = sub_24981A0BC;
  uint64_t v13 = &block_descriptor_50;
  uint64_t v9 = _Block_copy(&v10);
  objc_msgSend(a1, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
}

void sub_249819FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C5AB4B0](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    if (qword_2696D0928 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24982E3E8();
    __swift_project_value_buffer(v5, (uint64_t)qword_2696D0D30);
    uint64_t v6 = sub_24982E3C8();
    os_log_type_t v7 = sub_24982E598();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_24980F000, v6, v7, "connection activated", v8, 2u);
      MEMORY[0x24C5AB450](v8, -1, -1);
    }

    sub_24981A390();
  }
}

void sub_24981A0BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_24981A124(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x24C5AB4B0](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    if (qword_2696D0928 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24982E3E8();
    __swift_project_value_buffer(v5, (uint64_t)qword_2696D0D30);
    uint64_t v6 = sub_24982E3C8();
    os_log_type_t v7 = sub_24982E598();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_24980F000, v6, v7, "connection interrupted", v8, 2u);
      MEMORY[0x24C5AB450](v8, -1, -1);
    }

    if (swift_weakLoadStrong())
    {
      sub_2498195F4();
      swift_release();
    }
  }
}

void sub_24981A254()
{
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24982E3E8();
  __swift_project_value_buffer(v0, (uint64_t)qword_2696D0D30);
  oslog = sub_24982E3C8();
  os_log_type_t v1 = sub_24982E598();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_24980F000, oslog, v1, "connection invalidated", v2, 2u);
    MEMORY[0x24C5AB450](v2, -1, -1);
  }
}

uint64_t sub_24981A33C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_24981A390()
{
  uint64_t result = sub_2498198F0();
  if (result)
  {
    uint64_t v2 = (void *)result;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v0;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_24981B58C;
    *(void *)(v4 + 24) = v3;
    v8[4] = sub_24981B5A4;
    v8[5] = v4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_24981AE60;
    v8[3] = &block_descriptor;
    uint64_t v5 = _Block_copy(v8);
    id v6 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v2, sel_fetchVariantsWithReply_, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24981A4F4(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = a3;
  uint64_t v7 = sub_24982E468();
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24982E488();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24981B5E4();
  uint64_t v22 = sub_24982E5A8();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = a4;
  v14[4] = v21;
  v14[5] = a1;
  v14[6] = a2;
  aBlock[4] = sub_24981B6B4;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24981AE1C;
  aBlock[3] = &block_descriptor_30;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = a1;
  id v17 = a2;
  id v18 = a4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_24982E478();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24981B6C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0BD8);
  sub_24981B71C();
  sub_24982E618();
  objc_super v19 = (void *)v22;
  MEMORY[0x24C5AACF0](0, v12, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v23);
}

void sub_24981A7C4(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v9 = a1 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x24C5AB4B0](v9);
  if (!v10)
  {
    if (qword_2696D0928 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24982E3E8();
    __swift_project_value_buffer(v13, (uint64_t)qword_2696D0D30);
    uint64_t v11 = sub_24982E3C8();
    os_log_type_t v14 = sub_24982E588();
    if (os_log_type_enabled(v11, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24980F000, v11, v14, "_ClientProxy instance is nil.", v15, 2u);
      MEMORY[0x24C5AB450](v15, -1, -1);
    }
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  if (a2) {
    os_log_type_t v12 = sub_24982E588();
  }
  else {
    os_log_type_t v12 = sub_24982E578();
  }
  os_log_type_t v16 = v12;
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24982E3E8();
  __swift_project_value_buffer(v17, (uint64_t)qword_2696D0D30);
  id v18 = a2;
  swift_bridgeObjectRetain_n();
  id v19 = v18;
  char v20 = sub_24982E3C8();
  os_log_type_t v21 = v16;
  if (os_log_type_enabled(v20, v16))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v34 = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0BF0);
    uint64_t v24 = sub_24982E4B8();
    sub_24981B778(v24, v25, &v34);
    sub_24982E5E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    id v26 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0BF8);
    uint64_t v27 = sub_24982E4B8();
    sub_24981B778(v27, v28, &v34);
    sub_24982E5E8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24980F000, v20, v21, "fetched %s with error %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5AB450](v23, -1, -1);
    MEMORY[0x24C5AB450](v22, -1, -1);

    if (!a3)
    {
LABEL_18:
      if (swift_weakLoadStrong())
      {
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v34 = 0;
        swift_retain();
        sub_24982E448();
        swift_release();
      }
      goto LABEL_20;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a3) {
      goto LABEL_18;
    }
  }
  if (!a4) {
    goto LABEL_18;
  }
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    id v29 = a4;
    int v30 = objc_msgSend(a5, sel_BOOLValue);
    uint64_t v31 = sub_249817A40(a3);
    swift_bridgeObjectRelease();
    objc_allocWithZone((Class)type metadata accessor for CAUAssetLibrary());
    id v32 = v29;
    uint64_t v33 = sub_24982A058(v30, v31, v32);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v34 = (uint64_t)v33;
    swift_retain();
    sub_24982E448();
    swift_release();

    return;
  }
LABEL_20:
}

uint64_t sub_24981AE1C(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_24981AE60(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void (**)(void *, id, uint64_t, void *))(a1 + 32);
  if (a4) {
    uint64_t v9 = sub_24982E498();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  v8(a2, v11, v9, a5);

  return swift_bridgeObjectRelease();
}

id sub_24981AF24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CAUAssetLibraryManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t CAUAssetLibraryManager.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC13CarAssetUtils22CAUAssetLibraryManager__assetLibrary;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0B18);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24981B0D0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CAUAssetLibraryManager();
  uint64_t result = sub_24982E3F8();
  *a1 = result;
  return result;
}

id sub_24981B110()
{
  uint64_t v1 = v0;
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24982E3E8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2696D0D30);
  uint64_t v3 = sub_24982E3C8();
  os_log_type_t v4 = sub_24982E598();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24980F000, v3, v4, "invalidate proxy", v5, 2u);
    MEMORY[0x24C5AB450](v5, -1, -1);
  }

  id v6 = *(void **)(v1 + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection);

  return objc_msgSend(v6, sel_invalidate);
}

uint64_t sub_24981B35C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24981B370()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  uint64_t result = qword_2696D0B30;
  if (!qword_2696D0B30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24981B3C4()
{
  sub_24981B4D4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CAUAssetLibraryManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CAUAssetLibraryManager);
}

uint64_t dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_24981B4D4()
{
  if (!qword_2696D0B40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2696D0B20);
    unint64_t v0 = sub_24982E458();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696D0B40);
    }
  }
}

uint64_t type metadata accessor for CAUAssetLibraryManager._ClientProxy()
{
  return self;
}

uint64_t sub_24981B554()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24981B58C(void *a1, void *a2, uint64_t a3, void *a4)
{
  return sub_24981A4F4(a1, a2, a3, a4);
}

uint64_t sub_24981B594()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24981B5A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_24981B5E4()
{
  unint64_t result = qword_2696D0BC8;
  if (!qword_2696D0BC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696D0BC8);
  }
  return result;
}

uint64_t sub_24981B624()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24981B65C()
{
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_24981B6B4()
{
  sub_24981A7C4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48));
}

unint64_t sub_24981B6C4()
{
  unint64_t result = qword_2696D0BD0;
  if (!qword_2696D0BD0)
  {
    sub_24982E468();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0BD0);
  }
  return result;
}

unint64_t sub_24981B71C()
{
  unint64_t result = qword_2696D0BE0;
  if (!qword_2696D0BE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D0BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0BE0);
  }
  return result;
}

uint64_t sub_24981B778(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24981B84C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24981BDD0((uint64_t)v12, *a3);
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
      sub_24981BDD0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24981B84C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24982E5F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24981BA08(a5, a6);
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
  uint64_t v8 = sub_24982E648();
  if (!v8)
  {
    sub_24982E668();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24982E6B8();
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

uint64_t sub_24981BA08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24981BAA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24981BC80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24981BC80(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24981BAA0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24981BC18(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24982E638();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24982E668();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24982E508();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24982E6B8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24982E668();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24981BC18(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24981BC80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C00);
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
  uint64_t result = sub_24982E6B8();
  __break(1u);
  return result;
}

uint64_t sub_24981BDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24981BE30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24981BE98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0C08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24981BEF8()
{
  uint64_t v0 = (void *)sub_24982E4A8();
  uint64_t v1 = (void *)sub_24982E4A8();
  id v2 = objc_msgSend(self, sel_endpointForMachName_service_instance_, v0, v1, 0);

  if (v2)
  {
    id v3 = objc_msgSend(self, sel_connectionWithEndpoint_, v2);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_allocWithZone((Class)type metadata accessor for CAUAssetLibraryManager._ClientProxy());
      sub_249819A30(v4);
    }
    else
    {
      if (qword_2696D0928 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_24982E3E8();
      __swift_project_value_buffer(v11, (uint64_t)qword_2696D0D30);
      uint64_t v12 = sub_24982E3C8();
      os_log_type_t v13 = sub_24982E598();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v14 = 0;
        _os_log_impl(&dword_24980F000, v12, v13, "connection failed", v14, 2u);
        MEMORY[0x24C5AB450](v14, -1, -1);
      }

      sub_24981C1BC();
      swift_allocError();
      *uint64_t v15 = 1;
      swift_willThrow();
    }
  }
  else
  {
    if (qword_2696D0928 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24982E3E8();
    __swift_project_value_buffer(v6, (uint64_t)qword_2696D0D30);
    int64_t v7 = sub_24982E3C8();
    os_log_type_t v8 = sub_24982E598();
    if (os_log_type_enabled(v7, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl(&dword_24980F000, v7, v8, "endpoint failed", v9, 2u);
      MEMORY[0x24C5AB450](v9, -1, -1);
    }

    sub_24981C1BC();
    swift_allocError();
    *uint64_t v10 = 0;
    swift_willThrow();
  }
}

unint64_t sub_24981C1BC()
{
  unint64_t result = qword_2696D0C20;
  if (!qword_2696D0C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0C20);
  }
  return result;
}

void sub_24981C210(void *a1)
{
  sub_249819D14(a1, *(void *)(v1 + 16));
}

uint64_t sub_24981C218()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24981C228()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_24981C250(uint64_t a1)
{
  sub_249819FA8(a1, v1);
}

void sub_24981C258(uint64_t a1)
{
  sub_24981A124(a1, v1);
}

BOOL static CAUVehicleLayoutKey.End.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CAUVehicleLayoutKey.End.hash(into:)()
{
  return sub_24982E838();
}

void CAUVehicleLayoutKey.side.getter(unsigned char *a1@<X8>)
{
  *a1 = byte_24982FD06[*v1];
}

void CAUVehicleLayoutKey.end.getter(unsigned char *a1@<X8>)
{
  *a1 = byte_24982FD27[*v1];
}

uint64_t CAUVehicleLayoutKey.sharedKeys.getter()
{
  return qword_265273E10[*v0];
}

CarAssetUtils::CAUVehicleLayoutKey_optional __swiftcall CAUVehicleLayoutKey.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  uint64_t v3 = sub_24982E7C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 15;
  switch(v3)
  {
    case 0:
      goto LABEL_17;
    case 1:
      char v5 = 1;
      goto LABEL_17;
    case 2:
      char v5 = 2;
      goto LABEL_17;
    case 3:
      char v5 = 3;
      goto LABEL_17;
    case 4:
      char v5 = 4;
      goto LABEL_17;
    case 5:
      char v5 = 5;
      goto LABEL_17;
    case 6:
      char v5 = 6;
      goto LABEL_17;
    case 7:
      char v5 = 7;
      goto LABEL_17;
    case 8:
      char v5 = 8;
      goto LABEL_17;
    case 9:
      char v5 = 9;
      goto LABEL_17;
    case 10:
      char v5 = 10;
      goto LABEL_17;
    case 11:
      char v5 = 11;
      goto LABEL_17;
    case 12:
      char v5 = 12;
      goto LABEL_17;
    case 13:
      char v5 = 13;
      goto LABEL_17;
    case 14:
      char v5 = 14;
LABEL_17:
      char v6 = v5;
      break;
    case 15:
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    default:
      char v6 = 33;
      break;
  }
  *id v2 = v6;
  return result;
}

void *static CAUVehicleLayoutKey.allCases.getter()
{
  return &unk_26FD95D48;
}

uint64_t CAUVehicleLayoutKey.rawValue.getter()
{
  uint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
    case 0xC:
    case 0xF:
    case 0x13:
    case 0x19:
    case 0x1B:
    case 0x1F:
      return result;
    case 2:
    case 3:
      unsigned int v3 = 1919905636;
      return v3 | 0x6165725F00000000;
    case 4:
      return 0x6B6E757266;
    case 5:
      return 0x726168436C657566;
    case 6:
      return 0xD000000000000019;
    case 7:
      return 0xD00000000000001ALL;
    case 8:
      return 0xD000000000000018;
    case 9:
      return 0xD000000000000019;
    case 0xA:
      return 1685024616;
    case 0xB:
      return 0x6C5F726F7272696DLL;
    case 0xD:
      return 0x735F726F7272696DLL;
    case 0xE:
      return 0x646E325F74616573;
    case 0x10:
      return 0xD000000000000012;
    case 0x11:
      return 0xD000000000000011;
    case 0x12:
      return 0x6472335F74616573;
    case 0x14:
      return 0xD000000000000012;
    case 0x15:
      return 0xD000000000000011;
    case 0x16:
    case 0x17:
      return 0x6F72665F74616573;
    case 0x18:
      return 0xD000000000000011;
    case 0x1A:
      unsigned int v2 = 1701996916;
      return v2 | 0x6F72665F00000000;
    case 0x1C:
    case 0x1D:
      unsigned int v3 = 1701996916;
      return v3 | 0x6165725F00000000;
    case 0x1E:
      return 0x6B6E757274;
    case 0x20:
      return 0x65696873646E6977;
    default:
      unsigned int v2 = 1919905636;
      return v2 | 0x6F72665F00000000;
  }
}

unint64_t sub_24981C89C()
{
  unint64_t result = qword_2696D0CF0;
  if (!qword_2696D0CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0CF0);
  }
  return result;
}

unint64_t sub_24981C8F4()
{
  unint64_t result = qword_2696D0CF8;
  if (!qword_2696D0CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0CF8);
  }
  return result;
}

uint64_t sub_24981C948()
{
  return sub_249825254();
}

unint64_t sub_24981C958()
{
  unint64_t result = qword_2696D0D00;
  if (!qword_2696D0D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D00);
  }
  return result;
}

uint64_t sub_24981C9AC()
{
  return sub_24982E848();
}

uint64_t sub_24981CA14()
{
  CAUVehicleLayoutKey.rawValue.getter();
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24981CA78()
{
  return sub_24982E848();
}

CarAssetUtils::CAUVehicleLayoutKey_optional sub_24981CADC(Swift::String *a1)
{
  return CAUVehicleLayoutKey.init(rawValue:)(*a1);
}

uint64_t sub_24981CAE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CAUVehicleLayoutKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24981CB10()
{
  return sub_24982E548();
}

uint64_t sub_24981CB70()
{
  return sub_24982E538();
}

uint64_t sub_24981CBC0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24981CFB0();

  return MEMORY[0x270F9DB68](a1, a2, v4);
}

uint64_t sub_24981CC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_24981CFB0();

  return MEMORY[0x270F9DB70](a1, a4, a2, a5, v10, a3);
}

unint64_t sub_24981CC94()
{
  unint64_t result = qword_2696D0D08;
  if (!qword_2696D0D08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D0D10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D08);
  }
  return result;
}

void sub_24981CCF0(void *a1@<X8>)
{
  *a1 = &unk_26FD95D48;
}

uint64_t getEnumTagSinglePayload for CAUVehicleLayoutKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE0) {
    goto LABEL_17;
  }
  if (a2 + 32 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 32) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 32;
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
      return (*a1 | (v4 << 8)) - 32;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 32;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x21;
  int v8 = v6 - 33;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CAUVehicleLayoutKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 32 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 32) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDF)
  {
    unsigned int v6 = ((a2 - 224) >> 8) + 1;
    *unint64_t result = a2 + 32;
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
        JUMPOUT(0x24981CE5CLL);
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
          *unint64_t result = a2 + 32;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey()
{
  return &type metadata for CAUVehicleLayoutKey;
}

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey.Side()
{
  return &type metadata for CAUVehicleLayoutKey.Side;
}

unsigned char *_s13CarAssetUtils19CAUVehicleLayoutKeyO4SideOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24981CF78);
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

ValueMetadata *type metadata accessor for CAUVehicleLayoutKey.End()
{
  return &type metadata for CAUVehicleLayoutKey.End;
}

unint64_t sub_24981CFB0()
{
  unint64_t result = qword_2696D0D18;
  if (!qword_2696D0D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D18);
  }
  return result;
}

unint64_t static CAUVariantsService.domain.getter()
{
  return 0xD000000000000020;
}

unint64_t static CAUVariantsService.machName.getter()
{
  return 0xD000000000000020;
}

unint64_t static CAUVariantsService.entitlement.getter()
{
  return 0xD000000000000028;
}

unint64_t static CAUVariantsService.identifier.getter()
{
  return 0xD000000000000020;
}

id sub_24981D0FC()
{
  id result = objc_msgSend(self, sel_userInteractive);
  qword_2696D0D20 = (uint64_t)result;
  return result;
}

id static CAUVariantsService.serviceQuality.getter()
{
  return sub_24981D2D0(&qword_2696D0910, (void **)&qword_2696D0D20);
}

id sub_24981D180()
{
  id result = sub_24981D1A0();
  qword_2696D0D28 = (uint64_t)result;
  return result;
}

id sub_24981D1A0()
{
  uint64_t v0 = (void *)sub_24982E4A8();
  id v1 = objc_msgSend(self, sel_interfaceWithIdentifier_, v0);

  objc_msgSend(v1, sel_setClientMessagingExpectation_, 1);
  int v2 = self;
  id v3 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_26FD9A5A0);
  objc_msgSend(v1, sel_setServer_, v3);

  id v4 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_26FD9A200);
  objc_msgSend(v1, sel_setClient_, v4);

  return v1;
}

id static CAUVariantsService.interface.getter()
{
  return sub_24981D2D0(&qword_2696D0918, (void **)&qword_2696D0D28);
}

id sub_24981D2D0(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;

  return v3;
}

id sub_24981D340(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id CAUVariantsService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CAUVariantsService.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUVariantsService();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CAUVariantsService()
{
  return self;
}

id CAUVariantsService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUVariantsService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24981D49C()
{
  sub_24981E334();
  uint64_t result = sub_24982E5C8();
  qword_2696D7AE0 = result;
  return result;
}

uint64_t static CAULogger.error(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_24981D580(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90280]);
}

uint64_t static CAULogger.info(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_24981D580(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90270]);
}

uint64_t static CAULogger.default(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_24981D580(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90270]);
}

uint64_t static CAULogger.debug(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_24981D580(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90278]);
}

uint64_t static CAULogger.fault(_:function:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  return sub_24981D580(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x263F90288]);
}

uint64_t sub_24981D580(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  os_log_type_t v15 = a8();
  if (qword_2696D0920 != -1) {
    swift_once();
  }
  return sub_24981DF70(v15, (os_log_t)qword_2696D7AE0, a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24981D640()
{
  uint64_t v0 = sub_24982E3E8();
  __swift_allocate_value_buffer(v0, qword_2696D0D30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696D0D30);
  return sub_24982E3D8();
}

uint64_t static Logger.assetVariants.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2696D0928 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24982E3E8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2696D0D30);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_24981D76C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
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
    sub_24981DC10(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    os_log_type_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  os_log_type_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_24982E518();
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
    unint64_t v14 = sub_24982E4E8();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_24982E4E8();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_24982E528();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    os_log_type_t v13 = sub_24981DD6C(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    os_log_type_t v13 = sub_24981DD6C((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  unint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_24982E4E8();
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
    uint64_t v31 = sub_24982E528();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      os_log_type_t v13 = sub_24981DD6C(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      os_log_type_t v13 = sub_24981DD6C((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    int64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_24982E668();
  __break(1u);
LABEL_42:
  uint64_t result = sub_24982E668();
  __break(1u);
  return result;
}

uint64_t sub_24981DC10(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24982E528();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_24981DD6C(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_24981DD6C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    char v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    void v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24982E668();
  __break(1u);
  return result;
}

void *sub_24981DD6C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0D48);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
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
    sub_24981DE7C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24981DE7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24982E6B8();
  __break(1u);
  return result;
}

uint64_t sub_24981DF70(os_log_type_t a1, os_log_t oslog, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  uint64_t result = os_log_type_enabled(oslog, a1);
  if (result)
  {
    uint64_t v38 = a3;
    os_log_t v39 = oslog;
    uint64_t v35 = a9;
    uint64_t v36 = a5;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v37 = v19;
    *(_DWORD *)uint64_t v18 = 136315906;
    v40[0] = 47;
    v40[1] = 0xE100000000000000;
    uint64_t v41 = v19;
    MEMORY[0x270FA5388](v19);
    v34[2] = v40;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_24981D76C(0x7FFFFFFFFFFFFFFFLL, 1, sub_24981E294, (uint64_t)v34, a7, a8);
    uint64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
      uint64_t v22 = (uint64_t *)(v20 + 32 * v21);
      uint64_t v23 = *v22;
      uint64_t v24 = v22[1];
      uint64_t v26 = v22[2];
      uint64_t v25 = v22[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = MEMORY[0x24C5AAD10](0, 0xE000000000000000);
      uint64_t v24 = v27;
      uint64_t v26 = v28;
      uint64_t v25 = v29;
    }
    uint64_t v30 = MEMORY[0x24C5AAC00](v23, v24, v26, v25);
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    v40[0] = sub_24981B778(v30, v32, &v41);
    sub_24982E5E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2048;
    v40[0] = v35;
    sub_24982E5E8();
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain();
    v40[0] = sub_24981B778(v36, a6, &v41);
    sub_24982E5E8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 32) = 2080;
    swift_bridgeObjectRetain();
    v40[0] = sub_24981B778(v38, a4, &v41);
    sub_24982E5E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24980F000, v39, a1, "%s:%ld %s - %s", (uint8_t *)v18, 0x2Au);
    uint64_t v33 = v37;
    swift_arrayDestroy();
    MEMORY[0x24C5AB450](v33, -1, -1);
    return MEMORY[0x24C5AB450](v18, -1, -1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CAULogger()
{
  return &type metadata for CAULogger;
}

uint64_t sub_24981E294(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_24982E7B8() & 1;
  }
}

uint64_t sub_24981E2EC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24981E324()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_24981E334()
{
  unint64_t result = qword_2696D0D50;
  if (!qword_2696D0D50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696D0D50);
  }
  return result;
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

CarAssetUtils::CAUAsset::ClosureMask::State_optional __swiftcall CAUAsset.ClosureMask.State.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24982E6C8();
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

uint64_t CAUAsset.ClosureMask.State.rawValue.getter()
{
  if (*v0) {
    return 0x6465736F6C63;
  }
  else {
    return 1852141679;
  }
}

uint64_t sub_24981E46C(char *a1, char *a2)
{
  return sub_249825374(*a1, *a2);
}

uint64_t sub_24981E478()
{
  return sub_249823040();
}

uint64_t sub_24981E480()
{
  return sub_249824324();
}

uint64_t sub_24981E488()
{
  return sub_2498232F0();
}

CarAssetUtils::CAUAsset::ClosureMask::State_optional sub_24981E490(Swift::String *a1)
{
  return CAUAsset.ClosureMask.State.init(rawValue:)(*a1);
}

uint64_t sub_24981E49C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CAUAsset.ClosureMask.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24981E4C4()
{
  return sub_24982E548();
}

uint64_t sub_24981E524()
{
  return sub_24982E538();
}

uint64_t sub_24981E574(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_249822E78();

  return MEMORY[0x270F9DB68](a1, a2, v4);
}

uint64_t sub_24981E5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_249822E78();

  return MEMORY[0x270F9DB70](a1, a4, a2, a5, v10, a3);
}

uint64_t CAUAsset.ClosureMask.filename.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::ClosureMask __swiftcall CAUAsset.ClosureMask.init(vehicleLayoutKey:state:filename:)(CarAssetUtils::CAUVehicleLayoutKey vehicleLayoutKey, CarAssetUtils::CAUAsset::ClosureMask::State state, Swift::String filename)
{
  char v4 = *(unsigned char *)state;
  *(unsigned char *)uint64_t v3 = *(unsigned char *)vehicleLayoutKey;
  *(unsigned char *)(v3 + 1) = v4;
  *(Swift::String *)(v3 + 8) = filename;
  result.filename._object = (void *)filename._countAndFlagsBits;
  LOBYTE(result.filename._countAndFlagsBits) = state;
  result.vehicleLayoutKey = vehicleLayoutKey;
  return result;
}

uint64_t sub_24981E690(char a1)
{
  if (!a1) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 0x6574617473;
  }
  return 0x656D616E656C6966;
}

uint64_t sub_24981E6E8()
{
  return sub_24981E690(*v0);
}

uint64_t sub_24981E6F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2498229C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24981E718(uint64_t a1)
{
  unint64_t v2 = sub_249820BD8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981E754(uint64_t a1)
{
  unint64_t v2 = sub_249820BD8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.ClosureMask.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0D58);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  int v12 = v1[1];
  uint64_t v9 = *((void *)v1 + 1);
  v11[1] = *((void *)v1 + 2);
  v11[2] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249820BD8();
  sub_24982E868();
  char v17 = v8;
  char v16 = 0;
  sub_249813494();
  sub_24982E788();
  if (!v2)
  {
    char v15 = v12;
    char v14 = 1;
    sub_249820C2C();
    sub_24982E788();
    char v13 = 2;
    sub_24982E758();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CAUAsset.ClosureMask.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0D70);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249820BD8();
  sub_24982E858();
  if (!v2)
  {
    char v19 = 0;
    sub_249813DC8();
    sub_24982E728();
    char v9 = v20;
    char v17 = 1;
    sub_249820C80();
    sub_24982E728();
    int v15 = v18;
    char v16 = 2;
    uint64_t v11 = sub_24982E6F8();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(unsigned char *)(a2 + 1) = v15;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24981EB74@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.ClosureMask.init(from:)(a1, a2);
}

uint64_t sub_24981EB8C(void *a1)
{
  return CAUAsset.ClosureMask.encode(to:)(a1);
}

uint64_t sub_24981EBA8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::Seat::State_optional __swiftcall CAUAsset.Seat.State.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24982E6C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CAUAsset.Seat.State.rawValue.getter()
{
  return *(void *)&aSelectedheaton[8 * *v0];
}

uint64_t sub_24981EC58(char *a1, char *a2)
{
  return sub_2498252EC(*a1, *a2);
}

uint64_t sub_24981EC64()
{
  return sub_2498230B8();
}

uint64_t sub_24981EC6C()
{
  return sub_2498242D0();
}

uint64_t sub_24981EC74()
{
  return sub_249823364();
}

CarAssetUtils::CAUAsset::Seat::State_optional sub_24981EC7C(Swift::String *a1)
{
  return CAUAsset.Seat.State.init(rawValue:)(*a1);
}

uint64_t sub_24981EC88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CAUAsset.Seat.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24981ECB0()
{
  return sub_24982E548();
}

uint64_t sub_24981ED10()
{
  return sub_24982E538();
}

uint64_t sub_24981ED60(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_249822E24();

  return MEMORY[0x270F9DB68](a1, a2, v4);
}

uint64_t sub_24981EDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_249822E24();

  return MEMORY[0x270F9DB70](a1, a4, a2, a5, v10, a3);
}

uint64_t CAUAsset.Seat.isRHD.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

CarAssetUtils::CAUAsset::Seat __swiftcall CAUAsset.Seat.init(isRHD:vehicleLayoutKey:state:filename:)(Swift::Bool isRHD, CarAssetUtils::CAUVehicleLayoutKey vehicleLayoutKey, CarAssetUtils::CAUAsset::Seat::State state, Swift::String filename)
{
  char v5 = *(unsigned char *)state;
  *(unsigned char *)uint64_t v4 = *(unsigned char *)vehicleLayoutKey;
  *(unsigned char *)(v4 + 1) = v5;
  *(unsigned char *)(v4 + 2) = isRHD;
  *(Swift::String *)(v4 + 8) = filename;
  LOBYTE(result.filename._object) = state;
  LOBYTE(result.filename._countAndFlagsBits) = vehicleLayoutKey;
  result.vehicleLayoutKey = isRHD;
  return result;
}

unint64_t sub_24981EE58(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574617473;
      break;
    case 2:
      unint64_t result = 0x4448527369;
      break;
    case 3:
      unint64_t result = 0x656D616E656C6966;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24981EEE8()
{
  return sub_24981EE58(*v0);
}

uint64_t sub_24981EEF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249822B08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24981EF18(uint64_t a1)
{
  unint64_t v2 = sub_249820E2C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981EF54(uint64_t a1)
{
  unint64_t v2 = sub_249820E2C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.Seat.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0D80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  int v9 = v1[1];
  int v13 = v1[2];
  int v14 = v9;
  uint64_t v10 = *((void *)v1 + 1);
  v12[1] = *((void *)v1 + 2);
  void v12[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249820E2C();
  sub_24982E868();
  char v20 = v8;
  char v19 = 0;
  sub_249813494();
  sub_24982E788();
  if (!v2)
  {
    char v18 = v14;
    char v17 = 1;
    sub_249820E80();
    sub_24982E788();
    char v16 = 2;
    sub_24982E768();
    char v15 = 3;
    sub_24982E758();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CAUAsset.Seat.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0D98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249820E2C();
  sub_24982E858();
  if (!v2)
  {
    char v22 = 0;
    sub_249813DC8();
    sub_24982E728();
    char v9 = v23;
    char v20 = 1;
    sub_249820ED4();
    sub_24982E728();
    int v10 = v21;
    char v19 = 2;
    int v16 = sub_24982E708();
    int v17 = v10;
    char v18 = 3;
    uint64_t v12 = sub_24982E6F8();
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(unsigned char *)(a2 + 1) = v17;
    *(unsigned char *)(a2 + 2) = v16 & 1;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 16) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24981F3D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.Seat.init(from:)(a1, a2);
}

uint64_t sub_24981F3E8(void *a1)
{
  return CAUAsset.Seat.encode(to:)(a1);
}

uint64_t sub_24981F408()
{
  return 1;
}

void sub_24981F41C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24981F428(uint64_t a1)
{
  unint64_t v2 = sub_249820F28();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981F464(uint64_t a1)
{
  unint64_t v2 = sub_249820F28();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.AudioBrandLogo.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0DA8, (void (*)(void))sub_249820F28);
}

uint64_t CAUAsset.AudioBrandLogo.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0DB8, (void (*)(void))sub_249820F28, a2);
}

uint64_t sub_24981F518@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.AudioBrandLogo.init(from:)(a1, a2);
}

uint64_t sub_24981F530(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0DA8, (void (*)(void))sub_249820F28);
}

uint64_t sub_24981F574(uint64_t a1)
{
  unint64_t v2 = sub_249820F7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981F5B0(uint64_t a1)
{
  unint64_t v2 = sub_249820F7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.VehicleLogo.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0DC0, (void (*)(void))sub_249820F7C);
}

uint64_t CAUAsset.VehicleLogo.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0DD0, (void (*)(void))sub_249820F7C, a2);
}

uint64_t sub_24981F664@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.VehicleLogo.init(from:)(a1, a2);
}

uint64_t sub_24981F67C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0DC0, (void (*)(void))sub_249820F7C);
}

uint64_t CAUAsset.Cabin.isRHD.getter()
{
  return *v0;
}

uint64_t sub_24981F6C4(uint64_t a1)
{
  unint64_t v2 = sub_249820FD0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981F700(uint64_t a1)
{
  unint64_t v2 = sub_249820FD0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.Cabin.encode(to:)(void *a1)
{
  return sub_24981F960(a1, &qword_2696D0DD8, (void (*)(void))sub_249820FD0);
}

uint64_t CAUAsset.Cabin.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24981FB14(a1, &qword_2696D0DE8, (void (*)(void))sub_249820FD0, a2);
}

uint64_t sub_24981F7B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.Cabin.init(from:)(a1, a2);
}

uint64_t sub_24981F7CC(void *a1)
{
  return CAUAsset.Cabin.encode(to:)(a1);
}

uint64_t CAUAsset.TopDownInterior.isRHD.getter()
{
  return *v0;
}

CarAssetUtils::CAUAsset::TopDownInterior __swiftcall CAUAsset.TopDownInterior.init(isRHD:filename:)(Swift::Bool isRHD, Swift::String filename)
{
  *(unsigned char *)uint64_t v2 = isRHD;
  *(Swift::String *)(v2 + 8) = filename;
  result.filename = filename;
  result.isRHD = isRHD;
  return result;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)) {
    return 1;
  }
  else {
    return sub_24982E7B8();
  }
}

uint64_t sub_24981F848(char a1)
{
  if (a1) {
    return 0x656D616E656C6966;
  }
  else {
    return 0x4448527369;
  }
}

uint64_t sub_24981F87C()
{
  return sub_24981F848(*v0);
}

uint64_t sub_24981F884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249822CA0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24981F8AC(uint64_t a1)
{
  unint64_t v2 = sub_249821024();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981F8E8(uint64_t a1)
{
  unint64_t v2 = sub_249821024();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.TopDownInterior.encode(to:)(void *a1)
{
  return sub_24981F960(a1, &qword_2696D0DF0, (void (*)(void))sub_249821024);
}

uint64_t sub_24981F960(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v13 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v3 + 8);
  v12[0] = *(void *)(v3 + 16);
  v12[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13();
  sub_24982E868();
  char v16 = 0;
  uint64_t v10 = v14;
  sub_24982E768();
  if (!v10)
  {
    char v15 = 1;
    sub_24982E758();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t CAUAsset.TopDownInterior.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24981FB14(a1, &qword_2696D0E00, (void (*)(void))sub_249821024, a2);
}

uint64_t sub_24981FB14@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v18 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24982E858();
  if (!v4)
  {
    uint64_t v11 = v17;
    uint64_t v10 = v18;
    char v20 = 0;
    uint64_t v12 = sub_24982E708();
    char v19 = 1;
    uint64_t v14 = sub_24982E6F8();
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v7);
    *(unsigned char *)uint64_t v10 = v12 & 1;
    *(void *)(v10 + 8) = v14;
    *(void *)(v10 + 16) = v16;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24981FCC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUAsset.TopDownInterior.init(from:)(a1, a2);
}

uint64_t sub_24981FCE0(void *a1)
{
  return CAUAsset.TopDownInterior.encode(to:)(a1);
}

uint64_t sub_24981FCFC(uint64_t a1)
{
  unint64_t v2 = sub_249821078();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981FD38(uint64_t a1)
{
  unint64_t v2 = sub_249821078();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.TopDownExteriorClosuresOverlay.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E08, (void (*)(void))sub_249821078);
}

uint64_t CAUAsset.TopDownExteriorClosuresOverlay.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E18, (void (*)(void))sub_249821078, a2);
}

uint64_t sub_24981FDEC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.TopDownExteriorClosuresOverlay.init(from:)(a1, a2);
}

uint64_t sub_24981FE04(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E08, (void (*)(void))sub_249821078);
}

uint64_t sub_24981FE44(uint64_t a1)
{
  unint64_t v2 = sub_2498210CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981FE80(uint64_t a1)
{
  unint64_t v2 = sub_2498210CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.TopDownExteriorVisible.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E20, (void (*)(void))sub_2498210CC);
}

uint64_t CAUAsset.TopDownExteriorVisible.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E30, (void (*)(void))sub_2498210CC, a2);
}

uint64_t sub_24981FF34@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.TopDownExteriorVisible.init(from:)(a1, a2);
}

uint64_t sub_24981FF4C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E20, (void (*)(void))sub_2498210CC);
}

uint64_t sub_24981FF8C(uint64_t a1)
{
  unint64_t v2 = sub_249821120();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24981FFC8(uint64_t a1)
{
  unint64_t v2 = sub_249821120();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.VehicleLayout.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E38, (void (*)(void))sub_249821120);
}

uint64_t CAUAsset.VehicleLayout.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E48, (void (*)(void))sub_249821120, a2);
}

uint64_t sub_24982007C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.VehicleLayout.init(from:)(a1, a2);
}

uint64_t sub_249820094(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E38, (void (*)(void))sub_249821120);
}

uint64_t sub_2498200D4(uint64_t a1)
{
  unint64_t v2 = sub_249821174();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249820110(uint64_t a1)
{
  unint64_t v2 = sub_249821174();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.WallpaperOverlay.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E50, (void (*)(void))sub_249821174);
}

uint64_t CAUAsset.WallpaperOverlay.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E60, (void (*)(void))sub_249821174, a2);
}

uint64_t sub_2498201C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.WallpaperOverlay.init(from:)(a1, a2);
}

uint64_t sub_2498201DC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E50, (void (*)(void))sub_249821174);
}

uint64_t sub_24982021C(uint64_t a1)
{
  unint64_t v2 = sub_2498211C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249820258(uint64_t a1)
{
  unint64_t v2 = sub_2498211C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.PhysicalControlBarsLayout.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E68, (void (*)(void))sub_2498211C8);
}

uint64_t CAUAsset.PhysicalControlBarsLayout.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E78, (void (*)(void))sub_2498211C8, a2);
}

uint64_t sub_24982030C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.PhysicalControlBarsLayout.init(from:)(a1, a2);
}

uint64_t sub_249820324(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E68, (void (*)(void))sub_2498211C8);
}

uint64_t CAUAsset.FeatureFlag.filename.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

CarAssetUtils::CAUAsset::FeatureFlag __swiftcall CAUAsset.FeatureFlag.init(filename:)(CarAssetUtils::CAUAsset::FeatureFlag filename)
{
  CarAssetUtils::CAUAsset::FeatureFlag *v1 = filename;
  return filename;
}

uint64_t _s13CarAssetUtils8CAUAssetO14AudioBrandLogoV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24982E7B8();
  }
}

uint64_t sub_2498203CC()
{
  return sub_24982E848();
}

uint64_t sub_249820410()
{
  return sub_24982E838();
}

uint64_t sub_249820438()
{
  return sub_24982E848();
}

uint64_t sub_249820478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249822D84(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2498204A4(uint64_t a1)
{
  unint64_t v2 = sub_24982121C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2498204E0(uint64_t a1)
{
  unint64_t v2 = sub_24982121C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUAsset.FeatureFlag.encode(to:)(void *a1)
{
  return sub_249820558(a1, &qword_2696D0E80, (void (*)(void))sub_24982121C);
}

uint64_t sub_249820558(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v11 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11();
  sub_24982E868();
  sub_24982E758();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t CAUAsset.FeatureFlag.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2498206DC(a1, &qword_2696D0E90, (void (*)(void))sub_24982121C, a2);
}

uint64_t sub_2498206DC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v18 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24982E858();
  if (!v4)
  {
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    uint64_t v12 = sub_24982E6F8();
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v7);
    uint64_t *v11 = v12;
    v11[1] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24982085C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CAUAsset.FeatureFlag.init(from:)(a1, a2);
}

uint64_t sub_249820874(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2498208B0(a1, a2, a3, &qword_2696D0E80, (void (*)(void))sub_24982121C);
}

uint64_t sub_2498208B0(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v13 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13();
  sub_24982E868();
  sub_24982E758();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2498209F8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 1);
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = CAUVehicleLayoutKey.rawValue.getter();
  uint64_t v10 = v9;
  if (v8 == CAUVehicleLayoutKey.rawValue.getter() && v10 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v12 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v12 & 1) == 0) {
      return result;
    }
  }
  if (v2) {
    uint64_t v14 = 0x6465736F6C63;
  }
  else {
    uint64_t v14 = 1852141679;
  }
  if (v2) {
    unint64_t v15 = 0xE600000000000000;
  }
  else {
    unint64_t v15 = 0xE400000000000000;
  }
  if (v5) {
    uint64_t v16 = 0x6465736F6C63;
  }
  else {
    uint64_t v16 = 1852141679;
  }
  if (v5) {
    unint64_t v17 = 0xE600000000000000;
  }
  else {
    unint64_t v17 = 0xE400000000000000;
  }
  if (v14 == v16 && v15 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v18 & 1) == 0) {
      return result;
    }
  }
  if (v3 == v6 && v4 == v7) {
    return 1;
  }

  return sub_24982E7B8();
}

unint64_t sub_249820BD8()
{
  unint64_t result = qword_2696D0D60;
  if (!qword_2696D0D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D60);
  }
  return result;
}

unint64_t sub_249820C2C()
{
  unint64_t result = qword_2696D0D68;
  if (!qword_2696D0D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D68);
  }
  return result;
}

unint64_t sub_249820C80()
{
  unint64_t result = qword_2696D0D78;
  if (!qword_2696D0D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D78);
  }
  return result;
}

uint64_t _s13CarAssetUtils8CAUAssetO4SeatV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a1 + 1);
  int v3 = *(unsigned __int8 *)(a1 + 2);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v16 = *(void *)(a1 + 16);
  char v5 = *(unsigned char *)(a2 + 1);
  int v6 = *(unsigned __int8 *)(a2 + 2);
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = CAUVehicleLayoutKey.rawValue.getter();
  uint64_t v11 = v10;
  if (v9 == CAUVehicleLayoutKey.rawValue.getter() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v13 & 1) == 0) {
      return result;
    }
  }
  char v15 = sub_2498252EC(v2, v5);
  uint64_t result = 0;
  if ((v15 & 1) != 0 && ((v3 ^ v6) & 1) == 0)
  {
    if (v4 == v7 && v16 == v8)
    {
      return 1;
    }
    else
    {
      return sub_24982E7B8();
    }
  }
  return result;
}

unint64_t sub_249820E2C()
{
  unint64_t result = qword_2696D0D88;
  if (!qword_2696D0D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D88);
  }
  return result;
}

unint64_t sub_249820E80()
{
  unint64_t result = qword_2696D0D90;
  if (!qword_2696D0D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0D90);
  }
  return result;
}

unint64_t sub_249820ED4()
{
  unint64_t result = qword_2696D0DA0;
  if (!qword_2696D0DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0DA0);
  }
  return result;
}

unint64_t sub_249820F28()
{
  unint64_t result = qword_2696D0DB0;
  if (!qword_2696D0DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0DB0);
  }
  return result;
}

unint64_t sub_249820F7C()
{
  unint64_t result = qword_2696D0DC8;
  if (!qword_2696D0DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0DC8);
  }
  return result;
}

unint64_t sub_249820FD0()
{
  unint64_t result = qword_2696D0DE0;
  if (!qword_2696D0DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0DE0);
  }
  return result;
}

unint64_t sub_249821024()
{
  unint64_t result = qword_2696D0DF8;
  if (!qword_2696D0DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0DF8);
  }
  return result;
}

unint64_t sub_249821078()
{
  unint64_t result = qword_2696D0E10;
  if (!qword_2696D0E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E10);
  }
  return result;
}

unint64_t sub_2498210CC()
{
  unint64_t result = qword_2696D0E28;
  if (!qword_2696D0E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E28);
  }
  return result;
}

unint64_t sub_249821120()
{
  unint64_t result = qword_2696D0E40;
  if (!qword_2696D0E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E40);
  }
  return result;
}

unint64_t sub_249821174()
{
  unint64_t result = qword_2696D0E58;
  if (!qword_2696D0E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E58);
  }
  return result;
}

unint64_t sub_2498211C8()
{
  unint64_t result = qword_2696D0E70;
  if (!qword_2696D0E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E70);
  }
  return result;
}

unint64_t sub_24982121C()
{
  unint64_t result = qword_2696D0E88;
  if (!qword_2696D0E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E88);
  }
  return result;
}

unint64_t sub_249821274()
{
  unint64_t result = qword_2696D0E98;
  if (!qword_2696D0E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0E98);
  }
  return result;
}

unint64_t sub_2498212CC()
{
  unint64_t result = qword_2696D0EA0;
  if (!qword_2696D0EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset()
{
  return &type metadata for CAUAsset;
}

uint64_t destroy for CAUAsset.ClosureMask()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUAsset.ClosureMask(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CAUAsset.ClosureMask(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask()
{
  return &type metadata for CAUAsset.ClosureMask;
}

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask.State()
{
  return &type metadata for CAUAsset.ClosureMask.State;
}

uint64_t sub_249821448(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAUAsset.Seat(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CAUAsset.Seat(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAUAsset.Seat()
{
  return &type metadata for CAUAsset.Seat;
}

ValueMetadata *type metadata accessor for CAUAsset.Seat.State()
{
  return &type metadata for CAUAsset.Seat.State;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.AudioBrandLogo()
{
  return &type metadata for CAUAsset.AudioBrandLogo;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLogo()
{
  return &type metadata for CAUAsset.VehicleLogo;
}

ValueMetadata *type metadata accessor for CAUAsset.Cabin()
{
  return &type metadata for CAUAsset.Cabin;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO5CabinVwta_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO11ClosureMaskVwet_0(uint64_t a1, int a2)
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

uint64_t sub_2498216A8(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CAUAsset.TopDownInterior()
{
  return &type metadata for CAUAsset.TopDownInterior;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorClosuresOverlay()
{
  return &type metadata for CAUAsset.TopDownExteriorClosuresOverlay;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorVisible()
{
  return &type metadata for CAUAsset.TopDownExteriorVisible;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLayout()
{
  return &type metadata for CAUAsset.VehicleLayout;
}

ValueMetadata *type metadata accessor for CAUAsset.WallpaperOverlay()
{
  return &type metadata for CAUAsset.WallpaperOverlay;
}

ValueMetadata *type metadata accessor for CAUAsset.PhysicalControlBarsLayout()
{
  return &type metadata for CAUAsset.PhysicalControlBarsLayout;
}

void *initializeBufferWithCopyOfBuffer for CAUAsset.FeatureFlag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CAUAsset.FeatureFlag()
{
  return swift_bridgeObjectRelease();
}

void *_s13CarAssetUtils8CAUAssetO14AudioBrandLogoVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for CAUAsset.FeatureFlag(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13CarAssetUtils8CAUAssetO14AudioBrandLogoVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_249821840(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.FeatureFlag()
{
  return &type metadata for CAUAsset.FeatureFlag;
}

uint64_t dispatch thunk of CAUFileName.filename.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2498218AC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CAUAsset.FeatureFlag.CodingKeys()
{
  return &type metadata for CAUAsset.FeatureFlag.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.PhysicalControlBarsLayout.CodingKeys()
{
  return &type metadata for CAUAsset.PhysicalControlBarsLayout.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.WallpaperOverlay.CodingKeys()
{
  return &type metadata for CAUAsset.WallpaperOverlay.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLayout.CodingKeys()
{
  return &type metadata for CAUAsset.VehicleLayout.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorVisible.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownExteriorVisible.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownExteriorClosuresOverlay.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.TopDownInterior.CodingKeys()
{
  return &type metadata for CAUAsset.TopDownInterior.CodingKeys;
}

unsigned char *_s13CarAssetUtils8CAUAssetO11ClosureMaskV5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2498219F0);
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

ValueMetadata *type metadata accessor for CAUAsset.Cabin.CodingKeys()
{
  return &type metadata for CAUAsset.Cabin.CodingKeys;
}

ValueMetadata *type metadata accessor for CAUAsset.VehicleLogo.CodingKeys()
{
  return &type metadata for CAUAsset.VehicleLogo.CodingKeys;
}

uint64_t _s13CarAssetUtils8CAUAssetO11FeatureFlagV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s13CarAssetUtils8CAUAssetO11FeatureFlagV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x249821B24);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUAsset.AudioBrandLogo.CodingKeys()
{
  return &type metadata for CAUAsset.AudioBrandLogo.CodingKeys;
}

unsigned char *_s13CarAssetUtils8CAUAssetO4SeatV5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249821C28);
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

ValueMetadata *type metadata accessor for CAUAsset.Seat.CodingKeys()
{
  return &type metadata for CAUAsset.Seat.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CAUAsset.ClosureMask.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249821D2CLL);
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

ValueMetadata *type metadata accessor for CAUAsset.ClosureMask.CodingKeys()
{
  return &type metadata for CAUAsset.ClosureMask.CodingKeys;
}

unint64_t sub_249821D68()
{
  unint64_t result = qword_2696D0EA8;
  if (!qword_2696D0EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EA8);
  }
  return result;
}

unint64_t sub_249821DC0()
{
  unint64_t result = qword_2696D0EB0;
  if (!qword_2696D0EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EB0);
  }
  return result;
}

unint64_t sub_249821E18()
{
  unint64_t result = qword_2696D0EB8;
  if (!qword_2696D0EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EB8);
  }
  return result;
}

unint64_t sub_249821E70()
{
  unint64_t result = qword_2696D0EC0;
  if (!qword_2696D0EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EC0);
  }
  return result;
}

unint64_t sub_249821EC8()
{
  unint64_t result = qword_2696D0EC8;
  if (!qword_2696D0EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EC8);
  }
  return result;
}

unint64_t sub_249821F20()
{
  unint64_t result = qword_2696D0ED0;
  if (!qword_2696D0ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0ED0);
  }
  return result;
}

unint64_t sub_249821F78()
{
  unint64_t result = qword_2696D0ED8;
  if (!qword_2696D0ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0ED8);
  }
  return result;
}

unint64_t sub_249821FD0()
{
  unint64_t result = qword_2696D0EE0;
  if (!qword_2696D0EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EE0);
  }
  return result;
}

unint64_t sub_249822028()
{
  unint64_t result = qword_2696D0EE8;
  if (!qword_2696D0EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EE8);
  }
  return result;
}

unint64_t sub_249822080()
{
  unint64_t result = qword_2696D0EF0;
  if (!qword_2696D0EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EF0);
  }
  return result;
}

unint64_t sub_2498220D8()
{
  unint64_t result = qword_2696D0EF8;
  if (!qword_2696D0EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0EF8);
  }
  return result;
}

unint64_t sub_249822130()
{
  unint64_t result = qword_2696D0F00;
  if (!qword_2696D0F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F00);
  }
  return result;
}

unint64_t sub_249822188()
{
  unint64_t result = qword_2696D0F08;
  if (!qword_2696D0F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F08);
  }
  return result;
}

unint64_t sub_2498221E0()
{
  unint64_t result = qword_2696D0F10;
  if (!qword_2696D0F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F10);
  }
  return result;
}

unint64_t sub_249822238()
{
  unint64_t result = qword_2696D0F18;
  if (!qword_2696D0F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F18);
  }
  return result;
}

unint64_t sub_249822290()
{
  unint64_t result = qword_2696D0F20;
  if (!qword_2696D0F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F20);
  }
  return result;
}

unint64_t sub_2498222E8()
{
  unint64_t result = qword_2696D0F28;
  if (!qword_2696D0F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F28);
  }
  return result;
}

unint64_t sub_249822340()
{
  unint64_t result = qword_2696D0F30;
  if (!qword_2696D0F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F30);
  }
  return result;
}

unint64_t sub_249822398()
{
  unint64_t result = qword_2696D0F38;
  if (!qword_2696D0F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F38);
  }
  return result;
}

unint64_t sub_2498223F0()
{
  unint64_t result = qword_2696D0F40;
  if (!qword_2696D0F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F40);
  }
  return result;
}

unint64_t sub_249822448()
{
  unint64_t result = qword_2696D0F48;
  if (!qword_2696D0F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F48);
  }
  return result;
}

unint64_t sub_2498224A0()
{
  unint64_t result = qword_2696D0F50;
  if (!qword_2696D0F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F50);
  }
  return result;
}

unint64_t sub_2498224F8()
{
  unint64_t result = qword_2696D0F58;
  if (!qword_2696D0F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F58);
  }
  return result;
}

unint64_t sub_249822550()
{
  unint64_t result = qword_2696D0F60;
  if (!qword_2696D0F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F60);
  }
  return result;
}

unint64_t sub_2498225A8()
{
  unint64_t result = qword_2696D0F68;
  if (!qword_2696D0F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F68);
  }
  return result;
}

unint64_t sub_249822600()
{
  unint64_t result = qword_2696D0F70;
  if (!qword_2696D0F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F70);
  }
  return result;
}

unint64_t sub_249822658()
{
  unint64_t result = qword_2696D0F78;
  if (!qword_2696D0F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F78);
  }
  return result;
}

unint64_t sub_2498226B0()
{
  unint64_t result = qword_2696D0F80;
  if (!qword_2696D0F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F80);
  }
  return result;
}

unint64_t sub_249822708()
{
  unint64_t result = qword_2696D0F88;
  if (!qword_2696D0F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F88);
  }
  return result;
}

unint64_t sub_249822760()
{
  unint64_t result = qword_2696D0F90;
  if (!qword_2696D0F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F90);
  }
  return result;
}

unint64_t sub_2498227B8()
{
  unint64_t result = qword_2696D0F98;
  if (!qword_2696D0F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0F98);
  }
  return result;
}

unint64_t sub_249822810()
{
  unint64_t result = qword_2696D0FA0;
  if (!qword_2696D0FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FA0);
  }
  return result;
}

unint64_t sub_249822868()
{
  unint64_t result = qword_2696D0FA8;
  if (!qword_2696D0FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FA8);
  }
  return result;
}

unint64_t sub_2498228C0()
{
  unint64_t result = qword_2696D0FB0;
  if (!qword_2696D0FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FB0);
  }
  return result;
}

unint64_t sub_249822918()
{
  unint64_t result = qword_2696D0FB8;
  if (!qword_2696D0FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FB8);
  }
  return result;
}

unint64_t sub_249822970()
{
  unint64_t result = qword_2696D0FC0;
  if (!qword_2696D0FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FC0);
  }
  return result;
}

uint64_t sub_2498229C4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000249832C70 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_249822B08(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000249832C70 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4448527369 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_249822CA0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4448527369 && a2 == 0xE500000000000000;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249822D84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_249822E0C()
{
  return 0x656D616E656C6966;
}

unint64_t sub_249822E24()
{
  unint64_t result = qword_2696D0FC8;
  if (!qword_2696D0FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FC8);
  }
  return result;
}

unint64_t sub_249822E78()
{
  unint64_t result = qword_2696D0FD0;
  if (!qword_2696D0FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FD0);
  }
  return result;
}

uint64_t sub_249822F44()
{
  return sub_24982E848();
}

uint64_t sub_249823040()
{
  return sub_24982E848();
}

uint64_t sub_2498230B8()
{
  return sub_24982E848();
}

uint64_t sub_249823124()
{
  return sub_24982E848();
}

uint64_t sub_249823190()
{
  return sub_24982E848();
}

uint64_t sub_249823288()
{
  return sub_24982E848();
}

uint64_t sub_2498232F0()
{
  return sub_24982E848();
}

uint64_t sub_249823364()
{
  return sub_24982E848();
}

void CAUPhysicalControlBarsButtonLayoutInfo.edge.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.startingPoint.getter()
{
  return *(unsigned int *)(v0 + 4);
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.length.getter()
{
  return *(unsigned int *)(v0 + 8);
}

unsigned char *CAUPhysicalControlBarsButtonLayoutInfo.init(edge:startingPoint:length:)@<X0>(unsigned char *result@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  *(unsigned char *)a4 = *result;
  *(_DWORD *)(a4 + 4) = a2;
  *(_DWORD *)(a4 + 8) = a3;
  return result;
}

uint64_t sub_2498233F8(char a1)
{
  return *(void *)&aEdge_0[8 * a1];
}

uint64_t sub_249823418()
{
  return sub_2498233F8(*v0);
}

uint64_t sub_249823420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24982406C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_249823448(uint64_t a1)
{
  unint64_t v2 = sub_249823678();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249823484(uint64_t a1)
{
  unint64_t v2 = sub_249823678();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0FD8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  v10[6] = *((_DWORD *)v1 + 1);
  v10[3] = *((_DWORD *)v1 + 2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249823678();
  sub_24982E868();
  char v14 = v8;
  char v13 = 0;
  sub_2498236CC();
  sub_24982E788();
  if (!v2)
  {
    char v12 = 1;
    sub_24982E798();
    char v11 = 2;
    sub_24982E798();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_249823678()
{
  unint64_t result = qword_2696D0FE0;
  if (!qword_2696D0FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FE0);
  }
  return result;
}

unint64_t sub_2498236CC()
{
  unint64_t result = qword_2696D0FE8;
  if (!qword_2696D0FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FE8);
  }
  return result;
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D0FF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249823678();
  sub_24982E858();
  if (!v2)
  {
    char v16 = 0;
    sub_249823900();
    sub_24982E728();
    char v9 = v17;
    char v15 = 1;
    int v11 = sub_24982E738();
    char v14 = 2;
    int v12 = sub_24982E738();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(_DWORD *)(a2 + 4) = v11;
    *(_DWORD *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_249823900()
{
  unint64_t result = qword_2696D0FF8;
  if (!qword_2696D0FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D0FF8);
  }
  return result;
}

uint64_t sub_249823954@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CAUPhysicalControlBarsButtonLayoutInfo.init(from:)(a1, a2);
}

uint64_t sub_24982396C(void *a1)
{
  return CAUPhysicalControlBarsButtonLayoutInfo.encode(to:)(a1);
}

CarAssetUtils::CAUEdge_optional __swiftcall CAUEdge.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24982E6C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static CAUEdge.allCases.getter()
{
  return &unk_26FD95EE0;
}

uint64_t CAUEdge.rawValue.getter()
{
  return qword_2498317D8[*v0];
}

uint64_t sub_249823A10(char *a1, char *a2)
{
  return sub_24982540C(*a1, *a2);
}

unint64_t sub_249823A20()
{
  unint64_t result = qword_2696D1000;
  if (!qword_2696D1000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1000);
  }
  return result;
}

uint64_t sub_249823A74()
{
  return sub_249823124();
}

uint64_t sub_249823A7C()
{
  return sub_249824384();
}

uint64_t sub_249823A84()
{
  return sub_249823288();
}

CarAssetUtils::CAUEdge_optional sub_249823A8C(Swift::String *a1)
{
  return CAUEdge.init(rawValue:)(*a1);
}

uint64_t sub_249823A98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CAUEdge.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_249823AC0()
{
  return sub_24982E548();
}

uint64_t sub_249823B20()
{
  return sub_24982E538();
}

uint64_t sub_249823B70(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2498241B4();

  return MEMORY[0x270F9DB68](a1, a2, v4);
}

uint64_t sub_249823BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_2498241B4();

  return MEMORY[0x270F9DB70](a1, a4, a2, a5, v10, a3);
}

unint64_t sub_249823C44()
{
  unint64_t result = qword_2696D1008;
  if (!qword_2696D1008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1008);
  }
  return result;
}

void sub_249823CA0(void *a1@<X8>)
{
  *a1 = &unk_26FD95F08;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && a1[12]) {
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

uint64_t storeEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 12) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 12) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo()
{
  return &type metadata for CAUPhysicalControlBarsButtonLayoutInfo;
}

unsigned char *storeEnumTagSinglePayload for CAUEdge(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249823E28);
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

ValueMetadata *type metadata accessor for CAUEdge()
{
  return &type metadata for CAUEdge;
}

unsigned char *storeEnumTagSinglePayload for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249823F2CLL);
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

ValueMetadata *type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys()
{
  return &type metadata for CAUPhysicalControlBarsButtonLayoutInfo.CodingKeys;
}

unint64_t sub_249823F68()
{
  unint64_t result = qword_2696D1018;
  if (!qword_2696D1018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1018);
  }
  return result;
}

unint64_t sub_249823FC0()
{
  unint64_t result = qword_2696D1020;
  if (!qword_2696D1020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1020);
  }
  return result;
}

unint64_t sub_249824018()
{
  unint64_t result = qword_2696D1028;
  if (!qword_2696D1028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1028);
  }
  return result;
}

uint64_t sub_24982406C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701274725 && a2 == 0xE400000000000000;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E697472617473 && a2 == 0xED0000746E696F50 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874676E656CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_2498241B4()
{
  unint64_t result = qword_2696D1030;
  if (!qword_2696D1030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1030);
  }
  return result;
}

uint64_t JSONEncoder.encode<A>(_:toFile:)()
{
  uint64_t result = sub_24982E2D8();
  if (!v0)
  {
    uint64_t v3 = result;
    unint64_t v4 = v2;
    sub_24982E3B8();
    return sub_249824278(v3, v4);
  }
  return result;
}

uint64_t sub_249824278(uint64_t a1, unint64_t a2)
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

uint64_t sub_2498242D0()
{
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_249824324()
{
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_249824384()
{
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2498243D8()
{
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2498244C0()
{
  sub_24982E4D8();

  return swift_bridgeObjectRelease();
}

CarAssetUtils::CAUVehicleTrait_optional __swiftcall CAUVehicleTrait.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_24982E6C8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t CAUVehicleTrait.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
    case 3:
      unint64_t result = 0x726F697265746E69;
      break;
    case 4:
      unint64_t result = 0x6172426F69647561;
      break;
    case 5:
    case 6:
      unint64_t result = 0x4C656C6369686576;
      break;
    case 7:
      return result;
    case 8:
      unint64_t result = 0xD000000000000019;
      break;
    case 9:
      unint64_t result = 0x4665727574616566;
      break;
    default:
      unint64_t result = 0x726F697265747865;
      break;
  }
  return result;
}

uint64_t sub_249824814(unsigned __int8 *a1, char *a2)
{
  return sub_249825658(*a1, *a2);
}

unint64_t sub_249824824()
{
  unint64_t result = qword_2696D1038;
  if (!qword_2696D1038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1038);
  }
  return result;
}

uint64_t sub_249824878()
{
  return sub_24982E848();
}

uint64_t sub_2498248C0()
{
  return sub_2498244C0();
}

uint64_t sub_2498248C8()
{
  return sub_24982E848();
}

CarAssetUtils::CAUVehicleTrait_optional sub_24982490C(Swift::String *a1)
{
  return CAUVehicleTrait.init(rawValue:)(*a1);
}

unint64_t sub_249824918@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CAUVehicleTrait.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUVehicleTrait(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUVehicleTrait(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x249824A9CLL);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUVehicleTrait()
{
  return &type metadata for CAUVehicleTrait;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CAUResource(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
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
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 14) | (4 * (HIBYTE(*a1) & 0x3C | (*a1 >> 6)))) ^ 0xFF;
  if (v6 >= 0xFD) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for CAUResource(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
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
        JUMPOUT(0x249824C6CLL);
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
          *(_WORD *)unint64_t result = (((-(__int16)a2 & 0xF0) << 6) - ((_WORD)a2 << 14)) & 0xFF3F | (((-a2 >> 2) & 3) << 6);
        break;
    }
  }
  return result;
}

uint64_t sub_249824C94(unsigned __int16 *a1)
{
  unsigned int v1 = *a1;
  int v2 = (__int16)v1;
  unsigned int v3 = v1 >> 14;
  unsigned int v4 = (v1 & 0x3F | (((v1 >> 8) & 3) << 6)) + 2;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return v4;
  }
}

_WORD *sub_249824CBC(_WORD *result)
{
  *result &= 0x3FFFu;
  return result;
}

_WORD *sub_249824CCC(_WORD *result, unsigned int a2)
{
  if (a2 < 2) {
    *unint64_t result = *result & 0x33F | ((_WORD)a2 << 14);
  }
  else {
    *unint64_t result = (4 * (a2 - 2)) & 0x300 | (a2 - 2) & 0x3F | 0x8000;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUResource()
{
  return &type metadata for CAUResource;
}

BOOL static CAUError.AssetLibrary.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CAUError.AssetLibrary.hash(into:)()
{
  return sub_24982E838();
}

uint64_t CAUError.AssetLibrary.hashValue.getter()
{
  return sub_24982E848();
}

unint64_t sub_249824DA4()
{
  unint64_t result = qword_2696D1040;
  if (!qword_2696D1040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1040);
  }
  return result;
}

unint64_t sub_249824E20()
{
  unint64_t result = qword_2696D1048;
  if (!qword_2696D1048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1048);
  }
  return result;
}

id sub_249824E74(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 3:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
      unint64_t result = result;
      break;
    case 4:
      unint64_t result = a2;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for CAUError(uint64_t a1)
{
}

void sub_249824EE8(void *a1, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      break;
    case 2:

      break;
    case 4:

      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for CAUError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_249824E74(*(id *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for CAUError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_249824E74(*(id *)a2, v4, v5, v6);
  BOOL v7 = *(void **)a1;
  int v8 = *(void **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_249824EE8(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CAUError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  BOOL v7 = *(void **)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_249824EE8(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24982510C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_249825124(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CAUError()
{
  return &type metadata for CAUError;
}

unsigned char *storeEnumTagSinglePayload for CAUError.AssetLibrary(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24982521CLL);
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

ValueMetadata *type metadata accessor for CAUError.AssetLibrary()
{
  return &type metadata for CAUError.AssetLibrary;
}

uint64_t sub_249825254()
{
  uint64_t v0 = CAUVehicleLayoutKey.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == CAUVehicleLayoutKey.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24982E7B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2498252EC(char a1, char a2)
{
  if (*(void *)&aSelectedheaton_2[8 * a1] == *(void *)&aSelectedheaton_2[8 * a2]
    && qword_249831D50[a1] == qword_249831D50[a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24982E7B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_249825374(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6465736F6C63;
  }
  else {
    uint64_t v3 = 1852141679;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6465736F6C63;
  }
  else {
    uint64_t v5 = 1852141679;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24982E7B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24982540C(char a1, char a2)
{
  if (qword_249831CF0[a1] == qword_249831CF0[a2] && qword_249831D10[a1] == qword_249831D10[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_24982E7B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_249825494(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000002498320E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 7233894;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E614674616573;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6B6E694C70656564;
      break;
    default:
      unint64_t v3 = 0xEB00000000657275;
      unint64_t v5 = 0x74617265706D6574;
      break;
  }
  unint64_t v6 = 0x80000002498320E0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 7233894) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x6E614674616573;
      goto LABEL_12;
    case 3:
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x6B6E694C70656564) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xEB00000000657275;
      if (v5 != 0x74617265706D6574) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24982E7B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_249825658(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000249832160;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      uint64_t v7 = 0x656C797453;
      goto LABEL_7;
    case 2:
      uint64_t v6 = 0x726F6C6F43;
      goto LABEL_5;
    case 3:
      uint64_t v7 = 0x726F6C6F43;
LABEL_7:
      unint64_t v3 = v7 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      unint64_t v5 = 0x726F697265746E69;
      break;
    case 4:
      unint64_t v3 = 0xEE006F676F4C646ELL;
      unint64_t v5 = 0x6172426F69647561;
      break;
    case 5:
      unint64_t v3 = 0xEB000000006F676FLL;
      goto LABEL_11;
    case 6:
      unint64_t v3 = 0xED000074756F7961;
LABEL_11:
      unint64_t v5 = 0x4C656C6369686576;
      break;
    case 7:
      break;
    case 8:
      unint64_t v5 = 0xD000000000000019;
      unint64_t v3 = 0x8000000249832180;
      break;
    case 9:
      unint64_t v3 = 0xEB0000000067616CLL;
      unint64_t v5 = 0x4665727574616566;
      break;
    default:
      uint64_t v6 = 0x656C797453;
LABEL_5:
      unint64_t v3 = v6 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      unint64_t v5 = 0x726F697265747865;
      break;
  }
  unint64_t v8 = 0x8000000249832160;
  switch(a2)
  {
    case 1:
      uint64_t v10 = 0x656C797453;
      goto LABEL_21;
    case 2:
      uint64_t v9 = 0x726F6C6F43;
      goto LABEL_18;
    case 3:
      uint64_t v10 = 0x726F6C6F43;
LABEL_21:
      unint64_t v8 = v10 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      if (v5 != 0x726F697265746E69) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 4:
      unint64_t v8 = 0xEE006F676F4C646ELL;
      if (v5 != 0x6172426F69647561) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 5:
      unint64_t v8 = 0xEB000000006F676FLL;
      goto LABEL_27;
    case 6:
      unint64_t v8 = 0xED000074756F7961;
LABEL_27:
      if (v5 != 0x4C656C6369686576) {
        goto LABEL_34;
      }
      goto LABEL_31;
    case 7:
      goto LABEL_30;
    case 8:
      unint64_t v2 = 0xD000000000000019;
      unint64_t v8 = 0x8000000249832180;
LABEL_30:
      if (v5 == v2) {
        goto LABEL_31;
      }
      goto LABEL_34;
    case 9:
      unint64_t v8 = 0xEB0000000067616CLL;
      if (v5 != 0x4665727574616566) {
        goto LABEL_34;
      }
      goto LABEL_31;
    default:
      uint64_t v9 = 0x656C797453;
LABEL_18:
      unint64_t v8 = v9 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      if (v5 != 0x726F697265747865) {
        goto LABEL_34;
      }
LABEL_31:
      if (v3 == v8) {
        char v11 = 1;
      }
      else {
LABEL_34:
      }
        char v11 = sub_24982E7B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

__n128 CAUManifest.init(cabin:topDownInterior:topDownExteriorClosuresOverlay:topDownExterior:seats:closures:audioBrandLogo:vehicleLogo:vehicleLayouts:wallpaperOverlays:physicalControlBarsLayouts:featureFlags:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  __n128 result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t sub_2498259B0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, unsigned __int8 *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v8 = *(void *)(v6 + 32);
  if (!*(void *)(v8 + 16)) {
    goto LABEL_33;
  }
  uint64_t v11 = result;
  uint64_t v12 = *a4;
  uint64_t v13 = *a5;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_249815AD4(v11, a2);
  if ((v15 & 1) == 0)
  {
    __n128 result = swift_bridgeObjectRelease();
LABEL_33:
    *a6 = 0;
    a6[1] = 0;
    a6[2] = 0;
    return result;
  }
  char v44 = a3;
  uint64_t v16 = *(void *)(*(void *)(v8 + 56) + 8 * v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v45 = a6;
  if (v17)
  {
    uint64_t v46 = v13;
    uint64_t v18 = MEMORY[0x263F8EE78];
    char v19 = (char *)(v16 + 32);
    while (1)
    {
      char v20 = *v19;
      uint64_t v21 = v19[1];
      char v48 = v19[2];
      uint64_t v22 = *((void *)v19 + 2);
      uint64_t v47 = *((void *)v19 + 1);
      uint64_t v23 = v12;
      uint64_t v24 = CAUVehicleLayoutKey.rawValue.getter();
      uint64_t v26 = v25;
      if (v24 == CAUVehicleLayoutKey.rawValue.getter() && v26 == v27)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v28 = sub_24982E7B8();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) == 0) {
          goto LABEL_5;
        }
      }
      if (*(void *)&aSelectedheaton_2[8 * v21] == *(void *)&aSelectedheaton_2[8 * v46]
        && qword_249831D50[v21] == qword_249831D50[v46])
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_18:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_249829934(0, *(void *)(v18 + 16) + 1, 1);
        }
        unint64_t v32 = *(void *)(v18 + 16);
        unint64_t v31 = *(void *)(v18 + 24);
        if (v32 >= v31 >> 1) {
          sub_249829934(v31 > 1, v32 + 1, 1);
        }
        *(void *)(v18 + 16) = v32 + 1;
        uint64_t v33 = v18 + 24 * v32;
        *(unsigned char *)(v33 + 32) = v20;
        *(unsigned char *)(v33 + 33) = v21;
        *(unsigned char *)(v33 + 34) = v48;
        *(void *)(v33 + 40) = v47;
        *(void *)(v33 + 48) = v22;
        goto LABEL_6;
      }
      char v30 = sub_24982E7B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v30) {
        goto LABEL_18;
      }
LABEL_5:
      swift_bridgeObjectRelease();
LABEL_6:
      uint64_t v12 = v23;
      v19 += 24;
      if (!--v17) {
        goto LABEL_25;
      }
    }
  }
  uint64_t v18 = MEMORY[0x263F8EE78];
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void *)(v18 + 16);
  if (!v34)
  {
    __n128 result = swift_release();
    a6 = v45;
    goto LABEL_33;
  }
  for (unint64_t i = (unsigned __int16 *)(v18 + 32); ; i += 12)
  {
    int v36 = *((unsigned __int8 *)i + 2);
    if (v36 == (v44 & 1)) {
      break;
    }
    if (!--v34)
    {
      char v37 = *(unsigned char *)(v18 + 34);
      uint64_t v39 = *(void *)(v18 + 40);
      uint64_t v38 = *(void *)(v18 + 48);
      *(_WORD *)uint64_t v45 = *(_WORD *)(v18 + 32);
      *((unsigned char *)v45 + 2) = v37;
      v45[1] = v39;
      v45[2] = v38;
      swift_bridgeObjectRetain();
      return swift_release();
    }
  }
  uint64_t v41 = *((void *)i + 1);
  uint64_t v40 = *((void *)i + 2);
  uint64_t v42 = *i;
  swift_bridgeObjectRetain();
  __n128 result = swift_release();
  uint64_t v43 = 0x10000;
  if (!v36) {
    uint64_t v43 = 0;
  }
  *uint64_t v45 = v42 | v43;
  v45[1] = v41;
  v45[2] = v40;
  return result;
}

uint64_t sub_249825D04@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7 = *(void *)(v5 + 40);
  if (!*(void *)(v7 + 16)) {
    goto LABEL_102;
  }
  uint64_t v9 = result;
  uint64_t v10 = *a3;
  int v11 = *a4;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_249815AD4(v9, a2);
  if ((v13 & 1) == 0
    || (uint64_t v14 = *(void *)(*(void *)(v7 + 56) + 8 * v12),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (uint64_t v15 = *(void *)(v14 + 16)) == 0))
  {
    __n128 result = swift_bridgeObjectRelease();
LABEL_102:
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    return result;
  }
  uint64_t v39 = a5;
  uint64_t v16 = (unsigned __int8 *)(v14 + 32);
  swift_bridgeObjectRetain();
  if (v11) {
    uint64_t v17 = 0x6465736F6C63;
  }
  else {
    uint64_t v17 = 1852141679;
  }
  uint64_t v41 = v17;
  if (v11) {
    unint64_t v18 = 0xE600000000000000;
  }
  else {
    unint64_t v18 = 0xE400000000000000;
  }
  while (1)
  {
    uint64_t v20 = *v16;
    int v42 = v16[1];
    uint64_t v21 = *((void *)v16 + 2);
    uint64_t v40 = *((void *)v16 + 1);
    v16 += 24;
    unint64_t v22 = 0x80000002498321C0;
    uint64_t v23 = 0xD000000000000010;
    switch(v20)
    {
      case 1:
        break;
      case 2:
        unsigned int v25 = 1919905636;
        goto LABEL_43;
      case 3:
        unsigned int v26 = 1919905636;
        goto LABEL_45;
      case 4:
        unint64_t v22 = 0xE500000000000000;
        uint64_t v23 = 0x6B6E757266;
        break;
      case 5:
        unint64_t v22 = 0xEE0074726F506567;
        uint64_t v23 = 0x726168436C657566;
        break;
      case 6:
        uint64_t v23 = 0xD000000000000019;
        uint64_t v27 = "fuelChargePort_front_left";
        goto LABEL_48;
      case 7:
        uint64_t v23 = 0xD00000000000001ALL;
        uint64_t v27 = "fuelChargePort_front_right";
        goto LABEL_48;
      case 8:
        uint64_t v23 = 0xD000000000000018;
        uint64_t v27 = "fuelChargePort_rear_left";
        goto LABEL_48;
      case 9:
        uint64_t v23 = 0xD000000000000019;
        uint64_t v27 = "fuelChargePort_rear_right";
        goto LABEL_48;
      case 10:
        unint64_t v22 = 0xE400000000000000;
        uint64_t v23 = 1685024616;
        break;
      case 11:
        unint64_t v22 = 0xEF65646953746665;
        uint64_t v23 = 0x6C5F726F7272696DLL;
        break;
      case 12:
        uint64_t v27 = "mirror_rightSide";
        goto LABEL_48;
      case 13:
        unint64_t v22 = 0xEC00000073656469;
        uint64_t v23 = 0x735F726F7272696DLL;
        break;
      case 14:
        uint64_t v23 = 0x646E325F74616573;
        goto LABEL_31;
      case 15:
        uint64_t v27 = "seat_2ndRow_left";
        goto LABEL_48;
      case 16:
        uint64_t v23 = 0xD000000000000012;
        uint64_t v27 = "seat_2ndRow_middle";
        goto LABEL_48;
      case 17:
        uint64_t v23 = 0xD000000000000011;
        uint64_t v27 = "seat_2ndRow_right";
        goto LABEL_48;
      case 18:
        uint64_t v23 = 0x6472335F74616573;
LABEL_31:
        unint64_t v22 = 0xEB00000000776F52;
        break;
      case 19:
        uint64_t v27 = "seat_3rdRow_left";
        goto LABEL_48;
      case 20:
        uint64_t v23 = 0xD000000000000012;
        uint64_t v27 = "seat_3rdRow_middle";
        goto LABEL_48;
      case 21:
        uint64_t v23 = 0xD000000000000011;
        uint64_t v27 = "seat_3rdRow_right";
        goto LABEL_48;
      case 22:
        unint64_t v22 = 0xEA0000000000746ELL;
        uint64_t v23 = 0x6F72665F74616573;
        break;
      case 23:
        unsigned int v24 = 1952540019;
        goto LABEL_40;
      case 24:
        uint64_t v23 = 0xD000000000000011;
        uint64_t v27 = "seat_front_middle";
        goto LABEL_48;
      case 25:
        uint64_t v27 = "seat_front_right";
        goto LABEL_48;
      case 26:
        unsigned int v24 = 1701996916;
        goto LABEL_40;
      case 27:
        uint64_t v27 = "tire_front_right";
        goto LABEL_48;
      case 28:
        unsigned int v25 = 1701996916;
LABEL_43:
        uint64_t v23 = v25 | 0x6165725F00000000;
        unint64_t v22 = 0xEE007466656C5F72;
        break;
      case 29:
        unsigned int v26 = 1701996916;
LABEL_45:
        uint64_t v23 = v26 | 0x6165725F00000000;
        unint64_t v22 = 0xEF74686769725F72;
        break;
      case 30:
        uint64_t v23 = 0x6B6E757274;
        unint64_t v22 = 0xE500000000000000;
        break;
      case 31:
        uint64_t v27 = "windshield_front";
LABEL_48:
        unint64_t v22 = (unint64_t)(v27 - 32) | 0x8000000000000000;
        break;
      case 32:
        unint64_t v22 = 0xEF726165725F646CLL;
        uint64_t v23 = 0x65696873646E6977;
        break;
      default:
        unsigned int v24 = 1919905636;
LABEL_40:
        uint64_t v23 = v24 | 0x6F72665F00000000;
        unint64_t v22 = 0xEF7466656C5F746ELL;
        break;
    }
    unint64_t v28 = 0x80000002498321C0;
    uint64_t v29 = 0xD000000000000010;
    switch(v10)
    {
      case 1:
        break;
      case 2:
        unsigned int v31 = 1919905636;
        goto LABEL_81;
      case 3:
        unsigned int v32 = 1919905636;
        goto LABEL_83;
      case 4:
        unint64_t v28 = 0xE500000000000000;
        uint64_t v29 = 0x6B6E757266;
        break;
      case 5:
        unint64_t v28 = 0xEE0074726F506567;
        uint64_t v29 = 0x726168436C657566;
        break;
      case 6:
        uint64_t v29 = 0xD000000000000019;
        uint64_t v33 = "fuelChargePort_front_left";
        goto LABEL_86;
      case 7:
        uint64_t v29 = 0xD00000000000001ALL;
        uint64_t v33 = "fuelChargePort_front_right";
        goto LABEL_86;
      case 8:
        uint64_t v29 = 0xD000000000000018;
        uint64_t v33 = "fuelChargePort_rear_left";
        goto LABEL_86;
      case 9:
        uint64_t v29 = 0xD000000000000019;
        uint64_t v33 = "fuelChargePort_rear_right";
        goto LABEL_86;
      case 10:
        unint64_t v28 = 0xE400000000000000;
        uint64_t v29 = 1685024616;
        break;
      case 11:
        unint64_t v28 = 0xEF65646953746665;
        uint64_t v29 = 0x6C5F726F7272696DLL;
        break;
      case 12:
        uint64_t v33 = "mirror_rightSide";
        goto LABEL_86;
      case 13:
        unint64_t v28 = 0xEC00000073656469;
        uint64_t v29 = 0x735F726F7272696DLL;
        break;
      case 14:
        uint64_t v29 = 0x646E325F74616573;
        goto LABEL_69;
      case 15:
        uint64_t v33 = "seat_2ndRow_left";
        goto LABEL_86;
      case 16:
        uint64_t v29 = 0xD000000000000012;
        uint64_t v33 = "seat_2ndRow_middle";
        goto LABEL_86;
      case 17:
        uint64_t v29 = 0xD000000000000011;
        uint64_t v33 = "seat_2ndRow_right";
        goto LABEL_86;
      case 18:
        uint64_t v29 = 0x6472335F74616573;
LABEL_69:
        unint64_t v28 = 0xEB00000000776F52;
        break;
      case 19:
        uint64_t v33 = "seat_3rdRow_left";
        goto LABEL_86;
      case 20:
        uint64_t v29 = 0xD000000000000012;
        uint64_t v33 = "seat_3rdRow_middle";
        goto LABEL_86;
      case 21:
        uint64_t v29 = 0xD000000000000011;
        uint64_t v33 = "seat_3rdRow_right";
        goto LABEL_86;
      case 22:
        unint64_t v28 = 0xEA0000000000746ELL;
        uint64_t v29 = 0x6F72665F74616573;
        break;
      case 23:
        unsigned int v30 = 1952540019;
        goto LABEL_78;
      case 24:
        uint64_t v29 = 0xD000000000000011;
        uint64_t v33 = "seat_front_middle";
        goto LABEL_86;
      case 25:
        uint64_t v33 = "seat_front_right";
        goto LABEL_86;
      case 26:
        unsigned int v30 = 1701996916;
        goto LABEL_78;
      case 27:
        uint64_t v33 = "tire_front_right";
        goto LABEL_86;
      case 28:
        unsigned int v31 = 1701996916;
LABEL_81:
        uint64_t v29 = v31 | 0x6165725F00000000;
        unint64_t v28 = 0xEE007466656C5F72;
        break;
      case 29:
        unsigned int v32 = 1701996916;
LABEL_83:
        uint64_t v29 = v32 | 0x6165725F00000000;
        unint64_t v28 = 0xEF74686769725F72;
        break;
      case 30:
        uint64_t v29 = 0x6B6E757274;
        unint64_t v28 = 0xE500000000000000;
        break;
      case 31:
        uint64_t v33 = "windshield_front";
LABEL_86:
        unint64_t v28 = (unint64_t)(v33 - 32) | 0x8000000000000000;
        break;
      case 32:
        unint64_t v28 = 0xEF726165725F646CLL;
        uint64_t v29 = 0x65696873646E6977;
        break;
      default:
        unsigned int v30 = 1919905636;
LABEL_78:
        uint64_t v29 = v30 | 0x6F72665F00000000;
        unint64_t v28 = 0xEF7466656C5F746ELL;
        break;
    }
    uint64_t v34 = v10;
    if (v23 == v29 && v22 == v28)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v35 = sub_24982E7B8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) == 0) {
        goto LABEL_11;
      }
    }
    if (v42) {
      uint64_t v36 = 0x6465736F6C63;
    }
    else {
      uint64_t v36 = 1852141679;
    }
    if (v42) {
      unint64_t v37 = 0xE600000000000000;
    }
    else {
      unint64_t v37 = 0xE400000000000000;
    }
    if (v36 == v41 && v37 == v18)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      __n128 result = swift_bridgeObjectRelease();
      goto LABEL_105;
    }
    char v19 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    --v15;
    uint64_t v10 = v34;
    if (!v15)
    {
      __n128 result = swift_bridgeObjectRelease_n();
      a5 = v39;
      goto LABEL_102;
    }
  }
  __n128 result = swift_bridgeObjectRelease_n();
LABEL_105:
  uint64_t v38 = 256;
  if (!v42) {
    uint64_t v38 = 0;
  }
  *uint64_t v39 = v38 | v20;
  v39[1] = v40;
  v39[2] = v21;
  return result;
}

uint64_t sub_249826680@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_16;
  }
  uint64_t v9 = result;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_249815AD4(v9, a2);
  if ((v11 & 1) == 0
    || (uint64_t v12 = *(void *)(*(void *)(v6 + 56) + 8 * v10),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (uint64_t v13 = *(void *)(v12 + 16)) == 0))
  {
LABEL_7:
    __n128 result = swift_bridgeObjectRelease();
    if (*(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_249815AD4(v9, a2);
      if (v18)
      {
        uint64_t v19 = *(void *)(*(void *)(v6 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(void *)(v19 + 16))
        {
          uint64_t v21 = *(void *)(v19 + 40);
          uint64_t v20 = *(void *)(v19 + 48);
          *(unsigned char *)a4 = *(unsigned char *)(v19 + 32);
          *(void *)(a4 + 8) = v21;
          *(void *)(a4 + 16) = v20;
          swift_bridgeObjectRetain();
          return swift_bridgeObjectRelease();
        }
      }
      __n128 result = swift_bridgeObjectRelease();
    }
LABEL_16:
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    return result;
  }
  uint64_t v14 = (uint64_t *)(v12 + 48);
  int v15 = a3 & 1;
  while (1)
  {
    uint64_t v16 = *((unsigned __int8 *)v14 - 16);
    if (v16 == v15) {
      break;
    }
    v14 += 3;
    if (!--v13) {
      goto LABEL_7;
    }
  }
  uint64_t v23 = *(v14 - 1);
  uint64_t v22 = *v14;
  swift_bridgeObjectRetain();
  __n128 result = swift_bridgeObjectRelease();
  *(void *)a4 = v16;
  *(void *)(a4 + 8) = v23;
  *(void *)(a4 + 16) = v22;
  return result;
}

uint64_t sub_2498267E4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *(void *)(v4 + 8);
  if (!*(void *)(v6 + 16)) {
    goto LABEL_16;
  }
  uint64_t v9 = result;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_249815AD4(v9, a2);
  if ((v11 & 1) == 0
    || (uint64_t v12 = *(void *)(*(void *)(v6 + 56) + 8 * v10),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (uint64_t v13 = *(void *)(v12 + 16)) == 0))
  {
LABEL_7:
    __n128 result = swift_bridgeObjectRelease();
    if (*(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_249815AD4(v9, a2);
      if (v18)
      {
        uint64_t v19 = *(void *)(*(void *)(v6 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (*(void *)(v19 + 16))
        {
          uint64_t v21 = *(void *)(v19 + 40);
          uint64_t v20 = *(void *)(v19 + 48);
          *(unsigned char *)a4 = *(unsigned char *)(v19 + 32);
          *(void *)(a4 + 8) = v21;
          *(void *)(a4 + 16) = v20;
          swift_bridgeObjectRetain();
          return swift_bridgeObjectRelease();
        }
      }
      __n128 result = swift_bridgeObjectRelease();
    }
LABEL_16:
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    return result;
  }
  uint64_t v14 = (uint64_t *)(v12 + 48);
  int v15 = a3 & 1;
  while (1)
  {
    uint64_t v16 = *((unsigned __int8 *)v14 - 16);
    if (v16 == v15) {
      break;
    }
    v14 += 3;
    if (!--v13) {
      goto LABEL_7;
    }
  }
  uint64_t v23 = *(v14 - 1);
  uint64_t v22 = *v14;
  swift_bridgeObjectRetain();
  __n128 result = swift_bridgeObjectRelease();
  *(void *)a4 = v16;
  *(void *)(a4 + 8) = v23;
  *(void *)(a4 + 16) = v22;
  return result;
}

unint64_t sub_249826948(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x496E776F44706F74;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x456E776F44706F74;
      break;
    case 4:
      unint64_t result = 0x7374616573;
      break;
    case 5:
      unint64_t result = 0x73657275736F6C63;
      break;
    case 6:
      unint64_t result = 0x6172426F69647561;
      break;
    case 7:
    case 8:
      unint64_t result = 0x4C656C6369686576;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 11:
      unint64_t result = 0x4665727574616566;
      break;
    default:
      unint64_t result = 0x6E69626163;
      break;
  }
  return result;
}

unint64_t sub_249826AF4()
{
  return sub_249826948(*v0);
}

uint64_t sub_249826AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249829ADC(a1, a2);
  *a3 = result;
  return result;
}

void sub_249826B24(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_249826B30(uint64_t a1)
{
  unint64_t v2 = sub_2498270C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249826B6C(uint64_t a1)
{
  unint64_t v2 = sub_2498270C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUManifest.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1050);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v29 = v1[2];
  uint64_t v30 = v8;
  uint64_t v10 = v1[3];
  uint64_t v27 = v1[4];
  uint64_t v28 = v10;
  uint64_t v11 = v1[5];
  uint64_t v25 = v1[6];
  uint64_t v26 = v11;
  uint64_t v12 = v1[7];
  uint64_t v23 = v1[8];
  uint64_t v24 = v12;
  uint64_t v13 = v1[9];
  uint64_t v21 = v1[10];
  uint64_t v22 = v13;
  uint64_t v20 = v1[11];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2498270C0();
  uint64_t v14 = v4;
  sub_24982E868();
  uint64_t v32 = v9;
  char v31 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1060);
  sub_249827114();
  sub_24982E788();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = v28;
  uint64_t v16 = v29;
  uint64_t v17 = v26;
  uint64_t v18 = v27;
  uint64_t v32 = v30;
  char v31 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1088);
  sub_24982721C();
  sub_24982E788();
  uint64_t v32 = v16;
  char v31 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10B0);
  sub_249827324();
  sub_24982E788();
  uint64_t v32 = v15;
  char v31 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10C8);
  sub_2498273F4();
  sub_24982E788();
  uint64_t v32 = v18;
  char v31 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10E0);
  sub_2498274C4();
  sub_24982E788();
  uint64_t v32 = v17;
  char v31 = 5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1108);
  sub_2498275CC();
  sub_24982E788();
  uint64_t v32 = v25;
  char v31 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1130);
  sub_2498276D4();
  sub_24982E788();
  uint64_t v32 = v24;
  char v31 = 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1148);
  sub_2498277A4();
  sub_24982E788();
  uint64_t v32 = v23;
  char v31 = 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1160);
  sub_249827874();
  sub_24982E788();
  uint64_t v32 = v22;
  char v31 = 9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1178);
  sub_249827944();
  sub_24982E788();
  uint64_t v32 = v21;
  char v31 = 10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1190);
  sub_249827A14();
  sub_24982E748();
  uint64_t v32 = v20;
  char v31 = 11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D11A8);
  sub_249827AE4();
  sub_24982E748();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

unint64_t sub_2498270C0()
{
  unint64_t result = qword_2696D1058;
  if (!qword_2696D1058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1058);
  }
  return result;
}

unint64_t sub_249827114()
{
  unint64_t result = qword_2696D1068;
  if (!qword_2696D1068)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1060);
    sub_249828C8C(&qword_2696D1070, &qword_2696D1078, (void (*)(void))sub_2498271C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1068);
  }
  return result;
}

unint64_t sub_2498271C8()
{
  unint64_t result = qword_2696D1080;
  if (!qword_2696D1080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1080);
  }
  return result;
}

unint64_t sub_24982721C()
{
  unint64_t result = qword_2696D1090;
  if (!qword_2696D1090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1088);
    sub_249828C8C(&qword_2696D1098, &qword_2696D10A0, (void (*)(void))sub_2498272D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1090);
  }
  return result;
}

unint64_t sub_2498272D0()
{
  unint64_t result = qword_2696D10A8;
  if (!qword_2696D10A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10A8);
  }
  return result;
}

unint64_t sub_249827324()
{
  unint64_t result = qword_2696D10B8;
  if (!qword_2696D10B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10B0);
    sub_2498273A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10B8);
  }
  return result;
}

unint64_t sub_2498273A0()
{
  unint64_t result = qword_2696D10C0;
  if (!qword_2696D10C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10C0);
  }
  return result;
}

unint64_t sub_2498273F4()
{
  unint64_t result = qword_2696D10D0;
  if (!qword_2696D10D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10C8);
    sub_249827470();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10D0);
  }
  return result;
}

unint64_t sub_249827470()
{
  unint64_t result = qword_2696D10D8;
  if (!qword_2696D10D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10D8);
  }
  return result;
}

unint64_t sub_2498274C4()
{
  unint64_t result = qword_2696D10E8;
  if (!qword_2696D10E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10E0);
    sub_249828C8C(&qword_2696D10F0, &qword_2696D10F8, (void (*)(void))sub_249827578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D10E8);
  }
  return result;
}

unint64_t sub_249827578()
{
  unint64_t result = qword_2696D1100;
  if (!qword_2696D1100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1100);
  }
  return result;
}

unint64_t sub_2498275CC()
{
  unint64_t result = qword_2696D1110;
  if (!qword_2696D1110)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1108);
    sub_249828C8C(&qword_2696D1118, &qword_2696D1120, (void (*)(void))sub_249827680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1110);
  }
  return result;
}

unint64_t sub_249827680()
{
  unint64_t result = qword_2696D1128;
  if (!qword_2696D1128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1128);
  }
  return result;
}

unint64_t sub_2498276D4()
{
  unint64_t result = qword_2696D1138;
  if (!qword_2696D1138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1130);
    sub_249827750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1138);
  }
  return result;
}

unint64_t sub_249827750()
{
  unint64_t result = qword_2696D1140;
  if (!qword_2696D1140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1140);
  }
  return result;
}

unint64_t sub_2498277A4()
{
  unint64_t result = qword_2696D1150;
  if (!qword_2696D1150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1148);
    sub_249827820();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1150);
  }
  return result;
}

unint64_t sub_249827820()
{
  unint64_t result = qword_2696D1158;
  if (!qword_2696D1158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1158);
  }
  return result;
}

unint64_t sub_249827874()
{
  unint64_t result = qword_2696D1168;
  if (!qword_2696D1168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1160);
    sub_2498278F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1168);
  }
  return result;
}

unint64_t sub_2498278F0()
{
  unint64_t result = qword_2696D1170;
  if (!qword_2696D1170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1170);
  }
  return result;
}

unint64_t sub_249827944()
{
  unint64_t result = qword_2696D1180;
  if (!qword_2696D1180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1178);
    sub_2498279C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1180);
  }
  return result;
}

unint64_t sub_2498279C0()
{
  unint64_t result = qword_2696D1188;
  if (!qword_2696D1188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1188);
  }
  return result;
}

unint64_t sub_249827A14()
{
  unint64_t result = qword_2696D1198;
  if (!qword_2696D1198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1190);
    sub_249827A90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1198);
  }
  return result;
}

unint64_t sub_249827A90()
{
  unint64_t result = qword_2696D11A0;
  if (!qword_2696D11A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11A0);
  }
  return result;
}

unint64_t sub_249827AE4()
{
  unint64_t result = qword_2696D11B0;
  if (!qword_2696D11B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D11A8);
    sub_249827B60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11B0);
  }
  return result;
}

unint64_t sub_249827B60()
{
  unint64_t result = qword_2696D11B8;
  if (!qword_2696D11B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11B8);
  }
  return result;
}

uint64_t CAUManifest.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D11C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2498270C0();
  sub_24982E858();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1060);
  char v41 = 0;
  sub_249828720();
  sub_24982E728();
  uint64_t v10 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1088);
  char v41 = 1;
  sub_249828828();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v37 = v10;
  uint64_t v11 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10B0);
  char v41 = 2;
  sub_249828930();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v12 = v11;
  uint64_t v13 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10C8);
  char v41 = 3;
  sub_249828A00();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v36 = v13;
  uint64_t v14 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D10E0);
  char v41 = 4;
  sub_249828AD0();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v40 = v14;
  uint64_t v15 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1108);
  char v41 = 5;
  sub_249828BD8();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v39 = v15;
  uint64_t v16 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1130);
  char v41 = 6;
  sub_249828D4C();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v38 = v16;
  uint64_t v17 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1148);
  char v41 = 7;
  sub_249828E1C();
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v33 = v17;
  uint64_t v18 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1160);
  char v41 = 8;
  sub_249828EEC();
  uint64_t v35 = v18;
  swift_bridgeObjectRetain();
  sub_24982E728();
  uint64_t v34 = v12;
  uint64_t v19 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1178);
  char v41 = 9;
  sub_249828FBC();
  uint64_t v32 = v19;
  swift_bridgeObjectRetain();
  v29[1] = 0;
  sub_24982E728();
  uint64_t v20 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1190);
  char v41 = 10;
  sub_24982908C();
  uint64_t v30 = v20;
  swift_bridgeObjectRetain();
  sub_24982E6E8();
  uint64_t v21 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D11A8);
  char v41 = 11;
  sub_24982915C();
  uint64_t v31 = v21;
  swift_bridgeObjectRetain();
  sub_24982E6E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v22 = v42;
  swift_bridgeObjectRetain();
  *a2 = v37;
  a2[1] = v12;
  uint64_t v23 = v35;
  uint64_t v24 = v40;
  a2[2] = v36;
  a2[3] = v24;
  uint64_t v25 = v38;
  a2[4] = v39;
  a2[5] = v25;
  uint64_t v26 = v32;
  a2[6] = v33;
  a2[7] = v23;
  uint64_t v28 = v30;
  uint64_t v27 = v31;
  a2[8] = v26;
  a2[9] = v28;
  a2[10] = v27;
  a2[11] = v22;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_249828720()
{
  unint64_t result = qword_2696D11C8;
  if (!qword_2696D11C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1060);
    sub_249828C8C(&qword_2696D11D0, &qword_2696D1078, (void (*)(void))sub_2498287D4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11C8);
  }
  return result;
}

unint64_t sub_2498287D4()
{
  unint64_t result = qword_2696D11D8;
  if (!qword_2696D11D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11D8);
  }
  return result;
}

unint64_t sub_249828828()
{
  unint64_t result = qword_2696D11E0;
  if (!qword_2696D11E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1088);
    sub_249828C8C(&qword_2696D11E8, &qword_2696D10A0, (void (*)(void))sub_2498288DC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11E0);
  }
  return result;
}

unint64_t sub_2498288DC()
{
  unint64_t result = qword_2696D11F0;
  if (!qword_2696D11F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11F0);
  }
  return result;
}

unint64_t sub_249828930()
{
  unint64_t result = qword_2696D11F8;
  if (!qword_2696D11F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10B0);
    sub_2498289AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D11F8);
  }
  return result;
}

unint64_t sub_2498289AC()
{
  unint64_t result = qword_2696D1200;
  if (!qword_2696D1200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1200);
  }
  return result;
}

unint64_t sub_249828A00()
{
  unint64_t result = qword_2696D1208;
  if (!qword_2696D1208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10C8);
    sub_249828A7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1208);
  }
  return result;
}

unint64_t sub_249828A7C()
{
  unint64_t result = qword_2696D1210;
  if (!qword_2696D1210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1210);
  }
  return result;
}

unint64_t sub_249828AD0()
{
  unint64_t result = qword_2696D1218;
  if (!qword_2696D1218)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D10E0);
    sub_249828C8C(&qword_2696D1220, &qword_2696D10F8, (void (*)(void))sub_249828B84);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1218);
  }
  return result;
}

unint64_t sub_249828B84()
{
  unint64_t result = qword_2696D1228;
  if (!qword_2696D1228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1228);
  }
  return result;
}

unint64_t sub_249828BD8()
{
  unint64_t result = qword_2696D1230;
  if (!qword_2696D1230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1108);
    sub_249828C8C(&qword_2696D1238, &qword_2696D1120, (void (*)(void))sub_249828CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1230);
  }
  return result;
}

uint64_t sub_249828C8C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_249828CF8()
{
  unint64_t result = qword_2696D1240;
  if (!qword_2696D1240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1240);
  }
  return result;
}

unint64_t sub_249828D4C()
{
  unint64_t result = qword_2696D1248;
  if (!qword_2696D1248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1130);
    sub_249828DC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1248);
  }
  return result;
}

unint64_t sub_249828DC8()
{
  unint64_t result = qword_2696D1250;
  if (!qword_2696D1250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1250);
  }
  return result;
}

unint64_t sub_249828E1C()
{
  unint64_t result = qword_2696D1258;
  if (!qword_2696D1258)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1148);
    sub_249828E98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1258);
  }
  return result;
}

unint64_t sub_249828E98()
{
  unint64_t result = qword_2696D1260;
  if (!qword_2696D1260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1260);
  }
  return result;
}

unint64_t sub_249828EEC()
{
  unint64_t result = qword_2696D1268;
  if (!qword_2696D1268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1160);
    sub_249828F68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1268);
  }
  return result;
}

unint64_t sub_249828F68()
{
  unint64_t result = qword_2696D1270;
  if (!qword_2696D1270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1270);
  }
  return result;
}

unint64_t sub_249828FBC()
{
  unint64_t result = qword_2696D1278;
  if (!qword_2696D1278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1178);
    sub_249829038();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1278);
  }
  return result;
}

unint64_t sub_249829038()
{
  unint64_t result = qword_2696D1280;
  if (!qword_2696D1280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1280);
  }
  return result;
}

unint64_t sub_24982908C()
{
  unint64_t result = qword_2696D1288;
  if (!qword_2696D1288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D1190);
    sub_249829108();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1288);
  }
  return result;
}

unint64_t sub_249829108()
{
  unint64_t result = qword_2696D1290;
  if (!qword_2696D1290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1290);
  }
  return result;
}

unint64_t sub_24982915C()
{
  unint64_t result = qword_2696D1298;
  if (!qword_2696D1298)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D11A8);
    sub_2498291D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1298);
  }
  return result;
}

unint64_t sub_2498291D8()
{
  unint64_t result = qword_2696D12A0;
  if (!qword_2696D12A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D12A0);
  }
  return result;
}

uint64_t sub_24982922C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return CAUManifest.init(from:)(a1, a2);
}

uint64_t sub_249829244(void *a1)
{
  return CAUManifest.encode(to:)(a1);
}

uint64_t destroy for CAUManifest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CAUManifest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CAUManifest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for CAUManifest(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CAUManifest(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAUManifest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUManifest()
{
  return &type metadata for CAUManifest;
}

uint64_t getEnumTagSinglePayload for CAUManifest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CAUManifest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x2498297F4);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUManifest.CodingKeys()
{
  return &type metadata for CAUManifest.CodingKeys;
}

unint64_t sub_249829830()
{
  unint64_t result = qword_2696D12A8;
  if (!qword_2696D12A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D12A8);
  }
  return result;
}

unint64_t sub_249829888()
{
  unint64_t result = qword_2696D12B0;
  if (!qword_2696D12B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D12B0);
  }
  return result;
}

unint64_t sub_2498298E0()
{
  unint64_t result = qword_2696D12B8;
  if (!qword_2696D12B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D12B8);
  }
  return result;
}

uint64_t sub_249829934(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_249829954(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_249829954(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D12C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24982E6B8();
  __break(1u);
  return result;
}

uint64_t sub_249829ADC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E69626163 && a2 == 0xE500000000000000;
  if (v3 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x496E776F44706F74 && a2 == 0xEF726F697265746ELL || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x8000000249832CA0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456E776F44706F74 && a2 == 0xEF726F6972657478 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7374616573 && a2 == 0xE500000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x73657275736F6C63 && a2 == 0xE800000000000000 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6172426F69647561 && a2 == 0xEE006F676F4C646ELL || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x4C656C6369686576 && a2 == 0xEB000000006F676FLL || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4C656C6369686576 && a2 == 0xEE007374756F7961 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000249832CC0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000249832CE0 || (sub_24982E7B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x4665727574616566 && a2 == 0xEC0000007367616CLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

void sub_249829FA4()
{
  unk_2696D12D6 = -4864;
}

uint64_t static CAUAssetLibrary.manifestFileName.getter()
{
  if (qword_2696D0930 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2696D12C8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static CAUAssetLibrary.vehicleLayoutFileName.getter()
{
  return 0xD000000000000012;
}

char *sub_24982A058(int a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v4;
  int v87 = a1;
  uint64_t v8 = sub_24982E328();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24982E398();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v91 = v12;
  uint64_t v92 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v90 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  char v94 = (char *)&v70 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v70 - v18;
  uint64_t v20 = v3;
  id v93 = a3;
  id v21 = objc_msgSend(a3, sel_url);
  sub_24982E368();

  if ((sub_24982E378() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    os_log_type_t v25 = sub_24982E578();
    if (qword_2696D0920 != -1) {
      swift_once();
    }
    sub_24981DF70(v25, (os_log_t)qword_2696D7AE0, 0xD00000000000002BLL, 0x8000000249832E40, 0xD00000000000002DLL, 0x8000000249832E70, 0xD000000000000054, 0x8000000249832D40, 19);
    sub_249824E20();
    swift_allocError();
    *(void *)(v26 + 8) = 0;
    *(void *)(v26 + 16) = 0;
    *(void *)uint64_t v26 = 0;
    *(unsigned char *)(v26 + 24) = 5;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v92 + 8))(v19, v91);
    goto LABEL_19;
  }
  uint64_t v88 = a2;
  if (qword_2696D0930 != -1) {
    swift_once();
  }
  unint64_t v96 = qword_2696D12C8;
  unint64_t v97 = unk_2696D12D0;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06E38], v8);
  sub_24982B4E4();
  swift_bridgeObjectRetain();
  sub_24982E388();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  char v22 = sub_24982E348();
  char v89 = v19;
  if (v4)
  {
    swift_bridgeObjectRelease();

    uint64_t v23 = v91;
    id v24 = v93;
LABEL_16:
    unint64_t v96 = 0;
    unint64_t v97 = 0xE000000000000000;
    sub_24982E628();
    sub_24982E4F8();
    char v108 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D12E8);
    sub_24982E658();
    uint64_t v39 = v96;
    unint64_t v38 = v97;
    os_log_type_t v40 = sub_24982E578();
    if (qword_2696D0920 != -1) {
      swift_once();
    }
    sub_24981DF70(v40, (os_log_t)qword_2696D7AE0, v39, v38, 0xD00000000000002DLL, 0x8000000249832E70, 0xD000000000000054, 0x8000000249832D40, 32);
    swift_bridgeObjectRelease();
    char v41 = v89;
    sub_24982E358();
    sub_249824E20();
    swift_allocError();
    *(void *)(v42 + 8) = 0;
    *(void *)(v42 + 16) = 0;
    *(void *)uint64_t v42 = 1;
    *(unsigned char *)(v42 + 24) = 5;
    swift_willThrow();

    uint64_t v43 = *(void (**)(char *, uint64_t))(v92 + 8);
    v43(v94, v23);
    v43(v41, v23);
LABEL_19:
    type metadata accessor for CAUAssetLibrary();
    swift_deallocPartialClassInstance();
    return v20;
  }
  uint64_t v23 = v91;
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRelease();

    os_log_type_t v36 = sub_24982E578();
    id v24 = v93;
    if (qword_2696D0920 != -1) {
      swift_once();
    }
    sub_24981DF70(v36, (os_log_t)qword_2696D7AE0, 0xD00000000000001ELL, 0x8000000249832ED0, 0xD00000000000002DLL, 0x8000000249832E70, 0xD000000000000054, 0x8000000249832D40, 27);
    sub_24982E358();
    sub_249824E20();
    uint64_t v5 = (void *)swift_allocError();
    *(void *)(v37 + 8) = 0;
    *(void *)(v37 + 16) = 0;
    *(void *)uint64_t v37 = 1;
    *(unsigned char *)(v37 + 24) = 5;
    swift_willThrow();
    goto LABEL_16;
  }
  unint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  sub_24982E628();
  swift_bridgeObjectRelease();
  unint64_t v96 = 0xD00000000000001CLL;
  unint64_t v97 = 0x8000000249832EF0;
  id v27 = objc_msgSend(v93, sel_url);
  uint64_t v28 = v90;
  sub_24982E368();

  sub_24982B538();
  sub_24982E7A8();
  sub_24982E4F8();
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v92 + 8);
  uint64_t v86 = v92 + 8;
  unsigned int v85 = v29;
  v29(v28, v23);
  uint64_t v31 = v96;
  unint64_t v30 = v97;
  os_log_type_t v32 = sub_24982E578();
  if (qword_2696D0920 != -1) {
    swift_once();
  }
  unint64_t v84 = (unint64_t)"ty scoped resource. failed.";
  unint64_t v83 = (unint64_t)"failed to decode json file ";
  sub_24981DF70(v32, (os_log_t)qword_2696D7AE0, v31, v30, 0xD00000000000002DLL, 0x8000000249832E70, 0xD000000000000054, 0x8000000249832D40, 37);
  swift_bridgeObjectRelease();
  sub_24982E2C8();
  swift_allocObject();
  sub_24982E2B8();
  uint64_t v33 = sub_24982E3A8();
  unint64_t v35 = v34;
  sub_24982B590();
  sub_24982E2A8();
  sub_249824278(v33, v35);
  swift_release();
  unint64_t v45 = v96;
  unint64_t v46 = v97;
  unint64_t v47 = v98;
  unint64_t v48 = v99;
  unint64_t v82 = v98;
  unint64_t v81 = v99;
  unint64_t v49 = v100;
  unint64_t v50 = v101;
  unint64_t v77 = v100;
  unint64_t v80 = v101;
  unint64_t v51 = v102;
  unint64_t v52 = v103;
  unint64_t v79 = v102;
  unint64_t v78 = v103;
  unint64_t v53 = v104;
  unint64_t v54 = v105;
  unint64_t v71 = v104;
  unint64_t v72 = v105;
  unint64_t v55 = v106;
  unint64_t v56 = v107;
  unint64_t v74 = v106;
  long long v57 = (unint64_t *)&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_manifest];
  *long long v57 = v96;
  v57[1] = v46;
  unint64_t v75 = v45;
  unint64_t v73 = v46;
  v57[2] = v47;
  v57[3] = v48;
  v57[4] = v49;
  v57[5] = v50;
  v57[6] = v51;
  v57[7] = v52;
  v57[8] = v53;
  v57[9] = v54;
  v57[10] = v55;
  v57[11] = v56;
  unint64_t v76 = v56;
  id v58 = v93;
  *(void *)&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_securityScopedBasePathURL] = v93;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_basePathURL], v89, v23);
  id v59 = v58;
  id v93 = v59;
  os_log_type_t v60 = sub_24982E578();
  sub_24981DF70(v60, (os_log_t)qword_2696D7AE0, 0x74736566696E616DLL, 0xEF646564616F6C20, 0xD00000000000002DLL, v84 | 0x8000000000000000, 0xD000000000000054, v83 | 0x8000000000000000, 49);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v61 = v71;
  swift_bridgeObjectRetain();
  unint64_t v62 = v72;
  swift_bridgeObjectRetain();
  unint64_t v63 = v74;
  swift_bridgeObjectRetain();
  id v64 = objc_msgSend(v59, sel_url);
  v65 = v90;
  sub_24982E368();

  long long v66 = v85;
  v85(v94, v23);
  v66(v89, v23);
  type metadata accessor for CAUAssetsResolver();
  uint64_t v67 = swift_allocObject();
  unsigned int v68 = (unint64_t *)(v67 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
  *unsigned int v68 = v75;
  v68[1] = v73;
  v68[2] = v82;
  v68[3] = v81;
  v68[4] = v77;
  v68[5] = v80;
  v68[6] = v79;
  v68[7] = v78;
  v68[8] = v61;
  v68[9] = v62;
  v68[10] = v63;
  v68[11] = v76;
  (*(void (**)(uint64_t, char *, uint64_t))(v92 + 32))(v67 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL, v65, v23);
  *(void *)(v67 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_variants) = v88;
  *(unsigned char *)(v67 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd) = v87 & 1;
  *(void *)&v20[OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_assetResolver] = v67;

  int v69 = (objc_class *)type metadata accessor for CAUAssetLibrary();
  v95.receiver = v20;
  v95.super_class = v69;
  uint64_t v20 = (char *)objc_msgSendSuper2(&v95, sel_init);

  return v20;
}

id CAUAssetLibrary.__deallocating_deinit()
{
  sub_24982E358();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAUAssetLibrary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CAUAssetLibrary()
{
  uint64_t result = qword_2696D1300;
  if (!qword_2696D1300) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24982AFB0@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int16 v3 = *a1;
  return sub_24982CB10(&v3, a2);
}

uint64_t sub_24982AFE8(_WORD *a1)
{
  uint64_t v3 = sub_24982E398();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOWORD(v8) = *a1;
  uint64_t result = sub_24982CB10((unsigned __int16 *)&v8, (uint64_t)v6);
  if (!v1)
  {
    sub_24982E2C8();
    swift_allocObject();
    sub_24982E2B8();
    sub_24982E214();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return swift_release();
  }
  return result;
}

id CAUAssetLibrary.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CAUAssetLibrary.init()()
{
}

uint64_t sub_24982B37C()
{
  return type metadata accessor for CAUAssetLibrary();
}

uint64_t sub_24982B384()
{
  uint64_t result = sub_24982E398();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CAUAssetLibrary(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CAUAssetLibrary);
}

uint64_t dispatch thunk of CAUAssetLibrary.path(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CAUAssetLibrary.asset<A>(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

unint64_t sub_24982B4E4()
{
  unint64_t result = qword_2696D1310;
  if (!qword_2696D1310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1310);
  }
  return result;
}

unint64_t sub_24982B538()
{
  unint64_t result = qword_2696D1318;
  if (!qword_2696D1318)
  {
    sub_24982E398();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1318);
  }
  return result;
}

unint64_t sub_24982B590()
{
  unint64_t result = qword_2696D1320;
  if (!qword_2696D1320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1320);
  }
  return result;
}

uint64_t sub_24982B5E4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v3 = sub_24982E398();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  int64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v13 - v8, v2 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24982E338();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v9, v3);
  size_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v7, v3);
  swift_bridgeObjectRetain();
  sub_24982E338();
  swift_bridgeObjectRelease();
  v10(v9, v3);
  v11(v9, v7, v3);
  v11(v14, v9, v3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24982B928(_WORD *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = (unsigned __int16)*a1;
  if (!(v5 >> 14))
  {
    uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
    uint64_t v16 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
    uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
    uint64_t v18 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
    uint64_t v67 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
    uint64_t v71 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
    uint64_t v19 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
    uint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
    uint64_t v21 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
    uint64_t v22 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 88);
    uint64_t v93 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
    uint64_t v94 = v14;
    uint64_t v95 = v16;
    uint64_t v96 = v15;
    uint64_t v97 = v17;
    uint64_t v98 = v18;
    uint64_t v99 = v67;
    uint64_t v100 = v71;
    uint64_t v101 = v19;
    uint64_t v102 = v20;
    uint64_t v103 = v21;
    uint64_t v104 = v22;
    unsigned __int8 v92 = v5;
    unsigned __int8 v91 = BYTE1(v5) & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_249825D04(a2, a3, &v92, &v91, v105);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v105[2]) {
      return v105[1];
    }
    else {
      return 0;
    }
  }
  if (v5 >> 14 == 1)
  {
    uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
    uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
    uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
    uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
    uint64_t v60 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
    uint64_t v63 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
    uint64_t v66 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
    uint64_t v10 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
    uint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
    uint64_t v13 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 88);
    uint64_t v93 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
    uint64_t v94 = v6;
    uint64_t v95 = v8;
    uint64_t v96 = v7;
    uint64_t v97 = v9;
    uint64_t v98 = v60;
    uint64_t v99 = v63;
    uint64_t v100 = v66;
    uint64_t v101 = v10;
    uint64_t v102 = v11;
    uint64_t v103 = v12;
    uint64_t v104 = v13;
    char v70 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd);
    unsigned __int8 v92 = v5;
    unsigned __int8 v91 = BYTE1(v5) & 0x3F;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2498259B0(a2, a3, v70, &v92, (char *)&v91, v105);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  switch(*a1)
  {
    case 0x8001:
      uint64_t v27 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
      uint64_t v28 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
      uint64_t v29 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
      uint64_t v30 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
      uint64_t v61 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
      uint64_t v64 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
      uint64_t v68 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
      uint64_t v32 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
      uint64_t v31 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
      uint64_t v33 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
      uint64_t v34 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 88);
      uint64_t v93 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
      uint64_t v94 = v27;
      uint64_t v95 = v28;
      uint64_t v96 = v29;
      uint64_t v97 = v30;
      uint64_t v98 = v61;
      uint64_t v99 = v64;
      uint64_t v100 = v68;
      uint64_t v101 = v32;
      uint64_t v102 = v31;
      uint64_t v103 = v33;
      uint64_t v104 = v34;
      char v72 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_249826680(a2, a3, v72, (uint64_t)v105);
      goto LABEL_22;
    case 0x8002:
      if (!*(void *)(*(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24) + 16)) {
        goto LABEL_42;
      }
      uint64_t v77 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_249815AD4(a2, a3);
      if (v36) {
        goto LABEL_19;
      }
      goto LABEL_41;
    case 0x8003:
      if (!*(void *)(*(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16) + 16)) {
        goto LABEL_42;
      }
      uint64_t v77 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_249815AD4(a2, a3);
      if ((v37 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_19:
      uint64_t v23 = *(void *)(*(void *)(v77 + 56) + 16 * v35);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_20;
    case 0x8004:
      uint64_t v38 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 8);
      uint64_t v39 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 16);
      uint64_t v40 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 24);
      uint64_t v41 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 32);
      uint64_t v62 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 40);
      uint64_t v65 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
      uint64_t v69 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
      uint64_t v43 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
      uint64_t v42 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
      uint64_t v44 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
      uint64_t v45 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 88);
      uint64_t v93 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest);
      uint64_t v94 = v38;
      uint64_t v95 = v39;
      uint64_t v96 = v40;
      uint64_t v97 = v41;
      uint64_t v98 = v62;
      uint64_t v99 = v65;
      uint64_t v100 = v69;
      uint64_t v101 = v43;
      uint64_t v102 = v42;
      uint64_t v103 = v44;
      uint64_t v104 = v45;
      char v73 = *(unsigned char *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_rhd);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2498267E4(a2, a3, v73, (uint64_t)v105);
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    case 0x8005:
      uint64_t v46 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 56);
      if (!*(void *)(v46 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v47 = sub_249815AD4(a2, a3);
      if (v48) {
        goto LABEL_28;
      }
      goto LABEL_41;
    case 0x8006:
      uint64_t v46 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 64);
      if (!*(void *)(v46 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v47 = sub_249815AD4(a2, a3);
      if ((v49 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_28:
      uint64_t v23 = *(void *)(*(void *)(v46 + 56) + 16 * v47);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    case 0x8007:
      uint64_t v50 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 72);
      if (!*(void *)(v50 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v51 = sub_249815AD4(a2, a3);
      if ((v52 & 1) == 0) {
        goto LABEL_41;
      }
      uint64_t v23 = *(void *)(*(void *)(v50 + 56) + 16 * v51);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_32:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 0x8008:
      uint64_t v53 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 80);
      if (!v53 || !*(void *)(v53 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v54 = sub_249815AD4(a2, a3);
      if ((v55 & 1) == 0) {
        goto LABEL_41;
      }
      uint64_t v23 = *(void *)(*(void *)(v53 + 56) + 16 * v54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 0x8009:
      uint64_t v56 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 88);
      if (!v56 || !*(void *)(v56 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v57 = sub_249815AD4(a2, a3);
      if ((v58 & 1) == 0) {
        goto LABEL_41;
      }
      uint64_t v23 = *(void *)(*(void *)(v56 + 56) + 16 * v57);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    default:
      uint64_t v24 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_manifest + 48);
      if (!*(void *)(v24 + 16)) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v25 = sub_249815AD4(a2, a3);
      if (v26)
      {
        uint64_t v23 = *(void *)(*(void *)(v24 + 56) + 16 * v25);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_41:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_42:
        uint64_t v23 = 0;
      }
      break;
  }
  return v23;
}

uint64_t sub_24982CB10@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24982E398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  unsigned int v11 = v10 >> 14;
  if (v10 == 32773 && v11 == 2)
  {
    sub_249824E20();
    swift_allocError();
    *(void *)(v14 + 16) = 0;
    *(void *)uint64_t v14 = 32773;
LABEL_19:
    *(void *)(v14 + 8) = 0;
    *(unsigned char *)(v14 + 24) = 0;
    return swift_willThrow();
  }
  v32[1] = a2;
  if (v11)
  {
    if (v11 != 1)
    {
      int v15 = 7;
      uint64_t v16 = 0xE400000000000000;
      int v13 = 4;
      uint64_t v17 = 1702060386;
      switch((int)v10)
      {
        case 32769:
        case 32772:
          break;
        case 32770:
        case 32771:
          goto LABEL_10;
        case 32773:
          int v13 = 5;
          goto LABEL_11;
        case 32774:
          int v13 = 6;
          goto LABEL_11;
        case 32775:
          goto LABEL_14;
        case 32776:
          int v15 = 8;
          goto LABEL_14;
        case 32777:
          int v15 = 9;
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    }
    int v13 = 1;
  }
  else
  {
LABEL_10:
    int v13 = 0;
  }
LABEL_11:
  uint64_t v18 = *(void *)(v3 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_variants);
  if (!*(void *)(v18 + 16) || (unint64_t v19 = sub_249815A68(v13), (v20 & 1) == 0))
  {
    uint64_t v33 = 0;
    unint64_t v34 = 0xE000000000000000;
    sub_24982E628();
    sub_24982E4F8();
    __int16 v36 = v10;
    sub_24982E658();
    sub_24982E4F8();
    uint64_t v25 = v33;
    unint64_t v24 = v34;
    os_log_type_t v26 = sub_24982E588();
    if (qword_2696D0920 != -1) {
      swift_once();
    }
    sub_24981DF70(v26, (os_log_t)qword_2696D7AE0, v25, v24, 0x726F662868746170, 0xEA0000000000293ALL, 0xD000000000000056, 0x8000000249832FA0, 71);
    swift_bridgeObjectRelease();
    sub_249824E20();
    swift_allocError();
    *(void *)(v14 + 16) = 0;
    *(void *)uint64_t v14 = v10;
    goto LABEL_19;
  }
  uint64_t v21 = (uint64_t *)(*(void *)(v18 + 56) + 16 * v19);
  uint64_t v17 = *v21;
  uint64_t v16 = v21[1];
  swift_bridgeObjectRetain();
  int v15 = v13;
LABEL_14:
  int v35 = v15;
  v32[0] = v17;
  LOWORD(v33) = v10;
  sub_24982B928(&v33, v17, v16);
  if (v22)
  {
    LOBYTE(v33) = v35;
    sub_24982B5E4(v32[0], v9);
    swift_bridgeObjectRelease();
    sub_24982E338();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  sub_24982E628();
  sub_24982E4F8();
  __int16 v36 = v10;
  sub_24982E658();
  sub_24982E4F8();
  uint64_t v27 = v32[0];
  sub_24982E4F8();
  uint64_t v29 = v33;
  unint64_t v28 = v34;
  os_log_type_t v30 = sub_24982E588();
  if (qword_2696D0920 != -1) {
    swift_once();
  }
  sub_24981DF70(v30, (os_log_t)qword_2696D7AE0, v29, v28, 0x726F662868746170, 0xEA0000000000293ALL, 0xD000000000000056, 0x8000000249832FA0, 76);
  swift_bridgeObjectRelease();
  sub_249824E20();
  swift_allocError();
  *(void *)uint64_t v31 = v10;
  *(void *)(v31 + 8) = v27;
  *(void *)(v31 + 16) = v16;
  *(unsigned char *)(v31 + 24) = 3;
  return swift_willThrow();
}

uint64_t sub_24982D044()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13CarAssetUtils17CAUAssetsResolver_basePathURL;
  uint64_t v2 = sub_24982E398();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24982D1A0()
{
  return type metadata accessor for CAUAssetsResolver();
}

uint64_t type metadata accessor for CAUAssetsResolver()
{
  uint64_t result = qword_2696D1348;
  if (!qword_2696D1348) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24982D1F4()
{
  uint64_t result = sub_24982E398();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void CAUFeatureFlag.climate.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t CAUFeatureFlag.Climate.groupedVentsLayout.getter()
{
  return *v0;
}

CarAssetUtils::CAUFeatureFlag::Climate __swiftcall CAUFeatureFlag.Climate.init(groupedVentsLayout:)(CarAssetUtils::CAUFeatureFlag::Climate groupedVentsLayout)
{
  v1->groupedVentsLayout = groupedVentsLayout.groupedVentsLayout;
  return groupedVentsLayout;
}

uint64_t CAUFeatureFlag.Climate.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1358);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24982D414();
  sub_24982E858();
  if (!v2)
  {
    char v9 = sub_24982E6D8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24982D414()
{
  unint64_t result = qword_2696D1360;
  if (!qword_2696D1360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1360);
  }
  return result;
}

unint64_t sub_24982D468()
{
  return 0xD000000000000012;
}

uint64_t sub_24982D484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24982E0EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24982D4B0(uint64_t a1)
{
  unint64_t v2 = sub_24982D414();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24982D4EC(uint64_t a1)
{
  unint64_t v2 = sub_24982D414();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUFeatureFlag.Climate.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1368);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24982D414();
  sub_24982E868();
  sub_24982E768();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24982D65C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CAUFeatureFlag.Climate.init(from:)(a1, a2);
}

uint64_t sub_24982D674(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1368);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24982D414();
  sub_24982E868();
  sub_24982E768();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

CarAssetUtils::CAUFeatureFlag __swiftcall CAUFeatureFlag.init()()
{
  unsigned char *v0 = 0;
  return result;
}

uint64_t CAUFeatureFlag.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1370);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24982D91C();
  sub_24982E858();
  if (!v2)
  {
    sub_24982D970();
    sub_24982E6E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v11 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24982D91C()
{
  unint64_t result = qword_2696D1378;
  if (!qword_2696D1378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1378);
  }
  return result;
}

unint64_t sub_24982D970()
{
  unint64_t result = qword_2696D1380;
  if (!qword_2696D1380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1380);
  }
  return result;
}

uint64_t sub_24982D9C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24982E174(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24982D9F4(uint64_t a1)
{
  unint64_t v2 = sub_24982D91C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24982DA30(uint64_t a1)
{
  unint64_t v2 = sub_24982D91C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CAUFeatureFlag.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D1388);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24982D91C();
  sub_24982E868();
  char v10 = v7;
  sub_24982DBB4();
  sub_24982E788();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24982DBB4()
{
  unint64_t result = qword_2696D1390;
  if (!qword_2696D1390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1390);
  }
  return result;
}

uint64_t sub_24982DC08@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CAUFeatureFlag.init(from:)(a1, a2);
}

uint64_t sub_24982DC20(void *a1)
{
  return CAUFeatureFlag.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for CAUFeatureFlag()
{
  return &type metadata for CAUFeatureFlag;
}

uint64_t _s13CarAssetUtils14CAUFeatureFlagV7ClimateVwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13CarAssetUtils14CAUFeatureFlagV7ClimateVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24982DDBCLL);
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

ValueMetadata *type metadata accessor for CAUFeatureFlag.Climate()
{
  return &type metadata for CAUFeatureFlag.Climate;
}

ValueMetadata *type metadata accessor for CAUFeatureFlag.CodingKeys()
{
  return &type metadata for CAUFeatureFlag.CodingKeys;
}

unsigned char *_s13CarAssetUtils14CAUFeatureFlagV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24982DEA4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAUFeatureFlag.Climate.CodingKeys()
{
  return &type metadata for CAUFeatureFlag.Climate.CodingKeys;
}

unint64_t sub_24982DEE0()
{
  unint64_t result = qword_2696D1398;
  if (!qword_2696D1398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D1398);
  }
  return result;
}

unint64_t sub_24982DF38()
{
  unint64_t result = qword_2696D13A0;
  if (!qword_2696D13A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D13A0);
  }
  return result;
}

unint64_t sub_24982DF90()
{
  unint64_t result = qword_2696D13A8;
  if (!qword_2696D13A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D13A8);
  }
  return result;
}

unint64_t sub_24982DFE8()
{
  unint64_t result = qword_2696D13B0;
  if (!qword_2696D13B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D13B0);
  }
  return result;
}

unint64_t sub_24982E040()
{
  unint64_t result = qword_2696D13B8;
  if (!qword_2696D13B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D13B8);
  }
  return result;
}

unint64_t sub_24982E098()
{
  unint64_t result = qword_2696D13C0;
  if (!qword_2696D13C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D13C0);
  }
  return result;
}

uint64_t sub_24982E0EC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000249833040)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24982E174(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6574616D696C63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24982E7B8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24982E1FC()
{
  return 0x6574616D696C63;
}

uint64_t sub_24982E214()
{
  uint64_t result = sub_24982E3A8();
  if (!v0)
  {
    uint64_t v3 = result;
    unint64_t v4 = v2;
    sub_24982E2A8();
    return sub_249824278(v3, v4);
  }
  return result;
}

uint64_t sub_24982E2A8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24982E2B8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24982E2C8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24982E2D8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24982E2E8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24982E2F8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24982E308()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_24982E318()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24982E328()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24982E338()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_24982E348()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_24982E358()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_24982E368()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24982E378()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_24982E388()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_24982E398()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24982E3A8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24982E3B8()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24982E3C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24982E3D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24982E3E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24982E3F8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24982E408()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24982E418()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24982E428()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24982E438()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24982E448()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24982E458()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24982E468()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24982E478()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24982E488()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24982E498()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24982E4A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24982E4B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24982E4C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24982E4D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24982E4E8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24982E4F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24982E508()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24982E518()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24982E528()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24982E538()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24982E548()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24982E578()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24982E588()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24982E598()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24982E5A8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24982E5B8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24982E5C8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24982E5D8()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_24982E5E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24982E5F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24982E608()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24982E618()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24982E628()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24982E638()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24982E648()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24982E658()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24982E668()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24982E678()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24982E688()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24982E698()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24982E6A8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24982E6B8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24982E6C8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24982E6D8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_24982E6E8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24982E6F8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24982E708()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24982E718()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_24982E728()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24982E738()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_24982E748()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24982E758()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24982E768()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24982E778()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_24982E788()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24982E798()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_24982E7A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24982E7B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24982E7C8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_24982E7D8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24982E7E8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24982E7F8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24982E808()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24982E818()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24982E828()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24982E838()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24982E848()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24982E858()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24982E868()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}